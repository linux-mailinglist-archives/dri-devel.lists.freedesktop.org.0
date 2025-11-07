Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45410C3FC8F
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B616210EAA5;
	Fri,  7 Nov 2025 11:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="PGLUbk63";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="PGLUbk63";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11021118.outbound.protection.outlook.com
 [52.101.65.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE50210EA9B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 11:46:51 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=B59TiYmoGVhDu97wSIKEDFQuQ/XwR9bBKYYOSY8CLz788oIfl/gefIhidNRE0RpJAEVwLZUSCnUbSBeLmlNYGiuGCa/21PIfQNY6xqwk26i2IdNbw3dPu2Gu1Pm3TGPrGh78CB98iu25o/IzRjDRTqxXNBaCaIpF4etXf4gWnnzQAkvkLdCUdQ5S2Kel/dWHo1gj5es3YPRJ4VA8AClLWwumVJoYcIq+txCT7bNBNFKS1xabnj6WvGm5BwHqOifVTBPElJZleVQgEQdEqFlDwX7CAbnq5yD08OsIHwK6C3MWAgBbp6qT6NN82oYvXujMSVr26u5LKc/LQa+G/oeOlw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWyL2VQlf2sqGUDJNav0ukW8b6dKw3K6ze74HDXMmRE=;
 b=J5nVaWs3emzue65dU2jnei2zKd3YU3bJ40oucj8EvhfaWehoVZB8jDOcTKJoUPrBo0farl1mRQ1GF+9sb/znskfgmkPMVeq9qgYUS8kSUh8K4/kBFCXPsLiMa/Aa3A+frS/fcoFj6kZi+xVMGGfJ0QG9dCrhImeqgJ3yu5+1FgrZMCCdo1L7g4CSVbnq699HhiATPKBCNOpA+uhZ72XsgnDBM4/FUTLqi4V4LN0hUYDP5LthSjYQAw74sXy16vRpQq3GtQW02pLejgo3eqKOjN+NRgfvJe3zWntWb2myiLH31+tjmsNzAtSMEfM7S5XG3tfOX6zaT2VsPcVGC3e40g==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWyL2VQlf2sqGUDJNav0ukW8b6dKw3K6ze74HDXMmRE=;
 b=PGLUbk63N+r6TMLcQcZD3Ruk3RhXkxaLdByP8zs67a3dsQFFY6Hf/tud+NQxdgyuLRBgyw/b/LMyHuIjIuPbFI6vbFaaJm9MSmhAylFrT9inp0R6nsm/Wmal4BosEvjSjAQxRTM8/OzCJPzq42gTIEDku3h0AzKqsRi9Lr83Rmo=
Received: from AS4PR10CA0006.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::6)
 by GV4PR04MB11353.eurprd04.prod.outlook.com (2603:10a6:150:29c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 11:46:47 +0000
Received: from AM1PEPF000252E1.eurprd07.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::7e) by AS4PR10CA0006.outlook.office365.com
 (2603:10a6:20b:5dc::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 11:46:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM1PEPF000252E1.mail.protection.outlook.com (10.167.16.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Fri, 7 Nov 2025 11:46:46 +0000
Received: from emails-1779961-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-203.eu-west-1.compute.internal [10.20.5.203])
 by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 402AB80652; Fri,  7 Nov 2025 11:46:46 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1762516006; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=cWyL2VQlf2sqGUDJNav0ukW8b6dKw3K6ze74HDXMmRE=;
 b=PpzmVu36oDtPbBHj4DD/Z7MpzNUAgJjQJX2B1D3E+NOwb7DKcGQAefgbUe6padh5IVNz6
 g8X/54btN6qbmZSv8C0V9ul1r6zrd1nfs3ypwAeeKU+4XQXgJftYHnZcJV6ElIFr/dOFktm
 luy/4yqObniTi5p1qrTtWowHCXbO/IE=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1762516006;
 b=pBHnmBQDnbyAhY5UK8ED/JTXBG0xGdrTrdCiRAL9OEHtPuh4ofQTsJpfXLYTHjPMg8znE
 BYB8QHyjeWPq3+Rw3OTL7DS3JLwcFb+O5/dXkMMI+O4muyYXckjUSXb+K8ucixrc2NZ2eF0
 1MHOSMu7rUb8w7EtjGQhoK8hPRoLFlc=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVSxZ0//Zg8GpCwn81ZRYdHP7I7ccv7MfKCO92VkNuFh6Jx43pgvF8ziXOphEYfq9zH9EVCbXX7RTwVnmdP4A7O5FTefLncXY/VuyYh/ehkeA9QMRkEdNBBiqF+6LEVU1CndQ0fNZIR30QvP8GZOofs/WJoh9nL6Qi6wE6KkbKPCPlFZ2GS89XvPUbEj9+cDY59fqE4k0Rik0ZC8mUqJZAySvxPtltQppLWzGSu9Iiskl79dODCsrkblWL+vlPpJHzwyJoIX7suBjAmJ5wNvfgI09TpxIVXhfE/a9TUncsy+TSAW+lwHr67aCU8FuD0gdrUWRpY1gIJ62NW8lcDIfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWyL2VQlf2sqGUDJNav0ukW8b6dKw3K6ze74HDXMmRE=;
 b=C+9RspG1uzvp4utGtCLe9jjfrrcGF/pEsDZ3804cp4ZgTcnicE0FrSfmdF3Wec42eVpWrt6o0eQAaeIr/jbNH+Sjj1kbT3vdBESYUyjsV8gCuTKwnGIKis/cJktE4EYmBT+Wtlh+TtbG1JSyOntb42frXLowDdGMOexZF4yImuxQRsPGqlKhA82q1r18Rktk95/VL28mRjwvLLq84HYQYXVdaGSvkfCUfID1jHhk2cw3ugcOhDvCNgYfWKTO37x9wO0aOCeN5f5ebVqRV1fax138MdjYamkbmRLbNm4g4bSnHdeejXuZxJ0gRG3vW4whmwUvZXxqS7S6gH3uds92lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWyL2VQlf2sqGUDJNav0ukW8b6dKw3K6ze74HDXMmRE=;
 b=PGLUbk63N+r6TMLcQcZD3Ruk3RhXkxaLdByP8zs67a3dsQFFY6Hf/tud+NQxdgyuLRBgyw/b/LMyHuIjIuPbFI6vbFaaJm9MSmhAylFrT9inp0R6nsm/Wmal4BosEvjSjAQxRTM8/OzCJPzq42gTIEDku3h0AzKqsRi9Lr83Rmo=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by VI0PR04MB10095.eurprd04.prod.outlook.com (2603:10a6:800:246::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 11:46:37 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 11:46:37 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 07 Nov 2025 12:46:15 +0100
Subject: [PATCH v2 08/11] arm64: dts: imx8mp-sr-som: build dtbs with
 symbols for overlay support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-imx8mp-hb-iiot-v2-8-d8233ded999e@solid-run.com>
References: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
In-Reply-To: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
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
X-ClientProxiedBy: FR4P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::16) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|VI0PR04MB10095:EE_|AM1PEPF000252E1:EE_|GV4PR04MB11353:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb22cb2-3073-4c40-5b4b-08de1df35481
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Nk1DVWM0VkNldUJHNFdXWUVrb3ZGWnJubWdYNW9Fb1NBbVB2TzMxSUt4SUMw?=
 =?utf-8?B?V054bmZZVnRHbldxeWw4UVNhblVsNFo2dkpWTkp1ZTUxanZ2ZlBQWVNDTm5n?=
 =?utf-8?B?VXIySEhSZHFxZ21kMWFQR3VpMjMydS8zZWMxallvQ2dySnpBVWk5Wms5S0Z0?=
 =?utf-8?B?VXBjTnQzcTdMSlUzVys4d1RxS0cvZlJlOG82MUY5am8vSmJWRUJlMzlVb2k2?=
 =?utf-8?B?VThMZnlmalZqdEg4SEp5a2tjQnpscStpaXFOU1hUcEFSaG15WEVuaTh6UVVa?=
 =?utf-8?B?N0txeDN0dm1iVVdnMDhRVkdlM3VmU1A1ZXYxeGtlOGFsNDNMVjV5N21reU1m?=
 =?utf-8?B?ZWpNU2xMcDlURmFHbitUeHNxenBNU3ZJVGRCamNvRXNNa3VBOWUrTGRsNTlo?=
 =?utf-8?B?OUprWmVnZlVJbzFXTk9QckpHRVZoNVVpZityY0JRK2pONjZJT1I4L3k5elNK?=
 =?utf-8?B?djg4SVpTb1hzNGM2dHB3UVArUkZhd1V2Y2NJeW9kQkxjbm96bnBpK0h1b0h1?=
 =?utf-8?B?enI4Um1LMkkza1UyL0tXZkRkY0UxUWFENk1BaVhtK0I0MjZHRGxIK2VLSEhk?=
 =?utf-8?B?NXVSYXBwd0ZyQ0VZblNqUXZyRnJYdXdzTHlWNVgvK2dQV2lYOW9vZUVPeGww?=
 =?utf-8?B?MVZjN1duNG5rcTRZNnorTmM1YXZoQ1F0d1Z2bU5RRWh5aGFXbE5FUmhVSG1M?=
 =?utf-8?B?emFqWjFzTEpqMXgxa0lIK09xWlB4TjNKcmRCc00zY0o5YVN5Z1BXdGlieWZq?=
 =?utf-8?B?bFZTaCtVVWhXMzRra1g1ZXdtZTg3QVk2S0t3WnZ1Z2ZhczRyMkpaUGpHMUNt?=
 =?utf-8?B?SThqZ3owQjRvNmFTQnhkR2NzRTR0SkVtZmljYWUzaU1LSlFOamNEd1pwdlRp?=
 =?utf-8?B?WWJLMTNiSnJsTncyaXArK0oxY0ZCUlFxcXBmcFJKanVyYkQ3Q0gzdWRsREpm?=
 =?utf-8?B?Qy8wL0J4V0VlTFJEQ0RPVTZjL2x5QXp4MUNEbWJKa2U0bURGeVJSS3NQSlZl?=
 =?utf-8?B?NWxydys4Wjl6bHdwL2x2ZjhIc3FlczlLejN2R0h1QUdkZ0NJSWllYWtmVnl0?=
 =?utf-8?B?VkgzSjR2RzdVdGV1dmlvZ2d1Q1FKTmpQUmZPVDF5QnlSQkNiTjNoSTFGemJH?=
 =?utf-8?B?Zk01eE05WGJZaFFubmVBemZ4L3VlK0hpbVhHM09aUDlrY3IvNEdqY2NFRmRy?=
 =?utf-8?B?ZHpvc0E0TXdNVSsxR1BUcWp4QzJOWUNtVkxpR2x5Z0hiTk1JZlRKWmkyelhk?=
 =?utf-8?B?NmFrbGQzelpYTlJwVEUrOGJDSmRPVFlwT2dNcG1sU3l5MnozanNLRWpyVTJx?=
 =?utf-8?B?bXBmSW5tVjJ5bVo1ZG5qSDdCVnRvQkYvMnNmaDc5ZUZiM1hlcHVpN3FmNVJZ?=
 =?utf-8?B?TDFsV0NjZzA5ZXBFZktmQzhLUUdRRW1VNDk1ZXJWeldnRFM0UHlsbTRRbHVS?=
 =?utf-8?B?bk8zMndsVzNtVXV0L0oxOEprY3pnd3AwU2xUOEtaQ29ORWFEeG13RUROaUwv?=
 =?utf-8?B?a1c1dTB0VCs2U0ZQYmhQUWlkYXlLQkVHcmpXQ3Z0Ym8wZHh1eWRhZ2g5MGpu?=
 =?utf-8?B?OG43VHd0UGttZGVjM3dPZjhrUEE5VlQ1c1k1eG9mZ2h4d0JCb1ZVSU1lVE4v?=
 =?utf-8?B?cVhBM3dHTloyNHI0NUthck96NHFyejdVODd1aWNYa2Z6MDh2ekZyL3g3WFBn?=
 =?utf-8?B?dE1BRWNLeUdJRnF1NE9oUHlJQnlTTmZhRGRjb3I1Q0ZaRms2ZFRNaXRXckU4?=
 =?utf-8?B?K3NUdjdxM2Vmck4xMXpVNUdhUmQvbjgyL2twdExiem5oS05RenFaT25YZWph?=
 =?utf-8?B?L2ZLRnM2cU5LZTRwTEwzaGIraGVVSDZhTVhaZm9INmF6d2hENmJYRVNIWmYr?=
 =?utf-8?B?bzRQMlZ1RDFVOUhLZHR4VThrUjNBZmJTaEEvbGlQMXh0NUgrT0poS0paL1R1?=
 =?utf-8?B?WWpCN25wa1B6bmxGQXRYdWQrNUNUc1oxeVZwd1ZBbDdXQzVRdGpHdTdTS1Rv?=
 =?utf-8?B?b1FlK0JIdEk3Q3lVS2tUQ05sU0w3b1RJUjRtbFkzTDMweVh5WExpSlBlVmt0?=
 =?utf-8?B?cXU0Uk9pT3FnUDczQlRuQkp1bks0c0dGbkw4UT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10095
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 60028ebeb6f74f21ae446f7d942c20d9:solidrun,
 office365_emails, sent, inline:55f0baf1cfcf9deef26c3f5032cf7141
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8e21a2ac-1029-4100-b8e2-08de1df34f01
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|14060799003|82310400026|35042699022|376014|7416014|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGl2MHJ6UjdzMGl2Vyt1a3hGUVVzQkxxRnhpN25MaW9XWTEzRFFtTVZkcmIv?=
 =?utf-8?B?dHNLaFlvNHlVS0IwZVZLN2h2RDYvNkVLUXFkVUUzOHZHQ0xvakxNdVJvNTV0?=
 =?utf-8?B?ZlR5cXZ0WXg5UUZiUTgrSzl4bWpBOWhyc2YyQitFWUZxcksyYkhjM3M5dHd4?=
 =?utf-8?B?c3JUbGFxT0FYbTNzeEJTVWRyd29uRFMzTUMvK0ZkVVVVYk9NcDhLbmdJb2U1?=
 =?utf-8?B?SnBtMWxxajlPbERrbUtwVURDL1F0MzhVbTN3bm11cEtwb1pmQzhkZ1BjNnlx?=
 =?utf-8?B?ZUw3Vm9QYlBkTHNTK1JNeUJjdUJlWWtVY2dpZVU3RlY4U3NUa21EUy8yd1B3?=
 =?utf-8?B?cEpBUVhFWFVKMWJ5ZTFiczhIZ1lCaTMvUnFJT1I1TWV1S1pQRktXVVRHK0FN?=
 =?utf-8?B?ZVAweVR6djV5QXRybkF1ZHlKT2ZvdWpxWkp1Uy9jLzNkSDFxSHVwelVWNHZD?=
 =?utf-8?B?K1ZTMUxVdlZYNWZCTkxpVkZJMytHSHFENVgzT0pyYWZVS3VHd1N3dkt3VFY3?=
 =?utf-8?B?ZGVxbThEa1ZPd2FOblczWkd1Z0owYVp4TmNNdS93OTYzMlk5NmpBY3YrTzZF?=
 =?utf-8?B?dklvQ25NMlp2SGZkYTdkZ0I0QVB3Qnd4U3FvYkRqTUFKeURQODNDVllVQUFL?=
 =?utf-8?B?cjJ2bmhOUjBSUGpzY2JLMkRMR2JncVZjOWNkbVhWajZ4RHlGeGVKclZjeS9m?=
 =?utf-8?B?L2pQam5KUktuSmZDMXlQVmRkamh6aUIyUGxUMURITlFNbEpNdEVHQkVDWVhC?=
 =?utf-8?B?NjFkZWlOMmc0NDJ6MDdyVGFYemoyZFUxYms1NzZXT1BYMTBmT3oxVlk2bTNi?=
 =?utf-8?B?Wi9sNU5WV0swSlRjMXJCV3RMQWNkZkJFYTRVV0xJR3RSUDB6R1ZzcW1XZWo0?=
 =?utf-8?B?cWtaazZmbHk4aHV5aUtPUURHakhiNUNkbWJZb0dhcWxUNGNaUWFITmpHUmRp?=
 =?utf-8?B?Q1BGR2wwMkhGbExjREhBVmJlRitWVVpOZ29RTEI3Z25aYVlpRnU4N1V1TXdx?=
 =?utf-8?B?TURLaDZwRlNhR1BNU2x1d2k1WGx2SDEwQW11ZTlsbk9RR1EyOTNXYkFKVjVJ?=
 =?utf-8?B?azlIOFBvaEpmcTRLeTlHMm1PcmtFRFFJai95SEFNL0ZSSnMzdXE1WHl0QVhp?=
 =?utf-8?B?T2pycitVeGF5TkpuR0xRSmh1OGNzUWsyek5hd3d0SWtWSXY4SnhFekcrQXJJ?=
 =?utf-8?B?QWhnOW5GRFZSRHdFS3pqcVZsWlNiWWQ2L05JMk16MVFLMDk3Qnh5RGVFdm1H?=
 =?utf-8?B?MzRrOWZzbUk3Vk10bENZZDh2QUlka3JjOWdmMEFBa3BwREhpMEpHTEFrd3Iv?=
 =?utf-8?B?eG5OQlJMSnhMbno2QWowaGxjdXY1YXNVekZWTXpSUlE0TCtZQWk3R05OK3RB?=
 =?utf-8?B?bVdsbzV6NnVEQzg3cUoyQldhTlpXbGRVR05lbFI2TE1nL2QzNVlQN2Fhc1kv?=
 =?utf-8?B?VTBIcWloWlV3Q05qOHdFMlpFa1poSStaQkdqbGg1RWFiNVpBZFBQWlU5alhN?=
 =?utf-8?B?N3NtY2kzS0pXTUFES2EzNHZyWGNDVDdGQmI4a2tObFk3WDJldWZ4a0FTUFd3?=
 =?utf-8?B?WU4vUExOTHRiRDFnKzdPMVV0cHE0RWRpdnZwTlJDREpqYnJ5bjEvSW1xRFdm?=
 =?utf-8?B?d3Q3by85TlQ0RjJRMFZ3bVFrcDZYc1NvQjRLdTRDTUhUWXJ3bnVDTHhVR3N5?=
 =?utf-8?B?WG8wS2R0bys5RUNLcmZJS2RjQ2lvank5OWhKZW9ZTnQvcXRCUEFZRlRHNWQw?=
 =?utf-8?B?YkhCTXV5N1o3Q2dhTFFNZjAwSTNRMTlWVzNxQnpOa1hNNnA0dmhNeUptUnR0?=
 =?utf-8?B?VkVGbi9lTEhtMzRSTTFWc25Ibk5HOWpldXhXS05UMWdDeTd6emlIR0xXbEYz?=
 =?utf-8?B?blRrZlg5aXdTdFhvb0Jzelo2SHJKT0Q5Qy9ZSktnaHBHb0RlNndSQjhOUTcz?=
 =?utf-8?B?MlkzK0hZR3R6UE9ZWE5OV0w0TitnN3pYSVlVMGdnUGZtc3EzT0p6NVhDdDBw?=
 =?utf-8?B?ZnEyRWpEcGVzU3hkT3Y0bGgxUmNwQWNNOEZMcWlER3pNVTROVWRCSGo3NTV4?=
 =?utf-8?B?R1Zwam5IWUZuYlR1eDNOUXlNOEo5NytZbXNyL2dqM1dzcW4ySXhFbVlBQXpw?=
 =?utf-8?Q?5u0HlkZUGyivDmrZHnG9BBZqe?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(1800799024)(14060799003)(82310400026)(35042699022)(376014)(7416014)(36860700013)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 11:46:46.4315 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb22cb2-3073-4c40-5b4b-08de1df35481
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11353
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

Build all dtbs based on SolidRun i.MX8MP SoM with symbols (adding -@ to
dtc flags) to enable support for device-tree addons.

The SoM has a camera connector for basler cameras that can be enabled by
downstream dtbo.
Hence by extension all boards based on this SoM should support addons.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 525ef180481d3..8bda6fb0ff9c1 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -197,6 +197,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-helios-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-proton2s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-beacon-kit.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-cubox-m.dtb
+DTC_FLAGS_imx8mp-cubox-m := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-model-a.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-som-a-bmb-08.dtb
@@ -207,9 +208,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
+DTC_FLAGS_imx8mp-hummingboard-mate := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pro.dtb
+DTC_FLAGS_imx8mp-hummingboard-pro := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pulse.dtb
+DTC_FLAGS_imx8mp-hummingboard-pulse := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-ripple.dtb
+DTC_FLAGS_imx8mp-hummingboard-ripple := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-iota2-lumpy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-bl-osm-s.dtb

-- 
2.51.0

