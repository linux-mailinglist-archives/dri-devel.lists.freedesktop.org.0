Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE846B9A4C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8C510EA9F;
	Tue, 14 Mar 2023 15:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1772910EA90;
 Tue, 14 Mar 2023 15:49:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PeRTMQgRR+g/B/nahSv/mz21d/LJj/UYOXAEYO7XCi16sqG3/LxyqgG5Vgic/OWscJEQ7gcabQVhDxbttNnXSrWUH8nB1BV5M8KAkS+fvt6h9bztWBptwu5+v54q/CfHROr+JVdUiELQZ6+BjJ9TTxsKSOzVMdchx63RQfyefkq7TaK8ibYhmjfJIkDyigc8z2rk+mwErF9aGQ3vc+Qufvp0OI7RHVujRvkMoDM7YCeVfqZRpGR1bK1O7Drtr1alfMIXLFikgke/ngYKphlZPgNDyfg/fMIS/COgrKhKAX/fe6uOvgrXyv6god8PlMxinCl2x6AJyFjQ52zX3ZBI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/W9QJsG9+GGKCI7TTca+nfngTtgpkgBPI3dxuCavncE=;
 b=PMQA9Sp4vXdJX/TZz2ZsP5pJWq+3fvmjtDo0FOj1ZzxsIK73j4NsKOl9H/838+yiX2UJYegg4CyCxTXAAKLgpcfpDwNzA6Zm4bjKvpG8DEqGqMn4SiILt1ZzZWBPeS5wPbFgDvCnIg5nxYOGDIXdNUDi+WRP6E5/RRUYmqjJxAJahAcEs00vcQIEllzEDBSCINe9XAQYil1abfWKmCDpcSDBbNF+wSql7EdkeGqHYfUjKAVzieq2p59NgO8mUPjqukv3rvb48EFlNecS6Y89Bu8UJ5SUc/1g9L/rqUStYdLzHpczrIrxNl6cA8UIS2EH8m5GENBW/Paew7Iwvn3+bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/W9QJsG9+GGKCI7TTca+nfngTtgpkgBPI3dxuCavncE=;
 b=jPPpqf7OuWgWo3fx3Z3ILJ6XZ44+x5fqmtvpjqYLSCOkKJM8atUnQbAEhqDNO0kesmdyKUOK8vWrV8CWjknkFjKrAzb1sS/6N41AtIpvRCjSfAnSpXgDu7dfkbsSTQ9yg7+9sXeo0H8FrblNtUDj+0ZkPKI6TYyMmJ1lcGu3kms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL3PR12MB6644.namprd12.prod.outlook.com (2603:10b6:208:3b1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 15:49:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 15:49:34 +0000
Message-ID: <ad36d6c5-ea6b-74dd-3ccf-2562c7174dc5@amd.com>
Date: Tue, 14 Mar 2023 16:49:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC 02/10] drm: Update file owner during use
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230314141904.1210824-1-tvrtko.ursulin@linux.intel.com>
 <20230314141904.1210824-3-tvrtko.ursulin@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230314141904.1210824-3-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL3PR12MB6644:EE_
X-MS-Office365-Filtering-Correlation-Id: 745310ab-1e19-4a57-a886-08db24a3b4d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 58EJq312ZVdaRTkYw/9PCKqkSAjAAwgy7ah25LaK7PYztsIG6BhIszoHlUVM5OIJjekuYRxGw4SK7PDybeKhTIU5L9O788sasGt9PbC8OsuqnRMhLAn+5NYAtf5WJrwX7eckF0xCTRqtkArjQcQf1StzbxcOyp+g5DtDCkMRU1cTVCgP5hDKAOaef8vm7Opbefb6vnAxjxMK8hqipzP+7qzC9b4drbkJfNGifR3HliLNSBUeCJjQU+QVCQAxByjFnjVAQ8gmvhcO0dAGI/SYrj3tjMt3Ayej/2qyhNC8lJchJdqg9NZZPV968g5zXVyocfc9ijo9kxl5hkU8Tz5eER9z/ZnZoRSV4c5pZ3IibOGTrJZwSeoRM93ppGL3BDmO+esC/t81X2LFlfhCs2GPkwOvK3xiICuOzGD/NFWwEgrLkGAtqv8uH9hOgV8SMZHTHuSyIfdSNWfR9A1KOb7aSCojVDE7uVuSYzW+mz9e32gRW7+Els9b5jbOC+X4DWbBeMT1Q5NWBEIUFKtW53nFwocLWygysodg3GKSH5Ikd5ZJ0QvOidQkCg826clu/ZtMgEMBunN+Gzs0st7zv0+m1OQhpICZGBsKZCdmU84XPyUCzgKUtcWXFnRqMvW20hRY6gDFXqz1ZMXgjbVXwHGrDyjWnwTrketLJHdxj5184TgZpOlV28vDexa+Oq70fdbI1pi8RTQvY5JxjFZFAV7GGzlxrhxNK07IyHSb/vlgeFA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(451199018)(6666004)(66574015)(31686004)(54906003)(316002)(36756003)(31696002)(38100700002)(83380400001)(186003)(6512007)(6506007)(2616005)(86362001)(7416002)(5660300002)(6486002)(478600001)(41300700001)(2906002)(8936002)(66476007)(8676002)(4326008)(66946007)(66556008)(15650500001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGFqOEx3UFdKa3F5YStCWW03cVlKVzBOMzZVa3RnSVF2SDZZZTYrUmhqdzVi?=
 =?utf-8?B?QlM2SmxhTGNSdVNSajlrODlQSTJBQ1cwRGJKTjI3WUw1WlIyWStyTFFmdzFW?=
 =?utf-8?B?UU44Tkttbk9PVngrUmEwTjBEaG56RDJLNDZod2JzNVlZZXJCZnFERzgwa1lo?=
 =?utf-8?B?MkNWQ3hENFA4TE9oVGJtTkpqa0NnTmErL0hiRVRqeDh1bGpLcm12eTF4V3pV?=
 =?utf-8?B?bFpRQk9vbmNacnpUL09qMDBsZk83V2ZUVFQzUzBkeFd5bGZiQ2htU2V1RzR1?=
 =?utf-8?B?NHdEZE81VW5WNmFYdm5SNzA5NXk4TzJjMUpEUjVaTEZITGNLMjdJUEJyNTBB?=
 =?utf-8?B?OWNJQ09HTk52ZXUrNW9wQjBzdkRNWjJXTFkvS0dBdG9qeFpuM09Vd0JHaTMv?=
 =?utf-8?B?dWRQSDAxY3FxKzdCWWlFL0ltZ0F5c0xEVlZlS2EvblIzTDFEd1VvcGJpdHB2?=
 =?utf-8?B?T1N0TXdNUEljV2hsek1OK3pndnNkZ3YwL2haUzI2SllXektKRVJhME1qLzda?=
 =?utf-8?B?VGplVDZSdk10VVRDV3VPSXdUV3VmMGNVbERTc2FSZk1xOFY0ejJJWFBYd1F4?=
 =?utf-8?B?WDQ2YjBtYUNNQ1lSL1RseXZqcmxVQWVRQjh2Wjh4OUJrcitkems2aVdEM2RK?=
 =?utf-8?B?aVpPWFB2QmdqYVFZdHhHSkVBWFY1cm1jcnI1a1p2TGYvck02TTE4dG1Ra2NJ?=
 =?utf-8?B?S3MvSzczaVVpbVBqaUdPM0dQMFNuc3Jkem9oNzFvS2NvT1BDc1piSGU2cnNQ?=
 =?utf-8?B?aUFKdjVxZVVvUWtudVNqYXR3czcrNnlrSlZ6UkFiTVF4cTZZeXBHWUs0NzV6?=
 =?utf-8?B?RHN3dHY5NjUzNUhHT2F1TzcxZ2FBNnB5MHBjcjc1YWVlMlRteHZiNis0NXFN?=
 =?utf-8?B?K21KRTBrdWZ1UXJHM0ZKOU5Dbm02aEM5L2JjTU5hTTQyVkVVeHFtL2xlU0pY?=
 =?utf-8?B?cHNWcXpYeHQ0UU1sVEx2ZGlvSHl5RkFBbE9BNFBOWVRBWEg3am0zcks3RHJO?=
 =?utf-8?B?U3ZOYnVVV1J6U0hhdG16RG9aVGhIeSt2Tkx4ZzFTU2hsWU1MNlAxMVBKTXRR?=
 =?utf-8?B?YzBUM0kwZ1NIeCtqRkZTcG95SVhYSlB0aXdOME1uK1YzTkt1STk3WGxlTGRa?=
 =?utf-8?B?clRUZVFQZlNJdFVjQ0ZDckc1Qzh4U3IvR0ZVL1hNVmRCRGNITVFtRUhvNTRR?=
 =?utf-8?B?aEZ6UFZMSENCd0JsLzZKSXRnakpaUDUyblA3ZStRSXJxeXVkaXVISEE5UGNL?=
 =?utf-8?B?NGk1eHBEN1hHUnJoTzZ2LytWL1lKM3pYUXhuekl4dnFYLzFsWU1Cb3JnejBv?=
 =?utf-8?B?YWpFMmQyMlNMMGFSa3hReHJpVmw3UUhWU0VuZEI2NDY5VmIvbmliYnhUSmEz?=
 =?utf-8?B?QUVxTURwR2pEaWZXd3BPYUlzb2d5VEpqWG9SWFF2RXFYM05lL2lhTUQ1QTBW?=
 =?utf-8?B?bDZZYUVmV3lMYnJnZXY3SDRTZ09jNG9kQWE5WUJXWmgxUlFabGFwR1hUcG5R?=
 =?utf-8?B?YmFuUkRtOEdWOCtOWVZxRmZQSkNhcGdkV0l3THVyVjJjZ3BZNzl5NFNDY3lE?=
 =?utf-8?B?TlZQWkNHR1BjejhJSlNyTVRHdmRuYmJwT0JmSXhXM3V5ekROMUYxNUo2VkQr?=
 =?utf-8?B?dGxIcjZqNHZRZXp2SUVvT1VUd1ZwNG9DZnA2MkJKUklGTzB1c3JvL1YrTzBl?=
 =?utf-8?B?ZWdpNS8yL0MzMkFBQTVKMnR5a1dUbUdGMG00dEx6ZVhiNE1QdHB3bmpLK1Bq?=
 =?utf-8?B?MUhQZDVYSm5ZRnUrZzllcUJaMzdEM1BYQ1lVNHZCVzg1RlhUSVZSVDlCeHBj?=
 =?utf-8?B?cWhCcjVNekpDdWsrUTQ2SjFsWGFqR3loZUoycFU5K2VmRUxJaGRvSi9vLzJG?=
 =?utf-8?B?UytkQ2NHZzNTczRUMUtRdW50aFZPbmZLYzVFU2xTR2dCeVhheitrZWhyM3Q1?=
 =?utf-8?B?M0JzQkhaREFMeGZVMzd2ZWxjZmppc1liNVl2MHdhV1hIQ1ZPbjBEcERpbTlk?=
 =?utf-8?B?WjBYNDV0UU5UQmF3a1hJcUwrKzFtb3ZOMGRMamdTcEVPd0hHdFpjdnpWajNF?=
 =?utf-8?B?RGtCMkZUTk5QYkZ4bmIzd2VYaVpBSHVsTE5zeTJmVm9KRjlXaXJCL0VwS3lE?=
 =?utf-8?B?dDBmTkUzSjBweXhjdmp6WWtaYWs0VlQ0WHBNR0huY3I5elhSU25iMytvTzFX?=
 =?utf-8?Q?ky0rkn+8VP360/opTo3LuY+xCn9R9NJlaUR2sxxrzPUs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 745310ab-1e19-4a57-a886-08db24a3b4d5
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 15:49:33.7102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WrofH8zjQzQmMLZvn+aBitG2Sb02Wz5kigEY9SqF+MeKVXTcjQ3MRenp6s+qjDx8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6644
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
Cc: Rob Clark <robdclark@chromium.org>, Brian Welty <brian.welty@intel.com>,
 Kenny.Ho@amd.com, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>,
 Zefan Li <lizefan.x@bytedance.com>, Dave Airlie <airlied@redhat.com>,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.03.23 um 15:18 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> With the typical model where the display server opends the file descriptor
> and then hands it over to the client we were showing stale data in
> debugfs.
>
> Fix it by updating the drm_file->pid on ioctl access from a different
> process.
>
> The field is also made RCU protected to allow for lockless readers. Update
> side is protected with dev->filelist_mutex.
>
> Before:
>
> $ cat /sys/kernel/debug/dri/0/clients
>               command   pid dev master a   uid      magic
>                  Xorg  2344   0   y    y     0          0
>                  Xorg  2344   0   n    y     0          2
>                  Xorg  2344   0   n    y     0          3
>                  Xorg  2344   0   n    y     0          4
>
> After:
>
> $ cat /sys/kernel/debug/dri/0/clients
>               command  tgid dev master a   uid      magic
>                  Xorg   830   0   y    y     0          0
>         xfce4-session   880   0   n    y     0          1
>                 xfwm4   943   0   n    y     0          2
>             neverball  1095   0   n    y     0          3
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Looks completely correct to me, but I can't claim that I understand all 
those nasty details around drm_master handling.

So only Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c |  6 ++--
>   drivers/gpu/drm/drm_auth.c              |  3 +-
>   drivers/gpu/drm/drm_debugfs.c           | 10 ++++---
>   drivers/gpu/drm/drm_file.c              | 40 +++++++++++++++++++++++--
>   drivers/gpu/drm/drm_ioctl.c             |  3 ++
>   drivers/gpu/drm/nouveau/nouveau_drm.c   |  5 +++-
>   drivers/gpu/drm/vmwgfx/vmwgfx_gem.c     |  6 ++--
>   include/drm/drm_file.h                  | 13 ++++++--
>   8 files changed, 71 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 863cb668e000..67ce634992f6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -960,6 +960,7 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
>   	list_for_each_entry(file, &dev->filelist, lhead) {
>   		struct task_struct *task;
>   		struct drm_gem_object *gobj;
> +		struct pid *pid;
>   		int id;
>   
>   		/*
> @@ -969,8 +970,9 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
>   		 * Therefore, we need to protect this ->comm access using RCU.
>   		 */
>   		rcu_read_lock();
> -		task = pid_task(file->pid, PIDTYPE_TGID);
> -		seq_printf(m, "pid %8d command %s:\n", pid_nr(file->pid),
> +		pid = rcu_dereference(file->pid);
> +		task = pid_task(pid, PIDTYPE_TGID);
> +		seq_printf(m, "pid %8d command %s:\n", pid_nr(pid),
>   			   task ? task->comm : "<unknown>");
>   		rcu_read_unlock();
>   
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index cf92a9ae8034..2ed2585ded37 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -235,7 +235,8 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
>   static int
>   drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv)
>   {
> -	if (file_priv->pid == task_pid(current) && file_priv->was_master)
> +	if (file_priv->was_master &&
> +	    rcu_access_pointer(file_priv->pid) == task_pid(current))
>   		return 0;
>   
>   	if (!capable(CAP_SYS_ADMIN))
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 4855230ba2c6..b46f5ceb24c6 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -90,15 +90,17 @@ static int drm_clients_info(struct seq_file *m, void *data)
>   	 */
>   	mutex_lock(&dev->filelist_mutex);
>   	list_for_each_entry_reverse(priv, &dev->filelist, lhead) {
> -		struct task_struct *task;
>   		bool is_current_master = drm_is_current_master(priv);
> +		struct task_struct *task;
> +		struct pid *pid;
>   
> -		rcu_read_lock(); /* locks pid_task()->comm */
> -		task = pid_task(priv->pid, PIDTYPE_TGID);
> +		rcu_read_lock(); /* Locks priv->pid and pid_task()->comm! */
> +		pid = rcu_dereference(priv->pid);
> +		task = pid_task(pid, PIDTYPE_TGID);
>   		uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
>   		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u\n",
>   			   task ? task->comm : "<unknown>",
> -			   pid_vnr(priv->pid),
> +			   pid_vnr(pid),
>   			   priv->minor->index,
>   			   is_current_master ? 'y' : 'n',
>   			   priv->authenticated ? 'y' : 'n',
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index c1018c470047..f2f8175ece15 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -156,7 +156,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>   	if (!file)
>   		return ERR_PTR(-ENOMEM);
>   
> -	file->pid = get_pid(task_tgid(current));
> +	rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
>   	file->minor = minor;
>   
>   	/* for compatibility root is always authenticated */
> @@ -196,7 +196,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>   		drm_syncobj_release(file);
>   	if (drm_core_check_feature(dev, DRIVER_GEM))
>   		drm_gem_release(dev, file);
> -	put_pid(file->pid);
> +	put_pid(rcu_access_pointer(file->pid));
>   	kfree(file);
>   
>   	return ERR_PTR(ret);
> @@ -287,7 +287,7 @@ void drm_file_free(struct drm_file *file)
>   
>   	WARN_ON(!list_empty(&file->event_list));
>   
> -	put_pid(file->pid);
> +	put_pid(rcu_access_pointer(file->pid));
>   	kfree(file);
>   }
>   
> @@ -501,6 +501,40 @@ int drm_release(struct inode *inode, struct file *filp)
>   }
>   EXPORT_SYMBOL(drm_release);
>   
> +void drm_file_update_pid(struct drm_file *filp)
> +{
> +	struct drm_device *dev;
> +	struct pid *pid, *old;
> +
> +	/*
> +	 * Master nodes need to keep the original ownership in order for
> +	 * drm_master_check_perm to keep working correctly. (See comment in
> +	 * drm_auth.c.)
> +	 */
> +	if (filp->was_master)
> +		return;
> +
> +	pid = task_tgid(current);
> +
> +	/*
> +	 * Quick unlocked check since the model is a single handover followed by
> +	 * exclusive repeated use.
> +	 */
> +	if (pid == rcu_access_pointer(filp->pid))
> +		return;
> +
> +	dev = filp->minor->dev;
> +	mutex_lock(&dev->filelist_mutex);
> +	old = rcu_replace_pointer(filp->pid, pid, 1);
> +	mutex_unlock(&dev->filelist_mutex);
> +
> +	if (pid != old) {
> +		get_pid(pid);
> +		synchronize_rcu();
> +		put_pid(old);
> +	}
> +}
> +
>   /**
>    * drm_release_noglobal - release method for DRM file
>    * @inode: device inode
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 7c9d66ee917d..305b18d9d7b6 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -775,6 +775,9 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
>   	struct drm_device *dev = file_priv->minor->dev;
>   	int retcode;
>   
> +	/* Update drm_file owner if fd was passed along. */
> +	drm_file_update_pid(file_priv);
> +
>   	if (drm_dev_is_unplugged(dev))
>   		return -ENODEV;
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index cc7c5b4a05fd..57aeaf7af613 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1095,7 +1095,10 @@ nouveau_drm_open(struct drm_device *dev, struct drm_file *fpriv)
>   	}
>   
>   	get_task_comm(tmpname, current);
> -	snprintf(name, sizeof(name), "%s[%d]", tmpname, pid_nr(fpriv->pid));
> +	rcu_read_lock();
> +	snprintf(name, sizeof(name), "%s[%d]",
> +		 tmpname, pid_nr(rcu_dereference(fpriv->pid)));
> +	rcu_read_unlock();
>   
>   	if (!(cli = kzalloc(sizeof(*cli), GFP_KERNEL))) {
>   		ret = -ENOMEM;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> index c0da89e16e6f..a07e5b7e2f2f 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -232,6 +232,7 @@ static int vmw_debugfs_gem_info_show(struct seq_file *m, void *unused)
>   	list_for_each_entry(file, &dev->filelist, lhead) {
>   		struct task_struct *task;
>   		struct drm_gem_object *gobj;
> +		struct pid *pid;
>   		int id;
>   
>   		/*
> @@ -241,8 +242,9 @@ static int vmw_debugfs_gem_info_show(struct seq_file *m, void *unused)
>   		 * Therefore, we need to protect this ->comm access using RCU.
>   		 */
>   		rcu_read_lock();
> -		task = pid_task(file->pid, PIDTYPE_TGID);
> -		seq_printf(m, "pid %8d command %s:\n", pid_nr(file->pid),
> +		pid = rcu_dereference(file->pid);
> +		task = pid_task(pid, PIDTYPE_TGID);
> +		seq_printf(m, "pid %8d command %s:\n", pid_nr(pid),
>   			   task ? task->comm : "<unknown>");
>   		rcu_read_unlock();
>   
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 0d1f853092ab..27d545131d4a 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -255,8 +255,15 @@ struct drm_file {
>   	/** @master_lookup_lock: Serializes @master. */
>   	spinlock_t master_lookup_lock;
>   
> -	/** @pid: Process that opened this file. */
> -	struct pid *pid;
> +	/**
> +	 * @pid: Process that is using this file.
> +	 *
> +	 * Must only be dereferenced under a rcu_read_lock or equivalent.
> +	 *
> +	 * Updates are guarded with dev->filelist_mutex and reference must be
> +	 * dropped after a RCU grace period to accommodate lockless readers.
> +	 */
> +	struct pid __rcu *pid;
>   
>   	/** @magic: Authentication magic, see @authenticated. */
>   	drm_magic_t magic;
> @@ -415,6 +422,8 @@ static inline bool drm_is_accel_client(const struct drm_file *file_priv)
>   	return file_priv->minor->type == DRM_MINOR_ACCEL;
>   }
>   
> +void drm_file_update_pid(struct drm_file *);
> +
>   int drm_open(struct inode *inode, struct file *filp);
>   int drm_open_helper(struct file *filp, struct drm_minor *minor);
>   ssize_t drm_read(struct file *filp, char __user *buffer,

