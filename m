Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7847BC5661D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 09:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977EC10E7D9;
	Thu, 13 Nov 2025 08:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLaEE8kc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E5510E34F;
 Thu, 13 Nov 2025 08:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763024066; x=1794560066;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ubqLNy97mvTUDIJcbRh3sYSjsduTQ2VffaQBSQ6CMSA=;
 b=JLaEE8kcMzZ373nOD3qg5Aq16YrJ9u5fbY352jT2cUXZUPQ9cenO0Soz
 CPFO5IyS60CXlC7HMcETrera8Mzr3F+U7Cnt384ZFJQ7oiCtxn1XqmfI/
 HAI6i5F1KSiSiKXziDmWJR4PB5Z77B2ks3b/49TtteKspfrq30CGW4lEJ
 1hOvFbLuZH8UTpmUd9/7zNkiQDi7CNovMYwslL2E7XyBw7FyJ8zxcpLa+
 /2rGGqsouOot1E5buxyjiXLDJyxxkdvBZc8KRLJjT1haAU8s+tz6g2qQ9
 iEnYWydCiMKjDShZTO5UljqmUe98OlCaEdiCIzYRUOK1Knk7HYFCfaD/y A==;
X-CSE-ConnectionGUID: tjMqjwKxR9uVcbyzoJgLJQ==
X-CSE-MsgGUID: IKEaxrRARfCkwGAiQQS7CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="75778101"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="75778101"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:54:25 -0800
X-CSE-ConnectionGUID: 61KLkP9XSK+ddgUoV9cDwA==
X-CSE-MsgGUID: RCJ0oASIQoWqlUu2eBQQWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="193701209"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:54:25 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 00:54:24 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 00:54:24 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 00:54:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6tGtvDB4HN+UVdIOzSv2tRhORt5B6AMiAraWdPIXAUbh7VzVJEHqkL3a0+IOKs1X6DOI76PCgjtWKM8TiwwWmX4+zgwcrlUmDqh1V+xDTaC9xhVypIcvJoWQ6FHsTcOLMCJjdD/g/44YBXTcLJxmnOom02osOCt71cFgCsO9wSeVEJUuyQvM0mEigbvntztL96rb7VPuKjlMU3v2N1GROlvZ+KoZZkzQG7IQdz71PZy88MgBwAmU3+vrjsFrV8Tlpx6i8W1iAMY6GofYM4zrLXUbpOfR0gg01wN1otgjkepnzy4yc61Vp8rU9WmMK9k1tiQ1kcpq7XoGb3xy0smQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilPzzLcPI61MKpJTPgFYfRsJtt0wzQebl9F4tNeDEy8=;
 b=Hl/Agyp/jT1elPP18qkEnqEn3cw/Wu9/E8QGoiVjFF/JbO0Togvq6KDTklJsXVVHX+u5lj0y3eVPS7pOSrurpcYh11S93SURRJO3YCKSFMCkb+PhunlFHKBnlYBm43dkQjqT1mpHieBf+vB150bu3AlfivVguoGZJj31ZzkKA5cBIc+lORWWacfW7m014GHZsdNzP6AOLsMAPXyplldUoM4mcqxvW97eTWeUmXnhxP82FnBuwIs46vuiqJEVcc3JJtkgHI1BTWPGawPU5xMcskTBrosHn1/EQNVSuS4f+vTd2vdQJjaBvBlohd8xWZXCpb9X/gqF6+ywV6a3mR3f4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA2PR11MB4779.namprd11.prod.outlook.com
 (2603:10b6:806:11a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 08:54:22 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 08:54:22 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Deak, Imre" <imre.deak@intel.com>
Subject: RE: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
Thread-Topic: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
Thread-Index: AQHcVFeIsN6bopHDnE6NSW3ozkyKJbTwRXoAgAAHsBA=
Date: Thu, 13 Nov 2025 08:54:22 +0000
Message-ID: <DM3PPF208195D8D7C8C263E115ABED5A500E3CDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251113043918.716367-1-suraj.kandpal@intel.com>
 <c47f1221281e998f53169ffd0a2e06b301bb1605@intel.com>
In-Reply-To: <c47f1221281e998f53169ffd0a2e06b301bb1605@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA2PR11MB4779:EE_
x-ms-office365-filtering-correlation-id: 4455f3ae-5231-410d-0684-08de22923d41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?4QlZKiP0moWutl6QdAhfnbiYpr8KKDGLGK1wEycT/bzFRFXNJIdNnHjO+c3A?=
 =?us-ascii?Q?06oD85jRd0Vy2Iyn/7ByoiQQgG7CIe8hk7iBIds6DrFFLJOz+wziamXWIVmv?=
 =?us-ascii?Q?FB5goEGGwTIozocxQXW0qHpT9aXC3ZnCxAXYUkNhpod+JdtEPOUNOyDpR81G?=
 =?us-ascii?Q?pm8OiTD3SpJwLv+wTWu+JYRGTt64Ul+4UTuIz7igexFoDiM2GUUghekA/v95?=
 =?us-ascii?Q?9fk/oimOstCoFoDjYBt+TYqjrDwCreZxqpDt4cz5Y5Pbv3cOPYe6Q1OoJ1ZS?=
 =?us-ascii?Q?DPpUOvUQrkwWY3z2GlQS1yCqVN2bSQy4zNlyiyNL8a0I47oyue/OVK+ICiCC?=
 =?us-ascii?Q?uXnu4Y0V/tskZ9ZrYaFIGSH/8MKG6/r2xcC3pa4gWaPZ+A0tgSDpH7cVbRF5?=
 =?us-ascii?Q?PulZSse/k4V3PFWuuHslAeuTTXPg3D51bssdpAPfi6Mtf6Nw5rK+EiktqBaj?=
 =?us-ascii?Q?4QCM9N+L4tDuSHexU55s/d+WLAGUzMt2GXA9qVf8Y9RWZpDP57k18HcdbBaI?=
 =?us-ascii?Q?szsROyw5RsVMiBu8xjbx70YHx/hTirhuxC5ABqw85jLM5QPiqSZB+4rl1nEw?=
 =?us-ascii?Q?HPUkUGm0tD1bNPwvXP+CmLc3PqA0kizspyRBdx8PpmIOPkhPHjgL9Qv8ZEdP?=
 =?us-ascii?Q?IBLYCAEzcbPoPlrUGT8NKR5pPtOCyHAZ5BZYWLaq6LuhbKDHvdZ00OE+3h6t?=
 =?us-ascii?Q?ljtp6lehp8Ujn91qMCCoHdTgH4GNOXi3U8nb6LWWDrJAFXuQZoJVSK/F5oqJ?=
 =?us-ascii?Q?MZEjCZAdle/EB+MuASO+MxRJPTVcIDqLF+GeYvYZeS3U94EgZ4x3N1nZMWPY?=
 =?us-ascii?Q?LYOIGmU0wot1cL12Vr6jMjE7lOZg3Z21V0+GqgM7yu6rD6Kj5j69yFssemB1?=
 =?us-ascii?Q?pkTJ9A6QS7mb+Qw0fDmYFA3n5lo+3U7nnWN/jBs4vFJO/I3by5MskztxYqWS?=
 =?us-ascii?Q?mfTJDbuQqspevVrzeuTQ7ppDKDRwE8NkNzZcu2NAae7XeVFBkl30kvQacBgH?=
 =?us-ascii?Q?NQPegMT9O6qAYbEjJ6clK6wrTQiNAb6px65qrmc+qj3LuQnRUpj6plBJlL0m?=
 =?us-ascii?Q?lF3qJnWUrqZe6cV9LL5Byi/LN0r4AZJn+9NAdmxmNU9YSRjmwWfq4EPDRzDQ?=
 =?us-ascii?Q?ylKMde041DT+Mvi8JMLuveXrpyI+jA9MNEZFkVFxDwzC4y7ekF7ohOrCr8Oq?=
 =?us-ascii?Q?XQkYxRzZv+RmPbwLLxOke+5ZQyABDbVJhV0h2uPsNq0o97sEgALEoGJN+fZH?=
 =?us-ascii?Q?5LkJS3t1YvvRAoRxlQVZ3LU6123zz0moKm6TbL6x4RkDR68HdOUUH6tmVlSe?=
 =?us-ascii?Q?qv2kGoJBT9+RnfPqZ3RuNMq3k00S6Oz64n32MdQfRjvhruz0E8VhY8UbuIhF?=
 =?us-ascii?Q?7XQT9mHGy+Ro1Mle0IXeoXWquKlr/yWxL1Kcifv0UHDt1JhHgHG7F+3QyT1Q?=
 =?us-ascii?Q?KIKtMmA5YnXW5+0/U5mmgwbjlQ5go2bPIF7myjxUWhqb1/LP5Vfh4tGmRku0?=
 =?us-ascii?Q?VEzxCAriO8L8AMVTzPO1vdf7W+rRY8lSiniI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iT3WfkUlShX6MBL5wolOe0xWRYzShIdgs0XRqSHMXixQHWY95LrptruvyqMG?=
 =?us-ascii?Q?zL/HNqxXhQFJn7N8yiyAjjTzZoEw1wFum/ke9r1nA/ZR4ET+iEsZG+Z/nNg0?=
 =?us-ascii?Q?RKpKTNVX/S0EZyX/W8pdUWCweNouk35QKLRLQdSlyOQhMJaqytXwLO5SHMXC?=
 =?us-ascii?Q?7PS9HgILZ9R47YPHyUupt8oL+MB8mq47UIJ0Us7LGwKd4l1w+Q0Z4uOWW0HB?=
 =?us-ascii?Q?OXfpzm8Z7sqKO46xRowhLCtv2WHyYlnu5mrF1Hla35Z0qOtqqK92JxIp/oWo?=
 =?us-ascii?Q?C+5tILuqLXkIiPOMfo/qZ9E+w7qkYRfUV+TOoKDmK9CNuUuBZSsmeTCqp2yR?=
 =?us-ascii?Q?2WRzdu6cHLMRU0x4b7doiPr6Al8BiFGQTBStxwZOj8W7Qfc70D7VG9kgELFc?=
 =?us-ascii?Q?Wzc1QrY3RNvm7efCNUJOchdS0ERNR+Qoqd36cJFy1wt1/wWWXa/lo2wRKjbR?=
 =?us-ascii?Q?2+E0MZY0JFa8z9J/PlbADmdpBAD+Wq6xzjuhgU5raIlbuq8yCO6zFTU//hS8?=
 =?us-ascii?Q?mpnrofRwmrCdb4mCNtqvbuYtOxJldY8jTldN/UCtdCAr5ipHlXyMEG1uZ+22?=
 =?us-ascii?Q?SYFuQsJk41uY4+YngC7rXe5km+zN1j+PQoWPDRbpuRaFWXuWRunkgoM+R0Xg?=
 =?us-ascii?Q?2Q2sIz8dpNBrowuV4TGOfKuSaG5DJ4p2uZ+Nqb1aECw8LRRPFWBvCE7DHA4l?=
 =?us-ascii?Q?MY7Cul9EHfGIAVT3v+PwhjBe5qCZHVJirZws3t5uXU3l3Iirv6baWGUl2yB3?=
 =?us-ascii?Q?8a6Sg/FXPj6742H+iz1QsV2EzXPMeeAlClin+w+eLEpsqnPmJeC+osVIwhFG?=
 =?us-ascii?Q?jCt2diLKQcBI//GUt7a0SvHtInGAogKnUcPpjTk5v7QcrKY5PeuoCMgX8TqQ?=
 =?us-ascii?Q?OcQw2qxZVOpp0/1PSukHmPqqWvpZQcMQ5M9fNM6F0B8fbe7YP3LGzbH9QJeq?=
 =?us-ascii?Q?ShrBy3vcBBQ+aShSUpWzYQX/Bw+FrOBrvw3DPIfdKCwmRPess77bxFnz51Jw?=
 =?us-ascii?Q?qKsZePhlO9bkNZBTdKHct4bUDnqxifKbOtgE+e6ivRM6sb6gWvESeOkLCJbx?=
 =?us-ascii?Q?ERgtzN0RFyEWYNL0z6pnGnDiuj+XDMefx1yspMm76RA+2/BObDNMSQbZvahY?=
 =?us-ascii?Q?7TrLrKNZZqfdKBdQ/4sp3w3UfbSmhrQoCV5Ki6dWEVDOYPfWuXBPHGlsSWWo?=
 =?us-ascii?Q?0l0zQeGuBXJ2lOT86IGUsfCQOHOinHUDC2ak0igd+mnH3SOfICW1uc4EtEG3?=
 =?us-ascii?Q?76kedtzVkXUb7w44x2815IUBGVhT0tWPTj5UxNutIKEuXiZh7s6apWhERICh?=
 =?us-ascii?Q?6DaeonfjXtxOtj2gi3BCzbQp55sv3wz0cJzWUWrzvXxdV03AlFZiI+PjeURe?=
 =?us-ascii?Q?z19Tpxo4DNZftQB8R/gdsFONGXtoMmz84W5kjDV5s3rcGLyEvJzWEXStTHNa?=
 =?us-ascii?Q?BsZKMWP7lvrDc0SGlKBqH+SJmrAPQ9H+jhhozK8V+qfKi4cdUOFgWgysWIRd?=
 =?us-ascii?Q?RCVdl5JPdmyjghvF0jpVUxMFvY5BS6LOgluoRI9HDYtwhoJnj72eIMxkFM1q?=
 =?us-ascii?Q?iJHzNld77X7Fz9PCeEssJr7lPERTzqqPxwkeOL1w?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4455f3ae-5231-410d-0684-08de22923d41
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 08:54:22.0851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AZJ3y3Dx7BvwcjVFf9+SPg9ss6iTuJrb34BANjKVb0KRrYFsYvUjatpR0rO85ug4xoaQLp+piF6m/MrSisKTkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4779
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

.deak@intel.com>; Kandpal,
> Suraj <suraj.kandpal@intel.com>
> Subject: Re: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
>=20
> On Thu, 13 Nov 2025, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> > When releasing a timeslot there is a slight chance we may end up with
> > the wrong payload mask due to overflow if the delayed_destroy_work
> > ends up coming into play after a DP 2.1 monitor gets disconnected
> > which causes vcpi to become 0 then we try to make the payload =3D
> > ~BIT(vcpi - 1) which is a negative shift.
>=20
> Is that a real scenario or a hypothetical one?
>=20

This is a real scenario which ends up throwing the below error
<7> [515.287237] xe 0000:03:00.0: [drm:drm_dp_mst_get_port_malloc [drm_disp=
lay_helper]] port ffff888126ce9000 (3)
<4> [515.287267] -----------[ cut here ]-----------
<3> [515.287268] UBSAN: shift-out-of-bounds in ../drivers/gpu/drm/display/d=
rm_dp_mst_topology.c:4575:36
<3> [515.287271] shift exponent -1 is negative
<4> [515.287275] CPU: 7 UID: 0 PID: 3108 Comm: kworker/u64:33 Tainted: G S =
U 6.17.0-rc6-lgci-xe-xe-3795-3e79699fa1b216e92+ #1 PREEMPT(voluntary)
<4> [515.287279] Tainted: [S]=3DCPU_OUT_OF_SPEC, [U]=3DUSER
<4> [515.287279] Hardware name: ASUS System Product Name/PRIME Z790-P WIFI,=
 BIOS 1645 03/15/2024
<4> [515.287281] Workqueue: drm_dp_mst_wq drm_dp_delayed_destroy_work [drm_=
display_helper]
<4> [515.287303] Call Trace:
<4> [515.287304] <TASK>
<4> [515.287306] dump_stack_lvl+0xc1/0xf0
<4> [515.287313] dump_stack+0x10/0x20
<4> [515.287316] __ubsan_handle_shift_out_of_bounds+0x133/0x2e0
<4> [515.287324] ? drm_atomic_get_private_obj_state+0x186/0x1d0
<4> [515.287333] drm_dp_atomic_release_time_slots.cold+0x17/0x3d [drm_displ=
ay_helper]
<4> [515.287355] mst_connector_atomic_check+0x159/0x180 [xe]
<4> [515.287546] drm_atomic_helper_check_modeset+0x4d9/0xfa0
<4> [515.287550] ? __ww_mutex_lock.constprop.0+0x6f/0x1a60
<4> [515.287562] intel_atomic_check+0x119/0x2b80 [xe]
<4> [515.287740] ? find_held_lock+0x31/0x90
<4> [515.287747] ? lock_release+0xce/0x2a0
<4> [515.287754] drm_atomic_check_only+0x6a2/0xb40
<4> [515.287758] ? drm_atomic_add_affected_connectors+0x12b/0x140
<4> [515.287765] drm_atomic_commit+0x6e/0xf0
<4> [515.287766] ? _pfx__drm_printfn_info+0x10/0x10
<4> [515.287774] drm_client_modeset_commit_atomic+0x25c/0x2b0
<4> [515.287794] drm_client_modeset_commit_locked+0x60/0x1b0
<4> [515.287795] ? mutex_lock_nested+0x1b/0x30
<4> [515.287801] drm_client_modeset_commit+0x26/0x50
<4> [515.287804] __drm_fb_helper_restore_fbdev_mode_unlocked+0xdc/0x110
<4> [515.287810] drm_fb_helper_hotplug_event+0x120/0x140
<4> [515.287814] drm_fbdev_client_hotplug+0x28/0xd0
<4> [515.287819] drm_client_hotplug+0x6c/0xf0
<4> [515.287824] drm_client_dev_hotplug+0x9e/0xd0
<4> [515.287829] drm_kms_helper_hotplug_event+0x1a/0x30
<4> [515.287834] drm_dp_delayed_destroy_work+0x3df/0x410 [drm_display_helpe=
r]
<4> [515.287861] process_one_work+0x22b/0x6f0
<4> [515.287874] worker_thread+0x1e8/0x3d0
<4> [515.287879] ? __pfx_worker_thread+0x10/0x10
<4> [515.287882] kthread+0x11c/0x250
<4> [515.287886] ? __pfx_kthread+0x10/0x10
<4> [515.287890] ret_from_fork+0x2d7/0x310
<4> [515.287894] ? __pfx_kthread+0x10/0x10
<4> [515.287897] ret_from_fork_asm+0x1a/0x30

Refer to gitlab xe issue:  6303

Regards,
Suraj Kandpal

> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > index 64e5c176d5cc..3cf1eafcfcb5 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -4531,6 +4531,7 @@ int drm_dp_atomic_release_time_slots(struct
> drm_atomic_state *state,
> >  	struct drm_dp_mst_atomic_payload *payload;
> >  	struct drm_connector_state *old_conn_state, *new_conn_state;
> >  	bool update_payload =3D true;
> > +	int bit;
> >
> >  	old_conn_state =3D drm_atomic_get_old_connector_state(state, port-
> >connector);
> >  	if (!old_conn_state->crtc)
> > @@ -4572,7 +4573,8 @@ int drm_dp_atomic_release_time_slots(struct
> drm_atomic_state *state,
> >  	if (!payload->delete) {
> >  		payload->pbn =3D 0;
> >  		payload->delete =3D true;
> > -		topology_state->payload_mask &=3D ~BIT(payload->vcpi - 1);
> > +		bit =3D payload->vcpi ? payload->vcpi - 1 : 0;
> > +		topology_state->payload_mask &=3D ~BIT(bit);
> >  	}
> >
> >  	return 0;
>=20
> --
> Jani Nikula, Intel
