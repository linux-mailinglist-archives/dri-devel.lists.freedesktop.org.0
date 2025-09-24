Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B01FB99698
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 12:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59E410E22C;
	Wed, 24 Sep 2025 10:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bphgnwtf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FC010E6DF
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 10:23:00 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-46e1e318f58so16279945e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 03:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758709379; x=1759314179; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2SZhlVPPd52n7ONt3JZoUJyYMwjtJvsP+AyT6HZcYJQ=;
 b=bphgnwtfVgPMcrNPkShLLNSdn0ridJZWHY5XvkkG8XsnkjlTO4h47OUWZg3YDQolRx
 HYgCb8Iqyh69RWcm1C4AjFoKrDUYXDQxE9PhaFKvj7E5kdUe/veqVfIdvX6fPBob+MLp
 tHbgR0XYo/aBFnYHHMKBoTwdbpNLYD2Aa22RMZBfRZ0a6l6JvARmm6Oxpf/iJhDTPXLu
 iEiOee5RDxoEs//3+/VuNBAD+QH8qNag/bFYt93+7hPdRP+YTRBbbAQiHhk9h7H7XMHF
 GypwH6aIlasKlBiwF+VkpL3gDEFPs1fUjoFWjHzxo35pQMZfcOwvz8LvLxr2EFKW/lPf
 lJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758709379; x=1759314179;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2SZhlVPPd52n7ONt3JZoUJyYMwjtJvsP+AyT6HZcYJQ=;
 b=llau3coNDG8qpoi2z77RcyP2/T5rvCZLsVJ58ZHp8Nh/2xB9epx7XeKz/UMm7z5xYs
 JamEHNcnP3wyTQS2xkkZbrLz028XZ2RslwK5FYjZb5Liz7ypm5pc0C0xXLk4rgBxLhKX
 cK2ksSypWsCCTgg056qffXLbH8p9btf70hLdQ/FFOL3DEegHOrtP8qaoyTwsVRm03ovI
 ks5KAX4FZPJZBeQXdFiq0zMVe373E5QaNkeUB/bdr7zicwtc6COeYlww7GgOxdofD637
 IrMQNqpe6vOgTGBVdXEw/eFWmYvW6WtOckT48rVfnji5gJsNEPMTAIMFq5Pe8HhXIPfF
 PH7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVReLiI0W0/4N828wwZJWfURxeuVvUUvLsoqpbyw1k6cd3efa7PrrB2x/89xNGWEm2G1NmaSnfZj3E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqVMphmXKpKd4dl2rmL+PBxQ+5q+STStlOPp2eFhXAs+W/sg9W
 hrAvGUjxAjeDj6MyeK21WZJRmBXmfN08PamkH96rHwHyfoId/Vpe1MDC
X-Gm-Gg: ASbGnctKNrtXfUsizFxAFIRPJmaJN0z0WEGBdGwHyNqONmWfLfqT4FxNOObPkNOD2Zx
 6ApQvLnpwI4618ztQygQ8rTCV0Co5yMqXvVbwpmVIBFQ6ZXlaI8hjQWK6fUKYVJhNDpYzk63qCE
 cZqovGhTH0JnTMyuiqIENfRyH3pdHtZtDkylvV7zNn27LSEw+IRwV38zYuJoWQXfaoDxUM/PajS
 34kJfL1bUUDwWff4Ce6Cb1z+5vj5FPnSiaXktU2vA95fY7s3B9ZuqjWj61zfUYowFF+Vb4dlJGS
 tjet9ekkGRByiBFDauKaoLhLiLPdhr6TokgEbXN7qHowXfxgT8MbYJTu33JL/MdiZh8mqLnh+hI
 kJ2mXmFQI91JM4ocXPFZd1g09AzQ5WY/f
X-Google-Smtp-Source: AGHT+IEaxHf/2iRwwqfoIfQ+Znhm/drcILF6bGn2vT3pOma/+G7W3dJJfRF76aIPViePMXlaIdlZhw==
X-Received: by 2002:a05:600c:1d0d:b0:46d:fd71:f69 with SMTP id
 5b1f17b1804b1-46e1d988de8mr46724395e9.14.1758709378513; 
 Wed, 24 Sep 2025 03:22:58 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-46e2a9b6e1bsm29341975e9.10.2025.09.24.03.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 03:22:56 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Badal Nilawar <badal.nilawar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next][V2] drm/xe/xe_late_bind_fw: Fix missing initialization
 of variable offset
Date: Wed, 24 Sep 2025 11:22:08 +0100
Message-ID: <20250924102208.9216-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

The variable offset is not being initialized, and it is only set inside
a for-loop if entry->name is the same as manifest_entry. In the case
where it is not initialized a non-zero check on offset is potentialy checking
a bogus uninitalized value. Fix this by initializing offset to zero.

Fixes: efa29317a553 ("drm/xe/xe_late_bind_fw: Extract and print version info")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---

V2: Fix identical issue in parse_lb_layout that I ommitted in the first
patch

---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 38f3feb2aecd..8f5082e689dc 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -60,7 +60,7 @@ static int parse_cpd_header(struct xe_late_bind_fw *lb_fw,
 	const struct gsc_manifest_header *manifest;
 	const struct gsc_cpd_entry *entry;
 	size_t min_size = sizeof(*header);
-	u32 offset;
+	u32 offset = 0;
 	int i;
 
 	/* manifest_entry is mandatory */
@@ -116,7 +116,7 @@ static int parse_lb_layout(struct xe_late_bind_fw *lb_fw,
 	const struct csc_fpt_header *header = data;
 	const struct csc_fpt_entry *entry;
 	size_t min_size = sizeof(*header);
-	u32 offset;
+	u32 offset = 0;
 	int i;
 
 	/* fpt_entry is mandatory */
-- 
2.51.0

