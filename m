Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B084BCD7C
	for <lists+dri-devel@lfdr.de>; Sun, 20 Feb 2022 11:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AC310F72B;
	Sun, 20 Feb 2022 10:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9307810F72B
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 10:04:48 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 87e2d19b-9234-11ec-9faa-0050568c148b;
 Sun, 20 Feb 2022 10:04:45 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 733EC194B46;
 Sun, 20 Feb 2022 11:04:46 +0100 (CET)
Date: Sun, 20 Feb 2022 11:04:42 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v4 3/3] drm/tiny: Add MIPI DBI compatible SPI driver
Message-ID: <YhISOrwTYsn2w6zo@ravnborg.org>
References: <20220218151110.11316-1-noralf@tronnes.org>
 <20220218151110.11316-4-noralf@tronnes.org>
 <YhFqxklH9hsLrI1X@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhFqxklH9hsLrI1X@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Noralf,

> > +static int panel_mipi_dbi_get_mode(struct mipi_dbi_dev *dbidev, struct drm_display_mode *mode)
> > +{
> > +	struct device *dev = dbidev->drm.dev;
> > +	u32 width_mm = 0, height_mm = 0;
> > +	struct display_timing timing;
> > +	struct videomode vm;
> > +	int ret;
> > +
> > +	ret = of_get_display_timing(dev->of_node, "panel-timing", &timing);
> > +	if (ret) {
> > +		dev_err(dev, "%pOF: failed to get panel-timing (error=%d)\n", dev->of_node, ret);
> > +		return ret;
> > +	}
> > +
> > +	videomode_from_timing(&timing, &vm);
> > +
> > +	if (!vm.hactive || vm.hfront_porch || vm.hsync_len ||
> > +	    (vm.hback_porch + vm.hactive) > 0xffff ||
> > +	    !vm.vactive || vm.vfront_porch || vm.vsync_len ||
> > +	    (vm.vback_porch + vm.vactive) > 0xffff ||
> > +	    vm.flags) {
> > +		dev_err(dev, "%pOF: panel-timing out of bounds\n", dev->of_node);
> > +		return -EINVAL;
> > +	}
> We should have a helper that implements this. Maybe the display_timing
> => display_mode helper could do it.

It would be nice with a drm_display_timing_to_mode() but that can come
later - the comment above should not be understood that I consider it
mandatory for this driver.

	Sam
