Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8364CAE5552
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 00:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420F210E46F;
	Mon, 23 Jun 2025 22:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="Ubg3hDfX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703A110E46F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 22:09:57 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-6fa980d05a8so44671606d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 15:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1750716596;
 x=1751321396; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1nuGlJAk99F9szc3kYMP1AwVjb/D91a8HtVJ+JX/QFY=;
 b=Ubg3hDfXwIkiUWkr+lXK444hzpZBRABHrs4dEoTtguU/PKO+J4fCEcsZsKi1fXa/eE
 s/z1JGKAOYqrn1BedAE5H5n+gH79U7zPn9TcC25oxkTZXb9CDt+G2C9pCdkBcM6j/guN
 frp38CB+2Q2ud4OA4ojvXuMzzEa5yFhxaDqpmd5CWG7pLdfYGYjRZXdhajc0DJo4zELL
 rgVtmtYpl4rQ1Ho2bQfJ2MLFp3UPK5M5M3AvOgzq4LgVhsgydwwopsTUhHBkynDe3lha
 VpglVtiSpv5s8VVZU1svRrw5XDzVmxac97Fh9hwiPvVLJ8tyTf9Dclg2TRzlv2QA7VdB
 qxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750716596; x=1751321396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1nuGlJAk99F9szc3kYMP1AwVjb/D91a8HtVJ+JX/QFY=;
 b=sj/IGV67rE12hJhlkTuloK/8RZDxB8DplVOa8nX3n2BJLQOle3z9BQYSXXmn83ve6Q
 9Sm0QPgi+0jTcvqnLophAGtNot2I4eRwC7/N5A49PJrcJg3vYNZ+/m4bz7Gbv6eDI50n
 Ccy2SJRy881QrApIq+mgDHiRsJCxwMX49s8E1l7w6gqtIN9So9w0KbEp6xfgbf2bFdZi
 YFxuicCWiBcGrJ05zpyvYsgtlz0HW2J88XDR8Ry/+e/awle3M5pPbsaUpV5jZyfBAoBb
 6V27R9181J/EN5StTQlXl1WgZT2OQICtyFudbxWhJA0Cos3mCiU9yoO1eywGHF5jPxDQ
 WdpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM+Q8uIOF4R03e7wl39QQsy5BA6+aPiQ8gVNWn9SSN19lZ1dx/eC8pWqdRg0t0vUnBQUNFOwASyoA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzY+7lePda81xW+Ze82Slh7utZcNjAzkRYo2oaCkfK8H50rzapG
 QBdCMEK0NUtzIF65D3Y8T9aFt5+53JonZph2ufav61lKKcE+97MAriz6fOOWKkm2Q8M=
X-Gm-Gg: ASbGncs7K6cdIO/AJ5fV/MBuEGaVF/uPtMSbFcviMXBHfkfk5gG/Om1ddEIO7/xnfwB
 R330dmf/E7yCVter8hmC0JKatxWsFtbxk1WRaTYQvOx0+zkN7zi9xqL/iR3b8jsqnsvVA9NHXXn
 gVeu4HqdT0jYBMbZdBlCBxevn86UWsZyPLh3Rygmi5oTNNjIRUVFvWmZ7LsW8Oyxn04O8HKCBoR
 g7jV5jzWwzyROd5OeOfcUqlbn8j+9zLG/saElqZFMQFm64qGg0YYGMydI/3/gL+TlgCwg7qy4C+
 NpI07PCyW/DTG7E3Q9CuuCtE6cl9doFMJx0mlTp5GlI1ZpnLU3MOjS9m7t417E4E3OSWnvboN/Y
 9kL1Y7GzO8KvWhE9wmA7U6XOKfJxvAcNHyvmOByYo3PNUUC00JRo=
X-Google-Smtp-Source: AGHT+IHaNCMjhd44SlVTJL8Io/YJXCsr0wcdj+yfWlnEs2qWr8133S97D6OLT/9oiMTHDopQCZZ2wA==
X-Received: by 2002:a05:6214:485:b0:6fa:c5f0:bf57 with SMTP id
 6a1803df08f44-6fd0a587d49mr273331546d6.38.1750716596485; 
 Mon, 23 Jun 2025 15:09:56 -0700 (PDT)
Received: from m-kiwi.verizon.net (pool-71-167-25-61.nycmny.fios.verizon.net.
 [71.167.25.61]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6fd09425af6sm50019856d6.27.2025.06.23.15.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 15:09:56 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, ttabi@nvidia.com,
 bskeggs@nvidia.com, martin.peres@free.fr, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH 2/2] drm/nouveau: Remove nvkm_gsp_fwif.enable
Date: Mon, 23 Jun 2025 18:04:02 -0400
Message-ID: <20250623220909.7591-3-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623220909.7591-1-mhenning@darkrefraction.com>
References: <20250623220909.7591-1-mhenning@darkrefraction.com>
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

This struct element is no longer used.

Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h  | 1 -
 5 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
index eb765da0876e..35d1fcef520b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -41,8 +41,8 @@ ad102_gsp = {
 
 static struct nvkm_gsp_fwif
 ad102_gsps[] = {
-	{ 1, tu102_gsp_load, &ad102_gsp, &r570_rm_ga102, "570.144", true },
-	{ 0, tu102_gsp_load, &ad102_gsp, &r535_rm_ga102, "535.113.01", true },
+	{ 1, tu102_gsp_load, &ad102_gsp, &r570_rm_ga102, "570.144" },
+	{ 0, tu102_gsp_load, &ad102_gsp, &r535_rm_ga102, "535.113.01" },
 	{}
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c
index 12a3f2c1ed82..1b3b31b95ce4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c
@@ -20,7 +20,7 @@ gb100_gsp = {
 
 static struct nvkm_gsp_fwif
 gb100_gsps[] = {
-	{ 0, gh100_gsp_load, &gb100_gsp, &r570_rm_gb10x, "570.144", true },
+	{ 0, gh100_gsp_load, &gb100_gsp, &r570_rm_gb10x, "570.144" },
 	{}
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c
index c1d718172ddf..51384c63148c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c
@@ -20,7 +20,7 @@ gb202_gsp = {
 
 static struct nvkm_gsp_fwif
 gb202_gsps[] = {
-	{ 0, gh100_gsp_load, &gb202_gsp, &r570_rm_gb20x, "570.144", true },
+	{ 0, gh100_gsp_load, &gb202_gsp, &r570_rm_gb20x, "570.144" },
 	{}
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c
index ce31e8248807..b0dd5fce7bad 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c
@@ -344,7 +344,7 @@ gh100_gsp_load(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif)
 
 static struct nvkm_gsp_fwif
 gh100_gsps[] = {
-	{ 0, gh100_gsp_load, &gh100_gsp, &r570_rm_gh100, "570.144", true },
+	{ 0, gh100_gsp_load, &gh100_gsp, &r570_rm_gh100, "570.144" },
 	{}
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
index 4f14e85fc69e..c3494b7ac572 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -14,7 +14,6 @@ struct nvkm_gsp_fwif {
 	const struct nvkm_gsp_func *func;
 	const struct nvkm_rm_impl *rm;
 	const char *ver;
-	bool enable;
 };
 
 int nvkm_gsp_load_fw(struct nvkm_gsp *, const char *name, const char *ver,
-- 
2.50.0

