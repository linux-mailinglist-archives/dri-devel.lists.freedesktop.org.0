Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D917F4EA83C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 09:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DB710F113;
	Tue, 29 Mar 2022 07:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D8F10F112;
 Tue, 29 Mar 2022 07:00:05 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id g22so8466531edz.2;
 Tue, 29 Mar 2022 00:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m7nYYw9QbO9lD8x13zqrVQagOe2TVYJPaNjC3VlVpmg=;
 b=oVVVbZAR3MY5o2TmQnqB7eeOwx96uFW5NEkAXRefmX4Uff6MftBOHgTmGpAVRXOS+v
 L6UP/uT7RPa1+SNNqPTfInEV8RmSDIEQC62rICCbUdny5Mr3su6Kifi/CUJoCF1NhqDU
 eckFYmhXvqknkono3r/AVr3r2IBqyGbaqJ9f7tt+dm5ydKqgxJ5C4kLg4ZVs5swTD0l+
 rc0bi77SC0G+ubbt3wbvLxOO+XzBRzgvkS/cl6nuXzfufOKcN5eUUHkktLpVclgMHwnl
 t/fnQSUxcXtmv5cjGc88ADdzOPFhqgzmZqGH3GiN5jiAfCRflOQXbuncxjCsfhusxbiO
 ZbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m7nYYw9QbO9lD8x13zqrVQagOe2TVYJPaNjC3VlVpmg=;
 b=Zd8X3+0LQtgiLU01gARQlDap8lFdtivU15vVHGQlB+i+8U/vPtgLRHeDlLkDUjRF7O
 pqzltwr1Xbd6E5fgRWdGwJ9dEcTUQgv+EyzezF3XRu7P9mHOFFsJSPviNqnLE2BARvT6
 qtJf6u2ISZLj8ePLi07oVEDMat9XWKZLh4pcb7HgyFuwgLMazzkrAEy11wXUGhVNscop
 Jk/B4ezDD8j8CN4PtwfqZdNE5DvuDdyunrUwMm7IAQK+o5D5h9kaGH/t2pgXivKkz6f+
 NzdMcjMYejofIDL52IOFijKucT9mB9MUKOe+XoxcWafB7wj9OZyLBX2GMiyWdA6s2krG
 sh8Q==
X-Gm-Message-State: AOAM531aj6mIi4cVgS6EV13AmFxGXqKpzRzV4GK1eI+pwLZOTeKtOcVp
 1gm6Ebh9+4lCKtaxX5Z4825TcfQmaIs=
X-Google-Smtp-Source: ABdhPJwGoMU0Av/z3ii/A11iC+7ue7IwhIP52CrYOTJ7GqwhFFeYIZfyq9d8SzNMbBtauOSBP3Ah+A==
X-Received: by 2002:a50:8707:0:b0:41a:68df:1a6e with SMTP id
 i7-20020a508707000000b0041a68df1a6emr2640201edb.31.1648537203881; 
 Tue, 29 Mar 2022 00:00:03 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 gv9-20020a170906f10900b006d7128b2e6fsm6593250ejb.162.2022.03.29.00.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 00:00:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 ville.syrjala@linux.intel.com, daniel@ffwll.ch
Subject: [PATCH 1/2] dma-buf/sync-file: fix logic error in new fence merge code
Date: Tue, 29 Mar 2022 09:00:00 +0200
Message-Id: <20220329070001.134180-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the array is empty because everything is signaled we can't use
add_fence() to add something because that would filter the signaled
fence again.

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: 519f490db07e ("dma-buf/sync-file: fix warning about fence containers")
---
 drivers/dma-buf/sync_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index b8dea4ec123b..514d213261df 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -262,7 +262,7 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
 	}
 
 	if (index == 0)
-		add_fence(fences, &index, dma_fence_get_stub());
+		fences[index++] = dma_fence_get_stub();
 
 	if (num_fences > index) {
 		struct dma_fence **tmp;
-- 
2.25.1

