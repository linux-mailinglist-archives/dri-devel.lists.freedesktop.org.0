Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 714B77269A0
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 21:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10D610E0E4;
	Wed,  7 Jun 2023 19:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E0B10E0ED;
 Wed,  7 Jun 2023 19:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686165756; x=1717701756;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6g9EF25/zCfAGGCsBOVtJMpUbWdyvDKTbBH+E0835gk=;
 b=Qk58iyQhcSpfFCjPIgDMQlgLf4jRMVq1QtgV6oe+6VZORC1CSyR7CZqo
 Zx3M/wE3swOjcIkmxyoLWXEWPGmnOz8PX7VKC0f6bc8hOzggs3YXmwqTL
 zK/nLhjT13Gj2ESkP761Zqg/FVMZcDNUNZMMsGW4grC2qHYA6NRDwCsx/
 RFlAVI3RUC7Bn2SSzWXiKzPMnqBSY/BwIp8QFrRqTpjIT3mwoTZqK7vS7
 1mp+y4iTphYHrAlRqwXSNUUz5YhJoVyx6U+nFfH7fQkXuWq03F3l7sujA
 oL2RradmlPhYvb13DaXz+VENHGXnAPkZn58ODUWynrN/QWcekFSKzQiRl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="385418085"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="385418085"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 12:22:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="742829332"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="742829332"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 07 Jun 2023 12:22:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 12:22:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 12:22:34 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 12:22:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNhHT7P/67KNB3V94pamabb1cUN4mFO5t1LAKQm69Tj/w2RBvLak24U6Fh3ZtUtNNyPCJlH/9DrMJUrSsWge4AdofgayyEvxWBrYGFplclmW4uMf2haQ47/HUGaoRNoA2bWcRN8+cfSqfrUg3eYfSW9bLIPDG4FsyTV14vcmL0E3dUQ13Voiq889JxvX8WSTlgsj/dZUq+BIAP4m0NuUNUXbw34objqBJfBeCCHonbwonTYQnp2Gsb1c/DyicnyyhOWtnu1D7AAUPPs/yjKTnbi09SCZVNgRoXeTtNYnfMBOyHi+gqlCP4KxfE78aPBsbji9idHXvoj4k032bvxFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6g9EF25/zCfAGGCsBOVtJMpUbWdyvDKTbBH+E0835gk=;
 b=U7XD/LpNotxqfqL0YwVGo8cqIdFyWZfsBS14CdVeDU4tfP5AvJCypOcuZJtt9BLYhVY3GCyn9A3hjAv1FHngjGa5mRq3iBCl1hJ2Z/EKHaA/yhAmJIcBvp7FPdhNHvAE8V2btVlRMGJ9/QFPbnSqJIcQoVT/lGI/y42i5DpzVZ3X8BRh8P85Lbhem+SfIncw5VZcC7ak2qM4IQK11JBqoETqvMJLPeN1TDCqcGi5ls50t4DovbQEwK3+Wa0g3AWUiHUCjgzRy467+pt4vsSnDwAqPL5hHhyI+lERMeXOzhkL/hw/bTZBnRvcxmviUBw1S06FMO7TIji0e3D24ZvgFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BL1PR11MB5253.namprd11.prod.outlook.com (2603:10b6:208:310::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 19:22:32 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::749a:b0c8:4930:5a2]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::749a:b0c8:4930:5a2%6]) with mapi id 15.20.6477.016; Wed, 7 Jun 2023
 19:22:32 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/5] drm/i915/gsc: fixes and updates for GSC memory
 allocation
Thread-Topic: [PATCH v2 1/5] drm/i915/gsc: fixes and updates for GSC memory
 allocation
Thread-Index: AQHZmB4CVhZR3p0BCkSwFb46jlHpga9/upEA
Date: Wed, 7 Jun 2023 19:22:32 +0000
Message-ID: <1458ff61de558ce09b2c1c53da0f84d224b2a89c.camel@intel.com>
References: <20230606022402.2048235-1-daniele.ceraolospurio@intel.com>
 <20230606022402.2048235-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230606022402.2048235-2-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|BL1PR11MB5253:EE_
x-ms-office365-filtering-correlation-id: d54be467-a133-4817-59b4-08db678c8ab1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y3kwK1oOMwMlP09Jb4RGzKEuHe3dEj8lRF1vtB4/TLrIWMqQYLOrqSxiLTkEdryDDWrjbmJjgz2WlssU3bts4zv73GD1nhj4DAVhFbdvplxaNQBBQfehWEdL2nbRQFc0Rlx9zb6SQeHgOxtbzvpC120mtIfGKLdt7HO0RV+iU9pd8wvIkNGwJZIrhrctjjTyFN9sat6zM1v9xxBC6XN2zAgTELxQ4al13S09pxZm+jr/gmklq09qC7XUiB5VW6g/++ClQZu05+UDI9UV6+GwERqzswl88FIssHCQmlXHnXEMbsWGxFCuxgMV/rMTOUWEhUuoaTIe0559aKBfFePufQX6acR2uqzwstHEkgo3G0K58m+BES4feVpTnYTh8S+uK02j+nAclUMoG0k6cKI16rCi71O+nrQBjKG2IWuk6D/MEFCwmP+f5mEt1NqM0Jj+YYf2Z5OiGbk870QvTZu9Nt1gSN/kaxr0jjllhRpkmCpI7ITAjy0/0dIibYUeo/ccvORhezrAlk72nWPF938EJerBRx13Mc7yRGFfaFb4pnIFfQyc9nxOe5FLiW+rn42agIt1VocacKfiYJjx3HojQNa6WGZP7h2ws+EVRcRj38LXTJyGtFm//SUQmGgKiRan
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(39860400002)(366004)(396003)(451199021)(110136005)(36756003)(2906002)(54906003)(15650500001)(38070700005)(71200400001)(478600001)(86362001)(38100700002)(41300700001)(8936002)(8676002)(5660300002)(82960400001)(316002)(450100002)(66556008)(4326008)(64756008)(122000001)(66476007)(66946007)(76116006)(91956017)(83380400001)(6506007)(2616005)(26005)(6512007)(66446008)(186003)(107886003)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L29zaWtuM1hvVzNYUnFBeWsxdzRyeGxaamhKSDlmU01RYTY1SjNMUFNLT252?=
 =?utf-8?B?NzFNUnQ4RlJXLzJkT3NSUVphWDdldlhiYWNrNUpsbkhReklDcDI2UXplN1U2?=
 =?utf-8?B?LzZxMERGRG5oODZMTmxTQ09vM2xIZ3ZxeWdsZWhHQlVlNmtoWXB6TE9yakZL?=
 =?utf-8?B?MUdRd1hRNUd4WlVaZHZ3VE9TNnVKMzlOVFJEUDZ3M2hOTWhZdzQxbGd0a3R6?=
 =?utf-8?B?K3F3TVdvT1JWckxWZXhoa1hGbURiQ3gvRmNlVjIzT2lMNGdFOEZTVXlVOHdr?=
 =?utf-8?B?SDZKM3doMTF3OTlpQlBQVWxBWTNXank5amhiWGdiZy9SZTBodFU2blk1U2tC?=
 =?utf-8?B?OUdlVWdRc2VaMDdQbjBYN21wV0Z6d1A1YUd6RUt5cFN5Z3NMNlhhQ3lVSUw1?=
 =?utf-8?B?a2xuQjdTbVdISEdMSWZZaEZJWGVRc3JRaXVkRDJhb1hvQUwrNHhoazZqZy9P?=
 =?utf-8?B?R3F3T3JzYzVQZ280TE5SNTVkN2l2N3N3OXh1RHY3M3J6OURBUHBGY1ZHZWFV?=
 =?utf-8?B?Wkl6WE45TVIvcnR6RlpydHNMUmJiMzJJajFEVUUrYitwTWkyQ0wrRlFmRUdT?=
 =?utf-8?B?SFVSY0Jzek1WSitUQ1NZd3hUSjNSQXFoSTJaRExUZHBPczV2UDk1MVMycTRm?=
 =?utf-8?B?RkNRTEVMVmdtSHg1UUVVQ3p6V3NTVGJEMnE3S085RGNSYy9qNXVyWEVyNUFv?=
 =?utf-8?B?UW1lRU9MTmI4ZVNCKzNYUUQwc3lvWkhLLzNyL0c3TEExby9LSXdxUGU2UTdQ?=
 =?utf-8?B?WDdxdTJEYXFFUzNvLzF0Z0lpaFpUNWRhbmIwSk9qRnVOajBmMWRqQlJBcVBa?=
 =?utf-8?B?Y2VucENOejJYeDJLSHVNclFFazdtTGRLSUxzY1lmRzM2Ukpzc1FMdVUzUkRm?=
 =?utf-8?B?V2R6Qk1VMmYxQXZlOThvR1pCRG44R21ES29NTTdPNWo2U3BwMWVXcUtOaWRC?=
 =?utf-8?B?b3cxNEZhWVJoSnl5QURiUDV5ZXRtRTY1VmZ1Q2VnS2doWkFTcmg4KzhFVngr?=
 =?utf-8?B?Sks2YkxCVjd5alpMUHl1TjMrSnVpK2x2RW9hamI1SnVwWXlRcXpBejRydnhF?=
 =?utf-8?B?aitUdURSckhWT1J2RzJxTnk0VHBZSE0yNHBtM3VOTUhMYWJMM1BqYlRPTndG?=
 =?utf-8?B?MkhQZytUYzNXbzRUVFNqay9pclBISlFFZmtmYUQ5dy9NS3QvMW9ZUzVoMzQ3?=
 =?utf-8?B?MVBnRUJWUFN6azZmRXZVS1Y2Si9ackF2N3dUUFRCdzdLN2d1eWVVSCtFRlJ4?=
 =?utf-8?B?cU1YbFUxdHp6Um9lYm5Ra096ZTVUMkFPcWMzWjBVRVVQc21RNEZTTXRxelhl?=
 =?utf-8?B?TFJyaUsxNTFJaUdHQjV5VU9JcnU1Mk83RVcwZlNNNDQ4VENWbEdDMGQ5amxl?=
 =?utf-8?B?dEFxSFM4YzNteklMZVk1dElHSGxoZVJIRFZOSEhDelc3SEtRTmZJajhaUG4r?=
 =?utf-8?B?bVJlWW1QZjV4cHJPZDI2aUVSWjVLT24rcVg2TTkxV2FVMnF5VVRBSHdtYUpN?=
 =?utf-8?B?akxGMjZjOUx5d05FcW5NNmhFcDRlR0JxcXZRbitqc0ZOaVEwcHRRZDgrTk5t?=
 =?utf-8?B?a0VoVFBLVWdOYWhpblNIZHRBNUFKcVM2ZEcxZG9KalVNTENHaTI2THNUaENj?=
 =?utf-8?B?b2dlaFk0RUlnUWZHOWoxVUQ1Wk41WmJXTUxFamY1aDFjWGNNb1lhY0tGeTBR?=
 =?utf-8?B?eFV3Z3h2MFVtTEY4U21OZ2Z2WVBTOFhnTHBQZWk0UWNjRWs3dStFUStqQ280?=
 =?utf-8?B?cllkRVQyb21ERkU1TitYZXZqN0RTdXJhS1NCcW5kNnlLMkR6d0VXWkFEaEll?=
 =?utf-8?B?Q09oQlNMdVovaUlXSTEyR3ByNVk0cmN2LzRrZzhXUjkrN2dPQUxEVXdaRFAw?=
 =?utf-8?B?SUNZNUJrT1U2QlB3QndEaE0yV01KNy8vNmdBcmpXbTZ2ZTBKTU1DcEJHanBy?=
 =?utf-8?B?ckVpeEFjWlNQc25qL0VGWlZvR0RQVE5FdE0rS1F1VG92cWZlRzFTWXRGaFhB?=
 =?utf-8?B?RlcwRXEwQjVFSGtCcFdjV3ZNRGduLy9GbTV2cVRVZjZXcUFiSTlHNTY0UEdm?=
 =?utf-8?B?L1I2STZ4ajgyYStRYndEdm1ZS2hEWHl5bC9Jd0tXNXJDUGRMaVpYM3BTTUZF?=
 =?utf-8?B?T2graDlHc0tSc1kvTnFzNkg0aC9iMWdHbTJGQ2ZlME9EbkdBZm5EZTdJeFN5?=
 =?utf-8?Q?KrGu1oKJ5zTJoFeHbuwwy3M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B4237D800511249993F49BE6BF56BF8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d54be467-a133-4817-59b4-08db678c8ab1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 19:22:32.2631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9498N903gcHs5r6G5rIsPQS53wtaijiPmtotocOUDDloeeuxMUMk0/K2KdhnS/zw5kAuak6eUovLOjuZPVqzIRqkbb9JDD5YYbYXci0HWVm6Di1SnZX8ZRURAgxX4Sad
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5253
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
Cc: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTA2LTA1IGF0IDE5OjIzIC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gQSBmZXcgZml4ZXMvdXBkYXRlcyBhcmUgcmVxdWlyZWQgYXJvdW5kIHRoZSBH
U0MgbWVtb3J5IGFsbG9jYXRpb24gYW5kIGl0DQo+IGlzIGVhc2llciB0byBkbyB0aGVtIGFsbCBh
dCB0aGUgc2FtZSB0aW1lLiBUaGUgY2hhbmdlcyBhcmUgYXMgZm9sbG93czoNCj4gDQo+IDEgLSBT
d2l0Y2ggdGhlIG1lbW9yeSBhbGxvY2F0aW9uIHRvIHN0b2xlbiBtZW1vcnkuIFdlIG5lZWQgdG8g
YXZvaWQNCj4gYWNjZXNzZXMgZnJvbSBHU0MgRlcgdG8gbm9ybWFsIG1lbW9yeSBhZnRlciB0aGUg
c3VzcGVuZCBmdW5jdGlvbiBoYXMNCj4gY29tcGxldGVkIGFuZCB0byBkbyBzbyB3ZSBjYW4gZWl0
aGVyIHN3aXRjaCB0byB1c2luZyBzdG9sZW4gb3IgbWFrZSBzdXJlDQo+IHRoZSBHU0MgaXMgZ29u
ZSB0byBzbGVlcCBiZWZvcmUgdGhlIGVuZCBvZiB0aGUgc3VzcGVuZCBmdW5jdGlvbi4gR2l2ZW4N
Cj4gdGhhdCB0aGUgR1NDIHdhaXRzIGZvciBhIGJpdCBiZWZvcmUgZ29pbmcgaWRsZSBldmVuIGlm
IHRoZXJlIGFyZSBubw0KPiBwZW5kaW5nIG9wZXJhdGlvbnMsIGl0IGlzIGVhc2llciBhbmQgcXVp
Y2tlciB0byBqdXN0IHVzZSBzdG9sZW4gbWVtb3J5Lg0KPiANCj4gMiAtIFJlZHVjZSB0aGUgR1ND
IGFsbG9jYXRpb24gc2l6ZSB0byA0TUJzLCB3aGljaCBpcyB0aGUgUE9SIHJlcXVpcmVtZW50Lg0K
PiBUaGUgOE1CcyB3ZXJlIG5lZWRlZCBvbmx5IGZvciBlYXJseSBGVyBhbmQgSSBoYWQgbWlzdW5k
ZXJzdG9vZCB0aGF0IGFzDQo+IGJlaW5nIHRoZSBleHBlY3RlZCBQT1Igc2l6ZSB3aGVuIEkgc2Vu
dCB0aGUgb3JpZ2luYWwgcGF0Y2guDQo+IA0KPiAzIC0gUGVybWEtbWFwIHRoZSBHU0MgYWxsb2Nh
dGlvbi4gVGhpcyBpc24ndCByZXF1aXJlZCBpbW1lZGlhdGVseSwgYnV0IGl0DQo+IHdpbGwgYmUg
bmVlZGVkIGxhdGVyIHRvIGJlIGFibGUgdG8gcXVpY2tseSBleHRyYWN0IHRoZSBHU0MgbG9ncywg
d2hpY2ggYXJlDQo+IGluc2lkZSB0aGUgYWxsb2NhdGlvbi4gU2luY2UgdGhlIG1hcHBpbmcgY29k
ZSBuZWVkcyB0byBiZSByZXdyaXR0ZW4gZHVlIHRvDQo+IHN3aXRjaGluZyB0byBzdG9sZW4sIGl0
IG1ha2VzIHNlbnNlIHRvIGRvIHRoZSBzd2l0Y2ggaW1tZWRpYXRlbHkgdG8gYXZvaWQNCj4gaGF2
aW5nIHRvIGNoYW5nZSBpdCBhZ2FpbiBsYXRlci4NCj4gDQo+IE5vdGUgdGhhdCB0aGUgZXhwbGlj
aXQgc2V0dGluZyBvZiBDQUNIRV9OT05FIGZvciBXYV8yMjAxNjEyMjkzMyBoYXMgYmVlbg0KPiBk
cm9wcGVkIGJlY2F1c2UgdGhhdCdzIHRoZSBkZWZhdWx0IHNldHRpbmcgZm9yIHN0b2xlbiBtZW1v
cnkgb24gIUxMQw0KPiBwbGF0Zm9ybXMuDQo+IA0KPiB2Mjogb25seSBtZW1zZXQgdGhlIG1lbW9y
eSB3ZSdyZSBub3Qgb3ZlcndyaXRpbmcgKEFsYW4pDQo+IA0KTEdUTSBzbyAuLg0KUmV2aWV3ZWQt
Ynk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0K
