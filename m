Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2AFBEC832
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 07:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B520810E05D;
	Sat, 18 Oct 2025 05:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="NpIk962p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011045.outbound.protection.outlook.com
 [40.107.130.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA27210E05D
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 05:44:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p98hwQeFKnxUq19PWUnMp6xn22hZJfl4PnB7Jj7DHGmkS3lZiySReKy2SZwGGbMPIxTc9ENBD8xNsyAy3UXNFrmNDJiXkE8Fc4UNEjW8fexxaGOIZNXlEs2j3juAWvkQE1qhtv2qHT8FhdDanjRqNP+wezpZde91ugDVEN9gORqfNmr9XwcBc2An7H++wece27DhCfvNnwBYsPXtnCX2AtsevUG7/k8vF8y4lqbtPrXkb9XUP0Di6oSKTM5+CtyoUUWWNaXkG5Isi0yY7cjfBF+YhgSGndB9o9Fe5T8KEdajIMsXRXyW8jefuHRxiNK+5qt8SMOVFza5FLOwazdRfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdVqWMAUUbWSecNNBZdzlXCi820HsrMJi5iB6WJDH1s=;
 b=j6bVLNT5ZBlBhcpa+jS5NgCrn7xd3WTvfrYX0FkIDHV2thmlWR9tjfo8EUvZbV/K0FoTbKGy4T7+fMmmblC6iY5UTuRgEDbm90auRylsNQt9rzCZ1a14XVhDEd/NUiFu5ceAaHhsWgLIAqJc0t38KrWAw7H/dWl+0OgoW33j/5uFLmSInVKIQfStuSGz8evSUmrdejz3Vv26UFDc3YalxZ+xKiDVSQ7z2wXFkrdx35Kc34IL0RLV8a8RM904+XFL8pZldAuWTP9hWe8abzc2EcScb7xYB97hJCgjJJFBWW0i8mAm3AUFtfXLdVdBNAm4tmz97qwBTs3EK7t1ECB5LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdVqWMAUUbWSecNNBZdzlXCi820HsrMJi5iB6WJDH1s=;
 b=NpIk962p0scyM/Wp/5o2dNfkPDWgG+EgK5Xjp9yLSM0ZxO76f2aBzFqawcE+SCjmf5DFgf0+Tnau1PgBrTn4Zhyz7RIj6ZoupqRQOjMu6dRAxfBYm0BJ8Bp9WruzGCmP4GcXdm6vNXbvWkb79vZJ/pjsCJAm6MILtQPkXA/6vkCHDFmuFfC2OTddS6ptAv4K/tv+n0aWRgSvYXNfd0VLR7jE0sf25yDWllLzpy8obHDyvVbSHgt54dwGOiiS92gqjVfTLILq9bhXB9zZ01Yj7QqGk0cMKl+BssYIhzLK7ost9Ky+SoQfRfgKCFtdT4N255lhXFgu0P7mfZRAmGAc3w==
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9463.eurprd04.prod.outlook.com (2603:10a6:102:2ab::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.14; Sat, 18 Oct
 2025 05:44:35 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.011; Sat, 18 Oct 2025
 05:44:35 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>, Frank Li <frank.li@nxp.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Abel
 Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam
 <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 03/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller processing units
Thread-Topic: [PATCH 03/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller processing units
Thread-Index: AQHcOtDpq/HIeI920U2ay67GHTY3jLTATQyAgAE/OgCAAWIMgIAAFnKAgAEOngCAAmmBAIAA7AnQ
Date: Sat, 18 Oct 2025 05:44:34 +0000
Message-ID: <AM7PR04MB70469596D08C61B712208B9A98F7A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-4-marek.vasut@mailbox.org>
 <aO0tmUWA5H0J80Ov@lizhi-Precision-Tower-5810>
 <260b4db1-c02a-48a0-baf8-5e217c729824@mailbox.org>
 <e3ab9421-61a5-4ab6-8c72-6b0ab340f3a8@nxp.com>
 <ae9d1289-c0f9-47b9-b6be-e39d170425a2@mailbox.org>
 <a9a9867c-2653-45f0-89a2-39132335aac9@nxp.com>
 <49a97a81-f5db-40c7-83ae-2e12b790a6ae@mailbox.org>
In-Reply-To: <49a97a81-f5db-40c7-83ae-2e12b790a6ae@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|PA4PR04MB9463:EE_
x-ms-office365-filtering-correlation-id: e07f2054-3b0f-4a01-d315-08de0e096b3d
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|19092799006|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?enhseWFPaGZ5QkN0dzFHck9TZDZiOURQajBDb3ZBQWJzWWhUQ0dkWkRuREo1?=
 =?utf-8?B?VTRhbFc0R2QyNGt6ckwvbGhMQWhVbUp5RGxGM1p1S3JvSHhQMEhKdGM2RUJ3?=
 =?utf-8?B?OG9KUzFvRGhsZnJMN0N4M3Vva2REOURFTFNwTzlLV2RxcjdQSm85dG1RVnUr?=
 =?utf-8?B?N01CZTZ4bHRqYURtTVplNUY0YTFMektldWZRelc2MzVzbEtUWEZvYkFhQS9N?=
 =?utf-8?B?SjVESHB6ZE05SGVrOHRyN3VacnVlZVRYZm1ESUdyTTh4Q01ITmtYYXZKanJJ?=
 =?utf-8?B?b1lLY3JKd3o2bDNuVTBRa05CRlR1NFdsaGwyR0RtTnc0Q1ZwMTZEL2R6d0g1?=
 =?utf-8?B?SGpSMlBvdlNDVlJ6RVdZL1ZHRytpOE9uU0dTM0ZtanBsMStjOGZ6cmRFNmJS?=
 =?utf-8?B?ZkVWNUgxcSt0QTBUNkJCUzM2bjlVS1BUdmRDRDNIeCtwZ2pGclVWOStrVllo?=
 =?utf-8?B?WllNUjgrTVJ2MHd3QUNjMVBPZlpBOVpMWnRiUys3akdTUElrcVdROTBLemxH?=
 =?utf-8?B?RFpqTzlWR2kxL3dYeEIvNjBrUlloQW9jamsxZ2JIc1FnQWdDSHFPb2h2QlFK?=
 =?utf-8?B?SEZhUDN0MHV1a0lkOXVUdGhsSjVBRTU5NWQ3SGUyd055b0Fob0dVY0s3cFlr?=
 =?utf-8?B?Ymk5K05WY1h1KzQwaG1Gdi9KWE10MmJaN0lIOGI4d3NRYjZOUldRcnBSYzkx?=
 =?utf-8?B?UVNzTjJueDh0a2MwWWh1TGo3VHFvR3hYZmlHeDdobzc0MmE3YkoxZGFoTXB4?=
 =?utf-8?B?NGNhYUVNRllJZEw2MkNYUnRzYzA1TnpDekxQcTJkcUxJK25WSTVIVmlTaVVS?=
 =?utf-8?B?Tlh1N294bDZCN3BWZGkzYUl1WWtZSlMvQkFQcHpGNHoyK0c5d3Z0SDZDV0dt?=
 =?utf-8?B?eFU1OWROZ1lzbzQ0dVB5THUwLzdaR252NW02a253MWJSeGhXaE9HZG9YZVVy?=
 =?utf-8?B?US9CT01BaDd1U3lkNURJTWNBR01mOU1GSnBrMW9iUndJNEhuV2dQdy9yRHlW?=
 =?utf-8?B?bmlibFZXQ0RVY3E1VFlEZ3hvRW9jbnZ4TTZ6RnphZ1laSWY1RVlmWkEvSGdt?=
 =?utf-8?B?anBhd1FGanhqNmZJaW9DUkVRL2N1b2pKUTh5QU5KUnJQVjNyWWVjcXVyV0RR?=
 =?utf-8?B?Sjg1aEVGMzcwN0s3UGUrTEZNeVd2QUNDVXVaRGZmKy9CZnR3azJGVU11MG5Y?=
 =?utf-8?B?TDlKRGZkczRvZVg2S0M2TFlXZ3AranQ3UEdUMkVBelJGeXVEY0dmM3dQa2xX?=
 =?utf-8?B?NWRpNXlvMWh2R0NVM3RDQWdzU0hQNi9Qck45TERTTkxJNGVINERwQnZrY0VN?=
 =?utf-8?B?bFVLSTFZbU5wbERaeVllY3NFd3lrYUVaUUV2MHl0Rkl3WjNPNWJjcDNiYXVy?=
 =?utf-8?B?cVI1WlhmSWV1SHF6SDhuWWdLQ1pucWs0UFN5MmhWRTlvbDluK3JIeUlNYkpo?=
 =?utf-8?B?d2tJU3VseVhSMm5IMXVnMUtSYVdaODJ6L3RWdC93ZHhNRStpT1ZBeUFWOFlS?=
 =?utf-8?B?SllxdVBtSHR6VXEyWXdvZXA0U3VVZFlMZUZXdkoyY3lud1lWUUMwcFZkclc4?=
 =?utf-8?B?OXRhMU9NM3g5UkxWVlNDUGRXeDlMRnZDWDk2UnFXYi9ETkhsTlJqaElUbTAx?=
 =?utf-8?B?am5jZU43anNSekw2RExJM093K05wZWFzOVF5aHJ5TjZrOTRpbDZhai96MHVT?=
 =?utf-8?B?Y2N2TGhqdC9FeU16NUw2Vk1pSUhVeXNMZmN4ajBsaW9PNktmYmsyVEszWXh5?=
 =?utf-8?B?WDk0ckhSd29LTFNRbGFEMmxuWGhBb3RuUjB0a2xYVEpjMlhZM0FLOTdEZit1?=
 =?utf-8?B?eWdWaFBuZE5HVlFtczIvSmlLdGh6Q2l5VW0xalhuNnNReGJUY3RKWlJpMmwy?=
 =?utf-8?B?N2RzdUVQNkV0RUw5djF1Y1FNR1dJTEhiM2ZjYXI4b2N2dmZ6TVFzUVh2RnVC?=
 =?utf-8?B?K2duVXRDdGVJVkNuUUNpVVc5eC9ocnFHVklQR0I0ME5IaTdVRXFTUWZodDU1?=
 =?utf-8?B?VmZtdnpmcTFKTEIxektCQjhJWnlCVXU5bk1iZjVIK3k3SkV0eVJhQzFoeGFz?=
 =?utf-8?Q?zf+hcF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(366016)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTVLSCs5elcrb1JBMmsrNDFqNWpub2huOXpzNnd5RXBGQVkyN2lsb2g2RitN?=
 =?utf-8?B?WGNZY0NFUi9aUGF6anFvSitKVnJWNVU2TGx4TG5tQ0pURjZaWmpBeHNJMy9J?=
 =?utf-8?B?VjcyMmdhSTVjMk5IUTA0SlhIRlRQdVFiTE56Ti9kT0M5VFByelRZUHFoT0RP?=
 =?utf-8?B?cnhycjV0ZHVEa21nT0lySXdkb25jNGV4SENiZlNubEZaQ2hGN201dGpJZzlT?=
 =?utf-8?B?ejFWK0FoeVZWL2p2SllXZVlqQVpVOFhMajJaSTJWUDQwb1puK0hkUHlzTW1K?=
 =?utf-8?B?VnhldEYzV1k5RVdZQS9pL2cxREdXZzdvY3drTEt2azJJdThGZnVteWtJdk5K?=
 =?utf-8?B?TStnckM4ZVNDbzhoYTJoZmYwbG5xc015YWRjZWRab0FxLzdlNkhBdWs3MnhL?=
 =?utf-8?B?dGJDQTgwaWtMbHFWZFJ4bzA0cUgyZjJ0UFlMOW0wQzBQM2VMbVdXL25OWVdN?=
 =?utf-8?B?WVNuaXB1cW0xTHBBdTByTlU3NWxRclc3TEU5RjNtdzlHWmIxNEJIblVvNGtk?=
 =?utf-8?B?RTlEenZoSi9QZ0wva0wvZDhKWWJKeWtnOWkreWpoTzZnbU4rcEtwSHBpRy93?=
 =?utf-8?B?NWJhUm9pR3lRU05rYkU0VHdkQ1BkdXduRzFYbnhMSUtNNTI1RUl0R3ExRW5O?=
 =?utf-8?B?Rmc1RkQvS3NJVkNEWWFSY3U2UitkWHF4TldxbW9hM2VQUzZEUktzNjJ2aWw0?=
 =?utf-8?B?dGZGeWdJcm85R3VoVkIvWXpGZkd3VFNyQW5UNXNuWHBVR0h1ZDJWTnBDcXVm?=
 =?utf-8?B?REI0YUh6N3E5Z2J0U3FZd3NWNzNGQ3N1RzdDbWd2SE50dmVkVHFldnljTlRp?=
 =?utf-8?B?M0psaGpxZHVNMUFnd2Fwb1VCVzRBNXNKdElhMjk3RnVBQ0tkajhhckZlWXg4?=
 =?utf-8?B?RENCWUh5UWtaZXZLVlNlaHZINWtSQlpiNDNqamNmV3F6YmhFd21Hb0VpKzYz?=
 =?utf-8?B?WkJoQittcFFVZjVJNmswWVJFcXFJTlpVYkpHbXY5Rm9ObzBzOGR2RnN4QTd6?=
 =?utf-8?B?S0FXZGtvMEpBTEJ1cWpvT0VtWkU3MWZiWThlVURPcHlOOFk3TXl5ekVMNTJs?=
 =?utf-8?B?WWpJTHZ1TzRlWlZMNUhrN0RNeWJzbHBTMzZVakJ5NXJMaXhRNmdJcDZmVXgz?=
 =?utf-8?B?V29RWHNUNUR0b1dTMXpkdGN3akRhdlpOd1ZwT09HbXNEZmlEUm9IZkJsRm44?=
 =?utf-8?B?eDBmMTAzWVFxWG1zcmJTeEJMckUyZ2YwWHBlUUphQlN1MXhxd1c3K0svck5w?=
 =?utf-8?B?RE0wck1lald4QnlyUzNQVXNjVHNpbmRpNE5uOXFaa3djQTBYTXhoUEtGNEhv?=
 =?utf-8?B?S2NFZ3dqbG56aGl5VzByQ2VrTkRTTGN3UUxjR0JOS0RHYVdoeUk2Slp5NFNj?=
 =?utf-8?B?NzdLalp2amcwaEFxQkhwalpuZGprUzU4RTB2Vm1FejhjS2VzZGNNd3dqb00z?=
 =?utf-8?B?ZVpXRXNDZmNVbFEwYlpGYTBDVHJIaFMzRzBEaDRXLy83TERONFRVK0paZnF3?=
 =?utf-8?B?SWZyRG5wcnpOOEg3UDNrN2dGc0NSc0QzMml5YjZlY0xqUTVjTTNmZ05hOVV2?=
 =?utf-8?B?YVFXVHgrTy9ITDRYbExmWDZvU3hkUko3NXNML0Z0Tmk2ZDgrMWJGbmZRVFpj?=
 =?utf-8?B?ekpudi9EKzROaUo5bUY1Vk9JdE5QQUtXd2FuQk40UXBVSjlwQXczckNYelhy?=
 =?utf-8?B?Zlpudi9uR2FYUzNoLzYySlhXaDJ6VjduRWx0TWxmdHZ6OUUvVUdBeEpVT25G?=
 =?utf-8?B?S0swUmVJb2VwSUtGSyt0b2pvRGRTM2lsdkt1T3lyOTZ4Y2V6UHRhd0FWampu?=
 =?utf-8?B?NXljM2s0R1A0V0k4WGVRVTB2RnQralBlT0E0eDFYZXU4WldKeUhINGloaVBq?=
 =?utf-8?B?blNyVXUvUWpWZmFkdHBOV0UvSFpaU0JzMEhEcDAxYW9VRmtBUkZNNExVd0NU?=
 =?utf-8?B?bUtPMlBBRC85V3k3Z2pwaGhNZkdWdXJQeDVJblM0cXBuQTZLTnB5ejZ3amE3?=
 =?utf-8?B?LzBwRHR2dXpmTytNdEdKcXEvZEVHc2pwTjB1d2dnbDY2MHFjWm1GTnh1VVdr?=
 =?utf-8?B?cUhyL1VldnE5QU9xOWtGWG9EcEE1TTcxeXBCS3h4RGpIazZYTzdsNEN1N25S?=
 =?utf-8?Q?7/Dg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e07f2054-3b0f-4a01-d315-08de0e096b3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2025 05:44:34.9759 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /b4m1K9LEGJR9H23M2hk/tUh9PSk4SkGG7k+xKJygyJfUIxSXD/YmRk0r5G8vtO0/+yWkD4NrhH940Zmro+1jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9463
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

T24gMTAvMTcvMjUsIE1hcmVrIFZhc3V0IDxtYXJlay52YXN1dEBtYWlsYm94Lm9yZz4gd3JvdGU6
DQo+IE9uIDEwLzE2LzI1IDQ6MjggQU0sIExpdSBZaW5nIHdyb3RlOg0KPiANCj4gSGVsbG8gTGl1
LA0KDQpIZWxsbyBNYXJlaywNCg0KPiANCj4gPiBIYXZlIHlvdSBnb3QgaS5NWDk1IERDIElQIHNw
ZWM/ICBJZiBubywgdGhlbiBpdCB3b3VsZCBiZSBkaWZmaWN1bHQgZm9yIHlvdSB0bw0KPiA+IHdy
aXRlIERUIGJpbmRpbmdzIGZvciBhbGwgaS5NWDk1IERDIHVuaXRzLiAgTm90ZSB0aGF0IHRoaXMg
aXMgc29tZXRoaW5nDQo+ID4gbmVjZXNzYXJ5IHRvIGRvLg0KPiANCj4gTm9wZSwgc3RpbGwgd2Fp
dGluZyBmb3IgdGhvc2UuDQo+IA0KPiA+IEFuZCwgYSBiaXQgbW9yZSBpbmZvcm1hdGlvbiBhYm91
dCBkaXNwbGF5IHBpcGVsaW5lcyBpbiBpLk1YOTUgZGlzcGxheQ0KPiBkb21haW46DQo+ID4NCj4g
PiBEaXRoZXIgLT4gcGl4ZWwgaW50ZXJsZWF2ZXIgLT4gcGl4ZWwgbGluayBsb29wYmFjayAtPiBj
YW1lcmEgZG9tYWluDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBwaXhlbCBs
aW5rIC0+IE1JUEkgRFNJIGNvbnRyb2xsZXINCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0+IHBpeGVsIG1hcHBlcihMREIpDQo+ID4NCj4gPiBOb3RlIHRoYXQgTlhQIGRvd25zdHJl
YW0ga2VybmVsIHdyb25nbHkgYWRkcyBwaXhlbCBsaW5rIGJldHdlZW4gcGl4ZWwNCj4gPiBpbnRl
cmxlYXZlciBhbmQgcGl4ZWwgbWFwcGVyIGR1ZSB0byBhbWJpZ3VvdXMgaS5NWDk1IFRSTS4NCj4g
SXMgbXkgdW5kZXJzdGFuZGluZyBjb3JyZWN0LCB0aGF0IHRoZSBEaXRoZXIgVW5pdCB+PSBEaXNw
bGF5IEVuZ2luZSA/DQoNCk5vcGUsIERpdGhlciBVbml0IGlzIGEgY29tcG9uZW50IG9mIERpc3Bs
YXkgRW5naW5lLiAgWW91IG1heSB0YWtlIGEgbG9vayBhdA0KZnNsLGlteDhxeHAtZGMtZGlzcGxh
eS1lbmdpbmUueWFtbCB3aG9zZSBwYXR0ZXJuUHJvcGVydGllcyBsaXN0cyBhbGwgY29tcG9uZW50
cw0Kb2YgaS5NWDhxeHAgREMgRGlzcGxheSBFbmdpbmUgYW5kIERpdGhlciBVbml0IGlzIG9uZSBv
ZiB0aGVtLg0KDQppLk1YOTUgREMgRGlzcGxheSBFbmdpbmUgaGFzIGJlbG93IGNvbXBvbmVudHM6
DQpEb21haW4gQmxlbmQgVW5pdCwgRnJhbWUgR2VuZXJhdG9yLCBDb2xvciBNYXRyaXgsIExVVCAz
RCwgRGl0aGVyIFVuaXQsIGZyb20NCnRoZSBmaXJzdCBpbnB1dCBjb21wb25lbnQgdG8gdGhlIGxh
c3Qgb3V0cHV0IGNvbXBvbmVudCwgYW5kIGFkZGl0aW9uYWxseSwNClNpZ25hdHVyZSBVbml0IGFu
ZCBJREhhc2ggVW5pdCB3aGljaCBiZSBjb25maWd1cmVkIHRvIHRhcCBmcm9tIHNvbWUgb2YgdGhl
DQphYm92ZSBjb21wb25lbnRzLg0KDQpMaXUgWWluZw0K
