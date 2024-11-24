Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 970EC9D70D7
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD2910E4FF;
	Sun, 24 Nov 2024 13:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RwyGO83D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7693610E4FF
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 13:41:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4A8575C04E5;
 Sun, 24 Nov 2024 13:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59977C4CED9;
 Sun, 24 Nov 2024 13:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455673;
 bh=yxb5R9btdU3CSmAv52EKtnc2EaHjs+udF4Mv8+W8DC0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RwyGO83DQUyIdJCv5HPKsNSEdMwf36mL9XckJRaRvcIOrLqFKI5Uv8PvjSR1cM6Eo
 /6u9i2sX3m+6Q/ecEYL+fEpZwVBGMY8PaBLGizs/7bAqestPEirSVI8nqs688It+Pi
 /0RRvA9F8HcdxUEjHgNPQU3xaIGexXCl1i5Jz2nnTaIKPlD1b8tZ1WFOhF101ttSdu
 rqvq19wLX7MGP5qneXjUgRce8u0hMAWAgbvPZKjlLHVyuiC5duzmloZufiHOCR0bkN
 QqfDmGTMJOCRCkp2RAKCz6iQ8VDs1SthRvXc4cuCWbk8Y/j2Bf8785LudsFEa1+Rax
 EyugtYxuvl8Tg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dom Cobley <popcornmix@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sasha Levin <sashal@kernel.org>, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 05/87] drm/vc4: hdmi: Increase audio MAI fifo
 dreq threshold
Date: Sun, 24 Nov 2024 08:37:43 -0500
Message-ID: <20241124134102.3344326-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124134102.3344326-1-sashal@kernel.org>
References: <20241124134102.3344326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

[ Upstream commit 59f8b2b7fb8e460881d21c7d5b32604993973879 ]

Now we wait for write responses and have a burst
size of 4, we can set the fifo threshold much higher.

Set it to 28 (of the 32 entry size) to keep fifo
fuller and reduce chance of underflow.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20240621152055.4180873-8-dave.stevenson@raspberrypi.com
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5cb7ddec99a1f..0f0a58f814e9c 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2047,6 +2047,7 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	unsigned int sample_rate = params->sample_rate;
 	unsigned int channels = params->channels;
 	unsigned long flags;
@@ -2104,11 +2105,18 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 					     VC4_HDMI_AUDIO_PACKET_CEA_MASK);
 
 	/* Set the MAI threshold */
-	HDMI_WRITE(HDMI_MAI_THR,
-		   VC4_SET_FIELD(0x08, VC4_HD_MAI_THR_PANICHIGH) |
-		   VC4_SET_FIELD(0x08, VC4_HD_MAI_THR_PANICLOW) |
-		   VC4_SET_FIELD(0x06, VC4_HD_MAI_THR_DREQHIGH) |
-		   VC4_SET_FIELD(0x08, VC4_HD_MAI_THR_DREQLOW));
+	if (vc4->is_vc5)
+		HDMI_WRITE(HDMI_MAI_THR,
+			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICHIGH) |
+			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICLOW) |
+			   VC4_SET_FIELD(0x1c, VC4_HD_MAI_THR_DREQHIGH) |
+			   VC4_SET_FIELD(0x1c, VC4_HD_MAI_THR_DREQLOW));
+	else
+		HDMI_WRITE(HDMI_MAI_THR,
+			   VC4_SET_FIELD(0x8, VC4_HD_MAI_THR_PANICHIGH) |
+			   VC4_SET_FIELD(0x8, VC4_HD_MAI_THR_PANICLOW) |
+			   VC4_SET_FIELD(0x6, VC4_HD_MAI_THR_DREQHIGH) |
+			   VC4_SET_FIELD(0x8, VC4_HD_MAI_THR_DREQLOW));
 
 	HDMI_WRITE(HDMI_MAI_CONFIG,
 		   VC4_HDMI_MAI_CONFIG_BIT_REVERSE |
-- 
2.43.0

