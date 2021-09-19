Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FF3410C66
	for <lists+dri-devel@lfdr.de>; Sun, 19 Sep 2021 18:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359DF6E1F8;
	Sun, 19 Sep 2021 16:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1846E1F8
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Sep 2021 16:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=SkLH+UboopS3jydNhY/b3ibaID8wpHq9laVTqE2n57s=; b=E3ZV85cVknawbtUr32Gqm8RYhL
 Ab712U1reGxWRM7S4eKwC6U3oe3B9KULJHTMg7XyVm2d0Q1+CNzAh6qRZz9+WHwS/iemiw25p6ggr
 H2AUCcQC1kid2t5083+2fs8Fmh3pCJd15WFfFMUZe9x0UGi6YUn9SljaWcZdZkctQ4DCDFx0t6qkk
 xQQ1ps6/zrblGcdBsJ/QgHn8PsImtCIeL0kRYHq+TvCSMpXjAap/8jNxUSES9QMC2hf7dfXpEuy8H
 wMx+NDCGYitc3g+7cTX22FfyWxJEp9MfAS8g9XrG6l1uRXF8Mkr0NHDqrik/J8NL+58swO76H5Pj0
 +tdu5ljw==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRzrz-00HWNq-1w; Sun, 19 Sep 2021 16:40:47 +0000
Subject: Re: [PATCH v3 1/6] drm/vc4: select PM (openrisc)
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-kernel@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, bcm-kernel-feedback-list@broadcom.com,
 Emma Anholt <emma@anholt.net>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Openrisc <openrisc@lists.librecores.org>
References: <20210819135931.895976-1-maxime@cerno.tech>
 <20210819135931.895976-2-maxime@cerno.tech>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8a5cdcf5-33ed-398f-243a-b8889fd754e3@infradead.org>
Date: Sun, 19 Sep 2021 09:40:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210819135931.895976-2-maxime@cerno.tech>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 8/19/21 6:59 AM, Maxime Ripard wrote:
> We already depend on runtime PM to get the power domains and clocks for
> most of the devices supported by the vc4 driver, so let's just select it
> to make sure it's there, and remove the ifdef.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/vc4/Kconfig    | 1 +
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 2 --
>   2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
> index 118e8a426b1a..f774ab340863 100644
> --- a/drivers/gpu/drm/vc4/Kconfig
> +++ b/drivers/gpu/drm/vc4/Kconfig
> @@ -9,6 +9,7 @@ config DRM_VC4
>   	select DRM_KMS_CMA_HELPER
>   	select DRM_GEM_CMA_HELPER
>   	select DRM_PANEL_BRIDGE
> +	select PM
>   	select SND_PCM
>   	select SND_PCM_ELD
>   	select SND_SOC_GENERIC_DMAENGINE_PCM
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index c2876731ee2d..602203b2d8e1 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -2107,7 +2107,6 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
>   	return 0;
>   }
>   
> -#ifdef CONFIG_PM
>   static int vc4_hdmi_runtime_suspend(struct device *dev)
>   {
>   	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
> @@ -2128,7 +2127,6 @@ static int vc4_hdmi_runtime_resume(struct device *dev)
>   
>   	return 0;
>   }
> -#endif
>   
>   static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>   {
> 

Hi,

FYI.

This still causes a build error on arch/openrisc/ since it does not support
CONFIG_PM (it does not source "kernel/power/Kconfig" like some other arches do):

./arch/riscv/Kconfig:source "kernel/power/Kconfig"
./arch/x86/Kconfig:source "kernel/power/Kconfig"
./arch/nds32/Kconfig:source "kernel/power/Kconfig"
./arch/sh/Kconfig:source "kernel/power/Kconfig"
./arch/arc/Kconfig:source "kernel/power/Kconfig"
./arch/arm64/Kconfig:source "kernel/power/Kconfig"
./arch/xtensa/Kconfig:source "kernel/power/Kconfig"
./arch/sparc/Kconfig:source "kernel/power/Kconfig"
./arch/arm/Kconfig:source "kernel/power/Kconfig"
./arch/mips/Kconfig:source "kernel/power/Kconfig"
./arch/powerpc/Kconfig:source "kernel/power/Kconfig"
./arch/um/Kconfig:source "kernel/power/Kconfig"
./arch/ia64/Kconfig:source "kernel/power/Kconfig"

so with
CONFIG_DRM_VC4=y
# CONFIG_DRM_VC4_HDMI_CEC is not set

I still see
../drivers/gpu/drm/vc4/vc4_hdmi.c:2139:12: warning: 'vc4_hdmi_runtime_suspend' defined but not used [-Wunused-function]
  2139 | static int vc4_hdmi_runtime_suspend(struct device *dev)
       |            ^~~~~~~~~~~~~~~~~~~~~~~~


-- 
~Randy
