Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E554C4D5AA5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 06:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635BC10E24B;
	Fri, 11 Mar 2022 05:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C9D10E24B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 05:33:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66688488;
 Fri, 11 Mar 2022 06:33:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646976799;
 bh=gueVitUOlpEQaw4iJXl9J+GRsoDm2YYP2bcyEriYYYA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=DSoei2i9GzbD1c1wdclVdle9ilW923JsGoZmScBPsH+6BwilJkC2TPuG4FfZxVDSe
 LvdK4Njguz1pAKB04SDkZxlzh/QBzJKgIrK4Ua/+uaH26f9hsa6wPivPb3/yh3lWcN
 wscdtu4Ilv+BI71Tr22PXemrtNeVx7Qs4sok3aVw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=U3fLvixpJfGxzmJd89+yVEDgbNYPsfJtq92QObUxw=3A@mail.gmail.com>
References: <20220310152227.2122960-1-kieran.bingham+renesas@ideasonboard.com>
 <CAD=FV=U3fLvixpJfGxzmJd89+yVEDgbNYPsfJtq92QObUxw=3A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/bridge: ti-sn65dsi86: Support non-eDP
 DisplayPort connectors
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
Date: Fri, 11 Mar 2022 05:33:17 +0000
Message-ID: <164697679727.2392702.14118780429285364281@Monstersaurus>
User-Agent: alot/0.10
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug, Sam,

Quoting Doug Anderson (2022-03-10 23:21:38)
> Hi,
>=20
> On Thu, Mar 10, 2022 at 7:22 AM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
> >
> > Implement support for non eDP connectors on the TI-SN65DSI86 bridge, and
> > provide IRQ based hotplug detect to identify when the connector is
> > present.
> >
> > no-hpd is extended to be the default behaviour for non DisplayPort
> > connectors.
> >
> > This series is based upon Sam Ravnborgs and Rob Clarks series [0] to
> > support DRM_BRIDGE_STATE_OPS and NO_CONNECTOR support on the SN65DSI86,
> > however some extra modifications have been made on the top of Sam's
> > series to fix compile breakage and the NO_CONNECTOR support.
>=20
> This confused me a little bit. As far as I know Rob's series is
> abandoned and he's not working on it. I assume that Sam will
> eventually re-post his series, but it had unsolved problems and the
> bpp solution he had totally didn't work because nobody was setting
> "output_bus_cfg.format" [1]. Did you solve that? ...or you're just
> going to let your patches sit there and hope that Sam will solve the
> problem and re-post his series?

I applied Sam's series, and fixed it to work for me. It looked like
Rob's patch had been rolled into Sam's series, and I didn't take
ownership of Sam's series, as I assume he'll continue on it, but I
haven't asked or heard either way yet. Sam's series is only from
February, so I would not presume to consider that it is abandoned yet.

The changes I made have either already been highlighted by the build
bots on Sam's series, or I have replied to his series with the fixes I
made.

> I'll admit I didn't go through your git tree to figure out if you
> solved it some way. If you did, I would have assumed you'd have
> re-posted his patches in your series w/ the solution...

My changes to his series are on my branch as separate squash: commits so
they're easy to see or take if Sam wants to collect the fixes, but
there's nothing complex there, that isn't easily solved locally.

If Sam's series is abandoned, then I guess my 'Implement SN65DSI86 IRQ
HPD' patch will now have a 11:1 ratio of patches that I have to take
custodianship of vs author myself ;-) (And even most of the work I have
done has been squashed into Laurent's patches already)

Sam, What is your plan on your series at [1], are you still actively
planning to work on it?

--
Kieran


> [1] https://lore.kernel.org/r/CAD=3DFV=3DWW6HWLOD9AzTpjwva9UHY=3DAR+LABEW=
qJQznz6Nbb4sOw@mail.gmail.com/
>=20
> -Doug
