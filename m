Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 779DD63D13A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 09:59:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A30810E424;
	Wed, 30 Nov 2022 08:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFB910E07A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 09:45:59 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 b13-20020a17090a5a0d00b0021906102d05so11374594pjd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 01:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ko+qbf+b0Yv7gj3x+dmqgXT2t4VmwkOjBb0uMWb0qeo=;
 b=QMTGc8dATSuNa3qa2tdoi28432ZIGdXhepGsvXVGCtpTOLz41a16mSV6pjjVIeEsO9
 PJrhktRoFkYYeAO5E8N+9SXNKvsJBnpVmZY0oDEWaVJ4nC37dthNqFz+2bX0NyoPb7ji
 D3/HxVLjkt5GkrZw/CysGVyK3EGEpKo/THJR8Y4wpL092B6BWaFSmqNMjXwB4mWqoEUN
 jR4GhjSo6zgxjIkYcZt9OQr8ijnL/KwAbKvTjac/uMZE1ZFsFmqlIY33esnYdKCmgngv
 BTvsjNSh5Vp/JawszvH9dXG0Y2xfdA0UHyun1wvwR0r5/DDXMLHnOiXxFgnUwonl+OPZ
 ecjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ko+qbf+b0Yv7gj3x+dmqgXT2t4VmwkOjBb0uMWb0qeo=;
 b=yIw3L2a0fTHlyZUb8s6vTjNNJAimcsBRtijPm7AlkB/GSygGKrKFokeVuCpI1dmQxD
 qR/tDDlDhwcyhnktZ0f/75uo/TlAyazneUsixug/ZqMhvponDuzUyJf+TiSCI7uWgTQr
 VeQPZ+r73fdTf4IhwYFSFJI+yD1mLvVEz5TePJniqSTUq+qg3O03ILRBhcWH7eaNd35t
 DVxChpte40Tp/C7d1lYiaR98c/lG0/6kSDVquTDHXDws/UPyu2byFhyy8EH9AzvkjUMl
 KS3zrBkVDPSy/uv+X5cPdDIpPqhTzEK/HygGG+UkjSjiFblEZ/FpXfaxBOESu/0u1I/S
 ae9Q==
X-Gm-Message-State: ANoB5plt5u+vkKR5ny43adVc/9EZJL0IczEOw2SxPhH8daHVilPb1eb5
 zPFNTi565yfi2uLI6roug38=
X-Google-Smtp-Source: AA0mqf4Ne7K6UCo3LviuEHHi1Ldd3jeDKdUSANZrcIYdiQ5jgjAkHiE15SlUMXjD5rBe+tGAb5h5og==
X-Received: by 2002:a17:90a:4302:b0:20a:e469:dc7d with SMTP id
 q2-20020a17090a430200b0020ae469dc7dmr56845748pjg.97.1669715158916; 
 Tue, 29 Nov 2022 01:45:58 -0800 (PST)
Received: from localhost.localdomain ([43.132.141.9])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170902680700b001895b2d48a1sm8259266plk.253.2022.11.29.01.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 01:45:58 -0800 (PST)
From: zys.zljxml@gmail.com
To: thierry.reding@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 jonathanh@nvidia.com, sumit.semwal@linaro.org, christian.koenig@amd.com
Subject: [PATCH] drm/tegra: Remove redundant null checks before kfree
Date: Tue, 29 Nov 2022 17:45:46 +0800
Message-Id: <20221129094546.197424-1-zys.zljxml@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 30 Nov 2022 08:58:34 +0000
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
Cc: Yushan Zhou <katrinzhou@tencent.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yushan Zhou <katrinzhou@tencent.com>

Fix the following coccicheck warning:
./drivers/gpu/drm/tegra/submit.c:689:2-7: WARNING:
NULL check before some freeing functions is not needed.

Signed-off-by: Yushan Zhou <katrinzhou@tencent.com>
---
 drivers/gpu/drm/tegra/submit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index b24738bdf3df..df34c5daa400 100644
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -685,8 +685,7 @@ int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
 		kfree(job_data->used_mappings);
 	}
 
-	if (job_data)
-		kfree(job_data);
+	kfree(job_data);
 put_bo:
 	gather_bo_put(&bo->base);
 unlock:
-- 
2.27.0

