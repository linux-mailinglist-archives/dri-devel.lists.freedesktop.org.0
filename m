Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE4AAB84AF
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 13:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F8C10E841;
	Thu, 15 May 2025 11:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPOyE3yc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313AA10E83D;
 Thu, 15 May 2025 11:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747308254; x=1778844254;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vp8rkL3bref1Md5E/zCj8pZakFUQyIaZm/uYxGfjzxA=;
 b=OPOyE3ycbwDokNHK8LGw68I2/D5trFPNAzGpZ9rPcu37x3SdaMysabHI
 s6SU3y/D0IU3gJTdRW7t1Y8A5qEZskF4WnHRT89XRBfEyk9SrwIEw3ao6
 EBF9/hrxDnnhBMBvtuFZ3cRUIx2egVylsfVzWQvud/znwOsBDb2ka1/8t
 eLwQphXxKkxvTsJeubP4H+bIb+CvXcOV9tqnnfTfARgoTtXesga2MsrNv
 q0H6oqY0lgibPbo+1eqZZjCc4yXhsfcNhUQgv5pzphHznPCwluEXu7yvW
 5/yZNC+DKdo/phkCkFY4i+mwRQYIvxT9DJi3LsjNJZt5zuPLf6OzOy7ot Q==;
X-CSE-ConnectionGUID: x6+H3AtDQuCdio6unjTeiA==
X-CSE-MsgGUID: y4nCcYH+Q3++XDLvlcfYqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="66643630"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="66643630"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 04:24:10 -0700
X-CSE-ConnectionGUID: cwuSVGtBROeYzpgGjWxirQ==
X-CSE-MsgGUID: YFWYoh2IQuCd58AMksSGaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="138741572"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 04:24:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 04:24:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 04:24:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 04:24:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kbih6c7ruEZ/lpALtn3YvhjbkWrMqWh1+pqLrVu1uWTTWn21H6LY4VGZPr3FzlRwcWnGPvlCVJdUUCbxspJRHQ7ke5lyCWI7RwCS1wIdVQ2Sw0Sl2AaLQsqbXLI64slm+ZnUiihKHUi7hQPe3q0+egra81X5ZtZlUfFLhwXT323cC1FfKvVWQQYWtT7B44MK2xwAl6N2MZLbK7Mmm+jLkC7zRiWnKAQj9pz/Yq5/uK/oGqBtXyFpHAs4+talCLbHNkVgrLWfBKAHwMLz7Es3OfRSR9uzGPocjM/I6duJaxz9kU1ssNJnafAVSk5ycUThbHq7CmIiTqhBQL4639Hrcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vp8rkL3bref1Md5E/zCj8pZakFUQyIaZm/uYxGfjzxA=;
 b=md7oJQs0QTbDQ/A+tP6v3rQcgMWNBKy3TNW/v3Rhi1EsLCicCuSm2XyadCo2rfY3+DOgamZy1IRBgy8xMLO7OQM079xJKimhMGvBE4U9f/07oVZWEOR8KYGaFIsadvQQoqh+wLu2niDfBlpvYMkaktEfa/1oaZsXc52abxrWGwm1z1NDZuQI0qknAowqHTm6TF1KhUw4SWBH4+kAT9owT4wEXW1pobLqJmqR7rFV5yb52ukXUuMLvq9ghmGuUKDFXRpDoFPUq1lZ8KNvssWvhEW0hZg9eEm/w0qRIrthi9OrUp1GzD+mrLhcHiHfDj6SMIJPb+N2B1fxT3JWKs1nPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by LV1PR11MB8843.namprd11.prod.outlook.com (2603:10b6:408:2b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 11:23:39 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 11:23:38 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
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
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomas Winkler
 <tomasw@gmail.com>
Subject: RE: [PATCH v9 03/12] mtd: intel-dg: implement region enumeration
Thread-Topic: [PATCH v9 03/12] mtd: intel-dg: implement region enumeration
Thread-Index: AQHbtR4fMekOitQZHke4tW+4RuIcRLO6bEuAgBk0gmA=
Date: Thu, 15 May 2025 11:23:38 +0000
Message-ID: <CY5PR11MB6366AACB5EA494893CA8D16DED90A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250424132536.3043825-1-alexander.usyskin@intel.com>
 <20250424132536.3043825-4-alexander.usyskin@intel.com>
 <aBCfbaYs9CnXL2h1@black.fi.intel.com>
In-Reply-To: <aBCfbaYs9CnXL2h1@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|LV1PR11MB8843:EE_
x-ms-office365-filtering-correlation-id: 8f908714-78a5-4228-e9ac-08dd93a2f05d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TVV2OFFvZzVPVGVRRU50TGNGTGtUOU9Oai85THhDTmRFSCtPR2oyakxIZ3NU?=
 =?utf-8?B?Zkp5ZG9sRE9qVWVwRlgxeHQwaEhKS1U0N1YxTzhsQVdxYndKMEZ1Wm56Zmlo?=
 =?utf-8?B?ME4xTG1qak1IcXlzT01LRGxSa1VLbkgwLzNrUjdNTkJzbDBBd3gvT1h0Vjlr?=
 =?utf-8?B?OGNnWmNIdXpIcG5VeEoydk0ycm1NcjBDL3JnWjZYWHBBRzNtYWU4ZEJrZW91?=
 =?utf-8?B?bzE5Zk1yN2VvSlExcjdEQWxxNFd2WGJlbzNyYXdzRzd0bExPN2ZHSVYzUFFU?=
 =?utf-8?B?YXl5QWdaYmZoSUNIbklsVzl4UDU1eFhxUmhrOU8vMUIxQ1FPT1l6aUV3ZGJh?=
 =?utf-8?B?R2J4MnBHdS9MMGlhL0tCNHVJMnhocmd2bXVWYkhZOUhiVXNSVEkwaDN4dTVw?=
 =?utf-8?B?eGhmKzA4UDIxU2JIbWhGVWxPTnJZb1FTbnRzeDNHbU5TSGhPclBNQUtUQWU3?=
 =?utf-8?B?UXEzSHM3Z1lKWTNEQlFYQXhRcWQwY2tmdzEwSlhISFFZMkNHbVRjd1hZWUlN?=
 =?utf-8?B?UkxLRTFNZTNiVVp0Z1hCZldwNmpHVnc3UW00VEdsanY3aGNQd2dnK2paNHN3?=
 =?utf-8?B?OFB2b2JvUlVtN01Xc2dHRFlJK2VpSVdiY3JVYlZ4S0JUMStPL3lnNEFYK2lI?=
 =?utf-8?B?VC9HWEdMamZ4VHQwVXN5aDAvN1Z1NkFIcklHTy9GNWxBWGpUR3ZUMXFmaVI1?=
 =?utf-8?B?MUROM2NzOERzaGNHNkIyb3JVS0VTaHNwbEg4UDM3RVZvQ3k5SmhuYUhmUkhF?=
 =?utf-8?B?MERPMHZhRzVTUmU4U0RzeXhMdGI3bVAwTnJyZ0V2SHN2QlUyTUYrSFZWZUZC?=
 =?utf-8?B?b0lBZ21oL3J2NFBqZ0pyTkdGelpsKzNLTEpGTGpWb3NsWU5nWSsxdFJ0UVZk?=
 =?utf-8?B?NXIxa0YwOStQY3Y3ZmoxL3laRE5acElrS2lHS1lPWDBrakJ3VmxsZk1CQXBj?=
 =?utf-8?B?VFIzV0tnNzdscGIvMHA1Qk9VTktQZnVVQmU3dTRNU1dYcUNWYVUxcFRid3JE?=
 =?utf-8?B?Vi9jblBERW1uYzV0Yjc1VG54R1R3eXpMQktseXpiNGlEUG1UbGVENnVDRTdM?=
 =?utf-8?B?N01DWHNTTmlpdTUwSFVBMjNDQ0lwS00xdzArdXFqVXNTU1QvdlAvZENFYUdp?=
 =?utf-8?B?Zk1NaGZ6M3JxOGJCUDRTNmsxVzZmZW4xbTkvNTRwdXNaMjJBcGU3b0ZKYXJx?=
 =?utf-8?B?dVhCTWhmZlRndWFRRWcrU0xrNHRna2RpWjl2Ykh4NzVwSzgvR2FWWXJFaGFH?=
 =?utf-8?B?aUNCRy93ekQ4dDdOZ0RzaHlZL2dmMUxpcU9zZ3BoVDl2OXlCaUVKMjhaajg0?=
 =?utf-8?B?REpjRlMrZ0s3UHdqeDIwL3prRDNVaWNsSS8zbTZiT0dCOWd5dEdxc2tzTjVX?=
 =?utf-8?B?TmxRZGZFNVZ3QzdzbzhVVlVVL3VhT2Y3M3ExTDRlUGVqN0NSUDhUSjRpZVZ2?=
 =?utf-8?B?ZW5TQUZvNXRVdWd0bFVRYUg1YUl1czJ0ZE1jNm9SYllqaFJBK05QNlArVzJV?=
 =?utf-8?B?b21weTkxSU9sdG91UzExRUlZVE5VY1FGSldBKzdnTldPbEs3d2tKc0ovNTJx?=
 =?utf-8?B?QVEyWG9HelpMTm85eExCd2t0VjFCL2xJTmkzeW9RRTdBM1RGVGpCWnk4K2JZ?=
 =?utf-8?B?UGlKbEl5Ny9lQmsyTnFSWjJXeERXSE8wc214SGkzN0p0K2p5NTQwMVZobm9Y?=
 =?utf-8?B?V21UMGJOd2FQUkswcmNSdHV2K0tMSzEwTVR3ZmNzRHkrMnFaR2dMaWhsZDZn?=
 =?utf-8?B?YnB3MWZxeDAwNXpTZ0kvdlFuc2lxbFhiNEl3SC9FTjFEdFZiMXBPMHhkNDhM?=
 =?utf-8?B?elZHK0wyWWplNzdjdVRKd0VzNHZnK28rSGZYeUUvZGM3QlFkSHZXTGFYZXJ4?=
 =?utf-8?B?dFREVFBBcFhzdkl5VHRrZ0EvUGRWQ3hoUHMwRUQ1U2R1d0pkRUwrUk9SUWpt?=
 =?utf-8?B?V2cwQVZ3VUJWb3NuYzNobDRNK2s1UU5haEJHdmdSd2o4L0xXczFIWFBoOHZC?=
 =?utf-8?Q?yRlMUNDzg0+k3xE9vi63R0deBGzZqU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXVJYWF0bDJkTE0wbjI2eFRWL1ZFQ1BzUytuRldaSm1zTFpkMTJHNXRCUWlF?=
 =?utf-8?B?eWZIczJvSjVNR0c3L0pzQWMrRzdxTFNZWHczNnJQY2ZhV3ZPTzhNcXVmWTJJ?=
 =?utf-8?B?Ui9pS0xJdnNWZTQzNUszR1pmSE1tSUlSTmhiV2hFcVpSWnEvanhwbDM1T0ZL?=
 =?utf-8?B?NDE1YUd1M1Zmb2s5K2pBazdHM0JLS3FDby9HS2ExdlVpR0EwVWs4clloOFJo?=
 =?utf-8?B?a0xYQ1pvbC9xcjZNYVVUOGpCMlRoZEdFdlRvSkpVZzVXeW1Gc3A1MnhWVmFx?=
 =?utf-8?B?ODEzK2lFTFFuQ05EcHpnYWNTNDhhWTlRYW9tT3VWQkZmMlkraXNxOHplbE5p?=
 =?utf-8?B?ZmFGVGVoTXp0elJWNjArRDY3aUROOVgvQnJITlB1V3FsMW5SMWgzWVBGcVRL?=
 =?utf-8?B?Sk02TGZwVzZqSEV3UzAzZWx1Z1laRFBERmVwcGlPZGJFeklFOVRkNWZkZ2ps?=
 =?utf-8?B?MmVsV2w2SXNrRDdsc0paTFNnTmNkNkNreUd4aG02R2t5eENVekRNSCtmZm1a?=
 =?utf-8?B?eHliRGZLTkg4UGI0cU16dTZETy9VUUJDNVh1RE1yRUEvZlZDMEYvWHIzNTI4?=
 =?utf-8?B?dXhEQUFkNndPYVJ1M1hhZ2ZUdVBUWjlGczdMMXgrOXI5VUtRdDJWRkh5V1Uw?=
 =?utf-8?B?cUJaWmtCMnhQbVNoMnd3KzhlTDlGSHdzZjlVZHlodEFWakUxbmRrenk1SzRm?=
 =?utf-8?B?RjJsUlZ1OE1Fb2JnQ1FwdlBMcHJSRHF2S3B2V0gwbUJKcW15dEhPaDEzOVJt?=
 =?utf-8?B?QjNoNUN5RHJoTm10ZEVxNXVSVU9HdDJYY1Via25WUjI0aW5wVFlFTHpKQzli?=
 =?utf-8?B?cHNiSE1iT0RCNUVKZFRRS09pWXdvRm9EOVU4QmI2V21PWmR1MDJmLzFGd3ZT?=
 =?utf-8?B?UG5WNFFkREg2N2RncUdJZUcrVU93L3FibGdReDFOYmFmZG00WUVUZGxmQmhv?=
 =?utf-8?B?dzJrT01WL2tiY3EzbmhQQS9EVmdvTWpvWTAvS1l6YXZSMENzelN2QTJKcmJG?=
 =?utf-8?B?R2VXOFVaZDgyREZBRXN5MVA3c3I2czFNVEhsbnZIT1I3YzFjck1BdG1hWnZE?=
 =?utf-8?B?ZW82NHlPVXdzSmY5Q1RXaVpET1dyeEdEZmMrbkNyN1F3a0VkMDZNMlJDeGF5?=
 =?utf-8?B?eDVXTWtGZy9Hc1hEOTgzMnRLeU5jcjBJc1RHOFdlT2NxbXBvSWRGS3laZXVY?=
 =?utf-8?B?T1BLN1ZaNEswRDh2eFBXc09OdlNScStwWHFOYzhhRlZqZnM2U1VFVlZYRitn?=
 =?utf-8?B?SmFlWkFGQks2cURPSDNVUVUybjV4Skg0eldzblBHc1Z1Z3VHNDFieXdpejRt?=
 =?utf-8?B?WTAwNnhZdjNRYnk1VkpEY0ltVytWTUc0THo4S2RnT2p4Qjg3R0ZwamtSQUpI?=
 =?utf-8?B?YzlKRENGWldRZ0pObmhPTGV6UEFKblluY1poaTI4RjNZR2xSZVVvWll1Vk1k?=
 =?utf-8?B?S1dDWWpzQ0lBUTdYZW1idThNa2RjOFQrcnR2UlE0RC8yRXRUT2plZjV6Mkhp?=
 =?utf-8?B?cHFOQ0YvUU5aT1ZRU2VKZlcwdUYxcDBWYjNobFZUaEY5eFg5bUZ0dVk4MTYw?=
 =?utf-8?B?THQ1STVJenVEMXdsVERxbUJMM281eUlrWGtpbzQycGJXV05DU254SjBtNG1h?=
 =?utf-8?B?RnRsWDdmL0U0c0FxTG05S3NEdjNlMEl2bEhYZzBPdS9NQ2hIamY5dDg4bmV0?=
 =?utf-8?B?YTVxSm5mL250bmU0WTJZclozN0VuTUhqTi9IcnJYdnVrZ3RsbWpmRVJJSVJM?=
 =?utf-8?B?eGYxa0NxRWhSNDVONG9KSVpzUGRJU0JVN2xlSGFEU3pySnl0R0l4QVlFQ0hw?=
 =?utf-8?B?SVNPTnlTTW9UTE1TcklQUlg4Zm0rN2RaLy9IU1IrdFcrS2ZvR0k2OHhSVC8x?=
 =?utf-8?B?a09RdzVmcm12ajdjK3hkeEZPRE5CQXE4VnRaQ3Y3WU1uaHJqWmtRSzdrUldB?=
 =?utf-8?B?Y0JPTGNhbUQzUXlVYlQ3SXJqS2c4cmREbmZaYldCMEpvYUM1bjF6aGs2Mllz?=
 =?utf-8?B?N0dGcWx5NkwvbTM3bW1USlYwcE5SVGJWbjExYjdyVkZ4a3R3Sk9JRnphaVhy?=
 =?utf-8?B?SDVCVjBvQi8zWG1PUzRJWTN4NEhTT2VqQURLK3hUYnVybHRDbXR4VFNrMHVG?=
 =?utf-8?Q?fgEWBzEkcrCLPfgJ5/Fqk8AvM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f908714-78a5-4228-e9ac-08dd93a2f05d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 11:23:38.2663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hAB93PqItBabeXiIwh1/wYrRHL0EWxly+vXU/eQK6bvyqWTQNEjh5J53/ofCzgLD4YpEbiEnQcdCjk5LaKOZKGBL5y6DM7cZwkQgozGtqpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8843
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY5IDAzLzEyXSBtdGQ6IGludGVsLWRnOiBpbXBsZW1lbnQg
cmVnaW9uIGVudW1lcmF0aW9uDQo+IA0KPiBPbiBUaHUsIEFwciAyNCwgMjAyNSBhdCAwNDoyNToy
N1BNICswMzAwLCBBbGV4YW5kZXIgVXN5c2tpbiB3cm90ZToNCj4gPiBJbiBpbnRlbC1kZywgdGhl
cmUgaXMgbm8gYWNjZXNzIHRvIHRoZSBzcGkgY29udHJvbGxlciwNCj4gPiB0aGUgaW5mb3JtYXRp
b24gaXMgZXh0cmFjdGVkIGZyb20gdGhlIGRlc2NyaXB0b3IgcmVnaW9uLg0KPiANCj4gLi4uDQo+
IA0KPiA+IEBAIC0yMiw5ICsyNCwxOTkgQEAgc3RydWN0IGludGVsX2RnX252bSB7DQo+ID4gIAkJ
dTggaWQ7DQo+ID4gIAkJdTY0IG9mZnNldDsNCj4gPiAgCQl1NjQgc2l6ZTsNCj4gPiArCQl1bnNp
Z25lZCBpbnQgaXNfcmVhZGFibGU6MTsNCj4gPiArCQl1bnNpZ25lZCBpbnQgaXNfd3JpdGFibGU6
MTsNCj4gPiAgCX0gcmVnaW9uc1tdIF9fY291bnRlZF9ieShucmVnaW9ucyk7DQo+ID4gIH07DQo+
ID4NCj4gPiArI2RlZmluZSBOVk1fVFJJR0dFUl9SRUcgICAgICAgMHgwMDAwMDAwMA0KPiA+ICsj
ZGVmaW5lIE5WTV9WQUxTSUdfUkVHICAgICAgICAweDAwMDAwMDEwDQo+ID4gKyNkZWZpbmUgTlZN
X0FERFJFU1NfUkVHICAgICAgIDB4MDAwMDAwNDANCj4gPiArI2RlZmluZSBOVk1fUkVHSU9OX0lE
X1JFRyAgICAgMHgwMDAwMDA0NA0KPiA+ICsvKg0KPiA+ICsgKiBbMTU6MF0tRXJhc2Ugc2l6ZSA9
IDB4MDAxMCA0SyAweDAwODAgMzJLIDB4MDEwMCA2NEsNCj4gPiArICogWzIzOjE2XS1SZXNlcnZl
ZA0KPiA+ICsgKiBbMzE6MjRdLUVyYXNlIE1FTSBSZWdpb25JRA0KPiA+ICsgKi8NCj4gPiArI2Rl
ZmluZSBOVk1fRVJBU0VfUkVHICAgICAgICAgMHgwMDAwMDA0OA0KPiA+ICsjZGVmaW5lIE5WTV9B
Q0NFU1NfRVJST1JfUkVHICAweDAwMDAwMDcwDQo+ID4gKyNkZWZpbmUgTlZNX0FERFJFU1NfRVJS
T1JfUkVHIDB4MDAwMDAwNzQNCj4gPiArDQo+ID4gKy8qIEZsYXNoIFZhbGlkIFNpZ25hdHVyZSAq
Lw0KPiA+ICsjZGVmaW5lIE5WTV9GTFZBTFNJRyAgICAgICAgICAweDBGRjBBNTVBDQo+ID4gKw0K
PiA+ICsjZGVmaW5lIE5WTV9NQVBfQUREUl9NQVNLICAgICBHRU5NQVNLKDcsIDApDQo+ID4gKyNk
ZWZpbmUgTlZNX01BUF9BRERSX1NISUZUICAgIDB4MDAwMDAwMDQNCj4gPiArDQo+ID4gKyNkZWZp
bmUgTlZNX1JFR0lPTl9JRF9ERVNDUklQVE9SICAwDQo+ID4gKy8qIEZsYXNoIFJlZ2lvbiBCYXNl
IEFkZHJlc3MgKi8NCj4gPiArI2RlZmluZSBOVk1fRlJCQSAgICAgIDB4NDANCj4gPiArLyogRmxh
c2ggUmVnaW9uIF9fbiAtIEZsYXNoIERlc2NyaXB0b3IgUmVjb3JkICovDQo+ID4gKyNkZWZpbmUg
TlZNX0ZMUkVHKF9fbikgKE5WTV9GUkJBICsgKChfX24pICogNCkpDQo+ID4gKy8qICBGbGFzaCBN
YXAgMSBSZWdpc3RlciAqLw0KPiA+ICsjZGVmaW5lIE5WTV9GTE1BUDFfUkVHICAweDE4DQo+ID4g
KyNkZWZpbmUgTlZNX0ZMTVNUUjRfT0ZGU0VUIDB4MDBDDQo+ID4gKw0KPiA+ICsjZGVmaW5lIE5W
TV9BQ0NFU1NfRVJST1JfUENJRV9NQVNLIDB4Nw0KPiA+ICsNCj4gPiArI2RlZmluZSBOVk1fRlJF
R19CQVNFX01BU0sgR0VOTUFTSygxNSwgMCkNCj4gPiArI2RlZmluZSBOVk1fRlJFR19BRERSX01B
U0sgR0VOTUFTSygzMSwgMTYpDQo+ID4gKyNkZWZpbmUgTlZNX0ZSRUdfQUREUl9TSElGVCAxMg0K
PiA+ICsjZGVmaW5lIE5WTV9GUkVHX01JTl9SRUdJT05fU0laRSAweEZGRg0KPiANCj4gU2hvdWxk
IHdlIG1vdmUgdGhlc2UgdG8gYSBoZWFkZXI/DQpUaGV5IGFyZSB1c2VkIG9ubHkgaW4gdGhpcyBm
aWxlLCBub3Qgc2hhcmVkIHRvIGFueW9uZSwgd2h5IHRvIHB1dCBpbiBoZWFkZXI/DQoNCj4gDQo+
ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBpZGdfbnZtX3NldF9yZWdpb25faWQoc3RydWN0IGludGVs
X2RnX252bSAqbnZtLCB1OA0KPiByZWdpb24pDQo+ID4gK3sNCj4gPiArCWlvd3JpdGUzMigodTMy
KXJlZ2lvbiwgbnZtLT5iYXNlICsgTlZNX1JFR0lPTl9JRF9SRUcpOw0KPiA+ICt9DQo+ID4gKw0K
PiA+ICtzdGF0aWMgaW5saW5lIHUzMiBpZGdfbnZtX2Vycm9yKHN0cnVjdCBpbnRlbF9kZ19udm0g
Km52bSkNCj4gPiArew0KPiA+ICsJdm9pZCBfX2lvbWVtICpiYXNlID0gbnZtLT5iYXNlOw0KPiA+
ICsNCj4gPiArCXUzMiByZWcgPSBpb3JlYWQzMihiYXNlICsgTlZNX0FDQ0VTU19FUlJPUl9SRUcp
ICYNCj4gTlZNX0FDQ0VTU19FUlJPUl9QQ0lFX01BU0s7DQo+ID4gKw0KPiA+ICsJLyogcmVzZXQg
ZXJyb3IgYml0cyAqLw0KPiA+ICsJaWYgKHJlZykNCj4gPiArCQlpb3dyaXRlMzIocmVnLCBiYXNl
ICsgTlZNX0FDQ0VTU19FUlJPUl9SRUcpOw0KPiA+ICsNCj4gPiArCXJldHVybiByZWc7DQo+ID4g
K30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbmxpbmUgdTMyIGlkZ19udm1fcmVhZDMyKHN0cnVjdCBp
bnRlbF9kZ19udm0gKm52bSwgdTMyIGFkZHJlc3MpDQo+ID4gK3sNCj4gPiArCXZvaWQgX19pb21l
bSAqYmFzZSA9IG52bS0+YmFzZTsNCj4gPiArDQo+ID4gKwlpb3dyaXRlMzIoYWRkcmVzcywgYmFz
ZSArIE5WTV9BRERSRVNTX1JFRyk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIGlvcmVhZDMyKGJhc2Ug
KyBOVk1fVFJJR0dFUl9SRUcpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IGlkZ19u
dm1fZ2V0X2FjY2Vzc19tYXAoc3RydWN0IGludGVsX2RnX252bSAqbnZtLCB1MzINCj4gKmFjY2Vz
c19tYXApDQo+ID4gK3sNCj4gPiArCXUzMiBmbG1hcDE7DQo+ID4gKwl1MzIgZm1iYTsNCj4gPiAr
CXUzMiBmbXN0cjQ7DQo+ID4gKwl1MzIgZm1zdHI0X2FkZHI7DQo+IA0KPiBOaXQ6IFRoZXNlIGFy
ZSBpbiBvcmRlciBvZiBhcHBlYXJhbmNlIHZzIHJldmVyc2UgeG1hcyB0cmVlIGluIG90aGVyIHBs
YWNlcy4NCj4gUGVyaGFwcyBtYWtlIHRoZW0gY29uc2lzdGVudD8NCldpbGwgZG8NCg0KPiANCj4g
PiArCWlkZ19udm1fc2V0X3JlZ2lvbl9pZChudm0sIE5WTV9SRUdJT05fSURfREVTQ1JJUFRPUik7
DQo+ID4gKw0KPiA+ICsJZmxtYXAxID0gaWRnX252bV9yZWFkMzIobnZtLCBOVk1fRkxNQVAxX1JF
Ryk7DQo+ID4gKwlpZiAoaWRnX252bV9lcnJvcihudm0pKQ0KPiA+ICsJCXJldHVybiAtRUlPOw0K
PiA+ICsJLyogR2V0IEZsYXNoIE1hc3RlciBCYXNlciBBZGRyZXNzIChGTUJBKSAqLw0KPiA+ICsJ
Zm1iYSA9IChGSUVMRF9HRVQoTlZNX01BUF9BRERSX01BU0ssIGZsbWFwMSkgPDwNCj4gTlZNX01B
UF9BRERSX1NISUZUKTsNCj4gPiArCWZtc3RyNF9hZGRyID0gZm1iYSArIE5WTV9GTE1TVFI0X09G
RlNFVDsNCj4gPiArDQo+ID4gKwlmbXN0cjQgPSBpZGdfbnZtX3JlYWQzMihudm0sIGZtc3RyNF9h
ZGRyKTsNCj4gPiArCWlmIChpZGdfbnZtX2Vycm9yKG52bSkpDQo+ID4gKwkJcmV0dXJuIC1FSU87
DQo+ID4gKw0KPiA+ICsJKmFjY2Vzc19tYXAgPSBmbXN0cjQ7DQo+ID4gKwlyZXR1cm4gMDsNCj4g
PiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGJvb2wgaWRnX252bV9yZWdpb25fcmVhZGFibGUodTMy
IGFjY2Vzc19tYXAsIHU4IHJlZ2lvbikNCj4gPiArew0KPiA+ICsJaWYgKHJlZ2lvbiA8IDEyKQ0K
PiANCj4gQW55dGhpbmcgc3BlY2lhbCBhYm91dCAxMj8gU2hvdWxkIGl0IGhhdmUgYSBtYWNybyBk
ZWYgc29tZXdoZXJlPw0KPiANCg0KVGhlIGFjY2VzcyBiaXRzIGFyZSBzZXBhcmF0ZWQgZm9yIGZp
cnN0IDEyIHJlZ2lvbnMgYW5kIGxhc3QgNC4NCk15IGZlZWxpbmcgdGhhdCBtYWtpbmcgYmVsb3cg
bnVtYmVycyAjZGVmaW5lIHdpbGwgbWFrZQ0KY29kZSBsZXNzIHJlYWRhYmxlLg0KDQo+ID4gKwkJ
cmV0dXJuIGFjY2Vzc19tYXAgJiBCSVQocmVnaW9uICsgOCk7IC8qIFsxOTo4XSAqLw0KPiA+ICsJ
ZWxzZQ0KPiA+ICsJCXJldHVybiBhY2Nlc3NfbWFwICYgQklUKHJlZ2lvbiAtIDEyKTsgLyogWzM6
MF0gKi8NCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGJvb2wgaWRnX252bV9yZWdpb25fd3Jp
dGFibGUodTMyIGFjY2Vzc19tYXAsIHU4IHJlZ2lvbikNCj4gPiArew0KPiA+ICsJaWYgKHJlZ2lv
biA8IDEyKQ0KPiANCj4gRGl0dG8uDQo+IA0KPiA+ICsJCXJldHVybiBhY2Nlc3NfbWFwICYgQklU
KHJlZ2lvbiArIDIwKTsgLyogWzMxOjIwXSAqLw0KPiA+ICsJZWxzZQ0KPiA+ICsJCXJldHVybiBh
Y2Nlc3NfbWFwICYgQklUKHJlZ2lvbiAtIDgpOyAvKiBbNzo0XSAqLw0KPiA+ICt9DQo+IA0KPiBS
YWFnDQoNCi0gLSANClRoYW5rcywNClNhc2hhDQoNCg0K
