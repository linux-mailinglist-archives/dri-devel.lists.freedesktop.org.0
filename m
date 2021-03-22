Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02063344034
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C04789E50;
	Mon, 22 Mar 2021 11:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF5989E1D;
 Mon, 22 Mar 2021 11:55:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B672C6198B;
 Mon, 22 Mar 2021 11:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616414104;
 bh=NQBKDv/xaUzATP3yqfPz6TIrtay/vvss0zT4f9fjrSI=;
 h=From:To:Cc:Subject:Date:From;
 b=e1myS2raWRh96kX7ZJKmiBHBzDIu2m8qv6Ix7gWSD9vrjhn7/vFY0poWWvjq0dmls
 Bk7F/1R7UOc3oaf9W+ldRUhOmIUO6c4oLAYCqlE+OYOq5iLrf6chM6jT3yGn4oUZ4D
 68aT/Eg56zDIlJ3ZVSqMuu/AH0S0qpvWF//xs6wodR9wgKEE2FhqbFbsp5tx/qfuz4
 vhvWBJca31stzUgCzR7csVRzFD/ELTuPOl1uTt+fSDO9kop2sHHKqQiAHSM9r50rZo
 0IvOArywDi2AnNEd6XUlKdtCUTIodPsZJmGmyTVaxoxc5FA8cPB7Sjwpu4jgAaYfKv
 dHja6Dr5uYO1Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] amdgpu: avoid incorrect %hu format string
Date: Mon, 22 Mar 2021 12:54:42 +0100
Message-Id: <20210322115458.3961825-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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
Cc: Sonny Jiang <sonny.jiang@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 xinhui pan <xinhui.pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, clang-built-linux@googlegroups.com,
 Chen Li <chenli@uniontech.com>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

clang points out that the %hu format string does not match the type
of the variables here:

drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:263:7: warning: format specifies type 'unsigned short' but the argument has type 'unsigned int' [-Wformat]
                                  version_major, version_minor);
                                  ^~~~~~~~~~~~~
include/drm/drm_print.h:498:19: note: expanded from macro 'DRM_ERROR'
        __drm_err(fmt, ##__VA_ARGS__)
                  ~~~    ^~~~~~~~~~~

Change it to a regular %u, the same way a previous patch did for
another instance of the same warning.

Fixes: 0b437e64e0af ("drm/amdgpu: remove h from printk format specifier")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index e2ed4689118a..c6dbc0801604 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -259,7 +259,7 @@ int amdgpu_uvd_sw_init(struct amdgpu_device *adev)
 		if ((adev->asic_type == CHIP_POLARIS10 ||
 		     adev->asic_type == CHIP_POLARIS11) &&
 		    (adev->uvd.fw_version < FW_1_66_16))
-			DRM_ERROR("POLARIS10/11 UVD firmware version %hu.%hu is too old.\n",
+			DRM_ERROR("POLARIS10/11 UVD firmware version %u.%u is too old.\n",
 				  version_major, version_minor);
 	} else {
 		unsigned int enc_major, enc_minor, dec_minor;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
