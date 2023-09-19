Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 281E57A7522
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 10:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA5310E44F;
	Wed, 20 Sep 2023 08:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 6301 seconds by postgrey-1.36 at gabe;
 Tue, 19 Sep 2023 13:30:14 UTC
Received: from 9.mo575.mail-out.ovh.net (9.mo575.mail-out.ovh.net
 [46.105.78.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF4010E273
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 13:30:14 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.20.107])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 335A62267C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 11:10:08 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-wzkzt (unknown [10.110.171.1])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4B1CD1FD0F;
 Tue, 19 Sep 2023 11:10:08 +0000 (UTC)
Received: from RCM-web1.webmail.mail.ovh.net ([176.31.238.120])
 by ghost-submission-6684bf9d7b-wzkzt with ESMTPSA
 id gVmPCJCBCWWi9wAAm4UmiA
 (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 19 Sep 2023 11:10:08 +0000
MIME-Version: 1.0
Date: Tue, 19 Sep 2023 14:10:07 +0300
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 skhan@linuxfoundation.org
Subject: Re: [PATCH v2] drm/atomic-helper: prevent uaf in wait_for_vblanks
In-Reply-To: <20230919052617.4242-1-jose.pekkarinen@foxhound.fi>
References: <20230919052617.4242-1-jose.pekkarinen@foxhound.fi>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <52a47fc2bcd2fa26b562f989f5927e35@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 185.220.102.251
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9335962030330652326
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudekuddgtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeggfffhvfevufgjfhgfkfigohhitgfgsehtkehjtddtreejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepkefhgeduudefgedvleegtddvffeghedvtdekveekjeevvdegiedtfeelhedtiedtnecukfhppeduvdejrddtrddtrddupddukeehrddvvddtrddutddvrddvhedupddujeeirdefuddrvdefkedruddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth
X-Mailman-Approved-At: Wed, 20 Sep 2023 08:01:17 +0000
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
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-19 08:26, José Pekkarinen wrote:
> Kasan reported the following in my system:
> 
> [ 3935.321003]
> ==================================================================
> [ 3935.321022] BUG: KASAN: slab-use-after-free in
> drm_atomic_helper_wait_for_vblanks.part.0+0x116/0x450 [drm_kms_helper]
> [ 3935.321124] Read of size 1 at addr ffff88818a6f8009 by task
> kworker/u16:3/5268
> 
> [ 3935.321124] CPU: 7 PID: 5268 Comm: kworker/u16:3 Not tainted 
> 6.6.0-rc2+ #1
> [ 3935.321124] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
> BIOS 0.0.0 02/06/2015
> [ 3935.321124] Workqueue: events_unbound commit_work [drm_kms_helper]
> [ 3935.321124] Call Trace:
> [ 3935.321124]  <TASK>
> [ 3935.321124]  dump_stack_lvl+0x43/0x60
> [ 3935.321124]  print_report+0xcf/0x660
> [ 3935.321124]  ? remove_entity_load_avg+0xdc/0x100
> [ 3935.321124]  ? __virt_addr_valid+0xd9/0x160
> [ 3935.321124]  ?
> drm_atomic_helper_wait_for_vblanks.part.0+0x116/0x450 [drm_kms_helper]
> [ 3935.321124]  kasan_report+0xda/0x110
> [ 3935.321124]  ?
> drm_atomic_helper_wait_for_vblanks.part.0+0x116/0x450 [drm_kms_helper]
> [ 3935.321124]  drm_atomic_helper_wait_for_vblanks.part.0+0x116/0x450
> [drm_kms_helper]
> [ 3935.321124]  ?
> __pfx_drm_atomic_helper_wait_for_vblanks.part.0+0x10/0x10
> [drm_kms_helper]
> [ 3935.321124]  ? complete_all+0x48/0x100
> [ 3935.321124]  ? _raw_spin_unlock_irqrestore+0x19/0x40
> [ 3935.321124]  ? preempt_count_sub+0x14/0xc0
> [ 3935.321124]  ? _raw_spin_unlock_irqrestore+0x23/0x40
> [ 3935.321124]  ? drm_atomic_helper_commit_hw_done+0x1ac/0x240 
> [drm_kms_helper]
> [ 3935.321124]  drm_atomic_helper_commit_tail+0x82/0x90 
> [drm_kms_helper]
> [ 3935.321124]  commit_tail+0x15c/0x1d0 [drm_kms_helper]
> [ 3935.323185]  process_one_work+0x31a/0x610
> [ 3935.323185]  worker_thread+0x38e/0x5f0
> [ 3935.323185]  ? __pfx_worker_thread+0x10/0x10
> [ 3935.323185]  kthread+0x184/0x1c0
> [ 3935.323185]  ? __pfx_kthread+0x10/0x10
> [ 3935.323185]  ret_from_fork+0x30/0x50
> [ 3935.323185]  ? __pfx_kthread+0x10/0x10
> [ 3935.323185]  ret_from_fork_asm+0x1b/0x30
> [ 3935.323185]  </TASK>
> 
> [ 3935.323185] Allocated by task 3751:
> [ 3935.323185]  kasan_save_stack+0x2f/0x50
> [ 3935.323185]  kasan_set_track+0x21/0x30
> [ 3935.323185]  __kasan_kmalloc+0xa6/0xb0
> [ 3935.323185]  drm_atomic_helper_crtc_duplicate_state+0x42/0x70
> [drm_kms_helper]
> [ 3935.323185]  drm_atomic_get_crtc_state+0xc3/0x1e0 [drm]
> [ 3935.323185]  page_flip_common+0x42/0x160 [drm_kms_helper]
> [ 3935.323185]  drm_atomic_helper_page_flip+0x6b/0xf0 [drm_kms_helper]
> [ 3935.323185]  drm_mode_page_flip_ioctl+0x8ad/0x900 [drm]
> [ 3935.323185]  drm_ioctl_kernel+0x169/0x240 [drm]
> [ 3935.323185]  drm_ioctl+0x399/0x6b0 [drm]
> [ 3935.324772]  __x64_sys_ioctl+0xc5/0x100
> [ 3935.324772]  do_syscall_64+0x5b/0xc0
> [ 3935.324772]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> 
> [ 3935.324772] Freed by task 3751:
> [ 3935.324772]  kasan_save_stack+0x2f/0x50
> [ 3935.324772]  kasan_set_track+0x21/0x30
> [ 3935.324772]  kasan_save_free_info+0x27/0x40
> [ 3935.324772]  ____kasan_slab_free+0x166/0x1c0
> [ 3935.324772]  slab_free_freelist_hook+0x9f/0x1e0
> [ 3935.324772]  __kmem_cache_free+0x187/0x2d0
> [ 3935.324772]  drm_atomic_state_default_clear+0x226/0x5e0 [drm]
> [ 3935.324772]  __drm_atomic_state_free+0xc8/0x130 [drm]
> [ 3935.324772]  drm_atomic_helper_update_plane+0x17d/0x1b0 
> [drm_kms_helper]
> [ 3935.324772]  drm_mode_cursor_universal+0x2a4/0x4d0 [drm]
> [ 3935.324772]  drm_mode_cursor_common+0x1cf/0x430 [drm]
> [ 3935.324772]  drm_mode_cursor_ioctl+0xc6/0x100 [drm]
> [ 3935.326167]  drm_ioctl_kernel+0x169/0x240 [drm]
> [ 3935.326167]  drm_ioctl+0x399/0x6b0 [drm]
> [ 3935.326614]  __x64_sys_ioctl+0xc5/0x100
> [ 3935.326614]  do_syscall_64+0x5b/0xc0
> [ 3935.326614]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> 
> [ 3935.326614] The buggy address belongs to the object at 
> ffff88818a6f8000
>                 which belongs to the cache kmalloc-512 of size 512
> [ 3935.326614] The buggy address is located 9 bytes inside of
>                 freed 512-byte region [ffff88818a6f8000, 
> ffff88818a6f8200)
> 
> [ 3935.326614] The buggy address belongs to the physical page:
> [ 3935.326614] page:00000000b0fb0816 refcount:1 mapcount:0
> mapping:0000000000000000 index:0x0 pfn:0x18a6f8
> [ 3935.326614] head:00000000b0fb0816 order:3 entire_mapcount:0
> nr_pages_mapped:0 pincount:0
> [ 3935.326614] anon flags:
> 0x17ffffc0000840(slab|head|node=0|zone=2|lastcpupid=0x1fffff)
> [ 3935.326614] page_type: 0xffffffff()
> [ 3935.326614] raw: 0017ffffc0000840 ffff888100042c80 0000000000000000
> dead000000000001
> [ 3935.326614] raw: 0000000000000000 0000000080200020 00000001ffffffff
> 0000000000000000
> [ 3935.326614] page dumped because: kasan: bad access detected
> 
> [ 3935.326614] Memory state around the buggy address:
> [ 3935.326614]  ffff88818a6f7f00: fc fc fc fc fc fc fc fc fc fc fc fc
> fc fc fc fc
> [ 3935.326614]  ffff88818a6f7f80: fc fc fc fc fc fc fc fc fc fc fc fc
> fc fc fc fc
> [ 3935.326614] >ffff88818a6f8000: fa fb fb fb fb fb fb fb fb fb fb fb
> fb fb fb fb
> [ 3935.326772]                       ^
> [ 3935.326772]  ffff88818a6f8080: fb fb fb fb fb fb fb fb fb fb fb fb
> fb fb fb fb
> [ 3935.326772]  ffff88818a6f8100: fb fb fb fb fb fb fb fb fb fb fb fb
> fb fb fb fb
> [ 3935.326772]
> ==================================================================
> 
> This suggest there may be some situation where a
> struct drm_crtc_state is referenced after already
> being freed by drm_atomic_state_default_clear. This
> patch will check the new_crtc_state is not null before
> using it.
> 
> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
> ---
> [v1->v2] continue loop if new_crtc_state is null
> 
>  drivers/gpu/drm/drm_atomic_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c
> b/drivers/gpu/drm/drm_atomic_helper.c
> index 292e38eb6218..0f17b3b406bb 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1647,7 +1647,7 @@ drm_atomic_helper_wait_for_vblanks(struct 
> drm_device *dev,
>  		return;
> 
>  	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state,
> new_crtc_state, i) {
> -		if (!new_crtc_state->active)
> +		if (!new_crtc_state || !new_crtc_state->active)
>  			continue;
> 
>  		ret = drm_crtc_vblank_get(crtc);

     I went back to patch v1 because I managed to reproduce
the uaf with this patch, though to me it makes more sense,
perhaps someone more experienced in the drm can tell why the
first one does better.

     José.
