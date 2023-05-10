Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC946FDFD5
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 16:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9F510E4AA;
	Wed, 10 May 2023 14:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2083.outbound.protection.outlook.com [40.107.101.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5231A10E4A2;
 Wed, 10 May 2023 14:19:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTSrUIDcJyYLq9qKIEeGEgX9IvEybFsfJ+1NFSyn3d2svfNerSTqhjbJQ5SyPnnQU+JGsvMfdSEOgb8+5s+k0qaWIxv1XiERLRsyBzNY2Wpk17Yi1CtkKFBiY3uzl5+2ntg1p0wEUxkXn/baWeRiJHglsd4c0+LgaDOhQVvSuQkVXXrcwBd1oY0ldR2bs9z1ovSuhlsB6tanUcZm9d7AXb/SevqEbUBptHZJptQ1EnjQEWQ8Mm+nC1rFvD0j9BYE1MizknAMK6J6kQlvWvcKpj0hgdCs1wc27801jbzVoS/uzS3g2lOxj6LxH+OT2HkOegBfKCRF51ws8e7DBpEw4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZZ+rXMtO+XHwbmN+tF7rBXtN5QKkoCQM20Djl2XQf4=;
 b=M/M79sFTPOU/CHbv2EGfoZsFJ58LrwWy/45wOKFaG4FJ+Nzd5NqpaC62X0oo023KKLi1nXHuanMjZ1gR1OK0dvZh0jRsgBLPJ9g1gdoeb7QtFgsStoIs+MPaB+GaWTtuybzZWoX6uwmMJgwv9EU2u9gRCKwAPAfDtyqqB2BzlqhHKuhjC1y+JwW6Gm9C9uZi/nlb04gSWunkKbl4bCgIQEne0VzPLjkf+zB4Ay9OlZ8BsxkYMVgWMMtEqkK/oEKz2VWKBL2kbi8k+xa1LsuvTG0gdusZqYJqjE7ADxbm+kxMcRvFo87ATjde5X/07xhVB+1i82bZWQ/LKhf4QqShQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZZ+rXMtO+XHwbmN+tF7rBXtN5QKkoCQM20Djl2XQf4=;
 b=dFyZRrbEv+YNw/7mhS3lDVKvWI5o3OrWTECYMiMmuZRDOlkC4AX7jyNayyzUcMcmWw/iLucvs7L9Hk6JcsOIBgw1bq60hugC64tsco+5wCkye+8eZL6jGhe5rdEEYFDrep47EnhMLXBb+LJx4t335dplsaHp5iwnsQxRTJPY2oc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CH3PR12MB8354.namprd12.prod.outlook.com (2603:10b6:610:12f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 14:19:16 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8835:b7cf:497f:af2e]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8835:b7cf:497f:af2e%6]) with mapi id 15.20.6363.032; Wed, 10 May 2023
 14:19:15 +0000
Message-ID: <6e1930e0-1a52-6499-0ebb-998aa7e82c8f@amd.com>
Date: Wed, 10 May 2023 10:19:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-CA, en-US
To: vitaly.prosyak@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 alexander.deucher@amd.com
References: <20230510135111.58631-1-vitaly.prosyak@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/sched: Check scheduler work queue before calling
 timeout handling
In-Reply-To: <20230510135111.58631-1-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0106.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::9) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CH3PR12MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f024540-c9ff-45c8-31bc-08db51618924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xKQVoL2BznrwzmGyBwzzqtE8Tn6j5agTnfCkg3NW9Tj949ARRprHb3MaIn79dSx6qVbK2XfS4EFUTZhMxA0N762lX/65EQtJxmyGGE5LrSsqbbcjHYTgH3zHyXF1hNRScJlE/TlcGfhTnSHb+iDfaeg77Z++0j+k6kX4J/zxoOW13WhYCYJhSDUpJMlu2Lm08MbPPaxLI6Ff+76JLPXdVraUljmLBu3URetf6DSy9dOmuVJ8XS5GM3wz1SaW6iRe9KHZFYNNRSNDeCnBQodMZ8Huctzr167o/s50QiVE5xl7FlfdjjEEIfLbYnOXDRAuDrWlwHBbFrOpmSBwRqqxlKeQ7lnY+dqAtWG88GCwSPuujIbhC+763AfQzuEOoIm6ucPDWmyvkFJtLQB9VjSQ4cwhg3Ud8Sr2yc8x8v6lj22Q9waisMs7n0VXbakhM+7fbxBhh7VwQoIZ8DVlCbKgwnWTsETvcgImOP4QibAJ70klxf+nPC4QWILW1gLHitZuj4DhTJInFbgVLsQ1dwYgWZonFaaI81KS7Mhj4RQTTHQI3UeE8i6qdE3agpZm7gfVk3TW7pAAP94VcqML9M6NhaXHZo8OPaA6BGSUvEIYHOxkFrCGhRlEKmK9nA4RZOTCrVBsa/RZ35iQehxelk920w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(451199021)(6636002)(6666004)(41300700001)(8676002)(66556008)(478600001)(66946007)(66476007)(450100002)(31686004)(8936002)(31696002)(6486002)(316002)(44832011)(86362001)(5660300002)(26005)(186003)(53546011)(6512007)(6506007)(38100700002)(2906002)(2616005)(83380400001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cC9QanhYbzJlenpZZjJDYmd6ZHI0VHNmc2VSWmljck1wbHV6ZXVMNGlNaGFU?=
 =?utf-8?B?enVwOGdaV1JHMkx5YkhBZGNzUFUxeVZEU0pic3RvY2NHK3ZFYk5MUVJhdFlB?=
 =?utf-8?B?ejBjczJ2YW0zaS9PL0l6dTAxc042K3pQQWl0QmtLeEcyNFRCTmgwUVFtUDE5?=
 =?utf-8?B?T2xhVEpHL0pkNmJjLzUwTG9odFhqUmpsRnZubGhLUDArS1V6bjhsVkszOUI2?=
 =?utf-8?B?OHlKaDU2aWtjQUQ5VFB4WUpMR2VpY0dGbU9xekh5cnNhZHM5a0ZWMmhzTTI3?=
 =?utf-8?B?NUlpelVhRGdLUFlDQ3ZiQ0FqQTdhVXpvdXVXd2dxSDFGbURLWmQwQTNJdFBD?=
 =?utf-8?B?bHJhTlozaXZRWW5wNUVLQVpTUE11d2ZDNXhoZW5CcVFjaEg2S1RPUTBGYXRY?=
 =?utf-8?B?Y1V1N2RqNy9Dc2hLSDFaZGF4S0J1ZDFEdENMNWUxS0ZTZXJmTzBmUWVhaHZn?=
 =?utf-8?B?d01vNVFFWGtkdk1zc3U5cStxZ0lDYzZRRXMxYW54TkJqeTd0K3hIWTkxWC9v?=
 =?utf-8?B?YnhETEZjbTRFeGRVY3VGUGlGalZ0YmNrSHNwVlR4WThiQjhId2Z1WFI0dnlu?=
 =?utf-8?B?blNuQWlhVXdERGZSZVRnNGVsWTF6K01yaHVvcGRSb2d3cWI1MmJadVl0djZa?=
 =?utf-8?B?QzBNc2ZPa053Z0liYXJxcmZqakd5aTAzYjdneHdUQVBkYnUwN1dOWW5TK29v?=
 =?utf-8?B?Nm1Mc3VXWCtkbnZCeWRmSVNIQVpqOUR1YXdLbDh1ejM3UlJvNi9XT2gzL240?=
 =?utf-8?B?b2VQd1FUbmphT3ZBekYwbEZFQm1vNWdsU2hWRTA1UjAvSnRkZndPZktmWlZq?=
 =?utf-8?B?MGhPUExrcHpNdVB5WHhoOURVNTVuV2FiRHFDcEhoNFNCRWJ6bTVtUGFnZGw2?=
 =?utf-8?B?Vk9vNnlGYVdVVUVNbU1wVE9iVmJHRU1Na2E4dHp2akQ2YTRua2ZrRjB1ZDFv?=
 =?utf-8?B?YVFWcE11cDdGVmZ3RndKM1RMZ3VNSHRNMis2Q0h2VkZ3Y3pUdU1CaktjNExv?=
 =?utf-8?B?TkJxRFNyVG54TDZlWFAxY1VRYm9HUHRIOXJqQnJkSWIrQWtpZ2NiNTdOQ0J2?=
 =?utf-8?B?a1k3WEozb3B2MlgxbjhjZmtFaEppbmZ3Nk1Ud3U0QjRkM0FwQ0pCRGtRcU9l?=
 =?utf-8?B?UFR3L3U1bUZVSnRSbFZoTjROaHNNSDVlc1F4TkNPSVdxVVhrdi8rRHFlMUEw?=
 =?utf-8?B?SVYzSFJuYkM2L0JrSzhZTXlqaWxLSmJiTkdRMU9Lb2dGWndKZ21sR21LeE9j?=
 =?utf-8?B?cVdERDJFai82b096K3ZJQ2dpK2IrR2lZVVpHaG5tSER6MFQ0Nm5NSi85aEEv?=
 =?utf-8?B?cDRQd3N6TGFiQXNHaTJaV1EwUCswMXdtNjI4RzFFUVR1dmV5VElJSWRockY5?=
 =?utf-8?B?ZGJRSS9HWW5IS1NoczAyYWRSWDBCMStwV3ZGV0JLejNJSlMyUmdndnVJQkpP?=
 =?utf-8?B?em42dlVldThFU25lTGx0MEc3L3FqcFVhVnFySFVHY09GY2pVNUIxSGRGT2Z0?=
 =?utf-8?B?MVROUzF2ZUl0MXVEZHV5NWFCR0JYT0tBR3dlUnZXUDhyNWxSbUxZZDRHbXpt?=
 =?utf-8?B?Y0hPWXoyUlRJa2pOZUtWRnkwcXc2b05zaTliS0RaL0pvZ1UvTnFBOWorRVFV?=
 =?utf-8?B?Y2RsNVNkd1JtSzBBak5QK3doVnBWa1JrbkYwQSt3enJGVG9lcnZuSFRsTCtu?=
 =?utf-8?B?aG1jcEFSWHo0MDRqVmFkOEJFU2NIMDhTMEhNN3hCbVh5UmlpdWhJcHVwUXRQ?=
 =?utf-8?B?cFA1M2hOZjdzOUplV1JVbmFNTmFYVGJzTEwvV2xsZVY1WGR6Szl2Q2pnbGx3?=
 =?utf-8?B?bXpRYU9IOUU3Q2VoZ0FYWnQ1T0JDNTMyQ2lqYXBmdjlZUmRrSXE0VW8wR2pP?=
 =?utf-8?B?MUh0eDhpTXo2YTZYZFBxOE9zNUh6MFBFNjFBNEtWUkw2cmlHMmVseFNUd2VZ?=
 =?utf-8?B?WndvU2pLSlNlWXRzOGQ0YzF1ODhjSU4wYzVabDVNb0ltcWFlV090b3VGbzJR?=
 =?utf-8?B?eDZ2NUJHOFlHU1FWS2dITk81STZweVBza1lrQUFMYWFmU3B2aTF0cDZQblk1?=
 =?utf-8?B?dnpNMW1ZQzhMalVySHBZcGtWMHcxanhXeVVyQ0NyeXk1aWI1WlR2bzljaHhI?=
 =?utf-8?Q?nfei/6qhH3dcqd4m8S4WUFIjJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f024540-c9ff-45c8-31bc-08db51618924
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 14:19:15.8930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCmam0C2jrDBtWETTXiUpLcoY6kJTbgWfjUyGCZ0Xnc7/gIzD7+RSfxjDYFdo5bv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8354
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

On 2023-05-10 09:51, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> During an IGT GPU reset test we see again oops despite of
> commit 0c8c901aaaebc9 (drm/sched: Check scheduler ready before calling
> timeout handling).
> 
> It uses ready condition whether to call drm_sched_fault which unwind
> the TDR leads to GPU reset.
> However it looks the ready condition is overloaded with other meanings,
> for example, for the following stack is related GPU reset :
> 
> 0  gfx_v9_0_cp_gfx_start
> 1  gfx_v9_0_cp_gfx_resume
> 2  gfx_v9_0_cp_resume
> 3  gfx_v9_0_hw_init
> 4  gfx_v9_0_resume
> 5  amdgpu_device_ip_resume_phase2
> 
> does the following:
> 	/* start the ring */
> 	gfx_v9_0_cp_gfx_start(adev);
> 	ring->sched.ready = true;
> 
> The same approach is for other ASICs as well :
> gfx_v8_0_cp_gfx_resume
> gfx_v10_0_kiq_resume, etc...
> 
> As a result, our GPU reset test causes GPU fault which calls unconditionally gfx_v9_0_fault
> and then drm_sched_fault. However now it depends on whether the interrupt service routine
> drm_sched_fault is executed after gfx_v9_0_cp_gfx_start is completed which sets the ready
> field of the scheduler to true even  for uninitialized schedulers and causes oops vs
> no fault or when ISR  drm_sched_fault is completed prior  gfx_v9_0_cp_gfx_start and
> NULL pointer dereference does not occur.
> 
> Use the field timeout_wq  to prevent oops for uninitialized schedulers.
> The field could be initialized by the work queue of resetting the domain.
> 
> Fixes: 0c8c901aaaebc9 ("drm/sched: Check scheduler ready before calling timeout handling")
> 
> v1: Corrections to commit message (Luben)
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

I didn't give my RB to this patch so I'm not sure what it is doing here.

The fixes tag should be before the SOB tag, and the v1 line should be separated
by a line before the Git tags.

Since this is a good patch and I want it in both drm-misc-fixed and amd-staging-drm-next,
I'll submit it to drm-misc-fixed with a Link: and RB/SOB tag there and then cherry-pick
that into amd-staging-drm-next.

Don't push it to amd-staging-drm-next.

I'll fix this and submit to amd-staging-drm-next and to drm-misc-fixed with
a Link: tag.

Regards,
Luben


> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 649fac2e1ccb..670b7997f389 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -308,7 +308,7 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
>   */
>  void drm_sched_fault(struct drm_gpu_scheduler *sched)
>  {
> -	if (sched->ready)
> +	if (sched->timeout_wq)
>  		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, 0);
>  }
>  EXPORT_SYMBOL(drm_sched_fault);

