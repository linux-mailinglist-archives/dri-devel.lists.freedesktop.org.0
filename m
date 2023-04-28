Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D6E6F114F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 07:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C34F10E2EF;
	Fri, 28 Apr 2023 05:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E82910E084;
 Fri, 28 Apr 2023 05:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682659553; x=1714195553;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IZyGn5rplFEJWvRd71gGmGOnT9Iix2U3/dy4YIbpEfY=;
 b=EcpfHU7ThhWnD0y71ev4IDTrQ8UO2lqLnhIy5NbSz3KdBIyQ29xqyUdy
 oj4d2oK1JFY3fEp+gunMwZdCDDEeIUBncrmAfq3ONldzY50064fy/GMGU
 XKtlydmFcQBs+CoH4AVkCn9Gy6A4PzLpmRUt8j/QbB5HiO28iE67To9Ht
 clYbYycfZYte9ELRaz7PI6LEfoaQX9DyqtwyDOhikSbfM4XHSynhW1g2L
 5+swBYZ44b/FMs058PnNBWAP+Qp59JowkyRafumjlZImBMu1pR+WQscpf
 OjQJhs3FlJkCvaCPkxKauXudp065aaYW3rY46jhcm+S85VD0H7a7ju0kA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="433941379"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="433941379"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 22:25:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="784046965"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="784046965"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Apr 2023 22:25:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 22:25:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 27 Apr 2023 22:25:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 27 Apr 2023 22:25:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EY1WbjWMpBCwSkwO8KtcVn2USYZylMW6hhwscLxp+o6pwbBidKMpW2v8ifcNDLVPCSTjMFbxWtpXTQMeXtTlBWfY1Xt60N1GZAwLH7IM4YOTmIIX/UHjVUP9yb59O29CTV22CzlvJA7JrtGsvcXIPdKzfgbsia3Bmjls4orizcEODUW++3P1XDNLWoBhz5ubInYOPRM5q4AZAnPk2oxPTzWBz9Gy4Xf8Zuj8Xg3HgkJAJbjH7zct3hhEoQOLv9mtpgIUtvB4ah4BbLay0+lxDbrOcsPMmsFNnBcwUXtsWC6BDWX197YhC/wz+S0ekq5UsTZzv4Rsb7dl+iRiZWj4Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZyGn5rplFEJWvRd71gGmGOnT9Iix2U3/dy4YIbpEfY=;
 b=mhmpCRbLsHcUXdLQr9EiwFE1Y/9/Za1KiNPExw4wENRrXiPODmt7wsOs/mODIQLtYilXuf4P6r+SycCHv0s1eAmhQNsviW8kOPYT0c2NSD3umMy903beuwrS1Bez6tfN2rGNhK2mgKrVf9bmuULT/Y5XcjOxY/0EGTKeEjL+lymU3AFlOD+6rV9gvNPCDQph5aEM4YdQRuPd2P4IPdPv5PCbd3N6xkX84Sp40HuDA9VHP9bNbwia1zhp36MmERSRxuXj6YsAQjLKH5a8ThHk3k3Y4mLbECsrD4BNUW3rFcMOIgDGGrjG94m4a6yxD3pQ4wu0M3E6BNXssdkksqIULw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 IA1PR11MB6220.namprd11.prod.outlook.com (2603:10b6:208:3e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24; Fri, 28 Apr
 2023 05:25:38 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::ddfa:657f:1ec6:5232]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::ddfa:657f:1ec6:5232%8]) with mapi id 15.20.6340.022; Fri, 28 Apr 2023
 05:25:37 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: "Ye, Tony" <tony.ye@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 0/8] drm/i915: HuC loading and authentication
 for MTL
Thread-Topic: [Intel-gfx] [PATCH 0/8] drm/i915: HuC loading and authentication
 for MTL
Thread-Index: AQHZeXoVd8wrskePHkKnasMw5XRWJK9AC0KAgAAlRAA=
Date: Fri, 28 Apr 2023 05:25:37 +0000
Message-ID: <DM8PR11MB5655599E9FE225DFFC35FC87E06B9@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20230428023416.4051910-1-daniele.ceraolospurio@intel.com>
 <9215760a-dbc4-16e1-6856-e9966992a231@intel.com>
In-Reply-To: <9215760a-dbc4-16e1-6856-e9966992a231@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|IA1PR11MB6220:EE_
x-ms-office365-filtering-correlation-id: b51f9e6f-6709-4a1b-49f2-08db47a8ffff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0AlRI01ibkTDGwwByG3VhdvC0r+AL2SCcrJSEwoF/aQpUCs2Q74zjQUCNFupSrTFd2AnWv1nOyIOSM0avVujLSFCwkE6rcBr6HI45mm8//s0sUW/iKogLbzoYC1AkL9rVqv+zMc/9c39AHbkC2Hh7zbTKl1J66I2/yK4Ls7zbs12GR2f4YZgjbp82OkAlqEi5A+51IwCyjbvQwN8PXp/k+8NgOZWJvc5uZfSOQ4aO62r0cggLMESV9+mq7zD8Z8lJ4Efjk0TP1KElx528JUQsGnbL11hCp4lzj4eAdlU9NZXk/qjzXmiTarTekI79PVAP0r5XEi6XcN8vGJFyDGfe2txKVKTxOk+Nk4A4TxwJItB//JPxmPBjDhAR2H6VX6rbShU+NZ3FzlyHIzcqM0eSrajEIE0ZcsL91Z4jYJf6ukSTF0l0f2tbVo8W33rAeahHxzj/7/OjBIQg40Gr8rdQJxewllCf/f/Ezv56xk6leiJLpN+0k5SEfq3co/tHixv1JZNWNV+2ndGoBKXndsuNIfBQ6Jfd69TMVf92peAGOj5Ln1OZN6qR59nIiB6KSUlVnNRqEYzYMsMwliBqMAJMhlOeWxEK/IdSJWnJZu4zBA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199021)(110136005)(54906003)(478600001)(52536014)(5660300002)(8676002)(8936002)(2906002)(38070700005)(86362001)(33656002)(38100700002)(64756008)(66446008)(66476007)(66556008)(66946007)(55016003)(76116006)(4326008)(316002)(82960400001)(450100002)(41300700001)(122000001)(107886003)(186003)(53546011)(9686003)(6506007)(26005)(83380400001)(966005)(71200400001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkdmbGZRVVI2RWk1U2NsbUdIZEhVUzFtRGF3emdoZVEwdUE2UDJNd3l2emFB?=
 =?utf-8?B?UURRdkhTYmZnWmhKSkpHekxySzZ2a3ExUXZVR28zb1M1ajFRT3B1b1JzaGwx?=
 =?utf-8?B?VG5MbXlXZVMxbUVqdTJiMFU2SkVCelhrSzBsOWloMVkrODMrem1tQzVoeWFS?=
 =?utf-8?B?MlNGM3B3RHgzdWJMMzV4Ylh0WnhuY2VQYnhCOHZyUThNRkNIclVQNjdJYjFD?=
 =?utf-8?B?Q0l1QUpYSzk0djk2Mkc4SjNHQ1BwYXFGdjQwb0t6MlM2Y0FUNkZFYkRRVXd6?=
 =?utf-8?B?eTR6d2V0bG5oQVdvbVE1UUNKNVpqMDcwQVkxdCt2OEhtYWQrbk81YTV6THZL?=
 =?utf-8?B?eENUQUtMc1N1VUxGVnlwSU5uVzBYaDZXWE9VYW1CRHhkeWNkNi9pYkZlMWcz?=
 =?utf-8?B?ejhocXpOTktSVldOTWpBODUwZVJaWnVyK2E0Q203ZHdjMnFUT0VEZXdXdFEw?=
 =?utf-8?B?VkxmZC9xekUzeDh3VkdOK0NsaWs3aFl4bW9VSHZLQVdyUGR6Z1ZydWdpZU0z?=
 =?utf-8?B?TllLZUZwZktrWGlBK01qaHhyczMyem9MeUd1M3ZKNTdKTjFzK2E5aFFFZHNM?=
 =?utf-8?B?NnFEbHY1b2hueFBKWXVyK1NjZkpZakRCbWFNYjNnL2g1WXRjeHNxSGw4andN?=
 =?utf-8?B?MmFUbWh3bVlYazhYWmw1MzdBVDB0UWhsYm1VdU5tOGFBdkpyVm0yS1J1c1Rj?=
 =?utf-8?B?YVpTNTZrbUdjb3MrVzFuNEdMZnFxcGIrNGpreEVGd0xnNU5HbU9nR2N1M25Q?=
 =?utf-8?B?V0s2YWlxblVmMkk4bmNKNVdRWGpyU2tPVnhYaEUrVFZyWENvYzI0bmQxeHBC?=
 =?utf-8?B?My93Z2ROS2VYWUc2UjdMampmaU9Mb084cVV0OWd2b3dIMnN1RlVVUmhienRH?=
 =?utf-8?B?UGpJZHRMQzd0Qnh2cno3L1JOZG10Q3ZRcGRDZUVZcnlsQ3hyc1NzdUpEN0sw?=
 =?utf-8?B?UjMwbWxrbElqN3JvS2N5S3l2L3JPbTI3SGRySUl2QWxWaE9RSWJub2UxSWRB?=
 =?utf-8?B?RTZtZFFScHhyTFU0Y003R0pnL28wVEVQQ0k4NlpseXZadml1QjlxVHpkMkFz?=
 =?utf-8?B?Y3VhV041Q1lSYmJqdXYxamdOdUNkM0xEdFpjNFBTaFN4NzdtOFkzdlNzc0sv?=
 =?utf-8?B?SUR6YXJZck9QdmRab3UxWkZ6Z2ZvMW9nZU12UVczSWNWVGlVc2JhNE5qTUQ3?=
 =?utf-8?B?MUZlM0h0NUdyNzlHK2locU1YbkxaaUtDZ3dQQkVNNzF4Vk1HRHBtOGl3clpj?=
 =?utf-8?B?Y3F5V0wwMHRnVWVZVTZKYzRCUzhSNVdqZEpiTE9qYUFDa0hQcVZ5dDh5eWR4?=
 =?utf-8?B?SkRyZEVtNGxJOENqd2tJWGJMYkt4cFRlTEVaTTR6RWlrcEJjMWQySUN2enZz?=
 =?utf-8?B?UFdPelVsN3NZaEVla0xiZXZKYkY1Um1KMzBYVVdoa1ltN01iL0ZNbzg5SkJB?=
 =?utf-8?B?YWhwZE50Zm9ENUl3RkZoL0FyL3F3c3BGaGR1UEtKZnUyTm5qblUxb01WMUZl?=
 =?utf-8?B?SC9SNWRQMU83TTlvTGIxRHJ1SzJrNGtQY2N6WXlIeW44SjNMTVptODRwSzVr?=
 =?utf-8?B?Q0JVWVVHaGxRSGV5dm5KYUJYTC9PYlNFVzhjZW1pUkx3aWVGalViWUJLdkM0?=
 =?utf-8?B?OFBBcWRwZWRIZ1hJeUJVQlhiY1IySSs2TXFEeHVCcHhNem8ySC9IN2dYaFFT?=
 =?utf-8?B?SzRFWU10SjZ3NHp6UFpDWGVXUkl3NS9nYktqdCtVRHZNUWNJV3Q2QzhXb3Nr?=
 =?utf-8?B?eDR0RlZwWTZsVngxbHV0VVUvcXhMcC8rN0VLVTZLcGNlRU5CU3FzT09vQXdm?=
 =?utf-8?B?RkI5elgrMHdic0lFeXljbVhIb1BkWWhEZ3pUd216dTlVQU51ZGQySHJVQ0RQ?=
 =?utf-8?B?VGxEdjdsUVNWMlNEMjI1MmJ1NEpvWWI0R0xIUjR3ZXpxMWJ5dldLZFR1MnB3?=
 =?utf-8?B?RkhnVERmTTMwUWxYSWpIZHloQk9pdVRCcWdHaXJCQ0g4V09XOXEvYnRJL0pZ?=
 =?utf-8?B?M3ZnQnFpK1h4QS9PdFRxb20xNFBMQndpNWlXcVQ5ZGljcnlZR1plTk9MNEpL?=
 =?utf-8?B?cDFLYUVkVjB4N251elRoOXE4YU55c0Q5STNmTUl2Ni9jUDRsaHo0WlRiZk4v?=
 =?utf-8?Q?YJJlbPPCRWHt/1caFJai1rhb9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b51f9e6f-6709-4a1b-49f2-08db47a8ffff
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2023 05:25:37.7849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aaqKSnOqpDJ/06ezJh3tGwkBRRhq1QxbCShEWmbtyoWU9rc22VGl0VmJMOJeoIU2cOpIXk5a4Dgspy5zaB2Z/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6220
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
 "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Zhang, 
 Carl" <carl.zhang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEludGVsLWdmeCA8
aW50ZWwtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgWWUs
IFRvbnkNCj4gU2VudDogcGVyamFudGFpIDI4LiBodWh0aWt1dXRhIDIwMjMgNi4xMQ0KPiBUbzog
Q2VyYW9sbyBTcHVyaW8sIERhbmllbGUgPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+
OyBpbnRlbC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogVGVyZXMgQWxleGlz
LCBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT47IGRyaS0N
Cj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBaaGFuZywgQ2FybCA8Y2FybC56aGFuZ0Bp
bnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbSW50ZWwtZ2Z4XSBbUEFUQ0ggMC84XSBkcm0vaTkx
NTogSHVDIGxvYWRpbmcgYW5kIGF1dGhlbnRpY2F0aW9uIGZvcg0KPiBNVEwNCj4gDQo+IEFja2Vk
LWJ5OiBUb255IFllIDx0b255LnllQGludGVsLmNvbT4NCkNJIHJlc3VsdHMgd291bGQgYmUgYWxz
byBnb29kIHRvIGxvb2sgYXQgYmVmb3JlLi4uIGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90
cmVlL2RybS10aXAvUGF0Y2h3b3JrXzExNzA4MHYxL2luZGV4Lmh0bWw/DQpGb3Igc29tZSByZWFz
b24gbm8gc2luZ2xlIE1UTCB0ZXN0cyBhbmQgbWFueSBhYm9ydHMuLi4NCg0KPiANCj4gVGhhbmtz
LA0KPiANCj4gVG9ueQ0KPiANCj4gT24gNC8yNy8yMDIzIDc6MzQgUE0sIERhbmllbGUgQ2VyYW9s
byBTcHVyaW8gd3JvdGU6DQo+ID4gVGhlIEh1QyBsb2FkaW5nIGFuZCBhdXRoZW50aWNhdGlvbiBm
bG93IGlzIG9uY2UgYWdhaW4gY2hhbmdpbmcgYW5kIGENCj4gPiBuZXcgImNsZWFyLW1lZGlhIG9u
bHkiIGF1dGhlbnRpY2F0aW9uIHN0ZXAgaXMgaW50cm9kdWNlZC4gVGhlIGZsb3cgaXMNCj4gPiBh
cw0KPiA+IGZvbGxvd3M6DQo+ID4NCj4gPiAxKSBUaGUgSHVDIGlzIGxvYWRlZCB2aWEgRE1BIC0g
c2FtZSBhcyBhbGwgbm9uLUdTQyBIdUMgYmluYXJpZXMuDQo+ID4NCj4gPiAyKSBUaGUgSHVDIGlz
IGF1dGhlbnRpY2F0ZWQgYnkgdGhlIEd1QyAtIHRoaXMgaXMgdGhlIHNhbWUgc3RlcCBhcw0KPiA+
IHBlcmZvcm1lZCBmb3IgYWxsIG5vbi1HU0MgSHVDIGJpbmFyaWVzIGFuZCByZS11c2VzIHRoZSBz
YW1lIGNvZGUsIGJ1dA0KPiA+IGl0IGlzIG5vdyByZXN1bHRpbmcgaW4gYSBwYXJ0aWFsIGF1dGhl
bnRpY2F0aW9uIHRoYXQgb25seSBhbGxvd3MNCj4gPiBjbGVhci1tZWRpYSB3b3JrbG9hZHMuDQo+
ID4NCj4gPiAzKSBUaGUgSHVDIGlzIGZ1bGx5IGF1dGhlbnRpY2F0ZWQgZm9yIGFsbCB3b3JrbG9h
ZHMgYnkgdGhlIEdTQyAtIHRoaXMNCj4gPiBpcyBkb25lIHZpYSBhIG5ldyBQWFAgY29tbWFuZCwg
c3VibWl0dGVkIHZpYSB0aGUgR1NDQ1MuDQo+ID4NCj4gPiBUaGUgYWR2YW50YWdlIG9mIHRoaXMg
bmV3IGZsb3cgaXMgdGhhdCB3ZSBjYW4gc3RhcnQgcHJvY2Vzc2luZw0KPiA+IGNsZWFyLW1lZGlh
IHdvcmtsb2FkcyB3aXRob3V0IGhhdmluZyB0byB3YWl0IGZvciB0aGUgR1NDIHRvIGJlIHJlYWR5
LA0KPiA+IHdoaWNoIGNhbiB0YWtlIHNldmVyYWwgc2Vjb25kcy4NCj4gPg0KPiA+IEFzIHBhcnQg
b2YgdGhpcyBjaGFuZ2UsIHRoZSBIdUMgc3RhdHVzIGdldHBhcmFtIGhhcyBiZWVuIHVwZGF0ZWQg
d2l0aA0KPiA+IGEgbmV3IHZhbHVlIHRvIGluZGljYXRlIGEgcGFydGlhbCBhdXRoZW50aWNhdGlv
bi4gTm90ZSB0aGEgdGhlIG1lZGlhDQo+ID4gZHJpdmVyIGlzIGNoZWNraW5nIGZvciB2YWx1ZSA+
IDAgZm9yIGNsZWFyIG1lZGlhIHdvcmtsb2Fkcywgc28gbm8NCj4gPiBjaGFuZ2VzIGFyZSByZXF1
aXJlZCBpbiB1c2Vyc3BhY2UgZm9yIHRoYXQgdG8gd29yay4NCj4gPg0KPiA+IFRoZSBTVyBwcm94
eSBzZXJpZXMgWzFdIGhhcyBiZWVuIGluY2x1ZGVkLCBzcXVhc2hlZCBpbiBhIHNpbmdsZSBwYXRj
aCwNCj4gPiBhcyBzb21lIG9mIHNvbWUgb2YgdGhlIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgZGVw
ZW5kIG9uIGl0LiBUaGlzIGlzDQo+ID4gbm90IGEgZnVuY3Rpb25hbCBkZXBlbmRlbmNpZXMsIHRo
ZSBwYXRjaGVzIGp1c3QgdG91Y2ggdGhlIHNhbWUgY29kZTsNCj4gPiB0aGUgcHJveHkgcGF0Y2hl
cyBhcmUgcGxhbm5lZCB0byBiZSBtZXJnZWQgZmlyc3QsIHNvIGl0IGlzIGVhc2llciB0bw0KPiA+
IGJhc2UgdGhlIG5ldyBwYXRjaGVzIG9uIHRvcCBvZiBpdCB0byBhdm9pZCBoYXZpbmcgdG8gcmVi
YXNlIHRoZW0gbGF0ZXIuDQo+ID4NCj4gPiBbMV1odHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvc2VyaWVzLzExNTgwNi8NCj4gPiBDYzogQWxhbiBQcmV2aW48YWxhbi5wcmV2aW4udGVy
ZXMuYWxleGlzQGludGVsLmNvbT4NCj4gPiBDYzogVG9ueSBZZTx0b255LnllQGludGVsLmNvbT4N
Cj4gPg0KPiA+IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gKDgpOg0KPiA+ICAgIERPIE5PVCBSRVZJ
RVc6IGRybS9pOTE1OiBBZGQgc3VwcG9ydCBmb3IgTVRMIEdTQyBTVyBQcm94eQ0KPiA+ICAgIGRy
bS9pOTE1L3VjOiBwZXJtYS1waW4gZmlybXdhcmVzDQo+ID4gICAgZHJtL2k5MTUvaHVjOiBQYXJz
ZSB0aGUgR1NDLWVuYWJsZWQgSHVDIGJpbmFyeQ0KPiA+ICAgIGRybS9pOTE1L2h1YzogTG9hZCBH
U0MtZW5hYmxlZCBIdUMgdmlhIERNQSB4ZmVyIGlmIHRoZSBmdXNlIHNheXMgc28NCj4gPiAgICBk
cm0vaTkxNS9odWM6IGRpZmZlcmVudGlhdGUgdGhlIDIgc3RlcHMgb2YgdGhlIE1UTCBIdUMgYXV0
aCBmbG93DQo+ID4gICAgZHJtL2k5MTUvbXRsL2h1YzogYXV0aCBIdUMgdmlhIEdTQw0KPiA+ICAg
IGRybS9pOTE1L210bC9odWM6IFVzZSB0aGUgbWVkaWEgZ3QgZm9yIHRoZSBIdUMgZ2V0cGFyYW0N
Cj4gPiAgICBkcm0vaTkxNS9odWM6IGRlZmluZSBIdUMgRlcgdmVyc2lvbiBmb3IgTVRMDQo+ID4N
Cj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAg
MSArDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9nZ3R0LmMgICAgICAgICAg
fCAgIDMgKw0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3RfaXJxLmMgICAg
ICAgIHwgIDIyICstDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ndF9yZWdz
LmggICAgICAgfCAgIDMgKw0KPiA+ICAgLi4uL2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY19tZXVf
aGVhZGVycy5oICAgIHwgIDc0ICsrKw0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMv
aW50ZWxfZ3NjX3Byb3h5LmMgIHwgNDI0ICsrKysrKysrKysrKysrKysrKw0KPiA+ICAgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3NjX3Byb3h5LmggIHwgIDE4ICsNCj4gPiAgIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY191Yy5jICAgICB8ICA4OSArKystDQo+
ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9nc2NfdWMuaCAgICAgfCAgMTcg
Ky0NCj4gPiAgIC4uLi9pOTE1L2d0L3VjL2ludGVsX2dzY191Y19oZWNpX2NtZF9zdWJtaXQuYyB8
ICAgMiArLQ0KPiA+ICAgLi4uL2k5MTUvZ3QvdWMvaW50ZWxfZ3NjX3VjX2hlY2lfY21kX3N1Ym1p
dC5oIHwgICAxICsNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Yy5j
ICAgICAgICB8ICAgMiArLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxf
aHVjLmMgICAgICAgIHwgMTgyICsrKysrLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dC91Yy9pbnRlbF9odWMuaCAgICAgICAgfCAgMjYgKy0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2d0L3VjL2ludGVsX2h1Y19mdy5jICAgICB8IDIxNCArKysrKysrKy0NCj4gPiAgIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2h1Y19mdy5oICAgICB8ICAgNiArLQ0KPiA+ICAg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfaHVjX3ByaW50LmggIHwgIDIxICsNCj4g
PiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX3VjLmMgICAgICAgICB8ICAxMCAr
LQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfdWMuaCAgICAgICAgIHwg
ICAyICsNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX3VjX2Z3LmMgICAg
ICB8IDEyMCArKy0tLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfdWNf
ZncuaCAgICAgIHwgICA5ICstDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dldHBh
cmFtLmMgICAgICAgICAgfCAgIDYgKy0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
cmVnLmggICAgICAgICAgICAgICB8ICAgMyArDQo+ID4gICAuLi4vZHJtL2k5MTUvcHhwL2ludGVs
X3B4cF9jbWRfaW50ZXJmYWNlXzQzLmggfCAgMTQgKy0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L3B4cC9pbnRlbF9weHBfaHVjLmMgICAgICB8ICAgMiArLQ0KPiA+ICAgZHJpdmVycy9taXNj
L21laS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstDQo+ID4gICBkcml2ZXJz
L21pc2MvbWVpL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiA+ICAgZHJp
dmVycy9taXNjL21laS9nc2NfcHJveHkvS2NvbmZpZyAgICAgICAgICAgIHwgIDE0ICsNCj4gPiAg
IGRyaXZlcnMvbWlzYy9tZWkvZ3NjX3Byb3h5L01ha2VmaWxlICAgICAgICAgICB8ICAgNyArDQo+
ID4gICBkcml2ZXJzL21pc2MvbWVpL2dzY19wcm94eS9tZWlfZ3NjX3Byb3h5LmMgICAgfCAyMDgg
KysrKysrKysrDQo+ID4gICBpbmNsdWRlL2RybS9pOTE1X2NvbXBvbmVudC5oICAgICAgICAgICAg
ICAgICAgfCAgIDMgKy0NCj4gPiAgIGluY2x1ZGUvZHJtL2k5MTVfZ3NjX3Byb3h5X21laV9pbnRl
cmZhY2UuaCAgICB8ICA1MyArKysNCj4gPiAgIGluY2x1ZGUvdWFwaS9kcm0vaTkxNV9kcm0uaCAg
ICAgICAgICAgICAgICAgICB8ICAgMyArLQ0KPiA+ICAgMzMgZmlsZXMgY2hhbmdlZCwgMTQyOCBp
bnNlcnRpb25zKCspLCAxMzQgZGVsZXRpb25zKC0pDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3NjX21ldV9oZWFkZXJzLmgNCj4gPiAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9nc2Nf
cHJveHkuYw0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0
L3VjL2ludGVsX2dzY19wcm94eS5oDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfaHVjX3ByaW50LmgNCj4gPiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL21pc2MvbWVpL2dzY19wcm94eS9LY29uZmlnDQo+ID4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9taXNjL21laS9nc2NfcHJveHkvTWFrZWZpbGUNCj4gPiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21pc2MvbWVpL2dzY19wcm94eS9tZWlfZ3NjX3Byb3h5LmMN
Cj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2RybS9pOTE1X2dzY19wcm94eV9tZWlf
aW50ZXJmYWNlLmgNCj4gPg0K
