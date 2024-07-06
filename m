Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2A192907E
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jul 2024 05:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BC710E24A;
	Sat,  6 Jul 2024 03:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aM9BCxl1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F7B10E0DC;
 Sat,  6 Jul 2024 03:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aVLghd4jwyZELjHqr9aRebhRH6gxa8q/RPvEPkUhyvw=; b=aM9BCxl17O19PpZbwxAzGH63BS
 p31Bp2v2VbCpCxjwc1FsSdAjZM1Zmq66lDhR8P3V5Y6GG8HcrWkxnTgWV91l5OGsE+ucCzUtLX4ta
 DsP+SsPnn64n1sYqSl4nBYWyPRth3dLNCK2QKxGk+sppkg+Lip3oH+oUT4jVsGGzseqoZaemftAJJ
 Iep0oJi6tHRVgGoSyoA56bPtDC+Dxz1wwHWhU6CsRD+rPOpcrP1MCViWecTl1POzTMmEKtRSZUX/B
 l+T8JmTQjqnJ84MHGd5uGFYR5qGyQ178WjFbOjgqrmSAle9rVpG9QC+JKRA2NE4IQa6+Fd1BAonli
 e+pl+q0g==;
Received: from [189.6.17.125] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sPwHU-00Bj27-4G; Sat, 06 Jul 2024 05:40:12 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 daniel@ffwll.ch, harry.wentland@amd.com, Rodrigo.Siqueira@amd.com,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com
Cc: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v4 00/11] drm/amd/display: switch amdgpu_dm_connector to use
 struct drm_edid
Date: Sat,  6 Jul 2024 00:35:01 -0300
Message-ID: <20240706034004.801329-1-mwen@igalia.com>
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

This series is an updated version of the previous attempt to make AMD
display driver use opaque drm_edid instead of open struct edid[1]. Here
I address Jani's last review and remove the raw edid handling when
parsing edid caps by using drm_eld info and drm_edid_product_id from
Jani's series[2]. I also dropped the first patch from the previous
version since it was addressed by [3]

amd-staging-drm-next doesn't have the commits that support
drm_edid_product_id, so this version works on top of amd/drm-next
branch. Besides that, currently amd/drm-next has a bug that was already
fixed upstream by [4].

In short, this series applies to amd/drm-next + bug fix.

Patches 1-5 apply to amd-staging-drm-next.
- 1-2 basically change amd connector to store struct drm_edid instead of
  edid with some pending rework to get rid of raw edid.
- 3-5 update the driver code to use drm common-code, removing steps done
  during drm_edid updates.

Patches 6-11 depend on drm_edid_product_id, therefore, it doesn't apply
to amd-staging-drm-next (now it's on top of amd/drm-next). They parse
edid caps from drm_eld and drm_edid_product_id data, removing the need
of handling raw edid in the dm_helpers_parse_edid_caps(), since all
callers of this helper has updated display info from drm_edid at this
point.

To completely remove raw edid, I changed dc/link_detection in the last
commit because all calls of dm_helpers_parse_edid_caps in
link_add_remote_sink are preceded by the setup and update of drm_edid in
the connector, so we can always use the connector->drm_edid. If this
changed is not recommended, we can keep the dc_edid parameter, but
unused.

Finally, there are some pending drm_edid_raw to be addressed in next
iterations.

You can find a branch with amd-staging-drm-next and drm_edid missing
commits here[5].
You can also find a gitlab branch on top of amd/drm-next here[6].

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

[1] https://lore.kernel.org/amd-gfx/20240327214953.367126-1-mwen@igalia.com/
[2] https://lore.kernel.org/dri-devel/cover.1712655867.git.jani.nikula@intel.com
[3] https://lore.kernel.org/amd-gfx/20240509015527.754-1-mario.limonciello@amd.com/
[4] https://lore.kernel.org/amd-gfx/20240610180401.9540-1-Arunpravin.PaneerSelvam@amd.com/
[5] https://gitlab.freedesktop.org/mwen/linux-amd/-/commits/asdn-drm_edid-migration
[6] https://gitlab.freedesktop.org/mwen/linux-amd/-/commits/drm-next-drm_edid-migration

Melissa Wen (11):
  drm/amd/display: clean unused variables for hdmi freesync parser
  drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid
  drm/amd/display: switch to setting physical address directly
  drm/amd/display: always call connector_update when parsing
    freesync_caps
  drm/amd/display: remove redundant freesync parser for DP
  drm/amd/display: use drm_edid_product_id for parsing EDID product info
  drm/amd/display: don't give initial values for sad/b_count
  drm/amd/display: parse display name from drm_eld
  drm/amd/display: get SAD from drm_eld when parsing EDID caps
  drm/amd/display: get SADB from drm_eld when parsing EDID caps
  drm/amd/display: remove dc_edid handler from
    dm_helpers_parse_edid_caps

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 198 +++++-------------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   4 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 110 +++++-----
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  32 +--
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |   1 -
 .../drm/amd/display/dc/link/link_detection.c  |   6 +-
 6 files changed, 128 insertions(+), 223 deletions(-)

-- 
2.43.0

