Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BE694B159
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 22:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73C810E1E5;
	Wed,  7 Aug 2024 20:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DZ84yKfh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA1B10E1E5;
 Wed,  7 Aug 2024 20:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CQ8edwtzyG0J16XiUr2wFd7uhCXmwRC9WSvQBDtaPqk=; b=DZ84yKfhrjvjGWGXMGpwl5gzy8
 qgyEfp95zHp/hT7QyxDQTFgjzWlW/yQraofWnw1gInnv7JLWQTjg0b7LfaJHiSjIA0cnL4IX9pkuG
 SbA6+Uydm8xvykz5j9grLHnk85d2LILlZ+yLOq4UkyO4O5WDV7rmMSpLfwbakOaGJn0NKrITQi7P8
 nAGHTSlrGMEgmf+hsOZlZDKcNHN20J/YzorQV1ipRH6jH7j8TFn2QEeWjJJpatlI4Oo9SyYTayzQV
 EtFcAcrOeryqLmdyv7UtJQgcqDNcnbuvIxuE75Y6DPARepGwffdj9SrHjEZSfC4pU3lBxLOyLcEMf
 kq6IUMaw==;
Received: from [189.6.17.125] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sbnLP-0098Re-W5; Wed, 07 Aug 2024 22:33:16 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 daniel@ffwll.ch, harry.wentland@amd.com, Rodrigo.Siqueira@amd.com,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com
Cc: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, kernel-dev@igalia.com,
 Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/9] drm/amd/display: switch amdgpu_dm_connector to use
 struct drm_edid
Date: Wed,  7 Aug 2024 19:25:02 -0100
Message-ID: <20240807203207.2830-1-mwen@igalia.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here AMD display driver migrates from open struct edid to opaque
drm_edid. This version works on top of amd/drm-next branch since
amd-staging-drm-next doesn't have the commits that support
drm_edid_product_id[1]. It's mostly addressing Alex Hung's feedback
from the previous version.

Patches 1-4 works on amd-staging-drm-next.
- First patch basically changes amd connector to store struct drm_edid
  instead of edid with some pending rework to get rid of raw edid.
- 2-4 update the driver code to use drm common-code, removing
  driver-specific steps already done during drm_edid updates.

Patches 5-9 depend on drm_edid_product_id, therefore, it doesn't work on
current amd-staging-drm-next. They parse edid caps from drm_eld and
drm_edid_product_id data, removing the need of handling raw edid in the
dm_helpers_parse_edid_caps(), since all callers of this helper has
updated display info from drm_edid at this point.

To completely remove raw edid, I changed dc/link_detection in the last
commit because all calls of dm_helpers_parse_edid_caps in
link_add_remote_sink are preceded by the setup and update of drm_edid in
the connector, so we can always use the connector->drm_edid. 

Finally, there are some pending drm_edid_raw to be addressed in next
iterations.

Let me know your thoughts.

Melissa

Change log:
v1: https://lore.kernel.org/amd-gfx/20240126163429.56714-1-mwen@igalia.com/
- use const to fix compilation warnings (Alex Hung)
- remove unused variables
- remove driver-specific parser for connector info in favor of drm_edid
  common code

v2: https://lore.kernel.org/amd-gfx/20240327165828.288792-1-mwen@igalia.com/
- fix general protection fault on mst

v3: https://lore.kernel.org/amd-gfx/20240327214953.367126-1-mwen@igalia.com/
- rename edid to drm_edid in amdgpu_connector (Jani)
- call drm_edid_connector_update to clear edid in case of NULL (Jani)
- keep setting NULL instead of free drm_edid (Jani)
- check drm_edid not NULL, instead of valid (Jani)
- use drm_edid_product_id to parse product info
- use drm_eld info to parse edid caps

v4: https://lore.kernel.org/amd-gfx/20240706034004.801329-1-mwen@igalia.com/
- squash variable cleanup to related common-code cleanup (Alex H)
- add more informative commit description (Alex H)
- avoid unnecessary call to drm_edid_raw (Alex H)
- remove unnecessary cast (Alex H.)
- remove deprecated comments (Alex H.)
- fix kernel-doc (kernel test bot)

[1] https://lore.kernel.org/dri-devel/cover.1712655867.git.jani.nikula@intel.com

Melissa Wen (9):
  drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid
  drm/amd/display: switch to setting physical address directly
  drm/amd/display: always call connector_update when parsing
    freesync_caps
  drm/amd/display: remove redundant freesync parser for DP
  drm/amd/display: use drm_edid_product_id for parsing EDID product info
  drm/amd/display: parse display name from drm_eld
  drm/amd/display: get SAD from drm_eld when parsing EDID caps
  drm/amd/display: get SADB from drm_eld when parsing EDID caps
  drm/amd/display: remove dc_edid handler from
    dm_helpers_parse_edid_caps

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 196 +++++-------------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   4 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 113 +++++-----
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  32 +--
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |   1 -
 .../drm/amd/display/dc/link/link_detection.c  |   6 +-
 6 files changed, 131 insertions(+), 221 deletions(-)

-- 
2.43.0

