Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01618627157
	for <lists+dri-devel@lfdr.de>; Sun, 13 Nov 2022 18:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2471B10E23A;
	Sun, 13 Nov 2022 17:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9DB10E239;
 Sun, 13 Nov 2022 17:47:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Avc+s86hsGgiMJhBlltP9/R+CVTvzVehY3CRGf5sgMh6TpbVN9Xdr6WDMbOjlvg/IYoUYI5GoHtl9oGgus9Ff1PMuicE0yFSaP8DusbDfrSdlz0TKH0pJEPQAiBzLmwPnKpmkGD8L5zEwFt+SYUr0IGYKK+Yaoix7OMbxYTGCkRvTrE7i5SENmMSnb1Tiznm7Np4IVQdURpC+2BrvAS/3xlfQCY0ZMOo6hBQdqcLaHhwqEXLf0PDyZCr5PA6Fy+28wO8GskdsvHJ1OV9S9X+irVWM5qNt3lFzrpTeBYWLkHSsHMXzPQ4KAnv0VPAJzczcNbE8e5PFJJoZ3H/Ghpefw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTbxD3yVFhT7pm5zY9lIlWKSQhmlE6STZMUV42YcIeE=;
 b=M1uBDsPhtEei+MxgmsWJyfwWaqB8vZmx2/FLc4EuRxTQLzDgUcUOrVl3ouL0Zz+A2N8JwxizncMKEWUCbvXx6ag7g7RHOrdcsJz8n1tvujcPyeUU2HJ4HjJsflYSioL3xA14kR+xfopd5Ul2mCF+87f5mq1BTZDvEwLa7pclGNZE/+gHdbxqRgf8QN07bqJlFbZYxtBsUx5likHHV0v0T5SuN0q6T2UROP1MZKLFFihEIh786DfVU2o3UGBxwbpagFvsf5x/eu0u73/8lJwqnlYi6OL5HYhJJgc+k831kRp6keWgt9QlgHfWDP/sOTRJRViWladbzzKWWgoFTZl2dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTbxD3yVFhT7pm5zY9lIlWKSQhmlE6STZMUV42YcIeE=;
 b=gpQNeVRLffJiJRyyY1qC5c5JFi4YylgUnBjx6RRrEUECL6+NfZI9KimxCaazT6zcrXIZhdmLHKwPi03FbjLzgYHc+1wNOw7BZe5/aTCwI31uRSEOpQwO1Pn0SU34MoC2shv2EF6iAIuK3/QLDN0jjtEiNCAY94FIMy7jIAtX9k4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Sun, 13 Nov
 2022 17:47:40 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588f:c941:4f62:9d89]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588f:c941:4f62:9d89%3]) with mapi id 15.20.5813.017; Sun, 13 Nov 2022
 17:47:40 +0000
Message-ID: <b5b44445-8ec4-7d67-149f-ec51ecf1b72c@amd.com>
Date: Sun, 13 Nov 2022 12:48:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/amd/display: don't enable DRM CRTC degamma property
 for DCE
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch
References: <20221103184500.14450-1-mwen@igalia.com>
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20221103184500.14450-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR10CA0006.namprd10.prod.outlook.com
 (2603:10b6:610:4c::16) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|DM6PR12MB4171:EE_
X-MS-Office365-Filtering-Correlation-Id: 200462d9-9f41-4b71-9ac5-08dac59f28c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xSFUgPJkGYxFY2XLW/C7H7otR2a5q/MUXG+Z5Tu+SDcyuYXxxWwCY6LNnZz16GUkeFRwKKO55tEI4njAnuGLa4vhqn/SNEqVeojFtqTp5wPDDzGLnpRzPnJilchDBES3XAsBgFV42R5edAR3P7Oo6cle2EpeF5EwqMPvMOgd0dxjODFCYZGdAGbM+w16N2GLlB4lOZAsehy9Q0cutalfc4AAcIDOGH923jZuPfhxV6V1fIxFzEPd/Z63arNjjRheK8X7eazb/HMMtE3QmfQ3Xc/RQw+EHOSLbRZvHnhSymQmwSjBTBXZbK2kG5kRigDcLmwoHaBpsU/88tnwS/LG/vULxtvvZc8KvCKkpjjgxochmMMJlUkEEJDLmidjV7Kp7R19IkK11OO3nKh3xNv7tuuHP1QqK3Os4wUiBzXEVrabbvoDVhqXAMqaphmMMlnMa0pJhBqgbxEJlSVyq2LZPK2W20xyPET6GqDZt4MEXHU3U40sd/YcUDuWzSA7uVwZEB19ymnN+M6wEjb6Zz0FMSQ+idzkOF5YiyaqwyLzSIPg92VZTHW8FDPhzBLXwtUERSO5dI3TaQxDbp5wycJqda1l1GglP+TzwtmSbPxYxfe5qmVgbTBxh7wjhtBj0WEpxWpNpQ0ckRKt/C0st8/DNyT2keAoJf6ao8288S7ucNLfVp5HlMEAUJsPrBA8LuwVknxi762VA77V3yNUVIMmHYMoPak5sMtjszBPWYcRR7TaPzWs2hbWnFkHJIKX58cxIkjqLmkfp6E7EwzQdlXAqvlLGfRFw9pMtAANAwpnttw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199015)(6512007)(4326008)(8676002)(66476007)(66556008)(66946007)(186003)(5660300002)(2616005)(41300700001)(36756003)(8936002)(316002)(53546011)(31696002)(86362001)(38100700002)(83380400001)(2906002)(478600001)(6486002)(6666004)(6506007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGVqU3pwUFRtUEJkY1J2MU1HSHVPeDVwL2MxeVBMcStzZjVaRHphSW1XbEl6?=
 =?utf-8?B?Z3NLblJKN1JSODdJNmw4V1MxWmUrTTFZeEVrTzJ1eEtzYnZiSGk4NXRoVElE?=
 =?utf-8?B?RTdrMjdHUUtWMCtSNUFjaWY2QUNCUXo4UTdhZUlxeVlLMWM2OGQ2Y3RwbHY3?=
 =?utf-8?B?czlQNmJXUVNkS2JvMVVIbmJMTUlGU2tsWW00czJ6enQ1ZWhYUkdyR01KYUZ4?=
 =?utf-8?B?V3VSem84Y2JvSmdzS3p1eGdRMytOS21JaEVpd0EzN2FaaGFBMStmTDJMRzlF?=
 =?utf-8?B?TmVMZXREdXNNNHZ4RjdiNS82QUtPYlVMVGl1ZEYxcFFRSG1MaUZCeHdqU0N1?=
 =?utf-8?B?MUpQOEcwU2JKczBJSVdTTCtqSG8vNHV5SkYyNVpiUmFpMUV0MUlGajlvemg0?=
 =?utf-8?B?TU1vTmtRM0dCd0owbEdqblk1Y2xWRE5IV0pNUWkrTDhLUXhLNHpaNjdjVjRH?=
 =?utf-8?B?SlZTRmd2ZmFuYmZYVUVvZlBqSEJjVGFoeXdHcDJOR3NPRnZuUGZlNVpsRHd6?=
 =?utf-8?B?R3dUc3lzazVQcDZ1UmtkU1RXYzUzbHlTL1puZVpIdTZZNFR1YkVHNEdJNCt1?=
 =?utf-8?B?cHVySWxEcmlJZUo2QXdHVUJBeXd2Qldwd1dmMG1PNENhYzFteERMMVVFeGhS?=
 =?utf-8?B?dDJUWWk3Mi9TYVRiQjN1SGQvbXVHQ0xsWkZjTHU2MHY5U296VnZ0NWJDWG9S?=
 =?utf-8?B?bDhONVZKV1UrMCtVSndSTHIrenBVbXE5cWVXRDJVQTlkUEhzUENMSHRnaVIx?=
 =?utf-8?B?YkxkT3RBYzZ3RjZwSCs0YUJDVGc4SUtMU1BTZ0V6L0JaK3F3MDc3QUw2bG5B?=
 =?utf-8?B?QWJiaXZVZW95V24vZ085c3pINFBBemNHd3pjU0Flcm1lZVZmcXBMQzJDT0VQ?=
 =?utf-8?B?SnkwL2g1WjF4bGEzWnFMOFRBSVJkVy9GV05EcmdvU1RoZk9YdDVJNnUvS1Ux?=
 =?utf-8?B?T2dhTkNFbW9LZ2VlZzE5YUF1NExaRnEySE1RMWc3NWtaT2d4ZEt2MDhYKzl2?=
 =?utf-8?B?cjJVQ2k3SE8zQm5FM00vNUlhNDB3VTlyekNINjlPbldPMVlGSkRRLzJ2QXZV?=
 =?utf-8?B?cElZN2FhaVlWSXIzTzFyYUN4ZXFNcis3dEVPNVZDeTlpOVZoSzJ5MUlPZ0dP?=
 =?utf-8?B?dm1PUEY2S0pNdkFnYzJHc3ZXT1JkWWpaSlhKV05BVUs2elYzUzFPa3NqSVo0?=
 =?utf-8?B?VHduN05hMndMdkw5Q2dHU2I3NG40WTFnN0w4bzhJUGJlcjBXUGx4UnhyUGVu?=
 =?utf-8?B?dWg3UGVFUXcvdzlYdEJaV1FydjN4ZkhYMDBPMTQ0aXlEdWlTang4Q05Sdld2?=
 =?utf-8?B?REVxTVA1Q0RZc3Njb3N6d3VMNU5BSllCdThaZGJ2TDlrRXAyWnB6eTE2ZUJH?=
 =?utf-8?B?ekJrZVVSSGNrN0RFUlVHZCs0RWlLREQvT3U0eDlIVWMxaVMyanZQZVlIUktR?=
 =?utf-8?B?czE5ek9HSXYzMnY1M2pDUlVyQ2oyZHJLSjZlTUN1RlZvMUI2ZkFpTm1VSWQr?=
 =?utf-8?B?disrdkJ5cVFJaWthT2grVjFMcHFBemwrNms5QkZYcUVNVWI1RFg4VGo0ME5m?=
 =?utf-8?B?VDJjQjhrVE5nRjBhZ21wTExWU0VTL3VCMjZXREZxVG9CcHJabE5sWThvQnll?=
 =?utf-8?B?WTcwVTNGZU9jNGhMUGRYM0xaN1I4SkJoVWszUDJ4b3ArQVM2Vm4rdUp4c0Fo?=
 =?utf-8?B?OWJlVVRQbC9vSGVEdlZWcXRtY04xR0RiY0YvM2JTTkI4WDVDWk0rRGQzbXRK?=
 =?utf-8?B?UGFzSkZiakZMMkhER3RveU44anR3dnFLb2lORnhXVjRFMFlocTA3RU5taGl1?=
 =?utf-8?B?WWN6NzhBV2piNnB4YjNVUUVncVBTWWpLeFZlby9lcncwZCt5cTFrZm1MbUh2?=
 =?utf-8?B?c1Z2L1F2RGtsNE01Y1BtcE9yMk1CQ1I0TWk3SnpTTVJKb0psUmRyeExhVEVz?=
 =?utf-8?B?OXc0SEVYS3UrSEh1Y28vL2s0eU9xcFlxT2pKZ1hWS01iN1lnME8vZCtVUFk0?=
 =?utf-8?B?aytKcUtHVFg0QUJZSXBhNTFTeFRQTk5XaEIwb0hTNURoUTBEY1JSaUg4YUJs?=
 =?utf-8?B?NUlQL1Vqdjg0Vms1SmYvb0F6ZSthWTgwQjZHT3hISDVkVHBtc0QydEdQS0ZB?=
 =?utf-8?B?WDRqbkdnWFJJcXMrbWptY0xuT0pCUStvcUFiVnF0dFROTVQvSXkyQjRzK3Jz?=
 =?utf-8?Q?emKrVyqz8WCBBIXcbLsJ7Y4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 200462d9-9f41-4b71-9ac5-08dac59f28c8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2022 17:47:40.3241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nC/r2oN47rqIte3R543ntKPDbfMayHJA0hAT2PbefqkknHVag706a2iFKUmBvJO73HXWrSFoQ7SSKSO3q0UgGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4171
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicholas.Choi@amd.com, amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/3/22 14:45, Melissa Wen wrote:
> DM maps DRM CRTC degamma to DPP (pre-blending) degamma block, but DCE doesn't
> support programmable degamma curve anywhere. Currently, a custom degamma is
> accepted by DM but just ignored by DCE driver and degamma correction isn't
> actually applied. There is no way to map custom degamma in DCE, therefore, DRM
> CRTC degamma property shouldn't be enabled for DCE drivers.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 9ac2805c5d63..b3eadfc61555 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -415,7 +415,7 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
>   {
>   	struct amdgpu_crtc *acrtc = NULL;
>   	struct drm_plane *cursor_plane;
> -
> +	bool is_dcn;
>   	int res = -ENOMEM;
>   
>   	cursor_plane = kzalloc(sizeof(*cursor_plane), GFP_KERNEL);
> @@ -453,8 +453,14 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
>   	acrtc->otg_inst = -1;
>   
>   	dm->adev->mode_info.crtcs[crtc_index] = acrtc;
> -	drm_crtc_enable_color_mgmt(&acrtc->base, MAX_COLOR_LUT_ENTRIES,
> +
> +	/* Don't enable DRM CRTC degamma property for DCE since it doesn't
> +	 * support programmable degamma anywhere.
> +	 */
> +	is_dcn = dm->adev->dm.dc->caps.color.dpp.dcn_arch;
> +	drm_crtc_enable_color_mgmt(&acrtc->base, is_dcn ? MAX_COLOR_LUT_ENTRIES : 0,
>   				   true, MAX_COLOR_LUT_ENTRIES);
> +
>   	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);
>   
>   	return 0;

Hi,

I tested it in a DCE device and the patch lgtm.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

and merged it into amd-staging-drm-next.

Thanks
Siqueira
