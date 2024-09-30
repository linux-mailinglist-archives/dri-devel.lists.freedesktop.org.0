Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA0C989EAE
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 11:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBE610E2DB;
	Mon, 30 Sep 2024 09:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="SS9hym5N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011031.outbound.protection.outlook.com [52.101.65.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB6710E3DF
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 09:48:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ex7SAP+HOGLVT69C2b/0HufCZ/5HoAM7F2/pvm4D/u958szxDaiuCfplAe0JKAcvhN0odeGz/AwsELV3LJRzv16rGR3hxyekSbbIato4OntRB4SKRoKdZASfRBC8Wx33+syFqWfZJyzDVAFtrVaBihk9m+AQkns88Ffl9mk8cGm1mOzDWzr4jogsL9KTQAOFB28E6kEIqGIl8bC9UW7iQo9GK71TxTMMY0CjLpdX9dOZi06rR9/C+AZ5459g9qE+JKnbiOcmrst7aZqZxL8LLF9l3Lxl7287szhnba0fowgcKHoEV/0InVvNm1JS8rjtiLjtMblHzj/ohIW/iif0SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9Xm10zBkU0KipWQta9kUyrasaz8C0Xj80kX0Xetvq4=;
 b=pi8UQ6m3VXdNHS7U8A61Q0HaRoN/qqU5U8cyb0o9QjFojFlURyf4f460ImaO23BrsADZm6aXxHibXmOmiLzntACopYJkeHa2ZxmzrEni2ua9rLvc/wUeHMrGDpT4VyahgzxE9xE62IsMVlOXtVJTZlPnBWbf4xDaEL9VtKkaQE06wmuQrEAZsPznUIrfKa4OFcEKYNWgCdqkzJav0l60EEyHrntzW2evv26mfzFcSgLhyVmvTBmY64SMrsuUS7nGk2D4aPqjmXA7z4Zp7UtTMAY5AzgqswRV7zvEQg2S269LNLJ25SkEt0gZf13knwO3xSw6HOg1+Nj3snRxgm7VCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9Xm10zBkU0KipWQta9kUyrasaz8C0Xj80kX0Xetvq4=;
 b=SS9hym5NJ/RNCHndKfsi/n/hTRTZC9Tz0XgI0gmutCWg8JKAl9VVpnpOSvCWWbQUpmTNtBNkQPfeZj5cAgNvr06ZKudE+STg9AIz8VEWjC8kY7AV4Zl8hC3v5Fws8oWGxz86VSP3TGZd3UJbDrrZ3BAjtnSji8P7r0goSKVAZuqeBzQ3D1GVJo72cjwWCfTOpVxI7NbdXyubf6dJwNOAcuFBGliNQm4e5pOsQOzn618bBMlWot2gOPqGoWEFiUUtEJv26iXEeoGoL7A9BeAifs5L1qLCDbxEDParVKnbwIXTgqj30nBW8ev4cKbkuDxIn17QU9fBgzQYYeH0ltVEJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9399.eurprd04.prod.outlook.com (2603:10a6:102:2b3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 09:48:16 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 09:48:16 +0000
Message-ID: <a37ae7bd-24de-4397-86c1-94f542f5c7d9@nxp.com>
Date: Mon, 30 Sep 2024 17:48:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] dt-bindings: display: bridge: Add ITE IT6263 LVDS to
 HDMI converter
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
 "y.moog@phytec.de" <y.moog@phytec.de>
References: <20240930052903.168881-1-victor.liu@nxp.com>
 <20240930052903.168881-6-victor.liu@nxp.com>
 <TY3PR01MB11346CF2BE6F838A718E64F5586762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <b5ad1ace-4a0e-4a17-91f3-6b374ef168c7@nxp.com>
 <TYWPR01MB1134310A59DF5B26D97954FAC86762@TYWPR01MB11343.jpnprd01.prod.outlook.com>
 <720548c9-bed8-4792-a323-90e472fd7404@nxp.com>
 <TYWPR01MB113438FF29AB596E414D4D1E086762@TYWPR01MB11343.jpnprd01.prod.outlook.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <TYWPR01MB113438FF29AB596E414D4D1E086762@TYWPR01MB11343.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::23) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9399:EE_
X-MS-Office365-Filtering-Correlation-Id: 979d6d15-e4d3-4b02-4f8d-08dce1350206
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2Q1Y3J2bW53UG4vZ24xZnRBU1BHbkowaUdlT0xsUlRiZWZVQk1yaWRmK1JF?=
 =?utf-8?B?VW8zYlFhQnAwVVRpcWJSV29NajMrZFVJOTdvSktYMmJKYit4WTk3cVNDczdi?=
 =?utf-8?B?ak0rKzJrV3Q5THZacFIvclZVZEYreE5tNy9IUzYwTnZtdzhqMlMyMnJUWnZ5?=
 =?utf-8?B?Nzc1bjJ0T0ovVERjQUJtZWFmOWp6NjJTaWF6bVgzOTFIdE5NalNXQU01bmR5?=
 =?utf-8?B?bDBSSEprSDhtRkNXbEVKSXJOWjdPdjlNb3JWUTdOT0lKNjE3SWF0dDRUZ0ln?=
 =?utf-8?B?dXZacWgxcnh3Q2p0ZVRlMWRDaERRMDdINXhhODRvbHh1a0NjMXBKcVI4Ri9Q?=
 =?utf-8?B?a3ZlRy96UHN3T1I3eFEzYlZqVW1ld1RteFJlRGM4NXFEZkltTGZmNkN2cjhz?=
 =?utf-8?B?OTlhR2wvSitabXFiMjNXMXNyOHBIY042N0dMdElsVldUYklxNHJLOXNrQnVK?=
 =?utf-8?B?MVplak9kZThTTWhoZHViQjVjcFk1VXhXQ2taRC9JM3Z2TWwvaXdsTC9oWjMv?=
 =?utf-8?B?MWV4SXhtMmJFWDk5K01iYmxDU2R5TDBzb3hFbU9Zb3lldCtnRy9McGFxOUM3?=
 =?utf-8?B?b0xydUhXVEY3bGNYcXRVdjhzdmI2SHZtaXcwVmJOSmd3Vjh5TEJqclFmOXVY?=
 =?utf-8?B?Z2dGU0NyYlRoNTE5REVHYnpkeDNWeGltbWhyeVlvTnRqRm5XOGw0KzlobDJG?=
 =?utf-8?B?czUrSEw3NjU0TEkwTU1pYTNMMUhId3JXV0hiYTNxVmFDZE1UNDZUN3J2ZmFY?=
 =?utf-8?B?MDAxWG9SUTZ0UVNsNHRidkEvQmg4c1BGOG9Gc0pkWXljSDlRcEtDUnJLUVRu?=
 =?utf-8?B?NlVvNGI2Tm5OUWF5QmQ2WnU4UlVDR2ZkUXRFSGJvM2QybGFaRHdGUlBMZ0pU?=
 =?utf-8?B?cy93TmFEaThydjdvNWhmeTZkbVdEYkdISmJlaFcrQXpLVS9MZzZabU5oSTJF?=
 =?utf-8?B?VE5oajRLVEZKMzhLYnZaUmgva0p1WllWY21PSW1hQkJFam9tVkZCZXZ6M2w3?=
 =?utf-8?B?SUM2K0tzajl4UDNRclBqNitQVzU0K1o4NUdCNHZ6S0syNmhvZlRyNTBJZ01w?=
 =?utf-8?B?Q0ZXejBJTGMxV0RJb1RCcVo5VzljcEd1cWsrVWNWeVF1L1pJTGhTcWRaS1Fh?=
 =?utf-8?B?dEZURnlWR0tkeGZsWnVvQ0c4RG9ydVVWWGFVTFA2cGVrQVM0TGkydU5hUmlv?=
 =?utf-8?B?Tmw3VG9JdGN0WHBWMUJMeE5Ba2ZTS3RSQWJadTU2azJJOXk3VFdVdG1haWt3?=
 =?utf-8?B?Q25XNW15Y3FMZmU0Yy9qVkhiVjRMNDlWVmFjL3YyUDZRa0liM2VySlRsUGxW?=
 =?utf-8?B?MXhVRGtNM0pmTFhPQ05Zd2dWSzI2RDU1M2Rwc0hnQXVpd1hVMndPTnpvZUlC?=
 =?utf-8?B?Uk1tL2hET1g3VU5jd3NOTytqUFQ0aElrL1FibzIrMWVNa1BMYTRwMXpqZ0Jh?=
 =?utf-8?B?cllQMjQ1VThBTmdTSGtLUkx0SzUwZE54bjFQdUFhQUtEMGRwdUc3U2NWQ3ZV?=
 =?utf-8?B?RFMzTER4YWh6RmpTK2IzSGN2b01CSXFqaThDVEpISUZWck83b0tZeFptRVB3?=
 =?utf-8?B?aEp4a0xKL0Z5NEovcDIraXozL3FqOS9DRGhYRzU4YnZ1a3hkM2tFdE1icjZ5?=
 =?utf-8?B?UHRFVU5IMTlhWHZDd3ZUa3c4dExrUGVCU0l0dllCMUd2aStSSktxbW9WMjZ0?=
 =?utf-8?B?c0lqRzVJanFHVC9aYndtcjZHTUM0TmczZ3BNTys3MS9TVW1TNTA1bVkzeGcz?=
 =?utf-8?Q?SDHpSWWSYxcuVN0mI8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDZ4eThFbU1NT1VUM2VZVExrUldEd0hqcGIrcURPellxOGlsMFZHaUw2N2RZ?=
 =?utf-8?B?cThXWEtoMWxLb05MUFcwV1lIdFdJK2lMNTBuZW1ROENrVmlFWi9SanVBVVBT?=
 =?utf-8?B?eTdUWWg3eVUxYVpobk9TR0Z4amNFK2pRL1JkN0FlMkp5aHRuTS9ucUdXUmNo?=
 =?utf-8?B?bzlRTFA3d2xRZXVzTm14MFBQSEtHM0psT0tyb05LdDhTTWQ0V2p2cGUzbGdh?=
 =?utf-8?B?eldTc0ZyenRsajNsTzRFMG1ESVh6dXZncVk0NEsxTlJzbUV0SkRjOHJGL3Ju?=
 =?utf-8?B?c1M1cFhFbHlZYkZtbEFISnYxenoxYWJOa3RVQk10LytUMUE0WlorbnRWSi9O?=
 =?utf-8?B?c0VmTnpRL21Xa3ZoRmY1ZUlCQ2ZjWjQwM0EySFJ2b0sxNk5XaGdJcjdveDFh?=
 =?utf-8?B?V3FVZEpkMmh2OGkwejU5Vk81U1lWMURzTERkWVJzei9uRDFlL0hQb0k0R2ZE?=
 =?utf-8?B?a2lSc1hROTlzWFcxbWtjODdhOTl3bDBvRXRXSDRsYVVJbVJFZndyb3czclNN?=
 =?utf-8?B?MU1xaVdSSjZrYVJvS0k4aEZnQWV2bE5yREFuakZEaUtVbXl1RzBkV1N5Q0Y4?=
 =?utf-8?B?VFVINThUSms3YktRako3cG13dUtqSnpTMW83M29PYzhpejhrbExLU2IzdmFR?=
 =?utf-8?B?U3FjVURHa3M1WHYwSE9aSkdQZDZqaFdZY05FN3ZoYlNpdkhEeXIvQzlyVlNy?=
 =?utf-8?B?ZEJZd0xIYU1UMGF3TTBmWEFmazJDVHJkV0QzQTJENU5aWHJ3aXYwL1J0L0Vz?=
 =?utf-8?B?RWRFdUNYb2ZjeldUVEVEeXRNVG5XMm5HUEpISkNYanFJblczeVVFNnpRYnRk?=
 =?utf-8?B?OUlMR1k2YnRGTW5hcG1RdFdLNG92RnQvTDdNN2hMaERTTFlySlVNME11RWJh?=
 =?utf-8?B?T3h2ak5Cb1J2MW40VEI1K3VkbWJwZ2NyVXBaR0xqQjByY2NkSTVLTFhxL3ZH?=
 =?utf-8?B?WnVtNWlMVVl0T2Q3dXM4THNmNEVzbkkyR2RnQWdoVUZFZGwxRWF6QlF6MmRo?=
 =?utf-8?B?d24xNitZV04zQTFncDU5NSt1UEtGbXEzcTVjVnI3eWo1a1lrRzZIWkkvSjNz?=
 =?utf-8?B?bjZ3eWNtcDBaUDM5RUVBT1NYaVlXU0JTQWtheFJ1NDg0OVlMRUpaQWhrUDRO?=
 =?utf-8?B?SUFsckpzRDhhWXVsMjAyMy9JSlk0VDJLNWRaTWZPN2RSZmZPcS9pdXdDbTFR?=
 =?utf-8?B?UkJESEhZWVNSSUJHZ09PWGh6N1FHd2k5d1ZkZWoweDZnQjNPaFRjUDRzTUpZ?=
 =?utf-8?B?azE1WVBBc0FBSE42bjk4L1NqTE44NnBWQi93OVh6L2xva3pYVFBVRU41QmZz?=
 =?utf-8?B?V0JaVzRLb2ZYSzFnVlZoQ0xnWXlXZ0xrdnJNb01Fek5TMGxvVEdIcm9WSUZq?=
 =?utf-8?B?a2ZXazJzTUZyYzBXQzFHS2c4U1NIVkhSTVRVQzJsRHJQcStvcWpvaERCQVB3?=
 =?utf-8?B?cXFsMUNKMzAvWm8zME51LzZEaG1EczJDTUJzTFRKcjNqQVR5VWFSeVg2dTBX?=
 =?utf-8?B?elFXMzIzbEpZOGVWR0U3bXFySHhTemFVY3MwQTFIS1BMTTUwRW94NzhKaWdN?=
 =?utf-8?B?dGNkS2dIdys4Y0ZnbFlJU28zalFzWkJtZXBMWjhNS2t3Y2dvcmZ1enM4enYr?=
 =?utf-8?B?Mlh3dmhEVEFjUzlIMnhsNEQzSkk1SjlVd09zdnUvY21IQXZRa1J4MlY1MUpI?=
 =?utf-8?B?ek1pWXh1NVB1MmRYZk9nWUpsYWpJa0lUc0ZmOUxnemNSVGJ4Rlc5NzBmN2Nn?=
 =?utf-8?B?bXRGZHdXS1BYNE9uYTBIMnlacEwyMHYyVWpJUVlFV01qbVM1eHVPWjRxTkdT?=
 =?utf-8?B?MHhCSzFXWEVIZ0hjenRHVklqZFNlR2toMGxKTTQ2WVhFRUZLcUs1TDh3bkdC?=
 =?utf-8?B?NXhqY2d6bTBDZXJVUnMwMHVubEhkbGN5REVRUVlkcnVRNHFURUV5QzdCWFFF?=
 =?utf-8?B?SnJHOUZ3dkFUUjdid3gxODIyNCtQa2pZamVLK09ab1oyWEd1dCswNDRWTm9w?=
 =?utf-8?B?Z0RDMVRwTGdYY2RoVitrRW1aSE9JMFhKd1F3K2p3dEF5cklUQzhUYXJyd01p?=
 =?utf-8?B?czhleDMwQWlLRVVkZy9SUk9jWktqbi9nWVVoeEZzQ1gyQnh4UXMveFdRZks4?=
 =?utf-8?Q?5P+rP6yrhjWs4n1iaGyD6Appv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 979d6d15-e4d3-4b02-4f8d-08dce1350206
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 09:48:16.4634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cs28+blse4poIg2ygojeY1D542bMTxkzPbcrB8oLpjsfAXktasSLMdwqzifItOTI7eI5BeuTHAGjMzEK+Htstg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9399
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

On 09/30/2024, Biju Das wrote:
> Hi Liu,

Hi Biju,

> 
>> -----Original Message-----
>> From: Liu Ying <victor.liu@nxp.com>
>> Sent: Monday, September 30, 2024 10:30 AM
>> Subject: Re: [PATCH 5/8] dt-bindings: display: bridge: Add ITE IT6263 LVDS to HDMI converter
>>
>> On 09/30/2024, Biju Das wrote:
>>> Hi Liu,
>>
>> Hi Biju,
>>
>>>
>>>> -----Original Message-----
>>>> From: Liu Ying <victor.liu@nxp.com>
>>>> Sent: Monday, September 30, 2024 10:16 AM
>>>> Subject: Re: [PATCH 5/8] dt-bindings: display: bridge: Add ITE IT6263
>>>> LVDS to HDMI converter
>>>>
>>>> On 09/30/2024, Biju Das wrote:
>>>>> Hi Liu,
>>>>
>>>> Hi Biju,
>>>>
>>>>>
>>>>> thanks for the patch.
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: linux-arm-kernel
>>>>>> <linux-arm-kernel-bounces@lists.infradead.org>
>>>>>> On Behalf Of Liu Ying
>>>>>> Sent: Monday, September 30, 2024 6:29 AM
>>>>>> Subject: [PATCH 5/8] dt-bindings: display: bridge: Add ITE IT6263
>>>>>> LVDS to HDMI converter
>>>>>>
>>>>>> Document ITE IT6263 LVDS to HDMI converter.
>>>>>>
>>>>>> Product link:
>>>>>> https://www.ite.com.tw/en/product/cate1/IT6263
>>>>>>
>>>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>>>> ---
>>>>>>  .../bindings/display/bridge/ite,it6263.yaml   | 310 ++++++++++++++++++
>>>>>>  1 file changed, 310 insertions(+)
>>>>>>  create mode 100644
>>>>>> Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>>>>>
>>>>>> diff --git
>>>>>> a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>>>>> b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..97fb81e5bc4a
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.y
>>>>>> +++ am
>>>>>> +++ l
>>>>>> @@ -0,0 +1,310 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML
>>>>>> +1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: ITE IT6263 LVDS to HDMI converter
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Liu Ying <victor.liu@nxp.com>
>>>>>> +
>>>>>> +description: |
>>>>>> +  The IT6263 is a high-performance single-chip De-SSC(De-Spread
>>>>>> +Spectrum) LVDS
>>>>>> +  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a
>>>>>> +transmitter,
>>>>>> +  the IT6263 supports LVDS input and HDMI 1.4 output by conversion function.
>>>>>> +  The built-in LVDS receiver can support single-link and dual-link
>>>>>> +LVDS inputs,
>>>>>> +  and the built-in HDMI transmitter is fully compliant with HDMI
>>>>>> +1.4a/3D, HDCP
>>>>>> +  1.2 and backward compatible with DVI 1.0 specification.
>>>>>> +
>>>>>> +  The IT6263 also encodes and transmits up to 8 channels of I2S
>>>>>> + digital audio,  with sampling rate up to 192KHz and sample size up to 24 bits.
>>>>>> + In addition,  an S/PDIF input port takes in compressed audio of up to 192KHz frame rate.
>>>>>> +
>>>>>> +  The newly supported High-Bit Rate(HBR) audio by HDMI
>>>>>> + specifications
>>>>>> + v1.3 is  provided by the IT6263 in two interfaces: the four I2S
>>>>>> + input ports or the  S/PDIF input port.  With both interfaces the
>>>>>> + highest possible HBR frame rate  is supported at up to 768KHz.
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: ite,it6263
>>>>>> +
>>>>>> +  reg:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  clocks:
>>>>>> +    maxItems: 1
>>>>>> +    description: audio master clock
>>>>>> +
>>>>>> +  clock-names:
>>>>>> +    const: mclk
>>>>>> +
>>>>>> +  reset-gpios:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  ivdd-supply:
>>>>>> +    description: 1.8V digital logic power
>>>>>> +
>>>>>> +  ovdd-supply:
>>>>>> +    description: 3.3V I/O pin power
>>>>>> +
>>>>>> +  txavcc18-supply:
>>>>>> +    description: 1.8V HDMI analog frontend power
>>>>>> +
>>>>>> +  txavcc33-supply:
>>>>>> +    description: 3.3V HDMI analog frontend power
>>>>>> +
>>>>>> +  pvcc1-supply:
>>>>>> +    description: 1.8V HDMI frontend core PLL power
>>>>>> +
>>>>>> +  pvcc2-supply:
>>>>>> +    description: 1.8V HDMI frontend filter PLL power
>>>>>> +
>>>>>> +  avcc-supply:
>>>>>> +    description: 3.3V LVDS frontend power
>>>>>> +
>>>>>> +  anvdd-supply:
>>>>>> +    description: 1.8V LVDS frontend analog power
>>>>>> +
>>>>>> +  apvdd-supply:
>>>>>> +    description: 1.8V LVDS frontend PLL power
>>>>>> +
>>>>>> +  "#sound-dai-cells":
>>>>>> +    const: 0
>>>>>> +
>>>>>> +  ite,i2s-audio-fifo-sources:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>>>> +    minItems: 1
>>>>>> +    maxItems: 4
>>>>>> +    items:
>>>>>> +      enum: [0, 1, 2, 3]
>>>>>> +    description:
>>>>>> +      Each array element indicates the pin number of an I2S serial data input
>>>>>> +      line which is connected to an audio FIFO, from audio FIFO0 to FIFO3.
>>>>>> +
>>>>>> +  ite,rl-channel-swap-audio-sources:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>>>> +    minItems: 1
>>>>>> +    maxItems: 4
>>>>>> +    uniqueItems: true
>>>>>> +    items:
>>>>>> +      enum: [0, 1, 2, 3]
>>>>>> +    description:
>>>>>> +      Each array element indicates an audio source whose right channel and left
>>>>>> +      channel are swapped by this converter. For I2S, the element is the pin
>>>>>> +      number of an I2S serial data input line. For S/PDIF, the element is always
>>>>>> +      0.
>>>>>> +
>>>>>> +  ports:
>>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>>> +
>>>>>> +    oneOf:
>>>>>> +      - properties:
>>>>>> +          port@0:
>>>>>> +            $ref: /schemas/graph.yaml#/properties/port
>>>>>> +            description: the first LVDS input link
>>>>>> +
>>>>>> +          port@1: false
>>>>>> +
>>>>>> +          port@2:
>>>>>> +            $ref: /schemas/graph.yaml#/properties/port
>>>>>> +            description: video port for the HDMI output
>>>>>> +
>>>>>> +          port@3:
>>>>>> +            $ref: /schemas/graph.yaml#/properties/port
>>>>>> +            description: sound input port
>>>>>> +
>>>>>> +        required:
>>>>>> +          - port@0
>>>>>> +          - port@2
>>>>>> +
>>>>>> +      - properties:
>>>>>> +          port@0:
>>>>>> +            $ref: /schemas/graph.yaml#/$defs/port-base
>>>>>> +            unevaluatedProperties: false
>>>>>> +            description: the first LVDS input link
>>>>>> +
>>>>>> +            properties:
>>>>>> +              dual-lvds-odd-pixels:
>>>>>> +                type: boolean
>>>>>> +                description: the first sink port for odd pixels
>>>>>> +
>>>>>> +              dual-lvds-even-pixels:
>>>>>> +                type: boolean
>>>>>> +                description: the first sink port for even pixels
>>>>>> +
>>>>>> +            oneOf:
>>>>>> +              - required: [dual-lvds-odd-pixels]
>>>>>> +              - required: [dual-lvds-even-pixels]
>>>>>> +
>>>>>> +          port@1:
>>>>>> +            $ref: /schemas/graph.yaml#/$defs/port-base
>>>>>> +            unevaluatedProperties: false
>>>>>> +            description: the second LVDS input link
>>>>>> +
>>>>>> +            properties:
>>>>>> +              dual-lvds-even-pixels:
>>>>>> +                type: boolean
>>>>>> +                description: the second sink port for even pixels
>>>>>> +
>>>>>> +              dual-lvds-odd-pixels:
>>>>>> +                type: boolean
>>>>>> +                description: the second sink port for odd pixels
>>>>>> +
>>>>>> +            oneOf:
>>>>>> +              - required: [dual-lvds-even-pixels]
>>>>>> +              - required: [dual-lvds-odd-pixels]
>>>>>
>>>>>
>>>>>> +
>>>>>> +          port@2:
>>>>>> +            $ref: /schemas/graph.yaml#/properties/port
>>>>>> +            description: video port for the HDMI output
>>>>>> +
>>>>>> +          port@3:
>>>>>> +            $ref: /schemas/graph.yaml#/properties/port
>>>>>> +            description: sound input port
>>>>>
>>>>> What about single lvds as device support it?
>>>>
>>>> The single LVDS link has already been documented in this binding doc.
>>>> Please find the "properties" above where only "port@0" and "port@2"
>>>> are required.
>>>
>>> Maybe "the first LVDS input link"-->"Single LVDS input link" for single LVDS block??
>>
>> Nope.
>>
>> I tested single LVDS link with the second LVDS link.  It didn't work.
>> The single LVDS link only works with the first LVDS link.
> 
> OK. That is the reason you made port@1 false.

Yes.

> 
> Still port@0 is a single LVDS instance or first LVDS input link for the dual
> LVDS configuration??

"port@0" always represents the first LVDS link and "port@1" always
represents the second LVDS link, no matter it's a single-link LVDS
or a dual-link LVDS.

Which one is the first/second LVDS link?  See "LVDS front-end
interface pin" in IT6263 data sheet[1] where first/second are
defined.

[1] http://static6.arrow.com/aropdfconversion/a2ecd2a29274cf0bfb3f3c829ef224c5838fe144/it6263fn.pdf

> 
> Cheers,
> Biju
> 
> 
>>
>>>
>>>>
>>>> imx8mp-evk-lvds0-imx-lvds-hdmi.dtso and
>>>> imx8mp-evk-lvds1-imx-lvds-hdmi.dtso
>>>> added in patch 7 support the NXP adapter card with single LVDS link.
>>>>
>>>>>
>>>>> Cheers,
>>>>> Biju
>>>>>
>>>>>> +
>>>>>> +        required:
>>>>>> +          - port@0
>>>>>> +          - port@1
>>>>>> +          - port@2
>>>>>> +
>>>>>> +        allOf:
>>>>>> +          - if:
>>>>>> +              properties:
>>>>>> +                port@0:
>>>>>> +                  required:
>>>>>> +                    - dual-lvds-odd-pixels
>>>>>> +            then:
>>>>>> +              properties:
>>>>>> +                port@1:
>>>>>> +                  properties:
>>>>>> +                    dual-lvds-odd-pixels: false
>>>>>> +
>>>>>> +          - if:
>>>>>> +              properties:
>>>>>> +                port@0:
>>>>>> +                  required:
>>>>>> +                    - dual-lvds-even-pixels
>>>>>> +            then:
>>>>>> +              properties:
>>>>>> +                port@1:
>>>>>> +                  properties:
>>>>>> +                    dual-lvds-even-pixels: false
>>>>>> +
>>>>>> +required:
>>>>>> +  - compatible
>>>>>> +  - reg
>>>>>> +  - ivdd-supply
>>>>>> +  - ovdd-supply
>>>>>> +  - txavcc18-supply
>>>>>> +  - txavcc33-supply
>>>>>> +  - pvcc1-supply
>>>>>> +  - pvcc2-supply
>>>>>> +  - avcc-supply
>>>>>> +  - anvdd-supply
>>>>>> +  - apvdd-supply
>>>>>> +  - ports
>>>>>> +
>>>>>> +additionalProperties: false
>>>>>> +
>>>>>> +examples:
>>>>>> +  - |
>>>>>> +    /* single-link LVDS input */
>>>>>> +    #include <dt-bindings/gpio/gpio.h>
>>>>>> +
>>>>>> +    i2c {
>>>>>> +        #address-cells = <1>;
>>>>>> +        #size-cells = <0>;
>>>>>> +
>>>>>> +        hdmi@4c {
>>>>>> +            compatible = "ite,it6263";
>>>>>> +            reg = <0x4c>;
>>>>>> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
>>>>>> +            ivdd-supply = <&reg_buck5>;
>>>>>> +            ovdd-supply = <&reg_vext_3v3>;
>>>>>> +            txavcc18-supply = <&reg_buck5>;
>>>>>> +            txavcc33-supply = <&reg_vext_3v3>;
>>>>>> +            pvcc1-supply = <&reg_buck5>;
>>>>>> +            pvcc2-supply = <&reg_buck5>;
>>>>>> +            avcc-supply = <&reg_vext_3v3>;
>>>>>> +            anvdd-supply = <&reg_buck5>;
>>>>>> +            apvdd-supply = <&reg_buck5>;
>>>>>> +
>>>>>> +            ports {
>>>>>> +                #address-cells = <1>;
>>>>>> +                #size-cells = <0>;
>>>>>> +
>>>>>> +                port@0 {
>>>>>> +                    reg = <0>;
>>>>>> +
>>>>>> +                    it6263_lvds_link1: endpoint {
>>>>>> +                        remote-endpoint = <&ldb_lvds_ch0>;
>>>>>> +                    };
>>>>>> +                };
>>>>>> +
>>>>>> +                port@2 {
>>>>>> +                    reg = <2>;
>>>>>> +
>>>>>> +                    it6263_out: endpoint {
>>>>>> +                        remote-endpoint = <&hdmi_in>;
>>>>>> +                    };
>>>>>> +                };
>>>>>> +            };
>>>>>> +        };
>>>>>> +    };
>>>>>> +
>>>>>> +  - |
>>>>>> +    /* dual-link LVDS input */
>>>>>> +    #include <dt-bindings/gpio/gpio.h>
>>>>>> +
>>>>>> +    i2c {
>>>>>> +        #address-cells = <1>;
>>>>>> +        #size-cells = <0>;
>>>>>> +
>>>>>> +        hdmi@4c {
>>>>>> +            compatible = "ite,it6263";
>>>>>> +            reg = <0x4c>;
>>>>>> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
>>>>>> +            ivdd-supply = <&reg_buck5>;
>>>>>> +            ovdd-supply = <&reg_vext_3v3>;
>>>>>> +            txavcc18-supply = <&reg_buck5>;
>>>>>> +            txavcc33-supply = <&reg_vext_3v3>;
>>>>>> +            pvcc1-supply = <&reg_buck5>;
>>>>>> +            pvcc2-supply = <&reg_buck5>;
>>>>>> +            avcc-supply = <&reg_vext_3v3>;
>>>>>> +            anvdd-supply = <&reg_buck5>;
>>>>>> +            apvdd-supply = <&reg_buck5>;
>>>>>> +
>>>>>> +            ports {
>>>>>> +                #address-cells = <1>;
>>>>>> +                #size-cells = <0>;
>>>>>> +
>>>>>> +                port@0 {
>>>>>> +                    reg = <0>;
>>>>>> +                    dual-lvds-odd-pixels;
>>>>>> +
>>>>>> +                    it6263_lvds_link1_dual: endpoint {
>>>>>> +                        remote-endpoint = <&ldb_lvds_ch0>;
>>>>>> +                    };
>>>>>> +                };
>>>>>> +
>>>>>> +                port@1 {
>>>>>> +                    reg = <1>;
>>>>>> +                    dual-lvds-even-pixels;
>>>>>> +
>>>>>> +                    it6263_lvds_link2_dual: endpoint {
>>>>>> +                        remote-endpoint = <&ldb_lvds_ch1>;
>>>>>> +                    };
>>>>>> +                };
>>>>>> +
>>>>>> +                port@2 {
>>>>>> +                    reg = <2>;
>>>>>> +
>>>>>> +                    it6263_out_dual: endpoint {
>>>>>> +                        remote-endpoint = <&hdmi_in>;
>>>>>> +                    };
>>>>>> +                };
>>>>>> +            };
>>>>>> +        };
>>>>>> +    };
>>>>>> --
>>>>>> 2.34.1
>>>>>>
>>>>>
>>>>
>>>> --
>>>> Regards,
>>>> Liu Ying
>>>
>>
>> --
>> Regards,
>> Liu Ying
> 

-- 
Regards,
Liu Ying

