Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4478DB2BDEC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 11:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1042610E0A2;
	Tue, 19 Aug 2025 09:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="EVD+MD+M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010050.outbound.protection.outlook.com [52.101.69.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DA910E0A2;
 Tue, 19 Aug 2025 09:48:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sT8p3ouFgMgqLnFAopXhvh+kflz34OdzjiEnz2iU37W6cEEFjlSMhaaak/KqY1rVnBcejF2lN157w9W7MzJ0D74pr5IpoMxoWbWGWlmmqCE9bmn/WIzDiRAGDfIBaJdVWf61My3wWTGowDvL5QefdMCxxqlG2OLAHiRHNsM8yrABMe2rE2t+Al9cOLmfesRbMMdtgIukeVygiIi2fOcktak3nWfMVa+eMqTDnGmTaQ1quWt0d8weXovJYzoa4zr+nFy6c11pO0IieUK8vujzBhBvfFYRgHYZgzzpZS0kn7neBFCZBv2TFc8Qg3AKNjA8hwMBhgfrCBwLJm0McLqVNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CH6+Os8I38BhAU5PE9v2zMQjGM3xP9/iQUuSjuOjWX8=;
 b=R+FDgbu8IAjfegqomc8EykIhRq4uOD+fQe6D3uk5ypqiFYmD7u3CchukQz8Bs3qN+V9GYHJ30HuMJZPhE/rBPOMx1/8bRE9PsAZ5xDSiclynQcwiyPeDYgYQpDc2I1UjLbq62DhIMNK5RyhJF+G1S7MdNvJM22ltUuEZ13YzbWahXqjDlnqBE6MSJNF9bH9loY1c0r8Lh03/VrmmX9VCJ9OkPjS1z4pyi+gaujGegXxNyuuh2aX0cnAFlMalhL8EJfBO+YD+0sDauqUxNonJ3NstfZp0wnHmhm5BFoG9i/W5pJWXvDy0p3i5by1zcfucbCYqUQIo2RpuolAG/zRqng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CH6+Os8I38BhAU5PE9v2zMQjGM3xP9/iQUuSjuOjWX8=;
 b=EVD+MD+Mqa8jTefM1oGoEcmbTTYNvOv9dNnB5pIz3GisRCNmDZTWutjX0VOt1QaBAkAztDdoXHRwVksvKpnVKqr8JOwCaVEIuDw2Z73SoXKDInAcxtPs3D4tU/WZIRrr5y/ATIyO40IC9EnxMLJIoTn+Db/At/c5yYLv75gdmJWj+WhwvyQicFT9koPUlexjL7O0kIhxhJOohVUH37It4hdPJfakmKnf3h+HPrGgurWVio7TJaNfYXUxvUX5xHWOqoqFi29Nwq7Pvtl+EBW0ypZT7ktmmQ0XPzgnovfsXZBJOr+odNTA5DD+YCMsyhFbFNg8EsDiZqHOfsCofjw9RQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8794.eurprd04.prod.outlook.com (2603:10a6:20b:409::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Tue, 19 Aug
 2025 09:48:24 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9052.011; Tue, 19 Aug 2025
 09:48:24 +0000
Message-ID: <9e77615a-9d5b-4971-b1db-74d6bed39533@nxp.com>
Date: Tue, 19 Aug 2025 17:49:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/bridge: ite-it6232: declare supported infoframes
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
References: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
 <20250816-drm-limit-infoframes-v1-3-6dc17d5f07e9@oss.qualcomm.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250816-drm-limit-infoframes-v1-3-6dc17d5f07e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: 33719af9-7c8f-47f5-12c8-08dddf0589de
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|1800799024|366016|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjhBSGRISU9IeS80OXkvaWphTHk0dGs4T1AxNlNxaGRMMlVxb2VtdWF0Nzhq?=
 =?utf-8?B?Z2JyN3FSYU11bjV1QitpdG1sZjg3QkFxcVNqQXl3THhhVElhT2RUMkwzRGNO?=
 =?utf-8?B?MXQrREJvL0NkMUZ5OC9ScXpXand1WGRSWG1UZjE2TnNPRmFCNDFzV3BELzkr?=
 =?utf-8?B?VW1QU3Z2b0dtOWp1aEhZY28vZVNOSWFpdk9GamJnQ1ZuRDhYeUtSRkJFOEx2?=
 =?utf-8?B?eVdRZ2ptYnd1TDFOZUZNT25DdUlJVG5mRGZxLytwWUNUM3k4M2Vpc1pSUVZj?=
 =?utf-8?B?U05HSXJoN05XdkNhRGo5WGNoVGFVdE9iMHN1bWl0SzVSMmhmVS9kVGp0cjR1?=
 =?utf-8?B?aHVUWTZOMG9kMi81NE5xL2M5Qy9PTGRrd1l3d1pWYm41RmJJaDMyUjFwODVE?=
 =?utf-8?B?Vmg4c3pSckVGSzhOcDlZUVJNT0dyZXYxSy9qbG5hWWdLckZid1JZSHNoL25o?=
 =?utf-8?B?enJaVlB1Vm9kVE1DRDlqNXdDQURzVjN3dDBtRzRSeTI1c05ybTlZZitDa2xu?=
 =?utf-8?B?M3JXYkJia1JaeWw3SVUxWWVoKzl4UDZxa2N5UytGVXZSS2NzWGRlY21aT2ZG?=
 =?utf-8?B?ZWlnV1hYVU9uQVFUd3hMbGtwb1FoOUc3cmQ2b0VtZEE3TTZTcWd3K3BwZU9r?=
 =?utf-8?B?K0NHbHErWnljNDJSRWNnUXEzS0svUWF6aWllR3ZiTmRFMUpxVk5MWmFDTkd0?=
 =?utf-8?B?d3F6TllJNmtJWVMzcldtY1V1Y3RqY0l0VmpML250UjFOVzNyeE9zZmhUZVgy?=
 =?utf-8?B?UTJCTzNQTXdrOVF3WVErbHpKWkNCVElMelRIYlpCbUZ4ZU9HNmlJN0dyVzlL?=
 =?utf-8?B?b1NYZHlWOEt6cERHaU5xNFRZUVpNd1paYmd2YnVNUmhhK2VTZlkxVDd5QTli?=
 =?utf-8?B?WkxKQVJqcUJURDNWcFNUMVBkZkphZktBYThRdkFpdEMweXY1ZGdSMmxnS2Z2?=
 =?utf-8?B?UjhGbms3NzVqQjNMbkNKcUllUUlEd2wzRFdxK05GMC9mYzhOa2NOSjlybkQv?=
 =?utf-8?B?dWp3MWdhOE5oZFkrNWtUZ1FkZ21uenVadXZpVzBCMENaYm40cXgyMFQxWkxx?=
 =?utf-8?B?RzFDNVhJeklHK3E3YTZEU0dHWExkRUlDdmpoSkxHTUVxVWU2QzhmK1Q3RnRD?=
 =?utf-8?B?QUpDTnA4RUJVeWViUk55OGFuRm1GN3BuMUxKbzVrbTBjNzdFdTY0SEt1WEE5?=
 =?utf-8?B?K0VDK2NZMmVhak95UnM3Q2RjbGt0NkJ5TXNuTDQzSE9MN1pOWHdQclREdWZQ?=
 =?utf-8?B?Kzc3cTBocGdYQW8zKzYwa2dGby9YQW81cTRXWGQ5bEFjaENiREwzVng5STFx?=
 =?utf-8?B?RklILy9NaU81emhvSFZlRnM1cmYzQWlqc082ZWhuWWlpUlU0dHNGM2NZcXhY?=
 =?utf-8?B?clZFOE50TnhyVDhsWERxcGdadnU3R3E4Sk92dFREVTM5K1BQRTl3MEZIWlVV?=
 =?utf-8?B?bldNZGtOc0dSWi84OEhubVNYdmxuVk85V1pCV29iSlpyaGNvU2RhZU94NUVk?=
 =?utf-8?B?SHlEUzFDMUFtenhVcWdaam1mUjdnblFOdWdGVzNFWDAxM28wZ3U4MkVFMWdJ?=
 =?utf-8?B?eEtyQm5nOFI5OG1kMjdEV0h0alNrWDhsLzZJZXV0TldOUXZlMnc0UXFpU2h6?=
 =?utf-8?B?UVlWdFRtUE1xeXVRc29vek15bXVBb3VtcXNLZDJ1RTA1REk1Ynk3bGlHR0Ux?=
 =?utf-8?B?WXZHS1hHVUpJdzQ3K3gyUzBKQkhNbmFGN0R6dG0vSi9lcUUzdFN2TEF5cmw1?=
 =?utf-8?B?Q1pISHpxSXBwZ0I4TXBiZEpMVWh2YTVLUjFWa2ZZZGZwbGZvNS9GMUoxd1pX?=
 =?utf-8?B?c2FBWWJlS1JhR3BiZWRKUHExeTBqbU1hTVBhSGc1K2xteWFodTJvVUkzdnE4?=
 =?utf-8?B?Sk9zTW5vMkZ2M1NzMVlvZnNoVjB5b0taMm5JMENMTURFVTl1SUl2RGRvU0d6?=
 =?utf-8?B?enBzSEwvSFViSHgvRS9NanQ0ejdtOGppSXIrUVpOcEpOa3hQR0lYNCtKUkxz?=
 =?utf-8?B?dnRVSzZKR0RBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1NSSGxDSDlya2FLeVJsWStaTFU2WUtGQTVMQjlEMmkxWTcxNE11WjNOS0Ns?=
 =?utf-8?B?OUNQaEhVQVpsSDBLWTNwZTUyYWpqU3lLMzhrbE1zQUdCb1pWSU9hSjhlNUM2?=
 =?utf-8?B?ZU5KdXFodUxKOE5WZk9HdHF6SUJWVmRhVkVrVkhCZ2xaenRxVUNhcFJsdE1M?=
 =?utf-8?B?RkZ3L3MzbDc0RExDemRnNlVsWTJwODJoUFVGbzg4Q3NrTnBTYURxT01UYWlj?=
 =?utf-8?B?UHNoVXZFUXFLcU9jODFqWkdLQTJTeWRvN1NkVGdSRDM5MGozanFGNUl6TStQ?=
 =?utf-8?B?OHhUODFKMVdsa1VJZzJMNC9wamdVNlA3Zk10c3dMVW5DN0pBVTlzQk43R3gw?=
 =?utf-8?B?bzR0b09DdU1ldDd2S2p1MW9nSlBCRldQSkcwUEM5OW13Q0cvUXY4YnVxdzhs?=
 =?utf-8?B?WUs2dCs1d2J1YnNZMmNXZjVxZTFaR1lFVTc0Qk0vU0VBNVVMNC9FOWg1cUhm?=
 =?utf-8?B?eVJJejRLTFY4MXlHVVRmSFR5UGJOdEdsYlhjOGNnYTd1R00rZDBHMCtTSFdu?=
 =?utf-8?B?b2RBamRpOWV1ajM4TlIzVGRtWTczMUhHZlBIVy9jbDVaVDEvMWo3dXZhcWx3?=
 =?utf-8?B?ZTg5OXJqSDVVN3RiRm4zSmZyQnhCSkdCWGdEdWMycHZod291QVFqWEx5LzhO?=
 =?utf-8?B?eTdDVnk0cUI5VFFZalBoTktzR3hXV3RPRkFvVjhkSGtueERJOUFLeXppdDlU?=
 =?utf-8?B?ZkFqUWltem52VFM4b25qeURuRnZsSmloa0xuMGdnc21ZTHRhWUQzQ080WmFj?=
 =?utf-8?B?eFVqa1RtcGFoelBJNmFqZHNEdTdrWHRmNzF4MVpySEpjWUJaN3g2U1NXaFFM?=
 =?utf-8?B?QXNSS2c0QS9oK2tmQVhlamlQYTBlNU9yL3dkd3NOdGxuUmFKRG03S1lNS2t3?=
 =?utf-8?B?NUlPdzNsQWlnekJRNjQraVc2M1JuUjZRM1hzRU5SWGRzUmpVQm4xRktGOFM4?=
 =?utf-8?B?eU05NGdsZGV0UU9TZjZmZS9ydWF5Q2ZnQmFnVm5OZ2xVbmFzaEMwQXZGUmtT?=
 =?utf-8?B?T1pib2VWcHh3MWh1VTRwMXo2L3NSbWZ1WlpWSktJcHBVL1htVzR1ZGIzT1BD?=
 =?utf-8?B?R0JiaWpqZkFQMVE1cmdDZHJxbDNSSE0wUk9oVUU1d1hyMi8xNGZVR0xtbjU3?=
 =?utf-8?B?Nm1OT0ZJd0RabjBlUWlJbnNRakNIdndWVkh5emZ6Vk9sdTJaWDRHV1ZUR2tM?=
 =?utf-8?B?V0oyaEUvcVdkUGlmVStIVDZFN1RlZWpDL3cyYU0yb244TVhBKy9pT0pOUTE2?=
 =?utf-8?B?U3Z0QjRqWFBlRzBDS2g1SkFwbWFUckhLb2dkcVB0THRpQVFDS0drSFMvOStw?=
 =?utf-8?B?SmFNemhLdzljK1AzOFkvc3laOGEyL1pOVVg1a1RlL1BvalNFL0VhWDQwcWVC?=
 =?utf-8?B?MXFDSWMzdG1tT1JSd21ScTBhdG1yYnFGdWZNbEJtSDdqalhqYlBQeUdPS24r?=
 =?utf-8?B?Si9LL3hGVncxcHljMXp4RmpwZnl6VWRySEZjOEplTml1S0oreUk2eXUyUllR?=
 =?utf-8?B?MFhnVmJFRU1HVERGZlp5WXhCVzBVSW9mWDg0eVhxQTUyTGJReCtIcjhDNXc2?=
 =?utf-8?B?MUhTc2d4NVA0NVVTak90VnRJYnA5dEk0SEx1ODk2aTNiQzRPczJCVFp1aGd1?=
 =?utf-8?B?YjZoZHRZM3M5TGVOQVJxejhZQTR0bGJIOVdZN0dpaHVFeW5YakdaSXZkV2x3?=
 =?utf-8?B?QnE2T1JXbUxjMm5CWllSK1h6VmdOOTF0T1RrMm1aaDI3Y3A3aTlNS2xzQUs1?=
 =?utf-8?B?cENoZnQzM2Q0QThrRlROQUFZbmJxOG9ZUEpmME9kMGVWejZELzVDTnl5VGM1?=
 =?utf-8?B?RnlEQm14KzJKa0dIQTRwN0hRL0dmR3F0K09md3hLbEJoVnlSZ1NCTmcrMTRh?=
 =?utf-8?B?aElUVC81RUorbVRRT3dERzJ6c2ZGYURCVU5kUUpiQ0xMNDFDMEpHUFMwQlVh?=
 =?utf-8?B?S25ld3ZsM2UrUmtRV0pneDlla0NNQ0dhVENuMm13SUpwWG5keTBjd1lrUXlk?=
 =?utf-8?B?TkY0eGoxTVBvSFhmSHI0SUE1eEFNOTF3bzl6TEszOUNuUm53TE9SM281SGZp?=
 =?utf-8?B?WUpjeU1ZdEt3dVJGZnpjUmpsUnk4cXc3M0UvYldsQ2Exa1l5OFc5eDdZYzdi?=
 =?utf-8?Q?dScwScERM5l2U8dcPiT9rvKl6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33719af9-7c8f-47f5-12c8-08dddf0589de
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 09:48:24.0044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DBgq77hd5ybYR8UbHbHMDQF1+5h8Brx1tmZETQriI2feH9DY6DZ19aeqeSnjsv8zeZBeuy8SOxb5L6qFyO2img==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8794
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

On 08/16/2025, Dmitry Baryshkov wrote:
> Declare which infoframes are supported via the .hdmi_write_infoframe()
> interface.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/ite-it6263.c | 1 +
>  1 file changed, 1 insertion(+)

For subject, s/it6232/it6263.

> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
> index cf813672b4ffb8ab5c524c6414ee7b414cebc018..b1956891a8388401c13cd2fc5c78f0779063adf4 100644
> --- a/drivers/gpu/drm/bridge/ite-it6263.c
> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> @@ -875,6 +875,7 @@ static int it6263_probe(struct i2c_client *client)
>  	it->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>  	it->bridge.vendor = "ITE";
>  	it->bridge.product = "IT6263";
> +	it->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;

With supported_infoframes set, the two lines setting vendor and product
are dead code.  I think it's worth dropping them and updating kerneldoc
for vendor and product members because they don't have to be required if
DRM_BRIDGE_OP_HDMI is set.  But, this could be done with future patch(not
in this patch series).

Reviewed-by: Liu Ying <victor.liu@nxp.com>

>  
>  	return devm_drm_bridge_add(dev, &it->bridge);
>  }
> 


-- 
Regards,
Liu Ying
