Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E20BC0C68E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:47:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F1110E411;
	Mon, 27 Oct 2025 08:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="bVpycChD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010012.outbound.protection.outlook.com [52.101.84.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD5F10E40D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:47:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtcU+5u3WwKhcHRJuHSdpz0D7YAhBVHVpwJ3QR8syJTqlU1WIx5ngNlbdP3n4gDgxt/J+Nm2bYB5Kls4kW7uju6gQwwGWkFkYjo6LEIeuUmBUIrp18BipX2PCsavMCiUC4sjem39cd2pErFew+5fozYAJzpoHoVNzJD127y7qHBxAE8PE214HxTXq/dQk7LoC/YXbxpxz8Za3lJhfww0wwM7jqCaI5tePmXf5U+Fr1+UbR7ddOpxFNwkRQXxyK5wwAUpr1iRpg6D/NUkx2+DFEFmJOdECjeITUEFA3R82Yzh+qreEHpZ0f0H5NBn3FkydS98HY7yfeITb5gk/vMJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsrigFOoVP039rn2Z7hnXpFlJwbipkD2jFQU9mOx2eY=;
 b=STqdeEEG69BOi67UJfbRICpoXSqEvA/tJRDvLgJ4dXmX2jyK0DVAjxCqEAi9g0MGuW39ou3xRMGO+0REkDKpRmfx2oF9zQH1MMRjXk5ZpNdwqqCekpdM8qrYU6UpOtLkZzYWXdl38pRdzUMlMmnIo34LNkyoobLSkbPOSxSZ/ZbH6zsPXMaO8DoMQ31C5BQZSFEqD+3p6LQ84KSmCceoANUduHahwnLtWfSKxM75oA+FR0Q+zC35uJjkcyO8nVwTa+MclIPlpJA/qadL6b0RVYQI+76N3qNCefmdscewpyYa+5fwNlHEgWS5DI+dX2591+veZr2ZM/MITPYWuedy2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsrigFOoVP039rn2Z7hnXpFlJwbipkD2jFQU9mOx2eY=;
 b=bVpycChDuSK+XM6Y6UYOLS5w//zQsXtjyVHZIIohRCF/iAtasAY8oiAzwYeQ45468S5POGA6u6y3ItbF7RRWC7hzQK+GXzhQSvANqKFgWY5NxPotUuNTNSop5oZ2soXBOoYv00NXv52fqxXUjoZl0DbO5d/T8ZGo7ohxwS2Ko2Xise16et/O0KmiQqNP6U+pxQ9842+SZTnMuQSm4QX2flqIXLumDxN4jqyH6jprg2FdVJJL4mWQtuFM3AJcgsJfqmZ6xBjCW6avWyqHFZc8dOdm/R5Xtp9rq03HZPyKEEd2k31TLERrNylQNouAs+VFG5Fa2JAstQHd8pbpX+KQRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8739.eurprd04.prod.outlook.com (2603:10a6:20b:42c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 08:47:32 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 08:47:32 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 27 Oct 2025 16:46:57 +0800
Subject: [PATCH v5 07/13] drm/imx: dc: Use TCON operation mode
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-imx8-dc-prefetch-v5-7-4ecb6c6d4941@nxp.com>
References: <20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.com>
In-Reply-To: <20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: 59eadfbb-5c00-4bfb-eb67-08de153577d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|1800799024|52116014|7416014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjBubUo3WlBnK3htcHByS3IrdFRKcTYwOWE1ZHJJWG1aT2xmUWt1UFN2OWdG?=
 =?utf-8?B?MnVGaXRJUG1xWWtBckZUV25rR0ZvRzNVdWdqMy9DNGFtV0RFZFppRjB6TEtF?=
 =?utf-8?B?cEw4MlVmNk5SM1BjYnAwWmpzV2EyTmVYWDZEZlU4cmp6d01mSHpibERqcnhU?=
 =?utf-8?B?SGNrMHh1ek8vWTNSOHV6UEJ6WlJGUmRsMzlkb1p0emJubi85cjhCTlZMTjgx?=
 =?utf-8?B?a3ZkWlhjVWEvVWNmTE02YTVCd3pqWWNnTGt3SGdlT2FOMnVmV3IwcDZCemp0?=
 =?utf-8?B?bTNDTmQ2S3NoeXh0Rm00TEhCemFoVmZaejA3UG8xVDBxdUlsV0JpMFhvKy9x?=
 =?utf-8?B?MVpCaWl2bTVCdm4yanhLTjE5NVZvbWliWDRabWJ4c1NxQmU1Z3R6VjRjcm9i?=
 =?utf-8?B?TElrMzZONlBVUG1DbC9iaDNrcXpwam9wWGhOSHpTSXA3aS9MMjJEaHQyV2ZK?=
 =?utf-8?B?TlgyWi95dkJqUGpGS2tYUHFCbWpsRkQwWVFoVXdrcG9tb3V0ZW9jVzdwc3Z5?=
 =?utf-8?B?NHBoK29jQ2dWejZVaEZBWnJKTEVNWjdJc1NvWHpVbHhXWEl4VTZ3U0FjaWMz?=
 =?utf-8?B?a3FkSXZvYmQ4RFMzcFpyZWJneHBtaVFaZEg0WEsveDA0U0RiaGhyVTVnRnlr?=
 =?utf-8?B?cDV5OUZ6K0JvbWJ2dFhVVDNFYlp0N3RDb25NQlBUL1ZaY3JwK1pGODlnOUZN?=
 =?utf-8?B?TUFWdmZ6VVpSOWl3L3NVY2swZ1JtRFNnbmVxSGhLUTZvRWJtd0VTTnhKdnhw?=
 =?utf-8?B?cmdCUGVsM2FrSWpZcTM1MlpXY1NHZFdCblB1azN5MngwOVFQek54UE5sS2xI?=
 =?utf-8?B?Uk9vNi9xaitUbUFWWVJSTDBqRVU5Tnh3UXNYbFpYQUhBQ0lqRy9sdlJRWVk4?=
 =?utf-8?B?aXNzNU16U2hPbzVNbkpxZXRDTXRUam8xaTVHQlVXRklwVjBZWFJYOGFOWjVX?=
 =?utf-8?B?NjJlRGR6NFhuMjVidEJaSjl1cXpoditmckFyemRnaW9pOWFjdzgyeCtMSkNv?=
 =?utf-8?B?SXlrK3BXczU5VVRvdFQ0dUp0ZzBiV01VRGNtdVJ4R3FyY2ZORkFmUVdLWDdI?=
 =?utf-8?B?dE82Y09yQ3JkR2ZGV3JzaFNvMzVCSGpMdjhRZVJVQXFReCtHSm80T1h1bDU1?=
 =?utf-8?B?eXkzSVVOSy9VUWoxbFlWR1c1N3piWDk1Vm1XdU0ySDU2QU1JZjUzUUoxY09E?=
 =?utf-8?B?aWxvV0VOaFErUjhUeU5mSWJlNVlHZWFRUm4rTWNydTEzR2RvbWVXYzIzYVRV?=
 =?utf-8?B?dkVVQUhjNDBDMVVjWG1oODVlNWJuNjYzRTM5WjdsazYvcUxxeHBTZ2pMTVZL?=
 =?utf-8?B?alNwcXovcHFpSVIwcFpadkF3TVY4NFBYNHNQaCtjVjZEbW5CUWJkeUxWS3hV?=
 =?utf-8?B?REc5YWw2cDVVbStYdGFsK3cvSlpGNHN6bG9NMUJNRk5ZR2FuZDFmam5qZVpO?=
 =?utf-8?B?WjB4MjBUS2JxU2Y0aSt1djNTZkpKL3ZybnBybysvWFd3d0NtdHRPZ3ozU0Uy?=
 =?utf-8?B?YzBmOXcyam5QNFlPamhqbzRJaHRXWUt0R0MvbDBUVTBVMFVLU0R2cUVNWUtj?=
 =?utf-8?B?blA2ZzlrdXAyUE9UM0dHaitXYXBJU2dzcWVObHdBR1ZUanRhS2RsVmNZUEtn?=
 =?utf-8?B?NkZMUWY2WnBqR08ySTRoTnU2WDhiNzg2Y29DczhXajhvOWVkQmJuelVBVHl4?=
 =?utf-8?B?SzN5Tk1tRFZwRjhuT0FVck5NV1lpZWtvTVdvVEJnbjEyb1E2b0xFVGwrT29j?=
 =?utf-8?B?TFE1NzkxcVBhNmtMWVNzTEF6bGNIZEhMdTNkaHZ0WGN1TG1iRjgxRXIxK2Fz?=
 =?utf-8?B?S0tQTmYyVjVnSWJPemdYTktTN0oydlFOU0srNmFtWk9qTmVhNllLL3Z5MjZ0?=
 =?utf-8?B?WnR0VUZ6R1drWG1EbGtyenBlbEx5Y1NsclY4SXl3THREeEhFd2hJcXlPUEtm?=
 =?utf-8?B?SWFFd1RzRVhSc1g4aHVkbENrQVpRbktQc21Nc1kvWHdQSnVBbnMyZldKR0JU?=
 =?utf-8?B?S1h0YS9YVHBrZGQyN0hidTkyNEhDbVkvZE0vY05mMUxtekMyZUhHWW9oV0Vr?=
 =?utf-8?B?ekY5MDNnQW1sZ3Zwa0xIRWxSSmxSMWZwbStVUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(1800799024)(52116014)(7416014)(376014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEQwNGY3NVR6Nkw3NThuSDVkVDRlUDNPRFBGNFQydC9LeTNNbmZOd0V4QTB0?=
 =?utf-8?B?Y0dERTdwa2NKdjBYWndTYk5waUFyNmFXU2pWMmNUVGR2UlhuN1JiV1BkdXdN?=
 =?utf-8?B?Z0xnQTh4MFZtNk9kZXJiN1FHbGZjWkhRM3EzYTZ5YjJRdHI4Rm0zTUhkNWZv?=
 =?utf-8?B?SmlYNmU0OFJWVGFKeFhjZW9laFM2RkJaZkZRYUdOYUZUVG42SE5YTjNaWmVG?=
 =?utf-8?B?Q0lQbG1kUEwwbFJLdm0yMU5Pd2ZzeHBwZEprSXBGakowQW1pOURrOVFiQmV0?=
 =?utf-8?B?Nm1FdnVIV2tjd2FvNUdpMjZKYWdFa0UwK1dPdFo4VlhpNFE3aTZCTFc2Qmcy?=
 =?utf-8?B?RDMxQS93SlRoQVZRS0dxRGxsTTlITHJ5SUZqK3ZBd1pIMWRsTHVDTHNVUkFZ?=
 =?utf-8?B?TERkNWM5NklNZ0lPWTFaYjdNQVVIL3dXSGJVMld1RWRyTlV1U1ovSU1wRW04?=
 =?utf-8?B?TDRoVTVtOGxKdm9oUGhiMTdiSjU5MnFjZzhaaEVtcW5Gb2E4U0FKMndkRTho?=
 =?utf-8?B?MzdRSkhwSlZmUVhDL0gxNFhqSDNVeUhsRFAzWmJhb0xDSjd1WmRnZWFnOFlu?=
 =?utf-8?B?VWxIZkpYOGlTWGFISUxGc0ZBWHNsTE1KbWtGN1hWK1VnaWRnODJEdkRoQ3p0?=
 =?utf-8?B?cnZwQlEzVkt5SWRzdHIyZ2licUtSVzdNR0RyUU9vVnFRMC9nSWZqWmI4WDVV?=
 =?utf-8?B?bGFaQjNsbFRmTCtDZ2c4KzJ3TTR4VEh1ZWdoeTV6RnBqcFJtbTBvTTRLS0Zk?=
 =?utf-8?B?NUJ2aXY2aFRqdDg5RS93N2RqSmN4NTlPenJXQWRnWUd4enNiVjFXWFBma0Fx?=
 =?utf-8?B?cXI5ZmFOL0NScUpkMUdWc1ZZR0ZVaUF4VDBLRWMzbHllbkcvRDgxSW9wckhM?=
 =?utf-8?B?VTFIZ3N2M0NxbEhtR1ZneTBDbzAzMFF4c2pHUlRnQ1hZQVgzUnpaV2xPcTZK?=
 =?utf-8?B?R2xYQi9ZWmxTNldUckswTVhuMExCellibm0ycGhHbXNIWHpTc3lPWC9JSURB?=
 =?utf-8?B?OTUwZTJIZmpLV3k3WWtQaVd0TzNybWpDa0xOMEN2d3gzb1Q4QzkzaWFMUXkx?=
 =?utf-8?B?RmpMd3dYSmQ2N1BVY3hhd0dieFY2bnhjMTRYelZPdzNDWHBMMHU0SklISlJK?=
 =?utf-8?B?b1p1RWpuS2RRZ29UQjJ4bG9tT014T0JrdXhmcHAybUI5SzRCUmUvZklWbWww?=
 =?utf-8?B?L0xMZW9YN3Q4eHFNWktucGxOdUpHMG8xSHBPOFltdXFINi80Z1N6SHJNM04v?=
 =?utf-8?B?cTVEYnFZMkExMmlSSm4yNmJPMVRxL0Z6QzFnbEZqa3N4dzE1enRXbEY3K0R6?=
 =?utf-8?B?QXpIeXg3QXp2VDVPN21iYnVxa2x5cmRwS25TZGpIUS9iYWZDMUU0ZExUU2RB?=
 =?utf-8?B?S0NHWTlJSFNaOVR4dHY2TVM1aFVKNjZFMmJmM3JGR3hGdVFXbUxMQ1hMNUdX?=
 =?utf-8?B?YloyVm1PUEovK3k4cnVnam5NMjYyLzljS0tEeVdQSU1aaHZFNUEzU3pENWRZ?=
 =?utf-8?B?VkJkWGx3Z0V0R08xcTZWRTVIdFBzRnYwOG0wZVZJbDBTLzhTWWlENklLcTgx?=
 =?utf-8?B?NWwyL2tCd3dISjRkc3lTUVFvMHBvTy9FWk95VVVRYnJ1VTVhcFM5RVdaakNv?=
 =?utf-8?B?akkyMjdDZklmRlc0c1Y4S1pyR3cwNCtINTE5VzRuR0NGNjNFUStlb3BUT2U4?=
 =?utf-8?B?Z2hiQlY4aHdLNCtoaHlPM1ozV1NuSmlQdEZyelJIMUZ2N3ZYbmxBZVBqZERN?=
 =?utf-8?B?VEVaVGZEWGdKbHpiVGFwckdWK2xzb3NyeWhlemJMTy9qa1ROUDFnOWs3bjly?=
 =?utf-8?B?RU9TZ3JRYWVlU1FVRWRiUDAyVEYzcVBtM1pQMDAwY0Q4NS9oeUV3NzROa2lU?=
 =?utf-8?B?U0NhVHRPNmcrMWVMMW5zYlVTU29GVjNkNTlXSjhPTHBNTUd3MFRWb3hyUk93?=
 =?utf-8?B?S3V4WUFsM0QwbkRqRm8wN2REVVBseTkvOXR3dS9JaUwvejlGZkJjb1hBMGNj?=
 =?utf-8?B?OUs5ZHRITFFsMmhBMVZ6ZEZtVkdoV1pHZFRCbURacTZqYjJGSSs0d1dUd0Fu?=
 =?utf-8?B?VnRKVUdSWmM5YWlYQ1h6OVVPcXRiK2dESktwL1o4VzJRYmhwS2NLYjNqaGly?=
 =?utf-8?Q?UAvnyc7yHW8PSwFQq4hGc3H6E?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59eadfbb-5c00-4bfb-eb67-08de153577d0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:47:32.2371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sCI09N07LLD8rzpvr4X07PyuSW67FICDo99vhZsEQPkYQQBK0UZvg80JG9vxPWJ4zqbN5kck4smrY3JlBETLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8739
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

In TCON operation mode, sync signals from FrameGen are ignored, but
a much more customized output timing can be generated by the TCON
module.  By using TCON operaton mode, generate KACHUNK signal along
with HSYNC/VSYNC/data enable signals.  The KACHUNK signal is used as
a synchronization signal inside the prefetch engine(DPRC + PRG(s),
attached to FetchUnit(s)).  Carefully switch TCON bypass mode to TCON
operation mode when CRTC is being enabled so that the prefetch engine
may evade the first dumb frame generated by the display controller.

Since TCON BYPASS bit is controlled by KMS driver when doing atomic
commits, drop the bit setting when initializing TCON.  This also
avoids accidentally initializing TCON BYPASS bit to 1 when driver
module removing and re-installing where an upcoming patch would
disable a CRTC at boot in TCON operation mode if needed.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-crtc.c |  28 ++++++++++
 drivers/gpu/drm/imx/dc/dc-de.h   |   2 +
 drivers/gpu/drm/imx/dc/dc-kms.h  |   2 +
 drivers/gpu/drm/imx/dc/dc-tc.c   | 114 +++++++++++++++++++++++++++++++++++++--
 4 files changed, 142 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
index 45a87df1ad6a8bd768aa5ed38d6f03f14052b3d7..9e9e86cd5202bcb0bb4d5627dbcefcc3f4e2ead0 100644
--- a/drivers/gpu/drm/imx/dc/dc-crtc.c
+++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
@@ -6,8 +6,10 @@
 #include <linux/completion.h>
 #include <linux/container_of.h>
 #include <linux/interrupt.h>
+#include <linux/irqflags.h>
 #include <linux/irqreturn.h>
 #include <linux/pm_runtime.h>
+#include <linux/preempt.h>
 #include <linux/spinlock.h>
 
 #include <drm/drm_atomic.h>
@@ -68,6 +70,14 @@ do {									\
 							__func__);	\
 } while (0)
 
+#define DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(fg)		\
+do {									\
+	if (!dc_fg_wait_for_frame_index_moving(fg))			\
+		dc_crtc_err(crtc,					\
+			"%s: FrameGen frame index isn't moving\n",	\
+							__func__);	\
+} while (0)
+
 static inline struct dc_crtc *to_dc_crtc(struct drm_crtc *crtc)
 {
 	return container_of(crtc, struct dc_crtc, base);
@@ -229,6 +239,7 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	struct drm_display_mode *adj = &new_crtc_state->adjusted_mode;
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
 	enum dc_link_id cf_link;
+	unsigned long flags;
 	int idx, ret;
 
 	dc_crtc_dbg(crtc, "mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(adj));
@@ -249,6 +260,7 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	enable_irq(dc_crtc->irq_ed_safe_shdload);
 
 	dc_fg_cfg_videomode(dc_crtc->fg, adj);
+	dc_tc_cfg_videomode(dc_crtc->tc, adj);
 
 	dc_cf_framedimensions(dc_crtc->cf_cont,
 			      adj->crtc_hdisplay, adj->crtc_vdisplay);
@@ -273,7 +285,22 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
 	dc_ed_pec_sync_trigger(dc_crtc->ed_safe);
 	dc_fg_shdtokgen(dc_crtc->fg);
+
+	/* Don't relinquish CPU until TCON is set to operation mode. */
+	local_irq_save(flags);
+	preempt_disable();
+
 	dc_fg_enable(dc_crtc->fg);
+	/*
+	 * Turn TCON into operation mode as soon as the first dumb
+	 * frame is generated by DC(we don't relinquish CPU to ensure
+	 * this).  This makes DPR/PRG be able to evade the frame.
+	 */
+	DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
+	dc_tc_set_operation_mode(dc_crtc->tc);
+
+	local_irq_restore(flags);
+	preempt_enable();
 
 	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_safe_shdload_done);
 	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdload_done);
@@ -561,6 +588,7 @@ int dc_crtc_init(struct dc_drm_device *dc_drm, int crtc_index)
 	dc_crtc->ed_cont = pe->ed_cont[crtc_index];
 	dc_crtc->ed_safe = pe->ed_safe[crtc_index];
 	dc_crtc->fg = de->fg;
+	dc_crtc->tc = de->tc;
 
 	dc_crtc->irq_dec_framecomplete = de->irq_framecomplete;
 	dc_crtc->irq_dec_seqcomplete = de->irq_seqcomplete;
diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
index 211f3fcc1a9ad642617d3b22e35ea923f75e645b..c39f2ef5eea98c3eb6ae9b5392f9bf9f7e33e7c5 100644
--- a/drivers/gpu/drm/imx/dc/dc-de.h
+++ b/drivers/gpu/drm/imx/dc/dc-de.h
@@ -54,6 +54,8 @@ enum drm_mode_status dc_fg_check_clock(struct dc_fg *fg, int clk_khz);
 void dc_fg_init(struct dc_fg *fg);
 
 /* Timing Controller Unit */
+void dc_tc_set_operation_mode(struct dc_tc *tc);
+void dc_tc_cfg_videomode(struct dc_tc *tc, struct drm_display_mode *m);
 void dc_tc_init(struct dc_tc *tc);
 
 #endif /* __DC_DISPLAY_ENGINE_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-kms.h b/drivers/gpu/drm/imx/dc/dc-kms.h
index cd7860eff986a272f6983ad0f3cc87dbf40c2851..a25d47eebd28792e4b53b4ecc89907ce00430c2c 100644
--- a/drivers/gpu/drm/imx/dc/dc-kms.h
+++ b/drivers/gpu/drm/imx/dc/dc-kms.h
@@ -50,6 +50,8 @@ struct dc_crtc {
 	struct dc_ed *ed_safe;
 	/** @fg: framegen */
 	struct dc_fg *fg;
+	/** @tc: tcon */
+	struct dc_tc *tc;
 	/**
 	 * @irq_dec_framecomplete:
 	 *
diff --git a/drivers/gpu/drm/imx/dc/dc-tc.c b/drivers/gpu/drm/imx/dc/dc-tc.c
index 0bfd381b2cea15444c399f3ad261e2d061ea1c9f..6f1dc71f1b40cb4d99ca177172bd0066f39e8314 100644
--- a/drivers/gpu/drm/imx/dc/dc-tc.c
+++ b/drivers/gpu/drm/imx/dc/dc-tc.c
@@ -9,11 +9,30 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include <drm/drm_modes.h>
+
 #include "dc-drv.h"
 #include "dc-de.h"
 
 #define TCON_CTRL	0x410
-#define  CTRL_RST_VAL	0x01401408
+#define  SPLITPOSITION_MASK	GENMASK(29, 16)
+#define  SPLITPOSITION(n)	FIELD_PREP(SPLITPOSITION_MASK, (n))
+#define  DUAL_SWAP	BIT(15)
+#define  MINILVDS_OPCODE_MASK	GENMASK(14, 12)
+#define  MODE_4PAIRS	FIELD_PREP(MINILVDS_OPCODE_MASK, 0x1)
+#define  LVDS_CLOCK_INV	BIT(11)
+#define  LVDS_BALANCE	BIT(10)
+#define  LVDSMODE	BIT(9)
+#define  ENLVDS		BIT(8)
+#define  INV_CTRL_MASK	GENMASK(7, 4)
+#define  BYPASS		BIT(3)
+#define  TCON_SYNC	BIT(2)
+#define  CHANNELMODE_MASK	GENMASK(1, 0)
+#define  CTRL_RST_MASK	\
+		(SPLITPOSITION_MASK | DUAL_SWAP | MINILVDS_OPCODE_MASK | \
+		 LVDS_CLOCK_INV | LVDS_BALANCE | LVDSMODE | ENLVDS | \
+		 INV_CTRL_MASK | TCON_SYNC | CHANNELMODE_MASK)
+#define  CTRL_RST_VAL  (SPLITPOSITION(0x140) | MODE_4PAIRS | LVDS_BALANCE)
 
 /* red: MAPBIT 29-20, green: MAPBIT 19-10, blue: MAPBIT 9-0 */
 #define MAPBIT3_0	0x418
@@ -25,6 +44,16 @@
 #define MAPBIT27_24	0x430
 #define MAPBIT31_28	0x434
 
+#define SPGPOSON(n)	(0x460 + (n) * 16)
+#define SPGMASKON(n)	(0x464 + (n) * 16)
+#define SPGPOSOFF(n)	(0x468 + (n) * 16)
+#define SPGMASKOFF(n)	(0x46c + (n) * 16)
+#define  X(n)		FIELD_PREP(GENMASK(30, 16), (n))
+#define  Y(n)		FIELD_PREP(GENMASK(14, 0), (n))
+
+#define SMXSIGS(n)	(0x520 + (n) * 8)
+#define SMXFCTTABLE(n)	(0x524 + (n) * 8)
+
 static const struct dc_subdev_info dc_tc_info[] = {
 	{ .reg_start = 0x5618c800, .id = 0, },
 	{ .reg_start = 0x5618e400, .id = 1, },
@@ -33,6 +62,8 @@ static const struct dc_subdev_info dc_tc_info[] = {
 static const struct regmap_range dc_tc_regmap_ranges[] = {
 	regmap_reg_range(TCON_CTRL, TCON_CTRL),
 	regmap_reg_range(MAPBIT3_0, MAPBIT31_28),
+	regmap_reg_range(SPGPOSON(0), SPGMASKOFF(4)),
+	regmap_reg_range(SMXSIGS(0), SMXFCTTABLE(3)),
 };
 
 static const struct regmap_access_table dc_tc_regmap_access_table = {
@@ -47,7 +78,7 @@ static const struct regmap_config dc_tc_regmap_config = {
 	.fast_io = true,
 	.wr_table = &dc_tc_regmap_access_table,
 	.rd_table = &dc_tc_regmap_access_table,
-	.max_register = MAPBIT31_28,
+	.max_register = SMXFCTTABLE(3),
 };
 
 /*
@@ -60,10 +91,85 @@ static const u32 dc_tc_mapbit[] = {
 	0x13121110, 0x03020100, 0x07060504, 0x00000908,
 };
 
+void dc_tc_set_operation_mode(struct dc_tc *tc)
+{
+	regmap_write_bits(tc->reg, TCON_CTRL, BYPASS, 0);
+}
+
+void dc_tc_cfg_videomode(struct dc_tc *tc, struct drm_display_mode *m)
+{
+	int hdisplay, hsync_start, hsync_end;
+	int vdisplay, vsync_start, vsync_end;
+	int y;
+
+	hdisplay = m->hdisplay;
+	vdisplay = m->vdisplay;
+	hsync_start = m->hsync_start;
+	vsync_start = m->vsync_start;
+	hsync_end = m->hsync_end;
+	vsync_end = m->vsync_end;
+
+	/*
+	 * Turn TCON into operation mode later after the first dumb frame is
+	 * generated by DC.  This makes DPR/PRG be able to evade the frame.
+	 */
+	regmap_write_bits(tc->reg, TCON_CTRL, BYPASS, BYPASS);
+
+	/* dsp_control[0]: HSYNC */
+	regmap_write(tc->reg, SPGPOSON(0), X(hsync_start));
+	regmap_write(tc->reg, SPGMASKON(0), 0xffff);
+
+	regmap_write(tc->reg, SPGPOSOFF(0), X(hsync_end));
+	regmap_write(tc->reg, SPGMASKOFF(0), 0xffff);
+
+	regmap_write(tc->reg, SMXSIGS(0), 0x2);
+	regmap_write(tc->reg, SMXFCTTABLE(0), 0x1);
+
+	/* dsp_control[1]: VSYNC */
+	regmap_write(tc->reg, SPGPOSON(1), X(hsync_start) | Y(vsync_start - 1));
+	regmap_write(tc->reg, SPGMASKON(1), 0x0);
+
+	regmap_write(tc->reg, SPGPOSOFF(1), X(hsync_start) | Y(vsync_end - 1));
+	regmap_write(tc->reg, SPGMASKOFF(1), 0x0);
+
+	regmap_write(tc->reg, SMXSIGS(1), 0x3);
+	regmap_write(tc->reg, SMXFCTTABLE(1), 0x1);
+
+	/* dsp_control[2]: data enable */
+	/* horizontal */
+	regmap_write(tc->reg, SPGPOSON(2), 0x0);
+	regmap_write(tc->reg, SPGMASKON(2), 0xffff);
+
+	regmap_write(tc->reg, SPGPOSOFF(2), X(hdisplay));
+	regmap_write(tc->reg, SPGMASKOFF(2), 0xffff);
+
+	/* vertical */
+	regmap_write(tc->reg, SPGPOSON(3), 0x0);
+	regmap_write(tc->reg, SPGMASKON(3), 0x7fff0000);
+
+	regmap_write(tc->reg, SPGPOSOFF(3), Y(vdisplay));
+	regmap_write(tc->reg, SPGMASKOFF(3), 0x7fff0000);
+
+	regmap_write(tc->reg, SMXSIGS(2), 0x2c);
+	regmap_write(tc->reg, SMXFCTTABLE(2), 0x8);
+
+	/* dsp_control[3]: KACHUNK */
+	y = vdisplay + 1;
+
+	regmap_write(tc->reg, SPGPOSON(4), X(0x0) | Y(y));
+	regmap_write(tc->reg, SPGMASKON(4), 0x0);
+
+	regmap_write(tc->reg, SPGPOSOFF(4), X(0x20) | Y(y));
+	regmap_write(tc->reg, SPGMASKOFF(4), 0x0);
+
+	regmap_write(tc->reg, SMXSIGS(3), 0x6);
+	regmap_write(tc->reg, SMXFCTTABLE(3), 0x2);
+}
+
 void dc_tc_init(struct dc_tc *tc)
 {
-	/* reset TCON_CTRL to POR default so that TCON works in bypass mode */
-	regmap_write(tc->reg, TCON_CTRL, CTRL_RST_VAL);
+	/* reset TCON_CTRL to POR default except for touching BYPASS bit */
+	regmap_write_bits(tc->reg, TCON_CTRL, CTRL_RST_MASK, CTRL_RST_VAL);
 
 	/* set format */
 	regmap_bulk_write(tc->reg, MAPBIT3_0, dc_tc_mapbit,

-- 
2.34.1

