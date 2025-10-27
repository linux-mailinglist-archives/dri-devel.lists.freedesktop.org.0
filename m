Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC851C0C6B2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:48:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71B410E3BF;
	Mon, 27 Oct 2025 08:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="O+q91mHn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011041.outbound.protection.outlook.com
 [40.107.130.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE3F10E3B5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:48:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDO4JSWX5FNMJWf7RK1Qe5MQcg6mtqp4PFXkgfzMNLNB+Bu+z+thnYWhmoCtQt2oZ0znyi/g+iG6qSy6/qiJ5HkzsuUZ6amzlSJIR+beaYAoK8WEyWada8b37M9rnfduaLbvgOimQtwPrdQvYpHJ8sKZX42OIA8BzSnu15FUql4fbqTuxUZMh68jnPIgjlI5bjQy7XXPnnGNalCXEKLrp/RgaX9QaiW8mtShwE0hljWfPKDQ8czI+FTxx2In/ZPR0sm6jwceMk2jPshuyEzocE7j4UBrhVGIqvnBqHPW5O0NRVuiQoZlv8lPoT/w7TvsVp7Hd3AP7HsEhLJaZSHNGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqekQUTrM+wVutVjZBsKT63EkRahEdNY2t4xODs5lhM=;
 b=JaBdS2V8mruXcY3/9W77x04+bT/W2rSnQyQm3A0k0nt4ShE/USasHcxPlkdkH4Qaw7p8SzktfwnKIDfQTEm/jqIX/YwXz1uFR9GYNrWNg3eGZvnOGXmW00EEUng0gDEvQMm/Kh1rjCs86EwF9qyq79GWEvO6IpN8hhE58XgiJPqni1ps4uoVIMuhTLrR88NfDnhwbui7ho1vCO/nWQ/8DlfqSxgVCRuVdK2Uqf4RTL8SwXnjeV++tKjwlBUzLI2WApTQ695q1tiN39LAMZUbJCxlYs8sgf4IBP++MLx4WQu3zJ6LbTGijHK+pcAqC/4KcWMOYFA+fWrt67EUDj39lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqekQUTrM+wVutVjZBsKT63EkRahEdNY2t4xODs5lhM=;
 b=O+q91mHnLV7HDde3W81PoPomQqYj9YmA67HSKBglYlyAwPvCXHGHhZLXifQDhkE5knWJTTsf+KI1JNfCAgRuiKasRr31g1AXUYVn6pjcRs8Zyv7CdZbh6b8zkosiq2AVmtpQWFCF0LCl8l97Scf6KvZqjynUOVBWpk32KBS+OMra44o5kPf4YS7MSuwZ91C8Aqv8gWqaCY3fqWajuEnTPVjPkfL/oBVxkcwW42gH4wLpj21CPgy1L3ojqtalYTnetIarQ5yoIyaAEuf6L8zp2+UL7kXoTEDgxk8stNn3z7i/mr0vXvKqgaFqfi7CN9gnXhFr1tCddDHBBLko3+z43A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB8432.eurprd04.prod.outlook.com (2603:10a6:10:243::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 08:47:57 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 08:47:57 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 27 Oct 2025 16:47:01 +0800
Subject: [PATCH v5 11/13] drm/imx: dc-lb: Drop initial primary and
 secondary input selections
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-imx8-dc-prefetch-v5-11-4ecb6c6d4941@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f5d88ffd-9bd5-4737-f964-08de1535868a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDVhRi9lYVE0N2VMSzFZZDQxOXgyb240V1NoS2tQb2tPMmNqMFR3SFBvcEtl?=
 =?utf-8?B?ZHBVWTNYY24rNWxnN1YyaU9CZm96QTQrNjBKL2JwM0dtMWFRQ1lkSERiOXUx?=
 =?utf-8?B?blRVQWhXUTVMcG9XY2Y5dFh1eWorUFZpNGt0RUhubUE4ekhOMGx1dWZYWnpS?=
 =?utf-8?B?S0kvLzVVN1NvcDdlK0JNZ1BEYUhnVVdFdW5ZVDUveEd0Z2tsOUVQMTVSUldF?=
 =?utf-8?B?WGYwaHQvR2RmWlRHK0tWK1FsalBkcVF5UEdkdnBKU1l2RGhRUmZHalVzaG9q?=
 =?utf-8?B?aEQveE9DRU0weEgzZUZ1VE4wTWFrR1pGRllWS0tXYTJ1TEQ3bGIrbTVrMksw?=
 =?utf-8?B?TjdwbE1MRmszSUVNM1FkOS8wZllVcVF6N2p1ZTFIdU9QSTViTStjZjdUMUx2?=
 =?utf-8?B?SE93aloxdjd5OGZrQTQ5a2ZITWo3K3F6cVVqWW5yV0VPYzE0ZDVsWnBOaDlC?=
 =?utf-8?B?VEhNMGVDZjNISnJXWjFsQ2lBNWVUSTBObDF0ZXcwRkRoOUtiMkhydXIwZFdm?=
 =?utf-8?B?Sk9wSmFraThkWGVPMUlSRFJnV0NHYTR6S2JJRjdsSFFzdjdydzJEQVowa3BR?=
 =?utf-8?B?VVZwemtBSlk0S0M5Qmt3bGJzMDBza3UvZnJSV0Q2Z0NoU3VBSFljTEk4a0ZK?=
 =?utf-8?B?WHpxRG9FU2RtOXphWjVkb1BiRDZvSVkwaWZYZFN2Wmo2Tlh0V2pMQnNKSjRy?=
 =?utf-8?B?UFllQzMxSTBRY0FBV0JMRWY4MXdoZ0pnYVdzK1NvQVlUSEdqTFBsYzExQkR1?=
 =?utf-8?B?N0pSUEwvS0NyQ3hNaEkxeVEvRGV6aExzRW41dWQwOU54akVqZXBPVnRkQjE4?=
 =?utf-8?B?OStsREY2ZTh5dENMNmN1TFZUZUFoRUUrRzRFSkVJck1zV2xlYnd4eWEvdFdL?=
 =?utf-8?B?NCt3WXduK3BQQW94WTRsRlE3Y09jNXR0ODJBNFFNMkVDQTRKODJWWXVWWnY2?=
 =?utf-8?B?d1lVNEhwRXI5ZXF6Q09IWFk0UjJ1cTRHU2QyY1ZmVzFJSzRvRmdLV2d5d1dG?=
 =?utf-8?B?Z0lIVFFLQjRmcEVvQWJwQTYrelUvSyswN1hUOVF0cEQydjJSczRnbEpPVmZD?=
 =?utf-8?B?SlhXQmlxR2RQUFNHeTczaXhHNHdFK3JuOG82cldBOWR1c29VcnU5N3pDTDRI?=
 =?utf-8?B?WEdNaGJZYUErL0w1cU5BTE15ZFhQeGlNUExXR1BuNngySFZDRHRjZnc5U3Jw?=
 =?utf-8?B?c1AvM0Y3V0dHZFErVmFQbWR1RzA1dmUwcUkyemdTTUZIVUx5TGJzY05QSnpT?=
 =?utf-8?B?VFlHNDVzUk9rS0Y3MFJQcnp5SDBYZ2dJeDVDakZWeGQxcHc1ZlVEcENIbC9X?=
 =?utf-8?B?REZ0bW12MGR4WGxzUms3WXFoRU93cnJSQmw2Q2xON1ozdnpoR1lINW5wdmQ0?=
 =?utf-8?B?bDBldkhtaHd6d3BsYldUSm1ZQmVMcEtXVGVpV1M0bmxpaTFDNUwxd05IZmlQ?=
 =?utf-8?B?c2lQZkhMOG43RlpyYU9wNWZKNWcxaXk5WTVOTmh6Nk5qcDl4aVB4TDNYaVBP?=
 =?utf-8?B?bXpXZkZkT1VONkZjc0pNNSthRC92VXY5Y3FOVE43N1VhM2VZZUhPY0RObVo3?=
 =?utf-8?B?aElqeTg3UzZpT3hXUFV1bW4vcXhjTmc5d1QxQnY1aVlpcE43eCsvWnRoblNO?=
 =?utf-8?B?a3c3UHN4aUtVMVV0clhkRnpvQW1Nd3dCS1U3RXlXRFc1ck5DWk5DWXdLd0tt?=
 =?utf-8?B?bldESTUrWkRWYWFDd1BwS1d0WlhRZlFCV25wR1hYc01hSUQxbWdaZnhaNWNE?=
 =?utf-8?B?bnVLK283MnVEbi9VcjYzZHZKK2pYYmJHR0tOWHpiZHZvamhML2ZUUkhzWUgr?=
 =?utf-8?B?WHhqa2pIclBKWkErNDRzb050OEVEUWxJQy9iWU5VN0dCbjZYei9MNXFZeFNF?=
 =?utf-8?B?MXExbDB0V1lQajNuWE1RSUhYN0xSU3FZUW0wQ1QrQWhBMCt6VUZGNGVMWHQv?=
 =?utf-8?B?WGtEbWxNeWY5Z1A1djFlcnJ4OGtzVmtMQlU5N2R5cittZDFoNXEyS1Frdjh5?=
 =?utf-8?B?dVFBeFZlK1Jtd3ZVMmJGcXAzSTkvWHNWVWNGY2VGNlV3OWxtc051cGJoT3Zi?=
 =?utf-8?B?MzVVWGhrR1FOaC9zd0pveWEvdWxCdjlBbndtdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGVwaC9mWTA0Z3d3d0wxNm1kcEttTjNnajNtQkV4amhVYkMrOTgxSDE2dC91?=
 =?utf-8?B?UHJsNGZ3ZjFoZjZiR1Jkcmc2WXFQVytNMFBNTW8zZGNvRGF1RWNMRkxJNVVk?=
 =?utf-8?B?RTg2L3BtT2U0Z3k4MmNtT3l3UDhSN3RYbk9tNHo5SGV4VkwwYVU1WXg0QVJ3?=
 =?utf-8?B?LytHR09yM0QzUVFrN0d1dVNQOWR6NkM4bGJ0cmk4Y0RMNEFYWElSRmZLZ2JO?=
 =?utf-8?B?VDZ3b25GTGRhaWtyQVdpZHEzdWJTeDcrWGhsNUZ1MUFhbXdicUYrazhwem9W?=
 =?utf-8?B?OHNmTFc5Q2tTK29UR2N0eFBNandpdGoxaG53cnd2SVY3TlRIQXMwbUM0N1Zt?=
 =?utf-8?B?YnRuVU44aDNCaTcrQTYwTGZia2lRS1BMdnBhcWpJdmdoaTFnTTFsenIybzNz?=
 =?utf-8?B?NzcwUTl3bkg0YXRiS3c0Z0NnUjRRNG9ISmZUaFRjZDlneGw3ems5azdsSjJm?=
 =?utf-8?B?L3RyQ1FEcDB1ZjFDN1JTN29zRXkzenlFMFJieDRDMUY1R01CTWZnS2ZVR2hJ?=
 =?utf-8?B?Q05wVGlYZFpxcFZuU1FnTHNFbVhCMXFmblJIRkp2STMvT0g0dkQ2MnBkOW42?=
 =?utf-8?B?UXhPb1Rub2ViTloxaDYwcUxVT0pWWFM4dW9OQk1CRVA3UTFNRXBNN2RiYm56?=
 =?utf-8?B?T3RydFFtcEVRS2dhNDJoVDFQUW43eXo3blBET1ZzT1lPMmpud0RxMVBNU0Fz?=
 =?utf-8?B?OEpHYXF0UVE5WG1YbXdCUmkwMzFUdkFaOWtVNzY3eUVidWJoQzhvb0VPcGdX?=
 =?utf-8?B?NkhYVktkSS84dmFiZmFCUlgzWE1YVVVaZ2VyOWJpem5Yc3JjcDlwMVpkL09u?=
 =?utf-8?B?RzVBVzZqTk5nVjEvTGFBUDZaUzVzdzVUV0M1WHBXNjVkbmpWVHhidmFiUFJB?=
 =?utf-8?B?K3NUOVRjN0tZcEZjL3h3RStNSHpHTytOSStLMEphbE5FR2dCdFExRWpKaWNk?=
 =?utf-8?B?TkpRVWN5SElhdnlsbHpoUmpCbFFVdDNxTU1TdHJVbTJqWldLampneDE1OGlR?=
 =?utf-8?B?MnREOEVyWEZ3aFFCMk1KMXlKMXJURVUxdzY0bjdtK1dnY3NtcmZyZWExd0w3?=
 =?utf-8?B?T01JZmU0emJVQzUwODdZVDRxZzBWT01UN3BwRGQ5N2t6anRFZ0w5N0ptb3pC?=
 =?utf-8?B?Vi96U1lrZlNVSnNRUjdPenhNQk9KT2VCbkhpS2NvanR5VHdEOUlRTFcrcmJx?=
 =?utf-8?B?R2V2dHREZTc5VWVmMTFiVS8zSzlEYXlsNThQRzF5TkxkU2pPY010K2xFcGRp?=
 =?utf-8?B?T09kMGtLcTBZd2lPcllHaDNkRmMzOG9XOWkrVzhPS2VBMmd0T1NzYTFoUFly?=
 =?utf-8?B?YUMwV29qenhlb29iRFRNc1dmNUp0TjB0V284bENvdzVsaW9EalVXcHdPaFl4?=
 =?utf-8?B?WVRJM2tBaXgxTGdEWDVMKzNsZUlhT2ZnKzRwaXgyRWdKOENzQzRNWWhIajdl?=
 =?utf-8?B?NC83cklaMG1VRjNycDlHK3ZLOE5hdTd5TDhnVFBhanJGRjZEaGFwcWNnTkJ1?=
 =?utf-8?B?RkNCc1pjMjUzaTdVMmFqc0s2UEx4bWZJelBjSkM0a1piSjhmMHhIQkg5c25V?=
 =?utf-8?B?bmE4cGRpNVVoTnRRNlhuRFBFZS9tYnhrcVU5cGNMTEZWQjVKSjNRUUR6Umlh?=
 =?utf-8?B?dVQvY2ZwSEllSzBPM09aNHYwR3NnRytEVXZpdEF0eWFPUmkrWEtTcEJtMGti?=
 =?utf-8?B?NWVRTVM4NXVOamhJdWljcFBRQ1FqVDRGd25vdFFBdHg5bElVVk1CbGhlbUl6?=
 =?utf-8?B?cnAwWXV3c3I2MUpXYkgwSEhLUGtBaEZybmI3Vlk5RlZFYlBlT2JYckpLdUFH?=
 =?utf-8?B?VERkQWhwWGNhYmhzQVhDM24yc1BwQXV6d1VNWWdnWnhlWnV6QXZTVy8zRXVy?=
 =?utf-8?B?TjFrbTVacHc1WkhhRkk3WThZZWkrNTNHcmxkUGRSL0Rqb0VIdVJCK0NRT3hI?=
 =?utf-8?B?R09xYTFMOHY3U216M3BkVFBYNkUrSmtDMk1CaWRLVjFibVlueE94RDdOQm50?=
 =?utf-8?B?cCtYZ1JIT0RqQklabUdTUjRqYnl6QUZUQnF1aWVPMmdEaDRvb3NZNC9HdFpz?=
 =?utf-8?B?RGhVVGE4aW5MMldXUGdEZzJsZncrM1FOcG9pMkdwajBPWVA1eFdtTFkxYVRB?=
 =?utf-8?Q?skENfLaWjwnVKkeEA24AnXmDC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d88ffd-9bd5-4737-f964-08de1535868a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:47:57.0624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9MfUc8Q/5X9ySf9POm+4Z67NjkDe128sGQsEPeP6rtUg5g2Ks9DjBONII3Cwxr02quWh3N9DCvG3hkr28UWXA==
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

It's unnecessary to set initial primary and secondary input selections
because KMS driver would do that when doing atomic commits.  Drop the
selections.  This is needed as a preparation for reading LayerBlend
secondary input selection when trying to disable CRTC at boot in an
upcoming commit.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-lb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
index 8622efac3f3d566ee6eeef33d90e2e26899f6502..4776e54439fb3df42075667d6fc2971da590662a 100644
--- a/drivers/gpu/drm/imx/dc/dc-lb.c
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -254,8 +254,6 @@ int dc_lb_get_id(struct dc_lb *lb)
 
 void dc_lb_init(struct dc_lb *lb)
 {
-	dc_lb_pec_dynamic_prim_sel(lb, LINK_ID_NONE);
-	dc_lb_pec_dynamic_sec_sel(lb, LINK_ID_NONE);
 	dc_lb_pec_clken(lb, CLKEN_DISABLE);
 	dc_lb_shdldsel(lb, BOTH);
 	dc_lb_shdtoksel(lb, BOTH);

-- 
2.34.1

