Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D63257D9D7A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 17:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AB310E9FE;
	Fri, 27 Oct 2023 15:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB04310E9FE;
 Fri, 27 Oct 2023 15:53:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d36HbnY+sPuLrLpVv76XTTmiZi2JjQw5POrUY5areB6KLAdvlv2UVA9jYkqpsuAfaonIZn2Y+SMw5HEX8dYB94HfFdrMxeGnqlHsfCCwGTowFxwvB7CRGmvE6O2dwCQpX6uApqhBFSYjxeg6XDFoi1bMoqN4m/x3fq6orj88WoItHJyeAI8K0QJtH0czrFDTkOTU+yAG2sTTJ9QjiRrwX1PrRFWOWVSpaFegjAD8mUvToNgHKbdeFND8YtaVhBEMctXQF1GNRlLsp+C6Xd3GwpkTS/tjkMpGMx4pbj7sJVYesWyccynIqYci/P9e4CU7bMbuLALR2lXo7Ptl+pUmWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xe9y36EMchrLIO7EjAnnYx9jChVoNl2rx54CyN+QAW0=;
 b=WI4fN6/WU5QiIV6txJliA5CNRU1H8wsXgkc0FcVxceTJEsKVpGUxqbw7G7a/KEaOQc+eARluHW9xSO2meyOuBbGA5e+YVsET9nPir8fwTzT97yoMCwZT32z6YeAkhYTjGYZ8ZUaoEji2trdpY6IDMXNsrYqJK9yGcNY8cd1ik2a9Ho4oSxKyitOCFtyNY2qNXXPQ/oT/b9SHNpkbQPU7F09jZ63hpA9ewBZCUl2Xa65sKrKOm4rtr08LtxrUpSteiIi/Ki13YmdRd5FGx3ddIIN6B1+gEs+QF412yUjUN7YpZo/AIw3J+MIhqjHU0LNDJMzN6YTFn7JCZcOSFYC8Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xe9y36EMchrLIO7EjAnnYx9jChVoNl2rx54CyN+QAW0=;
 b=xJZlYcmTd5OAZwphXVHUb2lIjUzPD9sXxe9DynAQibYtmLbmZ1I76C2IFF/DdzvRogXMidl4s8DnQqaRfqIqaEcmsLeC/Cejg/5NALEwFkgfKIwFcJhqnIlWYgegqDN0j5t/P0IeC/gRg2YkpTKQEzbLdf9UqFgQXmfAd0/f4Ao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.22; Fri, 27 Oct 2023 15:53:10 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466%7]) with mapi id 15.20.6933.024; Fri, 27 Oct 2023
 15:53:10 +0000
Message-ID: <dc2242cd-6522-4073-b376-edc2a9abc3d9@amd.com>
Date: Fri, 27 Oct 2023 11:53:06 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Fixes uninitialized variable usage in
 amdgpu_dm_setup_replay
Content-Language: en-US
To: Yuran Pereira <yuran.pereira@hotmail.com>, airlied@gmail.com
References: <DB3PR10MB683590457246A6625BAA6102E8DDA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <DB3PR10MB683590457246A6625BAA6102E8DDA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0284.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::23) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DM4PR12MB5040:EE_
X-MS-Office365-Filtering-Correlation-Id: 07cd3b2c-68d2-4a22-a274-08dbd704d1f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0u4vtD6QYLlM5btVjMeie0hD9gIlu8T5YLCYJ6J6t2e1qeFNAq7EjjtB42oC7kyM3GhTGz2ppNQnIuBFT3zhxyzInD/0K6xNEjgUJELQE2tuuJnivREsZTfnNEHKWXOP3QPV7+Su9OUGBPUr0C3SWNLsEShjrXL0yg4s+9MaJkoQuzNjiyHVzhpvM7/TmI2NjgvsBHWILBHif4itFkhBdS/v0Gw9o374dUyOD8H4aGOpYTMSHmfAOSgDGV53TenYhaksbGiaryoCuItdog7i01shsBhL7+4XxRAFnGAdamA8dXf5demCPgsEigFMI9BMB3Fi228ScGe0JwKb63SjhPKw499H7pQT7urZ6JI9k0q/cEvNAbX88kwuALtzY6HEwCv7EubJkVvOzzMii25lehnuOd8y/PemHojqEHwSSnxYRE5OFbYRKYrdiVjhOwU8tVfGVh/KxL423os+pI5rvKmFA5hRQgZZDtcG85ROF1tHvcqCli82JynemagrF+5RzU0Xm2qz0M1oMrfYXsOxOYH2yNZq5J8FZCnDnF3O4j2d52h0mI4SwhqLQHkLNWftABf6uazFvEyQXyjcu/CP6cRZicLUNF6bf0ZvwDop1NNJqBIfUqPSbmflhIibDGeIt83rMjvFHO/G4DPzGYKdYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(36756003)(44832011)(41300700001)(4326008)(5660300002)(86362001)(2906002)(8676002)(31696002)(38100700002)(478600001)(6486002)(31686004)(6512007)(2616005)(316002)(6666004)(45080400002)(53546011)(66476007)(26005)(8936002)(66556008)(6506007)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlkxN24wQkg1b1NBYmpBdG13VDMzVTlsc0RNUldKY0lPUWd1YkFLbFdDWjZx?=
 =?utf-8?B?c3R1ZE1Vci8ySjlwRmtJUk5sb2s1OWdUS3lRUkNvaDc3b01LWGlwM3BWZWxz?=
 =?utf-8?B?dEpBQTdUOU5lRnBUL0IzOFcxQlhqMmNMUDBKTFZqeTFtUE55aitRd1JXQnlE?=
 =?utf-8?B?OHhlTXV0S0EyNGJ4dHFmYXVHU0N6a21LK3pNUFgrTkJ1VlBkT292VDhWUXhC?=
 =?utf-8?B?WnZpdWpId0pVOENuODdxSlorKy93QzhWdGthREVnbkxkVEVNTjRaY0JxMTFG?=
 =?utf-8?B?ckxvaTNTUXBDeTAyWlM0U0ZtK3NIa1RDa2tCdTRBdkhzcklaTHRENTdIaWJE?=
 =?utf-8?B?RmlsamdDd21YSXR1K3Y2ZVdiajZVWkdjK1RzRHlReUNaWkhSRnViUUF6aGdi?=
 =?utf-8?B?VEYyV1JBT3FkZzhKSnNZSzd5QzFkSDVOcEg1RythR3FLeDVlYndoNFNUNURz?=
 =?utf-8?B?RFBtYyt3ZmY0Q3ZIMHJFdERlUnBhcGxlZjRFRitVdzc4RVg3MWErWkNiV2dN?=
 =?utf-8?B?aU1zaWMzKzU4YTUrT3ZIRDQrczBkQ0tYRVczZUJTbGpIOGFlR2RXMWVSYVF6?=
 =?utf-8?B?YXRVWXVGUEREWDdRS2laQTZPMWo3eGpRV0owdkdwRVFPYU9kQ2QxdVBablNG?=
 =?utf-8?B?QVVYd3NjSTBXUTJnSVJSYjM4ZndnNm9xZEN2NmtYVnRQT2piTkpJMmYybEI3?=
 =?utf-8?B?dVBya2RQRjZuMkEzd0ZuY3pJWktxWDArR01uaGtNWnFVV2JZOGtwSi9pTUYr?=
 =?utf-8?B?c0doMFN1b2FINkt0MnJwRVhmUE44SEdNZEFOM1prNnVDUGxkNXI0TGlOYzJP?=
 =?utf-8?B?d3RaWHhCYTN0UDhnVW1aUUQwU1ZlTjFoUWd1Q244bWpnUWhMcHBab3dNYWRy?=
 =?utf-8?B?aitVUXh3RCsxOHJPcmVPMUc2TGRoMnVuTnJFRlJUcE04MzJTcVdRd3VDVURT?=
 =?utf-8?B?MlhsZEVRa04zZHM5UGczRjNFQW85UjNxZ1NrZFY0MFB0UHozU0JBVlgwT2I1?=
 =?utf-8?B?dlpsVG1KZ2dSS2UzZU9MYVY5dkFnbCtlTTVGSUZiM1UxOWhWWmNnSGFTQWV6?=
 =?utf-8?B?bHdYSmEzNVBmc3JWcjkyOXRjcEx1azVYSHhwNHVPMElRbWw5L0JUdjcydTYz?=
 =?utf-8?B?ZzNNOW5oOG5yOHA1TVp5MTlZOFc4M3lKdHpuVThrZ1hiWVZnZXl0MnlmWldy?=
 =?utf-8?B?dmtGbWx4clVSVlpBRDVjY0xPeUdOS3JvYSs0MEZGMHVjSG5wQXBnZHBKUllI?=
 =?utf-8?B?cWdTQ2pvbnJ0QkZuZC9mRmRjbHU3Q0grRjU2ZU1DYTdFZjc5WmExQmZkQUNV?=
 =?utf-8?B?bWhaOGU2R3ZMajZzZk5GVXNDVkdXN2VJeUxlYzFsajNNVnlMcGUzcWRWUW83?=
 =?utf-8?B?c1FHRjVJcnB2TkNvd3lwd3IzUTYzbTBkd1NCYStWVFZjVXFNWUJicDBNZmd0?=
 =?utf-8?B?dGU3OEp3ZTZhbllGZEJvb2NRb1VMbDBRaCtKVFhvdEdicnk0ZytlZmtaY3pq?=
 =?utf-8?B?WTRoS1cwZDhQZkdnMjN5bytMZzJMb2JLS3ZUdjBteWR1NGdHTnA2QXRwdUNU?=
 =?utf-8?B?NDA3OXl2V25BT0pQeTNTQ2lWNFlIeGpmU1BIZHVJNmNJOHdHZHpmOFpCY0hU?=
 =?utf-8?B?MDZnZ3hhOFg0VFFEdTZtREthY3FjeTR3eWQvSG8wbEtZSVpteFZYaU1qNHNw?=
 =?utf-8?B?cDNDT3BFSVNpSmVtaVEwR2QydHAxMnpWZU9aYzljMlE5NmJnQkw5ZUg0eE9Z?=
 =?utf-8?B?QXBpbDM0Z1R6YW9YcEM5VDl0MkZPaTJ0UGNST1lQcjJVL2lHaWsxcDQ1RkJ1?=
 =?utf-8?B?Skxrbis5Zno4VWNpVmlLZGlPcHZvbm1kZkFlVVZqNHhGZ1FiYTh1a25jY0NV?=
 =?utf-8?B?Tkw1OG43azFTdVl5Z24zYU9kM3A2MDJjc1Npa2MreGhxakFCRDluVlZKUnJG?=
 =?utf-8?B?WXN5YXloK0JMd3JlMkpGVVZXbzhYTENjVEZKYS9uVDRoUFl1STNaRVJ6SHMz?=
 =?utf-8?B?QmhNMEJPMllpWk5MQnRyK2g0SDh6THlKSDBJREhIeXBHb1hZS1JvelpCakg0?=
 =?utf-8?B?dG1TbXJEZlhGcllDVzh5UjJ3NTMyR281ZlR3SndpZnJBUHdOb1pYeUJJM0Z6?=
 =?utf-8?Q?mlwORh1f5ExlIlH5Ozmm8/4c5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07cd3b2c-68d2-4a22-a274-08dbd704d1f1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 15:53:10.6879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EINl7dFwgDZgGX+O9NlyKObMjv6klMHP+Am758dw9lcWbNS7UtiGN29DZCXauwmv4yF2SnzOBN7HXm6+gDzH0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5040
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
Cc: sunpeng.li@amd.com, linux-kernel-mentees@lists.linuxfoundation.org,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, Bhawanpreet.Lakha@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/26/23 17:25, Yuran Pereira wrote:
> Since `pr_config` is not initialized after its declaration, the
> following operations with `replay_enable_option` may be performed
> when `replay_enable_option` is holding junk values which could
> possibly lead to undefined behaviour
> 
> ```
>      ...
>      pr_config.replay_enable_option |= pr_enable_option_static_screen;
>      ...
> 
>      if (!pr_config.replay_timing_sync_supported)
>          pr_config.replay_enable_option &= ~pr_enable_option_general_ui;
>      ...
> ```
> 
> This patch initializes `pr_config` after its declaration to ensure that
> it doesn't contain junk data, and prevent any undefined behaviour
> 
> Addresses-Coverity-ID: 1544428 ("Uninitialized scalar variable")
> Fixes: dede1fea4460 ("drm/amd/display: Add Freesync Panel DM code")
> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
> index 32d3086c4cb7..40526507f50b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
> @@ -23,6 +23,7 @@
>    *
>    */
>   
> +#include <linux/string.h>
>   #include "amdgpu_dm_replay.h"
>   #include "dc.h"
>   #include "dm_helpers.h"
> @@ -74,6 +75,8 @@ bool amdgpu_dm_setup_replay(struct dc_link *link, struct amdgpu_dm_connector *ac
>   	struct replay_config pr_config;

I would prefer setting pr_config = {0};

>   	union replay_debug_flags *debug_flags = NULL;
>   
> +	memset(&pr_config, 0, sizeof(pr_config));
> +
>   	// For eDP, if Replay is supported, return true to skip checks
>   	if (link->replay_settings.config.replay_supported)
>   		return true;
-- 
Hamza

