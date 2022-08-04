Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 397D6589E0E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 17:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE19B9AB47;
	Thu,  4 Aug 2022 15:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826BA9AB5C;
 Thu,  4 Aug 2022 15:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YX+MfgERDqrkuo+qdqYqdwFf/sOLbXC8eVOMdjdHBNU=; b=D/5/2w9m73Sepr0GEukFo7fE58
 KAHTVBVNwzrM6BoAvZd/Yrzf8g5CwzjPAB74ZK/QZ4a74+oORpv0mzEtoKTxN3/rKW2ffLFgJC+18
 3FXL74GE9276Iz9nksKfD0tWVR1L1g2N20YVErkK1zzgKI8JPfNV3EO8kokU4vFVV545HgTeSAa4S
 +48G7EopeMjF6ubq8jxycIj7KO2Gfnsn6VuiN2JEt3/09onR3ILULL1neYd692VlE3ZTBi23tR/QJ
 qicbmpUf+pg+cSpbDNq8kFo2GI2VF20Xj/TJ9T0J2XHSg077zjpraYFwmSsyZfct6X+TSUSBVfRi4
 M1H7kGMg==;
Received: from [165.90.126.25] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oJcLe-00GFt0-C1; Thu, 04 Aug 2022 17:01:18 +0200
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, sungjoon.kim@amd.com, nicholas.kazlauskas@amd.com
Subject: [PATCH v2 0/4] Documentation/amdgpu/display: describe color and blend
 mode properties mapping
Date: Thu,  4 Aug 2022 14:01:03 -0100
Message-Id: <20220804150107.3435964-1-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
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
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As mentioned in the previous version, patches 1 and 2 describe DM
mapping of DRM color correction properties to DC interface and where
detached from 3D LUT RFC series [1]. Patches 3 and 4 describe MPC block
programming that matches the three DRM blend modes and came from
previous work [2][3] and discussions on AMD issue tracker. Let me know
any misleading information.

In this version, typos were fixed and I removed unusual kernel-docs
inside functions, as suggested by Tales. I also added description of
some struct elements thanks to Siqueira's feedback. I restructured the
introdutory text of the color section, but preserved the content.
Unfortunately, there are some missing definitions for mpc_blnd_cfg, that
I appreciate if someone can provide more information:

./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'overlap_only' not described in 'mpcc_blnd_cfg'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'bottom_gain_mode' not described in 'mpcc_blnd_cfg'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'background_color_bpc' not described in 'mpcc_blnd_cfg'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'top_gain' not described in 'mpcc_blnd_cfg'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'bottom_inside_gain' not described in 'mpcc_blnd_cfg'
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'bottom_outside_gain' not described in 'mpcc_blnd_cfg'     

[1] https://lore.kernel.org/amd-gfx/20220619223104.667413-1-mwen@igalia.com/
[2] https://lore.kernel.org/amd-gfx/20220329201835.2393141-1-mwen@igalia.com/
[3] https://lore.kernel.org/amd-gfx/7a95d6a4-bc2f-b0e8-83f8-8cc5b75599f2@amd.com/

Melissa Wen (4):
  Documentation/amdgpu_dm: Add DM color correction documentation
  Documentation/amdgpu/display: add DC color caps info
  drm/amd/display: add doc entries for MPC blending configuration
  Documentation/gpu/amdgpu/amdgpu_dm: add DM docs for pixel blend mode

 .../gpu/amdgpu/display/dc-glossary.rst        |    2 +-
 .../amdgpu/display/dcn2_cm_drm_current.svg    | 1370 +++++++++++++++
 .../amdgpu/display/dcn3_cm_drm_current.svg    | 1529 +++++++++++++++++
 .../gpu/amdgpu/display/display-manager.rst    |  141 ++
 Documentation/gpu/drm-kms.rst                 |    2 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  109 +-
 drivers/gpu/drm/amd/display/dc/dc.h           |   77 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   |   91 +-
 8 files changed, 3265 insertions(+), 56 deletions(-)
 create mode 100644 Documentation/gpu/amdgpu/display/dcn2_cm_drm_current.svg
 create mode 100644 Documentation/gpu/amdgpu/display/dcn3_cm_drm_current.svg

-- 
2.35.1

