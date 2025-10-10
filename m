Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9F5BCC449
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 11:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0350710EB71;
	Fri, 10 Oct 2025 09:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Aw/W2grF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428E610EB9B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 09:15:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZ8ipVjK3qM0ru+Yc3LXjc7vRrM7WPcmXusxxxb8q8n1Ii1E5f+y5Bx0vcbGnB4ct1YVwKGfc2DY0j2WcWP2AS8RreeJLhAwLgaQajajm848x3R8BrKP7PETEeDZEVqC99efwt2ER+OaVAu3wbdd+4BMXzQbtqQhP4y2gNZu27Kh6W+kSGa6xr5BQazVOHrWa9Yr4ecaZWmsEifadOD7Uzf0g91rG7A+bE4Rmai8ibtgsyG+DUAGa+2HHISVTXOFSfR3ZoPdGabeguEXYUcaDfzJIf9rAOV2lbfKOK8dPSkn2e6jrFYjDWA943D372qajpioS1/TGR8LwjJGLhQ2oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkjNMynCHTgrgIQQYMbMWRU9ktKLnigG83pOID98/DU=;
 b=qhwk1DNJBqokRfTqxKoMhOWEV/x8qOoCwvmi95dmETwcs47Jn+eeK3q0XouhdqT8bhNy8/YD9kdyrM+0hlcRjl+tNjqB4SzrbECLSphIJ7ySHuRymvw1+/3ErlahdY78FSaz4JsALqYjkZ7frQUIOKZh6QWf2JQ1VGl4rL1qbm8T9SkZKlnZBXsvaBCD7lrxRQf4czHh0EjMjIGQ15vJtt5aO4yB3IfSJ1mQjQkFSawT7pGLThjUYyCLQe7p+9jOT56o48UxvDqJFFCMzJGGygcyN0+qtfu3Lyyvh/1JWo9BaqsmagvCQUTZ+wb2c3iSanAQRAu83XTw+A2nWBmsWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkjNMynCHTgrgIQQYMbMWRU9ktKLnigG83pOID98/DU=;
 b=Aw/W2grF92x58rhHoBT/dHdPLqDcMXv7kVqxn7XK5ItPk5e/OxsZrrO8fFujdlg1KQTZ1mxmcbFhyzSuhsWfKvEZFdwoVZEwx80wUbwB+CsLyz4ZsX8vIE98pv+jUCCBmw6u0ZwoC59rEPBNjVMCSd9M2nAe0EsRmBBMDv4Ugpwcrah9PhkTC62rRtIwlhlBpUsxSXJmBt/ek4LL3MrrYqQrxox1V6Zs5kMzBtcn78OpE6h5qWCLbiOnkPTSrSDB9jaLt8nPiF4yGVcKmLGAmaYkFkYvmFxsVKc2qBSVgQgU/cr6AGawkudXTe/ecZXMbgW7NMuq922u+8fXN7FGXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB9627.eurprd04.prod.outlook.com (2603:10a6:10:30a::13)
 by AM7PR04MB6933.eurprd04.prod.outlook.com (2603:10a6:20b:10d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 09:15:17 +0000
Received: from DB9PR04MB9627.eurprd04.prod.outlook.com
 ([fe80::c5f7:3093:4ebd:1a2]) by DB9PR04MB9627.eurprd04.prod.outlook.com
 ([fe80::c5f7:3093:4ebd:1a2%6]) with mapi id 15.20.9182.017; Fri, 10 Oct 2025
 09:15:17 +0000
Date: Fri, 10 Oct 2025 17:14:52 +0800
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: airlied@gmail.com, boris.brezillon@collabora.com,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 prabhu.sundararaj@nxp.com, simona@ffwll.ch, steven.price@arm.com,
 tzimmermann@suse.de, xianzhong.li@nxp.com
Subject: Re: [PATCH] drm/panthor: attach the driver's multiple power domains
Message-ID: <aOjOjFVGb8MLjvYI@oss.nxp.com>
References: <20251009140039.101189-1-jiyu.yang@oss.nxp.com>
 <20251009160820.74f04ead@fedora> <20251009160929.1b36b9ea@fedora>
 <aOfPaQWIVzMaWlSl@oss.nxp.com> <20251009172320.6a2cbf55@fedora>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009172320.6a2cbf55@fedora>
X-ClientProxiedBy: SG2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:3:17::24) To DB9PR04MB9627.eurprd04.prod.outlook.com
 (2603:10a6:10:30a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9627:EE_|AM7PR04MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: 34d105d0-27d6-465a-70ea-08de07dd8705
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|366016|7416014|376014|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q5wg0S2FVKqWWLprA27l64rg8FWucFv7DXUgxgUqoVr27842x1oEgEfvFiir?=
 =?us-ascii?Q?5hOlF2Hqyv3tHrGqTkQxvtqT+ryMXWuDXs1/bYywr9qrmuhI0umk0FpAKgcs?=
 =?us-ascii?Q?Huct2PMSAdgYSEpv+G4WZlusFRHdBiEYZY1qEvCcx8Qx4qPwO7V0MQfT5DWj?=
 =?us-ascii?Q?DOhawj/TyeVfHhcU7f9tVRHehkY9P3NRX6rpnCF/3KemS9Ab+gkCW6PvGevu?=
 =?us-ascii?Q?tGSH9cZbe6aTkmFSoTEg/GIqG+lJGSH5iklTc3EGIzBM8Dl+DBK/3UIk6zXg?=
 =?us-ascii?Q?h+NnkvtT3f/TawEXcaB8F/oyQ59bzOJVzjnz5qhdkr894Zk8Z4iRTfdZV7Dc?=
 =?us-ascii?Q?FrCZm6tSLai6OLeSKCDt++pzV0SerdgUES8Whbn42cqlbTKfm0+z+siqTkFR?=
 =?us-ascii?Q?HQDIivZOW0lZxlTXpZ2nreyObuz1/pO+hTczVzH4qk00Hdra1wes4r5U4Km5?=
 =?us-ascii?Q?ijexCfyWX5Xe82e9P8a0j/SBiZA9XmRqcLJZahQIL57/7qsRJrrrluFryE9z?=
 =?us-ascii?Q?c2RBrPpGe10JA9aO6h2FQw3Hp4ByXcJZwZKBqU3DN9i/skJUBEhq62d0OclK?=
 =?us-ascii?Q?V7HDQOCK4j3PYMckzZVk5NIjU6A7ayJ7DcrcqTzIT8uBImpoUF5qIh6jepc6?=
 =?us-ascii?Q?uQWHFaWtBaY2s27D6kKhdMVaXGm33UGiYSNan3YFN1rp8R+mkO/cpEBpEA5x?=
 =?us-ascii?Q?D1cQZgvT4S9MNCaPEdOV4QLcMppiQI3uXFQnCB/GedMDYEDxvbXsLXsHnd17?=
 =?us-ascii?Q?9tzavb9AobsNbn8OiRIY73lp6F+go53pyGBGArxQSjh+NJBfhofgZzr7C497?=
 =?us-ascii?Q?XqZXcr+M5mJbh1wpFv/8WqCyJiVV0Lvbd9M9EepZiMF6DXUp/zDOf/zkG+Ug?=
 =?us-ascii?Q?wxuyInGV4BAE76w3AUOAyYFlx/aO504SMib8ZDcYcMZ/LZhi9TPBqqKUOEM9?=
 =?us-ascii?Q?nhtqAgq5ZiYXPOemMN5xNtcjdRgqUVhtRb+zSPWsJG6fPUdTNiZ1G4vAbG6W?=
 =?us-ascii?Q?U/cK1NvDWlL1jqH5WuGssE0joXEQrYv87H2Y0j6G0Fvxm2OadxxUIila51Zu?=
 =?us-ascii?Q?QV47w5qEgUtGydtWek6ynkt79xIXPBOGtoeHZsAOgYSLObPlFFfIye8bC6bl?=
 =?us-ascii?Q?g384iCv7VL3wZ6eQeJh4GsiMcFchOQ9XGHzARoGUTIeDP3s/ZnJBVgjQEWXz?=
 =?us-ascii?Q?zOy9kXa/n671lgIUMsxpEzT3yjd7xhFA2FbUNcEv0aQ9cz3o3J1zf4akoQ7m?=
 =?us-ascii?Q?0Sq0WeXoGntWaRFisMP556xR91tFZ/PZF8gdKYVLAqDLG/5fbLfZd6o9dyHv?=
 =?us-ascii?Q?RPTqZaVKKfFgac989f3XYfZ9hXGCz5chFHC3+A2Jarh0L32WtgedgRh7UcEf?=
 =?us-ascii?Q?kOYzQOLGhjDSOjkGoQQeeNCJLqhnHSXecFKw5Yj//u592Yu2NEbaVLEB3GGM?=
 =?us-ascii?Q?zUcM+eyGVnKq2iFh0LFUhiXSLhzdk8+LEGmlmL2E8FtFkTqz84cFuC7oAymS?=
 =?us-ascii?Q?GWsXXLcAoPfN8Iou/xb11D2EwBu4TVQalSsG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9627.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(366016)(7416014)(376014)(52116014)(1800799024)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MQfVVZKZeMkesXFjuZufSsKx1g1m4xY02kqm+izT6FMTdgunESoQlD0DEdDf?=
 =?us-ascii?Q?MfRI0i9AxAednZkf5Av/6qHapJLESoDh3CD4WCUOwxOQMsOHrv6Sor3p8kZd?=
 =?us-ascii?Q?LWArJkCbWhmo56+YiKa8zKC9g3GShnuc//GNgAQbn0Yv6JwNdis/Sm6TVdOv?=
 =?us-ascii?Q?QVTymviKFT6igBlCsxG/xP6DP8uV9GtWCr58a3LQydOjdN0mRsYfDsx9WA/U?=
 =?us-ascii?Q?MVkzI9t9JCEJ7VK3hG3glCYGjD2ehb6JVqTM5TdSTiVEZV9MsDy0fSioNHdv?=
 =?us-ascii?Q?Q+KBuLAyqD4KVeLxFYgEC8fySqUDvqVGLpngZgb8CDDgaifk5dtXCu9VRNso?=
 =?us-ascii?Q?1Y+HZH6uDnXe0jOXnIpI19FMiLcMfvHiUPxl49LApyqltd4t2rhcrSDwGhvc?=
 =?us-ascii?Q?nDmnuSL+UiyHh0LNvkq9ow8JYQ9reN79UXqWvnFR8eKl2WgKVU55cHWYxUXv?=
 =?us-ascii?Q?aFtINA08QEBllV4AZhFc3Zw3ANFxwUh1nuAvtJu1Q86FjtBGsXqdPdeLE9ln?=
 =?us-ascii?Q?Xx5zbIvP5JC8cVSwcSyYfshgqQ6GVBbhyo2Na131HwBx4yxNK4Au7CmietO7?=
 =?us-ascii?Q?hopZ/zZz95ttXKKafJ0qrrl7B7UD43evRes2uCMKFGIhfC5EHMCAZMpa4NRV?=
 =?us-ascii?Q?JIZpPqsE79dQtcoQBZxu2XnsTMsKwCwgAl34lapH2iTzf+0RWCG1egvUEduO?=
 =?us-ascii?Q?LGRcFawxm4qWYRayjM9He7HNHmC6CSHZUM5pw+i4+MvjxMH2c0L/hShsEa5f?=
 =?us-ascii?Q?LSzn1FaHL2diYQMSQkY3gXneKXn9eoPzOrvsHbfb35cSJwk5pYUR/q72gTkB?=
 =?us-ascii?Q?CeNwtWMvPqGzUguuy9pwpzVean3vEexRHrJKaMtCKH+jSl++c7Y8ba05BG5S?=
 =?us-ascii?Q?TDlekhMvW9vDAtEhfKIjBkFABybNowjn47ML06kfYT8XNM8SwkgvVFJ3kctb?=
 =?us-ascii?Q?r24Cv4NIoyFlaWpO7uCDnWH5ULD5Ds0Iu2gVgNcpcA9pOtRcG9Nv5+sOWQXh?=
 =?us-ascii?Q?pP+60p+u2DvuRDkDbI5xEaP8lLCblRCIFn24z2BJQdy6ewI5o7A56eSdIjdK?=
 =?us-ascii?Q?VHVqGb0B1J4Y48k6VWryufByPujH4XpVnqEeYnI67OPTIU/7FlamQ9eLBCnA?=
 =?us-ascii?Q?IX7ny7cDoW0oXFLBxjONqjDTrnqJ6FZ2RFNQkjdq+jlhljBoHBKXGhlbFrBR?=
 =?us-ascii?Q?1fARidGcV9gUQc3RH4ZZHQaakrhcA+mFJCzQB9iQ3VfI5/RMvhJVyEQ/UXr4?=
 =?us-ascii?Q?XDvnSA+X99VZ6BOgHtDUGHSSqBJnylS9IFGV9WcW2eylLnUBF529g4fvrKAg?=
 =?us-ascii?Q?1eCfkVion7QyteB0UINY/eF1tmVXjfFKq2ExNpLKTWlgsfbISRtOrBEEThGU?=
 =?us-ascii?Q?rK84wOmh8zLdY2lX9lJUTd4uoi/bbVJI5jysBsQvtZvTge8x0Spj0YmcEoKe?=
 =?us-ascii?Q?0rUzj5cwiuhe1lZsE5ddN061J+DnW3UKZf6imlxswJWU/pxUSKQ8l1aKnGsC?=
 =?us-ascii?Q?nPkFRLaZLvLQr/OSB7OrBAXhrkYxjPxXqIkbh+A4vkLvIxY2FMxFTSM7bs+B?=
 =?us-ascii?Q?3wONilc/ouh6c1XD9YT87so3ll+SLHET8GKXR++E?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d105d0-27d6-465a-70ea-08de07dd8705
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9627.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 09:15:17.2603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QEPoLcCl7NPBXBTB61UCu92vhgVWFSj7QtnzlXtJAWHviqqHgShJjhtZGJYFik9YAFptG7UA+RDCzBeYivv5gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6933
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

On Thu, Oct 09, 2025 at 05:23:20PM +0200, Boris Brezillon wrote:
>On Thu, 9 Oct 2025 23:06:17 +0800
>Rain Yang <jiyu.yang@oss.nxp.com> wrote:
>
>> On Thu, Oct 09, 2025 at 04:09:29PM +0200, Boris Brezillon wrote:
>> >On Thu, 9 Oct 2025 16:08:20 +0200
>> >Boris Brezillon <boris.brezillon@collabora.com> wrote:
>> >  
>> >> On Thu,  9 Oct 2025 22:00:39 +0800
>> >> Rain Yang <jiyu.yang@oss.nxp.com> wrote:
>> >>   
>> >> > From: Rain Yang <jiyu.yang@nxp.com>
>> >> > 
>> >> > Some platforms, such as i.MX95, utilize multiple power domains that need
>> >> > to be attached explicitly. This patch ensures that the driver properly
>> >> > attaches all available power domains using devm_pm_domain_attach_list().
>> >> > 
>> >> > Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
>> >> > Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
>> >> > ---
>> >> >  drivers/gpu/drm/panthor/panthor_device.c | 6 ++++++
>> >> >  drivers/gpu/drm/panthor/panthor_device.h | 2 ++
>> >> >  2 files changed, 8 insertions(+)
>> >> > 
>> >> > diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
>> >> > index f0b2da5b2b96..6f40d053b16c 100644
>> >> > --- a/drivers/gpu/drm/panthor/panthor_device.c
>> >> > +++ b/drivers/gpu/drm/panthor/panthor_device.c
>> >> > @@ -218,6 +218,12 @@ int panthor_device_init(struct panthor_device *ptdev)
>> >> >  	if (ret)
>> >> >  		return ret;
>> >> >  
>> >> > +	ret = devm_pm_domain_attach_list(ptdev->base.dev, NULL, &ptdev->pd_list);
>> >> > +	if (ret < 0) {
>> >> > +		drm_err(&ptdev->base, "attach power domains failed, ret=%d", ret);
>> >> > +		return ret;
>> >> > +	}
>> >> > +
>> >> >  	ret = panthor_devfreq_init(ptdev);
>> >> >  	if (ret)
>> >> >  		return ret;
>> >> > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
>> >> > index 4fc7cf2aeed5..5ecb541ec67b 100644
>> >> > --- a/drivers/gpu/drm/panthor/panthor_device.h
>> >> > +++ b/drivers/gpu/drm/panthor/panthor_device.h
>> >> > @@ -196,6 +196,8 @@ struct panthor_device {
>> >> >  		/** @recovery_needed: True when a resume attempt failed. */
>> >> >  		atomic_t recovery_needed;
>> >> >  	} pm;    
>> >> 
>> >> Add a blank line here.
>> >>   
>> >> > +	/** @pm: Power management related data. */  
>> >
>> >Also, the comment is wrong, and it would probably make sense to move
>> >that to the pm sub-struct since this is PM related.  
>> thanks, will fix it next version.
>> >  
>> >> > +	struct dev_pm_domain_list  *pd_list;
>> >> >      
>> >> 
>> >> Do we even need to keep the pd_list in panthor_device if we don't do
>> >> anything with it?  
>> The second power domain is typically used for frequency scaling. The driver
>> works fine when there's only one single power domain. That said, I will update
>> the implementation to attach multiple power domains only when the domain count
>> is greater than one.
>
>That's not what I meant. What I mean is that the
>panthor_device::pd_list is never used, because the extra power domains
>get attached to the struct device directly, and the PM core
>automatically enables all PDs on resume and disable them on suspend.
>Because it's a devm_ function, you don't need it to detach the pd_list
>at ::remove() time either. TLDR; that means you can pass
>devm_pm_domain_attach_list() a local pd_list instead of ptdev->pd_list
>and you can thus drop panthor_device::pd_list altogether, I think.
>
>If you intend to use the pd_list for manual PD control in panthor in a
>follow-up patchset, this should be mentioned in the commit message.
thanks for your suggestion, pd_list will be allocated by devm_kmalloc.

I have not found a general solution to modify the frequency via SCMI perf
and OPP framework except the manual PD control, I'd appreciate it if
there is any idea.
>
>> >>   
>> >> >  	/** @profile_mask: User-set profiling flags for job accounting. */
>> >> >  	u32 profile_mask;    
>> >>   
>> >  
>
