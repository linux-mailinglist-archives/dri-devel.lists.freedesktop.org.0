Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BD0A70EAE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 02:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DB810E636;
	Wed, 26 Mar 2025 01:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="EKwDNW4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD5710E636
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 01:58:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VuwHqq74NOMhXslpRG6UxA9HQTQgxMNRBEm1h1lxWCUTo35A10QttXAdQ6z0efjlkS9leCoMOSJQ8tp5N+faFqXyJ2Fuq1kItjqGMVFl7Hvjosn8vFzF+ZYj7UQxDT4dDGs/E0U7B5EOyQ3xSdLeDSns9xGEbkcZ2cAus7pBMym+Yw4u4EqJCNcQQ3t523k/+++ciUM9daXNXLWPkC/nL9xdZ2d4MrpEpiwFG8vkhKqe3Mk7b/H74mvD1HbfrBquLGXKvZpBfRpoOs9+ghcw1PCNOP1r3tlHN9xCoxATg1KL8HVqk8Z4K0YU/qrD4cPxW+Pp3fhFkgOlNfHeKYkkDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lvmv/YjyP2BsBolHU4w6h12pYcCOC7Uc8SmJWXhZbwE=;
 b=QHITPASLL1HcL9cKNf0WCSIFTxdlTw183nBbXEKe7Zrp61FsFTt+ZPy1SIcFWL3JSu808f/LimuaB5He5VL5lCLTErAId7MZ2JE13NY8RwWbPD29o+ESVvMlskHIQFMJauo32guzGeEf0D/c0OafcrgkAPRK0xJFZG/vfetq8gyCbhXlPu5OJvX3d3HBQtGYEzOgFSi9clHi/sakitg6XK0xMHQihL8zXMUgE7ORIXQhNjuiq8VX8ENmleSBJUj3nxAXhrCcmJ3sNUSFV2+CHZMs5I2rksIPEr19AhjUt7iQqX5yxuxlKacO97jjkiz5LoyRJS1gyrmHUtZv6MHHGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lvmv/YjyP2BsBolHU4w6h12pYcCOC7Uc8SmJWXhZbwE=;
 b=EKwDNW4JgFkd41WhfaVbMQTmapjSokBBtwmn4Qo5jd5dG+hqG4Ibv/qTkdzvnAfmwzjm0Ymb83FBkE0KcEnWRwNXqkb/vsD0T0BW2UnGqPsewcTCBLkSWKGGDI8S7xknPtXaeMCbTV83XKLU9qQ9BshyMJeM9J1vf9CPjL1N6tEbOUD8mcRCOsdzrOXg8zNMD5ytnswWZeyemSthnHtAT97rc8Xg5BAZC691YC4d7Q1z3ekgdE9+kjGl8321HIFGA/e4Br7zx2z9H+YtCWX3KkJaF1OV0TD8VhYalqvzb3aJc78I6vEI19/ob3IvteAE7oKrJ17MZJ0yDg7o4DAKXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20)
 by DB8PR04MB6890.eurprd04.prod.outlook.com (2603:10a6:10:117::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 01:58:48 +0000
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::8f9d:4273:ea83:167a]) by DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::8f9d:4273:ea83:167a%6]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 01:58:48 +0000
Message-ID: <e82e2cb1-d48c-42f3-9fec-1750717d9ca1@nxp.com>
Date: Wed, 26 Mar 2025 10:00:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imx: legacy-bridge: fix inconsistent indenting warning
To: Charles Han <hanchunchao@inspur.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250325075503.3852-1-hanchunchao@inspur.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250325075503.3852-1-hanchunchao@inspur.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0009.apcprd06.prod.outlook.com
 (2603:1096:4:186::17) To DB8PR04MB7051.eurprd04.prod.outlook.com
 (2603:10a6:10:fd::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB7051:EE_|DB8PR04MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: c9d4c66f-0f3e-4540-3c99-08dd6c09bfa4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WU1lWTRIa3k0bHk4NWhYU3ZMWDRXMFFBZTZRWnpKNGI4VUtabG9CK2RHVGI0?=
 =?utf-8?B?S1EzOXJaN1RaaWNxYXIzd2ZQTXhhaEJJRTlTZlY5WGp2S24xbSsvOXBNeVh0?=
 =?utf-8?B?RFhVZG9ac3N6ejFJNlVLNkRPendreFNNcE9leVphZlJTUDhKd3hwZTZZSUNT?=
 =?utf-8?B?dlU1N3lvVEJGankrT2t1Wmx2VHNCVk92RHJvNmV6QysvWlN4Smcza1QrQWxy?=
 =?utf-8?B?MHYxVFhyVjE2QjJtZjRWSkgydFhVdHdYaDZuQURUazFIZVZDOVc4TlAyWWZS?=
 =?utf-8?B?VGNzbzZkcU91TVlDZlhScFJaS2tiUHRUSmprSTE5K3RXcmZuVVZ1ZnNzZnVx?=
 =?utf-8?B?UnNhWnpnRkJnWGlvUlpQb3hxempxeVBuczhucWxZYnl2d3l3Ykl5RzRFbERp?=
 =?utf-8?B?Lzl2VTRVQjBOdTlzdXhibys4WlJ3aHBsZGJHNEJEWHZvWEV4RktrSmxWeXl6?=
 =?utf-8?B?aFM0UFZJaXRzNXEwSVlualE0NmtQR1dVbmp0N0dVc3JaNnRmaUVVR2pjbUhq?=
 =?utf-8?B?NU43WlVMREZPelQwT2RMUkpBWTRsaHB4L3RKSnVqQXBGak16L1RXZEQ5RmtQ?=
 =?utf-8?B?YS9KbzlvMXVzVTFDUmQrVDFadE9WMERhUXJsaG44QnlmRDZOcklEUWY5K3hN?=
 =?utf-8?B?eGlFR0YyblBIZmNpRktrdHhhNjVNQ05FLy9tZWEvMXFrZHNnRnRLR0wya01H?=
 =?utf-8?B?Wnd2SzVtNkx3Z1hFTUxzY0MydjlPUHlyYWl6NDA0SEtVNnRVYm5kS2E2M1E3?=
 =?utf-8?B?R3o2OEJYaG9ubml3ZGJyUkczSEU1OGxHdTVoa254dlo0L0M2SW51SkUrUjI5?=
 =?utf-8?B?emFNT0Z0SElyc3VrWkY0dGg2SWxxWUhUU2pMYTErajB4b2RNZTNGWTJ6eFNw?=
 =?utf-8?B?MXdhZ2lza1BuNDgrV090ajJ0RHE3UFJEMnBwN3owYXNuZVg0V1VDUjRWWXcw?=
 =?utf-8?B?T00zL0x4bzV0cVZIRFNBbHhyQ3l3WW5id0dxUEx2WW5Ga3F4K0JBRVJlbHJj?=
 =?utf-8?B?WGdEMXkyL2FySHVoc002ZE5FYUNrdWR6S0prcjFCUlJ0SmZlT3RVcklyM1JM?=
 =?utf-8?B?UjJReDh5WXN2K1c1L2RWOGlIU1RBWHZrOTg1QUtSVFREN0ZUc2VjVHlSWE9L?=
 =?utf-8?B?WSs1SXhxelVScmJHUDhpSlhUS09ETXpscyt2R3ZUNGlwSDhPNENXc2VWTEw4?=
 =?utf-8?B?L3dlR1MvaE1qWjFEZERJN0lOTXd6RVZaekh0bTAyM2tMRVRwTUZBSGtXMmN6?=
 =?utf-8?B?RUtDeUpXTGZnYXUzTmYrMlViZHdGKzh5RGhJamhWM2hZS1N1anNrUzdCd04v?=
 =?utf-8?B?c0Z1dWRXNmF1Z2M5ZSszSG5SSkQ4SEw2OTBpamFHSHlXYUVFd25sZnBteXdO?=
 =?utf-8?B?bGlwcDUxOXNlMVFmVnhON1FMSUlYeHpHSnp0T09JK1FPNlQzRE1xaGJnR3ZK?=
 =?utf-8?B?c2I2ZDNKR1pPcWZsR1VCVForY3lxbXJkWEpoYzVRVkJ3ZlU5VDZVZllpUVg4?=
 =?utf-8?B?SEdrV1NTTWNKK1orQnhtNm5PbFNhNFdjRUk1clh4WjhmZXp6eVV6WE1ER09D?=
 =?utf-8?B?T1FEU1VYOFdraFRYQW9SbEt3N2hYSFkwWW5nYTlBUERNZzNTZXIyRy9VcVBK?=
 =?utf-8?B?VEFvOUVMcWM2dDR6bENXUnZIV2ZOdnRIN3JMK1NxWmZ5czdBOFA3allPdjRQ?=
 =?utf-8?B?U2x6QzRpVEtWVWlxODJpdVEzN3dNSmxtOGpjVVF0VzB0akJjYWF4eVU2Uldh?=
 =?utf-8?B?c1ZaQTFmOWFKRTVjc1M3SDkwWkR4cFJTR2ZFaCtQSnJTK2wxdGc1eEloN00v?=
 =?utf-8?Q?LlZjk3lLBBp7ibu4DwkRkK3ecetyhaj4vdcIg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB7051.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2lhK1RIcW1rUkhoTXE3b1NvWFd0eS95MkUzMkxjWlp4WmNla1FyTG1ybXFF?=
 =?utf-8?B?alRYV1U2cEFuWTRqWGQvTjRKczd4eGswYVJNZXRaL3ZDTFREK0FheDd1VWww?=
 =?utf-8?B?aFBMOGhMenVrTHJMYTZaL0VRQkRvSEl4ZUl3eWdpWVJCVExkcE13OVBsMlJk?=
 =?utf-8?B?c21PZnd0M3hMRGtvZzNsS0EzUml4RjJsSkpvTzREdGN2NWg1Q1pQU2VjVDFZ?=
 =?utf-8?B?eHo0bGlreGQ0cURsRUpiZlhwWWVwckNvRFliQ2FCbGs4bVI0bWVVMlFpVCt1?=
 =?utf-8?B?ek12c0g1a3BJYkFMbExnRkk4RXpvOWthMFlscStVckxFSFhnd2huMkpyV2Fi?=
 =?utf-8?B?MWIvT1NyNHBPT3V4ZTF3Y1YwbFJoWXIrN1YvdXUrVXh2SS9tQktSOHV5Vlkv?=
 =?utf-8?B?MG51cmxGb3d2dVFoai9mUkw4cVZ6Yk1EajM1c2xJQUE5QTMvcng4aVRhRDBx?=
 =?utf-8?B?MXY3NDZvOWVNZDFBeXErWUVtRGd2cWRWb3B2ZU1UV1B5WlBwQ283OGZYMzQ2?=
 =?utf-8?B?ODhOOWFPTnRvS1NWV1IxZDE2WXp2Z3pqY2dURVVBWC9EdlgxMDBabjBJNmxa?=
 =?utf-8?B?QXlOL3Z3VEc2aUpONFRYY0hnR3JJclNXQm5DdHNrRDRjdzcyWjd3Z1dFZHQ4?=
 =?utf-8?B?QnJkTndYUTFvSHZBY2RCcnNvcHVndzB2eFdOaWgwL2RBdXBnTUMrQ2JtQjNl?=
 =?utf-8?B?ejVqV1ZVd3RYNVZDRisyNXJsOUxNRUw4MWUzbW9rMHFmdTNGYmRyMlFLSDlB?=
 =?utf-8?B?NHdkcjUxWnkzZ3dsVnplbkRmU0oxditCYURBeEhOWGFteFJBUkt3WTV2QjRS?=
 =?utf-8?B?NmJEWTBOVy9NdzlOVkhJdGcybWpJUWQ4MjdtNHhwSzZSMWZUazNHVTNOaDdl?=
 =?utf-8?B?Qm5RemZwZUpvcWRKY29hRE1MNVhsMENOTy92MjhUQzkyQlVJdGVldmpqTmxZ?=
 =?utf-8?B?ZWZvNGJISnB0YUwveFhhdFc2Qk1uRWNGZG0wQ1ZQOUlwbUZhcWVMZ0xiK2VL?=
 =?utf-8?B?KzQzejNSZ2ZlR291eFYwcG9GS2ZuVzFwVVhra3FidXRqaVh6RHp5SUU2NG5K?=
 =?utf-8?B?cHlYTG5Dd21zeHl3djVsb21PeEZhUFJEUHFJQWQxZU9vMnlZL1B1QXJPc2pI?=
 =?utf-8?B?Y0kvbEhYV1E3a0U1SGNucm51QWJlc3RjQmdER0dwY285SkFXejNPZHZYMUJs?=
 =?utf-8?B?bjF4a2w3Z3J0TmNlYnYzUHg2NjlQZkFRaDkzWXQrL3FFNVp1VGh0d0laOVNv?=
 =?utf-8?B?T2Fpek1OakxwUHRzVVRsOUhxUlcvWmlZbmRPcndUWktsYzNkcTJVa0wvVUZl?=
 =?utf-8?B?aEdzcCtINC9ZUjQ1ekNGVjFRZjhwb0RUTUNVcWp1TXRPVjdrWjdCWXVtZ1NF?=
 =?utf-8?B?WVJYN2NpdmY0N0pvaTM5YXE5OU8xaktKempWSVBkOXIwdlYzM1Q0cHpzK2hr?=
 =?utf-8?B?NDN5cyswWm5nc0VyVW5LM2c1OFVnbkdJcG1yd2xSNmI4M1lKNlpSRGNUSzNH?=
 =?utf-8?B?TlMxaGZialJYQmk2dmhudEVDNHRnK0x0bjdBNmV5OTlmUVRFZ1lvdStzeTlP?=
 =?utf-8?B?ZGRRMldUcHV5ZExhVE1HT1NMck9FR2hoY3dFQ2IrZjliQ0s2Nzd2NUN1cDdr?=
 =?utf-8?B?UUR4Mmk4cUtFZlFOVnd0Vy82UEY3b1o3OTNCclNNVHdndFNGWVNTNlh3d091?=
 =?utf-8?B?MjB2MkJCbWEwNVBBSUozUUgyVXR6Y1lYZHVMcFFQbkNPN29RUGdncmozb1Vx?=
 =?utf-8?B?SnhkMFY4ZFZZK1lHNVluU25rZzJ5SHBMWTBydjFPdjRXYVpCcm1VWjF3Y0NL?=
 =?utf-8?B?bXJFQmxZTkFJdXVQanMzZFRGUDRWdWxLcW9GWXVtOFZxdWhOUHVncVdiNStY?=
 =?utf-8?B?bEUvS24yeFZ5U2FKNHlOQkpwckIrS0d4OHdhNERmWlBxV0VKNmF2SWtpSk5S?=
 =?utf-8?B?aHdCL0x0dThISEFFaDZrdjYxek8yM1ZCVGUwcVZTME03bXFDY0ExN1ZINXNX?=
 =?utf-8?B?NUNxQXhQa25uSGxMR2tXbFZtZzVGa04zTlhyQ2dZTG0xc2VNRWVDQ0UyS1Z3?=
 =?utf-8?B?NExHTDNjSHQ1MWNDTGhsSndWTlZrSlVZRkU5ODNodmNEVUZGWWdySk4xYnJt?=
 =?utf-8?Q?QAS8X+ofD5D9DT7VWByILkC4Y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d4c66f-0f3e-4540-3c99-08dd6c09bfa4
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7051.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 01:58:48.5607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6fsQdsVmtQ8Ia9tdQdAgYGpnyxbgccM8RblK4IDvDv5QX1Sp0uFAr863mSjB04ZoeTjrZqFhRnxVAy5m8Wp4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6890
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

On 03/25/2025, Charles Han wrote:
> Fix below inconsistent indenting smatch warning.
> smatch warnings:
> drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c:79 devm_imx_drm_legacy_bridge() warn: inconsistent indenting
> 
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

This was applied[1], as I mentioned in [2].

[1] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5f7a654b5ed2828e0da8e8331f236854c70f0893
[2] https://patchwork.freedesktop.org/patch/641089/?series=145843&rev=1

-- 
Regards,
Liu Ying
