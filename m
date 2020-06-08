Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E861F2128
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 23:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D8A89E36;
	Mon,  8 Jun 2020 21:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E67E89E11
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 21:05:12 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id g62so12402170qtd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 14:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TxlCD6uasdaCvAhuieiJPqkH6Uyaku7mnPBENClhnDI=;
 b=dZ1nxkG+iA93CB5rnIM0nV9hPWt8niNp/v0AfEu49pcjmBI1Yg0kjyDdJWAlayNkbo
 6J0nvFn10brp+f2I/bzXxmTgljqr2g4VnPujC1dc/bNFlXysVZ/KYNRSckDJhEKZfcOX
 1HoIfCOMSI6u4UVhuDFWQkhwHpoJ+mUhplT0h6p0c02CLaCwZXjlM3yqx5astGfCo8LK
 OUyf1Gaa6pXYGXXOfpU3n6oF1gyPh/SkfYpJbaV0CrzBSXhkK7ZggQG3RHsKyDfjhF1Z
 3m3qfAIg6nT3qxmzLE2YKPZuWetv0CVuyEHw8vwVQ8Gptev7Q0nmVi5XyqvaBgcRxLl8
 qxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TxlCD6uasdaCvAhuieiJPqkH6Uyaku7mnPBENClhnDI=;
 b=UJTn+rah/lR8u7EuiBv+HgxnP1F+Z7/nv5e6Hy6wY7OCPARgIrpz3o7ct4yT5f5Hng
 2TfjfaZUBu159egmY79wHmZHttSZswmo1gxqc0+qXNrZumU2Z5SRAhl9eB+3grMI3Z6F
 zCc3qoALcjgLoFkoqDdwxcppnm+WDyDAUdrY936lgrfZhD6txnYdmQvazrSi/0sbguSP
 Y1JahQ0ySOb6bsWnM+aJQbR3hHsBzNSJx53PJDSnxMrnEXylvaqeDhIxppBGKgNPCAJd
 9Yz3RUfkXH6wtSYC87Sxv7CsPwKTe8KmKUVTDIVr3MJBxQ6rMZMOpFYd3TmeWmi+0HcW
 pnig==
X-Gm-Message-State: AOAM530hugmQDiCqdBMm5yLgf2efd1neptelSiFPm0iqjB+reanWHl1c
 v0c66aPDTR3Vf4IPPXh+98+uxUezrqw=
X-Google-Smtp-Source: ABdhPJwkxT3ugyOyS4hvE7Tpy8nu8G0BSEVs0WyPem70+fiY69lbuP+WBu7OAFXjozUETKEcQxAOJQ==
X-Received: by 2002:ac8:7754:: with SMTP id g20mr24428843qtu.126.1591650310922; 
 Mon, 08 Jun 2020 14:05:10 -0700 (PDT)
Received: from localhost (mobile-166-173-249-24.mycingular.net.
 [166.173.249.24])
 by smtp.gmail.com with ESMTPSA id c4sm7513772qko.118.2020.06.08.14.05.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Jun 2020 14:05:10 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 00/13] drm/trace: Mirror DRM debug logs to tracefs
Date: Mon,  8 Jun 2020 17:04:50 -0400
Message-Id: <20200608210505.48519-1-sean@poorly.run>
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
 tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

This series is the latest in my journey to create a lightweight,
always-on "flight recorder" (name credit Weston) of drm logs. This
incarnation uses a trace_array to keep logs in memory exposed through
tracefs. Users and distros can enable drm logs by using the drm.trace
module parameter to choose the debug categories they are interested in.

The set has ballooned a little bit since the last version. Reason being
is that I decided to return true from drm_debug_enabled if trace was
enabled. This should make it easier and more seamless for driver
developers to use the correct interface, but meant I needed to audit all
uses of drm_debug_enabled and drm_debug_printer.

Out of all those calls, there are 3 situations which arose:
1- The logs should only go to syslog:
	I've converted these to use the drm_debug_syslog variant of
	enable check/printer.

2- The logs should go to both syslog/trace, but were using pr_debug():
	I've converted these to use the proper drm logging helper. In
	cases which used a drm_printer I've had to use a new
	drm_debug_category_printer to ensure they are routed correctly.

3- The logs should go to both syslog/trace and are using drm logging fns:
   	These are untouched and should be routed to the appropriate
	place(s)


Sean Paul (13):
  drm/mipi_dbi: Convert pr_debug calls to DRM_DEBUG_DRIVER
  drm/sil164: Convert dev_printk to drm_dev_dbg
  drm/i915/utils: Replace dev_printk with drm helpers
  drm/msm/dpu: Replace definitions for dpu debug macros
  drm/print: rename drm_debug* to be more syslog-centric
  drm/amd: Gate i2c transaction logs on drm_debug_syslog
  drm/etnaviv: Change buffer dump checks to target syslog
  drm/nouveau: Change debug checks to specifically target syslog
  drm/i915: Change infoframe debug checks to specify syslog
  drm/print: Add drm_debug_category_printer
  drm/mst: Convert debug printers to debug category printers
  drm/i915: Use debug category printer for welcome message
  drm/print: Add tracefs support to the drm logging helpers

 Documentation/gpu/drm-uapi.rst               |   6 +
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c   |   4 +-
 drivers/gpu/drm/drm_dp_mst_topology.c        |   9 +-
 drivers/gpu/drm/drm_drv.c                    |   3 +
 drivers/gpu/drm/drm_mipi_dbi.c               |   8 +-
 drivers/gpu/drm/drm_print.c                  | 228 ++++++++++++++++---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c     |   8 +-
 drivers/gpu/drm/i2c/sil164_drv.c             |  12 +-
 drivers/gpu/drm/i915/display/intel_display.c |   4 +-
 drivers/gpu/drm/i915/i915_drv.c              |   3 +-
 drivers/gpu/drm/i915/i915_utils.c            |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h      |  20 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.h      |   4 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h        |   4 +-
 include/drm/drm_print.h                      |  96 +++++++-
 15 files changed, 318 insertions(+), 96 deletions(-)

-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
