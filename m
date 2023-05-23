Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8566570E418
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 20:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E98A10E493;
	Tue, 23 May 2023 18:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B3610E493
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 18:02:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5941F611B2;
 Tue, 23 May 2023 18:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F8DC433EF;
 Tue, 23 May 2023 18:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684864934;
 bh=qhsH/fvB8p49rkMVi7cfrbf3uTOQ6EWGZa9IXoxfqqY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r8QxvmvasWRHb1+/aud0hTWkuqqlSv58IqB9166sUDBf8xPG11Q9UUWFv+oxL3wRg
 IITuZ2Rx+2sfHiekfq56Ic0x5dM+CNY8zVoXeigVGNHSqx7PhHhqyyh7DxYmYGXdBt
 O7siB6Z2yLPcdEfpFkh+WoQ/4Uff2QZi0MFUyVy11M6IKQlIBR3Z91kD599ehovYuf
 NTZj4shIGit3sAovWETCbwmiYmJcL592FZD0AuaL6Fed3t433zvF9jQHu2fdNhTiYu
 elC0pOxCb5Oean+VvGtFGjMns5fpmyug9ohght1n9rbfwp4rP8indYxmAVBE/nBDFW
 xCIA3QdHRZBRQ==
Date: Tue, 23 May 2023 11:02:12 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH v5 2/3] drm/panel: Add Samsung S6D7AA0 panel controller
 driver
Message-ID: <20230523180212.GA1401867@dev-arch.thelio-3990X>
References: <20230519170354.29610-1-aweber.kernel@gmail.com>
 <20230519170354.29610-3-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519170354.29610-3-aweber.kernel@gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Nikita Travkin <nikita@trvn.ru>, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Artur,

On Fri, May 19, 2023 at 07:03:53PM +0200, Artur Weber wrote:
> Initial driver for S6D7AA0-controlled panels. Currently, the following
> panels are supported:
> 
>  - S6D7AA0-LSL080AL02 (Samsung Galaxy Tab 3 8.0)
>  - S6D7AA0-LSL080AL03 (Samsung Galaxy Tab A 8.0 2015)
>  - S6D7AA0-LTL101AT01 (Samsung Galaxy Tab A 9.7 2015)
> 
> It should be possible to extend this driver to work with other panels
> using this IC.
> 
> Tested-by: Nikita Travkin <nikita@trvn.ru> #ltl101at01
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

<snip>

This change as commit 6810bb390282 ("drm/panel: Add Samsung S6D7AA0
panel controller driver") in -next causes the following build errors
with clang and GCC older than 8.x (the kernel supports back to GCC 5.1).

With clang:

  drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:312:14: error: initializer element is not a compile-time constant
          .drm_mode = s6d7aa0_lsl080al02_mode,
                      ^~~~~~~~~~~~~~~~~~~~~~~
  drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:415:14: error: initializer element is not a compile-time constant
          .drm_mode = s6d7aa0_lsl080al03_mode,
                      ^~~~~~~~~~~~~~~~~~~~~~~
  drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:443:14: error: initializer element is not a compile-time constant
          .drm_mode = s6d7aa0_ltl101at01_mode,
                      ^~~~~~~~~~~~~~~~~~~~~~~
  3 errors generated.

With GCC:

  drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:312:14: error: initializer element is not constant
    .drm_mode = s6d7aa0_lsl080al02_mode,
                ^~~~~~~~~~~~~~~~~~~~~~~
  drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:312:14: note: (near initialization for 's6d7aa0_lsl080al02_desc.drm_mode')
  drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:415:14: error: initializer element is not constant
    .drm_mode = s6d7aa0_lsl080al03_mode,
                ^~~~~~~~~~~~~~~~~~~~~~~
  drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:415:14: note: (near initialization for 's6d7aa0_lsl080al03_desc.drm_mode')
  drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:443:14: error: initializer element is not constant
    .drm_mode = s6d7aa0_ltl101at01_mode,
                ^~~~~~~~~~~~~~~~~~~~~~~
  drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:443:14: note: (near initialization for 's6d7aa0_ltl101at01_desc.drm_mode')

You can find these toolchains at
https://mirrors.edge.kernel.org/pub/tools/crosstool/ and
https://mirrors.edge.kernel.org/pub/tools/llvm/ if you need help
testing.

clang may eventually match GCC's newer behavior but there appears to be
some unresolved concerns around the proposed implementation and we have
not been able to double back to it:
https://reviews.llvm.org/D76096

> +static const struct drm_display_mode s6d7aa0_lsl080al03_mode = {
> +	.clock = (768 + 18 + 16 + 126) * (1024 + 8 + 2 + 6) * 60 / 1000,
> +	.hdisplay = 768,
> +	.hsync_start = 768 + 18,
> +	.hsync_end = 768 + 18 + 16,
> +	.htotal = 768 + 18 + 16 + 126,
> +	.vdisplay = 1024,
> +	.vsync_start = 1024 + 8,
> +	.vsync_end = 1024 + 8 + 2,
> +	.vtotal = 1024 + 8 + 2 + 6,
> +	.width_mm = 122,
> +	.height_mm = 163,
> +};
> +
> +static const struct s6d7aa0_panel_desc s6d7aa0_lsl080al03_desc = {
> +	.panel_type = S6D7AA0_PANEL_LSL080AL03,
> +	.init_func = s6d7aa0_lsl080al03_init,
> +	.off_func = s6d7aa0_lsl080al03_off,
> +	.drm_mode = s6d7aa0_lsl080al03_mode,
> +	.mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET,
> +	.bus_flags = 0,
> +
> +	.has_backlight = true,
> +	.use_passwd3 = true,
> +};
> +
> +/* Initialization structures for LTL101AT01 panel */
> +
> +static const struct drm_display_mode s6d7aa0_ltl101at01_mode = {
> +	.clock = (768 + 96 + 16 + 184) * (1024 + 8 + 2 + 6) * 60 / 1000,
> +	.hdisplay = 768,
> +	.hsync_start = 768 + 96,
> +	.hsync_end = 768 + 96 + 16,
> +	.htotal = 768 + 96 + 16 + 184,
> +	.vdisplay = 1024,
> +	.vsync_start = 1024 + 8,
> +	.vsync_end = 1024 + 8 + 2,
> +	.vtotal = 1024 + 8 + 2 + 6,
> +	.width_mm = 148,
> +	.height_mm = 197,
> +};
> +
> +static const struct s6d7aa0_panel_desc s6d7aa0_ltl101at01_desc = {
> +	.panel_type = S6D7AA0_PANEL_LTL101AT01,
> +	.init_func = s6d7aa0_lsl080al03_init, /* Similar init to LSL080AL03 */
> +	.off_func = s6d7aa0_lsl080al03_off,
> +	.drm_mode = s6d7aa0_ltl101at01_mode,
> +	.mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET,
> +	.bus_flags = 0,
> +
> +	.has_backlight = true,
> +	.use_passwd3 = true,
> +};

Cheers,
Nathan
