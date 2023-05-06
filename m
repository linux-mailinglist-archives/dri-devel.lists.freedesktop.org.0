Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAFD6F906B
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 10:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA7410E1CB;
	Sat,  6 May 2023 08:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3561A10E0B6;
 Sat,  6 May 2023 08:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683360190; x=1714896190;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NQ62gct6Zits09Pbz6Wo6k1IaTQbcNt4aUqnSuPag4E=;
 b=EcjJn3AbuBnVFOOZKXSaYdEmC3nV09IiR10hcq6mzh2DCMGovYsWty71
 8ySdzfyk/G0uyRY3OxzmLfyZC2otCWpLa6XHUQd+lNXnNAmyypoTofyz7
 JWh23i0dHMi7OqQwMQOO8vyf6IgfsNONlJvh/KenoKxLu2J7F8jGw1Y/o
 t6DAymSa9fEspZZO6mx8rf1covnODRZSg9pNLl2VFBQwnhBMF/921kaNm
 iyWL7wFlF7Pxv/mkXXtGH/IFAd3V+pNxOD9pdRhitOwQEQL6OZ46LsANq
 FUKWO05eTzaTbNvEIZrlkq+Uvqgw+pdnPC5btiTc9Er64IqRhUTVHPeFO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="351512274"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; d="scan'208";a="351512274"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2023 01:03:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="809563054"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; d="scan'208";a="809563054"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 06 May 2023 01:03:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 6 May 2023 01:03:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sat, 6 May 2023 01:03:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sat, 6 May 2023 01:03:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1g1DBIgQa3hAzPI8WKAXchre3gdBkZmfh5rKOrASJdSN6+PpQBJAEWou+f7jUnesI+WkmXm8rC7dg7i4FEimzyXNxwkCs8v5vdWjT2O7iEfJQsxS7XotTi1kAEOf6aJpEv3EtznH+j79XmVMV5Zl+98/A4HfmO4ge5RQBO6dbQ8J9WkMiwWo1LSmJhs+Y6kRW45QXF66ynsMnS7E4xVAma4awbbBLi2dgHKfChEzq9w/BblB4U7ae8f/zqIOqOFT2lDwK4IWIniLcUkJTR1efIkZE9CSeX5xkpuP8/r92LYVSnDCXLY2HqhC5PtcvgiK4fMuPTubq7CrZTJD1Sc+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQ62gct6Zits09Pbz6Wo6k1IaTQbcNt4aUqnSuPag4E=;
 b=SjUDAVHBhrQpHgZi+lDOHXcBGqXef6m77RIwEZnBjrvmZs4Bk/Ot9EJLNcBw30sJRr5sVtGlp85+Q4WILPfv3tnlzglbLnJ16XqH0DLdnglbfGqSRvq9quPoE3TITwZ+Ia92fVbD4D5c5DAJmsFQrk0Ekil3UTZxbRyZNkihzQPOMIUeaua4LgVBMNr2x0+FSL8F9ap4eOG9VQ9E4IPKj5SNpFvknLH6OdDjPY9mDA5J/y+WxOwVHwBLMw7XA6z6zspz07jawFjjOtwRZKO736WfxBj52b+FlAQ8K5r0q9wpjflcXIA2wujOzdlwdRKwgRT/XnpPCoE1aLLkjsKlKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by CY8PR11MB7058.namprd11.prod.outlook.com (2603:10b6:930:52::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.29; Sat, 6 May
 2023 08:03:01 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::37e2:bdec:585b:383c]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::37e2:bdec:585b:383c%3]) with mapi id 15.20.6363.026; Sat, 6 May 2023
 08:03:00 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v5 2/5] drm/i915: use pat_index instead of cache_level
Thread-Topic: [PATCH v5 2/5] drm/i915: use pat_index instead of cache_level
Thread-Index: AQHZfhMsbjkUvOFLzk+GbHmgDCsyS69KEhgAgAAtgJOAATJbAIABc+/g
Date: Sat, 6 May 2023 08:03:00 +0000
Message-ID: <BYAPR11MB25674EB9E05C57C0040405059A739@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230503230211.2834340-1-fei.yang@intel.com>
 <20230503230211.2834340-3-fei.yang@intel.com>
 <4c464bd6-9edc-3098-5c24-6d6da2a75c39@linux.intel.com>
 <BYAPR11MB2567660DE774E0C2B400D0479A6D9@BYAPR11MB2567.namprd11.prod.outlook.com>
 <e288386b-557f-8951-443a-41e9727669f2@linux.intel.com>
In-Reply-To: <e288386b-557f-8951-443a-41e9727669f2@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|CY8PR11MB7058:EE_
x-ms-office365-filtering-correlation-id: 44fcffdc-1aa7-4c02-de56-08db4e084f7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3aSeFPk2VQ7rFLWhPK3gDprIehLNnpww9d4YdGokye3OTjtugbyZin6GQaJN//+lGGIK0gkrYS58JdlQOsl/jy6tJwBcOiGGAvUvAPeUtDyOqA3NJKlha9ghchRbbGgtJC22VQp0pbKoYRy0Iw/89lEfjtKfhXl+eNh1NvcT0HMzZy2p5CD0tXH7kvDUPZ52L1Pr9aqvgnDlehfGJQeIn5u9IURtQJr8B0q0GZA9Z9N4SnLLFx5PM/FuE5fV/3vztaBTUcZ4TcFVt+gEgOP6EDbumOVQJhxJhdk++yYrRuTDJOiqgeh43JszvKXLX2HdaYtUas/onZoq/AVd9CB2AhCIDPM9yvEjY437CwfMSjHfCWQucy+UfFT5HuDjIpbVUamSaRMkMDyy/RefTgxBkn62cSubBTRN7+WqQ0hSt3INITM7XPEenanPgOl+C0WY23uzXIBPKw66UqPebfgqJt94LOuvDRqRBJzWd3+O0TxPKbDOnhdLR3nWK9t6WH3ZJgQCgaAA2He70KiF6d8vr3wyNjSobID33opNB2G1izQ9gNRKDhPY9VjXnKssHIzYbTCSi7beO2/78RDECbGSn4QOy155AgxmIPJavmUmfMDbXnCXpBdlzK8X4+cfXqux
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(366004)(376002)(136003)(39860400002)(451199021)(52536014)(110136005)(5660300002)(8936002)(41300700001)(8676002)(2906002)(54906003)(66556008)(66476007)(64756008)(66446008)(4326008)(76116006)(66946007)(478600001)(316002)(7696005)(71200400001)(83380400001)(82960400001)(33656002)(6506007)(9686003)(26005)(55016003)(86362001)(38070700005)(186003)(122000001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVAvM3pYc3BDR1Bzamd6T0VTZEZmODFPOUtWZ0x5V1RCWjJPcHdUaUJ1dkV1?=
 =?utf-8?B?cmM2WFVGQ1hIeXk4Z2FkcTlxQkcvc0ZtNFRncjN6RWJTTDZKSUp3NFJ5elNm?=
 =?utf-8?B?Q0FYaUZJcDZUZEJObElFeVBBb25zWElFSTMrbEtZSnJ4aUdDOVhoMW9vT1N0?=
 =?utf-8?B?dXNUd3RzZWpoWUdQVklkd2NPcTdmZUdYZnpsMDdyNG41eEk5ejRoYXdDZ2tl?=
 =?utf-8?B?SDdGRjBFN1VYUkdYeG5ONTNMbllYM0tMblEveVJEbi8xdDZUWGhaNGx1Ujk1?=
 =?utf-8?B?SU5XUHU1b0lxRi9SM005V29DY2xzdERCSWNNL2pCcjVrdm0xYVp1V3NySU9s?=
 =?utf-8?B?RjFDT3pCYk90SmRKYmFSTUJXZ3ZKMWFSeVNheitrSEhhTUFRNmYwZU1ZMHBC?=
 =?utf-8?B?UGsrQ1g3UENxUkhQbFA3MWVMYzMyMzYySlZJNkJKaHBXanpsVW80M3dCdWJY?=
 =?utf-8?B?Z0NTNU9seFQzQzQ0SENsNFRiVTlxTld5M3lEeXVsUTkxclM0ZlNjMmJzUWZ4?=
 =?utf-8?B?eFFleEtETmNiak54ZGdvcW9EeVdjL0hiU1lNWHdsL0taY1Y1WkZOaURoK2NL?=
 =?utf-8?B?WFdMNU9tVVEzSjBDVjA2dlc4SXlkNjF0aEZ3UjYyQXlLWVNRWEUvN0FBMVlM?=
 =?utf-8?B?T24zMEJXNEJKV0tnWHZsdXpLOHlXYUhmWU8remtqR01xejdkc25yam9oQXZP?=
 =?utf-8?B?S0dJcHY1Q0lEdEJEWUF1WjRGY01rWFduRXR2V3o3dFVWaTdQcDViZnpUWGtw?=
 =?utf-8?B?ZllJVmR0RG9BNkxZZTh0U0lKYmwxMVFOZ1dMM2lhdUQrdGhGQmwxNSs4OVdB?=
 =?utf-8?B?RTZKYVBvQWJvL2RDYkJSNlVwRHJQd2QvaDlnRUZ2WUU0dnB1emp6cHgyRkQ4?=
 =?utf-8?B?b0RKOTFLSUR1VTVSeklPZkpUQXo4STQwSW5XWXFIZnc5YSs3TnBFa3VFbklC?=
 =?utf-8?B?QTQ2QXhLVmtFK0tnSTJ2Y0FPbG5HSHc5NkUwMUdLcG1zNUkrd1pEU2xOT055?=
 =?utf-8?B?QXhka1d5QnRiSlF6dlo5eWhsWVNNNFRSL1MvR1FESzVWNldoUGxYeDNkUVdk?=
 =?utf-8?B?VUYvRmZHS1g3aHlpdGduYUVMRlhOem9ycnpxaTdRTkpUblYrYXl1WFUyYmpW?=
 =?utf-8?B?ZWZtczkwYmdCS1o4U3hacTlJanhhTjNBb3lLaG9maFczREg2NllqQmdQakh3?=
 =?utf-8?B?MUJGL1lIMXpkTVJIQ0FHZEV2aWZSQ3lsUEZlNUpzMjIrMmxxeVNtNzZ0MVlW?=
 =?utf-8?B?TWQ0Q29ESzFUcEJzOENyMFJDeWlTa2d6YmNrd09VWHZIdE85b1lEQ3J1L3My?=
 =?utf-8?B?M014UEhiMjBjNXBiV1ZlZGRjSkovOThlNVFtQ3VpMXVIdnA1UEhMTFJRNXZX?=
 =?utf-8?B?d3crT25vTGs1RG4yZ2laWmNyZEM3MkZOdUtVTjdvcm9tU0VOUFErRS9wSi81?=
 =?utf-8?B?NXViaGpTVjVvajVlL09PaXhDd2x3RXNvMitmNjdBQjkrcnhBTHdnN28vWVZI?=
 =?utf-8?B?aHJ4RW1nYTQrSkRVMHlQdVZzTnNkOHVpT2tsaGVxYXJjRE5PRE4vdlFRRHFE?=
 =?utf-8?B?T2g2T3UwUkRBN3lBVEkrSGVFTm9ubFI4Q2lXVTdCVGZ2ZGNpcm80c0J2V2Qy?=
 =?utf-8?B?eFl3Q2lHZzY0V1VJWURXQ3dhUGIvdW5vSjBYZG5tTndNYTNMdDVCZ09pek1L?=
 =?utf-8?B?N2wrK2Nwb1REZzQ5UEVORUMwYVd0ZTRNYTZkT0c3eGR4VnFYdDBxdGt5SnNP?=
 =?utf-8?B?Nk1tVWxWNlJCeWRmbTRWeDNLRjdmYmd5WitoK0RWSlo3NEVwd3hPRmxOQi9l?=
 =?utf-8?B?ZFZ3SnpEY2IxK1FvM2RpTzJJVUR1R2RORndNTEQyVVAzVTZXUUdsQ2NUZ2ZF?=
 =?utf-8?B?S0x1WnRkUGRhajZSM2RtdXNRTHpCek44RkVqV1pIalJBcUt5cFA3czQ3QW9P?=
 =?utf-8?B?WmdQZGoxWGRmUjFFWFg0NVZJNkxKZG5CWm1jc2VrdzM2ancrN0szakVRYzQr?=
 =?utf-8?B?K1pCRWpvNUhKMU9HSFVXV3ZhZC9RRzU4ZGhaTkF5RHJwdTBldUlHV0Job3ht?=
 =?utf-8?B?NDlkWkFuaitlOXI5NUZPU3A0SytoR3QzNWV0L3hPcmtoZG12cVAxdVEybG14?=
 =?utf-8?Q?fYzze+M/eC6zdzj+KG/9l6KPa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44fcffdc-1aa7-4c02-de56-08db4e084f7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2023 08:03:00.3194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xGLX6EWV+d6GKD+UYORa2c9gnZiWO+pByyoZXfasYWcVxHioAUL84HgqtkHWFBI/tTdDqRTnXsGE92LIJY3rIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7058
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pj4+Pg0KPj4+PiAgIHN0YXRpYyB1NjQgbXRsX3B0ZV9lbmNvZGUoZG1hX2FkZHJfdCBhZGRyLA0K
Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgICBlbnVtIGk5MTVfY2FjaGVfbGV2ZWwgbGV2ZWws
DQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBwYXRfaW5kZXgsDQo+
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBmbGFncykNCj4+PiBQcm90b3R5cGUgYW5k
IGltcGxlbWVudGF0aW9uIGNoYW5nZWQgaGVyZSBmb3IgbXRsX3B0ZV9lbmNvZGUuDQo+Pj4NCj4+
PiBBbmQgd2UgaGF2ZToNCj4+Pg0KPj4+ICAgICAgICBpZiAoR1JBUEhJQ1NfVkVSX0ZVTEwoZ3Qt
Pmk5MTUpID49IElQX1ZFUigxMiwgNzApKQ0KPj4+IHBwZ3R0LT52bS5wdGVfZW5jb2RlID0gbXRs
X3B0ZV9lbmNvZGU7DQo+Pj4gICAgICAgIGVsc2UNCj4+PiBwcGd0dC0+dm0ucHRlX2VuY29kZSA9
IGdlbjhfcHRlX2VuY29kZTsNCj4+PiBTbyBzaG91bGQgYmUgc2FtZSBwcm90b3R5cGUuIEFuZDoN
Cj4+Pg0KPj4+ICAgICAgICAgdTY0ICgqcHRlX2VuY29kZSkoZG1hX2FkZHJfdCBhZGRyLA0KPj4+
LSAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIGk5MTVfY2FjaGVfbGV2ZWwgbGV2ZWwsDQo+
Pj4rICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBwYXRfaW5kZXgsDQo+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBmbGFncyk7DQo+Pj4vKiBDcmVhdGUgYSB2YWxp
ZCBQVEUgKi8NCj4+PiBQYXRjaCByZWxpZXMgb24gdGhlIGNvbXBpbGVyIGNvbnNpZGVyaW5nIGVu
dW0gZXF1YWwgdG8gdW5zaWduZWQgaW50Pw0KPj4NCj4+IHllcywgY2FsbGVyIGlzIHBhc3Npbmcg
aW4gdW5zaWduZWQgaW50IGFuZCBnZXRzIHVzZWQgYXMgZW51bS4NCj4+DQo+Pj4gQnV0IHRoZSBp
bXBsZW1lbnRhdGlvbiBvZiBnZW44X3B0ZV9lbmNvZGUgYW5kIG1vc3QgZ2d0dA0KPj4+IGNvdW50
ZXJwYXJ0cyBpcyBsb29raW5nIGF0IHRoZSBwYXNzZWQgaW4gcGF0IGluZGV4IGFuZCB0aGlua3Mg
aXQgaXMgY2FjaGUgbGV2ZWwuDQo+Pj4NCj4+PiBIb3cgaXMgdGhhdCBzdXBwb3NlZCB0byB3b3Jr
PyEgT3IgSSBhbSBibGluZCBhbmQgYW0gbWlzc2luZyBzb21ldGhpbmc/DQo+Pg0KPj4gRm9yIGxl
Z2FjeSBwbGF0Zm9ybXMgdHJhbnNsYXRpb24gdGhyb3VnaCBMRUdBQ1lfQ0FDSEVMRVZFTCB3b3Vs
ZCBub3QNCj4+IGNoYW5nZSB0aGUgdmFsdWUgb2YgY2FjaGVfbGV2ZWwuIFRoZSBjYWNoZV9sZXZl
bCBhbmQgcGF0X2luZGV4IGFyZQ0KPj4gYmFzaWNhbGx5IHRoZSBzYW1lIGZvciB0aGVzZSBwbGF0
Zm9ybXMuDQo+DQo+IE9oIHRoYXQgaXMgbmFzdHkgbGl0dGxlIHRyaWNrISBBbmQgSSBkaWQgbm90
IHNwb3QgaXQgYmVpbmcgZGVzY3JpYmVkDQo+IGFueXdoZXJlIGluIHRoZSBjb21taXQgbWVzc2Fn
ZSBvciBjb2RlIGNvbW1lbnRzLg0KDQpXaWxsIGFkZC4NCg0KPiBTbyB5b3UgYXJlIHNheWluZyBm
b3IgbGVnYWN5IGNhY2hlX2xldmVsIGVxdWFscyBwYXRfaW5kZXggZm9yIHdoYXQNCj4gY2FjaGlu
ZyBiZWhhdmlvdXIgaXMgY29uY2VybmVkLiBJZToNCj4NCj4gKyNkZWZpbmUgTEVHQUNZX0NBQ0hF
TEVWRUwgXA0KPiArICAgICAuY2FjaGVsZXZlbF90b19wYXQgPSB7IFwNCj4gKyAgICAgICAgICAg
ICBbSTkxNV9DQUNIRV9OT05FXSAgID0gMCwgXA0KPiArICAgICAgICAgICAgIFtJOTE1X0NBQ0hF
X0xMQ10gICAgPSAxLCBcDQo+ICsgICAgICAgICAgICAgW0k5MTVfQ0FDSEVfTDNfTExDXSA9IDIs
IFwNCj4gKyAgICAgICAgICAgICBbSTkxNV9DQUNIRV9XVF0gICAgID0gMywgXA0KPiArICAgICB9
DQo+DQo+IEFuZCBiZWNhdXNlOg0KPg0KPiBlbnVtIGk5MTVfY2FjaGVfbGV2ZWwgew0KPiAgICAg
ICBJOTE1X0NBQ0hFX05PTkUgPSAwLA0KPiAgICAgICBJOTE1X0NBQ0hFX0xMQywNCj4gICAgICAg
STkxNV9DQUNIRV9MM19MTEMsDQo+ICAgICAgIEk5MTVfQ0FDSEVfV1QsDQo+IH07DQo+DQo+IFRo
aXMgaW5kZWVkIGVuZHMgdXAgYSAxOjEgcmV2ZXJzaWJsZSBtYXBwaW5nLg0KPg0KPiBCdXQgaXQg
aXMgaGlkZGVuIGFuZCBmcmFnaWxlLiBXaGF0IHByZXZlbnRzIHNvbWVvbmUgZnJvbSBjaGFuZ2lu
ZyB0aGUNCj4gZW51bSBpOTE1X2NhY2hlX2xldmVsPyBUaGVyZSBpcyBubyBleHBsaWNpdCBsaW5r
YWdlIHdpdGggaGFyZHdhcmUgUEFUDQo+IHZhbHVlcyBhbnl3aGVyZS4gT3IgYXQgbGVhc3QgSSBk
b24ndCBzZWUgaXQuDQo+DQo+IEkgd291bGQgc2F5IGFsbCBwdGVfZW5jb2RlIHNpZ25hdHVyZXMg
aGF2ZSB0byBiZSBjaGFuZ2VkIHRvIHBhdCBpbmRleC4NCj4NCj4gV2hpY2ggbWVhbnMgYWxsIHB0
ZSBlbmNvZGUgaW1wbGVtZW50YXRpb25zIGhhdmUgdG8gdW5kZXJzdGFuZCB3aGF0IHBhdCBpbmRp
Y2VzIG1lYW4uDQo+DQo+IFdoaWNoIGJyaW5ncyB1cyBiYWNrIHRvIHRoYXQgaWRlYSBvZiBhIDJu
ZCB0YWJsZSwgSSBwYXJhcGhyYXNlOg0KPg0KPiAubGVnYWN5X3BhdF90b19jYWNoZSA9IHsNCj4g
ICAgICAgWzBdID0gSTkxNV9QQVRfVUMsDQo+ICAgICAgIFsxXSA9IEk5MTVfUEFUX1dCLA0KPiAg
ICAgICBbMl0gPSBJOTE1X1BBVF9XQiB8IEk5MTVfUEFUX0xMQyAvKiBub3Qgc3VyZSBvbiB0aGlz
IG9uZSAqLw0KPiAgICAgICBbM10gPSBJOTE1X1BBVF9XVCwNCj4gfTsNCj4NCj4gUGF0X2VuY29k
ZSBpbXBsZW1lbnRhdGlvbnMgdGhlbiBpbnN0ZWFkOg0KPg0KPiAgICAgICBzd2l0Y2ggKGxldmVs
KSB7DQo+ICAgICAgIGNhc2UgSTkxNV9DQUNIRV9OT05FOg0KPiAgICAgICAgICAgICAgIHB0ZSB8
PSBQUEFUX1VOQ0FDSEVEOw0KPiAgICAgICAuLi4NCj4NCj4gRG86DQo+DQo+ICAgICAgIGlmIChp
OTE1LT5wYXRfdG9fY2FjaGVfZmxhZ3NbcGF0X2luZGV4XSAmIEk5MTVfUEFUX1VDKQ0KPiAgICAg
ICAgICAgICAgIHB0ZSB8PSBQUEFUX1VOQ0FDSEVEOw0KPiAgICAgICBlbHNlIGlmDQo+ICAgICAg
IC4uLg0KPg0KPg0KPiBCdXQgaXQgd291bGQgcmVxdWlyZSBpOTE1IHRvIGJlIHBhc3NlZCBpbiB3
aGljaCBpcyBhZG1pdHRlZGx5IGENCj4gbm9pc3kgZGlmZi4gSG0uLiBiZW5lZml0IG9mIGhhcmR3
YXJlIGFnbm9zdGljIGVudW0gaTkxNV9jYWNoZV9sZXZlbC4uDQoNClRoYXQncyB3YXMgb25lIG9m
IHRoZSBwcm9ibGVtIEkgcmFuIGludG8gd2hlbiBjcmVhdGluZyB0aGlzIHBhdGNoLg0KDQo+IE1h
eWJlIGNvbnZlcnQgcGF0X2luZGV4IHRvIEk5MTVfUEFUXy4uIGZsYWdzIGluIHRoZSBjYWxsZXJz
PyBMaWtlIHRoaXM6DQo+DQo+IGdlbjhfcHBndHRfaW5zZXJ0X3B0ZSguLi4pDQo+IC4uLg0KPiAg
ICAgICBjb25zdCB1MzIgcGF0X2ZsYWdzID0gaTkxNS0+cGF0X3RvX2NhY2hlX2ZsYWdzW3BhdF9p
bmRleF07DQo+ICAgICAgIGNvbnN0IGdlbjhfcHRlX3QgcHRlX2VuY29kZSA9IHBwZ3R0LT52bS5w
dGVfZW5jb2RlKDAsIHBhdF9mbGFncywgZmxhZ3MpOw0KPg0KPiBFdGMuIFRoYXQgd291bGQgYmUg
c21hbGxlciBjaHVybiBvbiB0aGUgcHRlX2VuY29kZSBzaWduYXR1cmUuDQo+DQo+IE1heWJlIGhl
bHBlciBmb3IgaTkxNS0+cGF0X3RvX2NhY2hlX2ZsYWdzIGxvb2t1cCBzbyBpdCBjYW4gY2hlY2sg
dGhlIGFycmF5IGJvdW5kcz8NCj4NCj4gSWYgdGhpcyBhbGwgc291bmRzIHRvbyBtdWNoIHRvIHlv
dSBtYXliZSB3ZSBjYW4gZG8gaXQgYXMgYSBmb2xsb3d1cC4NCg0KSXQncyBnZXR0aW5nIG1vcmUg
Y29tcGxpY2F0ZWQuLi4NCkJ1dCBJIGJlbGlldmUgaXQgc2hvdWxkIGJlIGRvYWJsZSB0byBkZWZp
bmUgYSBQQVQgdGFibGUgKHNhbWUgaW4gQnNwZWMpIGFuZCBkcm9wDQp0aGUgY2FjaGVfbGV2ZWwu
IFRvZ2V0aGVyIHdpdGggdGhlIFBQQVQgYml0IG1hc2tzIChzdWNoIGFzIE1UTF9QUEFUX0w0XzNf
VUMpIGRlZmluZWQNCmluIGludGVsX2d0dC5oLCB0aGUgY29kZSBjYW4gYmUgc2ltcGxlciB3aXRo
b3V0IHRyYW5zbGF0aW9uLg0KDQo+IE9yIHBlcmhhcHMgaXQgaXMgYWN0dWFsbHkgcG9pbnRpbmcg
dG93YXJkcyB0aGF0IG9iai0+cGF0X2luZGV4IGlzIG5vdCB0aGUgbW9zdA0KPiBlbGVnYW50IGNo
b2ljZSB0byBiZSB1c2VkIGFzIGEgc2luZ2xlIHBvaW50IG9mIHRydXRoLi4gcGVyaGFwcyBvYmot
PmNhY2hlX2ZsYWdzDQo+IHdvdWxkIGJlIGJldHRlci4gSXQgd291bGQgYmUgc2V0IGF0IHNhbWUg
ZW50cnkgcG9pbnRzIGFuZCBpdCB3b3VsZCBiZSBodyBhZ25vc3RpYw0KPiBzbyBjb3VsZCBlbmQg
dXAgbW9yZSBlbGVnYW50IGluIHRoZSBkcml2ZXIuDQo+DQo+IEJ1dCB0aGVuIEkgdGhpbmsgd2Ug
bmVlZCBhdCBtaW5pbXVtIHNvbWV0aGluZyBsaWtlIHRoZSBiZWxvdyBpbiB0aGlzIHBhdGNoLCBz
b21ld2hlcmU6DQo+DQo+IC8qDQo+ICAgKiBPbiBwcmUtR2VuMTIgcGxhdGZvcm1zIGVudW0gaTkx
NV9jYWNoZV9sZXZlbCBoYXBwZW5zIHRvIGFsaWduDQo+ICAgKiB3aXRoIGNhY2hpbmcgbW9kZXMg
YXMgc3BlY2lmaWVkIGluIGhhcmR3YXJlIFBBVCBpbmRpY2VzLiBPdXINCj4gICAqIGltcGxlbWVu
dGF0aW9uIHJlbGllcyBvbiB0aGF0IGR1ZSB0cmlja3MgcGxheWVkIChleHBsYWluIHRoZQ0KPiAg
ICogdHJpY2tzKSBpbiB0aGUgcHRlX2VuY29kZSB2ZnVuY3MuDQo+ICAgKiBFbnN1cmUgdGhpcyB0
cmljayBrZWVwcyB3b3JraW5nIHVudGlsIHRoZSBkcml2ZXIgY2FuIGJlIGZ1bGx5DQo+ICAgKiBy
ZWZhY3RvcmVkIHRvIHN1cHBvcnQgcGF0IGluZGljZXMgYmV0dGVyLg0KPiAgICovDQo+IEJVSUxE
X0JVR19PTihJOTE1X0NBQ0hFX05PTkUgIT0gMCk7DQo+IC4uLiBldGMgZm9yIGFsbCBlbnVtcyAu
Li4NCg0KV2lsbCBhZGQNCg0KPiBpZiAoZ2VuIDwgMTIpIHsNCj4gICAgICAgR0VNX1dBUk5fT04o
aTkxNV9nZW1fZ2V0X3BhdF9pbmRleChpOTE1LCBJOTE1X0NBQ0hFX05PTkUpICE9IDApOw0KPiAg
ICAgICAuLi4gZXRjIGZvciBhbGwgZW51bXMgLi4uDQoNClRoaXMgc2hvdWxkIG5vdCBiZSBuZWNl
c3NhcnkgYXMgbG9uZyBhcyB0aGUgZW51bSBpcyB2ZXJpZmllZC4NCg0KPiB9DQo+DQo+PiBJdCBp
cyBicm9rZW4gZm9yIGdlbjEyIGhlcmUuIEkgd2FzIGFza2VkIHRvIHNlcGFyYXRlIHRoZQ0KPj4g
Z2VuMTJfcHRlX2VuY29kZSBjaGFuZ2UgdG8gYW5vdGhlciBwYXRjaCBpbiB0aGUgc2VyaWVzLCBi
dXQgdGhhdA0KPj4gYnJlYWtzIGJpc2VjdC4gU2hvdWxkIEkgc3F1YXNoIDIvNSBhbmQgMy81Pw0K
Pg0KPiBUaGlzIHBhdGNoIGJyZWFrcyBnZW4xMj8gWWVzIHRoYXQgc2hvdWxkIGRlZmluaXRlbHkg
YmUgYXZvaWRlZC4NCg0KV2lsbCBmaXggdGhhdCBieSBzcXVhc2hpbmcgMi81IGFuZCAzLzUgd2l0
aCBleHBsYW5hdGlvbiBpbiBjb21taXQgbWVzc2FnZS4NCg0KPiBSZWdhcmRzLA0KPg0KPiBUdnJ0
a28NCg==
