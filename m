Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68842A5EE8A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 09:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C288610E80C;
	Thu, 13 Mar 2025 08:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="UsKMJ9rC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011035.outbound.protection.outlook.com
 [52.103.67.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D714B10E811
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 08:53:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v7ZuiH/mVBTRMtEKTaQDogy794JQKW37GTSvoBBdcDITOu6/5utL3s6HZ3iP59eL2zfu85N+0Cqmp8F0VLPa3Z23Di3Q5kEu2xaLsnwnZ2418GxPWPGbHnL7IBTQVDxsbpBwjq5dvU2vIm4fmAiaJNWqdua8tnPpRY6+RtTGQoxjJO37L8rL5Ni8gKE+/SbRtmgzOrs2KHeipirwxPQLkc7dB5KTrlIu7XVvFsbwpjMLK6ag60bAXYSnVbWOFgKrZm/zKi+wQGcCm/s6WGu+lTgCoCtejWYiqz9c7byI+9S+y9XqHRKxMghPBTqDbnfy46/GQeLJjQdn//59zIy70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTXTXzsMYn25r70r3h2lKgQNud6UVWiN8GVRYfcfjqo=;
 b=MLq8Tdq+FhE/G36MxOSt0jhIKGaEhtgPAwpeQ/9TA0Aa5fa9jxAWxYXOcdjA9JZqHB1AXkcR+dRp2IEbrIfiGinCoTg8UY0fAbXfG59YAZkPnj4QVlfviKKwv7VJtKzpZ2gXuozZ6RjAzbFz32H+2ryOmNRP53FK5jMBekON87qWiWFKvs7QaC0wP/IgFD3Cl0A/TpM9I6Rf/W8JyqUMMQz4eQCnACzQwpgQWcEp2mrDOO+vrxwku9aN9uLxMiWJKSM5IZ9QcFZcTYLwTU+YFtruEGPJZDfsJMI1Z4K7zEMFqf4TjW0yUzcfxOEhKRNQupWXEPHC6JteB98q5iV2sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTXTXzsMYn25r70r3h2lKgQNud6UVWiN8GVRYfcfjqo=;
 b=UsKMJ9rCn13/N3H0FYlUFal2HMEQq2unElg/t2afkA9BWN4i0r5Pu1+b1MzcwIA+LCQ265wwbnSBCmU9OlnCnCD5LYmz1McRspJn9mP/zclIXZXavY+v6koP/TAJKgyCM4Ix5wjsaKo4ht8dqrwZ4Z2p5PNfSXq6ngU7cqBPSiM2OM5yka0AXi9yJVJeTfhPyC8ddSTBdqTaZJ3UtzBI/q4ngZEW9U60n4jeJQFW67BTLntrKCwqZU1s0PWnfYuFNII0cSrwudOxVrAeE1RoNfUqwi1c0GUEzfeMRxgoNXOAkO9hP033sZfgX0n/ycGTnj7e/d5r1xeu5EAB56Jmaw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB8246.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Thu, 13 Mar
 2025 08:53:29 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8534.025; Thu, 13 Mar 2025
 08:53:29 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 "airlied@redhat.com" <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "apw@canonical.com"
 <apw@canonical.com>, "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, Hector Martin <marcan@marcan.st>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: Re: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Thread-Topic: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Thread-Index: AQHbky3sGKkFjHx1MkmFN9rVUAvYHLNvYl0AgAAA5jqAAAKdAIAAAT1vgAA66ACAAD2b+IAAA9kAgADIeYCAABcugIAAAUrB
Date: Thu, 13 Mar 2025 08:53:28 +0000
Message-ID: <PN3PR01MB959780176C0B16C36FBD59C3B8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <ABAEA9D0-97CB-4ADD-9606-A12D5815335A@live.com>
 <376C9BD3-2F41-4511-BE52-1B8468FE2CB3@live.com>
 <b74df4b5-ecda-45ba-a98a-c84b0a29e380@suse.de>
 <PN3PR01MB9597AC6A02B0BF873920D94CB8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <9092a9ed-aecf-40bd-9d15-b53d60d035b5@suse.de>
 <PN3PR01MB959715C19BCEA54426D24934B8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <ff3a9c58-5c7a-4c48-8a9e-cc828a43baed@app.fastmail.com>
 <PN3PR01MB9597E5C609290DB1A967263CB8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9HgVn-XELC065w0@smile.fi.intel.com>
 <47AE7FCD-0F30-4379-ADE9-090A15ACD58F@live.com>
 <Z9Kb8zMJgmSP-rgD@smile.fi.intel.com>
In-Reply-To: <Z9Kb8zMJgmSP-rgD@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAZPR01MB8246:EE_
x-ms-office365-filtering-correlation-id: 86de093a-9282-40ef-cd10-08dd620c8655
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|461199028|6072599003|15080799006|8060799006|7092599003|8062599003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?elhiRnpFai9RLzJKamFUWFRFa1V6NFp5N1FxTWRsNTJrM1JlNkhFZHlJQUZv?=
 =?utf-8?B?ZEttanRhUU5HSEpGaEVxZWNMWWlVWFBYT2t3RVBEZU1ZYmQ3dVZJaHhYQ3R4?=
 =?utf-8?B?R3d4SVV3bFJXYWZhQ2lCR1lwMUJGVmZiTURGV2owbXJCQThkeVdRblNYQkQ4?=
 =?utf-8?B?UnVyb1A2VkRoR21zdnR4TERzK0lXS1JSc2Vqb1pYSEUzd2F6VHhFTkxtMXdK?=
 =?utf-8?B?eENuaml3UngwaGFWNkFENkltNGpDNWtWNnNsaThIa3JqV0haRCtYWXB0SjZu?=
 =?utf-8?B?K0IvVklRT1orQTZ5WndqZVZ4akF1SldSb2F6dWN0WE9HWXBVR1c2WksyUDZa?=
 =?utf-8?B?M0t6V1pyVG1OMjRmR1dybFdMT2p2VFZDTms4OHUrK0RPajhPTkhXSDZyUFZn?=
 =?utf-8?B?UzhOWjNNZkNvSUZwNFVxQ0RFVVU1ck9xbHBCaXMxdTRtVGZUVzFhZ2YzRmRE?=
 =?utf-8?B?blJwZjVzbWFtY3E4TVZtU2JQUHFWY0loTDg4bFFNZFNkWUFBMjBCM1Z2WlRL?=
 =?utf-8?B?Nm8xRHhGSUNTT29KYnBSRVJyV2J0bS9CWDZOakJLZVovWVZsMFp5OUZhNzNN?=
 =?utf-8?B?TDZnRTh6cGFnd25PRmdYQ0xZZXFjUW9hM3RPVVhJVUdMRUlRb3JzUG51c2RZ?=
 =?utf-8?B?WWEyeGxjckRlcC9tYmxjcW1CKzkzY29kc0ZtREV5dnFXcDRIY0hKaXdramla?=
 =?utf-8?B?akhKWFg2ZHE4ZmwybG84YkRCOURuL2NDUUhxZGZ0NTRMRHhsL3kzL3dYMzVX?=
 =?utf-8?B?ZHlxbzNZNXpYUlV3b0dyd3ZqbmY1UDAvWEZIeGFvNThQZExoaEVIY0hLa1Zp?=
 =?utf-8?B?Y3pEY0pVMHN0cUJlWFhlVUZUR3dlczFRNVRIOGY2NlRVRkxsMk5YNTIwNmVt?=
 =?utf-8?B?R1lvYTRIQ0ZCSlZGTVN2QS9nMVhUcXp0UXFPSDJKWWZTZjRpRXQyaXl0RU41?=
 =?utf-8?B?cjFRK3FNZWNNbm5hNkJzZHE1dW5ZWENyeHFGL21wSXBZQWtUQmUyVVd0eXVP?=
 =?utf-8?B?c0JPWHIxQUlQZjd0SGYxTW9UQXloRkY4UE1iTmVqU0htcU1KUlFiSnhBeGxQ?=
 =?utf-8?B?a3pDdXZZcUphVEtuVW4zQ3lWQWNKMHZxN3QrcEVqWVIzTllpVmRuVUpUa2Ew?=
 =?utf-8?B?YXpyYzJWUCtEaG9XLzMyUU5jMmdhVTJDb3dpcnA5YThTSEtCck9mYjNtdEl1?=
 =?utf-8?B?RHE0dDlLUjZsbWVOazMzVW5MYzZxWmI5YUx3Q1Z5aGppUWdtbGZGZU5YM0Jq?=
 =?utf-8?B?cHN6Z1ZMdXJFSExFeHpUZnpiQkI0c3lRd3VlM1VJODBBR3VZcFVJRUFIeVhh?=
 =?utf-8?B?UlZBeTNQaFVxTXFkeWtZRzcwWXUxdFNzdDcyUklreTh1U3ErQi9zZ0FTK29k?=
 =?utf-8?B?MU1ROElUbURRWlppcDk4WHl1bHlmVElZTUp5U0pQMjJGUDIxdk5GSnVYV2Ry?=
 =?utf-8?B?c1B6OUYvZC81UjVuZVhYdDJHVjZ3bGtYbXoxWENWcUJKdDRpMElJRTZ3ZDd6?=
 =?utf-8?Q?C+2NKk=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UU9MYm9jeXU3Nk9yeHpoSjJNTDRZdGtzb0kwQWN4NStLaUYxbGJDNGlJcHNJ?=
 =?utf-8?B?NVJqUGFGSzhVSy9sTWlOM3FGVTczVEt0K0N2YmtCVzJjOElIUENrQU05QU1i?=
 =?utf-8?B?RDVidXRDNVUrNmFKOEJLUmxWL0M4Zi9vcjFRTzlYZXEvUUM2K3Y5TEJ6U2ho?=
 =?utf-8?B?Y1N6MTFnMTZQZnZKWVBTQjlnMUd1cklzMS83OFRkblNYajZJalRPbXlsOWx4?=
 =?utf-8?B?dGFVQVVJYmk1RW4rVk1mUGJVdFhscVY4U29CSE5yQklZcHg5aHNUTmZZOGFN?=
 =?utf-8?B?YTd4dVZjUVludTY1Z0JzY2lvL0g5QlErZWQ5RjhsR0liTFdZVzVEVTlBVXpH?=
 =?utf-8?B?NzQzZ0F1OEVaMkJvdU9FWDA2MFFtTHg1MWp6cHRKTEF0ZHp6a29ybjJYdDhP?=
 =?utf-8?B?Q09qMG4xNU1qK0ErVWdxZ2diTnhPNmhkZXZ2b0NKTXdlYzlIZ3lXNHY4OWF2?=
 =?utf-8?B?anpROGcwTW83TTNkVXo1R3JSTGpHVkRNaWltcklYY3RPZk9QLzJIam9rRlV5?=
 =?utf-8?B?VjFSaDFTbG5CYXNwVDYxRTRNaVVNVFE0VDVOdzZ3a1F1SGs0a1BiYkl2b0Nw?=
 =?utf-8?B?RG9JalozR0tpUUJNNWNTWWl4clZFNk53SUE4aGV5UXAwdFZuRFVCZVQ4Q3Ji?=
 =?utf-8?B?NWVMYlNDdkg1R0x5dXdFdDN4WDBqU0Z6TUluUWVBNkhHRHRqM2FMaHZMYUxw?=
 =?utf-8?B?K3NsZmhrK0UvZjdMOEt4S3QwdEJETG5DOHJYallHZzJVSWpvTHNPU3JHMUNl?=
 =?utf-8?B?eXpueFQzeDJDUGhZM2t1bXFwcjUrZW9IcHg0Y0xQS3BXN0RNWGZsNTF0M2dH?=
 =?utf-8?B?S1BLcVpPZ1NGS3Rub0ZnMTBPaEtBRDB1QTgwSW85aDdFTTd2WGVxN2MzLzVH?=
 =?utf-8?B?T1VTSXA3Kzh4SUI3TitRa011Qjk2dlZ3MTBsTndLa0JNT3E2aDgyYVAxc3Y2?=
 =?utf-8?B?K1g0MFlLanA1cUZXOVJURExWTFlGanlxbHJrdVNqWU5CZ1A5a05PM2QvN0NB?=
 =?utf-8?B?VGNQclFqWFZyV3F0bk5MM1lwSXVCSnhuMWNNSEMvK2wzQ2VsS3BZTVVPbVYw?=
 =?utf-8?B?a0c0dW51Vm9BY3QwL1hwemtwejVQVGZnT05UR0dIb3pwQmNnOGVMWGFwVkU4?=
 =?utf-8?B?MVVncGo0UDJMVk1WUXpNREFOK1ZYYjR3eC96VXl2R1dEL1ZoaGFZTHFXZWRG?=
 =?utf-8?B?WkpVSzBaRm5Hejk0RC9nR0pwUFJvN0RQNGNhQnlId0hadTJ3TU95dTBVWStr?=
 =?utf-8?B?UzlWS0xBeGhmQ0VZaWVKZWg1aTZPdkNVT2Z6blN3cytpVmtJNlk3bnpqVFJV?=
 =?utf-8?B?NW94ek1ST29pT0MyYWVJQkRqR1JaM0FaZm56TE8yRjlXY0l1cFNQOVl5L3ZU?=
 =?utf-8?B?bk9vZUxqMnFERG04WEZHRnJoQUE2VFI1dmdWRWVoMUJzK3VRdGtQSUtsd1F2?=
 =?utf-8?B?SHVPZ25aKzM1WmMySWNuNkdJQlBsZkZCVk9ZM3g4YlR4dC8rYVM3UTQrZEM3?=
 =?utf-8?B?QmFKM2RvUGhXSU9jU0NqbVYvQ0RmcUZUVUc0VnN4MFYrajBNUEJQQnliYy9a?=
 =?utf-8?B?T21lVWo5ZUJtVkh3cG9sTjIyQnMrQkFEWFpYNDBUUVUwcWJmclVtUjBPbktG?=
 =?utf-8?Q?+swPhbtxXqHGQD3mns1qsXwa4X3v6pKGS+N19OTwfS/M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 86de093a-9282-40ef-cd10-08dd620c8655
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2025 08:53:28.8828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB8246
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

DQoNCj4gT24gMTMgTWFyIDIwMjUsIGF0IDI6MTnigK9QTSwgQW5keSBTaGV2Y2hlbmtvIDxhbmRy
aXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KPiANCj4g77u/T24gVGh1LCBN
YXIgMTMsIDIwMjUgYXQgMDc6MjY6MDVBTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4+
IE9uIDEzIE1hciAyMDI1LCBhdCAxMjo1OOKAr0FNLCBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5z
aGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQo+Pj4gT24gV2VkLCBNYXIgMTIsIDIw
MjUgYXQgMDc6MTQ6MzZQTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4+PiBPbiAxMiBN
YXIgMjAyNSwgYXQgOTowNeKAr1BNLCBTdmVuIFBldGVyIDxzdmVuQHN2ZW5wZXRlci5kZXY+IHdy
b3RlOg0KPj4+Pj4gT24gV2VkLCBNYXIgMTIsIDIwMjUsIGF0IDEzOjAzLCBBZGl0eWEgR2FyZyB3
cm90ZToNCj4gDQo+IC4uLg0KPiANCj4+Pj4+IEkgZG9uJ3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9u
IGVpdGhlciB3YXk6IGZvciBTTUMgSSBqdXN0IG5lZWQgdG8gcHJpbnQNCj4+Pj4+IEZvdXJDQyBr
ZXlzIGZvciBkZWJ1Z2dpbmcgLyBpbmZvcm1hdGlvbiBpbiBhIGZldyBwbGFjZXMuDQo+Pj4+PiAN
Cj4+Pj4+IEknbSBwcmVwYXJpbmcgdGhlIFNNQyBkcml2ZXIgZm9yIHVwc3RyZWFtaW5nIGFnYWlu
IChhZnRlciBhIHR3byB5ZWFyIGRlbGF5IDotKCkNCj4+Pj4+IGFuZCB3YXMganVzdCBnb2luZyB0
byB1c2UgbWFjcm9zIHRvIHByaW50IHRoZSBTTUMgRm91ckNDIGtleXMgc2ltaWxhciB0bw0KPj4+
Pj4gRFJNX01PREVfRk1UL0RSTV9NT0RFX0FSRyBmb3Igbm93IHRvIGtlZXAgdGhlIHNlcmllcyBz
bWFsbGVyIGFuZCByZXZpc2l0DQo+Pj4+PiB0aGUgdG9waWMgbGF0ZXIuDQo+Pj4+PiANCj4+Pj4+
IFJpZ2h0IG5vdyBJIGhhdmUgdGhlc2UgaW4gbXkgbG9jYWwgdHJlZSAob25seSBjb21waWxlIHRl
c3RlZCBzbyBmYXIpOg0KPj4+Pj4gDQo+Pj4+PiAjZGVmaW5lIFNNQ19LRVlfRk1UICIlYyVjJWMl
YyAoMHglMDh4KSINCj4+Pj4+ICNkZWZpbmUgU01DX0tFWV9BUkcoaykgKGspPj4yNCwgKGspPj4x
NiwgKGspPj44LCAoayksIChrKQ0KPj4+PiANCj4+Pj4gVGhhdCBzZWVtcyB0byBiZSBhIG5pY2Ug
YWx0ZXJuYXRpdmUsIHdoaWNoIEkgZ3Vlc3MgVGhvbWFzIHdhcyBhbHNvIHN1Z2dlc3RpbmcuDQo+
Pj4gDQo+Pj4gSSBkb24ndCB0aGluayBpdCdzICJuaWNlIi4gRWFjaCBvZiB0aGUgYXBwcm9hY2hl
cyBoYXMgcHJvcyBhbmQgY29ucy4NCj4+PiBZb3UgY2FuIHN0YXJ0IGZyb20gYmxvYXQtby1tZXRl
ciBoZXJlIGFuZCBjb21wYXJlIGl0IHdpdGggeW91ciAlcCBleHRlbnNpb24uDQo+Pj4gDQo+Pj4g
QWxzbywgY2FuIHlvdSBzaG93IHRoZSBibG9hdC1vLW1ldGVyIG91dHB1dCBmb3IgdGhlIHZzcHJp
bnRmLmM/DQo+PiANCj4+IEhlcmUgYXJlIHlvdXIgb3V0cHV0czoNCj4gDQo+IFRoYW5rIHlvdSEN
Cj4gDQo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+IEZvciBhcHBsZXRiZHJtOg0KPj4gDQo+PiBhZGl0eWFA
TWFjQm9vazp+L2xpbnV4JCAuL3NjcmlwdHMvYmxvYXQtby1tZXRlciAkUDQgJE1BQ1JPDQo+PiBh
ZGQvcmVtb3ZlOiAwLzAgZ3Jvdy9zaHJpbms6IDEvMSB1cC9kb3duOiA2NC8tMTkgKDQ1KQ0KPj4g
RnVuY3Rpb24gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb2xkICAgICBuZXcg
ICBkZWx0YQ0KPj4gYXBwbGV0YmRybV9yZWFkX3Jlc3BvbnNlICAgICAgICAgICAgICAgICAgICAg
Mzk1ICAgICA0NTkgICAgICs2NA0KPj4gYXBwbGV0YmRybV9wcm9iZSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAxNzg2ICAgIDE3NjcgICAgIC0xOQ0KPj4gVG90YWw6IEJlZm9yZT0xMzQxOCwg
QWZ0ZXI9MTM0NjMsIGNoZyArMC4zNCUNCj4gDQo+IFRoaXMgaXMgZW5vdWdoLCBubyBuZWVkIHRv
IHJlcGVhdCB0aGlzIGZvciBldmVyeSBwYXJhbWV0ZXIuDQo+IA0KPj4gLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
PiBGb3IgdnNwcmludGY6DQo+PiANCj4+IGFkaXR5YUBNYWNCb29rOn4vbGludXgkIC4vc2NyaXB0
cy9ibG9hdC1vLW1ldGVyICRPTEQgJE5FVw0KPj4gYWRkL3JlbW92ZTogMC8wIGdyb3cvc2hyaW5r
OiAxLzAgdXAvZG93bjogMjIwLzAgKDIyMCkNCj4+IEZ1bmN0aW9uICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG9sZCAgICAgbmV3ICAgZGVsdGENCj4+IGZvdXJjY19zdHJpbmcg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDQ3OSAgICAgNjk5ICAgICsyMjANCj4+IFRv
dGFsOiBCZWZvcmU9MjY0NTQsIEFmdGVyPTI2Njc0LCBjaGcgKzAuODMlDQo+IA0KPiBTbywgd2Ug
Z2V0ICsyMjAgYnl0ZXMgdnMgKzQzIGJ5dGVzLiBJdCBtZWFucyBpZiB3ZSBmb3VuZCA1KyB1c2Vy
cywgaXQgd29ydGgNCj4gZG9pbmcuDQo+IA0KDQpXaWxsIGl0IGFsc28gZGVwZW5kIHVwb24gdGhl
IG51bWJlciBvZiB0aW1lcyBpdCdzIGJlaW5nIHVzZWQ/IEluIGFwcGxldGJkcm0sIGl0IGlzIGJl
aW5nIHVzZWQgMyB0aW1lcy4gUHJvYmFibHkgbW9yZSBpbiBBc2FoaSBTTUMuDQo+Pj4+PiB3aGlj
aCBhcmUgdGhlbiB1c2VkIGxpa2UgdGhpczoNCj4+Pj4+IA0KPj4+Pj4gZGV2X2luZm8oZGV2LA0K
Pj4+Pj4gICAgICJJbml0aWFsaXplZCAoJWQga2V5cyAiIFNNQ19LRVlfRk1UICIgLi4gIiBTTUNf
S0VZX0ZNVCAiKVxuIiwNCj4+Pj4+ICAgICAgc21jLT5rZXlfY291bnQsIFNNQ19LRVlfQVJHKHNt
Yy0+Zmlyc3Rfa2V5KSwNCj4+Pj4+ICAgICAgU01DX0tFWV9BUkcoc21jLT5sYXN0X2tleSkpOw0K
PiANCj4gLS0NCj4gV2l0aCBCZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0KPiANCj4g
DQo=
