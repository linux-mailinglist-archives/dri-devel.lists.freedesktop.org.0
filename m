Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67336141F2A
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jan 2020 18:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641726E421;
	Sun, 19 Jan 2020 17:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B42F6E421
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2020 17:16:02 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D241520020;
 Sun, 19 Jan 2020 18:15:56 +0100 (CET)
Date: Sun, 19 Jan 2020 18:15:55 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 0/5] drm: Add support for Okaya RH128128T
Message-ID: <20200119171555.GA31055@ravnborg.org>
References: <20200115124548.3951-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115124548.3951-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=I7rRU4mLAAAA:8
 a=VwQbUJbxAAAA:8 a=7xOLcxuHRxORoo7z8OsA:9 a=CjuIK1q_8ugA:10
 a=zVIc4Sw0WK5ZSny7osSx:22 a=AjGcO6oz07-iQ99wixmX:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=jd6J4Gguk5HxikPWLKER:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Lechner <david@lechnology.com>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Chris Brandt <chris.brandt@renesas.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert.

On Wed, Jan 15, 2020 at 01:45:43PM +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series adds support for the Okaya RH128128T LCD to the
> existing ST7735R driver.  This is a 128x128 1.4" TFT display driven by a
> Sitronix ST7715R TFT Controller/Driver.  It is used on e.g. the Renesas
> YRSK-LCD-PMOD extension board, which is shipped with Renesas RSK+RZA1
> development boards[1], and with several other Renesas starter kits, for
> RX, Synergy, and RZ/T1 MCUs and SoCs.
> 
> Changes compared to v1[2]:
>   - Convert DT bindings to DT schema,
>   - Add YRSK-LCD-PMOD reference and links,
>   - Add Reviewed-by,
>   - Split driver preparation and adding actual support in two separate
>     patches,
>   - Replace st7735r_priv.rgb by a pointer to struct st7735r_cfg,
>   - Change prefix of jd_t18003_t01_pipe_enable() and
>     jd_t18003_t01_pipe_funcs(),
>   - Update Kconfig help text,
>   - Improve file comment header.
> 
> This has been tested using the r7s72100-rskrza1-pmod-spi.dtso and
> r7s72100-rskrza1-pmod2-lcd.dtso DT overlays[3].
> Note that for using this on RSK+RZA1, there is a dependency on RSPI
> cs-gpios support (now in linux-next).
> With DT overlays, this also depends on DT overlays[4] and gpio-hog
> overlay support[5].
> 
> Thanks!
> 
> [1] https://renesasrulz.com/the_vault/f/archive-forum/4981/upgrading-to-the-renesas-rz-a1h
> [1] https://lore.kernel.org/dri-devel/20200102141246.370-1-geert+renesas@glider.be/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/overlays
> [5] "[PATCH/RFC 0/2] gpio: of: Add DT overlay support for GPIO hogs"
>     https://lore.kernel.org/lkml/20191230133852.5890-1-geert+renesas@glider.be/
> 
> Geert Uytterhoeven (5):
>   dt-bindings: display: sitronix,st7735r: Convert to DT schema
>   dt-bindings: display: sitronix,st7735r: Add Okaya RH128128T
>   drm/mipi_dbi: Add support for display offsets
>   drm: tiny: st7735r: Prepare for adding support for more displays
>   drm: tiny: st7735r: Add support for Okaya RH128128T

Thanks, it ended up with a nice small patch adding support for
another controller/panel combo to this driver.
All 5 patches applied to drm-misc-next.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
