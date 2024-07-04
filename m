Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBAF9270DC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 09:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6908210EA15;
	Thu,  4 Jul 2024 07:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFTGrFJi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B1710EA14;
 Thu,  4 Jul 2024 07:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720079323; x=1751615323;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zhfe2YdT+kJJkH8TLL5Zt+SIvq5QP3dVPeBx8W66V+Q=;
 b=aFTGrFJiDyk96Z1/CKihMTrmU/MtdAkyV0iUx1dlqCg87OXqEhBIuO0T
 08u+c2R4hdbxIMjDseAXn+N8sQ7bX25Rpn0kAm4ixM93fu8XfG9NwyK9t
 PqDoSHp1OSxHTfurgRWrktPNkOSG8PGMK2PqfMDHNJ0F4dfskKwOoKxbX
 E89Vdv6wMLjSTV3tDb6a4zHuSWNPhecBMy+C2hsZvO58TzKMIEgTWPwjG
 tNBnlw3SoTlDpwov8ZZQ491ptEQYsUCVVhjAoiYSE1n0BDyLKusoLyOZX
 sRhepHK/2DCfQtyoBmbUvnixWOTBMQfQja24g5n99YkvxIQ/p2CGzgaHA Q==;
X-CSE-ConnectionGUID: vj6GPKuDQjmUn6LzH8U/fA==
X-CSE-MsgGUID: R63qi+AqSm+IH6+iPwE3Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="28736665"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="28736665"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 00:48:43 -0700
X-CSE-ConnectionGUID: q4m6NYSMTsSlz7npawFFew==
X-CSE-MsgGUID: 5m+J5pYeT+2JAwgj6n6lsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="69705748"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jul 2024 00:48:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 4 Jul 2024 00:48:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 4 Jul 2024 00:48:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 4 Jul 2024 00:48:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 4 Jul 2024 00:48:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=byn4XOyuqjsHBhPmF6k+8VZO1AyBXZOijPlrtlEu95m3lx4Jbfuwn8tCYbaHoqusaQ2fjC6lQ5sKGhdW/DJD6JXqE8mrbN17lMN/AzbisHymC9WKfECSKZEoh59XzD0flG/k7zA8OUdo03mZxudXJxPy6eFixjfv/KOU+CT1MTp5O22Ym1jb2SfepBnQtdcM/Z0OC87qFrVIwI53zkcKuY8Yj3GrCa/k4dCp/E8ICGOB1NMZoaoVEfcTVLXNAjXQsQklwc0RQji5aRuzhoGZCiB+mAmzd+9oqHQdPaYzxsfrJRQ31JjGCcBK9XjgYfQe6YGUzkuLNrWSrzU0ijLzQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhfe2YdT+kJJkH8TLL5Zt+SIvq5QP3dVPeBx8W66V+Q=;
 b=asjcTd/Qlpx4k3OQUItlGIoDBMl93EzXQAq13tKE3n3rVUEMUhOKUaGHP3ugJyAQikgDk3CiJu7zDeifNofo9eqoWZqbCxJjktqvU/awWnXuwnkCWnbveeygzpTInbgOQatFvEa8RoHa3flfV3+/lUqM5K93HtEF6+81wuwSd2WxnzaO+hLNFH21DF7Y3yNyp7+0KYqUzCHdxpC78S+mgQYSkqDPyn+ZL7evttHiFlix4rLOqYMUKioglZ8gkBJq+RrvymaMQMwksGVO2nRA7VKreGbcdVCrh3nCmxv4ZV3bbj+/pD3kaizTU/eaXvBBCQJdx5UhPWLZltvuKFEoew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24)
 by DS0PR11MB8114.namprd11.prod.outlook.com (2603:10b6:8:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 07:48:40 +0000
Received: from BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::d113:e69e:54bf:3fea]) by BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::d113:e69e:54bf:3fea%4]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 07:48:39 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Mishra, Pallavi" <pallavi.mishra@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Yu, Effie" <effie.yu@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, "Souza, Jose" <jose.souza@intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] drm/xe: Use write-back caching mode for system memory on
 DGFX
Thread-Topic: [PATCH] drm/xe: Use write-back caching mode for system memory on
 DGFX
Thread-Index: AQHawmdCUYMF7oqo3kas6b/0usbP07HmSCnw
Date: Thu, 4 Jul 2024 07:48:39 +0000
Message-ID: <BN9PR11MB52751488AEFDE50B84ABEE67E7DE2@BN9PR11MB5275.namprd11.prod.outlook.com>
References: <20240619163904.2935-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240619163904.2935-1-thomas.hellstrom@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5275:EE_|DS0PR11MB8114:EE_
x-ms-office365-filtering-correlation-id: 6f6560bb-796f-45de-ae07-08dc9bfdb837
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bGdHa0VYaDBWTXVteFVFMkNWM2xPUk1QczdiSlJDNXI2VjBKUjk1bVAxRUx6?=
 =?utf-8?B?WExBNDZXWUd0b0VwdytITkpSM3RsTGtZaGpJVVE5WWZla2FJa04vZ1p3NjQ2?=
 =?utf-8?B?YTdCTjhPeG9wMWN2K2tOcFp4dXhwc1dDYktSWVJTeVhYYTR5VXpnSnRzcXp0?=
 =?utf-8?B?QkphWXNOekZJK3JkUW4wOXFIUkN0NnpMVmRxdWdCb1Y0ajhtS296TUJHTkJ4?=
 =?utf-8?B?UVJYWm5yM3FEVmYwdUJmNlBVRFlKUnRKVTJoVytTVHhMMDlsdUt5YjdQaE5I?=
 =?utf-8?B?RFduSjd2MjlLUU5aVHgzSTViSjZxVzBSZWNuc29teVNoU0gyWGdwU0pmazFK?=
 =?utf-8?B?ZkhYNnNzdzQ5WkFNNWs1YmFQNHR3SlRPZWJydU5weDNvbFlubHVmdlhkQjFC?=
 =?utf-8?B?akxKTTFPbzU4enhhc0JlbjFvMUFCYTNvRU5xWkxlRFhaaDRPS3JEcDhzRmtT?=
 =?utf-8?B?emc2MTdqd1N2VmprUTZScVlLWDF6ZCt1RmNYTlBVUlZVblF0OWVLcWM5dGhx?=
 =?utf-8?B?TVErU2xyQTJJckJ3eFZqRGg4K0llaTNYWkZMclpQUmN5N2QyT0I2ZTRpMWpZ?=
 =?utf-8?B?MVZsMXdmdjR5Y0kyeXpEMldqeVdPSGYvRmZaK1IzcTNYNlpJdm80RE1GM0tk?=
 =?utf-8?B?N3FXcHF0Z3hsdUlrSFBzTE41VUVpT2JnL3p2WTJpOVVrYUhGRE1EU3NzMFpq?=
 =?utf-8?B?cmVtN3ZSTUtYd0YyTlgyazI0Z1ZzLzQ2RkRycnE0cDRJZFRHWHB3cGpQb2hy?=
 =?utf-8?B?OEw0YmFuQnJra3dNV1MzajN1TGl0RWVqUXBjWk41L1U5OXNPeDFRVDdhYjNW?=
 =?utf-8?B?dlJwb01JbVpiUDJuZDdhZ0RXNFg2ejU4bkpIaUwrVjBMR003R21kdGhleEtr?=
 =?utf-8?B?R09TakdDemprck5Kam9TTThyZkM0Q2tqZXM2dUtRWittdmFHRDNzUmFLOVR2?=
 =?utf-8?B?dWw2NlhUWUJJd1c2c3dIMnczVW1kRmJOREJHdUUrOU5oaCsxVkUzQTJqT1Iz?=
 =?utf-8?B?WE55VTNhUDF6Tm11MXBweDM0UUVjNEE4Z2ZlY0F5WjhUa2N3cUttSGNBdG5I?=
 =?utf-8?B?a3dpd0thOHhXZzhKTGdpSkEwU1NseUlEeTlRWFVPdk9QbHFYeS9VenArd0p6?=
 =?utf-8?B?SG1LTzFVS1dTb3Y5cTE3TXdHOFZucWhHMVBYYW5PTm81SzFDbWhsd0ZuVHVE?=
 =?utf-8?B?SUtLdFhSY1F2R1JpV1I4QVlac3dWL01xdnB4NUljN0xtR0Y3TVJHTEpxTkVj?=
 =?utf-8?B?TEkwcHhpdWh2YUQwWHVQSDJvZE5TM3ZzamNiRlFwM2QxblRCVTRFNDVMdWlY?=
 =?utf-8?B?Z3FIOU94ditoYlFORHBRZUxDMjhrWS9LeUt6d3pKUDdqK1A3ZFhNMDFkRjlK?=
 =?utf-8?B?OUFGZmRaU1ZyZWdLdVFzZnFQYVFrMGVGMDh0Y2dxNS9haHRHT0pIdnJrRVIy?=
 =?utf-8?B?U2JrOGxjR2Z1NGN2UDdHSTJwUVZkWG1ZOW8ra2JaWUZWY3ZYQ09yd1BPb1Nk?=
 =?utf-8?B?NmRhSnVvTEFMclJSOUpaZ2RmajA0RDVuWURGcW9JRnlsekltUVJLMVhvY2Jj?=
 =?utf-8?B?MzI3Vng3YkwrcGVzNisvcHZaU0hmN3lUU2RKL1BBVVQ1ZVdpanMvNkJUVllv?=
 =?utf-8?B?d2NKcm40Z2hHRWNJM3E4YjZaVlZKd1c3TDhSQWh4SnQyOG1hN2M0eWhYRlkw?=
 =?utf-8?B?dVZSdnZ4czlxUmpRS3loSnM1VTIvL2dSUUhsK3RSaG8zOXVxaXNkY01MTVBJ?=
 =?utf-8?B?ZVhrSzFIbmNwQnlCK2hFcUtiUkhSZjFqQ3JQN3VVb2ZvUDZZc2hQbE12V3V3?=
 =?utf-8?B?QVhXR2UyNFpJN2s3N2ZtSk05VlV1MzRJcnZldVZhV25KV3RJbzEyaGRCUWx2?=
 =?utf-8?B?ZUdOL0c1VTQ2V3ZvUVBYRStkNnYyZ2xrWnZSNDZNamduVmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5275.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDNBNHF3N2xxUDJjdWQzcG9QcWJadUVRUzc5bTROcjNnK2FwSllGcHBMd2Uz?=
 =?utf-8?B?NVdaWjBCSlBLTHBpanBFeHVPMXlGUHdsbDMxZVFFSHZySm52UURIWWpkc09a?=
 =?utf-8?B?N3NJb3NiWEROWG40UlQvM1VOV1Fidy9ySmo3Qm5iVXd4clBLR2tKUXRNekM5?=
 =?utf-8?B?WStXZmlLMnZtdXB3c3Byb04rcmRINTJISzI4Z2VhQ2kvTUlCaTQzYk5kR3JQ?=
 =?utf-8?B?T29nQ2w1UEY4SlM1a1F3eG9FRGZaMmNDTHhHYjBORS9vWVFLUWtZbHBuRzla?=
 =?utf-8?B?Z01WRUdpV3QrVlRaaE02K1RWZitoZnNCVHRZZkV6UjZjdjcvaDZaSFF1VVIr?=
 =?utf-8?B?dG1od0JZZXhBQkpxbnRMYkRjZ3ROa1Rzd3NyRk9NenNKN3QrVkZXS2F1WVhE?=
 =?utf-8?B?VjJCTTdxLzFNL1Y1cXJPVnhPdFo3R3Zhb1lWVU4zcEdYSDVwZGV0NlhZeW0x?=
 =?utf-8?B?V2VSUFh0VXNIZEVyakQxS092UTVxbjd2SDBQWlN6akNtTk1LUXZQY3NjbUFl?=
 =?utf-8?B?bS9rcldxZy9EWnoveTc1ekFEbnlOZXRTanB2U1hTNE8yRllSTEZuUk9LN1dk?=
 =?utf-8?B?dVNsbFlDSjU2WDF4SG00NWdpWU9IWkFKeFNVenJ2L0RCR0Q2MmhBZnl5QXBP?=
 =?utf-8?B?emhPM3h6d0NlY2s4bEFYZnY2U0ZlcXB5Y3Z5TytUQVZzNGpjTkhxcXBuSm1h?=
 =?utf-8?B?Z2JPdEFZVFR0eWhoMXVqQXJvU0tzci9IUDNuR29IMWx1WklIZFVqNUU5YWZN?=
 =?utf-8?B?L09zc1JybUJlcDBoNzJIMUNhQmRWaDBsTndxdVowb3RTVG1LYWVnbTJJcks0?=
 =?utf-8?B?VlAwaXlIbDRTMG02Wmg5WWMzbm5yVEZFNHYxa2VhTjAzcmhPRjQ0eEVZTVgx?=
 =?utf-8?B?QTdvQ0dqY2hyV2ZaVHlpZ0piSkRUZnFZalIvM3l3NXlQVHFyQTQxa1FKNkRE?=
 =?utf-8?B?QnNydVhtTW1QQmJUZGp0UEtRNXF0Q3ZVekpLMEZqYmlXQUxibEdyS2x1MjNx?=
 =?utf-8?B?L1U5ZEViVTVOYlkrSFIxeVllWXZ2WU5QTURZSnh1cU8xeVNyZWpBdWdmNEZ5?=
 =?utf-8?B?azBrV1NnanVxckZ5eFh6c3QweWVTQTlkcmxQRHJyb2hWNW9aTTNmV2c3SDlv?=
 =?utf-8?B?dDlHOHM4R0JWNExEUHR4akFycFVKdjI1dGs2TXVlZEtxRjNGeUxjMlpTZEdL?=
 =?utf-8?B?SFExUkhXbTIvbXlHTThBOU1NMzYwMHpGZVlFVmZPNk9aaFRkRUJJampUaHFs?=
 =?utf-8?B?ZkI5SDNmTFV0M0pCUFQrWEUvV3l6aEVGYjNVNmNOUjEzeDROeGtXa256S2NR?=
 =?utf-8?B?UCs3QTZoOEtWVlA4MjJmK1BFV3hIcW8rckVFVnBodUFRM0JJNERjQlZqL2VH?=
 =?utf-8?B?MGhQUEFIUFhlODNQR2tNaU5jTjlIN1l4TW1sTXQ0amlYMCsyLzR6cTBwNGI4?=
 =?utf-8?B?SlBiNzBKRXR2ZjRtZ2Y3ZktzUEFZSDByaXJhZmEvbG91T3gxR2drMkxjR0RF?=
 =?utf-8?B?YzVNOTUwSS9ISXlLNjR5WEF3V09kZEdrVHZ4OUFFQkJkOHpuYVBKTksvUUNN?=
 =?utf-8?B?MStVODhhaERoUmp6b1BvL29FU2lIbWI5MmxNbVZJWnQ1bTBPY3M2dm9Id3Uw?=
 =?utf-8?B?aUc1K0orOHMreTA4YU5BZFJuVUlNMFlFM1BKemF0cDJMSmJlTXd4azQwQ3Zl?=
 =?utf-8?B?WitpV0Z0WEQyWmNKWDVNSmc2WGJpY2hvcXYrNkhxNjl6MlgrbGJIWHpBdnhZ?=
 =?utf-8?B?bWNvQlpJcnQ5L1JGOGh6TWxjRmhPTVVKdGhwbXZURzg0SGVaVkJ6bmlFMzRE?=
 =?utf-8?B?SHJQTHBEeENnTVI2Rk5sRGpsK0ZaYVJTYjIxSWJEY25kd2Z6SnhUdlJXQWtt?=
 =?utf-8?B?Q2pUdFNScXZkQ05yeFVjZ1lFVDIwWjJwRUVaRnBSaGU0aUI1M2pWNnJWZkJn?=
 =?utf-8?B?ZXREd0s2THdvazBvY0VkQTNCeENwQWl0SGZjU2YxQWNYT3NkSjl2aDFtdjlE?=
 =?utf-8?B?M1duZ2ZFS0UrU1ltY1JEaHVMeCtWU3dyanpjbnk5cUVDb1FsYVRhTGxBZFhX?=
 =?utf-8?B?aFhnd2dsQVVidUh6WHVNc0ZRY3NYbm1hZXBxUVdXV1VCUlhjcFErYUxJSi8r?=
 =?utf-8?Q?yOl5ukOoPguu73owxVLMNBOlG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5275.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6560bb-796f-45de-ae07-08dc9bfdb837
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2024 07:48:39.9159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e4cO595FRPBAwKzLev4mt51ZioGW12UIYzjLk4hsMSzburX4/Jv/XqPDoXqw7yA8eZdqC0WSul8ipJKZXsJlJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8114
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

VGhlIGNhY2hpbmcgbW9kZSBmb3IgYnVmZmVyIG9iamVjdHMgd2l0aCBWUkFNIGFzIGEgcG9zc2li
bGUgcGxhY2VtZW50IHdhcyBmb3JjZWQgdG8gd3JpdGUtY29tYmluZWQsIHJlZ2FyZGxlc3Mgb2Yg
cGxhY2VtZW50Lg0KDQpIb3dldmVyLCB3cml0ZS1jb21iaW5lZCBzeXN0ZW0gbWVtb3J5IGlzIGV4
cGVuc2l2ZSB0byBhbGxvY2F0ZSBhbmQgZXZlbiB0aG91Z2ggaXQgaXMgcG9vbGVkLCB0aGUgcG9v
bCBpcyBleHBlbnNpdmUgdG8gc2hyaW5rLCBzaW5jZSBpdCBpbnZvbHZlcyBnbG9iYWwgQ1BVIFRM
QiBmbHVzaGVzLg0KDQpNb3Jlb3ZlciB3cml0ZS1jb21iaW5lZCBzeXN0ZW0gbWVtb3J5IGZyb20g
VFRNIGlzIG9ubHkgcmVsaWFibHkgYXZhaWxhYmxlIG9uIHg4NiBhbmQgREdGWCBkb2Vzbid0IGhh
dmUgYW4geDg2IHJlc3RyaWN0aW9uLg0KDQpTbyByZWdhcmRsZXNzIG9mIHRoZSBjcHUgY2FjaGlu
ZyBtb2RlIHNlbGVjdGVkIGZvciBhIGJvLCBpbnRlcm5hbGx5IHVzZSB3cml0ZS1iYWNrIGNhY2hp
bmcgbW9kZSBmb3Igc3lzdGVtIG1lbW9yeSBvbiBER0ZYLg0KDQpDb2hlcmVuY3kgaXMgbWFpbnRh
aW5lZCwgYnV0IHVzZXItc3BhY2UgY2xpZW50cyBtYXkgcGVyY2VpdmUgYSBkaWZmZXJlbmNlIGlu
IGNwdSBhY2Nlc3Mgc3BlZWRzLg0KDQpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8
dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQpGaXhlczogNjIyZjcwOWNhNjI5ICgi
ZHJtL3hlL3VhcGk6IEFkZCBzdXBwb3J0IGZvciBDUFUgY2FjaGluZyBtb2RlIikNCkNjOiBQYWxs
YXZpIE1pc2hyYSA8cGFsbGF2aS5taXNocmFAaW50ZWwuY29tPg0KQ2M6IE1hdHRoZXcgQXVsZCA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQpDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29t
Pg0KQ2M6IEVmZmllIFl1IDxlZmZpZS55dUBpbnRlbC5jb20+DQpDYzogTWF0dGhldyBCcm9zdCA8
bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4u
bGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCkNjOiBKb3NlIFNvdXphIDxqb3NlLnNvdXphQGlu
dGVsLmNvbT4NCkNjOiBNaWNoYWwgTXJvemVrIDxtaWNoYWwubXJvemVrQGludGVsLmNvbT4NCkNj
OiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2Ni44Kw0KLS0tDQogZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2JvLmMgICAgICAgfCA0NyArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQ0K
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ib190eXBlcy5oIHwgIDMgKy0NCiBpbmNsdWRlL3VhcGkv
ZHJtL3hlX2RybS5oICAgICAgICB8ICA4ICsrKysrLQ0KIDMgZmlsZXMgY2hhbmdlZCwgMzcgaW5z
ZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jIGluZGV4IDY1YzY5Njk2
NmU5Ni4uMzExOTJkOTgzZDllIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Jv
LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQpAQCAtMzQzLDcgKzM0Myw3IEBA
IHN0YXRpYyBzdHJ1Y3QgdHRtX3R0ICp4ZV90dG1fdHRfY3JlYXRlKHN0cnVjdCB0dG1fYnVmZmVy
X29iamVjdCAqdHRtX2JvLA0KIAlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IHhlX2JvX2RldmljZShi
byk7DQogCXN0cnVjdCB4ZV90dG1fdHQgKnR0Ow0KIAl1bnNpZ25lZCBsb25nIGV4dHJhX3BhZ2Vz
Ow0KLQllbnVtIHR0bV9jYWNoaW5nIGNhY2hpbmc7DQorCWVudW0gdHRtX2NhY2hpbmcgY2FjaGlu
ZyA9IHR0bV9jYWNoZWQ7DQogCWludCBlcnI7DQogDQogCXR0ID0ga3phbGxvYyhzaXplb2YoKnR0
KSwgR0ZQX0tFUk5FTCk7IEBAIC0zNTcsMjYgKzM1NywzNSBAQCBzdGF0aWMgc3RydWN0IHR0bV90
dCAqeGVfdHRtX3R0X2NyZWF0ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKnR0bV9ibywNCiAJ
CWV4dHJhX3BhZ2VzID0gRElWX1JPVU5EX1VQKHhlX2RldmljZV9jY3NfYnl0ZXMoeGUsIGJvLT5z
aXplKSwNCiAJCQkJCSAgIFBBR0VfU0laRSk7DQogDQotCXN3aXRjaCAoYm8tPmNwdV9jYWNoaW5n
KSB7DQotCWNhc2UgRFJNX1hFX0dFTV9DUFVfQ0FDSElOR19XQzoNCi0JCWNhY2hpbmcgPSB0dG1f
d3JpdGVfY29tYmluZWQ7DQotCQlicmVhazsNCi0JZGVmYXVsdDoNCi0JCWNhY2hpbmcgPSB0dG1f
Y2FjaGVkOw0KLQkJYnJlYWs7DQotCX0NCi0NCi0JV0FSTl9PTigoYm8tPmZsYWdzICYgWEVfQk9f
RkxBR19VU0VSKSAmJiAhYm8tPmNwdV9jYWNoaW5nKTsNCi0NCiAJLyoNCi0JICogRGlzcGxheSBz
Y2Fub3V0IGlzIGFsd2F5cyBub24tY29oZXJlbnQgd2l0aCB0aGUgQ1BVIGNhY2hlLg0KLQkgKg0K
LQkgKiBGb3IgWGVfTFBHIGFuZCBiZXlvbmQsIFBQR1RUIFBURSBsb29rdXBzIGFyZSBhbHNvIG5v
bi1jb2hlcmVudCBhbmQNCi0JICogcmVxdWlyZSBhIENQVTpXQyBtYXBwaW5nLg0KKwkgKiBER0ZY
IHN5c3RlbSBtZW1vcnkgaXMgYWx3YXlzIFdCIC8gdHRtX2NhY2hlZCwgc2luY2UNCisJICogb3Ro
ZXIgY2FjaGluZyBtb2RlcyBhcmUgb25seSBzdXBwb3J0ZWQgb24geDg2LiBER0ZYDQorCSAqIEdQ
VSBzeXN0ZW0gbWVtb3J5IGFjY2Vzc2VzIGFyZSBhbHdheXMgY29oZXJlbnQgd2l0aCB0aGUNCisJ
ICogQ1BVLg0KIAkgKi8NCi0JaWYgKCghYm8tPmNwdV9jYWNoaW5nICYmIGJvLT5mbGFncyAmIFhF
X0JPX0ZMQUdfU0NBTk9VVCkgfHwNCi0JICAgICh4ZS0+aW5mby5ncmFwaGljc192ZXJ4MTAwID49
IDEyNzAgJiYgYm8tPmZsYWdzICYgWEVfQk9fRkxBR19QQUdFVEFCTEUpKQ0KLQkJY2FjaGluZyA9
IHR0bV93cml0ZV9jb21iaW5lZDsNCisJaWYgKCFJU19ER0ZYKHhlKSkgew0KKwkJc3dpdGNoIChi
by0+Y3B1X2NhY2hpbmcpIHsNCisJCWNhc2UgRFJNX1hFX0dFTV9DUFVfQ0FDSElOR19XQzoNCisJ
CQljYWNoaW5nID0gdHRtX3dyaXRlX2NvbWJpbmVkOw0KKwkJCWJyZWFrOw0KKwkJZGVmYXVsdDoN
CisJCQljYWNoaW5nID0gdHRtX2NhY2hlZDsNCisJCQlicmVhazsNCisJCX0NCisNCisJCVdBUk5f
T04oKGJvLT5mbGFncyAmIFhFX0JPX0ZMQUdfVVNFUikgJiYgIWJvLT5jcHVfY2FjaGluZyk7DQor
DQorCQkvKg0KKwkJICogRGlzcGxheSBzY2Fub3V0IGlzIGFsd2F5cyBub24tY29oZXJlbnQgd2l0
aCB0aGUgQ1BVIGNhY2hlLg0KKwkJICoNCisJCSAqIEZvciBYZV9MUEcgYW5kIGJleW9uZCwgUFBH
VFQgUFRFIGxvb2t1cHMgYXJlIGFsc28NCisJCSAqIG5vbi1jb2hlcmVudCBhbmQgcmVxdWlyZSBh
IENQVTpXQyBtYXBwaW5nLg0KKwkJICovDQorCQlpZiAoKCFiby0+Y3B1X2NhY2hpbmcgJiYgYm8t
PmZsYWdzICYgWEVfQk9fRkxBR19TQ0FOT1VUKSB8fA0KKwkJICAgICh4ZS0+aW5mby5ncmFwaGlj
c192ZXJ4MTAwID49IDEyNzAgJiYNCisJCSAgICAgYm8tPmZsYWdzICYgWEVfQk9fRkxBR19QQUdF
VEFCTEUpKQ0KKwkJCWNhY2hpbmcgPSB0dG1fd3JpdGVfY29tYmluZWQ7DQorCX0NCiANCiAJaWYg
KGJvLT5mbGFncyAmIFhFX0JPX0ZMQUdfTkVFRFNfVUMpIHsNCiAJCS8qDQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvX3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Ym9fdHlwZXMuaA0KaW5kZXggODY0MjJlMTEzZDM5Li4xMDQ1MGYxZmJiZGUgMTAwNjQ0DQotLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm9fdHlwZXMuaA0KKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2JvX3R5cGVzLmgNCkBAIC02Niw3ICs2Niw4IEBAIHN0cnVjdCB4ZV9ibyB7DQogDQog
CS8qKg0KIAkgKiBAY3B1X2NhY2hpbmc6IENQVSBjYWNoaW5nIG1vZGUuIEN1cnJlbnRseSBvbmx5
IHVzZWQgZm9yIHVzZXJzcGFjZQ0KLQkgKiBvYmplY3RzLg0KKwkgKiBvYmplY3RzLiBFeGNlcHRp
b25zIGFyZSBzeXN0ZW0gbWVtb3J5IG9uIERHRlgsIHdoaWNoIGlzIGFsd2F5cw0KKwkgKiBXQi4N
CiAJICovDQogCXUxNiBjcHVfY2FjaGluZzsNCiANCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkv
ZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBpbmRleCA5M2UwMGJlNDRi
MmQuLjExODliMzA0NDcyMyAxMDA2NDQNCi0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgN
CisrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCkBAIC03ODMsNyArNzgzLDEzIEBAIHN0
cnVjdCBkcm1feGVfZ2VtX2NyZWF0ZSB7DQogI2RlZmluZSBEUk1fWEVfR0VNX0NQVV9DQUNISU5H
X1dDICAgICAgICAgICAgICAgICAgICAgIDINCiAJLyoqDQogCSAqIEBjcHVfY2FjaGluZzogVGhl
IENQVSBjYWNoaW5nIG1vZGUgdG8gc2VsZWN0IGZvciB0aGlzIG9iamVjdC4gSWYNCi0JICogbW1h
cGluZyB0aGUgb2JqZWN0IHRoZSBtb2RlIHNlbGVjdGVkIGhlcmUgd2lsbCBhbHNvIGJlIHVzZWQu
DQorCSAqIG1tYXBpbmcgdGhlIG9iamVjdCB0aGUgbW9kZSBzZWxlY3RlZCBoZXJlIHdpbGwgYWxz
byBiZSB1c2VkLiBUaGUNCisJICogZXhjZXB0aW9uIGlzIHdoZW4gbWFwcGluZyBzeXN0ZW0gbWVt
b3J5IChpbmNsdWRpbmcgZXZpY3RlZA0KKwkgKiBzeXN0ZW0gbWVtb3J5KSBvbiBkaXNjcmV0ZSBH
UFVzLiBUaGUgY2FjaGluZyBtb2RlIHNlbGVjdGVkIHdpbGwNCisJICogdGhlbiBiZSBvdmVycmlk
ZGVuIHRvIERSTV9YRV9HRU1fQ1BVX0NBQ0hJTkdfV0IsIGFuZCBjb2hlcmVuY3kNCisJICogYmV0
d2VlbiBHUFUtIGFuZCBDUFUgaXMgZ3VhcmFudGVlZC4gVGhlIGNhY2hpbmcgbW9kZSBvZg0KKwkg
KiBleGlzdGluZyBDUFUtbWFwcGluZ3Mgd2lsbCBiZSB1cGRhdGVkIHRyYW5zcGFyZW50bHkgdG8N
CisJICogdXNlci1zcGFjZSBjbGllbnRzLg0KIAkgKi8NCiAJX191MTYgY3B1X2NhY2hpbmc7DQog
CS8qKiBAcGFkOiBNQlogKi8NCi0tDQoyLjQ0LjANCg0KQWNrZWQtYnk6IE1pY2hhbCBNcm96ZWsg
PG1pY2hhbC5tcm96ZWtAaW50ZWwuY29tPg0K
