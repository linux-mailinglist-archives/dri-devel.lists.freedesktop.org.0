Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E81D17F197
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 09:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C456E7FA;
	Tue, 10 Mar 2020 08:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B76C6E133
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 00:06:23 +0000 (UTC)
Received: by mail-pg1-x549.google.com with SMTP id i29so6792172pgi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 17:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=bdQzhDLUPsxOm6QqZ3hLu+lvyMhDWFhXWI3PbzbhChY=;
 b=HL3ZhDns/Fm8Dzrc17UD5zmpwurRv/Q9PXH36tRJTRSymI40PHBq6pcyslCC61Qk+o
 NTwIxD663xAck53Xs+lfHDMiTxRI6gdxZFaCPntKL9ihkQLfJpFyS4+0HsLGlVWBH7Pg
 8i4CXlBg/NfTw5tHfnARzxkHFPNg2sHJsfQrWWs7eu7eS3W2q2qC4oQbG5xiX3h8x6Rn
 gSUQuan0HxAOuJ4bky3oFQTkXOQrGde9rOVTut2edQRTTBbk//IIo/7Rvz7FbfktkYLY
 M7wxm507BXjhQpSQg1Ma4eqvW/YaJxxCwR1xzfg1gGh2jfWtzeB+76Y1PB1cZcC4QAQ1
 15Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=bdQzhDLUPsxOm6QqZ3hLu+lvyMhDWFhXWI3PbzbhChY=;
 b=pmJW7BwKQBsRHXPwimyPW1v0Pipa83DZpH3BH0TBtfNnUeqlCDt8aTjjcdl/eGl3T/
 2hN4gBA7gTRLQdnx24CPR4o0SxCT//2048cuL3e5ycha72GRSGAoI+U6xt8XMM6SuH2i
 i+YLPas7xV2ouLiyWFVpW1n4Rvg/QF6iILO3gYD69hEf+Qla42vbsyo84ay01WqXfE8M
 4cfQ8+0wsMdudeFKIZQ57kr45wSNdH69sRhH2y2YFviCchUlZBadWC1o3SFMSag9vlaF
 5pFBTnNFrDpkVEwWl2Z6yN2zu+xvT2TB0FQ5hFh1MMso+pRjcBY2PKenyFNG0DEOMl+Y
 15kA==
X-Gm-Message-State: ANhLgQ0dU+c6xTkgKDNE8D+szB+M2oJllnYSqOug9mVyuhrZgh27EgGH
 mvgdo9ybSGiT+O7XTyTOJEKytvhVasvv
X-Google-Smtp-Source: ADFU+vuGQ8fT2JXf1JRD3wm3mul6BK5fRWp/eQfqYaAjUaKocRKkkUmdDfacVg+LSo7TqiBDGChU5mRWRnGn
X-Received: by 2002:a63:f925:: with SMTP id h37mr18801182pgi.103.1583798782458; 
 Mon, 09 Mar 2020 17:06:22 -0700 (PDT)
Date: Mon,  9 Mar 2020 17:06:13 -0700
Message-Id: <20200310000617.20662-1-rajatja@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v7 0/4] drm: Add support for integrated privacy screen
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
X-Mailman-Approved-At: Tue, 10 Mar 2020 08:19:05 +0000
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

This patchset adds:
 - (Generic) integrated privacy screen support in drm
 - Ability in i915 to attach to ACPI nodes
 - an implmentation for ACPI privacy screen in i915

Rajat Jain (4):
  intel_acpi: Rename drm_dev local variable to dev
  drm/connector: Add support for privacy-screen property
  drm/i915: Lookup and attach ACPI device node for connectors
  drm/i915: Add support for integrated privacy screen

 drivers/gpu/drm/drm_atomic_uapi.c             |   4 +
 drivers/gpu/drm/drm_connector.c               |  56 ++++++
 drivers/gpu/drm/i915/Makefile                 |   3 +-
 drivers/gpu/drm/i915/display/intel_acpi.c     |  28 ++-
 drivers/gpu/drm/i915/display/intel_atomic.c   |   1 +
 .../drm/i915/display/intel_display_types.h    |   5 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  43 ++++-
 .../drm/i915/display/intel_privacy_screen.c   | 175 ++++++++++++++++++
 .../drm/i915/display/intel_privacy_screen.h   |  27 +++
 drivers/gpu/drm/i915/i915_drv.h               |   2 +
 include/drm/drm_connector.h                   |  25 +++
 11 files changed, 365 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_privacy_screen.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_privacy_screen.h

-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
