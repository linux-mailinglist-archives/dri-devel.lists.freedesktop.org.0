Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 594515BAE4E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 15:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA08110ED34;
	Fri, 16 Sep 2022 13:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1426510ED49;
 Fri, 16 Sep 2022 13:37:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=infu4ky4FJZRmaud3PtBuEnSzy/gF2VfEifPBxqm0dcIdqY0c5uuuA6M1bLthmD6/Z6K7ZvsBzP1yXXqv2i9lJ3UbvUo/t5rsKou6SLnjtHsQCoBj5cELGs7AakmAz3+W88AU+LWURjCIvwM/z6m3J9TOT4o2ohCCU5vebuPip+HXuzGUrqlnv6SgWNF8CeI3egJEE9WtXnmALWSwYcDgecpTPAVbnONcBZ9UB9tfeRmxYiqODbpENfxqxK1NH53DLI1HJFBEi/19moLCYd0HoXY+itZvnxDajag5ZXpKXHXZxwet6VSR/XtmBvZFp34lqXjuXyTkwWsUwyRYlRxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMPMJmTdU0IfuiNlk8SWEaEJcEljVF1wQ+6Yq2TjY4U=;
 b=LyJoG314IAUzr7YuWkmz4Icvror1NWZscPkX6al8qlvbARyfaq101eILZPy9GQiESTgnOcgT7F49B4KONuawS8sWDFLZ/wddCjSqyfOQcuLeD/AxrspSDUAr78yH+TjIelEZylaEmlg3PQpOUjqnpnti5XDR+9kw74qyxztvtxV5BovVasRqaodLOklPgmsybUvbpjgKKKkFPSa1HhfyiwrQCjUqpkrCAhzxqVl+cSlZgk9xMQQYpDpDZ9JxN+kLnKB++jeCQjJs5yfM74PBAEyy4PTM/GXzEefeDQaQX0LvWBVWjga3kfXd45tVGve6mV17E6AC2C6aF8nAGIgRsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMPMJmTdU0IfuiNlk8SWEaEJcEljVF1wQ+6Yq2TjY4U=;
 b=nkRBOAOdKBcaR8BKkPcRVnKBswknM2ye/rVpR0i3qZar2t4r3QL8+HOeCfHsEUbvK/Kn1ZyGCQRPa5QevUgxCyfa9bCBZ0a20nQ+pLW7TZcnM1fOYf7b5x5Nl2hCV6rUKZUy3kqPdvYII2vk1/KffmYFlraVYaOTW4TxrP5yJVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1943.namprd12.prod.outlook.com (2603:10b6:903:11b::7)
 by MN0PR12MB6272.namprd12.prod.outlook.com (2603:10b6:208:3c0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Fri, 16 Sep
 2022 13:37:22 +0000
Received: from CY4PR12MB1943.namprd12.prod.outlook.com
 ([fe80::a527:1309:e629:789e]) by CY4PR12MB1943.namprd12.prod.outlook.com
 ([fe80::a527:1309:e629:789e%6]) with mapi id 15.20.5612.022; Fri, 16 Sep 2022
 13:37:19 +0000
Message-ID: <325fb803-d65a-92e4-731b-2f627976d640@amd.com>
Date: Fri, 16 Sep 2022 09:37:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] drm/scheduler: track GPU active time per entity
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220908181013.3214205-1-l.stach@pengutronix.de>
 <69924bc6-d249-35b2-a942-a43a9293558e@amd.com>
 <e862234a3aef84bbf7fbe6258b634f81fb691972.camel@pengutronix.de>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <e862234a3aef84bbf7fbe6258b634f81fb691972.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::34) To CY4PR12MB1943.namprd12.prod.outlook.com
 (2603:10b6:903:11b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PR12MB1943:EE_|MN0PR12MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ca8fed3-0ad7-4e0d-2356-08da97e89374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IgiKY8G2unqGMXfQjwCcU6pwTFMLDaHiZsydGf7wTcqgF1kt7Q89md+rMHciRms6m+wxJl+sCiS6EWE0PkXJY9wWEbMeaQnGrlduYo4pYiq24OX6OPHKzO0yjh2K625pjGp1W8FaFEIR8FfKcGC7Gqa4lrJHEcFZZMnlS1P3+S6XBJ7UyUSdeK2oXtlSeVPca7CDuumhecBobwnsI1VRzsWI1AoJF8NVKwWPEYxNpvZ7Tm+IYZUilQKDhaRmPtSSesaPszsUIVcsjzMJwuCKMidFBj8rf9YkH7KPoTHP5XOn4tSsGJ4fVVQs3xUiNLvz1ho/q9pABLlvgMUl3At7zLVyrkBa7CCEkPXdSQZwGi1Jefb+i4QXrDd5a8ISdTVZHmW5MCeRrHUiOvtBW9MTk3BFpF2qyFqPPH67m82fFdRtCNKtVZgmU8C9XZGnlO06tcUmXMP399s04zFtSALT+b+j88XZ5edwxZ47VH9prTO/ylJcjk8dIgx5BNWQX/OGhNjlxeNqbZQeRyr7RL8xmTolDLdSgdbVS5rYJt0LmB2IGSh7D+WcsoRzLT4SLxmfdMFIVGcI1dmLs0ptUj+shmJyELMA2k3wfcQ9A+Btp7BKFXWmV3DDRH//c4NqeMIWhn3mnpWQtWPmncXRzUGhgcXt2UpPZA6dHmTHzHeTVcdNwZNv+BuHq7uKK1L7pIMtcIGHWOmqUMskyRHxKzK9eJMbIJ4jAD+SaRX8/yia4e4PWvhdlZsdNlBFTgIN0EO8HNxloJa6CO4AbLQIi9OZyJvwDSEkHtPTLOsHqAjo214=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199015)(54906003)(6666004)(66556008)(44832011)(38100700002)(66476007)(478600001)(186003)(31686004)(8676002)(5660300002)(6486002)(36756003)(4326008)(83380400001)(2906002)(8936002)(41300700001)(6506007)(2616005)(53546011)(86362001)(6512007)(316002)(66946007)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFRyd0NNWldJVk10eWltczJaQ2svQ01hTkkzZUZOaEhSVzFiWmZ2RXJHNzFE?=
 =?utf-8?B?NFdXR01NNXVRVVVDVkt6aWRWdGtoZStVaG5sZE5Fd2VnT0UzZW9sYVRQRHdi?=
 =?utf-8?B?NGpwVjNUbkl6MGRVTjBweTd6cGE2ZVBCa1NLdHBTaUtQMnhOb3NTOUdhRGFy?=
 =?utf-8?B?dEJqWWFVZHpGSytWQy9EZzlYQng0SE9FTzlPQ2pwYW1MUVJaSnRvaVNYS05S?=
 =?utf-8?B?RFM1T0xGRXhUWU1YdTZuZHVmRmFNeFUwbHBYU3Iwd0FsZytTYmFCUEVxbnZV?=
 =?utf-8?B?cXNVN0RTTkVUU3A3dEgyaGltMGdrd0NXYzhmSUlkYmszSHdBMUZQU1JmbVR0?=
 =?utf-8?B?M0x3bVhaUU1rb1JpOENJd25GK3hrY2NlZkNuUjV5TENBaE4rS2JMWkhYUEhj?=
 =?utf-8?B?RFpDbmNmODl1c2taZUIwVEJPdk5id2szdlkzdXVHdGthOWNaQ3ora1Jnck1a?=
 =?utf-8?B?RHpLT0dyOGpFS0RxclBDeWF3cnJMcUdTNTFTeGUwb0M3MDdaZjFWS0NFQnBj?=
 =?utf-8?B?bW1tOUhORW5SWkVhTGs1SlRXYUNPSXU1bTdyOWF1bUtoNDlqQWdqM21YUDg4?=
 =?utf-8?B?alpIbnRDNlZXR0dpY2M5dTJ4TnhyazZzVGlFNHdROG5Td1ZpNDJEYm13Ni8y?=
 =?utf-8?B?UkdqZUNBL01YZE1XczkrK2xTbFd1OHlab0ZoZmVLb1cyOXJWamJkejBIbFIw?=
 =?utf-8?B?YVNia0pidnl2dkpZZWNLaitpRVA1dG1tSnM0QWJKOExCM2tUSWoxWVNhanRt?=
 =?utf-8?B?cEQ2bjFHN1JnSldJd0J1MUZDVWkrMnZiaUtmS2l5RXBnQzR6Z2FuazFQN3NU?=
 =?utf-8?B?NmJqODkvZ0dwSlVYbzR6YUUyRjlEQ2JNMFJEeFIxMVlURUhBRmE4dGVUaUpP?=
 =?utf-8?B?OHBMYWpqQkhVOEdDTThjQ280cFRnWFlFcFYwVXlwR3JodWd0OVVGVE9EUmh5?=
 =?utf-8?B?UldNQ1o5c1V4aXRVaGJiSjJ0QlJPZGlkQW9TcmVaWkF1UFZod1pVUlExWWk4?=
 =?utf-8?B?bXBEdWJJRlpkRGtHQXdaaThLVyttVGsxQTliTDc5TkJoNFVZSHVwT1Z2NVVa?=
 =?utf-8?B?alJJK2JzY045bE1sMHBMbks2RWluSjU2NDZyOHRSeWZKZkxhS0xRcGVvM0hM?=
 =?utf-8?B?Titxdmp6TDY1L25lTkhTUWlRVis0N09GZGx0V3QrUXVZUGhSS2czYkZyTVZr?=
 =?utf-8?B?R1RMTk5iYXVSTWlxdHVMUWg1WGd5UDg5S2IwKzd6S24zZUYrUjVqNEJLaDBs?=
 =?utf-8?B?UGEra2Q1ZE5TY0o3V21SQ0duLzU4SG9kRnlxUnF2c1U3U1NsOU9LZk5JVkRI?=
 =?utf-8?B?S3pMOGorRjlETEhzYVcyTWQ2MXI1RDBPREUzaEUzdzY5VzJ3cnhJU3IzWFZw?=
 =?utf-8?B?bTZoVmVhRkZGTmpnU0VyV3FMaTlSbjRCbjNFaVJ6YlE2b0Ftd0IzdXdiL01u?=
 =?utf-8?B?ZDdiY0pDdW8zWjQrNFYvei9qMTFxa2dmSGMyN1ZzYUFRWDdJM3d6UWVPZnA3?=
 =?utf-8?B?aGw0ZnBzbVpaRWJtbW90cEZjUDZ5a3Y4MlFTL25seC9PcVpPUnA1U042RWtu?=
 =?utf-8?B?SmFLQmtRZ3g4MVFIdzFTb2dyeGN1ZTUybDl4dzhxSXdqS2RsN1dJbWZiamxx?=
 =?utf-8?B?V3ZreGQ0cGROR3lNeEJUcnpoZkRpaVM0TE05aERJcUhlRlJSYlEwYWoxVFFO?=
 =?utf-8?B?Zytsa3hOMGZXT09uOWNHVGZkQlJYQnlFRWJsdm9XUTBiQlc1eDI1U05objUw?=
 =?utf-8?B?QW5OeW41NVpzZFU3QzQ4Nm13eDZuYUJlRzQ1WjZONUlOQkx4eEJ5Nkl3akc2?=
 =?utf-8?B?eVNkemM0SXhTOE5sRCtKQWVLK1lwcjhmQkExY0ZwMFYwUE5Wd3QzeVF5WWpM?=
 =?utf-8?B?SXFGZzJWaHVzSGw5WGRxTWNNL0M1cStTaW1xYysvdW5RbFQyaUxUV0F3Y25l?=
 =?utf-8?B?UWdvVEJwT0RJS3R5QnBCK1JWdlVESytoa2dKczZiTWJJQlBxRm1NaVFQSGgv?=
 =?utf-8?B?dFdnWGZFZUFJSW1aSGdzVkFnT1FtazdwSlpWdzdzd0Npa2V5MkRlSnUyYmZx?=
 =?utf-8?B?VW90NkprVFQrSXYvQjRyUWpwWWVxb3FyNFVLc0Ric2tVbE41Yk9TMmkwaUd2?=
 =?utf-8?B?dStQZ3cyL05nSTU5bW9oWi9zR21yZmkrd3I1RCt6WDNlSHdoenZaa0pmMGpR?=
 =?utf-8?Q?hcp5jUObNyGjJBNheCombbe/D5GMOlO9UbhSwk9jAJOK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca8fed3-0ad7-4e0d-2356-08da97e89374
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 13:37:19.0915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6MGDSJ5l2uoHfFGpHkFfaivS7iAc/ewzhspic2Wbs6yjHy+35KvHSaddqTRO/9EPjYgwVEj6XaMNnP5p15E23Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6272
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-09-16 05:12, Lucas Stach wrote:
> Am Donnerstag, dem 08.09.2022 um 14:33 -0400 schrieb Andrey Grodzovsky:
>> On 2022-09-08 14:10, Lucas Stach wrote:
>>> Track the accumulated time that jobs from this entity were active
>>> on the GPU. This allows drivers using the scheduler to trivially
>>> implement the DRM fdinfo when the hardware doesn't provide more
>>> specific information than signalling job completion anyways.
>>>
>>> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 6 ++++++
>>>    include/drm/gpu_scheduler.h            | 7 +++++++
>>>    2 files changed, 13 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 76fd2904c7c6..24c77a6a157f 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -847,6 +847,12 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>>>    
>>>    	spin_unlock(&sched->job_list_lock);
>>>    
>>> +	if (job) {
>>> +		job->entity->elapsed_ns += ktime_to_ns(
>>> +			ktime_sub(job->s_fence->finished.timestamp,
>>> +				  job->s_fence->scheduled.timestamp));
>>> +	}
>>> +
>>>    	return job;
>>
>> Looks like you making as assumption that drm_sched_entity will always be
>> allocated using kzalloc ? Isn't it a bit dangerous assumption ?
>>
> No, drm_sched_entity_init() memsets the whole struct to 0 before
> initializing any members that need more specific init values.
>
> Regards,
> Lucas


Missed the memset, in that case Reviewed-by: Andrey Grodzovsky 
<andrey.grodzovsky@amd.com>

I assume you can push that change yourself with the rest of your patchset ?

Andrey

>
>> Andrey
>>
>>
>>>    }
>>>    
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index addb135eeea6..573bef640664 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -196,6 +196,13 @@ struct drm_sched_entity {
>>>    	 * drm_sched_entity_fini().
>>>    	 */
>>>    	struct completion		entity_idle;
>>> +	/**
>>> +	 * @elapsed_ns
>>> +	 *
>>> +	 * Records the amount of time where jobs from this entity were active
>>> +	 * on the GPU.
>>> +	 */
>>> +	uint64_t elapsed_ns;
>>>    };
>>>    
>>>    /**
>
