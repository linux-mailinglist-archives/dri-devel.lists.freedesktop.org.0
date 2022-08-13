Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C17591820
	for <lists+dri-devel@lfdr.de>; Sat, 13 Aug 2022 03:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4C6B18B2;
	Sat, 13 Aug 2022 01:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A25B1793
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Aug 2022 01:28:01 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id tl27so4650484ejc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 18:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=YmoJTNyzaF13sJjQqdmcZe+P251Yw5zHHjLRcL9xTeI=;
 b=TmkUV3209BIeXUh7/kdYN3SrXmwqY5Exgp2t+XC5giVuEdO5XBv+iW6NjlQ+f3Mf/k
 jodPeK2G+BBWfdKJF6MJIkBT9T/25IeCJcdC7buvStiJEuf6Tc9ivXdiBd9WJfOhwuPE
 NGUWUtH/ZBIFErmhhFj43rd5oR2KKBSEfXq/Dw+MEyeGb+zr6qblKyD8HcEED4fjhRQS
 w4CXsdPAZojXZH8kh6anSxi6Qq84sjnDHkwPfrCqxMZ5+FeoEon/0efaph/o6TSNV77Z
 wrYFuFujDjmPUvmvKJ3E9UjakzzvpawRvisbhunOE/K8JtQA9sPzhx3BfeCiCCtbEb6P
 XHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=YmoJTNyzaF13sJjQqdmcZe+P251Yw5zHHjLRcL9xTeI=;
 b=7z1pYU1c3HAW33KE2BGOMuJyxOKRusilqkO80qPHNHq4QeLmF5ZHhcccihHcgVRy3R
 k2iQUDJFQK7cm8QdXe1aaaxi/YVBJKV4/c9gOZTI5pH+c9Li3IqG9ByRtJLUvPNjSaLN
 E3Puh5G8FhViQFsQaK/6rb3JT3AKkOpUC+ycplPEqCqRvfPuRZt3ycwmDD1Lr+CEGhBf
 R9J38gA+ygAiOy4j1qhjqe3fJmPxGI+mxuXe3HEEJsWJX+G/eC34uVmXXlPyta1WjcoB
 A5jhaiJcJvVbslfEL78ixvYsxsvGyR0W61dUpX6v3v7E7D2r8QKcBWZHT4k7Dlq5r3HM
 /kaQ==
X-Gm-Message-State: ACgBeo0KGGkAgcblhSa6tMt6LAgbY9yezocDOOUskzcmEIZ8GkzHywDj
 jmvKQOxMpg2Fv9LTv8TME5brUTedXxyQ7tNH
X-Google-Smtp-Source: AA6agR78NECLpKwTiCLkOd39yhj+gHicuTr+QuNPfOJ0EIeKbpUtnFys1yM88F8GMp2SKzNn7P2llg==
X-Received: by 2002:a17:907:6da8:b0:730:8ed5:2df8 with SMTP id
 sb40-20020a1709076da800b007308ed52df8mr4150840ejc.75.1660354079445; 
 Fri, 12 Aug 2022 18:27:59 -0700 (PDT)
Received: from bas-workstation.. ([2a02:aa12:a77f:2000:7285:c2ff:fe67:a82f])
 by smtp.gmail.com with ESMTPSA id
 ot3-20020a170906ccc300b0072ab06bf296sm1342536ejb.23.2022.08.12.18.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 18:27:59 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] drm/amdgpu: Allow explicit sync for VM ops.
Date: Sat, 13 Aug 2022 03:27:58 +0200
Message-Id: <20220813012801.1115950-4-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220813012801.1115950-1-bas@basnieuwenhuizen.nl>
References: <20220813012801.1115950-1-bas@basnieuwenhuizen.nl>
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
Cc: christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This should be okay because moves themselves use KERNEL usage and
hence still sync with BOOKKEEP usage. Then any later submits still
wait on any pending VM operations.

(i.e. we only made VM ops not wait on BOOKKEEP submits, not the other
 way around)

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c  | 3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
index f10332e1c6c0..e898a549f86d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
@@ -51,7 +51,8 @@ static int amdgpu_vm_cpu_prepare(struct amdgpu_vm_update_params *p,
 	if (!resv)
 		return 0;
 
-	return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode, sync_mode, p->vm, true);
+	return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode,
+					AMDGPU_SYNC_EXPLICIT, p->vm, true);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index 6ec6217f0b0e..9233ea3c9404 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -75,7 +75,8 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
 	if (!resv)
 		return 0;
 
-	return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode, sync_mode, p->vm);
+	return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode,
+				AMDGPU_SYNC_EXPLICIT, p->vm);
 }
 
 /**
-- 
2.37.1

