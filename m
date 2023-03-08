Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BE56B166F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 00:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E468110E74F;
	Wed,  8 Mar 2023 23:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E06410E74F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 23:22:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E31EC589;
 Thu,  9 Mar 2023 00:22:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1678317741;
 bh=OvYkLln4oTsPQT9Sd/Mtb18XUdL2TRipkagIUlKfwwg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oSvjQx+fEim2xkXtgmyed7ajvnP4E8RPlJk2FD1pm0Li0qaEQyj2OSKIWIEr586Fz
 pcdkF34t42GP8i9qtPkVVP/V6Xc7rVjrJNkM0Eu5IwYM2xoMqDXLAEcL8exJmF45Vb
 Fzeiaen0yfWREkvtGQjo91kQXbGCAjcTbALoxjFg=
Date: Thu, 9 Mar 2023 01:22:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: David Binderman <dcb314@hotmail.com>
Subject: Re: drivers/gpu/drm/bridge/fsl-ldb.c:101: possible loss of
 information.
Message-ID: <20230308232224.GG31765@pendragon.ideasonboard.com>
References: <DB6P189MB0568FCA97758B820EAC036989CB79@DB6P189MB0568.EURP189.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DB6P189MB0568FCA97758B820EAC036989CB79@DB6P189MB0568.EURP189.PROD.OUTLOOK.COM>
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 04:45:24PM +0000, David Binderman wrote:
> Hello there,
> 
> I just ran the static analyser "cppcheck" over the source code of
> linux-6.2-rc1. It said:
> 
> linux-6.3-rc1/drivers/gpu/drm/bridge/fsl-ldb.c:101:3: style: int
> result is returned as long value. If the return value is long to avoid
> loss of information, then you have loss of information.
> [truncLongCastReturn]
> 
> Source code is
> 
> static unsigned long fsl_ldb_link_frequency(struct fsl_ldb *fsl_ldb, int clock)
> {
>     if (fsl_ldb->lvds_dual_link)
>         return clock * 3500;
>     else
>         return clock * 7000;
> }
> 
> Depending on the range of the value of clock, maybe unsigned long
> literals, like 3500UL, should have been used ?

We could, but I don't think it will make any difference in practice as
the maximum pixel clock frequency supported by the SoC is 80MHz (per
LVDS channel). That would result in a 560MHz frequency returned by this
function, well below the 31 bits limit.

-- 
Regards,

Laurent Pinchart
