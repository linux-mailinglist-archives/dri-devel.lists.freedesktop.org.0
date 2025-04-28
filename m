Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87CBA9EB77
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 11:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3612010E3D8;
	Mon, 28 Apr 2025 09:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BdhjVcGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9937C10E3D4;
 Mon, 28 Apr 2025 09:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745831217; x=1777367217;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZHFFzsSlSVQFBcMIghamw4eF7fNh5hd/mB9FX/EHDtw=;
 b=BdhjVcGjNyA1FxNxNlW98NfSYE45q4QCqNvfCc2M+9jO9IXLPPqcqds/
 cqJkBcG9x6MYanHJNG1T+uPds15CKvaJG3o2nDi9E1dmdGoSWVmZrQtKP
 ccTDfojZCbFszJrYgJQ96YcWDuK4YIj0mF2qJbiP5mnVJXCquJPguGfuj
 yAmHkyjf5yaRRpMcJqntKrjUXLfA7WPpaWlMkFU+tpeqBK9KUL9jL0uUC
 Ni1EjpDqJo+5kUo4gjsKnZ4GnKFm2jFV1RdZ4G68qzGYJDqZTbwiekDEF
 m/QeE/Qhh1jRuI7QN385M2nNoLtThJyPegr2HKWexRznau1nfbEyy4dzW g==;
X-CSE-ConnectionGUID: eFcHsm36T1irPJM7xH8PlQ==
X-CSE-MsgGUID: rUI+VhNiSx6/XZnwlD9ncQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="58058988"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="58058988"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 02:05:05 -0700
X-CSE-ConnectionGUID: ytUIDZAETPiPBkNlP1Xz6g==
X-CSE-MsgGUID: HSr8Y5DYStSidtaIv04tkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="134431769"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 02:05:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 02:05:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 02:05:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 02:05:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVbBgF6XEQP3GxD4UdxVxeJHvnOg5o/94dImjMeXzIo0/5aR3n0LWkdvj3LS7PWi+xY6q3oEc93pyp9l1rPSBDdcYWqFrSBpKDaxCpzBcCAcnS3YHqeIA74vssQ748/qQFb360bvryLaZOFokHJOAlSAZaoK9hYNBRvLbImvQdZ+aVDgC3jEJeNKGlFqgmQZ3lWHrFBsvyP8edWpJAf8bv9a5JWXQ9CI35bwscQj+CWZ0VEdpm+VKz+HWv6iu7dabPnuTZehdW0xTtJuDx1CjMiALVgkgZJrQoZVUzR8Cww1ZdKAuT7WB+FPHzgIQ/C6p78UUq5fYACw2BxyIkiyLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVdfAtccAu5Rev2k+F6kF9pO+Vd/RoZRhpdxVOitPVY=;
 b=r9btGhWjJUjk+Ml8ZNkV0P3pHogzuxH4yHMDyd//LdUS67uhJ4yJ1Rc5GALBQmXyTF2i8PyGYn7d42E8MRpQ+ytp2OfVjmcNUeWtevzkvRlA/YbGI1ubkzVYVJ+7wWSQe/AKXaTSLLoIaNcf2c2MsJSrDgYyIVVzrOX0UKTl+a62doQR1HmKyG5MmlJL6aOZG/QP3+sV262Zg4yjhi0fwhOltrrdErvYJdPHX6CYNvdrhkt4wzhJmplV3oc/TbP4wM5wFpI5TGvS18WH9qFVZDBSPlCd2kHAookWCGyRx5H1wGFXWfoZa92nxw03hKwqinwU3HBCgd8BLZQZvwy+gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 28 Apr
 2025 09:05:00 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%6]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 09:05:00 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Deak, Imre" <imre.deak@intel.com>, "Govindapillai, Vinod"
 <vinod.govindapillai@intel.com>
Subject: RE: [PATCH v7 1/2] drm/display/dp: Export fn to calculate link symbol
 cycles
Thread-Topic: [PATCH v7 1/2] drm/display/dp: Export fn to calculate link
 symbol cycles
Thread-Index: AQHbtS3D3glBc+I1O0CSgXTC3wexcrO4zLgAgAAB79A=
Date: Mon, 28 Apr 2025 09:04:59 +0000
Message-ID: <IA0PR11MB7307BFB3E6582248DE8386C3BA812@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250424-hblank-v7-0-8b002f1506cc@intel.com>
 <20250424-hblank-v7-1-8b002f1506cc@intel.com> <87ikmoy87n.fsf@intel.com>
In-Reply-To: <87ikmoy87n.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SJ0PR11MB5053:EE_
x-ms-office365-filtering-correlation-id: 138e1fe5-1775-44f5-ee7e-08dd8633c153
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Ao2xc2Q26toPc1Ctn7/OLquoEQNaRDVa2DLrgQH6AMgnjiqxEykNANh+lzC2?=
 =?us-ascii?Q?J1tLmjlBqfsZNiYqQjUA/q3z/PE6Pvu0vtwsJ7nssc4vV5GxeTF0toimywW4?=
 =?us-ascii?Q?JB28kUFnv0MsaWmvOZ1rMbkfqbcOgsVgBglNUQDSpa72aV4UyzG2l0VmhC3x?=
 =?us-ascii?Q?faEv4cbNaFeoZaqqgMlZCAdzoAzC4SWGF3R0MhouDbP2zVirxIGZF/KCibKI?=
 =?us-ascii?Q?CI07Jrt9W90viHLhLEVtDmSwAu11O0lgctcGhRLvdBeLB7wFTY/4OQE42oSL?=
 =?us-ascii?Q?Yd+ts9TK3P72WNOpU3FpAghE50SRSK28Qk+TkY/k/ony3sFUl4g9uD33sdEe?=
 =?us-ascii?Q?CcNCkIZhGht3eEF0l6PKdw5sXhlfoWolOI+bTvdbiU+dygSAgyaENHdP6Iz8?=
 =?us-ascii?Q?g9DWkPdLRWH4hCnImcYx7oPYsSuRTkJcskc8urAVT+BLdPkPtX/wsfg1zwNj?=
 =?us-ascii?Q?xt1+jMiIwnlVta3bEIh2peSb4VjYEN5Scx2rXKx0a972b567M1zOGZJXahL4?=
 =?us-ascii?Q?J3Zzoz+BUqClHDcNh8G1fWPa+nkCDDnVRCf69ukkUmI/mC2GIANoa+ApjeY6?=
 =?us-ascii?Q?hEOA+z1T4MRqx4NJDPgwb1ljwLFVqg6zb4ykWqquPR5JJ+KrwusDbULI0Edj?=
 =?us-ascii?Q?Pym6TR+cJDJ9w5BzgSbTs8dRXzJ8G5Q0aydAEBHuWH1fYgdbVQknOwfJUBRw?=
 =?us-ascii?Q?8iORYy6azTpwZ5740914Jc/0mAOyyPGQaV8LF0HWE0SjJ8nfzfID++zsObgH?=
 =?us-ascii?Q?fOM3cesn09AqhfOPQx1yaZWEVu6LH9VLooKrfP5huvKdHo0dcF3POKAMXuFs?=
 =?us-ascii?Q?ZG/un/wGWD4I2TewKesBOeRM+tIl+0QxG8Y7AEiMl/OmDub9ERBMxz0X4RX9?=
 =?us-ascii?Q?UqDB+WT0q7viKqg2bCsolhnE9vJLuUWibd4U7CFy8Xch8pj2vBMefytavTtb?=
 =?us-ascii?Q?XWogkCLb2c1zaP+kE6tvSTNQPkhDrJGm1xROiTfrJB8VRY24+5mhvpW6tkGG?=
 =?us-ascii?Q?jPvJgvyi7EEZG7s1V5xkMMTHSXT+8xvnopBhvPBL9/v7HFW5cO95i4FmTiCK?=
 =?us-ascii?Q?K98Tp6sEjr9sFpDhMX8j7hnk4J+gsDpgxhZhtbk1jBMWZROLBxtUlrdnZ/5K?=
 =?us-ascii?Q?eo45S8Za7LQFOT03RV4eypP61J+jqRN5mWCJa6lEjURpJaAXHEEHA5IHgdHU?=
 =?us-ascii?Q?n/7Jl97Dvw/ArTDgcNYENE2APPovaqM+KP4vLbzGrOl7btzBPvpTB6JaNpSD?=
 =?us-ascii?Q?2RLeVvvhSdgQDIepxJ6XKK7cXZUQgiGlCaIpxMbfyiAchTCL8InBvfH+5EnY?=
 =?us-ascii?Q?Xgf30VXYqXHciw9cCyzbaDERoZKoZJJp2fcOvbZrhkULw5rXeVE17YrqhmTp?=
 =?us-ascii?Q?ZLdGns0syIGGTmXq11ODAjzGk95JtxdviD8CkmdKoWSWWAvhr76W7g4oXthG?=
 =?us-ascii?Q?zABnWK03FMxykmyGBHIgmPR1IGreBmuA12nbXILHU+0UZsS8U+CZMRKQR0fA?=
 =?us-ascii?Q?fRlLFxY1ykVyK2w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sgfpVW9ts4vi1BPlab5acpf9xJIk76ln4e8rcdtMuGArwipTcS9jIFFo4xq2?=
 =?us-ascii?Q?POz7np+eUuyL9hVykAiThbMOvb/ydA5rn96Ua61fFfaOy/cYrQTL0q+zBhQu?=
 =?us-ascii?Q?j2mcPH+xIBFg3mcfGUpQlxgxnXKYSqXl7B25ob41BWJ18VwIgkYXlUbd7vBB?=
 =?us-ascii?Q?fHvyJU3U2LzPpPsV/WCjwp3IC/rwibkHk2StOGWkj57zNu58F1r66VBSmBTX?=
 =?us-ascii?Q?96pGxUgacUg3lCVz0EVZip/ys3eMOEYuh8LwuBaAUmidv6S85J5WjxS/Gs5T?=
 =?us-ascii?Q?FwAscHdBUrGvLw96z9n9Nuvbg7sM0OyhHNLhMGD+UYV1oWICbRS1nHFlz1qj?=
 =?us-ascii?Q?WWuP+rEAfvs+RhD7j3Q97PUigRlUwJhC/djhJNfHwGFbyDF1ADW0xsKcUMJH?=
 =?us-ascii?Q?HkQ9uVC+yA6PaD6p28ezgf7ACITZHUIniEfE9IQl/TD+C3U0VCSWbojYXJwF?=
 =?us-ascii?Q?coGVtvjMlp9EO6eHSAZX4F+Y9UTCnCqBAwcB+aLnmYk7X2V3+DGL/o+hDGel?=
 =?us-ascii?Q?vRK8JwWvdJ4qyZ+IbhiHA/SSFhsW8nI439x7bs+5s3DY0HhS0V4A48yRYWtf?=
 =?us-ascii?Q?jHK1JnLkKWT28pM4it5BTiwZWFFugzaCUkm7zDw6vPruZmmOyrIJ8W054Ty2?=
 =?us-ascii?Q?ABbKpoAbtpyIq06w2urkqPdEK1bRjhPK1UTn9c6sbJo7LzusCptVdt7kmbMC?=
 =?us-ascii?Q?G4+Yhar7mTMLyKSwyZ0kj4yRI9ZsXXM7j/IsGDKZH9Wtx/tHOBqncIIub30M?=
 =?us-ascii?Q?ilhNs+8+toybLvYOWFfgslPSkWHvgF7m95MXih9/jRBJByhHlLhxxI7W9m64?=
 =?us-ascii?Q?Ibi70gVG7T6H8mKDqXZxO3vp2WlxMZHhtTx5R+1KvqzLCBoLXw4Lq7SHx9x+?=
 =?us-ascii?Q?vB+c+63qVGFG9FsQ640sNuR0E6gqq5aav5FjNxzkTAPdVskSiDR+Yk8GnRKY?=
 =?us-ascii?Q?vn0hxfE+ZheRHaVYnUNnUjiZhDSgyvsBg+kdPMm9S/UDoibPibT5UXjK7uNi?=
 =?us-ascii?Q?3NMZ4W1ccw+FO6NFUreq2Vx3G0w8SKe7fEj/1yN9HE8APy4l3vfzLMnW2F7u?=
 =?us-ascii?Q?OuYMjaLbIqeZ+ooDPNfaxzzHWpqDS1D77HG4fgQAG1n2LLCd+sGtFOhTOyoc?=
 =?us-ascii?Q?LbG1UzcmJV9jjq6GAUbcPJV+CC47GTPVDyAF0K0M0xwKIOitw5RjM5i+zeKi?=
 =?us-ascii?Q?yMEboV822onUM+MNUffL5GGg2hlGE9q6FqVOhnxgciDBwaomK7rwFptPAeor?=
 =?us-ascii?Q?9eiJLAuEpAI51iCB8YRXFbRmMwitBj/FLEYEBXmeICR5mT5fu5gQhaoa+2Gk?=
 =?us-ascii?Q?eT/cVE7KZu5kVUie5ORYQcQAmXcXo2GDjdbKr5DmCiQLx+z105fGHc+2h4fh?=
 =?us-ascii?Q?U6c8Ds5BEqWBJBIkaxBNfcNCdtAPQUXHb1apebUxGASQlbdxhwYNzumh89r5?=
 =?us-ascii?Q?BRM8Y1sMu4m9kqDobrl/Rp5cFyDTFANF6P+Hh6cuxYIwUIO3HKXJGtGGRfaG?=
 =?us-ascii?Q?8lfJpEbfeP3KXoT7cLUNp0u8cCeaEK923LpG+6EbyOqJIrQAqJ6OZGfoFb9K?=
 =?us-ascii?Q?DizZ2uCHgYlYd4dtfmhGDjrAS4RKIUaFCTGgo9Iu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 138e1fe5-1775-44f5-ee7e-08dd8633c153
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 09:05:00.0833 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SWj4QDfdLV9JU7jOie0Yv7iiqAUAipRfMZ/VRCREhgOT6g2A7LuScyNICLUeP8C3O+LtYJ+DuL+gakdjOmcwtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
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
> Sent: Monday, April 28, 2025 2:27 PM
> To: Murthy, Arun R <arun.r.murthy@intel.com>; intel-gfx@lists.freedesktop=
.org;
> intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Deak, Imre <imre.deak@intel.com>; Govindapillai, Vinod
> <vinod.govindapillai@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: Re: [PATCH v7 1/2] drm/display/dp: Export fn to calculate link s=
ymbol
> cycles
>=20
> On Thu, 24 Apr 2025, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> > Unify the function to calculate the link symbol cycles for both dsc
> > and non-dsc case and export the function so that it can be used in the
> > respective platform display drivers for other calculations.
> >
> > v2: unify the fn for both dsc and non-dsc case (Imre)
> > v3: rename drm_dp_link_symbol_cycles to drm_dp_link_data_symbol_cycles
> >     retain slice_eoc_cycles as is (Imre)
> > v4: Expose only drm_dp_link_symbol_cycles() (Imre)
> > v6: Add slice pixels which was removed unknowingly (Vinod)
> >
> > Reviewed-by: Imre Deak <imre.deak@intel.com>
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 52 +++++++++++++++++++++----
> --------
> >  include/drm/display/drm_dp_helper.h     |  2 ++
> >  2 files changed, 36 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> > b/drivers/gpu/drm/display/drm_dp_helper.c
> > index
> >
> 57828f2b7b5a0582ca4a6f2a9be2d5909fe8ad24..56c7e3318f01079c3bde492a
> 21c7
> > 6ed37e9724ca 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -4393,8 +4393,9 @@ EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
> >  #endif
> >
> >  /* See DP Standard v2.1 2.6.4.4.1.1, 2.8.4.4, 2.8.7 */ -static int
> > drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
> > -				     int symbol_size, bool is_mst)
> > +static int drm_dp_link_data_symbol_cycles(int lane_count, int pixels,
> > +					  int bpp_x16, int symbol_size,
> > +					  bool is_mst)
> >  {
> >  	int cycles =3D DIV_ROUND_UP(pixels * bpp_x16, 16 * symbol_size *
> lane_count);
> >  	int align =3D is_mst ? 4 / lane_count : 1; @@ -4402,22 +4403,42 @@
> > static int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bp=
p_x16,
> >  	return ALIGN(cycles, align);
> >  }
> >
> > -static int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, i=
nt
> slice_count,
> > -					 int bpp_x16, int symbol_size, bool
> is_mst)
> > +/**
> > + * drm_dp_link_symbol_cycles - calculate the link symbol count
> > +with/without dsc
> > + * @lane_count: DP link lane count
> > + * @pixels: number of pixels in a scanline
> > + * @dsc_slice_count: number of slices for DSC or '0' for non-DSC
> > + * @bpp_x16: bits per pixel in .4 binary fixed format
> > + * @symbol_size: DP symbol size
> > + * @is_mst: %true for MST and %false for SST
> > + *
> > + * Calculate the link symbol cycles for both DSC (@dsc_slice_count
> > +!=3D0) and
> > + * non-DSC case (@dsc_slice_count =3D=3D 0) and return the count.
> > + */
> > +int drm_dp_link_symbol_cycles(int lane_count, int pixels, int
> dsc_slice_count,
> > +			      int bpp_x16, int symbol_size, bool is_mst)
> >  {
> > +	int slice_count =3D dsc_slice_count ? : 1;
> >  	int slice_pixels =3D DIV_ROUND_UP(pixels, slice_count);
> > -	int slice_data_cycles =3D drm_dp_link_symbol_cycles(lane_count,
> slice_pixels,
> > -							  bpp_x16,
> symbol_size, is_mst);
> > -	int slice_eoc_cycles =3D is_mst ? 4 / lane_count : 1;
> > +	int slice_data_cycles =3D drm_dp_link_data_symbol_cycles(lane_count,
> > +							       slice_pixels,
> > +							       bpp_x16,
> > +							       symbol_size,
> > +							       is_mst);
> > +	int slice_eoc_cycles =3D 0;
> > +
> > +	if (dsc_slice_count)
> > +		slice_eoc_cycles =3D is_mst ? 4 / lane_count : 1;
> >
> >  	return slice_count * (slice_data_cycles + slice_eoc_cycles);  }
> > +EXPORT_SYMBOL(drm_dp_link_symbol_cycles);
> >
> >  /**
> >   * drm_dp_bw_overhead - Calculate the BW overhead of a DP link stream
> >   * @lane_count: DP link lane count
> >   * @hactive: pixel count of the active period in one scanline of the
> > stream
> > - * @dsc_slice_count: DSC slice count if
> > @flags/DRM_DP_LINK_BW_OVERHEAD_DSC is set
> > + * @dsc_slice_count: number of slices for DSC or '0' for non-DSC
> >   * @bpp_x16: bits per pixel in .4 binary fixed point
> >   * @flags: DRM_DP_OVERHEAD_x flags
> >   *
> > @@ -4431,7 +4452,7 @@ static int drm_dp_link_dsc_symbol_cycles(int
> lane_count, int pixels, int slice_c
> >   * as well as the stream's
> >   * - @hactive timing
> >   * - @bpp_x16 color depth
> > - * - compression mode (@flags / %DRM_DP_OVERHEAD_DSC).
> > + * - compression mode (@dsc_slice_count !=3D 0)
> >   * Note that this overhead doesn't account for the 8b/10b, 128b/132b
> >   * channel coding efficiency, for that see
> >   * @drm_dp_link_bw_channel_coding_efficiency().
> > @@ -4486,15 +4507,10 @@ int drm_dp_bw_overhead(int lane_count, int
> hactive,
> >  	WARN_ON((flags & DRM_DP_BW_OVERHEAD_UHBR) &&
> >  		(flags & DRM_DP_BW_OVERHEAD_FEC));
> >
> > -	if (flags & DRM_DP_BW_OVERHEAD_DSC)
>=20
> After this series, intel_dp_mst_bw_overhead() will still pass in
> DRM_DP_BW_OVERHEAD_DSC in flags, but it's no longer used for anything.
>=20
> Is there going to be a follow-up, or what's the idea here?
>=20
>=20
Yes a follow up will be removing this flag.

Thanks and Regards,
Arun R Murthy
--------------------

> BR,
> Jani.
>=20
>=20
>=20
> > -		symbol_cycles =3D drm_dp_link_dsc_symbol_cycles(lane_count,
> hactive,
> > -							      dsc_slice_count,
> > -							      bpp_x16,
> symbol_size,
> > -							      is_mst);
> > -	else
> > -		symbol_cycles =3D drm_dp_link_symbol_cycles(lane_count,
> hactive,
> > -							  bpp_x16,
> symbol_size,
> > -							  is_mst);
> > +	symbol_cycles =3D drm_dp_link_symbol_cycles(lane_count, hactive,
> > +						  dsc_slice_count,
> > +						  bpp_x16, symbol_size,
> > +						  is_mst);
> >
> >  	return DIV_ROUND_UP_ULL(mul_u32_u32(symbol_cycles *
> symbol_size * lane_count,
> >  					    overhead * 16),
> > diff --git a/include/drm/display/drm_dp_helper.h
> > b/include/drm/display/drm_dp_helper.h
> > index
> >
> d9614e2c89397536f44bb7258e894628ae1dccc9..7b19192c70313d66dce1b7b
> a40dd
> > 59c14f80a182 100644
> > --- a/include/drm/display/drm_dp_helper.h
> > +++ b/include/drm/display/drm_dp_helper.h
> > @@ -971,5 +971,7 @@ int drm_dp_bw_channel_coding_efficiency(bool
> > is_uhbr);  int drm_dp_max_dprx_data_rate(int max_link_rate, int
> > max_lanes);
> >
> >  ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc, struct
> > dp_sdp *sdp);
> > +int drm_dp_link_symbol_cycles(int lane_count, int pixels, int
> dsc_slice_count,
> > +			      int bpp_x16, int symbol_size, bool is_mst);
> >
> >  #endif /* _DRM_DP_HELPER_H_ */
>=20
> --
> Jani Nikula, Intel
