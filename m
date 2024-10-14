Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB91799C382
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCCD10E3D1;
	Mon, 14 Oct 2024 08:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="aMNQEKsf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2079.outbound.protection.outlook.com [40.107.105.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD2010E3D3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 08:36:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vv/kALJR376URfIzibVLLw0Wsg0il7onrwuhj/et5xLshzIMn7QOUTbozWgMpEZzVsd2Jzvye1v8Bs5QeLadsh0Nm3whQkRrvLtgJwn9HLvUp+EPPqqc0nsMcC73Fck++ovTzk5pJ540yYMpfkBGosWuVM5yERVZPQ+41V8xo7T3y5FVY36sOUOppFFgJ5ZukxAWVsZkBok8WvV8fn41/zIP2qpQzLv6Ajdtpqpa1Oqz7e9Ioh3rOC0HSJ56hwuiYWMivry8/b2abYl7bQ9KWlYbmWiu+hCNlRB0e/meY6nGg6eGu0nIOK5+18bzVtuZkpGdYCtwXlb/DreVLcA8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNg9qcC4dgKwKHJfdSXP7POPIvmRyZpCxNOxbVhb+ao=;
 b=lVHrMt9oJUvza3KWw2Lt13D9eVFL+ogI/9NexDYMB970Rno1qoTKity3rWxHGACdbuA0J9iS2rKHpHFDsgzK/sv6qdlyBcxh2Y7HULKUbrpxU0F0yxGrhJEZ5KPYF6EF7Vp/g/ygMqQt0i1KCQp249q4EhUAL2x8c75ZT6Op9Cl+LS6uT3rHBkt0o6y61HLcq9vKZuW7iFrAZFZ/n4g2GU/HtJCKBDFCPprT3s1nhx/oFFA39R1g5L/VgZWP9tF4qFtKfNAO9isbTySmszm6S9Pw95TFdoUO6p36Epgp+XZ6JY49iRD4UNlAvIy3NYDUCgqpdycijRDEgx+N0IRsxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNg9qcC4dgKwKHJfdSXP7POPIvmRyZpCxNOxbVhb+ao=;
 b=aMNQEKsfKtP0oYmzlEwyVNfAAuszUPc4k8VfBnkBEhr/0KzdOrF4bDnNfu6ynnO7kdgqGyh+U++cLL7fiUoOa9unkry5s0L3d57HPKQsaz96V5AOMfKyMESIfrua7gdKI2J2qK5Nu/ez2g/tr1TF1KlFrzRSUDbPHjKCNJD3+QGENAbrfNAUxHScoHmqvtdKJhQORug2GeTQsnWwaog4ZKpNvLv64uw8jYyZWjIFZc2pWbU4UYFOLf9mCT08YDU5WC/4n/ZCO0td/vB2S0MUgHDsuy9LKZ3AB3JSnE7PHBJcWQ9t4fu2gw17mZPVqrUhZN9GUaveOxBeZgYtYM2Axw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10944.eurprd04.prod.outlook.com (2603:10a6:150:210::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Mon, 14 Oct
 2024 08:36:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 08:36:50 +0000
Message-ID: <89584c16-fa99-4361-bbbe-471893f67e75@nxp.com>
Date: Mon, 14 Oct 2024 16:37:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
 "y.moog@phytec.de" <y.moog@phytec.de>, "marex@denx.de" <marex@denx.de>,
 "isaac.scott@ideasonboard.com" <isaac.scott@ideasonboard.com>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-7-victor.liu@nxp.com>
 <dtloyyghjep5rm34qjjinvhvrar5jzj3n24czvpdmnkfesntjq@t2uijuez7myj>
 <f47bc3f1-20d9-4f7e-acdd-85eabdb8d743@nxp.com>
 <TY3PR01MB11346C710A5E7621314C5DADC86442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <TY3PR01MB11346C710A5E7621314C5DADC86442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10944:EE_
X-MS-Office365-Filtering-Correlation-Id: d18d3bea-8cfb-4661-641d-08dcec2b591c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWs5dEd5SlVaYTJvSjk4TWxxOWJJZmdFV2RKMTVSKy92Q0VoUE9MQ3hKQUxN?=
 =?utf-8?B?MWdGeUhsbnFNa0VDM2VYZmUyWWxHL3RyYWVSZnFwa1BKSS84K0NUYXI0Tlo0?=
 =?utf-8?B?bVIzcTlZNGpnYXFFQzVIeUh6OUdWOGxVaS9vWC9QQ0QyekVVaW8vSGFiZldq?=
 =?utf-8?B?aWZ1SEF2RlBIbSsyZUFFSzJpOHo2Y1A2YlhMMi9lSEM1WGxFZ1NZWUVUY09z?=
 =?utf-8?B?c3lhQTVHTEkwWW9KemlyQjd4dzE0b2lCZHovcEFGRTg1ZjcyUFBzMFlDb1Rx?=
 =?utf-8?B?UXJabmNJWVpJUGpBZkhIRlJRakduQnV1Mk1tRW5WdElRMnBZQUlsQUxDdXp2?=
 =?utf-8?B?RWJHNTBCSFBMMC9OdGlLK25iZGQ0bjFvKytnYXpabVoxb3dHRlNFbHBKMzY3?=
 =?utf-8?B?eTBmUFQ0NFlhYTM1MVpFZmliNytrNU5LNElNSnBwTVpmbTdrTTVPTktEc1BO?=
 =?utf-8?B?QmJ5RW1JblplU0Z4akZjbkpqY1Q4dXhtVktIeVhlemRRMklnaXptNUdZQTZN?=
 =?utf-8?B?Zzl5UHcwdktiTTh2OW1tNlhlLzMwOGxsd2dKMXFLMHVSN21xbG9IRENZNzJX?=
 =?utf-8?B?TmVNZzBnNkNhbis5VDR2RDRXU2Q5alNzTDVDMWhrYWJ0T1phQy9iaXFSdDU3?=
 =?utf-8?B?MnZOOUFIdk80dlA1R2Z3c1RDN3NDOEc4UkE4bk1BRS8vRGE0b2RqWnRHLzhT?=
 =?utf-8?B?dlhPV1pqb0tURWpyUUJ5Nlp3aUZvSXlTbVVDdkF6enQzWnkrQWFGOVlMTC9z?=
 =?utf-8?B?VWk4VVE0U3IyK29sTGNxdFh4L1RyblNodk53dUJ5cURHcWZUS2c5bnE2SjUx?=
 =?utf-8?B?UERRSms4emhxSFR1NmR6bmJ2Q0FPREhQWnlERGdZVUMzbFBBRnFsbDBhNGlq?=
 =?utf-8?B?MExuMXhGMWFNTDl2UHhjamN3eUtLRUcyZVg1amRZc0RhMk04OXpxVTVCVHhj?=
 =?utf-8?B?VzBpWlREMmZuRnlKck1Tb1dCN1hXRVBLMDdsLzBCQm1obW4xNFVPN3RzRnUv?=
 =?utf-8?B?VUYwMnM5WUJDSVVnRXdmY2F3czlwUktTaG5ES25GbnF6Tlo0UDZva3dTaGw2?=
 =?utf-8?B?UW1rSHRJdkRBR1ExUHJBZWREU2JDRzFrUHRZeHVneWRtL21pV2d5R2U3NGhz?=
 =?utf-8?B?OCs4R05ZbnhpUmNGWlZCemE5c0lWN0hQWDlrQlh2WEh3a0pPZGdONFN6bm5h?=
 =?utf-8?B?dkVlNzZOOU9vV2ZJWnFObXZFQ2hESzBIanRxemZ4Z3ROZ3RrOWNMTjhSUXUw?=
 =?utf-8?B?Zm56ejJhbVdaVmtnUnNDcVpVTjZsNi9JZ1pMU0x2NjYrMlpYTUlSeDhsOTN5?=
 =?utf-8?B?blhnYk5LQkFTVTFyeUljL0lYcnhHRmZ2ek5SakNIRlY1V21nMUFuRldVdk1I?=
 =?utf-8?B?Ukp2eC9XTDVUZVdXOGRkczV1U044azVETDgrQVRzbWh1WGhGd1lTbmRhV0d4?=
 =?utf-8?B?eGpnaVFNOVhiY0N3QlJORzZQSHJLZ2J2SGVvQ1hCYlVMVzBhYzArOGFIZ2VL?=
 =?utf-8?B?NzZDb0ExcFFEbG5EdjR5Z0hQMW9rZlNjOXdlT3A0RWVTWmZlOEhyanAzTUZY?=
 =?utf-8?B?SGNFdmhUNCtOUUk5aFNaMFgzZk1tNzRWYVBNTytxanlyMElMR1BEQmlBZXR6?=
 =?utf-8?B?OVhIL3A3dUpKQmgrZm96SHBudkNhbWZiMHZsZ0cwRmtNN1ptMjVTamhRWTJL?=
 =?utf-8?B?WGMzb0Z2cGRqYnpQcTVTeW9pd2tMMzRnTDNkZHlPcFUyOUtmZWhqUWxRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFBuMXFzdWo3UmkzNHRsUEJKb1V2MWtXUXliVXN6OUM4UlhpdjZpU1I4U3VI?=
 =?utf-8?B?b1FCbmVtLzBEa05vbXlyVHBUWVhrZUNQVVJ2TzBKSFJmSlErYzMzY1ZtNzk4?=
 =?utf-8?B?UXZ1a0cxS0pMNVoveDFKTHI3QkJubzVIVjFiYXVCRVBZaHVDVUY5K2ltdXp0?=
 =?utf-8?B?WjVQZW9OdGs5WlZnS0FPOENNZUNGTkU2N2dId1RpRVdPNlVlbXdOdit5eGk1?=
 =?utf-8?B?SWxLalN1TjgwWW84VytkMVp6c1htOEpCSU1Jb1lJZFR2d0F1TmtDQlpDR0Nr?=
 =?utf-8?B?Ty9LRHFMU2ZVTS9OZ3czUEdtNFFFeWs0YlpMTVhYWlVEZld2Z0R6VWJnNjVj?=
 =?utf-8?B?UlpuN2QvSVpESEN4NkNnR3FoaXUxQk96UkNudWUrTGsyM2UwcmVrdEZudVkz?=
 =?utf-8?B?QytxRWhjeHh3d0FkWWxjZWRhVXFHb1NqVmdFd0dsU2ZLRUxWbVN6QWdLdURh?=
 =?utf-8?B?V0JPalhmdDJzbTk0ak50bkRFMGljeTVqbC9QOHMwN2U1MitaTlduSTQ3QlZK?=
 =?utf-8?B?aS9yK0RaM3QxU2dZS1dVT0Q4SEVjS0k3ZkdyZVBJY1hvdnpzWWxmeERoSjUw?=
 =?utf-8?B?WC85RDZDS2tqNVdpZEcyZjhJK0J6TEhoaHJNM0dmZkh5VUFrbHNUZ05kMHRU?=
 =?utf-8?B?RXFNc3BGaVE0aXNmcnJGWDlqY1Z3L3FEV2dOZ1ExcWtVUFI2Y2tDcDR1RGFL?=
 =?utf-8?B?VjRMMm5WYnBoT0M3WDF6S0Y4MmZ4dmdDbWpIWTFxWUZQWDY3bmN0Zzkzd3Zy?=
 =?utf-8?B?TmJxcnp5cnNSMHlpeGNaaWoyRnFZYU4rNExNT01VK2krS3YxbEhCaXZQV1Br?=
 =?utf-8?B?Mlo0M2JXVkgzWUlINWhJM1psMFhrdHluc3N6SjV3K1F1L05sWWlpQVcydHNt?=
 =?utf-8?B?WlQ5UDRxcmh4MXQzR0gvTUxtNXhGT1pKZFJrdGZ1aERyTEtTWUcxYSs0WjUw?=
 =?utf-8?B?anZvOERVckF2K3A1V1c4QWYvMTVLaXFsOVMraUFjL3c2TkhOMXJiV2xHZXNs?=
 =?utf-8?B?bjBDc2FHQ1YxRGRWWUw1bGZjL25kaHNIQ29GT1dkUHJwTmVQWUZjLzBGQ25i?=
 =?utf-8?B?Y21kRnE1Y1hDREJLdm9kMGcyU3Y1UWlIbDV5Rkt5L01CYWJnNlZ0ZWxjdGZl?=
 =?utf-8?B?bUVBbGhRS0RnUjNDcGo4VGg3WmFGeC8wSE5qRkFkWHlNVzJvdHIzMWxDc2Jq?=
 =?utf-8?B?MHZ0c0UvaWxueGw3NWluL0dDSVNmcDN3bjAvTlFmMnJKbkoxbSsyUWU1dSsy?=
 =?utf-8?B?bGhYcXRFRzM2NDc2ZjhoK05hMDZNNlNkNmI5dHk4U01BbVhxTjhoUWtCUy8w?=
 =?utf-8?B?cUF2YVg2SVBnOGFLTDl2emRKZ2RIeENtYXM3NURidWFwak93MjlBYUh0UWxF?=
 =?utf-8?B?QlluYVBNR0FXYjgyTXAwWEFGdGp6Y1E4ZDhpUXNGUHBIZFdUYno2VnUvbVlt?=
 =?utf-8?B?cHQ5V09SUGx0RlBZVjRJbVI4Rk9pWWZmN09aa3J3OEM2d1IxZUp0R0pUVjJ0?=
 =?utf-8?B?R3gzYlEvMFB6NjJmWnlRU0d5OTFkZ25oekJZaEwrbmVOR1U0dU9mS1BlblFL?=
 =?utf-8?B?QU9xNjcydG1oS0F5QkZsdnoxcDkyNnJ4NXVkZEtPSnYrZC9GaSt4TGg3SnFL?=
 =?utf-8?B?Rk9DcGZQb1dzQ2h5WTZnd2RneGIvdnMrM0N2czM1aDZkZ2UrdHdON241YXIy?=
 =?utf-8?B?YlFHODJQcUJCU2ZhYjQ5SnRxZnNOTm1zRGVzZ1k1WUtLVVFJMnhYUzZQUXQ4?=
 =?utf-8?B?aHNDRFVrTlJVeVVDNUx4QlNvQzVQQm0xLzZsZmlGR1hzVVZuNHRiSFRraFlw?=
 =?utf-8?B?NkVDVVhwWjJDSHNYZDVOVXd2dEFGY1grUEltdDUvdHBQdTZEcFdvNHYycUtF?=
 =?utf-8?B?ZWI2dFRMMEQzZmdLdWo2ZFdTOEJmNGFwcDJUWmZocEpubHl3VHMrd2gvb3pN?=
 =?utf-8?B?ZHFGMno4QTE5NDk0WWJ3S2p0ekRUd3hMU01maUQ3TmNwNnJncVVoL0JHN2NZ?=
 =?utf-8?B?a05DS01jYjZTUG9VUk9iNWd6blhaRjhJODB6akVMb1IyZHA3TTgwclNqWmQ5?=
 =?utf-8?B?bGViL2ttcDQyNE9TQ3BLbFJLQXVQVnpKSGVCYnNNd3VlaGFlakU1SWVoRkFl?=
 =?utf-8?Q?D8C7rkI2uvNIXlqx8zfeSEU86?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d18d3bea-8cfb-4661-641d-08dcec2b591c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 08:36:50.5411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7jaJOKZziN57oyyBekXEuHfh1hKk4DqD8nhZmJTva0+CjUGW6NbbnBzK6rcTovJGsJmnmVVQAGug0eTvuocxUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10944
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

On 10/14/2024, Biju Das wrote:
> Hi Liu Ying,

Hi Biju,

> 
>> -----Original Message-----
>> From: Liu Ying <victor.liu@nxp.com>
>> Sent: Monday, October 14, 2024 8:18 AM
>> Subject: Re: [PATCH v2 6/9] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
>>
>> On 10/14/2024, Dmitry Baryshkov wrote:
>>> On Sat, Oct 12, 2024 at 03:35:40PM +0800, Liu Ying wrote:
>>>> Add basic HDMI video output support. Currently, only RGB888 output
>>>> pixel format is supported.  At the LVDS input side, the driver
>>>> supports single LVDS link and dual LVDS links with "jeida-24" LVDS
>>>> mapping.
>>>>
>>>> Product link:
>>>> https://www.ite.com.tw/en/product/cate1/IT6263
>>>>
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>> ---
>>>> v2:
>>>> * Add AVI inforframe support.  (Maxime)
>>>> * Add DRM_MODE_CONNECTOR_HDMIA.  (Biju)
>>>> * Rename it6263_reset() to it6263_hw_reset().  (Biju)
>>>> * Check number of LVDS link data lanes.  (Biju)
>>>>
>>>>  drivers/gpu/drm/bridge/Kconfig      |   8 +
>>>>  drivers/gpu/drm/bridge/Makefile     |   1 +
>>>>  drivers/gpu/drm/bridge/ite-it6263.c | 919
>>>> ++++++++++++++++++++++++++++
>>>>  3 files changed, 928 insertions(+)
>>>>  create mode 100644 drivers/gpu/drm/bridge/ite-it6263.c
>>>>
>>>
>>> [...]
>>>
>>>> +static int it6263_parse_dt(struct it6263 *it) {
>>>> +	struct device *dev = it->dev;
>>>> +	struct device_node *port0, *port1;
>>>> +	int ret;
>>>> +
>>>> +	ret = of_property_read_u8(dev->of_node, "ite,lvds-link-num-data-lanes",
>>>> +				  &it->lvds_link_num_dlanes);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "failed to get LVDS link number of data lanes: %d\n",
>>>> +			ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	it->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
>>>> +	if (IS_ERR(it->next_bridge))
>>>> +		return dev_err_probe(dev, PTR_ERR(it->next_bridge),
>>>> +				     "failed to get next bridge\n");
>>>> +
>>>> +	port0 = of_graph_get_port_by_id(dev->of_node, 0);
>>>> +	port1 = of_graph_get_port_by_id(dev->of_node, 1);
>>>> +	if (port0 && port1) {
>>>> +		if (of_property_read_bool(port0, "dual-lvds-even-pixels") &&
>>>> +		    of_property_read_bool(port1, "dual-lvds-odd-pixels")) {
>>>> +			it->lvds_dual_link = true;
>>>> +			it->lvds_link12_swap = true;
>>>> +		} else if (of_property_read_bool(port0, "dual-lvds-odd-pixels") &&
>>>> +			   of_property_read_bool(port1, "dual-lvds-even-pixels")) {
>>>> +			it->lvds_dual_link = true;
>>>> +		}
>>>> +
>>>> +		if (!it->lvds_dual_link) {
>>>> +			dev_err(dev,
>>>> +				"failed to get LVDS dual link pixel order\n");
>>>> +			ret = -EINVAL;
>>>> +		}
>>>
>>> Please use drm_of_lvds_get_dual_link_pixel_order(), it validates that
>>> the DT definition is sound: one port for odd pixels, one port for even
>>> pixels.
>>
>> It cannot be used, because it get the pixel order for the LVDS source not sink. IT6263 is the LVDS
>> sink.
>>
>>  * drm_of_lvds_get_dual_link_pixel_order - Get LVDS dual-link pixel order
>>  * @port1: First DT port node of the Dual-link LVDS source
>>  * @port2: Second DT port node of the Dual-link LVDS source
> 
> 
> Can't you use drm_of_lvds_get_dual_link_pixel_order() from host for the same use case. See [1]?

Yes, just need to get the remote LVDS source ports first.
I just proposed a snippet in a separate reply to use this function.
Let's see if Dmitry likes it or not.

> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c?h=next-20241011
> 
> lvds_bridge0: lvds-to-hdmi-bridge@4c {
> 		compatible = "ite,it6263";
> 		reg = <0x4c>;
> 		ports {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 
> 			port@0 {
> 				reg = <0>;
> 				dual-lvds-odd-pixels;
> 				lvds0_in0: endpoint@0 {
> 					remote-endpoint = <&lvds0_out>;
> 				};
> 			};
> 
> 			port@1 {
> 				reg = <1>;
> 				dual-lvds-even-pixels;
> 				lvds0_in1: endpoint@1 {
> 					remote-endpoint = <&lvds1_out>;
> 				};
> 			};
> 
> 			port@2 {
> 				reg = <2>;
> 				it6263_out: endpoint@2 {
> 					remote-endpoint = <&lvds_to_hdmi_con_out>;
> 				};
> 			};
> 		};
> 	};
> };
> 
> Cheers,
> Biju
> 
> 
>>
>>>
>>>> +	} else if (port1) {
>>>> +		ret = -EINVAL;
>>>> +		dev_err(dev, "single input LVDS port1 is not supported\n");
>>>> +	} else if (!port0) {
>>>> +		ret = -EINVAL;
>>>> +		dev_err(dev, "no input LVDS port\n");
>>>> +	}
>>>> +
>>>> +	of_node_put(port0);
>>>> +	of_node_put(port1);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>
>>
>> --
>> Regards,
>> Liu Ying
> 

-- 
Regards,
Liu Ying

