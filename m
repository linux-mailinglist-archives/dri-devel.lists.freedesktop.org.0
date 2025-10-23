Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C54C012F7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52D310E3FC;
	Thu, 23 Oct 2025 12:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="rBXDYxUT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D182E10E0EA
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:41:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqdMOoSVgUgV9nIN6WmlnJqfDR74EzAzxg+oDYDYme1hT9MM0mqy0b2T5+vNTJpqO3q2PSxIWvi35GnO5PFTqae5OOd4xdGcfwgQtKZN3+CrHhvOlpR4NDHWi3j/RadAdgvhXElvMpgKJrptAbQ3IJtvVt5BaKcEweRUsU9zJ0Y0L/lfHWjLyoZSDjWBVbpcDxYGtpPfYAE1WYCh6IFPnHV9vyHBK+fIsFvvL7f5oTBUp0dggmRQA4reHgmkfESiEN0PZWwpq1ocURNxsaF91PBEqP2LpTfTR7E2CDic4QDzYFIILkryHIbjB9rG/XwjTFADMlM76tOTqjEw5s+vgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zFxUTub4yT2mYNOsG7m7P500y6mm853sv7Pkx75Nfk=;
 b=mtXiFvydpPSxyMA12HpSQzBHd1OeMfjMfdjdyGBMKAv9nAMLOArQ7xIIUY+w9ekSWdYHPoQgu66771FAuiY+7PUJJSlpJ+obTq6PuPEX0W55WG/1EgAmqh6ZT/IxVitoeH0YFwwP9C1GvIerSKB4tsY4NzQfO+cV9jHWmDfrzniOfTdScjyswuUt2vNO9bbIu3MtYs7hDFkK2P93M5TMqTl/HuCtr+p0BjewPb7TgAjKmiZwQEshi+EisZkO1qrICEoGZWxFuljceBX5F/cc25QYyt0ufvMRFDJnKZePCvrFE5G0BxF1iQVriFc7gzFpzYSTXfsUI334VQwp2NSGkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zFxUTub4yT2mYNOsG7m7P500y6mm853sv7Pkx75Nfk=;
 b=rBXDYxUTwPDowVcOvNWKnH/NHVEuU2r5XbSnEKpwaziP2e8nRFNPjOCB/tcJS52kyt7i5wQ3PWMtyftLLt8b8dP2SmYeZYDeThVXqpCygrdWn60n8IAZtuy1WGNId5A/WPbEAgGH+9Lyh/5YYE9MDFW/mYN9TLIWaWyCHFtUQCKmtfR+RAQjyOUygliPYfMuYAnF3aZZ/AIqKakL2PXKRbl/5KkKbHQXlsTmFaAfljTCaSZejlOU/RktufC2G3SOLuSjnUCqG1iZWOugZjF3Y4ZtP01hQAWn7eULhP9TMj3Ob6nwdVp3AeaAStEd9EBcde3Sa3BlSOVlIhIEY3cSqw==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DB9PR10MB8094.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4ef::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 12:41:31 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 12:41:31 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "tomi.valkeinen@ti.com"
 <tomi.valkeinen@ti.com>, "lee@kernel.org" <lee@kernel.org>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "tony@atomide.com"
 <tony@atomide.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "danielt@kernel.org"
 <danielt@kernel.org>, "deller@gmx.de" <deller@gmx.de>, "jjhiblot@ti.com"
 <jjhiblot@ti.com>
CC: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "saravanak@google.com" <saravanak@google.com>, "herve.codina@bootlin.com"
 <herve.codina@bootlin.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "alexander.sverdlin@gmail.com"
 <alexander.sverdlin@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "daniel.thompson@linaro.org"
 <daniel.thompson@linaro.org>
Subject: Re: [PATCH v6] backlight: led-backlight: add devlink to supplier LEDs
Thread-Topic: [PATCH v6] backlight: led-backlight: add devlink to supplier LEDs
Thread-Index: AQHcRBpbZbicCmieIkOD3FkmFqAZ4Q==
Date: Thu, 23 Oct 2025 12:41:30 +0000
Message-ID: <6e6039c815c7125e35b43ca2f8d32a0fa3103fea.camel@siemens.com>
References: <20250519-led-backlight-add-devlink-to-supplier-class-device-v6-1-845224aeb2ce@bootlin.com>
In-Reply-To: <20250519-led-backlight-add-devlink-to-supplier-class-device-v6-1-845224aeb2ce@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DB9PR10MB8094:EE_
x-ms-office365-filtering-correlation-id: 47ffa459-97cd-4994-a03e-08de12317dfc
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|13003099007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?Ry9QQUZrNE5xTm9XYktTTFY5L2EwYW11MlVlMS9HNmhKOXJTdTQ1bXU1RUxN?=
 =?utf-8?B?VDlBLzMxTGpPSUVuYWtaRjF2ZTBXVG1pcGx5akUwZjlEc3pYeEkzRmQ0aUdM?=
 =?utf-8?B?bWc3LzQrZ0wyb1NqZjI4Z0pTZkJrdE14NHVMSzhWRkNOMEVzcXpKYkdvclRD?=
 =?utf-8?B?aXVzMlhNSVhQNHp6c3pkMlFLZy9ndjdmOWdRVW51bSsrQVF0OGltTEdVS2ZC?=
 =?utf-8?B?bVM3N2p6OXR2bjZNbjJxWHRHMmlQUSswWFpVaFFDNU0rYkprUk5JTFJ0dFNx?=
 =?utf-8?B?RDVjTzJmNWgvcjY3b2NicDRuL09aWS8yVXh6Q0RWS1hOMWhzajlUUURJV3JQ?=
 =?utf-8?B?Y3hJTUltMElZdWhwaTIwdU9LQWt5Zk5KNnFiSlFOVmtwaitzSE42ODcxa0k4?=
 =?utf-8?B?bjVDbXVlb3RPd2FET2NqTlg2RDRzTndreERLakExQWswUW53SUtaWENHRmF2?=
 =?utf-8?B?QzR4RkU1TGxHN1N1a2pteUNrN1A2ZGxLdlkzQVBQSkg2akhPd2ZPVjhKc0d6?=
 =?utf-8?B?SHBhMk40a0dLdVQ5d1lFYTZqSkxCaXg4aUxXVnl1aGRiTm9kNVNxRGJmeXBE?=
 =?utf-8?B?RFVVOEpSWCtjNllzdWZjRzJ0TTRwUDV6MzZvVU1FZzdROHdnSVpwZzc1TW5H?=
 =?utf-8?B?dmFnNStGa01lQnAxMWZCbFIwME9nc1ZxSWp3bGZBMTh1ZmRMRGhyaFUybEJ3?=
 =?utf-8?B?RmtJK013VXVOWElEQnlWaFJBZlk0elIvSS9sdjdzcE9hdkdhMzNESWVqbmUw?=
 =?utf-8?B?Zm5teEEyUjZuQXhkM3pDYjdBbk9FYXY4c2pGL1pHTUcvM3JHZmxGZEtVMHZm?=
 =?utf-8?B?RStqcSswcjJmbVk3amtGeW41dGZONk4xcjlvMVY2WTNGdmlDQWtqWTQwUFZP?=
 =?utf-8?B?U0hZUTFZQUJ6eHdReVZoUHRHb3h4UzFGNEQ5Y2xhMUEzcXpyZlFpRXJqeS84?=
 =?utf-8?B?enJxN3orWWZaeXgwY0M5Q3U0QkpCN0pSSXhOMXFBUXE4dEdkL0RZNTBvR1NP?=
 =?utf-8?B?UkNxeG9DcWwrV3FHaDVvMjI5aWhsSDJiVFRQdWoxeGtFd1NzYTd4N083NVJ2?=
 =?utf-8?B?bnZEcFJxTHRuVVdrOEl2NCtDeGMvMmlOS2V0eWpsUitPZFZPOFh4ZkplTlhP?=
 =?utf-8?B?QzU1UGRoYVhZd0RqUzlLTlB0S052QVg4TlkwSnBlYWVyaEVwc25OMkhBTXV0?=
 =?utf-8?B?eFRMaS9leG9MT0ZCZVBtczVtWUVwa1NDR1kzNkt5clRqZGU2bnlvNU9DajRK?=
 =?utf-8?B?d055dW05OThkSkhEdmFiVzhJTmV6cWZVUFk4MUJwZWxoazdLTU5walJ6Riti?=
 =?utf-8?B?Ry9GRXpRYTNBeTRuNlZybTR6b1k0ajVpZmpnLzFkWS8wSW9KNk43d2pFc1hW?=
 =?utf-8?B?aUEyVllyc1lvU0J4aGxtYmxjVFFSOTVXZUdTSnpQTzc1cVZwbFVTSmdsWVlW?=
 =?utf-8?B?aE4zVXNIZ01LOGU2YnYram1Kd0FwTTJJRnU3Qm15a0lPczdlNWcycnFrSDZO?=
 =?utf-8?B?TVk5VHpaKzlrcjhiOC9nd2sxMXVqUnhBWkQ5WlpsSnNLK1kxUm1CczVmeDBM?=
 =?utf-8?B?RmllVFN0aktoYWw4amtYSEFESUJOSWFxZjFOenIwaVVwK3JhWU4ydmZqL3NN?=
 =?utf-8?B?L2tQb0NzU2VkK0N2UFlBbGJqV1hkaTViZU9TUUVyWEtvRGNCZ05CU29oNnR0?=
 =?utf-8?B?bExJbi9QWmJHaVNONWUxWXhSQS80TWF3UjI3YmlNb1gwMy9pZEdFemFiWmlU?=
 =?utf-8?B?WENoYWdzTndmdEJUczlKdnhFalVsdzI1UmFSZWdaaW5Zc1JDWXJWdVRRTEVv?=
 =?utf-8?B?QVRjdXJjWi9BM3lhdENNWHk1ZEFhZnVsMy9LeHVORDlNS1Q5VlJWSUNDejlP?=
 =?utf-8?B?cXA4RmFOaWpXU2FPOXpnUGxEK1l5d2RQclljRkZtd1JrOUdodFJDbWx0bksw?=
 =?utf-8?B?NSthNmUyYzl4TTcyWmFYVGpXeFV6OHJ0SGZtQWFIbS9Qd0NCbDhBam1yazBL?=
 =?utf-8?B?emxJT0V1S3pRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(13003099007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEp5THBVcTFJWlVZMGxoczZaNC9oanVWbkhMRXZlRmlhaVJiYXpUVWlSNkJF?=
 =?utf-8?B?SGxJbkpLQUhDQXgrRHpoSmZrWWlwbEh0RTN3eDNvSHE1bURGMmwrNW5kaG8x?=
 =?utf-8?B?U0FUS2ZQMTF4ZmlkVEt0Mk9xOTA5OUZjNUJ1UGlmczdjSlFvcmVHbjlIUDU2?=
 =?utf-8?B?TG5lK04yZnBFMHlkL0dQS0FTV2xYdDJITkNMQzhETlVuMjRzQ3NLU2tvR1JY?=
 =?utf-8?B?aHVpaEpKZitmZzMrMGZDN1BPVDd6MXI4YUY4NE9kcmVKL21YVm9jQXFhbWZo?=
 =?utf-8?B?K084VVVLMkZ1UWtkb2lSN3NiQi9GbllwSytHeld6ZUJka3lDdExQQmtVOWI0?=
 =?utf-8?B?V0pKMVByZkZhU1pxTnR3aVdabU1RemVKUkduV1N0cTBFR0JyRUYzUkJXREhZ?=
 =?utf-8?B?eXdUeDBwMGoxQjFXWis1eTdoZjY5UnFtbHl0R0tZMjd6OUM3Q2gwMS95SVV1?=
 =?utf-8?B?cDZmTDUvcWFmZnJFSzl1c2dwbWpRWXpYbXBweEZHMjBqYlBHYWZUeXUzODJQ?=
 =?utf-8?B?UVBreWM4YlBMd0Vsc2FVOVpHSENPSy9qS2s5QzhZUXdiMWplMkJEWlh5dFJl?=
 =?utf-8?B?a2hjeXBTajUybTZObXBVQ0t0N2Jib28xVG1kcjgybGc3NFd6QnFjSk1pak1x?=
 =?utf-8?B?M0ROOG9VaXRvWk1wK2dMOW80STRsWjdGR01wT0I2d1M2WDZTaitDRElKMmhy?=
 =?utf-8?B?MXFuR0w1Y3FBdnRBNVJXaDhyQ2lLSk12ZGRmcnhidjY1YzZ5WG51YnNJR2d5?=
 =?utf-8?B?Qm1NMVFUSVdWaFE2dzdBeFdGT0pleHlsZFZJSVdsWFFpN3ROTlBWRGtxYnJJ?=
 =?utf-8?B?bFI3bk1YVTdvZjR3OHB4Ym00eDNsaWl3MDIydCs3MGxGV0p1d29EbkFYWTk2?=
 =?utf-8?B?eXNZKysyeCtSZko4YmVOS3JGb1FFTk9qcGlLVG42Z0hIMit2dUNQT25jMHVp?=
 =?utf-8?B?dWVkMXdDOFpCZy9aaGl0YVZSaDRpUHNGcUdKVjV0eTYvUjlGUWlmb0lsUjBW?=
 =?utf-8?B?ZFNKdEs0ZkM3S0d2Ujd2dGFMTnd1ZjEvem5DMjZWU29ZUXNkOGlqdlVsM2JB?=
 =?utf-8?B?WnEwT0pzZTZMN3FjamlRRjlGU3J1aFlkN1RUa1c5d2J0amkrRHVmRHdGejBR?=
 =?utf-8?B?V213Q0l6QnVYdG9wT3VYVG5sYS8zMmxCL1dGU3RsajIrUkFidDVQRGNyK0hQ?=
 =?utf-8?B?eVc4U1ZoNDBTZFg4NWRGNWhyd2psRlgycmswZFExb2JLZisxcjBpalVmKy9x?=
 =?utf-8?B?WHp3ZFY3Z2MxcXdtTCtMSkxWb3V0bm5PNkp2eUJTM1JBTnFNcE8vMG1iWjJh?=
 =?utf-8?B?NmxNMHRYOHY2elVKVWwvK0d0MFJXU3VONzNvS2l3YWZiVXVxd0NmTmpIVTdy?=
 =?utf-8?B?UnFCdUdsb3NhQTVGUStLK0lyNVN6M21aMjVoY3NoMU8yQ3hnYmphZzRVM1dt?=
 =?utf-8?B?RzQwRHdYcEU5UGdDaGU5dkVqRlZtUU1KeDFWR0RsTGExRFRyT2prdzM5Z1pH?=
 =?utf-8?B?R0NjQ25NcnhndHVlUndkOEhHOFRXZ090dkRFVnR4NXJta3R2WFhob2w3SkVU?=
 =?utf-8?B?UFdoUEFqMkVzUHFjakw4ZXdFbWdtdXU1WnVTbnp5VUc3eWFFOWVPUmVlWGRt?=
 =?utf-8?B?aUg2RFhabUEwMjNNQUtzckUzZDZYam96aGVhLzhkNUVXVWFTMjY1N0hmcHZS?=
 =?utf-8?B?d2IwK2VBMUNEcWZFUjBEelFQalQwR2pKMWpVS2JzSTZKeUhDRGtVb1RmbzFU?=
 =?utf-8?B?YXNreXovRThSTi9oQ3Q2V2JDb3FPTnN6V0hSMFZTak9vQkZST3I5bnFES0Iz?=
 =?utf-8?B?clBTRy90bTBSN1F2WUx2TWhUWU1zclRCa01TR1BYMC9zRjBScm91MEJHdUJo?=
 =?utf-8?B?NHlUQ2ZyQ2ZYM3FWK0U3NkhjaG5ES2M5QlZuQkVhYldrNFR6NGFxS1dxa3R2?=
 =?utf-8?B?cHFtRUxUbWNEVlpFbmlEU0JUbGc5cTBsaDFFbXRXNENTV2RYNFBSN1plZkJp?=
 =?utf-8?B?L1BhUkRjT1dlOWowTmFENWRDMzBJcWxkdm1hL2R0VTgvY2Z2Q0Jib1UvaFlr?=
 =?utf-8?B?Q1R2b1RnWWlhTUtEcDZLcnBteDZONzdQVWNVRURSUm1yNnNKWHJKWEFVMnJo?=
 =?utf-8?B?VTZGYkJpdHp1cFhZMWpiUmlkVHluZys2aWZNMkorbHBGeVRoSmF0S3NEOXUy?=
 =?utf-8?Q?b5/PbMhf0z40qGvTwUY7D2s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B468CCFFF068984B9E15487EA0D2510D@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ffa459-97cd-4994-a03e-08de12317dfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 12:41:30.9542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ina4zdxlOPgjR3NWsM81v7uk1NDW7VD1xWXLcAWI4l2GK5Ss8ILwK6ALg7n/U+axwiJpXGgXidybKbZHsCTl1Giqqpl1ZhsUZncEjfqSmQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8094
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

SGkgTGVlLCBEYW5pZWwsIEppbmdvbywNCg0KT24gTW9uLCAyMDI1LTA1LTE5IGF0IDIyOjE5ICsw
MjAwLCBMdWNhIENlcmVzb2xpIHdyb3RlOg0KPiBsZWQtYmFja2xpZ2h0IGlzIGEgY29uc3VtZXIg
b2Ygb25lIG9yIG11bHRpcGxlIExFRCBjbGFzcyBkZXZpY2VzLCBidXQNCj4gZGV2bGluayBpcyBj
dXJyZW50bHkgdW5hYmxlIHRvIGNyZWF0ZSBjb3JyZWN0IHN1cHBsaWVyLXByb2R1Y2VyIGxpbmtz
IHdoZW4NCj4gdGhlIHN1cHBsaWVyIGlzIGEgY2xhc3MgZGV2aWNlLiBJdCBjcmVhdGVzIGluc3Rl
YWQgYSBsaW5rIHdoZXJlIHRoZQ0KPiBzdXBwbGllciBpcyB0aGUgcGFyZW50IG9mIHRoZSBleHBl
Y3RlZCBkZXZpY2UuDQo+IA0KPiBPbmUgY29uc2VxdWVuY2UgaXMgdGhhdCByZW1vdmFsIG9yZGVy
IGlzIG5vdCBjb3JyZWN0bHkgZW5mb3JjZWQuDQo+IA0KPiBJc3N1ZXMgaGFwcGVuIGZvciBleGFt
cGxlIHdpdGggdGhlIGZvbGxvd2luZyBzZWN0aW9ucyBpbiBhIGRldmljZSB0cmVlDQo+IG92ZXJs
YXk6DQo+IA0KPiAgICAgLy8gQW4gTEVEIGRyaXZlciBjaGlwDQo+ICAgICBwY2E5NjMyQDYyIHsN
Cj4gICAgICAgICBjb21wYXRpYmxlID0gIm54cCxwY2E5NjMyIjsNCj4gICAgICAgICByZWcgPSA8
MHg2Mj47DQo+IA0KPiAJLy8gLi4uDQo+IA0KPiAgICAgICAgIGFkZG9uX2xlZF9wd206IGxlZC1w
d21AMyB7DQo+ICAgICAgICAgICAgIHJlZyA9IDwzPjsNCj4gICAgICAgICAgICAgbGFiZWwgPSAi
YWRkb246bGVkOnB3bSI7DQo+ICAgICAgICAgfTsNCj4gICAgIH07DQo+IA0KPiAgICAgYmFja2xp
Z2h0LWFkZG9uIHsNCj4gICAgICAgICBjb21wYXRpYmxlID0gImxlZC1iYWNrbGlnaHQiOw0KPiAg
ICAgICAgIGxlZHMgPSA8JmFkZG9uX2xlZF9wd20+Ow0KPiAgICAgICAgIGJyaWdodG5lc3MtbGV2
ZWxzID0gPDI1NT47DQo+ICAgICAgICAgZGVmYXVsdC1icmlnaHRuZXNzLWxldmVsID0gPDI1NT47
DQo+ICAgICB9Ow0KPiANCj4gSW4gdGhpcyBleGFtcGxlLCB0aGUgZGV2bGluayBzaG91bGQgYmUg
Y3JlYXRlZCBiZXR3ZWVuIHRoZSBiYWNrbGlnaHQtYWRkb24NCj4gKGNvbnN1bWVyKSBhbmQgdGhl
IHBjYTk2MzJANjIgKHN1cHBsaWVyKS4gSW5zdGVhZCBpdCBpcyBjcmVhdGVkIGJldHdlZW4gdGhl
DQo+IGJhY2tsaWdodC1hZGRvbiAoY29uc3VtZXIpIGFuZCB0aGUgcGFyZW50IG9mIHRoZSBwY2E5
NjMyQDYyLCB3aGljaCBpcw0KPiB0eXBpY2FsbHkgdGhlIEkyQyBidXMgYWRhcHRlci4NCj4gDQo+
IE9uIHJlbW92YWwgb2YgdGhlIGFib3ZlIG92ZXJsYXksIHRoZSBMRUQgZHJpdmVyIGNhbiBiZSBy
ZW1vdmVkIGJlZm9yZSB0aGUNCj4gYmFja2xpZ2h0IGRldmljZSwgcmVzdWx0aW5nIGluOg0KPiAN
Cj4gICAgIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBh
dCB2aXJ0dWFsIGFkZHJlc3MgMDAwMDAwMDAwMDAwMDAxMA0KPiAgICAgLi4uDQo+ICAgICBDYWxs
IHRyYWNlOg0KPiAgICAgIGxlZF9wdXQrMHhlMC8weDE0MA0KPiAgICAgIGRldm1fbGVkX3JlbGVh
c2UrMHg2Yy8weDk4DQo+IA0KPiBBbm90aGVyIHdheSB0byByZXByb2R1Y2UgdGhlIGJ1ZyB3aXRo
b3V0IGFueSBkZXZpY2UgdHJlZSBvdmVybGF5cyBpcw0KPiB1bmJpbmRpbmcgdGhlIExFRCBjbGFz
cyBkZXZpY2UgKHBjYTk2MzJANjIpIGJlZm9yZSB1bmJpbmRpbmcgdGhlIGNvbnN1bWVyDQo+IChi
YWNrbGlnaHQtYWRkb24pOg0KPiANCj4gICBlY2hvIDExLTAwNjIgPi9zeXMvYnVzL2kyYy9kcml2
ZXJzL2xlZHMtcGNhOTYzeC91bmJpbmQNCj4gICBlY2hvIC4uLmJhY2tsaWdodC1kb2NrID4vc3lz
L2J1cy9wbGF0Zm9ybS9kcml2ZXJzL2xlZC1iYWNrbGlnaHQvdW5iaW5kDQo+IA0KPiBGaXggYnkg
YWRkaW5nIGEgZGV2bGluayBiZXR3ZWVuIHRoZSBjb25zdW1pbmcgbGVkLWJhY2tsaWdodCBkZXZp
Y2UgYW5kIHRoZQ0KPiBzdXBwbHlpbmcgTEVEIGRldmljZSwgYXMgb3RoZXIgZHJpdmVycyBhbmQg
c3Vic3lzdGVtcyBkbyBhcyB3ZWxsLg0KPiANCj4gVGVzdGVkLWJ5OiBBbGV4YW5kZXIgU3ZlcmRs
aW4gPGFsZXhhbmRlci5zdmVyZGxpbkBzaWVtZW5zLmNvbT4NCj4gRml4ZXM6IGFlMjMyZTQ1YWNm
OSAoImJhY2tsaWdodDogYWRkIGxlZC1iYWNrbGlnaHQgZHJpdmVyIikNCj4gU2lnbmVkLW9mZi1i
eTogTHVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4NCj4gUmV2aWV3ZWQt
Ynk6IEhlcnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPg0KDQpJJ3ZlIG5vdGlj
ZWQgdGhhdCB0aGUgcGF0Y2ggaW4gYXJjaGl2ZWQgaW4gdGhlIHBhdGNod29yayBbMV0gYnV0IEkg
d2Fzbid0DQphYmxlIHRvIGZpbmQgaXQgaW4gYW55IGJyYW5jaCBvZiB0aGUgYmFja2xpZ2h0IHRy
ZWUgWzJdLg0KDQpDb3VsZCBpdCBiZSB0aGF0IHRoZSBwYXRjaCBzb21laG93IHNsaXBwZWQgdGhy
b3VnaD8NCkl0IGRvZXMgc29sdmUgYSByZWFsLXdvcmxkIGNyYXNoLCBjb3VsZCB5b3UgcGxlYXNl
IGNvbnNpZGVyIHRvIGFwcGx5IGl0Pw0KDQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHY2Og0KPiAtIEVE
SVRNRTogZGVzY3JpYmUgd2hhdCBpcyBuZXcgaW4gdGhpcyBzZXJpZXMgcmV2aXNpb24uDQo+IC0g
RURJVE1FOiB1c2UgYnVsbGV0cG9pbnRzIGFuZCB0ZXJzZSBkZXNjcmlwdGlvbnMuDQo+IC0gTGlu
ayB0byB2NTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDUxOS1sZWQtYmFja2xpZ2h0
LWFkZC1kZXZsaW5rLXRvLXN1cHBsaWVyLWNsYXNzLWRldmljZS12NS0xLTc2ZDZmZDRhZWIyZkBi
b290bGluLmNvbQ0KPiAtLS0NCj4gDQo+IENoYW5nZXMgaW4gdjY6DQo+IC0gZml4IGluY29ycmVj
dCBhcnJheSBpbmRleA0KPiAtIGZ1cnRoZXIgaW1wcm92ZSBjb21taXQgbWVzc2FnZQ0KPiAtIExp
bmsgdG8gdjU6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA1MTktbGVkLWJhY2tsaWdo
dC1hZGQtZGV2bGluay10by1zdXBwbGllci1jbGFzcy1kZXZpY2UtdjUtMS03NmQ2ZmQ0YWViMmZA
Ym9vdGxpbi5jb20NCj4gDQo+IENoYW5nZXMgaW4gdjU6DQo+IC0gc2VwYXJhdGVkIHRoaXMgcGF0
Y2ggYXMgYSBzdGFuZGFsb25lIHBhdGNoDQo+IC0gaW1wcm92ZWQgY29tbWl0IG1lc3NhZ2UsIGFk
ZGluZyBmZWVkYmFjayBmcm9tIEFsZXhhbmRlcg0KPiAtIG5vIGNvZGUgY2hhbmdlcw0KPiANCj4g
VGhpcyBwYXRjaCBmaXJzdCBhcHBlYXJlZCBpbiB0aGUgdjQgb2YgYSBsb25nZXIgc2VyaWVzLCBl
dmVuIHRob3VnaCB0aGUNCj4gaXNzdWUgaXMgb3J0aG9nb25hbDoNCj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjQwOTE3LWhvdHBsdWctZHJtLWJyaWRnZS12NC02LWJjNGRmZWU2MWJl
NkBib290bGluLmNvbS8NCj4gLS0tDQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sZWRfYmwu
YyB8IDEzICsrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCsp
DQo+IA0KPiANCj4gLS0tDQo+IGJhc2UtY29tbWl0OiBhNTgwNmNkNTA2YWY1YTdjMTliY2Q1OTZl
NDcwOGI1YzQ2NGJmZDIxDQo+IGNoYW5nZS1pZDogMjAyNTA1MTktbGVkLWJhY2tsaWdodC1hZGQt
ZGV2bGluay10by1zdXBwbGllci1jbGFzcy1kZXZpY2UtNmRlYzRlMDQ0NDVhDQo+IA0KPiBCZXN0
IHJlZ2FyZHMsDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbGVk
X2JsLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sZWRfYmwuYw0KPiBpbmRleCBkMmRiMTU3
YjJjMjkwYWRjM2ExNTkwMjNlOWUyMzk0ZmM4NzczODhjLi4wZWQ1ODVlYjI3OTAzZGY0MzY1MWM1
MzY1ZjQ3OWY3ODY1Y2M4YTk1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9sZWRfYmwuYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sZWRfYmwuYw0KPiBA
QCAtMjA5LDYgKzIwOSwxOSBAQCBzdGF0aWMgaW50IGxlZF9ibF9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQ0KPiAgCQlyZXR1cm4gUFRSX0VSUihwcml2LT5ibF9kZXYpOw0KPiAg
CX0NCj4gIA0KPiArCWZvciAoaSA9IDA7IGkgPCBwcml2LT5uYl9sZWRzOyBpKyspIHsNCj4gKwkJ
c3RydWN0IGRldmljZV9saW5rICpsaW5rOw0KPiArDQo+ICsJCWxpbmsgPSBkZXZpY2VfbGlua19h
ZGQoJnBkZXYtPmRldiwgcHJpdi0+bGVkc1tpXS0+ZGV2LT5wYXJlbnQsDQo+ICsJCQkJICAgICAg
IERMX0ZMQUdfQVVUT1JFTU9WRV9DT05TVU1FUik7DQo+ICsJCWlmICghbGluaykgew0KPiArCQkJ
ZGV2X2VycigmcGRldi0+ZGV2LCAiRmFpbGVkIHRvIGFkZCBkZXZsaW5rIChjb25zdW1lciAlcywg
c3VwcGxpZXIgJXMpXG4iLA0KPiArCQkJCWRldl9uYW1lKCZwZGV2LT5kZXYpLCBkZXZfbmFtZShw
cml2LT5sZWRzW2ldLT5kZXYtPnBhcmVudCkpOw0KPiArCQkJYmFja2xpZ2h0X2RldmljZV91bnJl
Z2lzdGVyKHByaXYtPmJsX2Rldik7DQo+ICsJCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwkJfQ0KPiAr
CX0NCj4gKw0KPiAgCWZvciAoaSA9IDA7IGkgPCBwcml2LT5uYl9sZWRzOyBpKyspIHsNCj4gIAkJ
bXV0ZXhfbG9jaygmcHJpdi0+bGVkc1tpXS0+bGVkX2FjY2Vzcyk7DQo+ICAJCWxlZF9zeXNmc19k
aXNhYmxlKHByaXYtPmxlZHNbaV0pOw0KDQpbMV0gTGluazogaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2RyaS1kZXZlbC9wYXRjaC8yMDI1MDUxOS1sZWQtYmFja2xpZ2h0LWFk
ZC1kZXZsaW5rLXRvLXN1cHBsaWVyLWNsYXNzLWRldmljZS12Ni0xLTg0NTIyNGFlYjJjZUBib290
bGluLmNvbS8NClsyXSBMaW5rOiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvbGVlL2JhY2tsaWdodC5naXQNCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNp
ZW1lbnMgQUcNCnd3dy5zaWVtZW5zLmNvbQ0K
