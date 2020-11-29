Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF3D2C7B6D
	for <lists+dri-devel@lfdr.de>; Sun, 29 Nov 2020 22:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4276E0B9;
	Sun, 29 Nov 2020 21:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290686E0B9
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Nov 2020 21:41:18 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 540A220038;
 Sun, 29 Nov 2020 22:41:14 +0100 (CET)
Date: Sun, 29 Nov 2020 22:41:12 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH] drm/panel: sony-acx565akm: Fix race condition in probe
Message-ID: <20201129214112.GA1162850@ravnborg.org>
References: <20201127200429.129868-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127200429.129868-1-sebastian.reichel@collabora.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e_45YWLtAAAA:8 a=sozttTNsAAAA:8 a=2KMo9-giAAAA:8
 a=pGLkceISAAAA:8 a=_ua-DJzVAAAA:8 a=P1BnusSwAAAA:8 a=QX4gbG5DAAAA:8
 a=BQNQBjKwHnm-onN-rZIA:9 a=CjuIK1q_8ugA:10 a=YCHTv42QAwKFWVm3vSJu:22
 a=aeg5Gbbo78KNqacMgKqU:22 a=UeCTMeHK7YUBiLmz_SX7:22
 a=Rns7OpQVW6Hshu8udh8j:22 a=D0XLA9XvdZm18NrgonBM:22
 a=AbAUZ8qAyYyZVLSsDulk:22
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
Cc: kernel@collabora.com, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Merlijn Wajer <merlijn@wizzup.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Jarkko Nikula <jarkko.nikula@bitmer.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,
On Fri, Nov 27, 2020 at 09:04:29PM +0100, Sebastian Reichel wrote:
> The probe routine acquires the reset GPIO using GPIOD_OUT_LOW. Directly
> afterwards it calls acx565akm_detect(), which sets the GPIO value to
> HIGH. If the bootloader initialized the GPIO to HIGH before the probe
> routine was called, there is only a very short time period of a few
> instructions where the reset signal is LOW. Exact time depends on
> compiler optimizations, kernel configuration and alignment of the stars,
> but I expect it to be always way less than 10us. There are no public
> datasheets for the panel, but acx565akm_power_on() has a comment with
> timings and reset period should be at least 10us. So this potentially
> brings the panel into a half-reset state.
> 
> The result is, that panel may not work after boot and can get into a
> working state by re-enabling it (e.g. by blanking + unblanking), since
> that does a clean reset cycle. This bug has recently been hit by Ivaylo
> Dimitrov, but there are some older reports which are probably the same
> bug. At least Tony Lindgren, Peter Ujfalusi and Jarkko Nikula have
> experienced it in 2017 describing the blank/unblank procedure as
> possible workaround.
> 
> Note, that the bug really goes back in time. It has originally been
> introduced in the predecessor of the omapfb driver in 3c45d05be382
> ("OMAPDSS: acx565akm panel: handle gpios in panel driver") in 2012.
> That driver eventually got replaced by a newer one, which had the bug
> from the beginning in 84192742d9c2 ("OMAPDSS: Add Sony ACX565AKM panel
> driver") and still exists in fbdev world. That driver has later been
> copied to omapdrm and then was used as a basis for this driver. Last
> but not least the omapdrm specific driver has been removed in
> 45f16c82db7e ("drm/omap: displays: Remove unused panel drivers").
> 
> Reported-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
> Reported-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Reported-by: Tony Lindgren <tony@atomide.com>
> Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Reported-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Fixes: 1c8fc3f0c5d2 ("drm/panel: Add driver for the Sony ACX565AKM panel")
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>


Fixed up the commit references, added Tested-by (impressive list) and
committed to drm-misc-fixes.

Commit references shall look like this:

    commit 84192742d9c2 ("OMAPDSS: Add Sony ACX565AKM panel driver")

The word commit is required according to dim (the tool we use for
drm-misc maintenance).

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
