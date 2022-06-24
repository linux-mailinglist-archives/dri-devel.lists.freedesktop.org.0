Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC125594B0
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 10:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C16112C44;
	Fri, 24 Jun 2022 08:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1141F112C27;
 Fri, 24 Jun 2022 08:04:59 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id eo8so2392621edb.0;
 Fri, 24 Jun 2022 01:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CVQLS1Q8p0L2oqy2feCuipYYw0Dn51iYeixzeYC0qk0=;
 b=diumkHDMGen9Vt3PpkuAbvqzWKQd+Xdn973nNKdfdCDDC0zTX2C6hvIxsHe2V7Hoc4
 IOhBR2vnm8dxvhsKFIBXPaolCk/OFXCBQ1WZCwL71kg8/Qq8WUQziQwUP00AOcwUcOGP
 rXTcnuW7puIRMcesyziDQyu7bT1G2aJvnhdPeFeaq+EwQpiHIGMo14FD4eE8URrxEDxV
 0m2ZDeucEfDeKkG17Nd8V6yPSz995Flq0dRdec0ubvhe6xb2D8xZHUXfzD0udY0tRU0C
 HcnFjUnQwXhFVgFVmkiIUcsMCluaFxgfHNgP1bHGOZQJ0mTg8yzEf2GVutNriYht8F60
 tNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CVQLS1Q8p0L2oqy2feCuipYYw0Dn51iYeixzeYC0qk0=;
 b=VNqcNj6revDChOlzSUl5dI/bQxdNazVE7lZDbJT0lrG0nmipXLYL04TVfqG2Pk0633
 cPAj304GX8KxraCuTt6uAR+Yw9MD55B9sweBfoe0nC9yq87Qml8w12ojdZwseWEg6jbE
 Lr0mRLKBIfdnNVdO4nYXH4eP9d+ql+dYj6qI3MLIlmGg6a+YMYp+aDPjN77acUTd6JJy
 h+5roHsZzjuHuMVSN6ui9kE6PB8uQ9Pqbm18iFmKhprUNJG7W1l7tOCF0PKQTFHlbzay
 5zOZSmDzmXBrXh6kDNnAlxk49Rb1b/ESAoagvnECD0tiPBUuuLNRvUsz7VzfLbw0lpBl
 gmIw==
X-Gm-Message-State: AJIora83xkXYw8AR4yN19MR0+oNEvV/1x0dCP4urLRYJRrAPybfkDqXQ
 LTTLObJNXD0SwcaYDSimTGk=
X-Google-Smtp-Source: AGRyM1usD8rMmmeAdvKoxrU4g0pKdJN3rPJZdiIs4qY40gFmdzYVGQwJIExPFW+J17A2KjUq7SPWiA==
X-Received: by 2002:a05:6402:4408:b0:435:9ed2:9be with SMTP id
 y8-20020a056402440800b004359ed209bemr15656191eda.81.1656057897642; 
 Fri, 24 Jun 2022 01:04:57 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a170906155300b006fea43db5c1sm697779ejd.21.2022.06.24.01.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:04:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 08/14] drm/amdgpu: use drm_file_rss
Date: Fri, 24 Jun 2022 10:04:38 +0200
Message-Id: <20220624080444.7619-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624080444.7619-1-christian.koenig@amd.com>
References: <20220624080444.7619-1-christian.koenig@amd.com>
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
Cc: mhocko@suse.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

This allows the OOM killer to make a better decision which process to reap.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 8890300766a5..4508791fe80c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2635,8 +2635,9 @@ static const struct file_operations amdgpu_driver_kms_fops = {
 	.compat_ioctl = amdgpu_kms_compat_ioctl,
 #endif
 #ifdef CONFIG_PROC_FS
-	.show_fdinfo = amdgpu_show_fdinfo
+	.show_fdinfo = amdgpu_show_fdinfo,
 #endif
+	.file_rss = drm_file_rss,
 };
 
 int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv)
-- 
2.25.1

