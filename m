Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19365253D29
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 07:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7096E049;
	Thu, 27 Aug 2020 05:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8DB6E049
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 05:18:54 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07R5ImP5086981;
 Thu, 27 Aug 2020 00:18:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1598505528;
 bh=WbwzT9D3rPN3zne177xTSPWqLqvMgd5zoKKJhcHNj5g=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=MokbrQ/Xzy7waEC8QDzxgCp/Sfzl+Gg1TvzOgVzJsK5FU48IXyqclXKMNIkwDe4x+
 p5KOzHxsPj8G26fxGWtICM3bEc1uYLVqK78QbAc2MPbX7WRcai1BXeJdETdtDXjM56
 PU6Er9QRvqBdNjpIf9yOkPxnrBrj/akCSQeOeH4w=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07R5ImNO002170
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 Aug 2020 00:18:48 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 27
 Aug 2020 00:18:47 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 27 Aug 2020 00:18:47 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07R5IjG4078604;
 Thu, 27 Aug 2020 00:18:46 -0500
Subject: Re: [PATCH] drm/bridge: tc358767: fix EDID memory leak
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200826134017.437486-1-tomi.valkeinen@ti.com>
 <20200826232322.GA28543@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <8c40b109-1f0a-1415-7982-dbb7f494050e@ti.com>
Date: Thu, 27 Aug 2020 08:18:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200826232322.GA28543@pendragon.ideasonboard.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/08/2020 02:23, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Wed, Aug 26, 2020 at 04:40:17PM +0300, Tomi Valkeinen wrote:
>> The current EDID allocated with drm_get_edid() is freed when the driver
>> gets a new EDID, but it is not freed when the driver is removed, causing
>> a leak.
>>
>> Free the EDID (if any) on driver remove.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>  drivers/gpu/drm/bridge/tc358767.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
>> index c2777b226c75..dbb18a86beaf 100644
>> --- a/drivers/gpu/drm/bridge/tc358767.c
>> +++ b/drivers/gpu/drm/bridge/tc358767.c
>> @@ -1695,6 +1695,8 @@ static int tc_remove(struct i2c_client *client)
>>  	drm_bridge_remove(&tc->bridge);
>>  	drm_dp_aux_unregister(&tc->aux);
>>  
>> +	kfree(tc->edid);
>> +
> 
> tc->edid is gone in drm-misc-next, problem solved already :-)

Well, indeed. Should have looked at the latest... =). The leak only happens on driver remove, so I
don't think it's worth sending for stable kernels.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
