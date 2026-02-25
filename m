Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HgnIQssn2lXZQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 18:06:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CF719B38D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 18:06:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D8210E1B3;
	Wed, 25 Feb 2026 17:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+fAYO91";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF5B10E1B3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 17:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772039174; x=1803575174;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Oxcc9CQgtJyf5Msgs/pFSVXin2krttC1xjczfVazxYI=;
 b=a+fAYO91Fv31eaoWRg4SCm3pAAuuOKW6Mxr61FGNxZrVea8CLZoNq80w
 iE2fy+e5Nl/Fu98KFYgIYdZ4T/LzG5eZMBmLqjxKveSVZSslLZ5Ll8qvT
 nOg9Mf61VDMdNxHvRoKJL1JytK9NoOURLxNMMyqsefoXGHXjuM0a1Yjb8
 TKh0UrE7REjkG/NrXz1BY4RPnj9pk1fIir/MHRnToEaR0rEBGvIExtKPd
 q5VZi+1VY/gMAdJGEEESV5eN4+XNOjVBbTbLzaU+ORfCOPXODjCPIhQcB
 NlRmW1gCMHIqdk8LkcD5RZA2VwD1FvBWuAsWwRWuSb04ysANK8CjCo2a9 g==;
X-CSE-ConnectionGUID: lSoH7O1IT1GqhHYXvoT2uQ==
X-CSE-MsgGUID: XWVSibutSMCC55sZu/O61w==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="84544594"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="84544594"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 09:06:14 -0800
X-CSE-ConnectionGUID: hrmuSLjGQxW0lBrSLKidNw==
X-CSE-MsgGUID: lYhUQc1STGelO7ogk+EhAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="246847574"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 09:06:13 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 09:06:12 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 09:06:12 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 09:06:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V44ofWIkp/yXqJdzUi5S+n/enZAq2dixw3eP8ytm//itxptBqlBLlmAxVcK1HmGtPsc/NbR3Z4g+4zP4wwDrH9Uou9d5DHgIGvS8+dwt98J1rtlzsd3a1DvYteAKoIL9VovTCa1ntDZM6Js3v3OOjdFAEUTMwI25cJuzlA84KKiYRKP2ty+rZmyjEGkaNq/qi6QjyhdOUDogB7bY+WKIocB7T0aneWlMSoVdRLWQeB7rh60sPk8S8TrE5/yqgtQ7AJii0fooZ/2hU1N2MVZ/bzrhxj+JYoaf+naOWefTNw5asvY+tNkUVBGn4EI0cIAph3AXwiSOZikktRQbiGlhYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oxcc9CQgtJyf5Msgs/pFSVXin2krttC1xjczfVazxYI=;
 b=blS838mtP8jgf97lVM/jJHBGN7cDVORp4iv+ZGkWrmNW9wj2FKB/kVmEL797tTw8vqmBtm5tVkuu85pqsyY2JDHa2pu802bWk4VAmNbia/4HTFS0YDRWQSf0PQueW7F5Ojx2VsZSU1eBdVB0/otCepnsGH2rSuhjtI8xbZO2hBDwZfos0rvY+yBdQdOHgPGpYdOUuEIlF8ow6VIzw2ECneSbE3EO3TjmTwODl9aRZoFF/9VEaOVC9OZ9jKLWuQ6dCq7kAgIVeea/Ba3u20/CenSojamaat+G9f0K4DNlgaaF+XHN59Psl+vQQSWosrT3HRmHQrQL26HsDvzYNjiBzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 by BL4PR11MB8797.namprd11.prod.outlook.com (2603:10b6:208:5a7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 17:06:09 +0000
Received: from PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::4307:5ef8:b6f9:44c5]) by PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::4307:5ef8:b6f9:44c5%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 17:06:09 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@redhat.com" <airlied@redhat.com>, "kraxel@redhat.com"
 <kraxel@redhat.com>
CC: "nirmoyd@nvidia.com" <nirmoyd@nvidia.com>, "Kasireddy, Vivek"
 <vivek.kasireddy@intel.com>
Subject: RE: [PATCH v7 0/3] Virtio-GPU S4 support
Thread-Topic: [PATCH v7 0/3] Virtio-GPU S4 support
Thread-Index: AQHcpnC63TZqItUZakK5AgQfIusKhbWTpI0w
Date: Wed, 25 Feb 2026 17:06:09 +0000
Message-ID: <PH0PR11MB51127C2ED7FB044A4B98B136FA75A@PH0PR11MB5112.namprd11.prod.outlook.com>
References: <20260107182745.229481-1-dongwon.kim@intel.com>
 <87fd9bc3-4516-4380-8a67-1d2c2365524e@collabora.com>
In-Reply-To: <87fd9bc3-4516-4380-8a67-1d2c2365524e@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5112:EE_|BL4PR11MB8797:EE_
x-ms-office365-filtering-correlation-id: ded3d482-7160-4b61-f63e-08de74902bc9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: UVowdoJqdATgBvQykILZV/tqvTT88DdSB8+JPidQzsFrIqoK+llDf8rM5qwi2ZpT+U+NIzhaIrhEKXePf/vS94ShwLjMx69IWtVPMeu6QgmRlsiAloI79Jy7ZfJpGm+l13Icvxe0ZpGI7XFw0XjqOK5MJ6htt6k7UzXT4NA/jqvqlv3jBQvGqYkDbKtOuKEVIi1NIwAtBCBgmMDK+kZMeHbEAr0QFUAJEVMnL8H6VNz8D668ZVoVmsEHVPaHpHLH3UdAfPiRmj0rppHeRcE6ppEkBxcc3iwdRWmcqjzPjbWzBvVRC3i0VSLdOTJttGzmLP4QK7bfFyhaCYcoMF+b3l8V/2T+4NXDAxD/6CA2GwRgZ5y4m1t6Y6iB1Rfte3uc6T3+MRyc3iWPd6McBgyopjVRxlmidMtxqhONqPJPWfMIz9RVriyncrd/YJiP2gL1YkI1tOQMKz6A51xDuzndpRfTE4IjcObIWjQ6wHdbHgdhdWCawVSKaRmxm8Ro7OJDyaX788K0G18or1fvxtO4aITT4lcDPgEOon8BbCtCVuaWB2jSQLrd5dgzbNfOr1Vu+baU12xr8NEqsgQCG9GRZC5ZCalULDYTVfQqlVGrUmDiwyt3fCWFbTLHzsjDTylbpVB4sfuq99S7gXSvTDS3f6x5Cb69YtA2qHial3eyrnL/SCZtaIggnolE43lVVXcDmG1e5rYY2LgSgnEZDUjhMdDDvog9cR7Vo/kQAHdSCNY3hCh7tPPOrxNyydCHnZb/xMyKldfB+aUdMDDw6CqLqSK1RRaWW9dzPeVmrY/VX9U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5112.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MElhT1pjbVNEQ3BlMC9mK0FDV3FPOUg0cUhUQmxQL2gwNEcyT3BqZXJwL3Ax?=
 =?utf-8?B?ZVFpbEx5RXU3Zk0yNEtXbm9WUDB4a3dxTWM1bTFKM2NFN2NkaDlKR3B2WHBm?=
 =?utf-8?B?T0VTeER0VmhCcWYrWkZaeit0RGxQRjhtM0JOR0NyTTNBZWh1eGo2YXNEUTZ5?=
 =?utf-8?B?Y0RvSXordlMxZG0rVFZtZGJyckJkdnRSRXVNSWVpdTg2cjJoTkc1b0ZnMXll?=
 =?utf-8?B?c0cvekxNWjJZVjJ0WFpRSnk3SzhIYUYrSW9oTTRQNnlqVTJoSjdwY2c4THh3?=
 =?utf-8?B?MTZab2Y4UzhYcWphWU5qT3B6c2dJYmhPQnZYNnNwU1VWNjZqazlwNklkaDZX?=
 =?utf-8?B?RUlSY2VYdjhrL2JaWWtlM1M1TDZlVlMxZld0RHRmalFoaFU0blIzT2Z3YkZl?=
 =?utf-8?B?bzEweFhRcC9JeHJIYmtvcGRPSUFTbWxoVUFBY00zZ29zSjRVU2FBZXdQYjE0?=
 =?utf-8?B?eXVWTXlpRkZwNDltSFh3Q3oweDltWkhZMUNCTnltWHAwakRvMVpEZnZNbm1r?=
 =?utf-8?B?QXhmNlVFckVIVDJpc01UZm5jdEtGOUhlelEyTlFhNnoyRExxMlBYc2dlTzNY?=
 =?utf-8?B?aVFjQ0lMOFA3QmVvZXNUd1J6VGdXdi9ST3JSNzNqUms3RkdRcktrTk5TNFY0?=
 =?utf-8?B?ZDRqSUpRTHphbjlVZDkwbS8wMHlmNithTzBWNkE3K3U1emNuMFhGS1pvUTd1?=
 =?utf-8?B?WW5lMkNnMmE1azUvdFpiUWFmYXdwTHRUcmNYVjU5TDNuZ1JxWWkzb1AyNGR6?=
 =?utf-8?B?QTZLS0ovUlNveERKdU1oRVdxUEQ2SWJZTDZmeDgvSS9ZZlJjMVpmZXdNM3BJ?=
 =?utf-8?B?ZTc0b2c1S3pBYnNqcEV3aUU0SGRxbUZTbkhBUW5iUFB0eUpxMDNpY1ptc0FQ?=
 =?utf-8?B?YW11TGN5MzBFWW8rUUg0UFlwdHRnSmpzOEFKeWhVcHlDYy9leXlrc01FSVQz?=
 =?utf-8?B?LzZvMzFHbW13UHBzOVZtSEYwUmljT3NacERrcW9ZZGJIdSt4R0tIdncxNk96?=
 =?utf-8?B?LzhuSzVHNEVkelpmRTlDd1lHOFVqVjZrVDJQZjV0clY5cE9CbjYwZHZiMDJ4?=
 =?utf-8?B?Z1hOUW93U3dMTFRIaWw5eitYbmNWY0s1M01odUdOOWZkOXFhZ1ZKbWVBWTl1?=
 =?utf-8?B?OGRDUWVhQjRma3NXemkrcCs0ZS9ZSjdZTXpsOWNGU05neE5LbzZkc2MzREVL?=
 =?utf-8?B?TkhXVnNyRko2eG84ckg1M0lhMUxXSU44QWpYamk1MXFOUWx1YmdUQ0ZBZGF4?=
 =?utf-8?B?OWFaRDJ0ZXNDMnRwbHBYS3h2ZThTa1BFUzB0Mi8rV1hvd21JUytTWDRtc0ZY?=
 =?utf-8?B?WVhSQkxaZlhka25nekZmN3cvdDZmMlFtS2dHb0IyVnh1VU1IYVJMUmlZMlVC?=
 =?utf-8?B?M2wrYStNcS9Od1J0NDRlQUpPbm9sKzFpOS9BeDJjM0R6SjVudWM5TlVPek1v?=
 =?utf-8?B?ZXdXa1JLTGFZVjd6YWxXOXpEcHR1UmFkYm9BTkV1YWVWUW1IZzF6T0VtZU9v?=
 =?utf-8?B?UnpsNWpHTmdyMzF2NlRlUzliekRjME5NOUxpWXU2SW42QnoyTXgrTmh6YXdx?=
 =?utf-8?B?ejFRQXI0RTdzY1ExM2tDekExd21ReThqaXp3UmRiRTkyRGs0TlhsWUhFNXR5?=
 =?utf-8?B?VUF2MW9GcHdhd1F2QU9pM0NEVU1JMmhveFk1KzgrQmJiNHp1Uko2R2psK1lE?=
 =?utf-8?B?c2xpSlg2eHErR09MVEc4NWNxVDVGbHdKOWp0MndWZ1BzR2g0VVE4TU5TbjdJ?=
 =?utf-8?B?WTBzNU5ZKytlYk1GMEFlbVFYZnI1Nm5NV2NuK1RtOHBsOG10RGNrZFRRekNZ?=
 =?utf-8?B?anBiWGxvblBDeURLeStEQkxVNU9NR0RCNm9NVzBicitBdHp0K2FHMTdCcUZy?=
 =?utf-8?B?V3NiUUZEcW5ZL20xQ0JEbnpKZEhZZENqV0pLQlhyTkJYbmtRQ01WRVY3UWhv?=
 =?utf-8?B?bFhHMnFHMUxhMjNmbUNSaDhwbmhRK3NyK3ljenZzZ0dzOUpoZFFydHBBZEd0?=
 =?utf-8?B?S0VWaWZWSlAzYnBsbjdNak9ka2cvVksva29BaVhsOHFJR1p4K1hTR3cxQlp2?=
 =?utf-8?B?MEt0cWtRZlBpRWtua0s1ZldsRlUvd1h3RU04Q3hjeERvdGlkZFhNRUMrbDRu?=
 =?utf-8?B?UlJZbWQvZWl1cTFBYm1sakZ1OWNzNWR3UTYvanl2dm5OOEtvWUVNWFhiZjB6?=
 =?utf-8?B?Sm1Tc0p6TjFBa3Z0UjNKN2xySVVlMCtGajZlQkFVRUFaNDlVUzA0U3J1OHlp?=
 =?utf-8?B?V3BFNDBSVDg1UnlwVmI0cGxwSytwOUliWFRUNFF6OU1WTVk0SjJSMTZhbHI2?=
 =?utf-8?B?cmNwODVCRkdjSDJpVWVYRVREMklPemIwaWpuMjlLNE51dC9FZFlUdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5112.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ded3d482-7160-4b61-f63e-08de74902bc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 17:06:09.1706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O5+HbiNbXY3WtjFSmZP9CRhjqZyUNR43pgolnoyeJr/9noiqghFuATffbzLQZlN1PBI93rwtsTeEJHY14yrxBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8797
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.osipenko@collabora.com,m:airlied@redhat.com,m:kraxel@redhat.com,m:nirmoyd@nvidia.com,m:vivek.kasireddy@intel.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,lists.freedesktop.org:email,intel.com:email,intel.com:dkim,collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_SENDER(0.00)[dongwon.kim@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[dongwon.kim@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: C9CF719B38D
X-Rspamd-Action: no action

SGkgRG1pdHJ5LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERtaXRy
eSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBlbmtvQGNvbGxhYm9yYS5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgRmVicnVhcnkgMjUsIDIwMjYgODowNiBBTQ0KPiBUbzogS2ltLCBEb25nd29uIDxkb25n
d29uLmtpbUBpbnRlbC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiBh
aXJsaWVkQHJlZGhhdC5jb207IGtyYXhlbEByZWRoYXQuY29tDQo+IENjOiBuaXJtb3lkQG52aWRp
YS5jb207IEthc2lyZWRkeSwgVml2ZWsgPHZpdmVrLmthc2lyZWRkeUBpbnRlbC5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjcgMC8zXSBWaXJ0aW8tR1BVIFM0IHN1cHBvcnQNCj4gDQo+IE9u
IDEvNy8yNiAyMToyNywgZG9uZ3dvbi5raW1AaW50ZWwuY29tIHdyb3RlOg0KPiA+IEZyb206IERv
bmd3b24gS2ltIDxkb25nd29uLmtpbUBpbnRlbC5jb20+DQo+ID4NCj4gPiBUaGlzIHBhdGNoIHNl
cmllcyBpbXBsZW1lbnRzIGZ1bmN0aW9ucyBmb3IgLmZyZWV6ZSBhbmQgLnJlc3RvcmUgaG9va3MN
Cj4gPiBmb3IgdmlydGlvLWdwdSBkcml2ZXIgYXMgd2VsbCBhcyBwbS1ub3RpZmllciB0byBoYW5k
bGUgb2JqZWN0DQo+ID4gcmVzdG9yYXRpb24gaW4NCj4gPiBTNChoaWJlcmF0aW9uKSBjYXNlLg0K
PiA+DQo+ID4gRmlyc3QgcGF0Y2ggYWRkcyBgdmlydGdwdV9mcmVlemVgIGFuZCBgdmlydGdwdV9y
ZXN0b3JlYCBmdW5jdGlvbnMuDQo+ID4gVGhlc2UgZnVuY3Rpb25zIGhhbmRsZSB0aGUgZGVsZXRp
b24gb2YgdmlydGlvIHF1ZXVlcyBiZWZvcmUgc3VzcGVuc2lvbg0KPiA+IGFuZCB0aGVpciByZWNy
ZWF0aW9uIGR1cmluZyB0aGUgcmVzdG9yYXRpb24gcHJvY2Vzcy4NCj4gPg0KPiA+IFNlY29uZCBw
YXRjaCBpbXBsZW1lbnRzIGEgbWVjaGFuaXNtIGZvciByZXN0b3JpbmcgYHZpcnRpb19ncHVfb2Jq
ZWN0YA0KPiBpbnN0YW5jZXMuDQo+ID4gVGhpcyBpcyBuZWNlc3NhcnkgYmVjYXVzZSB0aGUgaG9z
dCAoUUVNVSkgZGVsZXRlcyBhbGwgYXNzb2NpYXRlZA0KPiA+IHJlc291cmNlcyBkdXJpbmcgdGhl
IHZpcnRpby1ncHUgcmVzZXQsIHdoaWNoIG9jY3VycyBhcyBwYXJ0IG9mDQo+IGhpYmVyYXRpb24v
cmVzdW1lIHByb2Nlc3MuDQo+ID4NCj4gPiBUaGlyZCBwYXRjaCBhZGRzIHBtLW5vdGlmaWVyIHRv
IHRoZSBkcml2ZXIgdGhhdCBoYW5kbGVzIHJlc3VibWlzc2lvbg0KPiA+IG9mIHZpcnRpby1ncHUg
b2JqZWN0cyB0byB0aGUgUUVNVSBvbmNlIHRoZSBndWVzdCByZXN1bWVzIGZyb20gaGliZW5hdGlv
bi4NCj4gPg0KPiA+IFRoZXNlIGNoYW5nZXMgZW5zdXJlIHRoYXQgdGhlIHZpcnRpby1ncHUgZHJp
dmVyIGNhbiBwcm9wZXJseSBoYW5kbGUNCj4gPiBoaWJlcm5hdGlvbiBzY2VuYXJpb3Mgd2l0aG91
dCByZXNvdXJjZSBsb3NzLg0KPiA+DQo+ID4gdjI6IDEwbXMgc2xlZXAgaXMgYWRkZWQgaW4gdmly
dGdwdV9mcmVlemUgdG8gYXZvaWQgdGhlIHNpdHVhdGlvbg0KPiA+ICAgICB0aGUgZHJpdmVyIGlz
IGxvY2tlZCB1cCBkdXJpbmcgcmVzdW1wdGlvbi4NCj4gPg0KPiA+IHYzOiBQbGFpbiAxMG1zIGRl
bGF5ICh2MikgaXMgcmVwbGFjZWQgd2l0aCB3YWl0IGNhbGxzIHdoaWNoIHdhaXQgdW50aWwNCj4g
PiAgICAgdGhlIHZpcnRpbyBxdWV1ZSBpcyBlbXB0eS4NCj4gPiAgICAgKERtaXRyeSBPc2lwZW5r
bykNCj4gPg0KPiA+IHY0OiBOZXcgdmVyc2lvbiBvZiBwYXRjaHNldCBvbmx5IGNvdmVycyBTNCBj
YXNlIGJlY2F1c2UgbG9zcyBvZiByZXNvdXJjZXMgaW4NCj4gUzMNCj4gPiAgICAgY2FzZSBjYW4g
YmUgYXZvaWRlZCBieSBza2lwcGluZyB2aXJ0aW8tZ3B1LXJlc2V0IGluIFFFTVUNCj4gKGh3L2Rp
c3BsYXkvdmlydGlvLWdwdS5jKS4NCj4gPiAgICAgVG8gc2tpcCB2aXJ0aW8tZ3B1LXJlc2V0IChz
b2Z0LXJlc2V0KSwgdmlydGlvLWdwdS1wY2kgZGV2aWNlIHNob3VsZCBiZQ0KPiBhdHRhY2hlZCB0
bw0KPiA+ICAgICBQQ0lFIGJ1cyBBTkQgYSBQQ0lFIG9wdGlvbiwgJ3gtcGNpZS1wbS1uby1zb2Z0
LXJlc2V0JyBzaG91bGQgYWRkZWQgYW5kIHNldA0KPiB0byAndHJ1ZScuDQo+ID4gICAgIChlLmcu
IC1kZXZpY2UNCj4gPiB2aXJ0aW8tZ3B1LXBjaSxidXM9cG9ydCx4LXBjaWUtcG0tbm8tc29mdC1y
ZXNldD10cnVlKQ0KPiA+DQo+ID4gdjU6IFJlbW92ZSB2aXJ0aW9fZ3B1X29iamVjdCBmcm9tIHRo
ZSByZXN0b3JlIGxpc3QgYmVmb3JlIGZyZWVpbmcgdGhlIG9iamVjdA0KPiA+ICAgICB0byBwcmV2
ZW50IGFuIHVzZS1hZnRlci1mcmVlIHNpdHVhdGlvbi4NCj4gPiAgICAgKE5pcm1veSBEYXMpDQo+
ID4NCj4gPiAgICAgUHJvdGVjdCByZXN0b3JlIGxpc3Qgb3BlcmF0aW9ucyB3aXRoIGEgc3Bpbmxv
Y2sNCj4gPiAgICAgKE5pcm1veSBEYXMpDQo+ID4NCj4gPiAgICAgTW92ZSByZXN0b3JlIGxpc3Qg
bm9kZSBpbnRvIHZpcnRpb19ncHVfYm8gc3RydWN0IHRvIHJlZHVjZSBtZW1vcnkgdXNhZ2UNCj4g
PiAgICAgKERtaXRyeSBPc2lwZW5rbykNCj4gPg0KPiA+ICAgICBSZW1vdmUgdW51c2VkIGhlYWRl
ciAtIGRybV9hdG9taWNfaGVscGVyLmgNCj4gPiAgICAgKERtaXRyeSBPc2lwZW5rbykNCj4gPg0K
PiA+IHY2OiBJbmNsdWRlIG9iamVjdCBiYWNrZWQgYnkgaW1wb3J0ZWQgZG1hYnVmDQo+ID4gICAg
IChEbWl0cnkgT3NpcGVua28pDQo+ID4NCj4gPiAgICAgTm90IHN0b3JpbmcgdmlyZ2wgb2JqZWN0
cyBpbiB0aGUgcmVzdG9yZV9saXN0IGFzIHZpcmdsIDNEIG9iamVjdHMgYXJlIG5vdA0KPiA+ICAg
ICByZWNvdmVyYWJsZS4NCj4gPiAgICAgKERtaXRyeSBPc2lwZW5rbykNCj4gPg0KPiA+ICAgICBD
aGFuZ2UgdGhlIG5hbWUgJ2xpc3QnLGEgbm9kZSBpbiByZXN0b3JlX2xpc3QgdG8gJ3Jlc3RvcmVf
bm9kZScNCj4gPiAgICAgKE5pcm1veSBEYXMpDQo+ID4NCj4gPiAgICAgVXNlIG11dGV4IGluc3Rl
YWQgb2Ygc3BpbmxvY2sgd2hlbiB1cGRhdGluZyByZXN0b3JlX2xpc3QNCj4gPiAgICAgKE5pcm1v
eSBEYXMpDQo+ID4NCj4gPiAgICAgSW5pdGlhbGl6ZSByZXN0b3JlX25vZGUgd2hlbiB2aXJ0aW9f
Z3B1X29iamVjdCBpcyBjcmVhdGVkIC0gdGhpcyBpcyB0bw0KPiA+ICAgICBjaGVjayBpZiB0aGUg
bm9kZSBpcyBpbiB0aGUgbGlzdCB3aXRoICdsaXN0X2VtcHR5JyBiZWZvcmUgcmVtb3ZpbmcgaXQu
DQo+ID4NCj4gPiAgICAgUmVzdG9yaW5nIG9iamVjdHMgaW4gdGhlIFBNIG5vdGlmaWVyIGlzIHRv
byBsYXRlLCBhcyB2aXJ0aW8tZ3B1DQo+ID4gICAgIG1lc3NhZ2UgY29tbXVuaWNhdGlvbiBiZWdp
bnMgaW4gdmlydGdwdV9yZXN0b3JlIG9uY2UgdmlydHF1ZXVlcw0KPiA+ICAgICBhcmUgcmUtZXN0
YWJsaXNoZWQuIFRvIGFkZHJlc3MgdGhpcywgYSAnaGliZXJuYXRpb24nIGZsYWcgaXMgc2V0DQo+
ID4gICAgIGR1cmluZyB0aGUgUE1fSElCRVJOQVRJT05fUFJFUEFSRSBwaGFzZSBpbiB0aGUgbm90
aWZpZXIuIFRoaXMgZmxhZw0KPiA+ICAgICBpcyB0aGVuIHVzZWQgaW4gdmlydGdwdV9yZXN0b3Jl
IHRvIGRldGVjdCBpZiB0aGUgc3lzdGVtIGlzIHJlc3VtaW5nDQo+ID4gICAgIGZyb20gUzQsIGFs
bG93aW5nIG9iamVjdHMgdG8gYmUgcmVjb3ZlcmVkIGltbWVkaWF0ZWx5IGFmdGVyIHZpcnRxdWV1
ZXMNCj4gPiAgICAgYXJlIHJlY29uZmlndXJlZC4NCj4gPg0KPiA+IHY3OiBBZGQgYSBoZWxwZXIs
IHZpcnRpb19ncHVfYWRkX29iamVjdF90b19yZXN0b3JlX2xpc3QNCj4gPiAgICAgKERtaXRyeSBP
c2lwZW5rbykNCj4gPg0KPiA+ICAgICBVbnJlZmVyZW5jZSBhbGwgb2JqZWN0cyBiZWZvcmUgaGli
ZXJuYXRpb24gc28gdGhleSBjYW4gYmUgcmVtb3ZlZA0KPiA+ICAgICBvbiB0aGUgaG9zdCBzaWRl
LCBzaW5jZSB0aGV5IHdpbGwgYmUgZnVsbHkgcmVzdG9yZWQgYW55d2F5LiBUaGlzDQo+ID4gICAg
IHByZXZlbnRzIHRoZSBzaXR1YXRpb24gd2hlcmUgaG9zdC1zaWRlIGhpYmVybmF0aW9uIGZhaWxz
IChsZWF2aW5nDQo+ID4gICAgIGFsbCBhc3NvY2lhdGVkIHJlc291cmNlcyBzdGlsbCBhbGl2ZSkg
d2hpbGUgdGhlIHZpcnRpby1ncHUgZHJpdmVyDQo+ID4gICAgIHN0aWxsIGF0dGVtcHRzIHRvIHJl
c3RvcmUgdGhvc2Ugb2JqZWN0cy4NCj4gPiAgICAgKERtaXRyeSBPc2lwZW5rbykNCj4gPg0KPiA+
IERvbmd3b24gS2ltICgzKToNCj4gPiAgIGRybS92aXJ0aW86IEZyZWV6ZSBhbmQgcmVzdG9yZSBo
b29rcyB0byBzdXBwb3J0IHN1c3BlbmQgYW5kIHJlc3VtZQ0KPiA+ICAgZHJtL3ZpcnRpbzogQWRk
IHN1cHBvcnQgZm9yIHNhdmluZyBhbmQgcmVzdG9yaW5nIHZpcnRpb19ncHVfb2JqZWN0cw0KPiA+
ICAgZHJtL3ZpcnRpbzogQWRkIFBNIG5vdGlmaWVyIHRvIHJlc3RvcmUgb2JqZWN0cyBhZnRlciBo
aWJlcm5hdGlvbg0KPiA+DQo+ID4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYu
YyAgICB8IDc0ICsrKysrKysrKysrKysrKysrKysrKy0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3Zp
cnRpby92aXJ0Z3B1X2Rydi5oICAgIHwgMjMgKysrKysrLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfa21zLmMgICAgfCA1NCArKysrKysrKysrKysrKy0tDQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9vYmplY3QuYyB8IDgzDQo+ID4gKysrKysrKysrKysr
KysrKysrKysrKysrLSAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ByaW1lLmMgIHwg
NDMNCj4gKysrKysrKysrKysrLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVf
dnEuYyAgICAgfCAxMyArKystDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV92
cmFtLmMgICB8ICA0ICstDQo+ID4gIDcgZmlsZXMgY2hhbmdlZCwgMjgwIGluc2VydGlvbnMoKyks
IDE0IGRlbGV0aW9ucygtKQ0KPiA+DQo+IA0KPiBIZWxsbyBLaW0sDQo+IA0KPiBXYW50IGxldCB5
b3Uga25vdyB0aGF0IEkndmUgc2VlbiB0aGUgcGF0Y2hlcywgYnV0IGRpZG4ndCBoYXZlIGVub3Vn
aCB0aW1lIHRvDQo+IHJldmlldyBhbmQgdGVzdCB0aGVtLiBXaWxsIHRyeSB0byBkbyBpdCBzb29u
ZXIuIFdpbGwgbGVhdmUgY291cGxlIGNvbW1lbnRzIGZvcg0KPiBub3cuDQo+IA0KPiBNZWFud2hp
bGUgdGhlcmUgaXMgYSBrZXJuZWwgYm90IGJ1ZyByZXBvcnQuDQoNClRoYW5rcyBmb3IgdGhlIGNv
bW1lbnQuIE5vIHByb2JsZW0uIEkgd2lsbCB3YWl0IGZvciB5b3VyIHRlc3QgcmVzdWx0cyB0aGVu
IGNyZWF0ZSBWOCBiYXNlZCBvbg0KeW91ciBmZWVkYmFjayBpbmNsdWRpbmcgd2hhdCB5b3UganVz
dCBsZWZ0IGZvciBpbmRpdmlkdWFsIHBhdGNoZXMgKGZ1bmN0aW9uL3ZhcmlhYmxlDQpuYW1lcy4u
ZXRjLikNCg0KSSB0aG91Z2h0IEkgZ290IGFuIGVycm9yIHJlcG9ydCBmb3IgdGhlIHByZXZpb3Vz
IHZlcnNpb24gYnV0IEkgd2lsbCBkb3VibGUgY2hlY2suDQoNCj4gDQo+IC0tDQo+IEJlc3QgcmVn
YXJkcywNCj4gRG1pdHJ5DQo=
