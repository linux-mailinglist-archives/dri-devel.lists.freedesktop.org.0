Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 757AE86B3FB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 17:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB60F10E034;
	Wed, 28 Feb 2024 16:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="ccSTNqUl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2124.outbound.protection.outlook.com [40.107.7.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B83F10E034
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 16:02:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYRcf51wdR5ExnBNdJSiyl7zoYdzAaGJeWknCLuU090ieaKnFvQQTXzOUeD3xiP/tTIV+ws7PphSHzADQnDIe1ZhVrGxYWy8+Imtp/h/MaquD30yYTYmIavbB6L7en2QS/LP59caTNyxt/C/+lf06k2JngB6Js8PWerevHE5PXVi74GzZj7imsmS0uPKNgGf/RKll+p9vpglATPV9okNp1Exzq6hCxyx670ZspsMLVqakHykDpoWAXBoMVdcTx8sNdhzBecsLUpZ6yiu9e6XkY/GeXSJiS788PvA1/iInNl49fWNAT3yOYxZzPtWsSrw1wVT09w/6zyw4l1XlQJ87g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ib60+e3Xc5apGQ5aBkGV/ytaz92nOBR4XuijNtrje0k=;
 b=I5nD3wYrbyY67AwgVLKr7YRPLdI8K9+kCbis+ZcFh1hXH/LOHNi2tCo9PRS/BhoPtULoWzswQNhNaX/RAk21XXf9yavw5g7OMIhLgb4m14Qt1hiRbjN+QjolJ4bhmvdQpxtCZLiA+q5lgqkZ2I1v06WKpsUvsqF4bU8vUD6VpRfeKjZJ2/QOsS1AgzKX36GMdfQnE19xM5rIERugBXP7kRMAEdfymw5n80F024yE+vtqmnZ2DmZauCuO4pEPgLtdER3gFQlLZD39BHIablTGQho3HITKP4jr2fXPFPEce9pY5YfO+DeVb02skH+tQKxhRBxm5Jy52Sf87ay/s5sutw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ib60+e3Xc5apGQ5aBkGV/ytaz92nOBR4XuijNtrje0k=;
 b=ccSTNqUl9CL3UVb6cxZ1eDzPgbUDX3rnYMVQvtTqRKvP/205Yvcf53f1lfsBXu0toXm9xFqCU56Oh6VYYzCY7CDb23o7odP3pKsfqHVt8etSDPM9+bbDIe9OHL+hbIFhZMhTPsKM5pYlj0U5k0eDHwtwXhy8rn3dA+LSI/ItV+Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by GV2PR08MB9280.eurprd08.prod.outlook.com (2603:10a6:150:e1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Wed, 28 Feb
 2024 16:02:13 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Wed, 28 Feb 2024
 16:02:12 +0000
Message-ID: <2bbd5eae-f963-40d6-a827-1c273ef5b211@wolfvision.net>
Date: Wed, 28 Feb 2024 17:02:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/8] usb: misc: onboard_hub: use device supply names
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
References: <20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net>
 <20240228-onboard_xvf3500-v5-1-76b805fd3fe6@wolfvision.net>
 <Zd9TLL0IM08Wh63i@google.com>
Content-Language: en-US
From: Javier Carrasco <javier.carrasco@wolfvision.net>
In-Reply-To: <Zd9TLL0IM08Wh63i@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::20) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|GV2PR08MB9280:EE_
X-MS-Office365-Filtering-Correlation-Id: 237ac6a4-ea7b-41eb-db53-08dc38769ff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SLGwEBOOT+5MSpbib6+XzdYlFSd+zYVKbpSSAXhTSNGhxS0uKshMjDYoj7A3imsjXf9gv+12gFm7rCjLMe8gomoksmiTcdlsd9TZ5cS6VysDnf4uqEuPF25fzNHycrhAwgp+PrVXGkDFllItloqUuMnYgzGY7ZxqJZt1xlCGBn6dQ6YfZXLXxvByROsuJQnCpbKCOYoaZJe7e1M/96DrzasVGepNoJ/lBR404RmKslA8FRkSvQxjNwapg+SL6WfxQax7Rwk0KO/i7ZITleeU7IRBSKdJXKXvy/aVy9KTbV7GkpAKHCrz6MrmFGKeGbNKRJsNfH/w7tIUSLiJyohI21VnGbBSt1HQ7wQ10iTv3cK5+5mkzIycZvQJWfBfRnztGuD1LnR4ePVPSEU3BdZRJZPNkHsWMmmMdKl9acfhoBvbmzUIVPdpo4BLlJ4DJwFvAQlH40c+OPwC9mTrsJc9hHxG85XrbtlHPuX9CrAAsUxQ5XjfiInZh9vx/SymwaOArbxCTOE9yNAHztleswSELXzeFQxxV3lejup63ZV1qKdIpsv0QpPNWG/Me3oRgH3m9x2jHYkbT3aDWwjujkawCXDM3KXNG//tT1S7LRvRTPGfW+PeYwqMu1fQFXQjsEka/HtNVsDEMIyH1A6D2UCFUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWhDZlVYdG8wZitqYzJtYnpKSkFxdi80Zjl2YU4xQi9GUXpLbDdjOVlBa3Jk?=
 =?utf-8?B?aXVyeUpHSGRTM0wrOWpqWTRIcG9MVkUzZFVzRUorQ05YTy9kTTJpRVZSRHNW?=
 =?utf-8?B?Ukpqdkh4YnZrQUh2RUlXMmMyZEJNZ0tnNXBTZVRWb09oaXRZckNncUhObkpH?=
 =?utf-8?B?QWpMM2pKMUduMUxnaTA4WU9KU1BybXZNd2EyTnZ2VTVUTHI1cXJlL2M1dVdS?=
 =?utf-8?B?Vm52WUxtOEJXemNQaTBjNzNyS29iYnBOSGY1TGcrckVuNmQxaXBmVkhnazU5?=
 =?utf-8?B?bG1TMlM2S2dMRngvVVgybHhWMUg2Nmc5TGRNMUNZeEdBREVER0tVRHBZdVkw?=
 =?utf-8?B?aWNFcU9GVGJwRnJNK2FHR2NtWDlaWUE5ZWJSMExXazBnSDB3R1Bid0Y3N0hy?=
 =?utf-8?B?Wmd0SkxDUnBSSVBxZTB6MHIrM0s5cFk5T0lBS3NLbnRCRnpoSnZlamZFZGI5?=
 =?utf-8?B?aUtvT0RhNXZveWNldmdRMlF4NitNNC9kZEE2aVdhU0QzK28zc2k2czZtZGF4?=
 =?utf-8?B?QzhnVlllS002QnNoRFJRaGNjZ1dnWDFsWFJrMHhYeGxBNkxWTFc0ZFZpa0tU?=
 =?utf-8?B?M1Z5VGFtOFJRQVpwY0FwYVhKZlNPK0lKSk93dDhtaVhDT3k4SkVEY1NLeDJH?=
 =?utf-8?B?c3IvRUhraHlxUlNLSm9iV0xZc2tZRzVNM2xHZU1CN1dHWTBQRmkyNDM2MjAv?=
 =?utf-8?B?Vk9nL2ZlRlhJTzRGeXdPOHgvamJuckxTNm5tQ211Y1Y2Z1VPSU1EejRscHNK?=
 =?utf-8?B?cWlGbmNEemU4QUVFeG82NXVmYmVoTDNLbVA2blRFWVRPWmZEWUYvcEpqdnoy?=
 =?utf-8?B?T2NBMURUWS9WQ3kzREg5SDZPNThqY2R0eWo0cGRObSs2TUxiK0RleEh1dldQ?=
 =?utf-8?B?b0VFOEZNUlFJV2pMZm9pZW5JRDR6VHhPMmhJRnYxQURkN2k5dUVCZUJUbkQ0?=
 =?utf-8?B?YW50bUxad1ZUdndRT3ZZOEh3eGg2MGFwcTdCd3lSTHZVZEFJN0E3aGd1VFlI?=
 =?utf-8?B?SHV0aW90RzhZOW9SRk1BWHV2V2JFNGNpc0xBK0h0WUtXVkFTZTNDUVphL1ZK?=
 =?utf-8?B?czdmTTBXOHB3eWhmSmRXNlpCRm44clMxT2JyVWQybkhRVlFRekFBRkZhWnhQ?=
 =?utf-8?B?eHJtWjAwaVlxcm94NG9GZTB4VzN1cnl3eHNGNFlnZitCdTVTTVlzQ0NTMHRL?=
 =?utf-8?B?SlFUVTU4TExWV1lic2NoaHZ5RGN1ZTBMbGt2Wkp1ckU1cmVGcDBBb29VTm9l?=
 =?utf-8?B?Q3doRVVpczVmYmczYmVtbnd5S2FZZ3BOQVJCcDB1WGdMNjlxMkR5YmwyTS9R?=
 =?utf-8?B?aC9hYlEyYk94dlBhSFdiN3VVTHJJaUYvUDg3RHNla0E2aTBScHl1ME5yTlpp?=
 =?utf-8?B?MEJHYmY2THEwcWNuNHZzOWFqK21sOHVyOXFDM3VKcU1GV3QrcVp4azlEekkz?=
 =?utf-8?B?N3JnK1gvT2J4bUttZTVwTjRNSjJxTkNFTmlvZ2pjSTB0bkJwRnQ4YmhEbytw?=
 =?utf-8?B?UHlvelgvME4zbzNQZ2V5bWh0SUNNTmJjOEFMOGFSNWs3WklMWnVxMk13T2w0?=
 =?utf-8?B?enllTzU5U0lhK2lWSFhSajJVZGlKS0IvQW1RU0R6WEhmWHUwNXd5ZFB3TVNI?=
 =?utf-8?B?S25iVEpFUjJjUkt0N3ZZREVCcEhZcXJFeWdra0NyMWdULzQ4TElJMXErcXdk?=
 =?utf-8?B?Tml2TElUMUxxamg0bUFnMW5lTk81bm9WWm5xbXJheFFvM1ZQNjAzTkJVbExJ?=
 =?utf-8?B?MlZoQUh3TUFQeXRwQ0pSNEtWRFhDdVVmckVSckhPbFFlUDRGVXdkclY4bTNn?=
 =?utf-8?B?WXV5VEVIRXJTcngyMzlLZ3pVT1JiNDJsd1JOVENjMU43UFVBa09DWDhvVWJH?=
 =?utf-8?B?MGk1NlJHTUs3SitIYjk3aUVkb0I0ZTFyRHZqaUNCWW9wM29iTis5RCs4VDQ4?=
 =?utf-8?B?OVF6OFNISXgxNklXWiswVG4ydXorQmd4b0tLUE5CeGl4VnVCVUx1aXpRWXJY?=
 =?utf-8?B?UmRhVkhjaVRBUE1zbWVoRGl5cWZkbkdqVmdHS2VtZzUvYUhIQ1l4ekRtUzdV?=
 =?utf-8?B?ZnhlenRxbFU5a3hUU0Ezb0l6d0ZRM2xjQlF4T3pOUjVOMzhhclkyOXlCTGNS?=
 =?utf-8?B?c2NlUDZMZGNIUkFCeDBGSHNmS1N0M2xlWWoyaXM3VnVpS082UTdRb0hKamw5?=
 =?utf-8?Q?rPPcOU1kiHlUGbducr2UOGw=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 237ac6a4-ea7b-41eb-db53-08dc38769ff1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 16:02:12.1730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxndB1uaJpZ6BN1hNH2dWNvD/5R3FC2flfAV+jdTMfUOmFfHSFLK47loP2F9JxHNrvyZwsfi9COvE+xIc0Fk7xf8D9LJDQVlWm4LBhHWm38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9280
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

On 28.02.24 16:37, Matthias Kaehlcke wrote:
> Hi Javier,
> 
> Thanks for moving this patch to the front of the series!
> 
> A few more comments inline.
> 
> On Wed, Feb 28, 2024 at 02:51:28PM +0100, Javier Carrasco wrote:
>> The current implementation uses generic names for the power supplies,
>> which conflicts with proper name definitions in the device bindings.
>>
>> Add a per-device property to include real supply names and keep generic
>> names for existing devices to keep backward compatibility.
>>
>> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
>> ---
>>  drivers/usb/misc/onboard_usb_hub.c | 49 ++++++++++++++++++++------------------
>>  drivers/usb/misc/onboard_usb_hub.h | 12 ++++++++++
>>  2 files changed, 38 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
>> index 0dd2b032c90b..3755f6cc1eda 100644
>> --- a/drivers/usb/misc/onboard_usb_hub.c
>> +++ b/drivers/usb/misc/onboard_usb_hub.c
>> @@ -29,17 +29,6 @@
>>  
>>  #include "onboard_usb_hub.h"
>>  
>> -/*
>> - * Use generic names, as the actual names might differ between hubs. If a new
>> - * hub requires more than the currently supported supplies, add a new one here.
>> - */
>> -static const char * const supply_names[] = {
>> -	"vdd",
>> -	"vdd2",
>> -};
>> -
>> -#define MAX_SUPPLIES ARRAY_SIZE(supply_names)
>> -
>>  static void onboard_hub_attach_usb_driver(struct work_struct *work);
>>  
>>  static struct usb_device_driver onboard_hub_usbdev_driver;
>> @@ -65,6 +54,30 @@ struct onboard_hub {
>>  	struct clk *clk;
>>  };
>>  
>> +static int onboard_hub_get_regulator_bulk(struct device *dev,
>> +					  struct onboard_hub *onboard_hub)
> 
> Let's call this onboard_hub_get_regulators(), it's an implementation detail
> that regulator_bulk_get() is used for getting them.
> 
> no need to pass 'dev', there is onboard_hub->dev
> 

Not at this point, though. The hub->dev = dev assignment happens a few
lines below, but there is no reason not to move the line up. I will
modify this for v6.

>>  static int onboard_hub_power_on(struct onboard_hub *hub)
>>  {
>>  	int err;
>> @@ -253,7 +266,6 @@ static int onboard_hub_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>>  	struct onboard_hub *hub;
>> -	unsigned int i;
>>  	int err;
>>  
>>  	hub = devm_kzalloc(dev, sizeof(*hub), GFP_KERNEL);
>> @@ -264,18 +276,9 @@ static int onboard_hub_probe(struct platform_device *pdev)
>>  	if (!hub->pdata)
>>  		return -EINVAL;
>>  
>> -	if (hub->pdata->num_supplies > MAX_SUPPLIES)
>> -		return dev_err_probe(dev, -EINVAL, "max %zu supplies supported!\n",
>> -				     MAX_SUPPLIES);
>> -
>> -	for (i = 0; i < hub->pdata->num_supplies; i++)
>> -		hub->supplies[i].supply = supply_names[i];
>> -
>> -	err = devm_regulator_bulk_get(dev, hub->pdata->num_supplies, hub->supplies);
>> -	if (err) {
>> -		dev_err(dev, "Failed to get regulator supplies: %pe\n", ERR_PTR(err));
>> +	err = onboard_hub_get_regulator_bulk(dev, onboard_hub);
> 
> The local variable is called 'hub', not 'onboard_hub'.
> 

Good catch! Actually this patch alone would have not compiled, but once
the renaming is done, everything is ok again. I will fix this for v6.

>> diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
>> index f360d5cf8d8a..ea24bd6790f0 100644
>> --- a/drivers/usb/misc/onboard_usb_hub.h
>> +++ b/drivers/usb/misc/onboard_usb_hub.h
>> @@ -6,54 +6,66 @@
>>  #ifndef _USB_MISC_ONBOARD_USB_HUB_H
>>  #define _USB_MISC_ONBOARD_USB_HUB_H
>>  
>> +#define MAX_SUPPLIES 2
>> +
>>  struct onboard_hub_pdata {
>>  	unsigned long reset_us;		/* reset pulse width in us */
>>  	unsigned int num_supplies;	/* number of supplies */
>> +	const char * const supply_names[MAX_SUPPLIES]; /* use the real names */
> 
> The comment isn't particularly useful or accurate. Not in all cases
> real names are used and outside of the context of this change the
> comment is hard to understand.
> 
> I'd say just omit it, the name of the field is self-documenting enough,
> there is no need to repeat the same in a comment (as for 'num_supplies'
> ...)

I added tthe comment because I can foresee what is going to happen:
people will copy the names from existing devices, we will have to ask if
the supplies are actually called vdd and vdd2 in the datasheet, and then
the real names will be sent in v2. Especially at the beginning, when the
supported devices are using vdd and vdd2.

But if you think the field name is self-documenting, I am fine with it
too. I will remove the comment for v6.

Thanks again and best regards,
Javier Carrasco
