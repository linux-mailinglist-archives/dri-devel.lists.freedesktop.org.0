Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9667C9262
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 05:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FD710E064;
	Sat, 14 Oct 2023 03:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::60c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFDEA10E008;
 Sat, 14 Oct 2023 03:04:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISC27+GbSiJXYzJX7TO7iu+Ywl8Nb2B3dEo2Mj9HBAqArayVidJku032kV9ZSOnKyNTo9SmVbZFC7FeeCnkYED/ENLgZW85kWKupHyekBHBw0O+H7LMhHrDPUlpeSyyVU5UzzusO+d1Tl9k25VS9MXOOn1tW6fynZrMmpQ8d0X/MUOnIbWUCcKpqY/fx3QI0nAGoOhoCUgEDVbUVM9bmSCo5Gf2+8/miYVpqsmSv4qya+GLlibo8nBzEDDVc5hy3XFBahMefmj9OSXNQQMXiijtnkkPpjpq5AYZlwed+VwW6KV39aCtKLYO0AYWnpL0t4AHp0/DvCY2beQGUa7Uc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FrF6phLVtFuDJjFWGssY2EkwocvZ0kSdx5Q6J68Xjk=;
 b=KRE3XMVY4++hXg9k8PJLr/5Ce8Et1/YRzK4Vr+CCE9Jhzhd6L3hXtmJ97pDg3vogTXeSR4TArRNiLatmgxhYQ0EsywwDNz3UzHRM/Ltl3Ow7Xq2upYHv3VkU6SwETUurW/O0GZSpElBqqgv+DPgB63/HWlz2QyJt2vhdaXp8B8/O/iy947lpWwcY3FU/eGef+0djIuMCrpmH7WIyhTAvN66DfDGXS9og5B8axSYa4Yts2KfxW8oui8Yktz4R7O3N89k51XuIHEGMvyBU37oFT7vO0r5MjncvhuBYlOHkb1YHZHUL0Ns5gcUWIZN0iUtPshp8CzclXsm+CUgD1wJIyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FrF6phLVtFuDJjFWGssY2EkwocvZ0kSdx5Q6J68Xjk=;
 b=RiGLTuLx9SfbzBM/sZvUtkVVle/A1DfF/pXw3x+6524ECPuM9XXGJHou9WFlg9w/r8U8WtAzyML6c3PJqSqkCrX9ijJz5VIM3I+t9sLuK68rYR8rEeUq2bBkhvgg1xzF18U62gFontGf/YW79nXYH6PokyLdGagHS0ihq9nvbIo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DM4PR12MB5376.namprd12.prod.outlook.com (2603:10b6:5:39f::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.45; Sat, 14 Oct 2023 03:04:50 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6863.047; Sat, 14 Oct 2023
 03:04:50 +0000
Message-ID: <5bb39d18-f5de-4b74-b55a-6067b6166309@amd.com>
Date: Fri, 13 Oct 2023 23:04:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH v5 7/7] drm/sched: Add helper to queue TDR immediately for
 current and future jobs
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-8-matthew.brost@intel.com>
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
In-Reply-To: <20231011235826.585624-8-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT2PR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::23) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DM4PR12MB5376:EE_
X-MS-Office365-Filtering-Correlation-Id: c3fb2004-43ad-479f-2686-08dbcc625486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hVN23On4CdYUpnUneKMOml+iR+oFzlKybc4MYGSsg/wJDghznNZgAT0iw1RV8lUB+zXdELFMSZOy/PaNcqcxbVQa7vhj1mjsgidzP9fTLXcn5aln3hbOZZPYXcqlKLMMAyXbAyLtT2mXZ0sHtOdb8kDhmSzeD6C8T37DzwUKnlPsDroKn5Byyakv64K93QsgOvY7h1XndMlahAp1O4Ps48TIMSLMjBHiR0NeMAG5XVuovPvsGdE1raPtUGIhuj2SFKAJ+j4C5CywUbgs24krukfNrHFKvArPSbXAjSnFWPHnMA/xOywmK/0BhC7JiL0wg2gXdopwoQsTnAc8kCXlfI8DccHnXMKu1wZuzP+pGuYb5IhhtWPnf49i1RqhnyrrGkTX/FkC6pVRqtzqNdetXIyar7/IRShkByLTHiAKSSEcZop9R6kqt6i+UjfDguiY9DTzKEhcklFFQyzLHMMjRqd7BrAxfED5gmha1glXeU2HM3VRfI92e9zISe75eiIcYZvlmDyh14g7J5AD29nVI9SdozcxZQ79NK/W6afc9vv1TAI5bMUnLZ2ZVUZoBA29Dun4k7sHd2MllXojb1VMKFHJ92/y7yqiN86+xKBEqRxPCi2uLhndScdg3P2Hv8WCzAAZ4BRwhVSpOFofnCgOCtceEA8dsJLAqU9hNQIPmjc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(39860400002)(366004)(376002)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(7416002)(14773004)(6666004)(2906002)(6486002)(478600001)(31696002)(41300700001)(4326008)(8676002)(8936002)(5660300002)(36756003)(66556008)(44832011)(66946007)(316002)(83380400001)(66476007)(26005)(6506007)(4001150100001)(2616005)(6512007)(38100700002)(31686004)(86362001)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2lvbHlmVzlVdE4wRmpROXhrYXA2bDl6QTJqNjQydXdSYVRGa2ZPeFAvNXdQ?=
 =?utf-8?B?YkR2THgvUk11NnlwSmRjOGJFZy9OOVBnM3hSWjVVN1lVM3oxZnZ3NmYyeEtG?=
 =?utf-8?B?a2x1ZlUxRW55ellOZUt6Q2V0K0JzMFZ2SzEybm5rZ1V1VVNzMUhUcW1qeGFi?=
 =?utf-8?B?TFVhbUtERTdYSWJuQU5wRzhmQVZBS3lVU1pyRXM4TEFZRXZBcXREUE1OR3NM?=
 =?utf-8?B?VWt2eTBlcVV6aVhOM3RPck9ITHRaYzdqdGNCUDlkZ05ubGprWE00TkN5TDlG?=
 =?utf-8?B?WlRxbGVKdnBES25HN05uMlE0Z3pPbHlCOFdOaXR1TWN0WTE0TGtGZ3loeGlO?=
 =?utf-8?B?RERYM1NITUZvMC9yUUFqOXhkQy81Y2gwS21PNmI1UVZOdFFiWEUxSmNmVTVu?=
 =?utf-8?B?L2dzMDRENDRxRkwrN1lQbk85MHBJcmk1MElSZEd2Q3ptcDJlR2IvM3lNU01J?=
 =?utf-8?B?NVY2cU9tVGQ3bGxlRW9NNGQ0aUVteGYvNjJIeWNDaURrTEZ0U2FFdXByeFZj?=
 =?utf-8?B?WE13eStQSVJMWUlMSTBWZU10QUhMdWRlSlYwaGpQa2krSU1DbzlwN3FUeEI0?=
 =?utf-8?B?ZFVSazg0VlpkazYyQU9uTVlsUE84YjloN2h5bUFGSWVwV0VzNDg4WWFFdXQ3?=
 =?utf-8?B?dlA5TGFrdnpkMGNxSWwyMy83WHk4ZUVPWnpLNFNpM1ZycmNyYzIxSmRqbHFr?=
 =?utf-8?B?dG55LzhuKzF2SWNkekFBTGVQSjJvaWtUMjRKQitWeStGOFVJK0lPY2FqUUVF?=
 =?utf-8?B?aG1PV1RPeFdpQ3JVYzFDMHBQQklnZDl2bW5sSUdIVkJ2cjNrOUFLYytTSGph?=
 =?utf-8?B?YnBrdmE1K1pRcFVPcklCOEkwdFJoNXdMdVpIRlBDTTlTd3BoZnBHOUFQVnQz?=
 =?utf-8?B?L3M0Z1VvblRTS0ZBVUYyamRINVF6Z2RhckRDTHBpeGgxRHVTclNmY2hWaGl4?=
 =?utf-8?B?NUJxU0dpMWxqZ2VzL2UvZHluQUdodk10VFA0NVpNejlGWE5jK1JpNzZ6b1pH?=
 =?utf-8?B?Tkh3Tit0MnlDcjl4Szh5ZEpmbUFidEFneVptSTg5QUFiRlUrOEVSdUx3Rm1h?=
 =?utf-8?B?T0pHUmZQbG5RamJkMXkvbWJDMGhpamdSMmhrQ1plS0xKU1F6ZHV3amtPYzBM?=
 =?utf-8?B?cTNFSEtCZWMxS2dLZnAwamQwNWE2RkNoT2I5d0tOaVlZNFJ4MGVUUTVpbTZm?=
 =?utf-8?B?UHhxdHA5eWlTL2pLRmViN0Q4L3RzN3dpaEN0SVhaSU5aZ1JndjBzK2VyR0dy?=
 =?utf-8?B?UHVFNHNvUmd5M3JQa2hhWHRQNldJWmdiMzB1blJhb3lGU0lMMjhCa0tFR1pl?=
 =?utf-8?B?d2JKQXlmK2JESDFhRUNRT25td25IbmYyTUwvdzQySFExQnlTQ2hpQi9La2tj?=
 =?utf-8?B?dUVlTTBBY1Exa2J6Z2JNNUExMEtLVXQrNzBkUmlIL3ZiWTJvZTY3ZWpYNFIr?=
 =?utf-8?B?SDJBYmFiSUkvTHdoTUxtb21JQWJKYmJVVWo1Tk10bFUwZzNhZXRhcEdMcXpm?=
 =?utf-8?B?Qld3QnN5ZjVBcHQ2U2NleGlNaTJQTU1vN01xMVVmUTNnbFJtQTQrL2FFRXBP?=
 =?utf-8?B?YVVqdzlQOXQ4UjhSdXpVR3Y3UitXbElhSEx4ZnJ2bHR2V1Y0RDdhTVduWVZB?=
 =?utf-8?B?R05VZWhTNkh0RkROYzhCNldnV3V3VE1nKy9TQkNpSWxuNkRDWWcvY0JnSFY4?=
 =?utf-8?B?N0dEM3haSjlBOElNVXl6OW0zdGdHTkN1KzRLUCs2VXhpaUJBa1NNNnRPOFlz?=
 =?utf-8?B?bzV2U3NUVFdtOUloMm1wdHJsMytHQ2Vrd2RLTWpyRFA4WDZqMTNtbEdmdlV0?=
 =?utf-8?B?RlkwcmRzdUN0K3UwVkxJaFFGbU55Zk5IclBVaGFpaSs5ZldNdVY3V0Zod0NC?=
 =?utf-8?B?TDQ1dFJYd3Z5azB1cW9RdW5SZW9xZmFXRElvOTZlY1Q3d2lMVjVUdlJURVVx?=
 =?utf-8?B?czVKZmQyL242ei8zeFhLSVAzSjNoMkpvdTUxb2N3aitvb2tIOUFBcWVKK2JB?=
 =?utf-8?B?NkxJbTlYMlpoamFCaEpheDRMRWtnd3BnK1RDeEtuOTJZUm01NHMwcGxNeklR?=
 =?utf-8?B?TUdRUWxGeHBobU45VThKMFJqYUFaOVh1bFNGTVptTVBITEIyM0tnakNpQ1JV?=
 =?utf-8?Q?NEN7TqGww3vp75Zxs2PvTWWJ4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3fb2004-43ad-479f-2686-08dbcc625486
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 03:04:50.1592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RO1WxG8sBVyXpDXPZyL8ie9TKDKPn8ey5SR7qoxpyrdMv4zg+o0lyxnAUS6oMNcf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5376
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

On 2023-10-11 19:58, Matthew Brost wrote:
> Add helper to queue TDR immediately for current and future jobs. This is
> used in Xe, a new Intel GPU driver, to trigger a TDR to cleanup a
> drm_scheduler that encounter errors.

I think the best (most optimal) thing to do is to remove the last sentence
mentioning Xe. It is irrelevant to this patch. This patch is functional
as is, and worth having it as is.

So it's best to have just:

	Add a helper whereby a driver can invoke TDR immediately.

Also remove "for current and future jobs" from the title, as it is
implied by how TDR works. We want to say less.

	drm/sched: Add a helper to queue TDR immediately

These are only GPU scheduler changes, worth having on their own. The fact
that a new (future as of this moment) driver (Xe) would use them is irrelevant
at the moment. Other drivers (new, current?) would most likely end up using the changes
of these patches, and these changes go in on their own merit.

Regards,
Luben

> 
> v2:
>  - Drop timeout args, rename function, use mod delayed work (Luben)
> v3:
>  - s/XE/Xe (Luben)
>  - present tense in commit message (Luben)
>  - Adjust comment for drm_sched_tdr_queue_imm (Luben)
> 
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 18 +++++++++++++++++-
>  include/drm/gpu_scheduler.h            |  1 +
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index c4d5c3d265a8..f2846745b067 100644
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

