Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB5B79EF0A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 18:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298E610E125;
	Wed, 13 Sep 2023 16:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86D210E35A;
 Wed, 13 Sep 2023 16:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h+YNT7quiAas0+JV0YUxj+TzOIRTD5x//ekEACsPLI0=; b=GnVT/tiwE1bwPgJb6jHx3oqZBD
 ag75hsEhlpG9qGxHn170nlShuM9UU3xihYQcQcpGu2seFjRWUVFlZIQ9vAWMIFTv2UMjzRVQcsdyD
 68G4/vvBWkL327kb+rNDUygSwWuc5xgbP0vdtqhA+zfGRGjcvz+8rez6zcHd7cmFU8LqZmWLNHsPe
 NOHqAj8Ak2kG18t3kmUxOc1wznFhwwXjIDtij8FdkWMr0G1hdHO8/7t75lj9hFeaK1dOSiq8Qb+I5
 lflmaymWjNU0s1HMeNt5IGbnEW4SiOvVJFSAwYirw8+PTJwPYu2ulyln0CxmvuFUFGSmgoioPw0sk
 zP6laI6Q==;
Received: from [38.44.68.151] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qgSxf-003PbD-Hd; Wed, 13 Sep 2023 18:43:31 +0200
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 daniel@ffwll.ch, Xinhui.Pan@amd.com
Subject: [RFC PATCH v2 0/5] drm/amd/display: improve DTN color state log
Date: Wed, 13 Sep 2023 15:43:24 -0100
Message-Id: <20230913164329.123687-1-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Krunoslav Kovac <krunoslav.kovac@amd.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is an update of previous RFC [0] improving the data collection of
Gamma Correction and Blend Gamma color blocks.

As I mentioned in the last version, I'm updating the color state part of
DTN log to match DCN3.0 HW better. Currently, the DTN log considers the
DCN10 color pipeline, which is useless for DCN3.0 because of all the
differences in color caps between DCN versions. In addition to new color
blocks and caps, some semantic differences made the DCN10 output not fit
DCN30.

In this RFC, the first patch adds new color state elements to DPP and
implements the reading of registers according to HW blocks. Similarly to
MPC, the second patch also creates a DCN3-specific function to read the
MPC state and add the MPC color state logging to it. With DPP and MPC
color-register reading, I detach DCN10 color state logging from the HW
log and create a `.log_color_state` hook for logging color state
according to HW color blocks with DCN30 as the first use case. Finally,
the last patch adds DPP and MPC color caps output to facilitate
understanding of the color state log.

This version works well with the driver-specific color properties[1] and
steamdeck/gamescope[2] together, where we can see color state changing
from default values.

Here is a before vs. after example:

Without this series:
===================
DPP:    IGAM format  IGAM mode    DGAM mode    RGAM mode  GAMUT mode  C11 C12   C13 C14   C21 C22   C23 C24   C31 C32   C33 C34
[ 0]:            0h  BypassFixed  Bypass       Bypass            0    00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
[ 3]:            0h  BypassFixed  Bypass       Bypass            0    00000000h 00000000h 00000000h 00000000h 00000000h 00000000h

MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE
[ 0]:   0h   0h       3h     3           2        0             0     0
[ 3]:   0h   3h       fh     2           2        0             0     0

With this series (Steamdeck/Gamescope):
======================================

DPP:  DGAM ROM  DGAM ROM type  DGAM LUT  SHAPER mode  3DLUT mode  3DLUT bit depth  3DLUT size  RGAM mode  GAMUT mode  C11 C12   C13 C14   C21 C22   C23 C24   C31 C32   C33 C34
[ 0]:        1           sRGB    Bypass        RAM A       RAM B           12-bit    17x17x17      RAM A           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
[ 1]:        1           sRGB    Bypass        RAM B       RAM A           12-bit    17x17x17      RAM A           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
[ 2]:        1           sRGB    Bypass        RAM B       RAM A           12-bit    17x17x17      RAM A           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
[ 3]:        1           sRGB    Bypass        RAM A       RAM B           12-bit    17x17x17      RAM A           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h

DPP Color Caps: input_lut_shared:0  icsc:1  dgam_ram:0  dgam_rom: srgb:1,bt2020:1,gamma2_2:1,pq:1,hlg:1  post_csc:1  gamcor:1  dgam_rom_for_yuv:0  3d_lut:1  blnd_lut:1  oscs:0

MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE  SHAPER mode  3DLUT_mode  3DLUT bit-depth  3DLUT size  OGAM mode  OGAM LUT  GAMUT mode  C11 C12   C33 C34
[ 0]:   0h   0h       2h     3           0        1             0     0       Bypass      Bypass           12-bit    17x17x17        RAM         A           0 00000000h 00000000h
[ 1]:   0h   1h       fh     2           2        0             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A           0 00000000h 00000000h
[ 2]:   0h   2h       3h     3           0        1             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A           0 00000000h 00000000h
[ 3]:   0h   3h       1h     3           2        0             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A           0 00000000h 00000000h

MPC Color Caps: gamut_remap:1, 3dlut:2, ogam_ram:1, ocsc:1

With this series (Steamdeck/KDE):
================================

DPP:  DGAM ROM  DGAM ROM type  DGAM LUT  SHAPER mode  3DLUT mode  3DLUT bit depth  3DLUT size  RGAM mode  GAMUT mode  C11 C12   C13 C14   C21 C22   C23 C24   C31 C32   C33 C34
[ 0]:        0           sRGB    Bypass       Bypass      Bypass           12-bit       9x9x9     Bypass           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
[ 3]:        0           sRGB    Bypass       Bypass      Bypass           12-bit       9x9x9     Bypass           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h

DPP Color Caps: input_lut_shared:0  icsc:1  dgam_ram:0  dgam_rom: srgb:1,bt2020:1,gamma2_2:1,pq:1,hlg:1  post_csc:1  gamcor:1  dgam_rom_for_yuv:0  3d_lut:1  blnd_lut:1  oscs:0

MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE  SHAPER mode  3DLUT_mode  3DLUT bit-depth  3DLUT size  OGAM mode  OGAM LUT  GAMUT mode  C11 C12   C33 C34
[ 0]:   0h   0h       3h     3           2        0             0     0       Bypass      Bypass           12-bit    17x17x17        RAM         A           1 00002000h 00002000h
[ 3]:   0h   3h       fh     2           2        0             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A           0 00000000h 00000000h

MPC Color Caps: gamut_remap:1, 3dlut:2, ogam_ram:1, ocsc:1

Before extending it to other DCN families, I have some doubts.
- Does this approach of the `.log_color_state` hook make sense for you?
- Is there any conflict between logging color state by HW version and
  DTN log usage?
- Is there a template/style for DTN log output that I should follow or
  information that I should include?

Let me know your thoughts.

Thanks,

Melissa

[0] https://lore.kernel.org/amd-gfx/20230905142545.451153-1-mwen@igalia.com/
[1] https://lore.kernel.org/amd-gfx/20230810160314.48225-1-mwen@igalia.com/
[2] https://github.com/ValveSoftware/gamescope

Melissa Wen (5):
  drm/amd/display: detach color state from hw state logging
  drm/amd/display: fill up DCN3 DPP color state
  drm/amd/display: create DCN3-specific log for MPC state
  drm/amd/display: hook DCN30 color state logging to DTN log
  drm/amd/display: add DPP and MPC color caps to DTN log

 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  53 +++++++--
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c  |  45 ++++++-
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    | 111 ++++++++++++++++++
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.h    |   3 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_init.c |   1 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c  |  55 ++++++++-
 .../drm/amd/display/dc/dcn301/dcn301_init.c   |   1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |   8 ++
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   |  13 ++
 .../gpu/drm/amd/display/dc/inc/hw_sequencer.h |   2 +
 10 files changed, 280 insertions(+), 12 deletions(-)

-- 
2.40.1

