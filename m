Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3997428603B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 15:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B35A6E8E9;
	Wed,  7 Oct 2020 13:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2516C6E8E9
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 13:34:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 099089DA;
 Wed,  7 Oct 2020 15:34:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1602077679;
 bh=hZlEqx/vaXfkYUgExhxZr4ZIbI7/aIOnYhDz3m9bACI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fjQ6DIn+iG7bu1d5d60fVSmz/gJc+afU4oAlbJ92KpS6xhp2XaDMsix7kG/u/h8PZ
 MaJqsr2r9SmtKo88dKksdl7UP4bjoaCrFVDv3k8+FDr4m7SZu2VAVR/TgY2EDxvBcc
 f4qELifpIIlJCRXNLJz0SzUnhQMG9XHj1mJFFSnY=
Date: Wed, 7 Oct 2020 16:33:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: mxsfb: Convert binding to
 YAML
Message-ID: <20201007133357.GJ3937@pendragon.ideasonboard.com>
References: <20201007012438.27970-1-laurent.pinchart@ideasonboard.com>
 <20201007012438.27970-2-laurent.pinchart@ideasonboard.com>
 <daabffc8-24e9-4963-58a9-6c62724e7a11@denx.de>
 <bef04042ebd7dc1c744b51ab2b1c614a2f04084f.camel@pengutronix.de>
 <a8db345a-24b3-db8c-8dce-f97e021a1bf1@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8db345a-24b3-db8c-8dce-f97e021a1bf1@denx.de>
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
Cc: devicetree@vger.kernel.org,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Wed, Oct 07, 2020 at 10:55:24AM +0200, Marek Vasut wrote:
> On 10/7/20 10:43 AM, Lucas Stach wrote:
> > On Mi, 2020-10-07 at 10:32 +0200, Marek Vasut wrote:
> >> On 10/7/20 3:24 AM, Laurent Pinchart wrote:
> >> [...]
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - fsl,imx23-lcdif
> >>> +      - fsl,imx28-lcdif
> >>> +      - fsl,imx6sx-lcdif
> >>> +      - fsl,imx8mq-lcdif
> >>
> >> There is no fsl,imx8mq-lcdif in drivers/gpu/drm/mxsfb/mxsfb_drv.c,
> >> so the DT must specify compatible = "fsl,imx8mq-lcdif",
> >> "fsl,imx28-lcdif" (since imx28 is the oldest SoC with LCDIF V4).
> >>
> >> Should the compatible be added to drivers/gpu/drm/mxsfb/mxsfb_drv.c or
> >> dropped from the YAML file or neither ?
> > 
> > Neither. As far as we know the block is compatible, so the DT should
> > claim that it's compatible to "fsl,imx28-lcdif". However we don't know
> > if there are any surprises, so we add the SoC specific compatible to be
> > able to change the driver matching later without changing the DT if the
> > need arises. For the DT validation to pass the SoC specific compatible 
> > needs to be documented, even if it currently unused by the driver.
> 
> What in that binding says you should specify compatible =
> "fsl,imx8mq-lcdif", "fsl,imx28-lcdif"; and not e.g. "fsl,imx8mq-lcdif",
> "fsl,imx23-lcdif" or simply "fsl,imx8mq-lcdif" ?

Nothing, until the next patch :-) This patch only handles the YAML
conversion but doesn't fix issues.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
