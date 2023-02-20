Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5AA69C691
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 09:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED2E10E5F1;
	Mon, 20 Feb 2023 08:27:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231C210E5F1;
 Mon, 20 Feb 2023 08:27:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGpX8d+W9CiYkaIcxiCkNvq2ti52zXeSG9DqcP2Hgpzpxc9fh5ejXCNGdtuTq7wedWxdzvnRT7IH79ajzCf4lfA+UyXt7Phr/+r+VSM8X+snKqmqRcnbiDjUYfFoLydsAoWmSC+bB8liOBesxgZBUZo7P9KsTZBse9XXqcVYlrfbMyTzFXbA+9pA7mkUQTWU4h3IFD2gRvjVxYTvKPvLiq3v4T9gNmLxwZ5RaxlTCb7MvTjyxIB1eK0thfTNjiiCiWhUheQa9/mpE32XaS+27fdmT87tFed2mNtNOitPEW5iGjX7IAGruHfuWDzvvv6yslyx1rb2vwqQNcPjMEBBKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=La9te35KdvZ3bAXoBV3kbWsqFrt3+Nxi70SvEbfaYy4=;
 b=de9NaoV8NyhXbqD9gdCMqYj8eTm2b8PiFp+aWFr42sWl2twnLaqIyUB7G3qmexVKLo90jGq982vktyoBiMGvzM4VJpikQKUFHQVyhgdIFAWgsE+2EPEcM5i+VEW7k3k09sKB2fBEzBHTdXqJeumaPigNBGKi3l9kUgn5JgUtcTSAgNrIM8iBJtFdnF4TBzFBkoAAKilQ2TE9l6q10wtT1hZ8csgNpylcDGEqRrY/bLX6z8oCvjEcreFoHMxwYIArgHQYkQV2Jnkbs1kjr9H2jdasrBJOFLmo073ibfYg7h8ROPPbtjvuP88u1oqRoDbdf5oX8xBUoRo5ITdZXOve+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=La9te35KdvZ3bAXoBV3kbWsqFrt3+Nxi70SvEbfaYy4=;
 b=zJE0wPdy1ANp0Yst22Bpw71FZkWA1TQ3dWs1fueC/y0FtNQx/PdKhDClsh5LCGwUbMm+3VKAheEphXEH7d1f99UO1C3qlK8F+4aHaYJic5MmfijC/OW7SpJXlaC1m8leRw0STdBq0uktym+eZ/4z3zSwYHYuL9Qyk+nz6EmEMc0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Mon, 20 Feb
 2023 08:27:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 08:27:55 +0000
Message-ID: <37ec0125-8d0b-7d87-321d-ed4c7c7b32a7@amd.com>
Date: Mon, 20 Feb 2023 09:27:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 05/14] dma-buf/sync_file: Add SET_DEADLINE ioctl
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-6-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230218211608.1630586-6-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA0PR12MB4495:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ffbabe9-32a5-4619-4b30-08db131c5d38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RtAFcl9i4O141V50LpxXhnQNCtBrQqjSeyv0EHOK9CvKntExvdPC8LZWUV7Y/6eu3ct59pTfEDye1stf4Ffmy6WzrFS8kWHMPj0xhJSlduUhS8CdsiNweNsYNME6U69m5/HNjs0xFV2wXEt9EIFPRaNPSXfZuik1z+Tq0VTRjeZefX18oGbcPGgXjLbHXW82H7CT5P9UNIPFHtlQmsCmWFRUno4xKkaz0w2OH/iA8dxvzPMlx8hzAVmBOIMX5b12EwGB0YiDCbGDyK4WHWnD3NB/A9j/R4Otcz0NLhpEEkS7HLU4hqLfD3RXpn4lVIplSk+D8bWK3NJPMVCu9N9Db56TVx0tQGmspVIVac1o17Ac9Vc3bDiaMaqA4qntXV0/n5SDC1AMAp2ooR8uej9ESd5RPMkU1WogIHH+GlgAMtNn/H3UwSViBdS28j6zZZMPWyQ2AdsqS4fdvcpAOUavy09TQQwH2j2VPUKivhD5hxvfSnSgXhUWTFOpOqbzbOJEu3Sf6yvFXXwmny31LYl+cvr4o2A9g2ErlOpIh8yLowAiTBPcn6WKy4Q/BUwASyS5QB3bEkjEgdOxIG5u1jtbuLWlx0sPc8E+sv65Ik0EO4fS9DxOa4vHNip0dxfqB3tXcIYxFrHohX27h6Bc+asP4q0OdLNIjm9lJCgjGmlVu2/CR0+wysd9KoDM59rUvNtC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199018)(186003)(2906002)(6512007)(41300700001)(31686004)(6506007)(38100700002)(6666004)(7416002)(2616005)(5660300002)(8936002)(478600001)(316002)(966005)(6486002)(86362001)(66946007)(66556008)(66476007)(8676002)(4326008)(31696002)(66574015)(36756003)(83380400001)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0ZEVC9NT2UwN1ltU0ROeDhEeWM4d2pvenQxemY4NndMV0NlRkd0MndJTEw3?=
 =?utf-8?B?K1llNm1DeTZmc0NOdDRWU1ZlVHEvZ3gvYmhGdWl6eCtyak9TbTdzS2MwQ1kz?=
 =?utf-8?B?N01qRGpndWhSYld1eVlIb2tGUm9VWmlXMDBXS3RyWjhxNDF6VTR0UEVnYlNp?=
 =?utf-8?B?UFlqUE9mckZ3L3JYdlN2amdRanU2ZzlPR0pyREdiWjhyVU5TVzA0dGdZUlpX?=
 =?utf-8?B?QWF5MnBkeXdHT25CQStaZ00xaHBRemk3UlZhQ0YvSGhEQ3I2V3Rua3Z4bkNM?=
 =?utf-8?B?ZGFIVURyRG5iM2VFTXdlTGdSSTlBU0ZMSWFLVmloOG42NW1yWmc4bTB6czFU?=
 =?utf-8?B?VDJBa2RhaXhsS3hxeThTQk12Uzd0QmJHbGd2RTJTbUFueFMyQzBhMkZvckM1?=
 =?utf-8?B?QzlFYmErc3R6SFNaZmVRWHppTmt0ejZuVHNEV1RocHVQOGFmb1hOOWduYzlC?=
 =?utf-8?B?bytuc3hiTEJyTlEvZWZvQ3hQazV2Nk5UaytwemJTb0dUbFFpU0RKd2VsSm1V?=
 =?utf-8?B?VE9NQ2NidjFDK2IzU3FwOStaNXJNZkVhR1F0eGdGMUxOS3BWbVFBMDN5aXZK?=
 =?utf-8?B?UmQvSjhnek9MY3FOWnloT0JxeWJXd0JwMmppQzl6bUNCcWliSldUV1NHeTc1?=
 =?utf-8?B?cFZ1KzJjb2hsNzV5VEFka0pBUzMwQTNqYnY0Zi8rc2QvRnJkOFg2MWltWWk5?=
 =?utf-8?B?ek1qRVROeG9QMFl2KzExVTEwakhrOExJb0xtNy9DaEV2VCs0SithVkFvQnkv?=
 =?utf-8?B?YSt5b011eHBQSGN0VEZNWVBHa0dTSFdRMFZ2WlROSThiM2NlaEFJVmJma1Ja?=
 =?utf-8?B?VHBjcHFUWnpIbGMvVkl2QUNmV2xkbnI1TUJ2amR6dGcvQ0IxaEJjL2JFaWJJ?=
 =?utf-8?B?aW4xb0VmTEh4ZDMwZjZqYXc2VDZSdGFXbjlzVXpJMldaTDNmM2pIamk0dDZ2?=
 =?utf-8?B?NExEaHcwbjkvclUzR2FmcHdxbjlJRUc2eVhqTmIyeUZld1BxeVVJb1JVSjMv?=
 =?utf-8?B?ZVhqSiszVU1CSzZ2WEw3TjdYNG94NDdXSlVNdkdhK3lONnZzbWhGbEt5VEVS?=
 =?utf-8?B?RkJCOG1JNFo3TFRhaTVhZTdmaSs1K3dmelM1aU1LQXhYMWMzSk9TWlZGSVgv?=
 =?utf-8?B?RnpmNzNpeWIwTnpOSTRWQkhQbFkvS1lTUUZOZWI3dEJvWVJiMDBqeUVLSmdI?=
 =?utf-8?B?SHVJYk9vaVNYS3RudEJ3WWxkekYyMVQ3QXg0Ly95VUdwWjVlTUVBSUVJVXZh?=
 =?utf-8?B?NXUvU1pOaG9KSjh6NEdtdFc5Z1Uwdi9QY25qaUgwQ3pQSTVvWUpnb20vZlJV?=
 =?utf-8?B?NXB1bHFaTnZiWXNRSzN6ekRsL0RRcklKMkFla1UrTWtIWCtFemtLSFYvL0E0?=
 =?utf-8?B?blZLR3FNcHRuU2hNTkswaFdPZkh4Z3VtRnI4OFlXNU5XR3lWN0poMkZ6dXNM?=
 =?utf-8?B?VmtFUklYeGVZempRMGZHQUx1SVhhWjdxZ3o2dTJxQllFQWF6K2xXSm9oaHR1?=
 =?utf-8?B?d09zSXVHK0lLMUwrT3R5S2xZbTJTV1JCSlpyRGF0by91YzhRRm5EUG5jdExU?=
 =?utf-8?B?eWY4eUUwbzBXR3lrREhDbFI3MGY4RlRnUmtyUlRncks1eXZUMWpUTktxTERS?=
 =?utf-8?B?ZGd2bEd0bUZxNVdFbXRRUG80K0FaaTgwRnBuWG05TklJZFpEc21FV0wwZm9r?=
 =?utf-8?B?K1VPZFN4N2JJMTdDS2ZnT0hFQnlFSGJGeEdaOWc0aStkMmlQZW5qVHdFdWR5?=
 =?utf-8?B?QUtWMjU2QW5HMUF1WE0yd0tSVUw0c3pIc1BZdmVUMityTGhqTE56b1IxY1gv?=
 =?utf-8?B?WkpEZWxTZzlzcHFTZnJ5MGVsRVZiblR2azV4RWczWjI0NFcveFloaHEvOUFy?=
 =?utf-8?B?MUk3YVhhdUVVd2gwdlY2Zlc4aVJFNWxjc0xoMzA0M3JQeTV5UUtpcm1DZGFr?=
 =?utf-8?B?bnBxK3E0ZkhFZDNmdGtES2J4b2Y1aVZlZm5SYlZjM3ptV05ZSEp2aDArb2tr?=
 =?utf-8?B?NnJhWXNMUWJnTmZ5ZnJ3Qld5VEVyNDJweVRrMjQ3RjI3SzZBRENnS1YyZXdr?=
 =?utf-8?B?VTBzZVZDRDRqTHU3UW9Tcnd5ZmYvdTdUQ3hTZW0zb0hWTDVlQTZsSnJ5cG1L?=
 =?utf-8?B?YURZVkh3UDhGaG9DdlFJOFhDaVozN005cktuQVRac2RIRFR1UlNpaEplYllW?=
 =?utf-8?Q?HjfNAqvEGO+ESL4duNmGYayMPWwpHzdurdQJnUL9Idpo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ffbabe9-32a5-4619-4b30-08db131c5d38
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 08:27:54.8914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xNSiDsBtNdBeswBoyXxmR+fKFyhwZyb0yRHMYVNdg5aDFSLv9YsMYZryLNjwcLg2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.02.23 um 22:15 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> The initial purpose is for igt tests, but this would also be useful for
> compositors that wait until close to vblank deadline to make decisions
> about which frame to show.
>
> The igt tests can be found at:
>
> https://gitlab.freedesktop.org/robclark/igt-gpu-tools/-/commits/fence-deadline
>
> v2: Clarify the timebase, add link to igt tests
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/dma-buf/sync_file.c    | 19 +++++++++++++++++++
>   include/uapi/linux/sync_file.h | 22 ++++++++++++++++++++++
>   2 files changed, 41 insertions(+)
>
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index af57799c86ce..fb6ca1032885 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -350,6 +350,22 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
>   	return ret;
>   }
>   
> +static int sync_file_ioctl_set_deadline(struct sync_file *sync_file,
> +					unsigned long arg)
> +{
> +	struct sync_set_deadline ts;
> +
> +	if (copy_from_user(&ts, (void __user *)arg, sizeof(ts)))
> +		return -EFAULT;
> +
> +	if (ts.pad)
> +		return -EINVAL;
> +
> +	dma_fence_set_deadline(sync_file->fence, ktime_set(ts.tv_sec, ts.tv_nsec));
> +
> +	return 0;
> +}
> +
>   static long sync_file_ioctl(struct file *file, unsigned int cmd,
>   			    unsigned long arg)
>   {
> @@ -362,6 +378,9 @@ static long sync_file_ioctl(struct file *file, unsigned int cmd,
>   	case SYNC_IOC_FILE_INFO:
>   		return sync_file_ioctl_fence_info(sync_file, arg);
>   
> +	case SYNC_IOC_SET_DEADLINE:
> +		return sync_file_ioctl_set_deadline(sync_file, arg);
> +
>   	default:
>   		return -ENOTTY;
>   	}
> diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
> index ee2dcfb3d660..c8666580816f 100644
> --- a/include/uapi/linux/sync_file.h
> +++ b/include/uapi/linux/sync_file.h
> @@ -67,6 +67,20 @@ struct sync_file_info {
>   	__u64	sync_fence_info;
>   };
>   
> +/**
> + * struct sync_set_deadline - set a deadline on a fence
> + * @tv_sec:	seconds elapsed since epoch
> + * @tv_nsec:	nanoseconds elapsed since the time given by the tv_sec
> + * @pad:	must be zero
> + *
> + * The timebase for the deadline is CLOCK_MONOTONIC (same as vblank)
> + */
> +struct sync_set_deadline {
> +	__s64	tv_sec;
> +	__s32	tv_nsec;
> +	__u32	pad;

IIRC struct timespec defined this as time_t/long (which is horrible for 
an UAPI because of the sizeof(long) dependency), one possible 
alternative is to use 64bit nanoseconds from CLOCK_MONOTONIC (which is 
essentially ktime).

Not 100% sure if there is any preferences documented, but I think the 
later might be better.

Either way the patch is Acked-by: Christian König 
<christian.koenig@amd.com> for this patch.

Regards,
Christian.

> +};
> +
>   #define SYNC_IOC_MAGIC		'>'
>   
>   /**
> @@ -95,4 +109,12 @@ struct sync_file_info {
>    */
>   #define SYNC_IOC_FILE_INFO	_IOWR(SYNC_IOC_MAGIC, 4, struct sync_file_info)
>   
> +
> +/**
> + * DOC: SYNC_IOC_SET_DEADLINE - set a deadline on a fence
> + *
> + * Allows userspace to set a deadline on a fence, see dma_fence_set_deadline()
> + */
> +#define SYNC_IOC_SET_DEADLINE	_IOW(SYNC_IOC_MAGIC, 5, struct sync_set_deadline)
> +
>   #endif /* _UAPI_LINUX_SYNC_H */

