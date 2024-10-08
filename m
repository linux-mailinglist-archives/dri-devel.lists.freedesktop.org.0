Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9284C99599F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 00:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37D610E607;
	Tue,  8 Oct 2024 22:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="gPwCnoRl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012027.outbound.protection.outlook.com [52.101.66.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C032810E5F7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 22:01:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ln++vTnz9EbsifVsdkjOM/PW20OWi3NbyiF3rWHGpsczmZH/z1vZLv2wHS4xKJtfITeJt9oalm1hOLUo6yWLs5IUtOn4L89g8rBnH0ZE0IhxXksRljkggB0iQZwE9U5b4mXiFWWjduq19xjg9lolUqmx0Jak3oEsZUxGQizoGutR1+FMNW7RGVFc1aPS3X7jlwD9eB7hidd+dhagmPX22m5ki3FEmUTPVogrQ5f/ELWA0MxzT0U+UcYGllzucx5pVPQbJv5Fb8QvG4HPIlsPfrfce2qyv8MKEjVLYKWoiQsPXvO3tDfPNtFl32TMXB6C0lNRRExapYU7JKrDJOYJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozVro/a2H/lT8rxPAlrcjSDnPjQyRPO0kLw+PGkteHc=;
 b=LhCFpal1knudzO091RJ76ajTOuN7/tSzoJWBTGC9V3lh52udnkraQnRkuqL5uF0foQDFDlzNF7V3/C7n9D8Xqmathc1yuQoZcFKNEYUj7cBYkDP3xT6ADxQ+bJmS+6dZTlbge7j+Zf22Yd1v3ZvlJ0arpn+CuRG3Vq0IVrZHw9JK0khng+M57uZkdSsGHSoLDMkNBNBCh/dP8WlZvPqCAgKoShyX3TbLcQm579u36aSERejiEGGEnn6uFzxPeZdJgE2DjoHiYtDYYHKoNadU3pCl8pC67y5kVI3XAZ4qilBhiFbldhb6UBzOxioWyrw1Nsqsp+ZXpGnTrtKNnF1UKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozVro/a2H/lT8rxPAlrcjSDnPjQyRPO0kLw+PGkteHc=;
 b=gPwCnoRlvRvJS3vyZOXySGDy2u62oOpF86LKfO1ybxYWKklvmCb2kOAyBgsBdNE8txMf2h8jOEKvfbbC447s4lVMROU/FVtgxGPzjCBN2xgWCWS4xPJvrkjdsN328eRVV0kGR5ZOxIx4ZEJSmABbA+se4pqkamhMQTdCz/hXSnbqQsQR3I+RV+2JpE+Qbolmlcts5muczY016UAR0t0fNoNRi4o1AhFgirhzf8K13HcUz7B2Q0Y27yPtR41Wl32rKS3QiHj483oGvD/n/VC/P5kLoFFtp6O+8pbgHyfA5Uby0bWTYiB7mkq8oktF93q3f7r6QV/pkZaK0DLyB5OZ3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9667.eurprd04.prod.outlook.com (2603:10a6:102:242::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 22:01:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 22:01:28 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 08 Oct 2024 18:00:57 -0400
Subject: [PATCH 1/5] dt-bindings: input: convert zii,rave-sp-pwrbutton.txt
 to yaml
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-zii_yaml-v1-1-d06ba7e26225@nxp.com>
References: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
In-Reply-To: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728424880; l=2686;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=XZpMv8O/AC/1ueQMp8gDbQJVMcmYYGPTlzFd7u/nYYE=;
 b=XZGRzJuTT5GyofBRh16NnVfe91p8plfqRJu9KtL9qPgPSZFQJUOjUghtE7y+g8HC70CEv+NNB
 86blKqmGVKiDb1MGg6z3DimQ5vUoxf64Tt1kgwAViDxkBExuXLT4K46
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:a03:255::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9667:EE_
X-MS-Office365-Filtering-Correlation-Id: 8efbe279-f68a-4994-6419-08dce7e4c2eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDZCYm9XREJiWnp4YldsYUhKUzRTbVJjNTEyZElBSU5vd2tqRVY0ZHo0S3FE?=
 =?utf-8?B?eG1iajZYQWRGZ3ZHRnY2WWdDWVRHWlBhNlNpKzJad0hFZmx2bVZLMG9Na1ZS?=
 =?utf-8?B?d083S1B4UDVTMElmQjhLNU1ha0xZUHlsSHVBL1A4VzYreXN3OEdkZ0lDSmor?=
 =?utf-8?B?MlVGM2VDazM3akpjSkg3NUVwVGswbkRBZG9qK0RIZkFpKzI1eEFmUWdaUzBq?=
 =?utf-8?B?dVJvU1BZUEVjL20rdEx0b2gwUEFLQ29ha2dRRE03SGRad1A2VmtiQTFlVElV?=
 =?utf-8?B?VklleUw4MnNOV05DTGIyTmY1bjdUYzFubkF1L2NoajRWVFhZYlZEZU5SY2xo?=
 =?utf-8?B?ZERPclVFRTVubGtHUExyV3NlVTA0QWFKYTdXUWFhR3EwQWtpbEhkQ2RpMlJi?=
 =?utf-8?B?bmRUd1pqQ3BiV0lHSjVwU1hTR3NWSzdDZVYvOTZaQWU2Zm8vWmxUR2NHa0FJ?=
 =?utf-8?B?aGlKOUpQVC91eW1KSmR0bzhEWmlVWFl0Vmw2a1ZvUnlXbklwbytkZjgzQ3pY?=
 =?utf-8?B?RzVRUUR0YWlWWlc5UzJ0MGQydTZLV3JKV21uaVY4blVsZmQ3SGZxUm82UklX?=
 =?utf-8?B?cEN4ZjJCYzUvWXJJd1JPcVBvMDQ4M1NyNmhhRGJ4ZXFuUWQybXdOVWJERmJw?=
 =?utf-8?B?SzJBYzQrTVZZc2N6Um5KU3I3QjZQck5KK3ZGbkpucTREZTdxOVdQWmRuOWRJ?=
 =?utf-8?B?VzhZc3B0bi9GUm5XNittMmNXYzd1b2dlVlRSejc2cVU1Y21KK1QwY3BkVy9D?=
 =?utf-8?B?dk9uZjdFb0JnTUpDUzlJQWNPdGhNTnZNR01rNHZiQW1YRldDMzZWZWs1TE9Z?=
 =?utf-8?B?amkzOWJRN0RUMGpoQWMyV29TMisvY0RkdWdkekpMRXYyaEpXSDVkWndEbUtT?=
 =?utf-8?B?cTd1T1FZMTNnZFJWM2taamhaaGFOcE1mbmNDbVVzNzhMOVVyZGs0aStremJZ?=
 =?utf-8?B?aXgwWEFzeTZtSzJGdTYxZThTYmE0QTRiM05Za29RRFBpTnI1NkU2bUxNLzQy?=
 =?utf-8?B?Y21QMys4RjgyVUhYcUlBbGVMRnMvVkxmanc0UktpdFJQZ0hBbnpuOTBHZ2dV?=
 =?utf-8?B?eFMxNk1ldDNmNkFBUlY5ak13NFVZQVRjc1FwOXNUVDVnUzMrVzF0RUVmdmpi?=
 =?utf-8?B?Mi9JSTJIZlk4eHZWV1ZUaStBd1ZTK2FTRnY1c0g3d3ZNZjZGbU1lZFp5ZDRk?=
 =?utf-8?B?c3BXcjRDODhIVlJmQ0xkMDhCQ0V6NXlSMHNlYTE1TTJoWDBMNFdEVE1MR3lH?=
 =?utf-8?B?QWtnem9UZWt2bjBoM3owUkNpZU9taWsyakcvVHVjS3JDZGhjQnRjTTF0WnNO?=
 =?utf-8?B?V3JndUozUGtIenNMYmV0TmljL3hxZHZ2MlhRQUlvaW9halhrOCtNUXhOeXZM?=
 =?utf-8?B?ZHNaOHRiNVpmYWk2RCs5UEw0SGRZdW50Njl1dkVkM2dmbFRwSmIzOU1kSEpB?=
 =?utf-8?B?V1I1bFQvS0FQeHpEUGRkUXJUUUgwL3kzczFNdktnQ3JubndIb3FXZWUyQk8v?=
 =?utf-8?B?WVFGTkx2Z2NhR0NuazUybHAzMnM4SDVIL1RnYnFVU0dJTDc3dkp5UzVkekI2?=
 =?utf-8?B?QktYZ1JhMlh6Ty8relhQMmFFWnlOd1VNdFNDUmFxaXVKVmN5cGZwRFYwalRv?=
 =?utf-8?B?Z1BNandYalQ4anQweTdSR2F5OU04M0J6WStESXlYemYzT0ZnSTZvNkpvL3pV?=
 =?utf-8?B?UFA3WkUxcVhMUUo1VzFWN255WlV3NGZEa2JzSlJuSnd6QjZ3bU1UNTBveDVG?=
 =?utf-8?B?aFdyY1luTzhLT0p1SUU3Wnd1ZndMdm5uOUN6VFRvWnphN3VWRENNMXpmN3Mw?=
 =?utf-8?Q?YyBpBLzZTtkEj5QzmVPAxwzsfAi1Gil/49QyU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?andQeFQ0VDRJdG1BbDNGVE9OU3c2d01qS2dLeEJJb0JVRDVpV21XWEg1TjIr?=
 =?utf-8?B?ZUJGUjk0MDhETEI2eTB3VGxSNksrRGdoNk43VmcvWjBLcyt1Sm1NRTNsNXRl?=
 =?utf-8?B?NmRWTThIZm8rYllYRDQrbzZZOUlzSGljTktVa3VqWUo4eDdPTW9oMXVpTUd4?=
 =?utf-8?B?UnQ3OUdiV2diWEgwMXJ6Z3FhVmlKbDdxQjRpV3JVT0tyZ3hXL3VUeDJ5TTJ6?=
 =?utf-8?B?bWFNLzVncWFKWGNwNHZVdVUyQ04xei9lMWkzVFZwcGk3UkJ6Y0QxSmdwS2VG?=
 =?utf-8?B?dzhHOEZjMzdORGcyTUJTd3VXelNuZ3NCZ1I4TSsvaElGdmVMRkVoay9iRS9D?=
 =?utf-8?B?K3dvQlQyV2d5cmZOTkRMUWduemlmNVNSR0c0NzRCenRmWW9lODdOcDdlRzI5?=
 =?utf-8?B?cWhyZVdlOWNRWEhvZEtBYm1CMkpILzZPeGdxSm40aEp0SnZKTWZXUENoaFZz?=
 =?utf-8?B?b1ZzbGJRR0lPY2p3d0tiUWlCMzEzakNrV2ZJMjZqRk0vS3RNRnNFNmxEWC9Z?=
 =?utf-8?B?MHh0bkVmbW5mTUg5cjNCbVdjaVhDdC9LeUJZUVN3bjdKNTBmQUpjYTNhZUlB?=
 =?utf-8?B?MW5aSFM0MGc5bmtZb1k1cDUrMDErcDRkNFk1MklWSlBFVWhXWWNFS1B4bmdl?=
 =?utf-8?B?YnhUTGlwWkhFWXR5THM3YVRTWnpoVmtwRmx0TDBmSTEzbjlqMTcwNjNJWmpE?=
 =?utf-8?B?UkVNOWZlVWZzY2hRZlJFSVNnbXZ0dnBDUUtXalAxUTdXeElaNjI4UnFkOXNp?=
 =?utf-8?B?cUloZWxlMzhXN3NQWkNyY1BGc3FRYWt5b1lTNENiMEtFaE9WeXY2Y2g1dFNn?=
 =?utf-8?B?aXZTSUwza2JXSVAyaWVwcGZwZ2NPOVVxTnFJb05rd3NISnVxUXh4LzhmYlFa?=
 =?utf-8?B?Umx4NXpyVDZLRmVScnhZZXVmcUdOUTFITUcrejQwemsraHI1ZlQ1citTUWwx?=
 =?utf-8?B?TW9MbXh6Y0F4cFc0SnJ1Z0Y2SUhQYTNhSEJSLzZ2ZUNSa2dXNkhxeXcrTi95?=
 =?utf-8?B?YnVVeUxIV2JyU2gyblZ1WVZiaUhIdThxWG81SEl5ZndKbk9qZ0s3TWltRk5J?=
 =?utf-8?B?bUp5UHE3UW8yVlNyNDBUeVVsMnNFV2ErYXV1NitJOEMraUNaMC82VWdMc3p6?=
 =?utf-8?B?V3hPZTd4N0trN0Z5NVVXMHZzTkRmbEtNc0lneDRBZFVSQ3B3NmhaVVBUcm1M?=
 =?utf-8?B?UFhuUnNpOXNSSlMvV0xSOVRKMWZVV2pQTzBCWHdqZDlCcmcvRU9ScHdLTDhW?=
 =?utf-8?B?SlJVQmxsVEF3OVB6bWNmUTdGeGRnaEV3WndJZ0puKzllelE0MloxMTlRN08z?=
 =?utf-8?B?MEFYUFRWWUdOWmQrV0krVUlzbTdIcXNMUEFYVzFCZEZINFp4TktSM0h4ZC9n?=
 =?utf-8?B?YjR2OWdkeC9nV2F0ajhHOVp6Q3I1ZGlDZmVndHFadWJPYmxObUpjR0tyQlZF?=
 =?utf-8?B?YkhtUnFSSXF1ekFHajNBOFlKTkNxVmZoL0JVVzhQbFcxUXhPYmdlN3l3VlV1?=
 =?utf-8?B?Vm9uTlZhNW5WL3hoSjAwalBWK2syd0JjYzR4Skx5RS9IMUFGN3B5cmxNQXh0?=
 =?utf-8?B?S2hsY2FFdUx1U0NuVHc2d3NMWGpHTXVFUUNwbVNrU0QyNEdjSzdWM0ZQR0dW?=
 =?utf-8?B?bTZOVmlnSnJvbDRwbXVPaXlNa1RFa2RxV2J5ZDVrOFZxajJjQ1kxR0RzZ2VJ?=
 =?utf-8?B?cjZVQm1TVlVGY2Z2UHgrVm4zY01OR25FZjlraFhZVGMyWnllMk9PMWJGZ2ZL?=
 =?utf-8?B?bmwxL3luZlNxRTVZZVRjMlFEQXlpMDQ2ZUg1Y3lDR21nUDRsV3A1d3BmbGJL?=
 =?utf-8?B?TjVDc2wwL21mWXJtY2s1QzF2UkJWS1IyNnlqRjdBcGxqR25XbUxtcXpieGFS?=
 =?utf-8?B?NXhvYzBHVWxxRDE5ZGgrZ0tvVDUreENHZ0hHVE1oMWUzRWFCMEtuNHBpdXlo?=
 =?utf-8?B?TWsvSTJlSDRmRExIMVpSVmR4US9PbEZ5ZkN3STdBSHhaYWJobkxHRzM0elhx?=
 =?utf-8?B?SVZSZ05QYkRpT3B6Rkpxd21obzBjL2VXN2puZkphRGRueXJGdjlidDJrdWZs?=
 =?utf-8?B?R21sVU9pZG44ZXc0bHd4aTJjSW5vZFhMNWdBU3JyUUllZzRVOHNlOFlDeUpa?=
 =?utf-8?Q?DceI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8efbe279-f68a-4994-6419-08dce7e4c2eb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 22:01:28.9320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDA+qvc0zG911QVNJyg5M5ZGogXJAmwAyCNGaOBaX5nnGKWr+fRYDPaQckMOZzyXsS1YebwYtfuROZRvBvevEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9667
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

Convert device tree binding doc zii,rave-sp-pwrbutton.txt to yaml format.
Additional changes:
- add ref to input.yaml.
- remove mfd node in example.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/input/zii,rave-sp-pwrbutton.txt       | 22 -------------
 .../bindings/input/zii,rave-sp-pwrbutton.yaml      | 36 ++++++++++++++++++++++
 2 files changed, 36 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/zii,rave-sp-pwrbutton.txt b/Documentation/devicetree/bindings/input/zii,rave-sp-pwrbutton.txt
deleted file mode 100644
index 43ef770dfeb91..0000000000000
--- a/Documentation/devicetree/bindings/input/zii,rave-sp-pwrbutton.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Zodiac Inflight Innovations RAVE Supervisory Processor Power Button Bindings
-
-RAVE SP input device is a "MFD cell" device corresponding to power
-button functionality of RAVE Supervisory Processor. It is expected
-that its Device Tree node is specified as a child of the node
-corresponding to the parent RAVE SP device (as documented in
-Documentation/devicetree/bindings/mfd/zii,rave-sp.txt)
-
-Required properties:
-
-- compatible: Should be "zii,rave-sp-pwrbutton"
-
-Example:
-
-	rave-sp {
-		compatible = "zii,rave-sp-rdu1";
-		current-speed = <38400>;
-
-		pwrbutton {
-			compatible = "zii,rave-sp-pwrbutton";
-		};
-	}
diff --git a/Documentation/devicetree/bindings/input/zii,rave-sp-pwrbutton.yaml b/Documentation/devicetree/bindings/input/zii,rave-sp-pwrbutton.yaml
new file mode 100644
index 0000000000000..7b5e86faeb20c
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/zii,rave-sp-pwrbutton.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/zii,rave-sp-pwrbutton.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zodiac Inflight Innovations RAVE Supervisory Processor Power Button
+
+maintainers:
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+
+description:
+  RAVE SP input device is a "MFD cell" device corresponding to power
+  button functionality of RAVE Supervisory Processor. It is expected
+  that its Device Tree node is specified as a child of the node
+  corresponding to the parent RAVE SP device (as documented in
+  Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml)
+
+properties:
+  compatible:
+    const: zii,rave-sp-pwrbutton
+
+required:
+  - compatible
+
+allOf:
+  - $ref: input.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwrbutton {
+        compatible = "zii,rave-sp-pwrbutton";
+    };
+

-- 
2.34.1

