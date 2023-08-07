Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4040F771AAD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 08:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E8C10E1D5;
	Mon,  7 Aug 2023 06:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::61e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E7010E1D4;
 Mon,  7 Aug 2023 06:47:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3tb96QxMRI8zYPvbrPjXEFkJhvQKyrp1KJ/pw2lujwZMCQ3qW8F9iUtSL7E6ttdxHL4PTOvHMp5goqigJmHn7YPUx8knLwQN8Fm/myFqfiL9VWrW2swz3+rYqPU/iRAYJuWZI/zb/UtybabqwtanT8Hi9MJiwOVJSlwQbCk/7E1fWGHUrQlFS/ty83p6yGM/V7S4AUeAkh2GG5XSeRwf1I2B6SLwe6dM/YeD99pqKfrvkDGbuO5TnJNnyWSd1wHkYxvI86v/eX7JAT19iWR0lgdLc18Es/8xnd+ka71oQvwEp5lFFt8KpvXHqExiyoZY9MAYgiIb7djEdujgrrZBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiFIWzIbCmxm1c68JYb7z4LJO7yKlFnL62rgVsl+kuY=;
 b=NKSWYFAhgC/4Npv3mh3TBuPCOzGSKMHfHc2XAhEsSv+imdFQDw7mZToKYGJvTCoA0u3NoDhLS1FgBIkXJakgzNXfSYbbUwEnGDDYwsh2miUAtI16t57NztvOCiJcZ0vkXW2NkFK51R9bbBuJ9Ej23KkvKnapTa7ig8+J4c3KAxp8t+Z/6yuE282aBMsTixEVw5MI+gkfuNq3BqT8DoxXN7VOJzsqfBgwOcxFbEvKuZwJ4gicbOFhuXw74KxIgbQEULXeA8wFSP3v0NR9AfPwhSnXEJJ4GuwEMglpRWgEjrpDCTPlI4Y3JdKsI7Pj7fwkiCMCJDL9yJStmn4FAdZA7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiFIWzIbCmxm1c68JYb7z4LJO7yKlFnL62rgVsl+kuY=;
 b=O/bxydaJYi9tRmR5AQT8AC7E40a6o3bRg6vcLAYlVPQPKuG3lM9iACcqoDS6EKfLXvg8BU+vj9EnScj1Np+22Gge74T/GVqW/jSUQMY3fkvEMIetMllglzna3ugjGpCr/Lk4IMXSMSw5sUW5I0gHYdfaQshffWYQ/t/pAj+0naY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB6008.namprd12.prod.outlook.com (2603:10b6:8:7f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Mon, 7 Aug
 2023 06:47:18 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 06:47:18 +0000
Message-ID: <ed0b3a5c-9e81-6fee-aba1-5d1c9ca89130@amd.com>
Date: Mon, 7 Aug 2023 08:47:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/buddy: Fix drm buddy info output format
Content-Language: en-US
To: Ma Jun <Jun.Ma2@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
References: <20230804065647.4096957-1-Jun.Ma2@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230804065647.4096957-1-Jun.Ma2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: 1adcdf0b-adfe-4df6-5cba-08db9712244d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kGZdMV9dSdbVVa89ePj7kypubiCDUzJWQhSlLOE6/KYtAiCttsSYjWXbSJfRv0+93DwVwNcEkB2TYmBKssT0maeH52M3llBbR8k9wNxCNP+gah893ptp4m1WpmnWnRxD+Y4Tp6MUqBb3eCbd1ri0XMqx7BGmX/CSaBk1MtHbPzqP07Z1qZE7e4Jpd1hK5eZ+iMB7Z3YnfrHBLpC3uOjFp8CVljlt64B/DVyGVzfO6y1DuqTx0hr5KNiiw0m6IA4CczfpUhFEtGppFg+kt3wH3GvH+k2fRuTdJUGjhzSofS1WeNUCjM6+YdA8zf5VlyObbPvcg1R/UvVcqoKdKJT+U1bT6DJQndtO+1FiMWUuafKU4zb0XhX9giBSl1+83XS9bvjBG1Tb1242DqGxfwvPx7+8RmcdY8YRFO5Ld398MKDJYhtlHceeiMNLQzPMVDuFSwBu3/AVg/svGtxc/zpfEIkTvBdQlZu7/VqIktFfnyqudosTCurWwhIGxSb7GjaSAqoDODDQHuxEeephVWSmSnp3qXuChEjqDGWfjhVS+yK9c3PDxcQr5AwQHoFBUqWxFL7yukzTt8YbGav1nqhSjGpsA0GY/Ojq+DpdzS6M3STWtQwCEKkAoWtFBe2EvrOqeAvFfWhV3ae+NW+PpQ3Llw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(186006)(1800799003)(451199021)(41300700001)(2906002)(5660300002)(31686004)(83380400001)(8676002)(8936002)(2616005)(86362001)(6636002)(316002)(31696002)(6506007)(450100002)(110136005)(38100700002)(6486002)(66476007)(66556008)(478600001)(66946007)(6666004)(6512007)(4326008)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THkxWHhxbUlHRTFxMkY1dk45aDJlTFBnVEc4Vnk2MCtIUm9LMUJvaGptQjlK?=
 =?utf-8?B?Q3c5cWpmR2dLRGtUbzNqVzhVeXFkVHN3bHNpMzdtTDFkMVlZSHFOLzJ3bENt?=
 =?utf-8?B?dHl1WGRNdmp1ZmtIOWgybmlLYkRtdHJYTWFEUHg3WGVURU1hZWFCNUMzZXph?=
 =?utf-8?B?cndaZzFFb0Q0Y28xUFphUVYxTFM5K1g1TkEyRWpKUzRFSzV1WlJHeWI0MXo3?=
 =?utf-8?B?K1ZYam9oa0RTR3RtZGxHT2xlTkZLVktTT1g4U1FiOWVRdzhHeFl0bUJwMzA0?=
 =?utf-8?B?R2xLMGtiTDg5UVJHakRBaTk4aWlaS2RYUHBSM1RJWVNkU2hjZjJPYXg4U2dO?=
 =?utf-8?B?SEpJWnN3cWZlbjQwaFppY3NFcFlYcE4wa2oxMG4zZUJ3NVBBcXlVa2pwSUFj?=
 =?utf-8?B?SmFQN0xYdzVrUHIyK0dkT0RQYUE5ZE44REdUU3pxNEsrQmZtQW0wZDVlZmM3?=
 =?utf-8?B?eWNISWx5bWR6K0ZXY1pVZnNBcVNjUnFtZVJZRCs2c2lBTnlqNHZiNEprdTBO?=
 =?utf-8?B?aGdkRTAva1NSUEJYZlZOUDN2RzZWelMzbmZOZWRpNFRIdU05TWdkTjN4aFNa?=
 =?utf-8?B?WDV1blcranQ5bnZHR3ZvMnVtb2RrczhhenZRQmtmdWNXaXhoamFzQkR0WFJ4?=
 =?utf-8?B?aWREWHFIQ2JaeTEwMWFuMlAwdjdYMVI3Wlc5OXF0aHA3d2tpZEl1L0t1WkNI?=
 =?utf-8?B?aE1VNk9mZmpaSlhCRllONXFUTktZM1pjOFhQTStMNjF2N3BwZVNRVTV5TWta?=
 =?utf-8?B?aGRKanlsbHhOR0xLNERQR1JGUzlDYnZ3UldVS0E4TmtPL3ZDd0FDNVg2TE1M?=
 =?utf-8?B?VmcwbXZaYXNUMVpSMEhMRlh0NFBaN2xiQ2x4MjFBdEk1TGlKSllTOStaYXFG?=
 =?utf-8?B?YTJDTXRXMmJ1N3VmeTdheXZYa2tYckEzUmlGNkJrTDA0SUs0dk5DeEhJS2w0?=
 =?utf-8?B?dHV6ZHlHVzJNTll4U2k5a01UTVF0VFJQRy9VbHRZSXlEMmQzU2ozckdZbEc4?=
 =?utf-8?B?V29RN1J2NzRLMTBTc0hKUHRUNCtHUHVCZURzUkZ1MXdNMm9lcmNqRmlaSFY0?=
 =?utf-8?B?MHZqMG1hTFhUNmwyQkd5ckd2R045dExLVWJHSG9PTE5SSzJBMmZXVy9lZlg0?=
 =?utf-8?B?clIwa3pHdFEzWWJocFRMT3ZBeDZYNVNNcWRXZ1JHY1dnaElTSUprcFU4cnY2?=
 =?utf-8?B?OU9aNHdCTEd3aXNFWlYwcUd3WUVRMFV5N1RhZnZtczEzT2FWcXBTRG1QN1Fq?=
 =?utf-8?B?ZGlCT29BaHRPMGpvdmY2eXNTOVFhREpUUXBCVnVvR2dnUkt0SkxNMWdsZWx1?=
 =?utf-8?B?TWdkSnVpbFV5bUI5Slh6T3ljUGpSWTRzVW1Sc1UzU1lRZ3NMbXlscFo0d09J?=
 =?utf-8?B?TlBPYUh0YWpLYWFRbTNVbTR1aFkvNFJmcWVuQ1d4OC9acFhhTUdxb2JXam1w?=
 =?utf-8?B?VmZQdWpqS1AyVHh0VldFOFIwellualU4bHkxdVN2SThFcXdtVTIxckhnc21H?=
 =?utf-8?B?NXlocm8yVkxsczZNWEJCY0JzSWFWUXhwaTgwb0xnWTdNS0ZpY1hSNDB4cGpX?=
 =?utf-8?B?Qk5DdWhpN1hpY3NjZzhma1BCb3FnYjRqL1VDZ3NIV3l3TDREZ0RHeVF0QS9W?=
 =?utf-8?B?cWUxRVFGc1Q4cjRqZzFyeHVLRG1VUmpHdCtMc2t6bkxBOE40Ty9tRkV4a2du?=
 =?utf-8?B?c0c4SFZjMFZQSCtON2xneWNJNkZDQjl5ZEJUTGhZb1J1bDdCdCtvMTgrbGVK?=
 =?utf-8?B?ZXdCU0U3dE5UK21LL0orUDltQXZHbXBrWkI3SDdCeDh0SVo2RjdBSkRiQkI2?=
 =?utf-8?B?dGVySWVCRmJEeWt4UlF4Q0kvSTJBeDVLUW5ONGJNUGE2b0xOc0hDU1VVY1da?=
 =?utf-8?B?bHB3VmZIb0dXdW1xcEtZRzNRSHc0Z0ZQUFFVd0FZajV6amV3Q2FFNjU4TjBn?=
 =?utf-8?B?bkhaYWMxVzRyeE4waXRqRUlKQy9wY094cGNwamFHUms2RElMaFdUQnBUMnpp?=
 =?utf-8?B?V2NDTWt3bXhtTGlDTUg0SmRhRXFJOHU2bDRuMy9vYlVFWWNxWGU5NWVOamhM?=
 =?utf-8?B?YlJxakRmeFhIRXBubXgxZUpVV01mRW1FZkl6bUdsZk85Zms3cXovUnNMVXY5?=
 =?utf-8?B?NVdUc0lxNDgydXVMQ1NZRjY2My93OUQwSVlRaDV6Ky9aVWM5TEZ3M0NhU3cv?=
 =?utf-8?Q?jtc+OGFuX2NmbVphVpspwh3X6DC2No8he8+pSkcFvgE4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1adcdf0b-adfe-4df6-5cba-08db9712244d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 06:47:17.9913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFw9QyBwYi8XDainOXT9ev45GaKqY591U9EEb/vniNhzlbaDVV+epDAitUPvWA32
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6008
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
Cc: majun@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.08.23 um 08:56 schrieb Ma Jun:
> [1] Change pages to blocks to avoid confusion.
> [2] Fix output format to align the output info.
>
> Signed-off-by: Ma Jun <Jun.Ma2@amd.com>

Of hand looks good to me, but Arun should probably judge.

Christian.

> ---
>   drivers/gpu/drm/drm_buddy.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 3d1f50f481cf..ef3dd15c334a 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -781,15 +781,15 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
>   			count++;
>   		}
>   
> -		drm_printf(p, "order-%d ", order);
> +		drm_printf(p, "order-%2d ", order);
>   
>   		free = count * (mm->chunk_size << order);
>   		if (free < SZ_1M)
> -			drm_printf(p, "free: %lluKiB", free >> 10);
> +			drm_printf(p, "free: %8llu KiB", free >> 10);
>   		else
> -			drm_printf(p, "free: %lluMiB", free >> 20);
> +			drm_printf(p, "free: %8llu MiB", free >> 20);
>   
> -		drm_printf(p, ", pages: %llu\n", count);
> +		drm_printf(p, ", blocks: %llu\n", count);
>   	}
>   }
>   EXPORT_SYMBOL(drm_buddy_print);

