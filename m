Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 581DF99C5F5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 11:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD5610E152;
	Mon, 14 Oct 2024 09:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="C1l9dZsk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9AB10E152
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 09:40:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P1C6ISiulvRFMBuk/Bk8lXMYrj4KdtTBdlXZus+ze378mJAtqOiLE0oU1rEzlYJxftHFICn9IsvYfcM2xzP08nY+bVGZPgqnTDgEcgUIPw+SopXEFfDNz5rfEpRmPPs44et43ORc/VNRBh7SgJY/273snVQQxMWChVQJ/IUy7+nGqNeKi/yHSPdrNAUM2i7xWbzTGVNzN7yDr/CHRPROeud0iqajWcMz1CAbtg56odlQnvZNiyAY6Vi8q8vYcw4qahN8V0OntSBHdkp5LC2l9DaAld8igMezui+M+z5XZMaFjLUEQieezUFg1s/sWA8gawFY8rAwnw7ngZHMBYbkNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgN+835PjLn5CUeZW2Sv2rBl2MJpdY1l6W19UsiZbX8=;
 b=s+EI9Y+k4QJvBu7QWafl8Llykp6mNZZrFp8VwEX/q+7q0UX2Yo6+CNu6YcXi1gISsQrmaufosNjmE0L9WldEaUiAVl07oDYp3VssRlGRtbGARN65m+CJARKhRvACvSnRMzELdJ7Rbz7+6B4fT+ohN08nQvFn1JrTvO4D7GU8bVJ/tVy3wqcIQUj46vy2IFnNUffDQIRyd4o/jNB5NY1KGZs3Tv6Aa4TYhx8lCNs6bW580PH9m69HsWeVdvxWdJcpNh00xDjf58mA2ZPGphgJTt2ViQ55cXqihRa5dX2ryIWFHSb0JFFRXyyJAyGjMVpknkm+R6+RLKYDNOTu1puu8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgN+835PjLn5CUeZW2Sv2rBl2MJpdY1l6W19UsiZbX8=;
 b=C1l9dZskL7AUyFCJPEsd244pgVjtuhuywCcG0OVRWPr2VtpT82z2KUWpsDuEYi6r1s7MtlYcsAls8jRbdh7CpNN9OFvO1+tmIHfbPubK7FjZHSDgGaQJIJ6f/u046wwYRLxRaz1Lx/YgAbm2gIfywKlqIED4VPthpPQ7R8P9ZLK7UtrqvPttmojCG4BEZPAi2AUeGvAlhTiaIj+lAWWoRs45+GKIDWudJVlAGarpDtirP0dDfFDaEHTQUrRIyVgcVqnDAgnjB2NIDR26xpjl649XAeXWKsyPiAm5DHXemUDGckCOomWQ1l3616uI+IwWzj+zBnD6/qP3zQ+lMtpdfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 09:40:20 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 09:40:20 +0000
Message-ID: <67868643-570d-45d9-b9c8-c90efcf6a2c2@nxp.com>
Date: Mon, 14 Oct 2024 17:40:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] drm/bridge: fsl-ldb: Use clk_round_rate() to validate
 "ldb" clock rate
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com,
 geert+renesas@glider.be, dmitry.baryshkov@linaro.org, arnd@arndb.de,
 nfraprado@collabora.com, o.rempel@pengutronix.de, y.moog@phytec.de
References: <20240930052903.168881-1-victor.liu@nxp.com>
 <20240930052903.168881-5-victor.liu@nxp.com>
 <2on4bu5jsxvaxckqz3wouwrf2z6nwbtv34ek4xda2dvobqhbsf@g7z7kxq5xrxi>
 <5fb80bf6-96be-4654-bd54-dc4f1d5136ae@nxp.com>
 <20241011-mottled-translucent-dodo-8877e6@houat>
 <6be9d2ac-7e0b-4b6a-885d-ad40158a2998@nxp.com>
 <20241014-meteoric-acrid-corgi-f81a04@houat>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241014-meteoric-acrid-corgi-f81a04@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::29)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: ec837fec-4191-466a-ecae-08dcec3437e4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmxPeHpheWFnRU1WRGhXQzhPWllvUmtmczY0cEhkbXJJazFCQVpXWWRoakZ1?=
 =?utf-8?B?cHZlRm5tR0tiRkwzSExXVFNDWEVmMFZiOHNIRjlkc0o0T0NMREVwbHNnZXNH?=
 =?utf-8?B?a0tDQUFrN0pnU0pZM3JNL0RvS0pJa1g0K05HbmRxQVZJcmdXQXhxUy9ZdVRl?=
 =?utf-8?B?VWNwRHlQTGhtdlJUOXR4ZnE3R0RUTVk0NHlZdkxjMDdGVGxrQXowaUIvV2Fs?=
 =?utf-8?B?MkxOeWFpVnpLOG9aUTM1NFc0d0RsWHQzY1EzOUdyb3J0Z3VwN2wxSzdSRTdr?=
 =?utf-8?B?MHhUU0JZdFFFT2dmeEpvSHlBNlk4SlUzRzd6QWVzQ0tzWk1TY2l6MFRBWi8v?=
 =?utf-8?B?QmlhSjVTQ2xVV2s3Q3M2aTlCY2ViM1Y2Q3lsVUw1WTR3TU9HdDJWNm1PRFJj?=
 =?utf-8?B?YVR6ZFNwL0ZZS00wQVkrcnlnRXZST2dwZnRiU0Ivc3YzWXZxMXVvV09Dejhq?=
 =?utf-8?B?dldqcDhXcWNpc01rK09GVWpFOHR0cjFBTkFIZ1dGNVRFMXg3aTNrRUQ3SFcx?=
 =?utf-8?B?Z3Nld2VBNHZFblJmcllGL3NqNVpCZW93ZzFhWHZYcUdtWk41OGxNcy9MZEN6?=
 =?utf-8?B?SE00TUZvd1B0eUFwYmxTYi91Tjdjek9PUVdmbmt4RWt5VkxOdnF1OXljNnFJ?=
 =?utf-8?B?VGdYbzV1SkVtenhvSk0rOTZpWGFWNW92RGxrZUtYMUEzWWZ5dHFqQ1pIM1hj?=
 =?utf-8?B?TXJsbTNCQnZwK05FRWl4VkNoTExNVFJYSFpLcTRBTVdJL0NzalpIWjc3TnB6?=
 =?utf-8?B?UVB6UVpKV0hQWFhIUDkzK3RVUW1vV29lclB5dXZrNHQvWmgrNWI4Z3ZXTDJR?=
 =?utf-8?B?Sm05Wmo2dFZjY2ZCdUFaZ2lMQ29kK3ZhT2xBOEI2RkN5OGoycDV1K2RmOGh6?=
 =?utf-8?B?RHdieXBPVVZtNzMybTg2dXNCdHdMQmhyMFFHbmZMb0gzUStpSnExbUVyQmhJ?=
 =?utf-8?B?cWVwVFNpRzAxZHc5U2RRa3VvQzV4VzZ0Ni8vMHFyYklxUGJFZ05sWllqVXF1?=
 =?utf-8?B?NG1aZWJDZTk3Y3M5ZXM5V3BNazdJLzVpWmEvQjlERFdaV3JWMitrSGlPMXlU?=
 =?utf-8?B?Ti9tZG1ncHlubUZHSE0rTTd3MzJMVlRDR3BqazdIaUUwRmErR3VWRUhtc1hM?=
 =?utf-8?B?MGhMQzNvQlpzYTJxa3F6RElKMEthMGx5WHVGcTJwbmRCT04va25YVmd5Q2FJ?=
 =?utf-8?B?L21jcHNLNDU2WjdoQU9MZVFkSmtYS01ITjBWWXNQcFR1WE1hblJ5TWdsQkpB?=
 =?utf-8?B?azVWUTgzZnpLd3VRMGNIenFEa0NQSUYxY0x1M0JEQmZSVW95ZGJyOFVhTkJT?=
 =?utf-8?B?RmZEeFZXU1VkTzgvOXlrQytKQVhnaTNXOU5zMGtyeHNPSmtPVFo3VEZYVUd5?=
 =?utf-8?B?TldlK1pBVlExRVIzRGt4bTlRTG9Ld0NvMmkwZXNvR2lEcmFvN1gwYndXNlZw?=
 =?utf-8?B?TVdkbmhUWW1WZFJMZEdWa0Y1WEMvc1ZHNyt3bFVERXFFT05OSjRZSmpDTlJh?=
 =?utf-8?B?LytNeEROK05RaWk0dVJTQ1JaVTB5UjY0UTNraGJKdWl1RE9yWXVHSzhDVGkx?=
 =?utf-8?B?UlE5d2h6K2VYS01GUFlXbkRZUUNCekZYTEswWE9sd3lRcVBTRlNPaDFNVFE2?=
 =?utf-8?B?TzROMjJ1YkFjSjNNVkhiL3BvT2I5LzdzOXVWL2NkeEdkRkRKRTU2Umt2MUE5?=
 =?utf-8?B?Ulc1NTdkeERRUngxRFhYU05CTmlhOFNMS0VsMHRTc2czWnBpS1M3VUtBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWo3QlNYUnB0ZjN3Y0hXVGlhMDJCZUp2eXJqRE5IZmhxNjZGYk9JSE5Hb1FC?=
 =?utf-8?B?UnhFSmN4QkZvR1dWaDZuVjRXSjhKdVlERWlZbS9US3R1WmRmSXlJMzFRNS8y?=
 =?utf-8?B?VHhrd2d0bzRHQk91Uk9GemphYW5TVUkxcnhEdUZ1bFZReGFkN1J0NDJROXVN?=
 =?utf-8?B?ZUNNd0grd3JXenhPNloyUE02UUtFbjFzRG55VzNOc01iQkF1NUNtN0hXR3dX?=
 =?utf-8?B?R1B3U3lrOERIaDJGL2tBNVVzWnVuWnpRaVBBdnJiMnRsN1pUVDdrWElUT1lv?=
 =?utf-8?B?blpHb043QURFZDBwSXBWVEZzMVQvQUdDUEYrVjd5UUpZSkpFWnEzS0dZWjFU?=
 =?utf-8?B?b1RJWGQrbEtJTnF6cjIzV2hxcENCSDZqYXJadi9rR0FHaGFDVFY3K3JqRjBT?=
 =?utf-8?B?QWNuRkhHNElkSXJGcmNkVU05Szk4c252aFhzZmpxSnF3UU83S1ZiczA2Z0lO?=
 =?utf-8?B?UjVnamVmT1U1a2M4byt6Y0svZWRaSFdwdTV2WEVqTUF2dDQ4YVRrM2F4bzBF?=
 =?utf-8?B?alJjTlU3d1Z3aUxYYTJnL0RwTlkxcm1TTm5qR0dzNnhtOWpXalBtYmRYM3Rq?=
 =?utf-8?B?Z1EybVlySDFrQ3ozbTBtUWhoWlBBdjVudllpOENmSHRhUXhWMG9ZSXNEYzdH?=
 =?utf-8?B?L1NvZ0xudTRBOVREWldycXpwV1YyUy9EaEwvUFdIYmJTcDNYeVkveGdleUpO?=
 =?utf-8?B?VXFjaE5aaTlqU1hjVTI2Y2MwMkkwcVhFYmoweEZmUWl5L0d0dkpCaUZsYzI4?=
 =?utf-8?B?cWZSV3RKdDZKZnVOdlR0NTBIVmticFhmRjlCYVQ3ZzdEV01IZ2tkcVdqZDhS?=
 =?utf-8?B?ZElkODRDdWJHMFQ1eTVnbWExVjAyU0dCUkdzTVJoQjVKVzdndnJKN1NnWFk2?=
 =?utf-8?B?MXMyMTBjbHJ2dWx1bWhvalYxak10ZDJRMTFFWGZzVFRxc001aVJZeEkzeFcw?=
 =?utf-8?B?VVQ2eFNYQW1OUHpiVWF4bGF2T2wraGRhK0VRN2U1Q3EyU1RxcWZqSnBLZ0Mw?=
 =?utf-8?B?YjhMZ2FpZ2srS0I1UjZlZzhhRTV2NlQzZzZuWTE0THlqdTZGM0srSEJOc28x?=
 =?utf-8?B?ZktxV2thYTZ6UHVTb21PRTlydGNrTjhwZGxFMVBtM2xTUlZwTVFXNFd1dVF0?=
 =?utf-8?B?STNOb3dmenFxb2dNUWUwREt4ZXI3ckdnWEVMMDYrd0lyd0tPR1cybVVIbXlU?=
 =?utf-8?B?eGdFWG9Ud0ZDSTNOZVEwWlZUMVZQL2tNVlFibFBnWkJxanEvVitRZkVScU9W?=
 =?utf-8?B?QWc2dEVSQy9yOTc3NjVuTGcwZG11a29OaFRkR0F1WUNENjdENERTbFA2elZ6?=
 =?utf-8?B?MUM2ZlAwMGR4Q05kenZUbitiK1dpdnpPM0xoMGI5UmFlQ3NuSURUMVlTbEp1?=
 =?utf-8?B?TS9JNjNjMms2STlHTUkvbjdxUHdWVEx0Qm40a1lxMWorbVJtL3g0MHBTMW5s?=
 =?utf-8?B?dTJDSmtMMXpVUTNRNUozMy83VERwTlFQaEFabWlkVE9iVUR6L1l3WWJYVERn?=
 =?utf-8?B?ZEQvdXEyck9hUFVPQ0c3Uy9GVEYvZDg5M3ByUlVrZGJpb3V6QVNNWUpTclJa?=
 =?utf-8?B?TTJ3bmVycWdrSXUyUmFES0R5aUIzbiszQitpSk9FODA0MXU4UU9DL1FLQTFl?=
 =?utf-8?B?SDJiWHp3S3ZCMkpBZE5GVjRIY2JTOENmczdRb3VhMFBaS2gxS0Rpem14OUxX?=
 =?utf-8?B?bDRUMWFwS25SWHN6YWdrNVJEazZHbG9mMjBUMFE2OVVVS3NuQzE4VElzZVda?=
 =?utf-8?B?blRxUGlaMVFINHVpdlIxc29FTjJ4bnBMbVYxazhwc3ZveU5ZbXFWUy8xTXV0?=
 =?utf-8?B?ZTl6ODd1TGtMMU42azluNkV6ZDdtRmxqM2w2MUc3M2tDVU9hTjlMcEpIaUxn?=
 =?utf-8?B?TnplQjlxZUIzUjdVMDVha2lTU2lqN3JCVTFuNnZtK1NVR3BjOHFWb240Z1Vq?=
 =?utf-8?B?dVVmRHFIbDVnb3JJOC9GRkp5V2RQbVAwMzV1RUtUSzFGMWVzUFYrNTNRaDFV?=
 =?utf-8?B?U2t6d2pHSURraDl1MlJxQWRreW0ydGhrR1RHOVZlWDAxVitlNUxtUXR5Q2RV?=
 =?utf-8?B?WHF6R1dqcUl6c0swQlZ1RldxY3g0Y2VBV2hnVTQrRTFrTkJ4OVJXYklYZ0l5?=
 =?utf-8?Q?EYaQ+lRD1+OD8FE3WXOiY0wpE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec837fec-4191-466a-ecae-08dcec3437e4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 09:40:20.2769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9px26DEwx/SdtMpT/t6In8gCcuHnepjFWzUKqL17vTlPBPWxnYIScvUnrwz44G90TdD3djgc0Qiccw+xOQryUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389
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

On 10/14/2024, Maxime Ripard wrote:
> On Sat, Oct 12, 2024 at 02:18:16PM GMT, Liu Ying wrote:
>> On 10/11/2024, Maxime Ripard wrote:
>>> On Mon, Sep 30, 2024 at 03:55:30PM GMT, Liu Ying wrote:
>>>> On 09/30/2024, Maxime Ripard wrote:
>>>>> On Mon, Sep 30, 2024 at 01:28:59PM GMT, Liu Ying wrote:
>>>>>> Multiple display modes could be read from a display device's EDID.
>>>>>> Use clk_round_rate() to validate the "ldb" clock rate for each mode
>>>>>> in drm_bridge_funcs::mode_valid() to filter unsupported modes out.
>>>>>>
>>>>>> Also, if the "ldb" clock and the pixel clock are sibling in clock
>>>>>> tree, use clk_round_rate() to validate the pixel clock rate against
>>>>>> the "ldb" clock.  This is not done in display controller driver
>>>>>> because drm_crtc_helper_funcs::mode_valid() may not decide to do
>>>>>> the validation or not if multiple encoders are connected to the CRTC,
>>>>>> e.g., i.MX93 LCDIF may connect with MIPI DSI controller, LDB and
>>>>>> parallel display output simultaneously.
>>>>>>
>>>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/bridge/fsl-ldb.c | 22 ++++++++++++++++++++++
>>>>>>  1 file changed, 22 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
>>>>>> index b559f3e0bef6..ee8471c86617 100644
>>>>>> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
>>>>>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>>>>>> @@ -11,6 +11,7 @@
>>>>>>  #include <linux/of_graph.h>
>>>>>>  #include <linux/platform_device.h>
>>>>>>  #include <linux/regmap.h>
>>>>>> +#include <linux/units.h>
>>>>>>  
>>>>>>  #include <drm/drm_atomic_helper.h>
>>>>>>  #include <drm/drm_bridge.h>
>>>>>> @@ -64,6 +65,7 @@ struct fsl_ldb_devdata {
>>>>>>  	u32 lvds_ctrl;
>>>>>>  	bool lvds_en_bit;
>>>>>>  	bool single_ctrl_reg;
>>>>>> +	bool ldb_clk_pixel_clk_sibling;
>>>>>>  };
>>>>>>  
>>>>>>  static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
>>>>>> @@ -74,11 +76,13 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
>>>>>>  	[IMX8MP_LDB] = {
>>>>>>  		.ldb_ctrl = 0x5c,
>>>>>>  		.lvds_ctrl = 0x128,
>>>>>> +		.ldb_clk_pixel_clk_sibling = true,
>>>>>>  	},
>>>>>>  	[IMX93_LDB] = {
>>>>>>  		.ldb_ctrl = 0x20,
>>>>>>  		.lvds_ctrl = 0x24,
>>>>>>  		.lvds_en_bit = true,
>>>>>> +		.ldb_clk_pixel_clk_sibling = true,
>>>>>>  	},
>>>>>>  };
>>>>>>  
>>>>>> @@ -269,11 +273,29 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
>>>>>>  		   const struct drm_display_info *info,
>>>>>>  		   const struct drm_display_mode *mode)
>>>>>>  {
>>>>>> +	unsigned long link_freq, pclk_rate, rounded_pclk_rate;
>>>>>>  	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
>>>>>>  
>>>>>>  	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
>>>>>>  		return MODE_CLOCK_HIGH;
>>>>>>  
>>>>>> +	/* Validate "ldb" clock rate. */
>>>>>> +	link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
>>>>>> +	if (link_freq != clk_round_rate(fsl_ldb->clk, link_freq))
>>>>>> +		return MODE_NOCLOCK;
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * Use "ldb" clock to validate pixel clock rate,
>>>>>> +	 * if the two clocks are sibling.
>>>>>> +	 */
>>>>>> +	if (fsl_ldb->devdata->ldb_clk_pixel_clk_sibling) {
>>>>>> +		pclk_rate = mode->clock * HZ_PER_KHZ;
>>>>>> +
>>>>>> +		rounded_pclk_rate = clk_round_rate(fsl_ldb->clk, pclk_rate);
>>>>>> +		if (rounded_pclk_rate != pclk_rate)
>>>>>> +			return MODE_NOCLOCK;
>>>>>> +	}
>>>>>> +
>>>>>
>>>>> I guess this is to workaround the fact that the parent rate would be
>>>>> changed, and thus the sibling rate as well? This should be documented in
>>>>> a comment if so.
>>>>
>>>> This is to workaround the fact that the display controller driver
>>>> (lcdif_kms.c) cannot do the mode validation against pixel clock, as
>>>> the commit message mentions.
>>>
>>> That part is still not super clear to me, but it's also not super
>>> important to the discussion.
>>
>> As kerneldoc of drm_crtc_helper_funcs::mode_valid mentions that
>> it is not allowed to look at anything else but the passed-in mode,
>> it doesn't know of the connected encoder(s)/bridge(s) and thus
>> cannot decide if it should do mode validation against pixel clock
>> or not.  Encoder/bridge drivers could adjust pixel clock rates
>> for display modes.  So, mode validation against pixel clock should
>> be done in this bridge driver.
>>
>> In fact, the pixel clock should have been defined as a DT property
>> in fsl,ldb.yaml because the clock routes to LDB as an input signal.
>> However, it's too late...  If the DT property was defined in the
>> first place, then this driver can naturally do mode validation
>> against pixel clock instead of this workaround.
>>
>>>
>>> My point is: from a clock API standpoint, there's absolutely no reason
>>> to consider sibling clocks. clk_round_rate() should give you the rate
>>
>> Agree, but it's a workaround.
>>
>>> you want. If it affects other clocks it shouldn't, it's a clock driver
>>> bug.
>>
>> The sibling clocks are the same type of clocks from HW design
>> point of view and derived from the same clock parent/PLL.
>> That's the reason why the workaround works.
>>
>>>
>>> You might want to workaround it, but this is definitely not something
>>> you should gloss over: it's a hack, it needs to be documented as such.
>>
>> I can add some documentation in next version to clarify this
>> a bit.
>>
>>>
>>>> The parent clock is IMX8MP_VIDEO_PLL1_OUT and it's clock rate is not
>>>> supposed to be changed any more once IMX8MP_VIDEO_PLL1 clock rate is
>>>> set by using DT assigned-clock-rates property.  For i.MX8MP EVK, the
>>>> clock rate is assigned to 1039500000Hz in imx8mp.dtsi in media_blk_ctrl
>>>> node.
>>>
>>> There's two things wrong with what you just described:
>>>
>>>   - assigned-clock-rates never provided the guarantee that the clock
>>>     rate wouldn't change later on. So if you rely on that, here's your
>>>     first bug.
>>
>> I'm not relying on that.
> 
> Sure you do. If anything in the kernel changes the rate of the
> VIDEO_PLL1 clock, then it's game over and "clock rate is not supposed to
> be changed any more once IMX8MP_VIDEO_PLL1 clock rate is set by using DT
> assigned-clock-rates property." isn't true anymore.

"clock rate is not supposed to be changed any more once IMX8MP_VIDEO_PLL1
clock rate is set by using DT assigned-clock-rates property." implies
that IMX8MP_VIDEO_PLL1 is used only by certain display pipelines as DT
writer can deliberately assign it as the parent clock of clocks like
display controller's pixel clock, which means nothing else in the
kernel would change the rate of the IMX8MP_VIDEO_PLL1 clock.

> 
>> Instead, the PLL clock rate is not supposed to change since
>> IMX8MP_CLK_MEDIA_LDB clock("ldb" clock parent clock) hasn't the
>> CLK_SET_RATE_PARENT flag. And, we don't want to change the PLL clock
>> rate at runtime because the PLL can be used by i.MX8MP MIPI DSI and
>> LDB display pipelines at the same time, driven by two LCDIFv3 display
>> controllers respectively with two imx-lcdif KMS instances. We don't
>> want to see the two display pipelines to step on each other.
>>
>>>
>>>   - If the parent clock rate must not change, why does that clock has
>>>     SET_RATE_PARENT then? Because that's the bug you're trying to work
>>>     around.
>>
>> IMX8MP_CLK_MEDIA_LDB clock hasn't the CLK_SET_RATE_PARENT flag.
>> I'm fine with the "ldb" clock tree from the current clock driver
>> PoV - just trying to validate pixel clock rate as a workaround.
> 
> As far as I can see, the ldb clock is IMX8MP_CLK_MEDIA_LDB_ROOT in
> imx8mp.dtsi. That clock is defined using imx_clk_hw_gate2_shared2 that
> does set CLK_SET_RATE_PARENT.

I said IMX8MP_CLK_MEDIA_LDB, not IMX8MP_CLK_MEDIA_LDB_ROOT.
IMX8MP_CLK_MEDIA_LDB clock is IMX8MP_CLK_MEDIA_LDB_ROOT clock's
parent clock.
IMX8MP_CLK_MEDIA_LDB clock hasn't the CLK_SET_RATE_PARENT flag.

IMX8MP_VIDEO_PLL1
  IMX8MP_VIDEO_PLL1_BYPASS
    IMX8MP_VIDEO_PLL1_OUT
      IMX8MP_CLK_MEDIA_LDB
        IMX8MP_CLK_MEDIA_LDB_ROOT  ->  "ldb" clock

> 
> Maxime

-- 
Regards,
Liu Ying

