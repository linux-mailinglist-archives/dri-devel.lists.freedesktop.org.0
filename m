Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C84427CED92
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 03:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5577E10E08B;
	Thu, 19 Oct 2023 01:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::612])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E3B10E07A;
 Thu, 19 Oct 2023 01:25:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUdJhk5BJU9XhEG4gK3UmhHaGHhYHFNgnwxrPB70lsal0oWKfIiiVaCsQ/7kw0Pd6p9e0vhA11tFtQVOYr3WbCnLTzFqrJbtWmjeASfUZ7pR7IM48vbUdJ8i8duHh5GfPbxZLWL/XGWojq2CHGjRNsVkPgYbW0yhvsjiuULVJEcQz9DZapABd7mTKRkyuQqHCteF5nOakuncL5zT6LThtXaTxg/t3qCG0Fw3JhXraAFVMv47yT9EcI15lrC2ruimWJtBtuOZyJrFDNmIOFXG2pCqAoVLzi5Lixo1NpkY+HwwiBnoLTy8LPD9FhS6lrEeZ1ZSNQNrKKkfLUMgdAemlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8qVMA7xSrI6Oif9By/WBokrWGsmCVCs2/WKUwd7Exo=;
 b=ePKDIyqvE0y+XNDOoGQA/ONQPfGXl+eEQm3keOhb6gvzfPXgEkK3BJTcIYtdnoncbi8cq9SRLMqPQ8KHnRUpLNj36ERX9KRDOq++c16BEGGNcwaWXDKDewe/LBb6nuRo2vNI7bt6PvHoOrh/sOu1Ml6JoY4DNcgGRzvxsYKFgrJtpaUdqSsNDnuOgneWg6BnGOd6P/ZfVnIqpc9GLci60WOxzSrpR122ZXECaY+gcfKtSCYWm5mJO6OqhbcHIhQUmiREtblE5LB/+qm6ZiQkVP9O+OkFCrh6LlXPNzWchqmaV9hv+TKTYkhOOO73oNEwf8CUz+lsXEc5n+AWad+brA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8qVMA7xSrI6Oif9By/WBokrWGsmCVCs2/WKUwd7Exo=;
 b=MuE/GYcxsEU6YiVaCLiwAxT3oLmWCyjCWSGlKoQqNpzy/nd5YSaNHUU12R6Pf6SXnxTivPv8lOV6xp/QhrrPaIyujaEbA97/TePwaVOiA+94pzMt21DrzLpG31L+WrBuGZ0JBvi2lCoeADCmLnrrN2l72SqT+ZXlsrD6XRuxUmA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3375.namprd12.prod.outlook.com (2603:10b6:208:cc::12)
 by PH7PR12MB5593.namprd12.prod.outlook.com (2603:10b6:510:133::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Thu, 19 Oct
 2023 01:25:39 +0000
Received: from MN2PR12MB3375.namprd12.prod.outlook.com
 ([fe80::3ca8:3bb0:d0d7:3302]) by MN2PR12MB3375.namprd12.prod.outlook.com
 ([fe80::3ca8:3bb0:d0d7:3302%2]) with mapi id 15.20.6907.021; Thu, 19 Oct 2023
 01:25:39 +0000
Message-ID: <88acf859-a1a7-433e-bfd0-b1b83b2cda05@amd.com>
Date: Wed, 18 Oct 2023 21:25:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH v6 5/7] drm/sched: Split free_job into own work item
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20231017150958.838613-1-matthew.brost@intel.com>
 <20231017150958.838613-6-matthew.brost@intel.com>
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
In-Reply-To: <20231017150958.838613-6-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::24) To MN2PR12MB3375.namprd12.prod.outlook.com
 (2603:10b6:208:cc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3375:EE_|PH7PR12MB5593:EE_
X-MS-Office365-Filtering-Correlation-Id: bb7974c4-7189-444f-9a20-08dbd0424df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j5RwTyGQC1AHdFN6/iqlQZZrdaHa1TKTTneJz0AmSYUkEMqeUBtG5I6g2XfNMk/HVtETgUMRbynSJrWwrOPpM2H3xt+3cqRFecHPkPvbSyR97k6PhKwtMinYVMjXS671XzFAkHa4Ab0v8TlfwcmMmNDZf2swxBuJZeOX1fttMS+ACS6RjfTefNn3BxWV8TOnO/9Us58vGL6gHJ4jViKwT3o1MLf6G72p9uLZBl9Brq+i8obc+i1z4cXXN8UXsrwX71QNhBJ4o886ganIjVP2XhYDg7fANwvqeZUZ/G1H3EyO9kVfx0LacBqNc4zI3ifLRVJLhyh6poKeHSt/hq4WqKUEeUr2Sw2+k78cSrw8MBgIBfHtUUVT5a1V877f2F/ZKnsYZ+MaACQA3yH3CWW2XHiRWuZBqu1uOGHfEBaiJj1nnZGxhURcJQ64PNT/4z8Qsm4G4+HhHEb0qA8ZUB+5XgMgSdUN3SNQMgqnqH34GhaoT3EV+ovevSEWJfhfbp79ejGn3adqvbqJkdSxOtS8U47Ewv4H4v8TVBPu8sXjux3t0ZstkfQAn3H93EbpzYKc0AhJYx+uZtNUkSkYCg8pIWm3I43Q4jqIiEagnXrezRQ/raz0o077FOIbgk1aWggE1WDxya8OYYgwIl1RO4CY7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3375.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(396003)(376002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(31686004)(83380400001)(66946007)(4326008)(2906002)(316002)(53546011)(7416002)(44832011)(66556008)(41300700001)(8936002)(8676002)(478600001)(30864003)(5660300002)(31696002)(4001150100001)(6486002)(6666004)(6506007)(86362001)(2616005)(66476007)(36756003)(6512007)(38100700002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmcvL1piaTR2cUZSY0txTTJlc2MxUE41YklBZVMzRW03VC96MjkwVFNWd1hI?=
 =?utf-8?B?eUVJcDJ1UHRhMTIwYVZGKzhFQkl5WDBGZHhmOERXY05UOCtETUF0S3ZHaDBy?=
 =?utf-8?B?aGdKemorVmVvVHlHNmd5VTZHM3BWYjVuL3hPRU92K0ZwWXpNWG1BWW5nV0dk?=
 =?utf-8?B?bW4yNCtuMlBQSTRWeFBFMFJqZE1GZkNuaVZHKy8yUnRNU2NwbllqZFIzWVNC?=
 =?utf-8?B?d1p3NWN0elloTHNTcnd3U0tUZitxc08yMnZOQzk1YWlzN3U0eTVxdjZRNTh4?=
 =?utf-8?B?aVQ3OHBHa01TamJzd1JzbnpaZEdZMGVTTjVJMzIrZlJCVzZEUVZxNVFDa2pZ?=
 =?utf-8?B?Zm9FM3lQSkd1M2JNLzVUUUE3ZHNpenhTOWRMdy83ZVB5YjFDaGxGRXZPTXd3?=
 =?utf-8?B?M2pmblM0K0hXWnozTStTaUthUCtLemhXVmw0ejk5MEV0dnVkL256OTJFN00y?=
 =?utf-8?B?UVp4WTZkWGltVFRYaU1FK3ZNSDBsUVA4UGhmVkdSRmJxMWg0eXBGQWFUOHM3?=
 =?utf-8?B?ZDc4b3Z5SnpYNzU0c3JEYkplWUFuL1phdXpsSlN3K2k1d2p3ODFpSnRhZ2xy?=
 =?utf-8?B?SG1yZXRLRUE1M3ZrTy9KZlJ6T3N4TXN0aC9hb0laT05lK3lMUWdpUEhBckhH?=
 =?utf-8?B?MGNsYVFZbDlGaFNmWjY2emdhdGhnSC9SNXFPcjgwZE1rTXlaNWwvWDJzbEpJ?=
 =?utf-8?B?V29nYzNyMmFZSkxFWnhSY3FwVWE5bE1FUFdrdFUwaGRWNDRyTm40ayt0dWxx?=
 =?utf-8?B?VDBzakxnNmRwRUYrK0NndmIxZk9MYnZQVWpSNGpnWmxDK011QUJldENYTVJ1?=
 =?utf-8?B?SU5LeEFOdFp4VGdoUktIOXU2SGUzVjRnTEM2SkhOQml4SkM4akxubXRwZVNl?=
 =?utf-8?B?RDluTTBPUUVSWkZJdTZkT1R0Y1NEZVZsOXlPaW42M05mSEx5RUJ3eWhGNk5J?=
 =?utf-8?B?cWxBS3BENys1Zjl0MEJlc2FTQUhjQUxmenA4T0pxZVNZUGlMbjFhVmhJWFRx?=
 =?utf-8?B?dVRhaHh2R3hGbU0vc1Njbk9GYmZrLzBrNWVXWHdnS0xRUklDV3NRSnIxYnRr?=
 =?utf-8?B?Q3BVVUVhS0MvUGxxRldsZ1IvVmxIejBNcGVPWlFFQXZ5dVJpTXZvVitwRFI2?=
 =?utf-8?B?bkJhdUs0WUhjTzlaZFFtbC9hbHNLbUcwZFNDN2J4MmozTlpUYk4rZGJvalRF?=
 =?utf-8?B?dW54bjZVWjBTaEhMMWZjT2VWTndyTE5Yam5saHJTeEpqdTdWVGJadmdSdHUy?=
 =?utf-8?B?Y1FLNEQrdTYvdXFaaURUaUkyVlFSTE5MY3huS005UVZGdFF5YkJrV1g5VTVP?=
 =?utf-8?B?T3FXUkt2anFQNStKanFzbEN0ZnQ1NWdTZnUyd1VPNDFFOGdkNlNjN016SG5a?=
 =?utf-8?B?SXZmWVFhN3piMVdwK1V6S0lDOWx2KzM5ei92SkxxSS9Kb285UUtjZUhDeVo2?=
 =?utf-8?B?anN3THE3cm9oZHRkWit6K2t6Q1pINkRnVFdqL0FGWUNMZ1FqN2tVM096U2lZ?=
 =?utf-8?B?UUVnNEJweVhyTXhMQXZMaWNUWlJaQmtWbkFROVlJZDdIdDNuS2dsL0RNaWo0?=
 =?utf-8?B?Ti9abVVEcHcxay9OUWVMTU5IenNGSFJneGJXVTloRTFJY2k5b0Q0WlpNbVI0?=
 =?utf-8?B?SHlZZkdYcFo4emtmcHN2ZzVkem1Ya3RBNWRlVC94SVJTc25wa1NxVkpZNWxT?=
 =?utf-8?B?RjRzM08wZHZYWStsRHh5MXBRV0JIUTdEUEJFb1dnUGZuQktsQjh2YytDQWMr?=
 =?utf-8?B?Mkc3UDJsNTJsWThuUXNtN3c1aVNZazZWc0JDdTFyQUFkS2lNcEZHRkRNOENq?=
 =?utf-8?B?UHJPenU4T3V0VStqMFZMQW1sRnVGbG1oT1UrUlVRNE4wVGtlcHhobEJqVHlm?=
 =?utf-8?B?Rkt1c3dDTFRLaUw5aU1HSC94SVNVOVVQNWJPeXphUnh5T3pKRjg4aFRwdHl1?=
 =?utf-8?B?QndBUlphd2hxQzRzRStVYlJsMGpuS2V4SmR5N0xUWmpKV0ZlbGhmbDhXUlQ2?=
 =?utf-8?B?SHVmaWlHWlZCVE9VdUpldVFVK2sxNk8xeC9OUVlEWDZlbjlKaWhZdWVtU080?=
 =?utf-8?B?RXdTU3VCZTZmTkp6UHhqbkVjNDdqNXpNNGx2cGp5ZFFPMUNtZXR1VEpCVGZV?=
 =?utf-8?Q?WxHU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7974c4-7189-444f-9a20-08dbd0424df7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3375.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 01:25:39.8580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: amnA2V0dAjfeY2nhaF0tLPHVCams1J9fHbDmLekkzCYnOOvIiGIyhv8F7YJLzZHW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5593
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

On 2023-10-17 11:09, Matthew Brost wrote:
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
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 287 +++++++++++++++----------
>  include/drm/gpu_scheduler.h            |   8 +-
>  2 files changed, 178 insertions(+), 117 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 273e0fbc4eab..b1b8d9f96da5 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>   *
>   * @rq: scheduler run queue to check.
> + * @peek: Just find, don't set to current.

The "peek" rename is good--thanks!

>   *
>   * Try to find a ready entity, returns NULL if none found.
>   */
>  static struct drm_sched_entity *
> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool peek)
>  {
>  	struct drm_sched_entity *entity;
>  
> @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>  	if (entity) {
>  		list_for_each_entry_continue(entity, &rq->entities, list) {
>  			if (drm_sched_entity_is_ready(entity)) {
> -				rq->current_entity = entity;
> -				reinit_completion(&entity->entity_idle);
> +				if (!peek) {
> +					rq->current_entity = entity;
> +					reinit_completion(&entity->entity_idle);
> +				}
>  				spin_unlock(&rq->lock);
>  				return entity;
>  			}
> @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>  	list_for_each_entry(entity, &rq->entities, list) {
>  
>  		if (drm_sched_entity_is_ready(entity)) {
> -			rq->current_entity = entity;
> -			reinit_completion(&entity->entity_idle);
> +			if (!peek) {
> +				rq->current_entity = entity;
> +				reinit_completion(&entity->entity_idle);
> +			}
>  			spin_unlock(&rq->lock);
>  			return entity;
>  		}
> @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>   * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>   *
>   * @rq: scheduler run queue to check.
> + * @peek: Just find, don't set to current.
>   *
>   * Find oldest waiting ready entity, returns NULL if none found.
>   */
>  static struct drm_sched_entity *
> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool peek)
>  {
>  	struct rb_node *rb;
>  
> @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>  
>  		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>  		if (drm_sched_entity_is_ready(entity)) {
> -			rq->current_entity = entity;
> -			reinit_completion(&entity->entity_idle);
> +			if (!peek) {
> +				rq->current_entity = entity;
> +				reinit_completion(&entity->entity_idle);
> +			}
>  			break;
>  		}
>  	}
> @@ -282,13 +290,98 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>  }
>  
>  /**
> - * drm_sched_wqueue_enqueue - enqueue scheduler submission
> + * drm_sched_run_job_queue - enqueue run-job work

Hmm... so this removes the change from patch 1 in this series, and as such
obviates patch 1.

Do you want to go with "run_job_queue" and the names introduced here?

In this case, we can have that in patch 1 instead, and this patch
would only split the "free job" into its own work item.

> + * @sched: scheduler instance
> + */
> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> +{
> +	if (!READ_ONCE(sched->pause_submit))
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
> + * @peek: Just find, don't set to current.
> + *
> + * Returns the entity to process or NULL if none are found.
> + */
> +static struct drm_sched_entity *
> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool peek)
> +{
> +	struct drm_sched_entity *entity;
> +	int i;
> +
> +	if (!drm_sched_can_queue(sched))
> +		return NULL;
> +
> +	if (sched->single_entity) {
> +		if (!READ_ONCE(sched->single_entity->stopped) &&
> +		    drm_sched_entity_is_ready(sched->single_entity))
> +			return sched->single_entity;
> +
> +		return NULL;
> +	}
> +
> +	/* Kernel run queue has higher priority than normal run queue*/
> +	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> +		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i], peek) :
> +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i], peek);
> +		if (entity)
> +			break;
> +	}
> +
> +	return entity;
> +}

Can you shed some light on why you need the "peek" capability, i.e. to just
see the entity without actually arming it?

In a single-entity scheduling, surely peeking at the single entity of
a scheduler, can be done easier.

I'm asking as none of these functions were intended as a peek-only/-capable
solution, and if you need it, this shows that the infrastructure lacks
something which you need.

It's not designed for "peek", as you can see above: it gets passed-through
the function stack until it reaches core functionality to be used in logic.

(It just makes the code too complicated with too many special cases, "if's"
and if we keep doing this, it would become very hard to understand,
maintain, and contribute to in a few years.)

> +
> +/**
> + * drm_sched_run_job_queue_if_ready - enqueue run-job work if ready
> + * @sched: scheduler instance
> + */

"if ready" here makes perfect sense, but in the "free job" case,
it should be "if done". See below.

> +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> +{
> +	if (drm_sched_select_entity(sched, false))
> +		drm_sched_run_job_queue(sched);
> +}
> +
> +/**
> + * drm_sched_free_job_queue - enqueue free-job work
>   * @sched: scheduler instance
>   */
> -static void drm_sched_wqueue_enqueue(struct drm_gpu_scheduler *sched)
> +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
>  {
>  	if (!READ_ONCE(sched->pause_submit))
> -		queue_work(sched->submit_wq, &sched->work_submit);
> +		queue_work(sched->submit_wq, &sched->work_free_job);
> +}
> +
> +/**
> + * drm_sched_free_job_queue_if_ready - enqueue free-job work if ready

This should be "if done". Please change this to "if done".

> + * @sched: scheduler instance
> + */
> +static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)

This should be "if_done". Please change this to "if_done".

A "job" is _done_ when it's on the pending list and its fence has been signalled,
and we free a job only when it's done, not "ready".

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
> @@ -310,7 +403,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>  	dma_fence_get(&s_fence->finished);
>  	drm_sched_fence_finished(s_fence, result);
>  	dma_fence_put(&s_fence->finished);
> -	drm_sched_wqueue_enqueue(sched);
> +	drm_sched_free_job_queue(sched);
>  }
>  
>  /**
> @@ -576,7 +669,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>  				drm_sched_job_done(s_job, fence->error);
>  			else if (r)
>  				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> -					  r);
> +					      r);
>  		} else
>  			drm_sched_job_done(s_job, -ECANCELED);
>  	}
> @@ -885,18 +978,6 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
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
> @@ -906,43 +987,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>  {
>  	if (drm_sched_can_queue(sched))
> -		drm_sched_wqueue_enqueue(sched);
> -}
> -
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
> -	if (sched->single_entity) {
> -		if (!READ_ONCE(sched->single_entity->stopped) &&
> -		    drm_sched_entity_is_ready(sched->single_entity))
> -			return sched->single_entity;
> -
> -		return NULL;
> -	}
> -
> -	/* Kernel run queue has higher priority than normal run queue*/
> -	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> -		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> -		if (entity)
> -			break;
> -	}
> -
> -	return entity;
> +		drm_sched_run_job_queue(sched);
>  }
>  
>  /**
> @@ -974,8 +1019,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
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
> @@ -1025,74 +1072,83 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
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
> +		drm_sched_free_job_queue_if_ready(sched);
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
> +
> +	entity = drm_sched_select_entity(sched, true);
> +	if (!entity)
> +		return;
>  
> -		trace_drm_run_job(sched_job, entity);
> -		fence = sched->ops->run_job(sched_job);
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
> -	drm_sched_wqueue_enqueue(sched);
> +	wake_up(&sched->job_scheduled);
> +	drm_sched_run_job_queue_if_ready(sched);
>  }
>  
>  /**
> @@ -1159,7 +1215,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	spin_lock_init(&sched->job_list_lock);
>  	atomic_set(&sched->hw_rq_count, 0);
>  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> -	INIT_WORK(&sched->work_submit, drm_sched_main);
> +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>  	atomic_set(&sched->_score, 0);
>  	atomic64_set(&sched->job_id_count, 0);
>  	sched->pause_submit = false;
> @@ -1282,7 +1339,8 @@ EXPORT_SYMBOL(drm_sched_wqueue_ready);
>  void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
>  {
>  	WRITE_ONCE(sched->pause_submit, true);
> -	cancel_work_sync(&sched->work_submit);
> +	cancel_work_sync(&sched->work_run_job);
> +	cancel_work_sync(&sched->work_free_job);
>  }
>  EXPORT_SYMBOL(drm_sched_wqueue_stop);
>  
> @@ -1294,6 +1352,7 @@ EXPORT_SYMBOL(drm_sched_wqueue_stop);
>  void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
>  {
>  	WRITE_ONCE(sched->pause_submit, false);
> -	queue_work(sched->submit_wq, &sched->work_submit);
> +	queue_work(sched->submit_wq, &sched->work_run_job);
> +	queue_work(sched->submit_wq, &sched->work_free_job);
>  }
>  EXPORT_SYMBOL(drm_sched_wqueue_start);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index e67b53c3546b..625ffe040de3 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
>   *                 finished.
>   * @hw_rq_count: the number of jobs currently in the hardware queue.
>   * @job_id_count: used to assign unique id to the each job.
> - * @submit_wq: workqueue used to queue @work_submit
> + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
>   * @timeout_wq: workqueue used to queue @work_tdr
> - * @work_submit: schedules jobs and cleans up entities
> + * @work_run_job: schedules jobs

Perhaps a more descriptive explanation could be had,

	@work_run_job: work which calls run_job op of each scheduler.

> + * @work_free_job: cleans up jobs
>   * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>   *            timeout interval is over.
>   * @pending_list: the list of jobs which are currently in the job queue.
> @@ -519,7 +520,8 @@ struct drm_gpu_scheduler {
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

