Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E995C4072D3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 23:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37506EAB3;
	Fri, 10 Sep 2021 21:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539AC6EAB3;
 Fri, 10 Sep 2021 21:14:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10103"; a="208287163"
X-IronPort-AV: E=Sophos;i="5.85,284,1624345200"; d="scan'208";a="208287163"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 14:14:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,284,1624345200"; d="scan'208";a="607654431"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 10 Sep 2021 14:14:41 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 10 Sep 2021 14:14:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 10 Sep 2021 14:14:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 10 Sep 2021 14:14:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUTH2t+E1YjYUzXeoU92Q5kBTvbjumHICNyog/Eg5vtGvGDCi+rWw4+QRd5Nc8i5yf8S82L0Fx1MWJn+znJFS3QXYe0Z4+ow6LFWrgCgxh5wHuWQlUQjxwfReHTR7ggTuEECntCvJH6iERHwE1zztSH0IpnoKtLTGQkG09Ff3pIsHc+fJgzbWdCOxHP0cTgVDhBwBf2UwwiVgCIjW4+RC9eUqtLl+UBxDO0PJwS7FbvpX4nubg2XswA7xqGNGCaIYUhGnCPrJrtyIzPBseBlsrIN02yNspv1BSQsITyYiP4feb+TtG3Rt24H/VBce8jh1K8pP5L014cQR4g/MnIQlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=GtsAQx+AxI+RrjTI+QiyDpnJnCzatZjF2Y4/6nBrtUI=;
 b=RMgtvnToTtEVZpZMbVPXaVrPiuGTYT+8ixoVIu0Rwf+fTiGFyF19IJ/DarnsXolGG5FpvN5SdSYz2LTUfOIG+75B72i3TmwvAhyWYxQVoi3EiePpPwnqamnButOjZTBqsogeykLHlz+D/Jo5N73sx9APZ+ckLwdxxLNyYRxGKyvnF45i4Uqhr80HZ2RdsikjzaWpffTOVdpgZ0OiLmeEUVRwqVQKQ4lqNA7uRNTlWF0R+vkqVMcfg6cNS/LcHylRlqnhs55WNK8WTtZgCDDpWJ+ihU6hq6doWb8jIjvQEYm+cxE0rNVthjsUKCqE58ikcNaF2rNXgjfcIJYCyOsCJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtsAQx+AxI+RrjTI+QiyDpnJnCzatZjF2Y4/6nBrtUI=;
 b=b6IUN2HbzlUu9H94HZ0rp3bl5Uvv9BUR7zBZjOegTyenYVN1uKgKeUbGRMZuuSS766YzXmq9buWs3whmey/Q3A7Ce3hLH498ifAN3+l0LhUz7vhvPcaVMdyQj35xnL3uAIUUObYeEeYe2cyWB/1Y98LfJUPaePpV7vel5plh3cU=
Received: from MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16)
 by BL0PR11MB3364.namprd11.prod.outlook.com (2603:10b6:208:69::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 21:14:37 +0000
Received: from MN2PR11MB4661.namprd11.prod.outlook.com
 ([fe80::f0c3:b6cd:cd36:7181]) by MN2PR11MB4661.namprd11.prod.outlook.com
 ([fe80::f0c3:b6cd:cd36:7181%9]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 21:14:37 +0000
From: "Yokoyama, Caz" <caz.yokoyama@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Shyti,
 Andi" <andi.shyti@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "chris@chris-wilson.co.uk"
 <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915: rename debugfs_gt_pm files
Thread-Topic: [Intel-gfx] [PATCH 3/4] drm/i915: rename debugfs_gt_pm files
Thread-Index: AQHXpRT5570wkmGiNE2uQNMAeuK+zqudjzaAgAA4VYA=
Date: Fri, 10 Sep 2021 21:14:37 +0000
Message-ID: <43256f639e37c2a4a862d42add314fcda48b99fb.camel@intel.com>
References: <20210909004941.379035-1-lucas.demarchi@intel.com>
 <20210909004941.379035-3-lucas.demarchi@intel.com>
 <20210910175257.oo3wbqnwx2inbcr3@ldmartin-desk2>
In-Reply-To: <20210910175257.oo3wbqnwx2inbcr3@ldmartin-desk2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a96dc474-3ed3-4f65-6439-08d9749fff20
x-ms-traffictypediagnostic: BL0PR11MB3364:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR11MB336490B9F24D096F58CD27D19FD69@BL0PR11MB3364.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g9R+WvIsQ4UTBipOIYIhKEMaxmWqU+yi5rx+SroLYNU8rQnnJt6UY1c+qRPxEhNqphVAv3WcTTPCEDpFySCYgtprxBo6+FSKHUmYmcdI5LjorJRqa5PjT2C4BHTUMyJAm/4U/pZUdxxLJELaGx8svHf8U50/amSAjqzMvr6rp1BG7aW/JzcxTGCqvAD8eLNiLbh1cT8DYBWfPLCuU38Ia4aXenCXyvN0VJrsGlT/gKiVX4/PfoIiHJrRbb7iRE/Jm8e05yhACuGk0St3e+0G+/Q4PPcvDk3AwYf9i7495Yt5f6rA30iPl6QFPGV1sxhgCb+f3J9cO3LTwUUV23Ei4Xxgd8Pk4r5x7zuQJKZPQnAI4wUO3lkQHh92TwR9o9PS32qbq1VTYsCGbB+mEBvWr5PLZrbhV8kS1tYT5Gf9aTtJTB5C9n/eyjUmZVlzFIXB881h1kB4fTjYnhkv/WiRW/ida15OWLZ8hpcB7WDr/5Ui6oJQYZOC9T/BPZLiIBae/oV6wU0XkkgIkWMy7GLSS7mDjosgKnjKAso44qqVrIxGdz6VF9ur97M/3VnuYIkwziBHUlrByyq5jew/EewPNvKDOMSCH7JrFgWtxMgTxU4p2EcHeJaaA+oS1kUGR6vpJL7DZIIUrE+csZIRHqzU4qxutMj2EqD+tbHihttT36hSMwQlDUBaO1wTJZMFSK6FsnqZbcODsVu8Pv0UnAxCqdo8ZHbsFCgybQI+tBFQLTs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4661.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(66946007)(122000001)(36756003)(66476007)(66556008)(66446008)(2906002)(64756008)(186003)(76116006)(71200400001)(6636002)(26005)(8936002)(2616005)(91956017)(83380400001)(6486002)(6512007)(38070700005)(8676002)(316002)(4326008)(6506007)(5660300002)(86362001)(54906003)(508600001)(110136005)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzdLUytkTThnM0VtMkhDU0k2WkFkSURUWTF2OGZuL29UWW4xd0NxWVpsNEY3?=
 =?utf-8?B?aU9VaXRrQmQxYS9LSkluOUYxa0JNWXMva3VtbmdhTUxjd1dINHlrTXJYSGRj?=
 =?utf-8?B?M2hoNVV1cHlCN2RML3g0Q0U4eTJEZ2tLdytMMndsSHc4M3VFaWN3Nm52b2JW?=
 =?utf-8?B?S2R2M1VsMXhCRjk4KzhVa3VBdFpmbDNBZGtLNFBNY0Q3bTQwelloZTArRnM5?=
 =?utf-8?B?NElyQnhDaWFybE5sM096UUJkTG1sOWl6VWlXZWdWeUpOdFJGNjY2RFZXT0p0?=
 =?utf-8?B?ZU5KR3VEdDROa3JpL3V3a0RhRHRCSXpHUWtBbTN0YXMrb2ZJTmM2QmNVa0lE?=
 =?utf-8?B?VC8xcmRKREo4WmU1OWpmV3BCbUpETFo4N3dTcG9VM0ZJS0NWcFBoQzIzTjN4?=
 =?utf-8?B?eGRGQVdwbDVFdmZ3WHdvZzhYc01yMy9wWVNWOGIyMEQ0N3d4WnNWRktFcEVh?=
 =?utf-8?B?cVpRNzdaS09SYS9SODlmeURTbHpKSk9xZ09TMGNic1YzR3M4QXhTbWNUR21T?=
 =?utf-8?B?YWdabVhlYy9wL1ZiTnlaTGNpZGVXWkRrOUhsVVU2MGNZemxSMmUzTFFvMUIv?=
 =?utf-8?B?VWtDUnFiL1pDTVA0VmN0SFFyUWsrbG5VQ05OeWRyZ3ZmSlZicVc1Z3pLdGl1?=
 =?utf-8?B?SmVuS0lONk9tZkZkWjM2bjRBMXRGK1RBOG1DZkQwRTFYUW96RHVaK285a25h?=
 =?utf-8?B?ckc5YmRHWDFzRjk1VmRPdm9PL21NNWE2TEJDOTVSOFlZeVZPR29NeGc1RHU4?=
 =?utf-8?B?VjlCWlhHc2JrdWJFVEZlUlVkeTRHVm10QVJyblh5R09JZ3crcTgyYXZPcUJE?=
 =?utf-8?B?cG4ydzVQTHZ0ZmhLMHVGTVJlOTVwV3llZlpEaDZwSy9TZlh4djRuTXo1UGk1?=
 =?utf-8?B?Y3E0T2lQcFQ1YVpSdHNMeFdHOU5LUEkvNnlJcFhyWEpRTkY3UWVVN0V4RCtX?=
 =?utf-8?B?OW5pZlFXVm5HMGZJNUZTeGt4Z1hFeUxmRlBtOStvRmFFVzdERTlJVlhRRDRM?=
 =?utf-8?B?Q081bkZNcVpCWW1QU1NLK1lIRWJOZDBZNXlYOEh0YUljbW12NEpJVzhnTUJC?=
 =?utf-8?B?RjIwRVQ1MVlLY0RDanpONTUxVzNJSEVFMGNCemhSRHZWNzhGMjViMmg5TExx?=
 =?utf-8?B?TVJJb0VWbFZyUGFITHB4NHkyeUxoQlVERVV4Y0xuKzlDSlNOemh4ZWx5aHZt?=
 =?utf-8?B?cUhMbHR4TXhHQVVEcDNtV0doRHBITkMrVkp0NkxtenlMekZRK0ZWM1Q1bS9y?=
 =?utf-8?B?K1RyRExmZ1k0aUxzYWh6UEx1Rnk5bEJzQUN0Z0dOWWFYTGlZSEhkck81dEJR?=
 =?utf-8?B?Zzlad2Y3Y0lWY2ppY3lhenowb3RXajVWcGFWT1VaNDQyR2Z0a2dkZHRKcU5l?=
 =?utf-8?B?VEZMUC9kbmZuZE1yR0I0SGZmNmpORzUyd2ZjUWF2RDJvVW8zd1hrUk9mcWgy?=
 =?utf-8?B?N243OTFsL2FyZHkrV1d4YmpVYTRYOUJnWTMzNnllUzE3dDJ6b3crSDVFVUg3?=
 =?utf-8?B?NlZYQ3RzRExjRHdONE16S2NRb2dIalRTWVM0Y1NlU3Q3WU1rOTZUYnFnd1Ju?=
 =?utf-8?B?N0F3V211V0MyY0x6RnFna2Y2SEdvWmFZelFnWXY5T2Z3SWw4T29SQ3NzckJQ?=
 =?utf-8?B?bzVFdUlBc0VrYjZyOS9kMFk3R0ppQVIwR0FsN1g2Z2lNWTRYS2NScW5XcTVx?=
 =?utf-8?B?WjhzMVpHczMrMHo5SDg4MzVXdU1yZWRpdVAyenpUQVcrWG01U1RMN0hoRkNS?=
 =?utf-8?B?TEZZN3hmNU9odC9zd2JRY2I2VTkwaWpHMWozMllFdDN0eWRVUDh4Z2pTYXVF?=
 =?utf-8?B?UDlESHhzZ3IrQnJ2am1lZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DE78DD45F51F64C8A76A073FBC3C52C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4661.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a96dc474-3ed3-4f65-6439-08d9749fff20
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 21:14:37.7704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oDx9erlksopFyoYTz9b4XvXyFtTPkSxvzrfU9cTtcAuc4+34Xis6UGJWF/QkgxIo76X4iHKfs8SUml/Mw1jz4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3364
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

T24gRnJpLCAyMDIxLTA5LTEwIGF0IDEwOjUyIC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIFdlZCwgU2VwIDA4LCAyMDIxIGF0IDA1OjQ5OjQwUE0gLTA3MDAsIEx1Y2FzIERlIE1h
cmNoaSB3cm90ZToNCj4gPiBXZSBzaG91bGRuJ3QgYmUgdXNpbmcgZGVidWdmc18gbmFtZXNwYWNl
IGZvciB0aGlzIGZ1bmN0aW9uYWxpdHkuDQo+ID4gUmVuYW1lDQo+ID4gZGVidWdmc19ndF9wbS5b
Y2hdIHRvIGludGVsX2d0X3BtX2RlYnVnZnMuW2NoXSBhbmQgdGhlbiBtYWtlDQo+ID4gZnVuY3Rp
b25zLCBkZWZpbmVzIGFuZCBzdHJ1Y3RzIGZvbGxvdyBzdWl0Lg0KPiA+IA0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiA+IC0t
LQ0KPiA+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAg
IHwgIDIgKy0NCj4gPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9kZWJ1Z2ZzX2d0X3BtLmggICAg
ICAgICAgICB8IDE0IC0tLS0tLS0tLQ0KPiA+IC0tLS0tDQo+ID4gZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvaW50ZWxfZ3RfZGVidWdmcy5jICAgICAgICAgfCAgNCArKy0tDQo+ID4gLi4uL2d0L3tk
ZWJ1Z2ZzX2d0X3BtLmMgPT4gaW50ZWxfZ3RfcG1fZGVidWdmcy5jfSAgfCAgNCArKy0tDQo+ID4g
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3RfcG1fZGVidWdmcy5oICAgICAgfCAxNA0K
PiA+ICsrKysrKysrKysrKysrDQo+ID4gNSBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCsp
LCAxOSBkZWxldGlvbnMoLSkNCj4gPiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3QvZGVidWdmc19ndF9wbS5oDQo+ID4gcmVuYW1lIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2d0L3tkZWJ1Z2ZzX2d0X3BtLmMgPT4NCj4gPiBpbnRlbF9ndF9wbV9kZWJ1Z2ZzLmN9ICg5OSUp
DQo+ID4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0
X3BtX2RlYnVnZnMuaA0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9NYWtlZmlsZQ0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUNCj4gPiBpbmRl
eCAyMzJjOTY3M2EyZTUuLmRkNjU2ZjJkNzcyMSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9NYWtlZmlsZQ0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2Vm
aWxlDQo+ID4gQEAgLTc5LDcgKzc5LDYgQEAgaTkxNS0kKENPTkZJR19QRVJGX0VWRU5UUykgKz0g
aTkxNV9wbXUubw0KPiA+IA0KPiA+ICMgIkdyYXBoaWNzIFRlY2hub2xvZ3kiIChha2Egd2UgdGFs
ayB0byB0aGUgZ3B1KQ0KPiA+IGd0LXkgKz0gXA0KPiA+IC0JZ3QvZGVidWdmc19ndF9wbS5vIFwN
Cj4gPiAJZ3QvZ2VuMl9lbmdpbmVfY3MubyBcDQo+ID4gCWd0L2dlbjZfZW5naW5lX2NzLm8gXA0K
PiA+IAlndC9nZW42X3BwZ3R0Lm8gXA0KPiA+IEBAIC0xMDMsNiArMTAyLDcgQEAgZ3QteSArPSBc
DQo+ID4gCWd0L2ludGVsX2d0X2VuZ2luZXNfZGVidWdmcy5vIFwNCj4gPiAJZ3QvaW50ZWxfZ3Rf
aXJxLm8gXA0KPiA+IAlndC9pbnRlbF9ndF9wbS5vIFwNCj4gPiArCWd0L2ludGVsX2d0X3BtX2Rl
YnVnZnMubyBcDQo+ID4gCWd0L2ludGVsX2d0X3BtX2lycS5vIFwNCj4gPiAJZ3QvaW50ZWxfZ3Rf
cmVxdWVzdHMubyBcDQo+ID4gCWd0L2ludGVsX2d0dC5vIFwNCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3QvZGVidWdmc19ndF9wbS5oDQo+ID4gYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndC9kZWJ1Z2ZzX2d0X3BtLmgNCj4gPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQN
Cj4gPiBpbmRleCA0Y2Y1ZjVjOWRhN2QuLjAwMDAwMDAwMDAwMA0KPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d0L2RlYnVnZnNfZ3RfcG0uaA0KPiA+ICsrKyAvZGV2L251bGwNCj4gPiBA
QCAtMSwxNCArMCwwIEBADQo+ID4gLS8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8N
Cj4gPiAtLyoNCj4gPiAtICogQ29weXJpZ2h0IMKpIDIwMTkgSW50ZWwgQ29ycG9yYXRpb24NCj4g
PiAtICovDQo+ID4gLQ0KPiA+IC0jaWZuZGVmIERFQlVHRlNfR1RfUE1fSA0KPiA+IC0jZGVmaW5l
IERFQlVHRlNfR1RfUE1fSA0KPiA+IC0NCj4gPiAtc3RydWN0IGludGVsX2d0Ow0KPiA+IC1zdHJ1
Y3QgZGVudHJ5Ow0KPiA+IC0NCj4gPiAtdm9pZCBkZWJ1Z2ZzX2d0X3BtX3JlZ2lzdGVyKHN0cnVj
dCBpbnRlbF9ndCAqZ3QsIHN0cnVjdCBkZW50cnkNCj4gPiAqcm9vdCk7DQo+ID4gLQ0KPiA+IC0j
ZW5kaWYgLyogREVCVUdGU19HVF9QTV9IICovDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L2ludGVsX2d0X2RlYnVnZnMuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvaW50ZWxfZ3RfZGVidWdmcy5jDQo+ID4gaW5kZXggZTVkMTczYzIzNWEzLi40MDk2ZWU4
OTNiNjkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3Rf
ZGVidWdmcy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3RfZGVi
dWdmcy5jDQo+ID4gQEAgLTUsMTAgKzUsMTAgQEANCj4gPiANCj4gPiAjaW5jbHVkZSA8bGludXgv
ZGVidWdmcy5oPg0KPiA+IA0KPiA+IC0jaW5jbHVkZSAiZGVidWdmc19ndF9wbS5oIg0KPiA+ICNp
bmNsdWRlICJpOTE1X2Rydi5oIg0KPiA+ICNpbmNsdWRlICJpbnRlbF9ndF9kZWJ1Z2ZzLmgiDQo+
ID4gI2luY2x1ZGUgImludGVsX2d0X2VuZ2luZXNfZGVidWdmcy5oIg0KPiA+ICsjaW5jbHVkZSAi
aW50ZWxfZ3RfcG1fZGVidWdmcy5oIg0KV2h5IGxvY2F0ZSBoZXJlPyBXaHkgbm90IGp1c3QgcmVw
bGFjZSBkZWJ1Z2ZzX2d0X3BtLmg/IENvbXBpbGUgZXJyb3I/DQotY2F6DQoNCj4gPiAjaW5jbHVk
ZSAiaW50ZWxfc3NldV9kZWJ1Z2ZzLmgiDQo+ID4gI2luY2x1ZGUgInVjL2ludGVsX3VjX2RlYnVn
ZnMuaCINCj4gPiANCj4gPiBAQCAtMjQsNyArMjQsNyBAQCB2b2lkIGludGVsX2d0X3JlZ2lzdGVy
X2RlYnVnZnMoc3RydWN0IGludGVsX2d0DQo+ID4gKmd0KQ0KPiA+IAkJcmV0dXJuOw0KPiA+IA0K
PiA+IAlpbnRlbF9ndF9lbmdpbmVzX3JlZ2lzdGVyX2RlYnVnZnMoZ3QsIHJvb3QpOw0KPiA+IC0J
ZGVidWdmc19ndF9wbV9yZWdpc3RlcihndCwgcm9vdCk7DQo+ID4gKwlpbnRlbF9ndF9wbV9yZWdp
c3Rlcl9kZWJ1Z2ZzKGd0LCByb290KTsNCj4gDQo+IFRoaXMgaXMgb25lIGNhc2UgSSB1c3VhbGx5
IGRvbid0IGtub3cgd2hhdCBjb252ZW50aW9uIHRvIGZvbGxvdyBzaW5jZQ0KPiBpdA0KPiBjaGFu
Z2VzIGluIGRpZmZlcmVudCBwbGFjZXMuDQo+IA0KPiBJIGRpZCBpdCBsaWtlIHh4eHhfcmVnaXN0
ZXJfZGVidWdmcyBiZWNhdXNlIG9mIGNhbGxzIGxpa2UNCj4gaW50ZWxfZ3RfaW5pdF9zY3JhdGNo
KCksIHh4eF9pbml0X2h3LCBldGMuIEhvd2V2ZXIgaGVyZSBJIHNlZSB0aGF0DQo+IGp1c3QNCj4g
YmVsb3cgd2UgaGF2ZSBpbnRlbF9zc2V1X2RlYnVnZnNfcmVnaXN0ZXIoKSwgc28gbWF5YmUgSSBz
aG91bGQNCj4gY29uc2lkZXINCj4gZGVidWdmcyBhcyBwYXJ0IG9mIHRoZSBuYW1lc3BhY2U/DQo+
IA0KPiBMdWNhcyBEZSBNYXJjaGkNCg==
