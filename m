Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3256232FFDC
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 10:20:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2486E57E;
	Sun,  7 Mar 2021 09:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8926E57E;
 Sun,  7 Mar 2021 09:20:33 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id a4so4428712pgc.11;
 Sun, 07 Mar 2021 01:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=c4bUo1XFYPqAeWFc5nQ4FKN414jxkX238K1R/ykzSZ0=;
 b=D7UhJ7EnN9e5KT1lZ91iZj61RL26XDi8obkAgdhqzDnNcwkKNLsaf8VqM3RWRjtWt5
 OdPE8Bc2svyUlL1HrlfidK5ckxDvUAqoVtXcGzvRKCiXXYMeG1K57dunTWAtcY9u5NGR
 MczLfdo6LenbQugvzgRKNStdiXaObz5Du/XvUzxkic0qsOzctUgB4IfA0Ed3/psuU4VK
 gJbl7EET9zA2itrQEFE+Vip00b8UNbLXLufTw3KOWrPXcE2YroffGvC6oqdJ/1HzFTYJ
 gnmBpnURiqgSCjxKezNt8vtmq20VB8Sg7zxDRoTuUHUJzo2Ep0qMQGqrjPY/uzreQSCF
 N24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=c4bUo1XFYPqAeWFc5nQ4FKN414jxkX238K1R/ykzSZ0=;
 b=dpzkDcwiZHFvA7C18O6tQySEN1wIqmoWYwVJxZew+F/uYEBzQaZbC5/6pvgNw5/sm1
 A23Q4OGLH7NJjDnIf+VrUp5dTW2ZQ1AmWE5FsT0HvwkMpbyQG1ubXtO6abD/za7cDVVD
 JB13rFvyKQVkeKLi+HZpS+SN3dwAYRLlkwLmDOVSLcdlw0DUcPsQYLuMELULvhAaE99q
 yuvfpGma2ibDN2YSnWOaw5kCAdVNFFyBQ7RRkUmrjHfYs3uaZ+KZZv+BfTla3UGa8JcN
 nUtVodwUe7ANyXUBnJvRDHGNmcxQzAfF6qmmZPrW8KumP2KyZOMem1v85wNefL7IVRe8
 zyJA==
X-Gm-Message-State: AOAM5332ug4C1GrBSmS7IxD+rCEJ2AdtcUZYIcWTrPKRmHZl6P5tUhYB
 LblBCoM++T5gbPUShv9js/g=
X-Google-Smtp-Source: ABdhPJz1uPwCUfKa/qYEPfhyrW47W1tOAJ6N5pgPD/1Mb7yG5oWsxd78yWCbc1nuD6bFQeJS1n/6/w==
X-Received: by 2002:a63:e109:: with SMTP id z9mr15927732pgh.5.1615108833244;
 Sun, 07 Mar 2021 01:20:33 -0800 (PST)
Received: from localhost.localdomain ([45.135.186.66])
 by smtp.gmail.com with ESMTPSA id o3sm6825678pgm.60.2021.03.07.01.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 01:20:32 -0800 (PST)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, yebin10@huawei.com, luben.tuikov@amd.com,
 Likun.Gao@amd.com, Prike.Liang@amd.com, avg@FreeBSD.org
Subject: [PATCH] gpu: drm: amd: amdgpu: fix error return code of
 amdgpu_acpi_init()
Date: Sun,  7 Mar 2021 01:20:10 -0800
Message-Id: <20210307092010.23117-1-baijiaju1990@gmail.com>
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
Cc: Jia-Ju Bai <baijiaju1990@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add error return code in error hanlding code of amdgpu_acpi_init().

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 8155c54392c8..156f30d5a2c0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -788,12 +788,15 @@ int amdgpu_acpi_init(struct amdgpu_device *adev)
 
 	/* Probe for ATIF, and initialize it if found */
 	atif_handle = amdgpu_atif_probe_handle(handle);
-	if (!atif_handle)
+	if (!atif_handle) {
+		ret = -EINVAL;
 		goto out;
+	}
 
 	atif = kzalloc(sizeof(*atif), GFP_KERNEL);
 	if (!atif) {
 		DRM_WARN("Not enough memory to initialize ATIF\n");
+		ret = -ENOMEM;
 		goto out;
 	}
 	atif->handle = atif_handle;
@@ -803,6 +806,7 @@ int amdgpu_acpi_init(struct amdgpu_device *adev)
 	if (ret) {
 		DRM_DEBUG_DRIVER("Call to ATIF verify_interface failed: %d\n", ret);
 		kfree(atif);
+		ret = -EINVAL;
 		goto out;
 	}
 	adev->atif = atif;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
