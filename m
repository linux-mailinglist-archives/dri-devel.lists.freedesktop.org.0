Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E485C205683
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 17:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FEE36E9D0;
	Tue, 23 Jun 2020 15:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A1E6E471
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 15:59:15 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id z2so13706213qts.5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 08:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8K6FKZNHOH0n5sVOtZXVS+e4Ml/Ec2Jh6o3CLzMcv6E=;
 b=DTdAnbZnBLHm1X8WbMji/JI0+7WMyR65m7cLmLEfKUhzQdf+3j0KFzXeyfHlv6wUgE
 uEQnBUpeuwTIUeyMrD/jN1eUWIIIJCx4q+1gcmqgirQOBo8hO+o480YTygrzVicbxt90
 UOa4pUfCBHIGo9C8wwHwq0SNIC8vZHlEOTXAvdr1J9o9xgwmjC3R3Kd3kR05f/kkfanI
 PZvnC2KmtAxJWqAfLqWEHXMX0rfc3TgqiWOkbAygVTDlHFUxwpezOZDILRooIrdc/nIb
 qhLch4N1U2wu/XFdRIquLIZUrvYopMWcQ7v9zdINOLyl2Cb0Nc2tCtnDILnPv1QYDATG
 W3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8K6FKZNHOH0n5sVOtZXVS+e4Ml/Ec2Jh6o3CLzMcv6E=;
 b=J+eHwjlLXuOkaBf3VRQGUcWwvN5awmilC1042fUAdhmbYvBRrXSmXAI3nLj+3iDvHe
 MV6rSLqg8ZrVRKgGulIyivGKRci52ZG/OmuZqmNnr5lYMA5jD3BhFfos7Y5q8RM753t1
 yKcVL4UQ1RrBk4VMDzbyvtGI3wxSFltyWlEeVdvAYjb3p1cuwmJHXmcJzo45yIyWeYwO
 vxgzaRXz9UTRA7sqKbPYSTihc1chAC6K1nDTW7nyE2qBpeMIATIUj6cLgXo+qb3GMUnG
 gAnB1V3WX1KORGgzBFnLAHtK7cFmfTuk9m9FHZere1po73ODyQLV9tWcKsg0Gsn+SRex
 Rz9w==
X-Gm-Message-State: AOAM5327D5Q1RjUjPv7jhOfMsNbk7GjuMaJ9i4fjjIU6iszFrXol+UIv
 Y54Yrx70GPmQMF7GZZxwmrU+pEqxzt0=
X-Google-Smtp-Source: ABdhPJzCsOip5I+uFyPKSxj+WJ8aMXJcM+QBicZoubZP7oB9Yn4FjVs3OuftljNmtgi3ZGDi+y3SuA==
X-Received: by 2002:ac8:5691:: with SMTP id h17mr23044228qta.35.1592927954403; 
 Tue, 23 Jun 2020 08:59:14 -0700 (PDT)
Received: from localhost ([166.137.96.174])
 by smtp.gmail.com with ESMTPSA id o8sm842282qkh.100.2020.06.23.08.59.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Jun 2020 08:59:13 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 00/17] drm/i915: Add support for HDCP 1.4 over MST
Date: Tue, 23 Jun 2020 11:58:50 -0400
Message-Id: <20200623155907.22961-1-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
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

No functional changes, this set has the following changes since v6:
- rebased on drm-tip
- split "drm/i915: Clean up intel_hdcp_disable" out of "drm/i915: Don't
  fully disable HDCP on a port if multiple pipes are using it"
- remove hdcp2 dpmst stubs

Regarding "level of testing" questions, I've tested with multiple MST
hubs and displays. I don't have any compliance gear so all of this is
desk tested and works for me.

Sean

Sean Paul (17):
  drm/i915: Fix sha_text population code
  drm/i915: Clear the repeater bit on HDCP disable
  drm/i915: WARN if HDCP signalling is enabled upon disable
  drm/i915: Intercept Aksv writes in the aux hooks
  drm/i915: Use the cpu_transcoder in intel_hdcp to toggle HDCP
    signalling
  drm/i915: Factor out hdcp->value assignments
  drm/i915: Protect workers against disappearing connectors
  drm/i915: Clean up intel_hdcp_disable
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

 drivers/gpu/drm/drm_dp_mst_topology.c         | 142 ++++
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_ddi.c      |  29 +-
 drivers/gpu/drm/i915/display/intel_ddi.h      |   2 +
 .../drm/i915/display/intel_display_debugfs.c  |  21 +-
 .../drm/i915/display/intel_display_types.h    |  30 +-
 drivers/gpu/drm/i915/display/intel_dp.c       | 646 +---------------
 drivers/gpu/drm/i915/display/intel_dp.h       |   9 +
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 702 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  19 +
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 218 ++++--
 drivers/gpu/drm/i915/display/intel_hdcp.h     |   2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  25 +-
 .../drm/selftests/test-drm_dp_mst_helper.c    |  17 +
 include/drm/drm_dp_helper.h                   |   3 +
 include/drm/drm_dp_mst_helper.h               |  44 ++
 include/drm/drm_hdcp.h                        |   3 +
 17 files changed, 1191 insertions(+), 722 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_hdcp.c

-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
