Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BE1BE913E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 15:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B1610EBF7;
	Fri, 17 Oct 2025 13:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="FTw4HJw4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A5910EBF7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 13:59:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760709545; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Xae0FVMbW3sMmxmGsP1octkSPzfKEgrBYJV9rDV2jtLoKitHdAMlBDl7WJPokYHFzNY7I63t6gwZN7P8Oypc5I6XCxArdUNf0qhZRvhRchHcgfAHNRPti8D3sFjUdNRyhpT/t62bhQMz+fmpAFhaND89BpPc/WeFvQmtZ/250fI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760709545;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=2Aw0643bwnpFCNzA2uGjynq5F3Y1ouAnEMF+y3C+3ak=; 
 b=kiHl969JnRyuwBfK8LgS/s/wAX2bxxWZ8Bw2A2lUW94SLZL65brcmaFZQwIo1xYbjFdWSTHMwQ2fQjIJutQxI4b7RhF4CN37Yf23S9cSUR5CdHct6NIrANwe5iW5Oa/GHHZkvXaaespBtQimpmg1YcC8FL+SrYNr7KFLrZk4Qbs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760709545; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=2Aw0643bwnpFCNzA2uGjynq5F3Y1ouAnEMF+y3C+3ak=;
 b=FTw4HJw4KdWdWOsWJxVQHN43OdAPBSeKv6icjqw1zj4Wkr8fA/iGh0uUHKRFSwy0
 5AUE/mSN3a4EBQhykPjsaBWebRRvdnEdXenz5g/cyKlorlVyGDwhNobPv/B8eQ3Depg
 sthA0lRc1IsFy++i7IowiZ2fdaXCLHrco3Ci5tXc=
Received: by mx.zohomail.com with SMTPS id 1760709542786408.15819526386144;
 Fri, 17 Oct 2025 06:59:02 -0700 (PDT)
Message-ID: <afc6ba14-cd95-49b9-89f5-e90fd19c8927@collabora.com>
Date: Fri, 17 Oct 2025 16:58:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the host
 resource
To: Thomas Zimmermann <tzimmermann@suse.de>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>
References: <20251016145230.79270-1-tzimmermann@suse.de>
 <IA0PR11MB7185A7BA7B8CEAC46CBC0922F8F6A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <21851b98-06ee-4e2c-8570-70e8a4fe5d86@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <21851b98-06ee-4e2c-8570-70e8a4fe5d86@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Hi,

On 10/17/25 10:38, Thomas Zimmermann wrote:
...
> There's little difference between the current event handling and the one
> where no vblanks have been set up. I suspect that the vblank timer
> callback interferes with the locking in atomic_flush. That would also
> explain why the fps drop at no clear pattern.
> 
> Could you please test the attached patch? It enables/disables the vblank
> timer depending on the buffer resources; as you suggested before.  Does
> this make a difference?

The attached patch doesn't work, please see the trace below.

@Vivek Please clarify whether you only see frames drop with your
multi-gpu guest-blob setup or with a usual virgl too. I haven't noticed
problem with frames pacing for virgl and nctx modes yesterday, will
check again.

[   11.456513] ------------[ cut here ]------------
[   11.460050] driver forgot to call drm_crtc_vblank_off()
[   11.461253] WARNING: CPU: 12 PID: 445 at
drivers/gpu/drm/drm_atomic_helper.c:1279
drm_atomic_helper_commit_modeset_disables+0x6c6/0x6d0
[   11.461824] Modules linked in:
[   11.461989] CPU: 12 UID: 0 PID: 445 Comm: Xorg Not tainted
6.17.0-rc6-01184-ga95b3b198869 #174 PREEMPT(voluntary)
[   11.462638] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
rel-1.17.0-0-gb52ca86e094d-prebuilt.qemu.org 04/01/2014
[   11.463214] RIP:
0010:drm_atomic_helper_commit_modeset_disables+0x6c6/0x6d0
[   11.463574] Code: 32 53 02 01 e8 4b d1 33 ff 0f 0b 48 8b 43 08 e9 ae
fb ff ff 48 c7 c7 30 9f c7 83 89 45 c8 c6 05 e8 31 53 02 01 e8 2a d1 33
ff <0f> 0b 8b 45 c8 eb 9c 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90
[   11.464613] RSP: 0018:ffffc90001007960 EFLAGS: 00010286
[   11.464906] RAX: 0000000000000000 RBX: ffff88810b24ff80 RCX:
0000000000000000
[   11.465301] RDX: 0000000000000002 RSI: 0000000000000001 RDI:
00000000ffffffff
[   11.465706] RBP: ffffc900010079a8 R08: 0000000000000000 R09:
ffffc90001007790
[   11.466104] R10: 0000000000000001 R11: 6620726576697264 R12:
0000000000000000
[   11.466495] R13: ffff888103920040 R14: 0000000000000000 R15:
0000000000000000
[   11.467043] FS:  00007f8d2868dec0(0000) GS:ffff8888d66f7000(0000)
knlGS:0000000000000000
[   11.467415] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   11.467688] CR2: 00007f8d285b1000 CR3: 000000010109a000 CR4:
0000000000750ef0
[   11.468023] PKRU: 55555554
[   11.468165] Call Trace:
[   11.468286]  <TASK>
[   11.468405]  drm_atomic_helper_commit_tail+0x1e/0x70
[   11.468635]  commit_tail+0x112/0x180
[   11.468798]  ? srso_alias_return_thunk+0x5/0xfbef5
[   11.469027]  drm_atomic_helper_commit+0x126/0x150
[   11.469244]  drm_atomic_commit+0xaa/0xe0
[   11.469432]  ? __pfx___drm_printfn_info+0x10/0x10
[   11.469651]  drm_atomic_helper_dirtyfb+0x1eb/0x2f0
[   11.469873]  drm_mode_dirtyfb_ioctl+0xfd/0x1c0
[   11.470078]  ? __pfx_drm_mode_dirtyfb_ioctl+0x10/0x10
[   11.470318]  drm_ioctl_kernel+0xa3/0x100
[   11.470497]  ? srso_alias_return_thunk+0x5/0xfbef5
[   11.470719]  drm_ioctl+0x2be/0x570
[   11.470877]  ? __pfx_drm_mode_dirtyfb_ioctl+0x10/0x10
[   11.471105]  ? do_syscall_64+0x1e7/0x1f0
[   11.471302]  ? srso_alias_return_thunk+0x5/0xfbef5
[   11.471529]  ? __mark_inode_dirty+0xc5/0x340
[   11.471735]  ? srso_alias_return_thunk+0x5/0xfbef5
[   11.471968]  ? srso_alias_return_thunk+0x5/0xfbef5
[   11.472199]  __x64_sys_ioctl+0x9a/0xf0
[   11.472377]  x64_sys_call+0x1009/0x1d80
[   11.472565]  do_syscall_64+0x6e/0x1f0
[   11.472731]  ? srso_alias_return_thunk+0x5/0xfbef5
[   11.472946]  ? __handle_mm_fault+0x92d/0xfa0
[   11.473157]  ? srso_alias_return_thunk+0x5/0xfbef5
[   11.473381]  ? debug_smp_processor_id+0x17/0x20
[   11.473596]  ? srso_alias_return_thunk+0x5/0xfbef5
[   11.473813]  ? count_memcg_events+0x93/0x230
[   11.474014]  ? srso_alias_return_thunk+0x5/0xfbef5
[   11.474242]  ? debug_smp_processor_id+0x17/0x20
[   11.474446]  ? srso_alias_return_thunk+0x5/0xfbef5
[   11.474669]  ? srso_alias_return_thunk+0x5/0xfbef5
[   11.474885]  ? irqentry_exit_to_user_mode+0x18c/0x190
[   11.475111]  ? srso_alias_return_thunk+0x5/0xfbef5
[   11.475338]  ? irqentry_exit+0x3b/0x50
[   11.475515]  ? srso_alias_return_thunk+0x5/0xfbef5
[   11.475730]  ? exc_page_fault+0x86/0x180
[   11.475918]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   11.476130] RIP: 0033:0x7f8d2891674d


-- 
Best regards,
Dmitry
