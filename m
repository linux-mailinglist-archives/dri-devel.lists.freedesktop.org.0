Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF40494B88
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 11:17:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1F910E7C4;
	Thu, 20 Jan 2022 10:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF19C10E7C4;
 Thu, 20 Jan 2022 10:17:53 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id e8so4798839plh.8;
 Thu, 20 Jan 2022 02:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=rdBW0j5QQWhMLX1FKpoagwlaHny7USjq4sUZI4cs1fE=;
 b=okHs6cOUaGLya4BJJW9td244ZQrPan4DTQ8eym4VDUiEE/pliKgmIEijdwdyZbjKfX
 mbO9y0ZXTKOXQYlnj93QUnGFKN9hmMCtDgqaI2/kDRTchPd1qbd2ucbYDNhjHbtIrsSt
 v6c/JjbHE8QWG1HDSjc0kSuD7kbZr55DXGG3+KAJvJ0IPLaUz8p/ICXMN+zRSRtNjwYl
 dQkyi2xomTA+LhCVaw0GMNkuf4fPBbIgKcbQiptNED3agNqudbwo8oHzWg4tDbPfbe76
 XKVIGzCg9RPq6h636C4I77z7uWQIgLcuk+Tl+JcI0iwtvUApqjJraXuZGfvT7XSZWZ2L
 urcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=rdBW0j5QQWhMLX1FKpoagwlaHny7USjq4sUZI4cs1fE=;
 b=CZDo/iknB2NoyKGo8kcgndqebG/jvq/TMspdSyy4Uz3jD6iQdH91OJrJGz1b0E1Nte
 xcpL7w7s89stK7OKqfNOu/CTFKoEeR0xR9RlVWs2m4OU2U6tCgBcoR0eZo9aFANzXOT5
 KNKG0KbhOPz2hAIMjGc990d9C1YWKM2BvCurQDCesJbnf1n5al7z2ZNDhzgf4Kv3h06h
 u5o5yGu3/9en8zi7B5P7aNHGhP3klgbGexCzQCyuk1wYsTPtoPn5I8ebDT6nF/xSYRmw
 kuDcEUM8bqDjJdePyh8+gHEVWZIJ9Kden0xeczJ9fJnaL6w+hmBA2dOuMjU7AL4MldUz
 M6LA==
X-Gm-Message-State: AOAM5334VVKfJXpPhGoIkdWguHCg50ZJ79nbHzkHI/1ShCTHLaQ9XQJK
 HkPOrZ9rIvQ6UFKmpL3Irrk=
X-Google-Smtp-Source: ABdhPJyeMp9RNX3h2fsUBSP5ombifhj5R4/4Wk9OoG84WlguEkGvIfX/1cSt4nKN2RqGXj+FFM6WKA==
X-Received: by 2002:a17:90a:d154:: with SMTP id
 t20mr9972019pjw.43.1642673873398; 
 Thu, 20 Jan 2022 02:17:53 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id h12sm2070618pgh.79.2022.01.20.02.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 02:17:53 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 John Clements <john.clements@amd.com>, Jonathan Kim <jonathan.kim@amd.com>,
 Bernard Zhao <bernard@vivo.com>, Miaoqian Lin <linmq006@gmail.com>,
 Kevin Wang <kevin1.wang@amd.com>, shaoyunl <shaoyun.liu@amd.com>,
 Tian Tao <tiantao6@hisilicon.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Fix double free in amdgpu_get_xgmi_hive
Date: Thu, 20 Jan 2022 10:17:43 +0000
Message-Id: <20220120101746.24847-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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

Callback function amdgpu_xgmi_hive_release() in kobject_put()
calls kfree(hive), So we don't need call kfree(hive) again.

Fixes: 7b833d680481 ("drm/amd/amdgpu: fix potential memleak")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index e8b8f28c2f72..35d4b966ef2c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -393,7 +393,6 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
 	if (ret) {
 		dev_err(adev->dev, "XGMI: failed initializing kobject for xgmi hive\n");
 		kobject_put(&hive->kobj);
-		kfree(hive);
 		hive = NULL;
 		goto pro_end;
 	}
-- 
2.17.1

