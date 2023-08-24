Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506E8787418
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 17:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFF510E58E;
	Thu, 24 Aug 2023 15:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71A810E58E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 15:26:42 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-41090d0f015so29127341cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 08:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692890802; x=1693495602;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X8cRNauecFkBmWFLs8yGoSG17xujvdH/hoaOICRSplk=;
 b=AghbwdOKKTUoIBPXVKBCUgHCOkE6TvuENu9D55v1miRvQaOBQZGXgUkgaCB5HtftbM
 F8q3gtr/3Yvz+/vOMEWP3GAArJduDZZ37TaW1cP0436JVInH7Xy5b22Gx2FMimgFdT3K
 rjNpkmXo2bj/qR82FO0BNJpnK8qTf3HalwMe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692890802; x=1693495602;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X8cRNauecFkBmWFLs8yGoSG17xujvdH/hoaOICRSplk=;
 b=KVeymBZaS90NDF13DeiIocTGRRr0fcB4jd6Nrl+fLcXbkiCxNPUfS5KL1D4Cqts7mm
 ME1HHFwMM6D9rQiqd0p1lI4MoPnu+CzHg4cW7yb/DWj1H1+BlYzrSp9RxQi/zoNVyXWC
 delS9ljQ7X2AWpr+0BLL+N+vX+L1YYEJRqgU9In0UEXMs/7ZaqwpHzkW3sQ8dqQwpAIa
 +H9vpImSKN86RFF+QFDUZ+iriWgffrlunoOrDIQZs8rfo1DE0gCrmkpGl2I5TbCi+NyP
 WGNbv+IQqaQvGtF0ZkJha+615H3/ZZTJht2sjZBszQFhdf+jykY/2Z5FiHcEp5c63+BX
 wrUA==
X-Gm-Message-State: AOJu0Yza0bwl4ET2aFJUJWZnrZA+ls++t7G0DS1eAQPf6v1LcPvXCUrP
 8V/29GdOD9pYREijbyjp5glXEg==
X-Google-Smtp-Source: AGHT+IH7kf9pS/bwruTAjMTB/iVkqty78ijLWTeqrsqWaWXXkmhrE727je5JgvXIHrt5UOHPNlAx1g==
X-Received: by 2002:a05:622a:4d0:b0:410:bfe:a462 with SMTP id
 q16-20020a05622a04d000b004100bfea462mr17371508qtx.27.1692890801948; 
 Thu, 24 Aug 2023 08:26:41 -0700 (PDT)
Received: from gildekel.nyc.corp.google.com
 ([2620:0:1003:314:321d:e6f5:6dbd:3e5])
 by smtp.gmail.com with ESMTPSA id
 v10-20020ac83d8a000000b0041079ba4f6bsm4423014qtf.12.2023.08.24.08.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 08:26:41 -0700 (PDT)
From: Gil Dekel <gildekel@chromium.org>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/6] drm/i915/dp_link_training: Define a final failure
 state when link training fails
Date: Thu, 24 Aug 2023 11:25:16 -0400
Message-ID: <20230824152631.401621-1-gildekel@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
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
Cc: seanpaul@chromium.org, Gil Dekel <gildekel@chromium.org>,
 navaremanasi@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Next version of https://patchwork.freedesktop.org/series/122643/

v3:
  Still learning the ropes of upstream workflow. Apologies for mucking up v2.
  This is just a re-upload.

v2:
  Reorganize into:
  1) Add for final failure state for SST and MST link training fallback.
  2) Add a DRM helper for setting downstream MST ports' link-status state.
  3) Make handling SST and MST connectors simpler via intel_dp.
  4) Update link-status for downstream MST ports.
  5) Emit a uevent with the "link-status" trigger property.

v1:
Currently, when link training fails after all fallback values have been
exhausted, the i915 driver seizes to send uevents to userspace. This leave
userspace thinking that the last passing atomic commit was successful, and that
all connectors (displays) are connected and operational, when in fact, the last
link failed to train and the displays remain dark. This manifests as "zombie"
displays in userspace, in which users observe the displays appear in their
display settings page, but they are dark and unresponsive.

Since, at the time of writing, MST link training fallback is not implemented,
failing MST link training is a significantly more common case then a complete
SST link training failure. And with users using MST hubs than ever to connect
multiple displays via their USB-C ports we observe this case often.

This patchset series suggest a solution, in which a final failure state is
defined. In this final state, the connector's bit rate capabilities, namely
max_link_rate and max_link_lane_count, are set to 0. This effectively set the
connector's bandwidth to 0Gbps, thus causing all its modes to be pruned in the
following connector probing.

Next, with this state defined, we emit a link-status=Bad uevent. The next time
userspace probes the connector, it should recognize that the connector has no
modes and ignore it since it is in a bad state.

I am aware that always sending a uevent and never stopping may result in some
userspaces having their expectations broken and enter an infinite loop of
modesets and link-training attempts. However, per DRM link-status spec:
```
 * link-status:
 *      Connector link-status property to indicate the status of link. The
 *      default value of link-status is "GOOD". If something fails during or
 *      after modeset, the kernel driver may set this to "BAD" and issue a
 *      hotplug uevent. Drivers should update this value using
 *      drm_connector_set_link_status_property().
 *
 *      When user-space receives the hotplug uevent and detects a "BAD"
 *      link-status, the sink doesn't receive pixels anymore (e.g. the screen
 *      becomes completely black). The list of available modes may have
 *      changed. User-space is expected to pick a new mode if the current one
 *      has disappeared and perform a new modeset with link-status set to
 *      "GOOD" to re-enable the connector.
```
(form drivers/gpu/drm/drm_connector.c - DOC: standard connector properties)

it seems reasonable to assume that the suggested state is an extension of the
spec's guidelines, in which the next new mode userspace picks for a connector
with no modes is - none, thus breaking the cycle of failed link-training
attempts.

I suspect that, maybe, zeroing out the bit rate capabilities is not the right
way to go, and perhaps marking the connector as disconnected instead may be a
better solution. However, if marking a connector disconnected is the way to go,
We will have to iterate over all MST ports in the MST case and mark the spawned
connectors as disconnected as well.

As a final note I should add that this approach was tested with ChromeOS as
userspace, and we observed that the zombie displays stop showing up once the
connectors are pruned of all their modes and are ignored by userspace.

For your consideration and guidance.
Thanks,

Gil Dekel (6):
  drm/i915/dp_link_training: Add a final failing state to link training
    fallback
  drm/i915/dp_link_training: Add a final failing state to link training
    fallback for MST
  drm/dp_mst: Add drm_dp_set_mst_topology_link_status()
  drm/i915: Move DP modeset_retry_work into intel_dp
  drm/i915/dp_link_training: Set all downstream MST ports to BAD before
    retrying
  drm/i915/dp_link_training: Emit a link-status=Bad uevent with trigger
    property

 drivers/gpu/drm/display/drm_dp_mst_topology.c | 38 ++++++++++
 drivers/gpu/drm/i915/display/intel_display.c  | 14 +++-
 .../drm/i915/display/intel_display_types.h    |  6 +-
 drivers/gpu/drm/i915/display/intel_dp.c       | 75 ++++++++++++-------
 drivers/gpu/drm/i915/display/intel_dp.h       |  4 +-
 .../drm/i915/display/intel_dp_link_training.c | 11 ++-
 include/drm/display/drm_dp_mst_helper.h       |  3 +
 7 files changed, 110 insertions(+), 41 deletions(-)

--
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
