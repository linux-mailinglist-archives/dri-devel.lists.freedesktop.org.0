Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA62B6EC6CE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 09:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C31C10E287;
	Mon, 24 Apr 2023 07:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062.outbound.protection.outlook.com [40.107.96.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB4410E217;
 Mon, 24 Apr 2023 07:07:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXRaI2kCUbWYbEdG7xflMGzxdCsqje7m5bvEevUtSn+13SiaaLhgZYTf1fsC7Aq+3ZyiaRfKmr0wUjPepcB1nr8YSf7WepWH1VI9Tqh02xR3FrfsQbkR43UvDNo/s/zOMGqC9RQ93IncYYxAPgbD9IkVYzFoiwAGKe9ZZ0TAH6ZO64AJgRZP0TKEUl1zk4jROZoDHHspyWYOjOXKF9e7eqrmKZZwViWEPJFlrrTC+EDXFKhDiVOLfHRabjHkGfzCp1cb7fOUXuFfrAo8dnld7MFQTvzfK+Z9iahmtiIc2U4U0//ehUjXnGu1ZkgKGP0fAnmoKproh30WXpog9jD/Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpNBGrdokkydCBIl1gK/7Hn2VBcUenGXRQfpcjoEyUg=;
 b=QoTWGgIsRmUkYKxAVliQBltlnOLHUO6fHEhNrPWBjUq7gOcKGH3pOS7ait/udsj+9BOz82mrAUMwkm3ipw2+1JTdeYLJMWmCkNRbTob983hoo+hAwbLMmttl2VuxrD1m26yjqO06v1oq/U2xFYvCzrTUexSSqlmNjUBlG6P7oOin2wk5J+7mwTv7uDbxG0DGNwxhZxS7betcx9ZFOxdaKvD/iJPYOjcutm/ipIsTBYjMqfTdxplFpdSaHRJDnoeivWoA1j5Y9vfki2QNGHXMpwMVxPVH43XTWe5rDcBjUgAjYM2Ut2EttQalpEfaXeXXj2NV0B8wvhI1ai/h9wgaeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpNBGrdokkydCBIl1gK/7Hn2VBcUenGXRQfpcjoEyUg=;
 b=TywVTUX967UYpQxRzPf2yATHZ+xlSlxN8IhgIkk7lVJfJLV8ubYGObM+buMP4KUxwbUs0yyfmZdC1L547WAyu/OXlk4dO4ZqLDLTw9RfUS7sY7RY/Y4cG2+YgCpcDmN2y+H7mhV7zAK/Bxx5sgUbGPowsRa+vOa2Y/rKbw9/Jpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB6744.namprd12.prod.outlook.com (2603:10b6:806:26c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Mon, 24 Apr
 2023 07:07:09 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 07:07:09 +0000
Message-ID: <ecc972c1-cf7d-cd99-805b-38dbf04adc79@amd.com>
Date: Mon, 24 Apr 2023 09:07:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm:amd:amdgpu: Fix missing bo unlock in failure path
Content-Language: en-US
To: Sukrut Bellary <sukrut.bellary@linux.com>, daniel@ffwll.ch,
 airlied@gmail.com, sumit.semwal@linaro.org, Hawking.Zhang@amd.com,
 Julia.Lawall@inria.fr, dri-devel@lists.freedesktop.org
References: <20230424055910.15683-1-sukrut.bellary@linux.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230424055910.15683-1-sukrut.bellary@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR0101CA0050.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB6744:EE_
X-MS-Office365-Filtering-Correlation-Id: 806e4d98-779d-499d-32a7-08db4492850a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hq3pI5sBYDmWj+UqNl7Td2VaPGmoyf79SSZN4lqkLnyvBbz9w/F4/wVb3HDy5cMbEMUBrWA5P6plIGWwKPycqJIIxYnjhP0Q3GLBrQYxQ9Fgm3UWf5GovAHoUcNnmqK/WiZQfLiZAOYx8oTwZDVSHD/vFIdyy3cWrRNTMzBE8ic6PWyN+EcRvW0kMv89iOL0JYwoPoWEPN+dteeqSwQjJ64Sk/Rld87pLyOWVRbezFya9P33HAX6ra+aZRHtoE7VRSSrpNu13Oat4Z2TO+J947iQdZeZq2fGrqQkEU+vaUYMgDaqaN0B17xxZTLmutia4s6Wfgmy3sjRv+tZ2L1WumFr/IoIbne1Y55mKlKr/OJORsnqraVfFu2MJR1DvoiBJPLDaaeKbPu+EKfenA7Dt0mK5slM3qQVQS3j+uU2VxjxuQtEnK8cIm7+txJWacno5jfsB/he/2fRRWJUhLc0BXQtwhIUwU6XRYReXenk1Llo5OYLv47UmPZrd48krXCROyKpms26H5wOrG1+eNkSP3utNZfK9vyb69n6cq+2cy47aTwEQmqyrayT3W2N74CQLDy+qPqTWThVdK/0b2J+w2JF7AyI/9PIz3aCOXg7Y/P+CHlcWR9RLRPw22N7bGOgYUH8OYsKy3J3UdYsxZhsrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199021)(36756003)(8676002)(8936002)(478600001)(66476007)(66556008)(4326008)(66946007)(7416002)(316002)(41300700001)(2906002)(38100700002)(5660300002)(2616005)(86362001)(186003)(26005)(6506007)(6512007)(31686004)(31696002)(6486002)(6666004)(83380400001)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXRqdElrUk5aYmJzRk55d3BVM1NmclRGNVdXeDdxRmZIUS9ZSHI1SndLU1hM?=
 =?utf-8?B?bjdTcG1PUVAvTG5pQkFzZ0NzM1RzaTRsUnNXejc5SFl6R21CZEFkdUE3UkJK?=
 =?utf-8?B?TWN3N2UybXZQQ3VRZVB4bmZKbjZWalcvK1pTWnVXQjdjZ0RJb1ZtQ3NYdUVU?=
 =?utf-8?B?c3FOR1lLY29JV3RFMm1KbEUvNXpXUWhpUno1aXpnL1VrQTAxYlZFVC9ZSzFk?=
 =?utf-8?B?NVE5WFIrTk9yYi82Y3ZUQm9MaUExOXEvSEpHdVN5U2c0VHNicExHQUVxd1VB?=
 =?utf-8?B?TnJiZU9uYm9DZURmMy9XSDRHMnZ4Qm0xYXUxbHhURkVpOHdjdmtiWGdVSW9z?=
 =?utf-8?B?RjNJSmRUOU9BeHRndzhVWktyUmtGZlY4NDNxWkl6MnFQaW1PZE5tVm1QdHV1?=
 =?utf-8?B?RXY3OCsyb01UZ2t2OUlWcGcvdUZJdFJ5M0JXOTZYY1R3a0lZbCttK1paeHlY?=
 =?utf-8?B?cW5ScEt1elZOTkJLR2VZZmRiOVgwT0lyaGwyM0xlWENlSTdGNGd0UlpRSTNQ?=
 =?utf-8?B?WGZXenQ2Z1hjNUljbFdZZWNzVGs1MWdSazd5N3AwSFlSZERCUVdCQXIvMmpU?=
 =?utf-8?B?V3FPNzFlMVBvMjZHYjlqd0FaQnRlRTduaDdWblVpZHdudmx4amcwczV1ZkFa?=
 =?utf-8?B?VU5mRkFWMGRpamUyclV5cTdxYzFHK1FGWWw1b2NaS0hMYUZLa1NFSWIxNlJ5?=
 =?utf-8?B?UXlVQmNmZUNGdlZhckxQVGJSaXc4QXdSZjFQdWNUUlVMc2pkQlFyaFJteHhU?=
 =?utf-8?B?eW95L0d3cE5nY1hyeElaWkErUThUUzFXeW9nTlVsZ3MzNnF0aXUrTE96bzg4?=
 =?utf-8?B?cGFheFhMcmlqWTFSa2JGQzlVblhlMUFXVlpBdXFQWnBVdE1KNjdESHp2RGZH?=
 =?utf-8?B?elEzNEJNaXpDZWE1cWxhVDVEb3FDUGp6c3ZiTXEzTTg2VzdySjd2SkZJVFhS?=
 =?utf-8?B?c25vamJXeTU4WXNSWkdmV2wwKytwZ2t3alN2WlRTZ2pWQlBxTnNTYWttV2R2?=
 =?utf-8?B?OEN0MFdRcldlczJ6L01RYndDRFFVcm1EMVpvTWlFU2VWdzk4dUx4ZTBtd1Z0?=
 =?utf-8?B?YUI2Z0x1ZGEvY3QrVTl4NDdQTXl5dnZqVjlzRlZFL2VocmxkM2pRVGZDZ2tu?=
 =?utf-8?B?bHVCUUdWeHljYWRjR2VZd2FNUEZxcGJNNk5CTTFPTE1iT3l4dWNnOExLeVlX?=
 =?utf-8?B?NE5HZ1hIc0d5aE93TTdZc1Q0U3hoeTA4RkgxSVpKcjFFNjA0ZnN3WlY5VFNK?=
 =?utf-8?B?V1RqSEVMbnJKaGd3Q1ZML2o4cFZDZnJSMi9TOE04cVY1Skw3dlhOYm9SQ1oy?=
 =?utf-8?B?cmtjR2ZxaS91WTZWN0l5c1FZeGpWMS9Db2ZNczlKRC9KUDZLZTJRSE92blVI?=
 =?utf-8?B?b2tDTERwcExzVFZJeVlOdWdSQk5CUzFuWGFtVW53TEt5bE9zWUZFYkNyQll0?=
 =?utf-8?B?N2doeFQxLzBkdnpsNnN4aXJUYisvMjNyak5rbi9lcmozU0tHdjdqellPSUp6?=
 =?utf-8?B?bFVYNnNsNDJ5YTV2Mkx1QlA5R0VQci81K09DeE5NZkN0UHRhbWF5aDhWVVlX?=
 =?utf-8?B?eURWR2NCS2FYQlI0OFZqZFVWc1dMQTFVQWI3SU9FanNYNWsvNTh6UGFiZTdw?=
 =?utf-8?B?cVlMc3dhV0NkaEl0OFpKYy90RmxLanVTU0FuTzE1UmtBclFYcVpYdG9xWTBa?=
 =?utf-8?B?M1gvYlZLejdlOTU4UzdpT3BSZHhrVE0yNTlMYnkxaWZoV09idk5hNXBXakND?=
 =?utf-8?B?bW13YWViR0orVTNyUjBnY0NKa1hubmhKTkcwaWNMaHJ1czJJYWo1QkxPNjV3?=
 =?utf-8?B?RlU5MlJaSVpRTVMvSzMzWmc3WkZXZGN2a0JiRGpiTFBvZ1BXcGYxaXlYYVVw?=
 =?utf-8?B?SXhnc1dhS3VNQ0taN0lySUo2eFptdzBYR09IbTg3VS93KzEzek5NOHA5cFlS?=
 =?utf-8?B?eUdETS9rOFcvaWZqd0tIYUJtRFdRS1dkNmdUTGRxa2MxcFh6NnR0SDFNNW1s?=
 =?utf-8?B?RFE5Wk9BcXdxaVFERnRnVVhOSzZ0UGZiYnF1WnduUlUycm9USC9UMkhvbEdp?=
 =?utf-8?B?bnZsMStCZER2Y0FqeHJ2alE1KzY1WDRySkplQ0U5NVZpUjN4eXBCRzZnLzIz?=
 =?utf-8?Q?8khU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 806e4d98-779d-499d-32a7-08db4492850a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 07:07:09.3232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+K+nGjJfTgreM46x1b+QQdAKiQ+mQa5rg32FAu6JqyVnR60J/MRCv7IMUmqXoCf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6744
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 alexander.deucher@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.04.23 um 07:59 schrieb Sukrut Bellary:
> smatch warning - inconsistent handling of buffer object reserve
> and unreserve.
>
> Signed-off-by: Sukrut Bellary <sukrut.bellary@linux.com>

For now that patch is Reviewed-by: Christian König 
<christian.koenig@amd.com>.

But for the record mapping/unmapping the MQD like this is a very bad 
idea in the first place.

We could need to shuffle memory around for that during resume and that 
is not something we really want to do.

Christian.

> ---
>   drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> index 278416acf060..5de44d7e92de 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> @@ -4686,8 +4686,10 @@ static int gfx_v8_0_kiq_resume(struct amdgpu_device *adev)
>   		return r;
>   
>   	r = amdgpu_bo_kmap(ring->mqd_obj, &ring->mqd_ptr);
> -	if (unlikely(r != 0))
> +	if (unlikely(r != 0)) {
> +		amdgpu_bo_unreserve(ring->mqd_obj);
>   		return r;
> +	}
>   
>   	gfx_v8_0_kiq_init_queue(ring);
>   	amdgpu_bo_kunmap(ring->mqd_obj);

