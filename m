Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 903A33527B2
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 11:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1246E198;
	Fri,  2 Apr 2021 09:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059616E093
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 09:00:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E69632C1;
 Fri,  2 Apr 2021 11:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1617354024;
 bh=elTh91fHBqoRE3n15Vt6YQfqLzAPhdsnX4FGuvqKbJM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oWFPNwZpRW0+ESGW3PxJDKemt4sdh4C2jxyzELlrhmAyenar17Mj6v3OiAJ7L8+MS
 Cn415IdbXHMs57Nwqp7UyBPce4jNY+QIqHyATyPyPnQSbGMiGRz8GAHgEwVkG6tX/l
 LlGJEOhMI+/QDocY1j9CI6RYvLmbQqR+fNXvD2gM=
Date: Fri, 2 Apr 2021 11:59:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v6 4/5] drm/bridge: anx7625: add HDCP support
Message-ID: <YGbc+1TynbHfX8Ml@pendragon.ideasonboard.com>
References: <cover.1616135353.git.xji@analogixsemi.com>
 <189a637c87827f78c433a053e3c2129ebec73188.1616135353.git.xji@analogixsemi.com>
 <CAMavQKLN04F2rzu7J121N4GvQKh7kq9yXGk+fBSUjsC2nbiSiA@mail.gmail.com>
 <20210329102710.GA1930154@anxtwsw-Precision-3640-Tower>
 <CAMavQKJHakp0ZfHFEy77r8wHY+3uaP-6Ab2ren6vA46njpjx3g@mail.gmail.com>
 <20210402022708.GA2154388@anxtwsw-Precision-3640-Tower>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210402022708.GA2154388@anxtwsw-Precision-3640-Tower>
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Sam Ravnborg <sam@ravnborg.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Bernie Liang <bliang@analogixsemi.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 Foss <robert.foss@linaro.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Sheng Pan <span@analogixsemi.com>, Zhen Li <zhenli@analogixsemi.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xin,

On Fri, Apr 02, 2021 at 10:27:08AM +0800, Xin Ji wrote:
> On Mon, Mar 29, 2021 at 02:02:08PM -0400, Sean Paul wrote:
> > On Mon, Mar 29, 2021 at 6:27 AM Xin Ji <xji@analogixsemi.com> wrote:
> > >
> > > On Thu, Mar 25, 2021 at 02:19:23PM -0400, Sean Paul wrote:
> > > > On Fri, Mar 19, 2021 at 2:35 AM Xin Ji <xji@analogixsemi.com> wrote:
> > > > >
> > > > > Add HDCP feature, enable HDCP function through chip internal key
> > > > > and downstream's capability.
> > > > >
> > > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > > ---
> > 
> > /snip
> > 
> > > > >  static void anx7625_dp_start(struct anx7625_data *ctx)
> > > > >  {
> > > > >         int ret;
> > > > > @@ -643,6 +787,9 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
> > > > >                 return;
> > > > >         }
> > > > >
> > > > > +       /* HDCP config */
> > > > > +       anx7625_hdcp_setting(ctx);
> > > >
> > > > You should really use the "Content Protection" property to
> > > > enable/disable HDCP instead of force-enabling it at all times.
> > >
> > > Hi Sean, it's hard to implement "Content Protection" property, we have
> > > implemented HDCP in firmware, it is not compatible with it. We don't
> > > have interface to get Downstream Cert.
> > > Thanks,
> > > Xin
> > 
> > Hi Xin,
> > I'm sorry, I don't understand what you mean when you say you don't
> > have an interface to get Downstream Cert.
> > 
> > The Content Protection property is just a means through which
> > userspace can turn on and turn off HDCP when it needs. As far as I can
> > tell, your patch turns on HDCP when the display is enabled and leaves
> > it on until it is disabled. This is undesirable since it forces HDCP
> > on the user.
> > 
> > Is it impossible to enable/disable HDCP outside of display
> > enable/disable on your hardware?
>
> Hi Sean, I have commit a test patch on google review site, can you
> please help to review it? I'll use Connector's ".atomic_check()"
> interface to detect Content Protection property change.
> (https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2674580)

Please note that upstream review happens on mailing lists, not in
gerrit. Internal reviews for Chrome OS development are certainly fine
there, but that will not mean the patch will then be accepted upstream
as-is, it will still need to go through the upstream review process,
without any shortcut. I strongly recommend using an upstream-first
strategy, with public review.

> > > > > +
> > > > >         if (ctx->pdata.is_dpi)
> > > > >                 ret = anx7625_dpi_config(ctx);
> > > > >         else
> > 
> > /snip

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
