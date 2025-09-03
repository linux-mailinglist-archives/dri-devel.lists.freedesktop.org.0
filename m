Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFF4B41CCB
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 13:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2E810E78B;
	Wed,  3 Sep 2025 11:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="pPwgXAFw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11021100.outbound.protection.outlook.com
 [52.101.65.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0F510E79D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 11:12:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hTpoP+hF+TjMQlEOHkG1NrBMZIZgWpCzmu2EgEYXFJEueRlTgTKiIYw8rQpj/vVvL3dOpS1j+rOMA1yFrJ2wb2mMBIdeQ0PnMGaZFh4Dl6t3hJG35TPNX03T9jFHOAqNflsA3kz2ERBP8Yd6oimANeNKyU1TUUAH+Xxatqhom8Cky48qWIxmPHo/cuB6yNVTu3yYUJRu5swxyn6A1B4hFAR8T5BmPdyI4q0hDUIrcfZ+0532UQrwFZbhBSoQWErH4eHN6k/nBM3/iEtiD1q5zRmNyOVoqFGRW2NnwSfPvDYkXIhjCm4QpO3FpYNKz4Y1IU9/0SX6v/7xBRd6WPQixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTeDUn8Z8UwqBe7843F6EATZLp4P+OQzTFk1vlYSE6c=;
 b=MlKyy2C4suxE3a7NgrKm1gcFJZRC9TUui6HbQiYJj7VPRLz4d0yEWTnMslqFzP166YowgIYnolvfumuLFIg2adD74GHTOqDs7SEs0zGwCBb9JmokuQwSEGzWFsBBF3HB54DgB2ekzWbe7h0TGaQtQRCLSHZpj6+jQjo2vmzoH4+WScgvwX1immDpsmxwW/wcSKyM9wc0A3l0WZYo2/gwrfsT6qlcSrriYlOToUqDEaSc5AMgaEU1lDpahI3VVxe45fqw1eW2NoPuFxsd+ARlj67NaIOASsTIcyBEob2uDJMPkf1la/8Ebb8gJAeWnmCdsmdSSCY2WXVsEQzvIKhFew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTeDUn8Z8UwqBe7843F6EATZLp4P+OQzTFk1vlYSE6c=;
 b=pPwgXAFwySP7JCUJdu7eZgafef2URGqhWBKT0hcUlk5FSy1UwqqTPCUPiYCLbloRcnO7EshnFbTjziK9z2T9RRJ2b/6HhGv0Ngtc6ezgOKjmaYwN35hnsLVuyjtM1VBoqPaGX/G0enXysU2Dy/1xnWkDAaRt+6OxEAxcpkcyqvj/Ubuitt5Ks10sAnZYVTHWQUAkq3JF9UwkfZDUCE3piQiabJ5kkyzPqSK0lR1fK663yhw5wr/3Q7v5g4khyUWCWBXXshPfxjQAVUuUEcVtWt333ZeQmOyx1WA3Qx4xEOswNNBFLxh/Y53pvCSOm/jDze6F3jI98cZa3gAHyIyGbw==
Received: from AM6P192CA0100.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::41)
 by MRWPR04MB11517.eurprd04.prod.outlook.com (2603:10a6:501:77::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Wed, 3 Sep
 2025 11:12:37 +0000
Received: from AM2PEPF0001C715.eurprd05.prod.outlook.com (2603:10a6:209:8d::4)
 by AM6P192CA0100.outlook.office365.com (2603:10a6:209:8d::41) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17
 via Frontend Transport; Wed, 3 Sep 2025 11:12:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AM2PEPF0001C715.mail.protection.outlook.com (10.167.16.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Wed, 3 Sep 2025 11:12:37 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com (40.93.69.26) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Wed, 03 Sep 2025 11:12:36 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PA1PR04MB10604.eurprd04.prod.outlook.com (2603:10a6:102:48e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Wed, 3 Sep
 2025 11:12:34 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 11:12:34 +0000
Message-ID: <4fa96259-5dfd-485f-ab41-c039f4a1f23c@topic.nl>
Date: Wed, 3 Sep 2025 13:12:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI
 TMDS181 and SN65DP159 bindings
From: Mike Looijmans <mike.looijmans@topic.nl>
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
 <aa80b3c4-01b5-4d4c-9fe0-523cdb895eb3@topic.nl>
Content-Language: nl, en-US
Organization: TOPIC
In-Reply-To: <aa80b3c4-01b5-4d4c-9fe0-523cdb895eb3@topic.nl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P192CA0019.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::8) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PA1PR04MB10604:EE_|AM2PEPF0001C715:EE_|MRWPR04MB11517:EE_
X-MS-Office365-Filtering-Correlation-Id: 4543362f-e459-4bf5-825f-08ddeadaca56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?ZEtyQ1F5cEFkVDhCTEJtdnJ6UUlrK1hMZFI5WWdCVXhndVI1RlhSVXdOSDlH?=
 =?utf-8?B?R1I4R05SYkRXdXRremM1TWR4aDF2UlJWTVpZRUxRUHIwWXU3anI5cnRsK0px?=
 =?utf-8?B?R292RC81MER1dHFSSEEwbWtqRGRNbmwzaFJoTUY0R0pNdW1KWldvMXdZcVk2?=
 =?utf-8?B?aWNHTGRja2FZSTN3UjAwZkhSaDRmb1dHWTloYjRrQ0U0SXBlN1FHUTlseVdE?=
 =?utf-8?B?MFY4UFI0UXJzdFp2YlQzMlRqbUJpc3BpRnJTWlB0NEM1T0VYUG9mK3hGQWhn?=
 =?utf-8?B?bHU4OFV0TXlodWlyZ0JzaTFBZEIvaWpueHZxQ2FCWlRJT3Yram1MOFI2cDdV?=
 =?utf-8?B?VDFNeFhxeCs4T09xSGZnOE01WnhiVWZ4RE5KZjdRbi9ESVdQSW9mNkY1bmdE?=
 =?utf-8?B?UWIxaVNjYy9CbDREcnVKSjJ0MjlHT0xmVDNOOWJVM1E3ekhXMGlRUlBTNHlz?=
 =?utf-8?B?K0RRY2dybEpQS0hkNTQza24yV05lMm5RU1Q2bGx6Yy80bzdCektmVkVMUTFh?=
 =?utf-8?B?d1hQemhKOHdKQzd4N09qdHEwVTJNY0V0aDk0ZzFwVFR5d1JUWG1mUXJTY1RP?=
 =?utf-8?B?MTIyYnZJbm91RS9yTkNVOUtJU1lDREx4RnBHQXVXV1lUcVNzWmpkbXo3SVNZ?=
 =?utf-8?B?Uy8yOGhLR3UrM0MyQTY4UHM5MDhDbnhGaGExYkRWRDZWSklyZVV2Yk9Ya3Fx?=
 =?utf-8?B?UU04SmJtcmZBZmMzamNQSUxMNW54RUEraTRHQy80R0QyMmNSSWgxQXROdVFp?=
 =?utf-8?B?RWo4NGFMdWI4bmVkRjRNaWJ4MVlPQnpWZUlMbXAyL0JyVmRrOVRKVXA1Y1FZ?=
 =?utf-8?B?cUd6OEZ3U1dOWHB0NlJUOXJqbk5uSHNKSFBldDNVOWRPazJYYnl4TytJeXNL?=
 =?utf-8?B?dEJGNDdBYm5ZSENVNElSUzZMQ21FclVWcEd1c3k3QzRDWHRhTHNuT09wWHF3?=
 =?utf-8?B?YnR2YlBqN25FS251LzRWOUxlaGkvaFhpT2N1T09VTVZ0VWE2YlZiYXBxYjI1?=
 =?utf-8?B?QlVMS0ZTL1FCVGRJTi91WFN2ZkNoMmJwMlc5M2RuTkJBMzVzKzNQdFJWRDVC?=
 =?utf-8?B?UUN5bjVJTDE1bVNBcDU0Q0xiR1lqWUlVZGNJWXk0QitUUVo2Y29RVkVqM3V0?=
 =?utf-8?B?cFcyS1NTS1NnQ292WW5kMjFHd0cxRkNhYUJrQVlnL290ZmNLcWlyeGMwd0F0?=
 =?utf-8?B?MktjVW1QZ2psSEZlQmlaenduczdGRzlHdlRBMWViZ2tpdGM4a3FhOEd4Sk5G?=
 =?utf-8?B?dU1yaU5UNU9hRWxUOERsMTRZMStLNjRnMzBwNUQ1VDRSdHd3MGFUQ202bkRM?=
 =?utf-8?B?ODdEa05PMFVaZHErQ3dadzV4VlB5ZUJoNnpXS3JhRjRSKzRjSXhsWHBuWVY2?=
 =?utf-8?B?WUplM0RSWkFIdkE3R2V6amRKQURBM1phdG45OUhSYW9xZ05yc1VsM0JFdGJW?=
 =?utf-8?B?NG5ieWVaaXFSUW14Y3RRRDgvdnBpeDZkMFBBNk1veE1QR3ZCTUhNV2licHRN?=
 =?utf-8?B?Mkhxd2NFa1kxRURIRVFQSkErNmgrREJRbzJHYnFZdGwxZzN3ejQ0RlBuTU95?=
 =?utf-8?B?TkU0bWMvQUxBK3FzUzN3d0dsMUhyckxGUmNaaVBMNFE0dUNycS9ScEJjU1Jt?=
 =?utf-8?B?ejJ0dWNFc0dmMnI5RStpZ3NqUDVnUmlCUFRDZnA0VVBGRlJMYW92SURQWTNz?=
 =?utf-8?B?K3FHYXNSd2g0ZmFlVGV2REc4dWV6UnR6eXdzMVlMem1GMHhrMGRmR3RIamlz?=
 =?utf-8?B?QjJXNGM5RDB3L3l0NHBNVFlQNkQwQkhaK3NDYkhjSU44c3BRbGdtbEk5c2tw?=
 =?utf-8?B?VDRRbjVBQWthYjE1U3NyM0hlSWVTdWM1Y0xId2R4RHJBYUNDdWt5RGVUTWwz?=
 =?utf-8?B?YmZaaSsvdVd5SUQ0bzFaSWRmdkNoOVQzVy9zUGtSazkrZ1kxWjkzSklVNnll?=
 =?utf-8?Q?s9ILtKxEmwk=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10604
X-CodeTwo-MessageID: 59346812-6113-4e1a-89a7-4541709b0935.20250903111236@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 10ac28fc-120f-41b6-40e0-08ddeadac86b
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|7416014|376014|36860700013|14060799003|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OThkazV0eE9lTkdRVnZCcjEyZjh2dWJBVUhxcmJFWENKWWNacVdzOTl6Wkg2?=
 =?utf-8?B?cFJrak9DcjhIS3J4aTNxLzVqaWlxM3JXeDVjLzlxdStEeVZXU3RYWndDUHky?=
 =?utf-8?B?b3Buc3VvNXhITDFQZkU2eEZiWGo3UTJrSlJCaHhTdFFISFJEU3dGMVRrWW42?=
 =?utf-8?B?T09yNTV4eThlb0JPQnMwRjhBb05kb281dEo2NzFZTjR0T2gvd05hOSs3cW5r?=
 =?utf-8?B?VzhLbEtrQThIcmp5TUlxanFLVkwzQkZ3TTdXc3VxTEhkNHZVaTNHNmhDYmcx?=
 =?utf-8?B?MUZmUmE5NGp0YlBHVTVjMkloWlFGQ1dQM1FKRzRUWW1YVHB4bWJsWmZDMXNz?=
 =?utf-8?B?K2NUZmRQUHNrMHhYQk84WTZRbXBMRzE3MFhMeVQrL2p1LzUzQzZmTzlFQjUv?=
 =?utf-8?B?blNGazZpTGNwYWI5VjF4ZEZneVNhZXBKaHUzcUtob2tsZVlNRXhoMjhjMTd5?=
 =?utf-8?B?czF5aWZrQ0IralFvTWJUMU1XODV1RzhPVE9YeityTURaUGw5VUpyUktwK1Vs?=
 =?utf-8?B?TzNVOHl4SG11QUFZM1JjK1B0OCtnZUVYeW1qZ0VJZHc1bkhGSzNtT3AySTZC?=
 =?utf-8?B?cTVrYXNnVEx4Wnh1cjRkMzU4a1VpTUJEeTRFZTA4bklnUitVdlZma3lmTU5w?=
 =?utf-8?B?K2p6M2YyMnFFaXAyYWdUM3A3NFZaMlpzYWdxNU9yeG9nVCtWRld5NHFOdXl0?=
 =?utf-8?B?ZWZGc2hSdVkzTHZXaXFjWWVvZE5VbzN2L3FTaFM5SDEvbGRTTEJ0ekdXVjJD?=
 =?utf-8?B?WmNSa2ZERWJRakpkSzBNaVgwaVNwKzJLV1h6Yy9keklzR0dhNExubWVIUHhv?=
 =?utf-8?B?Z0dZeFhMVWNzdnY3WmFnTzJZaHRraC9RYWFaQkJKLy8wZStsN2h5akpEL1pw?=
 =?utf-8?B?RVl5dGxXRGlpTVVscXJNSlZMc0I1Um1VR2VaWUppbXM1UVQ4anowN0QwNzFt?=
 =?utf-8?B?bFU4bFZtN2FWYUJnQU1manV6anYzMHJPWTAvbUlKUEYrSkE1dlVYTmUvRUQw?=
 =?utf-8?B?QzRQdUVrYnV6TmkyL3YzbGNjREErUWhiSUladjFDckZCMDlDb0ZlTWhIcW8x?=
 =?utf-8?B?OWpJZVN2RWsrS1ZnYk1HUjBiSTd1a09BWkpsTHA2QS9wK3l6YTZUV0ltTEx3?=
 =?utf-8?B?TFdGOGtndmxYUHdnQW5vNW9VYkZYV2k1OUtTME41Yk16VzdGeFhMMmNMRDly?=
 =?utf-8?B?bGYyZkFrV1M4RkV6d29peU80M1BKL25DbmdsRmVRR0hoWDlwZkdlaGt1ZEtx?=
 =?utf-8?B?QnNxVTlOSnpCc0xZeCtReWlZb0dTT0dyM0NOTFZNV3FyYlNpNmU0NXd1bTBp?=
 =?utf-8?B?SU9uWVFpK3hhZEF3Z1NxRCtUcEZRa2FINVJuckF5dWxkRnhYRkp5eGt2cDVC?=
 =?utf-8?B?ekYwR1BPcE9GaUk5SXpuZS80N05xdmREcW44R29SUUpYNzh0ZFNraGdJRUtZ?=
 =?utf-8?B?YWNQMks0c3haZGwzYjVmRld1VTgwbHNENkx5ZWxUSHI3eUlzRCtaeGo2WlRS?=
 =?utf-8?B?RDB4NzhnOFNKM3E4QW9xaG1kcG1oTm5Wa2ttejQwNFpUSWhKUTJxOVEzTjcx?=
 =?utf-8?B?S3R6TEJTRUhZcW5lcDhSSG1ybmZHTjM4amVPa01mR3pyUXgzd1ladXN0cjZC?=
 =?utf-8?B?eFBwdmNzMWpWNStCcUVhL2dZTWFwTS83eGR1bXN2eVVPWU1EMytkMURQUXlH?=
 =?utf-8?B?RCtZSitVR0M5V1R4R2UvL1p6VGdzenBlQUFLTUNyNU9VT2FSdzd6MjlLS1pD?=
 =?utf-8?B?Q1lERDNMWnk1WDZNcmFZM0VYVkhpWjhWSURyZVBnanFFWjV5ejNZYzhHTVlh?=
 =?utf-8?B?RGZwQis1enREUmo1N2NsS1VaVXR0Vy9waDlod2MxUmFOZm5wL2pLTW53YjEz?=
 =?utf-8?B?R3NpankyTS9seGtOazg2d0FqYi9iRG1LVjFYRHY0eERXV3pnaElVamJFbzht?=
 =?utf-8?B?b2E3NGRUTTJLUUFOdit0Nk9Gb09tQkd3dVhUOGhVL3A5TDdrb3o4dnJ3WjJ2?=
 =?utf-8?B?QnZqK0psQmE5SE93Q0JFYTlzc2tEcUpqS00ram15ZEJ4L0pBanExeGFJTHJX?=
 =?utf-8?Q?+NDAgT?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(7416014)(376014)(36860700013)(14060799003)(1800799024);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 11:12:37.4334 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4543362f-e459-4bf5-825f-08ddeadaca56
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11517
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

On 03-09-2025 08:17, Mike Looijmans wrote:
> On 02-09-2025 19:29, Maxime Ripard wrote:
>> On Mon, Sep 01, 2025 at 04:29:01PM +0200, Mike Looijmans wrote:
>>> +=C2=A0 ti,retimer-threshold-hz:
>>> +=C2=A0=C2=A0=C2=A0 minimum: 25000000
>>> +=C2=A0=C2=A0=C2=A0 maximum: 600000000
>>> +=C2=A0=C2=A0=C2=A0 default: 200000000
>>> +=C2=A0=C2=A0=C2=A0 description:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Cross-over point. Up until this pixel c=
lock frequency
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the chip remains in the low-power redri=
ver mode. Above
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the threshold the chip should operate i=
n retimer mode.
>> Why should anyone want to tune this at the firmware level?
>
> It's a board property. You'd set this based on the hardware you've solder=
ed=20
> on. If your clock and serdes are good quality, there's no need for the ch=
ip=20
> to be in retimer mode (it will consume more power and actually make the=20
> signal worse). At higher speeds, that situation may change, hence the nee=
d=20
> for a way to describe that. The chip has a similar function built in, but=
=20
> with only 2 choices of cross-over point.
>
> To tune these parameters (retimer, equalizer), you'll probably have to ta=
ke=20
> your equipment to a test facility (like we did). It's not something that=
=20
> end-users would want to tune themselves.
>
> Most of these settings can also be done using pin strapping. I guess it'd=
 be=20
> helpful if I added that to the description.

Looking back at the datasheet - once you enable the I2C interface of the pi=
n,=20
many of the pinstrapping options are no longer available (such as slew-rate=
,=20
dvi/hdmi mode, equalizer and termination). The devicetree properties allow=
=20
these settings to be applied again.

> ...
>
M.



