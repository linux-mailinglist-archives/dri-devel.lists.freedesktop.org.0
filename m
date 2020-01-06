Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B3913119F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 12:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6C66E284;
	Mon,  6 Jan 2020 11:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F506E284
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 11:52:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4B9F52F;
 Mon,  6 Jan 2020 12:52:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1578311537;
 bh=wSJwPUJzX9dLQHof5jpN8W8WQqNmAk63bu25yksqFy8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WpPOMyPUYbjijg/PMQUnO4BHZpc+MKgZpuwIAmgFQbHbYUNXHjV8e0Qygnr9Wma8B
 Vryr9h6K1/v0Kk4t87ed7RfagAA1M5jAKrWpPvR1VZRHcA4ROYlK20ws+yZgUGEOuF
 LtmnOko1sCZ1srtnjwXleOEuKz0HbtbIaiZIdVcM=
Date: Mon, 6 Jan 2020 13:52:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v5 1/4] drm/bridge: Add a drm_bridge_state object
Message-ID: <20200106115207.GB4853@pendragon.ideasonboard.com>
References: <20191219101151.28039-1-narmstrong@baylibre.com>
 <20191219101151.28039-2-narmstrong@baylibre.com>
 <20200106110354.0a5cbc10@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200106110354.0a5cbc10@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 06, 2020 at 11:03:54AM +0100, Boris Brezillon wrote:
> On Thu, 19 Dec 2019 11:11:48 +0100 Neil Armstrong wrote:
> 
> > +/**
> > + * drm_atomic_helper_duplicate_bridge_state() - Default duplicate state helper
> > + * @bridge: bridge containing the state to duplicate
> > + *
> > + * Default implementation of &drm_bridge_funcs.atomic_duplicate().
> > + *
> > + * RETURNS:
> > + * a valid state object or NULL if the allocation fails.
> > + */
> > +struct drm_bridge_state *
> > +drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge)
> > +{
> > +	struct drm_bridge_state *new;
> > +
> > +	if (WARN_ON(!bridge->base.state))
> > +		return NULL;
> > +
> > +	new = kzalloc(sizeof(*new), GFP_KERNEL);
> > +	if (new)
> > +		__drm_atomic_helper_bridge_duplicate_state(bridge, new);
> > +
> > +	return new;
> > +}
> > +EXPORT_SYMBOL(drm_atomic_helper_bridge_duplicate_state);
> 
> IIRC, Laurent suggested to make those functions private. I'd also
> recommend changing the names to
> drm_atomic_*default*_bridge_<action>_state() and dropping the kernel doc
> header since making them static means they're no longer helper
> functions.

Please note that static functions may still benefit from documentation.
In this specific case the documentation can probably be dropped, but if
other functions have useful comments, please keep them.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
