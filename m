Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D72E4F5729
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 10:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371B310ED45;
	Wed,  6 Apr 2022 08:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186BA10E05F;
 Tue,  5 Apr 2022 18:24:56 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id d5so24723534lfj.9;
 Tue, 05 Apr 2022 11:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yax7P8EHkvsWnyvnaOpe3ZP8r2G7HKN+i3pXtBsfClM=;
 b=ahjOaaJmEvTMuw04XfKy8Q/jCeHjGJeiKqvnNpxDiZbgbug2iTCIFR8Le7QuzbJ0sA
 woMR7Bdoa2OJ21AmrWpJ9wf5UeYzp2npgxgZT+buKF6ZPXRPo7D1odBGOr2gDXJBnEo1
 dkWcurhuvdFNP8Dk650l2JhDA0fOvj008COWZUoCNgTJfeq4MP8RN6j7rsMKr8OLgz/g
 +REZDqGSM3Il7wPm+eIG3XRLQMRqOgjGT9K2/gEEyEEZPbgRlOUmBBozA2zAXYVf2nhK
 G8VsNSrxXA6MnMp6WQTrLd05UsiB5sx51uWWPhPAVm2lr97Bkt0pI2fpK8iXvhS5wgCO
 +jfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yax7P8EHkvsWnyvnaOpe3ZP8r2G7HKN+i3pXtBsfClM=;
 b=xUGDpQwdPnpnMGKK1KtWu/4HXDc+yoAbBtVifOoZ08K9SKf+O1aJG51NeW5CFrLhBF
 BRx8cpASRsn1+rYmla1elJtUjF/VkpgS5/yTDfoMGE6f6/fGN5YTHfeU/E3nCr0fZrii
 nwtnaq+CzZvMzPRB3Rbz8WHG/07S/A9eM80WPjmvAp0BWc4oc0W3cq9mAKrSbZFp4aAb
 NNMDzZsqzkehtlYvXfax9ds6sBrbX+I182ci/eWIPves3aplFjbailrAivvIffMJXk3X
 uEOLzNH8S9gSnKkl4x0l5WtGhcZI1DWfzHYCMsW8l59iWM1aQnFqvcjsG7I+KQrvTkOc
 orXQ==
X-Gm-Message-State: AOAM530cD/pzDg11zFeh3bXw+0acH5T14CpGO8NC9+6G2TrS3XRj9DG7
 6zUcaxq4886aEwQ0bmU8uHs=
X-Google-Smtp-Source: ABdhPJxOhepnKOoKA4RqwLPJjMXDoxl/v8mx8vWmtqquCH1q7VX7Pr+WalSB0nHIR8npx8CG+gkjhw==
X-Received: by 2002:a05:6512:3988:b0:44a:f02e:f28e with SMTP id
 j8-20020a056512398800b0044af02ef28emr3627503lfu.458.1649183094333; 
 Tue, 05 Apr 2022 11:24:54 -0700 (PDT)
Received: from noname.. ([2a02:2698:8c2a:226e:6d9:f5ff:fecb:a8ab])
 by smtp.googlemail.com with ESMTPSA id
 bg19-20020a05651c0b9300b002497beec608sm1422452ljb.87.2022.04.05.11.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 11:24:53 -0700 (PDT)
From: Grigory Vasilyev <h0tc0d3@gmail.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH] drm/amdgpu: Accessing to a null pointer
Date: Tue,  5 Apr 2022 21:24:55 +0300
Message-Id: <20220405182456.8798-1-h0tc0d3@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 06 Apr 2022 08:00:38 +0000
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
Cc: Jani Nikula <jani.nikula@intel.com>, Jiawei Gu <Jiawei.Gu@amd.com>,
 Grigory Vasilyev <h0tc0d3@gmail.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A typo in the code. It was assumed that it was
possible to shift the pointer to sizeof(BIOS_ATOM_PREFIX) - 1.

Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/atom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index e729973af3c9..be9d61bcb8ae 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -1426,7 +1426,7 @@ static void atom_get_vbios_pn(struct atom_context *ctx)
 
 	if (*vbios_str == 0) {
 		vbios_str = atom_find_str_in_rom(ctx, BIOS_ATOM_PREFIX, 3, 1024, 64);
-		if (vbios_str == NULL)
+		if (vbios_str != NULL)
 			vbios_str += sizeof(BIOS_ATOM_PREFIX) - 1;
 	}
 	if (vbios_str != NULL && *vbios_str == 0)
-- 
2.35.1

