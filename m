Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A53B7511823
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 15:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA2610EB71;
	Wed, 27 Apr 2022 13:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8A810EB71
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 13:10:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 124B330B;
 Wed, 27 Apr 2022 15:10:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1651065057;
 bh=i2uclXUrfQLwDu1iiq+C9aTY3dK8CXN+ho6uH/lsmqo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dJDrYQiUAtHijQ9VyBoWdtxporEh6I3QwjCwI9VMNlJhFJWk/LXfMpw3ACrJfqc5J
 ndvLVQ2bCdD0ojXfD67FAsqIx+/UyfZi7gu0vslwhJfXhAntg4EerJFNwbQeWGq7Dv
 Ox5AYAvmbGl7008LPJ9RmhTQB7RLlCgjDDBQNcb4=
Date: Wed, 27 Apr 2022 16:10:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
Message-ID: <YmlA4EowtyMhIoic@pendragon.ideasonboard.com>
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <20220420231230.58499-2-bjorn.andersson@linaro.org>
 <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
 <20220421082358.ivpmtak3ednvddrc@houat>
 <YmEdAVwZuA7Wo1Ch@aptenodytes> <YmelPCcWCCjALtRU@aptenodytes>
 <YmfYi5G7hMKLAH3T@pendragon.ideasonboard.com>
 <YmfoiD0r8MD/kr1N@aptenodytes>
 <20220426125401.yyrhg6aeafdjw4ad@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220426125401.yyrhg6aeafdjw4ad@houat>
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
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 02:54:01PM +0200, Maxime Ripard wrote:
> On Tue, Apr 26, 2022 at 02:41:44PM +0200, Paul Kocialkowski wrote:
> > On Tue 26 Apr 22, 14:33, Laurent Pinchart wrote:
> > > On Tue, Apr 26, 2022 at 09:54:36AM +0200, Paul Kocialkowski wrote:
> > > > On Thu 21 Apr 22, 10:59, Paul Kocialkowski wrote:
> > > > > On Thu 21 Apr 22, 10:23, Maxime Ripard wrote:
> > > > > > On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrote:
> > > > > > > + Linus
> > > > > > > + Marek
> > > > > > > + Laurent
> > > > > > > + Robert
> > > > > > > 
> > > > > > > On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson wrote:
> > > > > > > >
> > > > > > > > Commit '80253168dbfd ("drm: of: Lookup if child node has panel or
> > > > > > > > bridge")' attempted to simplify the case of expressing a simple panel
> > > > > > > > under a DSI controller, by assuming that the first non-graph child node
> > > > > > > > was a panel or bridge.
> > > > > > > >
> > > > > > > > Unfortunately for non-trivial cases the first child node might not be a
> > > > > > > > panel or bridge.  Examples of this can be a aux-bus in the case of
> > > > > > > > DisplayPort, or an opp-table represented before the panel node.
> > > > > > > >
> > > > > > > > In these cases the reverted commit prevents the caller from ever finding
> > > > > > > > a reference to the panel.
> > > > > > > >
> > > > > > > > This reverts commit '80253168dbfd ("drm: of: Lookup if child node has
> > > > > > > > panel or bridge")', in favor of using an explicit graph reference to the
> > > > > > > > panel in the trivial case as well.
> > > > > > > 
> > > > > > > This eventually breaks many child-based devm_drm_of_get_bridge
> > > > > > > switched drivers.  Do you have any suggestions on how to proceed to
> > > > > > > succeed in those use cases as well?
> > > > > > 
> > > > > > I guess we could create a new helper for those, like
> > > > > > devm_drm_of_get_bridge_with_panel, or something.
> > > > > 
> > > > > Oh wow I feel stupid for not thinking about that.
> > > > > 
> > > > > Yeah I agree that it seems like the best option.
> > > > 
> > > > Should I prepare a patch with such a new helper?
> > > > 
> > > > The idea would be to keep drm_of_find_panel_or_bridge only for the of graph
> > > > case and add one for the child node case, maybe:
> > > > drm_of_find_child_panel_or_bridge.
> > > > 
> > > > I really don't have a clear idea of which driver would need to be switched
> > > > over though. Could someone (Jagan?) let me know where it would be needed?
> > > > 
> > > > Are there cases where we could both expect of graph and child node?
> > > > (i.e. does the new helper also need to try via of graph?)
> > > 
> > > I still think we should use OF graph uncondtionally, even in the DSI
> > > case. We need to ensure backward-compatibility, but I'd like new
> > > bindings (and thus new drivers) to always use OF graph.
> > 
> > I just went over the thread on "drm: of: Improve error handling in bridge/panel
> > detection" again and I'm no longer sure there's actually still an issue that
> > stands, with the fix that allows returning -ENODEV when possible.
> > 
> > The remaining issue that was brought up was with a connector node, but it should
> > be up to the driver to detect that and avoid calling drm_of_find_panel_or_bridge
> > in such situations.
> > 
> > So with that in mind it feels like the child node approach can be viable
> > (and integrated in the same helper).
> > 
> > We might still want to favor an explicit OF graph approach, but note that
> > dsi-controller.yaml also specifies extra properties that are specific to
> > MIPI DSI and I'm not sure there are equivalent definitions for the OF graph
> > approach.
> > 
> > What do you think?
> 
> I don't think Laurent's point was to move the child node away from its
> DSI controller, that part doesn't make much sense. The panel or bridge
> is still accessed through the DSI bus, so it very much belongs there.
> 
> What he meant I think was that we mandate the OF graph for all panels,
> so for panels/bridges controlled through DCS, you would still list the
> output through the graph.

That's right. A DCS panel would still be a child of the DSI controller.

-- 
Regards,

Laurent Pinchart
