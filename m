Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AA28A33E3
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 18:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8262010E299;
	Fri, 12 Apr 2024 16:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HLusyKLg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA62410E299;
 Fri, 12 Apr 2024 16:29:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVyXlvgZzXH/2Z2H5PyF+qI9z4zt8j4xo9OOCWpyn6IWM0Hky2TQFMeArLzqcc/7oaYU9jRHBRxEl9eXUItrckPdCpU2tLaXcc0kK3YsOjC0ZqDYQOG8AtmDrLdNermnCnm1UeeFcdr3+NAoN+zceFgxRHxmrHuDqoC2Sn9ZReOb8/KcVfgZ1YjWL9mCI1AN+v9yGmXgjf/RolcfdDX3kaeOMxVkEjdtwnAuAyOlF6pxGAoHM03MmZ3hNQaSFzJGM+QE2KQjdkz5Uxx9NJZcVUYNMganyBasIMYXc4+I/baXuSIfR7FHhmSZz1zamd6hCF2nXTbvKrnTSNYjqbGEwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g41UXrCgEV99fECLp+31F55qc1vH5pgugYhiLNJWfsk=;
 b=DPievi3Y0nL7kWMAY+j/5syYZOosYL2FtbA5hx17XvYCfx2+BNi1kf/IdUAkbVqK2XNIug4kchKJvIFf09xDTCUs2aYBCMZ20x4fBNFA7Rpp2+s65mBG6qLuaLpzSHBW5K1vv9mRzf21wGlXeYLfIkUxKqPh/GlmtHny64hHNNOJKK1w6UxZjVELJYVuNUpKRUrTKTiuM8tRiQx4t7ZJro8DFPtfOo7plOY05VfR2afYp1Pa+fd1DVHen1777RComBjfw/htp6qrGUEvSScLaVGjmEwciGz8/nhriTS3eVXu/3tBHvk/6yj3PZpRjIu0QcV8sWkflkLQ51jWA2VbJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g41UXrCgEV99fECLp+31F55qc1vH5pgugYhiLNJWfsk=;
 b=HLusyKLg5LhCfCQJiynPnaFEI1jAuybAxW2/i5DKUFyAEqhPdF+uod5uox4rlNJfuMer7ByzkJzPow/78MLVJsdOqaXbpLfnlKOss2jdt+eWQM5FQ4ATSlGSCZEyfGsPKqfgz7X3pSo0aOmoo6v+VbXjPBimqAlDW00BShJBCtX2/UCsqGn78uHMTRvsnVU3xcWI2JCy4njoj6xzYiDoWvFrpR8c5WB2VBxS2xMDgmo/JzKkrEg7/3TXEGY53GNsY7JGv0faoYAbXeZCcdqEU066bWx674PvDIhM/2itCIFJOR/BDGzRmCe8t8WsD0iq6V1S3CbT3O2myuc6eKQQnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.43; Fri, 12 Apr 2024 16:29:38 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%5]) with mapi id 15.20.7409.053; Fri, 12 Apr 2024
 16:29:38 +0000
Message-ID: <0a2bd45c-294b-4665-b2f9-40ff01e2640a@nvidia.com>
Date: Fri, 12 Apr 2024 17:29:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/18] drm/msm: generate headers on the fly
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
 <20240401-fd-xml-shipped-v5-11-4bdb277a85a1@linaro.org>
 <05d99785-f8b7-4aae-85e2-db74a4e3017a@nvidia.com>
 <CAA8EJpoVb-K_AqDCYTtYJb_aGWO9P2jZ6XCjX7sASxovHr8WUQ@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CAA8EJpoVb-K_AqDCYTtYJb_aGWO9P2jZ6XCjX7sASxovHr8WUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0161.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::22) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM4PR12MB6374:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f7ed7ba-fbfb-4983-0e20-08dc5b0dbf81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tb/lzFeT0mmpkZ9dZUf5fPJCv6AUxJmf16bOYeo5OuO717loXnnncg8L5RLg2QFDOhnryKyo6NS+5MTUEnpnJamCt5yt6wFFNRBnd+fllHFNzQowDF+1VA54U+t9EnvzTuB5D0vELOPblbPHHrfCcWC/kGOPJ4tmzWJPDRM3xU2z1TXsbDtYC181AxUL/GmcP8w6mgGYpWF0Ao8EiQgtbPNQzeyvYg1E9rBwoM8Ace1DzGQ/ZFPSOYjoPqLJkMW6cp7HO0FEW40I600m+F/8ZcPV6JfxaCfap+cJ2MQQit/nBddck9jRYhIM891wwcEWBBmyaPOU2NpkqVcyazv9B4l5ZyQemPTR+UBmeZ1uE4+mjst3BjIyxomGI8xY6Ds/WpDRcXGV6xT6q3eC1M9RPRnwS8DF2Jj1F6J6bEBOM/OmPu69RLjSpoEJyD5zxmXuuFo7NzKfzbc9iEYIIi4GH5cj55cIhpb+6G1CG4YmAHgfHco4nVklTcEGVYpENfJPu9Hhs1mV+p8F/chCa145E16LkBuoptOjPUvY8Tix0etrnElH1R5HWHGst2YMUgyqlnhBeEwQmN9G5VGnhbolxRn5tdqHSYtjwb+sOO0uV8ZNlu86z50yqKyXApFEVvhdEj7ihVnJGHwjjShQLcwH+ibh2DKZCdRHcfR0PbFyOfI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFpwc1BsdlY5cnNxV2VVRkdtNGMrdm5hTzFOaXdQWDdEWGM0OHRpaFdEL2E2?=
 =?utf-8?B?QWY4V1dLWm1NdlRrV1F0Nk5wZytGRnBMcld4OEF2M0tLbnZNTHN1VHMwR3Vo?=
 =?utf-8?B?NW4xNUtyOFZocEkycVZTM3R5bkFxRWFLWS80YVhzRk9WYUR4K0pPQTdzWUVl?=
 =?utf-8?B?VkMrUUZpcmhPVHQxUHRxbGI1MUdtTzlUaXFHY09QSDJwMEt5UktSY0NaMEha?=
 =?utf-8?B?cDZubGlPUlhxa2JBRksyN0xXbVhCV0kyTkpYZGJBRHZDbUJjbUUxbGpicVpX?=
 =?utf-8?B?dHdXN0xkZnA4WjArODB6S3BNRTJaMU1zMXpEWlUzclVhT3lWRUlPRG85QVFN?=
 =?utf-8?B?THk0Z3N6cEhERWpCTlpHTlRab3ZXL0Q4SEhVYlNKV1M2TlRzMk1MbjRMM3Vt?=
 =?utf-8?B?M3RIU0M1Y0NXLzFjRjlUZ3QwRW5raU0wcGNBNndJVE5Ib3BtYjlHNzNLcEVN?=
 =?utf-8?B?SEw1REFJSkZubEo1bEdBc1I5THo0Y3FpV1N6Q3AvVXlBM2JaWE5mVGdsbGdu?=
 =?utf-8?B?QkdPVXYxeFZqaEgybm9JMkd5b2dTQWxhVkZqTi9LbGRzbWs1S0RRaDZQcllu?=
 =?utf-8?B?SjhsTzE0TktncDZSbmdEK0liOXZwV08vWGR6elZYM3JBRStFSyticUhrUkll?=
 =?utf-8?B?K1phZ1NzUEt2YXF5VCtyMFUzejF3Yk5iYjRHc0t3dnM1cWREYkFod2h6RmxK?=
 =?utf-8?B?dDMwMDh2RUkvRGdTV3FOTGpBR2JkZmQ4NVZaczIzK3RuTWRSUGNEUC9OWmhJ?=
 =?utf-8?B?UXA2Y25GQWc4Y2NXZzJqT1BVankvbUgwY1VSaFF0bm40Z090QTNqVEFacStk?=
 =?utf-8?B?WjFrdENWYjcvRHNYZitob25KY0xyNkRKVGFaV0oyaGVTT0NubkZYV0xTQ2t0?=
 =?utf-8?B?Z1BNZDhVOTVVNGNNamJ2b2xQdWZ2blYva0JMVysyMTM2eU9hUnRZT05GVVJS?=
 =?utf-8?B?My91R1VjdXA0Nk1BQ2w2TTNjTisveUcvNFhGcUFLYWttNjdjamZ3bjFKTHVr?=
 =?utf-8?B?VHA1ZldYY0U3SkYvZW4rcEQ4VHRNbUpSWWFVK2IrSVorZW9oWXBxL2pDT1Nq?=
 =?utf-8?B?SVhGcXljNThzREdXOFgxc1FydmlJT3JCN21BTWJXSnlZNStGSlZhZ0tQdG5D?=
 =?utf-8?B?Q0YwNUNsaDl5SFlXRjJicWFUQlJ0TzF3bWQrdWduYWRHY1JabTZKekphUWRj?=
 =?utf-8?B?SWhLY05tODRZcjhMLy9jelY4MTNFUnlKRDRwV1lSa2g0LzI3eGtEQTJ3clFO?=
 =?utf-8?B?bnpPOStiZE5JZGlsQVNtcHdnbHdMZ0NLWDF4ZFoyazNRb25laGxpeUQyQ1ZS?=
 =?utf-8?B?b2g2Q0oyL3dNSFI5OFBUb2NEbjlLVmFpY0lkdkQwVXFUUnVvQ2hrM3krMk0y?=
 =?utf-8?B?M3hMWXJBbk1USnppWFh6RFB2OUJoZ2NUcG1rOERuOXV1RFk1R1kyd0doc1dv?=
 =?utf-8?B?cE1mTlZSME5ha0lpNFZETW1JS3A4T0kwL2pMR1pwR3ZlRFdhYUs3NlB3Z1V5?=
 =?utf-8?B?aWg2Rmg2dHFhWHhMVFRtR3Q5NGxZL0JMelJPbis1c0JJNWlrSmYrcVFWQTNJ?=
 =?utf-8?B?Y01CM2kyYlRCMk40K2hPeTBqVHZ0dk9jcXZlT1BOOGJDcTk5MVc3eDdEbkZy?=
 =?utf-8?B?c1FET3lSVkxsSFg0V21Ib280Y210N2xvRGhMaGNZT0RQaFVmNDRlaE5CYWtK?=
 =?utf-8?B?UTJNbTE4NE1nTk1oRExsTVl3TXZscE8vYWJYYUVmd0xsYWp5emxCSnBZUk5p?=
 =?utf-8?B?SXMreTV5d08zbjdueTJzZENEUmJZNEFRZFZJTzdESU1oVjk4R1grdUt0N1Vs?=
 =?utf-8?B?Z2tyd2RwVW8rbEpaYU5XSlB6NzE1aTZNeG1PZEtOVW42ekxxd3J6TWVjL2ox?=
 =?utf-8?B?T1VSQi9Sc3pjVG5mVHBMQXIyK2ZSeHh3ZDBkQkcxTStkZkNubFp4dzAwejg1?=
 =?utf-8?B?cWo1ekRHUFlKU3BNU0thYjRTS1VQVVROZkJnSzdNSVpFblBFQnAxSVBnNGZK?=
 =?utf-8?B?VGFzR2IxMGxHakh3ZndWSENzbjNHZkkvRjd2dW14Tlk1c0I1cHNuclVkZU1U?=
 =?utf-8?B?bXgrY3YzZm5OdFI4VllkeXRrSy85Z0YySkpha2ZjclJWRXM5d2RGdlRzdXMv?=
 =?utf-8?B?K3VTVCtCM1ZuZHdZZ2s4VEJQd0xsaFFoN0hFQzdjdDZGS2VGZ1lMbUd5Z2Zj?=
 =?utf-8?B?MWc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7ed7ba-fbfb-4983-0e20-08dc5b0dbf81
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 16:29:38.8048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CgSC40HkSdMuk7IBACjz+dxeWOOIeL4J/9bNWZmlCckSS97IePbpO2fXgPDnL3+PZ3hpVZOMWxZtMAhPe1Rl8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6374
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


On 12/04/2024 17:19, Dmitry Baryshkov wrote:
> On Fri, 12 Apr 2024 at 19:15, Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>> Hi Dmitry,
>>
>> On 01/04/2024 03:42, Dmitry Baryshkov wrote:
>>> Generate DRM/MSM headers on the fly during kernel build. This removes a
>>> need to push register changes to Mesa with the following manual
>>> synchronization step. Existing headers will be removed in the following
>>> commits (split away to ease reviews).
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/.gitignore |  1 +
>>>    drivers/gpu/drm/msm/Makefile   | 97 +++++++++++++++++++++++++++++++++---------
>>>    2 files changed, 77 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/.gitignore b/drivers/gpu/drm/msm/.gitignore
>>> new file mode 100644
>>> index 000000000000..9ab870da897d
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/.gitignore
>>> @@ -0,0 +1 @@
>>> +generated/
>>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>>> index 26ed4f443149..c861de58286c 100644
>>> --- a/drivers/gpu/drm/msm/Makefile
>>> +++ b/drivers/gpu/drm/msm/Makefile
>>> @@ -1,10 +1,11 @@
>>>    # SPDX-License-Identifier: GPL-2.0
>>>    ccflags-y := -I $(srctree)/$(src)
>>> +ccflags-y += -I $(obj)/generated
>>>    ccflags-y += -I $(srctree)/$(src)/disp/dpu1
>>>    ccflags-$(CONFIG_DRM_MSM_DSI) += -I $(srctree)/$(src)/dsi
>>>    ccflags-$(CONFIG_DRM_MSM_DP) += -I $(srctree)/$(src)/dp
>>>
>>> -msm-y := \
>>> +adreno-y := \
>>>        adreno/adreno_device.o \
>>>        adreno/adreno_gpu.o \
>>>        adreno/a2xx_gpu.o \
>>> @@ -18,7 +19,11 @@ msm-y := \
>>>        adreno/a6xx_gmu.o \
>>>        adreno/a6xx_hfi.o \
>>>
>>> -msm-$(CONFIG_DRM_MSM_HDMI) += \
>>> +adreno-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
>>> +
>>> +adreno-$(CONFIG_DRM_MSM_GPU_STATE)   += adreno/a6xx_gpu_state.o
>>> +
>>> +msm-display-$(CONFIG_DRM_MSM_HDMI) += \
>>>        hdmi/hdmi.o \
>>>        hdmi/hdmi_audio.o \
>>>        hdmi/hdmi_bridge.o \
>>> @@ -31,7 +36,7 @@ msm-$(CONFIG_DRM_MSM_HDMI) += \
>>>        hdmi/hdmi_phy_8x74.o \
>>>        hdmi/hdmi_pll_8960.o \
>>>
>>> -msm-$(CONFIG_DRM_MSM_MDP4) += \
>>> +msm-display-$(CONFIG_DRM_MSM_MDP4) += \
>>>        disp/mdp4/mdp4_crtc.o \
>>>        disp/mdp4/mdp4_dsi_encoder.o \
>>>        disp/mdp4/mdp4_dtv_encoder.o \
>>> @@ -42,7 +47,7 @@ msm-$(CONFIG_DRM_MSM_MDP4) += \
>>>        disp/mdp4/mdp4_kms.o \
>>>        disp/mdp4/mdp4_plane.o \
>>>
>>> -msm-$(CONFIG_DRM_MSM_MDP5) += \
>>> +msm-display-$(CONFIG_DRM_MSM_MDP5) += \
>>>        disp/mdp5/mdp5_cfg.o \
>>>        disp/mdp5/mdp5_cmd_encoder.o \
>>>        disp/mdp5/mdp5_ctl.o \
>>> @@ -55,7 +60,7 @@ msm-$(CONFIG_DRM_MSM_MDP5) += \
>>>        disp/mdp5/mdp5_plane.o \
>>>        disp/mdp5/mdp5_smp.o \
>>>
>>> -msm-$(CONFIG_DRM_MSM_DPU) += \
>>> +msm-display-$(CONFIG_DRM_MSM_DPU) += \
>>>        disp/dpu1/dpu_core_perf.o \
>>>        disp/dpu1/dpu_crtc.o \
>>>        disp/dpu1/dpu_encoder.o \
>>> @@ -85,14 +90,16 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
>>>        disp/dpu1/dpu_vbif.o \
>>>        disp/dpu1/dpu_writeback.o
>>>
>>> -msm-$(CONFIG_DRM_MSM_MDSS) += \
>>> +msm-display-$(CONFIG_DRM_MSM_MDSS) += \
>>>        msm_mdss.o \
>>>
>>> -msm-y += \
>>> +msm-display-y += \
>>>        disp/mdp_format.o \
>>>        disp/mdp_kms.o \
>>>        disp/msm_disp_snapshot.o \
>>>        disp/msm_disp_snapshot_util.o \
>>> +
>>> +msm-y += \
>>>        msm_atomic.o \
>>>        msm_atomic_tracepoints.o \
>>>        msm_debugfs.o \
>>> @@ -115,12 +122,12 @@ msm-y += \
>>>        msm_submitqueue.o \
>>>        msm_gpu_tracepoints.o \
>>>
>>> -msm-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
>>> -     dp/dp_debug.o
>>> +msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
>>>
>>> -msm-$(CONFIG_DRM_MSM_GPU_STATE)      += adreno/a6xx_gpu_state.o
>>> +msm-display-$(CONFIG_DEBUG_FS) += \
>>> +     dp/dp_debug.o
>>>
>>> -msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>>> +msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>>>        dp/dp_catalog.o \
>>>        dp/dp_ctrl.o \
>>>        dp/dp_display.o \
>>> @@ -130,21 +137,69 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>>>        dp/dp_audio.o \
>>>        dp/dp_utils.o
>>>
>>> -msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
>>> -
>>> -msm-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
>>> +msm-display-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
>>>
>>> -msm-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
>>> +msm-display-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
>>>                        dsi/dsi_cfg.o \
>>>                        dsi/dsi_host.o \
>>>                        dsi/dsi_manager.o \
>>>                        dsi/phy/dsi_phy.o
>>>
>>> -msm-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
>>> -msm-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
>>> -msm-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/phy/dsi_phy_28nm_8960.o
>>> -msm-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
>>> -msm-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
>>> -msm-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
>>> +msm-display-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
>>> +msm-display-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
>>> +msm-display-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/phy/dsi_phy_28nm_8960.o
>>> +msm-display-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
>>> +msm-display-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
>>> +msm-display-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
>>> +
>>> +msm-y += $(adreno-y) $(msm-display-y)
>>>
>>>    obj-$(CONFIG_DRM_MSM)       += msm.o
>>> +
>>> +quiet_cmd_headergen = GENHDR  $@
>>> +      cmd_headergen = mkdir -p $(obj)/generated && $(PYTHON3) $(srctree)/$(src)/registers/gen_header.py --rnn $(srctree)/$(src)/registers --xml $< c-defines > $@
>>> +
>>> +$(obj)/generated/%.xml.h: $(src)/registers/adreno/%.xml \
>>> +             $(src)/registers/adreno/adreno_common.xml \
>>> +             $(src)/registers/adreno/adreno_pm4.xml \
>>> +             $(src)/registers/freedreno_copyright.xml \
>>> +             $(src)/registers/gen_header.py \
>>> +             $(src)/registers/rules-fd.xsd \
>>> +             FORCE
>>> +     $(call if_changed,headergen)
>>> +
>>> +$(obj)/generated/%.xml.h: $(src)/registers/display/%.xml \
>>> +             $(src)/registers/freedreno_copyright.xml \
>>> +             $(src)/registers/gen_header.py \
>>> +             $(src)/registers/rules-fd.xsd \
>>> +             FORCE
>>> +     $(call if_changed,headergen)
>>> +
>>> +ADRENO_HEADERS = \
>>> +     generated/a2xx.xml.h \
>>> +     generated/a3xx.xml.h \
>>> +     generated/a4xx.xml.h \
>>> +     generated/a5xx.xml.h \
>>> +     generated/a6xx.xml.h \
>>> +     generated/a6xx_gmu.xml.h \
>>> +     generated/adreno_common.xml.h \
>>> +     generated/adreno_pm4.xml.h \
>>> +
>>> +DISPLAY_HEADERS = \
>>> +     generated/dsi_phy_7nm.xml.h \
>>> +     generated/dsi_phy_10nm.xml.h \
>>> +     generated/dsi_phy_14nm.xml.h \
>>> +     generated/dsi_phy_20nm.xml.h \
>>> +     generated/dsi_phy_28nm_8960.xml.h \
>>> +     generated/dsi_phy_28nm.xml.h \
>>> +     generated/dsi.xml.h \
>>> +     generated/hdmi.xml.h \
>>> +     generated/mdp4.xml.h \
>>> +     generated/mdp5.xml.h \
>>> +     generated/mdp_common.xml.h \
>>> +     generated/sfpb.xml.h
>>> +
>>> +$(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
>>> +$(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEADERS))
>>> +
>>> +targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
>>
>>
>> I noticed that some of our builders were failing to build the latest
>> -next and it was after this commit that things broke. The builders
>> have an older version of python3 and the gen_headers.py script fails
>> in a couple places with syntax errors. The following changes
>> resolved the issues for python 3.5 ...
> 
> Could you please post them as a proper patch?

Yes absolutely, I just wanted to get some feedback first in case there 
was anything I was overlooking.

>> diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
>> index 9b2842d4a354..90d5c2991d05 100644
>> --- a/drivers/gpu/drm/msm/registers/gen_header.py
>> +++ b/drivers/gpu/drm/msm/registers/gen_header.py
>> @@ -323,7 +323,7 @@ class Array(object):
>>                           indices = []
>>                   if self.length != 1:
>>                           if self.fixed_offsets:
>> -                               indices.append((self.index_ctype(), None, f"__offset_{self.local_name}"))
>> +                               indices.append((self.index_ctype(), None, "__offset_%s" % self.local_name))
>>                           else:
>>                                   indices.append((self.index_ctype(), self.stride, None))
>>                   return indices
>> @@ -942,7 +942,8 @@ def main():
>>           parser.add_argument('--rnn', type=str, required=True)
>>           parser.add_argument('--xml', type=str, required=True)
>>
>> -       subparsers = parser.add_subparsers(required=True)
>> +       subparsers = parser.add_subparsers()
>> +       subparsers.required = True
>>
>>
>> I know that anything before python 3.8 is now EOL, but I did see a
>> similar thread on dri-devel [0] for supporting python 3.6 and so
>> wanted to see if there is any objections to the above?
> 
> I don't have any objections from my side.

OK, great!

Jon
-- 
nvpublic
