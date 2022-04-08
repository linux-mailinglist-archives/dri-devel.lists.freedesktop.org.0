Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E36844F97AB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 16:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B780510F282;
	Fri,  8 Apr 2022 14:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481FC10F27F;
 Fri,  8 Apr 2022 14:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649426884; x=1680962884;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=N04CrbonghHbn4TEAC8OxOt2//PU0GVTUSrjO906ko4=;
 b=RY9aHh8DvWAPWRRBptMyH+zPrVmObaWr/ms9pIn+iwJx2w3AVuozBOsA
 gLf/0RvpYEDF6I3IkHjhTXkqnROZ5jo+gaxxRiNi1GT7RaYCbCoaj/16n
 6UhCKRBPskPJg4PlVdNUv9RKqqABsJ5iuTtNx0W+Q23mVe4Ko0MA37s/I
 83UgO1zQ/3WvrLPkAn4pb0yBpLQqWXgppSpHWl6OE24aZwMLqTZOFAXqq
 ccv1iocUAVU70ljmafQPj7qNokRnUX+fubw47R42El8Xz9SyrSpvKmWNP
 djNytdAhRDXtptr3h0qgFfmOpUnHVDOhOfBW0E/wnafagPUEDopRzj2ie g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261591778"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="261591778"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 07:08:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="557787569"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga007.fm.intel.com with ESMTP; 08 Apr 2022 07:08:02 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Apr 2022 07:08:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Apr 2022 07:08:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Apr 2022 07:08:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeEBN+vbMJQDAGSsInROsud+CsVwJmWmZ8I2ccv2BVcHEa3lsbbs6Rm5Q9KkDbSwOVDh4zU0PdecnuCTqFR6F2CYQ1MUKj26u0oX4aJRkCqptIkVhnU3k3TnMQdzXlB3jCZ2wHfh8Hn3euYGnbdQcj8jjMX094PN0ibEhbomMpWOKF5wfxNvu/4uN38hLYCwOMEbv9if4za7IrOXSFNp+XrGgdyJK+u230bnxoPhblJ37zg4x4hfIFScoKTqOV9Id+xU8vWvpiUzKlbcE2CvcVjkgS/ypkeFMkFSXVquqBRKgyT/7jVDPVoBF82Crdy+OH6MfIhVvnYXurMfTsbFbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N04CrbonghHbn4TEAC8OxOt2//PU0GVTUSrjO906ko4=;
 b=ed0NLsxH/XelQvcMs9L4sBL3hWasLujA664pJccPjGRGV4r0sKWW1RB6Vq/64EatT3saysmdmtIMSz2sy245ZFTb+JvDzPttJjdTi8+KJH9Xm8YaEoVu7rTL+7RYHI1zzwg+lNNtshE2fypK8fEiMjYBer9WD7zNkCkBQMCLrFmw89xwqTNHOrhb4OHzg3SiCjHX/h84wPlD0YsTp2VgYohS77/n7JksM356Yjjq+Uqk23txaieUHAwEdLhqel7qQXyWq2+es9TXKbgdSDv9TF9qgNkNjw8BE/MOg6mu203gBMqgsVLVKSe/uvlWOX72ivgmpFS/b6OB+7cafV7SqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 BN6PR11MB1476.namprd11.prod.outlook.com (2603:10b6:405:b::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.26; Fri, 8 Apr 2022 14:07:59 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%5]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 14:07:59 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Zhi Wang
 <zhi.wang.linux@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v9 1/3] i915/gvt: Separate the MMIO tracking table from
 GVT-g
Thread-Topic: [PATCH v9 1/3] i915/gvt: Separate the MMIO tracking table from
 GVT-g
Thread-Index: AQHYSk/vDxh6otQMi0KsvRqKHUKM56zkjLIAgAGCyIA=
Date: Fri, 8 Apr 2022 14:07:59 +0000
Message-ID: <986b8ff0-d0de-437c-8a56-c54aafb6159a@intel.com>
References: <20220407071945.72148-1-zhi.a.wang@intel.com>
 <20220407071945.72148-2-zhi.a.wang@intel.com> <874k35541h.fsf@intel.com>
In-Reply-To: <874k35541h.fsf@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6da904a9-9425-470c-f721-08da1969303b
x-ms-traffictypediagnostic: BN6PR11MB1476:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB1476B9CDD26C60D734466FA6CAE99@BN6PR11MB1476.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BgUahAS02BRsAY1d0/+4uYxgT8D0t+rqMXqsbPPimMVdMTsiJ6SalqQxhoe9BCU4JCFL0YqN0RcbATqfxlu0Uioog05NkGUjKEosy9ym1u/aGcYXWU9W4yrVxTfwiwVNfPYVe5+TRjabo2U7cJ4lVC1STWRduNyEAh0Wn3iLQ4b9o094XDm5jOjiZmwdY/Ira239gx44smfPuTC00EDH1sRazfpQGf3+HKKgAnaP2B6xXUmN5QFNYwrRawgDgqXwfNY+FDsFqOfSJppR8EJ5JvRK4hvbIB61zorJkR5nQ5vNlGJ+dMbrb5NRiJu1XD3Rx+KF2bzMel+FrUkV5bcshV8FpeVk9tenQN1Jv40PynBc4VtR5AwwhmSfVvP8vJUufbK+8ZtSmS173JPP+oY5TkPkU+T4arwkWkZbgiMlWLxoTNf5bnMK0wjSn5pOxn3JcwzQjAYTGEgqSCNKmmSVoIn+in7YFR/r+clzpO9hDOwQvvstvd/O2+WQaajHTSuWjcGp3XcZLG4JV5PhTr5juNYj1SP9FUzYJGQQfo4VjTt/huDAXYeecNLymv2guA19l0R9KuZ55DIMaJVuUlJt6aFMWzEVceCVPi2AkF676XMCmOa0tirrMke2V2WFxd57FTx18DtxNchQRVouVAY8o//NPJEZAPKFL3COf9U2FqhK2A5vxAChlgMxWsV4c/nbEurWVAG+R9Q426uTqEQbCDH1GaqP+yqS2fVtECVQv0f9yH44ji9Rt/uaQkx8TwXnHadBo4/SQB95a0KQ8TdbFQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(64756008)(91956017)(4326008)(66946007)(66446008)(66556008)(8676002)(2616005)(76116006)(6512007)(66476007)(31686004)(82960400001)(36756003)(53546011)(6506007)(316002)(110136005)(54906003)(26005)(186003)(7416002)(122000001)(6486002)(71200400001)(8936002)(83380400001)(38100700002)(31696002)(86362001)(5660300002)(508600001)(2906002)(38070700005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3IvbERqVVB2NkpkWGN1b2xyL3VVVkNjVnpqUHJJcEtLdDZ1TTkrcEtRdlJL?=
 =?utf-8?B?VlNxbU9Ebk8rSElid3A1YVN5a1dVaWRwcjQzUkxQa2JvZWtpbEIzMW1EQ0pG?=
 =?utf-8?B?WWZicE1yQzJPcmFxTWdab2dlWlp6ZTY2blNva3hFazZTNE1mTjczSXBSUkJP?=
 =?utf-8?B?a1hWS0JoNVZMMXRJSkdhT3Y3UlkwWllCY0FBOGUxNmt3L2UwcHZna3BMNzVU?=
 =?utf-8?B?VEhUTTREM1Z0TysxcGg4MjNVOEhGL3lRUWF2YXI3Wi96aVdVc2hQekdXdVNM?=
 =?utf-8?B?eFFDQlp1UmJacmFTTmsydGVqeFNwOXArMTVpY0JVYjNqTUFnR2IvRnR4WnBj?=
 =?utf-8?B?a1hsOUE5bytoYkVXYTJQUVBpOWRQREhzSDlla1Rxd3pzSXd6WEtYY0ZaK1RK?=
 =?utf-8?B?ZVJibEF5eDcyVzNrOVlVSzR4QXZNRGFXc21saG9lMVBibTNlZGFIODFBb1RV?=
 =?utf-8?B?eHNtcW5SZmZtRFc4UHRKWDI5Y25RNDZJNkhlWjF6dm1LYllTbHZlTW1PUzht?=
 =?utf-8?B?bHhGQzBJV09rOWJrdHRWU1hOVGQwYTA2NkRsQkNBVm5Qb0t6a0krZjFwNm9w?=
 =?utf-8?B?ai9ENkJpa1JyUFkwbFg0Y3Uvb0VuanZ2NndUc2hEK28vM205UzJDZUNiY3k3?=
 =?utf-8?B?WkRGNWRFcDU5SHZMZGplTVZoNVJtREJ0UTFXZlFxVDhNZng2RUZUbnJsMm1U?=
 =?utf-8?B?ajdRY3V3NTRLZTdsK3h4ZGtmYmlpUDRGTWl2VjBuVzBVb3NDWTRYRWlhUnRo?=
 =?utf-8?B?QTFoSWdXdzRtQ0tGR2hlaVQzTktxc3ZHWTMyb2lmMzhWUHNxdFdNM3pIZ3Fa?=
 =?utf-8?B?czZzVm5zQXdvdzJRMDJEeHpQYmJjQXU3bGtSbjNERG5MSkV5TzRXV0xYOUxI?=
 =?utf-8?B?Y3F6VXNFQk52WnFTbTdQcEk4akFyQ2dtS1hxYkd4Um9LL3dTS3A4SWpORitY?=
 =?utf-8?B?WllHRm9lR01jQVREb0kwQnYwNUNnZlpOUWk0aDVQWkIyTllkSlo3ZGtaSkdl?=
 =?utf-8?B?QjMxUWxpU0Q0d3E1NzF4THI5ZEZXV21DbEFMeTAzcHZyZFYzdzQwcjc4RUlO?=
 =?utf-8?B?YjlRMjMzcGlqYmtYak9NTlAvbnJCdVA4V1p6U2tEbFhOTmpGTW9CY2VWOGdh?=
 =?utf-8?B?Y2VjSXA2YTZLbXUxcUN4ckxBelVQVTlDTGdHU045UzlWOWFXZzhsVjVHUlBJ?=
 =?utf-8?B?WVpRRlc2N1FiTDZCV0dVZHQ3MTE3THYrVUZVY3NvYTEwZENWK2xMMUZxY0ph?=
 =?utf-8?B?OThwQldLS0Rwd3U2VHUwV0t3TnZqWHowMDUra1I2azFQOUJQTTR3Qm5Bbnpz?=
 =?utf-8?B?cTlqWVdEUnRHTXRaRXpWa3dXdG5rdURneUh4dzhRMDN2OFk0ejNsbkNsVW1v?=
 =?utf-8?B?QWRBOFpYUmVjQ1NDNzVNUDZKS2Fmdm5JaUN5cWEwbUw1R0Y4Q3VUVC9ZUG84?=
 =?utf-8?B?MlprcHJid0VvTHhORFFkVGgwb2lsZy9uUnNvZkZ5Uk9Ca1NkVUZwM09CSE1T?=
 =?utf-8?B?RUJGQk5oUDMva0RhL2ZSUGRZWXl5eTd4UUF2VEFlK2JDVkF6QUtNcGFhV1ZE?=
 =?utf-8?B?TGVYVDhMdk5DeHI0QzhTSnYxTmhYSVFXQmxDeXl2Z1NMcVZYUlVWb21VdTV1?=
 =?utf-8?B?bUxLOUY1OHIyb0dBMncrRTlUMCtMb0dVRnVNWnVMZ2NxK2lTNG9BQVF0MU9t?=
 =?utf-8?B?cVdSRW5GVUV0cklFRjZKTHNTdThVYVNPaXlibVZPZUIvaDlNb0ZoQnprd0lz?=
 =?utf-8?B?citCQVk2dUtPcmYwdjV2V2RiWm1Oa1JaNnpseEp4YWUwTENpUk12aVdIRXh6?=
 =?utf-8?B?cVlSa3Z3OEhpSURXUitESU9QS24yMXhCUjYzWXE0UnY2STQvVDA5RHpxWnJ1?=
 =?utf-8?B?N1lPZ3lva2czd3dhSTBDbmIyWGpqMlBHeXc1SStDaEFjVGV2cmtqelpXY01J?=
 =?utf-8?B?TDB5MXBEUURyOGFHangwOUVLcHJEOGpPdFdkTFBNUDI1K3FCdzNLTktOZFNk?=
 =?utf-8?B?RWhOYUI2TGw1cDBBRnBtREc3b3dLWUlabm9PRGVvZ2J0Ujltby91S09vUlFu?=
 =?utf-8?B?OXQwT04xL3FJbC85MGpxNG9qRnd6dlZ4djBHclFETkI3SHlLdWowWENWc0da?=
 =?utf-8?B?WE1ZRXczUG5QY09ZelhnS1c0a2VrcCtmanM3NHh6N200eGkrSitTMWpsQVEx?=
 =?utf-8?B?ZDlWdExESGlObU5ickR1bUppY3hpSDBCNVlONTJhYUNFQ2tUUHpnSjNneVk0?=
 =?utf-8?B?TXc4MUlmMXZ1cnVNK3RSb3dOVTBXcjBDVHVBTTA1emxOam5TV3lBREEwb0ZE?=
 =?utf-8?B?K2NsTVY2d00rNmkzME0vVmRDM2c5RE9Gckh4OHI5YTRQYm1aTHViZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <278712CB053F3B428BB5AB2D98705F55@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da904a9-9425-470c-f721-08da1969303b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 14:07:59.7218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z/lPTDM6IqJQePvhdZPWPin6lSObsNdE6B7ELQLQq39WklrNQ20LVcX9FPaaKLAbsmpEkCJHQJVoUM79dh8Qiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1476
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
Cc: Zhi Wang <zhi.a.wang@gmail.com>, Jason
 Gunthorpe <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFuaToNCg0KVGhhbmtzIHNvIG11Y2ggZm9yIHRoZSBoZWxwLiBDYW4geW91IGdlbmVyYXRl
IGEgbmV3IHRhZyBvbiBkcm0taW50ZWwtbmV4dD8gSSBub3RpY2VkIHRoYXQgdGhlcmUgd2FzIG9u
ZSBwYXRjaCBtb3ZpbmcgdGhlIERNQyByZWxhdGVkIHJlZ2lzdGVycyBpbnRvIGRpc3BsYXkvaW50
ZWxfZG1jX3JlZ3MuaCwgd2hpY2ggaXMgbm90IGluY2x1ZGVkIGluIHRoZSBsYXRlc3QgdGFnIG9u
IGRybS1pbnRlbC1uZXh0Lg0KDQpHdWVzcyBpdCB3b3VsZCBiZSBiZXR0ZXIgdGhhdCBJIGNhbiBj
aGFuZ2UgdGhpcyBwYXRjaCBhY2NvcmRpbmcgdG8gaXQgd2hlbiBjaGVja2luZyBpbi4gVGhpcyB3
b3VsZCBwcmV2ZW50IGEgY29uZmxpY3QgaW4gZnV0dXJlLg0KDQpUaGFua3MsDQpaaGkuDQoNCk9u
IDQvNy8yMiAzOjAzIFBNLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4gT24gVGh1LCAwNyBBcHIgMjAy
MiwgWmhpIFdhbmcgPHpoaS53YW5nLmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6DQo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZ3Z0LmggYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pbnRlbF9ndnQuaA0KPj4gaW5kZXggZDdkM2ZiNjE4NmZkLi43NjY1ZDdjZjBiZGQgMTAw
NjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9ndnQuaA0KPj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZ3Z0LmgNCj4+IEBAIC0yNiw3ICsyNiwxNyBAQA0K
Pj4gIA0KPj4gIHN0cnVjdCBkcm1faTkxNV9wcml2YXRlOw0KPj4gIA0KPj4gKyNpbmNsdWRlIDxs
aW51eC9rZXJuZWwuaD4NCj4gDQo+IFlvdSBvbmx5IG5lZWQgPGxpbnV4L3R5cGVzLmg+LiBQbGVh
c2UgYWRkIGl0IGJlZm9yZSB0aGUgZm9yd2FyZA0KPiBkZWNsYXJhdGlvbiBhYm92ZS4NCj4gDQo+
PiArDQo+PiAgI2lmZGVmIENPTkZJR19EUk1fSTkxNV9HVlQNCj4+ICsNCj4+ICtzdHJ1Y3QgaW50
ZWxfZ3Z0X21taW9fdGFibGVfaXRlciB7DQo+PiArCXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpp
OTE1Ow0KPj4gKwl2b2lkICpkYXRhOw0KPj4gKwlpbnQgKCpoYW5kbGVfbW1pb19jYikoc3RydWN0
IGludGVsX2d2dF9tbWlvX3RhYmxlX2l0ZXIgKml0ZXIsDQo+PiArCQkJICAgICAgdTMyIG9mZnNl
dCwgdTMyIHNpemUpOw0KPj4gK307DQo+PiArDQo+PiAgaW50IGludGVsX2d2dF9pbml0KHN0cnVj
dCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdik7DQo+PiAgdm9pZCBpbnRlbF9ndnRfZHJpdmVy
X3JlbW92ZShzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYpOw0KPj4gIGludCBpbnRl
bF9ndnRfaW5pdF9kZXZpY2Uoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KTsNCj4+
IEBAIC0zNCw2ICs0NCw3IEBAIHZvaWQgaW50ZWxfZ3Z0X2NsZWFuX2RldmljZShzdHJ1Y3QgZHJt
X2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYpOw0KPj4gIGludCBpbnRlbF9ndnRfaW5pdF9ob3N0KHZv
aWQpOw0KPj4gIHZvaWQgaW50ZWxfZ3Z0X3Nhbml0aXplX29wdGlvbnMoc3RydWN0IGRybV9pOTE1
X3ByaXZhdGUgKmRldl9wcml2KTsNCj4+ICB2b2lkIGludGVsX2d2dF9yZXN1bWUoc3RydWN0IGRy
bV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KTsNCj4+ICtpbnQgaW50ZWxfZ3Z0X2l0ZXJhdGVfbW1p
b190YWJsZShzdHJ1Y3QgaW50ZWxfZ3Z0X21taW9fdGFibGVfaXRlciAqaXRlcik7DQo+PiAgI2Vs
c2UNCj4+ICBzdGF0aWMgaW5saW5lIGludCBpbnRlbF9ndnRfaW5pdChzdHJ1Y3QgZHJtX2k5MTVf
cHJpdmF0ZSAqZGV2X3ByaXYpDQo+PiAgew0KPj4gQEAgLTUxLDYgKzYyLDE2IEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCBpbnRlbF9ndnRfc2FuaXRpemVfb3B0aW9ucyhzdHJ1Y3QgZHJtX2k5MTVfcHJp
dmF0ZSAqZGV2X3ByaXYpDQo+PiAgc3RhdGljIGlubGluZSB2b2lkIGludGVsX2d2dF9yZXN1bWUo
c3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KQ0KPj4gIHsNCj4+ICB9DQo+PiArDQo+
PiArdW5zaWduZWQgbG9uZyBpbnRlbF9ndnRfZ2V0X2RldmljZV90eXBlKHN0cnVjdCBkcm1faTkx
NV9wcml2YXRlICppOTE1KQ0KPj4gK3sNCj4+ICsJcmV0dXJuIDA7DQo+PiArfQ0KPiANCj4gVGhl
IENPTkZJR19EUk1fSTkxNV9HVlQ9eSBjb3VudGVycGFydCBmb3IgdGhpcyBpcyBpbiBtbWlvLmgu
IFNob3VsZCBiZQ0KPiBib3RoIGluIHRoZSBzYW1lIGhlYWRlci4NCj4gDQo+PiArDQo+PiAraW50
IGludGVsX2d2dF9pdGVyYXRlX21taW9fdGFibGUoc3RydWN0IGludGVsX2d2dF9tbWlvX3RhYmxl
X2l0ZXIgKml0ZXIpDQo+PiArew0KPj4gKwlyZXR1cm4gMDsNCj4+ICt9DQo+PiAgI2VuZGlmDQo+
PiAgDQo+PiAgI2VuZGlmIC8qIF9JTlRFTF9HVlRfSF8gKi8NCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9ndnRfbW1pb190YWJsZS5jIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaW50ZWxfZ3Z0X21taW9fdGFibGUuYw0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+
IGluZGV4IDAwMDAwMDAwMDAwMC4uZDI5NDkxYTZkMjA5DQo+PiAtLS0gL2Rldi9udWxsDQo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9ndnRfbW1pb190YWJsZS5jDQo+PiBAQCAt
MCwwICsxLDEyOTAgQEANCj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUDQo+PiAr
LyoNCj4+ICsgKiBDb3B5cmlnaHQgwqkgMjAyMCBJbnRlbCBDb3Jwb3JhdGlvbg0KPj4gKyAqLw0K
Pj4gKw0KPj4gKyNpbmNsdWRlICJpOTE1X2Rydi5oIg0KPj4gKyNpbmNsdWRlICJpOTE1X3JlZy5o
Ig0KPj4gKyNpbmNsdWRlICJkaXNwbGF5L3Zsdl9kc2lfcGxsX3JlZ3MuaCINCj4+ICsjaW5jbHVk
ZSAiZ3QvaW50ZWxfZ3RfcmVncy5oIg0KPj4gKyNpbmNsdWRlICJpbnRlbF9tY2hiYXJfcmVncy5o
Ig0KPj4gKyNpbmNsdWRlICJpOTE1X3B2aW5mby5oIg0KPj4gKyNpbmNsdWRlICJpbnRlbF9ndnQu
aCINCj4+ICsjaW5jbHVkZSAiZ3Z0L2d2dC5oIg0KPiANCj4gR2VuZXJhbGx5IHdlIGhhdmUgdGhl
IGluY2x1ZGUgbGlzdHMgc29ydGVkLg0KPiANCj4gT3RoZXIgdGhhbiB0aGUgbml0cGlja3MgYWJv
dmUsIHRoZSBzZXJpZXMgaXMNCj4gDQo+IEFja2VkLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1
bGFAaW50ZWwuY29tPg0KPiANCj4gDQo+IEJSLA0KPiBKYW5pLg0KPiANCj4gDQoNCg==
