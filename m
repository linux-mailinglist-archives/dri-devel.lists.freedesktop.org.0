Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35F4943618
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 21:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9D510E0BA;
	Wed, 31 Jul 2024 19:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NMJQxx4M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF0B10E0BA
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 19:13:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5D3BECE17E3;
 Wed, 31 Jul 2024 19:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C788C4AF09;
 Wed, 31 Jul 2024 19:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722453235;
 bh=djLPLocy6MLVjm+zg05FaGvKSYzkkXVwiDCrgEChu10=;
 h=From:To:Cc:Subject:Date:From;
 b=NMJQxx4MQIdc+TJKKO0c/QrnzxkfjL1nbi+usYJz4sSneBQaqQdhRHN8oG9qw22d+
 x/vjWXYqs+O5W9fH5QobrAJMP6AikrSt8ec1Ghym0MMufePELFv+GCTlHoKFq6hmoA
 CnleINtoO3o7qoKpeb73tt/33h6pDetDEWv6eIPIpAdtv8VYPjnXkR1hs8mjyeFQ1a
 NZo52FSvRt+wqzornTyK3RwfGFZvYBjPFPKvLgHWMzh2FFOJ8DR2gFqxdGPj2gayOq
 M4JNmMU+JFhfxytzib8CeldhwLzfnse0A0FkVVOliUeCleHoR5Me9zUx+lvNFB2GoP
 lkMV8DRsNcWBA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm: vc4: Use of_property_present()
Date: Wed, 31 Jul 2024 13:12:50 -0600
Message-ID: <20240731191312.1710417-12-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Use of_property_present() to test for property presence rather than
of_find_property(). This is part of a larger effort to remove callers
of of_find_property() and similar functions. of_find_property() leaks
the DT struct property and data pointers which is a problem for
dynamically allocated nodes which may be freed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d57c4a5948c8..049de06460d5 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2211,7 +2211,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	struct device *dev = &vc4_hdmi->pdev->dev;
 	struct platform_device *codec_pdev;
 	const __be32 *addr;
-	int index, len;
+	int index;
 	int ret;
 
 	/*
@@ -2234,7 +2234,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	BUILD_BUG_ON(offsetof(struct vc4_hdmi_audio, card) != 0);
 	BUILD_BUG_ON(offsetof(struct vc4_hdmi, audio) != 0);
 
-	if (!of_find_property(dev->of_node, "dmas", &len) || !len) {
+	if (!of_property_present(dev->of_node, "dmas")) {
 		dev_warn(dev,
 			 "'dmas' DT property is missing or empty, no HDMI audio\n");
 		return 0;
-- 
2.43.0

