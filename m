Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542AFA7149D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 11:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5766910E69A;
	Wed, 26 Mar 2025 10:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="B1ASN0od";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6303010E696
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 10:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742984403;
 bh=mqto+3pLlvUmByoQJNo+pUdodInryOfW/B9O9DxOdxA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=B1ASN0odvV43B0xLe9BjMxSNYpXxn8NRNlE+ouTF34b8YM9QUVhSpW7R4yNZrkG02
 pC5n3LnSnvcaT2zx/8qomaSoHP9Mx8UTGasC3sDhYZAkRz4+eaHpYr5LENSOLY7sAx
 ixVan1x2grR3oLJbLWTggDlm1lEoPZMJvsXU6aMld85uh85L+1Vr93JJp5rjld56IV
 L8zwc8yTpBWGBOKkbCIv3RxJnqMTQyqf0e/hry7jsJCp4I4yhhxPcVQzSjizNKRWPK
 OJSrpqYmiNqqAwgoZyCS7wsPyXj5vlNxLkAeiZ2NixRLMgNUq/9e+gKaNmrXPnAdgn
 vnjLIArVy6iyA==
Received: from localhost (unknown [84.232.140.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 1AF0217E0FF6;
 Wed, 26 Mar 2025 11:20:03 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 26 Mar 2025 12:19:54 +0200
Subject: [PATCH v3 05/15] drm/connector: hdmi: Rename hdmi_compute_format()
 internal helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-hdmi-conn-yuv-v3-5-294d3ebbb4b2@collabora.com>
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
In-Reply-To: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
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

In preparation to introduce support for alternative output formats,
which will require extending hdmi_compute_format() functionality by
setting hdmi.output_bpc in addition to the current hdmi.output_format,
maintain future code readability by renaming the helper to
hdmi_compute_format_bpc().

There are no functional changes intended at this point.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index f54eb5c594cddbd67dfacb5e06d54e9ce7851013..160964190d82ac233fdbe34ac54024a007a19872 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -605,10 +605,10 @@ hdmi_try_format_bpc(const struct drm_connector *connector,
 }
 
 static int
-hdmi_compute_format(const struct drm_connector *connector,
-		    struct drm_connector_state *conn_state,
-		    const struct drm_display_mode *mode,
-		    unsigned int bpc)
+hdmi_compute_format_bpc(const struct drm_connector *connector,
+			struct drm_connector_state *conn_state,
+			const struct drm_display_mode *mode,
+			unsigned int bpc)
 {
 	struct drm_device *dev = connector->dev;
 
@@ -639,7 +639,7 @@ hdmi_compute_config(const struct drm_connector *connector,
 	int ret;
 
 	for (bpc = max_bpc; bpc >= 8; bpc -= 2) {
-		ret = hdmi_compute_format(connector, conn_state, mode, bpc);
+		ret = hdmi_compute_format_bpc(connector, conn_state, mode, bpc);
 		if (ret)
 			continue;
 

-- 
2.49.0

