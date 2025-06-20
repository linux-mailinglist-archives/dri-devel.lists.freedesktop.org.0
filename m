Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7443AE130B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 07:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C355010EADA;
	Fri, 20 Jun 2025 05:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l40xjp+L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EC910EAD8;
 Fri, 20 Jun 2025 05:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750397956; x=1781933956;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SIU+Mi5/dRLcdyb2VBDIls2iicpJPz488vP1vHc15/0=;
 b=l40xjp+LyKdAsv41bm+X69tPdqNsjrsakTKPMOEETQYmPppHYoUsgT9a
 /KqpAShM/a40hJyCFKaRjW7kYPuMUPMeMkJduB4UesSnf1R0Z/Wi7dksY
 k5gK5XR76mYPDULKn1kIdlaLs8WemZhG7eadgXUY7TXzNYWpPbXcMMzmA
 yrwJsRoO0a5TjqSmZIGVxtYLWFrMfi6nqEtJ0VyX/vxS3EUxRrrbGarbM
 MVFmPY24B3VT82/JIcZ7piFFgDR7ADCe6/xRgLuGs4pLDL+BhO/epXTe0
 VGUYNz7iatR0RM+rpdcBagMiHkGLqRNs0GKTn9STKSQ6FDsM39HhhopPE g==;
X-CSE-ConnectionGUID: 0NrrH3X4TiSlgq5qUcJCbQ==
X-CSE-MsgGUID: 6J6Y5kMRTqurzMfb49sDfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52532919"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="52532919"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 22:39:16 -0700
X-CSE-ConnectionGUID: X7XcN17cR3qzT7vu1TNkVA==
X-CSE-MsgGUID: CPzBc6zlROaoCHsJWO0CTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="151350682"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 22:39:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 22:39:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 22:39:14 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.58)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 22:39:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8s5hVYWK9holwsikBx/luGmlyjle8IdO7EDUsFypX4tZ8kTVSa1f/j+u44R68ccNh0xJUd7qv3Cyj28kAFQOEIqSUCBF9EA+yXplFjTgNh6rfJCiHi2FTTNJnUOIgPoZF5o6s0MUVDgM4Qe/IGCRoPfWbx2aCtG9VfeklKflvDJCOZnLpR1YFDwEjOBLqxlffGOsFFRAaKTGJoYd866lFzyc8yyPXlObp9HdV9WCLlZ/kqcXs9qbMJrT/13jAZe1x4i8JA8yfGBBJwNiLCOrQLaCGRvAqsxggGLqq9FIFCka2QkuOVhLaRL820uMP8KMAi0X0Ax8tIjo7I8TxCZog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqSZLorD/aoyeBlcE2kJ94cfwwW5zB/3Zg9o2Y49f7o=;
 b=bcCbOXAkTgB0AkQdncNVQUKSFzBYDi1apmtlDJqAPca47tCfQrhT7o700M+k0YypwWwDM3PLxnFQflyqwB/SVBJFDd+IMD6D3iwK5HmLbmzDythsKN0Zna7V0RzTzyNVIpVDTXqKfDO40CvOi13kdPICNoYYCMQ0YDkN3Y7RC5oj4+UteV7qwwJLT9PI7xkeqZH+UoxS9XVqRlwWytBbbvBnAbtWEYNS8HjgMeB1B+fOvLNGYS8fBPVVDx8HJxV5PsD086z9Z8Wk3ebHtSAV6OZ65rJtB+HK2TkFxRGfPdZNP47JIKOv8daU1g8HQMiLOzb6HmS67n9XXq7yndVNsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ5PPF0D72A1BA6.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::80c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Fri, 20 Jun
 2025 05:39:11 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64%5]) with mapi id 15.20.8857.020; Fri, 20 Jun 2025
 05:39:11 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH 07/13] drm/dp: Change argument type for
 drm_edp_backlight_set_level
Thread-Topic: [PATCH 07/13] drm/dp: Change argument type for
 drm_edp_backlight_set_level
Thread-Index: AQHbwKHkhDWsWUmD50OONdoC1YjueLQLyfLQ
Date: Fri, 20 Jun 2025 05:39:11 +0000
Message-ID: <DM3PPF208195D8D2CD5A5C37B86AC2E6503E37CA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250509051816.1244486-1-suraj.kandpal@intel.com>
 <20250509051816.1244486-8-suraj.kandpal@intel.com>
In-Reply-To: <20250509051816.1244486-8-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ5PPF0D72A1BA6:EE_
x-ms-office365-filtering-correlation-id: 2853f305-9c3c-42c3-8567-08ddafbcc8f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?nubVuy1ZrfzzAp+0L+F0U3VxVAy3QTEcUUfQMNVMIhOTEiFUZ427xJOV9Gdz?=
 =?us-ascii?Q?pqtr+xS/9aRhz663WbAJEITkjSlAzybOGs4OPzXBl5+L4G8D+CN+0VHrnn8n?=
 =?us-ascii?Q?LPmDKiDVtuCB6suHxIN3O07mxHL9lgjzgsyBsu2d6i9Uq/X6WJYeAY6p+7sH?=
 =?us-ascii?Q?+tphAYJEWo6stwqBU0LmWeH3sSZrFltXGQOh0s4MkFF0QqzIwdC/mT4biWSX?=
 =?us-ascii?Q?9/h8gPW0sb6PA3dx0wZ8s25Ac/WAXE2odLtMLILiX4iIDVfY4NhubWk82aFb?=
 =?us-ascii?Q?G6eGSA5JD+BtoIqTwT8jQaMlACI0r9h8HAEWhEoHnjbX3dBm9WEzkhnTqqnG?=
 =?us-ascii?Q?25X/2+o2+fadTOF60jWbVfslt/orfaHo1UJjagjCgG2f9FOx7PiFqvVaBvZt?=
 =?us-ascii?Q?g0iXUrmbMXSR9RmcEkCs7g3fH+w0+POSivPOaedmjh47EGLLxNH+B+hz+YyA?=
 =?us-ascii?Q?VtvRqk7j8j1llhm0QbwwtfidfF6XroyQF3yY3EH1RO93r6sZoP7DI/wWazg/?=
 =?us-ascii?Q?xPQHYT+KiPQOib3bNRA2OhEZMkCQcEfAY4hSZHl2UEEk2nEWqTGT36mCMNu2?=
 =?us-ascii?Q?XpVfX2igT6R2jS4ciqFYr3ctOiUFXUP7XimOIQcfuEvcTGut2MHivMy7A7hR?=
 =?us-ascii?Q?PpCpseQ3mfXTDcxUSuOQo7Q4msvL2uYK01mx+6dh03q1kE2UyA1SQbzlaYqF?=
 =?us-ascii?Q?TyQ+sQ0U2MY92Qk+Q9enVylmdh+7tbcAsH/0iLvc8BoWR24xBpokc88PUUms?=
 =?us-ascii?Q?GLF9OzPprqgYHOajslsvU28EGLRr/JbE2aE1Ly2z6kaoxfXzrR3wEE7FlZJn?=
 =?us-ascii?Q?Bp7/SFGIgCAIrI+UNj4tMR8Cvcbp9F05/2mDgAvhp6X349tXzspp/o4lFec3?=
 =?us-ascii?Q?uac7NeTRf70bGs4TJNv6xppxqAwhXdFLA2hUt8iazBf7i22QbnWx6huCyv0O?=
 =?us-ascii?Q?HYY/SY7LQxGDmffApnIKkAalDzenZdVhpS6Kpup2aAOWtPHB6iATAf3SsWGz?=
 =?us-ascii?Q?CrZwsExfj0oNAmWlfAd+pVRT0eElMudRR3+FKynYeFjp4LbRkTCv3f/94yg0?=
 =?us-ascii?Q?JnpEABb2y43jz5awizaYPZj8T+pWebHQM+6WFTyYsGxsJY/QSzhF+wQC8LJx?=
 =?us-ascii?Q?gmClV8pPySHGaQdOp9c3zml68a17DodsZDemNELiZj/l9aNCnJEZx9lX7Rwf?=
 =?us-ascii?Q?F7ymA2IyRTMiwNuHWdaMLrFi2bgzjOFWcF8Rwu1W6siminS6kxyRSwaY+ZkC?=
 =?us-ascii?Q?oyu2D6ykMcJO+m6DXh751Uox90cijCLv9OxH/F3OiPpcaPiQtHDCH2LL6LFt?=
 =?us-ascii?Q?rpyUGjSdIv7cVxM9sj9EulyRPyFwm5/3TUznJX+4Y1qrrqz8ZlMHmsGlw7e3?=
 =?us-ascii?Q?x7IxPBGvD33wpO9s1hbwKaJ3o6pFsKHJjxZKYunVuc/sjozwF+jEq1neETa0?=
 =?us-ascii?Q?pcUcTZOQxSIahOffTiyQrx6WZJzy6T5AjGdvhm9M2Zifr4FHWNCOGtJc9dqa?=
 =?us-ascii?Q?KZYvmA1BnmhYOuM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CkJk8e6+vm7/Ie9RNcFqkbr5MB/mb1SDb9wMxrxR+PMGbtiTR+C3J+qr8KaH?=
 =?us-ascii?Q?GiFXI1tdzp1o//EJVHkYWgwiI8Weh1ojSiG1MA/fl1ueXcbWWlTcG7RFWLk6?=
 =?us-ascii?Q?lXp0vOScXe5Me3QtEA1KF2F+8J0ch7KS18QqevyeKLVDKh7kgRl1JNaj8rR1?=
 =?us-ascii?Q?JRr3Y7En3zJwIqRsTXDcMSycVM5S+Ri3T6anAKDSrWqm0OO9DnrTD1Qcffq/?=
 =?us-ascii?Q?J3MYrXSweWMsNxhZo4M0XV+8OSuGSueWMwY1kr3gS9Fi2nUgqFyxmcyarBGE?=
 =?us-ascii?Q?vVQEtly7BLkbNYKtGELCIRkrtCjAi/8yTxYp81SRCNgXSxZxoSoY6d3yjq8x?=
 =?us-ascii?Q?HJ6BTd6UjiqqAtLPxrpbGlmvwJGm0euD1MhbPBYajBAIMSnse8cl4yYzTblr?=
 =?us-ascii?Q?WMS6H7HXV7AZnV5Bgtg2jp5weFM65xWu7Nbr135m0CdYTPPuHxB5/gkrklfd?=
 =?us-ascii?Q?2uGNTOohgZ2WcGudquuYUfvCRGnpslNETGlg3SgY1CEaGW0K2UHxb+XlJAb+?=
 =?us-ascii?Q?exGO16xLIp5YQtl10i6TxpBHusMAvJxsSYcIv4puFlw/cDxk8J9qaRVWBe6m?=
 =?us-ascii?Q?ycVyavyuQr5/pHcTuLnCyaxx31hpBLkaLgGtxFcaLBZDjp3DGQqp1oq422G+?=
 =?us-ascii?Q?iWWGVftGAh+u1YvghVa2WccZREbzzJLPqQLW0PUMZuXotxUbmwvh9swOCH9J?=
 =?us-ascii?Q?6ipYayQYZk27xazX9o02F2h+LgenEJhTaK1p6AqYQ50fcWvqEqdoTOKLclnl?=
 =?us-ascii?Q?19GckGWBcshJgG6sZ3ixZI80/OCua2J30H5RuKi9qP1EjS9QZeUdBagRRftc?=
 =?us-ascii?Q?+BRSdNf1dyJ/nPsVa2J8OB6XMLABcIU/QGyjI3X9T2zJyVWOZ/uJD9w2Tdv8?=
 =?us-ascii?Q?rPh0hbxArYK+LdQMS3lnzRV34lfHqHJSiXNUlq9sz2W/V/8qUTEYw7VcMFIH?=
 =?us-ascii?Q?mK9dZp7uNSNzSjrSsQH3BXldgjGn4Cp71GzhUIh1Q7jPLE24hG39dHiqdojM?=
 =?us-ascii?Q?eD8l+ZOmUWKiVN9HaXrrdRJsp/iTBXQoLRLoZKWJUd+qskAGotEl22mP7jo0?=
 =?us-ascii?Q?yByitsKqKK4KLw70U2lTmAiqPdJwxsj1iUb0N6+DeX8Pfxsdwb+p3CjRMFD/?=
 =?us-ascii?Q?NZr8SgefsH1w9grEgbdSibgtvCsK7j0DrXp15EbokgHgvswcMeL44JdaiqO1?=
 =?us-ascii?Q?tjAlFbvPtVootKzm0atVXBJnAoSWayutCkyM7tokKCr6Ij/NHLgah6V+ORkl?=
 =?us-ascii?Q?zi+8EcBZIiA2HvH5f2dgysNeKcY7+4BVTPwn7QA0LM0Con7AE3I4sQSvfhjZ?=
 =?us-ascii?Q?lkAM/P2XSmn2SjbKoiuZLYQ55sIr7aN8v5LnfDTp+GOVVa1wJK66Q+vWuemr?=
 =?us-ascii?Q?LclBR5lTS++O1zOREaoSs3Ql8GJ5g0ZL1ZHCcUXmqEpA0WffMMKsFbpzBZrH?=
 =?us-ascii?Q?lqPvJLYEUWNZeVqL8FmEuazkw37m4fM0ahvT7KGTtF3fxN/VSc7SGA5IECBb?=
 =?us-ascii?Q?Fm+dZ3OLyYaVH/MX1bcj3yuAAluM0SxMGPvPEv8aVKjByF0FkaM2UBnxg8ZT?=
 =?us-ascii?Q?DW7aMka6y1vEr+1SleKmqlCAo+KH5q8wJtThHQIv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2853f305-9c3c-42c3-8567-08ddafbcc8f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 05:39:11.6404 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3MvYfE0B8DB4eGr49Wf4Gruv82HwinmwcIBvxYBPHx7cKr1chGd9Vy9d2x0GmPEMPwaFAb3UV9ofJx6oZuQ+ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0D72A1BA6
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
> Sent: Friday, May 9, 2025 10:48 AM
> To: nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org; intel=
-
> xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH 07/13] drm/dp: Change argument type for
> drm_edp_backlight_set_level
>=20
> Use u32 for level variable as one may need to pass value for
> DP_EDP_PANEL_TARGET_LUMINANCE_VALUE.
>=20
> --v2
> -Typecase is not needed [Jani]
>=20

Ping Arun
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
>  include/drm/display/drm_dp_helper.h     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> b/drivers/gpu/drm/display/drm_dp_helper.c
> index 0c90f161bf4d..b17f9e75d93f 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -3933,7 +3933,7 @@
> EXPORT_SYMBOL(drm_dp_pcon_convert_rgb_to_ycbcr);
>   * Returns: %0 on success, negative error code on failure
>   */
>  int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct
> drm_edp_backlight_info *bl,
> -				u16 level)
> +				u32 level)
>  {
>  	int ret;
>  	u8 buf[2] =3D { 0 };
> diff --git a/include/drm/display/drm_dp_helper.h
> b/include/drm/display/drm_dp_helper.h
> index 8acc20a3b80a..88b858048746 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -853,7 +853,7 @@ drm_edp_backlight_init(struct drm_dp_aux *aux,
> struct drm_edp_backlight_info *bl
>  		       u16 driver_pwm_freq_hz, const u8
> edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
>  		       u32 *current_level, u8 *current_mode, bool
> need_luminance);  int drm_edp_backlight_set_level(struct drm_dp_aux *aux,
> const struct drm_edp_backlight_info *bl,
> -				u16 level);
> +				u32 level);
>  int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct
> drm_edp_backlight_info *bl,
>  			     u16 level);
>  int drm_edp_backlight_disable(struct drm_dp_aux *aux, const struct
> drm_edp_backlight_info *bl);
> --
> 2.34.1

