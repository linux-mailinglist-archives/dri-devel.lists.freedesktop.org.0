Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDDDC625D3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 06:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6B410E17D;
	Mon, 17 Nov 2025 05:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QY4dhIky";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B981610E17D;
 Mon, 17 Nov 2025 05:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763356183; x=1794892183;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ivygQA97ARwVwVdr0pefpybvLm2Ay9oSMumYFB82p+A=;
 b=QY4dhIkyT8pX3s6mE0KwcfEKDgT26tDhWta/dlKmQgBdOhlIPHQ8LR9J
 RIr7yV8bPjnkg6+WtzSzoZ1Jh9hFHAgRPiqQHgydYKkrGh22woYWaTre5
 a7zp9BN0ZV8TLl3G3ErUUEr7HzhPUt4ZSBA7Lw34bFm/JdIod3+Vby30a
 +98CWvqKFB3toCz2kivbAG9LblGygck8pU4BfZ1tdEFhXQ4y/wii7/LbO
 E1saZAvVUMqJ7xfA/dnTORk5JRWRX/+MIcc2g9HmvRA72xdsWbNlqr1XU
 xY7u0nvT+RzsPcJoJxLIHE4DqGfHHwS68wntNoB986y5f01PDRwqCprPM A==;
X-CSE-ConnectionGUID: LkxYAmLsSAK1O9AveztAjA==
X-CSE-MsgGUID: odo5FN1HS5OPxB1ALAHbKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65250005"
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; d="scan'208";a="65250005"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2025 21:09:42 -0800
X-CSE-ConnectionGUID: 09ZlM0iOQ4qsfk4Z7b7cIQ==
X-CSE-MsgGUID: D3Z6fzjNT3acxsI6Ys7U6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; d="scan'208";a="227686588"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2025 21:09:42 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 16 Nov 2025 21:09:41 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 16 Nov 2025 21:09:41 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 16 Nov 2025 21:09:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qSjh3mPKr7q7bHSs/Wtj6my+3H2QFml5mZcHhXqdl87Nwt222yAl5g6l2kaCbhu+PXUn/vSDC5xc9ZRQRjoJFa6/xYUioB6nsoZZ28sGOBSPaI+RGSf5Gdy7bF7tLo5K6irwBg6lscI7l+aN3okJLV/QRjYqjMa2VX0w2Pc1Bqy39m7C4+NKMxhreGqzsfcsdvltutgz4ZtesvrekDLUqfghspmUpzVr6c/Riv3CfGlXG5XZW1+T3vJWqWgw0sVsTcfVGBYi43XqJdMkmRxerKgaVu8fNc8LKahlyTMEwSGpgdDEqoS45awhzv3aKGU046ZGRMfyBV553TCWyiCObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzqCJgm/SPXHI9b5ups/aiYMBhYAPNrhGR0gfoWmFoQ=;
 b=ch4uMB6IzsZyZbqwRhGCSXHKVTDKBvsSab5DuMp8IUoon1LN9/ugaMZULOWuUGXzgg0HI4417Ac4DpTDpx2qZwp3mM8rXTASgbjwzDn2Lf3F8nUGXYZm6Y6W5d3RunXJiQe8Wazc0CcQ6+gUJ5rGAc5oZXVEEGxhd6d95amPiuNnJTo5JVdXxkhNF2V1HmmOAzhnU/yKsrd+guwhNXpB4XYYYZuAVWun91CML1XBl2zcs9qIxC0+FijLjHkyXy2QogOZt6v202opVduJwilU/FvjrD5lC6M7pGp/8OAUr03wZylNKcG+/mg1bnkAsXSy5iuyM5evqgNYfS8eJ97Tdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DM4PR11MB7759.namprd11.prod.outlook.com
 (2603:10b6:8:10e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 05:09:38 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 05:09:38 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, "Deak, Imre"
 <imre.deak@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
Thread-Topic: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
Thread-Index: AQHcVFeIsN6bopHDnE6NSW3ozkyKJbTwREQAgACHCYCABYqGMA==
Date: Mon, 17 Nov 2025 05:09:38 +0000
Message-ID: <DM3PPF208195D8D4E9B5E427A947CB14523E3C9A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251113043918.716367-1-suraj.kandpal@intel.com>
 <aRWU-ovOdSRUQI-B@ideak-desk>
 <689e22d69f7ad9be4f4a78b5194d8c4965be8ca8@intel.com>
In-Reply-To: <689e22d69f7ad9be4f4a78b5194d8c4965be8ca8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DM4PR11MB7759:EE_
x-ms-office365-filtering-correlation-id: 1a7d441c-8d53-46d7-831c-08de259781d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?FQuZ8Z3D16i9YUXSaNSRapRIS9xSM8o4RLft2g5emTGs27ot2p/dDTRzsEZW?=
 =?us-ascii?Q?bLYJeBubMJks7jIIfi0vYuuLbvld0nVyrGN/UdczY7HSC+Ozzq2zqp7o2ghm?=
 =?us-ascii?Q?gT5SvlhCpy2GBIPTpCgDBp+z31UR1KXvrMS8xLHvCPTibVPgBkveIMGR+SnA?=
 =?us-ascii?Q?DlZQ7O729dSsarwPtI+1FH8f2ZRTHeoIc+O7pgoKGe3or6YWxlbtU/ouRPj/?=
 =?us-ascii?Q?NqrhiB0yeZKd/QvOMMo8/xCYsCb5enX5sYGCckaU3Iqy4BPbtak/D9/I0qCs?=
 =?us-ascii?Q?1rGClG8ASLOyMB+SCGDq7CnK5I2zPyMH5GvQlTklinmi/yVkF9yURXwHPNsG?=
 =?us-ascii?Q?pAPJJkPM4TFQMmHzSZCjpBc9hxp9XgINXXOTFghn1EImGBWsM/fLAL3qt9ED?=
 =?us-ascii?Q?in2UUnpt7B1t/bb2/isKDURxFxKfdI2VIhQVCRNBFMYZRRI9R8mwZJBFIxah?=
 =?us-ascii?Q?waa8TtbJFki8A/YSFcmhp6KefHilIZhiAO/9ZApajBO6jy8UhCiYaDAJyfLa?=
 =?us-ascii?Q?1P2QnIaa7M5v351XIL09DxXg4U8DD+Ju9k5cnUh0rJEdGaDipdQylx6E/AkE?=
 =?us-ascii?Q?Qcoa1pJ5YpfuOsaOhMopi2JPqLuGj5EaIcO0eSLcAyXRNiBYeTbbEy3CYxRQ?=
 =?us-ascii?Q?msOnbaG0onhv8bwHlFm+WYJ+IZ3RxvxSS0Yk0wpJu45q5Ykssz8XPAYehVlu?=
 =?us-ascii?Q?Ka5j55u9CaXuIUDDVJlA9yWzroKjHGeqahYWzSPkE7mM6pjFa6B2wnnAL14j?=
 =?us-ascii?Q?Hc5Upwh4gkoSeP1VCVaY7l0Q4FEZMXuT9Ela6cHUw3ATrSGa2P3XHWSD3YRd?=
 =?us-ascii?Q?9YQsBf/JuDvikUU/hmStcu7iCSJMukhPju3AdHwa39H+TxZBBHN7Qhn47aoo?=
 =?us-ascii?Q?a5RrKcNF4eL0v6ed2fzBTmbL9XfyDhOeGPpK2sz8WsTki2oMuUNAx/w7P8tU?=
 =?us-ascii?Q?LBN0WjXWqzva2VxeqUO2oqEkkET08UCF39UEm2uE4T32nT0FCvr+pRhX+nNc?=
 =?us-ascii?Q?l5KuCggxKK5Fw/qGVBPwE+kOvdlhts9u1eZKlDWjW2TplE3oNbWcI5EAZYIU?=
 =?us-ascii?Q?lr1++T+rij+JAEFeeJjYac2KEMQOMDJXgDdj0kN8jQC95+s6lCtCAsaCti6e?=
 =?us-ascii?Q?WHiRB5cZnXC2sR6fSrHlG+Fovj0i2vjOBMhcQWDYnLS2P5ff7YM9Kmi9A6+Z?=
 =?us-ascii?Q?IQu4nxl2bWEkRJ2LzHVuYaNetPDwvkIAX7zMde/2t/kyCXVqL/tr10xu/MvF?=
 =?us-ascii?Q?ZOOGfMEEGFgL0mado7HTAlf50jg+MhUjP0iwazZTiVKK0grFu1dWX6LM+vI1?=
 =?us-ascii?Q?YmRiHXZU3dsfqyVB9V7hE8Q/cEByPja3eXPkegR2BF2xT1JkNEWtTb9M8r5O?=
 =?us-ascii?Q?060+2kq0xZFXnxnZdmrGa9lfFC1m3sE8QqHRKdrdftf9bFgEri4mSJOMBzXT?=
 =?us-ascii?Q?ch9jFfoVwIEyex65I89SU0e91ZuH1WC0ncOKYUm2yzO2s3QCv4FT8sL/hb7C?=
 =?us-ascii?Q?w7WMxrsE78R8q/i+gR2zTZP1NuLYRfgcofdm?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?C5r6KNrGTcaEDzZiRdVuxk8zeYISOY3tP1nrdvXfR39VkCvkHL8xYO6wRnZT?=
 =?us-ascii?Q?KQ3f9JnpVMMI3WkMc4WV+ou+634fcKxPFb2We2aTInNvirK8EUk7arVpLxGr?=
 =?us-ascii?Q?qFxfpwGvUDY41V/twcUViKaet8W3GO7lM4FfHAM66HaOUyit5tPvoqnmMRyH?=
 =?us-ascii?Q?P89R+4KxhW4+S83AaZSzGXZyNdo7y03byp4WPheabWFW0JA0yIAXL476OsHr?=
 =?us-ascii?Q?7dpWvs2IitcFppRg37JCAYYchad3qfirPFkF4syWiWb0GBaCjCiusuHROnJ9?=
 =?us-ascii?Q?jYixQIZR1KuXHLF89uIxtLpqu6Eqe6rdOkkg0fKmddsgF54nDy/MfVsHXun5?=
 =?us-ascii?Q?1IWbF1U4aSRz28bjgd2Tc0o+yzR3liKjz6EmP9fy0xbIJgPms1N61MeK29wC?=
 =?us-ascii?Q?AlMoNqUY0U0wu88rSl65ZWm//rB2eChVJv2uKVIa1lT1MCwxYGzkwLhUQRNQ?=
 =?us-ascii?Q?Wi+HuU2lQwDxvvbsWqglxRwt8gyQldkIj2nfKHqcYPohfGgXzu6tff76TuNm?=
 =?us-ascii?Q?HYT7zNEkTVAD7AFv8PZnRtMO8HBdnsM7PANmS4CHFNAfTHPcq6rBULoRGKuK?=
 =?us-ascii?Q?nDQvUPA7/rz/fy+NfdP9IUmvuC1cxnhMIrqb/d/iAnZlt+6hE/GNfa+Z15Bw?=
 =?us-ascii?Q?kE0+OzVffxklXdXCDf1pQRZwxT1VQuZO9gtZykHs0h0IHACv5xmg9LbeEbrd?=
 =?us-ascii?Q?0QcNiyKJDFdQuALiAR3lWBZ8her4uxqar+x3GMwx6g0KdefC95PSUPUy/OYX?=
 =?us-ascii?Q?2jpsR6Fr8QfbUgJEApETFJJqWYmsucGaaxPB0R+3imB7f3g3aEo7QghfHcy0?=
 =?us-ascii?Q?FcZAEWddZ31FH4A9iQ8NlM8RSZi97dDR+5GX17jkPk5XxuhaJix2Cki8P4GN?=
 =?us-ascii?Q?n1ULa92e0xhswX5Nfeab3kHgANlia3ra9rCT0jHzHhanqjEn+OJYwexjLwGp?=
 =?us-ascii?Q?aY0Y+N/fX6ym6XqeQJFzZ5RxMbBWR79PomiH1deA4RSCAKZsMFLV1k6h+tbZ?=
 =?us-ascii?Q?q9FLAYWtxfdl0j1Nn3FXkHiJVxk+MmlEiLboJ1umeX4rZ/z/5DPQ61atHsxr?=
 =?us-ascii?Q?3KuT34yJhdoNOjjvub7LCAoiAii9STibzvkyIRaRgv7V2PPJkjhynvGrFS2H?=
 =?us-ascii?Q?ogb2plER1SbCKvfHAiHThZVgoh+BTI+DBayPb7jERDEdzuytElwgLcxo0oBC?=
 =?us-ascii?Q?ufaOVPiDnI6rJ+0GwXCWFOSyeOJrzWVgr8XFbIUa9SQmdtTl4TKsiKU0LB8U?=
 =?us-ascii?Q?n0T+/UDarYKVwVKDcPMtIkrvXhC0iKXjnk8wnea/EoT7tSX5+T3Ij2mxaPy8?=
 =?us-ascii?Q?SJ2ZuGTv2coDqToD0Ybne/sPRCfXTAV/EJ+W682eIMx6h7HdZjdGNwhyQ8kx?=
 =?us-ascii?Q?Kq03JdxI4RZ8ZMJdQBlgUxYgkbv2gMZSsNBMHJOvcIrAV50Dx7hzoN07zd+r?=
 =?us-ascii?Q?Va2BAntCdLNgtPReKe8K/PxMHUi+SV/NgugQb1vN7tNTfECb0PokJk8krRPH?=
 =?us-ascii?Q?xQVB5mdqerBPR3ggmX8oArKdRFMReZoEIwkZkpGzrRFQB1cW3wjXiWfSbdrf?=
 =?us-ascii?Q?1mWck+dGph+OcSWPa+Y6+6Ru+JP0DwuGEeFSagI+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a7d441c-8d53-46d7-831c-08de259781d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 05:09:38.1836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dqE7aLCaX4/fj/LOkU9+HGlHVZO1qwaH4HHFMjgxhNIMpL9q7FXLvEXh5ExkCu5g3wjMF6pP90q8mTmRm8b8RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7759
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



> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Thursday, November 13, 2025 9:55 PM
> To: Deak, Imre <imre.deak@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; inte=
l-
> gfx@lists.freedesktop.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>=
;
> Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: Re: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
>=20
> On Thu, 13 Nov 2025, Imre Deak <imre.deak@intel.com> wrote:
> > On Thu, Nov 13, 2025 at 10:09:19AM +0530, Suraj Kandpal wrote:
> >> When releasing a timeslot there is a slight chance we may end up with
> >> the wrong payload mask due to overflow if the delayed_destroy_work
> >> ends up coming into play after a DP 2.1 monitor gets disconnected
> >> which causes vcpi to become 0 then we try to make the payload =3D
> >> ~BIT(vcpi - 1) which is a negative shift.
> >>
> >> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> >> ---
> >>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> >> b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> >> index 64e5c176d5cc..3cf1eafcfcb5 100644
> >> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> >> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> >> @@ -4531,6 +4531,7 @@ int drm_dp_atomic_release_time_slots(struct
> drm_atomic_state *state,
> >>  	struct drm_dp_mst_atomic_payload *payload;
> >>  	struct drm_connector_state *old_conn_state, *new_conn_state;
> >>  	bool update_payload =3D true;
> >> +	int bit;
> >>
> >>  	old_conn_state =3D drm_atomic_get_old_connector_state(state, port-
> >connector);
> >>  	if (!old_conn_state->crtc)
> >> @@ -4572,7 +4573,8 @@ int drm_dp_atomic_release_time_slots(struct
> drm_atomic_state *state,
> >>  	if (!payload->delete) {
> >>  		payload->pbn =3D 0;
> >>  		payload->delete =3D true;
> >> -		topology_state->payload_mask &=3D ~BIT(payload->vcpi - 1);
> >> +		bit =3D payload->vcpi ? payload->vcpi - 1 : 0;
> >> +		topology_state->payload_mask &=3D ~BIT(bit);
> >
> > This looks wrong, clearing the bit for an unrelated payload.
>=20
> Agreed.
>=20
> The logs have, among other things,
>=20
> <7> [515.138211] xe 0000:03:00.0: [drm:intel_dp_sink_set_dsc_decompressio=
n
> [xe]] Failed to enable sink decompression state
>=20
> <7> [515.193484] xe 0000:03:00.0: [drm:drm_dp_add_payload_part1
> [drm_display_helper]] VCPI 0 for port ffff888126ce9000 not in topology, n=
ot
> creating a payload to remote
>=20
> <7> [515.194671] xe 0000:03:00.0: [drm:drm_dp_add_payload_part2
> [drm_display_helper]] Part 1 of payload creation for DP-5 failed, skippin=
g part 2
>=20
> <7> [515.347331] xe 0000:03:00.0: [drm:drm_dp_remove_payload_part1
> [drm_display_helper]] Payload for VCPI 0 not in topology, not sending rem=
ove
>=20
> So it's no wonder the port's not in topology and everything fails. We obv=
iously
> need to skip payload_mask updates when the VCPI is 0, but that's just a
> symptom of other stuff going wrong first. Perhaps we could do with some
> earlier error handling too?
>=20

Yes I agree the question is how high will the error handling needs to be ad=
ded.
A lot of weird things going on here.
1st one is how is it finding a payload which we do not create while we call=
 destroy function
2nd how is VCPI with id 0 possible from what I see VCPI are 1 at least that=
's what I gather from
drm_dp_mst_atomic_check_payload_alloc_limits.So what are we missing when we
create a payload?
Imre, Jani any idea still new to how payload creation work so am I missing =
something.

Regards
Suraj Kandpal=20

> BR,
> Jani.
>=20
>=20
> >
> >>  	}
> >>
> >>  	return 0;
> >> --
> >> 2.34.1
> >>
>=20
> --
> Jani Nikula, Intel
