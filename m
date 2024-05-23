Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BEC8CDD14
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 01:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DD110E2A8;
	Thu, 23 May 2024 23:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQZIKz/4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E7210E2A8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 23:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716505446; x=1748041446;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HTjHdBGmU8i1Cu/GmrSAbmpPryB3FSRCejalDIM7cHA=;
 b=HQZIKz/4TbITeE0x0RqZdMSJN5eH/hxWmoxIxz8Wip3LrqUByCsmmdNy
 K4tW5qnUhd4kQapq9qXd5uX7Aq/tyZFSDFnb0g/7/+u8GA92W6eFAhchs
 KiDlPfdatAJgmAlJTQHC8AbY/zZ0iQpNZJHAttlNpHEwMu9jzWdtMo9U6
 ZvpXi+2U2MWB/jncGcgfMN+90io7Y8qmBnypBrfR5VFeJVXB6v7PAhHCa
 /th894n0KJtVC6yKfblta24saV7wE+N0w9wvb7Un04TPcqbHH8Ml1Iyv4
 EQLgaZCWKJvvVPmXwzbebeDTtE8KSM2DognKtEzlf13eSn3TdTJKbRZK6 Q==;
X-CSE-ConnectionGUID: VAKOrpSWSHmmopdlfB5vfA==
X-CSE-MsgGUID: QprPr7M7Rmiv40zV7bVRiw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="23529748"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="23529748"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 16:04:05 -0700
X-CSE-ConnectionGUID: d++5VGwGQR6RTRpXwN69OA==
X-CSE-MsgGUID: ZTxd5VqVR3aokEUsYnwhFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33909611"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 May 2024 16:04:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 16:04:05 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 16:04:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 16:04:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 16:04:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=It6ZECgb1qCRW9AL3yU0YzK66dc/HckGy4E0zRdZqK8u3F+j/OtLqx0dr30Mv3zxWBkV8/cKGmdPWYuaAote31PuAbMDxzB1ENbKQBoMOnELOWt+N5inz7dVY281RL7oFj2ky841x3CyChFO9wty3vPJU4QMyMdi0kAkM62olamIc4rgEekuxlyxzz6tRnCpLz4oSY+wt9ORygpSpEdS2dw4PMNOevN5cT+SJRVhqjoAWc3VG4K4S1pQTThyjk6molpnMSXXTWTwnWFKe4ANgC4ELXMEImqs4AWSj0b+xpZBC2PC8AkaNC4ih1BEvJO0mB25dtpx4xG3G1zQjVH5AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPxGvrEo2F9osAM0oRy5cKqcbetGbj9TIKYUdthm8UM=;
 b=IVkgtX1hagtQyDDBEA0aTG0kyaT5TLnyZ8qS+LDx79rNZZ68pT0z5HxvJ71PRIe2z4UlK8d8c1bbVLxNOXNARQMIVgeCzZiPdh0G+Ubhw5CqkcN00Unt8mqNqvysK7bvb5Jdo+kRMsLbZ+XVmHrDd1wkiGruNTr/PQ2bfjjw9Uy1M6BtJCRBmloone9GHNtpJiW/0d4rQV+HFKTK7yRlKhHLevSBvxGyo0EBYZ6EWDzipCJmfXKF/xxF/t2ATdMy8SPDW31sLo779p7UK+c0OTe+/UJxVt8OplQm5NMT2vJISkWhJsm9cGVq3oat3+YyveC57sUWZKOd40oe5bEurA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH7PR11MB7049.namprd11.prod.outlook.com (2603:10b6:510:20c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Thu, 23 May
 2024 23:04:02 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%6]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 23:04:02 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, David Hildenbrand
 <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig
 <hch@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>, Peter Xu
 <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, "Kim, Dongwon"
 <dongwon.kim@intel.com>, "Chang, Junxiao" <junxiao.chang@intel.com>
Subject: RE: [PATCH v14 0/8] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
Thread-Topic: [PATCH v14 0/8] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
Thread-Index: AQHai+GJO4E9iP7BGkyoVCTFyhfSPbGkZoWAgABX/oCAAJ/5YA==
Date: Thu, 23 May 2024 23:04:02 +0000
Message-ID: <IA0PR11MB718509B82C7B42FDB7E026B2F8F42@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240411070157.3318425-1-vivek.kasireddy@intel.com>
 <CAPM=9tyuX7DKxaQ1zT7b4NYqhnjA3uLHK-kxXgeiubTZcy42=w@mail.gmail.com>
 <awodz2vwnicscpyoqrp6bqdtgetv3h7wvifdxk4u7bvlczspog@qgy3isyuwkfp>
In-Reply-To: <awodz2vwnicscpyoqrp6bqdtgetv3h7wvifdxk4u7bvlczspog@qgy3isyuwkfp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH7PR11MB7049:EE_
x-ms-office365-filtering-correlation-id: a60f877c-8680-4357-fc98-08dc7b7ca31c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|7416005|1800799015|366007|376005|38070700009; 
x-microsoft-antispam-message-info: =?us-ascii?Q?TaqP4+igHVJQAgZNNMTtO/qJ3vuLhNhmVz+MpJ94bdxtiQxTjJP1Zm3/yHte?=
 =?us-ascii?Q?1BCFQFCpCY3wVg7rRUa4rxydyACPLQGlNz9pIlH/SZazvYlO0kK5THlyRcSp?=
 =?us-ascii?Q?kbTT5+djhBZqniBI85UrzYvXgDzUsd9fQLFdPNKBBVOOoEOK1Y3XDf00te1o?=
 =?us-ascii?Q?Q9M9PYtepBjrl905A5EgbSjXohkfIJDsLZ1qAODIFQZT4NlrkAK4fIurXtmN?=
 =?us-ascii?Q?kSxSGbNNYMbCrSNv/k1v2uUAdS6qfS0p21ruuAA97k5UySUdafWb2mD2RkED?=
 =?us-ascii?Q?aHTzySuKeE9cv+ztRWlcpPC8MlFpGFzuIFfGoHMoSL8V0YcuE7ybNC9pnIE0?=
 =?us-ascii?Q?MMHOuJ5yO3ndSqrtlmChUYBcBr77OtExD8oEK8tnEggYgVCcNQzJ69fneU46?=
 =?us-ascii?Q?LEuyM7bgQOHSqTcqbiFJaenBegLNK67i7eLrX3n201MqUVjjMDYn0z/7XVGc?=
 =?us-ascii?Q?qNSRus9CxGW2IXs1Yb/YOVJu9zXYulRIsdoSxyYP1/1QSMbH5gg0C42Uol5Y?=
 =?us-ascii?Q?NvVKf6vwv08zhz1xyHjejAoa6LV1CiB3vzLJVcLsNZJ1lGyaAz6QICL3htzk?=
 =?us-ascii?Q?OJEsUwXWzxul2VKcbFHw6q0uvDTFmOrrBjEV//t8Zm2A5uWkYUuwUH3hgPU0?=
 =?us-ascii?Q?ivITnjBt+tuvL0PoFn9IUJ3CPyg+PWzzgOAZ9gaj11fngamAXrxnmHy43FgT?=
 =?us-ascii?Q?mDRufbX9WsWDc8p82tucA1Etgfm5XpBEvjgoWdXwftz+Ryi/5/paMwT3omuk?=
 =?us-ascii?Q?zL8/HsNAGJprNGEwnRCdCJ2ld/vfl9sQBefnvbIndxb2ZY712F9/1zl48uGP?=
 =?us-ascii?Q?MkceIwCluTvJiT8QArA/Uia96v90wzpHVQZNmhG56I4pBJx7lq5fxorq21Q1?=
 =?us-ascii?Q?WUfPTyQM/0O3D37TN+1bbslFrA3uQCnyJIaLjfAs6rclFReIqnt00pzPfBis?=
 =?us-ascii?Q?SM7hez97+j14q9OT+T4PjebiOk1vH0kjAzfbB3KSNkmj4ZdlKrdM5Vjv0uey?=
 =?us-ascii?Q?BTEm7xnsB3bAhW/SVPNt1sEJXIgWjP5JuxzSxZ3CccFO86KSf5N91UltK0dm?=
 =?us-ascii?Q?dRX7daxC9+pz1Pg65pwxcGzANK3896FZHZrB5UmDkK79NEyPcTHYZH3RLKxB?=
 =?us-ascii?Q?ItYrBzBSree/5/2CQY3S0GS0ocNukGUfDWiMnk2T5n9Si+0W6Not6kLzVyhA?=
 =?us-ascii?Q?N2eLiKs+9Q+hxhxw7665kAV9+yx1urjZDcbL9+GO/BVhJA16lzTOV5LZg+fk?=
 =?us-ascii?Q?SYqaLLq78OuOL4qF8igvNBX2/gWWkGtkrrEQNHirAZeMnQSYm2vJGvMCCbQ7?=
 =?us-ascii?Q?/SXEyRhk8tIXVX6WvN9ctQI4Zg3nplVGYMc+5Ya/r763dA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(366007)(376005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0iBfPyguKpse8Lg4DZVUqKZwlEUf/FZ0GNTD4hMtWkmRcBQimxxcbZ2W5mMP?=
 =?us-ascii?Q?cpZv/gUu0bOAhPypUaW+j8ybRVGy7rLOufc4TEZI1Rbbn94zdWGYfYvx2Efe?=
 =?us-ascii?Q?7zLhps/fPEjgt7YpPAb5kjbSnpYmnwM9LZ5h+xAxeExEG5m/Cete95owYa6S?=
 =?us-ascii?Q?MlhzDf8hItjGEbG7lVJb4QuuUVeyqWO/S6RnXlEC4crH6Ief0qy02g4+PLUf?=
 =?us-ascii?Q?BAJwkUbEbH8/x/F+bxIV49NudtLuqRTZSbPR7w0j/gjnp5rS00NljGNuFAxL?=
 =?us-ascii?Q?7xpg3vDAWC33NjgTXhSIsZAKGkqk0mTb2BmqOG95pzmXMvzt3iAIf0L3QQFX?=
 =?us-ascii?Q?932bhb/NcsYqPqWR14QQ/AlHyXGgtXD7ps9TDvirJzJQpAFncfvZ1/AOo3Co?=
 =?us-ascii?Q?IMdqqePWw+Gc+/ACArZaFg9baFEHq1CEqJlfYvqWrT/wd6E4a8TPO3C1rEVQ?=
 =?us-ascii?Q?Q5obxqKtz2iaBriGEEB8a3BiDqanQsEhy+//qWXIe4K+5/hxAgL7QbuWHjO3?=
 =?us-ascii?Q?KYoqgs5sgXUl+i8fTPDZdiGP1HigxWjzVQnYiCbhzpry+wBp6SOHLTsmzJ+2?=
 =?us-ascii?Q?UdFip530aIIcnz9PnYnenxdtPvwTA+8VFf7M2MvznqOvzPjwgrXJA+PTFqov?=
 =?us-ascii?Q?oVfRSjf5Pv01KArGdPZHZzsfQRhfPdOKzSiCyeHYNVnAvuAgN+tR8Rlxuzu3?=
 =?us-ascii?Q?SlZtiADAaWdkBT/rYCtCk1ZQWf1siXWk/8igM9/eCSavDwOVaSJKFNLGh8hs?=
 =?us-ascii?Q?GJOZbG1KHCOl9p9mXNHoSLFXVVsTYTU1Ew5qPPNblTYZsmlYf6nEAaChatfP?=
 =?us-ascii?Q?/VwdzJoWq42klmSPKJcXZ6RDcM2/io34ApMsBuSydZKTLm/INBXzUnoM5eeS?=
 =?us-ascii?Q?0NYl2xkD+IFZqtoOIQ83JJMEkD0ZjNxa7FkR9SXZkn9JwBqZ48XYGj5CcP7u?=
 =?us-ascii?Q?enHltg6p3bPPF5Hzd49tHiYYMumyjzv0pp8oZq+Sb7+UWdkcB5Q39oQ3cyOG?=
 =?us-ascii?Q?ZnsE406inNnXBVaMfvJwq4/u/B8JsoBHQW+P04MrFKAWvQyrB2Wns2wj8thO?=
 =?us-ascii?Q?08E/xZd97BImQXKDJaSwKPEx64pk1xALNT6yulUJaVn4juT5W0fC7ox6Fn64?=
 =?us-ascii?Q?Vz5z7IU/d5f8Az1mxjrH/sFpPS7ANTEtBaGgXn/flacVPMyDLDeQC/Ufccjl?=
 =?us-ascii?Q?oPcQ6YPkcU1C6554wqU/FaeeZxpswH8jrXzmJcFxtXq/Iokln4k7IiqXO5GB?=
 =?us-ascii?Q?Lngdipx2IFTxk0PiZQv5vkE6MXbvdhegM9gBgGZ8wZMoYlag9Id4YOCc4nla?=
 =?us-ascii?Q?93YwcncfCkG14ro1q1e0VtptPL6hvF0YkP5jstgfgr+ghvAvItSLn50bZPtW?=
 =?us-ascii?Q?ZVD7l3+lRknqnLBVVmhhIo2FO85kTS2U5+/HeWllpGIIRGz6cbLWAIGFkZNw?=
 =?us-ascii?Q?uem0cqBDF2sBVGMCpuERJIWS9lxFXBkQUNRy+mUypERX20TbvVf7Ae2561PU?=
 =?us-ascii?Q?2TObOR3bDwfsdvwc8o34cgv62B0pHU1EuDKhXRTM+x080510gq9ufWFHFoBF?=
 =?us-ascii?Q?1n7hNgk4LpPsbHvRK3FdVS4uCPOVDewfWlsdc05x?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a60f877c-8680-4357-fc98-08dc7b7ca31c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2024 23:04:02.2289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qJeQfpomF9gzo3W27TJdqoCmeg/kIzusCHSb6nzv3Hq/kxdOjmiDfPW6yrLRkenH2ckI9ZF00dWHuqrGBJ5cjP7fWjsVoQCnF4A2ObCP4+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7049
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

Hi Gerd, Dave,

>=20
> On Thu, May 23, 2024 at 01:13:11PM GMT, Dave Airlie wrote:
> > Hey
> >
> > Gerd, do you have any time to look at this series again, I think at
> > v14 we should probably consider landing it.
>=20
> Phew.  Didn't follow recent MM changes closely, don't know much about
> folios beyond LWN coverage.  The changes look sane to my untrained eye,
> I wouldn't rate that a 'review' though.
>=20
> The patch series structure looks a bit odd, with patch #5 adding hugetlb
> support, with the functions added being removed again in patch #7 after
> switching to folios.  But maybe regression testing the series is easier
> that way ...
Yes, regression testing is one reason. The other reason is to make it possi=
ble for
patches #4 and #5 to be backported to older stable kernels in order to add =
back
support for mapping hugetlbfs files without depending on folio related chan=
ges/patches.

>=20
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Thank you. Andrew has merged this series to his mm tree.

Thanks,
Vivek

>=20
> take care,
>   Gerd

