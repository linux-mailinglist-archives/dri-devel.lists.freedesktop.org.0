Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC01C6DB56
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 10:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DE710E5BA;
	Wed, 19 Nov 2025 09:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sd1iSLb9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B401410E5BA;
 Wed, 19 Nov 2025 09:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763544419; x=1795080419;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6+mbziXibWK3CIISH2jXSFA0EeYGik5Iw9HlwxuKdSo=;
 b=Sd1iSLb9EC5/Zb4G8zwqNM3hDZ1ajPQfUaWOA9rv0N8IqbgZ5i1u6gd3
 1NjdpsnLne1U11X40FPayhEbEsKqZUs/feDH3iTLz6NK2rP2npEBhkkTU
 02oZbjqwkf4FWmizMauWS8TnXRj1Z0iflXfA5hwkRQtasotNhMicLlTSZ
 Eav1jmzDYtkOD1yJcVlgQERzVRTI3EYZgKA/Ft+n2TTfp8E+r0EJo258J
 0FPnDOWoze7Fr/ggNKWA1dIcvYc90qcECMjGDsJsBTC7qTFag16Ev6NmP
 IPbS017kqW+motAmkYMNR+sb2SITh9RPvzwbipTcweBEyK22a3PfLgD7s w==;
X-CSE-ConnectionGUID: YR21z+E5SI2Z2Nh5q1OpDw==
X-CSE-MsgGUID: /8ikZV0OTPihBOtyHtv39w==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65672296"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="65672296"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 01:26:59 -0800
X-CSE-ConnectionGUID: xyJRRiP9Rai4IYOcn1nXyg==
X-CSE-MsgGUID: EePO0BC+TVqZV5W3NKVJVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="214393121"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 01:26:59 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 01:26:59 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 01:26:59 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 01:26:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N34K0ELTkVHAlxlfvfpF/iipmToQUqDO6tOTtfE+u5T3Sc4spKbfv0s2ykMKRFzGbN17QQML7OpMJnlFKV5NR+ZTA4zndZfT8d9J4AagA9g8tHN6wKPAJJruoPI4WbB4QxtDBq+MH+KsG7Wqv7GXogRdTF+HZaVmhLQ/xhLPim87ZxUeSlycXyTeSux/NsqIH9DwF3shN65J1Qv0etArECMWOzE0wgPDvGpTzVTIrgRzMQfQK+3CLXwYkVWPnI0NggJyPrC/3gPxcegq2ebf2Q8pIqrhnmiwcxsdmuY3+/oHiVbt4sFuENTuYO5LHjQAf+fPXBoq3sh8ZnEElxiHWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nDZ2YnYlBuuGjL8ukmGdfPVEgU2tXWb3IYsvwRq9c4=;
 b=HrfX1tySVnsnKTglrJwdpflovc8YBSrVvLntPpiIpvF5qrEQJTZITytCeQMiKYwE1EbFQBKOtbfSXiGosuEA23wcI4Y0qgznlFoYMlzgYEUqJ12h/sdV5iehbjAYylLiL0lPm6DlhtIzlbI45MDNIdP+0K1aIvxC7XYGHcyg4G3Xvdeeyljjig1yTXL4ie9QSVfOwH7gSXOcr3HN/gHgblG4KAUcWkvubZVdUpZNrTlYTK8b8K1DX1M1xR8wd49W9DgxhvpE4o0nj+pJJhu36nDADiUTglW2iEcrnIV8w73DAA92TOtvRbwH5cvTl/i/6UgjGnfQeC5yxXOJ5i9y5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA1PR11MB6735.namprd11.prod.outlook.com
 (2603:10b6:806:25e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 09:26:51 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 09:26:51 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
Thread-Topic: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
Thread-Index: AQHcVFeIsN6bopHDnE6NSW3ozkyKJbTwREQAgACHCYCABYqGMIAAVdIAgAL6Q0CAABuIgIAAAt9w
Date: Wed, 19 Nov 2025 09:26:50 +0000
Message-ID: <DM3PPF208195D8D86061FACDE74542E1065E3D7A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251113043918.716367-1-suraj.kandpal@intel.com>
 <aRWU-ovOdSRUQI-B@ideak-desk>
 <689e22d69f7ad9be4f4a78b5194d8c4965be8ca8@intel.com>
 <DM3PPF208195D8D4E9B5E427A947CB14523E3C9A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <aRr0MJbOaHXMXEtO@ideak-desk>
 <DM3PPF208195D8DBBC8B3E4D82648AF4AE6E3D7A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <aR2Ktz7kijkKG1qg@ideak-desk>
In-Reply-To: <aR2Ktz7kijkKG1qg@ideak-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA1PR11MB6735:EE_
x-ms-office365-filtering-correlation-id: a572d37d-c1d5-4c91-71f4-08de274dc55f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?s+vi9vjuhXJU51/GBlfD5DRnE1xi37hk+z30QscAnVTSgHJ6juYSQt4LHu6t?=
 =?us-ascii?Q?juCviLQFVEiytapsU/g0jASOLUtXXBUdjKaMaFKvTkyhfA0IKK7wwwmSIHop?=
 =?us-ascii?Q?gZkjQtKkhYpEmNIcTqpElw1F+pq2QGU6v3L1UVPxnwfTITz+jc1glAAMlmxB?=
 =?us-ascii?Q?82UHdlX12ou+1+wE5kJWbDhFbe0EeVYNEqlpI4CiSET2wow4GXv3ybARwUfA?=
 =?us-ascii?Q?EppYc0g/5ONX/lxHYzYUDyRyaX1DpfzzetKywFMYaEJw75VC0PdvSq5JFQmS?=
 =?us-ascii?Q?hYLyoPMbvyBbyctsdA988KoSx+kGwDq7IGgXC9qDPgER7fyF1t/zbPAJUxpM?=
 =?us-ascii?Q?WnOd79gTqdjcyDHbdkNXnjfARkop0XsCQDk3XQSyGCp1L7Ol+6v2mMf9Wb6X?=
 =?us-ascii?Q?Mw1OlPrfO7GMa21V1qGWj8LlNnuUeWL+YCCDHUvGXtFE4FkHGQAQQ1psvxR0?=
 =?us-ascii?Q?rrdk1z6uOcmo286tFpNdYBtel62UjPIN2OEIJDWTgoBDiSEadFnb0P0EN2Mk?=
 =?us-ascii?Q?kSJE65NhVkzgAmMFRY+zAXlyqm8tCMhBUuQ9oEP18FMzKwkUh7BDzMKmRJzO?=
 =?us-ascii?Q?pn3NXUeDSASIi4BX7xfsHmEYfZvCtTLXrE98Blg8dIaJhm0vzDOesON85VPJ?=
 =?us-ascii?Q?euyp9WEoitVCoS5EekuVYuaYwd+NAWhgX7sefuH1GigRmG3P7FtP3m2YA+Ed?=
 =?us-ascii?Q?EbJE9GJnlNa8uHdFz4wRT5Pb5spi85e0Kph73WOFSdzW2HMFBvTnJPfajzFV?=
 =?us-ascii?Q?wuN/G6X2iL6Z7DqYANVesAos3mj/2vmhmMCOyhXEyrSkZZH8NCXFSdCTnq/Q?=
 =?us-ascii?Q?lomrv+E+ePzglYlkB8s8DYACrKkSH0TCYHp2P51Onhrdo4XXSMwXnkrWCirh?=
 =?us-ascii?Q?pmZ3nJ1MsHmATMfhN2AKefvYeuM/QnwHon9LYMx9jhf6JSXbkdiR+9bbCbN+?=
 =?us-ascii?Q?SYJJMpXEwBsZSpHM8paedrooxOlgTtUrcV7WBWt+Y59Vu75fIf7m595bDuoS?=
 =?us-ascii?Q?8XuwHinrjDDrGQV5b/+lc4mleRJGcMp1u+dWYQEsLbiV86NOSsWFFgX+2kEn?=
 =?us-ascii?Q?NIWdyX+2YAZQX9zUaGLP3m2ySHRpxLtyjOafGmwWqngFnELzd0MEunnO9Wd9?=
 =?us-ascii?Q?KSJ8aHW+2qG8Jo47235LIxUmsLlc2wbKIPGP1fWh7TqY8NspNobNuva5yn5T?=
 =?us-ascii?Q?vivsw7hF0hxJdrRSJ9xv6KI8cPd9z+7dcQBfBg/IFv6ksxtF1OY6Lz9m35nS?=
 =?us-ascii?Q?hXDt8/qFm2k+UCqegIEp4ZXIbhDUk6ukxlD3b9XgiVfQgy/JnsUc0XcG8ZSh?=
 =?us-ascii?Q?aNswCsyvh7xRtGT0tWbcEno8RSihPhUiPdkj5xrlqbwFTTlxIiSJmRnYfxCK?=
 =?us-ascii?Q?BwosTLF3398Ynl1wu4Oe0trCBF6m1YjWQKSZNkp8JdUbMFY1anuqTpjAov9l?=
 =?us-ascii?Q?VxeGftlAksFuTfyVCbPFCB8t06N82nEpRwqGe07TfSt4oMwOEFfSHvT1SALU?=
 =?us-ascii?Q?Nq2ukKBseurq0vdx9SVUEJxf+Y3ID4ENad3r?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?y49geeY8gKbQSUYFmq9Vyiq6oPH4KkDu4wnlNfp2XMY1oxjkWSvJvosl8fvO?=
 =?us-ascii?Q?O4O4+1zGWkbq3sLNIMQ+Z6jLvikXNoAK3OTjxV04c6JSI17h3E0GcIGg8cCT?=
 =?us-ascii?Q?KqSEMNX9tIglEZ+xZUZOiwoAPs1kzLDoZWzxPIh0nrAXXonCgFhno3u47Mr4?=
 =?us-ascii?Q?RDJ0okm9ZsewAKJV3GPUS/oGOlptW7vOhxbqdcusdKCFkEeo+BEO6NgcV4rb?=
 =?us-ascii?Q?EaweUcRewiwZpnndoTH+3iaPY13kg2zeQz9SDgiGqKX0Plt4gy9r4BrbZMF2?=
 =?us-ascii?Q?iMLw8mGw40cOr0CHFvj3fIs0mHEF8YXJLLuqUkOK9RfxLXvGNivaZSF3L8MC?=
 =?us-ascii?Q?n+9BKmvNwxfz0FR1Q9Kh0cap4wT1i7qAEh7p8oVfQIotEWvhSqR8FszmJEn9?=
 =?us-ascii?Q?7b1VtLq2rnG8+SWD39NIRJpzL+nYcp86AxBoj4wGDQcaCPkZCh8ofRNBdLvG?=
 =?us-ascii?Q?0Kle9HGIKSeejN2ZtnZNFJt9f1jSNSDoP+F/ml7wGily7YizOuTGL06lsPhd?=
 =?us-ascii?Q?QKQCqW4iYBCgIzCga9e3u9bPprdIvIqRVWLhI7RX49aXYMkndsXjsaQoMaM8?=
 =?us-ascii?Q?dH3Trh03m3Dw3V6IiK4O6Y4SV4Kf7ZqXe+nhsHvKWSpEzj+usWrugrzg8GOW?=
 =?us-ascii?Q?KSMjRMIejvEfgWBxiLGspcvafp0owxHE908eJCEoUsVQgs72PkXvYKMCvToD?=
 =?us-ascii?Q?YBVXAcLTscL/YEIS/b4BMQxJAYZCJDAFMXrKERK33fNbg30AU+dvIy5bjfaf?=
 =?us-ascii?Q?fewu8Xe4bvwYfA4PPWHtqsVigHm2FzFjeMTnFfvI+Agiwk0tliU4R8Y0GuH9?=
 =?us-ascii?Q?gct3xhdAULZTgdQnbEU+Z3X1l+eWh1bkEXs/OAM6TQBtn/zOIDnLQjpT0O+3?=
 =?us-ascii?Q?xVT10rJC9zk6gOdNptA7gbN1ZOqdrDbThQYhKcB+ichV7Xxq+IhbSjUAwvHw?=
 =?us-ascii?Q?BJ+aMB6svqR+dITzY77PtX1JszYmHwOiM9r5aNsXbM0m1pFQUF2PuwDgLJVf?=
 =?us-ascii?Q?pA03sQeNDi8mU6MofWLZFu5oH2OyC9Vt3cvl+AeGV7tTRjj4DQfDay1IcZps?=
 =?us-ascii?Q?Y+yl/ZAesd+hvJ8qVfA01R7ZJ4EhgwMJrtIOZtYd9CFbHTPkVzsRj03OIjd6?=
 =?us-ascii?Q?F1i/nwQhx+Tnly+JIqTbLfGnntWUiYUEug4Y48dDzV+MFPQxbDPfVSp1U2f3?=
 =?us-ascii?Q?QeMY59gTpB+eWAmfbpUqNRy+nNqscR6VFv4o8MKUfzhfrv4MG/sHQhNRYLs+?=
 =?us-ascii?Q?gHxEKopw58yXUtUTUfxReFmJ9XaPu15gOlfr74ZqJDG4+k9pHD05XkMG7Api?=
 =?us-ascii?Q?2ko+OVMEHvjrUI+3uEl3jOJXQwUXFqF1cF3hG7lPj1pIMB/2+7LfDpf/pgvd?=
 =?us-ascii?Q?Y+hXkAFaHMZbGXXW0iQTAY6QC7S1uPMs29SkSRRJEizzj4jne9gRvJWIFmsa?=
 =?us-ascii?Q?9v+KGsuUtgUIvxHV8Y0IuJKXI+zh7/faBFzwnNgOLqTFI9Q7tgK7xsu+TSEA?=
 =?us-ascii?Q?9tRhqVhqlpoDIFw2Uw8w5na0kbe9HnzGALbTBuFgG9nYUYO6XTvyev9QTtwm?=
 =?us-ascii?Q?UdmXE/du1zD/zCnHeWwgEguoXYThAAM/TL8KaK1h?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a572d37d-c1d5-4c91-71f4-08de274dc55f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 09:26:51.0095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7JDuQ3tQVYKan7fcr37453OyGkIK3Rfd0UDplMJmeiOmjDN2Q4K3qYy7jUTloNlTTPi4TcBnSVtvOU+mWiEbUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6735
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

> > > > to be
> > > added.
> > > > A lot of weird things going on here.
> > > >
> > > > 1st one is how is it finding a payload which we do not create
> > > > while we call destroy function
> > > >
> > > > 2nd how is VCPI with id 0 possible from what I see VCPI are 1 at
> > > > least that's what I gather from
> > > > drm_dp_mst_atomic_check_payload_alloc_limits.So what are we
> > > > missing
> > > when we create a payload?
> > > >
> > > > Imre, Jani any idea still new to how payload creation work so am I
> > > > missing something.
> > >
> > > A VCPI ID will be assigned to a payload during an atomic commit only
> > > if the corresponding MST connector is still connected. If the MST
> > > connector gets disconnected by the time of the atomic commit - as in
> > > the above case - no VCPI ID will assigned and the allocation table
> > > in the branch device cannot be updated either for the payload, as
> > > indicated by the above payload creation/removal failed messages.
> > >
> > > I think the fix should be not to clear the VCPI ID if it's 0. Valid
> > > VCPI IDs start from 1.
> >
> > Hmm then in that case should we just return 0 early if vcpi turns out t=
o be 0
> here.
>=20
> The payload should be still deleted, so only the clearing of VCPI ID from
> payload_mask needs to be avoided if the ID is 0.

Ohkay got it will send the next revision to reflect that

Regards,
Suraj Kandpal

>=20
> > Regards,
> > Suraj Kandpal
> >
> > > > Regards
> > > > Suraj Kandpal
> > > >
> > > > > BR,
> > > > > Jani.
> > > > >
> > > > >
> > > > > >
> > > > > >>  	}
> > > > > >>
> > > > > >>  	return 0;
> > > > > >> --
> > > > > >> 2.34.1
> > > > > >>
> > > > >
> > > > > --
> > > > > Jani Nikula, Intel
