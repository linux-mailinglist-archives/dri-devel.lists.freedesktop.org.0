Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 784B5A845D9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 16:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A94810E9D0;
	Thu, 10 Apr 2025 14:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGKrowd4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AB510E9D0;
 Thu, 10 Apr 2025 14:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744294364; x=1775830364;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jfnNM8T9JsxSwMv1w34fauGywMZw+SkMHiMMAjim6Wg=;
 b=eGKrowd4/FcSW/TgcKOsRpt5bhUcA7zSS6jxHmssB+e1nLxUfe9sSOiH
 MDnGjONHyT58EHk8KkhXzWcYrK+nBxwpdjeHVJk34KswVcANiwEc8E0PP
 sLde3GKsFTHNtC7b3lrRKIq+NpUu/zygJYXM16/MaY3n6RsClq0wIa87+
 hNXd1gjkm00PLIoLU3ofwcZS7Z6TVpp2YSDwe3u6q+oqhzA04PpmhBqUk
 96m/h5PQCLOvAv+n9q4fmLp0RBt3rUvmiBiMQxHSwZo6fEsw6ZGtM0wm7
 5W+bE51ikBg6vMTBLkv/9fvb0evg6hQiZUqH+S1SgM7Mce5EcJSGwlPpf g==;
X-CSE-ConnectionGUID: 6wCR9GZbQEOdRnAx1EYigw==
X-CSE-MsgGUID: ggbYZAlZQaKi19/SRRJp1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45711066"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="45711066"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 07:12:39 -0700
X-CSE-ConnectionGUID: Bv8xoFfvTC26SE3OUOWe5w==
X-CSE-MsgGUID: m65ea2UjRCqcGUgwNz/NmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134094590"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 07:12:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 07:12:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 07:12:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 07:12:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCv8qVWSLLnUNOxcw3MC+hSa8nsquxBr/Jap8SycgjUywgfK+yPFioAk2WUkKBB3Ofxrcleh9CuZvmyl3zFW6hLmXKqmRjkV/OIlOoK8/gGcpOTm2chLX2t6wljFQgXk8FsFti9fkubbn48uKPU1fW45a3PeuDLPSvlTIdf72oxooJXCoeZNyetq0SW+Y56PVZoXZdcIf//lFHNyOEeVVdPEs1xeoQ27orLcrDDvI+lFo7kZifgKSVTHDIOoCpLtm9iaU2CfTLm59lYXPNVwCsGOfmkxVZyUp4kY39b647YCAk60c/FmkyMKSsIbvowyt1d5R6expgmQVyYakMY7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfnNM8T9JsxSwMv1w34fauGywMZw+SkMHiMMAjim6Wg=;
 b=GuU8A+LVG6oopdPSXZff864Cr6qgxx67WAtitEHezV6QBYRJiRUrFkBAd9r1AsRK2s54Bhe8xAWewn7CSZjESGLsihsi7e4P++RQwR/VdL/AJEZUkbVhP4k3Y7zfaig6x2iOCV6vzzT+Ld5vFeksKjl6HC2NZvvSKkueXNqFpBPkSgSkRKrAiuB30Vizgmzf/9PocUd+o3zBcEmXAdN5/rM12bN1d3MClDKEq+g2DkJ+k/hO5SnuSZZkYDqSfzuaOJzCm4hzr5QeNXSejYMtIiOzdOZU6EhezEGY7ngq8qoovfg8MmlIyErrf8hP3nIWcfKKgRr56ya/l8FM5T9dQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH0PR11MB5175.namprd11.prod.outlook.com (2603:10b6:510:3d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Thu, 10 Apr
 2025 14:12:29 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 14:12:29 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, 
 Reuven" <reuven.abliyev@intel.com>, "Weil, Oren jer"
 <oren.jer.weil@intel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v7 01/12] mtd: core: always create master device
Thread-Topic: [PATCH v7 01/12] mtd: core: always create master device
Thread-Index: AQHbnmT6czHkKmL9wkq39BK9P9qwmbOO8SWHgAjtlcCAA1DrIYABjPIQgABLchA=
Date: Thu, 10 Apr 2025 14:12:29 +0000
Message-ID: <CY5PR11MB6366593316EAAB6880745E5BEDB72@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250326152623.3897204-1-alexander.usyskin@intel.com>
 <20250326152623.3897204-2-alexander.usyskin@intel.com>
 <87ecycrko4.fsf@bootlin.com>
 <CY5PR11MB63661044DCB37577A12B5DF9EDAA2@CY5PR11MB6366.namprd11.prod.outlook.com>
 <87zfgpejtu.fsf@bootlin.com>
 <CY5PR11MB63664C1F1C2094580649F4D5EDB72@CY5PR11MB6366.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB63664C1F1C2094580649F4D5EDB72@CY5PR11MB6366.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH0PR11MB5175:EE_
x-ms-office365-filtering-correlation-id: 8a4cea80-6db2-47e3-5a79-08dd7839baad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?S2JIczg1MlM4N3VkZ3AwL1RQN1FYcVZYTGlvcFd1czdiaFBqVjdQTWFlb2xr?=
 =?utf-8?B?NEZKeDIvU2V5V1RMQkRiREpJeXNUd0xkMHVBcE9oS1N0Z0RzdGJaSlRLRTJh?=
 =?utf-8?B?NjZSalZDRmN6eVhYbWtZb3JNVGcyU0hySzluWW5VU0pGVTBsaXRCMUIvWUZ2?=
 =?utf-8?B?VnJBS1hPTjJPSUhqanp4TTNORlNzbnZ6aytBNWhiSjZFRVBwZ0NkMU5Jb2pE?=
 =?utf-8?B?OUZXVTNXT092WXBDYng2aXVpVTFrYnRwZzgzd05FU3BJbEZrVW9YbmQ4TE5K?=
 =?utf-8?B?c2h0czJROW53NHVUQVQ3U3JIUzd0TCtWSkg4RU9FSCtIK0tWRi9wb1NqUTBS?=
 =?utf-8?B?VjVxeFcwaVVVR0R4akUzSW5DRkFhMzhDQlZqYjZhMDRPd3Rjb2QvVThJWm5l?=
 =?utf-8?B?UmFuSmFaSHVoR1B3SFFXZFdGWW9KTTI3VmNTNGVONVQ3M2tDUWVEVVRmd2F6?=
 =?utf-8?B?K0dpTEF3aUcyNEQza2dyV001L2pSRjZ4MjlZd0xHa0dmdGhmcktCYWRCaHRF?=
 =?utf-8?B?K3pxQ2Fsa2VLaVdOSDg3R3Axc2FCV3p5TlVFcy9iWm5IZ0J2a1pvZUFyUzg0?=
 =?utf-8?B?TDVBMDV1WFpCTjVmdFhicW90TUlyckppNDJPMkMrVDBzWUxGUjAzZVExRG5k?=
 =?utf-8?B?T2NsV21ReHgzZ2IxcTRsMk5WLzBhd1dmeDdYaVBjaUh2U1pqSmRLalVkRWJQ?=
 =?utf-8?B?MzJPdjVzaHJ0bThwRG1iOTFtZHA0bE5YU21xNHg0b2JVRWR0NEpPS2xxV0ow?=
 =?utf-8?B?QTJGYUNYR0dMZlc1dTNZRVpYdytDbHNFLzRLbGFBbWtHV2JqaC9LczR2dHBx?=
 =?utf-8?B?RUNLVURxcG9PNE9IWjVDakZXbjQzeThlMVJIU2lhaGR1RFJPWHFIYzkyYm1N?=
 =?utf-8?B?RDllWUFkNGhIalVZbVJlTVZ0RXdrK3J1Q1JvNXQ1NnRpRzVaUWQ3MHQvd1F4?=
 =?utf-8?B?VU5mdk03U3FSK1ZERE00WlRqYTNRUFdnUWNBNlJKMFlCNlJ3WlRUaTFOdEhn?=
 =?utf-8?B?YmhyWWpZNEoyZURXY29UWjBzblhIZXZQeTdBdEt1RjdJSEFOVUFUbVlGaExZ?=
 =?utf-8?B?SnVTZDZ0cTR1KzlkcHh1NkhSUXdmODI5ZGY2WnF6UWp4M002V05iVkNUcyt2?=
 =?utf-8?B?NUZkWmdsMStMaXZZaFIyYjdTRUdBQVdNN1ZCT1ZBY0lITXV4VTRKeVA4WFdi?=
 =?utf-8?B?Z2VBeDdkKzMzb0FWendpTzlNODVkOVNOWEhSaHJ5aDdDL25CVzRsR3JUenVX?=
 =?utf-8?B?eXBlYlBPNDVLWk9UaWpiQkVpV25NNjNtT3p6MUljcVRjeGpEZkdYd01WQ3dx?=
 =?utf-8?B?K3NxUTFuMzFhRW55MndRaWNnaUY0bWR1ME0xdXB4dEpoNk9zOGtnYXVVdXN2?=
 =?utf-8?B?WFY5Y1dDYVVJZjRNQTNQUmRNYmhucm9OWjRRazZMYzRvY2JodWJRbDBEcmxI?=
 =?utf-8?B?aS9vTFdrSnBobEtwV05xNWtBeUx2Wmt6MjU5UHRVMC84QmNma3dQcnNZQ2JU?=
 =?utf-8?B?VjNDaWZ6NmFpMmtXQmhGUFpnNzBWMWxtbnJkblJYTDBRbldQZFlpVERlR2lE?=
 =?utf-8?B?UVRmcFVobzdzYTZaZnEwSWl3eFdFV3pia09ZVnZaZnNKbXBmK0Jyb0VKNWI3?=
 =?utf-8?B?OTRGcVdYL0JGdVB5ektnNXE3QzRXTWxTRE94TitMcFlRRGdQTE5LenpVQSsv?=
 =?utf-8?B?OFZIUnA5WWdTM1lFd1hZY251dTNBTkJnZk85UDJuakJIblZmYVNyS3BrTmF2?=
 =?utf-8?B?RUtaSjFueXFHa0xsRktPb2M2d093L1pKZE84RG5WaGlVa29pL09rbEhzZnRz?=
 =?utf-8?B?UDdJYjZKaHEwVXJaOU9qblRlZzBPRFIzbStOYVlJRlhhbWxlbTgyV0d1bkk1?=
 =?utf-8?B?c1lYSlhuMmxMUjhTTzRIZ3R3NUx5dkkxWDFUTGN2OW01RmJRbTVuTll4YU1q?=
 =?utf-8?Q?ydjhxSt9VQguJi+NBVEHjMYkGTHfeU/p?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2gzUEdaSGpycWxWZ2NHYzNxdm5GMHF6aDFKTFBIejVMd3M0TWRBVElIeEpZ?=
 =?utf-8?B?NE1BUmdONUtuRUJIYkhIempMYmVXaGNyT20rQ2RjMlV4Vm0vZ0IrZ1J6TnZT?=
 =?utf-8?B?MFRMTkdZZ0NSOS9ocDNmU3pxOE8xa2l2NjhvUFR1SEg4bGpkRG0xTWxqTC9U?=
 =?utf-8?B?T3J3cnE1T3JORHllc2YyV2w1RjNubHRnSEtnUHduUEFtaGx2ZklHOXhEU1k1?=
 =?utf-8?B?cXc4dEZIb09BVWJ5aWV3d1YxZ1h1aGkxMGZGWDViS2ttU1lLd09xaTRSaUZq?=
 =?utf-8?B?ZkNPaDhyWjRjZlB2c3prbHcrSEgzenV0bWNOZHRJWXBBM2UxZTYydDBKT3Fo?=
 =?utf-8?B?K08xYm9YWU14R3lSY0NTUFVEaHk5MmI5TWprTmRmdnpNV00rd3ZUbHhTV0ZC?=
 =?utf-8?B?NWFGOEtUTDMvbisybGZKZnFRMjZmRDRZYXd1SGNzNzV5bnZ3V1FQNVNJaFo5?=
 =?utf-8?B?YzhDMlh0VjhtYmlhUGtnc3IvTHFBV2lqcUdSM25wRlNLczNTd1o0aE5UWDBl?=
 =?utf-8?B?c21wNVN0dzdOendFWk9RZzZxUG9CRXY4amQvc3V0WmJaQWZPVGFrTkFYSWxI?=
 =?utf-8?B?NkxnTjJCNEx0RC9mZll0NkNsYXl6eDNEa0NXN0hBdVZ6TnF3SWtLdko3WDJV?=
 =?utf-8?B?N0lSaGRmRGRwcmFoSmw2UThlUnFLV3Q3cGpydk1QRkJOWCs1bEFXNExVcE1W?=
 =?utf-8?B?LzU1TURMOXRucUE2VnZUUWFFT0ppcXNuRkQ0MWpZdFdHN04rS0NUczdXVFdE?=
 =?utf-8?B?djB3cGlNWXBUQjllRSthZWNiWUVmbFhZWXIxQUZJMEpHZEtCTjUwVXhrb1Q4?=
 =?utf-8?B?eHdzSEZ2NGp0QVhudkdnUlRIRDFBWlArSnZDSWhiUDl3K1llaDFnUVdVdDFF?=
 =?utf-8?B?VER3cE82cDdURVd3bDNiTWwydkVrV0x2ZitUWVVHOENGTzNqOGY1SzhkSkpQ?=
 =?utf-8?B?eGh4UjFDQTFNNW84dnRXQzFzNlJXUXhWaldKc2VZaEJDWEdrOWpaSXB6bm1h?=
 =?utf-8?B?c2FtL3NtcXZocVBBUW5pbWRLZlJPck1GR1BUR0NGSTRWVnovSW1tbGJSSjN6?=
 =?utf-8?B?eFdJb0tuNGdrSTZoQWV6QTNyWW4yY2hmVHBKdGdla2hmcDgvTFp4L0lqOUhW?=
 =?utf-8?B?b0oyakxHVXdDY1lNVDVuL2VEbFNSbEpKK3ZZdkVRd2tsWlBjVWNFWEdFVW92?=
 =?utf-8?B?YXVHMTV3bHJaNTNoWU4zTHJtK1VZUTUvZ3FkVGkxVWgxRkgxWFdpeCtKKzV4?=
 =?utf-8?B?MlNEbTBLeTdjSzZxWUtPWWFOL2ZvZU9hY1FONGZKMzJrYXh2WStjdTFBSHEw?=
 =?utf-8?B?TFhIeVBlajNJWG5rWGZvM2wzV044Wnl3Z2pyOU1vRFYzZDVUQkRoa1JDMXZL?=
 =?utf-8?B?bjVDQnVIRGlSTExRdnhDbE95UGlqMEN0UXc3a0gvTmVmQ2pXT0JDVFA1QU1W?=
 =?utf-8?B?b055UUVzU1BSYWd6Z2JILysvNlZib2dSUk9VazBnNlNQMGUvbEE5NG5oQTlv?=
 =?utf-8?B?SEdFaHRmSlU3VExtWHdsSWc0NTdJRER3OVFiZzZPMnl6c0c3cmUxb3MwVnJn?=
 =?utf-8?B?YWFpSGZDa29zR3VzNDd4eGZtWGdBeXVCb01Mb2Ftanl6cFNUODRmeFM5NDVN?=
 =?utf-8?B?N2U5emJNRnJLdHk2anNWZDRZQ1ZTNWg1cVdlWE5WR21IYnFVaTZ5bWZzODNZ?=
 =?utf-8?B?QWxuQWtaMXQzWUpDb0VxVlFIb3Jtelp6NS9FUHF3aXdzTkxXZTMxMFdWdXJ4?=
 =?utf-8?B?TEdKcXAwVG8zL3M3bjlScmdiQTNkcDhpUVZ5eUNIbm5ORnNlQmJ0RW5Mdzk0?=
 =?utf-8?B?L1Y4ak9KMCsxeUxlNW8vbUw1Q01qeGl6WEQ4MCtMSVpFVitkRXhoZVQ0YjlI?=
 =?utf-8?B?SU51WkNQcEZ6TWk4b1M2ZGM4ZGY3RWp1ZXFkRnVabVk0THZMMC9VdE9mQjg1?=
 =?utf-8?B?UFZKdXdSdHltcWJ1VHhxci83Z2FJK21xY3FTSTE3cWtKbXRVNCt1ekhDdHNG?=
 =?utf-8?B?Q0lvaWQzUVRDdjdwemxZTlJiUEs4UFYxTjdQZFNsY3VJb0JOay9JNmZpRkd4?=
 =?utf-8?B?bUVhS3JlUHhZNy80aVMxTjF0bWdaTG8wSTlRVURIcWxZTW1CaUR1WG9VWldG?=
 =?utf-8?Q?EK0zL6y4bJuG2QASD/fvOtX79?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4cea80-6db2-47e3-5a79-08dd7839baad
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 14:12:29.6589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: js9A8h19hJnT6ZmPS0lo/2v2IYSObzKXB6hDCSQmxCkQ544+/rC1S2zpvXCzOZNx572TsRK7WohBBzj9pMura2CPNmIfp7Et1Y9RFF/RS0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5175
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

PiBTdWJqZWN0OiBSRTogW1BBVENIIHY3IDAxLzEyXSBtdGQ6IGNvcmU6IGFsd2F5cyBjcmVhdGUg
bWFzdGVyIGRldmljZQ0KPiANCj4gSGkNCj4gDQo+ID4gSGVsbG8sDQo+ID4NCj4gPiA+IFRoZSBt
dGRfbWFzdGVyIGlzIGNvbXBsZXRlbHkgZGlmZmVyZW50IGNsYXNzIHRvIGF2b2lkIG10ZCB0cmVl
DQo+IGRpc3R1cmJhbmNlcy4NCj4gPiA+IEl0IGlzIHJlYWwga2VybmVsIGRldmljZSBvYmplY3Qs
IEknbSBub3Qgc3VyZSBob3cgd2UgY2FuIGRvICdsaW5rIHRvJw0KPiA+ID4gbWFnaWMgaGVyZS4N
Cj4gPg0KPiA+IE1heWJlIHdlIGNhbiBhZGQgdGhhdCBsYXRlciBpZiBzb21lb25lIG5lZWRzLg0K
PiA+DQo+ID4gPiBBYm91dCBNVERfUEFSVElUSU9ORURfTUFTVEVSIC0gd2UgY2FuIHRyZWF0IGl0
IGFzIGFub3RoZXIgcGFydGl0aW9uDQo+ID4gYW5kDQo+ID4gPiBjcmVhdGUgbWFzdGVyIGRldmlj
ZSBwbHVzIHdob2xlIGRldmljZSBwYXJ0aXRpb24gYXMgaXQncyBjaGlsZCB3aXRoIGFsbCBvdGhl
cg0KPiA+ID4gcGFydGl0aW9ucyBhcyBjaGlsZHJlbiBvZiBtYXN0ZXIgZGV2aWNlLg0KPiA+ID4g
Rm9yIHVucGFydGl0aW9uZWQgZGV2aWNlIHRoaXMgbWVhbiB0aGF0IHdlIGNyZWF0ZSBtYXN0ZXIg
ZGV2aWNlIGFuZA0KPiA+IHBhcnRpdGlvbg0KPiA+ID4gcmVnYXJkbGVzcyBvZiBNVERfUEFSVElU
SU9ORURfTUFTVEVSIGZsYWcuDQo+ID4NCj4gPiBJIGFtIG5vdCBzdXJlIEkgZm9sbG93IHlvdS4g
SSBhbSBwcm9wb3NpbmcgdG8gY3JlYXRlIHRoZSBtdGRfbWFzdGVyDQo+ID4gZGV2aWNlIGluIGFs
bCBjYXNlcy4gSSBiZWxpZXZlIHRoaXMgaXMgdGhlIGZ1dHVyZS1wcm9vZiBhcHByb2FjaC4gQ2Fu
DQo+ID4geW91IG1ha2UgdGhpcyBjaGFuZ2U/DQo+ID4NCj4gPiBSZWdhcmRpbmcgdGhlIGhpZXJh
cmNoeSwgSSBpbmRlZWQgYWdyZWUgd2l0aCB3aGF0IHlvdSBwcm9wb3NlOg0KPiA+IG10ZF9tYXN0
ZXIgcGFyZW50IG9mIHdob2xlIHBhcnRpdGlvbiBkZXZpY2UgKGlmIGFueSkgcGFyZW50IG9mDQo+
ID4gcGFydGl0aW9ucy4NCj4gPg0KPiANCj4gVG8gYmUgc3VyZToNCj4gDQo+IFlvdSB3YW50IHRv
IGhhdmUgdGhpcyBoaWVyYXJjaHkgd2l0aG91dCBNVERfUEFSVElUSU9ORURfTUFTVEVSOg0KPiBt
dGRfbWFzdGVyDQo+IFwvDQo+IHwtPnBhcnRpdGlvbjENCj4gfC0+cGFydGl0aW9uMg0KPiANCj4g
V2l0aCBNVERfUEFSVElUSU9ORURfTUFTVEVSIGZsYWc6DQo+IA0KPiBtdGRfbWFzdGVyDQo+IFwv
DQo+IHwtPm1hc3Rlcl9wYXJ0aXRpb24NCj4gICAgXC8NCj4gICAgfC0+cGFydGl0aW9uMQ0KPiAg
ICB8LT5wYXJ0aXRpb24yDQo+IA0KDQpMaWtlIHRoaXM/DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9tdGRjaGFyLmMgYi9kcml2ZXJzL210ZC9tdGRjaGFyLmMNCmluZGV4IDhkYzRmNWM0OTNm
Yy4uMzkxZDgxYWQ5NjBjIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tdGQvbXRkY2hhci5jDQorKysg
Yi9kcml2ZXJzL210ZC9tdGRjaGFyLmMNCkBAIC01NTksNyArNTU5LDcgQEAgc3RhdGljIGludCBt
dGRjaGFyX2Jsa3BnX2lvY3RsKHN0cnVjdCBtdGRfaW5mbyAqbXRkLA0KIAkJLyogU2FuaXRpemUg
dXNlciBpbnB1dCAqLw0KIAkJcC5kZXZuYW1lW0JMS1BHX0RFVk5BTUVMVEggLSAxXSA9ICdcMCc7
DQogDQotCQlyZXR1cm4gbXRkX2FkZF9wYXJ0aXRpb24obXRkLCBwLmRldm5hbWUsIHAuc3RhcnQs
IHAubGVuZ3RoKTsNCisJCXJldHVybiBtdGRfYWRkX3BhcnRpdGlvbihtdGQsIHAuZGV2bmFtZSwg
cC5zdGFydCwgcC5sZW5ndGgsIE5VTEwpOw0KIA0KIAljYXNlIEJMS1BHX0RFTF9QQVJUSVRJT046
DQogDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29yZS5jIGIvZHJpdmVycy9tdGQvbXRk
Y29yZS5jDQppbmRleCBlZTQ2NzY2ZDc0ZjEuLmEzMmNlYTBiYTUzNSAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvbXRkL210ZGNvcmUuYw0KKysrIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jDQpAQCAtMTEw
OCw2ICsxMTA4LDcgQEAgaW50IG10ZF9kZXZpY2VfcGFyc2VfcmVnaXN0ZXIoc3RydWN0IG10ZF9p
bmZvICptdGQsIGNvbnN0IGNoYXIgKiBjb25zdCAqdHlwZXMsDQogCQkJICAgICAgY29uc3Qgc3Ry
dWN0IG10ZF9wYXJ0aXRpb24gKnBhcnRzLA0KIAkJCSAgICAgIGludCBucl9wYXJ0cykNCiB7DQor
CXN0cnVjdCBtdGRfaW5mbyAqcGFyZW50Ow0KIAlpbnQgcmV0LCBlcnI7DQogDQogCW10ZF9zZXRf
ZGV2X2RlZmF1bHRzKG10ZCk7DQpAQCAtMTExNiwxNyArMTExNywzMSBAQCBpbnQgbXRkX2Rldmlj
ZV9wYXJzZV9yZWdpc3RlcihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgY29uc3QgY2hhciAqIGNvbnN0
ICp0eXBlcywNCiAJaWYgKHJldCkNCiAJCWdvdG8gb3V0Ow0KIA0KKwlyZXQgPSBhZGRfbXRkX2Rl
dmljZShtdGQsIGZhbHNlKTsNCisJaWYgKHJldCkNCisJCWdvdG8gb3V0Ow0KKw0KKwlpZiAoSVNf
RU5BQkxFRChDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUikpDQorCXsNCisJCXJldCA9IG10
ZF9hZGRfcGFydGl0aW9uKG10ZCwgZGV2X25hbWUoJm10ZC0+ZGV2KSwgMCwgTVREUEFSVF9TSVpf
RlVMTCwgJnBhcmVudCk7DQorCQlpZiAocmV0KQ0KKwkJCWdvdG8gb3V0Ow0KKw0KKwl9IGVsc2Ug
ew0KKwkJcGFyZW50ID0gbXRkOw0KKwl9DQorDQogCS8qIFByZWZlciBwYXJzZWQgcGFydGl0aW9u
cyBvdmVyIGRyaXZlci1wcm92aWRlZCBmYWxsYmFjayAqLw0KLQlyZXQgPSBwYXJzZV9tdGRfcGFy
dGl0aW9ucyhtdGQsIHR5cGVzLCBwYXJzZXJfZGF0YSk7DQorCXJldCA9IHBhcnNlX210ZF9wYXJ0
aXRpb25zKHBhcmVudCwgdHlwZXMsIHBhcnNlcl9kYXRhKTsNCiAJaWYgKHJldCA9PSAtRVBST0JF
X0RFRkVSKQ0KIAkJZ290byBvdXQ7DQogDQogCWlmIChyZXQgPiAwKQ0KIAkJcmV0ID0gMDsNCiAJ
ZWxzZSBpZiAobnJfcGFydHMpDQotCQlyZXQgPSBhZGRfbXRkX3BhcnRpdGlvbnMobXRkLCBwYXJ0
cywgbnJfcGFydHMpOw0KLQllbHNlDQotCQlyZXQgPSBhZGRfbXRkX2RldmljZShtdGQsIHRydWUp
Ow0KKwkJcmV0ID0gYWRkX210ZF9wYXJ0aXRpb25zKHBhcmVudCwgcGFydHMsIG5yX3BhcnRzKTsN
CisJZWxzZSBpZiAoIUlTX0VOQUJMRUQoQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVIpKQ0K
KwkJcmV0ID0gbXRkX2FkZF9wYXJ0aXRpb24ocGFyZW50LCBkZXZfbmFtZSgmbXRkLT5kZXYpLCAw
LCBNVERQQVJUX1NJWl9GVUxMLCBOVUxMKTsNCiANCiAJaWYgKHJldCkNCiAJCWdvdG8gb3V0Ow0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZHBhcnQuYyBiL2RyaXZlcnMvbXRkL210ZHBhcnQu
Yw0KaW5kZXggOGEwMTljZjAzNjBkLi5jZDVhZTkxOWI4MGMgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L210ZC9tdGRwYXJ0LmMNCisrKyBiL2RyaXZlcnMvbXRkL210ZHBhcnQuYw0KQEAgLTI0Miw3ICsy
NDIsNyBAQCBzdGF0aWMgaW50IG10ZF9hZGRfcGFydGl0aW9uX2F0dHJzKHN0cnVjdCBtdGRfaW5m
byAqbmV3KQ0KIH0NCiANCiBpbnQgbXRkX2FkZF9wYXJ0aXRpb24oc3RydWN0IG10ZF9pbmZvICpw
YXJlbnQsIGNvbnN0IGNoYXIgKm5hbWUsDQotCQkgICAgICBsb25nIGxvbmcgb2Zmc2V0LCBsb25n
IGxvbmcgbGVuZ3RoKQ0KKwkJICAgICAgbG9uZyBsb25nIG9mZnNldCwgbG9uZyBsb25nIGxlbmd0
aCwgc3RydWN0IG10ZF9pbmZvICoqb3V0KQ0KIHsNCiAJc3RydWN0IG10ZF9pbmZvICptYXN0ZXIg
PSBtdGRfZ2V0X21hc3RlcihwYXJlbnQpOw0KIAl1NjQgcGFyZW50X3NpemUgPSBtdGRfaXNfcGFy
dGl0aW9uKHBhcmVudCkgPw0KQEAgLTI4MSw2ICsyODEsOSBAQCBpbnQgbXRkX2FkZF9wYXJ0aXRp
b24oc3RydWN0IG10ZF9pbmZvICpwYXJlbnQsIGNvbnN0IGNoYXIgKm5hbWUsDQogDQogCW10ZF9h
ZGRfcGFydGl0aW9uX2F0dHJzKGNoaWxkKTsNCiANCisJaWYgKCpvdXQpDQorCQkqb3V0ID0gY2hp
bGQ7DQorDQogCXJldHVybiAwOw0KIA0KIGVycl9yZW1vdmVfcGFydDoNCkBAIC00MDEsMTIgKzQw
NCw2IEBAIGludCBhZGRfbXRkX3BhcnRpdGlvbnMoc3RydWN0IG10ZF9pbmZvICpwYXJlbnQsDQog
CXByaW50ayhLRVJOX05PVElDRSAiQ3JlYXRpbmcgJWQgTVREIHBhcnRpdGlvbnMgb24gXCIlc1wi
OlxuIiwNCiAJICAgICAgIG5icGFydHMsIHBhcmVudC0+bmFtZSk7DQogDQotCWlmICghbXRkX2lz
X3BhcnRpdGlvbihwYXJlbnQpKSB7DQotCQlyZXQgPSBhZGRfbXRkX2RldmljZShwYXJlbnQsIElT
X0VOQUJMRUQoQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNURVIpKTsNCi0JCWlmIChyZXQpDQot
CQkJcmV0dXJuIHJldDsNCi0JfQ0KLQ0KIAlmb3IgKGkgPSAwOyBpIDwgbmJwYXJ0czsgaSsrKSB7
DQogCQljaGlsZCA9IGFsbG9jYXRlX3BhcnRpdGlvbihwYXJlbnQsIHBhcnRzICsgaSwgaSwgY3Vy
X29mZnNldCk7DQogCQlpZiAoSVNfRVJSKGNoaWxkKSkgew0KZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGludXgvbXRkL3BhcnRpdGlvbnMuaCBiL2luY2x1ZGUvbGludXgvbXRkL3BhcnRpdGlvbnMuaA0K
aW5kZXggYjc0YTUzOWVjNTgxLi41ZGFmODBkZjllODkgMTAwNjQ0DQotLS0gYS9pbmNsdWRlL2xp
bnV4L210ZC9wYXJ0aXRpb25zLmgNCisrKyBiL2luY2x1ZGUvbGludXgvbXRkL3BhcnRpdGlvbnMu
aA0KQEAgLTEwOCw3ICsxMDgsNyBAQCBleHRlcm4gdm9pZCBkZXJlZ2lzdGVyX210ZF9wYXJzZXIo
c3RydWN0IG10ZF9wYXJ0X3BhcnNlciAqcGFyc2VyKTsNCiAJCSAgICAgIGRlcmVnaXN0ZXJfbXRk
X3BhcnNlcikNCiANCiBpbnQgbXRkX2FkZF9wYXJ0aXRpb24oc3RydWN0IG10ZF9pbmZvICptYXN0
ZXIsIGNvbnN0IGNoYXIgKm5hbWUsDQotCQkgICAgICBsb25nIGxvbmcgb2Zmc2V0LCBsb25nIGxv
bmcgbGVuZ3RoKTsNCisJCSAgICAgIGxvbmcgbG9uZyBvZmZzZXQsIGxvbmcgbG9uZyBsZW5ndGgs
IHN0cnVjdCBtdGRfaW5mbyAqKnBhcnQpOw0KIGludCBtdGRfZGVsX3BhcnRpdGlvbihzdHJ1Y3Qg
bXRkX2luZm8gKm1hc3RlciwgaW50IHBhcnRubyk7DQogdWludDY0X3QgbXRkX2dldF9kZXZpY2Vf
c2l6ZShjb25zdCBzdHJ1Y3QgbXRkX2luZm8gKm10ZCk7DQogIA0K
