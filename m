Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E0A58F18A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 19:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DC5112996;
	Wed, 10 Aug 2022 17:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FAA12A163
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 17:26:20 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id bs25so73144wrb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 10:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=yQkBkfOo8k25QBF8/V+qz53CEBZNBWR8yDZ22JLO334=;
 b=ajme8M6DMtkn8m436NlSix04pj43UCxqMSspZK63up3TGZkGt9Sw0o3097zhbTjBRf
 gTSBjnMb/JbBgWUWWq96D+C4r92pk4YuhXDgQfj+TcMmKSWyIgqn5ZF4IclOOMrGOaJV
 6/nlo7UUXoyAXGjs3gsRPt264hxTa/+wljRDLqkq9i5wlk4jgZvafCK6re81odgd9xsB
 eLffJMbyKn7a+zlYY84aOoWr8pw0pJolC6Fi5JzLsCasjeIUJ8Hu1pHMrR9cStd7DIEO
 JAF46SrwCfO2ua04wgZmbB9NziqVNQ7p4Unm/PyqMV+W//SZGbsmklmbAUK1PFemuVZU
 1MnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=yQkBkfOo8k25QBF8/V+qz53CEBZNBWR8yDZ22JLO334=;
 b=zGjfDpDbaFWVMWfKXV6kYICa2MfdTcR/0tEyt2MeBHdC6qVkUpUDrWaqG1O4EdWyLf
 TpZKe7nUPCVJmBJBt4nqEwiS0XWMpSX6zUUhegE6NyxuLhMY6oIY4U9QEzXi7lYYrTHT
 JmTfxEV7Ap7AQPp4FKlxwfebqJgOLj5QQT98KARNUUerdlQBcEyerd21unR10bmuoktx
 MNl8z3Ml7dXK4IOnnJ5D1v5zB+EbsltvZ/jlm7XaDaHWhK7HxqREEpCZ2Oz5F5ORl8mc
 kCxzcFZjUfTI+YnvjsyVlwop5dA+avMSm/4s71ZJZvB5z9ggMFziXFFE9Lb2WTwsmBWo
 5MzQ==
X-Gm-Message-State: ACgBeo3/w9+3SNadNQGyG4qDkgKM2Ar+zKcyNCXgwzQvjtclGSWOll4S
 TTP/iBRmAz6Vq+fO5DGNP4o=
X-Google-Smtp-Source: AA6agR6Gv7kU22Dkze4nmrfvh1iRJdomSy/KJlH8y5Eoa7g41RhDBbSLi0JH3hLVHxzak0zw7kA/uw==
X-Received: by 2002:a5d:4907:0:b0:21f:bc42:989 with SMTP id
 x7-20020a5d4907000000b0021fbc420989mr17948544wrq.375.1660152378994; 
 Wed, 10 Aug 2022 10:26:18 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 17-20020a05600c26d100b003a2f2bb72d5sm3561059wmv.45.2022.08.10.10.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 10:26:18 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: jason@jlekstrand.net, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf/dma-resv: check if the new fence is really later
Date: Wed, 10 Aug 2022 19:26:17 +0200
Message-Id: <20220810172617.140047-1-christian.koenig@amd.com>
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

Previously when we added a fence to a dma_resv object we always
assumed the the newer than all the existing fences.

With Jason's work to add an UAPI to explicit export/import that's not
necessary the case any more. So without this check we would allow
userspace to force the kernel into an use after free error.

Since the change is very small and defensive it's probably a good
idea to backport this to stable kernels as well just in case others
are using the dma_resv object in the same way.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 205acb2c744d..e3885c90a3ac 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -295,7 +295,8 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
 		enum dma_resv_usage old_usage;
 
 		dma_resv_list_entry(fobj, i, obj, &old, &old_usage);
-		if ((old->context == fence->context && old_usage >= usage) ||
+		if ((old->context == fence->context && old_usage >= usage &&
+		     dma_fence_is_later(fence, old)) ||
 		    dma_fence_is_signaled(old)) {
 			dma_resv_list_set(fobj, i, fence, usage);
 			dma_fence_put(old);
-- 
2.25.1

