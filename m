Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CEKCW3hcWk+MgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 09:35:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8BB632A9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 09:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2966F10E90D;
	Thu, 22 Jan 2026 08:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="eRHjYd0N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazolkn19013081.outbound.protection.outlook.com
 [52.103.74.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E334110E011;
 Thu, 22 Jan 2026 06:25:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vp03DSq7vUZUuoXh5PDD3UeUhfEBSTS3I3Bh7H8JkEAIwENfS8wfzCSmRc2kyT+WLDZBupKldaUO9giqiSZj1BxHkilYdXww2hTbY5AwfpBMdiXggys/zVkfPhkW0418Hl+qE18MZM70jd1Rn/vYKkDc0I0T5sCBlxgEK+H4xaA3kCNUet59AhriXOlXRa62Fh983vagwyr312Fk0ftITJcv7p/ffNt6CcZUybL2I4Pp4szqjZfqdu6MNrm3nIIfsjQiTgHwV0zZFSLbN5hHNvid05Q28JT3JN1G5ljmz/gQQ4QU8uHGYE1gDHMnSGjkzsCPEIm2bXUgn3eg965YvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjUNGv7igRaul/G+BVo2cbuWLiGXmoe1VEXGChMawj4=;
 b=TO3olM0McpeGxeLVR5L8ndYc27ZbRqLyhnCokLUqumpTJxPUMQFBltmwxlkUV/ZBumA7rVUg10sbnD75e+18vGZyG7BK2vNEShDthwuyYaQ/PhCQ/yBQETl19fqgW3kebc43GMl3UaaFyOKrcPfHku4BivIoaXNa0ZeBr90bp0SHXBFnwuSuOhiuqxly2UeFsvXrDSymSAM4Hr1c/cAA6UgAeeDhEWi7QQ16zIxQlD59Ah1/+BFoW7x5V54wNvzPcfl6xUygAuOzNnwUefZDxT8qMYdDCYrGGrM/6/wDvcr4PDf5889B4IiIGMEnZXg7E9ObMbaOP+Gjt+9WICVIOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjUNGv7igRaul/G+BVo2cbuWLiGXmoe1VEXGChMawj4=;
 b=eRHjYd0NA5vioSub007FSnlfIZ72IBiOP7TVKRppgktHLHROG1AP2yVfSgtOk7Mm/jH5xomwGb8SvjBKtDhjMjkrpq25smmk8cFRag+hKRyktn9rLrNWUJkmrbSzFUddv/3UYB+PeBV4i4hng0LXA81HzWhImB2SieSMe2/YpGuvP2BJdzwyACODmOqxfTh4uPCO7bd+LLwRbukjgh9MlfssKTEgAjA6ihXC9s72NpwKdijF73nN+zFDsbl4hJNQNQ3v1FBSfvhEBpITthe/UTUcZAPMwa5TCqMIhQgpFWhLvJU+4ui1DcojWAT2jEAEQFaAa5o/G7lQB8G9IIji4Q==
Received: from SEZPR04MB6873.apcprd04.prod.outlook.com (2603:1096:101:ee::9)
 by KUZPR04MB9011.apcprd04.prod.outlook.com (2603:1096:d10:47::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 06:25:11 +0000
Received: from SEZPR04MB6873.apcprd04.prod.outlook.com
 ([fe80::9243:8aaf:c6fc:3d62]) by SEZPR04MB6873.apcprd04.prod.outlook.com
 ([fe80::9243:8aaf:c6fc:3d62%4]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 06:25:11 +0000
Content-Type: multipart/alternative;
 boundary="------------lA2uZMDc0F0GsDmF5tKx0eSF"
Message-ID: <SEZPR04MB6873ACB11571FA18D6DC6459A397A@SEZPR04MB6873.apcprd04.prod.outlook.com>
Date: Thu, 22 Jan 2026 14:25:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, kancy2333@outlook.com
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
 <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-3-bb3f95f1c085@linaro.org>
 <hmnyvxz7ashufiiil6hf4lg5g435e53zd3xla7qeqcb2styrqg@jkbjl6arm33g>
From: Kancy Joe <kancy2333@outlook.com>
In-Reply-To: <hmnyvxz7ashufiiil6hf4lg5g435e53zd3xla7qeqcb2styrqg@jkbjl6arm33g>
X-ClientProxiedBy: TP0P295CA0045.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::16) To SEZPR04MB6873.apcprd04.prod.outlook.com
 (2603:1096:101:ee::9)
X-Microsoft-Original-Message-ID: <04f2436c-09a0-4537-922f-faba3d5745dc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR04MB6873:EE_|KUZPR04MB9011:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e5f57f-fb77-4a85-3b86-08de597efea0
X-MS-Exchange-SLBlob-MailProps: obhAqMD0nT97+9kgwgO/mqEGtcymhevmDsx7bczaaPpGv+b4/nHJOgetGeRIqou2Bj3P77TMQuXQMPqJCII7izMjramB9AMhvMX16tr9gZBxJyQsxkD+QSWhAvCI4L8my2YhBLz56dcKmMZGHdODOkPaje10GaftJpdRmp1v347A4OZEzI4Rn76RN2tdq5uGn+Fdy9asPZkMiqeIoxQy4Z8VLAKNP71nSsXmGBES/r8wBNpMuu4jgXxofieoqhwaf5tCavsV0gwul0lx8Ghq4P+7TJS4L+0ZFQ462jAVEKIgwvVzRHhw9IAcEpUVNof6AAA5rbUq3Bk+uVRFzHcEg8o3InswfOKpYZtXr/U39iZrWxx0+WhU32A2o33AtOzYPlDDbXV9CvTbQgh8D2C4/588gpkghXWPKI2096uheeu/2RgOZXsenWi8O+Unqap+xAEOO+GvsCSvGL0aC9NkPHT91s0IVL0mc7RPy1JnjzPOPV/G0pqZ2YIcANG9BTLxeU7OlXfnhBEwTd5mfOvAI5oNDk/kwxlDVsrsTgO2+ogLFbmveljU8OtJk0gtT1YY0Az0ODKqoV9uHULhy+ZBBqI86tARFmuTfmBCJ2UqPvaD5oSfrTZTgFHhEfHGm5azUKCOtcm+I2Z3NYVQAaCV5v6cSYxiUVEcO9dPWXMlFnT/01KK5BrtG6yFSp8NYN1g+Z9Z+4ynIUL2kzOARrXh/cCiSW4AlYLH8P/4IRKnuQSpyZm9UA3ajxBkkqgKyZVFo8zOFtw1WAtcaIUYF9rEsAQ3Emz3EyUMHvWoju8Gkjg4ABadM0IRnrBLmUmh/55U
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|461199028|15080799012|39105399006|5072599009|41001999006|8060799015|9400799043|19110799012|12050799012|23021999003|12121999013|3412199025|4302099013|440099028|10035399007|41105399003|40105399003|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkU1cGQ3SmRaa1VLUDFvV3hzTXIwSGhrOU1IRisyOTk4QTFvN3FpU3V4ZkNV?=
 =?utf-8?B?a080WjVqcktBUGFaT3dDMUNaODl0WS9RZjd5WTRzdHVYRnlqRnRmekI5RGRS?=
 =?utf-8?B?NW1JVVhRUldJRU4vcXFTK1ozazQvZlN6MmJBTnJORXR4L3pzQXNzWHdIY3hD?=
 =?utf-8?B?TmkrTU5IenRKRjZBTzFLVGhTNmNLVHcvdzRuS1VtSEVBWG9aTytEM21FS1Rn?=
 =?utf-8?B?RnZJN2lTSzQxNEllSDJSb0J3WWNyVFVlZVlBSkhoRXRJeVIwZ09PaCtyakI4?=
 =?utf-8?B?dWd6MlcvaSs1OTFCUzRndjVucE4xY1J3aGpEaExQd0cwSVQ2WkY0OFJWRmwr?=
 =?utf-8?B?Tkh3Y0dCVDdkZWJ1enNyL3huakVyQVBWWlNEMHZ4MDhpWTI1NDJVMHJmWEw5?=
 =?utf-8?B?anpYNmdnemcvdlZRckhJQlBMVkRXNG81UTBwdGFVZ2psQnArWUtrNElONXhZ?=
 =?utf-8?B?dG1LR0NQRFU0eHhHSmhidzh0aVZkMGsvckZuTDNYeDcrZDBNME5OeXBrVlla?=
 =?utf-8?B?UW5GanE4MGlQV2VOTjExWnA1dGIrUTF0WSt6cDd0S2JPaWhkK2lBdXpYSXVM?=
 =?utf-8?B?RElNdFpWdEhmMXAzUDRmNTN2YWgxOHcvZ2xQMjROTUVTVTZIWDBpME0wUDkz?=
 =?utf-8?B?Mm5udGlMYzYxUC9qa1ZIaDIyWnVUcEhQSkRVUXdsdVgzSHhUTXBpRWFrekdC?=
 =?utf-8?B?MUl2VDV2emtGenZTWlBBcW9iaFJrWmNVZFBodHEvUDZmVGUybGdUTUhFWFdo?=
 =?utf-8?B?WTBhRWJiYU1xc2V4YWRhOFNQbEtHOTJIZEZmRXZ2dndGOXo0bERkNmJRK0Zq?=
 =?utf-8?B?Sy91d2hZVWRLQkYxM2NNQlkxNVFFU0tVUUxVdUJCSUs0U21wc0c0QXFSN3pN?=
 =?utf-8?B?YWJNMEMxV2NibC9uUGp0bFN6cko2RVpWUi80K3hiQ0ZyU1pyTituMTB0MnRo?=
 =?utf-8?B?cFVieHNXYnF1S1I0VlYwUDJDTUxEVjl0T21EbWJjUENjb1lSRGViQXQ3dTMy?=
 =?utf-8?B?MVE1cEt4U3JtMnpZdnRWa1NlclRoUU9JTXJ5QlZWWXJuL1JvVElGVEZaaith?=
 =?utf-8?B?NzZJYUh5TXpIRm9TVkhyWGlkak10RFA0Q0lkZTJHbGFhYng2Zkl5QUNrU3pM?=
 =?utf-8?B?ZnVwYlpDNXU0Z29yQnl1WnE3L3dtRXdERW9YVDlVOEJSYk1yT0lVMVFzcUVV?=
 =?utf-8?B?ZlZwN0hZaUFRaFU4MVdWdzBwc0xNeloxQkNuSFJEQitpZlo2d28zSCs5TWlS?=
 =?utf-8?B?YkJmWG1BY3I2N2RVMTYyWUdSTnhaNWhqdk8zWGJSM3QvdmZJT1JOS3pGamF1?=
 =?utf-8?B?NkY0S0p0N1ZwNTZDeWNiU25zcTR1WitrakpDSDdVdE5zWnJsSHhmWDRXS29W?=
 =?utf-8?B?SlZVSTIxYXRzMTFxdUFBdkZBSHpwTzgwMXdxQjFDSzU2VWw1UTVNdm15ZkU0?=
 =?utf-8?B?c0ZQMVdac2hZWFNteElJNm5VZncvc3dWbW96MjJqQkY3OTJTRy9oV2JNbDg0?=
 =?utf-8?B?am91K1BOYjkxUHNlWk1LZDZmUzVZay80RENCUm8zZWhYc0t4eGJFNk50REF1?=
 =?utf-8?B?RWI2ZzVwcG9nb1RpMjNTMDhIMU9IWGpTbkpzeWVWYVY1bG9GakFMOU1ia0Nm?=
 =?utf-8?B?WVlzdnI1dkJxUGtnTVNlRzZWeDVRdmdxK0RKbFdKWXJNVTZ2OHYyNThGYmFr?=
 =?utf-8?B?SXh5c1VjdWdDWGV6NnFjMmdBQkwrQ2IvTEQ1clZRbHZCbWpaNGxhVFJON08w?=
 =?utf-8?B?cEw2ZklVaXZYdjlUNUtUY3ZSSXFKSkRJclE4cnhNMkYwam5OSXJxQlhtOTRY?=
 =?utf-8?B?NVBBaStTUkVFTnlQZ2pyQlk0WUxkcE9WbTJ4WmZUdUI5SWQ1eGZ1REsvRTN2?=
 =?utf-8?B?Snc1RFhCeHIvYjJndWx6Ulc2ZDMycHpLanF2bHZ5VS8vcTQwWSsySkRGMm9t?=
 =?utf-8?B?bnRCeE1PbS8rMHBaNXRZZXdkZ0FCcldBejM0bWNrY3V1UlozeHduTC9XVjVU?=
 =?utf-8?B?R3hyREVPQzhoakxvcFJNeHNoOXVjT0hGcGREU1dWVFE2ZnVISktYNnV1K2d1?=
 =?utf-8?Q?e41Pcy?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGlpRzdKdWNJdW0xK0NkTFpqR2l2K1RVSHNrbDhJbWZpb1dPUGxGeXZiaVp2?=
 =?utf-8?B?K1FOdmljRnN2V2ZJazRXRFVMa2RweTgrZEZsRGJjSCsyMnZobFFQcnc4NHY2?=
 =?utf-8?B?TTF3WWI2WTAyVzZ2QmdXYkZ5ZEZraVRuZ1FTY1BxRXBJdlc2dnp1c0Q2VEZs?=
 =?utf-8?B?aHZUSXhvU1FxdzU3bzZJTGltRThXQVZQVHBQUXN2Y0FSMHJuLzFIK2ZJL2pY?=
 =?utf-8?B?VFVFWStGMStTazBKVDVMRWoxWElDVlhCNG8vU0dHNDZnSHVSRXRIbmJwQW1m?=
 =?utf-8?B?cUYraVNDTXprMVpjZVZpWi9uV2ljcXg1a0FVNXpLZ2tpN1JRMWh5enN3Kzhj?=
 =?utf-8?B?ampoeHNhOWdZMHRHVTU2Q2VtT0U1aVNESHQzVnRpK2dic00vdXdVbDZYb21B?=
 =?utf-8?B?N1hHUXRXVjVaeWU5U0pQWHF5NVhMLzVWeXoycVBYUUI3Sm81SEM5L1ppSWRz?=
 =?utf-8?B?dGlpV3VTbHpxVU5oeklya2RjU2VsWGJFeW5kMzVDUm5CdjhUSXErN3dmUGZF?=
 =?utf-8?B?QVpmZkQwK3ExRG9nMmY3eDh5WDB1Nk9mdzV1dXRmQ2MzVE1kMFp0VnpUZE4w?=
 =?utf-8?B?NFdnc2xxRFJyQmw4VHRMUHZwN3NlME5TeFc5TW1DaXN5dHpiRkdKd3NhVUFL?=
 =?utf-8?B?RDEzaFkrVW92YncyLzU2QU1HcW94NVdqNmVZQytLT3ljUE9OV1VYWDFMajZj?=
 =?utf-8?B?SUs4SEhhdC9YaU9abXFRMFZQZnpsa1hKSE5TU2FvTE40dGJnd1VyMkw0Tjcz?=
 =?utf-8?B?dExYQjh2Tk1teENnbFpGd3BPWnZ1NDZoMUpSdEZGbjI1K25DNE9vdm1Gclo1?=
 =?utf-8?B?Vm9qV1RkdzJCNXZ0Y3BjRk9mNUdDK0FkdmdDNUhMWXhQYWxhanFWS3hGczhu?=
 =?utf-8?B?TS9ENnpVbXV2clAvakdLK1NwV1NuTExJSndyTk5aa1pENjQ4alNWOTFrNzky?=
 =?utf-8?B?eVROUHFhenJ1cWFvZ0gxWDRmUTlrY29JWVZNakNLeGtZYUlSTVNXN2tKZkox?=
 =?utf-8?B?UytEWks2T2pBaFVsWUp6eXJndWU4VDRNUWFSRXJJendDa0lSTmtaR3lUb2xz?=
 =?utf-8?B?bVdzSWcxMmZpUm9tRDVndlhjTHlZZmNYS3dqeUdoRTIzQlFablJjbm5EOVdC?=
 =?utf-8?B?TlRZM1lXc3lFS0FRbmRnYy9Mb0NhM0JuUDNINlRtaW1zRjZyVFBWMEJibDhD?=
 =?utf-8?B?WWxZRXhRbmJMc24zeXVQVW16MktLYUIzWGVQSkpXdy9OMmZJNlNHL00yR1NG?=
 =?utf-8?B?NDBYY1NoNXRra2VvSDVFd09OZFNJWGV5dW9XVFN6UlovUVBNY0FsaXlCZFZ6?=
 =?utf-8?B?M2dDd3VUSUFoVkRjZ3F4SmxjRUUvT1dzR1djRUhSSklTdUdVRXRpMDdubXl3?=
 =?utf-8?B?cU51MDA3UXBVMVpoS3IxTnA4bGdqNkRyS0xVRjEweDNGUnN2R2FOd3NnN1Z3?=
 =?utf-8?B?N0UxTnJySjl1bXEybjM2R3psWWF5Z0tDclRpUWVCMUJJS05sNHFMNDRDYmVL?=
 =?utf-8?B?VFpoMTdiQlBNdWthTTBmcFJUOE9MaUpyMWZtMnpibFFobXZ4dnBDYmJ0Tnhi?=
 =?utf-8?B?c3N6cm9RaWV4aEkvdjF3TXh4QlF6N3pJRlhPOFcvOGx6K2VtRnBJeE8wZ2xP?=
 =?utf-8?B?emFvbUJiUFZZSmw5VVRQRGU2ZHZMelZtOUN6cmRKKzJVUHhaUjF4MnBkaDN5?=
 =?utf-8?B?NjdHL3hVL0dkNDNJbXNmK3NQS3VsRnhNM1R5UjRiTUxsR0hYN2dPek1ERStM?=
 =?utf-8?B?ZkhIYUU3ZDZoN3pEczV1RFRQS1VlMFZ5NmdnY1htY1lEMFRtdnVIL010TTJN?=
 =?utf-8?B?NWp0dnJxczg0azU2NTVxMVlVZUhLNWZaL2owZDdYMkZCN0RjdHZJMFFFWk1H?=
 =?utf-8?Q?h4m9cQtouNdJs?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e5f57f-fb77-4a85-3b86-08de597efea0
X-MS-Exchange-CrossTenant-AuthSource: SEZPR04MB6873.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 06:25:11.1630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR04MB9011
X-Mailman-Approved-At: Thu, 22 Jan 2026 08:35:53 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,outlook.com];
	FORGED_MUA_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kancy2333@outlook.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DKIM_TRACE(0.00)[outlook.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,linaro.org:email,gitlab.com:url,outlook.com:email,outlook.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,e:email,1c:email,0.0.0.0:email]
X-Rspamd-Queue-Id: 5D8BB632A9
X-Rspamd-Action: no action

--------------lA2uZMDc0F0GsDmF5tKx0eSF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/22/2026 9:30 AM, Dmitry Baryshkov wrote:
> On Wed, Jan 21, 2026 at 05:40:28PM +0100, Neil Armstrong wrote:
>> From: KancyJoe<kancy2333@outlook.com>
>>
>> Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
>> on the Qualcomm Snapdragon 8 Gen 3 platform.
>>
>> The design is similar to a phone wihout the modem, the game control
>> is handled via a standalone controller connected to a PCIe USB
>> controller.
>>
>> Display support will be added in a second time.
>>
>> Signed-off-by: KancyJoe<kancy2333@outlook.com>
>> Signed-off-by: Neil Armstrong<neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>>   .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 1445 ++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi               |    2 +-
>>   drivers/gpu/drm/msm/dsi/dsi.c                      |    4 +-
>>   4 files changed, 1449 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 6f34d5ed331c..1ba29755e5ba 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -313,6 +313,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-qrd.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-samsung-q5q.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-sony-xperia-yodo-pdx234.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-ayaneo-pocket-s2.dtb
>>   
>>   sm8650-hdk-display-card-dtbs	:= sm8650-hdk.dtb sm8650-hdk-display-card.dtbo
>>   
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
>> new file mode 100644
>> index 000000000000..141d92933957
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
>> +
>> +&i2c3 {
> clock-frequency?
>
>> +	status = "okay";
>> +
>> +	wcd_usbss: typec-mux@e {
>> +		compatible = "qcom,wcd9395-usbss", "qcom,wcd9390-usbss";
>> +		reg = <0xe>;
>> +
>> +		vdd-supply = <&vreg_l15b_1p8>;
>> +		reset-gpios = <&tlmm 152 GPIO_ACTIVE_HIGH>;
>> +
>> +		mode-switch;
>> +		orientation-switch;
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				wcd_usbss_sbu_mux: endpoint {
>> +					remote-endpoint = <&pmic_glink_sbu>;
>> +				};
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +
>> +				wcd_usbss_headset_out: endpoint {
>> +					remote-endpoint = <&wcd_codec_headset_in>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&i2c6 {
> clock-frequency?
The clock frequency properties are not defined in the qcom reference 
devices' devicetrees. The default frequency 100khz works. If they are 
required we can add them in next patch version.
>
>> +	status = "okay";
>> +
>> +	typec-mux@1c {
>> +		compatible = "onnn,nb7vpq904m";
>> +		reg = <0x1c>;
>> +
>> +		vcc-supply = <&vreg_l15b_1p8>;
>> +
>> +		retimer-switch;
>> +		orientation-switch;
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				redriver_ss_out: endpoint {
>> +					remote-endpoint = <&pmic_glink_ss_in>;
>> +				};
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +
>> +				redriver_ss_in: endpoint {
>> +					remote-endpoint = <&usb_dp_qmpphy_out>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&iris {
>> +	status = "okay";
> With the default firmware?
Yes. The soc in the game console is unfused.
>> +&remoteproc_adsp {
>> +	firmware-name = "qcom/sm8650/ayaneo/ps2/adsp.mbn",
>> +			"qcom/sm8650/ayaneo/ps2/adsp_dtb.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/sm8650/ayaneo/ps2/cdsp.mbn",
>> +			"qcom/sm8650/ayaneo/ps2/cdsp_dtb.mbn";
> Is it fused?

It's unfused. For adsp it contains battery/charging configurations so 
it's required to be the vendor's one here.

I'm not familiar with cdsp or what cdsp does but for stability i used 
the fw from vendor. Additionally, the default cdsp/adsp/vpu firmwares 
are not uploaded to upstream linux-firmware repo so I was not able to 
test the default fw. (See 
https://gitlab.com/kernel-firmware/linux-firmware/-/tree/20260110/qcom/sm8650?ref_type=tags). 


We will use the default one here instead if cdsp is not device-specific 
or the default fw works on it.

>
>> +
>> +	status = "okay";
>> +};
>> +
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 07ae74851621..fcd5a1a45803 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -3917,7 +3917,7 @@ opp-32000000-4 {
>>   				};
>>   			};
>>   
>> -			pcie@0 {
>> +			pcieport1: pcie@0 {
>>   				device_type = "pci";
>>   				reg = <0x0 0x0 0x0 0x0 0x0>;
>>   				bus-range = <0x01 0xff>;
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
>> index d8bb40ef820e..0781dce7cda2 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> Something stray
>
>> @@ -43,12 +43,12 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
>>   	of_node_put(phy_node);
>>   
>>   	if (!phy_pdev) {
>> -		DRM_DEV_ERROR(&pdev->dev, "%s: phy driver is not ready\n", __func__);
>> +		DRM_DEV_ERROR(&pdev->dev, "%s: 0 phy driver is not ready\n", __func__);
>>   		return -EPROBE_DEFER;
>>   	}
>>   	if (!msm_dsi->phy) {
>>   		put_device(&phy_pdev->dev);
>> -		DRM_DEV_ERROR(&pdev->dev, "%s: phy driver is not ready\n", __func__);
>> +		DRM_DEV_ERROR(&pdev->dev, "%s: 1 phy driver is not ready\n", __func__);
>>   		return -EPROBE_DEFER;
>>   	}
>>   
>>
>> -- 
>> 2.34.1
>>
>
Best regards,

Kancy.

--------------lA2uZMDc0F0GsDmF5tKx0eSF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/22/2026 9:30 AM, Dmitry Baryshkov
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:hmnyvxz7ashufiiil6hf4lg5g435e53zd3xla7qeqcb2styrqg@jkbjl6arm33g">
      <pre wrap="" class="moz-quote-pre">On Wed, Jan 21, 2026 at 05:40:28PM +0100, Neil Armstrong wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: KancyJoe <a class="moz-txt-link-rfc2396E" href="mailto:kancy2333@outlook.com">&lt;kancy2333@outlook.com&gt;</a>

Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
on the Qualcomm Snapdragon 8 Gen 3 platform.

The design is similar to a phone wihout the modem, the game control
is handled via a standalone controller connected to a PCIe USB
controller.

Display support will be added in a second time.

Signed-off-by: KancyJoe <a class="moz-txt-link-rfc2396E" href="mailto:kancy2333@outlook.com">&lt;kancy2333@outlook.com&gt;</a>
Signed-off-by: Neil Armstrong <a class="moz-txt-link-rfc2396E" href="mailto:neil.armstrong@linaro.org">&lt;neil.armstrong@linaro.org&gt;</a>
---
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 1445 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |    2 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |    4 +-
 4 files changed, 1449 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f34d5ed331c..1ba29755e5ba 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -313,6 +313,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-samsung-q5q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-sony-xperia-yodo-pdx234.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-ayaneo-pocket-s2.dtb
 
 sm8650-hdk-display-card-dtbs	:= sm8650-hdk.dtb sm8650-hdk-display-card.dtbo
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
new file mode 100644
index 000000000000..141d92933957
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+
+&amp;i2c3 {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
clock-frequency?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	status = &quot;okay&quot;;
+
+	wcd_usbss: typec-mux@e {
+		compatible = &quot;qcom,wcd9395-usbss&quot;, &quot;qcom,wcd9390-usbss&quot;;
+		reg = &lt;0xe&gt;;
+
+		vdd-supply = &lt;&amp;vreg_l15b_1p8&gt;;
+		reset-gpios = &lt;&amp;tlmm 152 GPIO_ACTIVE_HIGH&gt;;
+
+		mode-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = &lt;1&gt;;
+			#size-cells = &lt;0&gt;;
+
+			port@0 {
+				reg = &lt;0&gt;;
+
+				wcd_usbss_sbu_mux: endpoint {
+					remote-endpoint = &lt;&amp;pmic_glink_sbu&gt;;
+				};
+			};
+
+			port@1 {
+				reg = &lt;1&gt;;
+
+				wcd_usbss_headset_out: endpoint {
+					remote-endpoint = &lt;&amp;wcd_codec_headset_in&gt;;
+				};
+			};
+		};
+	};
+};
+
+&amp;i2c6 {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
clock-frequency?</pre>
    </blockquote>
    The clock frequency properties are not defined in the qcom reference
    devices' devicetrees. The default frequency 100khz works. If they
    are required we can add them in next patch version.
    <blockquote type="cite" cite="mid:hmnyvxz7ashufiiil6hf4lg5g435e53zd3xla7qeqcb2styrqg@jkbjl6arm33g">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	status = &quot;okay&quot;;
+
+	typec-mux@1c {
+		compatible = &quot;onnn,nb7vpq904m&quot;;
+		reg = &lt;0x1c&gt;;
+
+		vcc-supply = &lt;&amp;vreg_l15b_1p8&gt;;
+
+		retimer-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = &lt;1&gt;;
+			#size-cells = &lt;0&gt;;
+
+			port@0 {
+				reg = &lt;0&gt;;
+
+				redriver_ss_out: endpoint {
+					remote-endpoint = &lt;&amp;pmic_glink_ss_in&gt;;
+				};
+			};
+
+			port@1 {
+				reg = &lt;1&gt;;
+
+				redriver_ss_in: endpoint {
+					remote-endpoint = &lt;&amp;usb_dp_qmpphy_out&gt;;
+				};
+			};
+		};
+	};
+};
+
+&amp;iris {
+	status = &quot;okay&quot;;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
With the default firmware?
</pre>
    </blockquote>
    <span data-slate-fragment="JTVCJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxkcmVuJTIyJTNBJTVCJTdCJTIydGV4dCUyMiUzQSUyMnNvcnJ5JTIwaSUyMHRob3VnaHQlMjBpdCdzJTIwaGFyZGNvZGVkJTIwaW4lMjBkcml2ZXIlMjIlN0QlNUQlN0QlNUQ=" style="white-space: pre;">Yes. The soc in the game console is unfused.</span>
    <blockquote type="cite" cite="mid:hmnyvxz7ashufiiil6hf4lg5g435e53zd3xla7qeqcb2styrqg@jkbjl6arm33g">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+&amp;remoteproc_adsp {
+	firmware-name = &quot;qcom/sm8650/ayaneo/ps2/adsp.mbn&quot;,
+			&quot;qcom/sm8650/ayaneo/ps2/adsp_dtb.mbn&quot;;
+
+	status = &quot;okay&quot;;
+};
+
+&amp;remoteproc_cdsp {
+	firmware-name = &quot;qcom/sm8650/ayaneo/ps2/cdsp.mbn&quot;,
+			&quot;qcom/sm8650/ayaneo/ps2/cdsp_dtb.mbn&quot;;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is it fused?</pre>
    </blockquote>
    <p>It's unfused. For adsp it contains battery/charging
      configurations so it's required to be the vendor's one here.</p>
    <p>I'm not familiar with cdsp or what cdsp does but for stability i
      used the fw from vendor. Additionally, the default cdsp/adsp/vpu
      firmwares are not uploaded to upstream linux-firmware repo so I
      was not able to test the default fw. (See
<a class="moz-txt-link-freetext" href="https://gitlab.com/kernel-firmware/linux-firmware/-/tree/20260110/qcom/sm8650?ref_type=tags">https://gitlab.com/kernel-firmware/linux-firmware/-/tree/20260110/qcom/sm8650?ref_type=tags</a>).&nbsp;</p>
    <p>We will use the default one here instead if cdsp is not
      device-specific or the default fw works on it.</p>
    <blockquote type="cite" cite="mid:hmnyvxz7ashufiiil6hf4lg5g435e53zd3xla7qeqcb2styrqg@jkbjl6arm33g">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	status = &quot;okay&quot;;
+};
+
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 07ae74851621..fcd5a1a45803 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3917,7 +3917,7 @@ opp-32000000-4 {
 				};
 			};
 
-			pcie@0 {
+			pcieport1: pcie@0 {
 				device_type = &quot;pci&quot;;
 				reg = &lt;0x0 0x0 0x0 0x0 0x0&gt;;
 				bus-range = &lt;0x01 0xff&gt;;
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index d8bb40ef820e..0781dce7cda2 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Something stray

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -43,12 +43,12 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
 	of_node_put(phy_node);
 
 	if (!phy_pdev) {
-		DRM_DEV_ERROR(&amp;pdev-&gt;dev, &quot;%s: phy driver is not ready\n&quot;, __func__);
+		DRM_DEV_ERROR(&amp;pdev-&gt;dev, &quot;%s: 0 phy driver is not ready\n&quot;, __func__);
 		return -EPROBE_DEFER;
 	}
 	if (!msm_dsi-&gt;phy) {
 		put_device(&amp;phy_pdev-&gt;dev);
-		DRM_DEV_ERROR(&amp;pdev-&gt;dev, &quot;%s: phy driver is not ready\n&quot;, __func__);
+		DRM_DEV_ERROR(&amp;pdev-&gt;dev, &quot;%s: 1 phy driver is not ready\n&quot;, __func__);
 		return -EPROBE_DEFER;
 	}
 

-- 
2.34.1

</pre>
      </blockquote>
      <br>
    </blockquote>
    <p>Best regards,</p>
    <p>Kancy.</p>
  </body>
</html>

--------------lA2uZMDc0F0GsDmF5tKx0eSF--
