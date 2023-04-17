Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8C16E3F2F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 07:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855DC10E284;
	Mon, 17 Apr 2023 05:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34F310E284;
 Mon, 17 Apr 2023 05:55:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hw6jANSCvj0Ez1jdccZkwGvnbB9/xU1d33pgf069bOlP4v4dD0gHvndfeV9mzQ/+ty4T8uDYhdPoHj6M38JTdrVPVJS/SFofgLu+EJLixM/R9jsMm4OD5ZXpAd9Zts2QmFrlzbRiLGYDC7zSctrsJ+494GDCPCApalhhkuzaOAvZby2Pt99oMh8OIhd+rwpuqczSr6x2V720jiL4lHLgOMugpLz4+e6x6yIEn0xPVfTFR5MHxz3jzJo4Wi1TkxKuNJx24nZNGrLrXtlMnq/LcUwF49uMCpsasLN09kINb/dJmbWq9TgSdlkH4wGe5KiJ6xdJGOKFyiZLRozLvEcLlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBsF71+pQlJ9hL8rJAtzSOoqAqSGNArwtWD7nWLjufE=;
 b=FVuB/IvFf5Im5JPipZ300Heu+mDWtsfXnGEc1lLhiQVkz/dUYuAgE5xYTy+CqL3AHmUrGZf2uXPmuhXedgiwaaRaCN281ehH2YYDdDYtUoPO2jvVbAzj8tBd3XHNu34lX2Uc9Z3Er/YsNYXHxnENMqHdjNNXdDpttY3RHbjyETljMp9Dkj8/AAKib7GnY80MViZswZFlo9LRjI28Xz3B+Rozu6SOrGi1EExuDrE1KvP0CIA0SiYV1hXH/2BWFU0b07KvqCTsc7HZ5v69lgHsmKaXwmCJMhEv1iidn+ilvENIL0nzKiKwj8LhTivUnuBC/VtF3jwgo0tMpjomL877WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBsF71+pQlJ9hL8rJAtzSOoqAqSGNArwtWD7nWLjufE=;
 b=H7clR1Tb/dEq2sDDmEaBxPIDCZU7ngNxmGdW/4+S3Z9rf1UvVZXbuUO+EQaAT7W7aVEqnEE4T0XaCnTXad8XAD5Zz326di6omVcRDQxFVQC0vwllTErd/UdvoVZsf8n8r4Q3SPS6O6Fwnv8uFa2tiopRkt9BNI7KRDe61sc1RTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB7375.namprd12.prod.outlook.com (2603:10b6:510:215::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Mon, 17 Apr
 2023 05:55:46 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 05:55:46 +0000
Message-ID: <7b17a825-0f76-3e0f-5e56-0e689b7d7866@amd.com>
Date: Mon, 17 Apr 2023 07:55:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] drm/nouveau: fix incorrect conversion to
 dma_resv_wait_timeout()
Content-Language: en-US
To: John Ogness <john.ogness@linutronix.de>
References: <20230415012137.615305-1-john.ogness@linutronix.de>
 <87edolaomt.fsf@jogness.linutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <87edolaomt.fsf@jogness.linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR03CA0103.eurprd03.prod.outlook.com
 (2603:10a6:208:69::44) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 950c412b-6656-4534-20f2-08db3f0862df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i1xIftTvKOXTP6EwAp3W5Es5N4E8Uip1Q4NlciBuWL2Psff2s1TqJj1ZJwmBV5lW0UzXBzv38cMyWRk010vP6AYjhp7QyiwCVcejifQ6lED83/bVugUee176v+I10vj4bVD/38H4ZlCJeZN8b5vgLHqQ0GEw/uHQ5YuaJfs1SuEJiWGiNsvOe74bxBKAHk2s0vI2dYzjcz/C9NCBmvrvfP+y93gKM/jUos72bOt03vRbs3AkKlBDtVz/ShVc+f/yQYHhpSwpbTNmzHIWQwZajUp7hTftRO7Or/KmDGHuW88d3558D/8SnQUM0vfc765dzDuDP9cPkuLm3c2igKGTOP46/HLFtgW3UkjD3UI5aqZGJfcLDK0Mz5z6EnmNtJtXxd3BBfvmwE2oUWG6scWv+tFVAGQZTlPtkYWcnDBw0924PuZnmO8ug/dMnOQQ5ir7/rlSmzQV8GqdZdpGGxTUwK+4cupH07ltkhr+KqLXxTmvacgJ6s+yPJQOgooFxB7ckizBG8ceGe875bUH58yU4HBwgEkY+7YlqkTI3rHLjJUW9yyKwdpxx7bluKj/NoclLQvcPbNljhMYFSy7jvwQn/1q8ycO1zVtMeq0uENOXOiWYIuJnKICtG+F9GEN8BYvojH7EQxrAWTIfwQCzxIURQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(86362001)(6916009)(36756003)(966005)(31696002)(66556008)(478600001)(4326008)(8676002)(316002)(66946007)(6486002)(41300700001)(54906003)(66476007)(7416002)(8936002)(5660300002)(38100700002)(186003)(2906002)(6512007)(6506007)(26005)(2616005)(6666004)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZytPalpoQWEyOC9BVWVTRUVMR2QyWU5nM094b285VzEvUUNUaHZVUWFxNUc1?=
 =?utf-8?B?RnBoUFNCamZ5SlRybVNrZWxnSWFiL0VXWUNYWjRZNlR6T3UxeEcxOUxvU2hP?=
 =?utf-8?B?S25pbXlpcXJjaUpMOEFwV2E4UlQrVWRpeWJyWTc1aDhUYWlLQkhWbDlQdXd6?=
 =?utf-8?B?QlVuemFXUW1NenAzUEZnU3ZUalpWNW82WVZKVmhzT25McStUaURhaEgvZzF0?=
 =?utf-8?B?YzROVUhrK1ZKZks5TFVhWjJGU3p1b29hNDFmb1ZwbHdSajBKa2ZCc3l1Wnpk?=
 =?utf-8?B?NGJPbkxrbXRjQ2tGMjJrSVcyaXpVMDRmeHBudW5HOVFHUjFrTFdKSlJ3UjE4?=
 =?utf-8?B?Q1RTTGpTaUNzV095dmtjeXRlQ0lqc0tHSUozMXFlaHZBbWdVM0tIcTVuUTBF?=
 =?utf-8?B?em1Cd1JXK0dscUhJTE4yNnlqdHZVV2plT3B2VUZnbDVhbHplYlUrR0hON0Rv?=
 =?utf-8?B?ajcwNi9oRVMwMTE1K2RtcE1QK0hDK3FjdXBtRFhFWHFOS2Jsd1hpUHF4WnN6?=
 =?utf-8?B?WTJudnlHaVY3WUMrbXNiV3lYdG5Jd3Bad0RoKzlaSUx3b2RQdVBUSWIrcnpv?=
 =?utf-8?B?UlpqSTJXYldqYXhjaHdMQzVGV0pKaVhWVjhvU0REVFp0elc5RXFwNi9vRVZD?=
 =?utf-8?B?V1ZLMHZxekdqOWJjL0FpY3crYkRRdDI5U3BCZDl6cUdMMS84dU9pMktGMmZE?=
 =?utf-8?B?aDZiL0lLSUFYZTloYmh3VkY5eG5heENDWHR5RWJhQnUxcStHeCsxQzR6bnpR?=
 =?utf-8?B?ZVA4WXI3eEZFYi9HeUh6aU1DdXJ3WnN6MGRHbXlPRkxTcFR3SCtsRnB0aHVG?=
 =?utf-8?B?OGl1OWVXeFpJMXhjRTl4SDRwTFFqcnBEb29LR0YrZWprWW5WbWM0ZGZNRjB2?=
 =?utf-8?B?RHArUGs0S1MwWVJYdGYyWGZUQm13NFhiMzhGRzFxRkQ2VlFvTEpKNk5CemIv?=
 =?utf-8?B?eWJqSFhpT0RGVDFKSHRUdDRCamxicHNoN0N4QXpsRUdZRnhIYVBENU00QWd6?=
 =?utf-8?B?VWp3MThvek5RcjlVZVhHbGwydEtrNmZHUEJHckZxV1NteEdKaU9rTlRiQ3l3?=
 =?utf-8?B?ZFpyVktvMHV3djQ4YzlNcVNrdUJ6UGQzNGdNNnpYYkx4d0tlZkM3SUtqRGR3?=
 =?utf-8?B?OTFza2JORTg2cmVYZ0g1UG1ncUFpTjBUNGZzNXFTMTFrT3ltdmFyZ0xia1Zi?=
 =?utf-8?B?RTZBK1RFaWR5Y0lKQU5ITldzcllkU2FpUmlJQ3FWTW9oWlcxNGN0eEtUcXpo?=
 =?utf-8?B?dkRNbXgrT1R0TTZuNkhrRitsRHdTMW9Fb2dvSGtlYmNkdGh2em5XOStyTFRa?=
 =?utf-8?B?QkZMczVaUEtGckg4QTE5RHdSM2JwT1Zoa1VZQmVDTnRWQk1obGM5OXBqM1hV?=
 =?utf-8?B?d0t6N2FFdU9KbkQvRVQyMmRtZ0Jod3RaL1NyUkdsUStVVmZ0SzlqaGVxV1Mr?=
 =?utf-8?B?REkxWDlmcWYrRTc5YmJZT1VSQWc4c2NYNDh1RWtoUW9QZmdOSnJDNHhDclAw?=
 =?utf-8?B?TFIrMmJqNlViUVFvODExdWdLMlRBUEpIcXArY0NBcTRRalJ2VktWN29uYW8y?=
 =?utf-8?B?R0lSUU9DMVVOaU8vREw5cmpqZXFEUE1QNW5KUnJ6SnhGZnBxcUkreUpzR3h1?=
 =?utf-8?B?ZUtOeW9UUWsvYURkZTUrVG1WVVpPNkxoUldnQXF6SHg5eXU3enJRVENpZkpu?=
 =?utf-8?B?dUN3NjUvRlBib2l3ME94ZWVzUXF1U0UyUi9NQWd1UjRhbUM4ZlFpL1ZRd0Zi?=
 =?utf-8?B?eFZOQ25rY295Y0Q4VHhCNEhHdXl4bWI2YlVXek9Uem9uRXJFM0I0V3Uvbk94?=
 =?utf-8?B?NXBjY28vQ2l2djBiV2VzZGx6MlNQenk5RkFEY01uZ0NCQnBMUDdwbFdsbTFk?=
 =?utf-8?B?czdXTjh1eHhmUUFQdUJPczgzZGk1cHNKQ0k0b3Q5cXVJeVU5akt1Y1VRK2lB?=
 =?utf-8?B?WFJYL0lYUHNWOHZXaXNQN1JpOVlDY0RxQjJTMWlsNDF0SUl0eG1DZERXMTFL?=
 =?utf-8?B?aUxVSDlUbWE5a1hReGN5NUN4Z2Vvb1FrMnlMQ3ZPa0pPeVhZbDJtcnBIcnNj?=
 =?utf-8?B?bVJtak82eFdPQURodk1XVHFoV0xsdWlZbk1FTG12R2pXcERWZUhFS0J1Rld5?=
 =?utf-8?Q?cWZ4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 950c412b-6656-4534-20f2-08db3f0862df
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 05:55:45.8413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9emN4dt7kgfQKc9RBxk6101T5Gx6jCtVQOhmd8Sj1j6nsxxBMsubIfjKovb19u/t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7375
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tanmay Bhushan <007047221b@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.04.23 um 04:02 schrieb John Ogness:
> Commit 41d351f29528 ("drm/nouveau: stop using ttm_bo_wait")
> converted from ttm_bo_wait_ctx() to dma_resv_wait_timeout().
> However, dma_resv_wait_timeout() returns greater than zero on
> success as opposed to ttm_bo_wait_ctx(). As a result, relocs
> will fail and log errors even when it was a success.
>
> Change the return code handling to match that of
> nouveau_gem_ioctl_cpu_prep(), which was already using
> dma_resv_wait_timeout() correctly.
>
> Fixes: 41d351f29528 ("drm/nouveau: stop using ttm_bo_wait")
> Reported-by: Tanmay Bhushan <007047221b@gmail.com>
> Link: https://lore.kernel.org/lkml/20230119225351.71657-1-007047221b@gmail.com
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   I just realized that the nouveau driver style prefers to scope
>   variables used only in loops.
>
>   v3: Define @lret within the for-loop.
>
>   drivers/gpu/drm/nouveau/nouveau_gem.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index f77e44958037..ab9062e50977 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -645,7 +645,7 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
>   				struct drm_nouveau_gem_pushbuf_reloc *reloc,
>   				struct drm_nouveau_gem_pushbuf_bo *bo)
>   {
> -	long ret = 0;
> +	int ret = 0;
>   	unsigned i;
>   
>   	for (i = 0; i < req->nr_relocs; i++) {
> @@ -653,6 +653,7 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
>   		struct drm_nouveau_gem_pushbuf_bo *b;
>   		struct nouveau_bo *nvbo;
>   		uint32_t data;
> +		long lret;
>   
>   		if (unlikely(r->bo_index >= req->nr_buffers)) {
>   			NV_PRINTK(err, cli, "reloc bo index invalid\n");
> @@ -703,13 +704,18 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
>   				data |= r->vor;
>   		}
>   
> -		ret = dma_resv_wait_timeout(nvbo->bo.base.resv,
> -					    DMA_RESV_USAGE_BOOKKEEP,
> -					    false, 15 * HZ);
> -		if (ret == 0)
> +		lret = dma_resv_wait_timeout(nvbo->bo.base.resv,
> +					     DMA_RESV_USAGE_BOOKKEEP,
> +					     false, 15 * HZ);
> +		if (!lret)
>   			ret = -EBUSY;
> +		else if (lret > 0)
> +			ret = 0;
> +		else
> +			ret = lret;
> +
>   		if (ret) {
> -			NV_PRINTK(err, cli, "reloc wait_idle failed: %ld\n",
> +			NV_PRINTK(err, cli, "reloc wait_idle failed: %d\n",
>   				  ret);
>   			break;
>   		}
>
> base-commit: 09a9639e56c01c7a00d6c0ca63f4c7c41abe075d

