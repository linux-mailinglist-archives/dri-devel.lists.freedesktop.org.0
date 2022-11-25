Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3F763875A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 11:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAFD10E711;
	Fri, 25 Nov 2022 10:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7A010E627;
 Fri, 25 Nov 2022 10:21:48 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id o30so3102036wms.2;
 Fri, 25 Nov 2022 02:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ThoC9BlA4uS4+BJNMy5V7KH5AR+BD77ENoFY2rH+hUc=;
 b=H2qMSFsxldnwxvc2sxGcBsHzaEz+N6vNI6ZhHVgifIbPqBfPAN4E/8E/OX12Nx55Hk
 VuQuNDCWwQtPUvPsMNFXmuyAk1AlVz2ZGKl8TG8PP0OjiLQtu4/1nUVz2JmgkdUBWaYK
 v3ac8clJ9hhw3EXtlGk5fS4YIYC9rh9IozCScHGST/h1pJg2T1U5nDFcLT3Wmor+DNGS
 KQBLO8JHqBxIwUJSSiDFbnVrG2rULQQq7NPlnh22bKpPkV12yk5xL6PXOTlGLTazrPgL
 y27GPD0n/ZOAIVn5gApa6clJqCBjtkoX+CwpU3FNsBIk3Q4BjkjM4Wfcm7bekH4kic00
 kEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ThoC9BlA4uS4+BJNMy5V7KH5AR+BD77ENoFY2rH+hUc=;
 b=M07hDhIJbGAlRQ8F4smwBaYb3e4/zC1FmPSsPCJZB3KFabneMRW/Q9cum/22+uiSSf
 b3OPWLQDfLobpkO8Q7A4DZrwPfpQtxfwoN1t3zf4+hC6Mo6zNrp0nVi7Ppv2xk3o2Dt/
 kfUzfHBtNY7aH67k8tB/gmjCIA6KRqLJtUCXhAkn2Lx1lX5xVL4VrAfYHJeZ2pEQXB2I
 RtWIRAQ7wU/e0HVG3Ay1igfv+XNL4OKgTA1cKvMkAtmcPGsC+Hx1/RTZ8srmz2GCGD+j
 wdS/eZxByCcymV7bviLY3gSPfZlUwz6xwSuZP31bA400pLLbCpJ/jcd5Z4/NpmwpmcFG
 qetQ==
X-Gm-Message-State: ANoB5pnWxjUjnWbPdoyolcuSjL67YBhfKF9odkUnQEzZ7uAREESDCh/m
 w+c1mZGJKAXM7bR2kuJKdKZ0FONoQrY=
X-Google-Smtp-Source: AA0mqf4cGoMfIGODx1aFJKkRXq9EvQGvcTRP7x/5Zkg4ldqc8sxA0I31KExdlqkTQ1d9Q2WPaqTmuQ==
X-Received: by 2002:a05:600c:19cc:b0:3cf:7bdd:e014 with SMTP id
 u12-20020a05600c19cc00b003cf7bdde014mr21042693wmq.1.1669371706306; 
 Fri, 25 Nov 2022 02:21:46 -0800 (PST)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a056000038200b00241cfe6e286sm3351193wrf.98.2022.11.25.02.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 02:21:45 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 8/9] drm/ttm: use ttm_bo_wait_ctx instead of ttm_bo_wait
Date: Fri, 25 Nov 2022 11:21:36 +0100
Message-Id: <20221125102137.1801-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125102137.1801-1-christian.koenig@amd.com>
References: <20221125102137.1801-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Make sure that we use the correct settings from the context.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index f9d9fd2d865d..cd266a067773 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -439,7 +439,7 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 	bdev->funcs->evict_flags(bo, &placement);
 
 	if (!placement.num_placement && !placement.num_busy_placement) {
-		ret = ttm_bo_wait(bo, true, false);
+		ret = ttm_bo_wait_ctx(bo, ctx);
 		if (ret)
 			return ret;
 
@@ -1190,7 +1190,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	/*
 	 * Make sure BO is idle.
 	 */
-	ret = ttm_bo_wait(bo, false, false);
+	ret = ttm_bo_wait_ctx(bo, ctx);
 	if (unlikely(ret != 0))
 		goto out;
 
-- 
2.34.1

