Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3415BB93EF7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 04:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B35310E524;
	Tue, 23 Sep 2025 02:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Ut+0onED";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013047.outbound.protection.outlook.com [40.107.159.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2275B10E524
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:07:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iI9nzy6QD80CQF5YWo2R6jdW1p0XaiJ7MLbFBXrhsLwOIpOgt95tjRP0z4o3XBDqMjdRTFcjmdp9HUHLCO7MxLg+N5i5/Yunh7q8J5bezavmYIvrTlWFXcbEb8VZS36TArY1L1xnQLG7vE0LzfoxTWgQNALCn1go6J31OgxlKjI33/PbJhATwdElFCWMrkMTxSxXS2CvoenRJnPePl33y0ugsxaZ3O6iVxJMMc6qUc5vEDOIhzKpYouNCqqXz3reTpISO6EFGgZYTjpK46ljWdSzr4at6NI0D1tkKvXRu+sCL0Q6516JeqE96R+uEQZTPfZ6Veuk9pV4qwLB5RKheg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsF7C8NFElY1/U9tLKeFXBg31vMouNLm+QqRV7iGCyY=;
 b=LLZfYivIG8neKYI3EB3+pcUgnxrBi73SIDQRf6oUJOs9Apa2XHHJHdrCAcfmsFPC74jQLrtF07K7euBHu9LQahri0XBmZl0NMBKpAQJHwjRx9LuVxdqZEMajThXjR43bPFXgQSzoqAST72IMMsra54NqdCxb3IwAl+DzqUcZiOrlhMSiyNL+g4uuS05Z5kBwwp+acKunQ44CjsUhHsrf3SkIf4hEHZYSJwOpVgi3N5haUlMNHWZa0T62ntRAGN3GNUL1PsrUDtiBHmZ03Fy39QXqnXRlLPWowq85k9/HPgWezfb6Ifyq3RPLFyd6RxaCHV+Hhnc/yrHw/bJWZ56SIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsF7C8NFElY1/U9tLKeFXBg31vMouNLm+QqRV7iGCyY=;
 b=Ut+0onEDdMLIcMv073HShnit1upEEDzVH1kRoJ3v8EW0Su/L3YAh9BmVWAaE+2IR30yFaotpcuoddhkbUy+7l4vOntS4W02c/Zein/+/bS0V3rNE9zxhUSSQ/YLegMnhtlerJbjtqxYi1Dk/rFbhTzd5wRL5OIzGZCulORYapPtBP9LtZB+6vOI05NM6EzLglaYzxwXP0fhIygVlBh6fkh5BcNCi/S9KgHcE5f2Hrb3Opl3YOtTqQ2Nx4Di1C57rA9jqG4eKfPd9oOiSGzRr0/XWj1tSbfwAFRAibKDFuYxTTqrDvI8you3a6gndVGiFYJbizhvWs9JaRWEqjAdcTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB9786.eurprd04.prod.outlook.com (2603:10a6:800:1e1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 02:07:20 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 02:07:20 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Tue, 23 Sep 2025 10:07:56 +0800
Subject: [PATCH v2 06/14] drm/imx: dc: Add PRG support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-imx8-dc-prefetch-v2-6-5d69dc9ac8b5@nxp.com>
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
In-Reply-To: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
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
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: 225ff928-6497-4010-25dd-08ddfa45edb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|7416014|52116014|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTkzb3djdWRaK3pmSVVNVGU5M3lheWlONGpnQWc3dFE4VzlDY0E3SDJoMmUx?=
 =?utf-8?B?bDBJUCtQRzVRQ1ZUdzBxWWxIcnRabDFocGZ4cXhwWmNtS1MrZWNhOVdJOFY1?=
 =?utf-8?B?WWVQRktLdjZ5RmNwNFBqOTNYcUlVdWVQWkIrRFE2bVBncnh5TUlkRHorMng1?=
 =?utf-8?B?azJLdks2YVFqOFdwcUJQUDJ4YXUvazJ1RXFKdC9XblZTY2Z4Vlo1WEhlVGVt?=
 =?utf-8?B?WWhieDVmeGRSV3RTVGpnWE9wd1lweUthWlZKZmFkTGdnTkpleCtvQWtSRWFO?=
 =?utf-8?B?eEFwLzlaNFJvRHJPV2Jabk9acm9yNWRRNUpYRDg5MENzNDJQQzFuNzJic0lH?=
 =?utf-8?B?SVRvQUdvVTgvVnZBUlc3NERSUm0xTWlnT3Z1b2RyOFM4bEs2RXlyR3piQnBN?=
 =?utf-8?B?aEUzcVlrb2JtUVZRNmlQTkRaMk1kRCtlYklkZFcwWCt2bnQ5N1hMaFY4R3hG?=
 =?utf-8?B?OWJxaVpneWY2eThncEgzbllpenplN2x0c2duSzVva0NiYjZxZVdubnNYQVNR?=
 =?utf-8?B?UjJyd2xlV2VVYUp2WHVCT2RGRkdTb2VyTVN4dWhCbS9TRTU3UUhNU1BqNjl0?=
 =?utf-8?B?MStPTHl2dTh4M21Ra1JZYnZIYzkrbElzS0NsV3lURWFpV0lkMzlVa1FsejF5?=
 =?utf-8?B?Z2NaenJabHgySzBxU3luUHlkK2JxZE1KSkhldk5pU1czOGxRRWJra0FDY25G?=
 =?utf-8?B?K0hjalc4MHNsUkUwZjZST2tZdFFNVDZOOWtqQlNjZFhKSjk1cUcrS1g5VE55?=
 =?utf-8?B?R1l5Ylo5T3VWSjN5UDQ4LzI2ZmR5SWlOeHFjNzRtdzJsT3ZaMW5uLy9qWDBw?=
 =?utf-8?B?NEFzc1dwL0o0c0c1dXl4Vk4rRlVCUmxPOFRrSml0QjZ3NkNaNnFQb0tqQmhW?=
 =?utf-8?B?TGI2WEpIUjVCOXRPQlZWVTN1dnQzeUJPaVJnZGpaaWVEa1hNVHFjZUcxWGd0?=
 =?utf-8?B?cEVndkY1bW5JOFZ4VXhNWWFzdHRYcy80T1B3bHhjRGI1ZE5vNER6R1ZiV3ZK?=
 =?utf-8?B?RTRLUUpreW9FU3lOMm9Pam9wVlRBcTZVaEU2aEtJK2grZzhMTkJvK1Z3RHhq?=
 =?utf-8?B?bEJNYWlHZzNwdkt1SGlaWnB5Skk1VDZUS2kzdTlpc0xFNG8vRitVMVFkamMr?=
 =?utf-8?B?dVM4VGszQmdneWVGVVZ3WWFjTzNtdVM1SVZ2eGl3TDI4QUptUGdqb0lONnFq?=
 =?utf-8?B?NGVwOHdqVkNKcXY2UEJUWWhqTHA3TUlxSVJnQnRSbHo1eGxGTnY4NVd2UVJH?=
 =?utf-8?B?WlE0OGpnTFMxQXRIZTRsczlrYlJsVmQ5cTQyUDlZYTN0K3NwM1ZjS0FwVW95?=
 =?utf-8?B?cUVjSUFiY1k4NW9DeDA3eXJkMGdqdzNndXBpSkh2RkdXSVdBU0VrZ0tmV2do?=
 =?utf-8?B?aU1vamcwZjRJUTZ3SlMvZEVEUnJBM2U0VWZkL2FYN3A1VUUvZDV1dWlzVWR3?=
 =?utf-8?B?Nm9sY0wxdGhVMkQxYkhXdkNFSC9wMGl4MkZidWMwRk9WZXVpRjFaa2hBTlhM?=
 =?utf-8?B?czlEWTk0ODBhSFlic052VFArbFlwOWRwTExBejRmQ2RINWpJaTB4ZFRvbXRC?=
 =?utf-8?B?Tm5vamFvOVNmb2dKU0d3a0RQRVlXSGlWRlF2a2IxV2dVdHk0V25PZ1NUVFJD?=
 =?utf-8?B?YjhKWjVDaTBVQkgyOEJJTTgvVkNjT3k5MFFHK0t1Sm42Tks4azN6OS9PQk9W?=
 =?utf-8?B?SFVlbUdyeFVDNFVmRmVUVEkvbFNkSXE4K3lWREx4eENINkswSkY1SjBNcEl5?=
 =?utf-8?B?djVsUHY1aWx5bkZ5QTAxK2JHK0RVN3FZMGJsWE9KOWhaRkdqVXB2ZjZHelo5?=
 =?utf-8?B?Z2kxNDVDQjlyVGgvUHNib1dFQWJ1eEhhU0VQUW5zSjVpanVUb3dHQ0VWRWh0?=
 =?utf-8?B?RmFwck1RbEtwMkM1NjU2K0lhTEQ0N2oxWFZ0VzJPY1NPbDh0ZEQvUnVFTzJ3?=
 =?utf-8?B?TkNINnF6ZXhCVnJ6SGM4bUQzQXVlWVdQWm1IOTJwUkwrZDZHODR0OXFHNmx6?=
 =?utf-8?Q?bqRE1GcUS22K8HD+siDfIU6+5zIkhk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(7416014)(52116014)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkRoWTRtZUY4elhtY3A5SXY4cVN0MWpld1p1UmpTdUViL3ZCWmR4aVArVm9k?=
 =?utf-8?B?Zkd2U2hhMVJXalpOb3ZmWVdnMHZHdzZveFV0clpyZUEvSjdPeTZjS2J2SWk0?=
 =?utf-8?B?ZTh2M05wZG9hZDVWRitlMEVTdlVnWVoxU1huUXk1U0tPdVdmUTl2Q1htWkk0?=
 =?utf-8?B?SzhjeC9MNFN3MVNlcjl2a2RsUDFXb0E4TW16RldvcHdPQXFzTlBkSmJzaGdu?=
 =?utf-8?B?bU5WbkhJdU4yOStKa3VveHNjNGtBeGlZWkdwVTJFRGU5b3BQWkNOaGRNU3Nt?=
 =?utf-8?B?M0EzOUN1eHBFSFZYNnZXdDhYS3NmOW9CbDhFWEpVK0FUdmVNWjBrU25qc2F5?=
 =?utf-8?B?andHdWZSaHZxNnZZMHZUV0t6T3I5aTZwN2VwdGR5dmNDOHB1OThVYjMzaVhX?=
 =?utf-8?B?UHNyZFltdmNDNm5SUW9ZTml0cEdheC9oYkVTeTNQTEVaRGNPb09qdkk0M1Q1?=
 =?utf-8?B?OWhURVF2a0VUUjc2SlFGZm5QWHRyclVZVTM2MGxyWEVLcFE5eldyalRPaXR4?=
 =?utf-8?B?Rkt5VVpqS040M0dMS1RHQWE1RmkrYmpkN09ZdTZsU3B5aFY3TTFvNnVtUmNN?=
 =?utf-8?B?dEEwWDlOT2dibzZIdUROWVpWeE0zb2diWFlqK21VUHJ0RFVKbjkybnU2eWxZ?=
 =?utf-8?B?UmdITGdabVRmc0tSQ2NyTGhCZkNQVnlpZ1A0dHFUbFpLZWRyT1JJbW1Pa2dl?=
 =?utf-8?B?WmtKTGthbExZWkZpTkdrb3lFMk5aWlJyTXBtd1poc2Q1Z0tab3BrdmJCSGs0?=
 =?utf-8?B?b1hXaGhacXNaZ1dGSEJHM0VtNXJwcUM4OTZtbUxjaXlhRTYxVG04MW1zMUN4?=
 =?utf-8?B?NW8rUjlXRnczRk5FdzgrM3VheTRXZ0FLZDc0Y3JNY3BiclBzMkpSOVNQMkpO?=
 =?utf-8?B?anZocWlZdUdvZWV2U0dOQndVYXk1TllvVkJqMHhRa0tpSmpBems4T3U5dlhv?=
 =?utf-8?B?b3oyUEZneWpZVy9zdlVrYlZOZVZ5YXljSXRIcHVvejFxSlAzbUNWcU8xWFg2?=
 =?utf-8?B?dnJ5cnNOTHc3QXhLNzl5dmdKanNvZkhVRW5ocitZR1B6V2d1ek1ZUGF0VGdX?=
 =?utf-8?B?bjUvQy9RQ0hFNERwMjMvRDVBUFlLTVowR1UrcTFUWmZZZmJYNHBNdE9LcDlY?=
 =?utf-8?B?RmJRRlJIaFpEeEZNaVZ1UHh2MW9xcXlHQUp0d3J3UHhGV05PNkFGZFUzUGtz?=
 =?utf-8?B?YkIwajh5RngySHVvUU5EbVNiSy9xWFRxekU2OFd2WmZkMDdlQTFSc0dlTDAz?=
 =?utf-8?B?VXZ1R09nNytHejdGVk9HTGVlcU9uZjlBUW42QjdMcUh3WnFWL2xZcWJHaG9t?=
 =?utf-8?B?YnY5WHFEaHVXblFwdGd5WXVNTytjQ3ZJTTRiQXNKbmpxRWF1YWtTM3pDS1dE?=
 =?utf-8?B?aENFYnVjV1FnTC9lUGR6cEY0V1VsdjcvaEhFVm96bk96T21ZUHdTTkNIZHdp?=
 =?utf-8?B?bThrS1AzbUpMbXJQcG9Pc2tnekVQdWg5amk5RUgvZjY0SjdUcXNHUmltZHhF?=
 =?utf-8?B?MDVOVTg0eDFIaGNUbjdoVzdlNG1hSDBkeUR1dnVmQkRZWW1rM291cHlLRnNE?=
 =?utf-8?B?WHNzZ2dRT3VqaVAvNnZZT3BzZ1hEemxWUkF3MGZaRng1VE9TeWt4d0Joa0k1?=
 =?utf-8?B?THFLMjFXZTY4cFA4TW5UeTB1c2h3aG9NSml5VVIxbXZxcnp2eG5Vc0ExTVVV?=
 =?utf-8?B?ZFAwL3ZBc3MrNm9pQ2ovR1E3VlNzNkZoZWg1MDlNWTJQM1hCZm1pTEM0cVdF?=
 =?utf-8?B?ZGxtbUUvUW5Nc0NzUS9YOWplR095L2g2dTNTRjVlanZMOVl6ZTF3UkVkMytq?=
 =?utf-8?B?cFdCNTQ1RGxPWXdoUXFod1E0TUxpbkM4ZXJtQm9ZYTczekFmM1JLVy9nVkdK?=
 =?utf-8?B?SnAyVmFnQ2IrbmZFRE5HZFJZM0U5UEFDc0Q2Q2poSUVXUk9MVDMvczFtQlIw?=
 =?utf-8?B?bzFOS09mSDRDUTl2YTBKeGtGVXpsVHZzTXc3ejNqSWprSSt0cFBCbkJZQnpH?=
 =?utf-8?B?Ny95TmM4K2pmSTIrcHhRYmlVTWtHYkQ2dHhlRHZMb3F0aWtNVFhMUmNXQ1JX?=
 =?utf-8?B?cjBFbWJ3NjQ3RzJWTGFlcnJCdU93MS85dktlNzZCMlRWSFRicnVjY1EzYXR2?=
 =?utf-8?Q?SYK13+MLfAsvSmdJWdVov7C2y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 225ff928-6497-4010-25dd-08ddfa45edb6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 02:07:20.5779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+46LfQL3QJQZ2bw0UNRk4Uks9my+1t7PAvGzBxIfKYCBTt3p+Ov5t6lLdbiQbM3vtL/BiCTyOkwGS3v+jMPdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9786
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

Display Prefetch Resolve Gasket(PRG) is a part of a FetchUnit's
prefetch engine.  It sits between a Display Prefetch Resolve
Channel(DPRC) and a FetchUnit.  Add a platform driver to support
the PRG.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
- Manage clocks with bulk interfaces.  (Frank)
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/Makefile |   2 +-
 drivers/gpu/drm/imx/dc/dc-drv.c |   1 +
 drivers/gpu/drm/imx/dc/dc-drv.h |   1 +
 drivers/gpu/drm/imx/dc/dc-prg.c | 308 ++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-prg.h |  35 +++++
 5 files changed, 346 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
index b9d33c074984a7ee5a6f0876d09bfeee5096264c..e3a06ee3ce1a5117d0a9a00fdf7655ee31be3caf 100644
--- a/drivers/gpu/drm/imx/dc/Makefile
+++ b/drivers/gpu/drm/imx/dc/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 imx8-dc-drm-objs := dc-cf.o dc-crtc.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o \
-		    dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o dc-pe.o \
+		    dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o dc-pe.o dc-prg.o  \
 		    dc-plane.o dc-tc.o
 
 obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index f93766b6bfbfae8510db05278d104820ca0719c4..9bdcfc5aee976ef77bea6b3f6f3ac5f11249798f 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -276,6 +276,7 @@ static struct platform_driver * const dc_drivers[] = {
 	&dc_ic_driver,
 	&dc_lb_driver,
 	&dc_pe_driver,
+	&dc_prg_driver,
 	&dc_tc_driver,
 	&dc_driver,
 };
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
index 68e99ba7cedbca1b8bdc0d8ced7a610a1056bfc7..557e7d90e4ea8ca2af59027b3152163cf7f9a618 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -81,6 +81,7 @@ extern struct platform_driver dc_fw_driver;
 extern struct platform_driver dc_ic_driver;
 extern struct platform_driver dc_lb_driver;
 extern struct platform_driver dc_pe_driver;
+extern struct platform_driver dc_prg_driver;
 extern struct platform_driver dc_tc_driver;
 
 static inline int dc_subdev_get_id(const struct dc_subdev_info *info,
diff --git a/drivers/gpu/drm/imx/dc/dc-prg.c b/drivers/gpu/drm/imx/dc/dc-prg.c
new file mode 100644
index 0000000000000000000000000000000000000000..f37bff12674ae792dc35a1f27cf754df4c372f20
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-prg.c
@@ -0,0 +1,308 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include "dc-prg.h"
+
+#define SET			0x4
+#define CLR			0x8
+#define TOG			0xc
+
+#define PRG_CTRL		0x00
+#define  BYPASS			BIT(0)
+#define  SC_DATA_TYPE_8BIT	0
+#define  HANDSHAKE_MODE_4LINES	0
+#define  SHADOW_LOAD_MODE	BIT(5)
+#define  DES_DATA_TYPE_MASK	GENMASK(17, 16)
+#define  DES_DATA_TYPE_32BPP	FIELD_PREP(DES_DATA_TYPE_MASK, 0)
+#define  DES_DATA_TYPE_24BPP	FIELD_PREP(DES_DATA_TYPE_MASK, 1)
+#define  DES_DATA_TYPE_16BPP	FIELD_PREP(DES_DATA_TYPE_MASK, 2)
+#define  DES_DATA_TYPE_8BPP	FIELD_PREP(DES_DATA_TYPE_MASK, 3)
+#define  SOFTRST		BIT(30)
+#define  SHADOW_EN		BIT(31)
+
+#define PRG_STATUS		0x10
+
+#define PRG_REG_UPDATE		0x20
+#define  REG_UPDATE		BIT(0)
+
+#define PRG_STRIDE		0x30
+#define  STRIDE(n)		FIELD_PREP(GENMASK(15, 0), (n) - 1)
+
+#define PRG_HEIGHT		0x40
+#define  HEIGHT(n)		FIELD_PREP(GENMASK(15, 0), (n) - 1)
+
+#define PRG_BADDR		0x50
+#define PRG_OFFSET		0x60
+
+#define PRG_WIDTH		0x70
+#define  WIDTH(n)		FIELD_PREP(GENMASK(15, 0), (n) - 1)
+
+#define DPU_PRG_MAX_STRIDE	0x10000
+
+struct dc_prg {
+	struct device *dev;
+	struct regmap *reg;
+	struct list_head list;
+	struct clk_bulk_data *clks;
+	int num_clks;
+};
+
+static DEFINE_MUTEX(dc_prg_list_mutex);
+static LIST_HEAD(dc_prg_list);
+
+static const struct regmap_config dc_prg_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.max_register = PRG_WIDTH + TOG,
+};
+
+static void dc_prg_reset(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_CTRL + SET, SOFTRST);
+	fsleep(10);
+	regmap_write(prg->reg, PRG_CTRL + CLR, SOFTRST);
+	fsleep(10);
+}
+
+void dc_prg_enable(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_CTRL + CLR, BYPASS);
+}
+
+void dc_prg_disable(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_CTRL, BYPASS);
+
+	pm_runtime_put(prg->dev);
+}
+
+void dc_prg_disable_at_boot(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_CTRL, BYPASS);
+
+	clk_bulk_disable_unprepare(prg->num_clks, prg->clks);
+}
+
+static unsigned int dc_prg_burst_size_fixup(dma_addr_t baddr)
+{
+	unsigned int burst_size;
+
+	burst_size = 1 << __ffs(baddr);
+	burst_size = round_up(burst_size, 8);
+	burst_size = min(burst_size, 128U);
+
+	return burst_size;
+}
+
+static unsigned int
+dc_prg_stride_fixup(unsigned int stride, unsigned int burst_size)
+{
+	return round_up(stride, burst_size);
+}
+
+void dc_prg_configure(struct dc_prg *prg,
+		      unsigned int width, unsigned int height,
+		      unsigned int stride, unsigned int bits_per_pixel,
+		      dma_addr_t baddr, bool start)
+{
+	struct device *dev = prg->dev;
+	unsigned int burst_size;
+	u32 val;
+	int ret;
+
+	if (start) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret < 0) {
+			dev_err(dev, "failed to get RPM: %d\n", ret);
+			return;
+		}
+	}
+
+	burst_size = dc_prg_burst_size_fixup(baddr);
+
+	stride = dc_prg_stride_fixup(stride, burst_size);
+
+	regmap_write(prg->reg, PRG_STRIDE, STRIDE(stride));
+	regmap_write(prg->reg, PRG_WIDTH, WIDTH(width));
+	regmap_write(prg->reg, PRG_HEIGHT, HEIGHT(height));
+	regmap_write(prg->reg, PRG_OFFSET, 0);
+	regmap_write(prg->reg, PRG_BADDR, baddr);
+
+	val = SHADOW_LOAD_MODE | SC_DATA_TYPE_8BIT | BYPASS |
+	      HANDSHAKE_MODE_4LINES;
+
+	switch (bits_per_pixel) {
+	case 32:
+		val |= DES_DATA_TYPE_32BPP;
+		break;
+	case 24:
+		val |= DES_DATA_TYPE_24BPP;
+		break;
+	case 16:
+		val |= DES_DATA_TYPE_16BPP;
+		break;
+	case 8:
+		val |= DES_DATA_TYPE_8BPP;
+		break;
+	}
+
+	/* no shadow for the first frame */
+	if (!start)
+		val |= SHADOW_EN;
+	regmap_write(prg->reg, PRG_CTRL, val);
+}
+
+void dc_prg_reg_update(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_REG_UPDATE, REG_UPDATE);
+}
+
+void dc_prg_shadow_enable(struct dc_prg *prg)
+{
+	regmap_write(prg->reg, PRG_CTRL + SET, SHADOW_EN);
+}
+
+bool dc_prg_stride_supported(struct dc_prg *prg,
+			     unsigned int stride, dma_addr_t baddr)
+{
+	unsigned int burst_size;
+
+	burst_size = dc_prg_burst_size_fixup(baddr);
+
+	stride = dc_prg_stride_fixup(stride, burst_size);
+
+	if (stride > DPU_PRG_MAX_STRIDE)
+		return false;
+
+	return true;
+}
+
+struct dc_prg *
+dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index)
+{
+	struct device_node *prg_node __free(device_node);
+	struct dc_prg *prg;
+
+	prg_node = of_parse_phandle(dev->of_node, name, index);
+	if (!prg_node)
+		return NULL;
+
+	guard(mutex)(&dc_prg_list_mutex);
+	list_for_each_entry(prg, &dc_prg_list, list) {
+		if (prg_node == prg->dev->of_node)
+			return prg;
+	}
+
+	return NULL;
+}
+
+static int dc_prg_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	void __iomem *base;
+	struct dc_prg *prg;
+	int ret;
+
+	prg = devm_kzalloc(dev, sizeof(*prg), GFP_KERNEL);
+	if (!prg)
+		return -ENOMEM;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	prg->reg = devm_regmap_init_mmio(dev, base, &dc_prg_regmap_config);
+	if (IS_ERR(prg->reg))
+		return PTR_ERR(prg->reg);
+
+	prg->num_clks = devm_clk_bulk_get_all(dev, &prg->clks);
+	if (prg->num_clks < 0)
+		return dev_err_probe(dev, prg->num_clks, "failed to get clocks\n");
+
+	dev_set_drvdata(dev, prg);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
+
+	prg->dev = dev;
+
+	guard(mutex)(&dc_prg_list_mutex);
+	list_add(&prg->list, &dc_prg_list);
+
+	return 0;
+}
+
+static void dc_prg_remove(struct platform_device *pdev)
+{
+	struct dc_prg *prg = dev_get_drvdata(&pdev->dev);
+
+	guard(mutex)(&dc_prg_list_mutex);
+	list_del(&prg->list);
+}
+
+static int dc_prg_runtime_suspend(struct device *dev)
+{
+	struct dc_prg *prg = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(prg->num_clks, prg->clks);
+
+	return 0;
+}
+
+static int dc_prg_runtime_resume(struct device *dev)
+{
+	struct dc_prg *prg = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(prg->num_clks, prg->clks);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks: %d\n", ret);
+		return ret;
+	}
+
+	dc_prg_reset(prg);
+
+	return 0;
+}
+
+static const struct dev_pm_ops dc_prg_pm_ops = {
+	RUNTIME_PM_OPS(dc_prg_runtime_suspend, dc_prg_runtime_resume, NULL)
+};
+
+static const struct of_device_id dc_prg_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-prg", },
+	{ /* sentinel */ }
+};
+
+struct platform_driver dc_prg_driver = {
+	.probe = dc_prg_probe,
+	.remove = dc_prg_remove,
+	.driver = {
+		.name = "imx8-dc-prg",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_prg_dt_ids,
+		.pm = pm_ptr(&dc_prg_pm_ops),
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-prg.h b/drivers/gpu/drm/imx/dc/dc-prg.h
new file mode 100644
index 0000000000000000000000000000000000000000..6fd9b050bfa12334720f83ff9ceaf337e3048a54
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-prg.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __DC_PRG_H__
+#define __DC_PRG_H__
+
+#include <linux/device.h>
+#include <linux/types.h>
+
+struct dc_prg;
+
+void dc_prg_enable(struct dc_prg *prg);
+
+void dc_prg_disable(struct dc_prg *prg);
+
+void dc_prg_disable_at_boot(struct dc_prg *prg);
+
+void dc_prg_configure(struct dc_prg *prg,
+		      unsigned int width, unsigned int height,
+		      unsigned int stride, unsigned int bits_per_pixel,
+		      dma_addr_t baddr, bool start);
+
+void dc_prg_reg_update(struct dc_prg *prg);
+
+void dc_prg_shadow_enable(struct dc_prg *prg);
+
+bool dc_prg_stride_supported(struct dc_prg *prg,
+			     unsigned int stride, dma_addr_t baddr);
+
+struct dc_prg *
+dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index);
+
+#endif

-- 
2.34.1

