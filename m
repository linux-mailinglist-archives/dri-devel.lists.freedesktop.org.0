Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FE86C8389
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 18:45:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027BB10EC25;
	Fri, 24 Mar 2023 17:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C611510E177;
 Fri, 24 Mar 2023 17:45:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fScB/mHprsPqvNKj7GN2f+Dl6hUV8ceJZu4STAuzctaPfTczrHvKxCZj3RZofq+wgVJwYmSCeNToam8asICBuwEEj5EK7WFYUWNhVdAN7mkoDRV9Y9MlwgjC49BfNCco4CHFafQ3SqT4Hy+egLyVn8CGuldxeKtcw4uOebzNjTSBRQJGDF1kM0UxJGaM5e7uzhDHULe2H2yhZT6vvEcoy7QaAGnzRhi6vNfSaLSYEODOAjAjhnYL2tG/uWlCsrXfujxn1Jv0K/B0GpnhERs43gVNHbCvMYpXBYCps2RTYEqSi+xAGWYTIUvKXlOOX7pY03d32aRUl0THuaAFhjHj7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kaRjKh/9nn44X+NhRCRyz0bW+A423pMlUYQmtlB8x2E=;
 b=ThGm8lNQmGfofGeZoPbNaK5csXzQ09JvPDkB/8FdgCXfBlIxiR5dv/mtnmqpTrA0YSrSCTkNpZ6Icdtvma+yuqt/BNceAVMZ1NcInV5Evugh6DPSjji9aLPTHiypu1nxJYvGkeVeveWJF8QjtLff3sqflms8esh8TAk302cb9abFZG16RxLn/7G5hEZ9m/vKAZpP+OD8zCiZCccCyhXuTrMdE1Bturux+gMO2grA/PIbXjv82UHYkeAoDs0XhCojnd+myWQ3X/YZ68ArHR68n+J1R/b3IoACU0/P4d0vh0y6W+hnm7A/u2RS3VTuAy3BM8Mz1TUa3xhNo3H5unbISg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaRjKh/9nn44X+NhRCRyz0bW+A423pMlUYQmtlB8x2E=;
 b=ewyX/nUha6tqr+vLc141IrdkXl7xVjpWv7H//L4V3Biq52NO+UZWs1RrFPMvePk2eAlgVgArPlWwhp2hTggdH1IO1PLSADcBzyzBxcSsdi3fd321rIy4WaxZcs6coyL3g3eu8l/mXZnsNJ6BVVGRnc+Kov2R+6CYny0jt+O4EaU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 CY8PR12MB8243.namprd12.prod.outlook.com (2603:10b6:930:78::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.39; Fri, 24 Mar 2023 17:45:23 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f%9]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 17:45:22 +0000
Message-ID: <32674bac-92c2-8fc7-0977-6d2d81b3257f@amd.com>
Date: Fri, 24 Mar 2023 13:46:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH resent] drm/amd/display: Fix exception handling in
 dm_validate_stream_and_context()
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 Stylon Wang <stylon.wang@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <e6656c83-ee7a-a253-2028-109138779c94@web.de>
 <ea0ff67b-3665-db82-9792-67a633ba07f5@web.de>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <ea0ff67b-3665-db82-9792-67a633ba07f5@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::31) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|CY8PR12MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: 3320dbec-2bb3-4bfe-aab2-08db2c8f8ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QBZ8P6xylVe9W0LWqab3sBO4bOx4VmEaGyvZNjxhYCjMAXqdu343GSz8ci/CBulbb90QwjzpVWhIUrZLdRu9c+pVyhUUGbsxJc+2Vmg+CJ4J/23JiSTjbKbAvRVZ8meapTUUhPZf9ucJhtFYhcAU8PUU8V7MBYnO0ifKRB1MAyRovOnym7nL+8mSylMdl48GLZgbAgsb+y0vsGzMhObQ/U0XC1H9oX3F7i5aUPgVPtR6OrbivoIeZfxQe0OsLEFLwmFvHreIB4xyTKA63MFW4gXt4QKItjsFPs5foYtpwZ/pBypszpSoFopJNtC9Pk5To4Yq4j9Ce8FBGkyVBrGLMcyGSM0oEPJ741oG56sV8gC/JqSuVcSEsA2v/ZtC36BA6e53q51+sDnCAs7FoT94QBcW0Kct63tyRQS2LxsnnFKXBNCC+L2r1elZHe3+GpHrjN8aEG8V+kWJu1/V+XqPhbexUosiUEW2M4YCDMQGM8hEzKLr2IDVCtvomzXaGC9iocw0ciEuuQLrK7XqrkpSvfa4wPqpHgaPUfMtIrAXrvCrJo7FhUUPnjyDi0bBYT7szu3peJCFy0wzJCuUZ9/lRxK6OxpQgzrjQ/ZLHW54rQuBpEE6Y4BXBXFRYpwjQmiIJXEQec+/4hSL+uucCM9G02iyB581H320iHDFTGjWdb6AM/71ymbGKGHkCalZuP0cm21LS9LOHU+BkNspOZxcCRP9iZuOxdXGxu5eqQNjju29KCm16oh5O9JWTtUmlQua
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199021)(66556008)(66946007)(4326008)(8676002)(66476007)(8936002)(36756003)(41300700001)(6512007)(6506007)(26005)(53546011)(38100700002)(186003)(921005)(86362001)(31696002)(31686004)(6666004)(83380400001)(2616005)(110136005)(6636002)(6486002)(316002)(478600001)(2906002)(44832011)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUN2Z2F2ejBPU250MTU2dVNpNkNPN2JUNnJrNTBPN2R4NEtSZmM3UVFMWXpX?=
 =?utf-8?B?VmQ4V05ZZlFleEZQbEIxd2VDKzRsRk1zdmI1dVF6UzB4L1lNTnQrdnIxVXZ6?=
 =?utf-8?B?TmE2VWlxb2xTN1NHenBBdVgyTWlCTk9ESVRDeGU0TC8rUWNaVDVsL2FuVk9C?=
 =?utf-8?B?Q0VsUzdnRGErdVFia1p5NFYzQVBJc2tZVFNPMmsrWjNUWTRKdDUvL1dtNGh6?=
 =?utf-8?B?M3l1Z2Z3YjhpSlE3MXpFdXFFZU9EMGJrSk53Wk93M0R0VVA5TlROVmwxUHh3?=
 =?utf-8?B?NE9mVFN1c2xnMU9PQzkxYTJKaHBWTzRSYTc4aS9WOEgyM2FkNmhmbHNWWkdz?=
 =?utf-8?B?SlRvTzZEWGRXNFB1WjAxSHdGYVA0cm9hTDZjL1p1YS9sdC82ZFFnQ1draEZZ?=
 =?utf-8?B?TGYxN0xpblBmQ250Z2tONVBsMHY0YmEzbGRRV1dReWVQTXQ0bS8zWExDcXg2?=
 =?utf-8?B?akRrUytFcTExS0FYMjU0ZnV1NnJpN0diM3VneDhhWHMyQmRCN3NqUWFBM01Q?=
 =?utf-8?B?bldnd3hldWRMTjh1aWNZNk9Qc2FSWW1CQU1DRzZZdTVXdFVmWmYyWW0yKy9r?=
 =?utf-8?B?eDlXZ2lScFhnTG1vWlllNE1qa1FwT3dLSlIzTXpGT0czeitGYmZwaURvQTc2?=
 =?utf-8?B?TzV4ck1WRWdqOWUvb2pDR3lkVndRcUNwM2FEb1RYM1JOTzZtUGx4RTVBT3Z0?=
 =?utf-8?B?WFNPSHlnT3pMWlB0bGZvWE9kRUFHcU91UGY5K1FMUHFFb1NJWWVOTlJzRklD?=
 =?utf-8?B?cFAxOTlNb3BqTnI1UUtUV252V0NoL2k1UDVlK3hxMFBRaVpNaWRnbkZiNW5o?=
 =?utf-8?B?S1dtcXN1Vy93d3IweE9taW5KTjlvMkFEeXpoWWJhTWJqbFJWS2N0MUdzdU5Z?=
 =?utf-8?B?YnFYamh6MHRaT3BRQkt5ZlYvVnJnVzAwLzBYblMyRkVmTG5ObHFXRGh4THVG?=
 =?utf-8?B?cDdVamZFT0FUbzR1cXZjOTM4MUs2cWZueDZCVUI1VjYzV2JsQzRUVjYxdjY1?=
 =?utf-8?B?TDhoQXljMEU4THlZSElybDNwcS9NRXJ2UWpOQzh2dDVtUG85YUJOZmYxMkdh?=
 =?utf-8?B?ckk2RXJETCsyUk5NcEhjdTNqMUZzeXJ3MTJZREh6bjZEMEtOdVh6eDB6Q1Ux?=
 =?utf-8?B?dUdsbWhDNDBsZ1l1cFU2Wk1ZNEQ4Mkg0RGRXSHpHdjNlWUZkT1NEK0R5RFRF?=
 =?utf-8?B?RDZGbWw1K0h1elYvbU9wM0o0amF0bHhERFVOeWppYy9OSmJDLzlHM0IvcWxQ?=
 =?utf-8?B?b1o2ZTlpSERySlRyb2wxVEZmbEpGb1hDbm5vS3NEVll6NUwyVVVEYmphV3Uz?=
 =?utf-8?B?blJXajN2OE9VZHQwOXRkaWRKMnRWZ2M0S2lFWGRsTmRtckRpd04vdjlNcTZ0?=
 =?utf-8?B?anhqRzN5MVNRbTF3WWxlTmthZkxYcXViQktHNjdETXB4UlhmamwzaTBjNTdq?=
 =?utf-8?B?WkRjRWt1WE40SWZxQnFPTUEyTUJDSi9XWVorMkdmTC9lRndEMnVBaFNLcklh?=
 =?utf-8?B?bFUrSFI5aWJ4VGgvUHBqNkNSb0Vvdy9STlZaZjhSdUYrM2g3Qzh5cDRzT0Jp?=
 =?utf-8?B?QmRPODJnUVZJVk4vYXpWSUR6SkF6QzNQNGV6NG1vT0tBbXhFTXZmc1hqSm93?=
 =?utf-8?B?eE1KVkcrTGF4amVHQk94YmlTaENlU0Y0eVBHNDFGbWxmZlNHbjVlbTJES1VT?=
 =?utf-8?B?Nm5uQjdmTEZLdVBNNXpnOWdZclJNYjFic3V6VzZjOVM2SGtLL21PanRHQ0ph?=
 =?utf-8?B?VDFTNU1aM3M2VXpLMEhMdkoxWUhrUFk1cy9FS084d21tWS9UTStVemFnQVBS?=
 =?utf-8?B?NW5CTFhkR0xXTWZ2UW1JdHF0cWtyb1NFaUhyZEZhUWdVYnBLaU43WGNsalJx?=
 =?utf-8?B?cFlvaEpLMWZjREJtdzFSb3I3cmZtS2liV0lMaEtFTEZuSEF3cVpWRlB2QXdo?=
 =?utf-8?B?OG15NEpDUlRoT0Y2bUpBL2h6K2NSUnU4UitOeWRZM1IzV0xxc3N5bXNoVjVC?=
 =?utf-8?B?TkpuTC9DMUNIZDBqZmc3RWhQNlFvR1lPNUlDTjUyRGRsV2xXYmkrRUpQcG1W?=
 =?utf-8?B?L09ob0o5WmRMU05OYzVZZ1lTZTFOaE9YcmNFUGR1bkkwbThXQVdvazh4eHEr?=
 =?utf-8?Q?3haCBigidYkS94JrPBJeYIlsj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3320dbec-2bb3-4bfe-aab2-08db2c8f8ae3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 17:45:22.7223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xt0cY4a7uFp4TvCkR/zkxeOPJnYT/Wz9jqVcyFK3rzupA2K9VqxosRtaR92X4uxHTqieADUXBTu27+en8fjMtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8243
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Markus,

On 3/24/23 11:42, Markus Elfring wrote:
> Date: Sat, 18 Mar 2023 16:21:32 +0100
> 
> The label “cleanup” was used to jump to another pointer check despite of
> the detail in the implementation of the function “dm_validate_stream_and_context”
> that it was determined already that corresponding variables contained
> still null pointers.
> 
> 1. Thus return directly if
>     * a null pointer was passed for the function parameter “stream”
>       or
>     * a call of the function “dc_create_plane_state” failed.
> 
> 2. Use a more appropriate label instead.
> 
> 3. Delete two questionable checks.
> 
> 4. Omit extra initialisations (for the variables “dc_state” and “dc_plane_state”)
>     which became unnecessary with this refactoring.
> 
> 
> This issue was detected by using the Coccinelle software.
> 
> Fixes: 5468c36d628524effbb89a9503eb1a2318804759 ("drm/amd/display: Filter Invalid 420 Modes for HDMI TMDS")

Please truncate the hash to 12 characters.

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Also please ensure that your Signed-off-by matches the "From:" entry in 
the email.

> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 20 ++++++++-----------
>   1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index eeaeca8b51f4..3086613f5f5d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6426,19 +6426,19 @@ static enum dc_status dm_validate_stream_and_context(struct dc *dc,
>   						struct dc_stream_state *stream)
>   {
>   	enum dc_status dc_result = DC_ERROR_UNEXPECTED;
> -	struct dc_plane_state *dc_plane_state = NULL;
> -	struct dc_state *dc_state = NULL;
> +	struct dc_plane_state *dc_plane_state;
> +	struct dc_state *dc_state;
> 
>   	if (!stream)
> -		goto cleanup;
> +		return dc_result;
> 
>   	dc_plane_state = dc_create_plane_state(dc);
>   	if (!dc_plane_state)
> -		goto cleanup;
> +		return dc_result;
> 
>   	dc_state = dc_create_state(dc);
>   	if (!dc_state)
> -		goto cleanup;
> +		goto release_plane_state;
> 
>   	/* populate stream to plane */
>   	dc_plane_state->src_rect.height  = stream->src.height;
> @@ -6475,13 +6475,9 @@ static enum dc_status dm_validate_stream_and_context(struct dc *dc,
>   	if (dc_result == DC_OK)
>   		dc_result = dc_validate_global_state(dc, dc_state, true);
> 
> -cleanup:
> -	if (dc_state)
> -		dc_release_state(dc_state);
> -
> -	if (dc_plane_state)
> -		dc_plane_state_release(dc_plane_state);
> -
> +	dc_release_state(dc_state);
> +release_plane_state:
> +	dc_plane_state_release(dc_plane_state);
>   	return dc_result;
>   }
> 
> --
> 2.40.0
> 

-- 
Hamza

