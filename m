Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1422FC0C6B5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:48:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BD510E360;
	Mon, 27 Oct 2025 08:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="e8ZW0BJ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013053.outbound.protection.outlook.com
 [52.101.83.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBC210E360
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:48:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdmJkhcmVH083q3P/cQ5VFHUFZn63GEmNW8T0ttV6+5TtIKTtof8VzwYiuhUzuacg5acLwwwXhQkWB5F72egj4GPhTz+Mdthfb9MM6HCrEj0AHNDE2E9mbMcbDlDTuGeNKvdhGIZzjWSsgBi91qj6+HpJdOZNDnoxSOXTR49jiJe0L2qZLNI/9WqHQEvptcNC4KM9hliHm7a4mNkYtC5Yhcqt/ZBK8NUVlnPFxMsLzPrEp5Et1g0IowFwozMhknq2C9KRmUbq5KPAO/yob/yHAhqtHRrvGKQJktJQEA1tGJNraOv+6A6bQNYCn05oFWzKCsOcv01aJmlEwjuIYKwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yukhhkRsH82J7m7ux9G4bzAwAdach8qioarrVe1Iw0I=;
 b=ifg05MdpOoj6XUhjBkGoySwzcf+5A5ET1cy+C07zijl25XHwUSU1I51rYwwdGdGIMVcquF8iYkoAd0rRgF2hGDnZklQNIxYSn6twRHdw9N7CsC1yjWyD5XdOr1q5Tv8hFS5qzW2Qog3hqo98o3Fi1InSZu8ex9um5s5F9yFFU4vDSbskkgyzHXbtvGtCjdGv+nZwwfq1Z8PED4+MxUgUmmLhDx1vIisrP3VCFbhenRzO2C//N/+wENGZbxfAkLj6bsOd1SSE63wU+HYQiRiX9/O+ma3uVYeyqYeDLfzfMJk0bjfz56sX3U/W/SctK+p0GVtVQFs4FHfbvXGfA4GWEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yukhhkRsH82J7m7ux9G4bzAwAdach8qioarrVe1Iw0I=;
 b=e8ZW0BJ/bSZQV1F20QYw8oYjlAJzvATuW43zRwpI4BBEv97lxMTJxbGHrWNMue5zNU/NocjpqSVNPAyFkBy9Q9XseHCZfutfkG9PzbH4BkogB197F+1gipKT0ydAWYb6riOj8oiJX1JrZWdczvzh8X6eveYs4CHxjSBtv9OkmPcV5Zfpjotw6f/OC3td+dUOvBR/7jI+Y81rumXoxQiiJekc4MW5qxW5XHxGJlgxmn8lo/jffkyLk+ZXn3+ZD1Fmh8QuyEMIMjpJuLZDfmSEwLsUpTnneJnkfqhI2XnufN9Qf5XfYskBlQ4wjfSju6QHrJHczCWYtk9khS5VJx7mJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB8432.eurprd04.prod.outlook.com (2603:10a6:10:243::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 08:48:10 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 08:48:10 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 27 Oct 2025 16:47:03 +0800
Subject: [PATCH v5 13/13] drm/imx: dc: Use prefetch engine
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-imx8-dc-prefetch-v5-13-4ecb6c6d4941@nxp.com>
References: <20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.com>
In-Reply-To: <20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.com>
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
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: e2cfbe16-cef2-4a1b-3e89-08de15358e88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnlBR3YzVFR0aGczaWVNT1U0QVA0QUNkWlJiWDlkcDROcnpUVlY1dUo3c1VI?=
 =?utf-8?B?eEd4S2tQTUtuSVhKaExtcVR5alhIU1QweENQVFVIK3U3bm1YRjkwczdOaGJV?=
 =?utf-8?B?N2pDMEI1ZWc3YzB1OHhPaVlNUmdtS3hlUzFtalFhYnhJdm1ETmM4NGwrM1hz?=
 =?utf-8?B?YzZOYXJNWWw3bkwyYUpHSGx6MEIyU2hOditMVGZKY3JORjBzQnltek4vRTZo?=
 =?utf-8?B?cEJNR3dXT3BBUkt4TURoQUMvc0hlM0tZMXp0SVBpS2wvQVA2c1I1dCsyZWdU?=
 =?utf-8?B?VnpRTkRZV0creDNsbHh6VStpZXZrOW1NQk5scmpINmRwK0FvVnhxM0dKNWR2?=
 =?utf-8?B?aDVwbVJIMXVLTjFZTjk3U2JxbFQrNmU3bFVJeWs3QytYTlFwUktia3NxeEtu?=
 =?utf-8?B?NFAvSVJnTG1ZcXRzUTU3V0pyNnFoZ0Jod2RWbDVQL0ppemloQXR2bkt6N1hy?=
 =?utf-8?B?eXlEZmJxTFkzZC90Q01sek9MaXB1MU5mZ2VkR08yYWcwUlFtNUNpTkxqOG5x?=
 =?utf-8?B?cmU1SmR0cTNhUVRVUnhnVXRyaytOREd1RjFIYXZZZEt6emJNSlBlUE95U3Jh?=
 =?utf-8?B?WkVPSDR5V05RRXByR0w2Y1IrdXEwR0RRT3hHVGRlejhTVmFLNG5UQlF3QVhO?=
 =?utf-8?B?L3dOWkQvOFgrRUphS2RFLzUvdisySXhmOFZ2KzlzcE9qV2VQa2F5ZmNCeW4v?=
 =?utf-8?B?SEc4bUEza3FIa1JUcUduM012aEVXaTI2VE9HSDB5d0NhYVY4S1BCYU54SFBL?=
 =?utf-8?B?K3BMejF2K2dHcElYeGVTbDJNTFp4dkNJMVpRUVpManZvY0l4Q2R3aC9GNFVB?=
 =?utf-8?B?L2hwT0E5MWlNNlBiTTUyRm82VloyVXBMazhseWh6QWJnTDNNSDFvNXZld25w?=
 =?utf-8?B?QVRkdS9HQkk0M2ExSDNtYTVYdm9SUVJZNGlQVWhLam9HVjFob3EwVGVqR3Vs?=
 =?utf-8?B?OTJiWFB2QmptWEUvbG1YSmMzNHB4amN1emkvMWx4WlZGQ1d3RVloZkZock1P?=
 =?utf-8?B?SkVDaFVpRnlyY1F5N3E4L1EvSXJmNVA1blhjVExlTVU5dHhtZUEzQVJwZnFp?=
 =?utf-8?B?QS9MUldKNUZKZlluU1RQQ3B1WHMyb0w3YXlnZU5weFpwQThLRGdmdnJxK0kx?=
 =?utf-8?B?VlNYZlJ1VUd5cGprS1NhV0YxNnRTemRMaDZDY2UyTUhNNndTd3cyQkpuZ0hB?=
 =?utf-8?B?WVFZRGVncGt0U01ISkRjcDRJYmNMM1lDV3E5L1R5RHdzSmJmbUJXNkdsODJD?=
 =?utf-8?B?Sml4Kzc4bE5NUHJnQTFnM0ZXTkVFRkhOUDFETkVibkN5UUFxZFdnS1ZwZjg5?=
 =?utf-8?B?ZkdWWG5YbGpiRWFmS2NhcmRSc0VCYmh2R3BobFcwMzBHR01DMFRzZGd0S2Nj?=
 =?utf-8?B?cndCb2RpNEVkWk9jTGlyalF0cDNvVnFITyttWURFS21rL2F0UU5jcWxCYVQr?=
 =?utf-8?B?QjE4UE56d0pIR3U5SmhlazFwMTRUN3VLWFMzUVo3OXJTY2JCY282QVJRK3d0?=
 =?utf-8?B?Y2dsWVhta1YrYzY5amdsRnlyQzJQY1hzdHNockhzN0puQ0J6RXIvWTNvZmpC?=
 =?utf-8?B?cWVaTnFMSGVueCtJemdaWDhGa2xwMXk5cjJ1VjdMWjhoNXl3QTQ2WVlRVHBq?=
 =?utf-8?B?QTJkeVB3T2NTVWVKc0FWOUhtSHdlMmdrWHBTcDJNWWtKcFRSU296czR5dktB?=
 =?utf-8?B?OWdLNkp1aC9tb1E2Vy94bitzODNURGs4L25tVW5iSFN5MG1ZY1hrY2dYSFI4?=
 =?utf-8?B?N0N2anYrelI3eDVhUkpFTmZ4VStabENxK2dSZnF0L0RITnJmMGpsVUxLTHo1?=
 =?utf-8?B?MzhzejdWTkZ3RGZOekNoeGdKZVNYQSt6OElMRU1mZ2ttMHdlVHd0S0VmbUFE?=
 =?utf-8?B?VnRNU2dkcFhjSHRXK0s2TklpSTNwdXBGVGNXZTJKT0N0TEQxcm5RUFFWQ2t5?=
 =?utf-8?B?RkpwZmE5eWg5ejg4T2NlaUl6QWptUVdaRm1nYUQvbnNmKzVuejZINE9SRjIv?=
 =?utf-8?B?RHVRRmt2V21BNmErckdWR3g3TWVZTkhneSt4UncrbjVZeFUvcTd0UFc3NThG?=
 =?utf-8?B?R3VSaEJURmE3ZEZIank3d2tVQ3FmTGhSM1REQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEFoZ0NKN2ErdVEvRmt5bzVyL2tuMVBWS3ZPYUZmQkFOVExWZjhIY2p5SXlR?=
 =?utf-8?B?U0dCY2pSeUtJcFBTNi9qYTJMNE1vU0IwMUMwRGY4Mmh2WDAvZkNSUEk2Z3Aw?=
 =?utf-8?B?TnpFZnVYK1FuV01DaHVlOGNtV1UyTE1Sek9VUXUzMlFQNno1UnhlLzlFdUxI?=
 =?utf-8?B?cmpSMmlwVlhqbXJPSGNsOERKM01qaG1QTXRobHltSnc3WHJ5d3h0TkRNZVRv?=
 =?utf-8?B?ZHZ0aGRpQTgwZzRYVG15U05mT2U1eHBQQXp3S0FNbFN5K2xXcFlEUkZqWUho?=
 =?utf-8?B?ZERSc1BiVEYxNVRSK2dyQWg2Z2hCT1dQUXZsRGlRaDNPTnJ0MzU5czZuWXJE?=
 =?utf-8?B?OXhJbHUrYUNDakUxQ2FuOERVc1BScElkVWk2blVhakloaGFROGRHc01OM2RX?=
 =?utf-8?B?UnhUclprRWNlWGRwTnFJcjdoYXg2alo0QnNTaFRYRG41cGloVmNOQXJWMGc3?=
 =?utf-8?B?NEwzMFEzMExnMVBwU1Q2azd6cjdPY2xMdmNrWDUxUDNSRmRobTBRQTBKVzFS?=
 =?utf-8?B?Sk13OXRTMFRpNG9sajNhM005dFNWVWpZWDM3QmR3NTF0cHA5MzRkZGRoNHhT?=
 =?utf-8?B?eFhTbmhCWkJsT3VEVGRoa3IxWVBFZjlxRXdMcWxLQlM5QmhEV3UwNTI3WkxT?=
 =?utf-8?B?Ky92OU95RGUrOGFYb2Fzd24zZVdCSHJONnJIWEFwVEU0NktFWmQreDBlVVpL?=
 =?utf-8?B?ZExoYldjc3hRZ2JlS3FIS3poSmlQVncyS29LUXluWWNlSURVZ1ZxdXFaVTV5?=
 =?utf-8?B?SmtKSVA3ZFIxcXdaMEU1M3RGQUNJV2drZlhvMWJPQmZxTlZhOERPZWdrc1BD?=
 =?utf-8?B?dzNZVlBDdHFEdEpCTW1GMVVMUGpYaTNzcUFIMStqY205dUVYZjBRbGtlUHQz?=
 =?utf-8?B?UlBVOWw5WDh0TFBFWFEvMkdPek9HcXcvK1Vxck90L25LcW5WOGxIQkNqME5N?=
 =?utf-8?B?Uk9acFFzdWhOdmczODhpbUZJa01mYzlGWkk1VmVNSDlqK1dLQTZaZWpVSmFj?=
 =?utf-8?B?bmlVWDN5MWcyTHlkM1gyZGgwcjQ1dVVKOWQyd0IyM0htZ2F5dmhqYnZRQytl?=
 =?utf-8?B?bmErd0ZQWjA0by84aVVRWkplQUpMWjFoVU4wdStWMHY1MzZ4Q1ZLRG9obWZm?=
 =?utf-8?B?YklLMXpQb3hCMmhHeHR2bGhoY2VwSDBYbm5mTk1vSnNoREpTalUvVENaUlZj?=
 =?utf-8?B?azR3NVo0NEF0ZGRXS29BYnlBTEVBaktuVXk5aU5ZQjNmdmlUVXZpbkd1K1Bl?=
 =?utf-8?B?NGlSdUx3MWd3VGlFZWNBUFpvZEh2NFU0TnhXV0wrODhrWG5XWHhRcWwxWHlQ?=
 =?utf-8?B?VWZHUmZNZnZXUGlLTytxbUZmczJkN3VkWk4rNGRHRnluZ0ZGYmFLNEt6eVZp?=
 =?utf-8?B?ZmNrZlRsQmJ1OVhFNitxcmtNdUpNckdjWEIyNFZIQ2RGN1ZZaVVyOGtTakJp?=
 =?utf-8?B?VlhKQUU5TjBIVFQrVGhaYlp6VXlGOU1Wc0RRQVpxZDc0OTdBZWVIdFRrL1Br?=
 =?utf-8?B?R0lyMk50SFp2T2ZEQnpjajhZNnZhcFlIUGFlRTNYbVNQVnQvM2lkbUl2Sk9F?=
 =?utf-8?B?MmNDc0NKN05wOGxNWXhma0tIN0M0Vnk4MTdaOWE1MC81YytvNS9jSml1K0hF?=
 =?utf-8?B?KzJWS0J4clU2cXFWZEc5clgyV21ubU1VQVNLWGJVOWFzN043NXg4Q0d5Tm94?=
 =?utf-8?B?d2FVVFI1R081NWtxZWc0WDFlZ2t6MHB1YkV3eEFxWllOYUR3NjJ2NklvWW1p?=
 =?utf-8?B?VE1OMmxNR3lPWWZKczJuSVBZa05jY1NGdXQ4akNrT0J4Rk9JdkhWRWpSbk84?=
 =?utf-8?B?NW04SzZxTnVMMkVmSlFPMmIraWhyZEFtSVRHYSt3R2llZytEWEsxRHZ1WG1D?=
 =?utf-8?B?YmNnbVlaNFNlTElHcFZBdTBKUkNtZlQ5T3J5dnVGVldpMmJUN0o3Y1RZMzVl?=
 =?utf-8?B?TTdBejlJQ3J1REFUaENpNkwyNEpHS0M1dU5Ta2g0S2o0M2lUaTJBVFdtSzJq?=
 =?utf-8?B?NWVDdDZsN0FqY2l3WkFIS3pJbmdOY0htamRZQzJPZnAzcndJc1p0dEFHVFAz?=
 =?utf-8?B?b1Z5akFSZDB0N1FBcjhLeDBhOXlrNmkyMld2cCtiTU1zSXUxODh1djErZ2Jv?=
 =?utf-8?Q?byoeibf0PFFTKm/QUJNSIwk+s?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2cfbe16-cef2-4a1b-3e89-08de15358e88
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:48:10.3970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e86Ot9hvup0QgJXWSfdcjf3ifPexnePzlE7aoV2Cf1dnIGh0nZGjueRj9W18RaevogEwsBzYqnS4G+LgG8zfNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8432
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

One prefetch engine consists of one DPR channel and one or two PRGs.
Each PRG handles one planar in a pixel format.  Every FetchUnit used
by KMS may attach to a PRG and hence use a prefetch engine.  So, to
simplify driver code, always use prefetch engines for FetchUnits in
KMS driver and avoid supporting bypassing them.  Aside from configuring
and disabling a prefetch engine along with a FetchUnit for atomic
commits, properly disable the prefetch engine at boot and adapt burst
size/stride fixup requirements from PRG in FetchUnit driver.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-crtc.c  | 139 +++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/imx/dc/dc-fu.c    |  27 +++++++-
 drivers/gpu/drm/imx/dc/dc-fu.h    |   2 +-
 drivers/gpu/drm/imx/dc/dc-kms.h   |   5 ++
 drivers/gpu/drm/imx/dc/dc-plane.c |  46 +++++++++++--
 5 files changed, 197 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
index 9e9e86cd5202bcb0bb4d5627dbcefcc3f4e2ead0..4c7aab360616cb1c84c31c83f16df703b1c2c6d7 100644
--- a/drivers/gpu/drm/imx/dc/dc-crtc.c
+++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
@@ -25,6 +25,7 @@
 #include <drm/drm_vblank.h>
 
 #include "dc-de.h"
+#include "dc-dprc.h"
 #include "dc-drv.h"
 #include "dc-kms.h"
 #include "dc-pe.h"
@@ -204,7 +205,13 @@ dc_crtc_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state)
 				drm_atomic_get_old_crtc_state(state, crtc);
 	struct drm_crtc_state *new_crtc_state =
 				drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_plane_state *old_plane_state =
+			drm_atomic_get_old_plane_state(state, crtc->primary);
+	struct drm_plane_state *new_plane_state =
+			drm_atomic_get_new_plane_state(state, crtc->primary);
+	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	bool disabling_plane;
 	int idx;
 
 	if (drm_atomic_crtc_needs_modeset(new_crtc_state) ||
@@ -216,13 +223,40 @@ dc_crtc_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state)
 
 	enable_irq(dc_crtc->irq_ed_cont_shdload);
 
-	/* flush plane update out to display */
-	dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
+	disabling_plane = drm_atomic_plane_disabling(old_plane_state,
+						     new_plane_state);
+
+	if (disabling_plane) {
+		unsigned long flags;
+
+		dc_crtc_dbg(crtc, "disabling plane\n");
+
+		/*
+		 * Don't relinquish CPU until DPRC REPEAT_EN is disabled and
+		 * sync is triggered.
+		 */
+		local_irq_save(flags);
+		preempt_disable();
+
+		DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
+		dc_dprc_disable_repeat_en(dc_plane->fu->dprc);
+		/* flush plane update out to display */
+		dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
+
+		local_irq_restore(flags);
+		preempt_enable();
+	} else {
+		/* flush plane update out to display */
+		dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
+	}
 
 	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdload_done);
 
 	disable_irq(dc_crtc->irq_ed_cont_shdload);
 
+	if (disabling_plane)
+		dc_dprc_disable(dc_plane->fu->dprc);
+
 	DC_CRTC_CHECK_FRAMEGEN_FIFO(dc_crtc->fg);
 
 	drm_dev_exit(idx);
@@ -320,14 +354,33 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	dc_crtc_queue_state_event(new_crtc_state);
 }
 
-static inline void __dc_crtc_disable_fg(struct drm_crtc *crtc)
+static inline void
+__dc_crtc_disable_fg_along_with_dprc_repeat_en(struct drm_crtc *crtc)
 {
+	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	unsigned long flags;
 
-	enable_irq(dc_crtc->irq_dec_seqcomplete);
+	/* Don't relinquish CPU until DPRC REPEAT_EN is disabled. */
+	local_irq_save(flags);
+	preempt_disable();
+
+	/*
+	 * Sync to FrameGen frame index moving so that
+	 * FrameGen can be disabled in the next frame.
+	 */
+	DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
 	dc_fg_disable(dc_crtc->fg);
-	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
-	disable_irq(dc_crtc->irq_dec_seqcomplete);
+	/*
+	 * There is one frame leftover after FrameGen disablement.
+	 * Sync to FrameGen frame index moving so that DPRC REPEAT_EN
+	 * can be disabled in the next frame.
+	 */
+	DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
+	dc_dprc_disable_repeat_en(dc_plane->fu->dprc);
+
+	local_irq_restore(flags);
+	preempt_enable();
 }
 
 static void
@@ -335,14 +388,29 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *new_crtc_state =
 				drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_crtc_state *old_crtc_state =
+				drm_atomic_get_old_crtc_state(state, crtc);
 	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
+	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
 	int idx, ret;
 
 	if (!drm_dev_enter(crtc->dev, &idx))
 		goto out;
 
-	__dc_crtc_disable_fg(crtc);
+	enable_irq(dc_crtc->irq_dec_seqcomplete);
+
+	if (old_crtc_state->plane_mask)
+		__dc_crtc_disable_fg_along_with_dprc_repeat_en(crtc);
+	else
+		dc_fg_disable(dc_crtc->fg);
+
+	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
+	disable_irq(dc_crtc->irq_dec_seqcomplete);
+
+	if (old_crtc_state->plane_mask)
+		dc_dprc_disable(dc_plane->fu->dprc);
+
 	dc_fg_disable_clock(dc_crtc->fg);
 
 	/* request pixel engine power-off as plane is off too */
@@ -373,7 +441,10 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
 {
 	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
+	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	enum dc_link_id ed_src, lb_sec;
+	bool disable_dprc = false;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(dc_crtc->de->dev);
@@ -383,13 +454,53 @@ void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
 		return;
 	}
 
+	ret = pm_runtime_resume_and_get(dc_drm->pe->dev);
+	if (ret) {
+		dc_crtc_err(crtc, "failed to get DC pixel engine RPM: %d\n",
+			    ret);
+		goto out1;
+	}
+
 	if (!dc_fg_wait_for_frame_index_moving(dc_crtc->fg)) {
 		dc_crtc_dbg(crtc, "FrameGen frame index isn't moving\n");
-		goto out;
+		goto out2;
+	}
+
+	ret = dc_ed_pec_src_sel_get(dc_crtc->ed_cont, &ed_src);
+	if (ret) {
+		dc_crtc_err(crtc, "failed to get content ExtDst's source\n");
+		goto out2;
+	}
+
+	if (ed_src == LINK_ID_CONSTFRAME0 || ed_src == LINK_ID_CONSTFRAME1)
+		goto disable;
+
+	ret = dc_lb_pec_dynamic_sec_sel_get(dc_plane->lb, &lb_sec);
+	if (ret) {
+		dc_crtc_err(crtc,
+			    "failed to get primary plane LayerBlend secondary source\n");
+		goto out2;
 	}
 
-	dc_crtc_dbg(crtc, "disabling at boot\n");
-	__dc_crtc_disable_fg(crtc);
+	disable_dprc = true;
+
+disable:
+	enable_irq(dc_crtc->irq_dec_seqcomplete);
+
+	if (disable_dprc) {
+		dc_crtc_dbg(crtc, "disabling along with DPRC REPEAT_EN at boot\n");
+		__dc_crtc_disable_fg_along_with_dprc_repeat_en(crtc);
+	} else {
+		dc_crtc_dbg(crtc, "disabling at boot\n");
+		dc_fg_disable(dc_crtc->fg);
+	}
+
+	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
+	disable_irq(dc_crtc->irq_dec_seqcomplete);
+
+	if (disable_dprc)
+		dc_dprc_disable_at_boot(dc_plane->fu->dprc);
+
 	dc_fg_disable_clock(dc_crtc->fg);
 
 	if (!dc_drm->pe_clk_axi_disabled) {
@@ -397,7 +508,13 @@ void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
 		dc_drm->pe_clk_axi_disabled = true;
 	}
 
-out:
+out2:
+	ret = pm_runtime_put(dc_drm->pe->dev);
+	if (ret)
+		dc_crtc_err(crtc, "failed to put DC pixel engine RPM: %d\n",
+			    ret);
+
+out1:
 	ret = pm_runtime_put(dc_crtc->de->dev);
 	if (ret < 0)
 		dc_crtc_err(crtc, "failed to put DC display engine RPM: %d\n",
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
index 8339f44c0091918c796c478d968e0640391781d9..28f962af697469f4ad32ca23876938792a74779f 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.c
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -124,13 +124,28 @@ static inline void dc_fu_set_numbuffers(struct dc_fu *fu, unsigned int num)
 			  SETNUMBUFFERS_MASK, SETNUMBUFFERS(num));
 }
 
-static void dc_fu_set_burstlength(struct dc_fu *fu, dma_addr_t baddr)
+static unsigned int dc_fu_burst_size_fixup(dma_addr_t baddr)
 {
-	unsigned int burst_size, burst_length;
+	unsigned int burst_size;
 
 	burst_size = 1 << __ffs(baddr);
 	burst_size = round_up(burst_size, 8);
 	burst_size = min(burst_size, 128U);
+
+	return burst_size;
+}
+
+static unsigned int
+dc_fu_stride_fixup(unsigned int stride, unsigned int burst_size)
+{
+	return round_up(stride, burst_size);
+}
+
+static void dc_fu_set_burstlength(struct dc_fu *fu, dma_addr_t baddr)
+{
+	unsigned int burst_size, burst_length;
+
+	burst_size = dc_fu_burst_size_fixup(baddr);
 	burst_length = burst_size / 8;
 
 	regmap_write_bits(fu->reg_cfg, BURSTBUFFERMANAGEMENT,
@@ -150,8 +165,14 @@ void dc_fu_set_src_bpp(struct dc_fu *fu, enum dc_fu_frac frac, unsigned int bpp)
 }
 
 static void dc_fu_set_src_stride(struct dc_fu *fu, enum dc_fu_frac frac,
-				 unsigned int stride)
+				 unsigned int width, int bpp, dma_addr_t baddr)
 {
+	unsigned int burst_size = dc_fu_burst_size_fixup(baddr);
+	unsigned int stride;
+
+	stride = width * (bpp / 8);
+	stride = dc_fu_stride_fixup(stride, burst_size);
+
 	regmap_write_bits(fu->reg_cfg, fu->reg_sourcebufferattributes[frac],
 			  STRIDE_MASK, STRIDE(stride));
 }
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
index 9fbd7aadd26426d797e89a954e7e4cfa3e597b62..0527a7b2221ddab84dc6459a84a2cf4db834a7e0 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.h
+++ b/drivers/gpu/drm/imx/dc/dc-fu.h
@@ -87,7 +87,7 @@ struct dc_fu_ops {
 	void (*set_baseaddress)(struct dc_fu *fu, enum dc_fu_frac frac,
 				dma_addr_t baddr);
 	void (*set_src_stride)(struct dc_fu *fu, enum dc_fu_frac frac,
-			       unsigned int stride);
+			       unsigned int width, int bpp, dma_addr_t baddr);
 	void (*set_src_buf_dimensions)(struct dc_fu *fu, enum dc_fu_frac frac,
 				       int w, int h);
 	void (*set_fmt)(struct dc_fu *fu, enum dc_fu_frac frac,
diff --git a/drivers/gpu/drm/imx/dc/dc-kms.h b/drivers/gpu/drm/imx/dc/dc-kms.h
index a25d47eebd28792e4b53b4ecc89907ce00430c2c..8b45b21a6f8a7e6e6ed2563499753200bdd42ebc 100644
--- a/drivers/gpu/drm/imx/dc/dc-kms.h
+++ b/drivers/gpu/drm/imx/dc/dc-kms.h
@@ -130,4 +130,9 @@ struct dc_plane {
 	struct dc_ed *ed;
 };
 
+static inline struct dc_plane *to_dc_plane(struct drm_plane *plane)
+{
+	return container_of(plane, struct dc_plane, base);
+}
+
 #endif /* __DC_KMS_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index e40d5d66c5c1f0d579a7a1019c0f2e00489ce15e..e6bced9b716ba19cc913860744258434b3933212 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -17,6 +17,7 @@
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_print.h>
 
+#include "dc-dprc.h"
 #include "dc-drv.h"
 #include "dc-fu.h"
 #include "dc-kms.h"
@@ -44,11 +45,6 @@ static const struct drm_plane_funcs dc_plane_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
 };
 
-static inline struct dc_plane *to_dc_plane(struct drm_plane *plane)
-{
-	return container_of(plane, struct dc_plane, base);
-}
-
 static int dc_plane_check_max_source_resolution(struct drm_plane_state *state)
 {
 	int src_h = drm_rect_height(&state->src) >> 16;
@@ -88,6 +84,28 @@ static int dc_plane_check_fb(struct drm_plane_state *state)
 	return 0;
 }
 
+static int dc_plane_check_dprc(struct drm_plane_state *state)
+{
+	struct dc_plane *dplane = to_dc_plane(state->plane);
+	struct drm_framebuffer *fb = state->fb;
+	dma_addr_t baseaddr = drm_fb_dma_get_gem_addr(fb, state, 0);
+	struct dc_dprc *dprc = dplane->fu->dprc;
+	u32 src_w = drm_rect_width(&state->src) >> 16;
+
+	if (!dc_dprc_rtram_width_supported(dprc, src_w)) {
+		dc_plane_dbg(state->plane, "bad RTRAM width for DPRC\n");
+		return -EINVAL;
+	}
+
+	if (!dc_dprc_stride_supported(dprc, fb->pitches[0], src_w, fb->format,
+				      baseaddr)) {
+		dc_plane_dbg(state->plane, "fb bad pitches[0] for DPRC\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int
 dc_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
 {
@@ -123,7 +141,11 @@ dc_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
 	if (ret)
 		return ret;
 
-	return dc_plane_check_fb(plane_state);
+	ret = dc_plane_check_fb(plane_state);
+	if (ret)
+		return ret;
+
+	return dc_plane_check_dprc(plane_state);
 }
 
 static void
@@ -131,6 +153,12 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_state =
 				drm_atomic_get_new_plane_state(state, plane);
+	struct drm_plane_state *old_state =
+				drm_atomic_get_old_plane_state(state, plane);
+	struct drm_crtc_state *new_crtc_state =
+				drm_atomic_get_new_crtc_state(state, new_state->crtc);
+	bool needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
+	bool prefetch_start = needs_modeset || !old_state->fb;
 	struct dc_plane *dplane = to_dc_plane(plane);
 	struct drm_framebuffer *fb = new_state->fb;
 	const struct dc_fu_ops *fu_ops;
@@ -152,7 +180,8 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
 
 	fu_ops->set_layerblend(fu, lb);
 	fu_ops->set_burstlength(fu, baseaddr);
-	fu_ops->set_src_stride(fu, DC_FETCHUNIT_FRAC0, fb->pitches[0]);
+	fu_ops->set_src_stride(fu, DC_FETCHUNIT_FRAC0, src_w,
+			       fb->format->cpp[0] * 8, baseaddr);
 	fu_ops->set_src_buf_dimensions(fu, DC_FETCHUNIT_FRAC0, src_w, src_h);
 	fu_ops->set_fmt(fu, DC_FETCHUNIT_FRAC0, fb->format);
 	fu_ops->set_framedimensions(fu, src_w, src_h);
@@ -161,6 +190,9 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
 
 	dc_plane_dbg(plane, "uses %s\n", fu_ops->get_name(fu));
 
+	dc_dprc_configure(fu->dprc, new_state->crtc->index, src_w, src_h,
+			  fb->pitches[0], fb->format, baseaddr, prefetch_start);
+
 	dc_lb_pec_dynamic_prim_sel(lb, dc_cf_get_link_id(dplane->cf));
 	dc_lb_pec_dynamic_sec_sel(lb, fu_ops->get_link_id(fu));
 	dc_lb_mode(lb, LB_BLEND);

-- 
2.34.1

