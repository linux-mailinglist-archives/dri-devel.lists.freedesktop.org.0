Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE9B595B23
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 14:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61A312ABB7;
	Tue, 16 Aug 2022 12:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50061.outbound.protection.outlook.com [40.107.5.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF4B12B7F7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 12:01:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKLf26A+fI1AQ5OyA1X1XqeVFsTh1o4KiaGRWK7SOT/a8LTr5SYmNoy0xnZ4kKhH0fIvv4EFueAdBtlwq5+AFfHtuPfzbqsuFS5qIJ7eQDxkU9corz7hEqOk7HJF3kufHeQDhQg1XbzS7VD5AntGJFStmY5GVb6t+v3grxEHT2dKjTbghWTriFBoiUi3YIIPTXJYGhFKsDsVPSXSfZdwS4p+5P97daUGoOFiV4R1bnCwbfKk6/9SAB5SCnbu+iqSYs+QSf53A9VChDl5zCjNpf1xZlls2yPGEbJwRD/FwTEWHmRhoimfzxGtH9YDXfVo50cfDZWQEo5Tzk8avmDqNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atXSosF8+6VTjPYqzEoAnOxTuxvKASw3GipVy49df5o=;
 b=MqazB7heFzZpMOUstR+9loBM+DT9mfGoOcYPWoQvyhBPO4tsYpx+UH8ow4zZz85Px8UO0b55tzqAo/E7jYlU4p4Yd42dCVVFdcQ9RLtV4FMMytZpYIejX5Ov4MdJZywmSgyKWiISDRN/gxZIcr5UQyrZfgw/e4jkkdq4DSBhiHaCAsDuDy5YauZuS9DY7Mmk7Yg58KD0g9FmI/61oqjQ91rIV3xLDBC3+L4DFH3PiGwQ9RNy00VQuWa6LCJy437ZLn3gSkPaOTfmAo5LmGrTnSt3mQJHl8IpzHLryvv1ZNs+YJ53ltwHmUd2N69zcgDSFIpE+IINyFPKeLPihADV+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atXSosF8+6VTjPYqzEoAnOxTuxvKASw3GipVy49df5o=;
 b=2P8ZoPfEJEyaBOvWDqPP3VeWMLNbITzm0zBbXo0vi1XO/OcZQqrUrYU3L0fpQh/Jxln+fWKxrBybJx2XRDcITbyekVAv3wQnp7MOgDRCnzJ+yjMhYAkoywAZcp/CUBSrFmjO3M5eq/8tasCTVY4UcEQDlpwPnchG2YV8lVdxLdY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from AM4PR0802MB2131.eurprd08.prod.outlook.com
 (2603:10a6:200:5c::22) by AS8PR08MB6678.eurprd08.prod.outlook.com
 (2603:10a6:20b:398::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 16 Aug
 2022 12:01:57 +0000
Received: from AM4PR0802MB2131.eurprd08.prod.outlook.com
 ([fe80::dcaa:905c:ff8:1f5b]) by AM4PR0802MB2131.eurprd08.prod.outlook.com
 ([fe80::dcaa:905c:ff8:1f5b%9]) with mapi id 15.20.5525.010; Tue, 16 Aug 2022
 12:01:57 +0000
Message-ID: <84b0c9fd-2ea7-318a-474f-c4dc2c504d88@wolfvision.net>
Date: Tue, 16 Aug 2022 14:01:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/rockchip: vop2: Fix eDP/HDMI sync polarities
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220815133942.4051532-1-s.hauer@pengutronix.de>
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20220815133942.4051532-1-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P189CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::31) To AM4PR0802MB2131.eurprd08.prod.outlook.com
 (2603:10a6:200:5c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39f40a2a-d94a-432d-118e-08da7f7f1e10
X-MS-TrafficTypeDiagnostic: AS8PR08MB6678:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rr269i88y9RVoujRs8sK9Z8r1KZhBYXEDc/MsDYmbhXwLu2zBwVbXKfKuF5T7I51J15hQ4ph5t5KKfpY58w723an/56L0T2srehBARcffqO79JeqyZ+T15OtP+W9FSTUz//bI7jwwv41Vhd5NlowlIN9SCl134MbetBepfPGJheKwD+SFsgAqRp3raL1bvooAKlQ0jr59jGt7tVDxfFZeKh/l9C/xYvNe+IQs/AQj/EUpJXxhXD70MWeyZA3aB4lOu+gajBJxJzHEu9PHZ/Y+uSgvfCfyuUM0SssJigWY9J4N2FoKlsryPNGd5tMEXe60cwC5aPG8REMuKPsnykxuZVkJaL3P3/HOpNyWIiZEB2HjnBfuSUMT+rbpxv0nM3epLPfAyR+Y+llX2IbzV4cKjR1MSioo2I2+VXSrNCw31uTR8YJnjm/EOtq/V9pfW9HRP3UkSPkjU+M3dT5SjbRSW2D71XxnlC+J1ibIvIV+s27v68qaGgiaAN2gRu4ac8rvbAOxAHpuuSq4TfPzPtkhvAG/jzl5OFYYpxHOS6GxXfRzzCsJ6/lndR6MeLx0VdWx4ng2gL91KHNyoe4CQ00+e1n8RhUBmcFzxsPMsrN6lV81U2aQf7F5H16sKx9LDBwx8rbOzdcChTdW3Bq9wI5DJNZO/6RBk4ovn1s/KtYSfsF/8McL1Qe0c7moLRrTf6d75Fpu0B31nwiNtlhBUNspTM1TyYMaxFahQCdFHyLaD6UWhWYPTPtmmUgTE/KrzuC5QUbjl4WN4t/w5UM61DEPSwFx3ffo7N+czMFk/9eCPOMaDybfCvBLnJ15L4/4hfm3dGkQD7l9yEknuvCa9o9XOsFvfBzCZExcaZTsTmW//s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM4PR0802MB2131.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(366004)(376002)(39850400004)(136003)(38100700002)(8936002)(83380400001)(38350700002)(86362001)(31696002)(66556008)(66476007)(4326008)(66946007)(316002)(8676002)(54906003)(2906002)(26005)(5660300002)(6512007)(53546011)(52116002)(36916002)(41300700001)(6506007)(44832011)(186003)(2616005)(478600001)(6486002)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ems4MmNTbG5GMWxUUkhqMUlCMUxmdTVqMERTUzB2Z1U5SjU3eW5udXFlb21y?=
 =?utf-8?B?d1ZUeEVmZ3NnMVRaQmFHZXdteXVmM3dBZlhDV2lySitPR0plcEZjQzBWRWxn?=
 =?utf-8?B?aFd2UFN0L0REM2hVY3JjcTlqRng0Q1gxbUhWVzVqa3MybFBNenVUclllaUVz?=
 =?utf-8?B?U1ZUUkMxcGhtYnBxaysyR29kTUJuYkNhZm1POHFRRFdiaG56TllNWHVnaEJH?=
 =?utf-8?B?dEpJa2JiaTQxVDVoZHFDWGg1NUxqR29KbEhoQWpuZmZTNXg5SXdlREtOQzdI?=
 =?utf-8?B?RlBnK3lCVkFUc2ZEY25VK1FaRWZjczlmdG42T2pjWnFVdVZjbHh3c21LS3FG?=
 =?utf-8?B?ZUZRZkhJTCtydENTM1VKSE5PVUhKUmF1bHlWU09JRHJyalVtYkdWZ1c3VFFX?=
 =?utf-8?B?dTFpeVEzejdNWWJqaDk2cTNlWURidjZ4RzVCVlArcFVEZlV4UDBpMXV4V3JJ?=
 =?utf-8?B?eFFrcUFhY0Y4WUZQMmcvQXBvamNvaG5UcC8yQSs1azcvSHo4ekE5YktaN3ow?=
 =?utf-8?B?Q3N1RkZMeS9qRXFsV2tqdDFpV2JKU0tFaVgrRXdpSWQ1MkUvdnpqNStOeHZl?=
 =?utf-8?B?Y2FsdWpxbDdYZjcyVGhmNGNsQWJYTWZXaWhncmowMXU2WDQzT3JDc1VYdkh5?=
 =?utf-8?B?d1FNVVVZajkweGJwRTBVSDFYQWs5Slg4TC8wL1hJYVNwemZzbXhJUjltd1FS?=
 =?utf-8?B?OE8wOU1VVXNWSDdVYTdkTDRGVUh6YUVFMHFKdEUxSzNwR04xMXV3ditqM0RJ?=
 =?utf-8?B?RUhadFBTdFFNV3BoMERiK21qTGw2VjVLM1YxZWpvaWlQUVNCblFWWU9RNm1J?=
 =?utf-8?B?dnJuVXNaOFdYWWo3elptV095ZUhNWmNoMXVlV2dQK2pRNU1mNTRXR0YwU2NC?=
 =?utf-8?B?c1FtRVIvbGh4R3dYbU9OZ3FkWXVwcWJTVGRVeFhhWjVoTVIwTmRvdzBaMkdm?=
 =?utf-8?B?d1ZRVE5JRnlmYm9ZNGRZQnJ1UFBXY2JIOEJLMzVRc1BqRGJtcXQ2RTBka0Js?=
 =?utf-8?B?S2xSNUR3YWRoSTVabHlYV0EyaTFMdnJ4RGMxU09EeGdWYmo2TUtQczBNK0NM?=
 =?utf-8?B?emc5V3l2bDVKZkdjT0FsN2k4Sm90N25VMWYvNW9oQ2ZOWXEvRjB3ODluSWxN?=
 =?utf-8?B?ZEVoU2FqZ3FHeVZnQVZoSGVsODk5YVg3RS9QYWtCM2VDR2xjWmdzRU9BQ1N0?=
 =?utf-8?B?K0tmT2JyN1RJN25hRHN6RWkzbU9SSVIwTXFkYUtSM1kyWEZXODFjUml1NnRz?=
 =?utf-8?B?ZXgxcDNvWTdaSEZHT2pUelo1cld2YXY1RUtxdDZmeEUyeUZBR0tONUY3R3ZQ?=
 =?utf-8?B?TTJPbTdUQ2lIaHcwYTB1MzdZSERUYllJaTBXK3d6eFplbVE1ZmlEUmxvTUhV?=
 =?utf-8?B?dmJqblh1aGM3ZEVJSVE2WHo5WDYxaUI1b2lYaUpxcC9sb2VqMTJQTGJXZnVT?=
 =?utf-8?B?OHpuUGtLb3R4dkhqU2M3WS8zREd2OFdOT3BlSlJ5bDRGZnJBc3lDbHBKbjc3?=
 =?utf-8?B?K0hEK1llWUUyK0RUVHJENHNzQitKaS9mYnJVNmgrczBGVmhOZXJmYXFHVGMy?=
 =?utf-8?B?dDlIa2twVkk5VDBhQ0NhSXM1TGo1cXJXSXJjNmU2eDJJa3V1OHF2RVVJRFFx?=
 =?utf-8?B?NTJwWXVTMVptTHFoalpzdUY1VjltUVpuZG1lSkd1Wll6VVJnSzdMdFV4RnBv?=
 =?utf-8?B?NUI4bElHU0JXQVB2aGx4cTNOeFVMU3dvanN5ZTN6NlVjQXlYQzBNak1UMGg5?=
 =?utf-8?B?YVVmYTkrd1NNYTlzN251MzJCUHIrSTZ6MWR6N2ViTmpUWHNWci8xSlVFcUJh?=
 =?utf-8?B?dWV1R085ZWd6QzZEWHZKcWNhYU1OTlNJWVBmOVByK2RqVmNUVzdiUm9NS2Fm?=
 =?utf-8?B?NmVydzNqM3ZxRFVEYVBjTkt2T1B1Rk5QMDR0QW9UUGJkUkRyN0xTM2dab2ps?=
 =?utf-8?B?R2F0WVQ0NFdLRDNVeTZFLzdEdjRXSU8wNzN0bk0rdW96cTVpVVF0RUl6QmZ6?=
 =?utf-8?B?YWg1aXhrV21zTU5UUk51TmFKZWFqTTRxRkI4cUR1ZHlhV3JCaCtYUDNld3hH?=
 =?utf-8?B?K05tR1NJVTkxeTJ0b01STGFrMkpKRFhlUWYzUGNtWklhS00zUVl5YWdaTjdz?=
 =?utf-8?B?cjB6dWZ2ZWhKZG9vN0lFNzZPekZWSW1ic0hWVTNYcTd2RXUyakhzNk9jQWNU?=
 =?utf-8?B?MWc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f40a2a-d94a-432d-118e-08da7f7f1e10
X-MS-Exchange-CrossTenant-AuthSource: AM4PR0802MB2131.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 12:01:56.9540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y60gL9Q5chOveqoRx4iBH3LLHNXmZC6y+bszgmE1oqoROmwpJ0wow28w0NDTlY34uiKeVg84/qHBKY/Bqti6/peqkjQVKt8+W58iGAtR3bM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6678
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
Cc: Sandy Huang <hjc@rock-chips.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha,

On 8/15/22 15:39, Sascha Hauer wrote:
> The hsync/vsync polarities were not honoured for the eDP and HDMI ports.
> Add the register settings to configure the polarities as requested by the
> DRM_MODE_FLAG_PHSYNC/DRM_MODE_FLAG_PVSYNC flags.

Amazingly enough it worked even without this fix in my setup (Radxa
ROCK3 Model A + HP 27f 4k monitor). Hence I can only say that this patch
does not break anything in my setup :-)

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver") ?

> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Tested-by: Michael Riesch <michael.riesch@wolfvision.net>

Thanks and best regards,
Michael

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index e4631f515ba42..f9aa8b96c6952 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1439,11 +1439,15 @@ static void rk3568_set_intf_mux(struct vop2_video_port *vp, int id,
>  		die &= ~RK3568_SYS_DSP_INFACE_EN_HDMI_MUX;
>  		die |= RK3568_SYS_DSP_INFACE_EN_HDMI |
>  			   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_HDMI_MUX, vp->id);
> +		dip &= ~RK3568_DSP_IF_POL__HDMI_PIN_POL;
> +		dip |= FIELD_PREP(RK3568_DSP_IF_POL__HDMI_PIN_POL, polflags);
>  		break;
>  	case ROCKCHIP_VOP2_EP_EDP0:
>  		die &= ~RK3568_SYS_DSP_INFACE_EN_EDP_MUX;
>  		die |= RK3568_SYS_DSP_INFACE_EN_EDP |
>  			   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_EDP_MUX, vp->id);
> +		dip &= ~RK3568_DSP_IF_POL__EDP_PIN_POL;
> +		dip |= FIELD_PREP(RK3568_DSP_IF_POL__EDP_PIN_POL, polflags);
>  		break;
>  	case ROCKCHIP_VOP2_EP_MIPI0:
>  		die &= ~RK3568_SYS_DSP_INFACE_EN_MIPI0_MUX;
