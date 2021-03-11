Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A3433810C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 00:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D116E560;
	Thu, 11 Mar 2021 23:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95ED36E560
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 23:02:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXIq+UNHqou+kDyreuYjRCe3/YWxIg9Yn2Tc5FBpuS75qezj8tiRKMYJNZefmvpoC7uvLLTw44t1/R8miCk4b7LgudZ1yMJsCxqw+pH19n9NiJSS8z0geGV96TVRVT7nhHT/HnOd9SXu5pF9uBCtS5IBvbwA+AKHDFtrszbdPXh/5aZWa5LvaftE19G1y1ytQPC+CD4fJuwyXZVCl0rjYU94qHTXK+LYvwP8TNvlhj4BZYn7oLLl92V8sPNyqYO42vacF+5U9oGW2W2R16igG16WX1cgzMLwg9Q9QRyIan5VSeC3zaX0CyUXET5MiykSgu9Q/CtWwpWUdYsxTnrP0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w41tIHexGXHEwzQ3M9CH3jKoecZnG5bWOm9R8BsIf1U=;
 b=YMFQahAVjjjbC4hYYDSHVESudjjWhc8mjnufGof9PeQ271QkucsGzVpyb+68B2a9c7KzIhxHCEr8NI/v8v7egqlpvaFTKNlQNr4g28LwVt6ZP6O3JOen89I4Fx5kmh8hncCiBcgwbHtEA6dQV3pr5hGR1EMKivIGeaC8+8/rWElO3rkSmJmuSsboYtacExb9jZEPpqqE4EE23z6iu0nHeRCVQTAxTE2YvWGkUpYi4HrAfmnv8At0k4rTlk6Mhaa/Ri4yA6X5gFobiH+hHEdyBW0FYMMHs7g60nIr73gOLjZt1KffGLii1LRoj5X2b8S+iywa9ypG/pvHf+qbTzMXRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w41tIHexGXHEwzQ3M9CH3jKoecZnG5bWOm9R8BsIf1U=;
 b=GU+ci9mXrFRmqEviomTUBCEcQsGWWgxxYmRo2+JOhXcpkzIVk9wOz+pii04sT5rcqhwpqBqdBXR8obRIWt4BJUTWUfRqA5/scF+DKWwUV4QrZhT4zHCSy0JJuUe3dWa0r8NQX8/ODqpMODUdSDDJQumBbTpxuHfLyU+hXENiYb0=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6253.namprd05.prod.outlook.com (2603:10b6:208:c8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Thu, 11 Mar
 2021 23:02:48 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::88de:ad34:82d7:a02e]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::88de:ad34:82d7:a02e%6]) with mapi id 15.20.3955.010; Thu, 11 Mar 2021
 23:02:48 +0000
From: Zack Rusin <zackr@vmware.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKQ==?= <thomas_os@shipmail.org>
Subject: Re: vmwgfx leaking bo pins?
Thread-Topic: vmwgfx leaking bo pins?
Thread-Index: AQHXFmPGRvTgB8N0CUeQLBDdp6Kquqp/SCwAgAAYtgCAAAehgA==
Date: Thu, 11 Mar 2021 23:02:47 +0000
Message-ID: <DCF8E67E-36D4-400A-88B7-63C6253179D6@vmware.com>
References: <09ebc5cf-3e2c-d233-2c58-ff4d72e01297@shipmail.org>
 <D04E8A53-C740-480D-9209-1CC6A40A10F2@vmware.com>
 <54448dd1-cfc3-626a-6480-4edfcf97b148@shipmail.org>
In-Reply-To: <54448dd1-cfc3-626a-6480-4edfcf97b148@shipmail.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.40.0.2.32)
authentication-results: shipmail.org; dkim=none (message not signed)
 header.d=none;shipmail.org; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [71.175.59.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 582ceaf3-fdb9-4b9c-c2b6-08d8e4e1c9fe
x-ms-traffictypediagnostic: MN2PR05MB6253:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB62530556F9F2889DE6D74568CE909@MN2PR05MB6253.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z++IrY5NKq8hkHZEEa9KyppC3mvbYvoRfzs1Nk3MQm8pqsuCDAX3lMYGD50DGLCFGjvQWAKUbuRLCMU7robD+f8wJiaGK3kU7guvRRjkY4fw7OlPP8d0mCjg8pOayXIPqN4ym9N4KDVUoXpyPo3CSImLazf3VE2/856ZdfBcQN0GSn3DfBBHy1VYq0LCcenYs1UolZ4Ev3ErffmVoJbbrvlhOw1Z/uwvh4bn2+3MNDk6P+CkQCV5rMaW+Lz0CnwIH3+6aOqWSkWORhhd+SyqW4Bm3JztC5i/kngAhxtN+0Zu/b36koTA326RBOtBkO0o7h6UsOYMmcGH/yQUwEZT6lmdNigpZWTTHur76banTXLJcBZLR9KgDeMbgI2zvp/M6CTtxyoDKmty+Svo7oMpbOUg+777xFX4dKv6iksd3DaVIQdoNRCWKg5mPTbgh9h7tf+/EdihZlVAuJoD3xDbzYwL+SnUSvBgGFWbr6xbcRTCeh6+TCIfPvp1HEJwmSd5ijvXN9P35Jp5IanBgg67AqWWszK9RReC6GmlrGJXcIU8PC3cREde0MkvqyeRyYV3YxMyKJSmglGjDLhMzPE/kRN6lR13W21W5JY+fBXqNeSUpyarHkx9+OIQoylBndR+Dnc03RI6ICWKSh8ODeEAZw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(33656002)(83380400001)(36756003)(86362001)(66476007)(66556008)(64756008)(2616005)(66446008)(6486002)(66946007)(54906003)(76116006)(316002)(2906002)(5660300002)(186003)(26005)(3480700007)(4326008)(8936002)(66574015)(6506007)(53546011)(6512007)(8676002)(71200400001)(478600001)(6916009)(40753002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VzRidDBveGVSSk42cFFLZU1zVVpjMXVjU3JjMFR3cytSb0VQRkRrNldmUi9y?=
 =?utf-8?B?UzZISkR2NHRpSzAveWY3MTQ1aHczc3V6Qmo2TFZjV2pzMmVOM1cyQ0hNTzVv?=
 =?utf-8?B?bVpJbzUrNHY5VGY0NksyNmtPeUp0ZU1pUmVzWkM1SHN2VWRmQmtRVEEvTUFF?=
 =?utf-8?B?Z3FuQUJzSUJ2SVdETjg3ejYrNEpWMDFWQldGbkVneWdxQ054WTM3M3ZWcTll?=
 =?utf-8?B?Q283aEVuaWh4SmVHd2xVbGpzdmE4Y1QzVEVMOCtUckxWcEZVOG5qREhDL2g1?=
 =?utf-8?B?UVFxYzR2Kyt1aFJwa0ZtRVdyVGlSV0x1Wlk4cmRjSEpCeHl2Y0kzVng5czFt?=
 =?utf-8?B?THJOU3B0aVZ3emdYYzEyM3o1eW9OVVd4Y2R6cndZTEpxUTJZOWtlTFhaUUJT?=
 =?utf-8?B?ZEk5cGxkd0h2aXdpOGxGZmlBM29YdDV0NnhBZXNtMnhhd1FjMDMvTTNZaUVp?=
 =?utf-8?B?c25rSThCYkFzWGxEMWxmQitQWERxY2ZUaVlsWVlySWFzem8rY1lEcmxwYnBT?=
 =?utf-8?B?STZRdk9qQi9SUjlQQmtuNTFmV094RzhNUlV6SEFBb3dmWkF3RzB1Y2tic3Bw?=
 =?utf-8?B?L0Y3c2szYUtuRFlpK2p0VjVpSDYyQ2RIa09pT2hDdVQvbitmcGx4NldTVkxT?=
 =?utf-8?B?RURwOE5VRTF0WEpGbnR0MEwzcERFTmcxQ0hKNnRQUDJmVHB1MDVaL05ObWQ3?=
 =?utf-8?B?VzJ4VHhVV1Z3cHZxb3hzYnArUlBGTnlMaFdPOHB6S0lsdGRxMU1YZ081UG5Z?=
 =?utf-8?B?WGE3Tit6cXRFKzNlR1RxZlZvNzF5SWNYai93TXRwd3RKNWpiQm8wWUdxQ3hh?=
 =?utf-8?B?bkc4aG9sVUx4WGc1RXN6T2oya1M3NlM4OU5QOW9BVVF6ajZ4UjhLYkdrdC9U?=
 =?utf-8?B?eUVVZkdkejhvbnZ5ajVWbmloelh3bE9HWmg3WlhCU2NhaVVLZytyY2todWNN?=
 =?utf-8?B?R1I4bVZoQXQ0ZVVBMzhrTDFLNFgwcFJGVmw1eS9CSk1yeUhxN0JBaXg3SXZT?=
 =?utf-8?B?QlU5UmR3ckNyaEl5MVlTK1FnZ0ZXRlB5UUlKS1dDbjBSMEpKdzNpWUw5T1c0?=
 =?utf-8?B?Z0xDRlFwNnMvcVBqTVp0S3JoNEQzcTBCYTIvY1dJL201QnlnVVlCU2lUOUtO?=
 =?utf-8?B?L08xWUJrQk1sQWpMMExvL3E3Ny9nMlBpWEdqNkdHVXhpeW9sNFlybnBYeGZ3?=
 =?utf-8?B?QmhuR0g2Zi9DejRCb3dPVk81V2ZLdTFNeUZKN2RGREx5OWJLRTNmYWJ1N1ZK?=
 =?utf-8?B?c2VBVDQyZXZST0d5aVFySi9tZVFhdVBuaHhzUTljZFFEN3dFblBUdk5WOE1Z?=
 =?utf-8?B?em1QeUxiSkthTHdrYURiZVFXSWVlcGdqdHk4aWtZMG1VUjVteGlQelg3UVNU?=
 =?utf-8?B?UksySzFXN3pPazN3M0pzQWlrTWQzeEpKeDlTNmxuT2ZWeGZSQ1BRMUdLQ2du?=
 =?utf-8?B?aWdUT0hDZ1JEaE0rR1NsTHU5V3J5U3JXTVNxSms1OXRQZVk0N28zMlVnNlJi?=
 =?utf-8?B?TzVNMUpSNDJQWlZIaU1WZmJCSml6ZEs5bU5mY2NmUWlhblEyZEpjc2FoUzcx?=
 =?utf-8?B?a1VTOXY4dWdqYUp5aWFId0lIQUFEOVN4WDVIcVFEMVRYeGF0RkVOa0twem1S?=
 =?utf-8?B?Tno5blBRRzFpVkkxeVE2MmVhcnN3anprSi9qRWUrVVdhRCs2R1RIdVRzRTMx?=
 =?utf-8?B?Witwa05PRSthOUpETkQ5R200b3I3QmxRWW5DTkZtdXQ4NTFyUHQwS0tkU3lY?=
 =?utf-8?Q?LUlFKQcVA3fsGAnLMw57YfZf27Fooco/PcZC+dN?=
Content-ID: <60617BF88CDEB446822FEBBDA1B41BBD@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 582ceaf3-fdb9-4b9c-c2b6-08d8e4e1c9fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2021 23:02:47.9896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +rqBF9khnBnsPGbN9lDHN1NHGxcDPmIUAWQPnpjsjapuZR7Hm+SO1aCuAzfDUtEdX5HCSSRVGvBcpDzaq4hhJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6253
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gT24gTWFyIDExLCAyMDIxLCBhdCAxNzozNSwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVs
KSA8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSwgWmFjaw0KPiANCj4g
T24gMy8xMS8yMSAxMDowNyBQTSwgWmFjayBSdXNpbiB3cm90ZToNCj4+PiBPbiBNYXIgMTEsIDIw
MjEsIGF0IDA1OjQ2LCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpIDx0aG9tYXNfb3NAc2hpcG1h
aWwub3JnPiB3cm90ZToNCj4+PiANCj4+PiBIaSwNCj4+PiANCj4+PiBJIHRyaWVkIGxhdGVzdCBk
cm0tZml4ZXMgdG9kYXkgYW5kIHNhdyBhIGxvdCBvZiB0aGVzZTogRmFsbG91dCBmcm9tIHR0bSBy
ZXdvcms/DQo+PiBZZXMsIEkgZml4ZWQgdGhpcyBpbiBkMWE3M2M2NDFhZmQyNjE3YmQ4MGJjZThi
NzFhMDk2ZmM1Yjc0YjdlIGl0IHdhcyBpbiBkcm0tbWlzYy1uZXh0IGluIHRoZSBkcm0tbWlzYyB0
cmVlIGZvciBhIHdoaWxlIGJ1dCBoYXNu4oCZdCBiZWVuIG1lcmdlZCBmb3IgNS4xMi4NCj4+IA0K
Pj4geg0KPj4gDQo+IEhtbSwgeWVzIGJ1dCBkb2Vzbid0IHRoYXQgZml4IHRyaXAgdGhlIHR0bV9i
b191bnBpbigpIGRtYV9yZXN2X2Fzc2VydF9oZWxkKGJvLT5iYXNlLnJlc3YpPw0KDQpObywgZG9l
c27igJl0IHNlZW0gdG8uIFRCSCBJ4oCZbSBub3Qgc3VyZSB3aHkgbXlzZWxmLCBidXQgaXQgc2Vl
bXMgdG8gYmUgd29ya2luZyBmaW5lLg0KDQo+IFRha2luZyB0aGUgcmVzZXJ2YXRpb24gdG8gdW5w
aW4gYXQgVFRNIGJvIGZyZWUgaGFzIGFsd2F5cyBiZWVuIGF3a3dhcmQgYW5kIHRoYXQncyB3aHkg
dm13Z2Z4IGFuZCBJIGd1ZXNzIG90aGVyIFRUTSBkcml2ZXJzIGhhdmUgYmVlbiBzbG9wcHkgZG9p
bmcgdGhhdCBhcyBUVE0gbmV2ZXIgY2FyZWQuIFBlcmhhcHMgVFRNIGNvdWxkIGNoYW5nZSB0aGUg
cGluX2NvdW50IHRvIGFuIGF0b21pYyBhbmQgYWxsb3cgdW5sb2NrZWQgdW5waW5uaW5nPyBzdGls
bCByZXF1aXJpbmcgdGhlIHJlc2VydmF0aW9uIGxvY2sgZm9yIHBpbl9jb3VudCB0cmFuc2l0aW9u
IDAtPjEsIHRob3VnaC4NCg0KWWVhLCB0aGF04oCZZCBwcm9iYWJseSBtYWtlIHNlbnNlLiBJIHRo
aW5rIGluIGdlbmVyYWwganVzdCBtYWtpbmcgc3VyZSB0aGUgcmVxdWlyZW1lbnRzIGFyZSBjb25z
aXN0ZW50IGFuZCB3ZWxsIGRvY3VtZW50ZWQgd291bGQgYmUgZ3JlYXQuDQoNCj4gQWxzbywgcGlu
bmluZyBhdCBibyBjcmVhdGlvbiBpbiB2bXdnZnggaGFzIGJlZW4gdG8gZG8gdGhlIGVxdWl2YWxl
bnQgb2YgdHRtX2JvX2luaXRfcmVzZXJ2ZWQoKSAod2hpY2ggYXBpIHdhcyBhZGRlZCBsYXRlciku
IENyZWF0aW5nIHBpbm5lZCB3b3VsZCBtYWtlIHRoZSBvYmplY3QgaXNvbGF0ZWQgYW5kIGFsbG93
aW5nIHRoZSByZXNlcnZlIHRyeWxvY2sgdGhhdCBmb2xsb3dlZCB0byBhbHdheXMgc3VjY2VlZC4g
V2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBUVE0gcGluX2NvdW50LCBpdCBzZWVtcyB0dG1f
Ym9faW5pdF9yZXNlcnZlZCgpIGlzIHVzZWQgdG8gZW5hYmxlIHBpbm5lZCBjcmVhdGlvbiB3aGlj
aCBpcyB1c2VkIHRvIGVtdWxhdGUgdHRtX2JvX2luaXRfcmVzZXJ2ZWQoKSA6KQ0KDQpZZWEsIHdl
IHNob3VsZCBwcm9iYWJseSBwb3J0IHRoZSB2bXdnZnggY29kZSB0byB0dG1fYm9faW5pdF9yZXNl
cnZlZCBqdXN0IHRvIGJlIG1hdGNoIHRoZSBuZXdseSBlc3RhYmxpc2hlZCBzZW1hbnRpY3MuDQp6
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
