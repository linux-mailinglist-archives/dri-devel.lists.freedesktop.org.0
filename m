Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76737AEF0F2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 10:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878D489622;
	Tue,  1 Jul 2025 08:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/yYoLEP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF2A10E527;
 Tue,  1 Jul 2025 08:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751358206; x=1782894206;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OL6wDA7Aag8DJR/vjkgEdHiu2oiIP1KwQ0RORib/x3c=;
 b=L/yYoLEPVVUkZBVuOPey3PvX7U7OWw4LDs+tfrQohbgEr7ehiDb8bc8X
 3BzhaOaAg4eFKdjp0Ad/524RrUf63Y6nN1Me92QU9LQzKYAyo+qYfZ8v0
 oy0jIno8HKA6DzF62hK7NpSycI1IahSF2l5uzuI/LcLEPx7K43avvVvqn
 MAKqmBaZ7j7ejlKMaHVcQEBZelNoAka6k8Vu+sVlwAuM5CMwT7q5mwq6n
 /iojIFxDKX4XKaLDhWxTEZnbiwR4VWjjJeo4Y1yzGb3uzflxcqQY1g+ZU
 27RbBNoMsq0V6IxQY0+bvJ6xRnCjrb15epazvPw/zi+cO5mx0ZGdqCIaC g==;
X-CSE-ConnectionGUID: 9ggsI+L5RquE7g6/oHs83g==
X-CSE-MsgGUID: QJZqU83fSkeu0aPuSJNPtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64210612"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="64210612"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 01:23:25 -0700
X-CSE-ConnectionGUID: eQMzDlnvRY2W0YNvcK26qw==
X-CSE-MsgGUID: SHXN6YTiRlG+5i/oSNavAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="154241873"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 01:23:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 01:23:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 01:23:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.57)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 01:23:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jo8ajFR9zwYLTjUk2ftsVNLa+P1I24ognJ9PuEi5ATy0TT3LzTuk1CMI97ADgU8UZ0KFr9FCifWI0/8j/lZhmtq/9Sz/fLvW+aq/hrFtgtyOmJHB3GASl4oHW4K55+o4S/CPifLCe//mOWyLvPMyOOBUdBS6liyOBR4vl1E4Gtxnw4rSvuFzJ3Ixch1dIz5Colilo3LwiW3nogtcVtVHlJPpJkL5D35gZY5Wm93yBWeofKobMERBL96h+ZhiFijrAVyvqaj3OtPmJUUZB4TqbSfRauMdwYqGjVFuGh1/te1m7i2xvGYiDypqoDwaFdwdIs2JZV+0+WIQLbrShgQ7gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aE/4Rp1adj6+ZFlMOeBs8u9ECDtBKDQMrDbGf2Gp6YM=;
 b=jVnv6BPRs4kxs4epqsyB34SXx6d5wsHOeVzjVeVEjE9pqe7RfOimqvsF8r9+SaQCvM75BNx9D0L3z3xcAe+6l3WTO8NJypEPy1XmdRbjK6zjy/lPWpUfnf1A0NmhYC2YRTNvw4a/w9ZfuHV5udD9nYIOJvF8Y9+LEKP3MQZ+F6htpiVxpMcaiGFlnFzYi/LeIDRLRxLlt68ltIiqK62q1OvzntIQl4UpaQai54a0d2ofrOLbYTuKMObAl3u0w5C3OwhXZC9FY8gCQNfp9GEe9aL/LPY5Gd6o5zgFsjushKc+117Ky9L6HRS4wnZYfEEz/zoVj+LdsvLrv8pWjIUZaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW3PR11MB4714.namprd11.prod.outlook.com (2603:10b6:303:5d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 08:22:41 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8880.015; Tue, 1 Jul 2025
 08:22:40 +0000
From: "Nilawar, Badal" <badal.nilawar@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>, "Usyskin, Alexander"
 <alexander.usyskin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH v4 02/10] mei: late_bind: add late binding component driver
Thread-Topic: [PATCH v4 02/10] mei: late_bind: add late binding component
 driver
Thread-Index: AQHb5fIzjGOmFaNqmUKldMZCV0XY9rQYgfaAgARwjgCAAALLAIAAAFeg
Date: Tue, 1 Jul 2025 08:22:40 +0000
Message-ID: <BN9PR11MB55308686A2B95B0234C8B889E541A@BN9PR11MB5530.namprd11.prod.outlook.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-3-badal.nilawar@intel.com>
 <2025062808-grant-award-ee22@gregkh>
 <a0e54703-721e-4e87-9962-7007771f947b@intel.com>
 <2025070131-snaking-trolling-87dc@gregkh>
In-Reply-To: <2025070131-snaking-trolling-87dc@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: alexander.usyskin@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5530:EE_|MW3PR11MB4714:EE_
x-ms-office365-filtering-correlation-id: 83cf89b4-0473-409c-c0bc-08ddb878723c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?c6uf8j32kMMRkakjHwFrh54GUNi862NbczxdIv44b0ybVBKBlhshi+vBvF?=
 =?iso-8859-1?Q?S/wdjN1XN473RS/bM3kh4R6BcwMlTa/cgLpBxVgxDyqLbGFSZgylgqAmZA?=
 =?iso-8859-1?Q?lhT7eRe/Aq0tY+s6pDSY++J2cxXYd/kdjn4ByVPSY9XGjvMmHnOx5hHp2o?=
 =?iso-8859-1?Q?pt2n4xVcPPWHIYmZkuOw1EL8IKjcuJQg2NNK+4pi8jv7k7MFAky0TbcxDH?=
 =?iso-8859-1?Q?JpYdi4CdWh018q7u34siBg/PwrgU6CXOHhhMR7Zwgh02C5+p10GOBIe60E?=
 =?iso-8859-1?Q?pKY1INj2MlXlbq3+sWZ2wgDrlTZfM9txX86UgKxWIa0RN8oWU43AFfTNDQ?=
 =?iso-8859-1?Q?omRsDpLT602b3rV1B3B8azL3JBizehfIzan/VrOaXdUyMBk64thWnkyzvp?=
 =?iso-8859-1?Q?mo55Eyviw+ZG59XoRdGgzQPpnn+64U9yfKpBeDGbIVYBoqWE+0UHKTpNiE?=
 =?iso-8859-1?Q?aht7yrOWPRmINDg7mopAq/TRiTlC+H972/E2yCTGGHy3J5lnyzHNjn52BR?=
 =?iso-8859-1?Q?aggW95Fk5EhkLm65MCn81OXArb6JzRZonP5/fRqFyol/rLJoHZj/+p9yc1?=
 =?iso-8859-1?Q?65NbacM0I9yb3KtM8v+Ytn80Eao6e+JP+OJavFBR2ineM4lCAayGth9ND2?=
 =?iso-8859-1?Q?/IWnYObE2IXJ268wTBE7eLVWl1IEtHsQ3x2tKp4pm90sRj9/ByJlb6/eSi?=
 =?iso-8859-1?Q?hgPY52/4Mknh10LZT5PCirE1NcTfpPnfQaJXzvykuydvjXd+byFM+EaI9M?=
 =?iso-8859-1?Q?vTQs0+/35a5gkw6BbwUMpbeBPgSaxz9m/fK9QML4A+SF5nEeJnoI2WDX/V?=
 =?iso-8859-1?Q?ZnCc7gKeCyxgge1wHGpM9Uu+dnewB/WS2QKn0VsmgiNBWi8gXFt65gS8Xo?=
 =?iso-8859-1?Q?nODwUGsEZSArBEiKpIR9Ju90yy2BSGpVdL9B+8MMxC76ue6mLCkHfejoJo?=
 =?iso-8859-1?Q?a1EMPCd1819MSvVwPmFm6ZOaW1GcscSmi91zuF7xlTG1nljsF865WPsG5l?=
 =?iso-8859-1?Q?JN0eesxxxkQguIxw+I50IzxjjwMAZ9jLDLbLajU42nNg7zmjIhuR1chbN5?=
 =?iso-8859-1?Q?qW//99nCgr3ASrdgZVzlKlgKi2OokfxgsXbw3LM8UzFumTZd13BuVrcbtf?=
 =?iso-8859-1?Q?DXOn90/GcymcpTo4vHC49qI727epHHYuRNGGfqK7G1vbBWNvpU0IlVI/UZ?=
 =?iso-8859-1?Q?ikh8aX3xroC5jMhVl5rKMQJSgPikYzKpzqjFTzcG+a/K9BrRu8IFxRrIgh?=
 =?iso-8859-1?Q?Bi6TSK0PS7JGyCL1Ac6F5k9AnMYSidAi0rTMGmO/W85MLpeUOgBSKaBQP4?=
 =?iso-8859-1?Q?sNQPvvDI+rGJZJf+MZpa/irE/I38105kzpbF3buLc8ZmkfaPkUv/BcXOhs?=
 =?iso-8859-1?Q?C4dJqoQ9HgrT2gV1ZFMMzJf/ysEVuB4ryC9QSmT8QdW/bGUbRL9xoBXjZP?=
 =?iso-8859-1?Q?cav+WGss+HYRzxEWpl4unBFt6E4+0XC/Av4AT9jHEye0nuSCPOHbB+2Gw2?=
 =?iso-8859-1?Q?pbptEiRVU2HjjSiIatQv20/Ub8hux1qZwpoEGkfOKRw1zpWql3LlcK+2Y+?=
 =?iso-8859-1?Q?rf4zluw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tz3aaIyHG3XUK+8mdOPxAoIavaaArKICJbWRKChXNocV2WUATGrsBy+e2g?=
 =?iso-8859-1?Q?yrnoMJ07lWX8HQSBsUxavLEH6yUwQvtyDAxj6UzjocgYDEC4iTUdYkforO?=
 =?iso-8859-1?Q?38NdW1Cg6mzeSOcc9wmDpex6hIfFXCZWdMBo0AC5pBpixaDQu1Pk6kr7uw?=
 =?iso-8859-1?Q?CjKVTePmGPLYSqPgp1o0l2gvmi3gJiku+spIwWJJACJaAPx+gYK94DWMRW?=
 =?iso-8859-1?Q?Qg5Xx1KtaxfuOethJwdPqkcp6YrvewwwvSfAuI1zf5ocFmOxEBvGj6l/Zd?=
 =?iso-8859-1?Q?vH/IKOUlf0TSOOBQFOyeu0zd/obi21+0hqDC5IMeXvAgx5oTtS6QZj49Wf?=
 =?iso-8859-1?Q?lPqwArXEAtvVRR1H0/jXXdpwXyFLFN8Iz+wtRAEFQOtfQKVMg29wm8F1NF?=
 =?iso-8859-1?Q?qxCkWyoB4d0M3xK6/juJ6Zm3k1jw1tjTSjBB5y4I15P4CMg+M9RG2DsF4t?=
 =?iso-8859-1?Q?Qj7gyJem0M10NqBoT1z6SDUSXUP08d2VI0ZhzDScS4P2uWiV3Bo0nz/A1l?=
 =?iso-8859-1?Q?5j3WbX+9mHKdSJv3dwRf+PKp4kO9vRSj8quP6sUzbuB1q9yYd1l4znFh7E?=
 =?iso-8859-1?Q?0dIa84Ou0HhQDw3WmLIgStx4kZ+8Yg4YzhkzsGVQVXcDxt2OGSx/mh+DSm?=
 =?iso-8859-1?Q?Z8gIcZdI6EIi/YPFVZqtWrEDTH0Ik7QH48VK9vUnyDGgujX3wSMKOLQ2lP?=
 =?iso-8859-1?Q?W6h4efImaSTKOvAUhzJdzZkpcYjZNQJm4zztBsqh9YB5QsQZL5C+iXD+kW?=
 =?iso-8859-1?Q?npfgLmIb66sPhuZfvd+Fb8RZyDiGIMbcuUaOtABzcd/tpnlF0+/Mt1zjRs?=
 =?iso-8859-1?Q?tYlY+HzhgtApml/KBwgvZRikQveefcx3Fc3oInT2L+2ggJM7xcprG/GwaL?=
 =?iso-8859-1?Q?9EARFcP4v5KQyvjhuP3LR/+W9X7u5lQFpzoi8EeXE+lE7DQC1vEXNIZ7h+?=
 =?iso-8859-1?Q?SuOd9+j9J+qjP64azbi1ki2+Xue/OvjOQdbKwoLDrzKU5XGma2yQhnoID+?=
 =?iso-8859-1?Q?kCF/P2wEzKWAhk9Iol4+/a2+giiOs16osrIwz9hZHS3HIv0KU1gm6PqAgM?=
 =?iso-8859-1?Q?0ATxiQLr65DLONcyuyhHN9k0sc8fiW4U0fkKcSxLKDZ9jdIsxysZlgryHt?=
 =?iso-8859-1?Q?YvomphtEPb70yZaAoWYCipELB6lKupO50SWJ7jcOyXIrDtljPnkSoi32tU?=
 =?iso-8859-1?Q?gm6hwCdB3HDfwBq2pJbM7ltlvU61Uex0uMcGKdwSUGiXM/wOCiTVpMpKnt?=
 =?iso-8859-1?Q?pmTEY0yGet0tl7vR9N/sWMJNNw3HjrbphaTf7AWNtPgfZzrMECdxepBhZ7?=
 =?iso-8859-1?Q?Bge+DBiHDAVvSmsvzU79YYjrG4mHmSEIppWxbpqb9+QdKQ+k5OkQr5ZQyj?=
 =?iso-8859-1?Q?CCRmmU45YyjDUb7bfi1FHEzjoGjm87RMZ6qVsnZ8mm2q0dUzHonP1u/UHW?=
 =?iso-8859-1?Q?W5++fx4Sj5Wta2UJMsJEMuCsNwnb8W4CFMVLR/+UHMG522EiCpYAV2GmgC?=
 =?iso-8859-1?Q?8NjKnKzVCKm45t47T26frYkQGwPI2ri5In48I4yLml9vurGeRBi+hYQlNF?=
 =?iso-8859-1?Q?c22kBVHFuMLbfdfduEssBckKCnkPNfFDmWrQQkiVlq3yEeYQiVQ/QeYzPh?=
 =?iso-8859-1?Q?oLbn8yZcW48SYUuIoUpySZahiAqi6yl4kPl4zk8XXm6K3kUKnqrZwN4hzR?=
 =?iso-8859-1?Q?pq9RCqZ8tM8hZCwvzmiLbRYOnYgo33Wbd3k9Z4fz?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83cf89b4-0473-409c-c0bc-08ddb878723c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 08:22:40.8138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IGmjsuWaT/LwVDux3apN4OWMHZ5RJtWEIZGQ7pXTmQ4K+pa2UioeHNksqcfHjqvlddF2nShcIoPb8zRVpN6TJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4714
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
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: 01 July 2025 13:48
> To: Nilawar, Badal <badal.nilawar@intel.com>
> Cc: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linu=
x-
> kernel@vger.kernel.org; Gupta, Anshuman <anshuman.gupta@intel.com>;
> Vivi, Rodrigo <rodrigo.vivi@intel.com>; Usyskin, Alexander
> <alexander.usyskin@intel.com>; Ceraolo Spurio, Daniele
> <daniele.ceraolospurio@intel.com>
> Subject: Re: [PATCH v4 02/10] mei: late_bind: add late binding component
> driver
>=20
> On Tue, Jul 01, 2025 at 01:37:36PM +0530, Nilawar, Badal wrote:
> >
> > On 28-06-2025 17:49, Greg KH wrote:
> > > On Wed, Jun 25, 2025 at 10:30:07PM +0530, Badal Nilawar wrote:
> > > > +/**
> > > > + * struct late_bind_component_ops - ops for Late Binding services.
> > > > + * @owner: Module providing the ops
> > > > + * @push_config: Sends a config to FW.
> > > > + */
> > > > +struct late_bind_component_ops {
> > > > +	struct module *owner;
> > > I don't think you ever set this field, so why is it here?
> > >
> > > Or did I miss it somewhere?
> >
> > It is set in drivers/misc/mei/late_bind/mei_late_bind.c
> >
> > static const struct late_bind_component_ops mei_late_bind_ops =3D {
> > =A0 =A0 =A0 =A0 .owner =3D THIS_MODULE,
> > =A0 =A0 =A0 =A0 .push_config =3D mei_late_bind_push_config, };
>=20
> Ah.  But then who uses it?  And why?  Normally forcing callers to set .ow=
ner is
> frowned apon, use a #define correctly to have it automatically set for yo=
u in
> the registration function please.
>=20
> And are you _sure_ you need it?

In xe kmd only uses .push_config so .owner can be dropped. Looks like it go=
t propagated from previously implemented mei components but for none of the=
 component .owner is used.  So it's fine to drop it.=20
@Usyskin, Alexander please share your thoughts on this.=20

Badal
 =20
>=20
> thanks,
>=20
> greg k-h
