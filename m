Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A66909958F8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 23:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9468A10E5C6;
	Tue,  8 Oct 2024 21:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="joSBiOiY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B137210E259;
 Tue,  8 Oct 2024 21:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728421892; x=1759957892;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y4KXtkwz+Z/GRQ4kCNo0IaGKgOVHOIikEplcL+Wwvoc=;
 b=joSBiOiYly3NM8WK5qbEMNXMpaTN7rzOPRpyLPCBSVY8DImZFfyi/cmk
 MjHkQN/mhosF5CJHfmbIDva68k3OiRpyTEG4Wuk3gk64DU8ecTjM8C6vS
 D/LcTfqnxXu36jVCGhoO/iIsxsniAPeR5miO2qcFu/SDpAlDDmPkzUlUU
 l2A0RgmEQGdLWsOKo0bzydWKTe9YEy8Ofc3n+xaYwNiFf7kMS4KIuyeTM
 A6jXCxAdfriMHkDQOGfgfqQY8RQwrXUYdy/F8VZd++x+VojphHr4fAhhH
 FlgZzAA4acq81XVefwlH9uuId7ibnPZ0+aPf5Ba6p9A3sLHuBWbLpERUQ w==;
X-CSE-ConnectionGUID: uU2TNJBPTf+qqT+uNqI+4g==
X-CSE-MsgGUID: ljr7eS8uTjyNd/S6B3seDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27797064"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="27797064"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 14:11:32 -0700
X-CSE-ConnectionGUID: 6RvZG9IZTs+efK5dnAihYA==
X-CSE-MsgGUID: s5JTHC/ITlW/KbgXx1Vu2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="76409257"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 14:11:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 14:11:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 14:11:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 14:11:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 14:11:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HatDzmd3bIZQxbircSoYkfzjDT1yGTchTwmMKkCt6uA4SP3c1zQjR0Drj3+CrcN5QZYPDYrHHzEdKve8U69zO63/Jof90MJfPbBCvKiXl69NLHu0uw2U6bZ8idXz97xoxCxkqA2FZQVhKi7Zxz5PBSy4Xx+DpjXO+sdluFjsi5qlMHiz1asrK1LUJ+fX55kPrs8EMNZjjf/mDW9P3VLAjTK2Hs2UkzH2DDv7iXXCAiHBtmeUzXBp2vOgvxVNh8vmfpBnRsWWs/K44hRu8pqhLAuZxtgBfMzdcf/ylCJi2S8mB9zEw9fIgOifvl4xYJn/TpEUccRaqA5+kL5WutgoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4l3kaEjEwqk9Cj51VSbdojs3L+d0eU6HWcMeai3nYg=;
 b=SDzdcxXMTHtT1zrx23oucLOdITL6vIk22jr6Xby3LhdJZnoUS2+2Iy0xEH0eQIroI7WRd9tS+0ryVjjdDPy4CxBkBJnSi6RyhypOtrOReQ3NGqUXNoRM2W3UbwvfVgOLy6WOEFp3rCJsi2z7WHOk147G9DnuxyjLl2/52xa73FKEUhCmNNBU9byNzGK0uPeg9FZiS9wJWDnjKnZYYurag95AKV+7LcR4m2JTBr2Z0g2nRy1Iese3k9GB1QeYEDT4FeeBnyf+BG3nAAZFUswj7lvS4ET8onkMf7BmpfQ382kNMF4e8BWdemUIFgiPTwpKMg6vA8s0Oe42YBPHflTV6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB6606.namprd11.prod.outlook.com (2603:10b6:510:1b1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 21:11:27 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 21:11:27 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>,
 "javierm@redhat.com" <javierm@redhat.com>, "jfalempe@redhat.com"
 <jfalempe@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 06/12] drm/client: Move client event handlers to
 drm_client_event.c
Thread-Topic: [PATCH v3 06/12] drm/client: Move client event handlers to
 drm_client_event.c
Thread-Index: AQHbGXqo6oUoOJnV5USMDsfhArXxKLJ9RygQ
Date: Tue, 8 Oct 2024 21:11:27 +0000
Message-ID: <CH0PR11MB5444BBF09BE59AFFCCE0E73AE57E2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241008120652.159190-1-tzimmermann@suse.de>
 <20241008120652.159190-7-tzimmermann@suse.de>
In-Reply-To: <20241008120652.159190-7-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB6606:EE_
x-ms-office365-filtering-correlation-id: e8115fbc-a5a6-4478-d87b-08dce7ddc608
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?CgptdVP+FvOKkayWe+EJFHC8Tz28xcIWGOPAyIDLFP1ssE76rm8JyL3Ieu?=
 =?iso-8859-1?Q?yvQ803RFm4U3q1zN1Q19JTJrBvO6tlDpzC5hHqnvdxcUjjgyejsOm5CgA9?=
 =?iso-8859-1?Q?yWZ1wFFPVvQ8QfGphMhZD2B3DnH1nUW1FvFQQtowvbI7/uK+WOdgOjiR9m?=
 =?iso-8859-1?Q?bvN6LxufCJUxWp5MXoVDcLPxGmJVlT2pbSx2EYt7nEBJQXYe8mddWistRG?=
 =?iso-8859-1?Q?EAdWeX95mlLbRvHccY9ecgU+i88QPm6+X8ECkKX9PZJ5SzLgo7tlXPzFSn?=
 =?iso-8859-1?Q?dhQhT35cc5WPA1tYWzSZ0gyZDSB+tHQZfZFUqlutKCe4ZE6q3oJAYkcJVM?=
 =?iso-8859-1?Q?v/jbd8Hv5CthH4srnco/0w3PH6QmMNC6btbI7TvSQVDMwDpnFOhI+r/7Wi?=
 =?iso-8859-1?Q?vNjvYTrqTbtwxJwblPFGz6X0k0Rm6ZMa2ziUVcPc5YYc9YGYZ3K7R3nfOZ?=
 =?iso-8859-1?Q?ylnH82b6SPWLbi8ijnefOTy8lf2sAwmwMw1O2lcoyJya15TYK7mEYCeUSp?=
 =?iso-8859-1?Q?RR+kazRvb206ePmOcVdO10XnjIyfNDyu5Vj8CV94QmBWz0GD8cD/zIJJgw?=
 =?iso-8859-1?Q?IKJZi6FRrWb/bMN8f1Iaoiqo+ZfjcJCRuxp9phZLKPiNrBsWSSL4+NcZJs?=
 =?iso-8859-1?Q?EsroXY7R+wcWNDEuzCaxGpk1mejSjT5EYD/S7Ux89g4rTKLW1euOieNZBD?=
 =?iso-8859-1?Q?07Zz5LVfxVrmPNjm6dtLKr5vHFSfKuaJcbAhb5fuEslnbFDZb4zqB7E3xA?=
 =?iso-8859-1?Q?Q8hzTIsEvK1W/MZ6OW5PvXtlql2Okg98nohXErtGA54MlWmKhEOX/+7MYh?=
 =?iso-8859-1?Q?vrvn3Uu1LyWDokVHiLYGeUF6rJF+gqgMDTGK0NQQuScAZzAS3dGheyzf55?=
 =?iso-8859-1?Q?SFg2ndrj0jAT2MsNCXw8083LO9e8q3HoQ9h8g9vFlc4NlfoCv6geThwam+?=
 =?iso-8859-1?Q?5tT5phiT6sUjIZYOEBooJ9rVPs6d3wvs/AniMgogkZ66QvgZvYd3ErpuMQ?=
 =?iso-8859-1?Q?cEJ/wYMOKNdVYyjcMQuwQyr0H+je7Clr0jBNVwwXsdoLuI7AlYZLXP5VFV?=
 =?iso-8859-1?Q?rhJpjUAvtaBb6uFQllgbB2EMIySWg6yWm6UP33UWqPF80L+DF8/utU+rOO?=
 =?iso-8859-1?Q?2O1B4/yyB+7UlzERdFv2MLd+mmZKQ3BdqiILqwP9slM56qNvh4WHuu9whU?=
 =?iso-8859-1?Q?6lzxATcO3d20jMW8l6Jag7JdegerveXu51jsHIaw6mcyiven6MlUrxQ86N?=
 =?iso-8859-1?Q?98LNxzO//ln1RPJs204W4PZCMm0sU9RGvixQEzYUGTR0X9k/AYAaTgwgTN?=
 =?iso-8859-1?Q?JrT9PahDqQ9cYubCNoyrmHb7Aqal0c2be+N/0wfZC/tlkbtsneUKIbUb6D?=
 =?iso-8859-1?Q?mB5F20xvDdXYDtPikypgkWahzqr46jgg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?utzZVB/zW49VjMVyez+VeIP9BL8JbzHZqCSxZoeEU1bdgRxJlY8HPcyiIi?=
 =?iso-8859-1?Q?BsrLP4D6OewL1Ps2iH7tAOGvfkI7I0y/gU3XPd/Uoy9y9QT3ZUxXLahq8o?=
 =?iso-8859-1?Q?c95Uu4n0mVaXIDWvZQygw7d1qWKakoxX0/0Fbo38bH9RiveJyb3Lfi4Tsb?=
 =?iso-8859-1?Q?5BIb6lzDd/Kt92BzGcFIPNcrkg4BeWaLchOpN8dxeTYcdPopTg4Ld/FnLk?=
 =?iso-8859-1?Q?G45AInFlwlWdtBPhngZq4HR3M/pi5JKo5XT+314QIsXI1hCxaU1GPkDkcw?=
 =?iso-8859-1?Q?epX9xWA3epd2J/sUsxzjyhGoUH0v0xzCnq9LarYu9ImyD/gQMJSLMY7M1u?=
 =?iso-8859-1?Q?1/0vuQzhK8I+T2r1bZ2uOELMQxG6UYBPLD6ZxPuM0eC5PPtjNShwngiDui?=
 =?iso-8859-1?Q?kEs6jqqPIuEJjqCHb3epxV9PVwHPTn7L7ESWZlcnXDwPy9SaPvfzA4L8Ec?=
 =?iso-8859-1?Q?rxO841fci9wWHKud/iUj+LwHfk/cHZEHWYrAQtYXUIfP0nJOwUurM4r/1V?=
 =?iso-8859-1?Q?advOMXSoNVyOCb4gQZj6PNchpB4RJ6YhRr4SRVskC4Ld3RJeTJ8R84hoDO?=
 =?iso-8859-1?Q?PkwIEvpP5WhjEscTfL887ohIZ/nuTkcnCK1xVcrdGFw5WyL+ZyN6BZ1qIj?=
 =?iso-8859-1?Q?yyfKu96Gcv/KVNhakw2y2SbC2F+veuQ3FA+iI+2PR6R2tilPshYv4xAWLi?=
 =?iso-8859-1?Q?hXU1KsgqVL7nz8s+fCK8lflgX/SGi7xBATLfHedfpMlnkyv1/p1GYGSkAL?=
 =?iso-8859-1?Q?D4FCEFk6Blj/rQH+nTaGYxjD+oWPzAYGdjbRqx+SRWYSaAu2b2TUihoCA3?=
 =?iso-8859-1?Q?tNiX1sz5hH0MxtPyMhM3LxIkv/Dc7GR6DSH0BxHtevmc+xAdDt/4S0633v?=
 =?iso-8859-1?Q?UHUfxDm3nTqq3e4s311C5KuP/XS3cKHr1pmDAyEzncbsiXivAzQPmM1b3t?=
 =?iso-8859-1?Q?+CMxIo+WZVeOrdnU0Am6J39Ad0TLdN3SS1d+K5ObN5qH5WZ8f+Q3JTQY+E?=
 =?iso-8859-1?Q?UA5ssoc862RT9qARcidqQuhlCmiwpoP1lX6jVLMEXrO9j0LBNUl76FDStJ?=
 =?iso-8859-1?Q?1ciwLA7uoZJjjMHb0rYf7AniBtkaIaDCNPql0Sqz+ily4TON3sr2RRgJf0?=
 =?iso-8859-1?Q?22EPoVw3dwgmo0/72he2l81hJLkSiEiGQrHGkl791L0GdJGVMCEkKEVSaO?=
 =?iso-8859-1?Q?5fQnJzhvdOjITMO1CD1/ZlQ3kRsEj3PGj5LWge+Y6lunjl1+EJGI0wuuXu?=
 =?iso-8859-1?Q?GEdfZfiyhrLfHzwozWBceRbyIlaVVXSXrXd1/5b4vOuZflthmaltNdwoSi?=
 =?iso-8859-1?Q?6MfWom1Mo0HBiNdnYIqSW6mKCgt/VrYqp0qC7Bse0zbaPtB0mM8HFik8SW?=
 =?iso-8859-1?Q?B7Abr9tVECVzXP+gMLVQdsQ5irAyDUaFWF9bCojNtryGNna1LoVkQzQQhX?=
 =?iso-8859-1?Q?D4jrKrkW1vDVIYXdWo+h1J6PgKuWHGTVxX7MbgNITctXi29QgF5QaE3SBp?=
 =?iso-8859-1?Q?rUbkKckNx385R/m993o95IFBAdlgloAABOa4ZKZs/jOz+jZ6IqDX8m91Gg?=
 =?iso-8859-1?Q?tnBTzpz5Dt5WQfRjnWveFi27JgfOANLZ3pmPSB7X1hB+8SjRrmndCEWatY?=
 =?iso-8859-1?Q?V3iSIpzG91Y76p9TGODlpsqcMmWIheyWUqm1+tYNwrCdiWyc71N2D78g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8115fbc-a5a6-4478-d87b-08dce7ddc608
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 21:11:27.5575 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G51jSuvjCx/Tgh5+H/rrHb6XoEe3lMkxxs7qHqqolMjYAHLkyn2IKQPYhqm175YQPg3ipCOqd6fSJiNRcx9EcSUI2AHR7HvVFJPMo3rwIMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6606
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Thomas=
 Zimmermann
Sent: Tuesday, October 8, 2024 4:59 AM
To: simona@ffwll.ch; airlied@gmail.com; javierm@redhat.com; jfalempe@redhat=
.com
Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; intel-g=
fx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Thomas Zimmermann=
 <tzimmermann@suse.de>; Jani Nikula <jani.nikula@linux.intel.com>; Vivi, Ro=
drigo <rodrigo.vivi@intel.com>; Joonas Lahtinen <joonas.lahtinen@linux.inte=
l.com>; Tvrtko Ursulin <tursulin@ursulin.net>; Karol Herbst <kherbst@redhat=
.com>; Lyude Paul <lyude@redhat.com>; Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v3 06/12] drm/client: Move client event handlers to drm_cli=
ent_event.c
>=20
> A number of DRM-client functions serve as entry points from device
> operations to client code. Moving them info a separate file will later
> allow for a more fine-grained kernel configuration. For most of the
> users it is sufficient to include <drm/drm_client_event.h> instead of
> the full driver-side interface in <drm/drm_client.h>
>=20
> v2:
> - rename new files to drm_client_event.{c,h}
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>

LGTM.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  Documentation/gpu/drm-client.rst              |   3 +
>  drivers/gpu/drm/Makefile                      |   1 +
>  drivers/gpu/drm/drm_client.c                  | 121 ----------------
>  drivers/gpu/drm/drm_client_event.c            | 135 ++++++++++++++++++
>  drivers/gpu/drm/drm_drv.c                     |   2 +-
>  drivers/gpu/drm/drm_file.c                    |   2 +-
>  drivers/gpu/drm/drm_probe_helper.c            |   2 +-
>  .../drm/i915/display/intel_display_driver.c   |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_vga.c         |   2 +-
>  include/drm/drm_client.h                      |   4 -
>  include/drm/drm_client_event.h                |  12 ++
>  11 files changed, 156 insertions(+), 130 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_client_event.c
>  create mode 100644 include/drm/drm_client_event.h
>=20
> diff --git a/Documentation/gpu/drm-client.rst b/Documentation/gpu/drm-cli=
ent.rst
> index 58b5a1d1219d..cbcfe30de777 100644
> --- a/Documentation/gpu/drm-client.rst
> +++ b/Documentation/gpu/drm-client.rst
> @@ -13,3 +13,6 @@ Kernel clients
> =20
>  .. kernel-doc:: drivers/gpu/drm/drm_client_modeset.c
>     :export:
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_client_event.c
> +   :export:
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 3894f43f6d47..6b7d168ca790 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -42,6 +42,7 @@ drm-y :=3D \
>  	drm_bridge.o \
>  	drm_cache.o \
>  	drm_client.o \
> +	drm_client_event.o \
>  	drm_client_modeset.o \
>  	drm_color_mgmt.o \
>  	drm_connector.o \
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index bfedcbf516db..549b28a5918c 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -10,7 +10,6 @@
>  #include <linux/slab.h>
> =20
>  #include <drm/drm_client.h>
> -#include <drm/drm_debugfs.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> @@ -172,99 +171,6 @@ void drm_client_release(struct drm_client_dev *clien=
t)
>  }
>  EXPORT_SYMBOL(drm_client_release);
> =20
> -/**
> - * drm_client_dev_unregister - Unregister clients
> - * @dev: DRM device
> - *
> - * This function releases all clients by calling each client's
> - * &drm_client_funcs.unregister callback. The callback function
> - * is responsibe for releaseing all resources including the client
> - * itself.
> - *
> - * The helper drm_dev_unregister() calls this function. Drivers
> - * that use it don't need to call this function themselves.
> - */
> -void drm_client_dev_unregister(struct drm_device *dev)
> -{
> -	struct drm_client_dev *client, *tmp;
> -
> -	if (!drm_core_check_feature(dev, DRIVER_MODESET))
> -		return;
> -
> -	mutex_lock(&dev->clientlist_mutex);
> -	list_for_each_entry_safe(client, tmp, &dev->clientlist, list) {
> -		list_del(&client->list);
> -		if (client->funcs && client->funcs->unregister) {
> -			client->funcs->unregister(client);
> -		} else {
> -			drm_client_release(client);
> -			kfree(client);
> -		}
> -	}
> -	mutex_unlock(&dev->clientlist_mutex);
> -}
> -EXPORT_SYMBOL(drm_client_dev_unregister);
> -
> -/**
> - * drm_client_dev_hotplug - Send hotplug event to clients
> - * @dev: DRM device
> - *
> - * This function calls the &drm_client_funcs.hotplug callback on the att=
ached clients.
> - *
> - * drm_kms_helper_hotplug_event() calls this function, so drivers that u=
se it
> - * don't need to call this function themselves.
> - */
> -void drm_client_dev_hotplug(struct drm_device *dev)
> -{
> -	struct drm_client_dev *client;
> -	int ret;
> -
> -	if (!drm_core_check_feature(dev, DRIVER_MODESET))
> -		return;
> -
> -	if (!dev->mode_config.num_connector) {
> -		drm_dbg_kms(dev, "No connectors found, will not send hotplug events!\n=
");
> -		return;
> -	}
> -
> -	mutex_lock(&dev->clientlist_mutex);
> -	list_for_each_entry(client, &dev->clientlist, list) {
> -		if (!client->funcs || !client->funcs->hotplug)
> -			continue;
> -
> -		if (client->hotplug_failed)
> -			continue;
> -
> -		ret =3D client->funcs->hotplug(client);
> -		drm_dbg_kms(dev, "%s: ret=3D%d\n", client->name, ret);
> -		if (ret)
> -			client->hotplug_failed =3D true;
> -	}
> -	mutex_unlock(&dev->clientlist_mutex);
> -}
> -EXPORT_SYMBOL(drm_client_dev_hotplug);
> -
> -void drm_client_dev_restore(struct drm_device *dev)
> -{
> -	struct drm_client_dev *client;
> -	int ret;
> -
> -	if (!drm_core_check_feature(dev, DRIVER_MODESET))
> -		return;
> -
> -	mutex_lock(&dev->clientlist_mutex);
> -	list_for_each_entry(client, &dev->clientlist, list) {
> -		if (!client->funcs || !client->funcs->restore)
> -			continue;
> -
> -		ret =3D client->funcs->restore(client);
> -		drm_dbg_kms(dev, "%s: ret=3D%d\n", client->name, ret);
> -		if (!ret) /* The first one to return zero gets the privilege to restor=
e */
> -			break;
> -	}
> -	mutex_unlock(&dev->clientlist_mutex);
> -}
> -
>  static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
>  {
>  	if (buffer->gem) {
> @@ -584,30 +490,3 @@ int drm_client_framebuffer_flush(struct drm_client_b=
uffer *buffer, struct drm_re
>  					0, 0, NULL, 0);
>  }
>  EXPORT_SYMBOL(drm_client_framebuffer_flush);
> -
> -#ifdef CONFIG_DEBUG_FS
> -static int drm_client_debugfs_internal_clients(struct seq_file *m, void =
*data)
> -{
> -	struct drm_debugfs_entry *entry =3D m->private;
> -	struct drm_device *dev =3D entry->dev;
> -	struct drm_printer p =3D drm_seq_file_printer(m);
> -	struct drm_client_dev *client;
> -
> -	mutex_lock(&dev->clientlist_mutex);
> -	list_for_each_entry(client, &dev->clientlist, list)
> -		drm_printf(&p, "%s\n", client->name);
> -	mutex_unlock(&dev->clientlist_mutex);
> -
> -	return 0;
> -}
> -
> -static const struct drm_debugfs_info drm_client_debugfs_list[] =3D {
> -	{ "internal_clients", drm_client_debugfs_internal_clients, 0 },
> -};
> -
> -void drm_client_debugfs_init(struct drm_device *dev)
> -{
> -	drm_debugfs_add_files(dev, drm_client_debugfs_list,
> -			      ARRAY_SIZE(drm_client_debugfs_list));
> -}
> -#endif
> diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_cli=
ent_event.c
> new file mode 100644
> index 000000000000..d13d44320c5c
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_client_event.c
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/*
> + * Copyright 2018 Noralf Tr=F8nnes
> + */
> +
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +#include <linux/seq_file.h>
> +
> +#include <drm/drm_client.h>
> +#include <drm/drm_client_event.h>
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_print.h>
> +
> +/**
> + * drm_client_dev_unregister - Unregister clients
> + * @dev: DRM device
> + *
> + * This function releases all clients by calling each client's
> + * &drm_client_funcs.unregister callback. The callback function
> + * is responsibe for releaseing all resources including the client
> + * itself.
> + *
> + * The helper drm_dev_unregister() calls this function. Drivers
> + * that use it don't need to call this function themselves.
> + */
> +void drm_client_dev_unregister(struct drm_device *dev)
> +{
> +	struct drm_client_dev *client, *tmp;
> +
> +	if (!drm_core_check_feature(dev, DRIVER_MODESET))
> +		return;
> +
> +	mutex_lock(&dev->clientlist_mutex);
> +	list_for_each_entry_safe(client, tmp, &dev->clientlist, list) {
> +		list_del(&client->list);
> +		if (client->funcs && client->funcs->unregister) {
> +			client->funcs->unregister(client);
> +		} else {
> +			drm_client_release(client);
> +			kfree(client);
> +		}
> +	}
> +	mutex_unlock(&dev->clientlist_mutex);
> +}
> +EXPORT_SYMBOL(drm_client_dev_unregister);
> +
> +/**
> + * drm_client_dev_hotplug - Send hotplug event to clients
> + * @dev: DRM device
> + *
> + * This function calls the &drm_client_funcs.hotplug callback on the att=
ached clients.
> + *
> + * drm_kms_helper_hotplug_event() calls this function, so drivers that u=
se it
> + * don't need to call this function themselves.
> + */
> +void drm_client_dev_hotplug(struct drm_device *dev)
> +{
> +	struct drm_client_dev *client;
> +	int ret;
> +
> +	if (!drm_core_check_feature(dev, DRIVER_MODESET))
> +		return;
> +
> +	if (!dev->mode_config.num_connector) {
> +		drm_dbg_kms(dev, "No connectors found, will not send hotplug events!\n=
");
> +		return;
> +	}
> +
> +	mutex_lock(&dev->clientlist_mutex);
> +	list_for_each_entry(client, &dev->clientlist, list) {
> +		if (!client->funcs || !client->funcs->hotplug)
> +			continue;
> +
> +		if (client->hotplug_failed)
> +			continue;
> +
> +		ret =3D client->funcs->hotplug(client);
> +		drm_dbg_kms(dev, "%s: ret=3D%d\n", client->name, ret);
> +		if (ret)
> +			client->hotplug_failed =3D true;
> +	}
> +	mutex_unlock(&dev->clientlist_mutex);
> +}
> +EXPORT_SYMBOL(drm_client_dev_hotplug);
> +
> +void drm_client_dev_restore(struct drm_device *dev)
> +{
> +	struct drm_client_dev *client;
> +	int ret;
> +
> +	if (!drm_core_check_feature(dev, DRIVER_MODESET))
> +		return;
> +
> +	mutex_lock(&dev->clientlist_mutex);
> +	list_for_each_entry(client, &dev->clientlist, list) {
> +		if (!client->funcs || !client->funcs->restore)
> +			continue;
> +
> +		ret =3D client->funcs->restore(client);
> +		drm_dbg_kms(dev, "%s: ret=3D%d\n", client->name, ret);
> +		if (!ret) /* The first one to return zero gets the privilege to restor=
e */
> +			break;
> +	}
> +	mutex_unlock(&dev->clientlist_mutex);
> +}
> +
> +#ifdef CONFIG_DEBUG_FS
> +static int drm_client_debugfs_internal_clients(struct seq_file *m, void =
*data)
> +{
> +	struct drm_debugfs_entry *entry =3D m->private;
> +	struct drm_device *dev =3D entry->dev;
> +	struct drm_printer p =3D drm_seq_file_printer(m);
> +	struct drm_client_dev *client;
> +
> +	mutex_lock(&dev->clientlist_mutex);
> +	list_for_each_entry(client, &dev->clientlist, list)
> +		drm_printf(&p, "%s\n", client->name);
> +	mutex_unlock(&dev->clientlist_mutex);
> +
> +	return 0;
> +}
> +
> +static const struct drm_debugfs_info drm_client_debugfs_list[] =3D {
> +	{ "internal_clients", drm_client_debugfs_internal_clients, 0 },
> +};
> +
> +void drm_client_debugfs_init(struct drm_device *dev)
> +{
> +	drm_debugfs_add_files(dev, drm_client_debugfs_list,
> +			      ARRAY_SIZE(drm_client_debugfs_list));
> +}
> +#endif
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index ac30b0ec9d93..c2c172eb25df 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -38,7 +38,7 @@
> =20
>  #include <drm/drm_accel.h>
>  #include <drm/drm_cache.h>
> -#include <drm/drm_client.h>
> +#include <drm/drm_client_event.h>
>  #include <drm/drm_color_mgmt.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index ad1dc638c83b..7415abb7faca 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -40,7 +40,7 @@
>  #include <linux/slab.h>
>  #include <linux/vga_switcheroo.h>
> =20
> -#include <drm/drm_client.h>
> +#include <drm/drm_client_event.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_pro=
be_helper.c
> index 92f21764246f..96b266b37ba4 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -33,7 +33,7 @@
>  #include <linux/moduleparam.h>
> =20
>  #include <drm/drm_bridge.h>
> -#include <drm/drm_client.h>
> +#include <drm/drm_client_event.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_fourcc.h>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/driver=
s/gpu/drm/i915/display/intel_display_driver.c
> index c106fb2dd20b..673f9b965494 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> @@ -11,7 +11,7 @@
>  #include <acpi/video.h>
>  #include <drm/display/drm_dp_mst_helper.h>
>  #include <drm/drm_atomic_helper.h>
> -#include <drm/drm_client.h>
> +#include <drm/drm_client_event.h>
>  #include <drm/drm_mode_config.h>
>  #include <drm/drm_privacy_screen_consumer.h>
>  #include <drm/drm_probe_helper.h>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouv=
eau/nouveau_vga.c
> index ab4e11dc0b8a..a6c375a24154 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_vga.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
> @@ -2,7 +2,7 @@
>  #include <linux/vgaarb.h>
>  #include <linux/vga_switcheroo.h>
> =20
> -#include <drm/drm_fb_helper.h>
> +#include <drm/drm_client_event.h>
> =20
>  #include "nouveau_drv.h"
>  #include "nouveau_acpi.h"
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index bc0e66f9c425..dfd5afcc9463 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -121,10 +121,6 @@ int drm_client_init(struct drm_device *dev, struct d=
rm_client_dev *client,
>  void drm_client_release(struct drm_client_dev *client);
>  void drm_client_register(struct drm_client_dev *client);
> =20
> -void drm_client_dev_unregister(struct drm_device *dev);
> -void drm_client_dev_hotplug(struct drm_device *dev);
> -void drm_client_dev_restore(struct drm_device *dev);
> -
>  /**
>   * struct drm_client_buffer - DRM client buffer
>   */
> diff --git a/include/drm/drm_client_event.h b/include/drm/drm_client_even=
t.h
> new file mode 100644
> index 000000000000..2c8915241120
> --- /dev/null
> +++ b/include/drm/drm_client_event.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +
> +#ifndef _DRM_CLIENT_EVENT_H_
> +#define _DRM_CLIENT_EVENT_H_
> +
> +struct drm_device;
> +
> +void drm_client_dev_unregister(struct drm_device *dev);
> +void drm_client_dev_hotplug(struct drm_device *dev);
> +void drm_client_dev_restore(struct drm_device *dev);
> +
> +#endif
> --=20
> 2.46.0
>=20
>=20
