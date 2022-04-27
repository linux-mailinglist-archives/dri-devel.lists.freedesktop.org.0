Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4084851181E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 15:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8588810F463;
	Wed, 27 Apr 2022 13:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663CE10F45E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 13:10:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 538EC30B;
 Wed, 27 Apr 2022 15:10:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1651065014;
 bh=JAZobPiVE1XENl+KRj+bL9U8OuARgC0UTHGiOLvnliY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rkk+zeHE00lUOzymjDjdK2IOD821KYy+66vwHkrktQxffDOOOmkHWhVCSTVOie9Lt
 15T/IOFgSTWuxRfZgv533D1ISRlP2l/aVoPAmoZa6G+bFU45bAlH5F9nQOkObumo1V
 WFDG5fhV5/9V7Q72CtheDPei+LXoemy97EVem60A=
Date: Wed, 27 Apr 2022 16:10:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
Message-ID: <YmlAtUTJiBrsFBN3@pendragon.ideasonboard.com>
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <20220420231230.58499-2-bjorn.andersson@linaro.org>
 <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
 <20220421082358.ivpmtak3ednvddrc@houat>
 <CAMty3ZCLEMv4cqUcUGUAkLtH8tmh1WO582cDjZWynAifZJy=_w@mail.gmail.com>
 <CAMty3ZAkw0rssCzR_ka7U9JeoGxJr5JPM7GWDfd1dob9goL-BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMty3ZAkw0rssCzR_ka7U9JeoGxJr5JPM7GWDfd1dob9goL-BQ@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 27, 2022 at 05:22:32PM +0530, Jagan Teki wrote:
> On Wed, Apr 27, 2022 at 12:29 PM Jagan Teki wrote:
> > On Thu, Apr 21, 2022 at 1:54 PM Maxime Ripard wrote:
> > > On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrote:
> > > > + Linus
> > > > + Marek
> > > > + Laurent
> > > > + Robert
> > > >
> > > > On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson
> > > > <bjorn.andersson@linaro.org> wrote:
> > > > >
> > > > > Commit '80253168dbfd ("drm: of: Lookup if child node has panel or
> > > > > bridge")' attempted to simplify the case of expressing a simple panel
> > > > > under a DSI controller, by assuming that the first non-graph child node
> > > > > was a panel or bridge.
> > > > >
> > > > > Unfortunately for non-trivial cases the first child node might not be a
> > > > > panel or bridge.  Examples of this can be a aux-bus in the case of
> > > > > DisplayPort, or an opp-table represented before the panel node.
> > > > >
> > > > > In these cases the reverted commit prevents the caller from ever finding
> > > > > a reference to the panel.
> > > > >
> > > > > This reverts commit '80253168dbfd ("drm: of: Lookup if child node has
> > > > > panel or bridge")', in favor of using an explicit graph reference to the
> > > > > panel in the trivial case as well.
> > > >
> > > > This eventually breaks many child-based devm_drm_of_get_bridge
> > > > switched drivers.  Do you have any suggestions on how to proceed to
> > > > succeed in those use cases as well?
> > >
> > > I guess we could create a new helper for those, like
> > > devm_drm_of_get_bridge_with_panel, or something.
> >
> > I think using the same existing helper and updating child support is
> > make sense, as there is a possibility to use the same host for child
> > and OF-graph bindings.
> >
> > I can see two possible solutions (as of now)
> >
> > 1. adding "dcs-child-type" bindings for child-based panel or bridge
> > 2. iterate child and skip those nodes other than panel or bridge. or
> > iterate sub-child to find it has a panel or bridge-like aux-bus (which
> > is indeed hard as this configuration seems not 'standard' i think )
> >
> > Any inputs?
> 
> Checking aux-bus with the sub-node panel can be a possible check to
> look at it, any comments?

Can we stop piling hacks and move towards OF graph everywhere, please ?

> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -244,6 +244,25 @@ int drm_of_find_panel_or_bridge(const struct
> device_node *np,
>         if (panel)
>                 *panel = NULL;
> 
> +       /**
> +        * Devices can also be child nodes when we also control that device
> +        * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
> +        *
> +        * Lookup for a child node of the given parent that isn't either port
> +        * or ports.
> +        */
> +       for_each_available_child_of_node(np, remote) {
> +               if (of_node_name_eq(remote, "port") ||
> +                   of_node_name_eq(remote, "ports"))
> +                       continue;
> +
> +               if (!(of_node_name_eq(remote, "aux-bus") &&
> +                     of_get_child_by_name(remote, "panel")))
> +                       continue;
> +
> +               goto of_find_panel_or_bridge;
> +       }
> +
>         /*
>          * of_graph_get_remote_node() produces a noisy error message if port
>          * node isn't found and the absence of the port is a legit case here,
> @@ -254,6 +273,8 @@ int drm_of_find_panel_or_bridge(const struct
> device_node *np,
>                 return -ENODEV;
> 
>         remote = of_graph_get_remote_node(np, port, endpoint);
> +
> +of_find_panel_or_bridge:
>         if (!remote)
>                 return -ENODEV;

-- 
Regards,

Laurent Pinchart
