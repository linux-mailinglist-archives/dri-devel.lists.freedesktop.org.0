Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1618A7B3C2C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 23:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9108810E715;
	Fri, 29 Sep 2023 21:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A0010E6DE;
 Fri, 29 Sep 2023 21:53:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noCwkVvKhD6ax+2WTisOpRA++rdyFNy31dVy8Hq9Kl4x9IXfkPukM9Hksf2jbWfQZcEdOPbITLTTZOTYbQI/LvIkPek+ZX7W6Q0fixG/sWYEQMDwj7N/wsxRRL4UFEJ6ylB+CumQxbwFkxgTqJXrkC1O6ByOF6rO9/Vy6uQ5SafjfhTjpUQuOqFM5hYWBLgWT4ep821sekfX6hOIoxwnqJSB6hugMdOE47mDZnAdAZ+1wlv9EMJp9oRURcEMPjv9nVW/NdY6QmT9SaOV+zFYM4htyJYw29wMYAB1PDULH4nC8uKqPujbqCwSHD8QaeqYp31FUYzt4nlQCx5sjmW00A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzzUg6aqvnjB/DxXpBtv7EVySETPZZChojNB+rvHHn8=;
 b=i8SCwMwexRkpmSb8C+SluJb7VpQ4B+2U8nuM8duCdMkSSiN3xvKiqQB0xUf2/8fOit6tviDc/X5WwLEHfn2Hc6oYNk2HjFjW129XzwxyyzVvK8XGYJYo4GvXehHoVxSj5fnIwXraNpp97dVqK+tVq8g+1SrcHlvCiEbzsk0PTzqWzrgBzadC7DwwTaYdnfsgbAXFhOYyTjDwrElrHA1q3JkI2xihT2Yy9LHiME31KJq6K50uuaR/lU1CkCvvTMJP6E0MTbSmXdlJ4WqYIQV4QrOHiyHfR74gA8NvpXqHVXNmmNbpteoI+2qPtRKEObI/WAM/C0ITPjNCRzjFjEDopg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzzUg6aqvnjB/DxXpBtv7EVySETPZZChojNB+rvHHn8=;
 b=D7n3FLN9B7ikYVwkSdnAZcPdqkkRhFP0n3+v4sJX2fnx4ei+aKQ8Pk6fy2Rl9j08FoZ4dfbx5m8QVLMCGlumm3CZH77+9y6aUL/C9zGufX1eVmv1oZnc89+rQyBJEBSaFW4VoTZlFtgrIO3TtehaPMBmrWh9vfxCdiqLERXJJOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DM4PR12MB6061.namprd12.prod.outlook.com (2603:10b6:8:b3::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.39; Fri, 29 Sep 2023 21:53:14 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Fri, 29 Sep 2023
 21:53:14 +0000
Message-ID: <24bc965f-61fb-4b92-9afa-360ca85a53af@amd.com>
Date: Fri, 29 Sep 2023 17:53:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.0
Subject: Re: [PATCH v4 07/10] drm/sched: Start submission before TDR in
 drm_sched_start
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-8-matthew.brost@intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <20230919050155.2647172-8-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0195.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::14) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DM4PR12MB6061:EE_
X-MS-Office365-Filtering-Correlation-Id: a215c43c-0610-40e7-8ae5-08dbc1367b3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qGCmgi/ovLlLgupVHITx+DRYWhzLne1Kk2r9vPbKAWORDa9CeAk0fXpdLWCQBc3udP0UQ2gx5yI3KtkX+9SiJhTP4dyh7YnH8Viqj4c8IHyDvuXBvbejUKVggFjt308tgbcKXggVUSKCes7y6nqEg+4A2w+srgnFn18OEdw4BYKQkGPl25m6M1g9pOlDx32CmU+Z2UKPuGqgBDWaDaGpAAh2qNVWo++18L2MpK5HpI6Bk+ZBs/EdU/yNBcEmqo1PXe1ULjh/OYpxABlrmHl2jPqSIHUB4fKwvAmBc4D3/BarUr8ieQzHWuJxZR4TMBGKOLneuZktSprNnMPSqEGuNHk4hxzhnAhkLPWjYmbkeerfxR0UlB6qEiBe0LlUzpEjB/SFtDGELBgilyP7Qcxu+BxHoW9HL0V1e2mgU8OwgwF/LxomndbeW0rBsRJjm4gQwOLIiSFQ5VHM2hoLaJFIX29TllM5RENFo1vihZ64rOQ6o3aP2qvt2D9haEowKV7/Han3gTEIJTyn99QNQzdGcY6734wZI5xoi4q4qgzfr4AZxUzGD/57y3B7iqiIP2Z4L8H29xyxT2vPmMF4o2+0Nao3Ze/xXaocYvORnSPDHZDBkQ/DjIS0+FFHaEqxia2l5hzAWGaMzEhNtXajCX+mtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(136003)(39860400002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(478600001)(83380400001)(6666004)(31686004)(26005)(38100700002)(53546011)(6512007)(6506007)(6486002)(86362001)(66556008)(2906002)(4326008)(8936002)(8676002)(5660300002)(7416002)(66946007)(36756003)(31696002)(316002)(66476007)(41300700001)(44832011)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2h3ZCtkVlBYTTdjMkVlT0ZQaDM4RnRGZFhUOTF6SmRoNzJGa3hVZjBQYy9S?=
 =?utf-8?B?cERLRVFnQzZMN25NUFFvRWFjOUFUdDhFd2lZd3JqVS9PMTM0RE4vVUw5VEl2?=
 =?utf-8?B?TXd2MTlEQUVSL0kzWnV5clk0akxvKzJ1NjhwTUx4V0psQjhNSHhneTBzYmhw?=
 =?utf-8?B?b3B0bldXR1BySXhwN1FWd0U5ZEJWaGdIV3kyR0hIREFqazY2Y1ZTdVFzZmFY?=
 =?utf-8?B?VEZvaXlwUU10ZWxqbzAyaGZESUtOK0JhaUpkV29wZmVGM09yay8yNWF6WEpi?=
 =?utf-8?B?dGExMXRUSEpuTTA2VWU1ZXhPUXg4a3RTaW9HQk4vS2FmY25qdXEwM2cxYy9s?=
 =?utf-8?B?U1BvTTNCUit2WVlma251dXVJUHM3ZmFjS2ZvUUhwOXBEUzRUNlpLVVZ0ck5U?=
 =?utf-8?B?MlI0M0VzMERYTEU1ZnZ6KzNiUWJGTGx5Q2FJc3NBTGMwSkhNK21mWG9qKzAx?=
 =?utf-8?B?MjFEaXNrRC9nNzVvRWwvTE1lTmpCZkxVaE41eEFIRUxpRSszaW85SCt0MjND?=
 =?utf-8?B?d3hiVkJ2eGFvZVlHbzVMUGR4cEtDTStJMU94RGtkTXo2bHBOZmtqcWdVV0RR?=
 =?utf-8?B?NzdpTlh0V2ZGanVWRUpWY3F2aVAxK2JValRpeTZ5L2dwOHlzaXRKcUhtMm9r?=
 =?utf-8?B?Q2Z1cHdrZ2JpaFkwcHN5aUFEWjUxaVpWZW5XZEtXRS9zRU9MMEo4QkI3MDJp?=
 =?utf-8?B?UXRMbFdmZTBHc0JXeEJ3UEl2SU92SDZ6eThidTNUUWU5NTR2V0Nlay9VdzM5?=
 =?utf-8?B?N0ZCRUNxczRUOXlPUGNBM1dqdWR3UlFvS3kwbEpDaHRCKzJtTGttWnA5YWJ1?=
 =?utf-8?B?VkwyVm52d2IzcVQ4OTlMYjVMeDJHQnZlUzZYVU5TRTBzL0RURjBjZXA4Vkhy?=
 =?utf-8?B?ZHg0NkF4MUkrQ0RQWWxwNkpjUWl0ZWJjWFd4WDJqUkhKeFR2YVBzTzQ4OTB4?=
 =?utf-8?B?dnVXN1g1RDNuQ2FUUC83SXdKN3J2RnJBeFd0U0RDRDZwVVBMTXd5ZE1McGJE?=
 =?utf-8?B?djRoQm9aN1RpK3dIT2laWWtKb2ZtYVpLTFc0MnRKRXIzN0hkZnU3b0F4L0dw?=
 =?utf-8?B?V2grenlBQTc4ekV2RzQxTjdCTzdZa2wzV0Z5ZWtZWDd5Rm5vRXVseGFUQ3Rx?=
 =?utf-8?B?SGlnbmNBRzZqOVlhdUpTK2xEL0dBUUY5SmN3dXlFSVhTemxmNHlWWEZmdHBQ?=
 =?utf-8?B?Nm5BaVZJNTRmRnpoc2FHY3MweXNkSERleUlmWXh0MXJOS3lWVlZzWXVWeVBZ?=
 =?utf-8?B?UERvb2NwbHJ6MDZ2WmY1TnZEU3JIN21pKzdEbXRZUEJ6L0NDMmlyR1RSTGhj?=
 =?utf-8?B?Sm5PZEUrbE5rdm81cVA2STBzTmpZMUVKWWF6K0c0enpkWk9hMXJTZ1dUaHNr?=
 =?utf-8?B?SmRxSG5RdXJ3L0ZlN2I1YldjelJwTUZTaHpZR0ZBZ3A5dGZDaTBnVjMvMmVu?=
 =?utf-8?B?VGVsS3haVXpOWTMraHNpU3NhRnM3T3hBSEg5Tm8wcXUzazBjU3QyWkNoYW90?=
 =?utf-8?B?cmVIdTBEQVd0QktxeUQ3Q2VHSWZKZUVVZWxhQWRVcGlwTWxFQ0Ywd3JTWEow?=
 =?utf-8?B?L3hIck8ySENSQ29CZStjajFkNzRHcjAxMnNGZFYwZlplcUROSnZzZDRDbG1C?=
 =?utf-8?B?SEFkWmZTRmg1ckNpd0Nnc3hZeHBwMFpwUlpjY3hna01kb2xLSEI3OGVRWUMv?=
 =?utf-8?B?eE9MV05wTHhtU2dEOXVzL2tCdThXVVVCZ3hBeUZndkFZSTZpdjhaQ2lFY00r?=
 =?utf-8?B?bjRLV1Q5VlYwekxNRWcwTEdTZ2U2aW45Q2RYUU1OVlRjMmxGNDZreTBqZEFu?=
 =?utf-8?B?bm56dWExZzEyWFhyTmwzUm56Q2owZ2dMaGVLYmxkVWpJZ1JMZlB4S2V6Vzdy?=
 =?utf-8?B?RWNIbXBsa2w4UlIrVVZSaHYrbTg2Z3NnNjR5ekJkc3F5TWpFKzFGSld0ZE5M?=
 =?utf-8?B?RUFKUEgvOHlDZVJQNHhoSGRRRFM0eDZSeEhyaGZIZUx1S0dwOGNUWkV4dktF?=
 =?utf-8?B?T05iUkpoOWRqSUVOUDRhZEo3R283eDJRY3RMdW9CRTFyNXJLZWRMaTY2OVFa?=
 =?utf-8?B?a3ZBSzhnb1ZhYnZESGxyT2tjS29UYS9CaXB6RFFDbkZQQVRzOTBRZVFjc2ZS?=
 =?utf-8?Q?ghvz6vXNRifvfRP8vYtE8YR13?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a215c43c-0610-40e7-8ae5-08dbc1367b3c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 21:53:14.4609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9sb6fOobjW0tXIm9yCfkCXg/oVaZPkdvL+/8iAzjhNsAd5r1r+If4YlbBd8GN52
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6061
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, lina@asahilina.net, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023-09-19 01:01, Matthew Brost wrote:
> If the TDR is set to a very small value it can fire before the
> submission is started in the function drm_sched_start. The submission is
> expected to running when the TDR fires, fix this ordering so this
> expectation is always met.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 09ef07b9e9d5..a5cc9b6c2faa 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -684,10 +684,10 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>  			drm_sched_job_done(s_job, -ECANCELED);
>  	}
>  
> +	drm_sched_submit_start(sched);
> +
>  	if (full_recovery)
>  		drm_sched_start_timeout_unlocked(sched);
> -
> -	drm_sched_submit_start(sched);
>  }
>  EXPORT_SYMBOL(drm_sched_start);

No.

A timeout timer should be started before we submit anything down to the hardware.
See Message-ID: <ed3aca10-8a9f-4698-92f4-21558fa6cfe3@amd.com>,
and Message-ID: <8e5eab14-9e55-42c9-b6ea-02fcc591266d@amd.com>.

You shouldn't start TDR at an arbitrarily late time after job
submission to the hardware. To close this, the timer is started
before jobs are submitted to the hardware.

One possibility is to increase the timeout timer value.
-- 
Regards,
Luben

