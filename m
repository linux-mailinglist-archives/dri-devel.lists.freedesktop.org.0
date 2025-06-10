Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACF4AD37B3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 15:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C452810E53F;
	Tue, 10 Jun 2025 13:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5VTmk4og";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734A110E53F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 13:01:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ccmuQH97hoyu9NEdEh6+kSYyBj2WbNhrzkCZM/urWNcyyuK9MuaEgcBZB6KVAserpa8tojIIQPtnY8R00b1DwlP1CR4cQUT4x8kZDrJGIXdK5PlsYLWOL3cb4T/r9l6sgHT4vdgkJ3x7/Mw9HjjEtoxLV4iZ5UXhALFUna1wjZFBIwEeOdaVECkKiWnjo7jtgqFJpOBRRopUUZHtwxofaFet1vfysQg87q3a05fNAezCp49bupqNNpupzkFy7AmnZrUDAJkTpCR9WlFzVvMcfymDZYQ3ur9qaxwptnzhZsg7Oi48cmY87lVsgR7RoUm8TEjuvymI9iibsARbjLh6Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ozjt0mUMFUWNvt+AW5BxmS/njaBa76oeNdplWtBiik=;
 b=BAZO9IXreFhjtp3eBSlIyA408lrGe3jBQWyA7K3vBwDUdiTPPMIpjtQOsof5A3UfNz1sfcm7rhh+u+DbzHa8psg5yTvjnAKGoeKio8JP4NPbTg9FTxIGIQjivAXkp7cogUEAIkHRL6AVNRnMCI7LiuNXg3ovrI5xIvDIaMVYmNOWqQxh5OSgq5ghwtydYM5thwCl6HiCbZjeNJbxqB5JPs5E5b4+d4t79wtWrfTtSYlFhfCLavLfZc3t9fWRRKjMuvU3qfNHwMFpQlfAnzWxg33lPfTxbKfgX8lukYdPpHEwfpZcIhQz+Ax/m41qB5Z6QingtsxE+1QT7SmpSF9VYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ozjt0mUMFUWNvt+AW5BxmS/njaBa76oeNdplWtBiik=;
 b=5VTmk4ogIKFGzFdsbPlFgsnFkvWNS10lI1eMHjT54jxxrSmDz9JJogtoEnQV4ay41fJYzCNCRscq/VetZqGgJs0vmV2C9XWJM1j9Ip7TlupT3sa+qAArrpR9NBdxU0KdOS4/uIDCORQxtfs1z/rYdf8AcPUy0lXaP8wCb4AqXCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW6PR12MB8951.namprd12.prod.outlook.com (2603:10b6:303:244::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Tue, 10 Jun
 2025 13:01:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Tue, 10 Jun 2025
 13:01:09 +0000
Message-ID: <5668ab98-3ebe-4f02-a759-5dfb2e21134b@amd.com>
Date: Tue, 10 Jun 2025 15:01:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/test: reduce stack size in drm_exec_test
To: Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250610093350.2645965-1-arnd@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250610093350.2645965-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR16CA0021.namprd16.prod.outlook.com
 (2603:10b6:208:134::34) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW6PR12MB8951:EE_
X-MS-Office365-Filtering-Correlation-Id: fa80b2f5-a390-4f69-d61f-08dda81ede34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emRDcm5CeThyTDJsNGtLcE5MekY4VHZHUTR1K0ZEUWpiR3E4SzdpeWZmWVhu?=
 =?utf-8?B?OWYzUnkvRnoyeldMWGFMTHZ2QkN4cWZmRm9HQkhUOVNTWlYxVlFrNXRDVUZ1?=
 =?utf-8?B?d2NoTS9xNk9JKzhNR1orM0lCK0hxSjhlT3pEN0lSVDBWbDNYTnJBL2hiZVdJ?=
 =?utf-8?B?RllCK0VJQUhQKy9wWHljcG5vbEt6MStYV2xBRzhEU2NHTXRNWHRFZzZrTUcv?=
 =?utf-8?B?Rjc4MElFV05xamQ4RVRsOUQxMGtFSGpPVHpKZ1Jna0FQbkNVOVBxK0N6TGJF?=
 =?utf-8?B?VCtUM3hmVURWc0l2ZnoxV2lrV3duOTI4TjEvcVdpSkVOWnVwamkzbkFITGVZ?=
 =?utf-8?B?VndVcDgvSVJ6aUtYTkFBSXJaSjgzV0Q3OURuNEJJRlBBSWlmMS9pSndrU1R0?=
 =?utf-8?B?Z05iUnkxNWFkeVgyQ3pmMEgvR3gyNytGeHc2a3ptdU5FOUs2TTZFV2FyMndj?=
 =?utf-8?B?d083RGlveGgyTU9HTDlnRWpvcFp2c3FtWHpvWEt5b2NMNzlhRTV2WWtXZURa?=
 =?utf-8?B?ZTFycWVSc3ZWWHFyMGc4di9kd1B0L2MwK2puRTVmZlZzWEFFTzczcndyRzd2?=
 =?utf-8?B?ZUZTUzdLZHVpbnFSVUZucFYyQ3ZpQlFFOWdkUDdnaUxwSzNxN0wvK1YwUkFz?=
 =?utf-8?B?VTBBOXNnVVlnNjFqVEdmZHI3UTZ4ZEtWai9udjZQV0RWTy9oY1YxSC84Wjdy?=
 =?utf-8?B?S1Q2OHpjTGIxaDgzZHRyd0wyM0tjamZuQ0FuazZxS2FXbGUyVERKQWpSZ1Fs?=
 =?utf-8?B?M3pXKzh4VW1mdGJ4VVdoWEJ1TC85OWpEOXNhRzdsbCs3ekF6WkltN1BIbjQz?=
 =?utf-8?B?TUIxUStRaGhETGpMWENxc09DRVhtVzhLa2IwblhpeW5LV0lkR1BNT2tiOHA3?=
 =?utf-8?B?MnRHTHVqblNieEg4MW1MVXBuTlV5b3FrMFJnSVhuVmlpZXFSTXRWMlMrdXh4?=
 =?utf-8?B?NWphdGtvSXBZajg0TjlTRlVMSjI3Mnc2MGMvS3I4RnRIdXZOK3VNVlBIaDR6?=
 =?utf-8?B?STdCRlVLcHEyanJnTktyc0ttRzJvVmJWVE5ZTDgvVS9RM212YmJCRTlJNGpC?=
 =?utf-8?B?aHZVbUhmMWFpNy9YbkhJbW1oa2RJUEY3Y21SSDFkSEJDVzVxVzUzK0c2V2Vt?=
 =?utf-8?B?VmtUQ1FzaHViTGxVTFFGZ0JEWjhBcVhxM09XQjV5anNlbE9NbXFNVzA2dW8r?=
 =?utf-8?B?Y1ZIbmNMNldrRWtNSmRiRDBnWFh3cVYyQXgxc3NSNWNpRlZjcHpVOFVGUEI1?=
 =?utf-8?B?aU9mMmp6K1hGcUI5RkxUVEJWRXlZLzNxNEYrN2Q3MjMyWHdCNnB1YVdJRE4v?=
 =?utf-8?B?c0l5VXFnQTBadFpvbnhIRHg3OUFhanBXazhjaGpKdzFkS2ozUjRRYlRtYThl?=
 =?utf-8?B?QnJTNHd5T0ZKQzM3UG15Vm80bU1yOGNlUEtHTjNDUGExcWNHOS9rdjZsTTBP?=
 =?utf-8?B?eXhYR01nMjloM1ZyZkdwemtxN0xMQmhtSE55RlMzLyttK1pYdnNkWWp1eWF6?=
 =?utf-8?B?VmRGdDVxNXFJWXdUUDNHbk5ScFNIL1JHSXcydUxDNXRQajJ6anlXc01OOGdE?=
 =?utf-8?B?a3RKa3E4T1AybDFDWjdnYlV6SUM5MnlKUlZoQkVUUWhtY0ZHL2hiNC9BaEVV?=
 =?utf-8?B?czRMZjhvL1FmVVNKSTBzeXZmVzk1Z1hiRVI4V1ZtZWlXNURMMHlBRm0vTEV4?=
 =?utf-8?B?dXNmRWRVSU1HeFJDRDZoWHR3Vm4vTzdBNW5YU1ZEMkxTSk1IaWhKK1QvTU9k?=
 =?utf-8?B?SVRoUUUwK0k5RFFVblFhMXdjYitHanAxYUVTd1VId0lIWEoyZG5zR2tZbDFq?=
 =?utf-8?B?bzg2OHh2QWcyQUExeFlOajZ6Z0xiZk5LNlNOM0txRmRrVlN5Z3BHVUQ2cDhu?=
 =?utf-8?B?MVdjdGI3Y1p5N3RidTVRczdYN3pXOHBad2ZDYU5BQjBXWmFqSmNSUkJWRE1k?=
 =?utf-8?Q?VvYYn02eOEk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnM4VUtOdjB1ZnVjcm12MUhFclkzcXVKeDBRd0VHNFpnREczMXNxQU1DV3hZ?=
 =?utf-8?B?OGc3WTRNemFWeVVib3pYVkhxa2hIWXZNQUo2OG9RQUUzVEFqZmVSMmxybnFW?=
 =?utf-8?B?dWZQR3ZiUnZjSjRYclg5Z2orY0hrZDNKcUh2NVN1N0lkeHZLalYwNW5yZ24r?=
 =?utf-8?B?Y2xZTkI0a2wvaTNJRDltTlc1OCtHMk4zUFlodHNRdXdrd3lFWFFmbVpXd3RF?=
 =?utf-8?B?cERBc3NWaG56VkxWSlZJY3NsbUYwQ2U0YmlGYW8rb1YxQ3RPU2ZORnlkK3Nw?=
 =?utf-8?B?ZXkwOGZKMGxNbUpjMlFVbk9NTGdYcWZ0bENjRzRFb09RWlpnSUZ3L3J0Q0tH?=
 =?utf-8?B?MVFxc0lWRVFncElsbjJBcy9TZHNHZ0JXM1dJM3ZHNDVCbWphL29HYUF4cHEz?=
 =?utf-8?B?QzkzWTZhYWJoSkdneEdsaGxJNm5zdjZsdTVCd1lUdm1MRTFCb2FyYkpaOUcr?=
 =?utf-8?B?dkVJRDRodWFMTXdoaVRxUFVnZ25OSzFwMGtMVnJuM0hqQmN2ci8xNVlGL1FZ?=
 =?utf-8?B?QWRKRE1PMlBZMkd6am11bmNLdmg3YlhrTk5uTzhjbTJWQThWTmk5MDRyc0lz?=
 =?utf-8?B?VUdmMUpWa0MwTTNUNHRhcklaUFRPdEpORk1oL3NpbWg0d1FMcDdhencyV05a?=
 =?utf-8?B?VDBHRFA4K0VEd01RY2FUWk9pZ2d4a2wzRnpnWDAvUWlHaE1PRDQ3ZGc2dkFL?=
 =?utf-8?B?bFBTL1RhZkNzdTY2dDMxWE9ZMHFuY1p1azByZXgxWHlsb0Y5UFVBN0dKVCt5?=
 =?utf-8?B?LzBwMXNZZVh2bVdSTGVxcWJTWjE1dkZPOWdXVGhDZGJIdW9VdE50SDRQTXZP?=
 =?utf-8?B?TzR2bjU4Qy9YcG03cnhnbTgwR1F2dlVjbGViUGNYWUxzbU9xOXVOcFNkV05t?=
 =?utf-8?B?T3VJcmYwa1pGWHFNRVpFcE5kalhsTC9RY1dTYkc5cmZVNUJoQnpGam1EZVB3?=
 =?utf-8?B?TTF6T3V5OEdhVE5Wak1xcE8vTW1mcWc2L2IzQ01RM3VMeGVENXhBU3VHZE1t?=
 =?utf-8?B?L2M3eHQ0RzM3NGJXK1BqZXppVWZYZFBXdG5la1hnaUFqZTNTUDlpS2xySXVW?=
 =?utf-8?B?T1hTR0ZkKzVVaHdCQWx3WjRUT0NybVRTU3pBSWpPVjJSRUN3STNZZTZYZS9I?=
 =?utf-8?B?YTJUSWVMZlcvT1A3RjNkR3ZKNUh3SUpxbVRuRWJJb3lWSThDYU5XMlBUQ250?=
 =?utf-8?B?M0lqdm9mdzVqU2J5blJwUjdrYjVIZGdoMFlWOTI3bEFteHhKYXg5TFVzSEdF?=
 =?utf-8?B?UDIrMVBHUUtnR080RmpIWVRTeWNKUm55NWVLQXJQMTlGOHN3L2pLcHJPM25F?=
 =?utf-8?B?U2xORXNlNjIwWlp0dHpWVDhhQzg4QkQrNzJYN0lxVEsrdlB0Y3l5amdLSkc4?=
 =?utf-8?B?OEdTdEQ4ZWRrSUVzb0V6c1hSNG43RU9XQ1A0b0Q2MGpJL2tnUTJXMnJETXk3?=
 =?utf-8?B?T0NWblA1VWRaeEFmbTZmNFg3WVBsWVk3d2NZelo4bDBYSkFpWXR2dlRCU2NH?=
 =?utf-8?B?QTNFNHhwa1hGYUhNRURXanhQNTFVWXA3RDE4VEtQNGJZWlJVeExxWlJwVEYw?=
 =?utf-8?B?Rkd1NldyNDRxMkpTaHpwU2UvTWswN1h2WnQ2dks3OGpkK2FEbU9vR3l1RGNO?=
 =?utf-8?B?c0E2YjFEaUZSVzIvanlsVnJ4dExGTHVGMUxHR1VSdUVGMWxYR2J4T1J4TXFv?=
 =?utf-8?B?Mm02Smh6S3djdnBhK0RFNXgxV21ORWx3MlVwbmtQTWhmcXl5T2ViMldUYWxh?=
 =?utf-8?B?OWJpMGY5YzcrQWlrbWhSeThrcWNiSHB5REZoQ3JscnR1Q1BxQWVvNW4yMTVU?=
 =?utf-8?B?cXduZCtKUDBKYkdzZ2F4Q1VXOUV1Q3VXU3VGdmtJTllXMU5SbnBnb3VsZ2hZ?=
 =?utf-8?B?dTlKSnUwN0lIZlpFa1IxbEVNZytsclFqOGhVQVRNNWdQN3AwQ0pYaWZ6ZXFm?=
 =?utf-8?B?N2JoMXZOck00UXFWU3ZVZVZ1TzJoTmV2T25ScjE4OG5wM0Fqb0ZGemVwWmEx?=
 =?utf-8?B?ZmttRmI0WDMvMUxWN2Q4WG1KdDFvcWM5djRaWXRrRmZjdUdxVDVhWVlQMVpa?=
 =?utf-8?B?VXVxb1d3MENlUG9FQ2g1aGh0MXJ1d0E5eFYzTUxWeWR4azcxdnMvNlJwemRL?=
 =?utf-8?Q?3BmytJFSD8fgHlZOpAWlm9zNz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa80b2f5-a390-4f69-d61f-08dda81ede34
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 13:01:08.9799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4RvTW/46Ym3cYKtrvNIswvG0k+NJWGCrq/+Vhfp9QAOBxU4zpyYrkbNGG01mEwLw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8951
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/10/25 11:33, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> test_prepare_array() is one of the functions that uses more than
> a kilobyte of stack on 64-bit machines, though it stays under
> the usual warning limit of 2KB:
> 
> drivers/gpu/drm/tests/drm_exec_test.c: In function 'test_prepare_array':
> drivers/gpu/drm/tests/drm_exec_test.c:171:1: error: the frame size of 1304 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
> 
> In order to eventually lower that limit, change the two large
> drm_gem_object objects to be statically allocated. This works here
> because the tests are always called sequentially, and it is simpler than
> using kzalloc().
> 
> Fixes: 9710631cc8f3 ("drm: add drm_exec selftests v4")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Maybe kzalloc() would be cleaner, but it certainly isn't a must have.

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/tests/drm_exec_test.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
> index d6c4dd1194a0..f2ac06a07707 100644
> --- a/drivers/gpu/drm/tests/drm_exec_test.c
> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
> @@ -18,6 +18,8 @@
>  
>  #include "../lib/drm_random.h"
>  
> +static struct drm_gem_object gobj, gobj2;
> +
>  struct drm_exec_priv {
>  	struct device *dev;
>  	struct drm_device *drm;
> @@ -54,7 +56,6 @@ static void sanitycheck(struct kunit *test)
>  static void test_lock(struct kunit *test)
>  {
>  	struct drm_exec_priv *priv = test->priv;
> -	struct drm_gem_object gobj = { };
>  	struct drm_exec exec;
>  	int ret;
>  
> @@ -74,7 +75,6 @@ static void test_lock(struct kunit *test)
>  static void test_lock_unlock(struct kunit *test)
>  {
>  	struct drm_exec_priv *priv = test->priv;
> -	struct drm_gem_object gobj = { };
>  	struct drm_exec exec;
>  	int ret;
>  
> @@ -101,7 +101,6 @@ static void test_lock_unlock(struct kunit *test)
>  static void test_duplicates(struct kunit *test)
>  {
>  	struct drm_exec_priv *priv = test->priv;
> -	struct drm_gem_object gobj = { };
>  	struct drm_exec exec;
>  	int ret;
>  
> @@ -128,7 +127,6 @@ static void test_duplicates(struct kunit *test)
>  static void test_prepare(struct kunit *test)
>  {
>  	struct drm_exec_priv *priv = test->priv;
> -	struct drm_gem_object gobj = { };
>  	struct drm_exec exec;
>  	int ret;
>  
> @@ -150,13 +148,11 @@ static void test_prepare(struct kunit *test)
>  static void test_prepare_array(struct kunit *test)
>  {
>  	struct drm_exec_priv *priv = test->priv;
> -	struct drm_gem_object gobj1 = { };
> -	struct drm_gem_object gobj2 = { };
> -	struct drm_gem_object *array[] = { &gobj1, &gobj2 };
> +	struct drm_gem_object *array[] = { &gobj, &gobj2 };
>  	struct drm_exec exec;
>  	int ret;
>  
> -	drm_gem_private_object_init(priv->drm, &gobj1, PAGE_SIZE);
> +	drm_gem_private_object_init(priv->drm, &gobj, PAGE_SIZE);
>  	drm_gem_private_object_init(priv->drm, &gobj2, PAGE_SIZE);
>  
>  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> @@ -166,7 +162,7 @@ static void test_prepare_array(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  	drm_exec_fini(&exec);
>  
> -	drm_gem_private_object_fini(&gobj1);
> +	drm_gem_private_object_fini(&gobj);
>  	drm_gem_private_object_fini(&gobj2);
>  }
>  

