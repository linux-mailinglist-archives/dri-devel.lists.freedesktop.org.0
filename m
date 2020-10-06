Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C98E02846C9
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5786E2C7;
	Tue,  6 Oct 2020 07:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48EB89AA7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 07:07:46 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09677f3L069917;
 Tue, 6 Oct 2020 02:07:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601968061;
 bh=qd0dVptd1Sq5LSOiSpfUaQmYdjf3ZCJ1JgjNblrfL9E=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=tg0bq6B7dCWvJy1oQpM6mH3CB0ehGilK7f/SlDlsdK3gFP2leWeb685hdoQt/u66Q
 XS94BiCWsfoWdjC0SiMyZzuyGoYns97D3xpntcybI1srFUJHbSOcT0bpcsJ2mMnJ2T
 dmH/0kpMYCwSlnNH6yhQvt9wOrkFvEDtXnH67I9M=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09677fvS046605
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Oct 2020 02:07:41 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 6 Oct
 2020 02:07:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 6 Oct 2020 02:07:41 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09677eB6027415;
 Tue, 6 Oct 2020 02:07:40 -0500
Subject: Re: drm: Supporting new connector model in tidss
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
References: <20201005213123.o4qtfazrnexgjq7p@NiksLab>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <e4b95dfd-93e1-4839-08c3-32b28e32dbc0@ti.com>
Date: Tue, 6 Oct 2020 10:07:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201005213123.o4qtfazrnexgjq7p@NiksLab>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding Boris who added bus format negotiation.

On 06/10/2020 00:31, Nikhil Devshatwar wrote:
> Hi all,
> 
> I am trying to convert the upstream tidss drm driver to new
> connector model.
> The connector is getting created by the tidss driver and bridges are
> attached with flag DRM_BRIDGE_ATTACH_NO_CONNECTOR
> Here are some questions, regarding this:

I was looking at this a bit, and below is my understanding. And I'm mostly talking about how things
should be with new code, not legacy code. Things are probably a bit more complex if you mix bridges
which implement different styles on how to deal with bus formats.

> 1) Most of the info regarding bus_format and bus flags is coming from
> the bridges. Is it okay to not populate connector->display_info with
> bus_format and flags?

drm_display_info describes the connected display and what goes on the wire to the display.

For monitors that's quite clear, and the data in display_info would reflect what the last bridge
needs to output. Most of the data comes from EDID, but I think bus format and flags do not. So a
bridge would need to fill them in, which doesn't make sense when we have a chain of bridges (which
would be the bridge to fill the data?). So for monitors, I think bus flags and formats in
display_info are unused.

For panels, I'm not sure. We have the bridge/panel.c which wraps the actual panel driver, so afaics
the panel is essentially the last bridge in the chain, and the connector is kind of a dummy
connector. But the panel driver fills in the display_info, and that's where the bridge/panel.c gets
the bus formats & flags for the negotiation.

Probably the above could be changed so that the panels take part of the negotiation process, and
then the bus formats and flags fields in the display_info could be removed.

> 2) The "drm_atomic_bridge_chain_select_bus_fmts" does the format
> negotiation. So is it okay for the encoder to simply pick the bus_format
> from the first bridge's state?

Yes, I think that is the idea. The first bridge's input is what the display controller's encoder
should output, and the negotiation should take care to provide something in the first bridge's state
for the input.

> 3) What is the meaning of MEDIA_BUS_FMT_FIXED? Does it mean that the
> bridge does not change the format from input to output?

I think it just means "undefined" here, and it's up to the drivers to decide what to do. I presume
this is mostly for drivers that don't support the new stuff, as each bridge should be able to tell
what formats & flags it supports.

> 4) The bus_flags are available in bridge->timings->input_bus_flags and
> also in bridge_state->input_bus_cfg.flags. Which one should be used?

I think bridge_state->input_bus_cfg. Although bridge->timings->input_bus_flags has some data that's
not in input_bus_cfg. If the drivers support the negotiation, I don't think
bridge->timings->input_bus_flags has any use.

Probably bridge->timings->input_bus_flags should be used as a fallback. So if a bridge is asked to
use MEDIA_BUS_FMT_FIXED as output (i.e. the next bridge doesn't support negotiation), then the
bridge might use a default format and also see if the next bridge has bridge->timings->input_bus_flags.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
