Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BFB182ADD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CDB6EA85;
	Thu, 12 Mar 2020 08:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5A56E9DE
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 00:57:28 +0000 (UTC)
Received: by mail-pf1-x44a.google.com with SMTP id h191so2615127pfe.14
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 17:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=sei44eoljO70BQTRmM/UvmF8MrB7eTx6LtWSPNoZXds=;
 b=T4T7iRekar5ZIxwrvQxe3HvHCJpb2oLeUGHCNohdw8sqcT+F+yCqOpLBpmBLtwukB5
 zXnW2C571C8qx/GVByfeMpQGiEjtzCaVS6MyjfOqOxsC/S1K5BahZAs60IZ0XNE1G2Hz
 oWJaah+eorGWc/Gt+SV18LNHqaiiU7Ra/rQUiDyJz8YpOmpHQf881pLXWqWWTnrIG9xp
 xaaCJrqGivEdS4NX+PJnxMUrZ2L9v0l/E/aR0fWIaps4HDYOx3CNbMtLQUXtRFM+pN3C
 rwQ1cvvbDRLCYiycdpkjaQ4IDRN4XrCb0Z7EeC7sdHjyn/o6xQSZWmo2mqLHspas4qWW
 mTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=sei44eoljO70BQTRmM/UvmF8MrB7eTx6LtWSPNoZXds=;
 b=SmGrCwbh+pguck+B08i/xyPSLsnFofe+vA0PMNzx02A+afceAyX2YjBBFHEI2RponR
 5p3M3aIxVpHVFsfuMpbHfm75/2jMRlb1voxaEhiTaxeiR3GcDocGWxJERPrIrTzwKLde
 HbzVc93M6XgzMnqDwe+/I0weZKdKaI40n465NhnigsvArsh3/QFFCCO9HQUS4DffzD22
 kmrHFCi+lu4t3EU48g1xaU9zlInnSUmtd2uYODHXZJXsEWVv6II1jOzbbz84l7o+shga
 AQigvZGrs77ld9OntaGbdU3mlWjCeXy+D4RZnrNAyhe3uD+VJtqtZOsTt394yePYCLay
 gA3A==
X-Gm-Message-State: ANhLgQ2COHtDgQSFVgug2FATYfNt3Q8SyoLh2ePYvaAPkuMFL5q6O3Hz
 bKQJSGwofXxDhUuoPtkZpPQ9W8O9fMmb
X-Google-Smtp-Source: ADFU+vueKqfD5oH+ZMgo/VSjBEC/kZSY8+bu/uN24FhFc6J20lIsRGi+drzdDsHdvjfQ+t/HUa/T8WAxDlOn
X-Received: by 2002:a17:90b:1989:: with SMTP id
 mv9mr1462161pjb.72.1583974647951; 
 Wed, 11 Mar 2020 17:57:27 -0700 (PDT)
Date: Wed, 11 Mar 2020 17:57:17 -0700
Message-Id: <20200312005722.48803-1-rajatja@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v8 0/5] drm/i915: Support for integrated privacy screens
From: Rajat Jain <rajatja@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 "=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=" <ville.syrjala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Imre Deak <imre.deak@intel.com>, 
 "=?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?=" <jose.souza@intel.com>,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 gregkh@linuxfoundation.org, mathewk@google.com, 
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Pavel Machek <pavel@denx.de>, seanpaul@google.com,
 Duncan Laurie <dlaurie@google.com>, 
 jsbarnes@google.com, Thierry Reding <thierry.reding@gmail.com>,
 mpearson@lenovo.com, Nitin Joshi1 <njoshi1@lenovo.com>,
 Sugumaran Lacshiminarayanan <slacshiminar@lenovo.com>, 
 Tomoki Maruichi <maruichit@lenovo.com>
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Cc: Rajat Jain <rajatja@google.com>, rajatxjain@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset adds support for integrated privacy screen on some laptops
using the ACPI methods to detect and control the feature.

Rajat Jain (5):
  intel_acpi: Rename drm_dev local variable to dev
  drm/connector: Add support for privacy-screen property
  drm/i915: Lookup and attach ACPI device node for connectors
  drm/i915: Add helper code for ACPI privacy screen
  drm/i915: Enable support for integrated privacy screen

 drivers/gpu/drm/drm_atomic_uapi.c             |   4 +
 drivers/gpu/drm/drm_connector.c               |  51 +++++
 drivers/gpu/drm/i915/Makefile                 |   3 +-
 drivers/gpu/drm/i915/display/intel_acpi.c     |  30 ++-
 drivers/gpu/drm/i915/display/intel_atomic.c   |   2 +
 drivers/gpu/drm/i915/display/intel_ddi.c      |   1 +
 .../drm/i915/display/intel_display_types.h    |   5 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  48 ++++-
 drivers/gpu/drm/i915/display/intel_dp.h       |   5 +
 .../drm/i915/display/intel_privacy_screen.c   | 184 ++++++++++++++++++
 .../drm/i915/display/intel_privacy_screen.h   |  27 +++
 drivers/gpu/drm/i915/i915_drv.h               |   2 +
 include/drm/drm_connector.h                   |  24 +++
 13 files changed, 382 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_privacy_screen.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_privacy_screen.h

-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
