Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D756BC704
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 08:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A076E10EC39;
	Thu, 16 Mar 2023 07:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7521510EC39
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 07:26:50 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id ek18so3837891edb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 00:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678951609;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iMaOaoaCseTs6xSzJqi98DY/IK7rMn34nGgFk91qr4g=;
 b=DQVyVlaBK/c/HeuiYiTMnBmyafhcxWbXEyi2m12WQy4QIBFre1g9krSeD7W6Jac2Ez
 NEiq+QVP4sSaS0ZyNCdfU5Ot9FkvU/oBz1xSOZB4E3poAxO2iYe9f//ntzJrdXgPgDgT
 PmjoFKLnNSia4w5+f0D22obG1cxnGeC8onfNnHJZ/YdJNm+ZJaGqA2f6lzJnZb5Za5CO
 pSx9LmovIt3spalg9gfYf2TpGFy5ZbGh3PAO2yKk5rpoABUfhTzjlOODMSC18xoJbcHw
 NnClEfAGfNc0L0PYroKkNCe3o67juNpK3Hsl9x0kxu8KPZz1eZotiMIHmoH2gyJVS0Jx
 LLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678951609;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iMaOaoaCseTs6xSzJqi98DY/IK7rMn34nGgFk91qr4g=;
 b=zrz46sysvnniLpkqzIQ4W/A3+N11zsuNmpUljTl8RQZTaFLkWB0qg+E/rkhLjZqsnt
 u7mYyQZMCXPwSckI2mGYwErOEHaIEVpIAfqCJlL/fQAiB46nt0unXAwNhlFMBzfFfunO
 PlL+zILxqkrlUNCKzKN4pQWcEoPK/A1iQv7+HuOXDbbRn2YR6ZtgWKhGKjvhZ8Kvkpqz
 ISAdRG8d5AHXY8dbdAGkCJVOusWK+gpTpFJeb8qsfJCUNWwHJ6SKtrh5hR45gKgpFtt+
 M0OQFTF7riVoD8zNVstqYyIiAut71ssAQ+ozBY9lsF9mkMHikOCw7UNBmv9pXuo3ZVIY
 /EjA==
X-Gm-Message-State: AO0yUKWEeIq/jjrFH3xyRmY8vdGMO023AAfSw7s8odDkQ2CsVXbq2SFa
 yQUvOrYq3xHrlSDRp+qsI/YC97EsncM=
X-Google-Smtp-Source: AK7set9rEsR/mvGeGrwV8Fu5aZ3mfdGCB9pAdgW2KVhvQc/6NVquKOV14sH9SV76JwC/V+KbNxXdKg==
X-Received: by 2002:a17:906:26d3:b0:8de:502e:2061 with SMTP id
 u19-20020a17090626d300b008de502e2061mr8280893ejc.3.1678951608879; 
 Thu, 16 Mar 2023 00:26:48 -0700 (PDT)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 qw12-20020a1709066a0c00b008d606b1bbb1sm3481408ejc.9.2023.03.16.00.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 00:26:48 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: drop extra ttm_bo_put in ttm_bo_cleanup_refs
Date: Thu, 16 Mar 2023 08:26:47 +0100
Message-Id: <20230316072647.406707-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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
Cc: matthew.william.auld@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That was accidentially left over when we switched to the delayed delete
worker.

Suggested-by: Matthew Auld <matthew.william.auld@gmail.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: ("9bff18d13473") drm/ttm: use per BO cleanup workers
Reported-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Tested-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 459f1b4440da..6314653e91f7 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -294,8 +294,6 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 	if (unlock_resv)
 		dma_resv_unlock(bo->base.resv);
 
-	ttm_bo_put(bo);
-
 	return 0;
 }
 
-- 
2.34.1

