Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC79722CE2
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 18:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AEA10E1D2;
	Mon,  5 Jun 2023 16:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FDE10E1D2;
 Mon,  5 Jun 2023 16:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685983649; x=1717519649;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=5BF3TWdg8QKJtIxDkK/KHVs0r9O3VT2fNoqwiMuTevs=;
 b=JAHdXGF/5bfdRH3ucSMhYRAy3zMkJAPE3Tjr0+pW1/dD0jDaHOb6mcIQ
 y9IDk0BOJzcd/lAxQ/G6Z45eeBH2Ykbw6/bOOzWasap0Dq1k+hh6/fojN
 is7AOpUxN9q/1ZWCWcisSevuhy/4HHVgCS8aP636NNF8hY1MSDYrTMuLF
 0LfhkykwQBuA9IzBIy53g63P7kH4Ezcsx7H86spMVQzK+LtMG44en+n6j
 El4koM38LpscmXkJxj+aE3wXm2Qp5Rtp0LZHw69uLncTborGhFF2uoHIU
 IXg5zkeVT825DMEYZqmz087NHOWsTbaAjWaOi+nAsFh6n3jKdz6VHYwKP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="346013921"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
 d="scan'208,217";a="346013921"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 09:47:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="798510089"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
 d="scan'208,217";a="798510089"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Jun 2023 09:47:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 09:47:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 09:47:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 09:47:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlcEAXcsPjLalBUMH36ZpotXSbbuDHvfHd1ZBPzTMoYMun10kN0tHNJoZJuZe49Jg8+bK2XsglW3lVcjTmQOkgUwc45P9rn67LTRw+wTswIySXC+IMHrLz+ElJUPQbdJJR0DE2eHXWRCkLtjYDmfa2rRLMBIvCBFKPkoRTXuc/qwrOYTuP0O2370dlePKIcZCWfG03Jkg9mAABkG7F0dL/OGiKWdFdJ/KAzYNsLcGLsgetRjMVS2vDEtwUFR2pXUMjYIPDjYtOSZPD00gBpQy7BXs8eBMsq7yXjtV0tNT1w3AviW35XakqjSxBsUi9TE5+ITU14UnprBUIDsMg3WUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2d+bFR5Q85KpntAu9TQcnBm3zEJ9+wVLbBxGa6uYJI=;
 b=m9yP6NbnsasRXIXDuZ1YpSH1GBuSfy2xCJ6VqzlLRlwkCvKSvW/FrDFjOXFPLc/cMqzqSH8vU9wtwJWMbBGfLR7tkFEYUT5HBEI2XXEmYTR5GjBE1DRDE/6AoIdxywctHwkjORSUH9k0rS8B45IU/5NPzALS+aYJ3H/paMyUCVjYFQjaIyC8f2P/8mH8Xp/lK0LeQWLFqM8o6ncyJL8fsXNg9rNVteFMorIMwq5OcP8SMWSKBkHdjueFeEwMXFDlgxcjFVas1Xv/BAHrJL8phAfUinFS6SJItPkg5HF10enOUCSBPZO6tSqRVC1huOxhg9Wa+QDciNfv0xAHUgUzsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by MN2PR11MB4584.namprd11.prod.outlook.com (2603:10b6:208:264::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 5 Jun
 2023 16:47:24 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::bdc8:7e7b:d8b6:6e8]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::bdc8:7e7b:d8b6:6e8%6]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 16:47:24 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v15 1/1] drm/i915: Allow user to set cache at
 BO creation
Thread-Topic: [Intel-gfx] [PATCH v15 1/1] drm/i915: Allow user to set cache at
 BO creation
Thread-Index: AQHZk+KyvMyvSoG8/0WPz+256ysQ0a9784+AgAB8/rs=
Date: Mon, 5 Jun 2023 16:47:24 +0000
Message-ID: <BYAPR11MB2567838CAC92E95C7C68CCE19A4DA@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230531171008.1738759-1-fei.yang@intel.com>
 <20230531171008.1738759-2-fei.yang@intel.com>
 <be21b183-141d-8b77-fc1c-596208e3e1c2@linux.intel.com>
In-Reply-To: <be21b183-141d-8b77-fc1c-596208e3e1c2@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|MN2PR11MB4584:EE_
x-ms-office365-filtering-correlation-id: 6f606965-c1aa-4d11-ceaa-08db65e489f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: atxQ84w62ponMyn9qcKULj/1phy56M92D4BtnVNCNxKnjlo9/cC0yD4Re7cWSkXjD/z9SbBNUXYKtPVhEFzICbGROewoLChmnabJQnQxrsrzy1k95QLAYhduhLAstnIexN7H9uDHkiuTomalJd1HE6HkgwxZjlW3mQfFhjYuKIymQWGpiL/g4NIu1emGnVeI0zcvh+0FlQ7cO4Di2O48Lltdg2vwmRThUL6/tebI3t5MKBGwmShLgrp+dnFWeSzF4Hw9lggzdmVT1sAIpfc1r+wYXGJ2V6OsptMh7DcmmY1TmBncJ0oY+84nnTPnh025HJ0oG2kxRqvhgZ7xfR7p0iZKgwsc+Eh6/M6mC7ZlUbLVP56JPrEXu0izASKh1mAmQhwo1alqrP2wkwo+HzpEBMpllPzUnCB9N0XGWZBKauHpcFNrdcbzGUrfdy7fuQXq2nTDWesjU/EcUr1U1kC66zwj93/t8HJ8VVq1i/B3FgQTzcoLmX4xrMuh3ifR6sPqcdhk4fGYfgCmc2KZdH7u3Zbta7Ecy+IXflJg/J5ywhyagfEVQgtRc3KZqwla2J+6plBai62imZjlrHvlxtsVOsNqZs2/UHf1bZs6NbYQjy4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(19627405001)(6506007)(53546011)(26005)(9686003)(122000001)(83380400001)(82960400001)(186003)(2906002)(316002)(55016003)(33656002)(52536014)(5660300002)(86362001)(41300700001)(8936002)(8676002)(38070700005)(966005)(64756008)(38100700002)(66446008)(66556008)(76116006)(66946007)(66476007)(54906003)(110136005)(4326008)(478600001)(71200400001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?CUWhKcQsyDoaX8X3syvFyE0ORV5ql6Z9Zhz4dVmMbKe1zlOiL3WytbR7NP?=
 =?iso-8859-1?Q?8pY2K2LMos9ZIrKr/XYXr2uc1yedZDNEqB3ed6fubGzya/aGHO3PYDSiK/?=
 =?iso-8859-1?Q?oeVBvMVEEbi2iZ1Zhw2CTyFVqo0YGmtfi2nkF3HggqqrXLRnmPHuV5W1ae?=
 =?iso-8859-1?Q?a6PZi0hw8ESc2df5YJU+XKSf5iyT1uH5c9WDBCxKs1dQUS/mOWKlyTeH85?=
 =?iso-8859-1?Q?KVeGO6mQ1sDPWakqpxTzy7uJTdfk4jAHnaWn2hJsF5HOl0VEuolK5uD3My?=
 =?iso-8859-1?Q?sErCFdPHnQRXBcNs7HSlRP2miqlmNc4nqOHfiFfUGnbfoCLpGBZWRUVg8h?=
 =?iso-8859-1?Q?IA9WSy+vJ2UZ+4+UHpvWwC1GvPahIvjuUiBOc2yCBRAq3+k4OQ1g4Iry/A?=
 =?iso-8859-1?Q?ngY6GgUH3frERaISXlIK1OL+WOdczqxtrV44IzuWfERKcxKe2lhpZlwce4?=
 =?iso-8859-1?Q?OsgXC8+cvfukHREjZqddy1+UewgbAfK5/HlBlGS7YjUBHTV4vE3afErrHO?=
 =?iso-8859-1?Q?ONaLGcnPPYzcDo1CC7A/V+wZnGS+SlwdtBOwxJzI9gdvczajB2ShOtjhxz?=
 =?iso-8859-1?Q?IkM5qax41l0JA+ZvtfKeDswQJHV6y6GGphiV90vVm+D3yQ3aQN98Fdc84E?=
 =?iso-8859-1?Q?EvGx8wmoUA6ONsivwcZoM6EYjgn1GBbLZERuQVn7/riMUgl/l90YZRgAu6?=
 =?iso-8859-1?Q?qwmJcQwfnJD66dYq926DumJHymdmAv8OnIVC84AvDVy/3+Zu+SL7wpwUec?=
 =?iso-8859-1?Q?BAw9xk9Pse7/RW1ZDhID4qGv7JsvxjY+5N+j8rAwYb3z/5LINopl3kzO0z?=
 =?iso-8859-1?Q?gOpoDW7d6OM+bbl1bIaWvydBw3s1wYHDwEsPrs9RDse3JEpLiUyOxiqxEC?=
 =?iso-8859-1?Q?Sq4EmdWtC7inNV6gqgORs/Pf8UN2dQcT0qvUUDyg3Twfbh+9kBJiW3DVgK?=
 =?iso-8859-1?Q?LbPBbYTc5xaBjokcsvq26QjAcRLbVu3C3n9P1DULqE/dK58awm6gQGCFnc?=
 =?iso-8859-1?Q?xqouEWkla19tlttdPJw91RHrgXxRsUgJ3vZ2U5F9EbAozmTZu/q6qp+lRq?=
 =?iso-8859-1?Q?rnancTDx9QiS16J+dByLuoEFX19miTrfwiUKR8TuHZc/PoL/GGRN9/MKI6?=
 =?iso-8859-1?Q?82F07EWSgp9J3CvEYMvOQzKAqy7Riol6T1hz+ouVD+zqmH74/FMBGfku/4?=
 =?iso-8859-1?Q?BRnRHxBFvBnd9PXK2Onl6x/8ZNNmo+Yw+yVQVJo7BvwGnNfh/xc1kLsgbx?=
 =?iso-8859-1?Q?CkkRahsdTAvuMoJXkR4g160BPK/ZeAQ69pFllwnLoKaCoJTJvJ0aB/jTLj?=
 =?iso-8859-1?Q?BLP/7Wbm61yEZc6KoMlqqRriKCT+FemdlZnLqGIkO7Dy/OBJ/tJLqudRBh?=
 =?iso-8859-1?Q?OrOdhKcZYwJgtbzhIRYv8+pCSK31g4Wy8UqNfD+cQXlsBttJ0SBwMEE31K?=
 =?iso-8859-1?Q?kxV7kILPuogwK/K+ZPXBufOHlyHgWUROkHcNHcPqB7LSMgS9Cry4SezDJX?=
 =?iso-8859-1?Q?Ivy1pmltf8Z0yC09Usbv2P5RlhUidK8i2P7uTlk/68IWgdHFTvlMJERCFg?=
 =?iso-8859-1?Q?fNHi/Iy2eQz8+/1lM/0dtbap6VPeyDRsDd5gSQLQrxlHHR/raIS0tnC2Ar?=
 =?iso-8859-1?Q?oep7cW0amCHjU=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB2567838CAC92E95C7C68CCE19A4DABYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f606965-c1aa-4d11-ceaa-08db65e489f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 16:47:24.4225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vvSejY5MzlBNTjMKmbRiDsx+tLdeDTTkaSLNKeLCc340TfSgKYcD8q/NDZRIBAPzwJN8OOPLV5oJAhQ6pzExkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4584
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
Cc: "Gu, Lihao" <lihao.gu@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Zhang,
 Carl" <carl.zhang@intel.com>, "Shyti, Andi" <andi.shyti@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB2567838CAC92E95C7C68CCE19A4DABYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> On 31/05/2023 18:10, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> To comply with the design that buffer objects shall have immutable
>> cache setting through out their life cycle, {set, get}_caching ioctl's
>> are no longer supported from MTL onward. With that change caching
>> policy can only be set at object creation time. The current code
>> applies a default (platform dependent) cache setting for all objects.
>> However this is not optimal for performance tuning. The patch extends
>> the existing gem_create uAPI to let user set PAT index for the object
>> at creation time.
>> The new extension is platform independent, so UMD's can switch to using
>> this extension for older platforms as well, while {set, get}_caching are
>> still supported on these legacy paltforms for compatibility reason.
>>
>> Note: The detailed description of PAT index is missing in current PRM
>> even for older hardware and will be added by the next PRM update under
>> chapter name "Memory Views".
>>
>> BSpec: 45101
>>
>> Mesa support has been submitted in this merge request:
>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22878
>>
>> The media driver is supported by the following commits:
>> https://github.com/intel/media-driver/commit/92c00a857433ebb34ec575e9834=
f473c6fcb6341
>> https://github.com/intel/media-driver/commit/fd375cf2c5e1f6bf6b43258ff79=
7b3134aadc9fd
>> https://github.com/intel/media-driver/commit/08dd244b22484770a33464c2c8a=
e85430e548000
>
> On which platforms will media-driver use the uapi? I couldn't easily
> figure out myself from the links above and also in the master branch I
> couldn't find the implementation of CachePolicyGetPATIndex.

These commits look like platform independent. Carl, could you chime in here=
?

> Now that PRMs for Tigerlake have been published and Meteorlake situation
> is documented indirectly in Mesa code, my only remaining concern is with
> the older platforms. So if there is no particular reason to have the
> extension working on those, I would strongly suggest we disable there.

What's the concern? There is no change required for older platforms, existi=
ng
user space code should continue to work. And this extension should be made
available for any new development because the cache settings for BO's need
to be immutable. And that is platform independent.

> For a precedent see I915_CONTEXT_PARAM_SSEU and how it allows the
> extension only on Gen11 and only for a very specific usecase (see
> restrictions in set_sseu() and i915_gem_user_to_context_sseu()).
>
> Regards,
>
> Tvrtko
>
>>
>> The IGT test related to this change is
>> igt@gem_create@create-ext-set-pat
>>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>> Acked-by: Jordan Justen <jordan.l.justen@intel.com>
>> Tested-by: Jordan Justen <jordan.l.justen@intel.com>
>> Acked-by: Carl Zhang <carl.zhang@intel.com>
>> Tested-by: Lihao Gu <lihao.gu@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_create.c | 36 +++++++++++++++++++
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c |  6 ++++
>>   include/uapi/drm/i915_drm.h                | 41 ++++++++++++++++++++++
>>   3 files changed, 83 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_create.c
>> index bfe1dbda4cb7..644a936248ad 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>> @@ -245,6 +245,7 @@ struct create_ext {
>>        unsigned int n_placements;
>>        unsigned int placement_mask;
>>        unsigned long flags;
>> +     unsigned int pat_index;
>>   };
>>
>>   static void repr_placements(char *buf, size_t size,
>> @@ -394,11 +395,39 @@ static int ext_set_protected(struct i915_user_exte=
nsion __user *base, void *data
>>        return 0;
>>   }
>>
>> +static int ext_set_pat(struct i915_user_extension __user *base, void *d=
ata)
>> +{
>> +     struct create_ext *ext_data =3D data;
>> +     struct drm_i915_private *i915 =3D ext_data->i915;
>> +     struct drm_i915_gem_create_ext_set_pat ext;
>> +     unsigned int max_pat_index;
>> +
>> +     BUILD_BUG_ON(sizeof(struct drm_i915_gem_create_ext_set_pat) !=3D
>> +                  offsetofend(struct drm_i915_gem_create_ext_set_pat, r=
svd));
>> +
>> +     if (copy_from_user(&ext, base, sizeof(ext)))
>> +             return -EFAULT;
>> +
>> +     max_pat_index =3D INTEL_INFO(i915)->max_pat_index;
>> +
>> +     if (ext.pat_index > max_pat_index) {
>> +             drm_dbg(&i915->drm, "PAT index is invalid: %u\n",
>> +                     ext.pat_index);
>> +             return -EINVAL;
>> +     }
>> +
>> +     ext_data->pat_index =3D ext.pat_index;
>> +
>> +     return 0;
>> +}
>> +
>>   static const i915_user_extension_fn create_extensions[] =3D {
>>        [I915_GEM_CREATE_EXT_MEMORY_REGIONS] =3D ext_set_placements,
>>        [I915_GEM_CREATE_EXT_PROTECTED_CONTENT] =3D ext_set_protected,
>> +     [I915_GEM_CREATE_EXT_SET_PAT] =3D ext_set_pat,
>>   };
>>
>> +#define PAT_INDEX_NOT_SET    0xffff
>>   /**
>>    * i915_gem_create_ext_ioctl - Creates a new mm object and returns a h=
andle to it.
>>    * @dev: drm device pointer
>> @@ -418,6 +447,7 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, vo=
id *data,
>>        if (args->flags & ~I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS)
>>                return -EINVAL;
>>
>> +     ext_data.pat_index =3D PAT_INDEX_NOT_SET;
>>        ret =3D i915_user_extensions(u64_to_user_ptr(args->extensions),
>>                                   create_extensions,
>>                                   ARRAY_SIZE(create_extensions),
>> @@ -454,5 +484,11 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, v=
oid *data,
>>        if (IS_ERR(obj))
>>                return PTR_ERR(obj);
>>
>> +     if (ext_data.pat_index !=3D PAT_INDEX_NOT_SET) {
>> +             i915_gem_object_set_pat_index(obj, ext_data.pat_index);
>> +             /* Mark pat_index is set by UMD */
>> +             obj->pat_set_by_user =3D true;
>> +     }
>> +
>>        return i915_gem_publish(obj, file, &args->size, &args->handle);
>>   }
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_object.c
>> index 46a19b099ec8..97ac6fb37958 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> @@ -208,6 +208,12 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915=
_gem_object *obj)
>>        if (!(obj->flags & I915_BO_ALLOC_USER))
>>                return false;
>>
>> +     /*
>> +      * Always flush cache for UMD objects at creation time.
>> +      */
>> +     if (obj->pat_set_by_user)
>> +             return true;
>> +
>>        /*
>>         * EHL and JSL add the 'Bypass LLC' MOCS entry, which should make=
 it
>>         * possible for userspace to bypass the GTT caching bits set by t=
he
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index f31dfacde601..4083a23e0614 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -3679,9 +3679,13 @@ struct drm_i915_gem_create_ext {
>>         *
>>         * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>>         * struct drm_i915_gem_create_ext_protected_content.
>> +      *
>> +      * For I915_GEM_CREATE_EXT_SET_PAT usage see
>> +      * struct drm_i915_gem_create_ext_set_pat.
>>         */
>>   #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>>   #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
>> +#define I915_GEM_CREATE_EXT_SET_PAT 2
>>        __u64 extensions;
>>   };
>>
>> @@ -3796,6 +3800,43 @@ struct drm_i915_gem_create_ext_protected_content =
{
>>        __u32 flags;
>>   };
>>
>> +/**
>> + * struct drm_i915_gem_create_ext_set_pat - The
>> + * I915_GEM_CREATE_EXT_SET_PAT extension.
>> + *
>> + * If this extension is provided, the specified caching policy (PAT ind=
ex) is
>> + * applied to the buffer object.
>> + *
>> + * Below is an example on how to create an object with specific caching=
 policy:
>> + *
>> + * .. code-block:: C
>> + *
>> + *      struct drm_i915_gem_create_ext_set_pat set_pat_ext =3D {
>> + *              .base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },
>> + *              .pat_index =3D 0,
>> + *      };
>> + *      struct drm_i915_gem_create_ext create_ext =3D {
>> + *              .size =3D PAGE_SIZE,
>> + *              .extensions =3D (uintptr_t)&set_pat_ext,
>> + *      };
>> + *
>> + *      int err =3D ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ex=
t);
>> + *      if (err) ...
>> + */
>> +struct drm_i915_gem_create_ext_set_pat {
>> +     /** @base: Extension link. See struct i915_user_extension. */
>> +     struct i915_user_extension base;
>> +     /**
>> +      * @pat_index: PAT index to be set
>> +      * PAT index is a bit field in Page Table Entry to control caching
>> +      * behaviors for GPU accesses. The definition of PAT index is
>> +      * platform dependent and can be found in hardware specifications,
>> +      */
>> +     __u32 pat_index;
>> +     /** @rsvd: reserved for future use */
>> +     __u32 rsvd;
>> +};
>> +
>>   /* ID of the protected content session managed by i915 when PXP is act=
ive */
>>   #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>>


--_000_BYAPR11MB2567838CAC92E95C7C68CCE19A4DABYAPR11MB2567namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted2 ContentPasted3 ContentPasted4 ContentPasted5">
&gt; On 31/05/2023 18:10, fei.yang@intel.com wrote:
<div class=3D"ContentPasted0">&gt;&gt; From: Fei Yang &lt;fei.yang@intel.co=
m&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; To comply with the design that buffe=
r objects shall have immutable</div>
<div class=3D"ContentPasted0">&gt;&gt; cache setting through out their life=
 cycle, {set, get}_caching ioctl's</div>
<div class=3D"ContentPasted0">&gt;&gt; are no longer supported from MTL onw=
ard. With that change caching</div>
<div class=3D"ContentPasted0">&gt;&gt; policy can only be set at object cre=
ation time. The current code</div>
<div class=3D"ContentPasted0">&gt;&gt; applies a default (platform dependen=
t) cache setting for all objects.</div>
<div class=3D"ContentPasted0">&gt;&gt; However this is not optimal for perf=
ormance tuning. The patch extends</div>
<div class=3D"ContentPasted0">&gt;&gt; the existing gem_create uAPI to let =
user set PAT index for the object</div>
<div class=3D"ContentPasted0">&gt;&gt; at creation time.</div>
<div class=3D"ContentPasted0">&gt;&gt; The new extension is platform indepe=
ndent, so UMD's can switch to using</div>
<div class=3D"ContentPasted0">&gt;&gt; this extension for older platforms a=
s well, while {set, get}_caching are</div>
<div class=3D"ContentPasted0">&gt;&gt; still supported on these legacy palt=
forms for compatibility reason.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Note: The detailed description of PA=
T index is missing in current PRM</div>
<div class=3D"ContentPasted0">&gt;&gt; even for older hardware and will be =
added by the next PRM update under</div>
<div class=3D"ContentPasted0">&gt;&gt; chapter name &quot;Memory Views&quot=
;.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; BSpec: 45101</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Mesa support has been submitted in t=
his merge request:</div>
<div class=3D"ContentPasted0">&gt;&gt; https://gitlab.freedesktop.org/mesa/=
mesa/-/merge_requests/22878</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; The media driver is supported by the=
 following commits:</div>
<div class=3D"ContentPasted0">&gt;&gt; https://github.com/intel/media-drive=
r/commit/92c00a857433ebb34ec575e9834f473c6fcb6341</div>
<div class=3D"ContentPasted0">&gt;&gt; https://github.com/intel/media-drive=
r/commit/fd375cf2c5e1f6bf6b43258ff797b3134aadc9fd</div>
<div class=3D"ContentPasted0">&gt;&gt; https://github.com/intel/media-drive=
r/commit/08dd244b22484770a33464c2c8ae85430e548000</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; On which platforms will media-driver use=
 the uapi? I couldn't easily</div>
<div class=3D"ContentPasted0">&gt; figure out myself from the links above a=
nd also in the master branch I</div>
<div class=3D"ContentPasted0">&gt; couldn't find the implementation of Cach=
ePolicyGetPATIndex.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">These commits look like platform independent.=
 Carl, could you chime in here?</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt; Now that PRMs for Tigerlake have been pu=
blished and Meteorlake situation</div>
<div class=3D"ContentPasted0">&gt; is documented indirectly in Mesa code, m=
y only remaining concern is with</div>
<div class=3D"ContentPasted0">&gt; the older platforms. So if there is no p=
articular reason to have the</div>
<div class=3D"ContentPasted0">&gt; extension working on those, I would stro=
ngly suggest we disable there.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">What's the concern? There is no change requir=
ed for older platforms, existing</div>
user space code should continue to work. And this extension should be made<=
/div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted2 ContentPasted3 ContentPasted4 ContentPasted5">
available for any new development because&nbsp;<span style=3D"font-family: =
Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">the cache settings for BO'</span><span style=3D"font-family: Calibri, Ar=
ial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">s
 need</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted2 ContentPasted3 ContentPasted4 ContentPasted5">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">to be immutable. And that is platform indepe=
ndent.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted2 ContentPasted3 ContentPasted4 ContentPasted5">
<div><br class=3D"ContentPasted1">
</div>
<div class=3D"ContentPasted1">&gt; For a precedent see I915_CONTEXT_PARAM_S=
SEU and how it allows the</div>
<div class=3D"ContentPasted1">&gt; extension only on Gen11 and only for a v=
ery specific usecase (see</div>
<div class=3D"ContentPasted1">&gt; restrictions in set_sseu() and i915_gem_=
user_to_context_sseu()).</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; Regards,</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; Tvrtko</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; The IGT test related to this change =
is</div>
<div class=3D"ContentPasted1">&gt;&gt; igt@gem_create@create-ext-set-pat</d=
iv>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Signed-off-by: Fei Yang &lt;fei.yang=
@intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Cc: Chris Wilson &lt;chris.p.wilson@=
linux.intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Cc: Matt Roper &lt;matthew.d.roper@i=
ntel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Cc: Andi Shyti &lt;andi.shyti@linux.=
intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Reviewed-by: Andi Shyti &lt;andi.shy=
ti@linux.intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Acked-by: Jordan Justen &lt;jordan.l=
.justen@intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Tested-by: Jordan Justen &lt;jordan.=
l.justen@intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Acked-by: Carl Zhang &lt;carl.zhang@=
intel.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; Tested-by: Lihao Gu &lt;lihao.gu@int=
el.com&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; ---</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/i915=
_gem_create.c | 36 +++++++++++++++++++</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; drivers/gpu/drm/i915/gem/i915=
_gem_object.c | &nbsp;6 ++++</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; include/uapi/drm/i915_drm.h &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 41 ++++++++++++++++=
++++++</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; 3 files changed, 83 insertion=
s(+)</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; diff --git a/drivers/gpu/drm/i915/ge=
m/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c</div>
<div class=3D"ContentPasted1">&gt;&gt; index bfe1dbda4cb7..644a936248ad 100=
644</div>
<div class=3D"ContentPasted1">&gt;&gt; --- a/drivers/gpu/drm/i915/gem/i915_=
gem_create.c</div>
<div class=3D"ContentPasted1">&gt;&gt; +++ b/drivers/gpu/drm/i915/gem/i915_=
gem_create.c</div>
<div class=3D"ContentPasted1">&gt;&gt; @@ -245,6 +245,7 @@ struct create_ex=
t {</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsigned =
int n_placements;</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsigned =
int placement_mask;</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsigned =
long flags;</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; unsigned int pat_ind=
ex;</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; };</div>
&gt;&gt;
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; static void repr_placements(c=
har *buf, size_t size,</div>
<div class=3D"ContentPasted2">&gt;&gt; @@ -394,11 +395,39 @@ static int ext=
_set_protected(struct i915_user_extension __user *base, void *data</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return 0;=
</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted2">&gt;&gt;</div>
<div class=3D"ContentPasted2">&gt;&gt; +static int ext_set_pat(struct i915_=
user_extension __user *base, void *data)</div>
<div class=3D"ContentPasted2">&gt;&gt; +{</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; struct create_ext *e=
xt_data =3D data;</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; struct drm_i915_priv=
ate *i915 =3D ext_data-&gt;i915;</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; struct drm_i915_gem_=
create_ext_set_pat ext;</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; unsigned int max_pat=
_index;</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; BUILD_BUG_ON(sizeof(=
struct drm_i915_gem_create_ext_set_pat) !=3D</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;offsetofend(struct drm_i915_gem_create_ext_set_=
pat, rsvd));</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; if (copy_from_user(&=
amp;ext, base, sizeof(ext)))</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; return -EFAULT;</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; max_pat_index =3D IN=
TEL_INFO(i915)-&gt;max_pat_index;</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; if (ext.pat_index &g=
t; max_pat_index) {</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; drm_dbg(&amp;i915-&gt;drm, &quot;PAT index is invalid: %u\n&quot;,<=
/div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ext.pat_index);</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; return -EINVAL;</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; ext_data-&gt;pat_ind=
ex =3D ext.pat_index;</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; return 0;</div>
<div class=3D"ContentPasted2">&gt;&gt; +}</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; static const i915_user_extens=
ion_fn create_extensions[] =3D {</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;[I915_GEM=
_CREATE_EXT_MEMORY_REGIONS] =3D ext_set_placements,</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;[I915_GEM=
_CREATE_EXT_PROTECTED_CONTENT] =3D ext_set_protected,</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; [I915_GEM_CREATE_EXT=
_SET_PAT] =3D ext_set_pat,</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; };</div>
<div class=3D"ContentPasted2">&gt;&gt;</div>
<div class=3D"ContentPasted2">&gt;&gt; +#define PAT_INDEX_NOT_SET &nbsp; &n=
bsp;0xffff</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; /**</div>
<div class=3D"ContentPasted2">&gt;&gt; &nbsp; &nbsp;* i915_gem_create_ext_i=
octl - Creates a new mm object and returns a handle to it.</div>
&gt;&gt; &nbsp; &nbsp;* @dev: drm device pointer
<div class=3D"ContentPasted3">&gt;&gt; @@ -418,6 +447,7 @@ i915_gem_create_=
ext_ioctl(struct drm_device *dev, void *data,</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (args-=
&gt;flags &amp; ~I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS)</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;return -EINVAL;</div>
<div class=3D"ContentPasted3">&gt;&gt;</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; ext_data.pat_index =
=3D PAT_INDEX_NOT_SET;</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;ret =3D i=
915_user_extensions(u64_to_user_ptr(args-&gt;extensions),</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; create_extensions,</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; ARRAY_SIZE(create_extensions),</div>
<div class=3D"ContentPasted3">&gt;&gt; @@ -454,5 +484,11 @@ i915_gem_create=
_ext_ioctl(struct drm_device *dev, void *data,</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (IS_ER=
R(obj))</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;return PTR_ERR(obj);</div>
<div class=3D"ContentPasted3">&gt;&gt;</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; if (ext_data.pat_ind=
ex !=3D PAT_INDEX_NOT_SET) {</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; i915_gem_object_set_pat_index(obj, ext_data.pat_index);</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; /* Mark pat_index is set by UMD */</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; obj-&gt;pat_set_by_user =3D true;</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted3">&gt;&gt; +</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;return i9=
15_gem_publish(obj, file, &amp;args-&gt;size, &amp;args-&gt;handle);</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted3">&gt;&gt; diff --git a/drivers/gpu/drm/i915/ge=
m/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c</div>
<div class=3D"ContentPasted3">&gt;&gt; index 46a19b099ec8..97ac6fb37958 100=
644</div>
<div class=3D"ContentPasted3">&gt;&gt; --- a/drivers/gpu/drm/i915/gem/i915_=
gem_object.c</div>
<div class=3D"ContentPasted3">&gt;&gt; +++ b/drivers/gpu/drm/i915/gem/i915_=
gem_object.c</div>
<div class=3D"ContentPasted3">&gt;&gt; @@ -208,6 +208,12 @@ bool i915_gem_o=
bject_can_bypass_llc(struct drm_i915_gem_object *obj)</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;if (!(obj=
-&gt;flags &amp; I915_BO_ALLOC_USER))</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;return false;</div>
<div class=3D"ContentPasted3">&gt;&gt;</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; /*</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp;* Always flush=
 cache for UMD objects at creation time.</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; if (obj-&gt;pat_set_=
by_user)</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; return true;</div>
<div class=3D"ContentPasted3">&gt;&gt; +</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;/*</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * EHL an=
d JSL add the 'Bypass LLC' MOCS entry, which should make it</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * possib=
le for userspace to bypass the GTT caching bits set by the</div>
<div class=3D"ContentPasted3">&gt;&gt; diff --git a/include/uapi/drm/i915_d=
rm.h b/include/uapi/drm/i915_drm.h</div>
<div class=3D"ContentPasted3">&gt;&gt; index f31dfacde601..4083a23e0614 100=
644</div>
<div class=3D"ContentPasted3">&gt;&gt; --- a/include/uapi/drm/i915_drm.h</d=
iv>
&gt;&gt; +++ b/include/uapi/drm/i915_drm.h
<div class=3D"ContentPasted4">&gt;&gt; @@ -3679,9 +3679,13 @@ struct drm_i9=
15_gem_create_ext {</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; *</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * For I9=
15_GEM_CREATE_EXT_PROTECTED_CONTENT usage see</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; * struct=
 drm_i915_gem_create_ext_protected_content.</div>
<div class=3D"ContentPasted4">&gt;&gt; + &nbsp; &nbsp; &nbsp;*</div>
<div class=3D"ContentPasted4">&gt;&gt; + &nbsp; &nbsp; &nbsp;* For I915_GEM=
_CREATE_EXT_SET_PAT usage see</div>
<div class=3D"ContentPasted4">&gt;&gt; + &nbsp; &nbsp; &nbsp;* struct drm_i=
915_gem_create_ext_set_pat.</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; */</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp; #define I915_GEM_CREATE_EXT_M=
EMORY_REGIONS 0</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp; #define I915_GEM_CREATE_EXT_P=
ROTECTED_CONTENT 1</div>
<div class=3D"ContentPasted4">&gt;&gt; +#define I915_GEM_CREATE_EXT_SET_PAT=
 2</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;__u64 ext=
ensions;</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp; };</div>
<div class=3D"ContentPasted4">&gt;&gt;</div>
<div class=3D"ContentPasted4">&gt;&gt; @@ -3796,6 +3800,43 @@ struct drm_i9=
15_gem_create_ext_protected_content {</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;__u32 fla=
gs;</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp; };</div>
<div class=3D"ContentPasted4">&gt;&gt;</div>
<div class=3D"ContentPasted4">&gt;&gt; +/**</div>
<div class=3D"ContentPasted4">&gt;&gt; + * struct drm_i915_gem_create_ext_s=
et_pat - The</div>
<div class=3D"ContentPasted4">&gt;&gt; + * I915_GEM_CREATE_EXT_SET_PAT exte=
nsion.</div>
<div class=3D"ContentPasted4">&gt;&gt; + *</div>
<div class=3D"ContentPasted4">&gt;&gt; + * If this extension is provided, t=
he specified caching policy (PAT index) is</div>
<div class=3D"ContentPasted4">&gt;&gt; + * applied to the buffer object.</d=
iv>
<div class=3D"ContentPasted4">&gt;&gt; + *</div>
<div class=3D"ContentPasted4">&gt;&gt; + * Below is an example on how to cr=
eate an object with specific caching policy:</div>
<div class=3D"ContentPasted4">&gt;&gt; + *</div>
<div class=3D"ContentPasted4">&gt;&gt; + * .. code-block:: C</div>
<div class=3D"ContentPasted4">&gt;&gt; + *</div>
<div class=3D"ContentPasted4">&gt;&gt; + * &nbsp; &nbsp; &nbsp;struct drm_i=
915_gem_create_ext_set_pat set_pat_ext =3D {</div>
<div class=3D"ContentPasted4">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;.base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },</div>
<div class=3D"ContentPasted4">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;.pat_index =3D 0,</div>
<div class=3D"ContentPasted4">&gt;&gt; + * &nbsp; &nbsp; &nbsp;};</div>
<div class=3D"ContentPasted4">&gt;&gt; + * &nbsp; &nbsp; &nbsp;struct drm_i=
915_gem_create_ext create_ext =3D {</div>
<div class=3D"ContentPasted4">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;.size =3D PAGE_SIZE,</div>
<div class=3D"ContentPasted4">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;.extensions =3D (uintptr_t)&amp;set_pat_ext,</div>
<div class=3D"ContentPasted4">&gt;&gt; + * &nbsp; &nbsp; &nbsp;};</div>
<div class=3D"ContentPasted4">&gt;&gt; + *</div>
<div class=3D"ContentPasted4">&gt;&gt; + * &nbsp; &nbsp; &nbsp;int err =3D =
ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &amp;create_ext);</div>
<div class=3D"ContentPasted4">&gt;&gt; + * &nbsp; &nbsp; &nbsp;if (err) ...=
</div>
&gt;&gt; + */
<div class=3D"ContentPasted5">&gt;&gt; +struct drm_i915_gem_create_ext_set_=
pat {</div>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; /** @base: Extension=
 link. See struct i915_user_extension. */</div>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; struct i915_user_ext=
ension base;</div>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; /**</div>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; &nbsp;* @pat_index: =
PAT index to be set</div>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; &nbsp;* PAT index is=
 a bit field in Page Table Entry to control caching</div>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; &nbsp;* behaviors fo=
r GPU accesses. The definition of PAT index is</div>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; &nbsp;* platform dep=
endent and can be found in hardware specifications,</div>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; __u32 pat_index;</di=
v>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; /** @rsvd: reserved =
for future use */</div>
<div class=3D"ContentPasted5">&gt;&gt; + &nbsp; &nbsp; __u32 rsvd;</div>
<div class=3D"ContentPasted5">&gt;&gt; +};</div>
<div class=3D"ContentPasted5">&gt;&gt; +</div>
<div class=3D"ContentPasted5">&gt;&gt; &nbsp; /* ID of the protected conten=
t session managed by i915 when PXP is active */</div>
<div class=3D"ContentPasted5">&gt;&gt; &nbsp; #define I915_PROTECTED_CONTEN=
T_DEFAULT_SESSION 0xf</div>
<div class=3D"ContentPasted5">&gt;&gt;</div>
<br>
</div>
</body>
</html>

--_000_BYAPR11MB2567838CAC92E95C7C68CCE19A4DABYAPR11MB2567namp_--
