Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5483CC11AE5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 23:26:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D61F10E55E;
	Mon, 27 Oct 2025 22:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="BsC1iFnH";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="BsC1iFnH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11023073.outbound.protection.outlook.com
 [52.101.83.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760B810E50C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:48:41 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WPZwC8TOOWUvCX5We/S+dRj+1HZwT5XP5uFpiGhdmShzRKcToOx/O0U1NFhfcE8v7n+nb09LUAXmnNjbPNTBOPJ6F3o3+NxX3XMIFYvYENhpj+j86b5WI8nj8lBFHPPhNK7IUqoP6iTGdQMpvOhZnrBLX8eiYvQZ4PVCj1UD8A2TFV2VlfT1wm24hI4WZgZio0cf6icvFG/0JmTKNti0jyRphg2x5RGI2OG6cpvcTsxE6i9AT9GKNWr2d4CG6xkSq9tRIGXzZO9FyJLmK9PCUkuZaKogK3PMsx3NaAam7sB/RABgK81pvt/MaHD+uyY9fLfNPLaEFNaL7oPYeLIp1w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sY53pG8wD8523Jwkjckr+a8Hu4VjZml6z24gpqIC+3A=;
 b=U/o6tFVEuKK+h8KicbpnjOt+q6DjiCavPnK6ZhD2QLnYCg+EYLl/eGtTqbzzmJPLKxouRxtvn1OPXglaR02dUYfSbWw7MfRPrDX0XkWpQbLKaI6Teu38WOTR815xO0cHNDFBtZxKg2JToa2+gm6lXWq/4L7zTDD+6/1tUN34+wp9uBtNR4wmuKVJcMKtq1zkuczKt1WgYk8gdpAZEpt02e5anUtd/YYDvSNTHroHqnsSDz6mptWwM812zWwBVq3tSxP1HQJ1b0PDg0qKNFpibmkLHuNEQt75nV8pIaeL9vYG07Ny72MP3vcsvpwzU8Ak12qa8hXKKEs9yU4DgdaJHw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sY53pG8wD8523Jwkjckr+a8Hu4VjZml6z24gpqIC+3A=;
 b=BsC1iFnHxMj2yiOgdobfpClJtDk/XMVdcUY7nukfn1a0jykThkiO3AereMdMPisoMpfXO6MiHa8A4baOovi2v7m2R42mC209mkmTt7H09hVwixfHlAr8i41JtZLX5zklQ1onVlZuMwc+4tfZ/5m+bJJkwXK75QorhDemg8xH3Lw=
Received: from AS4P191CA0025.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::15)
 by VI0PR04MB10709.eurprd04.prod.outlook.com (2603:10a6:800:262::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Mon, 27 Oct
 2025 17:48:36 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::98) by AS4P191CA0025.outlook.office365.com
 (2603:10a6:20b:5d9::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 17:48:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Mon, 27 Oct 2025 17:48:34 +0000
Received: from emails-4211842-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-121.eu-west-1.compute.internal [10.20.5.121])
 by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 5F6EA80297; Mon, 27 Oct 2025 17:48:34 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1761587314; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=sY53pG8wD8523Jwkjckr+a8Hu4VjZml6z24gpqIC+3A=;
 b=WtPdc+TYqeH1p/4hxyRKDnlUaEpx+J/+MamHAHpxrETYAWxpBtu/coljWaYWdL6mVP8Lc
 jK/A3BQfTL1RKsKnUP4nPvvlFY4zczj8/VQstQB0tZSF1twVhpZt9F4kACzcyMMOoCijzUD
 pRIMIH3oFid/M7A/F63kEoMoD7OKkZU=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1761587314;
 b=I2Bjr8IhfFMt88jp9n/eh9r388RlIpRQBZF3aWmv/IQ14aTMETMJgpvrfDFmd/TbFJQCR
 pVQsCBZ0wMnsYNuvcIL+Y3TMxsCG41UgGNxmklv4GEPo/Mx2tSnI50qt16b/ZYmkrssO5WA
 h41OUlqCUP8CIhSQLg0KKadUTryhWPw=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TOYlVIE5l5xG0joD3M3SRSPo3eqitKB7EvyBoKMXOpUm3WN02k1aPtzkBg0Fj/seEA1bGUkRWl94sHr54S0/AF4LUB63r+ov+eRUIC6iy0stJ4CiSHh+EKuE+om0l2uXYspEfwW+cQg1kfIrdfCghT77kH+o4yV/Z8nfGW4mvuafYLMp1zZibC9I51+YtFDLJqAkYMFYc5sOx6RZH0aBIr22NJjptN/b580cEzFIHJdFGVy4HBJ7f87+SVwp/7/X7GaqLq2zHERHidUwALlH2hk2nny9PeqYCl29iH1nCfaLewBu0dzN9RlJ8yc2Q+ryraYH8FYSprHCwJ2LCMpHaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sY53pG8wD8523Jwkjckr+a8Hu4VjZml6z24gpqIC+3A=;
 b=j8i8Nq12rgv9I+yEWO4vM+vy2VuAH4W/iP8FuuI2ZBnYa86u7NAdWME/jbcBY2kb0D3uKpnqkxKMfg07PXh4SxCvBbLZr0wMmIbZWQH0R5z7XSrSKeijSESRfAoJu9n1WA3hHoyECClbTzXATphg3Mr76rYrCWgEVw/muAAl/sXP+MIs2wqRK+19yKrr3g15pI+/vdEn07BkZ6SCElU46xUiI+E8SaAlBfji39yO2gglfgXcXBZSnIM25Rwbu9THJJ3f3rSKNWwKBYWlU+GjnwyRAMVTmYIcOP/1UWWSL9aq7x1Kl1vlAz4w4W5GT5IHDOv3AeyB3IEvg8FFlqKgWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sY53pG8wD8523Jwkjckr+a8Hu4VjZml6z24gpqIC+3A=;
 b=BsC1iFnHxMj2yiOgdobfpClJtDk/XMVdcUY7nukfn1a0jykThkiO3AereMdMPisoMpfXO6MiHa8A4baOovi2v7m2R42mC209mkmTt7H09hVwixfHlAr8i41JtZLX5zklQ1onVlZuMwc+4tfZ/5m+bJJkwXK75QorhDemg8xH3Lw=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DBAPR04MB7365.eurprd04.prod.outlook.com (2603:10a6:10:1a2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 27 Oct
 2025 17:48:19 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:48:19 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 27 Oct 2025 18:48:12 +0100
Subject: [PATCH 03/10] Input: ilitek_ts_i2c: fix warning with gpio
 controllers that sleep
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-imx8mp-hb-iiot-v1-3-683f86357818@solid-run.com>
References: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
In-Reply-To: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::15) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|DBAPR04MB7365:EE_|AMS0EPF000001A2:EE_|VI0PR04MB10709:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fb5ae5b-fb68-4c0a-2445-08de15810d16
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|52116014|376014|366016|7416014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?MUkyK0c4R2FYVHdzcjEwNWlsYm5jak9mZ3phRlpCSTh4SVZaU043ZVowZU1B?=
 =?utf-8?B?YkYvbFlGcXdjSFpYSm1tRVRQWHhFOU9qSEt3WTBROWlKM095d0g2bEFGNHpX?=
 =?utf-8?B?aGhwUFI1cTBRR3A4ZDEwaGIzK3ZSdHRzaFpJazgxQjEwenlVcFJuLzdmNGJ5?=
 =?utf-8?B?MVV3ZXgycFBhVTFlYWFxeldVSTlwRzBKOCttTFAxVDc1c3F6Z3RoYkt5Znh3?=
 =?utf-8?B?OS90RmhRRXkzMndEMmFHQkpCNHRDTFNGZSszQ1JzdnYvNU0vdFZrNVIvbDVq?=
 =?utf-8?B?L0V5T3p6VnNVajNidTV2S2JTZytSTTBaKzFYRGgyQUZZR1VQcWFLbHVsUXBP?=
 =?utf-8?B?Y2hEOWRTSjhkM09aRnlIbklDUHhkMG04Uk1ZeGZhcHYrV1NlYmp2TjRkR21Y?=
 =?utf-8?B?dVg4Y1VIajBocWozcVd3Q2pTNFhwVCs4Z2lTWnduaUJTc0Vlc0hWVU5FemF2?=
 =?utf-8?B?UXU1MjQ2S2xjb3d3UHlIM2VONGtaQm8xekpYdEx5N1NCUjRSVUJGOFVUeTFW?=
 =?utf-8?B?M1kzdXNtb3FldVpwVWlBaktiSXB3YzdpcGoya3NOazZLanF1U2QvT01QdGtw?=
 =?utf-8?B?djZwbndrUjZFbHpSajBMbjMyVmZaREZLdi9DVkFwUVlRb2plSzlma2pWK1oz?=
 =?utf-8?B?QmJHWHdheW8wMTBITWc1RkZrekpxTUZGRWFXbUNQTkkrNkxuMGVEVDg4U0hQ?=
 =?utf-8?B?ZzB5d01WQnptQVN4ZzEvTi9rb1hVS3BVN1I1cWQ4YkZxSjNaeVUxb0xoVHNE?=
 =?utf-8?B?bWZmclNjaWZsb29saFZzc2hKNGVQMHI1aDJoU1RvUVBLT29vRlFJcDRaSFFS?=
 =?utf-8?B?cnZ0QlNXMUpiU2dydHhMUk1TWXFGMGpoYmEySGUrS1FoS3Z6SjE1VHZrazVF?=
 =?utf-8?B?TmFGODl5Z1ZkYTNSeXphNnpXeTFUTUU3TnovWWZ1RXkzVWsxaDJGa3RLcTZC?=
 =?utf-8?B?L0dhTlRPNGQxOGtDdy9nQjE2YVNzNU12eEViQVJNOTRvendDaml1WjRyc2Ry?=
 =?utf-8?B?VldFLzhkb0RWSEtEVHBEUDhSRFVHbTdEcUpmdm16TGp4M3ZBWndlalEyVmZ5?=
 =?utf-8?B?SGdxWGNuUUVCYWF3TkgzNE9XN1BCMkwxcWo2VlMzaWsxSVpXUVFlZ0V3RWVr?=
 =?utf-8?B?UHVaUlg3Q2dTMncwZUEwbE9zTldPTVppNXdoMHZHcEY3YzgrUHlQMlorY3U3?=
 =?utf-8?B?dkJoREtqSy9EU3ZzZ0poMEdkNUZaU29aU1pZSmtzVFpiL0taK1JKRkRMNzV1?=
 =?utf-8?B?WnByR0crVUlLbXExLy9UVURFeXBzTU94Tkl2YXRMRHBsbjJGZHBMNmsvNzFK?=
 =?utf-8?B?eFhlN2xSUWFoTkIzdnFjZTNlRERoSTZhYTRiUDlBSFRnWUlpemZ0K0dGYmNR?=
 =?utf-8?B?RTFDL0NWb0ptUDBhUDNkTlpvNS83R2M3YjhObXhJQXUzbEpGbUxtTUlWazhh?=
 =?utf-8?B?alRtL1owRDhrb1BjaUFheERrY0NGWVBjcndyUUlEckV3cDZLRHB6LzBhQ2pG?=
 =?utf-8?B?ZERlcXBZb3lYOVhFZXJKYjRlM2VSYVRDZnNpQlZHT0RwQ0NRQzBxNURleVlD?=
 =?utf-8?B?bE9VbkVrb0M2VW0zL2Z4c25oRzRwKzBSLzVEVExVMFl4UEVYeWFEdUpkRFJZ?=
 =?utf-8?B?LzN3RndDYXRHUWNMUEVjUnNCL0trNW80WFZ2OU13SFV5M2wvT2xsSUhhSnpI?=
 =?utf-8?B?TFhaVnhMV3dGdmJaMlZDRk1pZGhUVFlvVFNHWjVzbVlNbWJWSlJxdnpGb1I4?=
 =?utf-8?B?YXJxK2gvWWYxU0haUGdNRWlDRG9lRFpnRjR3bExmMi9tckt6UzUyQUhOWWFR?=
 =?utf-8?B?ZHdBRmloVHU3NEpFdVl3ZmorZFRmckhac21vdlJGWk02dVRyRlVHNHFHaFdy?=
 =?utf-8?B?SzI2VWxXRFRqMmNJVjdlR0E1ajloS2hYSkhybVhyWW1nZWduQ0RhNnhWYmQw?=
 =?utf-8?B?QS80OEptaXNrbmxrYlFyR3dSMU9LL3JtVjMxQzZsUWQ4dUhJTVZzc1dsb295?=
 =?utf-8?B?VUxxN01PeTVTT3JhcDgySjV6VkRUWGptK1pST2x2NWpCc29Cc0JOckhFUk5G?=
 =?utf-8?B?YmtGdTY1M1N2ZGcyNnh1T0VqVkdYbEVuVi83UT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(7416014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7365
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: d90fd5d3cd0646aeb72b46f8cecfdb55:solidrun,
 office365_emails, sent, inline:debd18510902b80412e2749450943e78
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4fa28649-8742-4815-24af-08de15810426
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|1800799024|35042699022|36860700013|14060799003|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXVnK2VQQyt6VCtlNTNhdDMxZDZaeGd3U2dpUXBGSkc2NkpBYzV3MTlNbXRT?=
 =?utf-8?B?Qm4vTjdlY0I5Q0VWeTcyZHVnZnlGYmRzcklzTkQ5dElQNTloMENYdDBOV2la?=
 =?utf-8?B?RGxISDdLeFlhY0RzaFdqdDNzL2w5dkgyOXo3bVBPbW8xTkN2alM5Y0pkdnJm?=
 =?utf-8?B?YmRsSEVUbGpjOXpuSVRMNFhnMkdMYWJsQXIvMDBOY2pmTTVCSkNiaE5tRG43?=
 =?utf-8?B?UEoyc2h2aXpHTndUL2xVL0pVUUlCNUdmRWFpSEdCTDByWGJldEpYQVRyYUxj?=
 =?utf-8?B?MTcrYWEyMGdhb214dWxMRHJoVStGb1NzK3p5d3h1K0VJRWZ5azVLaVAxOUJv?=
 =?utf-8?B?bW45dW5peWFyanRtYlJqeUZCTjJmV2VDQTN1NVNGeDMxcXl4T2wzKzk0eFFK?=
 =?utf-8?B?MloyQUtpZXpzQXJNK1JkWDMvV2V2UGFyNHM4cjhMbmsrcmQyVEZiSksxKzcr?=
 =?utf-8?B?WlJhaWhCWERRTnFxY21wMHJ0Q3ZGL0s1YTczYXIybG5Vd2tHUjdrMmlCTFhu?=
 =?utf-8?B?TDNBaGxkUm9DY0ZTcEcrN0QrMGRoSnM3aXMveXRuNy90WVdzbHhLeGNlZTQv?=
 =?utf-8?B?MHBhQmp5Y0tCL3ZncVEzME5hTEdyemR2aVdrMHpHMDVyTnhPNzYxd0lTZUcx?=
 =?utf-8?B?RTNiQUhXcTBQMU5RV3BVOWtTNmR3RTRhM3RMclBBWXhKdVJYeFVlZ29WQUFX?=
 =?utf-8?B?MWhNcTBONmVOME93b1dTYTRZeHIzbmREQ05LcGdkam8yT2ZDWUdHb2Qzalo1?=
 =?utf-8?B?VXdFdDZ1bEkrZG1XNU1rNndOaFNnQ216cTFTY1pqRmgrVXRvaEFabnpYZXlh?=
 =?utf-8?B?NHhESzc1TlhRckJrUmFBbXNhWDB4Yk9IcGtMdTM1QTdqdWZtNVJrU29hc1hX?=
 =?utf-8?B?MTE3d1dRVllnN2oyVm9VVEhnVmRISWorTFJ1Ukl0WjEvUDZidUc4Q3JEQWl1?=
 =?utf-8?B?NEhlZlZYZUhBa2VOekY4TEZZaEZ6RWc3Z0wxeHdrbWxzb3Nkakh0azdRMkJS?=
 =?utf-8?B?MUs2ZXg3ZTJEVlZ1WS90eWdKRktGcVRPT1krZG0rbjExcGFybVdzWS9IR2Yr?=
 =?utf-8?B?bGNzendOTDBwRmh3bHZJakNoRDBYeHN3YVF4RnAvYThsNWFyU0pjd0NjRk1E?=
 =?utf-8?B?WGM3ZklGdEJpM1lJaFNWVU5VWFczU2NETzlLQ0czc3BaRzUwRVZHMkdNdFp0?=
 =?utf-8?B?Z1ZCRCtYUCtGUW10a2RuZ3V0cytNR05FMURVVXZGTnJvSDhaMjV6UzdqRVBV?=
 =?utf-8?B?L1pZT3FIZG02dVVaRUtKaDBIcmUzVVYwa2Jzd0N5MGc1dFlzTERoQ1hxb1Rr?=
 =?utf-8?B?Z0xOVmFHYlAzeTVLaC95d3dJcDhsV3c2cTV6bE5GZFdRaGRVd3NxVlZTcEFO?=
 =?utf-8?B?RkN4VlNWMXczOERQNjV2NW5aWUdkUUVUeVdWVGJ6aTF4ZHpJakg1a1VkZnhz?=
 =?utf-8?B?cEMyZlB2Sm9GcHp4UnQrL3RDejYrWEgxOGpESjh1bWNHTUVmS3hSTVB3c21V?=
 =?utf-8?B?aDJDbCtzVktlQ1g3MFYvNm5tamhSYTJuY2NwcGFHY1hvNlg2Ym54WEZ5MG1y?=
 =?utf-8?B?YVVISG1WS3ljZFE2dzkxeWhlUzBPdDJ5RCsxNWthSXhpN1JwQTg1dW83TEto?=
 =?utf-8?B?VFZZU1B1R1QxQ2tBYnBvNjJiNW9tYnJYQlplclAwTlV1RkNDemo4dFFWS1dm?=
 =?utf-8?B?NFZYeEFtKytGSGN5K1hqdFk1Skl1L1hhNEJwK25QRWY1eDQxUTh2T0oxRjlW?=
 =?utf-8?B?VmIvaGF6ZWVjQXJVRTgxbEczZys5NUk3RXZUdnNYVDd6cmw5SFl0RDVRcnND?=
 =?utf-8?B?NHYyNExJbnFndGlpY21TOU1uTUxYK09FUVNyeTRUV0ljTnIzWkV4MEVPalF6?=
 =?utf-8?B?eW0yQ204M05BbndsT3g1QXFxQjNjMlpPRVd2NDhvdUhmYjVDU0x6dlB4OHhT?=
 =?utf-8?B?OFBsMHI3cEZaaEdhWG9LY2lyRXVQTnRiWmliK2hhN3RCYUUwaFlOdWp5TDFF?=
 =?utf-8?B?V0ViQU1Gc05mWkxFVUZtRkR5RGlIR1hLSlRQSTZ1QzdIdS9kTVd1SXI2QUwv?=
 =?utf-8?B?N05QU3RhY2lOT01CT2VxTE10bUtlWkJWeHRXbXQxOWNhV3VDWjhyUmh1dUhF?=
 =?utf-8?Q?bGTY59Z078mEfTVDGJlpqadLj?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(35042699022)(36860700013)(14060799003)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:48:34.6848 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb5ae5b-fb68-4c0a-2445-08de15810d16
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10709
X-Mailman-Approved-At: Mon, 27 Oct 2025 22:26:30 +0000
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

The ilitek touchscreen driver uses the non-sleeping gpiod_set_value
function for reset.

When the connected gpio controller needs to sleep as is common for i2c
based expanders, this causes noisy complaints in kernel log.

Reset is not time-critical, switch to the gpiod_set_value_cansleep
variant.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/input/touchscreen/ilitek_ts_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
index 0dd632724a003..8c5a54b336816 100644
--- a/drivers/input/touchscreen/ilitek_ts_i2c.c
+++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
@@ -396,9 +396,9 @@ static const struct ilitek_protocol_map ptl_func_map[] = {
 static void ilitek_reset(struct ilitek_ts_data *ts, int delay)
 {
 	if (ts->reset_gpio) {
-		gpiod_set_value(ts->reset_gpio, 1);
+		gpiod_set_value_cansleep(ts->reset_gpio, 1);
 		mdelay(10);
-		gpiod_set_value(ts->reset_gpio, 0);
+		gpiod_set_value_cansleep(ts->reset_gpio, 0);
 		mdelay(delay);
 	}
 }

-- 
2.51.0

