Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BCF31B93E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 13:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBE789C0D;
	Mon, 15 Feb 2021 12:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338D489C0D;
 Mon, 15 Feb 2021 12:29:23 +0000 (UTC)
IronPort-SDR: xFTXCuebInzTZvgimqbwBC6sI5hWqeECxJeV8q1oNsdTwbHGSC5ZDJU6WdfmH9x0mcvoM0ZeEG
 SGReOuErZlYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9895"; a="182800981"
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; d="scan'208";a="182800981"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 04:29:22 -0800
IronPort-SDR: 6UhmlIcgDvm6vV35skHtXfyHoH8dY5fbn1pH6dBUja6Hw3KYMxM6+R+XXK4aX4dtULCKgni+0t
 kUkV077uOSuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; d="scan'208";a="417735603"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 15 Feb 2021 04:29:22 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Feb 2021 04:29:21 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Feb 2021 04:29:21 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Mon, 15 Feb 2021 04:29:21 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.53) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Mon, 15 Feb 2021 04:29:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3Tj/BBNNceAjqqvjK0hk2Lo+oFGJWUwUiwUox37/XZ7vcUFIlPzo9DA12k6+9fn6oVxDSkyRTR0WF9CB6xfcAp5Dt9s+E6aE4aRkFVPpPvOEufxMaUWVVNoKJQ84rcz99n4pk7BXaE1osWotuE/T5parcKCwvMMwtVp//i2QA3BdZkQomWIDAEwB3nVwuMBo/DcPa5HU07M2IljnruLwqPNw9LcNv0I0x1E3XKeV5hoRtkx7oU90URhq1kjBOwGFRSFDMujNIppPWwZCQ7KI3DHSLYMtb8WYrN0clMr10MWQGgCWBrxj8DILPAKv+y11GN/z5R9opSsJugOHkq1Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3vsI67sLqNgaMJuQl6pqqBvjbVwqcZMmb3S62YGEl8=;
 b=ZNbK1QlFb5uhs71ZnMY4GMbHqBmCBbOc1f6DSD2KrnJg6VO0SeUpdk1gSEHVtkeK3YpJQ9+MtxuZlg9yHtblplFaiqJoDZ0K52ORFREseQl0UciQixxUAkiy0jvb8uuumslRBG2Jm9/m/rx2J0CBTQqA6gQvbl1z1DW/9igkrrK2fD0snW+a1H/cmBhBg6mKIJygHY+wwsPnRGUhFBHQP/pATB1ALfw3VXVI+IRymvrE/uZHDjzgPXfXc1Yjq99WgQHxLjBxUqWmq0bDuiyj6R+3g/jSk+XzHRs9MRMRiOYXyu1T1BU4guOdhUmN7lQQr1UNKQMhjTgp0ToknJMTlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3vsI67sLqNgaMJuQl6pqqBvjbVwqcZMmb3S62YGEl8=;
 b=YSNqOEUO28Q6dhUyVH5Tb4pKc9q5PjdlXLiX2fqv6QhBuGD8+kWjdMcOYqDCQhIKmOWwIQprTX7MtU7d+hrwK27bm57P+mupblk4S2/pNVf+nCxtF9TnR7YtQh8oJb0UTWm34GMRxnsqmq1xXPNOPfKA/r9KUCLPqUHyp3JsEBo=
Received: from SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10)
 by SA2PR11MB5017.namprd11.prod.outlook.com (2603:10b6:806:11e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Mon, 15 Feb
 2021 12:29:17 +0000
Received: from SA2PR11MB5068.namprd11.prod.outlook.com
 ([fe80::d9fb:7552:f19b:402b]) by SA2PR11MB5068.namprd11.prod.outlook.com
 ([fe80::d9fb:7552:f19b:402b%3]) with mapi id 15.20.3846.042; Mon, 15 Feb 2021
 12:29:17 +0000
From: "Ram Moon, AnandX" <anandx.ram.moon@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, Jani Nikula
 <jani.nikula@linux.intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "Surendrakumar Upadhyay, TejaskumarX"
 <tejaskumarx.surendrakumar.upadhyay@intel.com>, "Ursulin, Tvrtko"
 <tvrtko.ursulin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH] drm/i915/gem: Add a check for object size for
 corner cases
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/gem: Add a check for object size
 for corner cases
Thread-Index: AQHW/4J/Nd6KBDswokSBXoZffqgcW6pRNJEAgAFwhmA=
Date: Mon, 15 Feb 2021 12:29:17 +0000
Message-ID: <SA2PR11MB50685BFD01D8C6318437AD59AE889@SA2PR11MB5068.namprd11.prod.outlook.com>
References: <20210210075929.5357-1-anandx.ram.moon@intel.com>
 <161295390650.6673.18431407043692596805@build.alporthouse.com>
In-Reply-To: <161295390650.6673.18431407043692596805@build.alporthouse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.0.76
dlp-reaction: no-action
authentication-results: chris-wilson.co.uk; dkim=none (message not signed)
 header.d=none;chris-wilson.co.uk; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [103.51.72.91]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4386c55e-8a47-43b0-80d0-08d8d1ad503e
x-ms-traffictypediagnostic: SA2PR11MB5017:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB50173D84117C69EC4F021063AE889@SA2PR11MB5017.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hdwRExbUr3HBMJi/jUqd5vqMWcKQgcfkQntQvrDRB+ZA1iCCccKW4G66eNA/0JcpLEf0byDLm4E5mEkdbtlzXgrVlGl38QswfnKxbuIhaaGS/ztEFZt13Ki5uPQEDfH9CjmrRP58Tfk4ttfSdTUaCDBLjeankpFQEVWoWfmpI8y2zrTGEEfII8kLOZgW09ccmtavxWZBxfO5rGIMmGK3e2V0iIayNc6zTYIe+BgywcsY+gbcOlRtj+YmHgdumpWnZIhvW1FLntVIorypaGsmvjxXw3UvFCZsd4nwbxs7AJmmzDLyI07nGN/T19mcUPhhNlE1y4hrgAmgFAZyiSIfNKKca7cyzpIShU7sxrra4Ui2YKVbKV+ftdFOWFvVtynLsI9XcafbqVIhbwhrjdHb8+QGsPVPv0n8/a97xwS/QQaXLkRvvxtjXBkc0GSKJPj2dwpVAeM9h/jgzEB1YyDlMS8WLY3cxRvXgSpJcABheuhnBxr91QgfefDglX/2Yf7WzDqdeH321Tqf8p/GG62u3sJ4A4mcq/iBXJsTeWbcSPrRKkx3RnbDp5bIbOcbmYeGvv1NyNRapgCipbtBYYTs+AN3zZg/53YLxNYvHExX33Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5068.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(136003)(396003)(366004)(376002)(6506007)(53546011)(8936002)(186003)(71200400001)(55016002)(921005)(26005)(9686003)(66446008)(2906002)(86362001)(33656002)(64756008)(966005)(8676002)(66556008)(5660300002)(478600001)(66476007)(110136005)(52536014)(76116006)(316002)(83380400001)(66946007)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?WAiZ7MPxnmVDS1DXhszxklbeCvILm+6PLrGz9DTtd72E3l95oicC/SwZK5HK?=
 =?us-ascii?Q?gJnHdi7ObpkVzV/rIvMZ11UaKC0hbcHBSmbEF8ogDadpvkTSccohzPNYP2Rg?=
 =?us-ascii?Q?Y4VWl6/sbs2XlSYrNZoqID86cmUCqz2SZKhM6wxardN70NepapUx1ufbDYXv?=
 =?us-ascii?Q?Rauf6Th1DaLPUxz3F/gMfN3kT5Nl8slnxvuhFKCttDBjFm/U0RmaxEUOULdd?=
 =?us-ascii?Q?kn1SMC3dep2OrOZ0kta9UDfT7DJaZiI1ylBM075zbLpZxU99S+nj/u9rLDit?=
 =?us-ascii?Q?EMrFkS/2DTXQgiiYPmIyPOyAneAIQGo5n3UdLGBTMJpZGh1/o4Cxg3+/DJf2?=
 =?us-ascii?Q?bRXXOaquv4cdQso70R1F5K1VZmzLfYkxG/CUvhJK0883AHJJtBs1/bHzd7Vm?=
 =?us-ascii?Q?yeMkWxwHaeJFK4yMs9y/0Q2c8AgiKtuaOMUKnhGke/qmaDzSQTNY+cjzwfff?=
 =?us-ascii?Q?7vX9DHODd43M5J+/8VjmlTXigJI5Ocd83FXDXh5IG/HoMwgtKwUj3snoIpOc?=
 =?us-ascii?Q?/fEhfKGFmd+PYzc1qvq8FMOmNI2vAUcSDTe/uIhVlip7Z3DH2O3ZNpGdSRn2?=
 =?us-ascii?Q?yBPU6PJWs+TlKCdtxpdBwz8a1Ya4hYSgEqkdkhby91mDsmp2OuuAyFG7L/gz?=
 =?us-ascii?Q?trST+CcNLg4lGp4uVMKDQDUPg1eRg/rmPWfOVLfKhe5HgVyPMeHkOTI2LfWO?=
 =?us-ascii?Q?PVpVRBtnFCv4+MTD1ebbANUW4WZoETUBeiY6jH/OdzmMBBJBFkiykc+0boob?=
 =?us-ascii?Q?KU0UdUprGibm3KNb7YxdJ3zO+sEMUm/4KCFSKjAEvVIwTevUHxtE9jSFk3H6?=
 =?us-ascii?Q?KjpS4ku4hCay736x8OIFDT1LzeBVvEACLNCvRsqYPRXgaBq69RyoDqSqSfGd?=
 =?us-ascii?Q?qw3dhc9SISdmygRXmHyQWNVryZLqORD5ReGgKONRWdYGs0JkJ25IdymMMczT?=
 =?us-ascii?Q?zPtqCD++e8dGbWk8G+Ldgm95qeuYs9LsLNhk1zvtaQADSV14IVWclG0MJIje?=
 =?us-ascii?Q?O0qcDEa4zKMv1ptrIjSZkEL3M44ACY9YWU+IPqxHMBlMvFkTWGQpRh9vpIdT?=
 =?us-ascii?Q?lTKKJqjTBvrnjXCRbiMtUDRCBiRRfzp0ce6+FixsRZpYfwbFH8Ausrgot/x9?=
 =?us-ascii?Q?GklRFou9qj2nHjlPiZx8Molu5kUQQd9ybeC6oXF9VKueSk/VsW9HQRF8c48C?=
 =?us-ascii?Q?DrGFv2JD7ZV+LsG819XmYdFTW2Sy2kZWv/BQzc39Td4R2NQZFfpXBkrb7ew+?=
 =?us-ascii?Q?5e5HuMBIG400xwsJ/zArkZSsairjFzpqNF/y8gDJpqvu/ZmE0/uir/4Z5eQ7?=
 =?us-ascii?Q?Dkg=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5068.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4386c55e-8a47-43b0-80d0-08d8d1ad503e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2021 12:29:17.7392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 005xf4iZRPuMCQa8GtpVh6YZkCDI/GxTbBrkQ+Nzp+T2TtnN18rpinyQXGOamppDUDC+hKLkJnJoa+JNs+IWYDk81RGass0IKfmTfZA6d0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5017
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,

-----Original Message-----
From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Chris Wilson
Sent: Wednesday, February 10, 2021 4:15 PM
To: Ram Moon, AnandX <anandx.ram.moon@intel.com>; Jani Nikula <jani.nikula@linux.intel.com>; Auld, Matthew <matthew.auld@intel.com>; Surendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.upadhyay@intel.com>; Ursulin, Tvrtko <tvrtko.ursulin@intel.com>; dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
Cc: Ram Moon, AnandX <anandx.ram.moon@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Add a check for object size for corner cases

Quoting Anand Moon (2021-02-10 07:59:29)
> Add check for object size to return appropriate error -E2BIG or 
> -EINVAL to avoid WARM_ON and successful return for some testcase.

No. You miss the point of having those warnings. We need to inspect the code to remove the last remaining "int pagenum", and then we can remove the GEM_WARN_ON((sz) >> PAGE_SHIFT > INT_MAX). These are not emitted for users, only for us to motivate us into finally fixing the code.
-Chris

Yes, I got your point these check are meant to catch up integer overflow.

I have check with the IGT testcase case  _gem_create_ and _gem_userptr_blits_  
which fails pass size *-1ull << 32*  left shift and *0~* which leads to integer overflow 
ie  _negative_ size passed to create  i915_gem_create via ioctl  this leads to GM_WARN_ON. 

Can we drop these testcase so that we don't break the kernel ?

Thanks
-Anand
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
