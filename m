Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627AD8998AE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 10:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515C310E98E;
	Fri,  5 Apr 2024 08:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P/X8I+kQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6857E10E98E;
 Fri,  5 Apr 2024 08:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712307566; x=1743843566;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=pZeS509X8jASaU1YBzmDOFHlonIXNS2swfDT4xODiGE=;
 b=P/X8I+kQTlQWxb68kx319MXUB1uTuB/2upaO2Vd/PAyN+gmeoa5kvgm/
 h89PGjrPq3g7qquOZmK/V3oQ2R5ZUlavAJpL7dExY+WiAo9L/2eZLs2GU
 KuqfvMdX+fLSAXhsWkdDN7+MYSKdxEJFnHS3QNNi/jhJbkScG80/h4UNh
 9RjLE+1igB7uVy0GnixYNLMfi9nN3ZhrR+5SHUJBectUeijSS48lHRTHT
 nAEldgrLCrsxUdb3PgD0gNSy/rkyBklqSAsBGHj7nj2n5dlVJzbccgVO3
 RHf/AyNCZKdiOxEN6waf7pWeCyGBTvWaRxwYeRXDg/nLqzJ8UXFn7L9lv g==;
X-CSE-ConnectionGUID: B86bCLWAQBakH1gsoyek4w==
X-CSE-MsgGUID: bpplcrDSR0mFiJujjEql8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="11402996"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="11402996"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 01:59:25 -0700
X-CSE-ConnectionGUID: auFLpn/PSPyNtxwJpRuLMQ==
X-CSE-MsgGUID: G644/Lz5Qcqqx79ZwDfgNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19543493"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 01:59:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 01:59:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 01:59:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 01:59:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 01:59:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkL6FboeVLSzsH00U7kGp66+QtoalvK/hj0k9WE7vdGc2FUQznAroXWx1DQJn/O2qNO+rTuRHwOTU4L1JA6Mfdvil9WfkAmDKpfXPjYu16vB/I+awRTm0FYM+qhi2uBGSWIeGISJ5cNgfGGcW62JVL1Q5y/6btLCDg/xJxpx4OAtkDpOJurcemK02dt0sX8kBrK97AAn9+mvW0khzXXjK/3rG0iBJJySw6OZwff9OFEeIWydbGVhkKsHIUnBFo0ZGRa72adYSFjDMk7TEPU6Yrvak9Un+cLfdhiU7lLhIPtbLKOx0RLRQsfc2uOqK7WEupAGD5GS4tkVoNok17srFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZeS509X8jASaU1YBzmDOFHlonIXNS2swfDT4xODiGE=;
 b=JUA7P2lxgc4+WyGWAVOeuEaIDNoQ2BYw24OMwDxonVA5ewRaWoPQk+DjESOgoMoejXJn150eqPutrhqt5pVFead80qMmFLumVI/t9Ka2rqEePKq9yoP/WWAPa0iZY9Fr2NMzRxK5t9itj5CfMbLoAlKB1wJ7cRaS2PfsJ8x8iW1dugST8MsjyqKNAYC5sphi6VXPZ+yM5BrbnKUJ4CROO2k5Esvwh4zCv4pWO2cVYICJmFl2mRjZubBug4yPfETXw0RG/q3puKtb3TAtv6mxFunwIavAf1vpcx85s0wCPoR5RrPLavuho2zBXw4D1HfySTdyUlrjTAjVqafNuXVn0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.26; Fri, 5 Apr 2024 08:59:21 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f%5]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 08:59:21 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>, "javierm@redhat.com"
 <javierm@redhat.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>, "Deak, Imre" <imre.deak@intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v7 4/6] drm/i915: Initialize fbdev DRM client with
 callback functions
Thread-Topic: [PATCH v7 4/6] drm/i915: Initialize fbdev DRM client with
 callback functions
Thread-Index: AQHaa96y55jMVb0/3UyuKx7LF/SibbFZl1aA
Date: Fri, 5 Apr 2024 08:59:21 +0000
Message-ID: <a0697b419652e208657d9db695a381e7e56a4bce.camel@intel.com>
References: <20240301134448.31289-1-tzimmermann@suse.de>
 <20240301134448.31289-5-tzimmermann@suse.de>
In-Reply-To: <20240301134448.31289-5-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DM3PR11MB8683:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B+xdSMU72mE5iccrRE9WuHuRjDuDfARnzz7A60IBypQw1ntFRH7u0pAOfc3J5AQpOyRIfpjEw0igjxKoXipiOg2qy8ece1Hi2R74n/P8aQrWoVvpagrw3zLNmD8ulV58/F//r2NFErBwykB9eRnIzgPOoywS63Po2T/1Ot/T3zjqcfFSDbsynn/qS8nRYU+cTEIClhOtgqyCYvZhrqyN/s8bOMELcB/RqhyU2IfPRy0pgTtHg75fFUYCnYDfggWznZ1CsO/xKqEOcrKQZsxrllynHmIMAC/Cqw+Q44nqp6XXNMe11GnO0g5WDN7JMkLTBe7O7GmzrxU60zkkn1KKVv8QbpsrCSUgMdbX6U+TEu0T2inFBT91QfUGGWIVR4gb+FDv2Z4zrMViZzkcGrIlAqqW35oWn+/RTwhMNw/0hKk5vhWDfUFx9ZEdZhAg577vYyUujF6NhRDmckYxg892bIcukzV8b5KTpXRcOMiImZ9H4Ibz8HSKhGRvzGqKdv2ib4fjKmvXB4WoeISrMKDFXaUQrGn4f1PwDQyBd+RFwf4uSPTLxlcYL9wqWMBYuwhiCdlJkS09vUh4fpwaJjTXttN/ioXp+4R+Fk6nhCJLI/lCGivvPguRhmIUrZfsh8o81Ka0i+zKg5lZPzrUjQKZbwkhavJK0JowLv8sIvbSGTd3gKpB+kPBVFgNUpi73U7r6yLDNnWkXD7NYqAENQUhjw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005)(366007)(921011); DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z29vUm5TRU41MEYxVVFuZWxzdFB3T2Q0YzQ3L09RY0tyWWVrZllYczNZTkF3?=
 =?utf-8?B?Y2JvSHUvaFQwS0RHM1FvaUd4KzI2MDJhYUVNNTUyTnpPT2JBc1htL1drU292?=
 =?utf-8?B?TWRUVERZemp1ZVJGNjlXVVBiZ0JlY2E3L1JxMmRFd1RwbkEwSTZlR2RFQml4?=
 =?utf-8?B?THV1WXNJdnRsR01NVUVvcXMrQ0NOeWdWTkZTSTVaVTQvVW4rTUZSZ2RjUkhF?=
 =?utf-8?B?TVRjS3lkT3FPZkM2THhpRkVsVVZ2NlE0ZDl4NE9uS2lXSmVxOWZjaHJUaGww?=
 =?utf-8?B?R0NITi9ybGllMHJsTzNjYnY5WHZUZTdoaXBheTJTMlcyeks0OEl2MVlRTmNt?=
 =?utf-8?B?dVp4RC9ZaUlRQitNeTVJNE5nVE5aTFZqVFB0NU5kYnVDUVljcmZJdzFnTldJ?=
 =?utf-8?B?a2xUSFV0L0g0Rm1xczM0aFpwV3poTW1YQ05pbEY1ZnFrYzlmQXJ2aU9odkR1?=
 =?utf-8?B?dlNPc2doZ2M4Qzg3ckRVeDEyNlNNRUVic1p3SE1oVDNQaE1aZTVLWXdmS0Mz?=
 =?utf-8?B?SzBGUThFQ3BvM2REVk41QUJaS0pBOTJNMGVkTmlyd09uM1hiUmpyYTdncWRl?=
 =?utf-8?B?dkFZM25McmEydWtpcEZmSXZmbit1Q1pOVSszUG5CaFdERURyWlplQXpWUjBy?=
 =?utf-8?B?NmN6UDRBNksrbzlqNXI0R3Q5L1hnclpiSWw4SzNZM1kwQU5YSk1VL1VXWlpJ?=
 =?utf-8?B?VkIzdXlQMW1VYlZLTjdnMnZmOWxFem5ZaEZGVklNS0NTaTNGMFgrQmRXajI0?=
 =?utf-8?B?dTNRK09IQloxc2ZVRUpNMWQrZFo4THZyOHljdGRVV0Z2dzAvRlUyNGtjeGNX?=
 =?utf-8?B?dWFsVWZyOGdxOVl5OGEyOHluMW9YRlBlQndrMG43V2w1SnMvdXZOKytkaUF1?=
 =?utf-8?B?R2NzemMwTUJ3QnlHRHJUeS82MUNxYnN0NEZpd2hHWXBibVdJSDAxa1IvOHB1?=
 =?utf-8?B?cVU3QWg2UUFhY0dqSjNudzdJTElmczdDMXVuSXJtVlMrNXFaZzN4V3NxaEt6?=
 =?utf-8?B?b1lmV1hCMlNzc1VLWUd5S2NRcnR2c0Q1a1F6SHNZZWgxN3grVzJFNWhxOFI4?=
 =?utf-8?B?aVJWVWRsVHc5S2k3RGkzRHVnVE50N01QcFJQTytJMzV3N1NkMUdTUkNaV3NF?=
 =?utf-8?B?dkZ2TlduL29zd29NcnZSa2ZNMDJDVlcvbWQ3Y1ZDT2VlNndmSDVNVUR6VUhq?=
 =?utf-8?B?MXNlcnQwT0F4NEFLOEJIbjEyS1BoTHNCUVdjQS8vQi9ocjloTndmamFnbVhY?=
 =?utf-8?B?bnlHNGlpeisxaXMxdXppU2dienloUFRoWlRiMzdqWEcySzBZVGFoQkVDa2d6?=
 =?utf-8?B?ZllmTEdBc042cXhYQlZ2QkpadDk1Y09FbHE5KzhLMWMyaVVoYkFSL05uOWQ3?=
 =?utf-8?B?SDFkdC9WNlRmeDBoZVhiSUhnN2JOemoyZDRYcEp1bjlOWGErb3ZBckxzU2ho?=
 =?utf-8?B?dkp4N2QxUzZYVXJFcW55dFUvN2dKWXBPTEZUak96S0pJNG9Gd09qSHAxOTBH?=
 =?utf-8?B?eG5hdzVPUmRtdVR3NE1yYk90dlFWb3FRYS9MVExaeTg1VEhpM29Qc0lCcUdn?=
 =?utf-8?B?NjU2UjM3dit0TkU0Nk95NmY1bGNjTXJ1bmRvZmthc1hKTWRDS1NSdng2V0t5?=
 =?utf-8?B?R1NVb1JDdi9mbk9SYTlPTk1xN1dRS24vZ2RzVFBnVmNnRUF6MlY1eHFCTDNY?=
 =?utf-8?B?azdyajhkTlQrYjQvdDN4WjZ5M3FPYkt4Sk9nb3VvcTVteUV5RTV0eGtmSSt5?=
 =?utf-8?B?NHlueG1CRDdQS3VEN2NzN1M1d0xPYlN3K1o4QzNReGZWOXA5UUFCZkE3Ym4z?=
 =?utf-8?B?NDRnOGE4aE9Oek91NWxBL2V0bG9HVGpocW5LWEQ3SnR2Z3RFUUdxaUZZdnd6?=
 =?utf-8?B?eXVETmZnU3E4bGZsQnRHbzVYeURFUGFOQTZ0bVpGbzVheUJja29NQ2NBeG9C?=
 =?utf-8?B?SnQ3SmlCUHI0VW5FNUtieWVWNGh3UkphK0JBVm1FWURVdzZaTzltU3F6M21O?=
 =?utf-8?B?UjR4bFViUjNtMGhRaWRoalRaa1NxWjZ6T0tUOXJDQVFZSnY3YXlhQTRJZnVx?=
 =?utf-8?B?bWdCbHppZklCcjBPaURRMjIyRWlOSW5TSWhRRzRESmRRRmRJclZrUjVaM2lQ?=
 =?utf-8?B?UThpOUVFVCtKWW5BR3FGc3J5Uy82Qlk0QlZQR01pVHJIWWxTR2xIK1hqQVZz?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBB775EDB5AD4F4FBE8920A0283D5A20@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7024daf5-4627-4507-80e5-08dc554eaf41
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2024 08:59:21.5456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UwcRVYELgdLZkw1bnJeHLlPvpbe6/twS0COr0HbKHIQREq9dxyiAgS3o7jFv77fNw0SR1G3evKtTQH61LXKTEAijBt3iBJj15jDuoNfZQEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8683
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

T24gRnJpLCAyMDI0LTAzLTAxIGF0IDE0OjQyICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToKPiBJbml0aWFsaXplIGk5MTUncyBmYmRldiBjbGllbnQgYnkgZ2l2aW5nIGFuIGluc3RhbmNl
IG9mIHN0cnVjdAo+IGRybV9jbGllbnRfZnVuY3MgdG8gZHJtX2NsaWVudF9pbml0KCkuIEFsc28g
Y2xlYW4gdXAgd2l0aAo+IGRybV9jbGllbnRfcmVsZWFzZSgpLgo+IAo+IERvaW5nIHRoaXMgaW4g
aTkxNSBwcmV2ZW50cyBmYmRldiBoZWxwZXJzIGZyb20gaW5pdGlhbGl6aW5nIGFuZAo+IHJlbGVh
c2luZyB0aGUgY2xpZW50IGludGVybmFsbHkgKHNlZSBkcm1fZmJfaGVscGVyX2luaXQoKSkuIE5v
Cj4gZnVuY3Rpb25hbCBjaGFuZ2UgeWV0OyB0aGUgY2xpZW50IGNhbGxiYWNrcyB3aWxsIGJlIGZp
bGxlZCBsYXRlci4KPiAKPiB2NjoKPiDCoMKgwqDCoMKgwqDCoMKgKiByZW5hbWUgY2xpZW50IHRv
ICJpbnRlbC1mYmRldiIgKEpvdW5pKQo+IHYyOgo+IMKgwqDCoMKgwqDCoMKgwqAqIGNhbGwgZHJt
X2ZiX2hlbHBlcl91bnByZXBhcmUoKSBpbiBlcnJvciBoYW5kbGluZyAoSmFuaSkKPiDCoMKgwqDC
oMKgwqDCoMKgKiBmaXggdHlwbyBpbiBjb21taXQgbWVzc2FnZSAoU2FtKQo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgoKUmV2aWV3ZWQt
Ynk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPgoKPiAtLS0KPiDC
oGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJkZXYuYyB8IDQzCj4gKysrKysr
KysrKysrKysrKysrKystLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZmJkZXYuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9m
YmRldi5jCj4gaW5kZXggNzZjMGU4OWJmMjVlOC4uMzJhZWI1ZmFmNzA2YiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmMKPiBAQCAtMjg2LDYgKzI4Niw3
IEBAIHN0YXRpYyB2b2lkIGludGVsX2ZiZGV2X2Rlc3Ryb3koc3RydWN0Cj4gaW50ZWxfZmJkZXYg
KmlmYmRldikKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGlmYmRldi0+ZmIpCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fZnJhbWVidWZmZXJfcmVtb3ZlKCZpZmJkZXYtPmZiLT5i
YXNlKTsKPiDCoAo+ICvCoMKgwqDCoMKgwqDCoGRybV9jbGllbnRfcmVsZWFzZSgmaWZiZGV2LT5o
ZWxwZXIuY2xpZW50KTsKPiDCoMKgwqDCoMKgwqDCoMKgZHJtX2ZiX2hlbHBlcl91bnByZXBhcmUo
JmlmYmRldi0+aGVscGVyKTsKPiDCoMKgwqDCoMKgwqDCoMKga2ZyZWUoaWZiZGV2KTsKPiDCoH0K
PiBAQCAtNTc5LDYgKzU4MCwzMCBAQCB2b2lkIGludGVsX2ZiZGV2X3Jlc3RvcmVfbW9kZShzdHJ1
Y3QKPiBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGludGVsX2ZiZGV2X2ludmFsaWRhdGUoaWZiZGV2KTsKPiDCoH0KPiDCoAo+ICsv
Kgo+ICsgKiBGYmRldiBjbGllbnQgYW5kIHN0cnVjdCBkcm1fY2xpZW50X2Z1bmNzCj4gKyAqLwo+
ICsKPiArc3RhdGljIHZvaWQgaW50ZWxfZmJkZXZfY2xpZW50X3VucmVnaXN0ZXIoc3RydWN0IGRy
bV9jbGllbnRfZGV2Cj4gKmNsaWVudCkKPiAreyB9Cj4gKwo+ICtzdGF0aWMgaW50IGludGVsX2Zi
ZGV2X2NsaWVudF9yZXN0b3JlKHN0cnVjdCBkcm1fY2xpZW50X2RldiAqY2xpZW50KQo+ICt7Cj4g
K8KgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgaW50ZWxfZmJk
ZXZfY2xpZW50X2hvdHBsdWcoc3RydWN0IGRybV9jbGllbnRfZGV2ICpjbGllbnQpCj4gK3sKPiAr
wqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiArfQo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBk
cm1fY2xpZW50X2Z1bmNzIGludGVsX2ZiZGV2X2NsaWVudF9mdW5jcyA9IHsKPiArwqDCoMKgwqDC
oMKgwqAub3duZXLCoMKgwqDCoMKgwqDCoMKgwqDCoD0gVEhJU19NT0RVTEUsCj4gK8KgwqDCoMKg
wqDCoMKgLnVucmVnaXN0ZXLCoMKgwqDCoMKgPSBpbnRlbF9mYmRldl9jbGllbnRfdW5yZWdpc3Rl
ciwKPiArwqDCoMKgwqDCoMKgwqAucmVzdG9yZcKgwqDCoMKgwqDCoMKgwqA9IGludGVsX2ZiZGV2
X2NsaWVudF9yZXN0b3JlLAo+ICvCoMKgwqDCoMKgwqDCoC5ob3RwbHVnwqDCoMKgwqDCoMKgwqDC
oD0gaW50ZWxfZmJkZXZfY2xpZW50X2hvdHBsdWcsCj4gK307Cj4gKwo+IMKgaW50IGludGVsX2Zi
ZGV2X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPiDCoHsKPiDCoMKgwqDCoMKgwqDCoMKg
c3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdG9faTkxNShkZXYpOwo+IEBAIC02
MDAsMTYgKzYyNSwyNiBAQCBpbnQgaW50ZWxfZmJkZXZfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2KQo+IMKgwqDCoMKgwqDCoMKgwqBlbHNlCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBpZmJkZXYtPnByZWZlcnJlZF9icHAgPSBpZmJkZXYtPmhlbHBlci5wcmVmZXJyZWRfYnBw
Owo+IMKgCj4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gZHJtX2NsaWVudF9pbml0KGRldiwgJmlmYmRl
di0+aGVscGVyLmNsaWVudCwgImludGVsLQo+IGZiZGV2IiwKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmludGVsX2ZiZGV2X2NsaWVu
dF9mdW5jcyk7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgZ290byBlcnJfZHJtX2ZiX2hlbHBlcl91bnByZXBhcmU7Cj4gKwo+IMKgwqDC
oMKgwqDCoMKgwqByZXQgPSBkcm1fZmJfaGVscGVyX2luaXQoZGV2LCAmaWZiZGV2LT5oZWxwZXIp
Owo+IC3CoMKgwqDCoMKgwqDCoGlmIChyZXQpIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKga2ZyZWUoaWZiZGV2KTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0
dXJuIHJldDsKPiAtwqDCoMKgwqDCoMKgwqB9Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBlcnJfZHJtX2NsaWVudF9yZWxlYXNl
Owo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGRldl9wcml2LT5kaXNwbGF5LmZiZGV2LmZiZGV2ID0g
aWZiZGV2Owo+IMKgwqDCoMKgwqDCoMKgwqBJTklUX1dPUksoJmRldl9wcml2LT5kaXNwbGF5LmZi
ZGV2LnN1c3BlbmRfd29yaywKPiBpbnRlbF9mYmRldl9zdXNwZW5kX3dvcmtlcik7Cj4gwqAKPiDC
oMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gKwo+ICtlcnJfZHJtX2NsaWVudF9yZWxlYXNlOgo+
ICvCoMKgwqDCoMKgwqDCoGRybV9jbGllbnRfcmVsZWFzZSgmaWZiZGV2LT5oZWxwZXIuY2xpZW50
KTsKPiArZXJyX2RybV9mYl9oZWxwZXJfdW5wcmVwYXJlOgo+ICvCoMKgwqDCoMKgwqDCoGRybV9m
Yl9oZWxwZXJfdW5wcmVwYXJlKCZpZmJkZXYtPmhlbHBlcik7Cj4gK8KgwqDCoMKgwqDCoMKga2Zy
ZWUoaWZiZGV2KTsKPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+IMKgfQo+IMKgCj4gwqBz
dGF0aWMgdm9pZCBpbnRlbF9mYmRldl9pbml0aWFsX2NvbmZpZyh2b2lkICpkYXRhLCBhc3luY19j
b29raWVfdAo+IGNvb2tpZSkKCg==
