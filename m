Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CCCC8D581
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 09:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D4210E7A1;
	Thu, 27 Nov 2025 08:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DNf7Cktt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B9D10E7A1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 08:29:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4A37E60172;
 Thu, 27 Nov 2025 08:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7367EC4CEF8;
 Thu, 27 Nov 2025 08:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1764232146;
 bh=XDnWZhwF6hdUw7X2NJWegncDTsqHc35sPqTdiJCgnNw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DNf7CkttM4EX943jsl5GYEMrVDlUwh6xGdPDTxKBybn27mqbl1d0eo/NLieribjim
 etOjbk4jD39bR0lwIE5pCx7TIJw2supCY8CL7KQmRoFYMA64onRtxPc9Hlr+tRiN2M
 UGFa287MVgB5DJovcfzJdN9AzSpNVwYWFD4En9IQ=
Date: Thu, 27 Nov 2025 09:29:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, rafael@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org, sfr@canb.auug.org.au,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch,
 angelogioacchino.delregno@collabora.com, ulf.hansson@linaro.org,
 linus.walleij@linaro.org, Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v2 1/2] driver core: Export device_is_dependent() to
 modules
Message-ID: <2025112705-registrar-drivable-2341@gregkh>
References: <20231127051414.3783108-1-victor.liu@nxp.com>
 <20231127051414.3783108-2-victor.liu@nxp.com>
 <v6rthnruba5xaxazsn4jsptn6catso5qwuyf5xxbf4ml25b6eo@snttjo7oqlod>
 <2023112739-willing-sighing-6bdd@gregkh>
 <CAMRc=Mc3T1u1sa0P+78dfhtoyBPc+9zsJ5sGP=ZLR+S=h16vZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc3T1u1sa0P+78dfhtoyBPc+9zsJ5sGP=ZLR+S=h16vZg@mail.gmail.com>
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

On Wed, Nov 26, 2025 at 02:13:03PM +0100, Bartosz Golaszewski wrote:
> On Mon, Nov 27, 2023 at 7:21 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Nov 27, 2023 at 05:38:13PM +0100, Maxime Ripard wrote:
> > > Greg, Rafael,
> > >
> > > On Mon, Nov 27, 2023 at 01:14:13PM +0800, Liu Ying wrote:
> > > > Export device_is_dependent() since the drm_kms_helper module is starting
> > > > to use it.
> > > >
> > > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > > ---
> > > > v2:
> > > > * Newly introduced as needed by patch 2.
> > > >
> > > >  drivers/base/core.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > > > index 67ba592afc77..bfd2bf0364b7 100644
> > > > --- a/drivers/base/core.c
> > > > +++ b/drivers/base/core.c
> > > > @@ -328,6 +328,7 @@ int device_is_dependent(struct device *dev, void *target)
> > > >     }
> > > >     return ret;
> > > >  }
> > > > +EXPORT_SYMBOL_GPL(device_is_dependent);
> > >
> > > So, a committer just applied this to drm-misc-fixes without your
> > > approval. Could you ack it? If you don't want to, we'll fix it.
> >
> > Wait, why exactly is this needed?  Nothing outside of the driver core
> > should be needing this function, it shouldn't be public at all (I missed
> > that before.)
> >
> 
> Hi Greg!
> 
> Sorry for reviving this old thread but I stumbled upon it when looking
> for information on whether anyone ever tried to export
> device_is_dependent() before.
> 
> I have a use-case where I think I need to check if two devices are
> linked with a device link. I assume you'll prove me wrong. :)
> 
> The reset-gpio driver is a reset control driver that mediates sharing
> a reset GPIO (defined as a standardized reference fwnode property
> "reset-gpios") among multiple users. reset-gpio auxiliary devices are
> instantiated from reset core when it detects a consumer trying to get
> a reset-control handle but there's no "resets" reference on the
> consumer's fwnode, only "reset-gpios".
> 
> It makes sense for reset core to create a device link between the
> auxiliary reset-gpio device (the supplier) and the reset consumer
> because this link is not described in firmware - only the link between
> the consumer AND the GPIO controller.
> 
> Now in order to make gpiolib-shared.c code (generic support for shared
> GPIOs) happy, I need to handle the side effects of interacting with
> reset-gpio which does a similar thing. To that end, I need to know if
> given GPIO controller is a supplier of the consumer described in
> firmware OR the auxiliary reset device which is only described with
> software nodes.
> 
> The logical thing to do would be to use "device_is_dependent()" but
> this thread makes me think that won't fly.
> 
> What should I do? What's the "correct" way of checking if two devices
> are linked? I assume that fiddling with the supplier/consumer lists in
> struct device is not it.

fiddling with those lists is what device_is_dependent() does, but no,
you really don't want to be doing that either manually or by calling
this function.

Who is creating this "link"?  Can't that caller tell the gpio core this
relationship at the same time as you are wanting to keep track of it
too?

thanks,

greg k-h
