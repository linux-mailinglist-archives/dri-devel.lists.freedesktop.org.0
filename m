Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEF65AE09D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 09:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8853310E588;
	Tue,  6 Sep 2022 07:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA4F10E588
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 07:09:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOfmIi2KszgVDn+DgrIsIPlFVuwVqKvVO8mkF9zZdjWeyfpPPctqKqAyZk3OvdbVFd3M06e4TuZDiH0BLau9mE0Kqs3u/eIb7XB/0AXJRbZynNWlfm0ZtkNkktokKc278C8LDtQ8dCoriVNvfobVu1/vmoZZWLEAtyTD2EVt+aid43ELltd3NwAytL7CM2STBfbIU1V+BC8UbmdtPAkFYBDJxJ1QB5B02u5Myp90kg/3Vp+2cEs54XhLzumeORVhaWqiBF+iMIY2yW0KN5FCtR0jJqmzJnQ8UatdVRrh9pCR1zpIjxdBdPWyBWi3J4rOD7P9SLhK1YWAcN7hyHMNJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsCTEVmG4yfXkfwpLxWIVMPRpWHtUNkNg0ocfZQvBtk=;
 b=ZVCdZlW/kua80wQVGi+UoxF1gttbr/MRaqUZw1Pi59k0Cd+Ni1n9dSFNp9w/SZ05415vcdTaF0CMCmx4oINOR5u1eDYAjF613SfULj1gXfInImZlZI4qLL7UMof29jDhCHF60AzQFqIQxmsUKjcHCDeyNno8gOhODGDr1Iw2HGfy4NqaNb+xgDvOUocE6/Y7oF/eO95twre1bBwFbIddSNl5Mg4fBL12m/W4wN5yhkN2ZR13L7Ohj+C9dXsGj4lE1DAqEUkB9SQBaW+W16toejcxuRl8lWDwzw7KqTlAzg+PVzoitm4EKPlgujWeRkVoLCLhhcUvqvinoRbJz1dHfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsCTEVmG4yfXkfwpLxWIVMPRpWHtUNkNg0ocfZQvBtk=;
 b=jyMuRWitF5XEvpY8H3jCTYjxk4ESY3S0nIUvMP7jbVm89L+7nf67JW+FiG6A6o5IaMB+eExlbla1opuo5amwzwJyYz79UG4xARUFE/ryReRbWbYmCU9u3RIpMAgPuoMYNPxM1z2DeUOpTedx0KMRW2AZr0FRM1aOk13RdeahUdM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by PH8PR12MB6697.namprd12.prod.outlook.com (2603:10b6:510:1cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 07:09:53 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a%4]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 07:09:53 +0000
Message-ID: <37ec6f1d-a3f4-6fa3-6d5c-fe89bb958d87@amd.com>
Date: Tue, 6 Sep 2022 09:09:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/4] dma-buf: enable signaling for the stub fence on
 debug
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220905163502.4032-1-Arvind.Yadav@amd.com>
 <20220905163502.4032-3-Arvind.Yadav@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220905163502.4032-3-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47bf859e-c764-47f4-7dfb-08da8fd6cb91
X-MS-TrafficTypeDiagnostic: PH8PR12MB6697:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TvP1j7ZleFRP/SBs763sF7ThQeLhYaDeleCT/2E/KtDJqrG26n3kkw7/+VdOO0+ZGnddnHZpYt8E1HTEO2eU/t/Tu/NgYR1JuVZIpjc4Qc9uV3Wxztcx+fg3rJ78uuPJPUz+mN3bTpS+/09juqkAJRNrjSUQz95dmxy0a1FoXhtzlQ7sYOJQqNq8za/pz9rK0O0ICfe+Ijfi3bZlnL25jl8CbCrRplpxBTZPJXTeI9x9Ckq5WUTkQ6nB99uaJJvuaGJmJ9ZOUSNvXZJXmKKzACcZbBDgT2zUgpwGPjNyuc7hJKc+7WXJVIzQCImTYC+Re265hUVrlunF+Y3evvcgnNK5LCKcJTn6pBHHUs9imFNukKV47AbEWB20qv8kKwB53rM44a1hJGSO+KavKLwNPjz9QFPeLZ+9vd5hUibZp+/8hSbxyRiEIoFKanNR49JtIXZzn1UxGIFLiLMEgrngKSTAtzULv6HpbSs6L+ZAEhY5LlCk1rdt0JV/Dku5FoWcr/1Q2LAwmUHydJSvelyk7lpLXEXDU0hoLPWJ+Li9FEI+AKDZbXnae8UbVdzfQFXCMbgYg0x/ioTMT4Z41yAS6j4jiPVU3mknv8cF7NGOTkv0wsCilcIQ645GXUfP0iC3byjwKiI6/wsnnXqDNIx9H0PXBTyrLmV06SexaCJCO+78gSfbaOM4/DX5V3ppmeDcWB45vY5bnyQeAHh4BoUzp//XLjmUpzW9IG9cPXi1fSg8adcZE9KfKIHdd0llLL61afh+bGh5njHve8HoRj6jpcH09Byvm7jBxy27hZzI0CredJN4oUCyZ5MptVeLFvIM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(66556008)(31686004)(38100700002)(8676002)(316002)(66946007)(66476007)(921005)(2906002)(31696002)(86362001)(36756003)(83380400001)(6666004)(6512007)(6486002)(41300700001)(6506007)(8936002)(5660300002)(2616005)(478600001)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2dYaVhWWE83TVpvU3lCaURhdkp1WHplc0hXVy84L1MwZjhkdzhFMXB5cDJC?=
 =?utf-8?B?R3RON241ajU2Ri91aHBjbzAxUk04RVlHeTA2TmRhOGtIUHhnVUxJeUluKzEz?=
 =?utf-8?B?TUtVMzYvY2k4Qk5oMVQ5SVM4VlhSV2xXWE5LdlJPK1pvQUlNM2xjOGN6QmpP?=
 =?utf-8?B?SXV6RTczV3RiTkZFU0tTTyt5UjNFYVZPNG43YkpSR0MzTmFSb3RTUXJUK2tW?=
 =?utf-8?B?cWFuUVpWcTQ2ZmZBRTlqbGhpdVA0OGNEMlRCcWEvaSs5UXVrTkNlcURqcVRj?=
 =?utf-8?B?MEZGUmdFTUpqRjBldy9Tb0dUOVBaOTV0aXpKS2NpRWM1U1VzdWFTUDN6TGtL?=
 =?utf-8?B?M1lySFhDQ1hjWGM4eHUvS1N5cWlsN0FjRC9uZGZmTU1pZVJoTlhIdVU4TWw3?=
 =?utf-8?B?NlFBS2Z0ZGxwRTViOFdPRytsZEJrWU5MeXBuVGFlVFo2ZDZjc3pHQ24vZWU4?=
 =?utf-8?B?SVFUM0liYitXaUtwblpwYnlWekxhdEF3SVhoNGRNU3k1QlZHUm55S2I0YVpj?=
 =?utf-8?B?WEcvM1V5cHJQZDZXVkF6QWp5TEVVWGlOYU8wZHhkNzg5SWdzRjBkM09mSnl0?=
 =?utf-8?B?M2RzOHFzSkZ0UHMrMWI2OXRkWU9lMmdFUWZIVjBqVTMxRmh4cndBcmo4b3VW?=
 =?utf-8?B?bkYvR25Ld2dDSlBxd0pTY2Q2ck9id3dQck9nbC9PWEpGbUZxSEhCNmp6dzdw?=
 =?utf-8?B?NFFxU08vaFJXL1BFYUl4Mm1uem9welV6cEhJY2M5cklkM1QvOUIxSXhIT0ow?=
 =?utf-8?B?Qlp0TjdXVzdwTDA3aEliYVc5aXJhR2JWMG8xL3U4OXFONFM4ZW9DQUxWMGVi?=
 =?utf-8?B?SWVJc3pSU0lXL3IxWlE2QnB1OGYrKzB0QVlJV0J5VFJ0cGhsUVoyQVRzV2JB?=
 =?utf-8?B?VzlTMUJ2aVRCTnFSZDFUZEhSNW9JNSswTDJ5SjVkSldRM2NZN0RyL0lpUXVh?=
 =?utf-8?B?V0R4MHZDZHZYa2RXYjNSTE9NR0RBUFZhMTdFOHlQRmlFMHluN09ROElYY2pv?=
 =?utf-8?B?R1ZScC9yOERqbXIzUkgwcEE4dG90UzMxZUlSQjlhSVN5akhHaTlUVnJlZi9X?=
 =?utf-8?B?Ni92WjB5Z2w2L3RDRUdUUm51aDU0czJyZVh4ZEtydzYxR1BQemtMYmoxRUc0?=
 =?utf-8?B?MWlFZ1F3RVgrN2p6T0xPVS9hdVhTV1VjUjN2bGVrdyszcS94QzgxVjJEem5J?=
 =?utf-8?B?SnVzMGFVSWZVc3llU3QvVGppWExFdDlrRVhtMHR4YmFVVUZmVnRxSHRLbzZh?=
 =?utf-8?B?V0U4bDJtMGRPRXp2Q3pXNHB6SHNmelRiSldjaEtSclpFNDE5RCthYnN2M2tI?=
 =?utf-8?B?K2tsQzkxdWx2VDlsNUNMQW0vRnNZQ0h1VXJlVGNpL0NrV0VCemFYSytVZjND?=
 =?utf-8?B?R0xRa1pPMzVVZlZWQVF5bzVwbDdnbFBEOE4yWkU4MCtiQ1RUQVFmekRvTmI1?=
 =?utf-8?B?OWQvZDRIMFJDVDNXTld5NzV2QkpzSEx0ZXRCT0puWTBZWkpxSHJ4eUd5S3Zv?=
 =?utf-8?B?NUQvaC9TTmxyMG9kSXBGeHQ4QjJCVGcraEVkS0Z4UXJiemxqSlUyOUFXaC9h?=
 =?utf-8?B?SUtzWWY2ZE5PNy9xUTRvZ29pbXRWcG8wbzgvMWljdFhEcHRqVFhueWhaczJR?=
 =?utf-8?B?L1hJT0dEOXpZZ2dWeWY0K24yalVYMnhmUkpzQ3NXY3h2WnVKZ2REa2d1OVpX?=
 =?utf-8?B?TUdNSk1SS3Vod1BuL3I1L1Rqa0RycmI1THFFMHI0Y1RKNWI0R3d5QVh5UGx3?=
 =?utf-8?B?dGE5aHp6QmFHeU41UHdwVUlFSmRzcGhxOUEva0ZnZkJOWCs3bEtIMGFFcDkx?=
 =?utf-8?B?RHhQck94Um9weXAxZ25nZElLU3h2V1I0UkJHd0JaUXUzNzQ0RjlCSkh5eFhC?=
 =?utf-8?B?dlh6SE5kdUM4aFJCaWF5Y3RXVXA5ZkpHSmo2Nm1SRDg2bDVkdzI5UDcxbUZ6?=
 =?utf-8?B?S2xyQmpYbmlYZEtqc2thRmJJbXZyZVZRS0pUYjNpMmhmakxNOFlSY3J4ZGdT?=
 =?utf-8?B?MktJSFR3dGROdzFNbnpCb0N6d3RYVTRacWhwZjkxVzhQZFJTeWI0d3VYQ3Q5?=
 =?utf-8?B?cW1rL0o2anNwWjAxaW4xRzBWMkQyYUsvWFd0MWMxaEVSMHpndnpRVXZNWnAv?=
 =?utf-8?B?SnZQUStYdTIyVEtZWVkyQVk5VHFOaTNpNHpXODQ1TGRlYkQzcStJa0FtNlp2?=
 =?utf-8?Q?IhMQ7IUHg7dJuKUsByKZg6y4w5rf0ZUUMG9UOwBqY5bq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47bf859e-c764-47f4-7dfb-08da8fd6cb91
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 07:09:52.9460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g15bfOBMq9zJMCC96zc/bdy9ppdBAEftqzPL78p6ERSj/9qY6AO9C0MlE/2voWOr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6697
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



Am 05.09.22 um 18:35 schrieb Arvind Yadav:
> Here's on debug enabling software signaling for the stub fence
> which is always signaled. This fence should enable software
> signaling otherwise the AMD GPU scheduler will cause a GPU reset
> due to a GPU scheduler cleanup activity timeout.
>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>
> Changes in v1 :
> 1- Addressing Christian's comment to remove unnecessary callback.
> 2- Replacing CONFIG_DEBUG_WW_MUTEX_SLOWPATH instead of CONFIG_DEBUG_FS.
> 3- The version of this patch is also changed and previously
> it was [PATCH 3/4]
>
> ---
>   drivers/dma-buf/dma-fence.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 066400ed8841..2378b12538c4 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -27,6 +27,10 @@ EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
>   static DEFINE_SPINLOCK(dma_fence_stub_lock);
>   static struct dma_fence dma_fence_stub;
>   
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +static bool __dma_fence_enable_signaling(struct dma_fence *fence);
> +#endif
> +

I would rename the function to something like 
dma_fence_enable_signaling_locked().

And please don't add any #ifdef if it isn't absolutely necessary. This 
makes the code pretty fragile.

>   /*
>    * fence context counter: each execution context should have its own
>    * fence context, this allows checking if fences belong to the same
> @@ -136,6 +140,9 @@ struct dma_fence *dma_fence_get_stub(void)
>   			       &dma_fence_stub_ops,
>   			       &dma_fence_stub_lock,
>   			       0, 0);
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +		__dma_fence_enable_signaling(&dma_fence_stub);
> +#endif

Alternatively in this particular case you could just set the bit 
manually here since this is part of the dma_fence code anyway.

Christian.

>   		dma_fence_signal_locked(&dma_fence_stub);
>   	}
>   	spin_unlock(&dma_fence_stub_lock);

