Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E616979EE22
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 18:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6967C10E462;
	Wed, 13 Sep 2023 16:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A36410E034;
 Wed, 13 Sep 2023 16:16:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENWoIJeKp9pzIhxpqkfRAZnJO+bdLWZGrsy577IEfbr+kIMABato3aViHhW84hkW1sh+LI+dtJW6GnuU6SqBDJVH22PCZVHX97ekrVL8OnPZBh5n5zu+FawnLotcmwdheFv4DkFwm/5nkDkUSbP/PEIBZwgty912xmeqP6urw9nqWYQGNiWJFDfD1asHUqAriDQYajZ3F8jn/yTfgw+w/JUqHpS169YjBVPWssuf2PUCKx89T9lDdeJyiOdvK/Y9E+VJtQk3f7jkuDaz3XLsZFBrM10wjjGZbHluSUKHjb2nrzCj9IIFoW4qlL890vB0bUiYlELXjDwkz1zHhoZyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCdUBNfLRxINMM+H+QcN+/4cdAJOhJ2njhxlYRI4PbY=;
 b=AWxfr2CKPRUrAm5+jYhjkLi2KL/OQQbQUhytm9h7Uk8YrNnWu6Q/QyndafQ/4C/BYD+1PCqpnpvjBQJ+LtxG8J1mBSQRvF+UC0Z+cUTaXlgaeWQ/BoY8byLNciXSWjZW1IYq88nbgSW3TSj3GB8Br4ULe/0nUWDQyW6utXw2n5KGb/id7resX/VS3YeaCg+5MTHNN1Fzx7YDUl9VPEC18iJVZ3WOelHaHxDYAu866fWCLel6Rjy4+qVa+G8bgqhMDjnEvfoG58EmQu84X7qneb8Dzf3Xmg6Nci5WQh9eUHfCYJUx5A4sp0g8fjMnUJUvrCpca33xsWyThNZu+DHGDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCdUBNfLRxINMM+H+QcN+/4cdAJOhJ2njhxlYRI4PbY=;
 b=rOa72iZNjpd/fo3hg4glEcviReK+OaY3v2IFsWs1nKcja+ePzWInTyz0vtysgx8lHQZJB9I3I/LxBjijv1aBZAFvDYZEqF8Q+2Tnz5jgzFfnx+KdjMOZ8WRbhD7ZyIpx4bi05gdPN5pWutTsMFIaAcoPFzFr8rgdof1Jwfx7A2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DM4PR12MB7646.namprd12.prod.outlook.com (2603:10b6:8:106::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.18; Wed, 13 Sep 2023 16:16:49 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079%3]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 16:16:49 +0000
Message-ID: <b11cce07-7e13-49b5-aed3-88517356281b@amd.com>
Date: Wed, 13 Sep 2023 12:16:45 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Fix -Wuninitialized in
 dm_helpers_dp_mst_send_payload_allocation()
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, Wayne.Lin@amd.com,
 lyude@redhat.com
References: <20230913-fix-wuninitialized-dm_helpers_dp_mst_send_payload_allocation-v1-1-2d1b0a3ef16c@kernel.org>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230913-fix-wuninitialized-dm_helpers_dp_mst_send_payload_allocation-v1-1-2d1b0a3ef16c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::36) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DM4PR12MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: 712723f5-688f-4791-9dbf-08dbb474d534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1imFVYiRnrIdwGedyb49+nnJOPjM5TGCeOx/emI/2f6vJMYn2WoqbAnI1QmAd7uCaUTzF6Y3bxEecAJ1OZ2SPttUeY1mY49NR2B6vZG+Jd+SB8g+/vGRr2Y3g2iTy/mENW78MxD/G47P0g3cKtJX2oSH9A4kso2qvUA/kw3mQ/tZgLrJNMnPRcEerJpHFhMO0StouOq9Gf0PpTUZiBMxiLGskDub3x4E3R3gUV/9ScXzE8QsGT6UUlWZEyvhXM4jmh8Jl1vdU5AhewLky3OwBAYnVZWidzc0KDG4sAZXSNSYR/fhahx/49C/F2PndA0361F1gIogD8b5Ru+EEISLxMisfVvN+3kQACZSf/dRq9iXlLKPaoV4FJ7LeUwG4mGDvitC4qIOzXrUGsu+wMwtktfOKsvJ3DItVZp5zSaBwN8evuAAA4TncyAGLsPgGpUtLSwKzMzkLjxUaO1Ojv32zd5CMU31iMA8A1ehPVnkF6r8Xkvs9WHj/k/molc851tDBLkbQSYgRcsMWg5PL5GuhbxXqYTEcwYYjlytcqrT0Xnpn5hAKEvfT1k3QaE8W8CjYgKJgNYw17kiWgNRWJv86y9mZql4lMAlfp/Lp9v9IA1kPKOgozH88nx7Qx2BIFX7qI6E/VfjCOMIcCeaCXuYSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(346002)(39860400002)(366004)(1800799009)(451199024)(186009)(8676002)(6666004)(44832011)(2906002)(8936002)(478600001)(966005)(66476007)(5660300002)(316002)(4326008)(66556008)(38100700002)(66946007)(2616005)(36756003)(41300700001)(31686004)(26005)(83380400001)(53546011)(6506007)(31696002)(6486002)(86362001)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHRiTVkxYWpySTJnTDB2djRtTUk3ekpNQkdKcTJNU3pBZHpCNisreS91ZTVP?=
 =?utf-8?B?M2kwTUdiVmU0cExJbmRqWm10UHJjeTdadWVodHk4RGdNVitzcDZ0ZFpsMERH?=
 =?utf-8?B?OGdCUGhheHFtVGd4OVZvYmFUbENGUzhtZnlaS3V3K3NleXgvcHZFVGlOcHRF?=
 =?utf-8?B?WTZsaWJ2NlRsblpQNFNwNVBMUFJOaWhBMXRuU2djRERVOFNwK2tVQUp2eEZL?=
 =?utf-8?B?eWdkK1EwMmwwaDBPYno5aXg2Zlc3Yi9NcjlhcHUxVGQ1anA1QXpGRm1DSmo5?=
 =?utf-8?B?OGpsejFRSVJzREl5SDluQXRTNys1dERSd3l2RWRpNjRCM3FFSTl1VHpkaEdM?=
 =?utf-8?B?N001bXQzL0psd3NONnJ3Tk55cHVwWnlsWmFVVlkwWlBqQzJGbnZiR1Racmd4?=
 =?utf-8?B?OEdSY0FJVGt1WlBjZmk0dGU0U3BZN282RGlWUXl3SS9QdzZlS1E0eStrN1Ny?=
 =?utf-8?B?V2RDaHNUNTJBbnlUeWZ4OTRxVU9VclRYVWpVTXZmMzB4czVpekpOTVhLUzlY?=
 =?utf-8?B?dWhxL1BSaGRXYTFPZlRZbjBjc21SUzZkNGcyUjltQTk0ZExMUkJ1ZmtGZk9u?=
 =?utf-8?B?VkxJbnJjZ3VuRUdkMGhIOXRIVGVud3VEYlJZU1kwWEgrVnpPdlM5bGJzU3Jm?=
 =?utf-8?B?bDB5b2dEK01Wa1dvR2VBamlrVXBMMERMaTU3blpGUjA5akVHREdoWnNMT2pz?=
 =?utf-8?B?TjlkZjNRQnZnWEpIQWtTVUthWG5lSzBOb1NyUHZtWG5PZUZpaXBSNTRBV0w0?=
 =?utf-8?B?R280bkNDdktsOHNEL245Znc2enJuOWttRzNJdTFyTTdPVVV6T2lsa2dBWjFx?=
 =?utf-8?B?bXBERFpJWkNZN05uTi9aSTBYb2NaSGR2aUl1U2U4bGdJZjJZSmxSTFpmeGQy?=
 =?utf-8?B?akVhejhPamE5WDVPV2krMGU4MUwzOGpHaWk3eG5nU3JiTHFrcFAwemxQWTJk?=
 =?utf-8?B?bnU0UkFneEp5QmVpM1BFbFJtdlFLd2VmU1dPRWZqaXZzTXBpOEhHU2xFUW5L?=
 =?utf-8?B?Q0NHOGpOU1N5S1NBQ094YXZMejRPRTl0SElnWXRocHAvWXgvZ0FUZGJDSjdj?=
 =?utf-8?B?dHk5M3V4cE1UcE4zWXM3M0lGR3gwM21BMmQ1cTdxaHlJUlIrYnVuQTFnSWk2?=
 =?utf-8?B?dzh0OGM1NUhuU01GRDF4MjBtRGpTZjF2TUVqb1lNdGR6VXNKaEV1eFR5cUE2?=
 =?utf-8?B?QjFWczJsWFpvdjZhUDdUZTEyc0FENGVMVU9uenFFK1FwSVUxbGY1dVVvY1Er?=
 =?utf-8?B?SzhjTWI0K2l0RGlOUGdyUjlzaXphWDZtVnhoNEZ5b2ZKTDF5M2pscTlGU3Vu?=
 =?utf-8?B?SjErTkdteXNHdzd1RTNuZ0phSkIvd1VlU3l3VGovSG5FYlVEL2FOQ2lpcSsz?=
 =?utf-8?B?R3pXaEZOYWc2VGlnWk4xdDd3VFE4TnRMbDJybHVudHptT1FnNWl3U2E5d0Y2?=
 =?utf-8?B?VzVPMm93Q2lESGlLYkxJc1lIUFV5NXl0MGxWandDRGpEYm1QaHRmRG9MN3RN?=
 =?utf-8?B?MmIwcGVlbmt5czlvblkrVDQ2VXkwbi9ZV2dqYVpLbVRvRVdtZHJ5WUhha1RT?=
 =?utf-8?B?OVhaREJpYVE2U3IyN3B5QTdKYWExSGcwR29pNlJkUHRLZ0tRbVNQWUNiVXVK?=
 =?utf-8?B?SW56SFVFU2pIRld0M255TzNtNzRLYVFGV0lJaWk2SnA5a3JmMGZLK3R0K1VE?=
 =?utf-8?B?YUExS2xtMG9Ya1BqRTVFakVzanB2aU1vdzlOYWJuMWZlajFxa1NRS05Xc0Ni?=
 =?utf-8?B?TGFQcEZuS1Q2OU5jbXh1MVk2cWQ1Zy9hNnVtdGY1cURYMW91eTZmMEZYQTBj?=
 =?utf-8?B?UFl0Z3dHOG02UHg3azA5b0xkdnhQSktQeFNGM1RtUlhhRUVLY3hyMWhGT1Vi?=
 =?utf-8?B?UlNac1RKWHBEV1FJdHQ1NHJ3Qkl5bE9qejZiK0xQZXVKeTJmOU9VdXZYT21R?=
 =?utf-8?B?cnNuMW14aUhFZHZvS0dndi9sVXFJamhvZ05JeUJiNVNwKzJSNG8zWmc0ZGJY?=
 =?utf-8?B?UDh2UzkyWmZwNGQ5VHgxeDZCTEhlMmxSRmZWMkdqNGFQcDM0enBDTFZJR3Jt?=
 =?utf-8?B?b0FQWTFzRHFtT05sSmRpM1JreXBnam43RU4rcktyMG8wQU5IZzVrMTJtYXRv?=
 =?utf-8?Q?hn8LdrdtaQk8MleLh7pKHtALh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 712723f5-688f-4791-9dbf-08dbb474d534
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 16:16:49.0897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GN8CXGmEbxR7dLqsc2Arg68VxTgl9Bx0Zh1lG/mgDc2rByljRDnYBJ2f4MJak7Al6tPBOOklOzEg70IeOD1Sbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7646
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
Cc: trix@redhat.com, llvm@lists.linux.dev, ndesaulniers@google.com,
 patches@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/13/23 12:10, Nathan Chancellor wrote:
> When building with clang, there is a warning (or error when
> CONFIG_WERROR is set):
> 
>    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:368:21: error: variable 'old_payload' is uninitialized when used here [-Werror,-Wuninitialized]
>      368 |                                                  new_payload, old_payload);
>          |                                                               ^~~~~~~~~~~
>    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:344:61: note: initialize the variable 'old_payload' to silence this warning
>      344 |         struct drm_dp_mst_atomic_payload *new_payload, *old_payload;
>          |                                                                    ^
>          |                                                                     = NULL
>    1 error generated.
> 
> This variable is not required outside of this function so allocate
> old_payload on the stack and pass it by reference to
> dm_helpers_construct_old_payload(), resolving the warning.
> 
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1931
> Fixes: 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload allocation/removement")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Hm, seems like this was pushed through drm-misc-next and as such our CI
didn't get a chance to test it.


> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 9ad509279b0a..c4c35f6844f4 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -341,7 +341,7 @@ bool dm_helpers_dp_mst_send_payload_allocation(
>   	struct amdgpu_dm_connector *aconnector;
>   	struct drm_dp_mst_topology_state *mst_state;
>   	struct drm_dp_mst_topology_mgr *mst_mgr;
> -	struct drm_dp_mst_atomic_payload *new_payload, *old_payload;
> +	struct drm_dp_mst_atomic_payload *new_payload, old_payload;
>   	enum mst_progress_status set_flag = MST_ALLOCATE_NEW_PAYLOAD;
>   	enum mst_progress_status clr_flag = MST_CLEAR_ALLOCATED_PAYLOAD;
>   	int ret = 0;
> @@ -365,8 +365,8 @@ bool dm_helpers_dp_mst_send_payload_allocation(
>   		ret = drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, new_payload);
>   	} else {
>   		dm_helpers_construct_old_payload(stream->link, mst_state->pbn_div,
> -						 new_payload, old_payload);
> -		drm_dp_remove_payload_part2(mst_mgr, mst_state, old_payload, new_payload);
> +						 new_payload, &old_payload);
> +		drm_dp_remove_payload_part2(mst_mgr, mst_state, &old_payload, new_payload);
>   	}
>   
>   	if (ret) {
> 
> ---
> base-commit: 8569c31545385195bdb0c021124e68336e91c693
> change-id: 20230913-fix-wuninitialized-dm_helpers_dp_mst_send_payload_allocation-c37b33aaad18
> 
> Best regards,
-- 
Hamza

