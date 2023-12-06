Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C82F68072EB
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 15:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE64B10E751;
	Wed,  6 Dec 2023 14:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE25C10E750;
 Wed,  6 Dec 2023 14:46:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c83TZJk+Lw0ICFwRuAFK3jCKcFZkK2xQloU+XTBeQig5gt4NJa6j2mOxguDV3aWToGhVDR7TrOLH+lY7jyvyPnkbQbT+ZhecRc21hpdl7E/H6gPGQFULFaxfEl3Yk0QPlXW+SFtDvSgLO0oUS9nOl0M824UwNpqExvcBXlZ+IQ5e4nOuZRJOnA+ZnK16ydZ61Hk/UTwz7rKBmu3a1wIaSkV3cXXYV3wMXHd17apnX+NaJAxhEfZPGo+8H3P80BMYrg9q9fb45aaWnxN/D5c/fxhfMmRVb/7ImHUgDnoAjvT8I+UWUfsFtO4bzCmqHA95L2N9fX34pX7C4I3K0F+8JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FS4A4IDZEEmlhsQIwNnKONOjDykF5rUpNw99ZbVVLso=;
 b=Kb7rw8NMWayDQzrk1Kgx4OA1jclb0DQ1SdFJutviqvJRiivmWts5nikDXmCe6HDc9zVpG4hJZ3oK9psEWgKqQzxbE6tUs7By+evT9LhYNwHbQ2Y1g7eb4Pg7MkPh5Qgo0AQWN9U8q68u9rHzSbB3U+BWHrvFOI5HFMez6HqD7/KQsSRi5GMookHrGa36STClAEXtGB0MNc2r3LPgrZS4awu2RycD9OoClELi9zbkSNPsnpNnrj4hyczr/3lhq+y7B3PbVQ+Olx8g6n+b3F66YszsRArr0/LPd7Omhj9qZx03MAQkMlRWXA+LqvYzbI+CWy9EXr5xGaqXUetH3gQBag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FS4A4IDZEEmlhsQIwNnKONOjDykF5rUpNw99ZbVVLso=;
 b=GGgRo0YEAC3VJMRCz2+YWl2IVMYWsmB1ioXrhMfgprjiQ11oUCCKYXyNjqOlPw6DSdh6uA855Z0JY5uKXptCpfry+8vJpmqVoKp0v5NFwMfx/VoHkpM+JmWj88wi9oY+i2pye8F688YTBN3iWxpVESDXrQZ86iDBKdE9vPko77Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by SN7PR12MB7787.namprd12.prod.outlook.com (2603:10b6:806:347::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 14:46:30 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::5f1e:bfb0:43e5:dc81]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::5f1e:bfb0:43e5:dc81%2]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 14:46:30 +0000
Message-ID: <8d3af627-a41e-4c57-a099-70ead8b53261@amd.com>
Date: Wed, 6 Dec 2023 07:46:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] drm/amd/display: read gamut remap matrix in
 fixed-point 31.32 format
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Krunoslav Kovac <krunoslav.kovac@amd.com>, sunpeng.li@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20231128175623.121356-1-mwen@igalia.com>
 <20231128175623.121356-4-mwen@igalia.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20231128175623.121356-4-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0081.namprd11.prod.outlook.com
 (2603:10b6:806:d2::26) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|SN7PR12MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: abbf5b43-8265-4f54-c5f0-08dbf66a21f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2qn+xu/rniVqaMVT+rIUQ7Ym8qI9xQup+NciidmSiz8nxj1KGZ47Hkhm9cbq9btO+XqhQ7nwZbAa1rFs3HLdkN7yfV3XBLxV9KF2Zm29TJd6qpk6118zKsxRWxpaw/DDR9OGkMVwwL0lTUZBrghGdlGdlrlGj2+07L8Tht/S8EdIt51tacpPuyhL0sGm3XtwX86ymE4RWBeytjNlkvpksSql+CfhUE1HPplxnEcFFc3qVS/SXW71XjSmwbyJ2XygWygDuDgMTEO/AfR8hUZqa1Iyn+DBVVBvE+nVvWKfFlesmjz4ue774WkwS/Y+o2FrmPCBp1M2Jgc0O6Lj4NJwbsUnDgCBD1xdneX6LKVJh1KXOSuobRdWGuVqrSmO3zPq2svC3VF/qJfCVUL+gYw5BdNMxeS5Qkokj8s+llrlMX1bYAJAsS+wRaK3qcC8SMQBXIM2zwX1BAbYosDVd/s4hdeO1s5ws/8IVGQJiAOpJamDKmiHnVN59raS6W48NZg+Vl7ZCj8dwqC2egn8v+kX/CIdu8h4NkbxpFpDf+sEd6mMEOXCG67wELmTmODYKpYI8kFCSBaPy6wlF2ri6TugNbVghaIMdGqIFvOr1tb9zYPeq74q/jCOpxp5rNE4fD2tq/SPXXAQnfSxKLEcxqGo17FZPcsjYatH38I5LFg/u5Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(136003)(366004)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(921008)(31686004)(26005)(66946007)(110136005)(66556008)(66476007)(36756003)(86362001)(31696002)(38100700002)(6512007)(83380400001)(2616005)(53546011)(6506007)(6486002)(2906002)(316002)(6666004)(478600001)(8676002)(5660300002)(41300700001)(4326008)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlBOUEcrMjlmRUtENlNmcDFSbEhsSG04SFdyNG5iUDdGYnBVaWZVZVhIcGpB?=
 =?utf-8?B?V1k1dVgvbS8zellwVllJa1Q3Sk13N2xRckF4bDlwV2tzQmlvam5UV0pvR2JW?=
 =?utf-8?B?ZzBRNS9hYnJJQ1BBMWRYUmlxdDR3UnBYKzVINUQ4VEVxZ1hud0NUT0dvNS90?=
 =?utf-8?B?S3BabmdnaGpnN09FK3c3SUh1R3ZPQllGdFpwMDFKN2hCcE4zMFhKbHc3VlZt?=
 =?utf-8?B?aFBnaEp5NXRmaEpyMlNZb0tpOCtwVnRIM01EcEhSS1lrMldDa1EwbjQ2UFJ0?=
 =?utf-8?B?NkpDck1hRmRsRkpHaWhlRy9GMkhPaDVVUGJrL2FEWmN1b05NS3kwTGZNOEVK?=
 =?utf-8?B?bkNnT0VFc0pXTWdWMEw3ZnEwVmZYOWxJMjQxNnZUWUwyZ2FBdVNTUUpNMkFu?=
 =?utf-8?B?K3ZybzVrOFYrNlpDbUxBVldhQlpQRXhwUUc0Sk5wQ25menpqQ2ZEc2x2eC9T?=
 =?utf-8?B?K2N6elJQZHdxOTU1bkxrd1JPRkFGRXBndjFrd3czK3BKUy82SjdkTmNNc2Qr?=
 =?utf-8?B?aitFbXQxOEF0OUFwZTlQbS9TYWJVeCs2UHBFYTdIdEYwZlhVTVVYMlJkQ3dH?=
 =?utf-8?B?NUl3aytLdVMzci9lK0lWNW9GaU9kcktDK2ZpdlUvZzRTQWlnenR4cnVpSGNx?=
 =?utf-8?B?WEtMemprUStnS3ZFTGtRTERVZmN2dVp6SzRRV3V2ckU3S1ZnckxpYVV1R0J2?=
 =?utf-8?B?V29Zb21SYUlaVUVUQU5VNXBwMEE5RWFTaU1rNDRKNUxzVFRXV3lKdWpERkt1?=
 =?utf-8?B?cWVYL3RyQ0JHUTk5TklWQnZzZkwxT2w2WWdTNnUwUUhJdmFseTdLejhJcGU1?=
 =?utf-8?B?aFAvbVpzS1ROSjE1U0Q1SDRESjV2bkZvUys3QmlxVXFUbThvbCtxTFZMWW4x?=
 =?utf-8?B?dUhtUi9UMlVsV2E0bEhRN2F2eXVjSHE5aXZyT0dWeFkwV2lIUnhUcEg5MEJp?=
 =?utf-8?B?L1d4bmU0Z0I2SDNuSm9JaCt4L2RvRElkZ212VUVpc1dIVkJ6MGVzWEFnanV3?=
 =?utf-8?B?SVZwK0tMeERCVkhPZDZMd25DUld3SjRIRVR2eC9SUWJYdW9qZ1pTM3kwRlZY?=
 =?utf-8?B?a0RKZXdNSEkvTjZMamtQNXZpVFJtNlFlTFBXNlVJZEdlMkxORG5BU2xQVTlv?=
 =?utf-8?B?S1ZzcGxCMER0MmJZby91cVp6Q3c5NTZ4UWJpM2JGdk1Pc21KKzRkbXFmWG9o?=
 =?utf-8?B?MWh5a2Y2dXZIa1VtRWx6cEJUSlM5M1pqdXc5VEV5UXZNSEEvMlpTYkhPWjl4?=
 =?utf-8?B?Tkd0NURLcW1YT1p3RThYN1V2aG5SRWxWWDlMWTRaSEhQMFpoc01ReGJPN1lM?=
 =?utf-8?B?R2EzYkpEWGFBZlFtYVo3cHRWb09zUXl5VSs1NUxCV0NtMVB3UTVVaXB3bDZJ?=
 =?utf-8?B?TnZTN1lPMHdMZmxyazZna1hXMFEvOFB1dTB3R1BlVmJKVzdabGJMMGdLbjlE?=
 =?utf-8?B?Mkh3QjJLRitRbFNCN3V2V0J0K0xJU3NRcmRpL0pFVTVpS09YNW55WEFXWmZu?=
 =?utf-8?B?S2Q0MVpFcXdtUEwvN1BLcFJYRzdkZklpOFdUVHBsVE5hSWtMT0hsRGRuSVl6?=
 =?utf-8?B?YkpzaGtjeXpjODJRRDBrVldtaTVPbmc4VlZXN0padGFBeU1MR1YxTDNJMDRq?=
 =?utf-8?B?Q3ZWMVhyKzJqT0Z1L0lYVG9qN3c1clJrNVN6UXMrS0VTYmd5UFp6dkg0MDdK?=
 =?utf-8?B?R1c5RVlGYUVzaFprN3REQnFsQktvMVIzMnpuUVpqdEpLMnVJZEkwOVVscWJO?=
 =?utf-8?B?SWRxSk5rZGZZMTQxVjRKeTEvblFmT0pEaTlpUTdzYnVnM1k1MlBnZjFPUDl1?=
 =?utf-8?B?RmdsVmJRQWhRU1dyOUpnTGlkc0RYZHVOUW9VeHh0dXhFQ1NJSU9xcU5CMmxF?=
 =?utf-8?B?M09IWUMvMTgxY2g4d3hmTnM0dENBbStkTVBJZytpUUMwRXlhMG1kT0RnUVJM?=
 =?utf-8?B?SGUwV01PL2c5S1BwVzFodEhUVlRIRWdVM0JiWDROSld6amVpVjAyb3dlbGhC?=
 =?utf-8?B?L25Mblk5aUhueWN2VlJNdzZuMEFvb2JudFc2NlFYcWVaekpUR0lQbTBTT2k0?=
 =?utf-8?B?QzB2WC9JK1JnVmt4cnd2YmxvQkl4UnF1K3dvWFpBN1Rxd1ZZa09YMER6TFY4?=
 =?utf-8?Q?kLnv89prMRnjo2datQVvjeHup?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abbf5b43-8265-4f54-c5f0-08dbf66a21f1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 14:46:30.1173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4QrfEmP2nCJwqmxwWNEMATIDkIPW9LH7ZoplIofYHLvbWGpp9TFpBLind86KWJIAUTU4/b6om20ct+oRxAtBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7787
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
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/28/23 10:52, Melissa Wen wrote:
> Instead of read gamut remap data from hw values, convert HW register
> values (S2D13) into a fixed-point 31.32 matrix for color state log.
> Change DCN10 log to print data in the format of the gamut remap matrix.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   | 38 +++++++++++++------
>   drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |  3 ++
>   2 files changed, 29 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> index 9b801488eb9d..f0a9f8818909 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
> @@ -289,20 +289,26 @@ static void dcn10_log_color_state(struct dc *dc,
>   	struct resource_pool *pool = dc->res_pool;
>   	int i;
>   
> -	DTN_INFO("DPP:    IGAM format  IGAM mode    DGAM mode    RGAM mode"
> -			"  GAMUT mode  C11 C12   C13 C14   C21 C22   C23 C24   "
> -			"C31 C32   C33 C34\n");
> +	DTN_INFO("DPP:    IGAM format    IGAM mode    DGAM mode    RGAM mode"
> +		 "  GAMUT adjust  "
> +		 "C11        C12        C13        C14        "
> +		 "C21        C22        C23        C24        "
> +		 "C31        C32        C33        C34        \n");
>   	for (i = 0; i < pool->pipe_count; i++) {
>   		struct dpp *dpp = pool->dpps[i];
>   		struct dcn_dpp_state s = {0};
>   
>   		dpp->funcs->dpp_read_state(dpp, &s);
> +		dpp->funcs->dpp_get_gamut_remap(dpp, &s.gamut_remap);
>   
>   		if (!s.is_enabled)
>   			continue;
>   
> -		DTN_INFO("[%2d]:  %11xh  %-11s  %-11s  %-11s"
> -				"%8x    %08xh %08xh %08xh %08xh %08xh %08xh",
> +		DTN_INFO("[%2d]:  %11xh  %11s    %9s    %9s"
> +			 "  %12s  "
> +			 "%010lld %010lld %010lld %010lld "
> +			 "%010lld %010lld %010lld %010lld "
> +			 "%010lld %010lld %010lld %010lld",
>   				dpp->inst,
>   				s.igam_input_format,
>   				(s.igam_lut_mode == 0) ? "BypassFixed" :
> @@ -322,13 +328,21 @@ static void dcn10_log_color_state(struct dc *dc,
>   					((s.rgam_lut_mode == 3) ? "RAM" :
>   					((s.rgam_lut_mode == 4) ? "RAM" :
>   								 "Unknown")))),
> -				s.gamut_remap_mode,
> -				s.gamut_remap_c11_c12,
> -				s.gamut_remap_c13_c14,
> -				s.gamut_remap_c21_c22,
> -				s.gamut_remap_c23_c24,
> -				s.gamut_remap_c31_c32,
> -				s.gamut_remap_c33_c34);
> +				(s.gamut_remap.gamut_adjust_type == 0) ? "Bypass" :
> +					((s.gamut_remap.gamut_adjust_type == 1) ? "HW" :
> +										  "SW"),
> +				s.gamut_remap.temperature_matrix[0].value,
> +				s.gamut_remap.temperature_matrix[1].value,
> +				s.gamut_remap.temperature_matrix[2].value,
> +				s.gamut_remap.temperature_matrix[3].value,
> +				s.gamut_remap.temperature_matrix[4].value,
> +				s.gamut_remap.temperature_matrix[5].value,
> +				s.gamut_remap.temperature_matrix[6].value,
> +				s.gamut_remap.temperature_matrix[7].value,
> +				s.gamut_remap.temperature_matrix[8].value,
> +				s.gamut_remap.temperature_matrix[9].value,
> +				s.gamut_remap.temperature_matrix[10].value,
> +				s.gamut_remap.temperature_matrix[11].value);
>   		DTN_INFO("\n");
>   	}
>   	DTN_INFO("\n");
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
> index 597ebdb4da4c..b6acfd86642a 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
> @@ -141,6 +141,7 @@ struct dcn_dpp_state {
>   	uint32_t igam_input_format;
>   	uint32_t dgam_lut_mode;
>   	uint32_t rgam_lut_mode;
> +	// gamut_remap data for dcn10_get_cm_states()
>   	uint32_t gamut_remap_mode;
>   	uint32_t gamut_remap_c11_c12;
>   	uint32_t gamut_remap_c13_c14;
> @@ -148,6 +149,8 @@ struct dcn_dpp_state {
>   	uint32_t gamut_remap_c23_c24;
>   	uint32_t gamut_remap_c31_c32;
>   	uint32_t gamut_remap_c33_c34;
> +	// gamut_remap data for dcn*_log_color_state()
> +	struct dpp_grph_csc_adjustment gamut_remap;
>   };
>   
>   struct CM_bias_params {

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

