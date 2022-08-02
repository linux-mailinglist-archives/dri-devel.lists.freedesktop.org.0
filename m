Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B2F588095
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 18:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F7B91E5A;
	Tue,  2 Aug 2022 16:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A438F91F16;
 Tue,  2 Aug 2022 16:58:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTnBMALu8JsmBMwNma98YHQQW09iYnywTIOtzuvizeCRqah2FnozWE+54W4mJmeM23lqf1l3Bx0ac2SyG4GIpo15Nins1IknWv4TatedBbpYtzTx2L9UUYX7ovzxPBS1Ru2iKUxxAUSSuib4H7BXBHxaIaaU4NUh9uNU5wLJR/Bgb9PrMYHLo0U2wJsvjaVFCnZF7+mfAOB+EQ7SSGy5ZOZhytm6iHlg+N+aqceC10r2paIw/OkfH++M3Sw3A2kwUu+faizNVraB0Uew6xoAU7hYWMEK6ZpDREMdgQJCgv8aCQgENblMa5SbNLhBmduYBkJTDCKVeCqfyP0d4X77xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pg+ZGxhXRogKYqroMA2+kbRQWwPowzZ+k8NxVgseYZA=;
 b=eTlgVlldVOaG1w5/MdKDri4Ev5foSGGXb4M6SdOcRlZDnz0Mbxa+bZNQcFQ72E0JOWvmsUuyg2wLHMan/kq9xyf5YXfXUXPmajZlt9MjabXmt9OygeR580V4wWEgeexMV5aWHyBvG0id5eglGXCDTzsfOOIJCqbWZPxC3d/gbkHlguC6/Ll8CDOv5tL7NYCGorFNVtdvvvYlMWAmWAX8I79MaYX5RGD+Xt7JvAsIV0TpwBKRq+h0qv4pYtDlUUgPXc1alnINROzl2GuVx5Wb7747+dMfB6xHD3R05HiFQY2OuwxbnzSWYyxAA+qm1k5sqtwq/BtJTy0HlCy5hVl1AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pg+ZGxhXRogKYqroMA2+kbRQWwPowzZ+k8NxVgseYZA=;
 b=Nsvlfbdg+jthHGh0M9PbnZkJawsJzQVEVPNF0DPGv/54ns9nhWArZG2UUMy6Utbg83WC63kQK6fIQpkkDAyZdyRIxL9XEsrAk3J+w+GtVFJtB4cAIkqQyyJF9MFJf3uUMx4GG7vyoST7NxKdVHjJH98lrw4vYfO9Dz2J2/n2zIU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by BN7PR12MB2676.namprd12.prod.outlook.com (2603:10b6:408:2d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Tue, 2 Aug
 2022 16:58:30 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43%7]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 16:58:30 +0000
Message-ID: <aba27d03-6f3d-f9c3-08b6-6a2b19632688@amd.com>
Date: Tue, 2 Aug 2022 12:58:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/3] drm/amd/display: Fix static declaration follows
 non-static declaration compiler warn
Content-Language: en-US
To: Imre Deak <imre.deak@intel.com>, dri-devel@lists.freedesktop.org
References: <20220801135259.3039679-1-imre.deak@intel.com>
 <20220801135259.3039679-3-imre.deak@intel.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220801135259.3039679-3-imre.deak@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:208:160::16) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b7ac420-5bca-46e7-8a67-08da74a839bb
X-MS-TrafficTypeDiagnostic: BN7PR12MB2676:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NLLjgeRTEGtVl1eycGTfgY2+54rVH0G5ewl4XtJjmxLGhm39byqAkhMPa7rJGVGVS4XGsf3HSnBmgZWIV6tkjYyf6ISOULDUghS++40vfMIZxb2o9eVRKQLhP8AHVRf3bAhQRlFqJ6VkJVTILm5SypVAsC/J6K+0omTzq0/v1QdS/8ZjOZU9IS34XxhRX55J0aKTnHZBoe0DTKqGDnxCHOr1UpyOv7KsBXS4aVqZPswfdmB2eaC/nH23Lt5oIfMI77tuKv+SQZ7IUhDGOKSN1nEP6EUXFXlZL0P7gkVn+MNFMXgou6olGLTI80LtUD096P+lIq7bKr5MDP76MF/JCX/vax+uE1WWlmw6AfmaJjAu/WL8E2rtfpl+JAz+ME8EmSkSez9YFdj/T4+NKQp7OMdTVmaQJVlUZj8CJu2dZiTfbN00Ehn0mIx9kNAMfR2CJPqYnAtZRl1MJ0jx5V419pRpGzm/ixi7FmRXVYQu0DJRoin5mQ0ytOXL11zIX0l54bfTfoos/aLlp4YVc4rmshnXYevEsTqxSbvHVqeYGqTPv8E0aYF7HgjiTp9ZdPtDv1dG/SsDckUPqlMYCzQn58rccYoOfchFvnNchM5TO1HUEyzRQ91gUwapAIpKT4ZvcU2W1vGuKsMO75NH7NRBb2Dl3LrlMEBHKzRItVRdvukfpDviXof4HBZIbIbNb1ODPk4ZBHvai3NGf5lFpGQdAq9bLvGJ4yPgVEjus1UCloagbZymF2yYE6w4s9VwKYaeNcg4nrhi8c2ig0rSzJWQ6SaBa1UpDOX0IMH4mp4FUqomsgKORvcd9+4q2VnwNP47xrRkHn9TS8vgVtvWARX0tA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(316002)(83380400001)(54906003)(41300700001)(38100700002)(26005)(2906002)(8936002)(2616005)(66476007)(66556008)(4326008)(31696002)(6512007)(8676002)(86362001)(36756003)(53546011)(186003)(6486002)(6506007)(5660300002)(31686004)(66946007)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RENzQ0V2ekg3bElKWFp4alJITkNjZDNSUVhJUXlRZWl6eUloTG5zek81Yjdl?=
 =?utf-8?B?MXJlWW5SNWs2TE5NZzh6WkhKeElRc0REY0lPQk5KU2lwSFFIUTkyNEJqTkM3?=
 =?utf-8?B?THdkV01wc3RMdUwwQkJpMVNMbExab2xIZ1FteitYclhzTEE4c2JXQ3FmR1Yy?=
 =?utf-8?B?NXViVGdXbkg1a2dYczd3NWNva3lmL2x2QzlsbUFtQ3dsMzFFWXdGblNnOUg5?=
 =?utf-8?B?Sm4xMlQzZ21mOFh4L2IyamtVTjdCdmp0Q0YzWlpPbWtqUzdTanh2K0Rxd24v?=
 =?utf-8?B?Y2FmK0NJSTBXSFo5WnE2cnlpQ29wVXJGV2VTVk1BR3l5TjVWcGEwLzZnVkNV?=
 =?utf-8?B?K1hHZ1RzOHdQNklQbFE3eDExS2txWVM2RG5QUWh5d2JkOTR2UmJZOFp5UTJv?=
 =?utf-8?B?MDJEQTJSWnJTSlRzMzEzTnk1TFFmeDBpaUdDRWdNNFgyRVBqM1pQNjVta0Q4?=
 =?utf-8?B?bTZ0eG0rczBOazZUakZZdkF6N1h5Yk8zSHlmbHJiWVpIektyUVRSeXdSQ214?=
 =?utf-8?B?eGo1MnFWd0paZ1FEZnRmYkl5R0dXc3hOem9xMkY4NDkyLzZTN0JBWmJUNGxw?=
 =?utf-8?B?MXJpLzVrdzQ5cms4dHJHamFoYlQwMDVscy9ibjlEOTdHVWtZQzNtQVVmanBP?=
 =?utf-8?B?eVVzY1ZOOGxJektIZW1BeFQ5ZHF0M1VUeVVCdEZGYXI0Sit4YVV2NnRaaFFN?=
 =?utf-8?B?ODVVR3BveUpzaXJnNEwxbnpYeUo3VDZER1dFTG1BYkRPOFJsRWJ0SDFIekJX?=
 =?utf-8?B?RnZxREFPSmV2WVlxcXJKSFgxKzcyMXQzQ05MZUtYb1g1N0d5N3Q3WDB1WHJ5?=
 =?utf-8?B?MTB2endoZXUwN1EvRS82ZDBwSmZuZzF1WlpRTFJXcU9PUmRtaVJtWXZralEy?=
 =?utf-8?B?amxUQUZRaWZnWXZPcnlxUThObERsTkhZTGw5SFpDNEJuM1NmRGRBRXlxaXZz?=
 =?utf-8?B?S2w5ZFgrN2FiWkFsT1BPcG5sOUpnZ3p5RjFnc2tuU1pZSm1oc3BiTStBdDRD?=
 =?utf-8?B?NUZXYzVvWDZkOHNhNXRnSEhRTjREdHlYRHM5cEs1d0pqMkdWVHh4N05BWk9C?=
 =?utf-8?B?dENOZ2pLZ3ZCN082Uy9Ed0xzMHAzclJEZGJIa0R1cDFNWitjdFg2N0hsNytI?=
 =?utf-8?B?aFlOSGRHZnRLeEozdUNzUWhrNituYjlSVHJsUG44WlBvbHhreGpNZkxCU3lZ?=
 =?utf-8?B?RHNPcjBUa0hXbitqcWl0SGZaMlR2VUg3RjlKOE8wNmpqRlh0MVdKUTc0WXow?=
 =?utf-8?B?V1pMeXRWSEZNN050RjlmczUwL3hxdzdQZnpHZ1hnRzFnZXZDM09PMnFkdTFN?=
 =?utf-8?B?eXJ0SVhpSnV2WE9LYkZKTlFLdHFjR2xXZjBORG9uNVBWYVBhNTBZakRIZGlD?=
 =?utf-8?B?RmNOaFUzTGQzK0c0Q253MkNLeGZ0a3NZbU95am0yQUZlQ01aM2RraVhwNCtQ?=
 =?utf-8?B?NExCemUwMUF1VXRpdmEvRksvVjFsS0x1Qlo3OFBlNVA5WDdETmZ5V2dOaEdu?=
 =?utf-8?B?SkxTN3Y2eE1RZXNwdmd6alhJRjZ4bmpzYVBGQloyb20yVk5MSStYZ1VFTDZx?=
 =?utf-8?B?QVExaFFPYWxUMmNSbkdmcDR0WEVkeDdPNzRYdmhrZURoZzFNcXp2dGZ1SEM3?=
 =?utf-8?B?QXNHWHVrMU5remdBTk1ZNFBFWUM0OXAzTEwwdlRqU0JtS2NwNm1wRktoMkRu?=
 =?utf-8?B?Z0QrUm9DQ2NKL2M5UlNUaXNkbG9rRWxsYkRJRWt5cDZhVmY5bXpxZUF6NU16?=
 =?utf-8?B?QU9CVlhtNUFWdEk4Z2FqYWQyWUdoNENxdWhuWGh1cm5yY1FMeE5INzNwdXUz?=
 =?utf-8?B?NStqSU52Q3VoQlhIT0l3Z3Rqc3RZRWwvTjlyeFZadTlXczJOeDlTRlZaQUFP?=
 =?utf-8?B?ZU5WM2o5M0RIVjV4OFVYZGdaUkp1d0lCQ05SSENyUFQ1b1dDS0drRUNvMHlu?=
 =?utf-8?B?Q0NkaW1RWExSUStReWU3Ri9hZjF5TlF3YTB5Zy9xZFZxYThQK0lnZE13Qllz?=
 =?utf-8?B?cWZzeW90K2tlTWNxeTh2S2Y1SWVycWNqODhYM3NhdVE2ZHZmNlNjWFFaTWdm?=
 =?utf-8?B?SStoT3ZWdmFHdWd2cnlUTnlJWnBFRktRL3RiNVpXWkIzMlUrUHQwM2tETUl0?=
 =?utf-8?Q?mC8pwoamfz0CXgPPu68XxeNT8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7ac420-5bca-46e7-8a67-08da74a839bb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 16:58:30.0141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Xfa8qaEi89TI5ioDTmshLPiA+DJ6Tuq0t/xTF8xASp5Sz2uHOYkaUapn/x1ZTNWZrIdYLK8f09m/JvLmwErWA==
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
> Fix the
> 
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:951:13: error: static declaration of ‘get_min_max_dc_plane_scaling’ follows non-static declaration
>    951 | static void get_min_max_dc_plane_scaling(struct drm_device *dev,
>        |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:36:
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.h:39:6: note: previous declaration of ‘get_min_max_dc_plane_scaling’ with type ‘void(struct drm_device *, struct drm_framebuffer *, int *, int *)’
>     39 | void get_min_max_dc_plane_scaling(struct drm_device *dev,
> 
> complier warning.
> 
> Fixes: 5d945cbcd4b1 ("drm/amd/display: Create a file dedicated to planes")
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Harry Wentland <Harry.Wentland@amd.com>
> Cc: Alan Liu <HaoPing.Liu@amd.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
> index 95168c2cfa6fa..eeeec391f4b53 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
> @@ -36,10 +36,6 @@ int fill_dc_scaling_info(struct amdgpu_device *adev,
>   			 const struct drm_plane_state *state,
>   			 struct dc_scaling_info *scaling_info);
>   
> -void get_min_max_dc_plane_scaling(struct drm_device *dev,
> -				  struct drm_framebuffer *fb,
> -				  int *min_downscale, int *max_upscale);
> -
>   int dm_plane_helper_check_state(struct drm_plane_state *state,
>   				struct drm_crtc_state *new_crtc_state);
>   

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
