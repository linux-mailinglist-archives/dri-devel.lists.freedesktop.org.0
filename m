Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5540B545207
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 18:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFFA12B1E2;
	Thu,  9 Jun 2022 16:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 86B1612B1E1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 16:31:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C09E12FC;
 Thu,  9 Jun 2022 09:31:43 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7217E3F73B;
 Thu,  9 Jun 2022 09:31:41 -0700 (PDT)
Date: Thu, 9 Jun 2022 17:31:38 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH v2 10/11] dt-bindings: display: convert Arm Mali-DP to
 DT schema
Message-ID: <20220609173138.77ca1571@donnerap.cambridge.arm.com>
In-Reply-To: <YnumGEilUblhBx8E@e110455-lin.cambridge.arm.com>
References: <20220506140533.3566431-1-andre.przywara@arm.com>
 <20220506140533.3566431-11-andre.przywara@arm.com>
 <1651876793.707852.2407424.nullmailer@robh.at.kernel.org>
 <20220509144901.26707a1d@donnerap.cambridge.arm.com>
 <YnumGEilUblhBx8E@e110455-lin.cambridge.arm.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 May 2022 13:03:36 +0100
Liviu Dudau <liviu.dudau@arm.com> wrote:

Hi Liviu,

> On Mon, May 09, 2022 at 02:49:01PM +0100, Andre Przywara wrote:
> > On Fri, 06 May 2022 17:39:53 -0500
> > Rob Herring <robh@kernel.org> wrote:
> >   
> > > On Fri, 06 May 2022 15:05:32 +0100, Andre Przywara wrote:  
> > > > The Arm Mali Display Processor (DP) 5xx/6xx is a series of IP that scans
> > > > out a framebuffer and hands the pixels over to a digital signal encoder.
> > > > It supports multiple layers, scaling and rotation.
> > > > 
> > > > Convert the existing DT binding to DT schema.
> > > > 
> > > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > > ---
> > > >  .../bindings/display/arm,malidp.txt           |  68 ----------
> > > >  .../bindings/display/arm,malidp.yaml          | 116 ++++++++++++++++++
> > > >  2 files changed, 116 insertions(+), 68 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/display/arm,malidp.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/display/arm,malidp.yaml
> > > >     
> > > 
> > > Running 'make dtbs_check' with the schema in this patch gives the
> > > following warnings. Consider if they are expected or the schema is
> > > incorrect. These may not be new warnings.
> > > 
> > > Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> > > This will change in the future.
> > > 
> > > Full log is available here: https://patchwork.ozlabs.org/patch/
> > > 
> > > 
> > > display@f080000: 'arm,malidp-arqos-value' does not match any of the regexes: 'pinctrl-[0-9]+'
> > > 	arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb
> > > 	arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb
> > > 	arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb
> > > 	arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb
> > > 	arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb
> > > 	arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb
> > > 	arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb
> > > 	arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb  
> > 
> > Ah, good point, I missed that directory when testing. I came up with the
> > following change on top:
> > 
> > ==============================
> > diff --git a/Documentation/devicetree/bindings/display/arm,malidp.yaml b/Documentation/devicetree/bindings/display/arm,malidp.yaml
> > index ea7b7100548bf..bc0d3f3ab2b75 100644
> > --- a/Documentation/devicetree/bindings/display/arm,malidp.yaml
> > +++ b/Documentation/devicetree/bindings/display/arm,malidp.yaml
> > @@ -76,6 +76,14 @@ properties:
> >      description:
> >        integer describing the ARQoS levels of DP500's QoS signaling
> >  
> > +  arm,malidp-arqos-value:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Quality-of-Service value for the display engine FIFOs, to write
> > +      into the RQOS register of the DP500.
> > +      See the ARM Mali-DP500 TRM for details on the encoding.
> > +      If omitted, the RQOS register will not be changed.
> > +  
> 
> Actually, this needs to replace 'arm,malidp-arqos-high-level'. Commit ce6eb0253cba
> ("dt/bindings: display: Add optional property node define for Mali DP500") is
> introducing the wrong property (it mentions 'arm,malidp-arqos-value' in the commit
> message). There is no user of 'arm,malidp-arqos-high-level' in the kernel.

Ah, thanks for the report and the background, and sorry for the delay. I
verified that, and sent a patch[1], since this binding here was already
merged.

Cheers,
Andre

[1]
https://lore.kernel.org/linux-arm-kernel/20220609162729.1441760-1-andre.przywara@arm.com/T/#u

> 
> Appologies for signing off on the wrong patch content at that time.
> 
> Best regards,
> Liviu
> 
> >    port:
> >      $ref: /schemas/graph.yaml#/properties/port
> >      unevaluatedProperties: false
> > ==============================
> > 
> > Cheers,
> > Andre  
> 

