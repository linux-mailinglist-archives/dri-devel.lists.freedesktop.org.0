Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1A0C32880
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BA510E2B3;
	Tue,  4 Nov 2025 18:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O8r0D36a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B654510E2AD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:04 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4710a1f9e4cso48081905e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279803; x=1762884603; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l+/CRDV30StujBfkrHNR5F++4wuDv1TH5QOb5NIYpYA=;
 b=O8r0D36aG2Czn3e6Kutln87XRiOD5Ku+n8kcz0TeXQUrei8EUBv4QhLP/oOhxxDFDd
 EJToRB80YSKxyY9S2qn+Zfwj+Eo8uxBYibU+dVIDkSjwKB5/wiVUL9hfjWrX5TxSwn0I
 3mo8Z9S+rV9b5GO9IcC6Zfjc4EwXrYJZKqL9l6LKxFc9RodqS6yuApn95Zg99DySeIsS
 KVQzC/2sqxaFkg8J3VNegbakt7VN6074mVmeDN32I534HB7vjgZGB6M+rRhDQVsN98M/
 gqlFW6Vu4IV8sDBrel+MbCZzaT+pFRCeeMPr+pVHnZc35KV51R2CQdIxbGjQ7BHUSA6d
 z+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279803; x=1762884603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l+/CRDV30StujBfkrHNR5F++4wuDv1TH5QOb5NIYpYA=;
 b=r1z4CdFT1In0epQw7HjDpmhjCt1VC2g96dcOtKUuGL/y02yJcyk7UyPpba7xjy9jfz
 6FbNpH3uWJZESllTCF3Hycu4B0T9Icc1Wi1HdkihnJPrM9e5NupHxbqvTIz4XpdsSscs
 ngOj+qx1wZIMcJAO1e4Y1KgbVSfEqea51qEmQuMYz+O+RnAtyeYMXYGT5ZdMimhqH623
 oMmlEturn7pybk/BRNKry7O+l7bkrEmdq79XqSxjfAFty62BrF4D+J+lYteetl2NsDWG
 ej1GOahyjvKmpGl/AzwHwKLNodVM7cXgLpfoJVWmbSMTLt+7sn2GApPxMoLVMOCTnnE+
 SFGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfUfM3szIPIhDjOHhyo+2JrydRA6oWLprNjSjjGTiSxDE8uK0fwmur+qMKxSgGQYUqCVKOF4NAA1Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJ/vMQvex1NpjqW11uv9ST5oDe2Qjd+DEfCRLG5hHYKyax3noW
 9IFkgYu1EjQQX+jWNXA2/bq3R4HCSGOcBQRkC+nKFYHosu0IUEP6QaFT
X-Gm-Gg: ASbGncsvzGRp/H3Ue1bz2taZflpQ+ecx8X8nrHHyxwcr4MMsOGcVSgiNIMlYnYvW+wB
 JkQ0lvOubOeeVT1gIl8y//Y5LKBEjPNRp5GIwismiYEN+XgVs0X/m/R7lJMLd033dpARGaUMf4O
 W18lcyHC5zc8DiG5gkSpWTgNc3iPzCvdw5UwtKA2gGpTav6cdHKNoJkTImcNT9NKEOKK/fqg5Ej
 hM3QlvWG06XT+2r8tBDmNiazNxrpYH5DeAtMWSXBQdxSETUD1DFE1x8RuaWPRbyuAAFZWeuHrzx
 9EHXKxsj4mtSFPhd8h+WKUg3Z/FMxcL+eoAyYzotCl5td+460pdG0AT1mvwGD5RUwpQc4qsgB/z
 LOzrEIRBZoz+xW1MLp0We5qYlj22O99Wgnr+02WLQ9KbeQNIKd3q0XO8jy1a/DzrGWhN7Y6TYMZ
 AtavxwOdhlB/4THwTdgA==
X-Google-Smtp-Source: AGHT+IGtn2Tb5IVfUa8fwzSIF6EUNQPbcBikspeOnI6L4J7SH1eZ3RvMdCq27U9/2nMsft5HkQB0Jg==
X-Received: by 2002:a05:600c:5251:b0:46f:c55a:5a8d with SMTP id
 5b1f17b1804b1-4775cdbd440mr2296855e9.4.1762279802950; 
 Tue, 04 Nov 2025 10:10:02 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:02 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 01/30] drm/sun4i: mixer: Fix up DE33 channel macros
Date: Tue,  4 Nov 2025 19:09:13 +0100
Message-ID: <20251104180942.61538-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
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

Properly define macros. Till now raw numbers and inappropriate macro was
used.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index a1c1cbccc654..b5badfa2c997 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -39,6 +39,9 @@
 #define DE3_CH_BASE				0x1000
 #define DE3_CH_SIZE				0x0800
 
+#define DE33_CH_BASE				0x1000
+#define DE33_CH_SIZE				0x20000
+
 #define SUN8I_MIXER_BLEND_PIPE_CTL(base)	((base) + 0)
 #define SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, x)	((base) + 0x4 + 0x10 * (x))
 #define SUN8I_MIXER_BLEND_ATTR_INSIZE(base, x)	((base) + 0x8 + 0x10 * (x))
@@ -242,7 +245,7 @@ static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-		return mixer->cfg->map[channel] * 0x20000 + DE2_CH_SIZE;
+		return DE33_CH_BASE + mixer->cfg->map[channel] * DE33_CH_SIZE;
 	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_CH_BASE + channel * DE3_CH_SIZE;
 	else
-- 
2.51.2

