Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 584484A3021
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jan 2022 15:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B79E10E553;
	Sat, 29 Jan 2022 14:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BC710E553
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 14:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643468042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ug7sd4MyyeKE9edVrNKTjnr3ZIjzipUabJp6vX5YHNg=;
 b=IGysB2KkATyff85mIK5A+JMpNrrQyv94v3GY/ODyGwPvLYAwYNaul3S2sJ4P1uk9UJPC9m
 uSwRSxnNUWttF8oUvEK1hoQyu95DTmACk8SZ2IR3ukOmX/SOI5P7j9Omcfk2XcQFu3h8To
 le89jZRdtXUFfn9LkKf8WME0GTXOEZo=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-MAWagF1HOFGShTUwI9lsYg-1; Sat, 29 Jan 2022 09:54:01 -0500
X-MC-Unique: MAWagF1HOFGShTUwI9lsYg-1
Received: by mail-io1-f72.google.com with SMTP id
 y124-20020a6bc882000000b0060fbfe14d03so6576858iof.2
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 06:54:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ug7sd4MyyeKE9edVrNKTjnr3ZIjzipUabJp6vX5YHNg=;
 b=BgwsYBVbn8TCsU7a7ium0sfzCe3n2hwmdCbTf1C6tYWKEtwvg3uyt5wWwVrtM57RVr
 MLtFQTP7mfATB7tRwBApqFzsePbJKVydOontNiidGUYmz0n63vv9XTat0OjwjKAtWVEM
 jIOC000xNbjIM/cFL5kYgPGTNMeCBzPg/kvl0X299aEGRqMERBEods32GQu0J5k/8vAH
 qhqPh2ozYAHeX8r0F7mP/Uo9ZcqQwApBxNqb/qpXiUj7n4rvCJwi1thqQLTPSrJk4gvq
 +qmNW5h+W+yITeNGHECoabZ/D3uwxBoclqIpAUz0ALo014wz4qsT+RVglH+3t9e9nCjB
 VNeg==
X-Gm-Message-State: AOAM530idzxZNxF5gz7PnZjPGynBBWIFWOgcssLgPYktlSsniQmQ3Mu2
 vEQ+8ZxTfKBbjNjzPCsD0plUctCaNuiVyxu03hQO3zIhDqung9vd+2XYYs6U4j3rxneXxx7pf7s
 tXjTv99a1sBTy+Ke9tSv3taip7a+9
X-Received: by 2002:a05:6638:33a1:: with SMTP id
 h33mr6293245jav.78.1643468040562; 
 Sat, 29 Jan 2022 06:54:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwgXCva834kyAbS4ly/S/GHDc8v1pjp6kH32zHTbUhflIF5l0lCvtPA+s2R8yYYEuRITEFGA==
X-Received: by 2002:a05:6638:33a1:: with SMTP id
 h33mr6293223jav.78.1643468040391; 
 Sat, 29 Jan 2022 06:54:00 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id p7sm14191616ilo.71.2022.01.29.06.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 06:53:59 -0800 (PST)
From: trix@redhat.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com, PengJu.Zhou@amd.com, candice.li@amd.com,
 Hawking.Zhang@amd.com, john.clements@amd.com, Jingwen.Chen2@amd.com,
 bokun.zhang@amd.com, victor.skvortsov@amd.com, bernard@vivo.com,
 lijo.lazar@amd.com
Subject: [PATCH] drm/amdgpu: initialize reg_access_ctrl
Date: Sat, 29 Jan 2022 06:53:47 -0800
Message-Id: <20220129145347.1417849-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

clang build fails with
amdgpu_virt.c:878:51: error: variable 'reg_access_ctrl' is
  uninitialized when used here
  ... + 4 * reg_access_ctrl->scratch_reg0;
            ^~~~~~~~~~~~~~~

The reg_access_ctrl ptr is never initialized, so
initialize once we know it is supported.

Fixes: 5d447e296701 ("drm/amdgpu: add helper for rlcg indirect reg access")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index 80c25176c9932..c137652189190 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -875,6 +875,7 @@ static u32 amdgpu_virt_rlcg_reg_rw(struct amdgpu_device *adev, u32 offset, u32 v
 		return 0;
 	}
 
+	reg_access_ctrl = &adev->gfx.rlc.reg_access_ctrl;
 	scratch_reg0 = (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->scratch_reg0;
 	scratch_reg1 = (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->scratch_reg1;
 	scratch_reg2 = (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->scratch_reg2;
-- 
2.26.3

