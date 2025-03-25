Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEF5A709E5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 20:05:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B525910E5C3;
	Tue, 25 Mar 2025 19:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="tbeB6U1c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489C210E5C3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 19:05:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ptTa+gOC497klUDjkmE03nOvbHzzVaGynXQ9klr3AdNOgAuMRQbOS8F4lpjlghkouQXhOPKOU7Tth33swqufNXX1ahBqFPDm6FdOLjiTGuaCgP/drxaCrorEm9GDMGPfal0Ee+uW6bV3EWg5sr4nH1a166tUGIXaWctMcplh4/eIXZ/yL7dbk8HJx5DD2G85q2pLtrCgM/4XgB6lFznq1gDMNweYp2PCzrhcMGoYd5j2mOzl16Kp5oOLN334RI81O9lj2WkvXdeSSF8cu9tL7a96Gn/wmnJvn8gEo+olqhh1TZ0PW8mRIrhFen+kqYL4AQ04T2CXHzRZC9EFsHDs3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4v8nceHe8x4BPwldoVdz/Nb8l7u2wHC+Xxb1tFvBaE=;
 b=fzPgsp/zXy9PMscuzyE24x7VYWwGgGTy23kF7Fn9OfJz9I3er7lQ1iPGZhX0w62ZzndTeod2SElUAGvHJxHMouU2CK4+sWGXATH4D5kW0LlSHxsCREDugHgDaQmL0IDWpuEotCGupbFSUOIg65yzzr3YRAnXeZINIXDU4GLxkGPSZZolNXoAv3J7zo00KJUJNHiL2sMA+GzpoMh0MjCSik/5zv+8RKeQj1m3liv33Br6Vd7M3/jgVyFv3dq2WH/4bNzSyKNAYkgF3WqSN/kr5sd+o3ZvWcEHqrc1XQ20FddcSquQ9c5lhoZjlPQ8sX0Ew5jrn61QzgKS1cPveMS40A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4v8nceHe8x4BPwldoVdz/Nb8l7u2wHC+Xxb1tFvBaE=;
 b=tbeB6U1cDRGKJ0rbPmDGsZmJ01zKaCF+0dwTJ4Neev8E0BQf+wP0eQQdEIB9D6B69YYGSxK8J8USoJRQNPKYpC02HhvC4AIVvXcqU8L5CeLmKpHPGVIy9QepbrHmtIobLNMoO8fL67cVGtN/cIMOKFTiqk9jcn6K8nqPDt1pP7MrXa55dGJHiZWAa5QgHdga+2Wd5Dia2CSr3nzBlnt9u0ERNyC+4JhUGPEDn8E/+qwS4R6MrAzqUcBvfMJw5i51XKGSWNizWxHPcIbSoK3pQvUEkJmU2OHdZSMZeTMfnFg9SlGD9pYSPjGqJwfyDWkb/SWoDgmU1V9GOC7XQzVi9g==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by GV1PR10MB9110.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 19:05:21 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 19:05:21 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "jyri.sarha@iki.fi" <jyri.sarha@iki.fi>, "aradhya.bhatia@linux.dev"
 <aradhya.bhatia@linux.dev>, "tomi.valkeinen@ideasonboard.com"
 <tomi.valkeinen@ideasonboard.com>
CC: "francesco@dolcini.it" <francesco@dolcini.it>, "praneeth@ti.com"
 <praneeth@ti.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "j-choudhary@ti.com" <j-choudhary@ti.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "devarsht@ti.com"
 <devarsht@ti.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>, 
 "nm@ti.com" <nm@ti.com>, "u-kumar1@ti.com" <u-kumar1@ti.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>
Subject: Re: [PATCH v6 4/4] drm/tidss: Add OLDI bridge support
Thread-Topic: [PATCH v6 4/4] drm/tidss: Add OLDI bridge support
Thread-Index: AQHbmeWhYh9XxSnSYUSs/IRG/AltNbOEPekA
Date: Tue, 25 Mar 2025 19:05:21 +0000
Message-ID: <2b5bd03f2c8000b0bbf10c649efc5c080fde1a91.camel@siemens.com>
References: <20250226181300.756610-1-aradhya.bhatia@linux.dev>
 <20250226181300.756610-5-aradhya.bhatia@linux.dev>
In-Reply-To: <20250226181300.756610-5-aradhya.bhatia@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.4 (3.52.4-2.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|GV1PR10MB9110:EE_
x-ms-office365-filtering-correlation-id: e794cea0-f534-420f-e9ac-08dd6bcffdde
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TVhkcGFkVXNEMnU5QlE0VzIwUkg1OHUzMnBuM2gvRHFORHp6QkIvak1uYXNZ?=
 =?utf-8?B?YWxzUTdvNmhRU1pVWkJMYWdQQ21RWlNBNlNET2NHem8za211UGlMRVZyMHF2?=
 =?utf-8?B?dkN1a3NydCtPMzVaZGpXdGhZbXlVenZXQWxnT2ZYZmN1WnNKRHVZM0prQVVU?=
 =?utf-8?B?OFlwUVpYb2hBd0dJZWJjK0MrY2RnY0hqUjRSSnI3WnBuNFR3cnJjMzZxcm9K?=
 =?utf-8?B?NjNQcTVWeDYvYytIaE9LNHJwaGRIdXBWZHNTdHFFOFVCVGVCd25VQ3lrdHAz?=
 =?utf-8?B?bDBmOFd4NTFRQWtFYmY0V2xGSFdtd2pjU2dQSUNOZFp2eFFBa3AvSVhXRldB?=
 =?utf-8?B?Tmc5UCtRTDJibVJVcjdQb1N3NytNU3Z6Y3RkU3IyUS9mNUk2YW0wTG0wSFdG?=
 =?utf-8?B?U1VsdDE1emp2d2ZDOXBwajVWdVV1dGxJOEN4R1BnYk85QmZwdlBVQkIrNWt3?=
 =?utf-8?B?ZEczWlhmdkFGZFBRbld1ZVdUYy9DVVFLVTVPcHRrcm05NGFFV0lpRW1Tc2FT?=
 =?utf-8?B?VGJGMk41Y1JGQzIvVVR5cVF2S2RTMUFSMDE4NDcxVDI4MUh2KytHVTVwdHVE?=
 =?utf-8?B?ZEJLMXJKU1p1cXZYVE1OazZFMUtMMEdwSE5JZXBFak53eUxzVzZQUCsrTSts?=
 =?utf-8?B?ODVlUU1CTkFEbjRsRGxoUEk3MUJDSEhrNFdsZk9RNHRFSTh4TCtLT2NRZ0RL?=
 =?utf-8?B?R1dGU0xRb2xQTFFUTUFyN3JUUlNGTy9semxLTXlTbVNOMDBvSGJVNmpheFB3?=
 =?utf-8?B?OFlYSHAwZ0liUTJ1R0c0aE9YZXhsOHczdHZLYTU2alNOcEU0UEhyTzJRSzQz?=
 =?utf-8?B?TGRHZDFxNTFwWUViZ1ozYXVyS2JtMGIvTmhUMEM0bS9MZjFlb1FtdlZwMjJa?=
 =?utf-8?B?ZTMwQlByRFk1S2N0cTJicmVNd3hJREZNdWxLUEZ6VkRMdlBGcXYxeDUxeTJH?=
 =?utf-8?B?ZXJZQ3I5VU1tQjFmT0pFSC9LKzNTQWZhM0c2ZldvbkpGMHJ4ZlFraHFEUFI0?=
 =?utf-8?B?bEhQa04rR0tzeGc4dVl5ZXVLeWh0dzFuNUQwOVdxK1hJcHF4MkVVdXd1eXYw?=
 =?utf-8?B?SlhaZC9HcndsUTZzWUluOEJ4RVVvSzErVWJOSk5LS2FjU1dLa0sxN1JobDJp?=
 =?utf-8?B?VndWVGVGTE1Pd2tEc0dORlFKQ2V0TFdPN2MvZXlhY3hVNmFXZ1JqMHZ2NGtt?=
 =?utf-8?B?aTFTdEl1LzY0bUExbzFlYzBYZTFzbFZvQTZxOUVqeDljVWhiRThLWVVWbFJp?=
 =?utf-8?B?WUdwRC9UUWwxZWZoa253WXZKQXoxTjgzU1lTbFB3TWs5Q0VxalNPWFRZb0RY?=
 =?utf-8?B?OWhaMWVqZVNlQkJXWi9oTmdyZFhpMytUMTB5czVJYVcvZWF2SitjeXVoNWxO?=
 =?utf-8?B?bUJwQ1JqMlVPL0doSWhvMHZDOEN1c1dkbldOSnZQcU9MSTI2cW5paEhDMWhY?=
 =?utf-8?B?ZWVlTXk3SVB0cEQ1Y1hnNy9CeFRCRDNwQjVNN1pxaCtOMkxFNm12ZlJyWXph?=
 =?utf-8?B?SGlRcjZ4NDMxdFJDOGp1blFDSVErMFBnNjI3aXFOV0N2ME0vQ3B0L0RnNFZu?=
 =?utf-8?B?UjhmY0xaR0w4R05CWS9FdmthcDU2bUVMajZ0NkZCTVVLUVhZbWJnbXk2cjdY?=
 =?utf-8?B?VGoveGc3UDF4UGFIeVBlVTJVQ2xQb2lVMlZpQmVCK3NNMk5GMlpqS0dFTFhu?=
 =?utf-8?B?MHBydis1SzV1SEFlbzFKSmI5a0NWSm5MeC9pcjJxQzA3ZUVFdzJ3SWVCbU9s?=
 =?utf-8?B?TXdtM0Z3L1JYc0hZQitCbVZRMDV4aEc0MmN0cGRWUURBbk1od2RLTU51emVM?=
 =?utf-8?B?MWh2ZGpENGNacTJvbmVUckNKeXZFdFhUNytuOVdZSTFpV3REOXh6UjVmWjFZ?=
 =?utf-8?B?L1RSTTRFSGJUa3o0eG0yTGtKdE82NWtFRnNCcG8zN1R3eUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enp6bFBYSk5BcEV1MU9FTk90VUlrWWc0bldZb0ZXMERETHRSVVJJMzdTZzJL?=
 =?utf-8?B?b0JKQTZIWjB2TFMvcDhJbUtmREtTZnVsZ2g3WlVqVVU0azJPenJqR3l4QUJF?=
 =?utf-8?B?RFdEYWQzb3hkTkVOTGQ0MndrdDQvQVorc0ZkQkFNQWg2OVZUdnh5clBzcEdO?=
 =?utf-8?B?b1l3UkZGbXV3OTRIb2FaeVB5RXFrV3FERzdvS3JjRSt3SHF3VElDdTJjUXRn?=
 =?utf-8?B?L2E0SS9PTlNOYXpyRW1ROXl3aW94Um5yQmR5ZTFHZzI2UURSbTdxSVhaQUp2?=
 =?utf-8?B?SVZ0aVRwVDUvZU8yRjNMcURLVCt0ZDR2eHFtdmpLWnNiVXlzNldCeitqK2ZP?=
 =?utf-8?B?NHhJcUREUHhZVU1zODhpblZLYUY2a3F0eUw1eG5yN1ZuWVVTR0dDVWpyaElm?=
 =?utf-8?B?d240UjRvSm5EdGdiMGpReEIzVHhZdTRFaENKZERZRmE3Z3NiaHlHRTh6UnVC?=
 =?utf-8?B?UGlQN0U3aFFPMkZKZ29pNC9pWXYyYVMxWE5IRU1xc3RDbUdnd1JxWWp4RElv?=
 =?utf-8?B?aDduU0ZBVTBHNCtWLzh0QTFvRHN2WWFRcVZ6MytlK3EzeThQQkxpcE1xa1Jj?=
 =?utf-8?B?ZXNJV1JCcHhxbWhoR3pldVBiZlk3bjNkM3FpMlhGTmdBL0Myb3g4WWRMYm01?=
 =?utf-8?B?S2JIb09kNW9qWGRrL1BpSm9iSi9rb3Y4Y2ExM1E0MkVSa29qYjR4VmpSKyt0?=
 =?utf-8?B?eUswZCttS3c5eDFuc2RBUW0yUER4UVZrdHU4dFhrbUk0enByempDalRoZGpE?=
 =?utf-8?B?MW1NS01Ca0hpTHN0OXQzL3VNSktLeWxBdnRGVHBvZjAwTkV3Nkt5UUREQkxO?=
 =?utf-8?B?diszVFZnd3RZN01ENWxDZkFOK1VYN1lOZUJqYVBxdHZPeTlqK2d1NVNlTDhO?=
 =?utf-8?B?b3VCUFp0UlVOaXNNNEFDcGh3Y3RoODJOZy8rWmJTaG92QUFiUXR5T0xlTFB0?=
 =?utf-8?B?TSsxNi8rSE5OU2dQYUdndUxXYUc5OTlIVEl2R2tQS29USDlYVlB6aDhOc3Jy?=
 =?utf-8?B?czVXTGdpc3RBSmxtMXRlVGduSGtpam5HOWlBcW9YN2t3RTZRS0FUQjl1cUVi?=
 =?utf-8?B?QzVMaG1YT2VwWHV1T0dLRG10OU1JUTdCWE9ISFNyQVg2VUg1NnpkcDY4TUNH?=
 =?utf-8?B?MUsxZXNBRklTZ204Z1R5VVhXcnhLQWY3bVJHdjNraE93K0hDOEdHdDlxTkdk?=
 =?utf-8?B?eUhXM3ZBckNxVGE3S0huWDFnOGMrSjZJMUdXWStMUmF6NE9PeUZvemJkdmhB?=
 =?utf-8?B?QkNvVS9ZSUZ2NCttV0V1bmFuTTRWQmU3bDlKS3NTUFJOd2dxTnVnZ292ckhK?=
 =?utf-8?B?RzUzQ0xnU1pEL04zRUwxRXN1TUZWbFJjdXo4ejJrMVlxQXcxZFAwWUMyeEFU?=
 =?utf-8?B?N1RZTnE5bnRmZ2dqQVAzQ1dPL1RzY3U1Q095eWtER3ltY0hrUkxCZ1FWMUk1?=
 =?utf-8?B?UjMxc1hSZ3FlUi9NTk8rb1Nnc3ZFUVpHSFNyaDdIZlV2bVhlbmdvb3oyMVlw?=
 =?utf-8?B?ZFBEdTd6ZWNiWHBtaVNwVy8zT0U0VTRZVU40TEJ2cTA4eFBmK1RtN2pmWVFU?=
 =?utf-8?B?K1lyVWhFT3JZQkxyWEs4ZmNhMXc1RTlycUF2S21RbHB4UndYd0R5S3U2RnRE?=
 =?utf-8?B?R1pscWcvRGIzblFqaGEwbjFzRWlVZGR2SGQwT1h6dnhEY2Y5UmNxMXR0NjFV?=
 =?utf-8?B?TzJyUzhKVk1SOXoveDYwbHR4M1hod1VNazU3am04bnZScU5FNEd5RjFjdFc0?=
 =?utf-8?B?akJDUkhvSE1HM2JzVGtlZWh3dFhIcmdiOUtFMElCbWgxNnNPTGxyTjJyN1A3?=
 =?utf-8?B?SmhldDBKOUtxMmM1eVRJNVUrR2gzUzdPV3RHZmZxZ3cyamlBY2J5WDh0azVL?=
 =?utf-8?B?bnhDa3Zad0dMdlRBQldVL3RFNU40dEZMTkVMU0pHSjlNLytFdWdsaWo1VVpL?=
 =?utf-8?B?ZDV2SElPK2JudVNQbzVtU0xCUUtXTW5jOWdxTVJ4N3E0ZzZZMTN4TFFRNEQy?=
 =?utf-8?B?cGM5MUxwSW5saHhPblh1dXdNSWVkVndmVWUrT3k1eWlrMmpKVmJvWnpuT0h3?=
 =?utf-8?B?QlhlRktQaTVrcThFbnprKzNpZk9zKzljd2s3cU5wL3ZMeGppQmhMNXRVQVd3?=
 =?utf-8?B?MlQ0Y3dvczZpYlh3Y3p5Mm16MzZqaTVZcE02bkVkVWw2cFN3bVhLWWJ4ckVq?=
 =?utf-8?Q?Dp50cY/uFu5X5+Gu1qBdHDs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31A3432BCB9DFE40B14BF2255CD5CA99@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e794cea0-f534-420f-e9ac-08dd6bcffdde
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 19:05:21.7537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aE6lXmbgYBkq+cMgEnqvb0KjzR2DcvImxEzru5BTVcldEiuVyHwbYdKjL/PlFGV04dwDrcUNaJxjjrHCGbWzCFcMuyBzQgnuG4sOlhyud5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB9110
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

VGhhbmsgeW91IGZvciB5b3VyIHdvcmsgQXJhZGh5YSENCg0KT24gV2VkLCAyMDI1LTAyLTI2IGF0
IDIzOjQzICswNTMwLCBBcmFkaHlhIEJoYXRpYSB3cm90ZToNCj4gRnJvbTogQXJhZGh5YSBCaGF0
aWEgPGEtYmhhdGlhMUB0aS5jb20+DQo+IA0KPiBUaGUgQU02MnggYW5kIEFNNjJQeCBTb0NzIGZl
YXR1cmUgMiBPTERJIFRYZXMgZWFjaCwgd2hpY2ggbWFrZXMgaXQNCj4gcG9zc2libGUgdG8gY29u
bmVjdCB0aGVtIGluIGR1YWwtbGluayBvciBjbG9uZWQgc2luZ2xlLWxpbmsgT0xESSBkaXNwbGF5
DQo+IG1vZGVzLiBUaGUgY3VycmVudCBPTERJIHN1cHBvcnQgaW4gdGlkc3NfZGlzcGMuYyBjYW4g
b25seSBzdXBwb3J0IGZvcg0KPiBhIHNpbmdsZSBPTERJIFRYLCBjb25uZWN0ZWQgdG8gYSBWUCBh
bmQgZG9lc24ndCByZWFsbHkgc3VwcG9ydA0KPiBjb25maWd1cmF0aW9uIG9mIE9MRElzIGluIHRo
ZSBvdGhlciBtb2Rlcy4gVGhlIGN1cnJlbnQgT0xESSBzdXBwb3J0IGluDQo+IHRpZHNzX2Rpc3Bj
LmMgYWxzbyB3b3JrcyBvbiB0aGUgcHJpbmNpcGxlIHRoYXQgdGhlIE9MREkgb3V0cHV0IGNhbiBv
bmx5DQo+IGJlIHNlcnZlZCBieSBvbmUsIGFuZCBvbmx5IG9uZSwgRFNTIHZpZGVvLXBvcnQuIFRo
aXMgaXNuJ3QgdGhlIGNhc2UgaW4NCj4gdGhlIEFNNjJQeCBTb0MsIHdoZXJlIHRoZXJlIGFyZSAy
IERTUyBjb250cm9sbGVycyBwcmVzZW50IHRoYXQgc2hhcmUgdGhlDQo+IE9MREkgVFhlcy4NCj4g
DQo+IEhhdmluZyB0aGVpciBvd24gZGV2aWNldHJlZSBhbmQgdGhlaXIgb3duIGJyaWRnZSBlbnRp
dHkgd2lsbCBoZWxwDQo+IHN1cHBvcnQgdGhlIHZhcmlvdXMgZGlzcGxheSBtb2RlcyBhbmQgc2hh
cmluZyBwb3NzaWJsaWxpdGllcyBvZiB0aGUgT0xESQ0KPiBoYXJkd2FyZS4NCj4gDQo+IEZvciBh
bGwgdGhlc2UgcmVhc29ucywgYWRkIHN1cHBvcnQgZm9yIHRoZSBPTERJIFRYZXMgYXMgRFJNIGJy
aWRnZXMuDQo+IA0KPiBSZXZpZXdlZC1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVu
QGlkZWFzb25ib2FyZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFyYWRoeWEgQmhhdGlhIDxhLWJo
YXRpYTFAdGkuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBcmFkaHlhIEJoYXRpYSA8YXJhZGh5YS5i
aGF0aWFAbGludXguZGV2Pg0KDQpJJ3ZlIGFwcGxpZWQgdGhlIHNlcmllcyBvbnRvIG5leHQtMjAy
NTAzMjAgKCsgcmVxdWlyZWQgRFQgY2hhbmdlcyBmcm9tDQp0aGUgVEkgdHJlZSArIHRoZSBwYXJ0
cyByZXF1aXJlZCB0byB3aXJlIHRoZSBwYXJ0aWN1bGFyIHBhbmVsKSBhbmQgdGVzdGVkDQp3aXRo
IHNpbmdsZSBjaGFubmVsIEFVTyA4MDB4NDgwIExWRFMgcGFuZWwgb24gT0xESTAuIExHVE0hDQoN
ClRlc3RlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5Ac2llbWVu
cy5jb20+DQoNCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3RpZHNzL01ha2VmaWxlwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS90aWRzcy90aWRz
c19kaXNwYy5jwqDCoMKgwqDCoCB8wqAgMjQgKy0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vdGlkc3Mv
dGlkc3NfZGlzcGMuaMKgwqDCoMKgwqAgfMKgwqAgNSArDQo+IMKgZHJpdmVycy9ncHUvZHJtL3Rp
ZHNzL3RpZHNzX2Rpc3BjX3JlZ3MuaCB8wqAgMTQgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS90aWRz
cy90aWRzc19kcnYuY8KgwqDCoMKgwqDCoMKgIHzCoMKgIDkgKw0KPiDCoGRyaXZlcnMvZ3B1L2Ry
bS90aWRzcy90aWRzc19kcnYuaMKgwqDCoMKgwqDCoMKgIHzCoMKgIDUgKw0KPiDCoGRyaXZlcnMv
Z3B1L2RybS90aWRzcy90aWRzc19vbGRpLmPCoMKgwqDCoMKgwqAgfCA1NjggKysrKysrKysrKysr
KysrKysrKysrKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0vdGlkc3MvdGlkc3Nfb2xkaS5owqDCoMKg
wqDCoMKgIHzCoCA0MiArKw0KPiDCoDggZmlsZXMgY2hhbmdlZCwgNjY4IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS90
aWRzcy90aWRzc19vbGRpLmMNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJt
L3RpZHNzL3RpZHNzX29sZGkuaA0KPiANCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1l
bnMgQUcNCnd3dy5zaWVtZW5zLmNvbQ0K
