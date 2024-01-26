Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A766483E2A2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 20:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F4D10FDA7;
	Fri, 26 Jan 2024 19:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922AC10FDA7;
 Fri, 26 Jan 2024 19:33:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4L+L0B9dMZDd0N1xomzPy8En+1h8r1HhcC30vlkiLHQz7x0NkbQ/jrrhbWjeJK1JpxR8MbRtkXo3zOBfmAVHyVlnCkw4MxiUBln0qdB9aEad3EsesMsu0pBL25I+ip6UMx2ZMsG5TckDaD89YNo/3/cqTWxa9Nz26271x0v2ri9o4ebamV3ZODmjHHYGh/OBt96DPkngVkhjuoMOi5C0/rER1o7ZQBUMu2A1vujm7kGJLflVGR33uqSg2fmMVEltk3/GND6Mkhgr0Lowm92+VaJyCsLuNLHYtVkOSMxA+WaewpiFmNrLZcBTeoR0rqmS8Ss2nsov/gW7BpRTzTuHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tT24AA9hu0zXCIdwiS318NNFodPJtJZ4sYomFmnxmq4=;
 b=GuqP/Raw9BlvRzX/CKeFyvFOhyDgcOF6M8SWJOsKC9PGxG1iybCxGKnRp413UIgTwn0wv0/4WkqzjmZVEMNIvgZvE9Vg073+PlVcEDe5ysQtdaIIyfXNuitvDTUJ7EgcR42LIiyMiqgPSv1TspKWA9qFW1ZgGhT1SevrdoshSO25FVo5161Mmt0QtK2j4tOwd+2naDQxpDY3oNaTZ/FSoIMF71uEKThnT69lKHPYy+xxFBN9J3sVJ22wkAl2SEBsl4EepJciLvU5cvtGvpeUAREx0uZ9ugnKrRn9D/yh8xmM+orLXVhfkCNafDDnrKE61R4OvEo/di1w9FbpCeIH/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tT24AA9hu0zXCIdwiS318NNFodPJtJZ4sYomFmnxmq4=;
 b=a9ofhgbcMNXddbtZl/pM1qf7bpfWnoQpDb/SkU3fiupEla1p/XbEaZ7u3OJpa47aMnb8ATzKiocOQ8689B0f4E2kBPbEvuDYiDbYaw+BHxDIleiqJZe1GD9HG1PdhJTsbBYcpg+iTUTwwss5l0mPNOHuuaaPfnSZyKMz1LrYK+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA3PR12MB8802.namprd12.prod.outlook.com (2603:10b6:806:314::18)
 by PH7PR12MB6563.namprd12.prod.outlook.com (2603:10b6:510:211::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Fri, 26 Jan
 2024 19:33:15 +0000
Received: from SA3PR12MB8802.namprd12.prod.outlook.com
 ([fe80::e068:fefe:34e9:97b9]) by SA3PR12MB8802.namprd12.prod.outlook.com
 ([fe80::e068:fefe:34e9:97b9%6]) with mapi id 15.20.7202.035; Fri, 26 Jan 2024
 19:33:15 +0000
Message-ID: <b5084ad7-8c5e-4ea7-8d0a-8fef27da31a2@amd.com>
Date: Fri, 26 Jan 2024 12:33:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] drm/amd/display: switch amdgpu_dm_connector to
 use struct drm_edid
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20240126163429.56714-1-mwen@igalia.com>
 <20240126163429.56714-3-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20240126163429.56714-3-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0143.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::29) To SA3PR12MB8802.namprd12.prod.outlook.com
 (2603:10b6:806:314::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB8802:EE_|PH7PR12MB6563:EE_
X-MS-Office365-Filtering-Correlation-Id: 3323f722-4188-43e7-c005-08dc1ea5a456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ybViMzBHNsfm961AbDgjvQpGzoo3liakvxmN1i2BuatkL4CCfGbY56uBg1piavyn/5A9AND50YiC0mRKN4o2cvZ3fOdxY8w/nHYjOYT/cKIxVuFttyz9NmHPk526dGBflLEq6NXjEnRap7iHgyTtJ7e5TGH+BDSw4kmpHICgD/e/f0IcYRUrt2mXJMVCyZVJnDXTUuQfHO0TF0NzTzNgunxmkt8hWWnZcjcK2ESugry3Q4Pg7q6//d7ACaPm1jTV89jf3wZ5mPETlebUbLhk9UjUOdpPmc4KtehG2aRT3h4zMzRlvOyhGRg+sLvbpVb8KaGkh//pOBgb8kBiD+5i0FzDlUHClJ5NAJAqVy7LXitvAGU4V1PmsOygMfAOtFdzXZE8gX6OmFYvzqd6mKlTfIw4C1QaOguuxwq4l2DcqWjelCApl7JIUoJE++F6Bd7d6hoysKHe6fqGyWXnGKWuikEp7cCbdcX+9Vv5bu5VZvt0XhBk/3r8U+UYiZ7ErjgFCvcvdbBQ+96nL7TWgKMaffa3DrS5NFz4ibw9UFDWtYqTRxn/wgAKSrj3no4Iwwf4ZqbpJMsIr4smKr8BsqmcdpnE/CkPoUivnJ/2qiSRhTIoDBac4Tw4AJsWy04qZYHl790yfAU7YJWp8f3W5YJlfArZykRYdLYWMlTB6noG/8AYbyOVJPwTMQCfJikf88R6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR12MB8802.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(346002)(136003)(39860400002)(230173577357003)(230273577357003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(31686004)(83380400001)(6506007)(86362001)(2906002)(41300700001)(30864003)(6666004)(53546011)(36756003)(4326008)(2616005)(31696002)(6512007)(478600001)(6486002)(38100700002)(8676002)(8936002)(26005)(316002)(66476007)(66946007)(66556008)(44832011)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qlp4WStpZXYwNXBXdWczZ1NZTTZTKzdFcDh1N1VnV0E3QTk5bUhyTWFIblc2?=
 =?utf-8?B?OHQ4S21FdFNzMEJ6UXJBa3RYc2JRZFhtd0g1c3FQQ29teFZJVUFISGJmTGt6?=
 =?utf-8?B?M09FZ2dpZ1NIUGpYc0txRkFKSGhkVDBJSERUelBXMVNRTmE1ZTRDZVpsWlNm?=
 =?utf-8?B?czRQQWt3bHlCRUhYTS9uOUdxWWRPaThWYjhjdTk4RkVsZXhDMEJsdWQvbCtt?=
 =?utf-8?B?WSs3WmYvWDNtMzNTNDF2cTBNVFpBUFdPM3V4cUgxcCtIZS91QjBYRE5uQk03?=
 =?utf-8?B?L0JGY1QyWkFjbFhDS2NKRzlVbzdJeWZ1WlZwMU4xQmNHMXh3Y0RKdXRRbCtw?=
 =?utf-8?B?cUZOTTVUZHJHMTgyWHJHSDladk84TzM5SW95d3R4a0xDa2c4ZFFmTTBrTlVT?=
 =?utf-8?B?YjhUVDdNc1A4YU80bGtZNStCUmdKYXdqVndGbG5zNUNmQjNBZitHS2E5ZlJ3?=
 =?utf-8?B?aE03WE5DSXljemtIaUhoWXB0U0V3WU40cVprZm1jN0s5amNVRi9Xa3MxMjRu?=
 =?utf-8?B?VHNtNUhQUlhDd0Y5N2hZSC9OUUtiengwa29OakNwOTBZRmo2RW5ZU1kyZitH?=
 =?utf-8?B?NFhOazYyQjg0OURrOWhRTTlkNmt2WFRyZStWaGhmblRYVGp2T0NNdTMweDZG?=
 =?utf-8?B?cDVRMkIzYjdiZmx4U0NCUjY0dFFORHFSYnY1ckdyZURGeGthb05wbW5oWXF1?=
 =?utf-8?B?b1RMOVczVlB6NHA5Y3d3ZGdMcTBxejFkY0MrME9rbzJMdjFpU1B2dlpMSlVM?=
 =?utf-8?B?MkNNeGs2RUNJY1VRczVrNElvL2pBZ1VmN3p5SGRvOEdWdE9IRUwzVGplQnhx?=
 =?utf-8?B?L1dBQWF5Vkd6S0R4TGJDSDg4akhKbEE4aFg5d093cHdQUHByd0k1SFFsVkRk?=
 =?utf-8?B?VGNFcTRiN3U0clN2MmROcWd0R0p3SlVlNS82OHlzWTl3TTA4R09BdkZ1WE5C?=
 =?utf-8?B?UitQclJrNldweUoyWnJFSVN2QW9POEY2SzdaOHdoYmxoWDNDckdOemZyQkRN?=
 =?utf-8?B?cHNtakJ1Qk9zNkFPOGt6UHdCb1dBV0k1d2xWZEVNSTg3MGNra0R4Q0tqWGNn?=
 =?utf-8?B?bkllcU1rakFhMHkwNHVKVXlHckRrcDR0QTJqWm8yQ3ZWdFBVbUYzeWVlR0ZB?=
 =?utf-8?B?QlQ0YzFVb0tva0VaM1o3bjh3ckpEWEV4TmUwbGNteFlvcEZuSlZBNVB6TkYv?=
 =?utf-8?B?T0xZUWYrNjQvM3pPM2srbjFSc3oxa3REbk1hc1lSQ1BNYzhxekZMeElDOGRu?=
 =?utf-8?B?TXNYM01pcVNhQWIxdnZYdER3MlM3OVNaNnpteVF3V2UxVm8rNFZWM01kU2Vj?=
 =?utf-8?B?dW5vWVJjSC92MjNrNmdVOTlJTC9DWXdYT2N3MVluTUFQaUYxY21GNlB6YU43?=
 =?utf-8?B?d0ZrWWw2RVhqSkNhZHBYUmtJcEtPWHVlWkxYNWR4YjVUL1cyZ3RMdTEvTmE0?=
 =?utf-8?B?allzYzY5ZEVNMnFsemoreGU0RmlPbzBrSzNTOGt6NVo1ZFpVNnJrMDFRTFhF?=
 =?utf-8?B?SUg2clU1QUVOTU1vRDR6TTlvbnJVRUJsbVJSK3F0VTZiQVlLODh1dFIwTHho?=
 =?utf-8?B?a0lUK0poUVlhNkg5UTM3TUxqcHYxYjRFbHBkZ05MOFhkVzQ3akNIQ0FqU1py?=
 =?utf-8?B?V0tISDVZbEFpWC9xTG9BejdHQXdLNUE3VjVnenFLZTZvVXB5UWhxZ1BSRkJj?=
 =?utf-8?B?TDl5Wk90VjhZRHhiWDB5cVNpaTFEcmhzWjNpTERZd2U0bDNadERCejNZN3R2?=
 =?utf-8?B?bnJESnk5aGZqRFRWTjlRR3NVTldQYUxrVG5DazY2L1FTZ3gxRENHN01YdDQw?=
 =?utf-8?B?QzlqODJDT1B1OTBnMElvcDQ4NmFDUERQTEhxQmFjT3p4MTZIemg0UTFPbVJH?=
 =?utf-8?B?RFBOY3dFNTh3eDUzV3N5MkJhUk1YTWNMU2M1RmwwOHlQc2U3QkhQNU83c2Vn?=
 =?utf-8?B?a1dtb2wvYTJuZHZiTEJOYXBKNzNCKy9qQkc4WjJ6MzZSaEhRUS9lUklTR1k5?=
 =?utf-8?B?OHdNZmFNdGJUd1IrVm96ZWhiUlBOcnBqRTR2eHh4WGxpNm81TVpDcGloa1d1?=
 =?utf-8?B?MitvYVlpRjEvc3pQSnAxNDB2TjZkWTEzRXFGcXBvQjAyWWZIM2xjYXhvN0Rz?=
 =?utf-8?Q?u92PlwiGsMcfUcEd0vsnqe1R1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3323f722-4188-43e7-c005-08dc1ea5a456
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB8802.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 19:33:15.7163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VL4ZUdbmpUNuCQDeKrHJCeDIyU50a1y9IM5hMdByugamG/W/GkWtFVcrG1kBco5pB5b/AhjbH0JktXasonmH2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6563
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
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2024-01-26 09:28, Melissa Wen wrote:
> Replace raw edid handling (struct edid) with the opaque EDID type
> (struct drm_edid) on amdgpu_dm_connector for consistency. It may also
> prevent mismatch of approaches in different parts of the driver code.
> Working in progress. There are a couple of cast warnings and it was only
> tested with IGT.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 63 ++++++++++---------
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  4 +-
>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  9 +--
>   .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 23 +++----
>   4 files changed, 51 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 68e71e2ea472..741081d73bb3 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3277,12 +3277,12 @@ void amdgpu_dm_update_connector_after_detect(
>   					&aconnector->dm_dp_aux.aux);
>   			}
>   		} else {
> -			aconnector->edid =
> -				(struct edid *)sink->dc_edid.raw_edid;
> +			const struct edid *edid = (const struct edid *)sink->dc_edid.raw_edid;
> +			aconnector->edid = drm_edid_alloc(edid, (edid->extensions + 1) * EDID_LENGTH);
>   
>   			if (aconnector->dc_link->aux_mode)
>   				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux,
> -						    aconnector->edid);
> +						    drm_edid_raw(aconnector->edid));
>   		}
>   
>   		if (!aconnector->timing_requested) {
> @@ -3293,13 +3293,13 @@ void amdgpu_dm_update_connector_after_detect(
>   					"failed to create aconnector->requested_timing\n");
>   		}
>   
> -		drm_connector_update_edid_property(connector, aconnector->edid);
> +		drm_edid_connector_update(connector, aconnector->edid);
>   		amdgpu_dm_update_freesync_caps(connector, aconnector->edid);
>   		update_connector_ext_caps(aconnector);
>   	} else {
>   		drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
>   		amdgpu_dm_update_freesync_caps(connector, NULL);
> -		drm_connector_update_edid_property(connector, NULL);
> +		drm_edid_connector_update(connector, NULL);
>   		aconnector->num_modes = 0;
>   		dc_sink_release(aconnector->dc_sink);
>   		aconnector->dc_sink = NULL;
> @@ -6564,7 +6564,6 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>   	struct dc_link *dc_link = aconnector->dc_link;
>   	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
>   	const struct drm_edid *drm_edid;
> -	const struct edid *edid;
>   
>   	/*
>   	 * Note: drm_get_edid gets edid in the following order:
> @@ -6578,11 +6577,12 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>   		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
>   		return;
>   	}
> -	edid = drm_edid_raw(drm_edid);
> -	aconnector->edid = edid;
> -
> +	aconnector->edid = drm_edid;
> +	drm_edid_connector_update(connector, drm_edid);
>   	/* Update emulated (virtual) sink's EDID */
>   	if (dc_em_sink && dc_link) {
> +		const struct edid *edid = drm_edid_raw(drm_edid);
> +
>   		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
>   		memmove(dc_em_sink->dc_edid.raw_edid, (uint8_t *)edid, (edid->extensions + 1) * EDID_LENGTH);
>   		dm_helpers_parse_edid_caps(
> @@ -6633,13 +6633,13 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>   		return;
>   	}
>   
> -	edid = drm_edid_raw(drm_edid);
> -
> -	if (drm_detect_hdmi_monitor(edid))
> +	if (connector->display_info.is_hdmi)
>   		init_params.sink_signal = SIGNAL_TYPE_HDMI_TYPE_A;
>   
> -	aconnector->edid = edid;
> +	aconnector->edid = drm_edid;
> +	drm_edid_connector_update(connector, drm_edid);
>   
> +	edid = drm_edid_raw(drm_edid);
>   	aconnector->dc_em_sink = dc_link_add_remote_sink(
>   		aconnector->dc_link,
>   		(uint8_t *)edid,
> @@ -7322,16 +7322,16 @@ static void amdgpu_set_panel_orientation(struct drm_connector *connector)
>   }
>   
>   static void amdgpu_dm_connector_ddc_get_modes(struct drm_connector *connector,
> -					      struct edid *edid)
> +					      const struct drm_edid *drm_edid)
>   {
>   	struct amdgpu_dm_connector *amdgpu_dm_connector =
>   			to_amdgpu_dm_connector(connector);
>   
> -	if (edid) {
> +	if (drm_edid) {
>   		/* empty probed_modes */
>   		INIT_LIST_HEAD(&connector->probed_modes);
>   		amdgpu_dm_connector->num_modes =
> -				drm_add_edid_modes(connector, edid);
> +				drm_edid_connector_add_modes(connector);
>   
>   		/* sorting the probed modes before calling function
>   		 * amdgpu_dm_get_native_mode() since EDID can have
> @@ -7345,10 +7345,10 @@ static void amdgpu_dm_connector_ddc_get_modes(struct drm_connector *connector,
>   		amdgpu_dm_get_native_mode(connector);
>   
>   		/* Freesync capabilities are reset by calling
> -		 * drm_add_edid_modes() and need to be
> +		 * drm_edid_connector_add_modes() and need to be
>   		 * restored here.
>   		 */
> -		amdgpu_dm_update_freesync_caps(connector, edid);
> +		amdgpu_dm_update_freesync_caps(connector, drm_edid);
>   	} else {
>   		amdgpu_dm_connector->num_modes = 0;
>   	}
> @@ -7444,12 +7444,12 @@ static uint add_fs_modes(struct amdgpu_dm_connector *aconnector)
>   }
>   
>   static void amdgpu_dm_connector_add_freesync_modes(struct drm_connector *connector,
> -						   struct edid *edid)
> +						   const struct drm_edid *drm_edid)
>   {
>   	struct amdgpu_dm_connector *amdgpu_dm_connector =
>   		to_amdgpu_dm_connector(connector);
>   
> -	if (!edid)
> +	if (!drm_edid)
>   		return;
>   
>   	if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
> @@ -7462,23 +7462,23 @@ static int amdgpu_dm_connector_get_modes(struct drm_connector *connector)
>   	struct amdgpu_dm_connector *amdgpu_dm_connector =
>   			to_amdgpu_dm_connector(connector);
>   	struct drm_encoder *encoder;
> -	struct edid *edid = amdgpu_dm_connector->edid;
> +	const struct drm_edid *drm_edid = amdgpu_dm_connector->edid;
>   	struct dc_link_settings *verified_link_cap =
>   			&amdgpu_dm_connector->dc_link->verified_link_cap;
>   	const struct dc *dc = amdgpu_dm_connector->dc_link->dc;
>   
>   	encoder = amdgpu_dm_connector_to_encoder(connector);
>   
> -	if (!drm_edid_is_valid(edid)) {
> +	if (!drm_edid_valid(drm_edid)) {
>   		amdgpu_dm_connector->num_modes =
>   				drm_add_modes_noedid(connector, 640, 480);
>   		if (dc->link_srv->dp_get_encoding_format(verified_link_cap) == DP_128b_132b_ENCODING)
>   			amdgpu_dm_connector->num_modes +=
>   				drm_add_modes_noedid(connector, 1920, 1080);
>   	} else {
> -		amdgpu_dm_connector_ddc_get_modes(connector, edid);
> +		amdgpu_dm_connector_ddc_get_modes(connector, drm_edid);
>   		amdgpu_dm_connector_add_common_modes(encoder, connector);
> -		amdgpu_dm_connector_add_freesync_modes(connector, edid);
> +		amdgpu_dm_connector_add_freesync_modes(connector, drm_edid);
>   	}
>   	amdgpu_dm_fbc_init(connector);
>   
> @@ -11038,7 +11038,7 @@ static bool parse_edid_cea(struct amdgpu_dm_connector *aconnector,
>   }
>   
>   static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
> -			  struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
> +			  const struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
>   {
>   	u8 *edid_ext = NULL;
>   	int i;
> @@ -11073,7 +11073,8 @@ static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
>   }
>   
>   static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
> -		struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
> +			       const struct edid *edid,
> +			       struct amdgpu_hdmi_vsdb_info *vsdb_info)
>   {
>   	u8 *edid_ext = NULL;
>   	int i;
> @@ -11115,7 +11116,7 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
>    * FreeSync parameters.
>    */
>   void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> -				    struct edid *edid)
> +				    const struct drm_edid *drm_edid)
>   {
>   	int i = 0;
>   	struct detailed_timing *timing;
> @@ -11125,9 +11126,9 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>   			to_amdgpu_dm_connector(connector);
>   	struct dm_connector_state *dm_con_state = NULL;
>   	struct dc_sink *sink;
> -
>   	struct amdgpu_device *adev = drm_to_adev(connector->dev);
>   	struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
> +	const struct edid *edid = drm_edid_raw(drm_edid);


I got below compile errors:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 
‘amdgpu_dm_update_freesync_caps’:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:11176:41: 
error: assignment discards ‘const’ qualifier from pointer target type 
[-Werror=discarded-qualifiers]
11176 |                                 timing  = 
&edid->detailed_timings[i];
       |                                         ^
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:11221:33: 
error: assignment discards ‘const’ qualifier from pointer target type 
[-Werror=discarded-qualifiers]
11221 |                         timing  = &edid->detailed_timings[i];


and the following changes fixes it:

-       struct detailed_timing *timing;
-       struct detailed_non_pixel *data;
-       struct detailed_data_monitor_range *range;
+       const struct detailed_timing *timing;
+       const struct detailed_non_pixel *data;
+       const struct detailed_data_monitor_range *range;




>   	bool freesync_capable = false;
>   	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
>   
> @@ -11140,7 +11141,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>   		amdgpu_dm_connector->dc_sink :
>   		amdgpu_dm_connector->dc_em_sink;
>   
> -	if (!edid || !sink) {
> +	if (!drm_edid || !sink) {
>   		dm_con_state = to_dm_connector_state(connector->state);
>   
>   		amdgpu_dm_connector->min_vfreq = 0;
> @@ -11162,7 +11163,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>   		|| sink->sink_signal == SIGNAL_TYPE_EDP) {
>   		bool edid_check_required = false;
>   
> -		if (edid) {
> +		if (drm_edid) {
>   			edid_check_required = is_dp_capable_without_timing_msa(
>   						adev->dm.dc,
>   						amdgpu_dm_connector);
> @@ -11214,7 +11215,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>   			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
>   		}
>   
> -	} else if (edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
> +	} else if (drm_edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
>   		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
>   		if (i >= 0 && vsdb_info.freesync_supported) {
>   			timing  = &edid->detailed_timings[i];
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 9c1871b866cc..b81cf6f3713b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -637,7 +637,7 @@ struct amdgpu_dm_connector {
>   
>   	/* we need to mind the EDID between detect
>   	   and get modes due to analog/digital/tvencoder */
> -	struct edid *edid;
> +	const struct drm_edid *edid;
>   
>   	/* shared with amdgpu */
>   	struct amdgpu_hpd hpd;
> @@ -908,7 +908,7 @@ void dm_restore_drm_connector_state(struct drm_device *dev,
>   				    struct drm_connector *connector);
>   
>   void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> -					struct edid *edid);
> +				    const struct drm_edid *drm_edid);
>   
>   void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
>   
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index e3915c4f8566..91006326ce6d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -898,7 +898,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
>   	struct i2c_adapter *ddc;
>   	int retry = 3;
>   	enum dc_edid_status edid_status;
> -	struct edid *edid;
> +	const struct drm_edid *drm_edid;
> +	const struct edid *edid;
>   
>   	if (link->aux_mode)
>   		ddc = &aconnector->dm_dp_aux.aux.ddc;
> @@ -909,8 +910,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
>   	 * do check sum and retry to make sure read correct edid.
>   	 */
>   	do {
> -
> -		edid = drm_get_edid(&aconnector->base, ddc);
> +		drm_edid = drm_edid_read_ddc(connector, ddc);
> +		edid = drm_edid_raw(drm_edid);
>   
>   		/* DP Compliance Test 4.2.2.6 */
>   		if (link->aux_mode && connector->edid_corrupt)
> @@ -928,7 +929,7 @@ enum dc_edid_status dm_helpers_read_local_edid(
>   		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
>   
>   		/* We don't need the original edid anymore */
> -		kfree(edid);
> +		drm_edid_free(drm_edid);
>   
>   		edid_status = dm_helpers_parse_edid_caps(
>   						link,
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 7075a85dd16e..cdebd0e74b26 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -127,7 +127,7 @@ dm_dp_mst_connector_destroy(struct drm_connector *connector)
>   		dc_sink_release(aconnector->dc_sink);
>   	}
>   
> -	kfree(aconnector->edid);
> +	drm_edid_free(aconnector->edid);
>   
>   	drm_connector_cleanup(connector);
>   	drm_dp_mst_put_port_malloc(aconnector->mst_output_port);
> @@ -297,15 +297,15 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
>   		return drm_add_edid_modes(connector, NULL);
>   
>   	if (!aconnector->edid) {
> -		struct edid *edid;
> +		const struct drm_edid *drm_edid;
>   
> -		edid = drm_dp_mst_get_edid(connector, &aconnector->mst_root->mst_mgr, aconnector->mst_output_port);
> +		drm_edid = drm_dp_mst_edid_read(connector, &aconnector->mst_root->mst_mgr, aconnector->mst_output_port);
>   
> -		if (!edid) {
> +		if (!drm_edid) {
>   			amdgpu_dm_set_mst_status(&aconnector->mst_status,
>   			MST_REMOTE_EDID, false);
>   
> -			drm_connector_update_edid_property(
> +			drm_edid_connector_update(
>   				&aconnector->base,
>   				NULL);
>   
> @@ -339,7 +339,7 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
>   			return ret;
>   		}
>   
> -		aconnector->edid = edid;
> +		aconnector->edid = drm_edid;
>   		amdgpu_dm_set_mst_status(&aconnector->mst_status,
>   			MST_REMOTE_EDID, true);
>   	}
> @@ -354,10 +354,12 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
>   		struct dc_sink_init_data init_params = {
>   				.link = aconnector->dc_link,
>   				.sink_signal = SIGNAL_TYPE_DISPLAY_PORT_MST };
> +		const struct edid *edid = drm_edid_raw(aconnector->edid);
> +
>   		dc_sink = dc_link_add_remote_sink(
>   			aconnector->dc_link,
> -			(uint8_t *)aconnector->edid,
> -			(aconnector->edid->extensions + 1) * EDID_LENGTH,
> +			(uint8_t *)edid,
> +			(edid->extensions + 1) * EDID_LENGTH,
>   			&init_params);
>   
>   		if (!dc_sink) {
> @@ -411,10 +413,9 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
>   		}
>   	}
>   
> -	drm_connector_update_edid_property(
> -					&aconnector->base, aconnector->edid);
> +	drm_edid_connector_update(&aconnector->base, aconnector->edid);
>   
> -	ret = drm_add_edid_modes(connector, aconnector->edid);
> +	ret = drm_edid_connector_add_modes(connector);
>   
>   	return ret;
>   }
