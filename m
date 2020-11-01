Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 893A12A2084
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861746EB48;
	Sun,  1 Nov 2020 17:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594C66EB25
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 17:37:46 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id BFF278048A;
 Sun,  1 Nov 2020 18:37:42 +0100 (CET)
Date: Sun, 1 Nov 2020 18:37:41 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 0/4] drm/bridge: ti-sn65dsi86: Support EDID reading
Message-ID: <20201101173741.GA1293305@ravnborg.org>
References: <20201030011738.2028313-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030011738.2028313-1-swboyd@chromium.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=cm27Pg_UAAAA:8 a=P1BnusSwAAAA:8
 a=RwHePtW7AAAA:8 a=e5mUnYsNAAAA:8 a=umv6ho0nhVORNbC8ZGUA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=xmb-EsYY8bH0VWELuYED:22
 a=D0XLA9XvdZm18NrgonBM:22 a=FqraQwd7dyEg5dwJgZJs:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen.

On Thu, Oct 29, 2020 at 06:17:34PM -0700, Stephen Boyd wrote:
> This patch series cleans up the DDC code a little bit so that
> it is more efficient time wise and supports grabbing the EDID
> of the eDP panel over the aux channel. I timed this on a board
> I have on my desk and it takes about 20ms to grab the EDID out
> of the panel and make sure it is valid.
> 
> The first two patches seem less controversial so I stuck them at
> the beginning. The third patch does the EDID reading and caches
> it so we don't have to keep grabbing it over and over again. And
> finally the last patch updates the reply field so that short
> reads and nacks over the channel are reflected properly instead of
> treating them as some sort of error that can't be discerned.
> 
> Stephen Boyd (4):
>   drm/bridge: ti-sn65dsi86: Combine register accesses in
>     ti_sn_aux_transfer()
>   drm/bridge: ti-sn65dsi86: Make polling a busy loop
>   drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
>   drm/bridge: ti-sn65dsi86: Update reply on aux failures

Series looks good. You can add my a-b on the full series.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

I can apply after Douglas have had a look at the patches he did not r-b
yet.

Any chance we can convince you to prepare this bridge driver for use in
a chained bridge setup where the connector is created by the display
driver and uses drm_bridge_funcs?

First step wuld be to introduce the use of a panel_bridge.
Then add get_edid to drm_bridge_funcs and maybe more helpers.

Then natural final step would be to move connector creation to the
display driver - see how other uses drm_bridge_connector_init() to do so
- it is relatively simple.

Should be doable - and reach out if you need some help.

	Sam


> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 108 ++++++++++++++++++--------
>  1 file changed, 75 insertions(+), 33 deletions(-)
> 
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Sean Paul <seanpaul@chromium.org>
> 
> base-commit: 3650b228f83adda7e5ee532e2b90429c03f7b9ec
> -- 
> Sent by a computer, using git, on the internet
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
