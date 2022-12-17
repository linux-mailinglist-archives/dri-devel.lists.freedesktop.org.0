Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F2364F5A9
	for <lists+dri-devel@lfdr.de>; Sat, 17 Dec 2022 01:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAABE10E64C;
	Sat, 17 Dec 2022 00:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED44210E64C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Dec 2022 00:10:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9A72AB81E52;
 Sat, 17 Dec 2022 00:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE7DC433F0;
 Sat, 17 Dec 2022 00:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671235852;
 bh=9wzit2czp4q0kk7ehQih16rg/n48uJUbQUJo13fvDVI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PTo4ZOtaxWraoPsRLot2gb2WMStZbEWEfkdqG6KX4g/4tX1O8nutdvkbfjh+C6A44
 VvRZG+/XIbegftS6EH3pw27DMx49sLPAhDKIHPpR+dg5MGykZlPflp8HJuQuqNO7Gt
 AE0Vj0n5HdoPbLAPjmREP6n6YqUz4VmE4sdjGcELX5Olxmlay9TIPH3aL8iMKQHpep
 apPwhaaso1H5Wgy720i8Vw84sYSqgT75fjoLEyT4ibK1O4k0v1n8gCWqTNBzTWVTI6
 TlHHDgvp0E1B6b2rqzbv3EJCZswnp8Mt0/G651KRaywL7Hmau3xszTyH7Z/1Q8Vg9B
 aRoVlimapv5PA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 3/5] video: hyperv_fb: Avoid taking busy spinlock
 on panic path
Date: Fri, 16 Dec 2022 19:10:36 -0500
Message-Id: <20221217001038.41355-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001038.41355-1-sashal@kernel.org>
References: <20221217001038.41355-1-sashal@kernel.org>
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
index f4091143213b..1475ea77351e 100644
--- a/drivers/hv/ring_buffer.c
+++ b/drivers/hv/ring_buffer.c
@@ -249,6 +249,19 @@ void hv_ringbuffer_cleanup(struct hv_ring_buffer_info *ring_info)
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
index 58c304a3b7c4..de865e197c8d 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -799,12 +799,18 @@ static void hvfb_ondemand_refresh_throttle(struct hvfb_par *par,
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
index ddc8713ce57b..8499fc9220e0 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1307,6 +1307,8 @@ struct hv_ring_buffer_debug_info {
 int hv_ringbuffer_get_debuginfo(struct hv_ring_buffer_info *ring_info,
 				struct hv_ring_buffer_debug_info *debug_info);
 
+bool hv_ringbuffer_spinlock_busy(struct vmbus_channel *channel);
+
 /* Vmbus interface */
 #define vmbus_driver_register(driver)	\
 	__vmbus_driver_register(driver, THIS_MODULE, KBUILD_MODNAME)
-- 
2.35.1

