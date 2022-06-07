Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C35315427A0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F4510ECCD;
	Wed,  8 Jun 2022 07:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.ruc.edu.cn (m177126.mail.qiye.163.com [123.58.177.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FEE310EA9E;
 Tue,  7 Jun 2022 15:36:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [202.112.113.212])
 by smtp.ruc.edu.cn (Hmail) with ESMTPSA id E67CF8009E;
 Tue,  7 Jun 2022 23:36:38 +0800 (CST)
From: Xiaohui Zhang <xiaohuizhang@ruc.edu.cn>
To: Xiaohui Zhang <xiaohuizhang@ruc.edu.cn>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] drm/radeon: integer overflow in radeon_mode_dumb_create()
Date: Tue,  7 Jun 2022 23:36:31 +0800
Message-Id: <20220607153631.7885-1-xiaohuizhang@ruc.edu.cn>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUMdSk5WH0IdSUhJSxlLHh
 9KVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktITUpVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ojo6Ljo4TT01CxdCSjAMDTJP
 Ay8KFDJVSlVKTU5PTUpNSkJCTkxNVTMWGhIXVQMSGhQTDhIBExoVHDsJDhhVHh8OVRgVRVlXWRIL
 WUFZSUtJVUpKSVVKSkhVSUpJWVdZCAFZQUlKTkw3Bg++
X-HM-Tid: 0a813ecf904c2c20kusne67cf8009e
X-Mailman-Approved-At: Wed, 08 Jun 2022 07:39:02 +0000
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

Similar to the handling of amdgpu_mode_dumb_create in commit 54ef0b5461c0
("drm/amdgpu: integer overflow in amdgpu_mode_dumb_create()"),
we thought a patch might be needed here as well.

args->size is a u64.  arg->pitch and args->height are u32.  The
multiplication will overflow instead of using the high 32 bits as
intended.

Signed-off-by: Xiaohui Zhang <xiaohuizhang@ruc.edu.cn>
---
 drivers/gpu/drm/radeon/radeon_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 8c01a7f0e027..84843b3b3aef 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -833,7 +833,7 @@ int radeon_mode_dumb_create(struct drm_file *file_priv,
 
 	args->pitch = radeon_align_pitch(rdev, args->width,
 					 DIV_ROUND_UP(args->bpp, 8), 0);
-	args->size = args->pitch * args->height;
+	args->size = (u64)args->pitch * args->height;
 	args->size = ALIGN(args->size, PAGE_SIZE);
 
 	r = radeon_gem_object_create(rdev, args->size, 0,
-- 
2.17.1

