Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DD7609F73
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 12:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A661E10E348;
	Mon, 24 Oct 2022 10:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D887B10E348
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 10:56:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mq/MmXK64WvepQcFCe/48fIur2dudWmRW1hV08vkH9P4JFIJHC4qIWESc6yaggQMbVQiEEwRsOMBg9JBn3byppeh69TIhbafoVvjthdnPYU6bH1awzVcsLCoGmduLl8NPnC8kGE+TAnG1k5rB9BNJTp3UUqTRr46Nl+2XOG2VU1imakl+bTHs/RnF18Sh3M+x5DKRTk47UwQfPUT6pEm6Epq6naIKaKpxSsPdUnfLlrUqDvNzPNKJYWqZiPvKkMHjx8atCiQOaYSiB9KwPnsv+r/Jclbw1iKZSiCFdYzrqDCnR253RO+y+AP58MmXHCZs4juXGVK/25O5HXJ7tIWBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2VmSXO9UaTrjVAsYKn+a85mymSKPFGb4m9/4I6gYpY=;
 b=eFOtlXc3GQDWr7lczATV+cbETNLPyltWCJuaG+A+KYNE2NucgA2zLPE+51ckOP5wEG51yNpCWSJM60DpPhyO9UvLfePoKqNsaVW/DMUPFmEHHL1y++9ZDGYHXI1E5i4xIDH5vPuQpDs1ax1J2CIus7wGL4WaJCL8FHRfwnhCj5ImfzIb7WeHkHdq37zY88a5ZnC8DLvsHvqkkFEQxBjDe8bw/uyQfdcCRNG5KVJtLR/FjIpvl27S71dNSiL+lf60qLNhFb/ZiiutVNcmMxVnwnQbc23nHKRiQOl0z5MI8wSewjizrTmCPDTvnaInCjwMa4AzHxUbMT6uEzXsomNvYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2VmSXO9UaTrjVAsYKn+a85mymSKPFGb4m9/4I6gYpY=;
 b=ZS281TO5m8rmvxMSbEQQ0YMb1MQbAvl3K2V4lq1q75AFDfYY44Oe1g7TAVDev6GzThMmKU9BabSd8EsiAcT8AILy8ItXiUP7gKRmMOzf4pcFISguPopNZ074NJDP0Q/BA5vwIZKiLV7UPoEO9gfVKLXrkA57rrSm98U2OHJWpos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4582.namprd12.prod.outlook.com (2603:10b6:208:26b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 10:56:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279%4]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 10:56:30 +0000
Message-ID: <a609cff3-b3db-1f17-832f-99652356e74e@amd.com>
Date: Mon, 24 Oct 2022 12:56:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] drm: Switch drm_client_buffer_delete() to unlocked
 drm_gem_vunmap
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20221020213335.309092-1-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221020213335.309092-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR10CA0081.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4582:EE_
X-MS-Office365-Filtering-Correlation-Id: 114a8e3f-b22d-491d-eed9-08dab5ae6867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TUr8uDzSJ+WlviSGR9lgeEI7qmTVqe/s8VycuUwQ/ESmueRZmAnhpkSU3vuuUN1TQHH2+J3IybMvHCS6QquiWq8T9v8zXVt2W4lNHtftvdsIURaparM93MutmqFl+yI6dXCXO4JPdO1uI888cGKSZQ/KrB27+gkCockYnYNYmMqSBK2aWED5s9Db6SY+DcC9GM+5dDKl94v9E5YfDokw+eiPDSwuEDuIhurSHoWwFZO7fti0VKi+3ei7WLfeHLQBL2YVcdNoD/15D5sfbSKx+Y5AWoC1fkj3rnAd8W8QPivcKTYBIAfYXkhWvvEp8OGL2PtiEKSdg++9OofUN8B0r3EJHYIBhOH4yspiP3ETLo57gSWra8b3ojs7B9g42PuhEkQH9qQvhslg7skLrObNBgRzczOdcmNRXJFn7r9NE8JiX7N40GsB+4f5folklrclLGkWSFuWCgO76oB+YnW+pBPxbCXmiIfOXWz2oimz50cxvgMptPY5UCtx/L9na2v5Sd2+DfJxImLRPSKEEWlc4JVSv5EplMqlO2aDc8iSXUfxtNxJ5mjZwrJ1SSj4HPo/eD1XxMVscaGptYDTMTe3p7MQkx+TBCmZ5DJnKrexTHJr4OPYzBxDqiO5pFxIlygM1RVeTdMQg3UhZIs/oXN5I5kokPLxI+oC+DNM11xhc8rnUU/EOA09FoaHIbrM3gcX3ae4xTTWpDmFSp+BU9yDda0xEmdYpyYMjExvjB1WHNkFHb++NYWJnmu7R67f0cdUXqVsrIKG/zHL++s3oQaThv8NVGb9OlrqqDEvT6jYtf0EMjyrfdZ8kw3DTQoTUfyi7hM8n5bydYXmsdpa1I4L6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(451199015)(478600001)(2616005)(6486002)(31686004)(966005)(2906002)(316002)(66556008)(4326008)(66476007)(6512007)(66946007)(6506007)(5660300002)(36756003)(41300700001)(26005)(8936002)(8676002)(6666004)(31696002)(38100700002)(110136005)(186003)(83380400001)(86362001)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHhXRHY2T3JhZno5LzczVVRpTlJveUpRRnlQSmtwakZORnZJNmROTTBFWEVB?=
 =?utf-8?B?akZBODl2RDJyUmlZT0xyNVlIUEYzSzRMZmJjZ09CODk2dEFjbEhNSlFqdDhV?=
 =?utf-8?B?NkI5ZjZrVVIzQzNPUUxxZ0xJcmVXZEowYUNieHVQbDZPK3NEalo1emVjMGlz?=
 =?utf-8?B?U1hHTFlZU0xMV0l3Uk83SlpBdlFqSGtUOTRGdFNBR0VTOERCTzVXK0ZFVUJi?=
 =?utf-8?B?bHdNM1FCZmhhSGFiUm1iY3Nqa25OVk5tbWF0VDRiWldWazFUSkNiUDVjdnJN?=
 =?utf-8?B?STJGR2I0MTJKRkRwRTNkTjZHYWpRc1RHcjVjVWFXaUdkY1BLSFJKcEFWSXN2?=
 =?utf-8?B?Mm8vc1NVUXZhdUoxNmpTdFZTY2RMMmNvWXFoN05IUnVZVzRUVlpOYlR4NTRD?=
 =?utf-8?B?UnAzaFl1VVFweS9rSmtXdWZsMGJobWFKTUd6SGFTZytVTFR3Q3o3cDVWZVBT?=
 =?utf-8?B?emRRdUptZGRIZXBudUZHQzJMdmF1ckpZV2NaMlZpNDNSdEl6aFU2VXdVcHlM?=
 =?utf-8?B?MDhGcDU1ZjM3MUE4TnAzSStQZUE4S2cxb0dqUkk4aEwrSU9EU2loUExXOUZN?=
 =?utf-8?B?dFNjb2swM2x3VGs1UzJHeDhNeUROSW4vS2hROHZWdGJkdTBNblZYV0NONUpv?=
 =?utf-8?B?MEtyT1I4M0J2Z0JqMzNzYVFwNHhNVWpreGdXRnhodzBuWFVuY2NnYzBha05K?=
 =?utf-8?B?SFVObVNpM0k5OS9xZ25vRWZzQXRobElHNWFKbG03QTN3UjNBVHJ3OEJpcUFn?=
 =?utf-8?B?RW04RmlJMmdRTXJlS0VLdHZ1bjdYMjdtU1VzTzhDOE1DcFFYU0tUM084VDhm?=
 =?utf-8?B?NTRBMklVeEI2aEYrK3E0Ri8yTmFWaGJxMGZRb01HSElQRE5EQk1FMEhIKzk5?=
 =?utf-8?B?ZWxOQWRKaXJSUjFsTDZHb2Fna3VkYjhIMk5TcTMrMWRyQ081VFlpbVRqL2gr?=
 =?utf-8?B?YWp0T3VzWTFjMUVxQ3owdWkwTHZnUDJGYlpPeWs3c01KZGNMN2NRb09oWnZz?=
 =?utf-8?B?dFFySFhnTmdUY0FOeXFnMWxrTFh1aHV6S1RmUUNQVWtaeGs2Q3ZSYlRuOUth?=
 =?utf-8?B?anJmc0MvMmZtV1g1eEgzdnQ2bjkyWEpGWlFPemliYjgyUjRxS3htK1ZxRXJG?=
 =?utf-8?B?eVl0QXNleFR5MHBQZXZrZWFlRGd3UUFUYmcrNlJXd2JHb0FMcTNmTlM0RnhV?=
 =?utf-8?B?NEJHeGlrck1mWGpUc24yL1pJRHlwNTlYOXZmQzIvZ1VNVnp0dW9NUFR2SVhj?=
 =?utf-8?B?YWM0UjNPRlUrWGEzdTkxQUMvQisyaEJ6QXFOTmw4blJWSWlsaERsbWpMZXFx?=
 =?utf-8?B?NXozd2VnRzE3djRkUXpEaGlNVDBWMTFEWkw0Mko3REpEcjFUdFJDdUtMOHdL?=
 =?utf-8?B?dWJiOWZDRHJ3S1pVakNwbUJqdCtxQlkwL2xIbE5FblpKWUpXRlNCamJOZUJ1?=
 =?utf-8?B?RmJqSzZIdDVrVzBtWVdUSWUzdTd1SWduUUxtY0xOM0NwZHEzeXNaYjZxMUR2?=
 =?utf-8?B?VUROWExMTjh5clBNemNoZEc5ZE81dHFaeWFpN1d4cHppcGttQjd3WXRHazZO?=
 =?utf-8?B?dnMxTzlvak9DRHEwdmtJVnUxNjVXdmpveFBuMFRBd2NENGZWQThGOFd5OUVN?=
 =?utf-8?B?QjlSVDZzOERXSThMTWxpOUl1dGZLWVI3QTZWSVo1ZmVNUXJKeHVnODgyaCtR?=
 =?utf-8?B?MkZLTjRYWWZtU284RHdQRUN3dlhvQzREckhuVVRCUWs1MWxubDhyclgzMWk0?=
 =?utf-8?B?c2Y1TE42cDd0aW9DbnYvVXI4Qng3R3Z5Yi9JUVBsNElwd01INlUxdktPdE5n?=
 =?utf-8?B?TXlpRjRaSUtUazBFS0VSVGwrK3RVeU1laSswd0J2aFlpT0RlQXhEL1FPWFBZ?=
 =?utf-8?B?WWtWRzJicFRFaE5iVGtraHhqZVVHTjBBYkVlMmF5aEh0dS9XSkNkZ2UrekZX?=
 =?utf-8?B?ait5aFgwNWFlL3E4MUJXS1pIY1prT2haR3pIeWhPSEdyUWxzbGtWeEtvV0J3?=
 =?utf-8?B?R1EwSVdhYjhIVHdUUzU2RFNmTTgzUmpqLzcwKzlVcHE4aW5OVEFQVjVRN2Nv?=
 =?utf-8?B?Q3ZGa2pqbC9MTWpPdVNGYytPa1g5WEYyelV4WXN2Q2lRdmhielF0K3lJTWF5?=
 =?utf-8?Q?guNNiHU10c9k8S5G6lM3wzNal?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 114a8e3f-b22d-491d-eed9-08dab5ae6867
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 10:56:30.8956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hO5/okaVz0KeqjSXFxosMxhhHm6HhVj7JHDqM7YJKMOEGSg47GyzDGS1ojfxHsHZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4582
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 20.10.22 um 23:33 schrieb Dmitry Osipenko:
> The drm_client_buffer_delete() wasn't switched to unlocked GEM vunmapping
> by accident when rest of drm_client code transitioned to the unlocked
> variants of the vmapping functions. Make drm_client_buffer_delete() use
> the unlocked variant. This fixes lockdep warning splat about missing
> reservation lock when framebuffer is released.
>
> Reported-by: kernel test robot <yujie.liu@intel.com>
> Link: https://lore.kernel.org/dri-devel/890f70db-68b0-8456-ca3c-c5496ef90517@collabora.com/T/
> Fixes: 79e2cf2e7a19 ("drm/gem: Take reservation lock for vmap/vunmap operations")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

The code was properly added recently between review and pushing. Let's 
get that upstream ASAP.

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/drm_client.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index fbcb1e995384..38e1be991caa 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -235,7 +235,7 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
>   {
>   	struct drm_device *dev = buffer->client->dev;
>   
> -	drm_gem_vunmap(buffer->gem, &buffer->map);
> +	drm_gem_vunmap_unlocked(buffer->gem, &buffer->map);
>   
>   	if (buffer->gem)
>   		drm_gem_object_put(buffer->gem);

