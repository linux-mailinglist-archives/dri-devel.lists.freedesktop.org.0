Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E8A7220B4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 10:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6008F10E197;
	Mon,  5 Jun 2023 08:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5449B10E197;
 Mon,  5 Jun 2023 08:13:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLdPN8xgzeNezD5btOSKq9HAUV3Y1YrcYukeAnmBqH4yGRPV/hWGa7TWybJVRQgfV6PwqK7T7b1GJojpH/gLgpNaUpVce2tVsWKqHPiOylo+RVbO9NsACjYIaQTvvNjXXGj3WxpKZViAmSA3NQGnX59CjfyimeCevrddt8LJj9WK9HU+WJXesZOFNRr0qYtJIzf/0mJAbRwpsAFn/CK3DSyGJICSGW5MDu1bTW9sdAf0f2r5R+MDLTPgsI1ppLw8tcR0dRag9QHjE5EwkFY8tgCJ/7J36FCLxhHHNpZaB2EZMZPWa83s0FUFQ1A1TbZfubQMMMdS3QV/ZZQS91FSqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HskrjQTHtVsKOxc3AhKTql+Wr/0OAstnXmFMD6ONbRE=;
 b=aLLAhYeCadWsS9SkE/QU5yphLWnJashxjGqAcVGuwJg9+PsmNqHHpirVGzntkjtjB66GjYud9gYTx9wXM1LMs4eZddFPHyQybro6/ZzQ4qblWmiV1sALeZLLzbBEcTckX3AsbNvWvxgwmikhtzNxdug/lR0QT9hGpYlNyIfiFxvKz/lc6P3qo7JPab+asELmVL4Oeh1i3xGO6Z4IMNxTr75oh5HmDnRvZ0dv+zQgBSuuTf07oZVFAVo4+bj1UQLE/xlVhH+UtNZDlkSx/ZObgVlxgCJ3Sm7hoesaP/Pz7s+oR635Iu2nVF9HeU508eMt9rjEFRLDL3ixkAaitQ6CoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HskrjQTHtVsKOxc3AhKTql+Wr/0OAstnXmFMD6ONbRE=;
 b=JzPmBqLmCt0bq32eJaoh+9W/EYtx9M9GE8bmcjT0UhHTw73dtN5GzcK9hEGmnP+Pd8Aye8rHNDiXW/zDXVs7QrSEw/X4eukchP6DWp2tYeSg9DXpVhdsaAVQFwqldSpNw/IdJzVqxuP1Nq3YcMT79mm9kJjwOk97rp632sRdFnY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by MW3PR12MB4411.namprd12.prod.outlook.com (2603:10b6:303:5e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 08:13:00 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::401e:2e7f:7c2b:6bff]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::401e:2e7f:7c2b:6bff%4]) with mapi id 15.20.6455.024; Mon, 5 Jun 2023
 08:13:00 +0000
Message-ID: <e337dec6-0b0e-7e53-e38d-ae1791b98418@amd.com>
Date: Mon, 5 Jun 2023 10:12:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/radeon: fix race condition UAF in
 radeon_gem_set_domain_ioctl
Content-Language: en-US
To: Min Li <lm0963hack@gmail.com>, alexander.deucher@amd.com
References: <20230603074345.17907-1-lm0963hack@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230603074345.17907-1-lm0963hack@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0199.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::16) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|MW3PR12MB4411:EE_
X-MS-Office365-Filtering-Correlation-Id: 07e04105-cc5b-4e5a-35c1-08db659cad3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GPJLOMH1CmRGCAxkA6+swQI1cAYpQA024v7OEsCsC1L9e3UOen8MhSMJ1rUXaQpQXR7DYmjZVV9uskmToxk9+rguJs2GM1Zx91K0cnL0cBn5YeB+yU5hP03KNwjpr7o0+QNuyKHgIIOVUf8lET1KkCq9cMgrnQGr0r7GGnrFF4USfuYZLmb5cwfzsGGpVykL1haZnikBimpBneuB53H9Djz/09dBqAotAvnVDZGM36xMiQuMZcrz/Fu2/wn4f/vtuGL+9VvrtcXK6+qOz3QZ0Zv8pYQB3TI851A/wQNp2HtbXGJ5dKJBJpLbeJgF1gfs9zPHxE30l1VHMQZv0XibDKfZAgEnb8iJRD6coa3+Jv7g58mu19DWZZMPXX/Gx6C7djgJIN1dDiylFbCqdlIIIZ8Cmsh+xdDvQmSVh2LKFq+6nBcTuZjFkg/T1tsX+7ZGwmDWvxcAUsFFM/LuVQbNYz5u2qKhThEPabw+zc2qZYPdRmleJa056q8CaLxAZA5CpIQofCaM6VbMLVZcY/zyMih6rxLb8qB64X3adqr5lA/xttWMoWC7fX8PiWzMvBZiYMIV+OkhRmfeJN4IWhQYT1yd43xacWI9JnCiFJUi2d1oP6UTktDbNsuXIQWvXd6dL1XssT2zfA6LUUHblCiqHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199021)(6506007)(6512007)(31686004)(83380400001)(186003)(2906002)(36756003)(316002)(5660300002)(31696002)(86362001)(41300700001)(8936002)(8676002)(2616005)(6666004)(38100700002)(66556008)(66946007)(66476007)(6636002)(4326008)(66574015)(6486002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEM3dWVnMHNPTTZwQUtwOVRManVnN1pablBBcXBNWE1uQ0VmOEdCOUM4S2xF?=
 =?utf-8?B?TUZlQVVTd2ZFNno2ZDJwQ0QzdFJvQmM0ZjAxcGRMTG1XRU95TjRBQnNmczZ5?=
 =?utf-8?B?MmdtczNIWWl5OVE0WDNmRXk4WkZEM3pXSkNBcDFmOFFya29zQXJLZ2tieWht?=
 =?utf-8?B?ZHNsWGlEUHp5VldubkJINEVIdFRQZlJTd0RCRXpWKzZLNHBhdkUwZTVWcUVB?=
 =?utf-8?B?UmNDS0xBTWpXTHNBazlqQSttZml4VVJqOEdMU3IzV2VsZGVEWjJjYVcwTUhV?=
 =?utf-8?B?Zm9MdjRnbXFHYXpmcCtTK250T0h1T09RQ3pUYituR3NGTVEyME9vdUFiTEJW?=
 =?utf-8?B?ZUkwbEJCTk9QTWNUL2JscmxjR0dTTjJ2MWh2UXZ2aW5RZFRmdFc5ZS9rcmFS?=
 =?utf-8?B?MmFLdVBDb2h5M2kzSzZBM0pJOTVYQXNQREZOdmF0cFgyRXljR0tiSE1RcWMz?=
 =?utf-8?B?M2VZaE5iZzJNSXZGSlEzajJzQ1NmclhVQnh0OUMvTVh1bEsyMkxybWNYNk9n?=
 =?utf-8?B?WTJRTEh5K1E0MG9jdk5iT3psSDhYdE9mNmlsMmF0VHdKbElJaU5BVG83VUF0?=
 =?utf-8?B?NTRDT1NnL1FCR2dySUNCUlZnTjAyN1NmWTRsc2IycHNrTUtSc21VMlZxaFNK?=
 =?utf-8?B?RmZ5RFlKWEh0S1lEdWIxMXFMZVI0S25Ec0J1MXBoSWRhQ2pPK1k5Q1dvQlVD?=
 =?utf-8?B?dC9XMU1Oa1p1RGdiVWxhaDRPTHNSUFloeTBlNW1GZnZ5eTNoVnRkZ1Jzc0V4?=
 =?utf-8?B?WUdRVjFWTTVjeVZqWk9NdmlLZEJxMmJTZ2NWVGhPVDJsaDBWQTRpcVc2azNC?=
 =?utf-8?B?TklQTGxPZU4vcG54Mnhrc25hYXpFNTU5NnlWc1ZPZ3JDb2d3QlJaNUN5cEtt?=
 =?utf-8?B?Vnh4K1Z5R3dnYjQ1UU40b3JLNzRxOThselB6Wkl2ZVdnWTNQak5WRytQZGs0?=
 =?utf-8?B?QytCZk1lVS9oQjNDWDBPeEZOU1BEVGpuNHJvTmhMbmJ1U2xlREdicWxxREtT?=
 =?utf-8?B?bTlqRDd0dzNoRFpUSk1lVXo5QmI4cW9XcHkrRTAxOENxb2Y3N2hRdW83WlFI?=
 =?utf-8?B?QkE0TTFmdjhFcUQ1QXVEekdQN0lnUzdGL3lweStrUHk5ODFqbHg5Mm5GYjlm?=
 =?utf-8?B?eGxuRSttZTFjTVA3OWFMdEVRMUNWWURmcG5PN2t4emtGU21iajhMcHEyUmJW?=
 =?utf-8?B?T0NzSzc4ck1WTDc1MWxaMW9ZU1NCNVdrUDY0VW51T1VyQnFvU0RYWGZZRzFC?=
 =?utf-8?B?S0tUZjF2WUVVWlN3QU9ZMkl3elgwNS85dDB0RGRPbnFOeHVwei9Pc2pUUCtj?=
 =?utf-8?B?WDhhRUNxREs5WFZRL2NMNlM1a0xrL05VSFJiV1JtVkhzRFlrNC9PN21FT29D?=
 =?utf-8?B?SVFTNjQzZTQzSlZPbWNWbERRaVhlVGY4RTJCYXlEVDFhOVNaSUR1U0hsR2xW?=
 =?utf-8?B?ZG94ODNSYUZxK0hvdEgyWTZxMDVldFVyOG41NjBtYkczZWp2MG4wY2pVZFNv?=
 =?utf-8?B?RTNadUgwNk11a0tCSXUxczU0Vk5uUExOdzN4TzFZdFdlTDlqWUtsQW9MNHE4?=
 =?utf-8?B?WmJ5d1l3Z0xGclJjZ3JqRG05U1YyR0xtQk9sOWJNaitzQ3RRWm9xZklWd1ZM?=
 =?utf-8?B?bG90S0RpUFVzNzRDZFJVMFZrKzRXUWdMZ1N0ejZYZGlFUmJPbDJzNENzQWRz?=
 =?utf-8?B?Y0d0eFk3c0wzVWpzRW9obS9xNE1CbkMzWm1JUlNmTEVmYU52cDFWWjczd2s1?=
 =?utf-8?B?ZWJ3emdUcHFHdFBEMlJ4QXp1TEVrV1JsSENJV2tUazhTVW90RjdNaUZQY2R6?=
 =?utf-8?B?S1ROcnY0OEhZcmxyQUxiK0xmc1RIbWx6OW5wTXRFU2F3WHh6Q2NhYjduUlFN?=
 =?utf-8?B?dU1ob2VSbTRxVEdGY2Y2SnZ4WFRjK2cyTHZ0VUdQZTFyM2xYN2pPWWF6Rllx?=
 =?utf-8?B?YXBPeXlzUXhyeDEweWxjV245QVVUL0tLY0VURWxKUk5GQUY3aExyV056WThT?=
 =?utf-8?B?THVGaCs5S1gzNkxoYWg2NjFMTE5zdE9RcmhhbjduNjhyU0xac3h0NkhRRFEw?=
 =?utf-8?B?dmVoMnJuWE5tZlV6em8zYitRNlR0ZkYwajlVNkhLQ0dyRE9RbjJyNHg3SXo5?=
 =?utf-8?B?a2s1bXNOc0RKMDhVZ0pNMWlLOUJXNzFyNXNGODBKeGkyQThpaGtscGF0NTA0?=
 =?utf-8?Q?0YWAKChRb6mvxZi+U8gh7pgXkN3P1OcSSMHJVPcON55e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e04105-cc5b-4e5a-35c1-08db659cad3b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 08:13:00.2127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ame2J5l14sSzO+urw3TissM/LGlgzlb71KTWjl07qOYfsTcf7SAyqNE8SF8Ns0KZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4411
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
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.06.23 um 09:43 schrieb Min Li:
> Userspace can race to free the gobj(robj converted from), robj should not
> be accessed again after drm_gem_object_put, otherwith it will result in
> use-after-free.
>
> Signed-off-by: Min Li <lm0963hack@gmail.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> Changes in v2:
> - Remove unused robj, avoid compile complain
>
>   drivers/gpu/drm/radeon/radeon_gem.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index bdc5af23f005..d3f5ddbc1704 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -459,7 +459,6 @@ int radeon_gem_set_domain_ioctl(struct drm_device *dev, void *data,
>   	struct radeon_device *rdev = dev->dev_private;
>   	struct drm_radeon_gem_set_domain *args = data;
>   	struct drm_gem_object *gobj;
> -	struct radeon_bo *robj;
>   	int r;
>   
>   	/* for now if someone requests domain CPU -
> @@ -472,13 +471,12 @@ int radeon_gem_set_domain_ioctl(struct drm_device *dev, void *data,
>   		up_read(&rdev->exclusive_lock);
>   		return -ENOENT;
>   	}
> -	robj = gem_to_radeon_bo(gobj);
>   
>   	r = radeon_gem_set_domain(gobj, args->read_domains, args->write_domain);
>   
>   	drm_gem_object_put(gobj);
>   	up_read(&rdev->exclusive_lock);
> -	r = radeon_gem_handle_lockup(robj->rdev, r);
> +	r = radeon_gem_handle_lockup(rdev, r);
>   	return r;
>   }
>   

