Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DDFB2BBCA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 10:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D5010E21E;
	Tue, 19 Aug 2025 08:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="PjrZ4q7u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11023085.outbound.protection.outlook.com
 [40.107.162.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E266B10E21E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 08:26:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOobj7sHtqqyGpIYNARgAMhSYyDSME30UGrswtl4AJe9KHDCPz3OaPzog5hzgVDX39d4U0W2To7hx6AsCAFIrc5lIZMjOHHlGWnDhUmmHznN+igYiw4LyWln+03bEHtnEdNIgEpRal/lPcWxoPdhsIJmxFxfuylEd7g5vVtwTYMxDTJ064nYHdILcqT/b+b79c4PmZBRgAmZztZC/cNbZksFs3Lg5yLShk91Q+7K1jMn0fKMEmOOwC8yj/cdGje3ogrSkS0f2kgGg1rMRPLU3TGpTrtPFRg6ac/vJDeKKpz4OgtMItnlvXbpdyS2WRFDQJlfClkOeQuZbMZJkPPa3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WvK2zq02z8+SwUvemc2b7jC5w0xS14Lk8ffzKWYCo4=;
 b=afXejx2FdL+ZaxqmcRUQAO0hfE6vYEZ1c/bkxfcS7y6VYlNhUedfKO+Smh66DLTheuLcgQG1VYL+fH9OOER9zB2fxirBOL3ed+EbBcawhxTtJg6b5EEXk2SpnE6hEd6QotZyWG17JlFhKcemQqlSj2YEjT2PFnNL2aIHzN/zKsPkn4iSzn65OtYXAy1MoMp5bZn8voJqbSclKIOtNUrb9F6H5L1OIGEVBxySGkn8l0wENLwfkI+Ww7JsKPG2CeuGQU1o6w5S9hTggOtGxbAG5rT2ZasI5y52ihNNJCeYXMbZb39UIf/j6ACwr9QUDces+BXvd1DCVmhHuVyEWDanLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WvK2zq02z8+SwUvemc2b7jC5w0xS14Lk8ffzKWYCo4=;
 b=PjrZ4q7upEcu/W3bi3ACoN6TWoCUaD7ySst0cnigZ47pQDLIZHbJBzoKBXZsGNP8HMF8Xj8nXRh/WmvsXeC1S6EgkarvcFGymYGNcsVRIAKBdc3E04rd5PW7Ox+rzE4fxmDCsZIir3xN8gq3dW5GVUFjxfH0/B4E4dICbNr9toqSa3hYRaPsToCP9mzsMT+/Ua1DQB0lIm+8JoqChSr3xcyBCMFvjWWQn0GpnU6IRpTrZFbEfxcyTmTlNzlaF2tfGeiVKs2GNYHcpE1LJ7PCPAeEWhe7u6o/U/k/EBv0Yx8bFO8WIPkF0X/gsnX7smREpDzS0cpNZ/s3bvFB+6Y27Q==
Received: from AS4PR10CA0011.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::14)
 by DB8PR04MB6857.eurprd04.prod.outlook.com (2603:10a6:10:114::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 08:26:20 +0000
Received: from AM2PEPF0001C70C.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dc::4) by AS4PR10CA0011.outlook.office365.com
 (2603:10a6:20b:5dc::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.24 via Frontend Transport; Tue,
 19 Aug 2025 08:26:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AM2PEPF0001C70C.mail.protection.outlook.com (10.167.16.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Tue, 19 Aug 2025 08:26:20 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com (40.93.214.77) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Tue, 19 Aug 2025 08:26:19 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PAXPR04MB9124.eurprd04.prod.outlook.com (2603:10a6:102:22f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 08:26:16 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9052.012; Tue, 19 Aug 2025
 08:26:16 +0000
Message-ID: <2d694c9c-704e-4353-8b57-de83eb5a7f96@topic.nl>
Date: Tue, 19 Aug 2025 10:26:15 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI TMDS181
 and SN65DP159 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>
CC: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250812145256.135645-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.3b7d4319-e208-470d-9ada-585343a64822@emailsignatures365.codetwo.com>
 <20250812145256.135645-2-mike.looijmans@topic.nl>
 <20250812-designing-tyke-db85527b373d@spud>
 <f4ec7690-322e-493a-b346-7b9560ac0616@topic.nl>
 <9fba4917-a24f-4fee-8f1a-7509a0bc542e@kernel.org>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <9fba4917-a24f-4fee-8f1a-7509a0bc542e@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::19) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PAXPR04MB9124:EE_|AM2PEPF0001C70C:EE_|DB8PR04MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e75fe21-b6bb-4a92-bfd2-08dddefa1357
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?NmN4QTB0Z0ZYYWx4ZUxnQjFaVTB3cGlKMVNWVjgvZFFQMU5xNWlhTTBCOUVj?=
 =?utf-8?B?QlJwR2xoNWliTzduV01ERXRuYXNTeGxnazNnLzhZSzNsMlZKMXM3NFdtMWRx?=
 =?utf-8?B?QzExWGltd1VEMUpOZ216QkFnQ1hjZXhRaTBIYWlMaGNNdTYyUDZIUHkrd3hF?=
 =?utf-8?B?c0t4SnVURVBiSTFpck13Ri9rMWhhdjM5MldoYlVROGNSWnkyQm5WS2pxbExI?=
 =?utf-8?B?TldNaUVBVXN6cTdRTGVQNnU5WlRMcTNOMStLdkJOaHFJN2hqWGtQbTRSL3l5?=
 =?utf-8?B?alRBS2c2YStTWnljM3p6UGo4ckVyc1hTTFZ5eCtVdWdlaHdYc0NLMWZnZ3cy?=
 =?utf-8?B?ZmxZSjZIRkw4Mm5qQ001YXBaLytCeEh3MGE3Y3hzOFhPbW1sQVd2Y2RxSnJY?=
 =?utf-8?B?NVB2OHoxdUxqcWhyVVlOSFozM2dsbGQvb0l4SUI0SXp0eDBhSEJtb3NzZm9L?=
 =?utf-8?B?czRqR0hVYXRnYTB5SkZiaHcwQ01vR2xFV1EzaHV3KzdUejVsTlNrVHBoRm5W?=
 =?utf-8?B?YnFTMzk5aG1BTzYwVndpSGR1MmlUSHZMMzFsdXlveW1TcXE5Z1hhWTFkUnpG?=
 =?utf-8?B?aUF0MWVZeUtKYStCN0NodWRFNWFHQ2E2MHFFU1NodVlLeHpBcHVORkc1d1hT?=
 =?utf-8?B?UkhUQmpNKzdINXB6U1JPN0ZTWlcwL3VsQWNYaVc3dWxNMERvdmszSUlJREs5?=
 =?utf-8?B?Vng2cjl6dGtkWi9yai9kUnI4TmEzY3UvdTFKamdNdm9LSnNkY2owdUEvYmk1?=
 =?utf-8?B?ZmtKbWh2SG1od1ZYOHhiYjkvQjFkWVNLMmUvcVNKVGZzSHVUTG1IMHNDd3Z2?=
 =?utf-8?B?Wlo2TVc0WUkvWUNKbERHTzZ4ejJzRlZ0ZTVoN1JQQlJxbkFObm52VjkvWUoy?=
 =?utf-8?B?SzAvZjhPK3MyVERreHdtLzNkZDV4ODcwVFR1TFppSG45Q3N3TzIvREhrOTVW?=
 =?utf-8?B?YnpJVmJPaW51d2VHV05iYnlMK1ZLSFdBMU4wUUFOWktYMk5Sbi92SW9SYzJ2?=
 =?utf-8?B?RG1Ob091akFNcXo3enNaYU9VWXBtcW5PaUdrVFc1ZjM5M09YNm5uMDVJM0pm?=
 =?utf-8?B?ZWF0cExLUEVUdXRwZ3AxYjZsU2VQN0NsNk1wTlRmVUllR1JrdkxMRmRLZzBr?=
 =?utf-8?B?L2pDRFo5ZGU2c3dYM2ZCZHNjUDhqNUN5a0R0NVZreDV0NHZRME5ZdVl2TU5x?=
 =?utf-8?B?WFQ5bFZsZG9SbjVuS1lwdmk1U2FrSEE4TTgvemN6ekwvQ0dmdmZ5MGNyMEFw?=
 =?utf-8?B?WHRxcEx2MkgvekNVV0RmeVRIL1kweVhqMlZ4ajBBU1NDVXlNay92VGxXQWl4?=
 =?utf-8?B?Ym1BWmN5K0Y2eVdGZHlrSmd4QlZhZnZUWFJTZ0xqYk4rUU8waUwwV1VTYnBQ?=
 =?utf-8?B?U3RPelhWVDArcUkrR1RPWVdsR0t6aWNtNEhHYXphZ0NpcnNKTmZncjZocE13?=
 =?utf-8?B?OWxYQnIxL2twTXN2Z3JCdWlhWnI3WktDM3I1Y0toU1VVYmNpTTJpSHAyaHJZ?=
 =?utf-8?B?MTNMWGtrNFVnT0x3eE8wUzdMaWtJU2MvZ3RDTkFiWm1RamJZQVFEVE9SRHlt?=
 =?utf-8?B?OGE2UmIyejJFQzRPN1pnelVldi84ck1yclg2ZG1ubDVFc2xqWDZVNUxDVnE3?=
 =?utf-8?B?TXZlWHd2TXlOMEFjNGpBd2xPZjYwdTNwUG0rSHFRQ0wvQ1VyQTZ1andTTFhZ?=
 =?utf-8?B?MXhSN0taTFV2SERpYlY5blgveDJvWnh3eWVKZFR5TVV1a1dBcUlsRE5Vc2Vx?=
 =?utf-8?B?Y2RiVFA4REJ1ZS9RUFVHYThtZU5rRGEwemp6S21ZdHRTSGMyd0xURjRudTlK?=
 =?utf-8?B?bVg4OXoyRzZCU1BDWlpMK2JPcmVUb21aVVByL1MwS3VLRXNJRGdlR1dyWFd4?=
 =?utf-8?B?aC84NmtYU3plV3VTUVRMR0VQRFB5b0wwQUtuNGZQMEI0NGlzVnUydjlFcjhO?=
 =?utf-8?B?YWhPdG1Bc05XcFhEMHdyMjBIMTAyZDZwbDFnMTgrUWJzdkYySWw1NktIYTls?=
 =?utf-8?B?KzhNN3N4S09nPT0=?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9124
X-CodeTwo-MessageID: 5b37f6c6-a17a-4871-9950-39480e4b7123.20250819082619@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ea0072ec-f0d5-45d5-b6ee-08dddefa10ad
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|14060799003|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmRSc0RSeFNQNVlmbmdGcTR5Ti9wRFAxdnAybHphTzdWRFRyZEpIMnI5V05o?=
 =?utf-8?B?TlhLSjgyaGpHTVBUbFZTdmtmbUxNdGdvNHZOVjVvSGlnRElzbW02N1A0TDAz?=
 =?utf-8?B?V3BjTEVueC9NN2g1TnRiT3R6SFNXczZ0UXRnMFRXZ3B6VUU5UDdpRmJFSCs0?=
 =?utf-8?B?Q2VSd2ZuWllrdWUxR28vQWZablpSM2trOWVGM240dkg5cnE0aGMrMkRZUC9t?=
 =?utf-8?B?SWc4S2RSMkVrazRITFo0OWNJMFdpV3N1VFB3VERiekNGc1VlMWYwVjJ5NVhY?=
 =?utf-8?B?WTFTWmRWanZYOFAyaktacmYrNmtkQXBZMlZpWU1BODJWcmp6cThodjBxS2sv?=
 =?utf-8?B?aWY1cnlTdGt4SmlCeHdPZDlRUndsbUlwZWFDSXhkR0pQS2x6SWovN2tCUkVZ?=
 =?utf-8?B?c2tHOEg0ZnV6YXFqZFkzbDE0czY3b2J6aFhiNlk0U2w5WGVCN2pVUm9HVlBm?=
 =?utf-8?B?NWNCYVFmbjZHTmxSamhwelVub1A4azdwU2c0TEJaNVNZSkJuSVpIZ01IVlcr?=
 =?utf-8?B?UC9IMXYrb1ZpOXFlczZ0VDlnVnRzNXQ5VXp0Y29adXFaZ25XbnVmYm12OFpt?=
 =?utf-8?B?NklTQjlYQXhnNzk5OHNtQ0xDMnFIbE10eERoY0tPL1JKUEZlaWI4b3FUU2ln?=
 =?utf-8?B?VHJrZ2VFQ2k0cVFTTFJ5VGk3Q3FWaUZ6Q0RBSzdlWitEdVpydGwxbmJwTGdw?=
 =?utf-8?B?N1hTZkg4ZnpYV3A1NFdscjJxaWdPNVhYeUE2UXdac0hvc2pNOURrMG9ITmJy?=
 =?utf-8?B?a013QkZ3QVpMMldnSG5QOXQ5K05Mcndpc1NTSHpVL3doVUQ2WnBRcVM2WHhq?=
 =?utf-8?B?WFlsVy9aNW4xNmlzai9yWTh5aStjQmZ4ajJoSlVRZmRQZG4rd2JjbWYxRjBr?=
 =?utf-8?B?K1BEcURGT1lhSEZvQzJ2d2sxZStlbG4yVU5xUXU4WXUwa1g3T3phU2lKQWc2?=
 =?utf-8?B?WGUzYUdyWHR6a2poNG5oeUlPbmswRlN0cUJEVUFvYXhSRmZDVEp6K2xTaG9C?=
 =?utf-8?B?NVk5UFZldzMzU2ZjRFlNOEcwUWd5aWluRkRBMkc0RnRDTTg3ZWlVZWY5RFJO?=
 =?utf-8?B?NFVuaFNGT3h1UGV4R09nRmlwS2VNcUVleENCcGRiMlA5VXBCT2tKUEdTbWNN?=
 =?utf-8?B?Um5KZFVRbnlaRHJzMzJMMWU2U05iazZnemVxSi9aZmlpZHlkUUJtbWRaMTlC?=
 =?utf-8?B?Q1V0c3M4QjVBUkRacllSYWtvR28vS3l6RC9JYW5DZUY1UkxtVlR1MG1ibzRS?=
 =?utf-8?B?NktpMjhGT0kwN0ZIQnpqdEZ6YUlqaHZsa1MvWHdINGFhZXFLRFh2aTJqVW1O?=
 =?utf-8?B?NEJ6aSt4ckRsOEhNeWRBRnM4VUdRZ2pGeG1nUlkxaW9uek1ORlUyTEw3QVEr?=
 =?utf-8?B?MWtrY0dxa3l2c1dvRmMrQ3BHWHBvbWIxMWVMRDE0ZFFabk0wTkg5VUw3UWJl?=
 =?utf-8?B?RG9UcVpnc0NySmpwR1dJTXRnbDU2RXU5aENOWmtVNTMrd2pnMklFTFovSXE5?=
 =?utf-8?B?ejNiVnRDaVB3WVNJTlhFbFdLVm94ZDhUcEd1SDZqWUczNjVqbTJNNitYUllx?=
 =?utf-8?B?NGJFQUxHUnp3aDZ4c2JVcG5yRkFKdzM0bmhoQ2NkUWJIUXF2bVJ5SGJtdHJT?=
 =?utf-8?B?M2V4cUZQRHV0VXpIYWJyT3djOVJIdXZnaGd0K0lndURPK2RHeUxuU2VmTnZR?=
 =?utf-8?B?SWtpYUxoV3RjaTRFbGRMZmVIdnB6c3ZqOGxGU1d0ZzYvSW4wb0szeC90bHVv?=
 =?utf-8?B?YXJHdktGU2NqbTcyakxiemlGNURlTVk4SWtKOTRYZDlGYXpCak82Nk9iTDBr?=
 =?utf-8?B?NjRnbnZYOWpSMG5HVUdkUkNFZjhOUE42MEpPYnVBWlJaa0hKNFpDcHJBaU1K?=
 =?utf-8?B?b1ljRGw3cHZld0hSMEIvVkdZNGJySzRXT0lFUlpPNHU2Ymd6L3ZZRVFsY003?=
 =?utf-8?B?Z3hqSzRES0Zzb3FWNWdCQURNTEt3cStpM2hXaUJnZnk2bkpBQ09NUlAzSlRW?=
 =?utf-8?B?Rnl2QVdnaG42VWpJWnBHL0U3UHBBc1lSTU5SRG8wYkVTb0Fwdy9VUmxvQjdw?=
 =?utf-8?Q?QrEtK9?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(35042699022)(14060799003)(1800799024)(82310400026)(36860700013)(376014)(7416014);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 08:26:20.3239 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e75fe21-b6bb-4a92-bfd2-08dddefa1357
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6857
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

On 19-08-2025 09:51, Krzysztof Kozlowski wrote:
> On 19/08/2025 09:46, Mike Looijmans wrote:
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - ti,tmds181
>>>> +      - ti,sn65dp159
>>> The driver contains:
>>> +	{ .compatible =3D "ti,tmds181", },
>>> +	{ .compatible =3D "ti,sn65dp159", },
>>> +	{}
>>> so why is a fallback compatible not suitable here?
>> I don't understand the question. The two are slightly different chips,
> Your driver says they are compatible. No one said the same, but compatibl=
e.
>
>> so it makes sense to describe that in the DT.
> Compatible devices should use fallback. There is plenty of examples (90%
> of all binding files?) including example-schema describing this.

Please help me out here, I'm happy to oblige, but I don't understand=20
what you're asking.

To the best of my knowledge "fallback" compatible is when you write=20
something like this in the device-tree:
 =C2=A0=C2=A0 compatible =3D "st,m25p80", "jedec,spi-nor";
Which means that we can use the "jedec,spi-nor" driver if there's no=20
specific match for "st,m25p80", correct?

I don't understand how that relates to your request, this is the first=20
time I ever got this particular feedback. Looking at say the=20
ti,sn65dsi83 driver, it does the same thing (supports the ti,sn65dsi83=20
and ti,sn65dsi84).

Please explain or point me somewhere where I can find this?

>
>
> Best regards,
> Krzysztof


--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl



