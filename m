Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA33AE12F4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 07:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D05210EACD;
	Fri, 20 Jun 2025 05:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VtmABJg0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC32810EAC6;
 Fri, 20 Jun 2025 05:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750397452; x=1781933452;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JZNO3xz+o4lwWE/g5atgxUpJubu66E0Ilx+1Xhpfskk=;
 b=VtmABJg0/2/IAkmTk6MOe6UvTrPeVN4+03F/8g2oqRkWdtWWfpIxsdPv
 KvALuwcDPE4UQjVOmCLxbGSbKwZTV7QkoTeWZ4LkpZr7LR3HUZfuJHxaK
 x4luuoRAC8XBal4HwJ7piWwyHz12v0fQwDUBJv8lACOce6fu/WnQ5pts5
 TbOvrh+FX3w3tazVrxJDFKg9bjInOgnAJWv7cfM7CYZAk32u8NkFgx7n3
 WpP58woL3v4vfJHMQ2rM1sPvp99LzM5TlQT8SITWdAIXYLJ4yHNm1eGDf
 8oc2op7HTpRqJjPgfwwCjae6RPvzpTfeCm5ROR8P08YEA077+/CY7Avxd w==;
X-CSE-ConnectionGUID: A1YC9NIsSeqvBgOVb59Nlg==
X-CSE-MsgGUID: h6QM9WDcSxyBbSGHuP6wEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52531817"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="52531817"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 22:30:52 -0700
X-CSE-ConnectionGUID: M/IO6K0vSfyY/owduY65AA==
X-CSE-MsgGUID: +H3ZdmeORZ+T1R1y62FNJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="151348550"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 22:30:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 22:30:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 22:30:50 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.88)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 22:30:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPyFK7cRrJ2seko/GS+tcF1nJp/ZYUi/pLAR9aSU67d2cfc0OPI/Q2+MSAqagBv50GM0LZUDXTVNb1m8I4S2Hs5qIcdf+f+css8VzIDqk6CUZmSAvzreah6/d1clLem+M+rcbt5WYa+8mRw9BSPDf0oLb5VqCp7VUFscItlK2EU2pEwZP/FvNxPi58271WoaFMWw5kzqV4FxssEfW4L3OwS1W+KwfERpxxlNBJg9U2vWMxMyX+Yzplwm3kQOjK1hGKsaj2nQYzHNgHOpyzpFMNaXSxeCLAaoX07pOeJ9odwgNzWmvTWHlmXcQMgkW1S9NzPjHeN4HaS7XyM52qbC8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W37H6V7vazN38BnMTSdbLnJO8ht9qi0L4+Tx5Ggazoc=;
 b=GOxwWcCWy2EVi9SJknVlnjDL2nrNN2nt+BJBxhn5nDHIDrQKC2LQZWg3L18Ny4uIih5UJwWWJxGiEoV15J3OtCa1svnWlIpF00ADu5ygn5Sq1IqaneHmG1MyP01yiOl00I7c6+r23WJvM+hTZzDn596er/3R4TfI9/rOetjq92ly61Pc73qqTAP/lqvepHxMMo1nXDkoxo3bWVA7a6J5Q7uYpNCWfHz1k30BhuseUU4BkHePrXDrEi16r9GiFIqMM7LMVzPcMngVJzqyUyf37Zt8m7DKimcMUeNU5K4RkkJWiqGMaMgUlIrv3IIowlp37SpN7B2tI2WDGvs0U40ILw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MN2PR11MB4646.namprd11.prod.outlook.com (2603:10b6:208:264::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Fri, 20 Jun
 2025 05:30:48 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 05:30:48 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 12/13] drm/i915/backlight: Use drm helper to set edp
 backlight
Thread-Topic: [PATCH 12/13] drm/i915/backlight: Use drm helper to set edp
 backlight
Thread-Index: AQHbrPQwVP6w0QTCLU21ksRcnowLBLQL7sTw
Date: Fri, 20 Jun 2025 05:30:48 +0000
Message-ID: <IA0PR11MB7307C9E870C18A2785983090BA7CA@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
 <20250414041637.128039-13-suraj.kandpal@intel.com>
In-Reply-To: <20250414041637.128039-13-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|MN2PR11MB4646:EE_
x-ms-office365-filtering-correlation-id: c6320261-8746-4494-46f1-08ddafbb9d23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?gZegtgiE3yV4u5Kju2gddlqx7C/LsyIWYGiCFikwMrU98EFuJgJCHwwnvnST?=
 =?us-ascii?Q?ZtrMwhS7iYGdRGNFBIdDzKHu7VKgH9l/ES5aQkxYoC7p1wo54fKr7W9iW0K+?=
 =?us-ascii?Q?bi3nRmJ51BVwvLQU6PlGcjwFmJF8o72JzFSRpvhd4cyddD3pyPWrtMTeUnbl?=
 =?us-ascii?Q?7I+ZbSW0dqZe/cxIdtLHwNtMkGowaVmJCFSAQayVPDezY1ZYz/yi17Nz10Pl?=
 =?us-ascii?Q?7xJrwYAx05y+vfce+DxcwMS73PaoyYWLmirHe+Udgc+8HXdvs3GKwmXVqnRZ?=
 =?us-ascii?Q?4MgwnO+V/VaGDrUNuzJEkAvPY8JUNZRk/M7pXrHvvdkBkQALnpwYhTwuNg6L?=
 =?us-ascii?Q?3OU7WZO596pY72I+tZRrKw3/vznKBkTdF+VhEy+B+F7WuD28zn+QSZb/RGtz?=
 =?us-ascii?Q?lQVQUYaBVudzmIxeWrCyIoBbWWjkPHxeQc3jiXHmx+XkkVoaK7RBEVGNwl7y?=
 =?us-ascii?Q?DzYo/8OIiMtKuNTVnzMIXwAcf9vhxIO79trItIU0Z/uzzWrrSIdHp2zSClfF?=
 =?us-ascii?Q?GEpZv3Sj7RIt96Zy8wc093hG2sEj8jg1Iy7f8DDZc+LZZ3VvnHEdHcVgEQvB?=
 =?us-ascii?Q?1HQZXphgjYoAuKaNmflyA05npZ5KdEiGq7cVCqmbFhpw5japDkZdhS4Fnw3L?=
 =?us-ascii?Q?Nf77juK36C2y/Wn7Qre6ufBGiq9RR3rxcVIdfwyMpVawdfDuKJnZpogJEj3g?=
 =?us-ascii?Q?EoN05fQ3bl2+/M5vUpBRh/IrL7z60scS+Gt1+V2yyHqAZsvtx13nX0i7tkON?=
 =?us-ascii?Q?Cyw6TjrcOTJ1U0gEzl6ySeSdn8b4Xdmv+LIcnTncKBNEvzmmth60rj5f3qK2?=
 =?us-ascii?Q?2ttu7qM5jHx/Hpx0JEEO6si03qH+jEeNldFK7DcI02RCHcDYvR3VZjmbuKaS?=
 =?us-ascii?Q?8XLn8oHaUlJgFXlg0XNNrGsu+hSSshNNaZutUN3K7VuN36KUxEYX2IFflT4e?=
 =?us-ascii?Q?GqvZYOSry2rw+ps0CMMu04YbzqyUpqe0LPFdmNwGkYqlE7WkI36nYX2IpJti?=
 =?us-ascii?Q?83DMt4/THwbtGkizDzYCYTHdUkFMUZhyOS3YN0XdciqL+C5D9F/4bqpjjmTY?=
 =?us-ascii?Q?Fd0tsJueX8xhBON0zmOTpb3AyCXKl9nnBPqr7A3TeODZwlWRxvCtaTdfxj/F?=
 =?us-ascii?Q?zwKHTOqCXcZee07k1tNhO6pM52wOF1Hyg8BQjezLRjw1eyjlYX5MFTf5rD7R?=
 =?us-ascii?Q?6KzyXLo4KN8ppRuMjnlWWR7RWpv/3XwRSgrx0564By5x+ww2sEbwQTi5oV4a?=
 =?us-ascii?Q?ECieHyS140IocEY/yfiaW9lc/0BACdKBgsdWaIfJ7MWQ425dMMvFrKqXeZlQ?=
 =?us-ascii?Q?juCna+4l6ZFhzWtGyRrk4Zfknc3S3BcEy6XTo1s+aERKSlE/00cprAbTXrXK?=
 =?us-ascii?Q?uYXPESNUhLYjthfxQmn8rfEqK9npY8jjMJhmfFWACXz7d6yNGYmWzmSmsVtM?=
 =?us-ascii?Q?lo7+QJGSJvGusXNMFa60FrrXK2nCQcdXj6T04GrldY1JyFllD6m8XQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?q7ap/RifU9VKq4J6Jvr8a/SkL3myiTdT6LcoMVHZrdNQRS1TXjlC9YN/vnJC?=
 =?us-ascii?Q?lz+ci1+cSATNwQb3JyYvA6LBKoXcjRj9qfq82C6cgfBqyRBKfS63R3I/xg5e?=
 =?us-ascii?Q?g7yaUFRRFGuktfvbMDPHPy4LY2a+++VVfe7wcOUguVsyNLViFmIZ38qvMDXh?=
 =?us-ascii?Q?g/LbHdJS9b4ALtlAeumiydWcUlMR2b0XGfA7Lh/iRqvUO7drENC6MOewWo+u?=
 =?us-ascii?Q?wLurccIeGAR8ibmPk/ayna3FuEcx4W2TdVtBqlsM1ujcxgMah5YpTh40W91W?=
 =?us-ascii?Q?Gdb0HFmUhMFyXO9PCAbz0n1IKlDwnxUMTTKqf0g6MzgBJPmQD929gEeGkXxH?=
 =?us-ascii?Q?w/s03hOFrrD6UyxHkTU01gqRjeHW3r4PjVyDpbmLhTN2Z+gYOteeENHlTFg7?=
 =?us-ascii?Q?WCwsgZSlcLTal5VPgv/gYtpwUJVLEp2CjTYe2wW5gB2QVhMxgA0Ey0IsJbti?=
 =?us-ascii?Q?WLD/G3hoUjw3f4VrVa8nV7OPQ/5CBsepoWdujzE4w2KO+gFKXBF1fLCjIEPV?=
 =?us-ascii?Q?49VVYZCc2b8uEWG3GXNPH68L/FR1B91NsYDDn2+Aq9bv+nwUU4QARLaEsepY?=
 =?us-ascii?Q?uHFx36XmZa+5J6ZvpkYMVsAhVhoN6hiclLEpf6mUoUbYI/Gj8QuK/YEdLS1z?=
 =?us-ascii?Q?+C2EqQwgOyWtgB7IF5XU0tE0FNKcEntARqlXQanBhSVD4KxwGw/RIajqBUds?=
 =?us-ascii?Q?WBIuQeQ2mhwBE8toIDe2rc4rtX0imoNL/9aqawoYOu5DI4622kFbHcv2bLvR?=
 =?us-ascii?Q?Lbw8EEcPvEJCWuPsyKl11WRuLilANpmB8fyVTRK209uWrwDCBuVBnyEg7DKP?=
 =?us-ascii?Q?EwdRDtHbHQkgoxZcB0D8ZPeOJFXnNLAHwHPqyiaXzku3zUb30so7MIeJ5iVW?=
 =?us-ascii?Q?yMPHzuuCSLtQXBsH+Cfht3ZG/qTsx6CyY3EFcyPPsC6J7AQfFv1DCivbpguq?=
 =?us-ascii?Q?osHgniFXS4ELNz63KsEVJK7/VTBsJ9DsnQkpWbk6V8Q2X4+TbDTFxu9YXdBs?=
 =?us-ascii?Q?ufNXy9pfKE7veID5BKjd0SGYgyeAfygrpqGCyvNFcnmZpNlL5U+ObvRF/bEg?=
 =?us-ascii?Q?JeyYzWuB7yphZ8ojQvSf7JCS0OT9R4WCQYh9GXNjdaPGGnF/oZo5vzkc9t5b?=
 =?us-ascii?Q?nTW1oZmaHQSBfr8qqbgy9JpdysV47YylGm7zcxIT/25ISNOlEZKOAllAX3B8?=
 =?us-ascii?Q?gv6/aP5SKN+nNqoDEnYqmWqlQ7prjAYjV4qs3/dBGFE05o2+ZGIJNg3/DUMu?=
 =?us-ascii?Q?GiHoLWvpiDPMlAe3+NJ92p1/3u99jpcBfpb/ABqcWGR/zG63pUb2icJ+UmnS?=
 =?us-ascii?Q?kUUGLwQh+rvUFaiwz1fEdWYB1X03IlcpDyipoCMz7LjTkRkD00h8Yx9H7QMQ?=
 =?us-ascii?Q?uJ1xd85I3pT54Y1mpm9lWOy+p5IUulVZxynVJYQjrS9x43Gtu6Kes0oIYUJn?=
 =?us-ascii?Q?1nZOMT186XJDyZGSudtAwF2+I/BddP8COCaMXOCXIzLIgyFYc3V1egDUGrjw?=
 =?us-ascii?Q?CYYxq5TfjWXVN3brqmBpGhL+tiQuJkb9COjzaIzZ8vD1cbzTX3u6jjtfTL4P?=
 =?us-ascii?Q?iKNr1AdNW/sOWTUJglVszqYscN79iaNawOBE2yXr/vFCxBh4+ye5/7OVn/2w?=
 =?us-ascii?Q?80J3FHzDDzwkrvVhtKKFdyVHcDvn/iFE2o6fa2AUvKlH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6320261-8746-4494-46f1-08ddafbb9d23
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 05:30:48.6067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: au0UTpXzveVv+m2JMqbn8Irs2wR3LqJAxjR+OEObArYLkc0WO7e0mQfh299bm1lXFAwXtl8d41CRlUAMQn96Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4646
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Monday, April 14, 2025 9:47 AM
> To: nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org; intel=
-
> xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH 12/13] drm/i915/backlight: Use drm helper to set edp
> backlight
>=20
> Now that the drm helper sets the backlight using luminance too we can use
> that. Remove the obselete function.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

>  .../drm/i915/display/intel_dp_aux_backlight.c | 34 ++-----------------
>  1 file changed, 3 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 2eff9b545390..95b29d9af335 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -476,31 +476,6 @@ static u32 intel_dp_aux_vesa_get_backlight(struct
> intel_connector *connector, en
>  	return connector->panel.backlight.level;  }
>=20
> -static int
> -intel_dp_aux_vesa_set_luminance(struct intel_connector *connector, u32
> level) -{
> -	struct intel_dp *intel_dp =3D enc_to_intel_dp(connector->encoder);
> -	u8 buf[3];
> -	int ret;
> -
> -	level =3D level * 1000;
> -	level &=3D 0xffffff;
> -	buf[0] =3D (level & 0x0000ff);
> -	buf[1] =3D (level & 0x00ff00) >> 8;
> -	buf[2] =3D (level & 0xff0000) >> 16;
> -
> -	ret =3D drm_dp_dpcd_write(&intel_dp->aux,
> DP_EDP_PANEL_TARGET_LUMINANCE_VALUE,
> -				buf, sizeof(buf));
> -	if (ret !=3D sizeof(buf)) {
> -		drm_err(intel_dp->aux.drm_dev,
> -			"%s: Failed to set VESA Aux Luminance: %d\n",
> -			intel_dp->aux.name, ret);
> -		return -EINVAL;
> -	} else {
> -		return 0;
> -	}
> -}
> -
>  static void
>  intel_dp_aux_vesa_set_backlight(const struct drm_connector_state
> *conn_state, u32 level)  { @@ -508,11 +483,6 @@
> intel_dp_aux_vesa_set_backlight(const struct drm_connector_state
> *conn_state, u3
>  	struct intel_panel *panel =3D &connector->panel;
>  	struct intel_dp *intel_dp =3D enc_to_intel_dp(connector->encoder);
>=20
> -	if (panel->backlight.edp.vesa.luminance_control_support) {
> -		if (!intel_dp_aux_vesa_set_luminance(connector, level))
> -			return;
> -	}
> -
>  	if (!panel->backlight.edp.vesa.info.aux_set) {
>  		const u32 pwm_level =3D
> intel_backlight_level_to_pwm(connector, level);
>=20
> @@ -538,7 +508,9 @@ intel_dp_aux_vesa_enable_backlight(const struct
> intel_crtc_state *crtc_state,
>  		if (ret =3D=3D 1)
>  			return;
>=20
> -		if (!intel_dp_aux_vesa_set_luminance(connector, level))
> +		if (!drm_edp_backlight_set_level(&intel_dp->aux,
> +						 &panel-
> >backlight.edp.vesa.info,
> +						 level))
>  			return;
>  	}
>=20
> --
> 2.34.1

