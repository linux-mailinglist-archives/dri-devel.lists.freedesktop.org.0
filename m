Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5C2623DE1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 09:49:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B56410E697;
	Thu, 10 Nov 2022 08:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4A210E5E0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 14:31:17 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 6A31BC2CD7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 14:20:12 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id B5EE6FF80D;
 Wed,  9 Nov 2022 14:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1668003609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=htGRYXVJHCm+VjabaduYJWZ2LBkEOdCNwzZfPxcpLAk=;
 b=dIFQPstrZBE9F39CDeMweJNRNdwH9ovs1sNOXltT4zqaZEY7cfZc6BySALsx3umUd4nfrQ
 JjowYHiwMbJb3gR8NkfOQQ/jrjo5Ch0thJyUXxc3bPJ1HFCeGMpICQYXjQJvTa9ZC9CdOn
 rWu5Fg0xArIN52xsjhbDh+lnQe+5+wfuBoGP2TkMruFyOma6t9om7bvBqQJQVL/3cWFJhY
 uqvc97cyA2x8dSH3snjEb/v2+kj/3Nc96Hvl7AELJ1rLHvPrqPxBlicYyg9ISwT52S9xMV
 XgkKsV+iO0g+VAmVHlXxPoaLvGdX41eYHY3gaKDHZ6gvNEqOIxplqHPF76Mzew==
From: luca.ceresoli@bootlin.com
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH 19/23] staging: media: tegra-video: add syncpts for Tegra20 to
 struct tegra_vi
Date: Wed,  9 Nov 2022 15:18:48 +0100
Message-Id: <20221109141852.729246-20-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 10 Nov 2022 08:47:30 +0000
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
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

In preparation to implement Tegra20 parallel video capture, add variables
to hold the required syncpt.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/staging/media/tegra-video/vi.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index 8fadca33bcc9..ba563cd17296 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -117,11 +117,13 @@ struct tegra_vi {
  * @vi: Tegra video input device structure
  * @frame_start_sp: host1x syncpoint pointer to synchronize programmed capture
  *		start condition with hardware frame start events through host1x
- *		syncpoint counters.
+ *		syncpoint counters. (Tegra210)
  * @mw_ack_sp: host1x syncpoint pointer to synchronize programmed memory write
  *		ack trigger condition with hardware memory write done at end of
- *		frame through host1x syncpoint counters.
+ *		frame through host1x syncpoint counters. (Tegra210)
  * @sp_incr_lock: protects cpu syncpoint increment.
+ * @out_sp: host1x syncpoint pointer for frame sync (Tegra20)
+ * @next_out_sp_idx: next expected value for @out_sp (Tegra20)
  *
  * @kthread_start_capture: kthread to start capture of single frame when
  *		vb buffer is available. This thread programs VI CSI hardware
@@ -173,6 +175,8 @@ struct tegra_vi_channel {
 	struct host1x_syncpt *mw_ack_sp[GANG_PORTS_MAX];
 	/* protects the cpu syncpoint increment */
 	spinlock_t sp_incr_lock[GANG_PORTS_MAX];
+	struct host1x_syncpt *out_sp;
+	u32 next_out_sp_idx;
 
 	struct task_struct *kthread_start_capture;
 	wait_queue_head_t start_wait;
-- 
2.34.1

