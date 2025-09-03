Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 083E8B414D7
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 08:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A955510E0EA;
	Wed,  3 Sep 2025 06:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="a4hgxYWE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11023080.outbound.protection.outlook.com
 [40.107.162.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB2210E0EA
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 06:17:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THv8fqPStxOmYghDr76vzbvBAXy9ef0oVURSk99uUoWvhOk6gRRIzl/U69QDJaOcIDZwOZO/WVEmeHMcvhJt4VSV1FEOwCVCcScZHRxeVsl6OSqH7Kk0Dy2QAewD3LDmMPOu+4+j64jm+hLjeR4rz1z7++Y4zy4tSUZsHY2nvC5Nz9bpIVEg8uB/mh24SgRxc9CO0CcVw7unPTxhxb4JOLzU+jyk/UzGWW+PCR2LzDfUUfG9EF5h4a5RI5oGvfbOa0WnLgRyCAMIGkAUXV0DBT4BcWM97GIeaBvN03duRG5f78ZmZRdWKvMuS7jM4m0zhFE7n9t3t9upVOFAgGIRWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOWHu44mP9YxBbB/pVhpz8Aqf7vsgsnHCiMuqJqHD2k=;
 b=uce9mM1yOFYpbIPVMlfzMu0rj5OlDEoDa8Ca7/UNIUxid7V6llw+hgJcITCyZ38WfCDyYjEnYxS8RUT2ZOPBH8qRX1CvBwurhM/USyID+cpBbquoYrOLypoij+7+Z2b3R5z/5vBoNcNzuYATxdvo7wo1vPb8+ZPIJILLZHOIrpLAoV+JbZnRGhvlt4zdQ/bJ8pEIn4akKXPkw0tpqLkCOzoWEy9zHfXqQK5Z3q8CTUqWLlxhlI3ZCP7qVnGUNj86K1mXetzXKFsEn+JEhJed9KDAl0QkMFbu5DAUrhQo3t8CWJqP2Q4KnuJXbl4K8u8Kdcn6oPpXozx/oBQFTFC+kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOWHu44mP9YxBbB/pVhpz8Aqf7vsgsnHCiMuqJqHD2k=;
 b=a4hgxYWEZjR7gEze3P5IHfYaTVU2TvgTzXjCE3Nz1QXmF8cBRjLWwHwwTvQ/8VG+GYU2cd6pMuB4qhjUnWE+3aon/QeSV2sLdN1sIFgZy2dlXhX6sogaMMljyjJDOB9BRrlOZ7Hf1zspNkZX5Tfar87qfizIwNq8Gkm1AF3WSWsNucjHUYbV4mTOWez/+OwkPfBTSXWM75FjoUqfmZilf17nfWONU3uXAxcls7tU4T5yOGY5zvzhrGRAma5IEHJh7EIxrNPSL27StkfCheaPLqHgvpNJNxr9U+h7heCHCCvlMawmT/TBEjo1Kqq6kGMo8aeuCAbSUk0iH9MmZVbmWQ==
Received: from DB7PR05CA0042.eurprd05.prod.outlook.com (2603:10a6:10:2e::19)
 by AS1PR04MB9560.eurprd04.prod.outlook.com (2603:10a6:20b:470::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.10; Wed, 3 Sep
 2025 06:17:38 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:2e:cafe::51) by DB7PR05CA0042.outlook.office365.com
 (2603:10a6:10:2e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Wed,
 3 Sep 2025 06:17:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Wed, 3 Sep 2025 06:17:37 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com (40.93.64.10) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Wed, 03 Sep 2025 06:17:37 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DU7PR04MB11137.eurprd04.prod.outlook.com (2603:10a6:10:5b1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 06:17:34 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 06:17:34 +0000
Message-ID: <aa80b3c4-01b5-4d4c-9fe0-523cdb895eb3@topic.nl>
Date: Wed, 3 Sep 2025 08:17:33 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH v4 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI
 TMDS181 and SN65DP159 bindings
To: Maxime Ripard <mripard@kernel.org>
CC: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Content-Language: nl, en-US
Organization: TOPIC
In-Reply-To: <pml7rfbkerzkx5df26x7kxn3tk2o7oqrkqnx26tzikeg53djn5@islb4hlm4ks7>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR03CA0074.eurprd03.prod.outlook.com
 (2603:10a6:208:69::15) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DU7PR04MB11137:EE_|DB1PEPF000509FB:EE_|AS1PR04MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: cb5a2fac-70ea-4883-443f-08ddeab194ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Vlo4MkZOalByd2Npa0Q1Z1ZaYmVMaVpERUhYMHRnRFZyVHJ2bVgwRTVuYzZo?=
 =?utf-8?B?MlVYRTZka0tSRFVTOWxoQk5UMElaQWdBb1NKMHVWemttZWZaakZaaHR2a2tY?=
 =?utf-8?B?UXV4NzA5M1RkUkJrUElwSTJEc0ZWcUtlOCt1QnUva3h4dDh2WUNTbE84NVpQ?=
 =?utf-8?B?cnZndWR2VEdRcUZSeW1YSyt0RzRwV3hEVUZWS25XdFd0M1g2RkU5Qnk5SUp1?=
 =?utf-8?B?bnhhUEZUMDdmN2xwM1IyN2pwYldHcEFWMVRjek5rSkxwa2RSM1BsMTI2OExp?=
 =?utf-8?B?Q1krQVFvM2NSNklzNmJlRlV1UU5KQnNkbEhSRHFFbXBYU0xESUxhd3VpWlRI?=
 =?utf-8?B?MzYvNmRGYkpyK1IvYnFOc2NkSVhxNkllNDFGOXZ5WUtzbk1PSmN6Um1KeU9o?=
 =?utf-8?B?UFpaNzM1UEYrQWtFcnlJeFNVKzhPSkNrM01LMGJCT243bmlnRDl5VUNtd0Qr?=
 =?utf-8?B?OXVhVS9sVTh4SGkvalBmRlpOUG5tUG9NVTk4bDcxN1RNTVh5ZkJocjZ0R1Jw?=
 =?utf-8?B?WG0vNjNYdlY5M0Fmb3hiQWhRcVcrTm1YWWVWeC81KzNjY1F5bDgxNk1hT3J3?=
 =?utf-8?B?WHhvbG4yRVBjazZRUFEyQ2llYVp3eSt6N1phOFkwMVNuREJaVnVXMWczcnhP?=
 =?utf-8?B?QS9qRnBIMUhCWmh2L2pSMStPRmltRUx4K1QyYkZDSE1sOGU5aGcyOVhjZzBw?=
 =?utf-8?B?TGtUdDFnaEJvVDN5cFhXcGZQNEtrZWx6UUU0Ym5KdDA4bDVpeEg3SU4vL1BI?=
 =?utf-8?B?WWtiRkt2cHMwZFYxUWdnNnJkeUh6YVF2dWtuQVZFNkpCZGFqV1Y2NVFCZUF1?=
 =?utf-8?B?d1B2M1NsRDJGU2E5ZHk1YjlXYUp5c1ZMS3VuVUo2ZFBmYzR1eDhRa0lLK1ZS?=
 =?utf-8?B?blBRYnVRaXpMM1pCZGgxbktQZkxmdDNoUk1zcFB5Vlk4WWM5cW56M2t1dVJB?=
 =?utf-8?B?VTlrOUpMNStVQ2ExRnZPbUg5NDVvRkJwQ1M5cGFBOEJEcDNYTHpmUWJpWERL?=
 =?utf-8?B?RlhGQ01zQ2NjMFdCYUlnNDkyZ044R01ISjNEUDVTVGtHLzBYNmJFTjFUc3dY?=
 =?utf-8?B?ZnF6SVFnUitKK1ExVXl6OEZMNzlxN1FuZGc2anhDRit1Wk94ZUVqemViUFBu?=
 =?utf-8?B?QUJCbXo0ejcyZzUyQlRqNjJhQUV2M3IyT3lscGh1TG9yZzJSR3BaZEtTcTJ0?=
 =?utf-8?B?NTNiQWUvR0RWS2JuV3VuRVFzTWd3QTBDcndSMERCS3c2TE9iVG1GWkNxaEVL?=
 =?utf-8?B?OEZIV0RsSGVLQVdiTEcyL1VCYUhjUHlOSmpMaVhTSVNkTTJmOEVVZW55V09o?=
 =?utf-8?B?SzJUU3ZxSXd6RlF1ZnFERW1Ja2R6OEhFSnpaM3dPaWlLZGsxYUpPcUR4MVRF?=
 =?utf-8?B?aFF4bG5URkJFcU5VRGE2bE9GYXNrUHBkL0dKc2krOWpyR1F5WnNLNHBnV3Yw?=
 =?utf-8?B?bUtLcWg4U282cS83WFNpRm5BWEVxRzZrWkFaSWVvNUlEMXdIeTVCWXA5M2JT?=
 =?utf-8?B?aVU4OExGeVVaZzVxQkxnY1FveWM0SzdxQVErdTN1OE42Vzk5d0piVVI4TDlv?=
 =?utf-8?B?M3oyeWR3T0w2UUhQZmZ5SVpVWjZBWmdlNUVZRmZ1RnNPN0VSd1pESmV5M2di?=
 =?utf-8?B?cUhlTStPVzcrOHVFMmFuU2VPTGxNVzI3S2RZamtqa2tLMFhDRmp6bnBQTThy?=
 =?utf-8?B?akdWMENVTXhJN3p2RjYrdkN3MVgvVjFkTERPZGMzRWVibHZXNzJiZXlUUnVG?=
 =?utf-8?B?SW5FNGkyNGVJOTlOOWluU2pPZld6a1IxVWExbms3aUFhemUvVjkvaW4zcGNF?=
 =?utf-8?B?aUp1Z2VRQ1R3bW9sYXFFYlZSVDlXV3hKUkdMZUtWRGtpcU01WGZyMU16UUJY?=
 =?utf-8?B?c283aU1zdmwwMzZtcWE3WUFMMXc3YVlGbGZIZUJMSlY5dVVIZTJHSlY5Nmdu?=
 =?utf-8?Q?LeyHu8C0GKI=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11137
X-CodeTwo-MessageID: 3d5efaee-12c2-4933-a42b-452745d2344d.20250903061737@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: bd11464d-4ead-40e8-576d-08ddeab19207
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|35042699022|376014|7416014|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVpHL1IzVVZ6UExvYlFrRXZDUzgvemZnUzFiNUd2Z2hnRSttUVpXSkprTkpH?=
 =?utf-8?B?a3RBd09qZ05iNTBOY1piOS9PKzRGcFI0eWpCSDVYWmZibjZXWVg5Y0paRm04?=
 =?utf-8?B?dTZOR2JGZ29INXdLaXlaSjA4MDBHaThCeXU1WGowNWNZalRVeWxZd0YrYkdt?=
 =?utf-8?B?c0kwZk5nNTRvN3RBOWMyWU5QQ0hxZzJQWTZvQVlIYS8xQlJrcnVMeHJvVEdZ?=
 =?utf-8?B?QW54VUpSckN0STNxc1JBUlhCb2hDdVlRcEc5ekIxcnRYbUJ3WnlrWVFiR0l0?=
 =?utf-8?B?VDYvVFJJWDBIelVBOGxsZXhyVEZOYkJVc2ZQYjBpUUUzbHhEZTZMM05Nbk55?=
 =?utf-8?B?VHltV3p4TURoc0R6OXI3dXZPN1podlFKemZQalA5RkREN09SQm1qbk93YkJ3?=
 =?utf-8?B?WDlzN0o2RUZob1dPeHNUYVUrSkl2bGtVVzRuc1ZLcnlNWE4rVFdJZzU0SlhE?=
 =?utf-8?B?eHM1c2p4cFI1Ylh5WFgrVmc3Z0tKSTkyWWhQRG9IdUdlNWxUUFRyUmdsbVMz?=
 =?utf-8?B?VXlhYW80NGJoWDhvRHg1SnprTHl4OWdDZDFuU0dQNzRBUlErTWV5dlZxcEds?=
 =?utf-8?B?L0Z0T01tekFzU3JUMHVnZ3lkMkc1SG1YblBERHYxSnhwSkxrb29BWVQ5dHcx?=
 =?utf-8?B?VmJoNVF1T1oyQW93aTIxTy9qK2RjMlBqcFlWT0l0OHhBUE9jOVZFV08vYXNT?=
 =?utf-8?B?dEQ4eHZnNVBISTd1V0JENGtKOEFQMG9VSC8wY3hGRDMrYlk1bEl1RGEzbnNx?=
 =?utf-8?B?SllZV2FUVysxY1dwQXdueUJEVFZDd3BMOWJzdHN3TjJlQTErV1ZWVVVPb25n?=
 =?utf-8?B?c1dBd211UlFkRFM4MVNGZmdMUC9kSjR2bnRBQlgyd0hGUFRCcHNUNG9JUFZU?=
 =?utf-8?B?TWR5VGRHa2FYNVM4eXB6ZTY1SDJ6NTZpaFJQdVRPQ0pDYk82bG1qdzhmQlFv?=
 =?utf-8?B?Q0w0SVBCSSsyTlQ4d29zK09GODJGa1lPQ0N0WUJhdGZCcFZac3VhSmN5dnRF?=
 =?utf-8?B?djZkRkZIdUJSejliTXptdFc3dU8vc1hVeTB2NGhHY2lSK0k2MGQwNDBrVTVz?=
 =?utf-8?B?akRiOHVBNnNLc2RaV3NCTS9TMmh3Z1IxaHNoV2xZd0NET0dHZjcvVFluTjNV?=
 =?utf-8?B?aUpYbmVSSU1FSGwwRzhRaHc1NytCeGU5YmZqUm9xT2RWZFExSHRSc2JxZHpO?=
 =?utf-8?B?cFdFWnhJU0FCNHdOUFN2QlBGN1RaVEd1cUt1RjIwSEVvLyt5RGFEOXBhQkZI?=
 =?utf-8?B?VWEyU1lZYUduSXhob05BdEt1TXFyaXY3R2xiRUFoUFpCcDVBWHF2S2pIZ3pW?=
 =?utf-8?B?aUpUT25Zek02QmNBY3ViZGZIVmtVTXhKZW5SMmVMZkpjL2EweUpUTkVmd01q?=
 =?utf-8?B?Z0J3WkxDbHFOZVpPdjJ6TW9QWWo3NGhIL1pnQWJGQlV2QmlocWlIcndCUzR0?=
 =?utf-8?B?YW9OOWppRC9sN2E4Y0tYUENlb2FxWjlxSDYwRVBRbUlQNTB5WlFBVS9BeWpi?=
 =?utf-8?B?QnU0aWhhSS9VTmlIc2VYMVJDb2pTT05KdkhUcEJGMlFRVjVoN0h2cjhpRjEw?=
 =?utf-8?B?ME8xWGZITXI2UGtXc0FQU1diRVorSE1Lb3dYaWFZZlNnUlFBZkN5a0gzbUl6?=
 =?utf-8?B?MnNTQkVKd2Irem5lMEZ0QlR1ekpXV1JnbFFBVzlRSm1SS3VZZlFEVjhHUHJY?=
 =?utf-8?B?c0pwSmo1QUdOY09LM3ZPTFFKMkQ4ZXcydWJCbVRiNGtHOW5sOXIrbUlGSjlX?=
 =?utf-8?B?UkNUSUQweXVZMTIzQjYxa1dpZDV6YWxpMXdRd1A0S3kzSWZQMUFmWFIrMU9F?=
 =?utf-8?B?Tm4xcHZHODd1SkhnMW9xd3dPcFdrWWNxcnRGSDFqR0pRbjhWQjhqUmpEajBK?=
 =?utf-8?B?a0RTczF0YWdvVnlUWUJVRUZVMklaZEtmT3FMRnBYcTRyRmJKRGxMWE1yQmgr?=
 =?utf-8?B?MmpFRTZDelJGcDI5VDhKNTNUQy80K2hkd3k3eUJvb2xiKzYybnMvL0VvbmR4?=
 =?utf-8?B?V3d6WXZ0VEIwUU8xdVN6L2RIbGhOQW5yNzYvQ29NVmp3MDFnMDNPUDhSdkkr?=
 =?utf-8?Q?bUXhUa?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(35042699022)(376014)(7416014)(14060799003)(82310400026);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 06:17:37.9925 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5a2fac-70ea-4883-443f-08ddeab194ca
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9560
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

On 02-09-2025 19:29, Maxime Ripard wrote:
> On Mon, Sep 01, 2025 at 04:29:01PM +0200, Mike Looijmans wrote:
>> +  ti,retimer-threshold-hz:
>> +    minimum: 25000000
>> +    maximum: 600000000
>> +    default: 200000000
>> +    description:
>> +      Cross-over point. Up until this pixel clock frequency
>> +      the chip remains in the low-power redriver mode. Above
>> +      the threshold the chip should operate in retimer mode.
> Why should anyone want to tune this at the firmware level?

It's a board property. You'd set this based on the hardware you've soldered=
=20
on. If your clock and serdes are good quality, there's no need for the chip=
 to=20
be in retimer mode (it will consume more power and actually make the signal=
=20
worse). At higher speeds, that situation may change, hence the need for a w=
ay=20
to describe that. The chip has a similar function built in, but with only 2=
=20
choices of cross-over point.

To tune these parameters (retimer, equalizer), you'll probably have to take=
=20
your equipment to a test facility (like we did). It's not something that=20
end-users would want to tune themselves.

Most of these settings can also be done using pin strapping. I guess it'd b=
e=20
helpful if I added that to the description.


>> +  ti,dvi-mode:
>> +    type: boolean
>> +    description: Makes the DP159 chip operate in DVI mode.
> Ditto. Both describe policy, not hardware.

I would set this flag if I've soldered on a DVI connector instead of a HDMI=
=20
one. I'd consider that hardware.


>> +  ti,slew-rate:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 3
>> +    default: 3
>> +    description: Set slew rate, 0 is slowest, 3 is fastest.
>> +
>> +  ti,disable-equalizer:
>> +    type: boolean
>> +    description: Disable the equalizer (to save power).
> Why shouldn't we disable all the time then? Again, it looks like a
> policy, and not something that should be set in stone in the firmware.

Again, board property. The equalizer is there to make up for things like PC=
B=20
losses (mismatch maybe?) or serdes running at (or beyond) its maximum. Agai=
n,=20
depending on your board you may need this or not. It replaces a pinstrappin=
g=20
option.


>> +  ti,adaptive-equalizer:
>> +    type: boolean
>> +    description: Set the equalizer to adaptive mode.

It's the default setting of the chip so this flag will be removed in the ne=
xt=20
version.


> Maxime

Mike.




