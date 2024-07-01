Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101CD91EA61
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 23:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBDD10E45B;
	Mon,  1 Jul 2024 21:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bLJmj35U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73EB10E45B;
 Mon,  1 Jul 2024 21:32:19 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1f9b52ef481so16919415ad.1; 
 Mon, 01 Jul 2024 14:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719869538; x=1720474338; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9bbLFnVEa+CU/qtvwaSGT47EN8FSAW/HwwbaQu0/5Hk=;
 b=bLJmj35Us77nyr3osKfQNXqQfpXBkf64s8FjJRjquLmdq6NG2+Fv/5/AjCLqsRlZCP
 GIB6K8XjuPosWDgO6Y0vk7HOXqVhLj8Zqy5EQFe1J5NF5XYZteDGi9XHEnK0UgugguMI
 1NjMXMk5N4KtAUsjt7cN4/WtoDD4/Xx3CZVYxDd1CjbDd2IEP61U4S+v8v6dSgl7SP+M
 BdJAqCo7rOr7pzfSfOmfPpvnRbzvTZEdHePAmg7TR7vZBlgb2eBRRq3JlkxZQqpLO5zr
 8BoGlvbdYSxBoMGMILoc2jI8yq4WAS8JYdZ5OGy1E2SjrDXJTdxp0HcYBs7stHHfO/1n
 Qh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719869538; x=1720474338;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9bbLFnVEa+CU/qtvwaSGT47EN8FSAW/HwwbaQu0/5Hk=;
 b=U2pCufZpOIGNw3uf/3zLCUwRkYMS6HnkgjGuFXJUnQl7cWjkc+TmRfEs2nNR2TJ9Ly
 0pFsstvJY+b8/3CWeLq7m031k3zxJ963DTMTyThBUmZqeSS1m+CGYML8tWe5j3+jdqS2
 Q2tCZIyO6jIGu9WfPDEcnVTAlE2N/u1g09I2dPqUVza775yvYjYTQALOhVuFIlCtQlVu
 6QmHAlC4FXxiJo5xY/PcxrqRynKo1TOurFtXIdrdk0rXMCFAi5/P+MoOneSIA89eoAmw
 W7go82x6QJQ26qSq91EgAfqxAnO+pEEG2evJb5bkXNs8cFbV1iS7AIIHXjNcMM7iWDrd
 134Q==
X-Gm-Message-State: AOJu0Yz1VSpuAQg5vel/59pZfAyalb0+ZgXWa8UhDhmZExaLT2RO5Zwf
 on+uH67O2Z+s9vb44BPqnKUKKvcEA/SqJnh7VdxPrYXiNNHHFs+XSYbU2w==
X-Google-Smtp-Source: AGHT+IHIcAexP3OqxwduJL8FgnJI5xa1a0FyP/85oM+2PKJHJfsk0x8k1VLccITLOZ7HkF3Vk/7K2Q==
X-Received: by 2002:a17:902:c402:b0:1f9:db1e:ef9d with SMTP id
 d9443c01a7336-1fadbcf45e5mr52066355ad.49.1719869538138; 
 Mon, 01 Jul 2024 14:32:18 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac1568de4sm69750415ad.199.2024.07.01.14.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 14:32:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, kernel test robot <lkp@intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/gem: Add missing rcu_dereference()
Date: Mon,  1 Jul 2024 14:32:14 -0700
Message-ID: <20240701213215.433101-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Fixes a sparse "different address spaces" error.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406280050.syeEwLTE-lkp@intel.com/
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index ddc6a131c041..ebc9ba66efb8 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -48,7 +48,7 @@ static void update_ctx_mem(struct drm_file *file, ssize_t size)
 	uint64_t ctx_mem = atomic64_add_return(size, &ctx->ctx_mem);
 
 	rcu_read_lock(); /* Locks file->pid! */
-	trace_gpu_mem_total(0, pid_nr(file->pid), ctx_mem);
+	trace_gpu_mem_total(0, pid_nr(rcu_dereference(file->pid)), ctx_mem);
 	rcu_read_unlock();
 
 }
-- 
2.45.2

