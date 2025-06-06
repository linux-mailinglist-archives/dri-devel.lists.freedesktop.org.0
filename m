Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9042EAD05FC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 17:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D266E10EB00;
	Fri,  6 Jun 2025 15:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JoogXk1R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C290210EAEA;
 Fri,  6 Jun 2025 15:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749224945; x=1780760945;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=dXMAvr24TskeZhY/RLedmmZzoNNmEHwTQMzELBLKwUY=;
 b=JoogXk1RbQ5P2qjEQ2VrXrmuUuorMsdn8fl8gdn0IZS3GHdR4P3TFRX+
 RdOwH+fnfIoIi8Af9R1KuyWytnFGgbG+uN0EG1XI4eBNJ55IuFQoTDvu0
 cEG86K5kC9/6OQRCGcSw8IMhlKt/w5QS7LjnuQKyZ/iFQJrOtYJbwcGVb
 VwGU+nb4SwZk/ilGKcoECCuFmZ5B4rQmbbB+rarLowhw2E9lJwKN8CP+x
 AH+ZYOCiJQVjYkz9QN4MRCXWW/l+YINpUl10d2+FPdZGCik6oshGnvOP8
 EsehofOlhdzboq822Zmy8na5bbSrKjm5Q91PnxoD+bOWjEN0zdP68usVt g==;
X-CSE-ConnectionGUID: GdB6kbMQQGmZU4DyI7n4Hg==
X-CSE-MsgGUID: 2LQn8CetSCWvZVJ3qwIppQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51524630"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51524630"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:49:02 -0700
X-CSE-ConnectionGUID: fmWYN2aWTI29KvODJFwB1w==
X-CSE-MsgGUID: j1mRf2FFQk6nMGcSXgIGBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="151018636"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:49:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 08:49:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 08:49:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.80)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 08:49:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Km+tI6RMW1/y4GyqH+VJ+OV+/bY1gD8s1K/lsJvI7vrLOFVwlm68m/NGHJKlEPlIW5uyKUJWmfAmESAkm/3++Xw/eSOzwj6+ZDd77RCzeA9qYep9KpgAerKcbcURHl98dIkU6Q3gZ1l7Nwte+O6CwKQcCzvz3aReixi9vtMkWfakjH3KGbr0pvlSwxPvLYu2eKphDWpDWi+dXDFmoObTHVyTEp7L4bKuo5xLE7XqNOTRlABTqAZoAyORARJfS6fAai0TeuBssk4lEVZtJdCHcxFiSo3ABIKdeweQ45JYOSFdPAOwgtfzj++qPRtnzzPwZUejto6bSS0Df6UY9szD+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+42Xpb0++hE4TxnLTmptO3LGXEyL3E47ODtGi27vczs=;
 b=qOsIUd7xuRROmXYiaK4bYmL6DUqPXuABVGI7cACEGFiIX91EyKyW9+Ncy/RK7ktkZYttZSsa8Tr/2PILBG7yoFUysP05VxytWYj40VOBwHcyH/OsudQoPeAOjti3hyEOZ3zVqhTcmEcDGz+e7VxsvbvLj4lzvxTTkPKezg58QS01l7+xigQCnMRr8bKbZXl2+z01QgSqVeDrY4R1w5keH2WCzWIwm2ACiZ7vmQmIGkC2VzZNUvgkxTZ8xIMxIHwBBRnk5vJWXBR+fvOkzxUI/lyzmNE8c46d1PMhRS3TbjgrSvWQp8t82tyDnZIm2yHMrFPTEnkgiv0JXTA/nAkabg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7578.namprd11.prod.outlook.com (2603:10b6:8:141::16)
 by CY8PR11MB6819.namprd11.prod.outlook.com (2603:10b6:930:61::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Fri, 6 Jun
 2025 15:48:31 +0000
Received: from DS0PR11MB7578.namprd11.prod.outlook.com
 ([fe80::ba7:2682:35a5:945c]) by DS0PR11MB7578.namprd11.prod.outlook.com
 ([fe80::ba7:2682:35a5:945c%4]) with mapi id 15.20.8769.037; Fri, 6 Jun 2025
 15:48:31 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>, "Wysocki, Rafael J"
 <rafael.j.wysocki@intel.com>, "Yang, Simon1" <simon1.yang@intel.com>, "Doug
 Anderson" <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH 2/4] drm/i915/panel: add panel register/unregister
Thread-Topic: [PATCH 2/4] drm/i915/panel: add panel register/unregister
Thread-Index: AQHb1sJZvRFnbG8HU0+nLvneMqS6EbP2RtxQ
Date: Fri, 6 Jun 2025 15:48:31 +0000
Message-ID: <DS0PR11MB7578F686726F22DD075D1E63A36EA@DS0PR11MB7578.namprd11.prod.outlook.com>
References: <cover.1749199013.git.jani.nikula@intel.com>
 <b737d4bc8b91df630cd4db4648f3a3571989cfd8.1749199013.git.jani.nikula@intel.com>
In-Reply-To: <b737d4bc8b91df630cd4db4648f3a3571989cfd8.1749199013.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7578:EE_|CY8PR11MB6819:EE_
x-ms-office365-filtering-correlation-id: 18b34e0c-f64a-4f37-6711-08dda51196bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?vJLRervWfmDZdJt5suKmv92n12u62skp7Ei2meRINjAe5Yqz4Rd6f3AXLKM0?=
 =?us-ascii?Q?AkvJ3eM0Qs7FJb3uSq0BVH6n1C2Jps9bB6LPu+wqooYfvR0Y72CQSL2lkPWD?=
 =?us-ascii?Q?XnZAKz7TPHPO8xlcwb1JYbkAfuJ8CYG+rnvqvX0AeBisO1PKJbNyrbeSS8pS?=
 =?us-ascii?Q?ZSsPKuMxm31GsZP14MXXiM2scn7M60WdsmLZmalNWCA4zxnhGokLjL5lMe9V?=
 =?us-ascii?Q?AQ4ug5fXPL5KKKLdYGl8fGjrcYROotZEJJgdWaufv1O7wCpCpU4uQX8yeKzn?=
 =?us-ascii?Q?dJpGgcodmq2+w3ZZY/eGui1cnqAWxw0REwUhVnyn/ocPxRiA7W2JGYW30t1/?=
 =?us-ascii?Q?EfcfFe3QTC6y2dAPQ7sMhsvo82fiS0/t1mXesf4b/AFQNw5akHVr9JVo3IAr?=
 =?us-ascii?Q?sIJnlJynd1S2zRYLAgB3I3OV1S9J/GrZTkJaBds0Iaq+Iyjv6W7DSlUdWquY?=
 =?us-ascii?Q?r0IZCukUioXc+BR0AYCh1/2kFP5+4oW3xXXaaJSVDmlQ9xjPCswkxNkgfiFZ?=
 =?us-ascii?Q?mqCWXzm2UMYz30sdYv1nRGaujeszizQGAe5hg+VLBaIqRVVoYgZ8t2reGrVb?=
 =?us-ascii?Q?5d6D5V9/6DuAWxjXTKhLZJ+4E5NvyJCut11RtKO9vbE9szq7kNFwAaNa1LlL?=
 =?us-ascii?Q?UI51NJ6dsOR1bAHmGoroqT2czJE1o0xC98G9F6XOcKiCZ8s4tyVESyWypV8y?=
 =?us-ascii?Q?tMCckVJht2hPvgUVrUqjVXJVB7fovqQS71Nq45NJAsyHqJYFWKBw0xb16IVs?=
 =?us-ascii?Q?PZhYEkoZg8FD/FH/DdCWq6O5Z41hsLm2z6SRBPJkZll0BhL7KYbac54Gcbsh?=
 =?us-ascii?Q?qNjuTsY/f9JFlzBsmaQZkeT5riko2iBjtElUonon8qI5nlgAJn6yJ9sk8kNu?=
 =?us-ascii?Q?hPA489xEBVvB9/c5i76xAF+tSIMzznaRSio1Ll+PpGtaa/1vnMX/fANuf66O?=
 =?us-ascii?Q?4V3XqkkfofeUpkmSjbw2BkY0Yn+0u9yrFnHMoAqKv7RL29A3xNCxQFkeTjX6?=
 =?us-ascii?Q?h9TM/+SQUVSQYhlJFjeRhGAhvusEn9CQCZLlIG8Nx3s81kUEDiPpm+FhWo6a?=
 =?us-ascii?Q?bLezOrd6PbdJyDXj/TsqaossPRbyyg49XztIlvGoe4FOKL7mNMQ+vIh7+thx?=
 =?us-ascii?Q?FYspCQaie1xgXYIbrVlkIBe1lrFJQOVYmDu15UljSHYE3hPL0DySVWvL5gAO?=
 =?us-ascii?Q?oMkO+b9fCbvmXuk7iKmax9T/gEaLzZrvafx7Oob9O6uwZGQTmsgn+OtT+dEQ?=
 =?us-ascii?Q?GU/3ThzFxpSE+gsf+rZx6uOYSe2cQaHgqcKfSSmeT5eLiCJzZkaY5WwOGv5n?=
 =?us-ascii?Q?BU4r9qFIIuCO/g9txwyvm9mqzA8RbGkwh5qr8bU7LvRfzUwYMErh9w3N0Yxe?=
 =?us-ascii?Q?HLa5fiGdGX9maYfi/exF+jHjcwOHxXzwsrezKbISnErFRFFxf75oa5VcAR0z?=
 =?us-ascii?Q?K66G5Sr+8lWqHrLRZmWL8/9KCvsMtaX2NbbIubw+SFyIqaBE12Q3IMQYvzfU?=
 =?us-ascii?Q?8Ixt4fzH74eMX3w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7578.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?X0Enjj4NOg5Q1WMgqokYEj1jq484ugswCgnkPdr784HREestEmDPqky+R9cr?=
 =?us-ascii?Q?TZdPKTsaHeJOfechCp7/vRwVkWtOnErdAp8ZA9Lz85XmFfzosNaB5iEgo+7p?=
 =?us-ascii?Q?hCHgz5dh+BtXYUtJw1u3DMo91nRffBvaawFC6RsAD9j96wz/POOrV27tPfDn?=
 =?us-ascii?Q?Ok9ICxEw02qs30ETLIXYTVwJWsB4In90dS8hjAviO0xim43+tECArxemm4Om?=
 =?us-ascii?Q?W1dva+4VOb29ZNh9kQhmvxmig7Sa+RaSy06Yb58DD2O67Y8TplPK6gBOPmoo?=
 =?us-ascii?Q?Uwtg1HsSL8UUjs0SdyeW/hEO6RFItgKEjSD816b9FBZGFgEuAFFOkQfWvunW?=
 =?us-ascii?Q?a0J2oj7AND5M8n6cJ6EaTzzANvvbf249aWHCnbmtcEHtx86ge7iYdYyiuGQE?=
 =?us-ascii?Q?K3sRur2Yl8LGpYJ0DoBoAEKZxC2NQImjRNY3qRB31dNEtgMZMS4d1iLdnkn7?=
 =?us-ascii?Q?A8cv2pUHZQ8Gx6UBDiGSND1+LKuyBGn/arEm6JmS/GiDWQOeuruzUUqSsDG0?=
 =?us-ascii?Q?XDviTKyG6OPQMgSCZ29S1SBcE598TbdN3PXO1R4HvXQ29i6JV8j4JV/e8Zbw?=
 =?us-ascii?Q?hmdSQZZY25mHWIRnZ+OqdnMmdU45BlkmXzDSQ8AORDi/QMt9clpunb1FJuG2?=
 =?us-ascii?Q?DT/lJJilCRcNGbGsvKYD+E9yPORqreJk8Ykq1SAUTu2PpKtYpzhDi8pFTbMA?=
 =?us-ascii?Q?v9YoF53BVLHU5f5TuOuskdshJfP+9vAzTYJ0Nr3zYRU7cCWUOd+2SIiibUIs?=
 =?us-ascii?Q?0s1b6In/o2FAhl3RyHoBsr5iQHEIpfpWpFL38BKrxzXJ7lhy7wtGqHjvhKZw?=
 =?us-ascii?Q?0LtsNOcFuOTlS7jOmAVUNl8Hofe+iJJRG7o1R0fxrOKWLKZKv7bKWp7McpF6?=
 =?us-ascii?Q?c1f8MlyGfS8T6sF5tT4JRN2y/4tqgfr6vWti1iz7VQowL9PgJ7m2uHiJ1wkY?=
 =?us-ascii?Q?bG2PPIht6NiJff9z9N0hjafbQypGnTycqEaXkpdCdM5Ejl99aVr1mBAEXV6K?=
 =?us-ascii?Q?6rgI2cM/MBhTQkIonrSlGjMx9G/iLnL/lqv3X8ZQGFkoPQAqUEOFcZXPa8de?=
 =?us-ascii?Q?ZEadOySa/U1VggCTyt1CKnU3GfrA7d2Ts6DS0ubpaxAHVyEleuvz43EvZ2sL?=
 =?us-ascii?Q?AIq27pzHRnQgbM/w9jAAFweb0UuwRUTSyqUtHiuUyOPN/h3RcOT8f5zjjAXN?=
 =?us-ascii?Q?9ln/yvxMqFZBHV8SBBZJErXqeqKNn5kiP9TIJSmkkvkagUN2Tv2gljZZDzOf?=
 =?us-ascii?Q?L2KDv3O6npO+jTOu/OtP8gcBdhpmyzsU+ZOWLOQYYtdKwtoFPp2GLaEVDAX2?=
 =?us-ascii?Q?axag1j4w4Gf8R+U9PL8WW3CXP5+RkNMxJudkNLlOds/oghVmIqZio8akAQzT?=
 =?us-ascii?Q?8Gs84zQL55xXREW55m0ShMuyZzPk78SnrBRxaa2XRgnl1dQblcVdSV8IDBhT?=
 =?us-ascii?Q?28hzNjSncfF59Zgn3wPc+K2SzipG4ju2AmBumPGQhRvhSr/+9mofpoKPGDJr?=
 =?us-ascii?Q?AEem7lT49C8MwkVF4EYDR8cFmX85gWN+xcn+/LP0POpdR+9gqdav8mMpxPmQ?=
 =?us-ascii?Q?rar+PZzRpFvfWcAKUxH7jMGYA3lOjlWzvKrfH7wm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7578.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b34e0c-f64a-4f37-6711-08dda51196bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 15:48:31.8206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qg3O8CFbTaJ5j0MTFhYd/fG6I6IzTz3suWF8NAgGQnJ3X2zbwu7gKc5oxNZMuf8+uj+OG7CMTJ6SSPfGnU7oaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6819
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
Reply-To: "b737d4bc8b91df630cd4db4648f3a3571989cfd8.1749199013.git.jani.nikula@intel.com"
 <b737d4bc8b91df630cd4db4648f3a3571989cfd8.1749199013.git.jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On June 6, 2025, 9:05, Jani Nikula <jani.nikula@intel.com> wrote:
>Add panel register/unregister functions, and handle backlight register/unr=
egister from there. This is in preparation for adding more panel specific r=
egister/unregister functionality.
>
>Cc: Lee Shawn C <shawn.c.lee@intel.com>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>---

This patch series was tested on my local device. And panel follower works w=
ell.

Tested-by: Lee Shawn C <shawn.c.lee@intel.com>

> .../gpu/drm/i915/display/intel_connector.c    | 23 +++++++++----------
> drivers/gpu/drm/i915/display/intel_panel.c    | 10 ++++++++
> drivers/gpu/drm/i915/display/intel_panel.h    |  2 ++
> 3 files changed, 23 insertions(+), 12 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/=
drm/i915/display/intel_connector.c
>index 9a61c972dce9..2867d76d1a5e 100644
>--- a/drivers/gpu/drm/i915/display/intel_connector.c
>+++ b/drivers/gpu/drm/i915/display/intel_connector.c
>@@ -32,7 +32,6 @@
>=20
> #include "i915_drv.h"
> #include "i915_utils.h"
>-#include "intel_backlight.h"
> #include "intel_connector.h"
> #include "intel_display_core.h"
> #include "intel_display_debugfs.h"
>@@ -153,36 +152,36 @@ void intel_connector_destroy(struct drm_connector *c=
onnector)
> 	kfree(connector);
> }
>=20
>-int intel_connector_register(struct drm_connector *connector)
>+int intel_connector_register(struct drm_connector *_connector)
> {
>-	struct intel_connector *intel_connector =3D to_intel_connector(connector=
);
>-	struct drm_i915_private *i915 =3D to_i915(connector->dev);
>+	struct intel_connector *connector =3D to_intel_connector(_connector);
>+	struct drm_i915_private *i915 =3D to_i915(_connector->dev);
> 	int ret;
>=20
>-	ret =3D intel_backlight_device_register(intel_connector);
>+	ret =3D intel_panel_register(connector);
> 	if (ret)
> 		goto err;
>=20
> 	if (i915_inject_probe_failure(i915)) {
> 		ret =3D -EFAULT;
>-		goto err_backlight;
>+		goto err_panel;
> 	}
>=20
>-	intel_connector_debugfs_add(intel_connector);
>+	intel_connector_debugfs_add(connector);
>=20
> 	return 0;
>=20
>-err_backlight:
>-	intel_backlight_device_unregister(intel_connector);
>+err_panel:
>+	intel_panel_unregister(connector);
> err:
> 	return ret;
> }
>=20
>-void intel_connector_unregister(struct drm_connector *connector)
>+void intel_connector_unregister(struct drm_connector *_connector)
> {
>-	struct intel_connector *intel_connector =3D to_intel_connector(connector=
);
>+	struct intel_connector *connector =3D to_intel_connector(_connector);
>=20
>-	intel_backlight_device_unregister(intel_connector);
>+	intel_panel_unregister(connector);
> }
>=20
> void intel_connector_attach_encoder(struct intel_connector *connector, di=
ff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i91=
5/display/intel_panel.c
>index f5c972880391..5ae302bee191 100644
>--- a/drivers/gpu/drm/i915/display/intel_panel.c
>+++ b/drivers/gpu/drm/i915/display/intel_panel.c
>@@ -462,3 +462,13 @@ void intel_panel_fini(struct intel_connector *connect=
or)
> 		drm_mode_destroy(connector->base.dev, fixed_mode);
> 	}
> }
>+
>+int intel_panel_register(struct intel_connector *connector) {
>+	return intel_backlight_device_register(connector);
>+}
>+
>+void intel_panel_unregister(struct intel_connector *connector) {
>+	intel_backlight_device_unregister(connector);
>+}
>diff --git a/drivers/gpu/drm/i915/display/intel_panel.h b/drivers/gpu/drm/=
i915/display/intel_panel.h
>index b60d12322e5d..3d592a4404f3 100644
>--- a/drivers/gpu/drm/i915/display/intel_panel.h
>+++ b/drivers/gpu/drm/i915/display/intel_panel.h
>@@ -23,6 +23,8 @@ void intel_panel_init_alloc(struct intel_connector *conn=
ector);  int intel_panel_init(struct intel_connector *connector,
> 		     const struct drm_edid *fixed_edid);  void intel_panel_fini(struct =
intel_connector *connector);
>+int intel_panel_register(struct intel_connector *connector); void=20
>+intel_panel_unregister(struct intel_connector *connector);
> enum drm_connector_status
> intel_panel_detect(struct drm_connector *connector, bool force);  bool in=
tel_panel_use_ssc(struct intel_display *display);
>--
>2.39.5
>
