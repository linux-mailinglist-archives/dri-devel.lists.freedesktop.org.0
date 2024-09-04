Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7515D96B4EA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 10:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC3510E671;
	Wed,  4 Sep 2024 08:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="atGzVY/T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2648 seconds by postgrey-1.36 at gabe;
 Wed, 04 Sep 2024 08:39:02 UTC
Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
 [67.231.157.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607FA10E671
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 08:39:02 +0000 (UTC)
Received: from pps.filterd (m0048300.ppops.net [127.0.0.1])
 by m0048300.ppops.net-00176a03. (8.18.1.2/8.18.1.2) with ESMTP id
 4847JCMM044177
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Sep 2024 03:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 gehealthcare.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 outbound; bh=YgLq/2dBPG+eknMq5HrdJ7VBavF7x7z1tmaFPepaKYE=; b=atG
 zVY/TKNHFS4XOhbr9ByGV2JUUchfNsJZ9oAJGH8PoeErq9DntD1U46bn246Qn3n9
 1jqnl7jrhyE8OOXOTcaomJ+RC/gn/B8Xb+59s7znmUw3kYNvhLZ3gDEy3mGe7MRl
 rZ1xRsCnNnxJlVPwqEoLxqKDfLbSi1/dSOMESpFoXGNtVrNb+6+Ob1Ix7xhYPtNo
 z8K+397lR+f27hcM4vDCl64UnqdCN2qguomD57e41TJRCPeueNGRW20lIVXcWE/4
 w2D86V3Iu/vmME4tmlpimBlYHXO38IRUZmlHnxJ1u0LgpddEg3f7x6zpgJfNsQC3
 VdBaSOOXFLwYH1z69xg==
From: Paul Pu <hui.pu@gehealthcare.com>
To: p.zabel@pengutronix.de,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
Cc: hui.pu@gehealthcare.com, HuanWang@gehealthcare.com,
 taowang@gehealthcare.com, sebastian.reichel@collabora.com,
 ian.ray@gehealthcare.com, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/imx/ipuv3: ipuv3-plane: Round up plane width for
 IPUV3_CHANNEL_MEM_DC_SYNC
Date: Wed,  4 Sep 2024 10:54:17 +0300
Message-Id: <20240904075417.53-1-hui.pu@gehealthcare.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240904024315.120-1-hui.pu@gehealthcare.com>
References: <20240904024315.120-1-hui.pu@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lYXd7nqyWCuxgqvKnVHTWC0gV9nUf4Fr
X-Proofpoint-GUID: lYXd7nqyWCuxgqvKnVHTWC0gV9nUf4Fr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_05,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 phishscore=0 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409040059
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

The `dp_flow` can be -22(-EINVAL) even if the plane is a PRIMARY one.
See `client_reg[]` in `ipu-common.c`.

[    0.605141] [drm:ipu_plane_init] channel 28, dp flow -22, possible_crtcs=0x0

Per the commit message in commit: 4333472f8d7b, using the plane type for
judging if rounding up is needed is correct.

This fixes HDMI cannot work for odd screen resolutions, e.g. 1366x768.

Fixes: 4333472f8d7b ("drm/imx: ipuv3-plane: Fix overlay plane width")
Cc: stable@vger.kernel.org # 5.15+
Signed-off-by: Paul Pu <hui.pu@gehealthcare.com>
---
v1 -> v2: Fixed addressed review comments
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index 704c549750f9..3ef8ad7ab2a1 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -614,7 +614,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 		break;
 	}
 
-	if (ipu_plane->dp_flow == IPU_DP_FLOW_SYNC_BG)
+	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
 		width = ipu_src_rect_width(new_state);
 	else
 		width = drm_rect_width(&new_state->src) >> 16;

base-commit: 431c1646e1f86b949fa3685efc50b660a364c2b6
-- 
2.39.2

