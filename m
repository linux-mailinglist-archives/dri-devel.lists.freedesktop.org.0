Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F28AD5AEC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 17:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B625A10E6B0;
	Wed, 11 Jun 2025 15:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hyUOyZua";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E86710E6AA;
 Wed, 11 Jun 2025 15:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749656750; x=1781192750;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jjHkkQSuaX2UrQYPUTJQWVK4WpbEdUw5BY6YoV1yZS8=;
 b=hyUOyZuayrvTILPqCVP9ZGi/igTQiHqpN7QEeSpVlvs7KYLTtLTEEVlA
 UWVnT33RqL65HTS26xPsmd7nVXajxQ8lvC99m3evls5Qx9tL2TH7PB5Mp
 V+unXShR6XdNJCRdUYiSc3lOMdwJqibH5n+m/hABmThTLev7hIklyknxD
 camTnopbkTGoeCTsjDsAsgRcMyt3oCI0RXNnTn1GqVatH3+pvwhx6tKfx
 uiuJ2gvDHJQFSWXV0VDwtANLjeIxDXfcNQsmL10cFzDMLnvA7ahaWwCzK
 VdMplxK6/ZTJttWc/dkTFf1m7RHIRs0dTZXZdxLMqWMYcTEGdkUY0b51C Q==;
X-CSE-ConnectionGUID: qLHPXsl+Q6GcJIMczWqdpw==
X-CSE-MsgGUID: EsTCi9/NRwKzy5UhfBz+mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62418130"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="62418130"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 08:45:50 -0700
X-CSE-ConnectionGUID: yb+mhw6RTAKk2aE+0nNdoQ==
X-CSE-MsgGUID: PJYsQg1SR1ugBFFtBsc8cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="148133648"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 08:45:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 08:45:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 08:45:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.80)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 08:45:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HvXOmrs2aBj7BAVkcjsXGKk0qNcO1HFKTrE0ShxI3gH6mZbNy8QFcaDgc6eT1YmEY8sbBoBWjv2ikgfacco/HowSbbX+kEcAyiG0CKXq4lxbWErdLS4P9HajXHa4nf2VhUvBjqnKZ8VrdoZ9Kqf2YlgzDQyN7O4tPzS1f0fQxUF9GtjkOg6kNMtgF2ccB3BtVYxWaSKb1BnRPVEOI5+Xhaa9mq6k/6au3zwuQrZLuClHvPVzenuaIHlAPuTeqCnEtT5KUfKbm1vI56Juz/ZRpHgZPxOwE+/ptH9tc2qzuI+ZVzuDj/8aZC3HzXQO4DywRvnP0NOyuFKP2PsZBWfUgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjHkkQSuaX2UrQYPUTJQWVK4WpbEdUw5BY6YoV1yZS8=;
 b=sKcI3kMq34u6b2BBrycc/FsH7p4Tw7QD5Ro2a8sXEWcK2HTkTpg2vkAn946RyBBi7zDG/gH/wVcKcUJgk96n5gh1mgmz+rXh3K+YR9hxIyOo3F62i6Nu4BiGf99Tm7TuJuhrD7bm6T2xIDsag3Ukrv95VoMl9dUqkTjT8zcBQ0Dgk0jfLpylI4EZnTyuBSdeagoiz+A9v+MhFTju8OHSYM/BEOnKVUEFhb6O4ZtIiEkyZPrFlA6GHrVb8dFa+U9DG+9hxnu4bAI+LtMXxTLnm3OqbZuRi4n7kqJOm9xUKwqaSrSFVMJ3sDVOu/9l4R49TFcnOJlvEON7s/fI6Kr3XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by LV3PR11MB8765.namprd11.prod.outlook.com (2603:10b6:408:21d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.33; Wed, 11 Jun
 2025 15:45:30 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e%3]) with mapi id 15.20.8769.022; Wed, 11 Jun 2025
 15:45:30 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, "Brzezinka, Sebastian"
 <sebastian.brzezinka@intel.com>, "Niemiec, Krzysztof"
 <krzysztof.niemiec@intel.com>, "Karas, Krzysztof"
 <krzysztof.karas@intel.com>, intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/ring_submission: Fix timeline left held on VMA
 alloc error
Thread-Topic: [PATCH] drm/i915/ring_submission: Fix timeline left held on VMA
 alloc error
Thread-Index: AQHb2r3jfw1Cv7ISzkejGXdwI9YcWbP+FNYw
Date: Wed, 11 Jun 2025 15:45:30 +0000
Message-ID: <IA3PR11MB89873936B6D887A59ABD909CD075A@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20250611104352.1014011-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20250611104352.1014011-2-janusz.krzysztofik@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|LV3PR11MB8765:EE_
x-ms-office365-filtering-correlation-id: 5be1c85e-59dd-462d-3522-08dda8fefeea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?KpbEB/pUuzDdeQRn74xYnu4W7nmykrKd1nD99HG0BG0FP6ZotagzjfraGE?=
 =?iso-8859-1?Q?iALKjvwIENE9xwc7oxjFhxA/a5vLXIfhY2EO+/xgDjmjIK9jMwExPGIVOj?=
 =?iso-8859-1?Q?rRcBMGvD8X/Cyr0JpcD9uGRVwnKBxy1p7XEw9TS5Ll7Uwiu7Bvhzjr1Rva?=
 =?iso-8859-1?Q?V08KnYNXAQ+aVAbsns+ootEXNQxk4K0PO3Qi309Df4QaeaTep1lor7FBue?=
 =?iso-8859-1?Q?G4Cw/RO+d42Iy4D5VG9TU5Q372bVqQxgHt95+3pjLCQ3QHD1KkLLxdr0qJ?=
 =?iso-8859-1?Q?VI1Drn5fTeBw2DISjlNyMuf81zj4A+e0XHwXWiRAKYDoa7ZfAUNO6CSMkc?=
 =?iso-8859-1?Q?m8qg3DnT3t9KUJeJMPUT/5MihbkdA8lx7O4jCxIQtv/VxaQEH70ybeRg6b?=
 =?iso-8859-1?Q?iDRVe6e8iiyI9XDC0OXQnuwoh4EuxWiiP078cpkasInsxXoZ0HG6E3csO0?=
 =?iso-8859-1?Q?Jyy28UVKi7A6XrS45NHUnuYR3gtEf/bffr5eBdzOEmZ18e6mBrStVM5Mby?=
 =?iso-8859-1?Q?DJd032kAyP61RomfbAzBqbld0xrC0TUeHm6wUYbV7R4MSBuGevkVzo4z6J?=
 =?iso-8859-1?Q?jUcKjXSkiG+EIoLH46E+G24T2JuQyxAjyRpKYujtRE45G9bPFzaDD8rGq/?=
 =?iso-8859-1?Q?H9Go8UBJbqVyT8l/xuD2wBpqXP5bkgnY6Dm2ZYxQb+s8ukSSnvyBYxqmBr?=
 =?iso-8859-1?Q?EgNXrJhTHMg8gordMp3IgnssyhQvYPjaFVYbc28/eOv583fYOR/yjdmjnd?=
 =?iso-8859-1?Q?QtWa4/XykHdLl0inSHWa0ldPUmlweHAN0wDiPvYljOGCLa5+dtd4F+JBfj?=
 =?iso-8859-1?Q?Cgtkpgymr2F+G/SHzC3H0C6C+dVXbVUU8K0TCygWu4mNEYmjR5EpOr/TmQ?=
 =?iso-8859-1?Q?WvlorsPfZadRC7cZSBmouF8II6dOKM6LVEUBOIdTJMpQnuarX+IdHE3kHw?=
 =?iso-8859-1?Q?ST/3sg3vgyS5YSn7SVoBDQPtEbAOcVUfByIMHcHH2V+ddqjtS5uBPdXihv?=
 =?iso-8859-1?Q?6iSRviW3MdCgx1olGHy61YvNyY3hEXKHx9WBwM/Vo68pt+gHyhnojNbDh1?=
 =?iso-8859-1?Q?a7PSu3vx/7fXYZ8l/REXVYyR6wUTsgC5Z9jfk5PIlXcRJmFrYbcgGj8F8w?=
 =?iso-8859-1?Q?Lw9E8wgI2mc3liVxmeAxDfJgBxRnVMXLuS+VgAau189GXlY0qZ+cIBnoH1?=
 =?iso-8859-1?Q?gy6uyBnKjWFWLVZUykpL+sRvveCvup/xuxuVr3EtNKT8ZvzMu82rb5uFMf?=
 =?iso-8859-1?Q?nwvR3RkOVlci5fVKQCsbcI9oAicv4A9nbvi2g71pCJmyEyJo4LumaXncRb?=
 =?iso-8859-1?Q?Uesw6flLq2/ntjTwQUyoEMzQ74dBifuuieihMri5xVWHPL1BeRiZSP9MYo?=
 =?iso-8859-1?Q?PYYcPFxlui89LJTCETZr+2s/K+R5f2sS2bC36hhmxu9wwf0PSD8NKmfubq?=
 =?iso-8859-1?Q?Z2YEDjrSDwVklm9/0yADZcLHarbSDLYCBey4PTLWr+JFGLlx++LCoAeMVy?=
 =?iso-8859-1?Q?LYwOlPNQIn71Zdn6PTR6xZ9cKIy9HPG7QI0zdXppvNsRII4dSFaggyYuPu?=
 =?iso-8859-1?Q?6hn+ero=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Z3q1YQfL0vUfDGWuXzWlKMpULLQvJYFJYXf7nLhcYX1JBjgPaN9b3qmMbD?=
 =?iso-8859-1?Q?n9zh4BDPvXwB5aqbkk4sXgQi1V3LOfBftKYamjMLXqAipy3ulOgcRzuc2l?=
 =?iso-8859-1?Q?4ERZ7iagZrAsyOyhe9+o/Xt8Um+HomhuoGyyEXCWxI2ctADknohl+AXmPV?=
 =?iso-8859-1?Q?/yg2txa9Ms+ya9mDI63wkAtui5jmnk55zkNzstHyWMDvcvrgvawMzH4R7j?=
 =?iso-8859-1?Q?fwrjBImG2hSSt+wwm+nOzBg4Ssd0AUdddBwdCTE7dDOwzsI18grQUU37aF?=
 =?iso-8859-1?Q?hinQOQ3WjdhIyJKUfPE+IHmb0sB3uC3esZ68TcpVpe5TKKwaQaUE1Q+AQe?=
 =?iso-8859-1?Q?TyhCQJ4o2ks4zWQcn8aUbQlPgvLpCZeTuPgBUPoRhgrJ8z0J7ZGCQUT4N5?=
 =?iso-8859-1?Q?U/i5XeKfyecIyPfS7acbKoHeBq0p690havqqoB4hPHIZUAhEibOUbifb7J?=
 =?iso-8859-1?Q?YxfM0RIKvHOBOKY4LlFpycd3WmuTQyU3fsta/5ntY/T5AhP0i4OjL3+yUT?=
 =?iso-8859-1?Q?cZq59Pmq1KkvipNyFYyoHQzUnKFHfJOLIPw1QTCmr3l/U08DazFnoaaRxx?=
 =?iso-8859-1?Q?MtmixjbVn9BusW1D6q//vsA+0emvGskJnDJqLy+asf0b1wMhWawSzDoDB7?=
 =?iso-8859-1?Q?Xhn2ez3sWChMyEJp6a/5Q47u+eBqLVten0xNwzmCN+5Obq6M0gPrP9p/YD?=
 =?iso-8859-1?Q?RYjRTugvL64C+9CR6xilcJcPu/ScWrKgSNqCbk+6nbdmqnXIDaCm6wFudo?=
 =?iso-8859-1?Q?H0/lfT40ejMSfsOAh04YnD1Gyx0ejasqbOKmtDh/ngKBih7vkvSBCbj/qz?=
 =?iso-8859-1?Q?83QvfGiX6wEKMoJ8X0RD51dMUEsxmnV/b0ByrSoNj2Ybq0RyO4VDxs0sDf?=
 =?iso-8859-1?Q?8Bd2CLcnqGBQdqGqPCOWMWzcbAfDuK5j+2l5tglzxUNF5gpleq/2SGLf/N?=
 =?iso-8859-1?Q?0ySY9/sVEIRaEYLvV8/t/RWtISALDynZrQ3idWxC2uPtZRk70Ffpm3ByKu?=
 =?iso-8859-1?Q?GCYfWTf6GoVJb2aqK+IdAENsR9PyXyMIjITVFH2Wv1AUPgqhVf9BTkV3hj?=
 =?iso-8859-1?Q?V/83xI3qrdLcV2q09QQyHfXQuXCDKy9lvgRcIajWyHGhX/vbKIzqST8eoN?=
 =?iso-8859-1?Q?sR5QMv6/IL+jWJhE+jneeT1N8tAN6sQXjhXQFJV4CVyRwL1pnHDWtUsh1g?=
 =?iso-8859-1?Q?NzradEN6UeZgbRorJKlc/W8QGuRTeQ2aX8IvlI5aeCRyYWTmsvNIiQGDzu?=
 =?iso-8859-1?Q?GKRtrs0fyt5+5lxEhhNs+8xmv6A2o/msMi/cP2+7zZWcIR/tzGW6+kSBzz?=
 =?iso-8859-1?Q?AhXaw6DIX6cz8RSDfjQxbNQJ1d+BUPrfNLVhRLemvHTsMCykzpbPMAJEM7?=
 =?iso-8859-1?Q?B9u2QoDOsVwiC8L9WQtS1jcDzf3TGh/bkh16Q74I1W/YvOibpqr5oRvXCK?=
 =?iso-8859-1?Q?cyNtElP9xcrHt/ivz+FwPuNOx1tv023u5alki87PyBTOsRa0Y9kQdmHYQ3?=
 =?iso-8859-1?Q?uMoVnbWcQVbW4iFI9sOg8Uos50HUw3SXQ3KGa3quLK+D0n0/c381HdLHrd?=
 =?iso-8859-1?Q?fPQggMZyR6D3RjUF3lD82qqjKigYsT6gFbvGSJ9PguLwR7XFXZ8R3fD5xG?=
 =?iso-8859-1?Q?PoBfMluPKnp0nMcYORgmMhT6ujSL0Abu1y?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be1c85e-59dd-462d-3522-08dda8fefeea
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 15:45:30.7984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VLOMyACT/nkClGx1ZXIeqmjuq5OBtx7tNa1DY3ix6NNEjAx8yrheGVKZ+wGugWtaK/vfr8z+1o/FEVSW0q6LYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8765
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

Hi Janusz,

[...]
> Subject: [PATCH] drm/i915/ring_submission: Fix timeline left held on VMA =
alloc
> error
>

Generally, it's preferred to use "drm/i915/gt:" file path over "drm/i915/ri=
ng_submission:"=A0 file name in the=A0commit title.
Otherwise, the=A0patch looks good to me.

Reviewed-by: Nitin Gote <nitin.r.gote@intel.com>

=20

