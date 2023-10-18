Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B03F7CE284
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 18:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBBF10E17D;
	Wed, 18 Oct 2023 16:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2056.outbound.protection.outlook.com [40.107.101.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD35710E16B;
 Wed, 18 Oct 2023 16:18:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bb4rI+NraWYTGr2NwHj6tZnWaYFReKKbw6/Wgc9uTuJzDnYbvAj7WuPV4h6qzzwCn8yk3L414gGWogL4DY2/bjKyTRwW9sHfzyp1OYtBZkMfuUylR7cqrFOuO8WBdhb9cuOtx5m0YYxEnYFqxQQqRnzAyMyMaprg8Ru4ZtHhwHmAhB1EgDjvMcsV970TjyRczaUcPLS7ava34vm6py1wam4FbT3JL0GAsk3+2LO3zibtafL0CSLr8erXtPwJK7KVuwUrdNXIcR8S2q7YmMaF8I284ePYm5vVArSW3U3Xw2Ux8OUioNi+FZuKph8cM0B0gLTmr3V4HCocSxaOAhws6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgKju4oWPuyjSw5/nAWfJ4oAPaGCYmuWJQRyUWW0KLo=;
 b=COQ2luzcWarMyBQWUtODQgaF+/ZL66n1NSJ5N7eSwpkdbKUwefLDT4d1PH07v2igrEkbUhF2aKhxjKESHEYRQHYmCpTB6IVo3L0E/+zCeMkalnB3F+2VhAYgWeKBNbfz5x4Jt6hLKXnU35TlrkZzUM89jS7eVYqf8Esq+RIMJMLvU1a87OdQiIMABuIyUNcASrGeM+1CXOqhGZGdPKqa8k3Kii57OUfU7kgsnLHgR1cJnHQRM33VrZ6/ZnbeDUT9LTIkTsCWe0Y3axSsgN1XjPQiAphfwGSqVDuRwuAWflgDEowJ8OUmNYN3OosuyEHHGhX1Tjtbu+acybNKOTaiPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgKju4oWPuyjSw5/nAWfJ4oAPaGCYmuWJQRyUWW0KLo=;
 b=tiSLKoGpWehfsRBv4KAck512nufbMto4zytbPd+Dz6spo4wDj/bbKbaNqL5Ywo2yH747wjZlde6qS8I/hCtZM4SNvi2eMuEVHslZRfJs/964QMRiPWSAJTnrs3FvNGO31Lzq5rG7v2wwKnoQ656yrOpZ7ybqmcPuHXkoGS59dIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 LV8PR12MB9450.namprd12.prod.outlook.com (2603:10b6:408:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Wed, 18 Oct
 2023 16:18:18 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 16:18:17 +0000
Message-ID: <d1584721-3097-4cfd-a0d8-f82b13599b07@amd.com>
Date: Wed, 18 Oct 2023 12:18:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH v6 7/7] drm/sched: Add a helper to queue TDR immediately
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20231017150958.838613-1-matthew.brost@intel.com>
 <20231017150958.838613-8-matthew.brost@intel.com>
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
In-Reply-To: <20231017150958.838613-8-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0161.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::34) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|LV8PR12MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e5e672c-4a95-4a4a-ec57-08dbcff5d67b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AetVxx00G9WIsRQKcC0wP+B4gQE2pwQyC7pfesCFaoFaAaT7xfMGWo1gXQe9GwUgEdOFjNrDIOrDc4mXctfIU4AxS+h8gHhQy7zuqyyfKsV652Ws0YiSzaghWAktzmd3izralsQGaQLXABW0JqqSf24tLB1Fjn8vZ9chH4O3sqDgKUev1ioqg6St5HE1EQttlM5EArgLKhomI/FGZSoan9cVl4nKtfds1ASNSrlug6brJNozQzrnPcFO9e3WHwX6XPK0kRMSzwgKTIxbqoj99ewnc/AqO8xJrUrhuhxzSW0e2lTvwu4uTBgTrRze5/BRVJbSzHCu4cdeTbEYaB44GDReFFGAu9l+FxVeBKQy768nnR5CadYKrIgzTdWQr1/uDsAiKQpqp0jLeC8HjSjSbtv+tkogMaKm93e4HsjwISfYtLJISQ4Kg+0acVPFpWnQh83BgDsi9lTUMA4VMGv7kImX7+jfOOTm1EllqAzCNJT7c4CN5Tr2kGdWRMK+MiY4/fKlHANwt0GcEcIeO0MMdNY20S5eqWoQWVh+k2cx8RMwHURtLqLkBAZcgm0bc3tCRnf1Ox6BtwT+2IRIy5SjUPHmYG5sCRkV7HH3d7avPTK04jcyWtNoODo+UV7l/SyJzsXDYnk8atd7unYiUgbvgdfEJsCGUMgZ0Kj0AbcDtnQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6486002)(316002)(66556008)(66476007)(66946007)(26005)(2616005)(83380400001)(38100700002)(14773004)(31696002)(86362001)(36756003)(478600001)(53546011)(6506007)(31686004)(2906002)(4001150100001)(7416002)(5660300002)(6666004)(41300700001)(6512007)(44832011)(8936002)(8676002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUFrVWdIMmI5TkRUMUNIYnNjWlEycnl5aUlVZHNGanp0OU5PSytPaCs5SmpJ?=
 =?utf-8?B?U1hHRE5RUkNzZTNaTzMya2ZJMDFmclVWVlBuNGFkMlNFeklHOFNod0F2K2Mz?=
 =?utf-8?B?aUJkOFRTOWlvS0VuVzdjNm1FY3NvKzVTOVRrdTltSFN4NzhwdXdMTzVjME92?=
 =?utf-8?B?WSt3ekJrZkNmWDVQcUdJSWdoU0l6RUpYbEREaEJRQm9yQ3lnK1BYd3Q4dlBI?=
 =?utf-8?B?WFJReUZVR2t4emdWQ0wyYU9xZ2JzMXQ5UGlvUXZRazBTRlZKNTl6SzVBVlM3?=
 =?utf-8?B?MU9RcEx6b2xvbU00dXlUaVh3cWFhcnVTbTg2OEdEL2V0Q3pPNWJhNXR3cXdT?=
 =?utf-8?B?V3F6U1dYQllXVTdCR09GS2UrVVN4YkVEWVRXZXFyeVdiWUZhT1hjT05lZXFB?=
 =?utf-8?B?L2IvYmVLM3dRYUJOTkZ4Uk4rNXZPOEpzU3psUnNTdFNPaE12UUhuWnhucnVM?=
 =?utf-8?B?YWl6dXZXOVdRLzJFd3hQVDJVRXkrK29aQTVwNFlnTk1Va2tRS0ZGaXhCekdB?=
 =?utf-8?B?RXNyQjdFSkZLM1VjUGs4dnd4NjF1blJ6WVF4bkd6RHZBcEtEWTlQRHNFRDlp?=
 =?utf-8?B?cmVZUVNNVkkvRkZMR1JPWks5QkU5Y0dWbnd2cC95dVlLcUJreEpkaGQyMVdY?=
 =?utf-8?B?eWMvTHZILzJpUWZjbTE5Y2tPYzcxM1EyWTlJV0NKcHBQYVRvdnQ4bVJ4WWtn?=
 =?utf-8?B?Rk1NUWpOenpIeE8vRzNHdUdpVUpKSjc3SVBHdU15WGoveEF2WlJqMlFpVHFq?=
 =?utf-8?B?OUdadDEzbTdUdXU5d1dtcDNyNU95blNkdm5GbWhYZmVZMG80U0UvdUdkWVVk?=
 =?utf-8?B?TVlSUzY4cXZiK1ZkQWd4ek1FQVFHSGtmZ0pTMnY5cDYvTXQ4Kzl1RDRGZ3RC?=
 =?utf-8?B?dUZBc1d5Y1BtSTR2Uzg2L0FrL0FSa1Y0RWgrSnN4Rm1HRjl6T1poTkw2Q3N0?=
 =?utf-8?B?TzhsL0pmcjZxalZGQjg3NGxhR2tXUlV2cGhWUm1Uc0I3ZnhUYVdjSHo3WU5C?=
 =?utf-8?B?Z214ZDlETG9JbUJPb0JUMVNoRzB2WEF0SnlMRjVlVmZqYThtV3luRTZtbFF2?=
 =?utf-8?B?RUFOUTArblYzYVo2TFhGdlZWQUNUYmJNbFJQQzlYTk1vZWhnL2t6Lzk5YU1H?=
 =?utf-8?B?TW1UOE5tMC91M1NTRmNVREl6K2JyNjhpcUZpc3djS1FxN2tYbXVJeFEzWDcr?=
 =?utf-8?B?ZU0zRlhocTBROXR0T1ZGMTFML3p1NVZwWTN1R0Q2MDVxUGVQOWR4RzRkekFL?=
 =?utf-8?B?VGNVWW04eHFScjRuSzJaZ05vanBhQzZKRytrV2dtSHFHa2FvbUFWQnZ5VGJw?=
 =?utf-8?B?SEZ4L2w2TjdmYUMxLysrcnk2SUtBYXkrVFFHK0JGM3pweHNaZ1hxZzg2cng2?=
 =?utf-8?B?VmR2RnNrNm83TUlqUER3U1V3R0xVTm8wVmhjaXJ3Q2NtVEpCY2ZvSlVVdlYx?=
 =?utf-8?B?N3Q3Vnl3b2ZpeU5kQmZZVjlQVWdvODAxMlVLTjF0cWlvMzlTaFE4ZUsxVjB2?=
 =?utf-8?B?THNKVkQrNlRoMDlBYkVuSEpkcWVkUXArTUdyTFRpNW0yTk14Ujc2eVZNRXpH?=
 =?utf-8?B?V21QRCtuODhlRGp1VnRFWkVudDFiZE1RSWFmLzJoeVI2eGJnVVJBOGdQYWV5?=
 =?utf-8?B?RThlakZQcmp5NlhvVE8vQ3dqMGJCM3dtQVJGaldyYkVrYUV3azJKSzMwZDd1?=
 =?utf-8?B?WVpheGpNa2R5SENoRGJyYTdPM0RLMnBPMnY3VTYxQWVyWit0em1Td3VQQXdk?=
 =?utf-8?B?L2ovSkR2N2lBaXZKZ3JSWTFyRmFjdnVYMWRNYXZxRkNVSXhLNzVaS3VtaGxN?=
 =?utf-8?B?NDEvNjhDNDV1STVubnM4cVpjbEQ1TUNrbVduVUd0ci9MbFpDMW1sWTBTRWd1?=
 =?utf-8?B?Z1lHcUlxU0VpLzV6VS9ON2wwQU4xa3YzWXpBMGFTdTQ1WWZzcmExRGVMeUpX?=
 =?utf-8?B?S3VkbU1zZkV3TlpDcFd5N2NrUTAzSkVsa1llNllKdFpCOWpzcG5OSlZqYk8r?=
 =?utf-8?B?REhGRVc2eW1BM29ydVNCdHp4NkJndWs5RXJmM21yVVJCYzB4QTQ5S2lVMmRn?=
 =?utf-8?B?cktWYlNucW1sR2JtcUhid0VwSi8xNDRTS2dCcGtWQjRQVFZON0FlTVVFanB2?=
 =?utf-8?Q?iEok=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5e672c-4a95-4a4a-ec57-08dbcff5d67b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 16:18:17.7023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93QBaogaxDjmcRMLoICg1nt4zZuBlIy4UGdwGc+41y08ctdSjZ8LRcnFrhyRXOG0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9450
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

On 2023-10-17 11:09, Matthew Brost wrote:
> Add a helper whereby a driver can invoke TDR immediately.
> 
> v2:
>  - Drop timeout args, rename function, use mod delayed work (Luben)
> v3:
>  - s/XE/Xe (Luben)
>  - present tense in commit message (Luben)
>  - Adjust comment for drm_sched_tdr_queue_imm (Luben)
> v4:
>  - Adjust commit message (Luben)
> 
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

Yeah, this patch is very good now--thanks for updating it.

Regards,
Luben

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 18 +++++++++++++++++-
>  include/drm/gpu_scheduler.h            |  1 +
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index ff2cfad54342..563a4f0f6956 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -431,7 +431,7 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
>  
>  	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>  	    !list_empty(&sched->pending_list))
> -		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
> +		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
>  }
>  
>  static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
> @@ -441,6 +441,22 @@ static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
>  	spin_unlock(&sched->job_list_lock);
>  }
>  
> +/**
> + * drm_sched_tdr_queue_imm: - immediately start job timeout handler
> + *
> + * @sched: scheduler for which the timeout handling should be started.
> + *
> + * Start timeout handling immediately for the named scheduler.
> + */
> +void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched)
> +{
> +	spin_lock(&sched->job_list_lock);
> +	sched->timeout = 0;
> +	drm_sched_start_timeout(sched);
> +	spin_unlock(&sched->job_list_lock);
> +}
> +EXPORT_SYMBOL(drm_sched_tdr_queue_imm);
> +
>  /**
>   * drm_sched_fault - immediately start timeout handler
>   *
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 625ffe040de3..998b32b8d212 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -568,6 +568,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>  				    struct drm_gpu_scheduler **sched_list,
>                                     unsigned int num_sched_list);
>  
> +void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
>  void drm_sched_job_cleanup(struct drm_sched_job *job);
>  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
>  bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);

-- 
Regards,
Luben

