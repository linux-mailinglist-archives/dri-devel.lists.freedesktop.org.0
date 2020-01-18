Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F8B141794
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 14:04:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AB36E06B;
	Sat, 18 Jan 2020 13:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3226E06B
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 13:04:23 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3BB9820038;
 Sat, 18 Jan 2020 14:04:20 +0100 (CET)
Date: Sat, 18 Jan 2020 14:04:18 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: Re: [PATCH 1/3] drm/panel: make LVDS panel driver DPI capable
Message-ID: <20200118130418.GA13417@ravnborg.org>
References: <20200115123401.2264293-1-oleksandr.suvorov@toradex.com>
 <20200115123401.2264293-2-oleksandr.suvorov@toradex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115123401.2264293-2-oleksandr.suvorov@toradex.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=m8ToADvmAAAA:8
 a=paNtN77jAlIXY0rMc8MA:9 a=CjuIK1q_8ugA:10 a=kCrBFHLFDAq2jDEeoMj9:22
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
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Igor Opanyuk <igor.opanyuk@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Oleksandr & Stafan.

Thanks for the update to panel-lvds.


On Wed, Jan 15, 2020 at 12:34:17PM +0000, Oleksandr Suvorov wrote:
> From: Stefan Agner <stefan@agner.ch>
> 
> The LVDS panel driver has almost everything which is required to
> describe a simple parallel RGB panel (also known as DPI, Display
> Pixel Interface).
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> ---

There are a few high-level things we need to have sorted out.

The driver, when this patch is added, assumes that certain properties
are now mandatory when using the panel-dpi compatible.
  - data-mapping
  - width-mm
  - height-mm
  - panel-timing

But this does not match the panel-dpi binding.
So we need the panel-dpi binding updated first.


The current driver specify the connector type in drm_panel_init().
But a DPI panel is assumed to use a DRM_MODE_CONNECTOR_DPI,
and not a DRM_MODE_CONNECTOR_LVDS.
So the drm_panel_init() call needs to take into account the type
of binding.


> @@ -257,7 +279,7 @@ static struct platform_driver panel_lvds_driver = {
>  	.probe		= panel_lvds_probe,
>  	.remove		= panel_lvds_remove,
>  	.driver		= {
> -		.name	= "panel-lvds",
> +		.name	= "panel-generic",

I think changing the name of the driver like this is an UAPI change,
which is not OK

>  		.of_match_table = panel_lvds_of_table,
>  	},
>  };

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
