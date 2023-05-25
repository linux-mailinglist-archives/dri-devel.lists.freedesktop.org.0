Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD38711833
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 22:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E9610E75F;
	Thu, 25 May 2023 20:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289B310E75D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 20:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685046935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3mE/fckEZuR9c9fPTu4FUL0ylsLmFraWECVvvXZLruc=;
 b=Uiutlln23m268hRLGJVExw72K0lt9owuu3WEtQ6oaYByHfSIvqgJ8Vs1tgJudk2aZK4JJf
 2gieL4IGUvpInllJUJmbX03csb63nZPgnLrrku2nl3tIg78zzgT3YiT380ADWYExOLPHyD
 bPMt09iTCJw0tir5UIx84lOKFdJc8F8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-gtSw9A8RMI-2RA2L0OfBOA-1; Thu, 25 May 2023 16:35:34 -0400
X-MC-Unique: gtSw9A8RMI-2RA2L0OfBOA-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-623a303a27eso2687656d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 13:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685046934; x=1687638934;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3mE/fckEZuR9c9fPTu4FUL0ylsLmFraWECVvvXZLruc=;
 b=V2OKcVgYElc/ttbO9hroKYbnVcxFYHcsO4Gy9Wzl+PrBacxdkVoG3+5X7YOrzOJobd
 DId9WXFHty74oyMtz1R95WwRyzklw4vL2ffwEMgcYmWjikCg7QeuFeTq7MdbIRERzFBr
 yC1qRqhN4QqspTzku1fGZrdRPMUn9ZmB/xIxMg8cxhjmTswXzafluTnhhNZRLCCPa2o9
 S2DoRhpt6vxcG5tDKdRAeXU+vxDGtSnQpkdNZ9QuF0GA4eOdstzj/3x3f+iPfoUsFZ9b
 en2OTjX7/N3Vt1JU81c7ayTXSrwqzxdy6TjSTG8N+yRBok7sNdRAYcG6YAOVxjjdY2us
 d9dA==
X-Gm-Message-State: AC+VfDzQTWLPNoxCHBOHiDL3QmP73c/0aQbEZJ9PnjH7XW3E/tKMB0QA
 3BSx60CC5bVahDUI+RLNuIWOVAOpASxd7lcVhSJRMAONvGizgcL6E+KglsMpFwTvHrVg0tUThmZ
 NI49mk7+z0HBTe80l/6vyOpg8eVc1
X-Received: by 2002:a05:6214:e6e:b0:625:ccca:328b with SMTP id
 jz14-20020a0562140e6e00b00625ccca328bmr2860158qvb.19.1685046934266; 
 Thu, 25 May 2023 13:35:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ45euEwzTp2G5RGMPSK3fbgDMQGjQu3VHUmMrVMif+hhFqBfdVa/ja2Hs14iGliwKoExaQfdA==
X-Received: by 2002:a05:6214:e6e:b0:625:ccca:328b with SMTP id
 jz14-20020a0562140e6e00b00625ccca328bmr2860132qvb.19.1685046934059; 
 Thu, 25 May 2023 13:35:34 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a05620a124400b0075b1c6f9628sm650389qkl.71.2023.05.25.13.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 13:35:33 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Hawking.Zhang@amd.com, le.ma@amd.com,
 jesse.zhang@amd.com, Jiadong.Zhu@amd.com, mario.limonciello@amd.com,
 Likun.Gao@amd.com
Subject: [PATCH] drm/amdgpu: move gfx9_cs_data definition
Date: Thu, 25 May 2023 16:35:31 -0400
Message-Id: <20230525203531.3233040-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gcc with W=1 reports
In file included from drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:32:
drivers/gpu/drm/amd/amdgpu/clearstate_gfx9.h:939:36: error:
  ‘gfx9_cs_data’ defined but not used [-Werror=unused-const-variable=]
  939 | static const struct cs_section_def gfx9_cs_data[] = {
      |                                    ^~~~~~~~~~~~

gfx9_cs_data is only used in gfx_v9_0.c, so move its definition there.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/clearstate_gfx9.h | 4 ----
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c        | 5 +++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/clearstate_gfx9.h b/drivers/gpu/drm/amd/amdgpu/clearstate_gfx9.h
index 567a904804bc..6de4778789ed 100644
--- a/drivers/gpu/drm/amd/amdgpu/clearstate_gfx9.h
+++ b/drivers/gpu/drm/amd/amdgpu/clearstate_gfx9.h
@@ -936,7 +936,3 @@ static const struct cs_extent_def gfx9_SECT_CONTEXT_defs[] =
     {gfx9_SECT_CONTEXT_def_8, 0x0000a2f5, 155 },
     { 0, 0, 0 }
 };
-static const struct cs_section_def gfx9_cs_data[] = {
-    { gfx9_SECT_CONTEXT_defs, SECT_CONTEXT },
-    { 0, SECT_NONE }
-};
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 8bf95a6b0767..c97a68a39d93 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -56,6 +56,11 @@
 #include "asic_reg/pwr/pwr_10_0_sh_mask.h"
 #include "asic_reg/gc/gc_9_0_default.h"
 
+static const struct cs_section_def gfx9_cs_data[] = {
+    { gfx9_SECT_CONTEXT_defs, SECT_CONTEXT },
+    { 0, SECT_NONE }
+};
+
 #define GFX9_NUM_GFX_RINGS     1
 #define GFX9_NUM_SW_GFX_RINGS  2
 #define GFX9_MEC_HPD_SIZE 4096
-- 
2.27.0

