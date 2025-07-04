Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037CDAF8D47
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6252F10E9B7;
	Fri,  4 Jul 2025 09:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ku/ABzq/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010018.outbound.protection.outlook.com [52.101.69.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3A810E9A6
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 09:03:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stzI1l1m1GbJbDSbMHnTT8anGhN7XFED1knkuy3lFxsvJyO1yr5K0MMAEzUoquKw4fKDQBV1FVrngH7SDyd+udpPCni3TgDJ92yk/N9viltVFAIGM/J4N2uaJ5wUMfoYI0QkJQrXFYWSewNe7yP8DkCeJO4qVns4lFXpzmlJ0+GGc1fhUbvn1/auTKeRgTAEupz8r0EjpIZiFSor0w605h3QbXu8aFsHYWy606G1L+yh33cL/vD10UeaXPCQfZ3xI6xHkdw3klyYOgQVYw8YSzH3gRCvbK36krtguGxRS75dlPNqUsc0TJeTm1Sa5wxAShjxIX1cpvP2987CWPQnbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9nm5LfaPDEZS3xiGy5MnZt3jqNPRdCYd+isnGRuvBw=;
 b=mpqf3lTeBeuR2csUCjSqEZ/GW3FNiscK2HHpRAyxqr9D+ayT8lgRnB+XpJ2OjjGj1wIZKlJhpLrlQQKBWReG9g6rEkgKqDOXKNRztIrjjNFAE2yG89NBNr1PiglzI108jUc+yDTGXE6beRoFaH5INP2njooE0z8Bo78v08azfG2WbL54B1YqyWHzfA0btJDbNDKAXpj1qRfjBk/m6jsxEVVVXg778zhRM5Dt4TM68gU8eUsgFovqKoVtRIeod6/+IvgFzoe0MUO7PYkfLzBr/7DLJlgVXyTyVIj26fbUv8kXD8/ihN0MV070NYD1sXmDp7Y8ZKCDvNvFDeOb/di05w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9nm5LfaPDEZS3xiGy5MnZt3jqNPRdCYd+isnGRuvBw=;
 b=ku/ABzq/om07c8SHivQimJ/mKuWBVjS5cnL/YukOy0d9KIhlWFQfsK5Xf7kEAlKfeG2yCCBewYs9YsabKv95kcdpNZPDZ140rsieZ8p9ZFKPAvKQ0ucBkAe3kq6+U6O038NjB1T0iLCbTcQJqEQb/t1alGerIG9COeiCvulr6D7aW2xR5DydRm0gJPdQ+WUS4utBAXs0D1a2lWqnzUSzaLdE3ceDZk1ZKGrRYHGeQaf/OucxtRHxihRPXp2GQGD2aKYZSoMytaVj5oIJ2lVIiYEzIpRnKXK8NnAosYcu7Yh09FvBpOFfpfccj8X3nXIDuNqs9ryOKJ6uKDFWk1JJZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS4PR04MB9289.eurprd04.prod.outlook.com (2603:10a6:20b:4e4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 09:03:10 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:03:10 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 04 Jul 2025 17:03:50 +0800
Subject: [PATCH 03/14] MAINTAINERS: Add i.MX8qxp prefetch engine DT binding
 files
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-imx8-dc-prefetch-v1-3-784c03fd645f@nxp.com>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
In-Reply-To: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
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
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS4PR04MB9289:EE_
X-MS-Office365-Filtering-Correlation-Id: ad5fda52-c187-4d80-ab24-08ddbad99950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzBGZGZLNEpEMWtOUFUyN2pTUVl2VWJvRWZGU05Pc2VTcGEzaS9DWHd4VWY4?=
 =?utf-8?B?ZVVJNkhwS2VrNEdNRWl5Q3ZIOHh5UUZrdHRvRHRXZXNlZTZSWWRJaktzZEhQ?=
 =?utf-8?B?VnpjUEdEUlhOaTlkL0ZnaVNabWNFcEdmM1crZmIwTWJCVUt2enVkSHVRSUEz?=
 =?utf-8?B?cmswTlZoUkJKY2lWNlRDc20vNnFKME95a1kzR0haTHVyalhHYU5CNEhkZWd0?=
 =?utf-8?B?MTQ1ZTYvalVmemlubnNuNGVqQ1hRSm5hZlJaWUVXQ1VSS1lxbHJCSzc2WGFq?=
 =?utf-8?B?Tm1LaGs5emo5MGxVNHdFTFBDeE1uU0xCaUJkdjljcG5Ia1lkekcxbGV6Q28y?=
 =?utf-8?B?Tk5HUWNYNTQrbGFmRERYSStmOGxiSWdnWnhMQXRrWGNaRS9jUjZCYXgyRSs3?=
 =?utf-8?B?bU8rSDZjeFRXc3RQU0hjZ1d1YW1ncmdUc1MvYUZwYXAyUFQzeWg2OC9FRVlH?=
 =?utf-8?B?WkZMK0FHTHRJTlVwQlNESWVteXQ3ZzBMcDd0a0lxMmI0SWorMC9zWldJNy9Q?=
 =?utf-8?B?TFhrZDFmVHdpN3IybklkZnpXSXpPUWUzTTJjZGpyWWRvTE4rWllKL2dJT0ZD?=
 =?utf-8?B?V2xoL0YwVklISTJJREMxRm1lWlZvRmNiWEZOTzhMM1RyZVVTNkcybVN6R2hX?=
 =?utf-8?B?Z3oxNTl6cU9CamNoeVJ0K1piZVVwaFFGVW5NS2FRZ3VvK0NTMU5pSjlyMlBt?=
 =?utf-8?B?RW9PQjc1K3Y4QmFEdDRhUGQ0RjIrem1GeFRHWTg3elB1OVYzTFpLcXN2dk16?=
 =?utf-8?B?dTk1ckxKb2JYNitVMkRVRlRIVndEY2lHK0pFYm1scW5oZXpYRkhPT3JWZ3Yy?=
 =?utf-8?B?djg1ZFdYTk5EeDZCYzd5SzhrUDNhQWlPRURYYWRIMTA0VjdLNFMxc09GM1VR?=
 =?utf-8?B?azlPQmVJYUlzdkFGWWkwaUVxU3B6TnZ0UTY4emtEK3RwMk9FUGVlQmdEZ2ZH?=
 =?utf-8?B?VmN4T0Nkc1pqL1dLTDN1bFRDR3lBTHJLa2ZRdGN0cnljNkRhMCtUVGNMSGFE?=
 =?utf-8?B?RjhaRlFZUmtEckpwaWp4SHBRZGJmbGlncGZqWktzSE56a3lsMk5qLzFqWi83?=
 =?utf-8?B?c3FFdmQvc0xLU3JNZk9IWlloVkt5WTJwZnFDaUxyVHh6VzRGT1FlaGxwSUxi?=
 =?utf-8?B?VUYvREs2QUFMK1dNbUMrdHU3SGxkUXdPb08rVkQzRXhaU0N3NFRDc1JPdE16?=
 =?utf-8?B?bGMzYkRsblY2MkhOUEh1NDY0bjNUcDFmOEttYWovcVFCaUJKeFVLTnVuSHpu?=
 =?utf-8?B?bHpPSU5FdGxTcmVtMU1wQk93cU45VkVoKzBUeTUraC9DQXMyRTVYM1hJK1J0?=
 =?utf-8?B?ZHBlMTNBTTRrb3pnWlBaaTFrdFhnb2VsWGFGemdnWHY1dGRHNUNwbGh4MktK?=
 =?utf-8?B?U1R6cmFwQ2VYZUMyVGxmSy9oUVV6ek5nZ2J0NXBrNVZDM0VPMUxuZVpTMlRK?=
 =?utf-8?B?SGowQTJFbjdPNHNnMStGMEM5QWYxUVlQeUlkdWJsbmhuYmtMbFlkVExuV3ND?=
 =?utf-8?B?bG1jczMyY1lOTHdFajd4NTZqck4yQWZmK2ZpNWR0YklPRFBHRHdNd0dOVjFV?=
 =?utf-8?B?dVJDbGs3N09CWDY4bEJGZzJiRE50YXpHQnhjQVZiVHNFZTVWQk9RaHhoc3Qy?=
 =?utf-8?B?RWttQnc5bXZlL2FNdHM2RFl5RkU3NmxoUGYxN2dkclJtUE5ZTVZPWk1aMXR6?=
 =?utf-8?B?TWZJbG12Q2t3anlzZlhWQjY5cW1TQmp4d0t0OWtZSDdDaW9UQ0tDNDlhTEZs?=
 =?utf-8?B?K1VrOG82Tzg3ZVp1U3UxUkdZSmV1UzhCeE5KaDVXTEYveGFrSStGRzdRRFpp?=
 =?utf-8?B?Q1B6TXEzRXR4em1Ib0NMSTV2a2VYeXdQYVZrRHNzK05VNGw4UXVjVEJJRVFY?=
 =?utf-8?B?OTkvUndWNGN2VEZ1azRpSmxxbHRQNUsvTGFuRUxCL2R0aHVnYy9pUGRWeS9v?=
 =?utf-8?Q?6N7423Qq0BKleZctQyKsmH2Hl5Czsuzx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXpkYUZoZlVIUVRESnpVVnQ5Qzk0RjdpU0ozamdzMWltcWtqTENtZjFITFFC?=
 =?utf-8?B?R0ZyaFkwK3ltdWxId0ZQRDUvejE4dTF1dmdoT25PblBESTFZb1RGUnBLL2dI?=
 =?utf-8?B?SkpvRkVXZkM1RlU5ZlhKdjBlNGFNQXRGL0h2bkZmcEplbTEvK2E2cHF1WTdv?=
 =?utf-8?B?SW1NaTBvYy9QdEs4MWtiSjNFWitRSUd3WGRXOUpkSDVqKzlJUkhUNkdZUjgv?=
 =?utf-8?B?QTExd0RmYUQ2WHgrZTVKa3JOZHdaaWU3WTByL0NDSUc2V25Oa0xBc2JtaDhj?=
 =?utf-8?B?MjdJOXFyRkFFZTV5VVdQYzdkcjd2cUgycjIzWjdpUTc4QTJ0bjBkWG82Mzdz?=
 =?utf-8?B?dEZORXBsZU45aHBxOHlIYlZrWmRRQllpK0pXRklIa3ZFS0ZBY0VaUE9DOHE1?=
 =?utf-8?B?RzRuTUpXZk84SWV5amM5SklHQk9QVkxhNi90N1BsSkMyNjV6dDdlUHhqSVRD?=
 =?utf-8?B?WEIvYlFOLzRQWU1Pc0hmellPUUJHWmRmOWdFZDdlRUNWRTR3bVZhUkNWbW5r?=
 =?utf-8?B?WnliUnpsdTUrd3hFcGRub1g0ZGJnR052emttb2c0Rm4yMmVnaUxXbkhSMGg2?=
 =?utf-8?B?Rm8ySVlUNWQxdVFYWTNOb3laUk5oUklBTit6YU9ENUJKOXNqalhBR29wK1dB?=
 =?utf-8?B?OUdiOEJjUHBzY3VEbGJ2UjBNeGkwUUthM1Rla1lKWDcwR05PN0lGYlRLSkZn?=
 =?utf-8?B?SlRSdkdnMWJndCtsNUw1R2thOEdlNlAxblpLcGRJSEEvbmZzU1VuaktXRVd1?=
 =?utf-8?B?VXFZZXhvQ0lSN3Vqa2JjZUhXRThuTXptOWIzNU1ycU5JeHlLMnQzamovRjdU?=
 =?utf-8?B?OHRwUHkxTEJYeG1yVWtHY0FHeGVwNVZlVFplcmgyMXI1NWtxSjBGWUdaWFNt?=
 =?utf-8?B?TUd4OGo4dWdON2VqSlY4SFdvNit3S3FlZ1E2OFg3bm1wYjdFTlorUFo0YkVw?=
 =?utf-8?B?eCtlcklUZTluR2w0MnhxWi96d0QwR2Jna0NSYTQydHJPa0FvY01jcG0yK3Bx?=
 =?utf-8?B?R0tKeHlSR3ZDQUI5MEp6bG5TVjg4NE4wbFNWZXJIcFhxTk8xYVpUWmVQZjh0?=
 =?utf-8?B?TG13RVhERndJeFZET05QRVZETTByRFpxUEJKS0ZSSUIzS1BWN3U3YXVvWVdq?=
 =?utf-8?B?RXJNNlhjK0ZjRndFSUVIZXNIYzAzcEN2N0dVUkNaZEZyZm1XSnNXVy9HNkFi?=
 =?utf-8?B?NS9ubVhNQytOY0hwQ05qcW9wb1UzY2hKbzd4N2xtRkl2ZnVCS3U2V2JKR2hM?=
 =?utf-8?B?clFUelVSNHlYVUIxVHAwbVRIM0xlVW1aOXU3UnMrd24rV1VwWWRaVTk1S2Fp?=
 =?utf-8?B?Y1hOd1VQRzVTUXl2TnFoRTFOd3NVcENnTTh4QjlUa3lFbFFHcjBTZjM2ZEha?=
 =?utf-8?B?SlI4K1FCWEg1MGNlMThEN0lrbTZvTW5ZN2ZFaDAwVjRDWmQzRDFFM1ZCUjdu?=
 =?utf-8?B?b0FiOTVsZWhDdm1raWhhVUtxTHpXTjlpa1lMY2J6ZG9QOVVNdmdwblN3VVVF?=
 =?utf-8?B?aVQxOGlpR015U2NrRHZ2OS9OdjExK05lWk83a1BJWlMwOS9HcTM4bjAzbE1w?=
 =?utf-8?B?NnBjV1ErTHh4dXhaaUpjNmU1aEp0aWFJaXYwM1ZCTFJnVFZlTW9ld3B6Vkl3?=
 =?utf-8?B?Uk9kZEVSajNKeWZ1WTNGK0oyYmR1Q1hYalpvRVh5dGFYR3A3VXRhdFRuVU5k?=
 =?utf-8?B?T0xoN0w0N1d1Ky9OTTFFcVB0clAyemVhN3BnL0ZzdlAzZUlIbHViQ1Jrc0pj?=
 =?utf-8?B?WEcyQkZqSE5PeGxFdnAveEt6SDZyaTg3eWJnNjBLelRTTCtjWnJNMUJIZ3Ja?=
 =?utf-8?B?aGpkdDl3VlVoOVU5RmR6N3crSjFQbjh4UnlaUDhDMTEvaTdzNDEra1R4TGRN?=
 =?utf-8?B?TjZtMkNaejg1U1pFeDltdythUG1UOGdya1plK2dMMVJMY3RyK0lWd2wzYlFD?=
 =?utf-8?B?bFJtNnoxUE5mM3RSenkyeTEzQ0RCNGZFT3VXSnBFUDlvMXNZR3RtemEzYWw5?=
 =?utf-8?B?c1V5NVkxNktwYmoxVWp4Z0ZmYnl3N3JMdUxOaTRyS0NnMkFTL3BUYlpvQ01j?=
 =?utf-8?B?UjhZc2grSDNWTFhCSnFRclBtd3oxS0dNS0tuZEQxanNoNDh2NS9udjNrWldi?=
 =?utf-8?Q?Wqte5DuL5yJ7fd0fEtzOYYvfM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad5fda52-c187-4d80-ab24-08ddbad99950
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:03:10.0890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KXlq2IskDBs4zRWDVKR1K32LKpiyizVWqz/zFZWzzaygbFMXyMX9jJKiQvj0pgZPNEY4bcHprciv/J3EV7GTSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9289
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

Add i.MX8qxp prefetch engine DT binding files to
'DRM DRIVERS FOR FREESCALE IMX8 DISPLAY CONTROLLER' section.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5bdae246605d2c3ea6ffe6c556efaf0eac742de1..b9a08556c1d94567cf00459b3a267e22d88776c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8084,6 +8084,8 @@ L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc*.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
 F:	drivers/gpu/drm/imx/dc/
 
 DRM DRIVERS FOR FREESCALE IMX BRIDGE

-- 
2.34.1

