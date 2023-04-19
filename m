Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245BC6E8B04
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E93510EB90;
	Thu, 20 Apr 2023 07:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CBD10E074;
 Wed, 19 Apr 2023 04:24:37 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2472a3bfd23so1642106a91.3; 
 Tue, 18 Apr 2023 21:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681878276; x=1684470276;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZRDCjTOkWMGElxrmUMljuv7R6aYKvTg/GiQ2WWUQLjA=;
 b=P5QTikUGscbdQb7TFjUgKjgzxn/e9+eeyH2qxNQSgYuuAoEj9snd9v+RzKmYKdaFYB
 Z/F/DpJQo7e8vEFO5QQAdNK5pRF0eVSc2Z3LToHwQitYaPnV9WaYhsT+3QPwbYhyhWOo
 LLd698154Ty28I+Z3s6QzAars6oTGXtMF7Mwz23ALjlPE+FLwQNJQD57d2bRIjRKQo5K
 /eSJRxR5Num3TxuE6t60Tjk67JJ/vq5KGCBAlfuitq8wGNFR2BDk07PJ23mAZyYwBO0C
 /IzcPoTQ+SQ5jhA4iU8jpMFsg82p0U9KavFJC2lv3+aIkursUeNhKZ+71h5Piq67P6Qi
 338g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681878276; x=1684470276;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZRDCjTOkWMGElxrmUMljuv7R6aYKvTg/GiQ2WWUQLjA=;
 b=N4DjlJAKPjx8dxjrFctCUGI3/v8eaoV6mJBe3liJB/Jt1BKjdqM1ksxtuMbJnJLDS6
 HZRLQglOV+duusqIlm3zR7dja7G8MFvSbBEZUTUle0AdmiEKy/cYu/lY0CQJsmqzABPB
 KU5b9EW0KlpYdXJIXhUUfjRirgAa9cwa8u55epjETXHEJODtwmgE4g0wXiAETo9jA/b5
 pDoRl7E4IdD/ao29hM3YDBXCyhfvqwA9pElJFunjvnZEWGrWPB+2J1IAMe4jhQ10l33c
 28AM8q7v7AWQzDo2Ign1txXNeQXDpv0JN9kFHjpbDkYAOusg0AiKdCC2+O5HFZnPA8Ow
 LZeQ==
X-Gm-Message-State: AAQBX9fV130v4Z6Ku9FtXddA/UwVFBZRVE3Keh0DHpbzoToiy5V1h3ow
 eAkQJVieX8GKA1HVELJ05JU2vd3VZ2MvQAJ4DBs=
X-Google-Smtp-Source: AKy350afI02Fa3Acq0DNx6nJUWrX6aI7RY4q/vg2eOyv/5uPkMM5pF1SRDx4yrymqaBjzv9oWxjrTg==
X-Received: by 2002:a17:90a:fe8c:b0:246:f73c:3aba with SMTP id
 co12-20020a17090afe8c00b00246f73c3abamr1522019pjb.39.1681878276254; 
 Tue, 18 Apr 2023 21:24:36 -0700 (PDT)
Received: from hackyzh-virtual-machine.localdomain ([58.34.53.146])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a17090a088800b0024779068491sm380205pjc.26.2023.04.18.21.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 21:24:35 -0700 (PDT)
From: hackyzh002 <hackyzh002@gmail.com>
To: alexander.deucher@amd.com
Subject: [PATCH 1/2] drm/radeon: Fix integer overflow in radeon_cs_parser_init
Date: Wed, 19 Apr 2023 12:24:07 +0800
Message-Id: <20230419042407.69001-1-hackyzh002@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 hackyzh002 <hackyzh002@gmail.com>, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The type of size is unsigned, if size is 0x40000000, there will be an
integer overflow, size will be zero after size *= sizeof(uint32_t),
will cause uninitialized memory to be referenced later

Signed-off-by: hackyzh002 <hackyzh002@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_cs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index 46a27ebf4..472c29050 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -270,7 +270,7 @@ int radeon_cs_parser_init(struct radeon_cs_parser *p, void *data)
 {
 	struct drm_radeon_cs *cs = data;
 	uint64_t *chunk_array_ptr;
-	unsigned size, i;
+	u64 size, i;
 	u32 ring = RADEON_CS_RING_GFX;
 	s32 priority = 0;
 
@@ -347,7 +347,7 @@ int radeon_cs_parser_init(struct radeon_cs_parser *p, void *data)
 				continue;
 		}
 
-		p->chunks[i].kdata = kvmalloc_array(size, sizeof(uint32_t), GFP_KERNEL);
+		p->chunks[i].kdata = kvcalloc(size, sizeof(uint32_t), GFP_KERNEL);
 		size *= sizeof(uint32_t);
 		if (p->chunks[i].kdata == NULL) {
 			return -ENOMEM;
-- 
2.34.1

