Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A122A485B9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 17:51:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116CB10EB3F;
	Thu, 27 Feb 2025 16:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZAXypQGU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC14410EB39;
 Thu, 27 Feb 2025 16:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740675081; x=1772211081;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aDZBv8hdWDQwjK38IhSxJQqc27lZHO/BCeT7gSbpDi8=;
 b=ZAXypQGUZ6UM3oUj5WEUXZJgb9eg7A+qcLwvKfPv47O1I7XawrvgayLt
 v/qFWs2Ocfn4J9TAripbhWp4vWGV7a2KRB75OMfM6p5OYB1hXdHH9oeo1
 pzTY4RnvFOOhGRtSchyjnPEB8XcjBObuAubDb+JbajEadmHHgKC7IHsAk
 ooFngD0XUVlc3H0z3TPxRlk2Hv3wT+FH4lFzMAjsgq8DUoMEdgXivzby6
 yfHd5Z4dSMUe7MQfMJSNRIiyFNGJCVBBCUHuvJtDDzimT6SsTITc7oq3U
 mdZA2KAVrUT19RG7CVXquanEPq4T9Zjvd3MT6rgc2VYISJiZcYa+SJzcA Q==;
X-CSE-ConnectionGUID: S89PT9XMTrO4a3HYg7ZvKA==
X-CSE-MsgGUID: v5ylYL+vQVKirJV3eOoo3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52219347"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="52219347"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 08:51:20 -0800
X-CSE-ConnectionGUID: HpTvYol9RyijTHoTJZAwBQ==
X-CSE-MsgGUID: ZKE6PfldTRGMjbewmlqMeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117606588"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 08:51:20 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Feb 2025 08:51:19 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 08:51:19 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 08:51:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iEeeecLfEZC0mWM7JXe1xpv6HOaZGKvaw33AHTO9UmWbVGSlHNM8AF/gI1kfYFRPVjYMvvNysHefV3vzBBaSZH5wkdUn5z/AvhS3IwT4Catu87jnbjIpXauzeiNCNzKIIPPDbBuJ4DgJYLl0ReXeD7Gc4Ix8X+FQ/fExH3bAAoSe6WuN3tH5x73Skokqsj1dco3WN5hPuFBzekc+w75on5pO1ojavKbX+kyf0oX2TkNO0uqkWrBgnqFjVpM//e9JVretKWS40AJKhCRt2erHaYjERaL30ZUEhG4hCwHMNLpvUug5c19/d+9rdTXBTo4DDoLW7lGhE2awxZnaFvDXdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXq3hCIo4k/5JeuaAP6eLHF7Q/wNhF0SPYdxiTIuZ0s=;
 b=Cpv9h6hs2g0Od7c1Fi8O9B6BtTsA+gd00WLZqAf88qJkLgdOE6qy8/llvX9FJMgF2wBCbr0G8d5g04GD492nmQ4h2T1YGR3HtZsLSN5yhMluXOK2y/EvfLBWVe5B1LDPXr2HtveDpVno2YzY0jfuvk62Mt1KN+aKYonyAc4enCK3zrekI+hcjA/tRgMACE+RUT8d143M17DMDTR50v+9iTmSAjllzWIMZtpbjK14n5ZI9AfQ9VVkEza0OSdVg4w0tzDB9/GorHhcrcVdp6kfrat/VNw8oKSYaNn/RSJzVfA+clJ7ODe3Yn0/xcLuK3GmDvHpwv589XIppiDpy4OnIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MN2PR11MB4695.namprd11.prod.outlook.com (2603:10b6:208:260::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Thu, 27 Feb
 2025 16:51:16 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 16:51:16 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Mistat, 
 Tomasz" <tomasz.mistat@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Zhang, Jianxun" <jianxun.zhang@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Topic: [PATCH 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Index: AQHbiKGhr3IjOFZz10m9C1EPKJstS7Na0QuAgAB6M8A=
Date: Thu, 27 Feb 2025 16:51:15 +0000
Message-ID: <CH0PR11MB5444E8B7371E3DE4708E1733E5CD2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250226225557.133076-1-jonathan.cavitt@intel.com>
 <20250226225557.133076-7-jonathan.cavitt@intel.com>
 <Z8Ahdyn0KgfmE9M6@lstrano-desk.jf.intel.com>
In-Reply-To: <Z8Ahdyn0KgfmE9M6@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: joonas.lahtinen@linux.intel.com,tomasz.mistat@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MN2PR11MB4695:EE_
x-ms-office365-filtering-correlation-id: 3cbeda4f-cadb-4b8b-1396-08dd574ef36a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?2dZKoJjlTjEZZjWCLjjsEe0Yl/xg5J7K9DVkFr0NS+D7EXA2t4r0WZ3njyx0?=
 =?us-ascii?Q?Yet1Uhf50pF//9QKfxky+HvLa9lDHA6WZ4egqzvkz9UsIoIEmnD4+GcAtiME?=
 =?us-ascii?Q?gnbBDgY37sHwGFlHClR34E2wFKRgbAs7hfVFUD74hj3XBTB7wcgRU0UjdcpR?=
 =?us-ascii?Q?FTnupBjrbwqF/1PhRvD+DHOrCD4c998GU0t5lHnwK4CJHX2LK2Mx9VTBz83O?=
 =?us-ascii?Q?OaIYgRngcbigHcc9Dyz2VI1Hrq0bFXMo7e8Femsc4R6EB0Hijw6AA9sz5Dfg?=
 =?us-ascii?Q?0wM3t+1xVB+yQkyfkBvKhkFokp+saMlkGwFQcwhcLnyOZSzNM5iFBZ4suGrK?=
 =?us-ascii?Q?NrlDGcC4eLsTActWVpqAByOqJi+9TauZ9nSr6ofmYN6mIqEG2EcDzmQEQhuu?=
 =?us-ascii?Q?+ZuNiy9gPMoZu44tuZZEUqSTKUWfQTBVENf1lRLx+Oohsm3+52ZWBOY85MVu?=
 =?us-ascii?Q?Hs0VCNJmRfmoBLqdV6W76w4QDVradLUg+EH12TgwFc86KD3smLeBa4ZvVqdK?=
 =?us-ascii?Q?qmgK0BnslXzJntMzaWlxf4E1a+m6n+K4ygBct0BedQcFGGckIbxxrQ1cXqqm?=
 =?us-ascii?Q?hmnwjYRO7N2/GOJk8x+3KrBbnFXOQgQEs+KHKY6jdIXwvUTVdakwb6iNAzwp?=
 =?us-ascii?Q?PvTnQR6AlrYUyBNo9VWgbJ8+x9Qdh3GQB0WITNTruZNy+PpDU1yvN+S8+4Em?=
 =?us-ascii?Q?1UOPsPJItThjm9OieUXMDDQ8XEInXgANBMw+FULAN8mgFNppYDWWjm26TFse?=
 =?us-ascii?Q?6YGs6lums0wgEEDmx8RPHYm6RcP6gEXiXAzu2duE3JnvqCvAwRyZuex/Ls5c?=
 =?us-ascii?Q?WL7XcldaULdn55IF4G6hXLtWADdUOdK0H5M9BYJ8miXVhuBsryRSjldIvsji?=
 =?us-ascii?Q?OqEiRSq0jOu0wNoJ43ir7j6rRrN81HKO58WkmAGKTNW1Udnes3P0LmH7+gBC?=
 =?us-ascii?Q?witxtIXSGmnfAtglAILARyi2+6XkTEQWZPFg/Ba5jqTw8PDuM50FmkC1g5a3?=
 =?us-ascii?Q?q2YRW4KY+N6DvHcKMabwOW5PhUG7X3y6Uc3NqlX1KvtXE00Hj46F5niFzIVW?=
 =?us-ascii?Q?5xrBpJ9MEWR0GvPjMpQPA6YFzBqF5ERiXESaGlIXyUstHu6yBVytakwk8FR7?=
 =?us-ascii?Q?AX9bEOvLrxddU7iKZtPuGZ0rdsh1xkpjcYn7mt1xttafFsGETaT35A5EG4ax?=
 =?us-ascii?Q?AgeetTKm7n+x4zM00q+QilOvO1ZiU29OLkQv2scGVdS3kVTRvPGSs3dwMxcW?=
 =?us-ascii?Q?mOdcEj6vN7JppvBAFDdQH1LsO6evdQus9gmBJFEdCkaLNOxlKukljcfiX6bG?=
 =?us-ascii?Q?j+snfJvhVUg7TzUY4wBVixbnnKOKIMR7kbeBZkmga2BzGqqPVLgJFi+F8Gew?=
 =?us-ascii?Q?SwoMmSvxCVBg0SMNMLhXUIW9qOXnW2k+mVPUQxnIcp29cJlCOQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xQGMrlRZ5c2EE45u4bSfzJdLhNlwuSEpIstK3LKMdCCiH0RSmYyfGSbcHu6Q?=
 =?us-ascii?Q?8Gb+rLmzCRdiI8ZkHblDyg/Y7MeLxu7jMC1zJrf/yCT1k+7hkF1ORBTKr9yA?=
 =?us-ascii?Q?a36/Qj3tvxa76Ttl6FEZIoG2dfiwitUo/5zqA1LpSPI5dT5Ir3N46m3rj5p5?=
 =?us-ascii?Q?4wOfDnsHGnoL61ajEcwfw86Xh8kVugtY07PKZIm/1QSGG/HShx1mB2nrfnkC?=
 =?us-ascii?Q?8gjNq1Bro3u/GARt8US1f+GkIFrJNS8xPzCjZ5laEDetpHmThso0tafusc5G?=
 =?us-ascii?Q?4L5QFYplY0AhbELnZGtIjdePTW0yU11f5O1j2WJGC5CMMl2w61Qjt/uLU9KZ?=
 =?us-ascii?Q?CyrXoJGofe3iL7AJvO5S+tRWwz+3YpLfr3+rfqMn6yAH7PQ5cdHXfE1oa3L/?=
 =?us-ascii?Q?IwrT8f4zg8glrqHlteTD2POTSNR9L3wkMQDs1dZ6Tcpw4g7NJzKnIqqoaZat?=
 =?us-ascii?Q?mzoLD4MdkgQfLCHaJhanv/QWBPtZVFvZzFT9FGyTLNp3756F0sviAqp9Xy7l?=
 =?us-ascii?Q?rRXTr0mhyiJWW5sDtEdBUC7AjrG5Z32+Bh3WaYfly4qRL+EcEJxFuB3cp33E?=
 =?us-ascii?Q?yFbvxhpLoB05CXZCrDxWUNP2N86QlAQBgWcO9rS3l57vE/+EbFUPXbPMTu43?=
 =?us-ascii?Q?d4e7vRtluKiDh1K5VIgrtDXPsfWPnsBKJD533T/mkclJzTndoRxI6wDRrQ93?=
 =?us-ascii?Q?hBH/+TDaFKbIYehQZWZmFXOeGU6+pZw+isWvy2cQ4VwOyRbWloKAa+5+yffA?=
 =?us-ascii?Q?4cKTdl93XoOqCNdPkKcLK5liZvuaBVIA7k/a4cqwgBj3SOaH15tteE8NN2Un?=
 =?us-ascii?Q?DjYcFveEImy0pE2/cmwmgJr2SceHZkd+AfKmODEuFsCofTLZENDLD3xXN1cV?=
 =?us-ascii?Q?1R88JFxaSkTOcT3f6ZjsToiaruTwjGRJibl8MzLZwfwaBkdQpnFlAaGyUnt4?=
 =?us-ascii?Q?2DjoarhKmq5oNc4fbsVZw14F52C7gOeI6AEsFLN/xHf3k4c+5SjfeIBY9Q65?=
 =?us-ascii?Q?HSRuOL6l25g5BY3ThScwxXHOfTtFiHn9lqoNypA1LV0MbEoFZ+ryRGn8ZrDY?=
 =?us-ascii?Q?ClVlpR9lts4SKmYeGyWmoi0KfidcMzIDPBUzD1fNvYh89XgNjGhJ3hvmbYgJ?=
 =?us-ascii?Q?i4CRrS9GEof3nKR/6g6+/fIJkz7fNW1/CwfQAFzYH+RWVPJ2Nz9o+u3VHd7W?=
 =?us-ascii?Q?GQbf3RIcHRBB6BzA8q2GypsU7+XowsI1Vy9kmOcKUAOcASnVJWSoUuTIWXgo?=
 =?us-ascii?Q?8tgVFFs9JbdWUi853YhA0LlEpXsQyn6xr347QrMqsOaUvLQoVHPG5qNWFHgT?=
 =?us-ascii?Q?ZUcTiOOZp/427cCo/dz32A7AzSVTh/K1uUp/pKMtpI3mOFIK2t2xm+bxO44Y?=
 =?us-ascii?Q?t5Sk4SzYDXzq16y0AG1XHMxeHkg+4lsXU4NmpCZrZoLjPXkwq5w6wsgQ80kA?=
 =?us-ascii?Q?KkD3nnDJx8DAaWYTy5onrT2pH0DmImKDA/w1yBNi9ws5J+LZGckVvh4QDKbq?=
 =?us-ascii?Q?C8ViucxfO+D3RyhdIlyouSOm6KZmszpcTi/5pDSnMuF4g5wA49r45NZ8qY6G?=
 =?us-ascii?Q?z1LgmjIjS9UZ9mpQ1ApuBP0GAfkpqnsyC03uL7m+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cbeda4f-cadb-4b8b-1396-08dd574ef36a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 16:51:15.9315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mFfpxfWdSphC4kkag46EFTTPbMW3++37WYc1oMn14p9CpsLEgqR67PeWNSeexeJdLBigyvSBJkET3583j7m+xlczHnDjlb/N+NhSjCLKxKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4695
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

Some responses below.  If I skip over anything, just assume that I'm taking=
 the request
into consideration and that it will be fixed for version 2 of this patch se=
ries.

-----Original Message-----
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Thursday, February 27, 2025 12:25 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Zhang=
, Jianxun <jianxun.zhang@intel.com>; dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
>=20
> On Wed, Feb 26, 2025 at 10:55:56PM +0000, Jonathan Cavitt wrote:
> > Add support for userspace to get various properties from a specified VM=
.
> > The currently supported properties are:
> >=20
> > - The number of engine resets the VM has observed
> > - The number of exec queue bans the VM has observed, up to the last 50
> >   relevant ones, and how many of those were caused by faults.
> >=20
> > The latter request also includes information on the exec queue bans,
> > such as the ID of the banned exec queue, whether the ban was caused by =
a
> > pagefault or not, and the address and address type of the associated
> > fault (if one exists).
> >=20
>=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > ---
[...]
>=20
> > +
> > +struct drm_xe_ban {
> > +	/** @exec_queue_id: ID of banned exec queue */
> > +	__u32 exec_queue_id;
>=20
> I don't think we can reliably associate a page fault with an
> exec_queue_id at the moment, given my above statement about having to
> capture all state at the time of the page fault. Maybe we could with
> some tricks between the page fault and the IOMMU CAT error G2H?
> Regardless, let's ask the UMD we are targeting [1] if this information
> would be helpful. It would seemingly have to be vendor-specific
> information, not part of the generic Vk information.
>=20
> Additionally, it might be good to ask what other vendor-specific
> information, if any, we'd need here based on what the current page fault
> interface supports.
>=20
> [1] https://registry.khronos.org/vulkan/specs/latest/man/html/VK_EXT_devi=
ce_fault.html

The original request was something along the lines of having a mirror of th=
e
DRM_IOCTL_I915_GET_RESET_STATS on XeKMD.  Those reset stats contain
information on the "context" ID, which maps to the exec queue ID on XeKMD.

Even if we can't reasonably blame a pagefault on a particular exec queue, i=
n
order to match the request correctly, this information needs to be returned=
.

The I915 reset stats also contain information on the number of observed eng=
ine
resets, so that needs to be returned as well.

@joonas.lahtinen@linux.intel.com can provide more details.  Or maybe
@Mistat, Tomasz .

>=20
> > +	/** @faulted: Whether or not the ban has an associated pagefault.  0 =
is no, 1 is yes */
> > +	__u32 faulted;
> > +	/** @address: Address of the fault, if relevant */
> > +	__u64 address;
> > +	/** @address_type: enum drm_xe_fault_address_type, if relevant */
> > +	__u32 address_type;
>=20
> We likely need a fault_size field to support VkDeviceSize
> addressPrecision; as defined here [2]. I believe we can extract this
> information from pagefault.fault_level.
>=20
> [2] https://registry.khronos.org/vulkan/specs/latest/man/html/VkDeviceFau=
ltAddressInfoEXT.html

I can add this field as a prototype, though it will always return SZ_4K unt=
il we
can have a longer discussion on how to map between the fault_level and the
fault_size.

>=20
> > +	/** @pad: MBZ */
> > +	__u32 pad;
> > +	/** @reserved: MBZ */
> > +	__u64 reserved[3];
> > +};
> > +
> > +struct drm_xe_faults {
> > +	/** @num_faults: Number of faults observed on the VM */
> > +	__u32 num_faults;
> > +	/** @num_bans: Number of bans observed on the VM */
> > +	__u32 num_bans;
>=20
> I don't think num_bans and num_faults really provide any benefit for
> supporting [1]. The requirement for [1] is device faults-nothing more.
> With that in mind, I'd lean toward an array of a single structure
> (returned in drm_xe_vm_get_property.data, number of faults can be
> inferred from the returned size) reporting all faults, with each entry
> containing all the fault information. If another use case arises for
> reporting all banned queues, we can add a property for that.

I'm fairly certain the full ban list was directly requested, but I can brea=
k
it into a third query at least.

Also, the abstraction is done here because that's how copy_from_user
has historically been used.  I'd rather not experiment with trying to
copy_from_user a structure array and bungling it, but I guess I can give
it a try at least...

>=20
> > +	/** @reserved: MBZ */
> > +	__u64 reserved[2];
> > +	/** @list: Dynamic sized array of drm_xe_ban bans */
> > +	struct drm_xe_ban list[];
>=20
> list[0] would be the prefered way.

That is not how dynamic arrays are handled for
struct drm_xe_query_engines,
struct drm_xe_query_mem_regions,
struct drm_xe_query_config,
struct drm_xe_query_gt_list,
struct drm_xe_query_topology_mask,
struct drm_xe_oa_unit,
or
struct drm_xe_query_oa_units

>=20
> > +};
> > +
> > +/**
> > + * struct drm_xe_vm_get_property - Input of &DRM_IOCTL_XE_VM_GET_PROPE=
RTY
> > + *
> > + * The user provides a VM ID and a property to query to this ioctl,
> > + * and the ioctl returns the size of the return value.  Calling the
> > + * ioctl again with memory reserved for the data will save the
> > + * requested property data to the data pointer.
> > + *
> > + * The valid properties are:
> > + *  - %DRM_XE_VM_GET_PROPERTY_FAULTS : Property is a drm_xe_faults str=
uct of dynamic size
> > + *  - %DRM_XE_VM_GET_PROPERTY_NUM_RESETS: Property is a scalar
>=20
> We need to consider where the number of resets requirement is coming
> from. As far as I know, the Vk extension [1] we are targeting does not
> need this information. I'm unsure about the compute UMD requirements at
> the moment, so let's focus on supporting the Vk extension first.
>=20
> Any uAPI must also have a UMD component, so focusing on one issue at a
> time makes sense.

See first reply.
-Jonathan Cavitt

>=20
> > + */
> > +struct drm_xe_vm_get_property {
> > +	/** @extensions: Pointer to the first extension struct, if any */
> > +	__u64 extensions;
> > +
> > +	/** @vm_id: The ID of the VM to query the properties of */
> > +	__u32 vm_id;
> > +
> > +#define DRM_XE_VM_GET_PROPERTY_FAULTS		0
> > +#define DRM_XE_VM_GET_PROPERTY_NUM_RESETS	1
> > +	/** @property: The property to get */
> > +	__u32 property;
> > +
> > +	/** @size: Size of returned property @data */
> > +	__u32 size;
> > +
> > +	/** @pad: MBZ */
> > +	__u32 pad;
> > +
> > +	/** @reserved: MBZ */
> > +	__u64 reserved[2];
>=20
> I'd put the reserved bits at the end.
>=20
> > +
> > +	/** @data: Pointer storing return data */
> > +	__u64 data;
>=20
> union {
> 	__u64 data;
> 	__u64 ptr;
> };
>=20
> We would simply return 'data' for properties that fit in a u64 and
> perform the size=3D0, return size process for properties that require a
> user allocation.
>=20
> This may not be relevant at the moment if we drop
> DRM_XE_VM_GET_PROPERTY_NUM_RESET.
>=20
> Matt
>=20
> > +};
> > +
> >  /**
> >   * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE=
_CREATE
> >   *
> > --=20
> > 2.43.0
> >=20
>=20
