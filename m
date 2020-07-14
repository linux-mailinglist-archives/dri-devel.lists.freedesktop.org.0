Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C5021F6B6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 18:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D04A6E584;
	Tue, 14 Jul 2020 16:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AA56E2B4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 16:08:20 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id j10so13172299qtq.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 09:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=V9Rb/r/RJHLHhAPnqfSs2i8TfDLZuZfi/muSKKceuW8=;
 b=JN6ECob3aQQ80IdMdPlS+O5WsuwHrrz7rUshZGQYYEfov/JJtEPo5I7TcHESJM/gIa
 gUjC5bXQWgAm7SMQTL6OTrHhqmZRo3onYNgDnsGOUxTwPuW7Z2wc7Zb6e4bqO4Sh1JQU
 N6NNkQ3ubrewSC6+a6xaQykREV6B9h+Os6Qty6Qt6Zvql0Qo4Fje4nqgKFYqLqMCV5ZP
 bnM5M0kYqTqSxt6M1Hjn47beqDj6+MrpfULP7rKYDD/ktDSe+2FLbjNWbwXY9/bhGhAw
 /8TCU2AoeeE96zqudzigBC47jQtU3oiYYvjLhXbnl7S6kxRwpR/rZc8dPlq10F8sg6/O
 rbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=V9Rb/r/RJHLHhAPnqfSs2i8TfDLZuZfi/muSKKceuW8=;
 b=cQG6fCMwrc5Z//FM1jW4uau2x0rat4cP22lAgMx93Bh/BO3YhEtiPRAsID78Cp6Bah
 cGY4ohRvQIA/kwns6ByxJZHO2HMEWYrAob2whH5C9Qxp4HdP8iLcBbVlmfhSnb2LsRXI
 2X6oc0eqza/3Ums/HmEpENfone0KwYiIPUNprXK5US4VSpthHFhScXd/UMb7MbiC/3Y+
 GFn9nkyct2umuXN9Kf3jcQQbxiUy2gDftmq2CmAE5b3+0sPY2qQYDw6BCMhmkg4qDMfx
 WAlmoGp7xtfS0JqW1nRO19HBCCm5EcbqKyEr/jqhjo0abloIeXoFCCoak42veLCr3Wz7
 Kybg==
X-Gm-Message-State: AOAM533yT/Isil90J6fLHRBDmd1MUd18btkV+F5RNJlxZg/GrWq3vo1+
 I+7qUjBR1/PZsdy8lCQETF2Rgp7otGU=
X-Google-Smtp-Source: ABdhPJxRxgYerbv33HgTncbZxgnF0p5OhORHkKU7DSQ5BXRdXdmJHr9cfHuW+xjxRqL2lfIXCx8+sg==
X-Received: by 2002:ac8:24c6:: with SMTP id t6mr5574177qtt.39.1594742899490;
 Tue, 14 Jul 2020 09:08:19 -0700 (PDT)
Received: from localhost (mobile-166-177-185-80.mycingular.net.
 [166.177.185.80])
 by smtp.gmail.com with ESMTPSA id o184sm24363903qkd.41.2020.07.14.09.08.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 Jul 2020 09:08:18 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Avoid modeset when content protection changes
Date: Tue, 14 Jul 2020 12:06:27 -0400
Message-Id: <20200714160627.1269-1-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Instead of doing a full modeset to enable/disable content protection,
simply go through the update_pipe flow which was introduced in the
related patch below. This avoids flashing the screen every time the user
starts viewing protected content.

Related: 634852d1f468 ("drm/i915: HDCP state handling in ddi_update_pipe")
Cc: Ramalingam C <ramalingam.c@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 89a4d294822d..839ce1715253 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -2191,7 +2191,7 @@ void intel_hdcp_atomic_check(struct drm_connector *connector,
 			return;
 	}
 
-	crtc_state->mode_changed = true;
+	to_intel_crtc_state(crtc_state)->update_pipe = true;
 }
 
 /* Handles the CP_IRQ raised from the DP HDCP sink */
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
