Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA2F3BF94C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 13:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF796E8B2;
	Thu,  8 Jul 2021 11:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E8D6E8B2
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 11:47:12 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d12so6547624wre.13
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 04:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BRWGZ1ceBYm1jDVNKzxYdHzN7Yd38a37E65r/OXNxZQ=;
 b=nisZw/0bmurdDhlUBOv8QNM7Gn7jglLvnPwt4z3UHeTCl54/CwtcVNhsk9eB5m6/WB
 Ehacalj2aGKRNh+EHHnKs7Vei+TGsIq4K06ekxW1KdWdu+sbx5p/X4oJ2rYpv+VkCL+T
 ur7pVFMrPlJv0dPNh6RV23ZUIX6R0fUjjx4JKxcIvwZXiHrd7Fxh+OisN9G/bihTmBgn
 AYEc6DnVqYysvg12pTvTCeJqsT9Hb1Sb/siMoS76GCDIUga80xuYwMg7M1mzcjVdDJRS
 iRrS1wrov6z3QAAWvL7Xzae0DBSrDyt/3abgl+lpZWFHL7tXnlB1+NjZJgKd9e3f1or7
 0xkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BRWGZ1ceBYm1jDVNKzxYdHzN7Yd38a37E65r/OXNxZQ=;
 b=rIhjgtnaVC3q3IYO5pX4ceSxaCfwGk9B4xqZTH+Kdl8bPYiv9ZVPtKmW96eDCXhniE
 iL/wPxiPpKgBlVrEOIVoKSMvXq0A9qv5JlXAq2akUMTdUCGceMylFy3TYe+AnXHvqAlE
 oVyKz3cWX4OfQ89JjA1ZUukrLTv6AlrSDTZlJja1l8NqnVnCr5TUo+Vta3Kqax8EenLn
 xIArbJB8TTsY9FOWwx+z/g47bEBBflJoJ5SLn0b8crUio0mPGo5HaNc5WX1xM3ZuTAb9
 8HtJGc2JhOAlhhRmuYbvo8DBW1BFGlSdxLQjhchkt9PbePar9iik5JPYwmwUfQ0kW3gi
 xpbw==
X-Gm-Message-State: AOAM532py5wAJLjucdbMupsjMV/tovHkBbhuaRwALb46PGWM+4vHxnxx
 eFMsdD2KsBMUkRQ2CP1ba1iLMt6ZazQ=
X-Google-Smtp-Source: ABdhPJz8dYF78JXxyMI+hwbgUsR69Dld9+lGOU66MROSrp4bIwjXIJFLPgM1G7iHJQWBluRPxskIXg==
X-Received: by 2002:a5d:46c8:: with SMTP id g8mr9578521wrs.341.1625744831240; 
 Thu, 08 Jul 2021 04:47:11 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:88a0:1bd:c5e1:444e])
 by smtp.gmail.com with ESMTPSA id s17sm1964276wrv.2.2021.07.08.04.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 04:47:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	roberto.sassu@huawei.com
Subject: [PATCH] drm/qxl: add NULL check for bo->resource
Date: Thu,  8 Jul 2021 13:47:10 +0200
Message-Id: <20210708114710.8186-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

When allocations fails that can be NULL now.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reported-by: Daniel Bristot de Oliveira <bristot@kernel.org>
Tested-by: Daniel Bristot de Oliveira <bristot@kernel.org>
---
 drivers/gpu/drm/qxl/qxl_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 19fd39d9a00c..37a1b6a6ad6d 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -127,7 +127,7 @@ static void qxl_bo_move_notify(struct ttm_buffer_object *bo,
 	struct qxl_bo *qbo;
 	struct qxl_device *qdev;
 
-	if (!qxl_ttm_bo_is_qxl_bo(bo))
+	if (!qxl_ttm_bo_is_qxl_bo(bo) || !bo->resource)
 		return;
 	qbo = to_qxl_bo(bo);
 	qdev = to_qxl(qbo->tbo.base.dev);
-- 
2.25.1

