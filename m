Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDBE7E5D0D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 19:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DE210E187;
	Wed,  8 Nov 2023 18:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B6610E187;
 Wed,  8 Nov 2023 18:19:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EytWWoXivWtD+fvY79ASIoCWVAonga6vRPmWqIy15N3uVwTERxM51bcSR7J4wJNPFwIMoks71NRPHnAwfMK3zmO62LS1dXcMGS47BqHng3s9gFF/cQww0uoI5X3xS66ZJ7MFL5AygikALP0s3AyfG5YAxuwWyKIA5KoX28lsU47ijrjeCvP7aip4jsXwxJz5bm9tDIaCXlxKsI7pKdvoJtSgkYGxbXGWAQfVY6cvgB7VpLEAMMvGQtqlLw10MqOYKfBtAk/oa6ROiN0S9pVBSea7n2/VcH4RnKrnIbexe0bIIKykN0v7XGj6grHmN8iE+N+s6CMHPrscwYSXVulPyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKQMKoHL6BpDb1u+rKe60LdTpDbSXCmwzkYIfYCqBD4=;
 b=IIaZ3JNHcmjXwqC3t3TsSIUXw9lIyad8slQf7B1SVZtIqWqAS0YXxLvq9lNlBARIcWgKDWtjVO2YIOsCbPVc18HKjcPmJ+TDrkvMoZQNbE0AkQmO5qmLZ2A1FTfPSuvttcucIJ8RzATZW4BCRGMmhBlaqKoB1+JD/M12ioQ5Hevv6rBvtqzVg1SivmOOfkiLadUCAFydeR8m363eYF4Y3BI3lhRqlRWhYZwurJ39nioGI/Lm86h38rqALRUz1okCiP+FSahbRpMdJNowDFRt61H9LxojDk0vahadowURsf+uhNDh/iq6Q+UY22gabVrHLaRkylcYYOEuw33ANqsqlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKQMKoHL6BpDb1u+rKe60LdTpDbSXCmwzkYIfYCqBD4=;
 b=SH61X2dQgBO3iGGnuiQ3LqbOCD8GMeKJ+rFUOMeFN6nidKhNtJu+mbMHWVsbvIDGJhFg3DeNNPsXNDD//oi1QIg7vtgmaBZ/JoiJ4jpi7OJuFt7XiGYTX5Afy5sDdO2fKnzLihD3rrbag8E2LPg6LiahIMevVAzbMM0kTKi5LCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CH3PR12MB8283.namprd12.prod.outlook.com (2603:10b6:610:12a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 18:19:50 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3%4]) with mapi id 15.20.6977.018; Wed, 8 Nov 2023
 18:19:50 +0000
Message-ID: <70542451-fd03-4b44-a416-02426f26b74a@amd.com>
Date: Wed, 8 Nov 2023 13:19:48 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v2] drm/ttm: Schedule delayed_delete worker closer
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, amd-gfx@lists.freedesktop.org
References: <20231108125824.995445-1-rajneesh.bhardwaj@amd.com>
 <86152ebb-96eb-43a1-b244-052c42ef1024@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <86152ebb-96eb-43a1-b244-052c42ef1024@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0105.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::8) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CH3PR12MB8283:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e3e97fd-b1d2-453f-7601-08dbe0874bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e03Iofaddtmgk7ZAZIDyJ8BUbTinSV6J7rHKJ5nWJEbV1yjQzhpbWrFyrUPT6xJpXebS8J6nT/yPngeKE9hkKFHDvNkLIsYk1RBmKtwOESI/k2txRKAummEcHU/bL7kuMEFWL00lCFWPBYE7RSEt6F2jfTCi43Cjt588wmA8TMBac1lD7AVCgrtzf9cpGv+XmGDrXRBYVsQ4XxEYKhczozot5yxGowhY4m75v/kQyDx5j+B/0Fb7DvI+y2EnenAKjSiNORXSsY9ZjHazWMT9+Ev95rnNgjYOtIyrF4Y2vEodWbI4PQLxzJMHNSoT6Acygo8lkrsiHNyheVGfgH94r//32aeZ1QxcdPcI7RebNVMGKy/EkXuhttnR302zTwO0uLbE/frvqrtw2LL7SZQBcqSWFsHh4jgrRkjZtFdAcIurXiydyYKKHGn0IpNFapmPE9MGvO+Kd16vrJAjTqOSUbDZRV4teaj7XgXIQQCxJWbyNO4xQpA8IWeAG4X2gjUNg7MH3pY+mNr0QZSLfkSc4zDbtF3GAqXmbc3tGcALdboKfzEImFrgyYcK01lbnnUgesvTJ0WYbhn6vUA/4wW0kM8nk+1YcIovKUDUqdRnTriJ0E/js3093n3FnwNhqbStJcVXapek4jGDkMyDogOIkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(136003)(396003)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(53546011)(31686004)(83380400001)(26005)(110136005)(6512007)(66946007)(2616005)(66574015)(478600001)(8676002)(4326008)(450100002)(8936002)(6506007)(36916002)(66556008)(66476007)(316002)(6486002)(44832011)(5660300002)(41300700001)(38100700002)(86362001)(31696002)(2906002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um50QzBKbzZFNFhieHpRS1BQN216bkQ1czkyazU2V1AxY0MrYkMzcG4vdnRI?=
 =?utf-8?B?ZkFRNVpaZ2tBK3RpQ3VGdFJZWVJIZGI4R2ZUaEd3a2tvQzIxVEV6UlYvNUZD?=
 =?utf-8?B?YzBSSm1zR0h0WllaRWtFZmpMNU45SkFuZlJBVnNLalRYWmRjTzZFZU8rU2h3?=
 =?utf-8?B?OFRRS2syNE12QmxlanBGWU1NK2lyVWEwMHJwREExdDROVjlucld1d2tGMUI2?=
 =?utf-8?B?WnNqSUo0NzdFWmdoSWVzRDFmaFBKN0ZKK1FHRisyVTJ0N0NjVG9iVi92TWVp?=
 =?utf-8?B?UkVEOHBKQ2tWRXYvNnZBVHZ6dkJTL3lGNkUrVEgrN25tSVV3NWRrK1BYemRR?=
 =?utf-8?B?LzkzbE14SzhpNk1HdysrOStOcHRsR3RWdlc3MUJPZC91S3JlZmN0cC9oV1ZB?=
 =?utf-8?B?cHVGY2FySTlxb2dHd3JBK1c5dXh3MDNHT29YZGZXb2lEeWNXaHVSek14b2lV?=
 =?utf-8?B?Qkp3czZoV0QyT3lrdHozbm5lcXVTWDN6RFNQcW5TUVUwZ2UwaFBTNnBPbEhI?=
 =?utf-8?B?SktNV1F6TXgvNElyRjhXcnhIR1ByVUVOamdqRjZIZTAxNzdUeityNjdsekhx?=
 =?utf-8?B?Z0Z4YTZMYUhuM09aLzlnMXNGMTZHYXJxM0tpQWVsQ1RHRERQWHJIT21KVDVM?=
 =?utf-8?B?VFVnYmhUWmw4Si94RTFBMFFXK2orUHAxMTBSSWpPVUR1R08rMWtlRTk3TlZv?=
 =?utf-8?B?d29RbmlLTVZ0SFJ2dXdIT3NKQTBnaEkxajFRWGtwTzhKc1ZNNVQ2VUpQVmsv?=
 =?utf-8?B?cSt2bUJhbHVRYXJBcnhhdTBuZUE1VWZ6R0h3M1lObVIzT2dEUnlrUk1sdUtV?=
 =?utf-8?B?QjZLQWVnaFZLaFV1YW5kNzJIS2FqZmlmNnYrdkRTNndmUXphUmhOKzVMc09q?=
 =?utf-8?B?OXQvMjA1TTNDbnUyL3FYUk1paUZyWWluQUhwcER0NmNSZFRWUmxlY1FkM3NH?=
 =?utf-8?B?MThYNXJpd2dvQmZndEorbjBkQ0VNdWJla3M4c3JDT1VpUC8yeVVxelNKOEsw?=
 =?utf-8?B?dm9Hb2dpL3FSaVpzcmQyeWtNSEc2RW01ckhJZlhkMjlrV2N6aGl2eTBjUEh6?=
 =?utf-8?B?SS9RUTM4anN1Q0Y4bGxwL0U2MjhoaE9pRTIvaElZSWNVOTBsYjd0bTd3QmZy?=
 =?utf-8?B?OFVTQithZ0tlTk5TdUpra0VqRnBRUGQzVWdlZFo4akF5dnAvRHRJenRvcmFh?=
 =?utf-8?B?Zno3WVNMeitTaVJwWkJ5ay9sd2xDS3BpZm5WdWlKYjljaGRQdlpOZk04UXFx?=
 =?utf-8?B?eGt6UkxOM2JXcUlNUkhLaUMzKzg2Nittdm0zdWliVFVxVm9QeXl2ODV0Slcw?=
 =?utf-8?B?YXJoNmZYV2pJdmYwK09lZmV6S1YrbXdIaFhzajBacnoycUtERTN0ak9XeDdR?=
 =?utf-8?B?Y0gwQi9uV2tiSGhOaTZ0YzB0SWtmWW1RZDViZTFJTEpzMk9ESGxzT0h6UkVI?=
 =?utf-8?B?bmp2Vlphb05VMVdSeVd4ZzE2SUFMdnVaZzhWRVFScjY3RFJReFBQRTd2Vkps?=
 =?utf-8?B?Q3UrL0pHWER1RlBsTkl2My9aeW5JMkZ1bjR4eDhPU0ptSTVIeUNwRWMvUlN4?=
 =?utf-8?B?cnJ6bjNaRXMzcVNmZGl6cTFETFNpS2ZZQ0RVSlJvT0krdXY3SURVMnpDQUF4?=
 =?utf-8?B?NXJIbHM0YnFYQlBFRTI1ZjVaYzUzYVpITWcwWnRodXl6M3Q0QlZxK0E5Rzdq?=
 =?utf-8?B?U3doWUtBOThSSlZIbTIyQ09xQ3BpaWNWZ0tLVnFYS0lQbWNXa0o0c3NNMmRW?=
 =?utf-8?B?R0owaEtzbmlMMW4rRkJNVGhnMUFmVmpqd1NWVkxveHlPK1hZQ25rRm00WFVj?=
 =?utf-8?B?dExTd1pJZFluZEY0RFpxZTJLbHRSUjlkRGpPd2hKL1B1dmNSb1VucjdBb2oy?=
 =?utf-8?B?V0J2Q3p4ajk5dTVRR09SaDBXaE5RZEVNbEs2TEpWeUpxWHhEdllMbHZmR20v?=
 =?utf-8?B?SVpyMlNVL0VpM2c5cERBZ3VDVGhXbnVBZzJTYWdKUDlKa3JSTEF2MWZETG5U?=
 =?utf-8?B?ODRMTWV2aUsreGRqclVRSlV2dmJwSk1rY25GNkJydjg3T2c0U0t3NzB2aEl1?=
 =?utf-8?B?aWhzUEhYcWkrOEZzanlRcklWNWt1dTdBNTkzT2JlOXYwVnV4c0pXb0JMNDRh?=
 =?utf-8?Q?h6mTJv/TAFYgsAwQLFLofLP40?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e3e97fd-b1d2-453f-7601-08dbe0874bee
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 18:19:50.3504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hUhbDJMSCBkpEFIEo2FpBjJclFv+eFGsrywufH6dMJIaUVX5TeulWScJnfAs377898KfT5tc09fsxDAdSp200A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8283
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
Cc: alexander.deucher@amd.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-11-08 09:49, Christian König wrote:
> Am 08.11.23 um 13:58 schrieb Rajneesh Bhardwaj:
>> Try to allocate system memory on the NUMA node the device is closest to
>> and try to run delayed_delete workers on a CPU of this node as well.
>>
>> To optimize the memory clearing operation when a TTM BO gets freed by
>> the delayed_delete worker, scheduling it closer to a NUMA node where the
>> memory was initially allocated helps avoid the cases where the worker
>> gets randomly scheduled on the CPU cores that are across interconnect
>> boundaries such as xGMI, PCIe etc.
>>
>> This change helps USWC GTT allocations on NUMA systems (dGPU) and AMD
>> APU platforms such as GFXIP9.4.3.
>>
>> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
>
> Reviewed-by: Christian König <christian.koenig@amd.com>
>
> Going to push this to drm-misc-next.

Hold on. Rajneesh just pointed out a WARN regression from testing. I 
think the problem is that the bdev->wq is not unbound.

Regards,
   Felix


>
> Thanks,
> Christian.
>
>> ---
>>
>> Changes in v2:
>>   - Absorbed the feedback provided by Christian in the commit message 
>> and
>>     the comment.
>>
>>   drivers/gpu/drm/ttm/ttm_bo.c     | 8 +++++++-
>>   drivers/gpu/drm/ttm/ttm_device.c | 3 ++-
>>   2 files changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index 5757b9415e37..6f28a77a565b 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -370,7 +370,13 @@ static void ttm_bo_release(struct kref *kref)
>>               spin_unlock(&bo->bdev->lru_lock);
>>                 INIT_WORK(&bo->delayed_delete, ttm_bo_delayed_delete);
>> -            queue_work(bdev->wq, &bo->delayed_delete);
>> +
>> +            /* Schedule the worker on the closest NUMA node. This
>> +             * improves performance since system memory might be
>> +             * cleared on free and that is best done on a CPU core
>> +             * close to it.
>> +             */
>> +            queue_work_node(bdev->pool.nid, bdev->wq, 
>> &bo->delayed_delete);
>>               return;
>>           }
>>   diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
>> b/drivers/gpu/drm/ttm/ttm_device.c
>> index 43e27ab77f95..72b81a2ee6c7 100644
>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>> @@ -213,7 +213,8 @@ int ttm_device_init(struct ttm_device *bdev, 
>> struct ttm_device_funcs *funcs,
>>       bdev->funcs = funcs;
>>         ttm_sys_man_init(bdev);
>> -    ttm_pool_init(&bdev->pool, dev, NUMA_NO_NODE, use_dma_alloc, 
>> use_dma32);
>> +
>> +    ttm_pool_init(&bdev->pool, dev, dev_to_node(dev), use_dma_alloc, 
>> use_dma32);
>>         bdev->vma_manager = vma_manager;
>>       spin_lock_init(&bdev->lru_lock);
>
