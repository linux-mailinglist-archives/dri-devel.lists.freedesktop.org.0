Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9A943454F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 08:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D3189DA8;
	Wed, 20 Oct 2021 06:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2EC89DA8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 06:41:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZuA/TxbzTIp+v8WRW3tTTgvnKQwqGCVBVei2HHtD1xEkS/WZ98vCqUlHjVt5WZhz23LAtYNQ4YhvRAytITZEHiOp2b5k70i0TY4DpPmS3soq1lvBdFhLRiIcaThjKITfs8H20z7iNB4zWkGblCFYAN/KbAu4fnh6OVa5Rl5pt5+WAxv32RIGYLR9enoaehmAtaONC8MvKXiehFeRbO6qSFRDmfqwRdUP4+3cPkOOdp/MgYZc4rZcOo3XFFMGk34oWqKk/tTqR0LKXJD1WaOq1LN4KfaWooAKHRTFIYEoDLESqJRpESj0+q18/CZvHZxpz6I4AZcJ9f1VyD2cwYGJ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvGkwQsNfBmblM+7RDm85Kg432ySk9GvfqTD1m5Q+3U=;
 b=CVbmKPmuhuOuorcGQx/sH+1sAWVQNO0Qb/5cN022ZwraFaVTUytcajKzFrRflfZK6KOcF9AqtrYzX5Cs32Fye5zqgoi2WZYXB3NTPH1IqjwqvaU+dDUnVNmLF8kmhLCoBlTr+J2GdDk5gAr1FPenTfVFKKmsp/yFFi60SNJ/hEm6eTsK1AavVOW8xvft/yhZhg/bwEdsdk3u7QeqAiMrlzHkl/KUksPD/MP/opfZ7qD/fpanT0F4F10F5uBZBXHuRfpRzoeoNRODP5ue08iQXGfUz9OWnCqRrBBlOo0X87c0EW/js3T9tKJl/Agl6eoOee88OrbT3aHS12f5H//rDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvGkwQsNfBmblM+7RDm85Kg432ySk9GvfqTD1m5Q+3U=;
 b=PPTzBUWH1AQgEHiKPONu1S0TOQTEzTYaDzqTZndRDBdPb0a8v/K0vKQvfwfOVgqmPwhmH4QQ077ftVrYHnWTTQv0tjPQvdmi1ltPXk456P27Qp1vCCZaJo+YFAKnVnaOrvwdED/5iMJ0ZbkQ12oka18BKpAyMC/WicxvY6Bs4EI=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1279.namprd12.prod.outlook.com
 (2603:10b6:300:d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Wed, 20 Oct
 2021 06:41:34 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4608.018; Wed, 20 Oct
 2021 06:41:34 +0000
Subject: Re: [PATCH v2] drm/ttm: Do not put non-struct page memory into
 PUD/PMDs
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>
References: <0-v2-a44694790652+4ac-ttm_pmd_jgg@nvidia.com>
 <47182e81-39f2-1143-7654-fb31d171e4f3@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e88f42a3-7f04-25d9-5274-24a700df689f@amd.com>
Date: Wed, 20 Oct 2021 08:41:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <47182e81-39f2-1143-7654-fb31d171e4f3@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR08CA0025.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::13) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:6048:8836:7968:5df6]
 (2a02:908:1252:fb60:6048:8836:7968:5df6) by
 AM6PR08CA0025.eurprd08.prod.outlook.com (2603:10a6:20b:c0::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Wed, 20 Oct 2021 06:41:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f0b745e-11b6-4e5a-ee93-08d99394a847
X-MS-TrafficTypeDiagnostic: MWHPR12MB1279:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1279D7F66EB075AEB798556D83BE9@MWHPR12MB1279.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jWrJK+lHCqgkG9hoXenv7OYeM1y/QGSt+9Tg38F8/ILnptlwEHrdrI1iJETPjMK8e6YUyWcf/UYdJ+5481ZYPqHoSBI0S5c3kicMzmnIrTXbFrn8vV3Dxchff4E8ywKxxXPgyhYWhTbTCxQLIy2h4XRXslzubOCejIEm38f7SOlinyX3Y2bGv01Juz1ehdwHu9ulckvfuuzjay6/ebn1X0HFyLu1hp1HDrp9L1jqot0JoT+gGpkSkRFPC2fKyd1KZ5PW7amCnCdRFE6fnbv7jCPrqorX5SrEq2MlkTU/PWND3j/1r6MZ0IIv5pBYJ40H3ng/uKRnENhD7tox6Z6BwknGcNAzNisXCsvhws5qa1ZvqGSwGjejAr4vloEqkcOW49BKmAAgC8kgzoUhhNJ9GlYdNsgVAje2PPAqpMUYulRE2NETG9Ue1YWx1hQyaA8qDVNh9OfXm4ooMTMIbKRD/uoccgjRH9QAde4QHWMefQ5h6WBzF/YN+ZfdU1/oq3z8e6PbcR2WuWLJkOuzssi9mRTR1BXXlL/s7g+wdUAH/CH8yVhB3ikqDfb+drKhPzpVjgQI4Fa8qFTsrVBNYTRjdY0SsJFolHIqI7HzGTjU4oRFZ4cLBk7LsCn7N6IlzIPwDSYOJ+2PjEU6WBoPiI+uKcda9ybqDlcUhT1L0ahIncfLdWiB3YrpRm794Kaxv/D1DnUIzfFBZyV1ntXos8N+uV3t3YKcx57skq1Vr56Nvu8DLtI38U5GAUTRL1ZL98QnGNU3vl+eM7O3sH1kCM3fUXL4Noe/vAg5TQZmiIVRQUCxcKoFX0ljMdIS5pa1+IEkE2V+I6sH/gCuLbVLwz1LNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(966005)(6666004)(110136005)(8676002)(38100700002)(508600001)(316002)(45080400002)(54906003)(186003)(31696002)(6636002)(86362001)(30864003)(53546011)(31686004)(66476007)(66556008)(66946007)(2616005)(66574015)(36756003)(83380400001)(4326008)(6486002)(8936002)(5660300002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjdRSTRNOU5CZGdnTE9xT2FLUXRrQS9URnJXZ0dSMThuSlQ5Z251ajlpWElM?=
 =?utf-8?B?cnV0Z2hiNDV2d1lsSnVGN1hMdDA5a2NQemU5OUsraGxHaXRFRExtMGFFcUdP?=
 =?utf-8?B?S3EzWDh1RWVHa2lBVXh0RTBTdXVtY3prRUtEdWlkWkVEMWE5OGMySUpJVFYy?=
 =?utf-8?B?d3ZYbWptRmZzblQwb2VZbDQ3Ym1IbDFsRm9RdnlWdHcwVEpLVGxVcTQzRnVp?=
 =?utf-8?B?eHZUdzBXdlByajNJaUdWRys1YlFEdS9aSmlLeW1FbWw1TG1JK3pObUJidDAr?=
 =?utf-8?B?cGJxYzg1YkZRN05jTVNoTEZhc2sxVUkxeXR4cGJvbUswamNwWWlBVGU4TW9z?=
 =?utf-8?B?WGdIVmRucGNoa3RJcGRZVUtwNlhFeFFhaFlGUzFkVy9VWEtZcGlNZGUvSHYr?=
 =?utf-8?B?dGkrQ1RWMWNCaEpMYU5ibnVkb0E2R3p6em9tZUFTRDF3d1pIdnllbEJKdldy?=
 =?utf-8?B?cmJTN2FuUFVDUkQzSlZEMEZGK1VBOFRQMEIrTnk0cGlmZjVPT2cvd3RuWFkv?=
 =?utf-8?B?bTlWUWhYaXBld1ZXbWZZd1k5dGFXa3BDV1c5Yk80d3ZTZmdrcHltbWRzUENV?=
 =?utf-8?B?ZmkvTDBvd1JGZytKTzhkNkVud0swTDV2b2wrbVJ4KzhYSHJ2YlhGM2FYZHNq?=
 =?utf-8?B?b0hzZTZiSlZvUkVORTJma3RXUW5kcGw5VHJiM2E3L0hnTnpybHlrQU9heCtj?=
 =?utf-8?B?dmxIRnZGVTlGL3dvK3lvQUY3MWswNFc1empmbnhnVWd4U1BFb1JzaG5ONXc2?=
 =?utf-8?B?OVh4QzR1eUppK1psQzJEcXpkVHg5UEM0NllEWFBqYm40NVk3SU1IUnFaeGpF?=
 =?utf-8?B?MlRweS9NUzZVZFJNNFljd2c2NGxoeUJRcjVFTEl2Z2NMTkpJd0M1WGJkd0s1?=
 =?utf-8?B?bGlOTFFJODRWOE9nelFjaFFqdkRJaGtJYXEvY3hCNi9TQzc0b251UUtpdExi?=
 =?utf-8?B?WURpYklzaVE1Mnh2cW0vZ2RCaGVLa0h3MElqa1p0SUlYaCt2TTZaWTNXVng1?=
 =?utf-8?B?UGNITGdPWEVUOENXTWhQZzV0QzZlUTBYbWJFQlNTRXBQR29CTm1TRkxwN05N?=
 =?utf-8?B?eW51OHVUVzN4R1UwU1hXbnhYZlNiZnNHL3owY1ZxYlpsczNhRlVZV2F4eTZU?=
 =?utf-8?B?R1gvaW1FV0t6UG1oN0dUYnMrSm5tY0xGaFdjWlFPcjlQWWl6SktROFJrQXhL?=
 =?utf-8?B?MWpVMVp4MGdUazArMTg2UWJnUkE5OUtnQjVMcVVkbndkdi9uNFZHczhBalhy?=
 =?utf-8?B?ZFJORHF2OXBVcEJHcEloOWdBcHJMd0JCY0ZDZGxucWpwdjE3UUhOWXhveG9T?=
 =?utf-8?B?UHY4eXFiZStBQk1sWUdaeVRsTGR5cXVtZDV1VEJMd200WCtFdTFtUHpzS1Uy?=
 =?utf-8?B?elJuZWozWlI4OERnUTNmUUxObkFkcWRQbDVpWFNyTzZ3QnZyZG1BQXptT2s4?=
 =?utf-8?B?ZEhrNE9FakdJQVlRTVlxUWdtWEMzQTBUVG5sVGJDZVpza0tHVVIwVWxpYzlv?=
 =?utf-8?B?YkZtNlZZd1MxaXJUTjcvVnMzcjZ4QmxIM1pqZTQ2bDRtZnp3NXdwYWIvUFVM?=
 =?utf-8?B?Z0llUktsN0g4alZxVWVBdzYxQkRZaFlHaXNmb0pYV3FweHZiajYyK0VMMUJr?=
 =?utf-8?B?c2xmYUNJZk9vcTJ3ZzlQbk85QzVvb1NXbTc1a3hmbUxlMHprYWpnRmxUSld3?=
 =?utf-8?B?V3JHQ0JWZXMzejg1bm40bjJwcjRRczlvNW5XQ2h2UytHVWxsMmZWYXBtZUxO?=
 =?utf-8?B?Z3JtZDc5OFNqY01BbHNQaFFKVDhBTStwM05hQUlwODVKNGFjL2hRUGk5VTlP?=
 =?utf-8?B?eUZneFhmeXhnV2hzU3Q1M05UMUk4MzIrc1dOSXlGc1NLejYwOG5BRFJHVjBn?=
 =?utf-8?B?RDBRY2Z5ZTh1bk1WQ3h3MllJN0xHK0lLVExZR1dCTVRURTZOaENqaUIxV2c2?=
 =?utf-8?B?TWIzS0xkU3R0TEEvVzFnQkppUlFNZDVObDNTM1ptaVhvajdaNlNJczVpdVgx?=
 =?utf-8?B?dllQUTVTQ21JeUZGVGZMcDhEdWs3VTlDdzMrancxRVBPNXcyTTVaSTRRQVEr?=
 =?utf-8?B?RFlSaURxWnZoZ0VhRjlDWWN5Wkd2SDd4Vm5oekpJVFhhdU15MVBrb0ZQbHlj?=
 =?utf-8?B?NWY0L1poNHFQelZ1YmRhaGhybTQwOVc1U0Y2SzdjbWVkclNqVjZIV0tRSS9k?=
 =?utf-8?Q?gfJyJFd+W+QkWFrOmJ5ms6Y=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0b745e-11b6-4e5a-ee93-08d99394a847
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 06:41:34.1053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6kcBqT9bNBv7PcW2LSTODxSactHDSGIcXpwF0STlhnqay0lACTCM4s3FmSOl+8A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1279
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

Am 20.10.21 um 08:34 schrieb Thomas Hellström:
>
> On 10/20/21 01:27, Jason Gunthorpe wrote:
>> PUD and PMD entries do not have a special bit.
>>
>> get_user_pages_fast() considers any page that passed pmd_huge() as
>> usable:
>>
>>     if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
>>              pmd_devmap(pmd))) {
>>
>> And vmf_insert_pfn_pmd_prot() unconditionally sets
>>
>>     entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));
>>
>> eg on x86 the page will be _PAGE_PRESENT | PAGE_PSE.
>>
>> As such gup_huge_pmd() will try to deref a struct page:
>>
>>     head = try_grab_compound_head(pmd_page(orig), refs, flags);
>>
>> and thus crash.
>>
>> Thomas further notices that the drivers are not expecting the struct 
>> page
>> to be used by anything - in particular the refcount incr above will 
>> cause
>> them to malfunction.
>>
>> Thus everything about this is not able to fully work correctly 
>> considering
>> GUP_fast. Delete it entirely. It can return someday along with a proper
>> PMD/PUD_SPECIAL bit in the page table itself to gate GUP_fast.
>>
>> Fixes: 314b6580adc5 ("drm/ttm, drm/vmwgfx: Support huge TTM pagefaults")
>> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_gem.c      |  2 +-
>>   drivers/gpu/drm/radeon/radeon_gem.c        |  2 +-
>>   drivers/gpu/drm/ttm/ttm_bo_vm.c            | 94 +---------------------
>>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  4 -
>>   drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c | 72 +----------------
>>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c   |  3 -
>>   include/drm/ttm/ttm_bo_api.h               |  3 +-
>>   8 files changed, 7 insertions(+), 175 deletions(-)
>>
>> v2:
>>   - Remove the entire thing as per Thomas's advice
>> v1: 
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fr%2F0-v1-69e7da97f81f%2B21c-ttm_pmd_jgg%40nvidia.com&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Ce27350925989400d009c08d99393b14a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637703084808329081%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ElqvK%2FJWgGMSCzt91lEotVK2pCelchxp6WGRgHv0ojQ%3D&amp;reserved=0
>>
>> After this patch the only users of the vmf_insert_pfn_pud/pmd_prot() 
>> functions
>> are DAX and DAX always has a struct page. Eliminating this 
>> non-working case
>> will simplify trying to fix the refcounting on ZONE_DEVICE pages.
>>
>> Thanks,
>> Jason
>
> I think the patch subject needs updating to reflect that we're 
> disabling PUD/PMDs completely.
> With that fixed,
>
> Reviewed-by: Thomas Hellström <thomas.helllstrom@linux.intel.com>

Yeah, agree. A commit message like "drop huge page faults, they don't 
work atm" would be rather helpful.

Apart from that Reviewed-by: Christian König <christian.koenig@amd.com> 
as well.

Regards,
Christian.

>
> Follow up question: If we resurrect this in the proper way (and in 
> that case only for x86_64) is there something we need to pay 
> particular attention to WRT the ZONE_DEVICE refcounting fixing you 
> mention above?

Well, I think we certainly need some use case which really shows that 
this is faster to justify the added complexity.

Regards,
Christian.

>
> Thanks,
>
> Thomas
>
>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> index d6aa032890ee8b..a1e63ba4c54a59 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> @@ -61,7 +61,7 @@ static vm_fault_t amdgpu_gem_fault(struct vm_fault 
>> *vmf)
>>           }
>>              ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
>> -                        TTM_BO_VM_NUM_PREFAULT, 1);
>> +                        TTM_BO_VM_NUM_PREFAULT);
>>              drm_dev_exit(idx);
>>       } else {
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c 
>> b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> index 8c2ecc28272322..c89d5964148fd5 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> @@ -56,7 +56,7 @@ static vm_fault_t nouveau_ttm_fault(struct vm_fault 
>> *vmf)
>>         nouveau_bo_del_io_reserve_lru(bo);
>>       prot = vm_get_page_prot(vma->vm_flags);
>> -    ret = ttm_bo_vm_fault_reserved(vmf, prot, 
>> TTM_BO_VM_NUM_PREFAULT, 1);
>> +    ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT);
>>       nouveau_bo_add_io_reserve_lru(bo);
>>       if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>> FAULT_FLAG_RETRY_NOWAIT))
>>           return ret;
>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c 
>> b/drivers/gpu/drm/radeon/radeon_gem.c
>> index 458f92a7088797..a36a4f2c76b097 100644
>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>> @@ -61,7 +61,7 @@ static vm_fault_t radeon_gem_fault(struct vm_fault 
>> *vmf)
>>           goto unlock_resv;
>>         ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
>> -                       TTM_BO_VM_NUM_PREFAULT, 1);
>> +                       TTM_BO_VM_NUM_PREFAULT);
>>       if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>> FAULT_FLAG_RETRY_NOWAIT))
>>           goto unlock_mclk;
>>   diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c 
>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> index f56be5bc0861ec..e5af7f9e94b273 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> @@ -171,89 +171,6 @@ vm_fault_t ttm_bo_vm_reserve(struct 
>> ttm_buffer_object *bo,
>>   }
>>   EXPORT_SYMBOL(ttm_bo_vm_reserve);
>>   -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> -/**
>> - * ttm_bo_vm_insert_huge - Insert a pfn for PUD or PMD faults
>> - * @vmf: Fault data
>> - * @bo: The buffer object
>> - * @page_offset: Page offset from bo start
>> - * @fault_page_size: The size of the fault in pages.
>> - * @pgprot: The page protections.
>> - * Does additional checking whether it's possible to insert a PUD or 
>> PMD
>> - * pfn and performs the insertion.
>> - *
>> - * Return: VM_FAULT_NOPAGE on successful insertion, 
>> VM_FAULT_FALLBACK if
>> - * a huge fault was not possible, or on insertion error.
>> - */
>> -static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault *vmf,
>> -                    struct ttm_buffer_object *bo,
>> -                    pgoff_t page_offset,
>> -                    pgoff_t fault_page_size,
>> -                    pgprot_t pgprot)
>> -{
>> -    pgoff_t i;
>> -    vm_fault_t ret;
>> -    unsigned long pfn;
>> -    pfn_t pfnt;
>> -    struct ttm_tt *ttm = bo->ttm;
>> -    bool write = vmf->flags & FAULT_FLAG_WRITE;
>> -
>> -    /* Fault should not cross bo boundary. */
>> -    page_offset &= ~(fault_page_size - 1);
>> -    if (page_offset + fault_page_size > bo->resource->num_pages)
>> -        goto out_fallback;
>> -
>> -    if (bo->resource->bus.is_iomem)
>> -        pfn = ttm_bo_io_mem_pfn(bo, page_offset);
>> -    else
>> -        pfn = page_to_pfn(ttm->pages[page_offset]);
>> -
>> -    /* pfn must be fault_page_size aligned. */
>> -    if ((pfn & (fault_page_size - 1)) != 0)
>> -        goto out_fallback;
>> -
>> -    /* Check that memory is contiguous. */
>> -    if (!bo->resource->bus.is_iomem) {
>> -        for (i = 1; i < fault_page_size; ++i) {
>> -            if (page_to_pfn(ttm->pages[page_offset + i]) != pfn + i)
>> -                goto out_fallback;
>> -        }
>> -    } else if (bo->bdev->funcs->io_mem_pfn) {
>> -        for (i = 1; i < fault_page_size; ++i) {
>> -            if (ttm_bo_io_mem_pfn(bo, page_offset + i) != pfn + i)
>> -                goto out_fallback;
>> -        }
>> -    }
>> -
>> -    pfnt = __pfn_to_pfn_t(pfn, PFN_DEV);
>> -    if (fault_page_size == (HPAGE_PMD_SIZE >> PAGE_SHIFT))
>> -        ret = vmf_insert_pfn_pmd_prot(vmf, pfnt, pgprot, write);
>> -#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
>> -    else if (fault_page_size == (HPAGE_PUD_SIZE >> PAGE_SHIFT))
>> -        ret = vmf_insert_pfn_pud_prot(vmf, pfnt, pgprot, write);
>> -#endif
>> -    else
>> -        WARN_ON_ONCE(ret = VM_FAULT_FALLBACK);
>> -
>> -    if (ret != VM_FAULT_NOPAGE)
>> -        goto out_fallback;
>> -
>> -    return VM_FAULT_NOPAGE;
>> -out_fallback:
>> -    count_vm_event(THP_FAULT_FALLBACK);
>> -    return VM_FAULT_FALLBACK;
>> -}
>> -#else
>> -static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault *vmf,
>> -                    struct ttm_buffer_object *bo,
>> -                    pgoff_t page_offset,
>> -                    pgoff_t fault_page_size,
>> -                    pgprot_t pgprot)
>> -{
>> -    return VM_FAULT_FALLBACK;
>> -}
>> -#endif
>> -
>>   /**
>>    * ttm_bo_vm_fault_reserved - TTM fault helper
>>    * @vmf: The struct vm_fault given as argument to the fault callback
>> @@ -261,7 +178,6 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct 
>> vm_fault *vmf,
>>    * @num_prefault: Maximum number of prefault pages. The caller may 
>> want to
>>    * specify this based on madvice settings and the size of the GPU 
>> object
>>    * backed by the memory.
>> - * @fault_page_size: The size of the fault in pages.
>>    *
>>    * This function inserts one or more page table entries pointing to 
>> the
>>    * memory backing the buffer object, and then returns a return code
>> @@ -275,8 +191,7 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct 
>> vm_fault *vmf,
>>    */
>>   vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>                       pgprot_t prot,
>> -                    pgoff_t num_prefault,
>> -                    pgoff_t fault_page_size)
>> +                    pgoff_t num_prefault)
>>   {
>>       struct vm_area_struct *vma = vmf->vma;
>>       struct ttm_buffer_object *bo = vma->vm_private_data;
>> @@ -327,11 +242,6 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct 
>> vm_fault *vmf,
>>           prot = pgprot_decrypted(prot);
>>       }
>>   -    /* We don't prefault on huge faults. Yet. */
>> -    if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && fault_page_size 
>> != 1)
>> -        return ttm_bo_vm_insert_huge(vmf, bo, page_offset,
>> -                         fault_page_size, prot);
>> -
>>       /*
>>        * Speculatively prefault a number of pages. Only error on
>>        * first page.
>> @@ -429,7 +339,7 @@ vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
>>         prot = vma->vm_page_prot;
>>       if (drm_dev_enter(ddev, &idx)) {
>> -        ret = ttm_bo_vm_fault_reserved(vmf, prot, 
>> TTM_BO_VM_NUM_PREFAULT, 1);
>> +        ret = ttm_bo_vm_fault_reserved(vmf, prot, 
>> TTM_BO_VM_NUM_PREFAULT);
>>           drm_dev_exit(idx);
>>       } else {
>>           ret = ttm_bo_vm_dummy_page(vmf, prot);
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h 
>> b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>> index a833751099b559..858aff99a3fe53 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>> @@ -1550,10 +1550,6 @@ void vmw_bo_dirty_unmap(struct 
>> vmw_buffer_object *vbo,
>>               pgoff_t start, pgoff_t end);
>>   vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf);
>>   vm_fault_t vmw_bo_vm_mkwrite(struct vm_fault *vmf);
>> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> -vm_fault_t vmw_bo_vm_huge_fault(struct vm_fault *vmf,
>> -                enum page_entry_size pe_size);
>> -#endif
>>     /* Transparent hugepage support - vmwgfx_thp.c */
>>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c 
>> b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>> index e5a9a5cbd01a7c..922317d1acc8a0 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
>> @@ -477,7 +477,7 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
>>       else
>>           prot = vm_get_page_prot(vma->vm_flags);
>>   -    ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault, 1);
>> +    ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault);
>>       if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>> FAULT_FLAG_RETRY_NOWAIT))
>>           return ret;
>>   @@ -486,73 +486,3 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
>>         return ret;
>>   }
>> -
>> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> -vm_fault_t vmw_bo_vm_huge_fault(struct vm_fault *vmf,
>> -                enum page_entry_size pe_size)
>> -{
>> -    struct vm_area_struct *vma = vmf->vma;
>> -    struct ttm_buffer_object *bo = (struct ttm_buffer_object *)
>> -        vma->vm_private_data;
>> -    struct vmw_buffer_object *vbo =
>> -        container_of(bo, struct vmw_buffer_object, base);
>> -    pgprot_t prot;
>> -    vm_fault_t ret;
>> -    pgoff_t fault_page_size;
>> -    bool write = vmf->flags & FAULT_FLAG_WRITE;
>> -
>> -    switch (pe_size) {
>> -    case PE_SIZE_PMD:
>> -        fault_page_size = HPAGE_PMD_SIZE >> PAGE_SHIFT;
>> -        break;
>> -#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
>> -    case PE_SIZE_PUD:
>> -        fault_page_size = HPAGE_PUD_SIZE >> PAGE_SHIFT;
>> -        break;
>> -#endif
>> -    default:
>> -        WARN_ON_ONCE(1);
>> -        return VM_FAULT_FALLBACK;
>> -    }
>> -
>> -    /* Always do write dirty-tracking and COW on PTE level. */
>> -    if (write && (READ_ONCE(vbo->dirty) || 
>> is_cow_mapping(vma->vm_flags)))
>> -        return VM_FAULT_FALLBACK;
>> -
>> -    ret = ttm_bo_vm_reserve(bo, vmf);
>> -    if (ret)
>> -        return ret;
>> -
>> -    if (vbo->dirty) {
>> -        pgoff_t allowed_prefault;
>> -        unsigned long page_offset;
>> -
>> -        page_offset = vmf->pgoff -
>> -            drm_vma_node_start(&bo->base.vma_node);
>> -        if (page_offset >= bo->resource->num_pages ||
>> -            vmw_resources_clean(vbo, page_offset,
>> -                    page_offset + PAGE_SIZE,
>> -                    &allowed_prefault)) {
>> -            ret = VM_FAULT_SIGBUS;
>> -            goto out_unlock;
>> -        }
>> -
>> -        /*
>> -         * Write protect, so we get a new fault on write, and can
>> -         * split.
>> -         */
>> -        prot = vm_get_page_prot(vma->vm_flags & ~VM_SHARED);
>> -    } else {
>> -        prot = vm_get_page_prot(vma->vm_flags);
>> -    }
>> -
>> -    ret = ttm_bo_vm_fault_reserved(vmf, prot, 1, fault_page_size);
>> -    if (ret == VM_FAULT_RETRY && !(vmf->flags & 
>> FAULT_FLAG_RETRY_NOWAIT))
>> -        return ret;
>> -
>> -out_unlock:
>> -    dma_resv_unlock(bo->base.resv);
>> -
>> -    return ret;
>> -}
>> -#endif
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c 
>> b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>> index e6b1f98ec99f09..0a4c340252ec4a 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>> @@ -61,9 +61,6 @@ int vmw_mmap(struct file *filp, struct 
>> vm_area_struct *vma)
>>           .fault = vmw_bo_vm_fault,
>>           .open = ttm_bo_vm_open,
>>           .close = ttm_bo_vm_close,
>> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> -        .huge_fault = vmw_bo_vm_huge_fault,
>> -#endif
>>       };
>>       struct drm_file *file_priv = filp->private_data;
>>       struct vmw_private *dev_priv = vmw_priv(file_priv->minor->dev);
>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
>> index f681bbdbc6982e..36f7eb9d066395 100644
>> --- a/include/drm/ttm/ttm_bo_api.h
>> +++ b/include/drm/ttm/ttm_bo_api.h
>> @@ -594,8 +594,7 @@ vm_fault_t ttm_bo_vm_reserve(struct 
>> ttm_buffer_object *bo,
>>     vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>                       pgprot_t prot,
>> -                    pgoff_t num_prefault,
>> -                    pgoff_t fault_page_size);
>> +                    pgoff_t num_prefault);
>>     vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf);
>>
>> base-commit: 519d81956ee277b4419c723adfb154603c2565ba

