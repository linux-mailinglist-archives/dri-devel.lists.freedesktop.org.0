Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C5C63C8EC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 21:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3C210E387;
	Tue, 29 Nov 2022 20:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6444910E223
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 20:02:57 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id 62so14001996pgb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 12:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oVxl8G3vAtq5mJZNn3p6Nl5YUEEXKLYUFCsxfarFtXc=;
 b=F+s++DaJ4sldRIEiCojdUgWz6k5RPsplDj4ODUo5IlwzxOaMDu8AUzcf3JB1x2rIUq
 kh9aAlbhS7FVhtzEaeirIpbhlmSKXAXGWQrj7B+kZbDGgOX6HcXMl4gjrmSqLFT2btgJ
 YDJpmHR1ggBLhYY29kYmk5fLIwON13iTgpQg2dQj/l9F32E0v2fAJ+nd1bT+we0CgqFV
 5x85SiAPV4QHcXqAppCO/TH0Ap6/JE3vWw4Me3FbxVO11B61vrafxNrNWb5xd1Kanjrs
 cDCdq2/hTrJmIoyaBC1oZYMgUjy2LpnGiVuN/9KOzkBzgXLF9chgpjtCUKCBVeyU5Yyi
 0XiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oVxl8G3vAtq5mJZNn3p6Nl5YUEEXKLYUFCsxfarFtXc=;
 b=Mb/6iTWk9CzaQpNpj0s3tLKKRhPFa+6febWnij4nDAlYVWsjgaXYVLr6IAsk8INHl4
 96fJfZbLjmLdbHyDIKRX3UVoUxvCS9ATsFvG8KHkqcaf/B5aHA+UU637KHx638EWrX8A
 8n8yToONEkQSDGKnYxFni0N3eRbwZkYJMcoKcUHwhlslsvaDxvU4OCSLLPZMoKZm8Bii
 fwKUMlJuVJrPsIdiVNaWTnbRQAeHilLxzFaXeTCrh6bKyEbSOXp5VQNjEnC7Cugp8Zv8
 jqrqzMmUlUzZApSNNEvvFlA58dS11HaIu9nWphL5MnPpIcvfQj/5lkI/U4dzQxbtdpIz
 uoEg==
X-Gm-Message-State: ANoB5pk40S7OMspcJGSf23ivMkrdoVmbmLeygd8TaodKqrj5nIR2okp1
 OX55BSZIJkx0S+Biiz2smaqYE3fNPkE=
X-Google-Smtp-Source: AA0mqf4ecb3iEcndqk8sTt5tbiiiy6NU4qulFX8rCv8viufcaHtiTxFmnJS+pEfXfrkiCbx/9tLSGw==
X-Received: by 2002:a63:cc48:0:b0:477:5515:8a9c with SMTP id
 q8-20020a63cc48000000b0047755158a9cmr33292439pgi.256.1669752176739; 
 Tue, 29 Nov 2022 12:02:56 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a170902d48a00b00188a7bce192sm11269560plg.264.2022.11.29.12.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 12:02:56 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/shmem-helper: Remove errant put in error path
Date: Tue, 29 Nov 2022 12:02:41 -0800
Message-Id: <20221129200242.298120-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129200242.298120-1-robdclark@gmail.com>
References: <20221129200242.298120-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Eric Anholt <eric@anholt.net>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

drm_gem_shmem_mmap() doesn't own this reference!

Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 35138f8a375c..110a9eac2af8 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -623,7 +623,6 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 
 	ret = drm_gem_shmem_get_pages(shmem);
 	if (ret) {
-		drm_gem_vm_close(vma);
 		return ret;
 	}
 
-- 
2.38.1

