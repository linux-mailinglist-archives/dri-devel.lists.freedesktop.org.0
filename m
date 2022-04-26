Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E98F250FC03
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 13:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B763B10E818;
	Tue, 26 Apr 2022 11:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D836C10E818
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 11:33:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C71D3487;
 Tue, 26 Apr 2022 13:33:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1650972812;
 bh=x0u0Pc7FPhAWSn7VfEpmqZSQUGOs2PWVzeM3l1YkXN4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vHTox3YtR2pMYrN9xkkLGM6scoJ3J8KQlxC/pE11PRv2EBPvTFIZzdku9HEDl8X1l
 nYAtBumbnoIs8/FmsTsUo3Yn54QqR7T1P2Iuhm+S8heezP8omNUoywsMhSsi8E15Nl
 KD9qaROtYbqBUgZpdn401N/V+LQBc6MO9i9Iq764=
Date: Tue, 26 Apr 2022 14:33:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
Message-ID: <YmfYi5G7hMKLAH3T@pendragon.ideasonboard.com>
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <20220420231230.58499-2-bjorn.andersson@linaro.org>
 <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
 <20220421082358.ivpmtak3ednvddrc@houat>
 <YmEdAVwZuA7Wo1Ch@aptenodytes> <YmelPCcWCCjALtRU@aptenodytes>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YmelPCcWCCjALtRU@aptenodytes>
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
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 09:54:36AM +0200, Paul Kocialkowski wrote:
> On Thu 21 Apr 22, 10:59, Paul Kocialkowski wrote:
> > On Thu 21 Apr 22, 10:23, Maxime Ripard wrote:
> > > On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrote:
> > > > + Linus
> > > > + Marek
> > > > + Laurent
> > > > + Robert
> > > > 
> > > > On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson wrote:
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
> > Oh wow I feel stupid for not thinking about that.
> > 
> > Yeah I agree that it seems like the best option.
> 
> Should I prepare a patch with such a new helper?
> 
> The idea would be to keep drm_of_find_panel_or_bridge only for the of graph
> case and add one for the child node case, maybe:
> drm_of_find_child_panel_or_bridge.
> 
> I really don't have a clear idea of which driver would need to be switched
> over though. Could someone (Jagan?) let me know where it would be needed?
> 
> Are there cases where we could both expect of graph and child node?
> (i.e. does the new helper also need to try via of graph?)

I still think we should use OF graph uncondtionally, even in the DSI
case. We need to ensure backward-compatibility, but I'd like new
bindings (and thus new drivers) to always use OF graph.

-- 
Regards,

Laurent Pinchart
