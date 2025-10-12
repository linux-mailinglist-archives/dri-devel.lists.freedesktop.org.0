Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62616BD0B57
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 21:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E243310E1D0;
	Sun, 12 Oct 2025 19:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="geIGumQx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CE210E1C2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 19:24:08 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b50645ecfbbso722868966b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 12:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760297047; x=1760901847; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lx6RwmSdgU4IIQBCfnjkaHIgGiO5u++wyA5NWC/K61U=;
 b=geIGumQxxcW0tqmOxI/ubzJaGCGRG9KFRKOA2wyBImzcxGdAjs4gi7yJE8pBp1sId/
 D4m4cB7KAOWYbG9vAx7E66I7Mckat+lcPo1tvUhvTgm02dXINGy5VS1ATeHOPoOvROdi
 fGKWlac/G5d/NCmCiz5WrNbuPMl/FnJzBXYtCJxi5QoShQ5A7Y4acpnS0FMhaUkZrLv+
 pMElYu+3vfORyQj3TiX9sLIN/GzwFJ+UxaWbp2r0Eqgp6ZUnfmZUuxiuoaCqK7ObbXq/
 fhPfcfVscw2oJK0N23tiyA4L835W4EEKnH5eWate9XfNdfrlouIO9ic/k6ap0py/1S5P
 2ymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760297047; x=1760901847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lx6RwmSdgU4IIQBCfnjkaHIgGiO5u++wyA5NWC/K61U=;
 b=nUO+xy3p32QZwWcLJRx57O2XGCEjPcCcbCvbTPjWjZ6pPbtGnCx+FvgxLiCg1iRrq6
 Uzni/EJQgF6OG9HrqKO5diHzvEKNu/pMjMOSO6suOJPFPs0Syw0zPA6SL3C67cr8mWbT
 NBgxSyUHUuyl/ojlM3O+TxWk57Ekvrc7BEGNCxRqcNAnfIpCdyrPggaPjaPZgC+2eKUr
 cBlAFGnVeRI6buh7KUKquxD7gJyfjzJzTHr9MvEqtjX7t8M4KSHXAIjnfQm2SVS+K/7/
 FrRNuIvqjUM6r+/HyGB9IlnF+luJG2tmroSWGWzCtkBMqNrp2FbovPdQbxHOcab76MVV
 bBKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwiit5WV4cwtYQi1k8+JSSJIZ48qwyJB6Ahg9ek2+0k0I+YoVYZamsm5sdU6SSUQE2zdKGN4X0fzA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytuSRKTPnrMoQN2NGL9vyRLZKbQLfvMDRhMr+6Bb5+oMw+ZgWz
 Gav+fO9bAFBqQJyVRCACDtDmAxdfJTek4pOkdPnYIrpnD/nZoGGqHad3
X-Gm-Gg: ASbGncsJaH2T+72LRoFiofjD7O4i/ZvQkC+5KBVaCE+V0d2bjkmw6T0r8jGbIj2NglG
 CX7gQ7C3FQM3/ZlFpG5v43vK+ek+isFsvsoju9cMTlH48/Q296LONTjtzLtS2Xtr/+29/0FCvXG
 K8G4pDq3iPXFJmDtbbVcaAszZqE2pzH4fC2BTHRxeDSwcF/JsM8py+LVh8UYT6/TsuK870bxhMd
 ZwJT0cECuo0yrNMRbQlWS1OraynLh7n4PeCK30JHEO852T3RJlUFu0+iw3mv3UeUuLbEZ5VFemN
 ACUzMkcQREZ65F//bqqpjsruu90TD3VDo6rLP6lzMhepJ6gbF3gp6o+pYkhoyXQE44VMLgOIDzu
 vWKauy8r/L1/KhDjMmLYUwPtG3tfZI2Z/Azz6InTuw98FShCnuc7KqVzOE0MeCq47Uk8W0SJWix
 e4unaYP2IFwezEM6cDijsBaXWRSA7k78s=
X-Google-Smtp-Source: AGHT+IGH9C/CoLClf1Jkf0CjCgobVw/ZwbzYhFdY1bLk6LH3leZZDbDIp409NxGuCUrOaIqSIPGpIg==
X-Received: by 2002:a17:907:3f97:b0:b3c:8940:6239 with SMTP id
 a640c23a62f3a-b50ac3cbd52mr2018365366b.52.1760297047252; 
 Sun, 12 Oct 2025 12:24:07 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 12:24:07 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, samuel@sholland.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 23/30] drm/sun4i: vi_scaler: Update DE33 base calculation
Date: Sun, 12 Oct 2025 21:23:23 +0200
Message-ID: <20251012192330.6903-24-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
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

Now that channel base calculation is straightforward, let's update VI
scaler base calculation to be simpler. At the same time, also introduce
macro to avoid magic numbers.

Note, reason why current magic value and new macro value isn't the same
is because sun8i_channel_base() already introduces offset to channel
registers. Previous value is just the difference to VI scaler registers.
However, new code calculates scaler base from channel base. This is also
easier to understand when looking into BSP driver. Macro value can be
easily found whereas old diff value was not.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 3 ++-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index 0e308feb492a..fe0bb1de6f08 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -836,7 +836,8 @@ static const u32 bicubic4coefftab32[480] = {
 static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-		return sun8i_channel_base(mixer, channel) + 0x3000;
+		return DE33_VI_SCALER_UNIT_BASE +
+		       DE33_CH_SIZE * channel;
 	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * channel;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
index 73eecc4d1b1d..245fe2f431c3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
@@ -18,6 +18,8 @@
 #define DE3_VI_SCALER_UNIT_BASE 0x20000
 #define DE3_VI_SCALER_UNIT_SIZE 0x08000
 
+#define DE33_VI_SCALER_UNIT_BASE 0x4000
+
 /* this two macros assumes 16 fractional bits which is standard in DRM */
 #define SUN8I_VI_SCALER_SCALE_MIN		1
 #define SUN8I_VI_SCALER_SCALE_MAX		((1UL << 20) - 1)
-- 
2.51.0

