Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 860B18D54AF
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 23:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C4210E4EF;
	Thu, 30 May 2024 21:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6CF0710E2A3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 12:30:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D024D339;
 Wed, 29 May 2024 05:30:39 -0700 (PDT)
Received: from [192.168.1.100] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 8B1073F762; Wed, 29 May 2024 05:30:12 -0700 (PDT)
Message-ID: <941db167-fda5-4d57-9623-58d8b8c0a7b5@arm.com>
Date: Wed, 29 May 2024 13:30:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 resend 2/8] hwtracing: use for_each_endpoint_of_node()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "coresight@lists.linaro.org" <coresight@lists.linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 prabhakar.csengg@gmail.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Eugen Hristev <eugen.hristev@collabora.com>, Rob Herring
 <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <87fru14hl7.wl-kuninori.morimoto.gx@renesas.com>
 <20240529004047.GB1436@pendragon.ideasonboard.com>
Content-Language: en-US
From: James Clark <james.clark@arm.com>
In-Reply-To: <20240529004047.GB1436@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 30 May 2024 21:39:18 +0000
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



On 29/05/2024 01:40, Laurent Pinchart wrote:
> Hi Morimoto-san,
> 
> Thank you for the patch.
> 
> On Tue, May 28, 2024 at 11:55:32PM +0000, Kuninori Morimoto wrote:
>> We already have for_each_endpoint_of_node(), don't use
>> of_graph_get_next_endpoint() directly. Replace it.
>>
>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>  drivers/hwtracing/coresight/coresight-platform.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
>> index 9d550f5697fa8..e9683e613d520 100644
>> --- a/drivers/hwtracing/coresight/coresight-platform.c
>> +++ b/drivers/hwtracing/coresight/coresight-platform.c
>> @@ -275,7 +275,7 @@ static int of_get_coresight_platform_data(struct device *dev,
>>  	 */
>>  	if (!parent) {
>>  		/*
>> -		 * Avoid warnings in of_graph_get_next_endpoint()
>> +		 * Avoid warnings in for_each_endpoint_of_node()
>>  		 * if the device doesn't have any graph connections
>>  		 */
>>  		if (!of_graph_is_present(node))
>> @@ -286,7 +286,7 @@ static int of_get_coresight_platform_data(struct device *dev,
>>  	}
>>  
>>  	/* Iterate through each output port to discover topology */
>> -	while ((ep = of_graph_get_next_endpoint(parent, ep))) {
>> +	for_each_endpoint_of_node(parent, ep) {
>>  		/*
>>  		 * Legacy binding mixes input/output ports under the
>>  		 * same parent. So, skip the input ports if we are dealing
> 
> I think there's a bug below. The loop contains
> 
> 		ret = of_coresight_parse_endpoint(dev, ep, pdata);
> 		if (ret)
> 			return ret;
> 
> which leaks the reference to ep. This is not introduced by this patch,
> so
> 

Nice catch, I will send a patch.

Also:

Reviewed-by: James Clark <james.clark@arm.com>

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
