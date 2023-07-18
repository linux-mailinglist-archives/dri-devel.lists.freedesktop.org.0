Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E648D757CCD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 15:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5974310E33F;
	Tue, 18 Jul 2023 13:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7689210E027;
 Tue, 18 Jul 2023 13:08:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ku8MTd0x931sVqtgsjTr8x85h6hsFEiKA6nfeJ0W5yqTadYPkZg4MfkuMcjo8GPLxqKeFu3Ygyg2xZiVdW1HsHyvpBxaq6yYvo31RK/8bSlEuueKsx7oEPJQMm5pLOz53Z2dbfpReH6Vd+szihMo3b9gfeZdRJuskPBDxgJoMIQiPR1xXHf71A8MzscumWIff+ppVgakkbbZfGCLgs3du2mGZqg/iVfM14TRwUUPZR4ZCvFq1ZqeAxEQZ7JecedB70jT4f6xFj+dNJpAUMboxtniz4qHcNy2vgRelkbmBqIjiYV6m+ViowsLwj0OoiRcNqwR4iffvOCPfTt8IwB0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gdXKpSR6fubCfQVsbeS8DOAaY+QBR6+MaqXBN0lZwE=;
 b=Jh1aGDKwlzrBWRSlecKbl7rlXUW0c2wqvd7SSHh424HwjUqwCeKuhYdvHkyHLJ7LvD6uZVdmbXWKZwK9mASx+64dxYDUwoVGFADmkw8+DsHlX3izhI/G275eXvNmPNtYfyQJnk1bMug/z1+Gn9pW9JI5P5e2E68vaMtSlOt8V7yBzepi8rNIBgEZ4IoQUQdtN4i5xQoTJr9sNVtWrgveAN1kBsK7+cUMuudLHrrWABbT4TZtGQSEuglordu4XDBG0dqxoVJjQq55v5N31pI1858XyMj9DJs7uuVaoR3WS1gmErLRkSAjdL/bLGoCkFY12uh9jnmX/NtEf45s4wfWOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gdXKpSR6fubCfQVsbeS8DOAaY+QBR6+MaqXBN0lZwE=;
 b=ppxsdT3XCC0e4NnHy+tXw5ubwLrwmFxjOlXlrYEnqmpObsLrpYorOngExxH82npqvLahNsH1Q8/t+/eoutCzC4AvhBSIYJj5xThuC6hmJuoO+IJLfFeA+8+b8qLiXy29qtqjlJGXU9Vf3/9BPvphw0s3MwQWxZGs/Bxf2Ywe9mE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5399.namprd12.prod.outlook.com (2603:10b6:8:34::5) by
 LV3PR12MB9094.namprd12.prod.outlook.com (2603:10b6:408:19e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 13:08:14 +0000
Received: from DM8PR12MB5399.namprd12.prod.outlook.com
 ([fe80::4aa7:3431:dc3:4388]) by DM8PR12MB5399.namprd12.prod.outlook.com
 ([fe80::4aa7:3431:dc3:4388%6]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 13:08:14 +0000
Message-ID: <ad80a9fa-f38b-b954-6687-bbe555c7d750@amd.com>
Date: Tue, 18 Jul 2023 09:08:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/amdgpu: allow secure submission on VCN4 ring
To: sguttula <Suresh.Guttula@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230717172708.4044221-1-Suresh.Guttula@amd.com>
Content-Language: en-US
From: Leo Liu <leo.liu@amd.com>
In-Reply-To: <20230717172708.4044221-1-Suresh.Guttula@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0144.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::10) To DM8PR12MB5399.namprd12.prod.outlook.com
 (2603:10b6:8:34::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5399:EE_|LV3PR12MB9094:EE_
X-MS-Office365-Filtering-Correlation-Id: 470c0631-1070-4ae8-281e-08db87900b5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0JFv7n9OxDiR5awX19avrOwBn4LZe9OeycjDNyFg+sv5jB5nY/lA6RnZCfVYsh+s4wOBTjunzGPislL3PwG42vnK7FytjlA/j3lIP/C3UFxcUGZW1Ia0iFi1QQmAxjlPWbpCv2GUTY75HTDutMbVx22MU+IOJA+a87MAXTDMSI/yfQ+0uhFzPSj3d83+lCIR/m+2c390FtuaT6dBVNV7+JRF27rOsFFzler5XA9RpYxM2iqkJM5fYpeuzuDl6T8/J8edwEaacMchSB8y4qvHABA8yBVic4OUTuLsqH47X44bDdaGBys7b4m79x+Pth2mHhb0UQAsbbWrUxJg81YLiyJ1OGG2MzNOBm8LplfL/gxjCdGDcMnyR6sZj3SavYDjPOTPd2P4dP6JyCQwF9xgGNf7Ebxmupv4YS+cCasjglGiXXNyXWYfcQg2B86FCoc6Pd9bvSyJHkPXCqDyqocZutf+ZG/U7UnNMQcI/iBWM9nw5PWKEsMtrQn495e5AhzKmw5XdEbAHekZwg9eVZoy5o29APXS+/JGg1tUT7cEw+AusC6uiJTJvFZMVJfzhI79mkEqpMdAIy4jCWMPDIkoH9+I7FreDQyyuTiuC+wx31+iOyiUkMmqbkyCRzTkTZVxfntBbX3m+gcqxFv4pIc6Qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5399.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(451199021)(6512007)(6666004)(83380400001)(6486002)(36756003)(186003)(2616005)(26005)(6506007)(53546011)(66476007)(66946007)(66556008)(4326008)(6636002)(450100002)(44832011)(110136005)(38100700002)(31696002)(41300700001)(86362001)(316002)(5660300002)(31686004)(8676002)(8936002)(478600001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UktKZU9rdG5ueHRuQ2F2YmtHUzFKRjk1Mk1saStGMnltdVhObGxZN3o4RFMv?=
 =?utf-8?B?c3lZbnNycWpURU5rNUpVemg2NjArVk9jWU5lUTRhazl4V0VReit2cUNMMUFW?=
 =?utf-8?B?VzdLcjF1M0IwNTM3ZDg4c0xaNDdZVUoyRVpHbHkzS0prZ0M1ZXBpNTlMQkV3?=
 =?utf-8?B?SzI1WTlhY3lRenVlS041U2V1TGJ3Uks4cElibEloNDgvdk9LWkUyK2h2NmIv?=
 =?utf-8?B?bzBJM2l1Y2J5WjBKQjZndW9NTW0xRVl0Ulk3MHBuZzNKUG9zREpvTGF2cTFZ?=
 =?utf-8?B?eTRweWZIMCtiZVRvd21CeXhPb0tvMlM4NDY0TjFhVFBmR3dYNUlYNmZyUytE?=
 =?utf-8?B?RzRvUkJ0K3NLcmJuNXozUnZROExtVnFnd0NxTWtaWStGWXkrenlyb0JISUxu?=
 =?utf-8?B?N1Juc1lyZ2wrZkFZeW13MkFDYkJldmdqMjdVOGhScW13c25jM01wLyt1ZVN5?=
 =?utf-8?B?SkxCZnk4a2lxUXRIU1EwSVFHSFhNaDcwOG9ZemtmRnVCb3RSNG13RlZNancy?=
 =?utf-8?B?eEx6YlcyV1o3TTVYSmErNHZrR2RFSDBuQkRPWUh6L0tHSENPMjA2cDd5UDhG?=
 =?utf-8?B?V0VoL0xKOUVpR3R5ZDZqWm5sVi9nWGVaRUFCSW1RZFdpZTlNQzFkQjJBQ3Q5?=
 =?utf-8?B?Y2lxcXcvWWNNeVgzcTJMMG81VVJvQWFsUjhlY1BRREFSbHd2U3ZNVDV0VG1Y?=
 =?utf-8?B?SVJBdHoyK2cxUnFuOTlORENNTWUzZVJwYnNzdlZnemVFOVY3bnFPdGlMU2wy?=
 =?utf-8?B?cW5jTE45bW9HQmIwbklUK3ptRWYxZmhTSTBDRXBGTVZCNWR0U2RaWXdyRW42?=
 =?utf-8?B?SlRZMUZqc0xmTHg5MDJEcDA0OTYzRk9aSzloaU81bEIyNE5SK3Q3VWt2TjVW?=
 =?utf-8?B?bWc4cHZadVM2aWU3R3hkQ2lWRmtxNjdUWG1xNXM1ZTBsMHkzWVNUckNRM2hF?=
 =?utf-8?B?VHQwSUQxVGpyNmpUK2Z0bTdWQzBreG1mTEV6NE1YekQ5WWdmaFMwSFdJdEJT?=
 =?utf-8?B?dVdMcHlwaFVyV0lyd2tIeGF6bWZ1NGVnL1daWlBTcHBSZER4bFdVWW1vNmFP?=
 =?utf-8?B?TC8yUElDMHFVVjhENEhrWjdtTk5hM1Q1aVNIY0FDeUZXRWdWSGNURW03M3ls?=
 =?utf-8?B?QVE2aG1RNDRlOE5vczNlM1RKK09jR3h4NktKRHBPTXllRUZYQWlXSTNHZ0p6?=
 =?utf-8?B?UzFJQzZXR2hWL2hXaC9FV3c4bTRvWXg4ck92ZXI0M0ZMbjk5dnVLYStoVGRy?=
 =?utf-8?B?ZnJNdHYyZWJmc3JmUnc0VGh1MDBrcVpPWnZENnZpZ3M4eWZqM0FRRlVvWnZi?=
 =?utf-8?B?Ni9SdmFEN0tMQTdDbXNhV1hqOTVmWXJ4T0RNSUJubmpseTVlZmVzV3dLSjJx?=
 =?utf-8?B?VW1TZ3VjUDkzcTZDd2hpbGQyblN1ckd5emd2YTQzOHZVQUk2dkw3VDRGaG5r?=
 =?utf-8?B?b1E1SmRVcy91dmh2OVhPSVgweHNraVRoeEo2RGdCMU5Qb3U2UHVjM3g1RXNR?=
 =?utf-8?B?MnJQdkw1MnFCTjFQeFkwSFE4MzcvR29RN1FTSkJDaWdpWEJoMEl0QjNFc1hS?=
 =?utf-8?B?aHkrVW5lMGw2Z0N4NGUxK1pyTDdaU0pteUZaTHRqd3dId0Q5N3NmZ0tNWTZK?=
 =?utf-8?B?SUdYZEw0WFhDM0hlbFU5bzVaVHdndGVKQVhJUG9YWXQwQzBWUnVKR0dsaUN1?=
 =?utf-8?B?RXh5T3JJRGpGYTZVY2tDdEdlNlRmdVB0ZnNBMXhnaG1mTzZBVUg1NllHUXor?=
 =?utf-8?B?ek5IaUtXdEJkUHYwODIweXFuVUJpdlMvSEJWMWlaaTlNUm4wNnNaWUVhcUF2?=
 =?utf-8?B?KysvS1F2NU5FS3VXT3NybkVWQkUwQk5DSmd3a3l3S25nTVBNckdOY0M4aFRO?=
 =?utf-8?B?NnJqZitUSGhxUnBmQjBNNzBLcHVUUTJnMDRIOXowcVJFdnF6eHgzMG9HS3Mw?=
 =?utf-8?B?M2pLSFpEQ1pCR3FZVmRtTnA1bWtyTUMxLzEvNTlraWhDMEc3U05IS2ZSVk9R?=
 =?utf-8?B?Y29yUXZNMS9GYlZicWZsakFiSHFGdEZKT09jeTY4bTFQVlNVTXIyR3BKU0R6?=
 =?utf-8?B?WDFVWDZid3ZIN3ptWk9hYTk5R2Q3b25nSDY5WW5mNXd3aEhZTWJRMGVkdHhX?=
 =?utf-8?Q?Pl80=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 470c0631-1070-4ae8-281e-08db87900b5c
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 13:08:14.0888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5q2pjP+zvuYSahprcrcEpdK/EN1mapReFxbUW/FLCfrGUOHhYqryZ0/XgtPfDcTJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9094
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Leo Liu <leo.liu@amd.com>

On 2023-07-17 13:27, sguttula wrote:
> This patch will enable secure decode playback on VCN4_0_2
>
> Signed-off-by: sguttula <Suresh.Guttula@amd.com>
>
> ---
> Changes in v2:
> -updated commit message only enabling for VCN402
> -updated the logic as per Leo's feedback
> ---
>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> index e8c02ae10163..d2d89bb711b0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> @@ -1801,7 +1801,7 @@ static int vcn_v4_0_ring_patch_cs_in_place(struct amdgpu_cs_parser *p,
>   	return 0;
>   }
>   
> -static const struct amdgpu_ring_funcs vcn_v4_0_unified_ring_vm_funcs = {
> +static struct amdgpu_ring_funcs vcn_v4_0_unified_ring_vm_funcs = {
>   	.type = AMDGPU_RING_TYPE_VCN_ENC,
>   	.align_mask = 0x3f,
>   	.nop = VCN_ENC_CMD_NO_OP,
> @@ -1846,7 +1846,11 @@ static void vcn_v4_0_set_unified_ring_funcs(struct amdgpu_device *adev)
>   		if (adev->vcn.harvest_config & (1 << i))
>   			continue;
>   
> -		adev->vcn.inst[i].ring_enc[0].funcs = &vcn_v4_0_unified_ring_vm_funcs;
> +		if (adev->ip_versions[VCN_HWIP][0] == IP_VERSION(4, 0, 2))
> +			vcn_v4_0_unified_ring_vm_funcs.secure_submission_supported = true;
> +
> +		adev->vcn.inst[i].ring_enc[0].funcs =
> +		       (const struct amdgpu_ring_funcs *)&vcn_v4_0_unified_ring_vm_funcs;
>   		adev->vcn.inst[i].ring_enc[0].me = i;
>   
>   		DRM_INFO("VCN(%d) encode/decode are enabled in VM mode\n", i);
