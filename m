Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 918C442F9E5
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 19:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9B96E334;
	Fri, 15 Oct 2021 17:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415826E334
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 17:16:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="208755569"
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="208755569"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 10:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="488509350"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 15 Oct 2021 10:16:04 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 15 Oct 2021 10:16:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 15 Oct 2021 10:16:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 15 Oct 2021 10:16:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+bbjEbdqwXk+PGPrlhlMqXkqlbsq8HqS8NgBTyAu1NYCelR3t1AaSuYB4XIhFS/74Fxvy3X8vLjdUMS3T3vJn8PLxa3tfg4pmERFsF3PIUiUaMJlNaMiDgiIdgt9FYIzcyWILGTGNHVUbCUFTLT78ifryMsxFs+PnPFgI9qm6ZkTNR62YW/OYFsmzZiUyvtcVsLpMYHT1PtUPXRCGbFrQ+PI8z9eU7iuKD36trxg1W7TCjxs0sqdXTawLhgRvQc/hd3RX4QDd6zUjlWvtoCRGIZ07DQHQWuXynsR4cQUiRxaJLt2Dd3iloe3My0RXCNL+Xx4bcN1RjHgUS1jLbDJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZYufEmNFMI/OxFCk+8EfHYNMoX5m3gRDeiroF14yKQ=;
 b=RadII8Mr0A4VQSlVOeDZeTy1oGqGQNAbXxqw3oaC0nFLb6ry5q7TuDgSq3B/h7HHY3L7Gq8hsb9FePeOE5395mYtUmXdNMRATx9qZqjLdyP3ggYcwMK2jdXrEcvjrvYoM0EfYGwLggAD1Omn1Kv/h3gF0kpx/Nq33ibQONexuYd2hxasibK2QGNX09cWL6RFHkMc+iApbQ/rUAQkpCSqEJBtY1VcyHJ2HwiKbEjDlDjDJES9xhF+YqAYGuzidIPCWusN4jOnfRrVkl5K/bR90Cn+YwPqbtzU5R9U6RR+vw9rJ7H9hSB4erjyaLgIpMGTy1qONciH0h5Q+ffS4VHmAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZYufEmNFMI/OxFCk+8EfHYNMoX5m3gRDeiroF14yKQ=;
 b=ljE9TwTvRYpXW7RX04tjHh1sGeskcPthPqIp5jwN0C0d4rZYL4tVLG0AEzHRfJdPjksgoQNTiP3IzR4QyObGyQtjsYw+KMH8ZIDm5xAnIu7VThMO0YBkANbE+Ic8jeiwivjokbWE0AjJDg8hAHjLXG0GtXdSfUx2HW2C4Vn/ELc=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Fri, 15 Oct
 2021 17:16:03 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::18c0:1369:4bff:1835]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::18c0:1369:4bff:1835%7]) with mapi id 15.20.4587.030; Fri, 15 Oct 2021
 17:16:03 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "sam@ravnborg.org" <sam@ravnborg.org>, "Dea, Edmund J"
 <edmund.j.dea@intel.com>
Subject: RE: [PATCH v3 7/7] drm/kmb: Enable support for framebuffer console
Thread-Topic: [PATCH v3 7/7] drm/kmb: Enable support for framebuffer console
Thread-Index: AQHXwItRpfWINtcgfkC/eglMwnZayKvSeAmAgAHLApA=
Date: Fri, 15 Oct 2021 17:16:03 +0000
Message-ID: <BY5PR11MB4182C37A9D184A4D1D88D9338CB99@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20211013233632.471892-1-anitha.chrisanthus@intel.com>
 <20211013233632.471892-7-anitha.chrisanthus@intel.com>
 <b182a5b4-84d2-44a1-165f-728e9e8046e5@suse.de>
In-Reply-To: <b182a5b4-84d2-44a1-165f-728e9e8046e5@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17015336-481a-4adb-886a-08d98fff776e
x-ms-traffictypediagnostic: BY5PR11MB3909:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB390990BB7FB663D5E75AEC608CB99@BY5PR11MB3909.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b74G04JLRE4WDmv6YCCq5JpS4sOA4cjksw2sLkvttXchOAJJ6jSowNCk44xM+glmpjdQQ2pdPsCJpEfI5wAKG+i/H/kkQ2iT3/eel3UzEusZHy+0LuNtdZ9V2RYnB+p5EySZdhhZlgXYaBJsKunT2Hn1II3CkPMAUnlvMER8HsmyoumlgdPOzzYqtbzvo/KPxxMlDWQZp4xtGnifR8w9d9KImiaD0f0BPzuSTg6hGS+dJQAtAnHTunr5lBm83tVWXIu1/JYORwJaMetQ+o3w45aNll9eHztu7TKCNzd7u9nylfm/q942ZC6bQVaTDgyw7PnF8yRyalNtm2hgOrvHj2DVwB/kLu1iKcdDxOt/9Gjba6UI5zNYcmdckWiQDQHGWQU5V9CL/gfqxzk/4zKaFknV9OuuAbyhGkoEg+2eHIh0fcc+x4HZqsPbSov0qX1kSFlBxerghm2S3nuHTwOFl062gX4F6UK7Ghqm3n8zBAp5tA81zFUPiUGj8yndTsti6GPaVTxISOMn8OSxuM2Gli4D9UdDx9H0EJ5T9BvMhOflXn0wvQVLbRW0AsFMKB8EAlv78/BmlB71MGXTRsZqu21LRyfdO8v+EGg2k9dsuKs+A3OKTN7FPh6J818x3YDx1pKqwU5sgwG5pyprgtFEtlZTtlSmZj5SZlFyt3fk8GmReLJbIlzdu59r0EqWnA++I0pgabEJi5qxNo79AMF05w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(38070700005)(316002)(38100700002)(122000001)(7696005)(71200400001)(54906003)(110136005)(9686003)(76116006)(64756008)(186003)(66446008)(8676002)(4326008)(33656002)(107886003)(86362001)(6506007)(66476007)(53546011)(66556008)(66946007)(82960400001)(52536014)(508600001)(8936002)(83380400001)(26005)(5660300002)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXZzblhKS291c0tLUVdGemF0YytNdmU3c2dsWmZXaW03SDRYVFR5WEJtZEFz?=
 =?utf-8?B?Nk9wWXlrY0JDeGNUWXQwYVBGenpaa2RTeHVCK1pzZGtlQzZoeHY4dEQvNGpP?=
 =?utf-8?B?aTY2RDlJV1o4enBiNGZHRVVwMlRwdE10RzFkc1pXYUpWY0xZenpGTEg5ZFla?=
 =?utf-8?B?Z3FuM1B3WWFhOHR3TGxqRkpJWU9tczJwblR4OXo0Yk5RUUQ1R3ljNzZGL1VU?=
 =?utf-8?B?a1dWQTJiNTdHL3RrZzFxU0hTQXlRcjVPRjVmVGp5Rm5LMWJMY0J4TEdxWEZs?=
 =?utf-8?B?ZWpIalBhZDdZNkM2MHNUdmprSWo4eTVGa2t2OWQrcTVzL0VHYjJiRVNtQklT?=
 =?utf-8?B?V1VkU1cxNGg5aUxjcUU4dHlYNTFSeEFVNUN0QzlkbmhSVEFjc1NkVjcxMzJH?=
 =?utf-8?B?b3prYlpEUHdQRndUbm1GRVhQYnc2VmdaVGZORHlxR3o2SXBLVE9uUnVmQkJt?=
 =?utf-8?B?Y3VySndnZHZHWk52N3FaZWtERk9zM3MyOHRnSEkzbzhtUURMY2FzTnc0OG41?=
 =?utf-8?B?YU02NWpSSG95cHk1MW9haGE5MEJveVZGVWRibHVBZ3lqemx2THR4SncyVXRZ?=
 =?utf-8?B?TmxtN0xSMU9FdUlNWkJFa3ZiNmd6L2lWVm16R3g5dzBHc0dFMnZEOWxFbW5Z?=
 =?utf-8?B?UVpmc3ZCRXF6TnN4NlpFRlRKWm85d2hJS1NtSkxsc3N2QVREWThmMlB4V0Iv?=
 =?utf-8?B?dEdoMExwcHJCOUJFdzgzRVk0aWc3RVV1ZUllNGM5ZzgzQk1BV2o3S3hhdWJK?=
 =?utf-8?B?VVBZZVcyL2h4enhkdGMyajhJMW84OWZ6Rmg0VC9UTUtLbkI2MkJSTWtWT1dE?=
 =?utf-8?B?SURjaEJ4WFdwejMwVkdRT2pKRFdQdkpaRmIwVnB4NUVFZEJuZm50djd0U2h5?=
 =?utf-8?B?ZkVBUnBjeGd1YURVdEpqVm04NVI5UHk1RWpGZmVTUTRZVDMvbnFzV1JSY00y?=
 =?utf-8?B?MTA4Z29vUWxXejFtL0JCOU9VQnFpNzVybHdnbXpWNk5xbGRJRlhBWnl0QUhl?=
 =?utf-8?B?TE1TMm04RWlVbjJTb1V6eHBpTXk0eE9UVkF5dkxxdUFmZWlKNXdnM1BUYUlI?=
 =?utf-8?B?MlpOZC9yWEpnMXVGREdwcXdmOUZiS2s1RVRualNRZCsrYnhpUTlMVmdwYThQ?=
 =?utf-8?B?N2FKTU5jRWZkQmt1ODRzRjV0azNkaU5JbXFzSkpXZVVvMVNyNUVYRHJ1V1Ru?=
 =?utf-8?B?UTNtT0txY1UycnJDYmRZa21CWjRValE5UEN1Ym43S3FoR3Z6c0d5Wjd1b2NC?=
 =?utf-8?B?ZWJWa3RtRFZxZ3laNi9TWkZoMVF2NWY1TG9xVjRDWW42RHhYWXZxa3VqaWRv?=
 =?utf-8?B?K1hxSEhOVmtNeWVRMHcyL1NyQWtYd2FKakxFVHlnYTVXbTk2NVRMVG5HT2tT?=
 =?utf-8?B?WmcwdkdZeTJmMDNiYkNxOVZMdVVXZDJpMGN1cGJWSnBMamRzQjdHVC9VZ2tH?=
 =?utf-8?B?aDU3U29UY3ZOU2VRUEV6dlBUa05oMUtZY3FjUk56UjhsallMK3hRajAyS0Rq?=
 =?utf-8?B?azJBcGVneTU0bUpXMGhKTHQ3TWY2NFpUd3B3MW9tU2tYSjJaRGhIMnFxRDhp?=
 =?utf-8?B?UUdiSUlDV25QV09lQkJxNWF5aU9BVG00WlRmd3cwQW5xaHZRVTR4ckxYMXBo?=
 =?utf-8?B?ajhLMXd4K0VZdGQvTENMT2RRSkFhT095bVlTQjM1SFBaSHpGeDd0K29TNEpR?=
 =?utf-8?B?eXpnNnB3c2pvaTcwbWNabVBySWRoemVNdTlRcGc4RTYyUDNNRlJVMVk3aWtN?=
 =?utf-8?Q?gXS0zpKwSgZBDvEXLE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17015336-481a-4adb-886a-08d98fff776e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2021 17:16:03.1761 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RidP7wILKJEDjSYdX0Wr1+ZetNxzqphliyRP5LgXgwINQZ6baZQbq5zWi4NzjVR+xhFynYBl5GxgZ41bpnF9IbJhZ3bvEWR+8WusZo5XAsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3909
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLA0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4NCj4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMTQsIDIwMjEgNjowOCBBTQ0KPiBUbzogQ2hy
aXNhbnRodXMsIEFuaXRoYSA8YW5pdGhhLmNocmlzYW50aHVzQGludGVsLmNvbT47IGRyaS0NCj4g
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBzYW1AcmF2bmJvcmcub3JnOyBEZWEs
IEVkbXVuZCBKIDxlZG11bmQuai5kZWFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYzIDcvN10gZHJtL2ttYjogRW5hYmxlIHN1cHBvcnQgZm9yIGZyYW1lYnVmZmVyIGNvbnNvbGUN
Cj4gDQo+IEhpDQo+IA0KPiBBbSAxNC4xMC4yMSB1bSAwMTozNiBzY2hyaWViIEFuaXRoYSBDaHJp
c2FudGh1czoNCj4gPiBFbmFibGUgc3VwcG9ydCBmb3IgZmJjb24gKGZyYW1lYnVmZmVyIGNvbnNv
bGUpLg0KPiA+IFRoZSB1c2VyIGNhbiBpbml0aWFsaXplIGZiY29uIGJ5IGxvYWRpbmcga21iLWRy
bSB3aXRoIHRoZSBwYXJhbWV0ZXINCj4gPiBjb25zb2xlPTEuDQo+ID4NCj4gPiB2MjogYWRkZWQg
bWlzc2luZyBzdGF0aWMgY2xrX2VuYWJsZQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRWRtdW5k
IERlYSA8ZWRtdW5kLmouZGVhQGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbml0aGEg
Q2hyaXNhbnRodXMgPGFuaXRoYS5jaHJpc2FudGh1c0BpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4g
ICBkcml2ZXJzL2dwdS9kcm0va21iL2ttYl9kcnYuYyB8IDExICsrKysrKysrKysrDQo+ID4gICAx
IGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9rbWIva21iX2Rydi5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2ttYi9rbWJf
ZHJ2LmMNCj4gPiBpbmRleCA5NjFhYzZmYjVmY2YuLmI0ZTY2ZWFjNjNiNSAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0va21iL2ttYl9kcnYuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9rbWIva21iX2Rydi5jDQo+ID4gQEAgLTUsNiArNSw3IEBADQo+ID4NCj4gPiAgICNpbmNs
dWRlIDxsaW51eC9jbGsuaD4NCj4gPiAgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gPiAr
I2luY2x1ZGUgPGxpbnV4L21vZHVsZXBhcmFtLmg+DQo+ID4gICAjaW5jbHVkZSA8bGludXgvb2Zf
Z3JhcGguaD4NCj4gPiAgICNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPg0KPiA+ICAgI2lu
Y2x1ZGUgPGxpbnV4L29mX3Jlc2VydmVkX21lbS5oPg0KPiA+IEBAIC0xNSw2ICsxNiw3IEBADQo+
ID4NCj4gPiAgICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4NCj4gPiAgICNpbmNs
dWRlIDxkcm0vZHJtX2Rydi5oPg0KPiA+ICsjaW5jbHVkZSA8ZHJtL2RybV9mYl9oZWxwZXIuaD4N
Cj4gPiAgICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9jbWFfaGVscGVyLmg+DQo+ID4gICAjaW5jbHVk
ZSA8ZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmg+DQo+ID4gICAjaW5jbHVkZSA8ZHJt
L2RybV9wcm9iZV9oZWxwZXIuaD4NCj4gPiBAQCAtMjQsNiArMjYsMTIgQEANCj4gPiAgICNpbmNs
dWRlICJrbWJfZHNpLmgiDQo+ID4gICAjaW5jbHVkZSAia21iX3JlZ3MuaCINCj4gPg0KPiA+ICsv
KiBNb2R1bGUgUGFyYW1ldGVycyAqLw0KPiA+ICtzdGF0aWMgYm9vbCBjb25zb2xlOw0KPiA+ICtt
b2R1bGVfcGFyYW0oY29uc29sZSwgYm9vbCwgMDQwMCk7DQo+ID4gK01PRFVMRV9QQVJNX0RFU0Mo
Y29uc29sZSwNCj4gPiArCQkgIkVuYWJsZSBmcmFtZWJ1ZmZlciBjb25zb2xlIHN1cHBvcnQgKDA9
ZGlzYWJsZSBbZGVmYXVsdF0sDQo+IDE9b24pIik7DQo+ID4gKw0KPiA+ICAgc3RhdGljIGludCBr
bWJfZGlzcGxheV9jbGtfZW5hYmxlKHN0cnVjdCBrbWJfZHJtX3ByaXZhdGUgKmttYikNCj4gPiAg
IHsNCj4gPiAgIAlpbnQgcmV0ID0gMDsNCj4gPiBAQCAtNTU5LDYgKzU2Nyw5IEBAIHN0YXRpYyBp
bnQga21iX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gICAJaWYgKHJl
dCkNCj4gPiAgIAkJZ290byBlcnJfcmVnaXN0ZXI7DQo+ID4NCj4gPiArCWlmIChjb25zb2xlKQ0K
PiA+ICsJCWRybV9mYmRldl9nZW5lcmljX3NldHVwKCZrbWItPmRybSwgMzIpOw0KPiANCj4gVGhl
IHVzZSBvZiB0aGUgZmluYWwgcGFyYW1ldGVyIGlzIHNvbWV3aGF0IGNvbmZ1c2luZyBhbmQgc2hv
dWxkIHByb2JhYmx5DQo+IGJlIDAuIEl0J3MgdGhlIG51bWJlciBvZiBiaXRzIHBlciBwaXhlbC4g
MzIgaXMgdGhlIGRlZmF1bHQuIEJ1dCB0aGUNCj4gcHJlZmVycmVkIHdheSBvZiBzZWxlY3Rpbmcg
Y29sb3IgbW9kZSBpcyB2aWENCj4gZGV2LT5tb2RlX2NvbmZpZy5wcmVmZXJyZWRfZGVwdGgsIHdo
aWNoIGlzIHRoZSBjb2xvciBkZXB0aCAoMjQhKS4gU28NCj4gbWF5YmUgcmF0aGVyIHNldCBwcmVm
ZXJyZWRfZGVwdGggdG8gMjQgYW5kIGxldCB0aGUgZmJkZXYgaGVscGVyIGZpZ3VyZQ0KPiBvdXQg
dGhlIGRldGFpbHMuDQpXaWxsIGNoYW5nZSBpdCBpbiB2NC4NCj4gDQo+IEJlc3QgcmVnYXJkcw0K
PiBUaG9tYXMNCj4gDQo+ID4gKw0KPiA+ICAgCXJldHVybiAwOw0KPiA+DQo+ID4gICAgZXJyX3Jl
Z2lzdGVyOg0KPiA+DQo+IA0KPiAtLQ0KPiBUaG9tYXMgWmltbWVybWFubg0KPiBHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQo+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
PiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCj4gKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQ0KPiBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyDQo=
