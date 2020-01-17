Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAD21411B0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 20:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9AC6F8D5;
	Fri, 17 Jan 2020 19:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB986F8D3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 19:31:06 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id i126so14838665ywe.7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 11:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kJmv9QEn/Ba0CeGMsutg8elT7GBn7HEVuIj01puRU4E=;
 b=K2nGsQ8iVjyLaGJTqmT8F2sJ/E37U7ny3toeUjN+NAAQd1XTV5QqsnrjC/kFxglgLz
 w104INbbKkwdboTOfgnRAvKxdydXTLYz6dfvcf2sYXC9IresV4ObCTdDEtniSWhFOJmO
 NsFc9UShM+qu2ntSlWcIOfRFqchM4nxKkQA6BKuUHMDVxmcwBun5icq8q6dgju0LU72O
 eHMDqWvCzIJrrijuK1kAPDWrJ7BOyQDRXXvobTkJrIq1GYZ05Ce2NOul/4p8BG7DE2/y
 wW3RQcf1/SwYJSuP3HubJc3y4h9wRpyHIFgjvlPeWUsOx4ROx63Ixm8xLPZitWTr3x1f
 If8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kJmv9QEn/Ba0CeGMsutg8elT7GBn7HEVuIj01puRU4E=;
 b=Qs2dOa7KZKCgbGgWb5IExEIqitczY3Gu4CmlmexWQjpm6cxXgEL2i1i4lgXwihShGx
 h+keg0F3uE6O1Yn5hyhwKIA8P3XxiGU3VuCkuyZy03aoXUZoDno0ijEA8cXibPwYT1br
 JNHMTpoTgU8YQVcqqQRoIcdHyZu7iUifm3RGPAismgtqv40HVhnORr6G/LiOmmhCIEEH
 UI8cahxxzb/PzAH0OtwkkP5t3Q+bJVWjtLgm039zpDuc9OSZZ3SAgBtMXF+nlBIRIx56
 FFgRUIg7kk6AkU8GWLLKBFLNwOxFZMyuap/eUNELPRe2rB594clnX4vLBPL67dambtQT
 LWWQ==
X-Gm-Message-State: APjAAAVxtX2aszgwh2TZsWQ5FxyHIMffCmAnXcJZurmBFAObdTYpqCaL
 8OjjI2dNYj1nyc813C6+fdXX8fnBaRKE/g==
X-Google-Smtp-Source: APXvYqxr6bizWZrpW7rhzbCUaElAYeiTybqyCUBEpZfIN3udvRrWrZBpK7DTB2AZsJNeR5I+TBHkDw==
X-Received: by 2002:a81:31d1:: with SMTP id
 x200mr32712338ywx.506.1579289465397; 
 Fri, 17 Jan 2020 11:31:05 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id k5sm11863306ywa.80.2020.01.17.11.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 11:31:04 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 00/12] drm/i915: Add support for HDCP 1.4 over MST
 connectors
Date: Fri, 17 Jan 2020 14:30:51 -0500
Message-Id: <20200117193103.156821-1-sean@poorly.run>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
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
Cc: daniel.vetter@ffwll.ch, rodrigo.vivi@intel.com,
 Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Hey all,
Here's v3, which addresses all review comments in v2.

Sean

Sean Paul (12):
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
  drm/i915: Add HDCP 1.4 support for MST connectors

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_ddi.c      |  27 +-
 drivers/gpu/drm/i915/display/intel_ddi.h      |   2 +
 .../drm/i915/display/intel_display_types.h    |  27 +-
 drivers/gpu/drm/i915/display/intel_dp.c       | 619 +---------------
 drivers/gpu/drm/i915/display/intel_dp.h       |   7 +
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 680 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  15 +
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 195 +++--
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  18 +-
 include/drm/drm_hdcp.h                        |   3 +
 11 files changed, 932 insertions(+), 662 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_hdcp.c

-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
