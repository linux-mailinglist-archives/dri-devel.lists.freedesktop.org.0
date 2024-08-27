Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E0F960D59
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 16:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886CF10E310;
	Tue, 27 Aug 2024 14:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.b="GuLTrcOj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C672C10E310
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 14:15:50 +0000 (UTC)
Received: from hillosipuli.retiisi.eu
 (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net
 [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sailus)
 by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WtV2C56krz49Q44;
 Tue, 27 Aug 2024 17:15:47 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1724768149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zKYvXpJS62xLbIhNVPi2GA6XAl6FOhp0wDIum6Cn7Sg=;
 b=GuLTrcOjhwkQglGpjy+xoMZrQyFl8RgSN/5cFaEvfoMT66611KT6SgL7iM2UTlzPaS9qZy
 DNpZnt3az3/7Z+3OuKyMQLM44dJEb1eBKPJjXt6WfCq+7pGFzwRMmA1CWMpiZJohOHjLl4
 Tocdh0WML/dIOXWyT1ZZiQiJB5kSuymf/dzkGKem8qsKZ/dIl6gktOoH7/0lWmIP7hCEBw
 lP6P7j1vsjakTaqpogJUoJR6ZNsVHBhMPc3l0fMZTtSP+tNFLtRP5jgkHWtJVvjsqm0/nA
 81BSdK5Fkdzibc0ayayLGbsmeQajFsdnN3Azs82+SmveWBcZjg9skPCflKxyDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=lahtoruutu; t=1724768149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zKYvXpJS62xLbIhNVPi2GA6XAl6FOhp0wDIum6Cn7Sg=;
 b=gPAL9vZHFElW7JQJLHmvXEOMY/pMB+2D2N9+heOQ0YgG/kQqRqY5ZdJuXjMT/Y4saNtMMG
 xcW30f1kd9Ygcj2Fp+XNaaKd/edipJYtv0cE8YfYasJGQceKWzoI/5xzr5itCRZUrwRCnX
 pTurn7jvI9ZfG4c3EE0PU/J56pfzUlu+xyKrBuZoT/QecYCeMfXPqm6dvIaF9qFgPATe42
 d9wHP3lu+a0zxdY7fET2xbRBUUWLwtYIj+wjeKqXaDCnvXIhjSvnbd+twA62KJ0UnMlusD
 bgiwb+Nj9jVVTgjHVkMOt3DQqWE5QJ8RMKi05AIfZjvM4VYBCE469Sibvz1VeA==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1724768149; a=rsa-sha256; cv=none;
 b=K3SYGdAtU10DUuKaGGwIW5dqUdDnrNiK236yvDSGLNT9NWDj6c5NnO382nCKNRONmP3hdU
 s31S3yqAybTx4keEJFvpLG0oJL4R7AuJPJtcyq+uABjjMHC5Y9TI36ENdsu62ilex/6qqe
 u0crr5OOoaHRtnVpFT/DnWSPfhT/ahdbAVp8rr2rMqLMNflM7INjuYDpsEJAHm2RQMGCSC
 GZDXdTf3lEpSdueQTGc7b8TkVFZ22OJFgD7XaS/2Re+GK6n27PCBPZbP6f+OOsUrqrmPek
 wdsCrbmQw1kWpbXw8p5OdifSFPgjNEnFl4YkLnIaX946UzF1j7cZ/fenYrlpRQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 700C1634C93;
 Tue, 27 Aug 2024 17:15:47 +0300 (EEST)
Date: Tue, 27 Aug 2024 14:15:47 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Rob Herring <robh@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 2/9] of: property: add of_graph_get_next_port_endpoint()
Message-ID: <Zs3fk-buU8Z-wwz3@valkosipuli.retiisi.eu>
References: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
 <87a5h0qa0g.wl-kuninori.morimoto.gx@renesas.com>
 <20240826154009.GA300981-robh@kernel.org>
 <Zs2tYUh3PXv-0e20@valkosipuli.retiisi.eu>
 <CAL_JsqLcM3r0dPHX9eoU3cz78UxBfg3_DnU4eKX7aohbYC2mRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLcM3r0dPHX9eoU3cz78UxBfg3_DnU4eKX7aohbYC2mRA@mail.gmail.com>
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

Hi Rob,

On Tue, Aug 27, 2024 at 09:05:02AM -0500, Rob Herring wrote:
> On Tue, Aug 27, 2024 at 5:47 AM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> >
> > Rob, Kunimori-san,
> >
> > On Mon, Aug 26, 2024 at 10:40:09AM -0500, Rob Herring wrote:
> > > On Mon, Aug 26, 2024 at 02:43:28AM +0000, Kuninori Morimoto wrote:
> > > > We already have of_graph_get_next_endpoint(), but it is not
> > > > intuitive to use in some case.
> > >
> > > Can of_graph_get_next_endpoint() users be replaced with your new
> > > helpers? I'd really like to get rid of the 3 remaining users.
> >
> > The fwnode graph API has fwnode_graph_get_endpoint_by_id() which can also
> > be used to obtain endpoints within a port. It does the same than
> > of_graph_get_endpoint_by_regs() with the addition that it also has a
> > flags field to allow e.g. returning endpoints with regs higher than
> > requested (FWNODE_GRAPH_ENDPOINT_NEXT).
> 
> Looks to me like FWNODE_GRAPH_ENDPOINT_NEXT is always used with
> endpoint #0. That's equivalent to passing -1 for the endpoint number
> with the OF API.

If the caller needs a single endpoint only, then the two are the same, yes.
The NEXT flag can still be used for obtaining further endpoints, unlike
setting endpoint to -1 in of_graph_get_endpoint_by_regs(). 

> 
> > Most users dealing with endpoints on fwnode property API use this, could
> > something like this be done on OF as well? Probably a similar flag would be
> > needed though.
> 
> I had fixed almost all the OF cases at one point. Unfortunately, there
> were a few corner cases that I didn't address to eliminate the API. So
> now it has proliferated with the fwnode API.

Much of the usage of fwnode_graph_get_next_endpoint() is conversion from
the OF API but there are some newer drivers, too. I admit I've sometimes
missed this in review. At the same time I can say most users in the media
tree do employ fwnode_graph_get_endpoint_by_id() already.

The good thing is that almost all current users are camera sensors and
converting them is fairly trivial. I can post patches but it'll take a
while...

-- 
Kind regards,

Sakari Ailus
