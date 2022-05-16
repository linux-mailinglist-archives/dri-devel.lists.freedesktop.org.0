Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C4E528BCF
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 19:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFE110F4C9;
	Mon, 16 May 2022 17:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9457F10F31B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 17:20:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzjDMYQiqPGjqFt1IVc67vHn7BfiQZSQ6MeMwT9f3KQMeo3cyRpjFtVsyJ5yCnZLWLeJIA54IQuPg1riQJNIUUGjOaseRzYgT4vdVuZxQTBqR+lz/HQwA9kOOH4RQAvX2T0wBtvoxnc86pmTQPrXze5T0gANXUjXI60VVt8SBiTvpGuY31QlK2dZI+AYZYEYUgOSteemJUpbUQ1J3J5Vzo3QP9mjn1/cbGxvsli/h7QOISqEfvl2i5ZOsHl78O6etaXH+NFAsPjrtIc677H2twSUVJYYrKWeiioqNymLK89PILp1qaocmps5OeVaR2r1bKPNjD0QALBohmevU4B2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykweTy+4wpNn1b0vPQBpmE6yVXTtG+z27eWyLDQ2Fss=;
 b=ZE8016unWcy3DMMp/QSRTeBgxQ/Oy5IivUlbVX8DLyVOXNRAiwuUr6uPG3H4krNq0qFGTqspEOek6mloeYtYtf81PkcFdXgsScc6S6ZsOmRMmlVuPRG6TwNz/c7bYYLtVmIEKoz4JbTZzOwN3gJxoXAYqVwnXRc6HIdD6OyQfiD2O/5ttugGNb0vWC2NV/9LnqsNgBaxtlTBPLBgm6Xp/VK01jvbpwEYsb8+NyjBDvPhVHgtnZe/zelG8faL0zfRAd1TMDaC6U6+5nqx5QKVynNPlGOa7WW2GBuPLn4VnqGQrUsrWtxYPRYa/6oMmCtlkIBj8WVY6to0X5hWybyLOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykweTy+4wpNn1b0vPQBpmE6yVXTtG+z27eWyLDQ2Fss=;
 b=j3Sde60i9DlG60oQvEIJO7MUYsuyUGsh5Z/ihHrH3xYaAAEfCfpHk3smCX+i1CD009XVaw/iol3Mk0AX6B7BV/EOBJaUY50usbUIUvZWkZBisAkVa6B+vM4CcaJtRxwY0NP8ysRglhzm6BGMiQypgWIvS5Bq2iQ3U4tsAiUXMEo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4002.namprd12.prod.outlook.com (2603:10b6:a03:1ad::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.16; Mon, 16 May
 2022 17:20:22 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 17:20:22 +0000
Message-ID: <175c5af3-9224-9c8e-0784-349dad9a2954@amd.com>
Date: Mon, 16 May 2022 19:20:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] dma-buf: Move sysfs work out of DMA-BUF export path
Content-Language: en-US
To: "T.J. Mercier" <tjmercier@google.com>, surenb@google.com,
 kaleshsingh@google.com, minchan@google.com, gregkh@google.com,
 jstultz@google.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hridya Valsaraju
 <hridya@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220516171315.2400578-1-tjmercier@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220516171315.2400578-1-tjmercier@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0116.eurprd04.prod.outlook.com
 (2603:10a6:20b:531::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0553a340-127a-4799-8f9b-08da37605bbf
X-MS-TrafficTypeDiagnostic: BY5PR12MB4002:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4002E300D2CA491157BC07F283CF9@BY5PR12MB4002.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BaRzFkoPLiPRc7CDUQHnBHeHKcxmARW3QpisGPEnGxmZL48GJRTqnoWzA6UzXuNi2kSeKM/2B174B+4W1nNtgHbLv7swEU4ZhRZggFqF01jf5I4hWt2HJWV3KeJnkPALqlKd4wUNQdgr5cmA8QR6ISFMgMatdGftf8onza/fP+UGK+5Ik79Qs53Z57AKNrUa2zeXPTq4k66wx4mwNey0m1/wrQMBu/NtLXKmPgo++DbuPNu0GlDiYAQ73p+QUZ0ojQQ7h9dlUJtV6txYWXdY3QhUZ+xcyjdc0nwnlQtDhQWkj8KSOnm1qCJxtfUJbF4K8XeSP48CsQWtejY6mjiZuWaTvujmEuhGbrm0J757uwCpjso6K/Rv9S8X33vw+sMuKMJuGcaS4dEWuMpw9JqVGx5qLfWSh4nXOOjqS5/y+MZAEMXf5q1KTTbzyQvnuUJyjbFFYwMEnalxep5gofVBd2Z1+/fkN1w9KS06Tn5fm70j4t9ayPQhK24y4EGmnrxmllF+Giku6J2nV7pDQbAosSrC1yga8stsN/chbtQlNurTT6OXiDIvCdQvzD7qGCLXUS8WEGctEb1m1za5R7um+GxkzYaCqGgrg4A749sS9P0nuWIVfOEKoJfJfyTIYU0L+ju0a04yyrChQQ5nFVS/Y6L7g3eXz/ijh6oOyJ4hWcmzXm6H07SQbQR7yU3ie73WJp/mL7+iXbVCOSpHM+5D3UYQgkqJZlcv1sfHD6Y4q8f/XNam7Vmr7gUe2cV4l7PTS59eEXrIyvNViQsLasg56evlHqzxn418bIKLchmSuRbwYKaKvtk1XadupPA+IA28zeJ4zQ+ttNKGEM70DBa4A2uD88F5jRFfF0pFaqb0dSk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(36756003)(921005)(6486002)(966005)(8936002)(5660300002)(45080400002)(110136005)(186003)(6506007)(66574015)(7416002)(38100700002)(508600001)(6666004)(66556008)(8676002)(66946007)(66476007)(4326008)(2616005)(316002)(6512007)(83380400001)(31686004)(86362001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmxpUUJxcHRQeTY2dkZnLzJhVU0xQ0UzTE41cFFhay9kUCsvWjB3MUtsY1hZ?=
 =?utf-8?B?RzhoZGE4U2dHV0NSS3kvWVJZc01FaTZOcjloWEVTbEoyd0pva1g3SjlSUjFK?=
 =?utf-8?B?NHArRStFWWRNckxjeDJTZSswUUVYTWhQWGZaS0Q3aUFpRWJIZk45aXVCL0Rm?=
 =?utf-8?B?WG01MHZNalo3UDJEYkIxTWQyTWFJcjB2MEJPSCtBVUR3MlpwV3o3T1NBa3R6?=
 =?utf-8?B?d0V5d3BoQW13djdsbHNDOTV4UUt1NDFGRVZqL3lnLzljMUpkT3hyYk9YMlFx?=
 =?utf-8?B?NmZOdS8yR1V0MVlYZ0VSRFZ4N2FmNkRGRE11Z0F1RnlvT2NVckZYUkN1RERZ?=
 =?utf-8?B?aHVReXdGbDVtOWUrU1BwaWN2b1VOaU81T2xUclVjYmRCS1h2S1VKTVFKOXcr?=
 =?utf-8?B?TkNxQUxJWVNhN0dZd2d5M1pZZXlDM2FnY1NPTUlWNzkrZk8waldyT2xudFVj?=
 =?utf-8?B?NUt2ZGtIc09wSHc5VHJFbFhBR2hNc0hZSU9kUGJ3WlhUT29yRy9kTEwyVVNW?=
 =?utf-8?B?Vno1MzVwaUZPM1IvTktnOTBOVzlqOWxSanRsWFJ5ZHVTZGlDVjZLZkNBamFh?=
 =?utf-8?B?VTJaWk8rQ3pkRkRJMVhjVEdtWWJKWlEwL2dNbUE2SDI1MUFUNG4rVW5RUHJa?=
 =?utf-8?B?VVc1R1pIVG9CZjB2ZnBYZStlM1NqcFNzd1pJQ1RFL3E0OWppZG5tcTFqeThC?=
 =?utf-8?B?cy9HZURmT3lraFkrNkFJLzJHU0RRbUIyVHBPUE1ZdC9hTjlSZXBsSEZpMjRM?=
 =?utf-8?B?WmtVN3o2bkF2VWNDU0M0azA5bVM4MllHRGIyQklzN2RGL3NBUjZLOExnWFFr?=
 =?utf-8?B?VHNicGdmM3BGcmRVcWJPOCtJUldWSmtORDRBVzVLbWlUS0xvY0N4Ny9OK203?=
 =?utf-8?B?N2hhM1h5NWxvV0RYZzVUSVVQN3VLZG5HemlHUG9zai9NdHp0UVkreU5qQnl5?=
 =?utf-8?B?dS9nN09IWEJWNTI2c3lEUkk2Z0VteXpjSXJTQzZxTFJ4NHB6RXE0K1c2endS?=
 =?utf-8?B?LzdURjZFc05YQVVYS09ldnIyMkVscXFJUkhoRTRqMGk1aW1tdStSNTlIMXha?=
 =?utf-8?B?OWJ2QmIzY1ZSS3g5NFdMVkhEU3lIdy9IVm4vaHY2QUJSZDJITDZZenBYWGVF?=
 =?utf-8?B?dXhIdWZFSDg5OFR2V3AvWGlVbmdCOTY3Q2VRQWR3VTZySTZnTzgwTnJNNHMy?=
 =?utf-8?B?cCtzUmJxZC9mVCt6NmF5Z1dtWGVwaVR3eGxzNk5GOG41ZTVwNlZmaUU5V1dm?=
 =?utf-8?B?elhjK01NY0lEckpIWFhaSHlQbS84Wkk3T3VtcHRHUUhuU2hmN3R1Z3d6b1FR?=
 =?utf-8?B?QW5ZdStRU2pRNkFEQXI3NEQzMWtKMzFjbGFkUjFqUTRFYTVzei9xTUxTME1w?=
 =?utf-8?B?R2pObGhxbkFSOXZkZGt3V3c3VG9vbENESFk3TUEwMEZYbGRYMjdFUW4xaHAw?=
 =?utf-8?B?RGVnMldoajMrZXFIOCtjbzN5WmxaRzAxSFF4SjlzcFJRcmdlcldQK3V2bDZ6?=
 =?utf-8?B?ZVkwTmQrOHZ5WVpMTklnVzY4Yis0cjdkTXkwamNIZjZCUEhnUEJWdWRwdjQ4?=
 =?utf-8?B?SCtLZWZtT2ZiSlpPUU56a3lNRlBQU3F4K1dyMGtpc3NabUI5Mm1maG1pbUhk?=
 =?utf-8?B?b0ZEWURSZVJvSVhjbFVVcFFvbnFjK3RiMGZaTXJyL2RxUzU4bU1kT1F6M0cw?=
 =?utf-8?B?eWlBUFpvSFBwTlpuSEZsVFJZd0hKKzlBN3prU21vTE84cEhXdmVjbWZ4YThH?=
 =?utf-8?B?cGFrcEJ6aTYzT3ZCSUtjWjQzejNmNU1lUDY4TkxPRS9iYlJLS2NsTFRjU2tv?=
 =?utf-8?B?ZHZubmVrM0VJS01Ea2srazVyNk5xaDFQYzJxOGZmM012dUtOV01LM1pMK2J4?=
 =?utf-8?B?em5MbzVicExOZlhGdzRIYVB4SG5KRStQRVVHczVvdjd6YnZNUXQrc1MxcFVl?=
 =?utf-8?B?aXFFV0NxQmJvRXhVckp1a2RUdjJBK1lLZ0NmRVA5MTJtWll2aExFdHFaOW9Z?=
 =?utf-8?B?TDN0RDVoVXNrUDcvazMvUG43ajVEbncrU3gzblREVkRjMWlhSkxZR0RQZkE4?=
 =?utf-8?B?aHQzNnF5YTg2Zi91Tk1jRVQvM1ZxVHN1SUpic3ZnN2YrY0VlTzVCTVdTS1kv?=
 =?utf-8?B?RVJCMDdoMDZ3Mm1GcFo0R0wrU2xJS3B4MTdBODhuSVkzYzFvZEhTM08rS3B1?=
 =?utf-8?B?WVZ2NkI2bHJoUUUrMkloRVZCRmpxOE5MQ0VEcjdVaUx3RHBwa3BEM1l5cWxx?=
 =?utf-8?B?WU1RclR5a0J3ZmgrWTh6aU14SUdOZ1pLRENWekxobnpscmxtc3RMcXh1L1M1?=
 =?utf-8?B?NC9QMFlwS3phRVBHQ3hXVWxRdFc0dmdKb2NGZGxIRVpOQTByL0xYR0Vqb1Vp?=
 =?utf-8?Q?E923mDFBHSy11Z1frTF2H0lXvaEsft2E0vTicarFovwrt?=
X-MS-Exchange-AntiSpam-MessageData-1: FtrMN1kw0NULKQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0553a340-127a-4799-8f9b-08da37605bbf
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 17:20:22.3734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Adz6jkBqJw2DOgATrxLyOZZEaDTTuHRw50n7aqOpfEwHoKaPspcKDdTkOWrMQ+J4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4002
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
Cc: linaro-mm-sig@lists.linaro.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.05.22 um 19:13 schrieb T.J. Mercier:
> Recently, we noticed an issue where a process went into direct reclaim
> while holding the kernfs rw semaphore for sysfs in write (exclusive)
> mode. This caused processes who were doing DMA-BUF exports and releases
> to go into uninterruptible sleep since they needed to acquire the same
> semaphore for the DMA-BUF sysfs entry creation/deletion. In order to avoid
> blocking DMA-BUF export for an indeterminate amount of time while
> another process is holding the sysfs rw semaphore in exclusive mode,
> this patch moves the per-buffer sysfs file creation to the default work
> queue. Note that this can lead to a short-term inaccuracy in the dmabuf
> sysfs statistics, but this is a tradeoff to prevent the hot path from
> being blocked. A work_struct is added to dma_buf to achieve this, but as
> it is unioned with the kobject in the sysfs_entry, dma_buf does not
> increase in size.

I'm still not very keen of this approach as it strongly feels like we 
are working around shortcoming somewhere else.

> Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stats in sysfs")
> Originally-by: Hridya Valsaraju <hridya@google.com>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
>
> ---
> See the originally submitted patch by Hridya Valsaraju here:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.org%2Flkml%2F2022%2F1%2F4%2F1066&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C5575fa6126d74ca4315408da375f618d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637883180063393649%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=1PcZaUfsLhQZOW29yGUDxazzcyNoBrN2NjeN1Yb40hk%3D&amp;reserved=0
>
> v2 changes:
> - Defer only sysfs creation instead of creation and teardown per
> Christian König
>
> - Use a work queue instead of a kthread for deferred work per
> Christian König
> ---
>   drivers/dma-buf/dma-buf-sysfs-stats.c | 56 ++++++++++++++++++++-------
>   include/linux/dma-buf.h               | 14 ++++++-
>   2 files changed, 54 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
> index 2bba0babcb62..67b0a298291c 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> @@ -11,6 +11,7 @@
>   #include <linux/printk.h>
>   #include <linux/slab.h>
>   #include <linux/sysfs.h>
> +#include <linux/workqueue.h>
>   
>   #include "dma-buf-sysfs-stats.h"
>   
> @@ -168,10 +169,46 @@ void dma_buf_uninit_sysfs_statistics(void)
>   	kset_unregister(dma_buf_stats_kset);
>   }
>   
> +static void sysfs_add_workfn(struct work_struct *work)
> +{
> +	struct dma_buf_sysfs_entry *sysfs_entry =
> +		container_of(work, struct dma_buf_sysfs_entry, sysfs_add_work);
> +	struct dma_buf *dmabuf = sysfs_entry->dmabuf;
> +
> +	/*
> +	 * A dmabuf is ref-counted via its file member. If this handler holds the only
> +	 * reference to the dmabuf, there is no need for sysfs kobject creation. This is an
> +	 * optimization and a race; when the reference count drops to 1 immediately after
> +	 * this check it is not harmful as the sysfs entry will still get cleaned up in
> +	 * dma_buf_stats_teardown, which won't get called until the final dmabuf reference
> +	 * is released, and that can't happen until the end of this function.
> +	 */
> +	if (file_count(dmabuf->file) > 1) {

Please completely drop that. I see absolutely no justification for this 
additional complexity.

> +		/*
> +		 * kobject_init_and_add expects kobject to be zero-filled, but we have populated it
> +		 * (the sysfs_add_work union member) to trigger this work function.
> +		 */
> +		memset(&dmabuf->sysfs_entry->kobj, 0, sizeof(dmabuf->sysfs_entry->kobj));
> +		dmabuf->sysfs_entry->kobj.kset = dma_buf_per_buffer_stats_kset;
> +		if (kobject_init_and_add(&dmabuf->sysfs_entry->kobj, &dma_buf_ktype, NULL,
> +						"%lu", file_inode(dmabuf->file)->i_ino)) {
> +			kobject_put(&dmabuf->sysfs_entry->kobj);
> +			dmabuf->sysfs_entry = NULL;
> +		}
> +	} else {
> +		/*
> +		 * Free the sysfs_entry and reset the pointer so dma_buf_stats_teardown doesn't
> +		 * attempt to operate on it.
> +		 */
> +		kfree(dmabuf->sysfs_entry);
> +		dmabuf->sysfs_entry = NULL;
> +	}
> +	dma_buf_put(dmabuf);
> +}
> +
>   int dma_buf_stats_setup(struct dma_buf *dmabuf)
>   {
>   	struct dma_buf_sysfs_entry *sysfs_entry;
> -	int ret;
>   
>   	if (!dmabuf || !dmabuf->file)
>   		return -EINVAL;
> @@ -181,25 +218,16 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>   		return -EINVAL;
>   	}
>   
> -	sysfs_entry = kzalloc(sizeof(struct dma_buf_sysfs_entry), GFP_KERNEL);
> +	sysfs_entry = kmalloc(sizeof(struct dma_buf_sysfs_entry), GFP_KERNEL);
>   	if (!sysfs_entry)
>   		return -ENOMEM;
>   
> -	sysfs_entry->kobj.kset = dma_buf_per_buffer_stats_kset;
>   	sysfs_entry->dmabuf = dmabuf;
> -
>   	dmabuf->sysfs_entry = sysfs_entry;
>   
> -	/* create the directory for buffer stats */
> -	ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
> -				   "%lu", file_inode(dmabuf->file)->i_ino);
> -	if (ret)
> -		goto err_sysfs_dmabuf;
> +	INIT_WORK(&dmabuf->sysfs_entry->sysfs_add_work, sysfs_add_workfn);
> +	get_dma_buf(dmabuf); /* This reference will be dropped in sysfs_add_workfn. */
> +	schedule_work(&dmabuf->sysfs_entry->sysfs_add_work);
>   
>   	return 0;
> -
> -err_sysfs_dmabuf:
> -	kobject_put(&sysfs_entry->kobj);
> -	dmabuf->sysfs_entry = NULL;
> -	return ret;
>   }
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 2097760e8e95..0200caa3c515 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -22,6 +22,7 @@
>   #include <linux/fs.h>
>   #include <linux/dma-fence.h>
>   #include <linux/wait.h>
> +#include <linux/workqueue.h>
>   
>   struct device;
>   struct dma_buf;
> @@ -365,7 +366,7 @@ struct dma_buf {
>   	 */
>   	const char *name;
>   

> -	/** @name_lock: Spinlock to protect name acces for read access. */
> +	/** @name_lock: Spinlock to protect name access for read access. */
>   	spinlock_t name_lock;
>   
>   	/**
> @@ -441,6 +442,7 @@ struct dma_buf {
>   
>   		__poll_t active;
>   	} cb_in, cb_out;
> +

Those changes are unrelated.

Regards,
Christian.

>   #ifdef CONFIG_DMABUF_SYSFS_STATS
>   	/**
>   	 * @sysfs_entry:
> @@ -449,7 +451,15 @@ struct dma_buf {
>   	 * `DMA-BUF statistics`_ for the uapi this enables.
>   	 */
>   	struct dma_buf_sysfs_entry {
> -		struct kobject kobj;
> +		union {
> +			struct kobject kobj;
> +
> +			/** @sysfs_add_work:
> +			 *
> +			 * For deferred sysfs kobject creation using a workqueue.
> +			 */
> +			struct work_struct sysfs_add_work;
> +		};
>   		struct dma_buf *dmabuf;
>   	} *sysfs_entry;
>   #endif

