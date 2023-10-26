Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4FE7D7BD5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 06:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC3110E75C;
	Thu, 26 Oct 2023 04:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F75410E75B;
 Thu, 26 Oct 2023 04:46:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVqXeNaC7PUlt+fUxhDXUYkPjdV/ICNI/V2BV/rOrUYgt3jFoWuDgsHrkSNJkLPz2R75xH5YmuOJk4WPfz67yyFzTgJWsAeXr7oyS8rM9lkyWUlk7pnjWNybsQ6UGFTkHpsyVOrU+cXWc3DDv/83qVc4htHKU2H8B2qVhh+F1RBFeBVJJLdLwLnF0qIQDTh0tCaEhQr4dq0zHlNpn3iFZ9RMbILlROmfbj7Ojbj/Cq9CHnBlMquVIWZebEWwkBpXsvmaI1doZ+8RNDNGpl9J6gEtwh6EIutitZN9nhPO3BCM6vC0t6Ef5lXcbBkYV99MRT15N6dHsJHoCIHFxdPAnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yTcFQraz7KrhlGxdPldl2LWU+/kavOIwfOlXkZkyWw=;
 b=igV6lmAGpVHIGNByq9lPXMWLztJwzUOrRvFGhaqt27eNFj7LZKDV6wgO4Qqpf1UAILYZWz7sUL38S+msScj4mTYnAaDtIbDiP4ejVb7cElwtb+IyXTsoQr30HTgttWfi5WPDWRdMz1V93jSvGtCEiuHHUmYri1iVUw/yz2X9wmdcaDOEx8LXiQKoU7tSGxcYtcZ51oCYq5KIs+bI9nnUR2uYA9k7sD9TWs+KBXQtqZ+qfM/TLqpNPgV/p62JyaI6tcQLh9ZuTG9g1usnWEqObW42Tz0KzkAKpaVpaAg2/9L4xy8q8yCEup2XV+9+HCDDexhGNI4QXWT0MmMiy7nUHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yTcFQraz7KrhlGxdPldl2LWU+/kavOIwfOlXkZkyWw=;
 b=0YXUhkTFGQm8vSQzCL2Kh05dKmvSb2rq1qoh6IgEpau9Bp/qK+EtyCLNvvCP7BhACrqvU3rwLjS0seQBcZ1Os2tLkG+BBBy7GoDB9g7s7TzBXJcnz6wh3ubMKnLrU45rxFzm14JEQ7F8TULTGVZVseV6mWRXGIMbRCZiEm8IHdE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CH3PR12MB8996.namprd12.prod.outlook.com (2603:10b6:610:170::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Thu, 26 Oct
 2023 04:46:32 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%6]) with mapi id 15.20.6907.025; Thu, 26 Oct 2023
 04:46:32 +0000
Message-ID: <82bda15e-4f39-45c6-903c-020596ad907c@amd.com>
Date: Thu, 26 Oct 2023 00:46:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.3
Subject: Re: [PATCH v7 4/6] drm/sched: Split free_job into own work item
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20231026041236.1273694-1-matthew.brost@intel.com>
 <20231026041236.1273694-5-matthew.brost@intel.com>
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
In-Reply-To: <20231026041236.1273694-5-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0329.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::19) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CH3PR12MB8996:EE_
X-MS-Office365-Filtering-Correlation-Id: 169532d8-5131-41fe-bca1-08dbd5de86b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8hgE9lFqfBIiKPmL49C3MxORcoyJ9Jc2Znid2OrsoGLW+10sqBPd+vymAxioE5oUzecQriJuu7cbAVXcdUWZq/CG1vt9nxbjBYsNNSh88lGLnn0LfjCisDenpw4wtw9WXd1Gl1F5PhfhAJNF7FmFxfzsIx+Xy33QmCDLm3Aczqv0u/aAdsm6f3FpU0k3KIeMwJv5KFAWEjw6Vr6Q30YRvgm1aQ46mEiwhMdkh9d29J9/MVe+CY7Hb4fQ2WIfLuw7zh1WVI2sAjiL8jEbrJb5KSOyNrTfM1qywjszVVIKrjY/Q05w+DmCpQeTu5I4KpdIX20N1fPqVsQGY9DJ005oER1O5P9smJbNMt86egYz296Tj0po3V3tyrXJUgsZInZlKPn8Uqa6JlqJASyMIrgQatKuJirwey/Zw7SHTA9Hq1qr/Xz5+VXnmAc99xk6mgQ/ro4CBnm2yERNQxrJHw83VnNOLOIT7LUslm2ttDvzht0hWlSgUvehK5xUgNxp7eqykwgWw1q7heTMpV0JF4KUt1RSPg6VaH+LSaHd6jGGWnKbi3hRlHzs801Zlqn/Z0BxweJBH1zhM5mYEoXBSKaGEgKmZEtFhs3J7MR5P/XWmPxRobR1Opthjil7tAhsK3DXGoCFbt7t6bX0dKL7eVVWaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2616005)(66476007)(66946007)(66556008)(316002)(26005)(478600001)(6486002)(6506007)(6512007)(53546011)(41300700001)(44832011)(31686004)(38100700002)(30864003)(31696002)(4001150100001)(86362001)(2906002)(5660300002)(7416002)(36756003)(4326008)(83380400001)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGJQR2JRMy9zdzMwWXAxZ0xrUXNRc3pUSUFrQk91UWQvUWxoTFVqMnhvYUtL?=
 =?utf-8?B?ZlV2TzZ1NDA4Q0dLZHBMaTY1ZzJhMTFMRXRBcTBsaUxXS1dWK0lLL09LYXdk?=
 =?utf-8?B?SjBYZk02Wkh6MGtGekJrbTM4QUoxbEcyZyt1VE1CRzBpbWtuWXM5MnZ3bjdY?=
 =?utf-8?B?aGpWQmlzTDVsSmZDaXdJWmtQR28rRUduQ3BLZHhVVjRvd1VyeVJXN2tjZEpW?=
 =?utf-8?B?dHVxVDg4T2ErMEhMS2ZobDFKYWlLbitLZ2YrZjNLRERHelpXWTdZZlZ4dnRO?=
 =?utf-8?B?eitUYzUzdGRIdTU5NDRrMUl5S2hmV0dRYm5qYVRUMjZ5M2cwZFBrM1ZYWW0w?=
 =?utf-8?B?aFUvUWltY1BjcUkzclVFVExxRkxSU08ycjBMekM1aENxWDlkRjhXZG95WThI?=
 =?utf-8?B?MUQ2UGF6bzVXdjZ4UkRMWGVERG80bmplSERJeTdaTk5EMStpUHI0c3ZYNEpO?=
 =?utf-8?B?dFBmeklaZldzcUQrTFFyOGcrcGhHQU5HRi9rdmRqZzBSS0tiQzRsUElIWmNG?=
 =?utf-8?B?Y2p6ZjdMTSt2dEZEdzRYNWdZMUpINHEwd0gzSmppRnBrZ2F2UE1ESC81djg4?=
 =?utf-8?B?Q2J4cGVmRmhGQ1FHaExMM3IxQ2pLQTZ5aTJKejlWNXJYUjJaOXc1NHk1VGow?=
 =?utf-8?B?djA1Wmw5SUdiSHpUOW41dUZSeEJVYkVvcHQ4K1kzb081M2lUNGZ2TzNGa24v?=
 =?utf-8?B?bzVFTXQzK0thODlmSUtlQzZ1b2lMZURQcjhZR0RicDFqYXRxbkl5YmlidURi?=
 =?utf-8?B?R01UN2FJeEJZdVJXMm5lTGpiek83bGx5Z1dpbnBLbUoxZEdIN0FTTjU4cHNK?=
 =?utf-8?B?alJDLzliN3BYSStOQkx0eGt0T1BTc3dMZVhzNGYzQ0NoQWJZdXhJOEVIY0c4?=
 =?utf-8?B?R1gybTJsSC9YemUweDV2b3NKQ05SSlloekRzU3NEMlRncERpeWtMM2JkcGJI?=
 =?utf-8?B?QzQxQ0MrdjJZdXJOZmp2VnlLMUJnT3BmQ0NRME01MGwrUmt3Qy8yRzFxZEpN?=
 =?utf-8?B?ZVZ2MW9BSEJGMk1TUFdoSUlGZFZ1ZjZZYzVzK3o2NWZsODZqaHZ6UGJwOEow?=
 =?utf-8?B?bStibmM2TE4rcEpSUERUbjdVK3Q3b1JFaVl3SENDOTJNS3o0ajZKWTRUOTlw?=
 =?utf-8?B?S2ZYbzVodW1BS1l4eGM0cDVqTnF6M2YraE1RSU90ZnZpN2RnalFHVDRNSThH?=
 =?utf-8?B?MUdGRWNmcHhTRDA0Nzl4cWFPM091WTh3dGZXdnQ0SHBHT2RmZWkrTXpRbzdw?=
 =?utf-8?B?YlJqbzhITmdTNFRZRHROR3YyWEI5OVY5RWdEMDdNQ3AxMEY3aHBFRDZRejBI?=
 =?utf-8?B?cGk2Q29MS1U3SzBxcm5XNmxHZXhaajRXUkNweDBTUVBlN21mczZjV2JHdlJq?=
 =?utf-8?B?ajhjZVE4TFJOdlZmaWxxTkJLL3ovVEMvTE9WT0xIa0NNc3kyTnJGb3dNdHNM?=
 =?utf-8?B?ZCswRXE4WngwT1FianhrZ1ZJWHl1WitCRGc2TDFWdW1iQ0c2b2lHM242S2Zx?=
 =?utf-8?B?L2NUVXNiQTBXNEIzcVJjMzd3WG1GcmZiemR5a1ZxV1VYcWlGemFBTlVQWjlv?=
 =?utf-8?B?M092VEl1NDdnU1lVMTlRN2dHYjlndE92OFJtU0N1RU5kTTRYaHZacUVjQlps?=
 =?utf-8?B?SHhLTk5lRytSZW1iMi92ZVh1QXFGNHNBRWxjR0ZXbzB1OUc2Zzd6QThLSVNI?=
 =?utf-8?B?VVUrYzIrYWw0UFRsMGtTb2dWTllVOCsyUDdORUlsYzFkTTlBa1FVYXE5OXpO?=
 =?utf-8?B?NEhibzA2ZTNpTEI1WEYyOWQ4VHhCUGVxNk1DR25QRm1ILy81N0psMlZxRFRa?=
 =?utf-8?B?T0JKQXRSRFJsVDExQTBHU24rMnVVaXFvd3RTVFlxTHUyQ3JQOXhYLzdQVENV?=
 =?utf-8?B?cDUzY3R5Ymp0RTRSSHZaeG1May84OVVWOVJESitNYXJUVUozMk9DYmVnNHFF?=
 =?utf-8?B?b3c4S0h4T0kyT1dkeW1iTDRzd1prRkdqOTY3c2NwNEFBMkMzQ01md2RhRXp5?=
 =?utf-8?B?ek5ZMjRyeG5nV0dyZUZhMzkrUmpoMnFqSG5BTlA0RnVwNUJoLzZFNXZUeGNo?=
 =?utf-8?B?UVhTMndKWTZqTUJLQit1dHhXUi93R0pTbXZrU2tGUVo3T0ZJYy9LTnB4S1pj?=
 =?utf-8?Q?f9qiv+R46TrzsMJJg4chhN1ZM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 169532d8-5131-41fe-bca1-08dbd5de86b8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 04:46:32.4161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jIv1vbtCIzFXWgOw8Oiy/2fktwTdG2wxDMHESEsvGO7Aa7+psOZGqKKy4md2WxN3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8996
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

On 2023-10-26 00:12, Matthew Brost wrote:
> Rather than call free_job and run_job in same work item have a dedicated
> work item for each. This aligns with the design and intended use of work
> queues.
> 
> v2:
>    - Test for DMA_FENCE_FLAG_TIMESTAMP_BIT before setting
>      timestamp in free_job() work item (Danilo)
> v3:
>   - Drop forward dec of drm_sched_select_entity (Boris)
>   - Return in drm_sched_run_job_work if entity NULL (Boris)
> v4:
>   - Replace dequeue with peek and invert logic (Luben)
>   - Wrap to 100 lines (Luben)
>   - Update comments for *_queue / *_queue_if_ready functions (Luben)
> v5:
>   - Drop peek argument, blindly blindly reinit idle (Luben)
>   - s/drm_sched_free_job_queue_if_ready/drm_sched_free_job_queue_if_done (Luben)
>   - Update work_run_job & work_free_job kernel doc (Luben)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 241 +++++++++++++++----------
>  include/drm/gpu_scheduler.h            |   8 +-
>  2 files changed, 151 insertions(+), 98 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index b22157e920d4..3d89420d4ffb 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -257,12 +257,89 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>  
>  /**
>   * drm_sched_run_job_queue - enqueue scheduler submission
> + * drm_sched_run_job_queue - enqueue run-job work
>   * @sched: scheduler instance
>   */

No, please, see you're introducing this in patch 2, and it is there where
you should do all changes pertaining to that function.

Basically, you want to normalize your patches--don't spread the changes
to the same new thing you're introducing to many patches--just one single
patch and in no other patch.

This makes it easy to review, easy to see what is being changed, in one
place, and not in many places, especially when it is part of the same patchset.

And for the rest of the functions.

Thanks!

Regards,
Luben

>  static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>  {
>  	if (!READ_ONCE(sched->pause_submit))
> -		queue_work(sched->submit_wq, &sched->work_submit);
> +		queue_work(sched->submit_wq, &sched->work_run_job);
> +}
> +
> +/**
> + * drm_sched_can_queue -- Can we queue more to the hardware?
> + * @sched: scheduler instance
> + *
> + * Return true if we can push more jobs to the hw, otherwise false.
> + */
> +static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> +{
> +	return atomic_read(&sched->hw_rq_count) <
> +		sched->hw_submission_limit;
> +}
> +
> +/**
> + * drm_sched_select_entity - Select next entity to process
> + *
> + * @sched: scheduler instance
> + *
> + * Returns the entity to process or NULL if none are found.
> + */
> +static struct drm_sched_entity *
> +drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> +{
> +	struct drm_sched_entity *entity;
> +	int i;
> +
> +	if (!drm_sched_can_queue(sched))
> +		return NULL;
> +
> +	/* Kernel run queue has higher priority than normal run queue*/
> +	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> +		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
> +			drm_sched_rq_select_entity_fifo(sched->sched_rq[i]) :
> +			drm_sched_rq_select_entity_rr(sched->sched_rq[i]);
> +		if (entity)
> +			break;
> +	}
> +
> +	return entity;
> +}
> +
> +/**
> + * drm_sched_run_job_queue_if_ready - enqueue run-job work if ready
> + * @sched: scheduler instance
> + */
> +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> +{
> +	if (drm_sched_select_entity(sched))
> +		drm_sched_run_job_queue(sched);
> +}
> +
> +/**
> + * drm_sched_free_job_queue - enqueue free-job work
> + * @sched: scheduler instance
> + */
> +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
> +{
> +	if (!READ_ONCE(sched->pause_submit))
> +		queue_work(sched->submit_wq, &sched->work_free_job);
> +}
> +
> +/**
> + * drm_sched_free_job_queue_if_done - enqueue free-job work if ready
> + * @sched: scheduler instance
> + */
> +static void drm_sched_free_job_queue_if_done(struct drm_gpu_scheduler *sched)
> +{
> +	struct drm_sched_job *job;
> +
> +	spin_lock(&sched->job_list_lock);
> +	job = list_first_entry_or_null(&sched->pending_list,
> +				       struct drm_sched_job, list);
> +	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> +		drm_sched_free_job_queue(sched);
> +	spin_unlock(&sched->job_list_lock);
>  }
>  
>  /**
> @@ -284,7 +361,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>  	dma_fence_get(&s_fence->finished);
>  	drm_sched_fence_finished(s_fence, result);
>  	dma_fence_put(&s_fence->finished);
> -	drm_sched_run_job_queue(sched);
> +	drm_sched_free_job_queue(sched);
>  }
>  
>  /**
> @@ -550,7 +627,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>  				drm_sched_job_done(s_job, fence->error);
>  			else if (r)
>  				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> -					  r);
> +					      r);
>  		} else
>  			drm_sched_job_done(s_job, -ECANCELED);
>  	}
> @@ -862,18 +939,6 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
>  }
>  EXPORT_SYMBOL(drm_sched_job_cleanup);
>  
> -/**
> - * drm_sched_can_queue -- Can we queue more to the hardware?
> - * @sched: scheduler instance
> - *
> - * Return true if we can push more jobs to the hw, otherwise false.
> - */
> -static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> -{
> -	return atomic_read(&sched->hw_rq_count) <
> -		sched->hw_submission_limit;
> -}
> -
>  /**
>   * drm_sched_wakeup_if_can_queue - Wake up the scheduler
>   * @sched: scheduler instance
> @@ -886,34 +951,6 @@ void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>  		drm_sched_run_job_queue(sched);
>  }
>  
> -/**
> - * drm_sched_select_entity - Select next entity to process
> - *
> - * @sched: scheduler instance
> - *
> - * Returns the entity to process or NULL if none are found.
> - */
> -static struct drm_sched_entity *
> -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> -{
> -	struct drm_sched_entity *entity;
> -	int i;
> -
> -	if (!drm_sched_can_queue(sched))
> -		return NULL;
> -
> -	/* Kernel run queue has higher priority than normal run queue*/
> -	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> -		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
> -			drm_sched_rq_select_entity_fifo(sched->sched_rq[i]) :
> -			drm_sched_rq_select_entity_rr(sched->sched_rq[i]);
> -		if (entity)
> -			break;
> -	}
> -
> -	return entity;
> -}
> -
>  /**
>   * drm_sched_get_cleanup_job - fetch the next finished job to be destroyed
>   *
> @@ -943,8 +980,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>  						typeof(*next), list);
>  
>  		if (next) {
> -			next->s_fence->scheduled.timestamp =
> -				dma_fence_timestamp(&job->s_fence->finished);
> +			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> +				     &next->s_fence->scheduled.flags))
> +				next->s_fence->scheduled.timestamp =
> +					dma_fence_timestamp(&job->s_fence->finished);
>  			/* start TO timer for next job */
>  			drm_sched_start_timeout(sched);
>  		}
> @@ -994,74 +1033,83 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>  EXPORT_SYMBOL(drm_sched_pick_best);
>  
>  /**
> - * drm_sched_main - main scheduler thread
> + * drm_sched_free_job_work - worker to call free_job
>   *
> - * @param: scheduler instance
> + * @w: free job work
>   */
> -static void drm_sched_main(struct work_struct *w)
> +static void drm_sched_free_job_work(struct work_struct *w)
>  {
>  	struct drm_gpu_scheduler *sched =
> -		container_of(w, struct drm_gpu_scheduler, work_submit);
> -	struct drm_sched_entity *entity;
> +		container_of(w, struct drm_gpu_scheduler, work_free_job);
>  	struct drm_sched_job *cleanup_job;
> -	int r;
>  
>  	if (READ_ONCE(sched->pause_submit))
>  		return;
>  
>  	cleanup_job = drm_sched_get_cleanup_job(sched);
> -	entity = drm_sched_select_entity(sched);
> -
> -	if (!entity && !cleanup_job)
> -		return;	/* No more work */
> -
> -	if (cleanup_job)
> +	if (cleanup_job) {
>  		sched->ops->free_job(cleanup_job);
>  
> -	if (entity) {
> -		struct dma_fence *fence;
> -		struct drm_sched_fence *s_fence;
> -		struct drm_sched_job *sched_job;
> -
> -		sched_job = drm_sched_entity_pop_job(entity);
> -		if (!sched_job) {
> -			complete_all(&entity->entity_idle);
> -			if (!cleanup_job)
> -				return;	/* No more work */
> -			goto again;
> -		}
> +		drm_sched_free_job_queue_if_done(sched);
> +		drm_sched_run_job_queue_if_ready(sched);
> +	}
> +}
>  
> -		s_fence = sched_job->s_fence;
> +/**
> + * drm_sched_run_job_work - worker to call run_job
> + *
> + * @w: run job work
> + */
> +static void drm_sched_run_job_work(struct work_struct *w)
> +{
> +	struct drm_gpu_scheduler *sched =
> +		container_of(w, struct drm_gpu_scheduler, work_run_job);
> +	struct drm_sched_entity *entity;
> +	struct dma_fence *fence;
> +	struct drm_sched_fence *s_fence;
> +	struct drm_sched_job *sched_job;
> +	int r;
>  
> -		atomic_inc(&sched->hw_rq_count);
> -		drm_sched_job_begin(sched_job);
> +	if (READ_ONCE(sched->pause_submit))
> +		return;
>  
> -		trace_drm_run_job(sched_job, entity);
> -		fence = sched->ops->run_job(sched_job);
> +	entity = drm_sched_select_entity(sched);
> +	if (!entity)
> +		return;
> +
> +	sched_job = drm_sched_entity_pop_job(entity);
> +	if (!sched_job) {
>  		complete_all(&entity->entity_idle);
> -		drm_sched_fence_scheduled(s_fence, fence);
> +		return;	/* No more work */
> +	}
>  
> -		if (!IS_ERR_OR_NULL(fence)) {
> -			/* Drop for original kref_init of the fence */
> -			dma_fence_put(fence);
> +	s_fence = sched_job->s_fence;
>  
> -			r = dma_fence_add_callback(fence, &sched_job->cb,
> -						   drm_sched_job_done_cb);
> -			if (r == -ENOENT)
> -				drm_sched_job_done(sched_job, fence->error);
> -			else if (r)
> -				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> -					  r);
> -		} else {
> -			drm_sched_job_done(sched_job, IS_ERR(fence) ?
> -					   PTR_ERR(fence) : 0);
> -		}
> +	atomic_inc(&sched->hw_rq_count);
> +	drm_sched_job_begin(sched_job);
>  
> -		wake_up(&sched->job_scheduled);
> +	trace_drm_run_job(sched_job, entity);
> +	fence = sched->ops->run_job(sched_job);
> +	complete_all(&entity->entity_idle);
> +	drm_sched_fence_scheduled(s_fence, fence);
> +
> +	if (!IS_ERR_OR_NULL(fence)) {
> +		/* Drop for original kref_init of the fence */
> +		dma_fence_put(fence);
> +
> +		r = dma_fence_add_callback(fence, &sched_job->cb,
> +					   drm_sched_job_done_cb);
> +		if (r == -ENOENT)
> +			drm_sched_job_done(sched_job, fence->error);
> +		else if (r)
> +			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> +	} else {
> +		drm_sched_job_done(sched_job, IS_ERR(fence) ?
> +				   PTR_ERR(fence) : 0);
>  	}
>  
> -again:
> -	drm_sched_run_job_queue(sched);
> +	wake_up(&sched->job_scheduled);
> +	drm_sched_run_job_queue_if_ready(sched);
>  }
>  
>  /**
> @@ -1146,7 +1194,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	spin_lock_init(&sched->job_list_lock);
>  	atomic_set(&sched->hw_rq_count, 0);
>  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> -	INIT_WORK(&sched->work_submit, drm_sched_main);
> +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>  	atomic_set(&sched->_score, 0);
>  	atomic64_set(&sched->job_id_count, 0);
>  	sched->pause_submit = false;
> @@ -1273,7 +1322,8 @@ EXPORT_SYMBOL(drm_sched_wqueue_ready);
>  void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
>  {
>  	WRITE_ONCE(sched->pause_submit, true);
> -	cancel_work_sync(&sched->work_submit);
> +	cancel_work_sync(&sched->work_run_job);
> +	cancel_work_sync(&sched->work_free_job);
>  }
>  EXPORT_SYMBOL(drm_sched_wqueue_stop);
>  
> @@ -1285,6 +1335,7 @@ EXPORT_SYMBOL(drm_sched_wqueue_stop);
>  void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
>  {
>  	WRITE_ONCE(sched->pause_submit, false);
> -	queue_work(sched->submit_wq, &sched->work_submit);
> +	queue_work(sched->submit_wq, &sched->work_run_job);
> +	queue_work(sched->submit_wq, &sched->work_free_job);
>  }
>  EXPORT_SYMBOL(drm_sched_wqueue_start);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 1d52b8bbb06c..37749f561866 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -480,9 +480,10 @@ struct drm_sched_backend_ops {
>   *                 finished.
>   * @hw_rq_count: the number of jobs currently in the hardware queue.
>   * @job_id_count: used to assign unique id to the each job.
> - * @submit_wq: workqueue used to queue @work_submit
> + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
>   * @timeout_wq: workqueue used to queue @work_tdr
> - * @work_submit: schedules jobs and cleans up entities
> + * @work_run_job: work which calls run_job op of each scheduler.
> + * @work_free_job: work which calls free_job op of each scheduler.
>   * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>   *            timeout interval is over.
>   * @pending_list: the list of jobs which are currently in the job queue.
> @@ -511,7 +512,8 @@ struct drm_gpu_scheduler {
>  	atomic64_t			job_id_count;
>  	struct workqueue_struct		*submit_wq;
>  	struct workqueue_struct		*timeout_wq;
> -	struct work_struct		work_submit;
> +	struct work_struct		work_run_job;
> +	struct work_struct		work_free_job;
>  	struct delayed_work		work_tdr;
>  	struct list_head		pending_list;
>  	spinlock_t			job_list_lock;

-- 
Regards,
Luben

