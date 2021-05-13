Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A5D37FC4C
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 19:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB8D6ED95;
	Thu, 13 May 2021 17:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7562E6ED95
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 17:17:46 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id c10so10468081qtx.10
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 10:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vtcWXueKeAtIy7pr8ysMAsDhI84/bQavYtJj4cDVdxg=;
 b=XJaZw0EIaBW/QFexRuVnVyBbRmNCRJ2gJtFJ6vLkDp4n14A1Y6bWlnc6ZR5L0DVZG8
 X75BViMl3jg4gOdBBtTGwgtYR37li3MzpCTRnm4m3LethmNnNqUrSEiPqoNwpFesXGXa
 hiuTiCGqUi4uwNJ5OVf3Hb7AIFgT04OsRO3pbLxgXV8V1DmzxGWtTd7CW7gOu+HNit8O
 Vrtrw99qFaE/aTAlcrUJEvBCPWqEcbID/UNmgAJ7Xh854aSdDAPZ3/RtFS2brZ8+j+/l
 4TbzE1nuVZnx/kaMKcAOqL8g8K9ShjvQecZ4TLiyWIHYSuZ1vCVClO+C1JCVfKaKE07N
 e0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vtcWXueKeAtIy7pr8ysMAsDhI84/bQavYtJj4cDVdxg=;
 b=JLtB1FRuEK0UcX7MuBMYVjohPWZSjydc3dz8tz/UTmMA4siRqYjpkBmIdwhPmVa7Qh
 jBbyv2dwfZz7rggT6xQgvRp6J141LuQsDuUc1y2QJs9o8LBg9v2jx57DuA8/nf+wVB9I
 yoGIrY4laaIqRR6fcYdLtaxoipcfgnaS9YCmi8Mf+HdUrH+F1hqrV4n7Nl5OwkCFGuvD
 1eDb4pnjLSkpCGyqGCEupkoAJRBgejwCDU3jr84d1C2ZeFsFhQydTdD5DN0uP2XVIj0D
 q2hc8sOphRO4mRjriLxl0xx1X2JjDBthtc60brBzi0KUpYbVXwuTtHYRK/v59L60LiWj
 eX9A==
X-Gm-Message-State: AOAM533Ux35Gn0b0gpoTsgumVXMnWedAcQLJ2++jvdnH0QrsFxjBXwMS
 4L5M6n2qdvExz8t3gRAdFbbgnQ==
X-Google-Smtp-Source: ABdhPJzvUuhCGoKvD75q243OUY0ynqEWiKx0cDPEphR/pkhflStoU/KRIs60dR7Z4UpNDm+m3/n3DQ==
X-Received: by 2002:ac8:6d31:: with SMTP id r17mr38430161qtu.295.1620926265600; 
 Thu, 13 May 2021 10:17:45 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id f132sm2971117qke.104.2021.05.13.10.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 10:17:45 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 5/8] drm/msm/a6xx: avoid shadow NULL reference in failure
 path
Date: Thu, 13 May 2021 13:14:00 -0400
Message-Id: <20210513171431.18632-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210513171431.18632-1-jonathan@marek.ca>
References: <20210513171431.18632-1-jonathan@marek.ca>
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a6xx_hw_init() fails before creating the shadow_bo, the a6xx_pm_suspend
code referencing it will crash. Change the condition to one that avoids
this problem (note: creation of shadow_bo is behind this same condition)

Fixes: e8b0b994c3a5 ("drm/msm/a6xx: Clear shadow on suspend")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 909e3ff08f89..ff3c328604f8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1284,7 +1284,7 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
-	if (adreno_gpu->base.hw_apriv || a6xx_gpu->has_whereami)
+	if (a6xx_gpu->shadow_bo)
 		for (i = 0; i < gpu->nr_rings; i++)
 			a6xx_gpu->shadow[i] = 0;
 
-- 
2.26.1

