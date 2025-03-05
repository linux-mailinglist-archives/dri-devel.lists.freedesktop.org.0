Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB29EA4F6A7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 06:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D700510E6D7;
	Wed,  5 Mar 2025 05:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AUYAy/hR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B54B10E6D7;
 Wed,  5 Mar 2025 05:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741153577; x=1772689577;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=Ngw8moi8qc677gi1VwgKV33b7i38cBhaUH051KUD9nQ=;
 b=AUYAy/hR4f2JRPMzw/SD94OlFASBERlgy8SXf9Dn7Nf0cPPnyV1zXg0k
 cQx9l5kF222eoVAM+xLkLw/PsJgUUY7Dd6cw1WnO5mKRTl6fk7BL0nSji
 ku/knKzTeBwCK0rmedqB6D/jRAmyA2BH559C/Jwfr1CEgALbg3O+JWlOQ
 k3iqP4s+92QE2KRdmLZCiys4eU2y0wQDxTdpgFXCCY1vNwARczFbcbMeR
 gfnQg+bcBPUIjypyroBKUczaQMAuwuoaYPVnNlMVOKfzJbkSZhkeFvBZb
 6wKAS4LmqwhWOpWWk72bR1LPwUQPMBMOIGGE95GdsWpcmSNtoDaph8W8I A==;
X-CSE-ConnectionGUID: kScqD1qRTxuuWoddrwgn3Q==
X-CSE-MsgGUID: 8TVbINpeTJmHjWKZ2pRvCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41813487"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208,217";a="41813487"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 21:46:15 -0800
X-CSE-ConnectionGUID: xm19k8eWSpOXxn72UDESrg==
X-CSE-MsgGUID: YtMBqsGNR/u+X162jpgXhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
 d="scan'208,217";a="123605365"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 21:46:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 4 Mar 2025 21:46:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 4 Mar 2025 21:46:14 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Mar 2025 21:46:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8XADx94/poNrH0STxqYZss7GjkpV/JivvqY+XHS5AvYgtPrR92k2mJ9OMsjI1jBM4tzf+SxKdtIi4oHHSxo/bMQG59nbdpZjGKKg2SL0EjH+eIF1DOAunT0YiX6SsabpKmU6SJgteyWpg8+5BuiRdQmTDjXT+yPJB8Swk4GFNF3OrP3zXeCz1y51Hhw1LDy9B0j1WDdOSSdMXYYEbNPiXB+ZfDWUhskJVzDsGP2tTuqUgwNfGnxw5jqKOGFH6njEqvsFomx6LXymw3zO2D31bGj6FnvjxWkIo9OQTmDReMjX9cfZNDUwJJupl2feoQHUwdNGtQx0ZMNbiF7e1YMbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B86DIECLjYe+PsDt2v84NXndrvlmySYAS69/S2LEWzE=;
 b=uNR+3m7jj+UsrMCzIrwxQ1o94JsciLa0pFhYvUout1TRyY8ZBvpZuCVIEBR6GgGk0TlB+X3CMSh4n/P2m6r9qGiqB1Cn+lbTPVjW+eAz7YwnTbAINjtrgetqpbudClmNJIyHrjMkb9LYxhLp9vUFikQCNlqR876EqAofQOHZw+gEhz7kYyDyjJ0W6u6jz9+KPzk1i+cMXx+p9c15XnReEaG4kJ2QSUPSuE7uskgb1QSni8sOLIB2rTxbINDisDsvUrtaWeWumQjXXFbg1RxT4UKFsXMqfpmxYBHWs6fKt9ycp6qJtZHYHEttkM5KrkllINOMn4SSJFdD3y2KCaRmDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 by SJ1PR11MB6155.namprd11.prod.outlook.com (2603:10b6:a03:45e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Wed, 5 Mar
 2025 05:45:31 +0000
Received: from CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62]) by CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62%3]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 05:45:31 +0000
From: "Zhang, Jianxun" <jianxun.zhang@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/6] drm/xe/xe_vm: Add per VM pagefault info
Thread-Topic: [PATCH v3 3/6] drm/xe/xe_vm: Add per VM pagefault info
Thread-Index: AQHbig2aj68byJK2iUqwcOktmoeLx7NkDW6J
Date: Wed, 5 Mar 2025 05:45:30 +0000
Message-ID: <CH3PR11MB870734408B85CB51778D01C9F4CB2@CH3PR11MB8707.namprd11.prod.outlook.com>
References: <20250228182122.77475-1-jonathan.cavitt@intel.com>
 <20250228182122.77475-4-jonathan.cavitt@intel.com>
In-Reply-To: <20250228182122.77475-4-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8707:EE_|SJ1PR11MB6155:EE_
x-ms-office365-filtering-correlation-id: 9d06d57b-23cb-40a9-958c-08dd5ba8f0dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007|8096899003; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?M/Zkcw/6Frgt0HqREqRWQZZg46w5UNRdLvqLAA9Iq8yn8nTLdBqjCMmlCT?=
 =?iso-8859-1?Q?pTF3osBymv7wGlZC4DTmr+6Gd1ON5K1Xgwa5e4Y/GRORRrh657XekBgwlK?=
 =?iso-8859-1?Q?+/7RV8qZtrjDe+rX5eMCtRwxWd0jFEclAMRrxHOWWdAiM43o71JxOwz7Mt?=
 =?iso-8859-1?Q?I7TpvZ42Pmbq34XqrObFfiD696IPQKby5xF85vuqo5JxMCtNIkZ4BSGApq?=
 =?iso-8859-1?Q?PifAkpRxE4FhaqYGBWDwGKww4wPPXqEtQs+FUubgZk8L0odlXBS32F5tQo?=
 =?iso-8859-1?Q?rhoONNrSG9RvwvNGVB7nqIyVf2Qn1d2XmCSDlyBovlrbzmrsunsWRsEPKk?=
 =?iso-8859-1?Q?gCatqDj9vVfU0iyseqmJizHG+BFbPB2GR5k4e2Xmik6s5jJ8rP7/6FpXSx?=
 =?iso-8859-1?Q?bkWrjPzNqbdXCl1sA6UI5Z1tyIQLnYwu/no8s8fTYKWDYedn0jlMaKzrXn?=
 =?iso-8859-1?Q?mRJWDrnMbDaH/kfiKKptRfBQjB6LFAqUZCuLV5uNzZ/efn8y9+/f7Yerp7?=
 =?iso-8859-1?Q?xtiafLdA0hwHmpy5Twe28Wx+1UrUigx08Gsmq0N8Ummok86z+00rBD1gIJ?=
 =?iso-8859-1?Q?MjlSjaeZkOnoUCDGAM9vomRUb+KxR3j65oFj677BbDNTCyNv9K2OCOA9Cv?=
 =?iso-8859-1?Q?hFtXBr/38DVwQUZU/3IASnilkfUBSQFNKl+f0G+Bv538lBOXC93eXKMBGl?=
 =?iso-8859-1?Q?ZfZ2DWiclOcwdg180/TacmlkIrLps88Tq/saPt9VSvTcN99MnMJ/pwxvjj?=
 =?iso-8859-1?Q?70+rCEgu9AVN6VDcrssqt5GVCniQHITyABxeGUSQWMfWQ/7LT1+4oG7yNA?=
 =?iso-8859-1?Q?uNJJa0nF6jBOsVhk+PtWohEYqRtTYlWeP7nx1fCDNYlxNsRemV3cVJc470?=
 =?iso-8859-1?Q?OM2Z1mEGXKwDq3OecSmeknqj087XvWXVPmV1zFa7IRdDPuqb2lirZMiz7D?=
 =?iso-8859-1?Q?Ky1U6WC8AXs3D5ZF6+ZM7rgzWcSrXG76PPGyq+4L9FsRNsjTJkqKKOFbrB?=
 =?iso-8859-1?Q?IjHUG1EZKd7alGUPYz/8EnjraWXdKp2Kv7UowBgPYKSREBjzXhbTXPbWA5?=
 =?iso-8859-1?Q?p8Ad3W9kQ7Fi5l7dfWUgR3CtqUJz9zEIN72oLuXoYAH3/Vuv/Ak3LlQ733?=
 =?iso-8859-1?Q?kOEOJol2zE6OoYgA/wnChxbgRKiXnKZUDXehZgOUcvTvCuni9lIlnJECju?=
 =?iso-8859-1?Q?8oebczPYuKXJJJJE834c+IQP0TZrUTKH2JyN+o/mSbLbQXhPouOXyfRGty?=
 =?iso-8859-1?Q?xtyB9FF3BaN+Lg4SanNuqUzORqHEf9iMh5I4RKxejCgTfeDlfCZwFC+J/d?=
 =?iso-8859-1?Q?5LCiQvw6sjE8ua1GiKARQm18OxjrwifRebkWk+Ylogq4XbveEQBwfC/DgR?=
 =?iso-8859-1?Q?ENTr23eBOdoYs+sbhoAduGCG2gLfUDYTrE4GCKTJU03s9g55bbGkjO7FPT?=
 =?iso-8859-1?Q?9h+RzC9SEUbyiN94t8zHMx2eUw9XJKcCkxFgp1kEYNxGLcyqSZ/Iavtj1K?=
 =?iso-8859-1?Q?i5a77E5co4hK7EO7oc0uwk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8707.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MkciXqx/SDWxAJ94ntEQd2CNE2pTvQlovZWCkXivt1w9V0vIjuTG+OhN3W?=
 =?iso-8859-1?Q?JUbkCAnL9ybLO6f/VtnaVNHpMVrTDleQfK3lq//1yqxC4NP8wijVmkrDGu?=
 =?iso-8859-1?Q?X56wB37SI8xZmaRiEP00JI1c1srfqbX9s3COL+nV3Qg2NmDaXTZ10zFTqc?=
 =?iso-8859-1?Q?py3iOmWgeE7poxlcInA/NMWw0f9W5ZLVq+PjNaQXMr4TudDT0BhXrdIgU9?=
 =?iso-8859-1?Q?jCB6hF3IYue9TQAtppfqXmWC5y6W/QJztU2arU1gAqq5eWigHrIRJRwu4U?=
 =?iso-8859-1?Q?2APnHOSCEoc5MWwK2QNVK6Vq5VsK0onYGxfNg8QGUIZLTnXrDN46U6UnBI?=
 =?iso-8859-1?Q?5JEMUy0KCkHOlCUJAlnGpHRKyEdHvLMjXJa3v4jLxzjYP2afaOY17Itje9?=
 =?iso-8859-1?Q?Zfs3z3CZQ1bEHA/0yhU0JtTbgy+U64xSm1/soCWJ6U5uOJIxXiz+Cnh10d?=
 =?iso-8859-1?Q?K9zzD1hGG4sJdXgqq7+QB3xxfiaK5Y5QwifBii//1irj/fm7Gb+yDE2258?=
 =?iso-8859-1?Q?D4EUKpLPeikl2y4T4HxmijuCXEyDVsxHx34sIv54c8pg649qoNnUeyuS0t?=
 =?iso-8859-1?Q?9eUFzTQ54Yn8/B8XrqgvgNMZl/zFDg1+gvc79VYr9Y1cJ14uM+3Ns0gXD/?=
 =?iso-8859-1?Q?qQmPDGzo2AId7XPcaH/fFZDJ0PQtrnUUdbDO3Hh8AYpsMJmnGZFp99Iz54?=
 =?iso-8859-1?Q?UDKylV5Uqo7qFSRY0NojPL07q0Zwxmp5wxvBpG9lQshQb9K9LyH3JXFv7F?=
 =?iso-8859-1?Q?zNsEvJOvglpClY9VYYjrywHopOCoYGRGdUmZW6ERCTe4EKfgOQY765XWnX?=
 =?iso-8859-1?Q?flEpFushbIf3MlR3FlNe1gKFcsWemPwmXrrxlPHz4CaTZlhT+j+6xRLbbX?=
 =?iso-8859-1?Q?RgsnJZaEFhbdSUWjI1QHeYqOC5fDBlP/LhcstnzAF2tBQLww2SLcnvZ86/?=
 =?iso-8859-1?Q?8zAVPnclgPYsKICc0J5ThD1tmyr5aTqR2cWuVkYfGYsUYppqJMXz1MbCSQ?=
 =?iso-8859-1?Q?JrRZDll+mcj/wObQ6+jC5kaqJ18ZTIgYd5O7SY71eGAe92YbnR3GQMB1vw?=
 =?iso-8859-1?Q?VCQ0FowtpzR0BDLL4PsaUHamOLkJEqULrpg82OzFnb3/yWa+LUoOoat3QK?=
 =?iso-8859-1?Q?es2zxcdSPcZl32iHqLxA5b5vUoY6DpAgJDtWv+viLXB83t0dWWDYgnkty3?=
 =?iso-8859-1?Q?cSaLGMrVN7iwazye9NwUKP7WcXzLUaXWrALeX/vxIiviZ7BCKQs8sglKXs?=
 =?iso-8859-1?Q?RDl8L7RFtilZJxt89GSRQpaRSwyfkmpUdBLMPputfkJbzZA2tVJGQDcHQE?=
 =?iso-8859-1?Q?kwUqCtki1mph2bvYW97c2qWk5XN4jC4d4spddmDcRg4Zezv+w1rhONgsLS?=
 =?iso-8859-1?Q?F1JSSpRU1+q8HQJv+mCT+jRCqDB1RXzBelqVjSX5mjMan/sw5e2lAJ49pr?=
 =?iso-8859-1?Q?SZ9MtXbFB6AW88k46uEup2WOwv5N8NTJP7HAFW1kRWcotRCCjDbneyLakS?=
 =?iso-8859-1?Q?RcFWUPtMV1lKduRx3PzPmjpG95DbpA68oBic6YQONylZDCGthpd52h7Bkz?=
 =?iso-8859-1?Q?Dg0wNhV4sm2bWSI2X6OyxC4xamVv2AEolQg+M+q37aybfrLtDVUZyt6zFo?=
 =?iso-8859-1?Q?MGiC/JiCwZfnpd1lJMlsefu1ub0Y26/89d?=
Content-Type: multipart/alternative;
 boundary="_000_CH3PR11MB870734408B85CB51778D01C9F4CB2CH3PR11MB8707namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8707.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d06d57b-23cb-40a9-958c-08dd5ba8f0dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 05:45:30.9843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Rwxrfk/5DRzhRJJRAT/iTQwzMWO9eLF7poJZi5Wz8siSmAKRfPAdRLERUpL6rFiu7GXdvekPfaYyTCNGYNlEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6155
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

--_000_CH3PR11MB870734408B85CB51778D01C9F4CB2CH3PR11MB8707namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Sent: Friday, February 28, 2025 10:21 AM
To: intel-xe@lists.freedesktop.org <intel-xe@lists.freedesktop.org>
Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; joonas.lahtinen@linux.in=
tel.com <joonas.lahtinen@linux.intel.com>; Brost, Matthew <matthew.brost@in=
tel.com>; Zhang, Jianxun <jianxun.zhang@intel.com>; dri-devel@lists.freedes=
ktop.org <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 3/6] drm/xe/xe_vm: Add per VM pagefault info

Add additional information to each VM so they can report up to the last
50 seen pagefaults.  Only failed pagefaults are saved this way, as
successful pagefaults should recover and not need to be reported to
userspace.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 17 +++++++++++
 drivers/gpu/drm/xe/xe_vm.c           | 45 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h           |  6 ++++
 drivers/gpu/drm/xe/xe_vm_types.h     | 20 +++++++++++++
 4 files changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_g=
t_pagefault.c
index 07b52d3c1a60..84907fb4295e 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -335,6 +335,22 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *=
msg, u32 len)
         return full ? -ENOSPC : 0;
 }

+static void save_pagefault_to_vm(struct xe_device *xe, struct xe_pagefault=
 *pf)
+{
+       struct xe_vm *vm;
+       struct xe_pagefault *store;
+
+       vm =3D asid_to_vm(xe, pf->asid);
+       if (IS_ERR(vm))
+               return;
+
+       spin_lock(&vm->pfs.lock);
+       store =3D kzalloc(sizeof(*pf), GFP_KERNEL);
+       memcpy(store, pf, sizeof(*pf));
+       xe_vm_add_pf_entry(vm, store);
+       spin_unlock(&vm->pfs.lock);
+}
+
 #define USM_QUEUE_MAX_RUNTIME_MS        20

 static void pf_queue_work_func(struct work_struct *w)
@@ -353,6 +369,7 @@ static void pf_queue_work_func(struct work_struct *w)
                 ret =3D handle_pagefault(gt, &pf);
                 if (unlikely(ret)) {
                         print_pagefault(xe, &pf);
+                       save_pagefault_to_vm(xe, &pf);
                         pf.fault_unsuccessful =3D 1;
                         drm_dbg(&xe->drm, "Fault response: Unsuccessful %d=
\n", ret);
                 }
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 996000f2424e..6211b971bbbd 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -746,6 +746,46 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
                 list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAI=
N;
 }

+static void free_pf_entry(struct xe_vm *vm, struct xe_vm_pf_entry *e)
+{
+       list_del(&e->list);
+       kfree(e->pf);
+       kfree(e);
+       vm->pfs.len--;
+}
+
+void xe_vm_add_pf_entry(struct xe_vm *vm, struct xe_pagefault *pf)
+{
+       struct xe_vm_pf_entry *e =3D NULL;
+
+       e =3D kzalloc(sizeof(*e), GFP_KERNEL);
+       xe_assert(vm->xe, e);
+
+       spin_lock(&vm->pfs.lock);
+       list_add_tail(&e->list, &vm->pfs.list);
+       vm->pfs.len++;
+       /**
+        * Limit the number of pfs in the pf list to prevent memory overuse=
.
+        */
+       if (vm->pfs.len > MAX_PFS) {
+               struct xe_vm_pf_entry *rem =3D
+                       list_first_entry(&vm->pfs.list, struct xe_vm_pf_ent=
ry, list);
+
I think the first page fault could be more valuable than the following in a=
ctual debug work though I cannot provide a concrete case. Maybe we should j=
ust stop adding new page faults once the list is full? 50 faults perphaps i=
s enough for a developer to work out...
+               free_pf_entry(vm, rem);

+       }
+       spin_unlock(&vm->pfs.lock);
+}
+
+void xe_vm_remove_pf_entries(struct xe_vm *vm)
+{
+       struct xe_vm_pf_entry *e, *tmp;
+
+       spin_lock(&vm->pfs.lock);
+       list_for_each_entry_safe(e, tmp, &vm->pfs.list, list)
+               free_pf_entry(vm, e);
+       spin_unlock(&vm->pfs.lock);
+}
+
 static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
 {
         int i;
@@ -1448,6 +1488,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 =
flags)
         init_rwsem(&vm->userptr.notifier_lock);
         spin_lock_init(&vm->userptr.invalidated_lock);

+       INIT_LIST_HEAD(&vm->pfs.list);
+       spin_lock_init(&vm->pfs.lock);
+
         ttm_lru_bulk_move_init(&vm->lru_bulk_move);

         INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
@@ -1672,6 +1715,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
         }
         up_write(&xe->usm.lock);

+       xe_vm_remove_pf_entries(vm);
+
         for_each_tile(tile, xe, id)
                 xe_range_fence_tree_fini(&vm->rftree[id]);

diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index f66075f8a6fe..4d94ab5c8ea4 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -12,6 +12,8 @@
 #include "xe_map.h"
 #include "xe_vm_types.h"

+#define MAX_PFS 50
+
 struct drm_device;
 struct drm_printer;
 struct drm_file;
@@ -244,6 +246,10 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uv=
ma);

 int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);

+void xe_vm_add_pf_entry(struct xe_vm *vm, struct xe_pagefault *pf);
+
+void xe_vm_remove_pf_entries(struct xe_vm *vm);
+
 bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *=
end);

 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_ty=
pes.h
index 52467b9b5348..10b0952db56c 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -18,6 +18,7 @@
 #include "xe_range_fence.h"

 struct xe_bo;
+struct xe_pagefault;
 struct xe_sync_entry;
 struct xe_user_fence;
 struct xe_vm;
@@ -135,6 +136,13 @@ struct xe_userptr_vma {

 struct xe_device;

+struct xe_vm_pf_entry {
+       /** @pf: observed pagefault */
+       struct xe_pagefault *pf;
+       /** @list: link into @xe_vm.pfs.list */
+       struct list_head list;
+};
+
 struct xe_vm {
         /** @gpuvm: base GPUVM used to track VMAs */
         struct drm_gpuvm gpuvm;
@@ -274,6 +282,18 @@ struct xe_vm {
                 bool capture_once;
         } error_capture;

+       /**
+        * @pfs: List of all pagefaults associated with this VM
+        */
+       struct {
+               /** @lock: lock protecting @bans.list */
+               spinlock_t lock;
+               /** @list: list of xe_exec_queue_ban_entry entries */
+               struct list_head list;
+               /** @len: length of @bans.list */
+               unsigned int len;
+       } pfs;
+
         /**
          * @tlb_flush_seqno: Required TLB flush seqno for the next exec.
          * protected by the vm resv.
--
2.43.0


--_000_CH3PR11MB870734408B85CB51778D01C9F4CB2CH3PR11MB8707namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;Cavitt=
, Jonathan &lt;jonathan.cavitt@intel.com&gt;<br>
<b>Sent:</b>&nbsp;Friday, February 28, 2025 10:21 AM<br>
<b>To:</b>&nbsp;intel-xe@lists.freedesktop.org &lt;intel-xe@lists.freedeskt=
op.org&gt;<br>
<b>Cc:</b>&nbsp;Gupta, saurabhg &lt;saurabhg.gupta@intel.com&gt;; Zuo, Alex=
 &lt;alex.zuo@intel.com&gt;; Cavitt, Jonathan &lt;jonathan.cavitt@intel.com=
&gt;; joonas.lahtinen@linux.intel.com &lt;joonas.lahtinen@linux.intel.com&g=
t;; Brost, Matthew &lt;matthew.brost@intel.com&gt;; Zhang, Jianxun
 &lt;jianxun.zhang@intel.com&gt;; dri-devel@lists.freedesktop.org &lt;dri-d=
evel@lists.freedesktop.org&gt;<br>
<b>Subject:</b>&nbsp;[PATCH v3 3/6] drm/xe/xe_vm: Add per VM pagefault info=
</span>
<div>&nbsp;</div>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Add additional inf=
ormation to each VM so they can report up to the last<br>
50 seen pagefaults.&nbsp; Only failed pagefaults are saved this way, as<br>
successful pagefaults should recover and not need to be reported to<br>
userspace.<br>
<br>
Signed-off-by: Jonathan Cavitt &lt;jonathan.cavitt@intel.com&gt;<br>
Suggested-by: Matthew Brost &lt;matthew.brost@intel.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/xe/xe_gt_pagefault.c | 17 +++++++++++<br>
&nbsp;drivers/gpu/drm/xe/xe_vm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | 45 ++++++++++++++++++++++++++++<br>
&nbsp;drivers/gpu/drm/xe/xe_vm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; |&nbsp; 6 ++++<br>
&nbsp;drivers/gpu/drm/xe/xe_vm_types.h&nbsp;&nbsp;&nbsp;&nbsp; | 20 +++++++=
++++++<br>
&nbsp;4 files changed, 88 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_g=
t_pagefault.c<br>
index 07b52d3c1a60..84907fb4295e 100644<br>
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c<br>
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c<br>
@@ -335,6 +335,22 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *=
msg, u32 len)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return full ? -ENOSPC : 0;=
<br>
&nbsp;}<br>
&nbsp;<br>
+static void save_pagefault_to_vm(struct xe_device *xe, struct xe_pagefault=
 *pf)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_vm *vm;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_pagefault *store;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm =3D asid_to_vm(xe, pf-&gt;asid);<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (IS_ERR(vm))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock(&amp;vm-&gt;pfs.lock);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; store =3D kzalloc(sizeof(*pf), GFP_KE=
RNEL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(store, pf, sizeof(*pf));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_vm_add_pf_entry(vm, store);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;vm-&gt;pfs.lock);<br=
>
+}<br>
+<br>
&nbsp;#define USM_QUEUE_MAX_RUNTIME_MS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; 20<br>
&nbsp;<br>
&nbsp;static void pf_queue_work_func(struct work_struct *w)<br>
@@ -353,6 +369,7 @@ static void pf_queue_work_func(struct work_struct *w)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D handle_pagefault(gt, &amp;pf);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (unlikely(ret)) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; print=
_pagefault(xe, &amp;pf);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; save_pagefault_t=
o_vm(xe, &amp;pf);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pf.fa=
ult_unsuccessful =3D 1;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_d=
bg(&amp;xe-&gt;drm, &quot;Fault response: Unsuccessful %d\n&quot;, ret);<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c<br>
index 996000f2424e..6211b971bbbd 100644<br>
--- a/drivers/gpu/drm/xe/xe_vm.c<br>
+++ b/drivers/gpu/drm/xe/xe_vm.c<br>
@@ -746,6 +746,46 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; list_empty_careful(&amp;vm-&gt;userptr.invalidated)) =
? 0 : -EAGAIN;<br>
&nbsp;}<br>
&nbsp;<br>
+static void free_pf_entry(struct xe_vm *vm, struct xe_vm_pf_entry *e)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_del(&amp;e-&gt;list);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(e-&gt;pf);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(e);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm-&gt;pfs.len--;<br>
+}<br>
+<br>
+void xe_vm_add_pf_entry(struct xe_vm *vm, struct xe_pagefault *pf)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_vm_pf_entry *e =3D NULL;<br=
>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e =3D kzalloc(sizeof(*e), GFP_KERNEL)=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_assert(vm-&gt;xe, e);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock(&amp;vm-&gt;pfs.lock);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_add_tail(&amp;e-&gt;list, &amp;v=
m-&gt;pfs.list);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm-&gt;pfs.len++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /**<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Limit the number of pfs in th=
e pf list to prevent memory overuse.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vm-&gt;pfs.len &gt; MAX_PFS) {<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct xe_vm_pf_entry *rem =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_first_entry=
(&amp;vm-&gt;pfs.list, struct xe_vm_pf_entry, list);<br>
+</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt; color: rgb(0, 0, 0)=
;">I think the first page fault could be more valuable than the following i=
n actual debug work though I cannot provide a concrete case. Maybe we shoul=
d just stop adding new page faults once
 the list is full? 50 faults perphaps is enough for a developer to work out=
...</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">+&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free_pf=
_entry(vm, rem);</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;vm-&gt;pfs.lock);<br=
>
+}<br>
+<br>
+void xe_vm_remove_pf_entries(struct xe_vm *vm)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_vm_pf_entry *e, *tmp;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock(&amp;vm-&gt;pfs.lock);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_for_each_entry_safe(e, tmp, &amp=
;vm-&gt;pfs.list, list)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; free_pf_entry(vm, e);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;vm-&gt;pfs.lock);<br=
>
+}<br>
+<br>
&nbsp;static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_bi=
nds)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
@@ -1448,6 +1488,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 =
flags)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; init_rwsem(&amp;vm-&gt;use=
rptr.notifier_lock);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock_init(&amp;vm-&gt=
;userptr.invalidated_lock);<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INIT_LIST_HEAD(&amp;vm-&gt;pfs.list);=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock_init(&amp;vm-&gt;pfs.lock);=
<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_lru_bulk_move_init(&am=
p;vm-&gt;lru_bulk_move);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INIT_WORK(&amp;vm-&gt;dest=
roy_work, vm_destroy_work_func);<br>
@@ -1672,6 +1715,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; up_write(&amp;xe-&gt;usm.l=
ock);<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_vm_remove_pf_entries(vm);<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_tile(tile, xe, id=
)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; xe_range_fence_tree_fini(&amp;vm-&gt;rftree[id]);<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h<br>
index f66075f8a6fe..4d94ab5c8ea4 100644<br>
--- a/drivers/gpu/drm/xe/xe_vm.h<br>
+++ b/drivers/gpu/drm/xe/xe_vm.h<br>
@@ -12,6 +12,8 @@<br>
&nbsp;#include &quot;xe_map.h&quot;<br>
&nbsp;#include &quot;xe_vm_types.h&quot;<br>
&nbsp;<br>
+#define MAX_PFS 50<br>
+<br>
&nbsp;struct drm_device;<br>
&nbsp;struct drm_printer;<br>
&nbsp;struct drm_file;<br>
@@ -244,6 +246,10 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uv=
ma);<br>
&nbsp;<br>
&nbsp;int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);<br>
&nbsp;<br>
+void xe_vm_add_pf_entry(struct xe_vm *vm, struct xe_pagefault *pf);<br>
+<br>
+void xe_vm_remove_pf_entries(struct xe_vm *vm);<br>
+<br>
&nbsp;bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktim=
e_t *end);<br>
&nbsp;<br>
&nbsp;int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);<br>
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_ty=
pes.h<br>
index 52467b9b5348..10b0952db56c 100644<br>
--- a/drivers/gpu/drm/xe/xe_vm_types.h<br>
+++ b/drivers/gpu/drm/xe/xe_vm_types.h<br>
@@ -18,6 +18,7 @@<br>
&nbsp;#include &quot;xe_range_fence.h&quot;<br>
&nbsp;<br>
&nbsp;struct xe_bo;<br>
+struct xe_pagefault;<br>
&nbsp;struct xe_sync_entry;<br>
&nbsp;struct xe_user_fence;<br>
&nbsp;struct xe_vm;<br>
@@ -135,6 +136,13 @@ struct xe_userptr_vma {<br>
&nbsp;<br>
&nbsp;struct xe_device;<br>
&nbsp;<br>
+struct xe_vm_pf_entry {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @pf: observed pagefault */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_pagefault *pf;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @list: link into @xe_vm.pfs.list =
*/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct list_head list;<br>
+};<br>
+<br>
&nbsp;struct xe_vm {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @gpuvm: base GPUVM use=
d to track VMAs */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_gpuvm gpuvm;<br=
>
@@ -274,6 +282,18 @@ struct xe_vm {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; bool capture_once;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } error_capture;<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /**<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @pfs: List of all pagefaults =
associated with this VM<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /** @lock: lock protecting @bans.list */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; spinlock_t lock;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /** @list: list of xe_exec_queue_ban_entry entries */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct list_head list;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /** @len: length of @bans.list */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; unsigned int len;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } pfs;<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @tlb_flush_seqno: =
Required TLB flush seqno for the next exec.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * protected by the v=
m resv.<br>
--<br>
2.43.0<br>
<br>
</div>
</body>
</html>

--_000_CH3PR11MB870734408B85CB51778D01C9F4CB2CH3PR11MB8707namp_--
