Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C96958808C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 18:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF2791B60;
	Tue,  2 Aug 2022 16:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C1C10E2BE;
 Tue,  2 Aug 2022 16:57:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJd5QHZ1Kemad5zzT4prIRs0ZgEmhh7ZdV3PhgDPotBrXxRU7ZUx9l+9HUhgr7iqvUX3HrmOklPMvNABaL5SY3iP8vJn/iDjyV3Z3LzY7fi69BKv1RL0/sCN0T0KogoBL9s2oM5rSnEbVXuvreqIYlY70JTbPMK7fr6lfvg9UtBd6NgIWbE4Px3NJEEaQEt9zV5VynO26cCQQWx2Noeu9QoEwx0NHP1Y/OsGu6mjfSsi8MPOlFi6rQzGRUC/u6r038XLMcVc1GMeKmAFOLVV9/mNoR5C2CYKd12e6d6DoPC4qQrKbfLWxbxTf8qwxCondCVdOD7TNblajGXU4sMxRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0BRbTZfcFYlztC1UoZwBV4VBnGguZZdUuiS1uG80+g=;
 b=K94hY/EV4rVcZbLNUg8gCH8ryBmVWueNFGMrnbJkV7CEcuDmbKRebK7azjTk6E+d9j6gLdSehpOvLYeFYNInU7YW67EuAN8zDSJ3TKY/7Ng5wHp7mbYVo2Liw2/2CvyHh7Xgeqjzpt817Rt1eXXPVcI5mq/MfheoZzY+kKu3YE4EwTUoQ+u4pN/DgRo3M/Yt2n6uB5iy04qLH1YDFX1yBwW3o+ZAIfUrDJex+96diwylnoYBbq/INuBoWIaKo3Aj9eytMbEU3pQFF1v3QDB0K0YeBvgZmaiSq55uMIJ0u1X/u4EsUcfIOgv+SpfuXH01NcwcbfNtOhA3sIpeKwAIAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0BRbTZfcFYlztC1UoZwBV4VBnGguZZdUuiS1uG80+g=;
 b=L8PNkhkQxdZIkU/LDwhknm/0RJmTtP8jA6JieahVBVJss9Vgo72EK7QmyOW3ev1xFvNCY4SJiBG3+lt9OBhAenXeevM7sumPiphD5C0VC1ZxGqc3mDKT/NNRoj1aE1JqlMtQ2p3eOPtXzqoRRtJjEFkv3R3LQcEYqfH/DsE8KIg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by BN7PR12MB2676.namprd12.prod.outlook.com (2603:10b6:408:2d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Tue, 2 Aug
 2022 16:57:25 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43%7]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 16:57:25 +0000
Message-ID: <8a3f1d72-5995-5db3-e550-8c532024c304@amd.com>
Date: Tue, 2 Aug 2022 12:57:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] drm/amd/display: Fix 'no previous prototype' compiler
 warns in amdgpu_dm_plane.c
Content-Language: en-US
To: Imre Deak <imre.deak@intel.com>, dri-devel@lists.freedesktop.org
References: <20220801135259.3039679-1-imre.deak@intel.com>
 <20220801135259.3039679-2-imre.deak@intel.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220801135259.3039679-2-imre.deak@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR13CA0031.namprd13.prod.outlook.com
 (2603:10b6:208:160::44) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c878386-13f2-4ec5-1b30-08da74a81337
X-MS-TrafficTypeDiagnostic: BN7PR12MB2676:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XhmKZv41vCxwUmsqkMzf4jewoBt0gUtZJoPUhCVYp/NjbtP6e+ia+mTkML2vAeRgICxOoQcpu8snIYDTDDm4RSK94kKPd8eHB6R/WrOM5spUgvAmJiPJ/0xk3UphrQJ9ghw0Y0xCSe6rSFwUx+V+zwHnae3GqOjoIMENy/UP4CZXWuyWVxGSxkccTkjqZgQf3qJ5vJsjtyONJjeITVvEZ+Ovy95niVFBdrzQC/z7fFdPk0Dr+6X0hQqPvZgkB+T0uQZdBM5XIyZ03/4+7AZvJSE33ZY0y1IZ1SK+QbyOWw51k6ohTW2xve+rDzAw9CT/v5i7RsLM5iqR3MbzTGi2/OZI9cod6qCcE+f/+S2w0+/fNzfjo96MIWfQe5CVnzg7pQ4cNOUh0ost5vE0rru9XiFt3IuQWkFu4kbd0J3Uc5QqTzoW2iJDaWNWS2Gn71WaD2ihM/LptAA89l54482zVEfdgWHR9ifg0kDJDTlnjCoI5afig1LAdA7vP/7JculxiWpb3cTbW9k/Lwk4i6lxqfOoCWj1VbZZ/s9SsBWeOl9yRE/LC0iUkg0z4eEhiZOeGDM6cQCheH/5PceN/evPcU89XbSOBZOwu7xdde/GNvylfZq+IPECdOJWKyLXOxcsMJH8ET6hLU+nFTzcFAyNqa+K04TSRHGg86piYuOgJkzXX3VpXfMW73DOrbRwdz/h9OIE/bxCgvyKMzH51TUgsEzMb36h9AbjFPx/VzQYHReensa9A9lHRjDPb4NsmEii2fVGQ5kuD3U9lvJDzidsX0vgjVhlPmNm3yRbB1EOmYhga7T02pMYriN6rRGAXVIH5x24/GZPIjQtQAssHGsQnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(316002)(83380400001)(54906003)(41300700001)(38100700002)(26005)(2906002)(8936002)(2616005)(66476007)(66556008)(4326008)(31696002)(6512007)(8676002)(86362001)(36756003)(53546011)(186003)(6486002)(6506007)(5660300002)(31686004)(66946007)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW9zdHJwTFo3aUhTQ3VsY2V0NTNVZEpIN1lxUXc1eTAyd0VUT3cyZVMrWnE1?=
 =?utf-8?B?Nys5OHZUTEhWYlVublR4OXBwU09NWDhJeWliM09VYXN5WHN3RXBwV1RIMkVL?=
 =?utf-8?B?WmhsTTF2Tjl0azdXVFI3bExSdnQ3dkZBblNzWStZc25URDRIMG12S1UzT2hX?=
 =?utf-8?B?d0k0RHp0Q1VCMnh5SlVvczdyWUt2Vk9RSXVvQ1VsRzdHZDZMYlE0UkdVNlRR?=
 =?utf-8?B?c1JWdU5HaVExdW44OStDcGhmK2YrOUlEL0h5dnJySDIzOXlKd2srNlZZYnRQ?=
 =?utf-8?B?aWNMRTRpSTc2VTZBQk8yL3hKLzI0R1hmb2t1OWUwSllDcDRjdmdxekxkSm5k?=
 =?utf-8?B?YTd0eEYweEJSZlBFYXkyQTJORWdreHNyWHdFcDF3UUtqZC95cGVLYUhWN1NQ?=
 =?utf-8?B?T1FOS3dweXZZQ29vanZ5bUlBekh6Nm8wYXRveU11dlBwcmIzZ2dJMHgvbTY1?=
 =?utf-8?B?cHhuU2RVVlFOMmRvWitYQmJnOWFzMFYwN08xMjhxeFZZVXlUcnM5blpKbC9O?=
 =?utf-8?B?bTZzeHI4Y0pHajRnSkdwaWllbzFsaVplRHNwQURuTnh6NTllZlVhc2huRlhW?=
 =?utf-8?B?T3pnbXpCdkYwTk4xbWR5Y1ZlWC9lbGNnYzE4MW43Rk5ZM2Z3T2dwTEhNRDR5?=
 =?utf-8?B?VGpQV0hCZWY1SkxWMDVBQ1V0b05JMUVkOWF2cTVsWXpCcEhVeTdFZzd0amMw?=
 =?utf-8?B?YUtjS2dVd1M2Qk03Y2FLMjhoaExScDZHM0xjY0JBNjdRNmFWK0NoL0lkZVpJ?=
 =?utf-8?B?R3N2dzVtVDJKMzhZRjd2a0l6RmUrcEdkdjRoRjcxb0krZUxaTHdpVE5SeFVv?=
 =?utf-8?B?T3p2OXNwZlhlN3pzM2pzeC80SEJvTS9FeHJMRjlRWVlrS2VHaTViRHAwUURC?=
 =?utf-8?B?eVdsRks3SFR5ZmxhQVB4Q2lEaGlaNkRPM1BQYUN1YkxoeS81K1FmUzZrWkhM?=
 =?utf-8?B?Qi92QVFMQWZNYnJMaWNOdktUbEF3Wkd5K2pnejE0R1ViU1QzcElvdHJKWkJM?=
 =?utf-8?B?TUxhc1pMZDc1ZlBTVjd2MmtiQ0lBZTVsVDNuQXZhLyswejBkaXovRDhQODdH?=
 =?utf-8?B?ZFN4dGFFdjhjQkJJeS8vVmc0a0dEcmxBcUdQeTZUUjZEZ3lmdW5RdW1DVWhJ?=
 =?utf-8?B?VFpFZW1QT2pSVkhIQ1h0QWQrbmtSRlN0Y21nYUZKelVBZXo5NzFFQXBJdDc2?=
 =?utf-8?B?bkRXYlNYWFZ2cTBtOC9NQzZSdEJkVXRqVmpENmMxeEFSNkhsakd5aG1JS3FI?=
 =?utf-8?B?YUlzcTdpZUxFbWZ0eGtXQ0t4VmpXVzNMbEZEd0Qwa0lEOHFJcHpHbkpySlQy?=
 =?utf-8?B?d0RXZjZJK3JJM1JyZW1HY2h3a0IzVktkaVllUTNndWRjc2ptblRJaEZEUXJI?=
 =?utf-8?B?WmQzaUtjcWVrNEUrbUh0Tmw3SHgzMHVOVU5LNVh2RS9QR2tub0lqWjFYeFdp?=
 =?utf-8?B?MTJVYW4zNm1GUG9xdm1IZmZ6eGdFdWpiSGx1TDFndjBxSGUrSG5qWGtkM04v?=
 =?utf-8?B?WlAvbUxCaWVVUmxOVTZCWWUrVTRrcEdvQ0plSEI3dWpxazNHbjBWUUF2Q1Zs?=
 =?utf-8?B?SVI5L3BLT1pRUC9Ja3lNMEtJTWc4bHdySmR6UVBOeXgvVlNKbmpUYjg4YzNV?=
 =?utf-8?B?Y1U4bGNtaW5kS1FNRzF4MkVmQ2JKN1o0MHNFMVJUZmJHWjJFazZ6N0dwdUxK?=
 =?utf-8?B?U29RTm5BaGFlNGZGNk56RkxIV0VEYXlObjlsWXlTbUg3OTh6SUplQkpkdDBJ?=
 =?utf-8?B?VGlsUDREd3dnK3pMYmhKTlJvT01YU1lQMldLWmxYVUlZdURpT3FmbFZmTUhw?=
 =?utf-8?B?UFoxcSt6N1FIdXpyakRoWTY2NW93SUpvVHlNYzdFTi9pZkt5ZXR0cytmam0r?=
 =?utf-8?B?aWhMOGcwMnptNFplY0plN2RWYVBBaTRXZmpiRU05a1AvaWJIS3dqK2pWbHVj?=
 =?utf-8?B?M2RKeCtPaTk1ZEErcWxLdkNGMmd4UjhwSm56YmJlVVlKc1I3cm15SHd5QVVG?=
 =?utf-8?B?OUNCdGdrTkR6ODJYSndGVXRxT01xN1R4WHVYaDl0VGFoc2hqa3pFTEJoSXho?=
 =?utf-8?B?OTg3dkEzNHZCczlJejM4bnVWbVdCdzI5YzJCSWtzV0dSNUtxR3pRNmtDcWRC?=
 =?utf-8?Q?Z498qPUx90hqsY0AvzFzGbuxu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c878386-13f2-4ec5-1b30-08da74a81337
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 16:57:25.3302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INDWhDld4DfgbXPpaXKFztaEzwA8WTZkQA6nfLAgub1DySiEFJYo4VWcAQ0MS4W5WeduIcd2xG2LuCoX4/iEjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2676
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-08-01 09:52, Imre Deak wrote:
> Fix compiler warnings like the following triggered by
> '-Wmissing-prototypes':
> 
>    CC [M]  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.o
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:83:31: warning: no previous prototype for â€˜amd_get_format_infoâ€™ [-Wmissing-prototypes]

I see "â€˜" around "amd_get_format_info"; I'm not sure if my email 
client adds that or if there is something wrong in the commit message.

With the commit message change:

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

>   const struct drm_format_info *amd_get_format_info(const struct drm_mode_fb_cmd2 *cmd)
> 
> Fixes: 5d945cbcd4b1 ("drm/amd/display: Create a file dedicated to planes")
> Cc: Harry Wentland <Harry.Wentland@amd.com>
> Cc: Alan Liu <HaoPing.Liu@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 5eb5d31e591de..da3b086b0d6ef 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -33,6 +33,7 @@
>   #include "amdgpu.h"
>   #include "dal_asic_id.h"
>   #include "amdgpu_display.h"
> +#include "amdgpu_dm_plane.h"
>   #include "amdgpu_dm_trace.h"
>   #include "gc/gc_11_0_0_offset.h"
>   #include "gc/gc_11_0_0_sh_mask.h"

