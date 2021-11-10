Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B12B44CB8C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 23:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA3E895E1;
	Wed, 10 Nov 2021 22:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2966E1F6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 19:36:37 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d27so5879129wrb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 11:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Z8SMunWQcnk6H7z0v7bcp6qKVk9GWG+Oiz8OpqEszI=;
 b=oXIysTlNVbQRqVPcfuFaK+8pnGVtAvR/go8VDsPZbXbW5IRK582fEcwaxvWkrVUkts
 6CvO/a6K4cVEdcVhI+g3uCdJEWfbM1jjpH3wn55zbMO85O1CaLALThPknDVyX6E/JYP8
 +wDF9Z00irYxSgWcn0u5TTF//8gXbJLRv98DwMozzFwWUA9ZEHeZfo02lG9sYfTETJuA
 QeG1Xi0dt8qbLwiFGl5x42+vjdhw9xt5Z7HDi9dzNhL83GQz/dg+um6DyVVPvNzlBgU/
 CDJBufGmQrvh9auLzKZSXbU+qLVofPHj3Vpq0iyoUekogBz89p7xWmFEnFIwQ7//eadF
 xh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Z8SMunWQcnk6H7z0v7bcp6qKVk9GWG+Oiz8OpqEszI=;
 b=OESOHT4dLrZ/eE1aIj+S8qn36nY/vELW9vBlyErxFZTzRKIik9YTtGuwBqK8qkciFd
 iVvYH213FYBoJkP60Ohe3qGu5Xf2bfOZ+bigmB4sLWj9Zyi6neQEdn5eCWac3X6G6uUF
 CxSSBZC6k4ESfHrm+9DBqfdxpI7NqZVjN5GgukVmSZM5khviqGLM41jkfh9ixZYLjy3D
 2J1TYSy6dmN/+v0s+c55NIe4R2bvLZCnwFb6SftZzsYFRnKXeF4GaDrEx8cm/x0xrR2z
 p2d0Gs4mu9EkMJeNBbCLleMahmtBkRIqW50UE5o9UNF33KwIja3iG1iDW4KgAwrv7Ap7
 vowg==
X-Gm-Message-State: AOAM533TCFepJuBrfVkCNKinRlotwMAkHvVsACCKAl1edSPEu4KarmlE
 lTx36alvqiB+2+VYj+RQc/PAx+FI4g==
X-Google-Smtp-Source: ABdhPJyEPqNej1qS/wX6Ss4Bd6tM6SnB5Dz2gtv4liSwPZVQZWxIX1ItETpYJTswugwKLMv+oNRcZA==
X-Received: by 2002:a5d:534b:: with SMTP id t11mr1807334wrv.75.1636572996346; 
 Wed, 10 Nov 2021 11:36:36 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id h204sm650777wmh.33.2021.11.10.11.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:36:36 -0800 (PST)
From: Colin Ian King <colin.i.king@googlemail.com>
X-Google-Original-From: Colin Ian King <colin.i.king@gmail.com>
To: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/v3d: pass null pointers using NULL
Date: Wed, 10 Nov 2021 19:36:35 +0000
Message-Id: <20211110193635.312328-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 10 Nov 2021 22:06:02 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are a couple of calls that are passing null pointers as
integer zeros rather than NULL. Fix this by using NULL instead.

Fixes: 07c2a41658c4 ("drm/v3d: alloc and init job in one shot")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index e47ae40a865a..c7ed2e1cbab6 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -774,7 +774,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 
 	if (args->flags & DRM_V3D_SUBMIT_CL_FLUSH_CACHE) {
 		ret = v3d_job_init(v3d, file_priv, (void *)&clean_job, sizeof(*clean_job),
-				   v3d_job_free, 0, 0, V3D_CACHE_CLEAN);
+				   v3d_job_free, 0, NULL, V3D_CACHE_CLEAN);
 		if (ret)
 			goto fail;
 
@@ -1007,7 +1007,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 		goto fail;
 
 	ret = v3d_job_init(v3d, file_priv, (void *)&clean_job, sizeof(*clean_job),
-			   v3d_job_free, 0, 0, V3D_CACHE_CLEAN);
+			   v3d_job_free, 0, NULL, V3D_CACHE_CLEAN);
 	if (ret)
 		goto fail;
 
-- 
2.32.0

