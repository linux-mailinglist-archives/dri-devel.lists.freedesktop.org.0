Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E0099C6A1
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 12:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B779C10E1B4;
	Mon, 14 Oct 2024 10:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="V5uarZlt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25F610E1B4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 10:01:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWUA7XX89e9KFRDqv3uqdZ0Kxp1AyhYHY4ptLQTWp1WX6BjLkjEUIVYdfmE2KHw21gHJx5C/HqJLkWr9bqMiDUzfsSiMxcUDhCTjtqd9g9ydCWy90sEg/MxfavqS7Xc6Qbpyi87cgv/deWtXz5/DHoZHg00ZbS8o9K0A2lGUNl9HApNfbbn2E1qlNiTyLGffDN5P99kjY3xv9dsHZWHu5MXJqPKHSs+JU4yNreOXfJAIeHdPe2dOqjplTh3SOfMciLaWxCFL8ieAWPqd9o9lt+DlERW0qDpPTy5CsSBctERbNMrltOyEAC1+8MR7JrhdjuGu8ANAyav6kcx/EvxXHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5GiyX47Jecs7gxaIbccktqFZ7qKULFgehH0FnnszTM8=;
 b=rwRVyfqWcW3MNd7HRqO9wLZ11GfyQsX7/YAZUg2F7Dq6fRiQaZ2W46Q7JqfooI0/HUTxBebfrJrgq8ReExtJr+SSDY04VRt50xKV2kAs7Z8Ms4RqYiKWhJMuwU1iJHPmzONiv7qCykT4KzJXSp67lwggeIu7voc7KUgvMLWBA1VdkYk5XpHXFO/jpVO4p1pv+b/NsnFsq7k1+P+iZSNVpyxNsC0NcM0qNWaysClUS7NfmzdT/I4c52gEpKwgYzAZdh60sXLJ8LX7ZmtBZXMr1Fd6BnWimdKisq3zKok45c7YUZDk3Vl+WiIvSsdohs7X3AQnYfe+XhQwSVOZj2iCsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GiyX47Jecs7gxaIbccktqFZ7qKULFgehH0FnnszTM8=;
 b=V5uarZlt5zcnhhAT16GlhwpnTIVzUv5+hjs1xr5O9ROVQ1ekhSZOi6Kg9HG41EzchO0WLxmJW7olnH30Uf+AJy4fbOInxUXbO37LmrWB4/zXTWr7XicvImifXnuwcMJFMjFqca4/wACXp6DDpYMlfD51w7SH3lX2VCDf0VE+Dr6v2Bdr+uADAA8yoJ3T93ozNit/PEMIY8TRQBRSU6GY00Iw/iiZVj9Qq1OjdcUt37AhVMYXu4HT32c5cYOFa4llfhmqtQv57z1O1zJaMuvEnmv/X6Jg0SxjH4863w4dN0BWSmnYDFvA68VQNS/L26BRqvUv6wZa0sHSlimBYGvCCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8147.eurprd04.prod.outlook.com (2603:10a6:20b:3e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Mon, 14 Oct
 2024 10:01:25 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 10:01:25 +0000
Message-ID: <20dfe41f-7aca-4321-a5e9-5c6b8513b400@nxp.com>
Date: Mon, 14 Oct 2024 18:01:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] dt-bindings: display: bridge: Add ITE IT6263 LVDS
 to HDMI converter
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de,
 nfraprado@collabora.com, o.rempel@pengutronix.de, y.moog@phytec.de,
 marex@denx.de, isaac.scott@ideasonboard.com, biju.das.jz@bp.renesas.com
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-6-victor.liu@nxp.com>
 <4a7rwguypyaspgr5akpxgw4c45gph4h3lx6nkjv3znn32cldrk@k7qskts7ws73>
 <07b47f70-5dab-4813-97fa-388a0c0f42e9@nxp.com>
 <dvcdy32dig3w3r3a7eib576zaumsoxw4xb5iw6u6b2rds3zaov@lvdevbyl6skf>
 <90e0c4ac-1636-4936-ba40-2f7693bc6b32@nxp.com>
 <lcogrc6uztckwwwsuag5tlk5otidmo7rudsl7zshe3wpfot3wc@ziljns5phhfe>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <lcogrc6uztckwwwsuag5tlk5otidmo7rudsl7zshe3wpfot3wc@ziljns5phhfe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: e4450f7d-776b-4876-3835-08dcec3729e9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NW1MUFM0WHNodE9GRWtOOEE4WmN5aEFnWGh2V0EzbVp1aEdEUGdEcEZZSnVC?=
 =?utf-8?B?SER1NWltZ0pyTmdVWDR3K1lRaVM2NjREclA1Vi84RTZZd0UyRTB0Z0d0V25C?=
 =?utf-8?B?MkVwcmdhTmhmTDZlc1BsdmoyMldmTWpJOWdsR05RZlBOSVRDcVhhOEp3N24v?=
 =?utf-8?B?ekRHN2tKMW9TaHpqKzFlWnNSdGRBbEJUUW43WE42OStEc3lLSnhwWm5OeTRa?=
 =?utf-8?B?QVFWeWtzaXlrM3N4K0JaV002TFBqWE1oMW9FaW1BY1BiNzJ2bzZqVEhOTVZD?=
 =?utf-8?B?TGxIOTdidldsNEI5OUxST3R2bUZwRlBld0twOEtFTUl0ZktwZVBaZnRTc2F1?=
 =?utf-8?B?dWcrbHpSa3UwdnRZRWYvTmhIcDZpdCtUTlNYOUllRmlFV2VjQTV2WjVZdWNh?=
 =?utf-8?B?QnJ0QlB5RHdneHVoN0xQdW4yUWFjUW9TY3VTdzVNVkZXUlFCcXF4SkhBVXJo?=
 =?utf-8?B?cmg3WGZEMU54bUw0M3pZdnI5dGNmbS9VRmlJRXRZZFJuMjBMRE9VWHE1ZkNa?=
 =?utf-8?B?UUxHMDZmU3BVSFd3Z0VHRVlMMlRJeGllOGVtLzZJd0JHWUNuQlZJc3NjNEVy?=
 =?utf-8?B?N1JXR1lmclJTNGJRR1diN0ljOGNKYzRjZ2pCOHhjdnZxQWFnZFdCOGdRMm93?=
 =?utf-8?B?cFZjWnU1VlUrQitiSDBJV0ticTh6bVRaTU5CL2tITmtSVHhmaStTSi85MHQv?=
 =?utf-8?B?TTRHZ1U1U0JzUnFPbnRiOU5HOUd5ZWQ0RGR0Rk1IcEk2ZWhyMEJjUTRWUE93?=
 =?utf-8?B?bnp0VllsRE9mbmNIaFRmbWVINnZsNm9iNXptYlpVWjd0MmV6SEprSlhJYzhS?=
 =?utf-8?B?UkZvbVpweTBIMFVPakhPcmJ2UkZEV1N4bXhmZlZwMWxtRW1lZExFWTNsSVV6?=
 =?utf-8?B?OFo1WkRrSk1tNXo2WEh2VThxekF0allCRHhWRFY0L2JUQ1FnUFA1SFR0Wi9u?=
 =?utf-8?B?c295M0dqNS9KU3pDOFN2d2tVWFVqQWx5WlhBUHVzRzBiRElsc0pYWmJlV3do?=
 =?utf-8?B?MzJMRERxZVl0QTVlejE3Z0dkbEU2R01SOXJmY1hOTTF1ODcxRXJPR0daalVh?=
 =?utf-8?B?SElXZEhzQTQ4U2p0UEFkdEFCbWVmZnErK2RQL0htT2FUaXBJMHMyWml1MFg3?=
 =?utf-8?B?M0Q0U3Y1WW9VZmpyTnhWalpOSVVEam9pNHVKWVNINXZGRWg4TXhoYjVqR1dm?=
 =?utf-8?B?eGZqQW1HM0F3Y2JLNzYrWVZOOTNxZEdwd0NGbGFNa3JPQXUxVUZhWjZUdEsr?=
 =?utf-8?B?MjNRcDU3S2NWcDNBNkUvZ29ERHg5bDk2bWJQOTh0L2lFUkxld3Z3YlIrNkZh?=
 =?utf-8?B?VjJiRWhGeTZXQmJ6MmJvanZPNEJxY284ME1HVkE5NUYvb1U1cEQxTDBWN29D?=
 =?utf-8?B?aGdsTnltK0YxWDRlK3pBK000alQvWXdncHVPV0xGamxhS0VNbjF5anA5eDFn?=
 =?utf-8?B?Zkp4WWw3MkZDQ2xmZzRJQ0RBTkxvZ09mcGNRdDNmeTZFUTRHTTFOdWwyYWlK?=
 =?utf-8?B?NEVndmg5UXdCQ21RaGl3eUVHcUEwQXU2K3VyRC82YzdGSU9TL09hdFVYN2Y3?=
 =?utf-8?B?cVY3ZGM0NjJGaGt6d0puM0Q5dU85d002VW5ranRxano2U3hWN3ZyaEtYZFh2?=
 =?utf-8?B?aEg4K05qQXlEQkFLWlhUMm13eXczcElzNklZTmhKTDdSb00xVTl6UnFrWHBE?=
 =?utf-8?B?L1p5NWE1SkdBWm03REQwY09QK2piS3J0UHFhTHIxYkhWWW54ZWdNNjFBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG9aaDRSQXJOOU4vN295NkN1N29NN1RlZFl4OFJWcVprcGEra2h1OVFOdFpM?=
 =?utf-8?B?MnZCbTlRS0dwdXAxRlhKU2l4TlF4ZGkrNmNOVWp1ZVhMMncrMGVmU0o1bW4r?=
 =?utf-8?B?OW5lcDhvVXBRMSs5S3VoamlGNURGTlY0dVQ0UHRia2JPZVZQMFJiVS9ianRa?=
 =?utf-8?B?cGs3d3IxQmpwVkRnb0kyODJXKzN5alNQdHhJTUo3UWhGY3luckFPV0p3bUwx?=
 =?utf-8?B?bnVnOU15RDkrZkNKRVhwaG5oTkE4MktNM1QvVHhIcExXejR1NGNyeEI3aFhW?=
 =?utf-8?B?QWJpRkFNSUNIb0VDMnRsVGFtRnM4am8yMlRXVnZHSzVsQXV4aTRqYktpZGU4?=
 =?utf-8?B?Rmd5M0dHWUFLQWlXQTBEK1Q4THZEWUJHOUZiVnQ0MTRyUWpYRmNvaXozVnlH?=
 =?utf-8?B?dDNlZ1VMZEU2TkFYSTk2SG9OQVRHc3hyWEYyMWF0SnMrMDBWUkdUV0RxcVBr?=
 =?utf-8?B?SmFMYWtiNWYyQXA1M1oyYnBEZEZ3ekFIUUgzdXNNUVFGUEdkYzFZeXZMV3Mv?=
 =?utf-8?B?VTErbVMxM3BXc2s1U2F2SUlzSGFTdWc5elZaSXJOYmpCREJrOU94SnNXcTAx?=
 =?utf-8?B?Z0g2YnFOTHBZdk9BdXovZVovcjdvRFNjcVhseCtHRGZpREpobmREWll3TkVl?=
 =?utf-8?B?ZlovVVpuSGxYWjJRT3VQZk82MzZoL0FnYlU4Yk1EeGNpWmY5U2hCL25PY3B5?=
 =?utf-8?B?YXJldmtCQUs0dkJMTUIwRWM3ckRxWkNiS1c0UVo2L3hray9qSFRRMnVFYUpW?=
 =?utf-8?B?VlFBNFBFbmozbEtSaEQ2WVhYNmRNV2dWZ21Hc0hINGVZK05SOWlFNkJKZ05u?=
 =?utf-8?B?L202alhjVVFMWXRSTEd1Wk1vait4R1NrbENjZVcwSkxFVEZDRGdVbDJyRnNl?=
 =?utf-8?B?a3I5MzMvQ0tzM3M2WjR1TFBZdWxpUXF4bEl1MStPZmlGR1duZ1ZEV1FvMlAr?=
 =?utf-8?B?VjZIV1NELzkrVkh1am1aV01DMnZqOFZmUm5mMVlxU2FkRTAzWkdpNkVlWmVa?=
 =?utf-8?B?clZIZjlHalEyWlBaQ1l2OGkveHFORkpqaWFBbytFaUwyWm9vb1RxdU8reUZ6?=
 =?utf-8?B?ZnFHUzBCclVzS3RvVE1OSUdDYUhkMzhsV0xCcFRFS2FzeHg4OXFqRHNvNWw4?=
 =?utf-8?B?ZzNORGVvTmtRcXZ1QkR4Nmt3ZmZrcjlhKzZ0bWMvblU1SHVGbkZoSDJWaUVa?=
 =?utf-8?B?R0JwS3liN2RQazVvVkhyanA0bHI5VGtSV0p1NEl0U255MUdEUHhSd0JybG9x?=
 =?utf-8?B?ZjlYV1hOTUdKcWlqY05jeExjSFNTQjhIQWpDMXdMSE1aTVFZQkRkT1BYMyts?=
 =?utf-8?B?Z3B1aStacFBpemdybHZSZlZwcEpiR0NsbHFUVEx2SkJtWmlXMXFRcWtMcmVj?=
 =?utf-8?B?U2haVmFrckxYenB5Y2NKUCtxbDk3SmhSRk01M3FnVUFreTBLc3FSL052MXJt?=
 =?utf-8?B?ek80M0o4dmRvdHZTZ0ljZlRaOC81cWhvSTU1cHVETk9mZWh1c2J2aVpOY3li?=
 =?utf-8?B?TVBTSU9RcS9RN3NBaFVQMWRHWU1ob2NFcFFJaHdlR0pNSUlhLzQwcWEzbVlJ?=
 =?utf-8?B?bnpqQ1FXSGVNSHB3Q3YyV3BJV3I5ZEVBSy95V01CVGM5a0xNbk5KQUxZY0pM?=
 =?utf-8?B?ZFE5R05KNzBydEZjMXBTbHZtUktSKzFRUk1BamNqUTBIMnRMcFJiYUlFWUVp?=
 =?utf-8?B?RDJNTFE1OTZvQmRDQUlqRXpzV3JqVllMNlp5UkNRVW4vbVg1TEtLc3Y4NGkv?=
 =?utf-8?B?TUY5OHIyeWR5MDRDRjZpQmxsRjk1djBiZk1WY1hTLzhCMW10R1owbFhGV2Iw?=
 =?utf-8?B?dU1xdGtJeUU2QnNZR2xNTFpJb2tmdEF5SmxqQjRmYTRQNW5HelQ4VWYrU0Fs?=
 =?utf-8?B?Z1Z5Z2szZkFzUU1xWW1WWk5hL1RRdUNXYUVKdUdESGJSNFRZN2NnRkRnZUo4?=
 =?utf-8?B?cDZpSGkvMGc3dEp0eWF6VUxqZEhVVkhGd3JjS3Y5Y1h6NkttU1FpdjQ0RUFn?=
 =?utf-8?B?K3N2S01vOXYxLzg4R2VRNlV4OXBJb0pmUWhsTkc5UUs3Z2h6QXlyaGpVeGk5?=
 =?utf-8?B?b2UyL2FRV1RwU1BTbmtreFk0bXhNaC91UUlxakNQZmZmUXVpNnlwZ2s4ZkI3?=
 =?utf-8?Q?FqHjtv4PW8ujSov4G9j983QFD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4450f7d-776b-4876-3835-08dcec3729e9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 10:01:25.1893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U7FmsZ0i4DhmiZxrckASH+1bdsAiGD+tskp7v3SqTEa4fNcN5T1C55dbRjNRbNa5EMpK7VFJJElKuzRri2blOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8147
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

On 10/14/2024, Dmitry Baryshkov wrote:

[...]

>>>>> My suggestion would be to add a single root-level property which
>>>>> specifies which port provides even pixel data.
>>>>
>>>> That won't work.  The LVDS source side expects the ports of
>>>> the sink side specify dual-lvds-{odd,even}-pixels properties.
>>>
>>> I didn't notice that these properties are already defined.
>>>
>>> As these properties are common between several schema files, please
>>> extract them to a common schema file (like lvds.yaml).
>>
>> I'm not sure how to do that. Is it obvious?
>> Please shed some light. 
>>
>> Only two panel schema files are defining even/odd pixels now -
>> advantech,idk-2121wr.yaml and panel-simple-lvds-dual-ports.yaml.
>> Maybe, extract them later when more schema files(especially for
>> bridges) try to define the same?  I'd like to keep a low profile
>> for now.
> 
> I'd say, please extract those now. Adding third is more than enough and
> should be avoided. Extracting is pretty simple. One patch to move the
> definition and descriptions from panel-simple-lvds-dual-ports to a
> common location (e.g. lvds-dual-ports.yaml). Leave the required
> constrains in place. Second patch is to add oneOf constraints to the
> ports. 

oneOf just sits below ports so that single-port and dual-port
are documented separately?  That won't pass dt_binding_check
as the v1 binding has proved that warnings will be generated.

> port@0 might get the same oneOf + the
> dual-lvds-{odd,even}-pixels:false case, allowing a single-port
> definition.

I don't catch this.
Below snippet is a draft lvds-dual-port.yaml.
How can it be referenced in ite,it6263.yaml?

---8<---
allOf:                                                                           
  - $ref: lvds.yaml#                                                             
                                                                                 
properties:                                                                      
  ports:                                                                         
    $ref: /schemas/graph.yaml#/properties/ports                                  
                                                                                 
    properties:                                                                  
      port@0:                                                                    
        $ref: /schemas/graph.yaml#/$defs/port-base                               
        unevaluatedProperties: false                                             
        description: the first LVDS input link                                   
                                                                                 
        properties:                                                              
          dual-lvds-odd-pixels:                                                  
            type: boolean                                                        
            description: the first sink port for odd pixels                      
                                                                                 
          dual-lvds-even-pixels:                                                           
            type: boolean                                                        
            description: the first sink port for even pixels                     
                                                                                 
        oneOf:                                                                   
          - required: [dual-lvds-even-pixels]                                    
          - required: [dual-lvds-odd-pixels]                                     
                                                                                 
      port@1:                                                                    
        $ref: /schemas/graph.yaml#/$defs/port-base                               
        unevaluatedProperties: false                                             
        description: the second LVDS input link                                  
                                                                                 
        properties:                                                              
          dual-lvds-even-pixels:                                                 
            type: boolean                                                        
            description: the second sink port for even pixels                    
                                                                                 
          dual-lvds-odd-pixels:                                                  
            type: boolean                                                        
            description: the second sink port for odd pixels                     
                                                                                 
        oneOf:                                                                   
          - required: [dual-lvds-even-pixels]                                    
          - required: [dual-lvds-odd-pixels]                                     
                                                                                 
    required:                                                                    
      - port@0                                                                   
      - port@1                                                                   
                                                                                 
unevaluatedProperties: false   
---8<---

-- 
Regards,
Liu Ying

