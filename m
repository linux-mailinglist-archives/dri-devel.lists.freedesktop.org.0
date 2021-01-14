Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E90A2F5A8F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 07:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EEB8991A;
	Thu, 14 Jan 2021 06:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9AD8991A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 06:14:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D77C3279;
 Thu, 14 Jan 2021 07:14:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610604870;
 bh=cHUnt2NLQz5i6ENRuyZKCOjdVJGgi4OXH1YMsBfgXHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mwYitn9hq/qHo2Pyxc4Dyuy5Lvm3KSzJlmKGu3QvxBtwAZfQNBll1/3Hxiz3ukU3j
 OT2VmJzdK11iE9UIoKNkWJezcSeTOEfhWVWk/dc5OWRyu3ERVqHpo3cX9zriInoY24
 lHehRjV68wF3hTxBS1JFWSc7PwNpVH9PG9RBu3kk=
Date: Thu, 14 Jan 2021 08:14:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] drm/bridge/lontium-lt9611uxc: fix waiting for EDID
 to become available
Message-ID: <X//hNDIH2taZrH+W@pendragon.ideasonboard.com>
References: <20201127092316.122246-1-dmitry.baryshkov@linaro.org>
 <CAA8EJpoetah-BHxe1Xao=8R3rR4CocdA9AXLERTjc-yKJ+Z0UQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAA8EJpoetah-BHxe1Xao=8R3rR4CocdA9AXLERTjc-yKJ+Z0UQ@mail.gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Tue, Jan 05, 2021 at 08:20:39PM +0300, Dmitry Baryshkov wrote:
> Gracious ping for these two patches

I'm afraid I have very little time for DRM bridge maintenance at the
moment :-S Judging by the lack of replies, it seems the other
maintainers are also AWOL. We seem to have a shortage of maintainers for
this part of the subsystem.

> On Fri, 27 Nov 2020 at 12:23, Dmitry Baryshkov wrote:
> >
> > - Call wake_up() when EDID ready event is received to wake
> >   wait_event_interruptible_timeout()
> >
> > - Increase waiting timeout, reading EDID can take longer than 100ms, so
> >   let's be on a safe side.
> >
> > - Return NULL pointer from get_edid() callback rather than ERR_PTR()
> >   pointer, as DRM code does NULL checks rather than IS_ERR().
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > index 0c98d27f84ac..b708700e182d 100644
> > --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > @@ -145,8 +145,10 @@ static irqreturn_t lt9611uxc_irq_thread_handler(int irq, void *dev_id)
> >
> >         lt9611uxc_unlock(lt9611uxc);
> >
> > -       if (irq_status & BIT(0))
> > +       if (irq_status & BIT(0)) {
> >                 lt9611uxc->edid_read = !!(hpd_status & BIT(0));
> > +               wake_up_all(&lt9611uxc->wq);
> > +       }
> >
> >         if (irq_status & BIT(1)) {
> >                 if (lt9611uxc->connector.dev)
> > @@ -465,7 +467,7 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
> >  static int lt9611uxc_wait_for_edid(struct lt9611uxc *lt9611uxc)
> >  {
> >         return wait_event_interruptible_timeout(lt9611uxc->wq, lt9611uxc->edid_read,
> > -                       msecs_to_jiffies(100));
> > +                       msecs_to_jiffies(500));
> >  }
> >
> >  static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
> > @@ -503,7 +505,10 @@ static struct edid *lt9611uxc_bridge_get_edid(struct drm_bridge *bridge,
> >         ret = lt9611uxc_wait_for_edid(lt9611uxc);
> >         if (ret < 0) {
> >                 dev_err(lt9611uxc->dev, "wait for EDID failed: %d\n", ret);
> > -               return ERR_PTR(ret);
> > +               return NULL;
> > +       } else if (ret == 0) {
> > +               dev_err(lt9611uxc->dev, "wait for EDID timeout\n");
> > +               return NULL;
> >         }
> >
> >         return drm_do_get_edid(connector, lt9611uxc_get_edid_block, lt9611uxc);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
