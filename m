Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A816D4B68
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 17:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57A310E4CE;
	Mon,  3 Apr 2023 15:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBC310E4CE
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 15:08:00 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-544f7c176easo557153587b3.9
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 08:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680534479;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=15u7uvfPoSp23ZCjcQNjzptOVzb/oRpdtA+GlSd/sQY=;
 b=C+fHw/+BdgL33U96Zw0kSBNTr1netpl6Mx+kT+MpdRuvVEO4wrQ8Q0uHVhFYPFwy+f
 TRnSQexsxTiCYUHMKSGeKnRd+0JzHk9MLi013Yruv81ax8X9kj6orEKX+BUrI4LuqDol
 pXZysrbI0Vm9/YyUrv39a1uS4wq4KIlg7xRcNmpCIA0vQjTeOoO51tgHlkIBP8BjvSKY
 zBI8urVsdYp9TsQDpue1aqKDnXz7cuNSitWmeB4Ze65TaKbFzyrXsDGZYo7q9CEpciq9
 GxLIQ2OvBZ7Y5yN0CUIbHrbJuWrY+EtkjRtqrYvrlntu2ayrI8+B3PHoe5yOC5BGcRx1
 D5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680534479;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=15u7uvfPoSp23ZCjcQNjzptOVzb/oRpdtA+GlSd/sQY=;
 b=eH9yPEVflrCHGWpk3bBJErutzQhpS9cdNc6QdNYQrN67Bussoad7DPpSnQTtGMJkCT
 iKU0KptRelXu4V7vLsI1jwtDw+Ga2LVahlKOyXJnW71W1/WCoUF3npEy2g27XI1Chc8P
 b2uKA/qW3xgwaUpi6AVgLcNvS/VSMspWNy51ibb5DiYxiNIM8QRhkwVycYRfkcHrSkI4
 ZI0ZB9LdWL+pOxZ5mZTlpPNrIqIN+uiIlgS3awqR92KjcQS0B56BU8jKj+GCUWmg1hb+
 HlXTCD7eBGn+/aplY0GM89cVf7BD/s9JOYbL26/goCXSS6g/FKTVW8EnhaSKTs0DnLOg
 W9aQ==
X-Gm-Message-State: AAQBX9fzurjt57/wMxEb1RkvuJarTjMg4vrlOE1cEntG25UIXvuWOtui
 qjOCxQxg074k2LYAf71PzHrgNVkXcMFwMc2blFzp9Jqx
X-Google-Smtp-Source: AKy350ZAo4uP8IaBymOzPQP1wyplxiURmS3ydpCZ5mqp0ajpNz/Im1lUOWs2onnTzC1sxfcsNoBPEQu8KouP81vPzLA=
X-Received: by 2002:a81:be0f:0:b0:542:927b:1c79 with SMTP id
 i15-20020a81be0f000000b00542927b1c79mr10176799ywn.3.1680534479123; Mon, 03
 Apr 2023 08:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230403104035.15288-1-tzimmermann@suse.de>
 <20230403104035.15288-6-tzimmermann@suse.de>
 <CACvgo52vn4HAq+ZmO9xR88se--bYE9b322ucZ04jp8s3Wc_WCg@mail.gmail.com>
 <4818e04e-2209-a4fb-7caa-48ed2bcd809d@suse.de>
In-Reply-To: <4818e04e-2209-a4fb-7caa-48ed2bcd809d@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 3 Apr 2023 16:07:47 +0100
Message-ID: <CACvgo53+GsJ+JWBvLnHLp+2Ad5aXFkVHW8GwZTjZEsx2Rt2QNA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm/omapdrm: Implement fbdev emulation as
 in-kernel client
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: tomba@kernel.org, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 3 Apr 2023 at 15:50, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 03.04.23 um 16:27 schrieb Emil Velikov:
> > On Mon, 3 Apr 2023 at 11:41, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>
> >> Move code from ad-hoc fbdev callbacks into DRM client functions
> >> and remove the old callbacks. The functions instruct the client
> >> to poll for changed output or restore the display. The DRM core
> >> calls both, the old callbacks and the new client helpers, from
> >> the same places. The new functions perform the same operation as
> >> before, so there's no change in functionality.
> >>
> >> Replace all code that initializes or releases fbdev emulation
> >> throughout the driver. Instead initialize the fbdev client by a
> >> single call to omapdrm_fbdev_setup() after omapdrm has registered
> >> its DRM device. As in most drivers, omapdrm's fbdev emulation now
> >> acts like a regular DRM client.
> >>
> >> The fbdev client setup consists of the initial preparation and the
> >> hot-plugging of the display. The latter creates the fbdev device
> >> and sets up the fbdev framebuffer. The setup performs display
> >> hot-plugging once. If no display can be detected, DRM probe helpers
> >> re-run the detection on each hotplug event.
> >>
> >> A call to drm_dev_unregister() releases the client automatically.
> >> No further action is required within omapdrm. If the fbdev
> >> framebuffer has been fully set up, struct fb_ops.fb_destroy
> >> implements the release. For partially initialized emulation, the
> >> fbdev client reverts the initial setup.
> >>
> >> v2:
> >>          * init drm_client in this patch (Tomi)
> >>          * don't handle non-atomic modesetting (Tomi)
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   drivers/gpu/drm/omapdrm/omap_drv.c   |  11 +--
> >>   drivers/gpu/drm/omapdrm/omap_fbdev.c | 132 +++++++++++++++++----------
> >>   drivers/gpu/drm/omapdrm/omap_fbdev.h |   9 +-
> >>   3 files changed, 90 insertions(+), 62 deletions(-)
> >>
> >
> >> +static void omap_fbdev_fb_destroy(struct fb_info *info)
> >> +{
> >> +       struct drm_fb_helper *helper = info->par;
> >> +       struct drm_framebuffer *fb = helper->fb;
> >> +       struct drm_gem_object *bo = drm_gem_fb_get_obj(fb, 0);
> >> +       struct omap_fbdev *fbdev = to_omap_fbdev(helper);
> >> +
> >> +       DBG();
> >> +
> >
> > What a lovely little surprise. It's a pre-existing "feature", so let's
> > ignore that for now ;-)
>
> I have no idea what you're talking about. This code was in the original
> clean-up function. If it is not supposed to be here, I can remove it.
>

Precisely - the original code had the DBG() and your change preserves
it. Based on my reading, it shouldn't be there ... then again don't
read too much into that.

> >
> >> +       drm_fb_helper_fini(helper);
> >> +
> >> +       omap_gem_unpin(bo);
> >> +       drm_framebuffer_remove(fb);
> >> +
> >> +       drm_client_release(&helper->client);
> >> +       drm_fb_helper_unprepare(helper);
> >> +       kfree(fbdev);
> >> +}
> >
> >
> >> -void omap_fbdev_fini(struct drm_device *dev)
> >> +static const struct drm_client_funcs omap_fbdev_client_funcs = {
> >> +       .owner          = THIS_MODULE,
> >> +       .unregister     = omap_fbdev_client_unregister,
> >> +       .restore        = omap_fbdev_client_restore,
> >> +       .hotplug        = omap_fbdev_client_hotplug,
> >
> > AFAICT the fbdev client helpers above are identical to the generic
> > ones in drm_fbdev_generic.c. Why aren't we reusing those but
> > copy/pasting them in the driver?
>
> The code in drm_fbdev_generic.c (and other fbdev files) might be
> shareable at some point when I know what exactly I need.

> I already plan
> to move some of the damage handling from drm_fb_helper.c to
> drm_fbdev_generic.c and that will affect the helpers that are currently
> identical.

Now that's the piece that I was missing.

> There's little point in code sharing right now.
>
> I know that the fbdev emulation is convoluted and confusing at times.
> It's the result of various redesigns and false starts. Things are
> getting better, though.
>

Been keeping an eye on your work and it's shaping up great. It's
deeply appreciated.

Fwiw the series is:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

-Emil
