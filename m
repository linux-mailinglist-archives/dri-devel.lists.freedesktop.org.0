Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 106902CA769
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 16:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81416E550;
	Tue,  1 Dec 2020 15:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE69B6E550
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 15:53:25 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1FrLFY028173;
 Tue, 1 Dec 2020 09:53:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606838001;
 bh=A+G37+Ba5YvC8b0uBrXQZvf8tQCtDGVcSd50XQWIcvI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=pfkTlf7iAEImroGMzPqdzoYeZJxc9EfeswW085d6Rtj6kVSkBUUq9CQNJ3h3MRLHl
 Ccq/2BeZ0xQhxn47p9R52AvNRDWAr6U1OoPiG3WuaZj6uVB7GNacuKSSdhW6swFae6
 9i2XM2FCk0VXQNMF/zH5X7YBhGYovWfNAq7QJ5HM=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1FrL19058551
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Dec 2020 09:53:21 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 09:53:21 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 09:53:21 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1FrJXi100463;
 Tue, 1 Dec 2020 09:53:19 -0600
Subject: Re: [PATCH v3 4/6] drm/tidss: Set bus_format correctly from
 bridge/connector
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Nikhil Devshatwar
 <nikhil.nd@ti.com>
References: <20201119160134.9244-1-nikhil.nd@ti.com>
 <20201119160134.9244-5-nikhil.nd@ti.com>
 <a36967dc-ca5f-d231-198b-1153c9720d65@ti.com>
 <20201130063503.phivehin7l2cx53j@NiksLab>
 <20201130094617.GE4141@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <9785cafb-4b04-6132-a636-3d43c1f89d3b@ti.com>
Date: Tue, 1 Dec 2020 17:53:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130094617.GE4141@pendragon.ideasonboard.com>
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
Cc: Sekhar Nori <nsekhar@ti.com>, Yuti Amonkar <yamonkar@cadence.com>,
 dri-devel@lists.freedesktop.org, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/11/2020 11:46, Laurent Pinchart wrote:
> Hi Nikhil,
> 
> On Mon, Nov 30, 2020 at 12:05:03PM +0530, Nikhil Devshatwar wrote:
>> On 14:51-20201125, Tomi Valkeinen wrote:
>>> On 19/11/2020 18:01, Nikhil Devshatwar wrote:
>>>> Remove the old code to iterate over the bridge chain, as this is
>>>> already done by the framework.
>>>> The bridge state should have the negotiated bus format and flags.
>>>> Use these from the bridge's state.
>>>> If the bridge does not support format negotiation, error out
>>>> and fail.
>>>>
>>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>>>> ---
>>>>
>>>> Notes:
>>>>     changes from v2:
>>>>     * Remove the old code and use the flags from the bridge state
>>>>
>>>>  drivers/gpu/drm/tidss/tidss_encoder.c | 36 +++++++++++----------------
>>>>  1 file changed, 14 insertions(+), 22 deletions(-)
>>>
>>> If a first bridge (after the crtc) supports two bus formats as input, how does tidss choose between
>>> those? This patch just picks bstate->input_bus_cfg.format, and it's not clear to me which one that
>>> is (the first one?). Also, we don't check if tidss actually supports the bus format.
>>
>> The selection is done by the framework in
>> select_bus_fmt_recursive at drivers/gpu/drm/drm_bridge.c:810
>>
>> My understanding is that currently, the format negotiation logic does
>> not negotiate all the way till encoder, it stops only at the
>> first_bridge.
> 
> Should we then implement a bridge in the tidss driver to model the
> internal encoder, in order to support format negotiation all the way to
> the tidss ?

I don't know, but it feels perhaps a bit odd. Then we would have crtc + encoder + bridge, which are
actually all about the same HW block. And this would have to be done for all DRM drivers.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
