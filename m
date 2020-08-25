Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3EB251761
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 13:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741DE6E119;
	Tue, 25 Aug 2020 11:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B341F6E119;
 Tue, 25 Aug 2020 11:21:58 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07PBKln7168434;
 Tue, 25 Aug 2020 11:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=EiJUOrjVKs6d6Kjm/OMON1DZ6K9mcJcOFsw6Jhs/gKA=;
 b=BiFcdELnrCfWW9ky7iD7pUahJEI3FS7joW9RSZj4Eu443qi4itkO8WQW3nk+SSJDyTYF
 o9dm3CaQNEMIT9BpGf0QOwf4UJMSTLi/GCppwR6sqGvenmpD+uS8adfCnJalGrHJTSS8
 V1iu6jCiu+3RAQscvLcTR8NvAMscu1zY7Z3/G4yDr8O83n3eq85smJmjfY8BH+JNdPeJ
 xeOKig8H+n3sXD2hsp0/rA3IvZx4YM6ZGZsj0fQfYNAIWya6Mh2+XSdstE8NGxy3BwKd
 AiniVqL5Bz8q0RAt2QjjiM+y0CuaF29M6zDnbTw7BjEliSMry49JHMm06YU7TITaZZe/ 2g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 333csj1wu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 25 Aug 2020 11:21:55 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07PBEZ13068040;
 Tue, 25 Aug 2020 11:19:54 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 333rtxnva8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Aug 2020 11:19:54 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 07PBJqTE023277;
 Tue, 25 Aug 2020 11:19:52 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 25 Aug 2020 04:19:51 -0700
Date: Tue, 25 Aug 2020 14:19:43 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 3/3] drm/amdgpu/vi: fix buffer overflow in
 vi_get_register_value()
Message-ID: <20200825111943.GC285523@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825111843.GA285523@mwanda>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9723
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008250085
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9723
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008250086
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Wenhui Sheng <Wenhui.Sheng@amd.com>,
 amd-gfx@lists.freedesktop.org, Evan Quan <evan.quan@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Monk Liu <Monk.Liu@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The values for "se_num" and "sh_num" come from the user in the ioctl.
They can be in the 0-255 range but if they're more than
AMDGPU_GFX_MAX_SE (4) or AMDGPU_GFX_MAX_SH_PER_SE (2) then it results in
an out of bounds read.

I split this function into to two to make the error handling simpler.

Fixes: db9635cc14f3 ("drm/amdgpu: used cached gca values for vi_read_register (v2)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/vi.c | 197 +++++++++++++++++---------------
 1 file changed, 105 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index f6f2ed0830b1..fd623ad9d51f 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -527,99 +527,108 @@ static const struct amdgpu_allowed_register_entry vi_allowed_read_registers[] =
 	{mmPA_SC_RASTER_CONFIG_1, true},
 };
 
-static uint32_t vi_get_register_value(struct amdgpu_device *adev,
-				      bool indexed, u32 se_num,
-				      u32 sh_num, u32 reg_offset)
-{
-	if (indexed) {
-		uint32_t val;
-		unsigned se_idx = (se_num == 0xffffffff) ? 0 : se_num;
-		unsigned sh_idx = (sh_num == 0xffffffff) ? 0 : sh_num;
-
-		switch (reg_offset) {
-		case mmCC_RB_BACKEND_DISABLE:
-			return adev->gfx.config.rb_config[se_idx][sh_idx].rb_backend_disable;
-		case mmGC_USER_RB_BACKEND_DISABLE:
-			return adev->gfx.config.rb_config[se_idx][sh_idx].user_rb_backend_disable;
-		case mmPA_SC_RASTER_CONFIG:
-			return adev->gfx.config.rb_config[se_idx][sh_idx].raster_config;
-		case mmPA_SC_RASTER_CONFIG_1:
-			return adev->gfx.config.rb_config[se_idx][sh_idx].raster_config_1;
-		}
+static int vi_get_register_value_indexed(struct amdgpu_device *adev,
+					 u32 se_num, u32 sh_num,
+					 u32 reg_offset, u32 *value)
+{
+	unsigned se_idx = (se_num == 0xffffffff) ? 0 : se_num;
+	unsigned sh_idx = (sh_num == 0xffffffff) ? 0 : sh_num;
 
-		mutex_lock(&adev->grbm_idx_mutex);
-		if (se_num != 0xffffffff || sh_num != 0xffffffff)
-			amdgpu_gfx_select_se_sh(adev, se_num, sh_num, 0xffffffff);
+	if (se_idx >= AMDGPU_GFX_MAX_SE ||
+	    sh_idx >= AMDGPU_GFX_MAX_SH_PER_SE)
+		return -EINVAL;
 
-		val = RREG32(reg_offset);
+	switch (reg_offset) {
+	case mmCC_RB_BACKEND_DISABLE:
+		*value = adev->gfx.config.rb_config[se_idx][sh_idx].rb_backend_disable;
+		return 0;
+	case mmGC_USER_RB_BACKEND_DISABLE:
+		*value = adev->gfx.config.rb_config[se_idx][sh_idx].user_rb_backend_disable;
+		return 0;
+	case mmPA_SC_RASTER_CONFIG:
+		*value = adev->gfx.config.rb_config[se_idx][sh_idx].raster_config;
+		return 0;
+	case mmPA_SC_RASTER_CONFIG_1:
+		*value = adev->gfx.config.rb_config[se_idx][sh_idx].raster_config_1;
+		return 0;
+	}
 
-		if (se_num != 0xffffffff || sh_num != 0xffffffff)
-			amdgpu_gfx_select_se_sh(adev, 0xffffffff, 0xffffffff, 0xffffffff);
-		mutex_unlock(&adev->grbm_idx_mutex);
-		return val;
-	} else {
-		unsigned idx;
-
-		switch (reg_offset) {
-		case mmGB_ADDR_CONFIG:
-			return adev->gfx.config.gb_addr_config;
-		case mmMC_ARB_RAMCFG:
-			return adev->gfx.config.mc_arb_ramcfg;
-		case mmGB_TILE_MODE0:
-		case mmGB_TILE_MODE1:
-		case mmGB_TILE_MODE2:
-		case mmGB_TILE_MODE3:
-		case mmGB_TILE_MODE4:
-		case mmGB_TILE_MODE5:
-		case mmGB_TILE_MODE6:
-		case mmGB_TILE_MODE7:
-		case mmGB_TILE_MODE8:
-		case mmGB_TILE_MODE9:
-		case mmGB_TILE_MODE10:
-		case mmGB_TILE_MODE11:
-		case mmGB_TILE_MODE12:
-		case mmGB_TILE_MODE13:
-		case mmGB_TILE_MODE14:
-		case mmGB_TILE_MODE15:
-		case mmGB_TILE_MODE16:
-		case mmGB_TILE_MODE17:
-		case mmGB_TILE_MODE18:
-		case mmGB_TILE_MODE19:
-		case mmGB_TILE_MODE20:
-		case mmGB_TILE_MODE21:
-		case mmGB_TILE_MODE22:
-		case mmGB_TILE_MODE23:
-		case mmGB_TILE_MODE24:
-		case mmGB_TILE_MODE25:
-		case mmGB_TILE_MODE26:
-		case mmGB_TILE_MODE27:
-		case mmGB_TILE_MODE28:
-		case mmGB_TILE_MODE29:
-		case mmGB_TILE_MODE30:
-		case mmGB_TILE_MODE31:
-			idx = (reg_offset - mmGB_TILE_MODE0);
-			return adev->gfx.config.tile_mode_array[idx];
-		case mmGB_MACROTILE_MODE0:
-		case mmGB_MACROTILE_MODE1:
-		case mmGB_MACROTILE_MODE2:
-		case mmGB_MACROTILE_MODE3:
-		case mmGB_MACROTILE_MODE4:
-		case mmGB_MACROTILE_MODE5:
-		case mmGB_MACROTILE_MODE6:
-		case mmGB_MACROTILE_MODE7:
-		case mmGB_MACROTILE_MODE8:
-		case mmGB_MACROTILE_MODE9:
-		case mmGB_MACROTILE_MODE10:
-		case mmGB_MACROTILE_MODE11:
-		case mmGB_MACROTILE_MODE12:
-		case mmGB_MACROTILE_MODE13:
-		case mmGB_MACROTILE_MODE14:
-		case mmGB_MACROTILE_MODE15:
-			idx = (reg_offset - mmGB_MACROTILE_MODE0);
-			return adev->gfx.config.macrotile_mode_array[idx];
-		default:
-			return RREG32(reg_offset);
-		}
+	mutex_lock(&adev->grbm_idx_mutex);
+	if (se_num != 0xffffffff || sh_num != 0xffffffff)
+		amdgpu_gfx_select_se_sh(adev, se_num, sh_num, 0xffffffff);
+
+	*value = RREG32(reg_offset);
+
+	if (se_num != 0xffffffff || sh_num != 0xffffffff)
+		amdgpu_gfx_select_se_sh(adev, 0xffffffff, 0xffffffff, 0xffffffff);
+	mutex_unlock(&adev->grbm_idx_mutex);
+	return 0;
+}
+
+static uint32_t vi_get_register_value(struct amdgpu_device *adev,
+				      u32 reg_offset)
+{
+	unsigned idx;
+
+	switch (reg_offset) {
+	case mmGB_ADDR_CONFIG:
+		return adev->gfx.config.gb_addr_config;
+	case mmMC_ARB_RAMCFG:
+		return adev->gfx.config.mc_arb_ramcfg;
+	case mmGB_TILE_MODE0:
+	case mmGB_TILE_MODE1:
+	case mmGB_TILE_MODE2:
+	case mmGB_TILE_MODE3:
+	case mmGB_TILE_MODE4:
+	case mmGB_TILE_MODE5:
+	case mmGB_TILE_MODE6:
+	case mmGB_TILE_MODE7:
+	case mmGB_TILE_MODE8:
+	case mmGB_TILE_MODE9:
+	case mmGB_TILE_MODE10:
+	case mmGB_TILE_MODE11:
+	case mmGB_TILE_MODE12:
+	case mmGB_TILE_MODE13:
+	case mmGB_TILE_MODE14:
+	case mmGB_TILE_MODE15:
+	case mmGB_TILE_MODE16:
+	case mmGB_TILE_MODE17:
+	case mmGB_TILE_MODE18:
+	case mmGB_TILE_MODE19:
+	case mmGB_TILE_MODE20:
+	case mmGB_TILE_MODE21:
+	case mmGB_TILE_MODE22:
+	case mmGB_TILE_MODE23:
+	case mmGB_TILE_MODE24:
+	case mmGB_TILE_MODE25:
+	case mmGB_TILE_MODE26:
+	case mmGB_TILE_MODE27:
+	case mmGB_TILE_MODE28:
+	case mmGB_TILE_MODE29:
+	case mmGB_TILE_MODE30:
+	case mmGB_TILE_MODE31:
+		idx = (reg_offset - mmGB_TILE_MODE0);
+		return adev->gfx.config.tile_mode_array[idx];
+	case mmGB_MACROTILE_MODE0:
+	case mmGB_MACROTILE_MODE1:
+	case mmGB_MACROTILE_MODE2:
+	case mmGB_MACROTILE_MODE3:
+	case mmGB_MACROTILE_MODE4:
+	case mmGB_MACROTILE_MODE5:
+	case mmGB_MACROTILE_MODE6:
+	case mmGB_MACROTILE_MODE7:
+	case mmGB_MACROTILE_MODE8:
+	case mmGB_MACROTILE_MODE9:
+	case mmGB_MACROTILE_MODE10:
+	case mmGB_MACROTILE_MODE11:
+	case mmGB_MACROTILE_MODE12:
+	case mmGB_MACROTILE_MODE13:
+	case mmGB_MACROTILE_MODE14:
+	case mmGB_MACROTILE_MODE15:
+		idx = (reg_offset - mmGB_MACROTILE_MODE0);
+		return adev->gfx.config.macrotile_mode_array[idx];
+	default:
+		return RREG32(reg_offset);
 	}
 }
 
@@ -635,8 +644,12 @@ static int vi_read_register(struct amdgpu_device *adev, u32 se_num,
 		if (reg_offset != vi_allowed_read_registers[i].reg_offset)
 			continue;
 
-		*value = vi_get_register_value(adev, indexed, se_num, sh_num,
-					       reg_offset);
+		if (indexed)
+			return vi_get_register_value_indexed(adev,
+							     se_num, sh_num,
+							     reg_offset, value);
+
+		*value = vi_get_register_value(adev, reg_offset);
 		return 0;
 	}
 	return -EINVAL;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
