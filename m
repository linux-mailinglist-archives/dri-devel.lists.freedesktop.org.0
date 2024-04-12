Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2C48A336F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 18:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A411510E012;
	Fri, 12 Apr 2024 16:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TGEtz1tN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7CE10E095;
 Fri, 12 Apr 2024 16:15:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRbUbDWV3S9oSYKME0k9YdpS9yeF8798JuvscxY+PP/uiQ+JJ7lxmvZO1Pb91qyTpXUXW9rDRi+h/EErQdbptBRI60kRq+0WcogmPRCvjK41UrMtrzkuvhSIAuPfgmjy/s5dPCGnGRdmEPCAdxNVeqRgY+V3yT9O3EceVD+Mn8s9v+3RcwiRCiXYWscUqDPsRiEXr7eB4DQBVTdN3oq3W1hOw8FvKGo/Gy1wXbrbXTpagc37eDbV/vfDMNYv6WnKcIPLlO8QaU7UvZp1UQlXD4Bk8KRfZ8TDxeG8t9MtMmBRweePPF2RLbWoXdvxSi4hz7KpTBQiT4Sc5zuSq2sjnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLAcDXKvAkiL2/ITvWtk45w5ojLwLHTJvJzkHWAYQGY=;
 b=eBhf1QeU9ZH1l5kMhoe4gwTkZ86FxbpIGhqDIwh46oKnec+rengH5fBJrBDA+Djaut9DhCl2D1heVreMBGIbBU0/DxsLakZLBcX5YTyNFuEVrm8orsCusjMLAZwnd+5Hzi0QbH0IFLPYSWb9b4NMQDhN/BmAnk85bmDpSSSZmoW/0kV0qgguTxsXEjfyX4zePUuJB5YSRW7yMXocKIVroESV6mGLLKoRI64EY7gWB06TMwLBYmYyJ4AKZtuz6OpLh8pOoaIeQuR8ApDwkz+UXhyJZCFb//op6LoBcHGr8DDIoLDS1mcwbHn6y3tfXoOo4jaaZLF7YMAeI1glW4qhZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLAcDXKvAkiL2/ITvWtk45w5ojLwLHTJvJzkHWAYQGY=;
 b=TGEtz1tNEgGot2oQryisn3iuFV/ZSUvC1urc7/f023eF50P/VOOW9uYrVXBjDoFUGPkG46XKGbQplBfhK8Clg0GRJ0+cqIN+FIqxm3loAM0oc3NwedJuxjusIF2kg19Nqz3vCdMxFnyFTDNyO/XGYS9SzsmK+P/j5h+cKUxrxeScn5C/Hbcbbe6W8EjVrvV5rno+Ce6tRCTm9PhP8V2ZYqmO+/MV8Z5bTUdYTco5sFndxyBpNKnzCg66YldhGLe5zlmRTiYdM3X6zxtpFiXnbcdqkWWwlEO8EVVXuBTaIy9rpqLbKs+94BN6mhb7ylARke/uKOI6LJmLPZZoxRnuHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DS0PR12MB8504.namprd12.prod.outlook.com (2603:10b6:8:155::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Fri, 12 Apr 2024 16:15:11 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%5]) with mapi id 15.20.7409.053; Fri, 12 Apr 2024
 16:15:10 +0000
Message-ID: <05d99785-f8b7-4aae-85e2-db74a4e3017a@nvidia.com>
Date: Fri, 12 Apr 2024 17:15:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/18] drm/msm: generate headers on the fly
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
 <20240401-fd-xml-shipped-v5-11-4bdb277a85a1@linaro.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20240401-fd-xml-shipped-v5-11-4bdb277a85a1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0178.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::22) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DS0PR12MB8504:EE_
X-MS-Office365-Filtering-Correlation-Id: 03085a9f-2474-4edd-39da-08dc5b0bba32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e5Ia+lUnKXW0kJkcxkqx5IxDLnOGisX2qhSXqWxnExoxUwRvBiSJVlCM/Zxb8JB9q1+T5Aa29sF/ktey2MyMAQfplUWwdifNtqk2zKf5utvpgMejeJeyOfW/SZAjpoXTob+PbVYxIhppZ6w//uOJzIitebDj/RvlRjasthoFFreDLJzB11TETSx1f2Fd2UYbJNPo9dDOoJ5XLEOiJsJFm/BcujtD9TGqHh3+5STvaRGmPz/DmZNzFU8hqj9lOBXlN9hjhB329z9rlmMsHlpGZhc4S4XoRooGXAt3dgWdfxu0zNc+VGPdJGxAGvxBd7Ks6ni0hI+8Tk5Ynb8HmoXPWqktTG04yWyV1aGSWUcthupyl5aG35+ug0pA8/7PdaBbrJYCtysOY4v02VGp5AMebWQ9HLhSIB2L+6KTZP/sFw45uo5yNMWkSfMHHJdxXDRyNZqzw2eCSy+m2yxAdJSheB34wVGP7SA2+YXsma65/UU7IZaU4tu9bEA3QniSVWjXH5hk6u4M9jujWfjTnOhEOvkHhobLV/5OLq6JaOMpCmJZAFWA6qkoOvkRRLZwx1TdOJGfeedfkBvtM2yDcbd4IHQD2pRr4n3hFU28HdUCKZYcMuGb3LTXtOnf2ElfaPLD8cSQP31sa02mtVubLwe4vbB25c1QkTv5e2OUyEhm29+EaevDHBNe3jsajyV2w/syxbsWPoob3E8Mo0L8q20pOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007)(921011); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2VUYnlucm8rQVBqQTFFbzRLNTJBbFNRNG1SNzRGaFhQekZJaFo4Zk9oNE85?=
 =?utf-8?B?NFpxb0xWanJvU0hSKzBnaFZwNHczd2p1SjRGKzVjbmxmWUU1cnR0UmgzelNy?=
 =?utf-8?B?OVR2WmNZeDFvNS9sWXVQWWpPanIwV1NObHp0WHBvVkN5Y2NGV1dtbGpGVE1j?=
 =?utf-8?B?MjZRZ0JZSUpuY0RDVFhkaVozL1pwc09kb3RkVTdXREZmWlZYeEp5QVZNV2U5?=
 =?utf-8?B?MVlxSm9xNXNiTVVvSkhJTTVZd2djWVVCVVlRYlZBZ1EzY3pIdWN4ZWZkS0ZE?=
 =?utf-8?B?c0xCc0xLaW9JcjlKaXBLOWJZc2tLcUhVV0ova3NtL3FESGJSYTlEOVZMTks4?=
 =?utf-8?B?K1c3VU1oODBvakk0Tk1lVjkzVkIwRlNSajdBSTZFSEUwY0taWkUxL2NUOG8w?=
 =?utf-8?B?Z2c3UEpkL2NBcE44Q1VjdUlXVVFCVWRPbndHUWV5Qzk0RFMxMGtkUUpWaVpm?=
 =?utf-8?B?dTUyOXl6Zll4am15NEJUaitlMEtDQjRUK2RPU0g2QXh0ZzFrN0ZXYVJMbjlR?=
 =?utf-8?B?NUVIeXhMM3ZCRy9qRUZqOEpXb2M4dnJFdnZSRGJQNk1IR25VZmc5WlRqQjQw?=
 =?utf-8?B?SDVDR1c0Slk4bEFKdjZSeWFhQjE1RzRIUktMNWFjbnhwcStzQ2JnTDN4TEc1?=
 =?utf-8?B?dWZ4bjZ2T2ZvNitQVWcwdWN0Y2xQcG56U2FSeHFJZVZxTmY0OFlmVmU2czQ0?=
 =?utf-8?B?OHJNTjg3eHhGU0MwdlZ6WnZlTEx0SERMUzJYdTZhYmxvblh4UjhpQ3JoT01K?=
 =?utf-8?B?aFZ3SjdxVGNlaGZuN3lycUxjdUN3UC92UUl6dXBEYnBqangvck14WDhqSkdr?=
 =?utf-8?B?L1I0Q3ZBUERZUkg3RFBvb3pFMEplNTFpd1BudnJKNWs4cHpjbVAxWWhmN3V4?=
 =?utf-8?B?a1pCMGhMakZuUXFJcHY3RnJSTjVBNGZUUmFaak1qNFFuQ3NrdnIyTkh2RTMy?=
 =?utf-8?B?WW44WjNQYlpDcHFVcDdCSW01Q2pSZWpVZE9qT3Z5bFJCNnJrMFphNmRjSk05?=
 =?utf-8?B?ZG9YZW1pTm9ORTNqK3RPS3B0cUE1dGdWWTNLcHpFT1lCdUJKTExEbjh3bEU4?=
 =?utf-8?B?VGZlK1BjbnNOWFhCb1Awb3UvWnVjNGd0NFdYSnlUQlI3UVVvdkVORldiMG40?=
 =?utf-8?B?WVBOQm9LOXFjQXNPUjQ2TGF0WVVJWFRVVFZqV3UrMXF5SDlaU2hxaU5hc1g3?=
 =?utf-8?B?TTJteWtPbmtCYXlqNTR6OFd3T1AxQXVPU2pzMTZ3WFdjK05oN1lFeVpQeXJp?=
 =?utf-8?B?dWI1VHZNNnhLSnlNR25SRUJhbjRYdWFzbVU2VU5BSHVkaTNPWTE4TUhSVndS?=
 =?utf-8?B?cDRjdCtSbk5mQllLcjFCMy9BZU83cjdBSjNjOUxVRUxEM3dIV3ArbEJIVW5y?=
 =?utf-8?B?Rm1lTXhyTk9KUGE0ZldSL0swWXJGRldad0VHTHkxMEY2c3RlWC9Ca3VzTVND?=
 =?utf-8?B?R1NpWVNWdWtOSk1JUGRHNnBJd1Bzdi9INHdITXUxeEc2WWtSSThpQWI0RjAv?=
 =?utf-8?B?YkhQbVRwY3dXV2t3Tm0vUk53N3RxT1d0TmVpaWhWY3JyVEFvWndrbm9iaWth?=
 =?utf-8?B?TXhMQzQzRExoRWNmL1dQeVAyN1Q5NFJUUzlhREJNVTlhMXh3azByS0hZL2hk?=
 =?utf-8?B?YUI2Q2oxTk91NUFYTTRFMis2emVRWWtlVUZ3OVo3QkpBYzVCNDNpdmJRblpm?=
 =?utf-8?B?Zk5oSWxKYmxNL0JUeWhwV0ZHT3dkbHo0RU8xNUZaZW9NSWRnRWZyY2dZRmZw?=
 =?utf-8?B?eGMxTGdEc0dkeGFVdGg4UnhFSThKaDdXRC9XVXlubEV5a3QzQWRPZWd6c01r?=
 =?utf-8?B?QXlya3ZlNzUzRUIwbFlocU5IbURkbldlSWlMNkhPaWp4amNmdTRpNFZSUWVK?=
 =?utf-8?B?NnRXT2hSaExObmRMWnlTQ1gvZmVYWWVvaW9vd0RlZnY5bU5IcWVRSDdFS2U3?=
 =?utf-8?B?ZFFPNnRKUzUxbThiSzJxZU4xTUxUbENma2tsU3RFL0ZvK2tDT2hVVnhYYm9M?=
 =?utf-8?B?OXhWb0kraHVycVBaMFVwSFFuU0ROVnZJL1NNbE1PRzJVa1Z1YWlhL2JJRGFy?=
 =?utf-8?B?aDMwNzNqMkFlTmRjYmwyZWxkNFQzV1g3TEN5bVpHUEVOUmpmNnpTTURNSlh4?=
 =?utf-8?B?MVZkOVY2Vm8zVmhGK1pGekkvQm52OVpkMWY3MGNtb2tDRCtqbnN4aW1ncU1w?=
 =?utf-8?B?Smc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03085a9f-2474-4edd-39da-08dc5b0bba32
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 16:15:10.8571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2uqVn7RELjb4f6gnP9sUnH67wv0OJ7m28cvFfG76/Dr0pQ37yosc5bdsd6mRyXEF5lAbObhK1LhaDKl5m5+2lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8504
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

Hi Dmitry,

On 01/04/2024 03:42, Dmitry Baryshkov wrote:
> Generate DRM/MSM headers on the fly during kernel build. This removes a
> need to push register changes to Mesa with the following manual
> synchronization step. Existing headers will be removed in the following
> commits (split away to ease reviews).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/.gitignore |  1 +
>   drivers/gpu/drm/msm/Makefile   | 97 +++++++++++++++++++++++++++++++++---------
>   2 files changed, 77 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/.gitignore b/drivers/gpu/drm/msm/.gitignore
> new file mode 100644
> index 000000000000..9ab870da897d
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/.gitignore
> @@ -0,0 +1 @@
> +generated/
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 26ed4f443149..c861de58286c 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -1,10 +1,11 @@
>   # SPDX-License-Identifier: GPL-2.0
>   ccflags-y := -I $(srctree)/$(src)
> +ccflags-y += -I $(obj)/generated
>   ccflags-y += -I $(srctree)/$(src)/disp/dpu1
>   ccflags-$(CONFIG_DRM_MSM_DSI) += -I $(srctree)/$(src)/dsi
>   ccflags-$(CONFIG_DRM_MSM_DP) += -I $(srctree)/$(src)/dp
>   
> -msm-y := \
> +adreno-y := \
>   	adreno/adreno_device.o \
>   	adreno/adreno_gpu.o \
>   	adreno/a2xx_gpu.o \
> @@ -18,7 +19,11 @@ msm-y := \
>   	adreno/a6xx_gmu.o \
>   	adreno/a6xx_hfi.o \
>   
> -msm-$(CONFIG_DRM_MSM_HDMI) += \
> +adreno-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
> +
> +adreno-$(CONFIG_DRM_MSM_GPU_STATE)	+= adreno/a6xx_gpu_state.o
> +
> +msm-display-$(CONFIG_DRM_MSM_HDMI) += \
>   	hdmi/hdmi.o \
>   	hdmi/hdmi_audio.o \
>   	hdmi/hdmi_bridge.o \
> @@ -31,7 +36,7 @@ msm-$(CONFIG_DRM_MSM_HDMI) += \
>   	hdmi/hdmi_phy_8x74.o \
>   	hdmi/hdmi_pll_8960.o \
>   
> -msm-$(CONFIG_DRM_MSM_MDP4) += \
> +msm-display-$(CONFIG_DRM_MSM_MDP4) += \
>   	disp/mdp4/mdp4_crtc.o \
>   	disp/mdp4/mdp4_dsi_encoder.o \
>   	disp/mdp4/mdp4_dtv_encoder.o \
> @@ -42,7 +47,7 @@ msm-$(CONFIG_DRM_MSM_MDP4) += \
>   	disp/mdp4/mdp4_kms.o \
>   	disp/mdp4/mdp4_plane.o \
>   
> -msm-$(CONFIG_DRM_MSM_MDP5) += \
> +msm-display-$(CONFIG_DRM_MSM_MDP5) += \
>   	disp/mdp5/mdp5_cfg.o \
>   	disp/mdp5/mdp5_cmd_encoder.o \
>   	disp/mdp5/mdp5_ctl.o \
> @@ -55,7 +60,7 @@ msm-$(CONFIG_DRM_MSM_MDP5) += \
>   	disp/mdp5/mdp5_plane.o \
>   	disp/mdp5/mdp5_smp.o \
>   
> -msm-$(CONFIG_DRM_MSM_DPU) += \
> +msm-display-$(CONFIG_DRM_MSM_DPU) += \
>   	disp/dpu1/dpu_core_perf.o \
>   	disp/dpu1/dpu_crtc.o \
>   	disp/dpu1/dpu_encoder.o \
> @@ -85,14 +90,16 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
>   	disp/dpu1/dpu_vbif.o \
>   	disp/dpu1/dpu_writeback.o
>   
> -msm-$(CONFIG_DRM_MSM_MDSS) += \
> +msm-display-$(CONFIG_DRM_MSM_MDSS) += \
>   	msm_mdss.o \
>   
> -msm-y += \
> +msm-display-y += \
>   	disp/mdp_format.o \
>   	disp/mdp_kms.o \
>   	disp/msm_disp_snapshot.o \
>   	disp/msm_disp_snapshot_util.o \
> +
> +msm-y += \
>   	msm_atomic.o \
>   	msm_atomic_tracepoints.o \
>   	msm_debugfs.o \
> @@ -115,12 +122,12 @@ msm-y += \
>   	msm_submitqueue.o \
>   	msm_gpu_tracepoints.o \
>   
> -msm-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
> -	dp/dp_debug.o
> +msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
>   
> -msm-$(CONFIG_DRM_MSM_GPU_STATE)	+= adreno/a6xx_gpu_state.o
> +msm-display-$(CONFIG_DEBUG_FS) += \
> +	dp/dp_debug.o
>   
> -msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
> +msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>   	dp/dp_catalog.o \
>   	dp/dp_ctrl.o \
>   	dp/dp_display.o \
> @@ -130,21 +137,69 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>   	dp/dp_audio.o \
>   	dp/dp_utils.o
>   
> -msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
> -
> -msm-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
> +msm-display-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
>   
> -msm-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
> +msm-display-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
>   			dsi/dsi_cfg.o \
>   			dsi/dsi_host.o \
>   			dsi/dsi_manager.o \
>   			dsi/phy/dsi_phy.o
>   
> -msm-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
> -msm-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
> -msm-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/phy/dsi_phy_28nm_8960.o
> -msm-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
> -msm-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
> -msm-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
> +msm-display-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
> +msm-display-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
> +msm-display-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/phy/dsi_phy_28nm_8960.o
> +msm-display-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
> +msm-display-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
> +msm-display-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
> +
> +msm-y += $(adreno-y) $(msm-display-y)
>   
>   obj-$(CONFIG_DRM_MSM)	+= msm.o
> +
> +quiet_cmd_headergen = GENHDR  $@
> +      cmd_headergen = mkdir -p $(obj)/generated && $(PYTHON3) $(srctree)/$(src)/registers/gen_header.py --rnn $(srctree)/$(src)/registers --xml $< c-defines > $@
> +
> +$(obj)/generated/%.xml.h: $(src)/registers/adreno/%.xml \
> +		$(src)/registers/adreno/adreno_common.xml \
> +		$(src)/registers/adreno/adreno_pm4.xml \
> +		$(src)/registers/freedreno_copyright.xml \
> +		$(src)/registers/gen_header.py \
> +		$(src)/registers/rules-fd.xsd \
> +		FORCE
> +	$(call if_changed,headergen)
> +
> +$(obj)/generated/%.xml.h: $(src)/registers/display/%.xml \
> +		$(src)/registers/freedreno_copyright.xml \
> +		$(src)/registers/gen_header.py \
> +		$(src)/registers/rules-fd.xsd \
> +		FORCE
> +	$(call if_changed,headergen)
> +
> +ADRENO_HEADERS = \
> +	generated/a2xx.xml.h \
> +	generated/a3xx.xml.h \
> +	generated/a4xx.xml.h \
> +	generated/a5xx.xml.h \
> +	generated/a6xx.xml.h \
> +	generated/a6xx_gmu.xml.h \
> +	generated/adreno_common.xml.h \
> +	generated/adreno_pm4.xml.h \
> +
> +DISPLAY_HEADERS = \
> +	generated/dsi_phy_7nm.xml.h \
> +	generated/dsi_phy_10nm.xml.h \
> +	generated/dsi_phy_14nm.xml.h \
> +	generated/dsi_phy_20nm.xml.h \
> +	generated/dsi_phy_28nm_8960.xml.h \
> +	generated/dsi_phy_28nm.xml.h \
> +	generated/dsi.xml.h \
> +	generated/hdmi.xml.h \
> +	generated/mdp4.xml.h \
> +	generated/mdp5.xml.h \
> +	generated/mdp_common.xml.h \
> +	generated/sfpb.xml.h
> +
> +$(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
> +$(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEADERS))
> +
> +targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS)


I noticed that some of our builders were failing to build the latest
-next and it was after this commit that things broke. The builders
have an older version of python3 and the gen_headers.py script fails
in a couple places with syntax errors. The following changes
resolved the issues for python 3.5 ...

diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index 9b2842d4a354..90d5c2991d05 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -323,7 +323,7 @@ class Array(object):
                         indices = []
                 if self.length != 1:
                         if self.fixed_offsets:
-                               indices.append((self.index_ctype(), None, f"__offset_{self.local_name}"))
+                               indices.append((self.index_ctype(), None, "__offset_%s" % self.local_name))
                         else:
                                 indices.append((self.index_ctype(), self.stride, None))
                 return indices
@@ -942,7 +942,8 @@ def main():
         parser.add_argument('--rnn', type=str, required=True)
         parser.add_argument('--xml', type=str, required=True)
  
-       subparsers = parser.add_subparsers(required=True)
+       subparsers = parser.add_subparsers()
+       subparsers.required = True
  

I know that anything before python 3.8 is now EOL, but I did see a
similar thread on dri-devel [0] for supporting python 3.6 and so
wanted to see if there is any objections to the above?

Thanks!
Jon

[0] https://lore.kernel.org/dri-devel/20240118123752.bl3qss3qbbxgvpdk@suse.de/

-- 
nvpublic
