Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A588296A38
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 09:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD216E4A5;
	Fri, 23 Oct 2020 07:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B816F52B;
 Thu, 22 Oct 2020 13:47:10 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id a17so1059424pju.1;
 Thu, 22 Oct 2020 06:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1gypUtIc864PbkDDcPxNQEUh8zBoJi60ZtKxJZr3rhk=;
 b=BhFPvqZ2fI2InSAjrYY0zeX18fhNHww1+FQ/xSM5zKcowMhycbuWkOnfxAIq4PB4Er
 UOJF2GZM0pLpbcswZLc3aeYilTgEEmxUEGT0/k2CEEdmC3m5ftiWv8BJm10VuGQirQFT
 tk+IS1SS/s1WxJ+zcwFm5SZX4KFb/kcYL5onqjBP80vdQAiVFHIBwyJXNgb6uVUwdkfy
 EtQgkvNjRxzy5e109mcft/9UN0MFO0q3Sq8D2mLc65jjek86iE1AkevB8kdyhRlWYhsQ
 h7X8b8kWeuL8yLHrj6mOZa86q+dowjDyuKh3VA6Uv3YSEaEnUt2vXSiZa/M+UVXLUoGQ
 AeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1gypUtIc864PbkDDcPxNQEUh8zBoJi60ZtKxJZr3rhk=;
 b=Y+H7K5+qqkCw632pP1yZNYD2znCSd2ZPCu9lkROPwgW6I5RYi0GqWs8uAbIj8jJxgQ
 znBWTgfM1tgBkJo2kiQ2BeXWjb5AAVz6YMPU9uS4xrsJNqxOmzT0OXQ7KewFZRsgcmMu
 KzVIYlaBo7lITD4PVxWhtFMxOJygd2FdnorSzs4P+TzJ3NY7+eC5cIZLXJsnIaYL/zF1
 52kfguZpy43tp1c4Z8nt1nhK8KnS+IjIE9ry+dWWEc3lNHe4THJWUTRvGz4MKAF+oVAR
 zb8Meb8569Jny3eDeJf6YX3u4lxct4CWiTIIVStfHY2FraBJqU/iU9caefa6iRihUo81
 plDQ==
X-Gm-Message-State: AOAM532x0adkTuajERvEHq8P7h2xtL2u0eK+a0VNDXiKCrA5QsHF0oVM
 x7X/etZ/uU92KRoDTF92cQPPIjqo1WM1Lw==
X-Google-Smtp-Source: ABdhPJxgfTDPOdZuV7oWxSOXYyNciFXIQfbcH4Wjz4kzLnC7p5Iw7rt5cpaeGQoeis6/vilsflQLfw==
X-Received: by 2002:a17:902:a50f:b029:d6:da2:aaa7 with SMTP id
 s15-20020a170902a50fb02900d60da2aaa7mr2614665plq.42.1603374430254; 
 Thu, 22 Oct 2020 06:47:10 -0700 (PDT)
Received: from adolin ([49.207.204.75])
 by smtp.gmail.com with ESMTPSA id b128sm2233467pga.80.2020.10.22.06.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 06:47:09 -0700 (PDT)
Date: Thu, 22 Oct 2020 19:17:04 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
Message-ID: <864a0c5d7bc85d9eeaf1ca7b3db38b58e042471b.1603371258.git.sylphrenadin@gmail.com>
References: <cover.1603371258.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1603371258.git.sylphrenadin@gmail.com>
X-Mailman-Approved-At: Fri, 23 Oct 2020 07:22:29 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.or,
 amd-gfx@lists.freedesktop.org, melissa.srw@gmail.com,
 outreachy-kernel@googlegroups.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using snprintf() for show() methods holds the risk of buffer overrun
as snprintf() does not know the PAGE_SIZE maximum of the temporary
buffer used to output sysfs content.

Modify amdgpu_gtt_mgr.c to use sysfs_emit() instead which knows the
size of the temporary buffer.

Issue found with Coccinelle.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 1721739def84..441e07ee1967 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -49,7 +49,7 @@ static ssize_t amdgpu_mem_info_gtt_total_show(struct device *dev,
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
 
-	return snprintf(buf, PAGE_SIZE, "%llu\n",
+	return sysfs_emit(buf, PAGE_SIZE, "%llu\n",
 			man->size * PAGE_SIZE);
 }
 
@@ -68,7 +68,7 @@ static ssize_t amdgpu_mem_info_gtt_used_show(struct device *dev,
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
 
-	return snprintf(buf, PAGE_SIZE, "%llu\n",
+	return sysfs_emit(buf, PAGE_SIZE, "%llu\n",
 			amdgpu_gtt_mgr_usage(man));
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
