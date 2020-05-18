Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D5F1D8322
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 20:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF80089E38;
	Mon, 18 May 2020 18:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0164.hostedemail.com
 [216.40.44.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E3889C6A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 18:03:16 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id BA469837F24C;
 Mon, 18 May 2020 18:03:15 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:960:968:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2693:2828:2899:3138:3139:3140:3141:3142:3352:3622:3865:3867:3871:3873:4321:5007:7903:7974:8660:10004:10400:10848:11026:11232:11657:11658:11914:12043:12048:12296:12297:12740:12760:12895:13069:13148:13230:13311:13357:13439:14659:14721:21080:21627:21990:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: help47_9096ad8ae3547
X-Filterd-Recvd-Size: 2150
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf16.hostedemail.com (Postfix) with ESMTPA;
 Mon, 18 May 2020 18:03:13 +0000 (UTC)
Message-ID: <8007a07f354b9f5ff714914f3696e185078c27c3.camel@perches.com>
Subject: Re: [PATCH] drm/exynos: Remove dev_err() on platform_get_irq() failure
From: Joe Perches <joe@perches.com>
To: Tamseel Shams <m.shams@samsung.com>, inki.dae@samsung.com, 
 jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 airlied@linux.ie, daniel@ffwll.ch
Date: Mon, 18 May 2020 11:03:12 -0700
In-Reply-To: <20200518172708.48600-1-m.shams@samsung.com>
References: <CGME20200518174120epcas5p1fb5f832c7874a9d367eb9c9ea4e69d53@epcas5p1.samsung.com>
 <20200518172708.48600-1-m.shams@samsung.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
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
Cc: linux-samsung-soc@vger.kernel.org, shaik.ameer@samsung.com,
 linux-kernel@vger.kernel.org, krzk@kernel.org, dri-devel@lists.freedesktop.org,
 alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-05-18 at 22:57 +0530, Tamseel Shams wrote:
> platform_get_irq() will call dev_err() itself on failure,
> so there is no need for the driver to also do this.
> This is detected by coccinelle.

trivia:

> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
[]
> @@ -1810,7 +1810,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>  
>  	dsi->irq = platform_get_irq(pdev, 0);
>  	if (dsi->irq < 0) {
> -		dev_err(dev, "failed to request dsi irq resource\n");
>  		return dsi->irq;
>  	}

You could also remove the now atypical braces

	if (dsi->irq < 0)
		return dsi->irq;

> diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
[]
> @@ -294,7 +294,6 @@ static int rotator_probe(struct platform_device *pdev)
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0) {
> -		dev_err(dev, "failed to get irq\n");
>  		return irq;
>  	}

etc...


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
