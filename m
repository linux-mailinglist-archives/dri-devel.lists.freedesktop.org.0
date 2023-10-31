Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2A87DCE0A
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 14:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B3C10E4CF;
	Tue, 31 Oct 2023 13:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8C210E4C9;
 Tue, 31 Oct 2023 13:41:08 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1ca85ff26afso10477705ad.1; 
 Tue, 31 Oct 2023 06:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698759668; x=1699364468; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o+E9JqwmhnjEhxbRIH2HvbjlloiERNKW1YLqGvHb+1g=;
 b=D4syMZn7N1W1PPQCByjy2pFqrbA40V8cx83GCamrQ9z9OtyL/7XmDUQOParJIOVl8c
 OSLy9YXCZIFse69UVRGuf9/+I/mx1+iThNiAlsjI2iG6hVYP3D2sMZSj6xE6mWmEnZjM
 gMODBWky9dQUur6jOjnBCrlBO9eXWkyrHR7QzK5Ook+BXf9IkUfV2aIJ0ZhomF7Hz1ji
 fLlKoJb9dmAz7aWHcDdnxhDhijyHnv40EIj9Ja2zY8gXA7mcuN6kj3Ej0W4Gz3/uRFDq
 1eyncbPqa/LP2z8EgqVVS6ap399PujShZK3c0/dg3ACCUlpXZBuQS8OfbnCo2WIkS8mt
 /gKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698759668; x=1699364468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o+E9JqwmhnjEhxbRIH2HvbjlloiERNKW1YLqGvHb+1g=;
 b=mSUESIM84hWgqXBjwfEyhQvQNrfdvfLpGUoHUWbs8oJaBEYl3qs1bdn1BVQCqcpEwm
 i/4dx0oUe/Qi9qcImxgPT0DbXKRupm/Nwr1/LxNFLBklnJomxLVpEKwVD63yFZNgQwcK
 XOsoqOJZZ5IWvGWc//xb5TNTYARx5ZfOvl7MMSgd5O2MgbK2Rj2O0Omd+6tCc+cTspS5
 06QCj7qxWHOvcaGb4Po5JH5ykTh4OKCjQOFHKcsYFHyCwLUnwJjBc1iDn9i5qCGxG6lz
 dhEzCbFoeu98titAvBX7xGaXLhEJdx6zMA1qeSj3ii5nTTdZak2MmFvp0um1Tw+EswN3
 ZBSQ==
X-Gm-Message-State: AOJu0YynH971funEAA8BPc9VVJyolX6Emv/Nb5tveJ6BxwEVwGQR8IsX
 MaIino6p3uIf866R98r+4rOyQBkZq7CxhdWM
X-Google-Smtp-Source: AGHT+IFxKiKSRFU/iDR2UL+tJOeZwpK6uNuPNA5/kg2HT+JKfty0Vxg3tkqkmwEjycGVVWXPErXG9g==
X-Received: by 2002:a17:902:c649:b0:1cc:3202:dcca with SMTP id
 s9-20020a170902c64900b001cc3202dccamr8878869pls.2.1698759667880; 
 Tue, 31 Oct 2023 06:41:07 -0700 (PDT)
Received: from localhost (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 jm23-20020a17090304d700b001bb892a7a67sm1341152plb.1.2023.10.31.06.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 06:41:07 -0700 (PDT)
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/6] drm/amdgpu: Don't implicit sync PRT maps.
Date: Tue, 31 Oct 2023 22:40:54 +0900
Message-ID: <20231031134059.171277-2-ishitatsuyuki@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are considered map operations rather than unmap, and there is no
point of doing implicit synchronization here.

Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index f5daadcec865..7b9762f1cddd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -902,7 +902,7 @@ int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	/* Implicitly sync to command submissions in the same VM before
 	 * unmapping. Sync to moving fences before mapping.
 	 */
-	if (!(flags & AMDGPU_PTE_VALID))
+	if (!(flags & (AMDGPU_PTE_VALID | AMDGPU_PTE_PRT)))
 		sync_mode = AMDGPU_SYNC_EQ_OWNER;
 	else
 		sync_mode = AMDGPU_SYNC_EXPLICIT;
-- 
2.42.0

