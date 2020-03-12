Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 588E0184216
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 09:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7B26EB8B;
	Fri, 13 Mar 2020 08:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803CC6E255
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 18:56:34 +0000 (UTC)
Received: by mail-pj1-x104a.google.com with SMTP id gv4so1522936pjb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 11:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=sei44eoljO70BQTRmM/UvmF8MrB7eTx6LtWSPNoZXds=;
 b=KxXhraTRYvbP6q/v3MOA1GEiCSzG3LudoXZy2DXZQrHJDt/gha0YdQwnS6nMDp7gcH
 efZSqSb3CpTXZNTe2F1559U+nYlcqB+4V79EWQo+lcjlD3KxXgAjgJstD3vW3IhTjYSO
 i7fVtSUXzr5cHQjlF+V+SZtHlwq/pYKTmakQ+245oRzZG9wgbXmJ2DIQAktYl+CZ0sN5
 mzqLs3SnstAJfCnP711IpzNM7DOs61XZezkYZ9JoQtu0mg0rzH/SIKKPifg2xQwdL9tc
 4w76XECPdz+3NVC+c2hmF/plc5spgHTGEU2RyJYqeDGpOK6BNcsOfjiPG0THuqEnW5jl
 JDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=sei44eoljO70BQTRmM/UvmF8MrB7eTx6LtWSPNoZXds=;
 b=if+JLA6JYfKElqp0By/Pl8XF9JXGOBsBNtAIs1hVaj/FT6EP4hSX4cLXkeP5MBpOT8
 VJODRuVe+24LczKsYdhBcnNkNwBGj4ltBNs4m/rHzOKa6TUzWglKZojg9G1zYBKedg00
 L0kF4T+2XQQwUbBhPhp5ru8r+RRSAUMYgsXINFfdpanXSYXO6EnLhfihuKArYyqZSq34
 18pLbAduEDQXHWJ0SY9jV6PeWoSpZ+cf7jj6Q4Pu5PDVL6FSEphHrZW2yZfyurfuvbui
 paZ2khU2KnZvifxcMtJWiBvbOdvbE4w1wzApqpllqfZO9OehcHux5fs6Q5MasPO9j5Zv
 UZIA==
X-Gm-Message-State: ANhLgQ1EXNCQtAWlEoyAAEz4e6i/xO3oKdSE1pNW79QQSbylwtH1WDxr
 YfDhIo9vze125oIVZ36x5qW0ycmgWuWA
X-Google-Smtp-Source: ADFU+vuYLz7wtRk2dXjXy2q6XhwL+1erGQc9nvzXs6bt9R+vf+zDpaz3AfTjx5/wkKQXoxHsgkgKTjeMI8X9
X-Received: by 2002:a17:90a:30c7:: with SMTP id
 h65mr5835404pjb.44.1584039393995; 
 Thu, 12 Mar 2020 11:56:33 -0700 (PDT)
Date: Thu, 12 Mar 2020 11:56:24 -0700
Message-Id: <20200312185629.141280-1-rajatja@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v9 0/5] drm/i915 Support for integrated privacy screen
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
X-Mailman-Approved-At: Fri, 13 Mar 2020 08:00:36 +0000
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
