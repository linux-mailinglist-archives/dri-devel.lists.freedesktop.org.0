Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E35B8CFAB2
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 09:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A409210F796;
	Mon, 27 May 2024 07:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="POVn3K+I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2086.outbound.protection.outlook.com [40.107.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2EC10F82B;
 Mon, 27 May 2024 07:58:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQG9GI//zXbh7RzY5b8UDZ/uIcOlki4AINTQy+XiRr6HDWglYS0Hta8n75Qv9u0WZvsfWkedFkOS5tDE/3J467rdvceDaJOraCpmVBYi7kLH3ywJk3gGv8N9wG6g20YtJ/AqqopeOVIGsmV/pM0rgBR4NDoeslfCeAVcrZOg4kW4Z/aUF4QnHBeDdy650A9xtyVRZm5LGvH8zUcngRExRvnv8aQU4sg3FZ1r0DHGACs6ZvAZahhrQHYnhUOsjbt7KfEuE1zEW8KuyXL1UKp+7oi7O+fthkynS4z5CZeUxAj6Dh/lF7KfBYU0nGgRtjkB5TgpGzgqDIDnxLr0pDEpKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdQJ5jI1YUEHqUaOSi/Nemr+JSx8g49Q5Z0tXSKF5wk=;
 b=DuYhbLGw+t62ErGHJsm3jOoWwTH4Thi2DFcVpCDeRbxODUtHBlJ4RbdrsL0xyn9LhcMovu0l4VZugTCG+XwcwZU7mGWgMSsAKxnA1bfcbYgZ+c5Sd1bNrcwAohUPsLlOQvbXub8pAuT6kOaffyzJpPJYH1bO9dj7kdl1wZAsPeylmIBjx3QbcvClGFSRpI8ftXNBX1oCTzDJ3595pDcE8XKT1/sk1ecyLTbmzsFp081VOXFqihWoYy87GKsfzYeTWF6BhI2nDZCqGyefJ5OrqA9gxjFgxi4Gu9X2sRNTw+2A6H/9f3xxqw7UD/C+QLYB1ukEgl2kP2voriLTHLXtrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdQJ5jI1YUEHqUaOSi/Nemr+JSx8g49Q5Z0tXSKF5wk=;
 b=POVn3K+Iteir05ugplC5ujrWSvkwk2gAbrPoSIlly0ody7nra+yIWK3iFDjLAw8pJAKsSHWEBml4YkR6hJy48DgJtGK3Go16h0d/SJ8Q/ligdKwOQ8tnkk2dWjb8Y0ligUT/NYHCY2HZ5KiP44M723n6w9VqHH037A3kOkzts4Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7881.namprd12.prod.outlook.com (2603:10b6:806:34a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 07:58:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7611.025; Mon, 27 May 2024
 07:58:18 +0000
Message-ID: <c60b572e-12a8-49b1-a75a-b8a7b7ed674b@amd.com>
Date: Mon, 27 May 2024 09:58:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon/r100: enhance error handling in
 r100_cp_init_microcode
To: Zhouyi Zhou <zhouzhouyi@gmail.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 chris@chrisdown.name, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, lance@osuosl.org
References: <20240527012018.351223-1-zhouzhouyi@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240527012018.351223-1-zhouzhouyi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7881:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f5b676a-2782-48bd-3d45-08dc7e22c561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007|921011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U05YV3g5QVovN2JjWDlCb24yckozY2RMdnVJMWFGajNJQ1pKRytpSHN2ZTZh?=
 =?utf-8?B?MFdjbmVkUlpBYVErdHpUSC9oVWM2Vk5qMXArcU5uY3VJYWlvYlFneTYrZnlI?=
 =?utf-8?B?SStNQnhRTnBSZmN2MVArK0dUSDBsZXZSVEFJLzJBYmhOQng3UGhGVTIxckNi?=
 =?utf-8?B?ZVR0cExuaHVvdVpxNjRTa3hCdFlrczRQNTNLcjJVWjhMODluV3A0dWg5MGFX?=
 =?utf-8?B?UVpjbjk0cVErZWQxRjFXRTFhMkFPSnBZblhWTUZUMGg2cjhsbFJ5Y3h6WUxW?=
 =?utf-8?B?dzBiZzRmNHZrdUliQXdQcTdrQllIMCtnSmNzS0NMQ1VncElYOXBxSzJQOE1m?=
 =?utf-8?B?aExXaUM4dUZRNXhyWTBmUXA3Y1dhQ1VWSWJRVTRpVzV4UWloRHNoeGpUNjM5?=
 =?utf-8?B?TkJET1FGeHUzbGs4T3BxK2tINmUvVnBDYWJYZTVoU0pxWWxoaDJkRmY3UE0w?=
 =?utf-8?B?UVJQaGpPZ0ZlYmFEN3F5aUpMSndhRmV3UlNiS04xeG5tZEdkT3FzbkJnMm1q?=
 =?utf-8?B?V0dNZkpTaDQ3TmpNLzJLdHgyZjBYOUd4azJPVURJTmRHSEJNU01zMnRzM2Jn?=
 =?utf-8?B?cmVrOHkzZlB5QVlQSkpQWWkxQ2JtODRnMG1CN3dIMzdESDhybGJ2NDczZkFB?=
 =?utf-8?B?YWJkb2o5aUVhNlFma1FWMUhzOENqcHMvRmxWOWpCSjhRQjJ5UEhLSGpWa09N?=
 =?utf-8?B?RnVXWFVDRzJJWUlLcUJQcVYvSzNpdG93S25DNFAzVWp3Qkh0VHZObjJHUVlP?=
 =?utf-8?B?aDBzdkZpb0p5MEc4cUFhQXRRQlF1Z3A3bDlGbW9JK2dUL1lxZ2dWYkxOWktn?=
 =?utf-8?B?MEEwbU9qSTFOdVhoVU9jZFBha2xhU2dpL0lQQTRtaDl3RVNHTVp4Qk9ObGRz?=
 =?utf-8?B?VUs1MmVoUkhwd0RrNktFb1dTUW5oaEFMVVcvMFd3MGU5UnJhZkg1ckI4UnhI?=
 =?utf-8?B?QWtLZVlQMEFLU21aNXlneENLNSs3YWNjVWNaUlR4S1V6b09yVmVTd0hEdTEr?=
 =?utf-8?B?V04zcm4yam5aVHdlUVJWdGZkNjA5Q0E0SHZkMUVlcFVTb0FZVTI5SVpkOFN2?=
 =?utf-8?B?V1NRR0VjSkdEQ0YwQTQyUkh1Yk9VdmtIbndQcGF0UVBDOHBuMUgrT0hFMGtN?=
 =?utf-8?B?TEREMTQ4SzNEakVwZTBia0FIRVR6R1JGWlZNVXZYaTB0dDZ4Z1I0NkNsWDE4?=
 =?utf-8?B?cS9mdkYzVWV3dG1samx6L2VoUXplejZhRWM4VjFRbkpxenZta0JsS2lha2R3?=
 =?utf-8?B?dmdjbkNSbHNHUmpuZCs4UUFYSExuekpMWU1KV2hkTVl4WmUwM0RGQmQvY0lm?=
 =?utf-8?B?RzZHQUVqWlJFd1dDa0FvV01aQjlyb1NadVVKUkdYZXkxampzTEZJckRmUHNF?=
 =?utf-8?B?d0N1djNDblJKVGRyeklWQkVzNFpvWjZKRzBJSDdpYzNTVkFYR0VPMXRvSU1U?=
 =?utf-8?B?cVNyNjNhdHZiOG5JOXlOR0RFYkhzRnNUTDd5cG15ckFoZ2orUHUxbFVyUzRU?=
 =?utf-8?B?YzN3OVNNdTBaSmlqMjZrOHBlQVloam52VDhCaFo5RWdlV3hpdkZiUTBvUDBX?=
 =?utf-8?B?QTVjbitOcklkVTBTZnViaDVoZUpjUXpBSElLbzM0K2Q1b3dQc1ozOUlnSU5I?=
 =?utf-8?B?SlgzQnh1NFZvR3BYemVpKy8zZkxmQ2pCZzQ2QjJHaTJBTmdpdDZhME10dmo5?=
 =?utf-8?B?SHFaN1lWaHRCRlVhVklZczdiQ2VUZlZEdjRsR2hpZ292SmgvdGF1VFlQdG9C?=
 =?utf-8?Q?1/dFYOLg4jfbwbRIVWk+xcxjN4OQIZ9wCHyiVhK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(921011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWw4a0d2OU56dytFbm9ZSU9IZUNFRGlxZjFRamVNdUV1SjF1LytEVkQrUVhW?=
 =?utf-8?B?dXl1dWo4OWJkWHlsOUVTRlNSbmV4UjU4UUY3QWxJcU5sNGhJZlk5SXZYYmJC?=
 =?utf-8?B?SW5qYmZnOUh0TjZVZzNnc25TZ25BRWdXbjhOTkVXTFczK2dRZE1TSFd5VUhE?=
 =?utf-8?B?c3UyQjM2Z0Y0cUZ1MjRYcEFQeUZKejFKbFhhNVdCdUFUbWl4Qy8xNFV4K3BJ?=
 =?utf-8?B?cThXL3ZEY0pEeDJ4NVBXNkFpaVRjUlZjaUNqQVVxQ1kvNFJlakIxRlZnaXdF?=
 =?utf-8?B?M0JFTm9vS2IrOEJVTFZDZUJoQWExQXQ4Z3RTbFlrNW5mT0JNWTg1SVlVSW9s?=
 =?utf-8?B?bEtxOTNGMnlZWHRsY1dlazhTL0dYZnlxVXhBWGtmRWRvT0ZTU0ZiR2h1QlVv?=
 =?utf-8?B?ZVNySlNBQmNLcEFHc1kvU3JWWkVzUlRuVlFoYUJSSUx4OVk5Zjg4QUhIRG9Y?=
 =?utf-8?B?U2Y0S3NXTkFuR3BacFg1ekNTSDNVeFJoMFZKRUNrV0ZrTFpZTTB1cVFDYzl6?=
 =?utf-8?B?UUdkMjZzTVdWenhsTXFUY1IvaTVsRzI3WUdNcDNDYWFBdUtHTmF3dG53endX?=
 =?utf-8?B?R3IwZHNWOEdRWGtQTWkyeUpEeVc5Tk9ZZ3djN1hBN1k3djBFSXpnSWZLSjRo?=
 =?utf-8?B?clh2ZGZicGhIYkdxSzVCWFRNQS8xZHF3WWd6K2JyZnlMNlFiQThLd2l2alRj?=
 =?utf-8?B?d3FkQ3l3dlZCaFlITFY3NldVUnhxWUxXVHhsdVlvcGhRbU45MzJmQ2NPYm9o?=
 =?utf-8?B?dUJzQlA2czNlUVdUMGVSK2lNWWdMYnJwSzVTLzJTVWk5NE5PdU4xWGY2N3lR?=
 =?utf-8?B?OC85RHZVcDVZU2tUMTNmOHFGZ21KY3BVR0swVStKN0dmVHdWMjE3a3FCY2x1?=
 =?utf-8?B?RldpRlJieFFHRU5BWWg0SWFhcDVXeVFLK3FRTG85OGk0ZDRkRTZZdkxTNW9K?=
 =?utf-8?B?bUFhb1gzSnB0QzRWSVVhVU8zTERvTnphVm5Yd1U4N05YQ0NWS29aUGM1Q2pr?=
 =?utf-8?B?dmxwUW40SHFVais2NUdhVGl4TG8wUkF5d09UOEpXQjBKYmUxby9KYXhGMkpZ?=
 =?utf-8?B?MnhQd0FjUXpGL1FieDFzSmtRdmFWbS80REtrTnlZM1JaRGwrZnZUZFY1TVRt?=
 =?utf-8?B?UjFhUHJlREFudEFyNHBORW80djdGRHZIR01YSndCYzkyOVBFaXZZcVZVdEY5?=
 =?utf-8?B?U2ZOYU5GZysyUFFuQzcvWDZINktzU3pOZ2VJRDJucU01aDNTR21VN3l6dFdr?=
 =?utf-8?B?YStoQjMxcGdhWVM3ckVBVStINnhtNzhSZHp6T2lNTHdvUFJYaUVCNHlrUHRv?=
 =?utf-8?B?L2Q0cE1HeVJWYUd4YmdkUFZmWlYycFRybFVuM2x5ekFhdGtJTFByNGRpd1ZX?=
 =?utf-8?B?NVJxcXU4V2liOTR5eHVka2cxcnJ2ZmlrZ1BnT2dqTkQrNVdHMXVIOUhtNDYr?=
 =?utf-8?B?cTVpSTdPbWFlbDBoc1NGYnhjcUY5Tm5MNmIwN3hmN2VZV21SeEUvVC9lSitE?=
 =?utf-8?B?TFFVSVJuc3Z1UjV3enIzSG9XTnVpck95R3kvT2R2UWE4VEJYK1BpSzAyNzZK?=
 =?utf-8?B?bFFlcFNmMDd4VFVScmY4amNuL3NJR28vMEVCdlc0VXdqL2RkSktaSzFqTzg5?=
 =?utf-8?B?YyszMU5oZlZaZmVoRUFZSFFEOTdpMkN2UU1mTkx6b3FZbVRxVWFSeGtKMGVX?=
 =?utf-8?B?eEs1c0s1cnRGd3JpMkxrUGxGTlZpYnVOaFZPcFJsbU5UT1B4WnJxblo3dHR1?=
 =?utf-8?B?RDNwYmdOWHEyMGQwY2tPQzJBRU1BOEd2ekQwOE5sWVA4WDFvTGNUYk5GMDZV?=
 =?utf-8?B?elp3c1FKMnV0S3lhekVoOFNIclAyN2hmL2JvMzJHMnRiUDI0MVo5RWRuUmxy?=
 =?utf-8?B?TmtqWUpGZDQxWnk5RitHMHFsbW00bnhrbFFoemJ1VTZlMTZPenVFaDlnVGFC?=
 =?utf-8?B?ZjVUeFVMQ0lZSXo0RVZSbG4yVGt5MVAvQ2tsanorNW1QUDN5YmFORnM3cVlS?=
 =?utf-8?B?bW9ZeVdMemVFUVJvSVdPYTQ5cS9GM2ZYYXpicFh4a0pwM21HNkp4bXBXM05Z?=
 =?utf-8?B?aUNZNmp4WkVwcVlIWXFLa0d5Tngyb0dZeEZsckNyd2E3KzA5cDk2ejBGMFZn?=
 =?utf-8?Q?W+kzA6rUuCGzE0FlSa15O2CJJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5b676a-2782-48bd-3d45-08dc7e22c561
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 07:58:18.6236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbgG/lT87xVDKnbwVWtHauqsKUbPTGOqhOQbeh/luDaVK6QoYToY2EKoQ0OJGg6y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7881
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

Am 27.05.24 um 03:20 schrieb Zhouyi Zhou:
> In r100_cp_init_microcode, if rdev->family don't match any of
> if statement,  fw_name will be NULL, which will cause
> gcc (11.4.0 powerpc64le-linux-gnu) complain:
>
> In function ‘r100_cp_init_microcode’,
>      inlined from ‘r100_cp_init’ at drivers/gpu/drm/radeon/r100.c:1136:7:
> ./include/linux/printk.h:457:44: warning: ‘%s’ directive argument is null [-Wformat-overflow=]
>    457 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>
> Above warning is emitted during the rcutorture test in
> in PPC VM of Opensource Lab of Oregon State Univerisity.
>
> Enhance error handling in r100_cp_init_microcode, let r100_cp_init_microcode
> return with -EINVAL when none of chip families is matched.
>
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>

> ---
>   drivers/gpu/drm/radeon/r100.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
> index 0b1e19345f43..4f8a1bdd9365 100644
> --- a/drivers/gpu/drm/radeon/r100.c
> +++ b/drivers/gpu/drm/radeon/r100.c
> @@ -1055,6 +1055,11 @@ static int r100_cp_init_microcode(struct radeon_device *rdev)
>   		   (rdev->family == CHIP_RV570)) {
>   		DRM_INFO("Loading R500 Microcode\n");
>   		fw_name = FIRMWARE_R520;
> +	} else {
> +		pr_err("radeon_cp: Failed to load firmware \"%d\"\n",
> +			rdev->family);
> +		err = -EINVAL;
> +		goto out;
>   	}
>   
>   	err = request_firmware(&rdev->me_fw, fw_name, rdev->dev);
> @@ -1067,6 +1072,8 @@ static int r100_cp_init_microcode(struct radeon_device *rdev)
>   		release_firmware(rdev->me_fw);
>   		rdev->me_fw = NULL;
>   	}
> +
> +out:

That looks superfluous, just return -EINVAL directly in the else case above.

Apart from that this is for ~15year old hardware. I'm a bit reluctant 
adding code for something that old even when this change here looks 
harmless.

Is there a plan to complain about that in an automated checker? If yes 
then the change is probably justified, if no then I would rather not do it.

Regards,
Christian.

>   	return err;
>   }
>   

