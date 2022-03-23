Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 415074E536D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 14:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB8D10E371;
	Wed, 23 Mar 2022 13:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500B510E371
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 13:44:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHBjom1OnTm62ovjYCRY0ptDSAGmne1dkuVJ+xM2TukrnA7QN9aK+dB0mq5NFIiAsfS+k/SUVwuq1eHJCAX6K/3MlLvldA89+BpUk1ivjS0+aCnNnzBjTFhxNIme6I52+x56S5HeSjyLp563z/F0EphnTWgVMOkOxk7Ix2FH7i3Om0MNyJY/RrPEBbzQUfS8ai5tkCQc9D17r4oA8tpJWylti+Ccv/TdmDCi6AnHKY1b72PpSFR2BCzzNjYn0I94/nxqZCpnfZ1BgeDUlk5de27/3kvDeSEqij9d+2CkqtMWdtJ3AraX5CIlmh5a4Ahyj9W2oYn0pshbR09PFUWb1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jPDTFlvuGhONHAojbitcd5bkczc2S8nqjR8Am2xlB8=;
 b=d+GZezZa1WXrLFkOUiPGBUA139dDCdRB3cQYdYhLjavFIDihUeR6QpyUqoD0fm0SV5EO8RJpEwMUh5eW8tX12yGA2y1yYrbUcbcnck6WTM3t0xVlVbTGqz01Y8ATh/9d4gWe2tch7WO4xOHtMaB0dO94QdKqXy9Lqh4pzyKTeKf82T3nnR9HLiZcXg9ZUYVhYCfRs95WjmCd33R+PZAVdIteHnf8V0wCZe+0rPPk6PQduxkghZZtSyFg11tw13YzKuYApHXXNY/u3sInyij7R614GuE1jogP4QU4f4zkS9owjmDkYqjl39ruVcTA8+ulPbwdals5Y09zArB9SQtzAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jPDTFlvuGhONHAojbitcd5bkczc2S8nqjR8Am2xlB8=;
 b=13VhcQ1F/aeZYWZD3XVXWY0WM945Ren1R6pBHLn8MiSXxfU4Fnpq8O4+zhffkDpVIYspneCph+lu/lWZfCIqq/XJY94jgVE/V0jCV6Y5g2T/xQf+Pj0dBKoPGg+MqvMUxXuGoXcjz7pj5O987rrRbVmxT+tbw3EsO3dlpp6tZS8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by BN8PR12MB3601.namprd12.prod.outlook.com (2603:10b6:408:46::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Wed, 23 Mar
 2022 13:44:25 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::54ea:af56:9e64:7e51]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::54ea:af56:9e64:7e51%7]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 13:44:25 +0000
Message-ID: <7822f627-3224-d166-62a1-3d7f6bf77d53@amd.com>
Date: Wed, 23 Mar 2022 14:44:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/6] drm/ttm: move the LRU into resource handling v4
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220321132601.2161-1-christian.koenig@amd.com>
 <YjsLkqGEnre4JKkR@phenom.ffwll.local>
 <85c4c3bd-bdc8-83ea-f27e-ce6da141daf2@gmail.com>
 <CAKMK7uE9bd2fMgsHLG8k-v=f=5o8CZ2WTHw3coYgdN0mFikXvw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKMK7uE9bd2fMgsHLG8k-v=f=5o8CZ2WTHw3coYgdN0mFikXvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5P194CA0009.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::19) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81e3b058-34fc-4859-07b0-08da0cd33e3f
X-MS-TrafficTypeDiagnostic: BN8PR12MB3601:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3601B8D9C9D6DA7B8399A3A983189@BN8PR12MB3601.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vvEqj/PDScrdBfOdivQd57d69J3ecch7e+r2ryTfw7WXH198WKMI+H16Kbe68zxPaM7yrffstDdeCidl8k71h13H0ySQiMfyYImpt1c9OexNG4i5FLsIgBn8HfLxSAB0EP/xyVGsHLoJMrlv1j2x39ri/hDGTjzQ2JEqMYirigF7okUbOGOAr7x4+LU/OYZfqGtem5fyfTSRwl/CNW4zEEpQsAB9jzhIWWT/1rh5ejREJD+GvQQ2Ynnw+uH3fJ3/r2Q55oSYtjN5RYP6sTziAEvk59ow4DwuUNIZiAhE3G8kGctUiMeZv81Ykd1HjFeHhvOFm8+nQuM/927tvAT5PQgBFkXw7sp6HBFeyiRCw4l/wO5OjubGLPfZmVSz2nth4qAs3ABJEu+3POShoQ13WvDp16r24KOAwfb6VeTcSkK4/nXzoOoMiJyLWHZakX7l2rlyL1IBfgQljWQ2ncBzVAAXZAU0sgPMNzN/wlOSkRZfNq+OscqyTZhciqsP9DT3jVa5IaVSandu4IIZjFY1kO/LJyPEz/mYWzsBWrbgb7lSLmDNt1VydOliyBTEN12P0gTff7h9BvmMVKqHYUB/L4lHtsQ3o1xE1zsELNHY9dJ09RwEt6OnHljJz4U1pgzinmZk23ByT8apt+cgi1sEdofjJ5r0aHbRwB0MnQwWo5PipdfQc6X/zPPJygTxiVYNfGOmQZUgzdqSmEjxgUr1J3pnN1V7FDOIh0APwFR7Nq6X7AmM/dZUgFHx8vTDDb5X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(83380400001)(36756003)(110136005)(186003)(6486002)(26005)(316002)(66574015)(2616005)(4326008)(31686004)(66476007)(8676002)(66556008)(6512007)(6666004)(5660300002)(31696002)(8936002)(2906002)(508600001)(38100700002)(86362001)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnM5QWI5bWMwV2l1WUFOUzVKRjM2U2Znc0Y2UE5ab2tWZ21PS2h1RVdNb2tJ?=
 =?utf-8?B?S1RuNjh6SmxoVDRqUG1jeDZwZW9wbmkvK2l2cUNLSmphWFh1cDNpYzR3bDdI?=
 =?utf-8?B?TFVFNUlLQ0c4dzNFem0rQmJpaTM5OG0weFEyNGtMd2QzZ09hTzQvMGxjTzFt?=
 =?utf-8?B?WXlCcTZKb3pJOFNuNWFtU2xKdkwwV0ZyaUpKRURUK2pPTUZtazU3dVQySTJW?=
 =?utf-8?B?SFNsVHNuY21PVnppOFFSbHozcVk3Yk5xSWhrNlJLNFRBaHZ0NVhUNGdVSDU3?=
 =?utf-8?B?WmJoYUY1Y0pzR3lmLzloZmZWMTdMSkxWMTRINzBKaGlhckZZQzJaQ0RuVFB0?=
 =?utf-8?B?dldRUWRpZEtVbERRdkpBSjhWZkFZSkJsenBZYnJ0MTVKeC8rd2d3VGtJWUoz?=
 =?utf-8?B?ODZOTjlDR2dtalRCaWFVSTlKbGg4SUgwQWcwSXJOWEZKNjJyQzNMelp3ZHFX?=
 =?utf-8?B?bERRMEJnWFlMUjBjbzg3c0dqM2N2VWN6bHJlQnZIbU5UVHRRRjZVRTBJaldV?=
 =?utf-8?B?VUtzbTRCMDh5eHVUMXFYVmR2UjVFWmEwWVRtU0RvWlFpeUE4WnZmckpibFRT?=
 =?utf-8?B?YWRWejhwdUVhcVN6NWRPYTdONVdsV3dBcTJmQXQyVy9zMzVuQ05BNUlEZUtI?=
 =?utf-8?B?eTF6bW43YlN1NE1nZW51QS94emxVVFZrNm13UnZrV0J2UkRGZnF5TjZTOWR4?=
 =?utf-8?B?V1E4NndlejBkRkFRMGZFMnl5QUZXdE5hWUozN1plZ3ZXU25XWGZmUlAzQXhm?=
 =?utf-8?B?SVphM2d0T01NdC95Uk91OTF0UjlyTjlpSWM1ZW1RMGFwVFA5UTBFYjFPV0dj?=
 =?utf-8?B?THlsOEdKVE9Gc0hJdS9FYndHTmVyNWgvSmFEWTZ2eE54bnZ2a2JTeFp2RTV4?=
 =?utf-8?B?bGVVZ0JJdElOZzN2WVdBWkdEbU9pb3lMWGdBdm52RGdGVno5SjNXTUdnVEwx?=
 =?utf-8?B?dVhoaW00bWNzTjF0WDloUzAxRWp4T0NJbTlKOTIrYkVkODRRQ1NuaWdLdEVV?=
 =?utf-8?B?OVBLSUo5aFJ0MXh2MDhQdDdzMkhUNkcwT2NqVmp1NVl5YlJUUE16ZW0xc2pz?=
 =?utf-8?B?enZJdXlzVXEwc2pxWndBbTU3UnJyT00rMVdlUlBPbjBQeWM1MWQxYjljTVUr?=
 =?utf-8?B?WGpwWGZiUWl1djJ3WFJTZ1pvMVVSaVJSR1IxeGRpeGJKY1BCKy9iQmtxakNW?=
 =?utf-8?B?Z3pWOWJtQ1RJbk5LdUwvM0s3RS9JU1FTUDJFTkloWTc4OS96MTErMEhuN3Bq?=
 =?utf-8?B?MUJoWW5qVkRZMk9wSy9xeW5Ma1Y0dXRRVFVOM1V2dnNzdGN1OWtIZFVrVHIx?=
 =?utf-8?B?aktTU2JUbG53SnBDTXlLa3hTckIwTk0zbTdLZWlQV1U2WWo1RGdjM1pzc3BF?=
 =?utf-8?B?RkZVVVV4QlM2QXVtYS9hRTd1NFVyM1VFVkgremxCZGNPMWt5d1h3ZzF4L0ti?=
 =?utf-8?B?eGxwMU9zQzUzcHdYWERRclRUQk9BYzJVM3EyaEozR0ViQUd1UldJWjRqQm1G?=
 =?utf-8?B?Mm5MV3d3bjZyeGdIc3RiMTRkbWpEczh6L0lPTjZlQzVTZDBObUkyWnBjdTlB?=
 =?utf-8?B?M3h6ZEdoa3pIUGJmcy96ZUhIRHlzL1pkekJqa05HekJlak11MnVnTnUrOHpO?=
 =?utf-8?B?UWIrUUI0dG9lWkZqNjdmdWlKU0dnVHRsV2kwanFzL2xkdGtsNHZDVXBHUXBK?=
 =?utf-8?B?QnNpUzBWUHJ6cU4wNzBkdmhhYVg0TmIwWjFRVnlsQWlmUGZmdG41QjRhRHVl?=
 =?utf-8?B?YnY1eXRiZkFUN1hBbkFmUG9SYjNGMzhjWnYrc053ZnNmdmFCN3pLRThTZkJa?=
 =?utf-8?B?cjBCMU55WHVnYVJXOG80djI3WG5RamNhWkNLakFpbFFHZnNtWFA3Q0RaWDNv?=
 =?utf-8?B?RUtwU3hWK1U1Z2tiNGp5WUhBVEs3Tm9hMGxmVExBanBWcDYraUpLbHdqckdR?=
 =?utf-8?Q?vRQQ5fTXAlIEizx7lE/SC8NtF0LJeYa1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e3b058-34fc-4859-07b0-08da0cd33e3f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 13:44:25.3609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kchem4GQ8uX6QXbodHX9lr3xjRTUGbre2Ia2G7PZSc7I0v3P7RGyzNnzqCaHcWbv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3601
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
Cc: Felix.Kuehling@amd.com, matthew.william.auld@gmail.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.03.22 um 14:36 schrieb Daniel Vetter:
> On Wed, 23 Mar 2022 at 13:20, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 23.03.22 um 12:59 schrieb Daniel Vetter:
>>> On Mon, Mar 21, 2022 at 02:25:56PM +0100, Christian König wrote:
>>>> This way we finally fix the problem that new resource are
>>>> not immediately evict-able after allocation.
>>>>
>>>> That has caused numerous problems including OOM on GDS handling
>>>> and not being able to use TTM as general resource manager.
>>>>
>>>> v2: stop assuming in ttm_resource_fini that res->bo is still valid.
>>>> v3: cleanup kerneldoc, add more lockdep annotation
>>>> v4: consistently use res->num_pages
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>>>> +/**
>>>> + * struct ttm_lru_bulk_move
>>>> + *
>>>> + * @tt: first/last lru entry for resources in the TT domain
>>>> + * @vram: first/last lru entry for resources in the VRAM domain
>>>> + *
>>>> + * Helper structure for bulk moves on the LRU list.
>>>> + */
>>>> +struct ttm_lru_bulk_move {
>>>> +    struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
>>>> +    struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];
>>> Not really needed, just a thought: Should we track the associated dma_resv
>>> object here to make sure the locking is all done correctly (and also check
>>> that the bulk move bo have the same dma_resv)? It wouldn't really be any
>>> overhead for the !CONFIG_LOCKDEP case and we could sprinkle a lot more
>>> dma_resv_held all over the place.
>> You made a similar comment on the last revision and I already tried to
>> play around with that idea a bit.
>>
>> But I've completely abandoned that idea after realizing that the BOs in
>> the bulk move actually don't need to have the same dma_resv object, nor
>> do they all need to be locked.
> Uh how does that work? If you evict that bo while someone else is
> doing a bulk move, then at least the result might be rather funny, and
> I have no idea how it could work.

The LRU is still protected by the common spinlock.

So that will synchronize any modification to both the bulk move 
structure as well as the individual list_heads making up the LRU.

>
> Like even if you then make the rule that you have to lock all bos for
> the bulk move, the bo could still be moved independently, and that
> would again break the bulk lru properties.
>
> And if you do none of the above, there's no reason for that bo to have
> a distinct dma_resv.
>
> Like maybe the data structure wont fall apart, but semantically it
> just doesn't make any sense to me to allow this. What would you want
> to use this for?

Yeah, that's a good point.

It's not technically necessary as far as I can see, but I'm not sure if 
there is a valid use case either.

>> It just happens that amdgpu is currently using it that way, but I can't
>> see any technical necessarily to restrict the bulk move like that.
> Yeah we can do that later on in a follow up patch, or I figure out why
> it's not a good idea :-) Just figured this might be good to lock down
> before other drivers start adopting this.

I'm just wondering if it's really more defensive to restrict the 
handling like that.

On the other hand we can still lift the restriction when anybody really 
comes along with a valid use case.

Christian.

> -Daniel
>
>> Regards,
>> Christian.
>>
>>
>>> -Daniel
>

