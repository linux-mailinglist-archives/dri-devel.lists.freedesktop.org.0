Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B20754EFC29
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 23:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2267910E110;
	Fri,  1 Apr 2022 21:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D0E10E110
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 21:31:18 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id q14so5490915ljc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 14:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X0JK5ihT1MOGfyrbF7/pj0RowTruIVoP8e8CBBTi+S4=;
 b=C3Kf9Jm7U1BjEQwktj6mm0YSGdJta5gC611qurF0ij+1RP2Nw6zIG8ZqJlQeUPFlSR
 4raoXNZ0GZM2xMqM+JWbTCIJOOITuhrDYmCMsyuA540wopq7D/I4dCPHjnz1L1AuC+Ed
 fSVIkEpV+m5VcxY6+rZb96Oyp9TyTWfOOH/32rIrgph10FCwftAH2n/JjYxdXaSqv5ba
 wRchlZZNVv2YkBrwuydSSuEW/BcDn/BkHwRj6Yqk05OS3Qo9R1p28mK9m/JTNJzoCu6N
 I86TdUsZRQ6dD0J6GYUoSB0mZ5zPDkz8CE1W6SIxIVouoS9AipGBIMPgO+P9wu86uIro
 jhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X0JK5ihT1MOGfyrbF7/pj0RowTruIVoP8e8CBBTi+S4=;
 b=fpAMhO67nsT9T7jf1egrYSeeA7R0jdD/7TEcqXGK6iYsWIUMzfxqCEpkdYCG13jlmq
 wBQ0LFjuUuZ4iq3V4FZ1uBkJ5LvKgphtmOfLA95/ZwsgqyUOBh1YtZn8QUsfGITHU0qi
 rKSMHh7R/aAJcKUQd4r77ptz2TFU2a8wsM+Qn51utTj3gucN8HVlRv7R1WRVgQ76dy4d
 uzuyUG1b5yzfTGmXUTLwdfy3VtoemMEJvfsjqOWc87toGRuJZy8om2fMIvABa1Wm43h3
 0VAiX4OASa8jjqhg7HkDU1V1PsphJFKFp+O88u75evmwbSlzui7vEBMmrJF9QpKbkENC
 Y6rg==
X-Gm-Message-State: AOAM530rzkgOzKTIdUQp6/ZeZxPSsO4x28XhzVa4qknh0XJgoMSwhBVA
 Ngp6VKpKGnt5qyokWBXh8Zw=
X-Google-Smtp-Source: ABdhPJwbmAj/TNXsyVzHxHQSIygbytu2JvhBQgA5HutAlambTIknHU9BwVfiI2XSNvpyitKPuCrnDw==
X-Received: by 2002:a2e:a80e:0:b0:248:5819:b94a with SMTP id
 l14-20020a2ea80e000000b002485819b94amr14660509ljq.141.1648848676369; 
 Fri, 01 Apr 2022 14:31:16 -0700 (PDT)
Received: from localhost.localdomain ([46.235.67.247])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a194348000000b0044a2ce63ef4sm349523lfj.10.2022.04.01.14.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 14:31:15 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: sumit.semwal@linaro.org, gustavo@padovan.org, christian.koenig@amd.com,
 daniel.vetter@ffwll.ch
Subject: [PATCH next v2] dma-buf/sync-file: do not allow zero size allocation
Date: Sat,  2 Apr 2022 00:31:14 +0300
Message-Id: <20220401213114.11956-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <2d1f9ba9-ea2a-e41c-eae6-0ba348cdf202@gmail.com>
References: <2d1f9ba9-ea2a-e41c-eae6-0ba348cdf202@gmail.com>
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
Cc: linaro-mm-sig@lists.linaro.org, Pavel Skripkin <paskripkin@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

num_fences is user-controlled value and it can be equal to 0. Code
should not pass 0 to kcalloc(), since it will cause kcalloc() to return
ZERO_PTR. ZERO_PTR will pass `!fences` check and kernel will panic
because of dereferencing ZERO_PTR in add_fence()

Fix it by validating num_fences and bail out early if it is equal to 0

Fixes: 519f490db07e ("dma-buf/sync-file: fix warning about fence containers")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---

Changes since v1:
	- Dropped already merged part
	- Removed syzkaller's tag

---
 drivers/dma-buf/sync_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index b8dea4ec123b..024f22193e0c 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -212,7 +212,7 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
 	dma_fence_unwrap_for_each(b_fence, &b_iter, b->fence)
 		++num_fences;
 
-	if (num_fences > INT_MAX)
+	if (num_fences > INT_MAX || !num_fences)
 		goto err_free_sync_file;
 
 	fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);
-- 
2.35.1

