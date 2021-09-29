Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F15C41CBD0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 20:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD426E207;
	Wed, 29 Sep 2021 18:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA766E204;
 Wed, 29 Sep 2021 18:27:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="225082710"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="225082710"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 11:27:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="707422339"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 29 Sep 2021 11:27:19 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 29 Sep 2021 11:27:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 29 Sep 2021 11:27:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 29 Sep 2021 11:27:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiH+VG3OXque7sIrF2h5q32wtbTW0P418JhZ2hDIJODhlekfu6gAWn6V3mbK9z9RvyW5VrmMjDkxLF7YzL4m+2AS14yefCQTf7J19m7ccPqHltGnhrXQj1plMmc+PIYZnn5P/qGfPpZcbSK7xgr3u7USxuVRzEpX2pduHARfnhLZlkgh/C7RYb6vYxS0szz18fV0Z7/2gOZSv46ETH79TgDSQLJNKeC1lSYRMUdglMv9GB34uHgcDpfxrHioezlM/PbUZxO7v8i5ePC5DTXVOLm5HYB6NZt79tiWuV/NZxO+KosJC7vb7RALUYsSipLla/zq375dSDETQmOai1bg9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=w+l3VBfyx/TqaBZjqjk738A5I83CEapo1ek6+Njm2YI=;
 b=MBOXiCFALQw274sb8Xzv7W6GBJmmJnGRU9+Wgp5EzeoP0Yc6PIvuKNlD09XmWeGlZ9RPhkoggl6kpMqL+FhjtLFLdgI82ojN/0sih148VWtSCSKUP0McKzhhZtid4F6qFDONjRGlaWdZRTzmOd8qCKkr9lLHnywT13hsZz2uiKoRTbU5aAR+PEbafmYdelnnI60ctDPzsMWAY7cG6XdKYXD0oPCGCqAZNgJGYwV694PFpPlwnxv2IAeOt7LAw/NWf+jpLwfBTWApvGczl3Ikm+0i1sK7d2+Q3rWYqi426ubYHbX/2Hqt6FTI7qLQkt9L48cYjzAulYanaxoICoeVpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+l3VBfyx/TqaBZjqjk738A5I83CEapo1ek6+Njm2YI=;
 b=TTopQTN61PgNUChvVVSvZTRJ2YGgdm2b3sJh78HzMtDrdGIJVppMQ3QP/Z4+gXchkbzHmIaUISxu1tASMHmCQkkWljhssASQwDuB78a5uIR71b6fbdePVQygMZHzIfFSqogcRRCJB3ZufhKz3RAw/oNdUDl4nwiIt78CGY59OtA=
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 DM5PR1101MB2123.namprd11.prod.outlook.com (2603:10b6:4:53::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.13; Wed, 29 Sep 2021 18:27:16 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2db5:86a8:9c6f:3a1d]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2db5:86a8:9c6f:3a1d%3]) with mapi id 15.20.4566.013; Wed, 29 Sep 2021
 18:27:16 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Greg KH
 <gregkh@linuxfoundation.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>
Subject: Re: refactor the i915 GVT support
Thread-Topic: refactor the i915 GVT support
Thread-Index: AQHXfkkPR74j3PcQBUqzVfBaHB7ETatOyPlwgAATUQCAB+h0AIABoDZQgABTFICAAN/IAIAIA5SAgABQYwCAAPoZAIATp54AgAB+0YCAAEa+gIADWQiAgAHzigCAAF7DAIAIh7KAgDP1tYCAAGooAIAACYwAgAAIY4CAAcrQAA==
Date: Wed, 29 Sep 2021 18:27:16 +0000
Message-ID: <24c7bbec-b425-52fb-d3f9-539a0a391dfa@intel.com>
References: <20210816173458.GA9183@lst.de>
 <20210817010851.GW13928@zhen-hp.sh.intel.com>
 <20210817052203.GX13928@zhen-hp.sh.intel.com>
 <20210819082929.GB13928@zhen-hp.sh.intel.com> <20210820141724.GA29034@lst.de>
 <YSAI8pKAvvW/8S2O@bombadil.infradead.org>
 <20210826061219.GD9942@zhen-hp.sh.intel.com>
 <55c11f22-99e5-6109-3be3-a04b06b3336e@intel.com>
 <YVMgGKk1K4gO8ls6@bombadil.infradead.org>
 <af40291a-de36-b39f-9ded-aaf4ddba641f@intel.com>
 <20210928150507.GM964074@nvidia.com>
In-Reply-To: <20210928150507.GM964074@nvidia.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 967645f9-e6c8-4714-9691-08d98376c41c
x-ms-traffictypediagnostic: DM5PR1101MB2123:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB21233851F30921D44E6B03AFCAA99@DM5PR1101MB2123.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lFwIRzY9QoWMvIwH7PQR0x/UJzSZzBwTV4jv7xZrYCMXeiXjoE8kOODQ8jT/P/3+hjdk+7uH62GnRsrz07+RaRleySdNzd8cQsYyVZieQk1sujJbOr8tCERRAYz4GdxNSZNeM82T/gGyakB/vxGzpn9E0lR8LrwNW4xOc/hMj8+3refUvlTB94XFRvau8f/doanwtSfQ0Cp9uha79P7pGi2zzeS6Gt0VV8zACZHD/2C5h2F/q0OscX/E2BYWTrwv1ZVgGnJ0JBXUp++LVDMVoefCffM3D+Jn4jvnQnLvyYffoqSckZYpUtQfK2jkiZdEHzK0NobVUn9imtlMKOFvgDTUjxCiIaoKWO9mi8+cIajpCVRrxEfKpaN6aDpZdaTDUM/qgaiIx/6Z9218muBte16CfvX6jxIO1e8GojPYe2KeaAD3iXCB3iQnyLo807/l9VvjUQ3kCvQeF5LHucPLMhSaAk3dLfybwn7va+GXqDconpbsyEiOTVfnPSWcMl0234Z0CMn6q5y7KKzWD6rKTh5RynSkhN5gPaHSERhgDosvOm22eZWIidy4E1k/LZqj7xIMqUG/x9Ov3SlKg0rTB62Hw44rZFiGUKmRMHiHBnhgVzZz/cFcbcFL6kTqMur41TpAM/d3sF42SVOtAOKR4CwpM9mqUhbkIDaegzUhbqiQVPHIAub3WxsUcmaidxy3wIDIauduLIaBcyMxlEVHVXnnV62GU/bAqv8O1qJ/fnKeonavnB1bnnOe+9TD1es0STCk84Hdj1kvgDjv7+q+nA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(6486002)(8936002)(83380400001)(508600001)(122000001)(53546011)(38100700002)(86362001)(4326008)(66556008)(2616005)(66476007)(66446008)(6512007)(64756008)(66946007)(91956017)(76116006)(31696002)(26005)(8676002)(316002)(71200400001)(6506007)(186003)(5660300002)(31686004)(6916009)(2906002)(38070700005)(36756003)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTBxb1pIVzlZTjh5QlhNYnBTNm1pdnprL1lrc09PQ3o2Y3FtRU9mYlhIWVEw?=
 =?utf-8?B?QndEOWN5WG1Cckx1ZkM5SDNqWHdOS25zVzl0MXczQVg2RDUyNm9jZHhrVlMw?=
 =?utf-8?B?cUI1VTYwcVQxVHJIRzh2Y3VNZlhXeDM1aVhyVGxKL3RsWkV0YXR3LzhzWWoz?=
 =?utf-8?B?c0IzRGVqQWlOZUpXZDlWSDg2c0Rmb0g0MDFDK2NFbmNuUW1YbnRHd1c3MnMw?=
 =?utf-8?B?Ky9YUFZOVnFzN0Q3Q2ppeXcxcXFSZFlrdUVqOUlrOWNlNS9xREttREgySHpE?=
 =?utf-8?B?WXFsd1dhc1liTkJ0VVhFck1mVTZENzJSM2RBaElSYkJVYlFHSFo5UTlERGVy?=
 =?utf-8?B?YUhiaWxJemxTZFlLZkI2azFsZnMrd0padmtzVWpvWStPNDladmJBZ0xGcE1y?=
 =?utf-8?B?R2kwWVZsUk55WHpTbXRZRE1zQnBIZjZqWkVscGhTQjR1NWtlSDRldzg4bnc5?=
 =?utf-8?B?SnFTcGg4MkEwYkllMEVqZUJHajh6a25GUVlRNm5ZM3o0eWYyNnlLRGs1NHBJ?=
 =?utf-8?B?NmMvMG01UEUxWmlueWtKRmVvNmdTZGZoZ1pYRTVBcDR1RmhNYUZTd0hIWG5t?=
 =?utf-8?B?Yk0vdDhhRDNEa0t5VWNCM3M2YVlaSjBGL0xjeGJOVVhBZkVQZnovdktMY1RU?=
 =?utf-8?B?MlhJeGF5UmdZVHgrYW9VSndJUFp3ek9HVnVLWkJ1R25GTDY3Z09JUWtCbWJ2?=
 =?utf-8?B?Rzc2QTRKQXpPUE9rakoyWG5SRWlyYWhMdnNQbGd2Z0ZhMnljT1hBN1RNWGdz?=
 =?utf-8?B?eWZSWjhrcERRTGxDb285T3hOOHExb01xUk5hYjdoUHFwL3I3RmdCNmNWV25V?=
 =?utf-8?B?MkZjMFdwclNJTXN5aEZXVHo4ckFaK1BabzBNb09kQVVaVHI3UUpUYW1OQm5E?=
 =?utf-8?B?Q21NQmFrVFJKMXloWlVCci9uZnErL1RZU1VaR1VmUk5aNFZHMlA4ZXgvaEVD?=
 =?utf-8?B?VnkwQ2dPQTBBNjUzNDFDNCttVzdYK3VLekk3alduU1J5Q01KMzZLV2wxVUdB?=
 =?utf-8?B?cU5TOEU5MkJtdGdMTk94R0hnL3hGMGN2b0R5ZXUvK3IyREdGS2FBNHNScURM?=
 =?utf-8?B?NWtxeFljU04xeDJpV29EZ1pQNHU5dEtEa0M4YUQrbjNRMlJ2Q1FxNUR5L3Bv?=
 =?utf-8?B?eUw4SldnQ0hLVkxwNzJDRVpLMjVnZlpoVkJEeW9WWFlaTnFYdDNYZDdxQzg2?=
 =?utf-8?B?K2huamxwRjNyMHcwbXFQQWRGMmZvQVJhaXRzNkRNU0kzZEk3UTNUVWdFcnpw?=
 =?utf-8?B?di82SjNVQndyS3MwZngyY0N2UDdkT3UzUnRENVVjL20wekhYUUtMVXlYSTYx?=
 =?utf-8?B?QzduYWxyTmxHUkJXZ21ONCtrdE5QZFd5TlF1RUZUd2xOWGt2VkVId0VNcTk0?=
 =?utf-8?B?TjFGd1ZhT3NGeEZvaUtHdDlORWlrc2hDTkFka3RiVkhOQS8raW5RQmJwSk9X?=
 =?utf-8?B?ZFFxTGYxT3NjYldXd28rNG11QVRtRjk5bno4bU1STGt4MFB0Wm5Ea0VMLzgx?=
 =?utf-8?B?V1p6bmdWTkZkNWp6b2dicGxGdFhqbDBick4vRWVUVVdwOG1sQzBLSm9mazJv?=
 =?utf-8?B?SUVQcCtSK0FmeUxCKytuVTZrYXZVZUJBblp5dnQxbEp2L1ZkU1VoVXRRNFBv?=
 =?utf-8?B?dnFzeFVEM3E4TGdQekxhc3phbDA3Sit4Ui9pWmlQQitPM3N2dlZlbWhKN1Q5?=
 =?utf-8?B?TjR4Y0RpUG1Xb3ZLTkh6WVBkZ3dXZXExWHBwTG44V08rcFZ4ZS9sRDR3ZFZk?=
 =?utf-8?Q?0aiazXESuC0txcFuAYVYb5QVGif3uPxb0UQrnyS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE13EA19C172E445B5F41DBEE25483C2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 967645f9-e6c8-4714-9691-08d98376c41c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2021 18:27:16.7849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zM0/n/3OFTESiJB0AvFOgnrQznr5U6tVreaFflRYljlrdcw6VOuu1tv8W4x+O4cKmcgDH/KE3/U+dehjZhgRvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2123
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

T24gOS8yOC8yMSAzOjA1IFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6DQo+IE9uIFR1ZSwgU2Vw
IDI4LCAyMDIxIGF0IDAyOjM1OjA2UE0gKzAwMDAsIFdhbmcsIFpoaSBBIHdyb3RlOg0KPg0KPj4g
WWVzLiBJIHdhcyB0aGlua2luZyBvZiB0aGUgcG9zc2liaWxpdHkgb2YgcHV0dGluZyBvZmYgc29t
ZSB3b3JrIGxhdGVyIHNvDQo+PiB0aGF0IHdlIGRvbid0IG5lZWQgdG8gbWFrZSBhIGxvdCBvZiBj
aGFuZ2VzLiBHVlQtZyBuZWVkcyB0byB0YWtlIGENCj4+IHNuYXBzaG90IG9mIEdQVSByZWdpc3Rl
cnMgYXMgdGhlIGluaXRpYWwgdmlydHVhbCBzdGF0ZXMgZm9yIG90aGVyIHZHUFVzLA0KPj4gd2hp
Y2ggcmVxdWlyZXMgdGhlIGluaXRpYWxpemF0aW9uIGhhcHBlbnMgYXQgYSBjZXJ0YWluIGVhcmx5
IHRpbWUgb2YNCj4+IGluaXRpYWxpemF0aW9uIG9mIGk5MTUuIEkgd2FzIHRoaW5raW5nIG1heWJl
IHdlIGNhbiB0YWtlIG90aGVyIHBhdGNoZXMNCj4+IGZyb20gQ2hyaXN0b3BoIGxpa2UgImRlLXZp
cnR1YWxpemUqIiBleGNlcHQgdGhpcyBvbmUgYmVjYXVzZSBjdXJyZW50bHkNCj4+IHdlIGhhdmUg
dG8gbWFpbnRhaW4gYSBURVNULU9OTFkgcGF0Y2ggb24gb3VyIHRyZWUgdG8gcHJldmVudCBpOTE1
IGJ1aWx0DQo+PiBhcyBrZXJuZWwgbW9kdWxlLg0KPiBIb3cgYWJvdXQganVzdCBjYXB0dXJlIHRo
ZXNlIHJlZ2lzdGVycyBpbiB0aGUgbWFpbiBtb2R1bGUvZGV2aWNlIGFuZA0KPiBub3QgdHJ5IHNv
IGhhcmQgdG8gaXNvbGF0ZSBpdCB0byB0aGUgZ3Z0IHN0dWZmPw0KDQpIaSBKYXNvbjoNCg0KVGhh
bmtzIGZvciB0aGUgaWRlYS4gSSBhbSBub3Qgc3VyZSBpOTE1IGd1eXMgd291bGQgdGFrZSB0aGlz
IGlkZWEgc2luY2UgDQp0aGF0IGl0J3Mgb25seSBmb3IgR1ZULWcsIGk5MTUgZG9lc24ndCB1c2Ug
dGhpcyBhdCBhbGwuIFdlIG5lZWQgdG8gdGFrZSANCmEgc25hcHNob3Qgb2YgYm90aCBQQ0kgY29u
ZmlndXJhdGlvbiBzcGFjZSBhbmQgTU1JTyByZWdpc3RlcnMgYmVmb3JlIA0KaTkxNSBkcml2ZXIg
c3RhcnRzIHRvIHRvdWNoIHRoZSBIVy4NCg0KT25lIGlkZWEgaXMgd2UgY2FwdHVyZSB0aGUgcmVn
aXN0ZXJzIGluIGludGVsX2d2dC5jIGR1cmluZyB0aGUgZWFybHkgDQppbml0aWFsaXphdGlvbiBh
bmQgZG8gZXZlcnl0aGluZyBlbHNlIHdoZW4gaTkxNS5rbyBpcyBmdWxseSBsb2FkZWQuIEJ1dCAN
CmhvdyBhYm91dCBkZXBlbmRlbmNlIGJldHdlZW4gaTkxNS5rbyBhbmQga3ZtZ3Qua28/IFdlIGNh
bm5vdCBkbyANCnJlcXVlc3RfbW9kdWxlKCJrdm1ndCIpIGluIGk5MTUua28uDQoNCk1heWJlIENo
cmlzdG9waCBjYW4gZ2l2ZSBtb3JlIGlucHV0IG9uIHRoaXMgYW5kIGhvdyB3ZSBjYW4gZGVhbCB3
aXRoIA0KdGhpcz8gQmVmb3JlIHdlIGZpZ3VyZSBvdXQgYW4gc29sdXRpb24sIHdlIGhhdmUgdG8g
cGljayB0aGF0IHBhdGNoIG91dCANCnNpbmNlIGl0IGJsb2NrcyBvdXIgcHVsbCByZXF1ZXN0IHNj
aGVkdWxlLg0KDQpBbHNvIEkgd2FzIHRoaW5raW5nIGlmIG1vdmluZyBndnQgaW50byBrdm1ndC5r
byBpcyB0aGUgcmlnaHQgZGlyZWN0aW9uLiANCkl0IHNlZW1zIHRoZSBtb2R1bGUgbG9hZGluZyBz
eXN0ZW0gaW4ga2VybmVsIGlzIG5vdCBkZXNpZ25lZCBmb3IgIm1vZHVsZSANCkEgbG9hZGluZyBt
b2R1bGUgQiwgd2hpY2ggbmVlZHMgc3ltYm9scyBmcm9tIG1vZHVsZSBBLCBpbiB0aGUgDQppbml0
aWFsaXphdGlvbiBwYXRoIG9mIG1vZHVsZSBBIi4NCg0KVGhhbmtzLA0KDQpaaGkuDQoNCj4gSmFz
b24NCg0KDQo=
