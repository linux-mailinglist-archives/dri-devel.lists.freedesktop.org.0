Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B876E2B08
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 22:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173F010E07D;
	Fri, 14 Apr 2023 20:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B8F10E07D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 20:19:03 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33EKIkUR043962;
 Fri, 14 Apr 2023 15:18:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1681503526;
 bh=Vbae2Nv7iwcRu96DHdOxbgWWOqcB731BT5ByRxue5tE=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=YVhyY5R2EQwpV8RY3SmiI3ntB/zDD0Ig3Rd+PPV8eVF1Vam0OPj6wrTEQKL4Th3ok
 7vBUu4Gm/H5fSjfNDDGOmu6vMuN2UXf48du29QDMdcg+GUS5/cDu4YFhLdOmct5dyr
 pS/fB3vGQcpa2F714buUSyr94lV7fALVPff5/r0A=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33EKIk6s011112
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 14 Apr 2023 15:18:46 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 14
 Apr 2023 15:18:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 14 Apr 2023 15:18:45 -0500
Received: from [10.249.133.231] (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33EKIfwG029055;
 Fri, 14 Apr 2023 15:18:42 -0500
Message-ID: <bb301737-ce04-aaac-5603-4ac890f27873@ti.com>
Date: Sat, 15 Apr 2023 01:48:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 5/7] drm/tidss: Set bus_format correctly from
 bridge/connector
Content-Language: en-US
To: Francesco Dolcini <francesco@dolcini.it>
References: <20201201121830.29704-1-nikhil.nd@ti.com>
 <20201201121830.29704-6-nikhil.nd@ti.com>
 <20201204115030.04509092@collabora.com>
 <ZCXENFdTY6g2rb0i@francesco-nb.int.toradex.com>
 <655cfc4b-a414-47e1-f676-b11e410da32f@ti.com>
 <ZDkPHo83drEOHsAN@francesco-nb.int.toradex.com>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <ZDkPHo83drEOHsAN@francesco-nb.int.toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Cc: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Yuti Amonkar <yamonkar@cadence.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, Devarsh Thakkar <devarsht@ti.com>,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Francesco,

On 14-Apr-23 14:00, Francesco Dolcini wrote:
> Hello Aradhya,
> 
> On Fri, Apr 14, 2023 at 01:19:38PM +0530, Aradhya Bhatia wrote:
>> On 30-Mar-23 22:47, Francesco Dolcini wrote:
>>> Hello,
>>> chiming in in this *old* email thread.
>>>
>>> Adding in copy a few more *@ti.com people recently involved in other tidss
>>> changes [1]
>>>
>>>
>>> [1] https://lore.kernel.org/all/20230125113529.13952-1-a-bhatia1@ti.com/
>>>
>>>
>>> On Fri, Dec 04, 2020 at 11:50:30AM +0100, Boris Brezillon wrote:
>>>> On Tue, 1 Dec 2020 17:48:28 +0530
>>>> Nikhil Devshatwar <nikhil.nd@ti.com> wrote:
>>>>
>>>>> Remove the old code to iterate over the bridge chain, as this is
>>>>> already done by the framework.
>>>>> The bridge state should have the negotiated bus format and flags.
>>>>> Use these from the bridge's state.
>>>>> If the bridge does not support format negotiation, error out
>>>>> and fail.
>>>>
>>>> That'd be even better if you implement the bridge interface instead of
>>>> the encoder one so we can get rid of the encoder_{helper}_funcs and use
>>>> drm_simple_encoder_init().
>>>
>>> Did anything happened on this old discussion? I was working on a very
>>> similar change and after a while I realized about this thread.
>>>
>> Nikhil has moved on from TI.
>>
>> I will be taking up this patch series and implement the changes
>> requested.
> Great!
> 
> What I was working on is really about having the media bus format taken
> from the closest bridge, this is really required for proper functionality
> when the display is connected through a bridge.

I agree with you there. The current code will not work well when the
media bus format required by the final sink is not same as the one tidss
needs to output.

> 
> This [1] is what I was working on before realizing about this specific
> patch here, in case you want to have a look.
> 
> Please keep me in CC, I can test/review patches.

Thank you! Will do. =)


Regards
Aradhya
