Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFB989D583
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 11:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0699F10EC5C;
	Tue,  9 Apr 2024 09:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F17610EC5C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 09:26:29 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by riemann.telenet-ops.be (Postfix) with ESMTPS id 4VDLF05Dflz4wx7B
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 11:26:28 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
 by andre.telenet-ops.be with bizsmtp
 id 8xSR2C00c0SSLxL01xSRx9; Tue, 09 Apr 2024 11:26:28 +0200
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1ru7kH-00D2QY-KH;
 Tue, 09 Apr 2024 11:26:25 +0200
Date: Tue, 9 Apr 2024 11:26:25 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maxime Ripard <mripard@kernel.org>
cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 kernel test robot <lkp@intel.com>, linux-renesas-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/13] drm/display: Convert helpers Kconfig symbols
 to depends on
In-Reply-To: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
Message-ID: <a816fea-9974-d17f-bed6-69728e223@linux-m68k.org>
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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

 	Hi Maxime,

On Wed, 27 Mar 2024, Maxime Ripard wrote:
> Jani recently pointed out that the Kconfig symbols are a bit difficult
> to work with at the moment when they depend on each other, and that
> using depends on would be a better idea, but no one really did the work
> so far.
>
> So here it goes :)
>
> It's been tested by comparing the riscv defconfig, arm
> multi_v7_defconfig, arm64 defconfig, drm-misc-arm, drm-misc-arm64 and
> drm-misc-x86 before and after this series and making sure they are
> identical.

That is not true: comparing drm-misc/for-linux-next to v6.9-rc2,
arm/multi_v7_defconfig, arm64/defconfig, and riscv/defconfig lost
several of:
   - CONFIG_DRM_DW_HDMI,
   - CONFIG_DRM_DW_HDMI_AHB_AUDIO,
   - CONFIG_DRM_DW_HDMI_CEC,
   - CONFIG_DRM_DW_HDMI_I2S_AUDIO,
   - CONFIG_DRM_IMX_HDMI.
   - CONFIG_DRM_MESON_DW_HDMI,
   - CONFIG_DRM_RCAR_DW_HDMI,
   - CONFIG_DRM_SUN8I_DW_HDMI,
   - CONFIG_ROCKCHIP_DW_HDMI,
   - CONFIG_SND_MESON_G12A_TOHDMITX,

> Let me know what you think,

IMHO this series looks like a big usuability issue for anyone
configuring the kernel, and you try to work around this by sprinkling
"default y" around.

The user should not need to know which helpers are needed for the driver
he is interested in.  When a symbol selects another symbol, it should
just make sure the dependencies of the target symbol are met.

Thanks for reverting ;-)

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
