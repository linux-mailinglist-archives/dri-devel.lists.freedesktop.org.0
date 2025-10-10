Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F256EBCBA38
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 06:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8ED10E042;
	Fri, 10 Oct 2025 04:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cll9Fijh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE4210E042
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 04:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760070332; x=1791606332;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bY49TMdeScu4DFIJGdqAhsDmrj/ffTqZbDt5XQvMUPw=;
 b=Cll9Fijhmxv5tSqGt6GggN6rIpHfgX4W8m2fyg2DP6dYRTKADaw8Bgl1
 QDJ6+fASge3cidQ5GXqWX1XcZJjLkqor2XhWMX5J1IK4F2R3MnjVLy7Si
 yiu0h+dReP/YNkkYQDdDzGgLpQxMPNR4vv4C0iGteLTTLbfEpUpDajHwj
 Judmv7DywtLnxTsYnyrmZtREtwIX4ObmtXIl9cs6271nmhK1N5cZ6wqqn
 enYBqVBJ3gtOwNnM+5VPxU4KGXhnKrQg27cnRiXM5kFXo30nuriAw96sv
 PrKGpukQGZV/sLnQzVzuFpImCQgfqxy82HAhaZZmmO55DvL4kD7dumNCH w==;
X-CSE-ConnectionGUID: KUh0z5eCSB6INdj98v8mZg==
X-CSE-MsgGUID: AkC+jsVcQdi6K0tj0FcLLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62446162"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="62446162"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 21:25:31 -0700
X-CSE-ConnectionGUID: ll5Om9gVR8SxfzOL7p+Z7Q==
X-CSE-MsgGUID: D/dc8sQ7RNiM91h5fgTSZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="185259689"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 21:25:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 21:25:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 21:25:30 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 21:25:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRAI8n6h/QUMQmUqajZzXHuNtT8dBFDNpLrxv4+pp/3TvlWkmzUcGZZ+5e3aTC9P4LChhbJDNx3DMakeZglLOoWTald4Jrd1Zdsx/UiShbJ+FU3YXAje3ZSalzX5ahkGrgzRtcFasryeblMw/MDdTYa4o7+yCWvvhVVps7AJNt2bvKfo2W+nneu22wHQSXiEv8VpX92z6R1/q8urvERI5LvP3JRoQMBPwbVamLB8DBrEr2j7aWPTl5EQaiu/jQtSGxbAuVvQvFw79wg6QnVZDZKoS0ES69w6+wB6DqlA4skKT/v5xUwUehdaHmhyfUkzyWAz3sUaNNCRbSW4cJtbig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+hMejNlS8AV0LoIeWA3ezJuID0JdfIZm6NRCwYvXaQ=;
 b=amXgFcKiZiJFDGVu06EAsyM662xQlp1cH6BZijZI+EYOKDQbpXtOn4HyJ1gDmQnMaazmTS6rM/lwjwp07QeTnXF2uhvfIJPogSnE0xGF3lmMDT3U3qurv1MRICEUKsoh1kagegSXeCWJdhXk0oszOjV4g1o4Gp7Vm7muwcANXmMcAYDOtCfUobJABpqd2QkEY4EENQc1bhp+so6Zo0D6odU1AEjvpmf0e5XV9MXGmtXysGRQIQlQ2i6DGxCrv+chqRHwHJbliz97MDEI3xO/YYJTgAqJgl/lCqsssOuSHhReKG/3Zt4ExGOk3GmbXUir91SZnHVWtxeXmeLeesP7Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 04:25:15 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 04:25:15 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "airlied@redhat.com"
 <airlied@redhat.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
CC: "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/virtgpu: Use vblank timer
Thread-Topic: [PATCH] drm/virtgpu: Use vblank timer
Thread-Index: AQHcOFTh4O7Et3uiykydidDxo4mQL7S4trEQgADdw4CAAJRHwA==
Date: Fri, 10 Oct 2025 04:25:15 +0000
Message-ID: <IA0PR11MB71850152C033B443032AA519F8EFA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20251008130701.246988-1-tzimmermann@suse.de>
 <IA0PR11MB7185D91EB0CD01FD63D21AA7F8EEA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <dd80279d-5469-42db-bfa0-7b9ee3323bc9@suse.de>
In-Reply-To: <dd80279d-5469-42db-bfa0-7b9ee3323bc9@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CH3PR11MB7180:EE_
x-ms-office365-filtering-correlation-id: 75e15877-cd22-4e6c-28c6-08de07b5031c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|13003099007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?+puOu1XibqC1uPnLw8xm+unJY0utT7NSAZZ141zKgfdwT3pWJtwZ6jFqxhic?=
 =?us-ascii?Q?22U9/08i6fgIZs70TV7XRXCRXJKcRIeBeK6LLL+x3gI7JtXMXKr6+cZxlGHi?=
 =?us-ascii?Q?+2ZPoqwgI4IQVvlN+YvRkpn3nw9pXiFyYyFnnMmuGm1q7Cv9zuofLr/Z2Sx5?=
 =?us-ascii?Q?CSGD8wBXBQWN/ii678FQAF/tqr9FeAaBvz9p8v8LCe8MTfIFFwBk33A29lyJ?=
 =?us-ascii?Q?+qOqrRYSGoxMEoE77vveE/8MO4Cdud8rjf9zOxVfBKlvCRFAfkaLRvKBFGFn?=
 =?us-ascii?Q?CEYzPZwWY7DCCjbZ/Xi8TeH7xBfnm+qldfD2JlHrCQLrUpd6f5rdjLlYgWF6?=
 =?us-ascii?Q?jhXUgGbStHTNiJRtKR7D288jJ3wd51Jd7UX8dqpP9lqcJQ+OpPrelO4+SQYS?=
 =?us-ascii?Q?rtLBiUr8vhXtUW+XOuIyVgC8n6qptz5wtItCSGaKjzyIUOJKoIbmQ4JL9+tH?=
 =?us-ascii?Q?oKbpXtBkd2eCMv01ltn4X9MP4ZtzlbW63iLRrhyKW7YDM4M6tuyr8q2R/URO?=
 =?us-ascii?Q?gyryUW5pLPCHNibHaLKoQHWV4je/XIYD4FC7vQsbZ5zUp1G74MzzhcwOZsu4?=
 =?us-ascii?Q?sIGQbAEEeRlSpgtuWjgkFof3Sm/J2sGGGFb+EFeVHkl0dHqXUboUBQ86CQtZ?=
 =?us-ascii?Q?3HiCYr2IH0M4I8uIKdr0XBLIMwkfnWeDVwu70CDte40QQvt22906iPaAE8xK?=
 =?us-ascii?Q?ectgwD3UwuJW/JWhTrTxV/c+IgB85k/SwCAaXQY0DrGFKPc0op79YivYwdU9?=
 =?us-ascii?Q?wgspaTYUP5VBG0o+zSMtIdj9mESE5l1Mw8JqUw2HiSr11O7zK36VdeUF3ptu?=
 =?us-ascii?Q?3o5V0ueTzIa7XVLAZBNf/WNAeqDJhCQJrtyDzgusZ+nw9NGZU5F9aiQCnSAZ?=
 =?us-ascii?Q?76YwPxSSu+onfyk0v7sBDrD/l6J1Ev6QW1GyTaHK9DGeRjk89zwAEWeBTdpx?=
 =?us-ascii?Q?S52md350OzUncXRxXk4FTAbs1V7aVxbvUimSFlLQ2YDoCLLtbxjLQLoM0WwA?=
 =?us-ascii?Q?C+qX7ru2xNGW8cnTUsuQaQ2W3S9CTs65t92ommH8BFMjUNzVnu+x25LHZ6ZO?=
 =?us-ascii?Q?NSMdC2JViU08vO1RpYYLHvroLv0HKmA/5PFDkv+7Q/f3KNLj0krAK3DAMK0v?=
 =?us-ascii?Q?C+sa0eYGixJJ27p1elXTvNibLnGoNwKiGfWAfdoUzdEJfZTgJNKFw/PZuZrw?=
 =?us-ascii?Q?0LA+kSPgzlAuk3TPLXT9xQbvaEhWM2/3QgmXl1vKZ5xDuGOLD7odm5JpeWxx?=
 =?us-ascii?Q?VVLpy6cdmMtnMetXDZn8wdHRZTYgDKTKe6woRWh/Y6Czdc2JRIwQ7HBYjaM4?=
 =?us-ascii?Q?3w8O9nkD05hYfTb4NYD6L8xJIvXpmOx/Xxya3Gubs5Bv4DyNYGl+dTFqaZ6P?=
 =?us-ascii?Q?vzPyCAbVDE93eG2O54klNTza7kUY3y3NgTltpCCO8ycEClrCW3a9hhg4ekBX?=
 =?us-ascii?Q?tiu9gn0b3MjGRDghXy0fYfLHQKQ8j2LSF775WqN1XkOg81WDg4EoFg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(13003099007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hXgYZdL2OYOnsWL2u+DlLwDzDeOyfhHytyC2uMHvEtPHzQtg+fY1z+DR45I9?=
 =?us-ascii?Q?zwxg2HLjWcm0JW+oA3GijpT7Bd1lO6TYzBKJ5za9fw0XnGrkmlSVERkTPt+O?=
 =?us-ascii?Q?3kHhZ2VxshV7P/58gMQGMqfzaKR0PtCSXy3OIR9XA058jwQckUGYSecuMLxg?=
 =?us-ascii?Q?TN/ehxAdPWmSe4iByPjvSTP7o+EEx5mXYGxeWKV0ldR3gWXoXzBVjm0jI5Zl?=
 =?us-ascii?Q?aZajvqU1EtfaHxUwSB/tfIUfGaLiM1LU2qbVxnYvC8lFaRvq0wZbHA/ZFVJj?=
 =?us-ascii?Q?xEu6eM8CBjSsOZcfQ3lXRZQnLf5GuCNhA9JmVaA2NCas0nAtxMfGo8XByWNt?=
 =?us-ascii?Q?qYT67TeoxYsT3hpP3kULEFOUUtiTfCPnyCLVMKV4exNOCMy77EVVz6v84O05?=
 =?us-ascii?Q?GWq+imK9Glrz7bCRwkfjTZNe7YEWZM/E0bgyuRRILs9UD+c2uTjFrWfMy/wy?=
 =?us-ascii?Q?7pAY9nA/KlG7e3qvrcaavFDKQmuUcbD9+VKoUfLodlOQ8gTbkEq6OQrMOpnz?=
 =?us-ascii?Q?fCwYCmCY+YuxCjTyB9ouf4VZ8+DJpWJ3DUkZUqErBjdR675aPOkWuwC+PUYE?=
 =?us-ascii?Q?z9xehpVYFaM90tnlveOApQnzZyhC2wcp0mAUEHFVHZwydWHPBM3fke/IICTr?=
 =?us-ascii?Q?p6FvSxM2LOEYt3WPJ5Wd/a8rY2xSzN7GdiO7BAqSjQD4HPHv4wdjNSgCg1Rw?=
 =?us-ascii?Q?1YonJDnxY/wX+EGes4u1FAS0Jz3lnZW/4ktFDQ14B6V9F1p598o2W3y5fptA?=
 =?us-ascii?Q?QSktCg8DRh+1aWoIDLvBYLfFaY7R7Q+GCZ/NxPK+Im8XkiLshE+dkO8ooHaq?=
 =?us-ascii?Q?T+9JByLyRYWb2LmFFGz0URPYUgrDB/znjRv2Abg7GAAOAsc27FX0YkfgGNpo?=
 =?us-ascii?Q?nBDP6J9RJM9SMaiz6BUfu3uefCQRhAcre1WPprwsQKzcPEaLt3I5tMPmGBIq?=
 =?us-ascii?Q?yPEsoblJ05SLDF/tqRQm7FyQHutvB8HM+Mw43QC2EJtXtiz7cA93f9QylZfr?=
 =?us-ascii?Q?m6MBq/W5WsJ8SArcp3C+NP1+aQqvuhMsCPBX2580YmYRMXJDcjjOlpL7WIOm?=
 =?us-ascii?Q?Dx+BJQOO47HekUEfRtQt+8kSgBPrfIKuymJs9edVan87gPFBXiZO2rbbFMPm?=
 =?us-ascii?Q?Bq0Nm+3QxqN894OnV/VH5CvhYcRlnz+9yecpiWgumZ2tt18fEpbtnsqdgp8U?=
 =?us-ascii?Q?2FpE5k+hvpvj1jZsXVCPCtTza3tzXtpZ83JmmEndPNv90X3WeeEbn+OBNILY?=
 =?us-ascii?Q?Zfz6zzkHr8v3MoGb1AEjvT2PeEbdPBg3ayyeEchuGwuHOpJDWwrMmYg9exvT?=
 =?us-ascii?Q?hlCFbVYv430cB0WDt7PPQGMBn/jZ6jaUOmv/3a4FJ2eQpcjFBOZJd3SAURT3?=
 =?us-ascii?Q?67/6N0uDLhRYr2rS3+3oaqsYhrgvesf8QKhzshC9LoAlhTRiaFMuareVP5Yz?=
 =?us-ascii?Q?KPzsA9LhYNGN+TAx0gXqRNEREErcTi2jyOwoslVJNOiPBMNv8e8MHtYkRond?=
 =?us-ascii?Q?PjaNoYy6+5aWWfL5vixYwsMBTw5TYBlr1f/2X+vLjmcS0QQ+9IbyCv42NtSG?=
 =?us-ascii?Q?8ZxwjGXuLl5y4cX9mOFbV1XqzXxE9Kk7XsTCsUwy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e15877-cd22-4e6c-28c6-08de07b5031c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2025 04:25:15.5433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xSCVcf6suKe0rcP/zbbtszoOd63J/mYduVxiMaYQW3NvbQZU111u+NAe/QQ9C0XoePJrUFxUnrhyPnpCO2GM8ktvDA5vJpAHLNElkZVMiPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7180
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

Hi Thomas,

> Subject: Re: [PATCH] drm/virtgpu: Use vblank timer
>=20
> Hi
>=20
> Am 09.10.25 um 05:23 schrieb Kasireddy, Vivek:
> > Hi Thomas,
> >
> >> Subject: [PATCH] drm/virtgpu: Use vblank timer
> >>
> >> Use a vblank timer to simulate the vblank interrupt. The DRM vblank
> >> helpers provide an implementation on top of Linux' hrtimer. Virtgpu
> >> enables and disables the timer as part of the CRTC. The atomic_flush
> >> callback sets up the event. Like vblank interrupts, the vblank timer
> >> fires at the rate of the display refresh.
> >>
> >> Most userspace limits its page flip rate according to the DRM vblank
> >> event. Virtgpu's virtual hardware does not provide vblank interrupts, =
so
> >> DRM sends each event ASAP. With the fast access times of virtual displ=
ay
> >> memory, the event rate is much higher than the display mode's refresh
> >> rate; creating the next page flip almost immediately. This leads to
> >> excessive CPU overhead from even small display updates, such as moving
> >> the mouse pointer.
> >>
> >> This problem affects virtgpu and all other virtual displays. See [1] f=
or
> >> a discussion in the context of hypervdrm.
> > When running Virtio-gpu with some of the UIs (gtk, spice, etc) in Qemu,
> the
>=20
> We still need a solution for the other UIs, including the kernel's fbcon
> output.
>=20
> > Guest display updates are synchronized with a timer (or repaint callbac=
k
> in
> > the case of Gtk) the UI layer provides particularly when blob=3Dtrue. I=
n other
> > words, the Guest's atomic commit does not complete until the Host
> signals
> > (via a fence) that the update (or flush) is done.
>=20
> I know little about virtgpu's hypervisor interfaces. Let's see if I get
> the full picture.
>=20
> It's the fences list that's being processed at [1], right? This fence
> signals the completion of the display update. The plane update sends out
> a command to the host and then waits for the ack at [2]. The ack happend
> at [3], which calls into [1]. At [4] the guest are available again to be
> released. How long the display update takes is up to the host and the
> guest's scheduler.
When the Guest submits a display update, it is made to wait (but only when
blob=3Dtrue) here:
https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/virtio/virt=
gpu_plane.c#L222

So, in this case, the time it takes for the Guest's update to finish is mos=
tly
dependent on the Host's UI update submission.

>=20
> That's definitely something different than the vblank, as vblanks happen
> at fixed intervals.
The Qemu UI timer also runs at regular fixed intervals, so the Guest update=
s
would run at 30 or 60 FPS based on the timer frequency. And, in the case of
Gtk, the repaint callback is indirectly tied to the Host's Vblank, and it a=
lso
occurs at regular intervals when there are pending updates.

>=20
> [1]
> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/virtio/vi=
rtg
> pu_fence.c#L120
> [2]
> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/virtio/vi=
rtg
> pu_vq.c#L397
> [3]
> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/virtio/vi=
rtg
> pu_vq.c#L56
> [4]
> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/virtio/vi=
rtg
> pu_vq.c#L265
>=20
>=20
> >
> > This is because when blob=3Dtrue, the Guest's FB is accessed by the Hos=
t
> without
> > making any copies. So, to avoid tearing, the Guest needs to be prevente=
d
> from
> > accessing its FB until the Host is done. Therefore, I think for virtio-=
gpu, the
> virtual
> > vblank timer can only be helpful when blob=3Dfalse as this is the only =
case
> where
> > Guest's display updates are unbounded (and Host makes a copy of the
> Guest's FB).
>=20
> Because virtgpu did not initialize vblanking, DRM always sent out a
> vblank event after the completed commit. [5] It's not synchronized to
> the display output. This means that virtgpu has always been subject to
> tearing and the guest always required to hold buffers until the host
> completed its display update. IOW adding vblank timers into the mix
> should not change the behavior of virtgpu. It just limits the output
As I mentioned, the output or display update frequency is already limited
when blob=3Dtrue, so adding a vblank timer would be redundant in this case.
Note that blob=3Dtrue is a performance optimization where we create a
dmabuf (on the Host) backed by Guest FB's memory that is shared with the
UI layer. And, AFAIK, the only case where virtio-gpu updates are not limite=
d
is when blob=3Dfalse. Even in this case, there would be no tearing issues s=
een
because the Guest is made to wait until the Host makes a copy of its FB.

> frequency. If GNOME's pageflip is synchronized to the vblank, it should
> immediately benefit.
>=20
> The GTK repaint callback is an interface for applications. How does it
> affect, or is affected by, any of this?
So, virtio-gpu is almost always coupled with a UI (on the Host) in order
to display the Guest's desktop content (fbcon and compositor's FB data)
on the Host locally (Gtk, SDL, etc) or streamed to a remote system (Spice,
Vnc, etc). And, the rate at which the UI updates are submitted (to the
Host compositor for local UIs) is controlled by the UI timer.=20
=20
However, in the case of Qemu Gtk UI, the UI timer is used as a backup
as we mostly rely on the repaint callback to figure out when to submit
updates. This is because the repaint callback is a more reliable mechanism
to determine when it is appropriate to submit an update to the Host
compositor.

And, until the UI's update is not submitted (and executed by the Host
GPU and signaled via an EGL fence), the Guest's update fence is not
signaled. We can reliably achieve 60 FPS this way (assuming the Host's
refresh rate is 60) for Guest's display updates.

Thanks,
Vivek

>=20
> [5]
> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/drm_atomi
> c_helper.c#L2606
>=20
> Best regards
> Thomas
>=20
> >
> > I am not sure how this would affect virgl use-cases but Dmitry can help
> explain if
> > the vblank timer would be useful there or not.
> >
> > Thanks,
> > Vivek
> >
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Link: https://lore.kernel.org/dri-
> >>
> devel/SN6PR02MB415702B00D6D52B0EE962C98D46CA@SN6PR02MB4157.n
> >> amprd02.prod.outlook.com/ # [1]
> >> ---
> >>   drivers/gpu/drm/virtio/virtgpu_display.c | 29
> ++++++++++++++++++++++--
> >>   1 file changed, 27 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c
> >> b/drivers/gpu/drm/virtio/virtgpu_display.c
> >> index c3315935d8bc..ee134e46eeba 100644
> >> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> >> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> >> @@ -32,6 +32,8 @@
> >>   #include <drm/drm_gem_framebuffer_helper.h>
> >>   #include <drm/drm_probe_helper.h>
> >>   #include <drm/drm_simple_kms_helper.h>
> >> +#include <drm/drm_vblank.h>
> >> +#include <drm/drm_vblank_helper.h>
> >>
> >>   #include "virtgpu_drv.h"
> >>
> >> @@ -55,6 +57,7 @@ static const struct drm_crtc_funcs
> virtio_gpu_crtc_funcs
> >> =3D {
> >>   	.reset                  =3D drm_atomic_helper_crtc_reset,
> >>   	.atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_state,
> >>   	.atomic_destroy_state   =3D drm_atomic_helper_crtc_destroy_state,
> >> +	DRM_CRTC_VBLANK_TIMER_FUNCS,
> >>   };
> >>
> >>   static const struct drm_framebuffer_funcs virtio_gpu_fb_funcs =3D {
> >> @@ -99,6 +102,7 @@ static void virtio_gpu_crtc_mode_set_nofb(struct
> >> drm_crtc *crtc)
> >>   static void virtio_gpu_crtc_atomic_enable(struct drm_crtc *crtc,
> >>   					  struct drm_atomic_state *state)
> >>   {
> >> +	drm_crtc_vblank_on(crtc);
> >>   }
> >>
> >>   static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
> >> @@ -108,6 +112,8 @@ static void virtio_gpu_crtc_atomic_disable(struct
> >> drm_crtc *crtc,
> >>   	struct virtio_gpu_device *vgdev =3D dev->dev_private;
> >>   	struct virtio_gpu_output *output =3D
> >> drm_crtc_to_virtio_gpu_output(crtc);
> >>
> >> +	drm_crtc_vblank_off(crtc);
> >> +
> >>   	virtio_gpu_cmd_set_scanout(vgdev, output->index, 0, 0, 0, 0, 0);
> >>   	virtio_gpu_notify(vgdev);
> >>   }
> >> @@ -121,9 +127,10 @@ static int virtio_gpu_crtc_atomic_check(struct
> >> drm_crtc *crtc,
> >>   static void virtio_gpu_crtc_atomic_flush(struct drm_crtc *crtc,
> >>   					 struct drm_atomic_state *state)
> >>   {
> >> -	struct drm_crtc_state *crtc_state =3D
> >> drm_atomic_get_new_crtc_state(state,
> >> -									  crtc);
> >> +	struct drm_device *dev =3D crtc->dev;
> >> +	struct drm_crtc_state *crtc_state =3D
> >> drm_atomic_get_new_crtc_state(state, crtc);
> >>   	struct virtio_gpu_output *output =3D
> >> drm_crtc_to_virtio_gpu_output(crtc);
> >> +	struct drm_pending_vblank_event *event;
> >>
> >>   	/*
> >>   	 * virtio-gpu can't do modeset and plane update operations
> >> @@ -133,6 +140,20 @@ static void virtio_gpu_crtc_atomic_flush(struct
> >> drm_crtc *crtc,
> >>   	 */
> >>   	if (drm_atomic_crtc_needs_modeset(crtc_state))
> >>   		output->needs_modeset =3D true;
> >> +
> >> +	spin_lock_irq(&dev->event_lock);
> >> +
> >> +	event =3D crtc_state->event;
> >> +	crtc_state->event =3D NULL;
> >> +
> >> +	if (event) {
> >> +		if (drm_crtc_vblank_get(crtc) =3D=3D 0)
> >> +			drm_crtc_arm_vblank_event(crtc, event);
> >> +		else
> >> +			drm_crtc_send_vblank_event(crtc, event);
> >> +	}
> >> +
> >> +	spin_unlock_irq(&dev->event_lock);
> >>   }
> >>
> >>   static const struct drm_crtc_helper_funcs virtio_gpu_crtc_helper_fun=
cs
> =3D {
> >> @@ -356,6 +377,10 @@ int virtio_gpu_modeset_init(struct
> virtio_gpu_device
> >> *vgdev)
> >>   	for (i =3D 0 ; i < vgdev->num_scanouts; ++i)
> >>   		vgdev_output_init(vgdev, i);
> >>
> >> +	ret =3D drm_vblank_init(vgdev->ddev, vgdev->num_scanouts);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >>   	drm_mode_config_reset(vgdev->ddev);
> >>   	return 0;
> >>   }
> >> --
> >> 2.51.0
> >>
>=20
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>=20

