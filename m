Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7336742A1AE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 12:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D68589F41;
	Tue, 12 Oct 2021 10:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2CE689F41;
 Tue, 12 Oct 2021 10:07:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="225872524"
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="225872524"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 03:07:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="716791875"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga005.fm.intel.com with ESMTP; 12 Oct 2021 03:07:45 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 12 Oct 2021 03:07:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 12 Oct 2021 03:07:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 12 Oct 2021 03:07:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iApatyhacA17bRkFmLz2Jr640HCHm6PzzMe055wqr3Ji/wPL1ky3wyV+M4fYHrZVo1MacNr66EgGncdns/8YLzZYV4q5nsoNDQfME57LnkOKfQ6EW3DytgEUum1H2i0f/5g3PC3zaOPEmmbWcu15xzbrpeLCNbRYwkjwjvXLOTONtQtVqB3rE+gy3EmIYLiCsZKTKICDaOktN+8q7NsanZzJuVn0XZhcI/ulNNfUMRrI5tg2OAlxpiMxfEuvy0Uxyld4TfqOAijC5qaxMIOvwoJqaGBiMvnRR+7fnZSQ0/VmDaztHxL34sDjJmrKfQYnvNL9V+Txzdu1xgKmLe3QvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShuxNVFpEr1kI6TT+KbQrRcQPftGmCKAufeA2XFTgUY=;
 b=d8u6UyF/XO4fQfxF2i8WYhtv6/GQu1GudRITupWQqBmMqIrAz9ir5zUTEe1GVGr/a/MNBjVa1b3S/15qpEEuO+JzFYjKUoKtQTqy1GPC0+eeHKZDfqrJC8p4lVbEt04Ibz2Caf67Kfgss/Heo/hQfY8eScLSgYmNWl3a6bWYDKP8Y0Pbo1f6eaVMJ0uSjbN6lMnzNL68VQAS5bRN7t5KeV4grtuI6rt26ocyYJoErm+q8C4XlnsZ1yl5EYRRhkgi1lRrOPSp6OoRWlAghKykRC4WhIN+nE4VzjODFj2YAcj4SGdc383yw+sLctlQIHdRZW1Ycx4FN4UVhLBsGAbpNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShuxNVFpEr1kI6TT+KbQrRcQPftGmCKAufeA2XFTgUY=;
 b=RzDM1gKEIgpO3u0daEJ4KFPSrGxEfdzyCottr6Odj8L8+68hCzfsO/+TiGHD6uaRRc5/JRzDOe9VoA3P3ZdGtiW3LeKXmcrUwWtqhXvb/s8aNdUYTTbREWiF2oeljoZzaB8Mp6B5sKubFCukcfoFza5eWCs7rNGPZUSSMSTVUvA=
Received: from CH0PR11MB5538.namprd11.prod.outlook.com (2603:10b6:610:d5::23)
 by CH2PR11MB4295.namprd11.prod.outlook.com (2603:10b6:610:3f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Tue, 12 Oct
 2021 10:07:44 +0000
Received: from CH0PR11MB5538.namprd11.prod.outlook.com
 ([fe80::f54b:a185:b50f:27ff]) by CH0PR11MB5538.namprd11.prod.outlook.com
 ([fe80::f54b:a185:b50f:27ff%2]) with mapi id 15.20.4608.014; Tue, 12 Oct 2021
 10:07:44 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: lkp <lkp@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, "Xu, Colin"
 <colin.xu@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/i915/gvt: clean up kernel-doc in gtt.c
Thread-Topic: [PATCH] drm/i915/gvt: clean up kernel-doc in gtt.c
Thread-Index: AQHXuBbV6P+fjwE+40CuqMp/20KAQavPMdCA
Date: Tue, 12 Oct 2021 10:07:43 +0000
Message-ID: <39041738-e208-f1ad-8886-a8c8685bd9ec@intel.com>
References: <20211003052334.15764-1-rdunlap@infradead.org>
In-Reply-To: <20211003052334.15764-1-rdunlap@infradead.org>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bc3e6ab-8a4b-40fd-bb87-08d98d68223d
x-ms-traffictypediagnostic: CH2PR11MB4295:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR11MB429503BD50B1A36B8E624AB6CAB69@CH2PR11MB4295.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:162;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gFjj2+QFMw6NwX3M78DEidnztqDDUmIBE4xcqYqsC2cSEqutaIis31ggih+3N+9oZaNHi7B+gtTvlHRADK8YO411UlDmrtUbSILtgW45yAOTq1yrj1c56P7IyTXOwoBDicT1nTdlreWpeCURttEQZVlRKB5fTioKuK7RHKq8zgbKS4z+QCC9yaigadqth7v0YmCdxLv00dAnQDQTu5drlF/kKdHCbCHdTPTO6fzKuAaXzN1rHAkteOk5y6JcedT2XAnOm0d520PbVUrzUtFR6kXigYHGt7FLcxh1XhjwWBjcrxjICDRhSDnfKSeCqRvU7vEEUOdiLT7jM8KQ94x7v+aryxlbIkswXoWiXW7DrplfgfFLggpIx02bvZ35NmxDyWA0HIxCksoAPf6gd/XzlCC6gTcEiuxQLPNrLohScxmwSfgdYChDgMQcj4h8zaTEYVDLM/FqlJgLQt/G8yAHFH43dheWhaQ2LJLsip7l6TSJtgdCKajgec22M88nargAX/AOOIhbf0DVGyl4PM+O6jVzBrOG6thNPAvD2f71Bf8bu0UvnAX2meSFJRz33CjRjnf6K7sAfls3sZOdkw6O+EzaegXoF2cnQ1FhzsDRaI91ImIn19oCF1IpQIUlxXiXq3h+VoPlSHQY7T2Wk1ptqLmyNi4yhgCn8USj/0IiAk6PsB45TnI0lsmMI/aOnizOcZ9ePBnNyPWxyhkF2uAmPjJ3txk3zajXEDb6ZS68z9iwQHhC29rawDVF+fJW21poHnfSkaJJFBmQkcePsyrHmRyIX4XTQA5TM+REZZwJKmVfkruHee3o21Xop8t/2tv6+zfWVGr1p7NcgCoN60zMgm8ewlZF/w689oeyuCZqa98=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5538.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(508600001)(66946007)(76116006)(8936002)(91956017)(83380400001)(6512007)(71200400001)(122000001)(31686004)(26005)(38100700002)(186003)(5660300002)(66446008)(66476007)(64756008)(66556008)(6506007)(53546011)(86362001)(38070700005)(54906003)(31696002)(6486002)(2906002)(2616005)(110136005)(8676002)(4326008)(7416002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2dQZVpqZ1RReW1OOE9UWFRTT0dYZGMyQ2R6WVkybWdWUlZSeEVzK3kvTG0x?=
 =?utf-8?B?NitpamNqSXphOEFyVUhFbVJjZHkrd1J0eVU3SFQveEtYcG1jakErektZZDVF?=
 =?utf-8?B?ZmsxWjhPUloxU21yM2NOZnlyRGRQSVBwTzZWMFBzamkwa25pVGlyOGhDZkxj?=
 =?utf-8?B?VVhlZmRWZ25EZXpJeGRBUmIrbjh5YUMzVXNaKzNhc2N4aHlucHpBZ1kyVlFV?=
 =?utf-8?B?NFhTZ3VvQTg2UjFvSTF4Nk9wU1N1ZUR2a1pOLzIrMVNmazRzcFNUY3Q4VDBP?=
 =?utf-8?B?QjBNaFF0NVlzRGY1Uk9LVlFoc0dYZmNFVHlsbHZyZFVpWDhzYktBMDQ0V0w2?=
 =?utf-8?B?eDF5Y3FTcXAzWDNlRUJ5MllHdnRCTi8rZ1pRRFRMSWE4ZitpaFNkSE5KM2VH?=
 =?utf-8?B?Yk5WSG1tc0JBWDN3SUtEUkhIa1EyTXhya2RUTk9uTnZuVmpLSGFxL05vRU9N?=
 =?utf-8?B?ZjMwbmpjbnJaTWpLNDRHcWJNdnU0eEZDN2pMaU5Ya1VWYkVxM0F0eVQ5L3FF?=
 =?utf-8?B?N1M3M1dxKzR4Wks3c2VTS2ZXZFc1SjJJaGFxRjFWc2YvQU5Xb015OEsxblZi?=
 =?utf-8?B?TWVMcGVkNHhBMkpkTDBKT2hrbkdUWkdpZTJRaExGOXZsSmZrVHd2T2hNQ0NX?=
 =?utf-8?B?dXlmdTQyYVZhS1Blb3J4Y3hNQytpMTZ4SDFtd1E1clVDUEpQaVBEb0FVT01N?=
 =?utf-8?B?UFVDOGIrcFltek93eFR2cFZsZm1YQy9qNFRRck9CdDRLZEorWEZpTkxvbUxn?=
 =?utf-8?B?elk0amMzcXBWdnFjL1VEbzltdUprV1RuQUtNQ2xCcWRUSjM0cDJTanVKOWhX?=
 =?utf-8?B?S0tkSjhjMm55S0hoRUNHWTZCR252ejNQajdMOEQxeGE5WlJoNmFDcHVvNXhJ?=
 =?utf-8?B?eUY1TXN2S2N4d2RSd2t1aDhnSVduNnE1SktYb2lmTmc2OStDTW1GMEI3WDRa?=
 =?utf-8?B?Rm1oUTBqdVBudFA0WkRUQWs3ajJyVm5BZnZ0WEgzb2t2eStUaG1kY01GMGVE?=
 =?utf-8?B?b2d1RnJuUWpKQmtrWkVzUUF6cXZMK0hpdDlNVlc3M25JUlB4ZDF3RzhuZ09p?=
 =?utf-8?B?TVl2MHZWemd6UXQxdG52R3o2M2w0TmtCY2paYWNHZDcxVDc2d1Jwa2ZIK2Qx?=
 =?utf-8?B?YXM3RExtcm1HZXhPakhjVE5FaGpNWTNIRmFHVVFYWFowWWgzcForMkRVd2xW?=
 =?utf-8?B?cjN1ejlXMnkzT0ZiWnlCQ3d1K1ZXbWgrWlhybjh2L3BDekhjNW51UDZTaXVh?=
 =?utf-8?B?S0hYQ0ZCSGxBbmRRVC94dmtIMk9EckJqQ2Z5YTlCSkxmZUI2QmZlUGdtVVQz?=
 =?utf-8?B?VjRMMnNSRGxHYlB5RTdnL1k1QTJpdEVaRkZmOUo3RjhXOHBRSkV1NzBneFlK?=
 =?utf-8?B?MDM3a00wNWFzaDUwY3pJZllpTkEzS0tvbmI4aEhqd1p1ZkhObHRRUHFreklF?=
 =?utf-8?B?V2pZN2lXdlZmNTU3NTBsT2U4czFWMElSRFJwNkR6dEhsUHRPdy9IV2VobTBv?=
 =?utf-8?B?aFBESll3alJtSVRNSkV0bDlUMzRkY1UwOXk5RkdsRGZuSGs5WXBZNlljQTdm?=
 =?utf-8?B?WE02cG9vUVlzYWl4Q2ZJOVBnTi90N01jNWJBbGM4N0dsamUxVXFVcWZCTkI2?=
 =?utf-8?B?bVRqVHEvYkpEMTVjTEtQUDRjc3l0Z21yam83QWJhRklOUEZyT3N2UkUyN0RY?=
 =?utf-8?B?QUZjWlpucXVYSWxXbTVsUHZCSVJoSXVuekQxVHJlbENZMlh3Z0NhLzFndHFx?=
 =?utf-8?Q?EWiOiJFT40yJwLE529q+Q084R4UqnuhQssMrn+6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABE188B1DDCD68408B09985DFAA98D5C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc3e6ab-8a4b-40fd-bb87-08d98d68223d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 10:07:43.8599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EVxM9b6+7IRBpH1lbr9fxXbWm8hP2FnHJHjj3Ks1/HxLd2YfRxCX0DO1AjapwH+pfX9qYQQRuFYienfWcZZgxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4295
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

T24gMTAvMy8yMSA1OjIzIEFNLCBSYW5keSBEdW5sYXAgd3JvdGU6DQo+IEZpeCBrZXJuZWwtZG9j
IHdhcm5pbmdzIGluIGd0dC5jOg0KPiANCj4gZ3R0LmM6MTE1Mjogd2FybmluZzogVGhpcyBjb21t
ZW50IHN0YXJ0cyB3aXRoICcvKionLCBidXQgaXNuJ3QgYSBrZXJuZWwtZG9jIGNvbW1lbnQuIFJl
ZmVyIERvY3VtZW50YXRpb24vZG9jLWd1aWRlL2tlcm5lbC1kb2MucnN0DQo+ICAgKiBDaGVjayBp
ZiBjYW4gZG8gMk0gcGFnZQ0KPiBndHQuYzoxMTUyOiB3YXJuaW5nOiBtaXNzaW5nIGluaXRpYWwg
c2hvcnQgZGVzY3JpcHRpb24gb24gbGluZToNCj4gICAqIENoZWNrIGlmIGNhbiBkbyAyTSBwYWdl
DQo+IGd0dC5jOjIyMDk6IHdhcm5pbmc6IGV4cGVjdGluZyBwcm90b3R5cGUgZm9yIGludGVsX3Zn
cHVfZW11bGF0ZV9ndHRfbW1pb19yZWFkKCkuIFByb3RvdHlwZSB3YXMgZm9yIGludGVsX3ZncHVf
ZW11bGF0ZV9nZ3R0X21taW9fcmVhZCgpIGluc3RlYWQNCj4gDQo+IEZpeGVzOiBhNzUyYjA3MGE2
NzggKCJkcm0vaTkxNS9ndnQ6IEZpeCBmdW5jdGlvbiBjb21tZW50IGRvYyBlcnJvcnMiKQ0KPiBG
aXhlczogMjcwN2U0NDQ2Njg4ICgiZHJtL2k5MTUvZ3Z0OiB2R1BVIGdyYXBoaWNzIG1lbW9yeSB2
aXJ0dWFsaXphdGlvbiIpDQo+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBp
bmZyYWRlYWQub3JnPg0KPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRl
bC5jb20+DQo+IENjOiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+DQo+IENj
OiBaaGkgV2FuZyA8emhpLmEud2FuZ0BpbnRlbC5jb20+DQo+IENjOiBDb2xpbiBYdSA8Y29saW4u
eHVAaW50ZWwuY29tPg0KPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVs
LmNvbT4NCj4gQ2M6IEpvb25hcyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVs
LmNvbT4NCj4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gQ2M6
IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGludGVsLWd2dC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+DQo+IENjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9ndHQuYyB8ICAgIDQgKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQo+IA0KPiAtLS0gbGludXgtbmV4dC0yMDIxMTAwMS5vcmlnL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYw0KPiArKysgbGludXgtbmV4dC0yMDIxMTAwMS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMNCj4gQEAgLTExNDgsNyArMTE0OCw3IEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCBwcGd0dF9nZW5lcmF0ZV9zaGFkb3cNCj4gICAJb3BzLT5zZXRfcGZuKHNl
LCBzLT5zaGFkb3dfcGFnZS5tZm4pOw0KPiAgIH0NCj4gICANCj4gLS8qKg0KPiArLyoNCj4gICAg
KiBDaGVjayBpZiBjYW4gZG8gMk0gcGFnZQ0KPiAgICAqIEB2Z3B1OiB0YXJnZXQgdmdwdQ0KPiAg
ICAqIEBlbnRyeTogdGFyZ2V0IHBmbidzIGd0dCBlbnRyeQ0KPiBAQCAtMjE5Myw3ICsyMTkzLDcg
QEAgc3RhdGljIGludCBlbXVsYXRlX2dndHRfbW1pb19yZWFkKHN0cnVjdA0KPiAgIH0NCj4gICAN
Cj4gICAvKioNCj4gLSAqIGludGVsX3ZncHVfZW11bGF0ZV9ndHRfbW1pb19yZWFkIC0gZW11bGF0
ZSBHVFQgTU1JTyByZWdpc3RlciByZWFkDQo+ICsgKiBpbnRlbF92Z3B1X2VtdWxhdGVfZ2d0dF9t
bWlvX3JlYWQgLSBlbXVsYXRlIEdUVCBNTUlPIHJlZ2lzdGVyIHJlYWQNCj4gICAgKiBAdmdwdTog
YSB2R1BVDQo+ICAgICogQG9mZjogcmVnaXN0ZXIgb2Zmc2V0DQo+ICAgICogQHBfZGF0YTogZGF0
YSB3aWxsIGJlIHJldHVybmVkIHRvIGd1ZXN0DQo+IA0KVGhhbmtzIGZvciB0aGUgcGF0Y2guIHF1
ZXVlZC4NClJldmlld2VkLWJ5OiBaaGkgV2FuZyA8emhpLmEud2FuZ0BpbnRlbC5jb20+DQo=
