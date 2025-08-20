Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997C4B2D2C6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 05:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B6D10E69A;
	Wed, 20 Aug 2025 03:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="YE9At/vR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010020.outbound.protection.outlook.com [52.101.69.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C2910E69A;
 Wed, 20 Aug 2025 03:58:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TuRGf+kMYSc+kv3i6OXcfBv+IAAGb+/3vqkDEPA9nmAROWgf1Eupckq26L34V4ZmZq12qf3Q46No3hXXQYJ0d/Tf+BvUU0lXuS2FKn7Z1Axat7MTXJJ5v/+ctH0rJOYUtAsP4OF2rZuMO4DXyTL6stpW+JC6mmXX764lYMxK0nWUoOUpvWX5Vje4BQzbdQyVM1kbEfTDMeKu0wOAgxGpbkkYZibfuCuKW8LUVP2fWBqda+jxjqriwsAgkshFm5+t/0oQu4snEhr9k441jF7ZqNYFURYCiCmxYQkBfoY7caePqIr4vsE1qjgV368mUecOgZ/lY9g4zpHOj/Sa7feQCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1dpNUn398HSbaMti0RDKP5RGq5uVUEruLGbCA3FVRc=;
 b=dCeY7m0BDKB34j3xDIVE/QMZFh8aZZeFFCDKKvUWL6FIQF6MruAh3sn1IHX3DtqBQ22XLnlgonhwHtjMTOf9E0RRB+znVguLRKHMdWZwYb/gDzrqsvYZ5BhbWtLCaJhgkU2Wui++KJmUJCwLlM1hQ5IzBZvE5LskqV5YaPuqmKpXGY6Q+o4B5LYP9tV/8c5YdKaNZfjtJDvLBjymISkv3zQpLSvF8pYnQFJHqq+x4lNEjrHj1sBqiaQd4cGwWGu0w2QtQYY0oCKUOWaSny3fr38qv5r7IXwy6ujsDtRYXaTdyFfus6IM1965Ar/aJZwrrkIMnE0IsDd0V5V3AHV9ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1dpNUn398HSbaMti0RDKP5RGq5uVUEruLGbCA3FVRc=;
 b=YE9At/vRuwM+yc4+l/HWYWv9Xz/Z/5vHCpghkNow7jN6DIVHrDvuXPMSuatoWRaedoegQcktfTfh9nRcrRiPI0oWaIr9qu98jsTJvTv0vU8mW+Nq3bsH7FcI2fl5oyO4pltjBAebcl9I1DQVWDqjjEmk6OBGbV+J7yaZxxxJU8DNqrw3MDONIOcPZdIyokNbQS0tlJfpdgIAbfDQWbqypne4oN0nGo2PDKOSpkreOXRERnup808ycjoMppZBhru18roUkEBvFtQzKpJGUngp8h4rU3u8utzyRqEbSlFtZsQf/iHjut5nfN3SvinWwIXbUEck9hFxwqZ7TDaItQLhQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8557.eurprd04.prod.outlook.com (2603:10a6:102:214::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 03:58:10 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 03:58:10 +0000
Message-ID: <7acfde02-8b5a-4770-9665-a9571d08e8ff@nxp.com>
Date: Wed, 20 Aug 2025 11:59:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] drm/rockchip: rk3066: declare supported infoframes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
 <20250819-drm-limit-infoframes-v2-7-7595dda24fbd@oss.qualcomm.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250819-drm-limit-infoframes-v2-7-7595dda24fbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c457c14-3fe4-47dd-a939-08dddf9dc73d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|7416014|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEk4T2Y5dWNSTHlGYTN4OVYyazREOVBqNm9PSFZtallEOHgvSWp3M3Y2dzhR?=
 =?utf-8?B?VkJJUVBMRG1qU2NJNjRmeGRVNXFkNWVNV0cvdWt4M09vOHpvR3MrOTlwdmpx?=
 =?utf-8?B?TzFJamFicmVML25BdWJmN0orSkpqZmh5VldJdFVWTFQyT1BDY2FzUFN5Ty83?=
 =?utf-8?B?S3ljbkZETS85MXNTRmg4NzZaOTJxSG1DcTlKZEtmRGJpTjQ2L1RCMzZzVUE1?=
 =?utf-8?B?RHl0bzRlZTNHWGtCS0RnVVVqWGRwanJmek5PRVhqRThNU0U4THh4ZHJObitH?=
 =?utf-8?B?SDRieHM2MDN6YjB0V0t0OU1maEU3N3VoMHY4ZllhSFBaWHVXTnpDbnJZWTdE?=
 =?utf-8?B?ajFNU2REVndPd0lCVnNEaGkwbnJLdS9UMk9xM0RhNGhTZFNTRXV4TEFjNXds?=
 =?utf-8?B?YmJYVHFHQzRNRFViREl1a1RWZ3crTkRxRHJwTUtnbjFVRTE1N0JzMXVKem5o?=
 =?utf-8?B?UE5LangwblRuWElwemFPUFVDRGlLWmNndFc0YTdQK3RvdEdpUkZPRmhKUUhW?=
 =?utf-8?B?T1dpMm9ERjBIY0ZOMDhJVWJKeEVQaVl4STdUalJYZnJJYXlhY1JUQWhrcyt6?=
 =?utf-8?B?cCtNdUFPZTlqaTVrc3R4b01DWWV1VGdwNGpOSGUxNWJkOHZEUDcvVlNCRnUz?=
 =?utf-8?B?S2pQOCtoWWR4aUthbFBlMitRT2pYalptaTQ3OVNKTml6S1dLa09SME12d05D?=
 =?utf-8?B?U2Q0dGx3eVoraXhCb25Uc2loTGIvZXY5VVVwbjk0THZzbjZVSDVDMi93bUdW?=
 =?utf-8?B?czg4QVZwT0kydU1UYXdYUGZvN1NDZERwTEVIRmFKd1lzNlRWMTBxN1Jnc2Zm?=
 =?utf-8?B?cVdaTlhpckFVeW5ObC93S2Z3WW1TaFFwcEdUV05XRG10N0ZsRGN5QXRDS0RO?=
 =?utf-8?B?NzJBZTNtaTlSdnhINE5sbHJpc1A5b1d5MXZ0Rnk2UVh2WlBXL20ydDZtTUxq?=
 =?utf-8?B?WElaeEx5TFo4MDkzSWJEY0R3ZEp6ckZqUE9DME10cnA2WDE4dWg5dis0OGtD?=
 =?utf-8?B?TFZnZmlUK3FEaUhOSUdWSDFZZkxreE9xd01vWGZXM3FSQkFlbkpVV0V1TWZr?=
 =?utf-8?B?QWg2YlNMdEZvUGlJc3ZFaG5lbmI3VEMzb3dNMko2R3FCcUdXU20yeTBIUmx5?=
 =?utf-8?B?VUI5Yi83cm9Ha09SNXA2Zm5ML0ZlOGg4eVNhMWU1bkgyMStBOG5wMUhJUWJ0?=
 =?utf-8?B?eWh1c1A1VmRHU0ZQTG9aMDdPV2F1UE1WQmlNUDEzcjRyT0lZdXlTREEwR3N5?=
 =?utf-8?B?bE9DcDJnZVBScXJKUkJOdkxnMWZlUnpVY0hPWFl1K0VGZWtPUm1Dc0ZqdVh1?=
 =?utf-8?B?UDNZR1hiV3FibEpOQ21GdlRGajQ1Q1Y3dlZNZVg3aVdQTGoyTWl6RExFbDJO?=
 =?utf-8?B?SFR2eE03NGtsU0lMYjM4cUVRbVRGT2VVVE1rQmhqempJelBscUcvOUN5RDJR?=
 =?utf-8?B?YUdlT1hUMERwOFdScGQ2RVNHSG1Kd0FhVHFCcllHSlBwVXJ3cmc2YkdKYjFl?=
 =?utf-8?B?Tlh0eEswejBvYmFrYS8wbWdoSkJIYTc2ZENmRTF3QXp5WFFQTEJ4NlI2QVpJ?=
 =?utf-8?B?ZGUxQUk1VG5QMlB5M1I5NkJ4TFZ2NXIza1dHRVphOUFpdXE1cHlUVmpLMXlS?=
 =?utf-8?B?TUJJZEJSdlZkSCsya3NlaWlMWHo4RUZ0bE9Md0V2MHN1U2plQ00yQ3BxMFds?=
 =?utf-8?B?ZjJOQUw4RW5EdytKNWxuTTYxTGdFLzRMY25FQTd2bVl2TktrRkpSMW53M1Ri?=
 =?utf-8?B?RThPZDhlV0daOThBdjliQmRPbVBHYVhwaXlheHo2WGFVNXhoZTB3UUZqRDNR?=
 =?utf-8?B?TUgxTVlVbFdOUGtBSHlTYm80cU8vNnl5L0YydU9JdFBHOHUzb1EwL1d5Wmtq?=
 =?utf-8?B?RHAxNnBsSDRHRHVMQ1EzQkQ5cnVoTG94RlN2elV0MWRDU2VScGxFR25qSzcw?=
 =?utf-8?B?cUdRMzZOM0Q3YU9tOTNJOWN3anpxWmk1VDgzSVIvbTQ4QWFwbGNhaXZqVTg4?=
 =?utf-8?B?VVRsaXNMZmtnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3BQdU5jL0xLcGRJMmNLUDU0ZUVIR0V0YXlrcGdkZU5YMTgza01XY1R6aktG?=
 =?utf-8?B?UTdYVXZnOHhTN1VHcjdXamo1OTFMMTRsWkx6WGJmZkMxZGtlNElSNjZnUWU0?=
 =?utf-8?B?UDZ3SGZTYjlzdVBPK1pGMi9jSmZsVGh5cW14dWlPdmFBdHUrWmZNZS9GNkpo?=
 =?utf-8?B?Q2hqcmVTMlJ2Ymppa09mTkpwNGNRUUJXeEdFUEtrTnh4YWg3aVFLeVRqdUgz?=
 =?utf-8?B?SkhGR1JPUkRUNnhZNFFCVVJYaUZybHM0bEJoeVlzNUduMWhKbmw1RFBCQ2la?=
 =?utf-8?B?YlNIOG1oalFNMGxwWHFSc0djbTRIYUxIQk1qM1lFRk5LS1dFQkRXamYwY0s0?=
 =?utf-8?B?QjJFaVFBS0RMVzUzL1RxOU9DbzZWaXdkTS9LSWhxd3RQKytNdEdPUGZqeERN?=
 =?utf-8?B?RW5VeVVHbmlNMXgzdEtzR2pXNS84MnRuR2RTRks2MHlvcjdWekVqUU95cTlm?=
 =?utf-8?B?YWFuMVdvMU5hU3I2S2hhVFVVV0tLQmlEZVBMNXpTVGhjZGFFSGhaZXdQdm5V?=
 =?utf-8?B?cVFHTFV1K2lMTDR6OGFZcGl1TnVMSWRsRDJWWVNWdkI4YjR0WnU1TStuUTV2?=
 =?utf-8?B?Z1FEQmM3aTRBb3FaK1c5S2pocSt5WFJSaGFyV0piV0NZbXEzK1VrQncvYndL?=
 =?utf-8?B?NGNxb1ZvbFNsVWloWVdMbXpZSWlMS1lFaGJ0VmFQZ2JnNnMxZ2VnaHgxR1N3?=
 =?utf-8?B?eExpUjR3cmsrenJ5YXd6YmFIREprREZDRnJ1NS9ZMFBldkJYQmZZTUlEZ2Vk?=
 =?utf-8?B?U3ltdkUzemRScGp6UVBkeXRkemNYWVo4QUoveU9CdHFjZUxudW5TRVZRelBu?=
 =?utf-8?B?MWRlaVlsS0lmWVRZNjFoM3JUODlyd0tSWmFWNC85WTVGV0oyaFU1MnowRE1O?=
 =?utf-8?B?MCt1WC9rRWFFd3FSdWZFOThHVm9wK1ZzK0p5VjNGTWplaXVxUUhhRkZQTEtq?=
 =?utf-8?B?YXdkUkdmRzNLa2t2MkVseXlZYjhpZDlEOGI3UFlkby84SWxmZmNXMklvRVNk?=
 =?utf-8?B?S3VqTm9YOW15eXJ5b1M5VER2MlpjZlhMV1NYQ1NsV2x4eEN0dnFHYUZ4YUtU?=
 =?utf-8?B?Q3VCbzhYWHVQRnpzNmJ1L1djOEN5OEVvbGFsTk5tbDIxNVlKNmZ6MzV0cFlZ?=
 =?utf-8?B?RU5FSXFVS09uakZmU3U0Ty9tSU9tUFVHdGZzODA1N0JQTUZDU3g5RzgwVHdR?=
 =?utf-8?B?NTR3NGlGMTVIMUNKNHBYZndGNmlEdVlad3UyL0YraGdqVlVBK3VtenhqVHhM?=
 =?utf-8?B?Ky9ETXNQWlRRU2JqYUdYVWQxdW5GcWRmV1pLZU9sWHlZRGc4dDJrSXJ6eGR4?=
 =?utf-8?B?WTNNSlhVVVVGT0d4dVNaYW9POFF4ZGtmK1pFM2VDUXJjMDFNR2ZhN0RCNG5C?=
 =?utf-8?B?aUh3bTB0K05mU3AwMUl2UlViRERjMVZXbUNiMGlzM0taUWhRM1Jydks4RGZQ?=
 =?utf-8?B?UUJ0ZE5hMDBsUmZhMjZSZ2tGTkZJckk1cDNweUFqMjFnTmpRN1hZMHBFaUtT?=
 =?utf-8?B?WnpOUmRwTXdXb1JaWHZhU1EzdHNIMDFTQ3h5YUgwSEh3M2ZRdFRycTliaUZE?=
 =?utf-8?B?U29rdTROVjVHWENHTEg1SVBvVXVvdXJKMlhFMWlvYjZ1QU84VTRRRi9lNHJ6?=
 =?utf-8?B?cXRIYjdPRGt2ZjJmaDk3OHc0VTliYktvd043SHVXS1JBaCtxNm8vSVB6bHp5?=
 =?utf-8?B?VmpuVmkxOUk1YVJkUmM1Q3dEMW1tTGZvUzFOa2pvM1ZxcVJEOUM1aWV3Um1E?=
 =?utf-8?B?TUY4RzIrYVdyRXJvaVB2OEVGTlI0a29scGVSVVJ1WWVHUXJ6bHNmRGZ0NmJ5?=
 =?utf-8?B?cWR6NnFDRHFNbVlHMXFVNml3N1NCNzJxeEhLZzRTelpaaCtUQTJsQUlLMXVE?=
 =?utf-8?B?WUlzZmo0L1JXTVBnZFh1eUkyaWh3NWF5cWR0RUx5TDhwYXRtREZ4Ty9ud0dR?=
 =?utf-8?B?aGVUamxvV1BVbzJIaHdOREVnOFRzOWhYNFRqUzVFdmdCUHE0bTZDQU8rT09m?=
 =?utf-8?B?ZjRWSVR4a2YwbTlWWlBTNG5meXJGaDB1YmZ3d2YrdUV5QlpKV0ZZbG1ETno3?=
 =?utf-8?B?c0h2dE1KbVdtdklMZVU5Q3FVMXQvaHl1K21acENncVhCK2hkRXg0UUp4blh4?=
 =?utf-8?Q?ztzmOP9t0dq3uKPhoBW7E4CMH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c457c14-3fe4-47dd-a939-08dddf9dc73d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 03:58:10.5075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MsYwtSPST0N8TB2p/X25ioJ1EmH1me4d94X1HUzSSKL0R4wbEODLMZVSzNQn0pwxjOuLDaJaHhqIDj5LWPCLgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8557
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

On 08/19/2025, Dmitry Baryshkov wrote:
> Declare which infoframes are supported via the .hdmi_write_infoframe()
> interface.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Liu Ying <victor.liu@nxp.com>
