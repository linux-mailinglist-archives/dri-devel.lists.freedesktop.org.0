Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 640147ABA08
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 21:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211E210E70A;
	Fri, 22 Sep 2023 19:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr
 [80.12.242.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C75610E70B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 19:27:30 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id jloFqD9PsGlzojloFq0RyT; Fri, 22 Sep 2023 21:27:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1695410848;
 bh=XEqKkQdd+1AGqY7DppYqYg8hkwbZVqfTt1fDBwsytHo=;
 h=From:To:Cc:Subject:Date;
 b=tzuTLQNT2FcvHWUhvK7u8I5xvd2KA5IRJCU1xjcCBN4l14vbvTpn2YO5G3N99N/iJ
 hBcGEeW26CUo24OMz22rm7R7kHw6+L9UiNn9p1RihPMY9pIFn50z7GsjgWYTCKf8hq
 Xk2ml88ep4HJsD9wm1TI+fpSCN3ITNY6nXlOcQvmGLuQBji6qGheyUzJs25Bc9c+rP
 6a61QFX1qkWHe5OzhUMSVPdemOGVORUV8YmY6sHZrkLKy+lnBZ72S5fJe4/UxuG34e
 p6B4dixT6ScxQcx+gFHVwUxGEovC9xubtfVh4LnikubTrm4NFY/d7Plxm0r5/+1EwQ
 Jm27Pr7yM5EWQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 22 Sep 2023 21:27:28 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] drm/amd: Fix the size of a buffer in
 amdgpu_vcn_idle_work_handler()
Date: Fri, 22 Sep 2023 21:27:25 +0200
Message-Id: <d8a9cda0c4c391458ddd63d1be88f2a757f6a5d0.1695410820.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to be sure that fw_name is not truncated, this buffer should be
at least 41 bytes long.

Let the compiler compute the correct length by itself.

When building with W=1, this fixes the following warnings:

  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c: In function ‘amdgpu_vcn_early_init’:
  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:95:58: error: ‘snprintf’ output may be truncated before the last format character [-Werror=format-truncation=]
     95 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
        |                                                          ^
  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:95:9: note: ‘snprintf’ output between 12 and 41 bytes into a destination of size 40
     95 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: 69939009bde7 ("drm/amd: Load VCN microcode during early_init")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index c93f3a4c0e31..f8cd55a0d1f0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -88,7 +88,7 @@ static void amdgpu_vcn_idle_work_handler(struct work_struct *work);
 int amdgpu_vcn_early_init(struct amdgpu_device *adev)
 {
 	char ucode_prefix[30];
-	char fw_name[40];
+	char fw_name[sizeof(ucode_prefix) + sizeof("amdgpu/.bin") - 1];
 	int r;
 
 	amdgpu_ucode_ip_version_decode(adev, UVD_HWIP, ucode_prefix, sizeof(ucode_prefix));
-- 
2.34.1

