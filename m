Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FE517AF71
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 21:12:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C90F6E3B5;
	Thu,  5 Mar 2020 20:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57616EC10
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 20:12:38 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id t141so6866267ywc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 12:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=025F5Jg8XJWMLMPfg87QWrcAbANyAAFGlCNMZvV5KIs=;
 b=VpuBnESR18gEz5r455+890hHDC6TSAmQdmaYRH7kp/Im4iTTj4to2Wa8In0WehZ8NH
 wOwVsoMaBLeqzMnInatGLjX4t0JkqHbIpKJ8+9uazvfGtWqAo4tW6trE74ST6Lsrd4Za
 p4helQneBInShvvzb+x0GuncYO9XbuTX3y7pCo89K42U8EJdq5ZpLr/w33jy94y1XfwY
 ywH5Zk3OZlVgX91ycz6b6Q8tGAslVdL2T2jxrr5lJI+Vk9MiHdKwBOciWclujZWB3GoN
 8ZbtcFabxwIcoQOxoDvY6I0ovIW68xyDMAJCqxIBpzV/CHXJRc1ZrZwhY8KPryVeX6Ma
 ogsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=025F5Jg8XJWMLMPfg87QWrcAbANyAAFGlCNMZvV5KIs=;
 b=OSgRSGliPok8os7BlabzSGeN/ICRZIm04IgqTA7o0+87dnNjJO6Vqu3JWvJnbsw9W1
 WRO0GECr2k7Us0iL9Mh1qTQk+kJw4eJ52NkjIGxkGZSiWW1Nm+rzAeMfU1VfJ/MpFtr/
 B/wFURVU0su1c+3ZUCLEsMDBbPSsTiAgEhIviY4QVTzATdZJW/64DkncxZ6RgOUxQ1IQ
 an2dIjnZkBzEnzYivVx704uWOLdWZpiqaiYbzZMfK2XFyHKa9OLtmCJ5GF83uqmm8pjv
 RsNXwf5B0WF0V0gL2Ggj1IzfleBWvidf2lkDzmX3hWZu0f2qJEVWB+EOwXE9Wdq4c9YO
 tuiQ==
X-Gm-Message-State: ANhLgQ2hD9FqPaFiEgoPY6QD3qSmjFEWtF42ltqrdSglPpHejhpHpVJi
 X76uXkZyydCbLw3Ax1doFYMJLISGcy0=
X-Google-Smtp-Source: ADFU+vtkIOMDlDDSLtKJj44tgiUTmtlaXm71rBrcoJu1RWjY3nvN76SxJaQxDesb5D93RqOH2Sh+8w==
X-Received: by 2002:a25:8503:: with SMTP id w3mr9719744ybk.226.1583439157698; 
 Thu, 05 Mar 2020 12:12:37 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id l11sm5986607ywi.3.2020.03.05.12.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 12:12:37 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 00/16] drm/i915: Add support for HDCP 1.4 over MST
 connectors
Date: Thu,  5 Mar 2020 15:12:20 -0500
Message-Id: <20200305201236.152307-1-sean@poorly.run>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
MIME-Version: 1.0
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
Cc: daniel.vetter@ffwll.ch, Sean Paul <seanpaul@chromium.org>,
 juston.li@intel.com, rodrigo.vivi@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Hello friends,
Another version of HDCP over MST rebased on -tip (pls stop refactoring
stuff!).

I've also added a couple of fixes to fix bugs found when I did some testing
I on a non-CrOS laptop.

PTAL,

Sean


Sean Paul (16):
  drm/i915: Fix sha_text population code
  drm/i915: Clear the repeater bit on HDCP disable
  drm/i915: WARN if HDCP signalling is enabled upon disable
  drm/i915: Intercept Aksv writes in the aux hooks
  drm/i915: Use the cpu_transcoder in intel_hdcp to toggle HDCP
    signalling
  drm/i915: Factor out hdcp->value assignments
  drm/i915: Protect workers against disappearing connectors
  drm/i915: Don't fully disable HDCP on a port if multiple pipes are
    using it
  drm/i915: Support DP MST in enc_to_dig_port() function
  drm/i915: Use ddi_update_pipe in intel_dp_mst
  drm/i915: Factor out HDCP shim functions from dp for use by dp_mst
  drm/i915: Plumb port through hdcp init
  drm/i915: Add connector to hdcp_shim->check_link()
  drm/mst: Add support for QUERY_STREAM_ENCRYPTION_STATUS MST sideband
    message
  drm/i915: Print HDCP version info for all connectors
  drm/i915: Add HDCP 1.4 support for MST connectors

 drivers/gpu/drm/drm_dp_mst_topology.c         | 117 +++
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_ddi.c      |  27 +-
 drivers/gpu/drm/i915/display/intel_ddi.h      |   2 +
 .../drm/i915/display/intel_display_debugfs.c  |  21 +-
 .../drm/i915/display/intel_display_types.h    |  30 +-
 drivers/gpu/drm/i915/display/intel_dp.c       | 624 +--------------
 drivers/gpu/drm/i915/display/intel_dp.h       |   7 +
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 712 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  15 +
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 217 ++++--
 drivers/gpu/drm/i915/display/intel_hdcp.h     |   2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  25 +-
 include/drm/drm_dp_helper.h                   |   3 +
 include/drm/drm_dp_mst_helper.h               |  44 ++
 include/drm/drm_hdcp.h                        |   3 +
 16 files changed, 1155 insertions(+), 695 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_hdcp.c

-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
