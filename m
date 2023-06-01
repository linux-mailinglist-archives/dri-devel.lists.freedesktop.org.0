Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C74671A0AE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 16:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6DD10E562;
	Thu,  1 Jun 2023 14:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C3E10E122;
 Thu,  1 Jun 2023 14:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685630652; x=1717166652;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lhJ56TbP1Fy4soyPzXDzuCzraNvmullStG2F35OTwYw=;
 b=LGSvXoSrHxE09B5KXZH5gB7tUS8Sf0HnBv91a6iMxoVnwxQtgakvpZ4+
 KaAlN0Lt+CkmIPpjFuuNopqdXWyoN8pGFT/F4Ce/tLDd6AuGMkMkCHO+w
 Bi+Hrp4fIVAXcwbVeIjWnvHbvfyCF+JICVLQn2+y4HKUp2nw9ADu4W1Oy
 4zgphcbMUPCbDhrsV/qST+Kje23oOqlQ3MiMqveT40gF+sRutxYCd3NUk
 rS4HmWphj+ctTQlBhIEKB5/P51Pzj+mrlryi+nFdQK6OytYbWf2AW7R29
 EcfAiSRBYyv9ya9lfsPnbaoTXzzU61jFUg2BibwCCxVF/oL40Eac7A0XE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="421380387"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="421380387"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 07:30:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="851725560"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="851725560"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 01 Jun 2023 07:30:06 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 07:30:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 07:30:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 07:30:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRj09U0CoYjxks2GB7c6mp90kGk+E+GhXWYJrfPD6lGBhLEEawOmbCtgly1mF59cGUMei+m2Ccv6DKhcfy2tiLUofHIUAQ3oG0fo1SQuyKpdLfLwX52zkofbMGFFeMnHWAicudk5kwRQ7XaNuFEI+yOX1DIPqb8CV7lmZtfYsdD7+wxy+dHmaDjVe3X8UMoJRdO67wyMZsK26MotW7yfEAA6BoshXGxsWUhKmcWrfofjXQiRQb1DxD+a3nT+oppvV5cmS3kmmQg83oFmy1AWoXqYU7pHNBS1peIgeEOSKeBFwitI5ohjlLs1zLKGIGJWVJX4oKyokpPYkbzgoJ4rlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhJ56TbP1Fy4soyPzXDzuCzraNvmullStG2F35OTwYw=;
 b=ebv7KnD/GH1GuZUraE97ViQj0rw3KO0LdTm8P9ansP+cRYoV117dvB/lo986UqHEbCWK1AJjDEz2KQD3SZAdOoTaTVRItczZm7RLAg96xHS9820ZU8sj7aLiTXolw2Tfl0qReZEKRZwnyI80kJexdGzI9DrPrbKiSyqcO6ApP0Nd+bVlaYE2kpUBl0P74t4rSQ6ifucuulDVOjn5EHuIXM+O2xH2fg1QbTdN3BuGuecle3vFF2mvraMsWDReNXvGs6q8r5KynDboFzGOMrr+CF2h1nSSaC5Qx4bRhwvMgMO1rEs0MrTfjnN9AmxrNPfbFhszA0e2v1xaRlbhVtLVbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS0PR11MB6517.namprd11.prod.outlook.com (2603:10b6:8:d3::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.24; Thu, 1 Jun 2023 14:30:02 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8%6]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 14:30:02 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH] drm/i915/gt: Use the correct error value when
 kernel_context() fails
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/gt: Use the correct error value
 when kernel_context() fails
Thread-Index: AQHZj8+DMqaSU8ONckand/SVWVxAeq917fiAgAAabvA=
Date: Thu, 1 Jun 2023 14:30:02 +0000
Message-ID: <SJ1PR11MB620427ACD1EB3B717FDFA1BF81499@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230526124138.2006110-1-andi.shyti@linux.intel.com>
 <6897a425-8217-8fca-d0a0-fc02073f6b45@intel.com>
In-Reply-To: <6897a425-8217-8fca-d0a0-fc02073f6b45@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS0PR11MB6517:EE_
x-ms-office365-filtering-correlation-id: 34f4fcff-782f-4a87-97fb-08db62acaf98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QsBsNIkVh5wUDNQfYU+lSDFbaVOIE76fVOIECan7wFYyZ5VeUf2rK8NP5EB+ZF7+F7XohBtNEGoV2GhZluQpMVBEMWVOhlXvQy7A4Vk9QTWoVDc/pcC57LGaAlHs5Uz7EwBS//KXF3UgBizx8Y8IWJ/gwRkPTLvRkXZRqCX9NxiXrA6OGHy5v583s0cgyQz8aNFd3GaRJbWgW7+ELxia+rc9YrFAOXLkm01jUVDMhwl87FKujIG9iA0MW7jEzY0/EzKuEOjogQKl+Ug0JH+l3LYc505pNZE4H6b8M/iLXtZe8pBbB2Vx7Lozwbhya9gKgvudb1fWLaOdD6ARTsAfFRAwpIS6yN6+cttKVQgc2Wy4ddO/w6lk0kzNJYmM/mRJywusFLGMcYhHKan1CE0rmvt8RV066qTPPNhPdj/c44NWs16NiAL5vRXoG0SyhxPXZ/q2KWKHHCgKsKKnkbN0n5DCX+0NwEnbZKhOeIvIEIIgpskWKPhUB3tO+fJQxyb3mzFd2gKQTmQ94PDedMnXoa2Mt9S/ROhqYvfmBDrG4dRXY5g/ic+jyhfPwq/sGWwUQiCYRuPD102gnH2fa5FP1JgEnEMHEts6qv1AHuxm6KQqsjfTMsUWrYRNlejSj745
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(66446008)(66476007)(4326008)(64756008)(66556008)(8676002)(8936002)(316002)(41300700001)(86362001)(66946007)(76116006)(110136005)(2906002)(5660300002)(54906003)(38070700005)(52536014)(478600001)(71200400001)(82960400001)(38100700002)(122000001)(7696005)(83380400001)(186003)(6506007)(26005)(9686003)(53546011)(33656002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WE5qUTB4V1lqK2FJaE1lT1BjeHcwRk83VWU2Zks5WGlrYlRnVTM0dW1SSHpE?=
 =?utf-8?B?T3FXb3BVV0RwY1pvNktlNkVWd2wwTWlIRTVyaUlFV0RqZE1GalZ1Wjh1QXZH?=
 =?utf-8?B?K1EreVBFNzhtR1BFOEdvNm9WOHRXZDd0d3VOb29uVlEzT0V5YWVvNXB6TjdN?=
 =?utf-8?B?Q201d2N5SnpkR1NTa2VRNzRiSmg1WFJEVnhHdW1QMnhvSXF3MGdNd2pGSEtZ?=
 =?utf-8?B?VDZmTVVodGZPcnZSNHR1NGFMM3UzaENPbEpFQUNUZFl1bm5rU0lOdDNEQytL?=
 =?utf-8?B?ZFRPdHduTk9IeUExM2tKZ0VBb29VMFRPTXNxaVZzNkViK2N1b1NHMnZEOE12?=
 =?utf-8?B?QW5JSVlHdzJNZXZQdFJIZFZTTEErNFhkVGNkL1N6LzZKUlVLdElkRFp2Ynkr?=
 =?utf-8?B?VHR6UVVseTk3ZndzSnoxNGZyeXRMeGdab0JLS2lNVU1hZm8yT3JUTE9iZVRD?=
 =?utf-8?B?ZDZpTmxJOWVGQ1psNDdVeEJnRSs5VEIxdWkvSkdWV2dkQjZlL1p2WVlRdHVM?=
 =?utf-8?B?cWFtMG9nWnhYcHZZVkI5Wm4rcHJRdEpZUHV2M2YzNG5lMno0eTRpaSsxTFI3?=
 =?utf-8?B?a2RiYTVKLzQ3V3NsbXVodXE1QWtiR1hzR0YxVnByaDNkekx0V3VicVVnMW83?=
 =?utf-8?B?emI0bUp0ZXcrVlZxSnVoUjAyeUlvaXk5T25VeEpDcUVhV3lBOWdQMEZ6eG1P?=
 =?utf-8?B?cmIydk5mN3FTVEo0Z3IxdGZYL2Y5TWhORm9DQ3M0d2tSSVpPT1k0V05rY0tT?=
 =?utf-8?B?cGJZQnZmNUN2S01ITlo3ZDRFbHRzU3k5OXBKUE9xeFA2S2E1SGdabHFaN0RE?=
 =?utf-8?B?TkNuWHU2eTFNb3FMdWtjL0JuYkRvRVNpNm1TOGppM2NNM2J4bWc1Z2RVdVpm?=
 =?utf-8?B?ODlINDA3Vnc4RnJrd0ZjTFNRdzFyNHBlVk9jQ29yeThpUnQzN2V5aWRoU2tL?=
 =?utf-8?B?U2lLT3FYYVc0cHl6Q0NZMVZLOXFEMmgycGQwMDVTQldIdkFUaGNIbll6dGNB?=
 =?utf-8?B?OGVDaG5qWDhSVnErV1FLNzY1Rkd3em1Dd3RLZ05kY3VLME5vL1lydVJ0bElP?=
 =?utf-8?B?cFdFcEdZVnJOUEU4VkoreDBrNG1adHlFbTR2cjJqUnd4ZUNmYzlENTl2ZzhZ?=
 =?utf-8?B?ZE5Jak8zMFBPb29ZQVo0dGRLS09qZlBHWnJDdDFTZFkwWXFzdGRlOUFwWEpQ?=
 =?utf-8?B?REpYdU8zNWwxbVE2ZUFsVEFJdGRpbnpJamUrWG1WNkVYR0NrdEZiL1RHR29B?=
 =?utf-8?B?bzJhS1l4RnlOMDJIaUVpZStHemswVGNlMXJtNDFQMDNuWGdCdXc2M25BUXV5?=
 =?utf-8?B?OEwwaHhvbEhtSzVYcEFqRGowMEZSRExPeEIzbXRpR0FBWWZ2aExsdEh6UHRO?=
 =?utf-8?B?cjBWVE85dGJYY0s3U21Da2hZbWpqWnBaRlZEL1dtYTczRDhOeGEvamxNY3BO?=
 =?utf-8?B?ZnhlYVYwU041eHgweFV4MXQ3LytTMVpFUkJsQkJyV3FEYkQvNFpVd2VIcGNp?=
 =?utf-8?B?MW42eVpBaUZCaUF2QzVKZlBhSHUxVEdKMmNDcjc0QWwraEdSY0wxMG15Vnpv?=
 =?utf-8?B?REdKL0tHcFdoVjliWUdlRFAwcWJ6VjA5MGZxYVVQUHdoald5NkdDVWY5K0RR?=
 =?utf-8?B?Q3lGV2h4ai9HUndJRlFNSENyUFgyOUZ5TkZFcGpmMVR2NENTd2FBWE1JUXNN?=
 =?utf-8?B?c1ZzOXN0c1B1Nmo2MFkxUFNWYlFTVkJKaDJNYVJXc0Mxd2ZMWWlBREoxSCtq?=
 =?utf-8?B?aWtESHpZU2ltMUY5cjB1ZUlqSDFtRHpqU3k0TTYzM25iejdUR2FTejNFUlI2?=
 =?utf-8?B?U3lyOGlhWG9Mc2p1QXlUR2d4b0NSU3dua1M1OGNBYTFUVkhiVFBhYitTVGpa?=
 =?utf-8?B?bVR2eVUyemhqT0IvY09JaWZmbFM2aFk5R0QxT3p5d1ZDQUM0eGVkSzJNeDdI?=
 =?utf-8?B?L3dVRElWQ2xOUjkzT2tTYUZtQ2JsT0xXT2t5NjJLM2VCQkZ5R3BiZUlieFQw?=
 =?utf-8?B?TjRjdU9RbDRXMGpPaklyWHlrRVVRNmVaM3Rhc0xheEtZNkQ1RE0yUWY2djBa?=
 =?utf-8?B?RnJ6b3hzK0FDbFBBR3hqWXNaUWhhb3ZVUnJZZzFrbVgrMDU4YktUK29oUll6?=
 =?utf-8?Q?BCgrYFU/fo2pdganeo4QksNYP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f4fcff-782f-4a87-97fb-08db62acaf98
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 14:30:02.2445 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: asuZCC8EDv4+qP+jZnyHtcbU+63m3BUVr09laBdrDc3WMHereySHG280wWn/itPeXC3JRnHCvbiQRhrKex9Dqt2Y3YDDlC+IIBQcK4cZV1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6517
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
Cc: Andi
 Shyti <andi.shyti@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBBbmRy
emVqIEhhamRhDQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDEsIDIwMjMgNjoxNCBQTQ0KPiBUbzog
QW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBsaW51eC5pbnRlbC5jb20+OyBJbnRlbCBHRlggPGludGVs
LQ0KPiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgRFJJIERldmVsIDxkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnPg0KPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+OyBzdGFibGVAdmdlci5rZXJuZWwub3JnOyBEYW4NCj4gQ2FycGVudGVyIDxkYW4u
Y2FycGVudGVyQGxpbmFyby5vcmc+OyBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQGtlcm5lbC5vcmc+
DQo+IFN1YmplY3Q6IFJlOiBbSW50ZWwtZ2Z4XSBbUEFUQ0hdIGRybS9pOTE1L2d0OiBVc2UgdGhl
IGNvcnJlY3QgZXJyb3IgdmFsdWUNCj4gd2hlbiBrZXJuZWxfY29udGV4dCgpIGZhaWxzDQo+IA0K
PiBPbiAyNi4wNS4yMDIzIDE0OjQxLCBBbmRpIFNoeXRpIHdyb3RlOg0KPiA+IGtlcm5lbF9jb250
ZXh0KCkgcmV0dXJucyBhbiBlcnJvciBwb2ludGVyLiBVc2UgcG9pbnRlci1lcnJvcg0KPiA+IGNv
bnZlcnNpb24gZnVuY3Rpb25zIHRvIGV2YWx1YXRlIGl0cyByZXR1cm4gdmFsdWUsIHJhdGhlciB0
aGFuDQo+ID4gY2hlY2tpbmcgZm9yIGEgJzAnIHJldHVybi4NCj4gPg0KPiA+IEZpeGVzOiBlYjVj
MTBjYmJjMmYgKCJkcm0vaTkxNTogUmVtb3ZlIEk5MTVfVVNFUl9QUklPUklUWV9TSElGVCIpDQo+
ID4gUmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAbGluYXJvLm9yZz4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQGxpbnV4LmludGVsLmNv
bT4NCj4gPiBDYzogQ2hyaXMgV2lsc29uIDwgY2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPg0KPiA+
IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2NS4xMysNCj4gDQo+IFJldmlld2VkLWJ5
OiBBbmRyemVqIEhhamRhIDxhbmRyemVqLmhhamRhQGludGVsLmNvbT4NCj4gDQo+IFJlZ2FyZHMN
Cj4gQW5kcnplag0KPiANCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3Nl
bGZ0ZXN0X2V4ZWNsaXN0cy5jIHwgMTIgKysrKysrKystLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3NlbGZ0ZXN0X2V4ZWNsaXN0cy5jDQo+ID4gYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndC9zZWxmdGVzdF9leGVjbGlzdHMuYw0KPiA+IGluZGV4IDczNmI4
OWE4ZWNmNTQuLjQyMDJkZjViOGMxMjIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Qvc2VsZnRlc3RfZXhlY2xpc3RzLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC9zZWxmdGVzdF9leGVjbGlzdHMuYw0KPiA+IEBAIC0xNTMwLDggKzE1MzAsOCBAQCBz
dGF0aWMgaW50IGxpdmVfYnVzeXdhaXRfcHJlZW1wdCh2b2lkICphcmcpDQo+ID4gICAJc3RydWN0
IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iajsNCj4gPiAgIAlzdHJ1Y3QgaTkxNV92bWEgKnZtYTsN
Cj4gPiAgIAllbnVtIGludGVsX2VuZ2luZV9pZCBpZDsNCj4gPiAtCWludCBlcnIgPSAtRU5PTUVN
Ow0KPiA+ICAgCXUzMiAqbWFwOw0KPiA+ICsJaW50IGVycjsNCg0KV2UgY291bGQgaW5pdGlhbGl6
ZSBlcnIgd2l0aCAwIGFuZCByZW1vdmUgZXJyID0gMCBhc3NpZ25tZW50IGJlbG93IGJ1dCBsZWF2
aW5nIHVwIHRvIHlvdS4gDQoNCj4gPg0KPiA+ICAgCS8qDQo+ID4gICAJICogVmVyaWZ5IHRoYXQg
ZXZlbiB3aXRob3V0IEhBU19MT0dJQ0FMX1JJTkdfUFJFRU1QVElPTiwgd2UNCj4gY2FuIEBADQo+
ID4gLTE1MzksMTMgKzE1MzksMTcgQEAgc3RhdGljIGludCBsaXZlX2J1c3l3YWl0X3ByZWVtcHQo
dm9pZCAqYXJnKQ0KPiA+ICAgCSAqLw0KPiA+DQo+ID4gICAJY3R4X2hpID0ga2VybmVsX2NvbnRl
eHQoZ3QtPmk5MTUsIE5VTEwpOw0KPiA+IC0JaWYgKCFjdHhfaGkpDQo+ID4gLQkJcmV0dXJuIC1F
Tk9NRU07DQo+ID4gKwlpZiAoSVNfRVJSKGN0eF9oaSkpDQo+ID4gKwkJcmV0dXJuIFBUUl9FUlIo
Y3R4X2hpKTsNCj4gPiArDQo+ID4gICAJY3R4X2hpLT5zY2hlZC5wcmlvcml0eSA9IEk5MTVfQ09O
VEVYVF9NQVhfVVNFUl9QUklPUklUWTsNCj4gPg0KPiA+ICAgCWN0eF9sbyA9IGtlcm5lbF9jb250
ZXh0KGd0LT5pOTE1LCBOVUxMKTsNCj4gPiAtCWlmICghY3R4X2xvKQ0KPiA+ICsJaWYgKElTX0VS
UihjdHhfbG8pKSB7DQo+ID4gKwkJZXJyID0gUFRSX0VSUihjdHhfbG8pOw0KPiA+ICAgCQlnb3Rv
IGVycl9jdHhfaGk7DQo+ID4gKwl9DQo+ID4gKw0KDQpMb29rcyBmaW5lLA0KQWNrZWQtYnk6IFRl
amFzIFVwYWRoeWF5IDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQoNCj4gPiAgIAljdHhfbG8t
PnNjaGVkLnByaW9yaXR5ID0gSTkxNV9DT05URVhUX01JTl9VU0VSX1BSSU9SSVRZOw0KPiA+DQo+
ID4gICAJb2JqID0gaTkxNV9nZW1fb2JqZWN0X2NyZWF0ZV9pbnRlcm5hbChndC0+aTkxNSwgUEFH
RV9TSVpFKTsNCg0K
