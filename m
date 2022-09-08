Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C5F5B2026
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 16:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC4610EB13;
	Thu,  8 Sep 2022 14:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2066.outbound.protection.outlook.com [40.107.212.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846FC10EB15;
 Thu,  8 Sep 2022 14:09:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgkyp3LDZ2dVL1+p+D+aX2yxx276oQaCgwdPClGRBBHBzKiTnp/R9EoTb6r0Ef3IpElzCilJVZ4eD5bb100jaeM2F9Cat1RnATVj6yO7PnJ73CIlcqFq2tHcdh/UEIwBp74jtjdu5Yero7Wo102JuEv4Pf6XMXTuwF7U19FVfAk5AV7Vrp5kG0fH5fyEsJT8shqoSy/zvpFzRN5/Y+cW65kd2MmzJS+XdDeeIMKsuLXh3IrIktyyIvUtstUWJcUQpuPq70HD42lnM+nbkucCANO7XrPvmvIHG+uR+RgD5Jwo/42ZS7uRZHdvwJqwwfWm0LL9OWiezUM8cpMX8yFLeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7R+Suu2VvGBbQbovXPH9HTcWCYKZOSut0orz+mY9FQ=;
 b=lLF4euMT5FD+D6P9bOwjATiZOjCuWNw1Wji2QONofMjkb/ZU2OCoqKiaivXGlDmnF0daWVyW6RaMz1i3eMcsNNwcqK1cE3Az0RUGsNRvvo79K+CfUw3ISjSmKqwgiI/9y8r4y323rhKtMOK+qvEIjJ2CsDi53PBsVOIXS9LZQXH3/MrFELj8WzU6Sm/iuPpv2DaUGPrqGJL9efrqNV4gO4dir0pb1zglegxeNSjYYloUmVkhJNxe7WXlzitLtV1Jrj9bBmTI4fSacpQTXraogcEAbhfqDRUryv11YHzAZVYHu+1Pywv/g/xOicGrtmreFk3CaECQKHDK/3ZGRSSmLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7R+Suu2VvGBbQbovXPH9HTcWCYKZOSut0orz+mY9FQ=;
 b=2ZfmAQZUw5qnZBGOw8Nv47ZVT1P18rIgC3MteCQcdnlApulAaXWws1jA125SBZztGk1tCgqt4bPfQUcGYmX9lxtlicTO5YudcvaIICXj0oFzcseHallCEUMVofjRNY5+k/AmqtEfG07Lstit1qN+Cw1d+Fia6BTp4Ys6g39xNy8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by PH7PR12MB6539.namprd12.prod.outlook.com (2603:10b6:510:1f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.16; Thu, 8 Sep
 2022 14:09:21 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5612.016; Thu, 8 Sep 2022
 14:09:20 +0000
Message-ID: <79af80cb-7438-1105-c24e-d3a874a0b4ca@amd.com>
Date: Thu, 8 Sep 2022 10:08:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] drm/sched: returns struct drm_gpu_scheduler ** for
 drm_sched_pick_best
Content-Language: en-US
To: James Zhu <James.Zhu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220907205705.934688-1-James.Zhu@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <20220907205705.934688-1-James.Zhu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR01CA0022.prod.exchangelabs.com (2603:10b6:208:10c::35)
 To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1947:EE_|PH7PR12MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e53f231-6d92-4c2b-21c7-08da91a3b973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yp4Wv01C080SLHSQ5/4l6nqM10lHt88Eu4rfQO2PDTOnt8HI2465AC8J2GpFW+XG0hYTDMPCdGwN6rndhvUL7Gu/iKB95wa9SLcKdNQM5NVJWeBCXDtFuCL/15aa2bnnWSn918W0yrVmnRMl8AEdatLcnPQf5QScW5BATcOGL5w3KiqMJTSUAXF0g0ur3/z5+o9+ADE3pEEAKgvzoGj00LyJc0O1EPGBefoJW1eqVRk0IPn8uE5a21MNvFwk8eNROzvf6Yj6L+qMYFeNh/uPvoRSB1iPLmYaQbhKFFd3+86iqbZ3APwdgZpvTEPKOZMvjuwRC7Ij/JiwlKKsVwUajpucwhd4nkrJxPcAmkh/ngjsmY45NrUCqvhd9TpP2hMdSuMkc2Lwhc2b3CZIESo4tiao1FkYN/z/nR5dFWYfsOyH/pePguhfouOqX8DFgIGkObulsfBvWshOtMQbiPGyiDQA+3JFv3qNrYpHg0MHrWtWwC9pCgpAMDy20pJ1kj1Xwh3xGl+nyJFIsDqoSYqyqpsz+wV3r0DK696zjqzqPTwKvoTQ0Y9WeyceUYWrDI6PQ17fSNyTDPNwXb/IMdKYe6jo+mMMmI6+lE4EvzVa9QzkJN3s2ZAEkSmMlRKHC38YnM9tMDIhOxxBNdvCESL/RmMKCvUAL+yZfEeF4ko3QwOPp+MAryb+mS+XVzqr0xgyBSxAR9hSD8anTs/kx6LdPnH9jGkQ/8ekCLtZcxKGBoetLa3f7Kb7cx1IXM3P+275aUC65FMgEDzkUZOWh4pF1E2Mkpwwb85LQFdnBalFdJw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(31686004)(53546011)(26005)(6506007)(6666004)(6512007)(2906002)(41300700001)(83380400001)(6486002)(478600001)(38100700002)(36756003)(450100002)(66946007)(66476007)(316002)(66556008)(86362001)(44832011)(5660300002)(31696002)(8936002)(4744005)(8676002)(2616005)(186003)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVYwaHBPbDJoY28yZDlWOXo5YVpReWNsQWU3b2VNQkt0NkZ2clByTjNUVjZ3?=
 =?utf-8?B?VnZwOUhZVDBTR0d2TnpTei9QUzhsMSs4VEFJa2lQSTFDQlowbVQ1QTVMVm1G?=
 =?utf-8?B?Vm4xRjZ1TWlRVnM1MGRsTmFzVUVqd3M4Z1Q1bWxqVVJsZHMwNTJhaDEybEZC?=
 =?utf-8?B?OUF4M0s5MHUrRmJqWTVjaWVGMDBHWG1ZNVhXSzkrVVpLbzI2Y3YyRVpEUC9O?=
 =?utf-8?B?Y3UxNDFWOE5qeXJ4UWVKaFJkcnk2MTduWUlpcUhRdHN3dnhnYjJHVWtGaElH?=
 =?utf-8?B?TXdLVzR2SVl5bmFqSnlNTW1FaGF5amV0L1phekZrN0R0MVFNNTY3aVRnL1hS?=
 =?utf-8?B?VDlveDBUanNoRS9zc094U3BtTktzMm9sNU1HUHVLZkdidFhOUUw0NXhQWWNJ?=
 =?utf-8?B?c0NYY1JzUjN0cDlYQVZkV3p1VVYza0ZrRVd5eFl1dzNwbFVVRnkrS1JkMjlV?=
 =?utf-8?B?aTlrS3F3blhwVWlsbWc3eUxTNVJEYi9Uemg1ZUl3RFpNdmNMcCtWcnNRcThS?=
 =?utf-8?B?VWczUXdYaEhRNVpxKzhQYWRqditRRXVQb3hqbnA4cXdRbVlCT01ZbWNqZG5z?=
 =?utf-8?B?dFJNaDgvN0VLNkQvZ2V3VXFidUVPbkJCVDU0RXBsUkxQNGFiODhrL1daVVh6?=
 =?utf-8?B?ZUp1QWtCUDNEVGNscVZwVXExc29FeUlNUFlCQTkrVHNiMjN6eUx2VlRsVGtM?=
 =?utf-8?B?aDFiT3lyMFByRGlsQUhCQ2R3ZDJwSTY2Q1VlSTN0d3V4Wm5DZ1JUaUtLSUNV?=
 =?utf-8?B?ZFZMMWd5Nmc1VXdHME8vdy9tRGllRkdZcHVteXl5VTN6NUc1cjFkM0RqVE04?=
 =?utf-8?B?aFVNU2I5WllMWlU5VDRTQzV5Z1dKR1lXN1RJWmdYTmpCSmFwN2UxWGt4Rktn?=
 =?utf-8?B?N2wra3BmVjRFcjFnekNKQjRydXN1dlVqUWFmWm9oNENrN3E3UWdmdU9yQktR?=
 =?utf-8?B?VlUrYnRsMlYzQ2swTVVYTFNwZ3R2ZHBEYVpuUFh2TkJFVm5KWmFjWmkyNkpL?=
 =?utf-8?B?a1BabHNkK2xVdjhZWjBQUytzRXBPRVZIaFVDbFdaNjhUaVZuU29pMXpaTWRm?=
 =?utf-8?B?RHVvQkRuUnpXNUpGVGNPMVpIQXlhWGRJQWhMQ2RBakdnNHp5Zmd6MEUvRE16?=
 =?utf-8?B?MVZhVjF3RTBOUDBid0huMjJrdHBsVXVzdkFGVXNzVGlKMGpzN3N5bHM4N2x4?=
 =?utf-8?B?ZmpKOFFuN09COGRZdDZjMGtWSHFVUlh5WHpjY29IR3F2b3RHUFVMRERnL1or?=
 =?utf-8?B?ajdQTmJzSzFvbTdTOXAzRWlNbStyL09RaGZOYVBHYXcwUFFBSCtLa04rV2JG?=
 =?utf-8?B?Qi85c0R1S2xqWUJIbllRc1ZCWk53bm82TjI2dnE2WS9peUovTTlzNmQrSWNL?=
 =?utf-8?B?K204VFNrK0tVRFI2ZklYMCt1R3BsUHc3ZEUxVW4yay9ZbldTREZ5dFFMZ0o1?=
 =?utf-8?B?TVNYMGoxNStNSmhUUmIrVFZodnZSZVV1QjlEZzdOeUFhZHZlWjd5dnNCcDQy?=
 =?utf-8?B?U2w4MmF5QWJtZ2drYTAzNlhaazY2blZ6SGF5RjBLVUNWTlE4QXFNRjlJU2l5?=
 =?utf-8?B?U09Mb24rVDZZOE03eGJUVThxYksyckFTUHliMDBubjZRaWlLRm9EU2xYWDZW?=
 =?utf-8?B?WDZTZjZuQ0FacXBKd2w3L2tXRkRHc05YelkzOFVyUU9IR2wxUmIzNnluU3ZL?=
 =?utf-8?B?TzFqbGVhMmF1TnoxbnE3TTFiLzB6bTBVS3IyUmo4Q1drR1BmRmtjQXZrTURU?=
 =?utf-8?B?WXJ0Z1BEZHZGRzdPUjJZYytHT3l6eXNqMHlzeDRnb1pseUJlVU5URjhtdHVl?=
 =?utf-8?B?WGpuVU96dW5HSmRLZEQxUzdxWU5zSTUwOERaVmxiQmdDalJYNUtUaVlJTlJU?=
 =?utf-8?B?a0pRWmt0KzZVL0tlOVRXcmhYR0hFVHZpZTRBYXYrd0ZQNHdlRmZpZEllcUIz?=
 =?utf-8?B?NEtjYWJhQlk1RWlKT1ZZODlOeXZtSldIb0xrSWhIZi9zTXozMTNyeWFaNVcr?=
 =?utf-8?B?TlVoUlBva3VNTzY3dHI5QUZjdGVGRDNBamN2N05FVk03TFlqWXBMajBjbjZN?=
 =?utf-8?B?cVl4OEczTVExazcxeU1UUXFmVlF4WkxVOUsyTnp3dDErTDhQbmVIdTNVRlhP?=
 =?utf-8?Q?HeERrYkn9cPf/IX9OLaW/0K42?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e53f231-6d92-4c2b-21c7-08da91a3b973
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 14:09:20.5092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KpKpcgGjXJMIy2EGMfx9QaBF7/joy2wHSHwd3VRQEyDaYWy9xSMTXG6d3JFQzflrCaTiOLCuJwYSYtpnAgRp+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6539
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

What's the reason for this entire patch set ?

Andrey

On 2022-09-07 16:57, James Zhu wrote:
> drm_sched_pick_best returns struct drm_gpu_scheduler ** instead of
> struct drm_gpu_scheduler *
>
> Signed-off-by: James Zhu <James.Zhu@amd.com>
> ---
>   include/drm/gpu_scheduler.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 0fca8f38bee4..011f70a43397 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -529,7 +529,7 @@ void drm_sched_fence_finished(struct drm_sched_fence *fence);
>   unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched);
>   void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
>   		                unsigned long remaining);
> -struct drm_gpu_scheduler *
> +struct drm_gpu_scheduler **
>   drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>   		     unsigned int num_sched_list);
>   
