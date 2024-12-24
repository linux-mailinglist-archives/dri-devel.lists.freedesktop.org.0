Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC66F9FB9F3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 07:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A96410E5D7;
	Tue, 24 Dec 2024 06:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Tt8rZK6P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2607::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B2A10E5D7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 06:47:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdI9Yjq5H7Nf6Ak5tX1o5bHrvnnB8S88sXsK0J7xdbnG1SoT1oNpYA3+6ai6riXnpgN8qSg579yYdm8k1qO4IKnMKlr4/pUr0/YgKGTeplP4e4qURxYlqTgSqu5pbTAsEuMF1WVEzI5j3x8HBf7v/r5Lo4NianVQk+mPb4IUWbyzv9OOAkH/Xx2GJ9r6l70CNKoSBiorHAFTUbuEqWKQc6kNG/lcKvioXwGPjAnAb4Uu4Vnu1aZhQ0aJaf1/VkEreHKX86G1qqATF8ao8Iv6ypjd+5j4CQC665LaBYOghmP67FETypzOmnWI+WXXgcvAKsUF6Kguf/Gl6aDYuyIgaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moWHVebP+vdxZT6S2JxKjaRv+xg0ChZKxSo8W90+uKk=;
 b=w3WwBQT0B86IgcjYALWN+VHe1k29N5SQ+BUvl1mYJF7+BOu7qCivSxsU3NNijjQ18a4MdNE/pfLJREsxOeGZnILpbcGXEpogepw//gburRiuM857c4KzulZIGlwlD5bUPRLwHwSsl9HxhPq+37F4vokrROvNUohij9elozn2g3SDzwLpj7TkWqeiPVoNOcg6W/vJu2JzruHnl1OZp7IwM8srsKb1UbfZ+kl226QA+xJ/Vb6UaSWSpJc6bdQiglZageVOsL1wwtgaEc+V1AIU6ThDq1SaiTgO5HAwrurPimMVSzOU8j9TmAC+uK/Vy9jL/ielmFGVJ1n09a20f5BM6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moWHVebP+vdxZT6S2JxKjaRv+xg0ChZKxSo8W90+uKk=;
 b=Tt8rZK6PtYhszV07S0oezcai3NHRD4KdGP+tq3jFrLNuztZCX+ERqIJDcBTEFw4qHKJPWZL8e/derj+rYNHj5hTePeG4sVEqZH5u5KTQQlu6j4MQBZRk19wu7hzyKbH5b7rESBWdWfo9DOFLY8hj8DC8UxqGyNwez/o5fx5AmbwVIjUJM3GG2XzoZ+iT71YOxGYLKRWUJJH3q90jSbS9y+1Jy/jIejgCHmVqIRdaLpeOQTEJRGAsth3PbrzRDH+9+943eaiILDf+/mm1iHbGRatnoYlbZMzT2kQDtyPTcF4yFtg200mkrBb9N2lmjZHD7zD1Is7/1Z9Ot1k5ZFhQ/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8082.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Tue, 24 Dec
 2024 06:47:05 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 06:47:05 +0000
Message-ID: <214b2282-fc83-4a25-8cf3-ce2b57b59eae@nxp.com>
Date: Tue, 24 Dec 2024 14:47:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/19] drm/imx: Add i.MX8qxp Display Controller pixel
 engine
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, u.kleine-koenig@baylibre.com,
 francesco@dolcini.it, frank.li@nxp.com
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-11-victor.liu@nxp.com>
 <7k2jqpkpagm3x7shywgzvtst364f6dmmhuz2covpbvghoa5rzc@3dvlbdgtnjck>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <7k2jqpkpagm3x7shywgzvtst364f6dmmhuz2covpbvghoa5rzc@3dvlbdgtnjck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:194::23) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: 996d77ee-6e0e-444f-5b22-08dd23e6c7ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDVUNzZwdlQrL21jZWRhby9sU0lDUStPOVdhcWtRY1ExSDh1dENjQkZNTzZQ?=
 =?utf-8?B?TzBUVFRsQjVFSzhiRTZ2b3U4UFJQSWY2eHNPL3A5UWdQb3JmZllvSTZLNU1F?=
 =?utf-8?B?NW5jVEpFdlYySE9oKy95VElwNnVvSG5HM2RvR1UzZWhVRzBZRXRteUhMSnYw?=
 =?utf-8?B?SG1ZVXJtMkVzTmhCMnRJSEdwSjM3YjRQTUdFTjM1TUdoQUo5V0dFWUtkWkY3?=
 =?utf-8?B?ajlwbjQ4Z0RsdFYzY0RWSVZEWGNuTUdSM09OcUU4a08weGlxS2J2WU81ZS91?=
 =?utf-8?B?bzVCSXd4K011eklNQklMd0hiUzhicmJ4Z1hGQnJWMkQ0dlFkbWtINGwzTXpK?=
 =?utf-8?B?alFzRzZFUWZ0aHBzSThCZ2RvTW1xMWRRdlhFNUJGbHFnSW1qSVVBUGtzV0Qw?=
 =?utf-8?B?NFd6ZVhGUGxpUzFZS0tMNjVUUlB3SkNlM05uc3Jna2huMGtPaTk3cFVFTTFh?=
 =?utf-8?B?bVhPYm8zcHVUQjFEVGFreUdhdm5oWDcwVG05bndqMFlSRVkzWW1FMm9HNW1j?=
 =?utf-8?B?Z2VVNDJ1RHZsd0R1bXBDQ0NWelI4Qkhjdk8vQjJCY2tNSDNxeHRoNkJadUlS?=
 =?utf-8?B?bWFUOGVPdDZDeXl4dXcvTnkvbURqQ0NSZXhGYURWWWZtS1MxbmVrZ3UrSTdr?=
 =?utf-8?B?TVpHVXU4VXlxeVQ5ZG9ZUkZ6MXU2ZUpxSkZkcWJKZUtWVjlPTUptTVZ1OHB5?=
 =?utf-8?B?UE1CQTI1SWxTQjdNN3pTelAveVlaUmluakVrc2pyTjdFcTdER0xUZnpuVldS?=
 =?utf-8?B?aU1OUjFZbnB5a0hYNXM4REgyRytHM1dlUlJhUTJ1L2FsTkNOSTdzOG0wcExG?=
 =?utf-8?B?bU55UWphcjBRN05jeWRXN2VVNjVwZ1BxTlhZOFhJQkVuRXBXZ1dya00yZ0dM?=
 =?utf-8?B?UnV6cEVUZ0NCRk53RWVKQ0ZFMkFobmQyQmViby9zMDZ5WFAvMFdEa05PUEJC?=
 =?utf-8?B?UzVZb2EreGNlOFYwbjRWU01vT1RWSkZoU1E0UWEyeUV1N21nUkpFdUdTRmRy?=
 =?utf-8?B?SmZaQTdGbXZIYW5LSUtVYkcwTVM4NHVmV28zUXdvZjZiVy9PRU4zNVIwRDdp?=
 =?utf-8?B?UHIwUFlIZTgzM1lzanpPcHU0YWJnWUJFMGQwSmw5dTN3VVJXOUlPOHhFZEFr?=
 =?utf-8?B?eCtuSEJLN25yQ0VOVC82MURZV0dFTElTUjl6OW13VGtCK0tmV0F2RFlJOVZH?=
 =?utf-8?B?bUcvbDJod2p4WjltQStjV2xmSC9XWXV1dlY3b1N3dGxqd3dKUkxBOW4weSty?=
 =?utf-8?B?eUg3bU9TeEM2dXdTNVhBdU9hNWJiMkpNdXJXQ3Q5NDJQbzF4YlZGaFo5UkQx?=
 =?utf-8?B?NU1JbjNlaU5EZVBTcUk4Z0xWWnJ5Z2hHcE1ac0x6Tm5FVHcyT1YzMGVyKzlv?=
 =?utf-8?B?Y05Ob0xjZGRhT2pWZ2NYeitBb01pNnVscGtpS1BrWDB1YVUreFREc2E5UlZI?=
 =?utf-8?B?M1MzWFNJcUoxNUhkZmVvTHZTNGZUZzVXZXBtY3NsMkZDUFVaT1ppWHp6YTZY?=
 =?utf-8?B?VnFiNmJGUUVPUWNBbTllWEdYNDgxLzl4bjIvK2dhdDdhU1hndjJEekdtNnRB?=
 =?utf-8?B?cmJERnQ4NUlEQnR6Sjk4cGJaT3hQYXhteHFWcFBaTzVha0duSDNFM2lUTnpM?=
 =?utf-8?B?NTg2aGt0cVdmNUJHemxoaExlWXdUbjVWR1B2M3NVMkJIa3Y5TThxdm0rY0Z0?=
 =?utf-8?B?NzllOHkrWVRUMzQrY2hxdVhIaDRNdncyTVF4c1pwSTBDaXYrdDk5cUN0Q1N5?=
 =?utf-8?B?U2VSWWQxOVlLcVJPcmtPaGdSRjE0aEprWU5jRmhaaDk3MHdxdTNMcS9JUUFQ?=
 =?utf-8?B?Sm1lQld5Q1VXdG43azIvc0xnMzF6RjdQY0JTUDZHdmN6NVRiMjRhakNMMzY5?=
 =?utf-8?Q?XXZDEwWqEllCI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmNKRWxJbGtnaGxqNmsxaXVITEhaYXhHajJNM1Y3Z3NqT3B2QnkyQ0dLZGlq?=
 =?utf-8?B?MWQycUFPM1lLeENUN01SUlM5WkFLUXYyWXZ0WlV6czI2MUl1ejM1QVZyeTRs?=
 =?utf-8?B?eGlEd2tyODFEcm5kWWN4WHEyT3RaMWxMbWV6TTFnTmFySDdFTW0xdWlBZHhV?=
 =?utf-8?B?cUlmMEMvNWROdmJlU1J3a3RNa1g1Nkg5N0VPLythUFl6ODQrVkV2TkhLRWtv?=
 =?utf-8?B?SDdqNWVLMGtheTd2ckhKVmI0VGl3NUZzbFh2Si9XK0ZlSUtROG82MCthdkJp?=
 =?utf-8?B?cW9jRnJFSDJZdUc5UlRadmllMG1EUkdsTEZtb0U5eFliQWJGaEh6N2JyWmY5?=
 =?utf-8?B?Y1lSaGFoeERJTERlSnoxVTN4SDFpc2pSY3NqUTJobUM2b2p6K0lwTW11Vis1?=
 =?utf-8?B?ZG1YQnoxYWRWbVNEcTlzZEE1VzNDanRYTitJMWYyN09vZ2dRNUpLVmpSVCt5?=
 =?utf-8?B?elBtUkRBRlNFQVRGOFRNNmFhaFJiK3hYOWttckJtTzUwd2ZFM3pZYU1McWlJ?=
 =?utf-8?B?YnZJYmMzNUhVaWtBZlVEMFVlTXZJWTk5MjBONnNzT1RRSzFpbW1mREgrS0Fk?=
 =?utf-8?B?OVliVHgxZVpEeGdMVWMrMVZrQWpMRkdSa21VdnBaWHZpYzh6UmdPMDdsQkpt?=
 =?utf-8?B?eGdDZ2ZTdXQxYzZKSWQwRzU2Y0RhNUViNDBTRElNQmt0RDdqMnNnbVJjMUxJ?=
 =?utf-8?B?MUtqcDVnVjRWSUN0L0pZUU10MFBNZkZJTjBGd0FLYU9WTFR3T3lmbzFZcDVi?=
 =?utf-8?B?MWtCaG9JeG01Z3NOcmhycjJ1endkQXVuTG9xQVVDTXloSEVwT2UrVzM1OHF0?=
 =?utf-8?B?Q0JLNEdMZGpQZUpuWmxuWWRhNW9qSEpheGdNbUl3OFlDNTNoSzNubGJkTUQ5?=
 =?utf-8?B?V25ma3hFclk2RmdDUUszeXZrQ2JPWExMNFNLOVZXVERjYlNRTFhjUHNuL21i?=
 =?utf-8?B?N1NCQzI2c2NIRllnaEZjNWRIWG5yQmtuVm8zajJkbmtnd1Fxc1BvZUtRd05x?=
 =?utf-8?B?MHJGWXJXbUhzNTk0aTZiTGZVRTUzVDUyWlhZeHlmeWJzVHVLckVHdHZUb3k4?=
 =?utf-8?B?eXRJSjkwaTBVSTVzLzBPWE9XUmFxbFFFa3lyR2dSRGVsOWNoR2VrVzg2TWRF?=
 =?utf-8?B?V0xPQmJ0OFVGaFF0OGNWSkQwVGRRdWZtSEY5NWlqVkt0SGZ3amZYUXMxemth?=
 =?utf-8?B?TWZHYUs1WnhMcmdGWXBNdkMyOGtaUW1lSW9wa202ZjArUXYyUU9KNWszWGwz?=
 =?utf-8?B?empaZXhNZ0xVWTk0N01taG00SndnK1NOL3VqUm5XaDBHQ3dLT0Z5Q1lLTGhE?=
 =?utf-8?B?S2JMQmY4dVNwMllzZElWQVhJUVpHU3l6ZWVpb2x0NWpyN2h2N0hUNVZ6THlP?=
 =?utf-8?B?SkhKMjQ5QVJXWE4xd05VcE1ETWsrNTdzbFR3K05nMWFJNDVvSkFKT1pSdXZZ?=
 =?utf-8?B?ZWlDRHF6cDR5NUVjWEhnZ29zdk4yenkzRzlsRWs0cWc5WEdjNkdCMml6Rm4x?=
 =?utf-8?B?NlRNOGhUd3RTSzQ5dEsvRzNMdXpDSTFtRHpmVHo4ZWVTclY0clg5bUd2ei9H?=
 =?utf-8?B?WVZvM1ErbDROVkhPUkN6ei9mRVdHSXNITWo2R3lTZnFBOFBJb2RLRzJZcXZC?=
 =?utf-8?B?djQwamkxKzlSaVlZMlF4RVZQbmpBWkFHYUkrVjA3RCswL05sOEsvV1JCd1dp?=
 =?utf-8?B?RFBLei9QMGh2K3ZRdEgrNlNlUzNFMnUyNmthUXVpclhYY3lOUzJqdnhBUXpU?=
 =?utf-8?B?S3diblh4eEhrRk01VFhOcFVmQjhTRDhqL05IK2Rmdmd1R29lNlZ3V3NvWmts?=
 =?utf-8?B?RDJvMkQ3RVRXeVAwT3RNOWg3L1A3dFJrcG9VRVBXcHFaQVRtaitzY0kxaWJM?=
 =?utf-8?B?YnBRUGpEUnE1RkxQbnJuQmFBbFdiZzl2Y0pwdWdRTEx4Y1ZyOUE5UExiQXFx?=
 =?utf-8?B?Y3Ivd3I2cnVnMmIwZFcwZjdXVzhJSmk0MXFNTU93alRwV3lqOWpwaGJBMGJh?=
 =?utf-8?B?c3VtWHZLSE5aSi9sV0hHWnJLak5ONU1iSWVTWVQ2YjNMMWRyWjlyZHlqRXYw?=
 =?utf-8?B?RmpJOUVpVWdpRWJFbGhPaGlZY25qZDc0L1B0UjJ4MzE5RktaWDgxZVp3T1pE?=
 =?utf-8?Q?w5USn6a0GdH4oOp5YENB1CgEl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 996d77ee-6e0e-444f-5b22-08dd23e6c7ac
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 06:47:05.7778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxPJ0LLGSkxR/kndMN20yfgXJH+MPgUoPMPEGb8NByWpUCSECPnzNuyRJi0EPLObi/8sWXfAZPXrZV718sKazA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8082
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

On 12/23/2024, Dmitry Baryshkov wrote:
> On Mon, Dec 23, 2024 at 02:41:38PM +0800, Liu Ying wrote:
>> i.MX8qxp Display Controller pixel engine consists of all processing
>> units that operate in the AXI bus clock domain.  Add drivers for
>> ConstFrame, ExtDst, FetchLayer, FetchWarp and LayerBlend units, as
>> well as a pixel engine driver, so that two displays with primary
>> planes can be supported.  The pixel engine driver and those unit
>> drivers are components to be aggregated by a master registered in
>> the upcoming DRM driver.
>>
>> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> v7:
>> * Add kernel doc for struct dc_drm_device. (Dmitry)
>> * Fix regmap_config definitions by correcting name field, correcting read
>>   ranges and setting max_register field.
>> * Get instance numbers from device data(compatible strings) instead of OF
>>   aliases.
>> * Collect Maxime's R-b tag.
>> * Trivial tweaks.
>>
>> v6:
>> * Fix build warning by expanding sizeof(fu->name) from 13 to 21.
>>   (kernel test robot)
>>
>> v5:
>> * Replace .remove_new with .remove in dc-{cf,de,fl,fw,lb,pe}.c. (Uwe)
>> * Fix commit message to state that pixel engine driver is a component driver
>>   instead of a master/aggregate driver.
>>
>> v4:
>> * Use regmap to define register map for all registers. (Dmitry)
>> * Use regmap APIs to access registers. (Dmitry)
>> * Inline some small functions. (Dmitry)
>> * Move dc_lb_blendcontrol() function call from KMS routine to initialization
>>   stage. (Dmitry)
>> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
>> * Drop unnecessary private struct dc_*_priv.
>> * Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
>>   interfaces to bind/unbind the drivers.
>> * Make some fetch unit operations be aware of fractional fetch unit index(0-7).
>>
>> v3:
>> * No change.
>>
>> v2:
>> * Use OF alias id to get instance id.
> 
> Carrying several comments from previous patch:
> - shdld vs shdload

Will change IRQ names from shdld to shdload.

> - use of indices in the compat strings

Maybe keep adding indices in the compatible strings since I explained in
my replies to your comments on patch 3 and 9.

> - bind() behaviour depending on the particular order of device bindings

As I explained in the my reply to patch 9, bind() behaviour is deterministic.

> 
>>
>> +
>> +void dc_fu_common_hw_init(struct dc_fu *fu)
>> +{
>> +	enum dc_fu_frac frac;
>> +	int i;
>> +
>> +	dc_fu_baddr_autoupdate(fu, 0x0);
>> +	dc_fu_enable_shden(fu);
>> +	dc_fu_set_linemode(fu, LINEMODE_DISPLAY);
>> +	dc_fu_set_numbuffers(fu, 16);
>> +
>> +	for (i = 0; i < ARRAY_SIZE(dc_fetchunit_all_fracs); i++) {
> 
> for (i = DC_FETCHUNIT_FRAC0 ; i < DC_FETCHUNIT_FRAC_NUM; i++) ?

Ack.

> 
>> +		frac = dc_fetchunit_all_fracs[i];
>> +
>> +		dc_fu_layeroffset(fu, frac, 0, 0);
>> +		dc_fu_clipoffset(fu, frac, 0, 0);
>> +		dc_fu_clipdimensions(fu, frac, 1, 1);
>> +		dc_fu_disable_src_buf(fu, frac);
>> +		dc_fu_set_pixel_blend_mode(fu, frac);
>> +	}
>> +}
>> +
> 
> [...]
> 
>> +enum dc_link_id dc_lb_get_link_id(struct dc_lb *lb)
>> +{
>> +	return lb->link;
>> +}
>> +
>> +void dc_lb_pec_dynamic_prim_sel(struct dc_lb *lb, enum dc_link_id prim)
>> +{
>> +	int fixed_sels_num = ARRAY_SIZE(prim_sels) - 4;
>> +	int i;
>> +
>> +	for (i = 0; i < fixed_sels_num + lb->id; i++) {
> 
> This function and the next one silently skip writing link ID if it is
> incorrect. Can it actually become incorrect? If not, I'd say, it is
> better to drop the loop and the array. If you are not sure, there should
> be some kind of dev_warn() or drm_warn().

Will add a dev_warn() in this and the next function in case prim/sec arguments
are invalid.

> 
>> +		if (prim_sels[i] == prim) {
>> +			regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC,
>> +					  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK,
>> +					  PIXENGCFG_DYNAMIC_PRIM_SEL(prim));
>> +			return;
>> +		}
>> +	}
>> +}
>> +
>> +void dc_lb_pec_dynamic_sec_sel(struct dc_lb *lb, enum dc_link_id sec)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(sec_sels); i++) {
>> +		if (sec_sels[i] == sec) {
>> +			regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC,
>> +					  PIXENGCFG_DYNAMIC_SEC_SEL_MASK,
>> +					  PIXENGCFG_DYNAMIC_SEC_SEL(sec));
>> +			return;
>> +		}
>> +	}
>> +}
>> +
> 
> [...]
> 
>> +
>> +static int dc_lb_bind(struct device *dev, struct device *master, void *data)
>> +{
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct dc_drm_device *dc_drm = data;
>> +	struct dc_pe *pe = dc_drm->pe;
>> +	void __iomem *base_pec;
>> +	void __iomem *base_cfg;
>> +	struct dc_lb *lb;
>> +
>> +	lb = devm_kzalloc(dev, sizeof(*lb), GFP_KERNEL);
>> +	if (!lb)
>> +		return -ENOMEM;
>> +
>> +	lb->id = (enum dc_lb_id)(uintptr_t)device_get_match_data(dev);
>> +
>> +	base_pec = devm_platform_ioremap_resource_byname(pdev, "pec");
>> +	if (IS_ERR(base_pec))
>> +		return PTR_ERR(base_pec);
>> +
>> +	base_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
>> +	if (IS_ERR(base_cfg))
>> +		return PTR_ERR(base_cfg);
>> +
>> +	lb->reg_pec = devm_regmap_init_mmio(dev, base_pec,
>> +					    &dc_lb_pec_regmap_config);
>> +	if (IS_ERR(lb->reg_pec))
>> +		return PTR_ERR(lb->reg_pec);
>> +
>> +	lb->reg_cfg = devm_regmap_init_mmio(dev, base_cfg,
>> +					    &dc_lb_cfg_regmap_config);
>> +	if (IS_ERR(lb->reg_cfg))
>> +		return PTR_ERR(lb->reg_cfg);
>> +
>> +	lb->link = lb_links[lb->id];
> 
> lb->link = LINK_ID_LAYERBLEND0 + lb->id ?

Ack.

> 
>> +
>> +	pe->lb[lb->id] = lb;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct component_ops dc_lb_ops = {
>> +	.bind = dc_lb_bind,
>> +};
>> +
> 

-- 
Regards,
Liu Ying
