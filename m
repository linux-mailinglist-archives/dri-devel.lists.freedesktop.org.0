Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5371876F4A6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 23:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0EA210E665;
	Thu,  3 Aug 2023 21:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4E310E664;
 Thu,  3 Aug 2023 21:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691098496; x=1722634496;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=b84MKX6exLtFaa787ZRkFpNDeEwXK2rZJD0++1ZAkWA=;
 b=FcAS+26G1/4ku0B5ZMdBLTXHxOngtLhnDm+QBiWiKtswn/EKUch1QG9g
 2ltCu+oa9/L/lEpWG+Y07CpNWMSxeXsNYCnaM+d9YevGYHlxJ1pr41jlc
 kS0K2AStpPuf0zRsGCP9Wru5+HYHHYCAcrVjz59VUrqA6eJ/JmEP/gnb4
 lqNzgyaA/6NPpEc/qZxteI+8/jHUt1Rrp8RcGIHuA/zTVdUchcJQ9yXNJ
 /vihzySj3U8Q6YdNdw4JxGSZhGCS1GTZr42CAce1YDMom+YNICOt7JeDs
 yLTz8xdhI+fPHvja1oylrFSfS6lhCyI6UtD+FfnSHw6/xAOIXxkerPt+6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="433854499"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; d="scan'208";a="433854499"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 14:34:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="873107079"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2023 14:34:57 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 14:34:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 14:34:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 14:34:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfIJkTINvCmHJhpe+i0PtaalzlGK7dTdmKw3VfUhtEz2GOKRfEnM9Tp6FcbyqKBO39NsaHJ469+uCQA+GjVDnDP52ICnZxf+ng8BmdZko02patSzDYSxTk6fJmxkffRgE5hdQxrbnqFVeCGbKQM8rCOWiJWqEJSOmDun2BBiuM96tADg7qjgLBgqfFJQTixiOnxj03nSIM3F5w+hwHxDN4dArdo2RRH1T5qv9h9GP1I5c5xKIO4C3qHR8a4FprwtWbjBosTq6p8s5kKrDQChK65qQX2t43fIEgJEIHnv6fcZGZAc0RxLJb8PAN74Xkh7XLAB/xWWP/tXKRnxIaKktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b84MKX6exLtFaa787ZRkFpNDeEwXK2rZJD0++1ZAkWA=;
 b=S5/buhAObS3C3EsBI/ni5N4/5SK4BWO2Avhc726EuFtnvKyxR+Yze7b9e/0t0o9KzOwkV2NizEM1dSI87emaexP+gptEoUdBquH9PncNNpYwlU2nZirusTUBj0mkm0n/1Xd2WH/U7us0vEceBLKeqMIpJwP6J9fNcEGjlTQHAmWWCxH1fU+3S6/L0tP8eljNhZo83Q0pzQGCE9okdYOhZ4xlYl6shsgY2SnQeBl+mqKg3LmeSnTEUdaMSZmak+OhW+HiSLeRK1/TRs0OXif6YdepBDTTDZY8LvEJZaysRgl2FRHeW5AnEWUfagXcN/iMyBqhySGRvwnRkyxruNd0FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 21:34:53 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6652.020; Thu, 3 Aug 2023
 21:34:52 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/1] drm/i915/pxp: Optimize GET_PARAM:PXP_STATUS
Thread-Topic: [PATCH v4 1/1] drm/i915/pxp: Optimize GET_PARAM:PXP_STATUS
Thread-Index: AQHZxW7Nx0fGUh+6wEOvscZiy4Nh/a/ZGc2A
Date: Thu, 3 Aug 2023 21:34:52 +0000
Message-ID: <4162ebf00d65d0e06ef53524f07bb55e6af5710e.camel@intel.com>
References: <20230802182550.1592926-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230802182550.1592926-1-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|BN9PR11MB5276:EE_
x-ms-office365-filtering-correlation-id: 4fe596c2-c9cd-45bd-05f0-08db94697938
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RdLzfc4PZuI2m6111vcqNFJjDih4OO0IOwfarmIvQfr6R/d+qv9y8dAVF3rWnppRP923LQje0apdx343Jkujo0zwhRzCSmY75YQbNNjEczanSQ4uPfI3R1sC4peHSwaWYz3i1ZO+WPnW6+5rvQDSXpwo7wt5CSEr7bFl8YBEvg8oSrN38fuQOMFdNynj0txVpbpBb6Lr6ElYE9MBMJ71kuRrWeo3Slzo9LUOdht/4dCdvnSHNZClpBMEtX9G7ieW9jKpm48Jf3zOAHfIwPQsCjdm2GhEh+Gjnm3jIhRwR0Za6H+J7TDHChtZegv53qsKF9xuUsdilZoMJq3y2LION2B1V/47FMeCfZFAmmluSOaWhycDWzyDGJ6oJOOR/8PXsMZ57YcRUcejGBIHpl3k8LysvTQJzY2UPQd9Tbvpe/DJdoTkyN+rFwNceQn9f1LXdpo4Z0nF7WABwf/+YHUI7w7Rb9Mbp9JQQcm/B6TIBfDPbU8i4HdY7Br/jgAkMreAsdaNekL0ni8CnrJ9vXpJTAQAFjTv0tJsOOwXDqItqczunb/0m3o7JLvbyk6LqQ+HSMOIyrklVwTv723lSQGwBsr+KnB/6B8+x9cjtHox+a8ujJ4kZPBjIAzcduSfzr03
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(39860400002)(346002)(136003)(186006)(451199021)(2616005)(107886003)(6506007)(8676002)(83380400001)(26005)(2906002)(66476007)(316002)(66556008)(91956017)(4326008)(66946007)(5660300002)(6916009)(64756008)(76116006)(66446008)(450100002)(8936002)(41300700001)(6486002)(71200400001)(6512007)(54906003)(478600001)(82960400001)(38100700002)(122000001)(36756003)(86362001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QW5JZ2ZDT2g4YjJKZHltQ01ja2g1V2pVVktWQVZOMEFyWENmbHJTcTlLdE0z?=
 =?utf-8?B?WXV4bmJvMkxvSVdyb0NFOEtKVTBzWXhHSVhOaHM1NVNJck5ITkxyQ2daN2tL?=
 =?utf-8?B?ZEhONUloL0JsUmNiQjl2R3E2SS9pRlFKQ1ZhVGg3OU1UcStIanozSHFZUDJy?=
 =?utf-8?B?ZHpMRmxYV0RQcHRVTzFFUG5qb1Ava2J3TGVDV0pueTFNMEtNQ1ZVMWIzam5l?=
 =?utf-8?B?c3VnRlJkTGwycktLNTI4RVFRMFZPME40cFNCaWx0UEhWYU5hakU3OUlleDZY?=
 =?utf-8?B?anByUGowUHp5Q3FoTDVXVW5FR05ZZEJySDRlUTJZMXVPd1JDdTJ6SW1NMHFw?=
 =?utf-8?B?MDRCVlJSaWZhQkV4VEk3MDdJNG9xZTNoOHUrU0Zub0gyZEo2dHJLNzZ3UHlu?=
 =?utf-8?B?NEcxTWhLdVE5NUF5VjY5bCtNSlZWdVhiUWVsR2k5ZDNBaFBSNzc0M2doV1Fu?=
 =?utf-8?B?OFgyeGVOVE5GYWlZRktYTkZQcitMYVNnWHdyUzdmNXFTWFVId0lkZEJWSVk2?=
 =?utf-8?B?bG9DNWxzdEZuVFl6Ri9DZFpuVk1IMFZRKzB0cmUzdzh6K0hoUjNwcE5MbkhC?=
 =?utf-8?B?WDIwcXBsOGU2TGMrcVV6WVJyNkZSMVd2dFFzNHJvaEJvVy83N3FwTHZDd1Bw?=
 =?utf-8?B?REhGd2h2L1FFZHNWMlVwcUdNekNxWTFneFJxRFk4dUZ0N3NhQk4wZHp3MDhq?=
 =?utf-8?B?ZFlmRFRvV0JiVVhoNGVUUi9nS21adHByeFF4RGp2U01kVUJodFF2bzZaZE1v?=
 =?utf-8?B?MU1BbW5HR0U4SjZscm9YM09VS3lJZUJLZi8yNUVybjZ6cTFMRGpwdWhVaERh?=
 =?utf-8?B?aFhyWHVhcUVmQ0huYjNQMVFwZzRDTm9tWnMxdTJuejNxNUNWdEJZVkNmd1VZ?=
 =?utf-8?B?cUxuMFVoSnN2NTAxaW1wYnpzbFEyVnpnZUhyZUE2M1UrS0lhTUdIZThMS3hQ?=
 =?utf-8?B?WFRpVjZucWQ5Rytkd2hVSlZZSVB0L2NUSUhTNVhpQjdKMEFBK3UrQ29FNkJ5?=
 =?utf-8?B?ZjdHcEp5RGg0U3kwYzVrcmNkTHE1dHJRdG1iWURuVTZ4M0NpeVAvZC9NZW96?=
 =?utf-8?B?azlyUzBLZGJBMnY3aTdjNUNsTUlsc0lRYmNBK2liem9kbFM2dkgweThRc2FI?=
 =?utf-8?B?R3JoMnpTek4vM0NBQWFIVHpSWVBlQm85QzhoZE9iNDJuTkc5U3dCaE9NM2RW?=
 =?utf-8?B?eVBJNlJrNy90ZmtoaWFtWktXYlF5RjYwdU1HVFdxaDhCNWVpV2lDa1pkUW51?=
 =?utf-8?B?aHo0ZUFLa3JDSHd4bXZUZk9mQlhWVk85SDNtR3lSK2hvbmhmeWNEaTg0MTdT?=
 =?utf-8?B?NjRVQ3c5bHBCem1NTXNtZGs2RHhEQUpXaWpjK1NUNEVjbCtFSVJ0Z0ZMUFN3?=
 =?utf-8?B?THYwaVRKNnBJRWxScWRMMUx0dUZER0R0NzYyQjlQdXB0WExmN2U3Szg1UlVH?=
 =?utf-8?B?VDBsSCs3RVk2VDNxdUY5OVFnZXg5bThta0llL2VlQUozNXpwbHBzU3k1RFdv?=
 =?utf-8?B?dCtOUGV4Uk5PTjVqU0lSc3VubjdPL2RsR0NWelZmQ1ptcktOWWpBMzdwbUNJ?=
 =?utf-8?B?UEl2OGlRZVZYazh3VWhrZUM1NGVDNHB0a2toejJWZVFnZHZqRFArTjlMRTZW?=
 =?utf-8?B?STRiR2RYbXY1RTV4ODRaUHZzUU9JaVFNS2JqNXh2UDR3YlVacmQ3N1FZcG56?=
 =?utf-8?B?cDhuN0UrOHVZWGVCUkZrcXAvVnVmNUNzcElYZzRIMjFLNkZVVXhzWUVyeEJL?=
 =?utf-8?B?V3UxLzhrSFJsb0psWWNGT0ZtME8wMUd3ZHZ5SlhUeWN3N0p3bGMzSzFWSHZW?=
 =?utf-8?B?V3hDUWF0cmIzMkJyMGxiNTFheGFwRVFxbkdVMisvbVVFZk03YWVaRGc1Mjg3?=
 =?utf-8?B?UHFMWUtjcXVRc2J0TUtvVm56ZVcwRTRNSTQrUWtxVmpiSkJsb0F3S0ZnM3FX?=
 =?utf-8?B?a25NU2pwN25NSHVzNEE2SFJFMnR6TFl6akloNlN5YVdQTC9RRGU1aXVVbXBY?=
 =?utf-8?B?M2JLT1VhNjhBbzN2OTlSWWJyWWpmSE45MTdMSVZuL0F0YXBXakdYV2dnd0lz?=
 =?utf-8?B?KzNDWVZsN0RHQWVEQmlWNTIwbDY2c2JTVEdyMmJDbUd2dXJnVlFkUjIvN0lk?=
 =?utf-8?B?aTJadU9hcWZaMEhGeXdqOUFtWDJobFo1QlpyYnljRkVHZUdKMEZKSndSeDB5?=
 =?utf-8?Q?Jy18qcxq9w6NUH80Xz6I+po=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74841A7FEB5C224DB3E4BFF9DE2DC963@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe596c2-c9cd-45bd-05f0-08db94697938
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 21:34:52.8849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BXTq1ZoGTZQbaZzOYq7rNq2VShr1Ib0+A45R+6ivyOt/AwoPeZ3M/vq4ly/Vb8kWkN0OX3FGVzNpa1n6NekkpcF9Yu6xJvhwQY0oPnYEjseTW/OYo+8E6PisReNEWqdK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5276
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Balasubrawmanian,
 Vivaik" <vivaik.balasubrawmanian@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA4LTAyIGF0IDExOjI1IC0wNzAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBBZnRlciByZWNlbnQgZGlzY3Vzc2lvbnMgd2l0aCBNZXNhIGZvbGtzLCBp
dCB3YXMgcmVxdWVzdGVkDQo+IHRoYXQgd2Ugb3B0aW1pemUgaTkxNSdzIEdFVF9QQVJBTSBmb3Ig
dGhlIFBYUF9TVEFUVVMgd2l0aG91dA0KPiBjaGFuZ2luZyB0aGUgVUFQSSBzcGVjLg0KPiANCj4g
QWRkIHRoZXNlIGFkZGl0aW9uYWwgb3B0aW1pemF0aW9uczoNCj4gICAgLSBJZiBhbnkgUFhQIGlu
aXRpYWxpemF0b2luIGZsb3cgZmFpbGVkLCB0aGVuIGVuc3VyZSB0aGF0DQo+ICAgICAgd2UgY2F0
Y2ggaXQgc28gdGhhdCB3ZSBjYW4gY2hhbmdlIHRoZSByZXR1cm5lZCBQWFBfU1RBVFVTDQo+ICAg
ICAgZnJvbSAiMiIgKGkuZS4gJ1BYUCBpcyBzdXBwb3J0ZWQgYnV0IG5vdCB5ZXQgcmVhZHknKQ0K
PiAgICAgIHRvICItRU5PREVWIi4gVGhpcyB0eXBpY2FsbHkgc2hvdWxkIG5vdCBoYXBwZW4gYW5k
IGlmIGl0DQo+ICAgICAgZG9lcywgd2UgaGF2ZSBhIHBsYXRmb3JtIGNvbmZpZ3VyYXRpb24gaXNz
dWUuDQo+ICAgIC0gSWYgYSBQWFAgYXJiaXRyYXRpb24gc2Vzc2lvbiBjcmVhdGlvbiBldmVudCBm
YWlsZWQNCj4gICAgICBkdWUgdG8gaW5jb3JyZWN0IGZpcm13YXJlIHZlcnNpb24gb3IgYmxvY2tp
bmcgU09DIGZ1c2luZw0KPiAgICAgIG9yIGJsb2NraW5nIEJJT1MgY29uZmlndXJhdGlvbiAocGxh
dGZvcm0gcmVhc29ucyB0aGF0IHdvbid0DQo+ICAgICAgY2hhbmdlIGlmIHdlIHJldHJ5KSwgdGhl
biByZWZsZWN0IHRoYXQgYmxvY2thZ2UgYnkgYWxzbw0KPiAgICAgIHJldHVybmluZyAtRU5PREVW
IGluIHRoZSBHRVRfUEFSQU06UFhQX1NUQVRVUy4NCj4gICAgLSBHRVRfUEFSQU06UFhQX1NUQVRV
UyBzaG91bGQgbm90IHdhaXQgYXQgYWxsIGlmIFBYUCBpcw0KPiAgICAgIHN1cHBvcnRlZCBidXQg
bm9uLWk5MTUgZGVwZW5kZW5jaWVzIChjb21wb25lbnQtZHJpdmVyIC8NCj4gICAgICBmaXJtd2Fy
ZSkgd2UgYXJlIHN0aWxsIHBlbmRpbmcgdG8gY29tcGxldGUgdGhlIGluaXQgZmxvd3MuDQo+ICAg
ICAgSW4gdGhpcyBjYXNlLCBqdXN0IHJldHVybiAiMiIgaW1tZWRpYXRlbHkgKGkuZS4gJ1BYUCBp
cw0KPiAgICAgIHN1cHBvcnRlZCBidXQgbm90IHlldCByZWFkeScpLg0KPiANCj4gRGlmZmVyZW5j
ZSBmcm9tIHByaW8gcmV2czoNCj4gICB2MzogLSBSZWJhc2Ugd2l0aCBsYXRlc3QgdGlwIHRoYXQg
aGFzIHB1bGxlZCBpbiBzZXR0aW5nIHRoZQ0KPiAgICAgICAgIGdzYyBmdyBsb2FkIHRvIGZhaWwg
aWYgcHJveHkgaW5pdCBmYWlscy4NCj4gICB2MjogLSBVc2UgYSAjZGVmaW5lIGZvciB0aGUgZGVm
YXVsdCByZWFkaW5lc3MgdGltZW91dCAoVml2YWlrKS4NCj4gICAgICAgLSBJbXByb3ZlIGNvbW1l
bnRzIGFyb3VuZCB0aGUgZmFpbGluZyBvZiBwcm94eS1pbml0Lg0KPiAgIHYxOiAtIENoYW5nZSB0
aGUgY29tbWl0IG1zZyBzdHlsZSB0byBiZSBpbXBlcmF0aXZlLiAoSmFuaSkNCj4gICAgICAgLSBS
ZW5hbWUgdGltZW91dCB0byB0aW1lb3V0X21zLiAoSmFuaSkNCj4gICAgICAgLSBGaXggaXNfZndf
ZXJyX3BsYXRmb3JtX2NvbmZpZyB0byB1c2UgaGlnaGVyIG9yZGVyDQo+ICAgICAgICAgcGFyYW0g
KHB4cCkgZmlyc3QuIChKYW5pKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxhbiBQcmV2aW4gPGFs
YW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQoNCmFsYW46IERhbmllbGUgcG9pbnRl
ZCBvdXQgdGhhdCBpIHJlbW92ZWQgVml2YWlrJ3MgUkIgZnJvbSByZXYtMy4NClRoZSBkaWZmZXJl
bmNlIGZyb20gdGhpcyByZXYgdnMgcmV2IGlzIGEgaHVuayBvZiBjb2RlIGdvdCByZW1vdmVkDQph
bmQgd2VudCBpbnRvIGEgZGlmZmVyZW50IHBhdGNoICh0aGF0IHJldXNlZCB0aGUgc2FtZSBjb2Rl
LCBpcw0KaGlnaGVyIHByaW9yaXR5IC0gQ0kgcmVsYXRlZCwgYW5kIGhhZCB0byBnbyBmaXJzdCku
IFNvIHRoaXMgcmV2DQppcyBpZGVudGljYWwgdG8gcmV2MyBleGNlcHQgYSBodW5rIHRoYXQgaGFz
IGJlZW4gcmVtb3ZlZC4NCkkndmUgY2hlY2tlZCB3aXRoIFZpdmFpayBhbmQgaGUgaXMgZ29vZCB3
aXRoIGtlZXBpbmcgaGlzIFItYg0Kc2luY2UgdGhlIHJlc3Qgb2YgdGhlIHBhdGNoIGlzIHRoZSBz
YW1lLiBUaHVzIHJlcGFzdGluZyBoaXMNClItYiBmcm9tIHJldjMgKFRoYW5rcyBEYW5pZWxlIGFu
ZCBWaXZhaWspOg0KDQpSZXZpZXdlZC1ieTogQmFsYXN1YnJhd21hbmlhbiwgVml2YWlrIDx2aXZh
aWsuYmFsYXN1YnJhd21hbmlhbkBpbnRlbC5jb20+DQo=
