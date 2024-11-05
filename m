Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 792569BC9B5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 10:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFFF10E07A;
	Tue,  5 Nov 2024 09:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D479D10E07A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 09:56:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1915C1063
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 01:57:18 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 129633F66E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 01:56:47 -0800 (PST)
Date: Tue, 5 Nov 2024 09:56:44 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Jann Horn <jannh@google.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Be stricter about IO mapping flags
Message-ID: <Zynr3DIY8u2c7wrB@e110455-lin.cambridge.arm.com>
References: <20241105-panthor-flush-page-fixes-v1-1-829aaf37db93@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241105-panthor-flush-page-fixes-v1-1-829aaf37db93@google.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 05, 2024 at 12:17:13AM +0100, Jann Horn wrote:
> The current panthor_device_mmap_io() implementation has two issues:
> 
> 1. For mapping DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET,
>    panthor_device_mmap_io() bails if VM_WRITE is set, but does not clear
>    VM_MAYWRITE. That means userspace can use mprotect() to make the mapping
>    writable later on. This is a classic Linux driver gotcha.
>    I don't think this actually has any impact in practice:
>    When the GPU is powered, writes to the FLUSH_ID seem to be ignored; and
>    when the GPU is not powered, the dummy_latest_flush page provided by the
>    driver is deliberately designed to not do any flushes, so the only thing
>    writing to the dummy_latest_flush could achieve would be to make *more*
>    flushes happen.
> 
> 2. panthor_device_mmap_io() does not block MAP_PRIVATE mappings (which are
>    mappings without the VM_SHARED flag).
>    MAP_PRIVATE in combination with VM_MAYWRITE indicates that the VMA has
>    copy-on-write semantics, which for VM_PFNMAP are semi-supported but
>    fairly cursed.
>    In particular, in such a mapping, the driver can only install PTEs
>    during mmap() by calling remap_pfn_range() (because remap_pfn_range()
>    wants to **store the physical address of the mapped physical memory into
>    the vm_pgoff of the VMA**); installing PTEs later on with a fault
>    handler (as panthor does) is not supported in private mappings, and so
>    if you try to fault in such a mapping, vmf_insert_pfn_prot() splats when
>    it hits a BUG() check.
> 
> Fix it by clearing the VM_MAYWRITE flag (userspace writing to the FLUSH_ID
> doesn't make sense) and requiring VM_SHARED (copy-on-write semantics for
> the FLUSH_ID don't make sense).
> 
> Reproducers for both scenarios are in the notes of my patch on the mailing
> list; I tested that these bugs exist on a Rock 5B machine.
> 
> Note that I only compile-tested the patch, I haven't tested it; I don't
> have a working kernel build setup for the test machine yet. Please test it
> before applying it.
> 
> Cc: stable@vger.kernel.org
> Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
> First testcase (can write to the FLUSH_ID):
> 
> ```
>

There is a missing line here, I guess is something like

#define SYSCHK(x) ({  \


Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu


>   typeof(x) __res = (x);      \
>   if (__res == (typeof(x))-1) \
>     err(1, "SYSCHK(" #x ")"); \
>   __res;                      \
> })
> 
> int main(void) {
>   int fd = SYSCHK(open(GPU_PATH, O_RDWR));
> 
>   // sanity-check that PROT_WRITE+MAP_SHARED fails
>   void *mmap_write_res = mmap(NULL, 0x1000, PROT_READ|PROT_WRITE,
>       MAP_SHARED, fd, DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET);
>   if (mmap_write_res == MAP_FAILED) {
>     perror("mmap() with PROT_WRITE+MAP_SHARED failed as expected");
>   } else {
>     errx(1, "mmap() with PROT_WRITE+MAP_SHARED worked???");
>   }
> 
>   // make a PROT_READ+MAP_SHARED mapping, and upgrade it to writable
>   void *mmio_page = SYSCHK(mmap(NULL, 0x1000, PROT_READ, MAP_SHARED,
>       fd, DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET));
>   SYSCHK(mprotect(mmio_page, 0x1000, PROT_READ|PROT_WRITE));
> 
>   volatile uint32_t *flush_counter = (volatile uint32_t*)mmio_page;
> 
>   uint32_t last_old = -1;
>   while (1) {
>     uint32_t old_val = *flush_counter;
>     *flush_counter = 1111;
>     uint32_t new_val = *flush_counter;
>     if (old_val != last_old)
>       printf("flush counter: old=%u, new=%u\n", old_val, new_val);
>     last_old = old_val;
>   }
> }
> ```
> 
> Second testcase (triggers BUG() splat):
> ```
> 
>   typeof(x) __res = (x);      \
>   if (__res == (typeof(x))-1) \
>     err(1, "SYSCHK(" #x ")"); \
>   __res;                      \
> })
> 
> int main(void) {
>   int fd = SYSCHK(open(GPU_PATH, O_RDWR));
> 
>   // make a PROT_READ+**MAP_PRIVATE** mapping
>   void *ptr = SYSCHK(mmap(NULL, 0x1000, PROT_READ, MAP_PRIVATE,
>       fd, DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET));
> 
>   // trigger a read fault
>   *(volatile char *)ptr;
> }
> ```
> 
> The second testcase splats like this:
> ```
> [ 2918.411814] ------------[ cut here ]------------
> [ 2918.411857] kernel BUG at mm/memory.c:2220!
> [ 2918.411955] Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
> [...]
> [ 2918.416147] CPU: 3 PID: 2934 Comm: private_user_fl Tainted: G           O       6.1.43-19-rk2312 #428a0a5e6
> [ 2918.417043] Hardware name: Radxa ROCK 5B (DT)
> [ 2918.417464] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [ 2918.418119] pc : vmf_insert_pfn_prot+0x40/0xe4
> [ 2918.418567] lr : panthor_mmio_vm_fault+0xb0/0x12c [panthor]
> [...]
> [ 2918.425746] Call trace:
> [ 2918.425972]  vmf_insert_pfn_prot+0x40/0xe4
> [ 2918.426342]  __do_fault+0x38/0x7c
> [ 2918.426648]  __handle_mm_fault+0x404/0x6dc
> [ 2918.427018]  handle_mm_fault+0x13c/0x18c
> [ 2918.427374]  do_page_fault+0x194/0x33c
> [ 2918.427716]  do_translation_fault+0x60/0x7c
> [ 2918.428095]  do_mem_abort+0x44/0x90
> [ 2918.428410]  el0_da+0x40/0x68
> [ 2918.428685]  el0t_64_sync_handler+0x9c/0xf8
> [ 2918.429067]  el0t_64_sync+0x174/0x178
> ```
> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 4082c8f2951dfdace7f73a24d6fe34e9e7f920eb..6fbff516c1c1f047fcb4dee17b87d8263616dc0c 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -390,11 +390,15 @@ int panthor_device_mmap_io(struct panthor_device *ptdev, struct vm_area_struct *
>  {
>  	u64 offset = (u64)vma->vm_pgoff << PAGE_SHIFT;
>  
> +	if ((vma->vm_flags & VM_SHARED) == 0)
> +		return -EINVAL;
> +
>  	switch (offset) {
>  	case DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET:
>  		if (vma->vm_end - vma->vm_start != PAGE_SIZE ||
>  		    (vma->vm_flags & (VM_WRITE | VM_EXEC)))
>  			return -EINVAL;
> +		vm_flags_clear(vma, VM_MAYWRITE);
>  
>  		break;
>  
> 
> ---
> base-commit: d78f0ee0406803cda8801fd5201746ccf89e5e4a
> change-id: 20241104-panthor-flush-page-fixes-fe4202bb18c0
> 
> -- 
> Jann Horn <jannh@google.com>
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
