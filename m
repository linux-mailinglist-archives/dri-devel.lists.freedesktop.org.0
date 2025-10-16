Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A6BBE1C53
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A2810E962;
	Thu, 16 Oct 2025 06:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="CLzNuuZi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011003.outbound.protection.outlook.com [52.101.70.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6690F10E962
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 06:38:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dY298wMxgwIeEXzCkEMiVm2uWz2FTSGQb1fQE0h4BW8RthoKLMQQf+LLYd+FpFQVph68LapxyvPRwO+DO7sRIWxK4PhZv1x9DZwftZH/U9Dh9J/TZPakm/k5xn6TfCQswL45slT1xxnZHn0Qy2jk1a7Id8CJ9APmdCKjT1sQ5bVpDcYsjEljn0CtMqdC3eC+OD1OV2dmTDO87C5RX6XD8E8SynLaOAqZ1vic7Ay1Y0dRcqdvs9BYyXi9W9iS8dJ6wxBpSmG+0Fgua3v63/kzyuGM1xr7CgHjfbELkdnmPJVIW+hEchlmWwJVcZtAVbWvTHu43RpVesSKbNp7lLQNKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FSdROnQLupTIgkQKF+JQxVqrABJAoaLEIlbmBU4k7c=;
 b=P/DaIiRNTzfkfYs3i5GVnJZVnNkzw4tR3pN+oLCXqW7673Mj2sn5aHyuusqVAHNVPaVBVykXDzxwShdHhyOVIZCU1IyYJTAlcuFsEGWGeXVOvWmUt/pZ77dfXnGcYtt1Wo1nOz45X3NQWsf2N4pZcNcLZgMxS2dbhoEMmspkDbfs79h0khfwrtG96OBTgFYm3rBp21ikJ/3Aln5lAfgJXzBVhp8aAUbqaMy9/LIvX7dtoI6DF3MOukmZ5N/PyUqt770MreT9Nc2wr46SPHgboz/xKqMldo+PR7spDPKJp4QUF5OP+IfCjRK1AkVMopTLkCyVTs6OSHel9DgiudAWdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FSdROnQLupTIgkQKF+JQxVqrABJAoaLEIlbmBU4k7c=;
 b=CLzNuuZi6SWpfADSS9XVbIm3UvXhJMywcJpOh0RNVqC4FgxvM0dLtRceSKCb2Vc40RCncr8xDIaP9jRtLRj3NRT1rL/6EwkezsS+Q5iFR8ZTHFPFCz8/MY9x74nAGGy2iuz9pTRiUtszx4oA0a90YGIl5zIWcLphLhiInXUT9cAsicwaH1KIpqoQB+cp4WC00SRFe+40xdfT6BO0sQxluAB2OV4jVaKltznoYoWwtPVZhnU5Syv0ZjOc+V6MkQEWLTFCrfv+8gJlGCe8pk2bLxDRC/oXS7EPxJIV4gwR06StYRBQO+oLSd0ZKlCSihHLrtL4SFb3Tc7OhbihL6Eofg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBAPR04MB7270.eurprd04.prod.outlook.com (2603:10a6:10:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 06:38:26 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 06:38:26 +0000
Message-ID: <ffc12213-db40-4c10-8a6e-57003d85f4df@nxp.com>
Date: Thu, 16 Oct 2025 14:38:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/14] MAINTAINERS: Add i.MX8qxp prefetch engine DT
 binding files
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
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
 Frank Li <Frank.Li@nxp.com>
References: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
 <20251016-imx8-dc-prefetch-v4-3-dfda347cb3c5@nxp.com>
 <51b72003-e9a5-4f34-ad08-249fc24b3041@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <51b72003-e9a5-4f34-ad08-249fc24b3041@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::19)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBAPR04MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: bb0631f2-15c6-4432-c4c6-08de0c7e9c3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVI2NUd3VkhzdklqeDBLdWpwVmNpMEtrYmM3TCtaYlovNms5RmhtQ3pZY1dH?=
 =?utf-8?B?S0Z6eE41eUk3c2F4MWlRU3BhOWpKdG92Y2EwRTc0Q3crSUZXRDZlL09JQUJ0?=
 =?utf-8?B?eFNlWjl3WGpxZHhvVlNsSTljRUhpRjJFV0pOcWVKR29wajkzSGxlcUV5ZXJo?=
 =?utf-8?B?NmZVenZ3cUdXc1o5eWtiSHVhTTBId210UVdNYmNlVm5qZG1HQkd1SHd1Q2JK?=
 =?utf-8?B?YzJKSVMyZk4xc2hxMitNNFVJeU9uTXFZeTBBZ3M5eC9ReU81dlE4T1pmT1dp?=
 =?utf-8?B?WE4ycVRMRHZIMDJ0SzlwZ0l6c3htR0JUay85UXY1dk92V0F3ekNpVjZCQWd5?=
 =?utf-8?B?aS9ZS0prbzdwczBnUXlCcHJUMlRlaW1aaFJDa3U1TkV5dlZCVmRWM1FYcktE?=
 =?utf-8?B?UVNGU2hkVzV3SldGRFEwSjdGZlhXOEtMcGI0akpDNkRZbnB1YVhBbnY5VmMw?=
 =?utf-8?B?NjR6VWpIeUFuZVNtRW1GYUpubmQwMmNrQnQ4dnE3TnFFbHZ1SSs4eGwrcmJZ?=
 =?utf-8?B?UFNpSlA0Nkd5U2RlRXNBSWhoLzY5TC8ycFFVNEwrZmZ1V092bHB3Zy9aYTE0?=
 =?utf-8?B?R3NRT2RZTDRDZjM5UitWMjBxcWhRaTdxekQzbEROYm40ZU9sa2hQQ1lDVThF?=
 =?utf-8?B?bmh5OEViY2ZsZWlPemN3UTBITUJJbWhDT3N3TG9oejIxT2RwYTJsc2RUdHZ4?=
 =?utf-8?B?M0hMcTNXRWVZR2lUcHpHQUhHZ0ZQZVQ0M3hRSVA1ZCtUN1RoUUxiMWVrSERm?=
 =?utf-8?B?SFBYQk9lRmsvTmlCa1RWRWdJMWF5SXd6TUpWL0pjSzltT3NPbm1acENhZlRM?=
 =?utf-8?B?RG4vdFdScjluNFBQUVRKZzlSY0hUdHVET1R1NktNenhpWFQ4cG5mcTZxcFl4?=
 =?utf-8?B?QUI0dUFuZHVGYlN6VmkrQ1B4L0xZM0VITjJ6cCt3bG1ydktrVldPNm9oVTBC?=
 =?utf-8?B?WUlwWk96MWRITVM1SWYvRFp0M2FxalAwcDVOa1BIZDlBTzhzV0xqOS8wQWd1?=
 =?utf-8?B?ekhCbklkRHdMbmcwOC9oMUUzQ0NZVnhTeDRoZjRxMGxHUVJTRXhHeWI3a3Rm?=
 =?utf-8?B?N00xaFhKY3U1eFJxK0lXMUpkODI2RWJwWklMVG8wT2E3aFZOcWFTakJwSEc1?=
 =?utf-8?B?VDc3cWlObmczUWp2VE5CclRtM2UvNWJlQm1yc1NLblpoWHZqSFVZTHFFaDN2?=
 =?utf-8?B?ckRwQ0NFaDVOaDkyMnBiUm5YaTBaZ1BGZlFlelBBRW94blI3T2xVQ3dYNFEv?=
 =?utf-8?B?QWswSFkrZkQ5RERHUk1IKy91Z2I2dTNQdTIxSGhyYjJ0TGx4TUdLM2Jjd3M1?=
 =?utf-8?B?RFQ2WnZObUFlaG1FMkVmV295ajV5eFpzcHRncEdpRkgwdVFGNGsrSlRaZ3Ew?=
 =?utf-8?B?M2ZpSG9YZmdyNHhQaGRxWTY4U3AzakRZZlF2OXpSQmhhcmNKaEJxTTloU3lq?=
 =?utf-8?B?UzdCQUFtUGE5a0hpQnB2Y3ZXWk9mellxaEtMOXJvaTdnSFRWc2NWanl4MWY1?=
 =?utf-8?B?dEtGdFBGOHZIS0NFdGZPY1lxYVc4bWdSYzZPR2g5MjgyTW41blB4Q0Vva1I1?=
 =?utf-8?B?UkpkcklTb09VM0ROMGl1MFRBOFlrUkJRclV6Nllwd3czQm9Ecm0vcWFQSUFt?=
 =?utf-8?B?aXBoVklaZ1RLYnEzMzVQaDVtQ28wa1hFeXE1eEdZV3Z5TEZHZkJEWGdDM3FQ?=
 =?utf-8?B?aDF5YjY2aHprdzUrVkYxc3RQckJycDArZmd2RUlpVkFUbVBranI1YXFRTTJt?=
 =?utf-8?B?d2plVllaZWNiOWFadERXRFZFUFB6b1pPMXJETWxXUllDLzRFSW5lMXdrNENM?=
 =?utf-8?B?a3lmOHZEQm5yNXNvYUJRUm1pWlJuTFc0cjhOSEdQK2xjbnl4U1FocVpVcmhp?=
 =?utf-8?B?WjBUMVRYUzdqRDBkb1htL0dFQktYck1DZEwrT01Va3h3UUV0NmRKSVJZT3JQ?=
 =?utf-8?B?RWE4dmgvVytJeWJjK0dIdTdsSThZdE5MeFJVVzRDV0grZlNFV0drc3FUYktI?=
 =?utf-8?Q?QF49PXDCNbgazB8A/NTjlxsZqvNaj0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzRNbEVQcFNTZysva2YwTlo0aEZEVDY0anRLVXZOa1locXE2WllaWkZFV0pj?=
 =?utf-8?B?anR3dzlZUUdNZDd3NlNKRTBVeFFjMURqSFhHa1pzVXk5VzgvNXVNZDZiME5s?=
 =?utf-8?B?MTJOTXF6T0lYOTFoS0tWMlIyblBieWRFcDZVd040LytLekZOanhHaGUzb0FM?=
 =?utf-8?B?M3lITnpBM0NreGN3WHRJaWZKK1I4SEZ2Q2NkWE83V1JDQm5lQk5DTytpLzh3?=
 =?utf-8?B?ZTM5NFBpZVczZVBtSWV2MGJ0ZGdkSkEya3RpQWlHTzUzTkE3OHIvbTJ2TnJQ?=
 =?utf-8?B?YnNYaDNVY0NNd3czYzczZ3R0N0dBejVWMGkrMit6M21PY2VvanNUM1JPVm9J?=
 =?utf-8?B?TTkyV3JnT1NLNW9SZ3FRMHZmcloxWmFtMEt0ZCt6clVqU0RtY0hycG5relNF?=
 =?utf-8?B?MEtLVkkrL2kwTDcyeHRXMmhESWJkOG9iTWNmZUZBaWlvaDhDZk5yZ3RvMWdp?=
 =?utf-8?B?N0kxU0haeTlHY0l0ZjhqNWhMeGp4TFlheDNQd3BEdDd4Vk4rUGJQdXI5dDZB?=
 =?utf-8?B?Tnh1S2hDRWtwWXp5YktTNG8rZHZzbzdvMEV4WDR6WDc1M1dMQmZGNy9IcW5K?=
 =?utf-8?B?TUhLZ0FJUUZpcEkxMVFuZWtjdTFiUTc3TFFBd1VTWVlVbDV4QnVsWC92Mnd0?=
 =?utf-8?B?R3dWMjFyYzltVzlIajFLbkVMTVIwK05Ub1V5TlBzRm0xUThHOElKYlZMRFJU?=
 =?utf-8?B?NDQzWnIvYTk3alhEWVlGeWZ2RVBiTjc2VldxUzNKVklaSlo3SEhEYWZqclEr?=
 =?utf-8?B?bzYzRS9CUklpR0tZeUV3K2phZTk2bEtlZFc2V1NkajZlTWlnWlkxOTY4dFpy?=
 =?utf-8?B?MDNEaU81RS8xeDBWV3Fuc1VvVytzYytXNDJmaldWL0RJZEJLV1cyS25MR0tG?=
 =?utf-8?B?cXlSZ1pGVkZOai9FQXIxeTF3a3czYSt5NWJDdHlkanNJMENRNVlWTGo0czhr?=
 =?utf-8?B?TWloV3hsbThWc0dRWFJiVmh4clY2YXN3R3RGNkFJYUxDbERTSmU5Rk1STmth?=
 =?utf-8?B?N2wyZUovOFJTOHIwakVRcGxscWxJbzJHTlEwRzJSYnNvamlQY0h1bmIxMUhO?=
 =?utf-8?B?a292YXdIbGtOQXFINnREbFRwRDczYTI5Tlh6cXRlTG1Fa3pxRTlMekUzVUM0?=
 =?utf-8?B?SkpmaUxqcmR3QWxVUjlUdkUyNG9QWjVVZURNQmdnMnpYZFNXTUVlVW5TUFV5?=
 =?utf-8?B?SmF4SVZzQUxRQzVCRFFyQnFuQlpMNkkxbUJEakxId1hGYmxURVVWb0VFVzVa?=
 =?utf-8?B?bXFRdHc5akRLblZOVDhTRTd6Q2kvNTRKNC8xRkpTeWVmRXRvYjZ1N2VqakNU?=
 =?utf-8?B?RG5uWUJtZ3RyTlNpN0s4Z2l2VWlRT3l1M3JEMDcwU21tUFBFWXBlV3RnaVpJ?=
 =?utf-8?B?RzV4NDlodWRySW1RMVpxd1hiSmQwUDdMQnpkSWJxRVUweFYyYnVKMFdJR1Vh?=
 =?utf-8?B?UVpHanZaS243WUZhUkdKUDBCZEN4dC9HbmpiWHVHL0p2VlFwNHk3ZVJtdFI0?=
 =?utf-8?B?REdpWGVMVWVvZ3NMSnpiNm96R1RyR292WDh5VHZHdGhocUpCa2NtWmN1a01w?=
 =?utf-8?B?T24ySVlGQnhrYkordnN1S3VjOVZuVGJ6TnpmV1I1V1o1Q0wyODc4UkRHbjBF?=
 =?utf-8?B?TE9ZakJQRlJNSzlBYzBud3AxL1lOU1ViekJvdmw5MDVUdWZqYytPUWRXb0RO?=
 =?utf-8?B?eTQ3UDJqRWJUcmJRcG0yUHN2RThwWHE1SXhLVHVaUWVPSTFQLzJ6MDJaY2xI?=
 =?utf-8?B?b0hERmtzcnA0TVRmSmVubFVLWEl4MVArQk56dFNKNVhKRlM1eVU3Z1FPNnQ3?=
 =?utf-8?B?elFwSVY1cHRmWnVjODNNcXZUQ3N5b0ptK1VhS0R3SVdlcXlVOG81VTNIWnoz?=
 =?utf-8?B?czJpTlNTcmlsd0pvQnVmdTBiOVNyWjhjekxUN0hYWHV2aXZUZmZrUmhRd25F?=
 =?utf-8?B?TFlSZzcwN01BMWsvNHJMK0djSE1rNHAvTkk4bXhYSnZKRHUzcUtEMUhLemR3?=
 =?utf-8?B?REZRWmFYQ0FxQWVkNmRSbHVGa0VBR05maGJhaFdIUWhVY1NOR1pENWdwUlVB?=
 =?utf-8?B?aTdaRjh0MldSNUVaK2RNMlRvSHNmdXhLNi9UWGltU2h5L1ZrckhQSlBWRzQ4?=
 =?utf-8?Q?Q55+s8OAFzvubLKcVoEoB0gJQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0631f2-15c6-4432-c4c6-08de0c7e9c3d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:38:26.3490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVmybxS6TK0bb50UWV8qdV2/TG2dMthOVcBD/EGl08Q9vePtgPOxrgX+0egNNjL3UoKpnFXxNEYFau35/ss1OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7270
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

On 10/16/2025, Krzysztof Kozlowski wrote:
> On 16/10/2025 08:32, Liu Ying wrote:
>> Add i.MX8qxp prefetch engine DT binding files to
>> 'DRM DRIVERS FOR FREESCALE IMX8 DISPLAY CONTROLLER' section.
>>
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> v2:
>> - Collect Frank's R-b tag.
> 
> This should be squashed in each respective commit. This MAKES NO SENSE
> as separate commit, stop inflating the patchset.

Sure.  Thanks for pointing this out.

> 
> Best regards,
> Krzysztof


-- 
Regards,
Liu Ying
