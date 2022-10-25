Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A8460D2C6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 19:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0575810E02E;
	Tue, 25 Oct 2022 17:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C0A10E02E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 17:50:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLOkMuOa/4GBJB2W7ypiIN8WsyqaQObg2QHiQahFOrGU5oU2iNncJWIXIkXO/e6M+umCH3t1bUgaVMrezW9wY4p7m+WLB0tGDxDpcHTf7FOxpznq6z9B1gbuuVDBhZqw8wO8UNrx22UhYN4cvW5TPfJ/maCIolkkiKTtaUQd8BrmCJJLvMNaQ5lsg0KzVZMURNBowkQTnWm7mfsRCmyR9JoO8pgbmgcI0a5UF/RppYcAi4cTCMKkchYguYpOgR3WFkRXolbytFBmhoYW4qe/lU9AwDIa0L2SV+wZHPAgDuBHK9lrnCl20RGwHPLguxOF6wh1udI5pj5Mpb7yN4fnpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVj8yBd4/4CIGGoVa0mNgv6KpKacaZ007bdr1+MeBKA=;
 b=k7EYIKSTZLLFJiwb/9OQRebQ0TmEa1wvpndw6mwejOudAoYxRjg0prGor4aOZsDliuAy7s2dk0i11QKOCDeq8NqPeUs0HbxL3uuuAnSZ+ukJOfGrTGVc9Lz/Mx/x6rpnF6hlOUQYWPBVzSDh/pSeiaFFRXkvV7+XwHHEzC7g5RKQ4gxLG/gJ+/ikse5K3fOhlBR8sCunTbDl8Z6jqpNKLMM+Y39CpdEZNtv6bbfLUSIv4Y7hIvZWbRrKzdjoA2c4xCYw3m1UvE7pPnBvAsbmCxRDetUagmJEyvqBxV7gWdiurZ/MiMz5vN1WSj69MWbdbRmtr9FVXWEyIC4I52jO4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVj8yBd4/4CIGGoVa0mNgv6KpKacaZ007bdr1+MeBKA=;
 b=kC+PCfsq4+LvM08WYnqAdJE3BU+TR1xpBC7jmOzG1xnaSpLIiFJpt5M16bI+ra4yehMlx+HfQjMBijPSK+iWtxPZaMSoN/rui+urLDCWHdWdrS7PPl4XzFGddHLm+8zIajgySfDmIw0H0bkLJJSLag3gVHvWnJmcZsuFvRs0XhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 BY5PR12MB4967.namprd12.prod.outlook.com (2603:10b6:a03:1de::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.23; Tue, 25 Oct 2022 17:50:06 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 17:50:06 +0000
Message-ID: <a70dcda0-6723-38f6-efeb-e8edb16dab55@amd.com>
Date: Tue, 25 Oct 2022 13:50:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] drm/scheduler: set current_entity to next when remove
 from rq
Content-Language: en-CA
To: Alex Deucher <alexdeucher@gmail.com>, brolerliew <brolerliew@gmail.com>
References: <20221025061846.447975-1-brolerliew@gmail.com>
 <CADnq5_NweAo-7snRLkidNkOizu7Ft+7GgXCS2Rnv1oxmRFb_RQ@mail.gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <CADnq5_NweAo-7snRLkidNkOizu7Ft+7GgXCS2Rnv1oxmRFb_RQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::8) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|BY5PR12MB4967:EE_
X-MS-Office365-Filtering-Correlation-Id: f6df3310-af49-4f0f-5834-08dab6b15a06
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 67c/wJ3H/j6UJbPY4MTxRgN8fF9e3o08/+Xva46m9gYI6loETDToPuDKpvrAAiEgnKiLaqKsHu4q6FcMJBYGAbO4go2hsvQlaPd6D5PCIs9IdAExXDr/tlJgyMXCT7wGQCjt52bnA6acXZKd/AsfR4AW9T9DQPTEvKi3mA7YhGTt6MX7QVgb2AMp7LwzVn0B0lCwLY13uhQaMtGbyR2hFPWLs7YgtnMM0zhuCN1g2XiGEWgDpHVEN2Awg6HyEL1/lQnaRx9qqI1vA58bVJ62jX47jPl/X5hEl0EsulsgxXRiCsvC1sJIQb/MckMI6EB3PT6C8xRZof9NN5Mq2QahP4zeGh58/dhYTL12GcWf4fAdw3FEuqVUVgBonNnFdUeXicFx4U6HhmFjZgbDPZq12adX+zxSUgrjaL2iGprkxsd06tXicEG0wHWq6kLizV1QuuJ7CSTN1tEGUOgKq8dX2m2sMJfUQj9qfQNmlM23AI1D3PNtRKmuiWiZ7R88H7OKmFW3NfbpHSPEWXvHtugoknSLwlxiYizgOO4MYpXEmp8D9eok4viAZAANvAbhGCirTF9aD1Mwss2Pvvj0L7BQ1UYWI/p66EnxLTDwjTvQ8tfw5T6YoWaz4XwQanHiyiSG4CcZg6Ychsz7AKKsX0LlajjydZ1hLmGMI9u+0jBEnlh58/xHCr/YolSX+Z+EluQvYFPJHctRd/lL3C0GVu6OeYnaoGzU/A8QY8WV43JnwaBHiYwjHEtAxw20fEn2NKLg3npY8VA4WJVJ06pNE5IApB1KGYk8zJtvvsHx0a8oshY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(451199015)(8936002)(26005)(41300700001)(6512007)(5660300002)(6506007)(66556008)(53546011)(36756003)(4326008)(110136005)(66946007)(8676002)(66476007)(6666004)(2616005)(316002)(38100700002)(44832011)(186003)(2906002)(4001150100001)(83380400001)(31696002)(86362001)(31686004)(6486002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bS9PSDlaT3I1WHN1U0VGbXpCOXljT1pkd0dVUE1HWWltOWZVdHlDSndYbUlO?=
 =?utf-8?B?OHhVY3BIR0ZXem55dnBRUTMydGxLQ3VUQVh3K2hlWUdRbTRySWw3SW9uTlNj?=
 =?utf-8?B?dVRQZmI2aXhBSXZCYXA2dWtUN1JLWG9MTXl2Mk55NzZjcDFwRWZ6Mks1bEc0?=
 =?utf-8?B?L08rejE5bVFPOE1wVVFnUTY4bzBoQ2c5RHd2dDZOclJ5SVYxU0xhQm5rYWd4?=
 =?utf-8?B?SjIzMnhtMVhnYStpM1ZiWW16RUg0WGgyaWdISExHWnBiSEVKZWJaOEdTM1M4?=
 =?utf-8?B?UTVzcnJMbHFZL0k4SkFPSzd3aitFTnhzbFhmcnpUdzA1ZllnYW1LZHJjdXVT?=
 =?utf-8?B?RFQvZCtPTitMemFiallRLzhPL3B4ZkYyMk44RDZudVBZeTVCd0pwS3hFNnJK?=
 =?utf-8?B?Y2xUbDF6MHBNdnBxaURUUk42dGQyekxMbUM1dUcvUnRpajN5V3dXeUh6NVFD?=
 =?utf-8?B?dlhsazg2VzE0Rkh0c25jTXdEWVZtcU1PVW9ieDlOeWJFeUxMTzdiMkV5UGtq?=
 =?utf-8?B?dTBJNHpKU0syNjhtcUtBWHV0UXphdCtTRjZSenRJZngwQXU0M0JxbTJqVVNu?=
 =?utf-8?B?NVlVa2NYRDlrVzA1RFVzOWdWclczdzdOUFRlcXA1RTZ6Mm50OG9xR1JEc0RV?=
 =?utf-8?B?UVk0NFR3UXQraXltR1g5Mjd3WC9UamNoNkliTG9jTVJ0Nlk1bVA2Q2doNWNk?=
 =?utf-8?B?NjhMbnJrNG5tZmV4dnBsMmNmWHFoNTB4WDhFSzUwaW11WXA4VkZIbDZuZGlP?=
 =?utf-8?B?Vi9BYTd3UXdtMjh2NjkrSllFMEoyNnU4N0lsQTVJd3JldFNxbTVsamtCbUx6?=
 =?utf-8?B?T0JXTmg0L1M4TXF0SG8ya09Cd0M5VU5PMDlramw1ckxDQk5jaFhDTURYa0I1?=
 =?utf-8?B?bWZBcTJBSVRlcWJFQ3A1WURBSkpwakZienoyY2owdXRXMWc5cGFLcVlIeVpW?=
 =?utf-8?B?V1BVSVJETk1ocmNtYzNpVnFnWlRvTnIyN2t4Vy80ZFdMMkZvb2VjcVpaMUgx?=
 =?utf-8?B?Mml1KzZTcGh4Y283WGF1ejNqYWNGZm1yOGtZcGN0L0lqQXdVOU43TmRQU1lF?=
 =?utf-8?B?VjM2SjhpbFJoaVEzLzlLYjc3cklGOU9UZ21IUHZVaFkyK2RyRjZIM0J3UVJU?=
 =?utf-8?B?Mkorak4ydCtENWlKaDB4WXpuSlVSOTVFN3lqSk1hUHlhRFU0WW5zS0hsZVFY?=
 =?utf-8?B?b3hNL3I5Ly9CSGxzLzBKT3BNd1NzZkJvTGtnV3QzN0xUY0xxMkNCZUdYQkNp?=
 =?utf-8?B?VjBtS1FHSkJlTUhVWlFFaFZjK1JUSTJNVHI3aVh2K2dHOFlCVVpDL0lJOEtG?=
 =?utf-8?B?NVBFRTB4WFdSODRSNkV2MHFMM3RLRHJjeVNJd3IycldaRkx4a0graThULzdK?=
 =?utf-8?B?a2tzTlhBMVRPRkFUb09QTEVseXZ3N2ZWRmpOS2F6Y2pSVTlnOGxQbVZQRGps?=
 =?utf-8?B?M2VzSys4dkVnUzZHUStBSWd6TWxNSzN6MDRtVjFhYTA5SHhCOUlscGNjZ3p6?=
 =?utf-8?B?bnZjVmhWK0drelQzNFFiVWh2K0srZzlCZXF6MjQ3RmpTbVplbTRVTWVCdTBv?=
 =?utf-8?B?TENmaU1udjl3N2ttSTZObVZMQlpLQ25PRndJM3lHR2o0M3N0b0FUVSsyRjdX?=
 =?utf-8?B?eitlZTdHdlFmUC8wcEpPT29abm1wb2tPY3ZtOW9sSldVZFNydjRLNTJHdm52?=
 =?utf-8?B?YlhJUldHYW10dXROMnRtTWQvc2I2eGpPTWtRS1hQelNPalQvNU9kNGdiemlY?=
 =?utf-8?B?UWl5SHQ0Q1JyMllqcmZSK0M3dUlUZHcyUDZ6ekluNEoxYjFMM1RiTmRUU3Vp?=
 =?utf-8?B?TWcxMENaS2oySmtJcjlMSFl6WjhnK09zMTdMdDRVRXZCL1NwSFFUM0tOaUdm?=
 =?utf-8?B?Z2M4TU9ZbTVzdjhiMUwvNWs2MFBoMlByMjJHZ3RyRWo0azBhRkNUMHFLZUJD?=
 =?utf-8?B?TVlLdFJEYzhEcmVUK1VJNWNWVjZZdW0yWEQ5ejM4VXRuU1VOS3plSGVxMS9G?=
 =?utf-8?B?anF5VG51UzJMTURXMEN3MFFkRTZ5akxTcTRCRlVrMlZ6bnFZRElUT1VmMUMz?=
 =?utf-8?B?NkJFVUVKVExaOEt1YWN0NzllYkFDQWc1SnVuYi9wQkpjaXF0NWhUb0szbU5h?=
 =?utf-8?Q?/7/EYIw8sc6TiKRt4Qhqz00jP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6df3310-af49-4f0f-5834-08dab6b15a06
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 17:50:06.3428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nR0s1cJ+YF5bUhtYO8rU/HFscM5AzI82iwiiYnWDkmduOks/TemjUr8MUwfvglx8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4967
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looking...

Regards,
Luben

On 2022-10-25 09:35, Alex Deucher wrote:
> + Luben
> 
> On Tue, Oct 25, 2022 at 2:55 AM brolerliew <brolerliew@gmail.com> wrote:
>>
>> When entity move from one rq to another, current_entity will be set to NULL
>> if it is the moving entity. This make entities close to rq head got
>> selected more frequently, especially when doing load balance between
>> multiple drm_gpu_scheduler.
>>
>> Make current_entity to next when removing from rq.
>>
>> Signed-off-by: brolerliew <brolerliew@gmail.com>
>> ---
>>  drivers/gpu/drm/scheduler/sched_main.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 2fab218d7082..00b22cc50f08 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -168,10 +168,11 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>         spin_lock(&rq->lock);
>>
>>         atomic_dec(rq->sched->score);
>> -       list_del_init(&entity->list);
>>
>>         if (rq->current_entity == entity)
>> -               rq->current_entity = NULL;
>> +               rq->current_entity = list_next_entry(entity, list);
>> +
>> +       list_del_init(&entity->list);
>>
>>         if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>                 drm_sched_rq_remove_fifo_locked(entity);
>> --
>> 2.34.1
>>

