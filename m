Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 583FA7FC0D3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 18:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE14910E32B;
	Tue, 28 Nov 2023 17:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC3010E2FD;
 Tue, 28 Nov 2023 17:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6Oo2zG9cjDU3xCQJ+vVVaCxGES0rlcloCGt28WDbyE0=; b=fz9AdY7hlOuSAH2WmiBtLzL8lr
 NHcI+7OczQr+uDIMUhY4rjNKH2+bVzDk1Q3TMxSeu6mv2ITb9cjkEdt0TD3UtFAek8hZ0YCIMSW4s
 0/8R260E2o4xy4b4TslId8d6y/MQjqDMncyvlcLXvGM2KRpxQHFZaColfg/2dm8/le1OoCpGhNeKy
 kK/1OWQqAfl+pb/IFbSKLFupSFg43tCuIB6thUq1evo9+9DN6svlgxZ1vrWm2jFYivQ8OnAF8dJM3
 xleNWJb94dQYqxJkUemH5qM5Q1PlG1tmnVobHLeENDgQzFZwNCXIDzAupovP9mz6AUemRVDYEVtdV
 azG4lXzw==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r82Ju-0087Bf-MS; Tue, 28 Nov 2023 18:56:26 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Krunoslav Kovac <krunoslav.kovac@amd.com>, airlied@gmail.com,
 christian.koenig@amd.com, daniel@ffwll.ch, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com
Subject: [PATCH v3 0/9] drm/amd/display: improve DTN color state log
Date: Tue, 28 Nov 2023 16:52:48 -0100
Message-ID: <20231128175623.121356-1-mwen@igalia.com>
X-Mailer: git-send-email 2.42.0
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
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series updates the color state section of the AMD DTN log to match
color resource differences between DCN versions.

Currently, the DTN log considers the DCN10 color pipeline, which is
useless for newer DCN versions due to all the color capability
differences. In addition to the new color blocks and features, some
semantic differences meant that the DCN10 output was no longer suitable
for newer families.

This version addresses comments from Siqueira and Harry [1]. It also
contains some improvements: DPP and MPC gamut remap matrix data in 31.32
fixed point format and coverage of DCN2+ and DCN3+.

- The first patch decouple DCN10 color state from HW log in a
  preparation for color logs specific to each DCN family.
- Harry kindly provided the second patch with a way to read Gamut Remap
  Matrix data in 31.32 fixed point format instead of HW values.
- With this, I replaced the DCN10 gamut remap output to display values
  in the new format (third patch).
- Patches 4 and 6 fill up the color state of DPP and MPC blocks for DCN3
  from the right registers.
- As DCN3+ has a new MPC color block for post-blending Gamut Remap
  matrix, in the patch 5 I reuse Harry's approach for reading DPP gamut
  remap matrix and create a helper to read data of MPC gamut remap
  matrix.
- Patch 7 and 9 create the new color state log specific for DCN2+ and
  DCN3+. I didn't extend to DCN32 (and also DCN35) because I observed
  some differences in the shaper and 3D LUT registers of this version.
- Patch 8 adds description of DPP and MPC color blocks for for better
  interpretation of data.

This new approach works well with the driver-specific color
properties[2] and steamdeck/gamescope[3] together, where we can see
color state changing from default values. I also tested with
steamdeck/KDE and DCN21/GNOME.

Please find some `before vs after` results below:

===

DCN301 - Before:
---------------

DPP:    IGAM format  IGAM mode    DGAM mode    RGAM mode  GAMUT mode  C11 C12   C13 C14   C21 C22   C23 C24   C31 C32   C33 C34
[ 0]:            0h  BypassFixed  Bypass       Bypass            0    00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
[ 1]:            0h  BypassFixed  Bypass       Bypass            0    00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
[ 2]:            0h  BypassFixed  Bypass       Bypass            0    00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
[ 3]:            0h  BypassFixed  Bypass       Bypass            0    00000000h 00000000h 00000000h 00000000h 00000000h 00000000h

MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE
[ 0]:   0h   0h       2h     3           0        1             0     0
[ 1]:   0h   1h       fh     2           2        0             0     0
[ 2]:   0h   2h       3h     3           0        1             0     0
[ 3]:   0h   3h       1h     3           2        0             0     0


DCN301 - After (Gamescope):
---------------------------

DPP:  DGAM ROM  DGAM ROM type  DGAM LUT  SHAPER mode  3DLUT mode  3DLUT bit depth  3DLUT size  RGAM mode  GAMUT adjust  C11        C12        C13        C14        C21        C22        C23        C24        C31        C32        C33        C34        
[ 0]:        1           sRGB    Bypass        RAM B       RAM A           12-bit    17x17x17      RAM A        Bypass  0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000
[ 1]:        1           sRGB    Bypass        RAM B       RAM A           12-bit    17x17x17      RAM A        Bypass  0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000
[ 2]:        1           sRGB    Bypass        RAM B       RAM A           12-bit    17x17x17      RAM A        Bypass  0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000
[ 3]:        1           sRGB    Bypass        RAM B       RAM A           12-bit    17x17x17      RAM A        Bypass  0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000

DPP Color Caps: input_lut_shared:0  icsc:1  dgam_ram:0  dgam_rom: srgb:1,bt2020:1,gamma2_2:1,pq:1,hlg:1  post_csc:1  gamcor:1  dgam_rom_for_yuv:0  3d_lut:1  blnd_lut:1  oscs:0

MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE  SHAPER mode  3DLUT mode  3DLUT bit-depth  3DLUT size  OGAM mode  OGAM LUT  GAMUT adjust  C11        C12        C13        C14        C21        C22        C23        C24        C31        C32        C33        C34        
[ 0]:   0h   0h       2h     3           0        1             0     0       Bypass      Bypass           12-bit    17x17x17        RAM         A  Bypass        0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000
[ 1]:   0h   1h       fh     2           2        0             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A  Bypass        0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000
[ 2]:   0h   2h       3h     3           0        1             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A  Bypass        0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000
[ 3]:   0h   3h       1h     3           2        0             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A  Bypass        0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000

MPC Color Caps: gamut_remap:1, 3dlut:2, ogam_ram:1, ocsc:1


DCN301 - After (KDE/X11):
------------------------

DPP:  DGAM ROM  DGAM ROM type  DGAM LUT  SHAPER mode  3DLUT mode  3DLUT bit depth  3DLUT size  RGAM mode  GAMUT adjust  C11        C12        C13        C14        C21        C22        C23        C24        C31        C32        C33        C34        
[ 0]:        0           sRGB    Bypass       Bypass      Bypass           12-bit       9x9x9     Bypass        Bypass  0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000
[ 3]:        0           sRGB    Bypass       Bypass      Bypass           12-bit       9x9x9     Bypass        Bypass  0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000

DPP Color Caps: input_lut_shared:0  icsc:1  dgam_ram:0  dgam_rom: srgb:1,bt2020:1,gamma2_2:1,pq:1,hlg:1  post_csc:1  gamcor:1  dgam_rom_for_yuv:0  3d_lut:1  blnd_lut:1  oscs:0

MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE  SHAPER mode  3DLUT mode  3DLUT bit-depth  3DLUT size  OGAM mode  OGAM LUT  GAMUT adjust  C11        C12        C13        C14        C21        C22        C23        C24        C31        C32        C33        C34        
[ 0]:   0h   0h       3h     3           2        0             0     0       Bypass      Bypass           12-bit    17x17x17        RAM         A  SW            4294967296 0000000000 0000000000 0000000000 0000000000 4294967296 0000000000 0000000000 0000000000 0000000000 4294967296 0000000000
[ 3]:   0h   3h       fh     2           2        0             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A  Bypass        0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000 0000000000

MPC Color Caps: gamut_remap:1, 3dlut:2, ogam_ram:1, ocsc:1

===============

DCN21 - Before:
---------------

DPP:    IGAM format  IGAM mode    DGAM mode    RGAM mode  GAMUT mode  C11 C12   C13 C14   C21 C22   C23 C24   C31 C32   C33 C34
[ 0]:            0h  BypassFixed  Bypass       Bypass            1    00002000h 00000000h 20000000h 00000000h 00000000h 00002000h
[ 3]:            0h  BypassFixed  Bypass       Bypass            1    00002000h 00000000h 20000000h 00000000h 00000000h 00002000h

MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE
[ 0]:   0h   0h       3h     3           2        0             0     0
[ 3]:   0h   3h       fh     2           2        0             0     0



DCN21 - After (GNOME):
----------------------

DPP:  DGAM mode  SHAPER mode  3DLUT mode  3DLUT bit depth  3DLUT size  RGAM mode  GAMUT adjust  C11        C12        C13        C14        C21        C22        C23        C24        C31        C32        C33        C34        
[ 0]:    Bypass       Bypass      Bypass           12-bit       9x9x9     Bypass            SW  4294967296 0000000000 0000000000 0000000000 0000000000 4294967296 0000000000 0000000000 0000000000 0000000000 4294967296 0000000000
[ 3]:    Bypass       Bypass      Bypass           12-bit       9x9x9     Bypass            SW  4294967296 0000000000 0000000000 0000000000 0000000000 4294967296 0000000000 0000000000 0000000000 0000000000 4294967296 0000000000

DPP Color Caps: input_lut_shared:0  icsc:1  dgam_ram:1  dgam_rom: srgb:1,bt2020:1,gamma2_2:0,pq:0,hlg:0  post_csc:0  gamcor:0  dgam_rom_for_yuv:1  3d_lut:1  blnd_lut:1  oscs:0

MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE  OGAM mode
[ 0]:   0h   0h       3h     3           2        0             0     0      RAM A
[ 3]:   0h   3h       fh     2           2        0             0     0     Bypass

MPC Color Caps: gamut_remap:0, 3dlut:0, ogam_ram:1, ocsc:1

===

Let me know your thoughts.

Melissa

[1] https://lore.kernel.org/amd-gfx/20230913164329.123687-1-mwen@igalia.com/
[2] https://lore.kernel.org/amd-gfx/20231116195812.906115-1-mwen@igalia.com/
[3] https://github.com/ValveSoftware/gamescope/blob/master/src/docs/Steam%20Deck%20Display%20Pipeline.png


Harry Wentland (1):
  drm/amd/display: Add dpp_get_gamut_remap functions

Melissa Wen (8):
  drm/amd/display: decouple color state from hw state log
  drm/amd/display: read gamut remap matrix in fixed-point 31.32 format
  drm/amd/display: fill up DCN3 DPP color state
  drm/amd/display: add get_gamut_remap helper for MPC3
  drm/amd/display: create DCN3-specific log for MPC state
  drm/amd/display: hook up DCN30 color blocks data to DTN log
  drm/amd/display: add DPP and MPC color caps to DTN log
  drm/amd/display: hook up DCN20 color blocks data to DTN log

 .../drm/amd/display/dc/basics/conversion.c    |  34 ++++
 .../drm/amd/display/dc/basics/conversion.h    |   4 +
 .../amd/display/dc/dcn10/dcn10_cm_common.c    |  20 +++
 .../amd/display/dc/dcn10/dcn10_cm_common.h    |   4 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c  |   3 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h  |   3 +
 .../drm/amd/display/dc/dcn10/dcn10_dpp_cm.c   |  70 +++++++-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c  |  31 ++--
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dpp.h  |   3 +
 .../drm/amd/display/dc/dcn20/dcn20_dpp_cm.c   |  55 +++++++
 .../gpu/drm/amd/display/dc/dcn20/dcn20_init.c |   1 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c  |  24 ++-
 .../drm/amd/display/dc/dcn201/dcn201_dpp.c    |   1 +
 .../gpu/drm/amd/display/dc/dcn21/dcn21_init.c |   1 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c  |  38 ++++-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h  |   2 +
 .../drm/amd/display/dc/dcn30/dcn30_dpp_cm.c   |  54 +++++++
 .../gpu/drm/amd/display/dc/dcn30/dcn30_init.c |   1 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c  | 106 ++++++++++++-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h  |   4 +
 .../drm/amd/display/dc/dcn301/dcn301_init.c   |   1 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_init.c |   1 +
 .../drm/amd/display/dc/dcn314/dcn314_init.c   |   1 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c  |   1 +
 .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   |  90 ++++++++---
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   | 106 +++++++++++++
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.h   |   2 +
 .../amd/display/dc/hwss/dcn30/dcn30_hwseq.c   | 149 ++++++++++++++++++
 .../amd/display/dc/hwss/dcn30/dcn30_hwseq.h   |   3 +
 .../drm/amd/display/dc/hwss/hw_sequencer.h    |   2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |  14 ++
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   |   7 +
 32 files changed, 795 insertions(+), 41 deletions(-)

-- 
2.42.0

