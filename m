Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DC95ED194
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 02:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C4410E0A5;
	Wed, 28 Sep 2022 00:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3044610E0A5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 00:18:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 780FE47C;
 Wed, 28 Sep 2022 02:18:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664324286;
 bh=q2e1+sNimQVluat4PFrU/PiipJhe7d9CNBKlOCTBIkA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=chTpvS79LkU4RFQbliiEPZfCMGm4p9l4T9MR6XIk8Z7p84avOCKV3NaGad/ynY0BK
 NcMO1piYRq1bJmM7QXOWYpgDOarM4MpjeXurkgfEjjC47SZK93Em2QMpU0bHdEtyHE
 41qcVhgLNuaPwfLkZbD7I4QvoWqhGm65m7gek8Ak=
Date: Wed, 28 Sep 2022 03:18:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/4] drm: lcdif: Don't use BIT() for multi-bit register
 fields
Message-ID: <YzOSvUPJJx26HEwq@pendragon.ideasonboard.com>
References: <20220927233821.8007-1-laurent.pinchart@ideasonboard.com>
 <20220927233821.8007-3-laurent.pinchart@ideasonboard.com>
 <e7dd7021-3892-298e-6c84-aaff1abfefdf@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e7dd7021-3892-298e-6c84-aaff1abfefdf@denx.de>
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, dri-devel@lists.freedesktop.org,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Wed, Sep 28, 2022 at 02:10:26AM +0200, Marek Vasut wrote:
> On 9/28/22 01:38, Laurent Pinchart wrote:
> > The BIT() macro is meant to represent a single bit. Don't use it for
> > values of register fields that span multiple bits.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >   drivers/gpu/drm/mxsfb/lcdif_regs.h | 28 ++++++++++++++--------------
> >   1 file changed, 14 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> > index 013f2cace2a0..bc4d020aaa7c 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_regs.h
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> > @@ -138,9 +138,9 @@
> >   
> >   #define DISP_PARA_DISP_ON		BIT(31)
> >   #define DISP_PARA_SWAP_EN		BIT(30)
> > -#define DISP_PARA_LINE_PATTERN_UYVY_H	(GENMASK(29, 28) | BIT(26))
> > -#define DISP_PARA_LINE_PATTERN_RGB565	GENMASK(28, 26)
> > -#define DISP_PARA_LINE_PATTERN_RGB888	0
> > +#define DISP_PARA_LINE_PATTERN_UYVY_H	(13 << 26)
> > +#define DISP_PARA_LINE_PATTERN_RGB565	(7 << 26)
> > +#define DISP_PARA_LINE_PATTERN_RGB888	(0 << 26)
> 
> Can we use hex here for the left size of the shift operation, so it's 
> subjectively easier to read ? DTTO for the other values ?
> 
> That is:
> -#define DISP_PARA_LINE_PATTERN_UYVY_H	(13 << 26)
> +#define DISP_PARA_LINE_PATTERN_UYVY_H	(0xd << 26)
> 
> [...]

Sure, I'll fix that.

-- 
Regards,

Laurent Pinchart
