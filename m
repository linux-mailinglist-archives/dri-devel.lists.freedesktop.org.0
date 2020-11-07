Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A37602AA84E
	for <lists+dri-devel@lfdr.de>; Sat,  7 Nov 2020 23:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CD86E0AA;
	Sat,  7 Nov 2020 22:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892546E0AA
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Nov 2020 22:39:34 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 227242001E;
 Sat,  7 Nov 2020 23:39:32 +0100 (CET)
Date: Sat, 7 Nov 2020 23:39:30 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH v2 06/16] drm/exynos: shift register values to fields on
 write
Message-ID: <20201107223930.GE1052534@ravnborg.org>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
 <20200911135413.3654800-7-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911135413.3654800-7-m.tretter@pengutronix.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8 a=vnREMb7VAAAA:8 a=VwQbUJbxAAAA:8
 a=p7nbUh97NmR1ihCDxR4A:9 a=CjuIK1q_8ugA:10 a=AbAUZ8qAyYyZVLSsDulk:22
 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 narmstrong@baylibre.com, Adrian Ratiu <adrian.ratiu@collabora.com>,
 b.zolnierkie@samsung.com, sw0312.kim@samsung.com,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com, krzk@kernel.org,
 kernel@pengutronix.de, sylvester.nawrocki@gmail.com,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael.

On Fri, Sep 11, 2020 at 03:54:03PM +0200, Michael Tretter wrote:
> The phy timings are already shifted to the field position. If the driver
> is reused on multiple platforms, this exposes the field positions to the
> platform code.
> 
> Store only the timing values in the platform data and shift the value to
> the field when writing the fields to the registers.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

This and the following patch smells like the regmap functionality is
partly open coded. regmaps supports defining different register layouts
and select the correct layout at runtime.

See for example:
https://www.collabora.com/news-and-blog/blog/2020/05/27/using-regmaps-to-make-linux-drivers-more-generic/
or
https://www.youtube.com/watch?v=0RPDGANArFc

Some parts is not a perfect fit - but using regmaps will make it better
as a general and well-known solution is used.

@Adrian - see https://lore.kernel.org/dri-devel/20200911135413.3654800-1-m.tretter@pengutronix.de/T/#m8e211c8cce915168cf2b8c4eef1c7ec9b8447af8
for the original patch.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
