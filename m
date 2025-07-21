Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3BDB0CADD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 21:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190AF10E5B2;
	Mon, 21 Jul 2025 19:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="C4q3s2YJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2236110E599
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 19:12:33 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4ab644b8dc1so52299681cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 12:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1753125152;
 x=1753729952; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZCIAkGeT2vZNSLCvoLyr3RnZmR3ss1FWHMBkfixBQwE=;
 b=C4q3s2YJ0QAk3J0oOCx+AOCeXAuStvdXh39ZePtb+wFYFPkpDmiFWnIGSwdpP6cCB/
 6o7owhf7h11rVbhxzE6cSmD5kLtG8eNS7ccl6K20L/eqIZZVXc17ZkG7xtuPAwIiPrKn
 aXmjGKYewUjummLJdS3y3ve78nzP7UKqPhh5YLsXaNK9/pitZvW2clkF8FjzPa1rANW8
 8TnjQAJSKsTcyJVf9/qOCaXHd0tue60l646sUETqXMPMwM0BmfpiCihkhzga3UNMpZbR
 j00kFs+L5T+n8Pe4uvmIEg7p/5036P2wLxH2l/kK+VmdSVXggRN9ZlFUtEd5njt2oyw1
 BF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753125152; x=1753729952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZCIAkGeT2vZNSLCvoLyr3RnZmR3ss1FWHMBkfixBQwE=;
 b=L0+G8aSL6VXWZmjhLfkj0PygCF4ApcHKf9nj5e34YftgABhDg8hXbGavVSPxOX4maw
 mrbdYIR5Z6SM0KCGruiuvygGOCknRIIT/F+gkiBYoGrmlBvYhAs6jswWblNULoFiHpxT
 4W4rDwkdMNq0ZSDs8RRfSvzdl9Ozk0PnS7OUzzUm2rYNZrDvfGGOqGX7FNVaOm53OORx
 v56vno8Mox1ykTKQnLArp5ARWu51V2LSuSjuLsIKPnQydl8xa5J32IKwbzY0G+/vDd7R
 QhFyDDAOqv+CUW+x/zSo24HaUZdD15S/v+rwh14kyue4k/kCQ0K3DAKBn+KKO/mEHzEN
 L+UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfhWR2eomPG/DegTLb1vQJ4pmtJxBEHs0ioBdpV57k1xNYlXiQ3cnNGym/lFBDaJTcQtYjrlK3WOQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdktO8eG5onMgL3ObmFszWPwrdQjwPcnq4s3uwrJiCEs0adVuK
 wd6LJ6pIEThYOEYIChwYIrybeGXmDz0tFYeqLLgBh+NOM9L3QVOf2NQg+890EPZdbGs=
X-Gm-Gg: ASbGncukbrGuqWE0+70n3EpONeDnwje2EIhX+q4PoPhkYdab4tkl2pJHMKWhaaq5LIE
 Gwat00YKi3rRXNnr3NLCeLmZLTvX6oSgSO0tkGraazic/fWYysrebW2WzEubclP5Kjkk9TT2kYi
 ZyU7PjAqoXWI3RrGM1Rp4W+B67+BCPmqp6X+yCBLtj5Hmz90kflBqVg+csQOnW1DQHCtuHQ5iIl
 LtmejeBB56X+YOOXnioIyMQjH7aHXpg7QL70+w1dQORK0UMNpZhbtgmipKYSSYp/oT6uRoRLvTj
 Uqfagmb6mqugFBnDCxWtH7Qt0F001ot5gBqWLL5QOU1mscsbsvA8RfJGtzGeaKzjQ7R63JN2loH
 jzEZBSIfhOJbVxRhn1FtI1ghw4Zo+PKNIH0yp0SYf2g==
X-Google-Smtp-Source: AGHT+IHkZUZkTOi69F++Y/1KJicoC+apOocBScgWrqIdi5vDnkk7z9jiGPYgbArbHjTfiDfgp2eCcA==
X-Received: by 2002:a05:622a:5806:b0:4ab:6488:38b6 with SMTP id
 d75a77b69052e-4ab93de8aaemr297306211cf.49.1753125152190; 
 Mon, 21 Jul 2025 12:12:32 -0700 (PDT)
Received: from m-kiwi.verizon.net ([108.27.160.38])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4abb4b24930sm44626211cf.51.2025.07.21.12.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 12:12:31 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, ttabi@nvidia.com,
 bskeggs@nvidia.com, martin.peres@free.fr, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH V2 2/3] drm/nouveau: Remove nvkm_gsp_fwif.enable
Date: Mon, 21 Jul 2025 15:09:15 -0400
Message-ID: <20250721191214.19800-3-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721191214.19800-1-mhenning@darkrefraction.com>
References: <20250721191214.19800-1-mhenning@darkrefraction.com>
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

