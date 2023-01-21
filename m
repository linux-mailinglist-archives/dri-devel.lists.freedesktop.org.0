Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE62676556
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 09:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A6610E2A0;
	Sat, 21 Jan 2023 08:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E95B10E2A0
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 08:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=PMku9Ie1l3L3qO6PU2vQCU4slZtEiI5gya10fYincsk=;
 b=NB7XK+7t6EwJmM4IvdwibIBfqtusl1AHiDAo6WgjBhArhnNcAwPmVRZLB5OH993CLp4zyxJDDnI9t
 RehRO0Wr/jm4NsrQs+HMCHp3ww7x1/jIY020uEkhpW5iFQt07rxOwz3Hwtgi/Wt+fCNlQ3ErhLiW2m
 7MMDQVg4dF68hSZcRJY3tdBkWL6ia6EMpvpqY0llf1P/YFwbn/AYZF/0KQZpyWZmI7Z5EnovxOFGqb
 8tFR4qqApuF7Yd0rTTCuPn0od5vWwJwtR+c12PIHyT6ZjXNpA05oQiaOgqn+Vf+juMsli8ZBy7NgOk
 zOo2z811CVPHMzeIOaWAhY+e907HAtw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=PMku9Ie1l3L3qO6PU2vQCU4slZtEiI5gya10fYincsk=;
 b=MDx0FrRzUs/XS2boi3BgiXRfEotq4sSTAD3kH9N/OzOjWO/ADxVd3LlClBEMrWmYA2xZux1wEJwIi
 3cT8qTXCg==
X-HalOne-ID: 9bb0cfb3-9969-11ed-8286-cde5ad41a1dd
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id 9bb0cfb3-9969-11ed-8286-cde5ad41a1dd;
 Sat, 21 Jan 2023 08:57:19 +0000 (UTC)
Date: Sat, 21 Jan 2023 09:57:18 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/bridge: panel: Set orientation on panel_bridge
 connector
Message-ID: <Y8uo7vIcQ6caH9pu@ravnborg.org>
References: <20230120114313.2087015-1-john@metanate.com>
 <CAD=FV=UPD6c+NY8Ub37N7LmrRFpcr6gKOh0Os14DaKrf3bKo2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=UPD6c+NY8Ub37N7LmrRFpcr6gKOh0Os14DaKrf3bKo2A@mail.gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John/Douglas.

On Fri, Jan 20, 2023 at 01:44:38PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Fri, Jan 20, 2023 at 3:43 AM John Keeping <john@metanate.com> wrote:
> >
> > Commit 15b9ca1641f0 ("drm: Config orientation property if panel provides
> > it") added a helper to set the panel panel orientation early but only
> > connected this for drm_bridge_connector, which constructs a panel bridge
> > with DRM_BRIDGE_ATTACH_NO_CONNECTOR and creates the connector itself.
> >
> > When the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is not specified and the
> > panel_bridge creates its own connector the orientation is not set unless
> > the panel does it in .get_modes which is too late and leads to a warning
> > splat from __drm_mode_object_add() because the device is already
> > registered.
> >
> > Call the necessary function to set add the orientation property when the
> > connector is created so that it is available before the device is
> > registered.
> 
> I have no huge objection to your patch and it looks OK to me. That
> being said, my understanding is that:
> 
> 1. DRM_BRIDGE_ATTACH_NO_CONNECTOR is "the future" and not using the
> flag is "deprecated".
Correct.
Could we take a look at how much is required to move the relevant driver
to use DRM_BRIDGE_ATTACH_NO_CONNECTOR?

If this is too much work now we may land this simple patch, but the
preference is to move all drivers to the new bridge handling and thus
asking display drivers to create the connector.

What display driver are we dealing with here?

	Sam
