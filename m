Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8366AEDC08
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 13:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FAD10E0E2;
	Mon, 30 Jun 2025 11:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nAYRs6Yn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA2E10E427;
 Mon, 30 Jun 2025 11:54:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KeNqrK9ecbjgYTsLZELjWmZ84WYmNk61ybIQN6EBKKdkIe2tE6Acth6hLRSQVYCiDS/XBhug2QqZ4Vc8HEJh4YnPqn5JkQZzm8v6mk71kVOFPgcfyadKKwaR7p6qMyAEWYNbRmVIQMf0UCRtNz/n2KoY2CwIwA9VyF2fQe64O0Hqz5b8hcUv/yD37E3/o4RYTQIUUtaVhaVs2Eb8/MDDReNIChAqqJosW7odqNMjguKFfjEEF7TAd5uZGUv2AXqkbI1+2A3G5ISlaGSKjuLLcpEEWcxVlrOsACu41SJ/kGIICxtpKi+Np0Grrfwp1n9jcprAldkhgkBqr2REvk6z1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMWgl8m+/dtVibuEN9AB7pG82aPHMT41FrOHkGRGa9M=;
 b=cGS2HUS0GHGXbyCevZYi20lptHTKZJfql45yMagUtRje1gvA2cTuRTVIMAq3M4fYal4O4uCndeXT/kNU4zKe2qS59IqlcWNmOGDJ7afXAApTyYiKpgXVNrwhrvpeXkrCi+8WkpU82iaqUPfoisQm1DndfqiFGevuNX3GvVhcxQkEFCIbJnK6yywr4baNTstGlhztz34XRM2B3lX6R7fzv7b3mZFZDO4WkC/fvnuT1MwIowBFjjmMI1TkUu/klAjL4PmQX4K7WB0Q7nLkc48GJsSPkLR8qYktty3kIed3TJ5qJ/5BWj/xluSd2oTszZYZXYN0ShFtpaS/EapiurDZ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMWgl8m+/dtVibuEN9AB7pG82aPHMT41FrOHkGRGa9M=;
 b=nAYRs6YnkURMj0qhaJBXEVCuuYxG9gMP0tYMlXvMVFWhZyxGwCQrXFfXSVsgnkIA0gST0FC7eeXB+X6ohnjeWWaofsi13thQCc3tEUW7S//J8WGcWm41YFrF/8XwX5rRtKBfgMKZFBmsTbXhpSLUVxHrYcxzR/6rq4aHy7Az1So=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7801.namprd12.prod.outlook.com (2603:10b6:8:140::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Mon, 30 Jun
 2025 11:54:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 11:54:23 +0000
Message-ID: <ce04e266-6c3f-4256-aade-bafca8609ab3@amd.com>
Date: Mon, 30 Jun 2025 13:54:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/amdgpu: move GTT to SHM after eviction for
 hibernation
To: Samuel Zhang <guoqing.zhang@amd.com>, rafael@kernel.org,
 len.brown@intel.com, pavel@kernel.org, alexander.deucher@amd.com,
 mario.limonciello@amd.com, lijo.lazar@amd.com
Cc: victor.zhao@amd.com, haijun.chang@amd.com, Qing.Ma@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250630104116.3050306-1-guoqing.zhang@amd.com>
 <20250630104116.3050306-2-guoqing.zhang@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250630104116.3050306-2-guoqing.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0308.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d4e3045-98c5-4d2d-e7e0-08ddb7ccdaed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eU1IeUZpVE1kcFQyQm90bTE2M1hJQU5VellubjdJekFCY0xyRjVPRW0xYWR5?=
 =?utf-8?B?WHgwb3h5dDArSHdCekplY0V1cWFVOEpkWUN5VTJVWktpdncrU1BwYVlhY013?=
 =?utf-8?B?U1lLSDEzdWY1YzNtcXlMM0xrRUI3M1dEWW5OazJ4Z3RrVWE5ZTNSdjhIZmFX?=
 =?utf-8?B?Z2ZVUGovRWJLUS9kenVQSHphYjllc3kreVRVYnFNbk4rMTJFdWhCVU96eHZj?=
 =?utf-8?B?VzNpUFlUZm5mL3gxZTBGZit0Q2t1Q1VUdmEyamFkbmMyV0xLcDRycHlvRHBo?=
 =?utf-8?B?a0t3VDV3bTc5bGxISHg0ZUxnWUFSZnhnR2MxY0pObHNuZGxxSG41Z20wUUhG?=
 =?utf-8?B?bHFwNzQydm50bm8wdndCVW14Yk1EQ2dkRWNFK2gvWWVGQzRRRHNNVlhOQ1Fj?=
 =?utf-8?B?ODZJbVM5U1ZCSThwdUc2b1VxWjF2YWVBNlRwWU9OK2h1Qy9CbTZCdDhrRk93?=
 =?utf-8?B?UktyVk9DNmJURXJCTnhibCs3TDFLS1d4cUR1NXRyL3h3bWRzYWI0UFBwdDd5?=
 =?utf-8?B?ejc4VXlaQ01nUTM5OWpNbmVKUVBiTTQ4WEZnanpDeVMxOEQ4RDM2MGc1NlQ2?=
 =?utf-8?B?aThZZXovTUxEb3g2SUhuakg4MUhjVlN2dW44UExEVnB6TFpMazBNVGVFYXNH?=
 =?utf-8?B?eCt6S0ExaDVCeFkxUUxDdUlib2o5cWNZZkN4S1h2WGVXYS9aaFNLakFOS3NR?=
 =?utf-8?B?MnVnc2g0ZGlWa3ZCMTNaOGxyN3VJNitXZURxMVZ3YWlHQ2JJNHA2WGpBemRT?=
 =?utf-8?B?U1h5c3ZmNnAvaVErWTdOMXY4ajk0alNndU9nUThNc3lRRXNIamhFWjZaQUF1?=
 =?utf-8?B?a3czdmtiL1pHL05ob0R5cjM0NlVjR0diZmZ5UVlka1ZIMmRVV1A1a2VGKzlL?=
 =?utf-8?B?N2VZTmY1a21WTVdkb1ljUThIN04zWWgwSXlmM1lrcG1paEZNTGhiV2dIZFpM?=
 =?utf-8?B?eHZ2SnZBaHhPTlVHa0REcmF2dStYMmZOQWR3Zit2UlN5RElHa08wWktFM3FP?=
 =?utf-8?B?QmluUWhVaDdiT3RhYTd0TFJqeVlYWUdkdklkNE96M2NKYTdNcVR4elZHbEZ0?=
 =?utf-8?B?a3hXTTQvUlFteXhhMzBlaHluVkVwRUF2UHBCNElyMDdySDZvNDRoM1lyNGFH?=
 =?utf-8?B?bGZZQWR3SXBSQzdtVFhsNDAzMldIQ2ZvYzBaOXdTMmtkZUZWcFJLbGcwbmVP?=
 =?utf-8?B?b1QyR2ovYzJHOFVTTHpRVWxqNkY3N1dsVnUzSXdldWZLSW5QRFlPLzdhWHUx?=
 =?utf-8?B?bVlsdHhnM090RCsxMWpmTTltUkxFMkZBUUUyalpIS1UvS3pKMGVTRFZXMTk0?=
 =?utf-8?B?Q0pvLzRjNVZKTlBERXUzWHBSVEFXNy8ybzhTZXAwMDhlWTg1cDEvSndZNGZu?=
 =?utf-8?B?SWE5VlJhdGJQOGxEOVZrMWNSMDEyL0FnazlLMGJrTjVHb0x3YjcxT3pNVXdC?=
 =?utf-8?B?alhETTF4YUZuelh5bUg2cUNvZGhlSmNvQm5hTGZyQko2OE1MdFFQOElUeGp6?=
 =?utf-8?B?Wjh6NXFFV2ZOeE90ejhtZFFOKzhkU0Q2RVQ3dngvM0pyVGJmN2NzNzlabklS?=
 =?utf-8?B?cXNqbmQ1MHdwMDRTdm9iSy9VU3pQRWQzd1k2cFVIQllhaVNIc01iN2pNZTdN?=
 =?utf-8?B?YTBlQUxHa1A2YVErcFgzMGtVQUtDcE5EYnZqbHo2UUtGejljZUFyS2x4WGZr?=
 =?utf-8?B?a25mM29IMGFhZ3RYMzd4a1BmMFJYUUNuWkE5dUlJZDBybHhIQjNlRDhKRnlQ?=
 =?utf-8?B?OUVnYzdSbkJ4eDcrMjBXcHJwNEhxK3FZSWhQR0cxcFRjc25RV3FhWWdYcnpV?=
 =?utf-8?B?bFNiUWpmSjR1VEc2RGVhYlVtWFVjZmtLdkJpREtJSkpSNlF5dTJLWkZmS0I1?=
 =?utf-8?B?YkhnQnJKTEpNc1luM3gyUi9qV25Eb09yTmpvdEI2MFhpeVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXV5Z3gveTB6eWFXTHhXUnlQRXhGS3hUQTJ4RXFtbHpGQVVFalRrOFZyTTBS?=
 =?utf-8?B?T1dYSWpPcTR4UzZnSXRnUnRYbXZSZWJ2VU1PTm55alpHdlJGV053M0lYQlZ4?=
 =?utf-8?B?d3kvQ2FJZTkya2M1L2thU1Q1S3p1T3lIQXM2enZ2aVdtTUtkUkJiM29iSDlT?=
 =?utf-8?B?RW55ZTc5YUpDdWxtdzhGZVNXNElQTXF1c3JKaHV3UFhOMWR2MitkcS95b0Jk?=
 =?utf-8?B?SkpiMVlEaVRLVWR6QTNWU292ellwWDdJUWJvVWIyK3UwbGRxVVc5S2lDWGtM?=
 =?utf-8?B?NHJRMFpBcU9ZRmVWaUVDdmxPcVhpcy9yTExvcUk2d2RuOXFOT0ZvbjhHbUpO?=
 =?utf-8?B?TmNKckFqcEE4RmhsZm1XOWJ3N1JxRVYvQmMxVkdHZFBZU0RVOXpyVG40elF3?=
 =?utf-8?B?b0YybkUrSUJiMFkydENzYStRS0I0ZEZWZXpLeG5WczRhSUx0WGRDd1Y1SHR1?=
 =?utf-8?B?L0oyMEU3QU9lM2tnVFZ0Uks4OUxSaGI4K1BsSXJQbVZqc3k1cStOWGlBWVA4?=
 =?utf-8?B?T0Q3bXRCWGxhUSt4UzBZdWR5SVdraGN0K1ZtbGIrdDNnSDBuVFoyU3d4Skht?=
 =?utf-8?B?ZjlpNStUZ1p1WEhhM1NtN3lQS1F3NEp3dXpLQnNCUnhiWklBeHArRWhlcUVE?=
 =?utf-8?B?aHFQTDJkUm05QTgwWG4wREhrMEtRQkN3S1licGQrTzF3bk1xUldMTWhnZ012?=
 =?utf-8?B?S0p3TUxQYVlTa2M5Tm9CbXh2NnZiYi9NK0Q3K3NkOGxoUGdyWUJpb3lkTWZE?=
 =?utf-8?B?YUNHdFkxRllCeTFRc29WZklKaXF0L0ZDaFRTZ3lIbXo4TDJtQ2xNRkFhdC8v?=
 =?utf-8?B?RzZSelpNQkxlZEdrV1ZpOHJPdFI1MDFEbUdiWjJzNnorczZQcWp4OFBaaVh3?=
 =?utf-8?B?aU1pYy84bVBncU9nQnRJUk5RWTVuelQzdmh5eE5iazNzRTZJN1Z5Y0tObXlv?=
 =?utf-8?B?WkNxZUltcWV2VVE2SWcyZ29uK2ZSTVhGTmU5RVp6STdnK0xtSGJBcGtmY2JC?=
 =?utf-8?B?L0ZKV0gzQW1oM1J2VVpBN240K3F3L2RMSkZtOExmNk5CMGFuMFE0M1pROTlH?=
 =?utf-8?B?NmpOZ0E0c2FpQVdDTXNCcmhiaDZxNHROZGhTRC9XTmRoSWNiSzhxWHljV1p5?=
 =?utf-8?B?RlhOOFZpTEt0ZEhNYitOYzBFOGt5b3VGSlorR0tOQjhDbElZN2NqcDg1Qm1r?=
 =?utf-8?B?bHdqK25IaTQ3NG1UUVloc3hSb1hEcHlVNGpOK3IwU0FmSHFXVGRyZGZSakVU?=
 =?utf-8?B?ZTFZUU5tOGNJOFVGNTFOMjNtM3grNUppNlV1MWpBSlFrNTVubnNDRERIZVVO?=
 =?utf-8?B?ckpLV1RkVnNhS3p5MEZhSjd5Z2Q3bVFNZlp5dG1VVm53QjYzTGVDL1I4Tlph?=
 =?utf-8?B?RXdHSysyZ2YyMnh5RVROQXZ2MEpmamxVaXpiTU8zckRaaGUzenk0N2FDeElj?=
 =?utf-8?B?RjhBeEF2Mmdjbkl2eVVzUW5RcUNyTjV1Y0NSSzB2endlU1dEZmpPcXNOVnB5?=
 =?utf-8?B?T3BUK0ljUThxTnpITmV6Y0l6bzFXdG9iekpyd1JTclFRY3B1SG9GT3pUcWpk?=
 =?utf-8?B?elJITmRDblVNOFQ2RldJdGJSMDI4a0c2SXZ3ZU81WnpmaXNrenZoajBzdUZJ?=
 =?utf-8?B?dlJzNG95WFByR1YrWWVwYkFUZVIwTGlPdHJ3ekI2TWRYZjNPYnVHTC9aaHg5?=
 =?utf-8?B?MW15bHlIM1diNmZqdGFzNHNjblJiazQ5QWozVkU3VmwyOXFndldoSjRHbkU3?=
 =?utf-8?B?b2RIcGFZcHNwdXo0V05yZG9GeHdtNHlONVZIOTRaK0VibUpUbThQMnBPb3pk?=
 =?utf-8?B?VGwzTGU2UjluQVRQNmtacU1hdEg5cjRYdDViWG9iT1dLSGovYk1vRlpPZW94?=
 =?utf-8?B?Z3N2WEQyeFRhUnBNVFVsVHZ1QmFWWW5RTjhTQUVTclBOL1dZd0RzNkZWL3Vo?=
 =?utf-8?B?NUpQOHBrcCt1TG9sVFBENUxnZldRbytBVjJYYjNJcExETDkvSndhUGEzVmdn?=
 =?utf-8?B?a3JzMmZ5TmxaMC9SKzd0T2x6Y0o1VEtuTldoSkpaRnlnWjNPNXlKanZqdmhx?=
 =?utf-8?B?Tm9vZ2V3bzZIZTZieG15VzNQdm5CRTdOTlZDS1FlOEVmN2puc3BqKytMblBr?=
 =?utf-8?Q?/A8Qv45toq7ga5tpLFDg8occG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4e3045-98c5-4d2d-e7e0-08ddb7ccdaed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:54:23.2545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0uYp8QAPtfNPYiJHqA+bE+fl5lXRDPedYOXsQXbnOGIpCzoE2alTsktXhVMxlGSd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7801
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

On 30.06.25 12:41, Samuel Zhang wrote:
> When hibernate with data center dGPUs, huge number of VRAM BOs evicted
> to GTT and takes too much system memory. This will cause hibernation
> fail due to insufficient memory for creating the hibernation image.
> 
> Move GTT BOs to shmem in KMD, then shmem to swap disk in kernel
> hibernation code to make room for hibernation image.

This should probably be two patches, one for TTM and then an amdgpu patch to forward the event.

> 
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 13 ++++++++++++-
>  drivers/gpu/drm/ttm/ttm_resource.c      | 18 ++++++++++++++++++
>  include/drm/ttm/ttm_resource.h          |  1 +
>  3 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 4d57269c9ca8..5aede907a591 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2889,6 +2889,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>  int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
>  {
>  	struct ttm_resource_manager *man;
> +	int r;
>  
>  	switch (mem_type) {
>  	case TTM_PL_VRAM:
> @@ -2903,7 +2904,17 @@ int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
>  		return -EINVAL;
>  	}
>  
> -	return ttm_resource_manager_evict_all(&adev->mman.bdev, man);
> +	r = ttm_resource_manager_evict_all(&adev->mman.bdev, man);
> +	if (r) {
> +		DRM_ERROR("Failed to evict memory type %d\n", mem_type);
> +		return r;
> +	}
> +	if (adev->in_s4 && mem_type == TTM_PL_VRAM) {
> +		r = ttm_resource_manager_swapout();
> +		if (r)
> +			DRM_ERROR("Failed to swap out, %d\n", r);
> +	}
> +	return r;
>  }
>  
>  #if defined(CONFIG_DEBUG_FS)
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index fd41b56e2c66..07b1f5a5afc2 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -534,6 +534,24 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>  }
>  EXPORT_SYMBOL(ttm_resource_manager_init);
>  
> +int ttm_resource_manager_swapout(void)

This needs documentation, better placement and a better name.

First of all put it into ttm_device.c instead of the resource manager.

Then call it something like ttm_device_prepare_hibernation or similar.


> +{
> +	struct ttm_operation_ctx ctx = {
> +		.interruptible = false,
> +		.no_wait_gpu = false,
> +		.force_alloc = true
> +	};
> +	int ret;
> +
> +	while (true) {

Make that:

do {
	ret = ...
} while (ret > 0);

> +		ret = ttm_global_swapout(&ctx, GFP_KERNEL);
> +		if (ret <= 0)
> +			break;
> +	}
> +	return ret;

It's rather pointless to return the number of swapped out pages.

Make that "return ret < 0 ? ret : 0;

Regards,
Christian.

> +}
> +EXPORT_SYMBOL(ttm_resource_manager_swapout);
> +
>  /*
>   * ttm_resource_manager_evict_all
>   *
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index b873be9597e2..46181758068e 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -463,6 +463,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>  
>  int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>  				   struct ttm_resource_manager *man);
> +int ttm_resource_manager_swapout(void);
>  
>  uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man);
>  void ttm_resource_manager_debug(struct ttm_resource_manager *man,

