Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11384AEDC7D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 14:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9DD10E42E;
	Mon, 30 Jun 2025 12:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i8+xICXB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2082.outbound.protection.outlook.com [40.107.212.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B7510E42B;
 Mon, 30 Jun 2025 12:16:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cM8N4Kpp7wA9kTyfPQrSmj4p2+ONcZz7sF5CWDrpX75jrl7uwIb0b5xjStqtbnYBgWIhsRgE55UiRaWNTeq/U02yFq9ffzVEJvlHXo1K7lEMGhIP64y3kDwsMM69BfrihcExzae0+n3GPLK6SWgKw6eMqdfisC6jh4lGJKVd2WbfpIzoUwT5fUnRfwwUDLl2zO/KZc61E0veBxLbF3CUhqyNMo26U3vZ65qZzW8dEJmUAkKTbBfFham1Jwb6h7I9+ftfXa/siYSzvbMQKSMHbazjLqD8dRH45nYtstYEd21aJHufh6HTQKuHLZRI4qYGXdwWX/5zKtyZhuw8L01U+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pV3bMY4eKQ6FnODXOBev8qZis8aftVu33uURYgiBos=;
 b=q/QY+pGLt43hGafsRqJzvt3K34Xm39lZNt45TCfs7PJYBhDRUJD2RowE/AS6h+oUBSydusGSZSIeWByuSjZfV78DPWz1BxitJmJyQv+lq2yr4nYbC4OMUvuAOsYZNwPyYb6Z2L8NF9JYZ6NO2qdfPMLLDqBc59hqCfhhsJMpadlo9R/QnidHCUoeD4ipheBMH8WWi7xNrG7/DHyscSlI8auA9J7hl9u6Oa9QJv6Kboy1jd68b9+ixyoFCX3iusVplORQMHGpTaBrJZYmPq6Z9UqZcyNRjJ8f2QFrCP4fjdbEJ7R2XmW/wyGhxcevy5AQaHvKSE1to4LvnmAqOq0vOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pV3bMY4eKQ6FnODXOBev8qZis8aftVu33uURYgiBos=;
 b=i8+xICXBWvH5lKll0ep3YUcu3qyIVSBwE5XzQlwu+CbQvHreBtSv6ouBLyxbchbDStxZREGbSAqdEpsSbYq21F9cnYSlMU4UXWpJ8WvbyqYOQmX1eXTiz2TkM6FPai2pKMlkeVsq9RPyvo+0Gr9GlvhktK52FqNU3SWiZl/XxJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6527.namprd12.prod.outlook.com (2603:10b6:930:30::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Mon, 30 Jun
 2025 12:16:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 12:16:20 +0000
Message-ID: <242ecb2b-7445-4023-b740-68384c9aa914@amd.com>
Date: Mon, 30 Jun 2025 14:16:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] drm: add debugfs support on per client-id basis
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250627094921.911009-1-sunil.khatri@amd.com>
 <20250627094921.911009-3-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250627094921.911009-3-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6527:EE_
X-MS-Office365-Filtering-Correlation-Id: 657452b0-4c4f-4b55-26d1-08ddb7cfebf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mk01VHFnYkhPWmNORnBIcXJjenk5b0xhakdnc1VkaStpT2VLS0pVSDRoT1hj?=
 =?utf-8?B?RCt2QWluS280ejZYN0dsSkNOZERnNExGN0dRdGZXM3pDeHpQc3dIWnBYSFh6?=
 =?utf-8?B?ZU5YRVN2ckJYa3E3YjZ5MWUwek5LTjRVZnl6ME5xKzh4cDlJSFdlWWxOWFc1?=
 =?utf-8?B?S0RrZGk2cHVTRG44U01FdjBZVlZ4cVN6Rjlacm9zcUN6SU9WVjQ5YUdnb2ZU?=
 =?utf-8?B?LytKUEZwWTNjUkFxbEFKRWZ1VllZTWl4OTR5MXh3eFdpZ1RPN1lPcmhXYkxL?=
 =?utf-8?B?UkpOdjJuNHk3OEhhcVlHckduN0VXV044T0VaOVdoNkxqQW9rRXYrZ2ROK1Jw?=
 =?utf-8?B?SVN5ZVBETG1KQXVtSjZqeG5DUGRIV1ZHcHhLaG5xcjcyUlh5TUdiWjBJZXRE?=
 =?utf-8?B?c3BTcStoS01ycms5MERTcGdOSEdEUmFlTkFEYW1WYW9IaHpkOWdaTkREVFl2?=
 =?utf-8?B?dTRCRHVJd0xEcStQQTNIajV1aWtKeml3S20xSGNEU05NUWFnUG9WdGorTE5V?=
 =?utf-8?B?WDJQQ3dmRjFCcCtIZlFRdW1FV1NtOVlJeFAwUk1yQ3RXb1llaFlDMlFlQUpt?=
 =?utf-8?B?N0ptVmxzMWx4TWtIbkxIY3FpbGRSWGV5citkWGdtbFNjaHdjQVkyU2tER0xo?=
 =?utf-8?B?bnNGa2ZGV2xETXFXcG10YjZXM1kvMkpZdG9sczFuc3BkZG1QMXMrTTl1cVVu?=
 =?utf-8?B?WkxlWDd0bG52dTlxYUFmQmZaaldZOFVlYjJHQksrSUhtTFc2SFIzRGk1U016?=
 =?utf-8?B?RHZiN1B6ckJaVkh5SCtHZ3FCYVVLYmdHYUh0WlhjOUVLMmY4dkxOUUprRnhu?=
 =?utf-8?B?amcvQnBndlRES0M2dDNXMzI0clVBSXZUblBmVllRSFh2RzRQOGpjNjF4MExl?=
 =?utf-8?B?ZUsxU0xZMGR5eE9RaWVSU2tUODlKNjhHa0dLaGE5cWxYY2xSNXQrLzQxV3Nm?=
 =?utf-8?B?R1VHZU5xUGNNL3BoZEZLek9qUVVnMXp1NjVaS3YxUU9VQjQ5UmtCVmRvSEVE?=
 =?utf-8?B?eUsyUHlMamIxT2dIVDc2Vm1zeDBXenV4TzJiVnlyWktDN21yMEllK05pb2do?=
 =?utf-8?B?MmtUS0tCN0Q5YTlMcFNiQmNxakpUa2k0VVF0NUorZXBiN2V1cG9sdjBLOG5F?=
 =?utf-8?B?azVrSjZZaW9XYldlc0dMdHRmSkVCSTdjc2lQMWN5U1BaK1A2ak9mUHVtaXlI?=
 =?utf-8?B?eVozQ2NDQk1XOVc3UXkxeXUwUWVqaXpWeTBpNjFGU1BlSC9CcVk1VC9KdExu?=
 =?utf-8?B?T2ZYcFVwQ2hTQVkwb1BZNExNZ3R4eDRSTStBOTFFdGp2Yno2S1FTb05tbzNq?=
 =?utf-8?B?RDhqc1FTN1pKNzEvRUIzd0liU1ZzR2pLMG5hY0d1cjRvMHlubVB2TFB1SFd0?=
 =?utf-8?B?Q29peTJLcCs3cVQyZXpuQWRYRHp3TlgvaUZkRHBHMDVuUTlLNXlEckFmWm1k?=
 =?utf-8?B?QlQyU3NsUDloVXNYT3RLc3BjUVdYZ2VGVjIyaFZvUnYrNnFtYmpPVjhUV1Ax?=
 =?utf-8?B?RG9zK0RjQjlOTmtHeCtaY01wTGNJZWQyTlVxZXdJNEJZMnR5aG1kNW5sWXg2?=
 =?utf-8?B?ZVhmNXpESW15dC9GZW83c0pnY3poYnpzcmZCUGl3NHl4cmZTRml2aDVFUVZs?=
 =?utf-8?B?UUg5VFAxT3NpcWtjdWVaSm9waWs1OEUxTjg3TUVZK1R4NmRSRWZ5VS8wT0VK?=
 =?utf-8?B?YUcxZDZqYm5CWEF4OWhhTFgyaVJRRjRaYUJmQlJ4dlRua3RXN0tON2orZzNy?=
 =?utf-8?B?ckkvVTRTMzV2M1dQeExLV1ZjZUxoZXV0bVlOQ21iR3FpT0J3T2d2TktBRnNy?=
 =?utf-8?B?a3VwOUc0eVlsME51NlhwdGZSWWh1cWxWaVMzT1RWbmlVWTJiVmtWZ2NQL2Ra?=
 =?utf-8?B?M0x2b20vR0dNYVAxd05ZNUtEY0ozV1FZeTZTVTN2Qjh6N0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzJoMUdHTnp6S3ZVbEE1OWFCcDUxMGJIT21ZZ21qWWN0dDdhWm1VZGF4RUJr?=
 =?utf-8?B?UkNMcmw0NzdyNHN2VjBubXhBWEdDTUVhZWtKUUMwdzJWVkFOQzdNOUl1ODhW?=
 =?utf-8?B?LzZ3c015WXJqNzVzU2g1b0VZcWJwaFVQN24yY1pKNEF2QWR5eGU0NFNkR0xv?=
 =?utf-8?B?d3RMMzFaRlJZS1RiSTRBYUpJUjlST3VzRVJuTk9uckRmTWZEUEg0dVA0RlNC?=
 =?utf-8?B?ZnBUZ1R3ZzB2VXFwMG5NV1gzL1ZBa3VDVURkUHJvR2U4Z2YvZzFiN2pZZUZm?=
 =?utf-8?B?Ny8xN3FMRzlpc3cydndnRXpwb2pPMk9vbGJXUkpRTm91STlZRWE4SG9zb2RW?=
 =?utf-8?B?elYvUTJZUHJQL1Bpb0lDOTVxekhvVVBScVpsMkxtc3QrUXpJdEgxUmNaSVFa?=
 =?utf-8?B?Sk1vVVVJeVc5SEdCVXZpMVYxaGR2YTA5dUJmYTBKQmZRMDQ3eS9EeWR2SUxB?=
 =?utf-8?B?NzQ5bjFMOWNZTW5tU3BkdGJWbmoyQWpyZ3Y5ZXRTWFJwVzdMSWJQMUxaMHpp?=
 =?utf-8?B?QjB4cmRiYytXRERJaEVmL0MzVzdaS0I4T0lPVVZkRkxFdVFSZVZDbVdjTHNU?=
 =?utf-8?B?VHUxajRrUU5XaEExeitYSUQvdk5kUSs2SmdrYnhVVDJ1K3A1RXVCN3ZzUmVv?=
 =?utf-8?B?cnZWNUZWRGVpUVdxelRPR1NKTzNNd1grVjZWN2gwanY3enloWEVNdVFNVnN3?=
 =?utf-8?B?RTJEUkVNQmtaenoyKzdKQTJ0Z3I5bWcxWjZobVJEWUZZR3hHd2NaZlpLSFJp?=
 =?utf-8?B?OFU4U2JrMTBzdkM3THMyc1lNejRSbmRDTjE3ell5aDBlUzlyajBoS1RDanBE?=
 =?utf-8?B?WlBEUWs4b2k5Q280WkdCWkR2dHVLMmxHWEVNaEFGTEtaNUVCTGVYb2Nsbysr?=
 =?utf-8?B?UWpFclZWVXcrUjlrdzZiR2ZwZVp6U0VERXhnc1dCVGVXR0JEM2dRalRYbVgz?=
 =?utf-8?B?Y0lOcmw5RXRvdWlhVDdxajBNalFhWm9TUGt4SWhLYjlQSW9HcEJyMFExbEN0?=
 =?utf-8?B?MURrNnFnRkNaOGNjTXI3elB3VEJMbzRYWGVVZG5jQzkxb2Zxdmc2TlYyR2Na?=
 =?utf-8?B?cEVQbmd3MFpUbC9uQ2ZvUWNzbnh0Ry9FNzluTzNka092Rml5T1l0dXZFd0Ri?=
 =?utf-8?B?aGx4c0lWWitxMWwxZ3Fqc0lXVkVxYjVmRXU1c3BBNEpHZVR1L25rME1mdklH?=
 =?utf-8?B?YkFoWGowODhvYmpKY3lNRmc3blJrWmhvcTgwVDk0RUpxdmNvaXEvSjJQdXVF?=
 =?utf-8?B?OHRtakNRTmNseGdpUDFmVVVOMFZwOFo5UjJoNzNPcXh6bkxJeEJDZ0hyOFRK?=
 =?utf-8?B?S255cXQrQVJnRGFUK05lL1hiK0RlU212bmtuTjJobkNIdFN4V01aenB5d3Vk?=
 =?utf-8?B?TWs5U3drTHR3QlZwNThPNXc4WEh2cVo4UFhjcXB6NExVR0dLMTNlMUplMjhk?=
 =?utf-8?B?b0hCR3k5ZDc1L1ZmdEQyUmVaQjVpZEJhN2NpVWd1WmNya3NpREt4UkxTSzgr?=
 =?utf-8?B?TFlHQ3U0NkpyYTNMOGxza1B6VTZuZWRTUVJaTEk5a0V5anhvR1ZtZ0MzZFZh?=
 =?utf-8?B?dVlOTFdtZEo2VmcwMnBQSE93bWNaeVNIcUMreTdJV0NBZkY2U2UrQm8vV21p?=
 =?utf-8?B?UGxmaTJSaElDQWdlRkU1bHVEYWlCMzN2bnVURHA0ekZqQ1ZkYkcxM3M4UC9s?=
 =?utf-8?B?WmpUaWh3T3pWMlk4RGdDa1VIOXhxWWRLM2JSL3k4cVl5elpTeDJ5MzFzejJz?=
 =?utf-8?B?eDZCSFpiL1RXVklwSjRrSUNuMUFvMVB1V1Q2TXF0OE9ubC81VS9UL0dxRzhT?=
 =?utf-8?B?dlp4MlNPUG9URjdScmFTeU83dkl1YkplbVRIK0JZVTRIRjEvaUMxWENqTElq?=
 =?utf-8?B?UXFVY1NwVy9yZ3hJRE1TVXYwQnphb1RjY2dOcXpDc0xPZkYxbDRibzBjOG5J?=
 =?utf-8?B?WHVWMm1zY2U2L0FvSlRueDBsMmViOVZYTHRGVVhqSE1SSXpmZ0JZa3JVTnpr?=
 =?utf-8?B?Z1FlMis4RGVtU0NuZUh2V0xiVkphbHZtdXZBSlFiSmNZRG1hUUpXK1liKzZz?=
 =?utf-8?B?MlA2VkJURm1BZnNZamRHUFJlTm9RV0FKSHRxQnRhY2FYMWNOQVUrZEZJamcw?=
 =?utf-8?Q?AHD6QX/niWSxx713Npv3E3Wis?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 657452b0-4c4f-4b55-26d1-08ddb7cfebf7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 12:16:20.4005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYXbw7GUepZgDEw67W8CZjkSa7Giln7IeRjC4oGDZQjpLB9VLsRJN2Adjd6r05D6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6527
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

On 27.06.25 11:49, Sunil Khatri wrote:
> add support to add a directory for each client-id
> with root at the dri level. Since the clients are
> unique and not just related to one single drm device,
> so it makes more sense to add all the client based
> nodes with root as dri.
> 
> Also create a debugfs file which show the process
> information for the client and create a symlink back
> to the parent drm device from each client.
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/drm_debugfs.c | 80 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_file.c    |  9 ++++
>  include/drm/drm_debugfs.h     | 11 +++++
>  include/drm/drm_file.h        |  7 +++
>  4 files changed, 107 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 5807dd64d28a..ee79b694a750 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -305,6 +305,86 @@ void drm_debugfs_remove_accel_root(void)
>  	debugfs_remove(accel_debugfs_root);
>  }
>  
> +static int drm_debugfs_proc_info_show(struct seq_file *m, void *unused)
> +{
> +	struct pid *pid;
> +	struct task_struct *task;
> +	struct drm_file *file = m->private;
> +
> +	if (!file)
> +		return -EINVAL;
> +
> +	rcu_read_lock();
> +	pid = rcu_dereference(file->pid);
> +	task = pid_task(pid, PIDTYPE_TGID);
> +
> +	seq_printf(m, "pid: %d\n", task ? task->pid : 0);
> +	seq_printf(m, "comm: %s\n", task ? task->comm : "Unset");
> +	rcu_read_unlock();
> +	return 0;
> +}
> +
> +static int drm_debufs_proc_info_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, drm_debugfs_proc_info_show, inode->i_private);
> +}
> +
> +static const struct file_operations drm_debugfs_proc_info_fops = {
> +	.owner = THIS_MODULE,
> +	.open = drm_debufs_proc_info_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
> +
> +/**
> + * drm_debugfs_clients_add - Add a per client debugfs directory
> + * @file: drm_file for a client
> + *
> + * Create the debugfs directory for each client. This will be used to populate
> + * driver specific data for each client.
> + *
> + * Also add the process information debugfs file for each client to tag
> + * which client belongs to which process.
> + */
> +void drm_debugfs_clients_add(struct drm_file *file)
> +{
> +	char *client;
> +
> +	client = kasprintf(GFP_KERNEL, "client-%llu", file->client_id);
> +	if (!client)
> +		return;
> +
> +	/* Create a debugfs directory for the client in root on drm debugfs */
> +	file->debugfs_client = debugfs_create_dir(client, drm_debugfs_root);
> +	kfree(client);
> +
> +	debugfs_create_file("proc_info", 0444, file->debugfs_client, file,
> +			    &drm_debugfs_proc_info_fops);
> +
> +	client = kasprintf(GFP_KERNEL, "../%s", file->minor->dev->unique);
> +	if (!client)
> +		return;
> +
> +	/* Create a link from client_id to the drm device this client id belongs to */
> +	debugfs_create_symlink("device", file->debugfs_client, client);
> +	kfree(client);
> +}
> +
> +/**
> + * drm_debugfs_clients_remove - removes all debugfs directories and files
> + * @file: drm_file for a client
> + *
> + * Removes the debugfs directories recursively from the client directory.
> + *
> + * There is also a possibility that debugfs files are open while the drm_file
> + * is released.
> + */
> +void drm_debugfs_clients_remove(struct drm_file *file)
> +{
> +	debugfs_remove_recursive(file->debugfs_client);
> +	file->debugfs_client = NULL;
> +}
>  
>  /**
>   * drm_debugfs_dev_init - create debugfs directory for the device
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 06ba6dcbf5ae..3f4c52d00540 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -45,6 +45,7 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_print.h>
> +#include <drm/drm_debugfs.h>
>  
>  #include "drm_crtc_internal.h"
>  #include "drm_internal.h"
> @@ -167,6 +168,9 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>  
>  	drm_prime_init_file_private(&file->prime);
>  
> +	if (!drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
> +		drm_debugfs_clients_add(file);
> +
>  	if (dev->driver->open) {
>  		ret = dev->driver->open(dev, file);
>  		if (ret < 0)
> @@ -181,6 +185,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>  		drm_syncobj_release(file);
>  	if (drm_core_check_feature(dev, DRIVER_GEM))
>  		drm_gem_release(dev, file);
> +
> +	drm_debugfs_clients_remove(file);
>  	put_pid(rcu_access_pointer(file->pid));
>  	kfree(file);
>  
> @@ -235,6 +241,9 @@ void drm_file_free(struct drm_file *file)
>  		     (long)old_encode_dev(file->minor->kdev->devt),
>  		     atomic_read(&dev->open_count));
>  
> +	if (!drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
> +		drm_debugfs_clients_remove(file);
> +
>  	drm_events_release(file);
>  
>  	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> index cf06cee4343f..ea8cba94208a 100644
> --- a/include/drm/drm_debugfs.h
> +++ b/include/drm/drm_debugfs.h
> @@ -153,6 +153,9 @@ void drm_debugfs_add_files(struct drm_device *dev,
>  
>  int drm_debugfs_gpuva_info(struct seq_file *m,
>  			   struct drm_gpuvm *gpuvm);
> +
> +void drm_debugfs_clients_add(struct drm_file *file);
> +void drm_debugfs_clients_remove(struct drm_file *file);
>  #else
>  static inline void drm_debugfs_create_files(const struct drm_info_list *files,
>  					    int count, struct dentry *root,
> @@ -181,6 +184,14 @@ static inline int drm_debugfs_gpuva_info(struct seq_file *m,
>  {
>  	return 0;
>  }
> +
> +static inline void drm_debugfs_clients_add(struct drm_file *file)
> +{
> +}
> +
> +static inline void drm_debugfs_clients_remove(struct drm_file *file)
> +{
> +}
>  #endif
>  
>  #endif /* _DRM_DEBUGFS_H_ */
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 5c3b2aa3e69d..eab7546aad79 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -400,6 +400,13 @@ struct drm_file {
>  	 * @client_name_lock: Protects @client_name.
>  	 */
>  	struct mutex client_name_lock;
> +
> +	/**
> +	 * @debugfs_client:
> +	 *
> +	 * debugfs directory for each client under a drm node.
> +	 */
> +	struct dentry *debugfs_client;
>  };
>  
>  /**

