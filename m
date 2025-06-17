Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EE8ADC1C8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 07:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C272710E537;
	Tue, 17 Jun 2025 05:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TzHmGXVk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF2E10E503;
 Tue, 17 Jun 2025 05:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750138421; x=1781674421;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p+ZdDRechiawZ83Tu96ID2e5rR9EZkam7Dl3f1O6vkg=;
 b=TzHmGXVksEYgQ15LC2uSukWsVzCYrFivhxg+eECq+o/wImHJ9xY0NaJW
 I+HbfzUt0tURvvIkDV+VXU8sVqniWALMd23YihsfQz+X1YNY8Cs2YVLvo
 XYRU7vhVMHmSJ9TCoJb6pPYCdkrO97mcvrpPuPyVJIAaL8EdFfwlJOLp6
 Akv7iYTAFdt9e7RQzSkUw3hdSdB13gBlGID1KsWckKIdn37OcN6UEmYLi
 ZqkNVdXDIjq3ixPdcb7+YskN5W+zZniDmezM0yokgY8kOJ4KIJIqlZ9MZ
 SYQLA2sErbJEPvisppXYoBx29GF2uvAdaK1JL97HSeVKf+2T1rik/U7Tl w==;
X-CSE-ConnectionGUID: IDyXZyfuRV6bU/xX08J8Og==
X-CSE-MsgGUID: waDTNBrnQ3u/sfDQzWZ2IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52436214"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="52436214"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 22:33:40 -0700
X-CSE-ConnectionGUID: CCnk7rWXSAGyNBWN+HWquw==
X-CSE-MsgGUID: jU/zYHaqQB23KSu+N2qatw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="149029596"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 22:33:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 22:33:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 22:33:37 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.54)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 22:33:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYozQTrSqVjGwSV9AXgFJOLUhw7V4vb5oUIayNkqFBe5EwxK0NB6R4WRtEwd+uMMo0vzX3qipwNs2c5ZbhRU38F4kGwvYhB+KSJT3GyJIjM9GibZUl6jaOGZPkI6GG6UAdbDvqQIRC5iaIh94TCPoj/Pc8NlvGKQdfhEWv8M8YvBSQZ3NXil0U2ThoD7HtLukhVR6b/afVoYKkUPN6i28KToJx+xAuto/mgmWHFyHLBR2pEXDdQJ4ThrYgJ+PWeySZ09/4CdwsFqn/eN+7hSbt+prKEoFNmnVC6j5IjORuq0sxQs2N0wpz0BZtqNopt8YQ0Vq/dtShB7nZENHIwfwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dpV1AITC0glkWrzOaPhbGd7b/3rUTcuQTjC7gJJWWE=;
 b=BQySUMDhtYclMauZ5R+mIwact/8gHxvHRBupIVmuuwl9mkwbJ8C45LF3/KPAvRo0Yf1FjGHvbP5FVneh4wvUY8oG+El6xisN2KHOHUecL3+4a9C8Yf1sWt0JNjg4oN+DOESSmDZbqbFZaG8dQr4WhOIUmfoGXy0RqDvYzHGINbPFGMfuhB4ktuQU1gO/MCUz1e/C4E48hT25ZQi+nWpBgBS/r9Fon9TEku5jrt3GrdQC2GVUj5KhX5m9qvi3chVjNfe63lRTRNkXILww7gdEerDSxWo+gR19l4065roOy3Mv14oj5hpv97k9jZ8zaHs8eaVfigs8+4syXCn9ZioXHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH3PPFCE69B97EC.namprd11.prod.outlook.com (2603:10b6:518:1::d4d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 05:33:21 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8835.023; Tue, 17 Jun 2025
 05:33:21 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
CC: Alex Hung <alex.hung@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "leo.liu@amd.com" <leo.liu@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "mwen@igalia.com" <mwen@igalia.com>, "jadahl@redhat.com" <jadahl@redhat.com>, 
 "sebastian.wick@redhat.com" <sebastian.wick@redhat.com>,
 "shashank.sharma@amd.com" <shashank.sharma@amd.com>, "agoins@nvidia.com"
 <agoins@nvidia.com>, "joshua@froggi.es" <joshua@froggi.es>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>, "aleixpol@kde.org"
 <aleixpol@kde.org>, "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "victoria@system76.com" <victoria@system76.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "Shankar, Uma" <uma.shankar@intel.com>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, "marcan@marcan.st"
 <marcan@marcan.st>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: RE: [PATCH V9 16/43] drm/colorop: Add 3x4 CTM type
Thread-Topic: [PATCH V9 16/43] drm/colorop: Add 3x4 CTM type
Thread-Index: AQHbuW1y8ppcMGuHuk6AWeupHiSmprQF7WaggAAl4ACAAQuwYA==
Date: Tue, 17 Jun 2025 05:33:20 +0000
Message-ID: <SJ1PR11MB6129FDD1CBAA6FBFD978054FB973A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <20250430011115.223996-17-alex.hung@amd.com>
 <SJ1PR11MB61298CC231B8739FD48E30E1B970A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <20250616163212.62361605@eldfell>
In-Reply-To: <20250616163212.62361605@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH3PPFCE69B97EC:EE_
x-ms-office365-filtering-correlation-id: 78355ac7-b620-4fcf-44a4-08ddad6078b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?TpJ2VNQF6AJAU01xmMv2Gs/PIfPvoJ0miwJR1ITNz9sZXnoa+vCv0aWvl+Do?=
 =?us-ascii?Q?d+8j96L8YI581ZJ4y0XSeMH88TbXqFU+2sCLs5aP/M1Zqa2qayq1F/+I9/Q1?=
 =?us-ascii?Q?w5aYnmimpx+Bzhik5j77X26wLCKg9zKRpv29qFQ9o5hrysf+dC9UTLuhKOBD?=
 =?us-ascii?Q?mrj0BmpeOPxbHEmFRBUloBb5IB8i6vxfrBvaislaLclD58iM4ZgipqXO2cT1?=
 =?us-ascii?Q?jswRLnUh6eXf9uHFawSGky1wdcqXZCErv6Hn+l+hw6UkcuQVbosLwe7ySfIt?=
 =?us-ascii?Q?V8AFhU3unejw0RC7A6uWw5xpj8PvegydsbHLkp1GTRi6XYycxiLu7a4dmclH?=
 =?us-ascii?Q?nUqPosGxPk2m7SEdPRjh99JjWz2I7VL6jCyNuquHurnkHTO28A0lv6r63YPx?=
 =?us-ascii?Q?h9/qreVa+CKwtSaiQ/c9nb1oyQAj1a66Fc+jT0Bh/wk1rV6cUF086BgQk/67?=
 =?us-ascii?Q?iqfou6/7UCPnMBhR70lqGYnswAGd04Aappp6Kb7xWW5EThGJbOtZkGBLPulE?=
 =?us-ascii?Q?5jr0SQed1AHBoOcZJ6TykSP7jmVE/5uz4gOPQkja2F5AWxdZJyLMpC9967gr?=
 =?us-ascii?Q?XppRMO6ptgNJ9niMDenpYWMKKHR+QXWrbVV8bdrjALgPjGcB9GszCZl5zlI3?=
 =?us-ascii?Q?6hmT8n5DDfKIE1p/oBauZOGFcrUQ4mML3MtfAACETTlGTpF9KqoHL1LeaL0v?=
 =?us-ascii?Q?pj6GYVfuO2LVduxqGhSfl499fKnbuA/WACo9fpc8w4XLOBIEiLHOIcwYPuwN?=
 =?us-ascii?Q?Pq/B8NvpVjFuBIyB7b9ZrqD0J4P9o8R1TgVuV2r6gSNJegkjCY8DEOmNLPLL?=
 =?us-ascii?Q?0kyT3nJa8XRfFW6l2rwBE45t63ErqAJ8VWDeopT9IX8j463v4fBEJQQV04yG?=
 =?us-ascii?Q?M5BnmrNtdPq7ipNZ+FarU3WXSQ2TgNbnBljemXSg2K28sEi3hSbWj6KFWJnV?=
 =?us-ascii?Q?KzbbWBA1qkRoDztDq/OKzZeX4JTZr4OpYmOicwX+Uxa9lFWw0zt0I95jbyeP?=
 =?us-ascii?Q?d0FE2kgQJi+U48P2VF+h1Alsg/t4G+ihAH8NjzbwrBF/zrOaLvYFHe/KbLHR?=
 =?us-ascii?Q?N7L0ZKCxLdqEkF1DAhhPNwFNA1HKMUKsNRspXa8h9qiZf+xxnR78vvtA3WmF?=
 =?us-ascii?Q?b/SSuyiz/mjSwZD6EASzvvf0EY3o0kNhbPo+ZRWSULjfWXHM23Jzx5Ks9wRh?=
 =?us-ascii?Q?Dfl/r+sGTTOHQplTLdCPuVzmlfDqyyJuDE2ieugPzjWQmbTOBLTphYcNo7ML?=
 =?us-ascii?Q?v4lObkFC8kg97tR2mrLfzbDXn06cAf/qO1vlhVm3rAL2h2cLLcCG/d9hns63?=
 =?us-ascii?Q?p0DmVyQegvGWIIpj9kVixe51KNSLQYo/0np4ExRG8MI3Ld3Ud3cqa1d/K9UJ?=
 =?us-ascii?Q?dSOxTsOAiRn8k5GX0eWHCSydSFMMd0eCB+W16I9DBgYfwYHQjyBAseU89aX/?=
 =?us-ascii?Q?xrfoWkFyyow=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lPaY2ykLVxnkGMwhy7We/VJFWovHn6SU61gdvW8UT5jAVZQlfaoJxNMPD4K6?=
 =?us-ascii?Q?RELi7/KMxagpAiyPujwviLyptOT3Or1tYp3oZcOTPSLXx+OSewfnmGXR2So8?=
 =?us-ascii?Q?D6WRV0X4e79sfM9Khcg2iI0y+Fm/2YXkGKuyzllDYiKEKCZN90jqCTFk2iU0?=
 =?us-ascii?Q?dle4EamSRYq63ogjlrP5lWu9D1e5J1EAekXGLX2LyNrUUuPXs7pr2TAigu0v?=
 =?us-ascii?Q?1kIfCrcMRf96RTU7QW5e7VE64PM5AsPDHAOjv6uAsiFmzDyXTJymBMN9hUdv?=
 =?us-ascii?Q?vO74CcLeLD/iMw1ZSwcGeZYKGuxbodBgDUnjgsUY2Emzy1LQDjt7bwIHbRW0?=
 =?us-ascii?Q?ndKC6+hJ9cO6jdif9NvYqeFf8zYoEiT2zzyAOLPqWdlpb8tmnBdC/qQKtGay?=
 =?us-ascii?Q?zgnU47C4Y+6mFZFoeeAGFYPqoj9tL4v5VWt4O8tNxYs+YrhMOXVZ/Nrg7p8m?=
 =?us-ascii?Q?dy/evorBPJ1tqAsVijiWWuJa9XW+LB6sSzG1+RPc22mF1O4/phFeEMuX8BNL?=
 =?us-ascii?Q?mryXVSoyyZK5vRDPuvQXVbUsQbuNxkoYZkxTdcq0Uhzv4HtmDAuiV4tlgPru?=
 =?us-ascii?Q?Y3S1K4aJnSJYovpFJgNevgRFvrnUEMGkeitEPw4qJKlFSV7tXJ9cYflwqo4z?=
 =?us-ascii?Q?+FLXw/KnocjzqjNbMSIRy3VmXRRXYzlgUa7/Ivlk5LZbW7eJIsWjFqhPomtk?=
 =?us-ascii?Q?c7bsvAhQSTugJvxY0M+NVXt/daoUGECO0yi5ES+7IpcGgmgkdR6OGLkmieOl?=
 =?us-ascii?Q?TOXHF9X1lLTxdEOELIMtmPhjs+mPMfVq0Osv+Wdd/3DZS42IdDu7rltLjHO7?=
 =?us-ascii?Q?nmmUQLXUqP8NrZNx7bxieXoLGftCIlvFxTwpkMfOZ0L9R/1YUeng16UCxLgq?=
 =?us-ascii?Q?bf79sRpyMN37kH01LKUvBdINx8gX0Vplb6hmk4//+NLl3TWwFJiG8z3aRP15?=
 =?us-ascii?Q?1+sGwCPAOJ5LNVaibD3M/mS1SBVfFCS2FJ6doqsHaO8LuLPphbsLslrNQyAS?=
 =?us-ascii?Q?5CDRjZqZdmSoDsDAIeOJEcPqT0DgMTjIGpCMSGzHcfxUT1sUr5+fD03mWq3L?=
 =?us-ascii?Q?xiU3piOBV4/7TgYs53eQ1LI3G+hMwtI7nvm0a9+pbRN/9ae/UYUQgvMaQERn?=
 =?us-ascii?Q?UlaTbl76N8aK9zManWfkdFOtlxQhEDaCaSW3rLHVKgAg8m7D5RbzHSjoduug?=
 =?us-ascii?Q?wtGL8C2LYeSBbpyHxq0EpJK+smmR8ZdgXApIdwocwMVlSYz1T41+KUuvipKw?=
 =?us-ascii?Q?GSaY4v1cRVAQqSGVSRFEuvBbfQgbB++aOhTCGlH75f0LVAlGDw+e5lRO5DXN?=
 =?us-ascii?Q?jzSlrOAkeuJA2n2jZeLfGy5XX+GpNVKgA4cdwTx4t+0Qyfpah2PJ28zssUgM?=
 =?us-ascii?Q?Nk2JvruYlgiY/0nZXmWtHPIa+Jn7aytzJCM5QS56AxecfxTbtJxEf43ykert?=
 =?us-ascii?Q?syPYu1OVvuiZmANaJsJmCYLefc71DLuJCwMOYSy5t8OQ+QfqNLZdhLOx9tY7?=
 =?us-ascii?Q?f53ixpE05SXoeBa98VANuHMbP9aeLEgqEEsdMl8oGBKDvpcrU271X98LjGlJ?=
 =?us-ascii?Q?nNNk0izx0tTOJqddIp1sLL8hmLfnM2B3EWyIsAjru5rphOoI99b+vs33o7ER?=
 =?us-ascii?Q?+A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78355ac7-b620-4fcf-44a4-08ddad6078b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 05:33:21.0103 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rUmdMHz6kB8VENEzmYm+Dp7ZbbqwU3yAkd7MRZ1BxbRPySf8R8RtErsyxltkLZTIfDHk2WsuPnD4e5c7KsWevOjKxCN1SVHI6khdZlqYXO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFCE69B97EC
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
> From: Pekka Paalanen <pekka.paalanen@collabora.com>
> Sent: Monday, June 16, 2025 7:02 PM
> To: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Cc: Alex Hung <alex.hung@amd.com>; dri-devel@lists.freedesktop.org; amd-
> gfx@lists.freedesktop.org; wayland-devel@lists.freedesktop.org;
> harry.wentland@amd.com; leo.liu@amd.com; ville.syrjala@linux.intel.com;
> mwen@igalia.com; jadahl@redhat.com; sebastian.wick@redhat.com;
> shashank.sharma@amd.com; agoins@nvidia.com; joshua@froggi.es;
> mdaenzer@redhat.com; aleixpol@kde.org; xaver.hugl@gmail.com;
> victoria@system76.com; daniel@ffwll.ch; Shankar, Uma
> <uma.shankar@intel.com>; quic_naseer@quicinc.com;
> quic_cbraga@quicinc.com; quic_abhinavk@quicinc.com; marcan@marcan.st;
> Liviu.Dudau@arm.com; sashamcintosh@google.com;
> louis.chauvet@bootlin.com; Daniel Stone <daniels@collabora.com>
> Subject: Re: [PATCH V9 16/43] drm/colorop: Add 3x4 CTM type
>=20
> On Mon, 16 Jun 2025 11:30:23 +0000
> "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com> wrote:
>=20
> > > -----Original Message-----
> > > From: Alex Hung <alex.hung@amd.com>
> > > Sent: Wednesday, April 30, 2025 6:41 AM
> > > To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> > > Cc: wayland-devel@lists.freedesktop.org; harry.wentland@amd.com;
> > > alex.hung@amd.com; leo.liu@amd.com; ville.syrjala@linux.intel.com;
> > > pekka.paalanen@collabora.com; contact@emersion.fr; mwen@igalia.com;
> > > jadahl@redhat.com; sebastian.wick@redhat.com;
> > > shashank.sharma@amd.com; agoins@nvidia.com; joshua@froggi.es;
> > > mdaenzer@redhat.com; aleixpol@kde.org; xaver.hugl@gmail.com;
> > > victoria@system76.com; daniel@ffwll.ch; Shankar, Uma
> > > <uma.shankar@intel.com>; quic_naseer@quicinc.com;
> > > quic_cbraga@quicinc.com; quic_abhinavk@quicinc.com;
> > > marcan@marcan.st; Liviu.Dudau@arm.com; sashamcintosh@google.com;
> > > Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>;
> > > louis.chauvet@bootlin.com; Daniel Stone <daniels@collabora.com>
> > > Subject: [PATCH V9 16/43] drm/colorop: Add 3x4 CTM type
> > >
> > > From: Harry Wentland <harry.wentland@amd.com>
> > >
> > > This type is used to support a 3x4 matrix in colorops. A 3x4 matrix
> > > uses the last column as a "bias" column. Some HW exposes support for
> > > 3x4. The calculation looks like:
> > >
> > >  out   matrix    in
> > >  |R|   |0  1  2  3 |   | R |
> > >  |G| =3D |4  5  6  7 | x | G |
> > >  |B|   |8  9  10 11|   | B |
> > >                        |1.0|
> > >
> > > This is also the first colorop where we need a blob property to
> > > program the property. For that we'll introduce a new DATA property
> > > that can be used by all colorop TYPEs requiring a blob. The way a
> > > DATA blob is read depends on the TYPE of the colorop.
> > >
> > > We only create the DATA property for property types that need it.
> >
> > Is there any value to adding pre-offsets [1] in the uapi?
> >
> >  |R/Cr|    | c0 c1 c2 |   ( |R/Cr|   |preoff0| )   |postoff0|
> >  |G/Y | =3D | c3 c4 c5 | x ( |G/Y | + |preoff1| ) + |postoff1|
> >  |B/Cb|   | c6 c7 c8 |   ( |B/Cb|   |preoff2| )   |postoff2|
> >
> > Handling limited range values is one use case that I can think of.
>=20
> Hi,
>=20
> in the mathematical sense, no. A pre-offset can always be converted into =
a
> post-offset by multiplying it with the 3x3 matrix (and adding to the exis=
ting
> post-offset). This can be pre-computed, no need to do it separately for e=
very
> pixel.
>=20
> For hardware reasons, I have no idea.

Thank you for the reply, Pekka. Our hardware does allow programming Pre-off=
sets separately.
Currently I can't think of a particular advantage of that if mathematically=
 a post-offset does the job but I will keep this thread posted if I find so=
mething out.

Regards

Chaitanya

>=20
> > [1]
> > https://cgit.freedesktop.org/drm-tip/tree/drivers/gpu/drm/i915/display
> > /intel_color.c#n112
> >
>=20
> Thanks,
> pq
