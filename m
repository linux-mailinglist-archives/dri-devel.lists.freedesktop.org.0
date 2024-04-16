Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4ED8A66C4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 11:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB33010EB95;
	Tue, 16 Apr 2024 09:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LV7qnCot";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E676D10EB95;
 Tue, 16 Apr 2024 09:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713258647; x=1744794647;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vG4m+Vmm8XYiFa8jxk/hNgB/IV6HYT1bqRRAhD/02z4=;
 b=LV7qnCotZ7PWk5MBfwGMrBEnxVQkFINGezJkVt815jKngK9CHVeKleT9
 0zGf62eAW4xSN7dQbpqLbUgf7ovEXxfwa+kE0rNGRshMUaJR+dbxLY/K1
 o/vvD2wxCas8ZQlwEcDofalWXUekjPxaKx7nqM1qqUiZA426L9uHBanqZ
 dYFJQlIFk8VmR41YtuHfMZ7dKDquHWvyRkwRolgAPpwNOZxytkAW6TnSe
 WoLa/KHhjcH2jmguDhsrwIZDbHenqeIpRSga2+Nx/+Xe4iPF1heL/YnnX
 H+X+8LMF9tNTN+QLzV5niJIVcZq3xTpWcnidESJw/z6NV8L9yi6O01I1A g==;
X-CSE-ConnectionGUID: m44PZBhnTbyzaS1viWvcZA==
X-CSE-MsgGUID: ZSeU8GLkSpKSjF5q0cg5FA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8547813"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8547813"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:10:46 -0700
X-CSE-ConnectionGUID: 3OMk2rrPRR2HMvTlOSKsvg==
X-CSE-MsgGUID: EJSveGaHQDK6v8KXFVOGhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="22273004"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 02:10:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 02:10:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 02:10:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 02:10:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLOK0820Cn4mlfGxYzoCz4u+mqsLvny/J4aOeSYO6uDwEdMnVS5oJt7P18VUaXBrUeGq1OMZSUwmaBkC/f4yxSjL+gSgp7Yb9HKcWbW9qQmxxEQHXS1C+TgU7jKiesYw3vcKoy6IE5mT9QCpnomHMeJXzeNefSLnOs0lFxEAGzcgffFBZL3bC+KyXj05LNtpMG52HAQ+5CpCYydhgkBuAbfM1s9LfT9unS6/CcNId/IBzjQ1c5mZHELJbcKGeWXnNLzqbXSiit8G5NnN5aESdu4RI2ITWxYUCU9HsAM41xfzLTzmfLluDkogTKmerm+TBb0A/KaQkPT5u80Oley4WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vG4m+Vmm8XYiFa8jxk/hNgB/IV6HYT1bqRRAhD/02z4=;
 b=FMNZKlEppqkW2vgR4wimRE4QTudNrNGCRV/dUyXexaHHq0w/flJCBgkY2LM9Fjsm6KtnMwYymhDditwK8gtIaWkIB1QuM7laQ1k7Jn3kpN3K5w5Y9S8jLArwn/S2nmJjKuY1xA1g6H5F9urS1IPE7bKCD1ATVo9CIFp16USih7ogO/hw5oP+EGhvx8al2/y9dbxzFZPIHHG9kFby0GvceR3PQY+wHv3FqXit9Z/lLLkK+sUH6pynvt9jFLLHDMjdNgOKi3WiQVrpNHPsuSIGsxHJf5hmyHGGfRNxX3mMXEnhblhR3xjnWxsCHDJbAqjzfWU4r/WLqQpHoR2cR5c40Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CO1PR11MB4802.namprd11.prod.outlook.com (2603:10b6:303:94::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.31; Tue, 16 Apr 2024 09:10:38 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f%5]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 09:10:38 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v2 5/6] drm/i915/alpm: Enable lobf from source in ALPM_CTL
Thread-Topic: [PATCH v2 5/6] drm/i915/alpm: Enable lobf from source in ALPM_CTL
Thread-Index: AQHajPOxpuX3SYzA5kKs/AFXeGRAxLFpIAoAgAF0BwCAAA3rgA==
Date: Tue, 16 Apr 2024 09:10:38 +0000
Message-ID: <464b8ab13d8c50132e4f297b478fadaad04048ca.camel@intel.com>
References: <20240412155243.2891996-1-animesh.manna@intel.com>
 <20240412155243.2891996-6-animesh.manna@intel.com>
 <e4c8d59b514ddf260934104f0021301ea1c0d2cd.camel@intel.com>
 <PH7PR11MB5981972857C523A13EEC56B6F9082@PH7PR11MB5981.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB5981972857C523A13EEC56B6F9082@PH7PR11MB5981.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CO1PR11MB4802:EE_
x-ms-office365-filtering-correlation-id: 021c404f-adf3-455b-4ed1-08dc5df5153a
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sPej6ke+C4cilwSA53K4ijzmxEkudbtnJYC2fGn5rcUHK0MMNFN8sCjpLN1i/FOluqo/rUHRtIB/CLcDcbX2nPpEisAkrB7F2kRBCfTp76IEEd1yn2bXRKL9OA6BNe+XexRwFjoIaEj2N0B8wjMpxwWJ7sPZo6NWZrC4YmTh1dHrl54R+wm+MXXIUcwZMyXCUIC6h5eWiVnU3RbHORi9kXHVfyE5cLBoe16rAVvzxqdb8QMFRAMb2u2ZMRxb4jf1OL61+qGJRkemQ15aMQ6ThHlToBR3Id6jAfUYPVmtF0RAF5Ba6OOyIvxvNBoekGpA4E0WUq952yczVlzjX003X6pPB8siBoX0kbMBem1eONFPUPokJ++nVXcbhcDJ/n+hISdvZ9x09Jw++AI/RYH+H7WmoNn5UeCv1DoiClc2MJNOql8Q3DQPT0whCuYIkNLFrfnZyMphrY6nuZvRyqpD5vzcq1D8JgK36ugpvOp2vj1cKHZxfcqhEer2n8o0H5VACkRbXwoXUifL0OLC9qZW/IloffLKHn+e8C3DCqclVbZt/JAneGI9Ssxhj5zqlQMBZAHZo2ZBy0aqFGK/IREm0z6ITt/ii6mIq1UnBLu9pzBKMmd1mSFAJrhXctCOcgeeHNyrFyZUk8x6iktbdGrBTW9r0MUnT+GITHIdYWphyYE+cVDB/CxV0ZJbUHLZAOr3/iV+LQgrt16eNJS3ahKIrAqX26zmVFkYTfJeDRWXM6U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnV2MWVCSVFaTXVOV2J6Rnp5cTBnQlRMMnBGWjNHbllBV3FtRWhmRlVyZnEx?=
 =?utf-8?B?RFpocXppMlp5NnZXVWQ0NktIVXNuWiszbmJTak1ocU1CUVB1NlZ4NXV4QTFE?=
 =?utf-8?B?bXBadkhCUnFNU200MHJpZzhkUkgzMUptWHlBTE1mU3kwY1V1NGs1QnhVTmVx?=
 =?utf-8?B?d0J4Ty8zTEdOZ0h4VjhBdnh5emZxckNGSmpVKzAraVZOOERWeE40QzJmVDJj?=
 =?utf-8?B?OXRHQktMclBqVGlrZC84d1lvU0dWc3c2ajlyR2IwKzJIMkZIenBiVXdteGp2?=
 =?utf-8?B?MjFIVURLbUdjTlBrMFJOeW0zTThnTmtyaG5mU1FzcFpQOG5vTm9HRGMyejJZ?=
 =?utf-8?B?NXRtaEFKS3BQcnowM1U2UUtlcEpWc2tPVlJjb2NFNnpoSHpabWJCdDNOVDkx?=
 =?utf-8?B?dVBseWJmNlBkVDJIU3krUEVJNDB0Q2srQitWSGtsQzR6ZndVTzYvdHFsMFNr?=
 =?utf-8?B?WG9LdUgrZk1ZdnN6SFNZZ0VIbmtqVnlLa01xU3pWcFN5bFo1TWl3dWc0UVNs?=
 =?utf-8?B?YWowQlpwNzEwQ1B4UVVhazFXd0p0azZGaGt3bENvQ0RHemdtUnlTY2UrN1ZG?=
 =?utf-8?B?cGlMN0dyMVZER2d6SE5yRWkwcEtUd3FDY05LZ1Y2MUYzNUVHRExPLzhVa0xY?=
 =?utf-8?B?N0xiaSsxYTVKQWlEY2d0eHVtV0RXbElsYUtESnVSdkVDWVR2bThWa0xmVEFL?=
 =?utf-8?B?eTcvYVRXbUh4L1MraUV3dHhXUzgyL3U4N0ZwZlAwMTlIeVlNVitGN2YvdjZl?=
 =?utf-8?B?RFgyYzU4VjJXWEt2bEtaOEplRkZVVHFDRHA5OHZFREQxaC9FYmErTUwydURs?=
 =?utf-8?B?NTEwR1B2WG9XYmZLdFYzZTczTWR3WmxJbUtqQWdSRlVaVnJUZy9LazdDOHRi?=
 =?utf-8?B?RjlFTHpEY3A2SHkzTEpqUHExOFpKb1Y4TW5nSkVnOWlxZWRqMnU5Q1JHY081?=
 =?utf-8?B?TTdiOUFJc3VPTUxGTmFRVFVJYjBQSzh6bTg2NkRKWjd0Ni9maG9zWWEyWDhO?=
 =?utf-8?B?aVpXSWZZUVMzQmlmNUQ0UHlrZ2NQK0JHeUJ5emZ1ZlR6Q0h0WmVYTTFtcktj?=
 =?utf-8?B?QmJMNTJCcXAvNEF1aitKckVyQzB1eUJOYlJRODFpemF5aXNESUFKSDlWcVVB?=
 =?utf-8?B?RDBGQ05PY1FGWFF2YXZhSEllUlNzN3lnM3U4UmJNREg2YkhoeE84cVNOYkZr?=
 =?utf-8?B?TmJET3RyWjBNa2taNUJZUStpZnZxdkozL01rclFvODRoZGE5V1JvN3kyWHhM?=
 =?utf-8?B?Z1djbHRXQVNoUVpOd0lYODRYV1dVT01qUjBYbFF6b2U2MjcxYTZYL2IyS2xG?=
 =?utf-8?B?dVRTU24rYkNlTHR3SnZDWGtLdUErTjJES0RKNTdaTXB4cWZzOGJ4dThUK2VV?=
 =?utf-8?B?NjliSjhnMXBFU1laNXlBamF1cXlFWEJSTWtOT05KQkl5cnFYVFJCR1RuekJB?=
 =?utf-8?B?R3diVXU0SDNxMFhwM2c3VnU5Yno0NGdHRDFlVlljNldRRTRuSFhLZERLckdQ?=
 =?utf-8?B?WDQ3Y043VWV4SEZtMTA2bG5vdzdlbTVpMVFyaVM5cTVnMXNiYzlCTjVUMGFC?=
 =?utf-8?B?Vk9HUGJYTW1QbnBmVVE5VTcyWStlZXB3Ymxta09uU0wxK0hlUnBRUi9tZ0I1?=
 =?utf-8?B?OS9rMUl5TzNTOVBwdW91N0VXZnpkTWg4aUFpY2wvRE5acGNWNVhXMWFxUDZN?=
 =?utf-8?B?OXBGOVhMQkdCSVFqM0JCeTlqeFZ5Wk95cE5rbWVDN1ZVRXJSenRLVzIzY1p2?=
 =?utf-8?B?Z04rUXNuSUJtWFZablFBciszcC8ycno0Unh5VlNSV2ZUUWs4dis4M3VCNSs2?=
 =?utf-8?B?L3Bqa01vRzVQR0h1Vi82ZHFGbWNha3QxL0taL1pYUEk5cEhWY3lwU0Erd2do?=
 =?utf-8?B?RUdzUlpUQVViU1BRUSsrcDVZK2pNUS94WmtuRVpFNXFGdExEWDdkY3g5cWNo?=
 =?utf-8?B?Y3oxY0k4bEZYaW5WSUZSM3g3dlo5bzR2ZnJzRloyMUdBb2JUbUpqQW5EMzdR?=
 =?utf-8?B?bzdDWE1NTWFXbEFXeDRaTC9vWVFaOHBoS0lYU3E1K0NyalNWV1poSnUvam11?=
 =?utf-8?B?K2RPT2tLYzFlcnF0WHJoT1NxWGMxQXBsMmN4dlZGNm5Wb1hQZXRuMUh3SjRi?=
 =?utf-8?B?Q3E0RVFlM1FFdGxBL0FkRUV1MHVIZFBkbHNwU0Ezb0tIREYxZnpzUytpTEJk?=
 =?utf-8?B?S3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3F10FADE6EB824C9B5D9DA6A1D2319B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 021c404f-adf3-455b-4ed1-08dc5df5153a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 09:10:38.4074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m4tlFCBunSzkWRYp5GNZ8aIsyBfXi0P+b7AEJy6w71jj+TQZ0wAa+pr0hXLOXj2r2p5T+hvcsPX/s1pBHZ1RncAm/cde4QLiGmDgnXgRavQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4802
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

T24gVHVlLCAyMDI0LTA0LTE2IGF0IDA4OjIwICswMDAwLCBNYW5uYSwgQW5pbWVzaCB3cm90ZToN
Cj4gDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogSG9nYW5k
ZXIsIEpvdW5pIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+ID4gU2VudDogTW9uZGF5LCBB
cHJpbCAxNSwgMjAyNCAzOjM5IFBNDQo+ID4gVG86IE1hbm5hLCBBbmltZXNoIDxhbmltZXNoLm1h
bm5hQGludGVsLmNvbT47IGludGVsLQ0KPiA+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTXVydGh5LCBBcnVuIFINCj4g
PiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+OyBOaWt1bGEsIEphbmkgPGphbmkubmlrdWxhQGlu
dGVsLmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDUvNl0gZHJtL2k5MTUvYWxwbTog
RW5hYmxlIGxvYmYgZnJvbSBzb3VyY2UNCj4gPiBpbg0KPiA+IEFMUE1fQ1RMDQo+ID4gDQo+ID4g
T24gRnJpLCAyMDI0LTA0LTEyIGF0IDIxOjIyICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOg0K
PiA+ID4gU2V0IHRoZSBMaW5rIE9mZiBCZXR3ZWVuIEZyYW1lcyBFbmFibGUgYml0IGluIEFMUE1f
Q1RMIHJlZ2lzdGVyLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmltZXNoIE1hbm5h
IDxhbmltZXNoLm1hbm5hQGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gwqBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uY8KgwqDCoMKgwqDCoMKgwqDCoCB8IDUgKysr
KysNCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5
cGVzLmggfCAxICsNCj4gPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4g
PiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfYWxwbS5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxw
bS5jDQo+ID4gPiBpbmRleCA2OTlmMmYwNTE3NjYuLmFlODk0Yzg1MjMzYyAxMDA2NDQNCj4gPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+ID4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiA+ID4gQEAg
LTMyNSw2ICszMjUsMTEgQEAgc3RhdGljIHZvaWQgbG5sX2FscG1fY29uZmlndXJlKHN0cnVjdA0K
PiA+ID4gaW50ZWxfZHANCj4gPiA+ICppbnRlbF9kcCkNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqANCj4gPiA+IEFMUE1fQ1RMX0VYVEVO
REVEX0ZBU1RfV0FLRV9USU1FKGludGVsX2RwLQ0KPiA+ID4gPiBhbHBtX3BhcmFtZXRlcnMuZmFz
dF93YWtlX2xpbmVzKTsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4gPiANCj4gPiA+ICvC
oMKgwqDCoMKgwqDCoGlmIChpbnRlbF9kcC0+bG9iZl9zdXBwb3J0ZWQpIHsNCj4gPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhbHBtX2N0bCB8PSBBTFBNX0NUTF9MT0JGX0VOQUJM
RTsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9kcC0+bG9iZl9l
bmFibGVkID0gdHJ1ZTsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoH0NCj4gPiA+ICsNCj4gPiANCj4g
PiBJIGRvbid0IHNlZSBsbmxfYWxwbV9jb25maWd1cmUgYmVpbmcgY2FsbGVkIGZvciBsb2JmIGNh
c2UgaW4geW91cg0KPiA+IHBhdGNoZXMuDQo+IA0KPiBFbmFibGluZy9EaXNhYmxpbmcgTE9CRiB3
aWxsIGJlIGRvbmUgYWxvbmcgd2l0aCBhbHBtKGF1eC13YWtlL2F1eC0NCj4gbGVzcykgZW5hYmxl
bWVudC4NCj4gSGVyZSBsb2JmX3N1cHBvcnRlZCBmbGFnIGlzIHRoZSBzd2l0Y2ggdG8gZW5hYmxl
IExPQkYgb3Igbm90Lg0KPiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgSSBhbSBtaXNzaW5nIGFueXRo
aW5nLg0KDQpJIG1pZ2h0IGJlIG1pc3Npbmcgc29tZXRoaW5nLiBFLmcuIGluIGNhc2Ugb2YgYXV4
X2xlc3NfYWxwbSBQUg0KbG5sX2FscG1fY29uZmlndXJlIGlzIGNhbGxlZCBmcm9tIGludGVsX3Bz
cl9lbmFibGVfc291cmNlLiBXaGVyZSBpdCBpcw0KY2FsbGVkIGZvciBsb2JmIGNhc2U/DQoNCkJS
LA0KDQpKb3VuaSBIw7ZnYW5kZXINCg0KPiANCj4gUmVnYXJkcywNCj4gQW5pbWVzaA0KPiANCj4g
PiANCj4gPiBCUiwNCj4gPiANCj4gPiBKb3VuaSBIw7ZnYW5kZXINCj4gPiANCj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqBhbHBtX2N0bCB8PSBBTFBNX0NUTF9BTFBNX0VOVFJZX0NIRUNLKGludGVsX2Rw
LQ0KPiA+ID4gPiBhbHBtX3BhcmFtZXRlcnMuY2hlY2tfZW50cnlfbGluZXMpOw0KPiA+ID4gDQo+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfZGVfd3JpdGUoZGV2X3ByaXYsIEFMUE1fQ1RMKGNw
dV90cmFuc2NvZGVyKSwNCj4gPiA+IGFscG1fY3RsKTsNCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaA0KPiA+ID4gYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaA0KPiA+ID4g
aW5kZXggNjExNmMzODNiNTQzLi5mNjFiYTU4MjQyOWIgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaA0KPiA+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgNCj4g
PiA+IEBAIC0xODg0LDYgKzE4ODQsNyBAQCBzdHJ1Y3QgaW50ZWxfZHAgew0KPiA+ID4gDQo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgLyogTE9CRiBmbGFncyovDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
Ym9vbCBsb2JmX3N1cHBvcnRlZDsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGJvb2wgbG9iZl9lbmFi
bGVkOw0KPiA+ID4gwqB9Ow0KPiA+ID4gDQo+ID4gPiDCoGVudW0gbHNwY29uX3ZlbmRvciB7DQo+
IA0KDQo=
