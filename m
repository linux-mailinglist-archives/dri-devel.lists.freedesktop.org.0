Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536CCD227B9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 07:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B03910E2C4;
	Thu, 15 Jan 2026 06:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jan/9Jih";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A451910E2C4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 06:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768456992; x=1799992992;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HIN7ZzdUv1y3H+DRIDhVePJH7/cEM0VTSDF2cLQoW5w=;
 b=jan/9JihNRQdKnjYZsjHY0RrRahkkncc0uqgjTQK4P92plq0+nSzWDzR
 cB36tAOW6myOKyXKVCEJ6XKRzetq/mneA+9YEmxG0sHnJdTvgsQab6Xrk
 H4b+GQdLozsSuAv+OLIpu4xJvHqe5JUFm08r+ZGmWBlmM4HZ+2MN7IaNd
 Pr2VuTYarKXRdUBJ7Dpxuo+9uKBY7Ip+7H0HMswVcRLe6Njho5PDCXy5F
 4XpRE7vDLj5levDyhW49GeoEcl8n8Vhd2NLEPzRIrZ+p4CimeX8OlJi0y
 Aubi5rE3qUzyYoMcseSPtZFfiH7geDgsudMb8OW5/2bGnlim1CJqTUsnt Q==;
X-CSE-ConnectionGUID: +dpPnRpHQr+eCZu/Z8Sn4Q==
X-CSE-MsgGUID: iCiP7eocS6KLl+jqogRcMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73392394"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="73392394"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 22:03:10 -0800
X-CSE-ConnectionGUID: Yg2UTgzLQyuDlogJWKR1zA==
X-CSE-MsgGUID: 5M40AjZjRtGSml+We7vC6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="209923380"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 22:03:11 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 22:02:46 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 22:02:46 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 22:01:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PUv+HPivywVYCXXs12kqnMnuRKdB4Pm6ZuqTTXvej9PM5OlLa1+ePZB2DqodTCOMDAvADYiyxX1zNJ4wpaB/rt3OTwgntXDt6EA+s4giqg9+wL3gjPrhHxkf/zrl5UpVFuMIThe8I8/AZNb2GjjVLdt/7zBm+wFXNjyyAweyIOI1NO4H/lzYrWja0tf/WFOCng0By8l/O16GyEfzx0DOf0eRZmsf+YcYxnGdpXBovrE4MWngH0jBYLs+xZ5DZbXymgh7OUIbbwNSKEYM8BEuarOCk08bIRWd7nbgt97fhn5GpjvgLkBseU90BZDwQ0D+72FT4amJvpAQ3ktHi72rLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIN7ZzdUv1y3H+DRIDhVePJH7/cEM0VTSDF2cLQoW5w=;
 b=X5hAYxrLI/j5jlwvdtyFaQG334+jlyoZqIYpRnFf8BDiFM1KMegrZzWzN3LBOGUVRS5XCcn8d1Q/zatq9oVrlLeq4TkLHmwoQxDs4jUyQmqthXLK6znVwiSNCD82RpocH6sOQ0NXMQmiQHjYHgQkIkhD1VJikmBsuUoHho2td03S+SPFaKxpUEMkPMvKdhT8f+nfvdeSexENQq94GAMkg0YYO76MvS/aK9PefbiYyuPJxdRwSgqyzdSgRTw6WHYasHU4SPRGkaEndAFWmPJkycHR32QW9gKA/7vN8v9T3GjbcXqgLOy2pcS+KDinJrMITZHgdl98L1Bd7FrZl6wurw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DS0PR11MB7482.namprd11.prod.outlook.com (2603:10b6:8:14a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 06:01:51 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f%5]) with mapi id 15.20.9520.003; Thu, 15 Jan 2026
 06:01:50 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Leon Romanovsky <leon@kernel.org>, Alex Williamson <alex@shazbot.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Yishai Hadas
 <yishaih@nvidia.com>, Shameer Kolothum <skolothumtho@nvidia.com>, "Ankit
 Agrawal" <ankita@nvidia.com>, Matthew Wilcox <willy@infradead.org>, "Jens
 Axboe" <axboe@kernel.dk>
Subject: =?utf-8?B?UkU6IHR5cGVzOiByZXVzZSBjb21tb24gcGh5c192ZWMgdHlwZSBpbnN0ZWFk?=
 =?utf-8?B?IG9mIERNQUJVRiBvcGVu4oCRY29kZWQgdmFyaWFudA==?=
Thread-Topic: =?utf-8?B?dHlwZXM6IHJldXNlIGNvbW1vbiBwaHlzX3ZlYyB0eXBlIGluc3RlYWQgb2Yg?=
 =?utf-8?B?RE1BQlVGIG9wZW7igJFjb2RlZCB2YXJpYW50?=
Thread-Index: AQHcf7Ya731KMBmbdUKQEGFm55D9srVSyUnQ
Date: Thu, 15 Jan 2026 06:01:50 +0000
Message-ID: <BN9PR11MB5276BDE754BD8D61FDB402E68C8CA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20260107-convert-to-pvec-v1-1-6e3ab8079708@nvidia.com>
In-Reply-To: <20260107-convert-to-pvec-v1-1-6e3ab8079708@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DS0PR11MB7482:EE_
x-ms-office365-filtering-correlation-id: f159da2e-7aac-4be7-e82e-08de53fb9377
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?dm5ORWtFWDRlakE5TkZ0c01XWFJjdE1ZbENraXovMkZBQmR5TG1vb1hhN3Bz?=
 =?utf-8?B?U0xQK0x2aUZFclVhK1hZOHN1elRkNUlQYkpqSVJ3SUpZT2xDYVo5UnVRY3I1?=
 =?utf-8?B?TW9XV2RHdVNwS2lVeWk0T2xCcFo2Mm1xaGRIOUhWNGxiM2tmUTkwRUxTV3Mw?=
 =?utf-8?B?SUplTTYyVnBycUdraXVSektNa1daSFN4VUVId2Y3UWZURWtRcVNKOUs3L1oz?=
 =?utf-8?B?a0ZnVnpGR3dMUm5yKzdsR0lNQWdxTnM1d3Z5SGI3U2lyNU5nbFc5WHBqMFZW?=
 =?utf-8?B?bEZCSTBjTk9sNFYrdStDVlJPdTVlcmp3cHUwSUtLTzdkUURVTkEwTzlKTVpQ?=
 =?utf-8?B?Vjk2SDlVeDgrZGo4ZzJTOTlyTHQvVVI5SHBBT0VqK3dZVUsra1k3YWZUYWp1?=
 =?utf-8?B?Z2dsWDlldGprSzhrUjZtRHYvODg1Tm85d0Q1MXlCZGpTWkpLbkxUNXhHQUd4?=
 =?utf-8?B?ak9pSDhpL0VTN0VTN1hJVVlHNC9DOFpJTXpQR3NPVGFYS3JVNGk3clpQNGpq?=
 =?utf-8?B?VlFaaHJoMDVHajVMZnVKcWU3dFhYQkwwZzNDTk8zVEpPNmJ3YnhOcHgzRlZu?=
 =?utf-8?B?QVVNTVU0VDI5QzIvK1FacUF1ZFNNQzRUNVRnMGlPOVk0K3lwSThSbEZyWW1V?=
 =?utf-8?B?SXZINHczVG1YdWlRSzA2Y1diVS9iTi96S1FEWW1qT2IrR3dkbFB2ekZPKzhF?=
 =?utf-8?B?VXZVcURRNHpxUlFnMkhVK2hJL3RIOGI5TWFqWjBXOGtacW9qVmZSc0xLaW5I?=
 =?utf-8?B?emlHbitoRWRzWTR3V25yMG9oK1RZcW1TYW9JMzJWR1p0TWt0c0tCK2hWZlJk?=
 =?utf-8?B?dkhjTEc2VkF3Yk8vY0lJTEp6aWhPeHcza3FFSlNBYUFJZGl0MnFuNDZ2ZVpW?=
 =?utf-8?B?dFRlWGlwODhOM0RxdVlPSTVLNXNWVXJJcUJ0RE12UEp5ZktZNHdPeUsydmtL?=
 =?utf-8?B?d0VXTUFiUHRBUGxPU2FKYzA3cTBvckZjMUp5WGxVQkFpcXZTbHUrcEptWnVl?=
 =?utf-8?B?WVZEYkRaRGh1SGF2Tmk1ZXo0R1F0cCtrWGZmR0lvMHNBckVyZEdpZmpxRENo?=
 =?utf-8?B?NldBNkJyN1RlQm45aWlhbnMza2tPVjdjVlJFS0VlVzJtV3p5UGpZZEY1ckxY?=
 =?utf-8?B?a3huVkErMERvN3FqQkdpRjMyY3picmJiTWFpNXdRWi9tbDZrT05qYllwWm1h?=
 =?utf-8?B?VXd1NjdBWSsyTE9NZ0x4d3NiVkYrNTFCTUQvKzllL0xIZTVTZGp6ak1pMk9n?=
 =?utf-8?B?aFBIQTlTcnBVT0VFRDFEQ3NueHd2ZXpUK3BFZXY4TUM3bkRiSC9qT3RRQkhr?=
 =?utf-8?B?cE5sUnFtV2JSNnVXeEtReGZKQTdmNFI5b0VMTmR3ZVM5V0crQm1PS25Ldk1Y?=
 =?utf-8?B?M1JoeDlmbkIzVHJ6M3phTUpnUnhDTUN6emlveXhma2hmdTlWaTBudVpLaHhT?=
 =?utf-8?B?T0tqblAwRHBjbzF4NmJNdm14TVMyT1NrT0QvVFJ1QzAvWG9JeEUvbHhyL2pC?=
 =?utf-8?B?VE9ZLys5dW5EUU1CSEoxS2djZVBwVDk2Y3UzVDdKK0hMRWFCWnZOaFdCT29Q?=
 =?utf-8?B?S2J0TW9mWGo0b0FmOHhKZW8yTXo4OE9rSU9vK2lBOHNORkZrNGhpcnlHS05O?=
 =?utf-8?B?Ukw5SWdtZEpmRWRxNzd5WGIrOWtncGJhaWw3cy94VVd1VVVEeDQ4dEM4dHVs?=
 =?utf-8?B?Zk0yYi9jSHYyNTFoOVZXZ2VURWYxOXk5aGtWRXpwYnAvTHIyZlBIY2tlTmxj?=
 =?utf-8?B?RThoay85ODFRUWcweWY0ZjYwOXBiVUlRVE9ZVUhLZzM3ZWNlVnZVRW4rajdi?=
 =?utf-8?B?cVRyalNvVFZoNnVQK2Q5amJIbExXc0ViMnVrRHY0UThCZ3JXUHdDS3I0cEhO?=
 =?utf-8?B?TUxZckdzMENsTytOWVZvT3BhVFZFNW5yK3NNZ09MMTF5RFhVN3cva1Z1NWNG?=
 =?utf-8?B?bHJTSzRhdjJKaUFFaU5ZSTJobWZXZWJlYi92Z0ZqUFVMWmxUQ2lSZ250SE55?=
 =?utf-8?B?QTJkUFZYM3hNS1J4azNFdDltZDFJdHdoQmpTcm8rL0JUYnhPbDVyYUpQZmRF?=
 =?utf-8?B?TmUwOUIyKzhpek5HVlM5cStKZyttWG9HYTVtNVBQbE5QT1E1SkoxV3pIenZR?=
 =?utf-8?B?M2VqWHdVZXJpUjRoRmxuT0hlK0tPN20rUHNoaURyVWo2c3F1RmFoeGh3QmdY?=
 =?utf-8?Q?tUWl26ojpaXegDVUMRJftV7L0lbJ866yShWDOchg24PE?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTFieGM1ZTU4YzNxdmUyeU1qdjRDbGRWR0N0RndaZDI0cithOUZUcjlOaDFY?=
 =?utf-8?B?MGJIeTBuSW9CTHNLbm9ndW53U1hHMWYxT3dOejg1c1JBSUpVU0JxWlhiY2tT?=
 =?utf-8?B?YmlPTDBXNFVRckhyU09rWERCSGw4eG5PR3haN3QvVklvWlRLaFpCeEFtUUk4?=
 =?utf-8?B?ZEppTXErVktjbW5BTXcxR2VjMHIyazgwZnpBTmcrcWh2RFJZenkwVUJpR0VH?=
 =?utf-8?B?VkF4L2hsUHRRNmpPRm9Edkx5MkRoQS9HUG1MS2xRM0JQWmQrNUNDanYvQUpk?=
 =?utf-8?B?K2t2b2MzWmw5TkwwdWQyd2phSkF5YWlEdkpvbXB1ejdPa2FNTXZQUWJXOGVJ?=
 =?utf-8?B?cGZtdFpQOE1rdFdSMFdxeXRnaUptK2Vlb0pBTE5kYUxsckcwdHZ1bDl3U0Fs?=
 =?utf-8?B?WXZoa3VHMGtFY0RCWE10UzQxZnExZUk1dW9XZ0xERzBKWUM4VWNBbUszMnVN?=
 =?utf-8?B?UXNqcnJTbEJjakRmSW9acUNnYXZ4M2tqL2xablFXbVBTTFVyWkNlb3B1UWJp?=
 =?utf-8?B?ajZCbEMwNzF0cEFhVnFscGtMcXgyZERqajFNSVFFSEd0NUpUMzJLNUhyREdJ?=
 =?utf-8?B?OGxId3FnQ2ZlUGxyVE80WVZva2ZlVVlWaDFjZWYxVzl0cG55RzNIUjF0dmRP?=
 =?utf-8?B?c08xeE1pemVtaEFIb3hpdk15MmNZSU9MZDR3UmxxbHI5a3VaWjFaYVVOSytR?=
 =?utf-8?B?emM0Y29aYXE2am5ZNXNldWpXUnY4UVBKZUlKMW1oczFTbmM1UHM0L25SVWZE?=
 =?utf-8?B?d29IUC9yWmk2YWRBK052dUpiNThZbU9mU3ZuTkJKMXJFRVFxK1JSdUxQUGF2?=
 =?utf-8?B?bHlHaTZTeXljQXlDajRSc20xUlF6QlFkSUtRaWxtZmVDVG1SNzlRZVp6WkpF?=
 =?utf-8?B?WDlEZ3c2NFFVSnp2UVdySXAvQ24wUWRaNjllOGJ6U2NiVlgzaU1aNXRxSnc5?=
 =?utf-8?B?akRaZlY2MjVCTFZCRCtabGZvV0RBUE82SHdLOHROYWtvN2dtZ1QzcUs0WmFV?=
 =?utf-8?B?WitlZHlkNS9xNGJ0RjNSb2h4c2ZLbDJzeXN2L3Y3Y3laRndvU1dYYnljaVBv?=
 =?utf-8?B?S2gwMnN1Q0VuUlYwU3Y2NUc5cUErUmtzVDVQYlZoSUsvL0VZaTB6dEVmcUp4?=
 =?utf-8?B?Q0VHdGR1aGl4TTE5QlQ4Qlc0dEhnZWhIbk5reVU1azVTZXVuZGRoZ0RxNUNk?=
 =?utf-8?B?S2RZUldRVldYd3FmMWlydEQ1SUY0OEs4OHh4R0MySEpvdWpyM2s4NDU0b1hT?=
 =?utf-8?B?MzBqaTNLVlo2Ym5QMStQekExeU9udDNsTnV3YXBZSUlXS2dPM2xYQUQ5K2pQ?=
 =?utf-8?B?SUp2Ui9iQ3lBTVI2WndIcWY3VmNiQ0hXQ3poK0NwbHlEVmM5cmROWkgzRHJJ?=
 =?utf-8?B?QnFNT2h6MUdZVmNRQkFJMlFqSnZKTGpUN24rY0pJMm1WdFUxa3VmRitPRjd1?=
 =?utf-8?B?ZFhjN0V6MEJpNFNaZGFaczB1KzBtNlVwNmJSaEtMK1ZZMzlCVWd4QXJFOGtz?=
 =?utf-8?B?Y2ZBdXNRL3VoU3dWK2JYMHFUTXNLUUw0U3lrOVBjVnBzYWlySGhHYllrM1RQ?=
 =?utf-8?B?eS9zSVlRK0ExcDJ1SjRMM052YTBRdGZHYjZIRGUwSE95NG40Y3VBbjE4U0Rq?=
 =?utf-8?B?aHlyR1hnMmJvK1F1cnJTb0Q5Nzlia3NiRHllYUFjN1hvQzMxQ2o2RXFoTU91?=
 =?utf-8?B?WjB6eEVlR044TXJRd3lkRXdBTHFPVEFqclExNkdMT0pyNktOUUVYRUUzN3Z4?=
 =?utf-8?B?UzlwZE9kUUl4Yzlpc3FUL21zT1RBN2pBMkpzQ0dRcWpGWkZOekp0Q0MzWTVv?=
 =?utf-8?B?d3RlRy85VVNwTmpTTGNpOVdIV1hlMnROYmJFZWxWcklWTHpsUWtGaUhXSDd0?=
 =?utf-8?B?UVVJOU1ZeXBERnJ0SUR1Wnd6c0ZLMERlR0pYK2JUdncwUlVsRzFqZ0ZsWEQw?=
 =?utf-8?B?aSs1UjAwZWhsSnNlbDhQcVNMR0VCRWFhSzZzSnpMVGVzd01HRVhyQ2hqOVZn?=
 =?utf-8?B?N3FKSW9TcitpalN0SVhzVGVkMEZqVDliK1VGSXNKN0hNR05FTmx2UjdTT1Ft?=
 =?utf-8?B?aG5JU1NsSGJvM1pzUEhqQ2EwbnM5TWZIRy9WUGVEd3puS0ZGeCtLTUk5d3B5?=
 =?utf-8?B?aWxodXUvdStGbzNyZC9DczRXUjVWdythQTRwTG5GK0tGVE4ySTZKWkhaTU5q?=
 =?utf-8?B?TFNpeitxa1JzeHM4K3hUTWpERngzVG9MM2FVSjAzWVRGS0V3Qm4rSk1VWFBV?=
 =?utf-8?B?SHc0YTRQYWw5c2VSMkl0cnpRcENleGY5bXQ0SkxYdTYvY3FqRUVMWG44OFFs?=
 =?utf-8?B?a3VydGd0eTV2WjF3QTBQTzNsdkkwa3YrSWY3TDMrdEU2aHBwZW1rZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f159da2e-7aac-4be7-e82e-08de53fb9377
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 06:01:50.8835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YILOnYg5vW3bmXP3t7hM8V7EF2/Yal3jTjumKEIdy37TTtv+ChC7AIM1f4liaRy7q2WM6ssH/1CgeXIMACfMYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7482
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

PiBGcm9tOiBMZW9uIFJvbWFub3Zza3kgPGxlb25Aa2VybmVsLm9yZz4NCj4gU2VudDogV2VkbmVz
ZGF5LCBKYW51YXJ5IDcsIDIwMjYgNToxNCBQTQ0KPiANCj4gRnJvbTogTGVvbiBSb21hbm92c2t5
IDxsZW9ucm9AbnZpZGlhLmNvbT4NCj4gDQo+IA0KPiANCj4gQWZ0ZXIgY29tbWl0IGZjZjQ2M2I5
MmEwOCAoInR5cGVzOiBtb3ZlIHBoeXNfdmVjIGRlZmluaXRpb24gdG8gY29tbW9uDQo+IGhlYWRl
ciIpLA0KPiANCj4gd2UgY2FuIHVzZSB0aGUgc2hhcmVkIHBoeXNfdmVjIHR5cGUgaW5zdGVhZCBv
ZiB0aGUgRE1BQlVG4oCRc3BlY2lmaWMNCj4gDQo+IGRtYV9idWZfcGh5c192ZWMsIHdoaWNoIGR1
cGxpY2F0ZWQgdGhlIHNhbWUgc3RydWN0dXJlIGFuZCBzZW1hbnRpY3MuDQo+IA0KPiANCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IExlb24gUm9tYW5vdnNreSA8bGVvbnJvQG52aWRpYS5jb20+DQo+IA0K
DQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo=
