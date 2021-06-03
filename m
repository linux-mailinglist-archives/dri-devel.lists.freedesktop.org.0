Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BC73996C5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 02:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BF86EEA7;
	Thu,  3 Jun 2021 00:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3846EEA7;
 Thu,  3 Jun 2021 00:07:53 +0000 (UTC)
IronPort-SDR: fRmgQ3C0nN30QBwHJ1glNreyNnu0j7J3K04t4dxT+jLUweR6VCx5WCpGECvx55m1dhnMXm/r4j
 NWxq6U4Fu6Tg==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="200914166"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="200914166"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 17:07:51 -0700
IronPort-SDR: 2fQUTZQKLa7bHJMiPRnBiEh26GaFD0Rpa/UsLSFD06veb0GfY3X3LJExXrhSId3yl/72f8TqW2
 rknuHtSSMsmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="633505121"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga006.fm.intel.com with ESMTP; 02 Jun 2021 17:07:51 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 2 Jun 2021 17:07:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Wed, 2 Jun 2021 17:07:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Wed, 2 Jun 2021 17:07:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuYRz8QzwMuxZo8weopUX/4gjJDWS+jeTFa38VSrxDRNLEOan540clhQ5jL9OqqpgPWxeHgloOEhwkeZdQbYz2y7Lh93LosQkpfRBvmeP2nO/MY6y0EdFhjeEjhZBgObcpsHiJIAa4YNMfm/chIFRZAIfeWLFrHWO2bH7QnfCa4AdBQf2OHUzLp3v8v9wt/n06J4zO5Ir6rvrBWCQ1kr3uVn6fuUlEYPYW9dEGPVrkVs9FWCq4fMAck7uikXesGVUWXFvFKaLfvA/3Y+ORz1dmkg8xVOGh7WQecIiCMKZUqOd974S1MS3NfSvQ1HVeFHCSb3R8hlodw6D/N2j1BuVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2rgIKamgzym9/MrLzbzrc9j6/E016Dylf5Qqol7x/M=;
 b=m9P424FR1F0yQs2Kejrt/7rCKp0wKpZVIs2WPvoBsG6aZvSaEM7L7x/Ns9s19Usv5TN+G01FnUYLUQ0lkLcGiBJywOBroM1udlG/GuTJy1u2qWI4EcIqRAIiZu/mtGLsaY4Smax4Ndai3q4DG9LBp21Ly8UYqQt9IbrROj/KBsg2wt2nU0DeMilc/rU9J10TBq2GfHNce3PlcoQXRE9VcYKaViQPx293rm6h9JzMfx+cN6oPS2k977xlDUfy/wyJiVHJrR769ouTduLxIv11yPQFoxMYTnFR3RI1siIP+taGFCuQ/wtkaiIsCupNf6xtv4vNCoibH2HtN70behAb+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2rgIKamgzym9/MrLzbzrc9j6/E016Dylf5Qqol7x/M=;
 b=V1QKkp6fUHEioYhMR6+90udMtQePI/DRxdf4W07BbDxHjDMkSmkNyulAtXQj+N4zzqKRlW81zFaibneFSay0RVJ6FydH6HgOH2ghl/drAdebcMSNmZfY77MUa7feIo+x3nAZDKuZbcYmFZ+WwvYZHaDu5tAJRYODzSYSnK1IhHo=
Received: from BYAPR11MB3784.namprd11.prod.outlook.com (2603:10b6:a03:fe::10)
 by BYAPR11MB3173.namprd11.prod.outlook.com (2603:10b6:a03:1d::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Thu, 3 Jun
 2021 00:07:17 +0000
Received: from BYAPR11MB3784.namprd11.prod.outlook.com
 ([fe80::492:b03:847d:aa8c]) by BYAPR11MB3784.namprd11.prod.outlook.com
 ([fe80::492:b03:847d:aa8c%6]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 00:07:17 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v4 06/17] drm/i915/pxp: Implement funcs to
 create the TEE channel
Thread-Topic: [Intel-gfx] [PATCH v4 06/17] drm/i915/pxp: Implement funcs to
 create the TEE channel
Thread-Index: AQHXUSmkG9c1ydcXKkOw0zCwORZ/Y6sBdn6A
Date: Thu, 3 Jun 2021 00:07:16 +0000
Message-ID: <28c1689132ce15f8c88e714aafb7d630555ec3a4.camel@intel.com>
References: <20210525054803.7387-1-daniele.ceraolospurio@intel.com>
 <20210525054803.7387-7-daniele.ceraolospurio@intel.com>
In-Reply-To: <20210525054803.7387-7-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.4-0ubuntu1 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08450d4c-9e9d-496e-5881-08d926238c6f
x-ms-traffictypediagnostic: BYAPR11MB3173:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3173D202079A322AF15E8DB88A3C9@BYAPR11MB3173.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YfzD7W3aZgm1CNlSFboK7R/sp7xbMjD8YOid12Kg/I7bTElYe8C63kLP0EPbb/W/dPfETGZFhL/lM+I+Lxz0DOPfvOY0k8ex53VM8KHboPCzAVmKhoTe9JqFS0zJJ9us5aTpRZapT0m0DrVsTjwpcbgDUwprhO1/OSnRFKVg+vXzQYmekYqr+hV6mCGhvcrLf8thADOItvsZs37wvq6iwlGBNYCdhaXMafnh821EMUvr9AyetP2uf1YY20QSuDOIo2ZJ/OTOzajUZzzWQeuEUhiXrLhZ+vhR2KSEMrNPNLNv0WssVpE+9zpY6BhQOhpWLxzB2y8czjBKscTpKc2QMLBRMOA6mGvgobGkvxN9e/hBl8Y31NSC8u0qvQ+hQYMoxfZRJf2VVkJqWAMVKPDFuLPlAK/BWkxmS8seGVrB2dJA/Ej8zPR8jO2+g17BEBzp1GVq7/DiH5S29wIOmNK++qVL/PjQ8D8f2wtEK+64DtLdlfW7ZtVk1R3vXaqsPRfymS/4iUpfImp0XkQGI2+6Ziw9ggylY/qdr4Ir6sczw2ldILkg45t83SoQGdC5rzxJ5sUbkwes8LUFKYJHV4gkDZkwP0HCwvAZIVLEY5c/57M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3784.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(396003)(136003)(376002)(39860400002)(186003)(66946007)(76116006)(66556008)(66476007)(83380400001)(66446008)(122000001)(478600001)(86362001)(64756008)(4326008)(2906002)(38100700002)(26005)(6486002)(8676002)(6506007)(8936002)(6512007)(316002)(54906003)(36756003)(110136005)(71200400001)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VlEwMVBkQU1kY0xSSElxbGtDOWZZWTM1c0lyY3RwVStOQzRDblRnVUxMUjZw?=
 =?utf-8?B?V01vcE9RT3lzQVJpUVFMUUFtVVliMFc5bUIrTC8raC9UT21VYnhRVnBOQzBY?=
 =?utf-8?B?ZFpsMUVFNDR0c0hzZGg3d1JqWGtubnFOQS9jWmY4RGd0SENyUHdxLzJNb2NM?=
 =?utf-8?B?L05Uc0M1WkZxK0NxcUw5MCt2VUZ0cGUwZnJ6ZER6VVQ1eGg4RUE1VVc4QkpG?=
 =?utf-8?B?emtLU1BpZGlNZE5VZlFJZmpzQzR5MkFvenRSNm5aWWNUMVRJKzdnQWhib1pa?=
 =?utf-8?B?a09GWFg4RE5neE5OU1ZLaGtTMFM2bmZRcnU3VXpFNmJWMkJJL1ExWDZYaTQy?=
 =?utf-8?B?bC9OK2FjMUdwNnROOFNkSlpGL0ZZd1ZveTBKeXZGTlNLUFVGU1VteEdZQm9B?=
 =?utf-8?B?ekJIUzdJOUpBeGJadkx2MjFtWWJudWc0K1YzeHBqZVpLbW4wSzFpOTNWRy9q?=
 =?utf-8?B?c1VTZytKYzRObng5V2VVYVVEbW5GUDMwcHdUenNBUWpMdzV3bUI5d2xmVTgx?=
 =?utf-8?B?M1ZBTWJIY0Y1ZUVBVkthL3VtdnVSWVNLQ2pvRlBQazhwazVuUHkwaHhxK2hF?=
 =?utf-8?B?MnNkeTFJSS81dHdyU1YrVmw5dWNTRkxuMGpaTUpoZ05BeGlaOFRMa0ZMSXE0?=
 =?utf-8?B?V1NDTFVlS0Y5QWhBWCtTRTlFWk12QloweStYU0R0dWs0cmVKcVVZZE1ycEtq?=
 =?utf-8?B?cWtRQm02THlIai9peWVzTjRYQ0gxb3hDS1RYR0hOS2tLVmw4Z3lzb09Lckgv?=
 =?utf-8?B?N05FOHpsRElHTEZDRTdDanBBS2lFSzZ4TjY1dmg5R0hoYnJkRE4rQ200WXcy?=
 =?utf-8?B?aWJhNVorSE9iRGE3QnRjcktlc2prR244U0w1WXdUODAwNSsyNEEwSjlSSXhZ?=
 =?utf-8?B?ZnZRSjVsR0liZ3ZvRlFwbFdWOFVXY0JRUU03ZVg1aU1XWWRDY1pRUnovM3NK?=
 =?utf-8?B?YjYrMU0vK2ZmZTd5VFpETjNqSE4yeVV0MDJGRXhpZEd5Qzd5WlJCSjVaVHo3?=
 =?utf-8?B?dVYrT0tMRFFQd0pOVjdBVUhWWXNhV1lnWFZHWjV3SUVzU0x2K2dteWljck9y?=
 =?utf-8?B?Rnc2SjQ5NWwyTEM3M0xJZnA0OVdUTkcySHlNSzdvT3R0U20rd0JZZThQbHI2?=
 =?utf-8?B?YXZ1U081YU5XUGVDQjVaZlJKWGppWitZV2k0cFErK0d4ZTVhTjVjc1p3b0Yw?=
 =?utf-8?B?OFdjRWprbVlxajlTNGVMOWV6UkMrNXY1RitzcjNnVTl2RWpTQlVQR0U3czdJ?=
 =?utf-8?B?NnpmUWluU253cjZQd1NYUDhZZ2daSUtiMlpiSXNDRDJNK09BUUswVTJydlgx?=
 =?utf-8?B?U0NaUEEyTTJzTFdLdnVaemxxTTNrRDRuOE1scFBqTTNZTjROTnRxcTFtUjdn?=
 =?utf-8?B?N0FaZUNCN2pBdnRwOXhUKzVvQTY2bU1rQnQ4cE9QRzM1anh4ZHFZNzBPOEFj?=
 =?utf-8?B?ems3RmNoY3pwTllwSE1jczU2WklrUmlWOWFOb1UzTXZDbzI1eXV5REhvaGZJ?=
 =?utf-8?B?Z2lFMHNJcTR3U0RaUXNUeWduV3NvbDk4TTVyKzdSWlkvSVNDVFRpbFJPL0dM?=
 =?utf-8?B?QUtpd3RGV25YT1hQRWQ3bFNETG5pYWZrVGVNMjdMMUpleVRtVmpZVm1MYUZL?=
 =?utf-8?B?R1ZBTVIwMC9WK1ZPOHk4Wk9lZG5EWllQNkJuVjNtenU0NEFrSmdEUW8zc1Ar?=
 =?utf-8?B?c1oxQ09RMmFOcWxldXIyZU1wNTl4bFJ1bGVxcFA3MTUwZXFSVWxMbnN2VnJC?=
 =?utf-8?Q?LhPZcWFlA9VUnRqDnyGePq5elPkU633b3CCzcu5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F21D8F4752CB0A4D97FCDF9C9D71B8A2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3784.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08450d4c-9e9d-496e-5881-08d926238c6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 00:07:16.9755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j4deqRS63uHSZ9Bl+GvQrNrfTKO+NqbQiYQwX7KBDJXUwtPDbOxwuT2QAjlTIV7RMc/5I7fV78djCdz5DXH7pCRAwNaCp35JnUNsVQ010hLujB04cRV87J8zDCjHjEd8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3173
X-OriginatorOrg: intel.com
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
Cc: "Huang@freedesktop.org" <Huang@freedesktop.org>,
 "sean.z.huang@intel.com" <sean.z.huang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIxLTA1LTI0IGF0IDIyOjQ3IC0wNzAwLCBEYW5pZWxlIENlcmFvbG8gU3B1cmlv
IHdyb3RlOg0KPiBGcm9tOiAiSHVhbmcsIFNlYW4gWiIgPHNlYW4uei5odWFuZ0BpbnRlbC5jb20+
DQo+IA0KPiBJbXBsZW1lbnQgdGhlIGZ1bmNzIHRvIGNyZWF0ZSB0aGUgVEVFIGNoYW5uZWwsIHNv
IGtlcm5lbCBjYW4NCj4gc2VuZCB0aGUgVEVFIGNvbW1hbmRzIGRpcmVjdGx5IHRvIFRFRSBmb3Ig
Y3JlYXRpbmcgdGhlIGFyYml0cmFyeQ0KPiAoZGVmYXVsdCkgc2Vzc2lvbi4NCj4gDQo+IHYyOiBm
aXggbG9ja2luZywgZG9uJ3QgcG9sbHV0ZSBkZXZfcHJpdiAoQ2hyaXMpDQo+IA0KPiB2Mzogd2Fp
dCBmb3IgbWVpIFBYUCBjb21wb25lbnQgdG8gYmUgYm91bmQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBIdWFuZywgU2VhbiBaIDxzZWFuLnouaHVhbmdAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDwNCj4gZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVs
LmNvbT4NCj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPg0KPiBS
ZXZpZXdlZC1ieTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPiAjdjINCj4g
LS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgMyAr
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cC5jICAgICAgIHwgMTMgKysr
Kw0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF90ZWUuYyAgIHwgODcNCj4g
KysrKysrKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVs
X3B4cF90ZWUuaCAgIHwgMTQgKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVs
X3B4cF90eXBlcy5oIHwgIDMgKw0KPiAgNSBmaWxlcyBjaGFuZ2VkLCAxMTkgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9p
OTE1L3B4cC9pbnRlbF9weHBfdGVlLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX3RlZS5oDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9NYWtlZmls
ZQ0KPiBpbmRleCBlZmQ5NTAxMjJlNDAuLjBkZmZmNTJmZWEyNCAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
TWFrZWZpbGUNCj4gQEAgLTI3NSw3ICsyNzUsOCBAQCBpOTE1LXkgKz0gaTkxNV9wZXJmLm8NCj4g
IA0KPiAgIyBQcm90ZWN0ZWQgZXhlY3V0aW9uIHBsYXRmb3JtIChQWFApIHN1cHBvcnQNCj4gIGk5
MTUtJChDT05GSUdfRFJNX0k5MTVfUFhQKSArPSBcDQo+IC0JcHhwL2ludGVsX3B4cC5vDQo+ICsJ
cHhwL2ludGVsX3B4cC5vIFwNCj4gKwlweHAvaW50ZWxfcHhwX3RlZS5vDQo+ICANCj4gICMgUG9z
dC1tb3J0ZW0gZGVidWcgYW5kIEdQVSBoYW5nIHN0YXRlIGNhcHR1cmUNCj4gIGk5MTUtJChDT05G
SUdfRFJNX0k5MTVfQ0FQVFVSRV9FUlJPUikgKz0gaTkxNV9ncHVfZXJyb3Iubw0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cC5jDQo+IGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cC5jDQo+IGluZGV4IDMyNTVjNmRhMzRlOC4uNWRmMmEw
OWM5ZTRiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhw
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cC5jDQo+IEBAIC0z
LDYgKzMsNyBAQA0KPiAgICogQ29weXJpZ2h0KGMpIDIwMjAgSW50ZWwgQ29ycG9yYXRpb24uDQo+
ICAgKi8NCj4gICNpbmNsdWRlICJpbnRlbF9weHAuaCINCj4gKyNpbmNsdWRlICJpbnRlbF9weHBf
dGVlLmgiDQo+ICAjaW5jbHVkZSAiZ3QvaW50ZWxfY29udGV4dC5oIg0KPiAgI2luY2x1ZGUgImk5
MTVfZHJ2LmgiDQo+ICANCj4gQEAgLTUwLDcgKzUxLDE2IEBAIHZvaWQgaW50ZWxfcHhwX2luaXQo
c3RydWN0IGludGVsX3B4cCAqcHhwKQ0KPiAgCWlmIChyZXQpDQo+ICAJCXJldHVybjsNCj4gIA0K
PiArCXJldCA9IGludGVsX3B4cF90ZWVfY29tcG9uZW50X2luaXQocHhwKTsNCj4gKwlpZiAocmV0
KQ0KPiArCQlnb3RvIG91dF9jb250ZXh0Ow0KPiArDQo+ICAJZHJtX2luZm8oJmd0LT5pOTE1LT5k
cm0sICJQcm90ZWN0ZWQgWGUgUGF0aCAoUFhQKSBwcm90ZWN0ZWQNCj4gY29udGVudCBzdXBwb3J0
IGluaXRpYWxpemVkXG4iKTsNCj4gKw0KPiArCXJldHVybjsNCj4gKw0KPiArb3V0X2NvbnRleHQ6
DQo+ICsJZGVzdHJveV92Y3NfY29udGV4dChweHApOw0KPiAgfQ0KPiAgDQo+ICB2b2lkIGludGVs
X3B4cF9maW5pKHN0cnVjdCBpbnRlbF9weHAgKnB4cCkNCj4gQEAgLTU4LDUgKzY4LDggQEAgdm9p
ZCBpbnRlbF9weHBfZmluaShzdHJ1Y3QgaW50ZWxfcHhwICpweHApDQo+ICAJaWYgKCFpbnRlbF9w
eHBfaXNfZW5hYmxlZChweHApKQ0KPiAgCQlyZXR1cm47DQo+ICANCj4gKwlpbnRlbF9weHBfdGVl
X2NvbXBvbmVudF9maW5pKHB4cCk7DQo+ICsNCj4gIAlkZXN0cm95X3Zjc19jb250ZXh0KHB4cCk7
DQo+ICsNCj4gIH0NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRl
bF9weHBfdGVlLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX3RlZS5j
DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNGVkMjM0ZDg1
ODRmDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2lu
dGVsX3B4cF90ZWUuYw0KPiBAQCAtMCwwICsxLDg3IEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogTUlUDQo+ICsvKg0KPiArICogQ29weXJpZ2h0KGMpIDIwMjAgSW50ZWwgQ29ycG9y
YXRpb24uDQo+ICsgKi8NCj4gKw0KPiArI2luY2x1ZGUgPGxpbnV4L2NvbXBvbmVudC5oPg0KPiAr
I2luY2x1ZGUgImRybS9pOTE1X3B4cF90ZWVfaW50ZXJmYWNlLmgiDQo+ICsjaW5jbHVkZSAiZHJt
L2k5MTVfY29tcG9uZW50LmgiDQo+ICsjaW5jbHVkZSAiaTkxNV9kcnYuaCINCj4gKyNpbmNsdWRl
ICJpbnRlbF9weHAuaCINCj4gKyNpbmNsdWRlICJpbnRlbF9weHBfdGVlLmgiDQo+ICsNCj4gK3N0
YXRpYyBpbmxpbmUgc3RydWN0IGludGVsX3B4cCAqaTkxNV9kZXZfdG9fcHhwKHN0cnVjdCBkZXZp
Y2UNCj4gKmk5MTVfa2RldikNCj4gK3sNCj4gKwlyZXR1cm4gJmtkZXZfdG9faTkxNShpOTE1X2tk
ZXYpLT5ndC5weHA7DQo+ICt9DQo+ICsNCj4gKy8qKg0KPiArICogaTkxNV9weHBfdGVlX2NvbXBv
bmVudF9iaW5kIC0gYmluZCBmdW5jdGlvbiB0byBwYXNzIHRoZSBmdW5jdGlvbg0KPiBwb2ludGVy
cyB0byBweHBfdGVlDQo+ICsgKiBAaTkxNV9rZGV2OiBwb2ludGVyIHRvIGk5MTUga2VybmVsIGRl
dmljZQ0KPiArICogQHRlZV9rZGV2OiBwb2ludGVyIHRvIHRlZSBrZXJuZWwgZGV2aWNlDQo+ICsg
KiBAZGF0YTogcG9pbnRlciB0byBweHBfdGVlX21hc3RlciBjb250YWluaW5nIHRoZSBmdW5jdGlv
biBwb2ludGVycw0KPiArICoNCj4gKyAqIFRoaXMgYmluZCBmdW5jdGlvbiBpcyBjYWxsZWQgZHVy
aW5nIHRoZSBzeXN0ZW0gYm9vdCBvciByZXN1bWUNCj4gZnJvbSBzeXN0ZW0gc2xlZXAuDQo+ICsg
Kg0KPiArICogUmV0dXJuOiByZXR1cm4gMCBpZiBzdWNjZXNzZnVsLg0KPiArICovDQo+ICtzdGF0
aWMgaW50IGk5MTVfcHhwX3RlZV9jb21wb25lbnRfYmluZChzdHJ1Y3QgZGV2aWNlICppOTE1X2tk
ZXYsDQo+ICsJCQkJICAgICAgIHN0cnVjdCBkZXZpY2UgKnRlZV9rZGV2LCB2b2lkDQo+ICpkYXRh
KQ0KPiArew0KPiArCXN0cnVjdCBpbnRlbF9weHAgKnB4cCA9IGk5MTVfZGV2X3RvX3B4cChpOTE1
X2tkZXYpOw0KPiArDQo+ICsJcHhwLT5weHBfY29tcG9uZW50ID0gZGF0YTsNCj4gKwlweHAtPnB4
cF9jb21wb25lbnQtPnRlZV9kZXYgPSB0ZWVfa2RldjsNCj4gKw0KPiArCXJldHVybiAwOw0KPiAr
fQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBpOTE1X3B4cF90ZWVfY29tcG9uZW50X3VuYmluZChzdHJ1
Y3QgZGV2aWNlICppOTE1X2tkZXYsDQo+ICsJCQkJCSAgc3RydWN0IGRldmljZSAqdGVlX2tkZXYs
IHZvaWQNCj4gKmRhdGEpDQo+ICt7DQo+ICsJc3RydWN0IGludGVsX3B4cCAqcHhwID0gaTkxNV9k
ZXZfdG9fcHhwKGk5MTVfa2Rldik7DQo+ICsNCj4gKwlweHAtPnB4cF9jb21wb25lbnQgPSBOVUxM
Ow0KPiArfQ0KPiArDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGNvbXBvbmVudF9vcHMgaTkxNV9w
eHBfdGVlX2NvbXBvbmVudF9vcHMgPSB7DQo+ICsJLmJpbmQgICA9IGk5MTVfcHhwX3RlZV9jb21w
b25lbnRfYmluZCwNCj4gKwkudW5iaW5kID0gaTkxNV9weHBfdGVlX2NvbXBvbmVudF91bmJpbmQs
DQo+ICt9Ow0KPiArDQo+ICtpbnQgaW50ZWxfcHhwX3RlZV9jb21wb25lbnRfaW5pdChzdHJ1Y3Qg
aW50ZWxfcHhwICpweHApDQo+ICt7DQo+ICsJaW50IHJldDsNCj4gKwlzdHJ1Y3QgaW50ZWxfZ3Qg
Kmd0ID0gcHhwX3RvX2d0KHB4cCk7DQo+ICsJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUg
PSBndC0+aTkxNTsNCj4gKw0KPiArCXJldCA9IGNvbXBvbmVudF9hZGRfdHlwZWQoaTkxNS0+ZHJt
LmRldiwNCj4gJmk5MTVfcHhwX3RlZV9jb21wb25lbnRfb3BzLA0KPiArCQkJCSAgSTkxNV9DT01Q
T05FTlRfUFhQKTsNCj4gKwlpZiAocmV0IDwgMCkgew0KPiArCQlkcm1fZXJyKCZpOTE1LT5kcm0s
ICJGYWlsZWQgdG8gYWRkIFBYUCBjb21wb25lbnQNCj4gKCVkKVxuIiwgcmV0KTsNCj4gKwkJcmV0
dXJuIHJldDsNCj4gKwl9DQo+ICsNCj4gKwkvKg0KPiArCSAqIEFkZGluZyB0aGUgY29tcG9uZW50
IGRvZXMgbm90IGd1YXJhbnRlZSB0aGF0IGl0IHdpbGwgYmluZA0KPiBwcm9wZXJseSwNCj4gKwkg
KiBzbyBtYWtlIHN1cmUgdG8gd2FpdCB1bnRpbCBpdCBkb2VzLg0KPiArCSAqLw0KPiArCXJldCA9
IHdhaXRfZm9yKHB4cC0+cHhwX2NvbXBvbmVudCwgNTApOw0KPiArCWlmIChyZXQpIHsNCj4gKwkJ
ZHJtX2VycigmaTkxNS0+ZHJtLCAiRmFpbGVkIHRvIGJpbmQgUFhQIGNvbXBvbmVudCANCg0KQmFz
ZWQgb24gbXkgdGVzdGluZyB3aXRoIHRoZSAnd2lwLWlndC1weHAnLCB0aGlzIGZhaWxlZCBoZXJl
IGJlY2F1c2UNCnRoZSBtZWktcHhwIHdhcyBnZXR0aW5nIGxvYWRlZCBtdWx0aXBsZSBzZWNvbmRz
IGxhdGVyIHRoYW4gaTkxNS4gV2UNCm1pZ2h0IG5lZWQgdG8gY29uc2lkZXIgaGF2aW5nIGEgY2hl
Y2sgZm9yIHB4cF9jb21wb25lbnQgYXZhaWxhYmlsaXR5IG9uDQpldmVyeSBJT0NUTCB0byBlbnN1
cmUgYmluZGluZyBhY3R1YWxseSBvY2N1cmVkIGFuZCBzdWNjZWVkICg9PXB4cC0NCnN1cHBvcnRl
ZCksIG9yIG9jY3VyZWQgYW5kIGZhaWxlZCAoPT1weHAtZmFpbGVkLCBkaXNhYmxlIGl0KSwgb3Ig
ZGlkbid0DQpvY2N1cmUgeWV0ICg9PXBlbmRpbmctcmV0cnk/KS4NCg0KPiAoJWQpXG4iLCByZXQp
Ow0KPiArCQlyZXR1cm4gcmV0Ow0KPiArCX0NCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiAr
DQo+ICt2b2lkIGludGVsX3B4cF90ZWVfY29tcG9uZW50X2Zpbmkoc3RydWN0IGludGVsX3B4cCAq
cHhwKQ0KPiArew0KPiArCXN0cnVjdCBpbnRlbF9ndCAqZ3QgPSBweHBfdG9fZ3QocHhwKTsNCj4g
KwlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IGd0LT5pOTE1Ow0KPiArDQo+ICsJaWYg
KCFweHAtPnB4cF9jb21wb25lbnQpDQo+ICsJCXJldHVybjsNCj4gKw0KPiArCWNvbXBvbmVudF9k
ZWwoaTkxNS0+ZHJtLmRldiwgJmk5MTVfcHhwX3RlZV9jb21wb25lbnRfb3BzKTsNCj4gK30NCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfdGVlLmgNCj4g
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX3RlZS5oDQo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMjNkMDUwYTVkM2U3DQo+IC0tLSAvZGV2
L251bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF90ZWUuaA0K
PiBAQCAtMCwwICsxLDE0IEBADQo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICov
DQo+ICsvKg0KPiArICogQ29weXJpZ2h0KGMpIDIwMjAsIEludGVsIENvcnBvcmF0aW9uLiBBbGwg
cmlnaHRzIHJlc2VydmVkLg0KPiArICovDQo+ICsNCj4gKyNpZm5kZWYgX19JTlRFTF9QWFBfVEVF
X0hfXw0KPiArI2RlZmluZSBfX0lOVEVMX1BYUF9URUVfSF9fDQo+ICsNCj4gKyNpbmNsdWRlICJp
bnRlbF9weHAuaCINCj4gKw0KPiAraW50IGludGVsX3B4cF90ZWVfY29tcG9uZW50X2luaXQoc3Ry
dWN0IGludGVsX3B4cCAqcHhwKTsNCj4gK3ZvaWQgaW50ZWxfcHhwX3RlZV9jb21wb25lbnRfZmlu
aShzdHJ1Y3QgaW50ZWxfcHhwICpweHApOw0KPiArDQo+ICsjZW5kaWYgLyogX19JTlRFTF9QWFBf
VEVFX0hfXyAqLw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVs
X3B4cF90eXBlcy5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF90eXBl
cy5oDQo+IGluZGV4IGJkMTJjNTIwZTYwYS4uM2U5NWQyMTUxM2U4IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX3R5cGVzLmgNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF90eXBlcy5oDQo+IEBAIC03LDggKzcsMTEgQEAN
Cj4gICNkZWZpbmUgX19JTlRFTF9QWFBfVFlQRVNfSF9fDQo+ICANCj4gIHN0cnVjdCBpbnRlbF9j
b250ZXh0Ow0KPiArc3RydWN0IGk5MTVfcHhwX2NvbXBvbmVudDsNCj4gIA0KPiAgc3RydWN0IGlu
dGVsX3B4cCB7DQo+ICsJc3RydWN0IGk5MTVfcHhwX2NvbXBvbmVudCAqcHhwX2NvbXBvbmVudDsN
Cj4gKw0KPiAgCXN0cnVjdCBpbnRlbF9jb250ZXh0ICpjZTsNCj4gIH07DQo+ICANCg==
