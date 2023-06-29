Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9EB742071
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 08:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BE410E002;
	Thu, 29 Jun 2023 06:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD5E10E108
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 06:37:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anVg5lGJQMJX2Q8akaWJUiqhy02yd9GFLsICOCYWBKJfFgcMalyxhpPP255Ik4E2Pwn/e/d3MNvBt784fhr5qgsJyxz1dwa+m0V7PgkeeBmj44Neuh1GOP/KbOim2nTEVIRRVKSCfzC4JzyfX8Nh6SXUpI8VYzAu4Su6oUAEHw8LZhVZItwJMAWLST6I7zYhYuvrIG3zJLeGtI1+GXsiQsW6r5bQoFPDOtTDSQX5fb7RqkhGpSkYEf8/IB+HRAkdl9qjVKG5qKAJfQ5WhhfNI8OL1FHFXZY82AbiVkLa7prxVQiXAGvWdinQjK771M7EJnQFDtvGOldBmnLniXrgNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4YYPkIrpz/4CMO8zxEWkzr/uq93ua1yDY0pXaDvsTg=;
 b=JIi+Br4HzpIFTiPn06uVkuOdNPZLuozndpxH3oIFAapdqjWdHelLTqlFfPSWyGZfmjPrkUZm0ddknwOY0InriJOUzShS/PSet6x1OXn11pUSX9sS4XvTOM1+INqdZZ/NTwLKmt7/Rfq5keU4mBNTPLv5lc2lFRqf3JSlsn9TqoxUakG/HieR84/UqqXDM+5WRGXE/tENLFIAUG4Q63YMbWfAdgI3xvRdvmzz+9/JOlHZWHeECXz6mkzg3j1UJoOOHTuii2P3BvLSSKmTus2YCXUvaNJWoRtcUbllzqUIcsIpLllOfrzFrY0BXo+YfL9ZVi2T3RNxvgBKxflFxq80sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4YYPkIrpz/4CMO8zxEWkzr/uq93ua1yDY0pXaDvsTg=;
 b=J48w9wNnVS5T+cf3LcTceRZYpCfOEaDzzQ4rDtC/HKSBImnwxp/6UOzy539BqVRHgttdlylys8ZA5fFW/AbV728GcvndYmlkHR3cRqfVjNJib5g96nykSrCIlWV729oTEQ3kMtm0o8dz2ur1n1jDih3OfOjhGhE2E3qCdp6aqI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW3PR12MB4411.namprd12.prod.outlook.com (2603:10b6:303:5e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 06:37:44 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 06:37:44 +0000
Message-ID: <cfdc6818-ff20-1e57-34c8-3b5b40a837d7@amd.com>
Date: Thu, 29 Jun 2023 08:37:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/ttm: Remove duplicate assignments to ttm->caching
To: Feng Jiang <jiangfeng@kylinos.cn>, ray.huang@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, michael.j.ruhl@intel.com
References: <20230625024528.13668-1-jiangfeng@kylinos.cn>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230625024528.13668-1-jiangfeng@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW3PR12MB4411:EE_
X-MS-Office365-Filtering-Correlation-Id: 8abbf952-1411-4457-e689-08db786b5862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iM7S5NOe9n+AEc13QAtqu2bgI3KIEKKvXK22zaYatNZcykpA+wk6Beqc3WcE0HmgBwIP1Fzxrip4IziTvKGW51q0XSs50mno98cnbAZIiJdPkX2X50KC+0owfOd+SNLu6O5EmJObIGSUM5RdRgs3coi/GawQhap8+KwO1myJDO4Ps5yF7JIYOpo/l/B0e60rLaEQhKYQ/kWAmA3O5oyAwBh+yxRQAXBpX/48bcBwrN7z9pRpFXA/jdmytp/l2IR++kU6e4lxfLAJHwVcKVDmz/Qs8m6pN6ILRL89gq7eNYkWAo/hqZW4Vxm45iFib7ZkG/0PZv2ZyWCN2hrNzxcpceE7r4H/NKS89KTQgyPSltDofuvUvF+J3VqpNQ6ijNX0nYoNUXVBt6ri8kl5JWEcVO6PgmJKIag4Q3K0xF7GnsOVhNjqIDqKwfWu59FBBx3rOGEbW20XNsBmeZCHL17arKEm4Oyn1GE8W0Nn+k5Xaz5N1/pw9pxofpzsy8DFsDDpt27NgjlP6MmdGYilKJHZHJ1rUvWTgtDMffuS3qgVbbX+3xcrwpBeNHMdrAUCdETBtGevynF2L9/fNh1nzU1j+OQ9RIW4dNXPsIQyGPQe9zsQAFflfS0waZDb9orAuro9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199021)(8936002)(8676002)(66946007)(316002)(41300700001)(83380400001)(66556008)(6512007)(6506007)(66476007)(186003)(26005)(4326008)(2616005)(966005)(6666004)(6486002)(2906002)(5660300002)(478600001)(38100700002)(31696002)(86362001)(31686004)(36756003)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c05ERmNlZTBQV2VLWlJ2Ry9zcG1KZHowWlRYeGIwYU8rcGZ1cnVSRkVqTUlt?=
 =?utf-8?B?YlE3VVBkSkpxWGZrR0J0K3hmUEVsRTZ3cDU1M2ZxeERRSDQ1RW9KelE3cE0x?=
 =?utf-8?B?MU1EVFp6THFYeXNVMUgrZWtGMDV4QTE3b2VLNmZCcnFoeDNJMjd5NzlFRXBR?=
 =?utf-8?B?RmNwVTVZOUsyZ2c1d0ZZKzJUMStOSDVCUlRKTmZEMUFqNUZwWmE1Y1psNEhr?=
 =?utf-8?B?aU5VTEVGTEZRWFRWeTM2cFBYd2RWTHF6QmVacE5Sdm9EVEtVbXRkSWlId2FO?=
 =?utf-8?B?MDV1blZlamZYQUhOVjZxZkJmMlh5NzIxTy9RcmF0blhnRDVKd3FLY2o1M0JJ?=
 =?utf-8?B?L1RKMTQxK3pQam5ac3Y3cXpZYitGbUhyMDdaK25XK2YyL2p3TGl0dFlKTUNw?=
 =?utf-8?B?Z1NGY09mNjduUHdreDZ2b0FHRUpRQ1BnVlZwUVBNZDVGeFdNUkZBOFZlUDZ0?=
 =?utf-8?B?Vk10Ym01T1cyN2luaVAzYWF3T3hrRzRWWXhFUDBobUo4OXgvN1RkT1VSQXB6?=
 =?utf-8?B?RXpkWkpCb25MaENXTWpHUWFzRjdXc3RKdEE0NVVSQjhJL2JDdXhacXRyOXN0?=
 =?utf-8?B?ZUJSZkozbHRjZTJXMGZuc2djTWVURUVQZWVBWWlRMzVFT2lFZUJrV042NjBO?=
 =?utf-8?B?VjU1dUtiMklnQXUyMzd6cXRJYUFKQWo3bnhGWXlzRG1uZDR5OStXTTVmMmpy?=
 =?utf-8?B?K04wQ3hyZEhBbktLZnJpZThOZ1kzZTJ3bHIybXBzTGpVMVB3ZTNsMFV3Zk9i?=
 =?utf-8?B?U1FHaTRoV01qZ1ZpQzZuN21EUjlqRUo1QXVsZXBDaVpqY25ocjVIdGN2Z3VQ?=
 =?utf-8?B?WmFlKzRKR09HVHhUYWVYUUhZczBoakJwREROV2puTTU1VklqK0ZiVkVwN1Vi?=
 =?utf-8?B?WVNTOWlYbHhTK2JxZlZMTm85VFhzTEU0Z1VoQ1FuUHljMEpMc0ZJS0t4LzlQ?=
 =?utf-8?B?QlV2VVNuWmdYM2xXeWh5ZTdGMk43MElPdlFoc09vVVJ6YUtJNEpBQ1FSdmNQ?=
 =?utf-8?B?cVArOE45aVhBU0kveVptT09JRW1hUjQrc1VYUmEzWGFBaElWRGtFVkJDVWlx?=
 =?utf-8?B?OVQzVkV2OWJmSFQzVWVNam9RM2dqcHRRNS9EK0pzZ0U1VTY3WW5qczdjWXVC?=
 =?utf-8?B?UmUyVkJRZVBIOFdOQ2VDUkRUWXE1Y0pMYWMyVFpSbnFCNmt6QVJSSkJSTWxY?=
 =?utf-8?B?TjMyQnJmRHk0NG5IRWdROFJ0V3dEN0RNTHE1OFloOXFGbmRSTnhnNHdCQnV1?=
 =?utf-8?B?azVid240SmNRQkJTU1hBMmk3Z1Q3UmRyM21UM0ZQTmJqQTNPeTFIRXNZZ3Nx?=
 =?utf-8?B?azN6L1ZnTjRyOGVXcVBIS1praUxDQ0lqVW5tc1U4TWlHaVVpTzVreWJ5VElO?=
 =?utf-8?B?UXI2NEs3MTVqeFZiVGVHY1pFejlCMHJLNXJGaHl1enplZW5wMGNOWklXUGlR?=
 =?utf-8?B?T0YvU1c1L25aNWhwYWFwZ2hXUEQydUZyTmFwSUxjNEJvbno5dkNmVVNNeWMw?=
 =?utf-8?B?SU5vR1phRngxZUIvOGhUcXl1S2k1aUJsVzZJKzJqWUdhRkFWSi9pcHE1V3BE?=
 =?utf-8?B?ZWdkZ1JBYkNiRkdkUjdscnBlOGMzWm12ZjcrR2FnaXlxR3pKZUkyZjVRb1hM?=
 =?utf-8?B?eFlGZmNUaUFnemJqV0hhS0NlU2I1Vm9ENDQ1WWNweks4SXVzSzZqcG9oem92?=
 =?utf-8?B?SkRQZm1zSFRITDNjWUgzRmRqOHpCQlQ2M042UXhSWkw2TGo5VUxFZ2N4ZHRz?=
 =?utf-8?B?WVZsKzNRVDg3R09LbkY3VjVCVlQrQjE2bE5yZE81RUFuWThsTG9SNS82QU1Q?=
 =?utf-8?B?Qk92U3pIMS9LUHY2czhhRWJCcmM2aXBNN2p1bzQ0VTI1Z0MvVEg1dXovWTk3?=
 =?utf-8?B?QVNzOU54Q0Q3UXJSY0U2S3BmV1hkMnFra2NwV1NkemcveXNQL09lWkRHRXBu?=
 =?utf-8?B?OTNJV0NFSVpWWVFnM2xUUWMrZ0UvYTlPMmY4WnJiYS9UWEEzMVVXempqdHdu?=
 =?utf-8?B?b0VqV3VyT1RSVThFdjk3U0NXMXNyclhTMmtRWlF5Qk9TT3R1WVF3anJBOEd4?=
 =?utf-8?B?Q3l2LzczS2JXSmdqQ0Q4ZXptMEVHa0RCL25hQ0pwTmI1VlQ0eFhYdjF2Znds?=
 =?utf-8?Q?Ldsc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8abbf952-1411-4457-e689-08db786b5862
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 06:37:44.5746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/WLztKJ/rDkE+Rp/uYwfjt0gX/ZkJxQ3txag101l25q+PdXF5G5tgdV4Ri6GTKj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4411
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This has already been fixed with:

commit 2ce977df10c179138e2723b25c2d2c055a3e3cc6
Author: Ma Jun <Jun.Ma2@amd.com>
Date:   Wed May 31 13:30:51 2023 +0800

     drm/ttm: Remove redundant code in ttm_tt_init_fields

     Remove redundant assignment code for ttm->caching as it's overwritten
     just a few lines later.

     v2:
      - Update the commit message.

     Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
     Reviewed-by: Guchun Chen <guchun.chen@amd.com>
     Reviewed-by: Christian König <christian.koenig@amd.com>
     Signed-off-by: Christian König <christian.koenig@amd.com>
     Link: 
https://patchwork.freedesktop.org/patch/msgid/20230531053051.3453509-1-Jun.Ma2@amd.com


Regards,
Christian.

Am 25.06.23 um 04:45 schrieb Feng Jiang:
> The parameter 'caching' has already been assigned to
> 'ttm->caching', so 'ttm_cached' is redundant.
>
> Fixes: 1b4ea4c5980f ("drm/ttm: set the tt caching state at creation time")
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
> ---
>   drivers/gpu/drm/ttm/ttm_tt.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index ab725d9d14a6..1ce4b36ab33b 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -137,7 +137,6 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>   			       unsigned long extra_pages)
>   {
>   	ttm->num_pages = (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) + extra_pages;
> -	ttm->caching = ttm_cached;
>   	ttm->page_flags = page_flags;
>   	ttm->dma_address = NULL;
>   	ttm->swap_storage = NULL;

