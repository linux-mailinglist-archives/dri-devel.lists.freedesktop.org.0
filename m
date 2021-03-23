Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D42346955
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 20:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479106E90C;
	Tue, 23 Mar 2021 19:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A0F6E90C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 19:53:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95AE0B1D;
 Tue, 23 Mar 2021 20:53:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616529188;
 bh=YwlqFRn0M9BFPQVdD6FUntyPjZt77vZr8VZHyyOCrsg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F8BEzzazZmkIYLZPdUQuuBsmom2pF1ocb+rZbxV6fjucBH78VhbZCMrAKhvwr64Dp
 aD9JWfQ1AznsC2BpTV6k8e0WARjOD8qf2BGqoqnOHjOGLtQ7K8B1rTuCGK190nlwyy
 CgSNrLJSa0vzzkV25c/eJakIocK8GOoHRqypogOU=
Date: Tue, 23 Mar 2021 21:52:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 3/4] drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
Message-ID: <YFpG+hK7W+4bpp0A@pendragon.ideasonboard.com>
References: <20201102181144.3469197-1-swboyd@chromium.org>
 <20201102181144.3469197-4-swboyd@chromium.org>
 <YFKc23MwUQAosCs8@pendragon.ideasonboard.com>
 <161646947526.2972785.6883720652669260316@swboyd.mtv.corp.google.com>
 <CAD=FV=U+-spmAxFeDNxhCuB6O=gUvO_==ozg-OGn=2vkUWgL4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=U+-spmAxFeDNxhCuB6O=gUvO_==ozg-OGn=2vkUWgL4Q@mail.gmail.com>
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
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Sean Paul <seanpaul@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Tue, Mar 23, 2021 at 12:07:27PM -0700, Doug Anderson wrote:
> On Mon, Mar 22, 2021 at 8:17 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Laurent Pinchart (2021-03-17 17:20:43)
> > > Hi Stephen,
> > >
> > > Reviving a bit of an old thread, for a question.
> > >
> > > On Mon, Nov 02, 2020 at 10:11:43AM -0800, Stephen Boyd wrote:
> > > > @@ -265,6 +267,23 @@ connector_to_ti_sn_bridge(struct drm_connector *connector)
> > > >  static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
> > > >  {
> > > >       struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
> > > > +     struct edid *edid = pdata->edid;
> > > > +     int num, ret;
> > > > +
> > > > +     if (!edid) {
> > > > +             pm_runtime_get_sync(pdata->dev);
> > > > +             edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
> > > > +             pm_runtime_put(pdata->dev);
> > >
> > > Is there any specific reason to use the indirect access method, compared
> > > to the direct method that translates access to an I2C ancillary address
> > > to an I2C-over-AUX transaction (see page 20 of SLLSEH2B) ? The direct
> > > method seems it would be more efficient.
> >
> > No I don't think it matters. I was just using the existing support code
> > that Sean wrote instead of digging into the details. Maybe Sean ran into
> > something earlier and abandoned that approach?
> 
> From reading the docs, it sounds as if there _could_ be a reason to
> use the indirect method. Specifically if the i2c host that the bridge
> is on doesn't support clock stretching then the direct method wouldn't
> work according to the docs. Is that something that we'd have to
> reasonably worry about?

I'm not sure. I'm going through BSP code that uses the direct method,
and I was wondering if it was just an implementation detail. Once I get
the display working on this board, I'll try to find time to compare the
two methods, to see if there's a significatant performance improvement
from the direct method. If there isn't, I won't bother.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
