Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4CCA40A9C
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 18:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC73910E0E6;
	Sat, 22 Feb 2025 17:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="gbpTAgpl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7C4CD10E0E6
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 17:27:15 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1127)
 id 1C48E205918F; Sat, 22 Feb 2025 09:27:15 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1C48E205918F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1740245235;
 bh=n+fyGzv1lAnZcM4eqUWtPQLqz5c36fi+KNP0fB+Xn1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gbpTAgplvskw1984CnV9jLD9Y2NKhBU2lDiNZA1ca+cnKAYIRELXkMw5xePC2/y4Q
 9lnDqr3uVwSQc/GS8tikncFnRvd3gev832HvjHU5eNkazYqprYTjREc75R4GO5aKtC
 0aMgiunNm8kNw9QTkGEdnAaUmkPuRWIx+I65bGi4=
Date: Sat, 22 Feb 2025 09:27:15 -0800
From: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
To: Michael Kelley <mhklinux@outlook.com>
Cc: "kys@microsoft.com" <kys@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "deller@gmx.de" <deller@gmx.de>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ssengar@microsoft.com" <ssengar@microsoft.com>
Subject: Re: [PATCH] fbdev: hyperv_fb: Allow graceful removal of framebuffer
Message-ID: <20250222172715.GA28061@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1739611240-9512-1-git-send-email-ssengar@linux.microsoft.com>
 <SN6PR02MB4157813782C1D9E6D1225582D4C52@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SN6PR02MB4157813782C1D9E6D1225582D4C52@SN6PR02MB4157.namprd02.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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

On Wed, Feb 19, 2025 at 05:22:36AM +0000, Michael Kelley wrote:
> From: Saurabh Sengar <ssengar@linux.microsoft.com> Sent: Saturday, February 15, 2025 1:21 AM
> > 
> > When a Hyper-V framebuffer device is unbind, hyperv_fb driver tries to
> > release the framebuffer forcefully. If this framebuffer is in use it
> > produce the following WARN and hence this framebuffer is never released.
> > 
> > [   44.111220] WARNING: CPU: 35 PID: 1882 at drivers/video/fbdev/core/fb_info.c:70 framebuffer_release+0x2c/0x40
> > < snip >
> > [   44.111289] Call Trace:
> > [   44.111290]  <TASK>
> > [   44.111291]  ? show_regs+0x6c/0x80
> > [   44.111295]  ? __warn+0x8d/0x150
> > [   44.111298]  ? framebuffer_release+0x2c/0x40
> > [   44.111300]  ? report_bug+0x182/0x1b0
> > [   44.111303]  ? handle_bug+0x6e/0xb0
> > [   44.111306]  ? exc_invalid_op+0x18/0x80
> > [   44.111308]  ? asm_exc_invalid_op+0x1b/0x20
> > [   44.111311]  ? framebuffer_release+0x2c/0x40
> > [   44.111313]  ? hvfb_remove+0x86/0xa0 [hyperv_fb]
> > [   44.111315]  vmbus_remove+0x24/0x40 [hv_vmbus]
> > [   44.111323]  device_remove+0x40/0x80
> > [   44.111325]  device_release_driver_internal+0x20b/0x270
> > [   44.111327]  ? bus_find_device+0xb3/0xf0
> > 
> > Fix this by moving the release of framebuffer to fb_ops.fb_destroy function
> > so that framebuffer framework handles it gracefully
> 
> These changes look good for solving the specific problem where
> the reference count WARN is produced. But there is another
> problem of the same type that happens when doing unbind
> of a hyperv_fb device that is in use (i.e., /dev/fb0 is open and
> mmap'ed by some user space program).
> 
> For this additional problem, there are three sub-cases,
> depending on what memory gets mmap'ed into user space.
> Two of the three sub-cases have a problem.
> 
> 1) When Hyper-V FB uses deferred I/O, the vmalloc dio memory
> is what get mapped into user space. When hyperv_fb is unbound,
> the vmalloc dio memory is freed. But the memory doesn't actually
> get freed if it is still mmap'ed into user space. The deferred I/O
> mechanism is stopped, but user space can keep writing to the
> memory even though the pixels don't get copied to the actual
> framebuffer any longer.  When the user space program terminates
> (or unmaps the memory), the memory will be freed. So this case
> is OK, though perhaps a bit dubious.
> 
> 2) When Hyper-V FB is in a Gen 1 VM, and the frame buffer size
> is <= 4 MiB, a normal kernel allocation is used for the
> memory that is mmap'ed to user space. If this memory
> is freed when hyperv_fb is unbound, bad things happen
> because the memory is still being written to via the user space
> mmap. There are multiple "BUG: Bad page state in process
> bash  pfn:106c65" errors followed by stack traces.
> 
> 3) Similarly in a Gen 1 VM, if the frame buffer size is > 4 MiB,
> CMA memory is allocated (assuming it is available). This CMA
> memory gets mapped into user space. When hyperv_fb is
> unbound, that memory is freed. But CMA complains that the
> ref count on the pages is not zero. Here's the dmesg output:
> 
> [  191.629780] ------------[ cut here ]------------
> [  191.629784] 200 pages are still in use!
> [  191.629789] WARNING: CPU: 3 PID: 1115 at mm/page_alloc.c:6757 free_contig_range+0x15e/0x170
> 
> Stack trace is: 
> 
> [  191.629847]  ? __warn+0x97/0x160
> [  191.629849]  ? free_contig_range+0x15e/0x170
> [  191.629849]  ? report_bug+0x1bb/0x1d0
> [  191.629851]  ? console_unlock+0xdd/0x1e0
> [  191.629854]  ? handle_bug+0x60/0xa0
> [  191.629857]  ? exc_invalid_op+0x1d/0x80
> [  191.629859]  ? asm_exc_invalid_op+0x1f/0x30
> [  191.629862]  ? free_contig_range+0x15e/0x170
> [  191.629862]  ? free_contig_range+0x15e/0x170
> [  191.629863]  cma_release+0xc6/0x150
> [  191.629865]  dma_free_contiguous+0x34/0x70
> [  191.629868]  dma_direct_free+0xd3/0x130
> [  191.629869]  dma_free_attrs+0x6b/0x130
> [  191.629872]  hvfb_putmem.isra.0+0x99/0xd0 [hyperv_fb]
> [  191.629874]  hvfb_remove+0x75/0x80 [hyperv_fb]
> [  191.629876]  vmbus_remove+0x28/0x40 [hv_vmbus]
> [  191.629883]  device_remove+0x43/0x70
> [  191.629886]  device_release_driver_internal+0xbd/0x140
> [  191.629888]  device_driver_detach+0x18/0x20
> [  191.629890]  unbind_store+0x8f/0xa0
> [  191.629891]  drv_attr_store+0x25/0x40
> [  191.629892]  sysfs_kf_write+0x3f/0x50
> [  191.629894]  kernfs_fop_write_iter+0x142/0x1d0
> [  191.629896]  vfs_write+0x31b/0x450
> [  191.629898]  ksys_write+0x6e/0xe0
> [  191.629899]  __x64_sys_write+0x1e/0x30
> [  191.629900]  x64_sys_call+0x16bf/0x2150
> [  191.629903]  do_syscall_64+0x4e/0x110
> [  191.629904]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> For all three cases, I think the memory freeing and iounmap() operations
> can be moved to the new hvfb_destroy() function so that the memory
> is cleaned up only when there aren't any users. While these additional
> changes could be done as a separate patch, it seems to me like they are all
> part of the same underlying issue as the reference count problem, and
> could be combined into this patch.
> 
> Michael 
>

Thanks for your review.  

I had considered moving the entire `hvfb_putmem()` function to `destroy`,
but I was hesitant for two reasons:  

  1. I wasn’t aware of any scenario where this would be useful. However,
     your explanation has convinced me that it is necessary.  
  2. `hvfb_release_phymem()` relies on the `hdev` pointer, which requires
     multiple `container_of` operations to derive it from the `info` pointer.
     I was unsure if the complexity was justified, but it seems worthwhile now.  

I will move `hvfb_putmem()` to the `destroy` function in V2, and I hope this
will address all the cases you mentioned.

- Saurabh

<snip>
