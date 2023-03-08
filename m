Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B926AFAEC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 01:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D7910E572;
	Wed,  8 Mar 2023 00:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE16210E570;
 Wed,  8 Mar 2023 00:13:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sox9qVrqqK1sLeaSm7NDC8OpgqRr4sg+phWg4HtzosO61ipXJgG4jZrgrzPqeyvCG7RXbPe1NiICqN2ty25blOE6ZvEx93dA0RG3Bs+C0Y+DvmzyIZG9AbwcM9KRZtOjPaLHjaWNk/m8FOKmwbu5B9Zx1z9nNmREQxW1qNcWR18p4kNZ/GPoa3U2/rIrkNNBe8u2ShMhNaAbM/c36nYxBxaoajodEoj7X7GmJBeepoT2cfmoCDtorXIIGQ/SGQGCdfu+wE5G4Rh5kpjiB7vKmT+tqN5f5GKbMHNkiHIJXlbTJM9V/5JvYefwR8+/pvdHBKPl7wr30TSJYwMzyLFEkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6YrmVS2QOkDShH8jSrcaoXpk+qWRl7MkDc71sChL9Y=;
 b=Zl4zKqKmg6HmDs1CZqdn9F0DtF42u9Lx/I5/YeYW5Q9dCMYMq82SH7ZWxUs9ku0AyYIdkRBG+VpIaM1yb7JD1thmByTZdbKDyyJlVIwnO/vrrflcK9MP27+oZDeY5ClmBtp4wsRLeuvfQMUNZJ7ViUxHTLPFN689AsOtp7skyuB102RuWqMTZEZvJRQuWWulhZuqrbMmPiRziGX+xjbeCnCFBVUjVTfP1b4wVoc7tURtBACkiaRQyN8IT35ljcPm/sh4wFV4UDyq7PnMv6C2Zm4XgOeDRPlKZ7rhh/aQed5yQUUu5fEki6GkA1XNW53iWcSDBCOeSzv4W5mEBfjDpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6YrmVS2QOkDShH8jSrcaoXpk+qWRl7MkDc71sChL9Y=;
 b=REfrdwXf9zUZLE7ZYnafvfIpYn6kBKHWKF0d3e43F4XH1A5gNakRrWhOrdpVvG9xIbm/Fzs2117RAhdm8fzP+ye/SYWNmdlboqsD5iVCLjbOFXSD/qw9ebCDYI+N0X3JYKSm69vi2yynOyhx2IyERqTCQIKcCuP5rmCZwTNYaJM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by CH2PR12MB4891.namprd12.prod.outlook.com (2603:10b6:610:36::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 00:13:33 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::699d:42b8:93ed:76da]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::699d:42b8:93ed:76da%3]) with mapi id 15.20.6156.028; Wed, 8 Mar 2023
 00:13:33 +0000
Message-ID: <e4de1a96-d669-1923-8677-026da2dc5585@amd.com>
Date: Tue, 7 Mar 2023 17:13:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/amd/display: remove legacy fields of dc_plane_cap
 struct
Content-Language: en-US
To: David Tadokoro <davidbtadokoro@usp.br>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch
References: <20230307225341.246596-1-davidbtadokoro@usp.br>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20230307225341.246596-1-davidbtadokoro@usp.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0182.namprd13.prod.outlook.com
 (2603:10b6:208:2be::7) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|CH2PR12MB4891:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8989da-35aa-4145-97dc-08db1f69f3c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JVAQ9h1LVcpmygfklKrWaMDmBWHXZOw0ejkkkPQCUBls/EX3Xq3kYKoSNa/uiH0rbiItTKIkCyEc6OgV80HwzMn/4iqiKYwVskXnA13+VYxAhicpuFS3yNDPsaanVgcJ4Uk7HVx8SdloSk3KnVOAbbdGyeKVMD+qdkpQuLdqLDRC/wgYYLbz76Hde8SjDPaH+H4TF67cwuHPFyvTXfpFx9iUkuHU+QmaJIsEexCtCwrhTrGTNNBGAM+4oqFEsbDNTlEaFmdBcIzgGUt+oX74j8SnpICI+SLjFLRC+8jNL/6j0pBm4rVrZ8NlnRqZmUGfy5rH/cjEZPHHMLLJm6W7LaxjYpGMgwKboCr7vTZ6nCew+XRG0IhtK8gLhJOIzdYfuVQZGnKODtKveuEdMgnLL3pUZ+LyV+oGzymOAH6MXKwm+ctZmPcjrI9BQgK0UEGwJcnDhgMaXJcdtArF+BZeWFgkOBG2EgXOrvKwtgEzmPAtvneMjKGH324Ps3Twe7T4C2zm1wcUSwIdZsqIWWgRQC6wVj0iiRpLYg5rUG/AM0i3MubF3dTrEeBvfipuHqPRCfdEKo83+A9qbR+BLHCUPWOSfS2uQF2bEYz+Zo/VMErUOYibPt84uPHcfenifiI+8Gglb1azIBcKboaRzoDJ3rId4R8hMaLqcen7HA/AsiezFoy0q3RaaguNP42X1C1o+hBkx3d8nkHtQO9NRTidqkBKF9bnQmjKfb6i7glniII=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199018)(53546011)(31686004)(86362001)(36756003)(8936002)(66946007)(8676002)(41300700001)(66556008)(5660300002)(66476007)(31696002)(4326008)(478600001)(186003)(6512007)(6666004)(6506007)(2616005)(2906002)(6486002)(316002)(30864003)(38100700002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3VxRS9mQmhDbXNXZVFvNDRib1BNSDkySi9IK2xra21Sb0F6cUl5N2NOT0ls?=
 =?utf-8?B?dFc1ZnF3aE1YTGR4MjFxbUxaT1dTVzdteXlFOHVqMEYrdmVUamJLNUhLSmM5?=
 =?utf-8?B?V2wvU3I4Z0NKY0svaGNQckt6Z3VXNkdYcnNNTjA5NWtBYzJEc3V0L3kxWXNp?=
 =?utf-8?B?MjNFL3V5NTRiNG14Tk5iSklRaWYxNHJub2ROSkhYbExRak0yckpONWducFZq?=
 =?utf-8?B?VWd1d1kra0dRb3RSenVqRVVUYlcrYVIwL28zVVpreGY1MVZnT09pbVE1RDdr?=
 =?utf-8?B?ZHdJRENmdm53di9MMkhpRVZNSUNIZWhlT09DSDIvWDdnVGlGOGpyR3oybThu?=
 =?utf-8?B?Z0ZlZG5zdTRqMVJUaSs0aVNISUw0YWd4M004UkNEMVlHQWZVMGxNZjdRTWJI?=
 =?utf-8?B?Tk5jRWQ3S2o5OW40NVZpUEUyV0kvdFdXVFM2TGV4aWNKUE1mQ1FPRnVmcHFC?=
 =?utf-8?B?SFZZK2lXTmFUaDRvWE9uMHVmTzErekxhalprUEZyMzJ6Z09nTVRFUUErOE54?=
 =?utf-8?B?YnNpblZqNXZyV3orSUxMZ2dsdElOMWN5bXFnWVV4SzBJd3RtbTJlb0JMVThp?=
 =?utf-8?B?eWI5Wi9jUFBmdkprdnAvY1lHbmNFV0VHcWlvdXg1anVzcXc1c290RE54OTdw?=
 =?utf-8?B?SFhUQ0VYSkJKYTRWZmMyb29FL1E4SndoWGlDZmpLRExJN2VKZUJmaENjZ1JH?=
 =?utf-8?B?cTRaR0VGR0lDdUN5L0N3VEI2ZTc5TWtuUVY3RnFjZGdXRDRSNmZwNUFtTytN?=
 =?utf-8?B?UFpXUzdsTGhPTmR1eFRGTjRjL3FhblkzQmN4TVF1eDBGTTREMktXRmJJT0RJ?=
 =?utf-8?B?bjN6S1VtNnowdzJFQjBrK2xLVjFiYTZYR05sTzJhRSswK21BSDhSbnhWcTFh?=
 =?utf-8?B?WUFQMU82UktEN1NIWDRxQlhWckpOdG9WRVpDeSs2ZFNsNktZU0Mrd0hiZU96?=
 =?utf-8?B?emUyV3c4RGhUUWl2dkw0aDd3bDZleENwVFBpblZJK0lQMzEvbG53RHpnZ0Mw?=
 =?utf-8?B?ekI0ZWRxdmJBYkhQcmV5eTZQN3R0ZFMzU0ZMLzNFM2hPV0x0ZVNSL1dMZzV3?=
 =?utf-8?B?U0NkRWQ4emtEWHhzQXZsQ2x2WjlTVVVlN0lpcjRKRTBPVGtuWmIxcVFKVWph?=
 =?utf-8?B?SWR2Ym1EeUtkb3ZvbGZHRWNneVdtaDJFSHFnWVo5YTJTcERBbUU4SWxHV0Zl?=
 =?utf-8?B?Zm9SVm16dlFVRDBhUSsyd1JtTTdOTXhMcEZUVDFON1Qzc2RYa2VBcmx1QzNL?=
 =?utf-8?B?SjI2bk9Bc0VIY1hnMlhacjlKL2lTa1VlWmd6T2ZLQk4zZXZmNExIdTY1T0pG?=
 =?utf-8?B?a3haMkphKzByMm1OTm4wZ1RETVR1eVBIeVRvVHpHbE96R2gyeFQzUml0MG52?=
 =?utf-8?B?MmZaaktTc2g4YUhJT0xZODZ1UW02ZXJVeVNqMmpSSVJtMzNrdVVCWVR6Nktk?=
 =?utf-8?B?dVMyZFlHTU9TU2kvdlF6ZTNpYU9hK3VxZWpkbkFRWnVoVWpKeUd4bDRNUlg1?=
 =?utf-8?B?MkR5TUNMYzJQWjJqdlMvSjdSdlBQUWwwcGhGdXhXVTA3aGlOakU0eEJNQ2Mx?=
 =?utf-8?B?QkV6SzdiZVZ1cGFLRXNYN3Q5RDE5OW4yaTBEdDQ4Z2pMVkp4ckhCZmkrMHNI?=
 =?utf-8?B?d3V0cVlqRDRMTkg3NXRsS3huNmVlcGJiOWY4ZzVTbk0yR1VoUjZTMzM4MS8x?=
 =?utf-8?B?ZUlLRGZMYVdVMzFrZVJCOUZuWEo5TFFHUWVxdWw4bk1mZFZzSW8vV3dQVE56?=
 =?utf-8?B?Q2RGUkNhRTBwWlhKdVY0aEtQOVdheXJzSllldDByRmVxL2Vzc0FsMGFMTFBD?=
 =?utf-8?B?SXAreEhMdk9mcVR1MjR6eTdTUnVBdVlsMGRvOFVJRnMzRXlkRkFKY0VlQXVx?=
 =?utf-8?B?disxUHNzcnhRL2NZMUZkTHBBeXBvS0t1TUl3RU9iWkFSeXdZdlhuM1lpZVFi?=
 =?utf-8?B?MnM3cjZickRGYk9wZi9LMmI0TmhzYm82ak5RUGQ5MS8wTitpOUZhT0dLMnM5?=
 =?utf-8?B?WWtUUkdIWlJWTzVueEgxVkVWVUhyOWUydkxIS0pFQ2dqSWxjSGpJQ0ZKdkdk?=
 =?utf-8?B?OXg4OEFUcjdKeTJZN2pQamhNanZVRXliSFJjZEZBNEJNblJvMTQrRGdMTFl0?=
 =?utf-8?B?Z0hXNHZxQ2JHWUpCblpwbW5TRmhyOW1FOCs0REJPVFRqMnFTWk0ycisvcmpu?=
 =?utf-8?Q?IoE7Idc+WK9E9cltzb8MAWIuRRIi04jhB0RE1ZWb7n8P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8989da-35aa-4145-97dc-08db1f69f3c9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 00:13:32.7971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ILIEwygtXfvITjRURnCXmSRQfF0T+eBgrVgwcL8LzciKex8C5CDmPTxalkYFUVB1O97XGoWZ23yh15yLaeH8Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4891
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/7/23 15:53, David Tadokoro wrote:
> The fields blends_with_above and blends_with_below of struct
> dc_plane_cap (defined in dc/dc.h) are boolean and set to true by
> default. All instances of a dc_plane_cap maintain the default values of
> both. Also, there is only one if statement that checks those fields and
> there would be the same effect if it was deleted (assuming that those
> fields are always going to be true).
> 
> For this reason, considering both fields as legacy ones, this commit
> removes them and the aforementioned if statement.
> 
> Signed-off-by: David Tadokoro <davidbtadokoro@usp.br>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c       | 3 ---
>   drivers/gpu/drm/amd/display/dc/dc.h                     | 2 --
>   drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c | 3 ---
>   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c   | 2 --
>   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c   | 2 --
>   drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c | 2 --
>   drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c   | 2 --
>   drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c   | 2 --
>   drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c | 2 --
>   drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c | 2 --
>   drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c | 2 --
>   drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c   | 2 --
>   drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c | 2 --
>   drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c | 2 --
>   drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c | 2 --
>   drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c   | 2 --
>   drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c | 2 --
>   17 files changed, 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index b472931cb7ca..fdcb375e908a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4354,9 +4354,6 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
>   		if (plane->type != DC_PLANE_TYPE_DCN_UNIVERSAL)
>   			continue;
>   
> -		if (!plane->blends_with_above || !plane->blends_with_below)
> -			continue;
> -
>   		if (!plane->pixel_format_support.argb8888)
>   			continue;
>   
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> index f0a1934ebf8c..ccc27d482640 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -82,8 +82,6 @@ enum det_size {
>   
>   struct dc_plane_cap {
>   	enum dc_plane_type type;
> -	uint32_t blends_with_above : 1;
> -	uint32_t blends_with_below : 1;
>   	uint32_t per_pixel_alpha : 1;
>   	struct {
>   		uint32_t argb8888 : 1;
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> index f808315b2835..a4a45a6ce61e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> @@ -401,8 +401,6 @@ static const struct resource_caps stoney_resource_cap = {
>   
>   static const struct dc_plane_cap plane_cap = {
>   		.type = DC_PLANE_TYPE_DCE_RGB,
> -		.blends_with_below = true,
> -		.blends_with_above = true,
>   		.per_pixel_alpha = 1,
>   
>   		.pixel_format_support = {
> @@ -428,7 +426,6 @@ static const struct dc_plane_cap plane_cap = {
>   
>   static const struct dc_plane_cap underlay_plane_cap = {
>   		.type = DC_PLANE_TYPE_DCE_UNDERLAY,
> -		.blends_with_above = true,
>   		.per_pixel_alpha = 1,
>   
>   		.pixel_format_support = {
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> index 6bfac8088ab0..2bb8e11f26e0 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> @@ -504,8 +504,6 @@ static const struct resource_caps rv2_res_cap = {
>   
>   static const struct dc_plane_cap plane_cap = {
>   	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
> -	.blends_with_above = true,
> -	.blends_with_below = true,
>   	.per_pixel_alpha = true,
>   
>   	.pixel_format_support = {
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> index 3af24ef9cb2d..00668df0938e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> @@ -670,8 +670,6 @@ static const struct resource_caps res_cap_nv10 = {
>   
>   static const struct dc_plane_cap plane_cap = {
>   	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
> -	.blends_with_above = true,
> -	.blends_with_below = true,
>   	.per_pixel_alpha = true,
>   
>   	.pixel_format_support = {
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
> index cd46701398d9..6ea70da28aaa 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
> @@ -571,8 +571,6 @@ static const struct resource_caps res_cap_dnc201 = {
>   
>   static const struct dc_plane_cap plane_cap = {
>   	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
> -	.blends_with_above = true,
> -	.blends_with_below = true,
>   	.per_pixel_alpha = true,
>   
>   	.pixel_format_support = {
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> index 8f9244fe5c86..3ac8c0282589 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> @@ -609,8 +609,6 @@ static const struct resource_caps res_cap_rn_FPGA_2pipe_dsc = {
>   
>   static const struct dc_plane_cap plane_cap = {
>   	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
> -	.blends_with_above = true,
> -	.blends_with_below = true,
>   	.per_pixel_alpha = true,
>   
>   	.pixel_format_support = {
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
> index b5b5320c7bef..d60c17d5a0d8 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
> @@ -680,8 +680,6 @@ static const struct resource_caps res_cap_dcn3 = {
>   
>   static const struct dc_plane_cap plane_cap = {
>   	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
> -	.blends_with_above = true,
> -	.blends_with_below = true,
>   	.per_pixel_alpha = true,
>   
>   	.pixel_format_support = {
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
> index ee62ae3eb98f..b93b4498dba4 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
> @@ -651,8 +651,6 @@ static struct resource_caps res_cap_dcn301 = {
>   
>   static const struct dc_plane_cap plane_cap = {
>   	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
> -	.blends_with_above = true,
> -	.blends_with_below = true,
>   	.per_pixel_alpha = true,
>   
>   	.pixel_format_support = {
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
> index 03ddf4f5f065..6ccad53f1e49 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
> @@ -147,8 +147,6 @@ static const struct resource_caps res_cap_dcn302 = {
>   
>   static const struct dc_plane_cap plane_cap = {
>   		.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
> -		.blends_with_above = true,
> -		.blends_with_below = true,
>   		.per_pixel_alpha = true,
>   		.pixel_format_support = {
>   				.argb8888 = true,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
> index 727f458f6ee9..5c28f7151d13 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
> @@ -126,8 +126,6 @@ static const struct resource_caps res_cap_dcn303 = {
>   
>   static const struct dc_plane_cap plane_cap = {
>   		.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
> -		.blends_with_above = true,
> -		.blends_with_below = true,
>   		.per_pixel_alpha = true,
>   		.pixel_format_support = {
>   				.argb8888 = true,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> index d3918a10773a..eaaa2e01f6d0 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> @@ -827,8 +827,6 @@ static const struct resource_caps res_cap_dcn31 = {
>   
>   static const struct dc_plane_cap plane_cap = {
>   	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
> -	.blends_with_above = true,
> -	.blends_with_below = true,
>   	.per_pixel_alpha = true,
>   
>   	.pixel_format_support = {
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
> index f9dfbc7407ee..50ed7e09d5ba 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
> @@ -855,8 +855,6 @@ static const struct resource_caps res_cap_dcn314 = {
>   
>   static const struct dc_plane_cap plane_cap = {
>   	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
> -	.blends_with_above = true,
> -	.blends_with_below = true,
>   	.per_pixel_alpha = true,
>   
>   	.pixel_format_support = {
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
> index 7887078c5f64..41c972c8eb19 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
> @@ -824,8 +824,6 @@ static const struct resource_caps res_cap_dcn31 = {
>   
>   static const struct dc_plane_cap plane_cap = {
>   	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
> -	.blends_with_above = true,
> -	.blends_with_below = true,
>   	.per_pixel_alpha = true,
>   
>   	.pixel_format_support = {
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c
> index dc0b49506275..9ead347a33e9 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c
> @@ -824,8 +824,6 @@ static const struct resource_caps res_cap_dcn31 = {
>   
>   static const struct dc_plane_cap plane_cap = {
>   	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
> -	.blends_with_above = true,
> -	.blends_with_below = true,
>   	.per_pixel_alpha = true,
>   
>   	.pixel_format_support = {
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
> index 87f7669e81d7..100b6df33b33 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
> @@ -657,8 +657,6 @@ static const struct resource_caps res_cap_dcn32 = {
>   
>   static const struct dc_plane_cap plane_cap = {
>   	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
> -	.blends_with_above = true,
> -	.blends_with_below = true,
>   	.per_pixel_alpha = true,
>   
>   	.pixel_format_support = {
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
> index deaa4769be10..0f477d50e935 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
> @@ -655,8 +655,6 @@ static const struct resource_caps res_cap_dcn321 = {
>   
>   static const struct dc_plane_cap plane_cap = {
>   	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
> -	.blends_with_above = true,
> -	.blends_with_below = true,
>   	.per_pixel_alpha = true,
>   
>   	.pixel_format_support = {

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

I also applied your change to amd-staging-drm-next.

Thanks!
Siqueira
