Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E335E96B09A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 07:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAB910E565;
	Wed,  4 Sep 2024 05:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="VIFpdm9M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4340 seconds by postgrey-1.36 at gabe;
 Wed, 04 Sep 2024 03:55:50 UTC
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
 [67.231.149.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7207010E361
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 03:55:50 +0000 (UTC)
Received: from pps.filterd (m0048274.ppops.net [127.0.0.1])
 by m0048274.ppops.net-00176a03. (8.18.1.2/8.18.1.2) with ESMTP id
 483MgHJe045410
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Sep 2024 22:43:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 gehealthcare.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to; s=outbound; bh=vyl5jEoBHiNv
 ky0bbAZ9dQeCfGv4WVu+/0q2Qb5oE/Y=; b=VIFpdm9MEDgh2xjeSPDCCqqDF/7g
 06AHB8tVdGkd4W1JgXqbYixRdC+hg7ap5LdywHpjXhLyn0D5xxDeKr0xFkQhIM+m
 N6fF1Jv/zlCeC06zjR3wKB0SIEoPhy6vTgCtAJmYAsXizmRpNt6TK1cEhE0JvJrJ
 94nQKfFiDwxX298YHaPtQK3oOYfB3IA10B+3Xc7ifJ5ahggqDUOQLokxAU/iV1Dx
 P28ffIPeON+HOH9IhdhJ79eyp9whT4KC4hksOyYrCXLg5OwhMu8welMzGUTUkwaG
 RP6BQ4kPCcE5mmgHUhwPZ+RImWY83K074dCKXthREkfM52QcDpxLT/UN9A==
From: Paul Pu <hui.pu@gehealthcare.com>
To: p.zabel@pengutronix.de,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Cc: hui.pu@gehealthcare.com, HuanWang@gehealthcare.com,
 taowang@gehealthcare.com, sebastian.reichel@collabora.com,
 ian.ray@gehealthcare.com, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: imx: ipuv3-plane: fix HDMI cannot work for odd screen
 resolutions
Date: Wed,  4 Sep 2024 05:43:15 +0300
Message-Id: <20240904024315.120-1-hui.pu@gehealthcare.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SUZ9nItscqfzbKKS1ow3Wkzi65iUGMU8
X-Proofpoint-GUID: SUZ9nItscqfzbKKS1ow3Wkzi65iUGMU8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_01,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 adultscore=0 clxscore=1011 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409040018
X-Mailman-Approved-At: Wed, 04 Sep 2024 05:41:19 +0000
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

This changes the judgement of if needing to round up the width or not,
from using the `dp_flow` to the plane's type.

The `dp_flow` can be -22(-EINVAL) even the plane is a PRIMARY one.
See `client_reg[]` in `ipu-common.c`.

[    0.605141] [drm:ipu_plane_init] channel 28, dp flow -22, possible_crtcs=0x0

Per the commit message in commit: 71f9fd5bcf09, using the plane type for
judging if rounding up is needed is correct.

Fixes: 71f9fd5bcf09 ("drm/imx: ipuv3-plane: Fix overlay plane width")
Cc: stable@vger.kernel.org

Signed-off-by: Paul Pu <hui.pu@gehealthcare.com>
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index 704c549750f9..cee83ac70ada 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -614,7 +614,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 		break;
 	}
 
-	if (ipu_plane->dp_flow == IPU_DP_FLOW_SYNC_BG)
+	if (ipu_plane->base.type == DRM_PLANE_TYPE_PRIMARY)
 		width = ipu_src_rect_width(new_state);
 	else
 		width = drm_rect_width(&new_state->src) >> 16;

base-commit: 431c1646e1f86b949fa3685efc50b660a364c2b6
-- 
2.39.2

