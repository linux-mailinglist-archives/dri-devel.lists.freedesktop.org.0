Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7C986E1F4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 14:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297C410ED97;
	Fri,  1 Mar 2024 13:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fwqlUhbv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E102E10ED96;
 Fri,  1 Mar 2024 13:28:18 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d27fef509eso27736711fa.3; 
 Fri, 01 Mar 2024 05:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709299696; x=1709904496; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5l7YTgHQJ4uu8ywnkoccEqji+CWQ03nsYaLhWI1QXxI=;
 b=fwqlUhbvfy38eaBrYb21kkK7GS878ooldnZ9/ZTY8Vjhyi9I7CnE6eaSKvVsRkZ9A4
 3dW3l9pQ0awC/SAfywmTNQYbanKtpj617arMCe96EDfNYgPY0gLKs0tk42nKMDkf5ymV
 GhfP89rPpEVLMNrVWHS6A2Yhv+06wcnp0EjGOprMO83Vi7MEz6326jrttB0gweVaDx6M
 rEef28pW+vE9xW2yFatJQ8nMC+ujj4vzvwL6XcqGJjpIo6n/Y9kibw/cfOmCcIqv+hu4
 ZF93MKQid6F/4dkum6ufKxOWy/FnmOe/LNxB/K4guWPHJV91ii4GmaueAvbaRrrZt71V
 NNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709299696; x=1709904496;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5l7YTgHQJ4uu8ywnkoccEqji+CWQ03nsYaLhWI1QXxI=;
 b=bc+4qknUCSiCHdrz55xMyfCHLMPcXWd2Vdz+WVJiob8uEbEF1dTJGPiyF3eTX0JCA2
 idGiwqcduXlCDJPoisZFDpIPJ76AEOnoU7EF1449j/8VY2LA63yt8GstwXirTjWKRUVg
 pRORICnGHzOHCd1fwPthdLebDPeKis08n+gWRk9NfmS0+w6ryr0UH/SyF9kyc3mJVpza
 L9XMXhqmqoCy2mFuhXrnMhJz4rgtRKIHW861gu0MUo0UhTae36dTu6s6IypuGy+WOVY2
 TVQqKaj+YyQHlPoDVySxH7NncOk+CH6hnD/7PvXKZdUYviJdzvISOJKl0Ks2x6R6S+FM
 uHhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVW2yHeI3Ar+qNpvWjFsFxz1MLtzjVw7YQCObdbYqZemLP0unktJ5NxcPEXP48ofDKIqJvkxgodp3S2oX5SEMCfSjmXrl/fMEZ8grEdwThWEZ8C3obAa4yvd9ZMs2lbdgqtnpKxc9IVYP6ufZLQ6Q==
X-Gm-Message-State: AOJu0Yz79utJQqwcr5tTdyjDfLyoWiW5bY7THEdjYG5hsQicZ7yETILk
 eAwuHVtV+aqeB+L6ab9lOMFy6eUhmHBud+63cvktZ1Jac5z50x9O
X-Google-Smtp-Source: AGHT+IHAEBq2eERb1YzHcNf/A5asZKhYcTLxJdEqg8fO6iB0nq2rpd2QfL9efFx0rYhM6arWjvOKVA==
X-Received: by 2002:a2e:a368:0:b0:2d2:a3ae:b339 with SMTP id
 i8-20020a2ea368000000b002d2a3aeb339mr1177503ljn.48.1709299695979; 
 Fri, 01 Mar 2024 05:28:15 -0800 (PST)
Received: from localhost.localdomain (80-108-76-242.cable.dynamic.surfer.at.
 [80.108.76.242]) by smtp.gmail.com with ESMTPSA id
 f8-20020a7bc8c8000000b004104bc8d841sm8317526wml.13.2024.03.01.05.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 05:28:15 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: tomeu@tomeuvizoso.net, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Christian Gmeiner <cgmeiner@igalia.com>, stable@vger.kernel.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/etnaviv: Restore some id values
Date: Fri,  1 Mar 2024 14:28:11 +0100
Message-ID: <20240301132812.15463-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.44.0
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

From: Christian Gmeiner <cgmeiner@igalia.com>

The hwdb selection logic as a feature that allows it to mark some fields
as 'don't care'. If we match with such a field we memcpy(..)
the current etnaviv_chip_identity into ident.

This step can overwrite some id values read from the GPU with the
'don't care' value.

Fix this issue by restoring the affected values after the memcpy(..).

As this is crucial for user space to know when this feature works as
expected increment the minor version too.

Fixes: 4078a1186dd3 ("drm/etnaviv: update hwdb selection logic")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---

V1 -> V2: Fixed patch subject line and removed not needed if clauses.

 drivers/gpu/drm/etnaviv/etnaviv_drv.c  | 2 +-
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 6228ce603248..9a2965741dab 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -494,7 +494,7 @@ static const struct drm_driver etnaviv_drm_driver = {
 	.desc               = "etnaviv DRM",
 	.date               = "20151214",
 	.major              = 1,
-	.minor              = 3,
+	.minor              = 4,
 };
 
 /*
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index 67201242438b..8665f2658d51 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -265,6 +265,9 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu)
 {
 	struct etnaviv_chip_identity *ident = &gpu->identity;
+	const u32 product_id = ident->product_id;
+	const u32 customer_id = ident->customer_id;
+	const u32 eco_id = ident->eco_id;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(etnaviv_chip_identities); i++) {
@@ -278,6 +281,12 @@ bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu)
 			 etnaviv_chip_identities[i].eco_id == ~0U)) {
 			memcpy(ident, &etnaviv_chip_identities[i],
 			       sizeof(*ident));
+
+			/* Restore some id values as ~0U aka 'don't care' might been used. */
+			ident->product_id = product_id;
+			ident->customer_id = customer_id;
+			ident->eco_id = eco_id;
+
 			return true;
 		}
 	}
-- 
2.44.0

