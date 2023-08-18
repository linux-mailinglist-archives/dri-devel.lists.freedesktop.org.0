Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE25781126
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 19:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415D810E0AC;
	Fri, 18 Aug 2023 17:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24B210E0AC
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 17:02:44 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-76c8dd2ce79so76690985a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 10:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692378164; x=1692982964;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=opgpBgYvUD8B1ypcLxMu9vIqh1eVJGol/Ebk1QqrvAU=;
 b=oYn8f9YCVsvCIEnWVcdqjPll0w6LY/GSEzFBMvlyVj19+T6SNe6F+AD3uXjhOqDUpE
 cSVI7PGI0hnFU+EXfNTaCUviqBW9snzKUPpqpecHtQjFKS0qDdK7PHlBee/3ZnrYckrt
 /QezGMJKyRnfuM27q1qDd1aivQwbbEIsdbwI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692378164; x=1692982964;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=opgpBgYvUD8B1ypcLxMu9vIqh1eVJGol/Ebk1QqrvAU=;
 b=ldtabT3riqfVM3tWvQZPEIrDxdDGEAjpBwgAMcwDz/14w6VIqDYhwSc6QKrcGrfeoD
 uKujWalFiuz4U+XVtV8mdf1/EhfBsC90VzPVRrbmFHF2YLavqT2RyLngIB5RWO1ZI4vr
 ZEbRjbsdios+uRkikEbqroDQaPczz+JLBcaq4xnM8MNzk3famGOOTH16wcmHySEdEt8+
 fQ34H4Xxo7Wee8cS1Bcn/FvC0xXF+pHjJFKyFpnJ0SfDNAi/CVWOOuh5Rx/NnkRA9r7n
 RZKfvt14Pvctlm2kUP5pbhe0VvmTAI7iWn3b8eO4R++NP3+0vcSf/1rxMnWnmCMzUJ1s
 zOqQ==
X-Gm-Message-State: AOJu0YxRTYTRiD4Pis5UAYSk+cFIl7EBU4m2DLZHl+vAQ1sIkJZwAjF2
 hd/uQ8SXkh2dQU90sfUNZBdw5w==
X-Google-Smtp-Source: AGHT+IGc2rVZoz562LFGuxeYFKUQzTOZ/qG5GjIDZCO87u7cytHjPd4/bK58Wkgw/SBI8gEKDKiF1g==
X-Received: by 2002:a05:620a:1999:b0:76c:d5e0:f93c with SMTP id
 bm25-20020a05620a199900b0076cd5e0f93cmr4210035qkb.56.1692378163802; 
 Fri, 18 Aug 2023 10:02:43 -0700 (PDT)
Received: from gildekel.nyc.corp.google.com
 ([2620:0:1003:314:281:cb2f:c9c3:f2f8])
 by smtp.gmail.com with ESMTPSA id
 cx12-20020a05620a51cc00b00767cfb1e859sm649278qkb.47.2023.08.18.10.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 10:02:43 -0700 (PDT)
From: Gil Dekel <gildekel@chromium.org>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] Define a final failure state when link training fails
Date: Fri, 18 Aug 2023 12:59:17 -0400
Message-ID: <20230818170156.2194015-1-gildekel@chromium.org>
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
Cc: Sean Paul <seanpaul@chromium.org>, Gil Dekel <gildekel@chromium.org>,
 Manasi Navare <navaremanasi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

Gil Dekel (3):
  drm/i915/dp_link_training: Add a final failing state to link training
    fallback
  drm/i915/dp_link_training: Add a final failing state to link training
    fallback for MST
  drm/i915/dp_link_training: Emit a link-status=Bad uevent with trigger
    property

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Manasi Navare <navaremanasi@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Gil Dekel <gildekel@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_dp.c       | 50 +++++++++++++------
 drivers/gpu/drm/i915/display/intel_dp.h       |  4 +-
 .../drm/i915/display/intel_dp_link_training.c |  8 +--
 3 files changed, 41 insertions(+), 21 deletions(-)

--
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
