Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4A56EC0A4
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA8710E0FC;
	Sun, 23 Apr 2023 14:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC2D10E0FC
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 14:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682261588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=brUP6Y4+fxRUO3RjcIxh9okEQNw9LLitzlIw6oM9sjU=;
 b=TJyCLN96bhb7oELolk/NjHIb/8yUcBKCIaNL633t6vL4XkDNHxgyT2HRolK+oAjZX4B1Dz
 B64teMPZsvrJEUrkMPDp61Ig03Q3VRZgQFKDwsU0D/mXbOXBK0ClZDfNAHpyI2YUEWy66f
 ZXs3gY3wABrBAg8x3z8ob78PS4AbWms=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-XdCLAsXBNmC_0JcV9no1og-1; Sun, 23 Apr 2023 10:53:05 -0400
X-MC-Unique: XdCLAsXBNmC_0JcV9no1og-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-3ef3fc80bb6so42692411cf.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 07:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682261585; x=1684853585;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=brUP6Y4+fxRUO3RjcIxh9okEQNw9LLitzlIw6oM9sjU=;
 b=WqaU5p9vbBLa0PgYLBz8kTW3ewwavBgbz7mPl/CkOUMkimJn2wIt15ae2SgGaqKa2Y
 d2kQ0XIpl+LHMvgLGX9kM7qdkpNK65LJDbDDxbspHPYOG/Eadmg+XqGYQ53h5fmE1s2d
 Jiy93JxeqEoRH36OFZRCg5eunOcjysy/R3uK8/xf0u8f7HbAaQXtr5c9h7Y4HI5DiuSw
 vhpyRQD+f7yNwed8jvFAg/+MeBWW/INdE2X3EtzHndJg+9cZP6oGB+CWcUNm5i79hOje
 BPrqTGz4ZRjqzRg2/uRl7Rj+Bd/MZvtxlNuQpqCbzJnnQNvKR8ZJCwzr9DRIMFpUyadQ
 jSVw==
X-Gm-Message-State: AAQBX9fixpuqikATHfZiDdldgiNANQErgZxjlHvbR2ql6IaxuE7vfL6V
 8ii2ANJS/TeoyPdfY4aAk5OCYa3zhNzmS6X7XUx1xC3RNq9hccsDVeTbmujAY9+ZYB9coyWE5SF
 8Uq4r8sb8dGlqdw2P61iLs5C4YHnG
X-Received: by 2002:ac8:5892:0:b0:3e3:9117:66e8 with SMTP id
 t18-20020ac85892000000b003e3911766e8mr19520248qta.35.1682261584971; 
 Sun, 23 Apr 2023 07:53:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350bmzZ2YfZA9i7Lvmo/Y61N2NeOxSpRotijBmk2JHeQ07QlcP3dqMW3ponYcBCaTHnGgvtlrcg==
X-Received: by 2002:ac8:5892:0:b0:3e3:9117:66e8 with SMTP id
 t18-20020ac85892000000b003e3911766e8mr19520221qta.35.1682261584717; 
 Sun, 23 Apr 2023 07:53:04 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 w24-20020a05622a191800b003ef59e2b9a6sm2358221qtc.78.2023.04.23.07.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 07:53:04 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: neil.armstrong@linaro.org, airlied@gmail.com, daniel@ffwll.ch,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Subject: [PATCH] drm/meson: set variables meson_hdmi_* storage-class-specifier
 to static
Date: Sun, 23 Apr 2023 10:53:00 -0400
Message-Id: <20230423145300.3937831-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-amlogic@lists.infradead.org, Tom Rix <trix@redhat.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch has several simailar warnings to
drivers/gpu/drm/meson/meson_venc.c:189:28: warning: symbol
  'meson_hdmi_enci_mode_480i' was not declared. Should it be static?

These variables are only used in their defining file so should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/meson/meson_venc.c | 32 +++++++++++++++---------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index fcd532db19c1..27ef9f88e4ff 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -186,7 +186,7 @@ union meson_hdmi_venc_mode {
 	} encp;
 };
 
-union meson_hdmi_venc_mode meson_hdmi_enci_mode_480i = {
+static union meson_hdmi_venc_mode meson_hdmi_enci_mode_480i = {
 	.enci = {
 		.hso_begin = 5,
 		.hso_end = 129,
@@ -206,7 +206,7 @@ union meson_hdmi_venc_mode meson_hdmi_enci_mode_480i = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_enci_mode_576i = {
+static union meson_hdmi_venc_mode meson_hdmi_enci_mode_576i = {
 	.enci = {
 		.hso_begin = 3,
 		.hso_end = 129,
@@ -226,7 +226,7 @@ union meson_hdmi_venc_mode meson_hdmi_enci_mode_576i = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_480p = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_480p = {
 	.encp = {
 		.dvi_settings = 0x21,
 		.video_mode = 0x4000,
@@ -272,7 +272,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_480p = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_576p = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_576p = {
 	.encp = {
 		.dvi_settings = 0x21,
 		.video_mode = 0x4000,
@@ -318,7 +318,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_576p = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_720p60 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_720p60 = {
 	.encp = {
 		.dvi_settings = 0x2029,
 		.video_mode = 0x4040,
@@ -360,7 +360,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_720p60 = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_720p50 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_720p50 = {
 	.encp = {
 		.dvi_settings = 0x202d,
 		.video_mode = 0x4040,
@@ -405,7 +405,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_720p50 = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080i60 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080i60 = {
 	.encp = {
 		.dvi_settings = 0x2029,
 		.video_mode = 0x5ffc,
@@ -454,7 +454,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080i60 = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080i50 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080i50 = {
 	.encp = {
 		.dvi_settings = 0x202d,
 		.video_mode = 0x5ffc,
@@ -503,7 +503,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080i50 = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p24 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p24 = {
 	.encp = {
 		.dvi_settings = 0xd,
 		.video_mode = 0x4040,
@@ -552,7 +552,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p24 = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p30 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p30 = {
 	.encp = {
 		.dvi_settings = 0x1,
 		.video_mode = 0x4040,
@@ -596,7 +596,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p30 = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p50 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p50 = {
 	.encp = {
 		.dvi_settings = 0xd,
 		.video_mode = 0x4040,
@@ -644,7 +644,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p50 = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p60 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p60 = {
 	.encp = {
 		.dvi_settings = 0x1,
 		.video_mode = 0x4040,
@@ -688,7 +688,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_1080p60 = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_2160p24 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_2160p24 = {
 	.encp = {
 		.dvi_settings = 0x1,
 		.video_mode = 0x4040,
@@ -730,7 +730,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_2160p24 = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_2160p25 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_2160p25 = {
 	.encp = {
 		.dvi_settings = 0x1,
 		.video_mode = 0x4040,
@@ -772,7 +772,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_2160p25 = {
 	},
 };
 
-union meson_hdmi_venc_mode meson_hdmi_encp_mode_2160p30 = {
+static union meson_hdmi_venc_mode meson_hdmi_encp_mode_2160p30 = {
 	.encp = {
 		.dvi_settings = 0x1,
 		.video_mode = 0x4040,
@@ -814,7 +814,7 @@ union meson_hdmi_venc_mode meson_hdmi_encp_mode_2160p30 = {
 	},
 };
 
-struct meson_hdmi_venc_vic_mode {
+static struct meson_hdmi_venc_vic_mode {
 	unsigned int vic;
 	union meson_hdmi_venc_mode *mode;
 } meson_hdmi_venc_vic_modes[] = {
-- 
2.27.0

