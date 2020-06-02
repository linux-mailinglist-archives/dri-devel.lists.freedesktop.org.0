Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 702281EC53A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 00:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5F889C1B;
	Tue,  2 Jun 2020 22:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932BD89C1B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 22:43:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A38052A4;
 Wed,  3 Jun 2020 00:43:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591137783;
 bh=5bzngJE3PovcLPH25pHOBugEzQ/pVC9pCN0P2WYHsyQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L0tGdsNhzZ5Se6JRLO9Q7N6vkvtnTmMAFe/Bgpz10F/m3ijD+KDZf/S+OaX2+7hXi
 DEqqZ0wLZXonNeYeqokqrb3c73hhUT75dsRYrxZsv/gSPlzVa6TnSQBgYZKCinGPW+
 kfQHh57ZVt0ABYqKBhoQfWVlvJsrmcPmf93JpF34=
Date: Wed, 3 Jun 2020 01:42:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 22/22] drm: mxsfb: Support the alpha plane
Message-ID: <20200602224248.GN6547@pendragon.ideasonboard.com>
References: <20200530031015.15492-1-laurent.pinchart@ideasonboard.com>
 <20200530031015.15492-23-laurent.pinchart@ideasonboard.com>
 <CACvgo50XZaOmH5RFtr-toZGrWcK72tcsQSE8aqcW+wuthECdcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo50XZaOmH5RFtr-toZGrWcK72tcsQSE8aqcW+wuthECdcQ@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, ML dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>, leonard.crestez@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil,

On Sun, May 31, 2020 at 05:54:04PM +0100, Emil Velikov wrote:
> HI Laurent,
> 
> From a quick glance the series looks really good and neat.

Thank you :-)

> Then again, I don't know much about the hardware to provide meaningful
> review.
>
> A couple of small ideas below.
> 
> On Sat, 30 May 2020 at 04:11, Laurent Pinchart wrote:
> 
> > +#define LCDC_AS_BUF                    0x220
> > +#define LCDC_AS_NEXT_BUF               0x230
> 
> s/LCDC_AS_BUF/LCDC_AS_CUR_BUF/ - to stay consistent with the primary
> plane name scheme.

The register names come directly from the datasheet (and yes, the
datasheet uses CUR_BUF and NEXT_BUF for the primary plane, and BUF and
NEXT_BUF for the overlay plane :-S). I'd thus rather keep them aligned
with the documentation.

> Would it make sense to store the above registers in mxsfb_devdata,
> just like we do for the primary planes?

The reason the register addresses are stored in mxsfb_devdata for the
primary plane is because they differ between hardware revisions (don't
they teach hardware engineers in school these days *not* to move
registers around ? :-)). The overlay plane is only supported in the
latest versions of the IP core, and are always located at the same
address as far as I can tell. I don't think we need an extra level of
indirection.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
