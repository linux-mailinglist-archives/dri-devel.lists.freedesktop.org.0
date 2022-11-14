Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7132627A82
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 11:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613F310E029;
	Mon, 14 Nov 2022 10:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD3910E029
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 10:31:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kU9vgeBP5ZGbUENS/OdCy72/HM3cdP7S7ebE49vlXmgjaxrCc5jca5IzYuPbdKz6qNPkNbZnX8qRK8nk9kHp8wu7BaliFXhX2xVYooHhSd1HGYwg+2LBTOrrXqNrpxu21iEvmHvMLDnYvOtycHX5tCOrXHB0hczq/YnxYFmGCk+r0B0vgYf679B/6mmw9y3eLdD9SkhbWZrfz0BOJ5ShvZ3GNCEgH6px1T1Y4LTz8ZSyQZJA4H+rM6PV/JozQQ7zbW7U40xpiWIymM/fHh5ootFnW63yHT69rFFw80Dt+jwuY6eNIj1kHsO20YyurMPhGshq2CdOJ3uYyFyL1AGDNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yun0WosrTXQYlNCgPin2as0KwviZkW7LbNVZGrWSSE=;
 b=kbulI3CSTJWT+/z/R4ze/2gIBEvAxZOJGETjpEZrH///5W8OpikxdP3ES8Nc9ClJSV/E6PNMefY5qKxC5VhUK9kYJ0LaZdqPuj6qeuWLKIx15wpDByfbgdlgUaX/L1p9u5EiM8//zBZ4ep3RlBpdPLH/tk0D4U6+BBo8Vlx+l0RYB0IqdtbdNaMYNn8ihq0+4fcZj8+gXxaJTIb+V8mNnu8Nu0irC4LbicWWLF8zzouc2ke78NYuUbOxO/GhkRwAM6lA+Ovv7MmRni41bWMcu/U+cyqrE2IBAKlyWEk2vY7sORUzqdQyw6HsVx/4uvNZe2G6ruLC+zvLsOaO1KtVqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6yun0WosrTXQYlNCgPin2as0KwviZkW7LbNVZGrWSSE=;
 b=JHXRngWBK4M1fh+gkaDTl97JX/X2uFXL5a0gz0XCCG2bHUtlIdZdYRbaPB+TDI5BQmVhLpUmPPo+vEdcEwkdYYMQ9tUimtpIFjRx2+IRvzbYKvVhaZ+Vv9FmVP3VpaXKVIqt19bfUyPkVN7+BdyW2wpFx7Yod7BxQG3PL+OGCFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB6681.namprd12.prod.outlook.com (2603:10b6:303:1e1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 10:31:33 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 10:31:32 +0000
Message-ID: <dc7b30b6-951e-2f4f-13d9-aa393cc37dfc@amd.com>
Date: Mon, 14 Nov 2022 11:31:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1] drm/gem-vram: Fix deadlock in drm_gem_vram_vmap()
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Vyukov <dvyukov@google.com>
References: <20221113233850.427704-1-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221113233850.427704-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB6681:EE_
X-MS-Office365-Filtering-Correlation-Id: f90a3f40-400c-4c55-cae5-08dac62b660a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CvxtyVNmjnzYe5erIMgRwNkWPydF+Sg+Xg4Ao6bQ8rCGGdRDF18HBl5ZD65UUJ8ZsHVY0wbpHEmaV4TmCx2aCJ9kNZyYbSTJV01m6WCJR9c62S+p5zO5O+uQjSmD+naMWa6yG/tvA0ezdqF7ZawccJVOBFhKNB3b7uNA2yhjkbgs/GXV0TrHwnvC8BZ7G7LP1t0PGQ7XT00wUERYv3GxGMLCLxmZWIzdA17TL28HkTXvPUbS8DfQobDEWJThZ2mTGwIbDBsJ9QKJ+P8dLXB8gvPoC/rdzr4UFJ/AlZkM6rUR9KdkwARKYk1zVsefpJ0fvGeor3wl9TbmDDLQR6j/8ZB/B7KzzoasKnqS26oFcVJnGq3VeC0iJKvybMtc7YkD5wWVohQCBiM6RnBC7zYwC2y3MzuRHkbN4YIhhJXwchrq0P/0pf3J54MYbuQLfUbXk6XcFl1CV69PG88fnXKmPeumdMXhZAxZJNS6ZtBHlp5y9JluaPH6R3Y/R3XUO8tH4U7/miMx5Ik9Uls5sSIBej1d7fU7v5IM3qdogXcQOM2NbXMqfahYX0g4FPlVE9a692iRNKVNRyt+uLvsz96QcdIgah7mEsvGyWqweePg2QXnk7UYC2AGbtdhf2bD7EECYi1YJ7cBjOytYh+h+YkazNoZYpflKXyHtDkXt418ktLbwRVB2MrrHWhrHkfFUrrm8p9sNicILlQOt2cYw99RbJr7kwHznpuWw8rQ7AyWTePFvcuN7y4N7V4kouYesMZpfpd96v1gxMqF36xHqyQ5gQDkEck/c7KnuC5zoVvIv2E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199015)(2616005)(38100700002)(478600001)(66556008)(6486002)(36756003)(2906002)(86362001)(66476007)(66946007)(6512007)(4326008)(8676002)(26005)(83380400001)(8936002)(41300700001)(316002)(5660300002)(110136005)(31696002)(6506007)(66574015)(31686004)(6666004)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGxCS2N5ZEx4ajZUazBZZ3dEdHdESmFLV2tTZ2Jjb25QMURXQWxaQnk5QUN1?=
 =?utf-8?B?aFpkTTFJS2pzTExpeGs1Q2I3M2tFR2FtRlcxRW5hejZjRjJjNVhHb3NPcXdZ?=
 =?utf-8?B?enVxdVVoa09kZ29sa1RoK1QwK3VMQjVoOThvajZOczJWQmxyTG9CY1VkWi83?=
 =?utf-8?B?b081c3JlKzAySWxnN1d2MlZMUDN0RDNxMmxVTDVVdTZuMk1sM203ZDFjZW0v?=
 =?utf-8?B?VDAyUDZpL21QSDFYSkhxK3R4QTVaRGx5eGhjRHJWMlQzc1dHY1NlN2VUTGEx?=
 =?utf-8?B?azJudHUyemZ3K0JSZnZuVlFtb0Zmbklkd05PYnFZYk5GNFB3NzlHeHZ0UWN5?=
 =?utf-8?B?V0xhMVdCRnVEZkszamZKazRBbHlRSzVEMkIrLyswUEQ0YitFalhBcnJVY25h?=
 =?utf-8?B?RFVnL3RqZzJWSVhsSzRTTGxnZWRja0VIQ2FLNmUwZUhCcGJaT1hPMXN2c0lT?=
 =?utf-8?B?Y2lKT1IrWDdTVlczdi8xOSthZzl4R1Q1c0Z4TDVROW02UDVNc3FBTDBXcmN4?=
 =?utf-8?B?UUNkcmVDdmpQV1JCcnA0TU45STZjVzk1QlpSbGJDWHVQR0FYeUJpYjhVWi9o?=
 =?utf-8?B?Y3o2YTEzTFkwRnBrZTZGNlJlakRvbWlGR1hFU0tnbVZGUDhscGZzK2pMcE9E?=
 =?utf-8?B?MGszYlJyRzF3a3V6YTZqSUMwdTNIUVBnYU1JdldwNVlVN3NQZTYyVHloWloy?=
 =?utf-8?B?SWlXNlNIYlZObzFham5KcEV2SUFQSmRXNTV6TkZ1bnlPU250WXNKbFV4eVJw?=
 =?utf-8?B?NGs3V3Qxb090OFFDd1k0ZndBNXJMUDJmN2xCbFFWd2d4Q01ucUlKUXRxK3Zu?=
 =?utf-8?B?ZmJNOUFwTWRZT3ppL3hsaTZQd1B3c25WcFphU3MvYW41N080TFpwKzN5UlZh?=
 =?utf-8?B?Z29MMHR6Y1NkRzd6VGpiWHBLbWxIbW9aY3Btc2U1RkJoU0ZWMjErK09vaWRr?=
 =?utf-8?B?YWNPV0k4b2J1Smx0Sm5WVUhRR0w3MFRmN2swc1dkejU2bldzVk51UjRJWHVG?=
 =?utf-8?B?enY2RkNlN253MWpUa2Q1NUtTMkhCUWlQY3VMaWkrM1RFTW1MTUpJNTlxUk9S?=
 =?utf-8?B?bld0L29XUDdEaTZiT2NqdnA5bkIwT2htZ2pDRW11VEx1ejdKWjZCcHllVkh5?=
 =?utf-8?B?WVh4T055TEZ6RUEyTExYaFQ5dnBCemozK2lscGwyblpXd3k1Rm5rS0lmdEF6?=
 =?utf-8?B?UFBRSlJuWFk1Q1pDSjBURUZqNlBRakQyV2pLazY3YSt2eFFmN0R2eVlvY2ZE?=
 =?utf-8?B?cm5sV0ZtREQ3ZU5naFNFczRHRHJGYVlINlhaNkNTbmlCUFQ2T2E4cUd6ZGwx?=
 =?utf-8?B?MnVtUjJwOS9nZjhyckNsR2lWVGpPWG00VlREZVF4OWdBOWFSRTRtYVltUnVE?=
 =?utf-8?B?YnZIdDBLRUUxcWt6cjdXWGFQcDk5eVhDU3RYVDFuSm00RHZaVzhjd2Ywa3BZ?=
 =?utf-8?B?ZUtXNlQzaVFtaXErQzFDbk51anl3YVNEdllBWi9BN1V4clAwMHZxY3IrcmxR?=
 =?utf-8?B?MVdmdWJOZ2NQRXVMRXd4T2V3MG04eVAyVUFpN1VZeFhHbFM3TUpHTCt1bEp6?=
 =?utf-8?B?Lytqc1pRRkZBYmZXK2pRR2xZUytzRnYyQmg1V3VwNk1CVU9lM2dvZDJHdHo4?=
 =?utf-8?B?QnNKcFFPZFhtVTMvYkNHNkNZS0tXdlhIVEsxRnovbU5LbEwrWmtwb0Frb1k5?=
 =?utf-8?B?cHZIeUcrYjBOaU9adzZSdVA0ekxBWSs2TXlPeGdUTmgrZDRMTy95dU12UG5E?=
 =?utf-8?B?Yi9zeTh5dXJuZ1Z5a0QvSHIzUXNRckF2RS9ycGN0Vm1kMmFndHZYdkxGaEIv?=
 =?utf-8?B?aGNpV2xSTnhnTEQrSVlFOXd2YjB5Y2U3NWpyWVJ5UjFFZURQOFJFbTdUSE1X?=
 =?utf-8?B?cWZ0SkZPRHMwZ0ZWVk5Qckx2amcyWit6dlFJRnhXRmZmK01MNGxQVE5hcGNB?=
 =?utf-8?B?RDFpcGdtV1YrcldiZkZDalNXNEJGS242a3BsWmEyVUdodU5OUTlINnEvOHls?=
 =?utf-8?B?VUs2WFZMNTE0Qy90VFRDRHV1UDVPeVRPNS81aitHR3UzSVlxUkFMbXZKZ3lB?=
 =?utf-8?B?d1dyclU1MXl2cDJYejdKaWhkVFcrcUlSZ0IxYk9hMzRyZjkzOVRJUzhNSFdL?=
 =?utf-8?Q?chBUVpSuRWIqyg7ymukGQOy3r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f90a3f40-400c-4c55-cae5-08dac62b660a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 10:31:32.6410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EOTOjM1oL4YMWexb/tca5XX67E/wSoajWGS23uayyJKVOZPosnHE6zLNPBng/8MH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6681
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.11.22 um 00:38 schrieb Dmitry Osipenko:
> Recently DRM framebuffer core and all drivers were moved to unlocked
> vmapping functions that take the reservation lock. The drm_gem_vram_vmap()
> was missed out by accident and now deadlocks drivers that use drm_gem_vram
> helpers when framebuffer is updated, like Bochs driver. Remove the locking
> from drm_gem_vram_v[un]map() functions to fix the deadlock.
>
> Reported-by: Dmitry Vyukov <dvyukov@google.com>
> Fixes: 79e2cf2e7a19 ("drm/gem: Take reservation lock for vmap/vunmap operations")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Christian König <christian.koenig@amd.com

> ---
>   drivers/gpu/drm/drm_gem_vram_helper.c | 18 +++---------------
>   1 file changed, 3 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 125160b534be..b6c7e3803bb3 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -433,25 +433,19 @@ int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct iosys_map *map)
>   {
>   	int ret;
>   
> -	ret = ttm_bo_reserve(&gbo->bo, true, false, NULL);
> -	if (ret)
> -		return ret;
> +	dma_resv_assert_held(gbo->bo.base.resv);
>   
>   	ret = drm_gem_vram_pin_locked(gbo, 0);
>   	if (ret)
> -		goto err_ttm_bo_unreserve;
> +		return ret;
>   	ret = drm_gem_vram_kmap_locked(gbo, map);
>   	if (ret)
>   		goto err_drm_gem_vram_unpin_locked;
>   
> -	ttm_bo_unreserve(&gbo->bo);
> -
>   	return 0;
>   
>   err_drm_gem_vram_unpin_locked:
>   	drm_gem_vram_unpin_locked(gbo);
> -err_ttm_bo_unreserve:
> -	ttm_bo_unreserve(&gbo->bo);
>   	return ret;
>   }
>   EXPORT_SYMBOL(drm_gem_vram_vmap);
> @@ -467,16 +461,10 @@ EXPORT_SYMBOL(drm_gem_vram_vmap);
>   void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo,
>   			 struct iosys_map *map)
>   {
> -	int ret;
> -
> -	ret = ttm_bo_reserve(&gbo->bo, false, false, NULL);
> -	if (WARN_ONCE(ret, "ttm_bo_reserve_failed(): ret=%d\n", ret))
> -		return;
> +	dma_resv_assert_held(gbo->bo.base.resv);
>   
>   	drm_gem_vram_kunmap_locked(gbo, map);
>   	drm_gem_vram_unpin_locked(gbo);
> -
> -	ttm_bo_unreserve(&gbo->bo);
>   }
>   EXPORT_SYMBOL(drm_gem_vram_vunmap);
>   

