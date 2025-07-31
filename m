Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1A6B16A4E
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 04:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1422B10E081;
	Thu, 31 Jul 2025 02:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SW9PqX71";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B65F10E081;
 Thu, 31 Jul 2025 02:08:16 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4561a4a8bf2so3984315e9.1; 
 Wed, 30 Jul 2025 19:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753927694; x=1754532494; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ttbMdEkxoTUOprk+YRVdSAOn6EZRYe2hYPzeU8X5k20=;
 b=SW9PqX71VB9evoggmb1jkRxsUgij7wqGfFWcVLSKsnf69MIpVNAj2hMsXgnNAvTMay
 5DXqp3fb0NdkVigMHzphsr4xvvlZANeeydFabc8GDJtNNlBk9vBXOduql7TeeQwvdnVu
 k057XmngSt1yGZXOwvABpw+dxwIvCJAnqLsxJG2mXqJVa/tYX5I5nCJXvU2noI19LVSI
 e83sUmuBU1KlPTsvIPMRXBA4mmBQhVIHxboGqUNbAL5roojJKNM/a5hxAtVNWiglf4Cd
 qU1ERcoWs2BTai27ssZ5cq8rc+xqOHRPRJ+RpS3sfB/n79YxsEdES3jsnsFLe3CUJ9fB
 dw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753927694; x=1754532494;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ttbMdEkxoTUOprk+YRVdSAOn6EZRYe2hYPzeU8X5k20=;
 b=g+v5hoe64tyiOTDoRmahemCsS1FWyYAsBmiiYPeKr5ve2WSc9/rRel1UgssrZJG0X2
 PUM4kc1c1buluZHocpkW9MyVBMoZWzNoO+9w26P0byDu/ANzAmxvZIu4FXop4SCvga6x
 zHe9m2XA6RvD0WKs6hVed8RRero1LWAvw+7j7Rmwhp4FGZ2DsLSxbie9lHMWCnQucOdt
 cJOMjS6577nOXVViGys+IX+D0ihcp8tgPE4lsegbdN5M9p1Sg2xKb6gFNDHD8WmjhesN
 nYc2WfDpW+ZSTvBrJ4x7ZeedBVd9ykQ1fi/IUJGShz14KuqYqTALXmhWmrcZFPQLqkCQ
 andg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaaLVPIQL5XrD5BbHdTRcK85nXvxjgD/sYx8ve+6mHhBe3YUu7uPKfLO+7OMWpxmV085xF4mxf@lists.freedesktop.org,
 AJvYcCX0e8CNp9HInF14X220TKP7mViOADbop6RxHH5js9OC+JSxlAMkvp6C05oCpiML33IUXwTlYwcTAnHI@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+ZaQRDinxLp6Plo+bXpmM1mx0jxX/ct/o1H82f9kL3gnSjbZX
 dPhY9bzaRHXG9+oIBg6+OLIcSjNgKCmFL7HRjnS1M+bhNa0jLEuw6w/I
X-Gm-Gg: ASbGnctnPvFdJUgtnzKRvYZG4fKGm+Z49Gg1Ed0r99FE2X2W/0s2VxO/4y1nTFBYydJ
 /d/RyYjqfJbtCo0gZPbr1VvoQ2CbQc0jrnpqfCj0FebqCzC41HZlv3w3q0rfSepjMtkWOmObGbz
 hS5PHZa+oTeS9QFhWAxZD6+pwZdWrYlwTuZdwZzx9wnFDBS7cdgNUQsZPshRX18qFuyR5qmNn4n
 wypxxjU0AZbbJSPLsfjQc0w9ONiUdCfAcwMHZAGwzA45DxgYIkIG80B9ClVqOb1lXCPr3X3pIgt
 PSeKkqS+XWk+vu1jhsOi6oKu8TpdOG/iLR9r/v4q4UmE0u7x7JqkAdCmRjW+2DhQ/0Ddq1ZZLHN
 x0LNvDkVGe+XC36nFeXQVqg==
X-Google-Smtp-Source: AGHT+IHsylB7+NHRuBW9mU53rbrnh3rovtARDLzE2S2cbV7OlcCzjAu5Wxz6+1u5fMJj5KOTcLkQ5g==
X-Received: by 2002:a05:600d:108:20b0:456:26ad:46d2 with SMTP id
 5b1f17b1804b1-45893943cefmr25724855e9.6.1753927694491; 
 Wed, 30 Jul 2025 19:08:14 -0700 (PDT)
Received: from pc ([165.51.119.21]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589ee4f239sm7657055e9.21.2025.07.30.19.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 19:08:14 -0700 (PDT)
Date: Thu, 31 Jul 2025 03:08:11 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: salah.triki@gmail.com
Subject: [PATCH V2] drm/amdgpu: check return value of xa_store()
Message-ID: <aIrQC78VWg17Iqhf@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

The `xa_store()` function can fail due to memory allocation issues or other
internal errors. Currently, the return value of `xa_store()` is not
checked, which can lead to a memory leak if it fails to store `numa_info`.

This patch checks the return value of `xa_store()`. If an error is
detected, the allocated `numa_info` is freed, and NULL is returned to
indicate the failure, preventing a memory leak and ensuring proper error
handling.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
Fixes: 1cc823011a23f ("drm/amdgpu: Store additional numa node information")
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
---
Changes in v2:
    - Improve description
    - Add tags Fixes and Cc

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index f5466c592d94..b4a3e4d3e957 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -876,7 +876,7 @@ static inline uint64_t amdgpu_acpi_get_numa_size(int nid)
 
 static struct amdgpu_numa_info *amdgpu_acpi_get_numa_info(uint32_t pxm)
 {
-	struct amdgpu_numa_info *numa_info;
+	struct amdgpu_numa_info *numa_info, *old;
 	int nid;
 
 	numa_info = xa_load(&numa_info_xa, pxm);
@@ -898,7 +898,11 @@ static struct amdgpu_numa_info *amdgpu_acpi_get_numa_info(uint32_t pxm)
 		} else {
 			numa_info->size = amdgpu_acpi_get_numa_size(nid);
 		}
-		xa_store(&numa_info_xa, numa_info->pxm, numa_info, GFP_KERNEL);
+		old = xa_store(&numa_info_xa, numa_info->pxm, numa_info, GFP_KERNEL);
+		if (xa_is_err(old)) {
+			kfree(numa_info);
+			return NULL;
+		}
 	}
 
 	return numa_info;
-- 
2.43.0

