Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CE1C246B2
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:21:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6107910EAF8;
	Fri, 31 Oct 2025 10:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="keZxvGGn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013031.outbound.protection.outlook.com
 [40.107.162.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4776410EAF8
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:21:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WeWe2gt2mqN07/0zpC4mDNLhjxhpggO6k9N4EPScS2yAeB469N2I7V8m4cCc/BT909CGSK+gp8Q7KiRv7U/n8fxtziw0Ijv4Y7BxvEYY8y1tDnVGVS93MOw1Tm6U39jWlRMTnheTmzH0uXNMGAniS+tduJXtIzVlTcYl9jaevuxybwx5K6xwBfKLCkF13Y8ulFrj+eJmGTV5QJtwOOiPoDGMNyaS731ZsNkVqp/wmr/X/SuS9h6sP6+rXgOdRMLLAW/TdhA12Mqp0PRdjnnV5faFbd/431PLu2u6MsuMfHlqpszwyxfCGDQEQRGcjy5M3NLTjXeY7OXTkTi5r3zWcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksiW92odG01+LAy3d2A2oDV3FJg6/BKSIndRYTVtY2g=;
 b=nooov4biTudkUinTpuEEWCJBZFnDCUwb1CTQ7RbM8E34mHgqjPLQ955m/lk3lvOjYavjoM3aZ/B1tkAsVZPaPmoKSkJ1IOpj2zb+kzVcLMOBQx64f1ij7aDTc1WeVuH8EDLr9akiB2o6LmzfbMQjmB7kHF7GXofkQyuL/ikaHvtvVMkotxRo9MuHmTt0aZDu6tmDhbwowtmDm4O+fUfU7GkJ34tsgJIPaN7tCMmbSJKMcTW//ClH/k5LiUqYJnLsWzReeDPk23NWsZaG1eJxRFJdsK7EXhzFoWEwTeml8P/YH41+50NMfjeejfkvqSdbNU+mH/tGHbUInGzRSaCi2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksiW92odG01+LAy3d2A2oDV3FJg6/BKSIndRYTVtY2g=;
 b=keZxvGGnVCDb9pySc8N09k/nKdZDlbpxD+vWyc9q9Vmh+JoRZqxgmRnqaFq4VS2PAi66XjxfJC+jEdMEgguFKF2uRzq5dZIPpitTRBwYXDwXd/L9RisgfNh1I6VuWWWTJUmXTRJOmFmjJyU7OdQGUoKtrtk9MFjVIYbdPrmAlDdNSBMk+GAV6COG2Xq6bruzBW4JQW5RZrscBPOvPmNd6u03eKTkW9EO3aoyp2oRfzw9mgq5DVGgM1pBcNWtvTKWHG80tQ6hxszvR4DC4W4doapbzCHpKS2f90MX+oUBnYYlbBF09nXXNyTgZBU8VX1I63vwy2M5Ob3BkVJtJnPeTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7056.eurprd04.prod.outlook.com (2603:10a6:800:12c::21)
 by AMDPR04MB11677.eurprd04.prod.outlook.com (2603:10a6:20b:718::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 10:21:23 +0000
Received: from VI1PR04MB7056.eurprd04.prod.outlook.com
 ([fe80::66b9:8242:90ad:ac74]) by VI1PR04MB7056.eurprd04.prod.outlook.com
 ([fe80::66b9:8242:90ad:ac74%5]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 10:21:22 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 31 Oct 2025 18:21:25 +0800
Subject: [PATCH 2/2] drm/imx: dc-crtc: Use flush worker
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-drm-crtc-flush-worker-v1-2-9edc94da0fb7@nxp.com>
References: <20251031-drm-crtc-flush-worker-v1-0-9edc94da0fb7@nxp.com>
In-Reply-To: <20251031-drm-crtc-flush-worker-v1-0-9edc94da0fb7@nxp.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR01CA0145.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::25) To VI1PR04MB7056.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7056:EE_|AMDPR04MB11677:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe0847b-dda9-4a4c-2646-08de18673d9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFdjUEhnRVp3T2pZMkhZMjdqWFJwa0h1Q0p0RjNQSWkxUHB3eWx4UDF2Sk5j?=
 =?utf-8?B?VXVBckIxWUdCZkRCYnZqQXdNaTlkWXVNeGtWdjNpNUExcXVVOTFKL3Uvek9I?=
 =?utf-8?B?Tit1MHh6SUw5V3h2dTIzUmt6UHA2RzV4Nnl2OHpxaFNHRURMakFzWUgyZjA4?=
 =?utf-8?B?ZW8wTDJrRkpuQnp0cjdicFl2eERZTm5KRjI4SHVMTGxCUmNGbVNzbjErenRQ?=
 =?utf-8?B?UVRwZWd2c3UrM0h5SWZpRVdvZk1pMWJMcDFoWmxrSnRHcTBwZXdHaFFUc3pY?=
 =?utf-8?B?a2wxWE04Qlo1ZHNwQmVVZlBiWUpSUjhvekw2aXpBUWV3Sm5zKys0UzV1NFQz?=
 =?utf-8?B?QVhQaE5xWHp2UjMwQjBNaG4yVkV2ak1RY3V1RytIeloxb25zQ2F4ejR4Y1Y1?=
 =?utf-8?B?OGdyeG5xVll4UmlNMGdzQVV4aXkvSEtzVTZ0SkZjRVZzbzJMOFRhaWFIS2Na?=
 =?utf-8?B?VURUVjFXM1RLejEyNEROTEJ2WmN6ZVh1NE5Dc0dwVE1yaUZMa2VZM1NBRjl3?=
 =?utf-8?B?STJ2ZFFtNEprc2h4OUZ5MEtCMGQyOS9jVExTWnUvcFhlbU5wbFZvSGd5eFp4?=
 =?utf-8?B?TklDMmM5SjdWTk84dFpaVFpKSzBsWjZ3UWdpKzJIUzFpWStTN3B2VlM5VVNF?=
 =?utf-8?B?NC9FWkdJZkVGZ2dmMnJvSFplT081V3FQMWp1ZjFQbzY4emxGeVlRM1ZUZmox?=
 =?utf-8?B?VFNHTVIrcU5tcENWd3ZBVk1NMmNlbEdoWVIyVEFuQm1WS1NYcmszekRPZ05P?=
 =?utf-8?B?MVhtSXlGUEtnMUVSL0xSWGFOcDFhY01ITzIvQVNFVEFoRnVQYzM1c2Voblli?=
 =?utf-8?B?dDNJZlVjUktYazlGZVUvZDlnOFBmRzdtMHF6elhtenk1Ti9MdmFTK043ZzBu?=
 =?utf-8?B?YW1JcWI4QVBmYk1uamo3Zm1JVEtTSmZKamJiV0hqQjkxbnJJUVJ1SlhzTFNN?=
 =?utf-8?B?SFB6NDB0WGUwbjQrSFpxMnJDZXBUcjhLNmtPSjY0SW5mT1MrYTI0SGFIRU5k?=
 =?utf-8?B?TjR4U05yWHBNUzBNMG85TXVoUzZTUUZrSk9lU1NMN3M0eitlNEMrQkJ6Tmk2?=
 =?utf-8?B?MjExb3FWM1VlVTdwbEJISjVuTGw5WGR4Rndqd1djejM2eXlEbTBTd3ErdjZV?=
 =?utf-8?B?NFkrakpmaUQvU2Y5TUpLSFY1NVVPemxXUDcrUVRaV3ZxUE1tWFptaUs2SmFq?=
 =?utf-8?B?Ujhkd0VkUHdHUms3UERrd2YzQnRKMTMyNWdOd1dIYk4yUGxRblFkQll2NWpQ?=
 =?utf-8?B?UEJuWlpEQkJkZFYzRWkxSytkMEZzTWZITE1DUjFMUWZnUGJNeTJCYi9XTk4w?=
 =?utf-8?B?U1cxRVNnYVRydWlSVlppblp0akl6S0Erb1VteUVTcXFud1ZDUDlyN1dZMzdB?=
 =?utf-8?B?cFBuZFJJcXNGSzNBQmRWeWdIY3VtTjNUdGxvbjJ3ZnVESnBBSG40VlVzZjZF?=
 =?utf-8?B?TWFPcjRtL3pNWEV6UGZZQStFcXRQbHlXNWhSeDAvWURUMkFFYXh0ZVkxQS9o?=
 =?utf-8?B?Nmx3S3NGVk1lcDdxTXQvMW94NEFsVm1lODduVTBEOElrKy9FbHhqWHFXQ0hO?=
 =?utf-8?B?ZWczMmlreXZiMkp1VWpRY2lEM2dhc3YxTmo2T0FXWVZUeE9ON3V3RiswV2w5?=
 =?utf-8?B?QTR1czZpMExTUmIxY3FONE1DUUtBekVTUGVkTFJHQzZLU3VDQ0tYQS9OUzU1?=
 =?utf-8?B?NWNDLzA4ZzJlOTFPTUkxdjdqY2NocU84WjE0cUpyQ3V0b0svMmROMWtwaHha?=
 =?utf-8?B?YjV3ZVk0RUZVSTMyUml3cW5UTktteFZ0NEMyRHdUUnE4UmdHclo5UXdTdlNj?=
 =?utf-8?B?SGZOaDJZVUhUSnBwR0c5ZUpLczNseGMrUjlmdzdHdVVmWnZLZm1tbndkd1h0?=
 =?utf-8?B?Yy9Ha09xZkZKSGxxM2FaWWFyVng3d1JTU1NnYURjT204VlNwWm5QTGxrYldV?=
 =?utf-8?B?SDhkc3h6VVRUbUFaWFRiSytsWjAzdENLc1ZKc3dJZkRxSy9jMkdSM2RLUFgx?=
 =?utf-8?B?akVpbVRaTXk2RjI4NXNSOUh4bExMelRiU0ptQ1lST05LQ0FOMEYzVTJBM3FK?=
 =?utf-8?Q?tcIcuC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB7056.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWxJM1BaVWxwanBQSys3Z3pYS2ZBNkx0QTBBZkRmR3pEemxWaXVTSGg0bHBj?=
 =?utf-8?B?ZHZUMDVVU05UNXNEQzNPampQSTVjV0VyazNjMXc4V1BDRWJ5d21JaGVOeVZv?=
 =?utf-8?B?R1UrN1JXbTdRR2c1YkgwbGdUMW5nb2o1UUhwYWNubHhZeGJuSDkwc2Nseldk?=
 =?utf-8?B?TVIrNHVJQUk5emltdlNrMHovVVVlQTJpU1JiT3UrOERMQ0Z2Q0RzVXFTMndn?=
 =?utf-8?B?bjZYdEpLSXF5YXJpUkVneUN5WWJ3cDZubkVkRnZvL1BkajhCUGhoQ0ZmZmQ4?=
 =?utf-8?B?MjcxbmpQcFpvMSsva2hpVU5hbk53N1RCdjZZYW1tRWNNa0kxQXdDbVYwRUdE?=
 =?utf-8?B?VWVBdkt5TXZOcWd5ZGNhUmNYMEovTnVtYmF6S0lGc1orOHZIQnRxenNhSitj?=
 =?utf-8?B?WnBLQkRTdkZaQmh3czhwMmhHY3JmaE9NcTNvZUxnRGdja0xJOWxLVDRncTFl?=
 =?utf-8?B?VVZheXIzNnRka0E0VmszSUpLQi9nRURBTjlIQmtDWlJkRGtXcXlaZ1F4dUt5?=
 =?utf-8?B?SkJpTjJYTGcwTlJQOHVNQ3hLYzQ4QkptM1c1ZDhQeXZWOU9kY2xpMEsrTkRt?=
 =?utf-8?B?alVTUW0ybFlKOEpkaUlrVEE0VlkreEVheFFOWkd4ZWY5Nnd5eTIwR2dXeDQ5?=
 =?utf-8?B?S2tWKzVCa3dKL0N6SW04TEtlaG12bkd4RW85R3JtR0xyT2wrYUZZZ1hZRlNW?=
 =?utf-8?B?OGxMK1N2dnMzRHRZUG50MkZkdE51UGxxbjJEbHJkNSs3SmhpZzZ2cjYyUmd5?=
 =?utf-8?B?c09LVXNCZlhZcDN0cDRqWitRTlVzeW9RaFJLYUsxeVh0VUhSTVhuR0ZIdDZS?=
 =?utf-8?B?SjJ6Tk4rQ0c4NU41dHdnbXFVaXNybnVHdkpraGtiVHprUjhYR0xQYnAyczlp?=
 =?utf-8?B?Q3Z2SEtjSlFVanhvZ2RnWlRTWEhmZmd6dWJoOHVGblppeHBudVNUalpLYmVj?=
 =?utf-8?B?Wnk0akZaNU02ZFNmZlJNbnQ1UThSNGliOTlMb25BSEpMUFBoZFE1Q1lpRXRS?=
 =?utf-8?B?ZFZhbDk4MVpOQjdNTmNCbSt1ZjlmSFRrVThpM3VENjljdVlQMkVKMHEyWlZJ?=
 =?utf-8?B?SFdvbVYwaGhYUzZ1L2ZNSitFWEZjeGNsTUt0dS90NW1JZElrNnRnT0V1V0dO?=
 =?utf-8?B?aFR6MjVXeUlteDFkd29SL3JpYzVMa0dNNVNFS04wYXIwWWFHTjNrWTBVRDhl?=
 =?utf-8?B?YXllaUxQa1NydlQweDB4bEszUkppVzdDY3JkWnFPaUExRjJ0ckthbFM4dmRa?=
 =?utf-8?B?YXRlNnRkR1pzVVo2dHNtQlhkSEtZcHZvOFVCeFZ3aUNwQm9xUWdZRmlHeW4w?=
 =?utf-8?B?eHkzcy9xYmF5VVVXNXZkRHJ4OCsveXh4QkZ0WlNlSFpFQXFzSGM4aDJwbjBB?=
 =?utf-8?B?K0U1dnB0a2JFREgxYXdEN2ZWZEpTOGMvZ0hnNXJUQXFRcCtoYldWOUpsdmpN?=
 =?utf-8?B?cU40eUZOQ1B4Z3BZaGV6WXlKTHZMNm54dnZ0NXRha2xQWjdiYVVnaVVDMFNk?=
 =?utf-8?B?dXhjaEZuR3NKb2Q0Q3libHRBSURnaFI2b1R0bmNidi9XQ016Smd6QndnSjhj?=
 =?utf-8?B?N3lqbzljRXhaZGpJWEQ3eFdjT3pxY2xmaGdJNm11YTJaT0JYYmMvN0RHS0cx?=
 =?utf-8?B?dU9wQUFSUXd1WmZvU2V4a25YVmo1b0FLNXhnVloyeUcrWENMd0xFRjZsSmpJ?=
 =?utf-8?B?dkNrb3lKTWVRZ0NFK0hzTmtWbVRMVHNHbCtOVmRXSVoybkIwMitoM0pmZTZy?=
 =?utf-8?B?VCswR3puRDFRNzNoa3VROS9yNjJJdlAycDFWNGlKeTlVcUNRSVdqc2JXNUdi?=
 =?utf-8?B?OHNNeXZSOG1BME5iSHhuVkJQVXpiWCtSRE5rZlpLVEk2OTVCYTZrQVBhUkQy?=
 =?utf-8?B?KzZoZTJGR2tvWlh2MG4wcUZHeUp3STR2cFBzeEVjbDhCdjNDcXJxQ0hxNU1C?=
 =?utf-8?B?Q21HMVVaVWdDZlozR0wva2xqamNhRkRRNXMrV3I3R0ppdG9SK1JhbG5KOUg2?=
 =?utf-8?B?SkRkcTVCeHZWUHFBVnVkVGZxTW5wVCsvUmZJSWNYZDNzY0ptYTlESjlnQnpa?=
 =?utf-8?B?KytUTE9MRENMVmRzMmkwdXd4Yzh6a2FnMGNPOGhnMExYVzduMm9odkRsL2ZU?=
 =?utf-8?Q?SUEGKSn3T3Xf+KQjAg9HaRfGo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe0847b-dda9-4a4c-2646-08de18673d9f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 10:21:22.9215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nWeNcAhfRjd1IyIU3OXi6Kn81qGu7fdlWZszBby5rBR3lr8MCNMdAn7PrKguGssC+eKJctfOXAcoBZYQvGsR5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11677
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

As dc_crtc_atomic_flush() is blocking due to waiting for shadow load
done event, page flip performance could be low when atomic flush for
two CRTCs are conducted sequentially by drm_atomic_helper_commit_planes()
with a single atomic commit.  So, call drmm_crtc_flush_worker_init()
from dc_crtc_init() to initialize a flush worker for each CRTC so that
atomic flush can run in parallel by drm_atomic_helper_commit_planes()
for multiple CRTCs to achieve better page flip performance.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/imx/dc/dc-crtc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
index 31d3a982deaf7a0390937285c9d5d00100323181..fb1049a09296a3ecaad8d1430d818fd6e2f25a54 100644
--- a/drivers/gpu/drm/imx/dc/dc-crtc.c
+++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
@@ -540,8 +540,15 @@ int dc_crtc_init(struct dc_drm_device *dc_drm, int crtc_index)
 
 	ret = drm_crtc_init_with_planes(drm, &dc_crtc->base, &dc_primary->base,
 					NULL, &dc_crtc_funcs, NULL);
-	if (ret)
+	if (ret) {
 		dev_err(de->dev, "failed to add CRTC: %d\n", ret);
+		return ret;
+	}
+
+	ret = drmm_crtc_flush_worker_init(drm, &dc_crtc->base);
+	if (ret)
+		dev_err(de->dev,
+			"failed to initialize flush worker for CRTC: %d\n", ret);
 
 	return ret;
 }

-- 
2.34.1

