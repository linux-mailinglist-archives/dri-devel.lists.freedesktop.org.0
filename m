Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94529CC1993
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 09:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECA910E758;
	Tue, 16 Dec 2025 08:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sf+W9g7K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010000.outbound.protection.outlook.com [52.101.201.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD96710E422;
 Tue, 16 Dec 2025 08:37:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkugggkvz3zDNzQGPAcKhdEgLJy9ugB8PL0udFO1hImXXAgExZ5JxEKXmn1G1lBK8JkKu5fshgquGf7P1/jbZrhoiTdPzs8J9E1TSGTnJVutdlAqZmKoLB+0jELCXmKpPySATwt56xYpTfCdFWd3Ddx8PThRNznGMZiuCJZu927prYghW9Ql+vI0RWpefICD1X7PktrrBUWvG+AD1oSTbngiEQOR1yzlc+GkQCahluSdg8z0REPHlouC9D4PrGxjrkJmlRvAiFXLs54v/CYlSuJJ0X/VCe9Zy7q7I4C+CHEdpovzwkZy3iQ64/2CvBbHvJdJWhQKIIKAUeDXrGXvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7oCTxjvASlYBD3mIH5EFrYYXLVrMiV7LlN6mwvYmUk=;
 b=hS6OjdhuCDaEKNRZrdMB/gokdpmJ9uhuO4iTVjQULlz67j/l8ilM2umImTJQQQoL7ZtFXCQuHLHoNuuuMluujUSyMA0qQbOocytt2BsTM9vTCYm1cUKjDNwhZJUJ39cd6zMjup4o3gQSwvoMDCvch5RynzBngvtZtjpazOrJRXzFdkxwAF+UXQsqb0JcXNsHVFSQS+SbPuDfNSL0GniBFWrekVe004sNlJde3/b1CamcU5p2TIchdQiEUjzTzx25jCh+0QbrYMeQv5ClfHkqOAn4vOHiIb2rlGXkmU/AQ8CCRKFeMI7zQG7C9FABKRNr3H8vK6kZZkovleUUF3MW6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7oCTxjvASlYBD3mIH5EFrYYXLVrMiV7LlN6mwvYmUk=;
 b=sf+W9g7KEkJeqOKyWMYgW9bbs4JqelAOgVRzEWAIRz3pyms1pmGVC3htpwb2I4uFuKqbAOWdH/6uwcIxsW6EOD0WKz9Poyam3OyHMJ1YST5BfanwKQKVf0BHPZ9Xbgu9VnVmMVuvZXVfWfb6xCsQBBHorEW0cvZShnfdqx+jx3o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7643.namprd12.prod.outlook.com (2603:10b6:610:152::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 08:37:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 08:37:07 +0000
Message-ID: <e5e0547b-4ba7-4862-a0f1-a63ad5e5425f@amd.com>
Date: Tue, 16 Dec 2025 09:37:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon: Convert logging in radeon_display.c to drm_*
 helpers
To: Mukesh Ogare <mukeshogare871@gmail.com>, alexander.deucher@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251216064224.537759-1-mukeshogare871@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251216064224.537759-1-mukeshogare871@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0257.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: 816fd890-a0e8-49fd-02bd-08de3c7e4c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGtTc003c1QrWUlCVkoxUnd5SlQyY3NDd21RTTI1dHZxUnpnc05UR1lhbkJU?=
 =?utf-8?B?VHlvaUxIVjFwZjlRaWE5RkNqcUpLYlhSa0pub1RJdXZZZHdLUXliSzhSLy9I?=
 =?utf-8?B?Um9oN28wSGpxZTRLdmFnTDB3QTFUT2cxM01rTE00bHk0aG1VUTZTM1VpK1FW?=
 =?utf-8?B?RmFPcE1kdkpkK212YmdTNk5MeG5RTFdlTW9YL2ZLUjRpTk1XOXJCNTVpZTNk?=
 =?utf-8?B?NXVCdkJPOURzVmlMbUI2VGQ1M0RQUUZKVUVBaU1iZ093MDBucGxMSXd0QzNp?=
 =?utf-8?B?Mm4zeUZrUWUxdWdLcThxMi80TllnODYrOHhwTUN3dnZtNVkzQzlGR0hKbDFT?=
 =?utf-8?B?M3YvL3RMS25HQ29KZG1tT05IcnUyNi9RWGZuaUZpbndRK0JnSmgwUzBhZlNm?=
 =?utf-8?B?YkJ1Z0I0T0ZwL2wzZTRGQXU4d24vanpvenlYcCs3QlBwMDNwTVQrN1ZzVjEy?=
 =?utf-8?B?NHFsSmpKR3hCdkc2TWRPamoyYU1haFlFcnorT3NYS0lOVnQydHZUQ0tDbUdD?=
 =?utf-8?B?eVBMcUpFL0JYWlIzcEw0T2VuaXVoaU1Xejd5bEsyWXpiMVkreDNNdTVJNTVk?=
 =?utf-8?B?Smo2M0lCWWlSQjhGQ3RWZVlKaExNS01DQ2tRU2VreXI4Z2Y5TTZCVFZNK000?=
 =?utf-8?B?UkhBcG1GL2xsVWFOWlRPa3l2TW1NRWVodVQ2TjM3NzMwNzJTQTZuSi8zMjFL?=
 =?utf-8?B?dG01TmdVWmhPdUR1Z1IvZDVHcGQwNWo5OFhZSGZpdHlPOU55STByMERteTMr?=
 =?utf-8?B?TXpkeXFzK3V3ek10dncxOGw4ZXZhOWF4enFzNHErSE45RHhmNlZpc0hMVkEv?=
 =?utf-8?B?V3pPTVRjbS9QSTRXMzBUSWdscnE2SFYxNmxTYmc5SXQrbnVobFBNSWdHS1B0?=
 =?utf-8?B?eGR3ZFBuZTEwNDR6THpUS2tvbzNZZGFLQ3ZOS0ZZR2FpWTM2MTQ1by9SN2VG?=
 =?utf-8?B?SmxKNm5ENmtFTitQckNGM3kyZmVHUlozR3F5ZjlaUktsaTZDT0k3T09QenVP?=
 =?utf-8?B?M2pZbUhNanV5Ly9GS0RrU3VtN0lIUDBlZVJadWRiSm1rWXpyZ0xDVFFRSUlJ?=
 =?utf-8?B?ZmJaM1R0dTFKZ0xSREpsdFh6VU5KT3FrSVNRLzI5TTJ6b05GcnNBOTlFTjVM?=
 =?utf-8?B?K21WSzJJc09VTXdJVlptZkMzL1MvdHlMNFdFMEx5cEIxTlVzK1Z1NHd4V0x0?=
 =?utf-8?B?NUYveU9KcEJuQ3dLaG8zdHYzcGRQT1dwOWE0d0t0Y1Y0QU5aZmgraDB2YkZ0?=
 =?utf-8?B?Vno3MSszRStSQmFDYmhtZFJoeHZ6aEh3ajVaVzV3RWhPeFNNc0VpTnY2Z3FG?=
 =?utf-8?B?UWtLYW5xVWZaSC9PQlFHRlFXOGdGMVJDbHYrV1RxMnJnVWc0cmdWZ1pvaWFl?=
 =?utf-8?B?Yk9QdlMxcVpDR1FrRmU5Y3dPaE00UDRHYUhZNHlWWHE4SGl4OVhGcDBuWFc0?=
 =?utf-8?B?Sm1tcUpuVmFOR1dVcjU0eE9yaTJKSm9idkdZdDlCYW01N3VYaGswWlFZV2xN?=
 =?utf-8?B?QXp0N0RPRWNoVE1sMk5MSUdERkVtODRBb2RJUDVXZGJoT0Z2TzdtSnNpc0JL?=
 =?utf-8?B?OTlJL0xpdUlQdFIyS1p2UEYvcE82MEl1Y2lNWCtUQnd1elMrTUpUKzZ3clkr?=
 =?utf-8?B?T2RqTDM4bHJKYTkvejNDZHovQWNrVnRqYVdCdS9FWVhERTk2UVk0dzFIcnFl?=
 =?utf-8?B?YXFWZDQzV3gyS2o2UE5FOUpuREtGSXNIelgwYS91emgwVlJWQXd0V1dRUVhj?=
 =?utf-8?B?dkxwd1dlMEpxZjVPTHFENEdNSXNFaTRoMGNlMkRnMWdDYm4wblZsdXVsT1Ix?=
 =?utf-8?B?R2VZM1hrTmExbTBuaWt5ZC9KYUFQOVN1SkRURXY3UFhxQnVacVQvcWxCQ1cz?=
 =?utf-8?B?OGtGY2MxS0xtVUdzUUxjSlRkOER5aGF2NGxIZW1pd3FmZVRQbS9GV1FPZzNl?=
 =?utf-8?Q?O/kPCgmenwROW7rL4LHz0lJhmxIhZCOV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGwrS1NqR1pMRW5CUUFqSWt5SE5ka3hwZWdYZjRhL0p5cDFiMmtNY2lWZGdM?=
 =?utf-8?B?SjNFczBpeTZxWmdLa2VBMHdIQjRFWU03cThLWmRNazBYcUhWZSt4ZmxHcFVX?=
 =?utf-8?B?cjdXT2lSTWFGTm94aTZ4TUR6aHhOWHNlckJZcmplR2RpUkRqU2JmenNFczRJ?=
 =?utf-8?B?dFhsYklUa24vV1lud1h3R1ZIc1lUenZyV2lMRXM0NkdJb3RtcDU1M2JXNE0y?=
 =?utf-8?B?eEJyYWJWcjVIRFRHRzdjL0pXN0xmZ2VNdUlYYlppSEM0WHRFa2Z1RXVEZTBW?=
 =?utf-8?B?YUFmU1YwSE5NRVdlTldvOU1FeGNXemtwaFZpZ0hLb2UxbzhkRGxINlgvTUxW?=
 =?utf-8?B?eTF0QVNQcTJrck91azFJajRLaDNERUc3dEd6N0dwSW96bUtlcUZhNjVLZnBP?=
 =?utf-8?B?MVpBS0RKN2YwYzl0TWdlaUhLS1VuTlRUd3NScllqczdNWkFaOHMwWjUrVDdx?=
 =?utf-8?B?bDdPQkJiRzB5SEFkTllDSG1xQkF6a0FWdXUyL0hicm8zdURiWWNKVi92WVFV?=
 =?utf-8?B?dTFwc0p1cjNkWElNd2N5N0tnTndISUNlQXJYYU1Hc1JtWEdnZWtUM0VMcE4v?=
 =?utf-8?B?RW94R2hINk53bTJQUk9KZk1HYUxESzNOMTJZNDVVRDdmT1NGMlErQWR2SzVW?=
 =?utf-8?B?dUt2Um53NUdUZlQ1SUlYeFlYUlBSRXJUZUVReXZ1TFlkcVJKMlFiL1JXRHpF?=
 =?utf-8?B?RlBZa3pLNXRwRjk2V3NvZW1jeVBkME55eXU1eWhYZysvVUxWU0MzNjU4c2RF?=
 =?utf-8?B?OWFtcDVpYkN6T1VsYVBEcnhubXoyWmpmRjYrNFgvc1paMU83Sit4aGhUeDMv?=
 =?utf-8?B?ZlZNN2RybmZzaWhQbUlsMExHVDAwK2FYcUF3KzhwNVdVZUxWSlh4bm1SMjBs?=
 =?utf-8?B?YXFscW9NbTZHYWJ1OTVOY3N4a1MzaUw3bnVFb1B6WnQxa1FFTUkzdis1bGFB?=
 =?utf-8?B?SndtSTRHRnJKQ1ZQMW1MS09GbmoydFdZd1ltRFYyK2d6YW5TSUxKZElIT3B3?=
 =?utf-8?B?bkVRUisybzhvWkdCTEgyYWxUTUtuMnRsNU5VWVg5V0lySnA1T3Z6dWlSMlNI?=
 =?utf-8?B?bmEvckhOajM0TkJlVEErMk42OWlRU1BuWDQ3bGlUaVpoNXpZRkhudThTYUhm?=
 =?utf-8?B?UFlLRUppdVhSeW9DaC9zS0Ria0tsRS9mQWMzSk4yQnlpbVRFUUdOeDhLUllZ?=
 =?utf-8?B?S3NtNmdFUTBHRDd6WnpycXJFaUNPUHdGbm9EV1d6SGYzRDF5aE5LYjJLNmc1?=
 =?utf-8?B?RzZmZzg0aG1jL0lVdklTTFA5cUkrMDIrSjFlZ0dPdzRNUzJiVm5KS0pLNk5G?=
 =?utf-8?B?eWNVaG9pbjROWHlta3hwNnM4UU9WRVRhQStLQ0tGY1JXbE9oYUI1M3pCQllF?=
 =?utf-8?B?TXJwNG5mSE14RzJTZHNjTmt3d29KZUJIVjBISFRpSUtnSzVDTHRuL09XS3FZ?=
 =?utf-8?B?amZWcU5XdDlPTDJtNStMMmovWlM1YlJlWXlKbnVTbXhiRGxrNDZBOUlvYjdI?=
 =?utf-8?B?ZjRxayt6cU12NHJMcXgxOHhpYTJGVFpWRzZFN1Jxcjg3dE1ha1IzOFZGSG5h?=
 =?utf-8?B?TlVuTSt4NDF2dEJ2RVRkZ0s4MmRIOFFxM1NpR0tER2ptenplTmNWeUxqR3lF?=
 =?utf-8?B?ZGduV1pVa3cyQm0xckJmRnl4cEZBOWNieDlmS2w1RFF2WERSY3FCQnJUeHov?=
 =?utf-8?B?ODB2aGZzUWdUV0JHOW02TkJDTVVIVDBDTUdKZURaQ0UzdE1FVHFRRFcvSFg1?=
 =?utf-8?B?V2V3SEV1SXdpaHV4a1BZa0daK0lVU3hraHpzR0dFaER6aUhyYzQxbmYxV1pp?=
 =?utf-8?B?MkhQa1ZWeDZIUlphRHc2OSttMFhncjlGSCtEdXJzOWpOU29EeXRybFdrY0Mw?=
 =?utf-8?B?U1ZuWU1yc0E4cjA1VE52TExTRjhvRHVzY2dHK1UyOFJ4S2JiaEZaVkpLcUdI?=
 =?utf-8?B?bjQ3UEVtaEp4SktENUJuNkRaS0tjZTQ3cVVOYzFWT0tHaW1wSldhdGk3aVF2?=
 =?utf-8?B?cHMvZjdRN0tHZGp0YXpaWW5hRXNHeEN4R2hMTnlnRnBvUXExVllDcnRibklR?=
 =?utf-8?B?TEhsVnpDYmtJc0RqQzY2WmRIWFU4dWhFQjRoTWNmeXprSzl5WldTcjRlS3ov?=
 =?utf-8?Q?x6YL6N6r4ysDqbsAzX9WBLQ6z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 816fd890-a0e8-49fd-02bd-08de3c7e4c20
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 08:37:07.6163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hIx1M8pAElVb3g8DTyoBOCV+rPk6u4YOPwt+81sGN1qIH98LslLXPSTWnDactm5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7643
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

On 12/16/25 07:42, Mukesh Ogare wrote:
> Replace DRM_ERROR() and DRM_INFO() calls in
> drivers/gpu/drm/radeon/radeon_display.c with the corresponding
> drm_err() and drm_info() helpers.
> 
> The drm_*() logging functions take a struct drm_device * argument,
> allowing the DRM core to prefix log messages with the correct device
> name and instance. This is required to correctly distinguish log
> messages on systems with multiple GPUs.
> 
> This change aligns radeon with the DRM TODO item:
> "Convert logging to drm_* functions with drm_device parameter".
> 
> Signed-off-by: Mukesh Ogare <mukeshogare871@gmail.com>

Of hand looks reasonable to me, but I don't have the time to check everything for typos. So only:

Acked-by: Christian König <christian.koenig@amd.com>

Alex will probably pick this up when he has time.

Thanks,
Christian.

> 
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index 35fb99bcd9a7..bc28117e01b4 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -41,6 +41,7 @@
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/radeon_drm.h>
> +#include <drm/drm_print.h>
>  
>  #include "atom.h"
>  #include "radeon.h"
> @@ -273,7 +274,7 @@ static void radeon_unpin_work_func(struct work_struct *__work)
>  		radeon_bo_unpin(work->old_rbo);
>  		radeon_bo_unreserve(work->old_rbo);
>  	} else
> -		DRM_ERROR("failed to reserve buffer after flip\n");
> +		drm_err(&work->rdev->ddev, "failed to reserve buffer after flip\n");
>  
>  	drm_gem_object_put(&work->old_rbo->tbo.base);
>  	kfree(work);
> @@ -434,7 +435,7 @@ static void radeon_flip_work_func(struct work_struct *__work)
>  			r = dma_fence_wait(work->fence, false);
>  
>  		if (r)
> -			DRM_ERROR("failed to wait on page flip fence (%d)!\n", r);
> +			drm_err(dev, "failed to wait on page flip fence (%d)!\n", r);
>  
>  		/* We continue with the page flip even if we failed to wait on
>  		 * the fence, otherwise the DRM core and userspace will be
> @@ -521,7 +522,7 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
>  
>  	r = radeon_bo_reserve(new_rbo, false);
>  	if (unlikely(r != 0)) {
> -		DRM_ERROR("failed to reserve new rbo buffer before flip\n");
> +		drm_err(dev, "failed to reserve new rbo buffer before flip\n");
>  		goto cleanup;
>  	}
>  	/* Only 27 bit offset for legacy CRTC */
> @@ -530,14 +531,14 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
>  	if (unlikely(r != 0)) {
>  		radeon_bo_unreserve(new_rbo);
>  		r = -EINVAL;
> -		DRM_ERROR("failed to pin new rbo buffer before flip\n");
> +		drm_err(dev, "failed to pin new rbo buffer before flip\n");
>  		goto cleanup;
>  	}
>  	r = dma_resv_get_singleton(new_rbo->tbo.base.resv, DMA_RESV_USAGE_WRITE,
>  				   &work->fence);
>  	if (r) {
>  		radeon_bo_unreserve(new_rbo);
> -		DRM_ERROR("failed to get new rbo buffer fences\n");
> +		drm_err(dev, "failed to get new rbo buffer fences\n");
>  		goto cleanup;
>  	}
>  	radeon_bo_get_tiling_flags(new_rbo, &tiling_flags, NULL);
> @@ -604,7 +605,7 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
>  
>  pflip_cleanup:
>  	if (unlikely(radeon_bo_reserve(new_rbo, false) != 0)) {
> -		DRM_ERROR("failed to reserve new rbo in error path\n");
> +		drm_err(dev, "failed to reserve new rbo in error path\n");
>  		goto cleanup;
>  	}
>  	radeon_bo_unpin(new_rbo);
> @@ -772,15 +773,15 @@ static void radeon_print_display_setup(struct drm_device *dev)
>  	uint32_t devices;
>  	int i = 0;
>  
> -	DRM_INFO("Radeon Display Connectors\n");
> +	drm_info(dev, "Radeon Display Connectors\n");
>  	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
>  		radeon_connector = to_radeon_connector(connector);
> -		DRM_INFO("Connector %d:\n", i);
> -		DRM_INFO("  %s\n", connector->name);
> +		drm_info(dev, "Connector %d:\n", i);
> +		drm_info(dev, "  %s\n", connector->name);
>  		if (radeon_connector->hpd.hpd != RADEON_HPD_NONE)
> -			DRM_INFO("  %s\n", hpd_names[radeon_connector->hpd.hpd]);
> +			drm_info(dev, "  %s\n", hpd_names[radeon_connector->hpd.hpd]);
>  		if (radeon_connector->ddc_bus) {
> -			DRM_INFO("  DDC: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x\n",
> +			drm_info(dev, "  DDC: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x\n",
>  				 radeon_connector->ddc_bus->rec.mask_clk_reg,
>  				 radeon_connector->ddc_bus->rec.mask_data_reg,
>  				 radeon_connector->ddc_bus->rec.a_clk_reg,
> @@ -790,11 +791,11 @@ static void radeon_print_display_setup(struct drm_device *dev)
>  				 radeon_connector->ddc_bus->rec.y_clk_reg,
>  				 radeon_connector->ddc_bus->rec.y_data_reg);
>  			if (radeon_connector->router.ddc_valid)
> -				DRM_INFO("  DDC Router 0x%x/0x%x\n",
> +				drm_info(dev, "  DDC Router 0x%x/0x%x\n",
>  					 radeon_connector->router.ddc_mux_control_pin,
>  					 radeon_connector->router.ddc_mux_state);
>  			if (radeon_connector->router.cd_valid)
> -				DRM_INFO("  Clock/Data Router 0x%x/0x%x\n",
> +				drm_info(dev, "  Clock/Data Router 0x%x/0x%x\n",
>  					 radeon_connector->router.cd_mux_control_pin,
>  					 radeon_connector->router.cd_mux_state);
>  		} else {
> @@ -804,35 +805,46 @@ static void radeon_print_display_setup(struct drm_device *dev)
>  			    connector->connector_type == DRM_MODE_CONNECTOR_DVIA ||
>  			    connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
>  			    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB)
> -				DRM_INFO("  DDC: no ddc bus - possible BIOS bug - please report to xorg-driver-ati@lists.x.org\n");
> +				drm_info(dev, "  DDC: no ddc bus - possible BIOS bug - please report to xorg-driver-ati@lists.x.org\n");
>  		}
> -		DRM_INFO("  Encoders:\n");
> +		drm_info(dev, "  Encoders:\n");
>  		list_for_each_entry(encoder, &dev->mode_config.encoder_list, head) {
>  			radeon_encoder = to_radeon_encoder(encoder);
>  			devices = radeon_encoder->devices & radeon_connector->devices;
>  			if (devices) {
>  				if (devices & ATOM_DEVICE_CRT1_SUPPORT)
> -					DRM_INFO("    CRT1: %s\n", encoder_names[radeon_encoder->encoder_id]);
> +					drm_info(dev, "    CRT1: %s\n",
> +						encoder_names[radeon_encoder->encoder_id]);
>  				if (devices & ATOM_DEVICE_CRT2_SUPPORT)
> -					DRM_INFO("    CRT2: %s\n", encoder_names[radeon_encoder->encoder_id]);
> +					drm_info(dev, "    CRT2: %s\n",
> +						encoder_names[radeon_encoder->encoder_id]);
>  				if (devices & ATOM_DEVICE_LCD1_SUPPORT)
> -					DRM_INFO("    LCD1: %s\n", encoder_names[radeon_encoder->encoder_id]);
> +					drm_info(dev, "    LCD1: %s\n",
> +						encoder_names[radeon_encoder->encoder_id]);
>  				if (devices & ATOM_DEVICE_DFP1_SUPPORT)
> -					DRM_INFO("    DFP1: %s\n", encoder_names[radeon_encoder->encoder_id]);
> +					drm_info(dev, "    DFP1: %s\n",
> +						encoder_names[radeon_encoder->encoder_id]);
>  				if (devices & ATOM_DEVICE_DFP2_SUPPORT)
> -					DRM_INFO("    DFP2: %s\n", encoder_names[radeon_encoder->encoder_id]);
> +					drm_info(dev, "    DFP2: %s\n",
> +						encoder_names[radeon_encoder->encoder_id]);
>  				if (devices & ATOM_DEVICE_DFP3_SUPPORT)
> -					DRM_INFO("    DFP3: %s\n", encoder_names[radeon_encoder->encoder_id]);
> +					drm_info(dev, "    DFP3: %s\n",
> +						encoder_names[radeon_encoder->encoder_id]);
>  				if (devices & ATOM_DEVICE_DFP4_SUPPORT)
> -					DRM_INFO("    DFP4: %s\n", encoder_names[radeon_encoder->encoder_id]);
> +					drm_info(dev, "    DFP4: %s\n",
> +						encoder_names[radeon_encoder->encoder_id]);
>  				if (devices & ATOM_DEVICE_DFP5_SUPPORT)
> -					DRM_INFO("    DFP5: %s\n", encoder_names[radeon_encoder->encoder_id]);
> +					drm_info(dev, "    DFP5: %s\n",
> +						encoder_names[radeon_encoder->encoder_id]);
>  				if (devices & ATOM_DEVICE_DFP6_SUPPORT)
> -					DRM_INFO("    DFP6: %s\n", encoder_names[radeon_encoder->encoder_id]);
> +					drm_info(dev, "    DFP6: %s\n",
> +						encoder_names[radeon_encoder->encoder_id]);
>  				if (devices & ATOM_DEVICE_TV1_SUPPORT)
> -					DRM_INFO("    TV1: %s\n", encoder_names[radeon_encoder->encoder_id]);
> +					drm_info(dev, "    TV1: %s\n",
> +						encoder_names[radeon_encoder->encoder_id]);
>  				if (devices & ATOM_DEVICE_CV_SUPPORT)
> -					DRM_INFO("    CV: %s\n", encoder_names[radeon_encoder->encoder_id]);
> +					drm_info(dev, "    CV: %s\n",
> +						encoder_names[radeon_encoder->encoder_id]);
>  			}
>  		}
>  		i++;
> @@ -1747,7 +1759,7 @@ bool radeon_crtc_scaling_mode_fixup(struct drm_crtc *crtc,
>  				 * (ie all encoder can work with the same
>  				 *  scaling).
>  				 */
> -				DRM_ERROR("Scaling not consistent across encoder.\n");
> +				drm_err(dev, "Scaling not consistent across encoder.\n");
>  				return false;
>  			}
>  		}

