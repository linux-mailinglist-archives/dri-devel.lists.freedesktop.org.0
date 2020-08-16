Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0FC245D46
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25C189DA4;
	Mon, 17 Aug 2020 07:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78456E161;
 Sun, 16 Aug 2020 14:51:50 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id f19so6099581qtp.2;
 Sun, 16 Aug 2020 07:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=yo6OlECerivcrTTZJKS7ZSTtM/ay7Ma0TpI5jbubrg4=;
 b=UBxbgy52dsv0SOtPDSpRsT6sDw1VmOsVKxYOBCcmypxBL6Bv8kkMtDN/TVVMJeq+GS
 I6ctyozneEz7JOEvs0b9ACgNJt+JJFu4K4P8bGXqj7PzIybWaFT2b3vXDMkLeBKSUsnQ
 YL5S6DUc7SedwwSfg2909/+wbVEeluSXCvCmjkOxnA5KdYMet//f49T1n6UIcjsUZUAN
 32Jh5UM2hVQZkDxISGC9+Xm3T86X1fgGsuEl87RuhGJ7A+0xQHHrAlW+stef8BHhpu/B
 pS7WKdubWnUIJmPMOrflM2ivQhkt2PXYnCqQ8xZNbhTQuyQizOkXp1uyRHIjbXqx37WZ
 7OxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=yo6OlECerivcrTTZJKS7ZSTtM/ay7Ma0TpI5jbubrg4=;
 b=SD1BjnNTdpeeaILp024wrNgq/I4npSf+wGIAYpnyBrVCDSiTd25uqGOizD3cfVmCGU
 B8ox+WMI+BUm8W1gZr0zPP/po7ynMVe1Vi9pEbyDppm9/NzoBmSO5BjFiP1EknrQY9ly
 st+Dyy5dQ9pq2BCEdYqOgnF87hcXCrf7cnEt5I0hUmja4R0zre6Iw7xrcD44oStCgwc2
 5J4RzyguyXwlasZD1T/wVn0lleqoYAl9kwRZIsdygENUpIGgnyQ6NwBQH/z9PeGbHp0h
 KbBe+OA2KNPH/C4EuSUHKRD5cqqv70KBGdgUWSo1+789FWSRcG80Wa0tpM02TG0n6T3v
 qKqQ==
X-Gm-Message-State: AOAM531t+JrSeLUV1jOvMN1chwhwuIOVVmDhX5i6Ml847nHO1rvm0w2e
 RF/0S3Crq0uOwK079RbI1Zk=
X-Google-Smtp-Source: ABdhPJy68mPDErnd2G9+c742obwbIJnC8gV8NgGp6qaB7zCtOoJZCtyBFFjTUjOZqHwKGSjAtNcV4w==
X-Received: by 2002:ac8:1948:: with SMTP id g8mr9978248qtk.354.1597589509829; 
 Sun, 16 Aug 2020 07:51:49 -0700 (PDT)
Received: from linux.home ([2604:2000:1344:41d:55b1:56da:5396:836c])
 by smtp.googlemail.com with ESMTPSA id
 w12sm13808442qkj.116.2020.08.16.07.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2020 07:51:49 -0700 (PDT)
From: Gaurav Singh <gaurav1086@gmail.com>
To: gaurav1086@gmail.com, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS), 
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drivers/nouveau_svm: fix bounds check in
 nouveau_svm_fault_buffer_dtor
Date: Sun, 16 Aug 2020 10:51:41 -0400
Message-Id: <20200816145142.25062-1-gaurav1086@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:42 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

do the bounds check before accessing the buffer element.

Fixes: eeaf06ac1a558 ("drm/nouveau/svm: initial support for shared virtual memory")
Signed-off-by: Gaurav Singh <gaurav1086@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 6586d9d39874..35d24946787d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -897,7 +897,7 @@ nouveau_svm_fault_buffer_dtor(struct nouveau_svm *svm, int id)
 	int i;
 
 	if (buffer->fault) {
-		for (i = 0; buffer->fault[i] && i < buffer->entries; i++)
+		for (i = 0; i < buffer->entries && buffer->fault[i]; i++)
 			kfree(buffer->fault[i]);
 		kvfree(buffer->fault);
 	}
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
