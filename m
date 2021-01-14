Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EA92F5DE4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD136E151;
	Thu, 14 Jan 2021 09:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AB96E151
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 09:42:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B746279;
 Thu, 14 Jan 2021 10:42:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610617337;
 bh=rtJMlh25QobvsiyGF+L/cjpV63tvMAdp3CNNW1bz2/g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XZEDz1A2TsXxnrpD04KhJIJ3eWMC5Td+Loz+0LEnWabUJDnCsESO2k+iMgwt9QdgY
 Kqn9dbXpVYA549NEZbXy38KSx7aKj/p36MHTNY9ZsvOyq6s/RvRqUTseA73x7Fwydk
 gIEgdQXjf9TEoqcqUn569whnDtrc4SfYbcbUROc0=
Date: Thu, 14 Jan 2021 11:42:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 4/7] dt-bindings: display: imx: hdmi: Convert binding
 to YAML
Message-ID: <YAAR6H8L2MzVngJr@pendragon.ideasonboard.com>
References: <20210114064437.5793-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210114064437.5793-5-laurent.pinchart+renesas@ideasonboard.com>
 <d7e9c3bed92d6fc6922e5f5ec30f27d7242c5624.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d7e9c3bed92d6fc6922e5f5ec30f27d7242c5624.camel@pengutronix.de>
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Mark Yao <markyao0591@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

On Thu, Jan 14, 2021 at 09:17:47AM +0100, Philipp Zabel wrote:
> On Thu, 2021-01-14 at 08:44 +0200, Laurent Pinchart wrote:
> > Convert the i.MX6 HDMI TX text binding to YAML.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> > Changes since v3:
> > 
> > - Use port instead of port-base
> > 
> > Changes since v1:
> > 
> > - Only specify maxItems for clocks
> > - Drop reg and interrupts as they're checked in the base schema
> > - Rebase on top of OF graph schema, dropped redundant properties
> > - Fix identation for enum entries
> > - Drop clock-names items, use maxItems only
> > ---
> >  .../bindings/display/imx/fsl,imx6-hdmi.yaml   | 126 ++++++++++++++++++
> >  .../devicetree/bindings/display/imx/hdmi.txt  |  65 ---------
> >  2 files changed, 126 insertions(+), 65 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/display/imx/hdmi.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> > new file mode 100644
> > index 000000000000..af7fe9c4d196
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> > @@ -0,0 +1,126 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/imx/fsl,imx6-hdmi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale i.MX6 DWC HDMI TX Encoder
> > +
> > +maintainers:
> > +  - Philipp Zabel <p.zabel@pengutronix.de>
> 
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

Very appreciated, thank you.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
