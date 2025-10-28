Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B30C1482B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 13:03:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3596610E0A9;
	Tue, 28 Oct 2025 12:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="pFAYtsiP";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="pFAYtsiP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11023076.outbound.protection.outlook.com [40.107.159.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAEE10E0A9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 12:03:51 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rB3xeWpderCv0G+jUoER5+NAvUs5tGM0YBf5ABXGaIFGYnFyXnZUaxFwoClW7ZmU98wK8dDnHG4tnFtOeosc5Fui4x9Uyaux2CdqwZfxRu6wT2Yz8jnVcAX5VsV6S5F7D5mjJn2tp76cGJ2ayLiwAEDEHsuCKsfIzlFUivopY1V5/aLeLLmiYkEpNlkwZ1ftIWWY1Lmbcj02rWnY6Wy3aluXKianvhGzsfFCmqinN9dm6UiVEZ2MXDtsc9FMLbulZ/SN7+rW0Kt4KepKrzmFUa7q7zmEdOoXqv93VIwisSFLoYml/P9i5o22T+AIcOII8YFQgF/4fe0eOjHxKMlYTA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgQ+r2aJrVku9NarWprGqjAJ8FDdN3361Kz/whXX+C4=;
 b=h4YAGaVkM8iZCtr+0tLqx5qhB3y5Lgkb3blj1s/Tt7cI/KpucV56PYK6XTiBNqBygcBfyq5vlayqwJlAZ7yGCGpUQKvEpX9VKLjCNzmxhR/q1+RKsv6kGdEvtmRAawKD5awKHPNkM/1lJfJg2cwF9mflWru85SKdMlQIHzTNFXpvVvS3lUq67AfVzJfzKj48RXUDAKCsi/4QrpGd/VuXhMW33uCIMTdcp12KUdj/UCRv/CXml2ocW7ch++9F1ywoq8+Dbew94qTxtjaZ7sRd07aAP5xqAgXP7Wgr0vMRHROHTJhDsFlJaWEdOxkDv/oBL0dR/pc7Gc/GUbFCJ6hQAA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgQ+r2aJrVku9NarWprGqjAJ8FDdN3361Kz/whXX+C4=;
 b=pFAYtsiPwIaI8z6MO5ViB5Euk4QrO+eJg5oKPTRZPsiPmJuInrtXVmOWYpxY2P1HpZTmNsvtvn5M82LycDhW06njtqlAqbcBFSrOW8uxsATqsXO49hD2Iv4W/d9WlEylAZcTXtjOpdc2D6oY2DZDoj0At/ve+iP8KIyYvIgIxHU=
Received: from DB7PR05CA0003.eurprd05.prod.outlook.com (2603:10a6:10:36::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 12:02:04 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:36:cafe::58) by DB7PR05CA0003.outlook.office365.com
 (2603:10a6:10:36::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Tue,
 28 Oct 2025 12:02:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Tue, 28 Oct 2025 12:02:04 +0000
Received: from emails-8554455-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-148.eu-west-1.compute.internal [10.20.6.148])
 by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id ED22580437; Tue, 28 Oct 2025 12:02:03 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1761652923; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=HgQ+r2aJrVku9NarWprGqjAJ8FDdN3361Kz/whXX+C4=;
 b=lsXdp9rAOqB7Juttd3iPiCMJHkzOUateE5V0CBDV5tE41Lc8cn8OMaq8qoY1YBl+cZLjM
 Dc8Tmiq6C89MuLQACvg/wbJTg4rW0CwM6pAgHVGsQduD5MWzak5uTUJ2ovTKETBFJvVgxCD
 9wcmB/uAumOH1ul8NudcGgm5HQs/cXY=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1761652923;
 b=MbRBmzwu6ZEhhGzsV0/bfmvxi9KHuONbplCVin9b69SSEUHuNARZq7VmKWJJw+Oo58Arg
 YKzlQSrl1xauRmSK/gDtn0z0qSPP5n8hSvCxaCGe5IuaTkPrHfqJUUcB6pQImNuSwlr0iQ6
 G9ovYZjjfhDfqdTLbqNx9r68WC30jW0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzLyJecXtYtr2uOXrjdDrKynaAlArG0qVlpABqTyH5fJ99w1vY2tFqEiHpzzcZjnmthBtpTB45tGl/5pQpSEHW8nSCvr9B5DlKhUyyrTYcWY+OjbjJXiS19yoAeya1nujvHk02Qfpwxo1Z4W6sh2RknIcvvzeru+vNJyUCHDTYUYo3dTmfF09YCz7lJZ7oUec3dnzMcMAn5+n6A/MbOGveEdImG1+iVF4oIfd5DL3JdA1HNjYChJgSh5VfapegYfPFgK9YUGpcuH5FXtWYZ3GzPea3ZT34AU+6DcPJ/XCeRs7cJsWHSMNYvb2+QQFJRzFsH/BAZcof2/Har63JU00w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgQ+r2aJrVku9NarWprGqjAJ8FDdN3361Kz/whXX+C4=;
 b=v7ld1Quk/deH3vJZ/LWcDXP7T6moINwwJdt7S8MPUeOOSIyGZXC2ZgT0T43z7DC70qrrEQFGjKiuh+o7VLf/ZSpGjP+RdSYgYTT7RPxhkXN4jdVWrZ5A2rdytd0l5D8tJgNyQ2voB/Ud1HCgZ9NK5LJH9HwXk2rpk+WDXqJXrrxPoDyjnFZXZqGvPnCrfu4YYVNUXEQHeX+cChe9Nuyrx4x2KGmAYFLCHQbJUOsQ24S7hKFr2bnfJqelHTPNDh4/iRArNZPx7CBTwyqyGKaZUfApEo+d7cioY5KDYMn7zwKUR6BqlSa37RuYSNpCrj3BSfnx6nI0wnTy4Vfy8XJ61Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgQ+r2aJrVku9NarWprGqjAJ8FDdN3361Kz/whXX+C4=;
 b=pFAYtsiPwIaI8z6MO5ViB5Euk4QrO+eJg5oKPTRZPsiPmJuInrtXVmOWYpxY2P1HpZTmNsvtvn5M82LycDhW06njtqlAqbcBFSrOW8uxsATqsXO49hD2Iv4W/d9WlEylAZcTXtjOpdc2D6oY2DZDoj0At/ve+iP8KIyYvIgIxHU=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB7697.eurprd04.prod.outlook.com (2603:10a6:20b:2d6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 12:01:53 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 12:01:52 +0000
From: Josua Mayer <josua@solid-run.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Jon Nettleton <jon@solid-run.com>, Mikhail Anikin
 <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 02/10] dt-bindings: display: panel: ronbo,rb070d30: add
 port property
Thread-Topic: [PATCH 02/10] dt-bindings: display: panel: ronbo,rb070d30: add
 port property
Thread-Index: AQHcR2nhwBxWoZYoaEycQ3WG1d/qMLTXRIAAgAAx9wA=
Date: Tue, 28 Oct 2025 12:01:52 +0000
Message-ID: <5e055ce8-e30c-45b7-993a-3ea8f8a796d2@solid-run.com>
References: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
 <20251027-imx8mp-hb-iiot-v1-2-683f86357818@solid-run.com>
 <20251028-premium-sunfish-of-feminism-2bc6ab@kuoka>
In-Reply-To: <20251028-premium-sunfish-of-feminism-2bc6ab@kuoka>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-traffictypediagnostic: PAXPR04MB8749:EE_|AM9PR04MB7697:EE_|DB5PEPF00014B97:EE_|VI1PR04MB6861:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b95654e-c728-4334-929c-08de1619cf56
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?bmphWWYrTkw5a0NIS3dXdkh0RXJsYlZ0UEFhNktqWGl0VEQ5WVo3OWxxNFI2?=
 =?utf-8?B?Q1JQLytEWThkMDBOc1pMaE11V1d5WVpaZHdUdkdUVWREdkQrSHU4WGNFVk1Y?=
 =?utf-8?B?SWZqSjdTR1pxbDAyd00zOWNxNWNGUW5jTy9EM1IvY1NsMEJTdWlldHlNU2hZ?=
 =?utf-8?B?bk5KeitjTHRjeHJYcWN3eStPLzRWVTRmeDh2RW90TkRiVG9qVE1qYTM5eWtB?=
 =?utf-8?B?V0p4NTJUUXFrbHgxNTJqZDA0THlxeWJUYVJWZUZKZll6aElrWUxDOHg3M3Yw?=
 =?utf-8?B?b2s2eWZqL3lFdlhWeXNjTStSVkZ4TXRtS3FjTTJITzAzV3dtZ25yc0hIemNF?=
 =?utf-8?B?SFF5Y0MyeWptbGdDdnVEQUlwQ1l3S3BMdnpEMFVwbWFQNkF6ek4wR1ZOaml1?=
 =?utf-8?B?QktRMUFlTVdPdlhMdWVPZU5HZHJFc2tmSytsNXdjbHpCNnA2a0tvM2VQNjZ6?=
 =?utf-8?B?TTlzUitEYk1HNFdNWEhqbEJIdnMvKzYxN3JYNXNkaDBpMVVFTFFKNEttYlVk?=
 =?utf-8?B?SWsrbkpYbENLTVd5a0Fta2c0WUkzd3pzZ0xoT2Zkck1WRTA5SUNQL1d2M3N2?=
 =?utf-8?B?VzhFdVFURUtVMHpGbG1GcVlxTkJKRGRrTGJHeHZlQkJYM3NMSXIzQ2RDREdH?=
 =?utf-8?B?U1FrR3p5ci85QmtWTmlJVVRyaVZoODVoMGNCbGs2NXpxUjJ1WjIzQXo3OVdr?=
 =?utf-8?B?SmQ1cllRTVNFWVo3anpaR3FiSHQydTJEcWZXUVNOSWVHaHd6S2VVWDExWHFS?=
 =?utf-8?B?TjhDckNZQ1Z2RmNhRVdHZDFvUTQ4Um1jRk5yVTBtcVVXa2pMMjNFRVJ3d3BP?=
 =?utf-8?B?MGY0K0Z0Z0Z1RDdzSGxRLzd0dzlsbTN1SXIvOGovWVVDbDRZMDNwYXlWeGRY?=
 =?utf-8?B?ZWJLQUdPMXM0ZGdVVHFXOEx6R0VPVmhtYW5qcTkyV1FqTDZtVE82QW1YNWh4?=
 =?utf-8?B?YURxTk1sVGZrOUU3dXZGSjNaZFlsbCtFaEd2V1h3dllFc0ZnMUNUL3R3Zito?=
 =?utf-8?B?OTVKNG1ZZjA2ZDY0RlRJeTMzdm9kQWRETXk4N0VPdUlicUFMT3lJaTRtVTk0?=
 =?utf-8?B?UjBqRXlFd3pBWVJLZ3NNYnhVQlhmR29RR3BwWTFSdDF5NjdySkNvdTZCS0FL?=
 =?utf-8?B?b0xLU1FYSDc0eWUzT1VRZ3lRL2dvRUNHcjd4T0l6Ky8waEk1WXV4VEFuNng4?=
 =?utf-8?B?cld0OVREb0ZVSlVnRXN6OGt1VGRLMmFNUnVEZ3RWRTk0OGFBNElOWW1zdkta?=
 =?utf-8?B?cW5WeWlFR2JVbFJ2N254Tmp6WlBzRWhLTFRKeVhpZWIwTlVUYUJIV21FVUk5?=
 =?utf-8?B?NFJKL1BKb3lUUnlhQzFXS1VmaHI1V1hJemovVkpyemR3cnp1VFhBek5HUEhZ?=
 =?utf-8?B?bktqVkNhb3BuaTdkUkI0a0k3UlpPSEJBWnhuUlI2RU9JVzZHM0VVZDNXcEVB?=
 =?utf-8?B?Rk0vdU5rdlNzSzc2YUVBT29IaENNVzNhM0ZEWXVOVVZrY0kzRXpqMnJLSWJP?=
 =?utf-8?B?S1RZZ1A5VlU2M0NFM0dkZ3dpNHNVdkMwcU1YdjlqLzVsR0FKSGFNUlN3MnhW?=
 =?utf-8?B?MmpuUnlieE5ZV3ZkMWxjRCszMGc4N0V6UjcxNUNSV3VXd2FPcHZRY2RMVDBk?=
 =?utf-8?B?dlg1MTBlbDVPOWVJY1E2eDE2YWZoNmg3SmRlM3N1d0taMnkwejVqQVY0dmJQ?=
 =?utf-8?B?VjlEaTJVQ2FWMElML1dWc2RRVXowcEFpNExUV1Qyd1BORjhHSENGak5FRVV5?=
 =?utf-8?B?M1BVcnhNc0dqZkRHblFGWjMzbGxkYXh4b3RVK01uYWdjdUlLZS9yUW5QRHBm?=
 =?utf-8?B?K2x5cCtGeUlBZWsvQStaNDVleWIyQmh5UGg2em9HaUVmSU9aanY4WXdsOU5s?=
 =?utf-8?B?MzMreXZEa1c3WmEyak83Z1hOYkxuQkpHR3hxaERLamJCbmFrMmRmOVlrSm1r?=
 =?utf-8?B?STREb3MwSTZHRnNrK2JITkNJTmRscmJhTTc4U2RUWm56RFNYQUN3WDFrR3ll?=
 =?utf-8?B?L0NNMVp2dEQwZnI4bndNSzFmd3BSQjB0V3krRG1VVlJqM3UvaE42Z0RheDBS?=
 =?utf-8?Q?pGSQlT?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1102; 
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C6B9E4FA15C264EA10B47D435CA25FF@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7697
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 5db68c18c51c4f9cbee6d80f32eda6e5:solidrun,
 office365_emails, sent, inline:76fa2e8c87864c9bea8ab77815420b07
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 734d9a67-d4fa-4951-f2f3-08de1619c8a1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|14060799003|35042699022|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkhPZVpEZWZmbU9OL2FKcnNUVEloYW4rUE1OQjJYc2RPQW5jMXU0L0hiNlhn?=
 =?utf-8?B?K0xDNzhDU0RrNkVSYi9YVGkyaVJQYnhUUFQzTjNWNXhmMXRJM2tiaGFmcUh5?=
 =?utf-8?B?RUZDc0w0M1pJVHdVd0xjdUdSV2JIbnQ1TWdlMTI5WVNJRzhzTlhSYnkrQ2ps?=
 =?utf-8?B?MW1ZYUplNElMSjk1TWZsVXQ3c0RzMFE0RlowY1ZTa0I2c0QvZ3FEVmgyTUhE?=
 =?utf-8?B?OG5iVFV4cGl1b0hpREdpcUx5V3N5V2ppMVZTMUhQaU4xRzFzMm1nbklXVHFU?=
 =?utf-8?B?bCtOdlk3YlV0UkttamJBM3FWSU52Qk9odTZjbW9WVElMZ3BGN3JoVUpTRXo1?=
 =?utf-8?B?YUwvbjhneElMTzZIR3NXVC83WUc0Yytod0VWTmFMOHozN1VKM1NJR2taZWI2?=
 =?utf-8?B?TWNWc2lFakdOa3Exbm5QZGNWaW5yUVc5dktFcXp3cXlMTHFXZFZnakxEbGJU?=
 =?utf-8?B?bXhrd25TSXB0NDNoQVZDeEF2OWQ2UWNNY3ZxZUppRFg5U1FONVorQ1RYVXd1?=
 =?utf-8?B?L25UMlhBd2pCc3ZEUE5aVHdWaklSMW5razFpc3hNRHJRb0lvMFA5UE94OFZl?=
 =?utf-8?B?L1FmQ0NSSndCRVVnRHcrK1JFQ243bHBLTzllZW1mTFE4MkNGNEQ4ZWZsZTl3?=
 =?utf-8?B?akRHMVhNTWlWTU5Oang0dFdPOTBGbk1kQjhuSDEwUXcyUDhNQ3RTdjhkQW9h?=
 =?utf-8?B?c054cVhySVRwbzVNcHp3TjRhdTV5U2ZlWk1lWTJUTDFPdm9sWjZ1OG9ic2Zw?=
 =?utf-8?B?K3dWanZBUHMySWRsOHlXYTlZSkhwVEN2VU1naENrNGJaanpvWVJyRC9YeWhO?=
 =?utf-8?B?YmVsQk9zTDMycENnaFZkSHRDbkgzOFpaQkxZRzZ6NDdpeE9SNGo1L1phSVhB?=
 =?utf-8?B?TVppazhPOGVnK0p2cjZOVHRWRFRhblQ2SGZJSHBIVUdQSmtkYlB1Yk9ZK2VB?=
 =?utf-8?B?cFFLMzBwMVZQNXZER3NsY3ovcTg2UWNsWGwzUHUrSG05WkFHY3JuUEcxQUR5?=
 =?utf-8?B?ZGpNVlh6R28zN3N2K2dWMDhpRG1UTm5GWFBDcC9ESHZEemtFVG1xQm41THQ2?=
 =?utf-8?B?OWdRNHdVM1p0d2szQ2lLY0Q1clJ3NGxTVlhoRkZEQ0F2NSt1NCszS0ZwRlBt?=
 =?utf-8?B?eTlwM3FoWis3YmRvSXBVZkx0RzJSRVR6bGRxVEpLSWV0WlVlZnNtVVRkT3Zj?=
 =?utf-8?B?eTV2djF0bU5mTGhMRWs5dEsvaGFzWGRxbzFDK05XU3JKbHp3SE9pUEpaT3NQ?=
 =?utf-8?B?T1JhSUlpc21TZ3dpYlZTcEM1T2lYV0RpL1YzbEFvM2plRXdENGVIV3BGbGFp?=
 =?utf-8?B?a3Jhd0ZxZlN0SWE2UUJOZW82K0dMemRMY3RJVnRDNVV1Uk1WTjcyOHg4QXhP?=
 =?utf-8?B?NXdDcTZlOVFtb3ViZFJQQncrYjRRRTVuZVQ5TEU1aVlJamh3UGMzS1g0eFJ0?=
 =?utf-8?B?SEFncTZCV0RWYXVmNExQMW1ObzgzWHcyd2FWLzBjT3ZwT1QyUUc1Mkk3ZWsy?=
 =?utf-8?B?S2Z0RkUwSzhFVjZOZnR3NzVjR1oxZisra2dGV0JlbzhuUnRoVm1BWVZleTBH?=
 =?utf-8?B?NHBveUd3WGs4NXpRci82VXNpa2hPYlhDdmpTVzNPaFBUKzJvZzhnT2ZPT2RY?=
 =?utf-8?B?Q083VXY0cThxM1NabnRsNjVsWjNoL08zOTlJVUgyR3lwa1hMaXQ5cURxSlpj?=
 =?utf-8?B?Y2wraDl2dExLTkd6bEJFS0N4b3M0V1k5MlBaZkNqcG81c0ZSajlZMExLd0JO?=
 =?utf-8?B?M2pXYmRJY3hCbjgvRURlWm5MejdxWXRXNmo2alAzUGpNZ0pFMnIxZWJvU0Y4?=
 =?utf-8?B?QUVMNm9oVDFtTkNnUE9sUEdRMVNrOGdUeE5seEJxbXprdDZicmZFYmpFZkk1?=
 =?utf-8?B?aTRJdkhtZ01oaWNZY1VLd3BwNVFFOVZUUXo2M2ZBek1FZHg2eWM3RE9NcHhL?=
 =?utf-8?B?b2wya2h3enJjdG1aeTJydURyMkgzeHprOUZocDhUS2NmVDM3Uk01Y1lYdmhJ?=
 =?utf-8?B?eGZQbEtqSm1pS3ZIcUNJMzlyYm5qWHhoYi92ZHF3bGFWemFQcEdSemxOTjJE?=
 =?utf-8?B?K3FtZThWNVdxc0ZWWXVUKzhPYXRHK1NSNWMxSHo0MWt4bnpLSkEvTXZub2pq?=
 =?utf-8?Q?E0ms=3D?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(82310400026)(14060799003)(35042699022)(7416014)(376014)(36860700013)(1800799024);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 12:02:04.1304 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b95654e-c728-4334-929c-08de1619cf56
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861
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

QW0gMjguMTAuMjUgdW0gMTA6MDMgc2NocmllYiBLcnp5c3p0b2YgS296bG93c2tpOg0KPiBPbiBN
b24sIE9jdCAyNywgMjAyNSBhdCAwNjo0ODoxMVBNICswMTAwLCBKb3N1YSBNYXllciB3cm90ZToN
Cj4+IHBvcnQgcHJvcGVydHkgaXMgdXNlZCBmb3IgbGlua2luZyBkc2kgcG9ydHMgd2l0aCBkc2kg
cGFuZWxzLg0KPj4gQWRkIHBvcnQgcHJvcGVydHkgdG8gcm9uYm8gZHNpIHBhbmVsIGJpbmRpbmcu
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+
DQo+PiAtLS0NCj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9w
YW5lbC9yb25ibyxyYjA3MGQzMC55YW1sIHwgMSArDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JvbmJvLHJiMDcwZDMwLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9yb25ibyxyYjA3MGQzMC55YW1sDQo+
PiBpbmRleCAwNGY4NmUwY2JhYzkxLi5hMmRjNjdhODdmYTNiIDEwMDY0NA0KPj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcm9uYm8scmIwNzBk
MzAueWFtbA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvcm9uYm8scmIwNzBkMzAueWFtbA0KPj4gQEAgLTEzLDYgKzEzLDcgQEAgcHJvcGVy
dGllczoNCj4+ICAgIGNvbXBhdGlibGU6DQo+PiAgICAgIGNvbnN0OiByb25ibyxyYjA3MGQzMA0K
Pj4gIA0KPj4gKyAgcG9ydDogdHJ1ZQ0KPiBQb3J0IGlzIG5ldmVyIHRoZSBzZWNvbmQgcHJvcGVy
dHkuIFBsZWFzZSBsb29rIGF0IG90aGVyIGJpbmRpbmdzLg0KDQpTb21lIHBsYWNlcyBkaWQgdGhh
dCAuLi4uLCBlLmcuOg0KDQpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9tYW50aXgsbWxhZjA1N3dlNTEteC55YW1sLcKgIGNvbXBhdGlibGU6DQpEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9tYW50aXgsbWxhZjA1N3dl
NTEteC55YW1sLcKgIMKgIGVudW06DQpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9tYW50aXgsbWxhZjA1N3dlNTEteC55YW1sLcKgIMKgIMKgIC0gbWFudGl4
LG1sYWYwNTd3ZTUxLXgNCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3BhbmVsL21hbnRpeCxtbGFmMDU3d2U1MS14LnlhbWwtwqAgwqAgwqAgLSB5cyx5czU3cHNzMzZi
aDVncQ0KRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbWFu
dGl4LG1sYWYwNTd3ZTUxLXgueWFtbC0NCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL21hbnRpeCxtbGFmMDU3d2U1MS14LnlhbWw6wqAgcG9ydDogdHJ1ZQ0K
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbWFudGl4LG1s
YWYwNTd3ZTUxLXgueWFtbC3CoCByZWc6DQoNCj4NCj4gQWxzbywgbWlzc2luZyBibGFuayBsaW5l
DQpPa2F5DQo+ICBhbmQgbWlzc2luZyB0b3AtbGV2ZWwgcmVmIGZvciBwYW5lbC1jb21tb24uDQoN
CkRvZXMgdGhpcyBpbXBhY3Qgd2hpY2ggcHJvcGVydGllcyBhcmUgY29uc2lkZXJlZCByZXF1aXJl
ZCAvIHZhbGlkPw0KDQpSb25ibyBwYW5lbCBoYXMgZGlmZmVyZW50IGdwaW9zIC8gbmFtZXMgZnJv
bSBwYW5lbC1jb21tb246DQoNCnBvd2VyLWdwaW9zOiBzaW1pbGFyIHRvIHBhbmVsLWNvbW1vbiBl
bmFibGUtZ3Bpb3MNCnJlc2V0LWdwaW9zOiBjb21tb24gdG8gcGFuZWwtY29tbW9uDQpzaGxyLWdw
aW9zOiBzcGVjaWFsIHRvIHJvbmJvDQp1cGRuLWdwaW9zOiBzcGVjaWFsIHRvIHJvbmJvDQp2Y2Mt
bGNkLXN1cHBseTogc2ltaWxhciB0byBwYW5lbC1jb21tb24gcG93ZXItc3VwcGx5DQpiYWNrbGln
aHQ6IGNvbW1vbiB0byBwYW5lbC1jb21tb24NCg0KVGhlcmUgYXJlIHNvbWUgb3RoZXIgZ3Bpb3Mg
aW4gcGFuZWwtY29tbW9uIHRoYXQgcm9uYm8gcGFuZWwgZG9lcyBub3QgdXNlLg0KDQpJcyB0aGUg
YWJvdmUgcmVsZXZhbnQ/DQpXb3VsZCBpdCBiZSBjb3JyZWN0IGFkZGluZyB0aGUgYmVsb3c/Og0K
DQrCoG1haW50YWluZXJzOg0KwqAgwqAtIE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9y
Zz4NCsKgDQorYWxsT2Y6DQorwqAgLSAkcmVmOiBwYW5lbC1jb21tb24ueWFtbCMNCisNCsKgcHJv
cGVydGllczoNCsKgIMKgY29tcGF0aWJsZToNCsKgIMKgIMKgY29uc3Q6IHJvbmJvLHJiMDcwZDMw
DQoNCkBAIC00OCw1ICs1MCw2IEBAIHJlcXVpcmVkOg0KwqAgwqAtIHNobHItZ3Bpb3MNCsKgIMKg
LSB1cGRuLWdwaW9zDQrCoCDCoC0gdmNjLWxjZC1zdXBwbHkNCivCoCAtIHBvcnQNCsKgDQrCoGFk
ZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KDQoNCnNpbmNlcmVseQ0KSm9zdWEgTWF5ZXINCg0K
