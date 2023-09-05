Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74393792375
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 16:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52ED610E530;
	Tue,  5 Sep 2023 14:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6159C10E530;
 Tue,  5 Sep 2023 14:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zq8JznjiOzoYYKCDGnDjej+rOFjaz+ZxNzy0QtsBf3c=; b=Ax+ehYuFzYTPz6bhM8e66TAae7
 oftLbOmLJ0h4YtnlXeMEUgWEiJI5nd8evDi3EGrTQ5fjTdJIoD0F+XW137tjj47tkhyD44njg5RVc
 2PJTtHKJsb3xSuUrUO2G3VasCCRczdEPeBe50c2OYM7nvJsJYqf/EkWwWXkUiZpGvyTONk82nsGYc
 5tZbZtdUtThFW4LI6Gm/0ApDRwHAuvu210LmBxcIzveU9bI/6u7NeC+E4vEbWW/4RlXrqcU/L1H4L
 NOOPSQf64oPC7lA9vaccWUlelcGMtK5DwYaw3fSte3myUg5qTCOfWktxqxixG7nKKkSsKG7ZdkFTg
 7Zv/lOLA==;
Received: from [38.44.68.151] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qdWzz-002cXU-I0; Tue, 05 Sep 2023 16:25:47 +0200
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 daniel@ffwll.ch, Xinhui.Pan@amd.com
Subject: [RFC PATCH 0/5] drm/amd/display: improve DTN color state log
Date: Tue,  5 Sep 2023 13:25:40 -0100
Message-Id: <20230905142545.451153-1-mwen@igalia.com>
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
 Shashank Sharma <Shashank.Sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I'm updating the color state part of DTN log to match DCN3.0 HW better.
Currently, the DTN log considers the DCN10 color pipeline, which is
useless for DCN3.0 because of all the differences in color caps between
DCN versions. In addition to new color blocks and caps, some semantic
differences made the DCN10 output not fit DCN30.

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

Before extending it to other DCN families, I have some doubts. Does this
approach of the `.log_color_state` hook make sense for you? Is there any
conflict between logging color state by HW version and DTN log usage? Is
there a template/style for DTN log output that I should follow?

Let me know your thoughts.

Thanks,

Melissa

[1] https://lore.kernel.org/amd-gfx/20230810160314.48225-1-mwen@igalia.com/
[2] https://github.com/ValveSoftware/gamescope

Melissa Wen (5):
  drm/amd/display: detach color state from hw state logging
  drm/amd/display: fill up DCN3 DPP color state
  drm/amd/display: create DCN3-specific log for MPC state
  drm/amd/display: hook DCN30 color state logging to DTN log
  drm/amd/display: add DPP and MPC color caps to DTN log

 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  53 +++++++--
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c  |  28 ++++-
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    | 112 ++++++++++++++++++
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.h    |   3 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_init.c |   1 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c  |  55 ++++++++-
 .../drm/amd/display/dc/dcn301/dcn301_init.c   |   1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |   8 ++
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   |  13 ++
 .../gpu/drm/amd/display/dc/inc/hw_sequencer.h |   2 +
 10 files changed, 264 insertions(+), 12 deletions(-)

-- 
2.40.1

