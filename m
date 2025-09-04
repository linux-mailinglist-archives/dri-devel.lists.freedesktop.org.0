Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB55CB431D1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 07:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454E410E973;
	Thu,  4 Sep 2025 05:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="NMfX606r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11021141.outbound.protection.outlook.com
 [40.107.130.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4806510E973
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 05:54:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6KpCqvW8xwfk09OBs8Evk1BJAkkKGptQETbreCEGVPDapFHGR2O5r8tZPq3C0ubMp838/VGr6zNyACSjg0UEeB2zsaqizRTFS0B+m3l3Ky6JqPf0BL3ogIWAbrvPz+zq3gf8We3m2+E5ZC8Wa9QUcqqhmY0Vvti2y2BNUtr14vk841WBxOLtY5ckGYnrMCJ1NPmlW781OSRc3o44kzOfvae5D0kzQTklLocP7tYITj5voIigzrM5RphBsXUK7d1r8JdlHs7VwgHH4q6DYi6s/9tJGaAZlR/SxbovZezRS9IM40QIcy0W4OpX3sPvwpGdmmwy37UOMuWeFNmIyLx2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQsdzRjoIG2lbCf+2vL2vnGEiKHkYn0ESs1cnrLaAgY=;
 b=DRSrweKEOCMoz26ikr4r2pRYMn0R0dLlC/muzTwJznkqoK76KbVfp7kSgfwH3PqD/SzmVVM/eglTvv2jVjuJv5OvpOms0PRzcdz4grZ+C4CmoeBwuNlC95/bqp4sdk/S9JpFKBtre2oQ+1eVBvHWKSBxDvK8vhb2itoMQC7EMpRbeSh/t69YwBFUBzq27quGzblra3ybHf2OHEWeRM3uVETGZKfy+XdK9bPBc6kLD0H4zTJnigr7i231ElGXRe4geY40QTzeiHeegW2MHE3nzgpUiHjd/V5i4Dhyx3pjftcfEvFH1Qv2CvOFk52WcPdD38U+TbQHTodY3X1QAokvYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQsdzRjoIG2lbCf+2vL2vnGEiKHkYn0ESs1cnrLaAgY=;
 b=NMfX606rWHW39T/j0y7H6/AdIvfYRFX1w/HrMUwwqkLULlwtg0TaESLiFacGP15rekaZcchdwznrctudxeN5KFvDoRGPChkRr06u0ICbgn3MrrOf6Dr8xDK6VUgV6sksAb1N2XiuPvL5zopoMgy3ZNPKqAk2dqDjIVlyxT8iBto+1FBPujn2DFcIDnGXtwR5JOnIdpTQnIoLppd0mu7/dEXXA7SKroDUbanQ2LmPB8jykrDbnh4xu8T5nRuKO6H/jbB3l1wBvUQlu8QnkVDE8NjfQlETUAxUB9w2VwerpW66/e82Je/fbHK/VL2E7paXLLVUpOqjs68d8MDMYCuF8A==
Received: from CWLP265CA0506.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18b::19)
 by DBBPR04MB8010.eurprd04.prod.outlook.com (2603:10a6:10:1f1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.12; Thu, 4 Sep
 2025 05:54:36 +0000
Received: from AMS1EPF0000004A.eurprd04.prod.outlook.com
 (2603:10a6:400:18b:cafe::34) by CWLP265CA0506.outlook.office365.com
 (2603:10a6:400:18b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Thu,
 4 Sep 2025 05:54:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AMS1EPF0000004A.mail.protection.outlook.com (10.167.16.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 05:54:35 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com (40.93.64.2) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Thu, 04 Sep 2025 05:54:34 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by VI1PR04MB10074.eurprd04.prod.outlook.com (2603:10a6:800:1d5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Thu, 4 Sep
 2025 05:54:30 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 05:54:30 +0000
Message-ID: <abda9bc1-bd5a-4f60-8786-e3ebd6852073@topic.nl>
Date: Thu, 4 Sep 2025 07:54:30 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH v4 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI
 TMDS181 and SN65DP159 bindings
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250901142958.843678-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.edc18686-244f-441e-a6ac-0b62492b96c8@emailsignatures365.codetwo.com>
 <20250901142958.843678-2-mike.looijmans@topic.nl>
 <pml7rfbkerzkx5df26x7kxn3tk2o7oqrkqnx26tzikeg53djn5@islb4hlm4ks7>
 <aa80b3c4-01b5-4d4c-9fe0-523cdb895eb3@topic.nl>
 <37czaypq2newm3hn6nfuy5ndkibvaqf53nx6zvv3mhddh4qku5@psqqxbu7bycf>
Content-Language: nl, en-US
Organization: TOPIC
In-Reply-To: <37czaypq2newm3hn6nfuy5ndkibvaqf53nx6zvv3mhddh4qku5@psqqxbu7bycf>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P195CA0018.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::15) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|VI1PR04MB10074:EE_|AMS1EPF0000004A:EE_|DBBPR04MB8010:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f0bce73-acc2-4e12-499d-08ddeb77870d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?TC82b1ZDdDRVSmV6eXVFSTF2dDdjQ2hwbjJPSWNCTU11RDlkRk9TVGFHMU8z?=
 =?utf-8?B?cTRVNUgxSHJEY0U0VkpJdVQ3QXpGUGR1QzFHNFdPNkhvREl5c053cFljRXNF?=
 =?utf-8?B?MFRCK3hnaDl0Z3RqMk1hbSs0ZVdhZzNxNGJXM2ZxRHpRcnk5QmlFWVR4bWND?=
 =?utf-8?B?Y1hrOFc2bGNBdS93aDE1MGpEaFpnVktoREQzWklwaGx0ZkIzdlR0WFN4MVZ2?=
 =?utf-8?B?L0Zjb2sxVXBTQVh2aXN4L05iSGNHSEt1d21SL1dEUWd0bTBRY0tQM3dMYzVU?=
 =?utf-8?B?eFJOUFBtVHJnMERUM3VjOTU2ZnhNQVhEcTFidGNxbmFyNU5FTGFHV3ArWDUw?=
 =?utf-8?B?MEcrSEZHYjlLanJDZmNMZTBmNFRLTjR5QmtmMGRlVHdGUzNLOWxYRktVYXla?=
 =?utf-8?B?VHVXdWhYYzk2enM2L0U2TVIwWGU1QUUvK2owak9UYnU2b1Y5S01YWHNQcVIz?=
 =?utf-8?B?NUdkZWErRHpvT1JPdFJlTUw5MVhyaDQvNlFsSm5vUWl6UWk5NWg0eXZ6WkVD?=
 =?utf-8?B?UmIzZ055cjlmd2d0WExBVE1mWEJtdERDZEUrUnovSGppMlZkNXB0K20rZWZu?=
 =?utf-8?B?UEJRZDQzZDUvMFQ0K2locGNrVGJ3QVZBYkJYRlNkL09nZzU0R0xFU1R0RUt5?=
 =?utf-8?B?Ulo2SnhDRDVQSENCeml4anRNd0U3QkNxd004WUVvL3M2bkU1SEg2TjdyY3BM?=
 =?utf-8?B?SUpnV0tGRE5naVVlT1AwZDNoeitONG16MVBQVjl0RFhsNUFtcFdhck1NaWJZ?=
 =?utf-8?B?VEhBcFNSQXlHd2RNNnR1Q015VlBLa1Y0UjFJSjBuK2c5dFBldUJyTWVDekJU?=
 =?utf-8?B?UVJ4TXdhS1EzdFlENC9rWnI1TEFtbjNXNzZsYWJrRWxhOVU0cWlCNGRidXhl?=
 =?utf-8?B?WUx4U3lEcWVOUHNlU1FCY3IrRklHUHZONjJjd3JkbmVpSUczMXRJQVZRWS9w?=
 =?utf-8?B?V3BCRUUrVmI1MzdtYlU2WG5tdkJsa0tQL3lqNmgzdUZnQXc3SXdDMmM3RnRK?=
 =?utf-8?B?YlR4enZWK1ZQUDJWN25PQmNmcTh3SGtIN1M5RGY3Q1RDcDJwUkpVSW9VdWEy?=
 =?utf-8?B?VWtzcS9NMDVrRWpHMWsvUDl0cVliYm02OGdEOTZwd1lSU211bUNuR01GVDRz?=
 =?utf-8?B?eUJXM1A5QlRER3IzZ1VkekZ6ZGVPVENvNmVOT3VmUDJ4VkEzVnZreTFMbWQ4?=
 =?utf-8?B?aVU1RDVZMnFNZGxET1FCVFVjQXdWYTlSc2NudmpJeWVZNG4xREJrdlNhZk1Y?=
 =?utf-8?B?QThocy8yWURGSk1MSWs1bU91V0VsVWhtVEtVeUZXN0UzM25Vbjk3bDY4Rkps?=
 =?utf-8?B?Yi9rc0swOHV6cVFNakU3Z0JhZDBtVlFyeGRmaHNveFFlS3NwU3E2em1QWGZ2?=
 =?utf-8?B?eEJkMjdyY1NZUVp3MlRtbUx6eDFmbG5SeXcvem1WS1paUUpKZ0RQbEVGSWRq?=
 =?utf-8?B?L0xBT2I3Ukt6cE9LdHhkdHJyemdhQ2syZmtWaVl0YnBreWNlcXRhVE05QlFR?=
 =?utf-8?B?cTdUd2lmazZFRHJLak5KZXV4eGc3WVdPS0twYXRUZUFIcVh4V0IwTXJ0T1BG?=
 =?utf-8?B?Q0U3MzBxaFltQnJtNUx5UnptZUZyQkpYV0IxUjFZNS84R3ZQVjhCd0kwNkpI?=
 =?utf-8?B?SnNvNlNoRmVkazA4OG5IV3BRMjkya1ltbHRWdjByOGp4VVl5bDFNbjUyaGxJ?=
 =?utf-8?B?bWRqQ0Nua3ZHcVMxWlcwdEtvWjlWazVoS3YrK0Fmam52eEVGRTg5eXd5cERX?=
 =?utf-8?B?Sk5adUV3bUFSU3dFYmtOVUZKV3c0Z0pHa0xtNHlDQ1hEaEd2K3JrWVR4V3Jj?=
 =?utf-8?B?L2JoYlBTVEhHdk5uRm13a0hMN2p3OHA2R0Q2Tnd0Um9mWnVIOWtTWmk1VnRU?=
 =?utf-8?B?aExtbnRtaDAwdDkwMUhnejNjcTFuOU9LSzROKzdodmp4cXM4YXpuVnVIS2pC?=
 =?utf-8?Q?70F7ZFG1pD4=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10074
X-CodeTwo-MessageID: c2e5fa82-f3d9-4804-adb0-6070c1ed1f4b.20250904055434@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2199eb0f-ad9b-4724-1b16-08ddeb7783f8
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|35042699022|7416014|376014|14060799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cE1oTm1XZWlXUWxLLzJ0SElNUG0zU0dLZWtYOXpvaTdBYmdIaDdWeDdjTDNy?=
 =?utf-8?B?OTU1VXNvY2cxUXRielNDVHdybEFKWnNUTHpSYXJEcUJEZUNIbUY5YkQwelR4?=
 =?utf-8?B?RmtPb1krRmVOK0QwZGp3TW5EWFQvT25iQ1NkZVR6bGZRb2d2NGhYdDEzNExH?=
 =?utf-8?B?U3kwT1FGc2FuTkRKUHVOYThIb3pWRlUwTE82eVRGTGVub3EzekZ2VjRzMXB1?=
 =?utf-8?B?MWZzU3JCakRhTlVZSzZIZVJhMTBBd2N3Ri9HTVl4NVcxdHRmY0xQcmpSY2dS?=
 =?utf-8?B?WmF5QnFNM3FyRE9uSTZXTFFncEZiVStGakVIMWNEdDI1OWh3NTQ0S0hEdnZl?=
 =?utf-8?B?R1FqZGs0THJxNGNwV3hzMHFjeDY2OWpDK2F2a3JjTWIvSVJhb0pNZUEwM3Rj?=
 =?utf-8?B?QnR6ejYyYXIyVHQwSmNCbDBWQmNiUE05QzdVUGJPQjJVU1ZObEhHZFpvMFJN?=
 =?utf-8?B?ZmdzR1o4T2ZBOTNPVWVYaTl6dXB4Y21zZ1VPNmw1M2QwU055NysydzcxNzEv?=
 =?utf-8?B?R3NZZDU4Y0REV3BndmY3Zk1Yd0V1SVZwTm9PeVp4dHVoRis0U2N3enBId2Vm?=
 =?utf-8?B?Q2dIaVZ6U1NTNVlWMTB5cllFMzZSMDhhSFpuem5CVktJZnNuUHBtWFZNVEFH?=
 =?utf-8?B?M0FHSmIxUkg1MHJrY2x0U25uRCtvRVBQbVI0M1Z0Mkg3SU5pSUwrbHJxQkxL?=
 =?utf-8?B?aWhNSjVZTkFuT1NrU1NHdVBJS1lUZGRzcTVISUJTekk5Z2ZVWDM2UnBENEln?=
 =?utf-8?B?Ym9wM3NuNUpmcDhzZm9FZlN2VmgvRXRCbTJ1cTgrZGlDNkdjVVhaV1ExVGs4?=
 =?utf-8?B?Z0VEU1dKZHpCdC82U3hXSEpDcW5hYWE0T1VsUGNLNlFXWjlvMitjMFVvVVdv?=
 =?utf-8?B?ZldDVFVPY0JxNUR5akxkM1BxQUdhcE9nbzFvMTloWGc2b0l0aFE5S25MOWti?=
 =?utf-8?B?ZzB4eHQ2ZnlZUjJtT1hxMFVsU0ZVMk5uZ3FveTFIOFJhbkErMklGRng3dy82?=
 =?utf-8?B?N1hrZ1dhTm9LUGZXWmdXV0tqdE1vOHlnYW9DOE45VElnWmYydkJ4MkF3NFpT?=
 =?utf-8?B?cUdQWm43Yi9YRWh3bEJ1cWE4WmdFODRsYVR3SEZidkxKTU5DMEFFU0trc0o2?=
 =?utf-8?B?YmwwbkRjeHBMWEh3VU9xNS9PT1EvWEF6WlpLb05jVmhPcXBxUjloVEZzMmZC?=
 =?utf-8?B?cXZyS3RiYkZUdkQ3N1hjT0g2RFNBSWIzclNRU1ZhTVRNZHBhaVByUi9BZkY0?=
 =?utf-8?B?Rkl1UGlmck9hQktnOUVKZEVSMHVJKy85T21oczY4bUJra0lTbVlFdllXVlRY?=
 =?utf-8?B?QnRTQlI4V3NlUFRudXNlaUxORU1SaWJtNFhJYVNpSW90cmxtWFliZUl5UnRJ?=
 =?utf-8?B?TlFFYlc3MHp2Qk1PTGplQlZJalR2UUxCblZoRnJYWStYWGsvYTVWVmtQaTZK?=
 =?utf-8?B?Wld5YlNWZlpBQWJ4RVF3c0dCbXB0dDlGUldPOHdtVGtqVlBucUJURmg1cnZz?=
 =?utf-8?B?ZldoMjhUeW5LSzF3elVaT0wrT3N2UHk3SmdqYmVvTk13YVV6Rmg0QktFaFNv?=
 =?utf-8?B?WlAyM1YyRCt6aCt2dno1TnJkcDBzdVRyZTZrbFQ2MjFGTkV6WWVseVg0SW1K?=
 =?utf-8?B?RkduR1gvWE5oTE1JR0Jqb0JNTkJ1Sml6ejdCL01OeThyakt4RnN2cTExMmJ5?=
 =?utf-8?B?WnVMcnVkak9YbDdFY29XaVVwby8wYWxsU2Z4Wi9BTUVmRytRQmZPOUFHV0VR?=
 =?utf-8?B?YWk5bEg3UmQvT3dKK1k2Yldmc3drMURaR3QxSGtqMnFVTmNYTWtQSTJ5eXBm?=
 =?utf-8?B?b3hJS1Ntd1M0TlY2THBTSnd6ZmJaUHhJOXlHWEoyYnNLSkRzbkh6VEd1bXo3?=
 =?utf-8?B?S2NLTWxUWURVa3ZpcVpsOExuRWprd2J4aHRYdTNpTlpLeC9SQkk1azROUnRt?=
 =?utf-8?B?a0U2Tk81eFFnSGlLWkw1TDFENk1EaUNKOVVFQUJQOVBxY09ZejFXb2JoT3Ax?=
 =?utf-8?B?Q1FQU01HZUlpMmhkak1LeHJNemhxZHFPL21paXM2TC8yYm9kU1hWMjRyOVdy?=
 =?utf-8?Q?xYB75+?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(35042699022)(7416014)(376014)(14060799003);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 05:54:35.5428 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0bce73-acc2-4e12-499d-08ddeb77870d
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8010
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

On 03-09-2025 17:25, Dmitry Baryshkov wrote:
> On Wed, Sep 03, 2025 at 08:17:33AM +0200, Mike Looijmans wrote:
>> On 02-09-2025 19:29, Maxime Ripard wrote:
>>> On Mon, Sep 01, 2025 at 04:29:01PM +0200, Mike Looijmans wrote:
>>>> +  ti,retimer-threshold-hz:
>>>> +    minimum: 25000000
>>>> +    maximum: 600000000
>>>> +    default: 200000000
>>>> +    description:
>>>> +      Cross-over point. Up until this pixel clock frequency
>>>> +      the chip remains in the low-power redriver mode. Above
>>>> +      the threshold the chip should operate in retimer mode.
>>> Why should anyone want to tune this at the firmware level?
>> It's a board property. You'd set this based on the hardware you've solde=
red
>> on. If your clock and serdes are good quality, there's no need for the c=
hip
>> to be in retimer mode (it will consume more power and actually make the
>> signal worse). At higher speeds, that situation may change, hence the ne=
ed
>> for a way to describe that. The chip has a similar function built in, bu=
t
>> with only 2 choices of cross-over point.
>>
>> To tune these parameters (retimer, equalizer), you'll probably have to t=
ake
>> your equipment to a test facility (like we did). It's not something that
>> end-users would want to tune themselves.
>>
>> Most of these settings can also be done using pin strapping. I guess it'=
d be
>> helpful if I added that to the description.
>>
>>
>>>> +  ti,dvi-mode:
>>>> +    type: boolean
>>>> +    description: Makes the DP159 chip operate in DVI mode.
>>> Ditto. Both describe policy, not hardware.
>> I would set this flag if I've soldered on a DVI connector instead of a H=
DMI
>> one. I'd consider that hardware.
> Do you need to set this if you have DVI monitor attached to the HDMI
> connector via the passive cable?

In our testing, the setting didn't appear to have any effect on the video=20
signals. Activating the I2C interface blocks the pinstrapping setting of th=
is=20
bit, that's the only reason it's there.

I've been digging through the datasheet. It appears that the DVI mode disab=
les=20
an I2C slave on the DDC bus, when in HDMI_SEL mode the datasheet says:=C2=
=A0=20
"Device configured for HDMI (Adaptor ID block is readable through I2C or=20
I2C-over-AUX."

Apparently a better name for the pin would be "disable-adaptor-id-block".

Another approach would be to just always disable it in the driver. It appea=
rs=20
to make the retimer "visible" in the DDC path and even allows to change som=
e=20
settings that way (most noticeably, turn it on/off), which will interfere w=
ith=20
the driver's functions. If we're directly controlling the device over I2C, =
one=20
shouldn't be using this secondary interface.


> As for the connector type, you can check it in the .atomic_enable by
> checking drm_connector::connector_type.

Assuming this is the last bridge, yes. But see above, I suggest removing th=
is=20
from the bindings and just always set it in the driver.

M.



