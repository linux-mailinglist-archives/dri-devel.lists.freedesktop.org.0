Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7B68BAA07
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 11:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB9310FA9F;
	Fri,  3 May 2024 09:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dey6ApSg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DE810FA9F;
 Fri,  3 May 2024 09:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714729302; x=1746265302;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7J9F4u7t9fXjrfVKIx9C1KzSHZ8ni5It0sFDjBkF0tM=;
 b=dey6ApSgDY74g9jYOlckUW4FQ0p/at8qg854u8ewsTqNZVti8T8yY2qJ
 ORL4ZX5/kMcyCNuyf3Td8Nq8mqMf/e1EaihF8bPT28L4hCPtGFxDR54f4
 KBKLLT/119qp/ftRlq9b0GD8mdEDt2dz+y1ac6wyBxPE5g1DvQvGLh5XX
 JOKyk/AQToCT+PNhD2JvSI5b8dpj0XKjxF4Wk1QbLA/wINzISRhMUIlx9
 7Rs7W6HYmSwKMsaqwdfj/EMp1Z9Ny7oVTDAENnSJY5V+0oQcQbep3pNcE
 iD+W40aXWnRIULHJcYuJn0yjbKt5K1QeBt57JJqYJIAKHQ2d1DG72Bs3O A==;
X-CSE-ConnectionGUID: 1STJWJQESE6Ip4JafF3mzQ==
X-CSE-MsgGUID: b/Hq1502SB2kA9GTOyU5gQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="21944558"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="21944558"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 02:40:50 -0700
X-CSE-ConnectionGUID: R9o9b4a8Ty+fyqN7tI00Tw==
X-CSE-MsgGUID: 33fqC/DwRdSOA5sEu7dIAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27815176"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 02:40:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 02:40:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 02:40:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 02:40:48 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 02:40:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lq2I4Ojlu1gLNZ6GnDzSTv87ZJ7ULYk8opx6ru29Px48dD44GC9/jr75E7pQw1TjC886HB4pRhjnWc1AQ5mJZySjbApK+wqr9V0jqUkcgLGJq4vT4s7FJtaNToHPjc9DvfK4JA+cYySNJ71e51+Hq+lnMiNRuNCf4WOq0rwmSjRnmJEuVCBnVQyCQqkUAIqTtbQ7USld8Ujr7B9iIodVx4dKHccVJlYF+mw9zgaI4VzXZOGjPTn/Pk3+iJOaCFYhf4+I5eME2tEO0IERP6i6/rI3iZlIDaLPX23Y8DyoL1+5Mr/zwyT7dgfXcyCmct6UAlmpzINENIxcebEpqKdccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7J9F4u7t9fXjrfVKIx9C1KzSHZ8ni5It0sFDjBkF0tM=;
 b=MVEOQgFFl8bgNl67J0R4D5w9rKGYL2YKWlVCp8g10Q2lSW4WoDmz80+exhicXsNoG0jYdH6/8L8Rh3uUw5FKaAHoA5bItmOcinQBeTpQeURAbuI5WH7l8J4xYYZDSkymbZvLCBFzmLeRH0CjepHLBFciReUciDJr/Y5CfJSd7GlNc7MznSBPNjoNYbJ/9rd3SHpIfKifI44MfZmoJEGSTvYYccDI8ktyOPIk2hBnhvuUyWuts01GmDHpP3zWagZCt5iK5EWLf8yJtuGlUx0wic6snNeykANaLbofXUB5Tcqv0oab2UoL2EhhXaAILiV9gM+/uSXjIVgoH7W1QmAenA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CY8PR11MB7780.namprd11.prod.outlook.com (2603:10b6:930:78::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.35; Fri, 3 May 2024 09:40:41 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f%5]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 09:40:41 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v3 4/6] drm/i915/alpm: Add compute config for lobf
Thread-Topic: [PATCH v3 4/6] drm/i915/alpm: Add compute config for lobf
Thread-Index: AQHalnjV67PoszZcv02I3ugSYPFh3rGFJ3aAgAAXNwCAABA1gA==
Date: Fri, 3 May 2024 09:40:41 +0000
Message-ID: <035b13047e35db6a46ce53b8be88b087c444124f.camel@intel.com>
References: <20240424183820.3591593-1-animesh.manna@intel.com>
 <20240424183820.3591593-5-animesh.manna@intel.com>
 <914be5e4dc5c6bebb03511637fb104126f141247.camel@intel.com>
 <PH7PR11MB59811611ADCC1B3DCBEA3830F91F2@PH7PR11MB5981.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB59811611ADCC1B3DCBEA3830F91F2@PH7PR11MB5981.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CY8PR11MB7780:EE_
x-ms-office365-filtering-correlation-id: 2812e062-5e73-41aa-7520-08dc6b5518fa
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?SUtwZlJEeTdhemROcy9oWjdHRkJQOTJWUVdIdzFYV0FBZStXN1ViSFFIemha?=
 =?utf-8?B?ZjZ1MWVSQ20xaUFUVERWaGVMZXplRmw4NXMxaDUxK3I3TVZLbTJNVG1WOG1T?=
 =?utf-8?B?WjhJcEpBdldHODdhMEU2bG50djdKSkFubFYzUHRSSGNUeWk3UTVXUXBHN0Nj?=
 =?utf-8?B?b3d0OHpydVFwb0U2SnBzN2JwYjQwV2VpemRJRk9YS1VTRURKalIrRE9JOHMz?=
 =?utf-8?B?cXJscWI1dEVtMkg2cXVKdEQ1dCtkVzk4cmNYMzdvWE0ycGIzTWptcEdyMlBw?=
 =?utf-8?B?aU01TGdwVDdVRlNNQlpPRWhuMXJGejQ1MFg4YTJCWGxrdWdZWTlldlZ0T3p6?=
 =?utf-8?B?VUM0TTVmUHppTFJWM3IveVloOUxPeG82UldWME1IVW1MN0poMFFTaTJnUi9Z?=
 =?utf-8?B?V2JrUDJGa3paODA5MGZKQ2FlQ25EU0NyZC83aE41VUNCanhYQlZyWjJlWkJX?=
 =?utf-8?B?ZE4yUmM0OVJhRW5CYUl3UnFrR1J3ZzhJcldmT1QyZlBTS2h0S3lCTHdJbFFr?=
 =?utf-8?B?UFc1T0RiNTVTUlBwL29FVkkvWGJ6blJkMlZjY3RSVURDaWxKcmFlSmdtSHpO?=
 =?utf-8?B?RlMxaXJEODZrS28vcHBrMzF6V05sUHd1VGlSbFdNcFJtTmNrVDBBcEV0Vmgv?=
 =?utf-8?B?YUdrTHJSTXBPOVI2ekxaTWUvc1JLcjZYZzNOWldlUlZxYWpKemxHTW1TSi9z?=
 =?utf-8?B?a2pMbWRNazcrakdhNG9QYnExcGlaQld5aDVTdVVuNlAzdW53YVFUam13bEpO?=
 =?utf-8?B?Mm1lVUsyVWVjOUVIVStsN01ndUM3S0lkTDNPcHo5cWY1MWY2T2JlaXlNcTRN?=
 =?utf-8?B?MUQyT1R5VStUTTcxZCtjcXlHZlNXWVZEekRVeXlnQm1FUW5Zd3RPR1c4QlJl?=
 =?utf-8?B?ckNrRzZ5eVJXamlwc1J4QjBVTmVOT2VTdDExaGlsaHViNTNJWU1nNnRsazA2?=
 =?utf-8?B?V0lBZ1FXZkZHcU9DdW51TWlETXFQUkVEUzBPUnR5ZUNyVGNXWTczdERrU3gv?=
 =?utf-8?B?NUpBWmpKT3dCRDZIdzFYYStPYU1OMzVnZlNzSHZhR0J4RVY3dlVtZFNzSkFx?=
 =?utf-8?B?SjlqellzcG1pd0tSNXZaSFpycTVheVBuQVR6Z3QyQTlWSUpjREk5WENYbWtQ?=
 =?utf-8?B?NVkxR05CUisrSExYdXdhWGZYTTJkVEVneC9VOW5SRXZ3bG9WT2FzZ0N1cFph?=
 =?utf-8?B?SFAwakcvTVFPeHB5WHZqL2lhS3BzUUNGaWdmdHhYM05rRC9aVVRWcDcza2Rm?=
 =?utf-8?B?eU96SzhuK0Exa2NrdmIwQ1lLb3NJUldTL2RjNmVXSXlBdTU3eng4M2o1QkQ3?=
 =?utf-8?B?ZmdDenFQZXI3MExsWVFJeGx4Z0dFTXRhQTdMMHdwNzVzNmtZUEh2QTJSUTY5?=
 =?utf-8?B?UEVwa2NYdXhiaGFmK1FDaXZ1bUZMTkc2RWhuZ01GRzF1V0NzRnE5MlBha1Jl?=
 =?utf-8?B?dmVsYXp1QU1yNW5ORGdVb1RBZGhPUzQ3VGpCd2FqVnFpR2JDbjl0d3p5SkJ3?=
 =?utf-8?B?cVB6VERWTU1IZWFneFQxdGlCNUpzSGdjN2VIWXkrZzB1d3c0dnhZdDVGMzMv?=
 =?utf-8?B?K1dxOFZmSk1BNVVDVjk4cURLd2pzUU9wRElZU3hlTlFQanB6WTk3MXQxSU1W?=
 =?utf-8?B?T2tIOG8wSWtWYkh3RzQyK1VxVnZDb25XclNXdzkrY1BNREQ0OFBESWwzbTJ0?=
 =?utf-8?B?b2FYY0FSeDVZVllhWDZ3MDRFdktKeEhDQUVyYlAzRDlMUjlocTBmV0FtdFgy?=
 =?utf-8?B?QVlIdExVeEdHZVRFY3FjdlRMc1RsMTUwaFNkMnNWNDkrd1QvZUsxV2l4NUZt?=
 =?utf-8?B?Vlg1UTJrL2JUS1drUktKQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEtXNk5HMHIxb0Z5dEJhajBHUERBTkU4OGFmczJ6d2J0VzVIWnFVaTRPM0pY?=
 =?utf-8?B?SjRRRmgzTno1U3JmS21mWHl2cGtUT2o5NUdMUmdOb0FOUU9oT3hOalpnMWVJ?=
 =?utf-8?B?R25YMmUySlJsV0pscGZlQ2RoYkhTamtZczJiT2NzV1pRSnpCSERxQTVMY0hn?=
 =?utf-8?B?Z004MkJzWitjS3RXYk0zRGpJT0xJdDIwSmxTd21OSXZIQmt3UWpaYm0rZmY2?=
 =?utf-8?B?bndNRGZkbmpxdXFsU0lqQXNxSlBVOUlLSUcvejNNQWdoUmFUZHhUSlFZZGk1?=
 =?utf-8?B?dEx4ZnREdnhZblU1aXkvVHZyZGVMYjNlWlFta0FFcWVIcW5Rd3QybVBlLzEy?=
 =?utf-8?B?QVR4cnlLTGdZTFdCdG5DM3o1bG5MYzFJMXNpOEUrRkV5YTVSTUZJQU1CdVhj?=
 =?utf-8?B?V0lBbHI5NmF0bWdvenF0Nmh1OG1JK09xS1Y0d01UTHZiVzNiZmJKandSVzNJ?=
 =?utf-8?B?YzRIOFdIYVNaYVhFd0ZsaTlvVkdFMjhPZ2JNMXBjWSszM3VRUVdEaGxObmpr?=
 =?utf-8?B?U2RtZlZzQ3pocUdVUmd6VUNhdlREQjQ0OGJaWkEvelVJNEFaMHZrc0pUMnZq?=
 =?utf-8?B?bUNia2RDNWY0VWppbW0vZ0hQTEx0clUxVXphSkpmdTdLSlJwanpZc1lFQWwv?=
 =?utf-8?B?a2tFaTVxSmt6SWNuVjF2Zk9pc1k2MEFwckJxa2tOVjBHTGhsRmdYUHdtdDg3?=
 =?utf-8?B?cTJOUGw4aVBSOStZbGVHNHRiQno2M1VvYkFlWVlHL0RWSGtwZ2M4Nk0wNnoy?=
 =?utf-8?B?Q2xDY0VFWm9sQ1g1eWM5VEJhMjNGV0ZSQ1BMZWVYc1Arcld3V3h4M2NJOHdO?=
 =?utf-8?B?WTFjaVdYcm9hRjZhdDl1amlPR1pwTHNaL29NbS9OL1kyT1ZtN2hCdTBTNGpl?=
 =?utf-8?B?eGFsNk9EUVVibGt0K003MENDQkU2QmV6UzlsbmFrOHU3S1VwQk1qYXhXNG9u?=
 =?utf-8?B?RS9kRUhkU3dxZ2xEMnVwcDV6OEh1djVEWWZVQlptUC9JTEdYem1tVUQyTFFh?=
 =?utf-8?B?YmpCTytqR05USm4vMXVUajNUR3NCdjB4cUxrbER3djFrVysrZklTL0NkWUZh?=
 =?utf-8?B?MVVLTTYrdHFyVU8xVCtsWk1KNkZoVFVEMERKMG5JbmU2TndBazQ2MXdhQk85?=
 =?utf-8?B?cWZKL0hFR0lsanhBUFcxOWROcTdINnlTV3h6N2x4djMzQkw4eDJYVUs3RWhk?=
 =?utf-8?B?K2RYQ2ZxZ280TnRQMEhqRlIzYlhMcEd1QXI5Vm9zMjQ5UWVtUFdxMW9JRTNL?=
 =?utf-8?B?S0F6cTdMMm9hejI1THRGak5BR0c1UnZOOVFia0VoQVZpZ0pSbUxjTkN1dDNE?=
 =?utf-8?B?YnNhMkJNT204U1NUWUhuZEdoKy9OTDR4RzFhaFk4MnI4T3lGVjFkcWhScHV6?=
 =?utf-8?B?eitVRXNWeTNtSGJ3eHhHdWZFdHJqd1VBOFYxMkhVcjNxR2R6bU9Fenl2RmhQ?=
 =?utf-8?B?WlVvNUV4d1U0OThNNEdPL2ZLZFlCdmQ3enp5ZDlMWGt5cU9WQU1KSHV2WXFl?=
 =?utf-8?B?OGJSUHBsMEtTeko0OXc5N08rU09ubDk0N2JvQjV3MkNRbExGVkhNbU1XMnQ2?=
 =?utf-8?B?OXlna3UxNUtURGZESU9xa0tuNEFjWWRpUHYrY2RuQ2E3a1lkczV4YXNhYW0w?=
 =?utf-8?B?UFBZRTRmRHhiYkpvNzN5VkJjTllSK2ZxWWNCaCtNSkpOUlFteXVpWDFra2l3?=
 =?utf-8?B?YW54ZW0ybWNPemQzTmx2cmJoTXE2eXppNmk3UXUyRUhZZm9ZYU1Fb1AyRTBM?=
 =?utf-8?B?djZnaVBLSFc1TlpiOEdNTEhXNDdoRW0wUExqOTIwNitkeXU4ZGwwWlJvQlNB?=
 =?utf-8?B?YmxWQ0YrTS9SeXhCOHBObmloTitKcm5UR2FLYUR5WkdHdnVEOTRyTlpWVGNW?=
 =?utf-8?B?aktaMW5QL2w5Vm82Mzd6L1JZT1k0dVd2S0dBcEg3Nkl4cGpDSlVOVHVzR2dv?=
 =?utf-8?B?V1Vlb2g1R2Uvc3VNMnR2N3dDUUNiS09JRzcwM0xSa1hXeGdHNC94ck4wYmxY?=
 =?utf-8?B?eXBBUlRobnk5M3BoQndBZlFxRE1CU3BuN0FFb1lPb0Z3Nm9OcTNWeDdYaG0x?=
 =?utf-8?B?WkhtL0RtTW83TWlLUWxQK3RwT3BRalhLQ2J2aFp5bE1SM2lxZlM0WVJmNnM4?=
 =?utf-8?B?ODZMcGczd1NhMWFmaUM2bm9PTzNVc3E4WVAvVEZoQjMreXp4U2VxMjdZR0hB?=
 =?utf-8?B?Y2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0533A20E576874BBB26BAD6A57A6EAD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2812e062-5e73-41aa-7520-08dc6b5518fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 09:40:41.4802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O7an6JKyF98Q/jK7HdY9h6A34wYWvTt2uOMg5NcuYu5z4BWVoJUOE5VrBA4YhmJY2DpcnjEszIanALy0jwCKnSPhdA+ijkdLRCib0w3uOU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7780
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

T24gRnJpLCAyMDI0LTA1LTAzIGF0IDA4OjQyICswMDAwLCBNYW5uYSwgQW5pbWVzaCB3cm90ZToK
PiAKPiAKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBIb2dhbmRlciwg
Sm91bmkgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4KPiA+IFNlbnQ6IEZyaWRheSwgTWF5IDMs
IDIwMjQgMTI6NDkgUE0KPiA+IFRvOiBNYW5uYSwgQW5pbWVzaCA8YW5pbWVzaC5tYW5uYUBpbnRl
bC5jb20+OyBpbnRlbC0KPiA+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IENjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBNdXJ0aHksIEFydW4gUgo+ID4gPGFydW4uci5t
dXJ0aHlAaW50ZWwuY29tPjsgTmlrdWxhLCBKYW5pIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4g
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDQvNl0gZHJtL2k5MTUvYWxwbTogQWRkIGNvbXB1dGUg
Y29uZmlnIGZvcgo+ID4gbG9iZgo+ID4gCj4gPiBPbiBUaHUsIDIwMjQtMDQtMjUgYXQgMDA6MDgg
KzA1MzAsIEFuaW1lc2ggTWFubmEgd3JvdGU6Cj4gPiA+IExpbmsgT2ZmIEJldHdlZW4gQWN0aXZl
IEZyYW1lcywgaXMgYSBuZXcgZmVhdHVyZSBmb3IgZURQCj4gPiA+IHRoYXQgYWxsb3dzIHRoZSBw
YW5lbCB0byBnbyB0byBsb3dlciBwb3dlciBzdGF0ZSBhZnRlcgo+ID4gPiB0cmFuc21pc3Npb24g
b2YgZGF0YS4gVGhpcyBpcyBhIGZlYXR1cmUgb24gdG9wIG9mIEFMUE0sIEFTIFNEUC4KPiA+ID4g
QWRkIGNvbXB1dGUgY29uZmlnIGR1cmluZyBhdG9taWMtY2hlY2sgcGhhc2UuCj4gPiA+IAo+ID4g
PiB2MTogUkZDIHZlcnNpb24uCj4gPiA+IHYyOiBBZGQgc2VwYXJhdGUgZmxhZyBmb3IgYXV4bGVz
cy1hbHBtLiBbSmFuaV0KPiA+ID4gdjM6Cj4gPiA+IC0gaW50ZWxfZHAtPmxvYmZfc3VwcG9ydGVk
IHJlcGxhY2VkIHdpdGggY3J0Y19zdGF0ZS0+aGFzX2xvYmYuCj4gPiA+IFtKb3VuaV0KPiA+ID4g
LSBBZGQgRElTUExBWV9WRVIoKSBjaGVjay4gW0pvdW5pXQo+ID4gPiAtIE1vZGlmeSBmdW5jdGlv
biBuYW1lIG9mIGdldF9hdXhfbGVzc19zdGF0dXMuIFtKYW5pXQo+ID4gPiAKPiA+ID4gU2lnbmVk
LW9mZi1ieTogQW5pbWVzaCBNYW5uYSA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+Cj4gPiA+IC0t
LQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jwqDCoMKg
wqAgfCA0OAo+ID4gPiArKysrKysrKysrKysrKysrKysrCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmjCoMKgwqDCoCB8wqAgNSArKwo+ID4gPiDCoC4uLi9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaMKgwqDCoCB8wqAgNCArKwo+ID4g
PiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuY8KgwqDCoMKgwqDCoCB8
wqAgNCArKwo+ID4gPiDCoDQgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKQo+ID4gPiAK
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxw
bS5jCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMKPiA+
ID4gaW5kZXggMTNiYWMzZThjOGZhLi4zYmI2OWVkMTZhYWIgMTAwNjQ0Cj4gPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jCj4gPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jCj4gPiA+IEBAIC0xMSw2ICsxMSwx
NiBAQAo+ID4gPiDCoCNpbmNsdWRlICJpbnRlbF9kcF9hdXguaCIKPiA+ID4gwqAjaW5jbHVkZSAi
aW50ZWxfcHNyX3JlZ3MuaCIKPiA+ID4gCj4gPiA+ICtib29sIGludGVsX2FscG1fZ2V0X2F1eF9s
ZXNzX3N0YXR1cyhzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKQo+ID4gPiArewo+ID4gPiArwqDC
oMKgwqDCoMKgwqB1OCBhbHBtX2NhcHMgPSAwOwo+ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKgwqDC
oGlmIChkcm1fZHBfZHBjZF9yZWFkYigmaW50ZWxfZHAtPmF1eCwKPiA+ID4gRFBfUkVDRUlWRVJf
QUxQTV9DQVAsCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAmYWxwbV9jYXBzKSAhPSAxKQo+ID4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcmV0dXJuIGZhbHNlOwo+ID4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4g
YWxwbV9jYXBzICYgRFBfQUxQTV9BVVhfTEVTU19DQVA7Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4g
wqAvKgo+ID4gPiDCoCAqIFNlZSBCc3BlYzogNzE2MzIgZm9yIHRoZSB0YWJsZQo+ID4gPiDCoCAq
Cj4gPiA+IEBAIC0yNDIsNiArMjUyLDQ0IEBAIGJvb2wgaW50ZWxfYWxwbV9jb21wdXRlX3BhcmFt
cyhzdHJ1Y3QKPiA+ID4gaW50ZWxfZHAKPiA+ID4gKmludGVsX2RwLAo+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIHRydWU7Cj4gPiA+IMKgfQo+ID4gPiAKPiA+ID4gK3ZvaWQgaW50ZWxfYWxw
bV9jb21wdXRlX2xvYmZfY29uZmlnKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsCj4gPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZQo+ID4gPiAqY3J0Y19zdGF0ZSwKPiA+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlCj4gPiA+ICpjb25uX3N0
YXRlKQo+ID4gPiArewo+ID4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0
ZSAqaTkxNSA9IGRwX3RvX2k5MTUoaW50ZWxfZHApOwo+ID4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1
Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqYWRqdXN0ZWRfbW9kZSA9ICZjcnRjX3N0YXRlLQo+ID4gPiA+
IGh3LmFkanVzdGVkX21vZGU7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGludCB3YWtldGltZV9pbl9s
aW5lcywgZmlyc3Rfc2RwX3Bvc2l0aW9uOwo+ID4gPiArwqDCoMKgwqDCoMKgwqBpbnQgY29udGV4
dF9sYXRlbmN5LCBndWFyZGJhbmQ7Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgY3J0Y19z
dGF0ZS0+aGFzX2xvYmYgPSBmYWxzZTsKPiA+IAo+ID4gRHJvcCB0aGlzIGxpbmUuIEkgdGhpbmsg
Y3J0Y19zdGF0ZSBpcyByZXNldCBiZWZvcmUgZG9pbmcgdGhpcwo+ID4gY29tcHV0ZV9jb25maWcK
PiAKPiBTdXJlLgo+IAo+ID4gCj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKCFpbnRl
bF9kcF9pc19lZHAoaW50ZWxfZHApKQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuOwo+ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChESVNQTEFZX1ZFUihp
OTE1KSA8IDIwKQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOwo+
ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghaW50ZWxfZHBfYXNfc2RwX3N1cHBvcnRl
ZChpbnRlbF9kcCkpCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm47
Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKGNydGNfc3RhdGUtPmhhc19wc3IpCj4g
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm47Cj4gPiA+ICsKPiA+ID4g
K8KgwqDCoMKgwqDCoMKgaWYgKGludGVsX2FscG1fY29tcHV0ZV9wYXJhbXMoaW50ZWxfZHAsIGNy
dGNfc3RhdGUpKSB7Cj4gPiAKPiA+IEkgdGhpbmsgaXQgaXMgZWFzaWVyIHRvIHJlYWQgYW5kIGhl
bHBzIGF2b2lkaW5nIGJpZyBpZiBibG9ja3MgaWYKPiA+IHlvdToKPiA+IAo+ID4gaWYgKCFpbnRl
bF9hbHBtX2NvbXB1dGVfcGFyYW1zKGludGVsX2RwLCBjcnRjX3N0YXRlKCkpCj4gPiDCoMKgwqAg
cmV0dXJuOwo+IAo+IE9rLgo+IAo+ID4gCj4gPiBUaGlzIGFjdHVhbGx5IGJyaW5ncyB1cCBhbm90
aGVyIHRoaW5nOiBkbyB3ZSB3YW50IHRvIHNwcmVhZAo+ID4gaW50ZWxfcHNyLmMKPiA+IHBvbGx1
dGlvbiBieSBjb250aW51ZSB1c2luZyB0aGVzZSBib29sZWFuIHJldHVybiB2YWx1ZXM/IEkgd291
bGQKPiA+IHByZWZlcgo+ID4gY2hhbmdpbmcgaW50ZWxfYWxwbV9jb21wdXRlX3BhcmFtcyByZXR1
cm4gdmFsdWUgdG8gIm5vcm1hbCIgaW50Cj4gPiBhcHByb2FjaCBhbmQgcmV0dXJuIDAgb24gc3Vj
Y2Vzcy4gVGhpcyB3b3VsZCBtZWFuIG9uZSBtb3JlIHBhdGNoCj4gPiBjaGFuZ2luZyBpdC4KPiAK
PiBPay4KPiAKPiA+IAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29udGV4
dF9sYXRlbmN5ID0gYWRqdXN0ZWRfbW9kZS0KPiA+ID4gPmNydGNfdmJsYW5rX3N0YXJ0IC0KPiA+
ID4gYWRqdXN0ZWRfbW9kZS0+Y3J0Y192ZGlzcGxheTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGd1YXJkYmFuZCA9IGFkanVzdGVkX21vZGUtPmNydGNfdnRvdGFsIC0KPiA+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
YWRqdXN0ZWRfbW9kZS0+Y3J0Y192ZGlzcGxheSAtCj4gPiA+IGNvbnRleHRfbGF0ZW5jeTsKPiA+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZpcnN0X3NkcF9wb3NpdGlvbiA9IGFk
anVzdGVkX21vZGUtPmNydGNfdnRvdGFsIC0KPiA+ID4gYWRqdXN0ZWRfbW9kZS0+Y3J0Y192c3lu
Y19zdGFydDsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChpbnRlbF9k
cC0KPiA+ID4gPmFscG1fcGFyYW1ldGVycy5hdXhsZXNzX2FscG1fc3VwcG9ydGVkKQo+ID4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHdha2V0aW1lX2lu
X2xpbmVzID0gaW50ZWxfZHAtCj4gPiA+ID4gYWxwbV9wYXJhbWV0ZXJzLmlvX3dha2VfbGluZXM7
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlbHNlCj4gPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgd2FrZXRpbWVfaW5fbGluZXMg
PSBpbnRlbF9kcC0KPiA+ID4gPiBhbHBtX3BhcmFtZXRlcnMuZmFzdF93YWtlX2xpbmVzOwo+ID4g
PiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoKGNvbnRleHRfbGF0
ZW5jeSArIGd1YXJkYmFuZCkgPgo+ID4gPiAoZmlyc3Rfc2RwX3Bvc2l0aW9uICsgd2FrZXRpbWVf
aW5fbGluZXMpKQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGNydGNfc3RhdGUtPmhhc19sb2JmID0gdHJ1ZTsKPiA+IAo+ID4gY3J0Y19zdGF0ZS0+
aGFzX2xvYmYgPSAoY29udGV4dF9sYXRlbmN5ICsgZ3VhcmRiYW5kKSA+Cj4gPiAoZmlyc3Rfc2Rw
X3Bvc2l0aW9uICsgd2FrZXRpbWVfaW5fbGluZXMpOwo+IAo+IE9rLgo+IAo+ID4gCj4gPiA+ICvC
oMKgwqDCoMKgwqDCoH0KPiA+ID4gK30KPiA+ID4gKwo+ID4gPiDCoHN0YXRpYyB2b2lkIGxubF9h
bHBtX2NvbmZpZ3VyZShzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKQo+ID4gPiDCoHsKPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IGRwX3Rv
X2k5MTUoaW50ZWxfZHApOwo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9hbHBtLmgKPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2FscG0uaAo+ID4gPiBpbmRleCBjNDVkMDc4ZTVhNmIuLmI5NjAyYjcxZDI4ZiAxMDA2
NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmgK
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmgKPiA+
ID4gQEAgLTEwLDkgKzEwLDE0IEBACj4gPiA+IAo+ID4gPiDCoHN0cnVjdCBpbnRlbF9kcDsKPiA+
ID4gwqBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZTsKPiA+ID4gK3N0cnVjdCBkcm1fY29ubmVjdG9y
X3N0YXRlOwo+ID4gPiAKPiA+ID4gK2Jvb2wgaW50ZWxfYWxwbV9nZXRfYXV4X2xlc3Nfc3RhdHVz
KHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApOwo+ID4gPiDCoGJvb2wgaW50ZWxfYWxwbV9jb21w
dXRlX3BhcmFtcyhzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLAo+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGlu
dGVsX2NydGNfc3RhdGUKPiA+ID4gKmNydGNfc3RhdGUpOwo+ID4gPiArdm9pZCBpbnRlbF9hbHBt
X2NvbXB1dGVfbG9iZl9jb25maWcoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwKPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlCj4gPiA+ICpjcnRjX3N0YXRlLAo+ID4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUKPiA+ID4gKmNvbm5fc3Rh
dGUpOwo+ID4gPiDCoHZvaWQgaW50ZWxfYWxwbV9jb25maWd1cmUoc3RydWN0IGludGVsX2RwICpp
bnRlbF9kcCk7Cj4gPiA+IAo+ID4gPiDCoCNlbmRpZgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgKPiA+ID4gYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaAo+ID4gPiBpbmRl
eCBkOTRmNTBjNmRjNmMuLjVhMGZmZDVhYTQ4YiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgKPiA+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgKPiA+ID4gQEAg
LTE0MDUsNiArMTQwNSw5IEBAIHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlIHsKPiA+ID4gCj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqAvKiBmb3IgbG9hZGluZyBzaW5nbGUgYnVmZmVyZWQgcmVnaXN0ZXJz
IGR1cmluZyB2YmxhbmsgKi8KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1fdmJsYW5r
X3dvcmsgdmJsYW5rX3dvcms7Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgLyogTE9CRiBm
bGFnICovCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGJvb2wgaGFzX2xvYmY7Cj4gPiA+IMKgfTsKPiA+
ID4gCj4gPiA+IMKgZW51bSBpbnRlbF9waXBlX2NyY19zb3VyY2Ugewo+ID4gPiBAQCAtMTgzNSw2
ICsxODM4LDcgQEAgc3RydWN0IGludGVsX2RwIHsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqB1OCBmYXN0X3dha2VfbGluZXM7Cj4gPiA+IAo+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoC8qIExOTCBhbmQgYmV5b25kICovCj4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBib29sIGF1eGxlc3NfYWxwbV9zdXBwb3J0ZWQ7Cj4gPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdTggY2hlY2tfZW50cnlfbGluZXM7Cj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdTggc2lsZW5jZV9wZXJpb2Rfc3ltX2Ns
b2NrczsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1OCBsZnBzX2hhbGZf
Y3ljbGVfbnVtX29mX3N5bXM7Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2RwLmMKPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2RwLmMKPiA+ID4gaW5kZXggZTA1ZTI1Y2Q0YTk0Li41NjM3MzljNjAxNGMgMTAwNjQ0
Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwo+ID4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKPiA+ID4gQEAg
LTQ4LDYgKzQ4LDcgQEAKPiA+ID4gwqAjaW5jbHVkZSAiaTkxNV9kcnYuaCIKPiA+ID4gwqAjaW5j
bHVkZSAiaTkxNV9pcnEuaCIKPiA+ID4gwqAjaW5jbHVkZSAiaTkxNV9yZWcuaCIKPiA+ID4gKyNp
bmNsdWRlICJpbnRlbF9hbHBtLmgiCj4gPiA+IMKgI2luY2x1ZGUgImludGVsX2F0b21pYy5oIgo+
ID4gPiDCoCNpbmNsdWRlICJpbnRlbF9hdWRpby5oIgo+ID4gPiDCoCNpbmNsdWRlICJpbnRlbF9i
YWNrbGlnaHQuaCIKPiA+ID4gQEAgLTI5OTcsNiArMjk5OCw3IEBAIGludGVsX2RwX2NvbXB1dGVf
Y29uZmlnKHN0cnVjdAo+ID4gPiBpbnRlbF9lbmNvZGVyCj4gPiA+ICplbmNvZGVyLAo+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgaW50ZWxfdnJyX2NvbXB1dGVfY29uZmlnKHBpcGVfY29uZmlnLCBjb25u
X3N0YXRlKTsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGludGVsX2RwX2NvbXB1dGVfYXNfc2RwKGlu
dGVsX2RwLCBwaXBlX2NvbmZpZyk7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9wc3JfY29t
cHV0ZV9jb25maWcoaW50ZWxfZHAsIHBpcGVfY29uZmlnLAo+ID4gPiBjb25uX3N0YXRlKTsKPiA+
ID4gK8KgwqDCoMKgwqDCoMKgaW50ZWxfYWxwbV9jb21wdXRlX2xvYmZfY29uZmlnKGludGVsX2Rw
LCBwaXBlX2NvbmZpZywKPiA+ID4gY29ubl9zdGF0ZSk7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBp
bnRlbF9kcF9kcnJzX2NvbXB1dGVfY29uZmlnKGNvbm5lY3RvciwgcGlwZV9jb25maWcsCj4gPiA+
IGxpbmtfYnBwX3gxNik7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9kcF9jb21wdXRlX3Zz
Y19zZHAoaW50ZWxfZHAsIHBpcGVfY29uZmlnLAo+ID4gPiBjb25uX3N0YXRlKTsKPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoGludGVsX2RwX2NvbXB1dGVfaGRyX21ldGFkYXRhX2luZm9mcmFtZV9zZHAo
aW50ZWxfZHAsCj4gPiA+IHBpcGVfY29uZmlnLCBjb25uX3N0YXRlKTsKPiA+ID4gQEAgLTY2MTIs
NiArNjYxNCw4IEBAIHN0YXRpYyBib29sIGludGVsX2VkcF9pbml0X2Nvbm5lY3RvcihzdHJ1Y3QK
PiA+ID4gaW50ZWxfZHAgKmludGVsX2RwLAo+ID4gPiAKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlu
dGVsX3Bwc19pbml0X2xhdGUoaW50ZWxfZHApOwo+ID4gPiAKPiA+ID4gK8KgwqDCoMKgwqDCoMKg
aW50ZWxfZHAtPmFscG1fcGFyYW1ldGVycy5hdXhsZXNzX2FscG1fc3VwcG9ydGVkID0KPiA+ID4g
aW50ZWxfYWxwbV9nZXRfYXV4X2xlc3Nfc3RhdHVzKGludGVsX2RwKTsKPiA+IAo+ID4gSG93IGFi
b3V0IGF1eF93YWtlID8KPiAKPiBJIGZlbHQgYXV4bGVzc19hbHBtX3N1cHBvcnRlZCB3aWxsIGdp
dmUgYm90aCBhdXgtbGVzcyBhbmQgYXV4LXdha2UKPiBpbmZvLCBpZiBpdCBpcyB0cnVlIHRoZW4g
YXV4LWxlc3Mgb3RoZXJ3aXNlIGF1eC13YWtlLiBEbyB5b3Ugc2VlIGFueQo+IGlzc3VlIGhlcmU/
CgpJZiBwYW5lbCBzdXBwb3J0cyBvbmx5IEFVWCBXYWtlPwoKQlIsCgpKb3VuaSBIw7ZnYW5kZXIK
Cj4gCj4gUmVnYXJkcywKPiBBbmltZXNoIAo+ID4gCj4gPiA+ICsKPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoHJldHVybiB0cnVlOwo+ID4gPiAKPiA+ID4gwqBvdXRfdmRkX29mZjoKPiAKCg==
