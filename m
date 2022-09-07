Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C015B0956
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 17:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A1510E7B7;
	Wed,  7 Sep 2022 15:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2052.outbound.protection.outlook.com [40.107.95.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F277610E347;
 Wed,  7 Sep 2022 15:58:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8inX6hQbJ3RiXUHjVcYVKPxj49ws0IbB8854n3M42T8PKK+PSkilWE9YXoatRxTZuqviO9eeQwjBRMxdz2mtqEdWipjR8ufiMdGXWGe/7BxD12l3Q2S2rws3ID33cBsk40aLBuetxeYc7KqmimTYuAm9Ne9JfA5Y0egS2siuBrVqz3uuLk66gSGF02Iq1Iw/oiG7jLFWAvkxaI6BhKhcnC+A8rkydfKY6htAfaGUTiC1GzscbI6QYefYMoUin0q0dPpdWPaSCwLlreb/+v+3H7wQDrRNDxQwQhSfbnBHp+bWExySuVSpGYllGcTuTjXZTf0gOlredKo7kbOj/MSLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CylvD2reMYvJl7y+elqSvIDKfp8hvBhPm33Aibcodtc=;
 b=Ey9IBuDgnAaOIgEwwjtA/8KAHKmJLRhHLzM9goi32YGdKLNJ2DpceLAwdOcdN1RPMuN3Bn54QSrryzCKxrYBeKOKiqsVKunyAZidPbWRwGE2eeA0Z9uPASksf7t7vxd3uUa9r6zADFpfnxcoVXq0Ddxs2oQp27xhUJCagFE0Ry2mVOsSAKKOHVhJLYWI/tFvjWs1DsiDLKEpgl02uaHGOObZ9x9WMD5BkZvhLKSFQQifUlg8E5PVZRwvfoRL+sArM/A9kaVxepOFDr6bgEIIxl19PLGgzYAFsNt1mhXo3ch1wOhPrIARB/KNK5IEjkzvrIOQWiF+zlT4A/pQdUTuyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CylvD2reMYvJl7y+elqSvIDKfp8hvBhPm33Aibcodtc=;
 b=CdqUa4z/r++xl5gLVnCiHtCg5YuHu16f6sxWA4bGC4lMr9bveBg2iMUj74K1IRpK+33FiXW2Z5+HBYUXm+LcVDn6Xu9hZo0TOhV3UPxEX7BGi89hCvvMSS+nMXDpdjtuv/QiBZeTS5+qbepyJVGzNePvWU2f5vKaRck8Q3wczGs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by MN0PR12MB6269.namprd12.prod.outlook.com (2603:10b6:208:3c3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Wed, 7 Sep
 2022 15:58:10 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 15:58:09 +0000
Message-ID: <2d7b8d1b-2344-182b-dea8-8f75f273b5e5@amd.com>
Date: Wed, 7 Sep 2022 11:58:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/sced: Add FIFO sched policy to rq
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20220903024817.528107-1-andrey.grodzovsky@amd.com>
 <9cc09bec-650d-cfbb-f8be-89fa81343004@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <9cc09bec-650d-cfbb-f8be-89fa81343004@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0146.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::15) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1947:EE_|MN0PR12MB6269:EE_
X-MS-Office365-Filtering-Correlation-Id: f3889d5e-693e-4421-5d5e-08da90e9c25f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pZl1hcQcQgC6VquE5MOrv/LRaZIm2n69fd42sR5kFAKp9NGz9YHVtOggiSXR28sfiaZIajaLTAbSeB/kwdzXT10J6K8fUrecdAYBFoMXRyFyGhXYJIiwMtRXWTcXcUJZB+cYGo9rU7TVY/hyf9A3yWkmGr3UKs26NoA0iWBo+fuqsZHU3GK8Fp1qo9fnIuXBaOIyvKIJG/HfwGgNhmC6BhrZb73lIpY95hBNmF0quGMVBF3Y89ipYjix1mb9muCxMe4MtQaf/p3hL3ecrEeHwxwIbzxguyWV7bOhHnbrQqLMkRLTUiXhjTQ3b07CIz9Bgv86BMbi6bJ8q+h4YeTaAFxcOjyjS9B9uwx2MRC34HMJMJnf7uMUGMMEFGlFYMgL3Xm3KwUEUVoX8LR2yat8JJuC0dfqPGAQ5mpn99we9fh1BIcyflVuMDquluZcTJeCIybkT3XT5p60Ki/41yvehN9eIrwMwHHyRrzXRBjP/dVa2YP7krQnkdqIn6Ri60WTz/A5JkqpkuLk0nkRI667usArtThyMomsGii7UmOX62+9MDU/GvVcKyvvhrBaqoiBC9GL2JiOgbke1tF/eZtOHBuP12WzwN2JVbQ7Xha7T0dHZgqrT7lpl3Gx1cesH49vP6oRbQuTZEUZk/gg+Mj9ZBUU+P4w+0Yrcflp37Jc7vaep4m5bjySLtP3Fs/jwUfMCsFHm4qwkJeQkez4KFdCvDBr6C9oZ1Ma52wyPYJ+IXnpOs14X92vbmPcVmCkgiChUEKrLO9Gjy9xgx/UiALkNIGXYgRX0nxzLfh8xMvRafE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(31696002)(83380400001)(36756003)(31686004)(86362001)(186003)(2616005)(6512007)(41300700001)(53546011)(6506007)(66574015)(66556008)(316002)(4326008)(66476007)(6486002)(478600001)(66946007)(8676002)(450100002)(2906002)(44832011)(38100700002)(5660300002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3pQQXVvSExia0FKMUNvZ1hzNG1aN0xDenFpVTU5ZEZOWnA0V0t6VGZYMnQw?=
 =?utf-8?B?cllHTU9MMXY2cW04YThXQWk5MWZNQWg2U2UzcWRlTDdYck5TdzZubzhTRm9o?=
 =?utf-8?B?ZG1Ha3FySk1GVnhXR2Zsa3NyejZoaStzRXE0V2k0TmxERHQzcHFDR1FlVlZC?=
 =?utf-8?B?alk2bHhTUW83aHd2QjhaalBORy8zcFE3VWp3WVFsUlMzL0FxRGhxVVE1c3pz?=
 =?utf-8?B?N25SaWpsQWFjK0UvWTU5ZTlvdVpRQ2cvY05xZEcvbzRaODN2aGhucGQ1ZERp?=
 =?utf-8?B?cGFrcjdCdE9nbGFrbWQxc3E4TWxjUFFGZEFLUXRpZWNmYm5pM1RLUHZOOW5J?=
 =?utf-8?B?L0M4Z1J6YVpTbTNJdi84c2ZQR1pFWkVQMC9rNHl6UUFTL013U1hOdS9FV0pC?=
 =?utf-8?B?b29peXJpMDJTOWh4dFZQUEtSVGhGMDFmenI1SGNQUE1BSGQ0OXRsa2RwYzZL?=
 =?utf-8?B?MnhScjNlK0RnWXpFQXVoaUFUdmNzd0RrVVpIK2VUc3FkVnZ5L2NTRkVHWUJo?=
 =?utf-8?B?T3Q3WnZtamZJem1CRGkyZWZtMjBObTN0eW1xbkt3SFlOMGQ0M2haSFU2b29V?=
 =?utf-8?B?akhJMG9Zem1keUxOK1lZeWJrcWRxcE1RcUpMQkVrUkZJQUdFeE1zQ3NNeHdT?=
 =?utf-8?B?QWNFS2wveE5KTERGWVk5MHF6Y3ZYZkU0SDNucmhMeEVnMGNwenJvOTVMQ3hI?=
 =?utf-8?B?K1YvL0FvL3l5dW81bmVIa2ZPSHRHZklRMnEwTkxha3FtbzZkTklWU2pqdDd1?=
 =?utf-8?B?Wk1xSGhHZlRVc1ZsRW03emU5djd0WXBxWFR1Q0NkRkJsV0RTcGxoeTA0WU1O?=
 =?utf-8?B?cDVDTkc5a0JRSkZkaW4wVFFkZ3VEbUp3SkE4bmtxeENtazR3V25rRUYwRy9u?=
 =?utf-8?B?eWt3ODJESEkrTUM1WFBKUXZUZzhvYWJjbGpRK1JkcXVGNWlRTXFoMGtjeEFW?=
 =?utf-8?B?L0doeGtqOTZ6cElRd1NXaS9GZDRSOG1WbGRTbnRVRXNBZFpVVkZsNVFZa0xi?=
 =?utf-8?B?eGViaThhdFprVDRvemhHVEUwdSszUGhMQm1OTUIzOFhMNFZJVXBvbVlMRitH?=
 =?utf-8?B?L1NKeFJBZUhrUjJnOXdrdUFMaEUzcVY5TTR3WmJVa0ppR2FyMWkzOXN4NEJB?=
 =?utf-8?B?OGtUMWR6ZS91WUg2OU5CS2tFRE84NDlKUXhySDI4YVNKMVlhOXR4NThUUzV3?=
 =?utf-8?B?OW5JNnNnYTVYODFiTmhORUVYb0dMMTNDOUhmRmtZcVE0N1hNYTJ2L0hINTFY?=
 =?utf-8?B?aFBuaEhrMUJLVGdKeHJMekcvSkJYdUwwTzAwNzNqMUFrNUdOVXBNUGxXMklj?=
 =?utf-8?B?QU9HejJGWk1zTDBtYUtuN1Q5a1gwUUlXQzQvLzN0Ulp6Rkp1RjVqN2pNT3dC?=
 =?utf-8?B?N3ZzYk9GeHlYUjMzbDlHTDFkcVphSkFKUnpNcFMxZk5OSTk2RGJ2cVFvVVlL?=
 =?utf-8?B?ZXJLNzBqN0dwbTdjcXhuZ0NpVXJ6UFllaXJhbnhpMXFKd01vZFRFc09YNitL?=
 =?utf-8?B?U3J6UFRMcHpBRWdVazFzT2lNdk0wYlUwTXQ5eS9BZ3FhT3JpYitrSFlHdEpF?=
 =?utf-8?B?cHpMR0pPK3Vzb1dzYWVpY0N1cXlWOERwd3RsYXJOU0JYeXM3ei9wRGRicUxH?=
 =?utf-8?B?Z282TEsrMGZyWGloZ1U0SHo1emZScTRuYnZRYmRaNVR1OWlncG4vblFGWGc1?=
 =?utf-8?B?S3B4ZUlMazhUR1BLbUZBa094N29rTnBPSzZCd3NyYVRKTE5nWXBZc0cyamZS?=
 =?utf-8?B?YXhXRXo2S0RsRzcwbmoxamtpdC9EMDRDT1FPWk1Fbnl4ME9rT041NkNIUnpP?=
 =?utf-8?B?M2cvMjViUTczSUMySjE3cVIvUy9rT3docWUyRkhwd3Z4WVhVaSt2YkIrcGFQ?=
 =?utf-8?B?ZTIzMkdnVEJmNXBhZVlBV0xxN0dQNHpHYTF5a1BLamVOblZhM2lVbk9FaGxi?=
 =?utf-8?B?QU1hYUcwcjh3VTVPUE5jeDJ2YmZIMG03NzdxT2JjT0ZqMzFOZ0hpd1plVExi?=
 =?utf-8?B?aGVZZXVzZ3J2a3pMTUZSSURBcVhVb0NCdGVFL1J5QjhqbnB6YTBpRlpBdE5L?=
 =?utf-8?B?OTl1QzFMb28xS1ZPc2JDNFdsL2JXUjhEeWJwZHN0VlJtNTdaUVpqZnVvWWw0?=
 =?utf-8?B?aXpNNGxCcXlVU3FLVVgyZG5HUk1NRTFNUldnQzJaOWZITy8yZU1MMFNVSG9M?=
 =?utf-8?Q?unEl/wo2XWHie8KfHNY4c3PNWXVJj5wBmlArpzXNdPOF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3889d5e-693e-4421-5d5e-08da90e9c25f
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 15:58:09.1343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHlecosEH9otGmNdJI8zDy9BHWXp6sYp6hSyrHiXvzT4lFzoUD7TXk8kIplqt8rGlv4HgiMkAK572aDCdfOu9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6269
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
Cc: Li Yunxiang <Yunxiang.Li@amd.com>, luben.tuikov@amd.com,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Luben, just a ping, whenever you have time.

Andrey

On 2022-09-05 01:57, Christian König wrote:
>
>
> Am 03.09.22 um 04:48 schrieb Andrey Grodzovsky:
>> Poblem: Given many entities competing for same rq on
>> same scheduler an uncceptabliy long wait time for some
>> jobs waiting stuck in rq before being picked up are
>> observed (seen using  GPUVis).
>> The issue is due to Round Robin policy used by scheduler
>> to pick up the next entity for execution. Under stress
>> of many entities and long job queus within entity some
>> jobs could be stack for very long time in it's entity's
>> queue before being popped from the queue and executed
>> while for other entites with samller job queues a job
>> might execute ealier even though that job arrived later
>> then the job in the long queue.
>>
>> Fix:
>> Add FIFO selection policy to entites in RQ, chose next enitity
>> on rq in such order that if job on one entity arrived
>> ealrier then job on another entity the first job will start
>> executing ealier regardless of the length of the entity's job
>> queue.
>>
>> v2:
>> Switch to rb tree structure for entites based on TS of
>> oldest job waiting in job queue of enitity. Improves next
>> enitity extraction to O(1). Enitity TS update
>> O(log(number of entites in rq))
>>
>> Drop default option in module control parameter.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
> [SNIP]
>>   /**
>> @@ -313,6 +330,14 @@ struct drm_sched_job {
>>         /** @last_dependency: tracks @dependencies as they signal */
>>       unsigned long            last_dependency;
>> +
>> +
>> +    /**
>> +    * @submit_ts:
>> +    *
>> +    * Marks job submit time
>
> Maybe write something like "When the job was pushed into the entity 
> queue."
>
> Apart from that I leave it to Luben and you to get this stuff upstream.
>
> Thanks,
> Christian.
>
>> +    */
>> +    ktime_t                         submit_ts;
>>   };
>>     static inline bool drm_sched_invalidate_job(struct drm_sched_job 
>> *s_job,
>> @@ -501,6 +526,10 @@ void drm_sched_rq_add_entity(struct drm_sched_rq 
>> *rq,
>>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>                   struct drm_sched_entity *entity);
>>   +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, 
>> ktime_t ts,
>> +                  bool remove_only);
>> +
>> +
>>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>>                 enum drm_sched_priority priority,
>>                 struct drm_gpu_scheduler **sched_list,
>
