Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1982994B7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 19:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096B26EA5A;
	Mon, 26 Oct 2020 18:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F556E122;
 Mon, 26 Oct 2020 11:48:50 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CKY5J1Hzpzhb8s;
 Mon, 26 Oct 2020 19:48:52 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Mon, 26 Oct 2020
 19:48:45 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next] drm/amdgpu: Discard unnecessary breaks
Date: Mon, 26 Oct 2020 19:59:30 +0800
Message-ID: <20201026115930.14991-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 26 Oct 2020 18:01:45 +0000
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
Cc: alexander.deucher@amd.com, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The 'break' is unnecessary because of previous
'return', discard it.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c | 6 ------
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c         | 4 ----
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c         | 7 -------
 3 files changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
index 8339c8c3a328..fa817ebff980 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
@@ -499,10 +499,8 @@ int amdgpu_atombios_encoder_get_encoder_mode(struct drm_encoder *encoder)
 		} else {
 			return ATOM_ENCODER_MODE_DVI;
 		}
-		break;
 	case DRM_MODE_CONNECTOR_LVDS:
 		return ATOM_ENCODER_MODE_LVDS;
-		break;
 	case DRM_MODE_CONNECTOR_DisplayPort:
 		dig_connector = amdgpu_connector->con_priv;
 		if ((dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_DISPLAYPORT) ||
@@ -519,20 +517,16 @@ int amdgpu_atombios_encoder_get_encoder_mode(struct drm_encoder *encoder)
 		} else {
 			return ATOM_ENCODER_MODE_DVI;
 		}
-		break;
 	case DRM_MODE_CONNECTOR_eDP:
 		return ATOM_ENCODER_MODE_DP;
 	case DRM_MODE_CONNECTOR_DVIA:
 	case DRM_MODE_CONNECTOR_VGA:
 		return ATOM_ENCODER_MODE_CRT;
-		break;
 	case DRM_MODE_CONNECTOR_Composite:
 	case DRM_MODE_CONNECTOR_SVIDEO:
 	case DRM_MODE_CONNECTOR_9PinDIN:
 		/* fix me */
 		return ATOM_ENCODER_MODE_TV;
-		/*return ATOM_ENCODER_MODE_CV;*/
-		break;
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 5963cbe0d455..34448df0ccf3 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -2202,22 +2202,18 @@ static int dce_v10_0_pick_dig_encoder(struct drm_encoder *encoder)
 			return 1;
 		else
 			return 0;
-		break;
 	case ENCODER_OBJECT_ID_INTERNAL_UNIPHY1:
 		if (dig->linkb)
 			return 3;
 		else
 			return 2;
-		break;
 	case ENCODER_OBJECT_ID_INTERNAL_UNIPHY2:
 		if (dig->linkb)
 			return 5;
 		else
 			return 4;
-		break;
 	case ENCODER_OBJECT_ID_INTERNAL_UNIPHY3:
 		return 6;
-		break;
 	default:
 		DRM_ERROR("invalid encoder_id: 0x%x\n", amdgpu_encoder->encoder_id);
 		return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 1954472c8e8f..eb16f7529223 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -2235,22 +2235,18 @@ static int dce_v11_0_pick_dig_encoder(struct drm_encoder *encoder)
 			return 1;
 		else
 			return 0;
-		break;
 	case ENCODER_OBJECT_ID_INTERNAL_UNIPHY1:
 		if (dig->linkb)
 			return 3;
 		else
 			return 2;
-		break;
 	case ENCODER_OBJECT_ID_INTERNAL_UNIPHY2:
 		if (dig->linkb)
 			return 5;
 		else
 			return 4;
-		break;
 	case ENCODER_OBJECT_ID_INTERNAL_UNIPHY3:
 		return 6;
-		break;
 	default:
 		DRM_ERROR("invalid encoder_id: 0x%x\n", amdgpu_encoder->encoder_id);
 		return 0;
@@ -2304,19 +2300,16 @@ static u32 dce_v11_0_pick_pll(struct drm_crtc *crtc)
 				return ATOM_COMBOPHY_PLL1;
 			else
 				return ATOM_COMBOPHY_PLL0;
-			break;
 		case ENCODER_OBJECT_ID_INTERNAL_UNIPHY1:
 			if (dig->linkb)
 				return ATOM_COMBOPHY_PLL3;
 			else
 				return ATOM_COMBOPHY_PLL2;
-			break;
 		case ENCODER_OBJECT_ID_INTERNAL_UNIPHY2:
 			if (dig->linkb)
 				return ATOM_COMBOPHY_PLL5;
 			else
 				return ATOM_COMBOPHY_PLL4;
-			break;
 		default:
 			DRM_ERROR("invalid encoder_id: 0x%x\n", amdgpu_encoder->encoder_id);
 			return ATOM_PPLL_INVALID;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
