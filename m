Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BCA8A4C44
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 12:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEA810EA10;
	Mon, 15 Apr 2024 10:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n5sWHExY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8741410E9ED;
 Mon, 15 Apr 2024 10:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713175825; x=1744711825;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=S8WWdhPr5WMKBDajFlJFUDa2WRM87Is+1jErFSZSSfA=;
 b=n5sWHExYq9pJxee2DTVY+ocpnYnrXUcikuN829Rhw4zimaBy81NlqOyX
 hhZY8T7S4BYT1IpkV3OA7w014L5tHD8nvYxyGqS0PrPbpyPLQatoI2kui
 xanIPSrOUGN9fG/ngs+yEQa9WfIwq7qW9v/Db6xrRiYdghwGhdIIwHpBP
 glOiSWyZeh/Hgh22d5YEhIxRA+7tdTPfmvhjGPILBzPZFOJR2KT9fxN+K
 fVM9m++T9Qmkedaq/NNpuu5de43lnmPQSC/lOdTKXJ86fVNjL/6SaKy4I
 3VEfEALxe6SgbTSo35wm+g7RuH5pbMOEdK16HHatcJUdEqVQV76Qhr7hB A==;
X-CSE-ConnectionGUID: 9FKYOjblSQy6It+CfBW6Kg==
X-CSE-MsgGUID: 9nlgK9wXRgurZ/721Fi7Mw==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8393158"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8393158"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 03:10:07 -0700
X-CSE-ConnectionGUID: NnNHHtCLS4GwYTLnoeCMIg==
X-CSE-MsgGUID: NLXqt3PPSmmf4fTFbBJu9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="26501597"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 03:09:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 03:09:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 03:09:50 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 03:09:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFSzN32nrNq8QGCGSPp4K6d0F7a/lBr528PHTsaKnIk0g3QGUwYNbBeZXUEeX89dPo9nXMCQsort3xnKiJolYA8XoP9yGojuU4KzyCH3il4ZGJFswLxAwc1UTRPnR5LbTtNtDGjd9GjDtE6S+UZI629YLrzCUjKV1Tee6jotgOrdSBXkK7bwxTZq0cGz0ci0+GoADda1HQsNSOCkBxu4uGfiKIjxGQ2zd4z3PWGSmny5q9KBp+mugK3tKzWo4+iREkr/GtZKPsEz5SCGpqSCUfGjv2pd+rw2eShSHKc4F6Jt55Z4pEVN4b1PWI43LsP/k+w48W+ElOjBcRAbMbIJEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8WWdhPr5WMKBDajFlJFUDa2WRM87Is+1jErFSZSSfA=;
 b=j3Q/zxUY7rtbSVOC8i+vU2u8gF18bmX2/Vf+dXiEc3NHaNsDmsMhS4jC2NnSRS2feOye8JiTRTQnkalRH+ckrQYl6ystBL5DBEAozGgWpyuDMHozdvcoFEc2nWf/1k6XGBaopvLLIam05udVSPNx5ehjaBk/6F0xjUt4XOi1jioNATnN0Ak99nUXzjQ25VOEgrhEu1wtJ8HQII+YaDH14GfxA2Eji599wLCVf/eFuLqNWpjrXUE/bEdDofBqqBaMarpcnZC62meLvBirRBw3R3RVMXJ4tSDxFpN9lv3lH28ilvPri4OyPWQcY2VYaQh08OjW57vjSZbCLd198PQ09Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SN7PR11MB8028.namprd11.prod.outlook.com (2603:10b6:806:2df::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.49; Mon, 15 Apr 2024 10:09:17 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f%5]) with mapi id 15.20.7472.025; Mon, 15 Apr 2024
 10:09:17 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v2 5/6] drm/i915/alpm: Enable lobf from source in ALPM_CTL
Thread-Topic: [PATCH v2 5/6] drm/i915/alpm: Enable lobf from source in ALPM_CTL
Thread-Index: AQHajPOxpuX3SYzA5kKs/AFXeGRAxLFpIAoA
Date: Mon, 15 Apr 2024 10:09:17 +0000
Message-ID: <e4c8d59b514ddf260934104f0021301ea1c0d2cd.camel@intel.com>
References: <20240412155243.2891996-1-animesh.manna@intel.com>
 <20240412155243.2891996-6-animesh.manna@intel.com>
In-Reply-To: <20240412155243.2891996-6-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SN7PR11MB8028:EE_
x-ms-office365-filtering-correlation-id: 1267d591-8b38-428e-e4ae-08dc5d341c40
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kTJEp6PQnd0SRKxuOrQy3L6gvTOlpGaPEhbEJhvlN6lWr3kRgvuvnolm+B3DZytUZtpJBxkrb+LVOUIk5PA7tPX7z8lcwHbbymlW4dkivQ1FZicgMrROAhlk9qqcHhZhhX7Ezn5talrCc2eMYyjaava8eQld5jzzAxQ8eepCsLU16zyiqBTGjOXzaWerNximljKgp5/dLby35KEK8VuRfUuDGKJsyHvZud5WgJ1JfYBzv5lWxY2M718KBpUM3N2wqLv83k8Q0ItsDZAerHL15djatsDWkOpj7JIosJ4/M3/DP9UiDGTEttJCpQ8B0FJqPyxfgMeBFlZhqqDH6+4ZPbNxedyR592wfP/u1TvhhrQkakQVPm947LSZp2SdOI2jfJIFnKJgrk5dgDExSLLrpyHmOiGjy/D79VqKq+pmwqK50uB06cUC0LEsnxSywQozdlSJCQ69dby7qfrxd3E8Y9Cjdru6NQJrX6gt0auLdClXQBwT5sKAbvmbW8sTrJppOPSUW6qtaJtfAtaL2mMhoZSeoQigsyPfynRXt73fy5UjSR4g8ZeO3zlhavNlsj5DLWv+jD03K4A1oo0e6xWb7DtJUuuNXXTRokaiiI/qT+DK23xHFVg4rUChdtSzFNWyB2KNM+ywJDrvNrQynJvrGAyj1YwQOFg2fIVlfskdjBOW1V8A40NPQg/LRe6qY2BuyePJAScxPDTKc4908OLodWGbhZxzhP8uivZX3U+RkWo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0NPVG5ENEZYSFdpc1ZGd2luQVpLTExFUkpsem5iUGNtbWV5ek9KbWpkeERt?=
 =?utf-8?B?eGlWOHFzZ0Y3bjQ4b1Q1bW1ET0RydGsyU2xsckR0S0wrNmd2akZkSk1wd2t1?=
 =?utf-8?B?cWFYN2JWNy8zOHRicTR5cVhWT0NHRDIrNWpWbllBVndHMFdmdVh6d00rT08y?=
 =?utf-8?B?K1Z0cHhXK0g4M2MyUjMzci9rR3UxV29zYlBDYldiRi9WanFkWkkxN0Y3aG9x?=
 =?utf-8?B?OE5KanA2NTNpNUVjeDQzcnBrZXRMVWM4Snd0Y0ZCTzYySml0emNjeDZId1Zw?=
 =?utf-8?B?S1drNmNyZitQZDdYY3lJakdiWnZTYVU0WStEbGN6bUFPaWVpQ0txOVhTcURW?=
 =?utf-8?B?SFE0b3JWTTR6QW1WMHNrMzdkdDFPTWZNVFlOK0g5K1B2UURQUC9tTU5zUnJ2?=
 =?utf-8?B?MlN4bkU1ZjE4NmpKc2Vjc0Y3VkUzNDlOaGFwMGpVUlhPMmJwdWc0MTFZV3c3?=
 =?utf-8?B?dTg3TzRaMEhnNTdRblRIbVplOFlWVmtOR3ZKdms4dmcwRm50dE5hS0trZlFR?=
 =?utf-8?B?aWhoMEUwTmJlVXl6MHNzS2FnSVY1R3FiaUFpZHkyb3pjNHRCbS9aTXZRc3cw?=
 =?utf-8?B?YlhrQjl0aUh0dlduQmdpZi80NHFQV05QZkxTS3R2TVpkbTlwUTlxdkxkZ3Ay?=
 =?utf-8?B?WTJQUzVUMkw0cDE5WjR3MXhhL1NCbm9QVkp1MEVGNW1weCtTbjlsM1lOL2VD?=
 =?utf-8?B?aldRdGJoQzNUUHhNR25lTm9WVWFrYzI3Z0xCeTlrVUtwUVVoL2FwbWRvc0F1?=
 =?utf-8?B?VnJOMDRMV2NhVHVsOXBaOXlteiswbmptK1Z4YlBxQnBiNlBGQzQzc0F1QkpS?=
 =?utf-8?B?S1pkUFRTUkd3akUreTMvOUI0TmNJY3VZY045RHdIZ0VOQXdGZTFvQ0NlRUt0?=
 =?utf-8?B?RzZCSUdFakFNVlJHVU8wWWd3UmI0eXl0ZWgrWWhjUldXVnhXYjVKZzdSSXNM?=
 =?utf-8?B?U2Z5R3hra09OTHg0bkdMQzB5anZDdGhocTVmeXA1aEVUbE1raWdvbVF0WStZ?=
 =?utf-8?B?MnhKU3R0bXJOVmp3SXYrMy82V2t0M052VVk5cU9nUWUzaUxSbENYdDRPLzRS?=
 =?utf-8?B?bjBOSjd3Y2l2V2puaDhha2R5T3JJSDlWQUFkV05ZWDExM05Va2lWeFlhdU5j?=
 =?utf-8?B?SzZkNGFuSmx3ZjFQZkRDenhJMEJQN0dGK3VwQWNOcVlpdkFqelFiV2dRa2NM?=
 =?utf-8?B?ZUhyUGpydnFyZHJKUUZYY3R3YXpXUGdiRXUwQVQyTG9QTGNvcVdmQ2RwWFRG?=
 =?utf-8?B?em85WkdWaWI3dmFWNTBrVFQrSWJ0dWQxemQ3VDRxNFRHK3JTMHJFUEZGZXI1?=
 =?utf-8?B?bklMd0Z5SnRQdWJ5VVZIc28rZldlUlVSR1F3YytndlpJaVBBVjNObEhkQUN4?=
 =?utf-8?B?czJBMENEaEpPRHpvTHhjOGRySkdGUU9vV0xnZ0w1alhpcVdkaXVtWldzbmFF?=
 =?utf-8?B?aHA3TWNmY2M0ZXdRa0duamxrVktEWGRCbndMNlB4a0lLajVFTzBxT05WZWRY?=
 =?utf-8?B?c1FPa05FR3RkZmQyOUVMbnlQckxIQ0w3eWQ4YXY3Zjc4WWhuWUdrbDh1bGhX?=
 =?utf-8?B?RThEZWVwTzd5QUxyVUtWeDNtMFdtcGxaY0xoTHFuK2VKQ25XUjY3ZTIzN2FF?=
 =?utf-8?B?RW41N2t2NG1jazdIVG1GSVgzRVFkVUptSVBkU0c1WHV6clZmVnNEUTJPWkNY?=
 =?utf-8?B?bmJKaHBqeExGVmFOMnM0ZlhmYmJMRHV5VkIrbGptZ3RvWldIS3VVVjE2OGdv?=
 =?utf-8?B?ZktXVkc4UjI5bC8wc3R3ck5nNUdSRjF2Mk1EUUJDL05rV1psYmNrTGlLTHFH?=
 =?utf-8?B?bnJKRzYzOUYwWWUrWG45ZGRSWjN0VlVLaXdXU2JLNFBGU1VzQ25zMDFNRGp5?=
 =?utf-8?B?NFdNWERibHpMa1BzQUNqOG4rS0FXbmlYMTlFWWtFU0tjWFRjaHJ2bU9mWExC?=
 =?utf-8?B?VktIYmNOcjVnWVdwRm9vMEsyOE9SOWVwTkZaQ09oRzNlV2dObVpuTDhLYWVD?=
 =?utf-8?B?aTkvb1NQZmY0RWx4RFRHc2E4bzcyRkdrREFQNXk2MTc5NkNrNHB2WmZrdUlh?=
 =?utf-8?B?V0RnZXd4dFY2bEdlTVFUTUpoTUtxMkxMekg5d2RzUVp1WnR4WjhpRUlpK3Jj?=
 =?utf-8?B?SjFGQVhkQytJdzRaakwraTJPZkdrUFhjbXcwcGlrN2R5RUZyaWpMc25HOW12?=
 =?utf-8?B?QlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7757D24731C124FB4E0135C8C112A94@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1267d591-8b38-428e-e4ae-08dc5d341c40
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2024 10:09:17.2920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: es1RZVXpAm39RDB8Oni0nt8TmCuRWWJHX2JKSnsVFUqPScGw33LCQ9IZC6HI9pYb+n1t3+RFdoEbls1Fy0m+Wa+pQTEwVfNbMYlu6sHd6zk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8028
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

T24gRnJpLCAyMDI0LTA0LTEyIGF0IDIxOjIyICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOg0K
PiBTZXQgdGhlIExpbmsgT2ZmIEJldHdlZW4gRnJhbWVzIEVuYWJsZSBiaXQgaW4gQUxQTV9DVEwg
cmVnaXN0ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmltZXNoIE1hbm5hIDxhbmltZXNoLm1h
bm5hQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9hbHBtLmPCoMKgwqDCoMKgwqDCoMKgwqAgfCA1ICsrKysrDQo+IMKgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmggfCAxICsNCj4gwqAyIGZpbGVz
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gaW5kZXggNjk5ZjJmMDUxNzY2Li5hZTg5NGM4NTIzM2Mg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+IEBA
IC0zMjUsNiArMzI1LDExIEBAIHN0YXRpYyB2b2lkIGxubF9hbHBtX2NvbmZpZ3VyZShzdHJ1Y3Qg
aW50ZWxfZHANCj4gKmludGVsX2RwKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFMUE1fQ1RMX0VYVEVOREVEX0ZBU1RfV0FLRV9USU1FKGlu
dGVsX2RwLQ0KPiA+YWxwbV9wYXJhbWV0ZXJzLmZhc3Rfd2FrZV9saW5lcyk7DQo+IMKgwqDCoMKg
wqDCoMKgwqB9DQo+IMKgDQo+ICvCoMKgwqDCoMKgwqDCoGlmIChpbnRlbF9kcC0+bG9iZl9zdXBw
b3J0ZWQpIHsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFscG1fY3RsIHw9IEFM
UE1fQ1RMX0xPQkZfRU5BQkxFOw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50
ZWxfZHAtPmxvYmZfZW5hYmxlZCA9IHRydWU7DQo+ICvCoMKgwqDCoMKgwqDCoH0NCj4gKw0KDQpJ
IGRvbid0IHNlZSBsbmxfYWxwbV9jb25maWd1cmUgYmVpbmcgY2FsbGVkIGZvciBsb2JmIGNhc2Ug
aW4geW91cg0KcGF0Y2hlcy4NCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IMKgwqDCoMKg
wqDCoMKgwqBhbHBtX2N0bCB8PSBBTFBNX0NUTF9BTFBNX0VOVFJZX0NIRUNLKGludGVsX2RwLQ0K
PiA+YWxwbV9wYXJhbWV0ZXJzLmNoZWNrX2VudHJ5X2xpbmVzKTsNCj4gwqANCj4gwqDCoMKgwqDC
oMKgwqDCoGludGVsX2RlX3dyaXRlKGRldl9wcml2LCBBTFBNX0NUTChjcHVfdHJhbnNjb2Rlciks
IGFscG1fY3RsKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZGlzcGxheV90eXBlcy5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kaXNwbGF5X3R5cGVzLmgNCj4gaW5kZXggNjExNmMzODNiNTQzLi5mNjFiYTU4MjQyOWIg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxh
eV90eXBlcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheV90eXBlcy5oDQo+IEBAIC0xODg0LDYgKzE4ODQsNyBAQCBzdHJ1Y3QgaW50ZWxfZHAgew0K
PiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgLyogTE9CRiBmbGFncyovDQo+IMKgwqDCoMKgwqDCoMKg
wqBib29sIGxvYmZfc3VwcG9ydGVkOw0KPiArwqDCoMKgwqDCoMKgwqBib29sIGxvYmZfZW5hYmxl
ZDsNCj4gwqB9Ow0KPiDCoA0KPiDCoGVudW0gbHNwY29uX3ZlbmRvciB7DQoNCg==
