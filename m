Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA990AEEC46
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 04:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3230210E162;
	Tue,  1 Jul 2025 02:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="dHC3Uu2L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B093110E162
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 02:00:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1751335205; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gFB3D/to1dDdBhVl/ZKpwfA2BPn5KScazz9sVJtkkuRW8xM6NioYzvX5Ln+P8+ZyLzlHMdhFuRvUNQYPB42rDB3n8LkKSK+WxrRQklvW4HBB7mmGL4d4QPLiKRpsYz4TZiMNQlSxjQorvbnxqY/kUaJk83gUsPSE9rvSX4MhEj0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1751335205;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Rzwy82EGOReukd9dNrvDsdV0Kaxnv5kI7ekg4aJ/C4c=; 
 b=ScLuH+YECktLCrvjUlQnoE9VV6WBRePhMJCUpbjzdZ0d4jx1B7A1DRq7HUMZ4Vwqt2CiI/fq6bKWptz5JpFBCTORhacgoy5D02JjPKa3iXVUiLTTQzVJTKhsU3h90P2F2Cp+OI5aHTPhzHZj9E63P54wy5bFKJOUsC8QXPziqks=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751335204; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Rzwy82EGOReukd9dNrvDsdV0Kaxnv5kI7ekg4aJ/C4c=;
 b=dHC3Uu2LdtAdly9EM6lsswknlTs/CHIlRE/OQqtCR9VKEaqqGHsK3XP4OoPDZm8j
 oearp5oEmdp6NucKJnv5bsARps1uAX4SLoXUGLNqywBOVgHAznQ9FJAJ/W4QvXURvzt
 q+scobt3r2KmNTviShtQNaLYu6y2pK9BJwaHPCWM=
Received: by mx.zohomail.com with SMTPS id 1751335201707250.9608433199718;
 Mon, 30 Jun 2025 19:00:01 -0700 (PDT)
Message-ID: <f414f729-d485-4318-b5c9-c652ce388db0@collabora.com>
Date: Tue, 1 Jul 2025 04:59:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/2] Virtio-GPU suspend and resume
To: "Kim, Dongwon" <dongwon.kim@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
References: <20250523220015.994716-1-dongwon.kim@intel.com>
 <23e2560e-276f-42d3-a525-0c0405c8641c@collabora.com>
 <PH8PR11MB68791BB9A9F720E820C57D14FA73A@PH8PR11MB6879.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <PH8PR11MB68791BB9A9F720E820C57D14FA73A@PH8PR11MB6879.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 6/18/25 01:41, Kim, Dongwon wrote:
...
>> Have you figured out why 10ms workaround is needed?
> 
> [Kim, Dongwon] Unfortunately, I don't know why it fails without the delay. I wanted to narrow down further
> so enabled printk during suspend and resume but hang didn't occur with the timing changes
> caused by printks.  I've also tried more deterministic methods that make it wait based on some
> kinds of "status" but none of them have worked so far. If you have any suggestions on possible
> condition we can check instead of just sleeping, please let me know.
> 10ms seems to be close to minimum to make it work 100% for several days (rtcwake sleep and
> wake up every 5 sec).

Was able to reproduce the hang and got a crash backtrace with no_console_suspend:

[   63.824827] PM: suspend entry (deep)
[   63.825041] Filesystems sync: 0.000 seconds
[   63.990951] Freezing user space processes
[   63.992488] Freezing user space processes completed (elapsed 0.001 seconds)
[   63.992775] OOM killer disabled.
[   63.992902] Freezing remaining freezable tasks
[   63.994099] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[   64.002183] Oops: general protection fault, probably for non-canonical address 0x2abe0ea26847fb08: 0000 [#1] SMP NOPTI
[   64.003172] CPU: 9 UID: 0 PID: 178 Comm: kworker/9:2 Not tainted 6.15.4-00002-g01117b4373b2-dirty #123 PREEMPT(voluntary) 
[   64.003614] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
[   64.004036] Workqueue: events virtio_gpu_dequeue_ctrl_func
[   64.004280] RIP: 0010:virtqueue_get_buf_ctx_split+0x86/0x130
[   64.004515] Code: 01 66 23 43 50 0f b7 c0 8b 74 c1 04 8b 44 c1 08 41 89 45 00 3b 73 58 0f 83 96 d7 20 ff 89 f0 48 c1 e0 04 48 03 83 80 00 00 00 <4c> 8b 20 4d 85 e4 0f 84 5a d7 20 ff 48 89 df e8 46 fc ff ff 0f b7
[   64.005227] RSP: 0018:ffffc90000b53d90 EFLAGS: 00010202
[   64.005430] RAX: 2abe0ea26847fb08 RBX: ffff888102d58a00 RCX: ffff8881255314c0
[   64.005698] RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffff888102d58a00
[   64.005975] RBP: ffffc90000b53db0 R08: 8080808080808080 R09: ffff88885b470b40
[   64.006273] R10: ffff8881000508c8 R11: fefefefefefefeff R12: 0000000000000001
[   64.006907] R13: ffffc90000b53dfc R14: ffffc90000b53dfc R15: ffff8881032d0568
[   64.007205] FS:  0000000000000000(0000) GS:ffff8888d6650000(0000) knlGS:0000000000000000
[   64.007511] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   64.007732] CR2: 00007efedc4d3000 CR3: 00000001056e9000 CR4: 0000000000750ef0
[   64.008014] PKRU: 55555554
[   64.008123] Call Trace:
[   64.008223]  <TASK>
[   64.008314]  virtqueue_get_buf+0x46/0x60
[   64.008465]  virtio_gpu_dequeue_ctrl_func+0x86/0x2a0
[   64.008655]  process_one_work+0x18a/0x370
[   64.008823]  worker_thread+0x31a/0x460
[   64.008971]  ? _raw_spin_unlock_irqrestore+0x27/0x50
[   64.009176]  ? srso_alias_return_thunk+0x5/0xfbef5
[   64.009369]  ? __pfx_worker_thread+0x10/0x10
[   64.009532]  kthread+0x126/0x230
[   64.009662]  ? _raw_spin_unlock_irq+0x1f/0x40
[   64.009836]  ? __pfx_kthread+0x10/0x10
[   64.009986]  ret_from_fork+0x3a/0x60
[   64.010156]  ? __pfx_kthread+0x10/0x10
[   64.010318]  ret_from_fork_asm+0x1a/0x30
[   64.010507]  </TASK>
[   64.010616] Modules linked in:
[   64.010785] ---[ end trace 0000000000000000 ]--- 

==

The trace tells that virtio queue is active after it has been removed. This change fixes the crash, please test:

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 03ab78b44ab3..48bb21f33306 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -187,6 +187,10 @@ static int virtgpu_freeze(struct virtio_device *vdev)
        flush_work(&vgdev->ctrlq.dequeue_work);
        flush_work(&vgdev->cursorq.dequeue_work);
        flush_work(&vgdev->config_changed_work);
+       wait_event(vgdev->ctrlq.ack_queue,
+                  vgdev->ctrlq.vq->num_free == vgdev->ctrlq.vq->num_max);
+       wait_event(vgdev->cursorq.ack_queue,
+                  vgdev->cursorq.vq->num_free == vgdev->cursorq.vq->num_max);
        vdev->config->del_vqs(vdev);
 
        return 0;

-- 
Best regards,
Dmitry
