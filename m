Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DEE4E2935
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 15:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD9110E491;
	Mon, 21 Mar 2022 14:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140E410E483
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 14:02:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtwdpiKfj4e9KiRc66tBO73UdH9aTc7mRYsG8dyoSRAlqo+3KMEd2xWQ0P3GYe+mroq+TwJzayrl5ehhLnkS0+SyKpN8LWEJ0+CBxNCc9tghZS9ZcTJhmZjHHn/9SClfBrzwILVzXmOQEMg8tAr9QhJDeINMCT8HynRRC5qIoLywytXukBu1VGXrBzmYJJIKakTshdH4ZCPEJaE/5t3NWROgqFMYmx3+qOrrm/+DQDc3a5Eaq2ivKAXgqzwml9GI+zr4esNHx9FyhhhHnZ7pgpHhm+ufwpbUsZaESBeVu+2n+s9BVNCSAndISRrVPDh9q770/0+6Hg2Bd0OLnHkCOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mC2uk+GtGgeRI4KmFps7p8RyTM2G95bs5nedmVSd5kI=;
 b=AUAASE87W4COxJ3Ovpa2V/Lja0STlo8CcI1GJivYRlBhqqlobQbvCo6qhnLkgJlYnz8oLhHPaCkI4Vhd/UuYuSlIb7e3GXn3snU620MR1k1AndEFoBR5OGElizQsV7/et5ijfexjFcJR5WosSv51JzioKFzVZpXdELzY9ch6iKrZu4fhP0xVjv7EkTZ8VOwfcplHCIjaEk+Hcr++YL0qsEOyorwpqW71uxBCNP+oKjETjOe3VUGOW/moNlDgF7n47uy0lGYXw8VRbaWI43A6O3Z/4gFUJZOBJyaQirLbqDvzwyibeON/0YE+a4o1Skr/UeeQ+rSIMcsTUvYZNSBHxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mC2uk+GtGgeRI4KmFps7p8RyTM2G95bs5nedmVSd5kI=;
 b=dBKRx+JW5cb4syL47qUk1tbkJm4xI4Xsat0ObZsBUW127h57MJpHBz0MU8An3JGQ5OgToKpTs2CBbnNarGdWKsdEIbIWzJoAD5IgM3asgqJ2gkG+EQN9+BO/coswrC7ayfsSwBlWT/jja1h9morSUEq6wtmtPPw5HqMURALSLn0=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MWHPR05MB3055.namprd05.prod.outlook.com (2603:10b6:300:b9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.15; Mon, 21 Mar
 2022 14:02:27 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::c029:c5b4:6e3c:e8c]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::c029:c5b4:6e3c:e8c%7]) with mapi id 15.20.5102.015; Mon, 21 Mar 2022
 14:02:26 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 07/23] drm/vmwgfx: stop using dma_resv_excl_fence
Thread-Topic: [PATCH 07/23] drm/vmwgfx: stop using dma_resv_excl_fence
Thread-Index: AQHYPSvVm4xK1+FNQUqjAPC0WhA6C6zJ3j8A
Date: Mon, 21 Mar 2022 14:02:26 +0000
Message-ID: <91bd73763a87c3311d8cc4878589f80a712c4574.camel@vmware.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-7-christian.koenig@amd.com>
In-Reply-To: <20220321135856.1331-7-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4-1ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b973c2a2-00d0-41e1-ec7d-08da0b436e6a
x-ms-traffictypediagnostic: MWHPR05MB3055:EE_
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <MWHPR05MB30551D4C7FEBC3B9E7BAA43DCE169@MWHPR05MB3055.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H0pw+FpcBcnXaworL89V3Ec0dKdHO2v7Zgx1CsYoKFSk5yskLt+td6kUHG4Kidug2/cNANgc5pJ6o3wfD4HqToaJVIMZiud3vXAhfB1hfpNWVoRSK+EkGXNh6klyn9oOTKkcd1JPO9pHycnvnCKjm2dlvsoP6uj//dwq2pHDBlkksJsakhzhbnHwwcbvsdp8AtN3QJEuNfnmtezlNeJ9GQxNCMJR2ey+Az6Dq5yxxybGqO7Wc2Wg/KCxEqX79V94X4yI9UXat52WiUgnzGG+AkJRgEwaJzrtdWi3HXRIM9XzygjHaPrzLbfrtEYiYXE7b1OINWgG7CF3hrpqWJj7/naiNKOB9kNJ9pSqFO6xD5CQvMTKD74eV0O0OLg4Qm19tKQ4m934bUlxOCT517V1Y9nAF0gtl1xoA+mZtu8+NhaJFPw+dOwcxeDIs/xtT7qpWlfNUlIQCyr9aB3CjXfl8Q9b/mCeefuGQ8gNsh/yuplk3IgxN2p63svvB9T8p/U452TyafZes2/OUljEJB9NIIHwrxceaVUgTvTk6aF5jEnSQ/aZrvs0ao3M6xieVUGpO7lUZRFY92pM3NswZ2OUUoXJOTbp8q1qQtmBs+fK16KVUKwkEkysDRdR445MyeXfX/Z2jdOvt7WnnF1XhJy+23eFzPjm6yHSd6Z54MBJbPJAlqYgIVsWYuk55F2c3scbcRtY4Lai5pk047/cP1C84MMCcgjky/593Ykx37Fh7PO/insr+7TIJIOjg8afdOIk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(6506007)(2906002)(76116006)(66946007)(71200400001)(66476007)(66446008)(64756008)(4326008)(66556008)(8676002)(122000001)(6486002)(38070700005)(508600001)(26005)(8936002)(5660300002)(86362001)(38100700002)(107886003)(316002)(186003)(36756003)(6512007)(2616005)(110136005)(54906003)(66574015);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUhMK1k4MGc2TTg4STNadlJiU01jZFBSc1RkQ0Y0U3p0QkpDNk9OeGYzcmZx?=
 =?utf-8?B?aWZkeGRKU2toSm4vR0dVU0Q0T3I4YVZrQnNET2RYcnluSGxGQzdFZlU4ZXVX?=
 =?utf-8?B?QUJ2Rll4eDZpRHd0WSs4bnljS2ZkY1YwdnY2M1ZQamJFdk40YmNYbEk3dTQ4?=
 =?utf-8?B?RUlEVERiSk9TNFhLTERxczk2T0ZxOElwdDNQSnBlT01LSW1aQTZYSlBKZmVE?=
 =?utf-8?B?TjAzb1I0bFhzeWtNeEhaTmNHczFXak1QbzNiR2R3cDNNRS9UTEVBQnd5OXZ1?=
 =?utf-8?B?VFJkTXRmd3lNOEJaeFh1QVEvUnZtYTV2b3NYSFA3WDBLcjNvd1Y3aWlNczJD?=
 =?utf-8?B?enNMSXQ1UFI4bVVMQ3k2Q3FsZi83V0FqbGRpT2p5K2VXdDg5YTl4dnAwdk1k?=
 =?utf-8?B?UWtlM0tEWDgxMUtqcThRNk5lUlRaRzNOdjRFbGJmZy9pVk0zK0lKa2JTWDZa?=
 =?utf-8?B?cFFadmVLVTE5cDVsbDBScUFtQytLU082VXZDZWhjT2VESEpkV0JsaVIwaUx4?=
 =?utf-8?B?YVpUeWdleEgyTzRmNzhGcWVVQVJmd1RKRjB3K3VEUFlCS1F5V2loWEpqVDYr?=
 =?utf-8?B?QisxZ2toUGxVcnNWWVc1ZDNrZzlsR3l3Wit6WUNkb1U1cGVOams0NUJIVHdj?=
 =?utf-8?B?UzJ6SmZucTZPTGVqVzY2VDhqakcydDZodUdjV2tOU2F2YWFUenA4SXlVQk9z?=
 =?utf-8?B?WXcvdFFjVDV6VXQ4dTRpYlY0enB4SXNkTFdERHhPTS83dzFxcWhGOW5RMmZJ?=
 =?utf-8?B?QVJacFJudzhncUhUL3o1eURsVjRiQU0wa0wzVnp0ZFdMMEZLSStlWGVxZXp0?=
 =?utf-8?B?K0I0bzVDMDdPTWNxVEw5UjEwK2g1ZGJ2TmdPTktXQWRZeVNoR3BMeVFHbk1I?=
 =?utf-8?B?TWlicWovRmxob3hIMFJvSmZTL1Jkc1RZN0xVK2V3L2JJNUdnR01kU3dEblcy?=
 =?utf-8?B?ZWJBT1NRa1VZbjJHNUloVTY1ekxKeEVmNmx0YzhPUE0vNTlPZXhObEd3OTk1?=
 =?utf-8?B?VGZON0x3R0h3dmhPSy9rRCtBcEFuZ1NaU24vZ1R2MDIySGtjSUs4YjJId3F4?=
 =?utf-8?B?YnNpR21GN1BDWFlIUFF0SER5cFNQcnQra29hUUhZdHlBdGx2bmpESlBvc1Z6?=
 =?utf-8?B?Zm1LOHBWY3hVN3g3UWhvZHFRL2FvQWpWTW14bW5ycEROamg4VXhoY1hnbkNM?=
 =?utf-8?B?N1BLNzFxWDRUYmJ3ZXBYRDUxbkQ4VkdXSHdBQ3RGTkFnZHdIQmdtN1dDQ0Nn?=
 =?utf-8?B?QUIySWdZMHpub04zSjBjRklkN2YrNGxmZ0RzbG5KZHVIOTYxOVlEUktDNS9H?=
 =?utf-8?B?UkQ3N0thV1kxczRqNnVZNzQxeE5RU0JNQVdiNnB6Nm1YcU45N1JCOW41Skw1?=
 =?utf-8?B?cjQrR1ROUGREblV6UklEWXVzRk5JV3l2NC9FMWYzeWpBT05sL1E1NnpoU1ZN?=
 =?utf-8?B?OFpyL1ZkTDVBdDh4VmhWQlhCQjZDNS9jam9jSmxpS3UzMFdMR01WK3hRWElx?=
 =?utf-8?B?M2dwVVVmNy9ZcDJxamwyMWdQU0hXSWVaaitDRDNrYkxkaVcvYndQdjhnOGgr?=
 =?utf-8?B?dUdRU2NPaERoNEc4Zm5TTE50T3VwU0cyWTVMSG9XSHFiS2V2ZWxGMXVRdnh3?=
 =?utf-8?B?Wk94TVJ2b2d3N0lhNW9OSFc4aGMwQTJhbXFIZ3VTK1IreWZmWXowU3lML2Jt?=
 =?utf-8?B?djc1V1RhaTVReGRwb0pvdStFWE5JNTVGQjRUTFZUYUY5bDI2UzlpSUxIcG9N?=
 =?utf-8?B?ck5MNUtuR2s2ODlZbHU0OVZwQzB5MVBmYTd3WStnS3ZjVEVEVTVQK3dVUFlJ?=
 =?utf-8?B?b3ZMOG84R3MzSVFOMFBMMWthYUFrRWFwZk9rVDNFeUNkKzR4RElpTE5FY2tZ?=
 =?utf-8?B?SVJRQjl6dll0SkFJOHN2cnVKS3FMYXdoVkQwTHVicmlDeGhtMEFzRVlXcWNM?=
 =?utf-8?Q?SC4YZIrPZwRuaLmllJcPUg8jk0Z7/FWW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <581E1A65BD442D49B5000AD2E41CF710@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b973c2a2-00d0-41e1-ec7d-08da0b436e6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 14:02:26.8312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MHQ3LmTpyjfUg418RtnPCoQMN9DV42i7kI2feDJXLcsfuDVjH2iJ7I7sXNvei/eLPISh8Gj/2A+Jp+9uNRxVxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR05MB3055
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
Cc: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTAzLTIxIGF0IDE0OjU4ICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Ogo+IOKaoCBFeHRlcm5hbCBFbWFpbDogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lk
ZSBvZiB0aGUKPiBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFj
aG1lbnRzIHVubGVzcyB5b3UKPiByZWNvZ25pemUgdGhlIHNlbmRlci4KPiAKPiBJbnN0ZWFkIHVz
ZSB0aGUgbmV3IGRtYV9yZXN2X2dldF9zaW5nbGV0b24gZnVuY3Rpb24uCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IFJldmll
d2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IENjOiBWTXdh
cmUgR3JhcGhpY3MgPGxpbnV4LWdyYXBoaWNzLW1haW50YWluZXJAdm13YXJlLmNvbT4KPiBDYzog
WmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X3Jlc291cmNlLmMgfCA2ICsrKystLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfcmVzb3VyY2UuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfcmVzb3VyY2UuYwo+IGluZGV4IDcwODg5OWJhMjEwMi4uMzZjM2I1ZGI3ZTY5IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3Jlc291cmNlLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9yZXNvdXJjZS5jCj4gQEAgLTExNjUs
OCArMTE2NSwxMCBAQCBpbnQgdm13X3Jlc291cmNlc19jbGVhbihzdHJ1Y3QKPiB2bXdfYnVmZmVy
X29iamVjdCAqdmJvLCBwZ29mZl90IHN0YXJ0LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB2bXdfYm9fZmVuY2Vfc2luZ2xlKGJvLCBOVUxMKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgKGJvLT5tb3ZpbmcpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfZmVuY2VfcHV0KGJvLT5tb3ZpbmcpOwo+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvLT5tb3ZpbmcgPSBkbWFfZmVuY2VfZ2V0Cj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChkbWFfcmVzdl9leGNsX2Zl
bmNlKGJvLT5iYXNlLnJlc3YpKTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LyogVE9ETzogVGhpcyBpcyBhY3R1YWxseSBhIG1lbW9yeSBtYW5hZ2VtZW50Cj4gZGVwZW5kZW5j
eSAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBkbWFfcmVzdl9nZXRf
c2luZ2xldG9uKGJvLT5iYXNlLnJlc3YsIGZhbHNlLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICZiby0+bW92aW5nKTsKPiDCoMKgwqDCoMKgwqDCoCB9Cj4gCj4gwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIDA7Cj4gLS0KPiAyLjI1LjEKPiAKClNvcnJ5LCBJIGhhdmVuJ3QgaGFkIHRo
ZSB0aW1lIHRvIGdvIG92ZXIgdGhlIGVudGlyZSBzZXJpZXMsIHRoZSBwYXRjaApsb29rcyBnb29k
LCBidXQgd2hhdCdzIHRoZSBtZW1vcnkgbWFuYWdlbWVudCBkZXBlbmRlbmN5IHRoZSB0b2RvCm1l
bnRpb25zPwoKegoK
