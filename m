Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42A467EC8D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 18:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DEB910E9B9;
	Fri, 27 Jan 2023 17:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801FC10E9B9
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 17:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=i9smwgZ7QZWn/IBtIaTJqJ3XRqH7o8+yRAurisL8C9A=;
 b=P07C0vgcDG92khVYk9jtiKE0IIpLQj9lIiBWtlLJbnu/6sh/dNdAwITMEd/MwsFkKW3cq6RR1waIY
 Qc1ngU5SrwcFDbL6h3RxMIz2ROyQmOIDHfU7F49l/tr8VkWXbe3yIR8C33XW9YnyZCXRgNdHlzJ8oH
 KMWj8xR59Mr/D2pI9r+kG92u6z2C7uuQMSf+9z1B4LIeNmqCs0kugVz0IQ3JG/iS7B88NWVFkUUG5h
 Rjsmeso1yfS/osUuKgh8ihgs0OnOC4WK/Ran+S+SRGuaviRpu+zlakswp/Y2NBAdmqgmChVWd/dl3U
 kPyKiQNuRtFmytjgm0P9bJYZSe6ASmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=i9smwgZ7QZWn/IBtIaTJqJ3XRqH7o8+yRAurisL8C9A=;
 b=kt18WNrpG2VYHgiNLoWLqD1hg1p5d9MWum5IK2pQ0cW+Q9quvYCUIxZz7cYbvs5MEc2MIkcUQk66k
 byJBQ7mAw==
X-HalOne-ID: f73f9831-9e68-11ed-bd0e-ede074c87fad
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id f73f9831-9e68-11ed-bd0e-ede074c87fad;
 Fri, 27 Jan 2023 17:35:19 +0000 (UTC)
Date: Fri, 27 Jan 2023 18:35:18 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 04/10] drm/fbdev-generic: Initialize fb-helper
 structure in generic setup
Message-ID: <Y9QLVmyRvSVxQywz@ravnborg.org>
References: <20230125200415.14123-1-tzimmermann@suse.de>
 <20230125200415.14123-5-tzimmermann@suse.de>
 <Y9GZJcRKbaK0cYGo@ravnborg.org>
 <441188d8-01a6-2a48-ce46-e32d7006aafa@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <441188d8-01a6-2a48-ce46-e32d7006aafa@suse.de>
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 27, 2023 at 03:21:30PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 25.01.23 um 22:03 schrieb Sam Ravnborg:
> > Hi Thomas,
> > 
> > On Wed, Jan 25, 2023 at 09:04:09PM +0100, Thomas Zimmermann wrote:
> > > Initialize the fb-helper structure immediately after its allocation
> > > in drm_fbdev_generic_setup(). That will make it easier to fill it with
> > > driver-specific values, such as the preferred BPP.
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> > > ---
> > >   drivers/gpu/drm/drm_fbdev_generic.c | 13 +++++++++----
> > >   1 file changed, 9 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
> > > index 135d58b8007b..63f66325a8a5 100644
> > > --- a/drivers/gpu/drm/drm_fbdev_generic.c
> > > +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> > > @@ -385,8 +385,6 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
> > >   	if (dev->fb_helper)
> > >   		return drm_fb_helper_hotplug_event(dev->fb_helper);
> > > -	drm_fb_helper_prepare(dev, fb_helper, &drm_fb_helper_generic_funcs);
> > > -
> > >   	ret = drm_fb_helper_init(dev, fb_helper);
> > >   	if (ret)
> > >   		goto err;
> > 
> >  From the documentation:
> > The drm_fb_helper_prepare()
> > helper must be called first to initialize the minimum required to make
> > hotplug detection work.
> > ...
> > To finish up the fbdev helper initialization, the
> > drm_fb_helper_init() function is called.
> > 
> > So this change do not follow the documentation as drm_fb_helper_init()
> > is now called before drm_fb_helper_prepare()
> 
> No, we now call drm_fb_helper_prepare() from within
> drm_fbdev_generic_setup(), right after allocating the fb_helper.
> drm_fb_helper_init() will only be called after the client received a
> hot-plug event.
> 
> > 
> > I did not follow all the code - but my gut feeling is that the
> > documentation is right.
> 
> The docs are of low quality. The _prepare() helper is the actual init
> function and _init() only sets the fb_helper in the device instance.
OK, thanks for the follow-up.


	Sam
