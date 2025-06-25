Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAF1AE80D8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 13:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1FF10E6C9;
	Wed, 25 Jun 2025 11:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xfb/este";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A11710E10A;
 Wed, 25 Jun 2025 11:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750850446; x=1782386446;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/US4Y4sOP3rcP8NXz3VQCbEgQJaFyKr4bnrqgU8qMJ8=;
 b=Xfb/esteo7GiVeqfHzMtchj2mxH63vQOpfv9TN/8CQKkzuKmu8NcAm+u
 1hhpoKXjMK9v98TqQe2ol67+R35zT7GjGALhKQOarFpHUvRSg7qXKE3ub
 As+5Xxh61oIBGEIDlUa6kszTNpzPXk8b2ir74Tx5kQei+p+QjBxJ04+ey
 bEF6x6FrunPb5nYrm2bz5ILTIeJ4usx/5T2z7FcDH5YBf6nMYUnC9F2OP
 qdzu7QCoJIasltnRUj4tr2iFSKQav0VRYwIuhXel+0RPy/RYnUUkV8FRk
 hLOR7TQs0Kyuvuv2ZJ9Ro29X8z9IzfDgMM2FypT43JNAYRzdpIvPSSELM Q==;
X-CSE-ConnectionGUID: bhwKmPSERBuBsi+V/9zz/A==
X-CSE-MsgGUID: QNxqeAgxTSSoAOgrKJZydg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52345436"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="52345436"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 04:20:46 -0700
X-CSE-ConnectionGUID: b1pjcpKXTTeCHZ1HHbZ2aw==
X-CSE-MsgGUID: t6n8dJgyTFmPJ1pSYVqNgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="151952445"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 04:20:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 04:20:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 04:20:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.41)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 04:20:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ya9bTERlEn7/T6t78KDOLrwak7mkzHkwqchT0MgZ59aGrw5qetPTj2y3Dg/2XM2Fx8hX51FO0q2FUCs5n6d3QmAimKNszspg69adeajKveDmoQgiCWDXEdSjcllbzsNcTWVnWZlEhddjWkfxeqmBXKY7G866AZbRY5jQT9w+c3SeRvPBZkzhxO0XWua4hLJvUihFJ3jpB/91FzRLMnlpj4orv3WXniTWeHDo3TdiQ/rkiUL1YkggbOaK4t7ZrsBe7hpWltpfOTBOs/qGda/9W6iz48v8ZzUmWNGzYPAC1wVLKcIPssInuZtQTz3s4B5WLiSmxff4qviSFzntRkITaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJ73huqVJvAjpJO4fQl5hxaamrrTSCSfVvn29WjNsxM=;
 b=rSNYIbZ5HU2BfYxBgy3OhBoC6yqCG6qHj9ODr5fukAVDUU3fG7Bi+H30I4XU5PWQ+X7R1pfJobkAoCqAQLHNUm8sw08YLXw1oLBT39XQBPqyCLXcF6zEv9PXRWG2/ZthEzoa/0ESOA4vtVMsj0oSAN0T0ZVdK7n1K19RS+80QZAjI9YuVU1m/Vk36/cwRgr4bDVGpSHgNHj9/FfbjPgglUG5P+/s4yjVffOKxlBUJKsP59tcDRBFQ01BCzyyixCagQGxV8iHs1AM/dEXNnFWdMp1LUJqyXgTaj25rrblJXeCWBLalLFfvZHNKQ7QBCyBi8Sp4q5Zzr0v+C3C77abaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MW4PR11MB5797.namprd11.prod.outlook.com
 (2603:10b6:303:184::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.38; Wed, 25 Jun
 2025 11:20:28 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 11:20:28 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Lyude Paul
 <lyude@redhat.com>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH 00/13] Modify drm helpers to use luminance
Thread-Topic: [PATCH 00/13] Modify drm helpers to use luminance
Thread-Index: AQHb4a19aatm4GnqKUaZrU7UJOyb07QTnJQAgAAlcVA=
Date: Wed, 25 Jun 2025 11:20:28 +0000
Message-ID: <DM3PPF208195D8DCD368BF05ED5C8398409E37BA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250620063445.3603086-1-suraj.kandpal@intel.com>
 <4962fc123ddc84edcf02dea8d57df32088c18d5a@intel.com>
In-Reply-To: <4962fc123ddc84edcf02dea8d57df32088c18d5a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MW4PR11MB5797:EE_
x-ms-office365-filtering-correlation-id: 1747eb27-2418-4537-0d92-08ddb3da4a56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?YKG0Lq+FHsq6BPUehiEEhn523/jjy8w1QhDcOUZ9Ao9kbRgWBZYJEVxuADYn?=
 =?us-ascii?Q?YPok82APG+JiO1F7D0rKYXf4Oe4u6w7FYqZfjpuhrEqJQQkEfbYFtvACFzeo?=
 =?us-ascii?Q?MhUiXbNt37y3K0VyJlX/67LbpjkJTtDSNGY0cdozf9C4TJH5p6z0A4d90T8E?=
 =?us-ascii?Q?HLT38/JCKMpOP7Edgn6qPT8JrgBc6+t/dsAb2OYSsTnnrznLcuDngs8Xd5FS?=
 =?us-ascii?Q?6AmVJdVAf+OpYlaCU4MB86mJ0w/bChzXqueK5OaoPj9kY+9g5S8ZJfn6lAqi?=
 =?us-ascii?Q?Yz+Tc5SiWM9bmhNlLXx5SP7HrgZqbzfXUpuP/x0Jemz0tFtf/OOTatL4QaDV?=
 =?us-ascii?Q?1DKYawITrAyf/HkTy0QXGwSgk1kKqzLdUuHiPoI8w9OUkLvAHLnwfn0J66DP?=
 =?us-ascii?Q?T93jUzD+GAj8x29Md4SkQ9gUlUBjtlI8o6svL5JA2Ar5dQ2McHFOWgkhpda2?=
 =?us-ascii?Q?vukVYnHhgAi7SmG7g2qxQKJUQhuWTfC4S9SwX6qtAzUMaInSRkhWueI038/S?=
 =?us-ascii?Q?uWMyog0YMoNvsFXtIu9VrWxRyDH2ODYpEqLr2BS362+pu0wPl8BALV78kEER?=
 =?us-ascii?Q?2A8u6YY6eU/9oFy9LLBDka0LBwvwqvrRQK2ySJECeK9u2dPr+K2F8mM/UC8+?=
 =?us-ascii?Q?ChUrh7Q8PlHPb9r6yYGJ/MQhzaNhAkKrbApIOYKtMRN5KNcCDHHQU7eOWst1?=
 =?us-ascii?Q?37Pkaudgzm7UQ2ACtbd9yB9DbR4OScRrDEaObmOpyD5SBq/EWoJTLmwgvCaP?=
 =?us-ascii?Q?df6/vUn1lTfDNtjwC8z4x7yammrlCq7rRba0HV3XalkxhSu02cW1bm+i0zis?=
 =?us-ascii?Q?gpy+PsrBTG/JOttjzrjVoZumxIZEYuvP/s8JOy/+bAY0frAU/5GDJE68j2F3?=
 =?us-ascii?Q?XBqizwSxeEGuqbeKd/RfAz4GroIW1wEjdS0VoXXqsZe9ckiT0Y+qMK5pzlIq?=
 =?us-ascii?Q?2WDKlaStUcWlMbBrl8HPjj3MxOeTuNLzDCol9ypqUsPmvPIIJfCPZ++5SrBn?=
 =?us-ascii?Q?8UjDpMyu9tLr63tp9K5lUFEQ1wUyDsTOOrqZa4E5+xxHNC1tUwhbT4cm/pMq?=
 =?us-ascii?Q?xog5iFmL413Hirp//i6DlzyThJLx44m9qJDghivFnY2FZyKmHxqrQUIN0K+0?=
 =?us-ascii?Q?xQ6aM5l240qZhTTrsT/68PSSaPDwFpYfPpCbHMslETApCWgtJzUr2BdtubEE?=
 =?us-ascii?Q?bd2iQjePqPOD4FaB9uqxjkdsOv9VdLN6AD1CNluqE2mc6I8kIg7I7wJHsXd+?=
 =?us-ascii?Q?8yL0aV2TCj4Pg53qTb3ebeIt8jzFZBKJqR8v22mrGAG29jMJeYQ0i74zgIOE?=
 =?us-ascii?Q?Jh2w3C7SF1s5arlGsrNWsQ5JhiDzp5VkagkmB90exjtafmug6NzOU/SpmEfw?=
 =?us-ascii?Q?cPBzJ9u8Khm7H1Gf8Ksdm5J7n3Xc4wA35QCP94ignDTgPzQCJMMyJiMOjcjq?=
 =?us-ascii?Q?13mTz5GNzOPCkeAZzcIi9H16QrL1obqiL6O6FMtCqmebVjprkhoiXg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6GBypw+xMOyxAQIlUnCj3jhhq2pmEp/lIqmBqw98r6rKKySBZBqrj3yVYUpB?=
 =?us-ascii?Q?Toml7xAP+mqgE9xfW3iIUtDc9DMhL8q4gKWRkMoZzEuv7LMcLnyHzaaA0QLB?=
 =?us-ascii?Q?j9Tx5nQQNtqcdqFGcqt6jOO56JbM0LavIZrZzSoQq8c3yeVzwv42HyQp50Il?=
 =?us-ascii?Q?rlEZP1Pv43YNnbI/Rt1bNOmNcwdWVNlE++orji/ZjmlAQRQxKwZlZ0TtF3bt?=
 =?us-ascii?Q?wZQCQO3Ctz9IVj/00FtQsdD21HT0Qd05FXzyxu2DeWc4fviw9PGz6D9kBWek?=
 =?us-ascii?Q?WaJvwIrp7bXmsinKHZrtsGyf/mRZEAMZmCMhKInvDFfR/uDi6N4Gx5DNvHj9?=
 =?us-ascii?Q?EdjJ/vjoTDeysaCsjsef3RSJ20cBhIUsJQfS7YlDFt/7GR7JTDdkEeCgvuLy?=
 =?us-ascii?Q?3GXKc26p4Wq+AjoOFGgkuEXslEhFoX7aajWvou7dIh5NWHRCHZqk6bEbLHBv?=
 =?us-ascii?Q?CSwcS8fEiiBo/rox+NgrfRxrecCtxIku5p2oVns35zFo91PtToTWLHfdxDmT?=
 =?us-ascii?Q?uP6eMvGqRqE9+aqLfxUjXSivKdxVY3A4jcnlmqa01/PM8MjasE2UFC5lUUCm?=
 =?us-ascii?Q?XvthuVYTD73gC4peESPk2dJ4na3vHvehMe6rwnu/ucCxPsvRNA4T21e4zf0X?=
 =?us-ascii?Q?QJ/0otUUnDKGP79aeFlyf24jzaoCVE8nGx3Xvu53c66UxDRF2qnsrW3Dt7Xb?=
 =?us-ascii?Q?JKUqgc5dc9x5ey0x9H9pgN2UOVinwWnIXxECyfn8ouesIg7+v9+hNqdKe/hI?=
 =?us-ascii?Q?K9CuOj2axqD5dD+mg2PvT2tyORE5q7O3Y8RgN68i6yxFd2f2Q3lyNmY4S6RU?=
 =?us-ascii?Q?MKAeyfPQKtebZiN5INUVJFqXqO13BU+4+WeMHLDvrdbHkLKwdMXAlrbvBme5?=
 =?us-ascii?Q?3AiGr2FlvEK+fWRefmHzq/lpeviKyegXSlFVFn/5PnNwDblLMu5fGK67YIAm?=
 =?us-ascii?Q?0p3e44bnNvVcrkzSbf3oIpI1u2B7OvzpiJ8usfpTH9sO57sBxhb9aGicCOsT?=
 =?us-ascii?Q?6x0mvKcmooKm8m/muhSNGqLxu4p32EMdpdJC/SkGjseIEjeemd7J9B4nXxgF?=
 =?us-ascii?Q?GGcfmc6lcPqKxs4AyVQbvPfZm895wLXaJc+oCNaC3mhSxmexOSEO76iRqXzz?=
 =?us-ascii?Q?rDUvsvOQJKpkHgvp/rF/iZqgQPmvSWppwF+iwfKD7K/MburyjZgfw/LFcSsN?=
 =?us-ascii?Q?XJ31yh4OfPd87h0+tWVPtYAnhaW/A6EUGiWarwl4fMsA2LHPnLiogrVIMIOa?=
 =?us-ascii?Q?VgYBFzfRM0wVRCgd59L/4qBrg++lQ2FHAFjkXoTSuvOMvQL49Ww4n+KJlJBO?=
 =?us-ascii?Q?JD8es8fy/PNTUtLWBf8OXpJzXiM2DSDkIRI69roCvKzY3z9+rfnoiyb3HDp7?=
 =?us-ascii?Q?PljEMSiUvhn83Ait0SM58f6G3KMi0xYNb7ntrBHPqtf5wFfwvHiEHH/QZD4Q?=
 =?us-ascii?Q?JRylYJ7h1lvuK+w7jG6+1O982ZYpmIT0nULs246D96DLU2QyYLuoSVVRjMbM?=
 =?us-ascii?Q?rACXP06DVPvHNJ+vPqDdyYjcuO1pwiNrbCVu7cSya9PrThaQ+D9pBCE90xOU?=
 =?us-ascii?Q?DGaWXQ25+Qb2+dgA05rcaYm1EfJYqO32AiEq+o0c?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1747eb27-2418-4537-0d92-08ddb3da4a56
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 11:20:28.7455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pPLdVAx9XFaf+T8q5Qp8rPpttxp+gIlOx1fFbUeAco+xxMh70lKTnfQlEr9hmAZhwn7sbUvkjukTJt5KEYVu7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5797
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
> Sent: Wednesday, June 25, 2025 2:33 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.=
org;
> intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> nouveau@lists.freedesktop.org; Lyude Paul <lyude@redhat.com>
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: Re: [PATCH 00/13] Modify drm helpers to use luminance
>=20
> On Fri, 20 Jun 2025, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> > This series modifies drm dp edp helpers so that drivers can now use
> > them to manipulate brightness using luminance value via the
> > PANEL_TARGET_LUMINANCE_VALUE register. This feature was introduced
> > frin eDP 1.5.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> >
> > Suraj Kandpal (13):
> >   drm/dp: Introduce new member in drm_backlight_info
> >   drm/dp: Add argument in drm_edp_backlight_init
> >   drm/dp: Add argument for max luminance in drm_edp_backlight_init
> >   drm/dp: Move from u16 to u32 for max in drm_edp_backlight_info
> >   drm/dp: Change current_level argument type to u32
> >   drm/dp: Modify drm_edp_probe_state
> >   drm/dp: Change argument type for drm_edp_backlight_set_level
> >   drm/dp: Modify drm_edp_backlight_set_level
> >   drm/dp: Change argument type of drm_edp_backlight_enable
> >   drm/dp: Enable backlight control using luminance
> >   drm/i915/backlight: Use drm helper to initialize edp backlight
> >   drm/i915/backlight: Use drm helper to set edp backlight
> >   drm/i915/backlight: Use drm_edp_backlight_enable
>=20
> Acked-by: Jani Nikula <jani.nikula@intel.com>
>=20
> for merging the last three patches via drm-misc.
>=20
> However, would be great to solicit feedback on the series from non-Intel =
folks
> too. Cc: Lyude who's worked on DPCD brightness before.

Sure will wait and see if we have any more comments on this till Friday bef=
ore merging this.

Regards,
Suraj Kandpal=20

>=20
> BR,
> Jani.
>=20
> >
> >  drivers/gpu/drm/display/drm_dp_helper.c       |  92 ++++++++----
> >  .../drm/i915/display/intel_dp_aux_backlight.c | 140 ++++++------------
> >  drivers/gpu/drm/nouveau/dispnv50/disp.c       |   2 +-
> >  drivers/gpu/drm/nouveau/nouveau_backlight.c   |   7 +-
> >  include/drm/display/drm_dp_helper.h           |  10 +-
> >  5 files changed, 127 insertions(+), 124 deletions(-)
>=20
> --
> Jani Nikula, Intel
