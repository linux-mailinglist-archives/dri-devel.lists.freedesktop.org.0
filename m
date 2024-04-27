Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3148B4A9C
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 10:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7F110EBDA;
	Sun, 28 Apr 2024 08:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KszO7dx3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDA21128AB
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 10:56:52 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-41b4ff362a8so23351535e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 03:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714215411; x=1714820211; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+eFDm3KuBw3qOZlg4Y3o5bK75ucHTSb1EXTpYvuYuyI=;
 b=KszO7dx3lO7+w4L12H2794iW/CwV8ZAM7tWt21oRwsrnBs2oDccNjCXbcayF/jgSWb
 BiQBhTDBxYQUW8FUG8CtKbCzKGOvMKmNx44WYHv5MZrvkQThYLZGXBNyEH1bQo1AKNYy
 x/B2bo5ePQ1ALaGGYOA3A9cuuICMEn0EkflvWvmAU4KBEY1lmFTdkyNZTJGBcxV7U7VT
 lNuDbwy6ZzM2PlVkBypuc2qYDxX6fVDc/cjZ0tPr2L7uIPa+5JbuPLyCq0+vkAFJ4N6Y
 SccS4QsgZlKYFtoET4RxpxQKpTtLUk6kux+RDczTHramOBNH7fbDrUmCaRkTLaS/AVbO
 lWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714215411; x=1714820211;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+eFDm3KuBw3qOZlg4Y3o5bK75ucHTSb1EXTpYvuYuyI=;
 b=v/S6idgqvj2i5W3sHiRLsnAVv2u/jUDdRtJOmDN5P8YJV/g3xOJsHoTu616ZdFF92a
 fF5EgUVYqZthRSjF5hf7F4xfz/sMLHnA8xy9D/qlIM1uDKO3dsaFkHAMNzhha9MIUPUI
 orlkFc8eu+aZkKEdLf7M8vquPuyhC6Ivdhk2NWHiGGG3OCImpvDQQvFRg7284vhRnkRR
 rrDL9etEt5MnZHASEgMNjOlgRKxS9HIbx8TNGK6/Ic0auu1V8OnI+hUKF4cyU00gHfTh
 NsshJ4DkMmePD9AY0YO3mAv9tqxHDX3TbAd/EiNL7pni+TiqsRhjNllWSozdiM9GhgF1
 CR/w==
X-Gm-Message-State: AOJu0Yysd7IOPQty8l57UtJ4FsoiKTmPfTqnmeIiF5Fp5i4EwnJAS9ho
 nbWY16U/Sol2VaSydrcEk+R2gkgY7d/suB0DFLwtlS0FgUKsmsEADI9HHw==
X-Google-Smtp-Source: AGHT+IFJTUm5wc1Hw2VSkKFSvnPAXqFsYX7+XPBDAltAjAomayv1kFP8BOqX+9UIPg5cP8qzxCPsQQ==
X-Received: by 2002:a05:600c:198c:b0:415:540e:74e3 with SMTP id
 t12-20020a05600c198c00b00415540e74e3mr4516356wmq.40.1714215409834; 
 Sat, 27 Apr 2024 03:56:49 -0700 (PDT)
Received: from fedora.domain.name ([156.208.164.28])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a056000018300b0034c91903c2bsm1787217wrx.48.2024.04.27.03.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 03:56:49 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: airlied@redhat.com,
	Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [RFC] drm/nouveau: use tile_mode and pte_kind for VM_BIND bo
 allocations
Date: Sat, 27 Apr 2024 13:55:47 +0300
Message-ID: <20240427105547.10752-1-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 28 Apr 2024 08:07:30 +0000
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

Allows PTE kind and tile mode on BO create with VM_BIND. This is needed to support modifiers in NVK and ensure correctness when dealing with the nouveau GL driver.

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index db8cbf615..0da0b5286 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -304,11 +304,25 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 		}
 		nvbo->page = vmm->page[pi].shift;
 	} else {
-		/* reject other tile flags when in VM mode. */
-		if (tile_mode)
-			return ERR_PTR(-EINVAL);
-		if (tile_flags & ~NOUVEAU_GEM_TILE_NONCONTIG)
-			return ERR_PTR(-EINVAL);
+		if (cli->device.info.family >= NV_DEVICE_INFO_V0_FERMI) {
+			nvbo->kind = (tile_flags & 0x0000ff00) >> 8;
+			if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
+				kfree(nvbo);
+				return ERR_PTR(-EINVAL);
+			}
+
+			nvbo->comp = mmu->kind[nvbo->kind] != nvbo->kind;
+		} else if (cli->device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
+			nvbo->kind = (tile_flags & 0x00007f00) >> 8;
+			nvbo->comp = (tile_flags & 0x00030000) >> 16;
+			if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
+				kfree(nvbo);
+				return ERR_PTR(-EINVAL);
+			}
+		} else {
+			nvbo->zeta = (tile_flags & 0x00000007);
+		}
+		nvbo->mode = tile_mode;
 
 		/* Determine the desirable target GPU page size for the buffer. */
 		for (i = 0; i < vmm->page_nr; i++) {
-- 
2.44.0

