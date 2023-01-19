Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 099EF67441E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 22:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFFD10E263;
	Thu, 19 Jan 2023 21:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB38210E263
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 21:13:20 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id e10so2587031pgc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 13:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fXQAX4zgQIEcR46hfecs8ivLI9Fp7qzLdoZtzRMFxAM=;
 b=LeGGy9TXclqavq1GJEP5BeJuqLAP77mJj9M/dx+YZB1k8oz48n4eWPGqVlYjqDCLRE
 41YHxOMQmIPn4GecoCfNdSfjX7LtOwzw481wfJI+TUHrlJT0YXSVbMTSxk7vLqaMm35k
 isUkT8z/Zm8eLWKwPPOPPE3qKEIo5tMt4u/U9Z2tA27ZMD9AbBVh5NaY8RcniOdcvUMi
 pyrAFAChvhZharJnDgULt0wPu06u8xTrPVKuwTv/MbeonFQrYfzcIF/B0ce5rWIFQ39h
 ubIZ7WeGiuR3cNGBk8p1LMXvjgWovU46wbhWELbGrWsie3y+NdQUdLbxAI2m+8DqNVzX
 1Jow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fXQAX4zgQIEcR46hfecs8ivLI9Fp7qzLdoZtzRMFxAM=;
 b=gIqkGESD56j/GKxZ7loGKuda4qnA40PaUNhfilUnTatC6gKOxmcKJCd3GVkH5d5gTU
 xklO15CQv8GKY89p6LmGoX/Zx7g6jjyPCXy3pX6rWgS1g0OrYATFo/CMNp2IC2Mow454
 qeCL9N4rJ1EV4GAAcw5SvePiTR1aZeLzT2cfE9ad3Ui85ZbUb1R7zhUU5HUKyoBw7usO
 6JLcmBO05QTOtqm/aTMVHt1A7lMU7xZcV7bkFQHS1FLb74JX0Dizx65UOxAr4kmFt+ao
 KSlTI8Hf6lIhT6vASR9JEM/8d/PbV/EOz6reOobPiHI9aAfsh8g9RepB6f4SJHV+hFf/
 6ajg==
X-Gm-Message-State: AFqh2krudRc1pk0dcwVeDL1xeQHbvh2Hg/AnXptv4vRRoerXnvKVQSkE
 MA0y0C0SU0QJ0JDf6LI0pn6OlGj8x9c=
X-Google-Smtp-Source: AMrXdXumu9XC7Z8ZOUJf2HdYTRDa5zAIDrKrYOpAsbDGhZlQd+VrdxHeJwh7Lw8m+T9WViOxlLj1cw==
X-Received: by 2002:a05:6a00:f91:b0:583:319a:4413 with SMTP id
 ct17-20020a056a000f9100b00583319a4413mr13329053pfb.24.1674162800057; 
 Thu, 19 Jan 2023 13:13:20 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 66-20020a620645000000b00581172f7456sm7056240pfg.56.2023.01.19.13.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 13:13:19 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/dma: Drop unbalanced obj unref
Date: Thu, 19 Jan 2023 13:13:25 -0800
Message-Id: <20230119211325.2851211-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In the error path, drm_gem_dma_mmap() is dropping an obj reference that
it doesn't own.

Fixes: f5ca8eb6f9bd ("drm/cma-helper: Implement mmap as GEM CMA object functions")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gem_dma_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 1e658c448366..784356d6f39d 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -544,8 +544,6 @@ int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *
 				  dma_obj->dma_addr,
 				  vma->vm_end - vma->vm_start);
 	}
-	if (ret)
-		drm_gem_vm_close(vma);
 
 	return ret;
 }
-- 
2.38.1

