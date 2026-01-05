Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98689CF2A81
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 10:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2849410E220;
	Mon,  5 Jan 2026 09:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZdpMR8vl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7717210E023;
 Mon,  5 Jan 2026 09:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767604488; x=1799140488;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3SKRuG1YL3EdjTOy150qd1sHjrrOXD6sEJUiS9oGtx4=;
 b=ZdpMR8vlrJbvfmleXXc2CIvjteAyyeYNx8md/B9+94EEMb2j9EJmF2zo
 KjZC0w972O6s6f6CWeqmtibY8CO5IGpV/CcYGtiywKHt6uJKg3IMxsk5H
 cRYKrXcjD/0wIT2Ip/97XGpw46IrSwpxXuC0Y+e1i65laF1gLDh7dhV5Z
 c+2EblyJDNIFSBvEq72MgjqT01tmYGkHMrYYu8nhzUXQBRSX3e2SQF0Ie
 C7h4wfyEk3Lfz7qiXpsAKao4K4Iu4ATxHJbIY48MfY8/S7jtUvBAh0OU+
 UOaHHoIT0bURzmHvfhOK/rYnzJM0HnLfnA+lbBwNJq/aWycLK5/uaFKVC A==;
X-CSE-ConnectionGUID: odBaLJ3TQFK+b7OiBXccQA==
X-CSE-MsgGUID: JhbNpZGwQ5KcF49NLNqB8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="80087596"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="80087596"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 01:14:48 -0800
X-CSE-ConnectionGUID: dJJeqojjS3GKPJQf3Bd9gw==
X-CSE-MsgGUID: pfbX9oSmQUGi8s2ko49svQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="239820918"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 01:14:48 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 01:14:47 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 01:14:47 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 01:14:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bE+p8PRii/X9DgiEi/Nkkhijq+grJZrBt0oTuj7vA6NpxQnFW8XKK/wDEyuy3TG9FIdaz6gFmyYg9edOtIi/+Fh2trJ/EJ4zDrjkUzgO794LC8ypPA2wtKkkP8rqTv44fKcbaiZIpRpVEOkvscN1EbuLFIXZpURavxPjQbpHF19HoxBIwz+5qa+kxTdq94Cngvk2Om/XNQnYnJ6Eq2SB9fh38O+glZNHjV9Q55FK3xPSASjLs7ML61r77rXfPrPJje0NKO99pJe9PHYf1aAtaN5cvCxPcMLLNWF6RVKI4YCNRXuLOZKfxgsbecm0I3mfiF/NEMgxKQfUKTq4iT0U/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUSBkW3tQy9AQ3joKjCoWl/G+07w1kfClY4SrMZ4MGQ=;
 b=cJOdJBsz4xwDJNMZyQHERhNncoJwKA/X4zvx66PPb7JkHt9r4siHe0a0r3w6S9+z8GkRMl1v2VMmTdOowgSBy3JH8i4sXC9XOc+w7JYTwejQC1r8Om2kdkHaZSmZGRvhVj2lk9yjt+6P6kQWMKPwB/kJOV9cqOQ3SpNvkfC3HxYUB7LD0lxPra9fIoJYJp7d3cyZKKPYqkfCLFylTAfQVJPb0i3ETGoTjM6PXfCtr/6nEBa3rq6bbyH/7K+1oKoGN8wKxVHRxaZe0wC3VZ4mkuPqkFQknPRJIGf9CLrhzbwx01MK+zYdDy7OjhxFvC2Hc0fSTPUCaBQsrYeg9Tbr7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DS7PR11MB6013.namprd11.prod.outlook.com
 (2603:10b6:8:70::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 09:14:44 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 09:14:44 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "mwen@igalia.com"
 <mwen@igalia.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "daniels@collabora.com"
 <daniels@collabora.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 05/13] drm: Allow driver-managed destruction of colorop
 objects
Thread-Topic: [PATCH 05/13] drm: Allow driver-managed destruction of colorop
 objects
Thread-Index: AQHccLb7bmJL/FbeTUCDzpjuiGzmrrVDZeOg
Date: Mon, 5 Jan 2026 09:14:44 +0000
Message-ID: <DM3PPF208195D8DF03B8885CD54AE23276BE386A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-6-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-6-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DS7PR11MB6013:EE_
x-ms-office365-filtering-correlation-id: 3a70c2d9-dbb4-4244-300b-08de4c3addbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?FkMXyNarloSUxKKPmTE+PFFOr7SjDt/OlxuKdLmU0Edr7cGdf1Kcnx72P2Dj?=
 =?us-ascii?Q?ff/q31S/Sq/6+9B7mdmeu3kff2Vs2sOsJos1y/loUYwSiFArLAuvpndBLic6?=
 =?us-ascii?Q?1HRSkXOoqCv3NkK3Sl1RSPKx/BTUdhpST88FL+GiOx8TRZanMfXY9DXZ+jWz?=
 =?us-ascii?Q?GDipLPXijFrm4TmUcb9CVjTKZyhglDvBL504UF0R44L9I0DeGQpi7134yVyj?=
 =?us-ascii?Q?cNlmojKzsG7JJpm5hy4FzKmNTbU3GIwwK/Vx2afXpSGICcDZSs83UwsAWFW0?=
 =?us-ascii?Q?jqdcy4qY/xlj0omViakRbI+fFaxebfDHqGyE1MpkrFlEKpReiR8ff/it1rrG?=
 =?us-ascii?Q?IEf7Kbke1HD8Xg7l69UJrbB+sfmYcr/kpjNC/9IZdHXZzFZmf/ZgLD8LYhQc?=
 =?us-ascii?Q?u7fvJdHRf+gBoWNCO86hBvx9MeYSw0vePJ6YTmwMXNs+YnGQG3kOpgBQ6kZ3?=
 =?us-ascii?Q?HX7LvA6KfRjfwtx9fHUVc0BV3phZCea4/n6XlfO6QKLw878lli90CGTpvcDy?=
 =?us-ascii?Q?ZTwJxScACBKZJp30E0PeTBVSnbrnI/ipBLBUCgcnAboVtxfCjjnCkSm22GEg?=
 =?us-ascii?Q?r/aNesBpqIZzCFjooiLXV5iLaxmDZXCioX9rjdHaglRrIag63xaLqFGXD8XZ?=
 =?us-ascii?Q?jVsMCnGs7pXkRVB5iP+dqpjc1fGQhn27QwQOyDvbh/e3QY2ymw8cgPuZhFmp?=
 =?us-ascii?Q?zzMQyRtLqoeqO2P2fq62e+JrodQ0YpLOpDYtP3GhiqdUp6LAe+GTZBf8ZpcK?=
 =?us-ascii?Q?Y7CG58RAQk57FTmswPkhb7rcM/lt8rJaD5gdRPJ4LhdumKSjKIFxSkEx0zjs?=
 =?us-ascii?Q?Nu3iuQ1Djm5/kKp6goTd9d5pzB/uWxLpTmi3zMkyEo2Cg0/qaIX+ngQhm34L?=
 =?us-ascii?Q?WLB3IEwcxMkR6B20ojHRpEvMo9bwCSsyPv+DJGdjRig8BBV9X4uXHIkqoQYs?=
 =?us-ascii?Q?0mlrcoCKJvOngZygkZIjhatlB3I+5XAZ1QyDPVG/uUrU/xMiZp3l48Ai3fto?=
 =?us-ascii?Q?RjV9HOTgh2mE7oDA7Dp+wH6GtkRZCzJMJWPZP2m8+9J7SkFzy22irJZ2PaS2?=
 =?us-ascii?Q?0TQUv5v2RW8d5gZz/k1KnA1p2k+vnJ164CviOBrAWurYwo/3xnzYaCBsOZVz?=
 =?us-ascii?Q?xtlOLizD1u4crKrEuooRzmpfXVboghOQ3GjPQpgsfh53A9+u0eXZUSPWnsiu?=
 =?us-ascii?Q?8/I3Pq8u6Qvetpo6Dt4V6+jsObHvbIX0Z6iKyqHf9FsmV8i60EGJnXxu9HUO?=
 =?us-ascii?Q?+aD3xKtNX/c7ifVcap6k6feQVWYgVbiF8ALPb/16O1lRF37n6rBRWme40am/?=
 =?us-ascii?Q?n7qSY3nMxxqInrDeLbnh5zp8wSy5f5ulw0y26HGqGpTFKBsKjvXIErbBlhhm?=
 =?us-ascii?Q?W+OAq8tEFjc2fBi6MeyuDZi2rrEbUHYgJLc0OZSL9eqabs8CgSwD5h55SGpA?=
 =?us-ascii?Q?C1v2A4BSWAaKsXzrYkltXE46tfbONPyrvF/Dqn1TqdWTML9lIBknJItywfRI?=
 =?us-ascii?Q?XMmXWAFhXFaiYOY+dL4Kfp/n2fGSZpn15CfH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DGc/BTivuYlCN8rAg1CTWpHKe0LUWgSqrlqQKqrVFx/KrzgPxJ5mdCyQ7qV4?=
 =?us-ascii?Q?BS+qwivNCHdfQbTTC1rCfBQ6doOyLaJK6hu5q3ML+Y5VcfFgtkP65jsEJZ1a?=
 =?us-ascii?Q?0Zl8Jf6m/znotC2XRryFaOPmpZBjDadFTwfF1yZ6j0lW5BMtx/c3pU0ggCiW?=
 =?us-ascii?Q?iV6NZsRMV3ywRIxRV+gHJGS9CL9mRj0Xk7fmDkMqgV/IJghpG271+KFCs45C?=
 =?us-ascii?Q?iwAnDBVd+894EI7PqktvSCTFwJoLadlfIY41Mvw16FguZNQnXrXppYtlFmUT?=
 =?us-ascii?Q?YKzhUnkVaXSLmadirqrck8ZBKnVxrqM6pi3eizdL60lbjxqu5zq38qldN+KB?=
 =?us-ascii?Q?xT4J9HtbokVD2NPYjOB+a9pY8aDfSwHoqHNSz7ofvwYv6xwGu4CxdG7A6eVr?=
 =?us-ascii?Q?8aFaVht4zAOkKN4Yfc3RI/2uOJrfaszbQURQz5iDeu6qd0ZxDslD5QRuQKCg?=
 =?us-ascii?Q?ll+pkeYvqKchs+Qz6RV7CmnlqddhoebS3ZIFYiC/i4NyumUOchC/InFEJqkO?=
 =?us-ascii?Q?c+7ImVkfJohdS4hMz4U9rd23vhuYz2M94K9nWoK1w2qgKAAIqcvZvredNy/J?=
 =?us-ascii?Q?pfIrDR6KgxunnhMEP2YdPaCfhnwue8qx4+WvQpiaWaipFZ22BgXW51bCm2bL?=
 =?us-ascii?Q?BMkpHtwaKjqiHa4uQyuv09ZUbE7CAo2nZVb4fqO6Cp9d5JWPTwysSHEcrESX?=
 =?us-ascii?Q?rNg2Z7JGOQavqfs8xZREuLMhpTPTp67BE66kBEjWU1zyEqUT2QqoOkhiQlHC?=
 =?us-ascii?Q?AaOeToVjQOs3pAW8f0uXzh+qnKlsd464OQh0783ZjqyacCqN3tyeBLy1g7FY?=
 =?us-ascii?Q?wR2EJ4iSy4dykinWI/TEXRsZBdEK7FYG/ik2120l5TVZu4zssiEGEp9BRQyN?=
 =?us-ascii?Q?XrwISv2COQdazNucU+twW5jKedboQUd0/hofOsKlAVbVbauqc41uTQM7PzIT?=
 =?us-ascii?Q?RvPx2PFntDKUtLjxLLRxEgcA2psIueWLeaPV+IobGlilviTD4Ch2GH5TRFX1?=
 =?us-ascii?Q?+XWP+elEUt/aBR4SWKDlgN8L4yNfzj+cE8o1eLAuMEsBi4VVc6j/W31LvzF4?=
 =?us-ascii?Q?DDGQIRJYZE7ngDTM6nwZ/3/8ejVyILgNoPwsE+X8hSkOEV6WwcS7iuZJNuaH?=
 =?us-ascii?Q?GwQk4VoqcJZnOunzZ3UHgI9god5WUf+ClHJfOlz87x2lVHguhXc9mk+e7hcH?=
 =?us-ascii?Q?mNxbZD/yO8xF+erpQ8+88tQ7V9pzqwB7G4lftgAc/eQ5EzvNg5slNYc5yHWf?=
 =?us-ascii?Q?e9fkA65HEIvKTxiBcCIB7ZYM1/rInr69L5WZa6t6fW0VEkF77M21JSKkVd5j?=
 =?us-ascii?Q?McKaYYejw3gIGJIO45Vu7ppMLRgjrcEHLe6qUz/EeD+R63y6aaGWZ/VSgRvb?=
 =?us-ascii?Q?1JpEv3MJZzgtg1GayOusiBHDKg9mxqZEkTyClktHDMj+2zBb/br/wXg5DCQC?=
 =?us-ascii?Q?XR8MCcJASLM6s5Gyto4a+u0kvUoru+3J2wNGRyc08CfH64bNiKTosxL+WqeY?=
 =?us-ascii?Q?yYyfY6iCsiq6bJaoP02o5Aj+GnHkeT7E/nzTc2v6pFVbNttOmiHyy5mTF0xK?=
 =?us-ascii?Q?d0LDXcmJsPSvPPdH5iX9XHY73hzWlK05VbnRerBzdQLpxbLEFqyCwYtaGL5p?=
 =?us-ascii?Q?7CN4wZvstDVUh+T/s2tiHKL3pwh3uN4NsdXgmJ9u497LPe4yne13IRJurTLK?=
 =?us-ascii?Q?XFuVIbmzgf+PtBQ8nFy6nkYbgH6KWF9bwTNlJQo9m35VnXPvSQde/tnJZzuD?=
 =?us-ascii?Q?EWICwz+JtQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a70c2d9-dbb4-4244-300b-08de4c3addbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 09:14:44.5151 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m6CHY4qT+jywETJP59FXgM2E71yJkENsCrM0od5jZXsquYEPj7ETNMJ8S8abExazdaD54NBupquKmx5jN2Lj3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6013
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

> Subject: [PATCH 05/13] drm: Allow driver-managed destruction of colorop
> objects
>=20
> Some drivers might want to embed struct drm_colorop inside driver-specifi=
c
> objects, similar to planes or CRTCs. In such cases, freeing only the drm_=
colorop
> is incorrect.
>=20
> Add a drm_colorop_funcs callback to allow drivers to provide a destroy ho=
ok
> that cleans up the full enclosing object. Make changes in helper function=
s to
> accept helper functions as argument. Pass NULL for now to retain current
> behavior.
>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 18 ++++++-----
>  drivers/gpu/drm/drm_colorop.c                 | 31 +++++++++++++------
>  .../drm/i915/display/intel_color_pipeline.c   |  8 ++---
>  drivers/gpu/drm/vkms/vkms_colorop.c           | 10 +++---
>  include/drm/drm_colorop.h                     | 30 +++++++++++++++---
>  5 files changed, 66 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> index a2de3bba8346..dfdb4fb4219f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -72,7 +72,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> +	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
>=20
> amdgpu_dm_supported_degam_tfs,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
> @@ -89,7 +89,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_mult_init(dev, ops[i], plane,
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	ret =3D drm_plane_colorop_mult_init(dev, ops[i], plane, NULL,
> +DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
>=20
> @@ -104,7 +104,8 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane,
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
> +
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
>=20
> @@ -120,7 +121,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  			goto cleanup;
>  		}
>=20
> -		ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> +		ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> NULL,
>=20
> 	amdgpu_dm_supported_shaper_tfs,
>=20
> 	DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  		if (ret)
> @@ -137,7 +138,8 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  			goto cleanup;
>  		}
>=20
> -		ret =3D drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane,
> MAX_COLOR_LUT_ENTRIES,
> +		ret =3D drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane,
> NULL,
> +
> 	MAX_COLOR_LUT_ENTRIES,
>=20
> 	DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>=20
> 	DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  		if (ret)
> @@ -154,7 +156,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  			goto cleanup;
>  		}
>=20
> -		ret =3D drm_plane_colorop_3dlut_init(dev, ops[i], plane,
> LUT3D_SIZE,
> +		ret =3D drm_plane_colorop_3dlut_init(dev, ops[i], plane, NULL,
> +LUT3D_SIZE,
>=20
> 	DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>=20
> 	DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  		if (ret)
> @@ -172,7 +174,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> +	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
>  					      amdgpu_dm_supported_blnd_tfs,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
> @@ -189,7 +191,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane,
> MAX_COLOR_LUT_ENTRIES,
> +	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, NULL,
> +MAX_COLOR_LUT_ENTRIES,
>=20
> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.=
c
> index 44eb823585d2..efe61bdd9b24 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -93,7 +93,8 @@ static const struct drm_prop_enum_list
> drm_colorop_lut3d_interpolation_list[] =3D
>  /* Init Helpers */
>=20
>  static int drm_plane_colorop_init(struct drm_device *dev, struct drm_col=
orop
> *colorop,
> -				  struct drm_plane *plane, enum
> drm_colorop_type type,
> +				  struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
> +				  enum drm_colorop_type type,
>  				  uint32_t flags)
>  {
>  	struct drm_mode_config *config =3D &dev->mode_config; @@ -109,6
> +110,7 @@ static int drm_plane_colorop_init(struct drm_device *dev, struc=
t
> drm_colorop *co
>  	colorop->type =3D type;
>  	colorop->plane =3D plane;
>  	colorop->next =3D NULL;
> +	colorop->funcs =3D funcs;
>=20
>  	list_add_tail(&colorop->head, &config->colorop_list);
>  	colorop->index =3D config->num_colorop++; @@ -203,6 +205,7 @@
> EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
>   * @dev: DRM device
>   * @colorop: The drm_colorop object to initialize
>   * @plane: The associated drm_plane
> + * @funcs: control functions for the new colorop
>   * @supported_tfs: A bitfield of supported drm_plane_colorop_curve_1d_in=
it
> enum values,
>   *                 created using BIT(curve_type) and combined with the O=
R '|'
>   *                 operator.
> @@ -210,7 +213,8 @@ EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
>   * @return zero on success, -E value on failure
>   */
>  int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct
> drm_colorop *colorop,
> -				    struct drm_plane *plane, u64 supported_tfs,
> uint32_t flags)
> +				    struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
> +				    u64 supported_tfs, uint32_t flags)
>  {
>  	struct drm_prop_enum_list
> enum_list[DRM_COLOROP_1D_CURVE_COUNT];
>  	int i, len;
> @@ -231,7 +235,7 @@ int drm_plane_colorop_curve_1d_init(struct
> drm_device *dev, struct drm_colorop *
>  		return -EINVAL;
>  	}
>=20
> -	ret =3D drm_plane_colorop_init(dev, colorop, plane,
> DRM_COLOROP_1D_CURVE, flags);
> +	ret =3D drm_plane_colorop_init(dev, colorop, plane, funcs,
> +DRM_COLOROP_1D_CURVE, flags);
>  	if (ret)
>  		return ret;
>=20
> @@ -288,20 +292,23 @@ static int drm_colorop_create_data_prop(struct
> drm_device *dev, struct drm_color
>   * @dev: DRM device
>   * @colorop: The drm_colorop object to initialize
>   * @plane: The associated drm_plane
> + * @funcs: control functions for new colorop
>   * @lut_size: LUT size supported by driver
>   * @interpolation: 1D LUT interpolation type
>   * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
>   * @return zero on success, -E value on failure
>   */
>  int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct
> drm_colorop *colorop,
> -					struct drm_plane *plane, uint32_t
> lut_size,
> +					struct drm_plane *plane,
> +					const struct drm_colorop_funcs
> *funcs,
> +					uint32_t lut_size,
>  					enum
> drm_colorop_lut1d_interpolation_type interpolation,
>  					uint32_t flags)
>  {
>  	struct drm_property *prop;
>  	int ret;
>=20
> -	ret =3D drm_plane_colorop_init(dev, colorop, plane,
> DRM_COLOROP_1D_LUT, flags);
> +	ret =3D drm_plane_colorop_init(dev, colorop, plane, funcs,
> +DRM_COLOROP_1D_LUT, flags);
>  	if (ret)
>  		return ret;
>=20
> @@ -339,11 +346,12 @@ int drm_plane_colorop_curve_1d_lut_init(struct
> drm_device *dev, struct drm_color
> EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
>=20
>  int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct
> drm_colorop *colorop,
> -				   struct drm_plane *plane, uint32_t flags)
> +				   struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
> +				   uint32_t flags)
>  {
>  	int ret;
>=20
> -	ret =3D drm_plane_colorop_init(dev, colorop, plane,
> DRM_COLOROP_CTM_3X4, flags);
> +	ret =3D drm_plane_colorop_init(dev, colorop, plane, funcs,
> +DRM_COLOROP_CTM_3X4, flags);
>  	if (ret)
>  		return ret;
>=20
> @@ -363,16 +371,18 @@
> EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
>   * @dev: DRM device
>   * @colorop: The drm_colorop object to initialize
>   * @plane: The associated drm_plane
> + * @funcs: control functions for the new colorop
>   * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
>   * @return zero on success, -E value on failure
>   */
>  int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_color=
op
> *colorop,
> -				struct drm_plane *plane, uint32_t flags)
> +				struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
> +				uint32_t flags)
>  {
>  	struct drm_property *prop;
>  	int ret;
>=20
> -	ret =3D drm_plane_colorop_init(dev, colorop, plane,
> DRM_COLOROP_MULTIPLIER, flags);
> +	ret =3D drm_plane_colorop_init(dev, colorop, plane, funcs,
> +DRM_COLOROP_MULTIPLIER, flags);
>  	if (ret)
>  		return ret;
>=20
> @@ -391,6 +401,7 @@ EXPORT_SYMBOL(drm_plane_colorop_mult_init);
>=20
>  int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colo=
rop
> *colorop,
>  				 struct drm_plane *plane,
> +				 const struct drm_colorop_funcs *funcs,
>  				 uint32_t lut_size,
>  				 enum drm_colorop_lut3d_interpolation_type
> interpolation,
>  				 uint32_t flags)
> @@ -398,7 +409,7 @@ int drm_plane_colorop_3dlut_init(struct drm_device
> *dev, struct drm_colorop *col
>  	struct drm_property *prop;
>  	int ret;
>=20
> -	ret =3D drm_plane_colorop_init(dev, colorop, plane,
> DRM_COLOROP_3D_LUT, flags);
> +	ret =3D drm_plane_colorop_init(dev, colorop, plane, funcs,
> +DRM_COLOROP_3D_LUT, flags);
>  	if (ret)
>  		return ret;
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> index 04af552b3648..d3d73d60727c 100644
> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> @@ -25,7 +25,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane
> *plane, struct drm_prop_en
>=20
>  	colorop =3D intel_colorop_create(INTEL_PLANE_CB_PRE_CSC_LUT);
>=20
> -	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base,
> plane,
> +	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base,
> plane,
> +NULL,
>  						  PLANE_DEGAMMA_SIZE,
>=20
> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS); @@ -39,7 +39,7 @@ int
> _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop=
_en
>  	prev_op =3D &colorop->base;
>=20
>  	colorop =3D intel_colorop_create(INTEL_PLANE_CB_CSC);
> -	ret =3D drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
> NULL,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		return ret;
> @@ -52,7 +52,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane
> *plane, struct drm_prop_en
>  	    plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
>  		colorop =3D intel_colorop_create(INTEL_PLANE_CB_3DLUT);
>=20
> -		ret =3D drm_plane_colorop_3dlut_init(dev, &colorop->base,
> plane, 17,
> +		ret =3D drm_plane_colorop_3dlut_init(dev, &colorop->base,
> plane, NULL,
> +17,
>=20
> DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>  						   true);
>  		if (ret)
> @@ -64,7 +64,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane
> *plane, struct drm_prop_en
>  	}
>=20
>  	colorop =3D intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
> -	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base,
> plane,
> +	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base,
> plane,
> +NULL,
>  						  PLANE_GAMMA_SIZE,
>=20
> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS); diff --git
> a/drivers/gpu/drm/vkms/vkms_colorop.c
> b/drivers/gpu/drm/vkms/vkms_colorop.c
> index d03a1f2e9c41..9e9dd0494628 100644
> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> @@ -31,7 +31,7 @@ static int vkms_initialize_color_pipeline(struct drm_pl=
ane
> *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> supported_tfs,
> +	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
> +supported_tfs,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
> @@ -48,7 +48,8 @@ static int vkms_initialize_color_pipeline(struct drm_pl=
ane
> *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane,
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
> +
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
>=20
> @@ -64,7 +65,8 @@ static int vkms_initialize_color_pipeline(struct drm_pl=
ane
> *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane,
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
> +
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
>=20
> @@ -80,7 +82,7 @@ static int vkms_initialize_color_pipeline(struct drm_pl=
ane
> *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> supported_tfs,
> +	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
> +supported_tfs,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h index
> a3a32f9f918c..45d1b1d3faf9 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -187,6 +187,19 @@ struct drm_colorop_state {
>  	struct drm_atomic_state *state;
>  };
>=20
> +/**
> + * struct drm_colorop_funcs - driver colorop control functions  */
> +struct drm_colorop_funcs {
> +	/**
> +	 * @destroy:
> +	 *
> +	 * Clean up colorop resources. This is called at driver unload time
> +	 * through drm_mode_config_cleanup()
> +	 */
> +	void (*destroy)(struct drm_colorop *colorop); };
> +
>  /**
>   * struct drm_colorop - DRM color operation control structure
>   *
> @@ -362,6 +375,8 @@ struct drm_colorop {
>  	 */
>  	struct drm_property *next_property;
>=20
> +	/** @funcs: colorop control functions */
> +	const struct drm_colorop_funcs *funcs;
>  };
>=20
>  #define obj_to_colorop(x) container_of(x, struct drm_colorop, base) @@ -
> 390,17 +405,22 @@ void drm_colorop_pipeline_destroy(struct drm_device
> *dev);  void drm_colorop_cleanup(struct drm_colorop *colorop);
>=20
>  int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct
> drm_colorop *colorop,
> -				    struct drm_plane *plane, u64 supported_tfs,
> uint32_t flags);
> +				    struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
> +				    u64 supported_tfs, uint32_t flags);
>  int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct
> drm_colorop *colorop,
> -					struct drm_plane *plane, uint32_t
> lut_size,
> +					struct drm_plane *plane,
> +					const struct drm_colorop_funcs
> *funcs,
> +					uint32_t lut_size,
>  					enum
> drm_colorop_lut1d_interpolation_type interpolation,
>  					uint32_t flags);
>  int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct
> drm_colorop *colorop,
> -				   struct drm_plane *plane, uint32_t flags);
> +				   struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
> +				   uint32_t flags);
>  int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_color=
op
> *colorop,
> -				struct drm_plane *plane, uint32_t flags);
> +				struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
> +				uint32_t flags);
>  int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colo=
rop
> *colorop,
> -				 struct drm_plane *plane,
> +				 struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
>  				 uint32_t lut_size,
>  				 enum drm_colorop_lut3d_interpolation_type
> interpolation,
>  				 uint32_t flags);
> --
> 2.25.1

