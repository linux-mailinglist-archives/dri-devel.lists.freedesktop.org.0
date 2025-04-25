Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96283A9C107
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 10:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9528710E8B2;
	Fri, 25 Apr 2025 08:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uum9GxJj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA0D10E32A;
 Fri, 25 Apr 2025 08:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745570024; x=1777106024;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kus0IXNzHsdPLEBcSlQPv+lJ4A4wEsPnUpfgyWim6Qk=;
 b=Uum9GxJj7NbuTLAXbgvDROR5UqTMLx8A1iORbURxXoG5WaeRl4APw1ey
 NHBk2zuOqWQchIAsdqo4g3r78D4S8JGLm035Tfygc4efiI5RGfr2WGQpK
 bKxqjRNiQuiP7qb5v5s2WWHaJt4jhvQnTxU+ctraHVdd4isax7Q1F9s1J
 7IxFxu5exV7muGGY/I/52Te0bjzGF5mBpjOCGgTttu08gkkQ3BhB131wI
 BXQkyStu5wXsi1IV6gmqDjUQKTlN1FYbNy3EJCVCBFZ1+zGTEv1lGucLT
 X7yYOFajH0dsthDSLrYh8SZwByWEec6wGkZah1eFp72DkUShgzfOW3agZ w==;
X-CSE-ConnectionGUID: B7yCd47oSa6+iZGCGveDYg==
X-CSE-MsgGUID: TybLi7imQwy+wccrYRGJpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="64756824"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="64756824"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 01:33:43 -0700
X-CSE-ConnectionGUID: rtI4AzZ0TuSoqiBIYT6DfQ==
X-CSE-MsgGUID: g9VpxumsRCSmjHM5fXjWNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="138013715"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 01:33:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 25 Apr 2025 01:33:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 25 Apr 2025 01:33:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 25 Apr 2025 01:33:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvW0bknjrDT4gpiLq7lq7mjrieKux3WlOG4wdk3HkMnEHTsH/qTq4Ln2LRYp5NbynEpGUavt5auAdHnsz8LSlbRJx27jXGUQsWt6r9ZfrKoUhgebg3W5cbi2OSjF6Nu1SmWTsf/1lsllUE7wpWSHeoHU+jWFNwXr5cYAvb8+3rKwsrfmHJUogCLtHS0wANg/Wn/Eo6k2epGzjlPLeyJVpmxSURPML9QXDG0jj7GSpSkuZF3nGP+NOLcvGcPYoKDNdnwUBbYoBozneJ3Te3hngZvZkTKsz62Rc6cWhGVeKnLXKOYvHcL6xEr0cxDIYuLLQm9jXbdxyA0HNBt+dQqUKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwEhfdlbUULLyJbxux6XgGCXHkoRK7SDVhfPiVqEnos=;
 b=N1nhG/xSeqXem+cU0Cel47+5/F4lVNgWcmKdp0ZPGSU82sqMRsfcgQvlTdVWbm6jVyWSV9IHsy0G7PA0o4VXJH5h4xzASilWcOM3FUwEdizJieQ/g3IZzvdqxTkT9leXqAFEO1EhdL+nj97Qjbd2i+61yVno61QQv9KOfpMuqc4AORT9k6FJNzXQA3KI5XkL1yRCBcMEoa1bBzfexPgN1DXjDe+SN3l7iw1VrxtgtqUSYdwFqRVxMKeb/VfkisDBmw275PHVobcri7sktMqe50o3Uoko3edzvWbXlBVE0bS0mBXeSAjYU1m92ufnvNy6KQlCzTwIc6PhrSa96CyytQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5370.namprd11.prod.outlook.com (2603:10b6:408:11b::8)
 by DM4PR11MB7325.namprd11.prod.outlook.com (2603:10b6:8:107::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 08:33:37 +0000
Received: from BN9PR11MB5370.namprd11.prod.outlook.com
 ([fe80::67f5:67cf:798d:5f73]) by BN9PR11MB5370.namprd11.prod.outlook.com
 ([fe80::67f5:67cf:798d:5f73%7]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 08:33:37 +0000
From: "Chang, Junxiao" <junxiao.chang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, "tomas.winkler@intel.com"
 <tomas.winkler@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Clark
 Williams" <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, Vitaly Lubart
 <vitaly.lubart@intel.com>, "Usyskin, Alexander"
 <alexander.usyskin@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-rt-devel@lists.linux.dev"
 <linux-rt-devel@lists.linux.dev>
CC: "Zhou, Furong" <furong.zhou@intel.com>
Subject: RE: [PATCH] drm/i915/gsc: mei interrupt top half should be in irq
 disabled context
Thread-Topic: [PATCH] drm/i915/gsc: mei interrupt top half should be in irq
 disabled context
Thread-Index: AQHbtOX5/tm6pw6iJ0SmX6VaRYGvKbOz5iEAgAAgVgCAAAVmQA==
Date: Fri, 25 Apr 2025 08:33:37 +0000
Message-ID: <BN9PR11MB5370B284356960EBDE29A177EC842@BN9PR11MB5370.namprd11.prod.outlook.com>
References: <20250424065609.624457-1-junxiao.chang@intel.com>
 <20250425060455.641008-1-junxiao.chang@intel.com> <87v7qsy8k9.fsf@intel.com>
In-Reply-To: <87v7qsy8k9.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5370:EE_|DM4PR11MB7325:EE_
x-ms-office365-filtering-correlation-id: f2f6ae8b-f69f-4fd3-f985-08dd83d3dfc0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?52VtOzFJ/LtiEBgcj5vLC0UsbxvAuwbclJLlOX5t1JZ7K//IvL0fWrWjWK0+?=
 =?us-ascii?Q?R7fxjx14kdmhXu8yJjnMHHkDW3ccvOL8JE1wU+KN0/iFNADhwXTLAR++N/wd?=
 =?us-ascii?Q?hY5RH4IIHnBKXrBQOlSR4R+YqDjhIIntRi2uWQf5u8flefrOo/IE1guOop5C?=
 =?us-ascii?Q?zmh98s//uKR0eaaKQzDB9KkzoOMjrRxPkvur2oLWHf10/zCeeuTWOn6PQwvB?=
 =?us-ascii?Q?/h9P5vQgNUIrA2K2cQTJd7aFDtpc7OaCRC1WAZLN7EjtKVqpZGg15u7iZ+Wh?=
 =?us-ascii?Q?4sqCVfEPVikcBWKOjlTRQbdvHkMCcAKEipvw7a8OtnvqiJHxRMLRHE3rvvQ6?=
 =?us-ascii?Q?Q0GrIy54wrYcWx0VSj1A0jwV+37Ss73K/CcKDyeUmGMoofqTJn+1SOtd54DP?=
 =?us-ascii?Q?ONcUY3n/Je55D85VKkvbEuhkHwKWx2SpouL2W9k6Ul0qmyJ3GZg7qtvcf3rj?=
 =?us-ascii?Q?Q8i9bqqeYvw6jWzFUYqRE80oDtAgc2MVxHIIHvn+FfbVvz/kZRd+D7JrP+W6?=
 =?us-ascii?Q?W31T9jU9RI6eqppbIpRLpn5Y0EPpuQt2hEcludUL8HTqI4+r9axJIIdajmgn?=
 =?us-ascii?Q?+SSK69IHFP0Xe/tkLbGdIlgiOB3MFnBSwOU0TdUjik4GDvtZ782ZZw+SPjje?=
 =?us-ascii?Q?zHUrEgv+3sJhqUpM7xJo6rkDW5eOsubWGCeNS7P21XBwP8TXjfj7gA/be4zJ?=
 =?us-ascii?Q?hO7v5XVpZ0iNqI2pR9K29Y8+wVe0LUjizLC6upvy/r5kGzQRJm05VMLl7jP/?=
 =?us-ascii?Q?hQZ3iwbuWMdOLo1THFxRHdB3OXEMjBqYGnhg9fOHH+8glMVsPJ/6tkz3m+yo?=
 =?us-ascii?Q?y1kNazYzN3Oo+mJNMwzNFfiTty9fUgsSMj6NOmmFgW2ngHyZgmihHgwg5M9/?=
 =?us-ascii?Q?dyur5d55/5NJ2XyJyFRrX8r9kbBAcP4ud7/VKn9lFjQnLa8XRLBWTa0MlMMG?=
 =?us-ascii?Q?YI9AKcDkNNBYd22ifp2LyMSgoKfUlUXD9LMmfc0wrg/ej4pysquPE0N7LRdI?=
 =?us-ascii?Q?CuHlGLrRgrJ9ieIr9p6hsbtxkCciFGiNvCtIYW/2j9jA9oE+D0qp2x0N+n1F?=
 =?us-ascii?Q?0vr8syXOsX9qMVecsP27Up7rfDVTfwckLbcOpEgyTN7eKz9/B72/u/RUk/z3?=
 =?us-ascii?Q?GY+buvZjwVZQx4RKGfw3JKCvT65eSVGjI54yOU/F/2bJR7JB/CmFXmQboyx9?=
 =?us-ascii?Q?jgPhcuIbioYXgVjOt1Qc9co1MROD7btOU/Dt0FWca9xhHS/RkbFh9d9H11kT?=
 =?us-ascii?Q?yBiylnrA0P7q7PHwo8QBvQteytH96DsTLAD3o/KQdJH68ZIwGr87AJ4po+iu?=
 =?us-ascii?Q?tcaJ3uQ4oOCAH6RjFu71ikEgpXsLEuKbB/ubQPaKNSBOL0EeIHYyFiffuOiw?=
 =?us-ascii?Q?KX1kxY6bSQBe7sqT83brtazfnzq5MdTGQ8n0CcJOyrOXZdtMudKucZKbpKYY?=
 =?us-ascii?Q?Fpwl5d91QLnRZ7FVNW/CedalaWpSNC1FtKwNsozmENLvUCYPYZP2ACVdQqqe?=
 =?us-ascii?Q?Vcw8NOHZUGZyteA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5370.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?I70X0/F79NV2Ge883sQxu/DbnsKwocdreRmPukFhu1AO4jeRGSudxu1pHrTe?=
 =?us-ascii?Q?048WbtJBHmYTm2uQrsgL4yDynKnqReq5HSNyBRiB58RL/5AZ/3NXyY6ZwDpZ?=
 =?us-ascii?Q?aCzNBImHc8HWZAju6ZUYDjSVDghN8fmdMnCu9ue2Wtp/2gH3uUzEYUw3PKhC?=
 =?us-ascii?Q?KXravrUr+Cmr3ls62F8wZtoeG5M7j62ilctJbR+Fw90UA17jfCo+nHOmTlHG?=
 =?us-ascii?Q?yELVqnMYdHhDYdtvMj9qzCZKlNmpk2SI13sBX16x4j1LKGo6jv1koQbCvbom?=
 =?us-ascii?Q?DHFVnrLrJrS6PM9SwqeYJPe0Yv652LCwWyKPO/LGQwt0jnZrxmDIz5MBuZM4?=
 =?us-ascii?Q?1yfmXuBPUB16o/IcEq/csXnQu8llR9oY3qYQ9P0aGXbI4ObQ06ARj9HavknR?=
 =?us-ascii?Q?m7FdjQtLFJ9fdCJN0f9rIkW+bvPtQqDH4chp8lP6nsnbSsCwNEYtvJhr6jE+?=
 =?us-ascii?Q?B6VI7FX5EBPl+DGJ7/fSZEjXanQVqTak+ddDzvSTwMn5KpTRhUB0SBAES9jV?=
 =?us-ascii?Q?u4svPvE7d4MpaZ9USxmOn3tuDN96cbShiXPd8bt96FFuCCMzPbco5GUH5WLU?=
 =?us-ascii?Q?7gMN72Ps4jszGszBRQ7liFMdQMKEjcadTz1UIJSo6QpAudLYOJhNPJxMxdq+?=
 =?us-ascii?Q?h4hER0eFTiNuFrzyV6+Nn/lVKqUjm9GhTO1hN+sf5LHIrSlpAPjHNTy9Mc3U?=
 =?us-ascii?Q?105i6ZTTsMtXHU5NvphPfh0kSzcbJ05LRsG2XBCPxCV872IF3PuTwntt47XV?=
 =?us-ascii?Q?1uSOu/YD/6yYafoLzs3vwzncfucJmUM6uhldCCHnreCn+4YbTPvTqdTmYpXc?=
 =?us-ascii?Q?s8GegUqqXCxYoPGAvTJWbTChREOrDHXUcu5CjoTv0Oj965YYjqfbRyB8A9sF?=
 =?us-ascii?Q?BM9Y/BsxpK3z03d34bk2JwJOKjlQUkfNankQyJzY7goZAA+aSmBWw65/ZhAg?=
 =?us-ascii?Q?dMA+rOkzHQnEByNpU1g6ebtZqfv0JSfbMth6mdKTy4AMXM2iunoK1gM3Ia77?=
 =?us-ascii?Q?7Sj41ddhKBlMAbl9ScdK7sj/IhKjJ/bu8512jBgTqMsRsyDElSwWVBJfnS/5?=
 =?us-ascii?Q?jC1ytGFB8chOI/ttm7oVlEOhEUwCCyYH5Zr62IY/+PweqAFMy2OE319o1com?=
 =?us-ascii?Q?ZNxtJQllOtF/orMamyyoCMX8GheHY3RpST5kxRRn7N3Wutukx49z0mTIGG0S?=
 =?us-ascii?Q?J2mLqDSt51ZgvSEn/jzWNI59dEy3h7DT00lMDE6NiCvpA9eLn5sIQIexLM79?=
 =?us-ascii?Q?OgIS8y8gTypqDqZgc2rpl+f74TnryltSsKb3nSerlNS5LBHVEFE4c8Bj3Hts?=
 =?us-ascii?Q?RBW4wC1o5DyiK+NbajgfwmyTVPxPJcoCSyi9UVACsWrR4JzNs6l8UU+WIO3R?=
 =?us-ascii?Q?4r8UiUuRBZyOG4B5gXjNKD/YqwHRxBMtSKtQBVrshmqWuCtiVgHsdT3VZM6s?=
 =?us-ascii?Q?EbSf+qJp66klJG/YpVbd+c+rk4RisVNna+VghiyZ9uHcRuXRAcZ4s4RhYyEq?=
 =?us-ascii?Q?oh3xThCg7OS3P9lR04X5xi5+xEE9lAOMd1K+d1YNbpOMyKC0TnTacsrXKIOp?=
 =?us-ascii?Q?mzhLR3pbHAGjQMKbY46FlGhKGvToK7LplpK2dFC0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f6ae8b-f69f-4fd3-f985-08dd83d3dfc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2025 08:33:37.1440 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a09MgGFVyecmt5aQ+JrLecruMDGqZop6o2+7QR25JlRyjPkf+kLS8DvnFks/nvliE0t+3bZSJk0o726drNA4Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7325
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

On Fri, 25 Apr 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>On Fri, 25 Apr 2025, Junxiao Chang <junxiao.chang@intel.com> wrote:
>> MEI GSC interrupt comes from i915. It has top half and bottom half.
>>
>> -	ret =3D generic_handle_irq(gt->gsc.intf[intf_id].irq);
>> +	/* It can be called in both irq context and in thread context */
>
>What is "It" in this case?
"It" means GSC interrupt handler, which is called via below API generic_han=
dle_irq_safe. Sebastain has a comment on it as well that it doesn't deserve=
s a comment. I could delete this comment.
>
>> +	ret =3D generic_handle_irq_safe(gt->gsc.intf[intf_id].irq);
>> +
>>  	if (ret)
>>  		gt_err_ratelimited(gt, "error handling GSC irq: %d\n", ret);  }
>
>--
>Jani Nikula, Intel
