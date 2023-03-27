Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C776CB091
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 23:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B938810E3EC;
	Mon, 27 Mar 2023 21:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BA110E3EC;
 Mon, 27 Mar 2023 21:20:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDwzQLSefieSMAgVKSDif+VpjOwJGGKmIvQy536SlquK0AmyqjpJlT8/zPqldl/g4/Iof30zwY6bJUIC408OK/lPz7d1oW0kKlfDMnZNojgMVoF014hZQnA69pXGiOvI5Mra6nHrsztG8c7mmBHzhxtqKvehvd3JP3Riut3lmQr3f+ncVK85XA675G9KEGZfibNCYT2H41GrygzqWbQ7xQE52veeqWusSHvo9HmtnFm+Hrn8qoLCzvTPNyqiJMEjOPXGeETlKbISMbJdv2lKkXB872X6pONqTJK4dORLqn+EUiLZh4Zxln3WeNJzilkBjLAb1tV5dBXnhRJf7eUahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzNC55IqPCEkjZeTavzyl4V1NMFbDgF1Z6aiFZ0XyDE=;
 b=ieBUvI9T69PPboaLiSxIb6AukoDURPHXYkN91/7zaSt0rf2p9mqpNj22EzDl6QhtmezlhQIaAQGthqZZTXnQIgLRzcWyW35FdrdQCwuFo3TV5lgW+WBVOtjyTghAHWp5EeTfI0xco2E01FcMqOz/Ywp2BLgHpuptuDySz2NByDytDB1dkJXkaiLNszqyffohXV/51XDqxHSUklJbS/pTjlxg4tJmWpXCuLgFhoqhA1qYpvAkfdgan9QdCU5bOO2CiwqA7QlO/Eq7nimiA7+0Q1QHuVIWoq0uTs2c2zQRg6smCL9oOqpR7tCl9c1zDUcN/ddRmDrSrhB1XbrajxyMWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzNC55IqPCEkjZeTavzyl4V1NMFbDgF1Z6aiFZ0XyDE=;
 b=lQRxBhiXrgnWzMVf/tMxARIODK/Ld6OGtHK+/i7pcOSqR+/DAUvgOdjvADmLID0ptIJdEvS7pI5ELelxkljeGE/WeLlDykUY6ojTvKmhjChXxdF33f5s2hY8rYQKV4BHerXVT5+faUrgNNrorYL/M751lEK/dKoeaBkyaCwfRy4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5275.namprd12.prod.outlook.com (2603:10b6:408:100::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 21:20:50 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6222.031; Mon, 27 Mar 2023
 21:20:50 +0000
Message-ID: <01e7c6a8-e6b6-7d28-1d54-4e065e7e150f@amd.com>
Date: Mon, 27 Mar 2023 17:20:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 08/34] drm/amdkfd: fix kfd_suspend_all_processes for
 gfx941 debugging
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230327184339.125016-1-jonathan.kim@amd.com>
 <20230327184339.125016-8-jonathan.kim@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230327184339.125016-8-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0314.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::27) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|BN9PR12MB5275:EE_
X-MS-Office365-Filtering-Correlation-Id: 1af87a08-3e16-4189-0c5d-08db2f0923c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ppr4Vj1UZXdh3UESoin3CnDlEK6luhgT+gB0NW3yJL2YMVq7ye31ciar3Iwu20E4TkxXolOd0s+AGBKZn0omNribb683sBLP+ohfaMGcO4MwgEy53SKFBnS2S8NerDo9OI+4ybm2YiupqGaonQIIyZOXTNASWs/dQQK6RY2jWIZlXAHCUJ94mOCjRuOSoiOom6vaRl7eDPCb1Gv/HW25ZAXy9eF5hmRcuhwKk0tV2wdwsIoL+ITtrmVArTbLYatv7Tk8tjPeovIySO+kJjLPQq5js+uu+I9alSWRq3cw73x4Wr95BDvfCSIg2nDjxmSUtjUXd1bjQFsv6q/9A/ZRE2Kp40z7fNelxaRPxvt1kFZqjKKzgS/yyi2eKjV6I8clIC2rbA1+Ku5jG0DPBl/niGcFOmkZZ7hicS1E8K7bvMQO6437yMFfVsA0aw7U0U8l/DHTSGudbRwdjU5aChgM21w8Oc9/z17isxN4AUaaD16GUa44vk88otgAZGSffW5WGRkmG6KHiltxI6tS1GksMOYxYk9umNPZnIH/JDWSNa0fo9Q80nmDxm3yv6jlYxjoqgGI/aMkhJwV+uAaC2uGfYEBb3abT2qdQvMliZjaDAAnYyidBH4KutjkiU2012VOZm39GpWN2T0E8MJH+f8kmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(451199021)(6506007)(26005)(53546011)(6512007)(41300700001)(186003)(6486002)(36916002)(83380400001)(2616005)(31686004)(478600001)(316002)(66476007)(450100002)(38100700002)(44832011)(2906002)(66556008)(66946007)(8676002)(36756003)(31696002)(86362001)(5660300002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVFNaVcxSVlTcUFJa3BGM3N0WktSNUVhRktmL2kyaFZ0Z3VYcEJYOFowNU9t?=
 =?utf-8?B?a205M2xqdXN0ZENJNWJzak5ickxZVVB0VEhpOVM1VWtkamRJM2czeFdHbE0y?=
 =?utf-8?B?dHBDY1pRdmhSL0pIV3NNRFJRbVFJRkErOXh2M09CK1ZYVEZFMDRmOFNQZXNu?=
 =?utf-8?B?ZWRwdnJYRk1GTUpFWkozRjlEUTRFOW42NUgvQzV3T3JwYmUyTk93RENQQnpT?=
 =?utf-8?B?Tko1LzUrS2VKendIb3pBMWFxZ0dmdVJBdEJzR1JqQi9QcnFhcWFDTWpqVGl1?=
 =?utf-8?B?RGc2a3FIRUxmVDFGNG1yUDk4L21RZGxCOStROEhIMk1ZeGdUaHZKQ3dGMUlX?=
 =?utf-8?B?em56YnNpMEF4SXk2MkY5L3pWVUJvQXRyZVpqRGFrVFVsZExIWlFvbTh4MTVv?=
 =?utf-8?B?V0laemxKV1g3TnV0bTZaYU9aYzYwU1ZjcHhOTWptaFRaMXVsdUtrVWFMWUxj?=
 =?utf-8?B?MCtEbTFTTXhqK2FJQlUzdG9VYTVRQjExdkNhV1FGcjRWblBaaEk4ZHJ5bXB1?=
 =?utf-8?B?NTZxVERvakIra1FTcXlheDdGNUFsdTRISUJrUTRKQm9KV0VKVzFUanhjRzli?=
 =?utf-8?B?MS9XbUZrb0FBYmF1VXROT2tPMkVseDIyYStLMWh6dE91dW5iZ0I2REpsY0Zm?=
 =?utf-8?B?djFYQ0czeE5nci9haUFGYnloSkkyMlNrNE1jbDdDMVdDa0QxYzMrSHpWVm9q?=
 =?utf-8?B?UkJ2MEFWMnN5cHlHOHBOdHVkSGUwRjR0OTBxcjk4djhXWHR4RWdyTVBpUmVa?=
 =?utf-8?B?TGtSUVBDRXY4MnhRRFZ0T2Z1ZkpqeDNnMUoyTXdqRWxtZEQ2QXg4MUIvSVdL?=
 =?utf-8?B?OFR4WHhvU2V3dFliUWRNbkZzT254UHhtcGZIOUw2eWhHYmlFMGdQK0djdmMx?=
 =?utf-8?B?VkJCTUtteUl2VEtqajNRTEFsVkhzdmZBMktmTnc4OGxFMC9NckdnRi9ZcFU4?=
 =?utf-8?B?TkdUd0dKS1VYa0t1MEloZGZFZllPNEtTZWJKc205aDN2ZHN0cVc4NVpObUVz?=
 =?utf-8?B?SFd1UXB3d3VtUG55MGxHYUM5UTZwSlA1dWdsUk5RRjZUZlBVSlhwT2d4MlRy?=
 =?utf-8?B?UHZ0NDVZVHNOSjRudnVVSmhzazVFWWg5aVE3RkNuT3RFL3REaVlucW9kd0JS?=
 =?utf-8?B?bjdWcHZ2eDJ0VWtyWjJWUnh4enlueENpeE1DVmpCM0t1S0xnK0R1RWhSSTZk?=
 =?utf-8?B?ZDNNNGI2M3lmNTBJdExwTUZBaFpVeFpjOHdmV0lRRWRvNTlRYk5kNWc2R1hT?=
 =?utf-8?B?YVJ6TFlud1EzQ25qMEtTak1NTFR4amVkZjFyMEVjSGNDalA2UHo5dXE4TFVt?=
 =?utf-8?B?WTJVblFqbTRDeDgrdCthOCtIV25MYUF0bWIwVTNWamZmeE0ydmRCNVVHTFlE?=
 =?utf-8?B?NnJFVENwanBoZEtGbVhVQnp1RnR4VGdYaStrZE9ZK3BSZ1ZBRkxOenlVTk5O?=
 =?utf-8?B?OEtER1l6TFIvb0l2d1VnRlpwRzEvTjQvaGtjTFExVGl2QkpUZXo4N2dlckpY?=
 =?utf-8?B?OGhPOWJGRGQvVEpqZUZHLzZHZlhSRS9NYUw0TXIxdUdJb1VKcGt3OTU2c0kr?=
 =?utf-8?B?NjhoRkh2Q3cyc1U3UWFjOERFVEg0N2paaXRBTGljQkd1R3hQamsybGJxNFQ5?=
 =?utf-8?B?VGNDNzErQW5oTXMzR0luT3pwNkpOT2RpOVBpRCtTNmMvWmc2UnFOOWhTdGxJ?=
 =?utf-8?B?N3dremx3OERpbGRBTEtXbVI0cVU2aVJXdlF6T05jYm5KVldibFRnLzFlb05H?=
 =?utf-8?B?dlhza3JPd285SDVEei9yMUh6UCtZK3R1aWdmNjBaVTZqSXpsbW9RMWVXbmxC?=
 =?utf-8?B?VFdmdk5PZGFMTFNzVE5XQnNCVzUyc2FMYkJNM1p0aUVwcERvR1B1RXplZlY2?=
 =?utf-8?B?Z3VzVmt1Yk8xUHVBckE2aTV6RHJmS1Z6RUlwL1NqbHNFR1l3VEhyVVRGQWhW?=
 =?utf-8?B?TjRsQW9jOFhNQUxGZ09lMmJsRWRlWjdma1hZMVgyRWpEVGJXVjBFUFErcGFL?=
 =?utf-8?B?R2JhamZsU0hFdGd6Y1E3SWY3V0hmby9jdDBqb1E5SWxXV0FpVlhMT215czly?=
 =?utf-8?B?RFMyclJmdzdOTnEya0QyOEROcWNCMDZIeEY0cXZRT1pyQmV3a011K1d1a0FT?=
 =?utf-8?Q?wGcrGfPhJ1JitBSsCmAXR2e6V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1af87a08-3e16-4189-0c5d-08db2f0923c2
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 21:20:50.6009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2VlzylcfYjNLD6ePIVABT18lEqAguy4K5kKMnyEqyX4UhwcW6P4TXSUqbpX1k0wI2s4NA1OUtq9dbxGm+ypeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5275
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

On 2023-03-27 14:43, Jonathan Kim wrote:
> The debugger for GFX9.4.1 uses kfd_suspend_all_processes to pause the
> compute pipe line so it can safely toggle the SQ's implicit wait on
> barrier setting during debug attach/detach to work around the wave
> exception s_barrier race condition.
>
> For mGPU setups, repeated calls to cancel all outstanding restore work can
> result in an assymetric permanent cancelling of the restored work from the
> debug device after it has toggled the HW work around settings.

This is a bit hard to follow. Not sure what you mean by asymmetric.

I think this is a general bug in how kfd_suspend_all_processes and 
kfd_resume_all_processes interact. The latter schedules restore work. If 
that gets cancelled before it gets a chance to run, it will result in 
the queues staying preempted forever. It just happened that the barrier 
waitcount setting workaround on GFXv9.4.1 was good at triggering the bug.

I would simplify the description like this:

> Flush delayed restore work in kfd_suspend_all_queues instead of 
> cancelling. Cancelling the work before it runs results in the queues 
> becoming permanently disabled. Flushing the work ensures that the 
> queue suspend/resume state stays balanced.
With the updated description, the patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> Instead of cancelling the outstanding restore work, just flush it as it
> will be properly evicted anyways by the current suspend call.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index 1e3795e7e18d..55a4ddd35e12 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -2008,7 +2008,7 @@ void kfd_suspend_all_processes(void)
>   	WARN(debug_evictions, "Evicting all processes");
>   	hash_for_each_rcu(kfd_processes_table, temp, p, kfd_processes) {
>   		cancel_delayed_work_sync(&p->eviction_work);
> -		cancel_delayed_work_sync(&p->restore_work);
> +		flush_delayed_work(&p->restore_work);
>   
>   		if (kfd_process_evict_queues(p, KFD_QUEUE_EVICTION_TRIGGER_SUSPEND))
>   			pr_err("Failed to suspend process 0x%x\n", p->pasid);
