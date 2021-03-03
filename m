Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 888BA32ACA8
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 01:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC1A89CBE;
	Wed,  3 Mar 2021 00:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1697F89CBE;
 Wed,  3 Mar 2021 00:28:02 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1lHFMt-0005Cd-En; Wed, 03 Mar 2021 00:27:59 +0000
From: Colin King <colin.king@canonical.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/radeon: fix copy of uninitialized variable back to
 userspace
Date: Wed,  3 Mar 2021 00:27:59 +0000
Message-Id: <20210303002759.28752-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

Currently the ioctl command RADEON_INFO_SI_BACKEND_ENABLED_MASK can
copy back uninitialised data in value_tmp that pointer *value points
to. This can occur when rdev->family is less than CHIP_BONAIRE and
less than CHIP_TAHITI.  Fix this by adding in a missing -EINVAL
so that no invalid value is copied back to userspace.

Addresses-Coverity: ("Uninitialized scalar variable)
Cc: stable@vger.kernel.org # 3.13+
Fixes: 439a1cfffe2c ("drm/radeon: expose render backend mask to the userspace")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/radeon/radeon_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index 2479d6ab7a36..58876bb4ef2a 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -518,6 +518,7 @@ int radeon_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 			*value = rdev->config.si.backend_enable_mask;
 		} else {
 			DRM_DEBUG_KMS("BACKEND_ENABLED_MASK is si+ only!\n");
+			return -EINVAL;
 		}
 		break;
 	case RADEON_INFO_MAX_SCLK:
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
