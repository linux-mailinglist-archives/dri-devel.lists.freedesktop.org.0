Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B66895752B9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 18:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C28D113FFB;
	Thu, 14 Jul 2022 16:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2045.outbound.protection.outlook.com [40.107.96.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B57F113FF7;
 Thu, 14 Jul 2022 16:26:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crLBLNYQy21aTPlOx76CFzmEHbH6WgsexMSuV6/1UZVdh0cY2RVbuE9quew/MLVFJpcakGSDHl8o+5Xl7O9hJs5/BmD8dffrXa1s+8P8/VhSgKg8CXfzxfGne3U2HLdu1+ulfk69vEGsssddDMb2Sz8D2jK2Lus9A0npUjZzv9vK1PEXVA1696NOaSSeq1VqM8NLcq9nIdzW4j80dUj1ZEz/h33ybi5Ulnyxp71oB5X5Swkh0pHNU4HIFYAn+7PL9++qtpBJku7K96wEqleA7yUGx8JuArto/xtizBHk7TUTQndWN4a4LnsKvLL+mr3YemTkXemKmstTaX7W/f3Mvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1gkwYHucvb9/dyFFQOAbXLUpImO/iDZchLyBM7tNKJw=;
 b=kpLhmGL8KI1GQ2eCkud4cbFmSovts0cyvG+nczAKc1N2Ebd/G0RRe1Q0VGQDNUQKbYe8YKk4iZQd2p3Wetn39hfzn+pCKM4vQJz8UYR1wHhNtLovpuYoDDlPullwOzGa+/Gp57dVxwWmh7BDP+2ZwYQSZ7PqitsMRnCLSNx2H/ZQ7xeg17Ya7lGufSGS/RomzSMCDYlH6PoqcGsRG+zo9TA2HsTK4Sww5kZG5OmgBSerLYVW7VggfcW3GL//9MGOHCqCx0o/Y76KcmsXBhN9POAKuBUyog33fPFCpAKRg40yiKQz7YU92eY+7Tq/ccFqi7t+FtHqjN8agzGf0BM1Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gkwYHucvb9/dyFFQOAbXLUpImO/iDZchLyBM7tNKJw=;
 b=z6KUHhMqFLgy0+DULtIcoaqAKup4G+xR+aGMciD8T3aRadjKc6ql6txZ3+dC0sQrYq/8lvW1mQRGmoe263yv10/CqJczAOB4NWg6+hAzKRuVBLUa4Y9abnGkHWVgJpjTJQiFJ+hK3AFq9qCBGxZPsukb3ZAsVrBSOCjckZSt510=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB3725.namprd12.prod.outlook.com (2603:10b6:208:162::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Thu, 14 Jul
 2022 16:26:51 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5438.013; Thu, 14 Jul 2022
 16:26:51 +0000
Message-ID: <49b28cb0-ecc5-836e-aa57-1ea133f8d2a8@amd.com>
Date: Thu, 14 Jul 2022 18:26:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 01/10] drm/sched: move calling drm_sched_entity_select_rq
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, Marek.Olsak@amd.com, timur.kristof@gmail.com,
 Yogesh.Mohanmarimuthu@amd.com
References: <20220714103902.7084-1-christian.koenig@amd.com>
 <20220714103902.7084-2-christian.koenig@amd.com>
 <9bfa0ac5-b3da-8682-25d7-b818faf9a1ec@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <9bfa0ac5-b3da-8682-25d7-b818faf9a1ec@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR08CA0005.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9e8653e-bb79-455a-4c64-08da65b5a87a
X-MS-TrafficTypeDiagnostic: MN2PR12MB3725:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sob+PhjkhZOrtfXUy3c+zGKY1SyZaZ6ozEuimDrACjvQsB4+UPJaoLTwMcTJ8ME5SI+sL3V7bld2ytx00Fz8yzPMpWPiqmTZ8ncWvgb4XhmOl+s3df9bEHCycUUM5y7ZkwCnuJc9gUVREL4JyOVmL9HficgALQFPgQYyAD6CvDDWu93xrxj+NMFXNiG16+E8Gg2g/WQrz6ZWTVwHor+In8CXvTt9M8hrwOnJEPqPu8xh+Ljvofa76PDskR98c6YyLArzMG+48r6X+lTP2of56Ntf9aPi28EdAf20JZVIjtHvPK53fBiF69C0w02daPpAzNbTyhhZ4Wok7lh0gTZqke9Mr7FtdrY0KrNhoeun4U9MUmsb8GR9Xzx8ivCZWtMyqYv37IFu+0P4CJ6R4kRR0qhKECbzkAwxEji0cGUxxwPa1ZQ4CgCUn+ajyLILskXEEY+WOQs5lRIsw9zHPQxVfzaV954Qqj73iJ9DYQLkEPd5YwZFBvAiaoPXvC9DEVBucGPgFhEn/J8vsqT051XhMeCdpMnNn/cZuhRM0uqlyy/qLi/LlKQGH0J9+eEcM5cti5eX5UkfHSKqiFqFCBFTVUAzNwJ8+j8ltlFqgOuVmIPkbhwfgrAOGLxkfUk1t5d+UgrE+ZhLLeD6RKfEjp3/QmoFZxlXzEc/F37oTxHlf3Xn1kHRssII/jiZZDEI6HcmNIiZa4WGVRNZv2czFB79b2yp6hfxtm4GWHX7AWrJpndB7PC5ZEsTXzWGVfC0RZuDXtUcm/iWshpOrc7/CZlgWB2jkCaBOjQRyKF1eFtX1kp7PKCQYAIpOJ0CxhJ8GEOegLZATceBchwzpqBF8NuIlsfCwiEZmSdCa0YqGe82fko=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(6512007)(6666004)(53546011)(41300700001)(6486002)(186003)(478600001)(6506007)(36756003)(31686004)(110136005)(38100700002)(6636002)(316002)(66476007)(5660300002)(8936002)(8676002)(2616005)(4326008)(2906002)(83380400001)(66556008)(66946007)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0ZGT3k4RjlocE9wWTlaL1htQVYyWTBobHkrYWp6Z0xwRjRPWUVZL1BLNGcr?=
 =?utf-8?B?STNuM0JWSWdaTE1mb24vejUrY2RPR3U3cFdRWThmczAwV284b292M3UwaVlx?=
 =?utf-8?B?NUd3V3BMd2FYNndYOFlybTk4RExHbGFIZFZ5QzlkaGJBbkxWRGZXRmZaVkc4?=
 =?utf-8?B?ZytJNE1uWGNxOXFDUzRhRWR5YURHQmRGZmFSMW5RallqOVJXMVg1Ni9pU3ht?=
 =?utf-8?B?bUlPdzNqUUR6STBXb1ppWHEraUQvWnphVmk0cnNNZm15bit6TnBjYmxueS9Y?=
 =?utf-8?B?S0oyS0UyOGkwVS84dTlONSsrNkpOcWpKSDBEMjUzOUlpcWZES2Y3SjBiTWtn?=
 =?utf-8?B?Q2psV2ZYMnZMNS9aL3hobzRyWVM0dm5Cb2laTTM3QThSaElkYnhIZ3d4a2tT?=
 =?utf-8?B?bzM0SHNFaUtSWi8zNDhJT3QxRVFTTzQzUzdtS3B3WSsvOUhWMVJReWg1RnJp?=
 =?utf-8?B?cWJnQVQ5T1NlUHhCaUVFWktFRW5TdGVXMnpwcy9tanpZZ0FJR2taeDk0ejU1?=
 =?utf-8?B?YU4yT3l0SytYMVBIUytZa2UrMmZVUFhnQkJiWGtyNit2aXI2L2hLWU5LWk9m?=
 =?utf-8?B?OURncVUwcWFreWZtSGRVWm5IbUNpa09qVDRMVkkwY05QbksydkJmM3ZiaWp4?=
 =?utf-8?B?eGU5UFlvZExFT25pckx2SzhUMHhPVUh6STIydTNGcHhpbW9WcU9XL3hEd2tQ?=
 =?utf-8?B?djFyRmU0K2pNRDJwZC9Cb29kS21hYnNSTzgrVytsa2FudjlpSUpqMmZ2VWJQ?=
 =?utf-8?B?TEdKemcxb21Pc3ZpYWtMQU9qZjhvU21KajdyMk1BbnFpL0JsNGg1Zmtpc3hL?=
 =?utf-8?B?enYyUDBJcW9IeEppNDJMVVJzWEsvUnp2L2tlZ2hHcGI4NEE3U2VuL0E1ckVD?=
 =?utf-8?B?M0kwa2NyUHFIdVplVHlYQlgrRzdWTjN3cFU5NnZoMnZZditJWTJQMWpvOHZI?=
 =?utf-8?B?bWFyNjBvUEdTVlZ6OGRCelpWdGVsNWpremNIcThuZFM1Q0FtcnlMc0pndDNr?=
 =?utf-8?B?d09YRHB5QkRXK3RnVExrWjVNeU5zbVZBZWNsQ25EdElRVlMzSGFoRWhhQ2p4?=
 =?utf-8?B?QStIWFExS2tENHhiRDNYN3pXZ1JxS1NNVUdyTHpmZSt4bXpmd1VOOUE1VWJn?=
 =?utf-8?B?T3paa09ZNC9penZnUHd3czJNK2UvZThTN0l3MTZkYmJGUXdmTVUwam5oM0E3?=
 =?utf-8?B?bkV1c2dPcXV0SlRuY1Rrd3pjeDJmQVJadDhBcFBadUxXSEFmbHZGSStYUGU2?=
 =?utf-8?B?TWduOUgwTHhZYklnc296Y0pnT29OUGFQT3lYUW5GcW16QzVCeC9vV3VMbW4v?=
 =?utf-8?B?NkJyeTc2eGZmTkcyWENWSVZXeklHM3pZL2JuZjBTaDYzM0x3NDNpSFpxdHZG?=
 =?utf-8?B?UWZFamtGUndpa2t6VlZScVZKSENxeEpSWHF2clhKc3UvMUQ3bEVVK3BrWmd0?=
 =?utf-8?B?ZkNRRFdYcThHNURkQkM2N3BWZGNJRDlHMXprVkJ5ZTlxK3FVc0FUbm85a0ZI?=
 =?utf-8?B?UXhVblRwMlB4OThYY3gzUDhFUHk0OHYyaUhwalVOMzR3czQ3bWw2WktCTVdU?=
 =?utf-8?B?eWdNV1dTYUR0SEdFdHZFRTlJd1JESnJUbWFrbkxweUhWWk5Pa2JJNkN2NEdr?=
 =?utf-8?B?d2xtT2VPWkpqQzFBc2JGcjR2WEkwK3g3YVE0RnlsOUdzWFpzMjBLWVA0R3Mz?=
 =?utf-8?B?U2tBa3VzNTFiQzBRV3ZkTXNLOGplMFNoN2QvdC9ieHp4Z1V6eXlRUk9GYlRR?=
 =?utf-8?B?amhaQWdPMlhDUW9IWHhnTzdUT2NZcmZXMThkQlY0R3lVYjV0L1dBekVHeW1h?=
 =?utf-8?B?T3doUHFVN2FyQlVXTUZmQ1NHbDl5MDhVTlB4TnpTeTdWT3gvSkxLbUVqZ1ZO?=
 =?utf-8?B?R0srMkcveFp0MVFpZ3NwaDJnRmpENWtURHNleXE3bW9xUVZ5MTQ1TmNRTElP?=
 =?utf-8?B?V1ZPZ0NnQlh0SVNiS1ZMVVRvSmpGVlFCd2NDL3dNTEFUUHBlSjg4Ymo0amUw?=
 =?utf-8?B?Ry9va0pPWHgzT1BHVDR2NG4xcTJGTE1BbkRSbmR3bEhWVzBhUlFJeldwLzJE?=
 =?utf-8?B?dy9EZXRTNWdrSWl6QzdpUUZ1WU9vQm83WnJpV0xWYUgvWkMwdzJPZjVnNW5q?=
 =?utf-8?B?ZTlwU2dBWGozL0RTNnNBb0VORC9kbmtEc2t3RXVIY2NMUklMSEk1Qy83NnVj?=
 =?utf-8?Q?AXq1FV2Jm6V7trDBy8P9PdbtmYdyh/FXambYQnvhPMgx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e8653e-bb79-455a-4c64-08da65b5a87a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 16:26:51.7982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9TEWm/Z5k1iHPlXikKpbMJ2B9Co6shp9BIMKsiWQAHGHb93g7NmpjnSr3h+o0Fa0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3725
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We need this for limiting codecs like AV1 to the first instance for VCN3.

Essentially the idea is that we first initialize the job with entity, id 
etc... and before we submit it we select a new rq for the entity. In the 
meantime the VCN3 inline parse will have modified the available rqs for 
the entity.

See the patch "revert "fix limiting AV1 to the first instance on VCN3"" 
as well.

Christian.

Am 14.07.22 um 17:43 schrieb Andrey Grodzovsky:
> Can you please remind me of the use case that requires this ? I 
> browsed through
> related mails in the past but haven't found when is that needed. For 
> amdgpu
> drm_sched_job_init and drm_sched_job_arm are called together and amdgpu
> is the only one who supports modifying entity priority on the fly as 
> far as i see.
>
> Andrey
>
> On 2022-07-14 06:38, Christian König wrote:
>> We already discussed that the call to drm_sched_entity_select_rq() needs
>> to move to drm_sched_job_arm() to be able to set a new scheduler list
>> between _init() and _arm(). This was just not applied for some reason.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> CC: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> CC: dri-devel@lists.freedesktop.org
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 68317d3a7a27..e0ab14e0fb6b 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -592,7 +592,6 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>                  struct drm_sched_entity *entity,
>>                  void *owner)
>>   {
>> -    drm_sched_entity_select_rq(entity);
>>       if (!entity->rq)
>>           return -ENOENT;
>>   @@ -628,7 +627,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>>       struct drm_sched_entity *entity = job->entity;
>>         BUG_ON(!entity);
>> -
>> +    drm_sched_entity_select_rq(entity);
>>       sched = entity->rq->sched;
>>         job->sched = sched;

