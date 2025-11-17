Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C684FC640BE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 13:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3BC10E3AF;
	Mon, 17 Nov 2025 12:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="CmohVWM5";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="CmohVWM5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11021080.outbound.protection.outlook.com [52.101.65.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F9910E35F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:29:44 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DGO9hX9krY8mhQnVGgJgE480M8998eoOT94p+GLoDlU9gqeSkQtCcobwH3Mc/zpJxlZEeFeVoyDYh3ZUZpXKdTHlmuqCCctkaGoR9dZ+vVxztvyJVswVaL1K+xIurndsbu804S96QkrTGPh0+hqg5ZeT6SjsSwy1zE5gQ/qPEDTbnfjFGn1BKZWE2n1FAcWEkfYD/Rai6SnMmK225z/lSXFewOTe+kO+ZKm5RvS+9MIeK5mP8MupkCHz3Uim5qPsFOPqh7y5IlEbLnVr2BijOEzWnYKpNni8UL99icWF0nhaZK8a9Y20K5OzaIPb4CTL+aWSdwAjEQY3q4A92gW7hg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2D+Y40ylXIIqWy1ZFDjZkfoLG/wxwceSle4+LK7rK0=;
 b=wE78l0igwUhDoL59WGuDITDQweiYs0SZV8wHvIDEtGVMrF7PhpNfcArlQKaa5yMRDu5JRUxg7Pv1h7p6ts84oknynFlNYDZIVUeXFev1C49xA5jXcGq3PYdhVqQC972R7THjGm7YUjQvawD5pOIiJgcO8m9Ap0MhZvWZup8y598MfpRsz0UU8WGwaoS9UtEI717nHHjHFUjihWERwkG6DU2SBklZBxjSRyQwGcS2fwrru1DTL/r484ATJvHbJXbIq9RppB4AwddUVecswL4g9J7jadV3/jjYEoEjXWWUBmb0e88FnNTQP0/kVzxIdhuShkMPcNE4EckKsj2jlWx+Yw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2D+Y40ylXIIqWy1ZFDjZkfoLG/wxwceSle4+LK7rK0=;
 b=CmohVWM5/5ChQsRH+Ao0Z5VcOx1qM0lz3OgNoXjY5VlZcnf7eDtiLZWJRVCI5P+oV2fJ9KH8mLtZwN6rOQpywm54QBc08Ua3p1VbI/zAkGS/eJszAWPvEPPIpVYV90aUOZsmkc4HEVVeJgRo/1cU5CkBj8zrENw+pq3fL9Nz93U=
Received: from AS4P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5d6::18)
 by AS8PR04MB8151.eurprd04.prod.outlook.com (2603:10a6:20b:3f3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 17 Nov
 2025 12:29:41 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d6:cafe::16) by AS4P195CA0016.outlook.office365.com
 (2603:10a6:20b:5d6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 12:29:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Mon, 17 Nov 2025 12:29:41 +0000
Received: from emails-8830342-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-219.eu-west-1.compute.internal [10.20.5.219])
 by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id DE9FE800DE; Mon, 17 Nov 2025 12:29:40 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1763382580; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=D2D+Y40ylXIIqWy1ZFDjZkfoLG/wxwceSle4+LK7rK0=;
 b=CMhmLaJzhfbWz2zsAM9ix5vS4PNOrJU8cbv+4IMb6+fERy7yJPBuT1J2XVLGwO3aMP7DV
 D/e2vVy6nUnb7ZTo+Ocp6QqwhWudsJ9+u1oaZwt6sPxHKDv5gTu6/GoMAvxaKPVqWgPCRRY
 u6A33c87MeBfi1W+tKQgI3pZ2sWPJEg=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1763382580;
 b=JtAbf/ipTIf1+ii9p4rwzcDctWqfwEKz/JBFJWNbmQaEkHGzsQ8DnVF4bYrKEQOjm1pCq
 /RDkhpPP/gYeSYrDE68H5lbMvRJs8inC5fRfzNWrpKMJyITEVlmmSZojknc08fKR1HGGe80
 ODCmDILzMAo2X7jkFp48fx+hcrNZCvM=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVPveiY6XeEah9C8nU9mjdp9oRPjMPs4FEQY/OyVUSoa4U2W7tXZuYmfGKnkQl1CDp1WpGF+kN5m2MLkQ/+ydrR3joXcb+UInEATUEoL5uW08mVZ1zHMrPuaHUJLAqrAhQldPts6Qnw3J8vuiHbXY9FqHNczV1HMl6DatJkWF/wUtyX9ri2Gm/3qBom2kOXl4d9CC5kwCqnL1ZpNm0ooe53ICsEJalXZe6vejlzB6YoNPpy/1sl3rlx5HtC6FEe765RXqxI69epI4lWady1VsmEvYvGQ7i8R/k1kACNUeYxTVjMYTwy6h/6POzwo6snnrMoyeHsk+j6IX8dRVdTBGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2D+Y40ylXIIqWy1ZFDjZkfoLG/wxwceSle4+LK7rK0=;
 b=mduqhZpS528XiBlRXhPjo2DZWr3LIqEapTaAR4uuT3LY60n+/o8DqWNIq7hiFpXPhCRrpwlYzMydjuSgLE2C9UyXr7LvgLykZtdRVzVihwnD9jA+eV4T09JBmI5IAe2ZbjrqjIe6T8JioUMQYPLvNiQ/tJkmTandck/m+4f/FDQd2Bo6ZkoByA/B0rfbGnQeq2c3NYYSpqWdCOEJsAwgWj6fLt+fm9gCTDG+jeoktZXZl7MwYgv7jGsK0uUI4qDTm74vXgrnKzTQEGSLGUc1Mjut09cyIP6BlX06o9593qX8BGOjfmcFFL96Q6uZhXKVtpmmvtsBPVgpHQGfrXiDmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2D+Y40ylXIIqWy1ZFDjZkfoLG/wxwceSle4+LK7rK0=;
 b=CmohVWM5/5ChQsRH+Ao0Z5VcOx1qM0lz3OgNoXjY5VlZcnf7eDtiLZWJRVCI5P+oV2fJ9KH8mLtZwN6rOQpywm54QBc08Ua3p1VbI/zAkGS/eJszAWPvEPPIpVYV90aUOZsmkc4HEVVeJgRo/1cU5CkBj8zrENw+pq3fL9Nz93U=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PA1PR04MB11261.eurprd04.prod.outlook.com (2603:10a6:102:4eb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 12:29:28 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 12:29:28 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 17 Nov 2025 13:28:49 +0100
Subject: [PATCH v3 07/11] arm64: dts: imx8mp-hummingboard-pulse: fix
 mini-hdmi dsi port reference
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-imx8mp-hb-iiot-v3-7-bf1a4cf5fa8e@solid-run.com>
References: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
In-Reply-To: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
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
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0350.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::12) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|PA1PR04MB11261:EE_|AM3PEPF00009B9B:EE_|AS8PR04MB8151:EE_
X-MS-Office365-Filtering-Correlation-Id: bc0756dc-a2b4-43e9-e4f2-08de25d4fb47
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?a1QxcWVKMERzQVFqV203ZWIrcDUvUzAyaXZkckJsV1ZQalV6NGwzbnRzU3Vl?=
 =?utf-8?B?SktWMkJlSm1PUWxYQy9Ca2lnVFhHZ3NNUEpEanFRdmZSWHJ4d0J0citoMmds?=
 =?utf-8?B?UGtTWFZtZzNKeDd4S2EvZ3MzOWd0S1RjUzRVazVxK1g2anpwMkFLYWxCcjNI?=
 =?utf-8?B?SXpIYnp5S3Z6UDc3OXBkcVU3dFU0eHJISXhRUkt4bXhGaXQ1a2cxQjNpSTFF?=
 =?utf-8?B?WTRMK0UwNnVEdGQ2cC8rSWhEdlZIckh3ZXhveFRuNmo0ZzFzOVdTVXQ4aytP?=
 =?utf-8?B?SEhOMmZtWEJtcnZwWUlOeGpyMU9hNFZKSmt3dHRVQ3hUcjNqODJIQk15bTI2?=
 =?utf-8?B?VldjMTNDV0hwZDdNT24xM2tWRFBuUGRQQ2plcnNUaEZqdG96OFpZb1dPd3Fk?=
 =?utf-8?B?dHpTcktaRHE2UU5xb0ExZlNqOXFGQ2creDRjVUVid3hQOXVhczU1YktURTdm?=
 =?utf-8?B?aVd4aWRmRi83eENrU1kxaUVYbkxQMGpkR285ODZOQlNqc01xR2UwcDhibEFS?=
 =?utf-8?B?U1NiNldKaHI4c21mcVZHTzFMNWE0SEpteVoydnE2UldGcXdFOWxqMVBMNHY2?=
 =?utf-8?B?RFY5dkpyK3BGZGVGNTE1MGlURnlmejJvcVdxVXFiVjRFeHlmaStOOWRweXVz?=
 =?utf-8?B?cWpqS3llQ0xqb2Y5dTFoUHFvWHNydGhBN1h3VkJDWHYyNEZEc3d6K3Zua0l5?=
 =?utf-8?B?YU0ySFRJNHdvVGxNdU9ndHF2YkVYdFVKeUVnb1JQZUtVUDlkY2FHS0VSMllH?=
 =?utf-8?B?V0paa0o5TWtOU3AvUjB4aEhLcVZ1T0VYMVYyN0NtbzhkcXZEWUYxQWluS2xI?=
 =?utf-8?B?S1JTN3RYbVV1RGNGdmRwTGNxeUhMOVNOSG9RUFlWcGZHb2tVYmtycmJJUEpa?=
 =?utf-8?B?UEhxRnYwbU9YVUU1YUw4T0xDNS9LMzdVejZSUVB5YVJ6cCt2UEFacTZRTzEx?=
 =?utf-8?B?Vnl5dEw4WHJaRFlIenQvUGtpWFRVWG0zR3hBdkltVjMzUncrQ1dZa2VjVndo?=
 =?utf-8?B?ZTM5alE0WU9OM3Y0bkM1QjkzdzZGcnRjSzRLek83Rk5GVlBIMmJYVjJGaE56?=
 =?utf-8?B?dDI5a3NrbldwdXRVVzZqZzJEV3NYQUh1MkhhN1JqQ2xRN2ZhR253RW83ZzQ0?=
 =?utf-8?B?REM0TjBCYjlranBYVmsvWWdQVGpmdEtXTVV5Qkw2VnlTNzBPV1p3QXpIenJQ?=
 =?utf-8?B?RXNmMU55OEhtWFkyOC9COC9DR0ZveGl1RjJkalhXbDNlcy9pT3ViSmVkNmVk?=
 =?utf-8?B?OW9OZHp2bjNkV3M2UGwxak5uekQvQUs2UUZ5cVlvTEphN3I4RG0xNGg4aE1R?=
 =?utf-8?B?TnhzWDNOdXZYYzhSNWZhYUZ1RHdraWFob1FHdzRFc2dmb0xzYkN1YVNBa2VH?=
 =?utf-8?B?RnptYlF3ZlVjUHF4eW54MXZWaVFEQ2EwcyswQnZ4OW9iUFBuQ3o5Q1A1TUg0?=
 =?utf-8?B?amdOVU51NVJyNFBnUkgyeXJyLy9XVkFuODhnaGNacFV1NVcvU25mT3B5QTlk?=
 =?utf-8?B?SVdGbXNKOEpHQTZwVDUvcjNkbzdoMUJzM1hyY2xieVYxcnJkc0RFSStaNWQ5?=
 =?utf-8?B?a2JXNWNpSTNuOVRUUUt1M1hHazRGVVZFSXBQd1VheEZ2aXM5UmRmTStyTzNE?=
 =?utf-8?B?TjhIT2dVRWdvNXFqQ2RCY1JKZlVLanFXUzcyanB2NHFxcTZWQXJJeEU4YlNK?=
 =?utf-8?B?bGZzWjN5Qmc1aUkzM1NVNGZSRG9McitNSEdqUXJTZS9XTGJaWnd0aTQxR0Y3?=
 =?utf-8?B?Rnl3NEJFZzl5eVQwWDd1QTJmdy9vam9NZmc3czBsWDAyRWRMU3RMSE9BQnN6?=
 =?utf-8?B?aCsxdSttUW9sdGFnMi8yZzlKL0FrMTQ4SkpJREVDUlVaK3NpemgvcmZsbERz?=
 =?utf-8?B?SzFGWFVMdThrSEx5Smh5TEVPUmRYK1NvMFRkNjJnWkdVdlNiS0dMTjZJNFVr?=
 =?utf-8?B?dFV3bVVaZHVLSE13UXRxSjZsckJaanN5ZHF5cDJiOVJGWmFPdUJKV0ZrN2VW?=
 =?utf-8?B?MUtjNmJvSk14VElKeFpaVjFLSHN4dTNlaFZFNkJmdkRpRFg2Uk9RSVdDTmlD?=
 =?utf-8?B?N2pUUjFHa1RQTk5sUmdBQklXS2NUVDU0WXVxQT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11261
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: c1d0398d017a4a3b95bab4761ba1c241:solidrun,
 office365_emails, sent, inline:e63acf9d0091647e1c4ec6a3b065751e
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 649c2892-7302-4cf1-31b4-08de25d4f355
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|82310400026|36860700013|376014|7416014|1800799024|14060799003|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFZyS1piMVRYYkRsdm1ieHZROFprdEpxQ1N0TnhQbUNodm1FeEJoaTNUV1l0?=
 =?utf-8?B?SjlkR2tSS2RaRmpjSVBibzBOUm9nMVJFYnMxQWFSMmNDK2FmMXRmcGNZNjUv?=
 =?utf-8?B?S2dUWGIzTlBZOGI0V29TOGIvQjZ3bTNQaGxHVUJZMzNycE1DbUxhWElUcjNE?=
 =?utf-8?B?ZDFRSnhDbDA4QXhsT1piQnVIWEMrSTBINXI0eWpkQWsyelNYbXBOdmw1ZTlM?=
 =?utf-8?B?R1lWR0RPbnpwL3Q0SUFnNGpNd1A5V3dsSGxlcHRlMnFJRlBYZlRib2phUk5F?=
 =?utf-8?B?Rjh2UXR5TGtEeEM2UVI5S0J5OUhXS0JkNmswbWNJbktEZWFmY1I0ZDM2Yjdo?=
 =?utf-8?B?UlY4VUttRUEyTGlCc2ZUVUo1dUZmS2tGZyt3bHREVnBOcUJZRXRTT2dnVkxs?=
 =?utf-8?B?a3FieHc4eStzU0NvNk1yUUNVSTNWM2IxbUxDaDBhNVRtdk9VUFFuZDZuV0l4?=
 =?utf-8?B?Y25CYXRvQlAzeHJEVDJoME80WTYzRVk2SmpPV0IrRG9WZ2tSNmtieVZXUVhZ?=
 =?utf-8?B?UEdweG1ac2JnMWtPUXBZYzNJVmNzZkxLb1ZDM0tkVjJ0ZVVKYm9Vazc2ZnFR?=
 =?utf-8?B?NWJyQUkxKzVVZHpHTXpjcHdUT2xldGhnWVdpbHNHTGNDcnkxM0t4blJreEg0?=
 =?utf-8?B?VG55UFV3Ui9McWM3dHRHMlV6S1N1Y3FCWnl2UU8zNnFEZzdaRHBPVTZ5UUla?=
 =?utf-8?B?ZzlFM21WamdvSncycFhhUVNGSHdzTDBITi9NWWcwSk43ekQ1bStIQUlzMVAv?=
 =?utf-8?B?VURSWTVRY3hBeGdLVHNRSVFyWTZLNWlBbGZHdTF2OVR5Y0JjSlN2N1RwZFZZ?=
 =?utf-8?B?QmRkeklWTGR5V0VYMmw5S2dnNXgyMytzZWVKZHRaYXUwb3U0dFlpSDhLbjhB?=
 =?utf-8?B?OE1wVTZROXkweVdrQWRWNGpkK1hWVzBJRk4rczRxYnA0OGV3bkVaT0UvaSs3?=
 =?utf-8?B?R1FwZC9ZcytwL2hUZDJ1UlNpMXZqdm5aS0pma3B5TFM1VU1MVUxQWGNadkVU?=
 =?utf-8?B?L3R1L0h0dlJRc3QwUlFGRUhKR09KRmk1T1JQY2NvdVcrN0JKbjFHSnlxMDRp?=
 =?utf-8?B?TW16R1NxR1VxR2tiRkV3YWxnTHFmN1JMVktSUUY5clg5Y0IxcEx2TW5lajJH?=
 =?utf-8?B?TVN3L0IwTnMvVzMvb3FXTi82bHlkMFRMa1J5NWtJN2tHSmRqWHRYQkhFN1Yw?=
 =?utf-8?B?VEg5eUM2VENqY2pzd29qUjMrbHRTV2VybGJ1VFFRK2xJMGdsQ2hnR1FnMHg3?=
 =?utf-8?B?MitvVW1rL25RTDUzVjlHS050bDJVMmJxbWhQTGxJOHo5TWhZSzlUSS90SE5T?=
 =?utf-8?B?M2J0N3JvQWtsM2phK3VzUnNUa0pPTVQvYk9YYktob3I0dnY1RUZkUFREblZo?=
 =?utf-8?B?cmFFaW1VN1JTK0Q3UC9CN256Z2NyVnk3ZFZwV2k2WXkwTy9rVkt0KzBua3hi?=
 =?utf-8?B?aS81cGRXSEh5em95OVQrMVZTNEVIR3cwNVl1cjEvbjVvblZya24yWmR5VVdR?=
 =?utf-8?B?UVZRMTIwcDFkV2d6S1ByU3NFbit3YVlKZzMzWnI0SjYyQWlaR0lsWm5IdDYy?=
 =?utf-8?B?Q25hbnlKWTV3RW1ZaVVndUV0VUdXYld1bDd6Ukx4K01oNWVZZXBqa0VGZllF?=
 =?utf-8?B?Z0FJa3N3UmxYUW9Ed2gvZXZiS0xKV05WdlNFMU5zOG4vYkNNSlNMNStseWlv?=
 =?utf-8?B?VkhmYUtQdDJibUNtYWJLYVNnb0hpZXprcE42T08xZERGVmxmck9JTkpjTlRU?=
 =?utf-8?B?VjZTS2NXTEQveks1KzY1a3owU2pNVi9vSUs1V1psQWJ0RlhPQ1VLZWR0S1E4?=
 =?utf-8?B?UzZ2cXovOTROd0IwRUtmM1NRb3dOV3dzcUs3bmhOaHZSd24rNy9XYStlTmlv?=
 =?utf-8?B?YWJybHl4UUhqck54ZjVQNVpaeStxN0dvV0QxcWt5SU1mYmhXa0FxekxRQkxp?=
 =?utf-8?B?TlRtdnRvQUZzb2gvN2diOGpvQ1JVNXB4MWJpd0tpdG9jbkMyWDFydTR0dUNC?=
 =?utf-8?B?N1gyeFFHTnFMMEorWncrak5oaHkwYWQvNDR5aTVGVUdxSVltU0FWTUZUeTRO?=
 =?utf-8?B?Y043T1ZKTGNwZmhlVi9VQXhybDdKYllJTnJwSVVkdXhOTnNjdnF4cEt6OGx3?=
 =?utf-8?Q?+KhbK6zb9Uq1MT7dhY1EiEFRo?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(35042699022)(82310400026)(36860700013)(376014)(7416014)(1800799024)(14060799003)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 12:29:41.1384 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0756dc-a2b4-43e9-e4f2-08de25d4fb47
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8151
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

imx8mp.dtsi includes a default port@1 node with an empty placeholder
endpoint intended for linking to a dsi bridge or panel.
HummingBoard Pulse mini-hdmi dtsi added and linked hdmi brodge to yet
another endpoint.

This duplicate endpoint can cause dsi_attach to fail.

Remove the duplicate node and link to the one defined in soc dtsi.
Further remove the unnecessary attach-bridge property.

Fixes: 2a222aa2bee9 ("arm64: dts: add description for solidrun imx8mp hummingboard variants")
Signed-off-by Josua Mayer <josua@solid-run.com>
---
 .../dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi    | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
index 46916ddc05335..0e5f4607c7c1b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
@@ -41,7 +41,7 @@ port@0 {
 				reg = <0>;
 
 				adv7535_from_dsim: endpoint {
-					remote-endpoint = <&dsim_to_adv7535>;
+					remote-endpoint = <&mipi_dsi_out>;
 				};
 			};
 
@@ -71,11 +71,8 @@ &lcdif1 {
 &mipi_dsi {
 	samsung,esc-clock-frequency = <10000000>;
 	status = "okay";
+};
 
-	port@1 {
-		dsim_to_adv7535: endpoint {
-			remote-endpoint = <&adv7535_from_dsim>;
-			attach-bridge;
-		};
-	};
+&mipi_dsi_out {
+	remote-endpoint = <&adv7535_from_dsim>;
 };

-- 
2.51.0

