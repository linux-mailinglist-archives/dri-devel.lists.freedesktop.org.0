Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D59547BDF9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 11:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904E710F8DF;
	Tue, 21 Dec 2021 10:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F56810F1C8;
 Tue, 21 Dec 2021 10:13:32 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id s1so20443830wra.6;
 Tue, 21 Dec 2021 02:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DEyc+NVxVKi+L8yckVOHzJw2NoQPHaqK818Sh5CD0II=;
 b=lxMPKYkdr/tQQ5EF9glUhX8o6TAPzZHvOOcoty8aNGCRmqkX67V5uOWbfJu2le08B+
 k5Vb67u4Hj9e6ds5NQVE1QBG2BLEftP90TQPLF5pUYHG9RBeIIV3aZxipCeyzGSFDIBP
 Gw/UzNTUcXDmfnIC5nii9VhaJ7ubVO//u+xpHk8ftoqOnGirhOFZaEW/W3pNAnfUzgaH
 vBvxWdEUh9havG6ympZQiTKQCMg/xhVwAIWo6ByxJ3Hw6jIcSMsMdm3yZWtBmx/IZj5E
 iyrYtaF263Fe4tH/Dz1A2sKmma4e/WamHVQeGJYLWfMOBNEG1vzkzYQAZ5eJHzbdooWx
 C6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DEyc+NVxVKi+L8yckVOHzJw2NoQPHaqK818Sh5CD0II=;
 b=jld9V1fxzmvkq4wUdeMPoH1pr/9hgcPHDYnVfmsL22Rzk+8gVLOdTOgzLXhA/UnUFl
 duOB3BMTh+1zStiDoFEloeqbRo+RFd4Bg68Ji5SXY9rO3VK7+HhD6D8IRtOlfkFzwn9e
 94Wd44kLhKKDN9aqzP6aT5AzGk5pmptj6wvPUn2AiTMiCqi3hIaaNjdMa30EnWsyGpUu
 d8yGGt6/WvOwyq7XgFz/k2n/MZ8hgUl6tda1JDgaD8am1BNNfQs0LIZbsse50atoq0yB
 dboTD/9T+w3sQDn7BgzSRKZTjwv5IIIslNnyI5/LFWcMNCe7bahJyaiaFCHJqF9ClOUG
 Awgw==
X-Gm-Message-State: AOAM533aZ8l1Jx+E4UCJ6PLSIpM71c+USOTmcCdTuF3iFg/F+cSaxffi
 Ef4KgbhEqj33J7UI+WmnV8Q=
X-Google-Smtp-Source: ABdhPJwlXh9Hinn/Wk7ysQCkWYtXKp4CzjPNtpjWfGGw6aNsx8L9xFEr+Qk++VuuE6LFwzWkgksbVQ==
X-Received: by 2002:adf:fdc9:: with SMTP id i9mr2018666wrs.660.1640081611007; 
 Tue, 21 Dec 2021 02:13:31 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id m21sm18012267wrb.2.2021.12.21.02.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 02:13:30 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH 3/3] drm/sun4i: Add format_mod_supported function
Date: Tue, 21 Dec 2021 11:13:19 +0100
Message-Id: <20211221101319.7980-4-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221101319.7980-1-jose.exposito89@gmail.com>
References: <20211221101319.7980-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: freedreno@lists.freedesktop.org, jernej.skrabec@gmail.com, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, wens@csie.org, maxime@cerno.tech,
 tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 sean@poorly.run, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement the missing "drm_plane_funcs.format_mod_supported" function
to avoid exposing an invalid IN_FORMATS blob with modifiers but no
formats.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 7 +++++++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 7845c2a53a7f..728563f23cd6 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -331,6 +331,12 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
 			      true, zpos, old_zpos);
 }
 
+static bool sun8i_ui_layer_format_mod_supported(struct drm_plane *plane,
+						u32 format, u64 modifier)
+{
+	return (modifier == DRM_FORMAT_MOD_LINEAR);
+}
+
 static const struct drm_plane_helper_funcs sun8i_ui_layer_helper_funcs = {
 	.atomic_check	= sun8i_ui_layer_atomic_check,
 	.atomic_disable	= sun8i_ui_layer_atomic_disable,
@@ -344,6 +350,7 @@ static const struct drm_plane_funcs sun8i_ui_layer_funcs = {
 	.disable_plane		= drm_atomic_helper_disable_plane,
 	.reset			= drm_atomic_helper_plane_reset,
 	.update_plane		= drm_atomic_helper_update_plane,
+	.format_mod_supported	= sun8i_ui_layer_format_mod_supported,
 };
 
 static const u32 sun8i_ui_layer_formats[] = {
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index bb7c43036dfa..d17813a7cac3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -435,6 +435,12 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 			      true, zpos, old_zpos);
 }
 
+static bool sun8i_vi_layer_format_mod_supported(struct drm_plane *plane,
+						u32 format, u64 modifier)
+{
+	return (modifier == DRM_FORMAT_MOD_LINEAR);
+}
+
 static const struct drm_plane_helper_funcs sun8i_vi_layer_helper_funcs = {
 	.atomic_check	= sun8i_vi_layer_atomic_check,
 	.atomic_disable	= sun8i_vi_layer_atomic_disable,
@@ -448,6 +454,7 @@ static const struct drm_plane_funcs sun8i_vi_layer_funcs = {
 	.disable_plane		= drm_atomic_helper_disable_plane,
 	.reset			= drm_atomic_helper_plane_reset,
 	.update_plane		= drm_atomic_helper_update_plane,
+	.format_mod_supported	= sun8i_vi_layer_format_mod_supported,
 };
 
 /*
-- 
2.25.1

