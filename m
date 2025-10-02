Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CD6BB28E0
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 07:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378CF10E77F;
	Thu,  2 Oct 2025 05:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="co5RWL4Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631D410E765
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 02:23:03 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-7835321bc98so643295b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 19:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759371783; x=1759976583; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mF3LfHpef/3mN9CeEleeS0pHSg8cp/5+RdXD9b+jUXQ=;
 b=co5RWL4Y/jvvEyf5oE01LaASHguRWrX/rxO9RuS8A2v7hGRs2hr6aD0Dps2K8u/09f
 zf0/BfS2xFp0PU63nj2Wo2bAF+e8xXb7+dCB40iwCN1AiMOJs6uBuh8gqY5nF/YBDRUU
 U66Y9cJtpzMKeKVqLN8hee5k70VklIRnF/qSW9TT1JVlt88ifMZU8lSMu9xNwkfnLqJo
 quI8bXEMC2LQx1ujFb5b0IX7L9QMIy5qNTSF3oA70kGb8Rg0Saq5NYxlhephdKCZHIrN
 Fzg+dgN3QmmNQC05Y0uV3eAUNpvIpoef+NSQgNgQby1lJ1HArKiWmV+WDYVmnI4QZi0V
 hnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759371783; x=1759976583;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mF3LfHpef/3mN9CeEleeS0pHSg8cp/5+RdXD9b+jUXQ=;
 b=OLlhzL8BbKpWpEIyPZTnkWNk73cjT5E8MYdVjGtM0AqLUchdMdPeOATVF1ST8UKlV8
 Vp6mlBcnCB9ATS2DeoomhwFH54W6lTrQAaIlVJ22g+QbukMq2S/XS5z0TOke68vBhP1i
 hGVSN0H0Wjp8thECRo4Miegv8EB5MUk+97Gk7kNBUvKNXUgriKRnpeGopbIseNJRA/H9
 32KrAWfQwt84V9UpLtA83i5tAhotSD/embj7TdzU3DPUbUbTAsdqqe0xEpUt6zucFIko
 ZTo4O3oArgW0tMye6FSOiJcpUwFj2cgGL6ZRJDrXuuUf+jGVUXdbRdaopaC8jBqA+QhE
 cIww==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9H1RvECDXI73Ixvhb+3g/oDEE6Dp9UpvAmV2FFT0xgSCW7ndZpCwJDkM+H4fzJKxmPcriBi5PbZY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAgPuQj8Di4Ivc6lw3sCvUDmPfjlltcj2HOD6IUMH4Mkj2sa2K
 YZRzJTphjIk/xGUKOttUoByjR9/fOv1piGweM71NT1eDI4x6djDfvt6V
X-Gm-Gg: ASbGncucQcKMk3rn8KH04Mdz2U1bprBcfHLFuWqxgOUrQ/Va1mNtSo+35uA6QxHH8lm
 7lIzn2lcyjQTlWJ2NhxSE47YeduO4shhJofO+LGSUYvqpVKJq5Uj8nUxz/zSHB2ihHBCUMjAMc0
 hCGfV6ARi0xxQ5C/gYG4Aq1HJq2AiRTquF1f6rW2gLGa46zwz0WjqHRZaLsj2JEoG1pz2wRsYTm
 kD+iiIcILAJCXQexyEUvQ7m48W1V2oKglVeXvwpIrv+sTHeB6TLRMlGBxBqYF38ZGUJzN9NET6R
 HpdosWSPRv8J8UGelBB/F0KymRm/OeXgWU/VjTF3VI1kfJI8nphI3LbVRoyXTDtZZ+AdT0JzSVj
 Iz8w2ah6YYpGnjfnwVe7FmgPhKiEeqdSVGxFlV9ZkYrcMqIMaHHtzCANqTc/TwMCWAOI8YpvNy8
 UeY0la+Em3MQ==
X-Google-Smtp-Source: AGHT+IHxLShFCm76xin7rHm8qNL6ADQW6sxwH14YEVEejbEnDXp8CfZFyeDbyzek8/KKOZq8n0qs+g==
X-Received: by 2002:a05:6a00:17a6:b0:781:556:f33 with SMTP id
 d2e1a72fcca58-78af3fe8bcbmr6233829b3a.5.1759371782828; 
 Wed, 01 Oct 2025 19:23:02 -0700 (PDT)
Received: from ti-am64x-sdk.. ([157.50.91.136])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b01f99acesm1046229b3a.5.2025.10.01.19.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 19:23:02 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Tao Zhou <tao.zhou1@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, ganglxie <ganglxie@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Candice Li <candice.li@amd.com>,
 Victor Skvortsov <victor.skvortsov@amd.com>, Roman Li <roman.li@amd.com>,
 Alvin Lee <Alvin.Lee2@amd.com>,
 Karthi Kandasamy <karthi.kandasamy@amd.com>,
 David Rosca <david.rosca@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, bhanuseshukumar@gmail.com
Subject: [PATCH] drm: amd: Use kmalloc_array to prevent overflow of dynamic
 size calculation
Date: Thu,  2 Oct 2025 07:52:41 +0530
Message-Id: <20251002022241.77823-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Oct 2025 05:43:06 +0000
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

Use kmalloc_array to avoid potential overflow during dynamic size calculation
inside kmalloc.

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Note:
 Patch is verified for compilation.
 
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c                 | 4 ++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 540817e296da..642addf70466 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2566,7 +2566,7 @@ static int amdgpu_ras_badpages_read(struct amdgpu_device *adev,
 		goto out;
 	}
 
-	*bps = kmalloc(sizeof(struct ras_badpage) * data->count, GFP_KERNEL);
+	*bps = kmalloc_array(sizeof(struct ras_badpage), data->count, GFP_KERNEL);
 	if (!*bps) {
 		ret = -ENOMEM;
 		goto out;
@@ -2722,7 +2722,7 @@ static int amdgpu_ras_realloc_eh_data_space(struct amdgpu_device *adev,
 	unsigned int old_space = data->count + data->space_left;
 	unsigned int new_space = old_space + pages;
 	unsigned int align_space = ALIGN(new_space, 512);
-	void *bps = kmalloc(align_space * sizeof(*data->bps), GFP_KERNEL);
+	void *bps = kmalloc_array(align_space, sizeof(*data->bps), GFP_KERNEL);
 
 	if (!bps) {
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 3d2f8eedeef2..e027798ece03 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -146,7 +146,7 @@ static void amdgpu_dm_plane_add_modifier(uint64_t **mods, uint64_t *size, uint64
 
 	if (*cap - *size < 1) {
 		uint64_t new_cap = *cap * 2;
-		uint64_t *new_mods = kmalloc(new_cap * sizeof(uint64_t), GFP_KERNEL);
+		uint64_t *new_mods = kmalloc_array(new_cap, sizeof(uint64_t), GFP_KERNEL);
 
 		if (!new_mods) {
 			kfree(*mods);
@@ -732,7 +732,7 @@ static int amdgpu_dm_plane_get_plane_modifiers(struct amdgpu_device *adev, unsig
 	if (adev->family < AMDGPU_FAMILY_AI)
 		return 0;
 
-	*mods = kmalloc(capacity * sizeof(uint64_t), GFP_KERNEL);
+	*mods = kmalloc_array(capacity, sizeof(uint64_t), GFP_KERNEL);
 
 	if (plane_type == DRM_PLANE_TYPE_CURSOR) {
 		amdgpu_dm_plane_add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_LINEAR);
-- 
2.34.1

