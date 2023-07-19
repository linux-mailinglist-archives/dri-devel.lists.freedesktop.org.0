Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B951575908B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 10:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAAA410E42E;
	Wed, 19 Jul 2023 08:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18F110E433
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 08:45:09 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3158a5e64b6so6278339f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 01:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689756307; x=1692348307;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1FyC6zEm9TMtTPVUEw2n+UcHqrKcRbzPUWVgkBDBFoM=;
 b=rwNddAijnLPiw5y3y4EYfaIaNs8T518h4pfNJbJ69EVrVk1+En8hWcweGVy0vWmGrV
 tkmxuV0hzpNGg5adpenAIF7lBY5FdET/r5XzBuM49+rF+lhM0Gf6JSCkl+CX0fMQ2HlW
 8uCf5kekuq0DorVYK2L40T6ORwR+mmlVft+XZdpVyi7WuFBKFLTqgp0P7//hInaEQi2K
 rh8jAkePw2FBsr06ozfFs8hi7lBi4fKYTPfQNSR5eZcWf9dBJEJRxqhUKYk9oLaLGEMp
 JKKnE6G2ahTopbmjt9Id27rVvW/jZL97YjGu7h4k7pDYHBNnKzz3rx8g7hXdbmKwzzhL
 0M9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689756307; x=1692348307;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1FyC6zEm9TMtTPVUEw2n+UcHqrKcRbzPUWVgkBDBFoM=;
 b=L+3qkukr102LP5avGw4lzWshgCUwwVrIL5HDqJTI3uFDdpxRciSMq5+AQyQcRhqoI0
 wiPGL8wtcRItOwv4P82lfe2E/ogmuLpiFC6kT0R33nvBdDTPuM/ZLbhLwSYqcmLTnzmE
 kC6xiCkeXc+V+SYCXI3mE1ZLdqpcLF/yGt4cWlakOU4LvAp+NzR4Cncr+J4rpo4pXrum
 YorFEK9Qza3nHAsM4lbMsmJX/mrRNsuXnwoQTb081MNw9KbBGk2+C0bjjUEdu+j/1Ldk
 rxd1V67ZoeD6FqDBtFaEuO5jC2+yoP5+OapljVY+z8gd8Nv3MknXUvgz6I9J6HTzi6I0
 NunQ==
X-Gm-Message-State: ABy/qLapkc+bIYbU4tvaY5iPxP5CL3ukj1ssmZnjXUUyRVoc4vpPBDWx
 zDhRCtwuyy4MORBsD8SCh0DtVQ==
X-Google-Smtp-Source: APBJJlHtS5n+8mchPfLTIlIfdrpQnISpfFAdY/VOIMePLqRBqm7K6iQK5Vkj9hr7sAlj4NqhX/rPDQ==
X-Received: by 2002:a5d:4590:0:b0:313:f86f:2858 with SMTP id
 p16-20020a5d4590000000b00313f86f2858mr14364312wrq.2.1689756307626; 
 Wed, 19 Jul 2023 01:45:07 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 u17-20020adff891000000b0031424f4ef1dsm4689257wrp.19.2023.07.19.01.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 01:45:05 -0700 (PDT)
Date: Wed, 19 Jul 2023 11:45:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: [PATCH v2] drm/loongson: Add a check for lsdc_bo_create() errors
Message-ID: <ZLeijglIMPve2Iio@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code doesn't check for lsdc_bo_create() failure and it could lead
to a crash.  It can fail for a variety of reasons, but the most common
cause would be low memory.  Add a check.

Fixes: f39db26c5428 ("drm: Add kms driver for loongson display controller")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
v2: change subject and re-word the commit message

 drivers/gpu/drm/loongson/lsdc_ttm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
index bb0c8fd43a75..bf79dc55afa4 100644
--- a/drivers/gpu/drm/loongson/lsdc_ttm.c
+++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
@@ -496,6 +496,8 @@ struct lsdc_bo *lsdc_bo_create_kernel_pinned(struct drm_device *ddev,
 	int ret;
 
 	lbo = lsdc_bo_create(ddev, domain, size, true, NULL, NULL);
+	if (IS_ERR(lbo))
+		return ERR_CAST(lbo);
 
 	ret = lsdc_bo_reserve(lbo);
 	if (unlikely(ret)) {
-- 
2.39.2
