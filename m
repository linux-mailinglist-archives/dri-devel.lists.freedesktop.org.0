Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F707B0920A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 18:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A221F10E6F3;
	Thu, 17 Jul 2025 16:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="jnIM9mav";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B0D10E858
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 16:41:39 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-237311f5a54so9668915ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 09:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1752770499; x=1753375299;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QXRb/auSmvjfek8uJ1YIyvtZo0QCAaoEdhxcCrHaPWM=;
 b=jnIM9mav/Ct0YmZ7MHLEUhu5Qn5r6qKo2vLzTgJBzw46ntsSgvGpzHEXIBLST7uree
 gOlxPwKgSJISeF+WI91dEG5JWEO/d/b93HC72DjZ7sHr+4RpRWZnkTSrbD1gh5Nl8Cg7
 qrNhHFugsEvuFGKGUrjoUfmZs566dYE8WDTXz/xm64ubeEMoFERO4kuKntdTDh7U/1f8
 AZI1NHX6Cnzf/vAdXfxET8sXH98RNxFohwlrWFnFb58IusHhOpH1ftTnjM2DgIx/hhlz
 BzccMp4e7j/RSF5EkWG19g8yYcA/Qq+qcs4Fi9TadBtyjuostHCq1ceWTs7if6x7W1D6
 70Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752770499; x=1753375299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QXRb/auSmvjfek8uJ1YIyvtZo0QCAaoEdhxcCrHaPWM=;
 b=IU00p4zAZyAYrf037qE7Ls1HDd5PF6rdbyE8wmi9YMNMsueJI111E7Zy7UsvDH3NDz
 pZeaR7HTmdEByhX+y1pgDu7pbFYmcUIMKSeshsvO8SXGafCrvdk5YMTfd7L7TLkEHvOg
 5+Gp8Jix509e2qArGjHcrxTlXSveZo4vBQLzrek6QFAG4KaTVYmtZawxOvEr+maakv3F
 PmVxNhrr1BNweo2/c7R3gRoKFeIzOJv4qt9pN35NRGFaGJfj8rnkk0sHeLg4FY1ITN63
 fl0ybS01XbVFauoH0gPBen4BlKOYdPi7+2N+81k3PyCt3hnjeI5VcL45oREHxZdZp3G7
 yTWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3YSsu18LkMMDHMnY6XLdfyzW3Z/edZNPA8+UYnVHpakg5Hzlw8NQSwSgqktozaulVRhHdaPU+dLs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywbg3ySMrgX3jrCXX41GQBlOv7s/VbcqaJJRfWLwWS4uLNKZWVH
 EUDyyTDsFUf8X8lvCd89C18dJEBaTHv03G1Ev2zUaCTV6LrpMl46eHbhY057Np75PO/7K+fY/Of
 gwAorTavybg==
X-Gm-Gg: ASbGncv8xi3xVv1MBP9G9yOpKjUNIZpH0b8s4wnpst5+OcqHjB9GWCc2BpoZBa4NXWb
 pPgrgd9UlEFs+DYohjqjrBVPJmq5daKfnP5197AZalV2omNnf3Sei1HvQwSqYYbEVBzLDR0JYbm
 E2OiGS2Bvz++VrPmtzAFWoX7u/WvczCncKv3KEW80JnP0cxHhU5cYhvxM+4qu5stgNb6GCGiegx
 GdCtMR7nD1FgLlqz11MqunIDiofbOLerpJqRjf+NAhAp8S9uAgusNJTwMPx57Hmi0CZZ7Oq3mSV
 HRjN8WwH647EHYzfLTMaVCfxNV0OfgRHbnthWMeiUnIm9RKAUP6fKRNrWWzUKq8nOrX0cLrVLX3
 DRXXrO7z/U9huR0U9GXp70ZSX/QuxAPZ5YLGCPXOCL1g7fJ0nTU8h8r+GIZtR
X-Google-Smtp-Source: AGHT+IHQUhEP8RVdomUjbzwvcSpmkLRrN2k+b3W2P/yZEwrE1afYAZj5NI3TgnCfzxILvDYUugHslQ==
X-Received: by 2002:a17:90b:4e:b0:31c:15da:2175 with SMTP id
 98e67ed59e1d1-31c9f47c6e9mr10439506a91.9.1752770499083; 
 Thu, 17 Jul 2025 09:41:39 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31caf7e8ae4sm1821750a91.24.2025.07.17.09.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 09:41:38 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org, tejasvipin76@gmail.com,
 diogo.ivo@tecnico.ulisboa.pt, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v4 1/4] drm: Create mipi_dsi_dual macro
Date: Thu, 17 Jul 2025 10:40:49 -0600
Message-ID: <20250717164053.284969-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717164053.284969-1-me@brighamcampbell.com>
References: <20250717164053.284969-1-me@brighamcampbell.com>
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

Create mipi_dsi_dual macro for panels which are driven by two parallel
serial interfaces. This allows for the reduction of code duplication in
drivers for these panels.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 include/drm/drm_mipi_dsi.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 369b0d8830c3..03199c966ea5 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -431,6 +431,30 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
 	} while (0)
 
+/**
+ * mipi_dsi_dual - send the same MIPI DSI command to two interfaces
+ *
+ * This macro will send the specified MIPI DSI command twice, once per each of
+ * the two interfaces supplied. This is useful for reducing duplication of code
+ * in panel drivers which use two parallel serial interfaces.
+ *
+ * @_func: MIPI DSI function or macro to pass context and arguments into
+ * @_dsi1: First DSI interface to act as recipient of the MIPI DSI command
+ * @_dsi2: Second DSI interface to act as recipient of the MIPI DSI command
+ * @_ctx: Context for multiple DSI transactions
+ * @...: Arguments to pass to MIPI DSI function or macro
+ */
+#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...)		 \
+	_mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ##__VA_ARGS__)
+
+#define _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...) \
+	do {					       \
+		(_ctx)->dsi = (_dsi1);		       \
+		_func((_ctx), ##__VA_ARGS__);	       \
+		(_ctx)->dsi = (_dsi2);		       \
+		_func((_ctx), ##__VA_ARGS__);	       \
+	} while (0)
+
 /**
  * struct mipi_dsi_driver - DSI driver
  * @driver: device driver model driver
-- 
2.50.1

