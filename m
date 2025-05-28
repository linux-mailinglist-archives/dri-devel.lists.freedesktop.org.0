Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80329AC646F
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 10:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE8B10E571;
	Wed, 28 May 2025 08:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cZCBwxFP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A4B10E571
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 08:27:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9D72F43BB6;
 Wed, 28 May 2025 08:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F13EEC4CEE7;
 Wed, 28 May 2025 08:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748420831;
 bh=AZYT5eehBkY6DjTM6tnPNFjrQP4VYvsXTO8hD+AcBro=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cZCBwxFPxSbbG0V/IBF4pyP+zJ2oTzfeuk75Y0+AgXA298mlmYyAUstaNnKXGB0rP
 Z9BNTx8kzibzmiQXqgwzTN4BwGygElkxBTBeS8/az6MUF3GQzLgPPi3PdfdcFvICG1
 8fhA1Oa2hfxxjuIBU2mzH2TSRgIPlx/m4/632E2qCOL2jnDupXz0nNQNQnf7M40wuR
 +1xCgfvpx9itO4yhEIKbLGBIfP1VfJssYCpSIZ2gkUOlpyp/IbZ8Dx7HpBYdBPsdCg
 rxDUPwo6XcJbLAe1JNEuVp/sbVSNXFykmdcMPiQM2fVGP9kjg7o+GridB6oeWtToTA
 d2wVhQ94ck2lw==
MIME-Version: 1.0
Date: Wed, 28 May 2025 10:27:04 +0200
From: Michael Walle <mwalle@kernel.org>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Jyri Sarha <jyri.sarha@iki.fi>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, David Airlie
 <airlied@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona@ffwll.ch>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, Praneeth
 Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary
 <j-choudhary@ti.com>, Francesco Dolcini <francesco@dolcini.it>, Alexander
 Sverdlin <alexander.sverdlin@siemens.com>, DRI Development List
 <dri-devel@lists.freedesktop.org>, Devicetree List
 <devicetree@vger.kernel.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 4/4] drm/tidss: Add OLDI bridge support
In-Reply-To: <fc77a1e2-be50-43b1-9863-f8ca70445428@linux.dev>
References: <20250525151721.567042-1-aradhya.bhatia@linux.dev>
 <20250525151721.567042-5-aradhya.bhatia@linux.dev>
 <DA5ZNDCHXC6M.1CDYDG6KKMAP0@kernel.org>
 <a98ad2e7-50de-4d04-8d99-2cf77354b1d6@linux.dev>
 <DA6PRDARLY70.1CILNJ8YLIOA1@kernel.org>
 <fc77a1e2-be50-43b1-9863-f8ca70445428@linux.dev>
Message-ID: <fc5f6000fbe1f01223f8a28a952b40ea@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Aradhya,

>>> Something like this.
>>> 
>>> &oldi0 {
>>> 	// primary oldi
>>> 	ti,companion-oldi = <&oldi1>;
>>> };
>>> 
>>> 
>>> &oldi1 {
>>> 	// secondary oldi
>>> 	ti,secondary-oldi = true;
>>> 	ti,companion-oldi = <&oldi0>;
>>> };
>>> 
>>> 
>>> If there is no companion for any OLDI dt node, then the OLDI TX will 
>>> be
>>> deemed as acting by itself, and in a single-link mode.
>> 
>> And it's possible to still have these properties and treat them as
>> two distinct transmitters? I'm wondering if it's possible to have
>> the companion-oldi and secondary-oldi property inside the generic
>> SoC dtsi, so you don't have to repeat it in every board dts.
>> 
>> If I read the code correctly, the panel has to have the even and odd
>> pixel properties to be detected as dual-link. Correct? Thus it would
>> be possible to have
>> 
>> oldi0: oldi@0 {
>>  	ti,companion-oldi = <&oldi1>;
>> };
>> 
>> oldi1: oldi@1 {
>>  	ti,secondary-oldi;
>>  	ti,companion-oldi = <&oldi0>;
>> };
>> 
>> in the soc.dtsi and in a board dts:
>> 
>> panel {
>> 	port {
>> 		remote-endpoint = <&oldi0>;
>> 	};
>> };
> 
> In this case, the secondary OLDI (oldi1) would remain disabled from
> soc.dtsi.
> 
> I gave this a quick try. Turns out, of_parse_phandle() is not able to
> return an error when primary OLDI tries to find a companion -- which is
> important for the driver to detect an absence of any secondary OLDI.
> 
> Since the driver code registers a companion for primary OLDI, and
> further does not find the "dual-lvds-{odd,even}-pixels" properties,
> the driver ends up trying for a Clone Mode.
> 
> So, for single-link , we'd have to actively delete the "companion-oldi"
> property, in the board.dts/panel.dtso.

Last time I've checked you cannot delete nodes or properties in DT
overlays. So maybe it's better to make that a board property and don't
set it by default in the soc dtsi.

> But, say, the disabled-node's phandle parse is circumvented, somehow,
> and we don't need to delete the property explicitly.
> 
> There would still be one concern, I am afraid.
> 
> In AM67A DSS (future scope at the moment), the 2 OLDIs can act
> independently. Like a 2x Independent Single-Link. Both the OLDI dt 
> nodes
> will be enabled.

The first DSS0 can drive two single link displays? Reading your 
downstream
AM67A DSS patches, thats not particular clear:

     The DSS0 HW supports one each of video pipeline (vid) and video-lite
     pipeline (vidl1). It outputs OLDI signals on one video port (vp1) 
and
     DPI signals on another (vp2). The video ports are connected to the
     pipelines via 2 identical overlay managers (ovr1 and ovr2).

The TRM also doesn't tell much (or I just didn't find it yet).

> So, if the soc.dtsi has them already connected, then the
> board.dts/panel.dtso would still need to explicitly delete those
> properties to get the 2 OLDI TXes to work independently.

Yeah looks like that should really be a board property.

-michael
