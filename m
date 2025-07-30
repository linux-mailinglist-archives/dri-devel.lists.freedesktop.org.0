Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F1EB160B1
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 14:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6E310E6A6;
	Wed, 30 Jul 2025 12:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOShZ7YZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E793210E6A0;
 Wed, 30 Jul 2025 12:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753879932; x=1785415932;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dg8rL3VpTA7x93YOtaxwnrUK2c61UJ4/W55qFYbz5GI=;
 b=kOShZ7YZ8vo1lRog6RU5Znl6Fr9QTCgl8VRaolEkATXS8Hh+peoGVOdN
 uQp3o89aJyasIDNG3lVJdoihS3vICtfFQo/UyHqwpW0LiJ/Zlu6jAnP30
 lmTYqPekqHXuPaj4KGzIg5FnwfGAPBLs3cDP64kkXc5YAA/9N7KLlx76j
 i1SMjs/BHjS+pN8890xvwNvfk7ClATpRIDc9kFtM1tp29tRP2jB7a0BJ4
 xR+U8/OEgs3rbT/zEi0IByWpDXDY5/ysITTJX+NhdN75zb8qRSX+899qp
 hqNYUGa0q2NDaml6oS1dDQKiOuGHVPrF8ILYyVuxb77BO8lAqzZXXpuRt Q==;
X-CSE-ConnectionGUID: 3ivOg03zSfaAzQ7zW4pCLw==
X-CSE-MsgGUID: 2ekx6ETSTT2zjwHI2PCSIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66874238"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66874238"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 05:52:11 -0700
X-CSE-ConnectionGUID: zxHjJdWzSKibcVcwdNon2A==
X-CSE-MsgGUID: 2g1nOuC3QV+5yYyLicfYaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="200154820"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 05:52:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 05:52:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 05:52:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.79)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 05:52:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lft33bc72aZjh0yfGYnG7IVWiXYFEDBGVdjA076dJ3AGUi1V1pdXSAM7TQpIoPQoxF9pppJVWKjieO6B4j8TYtqOUdtRFGuL9gDiSVAjFn0hX4O+t5Jza0TmdXwwpOljFiDkhOPSKQaQyvrlFBx/01qNBUZw4aKj4kZoJPRHb3h/8VUxSSZKmZodiwC3tYty5bp0bkKA1UggVdL0c31pw95kOtSyz/lgjZaBVsojmKkixzRoGN4lXaRdHTnz8yT3Izj1dWEQ2mIM7LJTfdOPkk7croA/wNxaZ+QZoF7TqhpKn2P+zNvOz4yijScUlsROK23rTcyC++LJOw4CA/CpKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dg8rL3VpTA7x93YOtaxwnrUK2c61UJ4/W55qFYbz5GI=;
 b=da3xmA2z3JGzh+/tHNHGLjrmmQQLrkPQDsIkrYTI5347J6gN3X//cqlcypXB55QCGm4PVq9+bOWYPpfIH1vohFk+oRW+I+224r5OLiqxh+OCJNffiSlVp0UONQUK4k0PEgcwzw8Y38iiLct5XFZPG3Vbbp7z+sOoHz9oAnWfMxpZ7fruOq5U0ykOH4xubX4e4dihjefPrZGRImqCogTWbuuEVwrVkPzgTsSZ2N7WnDvWmPnsmTEPpPAC3IQrVPpsIITahYuc2dLyVSxp12N9zaT1Uwwq1rsajr5G0e6tl8jSQFJFdR+zmK07x5OWmSfeHzg2CHm5mUa2qPu3I8QSGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by SA1PR11MB6808.namprd11.prod.outlook.com (2603:10b6:806:24f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Wed, 30 Jul
 2025 12:51:53 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e%7]) with mapi id 15.20.8964.021; Wed, 30 Jul 2025
 12:51:53 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Shyti, Andi" <andi.shyti@intel.com>
Subject: RE: [PATCH] iosys-map: Fix undefined behavior in iosys_map_clear()
Thread-Topic: [PATCH] iosys-map: Fix undefined behavior in iosys_map_clear()
Thread-Index: AQHb9855RD8SejSisEuXjvmUXA1DarQ39j4AgAALLICACLzYYIAJ7GPQ
Date: Wed, 30 Jul 2025 12:51:53 +0000
Message-ID: <IA3PR11MB89876C8B13B2126DC25C0B77D024A@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20250718105051.2709487-1-nitin.r.gote@intel.com>
 <aHpelIVPhfR74SUH@ashyti-mobl2.lan>
 <598098e1-f5fa-46cb-a7e6-589f75ce7234@suse.de>
 <IA3PR11MB8987884A53D81CADB5C088DFD05EA@IA3PR11MB8987.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB8987884A53D81CADB5C088DFD05EA@IA3PR11MB8987.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|SA1PR11MB6808:EE_
x-ms-office365-filtering-correlation-id: 8081ee2b-0a70-4e1a-9ea0-08ddcf67dbbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?a2JGNnUzWjFTdUVackp3VjFoeFg4Vis3ZDZwUVJwazhkMy9ITlQvdFNLenFa?=
 =?utf-8?B?ancyS0V1T2FTbForTURHRHhhTy8xVUh6MGUxbG5OanFqaDVxbjlSUEQ4WFhL?=
 =?utf-8?B?ajBlbWFlc01iaUVIRjNScjRTY3dZUVVxYlNZeWJCK2kyV0xlNmpqbnY4M3l2?=
 =?utf-8?B?bExsT1pCd2Y2V3c3RW5lTTZhZWhXTFg4ZlNTRnEvODgzKzgrNkRzSHpuSUpm?=
 =?utf-8?B?dzk3WERUVFBySlVBS0JvckZ4K2lHMURYSmlqTDhhQkk5K2dSSGpNSTQ1b0gz?=
 =?utf-8?B?YWRyRytQVlhxUk1FMEZTVldTaWJPTnFnUkJaSEFHdDAvcGZxTm9EU0xQSmVN?=
 =?utf-8?B?a2E1MFkxYXZMcFV3bmJ1cG4zdW90RWUyNTVFcHBCeWlsTWs5eTU3MkZuWW9Z?=
 =?utf-8?B?S21NaEZ6VEJMUkxnWTZmSlBEd1RPcEVEYzJWTEw1bDR2Nm5xSHhPOEhibHRU?=
 =?utf-8?B?d09iN2RMRXVIZTdrbnUzMkI5eDRnSE4wc1hnNzF0bFlUaFJrNHRNNHkzdHA1?=
 =?utf-8?B?SnF2cVk1aUI2dGFWdHZBaTNYZW9BeE5wNXRaYzMwdk9McnpEZlg3ZXZ1bm5Q?=
 =?utf-8?B?ODk1V3F1NklrOVVpVHJ5aWVoeDFWRzNoSjcwYmkyZDRFRzZPYzdZKzVjTUhD?=
 =?utf-8?B?ZHdVSWVONWNrVDd0N3hiV251TjFKcjU0Q0FScUZMK2ZyMStUQ29kZU10K3J6?=
 =?utf-8?B?QWdUd0pvalBacmw2azhsczlVUWdMQTArYnM4bUVqUW9VUGtJenkrdEl5bzdU?=
 =?utf-8?B?Y3lacEd5YVFGTkpqUUtURzJKK3lzUk9VSFQrRHRWRzcxL25FbXRmMGcxaStM?=
 =?utf-8?B?OWl6S1NQSWNucjBmbTdad3hPQm8ydWp3LzJXOFFtUnZRUWU4VEJNOXlndFc4?=
 =?utf-8?B?ZVdqeEhBeE9IQjBWSHZBMjJNNU9kbEcwdjRKVXNwbzRvbzJlUUEwRU03Z0tF?=
 =?utf-8?B?WEhtM0VCM0UxK1VWQW9OYjc1ejhPd1p0d0NZQlRtUVp2b0xmZWFZejU0end5?=
 =?utf-8?B?cGNvYTFXZ0NLV2MxR1N3Snk5UklYeWttcjlZaFp0eEpOMC80czk2Tjk5aGVi?=
 =?utf-8?B?RnNEdDZSOWRXdXJ3N09QVUxma1VhWDgvOFRlRnFhRHF1cDAxTFUzU2xSNTkx?=
 =?utf-8?B?a0tTTGNFTXMyaGVuTmNESEFQVDA3emkxZVg5cWJ1OVhzbW4wTk5ZOFVyREFG?=
 =?utf-8?B?OUVhUmoycVVxcmFhVGVnVTRXOEV3dU8xU1A0cTM4MkYyTm9kS2ZGOE1NNjAx?=
 =?utf-8?B?WkNJZlJBc1U2RDhRS1o5eER5V3hSclA0REFnakJ5OGlhQ3F5amNOZHBNbE0w?=
 =?utf-8?B?TlRyRGVYc2pXVUNsNE80dHJna0dydXBZSVdvWkMwWnlNLy80WGg2UktNeXpj?=
 =?utf-8?B?cmJEc0F5TVNpUjFqN2pWazdkYTdaTTZveU9XdW83T0pNSUt3NnRsNStuMmJP?=
 =?utf-8?B?Mm43NFcrazNLUGNwalc0ck5iSXNHUTJ4bjdHYVRJMmNOSDlXWmNqMWV4bTVo?=
 =?utf-8?B?N3RNdktNRlUyaDhXbnNkbVBDQm5sYzR2MHFoeTdDa05NWk9SN0RIcHFDVU9I?=
 =?utf-8?B?RGVuODRLVU50bStQUHNBamZYckxjdU5qOFV5NGJEVHlRVW9hQWpJaHlTTVJo?=
 =?utf-8?B?WUJDUUJRNE5RVXFBV04zZ0NBRTRvNlVVYUtZY1R5czhjVUh6ZkQ4bGdsWElS?=
 =?utf-8?B?anBYNGp6dDVuOGFwWVlRWkJacmJMWmdjOXNiTFBOZFk1Yi9STDgzeUVSMnlM?=
 =?utf-8?B?cUZ1REc1aU91d052TDExeWdQalFoQmxUUGRJazhUSE9WOUQ1VUtNUHVOZWl0?=
 =?utf-8?B?QURaQlBGZ3Y0b3lIRHdheStxamRmUG1wTXlIVjlTMTlCZk9FZFVtaWNiUXZv?=
 =?utf-8?B?SXhMQWxpZTFIZkxuOUhVZmlWWmhIQTJjSXgwdGNiSVVueC8yUWV1dWFFSjNW?=
 =?utf-8?Q?Wrgb56QrCYQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2Nxb2oyZWlxV1ZKbDM5aGlhUUI0SDdSN29Cc2FjTnNWWCsrUm9sMXhpRVJE?=
 =?utf-8?B?clpXVkdrVDdKTFJ0Si9uR29qYWhYWHVqbFFqTm94TFBRSVlGQkd6WFZlK3o0?=
 =?utf-8?B?WDlnWTdKbmYrNkpuNHIzMHFEbVc3cjNtdXNaa3lUb1dHbGRaa1ZWVGZGanh2?=
 =?utf-8?B?NnlvcnlVYWNyaGJRTDNnMHplWlI4SWVsMWFGUWhiMnAyRkVoZGNVbFdsenRV?=
 =?utf-8?B?U0JGVUlOQjBJQjZ2OFdoU002ei9wZ3UxMmdGL0hKZStnVi9RQ3QwV2dFS2Z4?=
 =?utf-8?B?NzRwRncyMWNic1JUUkdQZG5BTlZtRmFiNFgzNlZLenVieExpdDk0ZjlaTFYz?=
 =?utf-8?B?S1ZzdG5HSUtVMllBMUlZdUg3bmo5bTZOSEJocXo2M2tLZ2hISGxUelhiR2ta?=
 =?utf-8?B?MVRXYXhnZjJzQ0ZaRFo3YTRVbm8zVlU1b3M2OFcwbndKaUtIQkExNWE1bU1C?=
 =?utf-8?B?UG5QL0VZcEFWblNyVFh6WkxiNkxqWjh5L3NuK1pyREFlRjMvR2pDL1lQVnlD?=
 =?utf-8?B?S2NmVjg2OVFkWThEUE13aDV1TkV1eFZIeDZING5wanBYaldkVnFodHp2R1Aw?=
 =?utf-8?B?UXZXTnVZdlhrOFdSZU1pS29aTDQvYXVqcDB3cytmK0tTUUVydlE5OWdWcjVS?=
 =?utf-8?B?UUVrWW51QUNTdTczN0NRTElJYXlZNVlhUTg1MEpaTUlUblZaSi9SNk5rSDRs?=
 =?utf-8?B?dDBLZVREQkZrQXJBeEthemZsV3BOcTllNzBGR1Jud2xKZmpnNEtnOUVtd2hK?=
 =?utf-8?B?YlhIOHVLRVA0ZkdCbXJGaCtZeUdtOEJlT2FKZWZoL0F3NjVvMlRSYUl2Zng4?=
 =?utf-8?B?OUxPZzZ4ZjFXKzhyWXVzb0ZwOEdtM3ZueUhObUFIcGhOTlNZMFBnMnk1dmtU?=
 =?utf-8?B?S0J0SGZRUTltaTVXTXV4dWRxYnZIY05TYUJKelZZQWNWMEZyT1pWQ0VtTXJh?=
 =?utf-8?B?czlSazF3UFFKWnRRM0JBaGR5K2VDSWtPb1QwU1NMWEZJU1BjZXJ4NlVOYVMz?=
 =?utf-8?B?bXdJakkrc045WFp1bVlWQ1J1cUV5ZUZGYVV3and2ZkVBMmpBZHF4S25zb1Zk?=
 =?utf-8?B?V0FacHMzNVpwNmdlc1d5ZFRNK05DMFF2TWp5a2tGZWsrNU1ZaWZFN1UyVExj?=
 =?utf-8?B?elRQR1RyVWhJN1BVNGZyckpmQnV5VUkwa056WmRiOS9EUW9tU3QvM3d2TjI3?=
 =?utf-8?B?T3pHRXUyeW40ZjVuUmVORTFWVS92ZmZrVlhJVlF0VVViMHFYTnhaMmZvb0lG?=
 =?utf-8?B?eFNNME5jb05tZmdOSzdSK3NEMUJuRDUrRkRGdDlQZTBVU0dvZ1kwTCtMazRH?=
 =?utf-8?B?cWlWNHZXL2d5aFZ2U2pKcERxcWtKaFdZUnU2MlorVVlIOUZDNWhpSVVYZmUr?=
 =?utf-8?B?dmJnSmduTTYvWEtzNmo4cnVMVDFieVZrNDJGbHE2VUZCQ1BkcWEzQ0tWa3Y4?=
 =?utf-8?B?aE5VeHhwczhoNm0vT2ExSHpBWkJLc0kyWkpjeFk5SlRRV1YyU0NOTGFWVWRG?=
 =?utf-8?B?UHFRbXhYQUVoVEkyOVY3ckE2dk9DcWx0RGFselVyK2hVUTVGZFAzTWpabWEv?=
 =?utf-8?B?clFzOGFEQkd5MGVqSTEzNjdndyt6UXdSZzE3dVNRSWpGallBTmxtVnh3aWRL?=
 =?utf-8?B?by9raHFVRkQxajRTaHM2akdydmttRVBoOVNEdmNhd0NMNk51T0lmTC9iZXAw?=
 =?utf-8?B?bSs1dXRKVk9ra1htVHUvaWhmVWo5VWdmYWM4MkhheVNlWlU4a1F5U1RRbUtw?=
 =?utf-8?B?VG8vMDB2bEg3U0pMSG1uZ09qMjRCRGNZTXB1Uk95MGVSNDlsWWFERG9WUExt?=
 =?utf-8?B?WWFMYUJVYTk5K3RSaHFtQ0w2RGg4STJSWERRNy9XZGVoWnpGN2RWR2tkVDBG?=
 =?utf-8?B?QXorY21EdWlmY08wTno4SlB1b3RNOXNpNXBpVW1XbS92U2ZWU0doZjJGZzFp?=
 =?utf-8?B?MU5kZElHUUl0TWdPRWxhMUNmamlzV3dDcjhpVnJ3M3M4ZE53VGFTRGg1RDlJ?=
 =?utf-8?B?bjVxLzg1bmtHSUpSRlZyQjVQd1hZbWRrYUQ5VmtpMTJVWjUzclMyekFLTU9R?=
 =?utf-8?B?NGxNQXNaY25yMUdXVC83Q3E2MmpYWXhydEtSK0hid0RLODdCcVJGa0R5ek9F?=
 =?utf-8?Q?G+/+56so/7pHqVEt60XJDBbZ9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8081ee2b-0a70-4e1a-9ea0-08ddcf67dbbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 12:51:53.1598 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v5NGOZsQH8B/E2yaJHLLM84zDuFQe2STp/ghD9WS+vcD9ldgbqH2HXaZZbkrw+LLb56iDDP9QEEC319Jh6y0Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6808
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

SGksIA0KDQpUaGUgcGF0Y2ggaGFzIGJlZW4gcmV2aWV3ZWQgYW5kIGFwcHJvdmVkLg0KQ291bGQg
c29tZW9uZSBwbGVhc2UgaGVscCB0byBtZXJnZSBpdD8NCg0KVGhhbmsgeW91LA0KTml0aW4NCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHb3RlLCBOaXRpbiBSDQo+IFNl
bnQ6IFRodXJzZGF5LCBKdWx5IDI0LCAyMDI1IDEwOjM2IEFNDQo+IFRvOiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gQ2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFNoeXRpLCBBbmRpDQo+
IDxBbmRpLlNoeXRpQGludGVsLmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRDSF0gaW9zeXMtbWFw
OiBGaXggdW5kZWZpbmVkIGJlaGF2aW9yIGluIGlvc3lzX21hcF9jbGVhcigpDQo+IA0KPiBIaSBU
aG9tYXMsDQo+IA0KPiA+DQo+ID4gSGkNCj4gPg0KPiA+IEFtIDE4LjA3LjI1IHVtIDE2OjQ3IHNj
aHJpZWIgQW5kaSBTaHl0aToNCj4gPiA+IEhpIE5pdGluLA0KPiA+ID4NCj4gPiA+IE9uIEZyaSwg
SnVsIDE4LCAyMDI1IGF0IDA0OjIwOjUxUE0gKzA1MzAsIE5pdGluIEdvdGUgd3JvdGU6DQo+ID4g
Pj4gVGhlIGN1cnJlbnQgaW9zeXNfbWFwX2NsZWFyKCkgaW1wbGVtZW50YXRpb24gcmVhZHMgdGhl
IHBvdGVudGlhbGx5DQo+ID4gPj4gdW5pbml0aWFsaXplZCAnaXNfaW9tZW0nIGJvb2xlYW4gZmll
bGQgdG8gZGVjaWRlIHdoaWNoIHVuaW9uIG1lbWJlcg0KPiA+ID4+IHRvIGNsZWFyLiBUaGlzIGNh
dXNlcyB1bmRlZmluZWQgYmVoYXZpb3Igd2hlbiBjYWxsZWQgb24NCj4gPiA+PiB1bmluaXRpYWxp
emVkIHN0cnVjdHVyZXMsIGFzICdpc19pb21lbScgbWF5IGNvbnRhaW4gZ2FyYmFnZSB2YWx1ZXMg
bGlrZSAweEZGLg0KPiA+ID4+DQo+ID4gPj4gVUJTQU4gZGV0ZWN0cyB0aGlzIGFzOg0KPiA+ID4+
ICAgICAgVUJTQU46IGludmFsaWQtbG9hZCBpbiBpbmNsdWRlL2xpbnV4L2lvc3lzLW1hcC5oOjI2
Nw0KPiA+ID4+ICAgICAgbG9hZCBvZiB2YWx1ZSAyNTUgaXMgbm90IGEgdmFsaWQgdmFsdWUgZm9y
IHR5cGUgJ19Cb29sJw0KPiA+ID4+DQo+ID4gPj4gRml4IGJ5IHVuY29uZGl0aW9uYWxseSBjbGVh
cmluZyB0aGUgZW50aXJlIHN0cnVjdHVyZSB3aXRoIG1lbXNldCgpLA0KPiA+ID4+IGVsaW1pbmF0
aW5nIHRoZSBuZWVkIHRvIHJlYWQgdW5pbml0aWFsaXplZCBkYXRhIGFuZCBlbnN1cmluZyBhbGwN
Cj4gPiA+PiBmaWVsZHMgYXJlIHNldCB0byBrbm93biBnb29kIHZhbHVlcy4NCj4gPiA+Pg0KPiA+
ID4+IENsb3NlczoNCj4gPiA+PiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5
MTUva2VybmVsLy0vaXNzdWVzLzE0NjM5DQo+ID4gPj4gRml4ZXM6IDAxZmQzMGRhMDQ3NCAoImRt
YS1idWY6IEFkZCBzdHJ1Y3QgZG1hLWJ1Zi1tYXAgZm9yIHN0b3JpbmcNCj4gPiA+PiBzdHJ1Y3Qg
ZG1hX2J1Zi52YWRkcl9wdHIiKQ0KPiA+ID4+IFNpZ25lZC1vZmYtYnk6IE5pdGluIEdvdGUgPG5p
dGluLnIuZ290ZUBpbnRlbC5jb20+DQo+ID4gPiArVGhvbWFzIGFuZCB0aGUgZHJpLWRldmVsIG1h
aWxpbmcgbGlzdC4NCj4gPiA+DQo+ID4gPiBJbiBhbnkgY2FzZSwgeW91ciBwYXRjaCBtYWtlcyBz
ZW5zZSB0byBtZToNCj4gPg0KPiA+IFRoZSBjYWxsIHRvIGlvc3lzX21hcF9jbGVhcigpIGlzIGF0
DQo+ID4NCj4gPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xNS42L3NvdXJj
ZS9kcml2ZXJzL2RtYS1idWYvZG1hLQ0KPiA+IGJ1Zi5jI0wxNTcxDQo+ID4NCj4gPiBJdCdzIGEg
ZGVmZW5zaXZlIG1lYXN1cmUgZm9yIGNhc2VzIHdoZXJlIHRoZSBjYWxsZXIgcmVhZHMgdGhlIHJl
dHVybmVkDQo+ID4gbWFwIGFkZHJlc3Mgd2hlbiBpdCB3YXMgbmV2ZXIgaW5pdGlhbGl6ZWQgYnkg
dGhlIHZtYXAgaW1wbGVtZW50YXRpb24uDQo+ID4gSSdtIG5vdCBhIGJpZyBmYW4gb2YgbWVtc2V0
KCksIGJ1dCBPSy4gUHJlZmVyYWJseSwgaW9zeXNfbWFwX2NsZWFyKCkNCj4gPiB3b3VsZCBzaW1w
bHkgc2V0IHZhZGRyID0gTlVMTCBhbmQgaXNfaW9tZW0gPSBmYWxzZS4gQW55d2F5LA0KPiA+DQo+
ID4gUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0K
PiA+DQo+ID4gQmVzdCByZWdhcmRzDQo+ID4gVGhvbWFzDQo+ID4NCj4gDQo+IFRoYW5rIHlvdSBm
b3IgdGhlIHJldmlldy4NCj4gQ291bGQgeW91IHBsZWFzZSBoZWxwIHRvIG1lcmdlIHRoaXMgcGF0
Y2g/DQo+IA0KPiAtIE5pdGluDQo+IA0KPiA+ID4NCj4gPiA+IFJldmlld2VkLWJ5OiBBbmRpIFNo
eXRpIDxhbmRpLnNoeXRpQGxpbnV4LmludGVsLmNvbT4NCj4gPiA+DQo+ID4gPiBBbmRpDQo+ID4g
Pg0KPiA+ID4+IC0tLQ0KPiA+ID4+ICAgaW5jbHVkZS9saW51eC9pb3N5cy1tYXAuaCB8IDcgKy0t
LS0tLQ0KPiA+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2IGRlbGV0aW9u
cygtKQ0KPiA+ID4+DQo+ID4gPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaW9zeXMtbWFw
LmggYi9pbmNsdWRlL2xpbnV4L2lvc3lzLW1hcC5oDQo+ID4gPj4gaW5kZXggNDY5NmFiZmQzMTFj
Li4zZTg1YWZlNzk0YzAgMTAwNjQ0DQo+ID4gPj4gLS0tIGEvaW5jbHVkZS9saW51eC9pb3N5cy1t
YXAuaA0KPiA+ID4+ICsrKyBiL2luY2x1ZGUvbGludXgvaW9zeXMtbWFwLmgNCj4gPiA+PiBAQCAt
MjY0LDEyICsyNjQsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaW9zeXNfbWFwX2lzX3NldChjb25z
dA0KPiA+ID4+IHN0cnVjdA0KPiA+IGlvc3lzX21hcCAqbWFwKQ0KPiA+ID4+ICAgICovDQo+ID4g
Pj4gICBzdGF0aWMgaW5saW5lIHZvaWQgaW9zeXNfbWFwX2NsZWFyKHN0cnVjdCBpb3N5c19tYXAg
Km1hcCkNCj4gPiA+PiAgIHsNCj4gPiA+PiAtCWlmIChtYXAtPmlzX2lvbWVtKSB7DQo+ID4gPj4g
LQkJbWFwLT52YWRkcl9pb21lbSA9IE5VTEw7DQo+ID4gPj4gLQkJbWFwLT5pc19pb21lbSA9IGZh
bHNlOw0KPiA+ID4+IC0JfSBlbHNlIHsNCj4gPiA+PiAtCQltYXAtPnZhZGRyID0gTlVMTDsNCj4g
PiA+PiAtCX0NCj4gPiA+PiArCW1lbXNldChtYXAsIDAsIHNpemVvZigqbWFwKSk7DQo+ID4gPj4g
ICB9DQo+ID4gPj4NCj4gPiA+PiAgIC8qKg0KPiA+ID4+IC0tDQo+ID4gPj4gMi4yNS4xDQo+ID4N
Cj4gPiAtLQ0KPiA+IC0tDQo+ID4gVGhvbWFzIFppbW1lcm1hbm4NCj4gPiBHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQo+ID4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+
ID4gRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCj4gPiBHRjog
SXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFu
IEhSQg0KPiA+IDM2ODA5IChBRyBOdWVybmJlcmcpDQoNCg==
