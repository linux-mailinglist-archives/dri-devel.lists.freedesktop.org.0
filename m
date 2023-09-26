Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D04347AED33
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 14:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC1210E3C7;
	Tue, 26 Sep 2023 12:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F55210E3C7;
 Tue, 26 Sep 2023 12:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aC32IXn1jGwDARVO6Xy5vEOeKBQLTWiC5a2CHee2PCs=; b=CgcZqcCRw507vlY7ELYv9zzjXZ
 r877Ddv5MOVm0JCcuU8ZlIH3esQjzU5t82Qp8YjpIKcj7kGl5cqJTyfaOllJbTIGv0WQAXefrTTaA
 rQH2gA+g5PRShk6LuBpGmRLbczKdMR9VqRgtNwMz4ygqMQqyWoSxmvypJFaAvjg8LATvqPYcRsNi7
 CAQe3rhfPjmhI6rk6wnpCplRTkHBrUlBG0MaI8hgj9fGMdA6B5IQXSpHw8QKpHT4DIMjnzj7cFSxt
 MPa/pW+vJFiEAlcVujK9UtaYmn/2AmEGa/fHYrBfJw/FT1YEXylZBiHy15rcnOZNKfW8SMO6nuML1
 lh55EYkA==;
Received: from [102.213.205.115] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ql7Ul-008W1J-NL; Tue, 26 Sep 2023 14:48:55 +0200
Date: Tue, 26 Sep 2023 11:48:47 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v2 0/5] drm/amd/display: improve DTN color state log
Message-ID: <20230926124847.bp7vaow52g6zqwkq@mail.igalia.com>
References: <20230913164329.123687-1-mwen@igalia.com>
 <1bc1f834-22c4-4199-a063-f53cc345161f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bc1f834-22c4-4199-a063-f53cc345161f@amd.com>
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
Cc: Krunoslav Kovac <krunoslav.kovac@amd.com>, kernel-dev@igalia.com,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/25, Harry Wentland wrote:
> 
> 
> On 2023-09-13 12:43, Melissa Wen wrote:
> > Hi,
> > 
> > This is an update of previous RFC [0] improving the data collection of
> > Gamma Correction and Blend Gamma color blocks.
> > 
> > As I mentioned in the last version, I'm updating the color state part of
> > DTN log to match DCN3.0 HW better. Currently, the DTN log considers the
> > DCN10 color pipeline, which is useless for DCN3.0 because of all the
> > differences in color caps between DCN versions. In addition to new color
> > blocks and caps, some semantic differences made the DCN10 output not fit
> > DCN30.
> > 
> > In this RFC, the first patch adds new color state elements to DPP and
> > implements the reading of registers according to HW blocks. Similarly to
> > MPC, the second patch also creates a DCN3-specific function to read the
> > MPC state and add the MPC color state logging to it. With DPP and MPC
> > color-register reading, I detach DCN10 color state logging from the HW
> > log and create a `.log_color_state` hook for logging color state
> > according to HW color blocks with DCN30 as the first use case. Finally,
> > the last patch adds DPP and MPC color caps output to facilitate
> > understanding of the color state log.
> > 
> > This version works well with the driver-specific color properties[1] and
> > steamdeck/gamescope[2] together, where we can see color state changing
> > from default values.
> > 
> > Here is a before vs. after example:
> > 
> > Without this series:
> > ===================
> > DPP:    IGAM format  IGAM mode    DGAM mode    RGAM mode  GAMUT mode  C11 C12   C13 C14   C21 C22   C23 C24   C31 C32   C33 C34
> > [ 0]:            0h  BypassFixed  Bypass       Bypass            0    00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> > [ 3]:            0h  BypassFixed  Bypass       Bypass            0    00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> > 
> > MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE
> > [ 0]:   0h   0h       3h     3           2        0             0     0
> > [ 3]:   0h   3h       fh     2           2        0             0     0
> > 
> > With this series (Steamdeck/Gamescope):
> > ======================================
> > 
> > DPP:  DGAM ROM  DGAM ROM type  DGAM LUT  SHAPER mode  3DLUT mode  3DLUT bit depth  3DLUT size  RGAM mode  GAMUT mode  C11 C12   C13 C14   C21 C22   C23 C24   C31 C32   C33 C34
> > [ 0]:        1           sRGB    Bypass        RAM A       RAM B           12-bit    17x17x17      RAM A           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> > [ 1]:        1           sRGB    Bypass        RAM B       RAM A           12-bit    17x17x17      RAM A           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> > [ 2]:        1           sRGB    Bypass        RAM B       RAM A           12-bit    17x17x17      RAM A           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> > [ 3]:        1           sRGB    Bypass        RAM A       RAM B           12-bit    17x17x17      RAM A           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> > 
> > DPP Color Caps: input_lut_shared:0  icsc:1  dgam_ram:0  dgam_rom: srgb:1,bt2020:1,gamma2_2:1,pq:1,hlg:1  post_csc:1  gamcor:1  dgam_rom_for_yuv:0  3d_lut:1  blnd_lut:1  oscs:0
> > 
> > MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE  SHAPER mode  3DLUT_mode  3DLUT bit-depth  3DLUT size  OGAM mode  OGAM LUT  GAMUT mode  C11 C12   C33 C34
> > [ 0]:   0h   0h       2h     3           0        1             0     0       Bypass      Bypass           12-bit    17x17x17        RAM         A           0 00000000h 00000000h
> > [ 1]:   0h   1h       fh     2           2        0             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A           0 00000000h 00000000h
> > [ 2]:   0h   2h       3h     3           0        1             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A           0 00000000h 00000000h
> > [ 3]:   0h   3h       1h     3           2        0             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A           0 00000000h 00000000h
> > 
> > MPC Color Caps: gamut_remap:1, 3dlut:2, ogam_ram:1, ocsc:1
> > 
> > With this series (Steamdeck/KDE):
> > ================================
> > 
> > DPP:  DGAM ROM  DGAM ROM type  DGAM LUT  SHAPER mode  3DLUT mode  3DLUT bit depth  3DLUT size  RGAM mode  GAMUT mode  C11 C12   C13 C14   C21 C22   C23 C24   C31 C32   C33 C34
> > [ 0]:        0           sRGB    Bypass       Bypass      Bypass           12-bit       9x9x9     Bypass           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> > [ 3]:        0           sRGB    Bypass       Bypass      Bypass           12-bit       9x9x9     Bypass           0  00000000h 00000000h 00000000h 00000000h 00000000h 00000000h
> > 
> > DPP Color Caps: input_lut_shared:0  icsc:1  dgam_ram:0  dgam_rom: srgb:1,bt2020:1,gamma2_2:1,pq:1,hlg:1  post_csc:1  gamcor:1  dgam_rom_for_yuv:0  3d_lut:1  blnd_lut:1  oscs:0
> > 
> > MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE  SHAPER mode  3DLUT_mode  3DLUT bit-depth  3DLUT size  OGAM mode  OGAM LUT  GAMUT mode  C11 C12   C33 C34
> > [ 0]:   0h   0h       3h     3           2        0             0     0       Bypass      Bypass           12-bit    17x17x17        RAM         A           1 00002000h 00002000h
> > [ 3]:   0h   3h       fh     2           2        0             0     0       Bypass      Bypass           12-bit    17x17x17     Bypass         A           0 00000000h 00000000h
> > 
> > MPC Color Caps: gamut_remap:1, 3dlut:2, ogam_ram:1, ocsc:1
> > 
> > Before extending it to other DCN families, I have some doubts.
> > - Does this approach of the `.log_color_state` hook make sense for you?
> 
> Yes
> 
> > - Is there any conflict between logging color state by HW version and
> >   DTN log usage?
> > - Is there a template/style for DTN log output that I should follow or
> >   information that I should include?
> > 
> 
> At this point it looks like we only use the DTN log for debug purposes,
> so no conflict and no need to follow a specific format, as long as the
> output is human-parseable (which yours is).
> 
> At one point in the past these were used by automated tests on other
> platforms but that's no longer the case.

Great! I'll prepare a next version from your suggestions and also
addressing Siqueira's review.

Thanks for the guidance.

Melissa

> 
> Harry
> 
> > Let me know your thoughts.
> > 
> > Thanks,
> > 
> > Melissa
> > 
> > [0] https://lore.kernel.org/amd-gfx/20230905142545.451153-1-mwen@igalia.com/
> > [1] https://lore.kernel.org/amd-gfx/20230810160314.48225-1-mwen@igalia.com/
> > [2] https://github.com/ValveSoftware/gamescope
> > 
> > Melissa Wen (5):
> >   drm/amd/display: detach color state from hw state logging
> >   drm/amd/display: fill up DCN3 DPP color state
> >   drm/amd/display: create DCN3-specific log for MPC state
> >   drm/amd/display: hook DCN30 color state logging to DTN log
> >   drm/amd/display: add DPP and MPC color caps to DTN log
> > 
> >  .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  53 +++++++--
> >  .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c  |  45 ++++++-
> >  .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    | 111 ++++++++++++++++++
> >  .../drm/amd/display/dc/dcn30/dcn30_hwseq.h    |   3 +
> >  .../gpu/drm/amd/display/dc/dcn30/dcn30_init.c |   1 +
> >  .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c  |  55 ++++++++-
> >  .../drm/amd/display/dc/dcn301/dcn301_init.c   |   1 +
> >  drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |   8 ++
> >  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   |  13 ++
> >  .../gpu/drm/amd/display/dc/inc/hw_sequencer.h |   2 +
> >  10 files changed, 280 insertions(+), 12 deletions(-)
> > 
> 
