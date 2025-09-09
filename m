Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D7EB4A6C3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 11:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102DC10E662;
	Tue,  9 Sep 2025 09:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="m7tn3eUM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B079F10E662
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 09:09:01 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58998Y9g3993797;
 Tue, 9 Sep 2025 04:08:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1757408914;
 bh=wtehbEg8p9E0pxx69NxmM//cOwvYjta/r/PtI10RzLE=;
 h=From:To:CC:Subject:Date;
 b=m7tn3eUMdbw+x8jkaM/7ZFn+IDbl5z2saO89eE7qzJ0jgX3rPRvXnfNRqxp61PBgY
 1XCZWmttQIPI9qiflQ75YEnGbCIM8L0cD61o5WOXyX9OTbrSAnLt0hsS+A+pjU0pEU
 adLqqWoeG0VYg9cgo3n42y+oNOZslqfYDac/yMKA=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58998Ygr3048878
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 9 Sep 2025 04:08:34 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 04:08:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 9 Sep 2025 04:08:33 -0500
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58998Pkq2399851;
 Tue, 9 Sep 2025 04:08:26 -0500
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <lumag@kernel.org>, <dianders@chromium.org>,
 <andy.yan@rock-chips.com>, <mordan@ispras.ru>, <linux@treblig.org>,
 <viro@zeniv.linux.org.uk>, <aradhya.bhatia@linux.dev>,
 <javierm@redhat.com>, <tomi.valkeinen@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devarsht@ti.com>, <u-kumar1@ti.com>, <s-jain1@ti.com>
CC: <lyude@redhat.com>, <luca.ceresoli@bootlin.com>
Subject: [PATCH v6 0/6] MHDP8546 fixes related to DBANC usecase
Date: Tue, 9 Sep 2025 14:38:18 +0530
Message-ID: <20250909090824.1655537-1-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

With the DBANC framework, the connector is no longer initialized in 
bridge_attach()when the display controller sets the 
DRM_BRIDGE_ATTACH_NO_CONNECTOR flag. 
This causes a null pointer dereference in cdns_mhdp_modeset_retry_fn() 
when trying to access &conn->dev->mode_config.mutex. 
Observed on a board where EDID read failed. 
(log: https://gist.github.com/Jayesh2000/233f87f9becdf1e66f1da6fd53f77429)

The series addresses this by first removing the unused legacy connector 
initialization, then switching the driver to consistently use 
drm_connector pointers and ensuring the  pointer is set during 
atomic enable so recovery paths like modeset_retry_fn() work correctly. 
Once that is in place, mode validation is moved into the bridge through a 
new bridge_mode_valid() hook to reject invalid modes, 
since the connector helpers are no longer available. 

The first 4 patches are hence marked with fixes-tag as they fix the 
bug introduced in driver by commit id which enabled the DBANC flag.
The rationale behind the sequence of commits is we can cleanly 
switch to drm_connector pointer after removal of connector helper 
code blocks, which are anyways not touch after DBANC has been 
enabled in driver.

The later patches make smaller adjustments: lowering the log level for
noisy DPCD transfer errors and moving HDCP state handling into the bridge 
atomic check in line with the DBANC model.

 
v5 patch link:
<https://lore.kernel.org/all/20250811075904.1613519-1-h-shenoy@ti.com/>

Changelog v5 -> v6:
-Update cover letter to clarify the series in better way.
-Add Reviewed-by tag to relevant patches.
 
v4 patch link: 
<https://lore.kernel.org/all/20250624054448.192801-1-j-choudhary@ti.com>

Changelog v4->v5:
- Handle HDCP state in bridge atomic check instead of connector 
atomic check
 
v3 patch link:
<https://lore.kernel.org/all/20250529142517.188786-1-j-choudhary@ti.com/>

Changelog v3->v4:
- Fix kernel test robot build warning:
  <https://lore.kernel.org/all/202505300201.2s6r12yc-lkp@intel.com/>

v2 patch link:
<https://lore.kernel.org/all/20250521073237.366463-1-j-choudhary@ti.com/>

Changelog v2->v3:
- Add mode_valid in drm_bridge_funcs to a separate patch
- Remove "if (mhdp->connector.dev)" conditions that were missed in v2
- Split out the move of drm_atomic_get_new_connector_for_encoder()
  to a separate patch
- Drop "R-by" considering the changes in v2[1/3]
- Add Fixes tag to first 4 patches:
  commit c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
  This added DBANC flag in tidss while attaching bridge to the encoder
- Drop RFC prefix

v1 patch link:
<https://lore.kernel.org/all/20250116111636.157641-1-j-choudhary@ti.com/>

Changelog v1->v2:
- Remove !DRM_BRIDGE_ATTACH_NO_CONNECTOR entirely
- Add mode_valid in drm_bridge_funcs[0]
- Fix NULL POINTER differently since we cannot access atomic_state
- Reduce log level in cdns_mhdp_transfer call

[0]: https://lore.kernel.org/all/20240530091757.433106-1-j-choudhary@ti.com/

Harikrishna Shenoy (1):
  drm/bridge: cadence: cdns-mhdp8546-core: Handle HDCP state in bridge
    atomic check

Jayesh Choudhary (5):
  drm/bridge: cadence: cdns-mhdp8546-core: Remove legacy support for
    connector initialisation in bridge
  drm/bridge: cadence: cdns-mhdp8546*: Change drm_connector from
    structure to pointer
  drm/bridge: cadence: cdns-mhdp8546-core: Set the mhdp connector
    earlier in atomic_enable()
  drm/bridge: cadence: cdns-mhdp8546-core: Add mode_valid hook to
    drm_bridge_funcs
  drm/bridge: cadence: cdns-mhdp8546-core: Reduce log level for DPCD
    read/write

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 258 +++++-------------
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |   8 +-
 3 files changed, 72 insertions(+), 196 deletions(-)

-- 
2.34.1

