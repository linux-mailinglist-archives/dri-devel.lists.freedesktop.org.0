Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 166A288EBDC
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 17:58:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F6A10FE57;
	Wed, 27 Mar 2024 16:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Lgj11JaZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CE410FE55;
 Wed, 27 Mar 2024 16:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BfO35s6LBj1xKANKTUxOGpCUvV3CwstDVe+I5BWJKD0=; b=Lgj11JaZc67oxPbjbmzyXhzcYx
 JnALWqP3geOdpNE0/ivnP3oXbHkfi8g02m/RJ2NGrsW5QevhETmXHtkq95fi2tdHP54DhH+FJxFcx
 BOzHuasWpWQbLTE+Ps+CmL5qnnbpTokGeW0riWFMFVF/Ugj4jUqPcPGLzJK3tW2IF5U/HcdGoZUGb
 BzGubgv9Q08AjnsxkOxpxhRown+QdawmOaqG9Yd40zTRzGN/0uizaNWCRmScy53nBwd4yTc+8i/0J
 /CyLNkCO35BjSTrtu4X7B4MBxyN9uP4VRh43DcpOoyAKnJN5JpFl1SZXpACvDB/Bgf+gqp/GLKyxd
 wKeLZ30Q==;
Received: from [189.6.17.125] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rpWbl-00Fx4M-HA; Wed, 27 Mar 2024 17:58:38 +0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, airlied@gmail.com,
 daniel@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 0/6] switch amdgpu_dm_connector to use struct drm_edid
Date: Wed, 27 Mar 2024 13:54:41 -0300
Message-ID: <20240327165828.288792-1-mwen@igalia.com>
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

After finding a null-pointer dereference when running
igt@kms_connector_force_edid (fixed by [1]), I started migrating raw
edid handles in amdgpu connectors to use opaque drm_edid and its
helpers.

However, I'm struggling to remove all drm_edid_raw() occurrences for
different reasons and, with this RFC, I'm looking for suggestions to
overcome them:
1. `dc_link` ops need a copy of edid data and size via `dc_sink`
   (basically, dc_link_add_remote_sink()). I'm unsure what a possible
   approach to clean dc_link helpers should be since it seems part of the
   shared code. Any suggestions?

2. Most of the edid data handled by `dm_helpers_parse_edid_caps()` are
   in drm_edid halpers, but there are still a few that are not managed by
   them yet. For example:
   ```
	edid_caps->serial_number = edid_buf->serial;
	edid_caps->manufacture_week = edid_buf->mfg_week;
	edid_caps->manufacture_year = edid_buf->mfg_year;
   ```
   AFAIU I see the same pending issue in i915/pnpid_get_panel_type() -
   that still uses drm_edid_raw().

My suggestion is to keep the drm_edid_raw() around and verify if there
are no regressions or functional changes after this switch of
amdgpu_dm_connector to struct drm_edid. I added FIXME comments to all
drm_edid_raw occurrences to keep these pending issues on our radar. So
we can continue removing driver-specific code in favor of drm_edid
common code. What do you think?

This is the current status of drm_edid migration in this patchset:
- patch 1-2: remove unused variables found in this process.
- patch 3-4: migration of amdgpu_dm_connector from struct edid to struct
  drm_edid and its helpers.
- patch 5-6: remove duplicated code for parsing vrr caps. WIP: require
  more validation.

Additionally, it needs extensive testing and validation of a large
variety of display caps and I don't have the required setup for it
(perhaps you can test it in your CI to point issues?). I don't see how
to reduce the scope of changes to mitigate the noise/disruption, but any
suggestions are welcome.

Thanks,

Melissa

Melissa Wen (6):
  drm/amd/display: remove unused pixel_clock_mhz from
    amdgpu_dm_connector
  drm/amd/display: clean unused variables for hdmi freesync parser
  drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid
  drm/amd/display: switch to setting physical address directly
  drm/amd/display: always call connector_update when parsing
    freesync_caps
  drm/amd/display: remove redundant freesync parser for DP

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 187 +++++-------------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   5 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |   8 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  28 +--
 4 files changed, 71 insertions(+), 157 deletions(-)

-- 
2.43.0

