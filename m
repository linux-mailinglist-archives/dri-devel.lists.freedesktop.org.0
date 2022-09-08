Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8CA5B1E8E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 15:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1F910EAF3;
	Thu,  8 Sep 2022 13:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6938310EAEA;
 Thu,  8 Sep 2022 13:19:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxFctNl63DXqYBIJo/afIvleM4p/jzFmy3gHwmAOxSwob52vsSN9z0GUwNbTMN5CtOwwZDXL738STilv//yxmlqD1novxJLep41buxQ/fRCVicW71+sbgYlog/Y0FAr0zfc2zg2ge25YY3xoc7CpDHrf/Mtv6SjE0PkD9em9Y2kV7J6cmGBIp4qlJEoUdjEa+AnUNbiZYKq2+RmvOnmdiF5WPh2ExNcZTwMh24p9APWz5s3elZO2rY1bgEkT5WvlmKMIQqM4251kr8EHIsYx69gt4Zax/oHlIOp+FYL+nAMzf1dYhW0t1zB4bC16k2KoqwJn0vPWGyznhcytYGXEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iqxb2FLT3BN6cAQnKipF+2J3+MIOzaU/KcF39Sj5Vz4=;
 b=QqbkXMvZpIlaXj8KxHdyT7Wf+v0uNTb/RsO3RFuNJlP7UDr7fCkGUbsA1vM+5B+WI/9AA3/BrRf6NilMhusQ12X/Yw61yNcaCnmYnjLhZ0XxD5rBaZaAsc9H6/q35npc3b7b4WW8Jsvwhmx8hXATR4/3zyj9rA7ZuHaloLDH3wNugF+r+8IO3BQRjYouKdTiYKj1eSVmq1TA5/zouf4V9WG+MKYvvxz8gu+z9DqY6PB2crFHJo+fc3YTb6iJyc5zzqSHuL33UVZizgrkfLxgoXKoXmBQcoCy7kqPZBXVmh0j5tME1uoecADBOgaBjEQgu3YuTDG8xOGkn/RfnrAWmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iqxb2FLT3BN6cAQnKipF+2J3+MIOzaU/KcF39Sj5Vz4=;
 b=BBZ5WBQRXTUONCK9tPGzu0pjE1L8plVOX33OhPoggfTsz/hnMhAaW2GmsAtF/1cTczKDOjJPaP4bNUFII7QV4wDKAVK1K2WgbwbTFXqOATOwewGfPOm1KxTkCzfjNrVu0+rYQFmr8YYVJpK4kTRQVu9lDZtOFURjX8ST7hYr0xk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1753.namprd12.prod.outlook.com (2603:10b6:3:10d::16)
 by SA1PR12MB6703.namprd12.prod.outlook.com (2603:10b6:806:253::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Thu, 8 Sep
 2022 13:19:54 +0000
Received: from DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::d503:c616:dcf8:2ae8]) by DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::d503:c616:dcf8:2ae8%8]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 13:19:53 +0000
Message-ID: <3a30e256-7966-6f53-8ada-db4c27087259@amd.com>
Date: Thu, 8 Sep 2022 09:19:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 3/4] drm/sched: always keep selecetd ring sched list in
 ctx entity
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 James Zhu <James.Zhu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220907205705.934688-1-James.Zhu@amd.com>
 <20220907205705.934688-3-James.Zhu@amd.com>
 <facee8f2-b674-5893-10fc-ef58ebd76358@amd.com>
From: James Zhu <jamesz@amd.com>
In-Reply-To: <facee8f2-b674-5893-10fc-ef58ebd76358@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0157.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::12) To DM5PR12MB1753.namprd12.prod.outlook.com
 (2603:10b6:3:10d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75989842-1c47-4c50-b6b6-08da919cd11f
X-MS-TrafficTypeDiagnostic: SA1PR12MB6703:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PmltcvA6EdpY39FMxVbqOmFCnCXcz7yoYOgZfd0IXDlVt8WMiZAOomKn+88nAhHXNnl30MxPRs4pj1pKHJzzTm0M0+sgm7dhmP1n+79CLjU+f3+Ups6NkLa67yERE/EUe7SS+zFqh6wY1UrdCelZqFk0pWvonrMNtjSLLnb1yw1Xq3OA2/Qbrd8l2AbDziWzKu2ooek5jr8MvFHr1bUgIvo/zEy6mgfGzz0ywWIW+U/CkEy0lei2AOjHII/+RpCW0Pmt59heLjSaVQurL9lME6aphcyF2GLhHK6aure3N1NgCJu3eoyC/eVeb0LbIuUhpurciAfmdBgPdS0CwaEW4aSje0oo3Xpfatrxm7TboTB2hGNblpyNhgvdVtDCj60jxdDFOhIkLvVKW8vT1rD32eahTHk3hGSv3bS8gf3C1i5hGRLUzZBzrwccbQYUfrGYkXoihfJO+j0qa567BZTno9AndPT7sizOCsDdGnJDTIGeiqD/DE0vWsKIBpxamwLsvwZySkfecVYmXUsg5p4xXlg8fVyeXdE4yHfGQYKHpKn5fATYJT32m1FH/xQTsSdwIh1eziRXofwxRig8A5go5FGZGHhDtASU62f2K6sCkAOyFUS6mlWROULAdc3t6nQ65JEGfviHBUlq50L0T5T/RGE/ctqZkDIVQjJL62rZIM8VbepuSWfDjpgWKUitWAkoKEN8xJ/4Nm+8n0zE+Kv6iA2moyflnD18Y3Upsm3oZ+dnYQIBdDi5HgZnpODVdaajGWmzT+FCjXf+FZIJaerPyXUP3r3663sUwMLWR+pMATA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(83380400001)(4326008)(186003)(66574015)(2616005)(38100700002)(6486002)(5660300002)(450100002)(8676002)(66476007)(66556008)(66946007)(110136005)(316002)(26005)(6506007)(6512007)(53546011)(41300700001)(478600001)(8936002)(2906002)(31686004)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEx5L3NTdDd2M1BNbHdwdW0wWXJNZWJ0Rkk3SW53RmJzSTZFUU9ibUxxSWQx?=
 =?utf-8?B?Q3FJcFFlU0s5Tno0djZyTkFGOVc0b2R0QnNSZGxFTWlqczFnTEhDbjJPaUtw?=
 =?utf-8?B?OVJDWDNYRHpMbFozQjQySWxJZXpUSUtnZy94ek5WeExncU92MlRvQjVpeFJv?=
 =?utf-8?B?M2NlNHdtdGdTajQ4YW1sZXREZUliL2FlRmRsdFR6NmhTUTdsQmpZZ0wxWTEv?=
 =?utf-8?B?TWRobjFVOUxBUDVvRU4yY3hUTnBHNW5hNXUvVzR3SHA0UVBPaE12TXJSMDc3?=
 =?utf-8?B?TE01VFowUVU5Ni9uMWY4SE16cENiOTR6NWZ1d0FUNXMvUHIydXhLRmRlVEVP?=
 =?utf-8?B?VUZlSGRuVThzUCtYS0p4V2FVSnY5UmxjT00zelVqWExjYXNSc1hDR1lHQzVU?=
 =?utf-8?B?N3pPL0Zjajg1eGxzSFZaMlhvTGR3cU1xdWc0TDBrQjlwV2doWmc0U28rZXhM?=
 =?utf-8?B?S0I1dURHVnk4ajd6V0c2Y3JVRW9VYlZNTEFubUVBNWR5TkRwY3M0UC9CZ29z?=
 =?utf-8?B?RE9BRWRSeXlXOXpZcmgxalBPZHBGMTFKazVWQ3BBSHFzSGVxNW0rSENFSUxM?=
 =?utf-8?B?THlMU3FOdmt1YXNYajY4Qk4xVHNLbTkzdUZHUUJaaHd1VnVyb2ZRektSUTV4?=
 =?utf-8?B?R2ZrZGo3VlBJaVdQTXNab2VkaVNReGdpRjZ4Nmx2WDQ1a1B6N3BQMVFxSGtR?=
 =?utf-8?B?aERBa1ZhOXBvbVR6cmdmR3hnL1RDTURPNjlYbVdTWGE5RDh2MnR0T2RyMlhJ?=
 =?utf-8?B?Q3lVdW1HOE5QcEZaNTFUWEJibHd4ZTRGaU1zQ05hR0xUUTFkMWRmYkkzemlh?=
 =?utf-8?B?Wit2UHZ5VTFDVzlIMk0wTTNpNW9HRVpFTWQ4TStiTE5Bc1doUU1Ld1VOWmdX?=
 =?utf-8?B?eVFmdWVjME0vbVdiOVhQTUp6bjExMnVmaE5QTzNKaWlJR2lNTTRXb2RRa0Rs?=
 =?utf-8?B?a0UxeXRsQjVXY2ZXdUh6Zk1CSGNQU3hZRjMrVTJFUzRLM0hoaVptVXpUbmxq?=
 =?utf-8?B?OFdIQ3ByWlU2NGJ5bEROT0hKQ3UzcnBQRUFXeVdlRERldENXL21oUlFSa2d0?=
 =?utf-8?B?QlBvV1o4K0tvcS9WWHIxWm03bTl1VkpBNitjQ2tJR0JyVG5RUVdrRWpjbDhJ?=
 =?utf-8?B?SjR0MUI1Q1JFY3dkNy9LYit1TGN2V2E5L0xZeHdQd2hmSEZpWFhORS9ISnJI?=
 =?utf-8?B?aWg0THJiblFaakx3RnVsaXJFZ2UvVEFIcmRxOVl5b2FIYnprUS9hN3V5UFAv?=
 =?utf-8?B?Z0lqSlNpcXpSQloyb3pydmVkMzV3QVpKMitIOHhSWVFUVzg1ZWxNTXpSSkVI?=
 =?utf-8?B?V2s4SEhpV2x2ODlPQjRDdkVwbmRCWGM4aS9wbmhyQjVVVytCZDlOSm1BMHh6?=
 =?utf-8?B?L2JLb09MMHorNzc1MlR1bHhtVDFJaEtjUStrMVNxUUYyU2pXbXJ6UlF1V1ZE?=
 =?utf-8?B?N2hKM010ditLWEdkT1BGQ1VZMlpXc1YyYXdKSzcvdG00Um5WYk1nUE9LVXht?=
 =?utf-8?B?TTdDWWpLSUZJKzJYd3dRQmxhK0tmQUVvYUV2K2ZhdFNFczhuOHo5MWVUZVpT?=
 =?utf-8?B?a21XVGtWbkNtYUF4VUxIZmpzMko3K0tkM1l4RDlKU0N3VTNXaFlwTURuR2Fl?=
 =?utf-8?B?Y2xtQkRHQ2hOVmJ3MGM2YXpQUFlMT0tMOEV4NzdzNTNwSWZTRXRqMEtWTXJZ?=
 =?utf-8?B?dCs2SzhScWFMMHhjK0xUZnIyRWdRTmlDazN1SCtSK0ZSTlI5aFNldjgwWWky?=
 =?utf-8?B?RTEvNkI0WVNvY0N6eHRTTzBjQ20zN1NvMk02TDVEMmIvNTA1clpCd2FwUnEv?=
 =?utf-8?B?bzVnWWx2STlUODZPNXRFSU5WQXozczZGcHM0bkFQMVR0d3dsVW1RS1ZlaUw5?=
 =?utf-8?B?TWx0ZHJML29DZDgvR0UrcEdpVjlGbWFNT2tTbHJ6UDM3S3ZnWG16QURnSW5O?=
 =?utf-8?B?RUZrYitQdm9JMHpCZWdTR3RXRzUzMWkrY1YxV0RJL1IxUmhNcXhlYk9PVldk?=
 =?utf-8?B?a0VCbVRrd1FhVG5TY1kyOW55ME15dSthaGJ2VlpYc2RhMENMK3l6NmovREdO?=
 =?utf-8?B?VURFYW1ST2xCSTVTMU1OSVRyU0lSRjdKTytLMmx2aW1qSE5hZy9yVUZheFBr?=
 =?utf-8?Q?mQWwWlOFnj4jSS991vFK0gsVl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75989842-1c47-4c50-b6b6-08da919cd11f
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 13:19:53.7507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ak/9+NN5WtLvdKrOE5xqwd3u4j13j043G6NYmnygNe0V71gZEvr2eFTID1qHZXdp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6703
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
Cc: alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian

I need use entity->sched_list to track ring (ring = container_of(sched, 
struct amdgpu_ring, sched))

during amdgpu_ctx_fini_entity.

I think change here to keep selected ring sched list in 
entity->sched_list won't change the original logic too much.

Best Regards!

James


On 2022-09-08 2:15 a.m., Christian König wrote:
> Am 07.09.22 um 22:57 schrieb James Zhu:
>> Always keep selecetd ring sched list in ctx entity.
>
> I have no idea what you are doing here, but this certainly doesn't 
> make sense.
>
> Please explain a bit more.
>
> Thanks,
> Christian.
>
>>
>> Signed-off-by: James Zhu <James.Zhu@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index f5595607995b..39dca9cb8e0d 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -71,7 +71,7 @@ int drm_sched_entity_init(struct drm_sched_entity 
>> *entity,
>>       entity->guilty = guilty;
>>       entity->num_sched_list = num_sched_list;
>>       entity->priority = priority;
>> -    entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>> +    entity->sched_list = sched_list;
>>       entity->last_scheduled = NULL;
>>         if(num_sched_list)
>> @@ -453,7 +453,7 @@ void drm_sched_entity_select_rq(struct 
>> drm_sched_entity *entity)
>>       struct drm_sched_rq *rq;
>>         /* single possible engine and already selected */
>> -    if (!entity->sched_list)
>> +    if (entity->num_sched_list <= 1)
>>           return;
>>         /* queue non-empty, stay on the same engine */
>> @@ -482,9 +482,6 @@ void drm_sched_entity_select_rq(struct 
>> drm_sched_entity *entity)
>>           entity->rq = rq;
>>       }
>>       spin_unlock(&entity->rq_lock);
>> -
>> -    if (entity->num_sched_list == 1)
>> -        entity->sched_list = NULL;
>>   }
>>     /**
>
