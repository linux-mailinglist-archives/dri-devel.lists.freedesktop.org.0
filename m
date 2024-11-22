Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E779D58D2
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 05:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F5810EAC1;
	Fri, 22 Nov 2024 04:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fIj8iRcD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D24010E1B8;
 Fri, 22 Nov 2024 04:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732249512; x=1763785512;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ovNEuuz7QE53Pr5kkiVBRV3ZsP7H9Z474mZM+0qtB28=;
 b=fIj8iRcDOe31wHceSiffJx4MWlng8ITCrr7UAU+Mm+LRWroJf55mbYp5
 zXD8hQdz5xSLQF1GIOdAIKtnF6AgIvgs2Wrlji3hfgB0YBjJ0FzlXtzf+
 KdWM9vU2l5GGduPmFlgu7brnI2H0QnDd2Z0DoFvJu7iTb5/abQG0GVOLT
 2Cfy+9t5ko70CnPcWrG5uB2uCk5auQG37Gvs7R8czJcOPZq3P5W9CkEKE
 JdFUoBXpeHR6RpDW5Vn/MmzqF/nbZstP1b7sPy6ildlQ74riLw1Lnb296
 igGgfvnDjc0D48L3rpm41T34soH02GjejDf8uDkcXkt2Q/sfLOXVo0vAn Q==;
X-CSE-ConnectionGUID: y2MM9mA6TTugQFiJs0qj/Q==
X-CSE-MsgGUID: 8Q4d2ILuT9O7I0g3yQhW+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="35251589"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="35251589"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 20:25:12 -0800
X-CSE-ConnectionGUID: IgE+2P+cThyb1XtTb+mEag==
X-CSE-MsgGUID: DpygCeiaS6SS4InrSa4+UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="121410089"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 20:25:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 20:25:08 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 20:25:08 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 20:25:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIa9N0b4/8BYAasgS+R+d5GClI9hIHlofD4mnX3X7pQTNK5wJPXS72hEs4SykimZ8b9cXciNEYNXSv27g1NvmEh/m4M0oqEXbiWd6p1thvjL63HDD7HgdlYntE9zxUBeSD5cAIKqFXkEZp/ZpAIYXOYSHW8hWCXwd2zr+ZBc6va6qabB8t6BPoNRx6KXTSGWKyoMtAGQQ0UmsM3eAJl5Iu71J1orHweTCjUhsUK00oQUBrvAE1Uc1j/REWVDaES9OSG5lrde3XrmO1nfZb8HBLnYvLPivR9AoZOLAhcR+7vzcqYFfA3pZeTYJPY7O/AEb3aRKDJD3wsZn5uyl5T1AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAiQZvZv02sDXwl+C8/pmKBpeWqeYW/5apqPdqx/9sw=;
 b=tsqpmoROyFpWDv9+ck0aBmOW1w+XgPHIsdzb+tQYAn0A+0vkJLNqL4e+Hacfl7JZMY+Gm2qp5dldaIkz6ZMdVFJZnHhUqQQXgrDUTJOcOHPxXY1UQHnS98BoqYt8xb/A/ODM+ULMJJ9mI4d1KsHBdWFdyotBZf60cVqBicD5ZwEeUc1zn2zmH51x9XsqP0ZhqRrkFBrMnTLO05dRBDYL6fP6Kom6+5jbIPgluEgM1ioUDiC7fvx/pkNSp9os/ibAtiWLRqoZNQxt3QHbjIGn0RpaMP0iVDZaTuHGsj5VcMRyUlIXT1/K+VpUjI1iP21SU4zbmI89p4pp9cFlBr7VvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Fri, 22 Nov
 2024 04:24:59 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8093.027; Fri, 22 Nov 2024
 04:24:59 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv6 5/8] drm/i915/histogram: Add crtc properties for global
 histogram
Thread-Topic: [PATCHv6 5/8] drm/i915/histogram: Add crtc properties for global
 histogram
Thread-Index: AQHbPBHyjJ9QkG83RUayJ5zlEgjYXrLCXeuAgABWSxA=
Date: Fri, 22 Nov 2024 04:24:58 +0000
Message-ID: <IA0PR11MB730794BF402FC82BA5FEC1D4BA232@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241121122603.736267-1-arun.r.murthy@intel.com>
 <20241121122603.736267-6-arun.r.murthy@intel.com>
 <thqbnbw2yiqbfya7bh2izzf5qwr6fkir5m5luqkrhqj6vnltad@w2562fgo75g5>
In-Reply-To: <thqbnbw2yiqbfya7bh2izzf5qwr6fkir5m5luqkrhqj6vnltad@w2562fgo75g5>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|PH7PR11MB6932:EE_
x-ms-office365-filtering-correlation-id: 301cd38e-23fe-4ec8-3146-08dd0aada033
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?PDYF3po3Ke0nmhipD+EbogxFaP2KVHQVEh6aXMMm4hozpkrsdcgT4A+z0Z+O?=
 =?us-ascii?Q?yy7Ww9/R5pqCh6Fz8wjcIitjILg0beC9LRv4jHOT8FtWFOfUopRCoDeRKA+6?=
 =?us-ascii?Q?Cq9PZly1mob1wS+5AoHQ+0YVYLBs+4+w0Nwvkjrq0yxYY0Pw3XSrGHXegl0t?=
 =?us-ascii?Q?dR1ULn1LckD6NKtdsCqx0YFelLr8iXuusnlkL7rMNjBLcbgxEG0BsNNBh+l+?=
 =?us-ascii?Q?vhxnt9zIhGRfnb27CxXskcqxCQLNCIed7Oh5fjJG8BWe4bBEyLUnZfDTw7lQ?=
 =?us-ascii?Q?ApKW6sVM5HlBFmA0hRn+KNewiuDsCggVvofCBgv88AaT3D5Mk50bbNWZcswd?=
 =?us-ascii?Q?d7cbu/zrb74plCRDdKGqPOvFcTuZZ21tKD/8oHYJmZ1A9y75xaFKeJSNFMhX?=
 =?us-ascii?Q?d3iSZ9QKO+jgSVfVn4983McZgn88IWvGQsqoeXMnsNwpfvZXKA1Qwv0gGRhg?=
 =?us-ascii?Q?EWR6wzvuQnotCMNODy5qzcitue2lLshXDaUS/nsydGd87oWdoTEc5n1fHm2c?=
 =?us-ascii?Q?ri2M5wq4jjkM9I6MD8l7ainWC8zNuXfHBWvAv1cxG32txDfGnRCDkKfyCkHc?=
 =?us-ascii?Q?j2NluGNC7QXfxAYP89WH7AzVuKNGYGZZMQV+IsQ4uuYcKhB3S6/ikjrVSEXQ?=
 =?us-ascii?Q?KqsAE3DjKRtl1IfheU6CUqQcL2Smh5cb660BlABvliS6QnRenmSbzqE0kbok?=
 =?us-ascii?Q?xaH+bSvZQsjVvv8XtgDuq/5vDp0penI7oqBgIh/KqwqUe4lUWT+WlgMXmtwo?=
 =?us-ascii?Q?mYZiQqJiQtfhzzuEd5JcS5B/xpxYo+kf/NSsb0rkRpUWxLbid7yaGiy+WtaJ?=
 =?us-ascii?Q?X6kz56mdBRaBe31+CekiJGGKD7kTupp2/BTzPua+5CvxRbTdXKfLSQpeXC3R?=
 =?us-ascii?Q?QD+kvuPw2wtWmx6TCexTLMTF9esL54G/2scVU6qQPA0JWygu8uRr3ffSrv11?=
 =?us-ascii?Q?xHXAhTcxd+DghmAp2hiCp5aT4W3Kaa6oAYzmFDaYRg9jRK0VvuHA36TeMZoA?=
 =?us-ascii?Q?eG9Z9+VIjJbYLoVOalUs4vHiFon8ngb2rudfQJLZ7buQuj+MnqYJRjx2fG6R?=
 =?us-ascii?Q?70/ROrre5+Bn8IgrOxhEcN9Qwz+DvbiOFqDeU4/b3VuYXE7EHUWWxcd2OJ9e?=
 =?us-ascii?Q?ApWtTuUzEgT1/cbFiQwKuXLKvD/tkzVPnQfKSVSviwDeEQXKWKLSXAPODE6w?=
 =?us-ascii?Q?KpZBF6DtiqnI3zAFdu102VFMnbsKBWUGZ90q6GuNB0kw0eJQjGG3DPEDkoN+?=
 =?us-ascii?Q?O92E/TCyP8J5k2QjLs11rz1BwxJdFgCQsY61LrA0/zuZUJmfE487APEzV7iQ?=
 =?us-ascii?Q?x9rDInUXs3nZdAEcXtuEoveC3AFTfs8ifZwYi3xnDgO9a6WkuSbUhDqNd2VS?=
 =?us-ascii?Q?vlNj5TY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OjQg9GddYad1DDym1mn0PblatLihAL6bp+SF+UcOqXFkJ51gV0Go7gmJ0rqC?=
 =?us-ascii?Q?/n6MM4XrCfylaJprbmDzhFulZFSCO5U/UZ34g6lqZUQih+WOILl+JoQunuCw?=
 =?us-ascii?Q?c9Tt9FCsRyFzNIZjcKhUqxMNGAVT+cS9q85AEMC2vz+qrYAt0A246bXBYE91?=
 =?us-ascii?Q?Sqe1Bg1Ztj3Yui5MJlHGt/UiCU1TI4V7+cnmx4I8vO2CNYYCqSiJAHq4/77Q?=
 =?us-ascii?Q?jEEEncXbMbbNylFpPnDrbh/bg0uva65MEvCTOOcaZZ8KSQbiTUn1YvLjhGHv?=
 =?us-ascii?Q?bO+JkowpCHIdp/8gk1880SmEOhQL4HPEuxXgfuW7hULL8gl8CfiuVJR0nCcK?=
 =?us-ascii?Q?QfExsJZtCe5WrcH5H/6czZzr5ARmD4cd9bjtWRTvhML6oV4wjdkILYTQWzA6?=
 =?us-ascii?Q?5o8UiK57KHI2urTe1isUWy+ywt/Az9hhoDhYMY1XcVjGQaOoRXU++0IJ9gmL?=
 =?us-ascii?Q?TO9A/UZHIkPLDToCPS7axaLY7dQgtgJQa8adj8EEBJQmki9N7MkSkUjsiZ5h?=
 =?us-ascii?Q?jV+9WVbo0pTSDTiwfxRFzE/mWaye4s41gyoIcrWfwfvsa4t4L6bTThahYA6N?=
 =?us-ascii?Q?UgXwEuci+TV8JhcPchUUHufF19iShF9tCdXtmOl8GHh4X+zn6qkgEWUI/Bau?=
 =?us-ascii?Q?QkXH2pYtfn7N9v4eDPW46OCpfhsV6QQWYSnI72kg6LKSxEhoDEv7S1keLlWl?=
 =?us-ascii?Q?Dl6Gyd8mQnR5wmk5j2O2RVK4chtJePSrzhBKJ04Nw8aRwtcffIjw1EOry9ol?=
 =?us-ascii?Q?vP4188BAnUJoeTLA/aLR17/tmTtZx0ZFbwGv8vfqjDTkw267lq5AD7bPrsqV?=
 =?us-ascii?Q?nE/B+mYfcd4D530MEw6YwZHxDTs4Jb/02h0IW8gZ7v2Dg0hCAzfu/aMrmUWh?=
 =?us-ascii?Q?46XQEOuhml+wkIVvFDplHIyjOp/ZDnVkwy4m88KesavB2Gmh9qyu6LRJ1/xl?=
 =?us-ascii?Q?DwP6c8iMMqqkQoEOCSl+lITfVXUpEtMEBMRutEeuVe+QvQQizFTVpknM8/g7?=
 =?us-ascii?Q?RqisXTfRdRcf7cemdpSiixIOt32TRu4Chh4SLKzwRkVam51z/RdRZlSZLXNo?=
 =?us-ascii?Q?JOYJoNNt8eZTvRSB6sYxfqT6PGtgAE8HevDxiM3vhwuH6I1VFgVKXIHuSWCJ?=
 =?us-ascii?Q?sZ2BEDPCthdAKZcPSoPlU8JU3Wef0MFhTaDW9rWbL8ZF6Deo083DX6RBzd2o?=
 =?us-ascii?Q?Y/DMU/Edlx+4TsZoHgPN/EUF7NCXV4q3HNkT41wQGe6W1M0KS0o4GidAb3Dy?=
 =?us-ascii?Q?PHrsafkv27Tt6pVUcBFXrGBXZFRDImZEZfCHv49iwJh7g257V5h3Wa22XEWU?=
 =?us-ascii?Q?TwKKslI8HFXok55TbepJ7hwG8My2fVP4R4aP76NrRJq2kzrgVEzdSSqelEAB?=
 =?us-ascii?Q?9RKMz9U24kFdZBrd92mp10ktQzS23dXutTHxbLzkT30NnL3KZRzI8NjFY3VY?=
 =?us-ascii?Q?21kFG6OIJ3XlphaqAlKopWtDwEfZg8vZyn0LootnzYJME9uquzBXcg7qbspI?=
 =?us-ascii?Q?PeM3yxhFXimwiuGJ+b08RBLgAgMV1+kKRy+yCDVRycpEtwrPcF6dDQqZrjEj?=
 =?us-ascii?Q?BsgTHAbtxZrPZRot4UVXI0skRp9yTel+5MPxk08JroNlJhRu/lsY4LC4fw6A?=
 =?us-ascii?Q?48HZnnbGYcVOSqwLUb8Gc4+LGwCMUMhVqU19aOxBwDGy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301cd38e-23fe-4ec8-3146-08dd0aada033
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 04:24:58.9791 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NHJh48DJVVvOZKGP3ARty8qgK2WKNFm3GgMyfNq7pcRuJJP+gfZxgw/6ZsU71M1zIeA8t+7y5lHGZV9A+uNgQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
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

> On Thu, Nov 21, 2024 at 05:56:00PM +0530, Arun R Murthy wrote:
> > CRTC properties have been added for enable/disable histogram, reading
> > the histogram data and writing the IET data.
> > "HISTOGRAM_EN" is the crtc property to enable/disable the global
> > histogram and takes a value 0/1 accordingly.
> > "Histogram" is a crtc property to read the binary histogram data.
> > "Global IET" is a crtc property to write the IET binary LUT data.
> >
> > v2: Read the histogram blob data before sending uevent (Jani)
> > v3: use drm_property_replace_blob_from_id (Vandita)
> >     Add substruct for histogram in intel_crtc_state (Jani)
> > v4:  Rebased after addressing comments on patch 1
> > v5: histogram check with old/new crtc_state (Suraj)
> > v6: Rebase
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_atomic.c   |   5 +
> >  drivers/gpu/drm/i915/display/intel_crtc.c     | 166 +++++++++++++++++-
> >  drivers/gpu/drm/i915/display/intel_crtc.h     |   5 +
> >  drivers/gpu/drm/i915/display/intel_display.c  |  16 ++
> >  .../drm/i915/display/intel_display_types.h    |  13 ++
> >  .../gpu/drm/i915/display/intel_histogram.c    |   6 +
> >  6 files changed, 210 insertions(+), 1 deletion(-)
>=20
> Please provide the documentation for these properties: binary format, etc=
. Also,
> ideally such a properties should be defined in a vendor-neutral way, so t=
hat
> other drivers also can implement support for similar functionality.
>=20
I assumed that there are no other users of this histogram. Hence had it int=
ernal to i915 driver.
Will move these properties to drm-crtc, making it useable by other users as=
 well.

Thanks and Regards,
Arun R Murthy
--------------------
