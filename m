Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D14E39F59F7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A8D10E305;
	Tue, 17 Dec 2024 23:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SXhkv3At";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E80D10E305;
 Tue, 17 Dec 2024 23:00:18 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d4e2aa7ea9so3326700a12.2; 
 Tue, 17 Dec 2024 15:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734476417; x=1735081217; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MFHlrKsNj2nTROqoaF03zdCs62Jx2PNpLmDst7mEkDA=;
 b=SXhkv3AtD8VsRt93UR40e+s81l1p16glyUpc/S7Cz6DzKmzv1A+wXOyzzkkv+l7I0M
 ec7m/aExjCScDpJ81P6J2uAjOzQp8ADHe4hZjpUaKgWTA90bjBSRWkr0ZNog6wi1hwBl
 e7CnGT9wn9j610vTsOgfwftq7e95lDxaL7SEN1O7PddqBCONRHa58bhX8JvyF2cWnUfP
 J3y5cRFxjm3Sxq3glnQnW69ZAwZBoB9VIXHfjT+BGBWhXhcnE3VX4AMczwAuuDdIQCc+
 iuwHIs06vs4MhOqEPeOxmiqPhmsYMvmbZmzFzNF7RSirdM5QPa7zLieI1he2BFEr++GX
 tDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734476417; x=1735081217;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MFHlrKsNj2nTROqoaF03zdCs62Jx2PNpLmDst7mEkDA=;
 b=v1twpg9VXhO/bDMR3qXCaOgpfHDdx+vd/g25w6uulQEHX2kneRTCD1SeGWdKdDFMxX
 vyt5b2OAJLZisPTOSCkrL3FQMe/rW3T1RoqZ/kyXVd9Uf2FUSBfkERlri7UzAYuhBUav
 QS55sr7wHOeS+3QPonxNra6MKb/cRvYXJIB/qdLVmzvuIvN8D2nKQ/4H84oY6KqlNdil
 RuexRlnaeyM0c5/1+/Zwekyd5hpuzeGDBhAY3K7iX5MFiUgreLPAzCEhtvcbxLIEG8nq
 Zonrgd6W+HJFZbi7ihQA6lTQxnYeKSj6CRyOP2eyjacRgkEUskbybNStujmTWIEwah1z
 PG5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZxqadqMGt8uuoT/UmP8EWzkaG3bL9gMu312XNvfeRQRTEtDLecwAJr1I6nUwytxqhBrpwpbBrmqzv@lists.freedesktop.org,
 AJvYcCXcF2pt1EwCk3ci/9E+li+QLbm0wK/NzReDIOHT3sAuFRLv9DHpp5Pn3mIBoNRzpC9E7f0oiZpW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKr0HKvk8Kk0dZvIBOnu9pavOEuqqsDGXYJpZn3jJUsn3XTdtK
 YsiVYlzKnXxxJe72hJ7Npu60FwsDJSdGDTMHlOJS80nMtLe+i3sxHkZOmQ==
X-Gm-Gg: ASbGncuZlPKQsXzIKOWxLFc4RKr75Sq4652TfMUAAAFEp4D+eE9oy7iM99dpA/yEd0j
 KdgUfSmFy+cuUCsAtTZOSsGkD6yIrU8ZCuHdLxUqpWB4nBaddTxMVCLT3OCNsZlXUDhaBBL0oZR
 7jNs+HVhwI4D0TEVvGV28sgWSyRWFUXFSZJFeGwqpMHe9ikomPmzzRgqXpb8igrqZH2jMza8a3R
 9xKWTpkz5+nvVfEkg/zlYQ5bmCk5lNEXVkGJ4AsIdHfWqbWOGlzlFvDMpW6zV9NeeEoxupb
X-Google-Smtp-Source: AGHT+IGseKPOWt+FNZcwAVW2rCKFGixSzJ+XFmlitmEI87kClR53LP1fPFfQ91j/1mJmiGx0AiKAxg==
X-Received: by 2002:a17:906:30cb:b0:aa6:7c36:3423 with SMTP id
 a640c23a62f3a-aabf46fc8fbmr37360166b.1.1734476416434; 
 Tue, 17 Dec 2024 15:00:16 -0800 (PST)
Received: from localhost (dh207-43-57.xnet.hr. [88.207.43.57])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab9606b3a0sm487066666b.81.2024.12.17.15.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 15:00:15 -0800 (PST)
From: Mirsad Todorovac <mtodorovac69@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Victor Skvortsov <victor.skvortsov@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Mirsad Todorovac <mtodorovac69@gmail.com>,
 Zhigang Luo <Zhigang.Luo@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Vignesh Chander <Vignesh.Chander@amd.com>,
 Danijel Slivka <danijel.slivka@amd.com>
Subject: [PATCH v1 1/3] drm/admgpu: replace kmalloc() and memcpy() with
 kmemdup()
Date: Tue, 17 Dec 2024 23:58:10 +0100
Message-ID: <20241217225811.2437150-2-mtodorovac69@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The static analyser tool gave the following advice:

./drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1266:7-14: WARNING opportunity for kmemdup

 → 1266         tmp = kmalloc(used_size, GFP_KERNEL);
   1267         if (!tmp)
   1268                 return -ENOMEM;
   1269
 → 1270         memcpy(tmp, &host_telemetry->body.error_count, used_size);

Replacing kmalloc() + memcpy() with kmemdump() doesn't change semantics.
Original code works without fault, so this is not a bug fix but proposed improvement.

Link: https://lwn.net/Articles/198928/
Fixes: 84a2947ecc85c ("drm/amdgpu: Implement virt req_ras_err_count")
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Xinhui Pan <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Zhigang Luo <Zhigang.Luo@amd.com>
Cc: Victor Skvortsov <victor.skvortsov@amd.com>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Lijo Lazar <lijo.lazar@amd.com>
Cc: Yunxiang Li <Yunxiang.Li@amd.com>
Cc: Jack Xiao <Jack.Xiao@amd.com>
Cc: Vignesh Chander <Vignesh.Chander@amd.com>
Cc: Danijel Slivka <danijel.slivka@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Mirsad Todorovac <mtodorovac69@gmail.com>
---
 v1:
	initial version.

 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index c704e9803e11..0af469ec6fcc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -1263,12 +1263,10 @@ static int amdgpu_virt_cache_host_error_counts(struct amdgpu_device *adev,
 	if (used_size > (AMD_SRIOV_RAS_TELEMETRY_SIZE_KB << 10))
 		return 0;
 
-	tmp = kmalloc(used_size, GFP_KERNEL);
+	tmp = kmemdup(&host_telemetry->body.error_count, used_size, GFP_KERNEL);
 	if (!tmp)
 		return -ENOMEM;
 
-	memcpy(tmp, &host_telemetry->body.error_count, used_size);
-
 	if (checksum != amd_sriov_msg_checksum(tmp, used_size, 0, 0))
 		goto out;
 
-- 
2.43.0

