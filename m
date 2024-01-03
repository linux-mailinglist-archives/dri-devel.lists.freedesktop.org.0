Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3319822B8A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7A810E0A8;
	Wed,  3 Jan 2024 10:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF0210E00E;
 Wed,  3 Jan 2024 10:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704278786; x=1735814786;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CBMcYwmRTrKjDMooDOUGhHLYBTtpwHybki8N4uwcPSE=;
 b=QDwG5aR840sCfBjQvCVJVGlxD6OfjImew/xukix1dT7EtJoL2z4PieIB
 3FBva82XlQZ/mxqGKU04Jf3MwYiP3o+tjUZeX2Wzs3U0g0/YGyBjX7GoB
 2zemYSleZ8tBEoR0aKGMMyc4J/WyYWntGTHISxWM7nWhvRSHzP2XYEdtG
 RoMxeRpQDao2g4zmw7BUD/3/tpPSZRCkYz1dugwEDzeudQIlb5ECdhevK
 0f86wQxaoANBJTaXpIfZIUuDc3ExrzG0n0KHnGKgnmFUHfd2FhHQNsHB4
 9lU+IM1PT06Q2fYganERe+DojwZZA/FN68OoXm9DxOx8VjgRDIrQqEAJr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="399765920"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="399765920"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:46:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="845847553"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="845847553"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jan 2024 02:46:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 02:46:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Jan 2024 02:46:25 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Jan 2024 02:46:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZAzBIj/lnTrYxUtc1Ov/pmKMlai+7RFT0t7kV7yxQ7//uGj+85lats6nafaxjsxzmEFmd7YADOAL2ah1J8Ee2hg5LGo8LulqPaux9bvuQ7kME8/GVuDBNc3zFAgv75eaxbjVv8r7nIWTtht/t1sqtMC1u5KnGC3MGffi9F96lDSS4iBFperzRNvE/51OQnPwyW89y/qAeAR/fIu6YO8WN1CTiq1qxMd5mQDlVvco/ZDR9vkeA4nivwKcbd85iibc36rg09BtMm3EcyP0xojMaLf44Te7Uw/4AXnUEljX8RRdgo5wXgpMNki4rGplEk/XtfcNw0DagzDxBEJ+b3zAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBMcYwmRTrKjDMooDOUGhHLYBTtpwHybki8N4uwcPSE=;
 b=VfS43zysMPLFRAR/QnIAfHz6I8F45WXLh0w5p3eR39myReSfE9QSiWVna5mSftnYdDZsp12N9xXQOVkAUqj5dgzL+dPRPvzb6+JLQa+pOpgVR1DiSdCvEZqXA1mqEbWvXbH3uHzEF++2h7r7VLWgsGoROFgdu+PFeV188cMTIDiHEIvL2oygJztb/5whuchANi/WbOFP8IZHEl5/vl0ppLZs2vN4uV8CCXx5CQE9ITvuspIMoPyK+VCAUEqgVCOx1GOfYakv86TDO46OW6AlG3aK0ypyyLfee4EB1Md4+6/LiN93NK6FPBIU8Lr/l/Ukt08C2yCFcKqMOcJiKdIdPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7054.namprd11.prod.outlook.com (2603:10b6:303:219::20)
 by DS0PR11MB7411.namprd11.prod.outlook.com (2603:10b6:8:150::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Wed, 3 Jan
 2024 10:46:18 +0000
Received: from MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::8b04:7396:7a40:f00d]) by MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::8b04:7396:7a40:f00d%7]) with mapi id 15.20.7159.013; Wed, 3 Jan 2024
 10:46:18 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/7] drm: Add eDP 1.5 early transport definition
Thread-Topic: [PATCH 1/7] drm: Add eDP 1.5 early transport definition
Thread-Index: AQHaMeBgMbN9NHhIHEqxW4EznXRTI7DIADxw
Date: Wed, 3 Jan 2024 10:46:18 +0000
Message-ID: <MW4PR11MB7054CC77033CD795D7D68FAAEF60A@MW4PR11MB7054.namprd11.prod.outlook.com>
References: <20231218175004.52875-1-jouni.hogander@intel.com>
 <20231218175004.52875-2-jouni.hogander@intel.com>
In-Reply-To: <20231218175004.52875-2-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7054:EE_|DS0PR11MB7411:EE_
x-ms-office365-filtering-correlation-id: 5e659fee-04f2-4fbb-e8ff-08dc0c4937cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tjuBnePVy2H61G83sOw9qA+6yh84ajToREa+EmNJR9EZWn/oXOPJmzaZ4GDaYOIerD1EkI8YqSc6LTzIWH5uEuAZz5Yoc7454wdffOXvqArbETVBdCtmOdOnrjJhBrcJi/QvI4P3buzesyxXRIyk3AyoOyDKPgNqqhxu9qSsmgnTKcg0FKE886y9gsskRF6erl6+67FFx9a99Vro9tDa9Ky780wO/SDqfmxI94eo7U6RyeU8r268uRHOpypbTZ3moA4/X4UT4YU1dgUQOOPh62sLVoKWTeebyKCeA3geMseJwyBtAgIvSBDEFIq9Q+EOo843G1VP2HhDwvtnU4FGqucp5cQJZkxLzzYQyz9QCGJG/f4eNrkVgpVuPeBWK/s3M5Cpi+gheJTyqsJo2xjAHpp6hom2Ep7acPiechx3n3IkplzL0czJNpROE564CTm22+KerhFlhD2Gje0SXIwvU8e65mI6HfJJKnlAyxLHN4kGsmgSJcB1cIZg/+kf3u+/aBCITP+EpmlMIvGaVm8iLlc78gnRevqqL7xXsF9+6uphqRbDSQxIqbtCozmAKUk0tPJrSZomv7jkvGxk6fSckLf+yQ8FpO5YzkCgrcYWZPiZtibPlA6WSGTg62RV5zPD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(83380400001)(53546011)(6506007)(7696005)(9686003)(71200400001)(122000001)(38100700002)(5660300002)(52536014)(41300700001)(2906002)(478600001)(4326008)(450100002)(8936002)(8676002)(316002)(76116006)(110136005)(66446008)(64756008)(66556008)(66476007)(66946007)(86362001)(33656002)(82960400001)(38070700009)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UExzNkc4QllOdUY5Q0FQWVdvaHpQNTZpd1BTbjJmdHZBanE5dlpqd2h1Zkdh?=
 =?utf-8?B?WStFZ3ZFWDlxb2JDcFZBL2VqWTJMVzNQWDQyYzV5elkvckxTbEtzWW5nZHdP?=
 =?utf-8?B?cXVYaVB4QXR1SUhNRS9oWXRHUHVKV3QyajdTSHg4U0pqVVFjTlhhTmczaGlz?=
 =?utf-8?B?czRSLzcrdU9lOTBxcHlLK0VqZFkxaHpUaG9WSDBnZW1vZ0NNU2ZnTEppelJs?=
 =?utf-8?B?SnE0ak1nQW94ZWl5d2ZSYzQwRTFrclFDVjBlWFVCNVhyZnRHajlNY2FVWENj?=
 =?utf-8?B?K05KTi9tR0NUUTFjN1gyVzB1UmNqQ3lORFI1Z09MZlZ1L0pVZHhkV2NNckJ6?=
 =?utf-8?B?UCttM25wVi9CUTZrQXlnRExYazN2Vm1mZk1oM2xFMUpFd3BIL0I5dFBhZkdY?=
 =?utf-8?B?dThMUzczN011OFFsUEFTYkhoa3RpVTlpcjJmWlBMakNFWnhja3lpUlNhelRP?=
 =?utf-8?B?SXNLcjZnRmtyYjNVc2ZkMnpxNmpTdG1Nd3hqRkJpNGsva0RSK3hRQ2FoTEFL?=
 =?utf-8?B?R0dHakFoSkd3ZTBYWGYwODV4ckkwVDdMVFdzQ0Nzb3FXaU50K2syWWt5L0ti?=
 =?utf-8?B?TkNlRVA0UUZ5SklISi9QUDAxVTEwWUg4VWprbnFIUmxNMU5xWUh1VFdTRE5o?=
 =?utf-8?B?d3pUbTBRYTZjdG1wK0pPaWRKUFVXN0pnaGR6bUF0WWhwZGhFUmFyZjJBVFVL?=
 =?utf-8?B?aE9RM05kTENRanhmcjZxd3ZrckJkZjZrVXl0MWdCdUwrQlBBRFMvZFNGTlZP?=
 =?utf-8?B?VHpON25HTGNjWEVCOC9lWTY5N0hlSWN1SVFUM2RDOVBialBYdEZNVEpsb1ZQ?=
 =?utf-8?B?eXFSU0R3ZUZHQUhpV1JMVkR5WFg0YTZ0TndDcGRjZFhoaFdXV25IN0pFV2Na?=
 =?utf-8?B?a3A4R3lqZDZDai9LM2ZRR1REaG5DMURGYXRkajhBSS9CeEJEV0IrbHJZR0pY?=
 =?utf-8?B?NUc2QUlabDVWOW55ZzdmemJzOGc1ZVAzUHJLUVZXT1ZFWS9LSGY5eGlJMzhh?=
 =?utf-8?B?UHo3c3Q5aFFvOFg4R0xtRFF1N0x0Y2Ntaktocm1HUDhkSkR1aWlNalNUcVJY?=
 =?utf-8?B?bkdwR1NnbkRCZDVZYjc5dFBQc3d6bklHT2czQUx2UHdxUTVwWGZXcWFvY0ow?=
 =?utf-8?B?K2JZVnBiZ3lPdVJZNkF4S0UrV3hsQWZpZ3lxSDBCdnE0c0xoL3BBZ05BQjdF?=
 =?utf-8?B?aEp2TUxhS2VmbklIS1MvV1RSQ1kwU1FpMEhHYkxLbURQNGNLMEt4K3VqSmZD?=
 =?utf-8?B?RS94TENKMm50dlNKcUVyTWNzbWVWVFZCVDAyRU1MeDJGODE0eS96cTBqaFZF?=
 =?utf-8?B?Wi9OYktnaURRMjZaZ0MxbXUyYi9pMU1vQkJGMXVUd2JTMTcvcklHOHQyWktY?=
 =?utf-8?B?Q2R1MFI0Tjd3NW9DQjcyTHRHMXR1Ri9qNUdXbFlFMHNxWGZxaWtsa0hIUGM1?=
 =?utf-8?B?VzZXc1A0Q3hHS3FIa0YzeUQ4TFRSdVowbFhrLzR6UkJZaHZTNnRWcURJbVVK?=
 =?utf-8?B?UFFYd0pKSWlwM3ZaalloQWQreGFZOWRBYnFaOGlvT21vQjZmampZTUszc0t1?=
 =?utf-8?B?ZmZnRUlKSTdJMFhwc2YvdnYwaFlwMVg1c2FWOGFGYTRoMk5ud2hhOWJuekdr?=
 =?utf-8?B?ejVlOCtQdG9UWEIvYlBzL1pOYmxKZDA5RURrRTJGRTRrb1dnNW1FaERSaVB2?=
 =?utf-8?B?eUhVcENUT3p4K3hCV01ObGNpazllcjl1UXF2aFhROWtNZFdhSnJoMThGOGFk?=
 =?utf-8?B?V0wyZEpVQjN2OEdKeE1RWHpHTzJKam9PWmJuclk1bXp4MFNvVDlSM1FUWkl2?=
 =?utf-8?B?M1lRU3B3eE1BRmVJZ0ZhTlF6S3d5R2t5eGwxRVRsR2RkcWwvM3pkVEpxa0dv?=
 =?utf-8?B?eHl3M2I4Um5LY0xNZzB2ZUl0NjA4Rlc4c01VZVVNVzhFaUp4SG1vTEhucnRt?=
 =?utf-8?B?TVR2bDNkemNLZlNTTWhwSWZhWjhGeFJwMVVNT3N5R1hxNG41c0NlaGluZkYx?=
 =?utf-8?B?TExrZ3p6d21WNnpBeVVuK0JoSnBVanh2MEVnYXBuaEhTYlpGRjFmYVM4VFFp?=
 =?utf-8?B?ZEQ3VWlHUHdQNmZzSDRGcERZeGgyL211OEdvajRtUENCaHdFd0kzakxCWDV6?=
 =?utf-8?Q?DyynNefCvCogNRuAINwXojHyd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e659fee-04f2-4fbb-e8ff-08dc0c4937cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2024 10:46:18.7889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dG4/0rlW5Q7G2NdikUljokHT2JQ4c5ypUPoIvxrZgvxhLZLk+9YRzmDOL8znHMzpxRIdP3GOuY9ofuPJeGEZQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7411
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC1nZnggPGludGVsLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEpvdW5pIEjDtmdh
bmRlcg0KPiBTZW50OiBNb25kYXksIERlY2VtYmVyIDE4LCAyMDIzIDc6NTAgUE0NCj4gVG86IGlu
dGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gU3ViamVjdDogW1BBVENIIDEvN10gZHJtOiBBZGQgZURQIDEuNSBlYXJs
eSB0cmFuc3BvcnQgZGVmaW5pdGlvbg0KPiANCj4gQWRkIERQX1BTUl9FTkFCTEVfU1VfUkVHSU9O
X0VUIHRvIGVuYWJsZSBwYW5lbCBlYXJseSB0cmFuc3BvcnQuDQo+IA0KPiBDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiANCg0KUmV2aWV3ZWQtYnk6IE1pa2EgS2Fob2xhIDxt
aWthLmthaG9sYUBpbnRlbC5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVy
IDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgaW5jbHVkZS9kcm0vZGlzcGxh
eS9kcm1fZHAuaCB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHAuaCBiL2luY2x1ZGUvZHJt
L2Rpc3BsYXkvZHJtX2RwLmggaW5kZXggMzczMTgyODgyNWJkLi4yODFhZmZmNmVlNGUgMTAwNjQ0
DQo+IC0tLSBhL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmgNCj4gKysrIGIvaW5jbHVkZS9k
cm0vZGlzcGxheS9kcm1fZHAuaA0KPiBAQCAtNzE4LDYgKzcxOCw3IEBADQo+ICAjIGRlZmluZSBE
UF9QU1JfU1VfUkVHSU9OX1NDQU5MSU5FX0NBUFRVUkUJQklUKDQpIC8qIGVEUCAxLjRhICovDQo+
ICAjIGRlZmluZSBEUF9QU1JfSVJRX0hQRF9XSVRIX0NSQ19FUlJPUlMJCUJJVCg1KSAvKiBlRFAg
MS40YSAqLw0KPiAgIyBkZWZpbmUgRFBfUFNSX0VOQUJMRV9QU1IyCQkJQklUKDYpIC8qIGVEUCAx
LjRhICovDQo+ICsjIGRlZmluZSBEUF9QU1JfRU5BQkxFX1NVX1JFR0lPTl9FVCAgICAgICAgICAg
ICBCSVQoNykgLyogZURQIDEuNSAqLw0KPiANCj4gICNkZWZpbmUgRFBfQURBUFRFUl9DVFJMCQkJ
ICAgIDB4MWEwDQo+ICAjIGRlZmluZSBEUF9BREFQVEVSX0NUUkxfRk9SQ0VfTE9BRF9TRU5TRSAg
ICgxIDw8IDApDQo+IC0tDQo+IDIuMzQuMQ0KDQo=
