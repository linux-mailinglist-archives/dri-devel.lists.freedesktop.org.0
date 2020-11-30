Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDB82C81A4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 11:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEB689AB3;
	Mon, 30 Nov 2020 10:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B070489AB3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 10:04:35 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AUA4UGB023669;
 Mon, 30 Nov 2020 04:04:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606730670;
 bh=SE57qwSjzI5yT+hlbR+BYAmIptnSD8HbsMmbA9LePiA=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=oY9iwJAkGfwT0DLOomEtsqqo49R7f+JelWYWcFBov7SK3WyrAPCdTnv3jhzNf69sg
 TlyBQECBbPJX46do4KviMxz/qcR5F3z7cAVhKfZRDj+ZdT1FOOoxq657+qXLgmXdft
 kgqBABq2/10CHEP7lH9oqptLUgAsnS03K3GlS4ps=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AUA4Udi064627
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Nov 2020 04:04:30 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 30
 Nov 2020 04:04:30 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 30 Nov 2020 04:04:29 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AUA4SdO095346;
 Mon, 30 Nov 2020 04:04:28 -0600
Subject: Re: [PATCH v3 1/6] drm: bridge: Propagate the bus flags from
 bridge->timings
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
References: <20201119160134.9244-1-nikhil.nd@ti.com>
 <20201119160134.9244-2-nikhil.nd@ti.com>
 <20201130093600.GB4141@pendragon.ideasonboard.com>
 <39d7cf1d-d25b-abc6-a6c6-5d1d18a6b3ff@ti.com>
 <20201130094753.GF4141@pendragon.ideasonboard.com>
 <86a8d1a6-3464-245b-a08a-ad212ab0ae53@ti.com>
Message-ID: <e8ca17ee-5a62-3944-825e-7066646c1db1@ti.com>
Date: Mon, 30 Nov 2020 12:04:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <86a8d1a6-3464-245b-a08a-ad212ab0ae53@ti.com>
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
Cc: Yuti Amonkar <yamonkar@cadence.com>, Sekhar Nori <nsekhar@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, dri-devel@lists.freedesktop.org,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/11/2020 12:02, Tomi Valkeinen wrote:
> On 30/11/2020 11:47, Laurent Pinchart wrote:
> 
>>>> Hasn't Boris commented in his review of v1 that bus flags should be set
>>>> in atomic_check, even when they're static ? We're moving towards
>>>> removing timings->input_bus_flags, so this patch goes in the wrong
>>>> direction :-S
>>>
>>> We have atomic_check only if the bridge has implemented atomic funcs. And even if there's
>>> atomic_check, not all bridges set the bus_flags there. So we need to either 1) fix the issue for now
>>> as in this patch, or 2) convert all bridges to use atomic funcs and fix all the bridges to set the
>>> bus_flags.
>>
>> The second option is what we'd like to achieve. Wouldn't it be best to
>> already start going in that direction ? We don't need to convert all
>> bridge drivers in one go here, just the ones that are used by tidss.
> 
> I think that sounds fine, except that this is blocking the DisplayPort support for J7. We have
> everything in for DP except dts changes (can be added only when the drivers work), and the connector
> stuff.
> 
> The connector stuff includes this series (so that tidss supports the new connector model), and
> "[PATCH RESEND v3 0/2] drm: add DisplayPort connector", which adds the connector driver.
> 
> The bridges currently used (that I know of) with tidss are cdns-mhdp, tfp410 and sii9022. I don't
> expect converting those would be a huge job, but I'd still really like to get the DP working in
> upstream without starting to expand the scope of the patches we need to enable it.
> 
> That said, we missed 5.11 so perhaps we have the time.

Looks like Boris was missing from Cc in this series. Adding him.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
