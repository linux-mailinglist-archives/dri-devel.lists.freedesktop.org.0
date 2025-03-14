Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CE6A61FD3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 23:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB93710E30D;
	Fri, 14 Mar 2025 22:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A1+bDwz8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1464710E258;
 Fri, 14 Mar 2025 22:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741989994; x=1773525994;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UtntJLg2R1gdX5p/x5pOvywa8M3o3cobfe/VmbX27sk=;
 b=A1+bDwz82FTBF2nyB+COeJUbsyIO7fhTd6CpRkAc0k4f1vbXvSX8uUwP
 xOwBGPmQk7kMgbZEQvfvBJBkEEwxpIA//E/V+qCx84Zw1jY4OvOYqiYM5
 6WNf0+2MOqVfwV5Ou71aqLlGOp7YLbDzH1FqSw/cEL/uQdNj25TwIJZT9
 HAJrQdIKRm7ntfA2RGDitRu49aXhh+EINxhKcMGyFuJEtpsXWpBhrrTJF
 nbqCf09bm4mkeNj0J0kuY7CzZWb/f+OL2hEvMWvJSTfZtJI2OSClO5tvO
 FQtPr7hNPPsoOVphhvOWhYVQdqcnWqdCNjvYyrMKLtFqg9OsSWm+dBus8 w==;
X-CSE-ConnectionGUID: jbU6/ZhkTgSGBo/sxmKwxw==
X-CSE-MsgGUID: Cklg74onRKewDo6EeVy/og==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43260260"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43260260"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 15:06:33 -0700
X-CSE-ConnectionGUID: DXNOLgHNTwGrKQRtHnlSfQ==
X-CSE-MsgGUID: gJOMekwdQ/iY/9D3c7EO0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121128619"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 15:06:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Mar 2025 15:06:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Mar 2025 15:06:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 15:06:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x5NVjjBqhTRNoSmoqWF7G/suraJ6/LZUmnxnxw8Wl1GU0LPuJmSb0JG0YW71E1QloribsxxQHnPTwWmx1Kpb72L9ogq7Wr+69wFcnOPpD4P3UQyCW7vilnoXXP867f8eTumEVCl3iMUZEh8v9hliRgueq0iI1PMiCFXOOCPtT2hAV6QuJ+0zEjYvjFSngZgwhpnj8A1+JCrEDysvvT/shIcXS4TqNEsjPX4Mg75n2xYKokFjv8uWAo1nGk/pEuQabjMd+UOJgzFxbQ3yiDqVkQm6b2MKYRN5B2oCmMm//m9YTSIU9iJEV37vqNFJD3eT8ArLLJ/VR+xqY1OGhEDUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwqIXgQFSrk35GjoQxEugXTDmHEXUhgS2yvW98IrNbM=;
 b=rEdZn+xqQE787nAohlloO79jbl5eg4e/nKBoiiWQ8WrZo7gPi8eY2b0pgvd8ofRZCP7OYSnwV2lIrFrJ7Z/cV2SdI/DiRlJ0NqVZXNsUzOw1ujZ4OUjaQ1tU/Cvm6AhkXqGMTqLss8i4WmD4gBcanfZpjf2jN00Sxb7rBvjaqleTZzwsJyeevg1Tqfrb6TujFDFKpnVPcs7cJjm40EVROWI29KKQNO6/FLW5c8vrjap3DF9elTtliS59CTRTG5lA2KRcTU6MmPmPBzOW2hwt8FZAsl9f4mEo9Y+CHm2E8oZepDYAWP6LxHKmalacj1Y/9Qm4rsHRJg5x0T+2sYEPtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ1PR11MB6179.namprd11.prod.outlook.com (2603:10b6:a03:45a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 22:06:28 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 22:06:28 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "michal.mzorek@intel.com"
 <michal.mzorek@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v8 2/6] drm/xe/xe_gt_pagefault: Move pagefault struct to
 header
Thread-Topic: [PATCH v8 2/6] drm/xe/xe_gt_pagefault: Move pagefault struct to
 header
Thread-Index: AQHblEaNnqqWHrw7jEeBa+RMIn6mt7Ny3PaAgABQeeA=
Date: Fri, 14 Mar 2025 22:06:27 +0000
Message-ID: <CH0PR11MB5444E03A221293476A9DC295E5D22@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250313183415.133863-1-jonathan.cavitt@intel.com>
 <20250313183415.133863-3-jonathan.cavitt@intel.com>
 <9d85d2bb-1f64-4d6c-9982-a2d23cbbac32@intel.com>
In-Reply-To: <9d85d2bb-1f64-4d6c-9982-a2d23cbbac32@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ1PR11MB6179:EE_
x-ms-office365-filtering-correlation-id: afbcd480-ebb9-40e9-12b9-08dd6344781c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Ykn9iCbGp2C++E5siyFj6YW7G/RscSE1jXAw9ExRtX0925zgbXvDGFM/BCnA?=
 =?us-ascii?Q?Ag0VVdeltG9Anuia3m12UPx3HnGReGGUg3ZNB3mYquy+dulaQ/ep7VOXj4Gw?=
 =?us-ascii?Q?OzmErQs+dy+iCoOeaMvE89uomihBmA2pTBtwu4gslfKbppPJLiyQBfRHRXRI?=
 =?us-ascii?Q?otYt59wyJug7m1Q2KraahgqFW3u/ZVx0RzjKgbIKo9jofGKNJlwae37ITKpl?=
 =?us-ascii?Q?o3aaUXSFyXExE2O2BOWo+jqaTsPCpAP3ve/3nj4O4Hv8XgCgxZOIKztZ7ZEP?=
 =?us-ascii?Q?CVGAfuxKYix3ZcZ7LAZ0ursPlsPOQTgxx5W70/pgh9L9MnFVQBYXTCpPgZ6Y?=
 =?us-ascii?Q?kvAc6JXoneN7fJMWB8n3xqGWQ8vGSiIzhIb0FDn2gReM/WhLtli+irjAplMQ?=
 =?us-ascii?Q?RoqupaZMg8BU8MXpVi5OeuJQV0NZx0sLVRjIvLxjVve7LXkIuJOMs4gk/jud?=
 =?us-ascii?Q?T5ZZx+7VRR/G6qTHOUi4UqZYt59A4FIUwKsOH89Fu+1d6J4atsR5+tqOTrgN?=
 =?us-ascii?Q?SPDQx575qzc7uAaLNqfRlYmSWgSaco0OGXJGjwsKY5fCoxmqWuTWkpzp1A8T?=
 =?us-ascii?Q?LcsIh38NNCuFZ682VEweLUIq/+uSCYXHqByrMTt9wbWilB5lfk4mqFVv4Y/T?=
 =?us-ascii?Q?erZY/Zze1lb1M2kJYWLXSOHNfttvUiT1wxz9LEh3qXU2gs2HjU5EFDQ0KmEN?=
 =?us-ascii?Q?9m2sCYYMiYu//LjjKlTTByOv2WLLk0HY+QZ66ml5ELPqQlGmcSDY4VtowARx?=
 =?us-ascii?Q?ddvZzn3zvm69ptTh/mewjKZdhUTNzHaE23z5t2pwUtyso9uyzFhNt0Ddnb4S?=
 =?us-ascii?Q?DkexVYOISKV/PwBNJjEouwSRQvl489ro8vHogSHf4veGl9NXYO+NLlRrGHQq?=
 =?us-ascii?Q?BZTiwmxqvTrXzovHMFcDZ/XBqjbzVyb6Zg5F8IXV3k/XuefrArL8OsfFRcvB?=
 =?us-ascii?Q?DhHUxM5ILl5Cq3qxXqe749dYEdSIyloufQKpX8SKwCGVG2B9pKsaolSN9SLJ?=
 =?us-ascii?Q?rDfOcuAjwFEUQA65EEBhv92Icc+ieW6jpbGs4fyErfXAuMNKKmsnhXFYYZfH?=
 =?us-ascii?Q?QyiVBBVj15lGI/qSAr+IT+VC6dKRg9WLbk4sYkhNznjDgpLdHVnOq9Evwhd4?=
 =?us-ascii?Q?eOFN3066MmhzcqLZ0zyd6QmqlftPVDA0VBhWNgUjXG/FHtxsPLWSNairNsxP?=
 =?us-ascii?Q?N9H5Yxj7vQgE94rRIRkWdpO82qKePl+WnqsbZt9MhV24M+CDbKz14XWI/DiQ?=
 =?us-ascii?Q?2eZPbcI+94N31FXXeQo3XdtOf07L4u6wU0wZBEUotnwmMMpCR3JBpOZ3XtZU?=
 =?us-ascii?Q?erI+a8hmvvpoN426RB3AY4VZ3Qv3q7Jvbxf2tVHAxAPtxEwwsvpii5kJxx7f?=
 =?us-ascii?Q?d1gGehjXl4s7n0e7tbuTLNzeVKQ7rnHSpNsRR4SooLMVbKm2z2kW1UVPfFuo?=
 =?us-ascii?Q?X+/4dx21k8P+CvL7hdAciqFjAcPr071i?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wkP75FKg0fEia08MGbN7zg3AqJaD1eE0WbSIwOpAOo4lQnsC0GSIASpr6iZW?=
 =?us-ascii?Q?FoEiBOESW5+Ocp4iSODuVCcVzw3qhRgg3/EJeZxI6DazlHm3KZhDvbOGsGqK?=
 =?us-ascii?Q?kW0bTWQcg/QsKR4spEWV3vvscn1Cbpvrtnyq3HWPxIwGkgM6Dsi9u8WATui/?=
 =?us-ascii?Q?JbNoBDULqcNyOPnBfHkgQyLUfkAV1lhsa7D1leHyd4i5Sfrwf8FeR+cu1hAE?=
 =?us-ascii?Q?L5CK2zenGOQoG/P1gEqOw6D2lz0vI8PAsgkfLkto7fvV02ZIIW6Qv+W3EGWY?=
 =?us-ascii?Q?28G6H6o9OzBqaq7HZ6f42vfxQ62B3hSvSzJI7GkUsEjuk5aEZrhN16PQR/hY?=
 =?us-ascii?Q?Ikqc3gjdTsstPWIIig4C9WUUmlQkqW56DFw8ZSt3UGMdv6+o1cV6pVL4rp+C?=
 =?us-ascii?Q?+bco2/mVAtoWcojs+umqZ6U7htKgrg9wsYXorXzggnqqXf9eAJpDnzwCOjqT?=
 =?us-ascii?Q?ykDVqhtKL9vHcVIe2lA78NR10mPnLhBJqgfikvoE6pcxU89y+FQYY4BW4Pec?=
 =?us-ascii?Q?a4MkroJDuzmVxRfvIizJeSBGpbIwz3ONhJbMtQQRdZx2ziZUuVbk6+33k29d?=
 =?us-ascii?Q?n+JEmtWnKlKqsAR0PBonui6FxILTmWiTFSdZY9Q1/dYCIqfO6laKACeYhbQv?=
 =?us-ascii?Q?OUFF8N2L7TtbeAJtaw7uzDBQv5hk0RS0wG43C2xzEV3FIDzg91xaoq+80LxZ?=
 =?us-ascii?Q?Uz4ynYmRcEdIdgV1pZe+dUJ6zcY8559yAcHVdhnEXqNsAmAKb60WjaBiq8Xa?=
 =?us-ascii?Q?rBar3NxDPFNpUKULEG98P/zVhApu5be/wtE2dtLhNbaJY7iL08EIvnE1TscH?=
 =?us-ascii?Q?a1qNj1NH8xRQYnDwnEeFbPWPY2oVindKrKGbb3cadnpTCsMNDLptwldLcIDO?=
 =?us-ascii?Q?RDwWmx9CbYvHFS6ksoky3e2E2Mp1E6lz8Dbil1cZaMbZgr14lQJJzeUnMg7B?=
 =?us-ascii?Q?DRaJthaL8XSkHufnuULEJKt0ZFmOlN/Lh/A5O9gkf04qAWOkKpG4ByUqgzba?=
 =?us-ascii?Q?/6UgSDsNPtPpy9ToEZvPvk92onNK3URoFAm2lA8S2C+RYbuWy77XAlHxaMp7?=
 =?us-ascii?Q?0TedjtFhWhIkpWkhPeIIGkzlv846hWxhCFiLb+ecETrn6ozm8vWsGszSk1Qz?=
 =?us-ascii?Q?WfG4JQgB4rwQGQhdg6VUrp9WUvy1owpd3RXTMUwkRram0yWlHCuJqMMt+HVu?=
 =?us-ascii?Q?6vKOKjPmgXsn0Xq0Ai+49koOSFyI2i/AT5tpr0UbE9NO46QBwqjNT+DCtJl5?=
 =?us-ascii?Q?xvaB3vgSDIDkbzl7zUMUVU4JHaAzqEayqrZmILkSXtHYuiPiNBK3LoFKw60+?=
 =?us-ascii?Q?t8edCcgSluNRpAuVxmtptgO83dN3+/IIs1WqWAm3/YyKdgMk590sqEOgynnV?=
 =?us-ascii?Q?tT7HIr6PBmkcuzNPL7T5PlfWVVB+LzuKo4td1fllK72z/KW6r5IV4iZHLnSF?=
 =?us-ascii?Q?uytdHQXFzDIT9JeVXAI0U//w5mkCUPtyPXv9cafd3JEboGYAi7mHyrh88nUT?=
 =?us-ascii?Q?Xdb2heey4FXawaKrhTq1SklAtqLrvyULe1E+6bczGCy3/F+E+ykhB2scGPYY?=
 =?us-ascii?Q?XobyYfCJ/nSWr5tf2iG/noG2RV6AH8dhxtbTFV32?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afbcd480-ebb9-40e9-12b9-08dd6344781c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2025 22:06:27.9968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jnQedd+U0IEJPLmKUCf9dviy2rUbVFvrRh0vH1ryXJXrzUEgX+eXqgNK2Ot0outW+XT9WsWFO3MRPuqIzyoHAWfQ5RQXpe6HMPiG0UCi3E8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6179
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
From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>=20
Sent: Friday, March 14, 2025 10:02 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedeskto=
p.org
Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>; joonas.lahtinen@linux.intel.com; Brost, Matthew <matthew.brost@intel.c=
om>; Zhang, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.li=
n@intel.com>; dri-devel@lists.freedesktop.org; michal.mzorek@intel.com
Subject: Re: [PATCH v8 2/6] drm/xe/xe_gt_pagefault: Move pagefault struct t=
o header
>=20
> On 13.03.2025 19:34, Jonathan Cavitt wrote:
> > Move the pagefault struct from xe_gt_pagefault.c to the
> > xe_gt_pagefault_types.h header file, along with the associated enum val=
ues.
> >=20
> > v2:
> > - Normalize names for common header (Matt Brost)
> >=20
> > v3:
> > - s/Migrate/Move (Michal W)
> > - s/xe_pagefault/xe_gt_pagefault (Michal W)
> > - Create new header file, xe_gt_pagefault_types.h (Michal W)
> > - Add kernel docs (Michal W)
> >=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> > ---
>=20
> ...
>=20
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/xe/=
xe_gt_pagefault.h
> > index 839c065a5e4c..69b700c4915a 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
> > @@ -8,6 +8,8 @@
> > =20
> >  #include <linux/types.h>
> > =20
> > +#include "xe_gt_pagefault_types.h"
>=20
> it's not needed here, move it to .c
>=20
> > +
> >  struct xe_gt;
> >  struct xe_guc;
> > =20
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault_types.h b/drivers/gpu/d=
rm/xe/xe_gt_pagefault_types.h
> > new file mode 100644
> > index 000000000000..90b7085d4b8e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> > @@ -0,0 +1,67 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright (c) 2022-2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_GT_PAGEFAULT_TYPES_H_
> > +#define _XE_GT_PAGEFAULT_TYPES_H_
> > +
>=20
> don't forget to
>=20
> #include <linux/types.h>

That explains why the kernel failed to compile on CI.  It was compiling jus=
t
fine locally, so that's why I missed this.

>=20
> > +/**
> > + * struct xe_gt_pagefault - Structure of pagefaults returned by the
> > + * pagefault handler
> > + */
> > +struct xe_gt_pagefault {
> > +	/** @page_addr: faulted address of this pagefault */
> > +	u64 page_addr;
> > +	/** @asid: ASID of this pagefault */
> > +	u32 asid;
> > +	/** @pdata: PDATA of this pagefault */
> > +	u16 pdata;
> > +	/** @vfid: VFID of this pagefault */
> > +	u8 vfid;
>=20
> btw, IIRC the VFID from the descriptor will be zero'ed
> does it make sense to keep it here?

Is the argument that every time pf->vfid is accessed, it's guaranteed to be
zero?  I can't counter that claim, but wouldn't it be safer to keep reporti=
ng
the VFID in case we ever hit a case where it's no longer zero?

Also, did we know it would always be zero when we were making the
pagefault struct originally?  If so, why did we include the vfid originally=
?

>=20
> > +	/**
> > +	 * @access_type: access type of this pagefault, as a value
> > +	 * from xe_gt_pagefault_access_type
> > +	 */
> > +	u8 access_type;
> > +	/**
> > +	 * @fault_type: fault type of this pagefault, as a value
> > +	 * from xe_gt_pagefault_fault_type
> > +	 */
> > +	u8 fault_type;
> > +	/** @fault_level: fault level of this pagefault */
> > +	u8 fault_level;
> > +	/** @engine_class: engine class this pagefault was reported on */
> > +	u8 engine_class;
> > +	/** @engine_instance: engine instance this pagefault was reported on =
*/
> > +	u8 engine_instance;
> > +	/** @fault_unsuccessful: flag for if the pagefault recovered or not *=
/
> > +	u8 fault_unsuccessful;
> > +	/** @prefetch: unused */
> > +	bool prefetch;
> > +	/** @trva_fault: is set if this is a TRTT fault */
> > +	bool trva_fault;
> > +};
> > +
> > +/**
> > + * enum xe_gt_pagefault_access_type - Access type reported to the xe_g=
t_pagefault
> > + * struct.  Saved to xe_gt_pagefault@access_type
>=20
> this seems to be copied from G2H descriptor as-is.
> so shouldn't this be part of the GuC ABI?
> or based on HW ABI if GuC is just a proxy

What information should I be including in the kernel docs for these enums?
-Jonathan Cavitt

>=20
> > + */
> > +enum xe_gt_pagefault_access_type {
> > +	XE_GT_PAGEFAULT_ACCESS_TYPE_READ =3D 0,
> > +	XE_GT_PAGEFAULT_ACCESS_TYPE_WRITE =3D 1,
> > +	XE_GT_PAGEFAULT_ACCESS_TYPE_ATOMIC =3D 2,
> > +	XE_GT_PAGEFAULT_ACCESS_TYPE_RESERVED =3D 3,
> > +};
> > +
> > +/**
> > + * enum xe_gt_pagefault_fault_type - Fault type reported to the xe_gt_=
pagefault
> > + * struct.  Saved to xe_gt_pagefault@fault_type
>=20
> ditto
>=20
> > + */
> > +enum xe_gt_pagefault_fault_type {
> > +	XE_GT_PAGEFAULT_TYPE_NOT_PRESENT =3D 0,
> > +	XE_GT_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION =3D 1,
> > +	XE_GT_PAGEFAULT_TYPE_ATOMIC_ACCESS_VIOLATION =3D 2,
> > +};
> > +
> > +#endif
>=20
>=20
