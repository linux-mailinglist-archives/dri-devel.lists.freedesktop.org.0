Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09F7AFCD4E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 16:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B4810E657;
	Tue,  8 Jul 2025 14:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vTHKXRol";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1065510E657
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 14:20:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHmU9VTiipILc7frX0Su+y6T4+Iwp2Pl8KNv0t+rIc5Gd4A5Q1qhUvOR71OsDIMjxea7jSa3ZEWx+2YVf1V+k77DMAtw1OUPRuTbEVXeGmdKqeFoZhptqylVt/y55MdUScJN/SdAtWy8rzvcX279nJhYK6t98ABh/wVYPDCGuN8oMe8H86k/6aLRfWcUerTbVbysXdndZpgWC3Q9XCsFL7ohiw5yiK13UdnRB5QRjU9LB+dN/9vvcteFrv6UBf8g52gCMJ0fPRmXG6h2Z3L4D4MJqt/JNE+kN9EDMyUSkdNiL8WYfYYh/vFGLG9VYw4nqtHi0CRXAKgDiPVH+TQR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNTI2qTjPnmjpaTOkqMokdvRcs09Db9tgdCqR//90vQ=;
 b=RNMqO+guA96rf0luLA+dXsskgpOLjfpYMH3xBFNyUi3J90vXV9vnGWylc5lU+H/M2GinYxtzQ7ikIR1MfVRPfOe/Qnw5v6CDpzzugqdkiSUP/2ulLfLOoxWBEqjrDPnripEahsPFd4YOhmlQgZHMI5TpN/vwPPP6gJcv8V37sfHjqobdw1CXuI2ps3rbEjKD5/LJE1oJW8Ra4z25TOdoYR9meycx1M1yw0+fAuLrzxUhyQ/kMT8acDVwipzhNP9L0tX43emOeacdjEvSyeQYTa9slajBHMmNAKcOZxxTYF87OzpWnAaeo5sEGyoo5zr2MSyuta+1ybOAtqkg7nR+BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNTI2qTjPnmjpaTOkqMokdvRcs09Db9tgdCqR//90vQ=;
 b=vTHKXRolxJOZYOZCLXRWHr0bCfVZROIvU2FxlsJk3NnBYJrsXin7Yqi1wk9xP5/2gKLzs6RaPk+hFcj9YgB5WvurtDBmxp6hRcPPOS6G66EM4fewzllxK100jrZoJgc0NYkdiQPVJhOIfBLJcVtY8KYVYv577HzoFMKG/wUyTMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6158.namprd12.prod.outlook.com (2603:10b6:8:a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 14:20:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 14:20:41 +0000
Message-ID: <1ebba600-31d2-48ed-b08b-46d667d38054@amd.com>
Date: Tue, 8 Jul 2025 16:20:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma_buf/sync_file: Enable signaling for fences when
 querying status
To: Mikko Perttunen <cyndis@kapsi.fi>, Sumit Semwal
 <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>
References: <20250708-syncfile-enable-signaling-v1-1-9f6e6cd9fcda@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250708-syncfile-enable-signaling-v1-1-9f6e6cd9fcda@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: a8a09ab7-1a9c-4703-88d5-08ddbe2a9e6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3JvSkZ6VldXMVpFWllUUnY0elR5emxqUDJHckNjdkp4a0hMQnhBOUo1aFBh?=
 =?utf-8?B?c1Z0WWNIZys1SDRWL3RMUGI4ejdjQWdNUFIycFlaTjFhdUhCU0FnL3JYSTlU?=
 =?utf-8?B?VWpheVppZWh3dlRJKzJvdVFMYjdLVmVRNmI0TnVwcDduN0FLRFZMak00L1Yv?=
 =?utf-8?B?OG9uSHJHeS9FMllUVnpvSTB4dE41c3BVTkZGT1lSQUl1UFVsUzltUjM1UzZM?=
 =?utf-8?B?S2NFUEdESkpFYnhvUVBWaURyZXRWTENOSlFRcVgwdmxuajAvL0h6Y2ZCR3pm?=
 =?utf-8?B?L1dkOWt4QU9VQmZGYzAraWEvL0duaUZFb1h3ZDlEVnpmOEJaaFNTOWpBOWls?=
 =?utf-8?B?WDRZWUozaEdoTk9mUk95bXBMZUd0Mldpa1gyb29LcnBTRmYzaG5hamdMdlM2?=
 =?utf-8?B?ZUhCaVhlS0tQS2JaS0ZEck13a0JQb28xMnhoSldnZEVJakttNmNKNFF2bEZr?=
 =?utf-8?B?enlqSlM5YzJwc0t1YnFZTFpxcWpDMjBqTXVNd0dYTE5JaHorS0gveW41Vit0?=
 =?utf-8?B?OVBOT1YwSEI4TTRVaE1YN1cvdGxQS0tMdFB0T3JFNks2aGhxRWFJT0E3MDNZ?=
 =?utf-8?B?Q01DZ0pNMlVDSjl4V216aklIdjZwVkNuQUM1Uzh3VXZWSWY2RnBwQTVHWWox?=
 =?utf-8?B?eVNpaDlMOThhWisvU1ZrNU5tQXAyTmgrM09DR084bERVTnp1NHkwd0FwL0pR?=
 =?utf-8?B?cjVrTlF5dFNadlNTT1Nzdi8yRVFDd0hDbnlhckc5YlJKSUp6TFhWQWtJcmc1?=
 =?utf-8?B?VkMzeXB5ZE1YQ2R3cDBrUlpiRm1EVFYxQ1pSV1RENGljSnVRdUU5OURGVEo5?=
 =?utf-8?B?SnRLT05ta2ZuYkJ5MU1lelAwcms2NGpPVUhTMktYYVZIMUFTYlVxNGRyOUJw?=
 =?utf-8?B?NThCdEQ3elB0UkpWRnJ2UTBOUTZTcFhBNGNPSmYwN3dVZGZIZUhBdTFkNXlh?=
 =?utf-8?B?dmxXMVJkbjh1bUFNQkR4Rk1oRGtDMFR6R3JNVDV2c2plK2ZVSXc3MnFqcG1n?=
 =?utf-8?B?R09MSE1Ca04rUk1pdWREWVRLbis4alcxdE9HYmMzMnVpMEc1akljWnU3NFFu?=
 =?utf-8?B?WDdpZWdsQTZQL21vOURKZjQ3S2FqZ2JMMTdSdFN3YlNkU3hYVEdpc3hvSlhC?=
 =?utf-8?B?REVIalVNNVZ3bGtyKzNKc0RNenJiV1dFZVZ1aUhvOHBLOEI2amNZZk9rS3ZR?=
 =?utf-8?B?ckkxMzVKMWR2L0pyZ2w4emlEVE84UGdQUVZnNi9RUG5VK2w4bWRRVDV2b1k2?=
 =?utf-8?B?NEc4c3NKWVB2ZXprSVo0dk1MZThzbi9GTlJKYTdsaGJVTC9oUEMzT1U5L0Z6?=
 =?utf-8?B?djBpaUF3elJVWGtlc2hMd3VjTGpYN1dmWFQ4ckdhdkJLVHd3S1VoOFR5QnA1?=
 =?utf-8?B?Nm1ON3Y1OS9uNkQ1VDFHVExKYkhGbXNBVWVvTyswaVM1dTA1WmhNNDNyR0VD?=
 =?utf-8?B?TjdGaDVBVHdjdWRoTkM3WnY2KzVVa3VMWUZ0bXZ3TVhpa0VaRkRLNWtlRjFo?=
 =?utf-8?B?OWJ6WnpuTzNpWFNwVWp3TFpEQkZDT3FpMFNZUnFFMjRvZkd0aXNyZE5NUEt2?=
 =?utf-8?B?RkhTRm12RklpRVFKa3pNQlk5SEExdG9nRWxDUjlLZzBQVXZUV3oyUEVkVi9Q?=
 =?utf-8?B?d2hINGhVZWQ3cndhSXZBM0hWM1Qwc3l6RW03QmlIZ3VUejEwTC9Ud3JnZE5K?=
 =?utf-8?B?M3pXT0g2MExnL2xUZWl4bngxNXlaVm1qNVNDYUNiUzAvZElPeXlhMTc4RGxr?=
 =?utf-8?B?SmxUc3lXMCtKSzNBMkxqVnJ0aU5zSHE1UzBUc2Q3aWRPaFZWQWUrR3dEZkRE?=
 =?utf-8?B?T1NNL3pFUGlaOER3MWJvUEJzMForREoxakVrdi96TGhKN2dlQ0VoYWxjYmxu?=
 =?utf-8?B?RVFPRUprUGZHREFiRkp6eFIxVldNb0JMZ0EwSW14Z1JiS2h5WHhwQ3JRWHRz?=
 =?utf-8?Q?Dl8aQzNQrJA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEpyd0I5YU91SjJ4YUZmODFCcmlsSzJqa2tCRnZscGdQemYrRituVlh0Wkdo?=
 =?utf-8?B?c3RMamsybld3bi9HYVBhZmpSV25TSlRzOE1IM3Q4THR0TFlaeGllcjdhN2pU?=
 =?utf-8?B?ZkZuTWhVekp1WUlQMzBhOTZ4ZkpMUFNtZDBnOGR2czlCMjRHMFZtT21RQlBo?=
 =?utf-8?B?d2MzZEU2TXFBRjN0b0tOMUg0OENKQmJyRU9SNGR2VkgzR2FpNi9jT0VzLzRr?=
 =?utf-8?B?T0hQbmRaVi9UVUJaQURxVTRHQnRqSVQ3b2gxeHZhekY3QVVrVEVnU1laV0tL?=
 =?utf-8?B?eHYzTnFsaWRGRzNRanp2enVUMlVqdUF2SDdIMlRmYkhoRCszZDRmV1lVQW5k?=
 =?utf-8?B?QmF2akZpNE40VnY0TzdxaUZBU2VSVzBjSDREU0hWUkNzNk9sSXFsMVoxSXJV?=
 =?utf-8?B?ZWxBd0RPVkRIWmhLMnJsOWpMajZEZUViSWZWVTNHd012N1pYdXNycFhmNzNi?=
 =?utf-8?B?ditJNzhJV1NGQWE3QVlWbllUbXMxN2k2OEkrb3dTTDZOTFlxaFhTRjBxd2Ey?=
 =?utf-8?B?N0lYMTJ5Mjd0QjRvS3Rqa0xla3g2WHBNbDk3eXc2ZFViNks3VUNwZHNLWDNR?=
 =?utf-8?B?SE16eThTbGJIRHkyMGplTisrZHZDVnJVTlEwZm9rMThKV1FBSGgzSWFzR1F3?=
 =?utf-8?B?NUxneWo2SnhrRzZodURRK0txdzQraDNLTEd6N0FaMTN3UkV0ODkyRGVjcm9G?=
 =?utf-8?B?bERjWVluZ3hvQmh5akJSeVNZeGVYZ0o1QiswaDhFcnIveHR2TGpvMDZWTmhX?=
 =?utf-8?B?cjZiOFg3dnAxczloOUdaVU5TVnR0YWxHTndQV3crUUpockZIRWxScTNaN0Rt?=
 =?utf-8?B?aGxCUUlXelhxbTl2SEpEYm80U1ZSNWM4elpJS3NoZzROUFZvU2RZU25iRkdB?=
 =?utf-8?B?RnlodlFJOGpHbEd5bUZOZHRiaTVwRWtNZkg1TkZCS1ZsOGN6L0hvWTJjOTRl?=
 =?utf-8?B?L29WUHF1OFVwczlWNmhkWHh6R3htQ2lSMGN3eFVxKytUd2F3dzY0V2E2TGln?=
 =?utf-8?B?K3EwaUxDV3cxaXRLZkNkL1BHUk5YcU5IYlZuZDIwSUdQY1N2TkpSNWNRL3Fh?=
 =?utf-8?B?OU9jandIQldLdzJjRnBZNXlCdldRK3FEMCtZRVlGSHg1TmMxRlZwUEFrRyty?=
 =?utf-8?B?ZkF2aUkwNlRRV1dmcXpxT1B2amkwdW1hdkdHb1U1SUc5dTFQSURmNlllNmdy?=
 =?utf-8?B?R1RCaEp0K2NMNTFWSEsrdEFzeFp2WWxiVjdKUzZlcFNNVVJiNVN1TklNS0tT?=
 =?utf-8?B?YytpNjAyaEFjVnVnZG1pa0RiRERkSWVXZzNLcmhUSzJ1ZFlGYWQwazg3RWZt?=
 =?utf-8?B?NFh4MU5EeTNTYkdDdHFIbXVXVnlIck9SR0puTEMyYVJDZzFPNFNPclp4S2o1?=
 =?utf-8?B?SWhmRnJNZERodWlkMHFxRlhNbHM0REFSS1Q5a2hKOGd3MUptSEhLME9ldytI?=
 =?utf-8?B?TDhReVRBK2xGZlFoYVduZEIwTHk5SVJwTVpyQmY0L2swOFBvNEs3NlV1MDJH?=
 =?utf-8?B?cWxMclpaWS9LNU1iYUVnclQ1U25Sak9DS1hCQllGZTBabTBVZHNjR1RoUEhx?=
 =?utf-8?B?NmY5SVk4ekpYV0pSampYajluYkVuQWdEYVk3T2JRM1BiOGkrS3hyTENyRnVV?=
 =?utf-8?B?MUY3ZnQvTDREeWxoSU9VUGFCYTh6ZVdJM3c1VGdYdyttSHFlN3JnNmg5LzZn?=
 =?utf-8?B?S2t2SlhONm1LckNNamx4VytuZ05Jcml2cHF6WGcvQWlYWkhHUGFjVzJqU2Zn?=
 =?utf-8?B?Vml4Sm5zdGdkRlp6ME12eC9iUXFQcXFGa3hZZnN6U1k0eTNpbFFCRUgxOExT?=
 =?utf-8?B?R3lxT0pZOXJJUlliQkh1TXJ3bHViU0VKQ01PZVZhNGo2QTdTTjh0Vi9LQTQ0?=
 =?utf-8?B?TzJBUlM1bSsvSWVXTXlFYUxsYXE0QnhIS2MwOHZTSGM5azRyS0RNWktOMTNu?=
 =?utf-8?B?UXYwU3VHTUc5OS9QY3hYa2RPemt3dVFLZnNHajhad1Fta0xWU2x3aW52YUJp?=
 =?utf-8?B?dDdLdXBzcGQraEpqWXdQSHVQaEsyb2dPeXJwTmo0TEFmQWMzblB4MTJ0ZExS?=
 =?utf-8?B?bURRbWQ1N1ZRZndzb3F4QUp2T3ZXUTU2MUsrTVdsOHJuUXc5eWk1R0hCbmVn?=
 =?utf-8?Q?5X2jF+GpCTqZOgF/qcuNVcmKi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a09ab7-1a9c-4703-88d5-08ddbe2a9e6e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 14:20:41.3937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzTmqV8/caKKU3Iy0v2fWxrzZEwcsKVLTsXzYA+rmGswm794bRQsqNB1ekuwWFQo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6158
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

On 08.07.25 14:03, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> dma_fence_get_status is not guaranteed to return valid information
> on if the fence has been signaled or not if SW signaling has not
> been enabled for the fence. To ensure valid information is reported,
> enable SW signaling for fences before getting their status.

I don't know how often I had to rejected that patch now, we really need to improve the documentation :(

The fence info query exists to query the status *without* enabling signaling, that is the whole purpose of the function!

If you want to enable signaling *and* query the status then just poll on the sync file file descriptor with a zero timeout.

If the signaling timestamp or error code is needed then that can be retrieved after signaling through the info IOCTL. 

Regards,
Christian.

> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/dma-buf/sync_file.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index 747e377fb95417ddd506b528618a4288bea9d459..a6fd1d14dde155561b9fd2c07e6aa20dc9863a8d 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -271,6 +271,8 @@ static int sync_fill_fence_info(struct dma_fence *fence,
>  	const char __rcu *timeline;
>  	const char __rcu *driver;
>  
> +	dma_fence_enable_sw_signaling(fence);
> +
>  	rcu_read_lock();
>  
>  	driver = dma_fence_driver_name(fence);
> @@ -320,6 +322,7 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
>  	 * info->num_fences.
>  	 */
>  	if (!info.num_fences) {
> +		dma_fence_enable_sw_signaling(sync_file->fence);
>  		info.status = dma_fence_get_status(sync_file->fence);
>  		goto no_fences;
>  	} else {
> 
> ---
> base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
> change-id: 20250708-syncfile-enable-signaling-a993acff1860
> 

