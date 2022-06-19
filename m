Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D203550D6F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 00:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3FD112EA6;
	Sun, 19 Jun 2022 22:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1861112EA8;
 Sun, 19 Jun 2022 22:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FNpcaGqrG4M2FjccRgLzoZmtRAPdMo+nzena9XCnzNI=; b=Eq6kDYAGtv3Ufq7l/iE8su0+tn
 hwTZyKGq+9HUSLpxWk6BhA2oFJUsof7vtnAxswsc0LducjVeIuJYx6XGU2CUvxp91bxVAwtfzoAmy
 AZD2HTW2vt4yMngYs+XHLrCSk/o3Osf79Ys2kKBq+7qvmSBsMl5GvZ5svsYmXjKden+Mu9mdxLzd1
 dq4QwQrFkKZ/KIzgUnMGVs9qGjK/U0teqO33bl7Lb7Ml4NW3xcKftkWlc2HkwIlPm64zm+Qipx+wg
 S4J68lUphVgWEOU8Zmaaa06nkWKnFQzmizaI76Moh4sXCCZA71hU2ppzdcVSuBXizEu4oe4CBVAWk
 0eCgKY6w==;
Received: from [195.77.82.244] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1o33SW-005lHy-Tb; Mon, 20 Jun 2022 00:31:57 +0200
From: Melissa Wen <mwen@igalia.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com
Subject: [RFC PATCH 0/5] DRM CRTC 3D LUT interface for AMD DCN
Date: Sun, 19 Jun 2022 21:30:59 -0100
Message-Id: <20220619223104.667413-1-mwen@igalia.com>
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
Cc: alex.hung@amd.com, amd-gfx@lists.freedesktop.org, nikola.cornij@amd.com,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org,
 bhawanpreet.lakha@amd.com, nicholas.kazlauskas@amd.com, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I've been working on a proposal to add 3D LUT interface to DRM CRTC
color mgmt, that means new **after-blending** properties for color
correction. As I'm targeting AMD display drivers, I need to map these
new properties to AMD DC interface and I have some doubts about the 3D
LUT programming on DCN blocks.

First of all, this patchset is a working in progress and further
discussions about the DRM interface should be done. I've examined
previous proposal to add 3D LUT[1][2] and I understand that the main
difference between them is regarding the property position in the DRM
color management pipeline (between CTM and Gamma 1D or after Gamma 1D).
On the other hand, AMD DC always considers a shaper (1D) LUT before a 3D
LUT, used to delinearize and shape the content.  These LUTs are then
positioned between DRM CTM and Gamma (1D).

By comparing the AMD design with the other proposals, I see that it's
possible to cover all of them by adding and combining shaper (1D) LUT
and 3D LUT as new color mgmt properties. Moreover, it'll not limit the
exposure of AMD color correction caps to the userspace. Therefore, my
proposal is to add these two new properties in the DRM color mgmt
pipeline as follows:

 +------------+
 |            |
 |  Degamma   |
 +-----+------+
       |
 +-----v------+
 |            |
 |    CTM     |
 +-----+------+
       |
++-----v------++
||            ||
|| Shaper LUT ||
++-----+------++
       |
++-----v------++
||            ||
||  3D LUT    ||
++-----+------++
       |
 +-----v------+
 |            |
 | Gamma (1D) |
 +------------+

However, many doubts arose when I was mapping these two new properties
to DC interface. This is why I decided to share an not-yet-completed
implementation to get some feedback and explanation.

This RFC patchset is divided in three scopes of change. The first two
patches document the AMD DM color correction mapping. Some comments were
rewritten as kernel doc entries. I also summarize all information
provided in previous discussions[3] and also redid those diagrams to
svg. All doc should be reviewed and some struct members lack
explanation. I can add them to documentation if you can provide a
description. Some examples that lack description so far:
* in amdgpu_display_manager: dmub_outbox_params, dmub_aux_transfer_done, delayed_hpd_wq;
* in dpp_color_caps: dgam_ram, dgam_rom_for_yuv;
* in mpc_color_caps: ogam_ram.

The next two patches expand DRM color mgmt interface to add shaper LUT
and 3D LUT. Finally, the last patch focuses on mapping DRM properties to
DC interface and these are my doubts so far:

- To configure a shaper LUT, I related it to the current configuration
  of gamma 1D. For dc_transfer_func, I should set tf according to the
  input space, that means, LINEAR for shaper LUT after blending, right?
  When 3D LUT is set, the input space for gamma 1D will no longer be
  linear, so how to define the tf?  should I set tf as sRGB, BT709 or
  what?

- I see the 3dlut values being mapped to struct tetrahedral_17 as four
  arrays lut0-4. From that I am considering tetrahedral interpolation.
  Is there any other interpolation option? Also, as the total size of the
  four arrays is the same of the 3D LUT size, I'm mapping DRM color lut
  values in ascending order, starting by filling lut0 to lut4. Is it right
  or is there another way to distribute these values across lut0-4 arrays?

- I also see tetrahedral 9x9x9, that means DC supports 9x9x9 3D LUT too?
  If so, does it depend on hw caps or it is defined by the user? Also, I
  see 10 and 12 bits color channel precision, does it depend on hw caps or
  it is also defined by the userspace? Any ideas on how to expose it?

- Why func_shaper and lut3d_func are defined as constant on
  dc_stream_state, while the other color properties are not? How should
  I change them from the proposed DRM properties? should I set 3D LUT in a
  different struct of the DC interface or a different DC pipeline stage?

- In mpc3_program_3dlut(), why we are setting is_12bits_color_channel in
  get3dlut_config(), since right after that we are changing its values
  with this line `is_12bits_color_channel = params->use_12bits`?

- In mpc3_set3dlut_ram10(), there is a suspicious comment for a shift
  operation: `should we shift red 22bit and green 12? ask Nvenko` So, is
  this operation stable/working as expected?

Thanks in advance for clarifications,

Melissa

[1] https://lore.kernel.org/all/20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com/
[2] https://github.com/vsyrjala/linux/commit/4d28e8ddf2a076f30f9e5bdc17cbb4656fe23e69
[3] https://lore.kernel.org/amd-gfx/20220505220744.3sex7ka2ha2vcguv@mail.igalia.com/

Melissa Wen (5):
  Documentation/amdgpu_dm: Add DM color correction documentation
  Documentation/amdgpu/display: add DC color caps info
  drm/drm_color_mgmt: add shaper LUT to color mgmt properties
  drm/drm_color_mgmt: add 3D LUT to color mgmt properties
  drm/amd/display: mapping new DRM 3D LUT properties to AMD hw blocks

 .../amdgpu/display/dcn2_cm_drm_current.svg    | 1370 +++++++++++++++
 .../amdgpu/display/dcn3_cm_drm_current.svg    | 1528 +++++++++++++++++
 .../gpu/amdgpu/display/display-manager.rst    |   44 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |    5 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  265 ++-
 drivers/gpu/drm/amd/display/dc/dc.h           |   53 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h    |    4 +-
 drivers/gpu/drm/drm_atomic_state_helper.c     |    7 +
 drivers/gpu/drm/drm_atomic_uapi.c             |   20 +
 drivers/gpu/drm/drm_color_mgmt.c              |   89 +-
 drivers/gpu/drm/drm_fb_helper.c               |    5 +
 drivers/gpu/drm/drm_mode_config.c             |   28 +
 include/drm/drm_color_mgmt.h                  |    4 +
 include/drm/drm_crtc.h                        |   24 +-
 include/drm/drm_mode_config.h                 |   25 +
 16 files changed, 3411 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/gpu/amdgpu/display/dcn2_cm_drm_current.svg
 create mode 100644 Documentation/gpu/amdgpu/display/dcn3_cm_drm_current.svg

-- 
2.35.1

