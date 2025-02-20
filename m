Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFA0A3D79A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 12:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A3E10E939;
	Thu, 20 Feb 2025 11:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="Mgvji8/Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010010.outbound.protection.outlook.com
 [52.103.67.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9BC10E939
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 11:00:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9KBTS6IOr699RzVpiUejRRCknmx0NXLyb76NaGNIzOgraWqTtmeYNDub1yfeeRxFY/SK0Eg64k/LRhyzGcy4UB1j6QezarfmYYpKSlIQLBrLTqt9kSrsMI/Uef2m/Br/WzB4AzsZ1gPgZpZoJouy2nDoK94e9/LSqgQi4LhJRbgcgsN/WeEPaaCrRFJJUg7NF21C2yatuEzdiBgndPX3gyshq0wIAWpxcig8W714+s276m3PI6fRaZRTy3cL6TB2porcEIJOTdoF32toQcCYWQMYMEq9uQoAhijlUft2cGXNd+HfBhaoep2lnaZ3qCr0RYLs1fNtFTr+mjVG0I+Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzlX+ph0ED8UODHxVbqd02u0pQTPtxia16Qnn8nyd78=;
 b=FJRGtSQOF8ABJrnVQrt2ylXazY7PY2fjCCkKIBQDSxvfTcECyW0f0xzMLYjxH5URoinn0yB3HynRmVlLX+Gty70B23R0aF7ZQ+dM747AYML15OLW6qU1oTTIEkb/GlWW95neXrji8WWDCIGWtD7IpqnQqtW+t1YboB5V9goekZhbRAFUXwPYfGAHyQuftg6Tz8IYK7djPcL4dTm9/uWIzi3leH+XZ0N7flsT9yiZ5ZPE7f5/PUpMzLNZrYCc9QTCcV9z6X5vETIX/LRU0AO6QCodNM7DaKihhj1grcRx/Y9tM07SqMTw1Jgoq20rzysa7tEdnVaHcN5EF50uXpZFWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzlX+ph0ED8UODHxVbqd02u0pQTPtxia16Qnn8nyd78=;
 b=Mgvji8/YNnLmniFG5FkT+3qUqV0HuboM+bZugbOAiNSrgfdSO49YBB+xOJxAq/CeuaDg9rwhmpPzwERZWebJ/dx0LJzXxziNf6gyvyW4FZTgmrptEZRq5shb5stKyLVUF1PrX0rYIWBrwdJm9bH1dHwiR5DRrjy1f7vkcp6MHHae8R33N2r272xqoKqQ6cx/RB2rcma6F8nLjqob3huDDcB4Uc8LXlLLS49+TAXOU6yg6aMVq/eKD7zeoFU54YACND72MHSUk7JzBL9E7MiTjC8QEhQmAnwyBPLQV70WDJ/gcFzgwDJnY13WH9fzyYaI0pYQlipH49doLdIoJuhEtA==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by MAZPR01MB7779.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:22::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 11:00:08 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 11:00:07 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay
 <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/tiny: add driver for Apple Touch Bars in x86 Macs
Thread-Topic: [PATCH 2/2] drm/tiny: add driver for Apple Touch Bars in x86 Macs
Thread-Index: AQHbgW0jg2AkJlVClEWW91xnm1SunLNM14qAgAA9boCAAS6yAIAAHTcAgAADcYCAAAhqAIABknWAgAALKXM=
Date: Thu, 20 Feb 2025 11:00:07 +0000
Message-ID: <PNZPR01MB4478D862E7B3ACDF1839191DB8C42@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
References: <81731c1c-b74d-4b60-8c01-cda9a92d9c1b@suse.de>
 <9E4CE61A-1FA3-4409-B402-6C51D453B085@live.com>
 <95bcb1d4-c8dd-4a30-a496-e7e54717f124@suse.de>
In-Reply-To: <95bcb1d4-c8dd-4a30-a496-e7e54717f124@suse.de>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|MAZPR01MB7779:EE_
x-ms-office365-filtering-correlation-id: b9d7d60d-bdc2-4831-2650-08dd519dbcec
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|15080799006|7092599003|6072599003|461199028|19110799003|8062599003|102099032|440099028|3412199025;
x-microsoft-antispam-message-info: =?utf-8?B?RlgrQUF3aTBQVDZMNEwxZmNESXJtejlWU1lqT25wNytkSEthUzNtYWJxTi80?=
 =?utf-8?B?ZFB0Z0xvUWtTaHd0SXdGbU5SRVdkL0FmcEExRFIwVUJ6VGZyQmR2Ui9rWVB6?=
 =?utf-8?B?cVlHMGhKZHNDTVBxTTd3ekRQQ09vZDQ5a1RLYmNiZXNteDdZVG9kdGhPNEtt?=
 =?utf-8?B?SkV6dmRpN2cwWFFiQlN2SDUzMDNzcTB1d1l6cFJTSGZENWxYOFVZdXNFdzRD?=
 =?utf-8?B?OUZOTGtQRzNIVTMrZjRlb3VjY24yRWgrNDlHNXBFbCtjaCsvMG5ESFJ0Y09u?=
 =?utf-8?B?bU1lcTZrLzlYd3RwOWUxeGJVZng3YjhLa2RaMk90MEZDT2FEbDhtREpnbk5M?=
 =?utf-8?B?OHJuNmRIUXIzU1pBMHVPZDlhQXJGeDZSazladGtPT1p3WFRwZHErMFp3enFM?=
 =?utf-8?B?dWx3WkVoVFJQV2xHQnNkdEVSdmtSNW5qWTlaYVRBenYvZjYwNWtncEk4MlQv?=
 =?utf-8?B?OW1NRzUzU2R3Y2ljRmhlUFdjMmYxN3pTQ3c4dlV4VHZWanZKTUJybHFBRElN?=
 =?utf-8?B?TmRhTkVzc29nMnVUMGRiYWh4T0NNRTZ6ZXdtUlZ1Y3VrSm5hdGpYT214MjdL?=
 =?utf-8?B?ZGRvekQ4NEM5T0M5ZHB4QTJYOWNaNmZwZXhKNm1SLzQ0c3dlcUZETTlGR3BS?=
 =?utf-8?B?Smd0WEVYZnZiVktFVVhybEZnV2VnSmx6K3Y0WUVFcTQ2cXByTDFiZVFXaUda?=
 =?utf-8?B?M3VqTjB1UXJDakpPaGVjUWpxUU9HSjBwcWFLeEtFR2ZYOVkzOTE2NXQ1RDNh?=
 =?utf-8?B?OGJTWlNvdnRIM2Q1czRiaVFDN3dIemlJaEZReHYyY0MyTmtJUjRjOFcrZWdm?=
 =?utf-8?B?dm44QmJjZGt6WGhjYnpIWDljWjgvNXR4M29PRlFkVW1kR29uYnd4eUpZdCtD?=
 =?utf-8?B?ZjEzY3J6eW5QS2FXQnQyd2VuTmwxL3J5K0tiOHgvRU5JMjZnZHZ5SkpRclA1?=
 =?utf-8?B?VHI2NjZNbzNZcXBXTjhIY2luRkVYeXJmem8yM2xSVjVJQ09ac1hyU2xWMkZ0?=
 =?utf-8?B?akdQSjZ3ZjlOeU1BcTJ3bGdzb3hiaTlFZ205TDZIRW1DblNRM2t6dnI0aHBB?=
 =?utf-8?B?Q0VaZUNPVG4vSmsvUFA0bVZlZzM4bFNyK3NkUnNnT3QrazkzU0pjL05qMTFC?=
 =?utf-8?B?UVhEcmFGbGUxSTQ1djUrRlBMcUNvKzg4SWorMlB2WnE5MGlzUGxkRjhReGxl?=
 =?utf-8?B?bzBWYmpuTk00UkVnQ1ZQYUpiRHdiNGVlbjloQ1ZtcGNKSzBCdlRLS05vTENw?=
 =?utf-8?B?L3NOZ01GaVArcERZMFRBNHhDV1dWbWM5MCtmMVVWTDkyampPbWs5eFI4U2Fj?=
 =?utf-8?B?REkxRHZOeGliVis3cDlKRE92LzJNS1lCdDRDdGFjVnhmZ1VUa3YrYjIvRFdo?=
 =?utf-8?B?TDE5dTBoUXE5K09FNjF6UE53WVQyNHBDZmYzSDBGeUZNamlNbjQwbWJDRTBj?=
 =?utf-8?B?OWRsWXhUR1VmbXdQc3FKM2xna1BHS05kb3FUZWErMDU3ZWtqb1lIVFJEbU0x?=
 =?utf-8?Q?EMUqHE=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmJuQTlyWnFRT1ozVFNienYwLytWS1BVd3JIV0k5SXRlNWp1R3pmWjJ2Wm82?=
 =?utf-8?B?UzlFTFAyUWhrY09yVVowT0JnenBkend4SnladkJMVzlUaEVHMEU1TjVyS0Q5?=
 =?utf-8?B?Zmx2SVBMaHBHQTE1M1NsNXpGWlk5a0NJYkV1bDJPcTJwdmpuaytDWmFxQlFr?=
 =?utf-8?B?UkZMeTM2bU5TSEZXR1ZSZEVXMDBXUmNKMG55c1pzNTNhZ2dUbEhmV3FXbTMy?=
 =?utf-8?B?emUzaUZwbFIzNTIvTU1Wd2QzaVF3V0FGNGdBMWZFSzBDQzJtcDBFUzhEQTd0?=
 =?utf-8?B?NExzWXIvNlNiQXlhNFF3ZjFqT2pMbFBSVG9JSDlBelBITXpiQkg5NjJ4Mngv?=
 =?utf-8?B?M1hadVFhV1FUZXFBL3hGbG9qQ013TTg4MzVOcS9yWDVLdUxjRHdHNEhGMGlT?=
 =?utf-8?B?QVFRb1oyN1ZOQ1JDTVdOak41VUFMcEdqL0sxZiswNmM4Y1A3OVRYT0VIOFhY?=
 =?utf-8?B?cUVrbWJWbi9LSERhbHE5QTZVYS9xMlBpT0l0UENjeGdRWk9ZOUxkcFc5bGdE?=
 =?utf-8?B?OFgyU01BczZoUzJobUxSSThEMlhiWGxnaU03djBMTmowdWhTZU9tMjQwYUlZ?=
 =?utf-8?B?MSt4cXlMbXZ0UTl3d0NGZUxUMmtzT2RQNG4vUGd2T2R6NmR1VHhSeDdNY3NY?=
 =?utf-8?B?d2VXS3doNmorN3N2TVlQZU9jMUxWaUNoaUsxSnNob293dDV4VnBHZVZaNlV2?=
 =?utf-8?B?c1VIcU5teTExZXB6N29HL09ZeUlMK254bnlYQ3EzaFRJa1ZQdE1zOXNNWEVN?=
 =?utf-8?B?MUNOTUNsbXpqSHkrODBvYkJ5QWJiVHhNdm00NzBIUnZhL0JYVmpMWFdWUTcr?=
 =?utf-8?B?OXFBUXRRMzV2akFmTU03bldveWhqKzJGKzROZ2VqdENnejdKSzRJSlI4NUtR?=
 =?utf-8?B?ZWR5QzNWczAyMzdoZVZwTlVjbjBSblJqYjhoRFIxcDZ6eGRTMDRqTjlRMCth?=
 =?utf-8?B?b2hqOVRmRUFSNWY2NDAvcnRzUVcrZW9wSlhRN0RsWnNub25VTWJxVjJLYkVE?=
 =?utf-8?B?ZUpIWUtDOGRKNXI0Qnlhbm5PVmZ1ekplMnluSWJhdXpsVmxTK1lHaTNFUllh?=
 =?utf-8?B?M2QrZklySjFmT2dsaTBlY05LVzlxRFEyUVVsL2N1M0hnTDExMjBFVUk5V0FT?=
 =?utf-8?B?bVZ4OTZyS0RXYVJIdWtWTlBPSFd6SzRGdWJmc0FFSG1iQkFrRUhLSUk5RTJh?=
 =?utf-8?B?TVI5NjY0WWxEbnZ3OS9tejVSSHI4ZnE5U1hPTTEwRE50RkVvNDVldjZwQnVo?=
 =?utf-8?B?ZmhTTUVyWjRYZ2VRU3lSYmlVN1RVNEFhK3BNWU1UaUhVSWNDT2JQU2lQL1E3?=
 =?utf-8?B?cWEvKzFiZ0NDYVFVSnkzUnlTSkFza2VzVmFWS0IvVmFyM3ZMTVViMVdqeWh2?=
 =?utf-8?B?NitZb2FCdm5TbmtYbFNIY3Z6NVZqZU9CT1hLRVc3WlJtNE1qTk12WTZjcGZk?=
 =?utf-8?B?K0orbitiVTZTOUR1eFdQU2V3QnhNRW5DUkVDMXB0dVpCOG5icmdOY2FDOXoz?=
 =?utf-8?B?K2V1ZTdveThRbGRmbGFSR2JsdDk3d1RzYzBFTURYZmF2T3FSc2hDN1BhNXMy?=
 =?utf-8?B?eGpRYXpudHNuOXVUVEJwcnlTZDI5MFM4bWlGcytnWnBIMkwvTFdvRW1IOGY0?=
 =?utf-8?Q?YBWMUB7SnCuD7h9e1c7CemMvAMaC6YaJnh8W/aObz4Eg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d7d60d-bdc2-4831-2650-08dd519dbcec
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 11:00:07.7773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB7779
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

DQoNCj4gT24gMjAgRmViIDIwMjUsIGF0IDM6NTDigK9QTSwgVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPiANCj4g77u/SGksDQo+IA0KPiB0byBiZSBob25l
c3Q6IHlvdSBhcmUganVzdCB0aHJvd2luZyBwYXRjaGVzIGFuZCBlcnJvcnMgYXQgbWUgYW5kIHdh
bnQgbWUgdG8gZml4IHlvdXIgZHJpdmVyIGZvciB5b3UuIElmIHlvdSB3YW50IHRvIG1haW50YWlu
IGEga2VybmVsIGRyaXZlciwgeW91IG5lZWQgdG8gYmUgYWJsZSB0byBkZWJ1ZyBhdCBsZWFzdCBz
dWNoIGJhc2ljIHByb2JsZW1zLiBJIHN1Z2dlc3QgeW91IHN0YXJ0IHRvIGRlYnVnIHRoZXNlIGlz
c3VlcyBieSB5b3Vyc2VsZiBhbmQgdHJ5IHRvIGZpbmQgdGhlaXIgY2F1c2VzLiAocHJpbnRrKCkg
d2lsbCBiZSBoZWxwZnVsLikNCg0KVGhlIHRoaW5nIGlzIEkgYW0gc3RpbGwgbmV3IHRvIERSTSBj
b2RlIGFuZCBBUElzLCBpdCdzIG15IGZpcnN0IGRyaXZlciAoYW5kIHByb2JhYmx5IHRoZSBsYXN0
KS4gSSBhY3R1YWxseSB0aG91Z2h0IEkgY291bGQgbGVhcm4gbW9yZSBoZXJlLCBidXQgSSdsbCB0
cnkgdG8gZmluZCBzb2x1dGlvbnMgbXlzZWxmIG5vdy4NCg0KSSdsbCBzZW5kIGEgdjIgb25jZSBh
bGwgdGhlIGlzc3VlcyBhcmUgYWRkcmVzc2VkDQoNClRoYW5rcw0KQWRpdHlhDQo=
