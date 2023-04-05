Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 920CC6D8505
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 19:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526DE10E148;
	Wed,  5 Apr 2023 17:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA0210E148
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 17:39:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZIOscz3aFJ57ziwPAlVwSc+YMPmYctTdfVURIc5H22hZmDHFg1oi7kEaJY46QS2Q/cYRK/Q59NXtQ0zcTZtncNzIg276Lr/NhKkRmcg4mrdwyvGEhzM7yZCgLXMg2sE3X+YCr60jLxK3U8/6Kl/rmPPzE8gmQB0/8ZdLgiISxux2vQCy5zovBELXnqKqOh+8FtRJ5V/8FIN9YsdxFe3PwkXkTJsa+Lb2q1GQUY88rSzfq7SWQ1dwAB/BvpZi7U+LNSZ+GXAdct/Jpuo8falwz99XjUJPaeO7SqlTZCocVIcDHnmbuiF73kHlRUor2+dJwOZDyyVpKz3kZRMQ4pHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJOOkJdX0uJ67JF/hhjbme0EMRWX9YVgqygK7Vxjao8=;
 b=OFkfZQiU7RpEKPXXw0jDCaiWM2HBXgD9W0Ni2U8LcS61zqc1SwKj9G7CCju+sjXGxnL3223kNPK2p44cjt7Kd8NxhrVb8sG880VB2q+bKEwNXvPdJV5euJWTYxH4W1pr4qDnWEijq4cIOzgJv9+wuERwUaqw2sRubV0H9zVmbrcpEeCqgdv/vCkBSdK7ath0K81v7egIad0UAyGUiZsEQ/f8E9Z7b0JidjCufwzCNfS72EI9PNV8i8CKKnEd5sVgNYqgdgxV2m45hlmnr/7r09L47XEJmF+6Ip+DXi3qwZ0mMfHGI34nbVb0sMv7PkmeQSwA/501crT5RFsdKiCuXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJOOkJdX0uJ67JF/hhjbme0EMRWX9YVgqygK7Vxjao8=;
 b=PyQpV9HY1JWcL1hR+0s7JaguMuNPbmZFW8em1xA0cyUv+PDlmh+Y3fwaO4g2jK3XkvBjkbwfS4idC/IXHNZRr0jS94z0LRbpDZl6WmvfLS6PYV7yMoR5mCiK7m0X1Oa3FVSCUGawqplxxVfXZvGI7xWZfTm3lf90VCY1MVlMNLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MW4PR12MB6683.namprd12.prod.outlook.com (2603:10b6:303:1e2::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.24; Wed, 5 Apr 2023 17:39:29 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80%6]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 17:39:29 +0000
Message-ID: <ecef210b-dc7d-e385-f9b2-927d55a6777e@amd.com>
Date: Wed, 5 Apr 2023 13:39:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 l.stach@pengutronix.de, "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
References: <20230331000622.4156-1-dakr@redhat.com>
 <6ad72a7f-302f-4be1-0d53-00ff9dc37ef7@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/scheduler: set entity to NULL in
 drm_sched_entity_pop_job()
In-Reply-To: <6ad72a7f-302f-4be1-0d53-00ff9dc37ef7@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0393.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::26) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MW4PR12MB6683:EE_
X-MS-Office365-Filtering-Correlation-Id: a9ec803a-fe88-4fc3-bfa7-08db35fcb51e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i0EqaXfZXeiNnRLJdwvXgThFr8fnne0kz5wjxMYJqLXLE435lwO+o314KQPFRpRfofV03lDNJ9Bg57lOqGrPMH+2KTSG4XgGIuFuYVSDnA2UsdQQ3iexvgGMXNZQ+eRvPB1MxJC8+K8ZXuoZ1E3D/pSctfd/tmgChTLgNgmIfzgjEH+ltC+BQ9OHHY0fNYNJNp1CkPkB6a2s7o5EaxEcyXV3LYcvZpPrd+mEn3a9ws2PTIQSoRRbE5snBkt7z199Q+MFGaoVbas25YJgOikLEqdY/JRkvN685g0030DD32+BhqPUN1XHWqrMApk6pJWRYCQ0tveJIGsDNrtPGsp7AgVGSLCTCl42+k41u1pmtPKjCKl2qm+3BdxJLwbybdT2caHhfEgrxGRtJLD9E7CPXmbT0NnnMpnz7HrLjLu6GWnLOip8mm/h3Z92F8bZwnqMDYyYUPuIWfoTS6p6pIL8BgXMXMJrcyXz8zbg3sK5yEy33jvpY5g0Fb2nDxS1vnI/f4tvEo496Pj7+ws7KxuplQ9dQejxTry9+K/D/4bo4eSbFoYaezsjvZPkgi7bxlEcnqGHUvvTYvLUJHlyZqxLV8ovDgj9HBB6VEk6JuJ88Hiok3H/d60x6u1eU/iTx7rZ+f1gWXx32oGtlzY47bLlsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199021)(36756003)(66946007)(6636002)(316002)(6666004)(66476007)(6486002)(66556008)(110136005)(8676002)(41300700001)(5660300002)(478600001)(44832011)(2906002)(6506007)(86362001)(31696002)(186003)(2616005)(38100700002)(8936002)(53546011)(26005)(6512007)(83380400001)(66574015)(4326008)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2IwWVRLU0xKRTgwRDFqUzBNTjVrVUVVam96QmRhZllLZnJ5NThTZnhsTkow?=
 =?utf-8?B?Y1BvMkZJVjYzUzVMSmM0cnNvZ2JMcGNnNnJWWjlmSEtnUE0rQlV5NTl4czFR?=
 =?utf-8?B?SjFRV21HK0JWOWtwYmF0ak1sWWlzM3NGQjVwbk0vVWZXTXFEWTJCOWlkbW95?=
 =?utf-8?B?MnkyMmNEcy9BMUVJeDBsN3VBYlAwaFhuK2Z3SmlXNnpWaHBzcVJlbHhId1pz?=
 =?utf-8?B?STJ2Nm44V1lBaXN1TTlpRXpnZmtjU2FpU2s2OXVYS21PR1JNQVdIcDYyOTcy?=
 =?utf-8?B?UG9RUC9tNkZoZWxEN3BiOE9ReGNycm1kNlYxaENwUVMyQzN6Tnk5MXF2MjIy?=
 =?utf-8?B?ZjU1VDdrWTU2TEhVKzBiUGFSdmdxSmxGS2ZXUXBxZ0FZdHNWRkU1bUxvTXZU?=
 =?utf-8?B?VENDQkpRY0twMHB1NWV2ODcvRWFkS2hjcGpSKy8rNTk2dmt2NzRHUW5UcUdK?=
 =?utf-8?B?S0VyWmVOZEpmTnZtaTdmbDNib2VIOTc3WVF4ZUdzQkRDMkIzVm9aM2UzOHpE?=
 =?utf-8?B?SHFObzcxZjFmN3pPbHlxOG1WR0IzM0lieHNWdHFFY3B4eVB4WUxzTit1dkdZ?=
 =?utf-8?B?ckpoOERtOUFMeGNpYWhjcmxlS2U1eXdoeXVrQThEeVk0cEdLL2ZwUVFmREpj?=
 =?utf-8?B?MkRIQnFIb0xaRDNCK2dpejdWNHJNamdKVGYxV1lVRG9VU1h0RXBkZ0lScEcz?=
 =?utf-8?B?Wlk4TDNKc2JpcEI4WXNrMWt1b3NhbG1Bc0RDR1JsM010YVFVakhtdExuTm9x?=
 =?utf-8?B?anhYb0QxMXJ5Ykh6NThTQmhYQWxWTk41UGQxbGVFYUNTV0NPUUlkRHhMK3Vy?=
 =?utf-8?B?cnlCTWpGVWNpWlpzbmRraEx2UTNTbktZZHZ1Y2tnRlMwUmZMZjRtNFY0TU5T?=
 =?utf-8?B?L3REUnJlcVgxd0IwRDlJMmZaY1hsbEJrV0RsMjVES0M4TVJua1dtY2MvY2hF?=
 =?utf-8?B?V3hZYktoaGZmZ1VRcmFiYjVxaktoVy9teUR1djVvNW1rQWw4MWVZWkd0allC?=
 =?utf-8?B?OTU1UjFHWlZFRnZvaWVVQ2tWUWVKYWhjYk5DWjcyV3hwcFhoU2hNQmp0ODVw?=
 =?utf-8?B?cFBzL2hMeTR1amdPbkJWR0FkY1pOcmNOdTRlam9mWlFkKytFQXBOeUE1Rk9w?=
 =?utf-8?B?TzFGK2lrWU5vRTVjWlNMYWpjeDVQeGtUcWlPTUFuM2U4dWpSak5lWmlvcjI0?=
 =?utf-8?B?ekV3U0xpbTNrVkpnU0pTVzhBbkJpSTZmNDNQNzZTV1paN0tSZXlKRWtRSW1H?=
 =?utf-8?B?eEFZMElBNG12NXhPYWZnZmxXVXdsbU1kWUFidjVpd0JBR0tFVG52ZkdzeG1K?=
 =?utf-8?B?Z1FZM3ZUZlowMzNZS0l1ZksrZUgrSTV2eG1xdkdtTHZGaGdXN052QzI1bDlS?=
 =?utf-8?B?dTBhNFRWVGtJTlVLMFF3NUl3blAxelZUR1R0ekl0SE1zK1VuNmIza280M2lL?=
 =?utf-8?B?QnIxTlAydkgwcVRHYkJjMXE2T0J5SHdsQ1NtWERvZEJnL01QN2M3bnNzcnRD?=
 =?utf-8?B?L01SbW1TWWtzOEU3MkNqalNHSDcvbFA4YVExdFN2TmJEWUtJUy8wZUpCaDZ6?=
 =?utf-8?B?ek9EaEhER21IUEowdWdsU1lSaHk2SzRwNTgyWTZpSE13V3lBMkRxOTJ3WlFZ?=
 =?utf-8?B?L2JOWjI2OFphSjc3TWhKS2Z5YWFieFlpVnFNbUVEUHVCOHQvZkhqV2czL0VM?=
 =?utf-8?B?U2dMMVp6OFFYOEpPazBqTWhyL3BtWHpERFIrOGVuaWV3Qm9XRnVkMVVLbkZP?=
 =?utf-8?B?YkpWSGlIa1BnV21tcFcyR0dkWnRhZGVUSlpFZk85c1lVb0tMOXJnWTVsbUhJ?=
 =?utf-8?B?SS9WN2x0RzVza0RVSWYvUlpQV2FrVUJINlJmVktLUmE5YThEQlh0VW8walJN?=
 =?utf-8?B?eXZ2NFgvK25nU2pROEY2QSt4TFJGNkxYaDRLRDdmcVR3U0IyTHcvR0lYb2xk?=
 =?utf-8?B?bmNocHFja3ppKzdwcFZ6eFpPQUhwVVJRTXB3ejg4VGtBQUNVcndqRlp4ZWNm?=
 =?utf-8?B?SjdIRitpZEhPM2JqblZtb1FVNHJmNHlnSkVpaEJNZEtOSVU3MGNuSXdJZUhK?=
 =?utf-8?B?anB3S1QrbkkzOStTRGx1Zm8wRStzQWZQZFNQTThYSnUydkFhV2RvamFNY0Vt?=
 =?utf-8?Q?aqXavQpdYA1gMULVkqYtgZXNa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ec803a-fe88-4fc3-bfa7-08db35fcb51e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 17:39:29.1460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jPbgaiN2BjkQUvu685Vl3vc1Hn+zPPBtvYqLuqQSghyY6Gbt8CON4s/JDwmSjTDu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6683
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-03-31 01:59, Christian König wrote:
> Am 31.03.23 um 02:06 schrieb Danilo Krummrich:
>> It already happend a few times that patches slipped through which
>> implemented access to an entity through a job that was already removed
>> from the entities queue. Since jobs and entities might have different
>> lifecycles, this can potentially cause UAF bugs.
>>
>> In order to make it obvious that a jobs entity pointer shouldn't be
>> accessed after drm_sched_entity_pop_job() was called successfully, set
>> the jobs entity pointer to NULL once the job is removed from the entity
>> queue.
>>
>> Moreover, debugging a potential NULL pointer dereference is way easier
>> than potentially corrupted memory through a UAF.
>>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> 
> In general "YES PLEASE!", but I fear that this will break amdgpus reset 
> sequence.
> 
> On the other hand when amdgpu still relies on that pointer it's clearly 
> a bug (which I pointed out tons of times before).
> 
> Luben any opinion on that? Could you drive cleaning that up as well?

I didn't find any references to scheduling entity after the job
is submitted to the hardware. (I commented the same in the other
thread, we just need to decide which way to go.)

Regards,
Luben

> 
> Thanks,
> Christian.
> 
>> ---
>> I'm aware that drivers could already use job->entity in arbitrary places, since
>> they in control of when the entity is actually freed. A quick grep didn't give
>> me any results where this would actually be the case, however maybe I also just
>> didn't catch it.
>>
>> If, therefore, we don't want to set job->entity to NULL I think we should at
>> least add a comment somewhere.
>> ---
>>
>>   drivers/gpu/drm/scheduler/sched_entity.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 15d04a0ec623..a9c6118e534b 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -448,6 +448,12 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>   			drm_sched_rq_update_fifo(entity, next->submit_ts);
>>   	}
>>   
>> +	/* Jobs and entities might have different lifecycles. Since we're
>> +	 * removing the job from the entities queue, set the jobs entity pointer
>> +	 * to NULL to prevent any future access of the entity through this job.
>> +	 */
>> +	sched_job->entity = NULL;
>> +
>>   	return sched_job;
>>   }
>>   
> 

