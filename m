Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D3E4B0CC9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 12:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E34710E81F;
	Thu, 10 Feb 2022 11:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C4E10E81F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 11:52:40 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nI802-0006hc-JZ; Thu, 10 Feb 2022 12:52:34 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nI800-0003TL-18; Thu, 10 Feb 2022 12:52:32 +0100
Date: Thu, 10 Feb 2022 12:52:32 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v5 01/23] drm/encoder: Add of_graph port to struct
 drm_encoder
Message-ID: <20220210115232.GY18637@pengutronix.de>
References: <20220209095350.2104049-1-s.hauer@pengutronix.de>
 <20220209095350.2104049-2-s.hauer@pengutronix.de>
 <20220209100736.GV18637@pengutronix.de> <87fsospa36.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fsospa36.fsf@intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:47:57 up 61 days, 20:33, 81 users,  load average: 0.17, 0.18, 0.14
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 09, 2022 at 01:12:45PM +0200, Jani Nikula wrote:
> On Wed, 09 Feb 2022, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> > David, Daniel,
> >
> > I'll need a word from you regarding this patch. It's needed in patch
> > 22/23 in this series.
> > vop2_crtc_atomic_enable() needs to control the mux which routes the
> > display output to the different encoders. Which encoder is used is
> > described in the of_graph port, so I need a way to identify the encoder
> > in the device tree.
> 
> I think the question is how useful is this going to be in general. IMO
> we should not be adding members that are useful in a single driver only.
> 
> For example i915 wraps encoders with:
> 
> 	struct intel_encoder {
> 		struct drm_encoder base;
> 
> 		/* i915 specific stuff here*/
> 	};
> 
> So that we can add stuff of our own there. Of course, it does mean a
> bunch of overhead for the first time you need to do it. But adding
> driver specific stuff to struct drm_encoder adds overhead for everyone.
> 
> All that said, *I* don't know how useful the port member would be in
> drivers that use device tree. Maybe it's worth it.

I don't know either.

Right now the drm_encoder is directly embedded into the encoder drivers
private data structures, like this:

struct rockchip_hdmi {
        struct drm_encoder encoder;
	...
};

I could change this to:

struct rockchip_encoder {
	struct device_node *port;
	struct drm_encoder encoder;
}

and then

struct rockchip_hdmi {
	struct rockchip_encoder encoder;
	...
};

That would solve the issue without touching generic DRM code if that's
preferred.

Sascha


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
