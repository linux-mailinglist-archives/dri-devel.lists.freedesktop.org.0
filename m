Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2F5A5D948
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 10:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6B610E0A6;
	Wed, 12 Mar 2025 09:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="iJAKM6PZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C1010E5BB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 15:27:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3jEu4UfYmXj4C9W8/QstZYZtMj8/leWaBUG2dopSp+cAZ3zgysCdZJT5RxaXAQq+p6TDpMCU4H1BrklbMSLvOFp2ysD43IhWXN9TUMTvape052YwbUPbWmXub7vKyOVb7iIdTxDFgMLAQslb6YqtrRvIGix49OYOI1M95nJtvWV2GBSvcN7n81vC/7UEY7Xbym8U1kM+R5In0/AovEJhj+3OL+YXUmADQXx0tfAYALWtqE47/sjd/oaA8AX+8ezgfQkIPmmG5k08/n0GMiJ/ujLgH9W6r6D1oldcuqQw5kTA529A+JHzf7Q+RFUKQIanqcV2f6BXUt2aC7j1cd/UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHlkge3Jdy01xOLXu3zLbK+zulvpg3h2POr7iKk10vg=;
 b=vKDyyU/lrYX9J/N2Y0dLB6gNSVBu5h9wrCgL++WcI40xtEDd2cb5KkDAXSvhMuxTfaPr+AxpoP7sWJeBximRw7QCt9MK0s7BjKKWywa06HqrFbAAIjJsxA29X0m+pYNQeRYlxjVHjCTSNlH2Aatf//wDoj1hgxgllvibFpg03H/IC3S0fQKJmfp5zIeMUrj/9GzrPx2DS28s/oRKh6J0zNGaN3jSbCEo0Z4HtyRBo5rfraUZZXUu45Dy8WzXad1i+VZYj4sMasqmfMFFJvM5S8FMLY6npOYtucRJdlTMynxfMQ1/lhlUtJtqsAEs4hrOUQbLWQK2NZPFk9yoH9LUMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHlkge3Jdy01xOLXu3zLbK+zulvpg3h2POr7iKk10vg=;
 b=iJAKM6PZO9YhoMtf2t3kznQElNvmhcdUKFtg+vg05xalsu/XwfNTyT7yTOCkIn0kzNRc9hejRvpuZMv2upb1ajiL1xO08V6qqululajn38H205AtshVTv9EYLtQQTMMrtPF7vJUnTEjGJoNV214uuMtbOfv2wGLB5Yt4+HN9s6YbC1LtPUsr2yFQePF8FKJy/vRKMbbxp//ACVPjiynmp5WuC1U8ytGoiOgh1V5Y3A7f7gmGW/HglzYDjobpjFY9mnEuSx9Sg+Fwbg1BkHkSRMLW+MzkYDLs25OYuqoZ9grYpFIgeWw3C8LLbV3GC5OGSKkXORcncqCrXXSYxzTpjA==
Received: from AS8PR10MB6699.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:563::8)
 by GV2PR10MB6549.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:bc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 15:27:14 +0000
Received: from AS8PR10MB6699.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8038:bb72:c5d:8483]) by AS8PR10MB6699.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8038:bb72:c5d:8483%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 15:27:14 +0000
From: "Zini, Alessandro" <alessandro.zini@siemens.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
CC: "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "andrej.picej@norik.com" <andrej.picej@norik.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "rfoss@kernel.org" <rfoss@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "marex@denx.de" <marex@denx.de>
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: add h/vsync-disable support
Thread-Topic: [PATCH 2/2] drm/bridge: ti-sn65dsi83: add h/vsync-disable support
Thread-Index: AQHbjnfGR46m6PRz5kqDQuR5SHx5tLNnMNkAgAbmVYA=
Date: Tue, 11 Mar 2025 15:27:14 +0000
Message-ID: <b0f19f77d2db121f7dbc8a3b6091bf114427e839.camel@siemens.com>
References: <20250306091133.46888-1-alessandro.zini@siemens.com>
 <20250306091133.46888-3-alessandro.zini@siemens.com>
 <tzrdtqpim2srjl3dihjdyejrwunirq7mbwngyqi3avdtympkjx@2kqsg562fcke>
In-Reply-To: <tzrdtqpim2srjl3dihjdyejrwunirq7mbwngyqi3avdtympkjx@2kqsg562fcke>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6699:EE_|GV2PR10MB6549:EE_
x-ms-office365-filtering-correlation-id: 0481451c-a146-4c67-e327-08dd60b1334a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Y0tnenhNanZadWpucE1jMk1WL0E4NUkxcUpxVkVNRGpreFE1L3RrL2c3TnV4?=
 =?utf-8?B?eHhMcFN2d3VCQzZSUnJ3bmZUdWJuOXBuOXRERE00S0hnK3crTDloTXhESHYz?=
 =?utf-8?B?MDBqdWZvZ2ZpOTRGakI1ckN3WVRCaytTTE9yZjc4SVJ5NFBEYUZYcTU3dkJU?=
 =?utf-8?B?T0dQaUJzc0pBTklGUFdUSUlFMkNjVGM4eFBqMUtoVTczSWNrTWp3ZVN1aFlW?=
 =?utf-8?B?dEJUUGtpNGdlNXlrUm83M3hjZnE4N3BSdG1aMDFBd2Q5WXptRFJqZTJ1dmp5?=
 =?utf-8?B?M1pYUXprUGx3Vlpoa0hkNDdIazFYSnBHSWVYSC8wTDY3S01FWVIyTG1OR3k0?=
 =?utf-8?B?V0lPR2hBVXdObVR0a0sva1lyWlpWbzVPZi9meWw3RE1rMHFiNDR0VE1rek1H?=
 =?utf-8?B?YkVwczh2UkE1UUtNbHYzS2xYbVZ0RkV4aGgydjBUaVE2YmExV1RqMEVrMmxH?=
 =?utf-8?B?dlBuMDQrTXlvNVhubkp6Nll6czUyYXZKcU1CbXJOODZDakJocVZNelVKc04w?=
 =?utf-8?B?WlpOd2lTZXhzb3JlTXF3UHlXa3NRemFEZVhobEJGU0ZQMHFiVFY5L1piYk5T?=
 =?utf-8?B?bW9uV3pXbFFpeTFaM0hUT2ZiTkxDa0FWd1oxY3NiT1dua1BDS2pLR1h6YUJP?=
 =?utf-8?B?ZTZabW9INEEwUWdrblVFcVZYT0FLZFNtTVVDT3RQamN2NlB5SE9QaTAvSGQ4?=
 =?utf-8?B?NEIyM2tERGhmV0ZPL0x0bkJCejdYUlE4Y2tUcVhVb1EvVzQ3YlpiU3BSTzc1?=
 =?utf-8?B?SFlOekNqNDFEN0NaaXZ4bVBUcVY5Tmt5aUZDSVRmbndzcDQ0NG1GTjNpKzVj?=
 =?utf-8?B?K016dHZWZTk2Z1g3R3NFRkV3ZE95U0xPNDIxVEVjTmt1QkUvR1h6T09GQXdF?=
 =?utf-8?B?cG56cVhvUitoaUx4UGlxMHNNcHFKRzNmNjB3YXFiYUZyMW1Sc0JraTlZaDRr?=
 =?utf-8?B?aWtaT2diRUxLS1o5Q2NvdXhEQXU1cTFnMFNyUnBnZ0IrdjZtcGRUT0tQMCsr?=
 =?utf-8?B?M1QzVE9FVnpHSXpuRmlhNWhqY29pSVpJcVlkRVZ5ejJ3djIySVhyQVA0YStr?=
 =?utf-8?B?aXNDTitpVk1KR2RLZlUwTEtKbUtPOTRIR1Z0Z04yQnVuZGdqckExdG1OZ2E0?=
 =?utf-8?B?Y2syajRQNk5FVUpycVFXWU1icmRtOUVwQkpKOHlOVW1VT3VXaHJla3RRQ3I4?=
 =?utf-8?B?QVFSYlhZbUI5Tm1waStlZDEwMlpQYTJoRW9GOGpGU1d4QWJ3VXNGTTd0NXNJ?=
 =?utf-8?B?L2pEOWRlUm5PMzVDWDN1cVVLakVDOXd2YkhPMGNaMzk2alViby9TdUFyTHF2?=
 =?utf-8?B?c2tQMkFwU054TFVmVTU1RUlDRVRPbHZzbmNhdUhDMy9WVFZvbWQvdzQ0MnM1?=
 =?utf-8?B?R2VIYUsyNlkwZjVGOEY2WTRDUmlNb3pESTZUamNkSlN1b2NMNUJQUTYwOHhJ?=
 =?utf-8?B?Q3N1djBLQkNNd0dNZnJWMWFCWTcrRTY0ZVNRaThJZ2ZLVEhZVHhkTUoxRW85?=
 =?utf-8?B?L1dtUk1JL2tpMVpIWGsrb0RCbUF0TFVJYVU1eGRPNkZDTUhoRms3L21JcEVT?=
 =?utf-8?B?cmZOWUc5cDdwa2NxUmpBQzZRMmFZN0tCT1Q0NjZKNkhmRHZqZXhHejRMa3Qw?=
 =?utf-8?B?MTZFYldOQ21nR3RSRzFKOXQ4NkJia3YyL25ka29POGtGYmwvOElsc016NU1t?=
 =?utf-8?B?cFFyOUpkSUR3M21zZW8zRTNuNVRTR2tXN28ycTZFVEtDamFIdEpLSFJmRzhD?=
 =?utf-8?B?bGtxeiszZUszZCtHMVdxTVpQUUUwYjhZNG9RSkdHRnR3ajVGSUNFSWxMRGhk?=
 =?utf-8?B?ODdKK3RhQzZzOWtHNUZIUzQzK2J4WXpXVHVFdVY3ejVkZWNCeFhPS0t2VHZK?=
 =?utf-8?B?REpWbWt4ZFN6SmUxSVJRRzdKbkhRVmFDVFcvdDJLTlpsaTU3dEpyQTREdzN3?=
 =?utf-8?Q?jykazI7hRaegwPWgwVjZM6m23jS7Tt6c?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB6699.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1VreTNWRStrbHVFaGI1UkxvZSs5LzUyLzYrWWd0bmg2NDNqVlZEMGF1Q3lQ?=
 =?utf-8?B?SWE2cThJcWxsK01zSmMxa2lmT3R5WElXZ2grcEZYaFl4bm51VjEvNTQ5T0c5?=
 =?utf-8?B?cHg3aVUreUhONEZJQjJzampaVXJHSSt6UWMzMHVMS2ZkTkM4dFpvakE5TWdF?=
 =?utf-8?B?c0N3SFdzbG9YS2tEbUZUdjcwNGxkNFhaNEdLNkVRT29sMDIraVFtNy9udTlG?=
 =?utf-8?B?dFAxUVAzbzNtb0FDUTkrQ0wvNENQeHd3V25xbVE2bjBCcG1yTTJuYS95WFdS?=
 =?utf-8?B?bFJNWlNjRTdaR2x0blVjNXVIQU9ibE9tNHB3YTBuUFdrZlhiSjRQU1o1NUta?=
 =?utf-8?B?SEs0aDlwLzBrdXQ0V3A1VndlS3JmUzUvM0Njb1BpQUhPNldIUDRTM0M5TFZo?=
 =?utf-8?B?dXl2VWs2WHZNTldENTlEeGVjN0hCMkwvNERHNUtZRzYxQ0RYc0IxMHBYY0pK?=
 =?utf-8?B?K0tqY0ovNytWTlYvVGtoa29XS2JWU2pONVh1ZGxjK29MOERYSzQxM1pCYXRz?=
 =?utf-8?B?Q3pRbHZ2aThBcXR6WERmWHhmV3Z3SzJadkNIa3pxVWtXa1VsK3lwaW9aMlpW?=
 =?utf-8?B?WjAxYlVtR3M0MGRCcDc0eVczUkIzN3NJSmU5RHJKblNEQmlJV1YzODRBT2hF?=
 =?utf-8?B?alhxdzB4UkliT2tIK3drcWpyUDlFelFWRjJXMGI3NE1jQWpCYjltd0NPeVlt?=
 =?utf-8?B?VDF3R25IcTdmUVQxNm94ZkNKY1JLcE5xREswaG54MC81NTh1VVZxMkpPSnNr?=
 =?utf-8?B?SExZU3cxRFc2NlNQOHJCM2hKU01ndXZWelV0VkFWRXBPcUdncm81QldZaDdw?=
 =?utf-8?B?MGg5UlZDWnZjN2xFeGduamdIUG9IUW1JYkpDYW9uVFBpTUlLU1JnVjNod1Jh?=
 =?utf-8?B?Ukh3RU9KNDhKRjQybnBHaGdmSy9SMHhGL0Z6bmpxNEgzU0pieDJPYTA1MWw1?=
 =?utf-8?B?WG5nRksxSzhDbEdaY3NhN05ZeHA0TUpYU3BQSHpNNzU1b0c5NWs2dTFndmlz?=
 =?utf-8?B?T2tMdkpveGp0bjVjQllNeEJDaUFXZ1V2OU9EM2FHeGdyTkdCQTF2OXJqd2hY?=
 =?utf-8?B?TnM4eXFTaVk1VVJpTDJ3T2NxZlhpek9lclp5TXFwRnBNaEZiNXFla2hoUUNY?=
 =?utf-8?B?Szk3dXJuVWQwYkdHZDV2ck5YL0plZVhVeEFhOW43Ukk1ekdEN0kreHhURVpG?=
 =?utf-8?B?QSs0SHZTL3hHeCt2ZXdVNUIyRnB3djB2bEhQTElZZUpBcEI1S1FzVUdmTHYv?=
 =?utf-8?B?T25vcUNOQ2R3L1VFMU9CWVhjNGh4aHhwSkl0b21ra0xmYzc0Qlp3ZWkxZXpB?=
 =?utf-8?B?SzBxaVhpS1dwOHdoajA3VXpnNGtOUEh3dWZKQjE2VE5zcG1jL2pDYjZlUmxE?=
 =?utf-8?B?TVY2OFBrbXphSDVrbTQwMUpWU0JMR1Q0U0Q3NDM4QkpodUxPMWhybklvQzNm?=
 =?utf-8?B?R3VIZEJoMkFIM1JHY2xCbFloS1RJTEFmZTBIcjY2a3pPUWpDckFCREduZzhz?=
 =?utf-8?B?TStDcHIrTVNFdHU5anJpRktVSkRkOUVuL0VzZ1pORDlzREdwOWd0WmlEdUs1?=
 =?utf-8?B?Z0cyS0NZREwwbERmeFlsQkdmNWR0YUptVHBpWm4yckc2a2JGcmYwWDZQYkNy?=
 =?utf-8?B?c3hqK1NQaktqdjJWZGg0TVRwMGlqckNYanNKUEN4aU42Q2s2ZGZGaVhOV3By?=
 =?utf-8?B?SGE1RFdqclNNSEdjQnZZd0hOblVIUUo2ZTRmbXhaaUw4YmpINFJwbDFTVnQ0?=
 =?utf-8?B?SnY1TGM3NkNiSWRZODJBdFAzVUdoZzI0ZDdJQnlYMW5xcVk2Y2NtTGNpOTRW?=
 =?utf-8?B?WHBGVVIzTC9TMGRIYXpDWGVNVDd2Ym1DQmo4Z2R1a09RMjl6ZGhGL25YUnhC?=
 =?utf-8?B?MmllN0FicVl2NE9halEvN2hnd0pPRjlWdm9SdDA4RnJnRk8yNE5rOWZQdi9D?=
 =?utf-8?B?YVBVelJQT1RNZ2trUncxZERLVHF2Mk1SNWpsdThUWENsNUpOcEhmK3BXOGRG?=
 =?utf-8?B?enFPU1c0OVpVUXZjVjg0VUZHcVNiRHZtNjVwRGN0K1d5d1BnV2wrVEVGTFBU?=
 =?utf-8?B?MkVRWUZBa0NRRHJGSUc0dzc3TVYwc2lrdUZiNG5KMStHUG5qYmM5V01hTm1U?=
 =?utf-8?B?ODU1cjFxb28yS2F0aVFUekZtU3RCTVcvUnFyeVVSbEZtcVA2ZTV2MnpuZ2hu?=
 =?utf-8?B?MlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5DF43AC0160E8D4F81F4C1E7040424F8@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6699.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0481451c-a146-4c67-e327-08dd60b1334a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 15:27:14.2236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: veIlw9YUMr8L9Z9zhKBPAQghTQfJoJjLKPgqvXErTpZTeUqt7dCxJWDv4GZRoyO3VdsK9uVfjgLWPfFFMFD3NioUIqhpJtmkNs7azWhxdvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6549
X-Mailman-Approved-At: Wed, 12 Mar 2025 09:22:44 +0000
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

T24gRnJpLCAyMDI1LTAzLTA3IGF0IDA4OjA1ICswMjAwLCBEbWl0cnkgQmFyeXNoa292IHdyb3Rl
Og0KPiBPbiBUaHUsIE1hciAwNiwgMjAyNSBhdCAxMDoxMTozM0FNICswMTAwLCBBLiBaaW5pIHdy
b3RlOg0KPiA+IEZyb206IEFsZXNzYW5kcm8gWmluaSA8YWxlc3NhbmRyby56aW5pQHNpZW1lbnMu
Y29tPg0KPiA+IA0KPiA+IFRoZSBoL3ZzeW5jLWRpc2FibGUgcHJvcGVydGllcyBhcmUgdXNlZCB0
byBjb250cm9sIHdoZXRoZXIgdG8gdXNlIG9yDQo+ID4gbm90IGgvdnN5bmMgc2lnbmFscywgYnkg
Y29uZmlndXJpbmcgdGhlaXIgcHVsc2Ugd2lkdGggdG8gemVyby4NCj4gPiANCj4gPiBUaGlzIGlz
IHJlcXVpcmVkIG9uIHNvbWUgcGFuZWxzIHdoaWNoIGFyZSBkcml2ZW4gaW4gREUtb25seSBtb2Rl
IGJ1dCBkbw0KPiA+IG5vdCBpZ25vcmUgc3luYyBwYWNrZXRzLCBhbmQgaW5zdGVhZCByZXF1aXJl
IHRoZW0gdG8gYmUgbG93LXZvbHRhZ2UgbGV2ZWwNCj4gPiBvciBncm91bmQuDQo+IA0KPiBJZiB0
aGlzIGlzIHJlcXVpcmVkIGJ5ICdzb21lIHBhbmVscycsIHRoZW4gaXQgc2hvdWxkIGJlIGEgcHJv
cGVydHkgb2YNCj4gdGhlIHBhbmVsLCBub3QgYnkgdGhlIGJyaWRnZSBpdHNlbGYuDQoNCkkgZ290
IHRoZSBzYW1lLCByaWdodGZ1bCBvYmplY3Rpb24gYWxzbyBmcm9tIFJvYi4gSSdsbCBhbnN3ZXIg
aGVyZSB0bw0KdGhlIGJvdGggb2YgeW91IHdpdGggdGhlIHJlYXNvbmluZyBiZWhpbmQgdGhlIHN1
Ym1pc3Npb24gb2YgdGhpcyBwYXRjaC4NCkFjdHVhbGx5LCBJIHdhaXRlZCBmb3IgYSB3aGlsZSBi
ZWZvcmUgc2VuZGluZyB0aGlzIHBhdGNoLCBiZWNhdXNlIEkNCm9yaWdpbmFsbHkgaGFkIHRoZSBz
YW1lIG9waW5pb24uIEkgZG8gc3RpbGwgaGF2ZSBzb21lIGRpZmZpY3VsdGllcw0KZHJhd2luZyB0
aGUgbGluZSBiZXR3ZWVuICJ0aGlzIGlzIGEgcGFuZWwgcHJvcGVydHkiIGFuZCAidGhpcyBpcyBh
DQpjb25maWd1cmFibGUgZmVhdHVyZSBvZiB0aGUgYnJpZGdlIi4NCg0KSG93ZXZlciwgSSBoYXZl
IGFsc28gcHJlcGFyZWQgYSBzZWNvbmQgcGF0Y2ggd2hpY2ggYWRkcyBzdXBwb3J0IGZvcg0KY29u
ZmlndXJpbmcgdGhlIExWRFMgbmVhci1lbmQgdGVybWluYXRpb24uIEFmdGVyd2FyZCwgSSBmb3Vu
ZCB0aGF0IHRoaXMNCmZlYXR1cmUgaGFzIGFscmVhZHkgbWFkZSBpdHMgd2F5IGluIHJlY2VudGx5
LCBzbyBJIGRyb3BwZWQgdGhlIHBhdGNoLg0KQXJndWFibHkgc3RpbGwsIHRoYXQgZmVhdHVyZSBj
b3VsZCBiZSBzZWVuIGluIHRoZSBzYW1lIHdheSBhcyB0aGUgb25lDQphZGRlZCBmcm9tIHRoaXMg
cGF0Y2gsIHNpbmNlIGEgcGFuZWwgbWlnaHQgcmVxdWlyZSAxMDAgT2htLCB3aGlsZQ0KYW5vdGhl
ciAyMDAgT2htLiBMaWtld2lzZSwgYSBwYW5lbCBtaWdodCByZXF1aXJlIGgvdnN5bmMgc2lnbmFs
cywgd2hpbGUNCmFub3RoZXIgbWlnaHQgcmVxdWlyZSB0aGVtIHRvIGJlIHplcm8vYWJzZW50Lg0K
DQpUaGUgVEkgRTJFIGRpc2N1c3Npb24gSSBoYXZlIGF0dGFjaGVkIHRvIHRoZSBjb3ZlciBsZXR0
ZXIgb2YgdGhpcyBwYXRjaA0Kc2VyaWVzIGV2ZW50dWFsbHkgbWFkZSBtZSBjaGFuZ2UgbXkgbWlu
ZC4gRnJvbSBteSBwb2ludCBvZiB2aWV3LCB0aGUNCmRpc2N1c3Npb24gaW1wbGllcyB0aGF0IGF2
b2lkaW5nIHRoZSBnZW5lcmF0aW9uIG9mIGgvdnN5bmMgc2lnbmFscyBpcw0KaW5kZWVkIGEgKGNv
bmZpZ3VyYWJsZSkgZmVhdHVyZSBvZiB0aGUgYnJpZGdlLCBldmVuIHRob3VnaCBub3QNCmV4cGxp
Y2l0bHkgZG9jdW1lbnRlZCBpbiBpdHMgZGF0YXNoZWV0Lg0KDQpHaXZlbiB0aGUgdHdvIHJlYXNv
bnMgYWJvdmUsIEkgdGhpbmsgdGhpcyBwYXRjaCB3b3VsZCBiZXR0ZXIgZml0IGluIHRoZQ0KYnJp
ZGdlIHJhdGhlciB0aGFuIGluIHRoZSBwYW5lbCAod2hpY2gsIGZvciBjb250ZXh0LCBpcyBkcml2
ZW4gYXMgYQ0Kc2ltcGxlLXBhbmVsKS4NCg0KPiBDYW4gdGhlIHBhbmVsIHJldHVybiB0aGUgbW9k
ZSB3aXRoIGhzeW5jX2VuZCA9IGhzeW5jX3N0YXJ0IGFuZA0KPiB2c3luY19lbmMgPSB2c3luY19z
dGFydD8NCg0KSSBkaWQgdHJ5IHRvIHNldCA8aC92c3luYy1sZW4+IHRvIHplcm8sIHdoaWNoIHJl
c3VsdGVkIGluIHZzeW5jX2VuZCA9DQp2c3luY19zdGFydCBhbmQgaHN5bmNfZW5kID0gaHN5bmNf
c3RhcnQsIHdoaWxlIGFsc28gYWRqdXN0aW5nIHRoZSBvdGhlcg0KYmxhbmtpbmcgcHJvcGVydGll
cy4gSSBhbSBub3Qgc3VyZSBpZiB0aGlzIGlzIHdoYXQgeW91IG1lYW50Lg0KSG93ZXZlciwgdGhp
cyByZXN1bHRlZCBpbiBhbiBpc3N1ZSBhbG9uZyB0aGUgcGlwZWxpbmUsIGFuZCB1bHRpbWF0ZWx5
DQpjYXVzZWQgZHJtX2F0b21pY19oZWxwZXJfd2FpdF9mb3JfdmJsYW5rcygpIHRvIHRpbWVvdXQu
DQoNCi0tIA0KQWxlc3NhbmRybw0K
