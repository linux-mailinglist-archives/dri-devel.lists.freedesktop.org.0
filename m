Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB79418A31
	for <lists+dri-devel@lfdr.de>; Sun, 26 Sep 2021 18:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF7889812;
	Sun, 26 Sep 2021 16:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E596689812
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 16:33:24 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 719e8be7-1ee7-11ec-a02a-0050568c148b;
 Sun, 26 Sep 2021 16:33:13 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 2BF19194BAF;
 Sun, 26 Sep 2021 18:33:14 +0200 (CEST)
Date: Sun, 26 Sep 2021 18:33:18 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Tang <kevin3.tang@gmail.com>
Cc: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, pony1.wu@gmail.com,
 Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 6/6] drm/sprd: add Unisoc's drm mipi dsi&dphy driver
Message-ID: <YVCgznmOA97v30wG@ravnborg.org>
References: <20210813145302.3933-1-kevin3.tang@gmail.com>
 <20210813145302.3933-7-kevin3.tang@gmail.com>
 <20210917154047.leojvqjqjj2sg34l@gilmour>
 <CAFPSGXZbqh0f6kEoQaq_Nt677ksVS6QPdAa5==KVVAszSAuasw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFPSGXZbqh0f6kEoQaq_Nt677ksVS6QPdAa5==KVVAszSAuasw@mail.gmail.com>
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

Hi Kevin,

> > > +     reg->_0b.bits.out_sel = pll->out_sel;
> > > +     reg->_0b.bits.kint_l = pll->kint & 0xf;
> > > +     reg->_0e.bits.pll_pu_byp = 0;
> > > +     reg->_0e.bits.pll_pu = 0;
> > > +     reg->_0e.bits.stopstate_sel = 1;
> > > +     reg->_0f.bits.det_delay = pll->det_delay;
> > > +
> > > +     val = (u8 *)&reg;
> > > +
> > > +     for (i = 0; i < sizeof(reg_addr); ++i) {
> > > +             regmap_write(regmap, reg_addr[i], val[i]);
> > > +             DRM_DEBUG("%02x: %02x\n", reg_addr[i], val[i]);
> > > +     }
> > > +}
> >
> > It would be great to also convert this part to a pattern without
> > structures.
> I will try it, but our pll registers, all not have official name from
> aisc design owner.
> If need to convert it, our pll regiters macro define, it can only be
> named as reg_01, reg_02...
IT is better to use the stupid names provided by you asic design owner,
than just numbers. Add a comment explaining this is due to the asic
design owner the names are stupid and not your fault.

> > > +
> > > +     if (dsi->panel) {
> > > +             drm_panel_prepare(dsi->panel);
> > > +             drm_panel_enable(dsi->panel);
> > > +     }
> >
> > Please use the new devm_drm_of_get_bridge helper here, and use the
> > bridge API instead.
> We use drm_panel_init and drm_panel_add API to add panel, so here is a
> panel device, not a bridge.

The new way to do this is to always wrap the panel in a bridge. We will
start to slowly migrate away from direct use of the panel API, and let
display drivers always wrap the panles in a bridge.
So please do as Maxime suggests.

	Sam
