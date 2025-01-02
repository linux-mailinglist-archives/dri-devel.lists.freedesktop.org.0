Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EB29FF9FC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 14:56:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C7010E6F4;
	Thu,  2 Jan 2025 13:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKRh75cH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664BE10E6F4;
 Thu,  2 Jan 2025 13:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735826214; x=1767362214;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zNRTNF6qTYrwT3S6uioZ6zKc1w0F1Dnmc2eclo5nLOc=;
 b=PKRh75cHchGnl9QVsT3VHfk/5wSbJqTNyEcbeNOcMSmTY4msc0wRRO42
 92rdbXUmCGWQ8ku/T0qPn0nw1cqQx2VwccIRKRZxPWEZf/kifR0t7IUqM
 NHOBm/4s22UFcKD9Uix2hr1UgteAeOxKfV7J9+HHm5Ws8oI+Vx6rpio6q
 gm5XIWYh94VMaXu5nIQ2cEnJY4w0INziClkEL6QGZBcLiryu5U7SdKX7H
 ZXKuaaxRUjTdsCD22bvT0V3qfRe3WYhO6knRyue3zfw++KbW0ETbaot/H
 avkWBtdDFFwzV24lbxqQ7asnxLUk7EB0qFEpIEK9TzIaBZWz/KkkakTBr Q==;
X-CSE-ConnectionGUID: yT/pjgTXS0aXvSfFiQVXDg==
X-CSE-MsgGUID: zFERzKKeQLSB9GYIXPTlRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35762813"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="35762813"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 05:56:52 -0800
X-CSE-ConnectionGUID: jKDbMVOJRZOGz+SYBGsltw==
X-CSE-MsgGUID: q4mPuBhSQHqH31xy1HnuOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="101599464"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2025 05:56:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 2 Jan 2025 05:56:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 2 Jan 2025 05:56:51 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 2 Jan 2025 05:56:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3Y2sn5K+uxCU3t2kMxY8/ZsxHc+SllVIQ0zHYezI0aivfdX5i2RUW4u8ZiGc1QBtiHFI/ZeeCNhjxuyq/bDoM3ocKLcDtPfgo+TPr+sj2PhzYiH4d+mOTDfVAX8ZE7/DN78RB70ZGNFuFdR4LEpkQdVFDvPfm8q3Lmy7VgzGgq4pRUOg2RzZDYpnMilGfvb14JAWmLKfpyqyEIyd3NoBgHQp28vhAa4bA9uzXEHPuHqMrDIaIitWPKvsTQyO3HjKbXrKyUSrMk1ExTQrhoi7TsCD3pym8DZ8cAcKcHHjcmRdOmLF/TGBTYbIPx8t2W7VUzt2toBY/scRJxX5SMdUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNRTNF6qTYrwT3S6uioZ6zKc1w0F1Dnmc2eclo5nLOc=;
 b=LFgPlQ+jsIwhpsB4LATJ9mPexjfBrJM/21p6vYv9p0we6Bb99Rx29UqmJj8o0nAqAAxh8T2S0mlgN6kybTkD+Fz3CDJIJ8Jw5XXONP7H8+hg9VRdytAZ/uOVzc/ZHygmYUuoE0rL99vHhsMD3LKHj7Iyo/IzZRwJU1Odf8cZZ1D2OW64DV15lk4M7OfxVcWSL5x6L1k0baMe2x5UeORhRPiTHZVv9yjFlJLajFg6CbRS96VhaBtGLkMuT7smEzibnHJGSUj62+3aOAjM7O/C8Wul5jNvfRgUez2UG+OteolPY6FQ62t7D9uRF8o8V/ALR0WP4cp9/iEtAgUwYtpaeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SA0PR11MB4558.namprd11.prod.outlook.com (2603:10b6:806:9e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 13:56:18 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 13:56:18 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: David Laight <david.laight.linux@gmail.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, Reuven"
 <reuven.abliyev@intel.com>, "Weil, Oren jer" <oren.jer.weil@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 06/11] mtd: intel-dg: align 64bit read and write
Thread-Topic: [PATCH v4 06/11] mtd: intel-dg: align 64bit read and write
Thread-Index: AQHbXGT7p9lsQxsIJ0mgWNAVlUOGTrMCHy2AgAFiB6A=
Date: Thu, 2 Jan 2025 13:56:18 +0000
Message-ID: <CY5PR11MB636623DF234A109B17CD075AED142@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-7-alexander.usyskin@intel.com>
 <20250101164119.000d2bd4@dsl-u17-10>
In-Reply-To: <20250101164119.000d2bd4@dsl-u17-10>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SA0PR11MB4558:EE_
x-ms-office365-filtering-correlation-id: 7a23f98a-d506-4de7-0bc2-08dd2b353b16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NjdqYVJsMGtQNmdVb081RGJiZlRnMFNobDkyWjFPYlNjYVZybXY5U3ZDTi9J?=
 =?utf-8?B?azQyWGFHeGJkK2NWZDFsSFpVT1NRUU9nRStrOGE0aXJyZUg3NlFJNU9TSkd2?=
 =?utf-8?B?bUFJblFGc3hLdWdMRSs2ZXpLNWpUVUJQdHNjb2dtWnU0bVIvVkdXcFlWNGc4?=
 =?utf-8?B?SVlQNmVCZ2dDUXd1MkpzMkJuOGdWU2tQVTNlNWtoRUZwOWN0MEZXbjFGdW1V?=
 =?utf-8?B?THhENE9NaTV6ekdhUk5US1Bmai9jSElHamFoUFFkQWlEbnpOa2NPR0MrTHQ1?=
 =?utf-8?B?TE9MRG9BTzE2bmpzYzVhYkNXQk1OakQ3OGtJSXE2TjVPSWNhMzBXQXAwZmgv?=
 =?utf-8?B?MWpRd1Yvb1BmM3V6VkZ3bEY1dnNpZFR3anRzQXN6ZmtnSC9lTEZ2dncrZzFL?=
 =?utf-8?B?T0NoSU5MVFFhbWhnVUt5bkZMUjYxY2RGcEdybVZubENKdXRFYTZUelRhQk9T?=
 =?utf-8?B?KzFrcE1yRnFuZHNHRUdINTdVRm0xdkk0M09ueDk5NEtYR0E2L3IzMG4wUjla?=
 =?utf-8?B?QS93TkVvYkVxZUVRelZRQTNqUmhzRHR3T0NKZlQ3QjJtMzNXckpCc1RCRHdN?=
 =?utf-8?B?bFRHMTJPUktXU2JwNWxMVFpoWVZwQmlWaFNjaVkzK2xzTVNVZ21GaC95V2RQ?=
 =?utf-8?B?Z1ZQZ3ZLS2xVTjJWSVoweHpFQUtZL3FDZmVRWmtwV2RnMHl2OEZqTkJPc005?=
 =?utf-8?B?TGQzVDFWTngxUzRKVytGUW84ZndPcUVtMkxiaHl1b08yaTBwRlBvQWh0ZTl4?=
 =?utf-8?B?VTFXZTE4MEdaQXd4aVNOMktQZy9abkt5R0hOZDA0N2Fhc0NldHJhczhNelRB?=
 =?utf-8?B?OVBOSXhvdGNkckg1cDllWVo0ajVId29KcnZrQVB4UWE2aGQxZUUwRTM2OFdi?=
 =?utf-8?B?bnRXYjBSQThQU0tDd0pWSDlMZDBLYUhqUUt3K0ExZ3BNckVWVEFMNkZYMVM0?=
 =?utf-8?B?TEtTU1ZvUG8xSGI1VXdKamkrY25RSnlNWXFFM3NCUnZGcHFUTzdXUk5jVEdU?=
 =?utf-8?B?RXpJbHNLUmVqbWYvOEZlc2t1alBZcDk3aHJRWFFSSFZpQlVUc1VudWNKemhq?=
 =?utf-8?B?V1VCZm92QWJuZDBrTllqMlowM0tIUk9DZW4rcWJMSHk3bU9DSlMvcUlyK3Zr?=
 =?utf-8?B?bVJjZDM2TG1pR2EvRllCeTl1c3ZSUEk0TnVOQm1LOUxQazIzY0h6RUs3NWhI?=
 =?utf-8?B?K1FLZEJ2OG1BVEJSOTVyM2V3WHNKRFdKYnZ2aXVSemZ2OHZ2N29COVZRZVZ3?=
 =?utf-8?B?czJXVkNkQ3dtT0QrdW5nUDV2VHhlMzdyVy9PU29idkkwNEpDdkR2S0s3WWVo?=
 =?utf-8?B?SExuckFYMEtIRkM1dk56dU4vS1hzUSt0VDJ3L0hCSGh2SVI4TlZQVDBQcjAw?=
 =?utf-8?B?R0FlT0IzYlZhWWFEb3FsYUJyUDJBL1JhZlJGcHpCY00zY1VNZUkrbUFIYUpw?=
 =?utf-8?B?dEpYSHUrbjFLUyswNGtjQWlOcjl6d0QxcEIxWVdnbzNzeUdWTlVtVmF2NnFP?=
 =?utf-8?B?enNGSnV1eC95Nkt6YW45NXREdW4zb2NCWjNaeVJ2MWRQamtDd0NSK013dmEw?=
 =?utf-8?B?aFlhYnJEYmFyY2d3NHJXTEdFdkNrSERvc29OeXM5NHJLa3pWcldqOTdRazg2?=
 =?utf-8?B?VWdEMnRRVXMxSTQyaThqeXFsb2dNdllzajdSL045VzRhMWtjdDI5V0c5QytP?=
 =?utf-8?B?OGpwVllJc1loNkx1clR2UkVGdGFlQ1dBZWw4bEtRMVE1ZlNYS25LYnlhUjZG?=
 =?utf-8?B?cmNvTWxPdVVhdTY3RlprZzdpOU5xb0JkWVkxVXllMGZGK2k2UWZmaEZ5Z3FK?=
 =?utf-8?B?OS9YdGhHM29XSGZMNWFubDQzS1F6TTA0RVlOVDl1SDJ1VC9mWXhWQzFPdjVx?=
 =?utf-8?B?Q0R0UVo0VDQzTUsySDdxYlljVWc2eUlDNWI2SnpyODJJdThyVlBTYVgxNG5Y?=
 =?utf-8?Q?S3L4hJNZIXS4Zt6GboyYe8uKQWLLL2Sq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDVpUThxMm5MTzg4cG9SUEk0eCtxd1BkakZoMW4wN1lyL0d2aGRjZ3dwS25G?=
 =?utf-8?B?d1VrK2tVRkNVZFN3V0ltY05LK0lHTldBbWJFaFEya1h3bGhyZVY1NVJKTUJn?=
 =?utf-8?B?MlRrbm1CVmU5OFlRc1QzY2Q0aUp2WkxWV0tHL0tDcnZ0RnFhTEdlaUNObnhk?=
 =?utf-8?B?WmtPWDJOVW5JQ1VIeHhCWFdua2diMS9wbit1K1NNLzRMejhablRNU1ZBbmJq?=
 =?utf-8?B?a2l6T1crL2swM1U4SmZXK0w5a01QbkZyUk9YVE03YWhzOTIzeWtUTmVBTUZ4?=
 =?utf-8?B?ZEtzd1NmTlh0SzVKdnJ5MVliMUZqSDJMajA4WE5wQ2hsTlZBcW5rNjVNYjNz?=
 =?utf-8?B?WTNkd1lhZW1neDhLbzBVVVZmbU8yaTY2UTg0UmswTy9QeUwwT2RkVW8yMG5E?=
 =?utf-8?B?Zm5nVHFVbERLVXJTOXcvTHluRU4zcDdia0pyeXFzcWRpbXEzUEl1YVR6UXlX?=
 =?utf-8?B?cTQrZGFnWThGRTRXUVJxVmRGd0xaZ2pCNTdXU0FncURtZVBJVEZFbStzL3R2?=
 =?utf-8?B?NTV1M0VGSmFhMVovRDhnaE9TZHZiYzlhdUtQK3hqTk82UVVJMjZzOHZrQ05t?=
 =?utf-8?B?dEpzZjU0VGRabUg4WXRhckhLTk1IRTRndENYS2V0dXJpdlNiYVNaNmVWNFdw?=
 =?utf-8?B?ZnN4aXdUb3FKRmdYWXBLbmJqNFdyQ3JpSGpBbm1BeDdRcXBnaTdDVmcvZ1Vr?=
 =?utf-8?B?ZWZJWWg3akQrWnM5MG5ndTJZQUlRNXZkQmVJTnp0SitTQUhWazJrMnZJNmNv?=
 =?utf-8?B?YVAvbG5FQ2p0RFlEVXpwdzZtZDhDSDR1cm1XdGk4OWN6ZXFpd0FWTVcvOHl6?=
 =?utf-8?B?elRUMTY2b0cwQy9iMDhNb2Z0U2E5azN4ME5TNzdHYVRGU29TNlIzb3JxTWFP?=
 =?utf-8?B?eXJscE0zZ1FqVm9XMEtoRTlRNzNUYStqRE1VeWdjSVQ5VHNveEJWVVZrV05E?=
 =?utf-8?B?Y2NnNjU2UHMvMnJQaVZiMXlIK1RwWWN5QmlBemh4bVBQdDZCRTZNKzRyc3RC?=
 =?utf-8?B?dEJFMDFTNTRrSDY4WWhIYmdpRUdGU0NWbUdTUStUSWVVaDlyeWZWSnV0VHc5?=
 =?utf-8?B?Qm1SMVVLRjdiN2dFem1kWDFqRDZvclB6MzF0MTV1OGllL0Z3TE5yc3hxSzlL?=
 =?utf-8?B?MCtua2t4c2k4UmtadFpFOCt5eDFWS3E4NnBVQjF4ZU1vdVpjdytXSEZKMTI2?=
 =?utf-8?B?YnpwR2huZXNlK3V1SHZIT2lYUWhDWXFkTE5kandXNU1EVlBtZnQzMUFDcUha?=
 =?utf-8?B?QnkwWHpwMHhiZ0RkQjJKd3RUb0kzbG9jVjU4L1NPK0p2L1NmUk9nTkhsOThi?=
 =?utf-8?B?SmMrTVFRZ3RoWVFDUERaVVY5bGZESTl0WmEvM2p0UkFxWStTSC9OMWFNVEpG?=
 =?utf-8?B?NGR3TCt4RDNLbzQ5Z1BIbHlKMXp4bWRBWTBIQlRzOTdRQ01KRW95TUNYbHZm?=
 =?utf-8?B?VlcwODdLMk5LRUtsWkJpSlhNaDZxYXhIZWhjZVdvWXJBZFVKZnNxQ0V4RGNi?=
 =?utf-8?B?SSs5UExDYldCMVZUZ2k1Wll0dmJSMXJxRXdOdUtVRnRYNW1vK2NpeFU5TWFD?=
 =?utf-8?B?U3hTSXRyOVlDNk14SnZvRU9OQWN0ek9TMVg1dGM2TGNHNTN2a0FWaTU1Y1lI?=
 =?utf-8?B?MTB5ckxIQzcvWW1iNE9lM1RobHkwd2FlZ2NidE8vczl3NHcyd290M04yTDNv?=
 =?utf-8?B?SEh3YXZ3YzVjSmNvY2hoWUNMLzAweVdraThNZWFTZWYwci9FWjlZQnFOZ0dq?=
 =?utf-8?B?dndtVkIvRlZNYXgrekRPZVMwMGM5NlgyQzF3NEZYQjZsemZubk0ydHlLb0Fr?=
 =?utf-8?B?cjFTdTNtbkxoUStMQ09mZ0ZkR2lXTE1XcmtYM3kvenZWc0YyWXZFNGpLMUhN?=
 =?utf-8?B?WDB6WW1MSW55YzY5dlBoQlZlSTNWWUZFUmEwSVJYQmJyUjVMaTNxMHpQS1VZ?=
 =?utf-8?B?M2VGaDQxZTBMenVTUE5idzBlZWhNMFpwa3JOOHVnZWhRRGNhSzlrWmhOOW5u?=
 =?utf-8?B?SkM3QjhPQk5YVUdzay95WTBaZXBmUG9kWFh3bHRLQ2RoZUdCMlRzVitNRFln?=
 =?utf-8?B?Tm9VeU1lYUI3akNvRkI3TDVCNjRVOUwwRC9VQ2tQSmYzR0VHQWxDS2pYY0VH?=
 =?utf-8?Q?WLQBD2PLJ01fDnQ8Vd5TiOocW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a23f98a-d506-4de7-0bc2-08dd2b353b16
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 13:56:18.0698 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wCaWjr0HiY1DQnxAuJ1fJe/uNibXNPgDO54W2J/CHPjFWoa5L2DL47F+WCsPCUPa2E8QDLKRIUal9ldO1v5vDKgMFY7EppZ91NyQSxhWA7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4558
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

PiA+IEdTQyBOVk0gY29udHJvbGxlciBIVyBlcnJvcnMgb24gcXVhZCBhY2Nlc3Mgb3ZlcmxhcHBp
bmcgMUsgYm9yZGVyLg0KPiA+IEFsaWduIDY0Yml0IHJlYWQgYW5kIHdyaXRlIHRvIGF2b2lkIHJl
YWRxL3dyaXRlcSBvdmVyIDFLIGJvcmRlci4NCj4gPg0KPiA+IEFja2VkLWJ5OiBNaXF1ZWwgUmF5
bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRlciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4g
IGRyaXZlcnMvbXRkL2RldmljZXMvbXRkLWludGVsLWRnLmMgfCAzNQ0KPiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL210ZC1pbnRlbC1kZy5j
IGIvZHJpdmVycy9tdGQvZGV2aWNlcy9tdGQtDQo+IGludGVsLWRnLmMNCj4gPiBpbmRleCA3NmVm
NzE5OGZmZjguLjIzMGJmNDQ0YjdmZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL210ZC9kZXZp
Y2VzL210ZC1pbnRlbC1kZy5jDQo+ID4gKysrIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9tdGQtaW50
ZWwtZGcuYw0KPiA+IEBAIC0yMzgsNiArMjM4LDI0IEBAIHN0YXRpYyBzc2l6ZV90IGlkZ193cml0
ZShzdHJ1Y3QgaW50ZWxfZGdfbnZtICpudm0sDQo+IHU4IHJlZ2lvbiwNCj4gPiAgCQlsZW5fcyAt
PSB0b19zaGlmdDsNCj4gPiAgCX0NCj4gPg0KPiA+ICsJaWYgKCFJU19BTElHTkVEKHRvLCBzaXpl
b2YodTY0KSkgJiYNCj4gPiArCSAgICAoKHRvIF4gKHRvICsgbGVuX3MpKSAmIEdFTk1BU0soMzEs
IDEwKSkpIHsNCj4gDQo+IEknbSBzdXJlIHRoYXQgc2hvdWxkIGJlICh0byArIGxlbl9zIC0gMSku
DQo+IFVzaW5nIEdFTk1BU0soMzEsIDEwKSBjb21wbGV0ZWx5IGZhaWxzIHRvIGluZGljYXRlIHdo
YXQgaXMgYmVpbmcgdGVzdGVkLg0KDQpXaWxsIGxvb2sgYXQgaXQsIGJ1dCB0aGlzIGZvcm0gd29y
a3MgZmluZSBpbiBwcmFjdGljZS4NCj4gDQo+ID4gKwkJLyoNCj4gPiArCQkgKiBXb3JrYXJvdW5k
IHJlYWRzL3dyaXRlcyBhY3Jvc3MgMWstYWxpZ25lZCBhZGRyZXNzZXMNCj4gPiArCQkgKiAoc3Rh
cnQgdTMyIGJlZm9yZSAxaywgZW5kIHUzMiBhZnRlcikNCj4gPiArCQkgKiBhcyB0aGlzIGZhaWxz
IG9uIGhhcmR3YXJlLg0KPiA+ICsJCSAqLw0KPiA+ICsJCXUzMiBkYXRhOw0KPiA+ICsNCj4gPiAr
CQltZW1jcHkoJmRhdGEsICZidWZbMF0sIHNpemVvZih1MzIpKTsNCj4gDQo+IAlnZXRfdW5hbGln
bmVkX3UzMigpDQo+IA0KDQpDYW4ndCBmaW5kIHN1Y2ggZnVuY3Rpb24gaW4ga2VybmVsIGF0IGFs
bA0KDQo+ID4gKwkJaWRnX252bV93cml0ZTMyKG52bSwgdG8sIGRhdGEpOw0KPiA+ICsJCWlmIChp
ZGdfbnZtX2Vycm9yKG52bSkpDQo+ID4gKwkJCXJldHVybiAtRUlPOw0KPiA+ICsJCWJ1ZiArPSBz
aXplb2YodTMyKTsNCj4gPiArCQl0byArPSBzaXplb2YodTMyKTsNCj4gPiArCQlsZW5fcyAtPSBz
aXplb2YodTMyKTsNCj4gPiArCX0NCj4gDQo+IEl0IGlzbid0IGF0IGFsbCBvYnZpb3VzIHdoeSBj
b3B5aW5nIDQgYnl0ZXMgaGVscHMuDQo+IEluZGVlZCwgaWYgJ3RvJyBpcyAxMDIzIGFuZCAnbGVu
X3MnIGlzIDIgaXQgZ29lcyB0ZXJyaWJseSB3cm9uZy4NCg0KRGF0YSBpcyBhbGlnbmVkIHRvIHNp
emVvZih1MzIpIGJlZm9yZSB0aGlzIGNoZWNrLCBzbyAxMDIzIGFuZCAyIGNhbid0IGJlIGhlcmUu
DQpXZSBjYW4gY29tZSBoZXJlIG9ubHkgaWYgd2UgNGJ5dGVzIGJlZm9yZSAxayBib3VuZGFyeSBh
bmQNCndlIGFyZSByZWFkaW5nIGFsbCB0aGF0IGxlZnQgYmVmb3JlIGJvdW5kYXJ5Lg0KQWZ0ZXIg
dGhhdCB0aGUgZGF0YSB3aWxsIGJlIHNpemVvZih1NjQpIGFsaWduZWQuDQoNCj4gDQo+IAlEYXZp
ZA0KPiANCj4gPiArDQo+ID4gIAlsZW44ID0gQUxJR05fRE9XTihsZW5fcywgc2l6ZW9mKHU2NCkp
Ow0KPiA+ICAJZm9yIChpID0gMDsgaSA8IGxlbjg7IGkgKz0gc2l6ZW9mKHU2NCkpIHsNCj4gPiAg
CQl1NjQgZGF0YTsNCg0KLSAtIA0KVGhhbmtzLA0KU2FzaGENCg0KDQo=
