Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF276B24BBE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 16:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F83C10E1E6;
	Wed, 13 Aug 2025 14:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nktl0P0V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5198910E1E3;
 Wed, 13 Aug 2025 13:29:14 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b4245235a77so5566472a12.1; 
 Wed, 13 Aug 2025 06:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755091754; x=1755696554; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MOAo8EwGGhxCp+3TT0ofu53bm0FTlq8gbWgzZZLtVDg=;
 b=Nktl0P0VnF/bwrXxxss4ITeT7fpNhiJr9J8Zbtsse20bb//3c/1gAmw+D6cjRRyTUZ
 TaiifJ4qldOufq80OMWKau/+sV9knhoN9UBowofs55gdeRMUhQxPaab/JLJZLPVuSsVh
 n8+2W9FjadN9bXB8QBVzg0XLEkFDeSGJogY2//92C3Seiuv7J+AGKZW1z46bSmMGYexH
 kbB0H9ZlDBfnk2Q05cpNZ+mjC9aB18IKQBbeAiqoSsMA2ptngEmJ5Y4EV8O07jy3UK30
 9F+jJRea2zY5zul5E+Bce+SQPkedEZQrjHrgD48FPTk5TB9WoUjPeqxuW5PlspkzJeJR
 FvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755091754; x=1755696554;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MOAo8EwGGhxCp+3TT0ofu53bm0FTlq8gbWgzZZLtVDg=;
 b=QNkl75gVE29IarpDC1xJNn1h8o8pBH339hCTqT2XLZ0v1PH+Y66MpraSA8M7fJwvsJ
 MNo2NvSeSweZIPCNmCAf7gjBE6a5v3rkOoL+mBrmw2NJ2uCGtuqr0jt4HCT0d60O2gsB
 6SQoOoG+8KXbmDzJ8SiYppTosEkOw95HAxCgbxyurAYW5O3tQERiLgAWsshycUGk+V5Y
 7UnjjB35SkMNgBTKKu3ESqChskbvMNLcQVpi6AghbcZAsfes40pk1SIsI4LMga6E/YX1
 eJcMHeIbeItA+k53QhqFCVmAsRKbpTSh+ERglW5aJSQMorqRsVsdSZKzZFwJP+1Ep7TH
 6Cfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTeoK+Ar4ya1wt25Ms+TZddgcDlVKEAQvj9GbXG67/AIIuZk7QdxnplQHiREWUKEhwuLQ9tMNtYBs=@lists.freedesktop.org,
 AJvYcCWHga2HCRCkS6y8KFADL12H5jGXIOI+tHMOjOol1ND+C1i4xuCphXHIMv+ZUtLirmnAqc0ZocOVhQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzN6t0NvEzoyMYeKl0Rc+S4Fp6GDy5LstjvUL6dIXUhIeEZ8n86
 9GGS6ka/LYrdoZgi8tnrrdS34HFtoVSrWhdeaFASYeD/mgg66+Q1syL+
X-Gm-Gg: ASbGncssuWl/XjBPiPSWjfU/XsC5b1mLY3fxUvQqdpaqFkKHLCb1X7TbEnKsahjHPmJ
 NApB6O/istiHSlZuAZvU7J7sGXRnxzBO4RAKnIuvU2t/19vLYB89Llpm4HoEcMTkQ1CAe0Dv7oP
 SHVEw3M4Y92I1RQWLhgfTbsVnGUzUtvwXiVHO3VexqMYQcqkff+jPufBs5gqGPbJ3mgnmg2lL87
 FV35jEmQvl7iCJ2jvQXnl3rLOHZiifLaO4fvbpv+2ON2ec3rW061Z6WEHLgZM60SCnXQw0M/loz
 6m7IOoECGodU2JT3GQUBDM5SkBk35jDXUEogaBHaOx0NEezuzjWbT8pu5TaVUvY4cTEU1SHK9vb
 czdg3SAnIIHyYmi9AtguPpxaNJKZcsEGzwj+r0V+YmfLHPJzl
X-Google-Smtp-Source: AGHT+IGvJu2is807ZROPWMJAIvi4HljR+5vdCuYlSyAioa2q1juIjzC61Y4AXfJ1YhjEMjHGEyK6Qw==
X-Received: by 2002:a17:903:1a0b:b0:240:671c:6341 with SMTP id
 d9443c01a7336-2430d1a0ed4mr46283215ad.26.1755091753689; 
 Wed, 13 Aug 2025 06:29:13 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:8898:77ef:a09b:a8f4:7c6e:b37d])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-242ff10e4ffsm45530725ad.38.2025.08.13.06.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 06:29:13 -0700 (PDT)
From: darshanrathod475@gmail.com
To: lyude@redhat.com,
	dakr@kernel.org
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Darshan Rathod <darshanrathod475@gmail.com>
Subject: [PATCH] drm/nouveau/acr: remove assignments from conditional
 statements
Date: Wed, 13 Aug 2025 18:59:05 +0530
Message-Id: <20250813132905.653228-1-darshanrathod475@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 13 Aug 2025 14:18:40 +0000
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

From: Darshan Rathod <darshanrathod475@gmail.com>

Replace assignments inside if statements with separate assignment and
conditional check. Assigning variables in conditionals can obscure the
code flow and reduce readability.

This change improves clarity and follows common kernel coding style
practice. There is no change to functionality.

Signed-off-by: Darshan Rathod <darshanrathod475@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
index bd104a030243..f9ac300803e5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
@@ -71,7 +71,8 @@ nvkm_acr_lsfw_add(const struct nvkm_acr_lsf_func *func, struct nvkm_acr *acr,
 	}
 
 	if (!lsfw) {
-		if (!(lsfw = kzalloc(sizeof(*lsfw), GFP_KERNEL)))
+		lsfw = kzalloc(sizeof(*lsfw), GFP_KERNEL);
+		if (!lsfw)
 			return ERR_PTR(-ENOMEM);
 
 		lsfw->id = id;
@@ -95,7 +96,8 @@ nvkm_acr_lsfw_load_sig_image_desc_(struct nvkm_subdev *subdev,
 	struct nvkm_acr_lsfw *lsfw;
 	int ret;
 
-	if (IS_ERR((lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id))))
+	lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id);
+	if (IS_ERR(lsfw))
 		return lsfw;
 
 	ret = nvkm_firmware_load_name(subdev, path, "sig", ver, &lsfw->sig);
@@ -260,7 +262,8 @@ nvkm_acr_lsfw_load_bl_inst_data_sig(struct nvkm_subdev *subdev,
 	u32 *bldata;
 	int ret;
 
-	if (IS_ERR((lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id))))
+	lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id);
+	if (IS_ERR(lsfw))
 		return PTR_ERR(lsfw);
 
 	ret = nvkm_firmware_load_name(subdev, path, "bl", ver, &bl);
@@ -296,7 +299,8 @@ nvkm_acr_lsfw_load_bl_inst_data_sig(struct nvkm_subdev *subdev,
 			 lsfw->app_resident_data_size;
 
 	lsfw->img.size = lsfw->bootloader_size + lsfw->app_size;
-	if (!(lsfw->img.data = kzalloc(lsfw->img.size, GFP_KERNEL))) {
+	lsfw->img.data = kzalloc(lsfw->img.size, GFP_KERNEL);
+	if (!lsfw->img.data) {
 		ret = -ENOMEM;
 		goto done;
 	}
@@ -345,7 +349,8 @@ nvkm_acr_lsfw_load_bl_sig_net(struct nvkm_subdev *subdev,
 	u32 *bldata;
 	int ret;
 
-	if (IS_ERR((lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id))))
+	lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id);
+	if (IS_ERR(lsfw))
 		return PTR_ERR(lsfw);
 
 	ret = nvkm_firmware_load_name(subdev, path, "bl", ver, &bl);
@@ -373,7 +378,8 @@ nvkm_acr_lsfw_load_bl_sig_net(struct nvkm_subdev *subdev,
 	lsfw->app_size = lsfw->app_resident_code_size + lsfw->app_resident_data_size;
 
 	lsfw->img.size = lsfw->bootloader_size + lsfw->app_size;
-	if (!(lsfw->img.data = kzalloc(lsfw->img.size, GFP_KERNEL))) {
+	lsfw->img.data = kzalloc(lsfw->img.size, GFP_KERNEL);
+	if (!lsfw->img.data) {
 		ret = -ENOMEM;
 		goto done;
 	}
-- 
2.25.1

