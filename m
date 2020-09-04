Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F33B25DF3A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 18:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D6A6EC7D;
	Fri,  4 Sep 2020 16:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB14D8997C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 16:07:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k15so7242198wrn.10
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 09:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s9z3Lxj3zSC/nTOfDdPH4GXZ9Y+PpYyQW23hCCaVZmY=;
 b=PW2sZUbASRAGYwaSgdedjDVJXpF96CEScDZIME+9uERmXTMT6H+8KluiCcAO/h9Cid
 XucJFMGHjT9Tlx9izJ552lYcxLis8krh2zcu3Ydf7eDIVK+iVLoEam5DlATCFlOEV5wd
 3xs8Bny3ig0LJNcZurtOCZIIXMIByKrHtftWVa/SKdIeBA9v3tDvsZ4OVeK7eDNRwXrX
 wxB7fsGPHFtDZnUSkdftPNQUQdTy2SNUU67vCKZXGJoIKI+tRF+rZHtv/Puc+GxeFe+0
 +KSF402HmDpWVgQx2dJaamKpy040RbFD6kbO8Baes8VOazOqrgpT4EsaH8ecz7zs/l2G
 lDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s9z3Lxj3zSC/nTOfDdPH4GXZ9Y+PpYyQW23hCCaVZmY=;
 b=h9vSwMfbPVtauNnCXXt3i42UpH6qI348CBUvYIqLE4W7Wjn7mdBropGg4L9HcmaEjn
 DItoFsM1ErPFMTYToHLhlTKb0jZxF0L+S0trJHxK/XehHNWmZZKgVmSKxPQVsIC8u54l
 vnptmiB9UAZ3BssF5XEud5uxxhX7zwDLT6VSLKmK1KS65NZ49sRIvQ05HEUW8Cjs4Ro3
 KuMeRVzFbifGpPUJZ54roB/+kmK7gvBRdlmVMZeVI56+KldxHPV1nbVe5lbu1dPAv/sR
 8Xv3jcyS288g+3ws2m+0ahGhyNvpuin50MhXFm0uHz1p4SJHu9k7VSUmh2ziQVND9sNw
 dYLA==
X-Gm-Message-State: AOAM533hoVYw/KhfzEflAm6pnKG9sCYt5TCmc957CiSYA80k4/3qZcGh
 97lpG5ye+IfaMI3tGin1w+EC+g==
X-Google-Smtp-Source: ABdhPJw5S+gQH6BLnQFqpz89tPXuQPoPvzY65cNp61qZFTPwp3Wylfj4G8TMpxFWOlbR+IW1X/MxcA==
X-Received: by 2002:a5d:4d82:: with SMTP id b2mr7989105wru.232.1599235629594; 
 Fri, 04 Sep 2020 09:07:09 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:4cea:81e7:5fd4:93f7])
 by smtp.gmail.com with ESMTPSA id h185sm12467609wme.25.2020.09.04.09.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:07:09 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 01/11] drm/amd/display: Do not silently accept DCC for
 multiplane formats.
Date: Fri,  4 Sep 2020 18:06:59 +0200
Message-Id: <20200904160709.123970-2-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904160709.123970-1-bas@basnieuwenhuizen.nl>
References: <20200904160709.123970-1-bas@basnieuwenhuizen.nl>
MIME-Version: 1.0
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
Cc: maraeo@gmail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Silently accepting it could result in corruption.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a025897e2962..cb31b5ed19f7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3756,7 +3756,7 @@ fill_plane_dcc_attributes(struct amdgpu_device *adev,
 		return 0;
 
 	if (format >= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN)
-		return 0;
+		return -EINVAL;
 
 	if (!dc->cap_funcs.get_dcc_compression_cap)
 		return -EINVAL;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
