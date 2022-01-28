Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B54149F861
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 12:37:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDA610EECD;
	Fri, 28 Jan 2022 11:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D622F10EEC8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 11:37:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB2D3471;
 Fri, 28 Jan 2022 12:37:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1643369836;
 bh=CeJvR4ORKUeBh5O+rhMxUG+pi4kilih9I+hEF4f+sfM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pXqX/EEQBJ5wwHO+8ucas+fjPqY3Vx+/MzDt4QJsxninA72AQfzWsM4TYjC0T3Aeg
 Xfir9WqpRKJO9XAXJ1uXZVGLx7+KtbLKmDEHXFUDb5TZt19Ttm11DkXBlg7wB7ci5j
 N3ZALuwl7lUx34szuUmUHwVfgttancuCFHVEMxC0=
Date: Fri, 28 Jan 2022 13:36:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 31/37] drm: rcar-du: Add support for the nomodeset
 kernel parameter
Message-ID: <YfPVVtWoW23xiP/g@pendragon.ideasonboard.com>
References: <20211217003752.3946210-1-javierm@redhat.com>
 <20211217003752.3946210-32-javierm@redhat.com>
 <164336121612.533872.1685181669511488706@Monstersaurus>
 <eb27fa44-2972-4a6e-465f-b9e4775820f4@suse.de>
 <YfPGnfly3GOAOlfp@pendragon.ideasonboard.com>
 <584f1343-b285-bf8e-e48c-764c2a56bce3@suse.de>
 <YfPN0fLfvWFC6mha@pendragon.ideasonboard.com>
 <1b1a5dc1-e3cd-c7ce-426b-cc330ae3ed81@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1b1a5dc1-e3cd-c7ce-426b-cc330ae3ed81@suse.de>
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
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Fri, Jan 28, 2022 at 12:26:03PM +0100, Thomas Zimmermann wrote:
> Am 28.01.22 um 12:04 schrieb Laurent Pinchart:
> > On Fri, Jan 28, 2022 at 11:46:49AM +0100, Thomas Zimmermann wrote:
> >> Am 28.01.22 um 11:34 schrieb Laurent Pinchart:
> >>> On Fri, Jan 28, 2022 at 10:33:21AM +0100, Thomas Zimmermann wrote:
> >>>> Am 28.01.22 um 10:13 schrieb Kieran Bingham:
> >>>>> Quoting Javier Martinez Canillas (2021-12-17 00:37:46)
> >>>>>> According to disable Documentation/admin-guide/kernel-parameters.txt, this
> >>>>>> parameter can be used to disable kernel modesetting.
> >>>>>>
> >>>>>> DRM drivers will not perform display-mode changes or accelerated rendering
> >>>>>> and only the system framebuffer will be available if it was set-up.
> >>>>>
> >>>>> What is the 'system framebuffer' in this instance? Reading
> >>>>> https://www.kernel.org/doc/Documentation/admin-guide/kernel-parameters.txt
> >>>>> it sounds like that means anything already set up by the bootloader.
> >>>>
> >>>> Exactly this.
> >>>>
> >>>>>> But only a few DRM drivers currently check for nomodeset, make this driver
> >>>>>> to also support the command line parameter.
> >>>>>>
> >>>>>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> >>>>>> ---
> >>>>>>
> >>>>>> (no changes since v1)
> >>>>>>
> >>>>>>     drivers/gpu/drm/rcar-du/rcar_du_drv.c | 3 +++
> >>>>>>     1 file changed, 3 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> >>>>>> index 5a8131ef81d5..982e450233ed 100644
> >>>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> >>>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> >>>>>> @@ -701,6 +701,9 @@ static struct platform_driver rcar_du_platform_driver = {
> >>>>>>     
> >>>>>>     static int __init rcar_du_init(void)
> >>>>>>     {
> >>>>>> +       if (drm_firmware_drivers_only())
> >>>>>> +               return -ENODEV;
> >>>>>> +
> >>>>>
> >>>>> This will completely disable all control of the display device when
> >>>>> nomodeset is enabled.
> >>>>>
> >>>>> Is there any requirement for us to support outputting to the display if
> >>>>> it was previously set up? presumably without setting or changing any
> >>>>> modes, but simply allowing the existing frame to be updated?
> >>>>
> >>>> There's no requirement for your driver. We just want a parameter where
> >>>> we can conveniently disable most of DRM's drivers and reduce it to a
> >>>> minimum. Helps distributions to provide a simple fallback mode.  Most
> >>>> PCI-based drivers already support that. Now we're added it to the other
> >>>> drivers as well.
> >>>>
> >>>>>
> >>>>> I think the implication is that 'firmware drivers' would mean a display
> >>>>> could be updated through some firmware interface, which we won't have
> >>>>> ... so it seems reasonable to accept that this whole driver can be
> >>>>> disabled in that instance.
> >>>>
> >>>> It cannot be 'mode-setted'. We get a pre-configured framebuffer from the
> >>>> firmware or bootloader. Whatever we draw there shows up on the screen.
> >>>
> >>> I doubt that's going to work as you expect, clocks and regulators will
> >>> get disabled at boot if not used by any driver.
> >>
> >> Simpledrm and simplefb attach to these firmware framebuffers. Both
> >> drivers look at the device tree nodes to acquire the relevant clocks and
> >> regulators.
> > 
> > How about clocks and regulators for the ancillary devices, such as
> > encoders, or in the R-Car case, the external composer handled by the
> > vsp1 driver (in drivers/media/platform/vsp1) ?
> > 
> > This approach may work fine on x86 desktop systems, but for ARM-based
> > devices, the situation is usually more complex.
> 
> Well, in that case the problem has always been there. We don't make it 
> worse.

What's the point of adding nomodeset support in those drivers then, if
it's known not to work ?

> >>>>> Reading your mail that brought this thread up in my inbox, I think
> >>>>> you've already hit merge on this, so don't worry about adding a tag in
> >>>>> that instance, but I think this is ok.
> >>>>>
> >>>>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>>>>
> >>>>>>            rcar_du_of_init(rcar_du_of_table);
> >>>>>>     
> >>>>>>            return platform_driver_register(&rcar_du_platform_driver);

-- 
Regards,

Laurent Pinchart
