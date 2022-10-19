Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47289603832
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 04:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BB710EA48;
	Wed, 19 Oct 2022 02:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-eastusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c100::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324D810EA48
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 02:44:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+CcjmfaccOaMI5CpFQbw5nk0g6lHILIRWsqMOeOCLyrdD7iBOIsy+pI2TxMvRMwr/FkNxrL2YMPyxP4dxTYsHd+Oaak0UWwNNYpuJazaEVwWceFHX7QiX49ZkfSs3YGBooix+QGNNSjEQJbkmXzuceHot+yuCS0TY0L9oIuq+jSyNHETnraCsUh6sQGhETxfJgLRZT4OlnpCVrN9Ro5hFGvY2c+UPZSKlVArtL6SFhdyp/wPhfUaDyJ7jAE3omSw+1u3GFrm0i2FW0Nc0UgP2u/NDvmfuNd4MbwuWvkA5fM+Q3EW7PNIbLp2ubNvngtni72jhsvd81VQG0B1HQ31g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIj/Uv/jdX8tBeOKQr9xNhnFfTwzKIsK5Jbt5gTuKV0=;
 b=XNAttuqnK4e5w6VoRGXYq2iiobeqB2oexJT5UT3yNm09LRf3ATPbk5JqZ0f6/HiYdn/RVG3kLjSZ7AHpZ8IkUHHjvRmetp8vyyXiX+FYxh1k9iY+C91gPfYHMMGkecRgSyv9L9DQYyhmeY9C9TmYdQu5P/Cflkn3bZurQWYlfr00kRVEnzDM2lmU/GFs1Ioorp/9MdL17249TUzdVdfBoYAsimRGW9xjGQVgyIYzBvB/wdjKu6cUDMU+JyQbnpRWvuAq1jdeoKESefAaLfOwJAziJs/tgbdJVFox9wHuLt/7CsD5lR0IJY4lJUESS+qUH6JIVU1HvQSfcH7W0TB/xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIj/Uv/jdX8tBeOKQr9xNhnFfTwzKIsK5Jbt5gTuKV0=;
 b=s4If4MMTnA+ZRkgABqZwnPIzzer9Ruwp2ZS6CBislL70cwl647ZGkePh5fiuOxJNJTpLXlfHnic54KdxqjuIk6hOFyK+jRJZPcaCUQ/IAZZCLGrzK/FnYw3bTqPxxLv5hbND3H76UnX39Llq0FXZ69wX0x/PT0bsYqXn7wW4nzw=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by PH0PR05MB8106.namprd05.prod.outlook.com (2603:10b6:510:97::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.16; Wed, 19 Oct
 2022 02:44:45 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::d893:b27e:529:35ae]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::d893:b27e:529:35ae%7]) with mapi id 15.20.5746.017; Wed, 19 Oct 2022
 02:44:45 +0000
From: Zack Rusin <zackr@vmware.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] drm: Remove drm_mode_config::fb_base
Thread-Topic: [PATCH v2] drm: Remove drm_mode_config::fb_base
Thread-Index: AQHY4wxmh2BkI5MMlEC1jn8uzVOF+q4UmB8AgAABiICAAAlogIAAYFUA
Date: Wed, 19 Oct 2022 02:44:45 +0000
Message-ID: <a2c6ec5eee127d937bd37ffba6755d01171e314a.camel@vmware.com>
References: <20221018131754.351957-1-zack@kde.org>
 <20221018161201.365897-1-zack@kde.org>
 <Y08KoKYEd4fzE6wc@smile.fi.intel.com>
 <682C6980-00CA-4A86-A9FB-859FF9B3AE1E@vmware.com>
 <Y08TzSjcjH60y/h2@smile.fi.intel.com>
In-Reply-To: <Y08TzSjcjH60y/h2@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR05MB3047:EE_|PH0PR05MB8106:EE_
x-ms-office365-filtering-correlation-id: c779c91b-de02-4682-169a-08dab17be1c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ku9i3298Tu+aGVKy0k+LdTZa4H25AAvJtGLXylmX2CFX3sbmxaHRC5rJuG85ikIkhmHgfSWS4TpTAjoEADHaJTifvQ/v4FAja2Xddmne3Lk6Z9p/s87kpyp9UhjZrZRO4E/2AqHzIdJkeuC5Hsg/+tUb8M+8GmFyLo7Ri68IoBmO1ePOMMcvvXSljv/t0Rp6Ooiy/e5RQbqjOmHIaLF6Npx4EuqxRQ1QdNJBiU/lPgc4Mn5iNvWHZmBqdmC1bLAQLdgfG4hhfAwI9rNL5Op4TBD0XCiP0ygD+bPoRpXpnYy2eXcI7llk+EZO+6wxSV6J2Z+letAJFVoLGV4E9GyFmBq6R9aTdp4t1NdJHqACKA6X2fdFp96UxBqN/Ty5jM08O7HAaRRqppsswD04XtrWzVHoBd95jpC+PQ5nFGvSi+3LxAYTYczY86HmjsVEMBpYoVi15afNM/N3Hb2tcFVhWPcZmLqNeUGhe7VSeSWaFuHkpqiYpq+oiLw9+3SIlY9s0ElkTZfjYSS2qnD+bQnfQp07C+aj8kEFC0t+91+UBoS6mw/vlVnNTniYCmYfPgYZ3FJPG3glhSMUKxoYF9febRay9DSXFbhJXZxqFCUNBmGwoVi+8lKBEBixzFnX2NeFjNWAa+/ho/d5nAX/OS3ad5DvDffJSsRK5SixwGBR+yVKu8pgBK0mw/8urUtoDqID6OwH47sHT2kMrCTCw8g4bZAHSOI2FLxGlFE2prQiPwDCONISO9VYU/Ej/CUdj4BLJuiYb41nrIw2r1UIuLsTuf4jXHRtdFyuYhLiLfntKIB1lGtyhcBpJFWsKI6gZdq9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(451199015)(66899015)(122000001)(38070700005)(6512007)(6506007)(26005)(86362001)(4326008)(8676002)(4001150100001)(64756008)(66446008)(5660300002)(66476007)(8936002)(2906002)(66556008)(38100700002)(41300700001)(76116006)(66946007)(91956017)(36756003)(83380400001)(316002)(186003)(6916009)(966005)(6486002)(53546011)(2616005)(478600001)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3l6K3JOeVkyNyt4MzVaQ3ZDVVVZQmt6RStwV1FsT3l3L1B4aEtzNVk4ODhu?=
 =?utf-8?B?eGxxSlpGQ1lTOWVoL2JEUVFvNDJod2pHMm9QOFBaclNSUjlRbVlyOXVzbCtE?=
 =?utf-8?B?REwrRVJNS2d6UlNCb0djc3VmbkViOFcvc0dQUHM1NkZXdTN3ZUJkUDlLVU5V?=
 =?utf-8?B?K1YyWFB4QWMwNW5Ja0VEMEZWSi9hb3RpRCtFZXEyUDRiMGZObkgrT2ZkbUwz?=
 =?utf-8?B?aW8yQ3ROK3dRS2I3bTA1RUFaVEdNQlY3cWY0Q2JNejEyR0hMSmpFZEJCd2g2?=
 =?utf-8?B?a3ZGeUV0Tzc0Vnp5SHJ2S1VUczliUW1qOEZpeWl6ZmZ2SWQ3MnlGZUN1bngr?=
 =?utf-8?B?V3NXT2hDWUprZ0RQTlRDbHZCYnNLaCtpTkwxcnd6VWwvbEUwOENPcDdoVDZl?=
 =?utf-8?B?SC8ybkpSKzZRN09TdkQrd291Qmo4bnQ5enFLVFdjZEppQk9qNkNuWlphUUZN?=
 =?utf-8?B?VDFyRnBVMVhadzc3ZEl2emtFaUhVV0c1TGtaN2FMTE5uMkZPU1U0TWlWVVNu?=
 =?utf-8?B?Mkk2cTNnUkZEajc4c3p0UHk2STRTOVc5TTlqTjhqS2ZhV3VIZEVvVk5qZHZ0?=
 =?utf-8?B?Z1B6ZmgwMEFibE9sZS9tZ01uN0tXZmtDR3BrQ281eHI5a09xcmNEenVDTnp5?=
 =?utf-8?B?Sm10ZTBaUGxsckJpbmsxNVMrWDhKOUdHTmJZU1Bpd2ljK2JrRTFmekhwSmhW?=
 =?utf-8?B?elpNaFViUE9vekZqN2tacTFoSDNndmdDRGRHKzZGYk5pV21nT1BhZVJ0YXdI?=
 =?utf-8?B?NjZvR1pzbEgrdkYySTkwRkNpdlZVWlJQbnNFWHY0eXlUSEN3MUoyU01mZzRZ?=
 =?utf-8?B?ejhac3RyWFpCc1BLdG5Ca0lpZ3UydDlKZUMvMVBrUGFieFlKM3B6bm5qTzls?=
 =?utf-8?B?a0lUSVRiQ3FmN01zdjVITVBZTzVSanAzc3VOU1FiVWV1c2xGeEs3Q3ZJRzlM?=
 =?utf-8?B?bGJlNU9WcUVDV2M0bzNIdWw1TWhQQkY5MFljQXJsWU1mSnpEbEwwTXU5R0tr?=
 =?utf-8?B?WHhENUZpalJ6VHFxcmQxbmRESTdXdTdMVzE2ZklQZzRqMWVOaWN6cEs1Z3JY?=
 =?utf-8?B?RVh3emNPclpveVlwTTFuZHZUTUxTZ3Z5ek1ESThHTk5FcHF4R0Z3a0taenV3?=
 =?utf-8?B?VkJXZGZNbWpPMlEyRXMyKzdBeTFONmNLdW9ZVlJnQVN0cTBNd25ndTgzSFBz?=
 =?utf-8?B?Y2xSQlQvK00xOVFNb2JaOG5mSlRWcVorNHYyS1ZKYmhLSHVqU2sxcFZ1RDdC?=
 =?utf-8?B?VmpIOHg5WkVWZkNaZUd3Rk5sR0RWNi8xTm5PbERZT2tNOGw0UzQrSWFGRGF2?=
 =?utf-8?B?Qkp4aXZvTzArM1BwM21MY01YY1c5TDg1OFlVRCtrMFA0RG9QVm1GUmk0YkM3?=
 =?utf-8?B?ekNWVGNEdW82NERsWjRldERlMktadklMSHI1dmZhaXBQM08wdm1sUXUzd3dK?=
 =?utf-8?B?b2gvTUN1bVVJcStuNU5SWGJzRkk0NGhWaThHT0FYL3dKRWhlS2NRdkFnaDNN?=
 =?utf-8?B?UlJSZUlFNkx3UWJ5SW0rZ2kyblNTWFc5Ym8vZnFZaHh4a3lVOUlKMDcrSUtp?=
 =?utf-8?B?dlczYnBVa3RWdnJWei82b0pWeVRrMFJCY00zZGdITkYrLzN3QUR3NXlJbW9o?=
 =?utf-8?B?czk1cWpWTlhHdzVpL0hQVDNGWDd0NVVPTUsvSjA2YUtCdW9vSk5kcC9PdzV2?=
 =?utf-8?B?SzBQMHBNSkNMQ0pmOGVVN3AxcUFqcnpuWW1ENFdlNlBHRXBTeDFUVkNKUzdR?=
 =?utf-8?B?b1dWVi9lbU5BclNzaUpGMW5JcjRPWmJadzRiU29WMFh5elIyUUR5RXZ0NG5X?=
 =?utf-8?B?VWJOZU4rZGhTd3J4SDg5MHBiOVNwVFpTZ1JDYnlrNk1kZW5iRHVpK3V0a2xz?=
 =?utf-8?B?d1JHZzVYeU14NHZWRi9KU1JHbE84a3puZ0hhSWNsK0JIU1M4SHIrd3YxdlVa?=
 =?utf-8?B?R2QvSUVURTIxYWdOanBleXgwMXBWaUtaY2R6R0JHVkc0SEtzOWhCcXd0QkVu?=
 =?utf-8?B?VlNQekVPbkE4SGJ1Rmg0YWtlaUxjV2VJcWsraDg2Vkx5Y1A0Y1laeDlHYnpw?=
 =?utf-8?B?VEFyNWI5enFBRnNxZktzb2szRGFKTWFzaVV5a0NjaThNMmRLNjBZL2VFdmxB?=
 =?utf-8?Q?nxjN00IjtR2DMF8SEDgjU4eXV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0032605AAE98614DB1039FF5090864EE@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c779c91b-de02-4682-169a-08dab17be1c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2022 02:44:45.2917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zyT9azO/+oX86LJipCVq4uIpPsBmk4OQwPbnSv1R5nT770h+eyza24+M9jzALg4qP/XHbsYUT1buH7qs8WyuPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB8106
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIyLTEwLTE4IGF0IDIzOjU5ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IOKaoCBFeHRlcm5hbCBFbWFpbA0KPiANCj4gT24gVHVlLCBPY3QgMTgsIDIwMjIgYXQgMDg6
MjY6MTdQTSArMDAwMCwgWmFjayBSdXNpbiB3cm90ZToNCj4gPiA+IE9uIE9jdCAxOCwgMjAyMiwg
YXQgNDoyMCBQTSwgQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRl
bC5jb20+IHdyb3RlOg0KPiA+ID4gT24gVHVlLCBPY3QgMTgsIDIwMjIgYXQgMTI6MTE6NTFQTSAt
MDQwMCwgWmFjayBSdXNpbiB3cm90ZToNCj4gPiA+ID4gRnJvbTogWmFjayBSdXNpbiA8emFja3JA
dm13YXJlLmNvbT4NCj4gPiA+ID4gDQo+ID4gPiA+IHYyOiBUaG9tYXMgYW5kIExhdXJlbnQgbm90
aWNlZCB0aGF0IGluIHJhZGVvbl9mYi5jIEkgZm9yZ290IHRvIHNldCB0aGUNCj4gPiA+ID4gaW5m
by0+YXBlcnR1cmVzLT5yYW5nZXNbMF0uYmFzZSBhbmQgTGF1cmVudCBub3RpY2VkIGEgbmVhdCBs
aXR0bGUgY2xlYW51cA0KPiA+ID4gPiBpbiB0aGUgaGlzaWxpY29uIGRyaXZlciBhcyBhIHJlc3Vs
dCBvZiB0aGUgZHJtX21vZGVfY29uZmlnOjpmYl9iYXNlDQo+ID4gPiA+IHJlbW92YWwuDQo+ID4g
PiANCj4gPiA+IFlvdSBuZWVkIHRvIGFkZHJlc3MgTEtQIGNvbW1lbnQuDQo+ID4gDQo+ID4gVGhh
dCBjYW1lIGFmdGVyIHYzLCBhbmQgSSBmaXhlZCBpdCBpbiB0aGUgbWVhbnRpbWUuIEkgd2lsbCB3
YWl0IHdpdGggc2VuZGluZw0KPiA+IHY0IHVudGlsIHRvbW9ycm93IHRvIG1ha2Ugc3VyZSBJIGdp
dmUgZXZlcnlvbmUgdGltZSB0byBsb29rIGF0IGluIGNhc2UNCj4gPiB0aGVyZeKAmXMgc29tZXRo
aW5nIGVsc2UuDQo+IA0KPiBIbW0uLi4gQW0gSSBtaXNzaW5nIHYzPyBJIGFuc3dlciB0byB2MiBh
bmQgTEtQIGNvbXBsYWludCBhZ2FpbnN0IHYxLg0KDQpQb3NzaWJseSwgaXQgZGVmaW5pdGVseSB3
ZW50IHRvIHRoZSBsaXN0LCBtZXNzYWdlLWlkDQoyMDIyMTAxODE2NDkyOS4zNjgwMTItMS16YWNr
QGtkZS5vcmcgcGF0Y2h3b3JrIHNlZXMgaXQgYXQNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9wYXRjaC81MDc0NzkvP3Nlcmllcz0xMDk4MjgmcmV2PTMNCmxrcCBlbWFpbCBjYW1l
IGFmdGVyIEkndmUgc2VudCBpdCBvdXQuIEFueXdheSwgaXQncyBub3QgYSBiaWcgZGVhbCwgSSd2
ZSBqdXN0IHNlbnQNCm91dCB2NCB3aGljaCBzaG91bGQgYmUgY29tcGxldGUuDQoNCnoNCg==
