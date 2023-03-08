Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBE36AFAF7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 01:19:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7612E10E575;
	Wed,  8 Mar 2023 00:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C2D10E576;
 Wed,  8 Mar 2023 00:19:20 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so403665pjp.2; 
 Tue, 07 Mar 2023 16:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678234760;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jbbkKWGQad1Yo20rF0OSP26kDIz9idmRlHUsiPHwLP0=;
 b=Rm+qhWk2qemYa9svIsqx6TTWMg1Zx0Ip5gtBEEpY6kzQhHMvkEt/VCl9Z2/F1e4Rqp
 ml1bDveChx60PEPlfF88iBrkNnEJFZQpyAxM92NXbhnf9TeofmIeqa+EVGNzENmZuTuN
 MT6JO7vCpYcEFlD2qYn7UipubEAjLGmSJKyeZ1ZCqY7vfU1JnRmCBAzpJoG4UqpjL8/W
 yGUhcM4dJ2jnHol+XsR32P/w898aLZSmPFzNAp6iseI4ht2ZfbUi/YwesGUlSWpYxheU
 ok4cWjpLDK3xOjM4gyYsA99zBXvB6aSah3TYFwA3bh+ygGWd8Sp/wbN/CwSDZ8HS75xi
 l5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678234760;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jbbkKWGQad1Yo20rF0OSP26kDIz9idmRlHUsiPHwLP0=;
 b=2dHRW9Gl5841Kdi4M/fNL1j4OSpywaLXOG7wAEDLGOiueqf/Tb2DfupD+eGE2Jc9OV
 5Ss8keNG58ubKrqdd65JVZY8HiDm6A4rADpNhOjBiJybtVgmhYQO8cMXVvjlV1iFp130
 5i0btt64EwRrbwOSp2MSoE/FbQeAQwWhVqxHdZ0FMn1ypj/VQEgogW/FE+e+FFSiYpEF
 qaaXU85LCm+F+N/QeA3MAi5HJzLJy0CxfkPSkc/QFgGrpcHJYz3uoQSMHwLDMkIlECSQ
 E8DxpkLP03GkISEAJ8N1AlqMK4PCsDMyMKE03SZPf9Cgq+yGy09+ZTFHF0zMhSnhVI2M
 VyaA==
X-Gm-Message-State: AO0yUKUwJGj1BXtE4td8lAh2XjbmoqJ11lThkQUIEY8OnjMvHpfBiDlF
 3pdMBXpJ5ZmPo/IBpeRZ96W6bjec4N4=
X-Google-Smtp-Source: AK7set8AFivGG9BQh9psczFalSR8xG8ofPsLWNbpH6SfZcW/EPMaaAmp91RyP6uKjST1thbRzcRLAw==
X-Received: by 2002:a05:6a20:8404:b0:c7:af88:3dd8 with SMTP id
 c4-20020a056a20840400b000c7af883dd8mr20385425pzd.6.1678234760003; 
 Tue, 07 Mar 2023 16:19:20 -0800 (PST)
Received: from olv-ct-22.c.googlers.com.com
 (132.111.125.34.bc.googleusercontent.com. [34.125.111.132])
 by smtp.gmail.com with ESMTPSA id
 b9-20020aa78109000000b005a8e97fc71bsm8366463pfi.84.2023.03.07.16.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 16:19:19 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdkfd: fix a potential double free in pqm_create_queue
Date: Tue,  7 Mar 2023 16:19:02 -0800
Message-Id: <20230308001903.2841087-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set *q to NULL on errors, otherwise pqm_create_queue would free it
again.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 5137476ec18e6..4236539d9f932 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -218,8 +218,8 @@ static int init_user_queue(struct process_queue_manager *pqm,
 	return 0;
 
 cleanup:
-	if (dev->shared_resources.enable_mes)
-		uninit_queue(*q);
+	uninit_queue(*q);
+	*q = NULL;
 	return retval;
 }
 
-- 
2.40.0.rc0.216.gc4246ad0f0-goog

