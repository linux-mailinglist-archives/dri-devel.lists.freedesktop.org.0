Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B32D214F2E6
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 20:41:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6445C6FBE3;
	Fri, 31 Jan 2020 19:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801926FBE3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 19:41:35 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 1D83120024;
 Fri, 31 Jan 2020 20:41:31 +0100 (CET)
Date: Fri, 31 Jan 2020 20:41:30 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: display: convert panel-dpi to DT
 schema
Message-ID: <20200131194130.GA26925@ravnborg.org>
References: <20200125203454.7450-1-sam@ravnborg.org>
 <20200125203454.7450-4-sam@ravnborg.org>
 <CAL_Jsq+JsEk1qz7NQc0ybO0xgmTB+YcmUL_d=u7_Y0A56v18nw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+JsEk1qz7NQc0ybO0xgmTB+YcmUL_d=u7_Y0A56v18nw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=Smb47HSlpyMrLoV_zPMA:9 a=CjuIK1q_8ugA:10
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
Cc: devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob.

> > +
> > +properties:
> > +  compatible:
> > +    contains:
> > +      const: panel-dpi
> > +    description:
> > +      Shall contain "panel-dpi" in addition to an optional panel-specific
> > +      compatible string defined in individual panel bindings.
> > +      "panel-dpi" can be used alone, thus no dedicated binding file
> > +      is required for each and every panel.
> 
> While this has occurred, I don't think the schema should allow it. I
> think a 'minItems: 2' should be added here.
> 
> AFAIK, MIPI DPI just defines a spec for what already existed. Maybe it
> constrains things somewhat, but to the extent why we require a panel
> specific compatible in the first place? Doubtful...

You triggered me to re-read some old thread about this.
And I think I got it now.

Based on a proposal you made some weeks ago I did it like this:
properties:
  compatible:
    description:
      Shall contain a panel specific compatible and "panel-dpi"
      in that order.
    items:
      - {}
      - const: panel-dpi

So no constraints on the panel specific compatible, expect that it is present.
And panel-dpi must be listed as the second compatible.

Updated the example too.
Will post a v3.

Thanks!

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
