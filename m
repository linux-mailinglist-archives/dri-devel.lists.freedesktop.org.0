Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 829E9A79C45
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 08:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF5510E209;
	Thu,  3 Apr 2025 06:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=etehtsea.me header.i=@etehtsea.me header.b="THsEsRJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 493 seconds by postgrey-1.36 at gabe;
 Wed, 02 Apr 2025 13:01:54 UTC
Received: from ci74p00im-qukt09082101.me.com (ci74p00im-qukt09082101.me.com
 [17.57.156.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EF310E794
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 13:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1;
 bh=+Tly5DxcHfQYhTmVNc7ljz1SklrhsWDmKTToiUZCkMg=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
 b=THsEsRJg12I2SXFMTcTNZs1wj6naRhBSXGvm63FMFJNxns0V1ElmS+IyPpwyxWrS0
 OO4lYIVr7+bZXu3SqeyZGlMhsigI7E+U3he880OQ58TcfNQpGWMSDdHX/Ve5mnSXql
 XEMVzfAc8pav/HhNoJb9lDINSKAysPH/jHug8zRU3owsgiWzjqLcDuUzHFrBsIjTxv
 sj2ovU4epjsOccApC4s5Ljon2ci4KiPygTgqe20azB5mlNo9aEHf6Jg/HPv3ETpq6H
 3jTYXnrc8FmrQy7e6nCPDyf7gM1LPIQYvvp4ZUC+BuzQdvMXnC0O13Tzat5txQZ5Um
 zweYUFuojHFow==
Received: from localhost (ci77p00im-dlb-asmtp-mailmevip.me.com [17.57.156.26])
 by ci74p00im-qukt09082101.me.com (Postfix) with ESMTPSA id
 A46575600321; Wed,  2 Apr 2025 12:53:30 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: dri-devel@lists.freedesktop.org
Cc: Konstantin Shabanov <mail@etehtsea.me>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Mark Yao <mark.yao@rock-chips.com>, Dan Callaghan <djc@djc.id.au>,
 Tom Hebb <tommyhebb@gmail.com>
Subject: [PATCH] drm/rockchip: vop: Fix noise on resolutions >2560
Date: Wed,  2 Apr 2025 12:53:20 +0000
Message-ID: <20250402125320.21836-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: k8E15OB-e0Ig869ZuMHKDhSEayfV-Ssu
X-Proofpoint-ORIG-GUID: k8E15OB-e0Ig869ZuMHKDhSEayfV-Ssu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_05,2025-04-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=290
 phishscore=0 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1030 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2504020082
X-Mailman-Approved-At: Thu, 03 Apr 2025 06:45:44 +0000
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

Disable AFBC for resolutions bigger than 2560x1600 as RK3399 doesn't
support them.

From the datasheet[1] ("1.2.10 Video IN/OUT", "Display Interface", p. 17):

  Support AFBC function co-operation with GPU
    * support 2560x1600 UI

Tested on RockPro64 (rk3399).
Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7968

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
Suggested-by: Dan Callaghan <djc@djc.id.au>
Reported-by: Dan Callaghan <djc@djc.id.au>
Reported-by: Tom Hebb <tommyhebb@gmail.com>

[1]: https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index e3596e2b557d..c8d073347809 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -112,6 +112,7 @@
 
 #define AFBC_TILE_16x16		BIT(4)
 
+#define AFBC_MAX_WIDTH		2560
 /*
  * The coefficients of the following matrix are all fixed points.
  * The format is S2.10 for the 3x3 part of the matrix, and S9.12 for the offsets.
@@ -860,6 +861,13 @@ static int vop_plane_atomic_check(struct drm_plane *plane,
 	}
 
 	if (rockchip_afbc(fb->modifier)) {
+		if (fb->width > AFBC_MAX_WIDTH) {
+			DRM_DEBUG_KMS("AFBC does not support width %d (max %d)\n",
+				      fb->width,
+				      AFBC_MAX_WIDTH);
+			return -EINVAL;
+		}
+
 		struct vop *vop = to_vop(crtc);
 
 		if (!vop->data->afbc) {

base-commit: 6b60c282330c46954be9ae1d33cd5c7e5acb315c
-- 
2.48.1

