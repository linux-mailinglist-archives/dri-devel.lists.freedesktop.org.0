Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AC94FE4D2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 17:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3119010E13C;
	Tue, 12 Apr 2022 15:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AB610E542
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 15:35:35 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id g18so12013320wrb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 08:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VwOMhba2UBHTBdEcSB8ubF3LHDfdwxShkl2jYJGZwac=;
 b=eOj/bw3wwAIvAAhbgxLLgJ4/I/SsQUTJzUpBZOu+lHI3PxiIDDh2QD0J+zLXJCjmkl
 ZYVz8u1gr1RshZumc1gkjPhBfi8L8H44zTnz91eV+IKEmbeYoYd1J5Runw81S3Xkp1LT
 fVb3+gqTsYC0g8fISFaLA6JkzfMfHKgAjVzhslR45IHvlQqFJ1tNe0MfLrAz1WXCmKeL
 kRPWw7XItDToIH5q/ALTcgDZBB3OcBTOBsWzW8UH/OPkZDCFOHwzRXFCVdhKTF3gtAdD
 xPRrAhzsmvFg1njgPt0rHrXJhi5qgcpFWiE1YO4I+yEev17rMyhp9DQS+ezm1CdsCGKi
 BEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VwOMhba2UBHTBdEcSB8ubF3LHDfdwxShkl2jYJGZwac=;
 b=SySb54etNMkb6yOJSmRj2EMF6lHC4m0X7jkFbVYgzzQiWmvy19waWihsiNQnhRFsln
 oZYNfldrMYlBSi6AJGN+Z+keOkd1BIbL4eKHXh/raoFDhUJFL/iTTJGo0+v8Bapc2yKg
 BIsR7apUNk6Zibt4Gqwu/taek/+r1cwgd8YVQrxiGRS39g00mKwR9WcG0yK0/3NN6EAS
 50I8z+BiVlUhRMevWrC7SZIHWRurdbpiDPkVsD/4YaNYD43zoIQmvR+K8gTwTa0MYoWD
 scchJJg5XR0JepkWhui2fOiG9nHEz4yTSsQg6mTPX2Oo4APhzsvORzoF6CHlOP5Ok3lj
 pqoA==
X-Gm-Message-State: AOAM532e+t4B9hV4QDQOo/SDg1UF8PLAS2qRqaIgiqgwJhF5E5w24OMI
 z2+2JxCzXi5KaI7x6sTDIv5nAg==
X-Google-Smtp-Source: ABdhPJzN2nIUAo8GyjwEfVrI6mSlaVgYt6CfZqC6FHc0/mqgZ//dokwgr/pWS9EpJGKuhyNrsXy7rg==
X-Received: by 2002:a5d:6dd1:0:b0:207:92c4:eaef with SMTP id
 d17-20020a5d6dd1000000b0020792c4eaefmr18208780wrz.498.1649777734319; 
 Tue, 12 Apr 2022 08:35:34 -0700 (PDT)
Received: from joneslee-l.cable.virginm.net
 (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
 by smtp.gmail.com with ESMTPSA id
 p3-20020adfaa03000000b00207a1db96cfsm8463621wrd.71.2022.04.12.08.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 08:35:33 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 4.19 2/2] drm/amdgpu: Ensure the AMDGPU file descriptor is
 legitimate
Date: Tue, 12 Apr 2022 16:35:29 +0100
Message-Id: <20220412153529.1173412-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
In-Reply-To: <20220412153529.1173412-1-lee.jones@linaro.org>
References: <20220412153529.1173412-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>, stable@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[ Upstream commit b40a6ab2cf9213923bf8e821ce7fa7f6a0a26990 ]

This is a partial cherry-pick of the above upstream commit.

It ensures the file descriptor passed in by userspace is a valid one.

Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index f92597c292fe5..4488aad64643b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1044,11 +1044,15 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct kgd_dev *kgd,
 					   struct dma_fence **ef)
 {
 	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-	struct drm_file *drm_priv = filp->private_data;
-	struct amdgpu_fpriv *drv_priv = drm_priv->driver_priv;
-	struct amdgpu_vm *avm = &drv_priv->vm;
+	struct amdgpu_fpriv *drv_priv;
+	struct amdgpu_vm *avm;
 	int ret;
 
+	ret = amdgpu_file_to_fpriv(filp, &drv_priv);
+	if (ret)
+		return ret;
+	avm = &drv_priv->vm;
+
 	/* Already a compute VM? */
 	if (avm->process_info)
 		return -EINVAL;
-- 
2.35.1.1178.g4f1659d476-goog

