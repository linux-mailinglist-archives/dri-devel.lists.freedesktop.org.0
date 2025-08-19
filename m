Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3050CB2CF7B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 00:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8864610E050;
	Tue, 19 Aug 2025 22:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nSusmXNB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE45910E050
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 22:45:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7074943AFC;
 Tue, 19 Aug 2025 22:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7E2C4CEF1;
 Tue, 19 Aug 2025 22:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755643543;
 bh=X0+iUH3kcuJxsm3Ic7boKWg9aLiYyrT0rK3vfD8vqD0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nSusmXNBV2ZghQbDI4agfxaQ9TYHQYWiftWqYLlLpFJK66hQxbO9TrNJUyiX1mDKd
 Y0Vz0xi73l5CMRDFNhaFu5eD/uI8R7DIJCEUz7TzLTUMj9vsWeZa5Dt7hZNEGmBC/g
 eUj7nWCCCgxDnQpSmOwPPCgnmXjsaePwFGW6FXxrFR4D/GrLp/ScSaDnfQ+ZTGMRcJ
 5iDKi+PoCCsdAz5MB+1dSLU8CQ1J6Paf3JI3YP+GVvmlUQ02ztElSdJ15M+GA8bDEW
 l1u5pYqb0ypP7urNOwz9VSVzfMeQ4/cleS6SWDgxJdH2qFmXIsFH6GTrMR6Z9zXEd1
 ILjCvfhNqXuZg==
Date: Tue, 19 Aug 2025 17:45:42 -0500
From: Rob Herring <robh@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Support for Synaptics TDDI series panels
Message-ID: <20250819224542.GA1591380-robh@kernel.org>
References: <20250819-panel-synaptics-tddi-v4-0-448f466d16a6@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-panel-synaptics-tddi-v4-0-448f466d16a6@disroot.org>
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

On Tue, Aug 19, 2025 at 08:26:43PM +0530, Kaustabh Chakraborty wrote:
> Synaptics' Touch and Display Driver Integration (TDDI) technology [1]
> employs a single chip for both touchscreen and display capabilities.
> Such designs reportedly help reducing costs and power consumption.
> 
> Although the touchscreens, which are powered by Synaptics'
> Register-Mapped Interface 4 (RMI4) touch protocol via I2C or SPI have
> driver support in the kernel, the MIPI DSI display panels don't.
> 
> This series introduces a rudimentary driver for controlling said display
> panels, which supports TD4101 and TD4300 panels.
> 
> [1] https://www.synaptics.com/technology/display-integration
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Changes in v4:
> - utilized drm_connector_helper_get_modes_fixed() (dmitry.baryshkov)
> - constified backlight properties (dmitry.baryshkov)
> - Link to v3: https://lore.kernel.org/r/20250720-panel-synaptics-tddi-v3-0-43a5957f4b24@disroot.org

Where's Krzysztof's Reviewed-by?

> 
> Changes in v3:
> - fixed various dt_binding_check errors (robh's bot)
> - adjusted commit description of [v2 1/2] (robh)
> - utilized devm_drm_panel_alloc() and devm_regulator_bulk_get_const()
> - Link to v2: https://lore.kernel.org/r/20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org
> 
> Changes in v2:
> - fixed various dt_binding_check errors (conor)
> - did s/tddi_update_brightness/tddi_update_status
> - added check for panel enable in tddi_update_status()
> - used backlight_get_brightness() in appropriate places
> - Link to v1: https://lore.kernel.org/r/20250612-panel-synaptics-tddi-v1-0-dfb8a425f76c@disroot.org
> 
> ---
> Kaustabh Chakraborty (2):
>       dt-bindings: display: panel: document Synaptics TDDI panel
>       drm: panel: add support for Synaptics TDDI series DSI panels
> 
>  .../display/panel/synaptics,td4300-panel.yaml      |  89 +++++++
>  drivers/gpu/drm/panel/Kconfig                      |  11 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  drivers/gpu/drm/panel/panel-synaptics-tddi.c       | 276 +++++++++++++++++++++
>  4 files changed, 377 insertions(+)
> ---
> base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
> change-id: 20250523-panel-synaptics-tddi-0b0b3f07f814
> 
> Best regards,
> -- 
> Kaustabh Chakraborty <kauschluss@disroot.org>
> 
