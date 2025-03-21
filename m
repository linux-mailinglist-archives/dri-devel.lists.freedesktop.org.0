Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1371BA6BBBC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 14:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5236010E7CE;
	Fri, 21 Mar 2025 13:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="nELFsQzi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010010.outbound.protection.outlook.com
 [52.103.67.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4EB10E7CE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 13:29:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8pq9gwdNz6uuhuQYRCGHP7l2mgaZduW9tbDL9w5Qj3Ybg45NB1mSy+68RS41E9sO60O9Dc4LtUwom++u3it67rbVWJYQYeEZ2rHxeHGnoEF4p0j8icGlpMonm6XDh/QPA8yWw2wT8jYi+Y3qnavjOSnn5Nk3Q9JBqFgtgOAvVz/7icWLjWSAdYRTKv092T5+k/ZElEpmO5k4RuwGVToNRqK3D7QhLcAU6qQLtHgBjI2t+LDQk0f0Ts1YQi47iR67YAbcKsOg8kMK7yh7CLEb9hbodlwXqUxVzm6w2/v6KGn/gNXthIDDv+DvZA24a73RBpnV2UdBM/nV2hBVLx7tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuy4RP3joNoeZGiFgzDd9J1gJb2roJX7ZIOwztdaogs=;
 b=qRafnGEeOS2bLf0L23/pZhg0FYMJvjbmiqAaOw495/NcNln54pw6qm/JfQd+wvmSDlgpJ5qZMNlpBS6dLI8JWK77mFIgFtGsUDWmbJde4URUwvibzQbPyvg7GnQJSwgNRV7Z8F/pbuo01FWYoj2B9v0RGPDx+QF6LsCcZ1yc1cLI6oiPCrtdaA2B3DGwbHcKlfiW80oQzBCeWqRWO4l+VoANtIErNTKB/3v/8YCfRQ1FpbZ/8LxC4Igf6nVPhNmrwNw7jTHcDrcErUsGLisvzqKdb8b48pAB3DrAEPpzq29seDpCvcn+JGB5GHB8w6EI0CtCFIv6lhx+6UWKJyeOHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuy4RP3joNoeZGiFgzDd9J1gJb2roJX7ZIOwztdaogs=;
 b=nELFsQziT6KIMRc8tWpiwNQ7hS2c+lkJLLaFKaFN9gSM0MJEHJ5yYZSTAe9oQDT2lyQydIbaIVPniu8yq5W2ZGCXOsvxztrgy3vD8OMYD2kBJCBy32/F0CNSBGY2AXIY7NStl9CWF3mFwptstW0rKGtwMrSXSn0JOaif39wrix2QJe2nPOcWOUsiSLLpaeLauqjDiwVEU0O1CA1NfRfcQvG0TIO1Nn9MeMU4nz6uZ6HZ43UQhT/S1PYXjp0KpG7Ky4IrX8tv1QiN5Mbf7jlAm1L+fgrNCgNHWFHSQonnl6sbRcT5kCrLGWpkoaY1InQizcMbceYX+qWAhZR9F1GE/w==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB9941.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:12e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 13:29:39 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 13:29:39 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Petr Mladek <pmladek@suse.com>, "keescook@chromium.org"
 <keescook@chromium.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 "airlied@redhat.com" <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>, "joe@perches.com" <joe@perches.com>, 
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Hector Martin
 <marcan@marcan.st>, "asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: Re: [PATCH v2 0/2] Use proper printk format in appletbdrm
Thread-Topic: [PATCH v2 0/2] Use proper printk format in appletbdrm
Thread-Index: AQHblAmmezBHRL40SE21b3aYfs9dEbN9ooMz
Date: Fri, 21 Mar 2025 13:29:39 +0000
Message-ID: <PN3PR01MB9597F9BAC81A6FB84D25E8EAB8DB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <F61E0F31-980B-4855-9AA8-D594BEEFEC6F@live.com>
In-Reply-To: <F61E0F31-980B-4855-9AA8-D594BEEFEC6F@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PR01MB9941:EE_
x-ms-office365-filtering-correlation-id: de1925a9-522b-4b54-33d7-08dd687c6ea7
x-microsoft-antispam: BCL:0;
 ARA:14566002|7092599003|6072599003|8060799006|19110799003|461199028|8062599003|15080799006|1602099012|10035399004|440099028|4302099013|3412199025|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?dmJLdHVMbGh1WVBNanIrM0paa2ZMSzkvdmtPa2VvOGRLQUpOVStIZUZmNkdD?=
 =?utf-8?B?SEk5cUZ0RmZqR0tFQ3pEeHZvV3A2dGp6WHloT1IxQTh5UW9NWFRNMWdCSVNn?=
 =?utf-8?B?VWt6Um5Wd3NMS0IwSXdaVGJTaEtvcGVwd1FEMmVDQnhla3lXYXdDdE5qRWtm?=
 =?utf-8?B?dHJzdVE1cE1HUmZ1emJCT3JqNDM1UWI4Nm9kTEZERTFCQmFwdjdWYnIwVWdh?=
 =?utf-8?B?L1V6cmVTMTlWOEwzdnc4b2VWMW94aEhPVHg1dTVRa0pzTVhOaHVGajRWUmhU?=
 =?utf-8?B?UG1FaDJMWHB5OXpPeURIa2hIdThkaVM3bFcwNWEvZ0pqYXZsUkpqcGczWDdk?=
 =?utf-8?B?NTRuSWVNa0hhejl1OVFIWmhjYWFhZjBXNk8xMXhtdEI3U2ljcEtHSmt4M3Fx?=
 =?utf-8?B?UWxhVW9XVURrV3dSK2VOSU5RVkJIckRKYU9LVUlTRDcvb1UyeWpOdU16R2Vo?=
 =?utf-8?B?MGRRamtiWVd0OTJVTnBveDF0aXBSbU1ndzZCb3hnMk1DVkp0SHJSWWxLeDRG?=
 =?utf-8?B?K3JZQ2ppUUdSTy9KS29acktObTFzTUdtSHVxVUc1b2pFVmlMbGsrdnNoMHpM?=
 =?utf-8?B?NEZEM0VYa25SUVlBL0djNzdLQlNYRXpEV0w5djdJUDV5cmZOZGs0T1hyd3k3?=
 =?utf-8?B?NFF5d0VIczVQTEZDU0FtVCt2YksrdmZ4TXkxZGYyVEdLQmVBWDJQNS9MVmt5?=
 =?utf-8?B?WHY4Ui9rWllGNGhEeGtVVmxnMUFTZWk0N1BCVlVZRUQ2WjVSSlJxcTRlcERI?=
 =?utf-8?B?MlZ4bFNYUUdablNkQnJBOTFNcW1uOFJLWm1QZlVIM2g5cE5XaEd1S3NsM3pZ?=
 =?utf-8?B?cTBNdVdjcWhOM0RoVFo3cktqNXJBTGgxQlo1N3o1bkc3WXRzRzBPd3M3Tm9l?=
 =?utf-8?B?ajBMV21BZEYxSFNLRUdFVGQwOUM5VHJXV2dtWkhpUUFoU013eHpMMVZzbEJi?=
 =?utf-8?B?REhBQys0WXFXVTBzejdudll3b3p3bnd4eHkrV2g5Y0wvSno0V0plV25QK3BJ?=
 =?utf-8?B?cGlnM3d2M1gzTlozckJVK3ZJVVdON3RTUVpCQXlabGVMdGV1dHZBUkhWR3NG?=
 =?utf-8?B?dUZqSFBHNk0xSmRoczZ2Q1I3dFkyeU1LNHBhSnM4Wmkwam9QNmxsV00rN1dv?=
 =?utf-8?B?TU44S3FoUktWTUlJOVRHN2pNbGFBNXd2TEFnMXJrT1dFK2lMYWVkR2FlemtN?=
 =?utf-8?B?QTZNblhBSytmaEVEUWdGZzBSY0E4MGxFVlJ0WnEzTUZ2K1pDN0tTWXY4djEv?=
 =?utf-8?B?LzN3d2p1cnJGYUwyRDZsL2dWalA3aVQvT1hJRVdPV0JYYlFqb3dlSnJkNGdl?=
 =?utf-8?B?L2cyWDU0WkFMT0t2eGNINzFMWnhkWkVaeHRMaCt5akdBdWVNdzNINDBGZkhq?=
 =?utf-8?B?dVBVczE1UG9UTGpXOHhIdzhhSThJZm8wK0gwUkN3d0Z5cWRKRGdRcUpKdGdS?=
 =?utf-8?B?WnMzVE1KTDdSZXJVZDI3K0EyTGsrd3d4TXhBZmdVRDRnZTBxeEt4N3NxRkxC?=
 =?utf-8?B?SUdVL04yZGhLOWxZcS9oci9VTXR1bytWaUx6LzIrK3M2U3NYSEJSUVVpZ0da?=
 =?utf-8?B?Y3Rad3dlNkNNMk13OFdqOE9BaTNYd0t2cWZxUkEwU3ByWU5iU1dXRi81RXZ6?=
 =?utf-8?B?anlPRWZQSk5yUzJIWHg0MUJUenJOTnhaMVFUbThzSFdhZmZDbDlURy9DZ0Nm?=
 =?utf-8?B?MUpvUVJvNEp3dE1jS0hLWXViQy9lakF4REFrV3RaaEkxbjZVdUI1ZVZuMXJz?=
 =?utf-8?Q?6q5nhGok+O/BESA3w/tc8RvLErtmCm9zdfiR8GB?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3QrTGRFTktJN2tMaEo1ZTJqUmFacWtDR0V6K2luNzFuanJMUEpIUUIyZFBV?=
 =?utf-8?B?V1pPaXNOKzZicUdKaWR6TjlUdTdMOWIwbGEzdFh0Wi9rK1BBQUxwUFdxUCtR?=
 =?utf-8?B?T2pZY1gvWXluTUxVeFhqWGpmd1pvQUR3d0pSeXI2aHpINmpMY0oxZ0lHWFpB?=
 =?utf-8?B?aUh6czRJTWFxVW43Z3N0d0hlV3FYNzRZTjBncUxrTUE3dEJuaU4wQ3JyL2Ja?=
 =?utf-8?B?UnFnVDE0MUdhTFNLS0oyM0hDSW8zbGh2UlFLSkJqaWE4WXZaSjMrZUhmakJI?=
 =?utf-8?B?bmNuWjNWMi9GSEdaMnhIbVN4RjVlVFh6RXJBZGxJVU4xTC9KeG5tdy9acm1p?=
 =?utf-8?B?TFdRS3BCSkdPYlpETmlKM1NOSElTenM1Z2NZWFZxSWtQUENDTDdIYmRJb1R1?=
 =?utf-8?B?ckgvbWxLSlllekFGdzJNUDFCZWJLeW50TWtmVVA3V0VIOWhHbnVXMGNBOFBH?=
 =?utf-8?B?dWdyaVB2RTZkcWlSOVd6ZjNZZ2t4NEVlb0dITXhDSm9ub0Z3dVNHeVAwcm1m?=
 =?utf-8?B?QkU4MWliRFZrNUZYcEpyNkh3S01tdy9DUDQ1RlRoTU5SNFBiVm9Sa2QybzY1?=
 =?utf-8?B?b3ZxQTRONlRvZUtxM0tna1JwMjE1bVo4dk9PcW0vWnZQcHMxYWd5VlUrNHE0?=
 =?utf-8?B?dnNORnBZakk3N2F5RlNjR3JmdExvYWpEYmU4VDNPRXYxMk5ZVDliQzRYc3ZG?=
 =?utf-8?B?NVJobElWMnNuSXNiTVhFeHp4TjJ4QjhlMnFMUS9TaUozcHo5M2xjdmVaTHFX?=
 =?utf-8?B?N2JHczR1VUhDemMxckdjbm5PTE9CbWhKM3BEbkI5NDl6dng1YVpIWU1OWENV?=
 =?utf-8?B?OU1kd2RmM3NwK2srU0R0a1h2YnI4QmVDSWZhWUIyRUYzOWxMclVIQ3Yvaklo?=
 =?utf-8?B?NGxKQ0ZKZlB0cEdnd0ZyU3NrTUk0d011TXJzUVJsZDRmREtRanZrTjZRMGYx?=
 =?utf-8?B?VDlRNEk3M1BCVVVsby9KY2NpNms4ZCtvbXY2aDBXZUJMd0tQeEZoQ2JDU0Z5?=
 =?utf-8?B?OC9Rb25wTXgva291MTU2TGNrclNCbFJFcXFIS0Q0V2ZRZGNmaVp3QzlHalBI?=
 =?utf-8?B?N3Y2SmtXcy83WS90WWcrR1lvQ0RBUFQzSXVXRVpwQ0VMMVdtelJWV2lyMDVz?=
 =?utf-8?B?RDFFOURKNnZlT1RXU3l3Wmdvdmdpc2dtYmJodWdaK1hqT2ltWXlmZUd6UFhj?=
 =?utf-8?B?azNjaUhIQWFoOWRnMld2Wk5vc1l6ODFNRVRJNFlQNWpWaUczYlRIeko1QkY1?=
 =?utf-8?B?WlhBbnV1Q29HcDBBTzQ3Q0c1V3VxbENrNTBNWU54ci9WdGo5Z0ZmS29KWTBi?=
 =?utf-8?B?eHhwc2hyZE5CWG9lZUFhekZ3NDhnSmwrREl2WkFGb2lsVzRYUU1mU3Znc2dz?=
 =?utf-8?B?RFlVOGhrTUtaYlgza2dvQ0hucFR0YmtaRlRjSUZwMW8zNDZ3TXRMTDRBVnJW?=
 =?utf-8?B?R0FyT2FKZkxxY1RPMWpwU1REVDlPUFoxbWtBNFNKTmlLc1FuWkhyZTBwMG52?=
 =?utf-8?B?V01JaFFsYVNyWVJHU3o3c0YwcThDOG5KalBxMUU2NUp2WVJ1L2pUOWc2eWxE?=
 =?utf-8?B?WXZoQjZoRzQ3UDVqdFZpZVNFaGVCSldkVkpCTzZLYzVmTkFnQk95QmJFeDNt?=
 =?utf-8?B?NmNZUW1rakpoY3hjQkNLV0NYOUJMYTdidWJCOW1tMFZsS0hqUURPc21uR1hn?=
 =?utf-8?B?d21nZnZMRm53OTE5Y0ZYYU9WTVcyNWlZYWRCU0lKU3JPMjdBNEZBRkh5b29L?=
 =?utf-8?Q?6dfK0O1HwFVY3fESNg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: de1925a9-522b-4b54-33d7-08dd687c6ea7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 13:29:39.7572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9941
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

SGkNCg0KPiBPbiAxMyBNYXIgMjAyNSwgYXQgNDo0OOKAr1BNLCBBZGl0eWEgR2FyZyA8Z2FyZ2Fk
aXR5YTA4QGxpdmUuY29tPiB3cm90ZToNCj4gDQo+IO+7v1RoZSB2c3ByaW50IHBhdGNoIHdhcyBv
cmlnaW5hbGx5IGJlaW5nIHNlbnQgYXMgYSBzZXBlcmF0ZSBwYXRjaCBbMV0sIGFuZA0KPiBJIHdh
cyB3YWl0aW5nIGl0IHRvIGJlIHRha2VuIHVwLiBCdXQgc2luY2UgNi4xNSBtZXJnZSB3aW5kb3cg
aXMgbmVhciwgYQ0KPiBwb3RlbnRpYWwgZGVsYXkgYmV0d2VlbiB0aGUgZHJtIGFuZCB2c3ByaW50
ZiBwYXRjaCBtaWdodCBtYWtlIHRoZSB2c3ByaW50DQo+IHBhdGNoIGFzIGFuIHVudXNlZCBhZGRp
dGlvbiBpbiA2LjE1LiBTbywgSSBhbSBzZW5kaW5nIGl0IHRvZ2V0aGVyLiBGcm9tDQo+IHdoYXQg
SSBoYXZlIG9ic2VydmVkIGluIExLTUwsIHZzcHJpbnRmIHBhdGNoZXMgYXJlIGJlaW5nIHByZWZl
cnJlZCB0byBiZQ0KPiB0YWtlbiB1cG9uIGJ5IHRyZWVzIHdoaWNoIGFyZSBhY3R1YWxseSB1c2lu
ZyB0aGVtLg0KPiANCj4gdjI6DQo+IFJlbW92ZSBwcmludGYgdGVzdHMsIHdpbGwgbWVyZ2UgbGF0
ZXIgdGhyb3VnaCBLZWVzJyB0cmVlDQo+IA0KPiBbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xrbWwvMUEwM0E1QjQtOTNBQy00MzA3LUFFNkEtNEE0QzRCN0U5NDcyQGxpdmUuY29tLw0KPiAN
Cj4gQWRpdHlhIEdhcmcgKDEpOg0KPiAgZHJtL2FwcGxldGJkcm06IHVzZSAlcDRjbCBpbnN0ZWFk
IG9mICVwNGNjDQo+IA0KPiBIZWN0b3IgTWFydGluICgxKToNCj4gIGxpYi92c3ByaW50ZjogQWRk
IHN1cHBvcnQgZm9yIGdlbmVyaWMgRm91ckNDcyBieSBleHRlbmRpbmcgJXA0Y2MNCj4gDQo+IERv
Y3VtZW50YXRpb24vY29yZS1hcGkvcHJpbnRrLWZvcm1hdHMucnN0IHwgMzIgKysrKysrKysrKysr
KysrKysrKysrDQo+IGRyaXZlcnMvZ3B1L2RybS90aW55L2FwcGxldGJkcm0uYyAgICAgICAgIHwg
IDQgKy0tDQo+IGxpYi92c3ByaW50Zi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMzUg
KysrKysrKysrKysrKysrKysrKy0tLS0NCj4gc2NyaXB0cy9jaGVja3BhdGNoLnBsICAgICAgICAg
ICAgICAgICAgICAgfCAgMiArLQ0KPiA0IGZpbGVzIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKyks
IDkgZGVsZXRpb25zKC0pDQoNCkNvdWxkIEkgaGF2ZSBhbiB1cGRhdGUgb24gdGhpcz8gTG9va3Mg
bGlrZSBmcmVlZGVza3RvcC5vcmcgaXMgYmFjayBidHcuDQo+IA0KPiAtLQ0KPiAyLjQ3LjENCj4g
DQo=
