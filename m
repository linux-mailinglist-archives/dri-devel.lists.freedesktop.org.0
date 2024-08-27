Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E959607BC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 12:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8330E10E2E3;
	Tue, 27 Aug 2024 10:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="CpJCVrcx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CE910E2E3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 10:45:09 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-42812945633so45723855e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 03:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724755508; x=1725360308; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V7jl5dpwXfbJoF/y71Rr2S6LF5Epp+4znKMmfTaMBlw=;
 b=CpJCVrcxFjnez/nNoNRpuEsPoI7iGEzR/ubAny1lNMNdTAxkL9pbxFNPXtRBOSvLK4
 QjgF0Bgs48jQ81eNk6qmL5BkqMrvVMQFRSMw3zBLl38hECADttt31U6yDNpafDjysaZi
 1uRJE++tOmzWRRGYjR/7wsFF1M4BexG0FGElQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724755508; x=1725360308;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V7jl5dpwXfbJoF/y71Rr2S6LF5Epp+4znKMmfTaMBlw=;
 b=Xi74AwOZGDaqp+dh6XWTt5CI7WWXsuGR5sjn9X9U2MzO3OAcGli6x9wrU4l+1NpZdk
 uLJFBlZB6nRzvXeWMFAoWg4t7fe/hT41ebWbdMG73jxChpBrJLJUxwv8+rAoX2LWRYcZ
 Oh0jOpqh7Pf8DWeIuLdoDvSbNjrMmHSeDjl66dYmsQq6BVYau94n46AQXaoyoWqguolp
 QqdlHg7qOkBRekU2N2+/SaRFnzA6hDUajjKDVlbvkmvHodeO/2UkibaGCUfgmuj03JrC
 x9T88b2NR2j2UDzjVYdA3tRMSBu+y8tyQjlOeTDf7X244RbYGKFskQybRZHd9PDUlpV0
 wQSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFGFu8XBaFr8549lm3cXoAV1HFILIt7ZBdJ+a057/+cmJRKOE/fQmIy013wvxBHE8PPOmHUkzU12g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx52ksBECx/8VU1OINWQfrQiFF2kvLQigT06OcSUCKhsVSh2l31
 2XYRc14SyJ7nytIRztScHM9UPBBreuE/ORR16bf0DuxMY5oOpPucskI4weQSbd0=
X-Google-Smtp-Source: AGHT+IHO7GnhdyuY5/YeMbU+3/l5ztlwM2m+7A+Vr8XuZgcSbQa9OFzDiUT862icu7N6tBCPZzNEgA==
X-Received: by 2002:a05:600c:3143:b0:42a:a70e:30fb with SMTP id
 5b1f17b1804b1-42acc8dd83bmr86509425e9.15.1724755507382; 
 Tue, 27 Aug 2024 03:45:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac517f9basm180668935e9.39.2024.08.27.03.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 03:45:06 -0700 (PDT)
Date: Tue, 27 Aug 2024 12:45:04 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-misc-next
Message-ID: <Zs2uMO89_nLLa0Ja@phenom.ffwll.local>
References: <20240822150710.GA243952@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822150710.GA243952@localhost.localdomain>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Thu, Aug 22, 2024 at 05:07:10PM +0200, Thomas Zimmermann wrote:
> Hi Dave, Sima,
> 
> here's this week's PR for drm-misc-next. It adds support for more
> panels, and easier error handling for DSI code. Ast should finally
> have decent support for BMC output. Plus the usual bug fixes.
> 
> In the kernel's string helpers there's the new function mem_is_zero(),
> which the EDID code uses in several places.
> 
> Best regards
> Thomas
> 
> drm-misc-next-2024-08-22:
> drm-misc-next for v6.12:
> 
> Cross-subsystem Changes:
> 
> string:
> - add mem_is_zero()
> 
> Core Changes:
> 
> edid:
> - use mem_is_zero()
> 
> Driver Changes:
> 
> ast:
> - reorganize output code by type (VGA, DP, etc)
> - convert to struct drm_edid
> - fix BMC handling for all outputs
> 
> bridge:
> - anx7625: simplify OF array handling
> - dw-hdmi: simplify clock handling
> - lontium-lt8912b: fix mode validation
> - nwl-dsi: fix mode vsync/hsync polarity
> 
> panel:
> - ili9341: fix comments
> - jd9365da: fix "exit sleep" commands
> - jdi-fhd-r63452: simplify error handling with DSI multi-style
>   helpers
> - mantix-mlaf057we51: simplify error handling with DSI multi-style
>   helpers
> - simple: support Innolux G070ACE-LH3 plus DT bindings; support
>   On Tat Industrial Company KD50G21-40NT-A1 plus DT bindings
> - st7701: decouple DSI and DRM code; add SPI support; support Anbernic
>   RG28XX plus DT bindings
> 
> vc4:
> - fix PM during detect
> - replace DRM_ERROR() with drm_error()
> - v3d: simplify clock retrieval
> The following changes since commit 8befe8fa5a4e4b30787b17e078d9d7b5cb92ea19:
> 
>   drm/tilcdc: Use backlight power constants (2024-08-16 09:28:01 +0200)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2024-08-22

Pulled, thanks.
-Sima

> 
> for you to fetch changes up to f60ef67ff21ede6f3d27d439a136481446dbd8aa:
> 
>   drm/vc4: v3d: simplify clock retrieval (2024-08-22 07:57:44 -0300)
> 
> ----------------------------------------------------------------
> drm-misc-next for v6.12:
> 
> Cross-subsystem Changes:
> 
> string:
> - add mem_is_zero()
> 
> Core Changes:
> 
> edid:
> - use mem_is_zero()
> 
> Driver Changes:
> 
> ast:
> - reorganize output code by type (VGA, DP, etc)
> - convert to struct drm_edid
> - fix BMC handling for all outputs
> 
> bridge:
> - anx7625: simplify OF array handling
> - dw-hdmi: simplify clock handling
> - lontium-lt8912b: fix mode validation
> - nwl-dsi: fix mode vsync/hsync polarity
> 
> panel:
> - ili9341: fix comments
> - jd9365da: fix "exit sleep" commands
> - jdi-fhd-r63452: simplify error handling with DSI multi-style
>   helpers
> - mantix-mlaf057we51: simplify error handling with DSI multi-style
>   helpers
> - simple: support Innolux G070ACE-LH3 plus DT bindings; support
>   On Tat Industrial Company KD50G21-40NT-A1 plus DT bindings
> - st7701: decouple DSI and DRM code; add SPI support; support Anbernic
>   RG28XX plus DT bindings
> 
> vc4:
> - fix PM during detect
> - replace DRM_ERROR() with drm_error()
> - v3d: simplify clock retrieval
> 
> ----------------------------------------------------------------
> Abhishek Tamboli (1):
>       drm/panel: ili9341: Add comments for registers in ili9341_config()
> 
> Cristian Ciocaltea (1):
>       drm/bridge: dw-hdmi: Simplify clock handling
> 
> Esben Haabendal (1):
>       drm/bridge: nwl-dsi: Use vsync/hsync polarity from display mode
> 
> Hironori KIKUCHI (5):
>       drm/panel: st7701: Rename macros
>       drm/panel: st7701: Decouple DSI and DRM parts
>       dt-bindings: display: st7701: Add Anbernic RG28XX panel
>       drm/panel: st7701: Add support for SPI for configuration
>       drm/panel: st7701: Add Anbernic RG28XX panel support
> 
> Jani Nikula (2):
>       string: add mem_is_zero() helper to check if memory area is all zeros
>       drm: use mem_is_zero() instead of !memchr_inv(s, 0, n)
> 
> Jeffrey Hugo (1):
>       MAINTAINERS: qaic: Drop Pranjal as reviewer
> 
> Liu Ying (3):
>       drm/bridge: lontium-lt8912b: Validate mode in drm_bridge_funcs::mode_valid()
>       dt-bindings: display: panel-simple: Add On Tat Industrial Company KD50G21-40NT-A1
>       drm/panel: simple: Add ON Tat Industrial Company KD50G21-40NT-A1 panel
> 
> Rob Herring (Arm) (1):
>       drm: bridge: anx7625: Use of_property_read_variable_u8_array()
> 
> Stefan Wahren (3):
>       drm/vc4: hdmi: Handle error case of pm_runtime_resume_and_get
>       drm/vc4: Get the rid of DRM_ERROR()
>       drm/vc4: v3d: simplify clock retrieval
> 
> Steffen Trumtrar (2):
>       dt-bindings: display: simple: Document support for Innolux G070ACE-LH3
>       drm/panel: simple: add Innolux G070ACE-LH3 LVDS display support
> 
> Tejas Vipin (4):
>       drm/panel: mantix-mlaf057we51: transition to mipi_dsi wrapped functions
>       drm/panel: mantix-mlaf057we51: write hex in lowercase
>       drm/mipi-dsi: Add mipi_dsi_dcs_set_tear_scanline_multi
>       drm/panel: jdi-fhd-r63452: transition to mipi_dsi wrapped functions
> 
> Thomas Zimmermann (11):
>       drm/ast: Move code for physical outputs into separate files
>       drm/ast: Add struct ast_connector
>       drm/ast: astdp: Move locking into EDID helper
>       drm/ast: astdp: Use struct drm_edid and helpers
>       drm/ast: astdp: Simplify power management when detecting display
>       drm/ast: astdp: Transparently handle BMC support
>       drm/ast: dp501: Use struct drm_edid and helpers
>       drm/ast: dp501: Transparently handle BMC support
>       drm/ast: sil164: Transparently handle BMC support
>       drm/ast: vga: Transparently handle BMC support
>       drm/ast: Remove BMC output
> 
> Zhaoxiong Lv (2):
>       drm/panel: jd9365da: Move "exit sleep mode" and "set display on" cmds
>       drm/panel: jd9365da: Modify the init code of Melfas
> 
>  .../bindings/display/panel/panel-simple.yaml       |    4 +
>  .../bindings/display/panel/sitronix,st7701.yaml    |   69 +-
>  MAINTAINERS                                        |    1 -
>  drivers/gpu/drm/ast/Makefile                       |    4 +-
>  drivers/gpu/drm/ast/ast_dp.c                       |  242 ++++-
>  drivers/gpu/drm/ast/ast_dp501.c                    |  184 +++-
>  drivers/gpu/drm/ast/ast_drv.h                      |   42 +-
>  drivers/gpu/drm/ast/ast_mode.c                     |  578 ----------
>  drivers/gpu/drm/ast/ast_sil164.c                   |  127 +++
>  drivers/gpu/drm/ast/ast_vga.c                      |  127 +++
>  drivers/gpu/drm/bridge/analogix/anx7625.c          |   22 +-
>  drivers/gpu/drm/bridge/lontium-lt8912b.c           |   35 +-
>  drivers/gpu/drm/bridge/nwl-dsi.c                   |    8 +-
>  drivers/gpu/drm/bridge/nwl-dsi.h                   |    4 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   66 +-
>  drivers/gpu/drm/drm_edid.c                         |    2 +-
>  drivers/gpu/drm/drm_mipi_dsi.c                     |   31 +
>  drivers/gpu/drm/i915/display/intel_dp.c            |    2 +-
>  drivers/gpu/drm/i915/display/intel_opregion.c      |    2 +-
>  .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |    2 +-
>  drivers/gpu/drm/imagination/pvr_device.h           |    2 +-
>  drivers/gpu/drm/panel/Kconfig                      |    3 +-
>  drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |   14 +-
>  drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   |  137 +--
>  drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c       |  149 +--
>  drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   |   79 +-
>  drivers/gpu/drm/panel/panel-simple.c               |   71 ++
>  drivers/gpu/drm/panel/panel-sitronix-st7701.c      | 1122 ++++++++++++--------
>  drivers/gpu/drm/udl/udl_edid.c                     |    2 +-
>  drivers/gpu/drm/vc4/vc4_bo.c                       |   14 +-
>  drivers/gpu/drm/vc4/vc4_dpi.c                      |   14 +-
>  drivers/gpu/drm/vc4/vc4_dsi.c                      |   32 +-
>  drivers/gpu/drm/vc4/vc4_gem.c                      |   11 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |   44 +-
>  drivers/gpu/drm/vc4/vc4_hvs.c                      |    4 +-
>  drivers/gpu/drm/vc4/vc4_irq.c                      |    2 +-
>  drivers/gpu/drm/vc4/vc4_v3d.c                      |   24 +-
>  drivers/gpu/drm/vc4/vc4_validate.c                 |    8 +-
>  drivers/gpu/drm/vc4/vc4_vec.c                      |   10 +-
>  include/drm/drm_mipi_dsi.h                         |    2 +
>  include/linux/string.h                             |   12 +
>  41 files changed, 1830 insertions(+), 1478 deletions(-)
>  create mode 100644 drivers/gpu/drm/ast/ast_sil164.c
>  create mode 100644 drivers/gpu/drm/ast/ast_vga.c
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
