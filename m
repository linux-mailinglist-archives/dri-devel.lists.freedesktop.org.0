Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBFB9F664B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 13:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4265310E313;
	Wed, 18 Dec 2024 12:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSMgIrof";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EEF10E267;
 Wed, 18 Dec 2024 12:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734526773; x=1766062773;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q/IDGzmlfvCwf+v4bolIC51ugU/hDh1TOEcMxLRVcM8=;
 b=CSMgIrofrDVCZlS3PnTcaEJs1Zu9B+Edxta0yKz4MwvL1/upj4gsHZiA
 On4jWFYeLOWWG1MkpLOyGOcvQTkQ8syk3Ki2jvShbAxq2ev5oiRdw/9mu
 gPhnhGMBtXUMmrjONDh31Yw9BleQkNVGK0EVtpeXC9mhknd8Exoncc3hp
 lQ7vbo9dhC2wnOpY89Bw4Bf5Y1eW859SQS8fDu2rxKurCY5aXssHPL6Bi
 RhYBlNbbxccGgEbWfCjabXygPOUDC76T6uHi0VJq1hfglzlVgn/PxBdFW
 uUQcTxGkE7gfFDqZ/f3QcBylUppPQ/pXNbA0GbuV2tXw4OIOddc64miUf Q==;
X-CSE-ConnectionGUID: 6zycc398TW6tNQfWCNVtYQ==
X-CSE-MsgGUID: Fy96Hd/fRzedlL7UZS3hNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35153283"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="35153283"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:59:32 -0800
X-CSE-ConnectionGUID: TtInyW0nQ1aDP6IXYFqHDg==
X-CSE-MsgGUID: yAMycYHYTjOzLL9k8ykmyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97697642"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 04:59:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 04:59:31 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 04:59:31 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 04:59:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAq4CFAMXQbhG/ob29o2BO07uCaJf5WbDGFdBwoxuZewwDLyCMuPc8+6w+tAWA8dKMfBJL6n4qliqOjEU2ZgmD4l4J2XiYxjAAEzNVGIP43l5DIhQYJ0tqf9VOte+sQYtt1ioiYfkYQegotF8Pj83dSGMxszRW/XRoeAWHCwjErq0NnNANzqVahIBX0tBEhCqbqY+q+2I3BGq0rnBOe29CGA8wfkclrrsmt7JZH3ltuXtv/k7m+Yuddd0/jvPQ4o6OM40HONg7XUJksN1X5Ram4yPcoz/KkMenjxe9U6seoH3eWJYDApIstig3KqrltqVt7wFEpzdx+1fT0VThVaLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/IDGzmlfvCwf+v4bolIC51ugU/hDh1TOEcMxLRVcM8=;
 b=TXc9nrqey9yJ4kKnycvWHLI6AgLDTOv3RKzM/FK8fKnKVQvNrfzM//tSxKKJjwa3uCJqi5rnD0tnyGG/jayCnX1mTaMjotjtRnGOJgAExHYtThsgf+hoDkIYLVxZRoVMNu4r4c4OSIFD9WZ0Onxni3t9sTmAzTKqhVao3sq687bfWfVXEo5OM63rd/cHpfl2H/6RZ7lOsQWYsvi6C6vJmrZr03UgV1DK/xlLxWX9ich1b3wHHzZsFaYEXdnpLoziVNoLuKYQS2WptE8EZ5sSaLxvFJBpDj4ONdO9RYeVp0jAoV7UZXDh48UVr0aTszPkQx3IqI10eDzk2ztIRyCx5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB6380.namprd11.prod.outlook.com (2603:10b6:510:1f8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 12:59:29 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%3]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 12:59:29 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Graunke, Kenneth W" <kenneth.w.graunke@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, "Souza, Jose" <jose.souza@intel.com>,
 "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "mihail.atanassov@arm.com"
 <mihail.atanassov@arm.com>, "steven.price@arm.com" <steven.price@arm.com>,
 "shashank.sharma@amd.com" <shashank.sharma@amd.com>
Subject: RE: [RFC PATCH 13/29] drm/xe/mmap: Add mmap support for PCI memory
 barrier
Thread-Topic: [RFC PATCH 13/29] drm/xe/mmap: Add mmap support for PCI memory
 barrier
Thread-Index: AQHbOhLnr9P+QDC2/U2OkioWQJ142LK+X6UAgAAgmoCAAAyNAIAtlp6g
Date: Wed, 18 Dec 2024 12:59:28 +0000
Message-ID: <SJ1PR11MB6204D7160B4D5F2E49B1FB8581052@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
 <20241118233757.2374041-14-matthew.brost@intel.com>
 <ec16da8d-6e1b-4774-93d6-594bc30e2b78@amd.com>
 <173201744524.36213.9384132621937199725@jlahtine-mobl.ger.corp.intel.com>
 <BN9PR11MB5275E8A957135B22E8256570E7202@BN9PR11MB5275.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB5275E8A957135B22E8256570E7202@BN9PR11MB5275.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB6380:EE_
x-ms-office365-filtering-correlation-id: 9374441c-6367-4796-1651-08dd1f63ceea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TFlWdEpBemVCZGxCMTZZZ3NHMmEvazFucmQ4MTM5YlIzS3p6WlZxRkpVVlNC?=
 =?utf-8?B?clhYcGJVcWZpNWFiUFJ4ZnEzU3BLTi9uZjN5RkxFenBSV05KeW94RTJuR2tK?=
 =?utf-8?B?QWNkNXBrK04xK3l3VDVkZmxtbEQvRGJxVFprcEVKV2dqSDlwV0x0M2QxUEgw?=
 =?utf-8?B?UFdITHlVTFBWZ0J5SkkwbklYdXRYMGlCWWlmMEYvb3JZenlVeUlES1NGai93?=
 =?utf-8?B?cXVFVFpEcTA4RWw5WXRKTm9MRjdMR0RoMW9ySlhoUVJSaHo3UXVjcnhyRDdX?=
 =?utf-8?B?NW4wTTgzUmtVUmFIRDdYSnNlY3JEVTNqRTBZNEFLdFJPWFBWS1BpekJxQUR1?=
 =?utf-8?B?Mk9lL3BiMVhvTmlMaHRmU1VDZEtwTUJyZEhtcVdsdWRySlNYblNTb0Q4ZEt4?=
 =?utf-8?B?SEFiOHRMQTJFYndzZEJNaFNnbTViQ3BPaFZ0VDVCTTFpbU4yeXJRQm9ESlkz?=
 =?utf-8?B?NCs1SWJDQ3ZTcUFWOXZ2OXlUZ1R1ckNWVngyN2YzaElGTkdYN0wvZWlPcXdV?=
 =?utf-8?B?My9zNGorWHUrSEJ6N0Z4N3BNaTRLR3AyN2F2TFc0Ymc2aHNNck82MFMxOFdD?=
 =?utf-8?B?UkV2SDVsVDJVdlA0bWtmRnpWY21FQVRJd0lHRVVtc1FxdG0rWjhpWnJ6TEls?=
 =?utf-8?B?a0xjRXNpenA1UXlzZ3dVSjlHb2RjMGY5ZWErWjQwSW5BNTFlMXZkS3pCbGFQ?=
 =?utf-8?B?disrWXJJanR0bnhTbHdCMXRCNmRPbTl5azl2d2pYRmE2NmxEbGw4MitpQ3dQ?=
 =?utf-8?B?NGk0Tk0rdzFqWWVJc2dTWFhjeWl3RzhLMVJGRnNzUjd6REdLOHIrN0o0SjhY?=
 =?utf-8?B?L0RVWnJZYmgwZUpNOHVHcE1YQlh2OXllOEhrVzZvdE5wVVhueVVaY3YwZFB0?=
 =?utf-8?B?R0JiUlZxWkJndnNra3ZVWEg2aFNxKy9hZkZIbC9sYk5kWUh0Y3QyaGpGaHpF?=
 =?utf-8?B?WTcwT1ZvOFpsQldnemNCUTlZcWNZLytvZGRTUkQxdVM1UFhndTB2emhDS3c3?=
 =?utf-8?B?Mzl1cmcweGVtYm1tVXFXV3RkQ3BOTGJRK29tMnZkbExWdE11ODUzdmpEdFcx?=
 =?utf-8?B?a3hkTXpCVDBaY3hhOFl4NVNXenB4MGE0VTdqVTRNNFB2UUJicXhOakZOcG03?=
 =?utf-8?B?RTdGMmJ0dmwwTCtxU29WNE1ya1JHeTlnTlZEbmhKMittaDlBTkJaZUoxL3Nn?=
 =?utf-8?B?UG1KR1FqNlhISlcvY1BEOFVYSkN0MWhLQ3MwRDAycXdCNXZtd2ZJc2s0TXV5?=
 =?utf-8?B?aWFpRkVad2pxd01wSFM4WUwzTjBVUHVORzR6bFpqRFpuWGVJYTlnNzhFNGpo?=
 =?utf-8?B?T0NUeDlvMjNkam1NdUc1R3BaL1hhRUVlR2JXeFZKd1JNcG9UOW1VU2Nka0Nu?=
 =?utf-8?B?bnVGQ3I2di9XQTJTK29QWkRGSWdBaDcwZVlDaGJJc1dYa1JjV294YlVNOUJS?=
 =?utf-8?B?MTg4aGtIUjY1eHdNVWJQQ1BOcnAxUzhnMHFvUmliRDFOS0R2WGhtTjNkaldr?=
 =?utf-8?B?SENBSnhFSlkxSzNib1lkeWd0dG9ERCtyellWMURVUGFpUlNTKzBXdVZLaWti?=
 =?utf-8?B?aUdINlM0ZzQ5T3Z6b0pBUHZjaHBsb3F3TGtwNlpZaDlHQmU5Sk55UmFlNlEw?=
 =?utf-8?B?SDlMbUpzYTd3eVRTaGI3MDZQZ3R4ZDAyMFBzK2d1WFlxTDRzS0IvWnpDdUdv?=
 =?utf-8?B?eHVaWEMwS1RRWEdOVnZjMG1TSFd6SXhVRjRpV0NRdWlKT3hQR1lScWthU3Ri?=
 =?utf-8?B?cnBNNkt6Y3FhOFprWVJIaXErT2Nmb3hvaUt4eld6VmdSSGUrZUlaTFpMNnFs?=
 =?utf-8?B?N3ZNc0NlbXBranZkczJYOGlIMkdUSWZBY2k5RnJWcHhjdDAzNlBEZnNYYU9M?=
 =?utf-8?Q?Iygx19bP/BuBT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDJPajE3NXkyUGpaZVYzUkxZRnZUN205OHNpTlVHTFY5S1pnWGZNam1sRGNW?=
 =?utf-8?B?MU5SazZNdFdGSFB4cHMxTjE5ZEx6N0JkZlZUQmFJRzl3OUg0cE1zZFhINlNB?=
 =?utf-8?B?emxyUGQ1WGcyaEQ2bnVTUk9EU1ltOXJ4c3crL29iS2lxVHF1TUNsZEw3Kyty?=
 =?utf-8?B?T3hGTUdDRE1scElYOGtHK1V0QmFRTFlwS2plWE1VQXlLa3F6Y3A2Y0YxWS84?=
 =?utf-8?B?TklISnlZNlkybzVybE9EVkM1elZjTGF4eDNEMHJoQ29EMFVDV2FnbDNIaVQr?=
 =?utf-8?B?aXZNV3Y0NFpqcWJDb3FXVDdmc2dyT0xXVGpFYkY0b2laS2toalBMa2lyaHov?=
 =?utf-8?B?OHFnRWVQUU9RUU00ZkdVRUMxTFUralhXSmxoVGNJekQ4aC9pT3B2c1c1dmpL?=
 =?utf-8?B?R1NYNlJjN3BQZXdJOEJyV3ROR1BnV2FJOGtIN1J4T0Z0TGtPTkVkSGFKR0Nl?=
 =?utf-8?B?MlROWWp5NzFiUnh6NE43Y1llN2hDTHB6b05YTytwb2luRXFDTUlzblBsK0dn?=
 =?utf-8?B?WFdqdWJLWi9kSndlMWtFRXBINlZ1M2IrSmtvcFkwcC9raUJ3MW1zMWpwTXNi?=
 =?utf-8?B?Q29JWUVQdWcvNXlIRDl1aE9QaThsYm5KRXlwRXMrQlBFMVAvMklCNUpiNWtz?=
 =?utf-8?B?M2ppYXRFdWFFUCtYaTlodWJDaHN4NytqK1Ara1MxeVlDeGJMNXBJa2lhRG9o?=
 =?utf-8?B?NW01cFZaZzVjVDBzWUczKzgwc0NLNDFYZ29hZnlEcjBkSE8vaHgvMUEwUXFr?=
 =?utf-8?B?TnRCWDV2Z1NzdW9FZTRhOTZMZGsraWl3UU0vb0cxaHFFeGhkL2g3Z0VaOVVx?=
 =?utf-8?B?NU1ZY0xrUzcwemMwbXlGUG5PWWZ6V0NKdUNLdmpHZVdFSlNyT3dTMnFENGFo?=
 =?utf-8?B?L3U1MGkzeVlmUHhHTmxSSzRiSjZyeU9aTkt3WjBDL3djRlRmMkt6WkpxSlU1?=
 =?utf-8?B?UHdXQ1FqQ1N3Ui9pbWQzQ2xEcWk0N0EwdGk1SXgwcElyeFlkMWR6UGJhUUNl?=
 =?utf-8?B?WktoRjREcndWUzJjMmtjQWlUMXErdm5JSUtjVzV6VThoVTdYR3VpdklCQjk1?=
 =?utf-8?B?aFpwbHhTV0drelE0M3lxYkhuajRLaWFNckRVdDBVblJwZWwzOWNGVE14UmdF?=
 =?utf-8?B?VzNYZUgycG5CLzRJdDFCem5SNVpxMENYSndmOWFmSjhLaDNXQmdxQUFGS0xy?=
 =?utf-8?B?OFB5Nzh3bDhIZmJXNG5JeWNJRTd4VklsY3JnQkxCR3BFVGhadTNuaFZSUTJW?=
 =?utf-8?B?MG1zZEVLLzYyMFUvYWw4MW1lYXVCT2lGemdIVDBLWEp5SEZwN2NhcU12U2Fm?=
 =?utf-8?B?UkFlSXZWMy9MdWZCa2k5M21SQkZkcDEvemk1YVFIWW1mRytkaksxcmZLRkRh?=
 =?utf-8?B?Ni8zdmtNNGFldm5aMG83T0M3Q2pybmUrdDFQV2tlQmoweEoyWmJ1eVZSQ251?=
 =?utf-8?B?RkJ2WFNHbU9lemV4b0hFc0xzZDhvWEtFbFhSekxvZG1PWWthdk1mTWRQbStF?=
 =?utf-8?B?K1ovQ1V3VU1aNnF4NjlGZXFMdnprL2xFQ0w2S3hZOXA1U0FVL2NxaGVQS1RT?=
 =?utf-8?B?OXZ5OXJ5QzZaQmlOVlBrV0hIc1NwNnA0OWtPME5NUVlvTWh6c2dlRnR2WXNJ?=
 =?utf-8?B?TTNjV3BhV3BSV0ZQVmszMkxpbVpVcmE4V0l6dEduNk0yaS9pZFFuM0Z5WTVB?=
 =?utf-8?B?YnVUR1JmSzNHSDJXeWdNbXp6TUNiUDRLaE5LMjFrWGM3bWwwaWlicnY3a3Zq?=
 =?utf-8?B?RHY0c1ozSVZHK21jejRTZEo5NlBOUG5sSHR0RFltVzUxVDVMbkQydHppVUtZ?=
 =?utf-8?B?aWRKNEYyaVRkaVpuVWpWaS82LzJoVW9wbmJDekIzMnlnMnZhZGxkUjVTdzRw?=
 =?utf-8?B?YnA2TTQyK2pnUGNWS2pWQzZTQURXcCsvNGhraFIwdTlOMm9qN0syMEI2QXk1?=
 =?utf-8?B?MmNOdkxlZWtVV3o0Z3dlbERUS0FJUzJ6ODZrOEZuSkRsMncxU1k1WTdPTmlr?=
 =?utf-8?B?Qm1pb3J2WkRjeWk0cHQxYS9WOXNHbzJNdndZdGZzRVVGbmd0czZvMHRCZGo5?=
 =?utf-8?B?S3B0OEMrSzc5Rnpja2RTNGRTc0NkRWZ6a1lKRS9ndFZHTlA4VThYRWJyaWtU?=
 =?utf-8?Q?UQvmQYF8jcbl5MBuer1bLnXar?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9374441c-6367-4796-1651-08dd1f63ceea
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 12:59:29.0013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aqrKpjVFtXHkNDZuHW1A3Sw7vduV0MDdeR4cO+7zG4oi3bC5q81M8v7mn3OO1+EF7PpdzkBv4sKqD6ywNhqFwxg50jlRpXwSfm9+PamjQ38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6380
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTXJvemVrLA0K
PiBNaWNoYWwNCj4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIgMTksIDIwMjQgNjoxMiBQTQ0KPiBU
bzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPjsgQ2hy
aXN0aWFuIEvDtm5pZw0KPiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPjsgQnJvc3QsIE1hdHRo
ZXcgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPjsNCj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBHcmF1bmtlLCBL
ZW5uZXRoIFcgPGtlbm5ldGgudy5ncmF1bmtlQGludGVsLmNvbT47IExhbmR3ZXJsaW4sIExpb25l
bA0KPiBHIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT47IFNvdXphLCBKb3NlIDxqb3Nl
LnNvdXphQGludGVsLmNvbT47DQo+IHNpbW9uYS52ZXR0ZXJAZmZ3bGwuY2g7IHRob21hcy5oZWxs
c3Ryb21AbGludXguaW50ZWwuY29tOw0KPiBib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbTsg
YWlybGllZEBnbWFpbC5jb207DQo+IG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbTsgc3RldmVuLnBy
aWNlQGFybS5jb207DQo+IHNoYXNoYW5rLnNoYXJtYUBhbWQuY29tDQo+IFN1YmplY3Q6IFJFOiBb
UkZDIFBBVENIIDEzLzI5XSBkcm0veGUvbW1hcDogQWRkIG1tYXAgc3VwcG9ydCBmb3IgUENJDQo+
IG1lbW9yeSBiYXJyaWVyDQo+IA0KPiAiQWRkaW5nIE1pY2hhbCBmcm9tIHRoZSBjb21wdXRlIHVz
ZXJzcGFjZSB0ZWFtIGZvciBzaGFyaW5nIHJlZmVyZW5jZXMgdG8NCj4gdGhlIGNvZGUuDQo+IA0K
PiBRdW90aW5nIENocmlzdGlhbiBLw7ZuaWcgKDIwMjQtMTEtMTkgMTI6MDA6NDQpDQo+ID4gQW0g
MTkuMTEuMjQgdW0gMDA6Mzcgc2NocmllYiBNYXR0aGV3IEJyb3N0Og0KPiA+ID4gRnJvbTogVGVq
YXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCj4gPiA+DQo+ID4gPiBJbiBv
cmRlciB0byBhdm9pZCBoYXZpbmcgdXNlcnNwYWNlIHRvIHVzZSBNSV9NRU1fRkVOQ0UsIHdlIGFy
ZQ0KPiA+ID4gYWRkaW5nIGEgbWVjaGFuaXNtIGZvciB1c2Vyc3BhY2UgdG8gZ2VuZXJhdGUgYSBQ
Q0kgbWVtb3J5IGJhcnJpZXINCj4gPiA+IHdpdGggbG93IG92ZXJoZWFkIChhdm9pZGluZyBJT0NU
TCBjYWxsIGFzIHdlbGwgYXMgd3JpdGluZyB0byBWUkFNDQo+ID4gPiB3aWxsIGFkZHMgc29tZSBv
dmVyaGVhZCkuDQo+ID4gPg0KPiA+ID4gVGhpcyBpcyBpbXBsZW1lbnRlZCBieSBtZW1vcnktbWFw
cGluZyBhIHBhZ2UgYXMgdW5jYWNoZWQgdGhhdCBpcw0KPiA+ID4gYmFja2VkIGJ5IE1NSU8gb24g
dGhlIGRHUFUgYW5kIHRodXMgYWxsb3dpbmcgdXNlcnNwYWNlIHRvIGRvIG1lbW9yeQ0KPiA+ID4g
d3JpdGUgdG8gdGhlIHBhZ2Ugd2l0aG91dCBpbnZva2luZyBhbiBJT0NUTC4NCj4gPiA+IFdlIGFy
ZSBzZWxlY3RpbmcgdGhlIE1NSU8gc28gdGhhdCBpdCBpcyBub3QgYWNjZXNzaWJsZSBmcm9tIHRo
ZSBQQ0kNCj4gPiA+IGJ1cyBzbyB0aGF0IHRoZSBNTUlPIHdyaXRlcyB0aGVtc2VsdmVzIGFyZSBp
Z25vcmVkLCBidXQgdGhlIFBDSQ0KPiA+ID4gbWVtb3J5IGJhcnJpZXIgd2lsbCBzdGlsbCB0YWtl
IGFjdGlvbiBhcyB0aGUgTU1JTyBmaWx0ZXJpbmcgd2lsbA0KPiA+ID4gaGFwcGVuIGFmdGVyIHRo
ZSBtZW1vcnkgYmFycmllciBlZmZlY3QuDQo+ID4gPg0KPiA+ID4gV2hlbiB3ZSBkZXRlY3Qgc3Bl
Y2lhbCBkZWZpbmVkIG9mZnNldCBpbiBtbWFwKCksIFdlIGFyZSBtYXBwaW5nIDRLDQo+ID4gPiBw
YWdlIHdoaWNoIGNvbnRhaW5zIHRoZSBsYXN0IG9mIHBhZ2Ugb2YgZG9vcmJlbGwgTU1JTyByYW5n
ZSB0bw0KPiA+ID4gdXNlcnNwYWNlIGZvciBzYW1lIHB1cnBvc2UuDQo+ID4NCj4gPiBXZWxsIHRo
YXQgaXMgcXVpdGUgYSBoYWNrLCBidXQgZG9uJ3QgeW91IHN0aWxsIG5lZWQgYSBtZW1vcnkgYmFy
cmllcg0KPiA+IGluc3RydWN0aW9uPyBFLmcuIG1fZmVuY2U/DQo+IA0KPiBJIGd1ZXNzIHlvdSBy
ZWZlciBvbiB0aGUgdXNlcnNwYWNlIHVzYWdlIGRpcmVjdGlvbnM/IFllYWgsIHRoZSB1c2Vyc3Bh
Y2UNCj4gZGVmaW5pdGVseSBoYXMgdG8gbWFrZSBzdXJlIHRoYXQgdGhlIHdyaXRlIGFjdHVhbGx5
IHByb3BhZ2F0ZWQgdG8gdGhlIFBDSSBidXMNCj4gYmVmb3JlIHRoZXkgY2FuIGFzc3VtZSB0aGUg
c2VyaWFsaXphdGlvbiB0byBoYXBwZW4gb24gdGhlIEdQVS4gSSB0aGluayB0aGUNCj4gdXNlcnNw
YWNlIGZvbGtzIHNob3VsZCBiZSBhYmxlIHRvIGV4cGxhaW4gaG93IGV4YWN0bHkgdGhlIG9yY2hl
c3RyYXRlIHRoYXQuDQo+IE1pY2hhbCwgY2FuIHlvdSBvciBzb21lYm9keSBlbHNlIHNoYXJlIHRo
ZSByZXNwZWN0aXZlIGxpbmVzIG9mIGNvZGUgaW4gdGhlDQo+IHVzZXJzcGFjZSBkcml2ZXI/DQo+
IA0KPiBBdCB0aGlzIHRpbWUsIHRoZSB1c2Vyc3BhY2Ugb25seSBlbmFibGVzIHRoaXMgb24gWDg2
LCBidXQgY291bGQgYWxzbyBzdXBwb3J0DQo+IG90aGVyIG1vcmUgZXhvdGljIHBsYXRmb3JtcyB2
aWEgbGlicGNpYWNjZXNzLg0KPiANCj4gPiBBbmQgd2h5IGRvbid0IHlvdSBleHBvc2UgdGhlIHJl
YWwgZG9vcmJlbGwgaW5zdGVhZCBvZiB0aGUgbGFzdA0KPiA+ICh1bnVzZWQ/KSBwYWdlIG9mIHRo
ZSBNTUlPIHJlZ2lvbj8NCj4gDQo+IERvb3JiZWxscyBhcmUgYSBjb21wbGV0ZSByZWQgaGVycmlu
ZyBoZXJlLg0KPiANCj4gQ2hvc2VuIHBhZ2UganVzdCBoYXBwZW5zIHRvIGJlIGEgZnVsbCA0SyBN
TUlPIHBhZ2Ugd2hlcmUgYW55IHdyaXRlcw0KPiBjb21pbmcgb3ZlciBQQ0kgYnVzIGdldCBkcm9w
cGVkIChhbmQgcmVhZHMgcmV0dXJuIHplcm8pIGJ5IHRoZSBHUFUuIFN1Y2gNCj4gZHVtbXkgKGZy
b20gQ1BVIHBvaW50IG9mIHZpZXcpIDRLIE1NSU8gcGFnZSBhbGxvd3MgZG9pbmcgYSBDUFUgd3Jp
dGUNCj4gdGhhdCBnZW5lcmF0ZXMgYSBQQ0kgYnVzIHRyYW5zYWN0aW9uLCB3aGVyZSB0aGUgdHJh
bnNhY3Rpb24gaXRzZWxmIGlzIGVzc2VudGlhbGx5DQo+IGEgTk9QLiBCdXQgYXMgdGhlIHRyYW5z
YWN0aW9uIGZhbGxzIGludG8gdGhlIE1NSU8gYWRkcmVzcyByYW5nZSwgaXQgd2lsbCB0cmlnZ2Vy
IGENCj4gc2VyaWFsaXphdGlvbiBvZiB0aGUgaW5jb21pbmcgdHJhZmZpYyBpbiB0aGUgR1BVIHNp
ZGUsIGJlZm9yZSBiZWluZyBpZ25vcmVkLg0KPiANCj4gUmVnYXJkcywgSm9vbmFzDQo+ICINCj4g
DQo+IEhlcmUgaXMgYXBwcm9wcmlhdGUgcGF0aDoNCj4gaHR0cHM6Ly9naXRodWIuY29tL2ludGVs
L2NvbXB1dGUtDQo+IHJ1bnRpbWUvYmxvYi9mNTg5NDA4ODQ4MTI4NDM0ZTQxMGI2YjRjMmE5MTA3
ZmY3OGE3NGU5L3NoYXJlZC9zb3UNCj4gcmNlL2RpcmVjdF9zdWJtaXNzaW9uL2RpcmVjdF9zdWJt
aXNzaW9uX2h3LmlubCNMNDM3DQo+IA0KPiBmbG93IGlzIGFzIGZvbGxvd3M6DQo+IDEuIGRvIHVw
ZGF0ZXMgdG8gc2hhcmVkIG1lbW9yeSBiZXR3ZWVuIENQVS9HUFUgdXNpbmcgV0MgbWVtb3J5DQo+
IG1hcHBpbmcgMi4gZW1pdCBzZmVuY2UgaW5zdHJ1Y3Rpb24gdG8gbWFrZSBzdXJlIHRoZXJlIGlz
IG5vIHJlb3JkZXJpbmcgb24gdGhlDQo+IENQVSBzaWRlIDMuIGVtaXQgcGNpQmFycmllciB3cml0
ZSAodGhpcyBwYXRjaCkgLCB0aGlzIGVuc3VyZXMgdGhhdCBhbGwgZWFybGllcg0KPiB0cmFuc2Fj
dGlvbnMgYXJlIHByb3Blcmx5IG9yZGVyZWQgZnJvbSB0aGUgR1BVIHNpZGUNCj4gDQo+IFNvIFBD
SSBtZW1vcnkgYmFycmllciBpcyBzdWJtaXR0ZWQgYWZ0ZXIgc2ZlbmNlIGluc3RydWN0aW9uIGFu
ZCB0aGF0IG1ha2VzDQo+IHN1cmUgdGhhdCBhbGwgZWFybGllciB0cmFuc2FjdGlvbnMgYXJlIHBy
b3Blcmx5IG9yZGVyZWQuDQo+IA0KPiBNaWNoYWwNCg0KaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3BhdGNoLzYyOTYyOC8gaXMgc2VwYXJhdGUgcmV2aWV3ZWQgc3VibWlzc2lvbiBp
bnRlbmRlZCBmb3IgbWVyZ2Ugc3RhbmRhbG9uZS4gSXQgd2lsbCBiZSBtZXJnZWQgaWYgdGhlcmUg
YXJlIG5vIG9iamVjdGlvbnMuDQoNClRoYW5rcywNClRlamFzDQo+IA0KDQo=
