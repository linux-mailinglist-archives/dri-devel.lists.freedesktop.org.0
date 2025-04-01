Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1984A77C0B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 15:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9AF10E5A6;
	Tue,  1 Apr 2025 13:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qp9mxJjX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7705210E59D;
 Tue,  1 Apr 2025 13:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743514040; x=1775050040;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1Tye1AClQjDtoM9T/CWgN9C3AYNSzP1UbGgpxSJMeYI=;
 b=Qp9mxJjXfO1hb/YMwdvVI/g4Q9LjGz4aJ5gb7+5GezSwDvpPAYz/mD+H
 HNMvO9scguHQyMZgtg+DV7C5bmh2XbEPKMW8hFHkINXhgymHvkYzQV1DJ
 HZQuEODT4LtMA0a7Rpka5n7t31T77QwwVxWb9C3yC8blTHXbvIA4q3j6j
 H0IDkU3UL8o4t3XPhJQAs/X5ilMqnWPJsttAoqB0iz9hPHXCuDKVce8nL
 qmsHyLwdBoE/5Qdb+/l51JBO0DfANng/yNAGOJUHtpavZJ091KH/t8WYk
 NvuyMfurTRY9KXclZMU7RupiX22L7rcjsw26xAnvIy7rey7jFo28vXINj w==;
X-CSE-ConnectionGUID: y3V0BVfrS8Kxdy8ZCx8Xpg==
X-CSE-MsgGUID: Nq7nuvBYRnKW8mrog4LR+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55032646"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="55032646"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 06:27:19 -0700
X-CSE-ConnectionGUID: Rip5TRxoSDmEBxRGFjMgqQ==
X-CSE-MsgGUID: 1I/FPtAlRweq7SpLH+mUNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="131389840"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 06:27:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 1 Apr 2025 06:27:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 06:27:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 06:27:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8HgaGK6jSxb5G2u+Z/1tzq7lE2gnxpCETIpMO/MGG8TUwBcCigykUuzbz1vJFpLcm5q8zCmohP5NYNplEMASz4gCpWE9nKNM1lLxU4+OHc7wxRuKGP+LeZMD/vNZ+7ilyWbhnUCRhJiOgEd8EBv6V+xpmJ4KeLmytoBlTiC7HlyQ6u3tRBSfpuqj6i3nrj+HXJLLdR1B1Ki0yVkB0ZbzW5tFjEA9Pvg4/IUJMuQkkx3dgtH4X7sRHUCGSIggwKOfAlpZfI9fS85dwFiwiNDf3QsO0WbTLdSHEZF7sEh532mzotjbldPNlg8ll2SDG87XSEGVShARv+xERw3EK+48g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8AP8EOgQDgsod0sDTq4R5Fc2N8IpDGlbDMVscQpDSc=;
 b=XvFni9Fbg9wuFhiVlSL1IIXsQmKOLDoZ/liQHkte/87hXqytv46QBS23aAEOfRA1hIEtzjcrVYUQlXyNi585ZSQsJrRlXFA1wEWZfbKuJOcQA+kbIxx4hvsact8YpY6VUr85FfLxk6o+tzX1fLy5lsrD0j0pMRxJ8nGYhbUuI4oo4T939Yx+GO6hKsBmFH6MiIJiGmAn1uzblnfzGL0m+BRTzWjUvsDSPgrXNWhsvTlouzqYJFWS6ui2QJIjhPS+0smtnwD+CJIuuaLWOCb8mihzPk45uQFDMbKMUGM5lDPFOmpJZo6HmUYwADMNg6nyP5zisaTL0hnlfN8mp0L1eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3258.namprd11.prod.outlook.com (2603:10b6:5:e::27) by
 SJ2PR11MB7518.namprd11.prod.outlook.com (2603:10b6:a03:4c5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 13:27:15 +0000
Received: from DM6PR11MB3258.namprd11.prod.outlook.com
 ([fe80::f3b8:3e9:6f2d:6bca]) by DM6PR11MB3258.namprd11.prod.outlook.com
 ([fe80::f3b8:3e9:6f2d:6bca%5]) with mapi id 15.20.8534.052; Tue, 1 Apr 2025
 13:27:14 +0000
From: "Kumar, Naveen1" <naveen1.kumar@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, "Syrjala, Ville" <ville.syrjala@intel.com>
Subject: RE: [PATCH v11 0/5] Expose modifiers/formats supported by async flips
Thread-Topic: [PATCH v11 0/5] Expose modifiers/formats supported by async flips
Thread-Index: AQHbn/wM+MLmOAWCfU2NrO3pOLWye7ONa08AgAFhJ4A=
Date: Tue, 1 Apr 2025 13:27:14 +0000
Message-ID: <DM6PR11MB3258F2C70CF2D3F985563997A7AC2@DM6PR11MB3258.namprd11.prod.outlook.com>
References: <20250328-asyn-v11-0-a50d13bfea0d@intel.com>
 <Z-q7eIdMkkoXXM0u@intel.com>
In-Reply-To: <Z-q7eIdMkkoXXM0u@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3258:EE_|SJ2PR11MB7518:EE_
x-ms-office365-filtering-correlation-id: c04fb877-b23e-4fd8-5139-08dd7120eabc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|38070700018|13003099007; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?J89degjrqyQvG00ZI+TjaVRoXyVOH8TxymhHBQfqtCUj9CIldKwVInNDWN?=
 =?iso-8859-1?Q?g0YzZdHVi3x/BdkIicJI53elOL1wi1xbzo0JodLAvSFCumTB3R4rgBF4nk?=
 =?iso-8859-1?Q?bvjTTIEKI7vS/yJEq19FgN1MyAmAYZFvo6a2r1kdNq2Ox5AaPTJWAZTha0?=
 =?iso-8859-1?Q?HagSLRKM2CHSc5BckXeCbzNOq2LJUufZyBu+WEi22ICHGRzMjthKcuVLxw?=
 =?iso-8859-1?Q?1lyiuaREYx2kODaADzLNKdxkUBZiHIrIexQqlCLM05DX6a+s0JxyF04iX1?=
 =?iso-8859-1?Q?QhUHberFKISTq+4587GKuqEL3skLLYT+D2WqVqyOhFc1GK0ijtqhdq4wLj?=
 =?iso-8859-1?Q?OtemocmHc/P/PzjpjIEcJnLK0IK7CJRltLFofIeUq06iCazsV40BZd+j8C?=
 =?iso-8859-1?Q?RC8tup7R6XnH6xKYtz/5TkBuRlDN+EwT0AUx0yuCd2J2z1V4eUgjld+Uay?=
 =?iso-8859-1?Q?lkZfN/DKJP6o0jQo7PHJJM3SXXE2Jvz71RaacXFPsTzJgimSWBEUjTiRnX?=
 =?iso-8859-1?Q?lUaTGpJ54RaMvPIGOd0U3xczGuf5hwWEN9v21LudrwN+0S6zC+SXT/OYqP?=
 =?iso-8859-1?Q?d7JTfeOV4okkmBZNkyV9+c6eM9paDLRjUPmYOsXNLpm5IjHNg6V4bzrVWq?=
 =?iso-8859-1?Q?ToG23nDqHMLqH5mnYyxbuEUdVnSbZBf9Oi5L+5C+/SDb3dfVz4Q5VR7sNQ?=
 =?iso-8859-1?Q?tsQkaMEgEY6JT7xuxq7rq8jrlCAvY9iGJuGaUtvghwNxJ6CLSDslHWFz+S?=
 =?iso-8859-1?Q?n4lAoGyG2QtUcyBLygRpeTLyB3Pw2k/lbQbL27PO+kXV19mgebDnmpY9AA?=
 =?iso-8859-1?Q?9rWGpKlGu71FGzG2PVVg0A4wyYqkGCv+/cK7FiP4tVgqqMuw6fFy0+yJNg?=
 =?iso-8859-1?Q?DmyNlVQAX4PvFv/Vx6VXNmR2w7xwRGtulCrTRjYJmoeD/PabJ2WasoUCKc?=
 =?iso-8859-1?Q?ibSLSPj4ehQSkv+aSewuE9XE1pDtB39SkCKCcosWKpfm8uQhsnGiMO+v/D?=
 =?iso-8859-1?Q?Ep9pVXlNqKAQV3kDY9P5yPlwtfb1YpvaICq1qxHDXwCuZnuelz35JKIZ90?=
 =?iso-8859-1?Q?04YnPErIebQlDwoWAgobMf3KMFfjpcE4O1N5tguNonua3HGQJamqr+Qqnb?=
 =?iso-8859-1?Q?DPd/3z5bD8OgX8TzjETRV1C7kqHcj0UNpjpUIWOntP93OV/hmB8BSQbFJ6?=
 =?iso-8859-1?Q?r+nDSBgBNUY+gds30cVDIEgByvn+IHn5hjBeHWieoOHHnyq8oqTt4ChrqV?=
 =?iso-8859-1?Q?POb4q41ujWiV2nCl6n/f8tTFm21VROQTosgnuYEj9ClTSc2EPp2cMs8EQb?=
 =?iso-8859-1?Q?1heIW5Vv1UsXTc221M7nIlRx6PK3oGHgph0iPgmnDdL8Z66FN3Per+lAqk?=
 =?iso-8859-1?Q?zx88x5sblWNQUZobvGU8TGSUW0jLCCinzeTNdJw2XA6Ih1vqQW4Cx04SSq?=
 =?iso-8859-1?Q?MjdDw8UNG5X0Vnf3Hi7hKIgw2m5p3bFde1bIeg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3258.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(38070700018)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kKMsQOg9KwlFMY6pNCs4T+/76XCO0tR0VwdjJzbOz9sE/O8dJC6JD8T96J?=
 =?iso-8859-1?Q?QBpZAog70lv4HEbj1oqJxh+hTGUh+lM5M1v7Zc93aLrJ1U6m35IdvjWqH+?=
 =?iso-8859-1?Q?pXbyhZvJod9SxXGW+Wv/psjeFhdrSPUzLvOSVUnXdRN2mUeKRN7ChYessz?=
 =?iso-8859-1?Q?WkJdg9tS1XKkVlQafzqruOYCMC+/Xlj/btQycaUVVXE2KeJjlY3VE+PrRl?=
 =?iso-8859-1?Q?mlLTMODMYv6z8snnV49JQDXoI42vvlTbkv9oxNKg1FJyreQDIjfizmO4YN?=
 =?iso-8859-1?Q?u0ya7OmpUvPAby+clfpLJ8ZxzYaFRQRb1kgz/oKxCNIr2nAUqhdV8YSrld?=
 =?iso-8859-1?Q?SZzuA+uzyoj88K9dx2GoOoqo9xNm8a2aLzqmoHr6Jol467vOHOpDm+H3is?=
 =?iso-8859-1?Q?bDzJf/fNXpxV9Jz81zEWCTWee6C7mMa+dW7xY1zKLvA5c+EHNVyVZk1qzk?=
 =?iso-8859-1?Q?Y1iSDrhzU6/UXu6uFCRRG5bSBERbXGW6R2+b2AK2Xqv6YbCZ5uSjnE5h36?=
 =?iso-8859-1?Q?tiZ8j9olfI3Et4OTcFZzJRLJMU9Q9EtRyBQVit40vvt+q2+9H9rx4/qCgB?=
 =?iso-8859-1?Q?pYWsHfA+4+FiLS/JmAgqg9yVPhKRYD74GqXqZITm2hccQ8VSy7bQq5zjpV?=
 =?iso-8859-1?Q?ylN5FwDFHDFBvsT4Q/OuQHnGM5GiA9cCX4XzzIXnt2lK0f0ezCD2kqJaKd?=
 =?iso-8859-1?Q?HhrzsZyz6xrE5NpxofHKJg/OxDrYAfi5tPdVQiO0SFOiuDX5r4UVmGqnsY?=
 =?iso-8859-1?Q?9iXshOPr1kyCrPU+7scwDPoYzNZ0wZKUUl835VGSNdegf+FdSLqfXHNCgT?=
 =?iso-8859-1?Q?UdntMBr+j1B4gi9PXbTJGaKz6wnlqns1CoBOdjOZYSilVHtKGJD4fTJn3q?=
 =?iso-8859-1?Q?hYySPE8Q+J5x3c4ap/q3Pa7mcnZGWv5xYPbYqGuPpceHKtgysTwZJtHPNU?=
 =?iso-8859-1?Q?hbv9pGC5NFlMwHiL2CystHdO6DbZlKn7wRw+GUvpY2ciKozShCS8TQeBVP?=
 =?iso-8859-1?Q?AptxmR34RLi4IWAn2m97RAQ7OvuTX3VStJo/Ue7x2/B9zr7vBSAj+nCFvd?=
 =?iso-8859-1?Q?VXfdbxHC4fjpv4ue0L+Yol65weiFaLbgewWAGtx2z5n+4lkNvri89tA2hm?=
 =?iso-8859-1?Q?P2ZScL9c3+VxPLCk/NZjspNyAh/Wwty9NP2pJ7dFyFaaHWcfCAv3MeH1Cf?=
 =?iso-8859-1?Q?Pc/qE8pqB93VfE7sNC3sXnzKf+9v7QnPEjuT8VElX2huImadwAYT6DpGUv?=
 =?iso-8859-1?Q?8h9hIhJZPf4n6ZOp8UGQH8KZuTSgCfG43p1FR5vdHBuEXY7LhRFjGraBX6?=
 =?iso-8859-1?Q?Ys8wOdnwgeqXwKtu7w7RuHNoZjHMmqE+R1jfFpeyhevVCC0qsXfYv2MH0+?=
 =?iso-8859-1?Q?iKwXCpgPNu1UXPVd8+3m2hoDRMUWsq4+lF1I5WxD4xLzCvl1zW06v40naN?=
 =?iso-8859-1?Q?acno20rcm8IA3z8vEgbBwXm4fqLkJiUiqhFpM2DD8IztpjF1b7EzNd6OhQ?=
 =?iso-8859-1?Q?RCPQ1rYS1Tm4xPBdmrdt72459+wctzzOAJbafl9cIDH/BBOtcAuClz62sZ?=
 =?iso-8859-1?Q?muXH6sgfg5AzJzhY5+7fThGa3XXS4hAKn3aOlngY3j4H40+Sd6+GrbSD69?=
 =?iso-8859-1?Q?TC6vy1/DWKpbTBoCLTVF2SWpmUc4xzZGempBKapqhSZtVyjJzBAaMAgE5l?=
 =?iso-8859-1?Q?IA75CKeocoPp0s86OjK1xOsE9VzYweZih43rt8Wt?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3258.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c04fb877-b23e-4fd8-5139-08dd7120eabc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 13:27:14.7427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JgpP+mlbXqdk/+psEjVNT1FFE0R9X8LzLJfI0LEbvUIpsxT19L5P4hlmWUA9xn4/RZlzsY3KhYzDPzwHIOX4wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7518
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

Hi Ville,

>-----Original Message-----
>From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>Sent: Monday, March 31, 2025 9:28 PM
>To: Murthy, Arun R <arun.r.murthy@intel.com>
>Cc: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; inte=
l-
>xe@lists.freedesktop.org; Jani Nikula <jani.nikula@linux.intel.com>; Borah=
,
>Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Syrjala, Ville
><ville.syrjala@intel.com>; Kumar, Naveen1 <naveen1.kumar@intel.com>
>Subject: Re: [PATCH v11 0/5] Expose modifiers/formats supported by async
>flips
>
>On Fri, Mar 28, 2025 at 09:26:19PM +0530, Arun R Murthy wrote:
>> All of the formats/modifiers supported by the plane during synchronous
>> flips are nor supported by asynchronous flips. The formats/modifiers
>> exposed to user by IN_FORMATS exposes all formats/modifiers supported
>> by plane and this list varies for async flips. If the async flip
>> supported formats/modifiers are exposed to the user, user based on
>> this list can take decision to proceed or not and avoid flip failures
>> during async flips.
>
>The kernel stuff seems pretty much ready. But the userspace story seems mo=
re
>unclear...
>
>> Discussion around this can be located @
>> https://gitlab.freedesktop.org/mesa/mesa/-
>/merge_requests/29618#note_2
>> 487123 Mutter implementation for IN_FORMARTS_ASYNC under review @
>> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4063
>
>https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3797
>seems to be the actual async flip MR for mutter. And from a quick glance i=
t
>doesn't look actually ready yet?

We need to refer to Mutter MR-4063 [1] for the new UAPI IN_FORMATS_ASYNC im=
plementation, where it has been ACKed [2].
MR-3797 [3] is the parent MR, which focuses on adding full async flip suppo=
rt in Mutter. However, it is currently blocked due to its implementation ap=
proach, where the cursor and primary plane are always part of CRTC direct s=
canout updates-this is unrelated to the new KMD UAPI implementation. You ca=
n also refer to this discussion [4].

[1] https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4063
[2] https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4063#note_225696=
1
[3] https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3797
[4] https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3797#note_238553=
0

Regards,
Naveen Kumar
>
>> Xorg/modesetting patch
>> https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1816
>
>I think this one should be in a decent state now (been running it for a mo=
nth or
>so). Would need some actual eyes on it now.
>
>So I guess now we get to wait until at least one of those makes some real
>progress. But in the meantime we should merge the
>i915 intel_plane_can_async_flip() changes so that they don't bitrot.
>
>>
>> TODO: Upon merge of the patch related to async flip
>> https://patchwork.freedesktop.org/patch/626849/?series=3D139807&rev=3D6
>> the patch 5 in this series will have to make use of the new function
>> pointer can_async_flip().
>>
>> v3: Add new plane->funcs format_mod_supported_async (Ville)
>>
>> Arun R Murthy (3):
>>   drm/plane: Add new plane property IN_FORMATS_ASYNC
>>   drm/plane: Expose function to create format/modifier blob
>>   drm/i915/display: Populate list of async supported formats/modifiers
>>
>>  drivers/gpu/drm/drm_mode_config.c             |  7 +++
>>  drivers/gpu/drm/drm_plane.c                   | 50 ++++++++++++------
>>  .../drm/i915/display/skl_universal_plane.c    | 51 +++++++++++++++++++
>>  include/drm/drm_mode_config.h                 |  6 +++
>>  include/drm/drm_plane.h                       |  4 ++
>>  5 files changed, 103 insertions(+), 15 deletions(-)
>>
>> --
>> 2.25.1
>>
>> ---
>> Arun R Murthy (5):
>>       drm/plane: Add new plane property IN_FORMATS_ASYNC
>>       drm/plane: Expose function to create format/modifier blob
>>       drm/plane: Function to check async supported modifier/format
>>       drm/i915/display: Populate list of async supported formats/modifie=
rs
>>       drm/i915/display: Add function for format_mod_supported_async
>>
>>  drivers/gpu/drm/drm_mode_config.c                  |   7 ++
>>  drivers/gpu/drm/drm_plane.c                        |  72 +++++++++----
>>  drivers/gpu/drm/i915/display/skl_universal_plane.c | 113
>++++++++++++++++++---
>>  include/drm/drm_mode_config.h                      |   6 ++
>>  include/drm/drm_plane.h                            |  24 +++++
>>  5 files changed, 188 insertions(+), 34 deletions(-)
>> ---
>> base-commit: 08bd590935a5258ffd79355c59adffd72fb2c642
>> change-id: 20250102-asyn-bf76730501cc
>>
>> Best regards,
>> --
>> Arun R Murthy <arun.r.murthy@intel.com>
>>
>> ---
>> Changes in v11:
>> - EDITME: describe what is new in this series revision.
>> - EDITME: use bulletpoints and terse descriptions.
>> - Link to v10:
>> https://lore.kernel.org/r/20250328-asyn-v10-0-8b8ad12cfc97@intel.com
>>
>> Changes in v9:
>> - EDITME: describe what is new in this series revision.
>> - EDITME: use bulletpoints and terse descriptions.
>> - Link to v8:
>> https://lore.kernel.org/r/20250312-asyn-v8-0-0c4cbe5a066d@intel.com
>>
>> Changes in v6:
>> - EDITME: describe what is new in this series revision.
>> - EDITME: use bulletpoints and terse descriptions.
>> - Link to v5:
>> https://lore.kernel.org/r/20250218-asyn-v5-0-7ac5ac4abd4a@intel.com
>>
>> ---
>> Arun R Murthy (3):
>>       drm/plane: Add new plane property IN_FORMATS_ASYNC
>>       drm/plane: modify create_in_formats to accommodate async
>>       drm/i915/display: Add i915 hook for format_mod_supported_async
>>
>>  drivers/gpu/drm/drm_mode_config.c                  |  7 +++
>>  drivers/gpu/drm/drm_plane.c                        | 53 +++++++++++++++=
-----
>>  drivers/gpu/drm/i915/display/skl_universal_plane.c | 56
>++++++++++++++++------
>>  include/drm/drm_mode_config.h                      |  6 +++
>>  include/drm/drm_plane.h                            | 17 +++++++
>>  5 files changed, 112 insertions(+), 27 deletions(-)
>> ---
>> base-commit: bc7a84cbc968ce97e581e9e3c2d26fb0ac106482
>> change-id: 20250102-asyn-bf76730501cc
>>
>> Best regards,
>> --
>> Arun R Murthy <arun.r.murthy@intel.com>
>>
>> ---
>> Arun R Murthy (3):
>>       drm/plane: Add new plane property IN_FORMATS_ASYNC
>>       drm/plane: modify create_in_formats to accommodate async
>>       drm/i915/display: Add i915 hook for format_mod_supported_async
>>
>>  drivers/gpu/drm/drm_mode_config.c                  |  7 ++++
>>  drivers/gpu/drm/drm_plane.c                        | 49 +++++++++++++++=
+------
>>  drivers/gpu/drm/i915/display/i9xx_plane.c          |  6 ++-
>>  drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 30 ++++++++++++-
>> drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  6 ++-
>>  drivers/gpu/drm/i915/display/intel_display.c       | 11 +----
>>  drivers/gpu/drm/i915/display/skl_universal_plane.c |  5 ++-
>>  include/drm/drm_mode_config.h                      |  6 +++
>>  include/drm/drm_plane.h                            | 17 ++++++++
>>  9 files changed, 111 insertions(+), 26 deletions(-)
>> ---
>> base-commit: be5a404c3344b7d794766f045b8f94aa93c42069
>> change-id: 20250102-asyn-bf76730501cc
>>
>> Best regards,
>> --
>> Arun R Murthy <arun.r.murthy@intel.com>
>>
>> ---
>> Arun R Murthy (3):
>>       drm/plane: Add new plane property IN_FORMATS_ASYNC
>>       drm/plane: modify create_in_formats to accommodate async
>>       drm/i915/display: Add i915 hook for format_mod_supported_async
>>
>>  drivers/gpu/drm/drm_mode_config.c                  |  7 +++
>>  drivers/gpu/drm/drm_plane.c                        | 52 +++++++++++++++=
+------
>>  drivers/gpu/drm/i915/display/i9xx_plane.c          |  6 ++-
>>  drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 32 ++++++++++++-
>> drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  6 ++-
>>  drivers/gpu/drm/i915/display/intel_display.c       | 14 ++----
>>  drivers/gpu/drm/i915/display/skl_universal_plane.c |  5 ++-
>>  include/drm/drm_mode_config.h                      |  6 +++
>>  include/drm/drm_plane.h                            | 17 +++++++
>>  9 files changed, 117 insertions(+), 28 deletions(-)
>> ---
>> base-commit: aba848f9b752cf51474c0c3b1abcf0f572f774dc
>> change-id: 20250102-asyn-bf76730501cc
>>
>> Best regards,
>> --
>> Arun R Murthy <arun.r.murthy@intel.com>
>>
>> ---
>> Arun R Murthy (5):
>>       drm/plane: Add new plane property IN_FORMATS_ASYNC
>>       drm/plane: modify create_in_formats to acommodate async
>>       drm/i915/display: Acomodate format check in can_async_flip()
>>       drm/i915/display: Add i915 hook for format_mod_supported_async
>>       drm/i915/display: Indexed 8bit format does not support async
>> flip
>>
>>  drivers/gpu/drm/drm_mode_config.c                  |  7 +++
>>  drivers/gpu/drm/drm_plane.c                        | 52 +++++++++++++++=
+------
>>  drivers/gpu/drm/i915/display/i9xx_plane.c          |  6 ++-
>>  drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 22 ++++++++-
>> drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  6 ++-
>>  drivers/gpu/drm/i915/display/intel_display.c       | 14 ++----
>>  drivers/gpu/drm/i915/display/skl_universal_plane.c |  5 ++-
>>  include/drm/drm_mode_config.h                      |  6 +++
>>  include/drm/drm_plane.h                            | 17 +++++++
>>  9 files changed, 107 insertions(+), 28 deletions(-)
>> ---
>> base-commit: c1893793c7d3868fe083bdab33999178337b5561
>> change-id: 20250102-asyn-bf76730501cc
>>
>> Best regards,
>> --
>> Arun R Murthy <arun.r.murthy@intel.com>
>>
>> ---
>> Arun R Murthy (5):
>>       drm/plane: Add new plane property IN_FORMATS_ASYNC
>>       drm/plane: modify create_in_formats to acommodate async
>>       drm/i915/display: Acomodate format check in
>intel_plane_can_async_flip()
>>       drm/i915/display: Add i915 hook for format_mod_supported_async
>>       drm/i915/display: Indexed 8bit format does not support async
>> flip
>>
>>  drivers/gpu/drm/drm_mode_config.c                  |  7 +++
>>  drivers/gpu/drm/drm_plane.c                        | 52 +++++++++++++++=
+------
>>  drivers/gpu/drm/i915/display/i9xx_plane.c          |  6 ++-
>>  drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 18 +++++++-
>> drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  6 ++-
>>  drivers/gpu/drm/i915/display/intel_display.c       | 14 ++----
>>  drivers/gpu/drm/i915/display/skl_universal_plane.c |  5 ++-
>>  include/drm/drm_mode_config.h                      |  6 +++
>>  include/drm/drm_plane.h                            | 17 +++++++
>>  9 files changed, 103 insertions(+), 28 deletions(-)
>> ---
>> base-commit: 8a0f86f7106709c73acb1477af9ad5f267d7a340
>> change-id: 20250102-asyn-bf76730501cc
>>
>> Best regards,
>> --
>> Arun R Murthy <arun.r.murthy@intel.com>
>
>--
>Ville Syrj=E4l=E4
>Intel
