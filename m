Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F033B19AA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 14:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C24F6E8C5;
	Wed, 23 Jun 2021 12:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 551936E8C5;
 Wed, 23 Jun 2021 12:15:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69258ED1;
 Wed, 23 Jun 2021 05:15:57 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AC093F718;
 Wed, 23 Jun 2021 05:15:57 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id DA9E16837C9; Wed, 23 Jun 2021 13:15:55 +0100 (BST)
Date: Wed, 23 Jun 2021 13:15:55 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 04/22] drm: Don't test for IRQ support in VBLANK ioctls
Message-ID: <20210623121555.ttos325zjt55dynw@e110455-lin.cambridge.arm.com>
References: <20210622141002.11590-1-tzimmermann@suse.de>
 <20210622141002.11590-5-tzimmermann@suse.de>
 <20210622152504.2sw6khajwydsoaqa@e110455-lin.cambridge.arm.com>
 <f7e72a3c-df86-2d4b-2caa-bf91442290a9@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7e72a3c-df86-2d4b-2caa-bf91442290a9@suse.de>
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
Cc: emma@anholt.net, airlied@linux.ie, nouveau@lists.freedesktop.org,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 matthias.bgg@gmail.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, benjamin.gaignard@linaro.org,
 mihail.atanassov@arm.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 krzysztof.kozlowski@canonical.com, michal.simek@xilinx.com,
 jernej.skrabec@gmail.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, kong.kongxinwei@hisilicon.com,
 james.qian.wang@arm.com, linux-imx@nxp.com, xinliang.liu@linaro.org,
 linux-graphics-maintainer@vmware.com, linux-sunxi@lists.linux.dev,
 bskeggs@redhat.com, chunkuang.hu@kernel.org, mcoquelin.stm32@gmail.com,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de,
 linux-mediatek@lists.infradead.org, laurentiu.palcu@oss.nxp.com,
 linux-tegra@vger.kernel.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 tomba@kernel.org, hyun.kwon@xilinx.com, shawnguo@kernel.org,
 yannick.fertre@foss.st.com, Xinhui.Pan@amd.com, sw0312.kim@samsung.com,
 hjc@rock-chips.com, kyungmin.park@samsung.com, philippe.cornu@foss.st.com,
 kernel@pengutronix.de, alexander.deucher@amd.com, tiantao6@hisilicon.com,
 jyri.sarha@iki.fi, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Wed, Jun 23, 2021 at 08:43:07AM +0200, Thomas Zimmermann wrote:
> Hi Liviu
> 
> Am 22.06.21 um 17:25 schrieb Liviu Dudau:
> > Hello,
> > 
> > On Tue, Jun 22, 2021 at 04:09:44PM +0200, Thomas Zimmermann wrote:
> > > For KMS drivers, replace the IRQ check in VBLANK ioctls with a check for
> > > vblank support. IRQs might be enabled wthout vblanking being supported.
> > > 
> > > This change also removes the DRM framework's only dependency on IRQ state
> > > for non-legacy drivers. For legacy drivers with userspace modesetting,
> > > the original test remains in drm_wait_vblank_ioctl().
> > > 
> > > v2:
> > > 	* keep the old test for legacy drivers in
> > > 	  drm_wait_vblank_ioctl() (Daniel)
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > ---
> > >   drivers/gpu/drm/drm_irq.c    | 10 +++-------
> > >   drivers/gpu/drm/drm_vblank.c | 13 +++++++++----
> > >   2 files changed, 12 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
> > > index c3bd664ea733..1d7785721323 100644
> > > --- a/drivers/gpu/drm/drm_irq.c
> > > +++ b/drivers/gpu/drm/drm_irq.c
> > > @@ -74,10 +74,8 @@
> > >    * only supports devices with a single interrupt on the main device stored in
> > >    * &drm_device.dev and set as the device paramter in drm_dev_alloc().
> > >    *
> > > - * These IRQ helpers are strictly optional. Drivers which roll their own only
> > > - * need to set &drm_device.irq_enabled to signal the DRM core that vblank
> > > - * interrupts are working. Since these helpers don't automatically clean up the
> > > - * requested interrupt like e.g. devm_request_irq() they're not really
> > > + * These IRQ helpers are strictly optional. Since these helpers don't automatically
> > > + * clean up the requested interrupt like e.g. devm_request_irq() they're not really
> > >    * recommended.
> > >    */
> > > @@ -91,9 +89,7 @@
> > >    * and after the installation.
> > >    *
> > >    * This is the simplified helper interface provided for drivers with no special
> > > - * needs. Drivers which need to install interrupt handlers for multiple
> > > - * interrupts must instead set &drm_device.irq_enabled to signal the DRM core
> > > - * that vblank interrupts are available.
> > > + * needs.
> > >    *
> > >    * @irq must match the interrupt number that would be passed to request_irq(),
> > >    * if called directly instead of using this helper function.
> > > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> > > index 3417e1ac7918..a98a4aad5037 100644
> > > --- a/drivers/gpu/drm/drm_vblank.c
> > > +++ b/drivers/gpu/drm/drm_vblank.c
> > > @@ -1748,8 +1748,13 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
> > >   	unsigned int pipe_index;
> > >   	unsigned int flags, pipe, high_pipe;
> > > -	if (!dev->irq_enabled)
> > > -		return -EOPNOTSUPP;
> > > +	if  (drm_core_check_feature(dev, DRIVER_MODESET)) {
> > > +		if (!drm_dev_has_vblank(dev))
> > > +			return -EOPNOTSUPP;
> > > +	} else {
> > > +		if (!dev->irq_enabled)
> > > +			return -EOPNOTSUPP;
> > > +	}
> > 
> > For a system call that is used quite a lot by userspace we have increased the code size
> > in a noticeable way. Can we not cache it privately?
> 
> I'm not quite sure that I understand your concern. The additionally called
> functions are trivial one-liners; probably inlined anyway.

They are inlined. However we replace the pointer dereference (which can be calculated
at compile time as offset from a base pointer) with the code in
drm_core_check_all_features() that does 3 pointer dereferences, masking and logical
AND before checking for matching value.

> 
> However, irq_enabled is only relevant for legacy drivers and will eventually
> disappear behind CONFIG_DRM_LEGACY. We can rewrite the test like this:

I get the point that irq_enabled is legacy. However the IOCTL call is not and usually
is used in time critical code to wait for vblank before starting the old buffers for
a new frame. At 60Hz that's probably less of a concern, but at 120Hz refresh rate and
reduced vblank time your time slice allocation for new work matters.

Best regards,
Liviu

> 
> ifdef CONFIG_DRM_LEGACY
>   if (unlikely(check_feature(dev, DRIVER_LEGACY))) {
>     if (!irq_enabled)
>       return;
>   } else
> #endif
>   {
>     if (!has_vblank_support(dev))
>       return;
>   }
> 
> As CONFIG_DRM_LEGACY is most likely disabled on concurrent systems, we'd get
> a single test for the modern drivers. If DRM_LEGACYis on, the compiler at
> least knows that the else branch is preferred.
> 
> Best regards
> Thomas
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 




-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
