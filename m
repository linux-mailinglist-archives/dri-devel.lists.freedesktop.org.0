Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6725CC3FC8B
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E607410EAA3;
	Fri,  7 Nov 2025 11:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="UbiTbSek";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="UbiTbSek";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11023107.outbound.protection.outlook.com
 [52.101.83.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0EE210EAA0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 11:46:54 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iW9gxf+1Ta4+SMCtkHYO2JuVKb8Xq9xPvtqmNutBKYJa9S66dYi4cHdNKZ8k/WVyrmNDdzV9bbnt8TM8GSiVCg3QBD6nXv5xhqnLfyQj6SUyKa8S43MCfg8oW87d/8PPR93ckMX4AKVcrEwtnvh+V8MrQahyuJGes5vYaLn94vhTKkQO+vwR6ge7AWds0gz7l8eUqrJT4KVnUJhCDoVJCXzz9ntrCD84760WFusplQY3lwdFfuf9lNsxyUdIcNNGpuTA1DQs1E/V8B2uAxD18isere09lSZvKD1H4/ZqCZlujntNlXwp5UsyiQAPiS8t3tklkKkrD901McIwYN/vcw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpssOqSs1rnI8EHQSsilbLBLKcXoMz1McwKlBYykzuA=;
 b=X2BC/ez89mYtZht0xXxBYE1Y6cpNiM4YmyGOXDG6GcaDGincYVb9kLJ3M59SgEjFDBeZNsmjXeLIeO/dbTjVZ108K1bzXf4s6OP9m8Z9qSi1JDJ87q6oqlGzkmnRsdOOuDfP+Eu7wt1OIFoFdFHFhYRtfaDWNx3QJOquFzhmNEJwMbjIpxHiqyErnm3NfWcfa0jJx3eV6u0FWbCrqKGZyMNNTQPVO1bESYADfpCTX83TfUzH38Pc/pgvAqD2Ez5+hpqfT486LIeAC1a4gggVz7XOuYdNP/XVNdxtaLMXqkj9vG23IeY3RaUb38Kp672KCCS0gn1wX22mEjNH6o5Khw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpssOqSs1rnI8EHQSsilbLBLKcXoMz1McwKlBYykzuA=;
 b=UbiTbSekaJ3p6v+CBvGVb/Dh35bJBS9Is4z3An3tpgT/P4yyCfMGErnkxaR1K+wkK2Et7y3n5XlHJfi5U5VntJPlc9ILTN/yWjlUYnGu7ByiGvagwydAnS0FZ6LV2AOos0FF/c0LjxRkatd7/aZF/I91LSuAxByZvfVq0+k38Iw=
Received: from DU2PR04CA0319.eurprd04.prod.outlook.com (2603:10a6:10:2b5::24)
 by DBBPR04MB7514.eurprd04.prod.outlook.com (2603:10a6:10:1f7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Fri, 7 Nov
 2025 11:46:51 +0000
Received: from DU2PEPF0001E9C4.eurprd03.prod.outlook.com
 (2603:10a6:10:2b5:cafe::d9) by DU2PR04CA0319.outlook.office365.com
 (2603:10a6:10:2b5::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 11:46:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF0001E9C4.mail.protection.outlook.com (10.167.8.73) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6 via
 Frontend Transport; Fri, 7 Nov 2025 11:46:49 +0000
Received: from emails-8820836-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-176.eu-west-1.compute.internal [10.20.6.176])
 by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id A44C58065F; Fri,  7 Nov 2025 11:46:49 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1762516009; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=EpssOqSs1rnI8EHQSsilbLBLKcXoMz1McwKlBYykzuA=;
 b=j5+Cssp7Aoq2pKHxkrOm4DdgKQBy0hTMOFujoeVwRoTDfNqIkSZxiz/enXEaQuNFut0hb
 KLzPM5FR88yyPzPr0kgMZFBHo4ekUTgNDEe9ZGP1j+tBvaTrtDpw+OU7iJWZcX/3lUDrT57
 CIaEBCn6ul/mt6AtkdeGvHic/317rRs=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1762516009;
 b=AVj++c28/xEW1RnB4ZkCYWVsq7L8ZfnTx+NeRbfrIcKCR43rYbnWF0O1o60Sfgt9NSi9E
 grgdeZeqX2vJ8lJEGxtsXfgoSNslPzWRnjNxMhSzwv9zWxc4yT/YJ6HkS0BqBE9INzEB6B9
 Wl5rUQF6bI7hNpKawJpnG9FjjIJ9dIE=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgoFbpr/Nb81dFtSGY6OhuciGe1SdaX7dUVEg0TL83bVa39ffwxa6KjL29LaSruwok5rBczmZyn6DUinlpI/4NhzZOYyK4dzbd0ZHAdGIKc8yEM8FudiWoJocQxYNuhISkCHa8Xrixqv8PnDDgyy1SbpQyC7DURq3N4x8CMl6mRL2MuxOLEBMxTRf4/Brchftn0jMfiZsnIW9Oevr0i2GsuXZcYGC3oGa2SJadLuz9hPbP++XCOGC3AlvI7qlslxGcXPxj9O32qHGjIt7bgOIFc4RQWe7baQCq3vKzHTyt4PTpKKXVpL4Xv5MF0Y1A/jSYyHFIIbzkFTZDBYwp00UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpssOqSs1rnI8EHQSsilbLBLKcXoMz1McwKlBYykzuA=;
 b=MrDSwCnRxhu3MJOZcqpqCE59TMBqw28l3+/FmJnAa9r3b2X5E3REH3ABKs/EFUy/DWIu0et1hWNxAlF513YE0EVuXWo4yr3kFFw4KplzOSUZiVRofRG+nqNESdUKEdwzbP63KwJeZZlYwxNkW4KxzDi8Es7JXUlNX/w4eB8YB9bAE8teLKHLnKJhf5WOGQPY2vuXliABhnEyPU8EcuSKVnEd/MGsQIo86VzIdjhHT20c+auAn7mZruj00CI0FUPKqo7ZdpM1g/jry1e8E7ghaxmpJM9k4rGrgXHiuGiN2HmDlUZswHyB/r4nUI6cNaf7dUF6tYqxOQqhV7Vp/7kZAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpssOqSs1rnI8EHQSsilbLBLKcXoMz1McwKlBYykzuA=;
 b=UbiTbSekaJ3p6v+CBvGVb/Dh35bJBS9Is4z3An3tpgT/P4yyCfMGErnkxaR1K+wkK2Et7y3n5XlHJfi5U5VntJPlc9ILTN/yWjlUYnGu7ByiGvagwydAnS0FZ6LV2AOos0FF/c0LjxRkatd7/aZF/I91LSuAxByZvfVq0+k38Iw=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM8PR04MB7297.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 11:46:39 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 11:46:39 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 07 Nov 2025 12:46:17 +0100
Subject: [PATCH v2 10/11] arm64: dts: add description for solidrun
 solidsense-n8 board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-imx8mp-hb-iiot-v2-10-d8233ded999e@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM8PR04MB7297:EE_|DU2PEPF0001E9C4:EE_|DBBPR04MB7514:EE_
X-MS-Office365-Filtering-Correlation-Id: 1176b04b-eb31-4cf1-782a-08de1df3567d
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?T3pyS0lEb3ZQcHlrMEFidmorcWhqWmpPQVJWS1hzNkE4U1RjNDhRVXNMcnlm?=
 =?utf-8?B?R1hQZHdGd05DVXorMWpJbHgxUVNxM2ppOTRrWURMSktYMzI0eG5RN2V4b2FV?=
 =?utf-8?B?YU5CZ3U2dXlaU3lQSi9BajcrT2pCZXhkcEY1NTdPbnJjYk9tQWpJejN2VGkv?=
 =?utf-8?B?d056Rk9MaDlDQmYzZklUa0lveFpTeStYU1FZR1N0cUxwUkZqb1ZjZk5HUHZJ?=
 =?utf-8?B?dUV3SGtvdnRrMGs4R0RmOEpFRjViKzkxclY4NWhTTkJvOCswUXBxUy9RVjBu?=
 =?utf-8?B?UXplT3hDRlFYSzRYY29pOFQydzRlUy9VK3lsL3FmUzJ2cnpVWStpS29XMlB4?=
 =?utf-8?B?OUtTUzJnTWM2a2lOajZWektkY2hralVzWkgrSTB4R3dKRkZiVGZxTXBXQ2Nn?=
 =?utf-8?B?b3U3M0pKS3VyTXpTSWc2SmlMenoyaFRXVXhJTEdvTFVHSGxyVGJ3K0gycFVT?=
 =?utf-8?B?dFZydW5DUVJBanRGWEVhSVpkeEc5OHBJVzVWZ1ZzeVFsRmxhRUxxVFYxV1N0?=
 =?utf-8?B?Z0U4VHJXYmZlQ0hDc0wxRXR0TlRkc0ZTQTNreUt1TUF3RTVhbGkzVTJuY0Vv?=
 =?utf-8?B?Qy9jWXNXdmJEWUdsTDVUUDN4YXFjZm5sN1ZMOFRUeUhncHhiTlZWNHdObitu?=
 =?utf-8?B?QnZxVTVsQURrbE1Id2R0NEVRRXN1MDdqZmNtWjVkQWpYZ2VmbjhNQnhHa2Qr?=
 =?utf-8?B?MHhweE5iMHNndWdURDFqR0ZON21NR2pXNGoxcm1DTTM1OW9SR0tTbEVkU2tj?=
 =?utf-8?B?SUsxbUdlbmtCN1BKajBSb1JSdVppNnVscXhEOVVBKzlOVlpVWEx5ME1qbkYw?=
 =?utf-8?B?NFAyT0FUSE5FS3VZeVpGOWJNdkZXSGVESzNLRlZ1eHl0SkcxajF5S0xiY2Y2?=
 =?utf-8?B?eStNNlZGVlhBZUx5b2VEOVVXcGloTWpNRzVLWGNvaUE0SE5hSjhlM1ROYVRK?=
 =?utf-8?B?QjZnSHIyZ2RCWlFPZU94ckM3dVUwTkxwejZzNXJpU1NyOVQvTWR6SkJHRXB4?=
 =?utf-8?B?ajlta0VCSHA2cTVzSVVOYXNIcHZTQXRiS05Gc24vWHJxbGNvOXJDaEtMdnl4?=
 =?utf-8?B?ajNvd1lqMFVDbEVidm9hUzFWTzQ4Sklyc3kvWFNpL3F4cmFyQU55cm90UGx5?=
 =?utf-8?B?TnNHY3FRQ2FmK2hyM3k2SzUxbnJwd2JyNzdHKzk0NlFHcldmVXY0NVNNQnRO?=
 =?utf-8?B?eE5YQ0NaOWFDdkxQajQ1Sml5YjhpVVN1WHpXWmNoc3h5SGFBUWV3L2RTa3dm?=
 =?utf-8?B?eG44MzFCRHlMU0U4aTRjOWtzeXVGRzJvdDJESWVydy85QWxWdFpHQm1xYWhu?=
 =?utf-8?B?OUVXZGNqWUkyVE84MXY3aitrRkFvR1lVTjYzL2NDa2t3a2dzUDRURzNWS0li?=
 =?utf-8?B?c3pQMm9ZNjBEOWE2R2J2Q01HTjZ5cmlmWHJobUZUMnRzMlhsdm1ubkZnNUNF?=
 =?utf-8?B?eVdQcGkvSVd0UmoyM0tldzB2aThnZVpGS3BqTFBOSUJRZW1VVEkxS1ZrMko4?=
 =?utf-8?B?bytTYXFDMFhpWmgzeUNGaGdZVElwbk5MVVI5cTkxL3k0Rlc1Z1FCNDZOYzdu?=
 =?utf-8?B?NmIvQzlTOVBGODVoRWJQWjNEZmtWb1dpVUJqdWJtN0tDaU5BczlLTkVZMGJR?=
 =?utf-8?B?elRJVE1TQnp1Q3dMS0pjR3B5NStFaEpNbUxydnM5WUI1bmRSTmpaZ21heGE4?=
 =?utf-8?B?SVlxWXFaaUtoTXlmZzB0MlZnd3VlMU5HTFVscmhRN2JTaUdMb2ptOHoxaFk4?=
 =?utf-8?B?aHd4U05nZ3o5ckEwQnBKdlo4NXBrTVJXWkhpcklMeGZOK0FVMVVuY29pdFFC?=
 =?utf-8?B?ZHRTR3IrWTl5Ulo5RGNac0x3ZWtMbjJiUElyWnZoSzVSdkl2aG02WWZBbFVU?=
 =?utf-8?B?TEhYdXVrZHVTcldhVklQKzF1OVRZR2hrcUgwb0tMK3gwWER2UGdUL2tMUzFG?=
 =?utf-8?B?WWZNaHpGSkhCSGwzejFJRDI0NVJIeHpaL3JFbkVTRDB0V0dGcEJoTm11dGtJ?=
 =?utf-8?B?d3FZOVZ1dWtXakF5K01SU0ZEeXJaRFZlQ2VzV0oyRS9MLytJZVZqdTNPcWdZ?=
 =?utf-8?B?OGw3NHdGVGtmcm1XNHpsM0VBb3E0ODZqMDA5Zz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7297
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: b5c469941b904f30a95fbea828299e28:solidrun,
 office365_emails, sent, inline:55f0baf1cfcf9deef26c3f5032cf7141
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e6d9070d-8a35-42fe-5bcd-08de1df3503f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|14060799003|35042699022|36860700013|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUQ5MW5OaThLRjlIalREUjlmRkV2L3VPekNadVJLTVFmdUc0bDZDUGpJTytL?=
 =?utf-8?B?N1hUN1pJbVdlYTJ1OHVsZ3p5cGRTRmJnZVZkS0V2V2RJcDVNcW1QeTR4VHZk?=
 =?utf-8?B?Mmp2Vmd2dWtTUktQL1gxOFo3THErVUlWQjZpdDJOOVk3OGcxbWxhU0NxT2g1?=
 =?utf-8?B?cGtmalNaUERhQnQxTXVUMTYxUGNKNDZrWVRvNFFsdG4ybU5qdmZuUDIycDRk?=
 =?utf-8?B?OGJHNFVFUExBWEdJNXBzSGpFb01aUW5MK2VSczhoMkNKQ3pIZFZ3UnRuaUth?=
 =?utf-8?B?dGY3M0FIZ2pnMm93RXNqemw0bU9lRVFsZ3RtRHFMZ1hUak9XclRrdTRISGg4?=
 =?utf-8?B?cVVWQ3h2b002ZVFxYXU2b0s4ZXBIdlcwOUM1dE5mRkU2OFdpaHRUclhmRGh1?=
 =?utf-8?B?SUR0ZnA2Y3Vaem1CVU5nNlFpZUlsQ2ZPYjBSVFV1Z09Sc2doK2wzOW9VeHV2?=
 =?utf-8?B?UnVGT2FzNFRhMzczUHBZai9yb1RWZXRHOUxuUVhQd1llYnY2cTJ4bVFnWldq?=
 =?utf-8?B?eDNBL0VpVGFpRmVhVDM0MkllNWNmakUyOWx1L2pjVUU1RTR1MjVIdXBEWnBU?=
 =?utf-8?B?d29SSFFrTmhjUG0zL1ZRSEF5RGhUSklvU2wrSDAzOU9zeERBYXdQRnI2TXgw?=
 =?utf-8?B?ZklOY3BENTJ1T1IzSnh2RGw0YlNWUkRIUFZXTnVrc3Z5RGZUVlZoMm44STVB?=
 =?utf-8?B?Z3BzdVRYdHZZS1BsbEw0Y0gxaGVPYklPblYvSmFiQ3NUSG9MYmQ4dHlPVzBs?=
 =?utf-8?B?aVR1amlaZWpiZ1VCR0pibkdHWFhOU2V2T3ZlZ3o0Ui83Y0VVcGZTOTZlKzVx?=
 =?utf-8?B?RHN5ODNSZHpCSGswdEtVeW5wakZPbVY3dmMyOFRYMkU5ZzlIaFFCZ2FmVHpi?=
 =?utf-8?B?MlNGbE1nMm5ab010QVYzRzA5UnhCUTg5VjFNamI4cXdPa3I1UXlsNG9XSlYy?=
 =?utf-8?B?dUV5b1VQQ3NMNnlwMXk0T1pVb1VubTBBOHVObkhJci9vbkoweDFVRWJNTkZC?=
 =?utf-8?B?dTRSUG1xVm41OFdYelFiRllFdzZJN2hXQnVxNkg4YVpQaHpROGpsdzNOMHFQ?=
 =?utf-8?B?eHZUU0ZTM0g4RjUyQUdLUjBxVWlVb1hvaEMrd0c2bzE1c1lUN1BWNjdLR3VT?=
 =?utf-8?B?V05EUlpvWU9tMEg5N0NuZEExZEcvbDVONUlabmluNUgxVGNDR21pWXE3Uzhk?=
 =?utf-8?B?c0ZmdnRIL0tQbHJqMFpaMlFLLys5YmxtV0ltTENLVm9WcE1TcUdZV0xWNUNI?=
 =?utf-8?B?QlJmUVBIRmRaM1hrVDlEUGttVFRxb0RDM1VJYWczT25KTWJNaWlZL0ZzRkZz?=
 =?utf-8?B?UVFKUDFpcXlxamdhNkNFZ0o5TDh0TnRyQnBzdDBjZEVQZFVxUDNJVzVTaWJJ?=
 =?utf-8?B?aFFmRXhpZUd6Tkx3eS85WXFxYmNjaVhLeTJneXpnWTZWaktzODc2UE4zQzZu?=
 =?utf-8?B?a0xtR2dWS3J0WDQyZ05FL2RsVC8rRm5KajNuR0tXUkM0SVo5NWhFazhoM0pK?=
 =?utf-8?B?UWVsYitVRWV3aG9jbW5pSUwxZGZoR0Job0FvWEZrdjNjRThKbnF4cGNJMHRZ?=
 =?utf-8?B?b3Q5ZkUxelJZckhEY2ZrdkViUllWcDA4US9lK0VwcTkyZDJubFcwQXRsRDk0?=
 =?utf-8?B?cmhBRWZRNTJoTnFLYWVEODF1Sk1QRkE1OXFrOWxLRmpGK3FZNHlmTG1XNkhl?=
 =?utf-8?B?bVFhWk9zNWJkR3pkS0YxN2hMcTlqVEVKbnRLRldMQW5ydHljVWZkcldZODZi?=
 =?utf-8?B?dFFvUDF5akIxV0EyWldzMTFFMDlXWGpNTlcrZVZCeGVaRnRTZlZYMVFUc2Y4?=
 =?utf-8?B?V1o1bjRtTElOVEk5S3g2ZFJPZXVBVFFwZHpaQ1JGS2tPcFU3aktudVBQV3NE?=
 =?utf-8?B?dnB4OXNDY2dBMDNacEoyS2dRQytnNkZTVjRGc0ZTSzV6MllFYXlBUXJtNnVG?=
 =?utf-8?B?MjBqeUhmN0tqT2xwMVdzTEQrVDJBbG45MEZpNnNHbEpIemFPS2VyS09sK2xP?=
 =?utf-8?B?UW1yd1VQUk1TZVBwTnduOHpQRGVSTmtNZHNiSWJyZXRSdzBEa0FhcFN0U3Mr?=
 =?utf-8?B?dXg2N0tFTm04Q1RNWlE5NUd0bEllTmwrakpmTHdVZzI5ZWl5a1FnS3pVbThh?=
 =?utf-8?Q?bWWy9x5s5yLyhbo45cDgrSqUY?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(82310400026)(14060799003)(35042699022)(36860700013)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 11:46:49.8084 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1176b04b-eb31-4cf1-782a-08de1df3567d
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7514
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

Add description for the SolidRun SolidSense N8 Compact.
The board is designed around the i.MX8MN SoC and comes as a complete
product including enclosure and labels.

Features:
- USB-2.0 Type A connector
- 1Gbps RJ45 Ethernet with PoE
- microSD connector
- eMMC
- Cellular Modem + SIM holder
- WiFi + Bluetooth
- RS485
- CAN
- 802.15.1 radio
- supercapacitor backup power supply

This is a headless design without display.
The board includes an internal expansion connector for daughterboards
which may be described by dt addon.

The supercap is not currently described due to lack of suitable bindings.
Vendor BSP uses gpio-keys driver to trigger shutdown on power loss.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../dts/freescale/imx8mn-solidsense-n8-compact.dts | 853 +++++++++++++++++++++
 2 files changed, 855 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index d414d0efe5e74..c56137097da3b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -181,6 +181,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mn-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-ddr3l-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-ddr4-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-rve-gateway.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mn-solidsense-n8-compact.dtb
+DTC_FLAGS_imx8mn-solidsense-n8-compact += -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-venice-gw7902.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dts b/arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dts
new file mode 100644
index 0000000000000..93396e22ba409
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dts
@@ -0,0 +1,853 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Device Tree file for SolidSense N8 Compact
+ *
+ * Copyright 2024 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+
+#include "imx8mn.dtsi"
+
+/ {
+	model = "SolidRun SolidSense N8 Compact";
+	compatible = "solidrun,solidsense-n8-compact", "fsl,imx8mn";
+
+	aliases {
+		gpio5 = &expander;
+		rtc0 = &rtc;
+		rtc1 = &snvs_rtc;
+		usb0 = &usbotg1;
+		watchdog0 = &wdog1;
+		watchdog1 = &rtc;
+	};
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	/* LED labels based on enclosure, schematic names differ. */
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins>;
+
+		/* D20 */
+		led1 {
+			label = "led1";
+			gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		/* D18 */
+		led2 {
+			label = "led2";
+			gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		/* D19 */
+		led3 {
+			label = "led3";
+			gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
+
+	memory@40000000 {
+		reg = <0x0 0x40000000 0 0x80000000>;
+		device_type = "memory";
+	};
+
+	reg_modem_vbat: regulator-modem-vbat {
+		compatible = "regulator-fixed";
+		regulator-name = "modem-vbat";
+		pinctrl-names = "default";
+		pinctrl-0 = <&regulator_modem_vbat_pins>;
+		regulator-min-microvolt = <3800000>;
+		regulator-max-microvolt = <3800000>;
+		gpio = <&gpio3 25 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	/* power to lte modems behind hub ports 2/3 */
+	reg_modem_vbus: regulator-modem-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "modem-vbus";
+		pinctrl-names = "default";
+		pinctrl-0 = <&regulator_modem_vbus_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio5 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	/* power to usb hub, and type-a behind hub port 1 */
+	reg_usb1_vbus: regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1-vbus";
+		pinctrl-names = "default";
+		pinctrl-0 = <&regulator_usb1_vbus_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio5 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_vdd_1v8: regulator-vdd-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_vdd_3v3: regulator-vdd-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "usdhc2-vmmc";
+		pinctrl-names = "default";
+		pinctrl-0 = <&regulator_usdhc2_vmmc_pins>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_vdd_3v3>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		off-on-delay-us = <250>;
+	};
+
+	rfkill {
+		compatible = "rfkill-gpio";
+		label = "rfkill-wwan";
+		radio-type = "wwan";
+		pinctrl-names = "default";
+		pinctrl-0 = <&modem_pins>;
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+	};
+
+	usdhc1_pwrseq: usdhc1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&A53_0 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&A53_1 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&A53_2 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&A53_3 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&ddrc {
+	operating-points-v2 = <&ddrc_opp_table>;
+
+	ddrc_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-266500000 {
+			opp-hz = /bits/ 64 <266500000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+		};
+	};
+};
+
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ecspi2_pins>;
+	/* native chip-select causes reading 0xffffffff */
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	num-cs = <1>;
+	status = "okay";
+
+	can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&can_pins>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+		clocks = <&clk IMX8MN_CLK_CLKOUT1>;
+		/* generate 8MHz clock from soc-internal 24mhz reference */
+		assigned-clocks = <&clk IMX8MN_CLK_CLKOUT1_SEL>,
+			  <&clk IMX8MN_CLK_CLKOUT1_DIV>;
+		assigned-clock-rates = <0>, <8000000>;
+		assigned-clock-parents = <&clk IMX8MN_CLK_24M>, <0>;
+	};
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&fec1_pins>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy4>;
+	local-mac-address = [00 00 00 00 00 00];
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/*
+		 * Depending on board revision two different phys are used:
+		 * - v1.1: atheros phy at address 4
+		 * - v1.2+: analog devices phy at address 0
+		 * Configure first version by default.
+		 * On v1.2 and later, U-Boot will enable the correct phy
+		 * based on runtime detection and patch dtb accordingly.
+		 */
+
+		/* ADIN1300 */
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+			reset-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10>;
+			reset-deassert-us = <5000>;
+			interrupt-parent = <&gpio1>;
+			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+			adi,link-st-polarity = <GPIO_ACTIVE_LOW>;
+			adi,led-polarity = <GPIO_ACTIVE_LOW>;
+			status = "disabled";
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@0 {
+					reg = <0>;
+					color = <LED_COLOR_ID_YELLOW>;
+					function = LED_FUNCTION_LAN;
+					default-state = "keep";
+					active-low;
+				};
+			};
+		};
+
+		/* AR8035 */
+		phy4: ethernet-phy@4 {
+			reg = <4>;
+			reset-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			status = "okay";
+		};
+	};
+};
+
+&gpio5 {
+	usb-hub-reset-hog {
+		gpio-hog;
+		gpios = <3 GPIO_ACTIVE_LOW>;
+		output-low; /* deasserted */
+		line-name = "usb-hub-reset";
+	};
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+
+	pmic@4b {
+		compatible = "rohm,bd71847";
+		reg = <0x4b>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_pins>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		rohm,reset-snvs-powered;
+
+		#clock-cells = <0>;
+		clocks = <&osc_32k>;
+		clock-output-names = "clk-32k-out";
+
+		regulators {
+			BUCK1 {
+				// supplies soc vdd, soc mipi vdd @ 0.9V
+				regulator-name = "buck1";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+				rohm,dvs-run-voltage = <850000>;
+				rohm,dvs-suspend-voltage = <750000>;
+			};
+
+			buck2_reg: BUCK2 {
+				regulator-name = "buck2";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+				rohm,dvs-run-voltage = <1000000>;
+				rohm,dvs-idle-voltage = <900000>;
+				rohm,dvs-suspend-voltage = <0>;
+			};
+
+			BUCK3 {
+				// BUCK5 in datasheet
+				// output floating
+				regulator-name = "buck3";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1350000>;
+			};
+
+			BUCK4 {
+				// BUCK6 in datasheet
+				// supplies ldo3, ldo5, muxsw
+				regulator-name = "buck4";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			BUCK5 {
+				// BUCK7 in datasheet
+				// supplies ldo4, ldo6, muxsw
+				// enables dram vpp @ 2.5V
+				regulator-name = "buck5";
+				regulator-min-microvolt = <1605000>;
+				regulator-max-microvolt = <1995000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			BUCK6 {
+				// BUCK8 in datasheet
+				// supplies dram @ 1.2V
+				regulator-name = "buck6";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO1 {
+				// supplies soc snvs @ 1.8V
+				regulator-name = "ldo1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO2 {
+				// supplies soc snvs @ 0.8V
+				regulator-name = "ldo2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <900000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO3 {
+				// supplies soc vdd @ 1.8V
+				regulator-name = "ldo3";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO4 {
+				// output floating
+				regulator-name = "ldo4";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			LDO5 {
+				// output floating
+				regulator-name = "ldo5";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			LDO6 {
+				// supplies soc vdd mipi @ 1.2V
+				regulator-name = "ldo6";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	/*
+	 * routed to various connectors:
+	 * - basler camera (CON2)
+	 * - touchscreen (J3)
+	 * - expansion connector (J14)
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+	status = "okay";
+};
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+	status = "okay";
+
+	expander: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_expander_pins>;
+		reset-gpios = <&gpio3 16 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "SYSGD", "PFO#", "CAPGD", "CAPFLT#",
+				  "CHGEN#", "BSTEN#", "", "";
+	};
+
+	light-sensor@44 {
+		compatible = "isil,isl29023";
+		reg = <0x44>;
+	};
+
+	accelerometer@53 {
+		compatible = "adi,adxl345";
+		reg = <0x53>;
+	};
+
+	/* battery-charger@68 */
+
+	rtc: rtc@69 {
+		compatible = "abracon,abx80x";
+		reg = <0x69>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtc_pins>;
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
+&i2c4 {
+	/* routed to expansion connector (J14) */
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pins>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&tamper_pins>, <&usb_hub_pins>;
+
+	ieee802151_radio_pins: pinctrl-ieee802151-radio-grp {
+		fsl,pins = <
+			/* RESETN */
+			MX8MN_IOMUXC_GPIO1_IO05_GPIO1_IO5	0x0
+			/* VDD_EN */
+			MX8MN_IOMUXC_GPIO1_IO06_GPIO1_IO6	0x0
+			/* SWDCLK */
+			MX8MN_IOMUXC_GPIO1_IO14_GPIO1_IO14	0x0
+			/* SDIO */
+			MX8MN_IOMUXC_GPIO1_IO15_GPIO1_IO15	0x0
+		>;
+	};
+
+	can_pins: pinctrl-can-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SAI3_TXD_GPIO5_IO1		0x140
+		>;
+	};
+
+	ecspi2_pins: pinctrl-ecspi2-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_ECSPI2_SCLK_ECSPI2_SCLK	0x96
+			MX8MN_IOMUXC_ECSPI2_MOSI_ECSPI2_MOSI	0x1d6
+			MX8MN_IOMUXC_ECSPI2_MISO_ECSPI2_MISO	0x1d6
+			MX8MN_IOMUXC_ECSPI2_SS0_GPIO5_IO13	0x1d6
+		>;
+	};
+
+	fec1_pins: pinctrl-fec1-grp {
+		/*
+		 * Some pins are sampled at phy reset to apply configuration:
+		 * - AR803x PHY (revision 1.1)
+		 *   - RXD[1:0]: phy address bits [1:0]
+		 *   - RXD[3:2],RX_CTL: mac interface select bits 3,1,0
+		 * - ADIN1300 PHY (revision 1.2 or later)
+		 *   - RXD[3:0]: phy address bits [3:0]
+		 *   - RX_CTL,RXC: mac interface select bits 1,0
+		 * SoC enables pull-down at reset, PHYs have internal
+		 * pull-down, so pinmux may unset pull-enable.
+		 */
+		fsl,pins = <
+			MX8MN_IOMUXC_ENET_MDC_ENET1_MDC			0x2
+			MX8MN_IOMUXC_ENET_MDIO_ENET1_MDIO		0x2
+			MX8MN_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x1e
+			MX8MN_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x1e
+			MX8MN_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x1e
+			MX8MN_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x1e
+			/* RD[3:0] sampled at phy reset for address bits [3:0] */
+			MX8MN_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x90
+			MX8MN_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x90
+			MX8MN_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x90
+			MX8MN_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x90
+			MX8MN_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x10
+			MX8MN_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x90
+			MX8MN_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x90
+			MX8MN_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x10
+			/* phy reset */
+			MX8MN_IOMUXC_SAI5_RXFS_GPIO3_IO19		0x0
+			/* phy interrupt */
+			MX8MN_IOMUXC_GPIO1_IO10_GPIO1_IO10		0x140
+		>;
+	};
+
+	gpio_expander_pins: pinctrl-gpio-expander-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_NAND_READY_B_GPIO3_IO16	0x140
+			MX8MN_IOMUXC_SD1_STROBE_GPIO2_IO11	0x140
+		>;
+	};
+
+	i2c1_pins: pinctrl-i2c1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL		0x400001c2
+			MX8MN_IOMUXC_I2C1_SDA_I2C1_SDA		0x400001c2
+		>;
+	};
+
+	i2c2_pins: pinctrl-i2c2-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C2_SCL_I2C2_SCL		0x400001c2
+			MX8MN_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c2
+		>;
+	};
+
+	i2c3_pins: pinctrl-i2c3-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c2
+			MX8MN_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c2
+		>;
+	};
+
+	i2c4_pins: pinctrl-i2c4-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C4_SCL_I2C4_SCL		0x400001c2
+			MX8MN_IOMUXC_I2C4_SDA_I2C4_SDA		0x400001c2
+		>;
+	};
+
+	led_pins: pinctrl-led-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO11_GPIO1_IO11	0x100
+			MX8MN_IOMUXC_GPIO1_IO12_GPIO1_IO12	0x100
+			MX8MN_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x100
+		>;
+	};
+
+	modem_pins: pinctrl-modem-grp {
+		fsl,pins = <
+			/* RESET_N: modem-internal pull-down */
+			MX8MN_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x0
+			/* PWRKEY: pull-down ensures always-on */
+			MX8MN_IOMUXC_GPIO1_IO08_GPIO1_IO8	0x100
+		>;
+	};
+
+	pmic_pins: pinctrl-pmic-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x140
+		>;
+	};
+
+	regulator_modem_vbat_pins: pinctrl-regulator-modem-vbat-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SAI5_MCLK_GPIO3_IO25	0x0
+		>;
+	};
+
+	regulator_modem_vbus_pins: pinctrl-regulator-modem-vbus-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SPDIF_RX_GPIO5_IO4		0x0
+		>;
+	};
+
+	regulator_usb1_vbus_pins: pinctrl-regulator-usb1-vbus-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5	0x0
+		>;
+	};
+
+	regulator_usdhc2_vmmc_pins: pinctrl-regulator-usdhc2-vmmc-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x0
+		>;
+	};
+
+	rtc_pins: pinctrl-rtc-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO01_GPIO1_IO1	0x140
+			MX8MN_IOMUXC_SAI3_RXFS_GPIO4_IO28	0x100
+		>;
+	};
+
+	tamper_pins: pinctrl-tamper-grp {
+		/*
+		 * Routed to physical tamper input (J12),
+		 * accelerometer and light-sensor interrupts.
+		 */
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9	0x140
+		>;
+	};
+
+	uart1_pins: pinctrl-uart1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
+			MX8MN_IOMUXC_UART1_TXD_UART1_DCE_TX	0x140
+			MX8MN_IOMUXC_UART3_RXD_UART1_DCE_CTS_B	0x140
+			MX8MN_IOMUXC_UART3_TXD_UART1_DCE_RTS_B	0x140
+			/* BT_REG_ON */
+			MX8MN_IOMUXC_SD1_DATA4_GPIO2_IO6	0x0
+			/* BT_WAKE_DEV */
+			MX8MN_IOMUXC_SD1_DATA5_GPIO2_IO7	0x0
+			/* BT_WAKE_HOST */
+			MX8MN_IOMUXC_SD1_DATA6_GPIO2_IO8	0x100
+		>;
+	};
+
+	uart2_pins: pinctrl-uart2-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_UART2_RXD_UART2_DCE_RX	0x140
+			MX8MN_IOMUXC_UART2_TXD_UART2_DCE_TX	0x140
+		>;
+	};
+
+	uart3_pins: pinctrl-uart3-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_ECSPI1_MOSI_UART3_DTE_RX	0x140
+			MX8MN_IOMUXC_ECSPI1_SCLK_UART3_DTE_TX	0x140
+			MX8MN_IOMUXC_ECSPI1_MISO_UART3_DTE_RTS_B	0x140
+			MX8MN_IOMUXC_ECSPI1_SS0_UART3_DTE_CTS_B	0x140
+		>;
+	};
+
+	uart4_pins: pinctrl-uart4-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
+			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
+		>;
+	};
+
+	usb_hub_pins: pinctrl-usb-hub-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SPDIF_TX_GPIO5_IO3		0x0
+		>;
+	};
+
+	usdhc1_pins: pinctrl-usdhc1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x190
+			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d0
+			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d0
+			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d0
+			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d0
+			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d0
+			/* wifi refclk */
+			MX8MN_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x0
+			/* WL_WAKE_HOST */
+			MX8MN_IOMUXC_SD1_DATA7_GPIO2_IO9	0x100
+			/* WL_REG_ON */
+			MX8MN_IOMUXC_SD1_RESET_B_GPIO2_IO10	0x0
+		>;
+	};
+
+	usdhc2_pins: pinctrl-usdhc2-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+			MX8MN_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+			/* usdhc2 signalling voltage pmic control */
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+		>;
+	};
+
+	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+			MX8MN_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+			/* usdhc2 signalling voltage pmic control */
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+		>;
+	};
+
+	usdhc2_200mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+			MX8MN_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+			/* usdhc2 signalling voltage pmic control */
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+		>;
+	};
+
+	usdhc3_pins: pinctrl-usdhc3-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK	0x190
+			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d0
+			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d0
+			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d0
+			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d0
+			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d0
+			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d0
+			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d0
+			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d0
+			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d0
+			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x190
+		>;
+	};
+
+	wdog1_pins: pinctrl-wdog1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x140
+		>;
+	};
+};
+
+/* Bluetooth */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+	uart-has-rtscts;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MN_CLK_UART1>;
+	assigned-clock-parents = <&clk IMX8MN_SYS_PLL1_80M>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		device-wakeup-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		max-speed = <3000000>;
+	};
+};
+
+/* console */
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	status = "okay";
+};
+
+/* RS485 */
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>;
+	uart-has-rtscts;
+	linux,rs485-enabled-at-boot-time;
+	fsl,dte-mode;
+	status = "okay";
+};
+
+/* 802.15.1 radio */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins &ieee802151_radio_pins>;
+	status = "okay";
+};
+
+&usbotg1 {
+	vbus-supply = <&reg_usb1_vbus>;
+	dr_mode = "host";
+	disable-over-current;
+	status  = "okay";
+};
+
+/* WiFi */
+&usdhc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usdhc1_pins>;
+	vmmc-supply = <&reg_vdd_3v3>;
+	vqmmc-supply = <&reg_vdd_1v8>;
+	bus-width = <4>;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	status = "okay";
+};
+
+/* microSD */
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc2_pins>;
+	pinctrl-1 = <&usdhc2_100mhz_pins>;
+	pinctrl-2 = <&usdhc2_200mhz_pins>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	broken-cd;
+	status = "okay";
+};
+
+/* eMMC */
+&usdhc3 {
+	/*
+	 * Use lowest drive strength for all high-speed modes to minimise
+	 * electro-magnetic emissions.
+	 * In this particular design HS-400 still works okay, no extra
+	 * pinctrl for 100mhz and 200mhz are required.
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&usdhc3_pins>;
+	vmmc-supply = <&reg_vdd_3v3>;
+	vqmmc-supply = <&reg_vdd_1v8>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&wdog1_pins>;
+	status = "okay";
+};

-- 
2.51.0

