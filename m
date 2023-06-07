Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C4C72705C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 23:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D37010E551;
	Wed,  7 Jun 2023 21:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A2910E54E;
 Wed,  7 Jun 2023 21:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686172387; x=1717708387;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=23q/eaMHgwi2U3gWkzw25JO7kXf6QEoyFCyIsfV1oII=;
 b=htjpAwbXFCrtrQYjYp4mRvC8fzzlQ5M0R/xv6h9BDCrJq/0eM1E7KHZi
 NwSUqloHNRWoTTjLcP8KWGkNJbAr6hC7dnDU8O7gb7bWTjG3MyCVxUHsM
 KwGodV38reJeKQmTnGXZiGkRVbHzjAQ6pnOXswV7zwqqDv+B9QMPHS9iE
 uFLYTzQdcz+xoRXxBU4i6F5uaGA/rIOr6yJUUUwOP97WEoCFbMamZSlQA
 0nCjMso1aggs5J58P6Y11miWlUwCP4hv8d1F+2HAEHiwhBgiMUvZ3qjOJ
 A1R7mIW008CYkbb5XdaTiOe+zHTEGenjmPaHPzpUhetMSySu3EEswmYgL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="354600016"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="354600016"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 14:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="712834585"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="712834585"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 07 Jun 2023 14:13:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 14:13:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 14:13:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 14:13:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFlNpXcDlfxpqB3fch81duV/kGHSRJjyo54UkfsWeGotVx7eH4O9tKQ54gKmAwvKcjljHHfys7Xmq+jGKYXMqS17N1OdRgZQxXVtMiIHHp4m7QkY4H6uUeXQKyBlmohh4c3klF3+FhzlbMIDebqfBpeDXP04QVJnE1AIrXk/2m3Z5SjFWGym739qprZEAPskI6BybYfwfzd008l+osGCIL3QcHgLEp6wUfDej8OUh2fkIsIW8kilhhTLV0rQtSqWJRrRKGoaBzgXYGw1/lIS1etNA30SDQ1kfISgahSrOs0CWYBq9rP353wJnq3PjdFW2WX7tU2BJjwR3b5L6ZjDVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23q/eaMHgwi2U3gWkzw25JO7kXf6QEoyFCyIsfV1oII=;
 b=HEGmrxwRWmdxNyV8dyii6dBm+DaXQk35o/4TxlENKg4caoc9z4hT8+YQr5mN84uWP2V5xuK08bD1ZY2CgnwwHdGMcQkjSP9x0TPTvCwFuN+WvYAOTVMTh5hiCOUCpoEjlU2tx0S3RbOXFP9ZN5+R2nMCe8ko4vEHPnB+lmAbDkG0N45fBG7dhw875YkYOC/X+Dn6ck06nNF6ZDvGRnOD88A+mr1sBsemiqzhn0FCpTeATcDtQLtt629MGA3uhiSjiTsiLZ6zyBNAptsjP32JR51Fj6xgtj0gq73hSc2+/EvxSvzEQBPL3CAdvc4TSJdCdWcCyQc1Xtg0DEaGkmwQeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5772.namprd11.prod.outlook.com (2603:10b6:a03:422::8)
 by PH8PR11MB7118.namprd11.prod.outlook.com (2603:10b6:510:216::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Wed, 7 Jun
 2023 21:13:02 +0000
Received: from SJ0PR11MB5772.namprd11.prod.outlook.com
 ([fe80::4215:1bb5:eb92:5e9b]) by SJ0PR11MB5772.namprd11.prod.outlook.com
 ([fe80::4215:1bb5:eb92:5e9b%4]) with mapi id 15.20.6455.037; Wed, 7 Jun 2023
 21:13:02 +0000
From: "Venkatesh Reddy, Sushma" <sushma.venkatesh.reddy@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v3] drm/i915: Fix a VMA UAF for multi-gt platform
Thread-Topic: [PATCH v3] drm/i915: Fix a VMA UAF for multi-gt platform
Thread-Index: AQHZmReTNs7vUI5Ub06yQCRAhu1dKK9/1qWQ
Date: Wed, 7 Jun 2023 21:13:02 +0000
Message-ID: <SJ0PR11MB57727ED279160072376D116CCD53A@SJ0PR11MB5772.namprd11.prod.outlook.com>
References: <20230607081032.19275-1-nirmoy.das@intel.com>
In-Reply-To: <20230607081032.19275-1-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5772:EE_|PH8PR11MB7118:EE_
x-ms-office365-filtering-correlation-id: 6a68500e-0a1b-4403-760d-08db679bfa6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VwCVC3gsij9pqBrXdM5/gagbtVtE5RwN16bM9Rp5aDrPIyvTF3P6BWbiU1iVgkqnZBptrBn7V1EC180luFT/2Cgj6LZltw7hmSaG9HnyVrXNBeaLFfmydO+2LRgAo7ct+r5TnMZNX+2ifNpZHO9UU1CAvF0VpopeCqRNd9X6SwW/A/a+eqZqJLeSh4XTfpkDYeieHjlwgnyCibOZn8GzX1QrSJJsNj3ZdBpwwNJ1VkXhr01pXQPfPuZ/X4o1uy5w8k4+PlarK5rbVT7HY2L7lrkKL2pxElUD2NMVbOQqvFEGu+n6xoD97pJgh16osFAIJ4lGOSDiLPqxprUQcOjKS9JH2BBbqVZr0fXC2lV1Z11UW24fwXZH4F6FMaVUcUlb+vaJM+iWS+dx6Sp1GEh5NMKHqrLo1tc8Kwzv+WQzONynoc5Gd7Vf4WfEdOiggFQ74pF2mqjr4ORNsKTu2IiBiKBgdTUNZXwKGKabnTtSdUViLmwXwbLWvqQBKZJ0Sv6QYoKEQczfOK+YVLkGRwrHmKXL0FAGfQsJad+N05Gni2/rPARU3ftPEhOLhBNVw6pWUOCKs6aiupPmd80TONenL7atm3cgDQMbT9AS1BIMeCSkuGwsONo8U8yZ4QVdj7Es
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5772.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(136003)(396003)(366004)(346002)(451199021)(66446008)(82960400001)(66556008)(64756008)(66476007)(4326008)(66946007)(122000001)(76116006)(38100700002)(54906003)(55016003)(110136005)(478600001)(38070700005)(86362001)(33656002)(2906002)(71200400001)(52536014)(186003)(5660300002)(7696005)(316002)(41300700001)(66574015)(83380400001)(8936002)(6506007)(8676002)(9686003)(26005)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2hOc3AzNzErd2kxeXpNeTFWSnI5SzRncG1DMmlIRDdvQlNrRGFGNG1wSXFJ?=
 =?utf-8?B?YjhEUkoraGE4NWsyZHdDQWF3TGZBc04veXhrdWpPNUk2QmRLK04wUjhPMGk2?=
 =?utf-8?B?ZXpOVFU5bUdNOHRvdEhZT3JFMXZ0dEc1cEp6LzVOV0lvaE0vVm8wbW52RlhZ?=
 =?utf-8?B?NHMydE1vRUhVVVlyQkhHRER4b3JBMjR4ZStHaWprSHk0bElCdkNzNmU1Qlg2?=
 =?utf-8?B?bE00Y3V4K2w2ZjdkRklsUzNrVEYxOCtMVjFVaE9PUUtaSWNHTGVPZzVxazV2?=
 =?utf-8?B?UkNoZnc5cUNEVXg4c1loUWFSSDYwaENGd2dOYXAxZG40KzJVRzhybjJJMjF1?=
 =?utf-8?B?cEtDUVlVeUlFMlVvcEl6bGNoOEhmY2xPYTNqYWpHQ1EyV1lSL3RpQjlQUkQy?=
 =?utf-8?B?NktIWlBTZUN1cXFjb1hENkNXcHBzZW5mOEJ0NXI4cFh0R0w1VUljTDAvekQ4?=
 =?utf-8?B?U1J0dUxucWxMR09GME5tc1F4TnQ1UVd2RTVRUExmTkpDTHdURzZoSTBwUjV2?=
 =?utf-8?B?QzFsREYwcmxSRXpmZjdvY3kwOE5TZk1xMmZ1RjY4Qzc3R3R2STBaTmhiRWlO?=
 =?utf-8?B?MmhPRFZZTE1YTlNUUGVLdVcxalRVTHVFOUtyNTI5cWxMdER0R0xsbE1TMUxU?=
 =?utf-8?B?ZWQyMDBFTVpRK3QrUXdZek05R0g3c2hWejNNTTd6akFrRVRsc3VXMXFMSVND?=
 =?utf-8?B?NnJ0SHBWS0JBcmdZUWkybHh3Q1JITlJTODJXTlgvOEhKY2tsNzk3K3g0a2Y0?=
 =?utf-8?B?REwxZTM4TFBqUlkrQ2hua0JUMmVjUmFpcm9xREM5b3BsUUVWbW16cG1kWVAy?=
 =?utf-8?B?eEwzWjlpMGZBVXV0c1JHV0REYklOTWEyK3ZzRnJpV2lRdUx4UnBpRXVoUGV0?=
 =?utf-8?B?STJXQXN2SGd5alI1MEEyVVFGNWQ0aEx5dXNGcThaelE1VmRsMVBzUXdEL3Nm?=
 =?utf-8?B?czB0dmRuWEVLRnNUWGVOTzhReDRFeklUT1k0TkRPZEpST0RFVUFyMHFWRlZ3?=
 =?utf-8?B?SXlBQ2xDVmNyQ1htMEhmWXJsT2VVTFdDcXN0ajR3dmtSOGljeUhTWXFDL2N5?=
 =?utf-8?B?YjFsZGMzY2I3eGQ0RlVwYUdVcFQ4WXNlMDllSkd4a3dzTzI1TGw0UmNwUWp1?=
 =?utf-8?B?aEpRczY5WnBPMnNIWXpIejhybGwrWXRMY3FIK0VnbjY3VEU3emREdWJhVWM0?=
 =?utf-8?B?VmVRbmgyQVV0U212MXFUUTM4dTlIaThIUG4rK0ZyK2RiOGtmaElVbFdQOERw?=
 =?utf-8?B?eEg0YTFkK0k3alhzdC83ekdXNDFYZWVKNWdsclQ5dUV2VjVINCsyQ3dwVk9j?=
 =?utf-8?B?eEZkQ09mbzRLYXhlSXlEa3hQTTRiZitFVU9GN29Db3MzYjExdi9NWjBveGVR?=
 =?utf-8?B?RTR4TlIxZFUvbmc3UmpQU3hDZlJkL0xTbTZvUmhUS3hsQVVHamdCaTBBOHhj?=
 =?utf-8?B?QktWaFFkaFVDd1JFRU40aENCSkRaWkhIdXlaN21ONmQ1VjAyL2RFNlUrV3Zj?=
 =?utf-8?B?NnJTR2lwck1qTlJIUFNaQUVzRkdiZHI1L0RCMWd2Y0taa1I0bXgrUFRaL3Ba?=
 =?utf-8?B?SFM1RlZqUGJpMk5nS2MwdHBFdm1pM1k4MDJobWd0a0E5UXR5ZHdJNk1qc1Jj?=
 =?utf-8?B?MnRiTWNDV1dmSTZZTjNVRmY5WnRSOER0Nm9rWnBZLzJUTzZXWTltVkN3YTlM?=
 =?utf-8?B?c011SkFPK2Y5WjBSZmorZEUxRlcxYWtCdUR2RE9VQWszUUs0bk94anA4RDhN?=
 =?utf-8?B?REhHTlRzV2MzbW9lRWxNc2U1RnYwYzFCSFpOdmxhbmVweVMvdDZMUE9rVmQ2?=
 =?utf-8?B?MnRBcEJBL0ZhRWxMSDhCRXF2eWlvUzZCdW03VmhoUEN5UGRtWitBRThkYSt4?=
 =?utf-8?B?SUtWV0ZXTkJwNVdQLyt5TG5nTVZvaDZxZWJuSmlNcTJJdG9acmRheTNRSFF2?=
 =?utf-8?B?NzFxdW9TdzU1c09jY0JBNDM0emM5L3FML0JhNHVRL0xXakd3cm54dDF1TEIz?=
 =?utf-8?B?ckhGSWNKOWZzQlVjMXN0cEpiU3dMWTNhUmtqZDJVckpKbW9PT1FzelBRZ3Fs?=
 =?utf-8?B?UlBBeUtsQkZUU2lJZDdMaTRCSW02RmU1N1VJNzRneFlndXFzU2xacCt6T0Rz?=
 =?utf-8?B?V1FwUHM1YnR2cmpGcFhIYXNVdFM5eUFlQkpQcEN6aWZWaTVudmkzaGkyYXJ3?=
 =?utf-8?B?TFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5772.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a68500e-0a1b-4403-760d-08db679bfa6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 21:13:02.2231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WHyxMjM7iEoUmO2FUUuZIfxFfWG7TUiQdLYdZm+qwppyQV12MMvXNpPbVcNZalQ40u9QvlrdvDfwjPiRzi4jkvjom/3IS+nAiSsxaRy03FfcRA4eEvbga0p0os6Q2fvT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7118
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Hajda,
 Andrzej" <andrzej.hajda@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Wilson, Chris P" <chris.p.wilson@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmsgeW91LCBOaXJtb3kuIFdlIGhhdmUgdmVyaWZpZWQgaXQgb24gQ2hyb21lLg0KVGVzdGVk
LWJ5OiBTdXNobWEgVmVua2F0ZXNoIFJlZGR5IDxzdXNobWEudmVua2F0ZXNoLnJlZGR5QGludGVs
LmNvbT4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IERhcywgTmlybW95IDxu
aXJtb3kuZGFzQGludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIEp1bmUgNywgMjAyMyAxOjEx
IEFNDQpUbzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IERhcywgTmlybW95IDxuaXJtb3kuZGFzQGludGVsLmNvbT47
IEpvb25hcyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT47IFZpdmks
IFJvZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+OyBUdnJ0a28gVXJzdWxpbiA8dHZydGtv
LnVyc3VsaW5AbGludXguaW50ZWwuY29tPjsgVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxs
c3Ryb21AbGludXguaW50ZWwuY29tPjsgV2lsc29uLCBDaHJpcyBQIDxjaHJpcy5wLndpbHNvbkBp
bnRlbC5jb20+OyBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQGxpbnV4LmludGVsLmNvbT47IEhhamRh
LCBBbmRyemVqIDxhbmRyemVqLmhhamRhQGludGVsLmNvbT47IFZlbmthdGVzaCBSZWRkeSwgU3Vz
aG1hIDxzdXNobWEudmVua2F0ZXNoLnJlZGR5QGludGVsLmNvbT4NClN1YmplY3Q6IFtQQVRDSCB2
M10gZHJtL2k5MTU6IEZpeCBhIFZNQSBVQUYgZm9yIG11bHRpLWd0IHBsYXRmb3JtDQoNCkVuc3Vy
ZSBjb3JyZWN0IGhhbmRsaW5nIG9mIGNsb3NlZCBWTUFzIG9uIG11bHRpLWd0IHBsYXRmb3JtcyB0
byBwcmV2ZW50IFVzZS1BZnRlci1GcmVlLiBDdXJyZW50bHksIHdoZW4gR1QwIGdvZXMgaWRsZSwg
Y2xvc2VkIFZNQXMgdGhhdCBhcmUgZXhjbHVzaXZlbHkgYWRkZWQgdG8gR1QwJ3MgY2xvc2VkX3Zt
YSBsaW5rIChndC0+Y2xvc2VkX3ZtYSkgYW5kIHN1YnNlcXVlbnRseSBmcmVlZCBieSBpOTE1X3Zt
YV9wYXJrZWQoKSwgd2hpY2ggYXNzdW1lcyB0aGUgZW50aXJlIEdQVSBpcyBpZGxlLiBIb3dldmVy
LCBvbiBwbGF0Zm9ybXMgd2l0aCBtdWx0aXBsZSBHVHMsIHN1Y2ggYXMgTVRMLCBHVDEgbWF5IHJl
bWFpbiBhY3RpdmUgd2hpbGUgR1QwIGlzIGlkbGUuIFRoaXMgY2F1c2VzIEdUMCB0byBtaXN0YWtl
bmx5IGNvbnNpZGVyIHRoZSBjbG9zZWQgVk1BcyBpbiBpdHMgY2xvc2VkX3ZtYSBsaXN0IGFzIHVu
bmVjZXNzYXJ5LCBwb3RlbnRpYWxseSBsZWFkaW5nIHRvIFVzZS1BZnRlci1GcmVlIGlzc3VlcyBp
ZiBhIGpvYiBmb3IgR1QxIGF0dGVtcHRzIHRvIGFjY2VzcyBhIGZyZWVkIFZNQS4NCg0KQWx0aG91
Z2ggd2UgZG8gdGFrZSBhIHdha2VyZWYgZm9yIEdUMCBidXQgaXQgaGFwcGVucyBsYXRlciwgYWZ0
ZXIgZXZhbHVhdGluZyBWTUFzLiBUbyBtaXRpZ2F0ZSB0aGlzLCBpdCBpcyBuZWNlc3NhcnkgdG8g
aG9sZCBhIEdUMCB3YWtlcmVmIGVhcmx5Lg0KDQp2MjogVXNlIGd0IGlkIHRvIGRldGVjdCBtdWx0
aS10aWxlKEFuZGkpDQogICAgRml4IHRoZSBpbmNvcnJlY3QgZXJyb3IgcGF0aC4NCnYzOiBBZGQg
bW9yZSBjb21tZW50KEFuZGkpDQogICAgVXNlIHRoZSBuZXcgZ3QgdmFyIHdoZW4gcG9zc2libGUo
QW5kcnplaikNCg0KQ2M6IEpvb25hcyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4Lmlu
dGVsLmNvbT4NCkNjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQpDYzog
VHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNvbT4NCkNjOiBUaG9t
YXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQpDYzogQ2hy
aXMgV2lsc29uIDxjaHJpcy5wLndpbHNvbkBpbnRlbC5jb20+DQpDYzogQW5kaSBTaHl0aSA8YW5k
aS5zaHl0aUBsaW51eC5pbnRlbC5jb20+DQpDYzogQW5kcnplaiBIYWpkYSA8YW5kcnplai5oYWpk
YUBpbnRlbC5jb20+DQpDYzogU3VzaG1hIFZlbmthdGVzaCBSZWRkeSA8c3VzaG1hLnZlbmthdGVz
aC5yZWRkeUBpbnRlbC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFz
QGludGVsLmNvbT4NClRlc3RlZC1ieTogQW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBsaW51eC5pbnRl
bC5jb20+DQpSZXZpZXdlZC1ieTogQW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBsaW51eC5pbnRlbC5j
b20+DQpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+
DQotLS0NCiAuLi4vZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLmMgICAgfCAy
MSArKysrKysrKysrKysrKysrKy0tDQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0v
aTkxNV9nZW1fZXhlY2J1ZmZlci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2Vt
X2V4ZWNidWZmZXIuYw0KaW5kZXggNWZiNDU5ZWE0Mjk0Li4xZGU5ZGUxZTQ3ODIgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5jDQorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5jDQpAQCAtMjY5
Miw2ICsyNjkyLDcgQEAgc3RhdGljIGludA0KIGViX3NlbGVjdF9lbmdpbmUoc3RydWN0IGk5MTVf
ZXhlY2J1ZmZlciAqZWIpICB7DQogCXN0cnVjdCBpbnRlbF9jb250ZXh0ICpjZSwgKmNoaWxkOw0K
KwlzdHJ1Y3QgaW50ZWxfZ3QgKmd0Ow0KIAl1bnNpZ25lZCBpbnQgaWR4Ow0KIAlpbnQgZXJyOw0K
IA0KQEAgLTI3MTUsMTAgKzI3MTYsMTcgQEAgZWJfc2VsZWN0X2VuZ2luZShzdHJ1Y3QgaTkxNV9l
eGVjYnVmZmVyICplYikNCiAJCX0NCiAJfQ0KIAllYi0+bnVtX2JhdGNoZXMgPSBjZS0+cGFyYWxs
ZWwubnVtYmVyX2NoaWxkcmVuICsgMTsNCisJZ3QgPSBjZS0+ZW5naW5lLT5ndDsNCiANCiAJZm9y
X2VhY2hfY2hpbGQoY2UsIGNoaWxkKQ0KIAkJaW50ZWxfY29udGV4dF9nZXQoY2hpbGQpOw0KLQlp
bnRlbF9ndF9wbV9nZXQoY2UtPmVuZ2luZS0+Z3QpOw0KKwlpbnRlbF9ndF9wbV9nZXQoZ3QpOw0K
KwkvKg0KKwkgKiBLZWVwIEdUMCBhY3RpdmUgb24gTVRMIHNvIHRoYXQgaTkxNV92bWFfcGFya2Vk
KCkgZG9lc24ndA0KKwkgKiBmcmVlIFZNQXMgd2hpbGUgZXhlY2J1ZiBpb2N0bCBpcyB2YWxpZGF0
aW5nIFZNQXMuDQorCSAqLw0KKwlpZiAoZ3QtPmluZm8uaWQpDQorCQlpbnRlbF9ndF9wbV9nZXQo
dG9fZ3QoZ3QtPmk5MTUpKTsNCiANCiAJaWYgKCF0ZXN0X2JpdChDT05URVhUX0FMTE9DX0JJVCwg
JmNlLT5mbGFncykpIHsNCiAJCWVyciA9IGludGVsX2NvbnRleHRfYWxsb2Nfc3RhdGUoY2UpOw0K
QEAgLTI3NTcsNyArMjc2NSwxMCBAQCBlYl9zZWxlY3RfZW5naW5lKHN0cnVjdCBpOTE1X2V4ZWNi
dWZmZXIgKmViKQ0KIAlyZXR1cm4gZXJyOw0KIA0KIGVycjoNCi0JaW50ZWxfZ3RfcG1fcHV0KGNl
LT5lbmdpbmUtPmd0KTsNCisJaWYgKGd0LT5pbmZvLmlkKQ0KKwkJaW50ZWxfZ3RfcG1fcHV0KHRv
X2d0KGd0LT5pOTE1KSk7DQorDQorCWludGVsX2d0X3BtX3B1dChndCk7DQogCWZvcl9lYWNoX2No
aWxkKGNlLCBjaGlsZCkNCiAJCWludGVsX2NvbnRleHRfcHV0KGNoaWxkKTsNCiAJaW50ZWxfY29u
dGV4dF9wdXQoY2UpOw0KQEAgLTI3NzAsNiArMjc4MSwxMiBAQCBlYl9wdXRfZW5naW5lKHN0cnVj
dCBpOTE1X2V4ZWNidWZmZXIgKmViKQ0KIAlzdHJ1Y3QgaW50ZWxfY29udGV4dCAqY2hpbGQ7DQog
DQogCWk5MTVfdm1fcHV0KGViLT5jb250ZXh0LT52bSk7DQorCS8qDQorCSAqIFRoaXMgd29ya3Mg
aW4gY29uanVuY3Rpb24gd2l0aCBlYl9zZWxlY3RfZW5naW5lKCkgdG8gcHJldmVudA0KKwkgKiBp
OTE1X3ZtYV9wYXJrZWQoKSBmcm9tIGludGVyZmVyaW5nIHdoaWxlIGV4ZWNidWYgdmFsaWRhdGVz
IHZtYXMuDQorCSAqLw0KKwlpZiAoZWItPmd0LT5pbmZvLmlkKQ0KKwkJaW50ZWxfZ3RfcG1fcHV0
KHRvX2d0KGViLT5ndC0+aTkxNSkpOw0KIAlpbnRlbF9ndF9wbV9wdXQoZWItPmd0KTsNCiAJZm9y
X2VhY2hfY2hpbGQoZWItPmNvbnRleHQsIGNoaWxkKQ0KIAkJaW50ZWxfY29udGV4dF9wdXQoY2hp
bGQpOw0KLS0NCjIuMzkuMA0KDQo=
