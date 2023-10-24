Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA6D7D461C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 05:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D373510E2D7;
	Tue, 24 Oct 2023 03:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A4010E2D6;
 Tue, 24 Oct 2023 03:50:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m85dFVwCSwsuvDbi1GIIxe6lV1bfRhaT2PIIef6q2Yw04tSJnEiFYO3b5dDF6oLE1pFQHrXtm1LoShMTJ4zJHV6An+OmzuxY+/+a7ONNnWkKjU7u5m8/wt8t4xctEdUQhK/LlzVDpEfWraJd20p+seW19XMUu0tu+mo3J9X0/2/e1GLHn0jWe6DqT22IIwfuh+hxv/t5xJ7nFDfLGoPmlG72VH2FQHWudLktqmnwvNHZgHiAP+k84s02oTi43xaiiyC29SKq3SZXIUYQSj+Pgv7MYp4nTz2IYWD+wkBagsERto01uwJEmtdUT196zwM9lZnYjN864vsCojWF5IaXNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXeM4PpsmAUXEUDXWLb8KqvKFRmnFZhFWenkgA4LL78=;
 b=UkBeKdE9KqccFWobLkWiT0f7mcVrDE9qCnj4bu0x8+EluzSedu0/Xj7Zg1vrM+8r8XarnLXqPpjgccUjXA3dahmc5eeXF8X8vSVYMFH2RYtR3e05dh/zhELgVCKTp81Nw2pHEJn/aR34E+rPzigKAAL8r09jqLW7ki4sk/MbrDvuRQxpgLQ+0edJc/0sREjZgU6hisVJ0MeA/3+q36A2jVBfqSYur/B9NZAkSJ72dFV9BgfPr1pvgAqzdXG0NNXTNCD3RjdXmtKRzuAdfN6iiJScfYiP9HVFWyi5lA4c1zRsJbOtwnellZnRhhWIkMB0S7GVSE3qOBXNhvghM2LXhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXeM4PpsmAUXEUDXWLb8KqvKFRmnFZhFWenkgA4LL78=;
 b=bnY7i7sJ4KstxfSSjKJouF/5Ht8+1QH0DT0bDXsQLLOVq5HHgJcEQxwL11kwOe3iHCs8NjiNaLKg2NLmtJW0UX2bJJRfwS05GpPQNXOFjZyTFwXCNvWgXdMqotn76yHCsASB8CPbltu5sEn10OqiiWGh+EE5cwyXl7gJTX9e1pE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DS0PR12MB8069.namprd12.prod.outlook.com (2603:10b6:8:f0::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.26; Tue, 24 Oct 2023 03:50:31 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%6]) with mapi id 15.20.6907.025; Tue, 24 Oct 2023
 03:50:30 +0000
Message-ID: <b0dff3c9-933a-42c9-97ae-7b82cf842799@amd.com>
Date: Mon, 23 Oct 2023 23:50:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.3
Subject: Re: [PATCH v6 4/7] drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY
 scheduling policy
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20231017150958.838613-1-matthew.brost@intel.com>
 <20231017150958.838613-5-matthew.brost@intel.com>
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
In-Reply-To: <20231017150958.838613-5-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0085.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::13) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DS0PR12MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: 382319a8-07d6-492a-b5ba-08dbd4445de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X8Xaslj7Qsw3kCE4ixoDW45PHd0RqoQ4DwFE4Q9+Wb54J+iJCLCRF8ExsokyUUK9HN2khaGkq11aibe0gOIGbEPVh6jh/p8r6/9ac/Yow3H67B3Yzqi+QNxD5dL0iXE0FHPw1c8ozt9G0eFC5kqjOoZP5dNIwLGNrK/CbClwOa5uOy6Dpwf6mLJEzCOuLJEV2JU2ygNSGAw7NSBEPE+sUzitoQc57PRv6VDZq9x1+OSOS1SHXNmHgxvWr167IIrkNqvuTmaIWezhWx6h6zQ1Rv3N5BtTWiryVCtYACBEqgefhLzSbAFuhOrrHQE6HY3qQ8mPo0qZQLsYYjENk+dnARDNzOT3lMIJJfuml5Hj0YQMEmfsM6LXgzw12B6s7COJgNW+qYBRoaeYhxqyQrQGiHa6S2pl/9YpJSTpraMMzsfeU/y0NFHs5hBKfmWr6asWDm8Duh5aEK5/SNKCaouvsdgQTMmmAM8oGlpgT8XJZpeTf0ddSAyOOORfiSwvHInokhpX+BzbCKDUp6BbZLRYnRuXPduDReDiEfo8DcLXpc9/Yau76qsuc47xgqJ85jytZFb8kjflUgkNy5ZbDBG6Aq9g2TkEq1BX9AzFDBETl1YG63aAoEz1Yk6egnCt56qqv9YMHfpkyi/qdFlX2rcSlKX75sYmwA4c4kns4S05coA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(346002)(376002)(366004)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(86362001)(31696002)(4326008)(66556008)(66476007)(316002)(8676002)(6666004)(8936002)(66946007)(478600001)(36756003)(7416002)(41300700001)(2906002)(2616005)(44832011)(6506007)(4001150100001)(38100700002)(6512007)(53546011)(26005)(5660300002)(83380400001)(6486002)(30864003)(31686004)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjIzaC9wK21BQ1NaQVdJblZvYnlpTUxUREtmVWV5WTF3UDhkb2puQTh0MVJ2?=
 =?utf-8?B?cFZoei9HbG05MUw5dGN0TTMvbEh1TWZOTERNbmdKZXpQdDJtNjVic0JXMElG?=
 =?utf-8?B?djc5eENaanRITVFndGg3YlVMZkVtdDRNQ0lzUDkyVkxlY05jbjJvcC9vcjh1?=
 =?utf-8?B?K3NvWDBJYXVleDcyVzllZVptekFQcEtOQWY2SnJ0TTB4T2Q3TnVjTHF3ZHZ1?=
 =?utf-8?B?d2RxZDBkQlA0bm1uSUdmYkk5akIzVHlaMDNhY0g3NFZTeWlTWnRoQUlJSzhF?=
 =?utf-8?B?bktZNFJta0ViU3EwYkNCTkpkdnc2NGZwR09jeXIrczVvVEEweE9kaEJMSEN2?=
 =?utf-8?B?SEJsM1Jaa1hiK3ozQkRHcFVXVXpRSTY4L2xJVFBWdTBhWC9yUGhMbXlyOGZP?=
 =?utf-8?B?bko4WTRpcEIvaGQwNjFRRWFBSi90Q3pNeHdzMDdJL3VLV21EemxsWEEzbUlj?=
 =?utf-8?B?TmVya0lqaU92QnRLV2ZWWHlyTW9OaUhIZWF5UEUyaFZuUHBqQlg3U1JBQ2sz?=
 =?utf-8?B?MWk2dnhwaFFscnVQNFBBUE94enlDVW9BWEM1MHNoMTJqeGFRT0I3UU5NQnZJ?=
 =?utf-8?B?bE04cThZM2tYcWd4K3JCa3dPdEc3VWRBZzJOaURBQk00TVlINk9aT2JRK3pN?=
 =?utf-8?B?YlNSbHJEczEza2l0d212cmx5cEtjanMzVjdPMjFlRFFqOXlRV0ZvN3ZwR0ls?=
 =?utf-8?B?N1BvL3E0NE4xR1l6ZTBRYzhDY3BTR0VkSzhlbHJaZURDOFQrL1Z0Tk9MZEtE?=
 =?utf-8?B?M2tQclBiMHpXcXFPMEhHVDNEMy8vOWtWOG1uOGVGcVFtallMVkMxOHRTWHZy?=
 =?utf-8?B?VWU3cU5HeU90d2dWYW5kbW8xc1NqYWJES0pkTFZ1YmtpVEhCLzVVR3dCRlo3?=
 =?utf-8?B?VnRNcml6S0R3ejVYU0xVWmJSdnJnSk82WUdmV1U5ek0vaFZ0d0F2aytGSng5?=
 =?utf-8?B?cXVtcno0K1FuZklFM3Jmb2s2UU1VL1JGOVhPQUk4VGdRMU9rNmFQYnZya0xE?=
 =?utf-8?B?eVRFM0s4bVZ0d2FGZ0FyQjJlWFIzTHIwV1JTdzJkU1p6QWh0NUNGK0JYL1lK?=
 =?utf-8?B?SkN4M0wrbFYyZlEwdHJ6dHRiZEt0WnlrNktjS1crNmtjK2poMFRaWk9VNFJy?=
 =?utf-8?B?Z0dWTGdLNXpJZUZpeHpkdms0SzhTTTZ3N3ZBWUJUZ1FydVJqRy9JbDd4YzFy?=
 =?utf-8?B?bXhTK0xySDlGaU5FL2Z3T09WRTdEN0l0NjNFWGJZWnBGaVFrM2RKdU5DSEVD?=
 =?utf-8?B?UVZ3MDUxYmVseDd5V1FhVVl5ZzRsdEZucThwZkFmRnMyR0lrUVVrRkVZM01l?=
 =?utf-8?B?ZUFWOTJjd1B0VURNTldrNkI2bVBpc2ZjbmhjamlvcEI5SFhZV283MTFFVzVN?=
 =?utf-8?B?TnJqSjk1NjNMMFpKYnZVekxNTXVxK3F5VHRJejMxcE56dWpIVjZYTytMMGJJ?=
 =?utf-8?B?L21UYzNDaVlRM1R2N3VWT2dFd0E4a0s3NjFYOWZiVVRYUEZEb0MwQkQ4bmJQ?=
 =?utf-8?B?SzlxVU50cUFGazRKQXhNSTZEUHNFZlk1MmVLL1dzdVlEQmxTNnVvcnVsVjVQ?=
 =?utf-8?B?TkFPL0JaNzVSZlV4c1pQL2t0UjgzTk1mSVk5eTJDMllQVCtmYWkxSFRaZCtE?=
 =?utf-8?B?dGxMbWFGblM2VFJKQVphNGhLblhEQmdZTmhvWnJUUFRLN1pjbUMrNHVIZ250?=
 =?utf-8?B?dkFmSEdKOVF6dHd1K3RDT0tEZ3VIbG5aa3IxdThWWkhJT3hETDZIVkNCMW44?=
 =?utf-8?B?NTE5UmM0Zlh2VDF5ejNPeUU3MklKSEFvTi9Jdnk5RTQ0Q2tpOXZySndsUER2?=
 =?utf-8?B?WDJRRlpvYllyek9yU0pWcmttaUJLZVpkb1IvZFdBUjR2VWhMY1YrR0tOUkNQ?=
 =?utf-8?B?SjFmSXJlR1JNdE5ra215VDZjbnAxa1luaDFmdWRnejVxeE9EVmZTejY5Q1U5?=
 =?utf-8?B?ZHhYM3lzakhyRUFjQnU3ekxFZ3M1NDB0NzFxTENmWHZwZldnMzUvYllJYTF3?=
 =?utf-8?B?VHI0RzY4WjNvMnQwVzBhOUpFRXRWZWNjUE5LMDF4TFpiMlN0Sm1FcjhPNHF2?=
 =?utf-8?B?eUROa1FtMTJ2bXhQZmtKTllZdUZzbFRyNmM3N0RwS0dqL01sR3k5ZUpQTllp?=
 =?utf-8?Q?OV9vq9WO0gQgYxkGr3R3n6Fbu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 382319a8-07d6-492a-b5ba-08dbd4445de7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 03:50:30.4532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NszJdzlvS1NPSXy4nddL7l7N/6LE7NRh9wNb2QlssFMjVwY8cvzmywlUXKydLSsk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8069
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
> DRM_SCHED_POLICY_SINGLE_ENTITY creates a 1 to 1 relationship between
> scheduler and entity. No priorities or run queue used in this mode.
> Intended for devices with firmware schedulers.
> 
> v2:
>   - Drop sched / rq union (Luben)
> v3:
>   - Don't pick entity if stopped in drm_sched_select_entity (Danilo)
> v4:
>   - Rework if statement in drm_sched_entity_init (Luben)
>   - Update comment for drm_sched_entity_to_scheduler (Luben)
>   - Reword a few things in DOC comment (Luben)
>   - Do not check sched policy in for statement (Luben)
> v5:
>   - Fix extra blank lines (Luben / Checkpatch)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 69 +++++++++++++++----
>  drivers/gpu/drm/scheduler/sched_fence.c  |  2 +-
>  drivers/gpu/drm/scheduler/sched_main.c   | 87 ++++++++++++++++++------
>  include/drm/gpu_scheduler.h              |  8 +++
>  4 files changed, 130 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index cf42e2265d64..940f63dd6965 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -83,6 +83,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  	memset(entity, 0, sizeof(struct drm_sched_entity));
>  	INIT_LIST_HEAD(&entity->list);
>  	entity->rq = NULL;
> +	entity->single_sched = NULL;
>  	entity->guilty = guilty;
>  	entity->num_sched_list = num_sched_list;
>  	entity->priority = priority;
> @@ -90,8 +91,17 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  	RCU_INIT_POINTER(entity->last_scheduled, NULL);
>  	RB_CLEAR_NODE(&entity->rb_tree_node);
>  
> -	if(num_sched_list)
> -		entity->rq = &sched_list[0]->sched_rq[entity->priority];
> +	if (num_sched_list) {
> +		if (sched_list[0]->sched_policy !=
> +		    DRM_SCHED_POLICY_SINGLE_ENTITY) {
> +			entity->rq = &sched_list[0]->sched_rq[entity->priority];
> +		} else if (num_sched_list == 1 && !sched_list[0]->single_entity) {
> +			sched_list[0]->single_entity = entity;
> +			entity->single_sched = sched_list[0];

To simplify the rest of the GPU scheduler design and generalize the logic,
we can do
	entity->rq = sched_list[0]->sched_rq[entity->priority];
where the "priority" is 0, thus having a single rq.

We shouldn't splice scheduler and entity, but rather make it so that
we can set the number of rqs to 1, thus resulting in a single rq.

(https://lore.kernel.org/r/20231023032251.164775-1-luben.tuikov@amd.com)

> +		} else {
> +			return -EINVAL;
> +		}
> +	}
>  
>  	init_completion(&entity->entity_idle);
>  
> @@ -124,7 +134,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>  				    struct drm_gpu_scheduler **sched_list,
>  				    unsigned int num_sched_list)
>  {
> -	WARN_ON(!num_sched_list || !sched_list);
> +	WARN_ON(!num_sched_list || !sched_list ||
> +		!!entity->single_sched);

We wouldn't need this check.

>  
>  	entity->sched_list = sched_list;
>  	entity->num_sched_list = num_sched_list;
> @@ -231,13 +242,15 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>  {
>  	struct drm_sched_job *job;
>  	struct dma_fence *prev;
> +	bool single_entity = !!entity->single_sched;
>  
> -	if (!entity->rq)
> +	if (!entity->rq && !single_entity)
>  		return;
>  
>  	spin_lock(&entity->rq_lock);
>  	entity->stopped = true;
> -	drm_sched_rq_remove_entity(entity->rq, entity);
> +	if (!single_entity)
> +		drm_sched_rq_remove_entity(entity->rq, entity);
>  	spin_unlock(&entity->rq_lock);

We should be able to carry on the existing infrastructure when
having num_rqs = 1, with dynamic rqs. So we shouldn't warrant
any changes here.

>  
>  	/* Make sure this entity is not used by the scheduler at the moment */
> @@ -259,6 +272,20 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>  	dma_fence_put(prev);
>  }
>  
> +/**
> + * drm_sched_entity_to_scheduler - Schedule entity to GPU scheduler
> + * @entity: scheduler entity
> + *
> + * Returns GPU scheduler for the entity
> + */
> +struct drm_gpu_scheduler *
> +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity)
> +{
> +	bool single_entity = !!entity->single_sched;
> +
> +	return single_entity ? entity->single_sched : entity->rq->sched;

It would be "entity->rq->sched" for any and all cases which simplifies things.

> +}
> +
>  /**
>   * drm_sched_entity_flush - Flush a context entity
>   *
> @@ -276,11 +303,12 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>  	struct drm_gpu_scheduler *sched;
>  	struct task_struct *last_user;
>  	long ret = timeout;
> +	bool single_entity = !!entity->single_sched;
>  
> -	if (!entity->rq)
> +	if (!entity->rq && !single_entity)
>  		return 0;
>  
> -	sched = entity->rq->sched;
> +	sched = drm_sched_entity_to_scheduler(entity);
>  	/**
>  	 * The client will not queue more IBs during this fini, consume existing
>  	 * queued IBs or discard them on SIGKILL
> @@ -373,7 +401,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>  		container_of(cb, struct drm_sched_entity, cb);
>  
>  	drm_sched_entity_clear_dep(f, cb);
> -	drm_sched_wakeup_if_can_queue(entity->rq->sched);
> +	drm_sched_wakeup_if_can_queue(drm_sched_entity_to_scheduler(entity));
>  }

We can carry on that too, without changes. The good part of that is that
we'll inherit all the fence work and checking for free.

>  
>  /**
> @@ -387,6 +415,8 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>  void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>  				   enum drm_sched_priority priority)
>  {
> +	WARN_ON(!!entity->single_sched);
> +
>  	spin_lock(&entity->rq_lock);
>  	entity->priority = priority;
>  	spin_unlock(&entity->rq_lock);
> @@ -399,7 +429,7 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
>   */
>  static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>  {
> -	struct drm_gpu_scheduler *sched = entity->rq->sched;
> +	struct drm_gpu_scheduler *sched = drm_sched_entity_to_scheduler(entity);
>  	struct dma_fence *fence = entity->dependency;
>  	struct drm_sched_fence *s_fence;
>  
> @@ -501,7 +531,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  	 * Update the entity's location in the min heap according to
>  	 * the timestamp of the next job, if any.
>  	 */
> -	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
> +	if (drm_sched_entity_to_scheduler(entity)->sched_policy ==
> +	    DRM_SCHED_POLICY_FIFO) {
>  		struct drm_sched_job *next;
>  
>  		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> @@ -524,6 +555,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>  	struct drm_gpu_scheduler *sched;
>  	struct drm_sched_rq *rq;
>  
> +	WARN_ON(!!entity->single_sched);
> +
>  	/* single possible engine and already selected */
>  	if (!entity->sched_list)
>  		return;
> @@ -573,12 +606,13 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>  void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  {
>  	struct drm_sched_entity *entity = sched_job->entity;
> -	bool first, fifo = entity->rq->sched->sched_policy ==
> -		DRM_SCHED_POLICY_FIFO;
> +	bool single_entity = !!entity->single_sched;
> +	bool first;
>  	ktime_t submit_ts;
>  
>  	trace_drm_sched_job(sched_job, entity);
> -	atomic_inc(entity->rq->sched->score);
> +	if (!single_entity)
> +		atomic_inc(entity->rq->sched->score);
>  	WRITE_ONCE(entity->last_user, current->group_leader);
>  
>  	/*
> @@ -591,6 +625,10 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  
>  	/* first job wakes up scheduler */
>  	if (first) {
> +		struct drm_gpu_scheduler *sched =
> +			drm_sched_entity_to_scheduler(entity);
> +		bool fifo = sched->sched_policy == DRM_SCHED_POLICY_FIFO;
> +
>  		/* Add the entity to the run queue */
>  		spin_lock(&entity->rq_lock);
>  		if (entity->stopped) {
> @@ -600,13 +638,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  			return;
>  		}
>  
> -		drm_sched_rq_add_entity(entity->rq, entity);
> +		if (!single_entity)
> +			drm_sched_rq_add_entity(entity->rq, entity);
>  		spin_unlock(&entity->rq_lock);
>  
>  		if (fifo)
>  			drm_sched_rq_update_fifo(entity, submit_ts);
>  
> -		drm_sched_wakeup_if_can_queue(entity->rq->sched);
> +		drm_sched_wakeup_if_can_queue(sched);
>  	}
>  }
>  EXPORT_SYMBOL(drm_sched_entity_push_job);
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 06cedfe4b486..f6b926f5e188 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -225,7 +225,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>  {
>  	unsigned seq;
>  
> -	fence->sched = entity->rq->sched;
> +	fence->sched = drm_sched_entity_to_scheduler(entity);
>  	seq = atomic_inc_return(&entity->fence_seq);
>  	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>  		       &fence->lock, entity->fence_context, seq);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 150e5330f0fa..273e0fbc4eab 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -32,7 +32,8 @@
>   * backend operations to the scheduler like submitting a job to hardware run queue,
>   * returning the dependencies of a job etc.
>   *
> - * The organisation of the scheduler is the following:
> + * For scheduling policies DRM_SCHED_POLICY_RR and DRM_SCHED_POLICY_FIFO, the
> + * scheduler organization is:
>   *
>   * 1. Each hw run queue has one scheduler
>   * 2. Each scheduler has multiple run queues with different priorities
> @@ -43,7 +44,24 @@
>   *
>   * The jobs in a entity are always scheduled in the order that they were pushed.
>   *
> - * Note that once a job was taken from the entities queue and pushed to the
> + * For DRM_SCHED_POLICY_SINGLE_ENTITY, the organization of the scheduler is:
> + *
> + * 1. One to one relationship between scheduler and entity
> + * 2. No priorities implemented per scheduler (single job queue)
> + * 3. No run queues in scheduler rather jobs are directly dequeued from entity
> + * 4. The entity maintains a queue of jobs that will be scheduled to the
> + * hardware
> + *
> + * The jobs in a entity are always scheduled in the order that they were pushed
> + * regardless of scheduling policy. Single-entity scheduling is essentially a
> + * FIFO for jobs.
> + *
> + * A policy of DRM_SCHED_POLICY_RR or DRM_SCHED_POLICY_FIFO is expected to be
> + * used when the kernel-mode driver is scheduling directly to the hardware while
> + * a scheduling policy of DRM_SCHED_POLICY_SINGLE_ENTITY is expected to be used
> + * when there is a firmware scheduler.
> + *
> + * Note that once a job is taken from the entities queue and pushed to the
>   * hardware, i.e. the pending queue, the entity must not be referenced anymore
>   * through the jobs entity pointer.
>   */
> @@ -96,6 +114,8 @@ static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
>  
>  void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
>  {
> +	WARN_ON(!!entity->single_sched);
> +
>  	/*
>  	 * Both locks need to be grabbed, one to protect from entity->rq change
>  	 * for entity from within concurrent drm_sched_entity_select_rq and the
> @@ -126,6 +146,8 @@ void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
>  static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>  			      struct drm_sched_rq *rq)
>  {
> +	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
> +
>  	spin_lock_init(&rq->lock);
>  	INIT_LIST_HEAD(&rq->entities);
>  	rq->rb_tree_root = RB_ROOT_CACHED;
> @@ -144,6 +166,8 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>  void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>  			     struct drm_sched_entity *entity)
>  {
> +	WARN_ON(!!entity->single_sched);
> +
>  	if (!list_empty(&entity->list))
>  		return;
>  
> @@ -166,6 +190,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>  void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>  				struct drm_sched_entity *entity)
>  {
> +	WARN_ON(!!entity->single_sched);
> +
>  	if (list_empty(&entity->list))
>  		return;
>  
> @@ -641,7 +667,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>  		       struct drm_sched_entity *entity,
>  		       void *owner)
>  {
> -	if (!entity->rq)
> +	if (!entity->rq && !entity->single_sched)
>  		return -ENOENT;
>  
>  	job->entity = entity;
> @@ -674,13 +700,16 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>  {
>  	struct drm_gpu_scheduler *sched;
>  	struct drm_sched_entity *entity = job->entity;
> +	bool single_entity = !!entity->single_sched;
>  
>  	BUG_ON(!entity);
> -	drm_sched_entity_select_rq(entity);
> -	sched = entity->rq->sched;
> +	if (!single_entity)
> +		drm_sched_entity_select_rq(entity);
> +	sched = drm_sched_entity_to_scheduler(entity);
>  
>  	job->sched = sched;
> -	job->s_priority = entity->rq - sched->sched_rq;
> +	if (!single_entity)
> +		job->s_priority = entity->rq - sched->sched_rq;
>  	job->id = atomic64_inc_return(&sched->job_id_count);
>  
>  	drm_sched_fence_init(job->s_fence, job->entity);
> @@ -896,6 +925,14 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>  	if (!drm_sched_can_queue(sched))
>  		return NULL;
>  
> +	if (sched->single_entity) {
> +		if (!READ_ONCE(sched->single_entity->stopped) &&
> +		    drm_sched_entity_is_ready(sched->single_entity))
> +			return sched->single_entity;
> +
> +		return NULL;
> +	}
> +
>  	/* Kernel run queue has higher priority than normal run queue*/
>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>  		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> @@ -1092,6 +1129,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		return -EINVAL;
>  
>  	sched->ops = ops;
> +	sched->single_entity = NULL;
>  	sched->hw_submission_limit = hw_submission;
>  	sched->name = name;
>  	if (submit_wq) {
> @@ -1111,8 +1149,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	sched->dev = dev;
>  	sched->sched_policy = sched_policy == DRM_SCHED_POLICY_UNSET ?
>  		drm_sched_policy_default : sched_policy;
> -	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> -		drm_sched_rq_init(sched, &sched->sched_rq[i]);
> +	if (sched_policy != DRM_SCHED_POLICY_SINGLE_ENTITY) {
> +		for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> +			drm_sched_rq_init(sched, &sched->sched_rq[i]);
> +	}

With dynamic rq, no changes would be necessary here--we just go over the single rq.

>  
>  	init_waitqueue_head(&sched->job_scheduled);
>  	INIT_LIST_HEAD(&sched->pending_list);
> @@ -1143,19 +1183,24 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>  
>  	drm_sched_wqueue_stop(sched);
>  
> -	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> -		struct drm_sched_rq *rq = &sched->sched_rq[i];
> -
> -		spin_lock(&rq->lock);
> -		list_for_each_entry(s_entity, &rq->entities, list)
> -			/*
> -			 * Prevents reinsertion and marks job_queue as idle,
> -			 * it will removed from rq in drm_sched_entity_fini
> -			 * eventually
> -			 */
> -			s_entity->stopped = true;
> -		spin_unlock(&rq->lock);
> +	if (sched->single_entity) {
> +		spin_lock(&sched->single_entity->rq_lock);
> +		sched->single_entity->stopped = true;
> +		spin_unlock(&sched->single_entity->rq_lock);
> +	} else if (sched->sched_policy != DRM_SCHED_POLICY_SINGLE_ENTITY) {
> +		for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> +			struct drm_sched_rq *rq = &sched->sched_rq[i];
>  
> +			spin_lock(&rq->lock);
> +			list_for_each_entry(s_entity, &rq->entities, list)
> +				/*
> +				 * Prevents reinsertion and marks job_queue as idle,
> +				 * it will removed from rq in drm_sched_entity_fini
> +				 * eventually
> +				 */
> +				s_entity->stopped = true;
> +			spin_unlock(&rq->lock);
> +		}
>  	}

Same here--we can keep the loop intact, we have a single rq and we just process it.

>  
>  	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
> @@ -1186,6 +1231,8 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
>  	struct drm_sched_entity *entity;
>  	struct drm_gpu_scheduler *sched = bad->sched;
>  
> +	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
> +
>  	/* don't change @bad's karma if it's from KERNEL RQ,
>  	 * because sometimes GPU hang would cause kernel jobs (like VM updating jobs)
>  	 * corrupt but keep in mind that kernel jobs always considered good.
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 320f0a720486..e67b53c3546b 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -79,6 +79,7 @@ enum drm_sched_policy {
>  	DRM_SCHED_POLICY_UNSET,
>  	DRM_SCHED_POLICY_RR,
>  	DRM_SCHED_POLICY_FIFO,
> +	DRM_SCHED_POLICY_SINGLE_ENTITY,
>  	DRM_SCHED_POLICY_COUNT,
>  };
>  
> @@ -112,6 +113,9 @@ struct drm_sched_entity {
>  	 */
>  	struct drm_sched_rq		*rq;
>  
> +	/** @single_sched: Single scheduler */
> +	struct drm_gpu_scheduler	*single_sched;
> +
>  	/**
>  	 * @sched_list:
>  	 *
> @@ -473,6 +477,7 @@ struct drm_sched_backend_ops {
>   * struct drm_gpu_scheduler - scheduler instance-specific data
>   *
>   * @ops: backend operations provided by the driver.
> + * @single_entity: Single entity for the scheduler
>   * @hw_submission_limit: the max size of the hardware queue.
>   * @timeout: the time after which a job is removed from the scheduler.
>   * @name: name of the ring for which this scheduler is being used.
> @@ -504,6 +509,7 @@ struct drm_sched_backend_ops {
>   */
>  struct drm_gpu_scheduler {
>  	const struct drm_sched_backend_ops	*ops;
> +	struct drm_sched_entity		*single_entity;

Right, as I mentioned above, we shouldn't splice up between a scheduler
and an entity sometimes, and other times scheduler to rq to entity--it just
creates too much thrashing about in the code, with too many ifs, conditions,
etc. Simpler is better--parameterization of the number of rqs.

Instead, let's get the dynamic rqs in, and this way we can keep much
of the code the same, inheriting fence work and checks, and so on,
without much changes.

Regards,
Luben

>  	uint32_t			hw_submission_limit;
>  	long				timeout;
>  	const char			*name;
> @@ -587,6 +593,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  			  struct drm_gpu_scheduler **sched_list,
>  			  unsigned int num_sched_list,
>  			  atomic_t *guilty);
> +struct drm_gpu_scheduler *
> +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity);
>  long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
>  void drm_sched_entity_fini(struct drm_sched_entity *entity);
>  void drm_sched_entity_destroy(struct drm_sched_entity *entity);

