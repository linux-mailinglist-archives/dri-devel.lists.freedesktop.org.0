Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 523D7928702
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 12:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF4E10EA9B;
	Fri,  5 Jul 2024 10:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="k4ZNSYA0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2519210EAA8
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 10:44:30 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52a559e4429so122358e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 03:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720176268; x=1720781068; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iY+wmuc9gDBD8vkaWCJVg2xR38SmYyHEmg/ulb81llg=;
 b=k4ZNSYA0IJfzZn0mLrwMmmXJmSamQuk4C6+10d3cpha/TjSg9uaCokka3LNx3C4gYp
 KGsFdn+lvBTAqCuChPhBALGYNtuFZq6Jlh117SvKzWTlOg640kz5C56UIt+5GTYUBAAs
 RI1gzAmEw//H/60u1wd/PpbFloZ7xXXYW7RVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720176268; x=1720781068;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iY+wmuc9gDBD8vkaWCJVg2xR38SmYyHEmg/ulb81llg=;
 b=XUdD22h1cTr91FycrpRXyZqYJpe33TO4y23jeFM88qURSMmV6Lulw/p2NysbCi/cmR
 DmyH+c6B8Sx5RgXUA2PWSSHH3yjj8diImNkLgtcHSIa8rfMrOnJZ3csdWFidcOzrKPlV
 N6A/QHX313AnKnbyumOvyIwIcrJ6b9c/ccxCfH7vj3P6MsZ9uTo3U5AerV64LAKx9iwL
 wGsaT9yG115MvopqMxICezhDlayk5kcdSFPGpcQuA6Js+TK1jjh9xPEfVEdEgNd/15uT
 gFlsOk+oi9ZBuxLtLSHKs3sRHH3OmEv+/sOxRP/TqaJCu1inRL9WYkfLW/Mms/9hYwlU
 cxog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXpD5jxqfNf5Dmp38jGTx+cJVx2WL1eRcQ7ijU3dQxLnkQbnSNNi/T+b2itmCufC5qsll+qE+CqDYNJAgtL/uk/Tqr1jGiGn9U5KiOzAbO
X-Gm-Message-State: AOJu0YzNU7TXxrNQRjAGtxo3divcgh7P826riMw3micSIlL4XwZ6q7gZ
 sTS48YT3TXm4SIrQY8By+kjaUsrgRZ2m2n+xeKsIXvQXyl6iCWY76Ewql+JC+RU/fxWJufCLwn7
 K3+M=
X-Google-Smtp-Source: AGHT+IFv8vmD0HrL5U4YaRADGw3d1unqqJdPgX9u/ZnQoU6sTpOyPpqntCgjf0AGZjf758RbG3Uz7g==
X-Received: by 2002:ac2:4306:0:b0:52e:7bb4:942d with SMTP id
 2adb3069b0e04-52ea06150a9mr2793245e87.1.1720176268148; 
 Fri, 05 Jul 2024 03:44:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367961a507csm5775873f8f.77.2024.07.05.03.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 03:44:27 -0700 (PDT)
Date: Fri, 5 Jul 2024 12:44:25 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Maxime Ripard <mripard@redhat.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-misc-next
Message-ID: <ZofOidmBv5DcQ6ca@phenom.ffwll.local>
References: <20240704-curvy-outstanding-lizard-bcea78@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704-curvy-outstanding-lizard-bcea78@houat>
X-Operating-System: Linux phenom 6.8.9-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 04, 2024 at 03:17:09PM +0200, Maxime Ripard wrote:
> Hi,
> 
> Here's this week drm-misc-next PR, and the last PR for the 6.11 release cycle.
> 
> Thanks!
> Maxime
> 
> drm-misc-next-2024-07-04:
> drm-misc-next for $kernel-version:
> 
> UAPI Changes:
> 
> Cross-subsystem Changes:
> 
> Core Changes:
>   - dp/mst: Fix daisy-chaining at resume
>   - dsc: Add helper to dump the DSC configuration
>   - tests: Add tests for the new monochrome TV mode variant
> 
> Driver Changes:
>   - ast: Refactor the mode setting code
>   - panfrost: Fix devfreq job reporting
>   - stm: Add LDVS support, DSI PHY updates
>   - panels:
>     - New panel: AUO G104STN01, K&d kd101ne3-40ti,
> The following changes since commit 61bfcd190820d1dce846e58a4c9ddca8db4751ed:
> 
>   drm/bridge: analogix_dp: handle AUX transfer timeouts (2024-06-27 11:52:19 +0200)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2024-07-04
> 
> for you to fetch changes up to 896868eded124059023be0af92d68cdaf9b4de70:
> 
>   drm/panthor: Record devfreq busy as soon as a job is started (2024-07-04 09:29:55 +0100)

Pulled, thanks.
-Sima

> 
> ----------------------------------------------------------------
> drm-misc-next for $kernel-version:
> 
> UAPI Changes:
> 
> Cross-subsystem Changes:
> 
> Core Changes:
>   - dp/mst: Fix daisy-chaining at resume
>   - dsc: Add helper to dump the DSC configuration
>   - tests: Add tests for the new monochrome TV mode variant
> 
> Driver Changes:
>   - ast: Refactor the mode setting code
>   - panfrost: Fix devfreq job reporting
>   - stm: Add LDVS support, DSI PHY updates
>   - panels:
>     - New panel: AUO G104STN01, K&d kd101ne3-40ti,
> 
> ----------------------------------------------------------------
> Dave Stevenson (1):
>       drm/tests: Add tests for the new Monochrome value of tv_mode
> 
> Dragan Simic (2):
>       drm/lima: Mark simple_ondemand governor as softdep
>       drm/panfrost: Mark simple_ondemand governor as softdep
> 
> Imre Deak (2):
>       drm: Add helpers for q4 fixed point values
>       drm/display/dsc: Add a helper to dump the DSC configuration
> 
> Paul Gerber (2):
>       dt-bindings: display: simple: Add AUO G104STN01 panel
>       drm/panel: simple: Add AUO G104STN01 panel entry
> 
> Raphael Gallais-Pou (4):
>       dt-bindings: display: add STM32 LVDS device
>       drm/stm: lvds: add new STM32 LVDS Display Interface Transmitter driver
>       drm/stm: dsi: use new SYSTEM_SLEEP_PM_OPS() macro
>       drm/stm: dsi: expose DSI PHY internal clock
> 
> Steven Price (1):
>       drm/panthor: Record devfreq busy as soon as a job is started
> 
> Thomas Zimmermann (9):
>       drm/ast: Implement atomic enable/disable for encoders
>       drm/ast: Program mode for AST DP in atomic_mode_set
>       drm/ast: Move mode-setting code into mode_set_nofb CRTC helper
>       drm/ast: Handle primary-plane format setup in atomic_update
>       drm/ast: Remove gamma LUT updates from DPMS code
>       drm/ast: Only set VGA SCREEN_DISABLE bit in CRTC code
>       drm/ast: Inline ast_crtc_dpms() into callers
>       drm/ast: Use drm_atomic_helper_commit_tail() helper
>       drm/mgag200: Rename constant MGAREG_Status to MGAREG_STATUS
> 
> Thorsten Blum (1):
>       drm/managed: Simplify if condition
> 
> Wayne Lin (2):
>       drm/dp_mst: Fix all mstb marked as not probed after suspend/resume
>       drm/dp_mst: Skip CSN if topology probing is not done yet
> 
> Yannick Fertre (1):
>       drm/stm: dsi: add pm runtime ops
> 
> Zhaoxiong Lv (5):
>       drm/panel: jd9365da: Modify the method of sending commands
>       dt-bindings: display: panel: Add compatible for kingdisplay-kd101ne3
>       drm/panel: panel-jadard-jd9365da-h3: use wrapped MIPI DCS functions
>       drm/panel: jd9365da: Support for kd101ne3-40ti MIPI-DSI panel
>       drm/panel: jd9365da: Add the function of adjusting orientation
> 
>  .../bindings/display/panel/jadard,jd9365da-h3.yaml |    1 +
>  .../bindings/display/panel/panel-simple.yaml       |    2 +
>  .../bindings/display/st,stm32mp25-lvds.yaml        |  119 ++
>  MAINTAINERS                                        |    1 +
>  drivers/gpu/drm/ast/ast_mode.c                     |  204 ++--
>  drivers/gpu/drm/ast/ast_reg.h                      |   10 +-
>  drivers/gpu/drm/display/drm_dp_helper.c            |    5 +-
>  drivers/gpu/drm/display/drm_dp_mst_topology.c      |   15 +-
>  drivers/gpu/drm/display/drm_dsc_helper.c           |   91 ++
>  drivers/gpu/drm/drm_managed.c                      |    2 +-
>  drivers/gpu/drm/lima/lima_drv.c                    |    1 +
>  drivers/gpu/drm/mgag200/mgag200_mode.c             |    6 +-
>  drivers/gpu/drm/mgag200/mgag200_reg.h              |    2 +-
>  drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   | 1090 ++++++++++-------
>  drivers/gpu/drm/panel/panel-simple.c               |   27 +
>  drivers/gpu/drm/panfrost/panfrost_drv.c            |    1 +
>  drivers/gpu/drm/panthor/panthor_sched.c            |    1 +
>  drivers/gpu/drm/stm/Kconfig                        |   11 +
>  drivers/gpu/drm/stm/Makefile                       |    2 +
>  drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              |  279 ++++-
>  drivers/gpu/drm/stm/lvds.c                         | 1226 ++++++++++++++++++++
>  drivers/gpu/drm/tests/drm_cmdline_parser_test.c    |   11 +
>  drivers/gpu/drm/tests/drm_connector_test.c         |    1 +
>  drivers/gpu/drm/tests/drm_modes_test.c             |   31 +
>  include/drm/display/drm_dsc_helper.h               |    3 +
>  include/drm/drm_fixed.h                            |   23 +
>  26 files changed, 2605 insertions(+), 560 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
>  create mode 100644 drivers/gpu/drm/stm/lvds.c



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
