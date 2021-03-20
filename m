Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D91B0342F75
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 21:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA546E0D5;
	Sat, 20 Mar 2021 20:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C256E0D5;
 Sat, 20 Mar 2021 20:10:58 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id o19so6852593qvu.0;
 Sat, 20 Mar 2021 13:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vk92B5101C0kSYxKtRdztG8qIATiTlmHbCiHUucp3As=;
 b=Fnfw2M9RhXcyiQzRjIyfVfnODuAjYcEbD3nWIZnkJmiyAcD9O8OdGEY3thX4LrGr+x
 76AhTu+XdFF2CQh76gziI3ZpzZzHRq2WNeEJ7O7MtFHaqRk8syZPpeQ+YNO3JMHsg7QD
 4Z+otCOKfVCt89vDCo1wfl9W/Hf6caKTfZOaPviyOF9tRlDPdt1Cjm+v6W7s9IMzV+yy
 fAKRgHse3hVQyhKsAgtl/M08guvjnrOCsB4ZIN5ZlAnPGw0CFJOJcc6I9RqO8/442RY2
 bSif9mguJU99QHzehNs4VpCwdOp1Fmuqs5jdYERmh07yUPyX2Of+eT8BANHfN8Sz01vG
 VzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vk92B5101C0kSYxKtRdztG8qIATiTlmHbCiHUucp3As=;
 b=sYU8ETs8ttuN1Aj3ENcaZ59MMv/ij6QcRhvdHl1//qXWxheFYIYbZOoWmuoprbHq6A
 f+VMPMvg4dcRIsMXFqnO5y1652VuSnw/sjGRMuZxw0YUZSxS9ZXtGXRH9DdimZuibXTW
 1CE2QevilS+bqVrIiMoy2IDrRuG1b7N51F59tgzrqTjWYiZCwgVFIf/q1hW968kJ5vWQ
 NvDxS/WzrvI4FwJySq7Xpa0SYsV4FKG4vQSk76KBG9XiHFaxOGNAq2ouzU2TSxrv/aQx
 lt7UbgtIEi8r5cgev8mZHvyQETO8fxnH6cU5tq655z/mEMwtlqkBJoHtLscBfB90/nkN
 1tAw==
X-Gm-Message-State: AOAM531vJFBrwHTEPMhxZymPRr/nIkVVqGa2SZOrp2Xv8gBIIedk1lJJ
 PpzvM5Sz0x8BJUuvM09JUslMJjaXuWC3Hw==
X-Google-Smtp-Source: ABdhPJxtAXJH33gyeSSRkTb5jiBIK+W4Zj+npCFjzqCmqg9i+lBQjgHS2zHOrORVUGq+NT3Ucgzejg==
X-Received: by 2002:ad4:584a:: with SMTP id de10mr14886331qvb.50.1616271057303; 
 Sat, 20 Mar 2021 13:10:57 -0700 (PDT)
Received: from tong-desktop.local ([2601:5c0:c200:27c6:f925:bb4b:54d2:533])
 by smtp.googlemail.com with ESMTPSA id h7sm7018999qkk.41.2021.03.20.13.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 13:10:57 -0700 (PDT)
From: Tong Zhang <ztong0001@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/radeon: don't evict if not initialized
Date: Sat, 20 Mar 2021 16:10:52 -0400
Message-Id: <20210320201052.114775-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Tong Zhang <ztong0001@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TTM_PL_VRAM may not initialized at all when calling
radeon_bo_evict_vram(). We need to check before doing eviction.

[    2.160837] BUG: kernel NULL pointer dereference, address: 0000000000000020
[    2.161212] #PF: supervisor read access in kernel mode
[    2.161490] #PF: error_code(0x0000) - not-present page
[    2.161767] PGD 0 P4D 0
[    2.163088] RIP: 0010:ttm_resource_manager_evict_all+0x70/0x1c0 [ttm]
[    2.168506] Call Trace:
[    2.168641]  radeon_bo_evict_vram+0x1c/0x20 [radeon]
[    2.168936]  radeon_device_fini+0x28/0xf9 [radeon]
[    2.169224]  radeon_driver_unload_kms+0x44/0xa0 [radeon]
[    2.169534]  radeon_driver_load_kms+0x174/0x210 [radeon]
[    2.169843]  drm_dev_register+0xd9/0x1c0 [drm]
[    2.170104]  radeon_pci_probe+0x117/0x1a0 [radeon]

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_object.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 9b81786782de..04e9a8118b0e 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -384,7 +384,9 @@ int radeon_bo_evict_vram(struct radeon_device *rdev)
 	}
 #endif
 	man = ttm_manager_type(bdev, TTM_PL_VRAM);
-	return ttm_resource_manager_evict_all(bdev, man);
+	if (man)
+		return ttm_resource_manager_evict_all(bdev, man);
+	return 0;
 }
 
 void radeon_bo_force_delete(struct radeon_device *rdev)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
