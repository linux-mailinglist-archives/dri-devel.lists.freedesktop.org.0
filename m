Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A395582A38
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 18:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3364FAB832;
	Wed, 27 Jul 2022 16:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FACBABB81;
 Wed, 27 Jul 2022 16:04:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OD6+Id6FMAlo34bQXpne2nqbn92VE1VInZYfL0USyHKuhYCGBAJ56gHa9TwRxu8mtf5FNTMUaABiyAnwFNCMijoUTPw3di37vh92zgFGcooTUJC2Y3z3NsnPcAM4cELCVIyJJ0ltwIm23KjDUbqPJPa+JifyP7QXkTINNm7BvxHNm5rRiJKZ6h+lxEDYXig3U5168WBAX4xqq/3MDefRQOSNWfqV+LSkMLjoSpNOSJC52W9yjaRn4wRFkYIHjjOONVHs10DQajy2W0eWJIRe/8xSp99DjTA+FzVPLbUBhMbV0y+YRUG0xhE3nVl4IHtjFwiAObQZ5+far1JgsADDOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcUQ8k++Hl8/w5pcOezVWHmJ5Ppv5G1VP5LgK/1cmIY=;
 b=oIkZkVexJKeuss1Q+4b8kcqRKLcqzIFLh19ZDNIPtddYp1HaC+Z/QrHvriKiYutX5V9QqBO34++ySrixpD70CMKpCCS9jbCigYASJ0M9d8RbMlMuDERmIsUfql0OtY2k0WArLKrPEuczr4tpciagEcGf/V9j2XNKSduaQdBo3owVRfKpwafyVdg+ZZ4BIJOuenpFiaJz6cQ32iJTTgHxZn6dH+4yHoyNBYXVrs5NftfnZRcqP7q7ca+Bqd3jK7H2jxtfoz5uRumZfqPVR7yewOl2Fw/2gH0HPu00yLlkPx+o1OVWw4tY5GiJmGmWWr8ff7I+5DqaCACn/UL8Pf5uXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcUQ8k++Hl8/w5pcOezVWHmJ5Ppv5G1VP5LgK/1cmIY=;
 b=Sr0blYj+gp24WPOcIn7mxPd4aQ9s1EUWWGjhn2IVuj0f8/yqdy9szEH0twltn7Qk/7iMjIBZLXg5fZHMUqDtTu5zFRAZ7h7Rg/rpQCOfg52um/FejgObHhAXMN2XgDPR3kZ3GrX+0APBbzmVCqvaqGFr3ASvv/hwUIHmjZCE3mY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CH0PR12MB5316.namprd12.prod.outlook.com (2603:10b6:610:d7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 16:04:13 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::406d:afb5:d2d7:8115]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::406d:afb5:d2d7:8115%5]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 16:04:13 +0000
Message-ID: <17e02cd8-eba1-91b8-2506-91a7893ac967@amd.com>
Date: Wed, 27 Jul 2022 12:04:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amdkfd: use time_is_before_jiffies(a + b) to replace
 "jiffies - a > b"
Content-Language: en-US
To: Yu Zhe <yuzhe@nfschina.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220727025917.22477-1-yuzhe@nfschina.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220727025917.22477-1-yuzhe@nfschina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::12) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de8ab7a3-7992-4960-4206-08da6fe9a5ed
X-MS-TrafficTypeDiagnostic: CH0PR12MB5316:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dIlZzzRSzKp2Ip/stngwCKQW3vrNqiBWi8SARYOvzVcOrFwAcpWsYHmkgEuApB0neGyawbxD+FmnYOUnQ1TF25mEu6t6jNWNtiBVrcSEKgJI4NSlhqqRN7UUShFUtfpnt5xbsm8ViXC/X3TkEf6CxrGIIje5DImjNMGqM9fNQnJ+COPYz5eXtsSxRDOLxRgmzUBiUDiD+QluEHP9WS7cnB6nwS9fcL3dFx4B2WxrZJ2k0xAIYkdCiZj7Dhy5iZJmhgUwmvSuGXc0FN5UGedBna8ZPBGKUgze2WGc9iU8F85Is5jtmsZw8XXTHiE83Y9h+M07nlEJw4Bac3o3y4+3SIA6nD6ft865tlgbMqo9gL2DCqXEPcIXWTMYG/x73YLfoKruwDc4G9MggVRoqfct8knT8Qh3ic2u2oFyxeyNLFJ+xGhbsU9KTvexQfsEEMFuXTKEwY1CVLNIPwhPoCRFsV3DfCQqWGiZGoIeFKCbuqiIeTvbpoGA4asmyw2MVN5QVfFS9cEmHXwtjRDX0saV0WIbeXC6T4saU/jq/oQPvFbddIF8YiNS7c1K9lcO3s2wPz9hIxIZdEIIsBJASxYSjKC7b6YC2QX91qAd2NLwT45XSdU4Ih240U+sFQ+DI1r6qsQWCkZTpabduaTQ2CeG1gxe3B973VBrA7LHECWWq1oauDyZZDZmRb9+/digaSa7Ixzam5SZxS8rtdco3CfUVoIF3/Hfz8Y40vlXvpBUrqc9+t6u6wCg96AYAhegkEv4wN7MYpIB5M+ra+2Eo1Lj4ToZGOYb2E5cZz+S7EaJ02SW/Hg3QtKPmj+zdbSpo4A8T5CcR297u3g8a3jt9kfClg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(31696002)(86362001)(36756003)(38100700002)(8936002)(5660300002)(44832011)(478600001)(6486002)(316002)(4326008)(66476007)(66556008)(83380400001)(66946007)(186003)(2616005)(31686004)(41300700001)(26005)(2906002)(6506007)(6512007)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmphK1RCYUxZMTNXZ1RQZlVvWWNtL1BPbXUzaEVIQzNaNmpaN0JwUk05cFZ4?=
 =?utf-8?B?SXlqV0pTSHZQdmRLTjNncWZ3TlMydjVsUmI4aHpCNnBubGJQYXpocDgwOFkr?=
 =?utf-8?B?bG96YjB0MlFGcjlwbk15L1dnNFkwVmFGVmplRVpiU2NWK29PS2pDZXpkRlFC?=
 =?utf-8?B?VVhjMm51Z2ZLMjRWZ3htbzFPejdUMW5QNnczd3pNZnRRNlpuNlY5QlFHek1p?=
 =?utf-8?B?L0NGQUVBUGU4Q0JLQ1BLWTdBbm56Ym9CV3A4VXdGdzB1b2FLeWZtUHFOaDFP?=
 =?utf-8?B?YlA5N2J5NWNHemlWVys3c1FTY2o2ZzRodXhHVDZaWTJGQ3Qyamh2VmlCOS9S?=
 =?utf-8?B?UFFEZ1JRTE5jSDRPbE4ybTJ3Vm4wb3haUjBxS2ZPMHg1amozNmtGOXNuaUpY?=
 =?utf-8?B?VzE0ejBMeExNTUFZRnBYSGZLTitrbUowdjVocjhhbTlrME1rSm0rRzR0emor?=
 =?utf-8?B?MGZiM1dQdk9ES0Q3N0tlWE9KcmdFVmNISm93ZDYzZU1NSjBWL04xSXVwNzN1?=
 =?utf-8?B?bnozWkpIMWRwblNCWm5wbTlZNEpldjk5UE5SQjZBOUY5VjBjUEF6YngzOVox?=
 =?utf-8?B?cVh3N0gzenBDK1g0V3NwU0NiZFdMZTlYT3ZkcS9XSEdsdzlDdEVab3hqNlpI?=
 =?utf-8?B?a3R4UzJJU3VXaEJ0aDFydnpZcGpidDBUMTRxMVFURHM4a3MwUmpzdFk1SmVu?=
 =?utf-8?B?V3hEZlRmc2pRVWlwS24rZDllSEZqRS9ZVmsyV1VYWnRUU3piam5QTi9iaTVG?=
 =?utf-8?B?anhJaVVHUjF2RnBGN3EvV3d5S2x1SXRMSjVBTy9mYXB5ZU5lb3hOK3ZZelRX?=
 =?utf-8?B?UHFyNFovcnFRNjBoeWJjZklld0JiclF5MUZjUWV5ai9sUXRSeVRERVVFdmxS?=
 =?utf-8?B?bk1La3hRV052blJqZEVXUzkrSmswRHl1OWpuWEhoNnluRll2aEROLy96UE1S?=
 =?utf-8?B?NjZlRFF5eU5KWDZmSXBvMXNzY1BUYzhNaXU4REJJNXp5Q3U3QWFUNWN2ODlJ?=
 =?utf-8?B?cXRHVFBoeUFibTB0VTVkL3EyeW1tU29qQm0yZEZ2bUVpV3pXQkF6TktIOVFi?=
 =?utf-8?B?ZndnSmdmZFkvL3BuSDNGSUlUZ2RKZ0ppdy9iVlBkWGt3Z0sxYW1KT25jeDVC?=
 =?utf-8?B?eEJkVHg2TTBrbEFiaURHcGt6aE9peU5CM1VFbVVCMW1qQk1lY2l1eXY5LzdC?=
 =?utf-8?B?dVRBT3V3WWlKMFNRN3hjbmgxOFBLWWJRZDRBcDZvWDdOb1BLZXdwQkEzT1k5?=
 =?utf-8?B?QjhFSFFDMmp3ajcxOGorWGlSQ05qdmw0Qnh3OU1ORWNadkhrelZ4enloT3V1?=
 =?utf-8?B?NjR4MmVJUnVWR2tHN01ySnFMazlrYWU5SGZUK3NJUnF4UXNhQzIwYWUreHlU?=
 =?utf-8?B?cHpTd3FGYk90OHNOYjZOQzVmSUd4NU5mVklTV2FsTi83SllqS3RGV1pjczMr?=
 =?utf-8?B?R0FtZnVHTjNveEtjT1lYSEtaR29CMzNmOE1kdlBKUUE5a1l3WkFHMGFyMXUx?=
 =?utf-8?B?RU5iSHZhUzRhMUZKQVpFUEtLMTVxQnB3Z3o4YXhDeE1oWUZ1VW0zM01MSTNT?=
 =?utf-8?B?THVBRlhFZ2FrMExENzVIZzl2SzF2bzVaMWNNNTNqZjJLTDg4cXRZRHZZWlVr?=
 =?utf-8?B?TjJ0ZEhtVzBUejE4YmpPeGxGNjhUL1E0RkVXRTg4ZGROTTROODlDejVZMTZS?=
 =?utf-8?B?d2Z2QXZJTEdoaXpYRGRHeWE0YkVNaFM4b21GZ2VTakJWYmZjc0Rob245aEZD?=
 =?utf-8?B?YWkvVG1KWVFUMzBEbDdpbDRXZWxGdXcxOFlIUTBWelNXMkM3L1F6YjJMV1p4?=
 =?utf-8?B?QkNxU2tUUmVEZTJCOEo3N3BPRUdiNzJJQkE1VVB6V0FSZFNxay9QcEpqNy9s?=
 =?utf-8?B?aGRvYVRnTEVndEhUdG5McENES200aCtOQ3BpZU9kclA3MEJpcDNpSm9nUGNR?=
 =?utf-8?B?ME9aeXdLVzRFcU44SVVtcDdpeE9QZkFJYjBYaVc0aXBSV2tTZGVjYnhBS09u?=
 =?utf-8?B?OXRkbDB0RGM1TGx6YXBxbHhhVlEvbUpJcDN3bytNd3U5OExNQWVBdC92bkRY?=
 =?utf-8?B?MUtFZkxtbyt6blZSUDVxdXZHUk1vc2liMkpNZTJheVpObGR4V08zK3Z6cUJa?=
 =?utf-8?Q?8DtjywJZCqcTDJRlWlQ5CddBi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de8ab7a3-7992-4960-4206-08da6fe9a5ed
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 16:04:12.9448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56PnFny50NM1GeoUfnNPsHUuSBV1H5iKRAw9Q7PsVif3e4tICswilZIu1jKBGrFL6muIJoW6g+L0HjHjknWcfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5316
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
Cc: liqiong@nfschina.com, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch introduces a build warning for me:

   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_interrupt.o
In file included from /home/fkuehlin/compute/kernel/include/linux/spinlock.h:54,
                  from /home/fkuehlin/compute/kernel/include/linux/mmzone.h:8,
                  from /home/fkuehlin/compute/kernel/include/linux/gfp.h:6,
                  from /home/fkuehlin/compute/kernel/include/linux/slab.h:15,
                  from /home/fkuehlin/compute/kernel/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_interrupt.c:44:
/home/fkuehlin/compute/kernel/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_interrupt.c: In function ?interrupt_wq?:
/home/fkuehlin/compute/kernel/include/linux/typecheck.h:12:18: warning: comparison of distinct pointer types lacks a cast
    12 |  (void)(&__dummy == &__dummy2); \
       |                  ^~
/home/fkuehlin/compute/kernel/include/linux/jiffies.h:106:3: note: in expansion of macro ?typecheck?
   106 |   typecheck(unsigned long, b) && \
       |   ^~~~~~~~~
/home/fkuehlin/compute/kernel/include/linux/jiffies.h:154:35: note: in expansion of macro ?time_after?
   154 | #define time_is_before_jiffies(a) time_after(jiffies, a)
       |                                   ^~~~~~~~~~
/home/fkuehlin/compute/kernel/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_interrupt.c:159:7: note: in expansion of macro ?time_is_before_jiffies?
   159 |   if (time_is_before_jiffies(start_jiffies + HZ)) {
       |       ^~~~~~~~~~~~~~~~~~~~~~

I think you need to change the the definition of start_jiffies to be 
unsigned long. Do you want to submit a v2 of your patch?

That said, I think the existing code was fine, though the type-mismatch 
highlighted by your patch is a bit iffy.

Regards,
   Felix


Am 2022-07-26 um 22:59 schrieb Yu Zhe:
> time_is_before_jiffies deals with timer wrapping correctly.
>
> Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c b/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c
> index a9466d154395..6397926e059c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c
> @@ -156,7 +156,7 @@ static void interrupt_wq(struct work_struct *work)
>   	while (dequeue_ih_ring_entry(dev, ih_ring_entry)) {
>   		dev->device_info.event_interrupt_class->interrupt_wq(dev,
>   								ih_ring_entry);
> -		if (jiffies - start_jiffies > HZ) {
> +		if (time_is_before_jiffies(start_jiffies + HZ)) {
>   			/* If we spent more than a second processing signals,
>   			 * reschedule the worker to avoid soft-lockup warnings
>   			 */
