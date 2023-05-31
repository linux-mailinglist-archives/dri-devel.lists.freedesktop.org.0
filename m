Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C7B71786F
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 09:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F76A10E497;
	Wed, 31 May 2023 07:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44EF10E093;
 Wed, 31 May 2023 07:39:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RytDTdp3UYzakXXGzLyCaKvcOkla1dl4HFFoqolWoqp/GpZAwXcACDYQK2VODmGv6dLehIqJozMm650xhSgS9ZXX+zxfCyncAvryc+h4lf0YO7IXjbj4lMy/mjGPNiCMTTUiqXn5tMkQh28+CwNQmYfffNQn6COr/vK6vbg38gjZfmxbLVXRgQmsBdbxEkcQb60xQF1R8oKgMIICfe34kvIGx9lv/BxpBhE5AObZJvtZlZUmt13GCFW+Rr7dI5Z35ui03ci5ZqZcRzgTiTJy7DeEmJIz7VorgQXNHTMVWhtyPr35LkdC1zTOsMhM0fZf60z0+tuR9JKl2R9Q0/Meog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRPeM9lxjwVE7DXFzeXv860e4cAykbAoC2Ib7DcYqas=;
 b=VpotKAeJ/0dgJlDI/iH6FchjzhvxcnS0ASrTmjoedFaeS+yv0TjnaeMJUVVIA4y+SrafTTCzUcLtomROgAlefmnUk4DNXa3dwxKN+rV0e8bEs4F6W558Yvm7b8P9F+cRxleGHzxeOhgDwlqowUM6bo7L2tPjb3ssoioxaHPMHm42lTumpKiPwXkdutu3Er62giD4UaxRe24U38axyvNwwyc6FPl9dvyVnLwORalpm7eKVwMq7MUHUbcmMXChkxGjGKcgfEK7k59RcvCXxFs8aA7PGu0s0gF334IrIDQqhKf/1/W7tiViEyj2fQCGc0Neb9Lq6zTLT1mHeluiNNZq3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRPeM9lxjwVE7DXFzeXv860e4cAykbAoC2Ib7DcYqas=;
 b=21t0Hhs7Acb/CjU+jwMHdppq0iZkcrsIVR4Vg6IVd6+hQlyW9bpqsRyyK/KTF63P5ynvaELYphcACxkIMdpDDHIL2n6ywWEqmLlsnXitK7D2W+Hzii9197aDwMTnMNHAF91dgzshn1WqFkiTbsq/5z+VUe4P8bETazQ4OLXF5mw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6351.namprd12.prod.outlook.com (2603:10b6:8:a2::6) by
 SJ2PR12MB9191.namprd12.prod.outlook.com (2603:10b6:a03:55a::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.22; Wed, 31 May 2023 07:39:38 +0000
Received: from DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::cdf:2ed1:1f52:9f65]) by DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::cdf:2ed1:1f52:9f65%4]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 07:39:38 +0000
Message-ID: <28a3eb66-46a8-a495-173f-97f5ae0b1caf@amd.com>
Date: Wed, 31 May 2023 15:39:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2] drm/ttm: Remove redundant code in ttm_tt_init_fields
Content-Language: en-US
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "Ma, Jun" <Jun.Ma2@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <20230531053051.3453509-1-Jun.Ma2@amd.com>
 <DM5PR12MB246916A813942FA00CBF5978F1489@DM5PR12MB2469.namprd12.prod.outlook.com>
From: "Ma, Jun" <majun@amd.com>
In-Reply-To: <DM5PR12MB246916A813942FA00CBF5978F1489@DM5PR12MB2469.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0208.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::18) To DM4PR12MB6351.namprd12.prod.outlook.com
 (2603:10b6:8:a2::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6351:EE_|SJ2PR12MB9191:EE_
X-MS-Office365-Filtering-Correlation-Id: a3389d32-a02c-4527-619f-08db61aa2fc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AzOVihtRK3KRQHbmT5PnNKyyWpveiYxglNJEEv7LNuPhV+clVMZ3tq7542izzC2OdEfOsKgzPeY3UDUSY1N7qPNNg43IpISVGpXVrXyF2jFVRDBQyRcsogTqgBRapIjrxMj+44aV7oPrqEZcfxiIhCsg1N5cENhlyaMf3l3Ehti0XS0tWkpKvbP6Xln08Qdv5VSOJ2iyNHTeTtr959TE/3yFPESAO7csgJ7A5ru2LwIkrQhdu2UX2gcuuys/eX64M6Ek0ezmDPIik/5iZzDia1gSliZIah10YnRv1K/SWvR/vhWj+ih5gXIIP5t4y0Wufy6taYzA5NQxy0Z5rCD68xdc2SUntBBdHYAiX1+IaEujAanbPG4cOL7CVY9wO9iUB5B4NjKkG28O5prPtQGwPD6YaBC+aKqNbXrPLxoX93NkPoz4MD2+QnLvv5KXi75FQlseFxkHC2LTz7gU0xKB2/YMTzp5PuG2iC3KO6IAvuoJPyMZs60KWncNo9kDQOvZk2j9J5q7/B0Q4IJ6080SZBVChwbhozSfMXd3QmdYsaIVGl3JI9YrZDPV9QOoFhfxeXFD3WyrDSCDjt/RI1F+OEqgv+4pOVbxCU1Fv2ikfmkYUwtwOszSezp6b+0gQLuB2iLjSRus+Dx2hCkSVI7h0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6351.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199021)(8676002)(110136005)(478600001)(8936002)(5660300002)(2906002)(31696002)(36756003)(66946007)(6636002)(450100002)(66476007)(66556008)(4326008)(316002)(38100700002)(41300700001)(83380400001)(31686004)(6506007)(6512007)(53546011)(2616005)(186003)(26005)(6486002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDdST0wyOU1ublJaclNvSHJFcjZZS3EycnlMblRzQ2pQd2pFN2pzK0gxQzFY?=
 =?utf-8?B?ZmRkQk10VEdlaktJdVpwUjcwc25XMHU0N1BkSll5N0dHM3FEb1A3ek5jZU9V?=
 =?utf-8?B?dXpQVjJNY0FvZ3dzbEdlK1RUMG1heFVZK250Nm1iako3cUF5SEhVcnZxZHhX?=
 =?utf-8?B?UDRxeWZUcWpjWEM5VjR6MVBuTVljWi9xaTZWdUVQdDhGRmJhZE9Ha2d5cEZa?=
 =?utf-8?B?ZHc4SHpWYW8rSDlOL3RHT0dCMjNHL25vZVJRODVsVlF6eTdNdkozZnUzV2Js?=
 =?utf-8?B?U3lEZk1Pc2RISTlIaXUzaDd4MjNock42U3BEZitxRUw0NEEyeE1nVE5TU1RD?=
 =?utf-8?B?ZGtERVI1S3Q0Nm5QSllUSmZOWU1nTGlHNkVjMlk3TDh5a0FNdVFuUkpIMTAz?=
 =?utf-8?B?WTZ2ejh0STE3SE03bWpXSkxpdVVmbzZFQkVyT3VSVHh0Q2g1RjdBUXJWbkVG?=
 =?utf-8?B?QWZKUHdtZ1dWZHhKUU9kVEpKenVlSHMzT1RmaDRRdlZ2K3dJYlBMVExWVU03?=
 =?utf-8?B?M0NQYjVOUTdZZzlLb0lnek8yc0NXWkYvQlM2ZDZEVkRCbWF4aitwMU1BcGpv?=
 =?utf-8?B?QW11UTJaSnFrcHhBRmRvUVI2SE9EUGpiVk1ZdGJoTC9rcXIxcytUYzlzOW52?=
 =?utf-8?B?RXRzUHlIbEVHcEoyNzFPR2NMajBqNnRjMHBZWjUyVW02blIrMkpVbWxocUY1?=
 =?utf-8?B?cUdsNlJLZFVKU2tJUExaSzJzVS96RXhGSTUzeHJ0RjY5VEZ5UTZPdEhHZEdH?=
 =?utf-8?B?SURlMHRqa1RXTkh6RzdIM2tVd0dFdTdrV25Yd244NGI1SDJCaUhEMk5XalNS?=
 =?utf-8?B?Yjl4TzhoaXZTcW5yeVI3cm90QTZSVUcva05NMmt6d2hsNFd0V0ttcWVnWjd3?=
 =?utf-8?B?U2liQjJSRUhuMno5cXVWYjNCUWRkU2pkbitHRENNeExkTExSNDhxc1krblh6?=
 =?utf-8?B?cEk2MWpVQUdlNUhXTVBFV0ErRUZZbmZwOW92VzFmQ0RtN3Bza1YyaVY0bVpP?=
 =?utf-8?B?bEpFUjVJZ1pJK0g5bktVZ0dsUW1hc3pidlF4UUZadmNjbVBSME85eEMzS3lq?=
 =?utf-8?B?WlYzMGZpeDVlZHQxblY4Y0UwUjU5dWZFdjFodjBsRHJJZmxFdmoyNjlTYS9x?=
 =?utf-8?B?UHY2RWJSckIwNDl2V1l2V0h4VFNsWERuc0k5TlFSU1dIZEF1MjVnZEhHTGVr?=
 =?utf-8?B?MTFPRUZxQ1ZrWTdETVQzUzB5bnpDanhxZXBSWnVWc3g4U3VickhmMnFuSGZB?=
 =?utf-8?B?Z1JUNXhjNXVqTTVhRWpnZW5pWVp0d2ZJMTlkNzRBVHdVM1dlZ21DN1Uyd3Bv?=
 =?utf-8?B?T28rK3cxZmNaQmVWQzFaZW1VVDh0UFRVT08rMkloZE5LdDZZcitDUWtjR1hu?=
 =?utf-8?B?L2gwc2t1Ni83NEVYaWQ5emx5emwyd21HNmthRjNWM3B0c1hIT0UyaHFlaVNx?=
 =?utf-8?B?SllMdzNXaFBKbXc1VEZRT3JSVjQ3dUp6aHVxVXQ5ZU81b21PcGhCeldnbkpX?=
 =?utf-8?B?UjRZdkpta0lwdGRGRUdrWGpFbk5QcWtpVVBUMkRURHEwU284dm5jTzFYbzVN?=
 =?utf-8?B?dlFJdk5LRmllbUo1Z05RRUVuakNuNkVXNWhOODNPOU1ZWmp2eFEyNHZBUmRP?=
 =?utf-8?B?Yzg3L2pXTHhPTlllc2FhNlZMdGs2ODFMWVZWM0pPSkJMbFNtSC95TVoyMHE1?=
 =?utf-8?B?amQyTE41bHR5bFdERnN1cHJuYlQwOTVEN1lqbVZNcm1yQ1RCU3NVOFcvNGZi?=
 =?utf-8?B?YTRBRXZZRHk4TjJyQkhabWEzM2lZWUxDZ1hDQUt4djI5Q3c2Y3Vnb0F6dHN4?=
 =?utf-8?B?QUdUMkUxVmMxd21MNFpEbThOeU1QYkFUV0txRWlqTEU0c3A3NkN0UkJtQXJk?=
 =?utf-8?B?YTNlWjA3ai9NbWt6UVluNVQxY2xrTkRJQmI1S1FzVGxmbExrZVVrMUV1bGt1?=
 =?utf-8?B?QkVHRDNGTHUwTzUyay9tSFJNbnlmdXA3aWFlZTlSeTBBbklhd1MwR05oSEFS?=
 =?utf-8?B?OXdPYmJtaUtzcUhXREsrS200Nmpnck1FYUg4RG5FWjlqZVdBOElvckdkSGho?=
 =?utf-8?B?VmFHejBkT2FQcmJWZ25QS0tYMEx3c3ZCOVhKdmhZbUdEZUpJY2RQQldDRElq?=
 =?utf-8?Q?U3XA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3389d32-a02c-4527-619f-08db61aa2fc9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6351.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 07:39:38.0367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jh/T+joikWqqQlTkZ84UXrOjZpdKoEqhEYxjlwX37JM0KW2XY4m5O1TJS5h6YiaS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9191
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
Cc: majun@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/31/2023 2:20 PM, Chen, Guchun wrote:
> [Public]
> 
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Ma
>> Jun
>> Sent: Wednesday, May 31, 2023 1:31 PM
>> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Koenig,
>> Christian <Christian.Koenig@amd.com>
>> Cc: Ma, Jun <Jun.Ma2@amd.com>
>> Subject: [PATCH v2] drm/ttm: Remove redundant code in ttm_tt_init_fields
>>
>> Remove redundant assignment code for ttm->caching as it's overwritten
>>
>> just a few lines later.
> 
> Please drop the blank line in above message. With it fixed, the patch is: Reviewed-by: Guchun Chen <guchun.chen@amd.com>
> 
Thanks for review. Will fix it when push.

Regards,
Ma Jun
> Regards,
> Guchun
> 
>> v2:
>>  - Update the commit message.
>>
>> Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
>> ---
>>  drivers/gpu/drm/ttm/ttm_tt.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
>> index 02b812dacc5d..45a44544b656 100644
>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>> @@ -143,7 +143,6 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>>                              unsigned long extra_pages)
>>  {
>>       ttm->num_pages = (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) +
>> extra_pages;
>> -     ttm->caching = ttm_cached;
>>       ttm->page_flags = page_flags;
>>       ttm->dma_address = NULL;
>>       ttm->swap_storage = NULL;
>> --
>> 2.34.1
> 
