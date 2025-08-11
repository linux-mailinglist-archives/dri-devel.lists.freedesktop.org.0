Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF929B2178D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 23:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB42710E554;
	Mon, 11 Aug 2025 21:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="eOuzBlBx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8679910E553
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 21:39:04 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-70756dc2c00so63979906d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 14:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1754948343;
 x=1755553143; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZCIAkGeT2vZNSLCvoLyr3RnZmR3ss1FWHMBkfixBQwE=;
 b=eOuzBlBx7xhgVfImS9wH9zQNVfl4Y4t8Ed5oDWPPXVaLQ5pBKEFY+my/PjKpRLQ5NW
 CPZwnOyhZAvtsh15mbopRJFrE1vasBP/J/STByrrQ8BML57YpW4LByRBwLWAQa/48DiD
 f5fzFHE+mOYxck9yat9SAgpdGThKzvlDcD4y+gWYQBPgqLtF7cEoz8wUfy/XS6ujooOe
 HFIIeMnDxijphcqn6YwY0zILJ/srje9hSEf3ppszLWVQy75vA3a1S7FEt2ejs4HNpYRi
 ScOX+6/mX9dBqq3g9c7bHrggm8wrtFTDCS1L7zyBgE0AbNXq20E8farwq6X76UU4/cPn
 D8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754948343; x=1755553143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZCIAkGeT2vZNSLCvoLyr3RnZmR3ss1FWHMBkfixBQwE=;
 b=PPU3phvtBS8jmKtawTkxhdv8FUe088Qx4fNfiqtaKBBkQzfYmf78kNxYv+vhok5ETD
 cA8gSELANNcSf0CVdJkqAp4q4Ay36r8Yk53oaXMjCGOL1awCMchvIJRr4OGM79HEzZlQ
 +5xsz0dl9Kok6/2c3fA6b6sYKjwlu+Wj4QrHqz+fAzNVY4T0857nFNX9iBukqz7eoxVa
 BQx93Q+WnhwjMcUY7tENUayr7a+Ut1lS+dxH+bR0KUMRrfgr7OyuL1Xx7EA6Qd1i7Aaf
 ih6D1JF9T+8f6UHj1P1E55Sf/6NhKSlLv6yUUMruA8qEUGvaCBy7incMbhjw9VwZyt7n
 9boQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI9stXfwOoHXLkLSTdlJ5IU0FkGV5j3nnAY5FeBPjImTF+sdMaKU2ULOD6lTRyTgpqdON100KuZ7E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjAQo2jdYPNw5Ga0tsV9rhsOiBxZqYVGIR2DyEW1+OD5gqrqoD
 c+6qrtFqtveLM7iYKMfC4N6bPk7RdOfQhZ4JM1LUarkmuMDXaFr4J/5i7z2ywX85ZLE=
X-Gm-Gg: ASbGncvjCs7KRAYnozcjwO7TBk95K/iG9SKFmcuBq0T5Ka7repm7sp8hLJ03FJb5KfS
 YP4PlaPg9N4OhOLSPr0cakZFR/0GNP4AKaQiTi01Op1S5CIX7UfQqJARE1BDeVt3R0WYSozr3r5
 ngYLoqJDBfmMLMh4hXByshPjiPSwyVWFy1TMlXdzzkqhLfBRrpoTS9EKG1bJgHwJM1dbHGcnQp2
 K+2I0IN5IZliG4FPSkQe6yIG4sr9wM56A6NdMdMfeh+YHF33nwGrjAoS6QGjg/5ej9yWcQh7EJt
 LEPvO95otIMaCjSNSshoLX3xQtEK/GrY5MiGMi4/8Nt6Jfpe45jLa2DHTvC3hQJl1CWIbdWJATE
 KbOtHY1i61RhpHHnhutV900F1yUzOFEHeXjlSfgwpBUCNfjL/ipB1JLJJFj283NLdIYjIE8kSWO
 MMkwtqf1UqohaXgXc=
X-Google-Smtp-Source: AGHT+IFSw1YwtSXE4UQC4rL3iJs+44Dv+VefFzT65FxYokrpqoGKJ7IIaNC1jQljGNpJJZBzSRriPw==
X-Received: by 2002:ad4:5e8a:0:b0:707:451e:2787 with SMTP id
 6a1803df08f44-709d5dc3956mr23469276d6.28.1754948343585; 
 Mon, 11 Aug 2025 14:39:03 -0700 (PDT)
Received: from m-kiwi.verizon.net
 (pool-108-18-253-193.washdc.fios.verizon.net. [108.18.253.193])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077ca1d5ecsm163097136d6.26.2025.08.11.14.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 14:39:03 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, ttabi@nvidia.com,
 bskeggs@nvidia.com, martin.peres@free.fr, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH 2/3] drm/nouveau: Remove nvkm_gsp_fwif.enable
Date: Mon, 11 Aug 2025 17:32:32 -0400
Message-ID: <20250811213843.4294-3-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811213843.4294-1-mhenning@darkrefraction.com>
References: <20250811213843.4294-1-mhenning@darkrefraction.com>
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
Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>
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
2.50.1

