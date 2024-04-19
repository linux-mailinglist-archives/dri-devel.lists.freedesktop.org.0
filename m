Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E268B8AB09F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 16:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB9E10F5F8;
	Fri, 19 Apr 2024 14:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RobKPGPP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0479E10F5F8;
 Fri, 19 Apr 2024 14:22:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgGEOIjRqM8CLd8AaxZkA+fatV+avFnqznAuK3FylwrRjAXX3Tr786bDtWEJ44OA7rh/+5I+zuwMejk31gDtUDfZtI1bFZy0ah/vHKmNIV0SoxNHQByq7hiIUt72t+RlbMkgEHz78r1LamMoFj9mJwvB3T5J+uxugqHDXAptl6BvinDKKCc759XajkB87SPWpimh1sDKBcCoUhk0T6487RzvoEM8P/qADOHVESicfNg/GgZMH93FRBRMn62hAyi8RC+w9Zei3n5LB2igRCGP8qs4FAoj5ooQHdkGuU+5Zxlce0j0XKfRhHXrb54fNQxBl3/bmMwDYKsyYVGQELrv5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrQnSgbXlJQVQpeeVSrGr6JJLsN2VbOCmKsQwrlk7WA=;
 b=P73vsweokobZ7STtB+cYzUr4EIMPT7d733/ydqVzCFijnqjf5ecjGaxLtczdTiImVPs+d9ShaqrD0ihNE5ZQC4tu1OyafOa6d6rCI/sVo3iLM4OOVkZdy4TNH1NtOiMzHEL+hIE4W2z+YQj6RosoWhY6ibZ5YTc8aR1kXV9iO+3QHJPjB5nkgFpBI38gfjZD/xqRngm8UHZf7Q4MQ67V/q2quH/CChTQE64vNoFRBJvTmwsmRcQTRM/qcYvzZuT1AItJ+JEJ7M7N2NZNAXyHHFq0sdg2vIDljvCz3Qp82q5N4Mor3p1ql1Qh6HyU2N51bazgFUHq2jBjllaSquoIhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrQnSgbXlJQVQpeeVSrGr6JJLsN2VbOCmKsQwrlk7WA=;
 b=RobKPGPPvU7J+4oZ6Mx9b0v0gXBhsW+a0g9bHSAVhswIT3ZURpdah+rivl3ki2pGwNKEBvWKGSJG7Zzfjy5nU3eN+0+fNOZQWz17W1bhEswgKJXs2S6PHRSY1/MpOPPfShUm/s5jLOJjf7TJ+7zA76jDepRy/KnZK2xPwHKXMjKjgPrCA2VMtMcqM9S/4tRfLjJsHBCeaUJ18Fb5wnkEoL0jntbY3+FDyq0Tvhc+Oxhp0IWJlxW3uRlbNoGCuLnahYQ9cc1PnNuFULmnbf7GdZzlCkFvi4r2QHTfr5Tb8ImN/r5g4uKoH0PZMxZb99LB1uvo5igAWUerS3dcs4YZCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MW3PR12MB4412.namprd12.prod.outlook.com (2603:10b6:303:58::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.42; Fri, 19 Apr 2024 14:22:09 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%5]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 14:22:08 +0000
Message-ID: <81c72b06-d3db-49d5-b1a7-9d16cd9ea0a4@nvidia.com>
Date: Fri, 19 Apr 2024 15:22:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix gen_header.py for older python3 versions
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240412165407.42163-1-jonathanh@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20240412165407.42163-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0159.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::27) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MW3PR12MB4412:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fab84e3-187d-40b6-f64e-08dc607c189b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUt3SUFrdnlXZjJ3UHdXaHlyam5BKzZhVE1IS0VJUHp0VVRvUFFpYUgraU1D?=
 =?utf-8?B?SFYzWUVkR0pDc1NqaGFCUWpEQk5Uc3dLa1h3a2dYUGoyMWJOMnQ1RWZQcmo2?=
 =?utf-8?B?dVNjRWNReEpxZm5ZbVdPK1EzcEpCR3BRc25SQlhJczlNNjE0YWlVdWdvM2tC?=
 =?utf-8?B?c1VnMnRTSHU2VDlvdWdRNjR1K01mdkcySDFQMTdKSlFGa2EzRHRTVWNXb1ZP?=
 =?utf-8?B?dGlwU0NtWmhjemlCQ2FyMGEwVHRDMGtFUC82OVZlWk0rKzNycjBwdi9qeExH?=
 =?utf-8?B?ekgwYkZpdy90UXkyZmRpcFBUYUpJVk1Td2NkdWRiaE92MDN5dXJpSWJMM2Mw?=
 =?utf-8?B?RjlBYTlqcWdPZVhidEo0Q21JK3lpTWVjaHVUZjBmWG9GOElvZHMzQ2RpTUps?=
 =?utf-8?B?YkdFR3dON0hXUnA5M0ZEY2R6ZG5RellwdVl5YldSU1JYQ3FVL1BqU2tESXVC?=
 =?utf-8?B?Vkw1NjRidlRDdXQrVTQ4V0xIRzFzaS92cDVIT1drYTRLaHpqMDV5WVVtTHlO?=
 =?utf-8?B?UFc5Y3lwc1N3bTJyek5nY25BZEhCRTdxbi9rcEpWMHBQNDRIejRUL2NJWWdk?=
 =?utf-8?B?Q2dIVDJaZE9yL0JZTThZd1BIN3hhYk9ZVlJBc3Uva1pnQXpXU292c0U5NElh?=
 =?utf-8?B?STJZSFQ0R2JpbjhBWWhNWmlnUHRTclRzTkF6eDBVbjZ5VXhaalgrOGdLb0pp?=
 =?utf-8?B?eWpJRHU1Z1p0RjFJb0cwNVFKMVVPbktrR1VYZ1ZEZ3hQNmVNcGJZSHViT01y?=
 =?utf-8?B?cXRSY1l1ZnlTS3lsM1Rtd21pMmdEazhRQUZxMGhDdkl5V3lEdElndjBrVVJO?=
 =?utf-8?B?cHhYVTltQXMxVCtGT090ZVVKMFJGZlBpM3ZOYlVBVEo0Q0YwNW1DWEtUUGRN?=
 =?utf-8?B?a3lRMUZKWEtaZ2w5T01LTFBWa1ZOM3N0ODg2S1YzSUxvaVU3NkllcnZzMlZs?=
 =?utf-8?B?am91NjRsZmNrK212UE4rN3ZZVWRYMlhnN0NwVFdnalhOZFdsRVBoOEtPUFFo?=
 =?utf-8?B?cllKMkxoeGdSRWlvdHFsQ3kyZlpNeHFMQ1JxU2QyQTVRb0QxUkE4c2JhZkRR?=
 =?utf-8?B?bmwwcHAxL090R0JJamNJZHpYanFBMUFHRkpuMk1OQ0Q0NDZjTitLbWVEeG5n?=
 =?utf-8?B?MEpnUWhxRTVwSXRwTDJFR3JCcWlUQmRrTGdQVWxBdFdWNVdjSmVTK2dBeHg2?=
 =?utf-8?B?MmxhMWg5ZFVETkNVZ3EreGtncDlxQng0aDdCMHp4ZXd4NUtBcVFHdEljTFhy?=
 =?utf-8?B?aXdmWFdpVWUrcGVZTlRhTkxEY0hZZmZZRVdOcWQ3TVF4anVSbFJIRzI2bVBY?=
 =?utf-8?B?Zm9IUE1iZGd4SlFYanRMNGExTW5QOGxETm1rdnBlV01nZFFYeGlvZFgxVmxz?=
 =?utf-8?B?amE3cG1tak54ekswSVpBSjI3a3BaQzJJYlo4RldIbElKejArRnhFNE5pd0lY?=
 =?utf-8?B?cVpJTWVac1NTRlBlalhNVE1SbGh0Rk5sZUlaL1RPOFZDci9vTkovWm9kYnpo?=
 =?utf-8?B?OFZNZ1c2RCtyRWM0aVU3OGRELzJzTm5XVmxRdXN2OFhzVnJKc1ROWlp1VUNJ?=
 =?utf-8?B?K0g3aUZuRVR3UlBCaDAzdkR3SzdsVFBCcXg2bHhxKzU2cTk4VjBLakp2QzFj?=
 =?utf-8?B?MGtIS0FmemFYelJZL2FrWVAwVWNGWS9CZ0xIaTc1R0lTU0RLYUlXR3pzWWRX?=
 =?utf-8?B?eVBISkwrUUxhanlwQ3J0bnZqWC9ja0xVcmQrR0ZmVy81RmhPSlArSDBBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2NFRmVLSlo2RVJOQWwwZFh6Yzh0RFhnL01uOTA3bExPbzF2a29IaVBTNnNu?=
 =?utf-8?B?MUZUSWFHV2E1VndST0k3eHptRzZMQmk0SzRYT3dybU5WYnNHOHNBSU5qS2FK?=
 =?utf-8?B?VDJDNUExNmdEdHdFS1pncGZhL2ovbXZjNStRZHE4THczRW16bXNDcmNoQjFj?=
 =?utf-8?B?Ym1GUktJMzJFWS9rUVIvU2duVmNNZFBUbDBBYWxqVkJ2Y25yN01kL09UZmJh?=
 =?utf-8?B?L3p1WWhzSHdXdmFQZkJlOENsUHFUL3h4V2pteXNacmVHV245U3FZU0VrRjFE?=
 =?utf-8?B?cG5UWUt5OWpsTFZTdVhBZElIL2hKb3pqbTNYUFJWdTNTODRFcXZJd0F6b3pk?=
 =?utf-8?B?Y2ltcmI2NG9sYkxWTlBvSHVpOTlIb3E2ekNMKzR2Z0hZZHNKZm1CTCs2QTJn?=
 =?utf-8?B?Zks1dnJjUXNtNkJlaXl2aHM4Z0tIUmh2YkpZY1RMaFFEUnp5QnNkUDd0S3g5?=
 =?utf-8?B?anIxblpRUjVEMGU4eHVhVWcyYXJZV0dZb1MwWEdXdllKSW5jelZqTy9kTWdv?=
 =?utf-8?B?ODVsRlFoRUV4ODZrOXRPdEJ4ZmwyaGlVRTcrNXJhZXZwdGlucVBNR3NHcE93?=
 =?utf-8?B?dGtKdVNCNWlBb0wwNVlUazROVXpGTXlCM1NzTDBrZ01vVEVqR1BuU1lFSTJG?=
 =?utf-8?B?dDQ5SHlvSmlESDJTYzVXT0FYMjJFWEpGNzZZWGtyWXJrKzM4NUFNWjNVL210?=
 =?utf-8?B?cUVHdXp2Z1BmZEtWNXUwQldWUHREU1BwMDloNUk2WW9udkZoc3E3RkRGd05l?=
 =?utf-8?B?WHhVRVFqRFowcFc0Y041eUV1VlBaMXo0UlVEMTY1UnRqbU05QTcxczdKU2NP?=
 =?utf-8?B?c295ZnhuNlRmOXRwWWt5S3dOWjN3dk9JRXBnYnVzVElZRjg3MGQyWHZ6d3Vi?=
 =?utf-8?B?M21ENVphUnBuYXRKRVBCdWl6UEl4YTVQbkxvdlk3M2ljWm1ESnJsWlBNY3NP?=
 =?utf-8?B?OFRaSTJPdFV2eWFkQVNYRCt6djJ2eWtMTkJUNUhudDRYaG9RVFJaNno2Tkdv?=
 =?utf-8?B?NEJkaXFXbGdFV0NyREtIZlhuM3V1OHQ0bUZ5OThlTUhidVMvdFFVSWxLa2hO?=
 =?utf-8?B?cksvRkgrbGlzdmQ2dTVBUGkvYjkxajRTR0ZUdi9mbWJ4TklBNlEvZFU1T3RP?=
 =?utf-8?B?Mm5LY01DWWk2anlCVFhMUEkzeGpRUHR0QklDcG1mRjR1aG5mKzBQdXpudktt?=
 =?utf-8?B?UUhWNzArbDRUQkY0Ym1YM09Ca3lSRFE1Q01VRDdBQWxwZkVndXBqT05Zck5V?=
 =?utf-8?B?MVIvZHl4YmNhYzVyZ1AyQW0wSDREaytXZ1hiVVZmdGZabGhvMnpvNFlPQTMr?=
 =?utf-8?B?M3hNeHlIWUw1cFNhbGhZdnZKOEJyejA2cUQyVnZBQXp3YUVaTHJ5R2N4V2RS?=
 =?utf-8?B?QW9TellJem1TQjlpOUxUSEZrNmZCdGpzeUFZTjNCL25ZeE9CSnNQc0twZ1BP?=
 =?utf-8?B?bmZjQ2FOcm9MV0hLSjdHREFhaEZBSklDUVpYaFFlbVhFTlk2RDNyMW9PMUd6?=
 =?utf-8?B?M3krMURPc3grZlIxc0tNdWlWaVFrb3FPTHRHNjMybHV2VzBBNUtXbUtDc3Ba?=
 =?utf-8?B?cjRuSjlQcmo2QVh2U25uekNFNEswMUcwc0hNVEpDelp1c1JZYkhiM2krTGhO?=
 =?utf-8?B?Qk43OTFPQjVSUzlpODNFQ0VvcGIyTDVLNHBWTjVRWXBuWjlWamtXbXJFallU?=
 =?utf-8?B?VHJiVEROak5BRnNDY0hkek5FNktJbnV5eWhWNnk5azFUalVOaVNGWHloWG1s?=
 =?utf-8?B?c3I4cXRWUHNrd1RDUHNOVXRTc2pQaGRiVDkrdmI2TndwR0JVZ2s0ck51UjdZ?=
 =?utf-8?B?S2tQYXUvSEdPWkNiT2VoYTRCbm9iT0VqV01tSmI1b01BU3ZlcnJTN0tCcHF1?=
 =?utf-8?B?QnBobjdkT09uS0RsWXlZSStkVWlVdnJuTjJQSE5keTB3QlBEUHVBVSt6MHBr?=
 =?utf-8?B?TTJwamFlNkJzcFE4UCtPR2lEKytyUVZSdkY2UUs3RGJMbTIwbUg2TEVKYmhV?=
 =?utf-8?B?bGdRWHBjak5MVk0xWHQwbGgyenFDMEc3MG5Jc2Y2SjJUR3VUSjdjZWlISUFK?=
 =?utf-8?B?VGhWdDNtckJSS2dYUFVpclY2b3hqTlBuWWNjRVdOaENxZzBRaUptd2Nkb2RU?=
 =?utf-8?B?OE9pcFllMHFzc2pReXcrQXUwSU55MGE4OG9JVHZ1V3FNa1ZpRkVCdHNPbFQy?=
 =?utf-8?B?bmYxY2YraFNYaXpzN08ya3Q4WmdBSUZNRFhBSEhkTWNaRFFLWWdkbXRvbCtN?=
 =?utf-8?B?N2hjcW1hY2kzb0xoY0ZqL093R0xRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fab84e3-187d-40b6-f64e-08dc607c189b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 14:22:08.7660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFkDrh0ki7eZ9CiEus54SwnKiXr6lvA5a9j0WoOgz2CpLsJOsVoqaTsMdDN97USJSphuUWQlVtBqmhws92cPRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4412
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

Hi all,

On 12/04/2024 17:54, Jon Hunter wrote:
> The gen_header.py script is failing for older versions of python3 such
> as python 3.5. Two issues observed with python 3.5 are ...
> 
>   1. Python 3 versions prior to 3.6 do not support the f-string format.
>   2. Early python 3 versions do not support the 'required' argument for
>      the argparse add_subparsers().
> 
> Fix both of the above so that older versions of python 3 still work.
> 
> Fixes: 8f7abf0b86fe ("drm/msm: generate headers on the fly")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>   drivers/gpu/drm/msm/registers/gen_header.py | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
> index 9b2842d4a354..90d5c2991d05 100644
> --- a/drivers/gpu/drm/msm/registers/gen_header.py
> +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> @@ -323,7 +323,7 @@ class Array(object):
>   			indices = []
>   		if self.length != 1:
>   			if self.fixed_offsets:
> -				indices.append((self.index_ctype(), None, f"__offset_{self.local_name}"))
> +				indices.append((self.index_ctype(), None, "__offset_%s" % self.local_name))
>   			else:
>   				indices.append((self.index_ctype(), self.stride, None))
>   		return indices
> @@ -942,7 +942,8 @@ def main():
>   	parser.add_argument('--rnn', type=str, required=True)
>   	parser.add_argument('--xml', type=str, required=True)
>   
> -	subparsers = parser.add_subparsers(required=True)
> +	subparsers = parser.add_subparsers()
> +	subparsers.required = True
>   
>   	parser_c_defines = subparsers.add_parser('c-defines')
>   	parser_c_defines.set_defaults(func=dump_c_defines)


Any feedback on this? All our farm builders are still broken :-(

Thanks
Jon

-- 
nvpublic
