Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 152AE6D2914
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 22:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDCF10E569;
	Fri, 31 Mar 2023 20:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A74C10F2F2;
 Fri, 31 Mar 2023 20:02:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsVdRTiJaxKgnSmHPHG/kqoCCOMNMuYhYmHxnQfhBB/ItL8phiZyiW8MuEpd7AOIsHzZQ3esHNAK/MPLGxppo10SM6ZzZVlX0YhbNlvpwGB94yVyib/5Ra0lDdksOsutird4qI0369HO+ILwfQdQ8FYypkuXde+OmvtrQ3hDsohEhFtwWXiksQ3y/HL5v4cdEgaOb4ViSq/qZsammO6wIb7Uxu4Y2KleME00qkJHCMk/tXv8+SY+kPWnTpUqP8U6uvclYF31WTwdO35+OwnXotHpXz8SNcoHHSRLDSqScVNK44/KH9WZYgeWUfPG2hGn/jU5umBbZC/4alzmyutHEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqsM+xB+tOHZ/asbEmvlBOXe2ZScGWhPm0MTufO9y44=;
 b=HAXwd9laPc8yNOD2YEf77dIGto5XHJJsyjL8Hdo1KzlFe/EDixMMgh+MtEhZGdL+eovsURz7uGWLztrXoDRlCqswWAbLDKg2PTeU6RJyNPSUOdHhQiThbtEvyXJK54zJ+vLBccPmxVoREGMWwPuDcwSYeW26z21fFyM2aLjWOFqi/JUjGipIpPaFVQZzMdiAmUZCQ3atJai+4/dm23ufXbT01acO3xghVEGCDjxwadaJZD4GecgGmxzz/ALYdZn26JNQKUD2vXuMzLXPr0mDsoYSkJ+W8ZXClmFpYA5twbslZg8yEqasJH27sq7D4fZraTbEHKFabh2y81hbx0TBGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqsM+xB+tOHZ/asbEmvlBOXe2ZScGWhPm0MTufO9y44=;
 b=ELJHe8irHY25saKaQy0HHqlb5x6q6NDnD8S1ik1MUqCiySThtTT4OtZz7ShTbPXqvbNhnB917tWNhg6bcpCJLqd+p/99jF/puWIWgK+JWQGGqE72APqbIrHje5/7+s27SU1EpdoufVG/jmWEXqc4xoEECnJaojHBldNBhIMRyoE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA1PR12MB8406.namprd12.prod.outlook.com (2603:10b6:208:3da::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Fri, 31 Mar
 2023 20:02:17 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f170:8d72:ca64:bb26]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f170:8d72:ca64:bb26%5]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 20:02:16 +0000
Message-ID: <dd4944ef-ef9b-4070-8012-543a78bb9e58@amd.com>
Date: Fri, 31 Mar 2023 16:02:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/ttm: add NUMA node id to the pool
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20230330195043.1136322-1-alexander.deucher@amd.com>
 <aeb5c27e-121d-f666-249c-898e98d5ec2f@gmail.com>
 <CADnq5_MSAWnK18rbST28iJKTDM2Tr58wL7ak2CGoeJ845HTOqg@mail.gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <CADnq5_MSAWnK18rbST28iJKTDM2Tr58wL7ak2CGoeJ845HTOqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0148.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ac::13) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA1PR12MB8406:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ec83b43-1c62-43c8-7ea3-08db3222d3ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gVNvP6KPOUMpeJr5c/kCFAfkd/zudgz5Y5Q2ZK4vl222gV3FYplOFP4gbJcapFGDmfhgGbFgR67+zgAkDtIufNnMn9lTlmQ4Rixv41YYG+XzbknBYYBr/uQf3YtdR/mUMZZHNtjjbsIUjJivye32JuvWwW6ic3aZz5pEY5DX3MRlTUjjHJaiMlTYIX2F6gWnGRl5Nm39/4ea4fexwcj5B/WQgkStqkMVGrkEkzCnXZBOc93TuPaDF2/+G7zpnfgVttTgwaQcNpprjkNjqOBI8zmDEuuIBCBm+VSc3WL/UKmOtWPCreUFR/TX8aKFUyHFYOCxPuJVLVE0mBByoLcirbZl/rsKA1ApzhaBgrkkh6Ij7QRe5GT3QtYmLBtO85q9TzKD8ipIN8IJWATOklNWmvrd15n3Pqzq5e8R4aqlE//GJ/935QT2iRKdwGqrkjlkmyoewesK2Rw9b77z52Oug07NoRDdTATVDinLcF0zPSQAgPhkjopQmaV/k5g1AVh/yBID111qhuLIgK0XHLNx6iz8WcovKKzFiP5IycviwDtvVN5s/8Ku4OFWP0SpNwtWsB0PWlCHzo9UWyn6blkX4OJ8fWcWun+sBnetYIu1y6WxBFhygT1BrEtuisqbMuoVD6CGiya3oP842m0duj8qjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199021)(66946007)(31686004)(66574015)(83380400001)(38100700002)(36756003)(66476007)(86362001)(5660300002)(2616005)(8676002)(8936002)(66556008)(2906002)(41300700001)(4326008)(6486002)(31696002)(478600001)(53546011)(36916002)(44832011)(186003)(316002)(110136005)(54906003)(6506007)(26005)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW9XTXNFaEgrUkFVb3R1WDJGZkxYZWZZR2JDc1hDbEJPUks5eXNPdWw0dU5s?=
 =?utf-8?B?UG9OMmhsOUd6TlFuZkZKZytJb1dTQWYyU1RZY1F5ZnpRSEFZYXQvNW54OWdC?=
 =?utf-8?B?am43MG5KUXYxRDQyMmpsSEZKOFkxdzZSb0UyUDNhdlQwZWJIL1dBL0EveHpM?=
 =?utf-8?B?ODZLbGt4TDE0dVlJOGJzcS8xTnNUUGdoM3ZXL0E3Wnc4TlZPZXhld3gzYzNK?=
 =?utf-8?B?aGNOZHRsWG9KdUZaWGJsejZYY0NBc1FpaFEyUEpiTWFzT04vZGh6aFVnZldT?=
 =?utf-8?B?MFlrNFBhQ0xtdG5Vay92UGJBZkt2Q2p3ak1DcjRidDkrekdzeGE3MGU5OXZy?=
 =?utf-8?B?MzNTeCtXQzhEY251ZU5lL1ZlWjBtbzF1bFRLdEErclZTQ3ozQlFRclRwRDAy?=
 =?utf-8?B?VkZiVEllN21PQXEwcHJKMmMvclVwViszYkFvUFhpbTNIZ3g5dXd2WEY4Rll6?=
 =?utf-8?B?ZGNKQTZ5ZElSNmVUWXptUHNKc0llbWZWejVQU1FNbVBraEFLWmNPVUdjZUVI?=
 =?utf-8?B?b0c2RTNpcnhJcnIvdEpURVZ4YmpNek9MdHNmNGJDUHZ5YzFYcWxTSGtxYzkr?=
 =?utf-8?B?TlJMeEVTMUpIUUZkcG9XaThBRkcxNWpZbXczZjNwQWNVQlR5Nk9leDFEMWN4?=
 =?utf-8?B?RWwwa0lHQTlkcXVwT3VBMGl3LzVtRFdML2JZcEM4SEY2dUMxUXZ0NjhKd0t4?=
 =?utf-8?B?cnB2MFJPNUlzalRMTU1lbURCSXdLV0g5M3BYK0pWOXlPZGVpL2p5T0x0alhO?=
 =?utf-8?B?QklrdUErNTdvdVZ5M2ZkdHUzcTZrZ2FBS0lSay9KT0Z5MlJNb3U1ZE5KZzZ6?=
 =?utf-8?B?b2tRTkF1bzdzT1hrQ0pmeEtaV3JnMnV0czFLVTEreW5nSDVGY2t1SDFEMUly?=
 =?utf-8?B?ZnBKU2lGWDdRamR5blBxb3JQdGxHR1YyMTMrVG80NmE5VUJMSjNhOTZvS29B?=
 =?utf-8?B?LzhkaGFMMGZqaXJWWVc2ZTJMZGJVRTVvT3gxRjN3MkJjN2F1STlHaUpjdFJ3?=
 =?utf-8?B?LzUyQXV5YnZSR2t0bHZFM3ZoK2VCZFBtVHV6eWhmOFI5MUdTQWVQMjVqNWZp?=
 =?utf-8?B?NWxQbkdWZVd3ZkhQSGhVVExnWjh1M3lqb0JlMVBiMXk0RVl5WElFa0JSK0RH?=
 =?utf-8?B?UEZPQkxvbFg2TS9SQWUrazNRS2MzbEgrblRPbXF4Q1BLZkF1OTY2dUJBdVp6?=
 =?utf-8?B?L2s2a1RUTUlqVzFMdERONldRQWdsd3RJcjFNR0dTOTdNMEE2bnQzZzlwZlZI?=
 =?utf-8?B?a3dsdG1qb0kxNUhVTVZNUDcwb2NMTUZ0aHBDZE1HTTlEb2RJR2lKMkhIcE1B?=
 =?utf-8?B?VksvK3oxNjhoR2ZMQWI0Tk1BVTd6S2R6enVZdlE5SmdQSFFYbGc2MzN3cDlK?=
 =?utf-8?B?K3drUW04WFhkSkVTNkpsZkJ6VzdGQ1ZhQ3JEVEdJL2phMXRCaXFqUDdrVE1T?=
 =?utf-8?B?R0tFZ1kxVXFDTHBtL2JGT1ZiOXE0S25GSk5tWWNHZld4czN2bFpPN0VPcFcy?=
 =?utf-8?B?MEhteHhSeFpZU09RN0VpUTVmaTltNlZPL0ZWNmo1bUFFdkoxbnJLd2JWc1RE?=
 =?utf-8?B?Y21SV2VkQ1JlK1VGaUNIQWxUSzE2NEg0em1ickVqZFlla2RHQ3dlWlpBQ2xh?=
 =?utf-8?B?TWErU2dUTDBNVFgwaG42RDEyR2krQ0I2a1hXRmNwK3dYeFZYM3VpSlkwZzZs?=
 =?utf-8?B?d2swZ1hLVThGc0JMTURwODcrbytCK3B3RDdOT2llS1lLS3FkdjB3dTl3d2Vz?=
 =?utf-8?B?R1BCc2F6Z3NQUFRYemIvcEplZCt0K016OXN0NzJ0U3JqcXFoTkNHVHNmUkN2?=
 =?utf-8?B?WVBNZHNWYUs0V2dsYUVJSGJKRWxZNElEcjgxdG9hWlhmUlFNb3RBc3lyeCt2?=
 =?utf-8?B?QmdlVUFyQVNVdmVvZlUwSDNJRWRlSXRaV0oxeG5nazZ5LytBQXdUNFVBMGNZ?=
 =?utf-8?B?VU42OEN5azZLTmNTZmJpU2gvUVBxZnpPbDZKbjNJSUcrdkJXZHZxSkNUZXFx?=
 =?utf-8?B?TFkxeHlMckM3VmpKTVNmZVc1UzdlWVRLR0IrSWNBUURkRXZTWVVHMjVMK0Z1?=
 =?utf-8?B?aDlVaDRSc0ZTMDMrNk9mS2pGZUNLdWVoM05idFl1SlB2V0h4WlVXTE1qcW42?=
 =?utf-8?Q?wMhzZFaC5gVr8VqnrmeicjBxG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec83b43-1c62-43c8-7ea3-08db3222d3ca
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 20:02:16.8373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cc1CCBwaSIEMrknbj69vPfedzVuikuvOvQoqkjGdZid5xlaHuoprjRGo0s9fZ/WlTHM211D/iKhLz7PcphbWmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8406
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
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Graham Sider <graham.sider@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a subsequent patch where amdgpu directly calls ttm_pool_init to 
create pools per NUMA node. That will depend on the updated function 
signature.

Regards,
   Felix


On 2023-03-31 15:17, Alex Deucher wrote:
> On Fri, Mar 31, 2023 at 2:54 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Should I push this to drm-misc-next or do we take it through
>> amd-staging-drm-next?
> I think either way is fine.  We can carry it internally as needed for
> testing if you want to commit it to drm-misc-next.  I don't think
> there are any direct code dependencies, but you or Rajneesh can
> correct me if I'm wrong.
>
> Alex
>
>> Christian.
>>
>> Am 30.03.23 um 21:50 schrieb Alex Deucher:
>>> From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
>>>
>>> This allows backing ttm_tt structure with pages from different NUMA
>>> pools.
>>>
>>> Tested-by: Graham Sider <graham.sider@amd.com>
>>> Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_device.c |  2 +-
>>>    drivers/gpu/drm/ttm/ttm_pool.c   | 13 ++++++++-----
>>>    include/drm/ttm/ttm_pool.h       |  4 +++-
>>>    3 files changed, 12 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
>>> index e7147e304637..4a8164a5320f 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>>> @@ -218,7 +218,7 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
>>>        bdev->funcs = funcs;
>>>
>>>        ttm_sys_man_init(bdev);
>>> -     ttm_pool_init(&bdev->pool, dev, use_dma_alloc, use_dma32);
>>> +     ttm_pool_init(&bdev->pool, dev, NUMA_NO_NODE, use_dma_alloc, use_dma32);
>>>
>>>        bdev->vma_manager = vma_manager;
>>>        INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>>> index 9f6764bf3b15..1068a41cded1 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>> @@ -92,7 +92,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>>>                        __GFP_KSWAPD_RECLAIM;
>>>
>>>        if (!pool->use_dma_alloc) {
>>> -             p = alloc_pages(gfp_flags, order);
>>> +             p = alloc_pages_node(pool->nid, gfp_flags, order);
>>>                if (p)
>>>                        p->private = order;
>>>                return p;
>>> @@ -286,7 +286,7 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>>>                                                  enum ttm_caching caching,
>>>                                                  unsigned int order)
>>>    {
>>> -     if (pool->use_dma_alloc)
>>> +     if (pool->use_dma_alloc || pool->nid != NUMA_NO_NODE)
>>>                return &pool->caching[caching].orders[order];
>>>
>>>    #ifdef CONFIG_X86
>>> @@ -523,29 +523,32 @@ EXPORT_SYMBOL(ttm_pool_free);
>>>     *
>>>     * @pool: the pool to initialize
>>>     * @dev: device for DMA allocations and mappings
>>> + * @nid: NUMA node to use for allocations
>>>     * @use_dma_alloc: true if coherent DMA alloc should be used
>>>     * @use_dma32: true if GFP_DMA32 should be used
>>>     *
>>>     * Initialize the pool and its pool types.
>>>     */
>>>    void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>> -                bool use_dma_alloc, bool use_dma32)
>>> +                int nid, bool use_dma_alloc, bool use_dma32)
>>>    {
>>>        unsigned int i, j;
>>>
>>>        WARN_ON(!dev && use_dma_alloc);
>>>
>>>        pool->dev = dev;
>>> +     pool->nid = nid;
>>>        pool->use_dma_alloc = use_dma_alloc;
>>>        pool->use_dma32 = use_dma32;
>>>
>>> -     if (use_dma_alloc) {
>>> +     if (use_dma_alloc || nid != NUMA_NO_NODE) {
>>>                for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>>>                        for (j = 0; j < MAX_ORDER; ++j)
>>>                                ttm_pool_type_init(&pool->caching[i].orders[j],
>>>                                                   pool, i, j);
>>>        }
>>>    }
>>> +EXPORT_SYMBOL(ttm_pool_init);
>>>
>>>    /**
>>>     * ttm_pool_fini - Cleanup a pool
>>> @@ -559,7 +562,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
>>>    {
>>>        unsigned int i, j;
>>>
>>> -     if (pool->use_dma_alloc) {
>>> +     if (pool->use_dma_alloc || pool->nid != NUMA_NO_NODE) {
>>>                for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>>>                        for (j = 0; j < MAX_ORDER; ++j)
>>>                                ttm_pool_type_fini(&pool->caching[i].orders[j]);
>>> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
>>> index ef09b23d29e3..23bd8be6d4f8 100644
>>> --- a/include/drm/ttm/ttm_pool.h
>>> +++ b/include/drm/ttm/ttm_pool.h
>>> @@ -61,12 +61,14 @@ struct ttm_pool_type {
>>>     * struct ttm_pool - Pool for all caching and orders
>>>     *
>>>     * @dev: the device we allocate pages for
>>> + * @nid: which numa node to use
>>>     * @use_dma_alloc: if coherent DMA allocations should be used
>>>     * @use_dma32: if GFP_DMA32 should be used
>>>     * @caching: pools for each caching/order
>>>     */
>>>    struct ttm_pool {
>>>        struct device *dev;
>>> +     int nid;
>>>
>>>        bool use_dma_alloc;
>>>        bool use_dma32;
>>> @@ -81,7 +83,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>>    void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt);
>>>
>>>    void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>> -                bool use_dma_alloc, bool use_dma32);
>>> +                int nid, bool use_dma_alloc, bool use_dma32);
>>>    void ttm_pool_fini(struct ttm_pool *pool);
>>>
>>>    int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
