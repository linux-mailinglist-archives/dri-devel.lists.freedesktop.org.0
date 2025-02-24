Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66347A42CAC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 20:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78B410E506;
	Mon, 24 Feb 2025 19:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="RfJzNcTv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazolkn19013076.outbound.protection.outlook.com
 [52.103.7.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEED10E4E3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 19:24:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DoU3mFhx61JCw5MkdiEemXePUf8ASLQZkYmSVjRyY8D9gIAbvQxx1tuC3x3ggz8vjAgUVjExjqDgLiZjnoVGBo7p8ekP2hPuxuD/evmrloxKxZPNehZhauakuRIkhY4LRcvMGUK/RruTjkXCTMtYpbWp8CpqHxF23czcTQptzRAwZ8Rn62HYFojTMfuGKW3kSpobRb/lXMGObFFrEPEIl8Cr/8cvGLQ+E0y85QYuPZldqKJrvr/XfvSUNZXMmz9euKNzQsB68G7vB4sode7FEK4IHv6wZa4LgGYHwu4aZJPYZ5A7CJngMc371EHY0yDI/ZnbYrOSNGnXj2SzoNkv5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQYTT/xRjjqTIk3oZo1ZlkeHyt9d0dup8KZ6TpD7t3I=;
 b=taueucEEG0j4EeRJjvNJ1PPnCgXzdjgnfVh73ask9O8jf7YSSG/e2f2+ay5B27Eralc7uxlOp607VCip+jMk0LnESsRm2TYFqqiM0DbzkStFRV5MnwB++VXlKvyu8hSp0FjtTroBi5xHxrhCPKEUR+nhUxnykSeEC+5XEM7p17D7hfFSImWxQ9vAFiCHFPURuEVwvtr1SsO1jHHlo0LO7DV7UpTqM5toYdXUCwXTr80btc2TEsBshZ8tL5eAUXpLf9fQMobLI7d3uSjnRecovO12vmEh0aFCwsj6uPHEcvqSq+UekNwL4qfsUMFjXUBAJPKA7IxBtynMDDaTm7WplQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQYTT/xRjjqTIk3oZo1ZlkeHyt9d0dup8KZ6TpD7t3I=;
 b=RfJzNcTvQYtUelIdryVekbkfC10HcWcuuimr3yUZIIS6DOhId278qM9/+dYLeuql+aMbJ7F3chXBV8Ky04vWJ44gkftZnjiVg62pH9K46RcFAdkXqSObuTEa8mPYiTfZt5Rvl1PB15ztY/nDAPGQiRcU71c84IMU3q2FOF+Z7FHuzFZmVOPRuvcx2NJLNeURkUe5ttHux69XR4hg4QfQCJGxj1O/fJwXLoQow8G7pMVHhJgWW+2IDetFnhyQMz/50hO1IBNwNw0B+4vGns33+hXujA8Qa02o6qPi9NisMs+5cA9c5D2twlui6XMBWUu/cHAXOXoqi0osSoau+LjutA==
Received: from BN7PR02MB4148.namprd02.prod.outlook.com (2603:10b6:406:f6::17)
 by CH2PR02MB6646.namprd02.prod.outlook.com (2603:10b6:610:a4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Mon, 24 Feb
 2025 19:24:49 +0000
Received: from BN7PR02MB4148.namprd02.prod.outlook.com
 ([fe80::1c3a:f677:7a85:4911]) by BN7PR02MB4148.namprd02.prod.outlook.com
 ([fe80::1c3a:f677:7a85:4911%4]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 19:24:49 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
CC: "kys@microsoft.com" <kys@microsoft.com>, "haiyangz@microsoft.com"
 <haiyangz@microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>, "deller@gmx.de" <deller@gmx.de>, 
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ssengar@microsoft.com" <ssengar@microsoft.com>
Subject: RE: [PATCH] fbdev: hyperv_fb: Allow graceful removal of framebuffer
Thread-Topic: [PATCH] fbdev: hyperv_fb: Allow graceful removal of framebuffer
Thread-Index: AQHbf4rly0L2XRweZkiIboVOb0veYbNN636ggAWzc4CAAC5VwIABLMSAgACuCkCAANktAIAAYqBQ
Date: Mon, 24 Feb 2025 19:24:49 +0000
Message-ID: <BN7PR02MB4148C95E563FE49E2652D1F4D4C02@BN7PR02MB4148.namprd02.prod.outlook.com>
References: <1739611240-9512-1-git-send-email-ssengar@linux.microsoft.com>
 <SN6PR02MB4157813782C1D9E6D1225582D4C52@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20250222172715.GA28061@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <SN6PR02MB4157F6CF7CACF45C398933C4D4C62@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20250223140933.GA16428@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <SN6PR02MB41571ED5CEA6B91A7F35AC3FD4C02@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20250224132946.GA7039@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
In-Reply-To: <20250224132946.GA7039@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR02MB4148:EE_|CH2PR02MB6646:EE_
x-ms-office365-filtering-correlation-id: b9adf16f-fc8d-4a84-d860-08dd5508e7eb
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|8060799006|15080799006|8062599003|461199028|440099028|3412199025|102099032|41001999003;
x-microsoft-antispam-message-info: =?utf-8?B?SWFSOGFiTmhwR2pkUXY1amt2ZWtSclFydXBsWFFzNUZJY0cydzRGbTFQMm0v?=
 =?utf-8?B?WnpFdVJvamxIdU0vcTFkUUVmekwrakZqWnJCbWp2eGxEYnJKYzhxa040Smpj?=
 =?utf-8?B?di8vaUJwZlphQThWbFU1VHJoSnBLZnFUZk1XdkVLbUtMb09MZFB1TXBBL3o4?=
 =?utf-8?B?ZUFrcE1OWHNzNGhTNlJRaWRTSy9FU3NjZkNGLzNpc2pRWCtEQVB2WlBLVXRG?=
 =?utf-8?B?Zzc1ZEQrWVRtOWd0MXJqUEdaeGFsKzZXYU1oUUNvb2xlT1JnWnVieWg4V2R6?=
 =?utf-8?B?ZExxZElFV05VMlpkYTJlekJmOHNtTGYxTXVkMGoxTXVIU3ZMR0k0cGNsRWFY?=
 =?utf-8?B?N0xUQnBZU2hPbXhCYjBnMGpwQm85K01zYTlGYUxLc2NJMGx3bXFlUG90WUhN?=
 =?utf-8?B?NmFJaUJkUkhIaXRVaCsvODhCclVOaGxDamg0Ym16UnFGR3R4dncyZlJ3SEpM?=
 =?utf-8?B?RUs0MjkxSGdKWTlBOCs0aG10dHJOT2NIL1BKSm05Z1YxanZrWmRkK0lpemlr?=
 =?utf-8?B?bHVZbkllQURUaUE5T05UWWM2KzJKQmoybjB0aGoyTFZkZ1dyQlVZa3IyWTJR?=
 =?utf-8?B?VW1nUlUvS0J6K3VHcEJiVTR5TThvb1ZJYWNoRldyT3hvc3ZhWGk1cFMzdzVz?=
 =?utf-8?B?TzhmMlgwdzhJUXcrTi9pcHRTWlVQUUxpVXlOUFF0RHRodjA5a0VYZkpnSFpy?=
 =?utf-8?B?aDRlcWlkczVCbmhYRU5ieGFSRmJjaE84bzRMQ2NKUHhmWTFDejVjZi90UkRU?=
 =?utf-8?B?TmFFRFFFZndQR21uNytwYnI0WG15RVFhQWRxSG9RYi9TRmUxdzhoVlZ3NkxS?=
 =?utf-8?B?MkNvTEJYaXRKUkROM0ZYQXFCNE1uTmlPZzQzZjBKaCsrSHc0b210dGxHejF6?=
 =?utf-8?B?V2ZCOGd4Nk1YME9KN2FncjBNQlVkS3N5RVJ6YStyengyTHNvTCtSREVXRlVB?=
 =?utf-8?B?TU5aVC9SckdwT1l3STA4QUYyNEhvblJsRWJjQXNJY2xHdDNHWmx6WlBmTDFE?=
 =?utf-8?B?QURHYXU4dDVuWkQwcDhPSlZWREVhTVBINk5nSlJDdytTMEMrTUNNaU81S3FU?=
 =?utf-8?B?RHQ1TFJMV1R1OVZLR3dhM2M3dy9CcXZSTnNZd0tmSTFKYUNicVlwS08yTkkz?=
 =?utf-8?B?aEZrc3ZQT25DOVBDb3UrK2EyeDNGcVZJeGxuRnJGbXY4K1FHUXNyZGowTzBz?=
 =?utf-8?B?ZlJUK3dMZ2NTaVNCWUpUZVRrdFZKZ25GWDV4OS9YWXVvTEhTQit6dXI5MjFn?=
 =?utf-8?B?YURFVk16NVBYdkZwQ2I1Yk5mT0lqbGthYThTbFdoZmVvSTNKQm1JYXVZUEZm?=
 =?utf-8?B?Qzh0cnJKV0t3bEU1OFpWZ2FoT3JmdkFVR3RnTGc1UDJYSzYvbXBBa0g1Z1Fm?=
 =?utf-8?B?Zit1Z01XcW5PbUlFSVh0TkJWLy9pSDFrcmhxb1RPZ0k4R3BGWUJ4dFRuNmZa?=
 =?utf-8?B?K2ZMM1FaVGVSWmlMZ0FsVjhraHBqanlyVHFzZkRRPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3dmV05FVnRQNC9PSXRvakQrdFVtbGRHelpENlQxZDNldUY1cndXSmJlelly?=
 =?utf-8?B?Snp6YWh3Vi9hTHhUcklTd3B0NVUzS2VPSU12eDVOMXR1ZmFvQ2tiMmdBVkt5?=
 =?utf-8?B?dHgxVUVWMHRWd210M0ZrZlBEcEtsV1dQVUoxMXEwV0xsbjlzRlRDeFduYkdT?=
 =?utf-8?B?RldpVDc5UTdrbzJMeENPS0c5Uy9yeGRGWnZVUFZxc3NoeDFUeG9YMWlNbkt0?=
 =?utf-8?B?UTJrVXh5cEFmQlB3eGZRditkVnp4bkttVkhBR25NSE9Yd0MxU1c0Z2RwVkVw?=
 =?utf-8?B?WlhERG0yRlMwZE10YXRVKzVhZlhJcGxvVDBHd2xWeTRxNVZjb3JScnNRNkVz?=
 =?utf-8?B?M2tUNXJEWndaYVB2WndwR2RXR1FLSFIvN3pQcXVpUXVyc3B4Q0h0NlBLcEw2?=
 =?utf-8?B?RnRxbnZjY0lNbkdCSlVNWjJBbUhjTnFIU3VFVHRTSnJJWUVZQ1AvMk9GTktP?=
 =?utf-8?B?YWtrMnJ1ZTZQWE9OOTI2U0V6a1dSRlBIdXc2OFpya1VnM3BsNk5TQTdDSWg5?=
 =?utf-8?B?emlOT0tzQThTbXZYTms2dWx2MXU2Smt2MXlhNFZHdmI1Z3kyK0hKY1VWSmdi?=
 =?utf-8?B?V0hIR2c3U0RkaWl4RHh2QmFIR250K01DQjJMNzZ5ajB3MjBNMGNKaXFoRzBm?=
 =?utf-8?B?SnVrVEw4SmorSDRPRXduTGt5Qnp6L3BzZjRGSStrYzVTenl3bzNlczkwbE81?=
 =?utf-8?B?K0ZOYkZrYTB6ZlpEZkhGSWVNK01ZL1BqTklGNjQwclpVRXB0WDBZenRYSnp5?=
 =?utf-8?B?N3Z3cEQ0Mko0b3c2WDV0WjBRZVY2VEhRMXNFNTdvOG5mNHQvZjR5cVp6Mklr?=
 =?utf-8?B?V1FKNnBjWE9sZUV0bVVaaURhRFphNkVqc2dzSDFMUU15cEJOWGFjLzBtVFVy?=
 =?utf-8?B?ZmNQalZYYm5LM0Z0aTRLVkFaZUNxcU9vN2xkUnNQWXBvNlFKSFB4RFMrcnRy?=
 =?utf-8?B?TGNxQTFWM1Z5WGxHSU0xMms3d3ZKVkxNY21XUVVDcDY0NDRla1llcDlCa2hQ?=
 =?utf-8?B?NjRVa1ZXSk5rQ0lkaDUxYmFUTTErb0VCSGkrU1BPeWRBbEp5elJqeTJTTEhP?=
 =?utf-8?B?MUxoQ1dQdzJ1dWhBNWx0ZFFDWWV6N1JlMkhycE5BYzZ1VWZKRVBSVlRXREJk?=
 =?utf-8?B?Y2dEYnhrRGFTeDF4WHZrNEJKRmRQdWc1b1BNaUlMQm5DT3JObzNTekVXYW9v?=
 =?utf-8?B?YjZmZmgvS0FvblFPUnE2OVhCdEVPendPUVJWSDZsUTRVbTYrdGNpSzlZd3dH?=
 =?utf-8?B?dDhUc2hyVFR5SnBzMUlSL0MwTTI3dXZkTUhPREVxTTBBc1hLSWdMWmRWcWdz?=
 =?utf-8?B?aFg4LzlLMlBrMWp5UnhUZDRJNzRXaE0rTitJcUlDUmVaYnpzbHlrUzMzRGdV?=
 =?utf-8?B?U09wajVBcGIxZitpKzFVUGgramFLUXVxVkpnSy9kTzlaUG5tMjEwT3FiNzMy?=
 =?utf-8?B?MHEvVlNDeU5rSkhJZTliVkF3L2ptamlrcnhMbzBLYWhnQ1I3MHBMbnE3RTVF?=
 =?utf-8?B?MStMcUxQRWRsNmF6N2h5OFhqR2E5d0hoNjFLRE9nMGYxSCs0ekVCcHJMN3lU?=
 =?utf-8?B?cU9kemlmempvK2pZTW9LOXRyc1JnQlJyZUk3Mi8yMGZGZk9ZY2kydzVudFBI?=
 =?utf-8?Q?83iqaGi04Eubf/qoSVzXK2Yu6W6LUNj6onM34KNaVNB4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b9adf16f-fc8d-4a84-d860-08dd5508e7eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 19:24:49.5368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6646
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

RnJvbTogU2F1cmFiaCBTaW5naCBTZW5nYXIgPHNzZW5nYXJAbGludXgubWljcm9zb2Z0LmNvbT4g
U2VudDogTW9uZGF5LCBGZWJydWFyeSAyNCwgMjAyNSA1OjMwIEFNDQo+IA0KPiBPbiBNb24sIEZl
YiAyNCwgMjAyNSBhdCAxMjozODoyMkFNICswMDAwLCBNaWNoYWVsIEtlbGxleSB3cm90ZToNCj4g
PiBGcm9tOiBTYXVyYWJoIFNpbmdoIFNlbmdhciA8c3NlbmdhckBsaW51eC5taWNyb3NvZnQuY29t
PiBTZW50OiBTdW5kYXksIEZlYnJ1YXJ5IDIzLCAyMDI1IDY6MTAgQU0NCj4gPiA+DQo+ID4gPiBP
biBTYXQsIEZlYiAyMiwgMjAyNSBhdCAwODoxNjo1M1BNICswMDAwLCBNaWNoYWVsIEtlbGxleSB3
cm90ZToNCj4gPiA+ID4gRnJvbTogU2F1cmFiaCBTaW5naCBTZW5nYXIgPHNzZW5nYXJAbGludXgu
bWljcm9zb2Z0LmNvbT4gU2VudDogU2F0dXJkYXksIEZlYnJ1YXJ5IDIyLCAyMDI1IDk6MjcgQU0N
Cj4gPiA+ID4gPg0KPiA+DQo+ID4gW2FuaXBdDQo+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEkg
aGFkIGNvbnNpZGVyZWQgbW92aW5nIHRoZSBlbnRpcmUgYGh2ZmJfcHV0bWVtKClgIGZ1bmN0aW9u
IHRvIGBkZXN0cm95YCwNCj4gPiA+ID4gPiBidXQgSSB3YXMgaGVzaXRhbnQgZm9yIHR3byByZWFz
b25zOg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gICAxLiBJIHdhc27igJl0IGF3YXJlIG9mIGFueSBz
Y2VuYXJpbyB3aGVyZSB0aGlzIHdvdWxkIGJlIHVzZWZ1bC4gSG93ZXZlciwNCj4gPiA+ID4gPiAg
ICAgIHlvdXIgZXhwbGFuYXRpb24gaGFzIGNvbnZpbmNlZCBtZSB0aGF0IGl0IGlzIG5lY2Vzc2Fy
eS4NCj4gPiA+ID4gPiAgIDIuIGBodmZiX3JlbGVhc2VfcGh5bWVtKClgIHJlbGllcyBvbiB0aGUg
YGhkZXZgIHBvaW50ZXIsIHdoaWNoIHJlcXVpcmVzDQo+ID4gPiA+ID4gICAgICBtdWx0aXBsZSBg
Y29udGFpbmVyX29mYCBvcGVyYXRpb25zIHRvIGRlcml2ZSBpdCBmcm9tIHRoZSBgaW5mb2AgcG9p
bnRlci4NCj4gPiA+ID4gPiAgICAgIEkgd2FzIHVuc3VyZSBpZiB0aGUgY29tcGxleGl0eSB3YXMg
anVzdGlmaWVkLCBidXQgaXQgc2VlbXMgd29ydGh3aGlsZSBub3cuDQo+ID4gPiA+ID4NCj4gPiA+
ID4gPiBJIHdpbGwgbW92ZSBgaHZmYl9wdXRtZW0oKWAgdG8gdGhlIGBkZXN0cm95YCBmdW5jdGlv
biBpbiBWMiwgYW5kIEkgaG9wZSB0aGlzDQo+ID4gPiA+ID4gd2lsbCBhZGRyZXNzIGFsbCB0aGUg
Y2FzZXMgeW91IG1lbnRpb25lZC4NCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBZZXMsIHRo
YXQncyB3aGF0IEkgZXhwZWN0IG5lZWRzIHRvIGhhcHBlbiwgdGhvdWdoIEkgaGF2ZW4ndCBsb29r
ZWQgYXQgdGhlDQo+ID4gPiA+IGRldGFpbHMgb2YgbWFraW5nIHN1cmUgYWxsIHRoZSBuZWVkZWQg
ZGF0YSBzdHJ1Y3R1cmVzIGFyZSBzdGlsbCBhcm91bmQuIExpa2UNCj4gPiA+ID4geW91LCBJIGp1
c3QgaGFkIHRoaXMgc2Vuc2UgdGhhdCBodmZiX3B1dG1lbSgpIG1pZ2h0IG5lZWQgdG8gYmUgbW92
ZWQgYXMNCj4gPiA+ID4gd2VsbCwgc28gSSB0cmllZCB0byBwcm9kdWNlIGEgZmFpbHVyZSBzY2Vu
YXJpbyB0byBwcm92ZSBpdCwgd2hpY2ggdHVybmVkIG91dA0KPiA+ID4gPiB0byBiZSBlYXN5Lg0K
PiA+ID4gPg0KPiA+ID4gPiBNaWNoYWVsDQo+ID4gPg0KPiA+ID4gSSB3aWxsIGFkZCB0aGlzIGlu
IFYyIGFzIHdlbGwuIEJ1dCBJIGhhdmUgZm91bmQgYW4gYW5vdGhlciBpc3N1ZSB3aGljaCBpcw0K
PiA+ID4gbm90IHZlcnkgZnJlcXVlbnQuDQo+ID4gPg0KPiA+ID4NCj4gPiA+IFsgIDE3Ni41NjIx
NTNdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0KPiA+ID4gWyAgMTc2LjU2
MjE1OV0gZmIwOiBmYl9XQVJOX09OX09OQ0UocGFnZXJlZi0+cGFnZSAhPSBwYWdlKQ0KPiA+ID4g
WyAgMTc2LjU2MjE3Nl0gV0FSTklORzogQ1BVOiA1MCBQSUQ6IDE1MjIgYXQgZHJpdmVycy92aWRl
by9mYmRldi9jb3JlL2ZiX2RlZmlvLmM6NjcNCj4gPiA+IGZiX2RlZmVycmVkX2lvX21rd3JpdGUr
MHgyMTUvMHgyODANCj4gPiA+DQo+ID4gPiA8c25pcD4NCj4gPiA+DQo+ID4gPiBbICAxNzYuNTYy
MjU4XSBDYWxsIFRyYWNlOg0KPiA+ID4gWyAgMTc2LjU2MjI2MF0gIDxUQVNLPg0KPiA+ID4gWyAg
MTc2LjU2MjI2M10gID8gc2hvd19yZWdzKzB4NmMvMHg4MA0KPiA+ID4gWyAgMTc2LjU2MjI2OV0g
ID8gX193YXJuKzB4OGQvMHgxNTANCj4gPiA+IFsgIDE3Ni41NjIyNzNdICA/IGZiX2RlZmVycmVk
X2lvX21rd3JpdGUrMHgyMTUvMHgyODANCj4gPiA+IFsgIDE3Ni41NjIyNzVdICA/IHJlcG9ydF9i
dWcrMHgxODIvMHgxYjANCj4gPiA+IFsgIDE3Ni41NjIyODBdICA/IGhhbmRsZV9idWcrMHgxMzMv
MHgxYTANCj4gPiA+IFsgIDE3Ni41NjIyODNdICA/IGV4Y19pbnZhbGlkX29wKzB4MTgvMHg4MA0K
PiA+ID4gWyAgMTc2LjU2MjI4NF0gID8gYXNtX2V4Y19pbnZhbGlkX29wKzB4MWIvMHgyMA0KPiA+
ID4gWyAgMTc2LjU2MjI4OV0gID8gZmJfZGVmZXJyZWRfaW9fbWt3cml0ZSsweDIxNS8weDI4MA0K
PiA+ID4gWyAgMTc2LjU2MjI5MV0gID8gZmJfZGVmZXJyZWRfaW9fbWt3cml0ZSsweDIxNS8weDI4
MA0KPiA+ID4gWyAgMTc2LjU2MjI5M10gIGRvX3BhZ2VfbWt3cml0ZSsweDRkLzB4YjANCj4gPiA+
IFsgIDE3Ni41NjIyOTZdICBkb193cF9wYWdlKzB4ZTgvMHhkNTANCj4gPiA+IFsgIDE3Ni41NjIz
MDBdICA/IF9fX3B0ZV9vZmZzZXRfbWFwKzB4MWMvMHgxYjANCj4gPiA+IFsgIDE3Ni41NjIzMDRd
ICBfX2hhbmRsZV9tbV9mYXVsdCsweGJlMS8weDEwZTANCj4gPiA+IFsgIDE3Ni41NjIzMDddICBo
YW5kbGVfbW1fZmF1bHQrMHgxN2YvMHgyZTANCj4gPiA+IFsgIDE3Ni41NjIzMDldICBkb191c2Vy
X2FkZHJfZmF1bHQrMHgyZDEvMHg4ZDANCj4gPiA+IFsgIDE3Ni41NjIzMTRdICBleGNfcGFnZV9m
YXVsdCsweDg1LzB4MWUwDQo+ID4gPiBbICAxNzYuNTYyMzE4XSAgYXNtX2V4Y19wYWdlX2ZhdWx0
KzB4MjcvMHgzMA0KPiA+ID4NCj4gPiA+IExvb2tzIHRoaXMgaXMgYmVjYXVzZSBkcml2ZXIgaXMg
dW5iaW5kIHN0aWxsIFhvcmcgaXMgdHJ5aW5nIHRvIHdyaXRlDQo+ID4gPiB0byBtZW1vcnkgd2hp
Y2ggaXMgY2F1c2luZyBzb21lIHBhZ2UgZmF1bHRzLiBJIGhhdmUgY29uZmlybWVkIFBJRCAxNTIy
DQo+ID4gPiBpcyBvZiBYb3JnLiBJIHRoaW5rIHRoaXMgaXMgYmVjYXVzZSB3ZSBuZWVkIHRvIGNh
bmNlbCB0aGUgZnJhbWVidWZmZXINCj4gPiA+IGRlZmVycmVkIHdvcmsgYWZ0ZXIgZmx1c2hpbmcg
aXQuDQo+ID4NCj4gPiBEb2VzIHRoaXMgbmV3IGlzc3VlIG9jY3VyIGV2ZW4gYWZ0ZXIgbW92aW5n
IGh2ZmJfcHV0bWVtKCkNCj4gPiBpbnRvIHRoZSBkZXN0cm95KCkgZnVuY3Rpb24/DQo+IA0KPiBV
bmZvcnR1bmF0ZWx5IHllcyA6KA0KPiANCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
SSdtIGhvcGluZyBpdCBkb2Vzbid0LiBJJ3ZlDQo+ID4gbG9va2VkIGF0IHRoZSBmYl9kZWZlcnJl
ZF9pbyBjb2RlLCBhbmQgY2FuJ3QgcXVpdGUgZmlndXJlIG91dA0KPiA+IGhvdyB0aGF0IGRlZmVy
cmVkIEkvTyB3b3JrIGlzIHN1cHBvc2VkIHRvIGdldCBjYW5jZWxsZWQuIE9yDQo+ID4gbWF5YmUg
aXQncyBqdXN0IG5vdCBzdXBwb3NlZCB0byBnZXQgc3RhcnRlZCBhZ2FpbiBhZnRlciB0aGUgZmx1
c2guDQo+ID4NCj4gDQo+IEkgd2FudCB0byB1bmRlcnN0YW5kIHdoeSBjYW5jZWxfZGVsYXllZF93
b3JrX3N5bmMgd2FzIGludHJvZHVjZSBpbg0KPiBodmZiX3N1c3BlbmQgYW5kIG5vdCB0aGUgZmx1
c2guIEZvbGxvd2luZyBjb21taXQgaW50cm9kdWNlZCBpdC4NCj4gDQo+IDM4MmE0NjIyMTc1NzIg
KCd2aWRlbzogaHlwZXJ2X2ZiOiBGaXggaGliZXJuYXRpb24gZm9yIHRoZSBkZWZlcnJlZCBJTyBm
ZWF0dXJlJykNCj4gDQo+IEJ1dCBJIGFncmVlIHRoaXMgbmVlZCBtb3JlIGFuYWx5c2lzLg0KPiAN
Cj4gPiBJZiB0aGUgbmV3IGlzc3VlIHN0aWxsIGhhcHBlbnMsIHRoYXQgc2VlbXMgbGlrZSBtb3Jl
IG9mIGEgZmxhdw0KPiA+IGluIHRoZSBmYiBkZWZlcnJlZCBJL08gbWVjaGFuaXNtIG5vdCBzaHV0
dGluZyBpdHNlbGYgZG93bg0KPiA+IHByb3Blcmx5Lg0KPiA+DQo+IA0KPiBBcyB0aGUgcmVwcm8g
cmF0ZSBpcyBxdWl0ZSBsb3csIHRoaXMgd2lsbCB0YWtlIHNvbWUgZWZmb3J0IHRvIGdldCB0aGlz
DQo+IGZpeGVkLiBTaGFsbCB3ZSB0YWtlIHRoaXMgaW4gYSBzZXBhcmF0ZSBwYXRjaCBsYXRlciA/
DQo+IA0KDQpZZXMsIEknbSBPSyB3aXRoIGRvaW5nIGEgc2VwYXJhdGUgcGF0Y2ggbGF0ZXIuIEl0
IG1pZ2h0IHR1cm4gb3V0DQp0byBub3QgYmUgYSBidWcgaW4gaHlwZXJ2X2ZiIGFueXdheS4NCg0K
TWljaGFlbA0K
