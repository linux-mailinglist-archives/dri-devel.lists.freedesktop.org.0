Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F41830F44
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 23:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641FB10E89B;
	Wed, 17 Jan 2024 22:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3AB210E89B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 22:38:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id EC70AB811CF;
 Wed, 17 Jan 2024 22:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA47C433C7;
 Wed, 17 Jan 2024 22:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705531058;
 bh=Du2DsE2SN6RqPy+w4U7y+zmiClI0d9lq3FbSw61NJXk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GbTSq3MjSChvkg5XzajifKr70wcLlaRh1dAzw9fKYb0QaJOCSv7OTeHli8yjHXSz+
 PIk6q5Goy5W8MNtk7unn4axTIsjHjn2yMOmx68unRwSbIU+MDzvc87y+fqiLcDS/DL
 7KzH1RyPUlvjjTo71VPKvZzB7QzRe2ceKD6kqE1AhqfsrPA5lLm6EZ7ifWK7hVqBvv
 cak58pSrBTheYbzSAuIrWAAnjACAjUItLMWexwAYc8+zH0oF0oxjeyfIMLnSJTEZj8
 K9Riyxi7L4tXqotQaCHUnSrmzwi0/N/Wt6aRDDpBeHQb0h+FSg9GSipYSFXIIlMLyD
 DRgO5NCpa/rnA==
Date: Wed, 17 Jan 2024 16:37:35 -0600
From: Rob Herring <robh@kernel.org>
To: Devarsh Thakkar <devarsht@ti.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: display: ti,am65x-dss: Add support
 for display sharing mode
Message-ID: <20240117223735.GA3375434-robh@kernel.org>
References: <20240116134142.2092483-1-devarsht@ti.com>
 <20240116134142.2092483-2-devarsht@ti.com>
 <20240117201342.GA3041972-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240117201342.GA3041972-robh@kernel.org>
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
Cc: nm@ti.com, devicetree@vger.kernel.org, conor+dt@kernel.org, j-luthra@ti.com,
 tzimmermann@suse.de, krzysztof.kozlowski+dt@linaro.org, praneeth@ti.com,
 tomi.valkeinen@ideasonboard.com, jyri.sarha@iki.fi, mripard@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 a-bhatia1@ti.com, airlied@gmail.com, kristo@kernel.org,
 linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 17, 2024 at 02:13:42PM -0600, Rob Herring wrote:
> On Tue, Jan 16, 2024 at 07:11:40PM +0530, Devarsh Thakkar wrote:
> > Add support for using TI Keystone DSS hardware present in display
> > sharing mode.
> > 
> > TI Keystone DSS hardware supports partitioning of resources between
> > multiple hosts as it provides separate register space and unique
> > interrupt line to each host.
> > 
> > The DSS hardware can be used in shared mode in such a way that one or
> > more of video planes can be owned by Linux wherease other planes can be
> > owned by remote cores.
> > 
> > One or more of the video ports can be dedicated exclusively to a
> > processing core, wherease some of the video ports can be shared between
> > two hosts too with only one of them having write access.
> > 
> > Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> > ---
> >  .../bindings/display/ti/ti,am65x-dss.yaml     | 82 +++++++++++++++++++
> >  1 file changed, 82 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> > index 55e3e490d0e6..d9bc69fbf1fb 100644
> > --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> > +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> > @@ -112,6 +112,86 @@ properties:
> >        Input memory (from main memory to dispc) bandwidth limit in
> >        bytes per second
> >  
> > +  ti,dss-shared-mode:
> > +    type: boolean
> > +    description:
> > +      TI DSS7 supports sharing of display between multiple hosts
> > +      as it provides separate register space for display configuration and
> > +      unique interrupt line to each host.
> 
> If you care about line breaks, you need '|'. 
> 
> > +      One of the host is provided access to the global display
> > +      configuration labelled as "common" region of DSS allows that host
> > +      exclusive access to global registers of DSS while other host can
> > +      configure the display for it's usage using a separate register
> > +      space labelled as "common1".
> > +      The DSS resources can be partitioned in such a way that one or more
> > +      of the video planes are owned by Linux whereas other video planes
> 
> Your h/w can only run Linux?
> 
> What if you want to use this same binding to define the configuration to 
> the 'remote processor'? You can easily s/Linux/the OS/, but it all 
> should be reworded to describe things in terms of the local processor.
> 
> > +      can be owned by a remote core.
> > +      The video port controlling these planes acts as a shared video port
> > +      and it can be configured with write access either by Linux or the
> > +      remote core in which case Linux only has read-only access to that
> > +      video port.
> 
> What is the purpose of this property when all the other properties are 
> required?
> 
> > +
> > +  ti,dss-shared-mode-planes:
> > +    description:
> > +      The video layer that is owned by processing core running Linux.
> > +      The display driver running from Linux has exclusive write access to
> > +      this video layer.
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    enum: [vidl, vid]
> > +
> > +  ti,dss-shared-mode-vp:
> > +    description:
> > +      The video port that is being used in context of processing core
> > +      running Linux with display susbsytem being used in shared mode.
> > +      This can be owned either by the processing core running Linux in
> > +      which case Linux has the write access and the responsibility to
> > +      configure this video port and the associated overlay manager or
> > +      it can be shared between core running Linux and a remote core
> > +      with remote core provided with write access to this video port and
> > +      associated overlay managers and remote core configures and drives
> > +      this video port also feeding data from one or more of the
> > +      video planes owned by Linux, with Linux only having read-only access
> > +      to this video port and associated overlay managers.
> > +
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    enum: [vp1, vp2]
> > +
> > +  ti,dss-shared-mode-common:
> > +    description:
> > +      The DSS register region owned by processing core running Linux.
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    enum: [common, common1]
> > +
> > +  ti,dss-shared-mode-vp-owned:
> > +    description:
> > +      This tells whether processing core running Linux has write access to
> > +      the video ports enlisted in ti,dss-shared-mode-vps.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1]
> 
> This can be boolean. Do writes abort or just get ignored? The latter can 
> be probed and doesn't need a property.
> 
> > +
> > +  ti,dss-shared-mode-plane-zorder:
> > +    description:
> > +      The zorder of the planes owned by Linux.
> > +      For the scenario where Linux is not having write access to associated
> > +      video port, this field is just for
> > +      informational purpose to enumerate the zorder configuration
> > +      being used by remote core.
> > +
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1]
> 
> I don't understand how 0 or 1 defines Z-order.
> 
> > +
> > +dependencies:
> > +  ti,dss-shared-mode: [ 'ti,dss-shared-mode-planes', 'ti,dss-shared-mode-vp',
> > +                        'ti,dss-shared-mode-plane-zorder', 'ti,dss-shared-mode-vp-owned']
> > +  ti,dss-shared-mode-vp: ['ti,dss-shared-mode', 'ti,dss-shared-mode-planes',
> > +                          'ti,dss-shared-mode-plane-zorder', 'ti,dss-shared-mode-vp-owned']
> > +  ti,dss-shared-mode-planes: ['ti,dss-shared-mode', 'ti,dss-shared-mode-vp',
> > +                              'ti,dss-shared-mode-plane-zorder', 'ti,dss-shared-mode-vp-owned']
> > +  ti,dss-shared-mode-plane-zorder: ['ti,dss-shared-mode-planes', 'ti,dss-shared-mode-vp',
> > +                                    'ti,dss-shared-mode', 'ti,dss-shared-mode-vp-owned']
> > +  ti,dss-shared-mode-vp-owned: ['ti,dss-shared-mode-planes', 'ti,dss-shared-mode-vp',
> > +                                'ti,dss-shared-mode', 'ti,dss-shared-mode-plane-zorder']
> > +
> >  allOf:
> >    - if:
> >        properties:
> > @@ -123,6 +203,8 @@ allOf:
> >          ports:
> >            properties:
> >              port@0: false
> > +            ti,dss-shared-mode-vp:
> > +            enum: [vp2]
> 
> This should throw a warning. You just defined a property called 'enum'.

Indeed it does. Test your bindings before sending.

../Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml:204:35: [error] empty value in block mapp
ing (empty-values)                                   
  CHKDT   Documentation/devicetree/bindings/processed-schema.json
/home/rob/proj/linux-dt/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml: allOf:0:then:proper
ties:ports:properties:ti,dss-shared-mode-vp: None is not of type 'object', 'boolean'
        from schema $id: http://json-schema.org/draft-07/schema#
/home/rob/proj/linux-dt/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml: allOf:0:then:proper
ties:ports:properties:enum: ['vp2'] is not of type 'object', 'boolean'
        from schema $id: http://json-schema.org/draft-07/schema#
/home/rob/proj/linux-dt/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml: allOf:0:then:proper
ties:ports:properties: 'enum' should not be valid under {'$ref': '#/definitions/json-schema-prop-names'}
        hint: A json-schema keyword was found instead of a DT property name.
        from schema $id: http://devicetree.org/meta-schemas/keywords.yaml# 
/home/rob/proj/linux-dt/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml: allOf:0:then:proper
ties:ports:properties:ti,dss-shared-mode-vp: None is not of type 'object', 'boolean'
        from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/home/rob/proj/linux-dt/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml: allOf:0:then:proper
ties:ports:properties:enum: ['vp2'] is not of type 'object', 'boolean'
        from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
