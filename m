Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 038CE8114EA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 15:42:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9456210E2AB;
	Wed, 13 Dec 2023 14:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4B410E2AB;
 Wed, 13 Dec 2023 14:42:25 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a1915034144so919320566b.0; 
 Wed, 13 Dec 2023 06:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702478544; x=1703083344; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nz6wgSvtDxdn5W5MMKrsDHjNFgiWM0XnkScPndx0kOc=;
 b=dqxQqmBUPAcNhQ/wZZdU5nX/KbJJlro0WnsTKKHuF0aTcXar3X63z3Vs6uNKlM1WGB
 RD2Lo/5s8Q3IvJHstzHB218q7yP0P/Acot85Tt20fc7SfL8YuxZdJbqz5skN70HZZOGB
 kVrNIlTfD/zLVqj5Qv3crsiZCLE4V/EUqdPl+Aggwv7iu8aNdELKgJ5REbwTM/1BFz/Z
 EHzr4fuYidrHIF99eSQ3XIRejyeglrLTnktSxWhZlIhcBV+AzA5IwQyQ1XwccyZ7EB9B
 IvgA9T7T4f9VbbpXnh9p8M8jEr+fX/T5FcqKBOjhUq5lKRWv2mnpsQBN57IOFvU1yNZP
 E4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702478544; x=1703083344;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nz6wgSvtDxdn5W5MMKrsDHjNFgiWM0XnkScPndx0kOc=;
 b=UlsPgLqscCK7JaEL0QvFvLjHnXvTbsz4v6xtGOM0jtSjt5YP989Mn15RJS4cMJ5/34
 k/DpIsJv0TS48LRDsoMIftYsoBdgcq4ygEIImyYGYlhdS4KnqeNwDGTLCQ2xLh2dR5Sw
 xx5DqIde/cJRCpv3dVhwcUlKm306v//CUMdcX9dvafCWTefLj0uRFr3o6kMdhQCccHSn
 M8LjRUcuhg/AqPnqFds8WAAcDogiZGGlR94KLBHbch7micAyc4YzDpyovAlfIZh7RiV8
 FxWkKdG40qTbZzRsxE15Covj7iFON7S4bGumkVFExTnR2t9PW+x+S6CgDmJtIlZWFs62
 vn/A==
X-Gm-Message-State: AOJu0Yw394rPdGbvp+Z3UN7AAvXQ72Qg+xNcLQRcu7h4UTF6js1MXrDb
 Ln4dDYxklfpVZ0uiiZtYlVShvJFOgyg=
X-Google-Smtp-Source: AGHT+IE8ZHyXPB+nDsdOuhC19J+BegKbFv8G1t2vKOaUCG9D0JAINZJnuJqhbcDyw4syj0oznKU+TQ==
X-Received: by 2002:a17:906:32d2:b0:a1a:57e2:2cc4 with SMTP id
 k18-20020a17090632d200b00a1a57e22cc4mr4024649ejk.52.1702478543928; 
 Wed, 13 Dec 2023 06:42:23 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15c5:a700:2883:dd2d:c4a4:5a04])
 by smtp.gmail.com with ESMTPSA id
 rm6-20020a1709076b0600b00a1f6f120b33sm7402525ejc.110.2023.12.13.06.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 06:42:23 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] drm/ttm: return ENOSPC from ttm_bo_mem_space
Date: Wed, 13 Dec 2023 15:42:19 +0100
Message-Id: <20231213144222.1871-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Only convert it to ENOMEM in ttm_bo_validate.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index edf10618fe2b..8c1eaa74fa21 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -830,7 +830,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 			goto error;
 	}
 
-	ret = -ENOMEM;
+	ret = -ENOSPC;
 	if (!type_found) {
 		pr_err(TTM_PFX "No compatible memory type found\n");
 		ret = -EINVAL;
@@ -916,6 +916,9 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 		return -EINVAL;
 
 	ret = ttm_bo_move_buffer(bo, placement, ctx);
+	/* For backward compatibility with userspace */
+	if (ret == -ENOSPC)
+		return -ENOMEM;
 	if (ret)
 		return ret;
 
-- 
2.34.1

