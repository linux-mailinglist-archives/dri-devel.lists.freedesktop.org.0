Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F241635A7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 23:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA3C6EA93;
	Tue, 18 Feb 2020 22:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B966E417
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 22:03:29 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id l75so11328242ybf.6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 14:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8KjW5PETGWfH5/4eC+9e+aq7YU699R0bBfcOU3DPbDs=;
 b=OEDE0vYWvYbhAQQpJDudn1YoJ9pHBYvb4BiclpyqMyL8eNWvPZqRnP8aQokmisN1kv
 iMUObXjTMMiU3g0iXmazgV1lLm1GMxuBMjAlqevxUCYZ+9xL4LfEEMf0VdO2eB4cZICi
 i0EKaKYJhoA883HBhrT/QoIb/N0S3eTn/RF4aA5aWEWUNMxpkl4cuwGsowQuiV4EFjLa
 BRB2yE2rqJiLYgrGSRYcdWk1soEHg4+XU4dpDFhHx1TW49j8443+IJr3vbYEQ7YXOCVe
 f1BypdcDS0PJ2L7M60I0ibkrqBapAUsZ81oW7xVh+VBH4VoFFv9NAuqbhsMHrtpdNlLl
 z8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8KjW5PETGWfH5/4eC+9e+aq7YU699R0bBfcOU3DPbDs=;
 b=fw9HMwmHOOKqqkKFKnVWsVQwPSMI9d7EECmUsbVyNN2mh8LHCH3ymabAjY2l3mVJpe
 xljtz9SJRhDXDtOro+SUpl+3jfE9d4J79hEO7pJmCFbR1inEDFhD0h1kv8PjQTd+rnGb
 9UEhJUrY0fGLJkJDBQeRHqGWUWpdRcZ8lYvRbc0ZC8qjYwFegd3//1+8DkEMSJfTFM26
 bs+lT0QKFSJR4rz2FhpzdfvHC9rySUimpJdMkmPuKfLGPUHitMMddtMgiFelLYp9nwY0
 cjv9IufjdQbh6hkWGwd7pIe4ByCQAqmE9NhVpp0REeau/UnxdM88CfyE9aBMXrbilEp6
 ZamA==
X-Gm-Message-State: APjAAAVo5dc9O2qua79r0pMKfmDyDkBu2kHnu7SpoSPPDoQ8OufzmfsI
 bxr0kBsfRRcWBsBtEJ35swugibn9K0s=
X-Google-Smtp-Source: APXvYqxlBx4UQl03Klj6j0Fy/6geryPzFdK6KGap02rG+Kp/NMEp1srsxXvyzn0jRqBEpWsXEZUXEA==
X-Received: by 2002:a25:b981:: with SMTP id r1mr21093836ybg.320.1582063408175; 
 Tue, 18 Feb 2020 14:03:28 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id l74sm23041ywc.45.2020.02.18.14.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 14:03:27 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 00/14] drm/i915: Add support for HDCP 1.4 over MST
 connectors
Date: Tue, 18 Feb 2020 17:02:28 -0500
Message-Id: <20200218220242.107265-1-sean@poorly.run>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
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

Hey all,
Back with a v4. Rebased on latest drm-tip.

Biggest change was adding the QUERY_STREAM_ENCRYPTION_STATUS check which
ensures not only the link to the first branch is encrypted, but also
that the channel iteself is also protected.

Sean


Sean Paul (14):
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
  drm/i915: Add connector to hdcp_shim->check_link()
  drm/mst: Add support for QUERY_STREAM_ENCRYPTION_STATUS MST sideband
    message
  drm/i915: Add HDCP 1.4 support for MST connectors

 drivers/gpu/drm/drm_dp_mst_topology.c         | 117 +++
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_ddi.c      |  26 +-
 drivers/gpu/drm/i915/display/intel_ddi.h      |   2 +
 .../drm/i915/display/intel_display_types.h    |  30 +-
 drivers/gpu/drm/i915/display/intel_dp.c       | 620 +--------------
 drivers/gpu/drm/i915/display/intel_dp.h       |   7 +
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 705 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  15 +
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 199 +++--
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  23 +-
 include/drm/drm_dp_helper.h                   |   3 +
 include/drm/drm_dp_mst_helper.h               |  44 ++
 include/drm/drm_hdcp.h                        |   3 +
 14 files changed, 1127 insertions(+), 668 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_hdcp.c

-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
