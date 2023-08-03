Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBDF76E27D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A64A10E5BB;
	Thu,  3 Aug 2023 08:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB1210E5BB
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691050131; x=1722586131;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eKWXruzXyuKzNZ7mTn4SVnwq3pSlZvtKlVPxhSJNX5E=;
 b=iNp+YErjGbCKbySwL4B27nmvvqqIIShE0CZLgMZ8Uypf54k6ZMoW4y7l
 HCrPgtT1C7pKmVAKJNAIcB47XBIqhAkwWe0nhdFVykZH3PFyjn4VXC/Ku
 oAb6he8Plf4xZSYWAizb0+g7RUUySMk8OGbVOOW+FQklOJv+pRk5l7leG
 9FBLqzVBU/ntw/eabiAdF/ePpUEioKKo30ScLcERX0DI9oPdRF0ak9usg
 SM+VX4n3r8qs29eK/o0FLqfEhkxnbI/9O8IF3O03zOTnfEWtE9O3QeQAV
 v1NgiRru4/6Tt86hPcHhvYXJXpCJOqFOIudW6J4BpmNbUGyklQgMkmVqA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="436113317"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; d="scan'208";a="436113317"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 01:08:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="679392202"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; d="scan'208";a="679392202"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 03 Aug 2023 01:08:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 01:08:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 01:08:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 01:08:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLrpri/HoailMhouE9vHMUq7U9yGfEYvcwSbJe42djBpJeLCQyvIscdWWu2tgxMJxC0ZM3+XPi4NTe97eAMcRgAKk8dUA4NlgIl2Gl5akHGoFixOuqvchVdg0RCT3/mYxi//WhXuUJZ30KpIHD61kdEtIme8dOpCh9NFW3ZRtcHd8IPT9T+06E9ZlrrGaiJECmwGJsoazg7aqEJOKuQYDCNtCFBeZrCLWjE8+K9oV68phNIgFvdatGY1sE5hViEdxL/u+sexA7JLBGuN3erEuFmDRSN46YEFYXpz5XcbLmy06fCbUb3AC8yY9+snVh3okDh5pu01PFhk6pPOroFCYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKWXruzXyuKzNZ7mTn4SVnwq3pSlZvtKlVPxhSJNX5E=;
 b=k58M5hQDJvEsQM78U9U5qvitZeAoBSjOLTYiv54wXWixDhfiN8FvL5WfF+nO5E2Bk4fgj0oyhYA7cn4mlMKk4uIq3G5/9Gn/TQCTVOuELGJO+ywvhiz0gh/+5UfXDBgEg6XhsllSjHtekzrEkwVzJ/27b6Jg9yTpToU261OwVD5zpmY7SRY9ez7jUam8T742wkW+jupEsBsJrSHJCXUXTGF8/NWjkMeB88sKoeNp/L3upyN9KC2NFy2iysa6s+ZZ/IODdFQccbG1hxLJCcmaIoO9HIuKKnRMdlvuJHeXfFfn46i7sVn9VJuc8abiJXq1BNZum8EKFc0GIrd/Da16EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DM6PR11MB4643.namprd11.prod.outlook.com (2603:10b6:5:2a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 08:08:42 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b78c:107e:e7ad:4e2b%3]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 08:08:41 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Peter Xu <peterx@redhat.com>
Subject: RE: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Topic: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Thread-Index: AQHZuVToVshy99YkkE2dGyNcPWpnjq/AWUSAgAGkBBCAAGFsAIAF9M/ggAChIwCAADi24IAAwXOAgADrBVCAA1oygIAAWIfAgAWjOQCAAG6RgIABdXCAgAHL3IA=
Date: Thu, 3 Aug 2023 08:08:41 +0000
Message-ID: <IA0PR11MB7185830320B39330BFBCCE8FF808A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL5+CiZ6w4RdAt5u@nvidia.com>
 <IA0PR11MB7185D67DD07FEF0C92789D7AF802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <75e3a74a-68f5-df-9a49-a0553c04320@google.com>
 <CH3PR11MB71777432A63D3FAAE7E70F22F803A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMLk8aMmpkK7ZCsW@x1n>
 <CH3PR11MB7177832A92B4F550BF816E0CF807A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMfp3q/9osOV4wFO@x1n>
 <IA0PR11MB7185B093E86CB35EFDFF17EAF80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMl/4Z1b6ooeE/Pk@x1n>
In-Reply-To: <ZMl/4Z1b6ooeE/Pk@x1n>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DM6PR11MB4643:EE_
x-ms-office365-filtering-correlation-id: 5a29a716-0907-45bb-bade-08db93f8d9b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ERAYxIQMyxTLftb/UR5wGqUZAcKS/dNsfQzHVILnRGehhR1zCeVYq9+ZBFg4YoJUG3WjnAZbMmFM+anl5Wkmo6MEIAwIpiRnVSOzfq7EFq11SdsxsRB0J+RzsQ/9GqZmKAmCluoAIRtUBYkx4pL59sybBbCYfDWV2aUn7UNI3PGArpfWU4NMBdrhxfxTne18PIyZcpmJlm6IC3P/6RsJpN7e7f072EfvVJXspjBpji8VKtqj7Tb2Mq6otwjLbQ3T/dTwArvxZuxBVKlUDFkqJtmLnGgv6IqyH/lLHztZ3UqgdMUD8lBHk5Zai+PWGOZyLNwTR9ka5z0f/+4C2dDrRHTwNKAK+r8WsGVzySUiwYHV277Pktjc9DmY5qOqsqKiU+d0G9gWBsHtFvyv/XN9jlyD9Jr48lLbHJSdR4Icx7Kd0Yrn0mc6w0hj+i6VsO2kC8xQZgbmVjogXtEwupdqOxpzDIIthfQviMlb7aaXfz7kcdfQIcF0PJhYeuD85jg3Jwp1Ad15ZAH/MrKj9tk15IvEzBkmyiiFHBXWxYVevE8oqOoXGv+MM2aiOY3zoSCglwkWxp+Dc9t5jKX+/CEMMewHcrfReh+N4PHF2WKzfA7R5ZsqH8LL0DgTFrT7v2Z8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199021)(6506007)(83380400001)(26005)(186003)(316002)(76116006)(2906002)(66946007)(4326008)(64756008)(66446008)(66476007)(66556008)(5660300002)(6916009)(41300700001)(15650500001)(8676002)(8936002)(7696005)(71200400001)(52536014)(9686003)(54906003)(478600001)(55016003)(38100700002)(122000001)(82960400001)(86362001)(33656002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzhXcUxxVStKK0VrekN5WjZyQ0dKaUxQSHNwV0pvRXN6c1p4NHVoUnhmR1NF?=
 =?utf-8?B?c3BXTlZacTcxT2IzcXNPTk11MGw0bnErazF5TE0wL0I4bVFtV0RUUXlqWEtL?=
 =?utf-8?B?MHVVd2ZhV2VSczhzZ2pjTStXMUxqdUx6eTJhUXlTTjZRNU85RFUvMktQV3R4?=
 =?utf-8?B?cUg4MVJVeWhxZHZ1WGJoK1BJVmU2YjNuYTQraUJ6cDluSmxNaCtsb0VrdHBJ?=
 =?utf-8?B?NjA0V2ZLMGlMd0NTdUIzY2JMOXNEYWszc3RsZDRwNG1pWm1qYXJNc2JGT0Jv?=
 =?utf-8?B?eGtRSmE5V0FCOWlPMmdVRU5jbHBsT2tTS0VwbjRYYWhOUjNFNjkrS3dqRmVm?=
 =?utf-8?B?VnliTWQ1WCtvK3hacFpnT2hlSWdPR2E2a2U1Qlo3WHpvYWY2dGIwNEZQdzBm?=
 =?utf-8?B?aHZxWFpjVjB5SjJFSXRWYmNNeXJ2aFhZcWsvUkp5M1Q0R0pmRk1FVWZWck1D?=
 =?utf-8?B?MEhXQlZQTnB4SXNlWWEvTjdSVHBWOEZ6bHU1bUN2VTdGTUVwNXBmSENHWVQr?=
 =?utf-8?B?MWxIUE95T0hjWlRGQXJIcVpwSXlHdU16REFMVU9GaTZuSFlLMXhxYk82RFgr?=
 =?utf-8?B?ZEl6VFBNbUpQUkVHM2Y0SnFpQnFqRk5WNmhXQ1NSV3ppN25XR2t4ODc4bVFK?=
 =?utf-8?B?UkdDa3ZGMjJQakpubnBHVW1vb29xZTBTOVhxUGJITW93L1NWTmtOczg1aXJw?=
 =?utf-8?B?TFY5NlZ5Uk5BeDZ4WTlVR3p3NzRKMHdXYVNndDdQYXorT3o2b2pTRVdiVVpo?=
 =?utf-8?B?Tmh0UjJ4d3VxUWJPb2hpdWhsSEVFZkVManI4dlJCR3JpcjJiR0xQdndlZWJR?=
 =?utf-8?B?VVlpMlB0MGJ1WXR6TDBqOWNsbG1qZGxvVlNXRWkrcTBHOXdvdy9ybVpZMEJ6?=
 =?utf-8?B?TDZYbVAzQ1N3RHB0QW5KN1JEdlhMdDFrSlUraW9PRHcydWx5MXg0MnZLeE5C?=
 =?utf-8?B?MzRiOFdXTUxpaG5HTjNhT2ZEVkhsakpTTDJ6d0NkVTIzbkZjVjkrSldock43?=
 =?utf-8?B?QXBRU0lVaFBqbEVQeVZQaGVRQ1dKNHBhNGxCbUJMUTVpc1k2aHl4ODVxYU5j?=
 =?utf-8?B?d3dpWkdKaG5vd1JCK2VDSkl4TzRRWHZqQ0wwRGYyaFp0R0p3UFFsVXhrek9F?=
 =?utf-8?B?eFY0Y29rSkFrRFRFUHRJaktCV0pobktIdTBobEFVTXRxQmRNYlBMckk2Yzk1?=
 =?utf-8?B?SnhsMTBjVzhWUXJnRzBCdjFaNVJlSXgxd1dDanNpeTY5Zm9IVkRaNDdLNDFY?=
 =?utf-8?B?TVAxeVoyQk9JazZwMlJyL1FqY0IwUGxvMFV2NExpd3ZlSW5MQld1QnNvTTFE?=
 =?utf-8?B?MzRUT3lGWEc0b3RVcFNwcVRwWmNvTHFyK2Z0ajJENyt5NDM2SmFVNmtjdWxy?=
 =?utf-8?B?WlJKMENSdFRwSE1RY2dHeStLeVZlK29oeE9hVEZnVGpzU1VGWjFXUWdnWG1U?=
 =?utf-8?B?TXVzYXN2T0FGYUppYlA0T2RoU3VtRFZUbEVndFlmL0JjU29Dc0J1RkhMdmc4?=
 =?utf-8?B?aWxSZEJtb0x0TWZJWXhFaTQ3cWp0UzJ1N0FIaFk5ZU93aGNKcVNzcnc4ajNR?=
 =?utf-8?B?enZ4NHV1YnlYY1U1Rjc2Q1dETVFrTTIyTDAwbWJDSFNhNE1xZHQvRnk0ZkZS?=
 =?utf-8?B?WmtsQ2Y1eituazRwUWxXTStsc0RqS0FObWdUSEgyWXd1d05RZGIvNFBJZU10?=
 =?utf-8?B?SFVVdSswanhMRU9sVVhidlREcHBCcEtKWUxRKzVhSzdFM1FXMjcrSG9KK3hD?=
 =?utf-8?B?cGJwQkhiTzlJM0h6cFl4bldCdUtybkI2V1VkZ3NRK1REMUJaL1ZpdjJGS3dz?=
 =?utf-8?B?OS8rRnd1VW9LK0hCSTlHblJ4dWFRVk1nNTlsL2hNcFNaeTVVNWtxMjZLL1dY?=
 =?utf-8?B?UW5xTDFXZDhlWjMzaDhGUVQvdXFJN3hsTllSb2JTQ1lScUJVcmM1RkVDSitY?=
 =?utf-8?B?MFlBam9jbjh5TVcyaVlMdW0zdWMxK0hocHdyOCt4MlZVUXhmNDRJTnZMMk0v?=
 =?utf-8?B?TFRvS3pyenR5ckN0bndwanp6UWRpM3Jka3l4eklQRkFPaU1JS1hVbTVBR1Ez?=
 =?utf-8?B?NU1ZVjBMR211T3dtVDcycFprSGladzBRR1BNNjU4S3dSMnhYem5iUDdoZlNK?=
 =?utf-8?Q?zxgNjkF61VYkJM0yKFes4Ig/z?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a29a716-0907-45bb-bade-08db93f8d9b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 08:08:41.6555 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /hB2vxP233FnQwMYpfDeQYpXJqrw6K/53XGiztFIfLLW8gVMSLjsVAgQUNv3bnQwTDDJu7xi597hmdX3GxLou9yFcTpo/t1tMjVJAIYZdXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4643
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Alistair Popple <apopple@nvidia.com>,
 Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGV0ZXIsDQoNCj4gPiBPaywgSSdsbCBrZWVwIHlvdXIgdXNlLWNhc2UgaW4gbWluZCBidXQg
QUZBSUNTLCB0aGUgcHJvY2VzcyB0aGF0IGNyZWF0ZXMNCj4gPiB0aGUgdWRtYWJ1ZiBjYW4gYmUg
Y29uc2lkZXJlZCB0aGUgb3duZXIuIFNvLCBJIHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRoYXQNCj4g
PiB0aGUgb3duZXIncyBWTUEgcmFuZ2UgY2FuIGJlIHJlZ2lzdGVyZWQgKHZpYSBtbXVfbm90aWZp
ZXJzKSBmb3IgdXBkYXRlcy4NCj4gDQo+IE5vIG5lZWQgdG8gaGF2ZSB5b3VyIHNwZWNpYWwgYXR0
ZW50aW9uIG9uIHRoaXM7IG15IHVzZSBjYXNlIGlzIG5vdCBhbnl0aGluZw0KPiB1c2VmdWwgd2l0
aCBkZXRhaWxzLCBqdXN0IHdhbnRlZCB0byBzaG93IHRoZSBpZGVhIHRoYXQgdmlydHVhbCBhZGRy
ZXNzDQo+IHJhbmdlIGJhc2VkIG5vdGlmaWNhdGlvbiBtaWdodCBub3Qgd29yay4NCj4gDQo+IFsu
Li5dDQo+IA0KPiA+IFdoYXQgbGltaXRhdGlvbiBkbyB5b3Ugc2VlIHdpdGggdGhlIHVzYWdlIG9m
IG1tdSBub3RpZmllcnMgZm9yIHRoaXMgdXNlLQ0KPiBjYXNlPw0KPiA+IEFuZCwgaWYgdXNpbmcg
bW11IG5vdGlmaWVycyBpcyBub3QgdGhlIHJpZ2h0IGFwcHJvYWNoLCBob3cgZG8geW91IHN1Z2dl
c3QNCj4gd2UNCj4gPiBjYW4gc29sdmUgdGhpcyBwcm9ibGVtPw0KPiANCj4gQUZBSVUsIGV2ZW4g
aWYgdGhlcmUnbGwgYmUgYSBub3RpZmljYXRpb24gY2hhbmlzbSwgaXQgbmVlZHMgdG8gYmUgYXQg
bGVhc3QNCj4gaW4gcGVyLWZpbGUgYWRkcmVzcyBzcGFjZSAocHJvYmFibHkgaW4gZmlsZSBvZmZz
ZXRzKSByYXRoZXIgdGhhbiBwZXItbW0gZm9yDQo+IGEgc2htZW0gYmFja2VuZCwgc28gdGhhdCBh
bnkgbWFwcGluZyBvZiB0aGUgZmlsZSBzaG91bGQgbm90aWZ5IHRoYXQuDQpZZXMsIGl0IG1ha2Vz
IHNlbnNlIHRoYXQgdGhlIG5vdGlmaWNhdGlvbiBpbiB0aGlzIGNhc2UgaXMgYSBjb21iaW5hdGlv
biBvZg0KKG1hcHBpbmcsIG9mZnNldCkuIE5vdCBzdXJlIGhvdyBjaGFsbGVuZ2luZyBpdCdkIGJl
IHRvIGFkZCBzdWNoIGEgbm90aWZpY2F0aW9uDQptZWNoYW5pc20gdGhhdCB3b3VsZCBiZSBwZXIt
ZmlsZSBhZGRyZXNzIHNwYWNlLiBIb3dldmVyLCBhcyBkaXNjdXNzZWQNCmVhcmxpZXIgd2l0aCBB
bGlzdGFpciwgaXQgYXBwZWFycyB0aGVyZSBpcyBzb21lIHZhbHVlIGluIGhhdmluZyBzb21ldGhp
bmcNCnNpbWlsYXIgd2l0aCBtbXUgbm90aWZpZXJzOg0KbW11X25vdGlmaWVyX3VwZGF0ZV9tYXBw
aW5nKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHJlc3MpDQpBbmQsIGlu
IHRoZSBjYWxsYmFjaywgd2UgY291bGQgZ2V0IHRoZSBuZXcgcGFnZSBlaXRoZXIgdXNpbmcgaG1t
X3JhbmdlX2ZhdWx0KCkNCm9yIHRocm91Z2ggdGhlIHBhZ2UgY2FjaGUgYXMgd2UgZ2V0IG5vdGlm
aWVkIGFmdGVyIHRoZSBQVEUgZ2V0cyB1cGRhdGVkOg0KIAltYXBvZmYgPSBsaW5lYXJfcGFnZV9p
bmRleCh2bWEsIGFkZHJlc3MpOw0KIAluZXdfcGFnZSA9IGZpbmRfZ2V0X3BhZ2Uodm1hLT52bV9m
aWxlLT5mX21hcHBpbmcsIG1hcG9mZik7DQoNCj4gDQo+IElzbid0IGl0IGFscmVhZHkgdG9vIGxh
dGUgdGhvdWdoIHRvIHdhaXQgdGhhdCBub3RpZmljYXRpb24gdW50aWwgcGFnZSBpcw0KPiBpbnN0
YWxsZWQ/ICBCZWNhdXNlIGhlcmUgeW91IHBpbm5lZCB0aGUgcGFnZSBmb3IgRE1BLCBJIHRoaW5r
IGl0IG1lYW5zDQo+IGJlZm9yZSBhIG5ldyBwYWdlIGluc3RhbGxlZCAoYnV0IGFmdGVyIHRoZSBw
YWdlIGlzIGludmFsaWRhdGVkKSB0aGUgZGV2aWNlDQo+IGNhbiBETUEgdG8gYW4gaW52YWxpZCBi
dWZmZXIuDQpUaGUgcGFnZSBpcyBvbmx5IGludmFsaWRhdGVkIGluIHRoZSBtZW1mZC4gVW50aWwg
dGhlIGhvbGUgaXMgd3JpdHRlbiB0bywNCndlICh1ZG1hYnVmKSBjYW4gY2hvb3NlIHRvIGhhbmRs
ZSBhbnkgcmVhZHMgKG9yIERNQSkgdXNpbmcgb2xkIHBhZ2VzDQppZiBuZWVkZWQuDQoNCj4gDQo+
IFRvIGNvbWUgYmFjayB0byB0aGUgb3JpZ2luYWwgcXVlc3Rpb246IEkgZG9uJ3Qga25vdyBob3cg
dGhhdCBjb3VsZCB3b3JrIGF0DQo+IGFsbCwgdGhlIHVzZXJhcHAgc2hvdWxkIGp1c3QgbmV2ZXIg
ZG8gdGhhdCBpbnZhbGlkYXRpb24sIGJlY2F1c2UgcmlnaHQNCj4gYWZ0ZXIgaXQgZG9lcywgdGhl
IGRtYSBidWZmZXIgd2lsbCBiZSBpbnZhbGlkLCBhbmQgdGhlIGRldmljZSBjYW4gdXBkYXRlDQo+
IGRhdGEgaW50byB0cmFzaC4gIFNvLi4gSSBkb24ndCBoYXZlIGFuIGVhc3kgd2F5IHRvIGRvIHRo
aXMgcmlnaHQuLiBiZXNpZGVzDQo+IGRpc2FibGluZyByYW0gZGlzY2FyZCBqdXN0IGxpa2Ugd2hh
dCB2ZmlvIGRvZXMgYWxyZWFkeS4NClllYWgsIGRpc2FibGluZyByYW0gZGlzY2FyZCBpcyB0aGUg
bGFzdCBvcHRpb24gaWYgd2UgY2Fubm90IGZpbmQgYSB3YXkgdG8NCnNhZmVseSBnZXQgbm90aWZp
ZWQgYWJvdXQgbWFwcGluZyB1cGRhdGVzLg0KDQpUaGFua3MsDQpWaXZlaw0KDQo+IA0KPiBUaGFu
a3MsDQo+IA0KPiAtLQ0KPiBQZXRlciBYdQ0KPiANCg0K
