Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E33D4CF2AB5
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 10:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162CC10E3AE;
	Mon,  5 Jan 2026 09:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eqvp5VWX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3159510E38B;
 Mon,  5 Jan 2026 09:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767604586; x=1799140586;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GSWNzj4XJezqg0dNaG1UKDKekKRv94QBiLzP7P+Mf5c=;
 b=Eqvp5VWX7Nwfvww19SUTR25VYchEsYD4P+zhxcdYKgqstYqto+bh0Px2
 Vxf/zL/3d8UYox4Du7kPFquyJVrmBxu0bg6NBSAyLEG58Na5iYV0Xk1DE
 r1uMdvmvy+T9JmUfUT25XXdp8F4wvK2cNlxkWc7wNVLsI6uBG5d+Mlt0v
 /XWuuJEFv0ASLZDB1M4QAd4cUsLyDnKvXuFifOWPOIY+hm26wbaJ2zih7
 a6QeD79/Z3290J5BxRHR98npLZA3cPjmefVvw0cMOwflR7mwTgxCrSvNS
 N8Geu3nHdM+8y0jNQPdsleWket13JIxAoiw2SfPwUKu9q9SoUY65UwkKT g==;
X-CSE-ConnectionGUID: i/o/ppKJSjKIUVBECR4TDQ==
X-CSE-MsgGUID: XnphNZPhQ76SwS2Lz2ZO/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="79603611"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="79603611"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 01:16:25 -0800
X-CSE-ConnectionGUID: 6Gk1atkHSyye5q3iAkctZA==
X-CSE-MsgGUID: 4zrYx0fqQkK5SH4NaYRUCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="202243422"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 01:16:25 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 01:16:25 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 01:16:25 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 01:16:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qU51hq8NIneYiXI03KviYkAqUjp3ESaiPeg+iLhAqKJYIirVrrDzNlB3ihLBV7fDZMcVWXrqhkBBBzt70OBPPZJkptXX0AVoU0pP0vbeGQVIhXhiuWlU7zgIwHQVNpzpuOnUkDc3q1CpV+ocZmavdYzX38LbaPDZJ0HV62cVuPdyRJZDj2MR+TylVL+v3fwwuHQLKlAfwI7DIaWaE9be0BlfLGrVgfIIyqIWGdx2AeG1zT5vVC3EJPPPBfkJKPkq8DeE+oIeUrwN2pW8wBuInFobWPnqXW0Oc7rHosLHd+amlkb3BekWYNnMQRenx4oZ0ZqpFawQg4kuoBcdHQyUdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZ3aeyclnw09n4+47TOKhEDwaBe8T8dAHrJK+UTV2qo=;
 b=NDDT0nhYHGoJ4GnNZQjrh/THpiPdo47PHnN/Hcl0xY9DVSsukjGUeVPgmQd99/mqtB6bV4/5xj5OxqFo08nJ7N6dhDitTkKTA/YeWEsSltmPQZl7PCQKAdx72vbV6fwPtcqMefh6zyuJkrdkDc+Q63Tr0cJchWyeNWyWEXkpx312xQ+iIWgTc1Uwhthc2zV0QdYD5kvM19riVwPsGxqePzIy6T3XkqUgLgmbSdQaj+exEMwMj8XWqFeBoEI7X9mc/jNVv7VLyFfHFryZ4N2PQ5Rya0gCLT3CxiJmzpYL2/Hpe5uT5jad7JK/SvujwUa75Wfyu7Zn6/6hJVXC8zWjzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DS7PR11MB6013.namprd11.prod.outlook.com
 (2603:10b6:8:70::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 09:16:22 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 09:16:22 +0000
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
Subject: RE: [PATCH 06/13] drm/colorop: Add destroy helper for colorop objects
Thread-Topic: [PATCH 06/13] drm/colorop: Add destroy helper for colorop objects
Thread-Index: AQHccLb+ejnFB4gjFkiS4ED38+E/bbVDZlrQ
Date: Mon, 5 Jan 2026 09:16:22 +0000
Message-ID: <DM3PPF208195D8DF0F8C6BBD6DEB9148152E386A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-7-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-7-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DS7PR11MB6013:EE_
x-ms-office365-filtering-correlation-id: e4f5e3f5-3766-4e0d-b3d1-08de4c3b17f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?d9P8C7Rx/zN/CFHcVXf2YOgcj8oWg8D2DRYnaVk4bunYl5sBsUrLbWCXGu6b?=
 =?us-ascii?Q?uV12rL3MOcXFrfZs4nwxiH+gU58XrMrduwMzBpzIHhO6jyPzBcBnpLefSLwQ?=
 =?us-ascii?Q?tu/qd+18HvceLom7MsUfuQg6Xl16VEEdOG3ptSfoviYLgCWzTanuSabjKZUb?=
 =?us-ascii?Q?zJIWwK2l9D31G7vfUelj4FZ5EfNUuzF+ilATIAd+H7FcSK33/qGksNCkB1LI?=
 =?us-ascii?Q?QG5ORwyhYuXNDre4AdkvW2b4TGgfIbCG1j38QvRk5xLyic8FjekzaKjrFWd7?=
 =?us-ascii?Q?YdBOmqbqGW54B0P2m1WkfkHyEuwiJQ0oB8/LzN4BSa5jy2EeXGakrhMxPsQT?=
 =?us-ascii?Q?P8hqKVRHXEnRoQp3UgR3jyNAT7ayFZeCLCGEL/rBeOIHNPq9w6dF9iNSTQRy?=
 =?us-ascii?Q?QtkQxsbJq+Nbp7MTubdBg7pOX0YZMSqTeD8aA68jUyanaprwn73lrPDHvB/s?=
 =?us-ascii?Q?JK58PtHVDGe0wWootdikF8x1dihue3kf3BdRNJGfNWpPgXndrwB0REhhXyHg?=
 =?us-ascii?Q?4uaAZLzbhqQBKKRMXIxwp0nqNlboMWX/qnCANVQhdpYFGxEHqwos30+pB34f?=
 =?us-ascii?Q?a79d9HK3rVvV+UpYyABv1W17RVIe8IJuw6a8FC/1eqqF/wo+mgT4XdZscACP?=
 =?us-ascii?Q?KMR9AqkGK9ym7AEhYQcDPyJN4XFZ99bdqZCUcIRMJbE2FlvxQGwOFsieSlEy?=
 =?us-ascii?Q?n7M7inLRr0jbv4W8TpMXicVgn09xBBc6/BYAQHwvTUDt13hBuVryBpbTZlQu?=
 =?us-ascii?Q?Z6rd+53+I80SSz4s/ZsDnjy3CVc1YTIHuhV+NQrMatNG20kWuReNl3Qb2PYj?=
 =?us-ascii?Q?85G2DYRHMPNLcykjhjAG3i9h8lB4XwMiYGh1WK6rrGKhL0L+L/7AG0Hjn/6j?=
 =?us-ascii?Q?/4em6URsUqu6p8m0OpU36ovNSCpAzTPc5jfUFROg152cTJQI9XJgiQcndlP/?=
 =?us-ascii?Q?KZQdMKj5/kGwcHeEaF5uuDJGzI4TfTbfrhctdIRnEMQmHE3yydTpMfEK/ffm?=
 =?us-ascii?Q?0X8kB3akSNm1Q0iIstpvEZpXw7Z0F29ppKGgaaCe51HQBIfdEH7MTp9odsYu?=
 =?us-ascii?Q?COk7BkU6aWVl30l69hno1nQJempKxFUZOtnl2zrhMNlMbil4TngIIgmWen/8?=
 =?us-ascii?Q?1bcufSeU28kRhtlwXOtujKZljjoa/4gep/R7Wl06tOEfZ8btuFSm7vBE8OG5?=
 =?us-ascii?Q?laAqaingh3Lq8H7KSw5JkwBfw9a+VNQnKXjUImGBu/9w+yzNclueuCz+B66M?=
 =?us-ascii?Q?YzuoDSX7g1Mn2dZMpIqErdZiqWM5aK6kpi+WvAF0OduzGy8Wse6wqcZYwnzT?=
 =?us-ascii?Q?q18SdmF4wmo1eaSuqJmqu34YDsDw6EJQ8HgS/ZCMTBCTknCglzV2gZsXUXzC?=
 =?us-ascii?Q?zBbhMPPsNFPuJ4xXNh/Cu0nWSyaiOAIo/U65aqRk7incoh1pHs/FZkXz2XQ0?=
 =?us-ascii?Q?90JY1UOPrYG3s7JFLeKEKAnz5uh9owK1TAOFofYjipJPnutADQUYAYGBatQm?=
 =?us-ascii?Q?vru82AhIPz7iEXR6XWeUGvDKXBRAU+TtXiFT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v+0PB4aabkYGZxf3hYe5hx2iUKVJoyDXr8LWdkPyoAqQMRn5OgbZPqeecJLO?=
 =?us-ascii?Q?hr8E3B6aLMFLkXex0jN2vmvRRgvGZYYJplJDMQqnPBNqNFXiOqAiwu2lHvvK?=
 =?us-ascii?Q?Gjy5W7VUfHeejPYj6sOXIedEf5e+hWZdewF+7DUui8Ul0S3Hxp6yixiHHCsY?=
 =?us-ascii?Q?Z+9tjz4s/CEUzEUSVa+3euXurWsOBrtW7AD0cXA8fCWiLMjKKorH8EMWqwxH?=
 =?us-ascii?Q?eK5lJD4MHzjav8dg6CEHHTKgeKS5hnwyLtdYk+csp2fd75DtzDOMdxWRxk9N?=
 =?us-ascii?Q?c6oZRHASbr/pFyux3K4E0t3lZYuqlj9/+QkRV++OOrPj3xiReNmVbscxCp9q?=
 =?us-ascii?Q?0WV/zvfiWfaHld3YRsUZWrnsJ644J82mW2Tcrw9n7Fs3b+UD/ZzRGtSyiAy2?=
 =?us-ascii?Q?tyjtADtUs/w3VK0ISJVRveW5QepCSvJJgYwjQKB36RdmTBMa0kSUrUyWiM7D?=
 =?us-ascii?Q?FJ9sQRUJdZRXpVmvmRGJLPv7VN0PrN/sCDzGwcdVveMmfpCY6SJ2YXtIe8zR?=
 =?us-ascii?Q?F1CUh8qgwvQawRwlkWwik+K5bhz9+LLkWqi0OivMCNm3lvmeRyuRCDjFDPNV?=
 =?us-ascii?Q?GMMIBzM0sb+VeCgJx5QWOTlHkP71jgVHuYsz64EjLXt/tcfzuY3561kdAfvC?=
 =?us-ascii?Q?Ll/RFdicWzctj3tDdrMZA+IKdSych5Sr7/EocfgAcGjHP30H53l0tgLZKTMJ?=
 =?us-ascii?Q?w6dIg4iOQtwrK8jc1eb0AFOaO3SKYv2fCsDj851dhXpC23mSro/bGVjq2Zo3?=
 =?us-ascii?Q?sDiQGU+26VcaX6RzH9InlXIWMk6qDP074KfTO4qnpSN8Xs7M6YvtvR0gZRGe?=
 =?us-ascii?Q?zFOBzhWgPJT5IVhu5JoXbWZOFFnKOjAVy42zKC5YZsAVdrNGUsWruAJtMrNT?=
 =?us-ascii?Q?ZNgzvoLpNUuQbkH4NFs9MSGX9Lj0oDkdc13pIOFuCHPvUHh/FooRYJUFfsoL?=
 =?us-ascii?Q?Wgnk6dUUVaLPD8QqYLbTo9WEhRDUHGATxlAsStkaGoMkb0M5gbOA51JQRNjD?=
 =?us-ascii?Q?+q00NxQZNA0oJXXChyJHjsT+vk6+vcXV37U8xnlF5hWWBCGbQLKAZAnmfNxT?=
 =?us-ascii?Q?scWsLtKyx+wYWIF9e3gjj/V+y7LB3btYsxZUT27HJ6haB4MSIdyiZl58gUti?=
 =?us-ascii?Q?hR4MvWlY2Oj1wVyNLb8FmB9lfj4MTbEXCItVgXR/gahO98bzuIJL8YEwoy9Q?=
 =?us-ascii?Q?bcV7l7nZobgAPc8OwFF9MBhF4NpsemTt0SdL+GbWp/jfB5gdCj7vbLD4j0Lo?=
 =?us-ascii?Q?cqPRfO+YwwLrsq675EXfyrZYjU3PTl8tFgiJZVOknTyATtI5lvuoCADI8AK9?=
 =?us-ascii?Q?n5fYJa1QqaPiBc0yzwRtgn4KD9nKK24mEd0KxRaKLx4HNbo4r4TEry1rKLIx?=
 =?us-ascii?Q?3sDbsaGX4fHi/M1ZH1tRmd8A5ogCY1qpjBPjsqCMIjcJzSzNFnwXQZT9aSD6?=
 =?us-ascii?Q?JS1+LVF55HWHLZReairrh3GtPueCAkW7lfwCs3XeoYl0Yev10UEvzO1LOFWN?=
 =?us-ascii?Q?G+jaAScYm3UwdlglO/FJc+0Pp136z/qLKUm3QGe+WBE5LMrNJiIsLVCsxPJv?=
 =?us-ascii?Q?U2jKSCkcWx2h7NHpKZqspuylWmlkLlXg9EN386ymq2ySCpsbvrm2VugALxIo?=
 =?us-ascii?Q?PBOjIrzE6GtIeNboxmtW5e9/L6/Dw6DmJijkJS8kg2zmyXI9zGY2Beyse9Fh?=
 =?us-ascii?Q?Qj8GWCJlWEm6xjJ/HxhLLglDJ41iRbnXh+CE/BeMQZ6opRx8Dn/r4ER000J/?=
 =?us-ascii?Q?BcZbg2CLNw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f5e3f5-3766-4e0d-b3d1-08de4c3b17f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 09:16:22.1172 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DUEbHSs9gL8L/w9ABhmA5E0of3n+kq1BzZQ8y8ziZUHhwbP1DF4mDOL/B5OUWc4WdYkfzBSETQ5dZmEIRfqZvQ==
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

> Subject: [PATCH 06/13] drm/colorop: Add destroy helper for colorop object=
s
>=20
> Add a helper that performs common cleanup and frees the associated object=
.
> This can be used by drivers if they do not require any driver-specific te=
ardown.
>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/drm_colorop.c | 12 ++++++++++++
>  include/drm/drm_colorop.h     | 10 ++++++++++
>  2 files changed, 22 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.=
c
> index efe61bdd9b24..4b27804bb0bd 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -180,6 +180,18 @@ void drm_colorop_cleanup(struct drm_colorop
> *colorop)  }  EXPORT_SYMBOL(drm_colorop_cleanup);
>=20
> +/**
> + * drm_colorop_destroy() - Helper for colorop destruction
> + *
> + * @colorop: colorop to destroy
> + */
> +void drm_colorop_destroy(struct drm_colorop *colorop) {
> +	drm_colorop_cleanup(colorop);
> +	kfree(colorop);
> +}
> +EXPORT_SYMBOL(drm_colorop_destroy);
> +
>  /**
>   * drm_colorop_pipeline_destroy - Helper for color pipeline destruction
>   *
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h index
> 45d1b1d3faf9..ee6454b08b2d 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -440,6 +440,16 @@ void drm_colorop_atomic_destroy_state(struct
> drm_colorop *colorop,
>   */
>  void drm_colorop_reset(struct drm_colorop *colorop);
>=20
> +/**
> + * drm_colorop_destroy - destroy colorop
> + * @colorop: drm colorop
> + *
> + * Destroys @colorop by performing common DRM cleanup and freeing the
> + * colorop object. This can be used by drivers if they do not
> + * require any driver-specific teardown.
> + */
> +void drm_colorop_destroy(struct drm_colorop *colorop);
> +
>  /**
>   * drm_colorop_index - find the index of a registered colorop
>   * @colorop: colorop to find index for
> --
> 2.25.1

