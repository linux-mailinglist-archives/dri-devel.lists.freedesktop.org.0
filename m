Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F45431789
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 13:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48006E9E1;
	Mon, 18 Oct 2021 11:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12826E9DA;
 Mon, 18 Oct 2021 11:36:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvsYpbJpOnqF8vZ/IHDY8tRPBrbbfTnYv73pW3cgACfJRPZoxLicpW/nDi9dW27D9pClMzBGtk0W162HbRsj2rKkund4ksw+qUyLEEYZMs7nfc41lXDngvCTjGYD6k4aw8ss1YdXKM1wGYigSLfOdOiOQtaBfb7P5PT8eKmbr9aDXn7DwwFSVnuX8LpNxGUBzZSph3PVlH16wNR+9SJXvZaHCR7RuL5f+mvYsPAvKvQgdndnNW7KM8jg3yYoV//duu2Sf/2lfh7DhhQdPnrpstK0tumTc6bMk4QidJ4tYTKnzw2Ft6blODWgay3hXfWO0g1f/3D+ShusxsO8BX6pog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOau+YeGqU02Rzqv/fxWu/pZyac0DQdiOZf7ysNSQto=;
 b=DWMfadGx8crjjx4qRvFhLsWqhigNWS3JiGmNHOQSOVWCmpTTk2ziULnoO+ct75mAwDfS6dKWG7UeKsNzA6RdE749XJyfkoUM8hc/J1/HcCXSJY87flU6ImRq4uWOZRkS9oeYe+dlCbLqFNA/uhAI6vsPCn6pGoUWgNgpFOfuKnOmYVylq8a0NaM4hnYTlZBawBQPPyqW46IQCdfWUm/1HMKqY1IAlTnrUSy0bc2Mu6UGy0ttht6WWHir4/ufOTO0pC6WfCfoF/IzNTKaEuxtF4gdyzdUauaU0C3Hy2Jy5n2sQsjlF52TSsJeTpS0SfHFdX7GL1GrD/wgvuX8IPr2mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOau+YeGqU02Rzqv/fxWu/pZyac0DQdiOZf7ysNSQto=;
 b=XZcbYPdZcZWc1mhF3krJgk11a4HufqHfFfLSEchI+sNRSVfVWaZTWPzBRHF1LSBF0V2HboC64iLNkQRBBPGixBD2X3HFFiLpmcbmkgzd/K5fKyhimNLQ3wPClIn1ShCyjTUdQ04w6BLshwhUqyr4OM2wUQTBWbCXBHD8T6ldAb0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1149.namprd12.prod.outlook.com
 (2603:10b6:300:c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 11:36:55 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4608.018; Mon, 18 Oct
 2021 11:36:55 +0000
Subject: Re: [PATCH] drm: msm: fix building without CONFIG_COMMON_CLK
To: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Alex Elder
 <elder@linaro.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 Rajeev Nandan <rajeevny@codeaurora.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20211013144308.2248978-1-arnd@kernel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <25ccdc75-67da-a955-b8ef-641a2f007d13@amd.com>
Date: Mon, 18 Oct 2021 13:36:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211013144308.2248978-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AS8PR04CA0051.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::26) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:c473:1c84:fac2:c272]
 (2a02:908:1252:fb60:c473:1c84:fac2:c272) by
 AS8PR04CA0051.eurprd04.prod.outlook.com (2603:10a6:20b:312::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Mon, 18 Oct 2021 11:36:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cbfc7d4-631a-4743-e3f8-08d9922b9601
X-MS-TrafficTypeDiagnostic: MWHPR12MB1149:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1149D6DBA743C54B5361A1F883BC9@MWHPR12MB1149.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2A6B7dYoJwl+H2pQenWeiaiYCivUDf65+QbvhsGC/MpbY25bH/MidmkEUVRkHHRWeVPr/Jjm7DF8Bj7ZI0/14myWEiN743N2kTuNF0qwO/eNlvP4Ihk12FIlV+toJId7863JXFkrfqdZoDOtRJUYBywhIn+w5ZWRNNonzYCjapXnV7marBwn1KD16TLaKQFyGyhjAUVbiBgbqCkiKRYtuUyfgc8LUYTo6j6ElbulfWoCLSTg9ErgoFg85so2d2oDU3Ii4/DrE2LbDQHJQX2AqbtTh31HXfUhUMJUGknpbaiiNGO8XQMRH4OEhU7wmS+Cz8D9hQD5mioFgmnM3ZS7K3yPwutVw4s4dfj3GdJ1+irPH06y2xR7svKMdn4fRd8I3VIEfZSwZR2ZeFzaDL+BIF97DlNhA65WC/vPkeC47SozFpTICRMP6Tb3H90bDbEymh/5UZ7s24rPFocq4XIs5isz4zyxKVahyakIUZfLJl9/fjXXW57hszS+bQDMxHD+F/tsxeEuuVsF9ih+XyModaHb3f/wcfPk6DbZxrbPjBcMkCzxmv3H4dmlb6qa3nnJ+4ACPH5qeQ2XOTXhBLrZRsTDM9g9QuQHVhbHoaRU/3oDjywoCUO3nzhTF70sUAWOnuQEtpR9DOPQqgZwFSsjf/6NafOPsiCav+K+3Cli+bYP4JNX1KrkBAabmNGnZK/yZtxuRn+bpMZlAoV5ewKNhGzXXuuadHr8elJABkkoJFz75d4bZxZcPWfs3QkYfuwM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(6666004)(66946007)(86362001)(54906003)(31696002)(7416002)(5660300002)(2906002)(6486002)(38100700002)(4326008)(8936002)(66476007)(2616005)(66556008)(316002)(508600001)(110136005)(8676002)(36756003)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmFCM3NaRUorRHJRdXlaQkQwZFZvZXl5OUpwTCtOTFpmcW1Lazd2L05iLzZt?=
 =?utf-8?B?U3JSUnduaW5OSlpZUmlyL3ZPQnJnUXh5RmMvQ0w2RzJJRFZoVU1uRkRZeklX?=
 =?utf-8?B?eU9xQXJ3N1NUNWQrQ1pCUXpxTC9YUURwaEx0QkFBVDE3Nmk0R2gxclBVcVhZ?=
 =?utf-8?B?d3RsYW1FYitMQkprdTVYUWVLYllnUVlOT1UrT2lwMkNUYkZ5QkJqWTZhZVFM?=
 =?utf-8?B?NCsvZ1hTcGVoMjgvNzl6VFBOUHlVeElCdWpQTHRVSVBHOHBDVU83UGpGMU1a?=
 =?utf-8?B?UHhSNS8rU1BWd0QvV3I5RVhIY0MycVBQMFM1UU9tOTdyZGp5bVFmT3ByM3ZX?=
 =?utf-8?B?M2hyd240bXBqakYvVCt4TlhoMWhIYldWNzlrbWFNbi9qSnFDRnBKbUtGZGpv?=
 =?utf-8?B?TkxIMUswdVYvWlZuNEliVVp4NzArd0dISUUwVGhBeXV2WG9Pb3RlZHEyUWRl?=
 =?utf-8?B?Rmxob0ZYTjlVWWZpWjkySzJtZmw0WUJzajJFTTlvUTB5M1hUNHZTdW9zK0xY?=
 =?utf-8?B?TCtISTFFanF2VjVTZ3BHOStXYmlKTVBuUVIwVWJGL2lDNVJTMVd5aUNqNHo2?=
 =?utf-8?B?MTZLRkMyTHFwSW9wNFQ2b0RDc3RhTU85SHdmSkRvSFBteTMvUGVidFQraU94?=
 =?utf-8?B?VVRhNktKdHdoU3l3QXJDeTV0TjlIVHRhcnNZNUtHQmQ0VjlpUFVFRGpmSHB4?=
 =?utf-8?B?UTc2cDRRMitDeUsrS1VqdkQ3cFhWSi9yL2tuNWl2NGYwejM5Q1o1Ni83VGFQ?=
 =?utf-8?B?eTJ6V2I0TkViQVMxeTN3cVlIb0ZaMUlKenNuVXl0bDQvN2dBcXJNTzdzMVJ3?=
 =?utf-8?B?THVXOFBrTFp0UENqZTBSMzVpNGgvL3B1a2NDZ3lhRWRuOWdRZmxYVUtUQ3Vk?=
 =?utf-8?B?SGFlYkkzblpEN0VURHRGVC90bklmTTE5MThaaUlZMHlvS1JJWEJKTUYycjFa?=
 =?utf-8?B?VUdwSEFOTUxaVGpvMHNOUjkwaFFoWHZSdkZiZ0NoYXBrMDQ3VzFxZjA4QUJC?=
 =?utf-8?B?c0R0VGFSY1QxcnFvRVd5bWZnMWNOaUJ1WHV0bERJZFp6VXplQmVOb2Qvdzc5?=
 =?utf-8?B?LzNBdEFkdFZLWDRjKzRFc3UyeER6WEdxYlQ0c2h0NVZpNTcvbVd3UnVxc1h1?=
 =?utf-8?B?VU5hcVRPMGlIeHV3VzI4SEw3NnlEY2ZuaTB2ZTNTUlVRQ1ltRk90NU1TaE1y?=
 =?utf-8?B?blU0NkgwWmVnQytyTTRBUThtUzBrNnBsNytLL2dWWlNXZDh5dXJFZ1BHVzRK?=
 =?utf-8?B?KzZuZzVHRUxHUSt6Zlk2VHRIc05MOGR6NTRsWkVEVXQzSDdsRTIzVm5IdDl2?=
 =?utf-8?B?T0J2K3p5SlkvZ3NCRkZJM29VNGJHTnhnM0RpZERYQnU4QTJFSWNlVU5Sc3BK?=
 =?utf-8?B?dUhxRXNIeGIwWEY4djZZWVhRZWRyc0RpSkx1TnVCZGFiTTE2YWd2WDdtVUdD?=
 =?utf-8?B?WXlCZ2NEaEZZWG1BR0JWL3gvM1dNWjU5a2swbWNIV3A5OEhjYk5OZm5CMDhZ?=
 =?utf-8?B?MGxaNCsrMy9VRWlHcitOVS9heWQ5QmNsa2lEYUNjS0tqMzMyRUYyTWRhSUw1?=
 =?utf-8?B?c05KUHRRM0N4aGlsSWdqdEZycjMrN2xJaFdHSkZ6dlFzUFZGUDUrSHNaUS83?=
 =?utf-8?B?UTdEZlZBNk9TMVRmVWp6bERHcG9MOG5HQmZpTlVMbmhmTzdnTjU1QnV5SzNU?=
 =?utf-8?B?Ry9qcVZIRWRSTG9aUXFGZStTSjBiQlRWZjFRZkhqYld5QW9KZkZoY3FrcHN6?=
 =?utf-8?B?MGlMRzQ4aXR0ZkE4T2t2ckpteDVyeUlLYmdaam9tUFl6ajRyUTBtRU1BU2Rk?=
 =?utf-8?B?NERqaFJOVU12bXJ2UStFdTRiRXlnYkFvR2M5RkY4YUwxbllsa09sR2FTbnAz?=
 =?utf-8?Q?Tb1ZlPYjlj6qX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cbfc7d4-631a-4743-e3f8-08d9922b9601
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:36:55.1679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55dR+0DOlP7nJ9mc98OZiMQsWiilyxbUQgnxxXafbm12vGs/oYeIRQWQI8QS/81p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1149
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

Am 13.10.21 um 16:42 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
>
> When CONFIG_COMMON_CLOCK is disabled, the 8996 specific
> phy code is left out, which results in a link failure:
>
> ld: drivers/gpu/drm/msm/hdmi/hdmi_phy.o:(.rodata+0x3f0): undefined reference to `msm_hdmi_phy_8996_cfg'
>
> This was only exposed after it became possible to build
> test the driver without the clock interfaces.
>
> Make COMMON_CLK a hard dependency for compile testing,
> and simplify it a little based on that.
>
> Fixes: b3ed524f84f5 ("drm/msm: allow compile_test on !ARM")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/msm/Kconfig  | 2 +-
>   drivers/gpu/drm/msm/Makefile | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index f5107b6ded7b..cb204912e0f4 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -4,8 +4,8 @@ config DRM_MSM
>   	tristate "MSM DRM"
>   	depends on DRM
>   	depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
> +	depends on COMMON_CLK
>   	depends on IOMMU_SUPPORT

We also need a "depends on MMU" here because some automated test is now 
trying to compile the driver on parisc as well.

I have absolutely no idea how a platform can have IOMMU but no MMU 
support but it indeed seems to be the case here.

Regards,
Christian.

> -	depends on (OF && COMMON_CLK) || COMPILE_TEST
>   	depends on QCOM_OCMEM || QCOM_OCMEM=n
>   	depends on QCOM_LLCC || QCOM_LLCC=n
>   	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 904535eda0c4..bbee22b54b0c 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -23,8 +23,10 @@ msm-y := \
>   	hdmi/hdmi_i2c.o \
>   	hdmi/hdmi_phy.o \
>   	hdmi/hdmi_phy_8960.o \
> +	hdmi/hdmi_phy_8996.o \
>   	hdmi/hdmi_phy_8x60.o \
>   	hdmi/hdmi_phy_8x74.o \
> +	hdmi/hdmi_pll_8960.o \
>   	edp/edp.o \
>   	edp/edp_aux.o \
>   	edp/edp_bridge.o \
> @@ -37,6 +39,7 @@ msm-y := \
>   	disp/mdp4/mdp4_dtv_encoder.o \
>   	disp/mdp4/mdp4_lcdc_encoder.o \
>   	disp/mdp4/mdp4_lvds_connector.o \
> +	disp/mdp4/mdp4_lvds_pll.o \
>   	disp/mdp4/mdp4_irq.o \
>   	disp/mdp4/mdp4_kms.o \
>   	disp/mdp4/mdp4_plane.o \
> @@ -117,9 +120,6 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>   	dp/dp_audio.o
>   
>   msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
> -msm-$(CONFIG_COMMON_CLK) += disp/mdp4/mdp4_lvds_pll.o
> -msm-$(CONFIG_COMMON_CLK) += hdmi/hdmi_pll_8960.o
> -msm-$(CONFIG_COMMON_CLK) += hdmi/hdmi_phy_8996.o
>   
>   msm-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
>   

