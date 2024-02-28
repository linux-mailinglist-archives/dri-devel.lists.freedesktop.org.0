Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D76786B3B2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 16:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE5710E88E;
	Wed, 28 Feb 2024 15:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nlI7h5mb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7819910E88E;
 Wed, 28 Feb 2024 15:50:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8ZPTWUQDODWzjsgZ7jKjCW6Jve441Kmef0Ptq1yxx8Rca81QdOF3dICQ3YSm1psbGUuI44hkeXG2hM0tFHgbq0xA6sfy3V4xoFextJOXKYvwthKA5DY3hVf0iNEjxyHPLPPELaA5l9PD0GdYM6prMXE9AXb1W19Gzjnh5PK5dbxWGscEFT2C1hE2FAjYoM9P2NBS+iHTXWi5rPdDCD0INyfAijnkUX4mN4D2vnly6AFqYS5s46wzSgYO1+Htqn3I7no/uB9f5NNRLKMZCuxA/ofwHjKjslAKGkrqMq0yNOKgaIa/PLvUeRW/Qexb4zAr+4buHiFz4brPxkLWh0F6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PT4BCZM1uOxbt4oWVE/gt8KcGjnHT4diG1wXukak+LQ=;
 b=D4w4PEc5pqrRt6bdydC+a62ZdHubu6XJoStwuZpVV7PX51hwor3Q/RhPlQtad24sFyxEQIBN4HiD3AVKkUOMz1RMElOu4xm6UpRsB3QSVPjTQzvD3lrFu9zF7TD7myDLSfkMfftQ0SsHCVxwwkRbkGw3zW2CWwrZBSk+9HBJZes2aMXze7r/rNAG+MS8Et3Zwv+lMXH9/q37j4R3INCbOsbOKMMX7Uny9Jn9G5fNq5RXnai9CG6UEAuFk/O0TsVAIk5gBhqaQ5VPN7GE8KXiPfU8matGR4yeJZEeRgr05qsWjmpfG3ArpVITOrg5+7d7wfcWbC00H3RuDszgL/Rjaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PT4BCZM1uOxbt4oWVE/gt8KcGjnHT4diG1wXukak+LQ=;
 b=nlI7h5mbHvDZemiDnUWnim96J+vbqkyBebiC5uYgVhwIdtLL/23iRamu2msrVPN1xSScCMwBro1l0y5p6vTG4MKOMo1mjrGW7u3zBrDZKUUyh6v9Hq34QD/LF0n/FI9vpXkAHU9HpUAXU9NSWso0ZYDKegoiOorK3Xc8MSJJNVU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SJ1PR12MB6027.namprd12.prod.outlook.com (2603:10b6:a03:48a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.24; Wed, 28 Feb 2024 15:50:41 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::b355:5f4d:3821:ad01]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::b355:5f4d:3821:ad01%6]) with mapi id 15.20.7316.034; Wed, 28 Feb 2024
 15:50:40 +0000
Message-ID: <281fca33-6163-40e3-8c5d-dab7b432dd86@amd.com>
Date: Wed, 28 Feb 2024 10:50:37 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Add monitor patch for specific eDP
Content-Language: en-US
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Ivan Lipski <ivlipski@amd.com>, Tsung-hua Lin <tsung-hua.lin@amd.com>,
 Chris Chi <moukong.chi@amd.com>, Harry Wentland <Harry.Wentland@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, Sun peng Li <sunpeng.li@amd.com>
References: <20240227181854.482773-1-Rodrigo.Siqueira@amd.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20240227181854.482773-1-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0152.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::31) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SJ1PR12MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: c14b8d4e-adeb-45b7-02fb-08dc387503d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 81I+G1V1jwMJ+GbjPweomk247i2Y+FMsAKuUtHlKi+YJuTiE4dzmP4OwicDRdHI3Q43/tHLMy0FiGanoEOQiAIxOzbkbBRLESPT/IHjP0JSLI84woBrtSXWWK/7fE/fDjLLcduKjUMe/tecjs5lJBNWhi27gfV/LV3JMVAa9JS0fdt5Y5c0QgGHA89UB8ZK/Pog0cTBL+x8msyefvPxI3gaehHv24n/JztLXQC7GiSFJFsgPRIzc6zmwqmAosKlAgN7v+3Xod937H4pgzRJAHtaRA2BG0aPTOFKTYMJhjFydPUTjAIlSuEzJrwRS+YdP+m0UQBvUxxpvHdVGqRONoDT0uoMIuBNZCg+i2WfArqBNMz4qxZ2AyI8siuPsl34xqYZLvs/I0jUmXR11+XGlQ/KLhLZpIzVDZKfPmYAzmQeAJjxAxdBuV4ow2922kyvOT1d1k+CvXsuoHR5RKdkX1wRHNukF+NUfbmlWGCKo/tsQrhsVTZnEimsxGcWdH+RyV8LWhihNdBzXu5B0qk0fGdImzjpQ6HWhOvqBw2qAkSbHwq/3oAfNoyeEnrzTAWprkkTv7wAluASsz1FfYshOljBtXHNCRIGh44Ny++GPeynXATfKwiAcRuvvXl/eV5RPwEhtE6DkHJgql/zuZ8RyNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3ZLMGxpYTNZeGM0blo5K1ZxQUh0N2FSMVVHY25JdXBuYkZPdVlEV0MvNnFz?=
 =?utf-8?B?djB6RDgyOHlPZjUwMFAxMXk1WjVTRzl1Y1NtNmFrUHIzQ1d0Sjk2WmlLTkUz?=
 =?utf-8?B?RzZTZFZjMHpoK2tIZ1pjMDlhWHo2ekJvaHlOZ1krK0tZdWN0YmVZZUgrTUV5?=
 =?utf-8?B?bHJneThCS3BCeTFJNVJFbUVib1JlR21md0pTeDJrVkNOdENFdUdjdnlxNW45?=
 =?utf-8?B?RWxrODZCUVpPMWc5UmRudFo2TXNvQ2NyWTI5ekdDK2tNMEZDMnRjWFZ0NENW?=
 =?utf-8?B?aVFJQ01mWFhCRzVlZHR5VVVISlI3WVErSzZZQy81NEJIL2NQNFVPcG5jYTVY?=
 =?utf-8?B?VTV4QTJ2Sjd0K0pZeTRGd3lKNCs3NDdLTW83eTNkdlFTZlhGMFZYdm9ZRTVH?=
 =?utf-8?B?KzdKMFNNQkpuUlAweUhZcHg2Z0VWZVNHQURNRzFkWFZSdEkvWi9OSHllR3dk?=
 =?utf-8?B?MU1vbWFnaXFRWEE1bDBJcDVMUWxzRVJCaG1Tb2IxODd1cFhhUkl2OEZnUHZY?=
 =?utf-8?B?UFBSOUxaMzF3cUpvNjViT1F5Q01EcitZejZCNDJRR0l2RWl2ajQrQ0RYYVJo?=
 =?utf-8?B?Q2R5dUxwY2pjTTBpVVRBSjRVZVliSGVaRFlPSmNFZk5lSk5LSnJIVnh2LzNJ?=
 =?utf-8?B?M2p1WWFDcTVGUkllNU1UMUdKc2JJNmFJQVNHc2VtbXVwM0tKN2p4TERTbzlr?=
 =?utf-8?B?OG9sY1RITGNtMWNmWFBZdzQ5ODBkdTRUc1I3TlNSQUh6eVB6eit2Q05oWHpx?=
 =?utf-8?B?UVZmS3lwMXRTT3VoMHI4eFd5Q0ZWV0pPVE0xUy9pWE1udzB2UUp6ZFFtVDI1?=
 =?utf-8?B?Vmp4WVVhTUNYOWNqTGRDTWFYZTdSL3VaRGdXeEx0YnFGVEJmUXpUMWhyMEZn?=
 =?utf-8?B?TnRxQ3Rmb3lzd2Q3cHV4NnZuajBPQTAyNUxCTUMrVWs3dDNudmVEMDZ2NXJ5?=
 =?utf-8?B?YW15YkhaNnB5TjNQeWExZTFyb1RWNGFqeFNuZTVtOElnMzZ2ZnJEb2U5NnlT?=
 =?utf-8?B?N0oyMnN5SGFnZWZBUVNLMnF2blI3aXorSTVKTUpTcjVnM09VR01udldkOHVW?=
 =?utf-8?B?UXFnaW9PWmdSbmxzelhuVi9EVWNHdTUrS2pnTW03Y3AwNEw0SE50VkhHUS9D?=
 =?utf-8?B?N3o1YTNKWDNLTTA3dGRFNzhTcDBBbUJVYlBxeXM2NUo5aWxQVGFVWHNTMFFG?=
 =?utf-8?B?a1JUbXdjV2cvTHc4ckZPQlp3Umk0MmZEMU56RTkwcUl6Z0RncDFxU0lrUFZo?=
 =?utf-8?B?VU1XV3piRkM0SlpvMlZIdEg3bGhrLzZVU3dlVnBMNDhhdUs0LzBtSEhQc2Qr?=
 =?utf-8?B?UXBhYkJjWHJrWWhpZy82UkxDbTVRWXAzeVJzMHdHbnhpSmVCa3JkUVJvbUIx?=
 =?utf-8?B?SlU4b25EVGdHbUJFM0J4S1RHQ1V3Q3ZEODJsWUR0ZXVoRnZVc3RlNVBQNGdT?=
 =?utf-8?B?czRQVitnVVhWczV4WS8xSDFKMGFrRDJsZGo4c3ByTFBTNjBlSWFyL2hQMUgx?=
 =?utf-8?B?RlVzYUNrV3RxMFhsR2tZa0hJSkJLYUdFTUgxY0VYOGhZTFBBTTAxeVBPNkFJ?=
 =?utf-8?B?QnVDMUd5aE4wR291TFlDdTBLY3diTTJqbEQ0aE5KZ3FKaDd1RExET21iQjJ0?=
 =?utf-8?B?NWtoTFZWQkxaVnRsM3kwVmxmdGJsNEIwNCtnQzZaTnhBaEFJZC9MTTVNb25H?=
 =?utf-8?B?WUNPZkhYNU1hQmFGVFp3SWRCa0h1UTFWUWdyMW1GTXhTYjU0a0ZhMXdQaTJ3?=
 =?utf-8?B?SlE2cjhoclhGQnJXY3ZzcHdaeDJ4Ylo0RjNSYkp0ZllMek40WmxtaTRJNjZp?=
 =?utf-8?B?cDJ2bWV1WFN2a0pYUk0vQ0o3cVFJWmZSOGc5elprcjZ1ZkNTeVhrL2VzM2k0?=
 =?utf-8?B?dG9PYVVmeGYvNnlNK0EzbmVoRVc0UkVwQVg2NE1qb2czU2hWYnFkWUJ5QnM1?=
 =?utf-8?B?UXgxYXhDakFDRFN3Vm1vWlZqV0dHeDkvVVJIWUJ6YXU4TkRyMzRabm8vWjg2?=
 =?utf-8?B?OUZpT1c1MXhveStZUi95RmhuQnNyU216eWlOOUtJYnNvT01ZV0V5Tjlib0tj?=
 =?utf-8?B?RUhLUHZnT2hQWW1qaVlTZWJpTkxyUTc2Mzl4djk4QnBpMlpzMldrVllhQTEw?=
 =?utf-8?Q?+gCQuEg3SGeMvPVz11nt39qUt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c14b8d4e-adeb-45b7-02fb-08dc387503d7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 15:50:40.7745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBLx7ip1hp4Dp29rrDziSE0SbfsqotZiR5P91T9c820O2X0nxU9A3IwGCDhA8+Oeqwz//j7PqrBL+gP4xKN6Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6027
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/27/24 13:18, Rodrigo Siqueira wrote:
> From: Ivan Lipski <ivlipski@amd.com>
> 
> [WHY]
> Some eDP panels's ext caps don't write initial value cause the value of
> dpcd_addr(0x317) is random.  It means that sometimes the eDP will
> clarify it is OLED, miniLED...etc cause the backlight control interface
> is incorrect.
> 
> [HOW]
> Add a new panel patch to remove sink ext caps(HDR,OLED...etc)

I wonder if it would make sense to turn this into a DPCD qurik (see
drivers/gpu/drm/display/drm_dp_helper.c). Since, it is rather unsettling
that we have so many panel quirks in our driver.

> 
> Cc: stable@vger.kernel.org # 6.5.x
> Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
> Cc: Tsung-hua Lin <tsung-hua.lin@amd.com>
> Cc: Chris Chi <moukong.chi@amd.com>
> Cc: Harry Wentland <Harry.Wentland@amd.com>
> Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
> Reviewed-by: Sun peng Li <sunpeng.li@amd.com>
> Acked-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
> Signed-off-by: Ivan Lipski <ivlipski@amd.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index d9a482908380..764dc3ffd91b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -63,6 +63,12 @@ static void apply_edid_quirks(struct edid *edid, struct dc_edid_caps *edid_caps)
>   		DRM_DEBUG_DRIVER("Disabling FAMS on monitor with panel id %X\n", panel_id);
>   		edid_caps->panel_patch.disable_fams = true;
>   		break;
> +	/* Workaround for some monitors that do not clear DPCD 0x317 if FreeSync is unsupported */
> +	case drm_edid_encode_panel_id('A', 'U', 'O', 0xA7AB):
> +	case drm_edid_encode_panel_id('A', 'U', 'O', 0xE69B):
> +		DRM_DEBUG_DRIVER("Clearing DPCD 0x317 on monitor with panel id %X\n", panel_id);
> +		edid_caps->panel_patch.remove_sink_ext_caps = true;
> +		break;
>   	default:
>   		return;
>   	}
-- 
Hamza

