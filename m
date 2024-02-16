Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60508585B4
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 19:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0510E10E71F;
	Fri, 16 Feb 2024 18:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="CQLY1Eo0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D1210E71F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 18:49:42 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so301337666b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 10:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1708109381; x=1708714181;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YZ9BgofFaDjLNq6PW24Ubio+a5DmWv/J0PkAc+IsXJ4=;
 b=CQLY1Eo0OEo0syJOpXETVRRQ4w89Lypdd3A0PX0Vb8txq+2PMmzs1X7gdHb5Y894Wx
 bRMiqzJWPRdU6zjej89//d4iITilUJrnU1x8nJdDjQN4LFyLGAXMCmSqM/CosPPp8CoO
 bpu/mbCIyztO1YhhU/20dzd1YZ9noqt3AEfPrGjuVq3iA5maOuixTndTU2ZjR5P6E6La
 k5N0qjDyEzqKhgbY9tkyyjjaOPcN2n2gtokEUIBUTRyffmC/xWoUev33jdSYRsBI5JBX
 9rSXkg+Oucwg0MZBsgPMdv2Tj0ZMqWZsQoMI7J0+NLnov8wRXRrctcfi4M8/B5UT+/l5
 P5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708109381; x=1708714181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YZ9BgofFaDjLNq6PW24Ubio+a5DmWv/J0PkAc+IsXJ4=;
 b=LaAaVvU7pbObFNdlvtfh+LBOSuMAzfyBaIWFWKsPQUn2sNSpA1QBmGICGlPeS9qROq
 V1u0Eki8raXl5l6wjrGaHyRMUhNOwccWHQSopyABkIFW28x+VElfwKZ0hfK7LTwkZPLW
 YDvK26/SinHLlPHkhy85PlXkqs7f86XbyZqaR1TGl13AzJwI6pv6Yppx/UfgWqI290RQ
 /qAPHIrW7qzYqMPpygRIPP4Zz0zeWcY8C2VA81G0c47I/KuG3M8DkiSw/dIKM7w2/MPL
 ufdRMLSPlavwrBUG5kKaCYqB3tu559KJw41y7DpJLW+NALIuoTCIoNenM5gj6hPENpI+
 9pBg==
X-Gm-Message-State: AOJu0YwF6YgRvegbB7KrGmluDQYMe13GvntrKwji2A+0VfjZUN+ZAQAL
 cZqW490lxcupUQHofyHvxzptbT+TKjn5jMCJTPR3coXFmCUMbBu3FUisD+Up5sVP7PgH3KjvLuE
 t
X-Google-Smtp-Source: AGHT+IFtFvVaIxgjHHMWBVccGLVvoEaW99z3OxpFSGHjhwEOTNJxcI+ZECx1kzT1SzLDKpBmCf41tA==
X-Received: by 2002:a17:906:6951:b0:a3e:1224:f562 with SMTP id
 c17-20020a170906695100b00a3e1224f562mr90490ejs.75.1708109380672; 
 Fri, 16 Feb 2024 10:49:40 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([188.39.149.98])
 by smtp.googlemail.com with ESMTPSA id
 tj1-20020a170907c24100b00a3d1b3c5f1esm235108ejc.77.2024.02.16.10.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 10:49:40 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 3/3] drm/vc4: vec: Add the margin properties to the connector
Date: Fri, 16 Feb 2024 18:48:57 +0000
Message-Id: <20240216184857.245372-4-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
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

All the handling for the properties was present, but they
were never attached to the connector to allow userspace
to change them.

Add them to the connector.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index f9e134dd1e3b..0aed18920d18 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -528,6 +528,8 @@ static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
 
 	drm_object_attach_property(&connector->base, prop, VC4_VEC_TV_MODE_NTSC);
 
+	drm_connector_attach_tv_margin_properties(connector);
+
 	drm_connector_attach_encoder(connector, &vec->encoder.base);
 
 	return 0;
-- 
2.25.1

