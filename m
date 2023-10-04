Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1EB7B85A2
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 18:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E7B10E392;
	Wed,  4 Oct 2023 16:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5016210E392;
 Wed,  4 Oct 2023 16:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696438001; x=1727974001;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fmFxaQ9C3W92/8d2BoZ/D2cLpfcW7jDoo7lwkp+aCs8=;
 b=fSHp7NAYNxSqRoj1FT/1DfN8KDUcV63x4lx+S4nSuSbD7HchcbOEwYjE
 PjGFuRFrtbFVYHZw61akUj7EYSj5FICGh9Z2UEJbJthRXVonrtpse+DDN
 qn4kp6xJ7zsN3duBuf4BtO+s9LevN79S67cmnLwqBK4L5XRW3C9WGZ0WA
 Ga0a9aAQ1Ajh1srwFecJGPLj/UzecgbzmQ1UECRvCAhX3vpyTy0Hq168V
 tE48UHlye5mo0BV0JNGDfbgPwqYdNjdkHCDAP9/KeIf+0pp7oArQQGnUk
 kzOdaYAf6lWANRjxPFsLmf8/GTEXx/8L0ywO0wUoNV89vMntcwjSncss1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="469499388"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="469499388"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 09:46:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="751372148"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="751372148"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 09:46:17 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 09:46:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 09:46:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 09:46:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SG1UX7Qv0rfuhlofjdJSjX6ofm9xQwNuQP9S1fpDSeNxKJE8LgKcHaSc58gXqBgXTWDgfNB1flv9jJ6IptAlS5c+cvbekEgAv3mrUtPtUqV9nE0R46fzyzuaEfBaBQcNkidw6Rkz916wrH4bMmGcVQXP2B/UGLrfyMBLlLUqZal+P4/daHMNrVSmAsmCQZvdERDZc5Hbjr52BYHu63oSMuQLwio5zMrxjY/yn9qjgnIE/29/6e+fZVzKJSBdvpt62MZQfLc5exLEqNqN9UjwtJWKuhVjN0eBXT93vkItZ+HMxACibJMF1Tllr37km4vvjWN5C0AhZx2r8iAc3BXwWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmFxaQ9C3W92/8d2BoZ/D2cLpfcW7jDoo7lwkp+aCs8=;
 b=HsYH65N07thAFab9YltPF2gs5j7QxgYjhhlZcS6wjUPE4/bz12ruAy+EkJmBQL+nkIyqPCtv8unOLrr8D0+v6bixrWuMz9YuyE4XeOPFk5ghi02frb1oMt1mBRou+ZwqzYlyAg68OkoHTe8VJKb1N87UO62kBSFvUCMAW/bAwKH2HnjetOgu2/yNYVVJdlZy3UX2/J5wQ3wUxNaXxPBX1K0JpZyNcCAKz2q4/B+fHtO54RUPbB+i+9tKrP1z8m/PhZh3bmGs/2to/iQxDn8D9/o6QTECjAFhj46hSPLQ6UtC4BgBVkm11WuH7fPRxetu7myOpiWTy0wIMRoFBYv/cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BN9PR11MB5420.namprd11.prod.outlook.com (2603:10b6:408:101::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.31; Wed, 4 Oct 2023 16:46:14 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::7bf2:1b4c:1512:79c1]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::7bf2:1b4c:1512:79c1%7]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 16:46:14 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/3] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Topic: [PATCH v4 2/3] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Index: AQHZ8Kxyn6HIFkHZIk6ruuU+sGXI4LA5OD+AgACq+AA=
Date: Wed, 4 Oct 2023 16:46:14 +0000
Message-ID: <cb406cb048045980e7f77d1328f0fca6d6f37ba5.camel@intel.com>
References: <20230926190518.105393-1-alan.previn.teres.alexis@intel.com>
 <20230926190518.105393-3-alan.previn.teres.alexis@intel.com>
 <CY5PR11MB6211092F8BB449C358D59D2A95CBA@CY5PR11MB6211.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB6211092F8BB449C358D59D2A95CBA@CY5PR11MB6211.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|BN9PR11MB5420:EE_
x-ms-office365-filtering-correlation-id: 6d48ed2a-555f-4f2a-f8cf-08dbc4f96c53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5OUgQL9FJ3hcBEdcdKjjT2BZA7df2d/z3JPxdokn8mOF7hb0C37lHZZXBnXo/miwV/u3D9cYNwedyf7Mw/uLxJBXlaQ5dcpJ6ApsIhaTdaZkfJlXUYSIGLUg9joBy8z6ks3IaMIopNMzEZoZQInkZmsDui3JoD4SjyE/eZkz9xSpHYEKzBHqCBdpFOG0URrdKsTgrkZwsv+Qu7SpE+yQeMHf+9EYC7jKLhWvNGMbj7No4euYGvpQXlP8ACo4z7QMxIy2H6yXgpy7bbqzEqFe/5SOfQzdtesdotjjeIhJDGyIA+aNQqs8tDlc0Z0i9iwBBT3aWt6wx+MTuvphWQGp3q1UZOt5/EGtpQsJ9tGfawxLV+wNvBaioIHLjewohKFSmds3j8VM4H3H999HfDXXf80Ih4DpvfITfGj2lHCAyKapM090yIE20AMwhwwNX8pUxM/xGB6rZeImhPaG35GqjFoATA3992dK5CFYr+E9vHfr12c+sUFjcVOjiDQjDuDiZ9HbjCpC+VsF9OuxTkXWlCP3ORZjsN/z3qXN81HtSALFcTnvghia1arir/gOvj2bRbvFtGCc2EP+J7FEL5Ubm9KUMGjcqGMB19C+wjNKkn0y5dELb15gOKbrPlStz3+q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(39860400002)(396003)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(71200400001)(76116006)(107886003)(6506007)(2616005)(6486002)(6512007)(66946007)(91956017)(478600001)(86362001)(122000001)(26005)(66446008)(110136005)(66476007)(64756008)(38070700005)(38100700002)(82960400001)(66556008)(83380400001)(2906002)(54906003)(4326008)(36756003)(5660300002)(8936002)(450100002)(41300700001)(8676002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2FzSFBNRnBVanpueGN4eDJVbU1rU1Qyak8vbFBEYXZObEpLWVlSTVRZeFJB?=
 =?utf-8?B?aTBaK0FXSzhQSVQ4OHBmU003d3RhY0J3cko1eElJZWZSQVVHTFcxdC9uRTRX?=
 =?utf-8?B?dGpidEFHRm5zSGh5c2VZN2VqRG50bmlWaEhuUE1oc0hQZ1Q1ZHkrZGFuck1i?=
 =?utf-8?B?UGlQeVZDUGYyVlJoOHFHUnVuellUNS9vM3V0aG4rRHJkaFZsc1pTak1oZWdu?=
 =?utf-8?B?VWhtdHBUS0lhTEhDdDgvQ3NWOWdmdDlKcW1FUk80VzJzOVlxZUg3R2xpRUcw?=
 =?utf-8?B?NWFlRVFvWWlveFZSM0dOc09kQk5NaG5SVHhkMXc3SHhmZ0traUg4K3duZEhV?=
 =?utf-8?B?SERueDRURWZvazJuNHE1SE9uNklwY1BFdGQ2MnJVWDZUWlVCKy95b2t5VXZs?=
 =?utf-8?B?T1luNENpZnNsNXQ2d21KTWh3QUNjZnA5eHNsVWJxRGRXNFZkWGNPZDFBemNJ?=
 =?utf-8?B?K214Y2JOYVQweXAxc2NHbkZtS1lMVk5jcXhvL3F6K2tWZjlsZElpenFVL0pl?=
 =?utf-8?B?cms5WjBPM24xMDV0TnBMcHhNb1QyNG1IWGpUNHh4aHNXSy9YdFlwMFd6Yldn?=
 =?utf-8?B?dGxmbEpzUWk1elB4MFRDVXZ1cnJaK0N6L01scEtQdjJqWVNTcWNzSDNMVDV2?=
 =?utf-8?B?OEUzZkVVcmlMKzByRVMraWZaNE5Ramo3UDh2YU5zRnd3dUIrZXhSRll5cW56?=
 =?utf-8?B?RjNVRWgrMSt6RlNWVG1OMHZkNDB1ZTBwQ3JaajBPS0FHQSsvMzVjMXRRb1pw?=
 =?utf-8?B?cGRNSzBTbkhDQ1hza3R0TEJQVUQ2VmN2RjdkYXhMNUhHU1BhYXlFUVR3b3dz?=
 =?utf-8?B?ajNQYTFLMWhpNUN2SmxYQWRybFdiUlhOalJQT2psUTRTVGtDazl4YUhYY1pV?=
 =?utf-8?B?VnQvLzc0Z2ZmTDRONlpzT0c3VHAvNUg2eEVWY2xWOHIzMHl3RmZUbnk0TDBG?=
 =?utf-8?B?ZHV1OUxmb25adldoR3hFS2hnM3Q3TFdLYXkxZzNZanN5a25BaG1vQm5uWGJq?=
 =?utf-8?B?bmxnL3N0THJnenJscW51RStoVXg2Z2J2RGdmRzBTOE1VMys4S051TlFQUjdO?=
 =?utf-8?B?QlY5Vy9XcldEUXJRQVc0bnhRTXYvaFVoUEJ5ZFcxdmVTd2ZlVFUwc1lmYUFJ?=
 =?utf-8?B?em1RQVF5Qkk3S2R6bmlRcHhjaE11L2Y3VGIvUTcwdU1mZkgxbWtCRG5wdE9M?=
 =?utf-8?B?cGcrc2FhWTYyb1pmY2VUaHB3bkZ2emRnNDNScTJZaEhtTlhiRnRWNGdkN0JG?=
 =?utf-8?B?bTduRkFPdWRuUE9Pdk8vWXNFb2Q0bnkwMms5RzVINUVzM0hVdHppa2RyL2NP?=
 =?utf-8?B?R1FEUGFZaS92S1A0dmZOQ0syZmtQY3ptUytHTWh2aSs1SHRpbkFOV3FlOEFB?=
 =?utf-8?B?L08wbE5SUVBVeFU3VEM1RVRJOFRzZkxVZ3JMUFdBeVNjQkFXdHRqdmhiVGcx?=
 =?utf-8?B?Z2IxakNhTUFOWHBRNjFHRlZPWW8yWmdVRUxxVldGbGdXNmJOTUZ0citNNVFJ?=
 =?utf-8?B?WHFMKysxczlKZFNhSlFwamRmY0ZwTERwM3U5Mm9kdzZUSVBwY3N2dFRBaGtM?=
 =?utf-8?B?Z2tYSXFUdnJCNk53OUpQYWxyeXZJcXYwRHRHSHA4ZEFnRXpDS2trbXdSWWtp?=
 =?utf-8?B?UnpWYjlOWGM5S3lUSXoyb3Q4bnVqdUNGenB6OEVXb2pwV2M3YXh5OHdCeFJQ?=
 =?utf-8?B?ODY0ckV0L1FZQXZQL01ocW10NjV5N3owclgxRWtRMGpVVmFzUmxCUy9ONUpB?=
 =?utf-8?B?dDRXekVTVDhzTE5FTVZybE9IWFdtOEdmVDdZVnpLemt1Rjk2VE0wQU9wMXk1?=
 =?utf-8?B?b0JITEw4d3JhWGIrS2xzZGFTMTVtSU5SSE1LZmEzMWYzZEJ1WEp1SDBpYVVn?=
 =?utf-8?B?L0dkbm1NYkZia3pVZzlYZUJyeU9paGtIaUhQTzhiVDB0MUl1ZS91WXB0b3c5?=
 =?utf-8?B?ejBHMHhDb0k3c28rbndCWnlPQmI1UEo1NjhUaE9oU0o1aGxvSW93YlRLWWx1?=
 =?utf-8?B?MDV6Y05Ua1lJR1k4UlhYenNxUDNPSGpZV09hZEtocGZoMXpMam02Yk9rbytx?=
 =?utf-8?B?UmZKbXBlbSs2eENMdzl3SWlZYXlLWkg2a2NhTlBjSDZjbVNvN3I1UGJTRThu?=
 =?utf-8?B?RlNnanNiU0plT20vellrUE9DQUtsb2I3dUlkK3VyTFNDai9qOE84UjZVdXBj?=
 =?utf-8?Q?IQZHu08UKN2gqDx/YdL19tY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <616D77B2FB3F6B488ACBC4E8FE8A13A0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d48ed2a-555f-4f2a-f8cf-08dbc4f96c53
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 16:46:14.6002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uGp6Z2m/5Vmh2S9e+o81znUY41PNr4c0EJVrHkbV9c1+Jo12ukDkTZxlJbZBqwOVETLxl2W9tSF3vR1frxyiGAp5nYyehfMBAdbqwhQGTShDqAzpQ0KAmTtW19o0PMQk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5420
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Jana,
 Mousumi" <mousumi.jana@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTEwLTA0IGF0IDA2OjM0ICswMDAwLCBHdXB0YSwgQW5zaHVtYW4gd3JvdGU6
DQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogVGVyZXMgQWxl
eGlzLCBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbQ0KDQph
bGFuOnNuaXANCj4gPiBAQCAtMjg5LDYgKzI4OSwxMyBAQCBpbnQgaW50ZWxfZ3RfcmVzdW1lKHN0
cnVjdCBpbnRlbF9ndCAqZ3QpDQo+ID4gDQo+ID4gIHN0YXRpYyB2b2lkIHdhaXRfZm9yX3N1c3Bl
bmQoc3RydWN0IGludGVsX2d0ICpndCkgIHsNCj4gPiArCS8qDQo+ID4gKwkgKiBPbiByYXJlIG9j
Y2FzaW9ucywgd2UndmUgb2JzZXJ2ZWQgdGhlIGZlbmNlIGNvbXBsZXRpb24gdHJpZ2dlcg0KPiA+
ICsJICogZnJlZV9lbmdpbmVzIGFzeW5jaHJvbm91c2x5IHZpYSByY3VfY2FsbC4gRW5zdXJlIHRo
b3NlIGFyZSBkb25lLg0KPiA+ICsJICogVGhpcyBwYXRoIGlzIG9ubHkgY2FsbGVkIG9uIHN1c3Bl
bmQsIHNvIGl0J3MgYW4gYWNjZXB0YWJsZSBjb3N0Lg0KPiA+ICsJICovDQo+ID4gKwlyY3VfYmFy
cmllcigpOw0KPiBMZXQncyBhZGQgdGhlIGJhcnJpZXIgYWZ0ZXIgdGhlIGVuZCBvZiBwcmVwYXJl
IHN1c3BlbmQgYW5kIGF0IHN0YXJ0IG9mIGxhdGUgc3VzcGVuZC4NCj4gVG8gbWFrZSBzdXJlIHdl
IGRvbid0IGhhdmUgYW55IGFzeW5jIGRlc3Ryb3kgZnJvbSBhbnkgdXNlciByZXF1ZXN0IG9yIGFu
eSBpbnRlcm5hbCAga21kIHJlcXVlc3QgZHVyaW5nIGk5MTUgc3VzcGVuZD8NCj4gQnIsDQo+IEFu
c2h1bWFuIEd1cHRhLg0KYWxhbjogc29tZSB0aG91Z2h0czogYWN0dWFsbGx5IHdhaXRfZm9zX3N1
c3BlbmQgaXMgYmVpbmcgY2FsbGVkIGF0IGZyb20gYm90aCBpbnRlbF9ndF9zdXNwZW5kX3ByZXBh
cmUNCmFuZCBpbnRlbF9ndF9zdXNwZW5kX2xhdGUuIHNvIHB1dHRpbmcgdGhlIGJhcnJpZXIgaW4g
YWJvdmUgbG9jYXRpb24gd291bGQgZ2V0IGhpdCBmb3IgYm90aCBzdGVwcy4NCkhvd2V2ZXIsIGJl
Y2F1c2Ugd2FpdF9mb3Jfc3VzcGVuZCBtYXkgb3B0aW9uYWxseSB3ZWRnZSB0aGUgc3lzdGVtIGlm
IG91dHN0YW5kaW5nIHJlcXVlc3RzIHdlcmUgc3R1Y2sNCmZvciBtb3JlIHRoYW4gSTkxNV9HVF9T
VVNQRU5EX0lETEVfVElNRU9VVCwgd291bGRudCBpdCBiZSBiZXR0ZXIgdG8gYWRkIHRoZSBiYXJy
aWVyIGJlZm9yZSB0aGF0DQpjaGVjayAoaS5lLiBpbiBhYm92ZSBsb2NhdGlvbikgYXMgb3Bwb3Nl
ZCB0byBhZnRlciB0aGUgcmV0dXJuIGZyb20gd2FpdF9mb3Jfc3VzcGVuZCBhdCB0aGUgZW5kDQpv
ZiBzdXNwZW5kX3ByZXBhcmUgLSB3aGljaCB3b3VsZCBkZWZlYXQgdGhlIHB1cnBvc2Ugb2YgZXZl
biBjaGVja2luZyB0aGF0IGludGVsX2d0X3dhaXRfZm9yX2lkbGUNCmZyb20gd2l0aGluIHdhaXRf
Zm9yX3N1c3BlbmQ/ICh3aGljaCBpcyBleGlzdGluZyBjb2RlKS4gUGVyaGFwcyB3ZSBuZWVkIHRv
IGdldCBvbmUgbGFzdCB0ZXN0IG9uIHRoaXM/DQoNCg==
