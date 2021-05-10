Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3A63782AC
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 12:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C59D6E059;
	Mon, 10 May 2021 10:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056BA6E059;
 Mon, 10 May 2021 10:37:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AA6961943;
 Mon, 10 May 2021 10:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620643030;
 bh=9IKPaB906Djut97p5MwTWhhrS8i29IzcBxZyrY37QIA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yNxn1iK+I1FehDzmOLQF9r0FX9oLtfw+XE0KEKNNnPlH1unpF/OaaeiTwIQp+Z+n0
 87ADYXKTK+NaepT6rolIHAfhHQe+pAYkPfeaZqdNYW5pXXldMo7R0yCUWBUXyahXYI
 5naCYs1MpreXb/+TBdM56bloRkYNsAsQy1ZhVQqo=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.10 122/299] drm/amd/display/dc/dce/dce_aux: Remove duplicate
 line causing field overwritten issue
Date: Mon, 10 May 2021 12:18:39 +0200
Message-Id: <20210510102009.010406493@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510102004.821838356@linuxfoundation.org>
References: <20210510102004.821838356@linuxfoundation.org>
User-Agent: quilt/0.66
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
Cc: Sasha Levin <sashal@kernel.org>, Leo Li <sunpeng.li@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lee Jones <lee.jones@linaro.org>

[ Upstream commit 89adc10178fd6cb68c8ef1905d269070a4d3bd64 ]

Fixes the following W=1 kernel build warning(s):

 In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dce112/dce112_resource.c:59:
 drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_11_2_sh_mask.h:10014:58: warning: initialized field overwritten [-Woverride-init]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.h:214:16: note: in expansion of macro ‘AUX_SW_DATA__AUX_SW_AUTOINCREMENT_DISABLE__SHIFT’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.h:127:2: note: in expansion of macro ‘AUX_SF’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce112/dce112_resource.c:177:2: note: in expansion of macro ‘DCE_AUX_MASK_SH_LIST’
 drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_11_2_sh_mask.h:10014:58: note: (near initialization for ‘aux_shift.AUX_SW_AUTOINCREMENT_DISABLE’)
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.h:214:16: note: in expansion of macro ‘AUX_SW_DATA__AUX_SW_AUTOINCREMENT_DISABLE__SHIFT’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.h:127:2: note: in expansion of macro ‘AUX_SF’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce112/dce112_resource.c:177:2: note: in expansion of macro ‘DCE_AUX_MASK_SH_LIST’
 drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_11_2_sh_mask.h:10013:56: warning: initialized field overwritten [-Woverride-init]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.h:214:16: note: in expansion of macro ‘AUX_SW_DATA__AUX_SW_AUTOINCREMENT_DISABLE_MASK’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.h:127:2: note: in expansion of macro ‘AUX_SF’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce112/dce112_resource.c:181:2: note: in expansion of macro ‘DCE_AUX_MASK_SH_LIST’
 drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_11_2_sh_mask.h:10013:56: note: (near initialization for ‘aux_mask.AUX_SW_AUTOINCREMENT_DISABLE’)
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.h:214:16: note: in expansion of macro ‘AUX_SW_DATA__AUX_SW_AUTOINCREMENT_DISABLE_MASK’
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.h:127:2: note: in expansion of macro ‘AUX_SF’

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.h b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.h
index 382465862f29..f72f02e016ae 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.h
@@ -99,7 +99,6 @@ struct dce110_aux_registers {
 	AUX_SF(AUX_SW_CONTROL, AUX_SW_GO, mask_sh),\
 	AUX_SF(AUX_SW_DATA, AUX_SW_AUTOINCREMENT_DISABLE, mask_sh),\
 	AUX_SF(AUX_SW_DATA, AUX_SW_DATA_RW, mask_sh),\
-	AUX_SF(AUX_SW_DATA, AUX_SW_AUTOINCREMENT_DISABLE, mask_sh),\
 	AUX_SF(AUX_SW_DATA, AUX_SW_INDEX, mask_sh),\
 	AUX_SF(AUX_SW_DATA, AUX_SW_DATA, mask_sh),\
 	AUX_SF(AUX_SW_STATUS, AUX_SW_REPLY_BYTE_COUNT, mask_sh),\
-- 
2.30.2



