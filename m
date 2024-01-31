Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFF3844195
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 15:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAA010E845;
	Wed, 31 Jan 2024 14:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457BD10E845
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 14:15:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B7D65CE1F5C;
 Wed, 31 Jan 2024 14:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D88C433F1;
 Wed, 31 Jan 2024 14:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706710505;
 bh=ab7imJk06Aq8BClWfw1+COONXRv86lAFnRitwwNKZ20=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LN4XxyPnvDNtHC5lLts6xq3PdjkeOuf8MF48OfdOSQY/zB/xqrre8HfU2YaMN14v+
 70AGSIrkyCGfsl9ux3ydXKr9qvlLKvCUdO4/HcOSGwAxl2HMilm6TiIMEh1g07TDev
 fkvpNwJWUZjoRlPhVDX2MeX6pwdcCL6+LUtR+hHNfrgD0tVgtYGH2Gx7ERn38OPI/d
 o/G9Uuky2iBd8LgQe08BH2b1xxC/l16Zclk17U3uqbXiFAxWXyq9mqhg9gtMqu/Xex
 t8Wzi7FdxwNfrudlpUKCV9Z9Ghk0tVSNOUonihMmMYIpoP7lav9vo05XeUdTCm2S+O
 lyk5CAaD5Q+zw==
Date: Wed, 31 Jan 2024 08:15:02 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v1 1/6] dt-bindings: display: rockchip: rockchip, dw-hdmi:
 deprecate port property
Message-ID: <20240131141502.GB966672-robh@kernel.org>
References: <6626d288-ecf1-436b-b0a3-3417308a8633@gmail.com>
 <20240130-denim-capacity-e1617595ac9f@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240130-denim-capacity-e1617595ac9f@spud>
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
Cc: daniel@ffwll.ch, conor+dt@kernel.org, devicetree@vger.kernel.org,
 tzimmermann@suse.de, hjc@rock-chips.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org, andy.yan@rock-chips.com,
 Johan Jonker <jbx6244@gmail.com>, markyao0591@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 30, 2024 at 06:18:49PM +0000, Conor Dooley wrote:
> On Tue, Jan 30, 2024 at 03:55:43PM +0100, Johan Jonker wrote:
> > The hdmi-connector nodes are now functional and the new way to model
> > hdmi nodes with, so deprecate the port property and
> 
> This doesn't really explain what makes having hdmi-connector nodes
> replace the usecase for "port".
> 
> > make port@0 and
> > port@1 a requirement.
> 
> Why?

That means the deprecated way will always have warnings which makes 
documenting the deprecated stuff a bit pointless. Technically, new 
required properties are ABI break and something I'm working on making 
the tools check (by comparing 2 versions of schemas). That said, if all 
the upstream dts files are fixed already, then I don't care too much.


> > Also update example.
> 
> "Also do x" is a red flag when it comes to commit messages, as it
> immediately makes me think that this should be more than one commit.
> I'd probably write this as "Update the example to avoid use of the
> deprecated property" or something to avoid bad gut reactions.
> That's not worth resending for though obviously...
> 
> > 
> > Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> > ---
> >  .../display/rockchip/rockchip,dw-hdmi.yaml    | 27 ++++++++++++++++---
> >  1 file changed, 23 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> > index 7e59dee15a5f..cd0a42f35f24 100644
> > --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> > +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> > @@ -97,8 +97,11 @@ properties:
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> > 
> > -    patternProperties:
> > -      "^port(@0)?$":
> > +    properties:
> > +      port:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        deprecated: true
> 
> This change makes the deprecated property's description incomplete,
> since it doesn't cover the endpoints any more. It also doesn't make
> port@0 and port mutually exclusive.

graph.yaml has a check that effectively does that.

Rob
