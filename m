Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 755A329199A
	for <lists+dri-devel@lfdr.de>; Sun, 18 Oct 2020 21:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E2489F47;
	Sun, 18 Oct 2020 19:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6C26E406
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 19:19:22 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A8A71222C8;
 Sun, 18 Oct 2020 19:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603048762;
 bh=dYed6X7UzD5I9VNgwdOoBJJfWoPJ2WkX6zDSm48Mot4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hTuFtswRm22oZHI/IKRIwI9uzBg0VM2haZvUU2RT7g8S7i3L4et2itafmGitxLxLQ
 TbjIKV3SaaMVwD/WSirnNDrI1eDEknAvvWJ4igijkmmTczG7LsAV7bIX0Q2X4d+59k
 WZRusR6b9nJFzK0OgWavwff3dFx2IKb+dpHEhkjc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 062/111] drm/panfrost: add amlogic reset quirk
 callback
Date: Sun, 18 Oct 2020 15:17:18 -0400
Message-Id: <20201018191807.4052726-62-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201018191807.4052726-1-sashal@kernel.org>
References: <20201018191807.4052726-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Neil Armstrong <narmstrong@baylibre.com>

[ Upstream commit 110003002291525bb209f47e6dbf121a63249a97 ]

The T820, G31 & G52 GPUs integrated by Amlogic in the respective GXM,
G12A/SM1 & G12B SoCs needs a quirk in the PWR registers at the GPU reset
time.

Since the Amlogic's integration of the GPU cores with the SoC is not
publicly documented we do not know what does these values, but they
permit having a fully functional GPU running with Panfrost.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
[Steven: Fix typo in commit log]
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Signed-off-by: Steven Price <steven.price@arm.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20200916150147.25753-3-narmstrong@baylibre.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c  | 11 +++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h  |  2 ++
 drivers/gpu/drm/panfrost/panfrost_regs.h |  4 ++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index f2c1ddc41a9bf..6606643850fc6 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -75,6 +75,17 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
 	return 0;
 }
 
+void panfrost_gpu_amlogic_quirk(struct panfrost_device *pfdev)
+{
+	/*
+	 * The Amlogic integrated Mali-T820, Mali-G31 & Mali-G52 needs
+	 * these undocumented bits in GPU_PWR_OVERRIDE1 to be set in order
+	 * to operate correctly.
+	 */
+	gpu_write(pfdev, GPU_PWR_KEY, GPU_PWR_KEY_UNLOCK);
+	gpu_write(pfdev, GPU_PWR_OVERRIDE1, 0xfff | (0x20 << 16));
+}
+
 static void panfrost_gpu_init_quirks(struct panfrost_device *pfdev)
 {
 	u32 quirks = 0;
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.h b/drivers/gpu/drm/panfrost/panfrost_gpu.h
index 4112412087b27..468c51e7e46db 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.h
@@ -16,4 +16,6 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev);
 void panfrost_gpu_power_on(struct panfrost_device *pfdev);
 void panfrost_gpu_power_off(struct panfrost_device *pfdev);
 
+void panfrost_gpu_amlogic_quirk(struct panfrost_device *pfdev);
+
 #endif
diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index ea38ac60581c6..eddaa62ad8b0e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -51,6 +51,10 @@
 #define GPU_STATUS			0x34
 #define   GPU_STATUS_PRFCNT_ACTIVE	BIT(2)
 #define GPU_LATEST_FLUSH_ID		0x38
+#define GPU_PWR_KEY			0x50	/* (WO) Power manager key register */
+#define  GPU_PWR_KEY_UNLOCK		0x2968A819
+#define GPU_PWR_OVERRIDE0		0x54	/* (RW) Power manager override settings */
+#define GPU_PWR_OVERRIDE1		0x58	/* (RW) Power manager override settings */
 #define GPU_FAULT_STATUS		0x3C
 #define GPU_FAULT_ADDRESS_LO		0x40
 #define GPU_FAULT_ADDRESS_HI		0x44
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
