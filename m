Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAAEA438B7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 10:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEAC10E5D0;
	Tue, 25 Feb 2025 09:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="VQDpfEEF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010001.outbound.protection.outlook.com [52.103.67.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABB910E5D0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:08:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scDj97sQEdVmQyBr0vjYFYL/V/3SNKXyEw9HTyh9Eq9wAFoEFr7GI0xuEK1pbAkTu0OsB/SxY6IfY/FasqE+u4OHWW9Kkyb6/djoSVp2ruF27XYP8ysik2gQ3pNFC2IxPjcTZkEOxPhgclxDNdyWKZ457yTDWSSCM1dptmOwRb4SmigoBbAKYsYm+Xk8tMPBpl5trbbx4IpyyRq9aDXQsC84TJyN0LiVD6XP14670K2H1GMh6tALzv2DLWB8mVHaqmt2NzwhmXguyA1R/pFARxMMt6k4ebUjpmmTqj9fuxOPCHDb3X/ayFFYYlXc73aJfsjFkGU1y4L7Fb5YqJuevA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMrBclDnAnDsryjXfcRSCS/Kd+DVemSPN61zDtV4eeA=;
 b=Y2s0BjFnkTSyHu2qJ7fzpHberJg0L7vh3OJGr4IKfbukUp6wTRQflu31cII/xZf3lZwmaepKTYq1ptnW8feIBQiFFzArX1GGAYNHV6wM20akTvgBNeyO+7BchthqWJEAFdaevUMPrLx7kF/NWXMWJHs/OvByBloTfvqcnaSBFMqrdpC+2X7tNOluBqIe0ALABR8Ibuj9oF+8r6ZersBXV+lC5ekPD3j5nPa64zKf1Bv8P19LZCU0CMEAJ+8Q6BULD9yzedxDrs2nTMo/G/IYNQcEGLk+yriCnnxXhsun+cGSv1bYhLZS4HhgC2P+BCCMZYwrwq5/L6eKlB9sZXYADA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMrBclDnAnDsryjXfcRSCS/Kd+DVemSPN61zDtV4eeA=;
 b=VQDpfEEFYtURyf8/opvkk98bLBdfP66nbUBMTbNRLrRzoJGuk0NVv1HlQGTv3yvsSgt25A95FKNZezSCSTzabn+T2yN8P6pxTg6MRrWjNdMWD1qQvVWfwo/pEkZnuhsPgXREQ93ybZqDpsJq8lM9O3gAMXmXUHna4kFMA7yPeifqPYxOUel9WEVDYgKXsmeWBy4pRIPFF0wGdxa9vlH3uiVMiVqHC8ThC2hTO7bDvlW+tSsjK7amVuXFu3J7C0JrrbQGrD9uRCWZigrjbLfXPAIbalM0sJ/BvHLwxUJepF/kj8l6eHXlVlGL95ePN119KF6Xz2poXL46tp8UHeomOw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PPF729037332.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::1b1)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Tue, 25 Feb
 2025 09:07:54 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 09:07:54 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 Kerem Karabay <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>,
 Aun-Ali Zaidi <admin@kodeit.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbhsGm46fWR/3mxEipqc6+PMbxkrNWrTuIgAD67QCAABL7QIAAANpQ
Date: Tue, 25 Feb 2025 09:07:54 +0000
Message-ID: <PN3PR01MB959719792308EBB9370993DFB8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <B08444CD-38A8-4B82-94B2-4162D6D2EABD@live.com>
 <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
 <PN3PR01MB95974D5EB5A25386A8BF6FDAB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <ca34309a-f2b2-4082-92df-86a775952348@suse.de>
 <PN3PR01MB95979D1B21250604F834357FB8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN3PR01MB95979D1B21250604F834357FB8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PPF729037332:EE_
x-ms-office365-filtering-correlation-id: d0d92b01-677c-4539-bc82-08dd557be3b6
x-microsoft-antispam: BCL:0;
 ARA:14566002|6072599003|15080799006|461199028|7092599003|8060799006|8062599003|19110799003|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: =?utf-8?B?anF1bnJRT2ZaVVo2UytGcW5HQmYwZ3JmLzNHS3g3V1VEQ0hyUmJkNC8rRFZO?=
 =?utf-8?B?TUxuYmY4b0Y4K0ZiYjkvaGcxd2I5SlF6YVNCOG1mR0tUT1VFSDNVYTJFalBU?=
 =?utf-8?B?Mi9GMi95aFVtM092REx3eldWb0g0eEhzZWdQSGtvaGNhTVdqNnZESGcvTGdR?=
 =?utf-8?B?TUVRRXVPTTh4Y0FtdWwybWprMTlUdUVncTZyd2Q5aTZPaEcrQjlWSWdWT041?=
 =?utf-8?B?T2ZSWURzUHJ4VE56T3BKYkZPZ0kvNVlYMHRZUk1Tay9obzRFMFdMeHM3MHUv?=
 =?utf-8?B?bTBUaVJkMHJOcEFjQWVsekpad3VTL1A3eEllN2ZaeTRBN1p2SG1zYXZjT2Ft?=
 =?utf-8?B?NzJFZkd4eksraDBWOHRXVFNMTFVSQmFCTDFlMkhsdVRNbHJMWGc3ZFI5eFQ5?=
 =?utf-8?B?WE9QM2ZqY0dKQlJJL1M4RGZqbDAxQXNodmJrOGkxSkx2aDRMckdpcUJnNXBX?=
 =?utf-8?B?akt5cW9BajJJQ1I1U1RYZ3ZDbTVmWWt2UVUySEc5Mi9hNDh3L1E5aFFrNWJV?=
 =?utf-8?B?dWtTbkxOa1M2eXFIekx3NTZ5c3d3UVpYZnp2cTNHRlpGMk1GVGFKUkU2T1Vr?=
 =?utf-8?B?N2hNdmkxcHdnMEFCZUdwNFF6NWdlNzB3M1EvaEoxYmdMVDdiLzlrbWhmWXZs?=
 =?utf-8?B?dmNMTzlacWRDakxjTVNNOE45TlJ4b0ZUeTNjWEtCRk5ZcExDVHAyZEVmb05E?=
 =?utf-8?B?UGxZeDFySDh6OWtxRGRkWlR3RXhMbGdHYU54cDdER3JicU1RTnNrb0xoUkht?=
 =?utf-8?B?WmxoWFp1OFJDU1NaUkRHemF4TFdzTE56V3Z4b1ZabzFmZzE3Q3kzKzJ2bGla?=
 =?utf-8?B?VUtDcmEwazdQSVNYT3RsTmVKWkgxcndNeCtTOXVTbWJFamF1TmZmbWhvQzAz?=
 =?utf-8?B?dVNKYmZRQXhsL2p5cXBYSG1SOS9wZkJONk9WK0x0TFJpSXlUblVuL09ueU10?=
 =?utf-8?B?RkgyZzQ5RXlzaEtIQ0E1Z2JnZzhKSWZLOFZGa0UzN0YvYVoxOFJQSnM0amJ1?=
 =?utf-8?B?TVNyMGRyemg0TFZyRnBHb05Hanlhd1kyQ1lLb0ZnS3NCOUVXZUFHekhZY2lY?=
 =?utf-8?B?ZGR2Tk1IRDlkNVh1RkZZM21GNDcwNDJxTW9hbzdxbnJkQVF4S0FwSDBzNVRS?=
 =?utf-8?B?T1o4bmVJZnF6UFFIcm5SV0hMcnQ4RXMrOXcyQnB1ckc3YWlYT3dmenFnQ1pU?=
 =?utf-8?B?c2dKcFRSejBtb2VJcVJib1EybVdrVDRRVEFuR1FkaFNtS0FZUitkSVE0aU5Y?=
 =?utf-8?B?N0dtOWdSRXFZV0pyZEp5azJ1RGtFYnFsMmJ6L0hVeVh1b25FNUJ1RFFJN2R3?=
 =?utf-8?B?VE5UWkVqc09Ham03S3htc1lFRmx5dk1FVHA4RjhsN2ZuZ01lWEc2Y0xNdGh2?=
 =?utf-8?B?VnhGaGJIODRGdnFOU2pmYnhwM09SMG52TFRWVTROYlBnQmFiMEU1dDNPclZ6?=
 =?utf-8?B?ZzZBeUsxNHQ1R1lxb1NMb21SbTZFZkF2c2gxV2s0VmlHc2NLbDFjM2lTR3dS?=
 =?utf-8?Q?6/W27w=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHh4SnBrTDlOQVhRelNQdFJNQjBkWXhpQXkyaUI5OUFkSG5pTmZIUG9leXNX?=
 =?utf-8?B?OG1xaEM5dE9SSERsNlpXeCtWQ3ZXWGdhd20vaHRqaGF0VE9UbnRsb1RJL0Rt?=
 =?utf-8?B?bzBCZ21OeFMwZFVMSEhXOXEwOHc1aEF0RjlkTlRFWGxULzF3ZjVRMWpsd3Bk?=
 =?utf-8?B?UnF6d25HZWFCemdzWWE5Rm15eXdTTTFYV1BXOUZHaG1ITVNFM3laUC9XL1VJ?=
 =?utf-8?B?UnVZTzYrdnhIdzgzNE1KSFk1THJ2UDE1eDF1eXZTbnR1ZDRBbEQxalFCMGlI?=
 =?utf-8?B?dDNOdkdRcGJzdmFlbTNIZnFET2Y0NUhKOCtOOTFGaXptakh6NzF3ZnRtL25U?=
 =?utf-8?B?ekVaWTVGMzZ3cFRtOXFSd0ZxaXZxTTBaRWxFYmFTZzBtcDVaZmJVRmI5MUpS?=
 =?utf-8?B?YzVhZ2p6VUJXcjRrTUhOUTF6VmlKS0ZpQVRWRU85VzljSHExRXRaaDlYU1dy?=
 =?utf-8?B?VGtmeVI2dFM3bUdyTFNuQWJjMnVVSVB2MUtUS1BXV1daa3ZxZEo2M0phaHYr?=
 =?utf-8?B?d1A2RElVQ0ZKL01FUVFRa20wc1ZzalRZNWE3N1RwOVU1Tmp6TWY5cTlnTWFK?=
 =?utf-8?B?Rk83QU5EM0RsQ1M0dzRjdEc4UnBKRjRMRGJWa1dtdlRNQzh0WjBNeWtMeFBV?=
 =?utf-8?B?b1JFb0ZRM0pIYjNpUXc4NE9JdXprSExTVTlLWW1na2J0eEFMcll5dUphZHli?=
 =?utf-8?B?NUJwZXluQ0FZaERYeExXMWxhcjVkSGNmOGp0VUkrOVZTdTI0MkNISy8zbUZy?=
 =?utf-8?B?WTlkbW1Pc3VTN3FFYlEzdmhRZG80NkZUOFExMVR1dDBDV2YwOVh1SXcyeGlG?=
 =?utf-8?B?V1FNUUtzbjd1WklJQ0Z0MHZTSHMwM1VEdTdEb3l2STJzcGZ3ZGQ2VmZEdlRt?=
 =?utf-8?B?d2dyOENTWTZBTGVHaEcvVnJ4RVNUNHJnZzBLMkM2MjU0WVdUNGhLU1VQTXd0?=
 =?utf-8?B?MlRiaWJrS3oza2p6MlBFTnluV2JmSVM0NDBTb242SlNPL3ZKejVYZEN4QkZU?=
 =?utf-8?B?eVlOZFNpekY3QlBZOU1YZXNqU1BGYXU5RmdRb1NxVkxOUVlwSkg5d0ZqcStj?=
 =?utf-8?B?Wm13Z0Z5bEhaeTdvYkRjME1sbW5ibGF1S3lPSVNORnZ5Tk81dmkzcXRQemM1?=
 =?utf-8?B?dmdBU1JVYUJJejVjcS9LVmd6T3Bqb2tzZ1pyTGNBUkJLdEVpSGZKU08xbjlG?=
 =?utf-8?B?aktvOU1HMXJ5bktESG1HWEVxMnJZMTJJQ0krbjBlZVkvWUszWlE4Y01Sb3Z6?=
 =?utf-8?B?MmxwSkY4NEpWUEVOQTdyWVBRbTJyMENqWVJpUVRXVXZhZFVoaThTRFhsbWFN?=
 =?utf-8?B?QURmUjJuQ2pRcHlHN3BvUVpzZkhLVm5RMGNoK3dnVkI3Ylh5bEQvamxXcnBn?=
 =?utf-8?B?ZUFLRGU1aFFHSHZNNWlsYWtLbEtEWFY5Tkp6MjRxNk13Y0xlWDBpSHh4TUpI?=
 =?utf-8?B?Q0RLK3hjOUNPeWZ2YUY5OFV5dEc1Rm1ob3lBcDlCSXFGYXYrZ3k4bkY0cDI1?=
 =?utf-8?B?Q3E2eGtoSE0yVnphTHNXRWYvYzlZRjVwVTc0SG5LZ0ZzZ1FWRG1JNXlJN0pI?=
 =?utf-8?B?cytzWFp2MEpZTkhMbmtrZVg4NHFYeXJiOUhtNDRqME02cnREMXdNc3pJR0VJ?=
 =?utf-8?Q?oeMFhOxQv7ItDwbVOw+8IkjkDxM7C6jZcAsx34JiI/AY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d92b01-677c-4539-bc82-08dd557be3b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 09:07:54.5927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPF729037332
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

DQoNCj4gT24gMjUgRmViIDIwMjUsIGF0IDI6MzTigK9QTSwgQWRpdHlhIEdhcmcgPGdhcmdhZGl0
eWEwOEBsaXZlLmNvbT4gd3JvdGU6DQo+IA0KPiDvu78NCj4gDQo+PiBPbiAyNSBGZWIgMjAyNSwg
YXQgMToyN+KAr1BNLCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3Jv
dGU6DQo+PiANCj4+IO+7v0hpDQo+PiANCj4+IEFtIDI0LjAyLjI1IHVtIDE3OjU4IHNjaHJpZWIg
QWRpdHlhIEdhcmc6DQo+PiBbLi4uXQ0KPj4+PiANCj4+Pj4gK2NvbmZpZyBEUk1fQVBQTEVUQkRS
TQ0KPj4+PiArICAgIHRyaXN0YXRlICJEUk0gc3VwcG9ydCBmb3IgQXBwbGUgVG91Y2ggQmFycyIN
Cj4+Pj4gKyAgICBkZXBlbmRzIG9uIERSTSAmJiBVU0IgJiYgTU1VDQo+Pj4+ICsgICAgc2VsZWN0
IERSTV9HRU1fU0hNRU1fSEVMUEVSDQo+Pj4+ICsgICAgc2VsZWN0IERSTV9LTVNfSEVMUEVSDQo+
Pj4+ICsgICAgc2VsZWN0IEhJRF9BUFBMRVRCX0JMDQo+Pj4gQnR3IEkgaGF2ZSBhIGRvdWJ0IHJl
Z2FyZGluZyB0aGlzIGRlcGVuZGVuY3kuIFdoaWxlIGhpZC1hcHBsZXRiLWJsIGhhcyBtYWRlIGlu
dG8gdGhlIGxpbnV4LW5leHQgdHJlZSwgaXQgaGFzIHN0aWxsIG5vdCBiZWVuIG1lcmdlZCBpbnRv
IExpbnVzJyB0cmVlLCBhbmQgbmVpdGhlciB0aGUgZHJtIHRyZWUgSSBhc3N1bWUuIEl0IHBvdGVu
dGlhbGx5IGNvdWxkIGNhdXNlIGlzc3Vlcz8NCj4+IA0KPj4gWWVzLiBXZSBjYW5ub3QgbWVyZ2Ug
dGhpcyBkcml2ZXIgdW50aWwgd2UgaGF2ZSB0aGlzIHN5bWJvbCBpbiBvdXIgdHJlZS4gQnV0IHRo
YXQgd2lsbCBoYXBwZW4gc29vbmVyIG9yIGxhdGVyLg0KPj4gDQo+PiBNb3JlIHByb2JsZW1hdGlj
IGlzIHRoYXQgeW91ciBkcml2ZXIgc2VsZWN0cyBISURfQVBQTEVUQl9CTC4gRnJvbSB3aGF0IEkn
dmUgc2VlbiwgdGhpcyBzeW1ib2wgaXMgdXNlciBjb25maWd1cmFibGUsIHNvIHRoZSBkcml2ZXIg
c2hvdWxkbid0IHNlbGVjdCBpdC4gWW91IG5lZWQgdG8gdXNlICdkZXBlbmRzIG9uJyBpbnN0ZWFk
IG9mICdzZWxlY3QnIGhlcmUuDQo+IA0KPiBMb29raW5nIGF0IHRoaXMgYWdhaW4sIG1heWJlIGl0
IHNob3VsZCBiZSBzZWxlY3RlZC4gSWYgeW91IHNlZSB0aGUga2VybmVsIGNvbmZpZyBvZiBUSU5Z
RFJNX0hYODM1N0QsIHdoaWNoIGlzIGFsc28gaW4gZHJtL3RpbnksIGl0IGlzIHNlbGVjdGluZyBC
QUNLTElHSFRfQ0xBU1NfREVWSUNFLg0KDQpUbyBtYWtlIHRoaW5ncyBtb3JlIGNsZWFyLCANCg0K
MS4gaGlkLWFwcGxldGItYmwgaXMgZm9yIHRoZSBiYWNrbGlnaHQgb2YgdGhlIHRvdWNoYmFyLiBU
aGUgRFJNIGNvZGUgcmVtYWlucyBzZXBhcmF0ZS4NCjIuIGhpZC1tdWx0aXRvdWNoIGlzIHRvIG1h
a2UgdGhlIHRvdWNoYmFyIGEgdG91Y2ggc2NyZWVuLiBZb3UgY2FuIHN0aWxsIHVzZSB0aGUgZHJp
dmVyIHdpdGhvdXQgdGhlIHRvdWNoIGZ1bmN0aW9uYWxpdHkuDQo=
