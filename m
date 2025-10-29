Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A18C1F144
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0D010E92C;
	Thu, 30 Oct 2025 08:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com header.b="JH8rrS31";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD48A10E71A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:11:18 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-28a5b8b12a1so71948955ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 01:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1761725478; x=1762330278; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cy9XTv2i4jQBLP7k+Sr4EyrGNjL9Wpf6xvz0spYyufM=;
 b=JH8rrS31SaukMoiDJOAviGHxTZWf5NOnKAqnke1j8OfiL1xKy5IVWGGqrOh0sLzsF1
 NXOkykKSkXl7B69HQnRhFXGz6Q5l36JGdH6V6gg0sFPX3IOJKsRcgZQfZn/Yf9DsRXoQ
 Kw+AKKgf8j/B9D3nSASF4R6C7NBWX1JPLqggBj1pQERQU1ZqAcJDnKykWLrvoKpwxSJ6
 X0CJaWP9gQddg3gBEqNuWLoADNAdUjZMExbc67cI9lefn6Idy8ba38HFAr8hFM330sMZ
 ygT4BYJo1/9ivcsICqhHaBweUAzNjgT5e/0jpzaGJzI23cgO9eqsjUCM+yb1BBAm/Jli
 98Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761725478; x=1762330278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cy9XTv2i4jQBLP7k+Sr4EyrGNjL9Wpf6xvz0spYyufM=;
 b=csuyf0U0ZsWwqvO0Qgyz8o8VAXFGYNsMWhhkoWENCQ1OBJAOrogBOIfdh3QNKbhxcq
 eSin4YzugNHv8/hCB2ZeXd0vXdAqcsROykhc47+xJRsptA+mnpkzb8n5BufQ639Ba+gp
 PJUgWAfQwM7a9lRed8nuHB6Lr6VTorKXXBmZ5wPV6kjEfYKry0ntkXMiuOw/PNvc4E0Q
 Oc0zeu4jSDt7YCrR5F72E7sWcGg7r56neEUST+2+rUmpR/Pk/QlAvFm1AYhDCSzbc8EH
 B9E7n31SiOTJlF9tHIIwZroDUHOSYR5oMRJCOnexNkKBgT2ZRtbY9UFc55zhmSmRso03
 zQaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtz16WnSM7C7EO44wr9ZIxDPjT7txKgF0fgFiJK2viphBb63BpBV66a8pI8syGKnWuYRtN/lITs2g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMAipOi+qaaa6h8B0hcLrX/k8JVBorxXhnr/PfrBbinVd9cpBy
 elwYACLZZJSJBO5bvwui/lsqTSywFkPmZ35Fj6xThOKVJ5ToXo1sWstaqCe01ZnF35Q=
X-Gm-Gg: ASbGnctzIjuIMWqyMw3alyGPXxNvjCjl5/E2qbLB6fNsefoaxMB7gFKDEE0jZ9MOxob
 NYFT9nTDxgEEL3zCgDpA8/1OcxiU+VPxSKLEBwYZSEbCV+C3aG7RdA0VkYIguaO+F29VSjaAE72
 euNusPwyttI0RTv89IgzhfACu5R+EvWc/JFgR21yMm1NI5WCWn+8ehi213aHdCt4v6T0XsUUfL4
 KF9ezpiwuWaj9qaINlhLPjZM/bkDrZkd9P3GKKMZ/P/sy+VDN8kA1N/pCpaibxzMyxOnl9eLvuS
 GUuwaTPXhztHFgBUoct+/1SbvuAgar+/uhRMt+yMpzxm25+uzO6OeZjjNXj7GVehieABgLCO6i5
 O8BZC3uvwSw54fiGFV/usaRE8SIG128WZ3RNjAbu0BxTi2XfOLkYvydhrhG/cqthIOiVvMYRy/W
 gNB+cYyvQE9UhA8zcBYcYq7Fyhcd+v+qIuCYtlGXHFFmMPMpFReO1WV0gnGJfFbU1wcELxNQwr0
 ffO38Mmi1Ore47TFWtJ9wD2
X-Google-Smtp-Source: AGHT+IE47ekKNBF9kXK/AfwFXT2q/NNP+Zhgqx+yPTGDTly8eePWmvpucVyygnjntJlajk3c9jzzuA==
X-Received: by 2002:a17:902:ea0d:b0:254:70cb:5b36 with SMTP id
 d9443c01a7336-294dedd0e80mr20877055ad.8.1761725478290; 
 Wed, 29 Oct 2025 01:11:18 -0700 (PDT)
Received: from ajye-OMEN-by-HP-Laptop-S.compal.com
 (61-219-175-100.hinet-ip.hinet.net. [61.219.175.100])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498d23226sm143988155ad.49.2025.10.29.01.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 01:11:17 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>, jazhan@google.com
Subject: [PATCH v1 1/2] drm/panel-edp: Add override bpc quirk for generic edp
Date: Wed, 29 Oct 2025 16:10:47 +0800
Message-Id: <20251029081048.162374-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251029081048.162374-1-ajye_huang@compal.corp-partner.google.com>
References: <20251029081048.162374-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Oct 2025 08:48:46 +0000
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

Adding override bpc to EDP_PANEL_ENTRY3 quirk.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 944c7c70de55..da3e8f223ec3 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -218,6 +218,9 @@ struct edp_panel_entry {
 
 	/** @override_edid_mode: Override the mode obtained by edid. */
 	const struct drm_display_mode *override_edid_mode;
+
+	/** @override_bpc: Override the Bits per color obtained by edid. */
+	unsigned int override_bpc;
 };
 
 struct panel_edp {
@@ -586,6 +589,9 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 	bool has_override_edid_mode = p->detected_panel &&
 				      p->detected_panel != ERR_PTR(-EINVAL) &&
 				      p->detected_panel->override_edid_mode;
+	bool has_override_bpc = p->detected_panel &&
+				      p->detected_panel != ERR_PTR(-EINVAL) &&
+				      p->detected_panel->override_bpc;
 
 	/* probe EDID if a DDC bus is available */
 	if (p->ddc) {
@@ -611,6 +617,9 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 			} else {
 				num += drm_edid_connector_add_modes(connector);
 			}
+
+			if (has_override_bpc)
+				connector->display_info.bpc = p->detected_panel->override_bpc;
 		}
 
 		pm_runtime_mark_last_busy(panel->dev);
@@ -1871,6 +1880,17 @@ static const struct panel_delay delay_80_500_e50_d50 = {
 	.override_edid_mode = _mode \
 }
 
+#define EDP_PANEL_ENTRY3(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name, _bpc) \
+{ \
+	.ident = { \
+		.name = _name, \
+		.panel_id = drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_chr_2, \
+						     product_id), \
+	}, \
+	.delay = _delay, \
+	.override_bpc = _bpc \
+}
+
 /*
  * This table is used to figure out power sequencing delays for panels that
  * are detected by EDID. Entries here may point to entries in the
-- 
2.25.1

