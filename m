Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6299A64F5A7
	for <lists+dri-devel@lfdr.de>; Sat, 17 Dec 2022 01:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F8110E647;
	Sat, 17 Dec 2022 00:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431A410E647
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Dec 2022 00:10:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 911DEB81E4F;
 Sat, 17 Dec 2022 00:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96200C433EF;
 Sat, 17 Dec 2022 00:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671235800;
 bh=vF23BYv+6T0tXv7MxbXYpcNuOcT2bfRsDDi4oBi3KiQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kMwcDSGaq0fzj21Mo0hBx7iKaBaP5TcKwWL/liJLLJn0Iq4MdGGJPZKkfiN/t68Px
 OEPDWIvd71B9TCKnmVCzLNKaBptpd9TopjZGB0MY8TG4Ay/2EjHqmQdyROrd09XJsr
 RpueJqmB7WkPajUaFWmRmARMqUKMhGXPbL+e/18Qx3oIr3u5poyVS6eeQlMBBMLR5e
 yOh2Ht76kN622QvCll3j9N7jnld2Oe9INQOXiX+Clo+fWHo/jTL6ZutMnfgCzJ1ova
 7XK8IAyHOdmwHaJdilLNrkLWZIt28l1BX5TOyw90BjnrV0m2Y2M+uUp6YL3JMHsLF/
 VCaCXW/viwK0g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 4/9] video: hyperv_fb: Avoid taking busy spinlock
 on panic path
Date: Fri, 16 Dec 2022 19:09:31 -0500
Message-Id: <20221217000937.41115-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217000937.41115-1-sashal@kernel.org>
References: <20221217000937.41115-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Andrea Parri <parri.andrea@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Fabio A M Martins <fabiomirmar@gmail.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michael Kelley <mikelley@microsoft.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-fbdev@vger.kernel.org,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 deller@gmx.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>

[ Upstream commit 1d044ca035dc22df0d3b39e56f2881071d9118bd ]

The Hyper-V framebuffer code registers a panic notifier in order
to try updating its fbdev if the kernel crashed. The notifier
callback is straightforward, but it calls the vmbus_sendpacket()
routine eventually, and such function takes a spinlock for the
ring buffer operations.

Panic path runs in atomic context, with local interrupts and
preemption disabled, and all secondary CPUs shutdown. That said,
taking a spinlock might cause a lockup if a secondary CPU was
disabled with such lock taken. Fix it here by checking if the
ring buffer spinlock is busy on Hyper-V framebuffer panic notifier;
if so, bail-out avoiding the potential lockup scenario.

Cc: Andrea Parri (Microsoft) <parri.andrea@gmail.com>
Cc: Dexuan Cui <decui@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Michael Kelley <mikelley@microsoft.com>
Cc: Stephen Hemminger <sthemmin@microsoft.com>
Cc: Tianyu Lan <Tianyu.Lan@microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Tested-by: Fabio A M Martins <fabiomirmar@gmail.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
Reviewed-by: Michael Kelley <mikelley@microsoft.com>
Link: https://lore.kernel.org/r/20220819221731.480795-10-gpiccoli@igalia.com
Signed-off-by: Wei Liu <wei.liu@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hv/ring_buffer.c        | 13 +++++++++++++
 drivers/video/fbdev/hyperv_fb.c |  8 +++++++-
 include/linux/hyperv.h          |  2 ++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/hv/ring_buffer.c b/drivers/hv/ring_buffer.c
index 59a4aa86d1f3..c6692fd5ab15 100644
--- a/drivers/hv/ring_buffer.c
+++ b/drivers/hv/ring_buffer.c
@@ -280,6 +280,19 @@ void hv_ringbuffer_cleanup(struct hv_ring_buffer_info *ring_info)
 	ring_info->pkt_buffer_size = 0;
 }
 
+/*
+ * Check if the ring buffer spinlock is available to take or not; used on
+ * atomic contexts, like panic path (see the Hyper-V framebuffer driver).
+ */
+
+bool hv_ringbuffer_spinlock_busy(struct vmbus_channel *channel)
+{
+	struct hv_ring_buffer_info *rinfo = &channel->outbound;
+
+	return spin_is_locked(&rinfo->ring_lock);
+}
+EXPORT_SYMBOL_GPL(hv_ringbuffer_spinlock_busy);
+
 /* Write to the ring buffer. */
 int hv_ringbuffer_write(struct vmbus_channel *channel,
 			const struct kvec *kv_list, u32 kv_count,
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 072ce07ba9e0..4ff25dfc865d 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -780,12 +780,18 @@ static void hvfb_ondemand_refresh_throttle(struct hvfb_par *par,
 static int hvfb_on_panic(struct notifier_block *nb,
 			 unsigned long e, void *p)
 {
+	struct hv_device *hdev;
 	struct hvfb_par *par;
 	struct fb_info *info;
 
 	par = container_of(nb, struct hvfb_par, hvfb_panic_nb);
-	par->synchronous_fb = true;
 	info = par->info;
+	hdev = device_to_hv_device(info->device);
+
+	if (hv_ringbuffer_spinlock_busy(hdev->channel))
+		return NOTIFY_DONE;
+
+	par->synchronous_fb = true;
 	if (par->need_docopy)
 		hvfb_docopy(par, 0, dio_fb_size);
 	synthvid_update(info, 0, 0, INT_MAX, INT_MAX);
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index 3b42264333ef..646f1da9f27e 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1341,6 +1341,8 @@ struct hv_ring_buffer_debug_info {
 int hv_ringbuffer_get_debuginfo(struct hv_ring_buffer_info *ring_info,
 				struct hv_ring_buffer_debug_info *debug_info);
 
+bool hv_ringbuffer_spinlock_busy(struct vmbus_channel *channel);
+
 /* Vmbus interface */
 #define vmbus_driver_register(driver)	\
 	__vmbus_driver_register(driver, THIS_MODULE, KBUILD_MODNAME)
-- 
2.35.1

