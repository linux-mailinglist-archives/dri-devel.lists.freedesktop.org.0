Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D0E86DCD3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 09:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE42410EB7C;
	Fri,  1 Mar 2024 08:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OGzsZPbF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E109710E5D1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 17:58:28 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-6da4a923b1bso1071441b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 09:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709229508; x=1709834308; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VowqaTpVN0hPdRZGjI96yieZeRM1ZnnTMZEyrYb92ZM=;
 b=OGzsZPbFIe0evPU4HSrykyY2go80hj+biRTSMFjIXni2KkY5UCmfrAZnpAXyaxLImF
 nFjCtfnyRknr3K+f3EZK/8tnWDoICdbT+yGeaOkMMw2mBRLlN98P2snoBmrIns4ifDw3
 7kmwtbYW30VKNXtcxec7TB8zb434Jkzg/cjtf2x5q2Sby1KMGMx4/lGdkhrEqR/xee5f
 e/C3jK7HWCmfFsqIPHmh+zTANdE5rSXFU5j6W3f8r94izs4pY51+DKMoo4MUkO9+Cbze
 nr83ZVbbu5uvkIzxih+V5F/guOF+WClYZ9dud1/PF6hbDDY8ccJ4tA50SWUmSBKY3C5z
 kaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709229508; x=1709834308;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VowqaTpVN0hPdRZGjI96yieZeRM1ZnnTMZEyrYb92ZM=;
 b=BWZm4rsttg9dvPyxCkpWE0m1CS+ypgYw/iT0Iwlmo3OWUSaLjXhL1kL5Z8nsvhViS1
 pXax1HQr2DZJiiqn3htMQSEws+b6yNj+qGT1TN5IDEtSwTYAjdY7peNQ147pXplWx9b2
 97oIrxpsNI3rqfgBMpLhSAGGLGAWQIl8fIkmSEIbRh8IgyCO666zxUDWnby4ukITPsHU
 F78IGox/1529mEz8plpzwkvL+sM1adpMCUjB1zA3TJf2f98kmCotls7D2riFggmi8O0t
 6dF/rdwbDWckXwskHLaRQQ9Y7VloXodf9WBZksvJvwWTIzd5jtfZfAeBbgAIGYXc2giP
 BG0A==
X-Gm-Message-State: AOJu0YxuX+d+CoCxuO+KyPQrrY+8ScjTdSMw/acjWKRdhyZCxfhAwNHm
 plG7lwk554QyzL2UpZ91A7vD1vYS4DvZbzbsvlxkbL3R+twz4zpq8Yz2Q+CmiRQ=
X-Google-Smtp-Source: AGHT+IGvok0JdTCj/9kGXfzL5aEL3ZqCas3d/hefwqLkgjVT5CAlokEwoi9skeQSRVSUA2yga9VH3g==
X-Received: by 2002:a05:6a00:1b4f:b0:6e4:eee0:57ad with SMTP id
 o15-20020a056a001b4f00b006e4eee057admr3102099pfv.20.1709229507849; 
 Thu, 29 Feb 2024 09:58:27 -0800 (PST)
Received: from localhost.localdomain ([2409:40f4:11:c96a:6fbf:a8df:c87a:65bf])
 by smtp.gmail.com with ESMTPSA id
 ei30-20020a056a0080de00b006e5359e621csm1551393pfb.182.2024.02.29.09.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 09:58:27 -0800 (PST)
From: Sid Pranjale <siddharthpranjale127@gmail.com>
X-Google-Original-From: Sid Pranjale <sidpranjale127@protonmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Sid Pranjale <sidpranjale127@protonmail.com>
Subject: [PATCH] drm/nouveau: keep DMA buffers required for suspend/resume
Date: Thu, 29 Feb 2024 23:28:11 +0530
Message-ID: <20240229175822.30613-1-sidpranjale127@protonmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 01 Mar 2024 08:16:26 +0000
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

Nouveau deallocates a few buffers post GPU init which are required for GPU suspend/resume to function correctly.
This is likely not as big an issue on systems where the NVGPU is the only GPU, but on multi-GPU set ups it leads to a regression where the kernel module errors and results in a system-wide rendering freeze.

This commit addresses that regression by moving the two buffers required for suspend and resume to be deallocated at driver unload instead of post init.

Fixes: 042b5f8 ("drm/nouveau: fix several DMA buffer leaks")
Signed-off-by: Sid Pranjale <sidpranjale127@protonmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index a64c81385..a73a5b589 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1054,8 +1054,6 @@ r535_gsp_postinit(struct nvkm_gsp *gsp)
 	/* Release the DMA buffers that were needed only for boot and init */
 	nvkm_gsp_mem_dtor(gsp, &gsp->boot.fw);
 	nvkm_gsp_mem_dtor(gsp, &gsp->libos);
-	nvkm_gsp_mem_dtor(gsp, &gsp->rmargs);
-	nvkm_gsp_mem_dtor(gsp, &gsp->wpr_meta);
 
 	return ret;
 }
@@ -2163,6 +2161,8 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
 
 	r535_gsp_dtor_fws(gsp);
 
+	nvkm_gsp_mem_dtor(gsp, &gsp->rmargs);
+	nvkm_gsp_mem_dtor(gsp, &gsp->wpr_meta);
 	nvkm_gsp_mem_dtor(gsp, &gsp->shm.mem);
 	nvkm_gsp_mem_dtor(gsp, &gsp->loginit);
 	nvkm_gsp_mem_dtor(gsp, &gsp->logintr);
-- 
2.44.0

