Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGN6IUKknGnqJgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:02:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA8017BF80
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9351410E42D;
	Mon, 23 Feb 2026 19:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fkG88jhK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E766110E423;
 Mon, 23 Feb 2026 19:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771873342; x=1803409342;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jpM5lM894FFJW2Pi1yac2uOq6MBKvndPfHlU3X/UsIY=;
 b=fkG88jhKzdhJE6CWxhp/I/waZfLSyj9iLlRyG/JBmRd8bz6JPY8KfMmq
 xLsE485a4f1FvIUUFuRl+uglpp5lsaZ3mjfpEcrcmygCx2/uRBeyaRfR3
 0Nc3y+7A2gVro3qsaB89opXrgslOpMZd462XZeY/mgHqTLNS59hgCEmV5
 A4KFQu/1AOU0JcLOMGwutQRUKyBO4sUmQUDigCkwE0iwyhR5VjIVJtYxM
 lIt2q8xIEttgGLACEpZNSJmHxAnvdXTujNkAm91KzF/k3fkBa+ouSZw7d
 vqurJp41ZqjuKZQBbdTkRZjUkoa5y3UDTUw/uqicvtNy8W872pQkPQ08b g==;
X-CSE-ConnectionGUID: 1EVWqcFQSW6rr+fz6qByAQ==
X-CSE-MsgGUID: JvJBJsIzTdWpLKdRKpjmtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84239634"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="84239634"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 11:02:01 -0800
X-CSE-ConnectionGUID: J1VvpRAZQXy0V1HoV9NquQ==
X-CSE-MsgGUID: kG2tpMUfQeqLVDg6J+v9kw==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 11:02:01 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 11:02:00 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 11:02:00 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 11:02:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffRzTvfcFvJwMqPMEQjcbjlFoLnd7+pFiO3ooCQ1Wqfh0PWype3iwOwZbtvL5pH5F//6fTHocG6MxaYCQnNAvmC3lgKhpkOQUFvLLpeRSEtPfqMSMuCacAzlfC7EKnJKcSCweSr8LHLMoGuBrGidoCpSwsZXLt1cqKOipEkb+alyoTllt77I7+ciN/5ZQX9uA8L/RZqy8Lrfj2+kpJnAAJ5AwtwanQv9wZ/1MG7dVoOI+pM+9oCENRZGjO0de0bCrp3bf2zvPLtult13Yr9yoLGxGABdE6nCEc0IzNMGmR4i4P0q+tUi/Hr5maEE4WzRYFhkHqWTZONzX7CnU1Nw+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpM5lM894FFJW2Pi1yac2uOq6MBKvndPfHlU3X/UsIY=;
 b=P6S74HfMp46PQkw3yLGkH39fSo5/hP6UtM/Cuas2W/UV4gR3dq0Z/NuTLgUnzSsfwQh6g530wzRwaxN7w6W8hf7qA0BVm6D88DqRujYVKQbIDcmAHJM19Ga8yFlWZlXFv7uHtkFxvPHoB9iQXJqaaYokTryjkjJv8Ax8onL2yvQCQduXFckXt/xc/tiPsVZF7xibB7Ba0vgLqZP3RayjeoQ/2frQpL3HRDoAKfJ8sUC+yxrgkZkSNXQWuKXaRwWRR8L3e6JS4zV5kfRRw3oT7mvoksuPo5yDDwOH4XxT4V6Oy9RAOYfy1AjJt+rRUFNNIq41umCmtb2LiWPI5EGjOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB5071.namprd11.prod.outlook.com (2603:10b6:a03:2d7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 19:01:58 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 19:01:57 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Cavitt, 
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/i915/selftests: Fix build after dma-fence locking
 rework
Thread-Topic: [PATCH] drm/i915/selftests: Fix build after dma-fence locking
 rework
Thread-Index: AQHcpOmEDgdZDGYf00ui2PHsHWPRRrWQorEQ
Date: Mon, 23 Feb 2026 19:01:57 +0000
Message-ID: <CH0PR11MB544439AE2C3E9141EED7E7B0E577A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20260223172553.1663749-1-matthew.brost@intel.com>
In-Reply-To: <20260223172553.1663749-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB5071:EE_
x-ms-office365-filtering-correlation-id: 48f3ada4-b485-473b-5a47-08de730e04b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?UVFiUk9qcjN2eldmMVVpTEUxWGNLYjMrTGpUY0N0bzRWVk5DQStkTUNDMWhn?=
 =?utf-8?B?VFRyUTduSFRVN1RzS3pucnk1YWJnRFdwR1JScUM0T3J4VjZLSGJiTXJqSGNV?=
 =?utf-8?B?ckhMNFhtTTFrTXB2aFMxTHNmVHpiZWhkYURHRVQrNGhDVXFyL2VrQW5rV1pD?=
 =?utf-8?B?WTUyMnE3eG90UzJnYVpHYjJKek15aGN4azgyZ3RPT0RSY2ptWUtHbG1RM1hO?=
 =?utf-8?B?Nk1GOFJ2MkVsZlk3NkZDUVdKT3dBWXdnRHBuS1JFTHRYYW45M200R1JnZGhB?=
 =?utf-8?B?TnVsUUdyNXVDd2k2V3dkOFk3eUEzWmFQRmNiTVkwUDlFSG56WUdxT2N3a0g2?=
 =?utf-8?B?d2lnZnlaNEgyclJrODI3aGtlb1BTQVhQM291cUVvaXU2S3d4cUl5OVQ0S1By?=
 =?utf-8?B?NDRtYi8vT0RZNk9LN0ZpQmhQeW5zQVc2UnJ2eTBDRUZJMXBLQngwTm1zVzJ4?=
 =?utf-8?B?ekh3anMvMjE5OFk0cnJseHB5R283Y1Fkanl6ZzhRR0ZZZUdMak1jcXhjUm9S?=
 =?utf-8?B?NDBadU5KYXFKZkVFaS9kTnNSR1hVNGJkcUk0T1lHUGZPM1NZeDY2MVFEZmtO?=
 =?utf-8?B?dHZhSUs1SGVheW5MUVZVQ0cxcS9xY2pyWHFxazkwZHRKLzBibHpVWUE0SjE4?=
 =?utf-8?B?MVlXenFXVHJVZWF4QUo3RFU4M1ZTYlZtZjVQcW5CNTFzT1UrNi9DbU0valJs?=
 =?utf-8?B?dVlYVzhvc2RvLzZOTDBpYytybXhGWGtZK01ET2hkYllKY3d6QjF2VCtHZG84?=
 =?utf-8?B?YStrdjBSSWdpSWF1eWd2RFMzRzN6am8wdVJKWHhna2hYTXA3eHBZdlI5cnhR?=
 =?utf-8?B?TytML005K1NGT2p0MG5jYXU4MHM5d0xXejdSWGVuLzZ3b092NVEwUVp5MEwx?=
 =?utf-8?B?RSt5UVltaXVtSFFadDZINXovaUlTTjBscTZoVDN2RlRnb2svemVzQ3pCajl6?=
 =?utf-8?B?dnRLbmUrbzNCV3FvS3dlYXdiYWxGNVJ2SHFpT0VyZTVvc0o0RXFFWWNuaHVp?=
 =?utf-8?B?Z1h2ZEZaWTJKUW0zN0tmaWxWNFYxaUkxYzBBLzUwMXpsUklzRzZjNmJjQWdi?=
 =?utf-8?B?T1gxSENqZkpHZlJiNHhQQVJlbHN5eGNJOVNSZW4zMHQzVkp6bjFRUkprdXZm?=
 =?utf-8?B?SndIbmgyMTBVUVNRVXQ1WnIrUVpGcWpGTURENFdpekxVcHNCVWg2SWJsOXJt?=
 =?utf-8?B?aGxkSkFTZmxiR0RCdlRySXdmQkxSNXcyTEt1aFpLZ05Jamo0bEwzT3ZyaVVl?=
 =?utf-8?B?SEpYS2N0dWhTYWVlVmRycGdUOS9CM2hrSE82anExUGpRS3FoSzdMbXR2RHYz?=
 =?utf-8?B?UGxja0NCTkZQUHlUZ0poOTZ0TXEyQ21ySTR3SXhDaWpXUUJDMm0ySFhVR1hl?=
 =?utf-8?B?ait0SWNnNDJEK1VKYVA3ODF1RVJ4VE83RkhKeFdhQTdEYm1maVc4WUNSZG42?=
 =?utf-8?B?RjhzdXlFV1BraUlJZnNBTzVCeXN5VkZqeDJPL0ZQREZOL3dpd1gxMFJRSU9z?=
 =?utf-8?B?SmorWC91ci85b1BxWEZwU1lyY2dUdFpiRDc1N1JBRmVkNktSaVUyQnlIekgz?=
 =?utf-8?B?VkdldklxcnBOUDlvZWh6TlZYdmNtNmxnb3ZCTmVlQlFwSzVjVzRwZkNVMVJT?=
 =?utf-8?B?WmljSjBFZU84SVQ2cGFOTnJMa0xmSURrbmoyY1ZueTI5WFQzVDkzRktMNDhv?=
 =?utf-8?B?K2hIem5aRGhPcjIxZDNLTE9UWEJiUVdCTC9FUUVKUnZvNzVxenF2ZFJiWFNt?=
 =?utf-8?B?SDhKQms0U1V0dnNPK2ZYVmUwVWZPZ0cwYVNqaVVIS25od3RtSEo1VE1hdjZV?=
 =?utf-8?B?c29QLy9sN0QrelB3VVNqYUROWjZzVzF5OExlN3hkbElxa0REU29ZN2MwcjBj?=
 =?utf-8?B?eFI2VFhxRklRZzI4SEM2aWE2U1RhQjU4dTc5amlaanNVRGVKM3N5WHNDTm90?=
 =?utf-8?B?RkVwcy9WbkVyM0QzVXQ1N0JZbUlSVHFPdllKclh2RWtsMG8rWDNWN1l0NGJY?=
 =?utf-8?B?ellBZDlXUVRWQzEzbGZLdnVFQStUcGNBdUFuNVBEbXAwNGc2WHlWamVranRN?=
 =?utf-8?B?M0h3VkxqdDlPTTc2d0MxT0JJSk1qaWkxaUlnYmgyaTlWVmN1cDZCY2Nyb0Zn?=
 =?utf-8?B?Mld2amRyUnUwRXhXMDBxZlgyVlYvYWRQc01FWnBzTUVFRXA0S3k1MS91TDYv?=
 =?utf-8?Q?d0oMIVV/80Hpdp+0HYiomgk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEFWVUlTaEZNR0tjYnltbWZWRms1N3UvUmVtb2srQVdOK1ZPUDVIdUFUYWdC?=
 =?utf-8?B?UzlpckY3bytZK2ppWTZBL0VaaG1JZVpGZjV6eTdRdFlWM3Erd05CckY1cTZt?=
 =?utf-8?B?bllYbWlnMEMvb1owSGRxN3BmQTVVSDMveENWUjJ6VzdhaURPejhQclorUURL?=
 =?utf-8?B?cXFTRit3dmdYbVpkbXpnOUY4T2tNUjR0aGdtRkZZaUF0SmkvdWpEd1d0Qi9N?=
 =?utf-8?B?aEZLc3N6aUpNNDg2MGdCVVhIbHN1WUFkUVNmZTBXdlR1SURNN3dHaXVobHpw?=
 =?utf-8?B?elRjaGtrMWRJK1k1b0RpbVl2M21wRUJheHpQVGppQUNTQVFjMnZyWGIzWHBv?=
 =?utf-8?B?K2diVTJkWXc4U3R2SEFHOHgvODFNeEI2UU5xbEJIY0c2b0owbzdaYTlDVjVa?=
 =?utf-8?B?enN0Z24xVWN2WUtHVmNDR2lHYWwzbFloTFFad2RSb1ozcGI3bnVEbjF4dlNJ?=
 =?utf-8?B?akJNcXdMVk9aR3hkRGNCOGh0UUFzbXA5cE1JWFJoMWpjM2R6S2p1Q2liN28w?=
 =?utf-8?B?U2tPMWd6LysycTlITk1SOXhYamROZEc3VEFXR0JhdWh5Sm5vNS9tcUwxSmND?=
 =?utf-8?B?UGQzNGs2Y201UzZWYithQmRoMkxFR0M3cEdEb3NsTEplbWtEMjBmMnd3c3Ux?=
 =?utf-8?B?Qll0bHJ1TDN1R0VSSkYzZjFhdGhtZWZGSFFjaXNGaVI3WEdWeDdpM3ppZmdw?=
 =?utf-8?B?WlRXTWxxRWZvMWxQRnJJdjhYaWlIeWhKeDJITkJqNFBiczlRekdGcXdIT0Zk?=
 =?utf-8?B?cWlNcHc0TEZmL1lkOXlMU3hzbUhPRlNtOFhSRzQ0WEdYUFpRdzlnNkE4OXM1?=
 =?utf-8?B?UnNyVUVCUnQ4ZWVVWis2VSs1SHBBL1hNVmlaRVRPb291czhsdVNMb3psUFRU?=
 =?utf-8?B?S3Nlam14VEtIdWVsQzM2Sk93TjRqbk15SkVuZ3pEd0VHekdjRE5QbHdibFpj?=
 =?utf-8?B?TURranpoZEtuSGpzd3NiOGNRRS9jZkJ1YWdUVHZmdHNYeklaZ3VnajdxSkFr?=
 =?utf-8?B?dldaejYvemZqR3VGMFhOT3hTSkhqc3hwUm1lUGlrQWd5bnV3MHVJVG9rU2J1?=
 =?utf-8?B?NklOb2kvWHhQeWx6ejcvQkF3QkJXOWtVa29KSWhXeHNzYkdwcmt6ZW1rTDdX?=
 =?utf-8?B?VlErL3V5YlhFRGhpb2t3SHJ2a2Q0eTBMUy9hRW1mdlBELzBPNkViK0ZTUnd4?=
 =?utf-8?B?NGxPZFY3RlIzVDhKT29uQ01HK2tZWlQ4SUF0dENKSU9TU3phMTJLTzVBNk9Y?=
 =?utf-8?B?OVY3MWZMQzBwcUpVblRIMEJPVWVlMC85WktpNVg5OXBQQ0xtSkg5WG5ET1NJ?=
 =?utf-8?B?SG1TZGxkc08vZEFEM1pRK1pLdk5ZVE41cFF0WnpSNVNBMGdtaE9oY1hXUzF1?=
 =?utf-8?B?SnFYdkdieHpnNXJNMUZXYWVVeFhITDhzWG5CVTNxSXl1RGFnMXg2VEt4bHFN?=
 =?utf-8?B?ZnpsWCtHRmx3RGVRRHF4Nmg1T0REWEc4OWpuWmVLVFRxbVE0djgzK2hTZU5Y?=
 =?utf-8?B?N014NTkzRUdiMnQzUk8vd0ZhNWV6Zk1FL3JmTmhlZHJ4UHZiVzJNZ3lMNldp?=
 =?utf-8?B?d2dZNVR5ZnhyU3VwUGFaZmtqMTFtaHdYUWorTVB5ZVlqanpDYWxydkU3eXFl?=
 =?utf-8?B?dHVCc1ErQ0JkZGVDdUJNVmdydHVlRHlnZWlaVVlLQXdPVFhpeEJBRDYySGNI?=
 =?utf-8?B?ajloLzlkSVByRWRteXBnQ1RVUGcwR0V6d0ZqM0VuSlZHZ1JpYkxYc3RlZ1Zi?=
 =?utf-8?B?Z0piTS9JK1Q3WE1uZE8zbzA4ZFpZcTJvYWdFanFGbGNlWUlid0dvaTRTQ2wy?=
 =?utf-8?B?VjhMbE5iaWJzZk5oc1JwS29kWlFWWlY4U1A1VFhBWVE2SFllR3pWZ2VReFA4?=
 =?utf-8?B?TzRnYVB5aHhRMlRvdi8yTkRtdEk0UFJqMzZqQ2UybkwwbzlxSzN5aDhvenBz?=
 =?utf-8?B?RktCTkl1ZGJwTjVUUlFTV2tsL2gvQnEzLzk0aW1PZzYzaVhhOVBXa3Urcm1Q?=
 =?utf-8?B?UkVRSFlxU3BYaU1aNk1iWTRmQkNMdmo1cHpETWZQdjN5ODlvME84UmZzSjVX?=
 =?utf-8?B?NTFITXNEYmdYWldrdGhxaFR0NzdiVFhMQjFIUDJjZU05UEtLMG4yNVV2WndP?=
 =?utf-8?B?YWNlRi9uOEJZMW9rRlJPd3RxNllJSjQ2aWpXbVJXMC9nemhTU0pmaVJVY21T?=
 =?utf-8?B?QVJWRnl6RVExNDE5ck5uZDl5NzBXVlBwZUlHSURDTmxWc0RCNDdzM0dmaTR3?=
 =?utf-8?B?Y2ppN3NUbHBwK2FSZThCOTRNREF4K3E2U1ZGcWRIeXgyMmUvVTVZdlIxdENn?=
 =?utf-8?B?dzhpZUM1QnBLeDZhSWpsdWpMaHdJRWRGUE5ZM3cvRC8rRG9Vc21nQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f3ada4-b485-473b-5a47-08de730e04b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 19:01:57.8565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ABWAw3UFe+SEtleufTJJkY51UoZr8GCYFf4bYN8Qw8K/ql0FBYtESK4VH88qE2EIOnZiqRUxY0ldQYCGvh+scmI/Om2qviPpciU+mF0kJ5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5071
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[jonathan.cavitt@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 3AA8017BF80
X-Rspamd-Action: no action

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIE1hdHRoZXcgQnJvc3QNClNl
bnQ6IE1vbmRheSwgRmVicnVhcnkgMjMsIDIwMjYgOToyNiBBTQ0KVG86IGludGVsLXhlQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0gZHJtL2k5MTUvc2VsZnRlc3RzOiBG
aXggYnVpbGQgYWZ0ZXIgZG1hLWZlbmNlIGxvY2tpbmcgcmV3b3JrDQo+IA0KPiBUaGUgaTkxNV9h
Y3RpdmUgc2VsZnRlc3Qgbm8gbG9uZ2VyIGJ1aWxkcyBhZnRlciB0aGUgZG1hLWZlbmNlIGxvY2tp
bmcNCj4gcmV3b3JrIGJlY2F1c2UgaXQgZGlyZWN0bHkgYWNjZXNzZWQgdGhlIGZlbmNl4oCZcyBz
cGlubG9jay4gVGhlIGhlbHBlcg0KPiBkbWFfZmVuY2Vfc3BpbmxvY2soKSBtdXN0IG5vdyBiZSB1
c2VkIHRvIG9idGFpbiB0aGUgc3BpbmxvY2suIFVwZGF0ZSB0aGUNCj4gc2VsZnRlc3QgdG8gdXNl
IGRtYV9mZW5jZV9zcGlubG9jaygpIGFjY29yZGluZ2x5Lg0KPiANCj4gRml4ZXM6IDFmMzJmMzEw
YTEzYyAoImRtYS1idWY6IGlubGluZSBzcGlubG9jayBmb3IgZmVuY2UgcHJvdGVjdGlvbiB2NSIp
DQo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IFNp
Z25lZC1vZmYtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KDQpS
ZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0K
LUpvbmF0aGFuIENhdml0dA0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvc2VsZnRl
c3RzL2k5MTVfYWN0aXZlLmMgfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvc2VsZnRlc3RzL2k5MTVfYWN0aXZlLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9zZWxm
dGVzdHMvaTkxNV9hY3RpdmUuYw0KPiBpbmRleCA1MjM0NTA3M2I0MDkuLjlmZWEyZmFiZWFjNCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvc2VsZnRlc3RzL2k5MTVfYWN0aXZl
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvc2VsZnRlc3RzL2k5MTVfYWN0aXZlLmMN
Cj4gQEAgLTMyMyw5ICszMjMsOSBAQCBzdGF0aWMgdm9pZCBhY3RpdmVfZmx1c2goc3RydWN0IGk5
MTVfYWN0aXZlICpyZWYsDQo+ICAJaWYgKCFmZW5jZSkNCj4gIAkJcmV0dXJuOw0KPiAgDQo+IC0J
c3Bpbl9sb2NrX2lycShmZW5jZS0+bG9jayk7DQo+ICsJc3Bpbl9sb2NrX2lycShkbWFfZmVuY2Vf
c3BpbmxvY2soZmVuY2UpKTsNCj4gIAlfX2xpc3RfZGVsX2VudHJ5KCZhY3RpdmUtPmNiLm5vZGUp
Ow0KPiAtCXNwaW5fdW5sb2NrX2lycShmZW5jZS0+bG9jayk7IC8qIHNlcmlhbGlzZSB3aXRoIGZl
bmNlLT5jYl9saXN0ICovDQo+ICsJc3Bpbl91bmxvY2tfaXJxKGRtYV9mZW5jZV9zcGlubG9jayhm
ZW5jZSkpOyAvKiBzZXJpYWxpc2Ugd2l0aCBmZW5jZS0+Y2JfbGlzdCAqLw0KPiAgCWF0b21pY19k
ZWMoJnJlZi0+Y291bnQpOw0KPiAgDQo+ICAJR0VNX0JVR19PTighdGVzdF9iaXQoRE1BX0ZFTkNF
X0ZMQUdfU0lHTkFMRURfQklULCAmZmVuY2UtPmZsYWdzKSk7DQo+IC0tIA0KPiAyLjM0LjENCj4g
DQo+IA0K
