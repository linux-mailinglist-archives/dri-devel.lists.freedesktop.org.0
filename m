Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 409AC44AC39
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 12:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD616E2B6;
	Tue,  9 Nov 2021 11:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322BF6E2B6;
 Tue,  9 Nov 2021 11:02:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="213153441"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; d="scan'208";a="213153441"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 03:02:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; d="scan'208";a="563979915"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2021 03:02:30 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 9 Nov 2021 03:02:30 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 9 Nov 2021 03:02:29 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 9 Nov 2021 03:02:29 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 9 Nov 2021 03:02:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6nyJ5eK+6G1oAOsRV9/GdICBQpwG6N5IgNEkCXVqRbnAmftmph20NRkz5dwr1mDcJprU4D4otvw4+7dWf1CpyDYOPk0M7TE4QegskTrMgjixxgDp2Psec7cZ58UQc4kXQrPsGrSIXqW0jBCqYUOD3OrkneLDf2nfQ5ZJ9ewQ1yrb5Xm9rp61NrPlNab2kUqRuU5M+3ilelvsTzKRlM9xD3ubfojiUkhKLZfwvf7ayTGqc4DMuoYJMfN3mU7PaPefUYJIyWgiyKnP+6sADvLZ6ynU+WGhx6KbNGjEcshUjdYZ5iw2AdSEFEhdmbeCyLjTmBI3reDgKNQdu8kac8c0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBH6kYYuYByB5Y5xYf5nRUtePSMd7tG9hfm7CybUGJw=;
 b=KhJhwLusqrkTyYt58he79byJbqkAMZsyzlbgPNJ7wFdLl3tk5QA9H3XpjDd7mJv9trXRJrXnJ5IEqKAH/ub64nT71n1C4cw09zod61S0kM7b9T0nxk8cc9ZuqqwJZK+FoJhdcj6DtiRLLMT5fHbdAZRTTwfd3G5r/DsP+CgKw1KEd+Y4dv4sOXP89/ALEFFg3D/pvSa/04wKOjH0WFJTLhiQFY2LNcZxqq8Sg7NSMbEYAZY9u1ateUAm6Jwq6eBCnwqyKBF1mqozcYmuVND5HrmcmMadRJMLc80lKmOaOHGeV2hI1BtpqBaRvIJ0zGwtSihYNjzmwATK4kak85qs9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBH6kYYuYByB5Y5xYf5nRUtePSMd7tG9hfm7CybUGJw=;
 b=lASVklb9d8l5BorIakPXiNNuMnqZL7ukn/JfTlSwRWTkdbtqlMpyZT0lDEvP5rTXmn0dFTdRKrv8vYG9rEVZ7HTK3RUw5IvZKxVwUKGaYe6NaitGHyCHiPfTDUOi1+BTJ7XeDZ/IlFs2Cbot1xRAE7VFRju0NhMzM5ryaXO35AE=
Received: from CH0PR11MB5538.namprd11.prod.outlook.com (2603:10b6:610:d5::23)
 by CH2PR11MB4310.namprd11.prod.outlook.com (2603:10b6:610:3d::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 9 Nov
 2021 11:02:28 +0000
Received: from CH0PR11MB5538.namprd11.prod.outlook.com
 ([fe80::f54b:a185:b50f:27ff]) by CH0PR11MB5538.namprd11.prod.outlook.com
 ([fe80::f54b:a185:b50f:27ff%2]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 11:02:28 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: "hch@lst.de" <hch@lst.de>
Subject: Re: [PATCH 1/3] i915/gvt: seperate tracked MMIO table from handlers.c
Thread-Topic: [PATCH 1/3] i915/gvt: seperate tracked MMIO table from handlers.c
Thread-Index: AQHX1Od2ewkiyRHA1kGOSyaP59dZeqv6xTKAgAAcJgCAABupAIAABHYAgAAEN4CAAAIEAIAAAQ+A
Date: Tue, 9 Nov 2021 11:02:28 +0000
Message-ID: <040f15a2-e538-8762-1a85-82df0c4190cc@intel.com>
References: <20211108212718.10576-1-zhi.a.wang@intel.com>
 <875yt17qzs.fsf@intel.com> <5dd106e7-e62f-dfcd-bfa1-3f92794b8e3e@intel.com>
 <87o86t636f.fsf@intel.com> <20211109103622.GA7607@lst.de>
 <ddff22c4-fa19-24b4-c5e5-9910abb02bf6@intel.com>
 <20211109105840.GA9675@lst.de>
In-Reply-To: <20211109105840.GA9675@lst.de>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fe9b8fc-2e0e-4263-8247-08d9a3706b62
x-ms-traffictypediagnostic: CH2PR11MB4310:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CH2PR11MB4310A9C0A73AF4504CC0FF25CA929@CH2PR11MB4310.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZKind1UvC4wjaPOLOVnGBqYcStnbEqWIYfWPhv9NDbveAcSYMEzAQ1UIZatPkjdMAC4eypgdBnTnnPFlZylshlLxSHb7rck3G/8PvR8H1PlDwpnr2FDcV2kUoKh7kiZOlfTIVvUI0LNx6s7qjHH5rwWcJ7A4A/UUdSQslGxqSrrYQHfyurdF8uTpoAIDnMkrVdxIDTvecgE8rtnsOVoIELAhaUL/hIlyCMnl5CXv1SKE95kvxwDAaG0QQYvRjeSoCnEdW/IUXc0Gms4sAJJbaWAUVa+65GOKy2w3LQVhiw929Jx2HsUPosVl4tvXJpClN1bMv/wK15K/rZwPkd4HrWhKCSbsNXGe7hUCV3hUDDYgRoDuLHKlivVYIdRCnvPYkODxgwDyvYr6ZIghygSXxdJF/nSrRr4DPJ1GmuLaE1h/AGHgJVVo3B+RWBZgUsWDbWAxoqtWYwePhrcy4kv25iWNb+qu5xY7ZqDvHYuMnXaUpGi+9ZDGsQ962jUvubzKdcjHlaLKIPPsnERXiULa6LR6D9sBFMLUqJ6hX9lvOt+83cbMFcTCAMnt1oJeChzTy1fDj3euv45ROnipvEM5bL8JafAy4zvU2afPpEodasKru5uWQtU/lP+X+JhjeEB8Xd2/abprlnBUh/7eNS3vSQ6UD4RkIBqDw+1ZUbXdiWhBb051T+9YaRwY4nIY2rHS9a9Kv20vlRfgEqxsq/XeO/Ok26nT67D/TH5G1NlpmFH/sA3lyQ6lNrwnmQXlpVhw7bs8D1qGxpEjhFjOKvLblw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5538.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(71200400001)(6506007)(122000001)(8676002)(82960400001)(38100700002)(5660300002)(53546011)(66446008)(64756008)(2616005)(66556008)(66476007)(4744005)(91956017)(31686004)(66946007)(26005)(36756003)(6486002)(7416002)(4326008)(76116006)(508600001)(83380400001)(8936002)(38070700005)(31696002)(316002)(86362001)(2906002)(6512007)(54906003)(6916009)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WlFnRmdMdzZLT3p2UnY5WHVzaDZja1R6L3UvSkFZU1RDaWpnOWk5eTEvYmRw?=
 =?utf-8?B?bUpvWmZ1TDVoenJwU1NrOEp4bjk2L1dyTDJUZEJwdERwcEE4M0FoalVoM2pV?=
 =?utf-8?B?cW5GbDJsUFF3YStlNEthdCtIUmtwUEZ0alAyM2U2bzVxS1puOTNoM3E5NklM?=
 =?utf-8?B?YkorTXRHMDBBU3h5YUVJbnowdThuMjNncUVNa3RFR1JZb3o2Yk9PYzdFZXRX?=
 =?utf-8?B?UmlwSnJaL2RaNk8zS2NSZjFUTGJKOEdveDNuRzdmUCtSUGVNRC9zZ25PNHdq?=
 =?utf-8?B?OEVHZE13VkMyRVlNN1h5dkgweTRpL2UrMjhkbjJ0S1hpSHVuaW14Vjh5bk81?=
 =?utf-8?B?YkFEQXVseUNWQUROWUtGT0tNaCsyUE0yNFRpc2JvQ1JtL3g2d0tYaXk0YXBq?=
 =?utf-8?B?N2pYZ0s3WlJmRHMxYzUvMUZkN0N0dlp2blN4SE5iQjZ5V3Jhd1pFZ2hYQ256?=
 =?utf-8?B?bDZDV1dMZVZxV2c5SzhJYUlmdlBoaHZvV1BNQXNxMXVZN0doUkhxUXBRMmlI?=
 =?utf-8?B?TUpYVnc0UDhvNXNlVFVKanV4b1A2UzF1ZFdBOHlVTWVHRW9mTlhBUTFSNVp1?=
 =?utf-8?B?WjJzaGpEZTUrVU9mUjFVUVkrMWdoYmdvK2tMYnBqUkF2YlpsaWNzU2xNS3Aw?=
 =?utf-8?B?WEFZcTIrMUFVZ3h0TkYxTnU0cko1UmdTejhYN2pDSjgvb3NxdUdOQWMwd0cz?=
 =?utf-8?B?ZmZXL0xpeVhKbVlSVmNiMWNhclpiSHE4c0l5WVNzVTJudVFTM245TXVDWSts?=
 =?utf-8?B?b3hGKzB3SEtvbzZKUDdndkxvaVpUK0Vrc3N1ay83aVduWklpSGp2V1ZJeU1Y?=
 =?utf-8?B?eXpVbFNHVkcrVXhPTU5zb0lKZWxLQ1MzQWNVZWlwaEZyQ080Lzc4MDlYODBr?=
 =?utf-8?B?YVBMaVBDS0ZOazJmeHZHVW1VcVNzMDRZOWsrbExrQi9rWWMvUXpqUzZPZ1pM?=
 =?utf-8?B?RUNqWHN3QWxHbkUrVzlLWkZCcG54cGFpRnBYQ2xKaXpxMWZ4R2NkRE00UEZH?=
 =?utf-8?B?d0NEa3ZybU5uaXd6MEVnOStjMEFyNmhJSExmdGwrR0tkUzN2WHRkYzlCMTBw?=
 =?utf-8?B?SUJvd0FjZkoyUkNrQTA2aERmayt5a1h4dHZ4cTM0dkp1L3NGL0JuMFZpenVG?=
 =?utf-8?B?QTNzT0xvWHpGQVEwS2tJeXcwTDhYei8wVXBtOVNsSjAxdVQ2cjVBZ2J6UmZH?=
 =?utf-8?B?VjNpTlkwVHRzMXE1SExwSGZTMCtPeDRxd3lFb3dCeXlmZWwyRVJuaHp6RGVM?=
 =?utf-8?B?ck5WdzNGaUVydGZtbU1OVUFTUU85UXNMbEsrYWVNS0FSb2oxVE9NcGc4Uy9n?=
 =?utf-8?B?Mi9Sb0F2bnBBbjB4VlRab0RieG92eTBpTW5WUnBkU2UzZTluUDJYdC9tZy9X?=
 =?utf-8?B?OEFyZjVSaGRMOFhETFdPQ2VlYkRVZ2RrVHJhSys2d0RwVEI2RU8vZDlndisy?=
 =?utf-8?B?Tm91RzdKY2ptd3lLN1RlVVdVanB3SlpmOG5FTE4wZHlQd2ljQ0RLbm1lRHZI?=
 =?utf-8?B?SUhOWGVMSUx3bGtwTUR5VHM5cGtiQmsrMlBGWXBSdWhIeVV0Nm96TFcvazM3?=
 =?utf-8?B?VVJ6czMwK0g4dUpLZnQyRWhnaEsvQnZXTXJ4YTAvWmF2NUJCNjlHZllSSDA4?=
 =?utf-8?B?ZTU3Z2NxVEFnUEJ2eEdiMExFaUdnY1JTSFNFRUN0bXNpdkJpbDdWdFhOWS80?=
 =?utf-8?B?NzVYbkM1aUhkQ1RvY0VQQ25IRnFSSTNiaHNhVmVjVWo2TGkwSjB5Vll0bEhm?=
 =?utf-8?B?NVRqRWd6WFNnMWtSa3p1NUVIUDI0Qjd5OUtSOHBtc0xxUVhFSktkQ0tENm4x?=
 =?utf-8?B?YTJqaUhlV0gyNUMrVWkzMTd4dUxBYkZCT2p6Zkp5cHVvNllqTWZQRDA1eG9Q?=
 =?utf-8?B?S1RCZ3JoWG5pL0oveUVhTzd3dW1Dc3J6eWJ1bllWNlRubUU3M3JmUW1TNGM0?=
 =?utf-8?B?cHVSLytNU1QrbFplbDNyQWVnZEYwY2Z2a1dNVkFZaTd4bkVHSnVwZXRTaGtz?=
 =?utf-8?B?ZVViUHg0TkZrZys4OEswV2hMaDhUVTNJRkZxQkc0aWVoalRQcElKWDBQRGZO?=
 =?utf-8?B?b1JIbnZ5NkVLSDFjZzlPYXEwYmFmVVI0a3RWL3haa3dXOWdQVkJsSCtOWDlr?=
 =?utf-8?B?cnB2Y0pPVlpkSFdka3NaSWZtTmtyVFFkQ2QzUjdKK0g5bmhRTVNiY3ZxbElV?=
 =?utf-8?B?SVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE24E08A28998E4485736D241702497E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe9b8fc-2e0e-4263-8247-08d9a3706b62
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 11:02:28.1614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XY+4VE47C/Q+iD0r/zXwE8CqhPqoCDcQDby6hJNfkZN7WceO6eKmSOkaiSZMokEJCh/3jRWZgY/ADLcu9nihYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4310
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Zhi Wang <zhi.wang.linux@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvOS8yMDIxIDEyOjU4IFBNLCBoY2hAbHN0LmRlIHdyb3RlOg0KPiBPbiBUdWUsIE5vdiAw
OSwgMjAyMSBhdCAxMDo1MToyN0FNICswMDAwLCBXYW5nLCBaaGkgQSB3cm90ZToNCj4+IENhbiB5
b3UgZWxhYm9yYXRlIG1vcmUgYWJvdXQgdGhpcz8gV2UgbmVlZCB0aGUgaGFzaCBxdWVyeSBmcm9t
IHRoZSB0YWJsZQ0KPj4gQVNBUCB3aGVuIHRoZSBoeXBlcnZpc29yIHRyYXBwZWQgYSBtbWlvIGFj
Y2Vzcy4gSXQncyBhIGNyaXRpY2FsIHBhdGggYW5kDQo+PiB3ZSB0cmllZCBkaWZmZXJlbnQgZGF0
YSBzdHJ1Y3R1cmUgaW4gdGhlIGtlcm5lbCBhbmQgdGhlIGhhc2ggdGFibGUgZ2l2ZXMNCj4+IHRo
ZSBiZXN0IHBlcmZvcm1hbmNlLg0KPiBPaywgSSBtaXN1bmRlcnN0b29kIHRoZSBoYXNodGFibGUu
aCBpbnRlcmZhY2UuICBoYXNoX2Zvcl9lYWNoX3Bvc3NpYmxlDQo+IGFjdHVhbGx5IGRvZXMgYSBo
YXNoIGxvb2t1cCBpbnN0ZWFkIG9mIGFuIGludGVyYXRpb24gZGVzcGl0ZSB0aGUgcmF0aGVyDQo+
IG1pc2xlYWRpbmcgbmFtZS4NCg0KWWVzLiBNYXliZSB3aXRoIGEga2V5d29yZCAibG9va3VwIiBp
biB0aGUgbmFtZSBvZiB0aGUgaW50ZXJmYWNlIHdvdWxkIGJlIA0KYmV0dGVyIHNpbmNlIGl0J3Mg
d2lkZWx5IHVzZWQgaW4gdGhlIGtlcm5lbC4gOikNCg0K
