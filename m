Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECA29F5F06
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 08:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F2C10E074;
	Wed, 18 Dec 2024 07:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VovHvt2Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32BB810E074
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 07:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734505364; x=1766041364;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bZiTjFR+63J8mx4FiNAluCE34dxgYmPuy9uCizpERc4=;
 b=VovHvt2ZVn/ziPXPXy+ZSpXWhUnQSKpQP3FgJu8V18B/MixYDgv1Ca83
 nxSCyRKGX66yDPRcyZg8ujLP9nPjKJeISpgLN1IYuHDJ/i3bNnLmxIrCc
 I9EQnVM5lzZW+RFzuHYtyguj77hLEAGHyPVvYK9H8KcGRFuRV1kVoPLm0
 B+uoV1Ylif9KRd4RdJEQ4lXiXGELEI/X+/jGAeX3ij+YCEIdHc1ouYYSn
 txsO/lHBWP0ybbb4LWqwBIHPVGgxx9hNadJvcXVigwz5XlzdUe+mXs/Z6
 zeZbN+zIq66gaDWJIZ3DsQyASDOm1RoIUBtr913wV5STrFIJhrsiRZ3IW Q==;
X-CSE-ConnectionGUID: C7Nrdm1RQVC2LuYK1zq/RQ==
X-CSE-MsgGUID: 26aGQvZuTPKZ1ffR3u3+Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="46376442"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="46376442"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 23:02:42 -0800
X-CSE-ConnectionGUID: ZbJO8qomQmGdXT7S/VuygQ==
X-CSE-MsgGUID: w2pZTiGZSumgtWHvadm+EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="98004332"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 23:02:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 23:02:38 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 23:02:38 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 23:02:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/Rmdi/ct6gdcN6xjWpliIO4W2gJMa8tc63GBCgdynVdsbF2xYdiW88Gvtey1R/NOfSBOOGTZjqI+4erF/T5hvZ35w8Gg2ifSBY6JpSGUvW5g5hpIj18j+yxlpGJ/hFWj6PgZFNKDVzmF4jruIkr4Po6fv940bWraB/eWn4Jd9iqDTZFURYGYKL2MsWK0U/HIfxzgK1VW7j21T1OLOmIld5tdK93qDr7G4c4taztuYRB1fbIpGVHsH/QiSS/zJ+NjWE1DlV8v7KUVrDPa/ryW/ts2eccpAou+GzwfTmj4w7cJDcMuX3fn0zvS0kTRD4Rvidio+VwVflGCEAWZN0ZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZiTjFR+63J8mx4FiNAluCE34dxgYmPuy9uCizpERc4=;
 b=LPNTJHlldGG1+NeEjhHEMAKikelPQIph+w226svr465/opnzMUWXqeOh+spMIG4Kx2vRSYweQSFRs3hchhBUbXbiSnN52mQF1wqq//eEYG4/iYCu1W7cMgocV9vvSCT29H6mdRRdZX9iRuHISiG1ckvdex1MElnLZV3ERGk/g5V16l8M1EZds5bPwVwlCJs14b5qM5SD2GiU2LZs3tPLJG+O8raxKOkDDsWUEXXh78T8xV1aDkAYyGKDxACrAG3Zqh7i8r0ruObLCthj0M8GO5t1X9h2oahVp5TyQgBFztw7P0KeE1+UFrR3wU31m8QbPW8GEZcJZWFwDQVnYj3u1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by MN0PR11MB6036.namprd11.prod.outlook.com (2603:10b6:208:377::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 07:02:35 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 07:02:35 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Wei Lin Guay <wguay@meta.com>
CC: "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "jgg@nvidia.com" <jgg@nvidia.com>, Dag Moxnes
 <dagmoxnes@meta.com>, "kbusch@kernel.org" <kbusch@kernel.org>, "Nicolaas
 Viljoen" <nviljoen@meta.com>, Oded Gabbay <ogabbay@kernel.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Daniel
 Vetter" <daniel.vetter@ffwll.ch>, Leon Romanovsky <leon@kernel.org>, "Maor
 Gottlieb" <maorg@nvidia.com>
Subject: RE: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Topic: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Index: AQHbT6PDX5zn/QnJaEWuVZ9mA55H2rLpHa5AgAE+6QCAANdewA==
Date: Wed, 18 Dec 2024 07:02:35 +0000
Message-ID: <IA0PR11MB71858B2E59D3A9F58CEE83DCF8052@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20241216095920.237117-1-wguay@fb.com>
 <IA0PR11MB7185FDD56CFDD0A2B8D21468F83B2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <924671F4-E8B5-4007-BE5D-29ED58B95F46@meta.com>
In-Reply-To: <924671F4-E8B5-4007-BE5D-29ED58B95F46@meta.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|MN0PR11MB6036:EE_
x-ms-office365-filtering-correlation-id: b9fb393c-8b5a-4b6c-2600-08dd1f31f399
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dHBMMitnTzJCaTFBc0JFY2dWUGRVOWRxUFFwNFdnRW1YeUVYNDQvZDVvR25Y?=
 =?utf-8?B?eGMxQnpxZEd0Zk9mSlZqM3NzMDNaU1BhMnNldlhpSkxaekc3WDM3UHlJRHFU?=
 =?utf-8?B?dEFIRlBveHFrKzZMcGFvS2swVkRwR1VBVjFMSmZFcVVVNkpYRUNDL2R1Vlll?=
 =?utf-8?B?WGhpYS83WHlJekhmeFN0U01FaURFeVl1ZnM1MnMwMDdvcm94alREbHZyYmph?=
 =?utf-8?B?Mkx0Y2FicVZkK1BVeEJieldSK1NqZk1CZkxSWktmOXM1Z3F4eU1RdGxLeDlB?=
 =?utf-8?B?bVJLZGdPaEZaZUQ0WWUwNHhYNlplWW9NbVJlYmN6eVBjTXpIUnFvaHAwN1dS?=
 =?utf-8?B?M3RYUGF5NHZpRTRqbDc0VzROdUc1YyttcGI4UWNuUHJuOGxEV1B6Q3dTbFBI?=
 =?utf-8?B?S1VIRG1nWkNlb285ZTFzSXNlNWZGQk5aQWRSMXJlSnlXK1pOSmlUYVowZGh1?=
 =?utf-8?B?d1RlWVVwUU9vMGdDNks5UDkwRkpBcjdYbmdrMENkZXZvcEJCdDVhYmZ0ZFJD?=
 =?utf-8?B?TVpqQmw1NlVtZzdNWEZNOXdJcDdPcnM4Mm9GdDdEckNZZk0xODM4NnZ4NlJi?=
 =?utf-8?B?UzI0aUVQS29Ka2piVm04aVExekQzZU9YMDhSdXp6MFB5ekxQd0NyRnNWbVh1?=
 =?utf-8?B?M2R5bk9XcitYa0JsS2hxbjJWbWFKb2xsVUowVUNCR2NRUGxDU3Q0RnNnckdv?=
 =?utf-8?B?eW42MWVsbEVvejlJOGVhcDVXeEF4VStKVWYyTTc4UGtPVHhNUU53K3pzcVRv?=
 =?utf-8?B?K2RGeGxaS2RiWE8yL2pwaVdBRzBNYXBYZzR6Tnc1NkFlUlp6Ni90VHY4UndZ?=
 =?utf-8?B?eEprV0NzSmpMKzY3TjdYaWNqR2lob3FCd003RXNYVHdwMWVoSHVpcFg1L3V5?=
 =?utf-8?B?RUFNNmtOWnBWOFdLdHpSaExWaVh5Q2RUYk5VTE52Tm9hKzBjOU1FT2xnQzNY?=
 =?utf-8?B?TWhnWThtWUdoc0lJVEY4WUcxdDZPY1NGdUZNZHdoeStwNjRCRWE5SnY1N3lx?=
 =?utf-8?B?RHBSQVVra0hDbk9zYitQdTJDR25FK0hqUXZsSXhwYXUvR1BsaWNmdndDR2Vx?=
 =?utf-8?B?S3pnenBrZWhxcTB4TWc4UE5ITHgwOUtSQ01UcWNDczZoSmMwVFMxNGgxWXdi?=
 =?utf-8?B?SkpwcUMweEN1SnUrTFAxYzg0eldFUEx0RU0rV255N2EyNkdHbC9xOVluMzZm?=
 =?utf-8?B?YkJlTmw3UHVyWFZBZmVkKzYzVFBYR2F0WnFvemF3SEJ0Yk5OVU1hdU1LTW5m?=
 =?utf-8?B?emVEVGVaRmltQTlTbXBQZkQxaFdLbkRPWVowTTNsQ3ViY0loWDNRUzBXQ0E4?=
 =?utf-8?B?K2JkTEdYdU5ETXg3c0JaWi9NUXErQ3FkeWdhbWNHbVpZUmdnNFlOcElzanFF?=
 =?utf-8?B?Q2VRRW5Sc215Z1FETk8rMXZZektHNnBWOThzQUpkTXFyTUhvWERrUTJpZEtM?=
 =?utf-8?B?QzdIZW82UktFSjRUcFhLcHRrMjN6WXVQcDBGcTNkTDZ6andCTGI2d3AxTldy?=
 =?utf-8?B?bHNKRGdQNk9ZbE1DTWNhZXVtalpkbC9NN2M1VTRtOUFJVGxqZXhMTDM1d3pO?=
 =?utf-8?B?azE1R09iMzMwZko5bzE2ODJLd0loU0lReFgxUWN1dnJZRmZ3dmxhMFR1Zkwr?=
 =?utf-8?B?Q0xmVE94dDNKamhxa1FrL0FHcW1sbE5WR3IxT25qaHZVdmg0anhBVk9uMjVB?=
 =?utf-8?B?aDhtTVFOKzk4RWxpTUh1RXJGOS9zZHZRUHhuZjlEaVJLTnZzaXkvM2srM0Yr?=
 =?utf-8?B?OXBVSkVLOFhJSjdNVzRMYlVhZ1NjRFNnbnZBbmo1QUZKc1M3WFJRQy8vZ0I1?=
 =?utf-8?B?T0VBVUEvdWdBdzkyUXluV0dSdFA3b2FvUTFQbGYyNVRlSEZMODl2U2JMU1Jo?=
 =?utf-8?B?WGNhRHVBbTVPcjV6WEpwQ1R3Vk01VE9uVVp5NCtlVm5QTnQ1M1J0NktxUG9a?=
 =?utf-8?Q?WKEKzINia5OIBOk7URPpx5k9WIwDwo1/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDd3alN2QWszQ0ZSUEtDNEJ3TXBjcFd2d2k1YVZBc083U1gveWxoZmJNVjBE?=
 =?utf-8?B?U2NVcWptQ3hPTkdCTEtOTlZoVmNHQ05JVnFuYWVCZWQ5dDVkcExnaXhWbWcw?=
 =?utf-8?B?aXM1RVozWisvYUx0YVV0STNHUVFyaWY0MW5FRjVwWk5tREoyN2REb3gwb0Jj?=
 =?utf-8?B?V2UyR3NxbVRWam96S2t6QkF3NFZGT1JSbWh3emxHcnZac0EyNlQrUGRyak9l?=
 =?utf-8?B?SCtQV2RLZEd0enAvTngzRkdHOVFXOUFTQVkraGNZbG5iMnorYXlKZm1mODhU?=
 =?utf-8?B?U1JIZnJrbnY5QWsxWVZDSFhnZ1lzcWJPOGZlMGVSTjNTZUdaWXNnbkJyQmh6?=
 =?utf-8?B?VjZmeG5QSzRDOVRwUzJpTE0ybWJZTlNPUmtvbE84dDdaT3pjcGhGcHNWc3ZC?=
 =?utf-8?B?NTcwTUhWd3FrOHYvelZhQmNiRk4xL1BmVjhPVDRjTkowVU43Y3BaRlJJR1VR?=
 =?utf-8?B?bVJYS2VxZFA1NThFWHlPRVRVdlBVeGI5MUd0Tjg0Yk9sYzEvRFF6MTY2MWds?=
 =?utf-8?B?RGJ5cUtvSUlVNGpHa0Q3aE1rbXd0cmJRd1M0OExCSGQ1NXp5a2RNVkk0c0Vz?=
 =?utf-8?B?L01qamxDZS91QTBhWXc2ajk4Y2FBdi9jejg3ZktNdGNLRVI0RkNES21mQTR1?=
 =?utf-8?B?VFk4MDQxTDduT2FLM0dqcExNUHV4TGhkTmEyVWM2U0dJNWVrNU16VkNNWWR2?=
 =?utf-8?B?Wm1sdXVXUmw3cDZZaVcwclRnTlJrSWUvMXoySUowaFVBVWJDOWplYzE5VTFx?=
 =?utf-8?B?a3E3cytha2p4UjlMdUMwbjFKSVVaWGF5SGQzS09kVDlCR0pBNGxFdmhDSllM?=
 =?utf-8?B?NkNYc1RwVStzc3pYSmZYOXNGdTkzOVMvOUpjV0xUcnVCZnNjM01iRHZTWmxW?=
 =?utf-8?B?a1FLNXZBdU5kT21DMC82WWJRYVdoUytzQWNJblhEVDloSVd5MkJxNzV3NFlp?=
 =?utf-8?B?YWc1MGdMc0ovS01HV1VDY3F3OHh0cW5VaThYTGwrWmxPYStieFdjWXQ4RGJn?=
 =?utf-8?B?NzFtVDJpL1llWXpIRXhsQjVLaythMjlEdEs2M3JVRmJxMU5nRHNURCtSc1dv?=
 =?utf-8?B?Y2hDME9mZXZJY01TeXorMDQzRGxOVlF2TVZjVlg1SXdDOE1MNkt0WjVocStW?=
 =?utf-8?B?azZpRXlVTzJ6M1JGZ05XS3d1RCtIYWd2VHBqN2M2YTB4YnRrdytqOWQ4aFh4?=
 =?utf-8?B?N004QW1xRkdTemlaTFB1T1k1T0tQck5qREJBcDVRQjNBSWtmS1FxbnNkeGxi?=
 =?utf-8?B?K01wR2VTaGh2ZmlWTStqVi9ScHBTcVRUOWx3a3o1eWIzR1pQWlZJVU1VcmlF?=
 =?utf-8?B?YmFHMjJRbmd0M1lFK09JVWVQWHpYMW9WZGREbFhmWVpKcDBSUXRmSHFVWDcv?=
 =?utf-8?B?cXBEd1kwK3BpSUF5WHZKYlVndnVSUDNXNVEzNytTVlQ2SDN2UlpiOWVZeWxr?=
 =?utf-8?B?TmdGR0VLNFEyS1hFQUNJdTY4TXBrWjlaWk5JT3ZIMnpVZk9DZkxkN1BTenRB?=
 =?utf-8?B?OWFhOHdxUmhCZmsvd2k4czJWVWNVdWtKM0dJM2h2Q252RXNETTU4SldUUldi?=
 =?utf-8?B?NUJ4ZE4wdDVkR0VXZHdtMlQvVmZmazArZG51NEF5R1ZON2FRQU84L0FiaDBH?=
 =?utf-8?B?c2JDam04dkhWZVFQeEpOdGljQng4LzJ2OG96dm1Ob0hEeWlPOGFVS0lvWk5S?=
 =?utf-8?B?SjV3TVp0MHdRZks2aGZsRC9kRFVPTUFOVFpFVWpmWlBRbm9ZVkpuYmhLc0pv?=
 =?utf-8?B?NU5SNjlINHRhVVg0MVUrS01oY09xVXhaMUJXNmxGV200WUduWC95WXdZME9u?=
 =?utf-8?B?SkwxT3dEMmhyYy94YWRrMk42NWd0c1ZMV1MvWStycG8rQ2laZnhjT2pTNjBv?=
 =?utf-8?B?cGNhT3k0TzRmdVpZT01yWDZVYmdpSmtocmZ0UFJpTUR3dG0rYXdkT1crVmwz?=
 =?utf-8?B?ZHptQUJqQU5aT3RyT0VyblRVV3B2V0toWW9JdEI2c1VZdmxySzBXRTV3dXB3?=
 =?utf-8?B?aVFvQWZ6b1ljWnRUamZkN3BTVDdBaTdpSk95L1BaQ2NyUFlleEJ4Mk9GcEM1?=
 =?utf-8?B?VHJSeW52cDNqSUNBSHFselFXakdkQjF3RGtTN0haUUdSMUwvWXk1UjF1R2p2?=
 =?utf-8?Q?0/gJAAqCvpYl3K+d1qN5GVAZq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9fb393c-8b5a-4b6c-2600-08dd1f31f399
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 07:02:35.6935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: stGo65mCYBEhaxioKVtFEgX+gVZXBynyCz/hPOUbwwiIjAceWs00/Sk1qLztfc+FYRlJI14p6o3nNoCCGKNR0szOWraOLUmprqH5p6d1SUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6036
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

SGkgV2VpIExpbiwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDAvNF0gY292ZXItbGV0dGVyOiBB
bGxvdyBNTUlPIHJlZ2lvbnMgdG8gYmUgZXhwb3J0ZWQNCj4gdGhyb3VnaCBkbWFidWYNCj4gPj4N
Cj4gPj4gRnJvbTogV2VpIExpbiBHdWF5IDx3Z3VheUBtZXRhLmNvbT4NCj4gPj4NCj4gPj4gVGhp
cyBpcyBhbm90aGVyIGF0dGVtcHQgdG8gcmV2aXZlIHRoZSBwYXRjaGVzIHBvc3RlZCBieSBKYXNv
bg0KPiA+PiBHdW50aG9ycGUgYW5kIFZpdmVrIEthc2lyZWRkeSwgYXQNCj4gPj4gaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhL2NvdmVyLzAtdjItDQo+ID4+
IDQ3MjYxNWIzODc3ZSsyOGY3LXZmaW9fZG1hX2J1Zl9qZ2dAbnZpZGlhLmNvbS8NCj4gPj4NCj4g
aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy85NzA3
NTEvX187ISFCdDhSWlVtDQo+IDlhdyE1dVBybFNJOURoWFZJZVJNbnRBRGJrZFdjdTRZWWhBekdO
ME93eVEyTkh4ck43YllFOWYxZVFCWA0KPiBVRDh4SEhQeGlKb3JTa1loTmpJUndkRzRQc0QyJA0K
PiA+IHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyNDA2MjQwNjU1NTIu
MTU3MjU4MC0xLQ0KPiB2aXZlay5rYXNpcmVkZHlAaW50ZWwuY29tLw0KPiA+IGFkZHJlc3NlcyBy
ZXZpZXcgY29tbWVudHMgZnJvbSBBbGV4IGFuZCBKYXNvbiBhbmQgYWxzbyBpbmNsdWRlcyB0aGUN
Cj4gYWJpbGl0eQ0KPiA+IHRvIGNyZWF0ZSB0aGUgZG1hYnVmIGZyb20gbXVsdGlwbGUgcmFuZ2Vz
LiBUaGlzIGlzIHJlYWxseSBuZWVkZWQgdG8gZnV0dXJlLQ0KPiBwcm9vZg0KPiA+IHRoZSBmZWF0
dXJlLg0KPiANCj4gVGhlIGdvb2QgdGhpbmcgaXMgdGhhdCB5b3VyIHBhdGNoIHNlcmllcyBhZGRy
ZXNzZWQgQ2hyaXN0aWFu4oCZcyBjb25jZXJucyBvZg0KPiBhZGRpbmcgZG1hX2J1Zl90cnlfZ2V0
KCkuDQpObywgaXQgZGlkIG5vdCBhZGRyZXNzIGhpcyBjb25jZXJuLiBJbiB2MiwgaW5zdGVhZCBv
ZiBhZGRpbmcgYSBuZXcgZnVuY3Rpb24sIHdlDQphcmUgbm93IGNhbGxpbmcgZ2V0X2ZpbGVfcmN1
KCkgZGlyZWN0bHksIHdoaWNoIHdhcyBzdWdnZXN0ZWQgYnkgQ2hyaXN0aWFuIGluIHRoZQ0Kb2xk
IG9yaWdpbmFsIHJldmlldy4gDQoNCj4gDQo+IEhvd2V2ZXIsIHNldmVyYWwgcXVlc3Rpb25zIHJl
Z2FyZGluZyB5b3VyIHYyIHBhdGNoOg0KPiAtIFRoZSBkbWEtYnVmIHN0aWxsIHN1cHBvcnQgcmVk
dW5kYW50IG1tYXAgaGFuZGxlcj8gKE9uZSBvZiByZXZpZXcNCj4gY29tbWVudHMgZnJvbSB2MT8p
DQpZZWFoLCB0aGUgbW1hcCBoYW5kbGVyIGlzIHJlYWxseSBuZWVkZWQgYXMgYSBkZWJ1Z2dpbmcg
dG9vbCBnaXZlbiB0aGF0IHRoZQ0KaW1wb3J0ZXIgd291bGQgbm90IGJlIGFibGUgdG8gcHJvdmlk
ZSBhY2Nlc3MgdG8gdGhlIGRtYWJ1ZidzIHVuZGVybHlpbmcNCm1lbW9yeSB2aWEgdGhlIENQVSBp
biBhbnkgb3RoZXIgd2F5Lg0KDQo+IC0gUmF0aGVyIHRoYW4gaGFuZGxlIGRpZmZlcmVudCByZWdp
b25zIHdpdGhpbiBhIHNpbmdsZSBkbWEtYnVmLCB3b3VsZCB2ZmlvLQ0KPiB1c2VyIG9wZW4gbXVs
dGlwbGUgZGlzdGluY3QgZmlsZSBkZXNjcmlwdG9ycyB3b3JrPw0KPiBGb3Igb3VyIHNwZWNpZmlj
IHVzZSBjYXNlLCB3ZSBkb24ndCByZXF1aXJlIG11bHRpcGxlIHJlZ2lvbnMgYW5kIHByZWZlcg0K
PiBKYXNvbuKAmXMgb3JpZ2luYWwgcGF0Y2guDQpSZXN0cmljdGluZyB0aGUgZG1hYnVmIHRvIGEg
c2luZ2xlIHJlZ2lvbiAob3IgaGF2aW5nIHRvIGNyZWF0ZSBtdWx0aXBsZSBkbWFidWZzDQp0byBy
ZXByZXNlbnQgbXVsdGlwbGUgcmVnaW9ucy9yYW5nZXMgYXNzb2NpYXRlZCB3aXRoIGEgc2luZ2xl
IHNjYXR0ZXJlZCBidWZmZXIpDQp3b3VsZCBub3QgYmUgZmVhc2libGUgb3IgaWRlYWwgaW4gYWxs
IGNhc2VzLiBGb3IgaW5zdGFuY2UsIGluIG15IHVzZS1jYXNlLCBJIGFtDQpzaGFyaW5nIGEgbGFy
Z2UgZnJhbWVidWZmZXIgKEZCKSBsb2NhdGVkIGluIEdQVSdzIFZSQU0uIEFuZCwgYWxsb2NhdGlu
ZyBhIGxhcmdlDQpGQiBjb250aWd1b3VzbHkgKG5yX3JhbmdlcyA9IDEpIGluIFZSQU0gaXMgbm90
IHBvc3NpYmxlIHdoZW4gdGhlcmUgaXMgbWVtb3J5DQpwcmVzc3VyZS4NCg0KRnVydGhlcm1vcmUs
IHNpbmNlIHdlIGFyZSBhZGRpbmcgYSBuZXcgVUFQSSB3aXRoIHRoaXMgcGF0Y2gvZmVhdHVyZSwg
d2UgY2Fubm90DQpnbyBiYWNrIGFuZCB0d2VhayBpdCAodG8gYWRkIHN1cHBvcnQgZm9yIG5yX3Jh
bmdlcyA+IDEpIHNob3VsZCB0aGVyZSBiZSBhIG5lZWQgaW4NCnRoZSBmdXR1cmUsIGJ1dCB5b3Ug
Y2FuIGFsd2F5cyB1c2UgbnJfcmFuZ2VzID0gMSBhbnl0aW1lLiBUaGF0IGlzIHdoeSBpdCBtYWtl
cw0Kc2Vuc2UgdG8gYmUgZmxleGlibGUgaW4gdGVybXMgb2YgdGhlIG51bWJlciBvZiByYW5nZXMv
cmVnaW9ucy4NCg0KPiANCj4gPg0KPiA+IEFsc28sIG15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0
aGlzIHBhdGNoc2V0IGNhbm5vdCBwcm9jZWVkIHVudGlsIExlb24ncw0KPiBzZXJpZXMgaXMgbWVy
Z2VkOg0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS9jb3Zlci4xNzMzMzk4OTEzLmdp
dC5sZW9uQGtlcm5lbC5vcmcvDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBwb2ludGVyLg0KPiBJIHdp
bGwgcmViYXNlIG15IGxvY2FsIHBhdGNoIHNlcmllcyBvbiB0b3Agb2YgdGhhdC4NCkFGQUlLLCBM
ZW9uJ3Mgd29yayBpbmNsdWRlcyBuZXcgbWVjaGFuaXNtL0FQSXMgdG8gZG8gUDJQIERNQSwgd2hp
Y2ggd2UNCnNob3VsZCBiZSB1c2luZyBpbiB0aGlzIHBhdGNoc2V0LiBBbmQsIEkgdGhpbmsgaGUg
aXMgYWxzbyBwbGFubmluZyB0byB1c2UgdGhlDQpuZXcgQVBJcyB0byBhdWdtZW50IGRtYWJ1ZiB1
c2FnZSBhbmQgbm90IGJlIGZvcmNlZCB0byB1c2UgdGhlIHNjYXR0ZXItZ2F0aGVyDQpsaXN0IHBh
cnRpY3VsYXJseSBpbiBjYXNlcyB3aGVyZSB0aGUgdW5kZXJseWluZyBtZW1vcnkgaXMgbm90IGJh
Y2tlZCBieSBzdHJ1Y3QgcGFnZS4NCg0KSSB3YXMganVzdCB3YWl0aW5nIGZvciBhbGwgb2YgdGhp
cyB0byBoYXBwZW4sIGJlZm9yZSBwb3N0aW5nIGEgdjMuDQoNClRoYW5rcywNClZpdmVrDQoNCj4g
DQo+IFRoYW5rcywNCj4gV2VpIExpbg0KPiANCj4gPg0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+IFZp
dmVrDQo+ID4NCj4gPj4NCj4gPj4gSW4gYWRkaXRpb24gdG8gdGhlIGluaXRpYWwgcHJvcG9zYWwg
YnkgSmFzb24sIGFub3RoZXIgcHJvbWlzaW5nDQo+ID4+IGFwcGxpY2F0aW9uIGlzIGV4cG9zaW5n
IG1lbW9yeSBmcm9tIGFuIEFJIGFjY2VsZXJhdG9yIChib3VuZCB0byBWRklPKQ0KPiA+PiB0byBh
biBSRE1BIGRldmljZS4gVGhpcyB3b3VsZCBhbGxvdyB0aGUgUkRNQSBkZXZpY2UgdG8gZGlyZWN0
bHkgYWNjZXNzDQo+ID4+IHRoZSBhY2NlbGVyYXRvcidzIG1lbW9yeSwgdGhlcmVieSBmYWNpbGl0
YXRpbmcgZGlyZWN0IGRhdGENCj4gPj4gdHJhbnNhY3Rpb25zIGJldHdlZW4gdGhlIFJETUEgZGV2
aWNlIGFuZCB0aGUgYWNjZWxlcmF0b3IuDQo+ID4+DQo+ID4+IEJlbG93IGlzIGZyb20gdGhlIHRl
eHQvbW90aXZhdGlvbiBmcm9tIHRoZSBvcmdpbmFsIGNvdmVyIGxldHRlci4NCj4gPj4NCj4gPj4g
ZG1hLWJ1ZiBoYXMgYmVjb21lIGEgd2F5IHRvIHNhZmVseSBhY3F1aXJlIGEgaGFuZGxlIHRvIG5v
bi1zdHJ1Y3QgcGFnZQ0KPiA+PiBtZW1vcnkgdGhhdCBjYW4gc3RpbGwgaGF2ZSBsaWZldGltZSBj
b250cm9sbGVkIGJ5IHRoZSBleHBvcnRlci4gTm90YWJseQ0KPiA+PiBSRE1BIGNhbiBub3cgaW1w
b3J0IGRtYS1idWYgRkRzIGFuZCBidWlsZCB0aGVtIGludG8gTVJzIHdoaWNoDQo+IGFsbG93cw0K
PiA+PiBmb3INCj4gPj4gUENJIFAyUCBvcGVyYXRpb25zLiBFeHRlbmQgdGhpcyB0byBhbGxvdyB2
ZmlvLXBjaSB0byBleHBvcnQgTU1JTyBtZW1vcnkNCj4gPj4gZnJvbSBQQ0kgZGV2aWNlIEJBUnMu
DQo+ID4+DQo+ID4+IFRoaXMgc2VyaWVzIHN1cHBvcnRzIGEgdXNlIGNhc2UgZm9yIFNQREsgd2hl
cmUgYSBOVk1lIGRldmljZSB3aWxsIGJlDQo+IG93bmVkDQo+ID4+IGJ5IFNQREsgdGhyb3VnaCBW
RklPIGJ1dCBpbnRlcmFjdGluZyB3aXRoIGEgUkRNQSBkZXZpY2UuIFRoZSBSRE1BDQo+IGRldmlj
ZQ0KPiA+PiBtYXkgZGlyZWN0bHkgYWNjZXNzIHRoZSBOVk1lIENNQiBvciBkaXJlY3RseSBtYW5p
cHVsYXRlIHRoZSBOVk1lDQo+IGRldmljZSdzDQo+ID4+IGRvb3JiZWxsIHVzaW5nIFBDSSBQMlAu
DQo+ID4+DQo+ID4+IEhvd2V2ZXIsIGFzIGEgZ2VuZXJhbCBtZWNoYW5pc20sIGl0IGNhbiBzdXBw
b3J0IG1hbnkgb3RoZXIgc2NlbmFyaW9zDQo+IHdpdGgNCj4gPj4gVkZJTy4gSSBpbWFnaW5lIHRo
aXMgZG1hYnVmIGFwcHJvYWNoIHRvIGJlIHVzYWJsZSBieSBpb21tdWZkIGFzIHdlbGwgZm9yDQo+
ID4+IGdlbmVyaWMgYW5kIHNhZmUgUDJQIG1hcHBpbmdzLg0KPiA+Pg0KPiA+PiBUaGlzIHNlcmll
cyBnb2VzIGFmdGVyIHRoZSAiQnJlYWsgdXAgaW9jdGwgZGlzcGF0Y2ggZnVuY3Rpb25zIHRvIG9u
ZQ0KPiA+PiBmdW5jdGlvbiBwZXIgaW9jdGwiIHNlcmllcy4NCj4gPj4NCj4gPj4gdjI6DQo+ID4+
IC0gTmFtZSB0aGUgbmV3IGZpbGUgZG1hX2J1Zi5jDQo+ID4+IC0gUmVzdG9yZSBvcmlnX25lbnRz
IGJlZm9yZSBmcmVlaW5nDQo+ID4+IC0gRml4IHJldmVyc2VkIGxvZ2ljIGFyb3VuZCBwcml2LT5y
ZXZva2VkDQo+ID4+IC0gU2V0IHByaXYtPmluZGV4DQo+ID4+IC0gUmViYXNlZCBvbiB2MiAiQnJl
YWsgdXAgaW9jdGwgZGlzcGF0Y2ggZnVuY3Rpb25zIg0KPiA+PiB2MTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8wLXYxLTllNmUxNzM5ZWQ5NSs1ZmEtDQo+ID4+IHZmaW9fZG1hX2J1Zl9qZ2dA
bnZpZGlhLmNvbQ0KPiA+PiBDYzogbGludXgtcmRtYUB2Z2VyLmtlcm5lbC5vcmcNCj4gPj4gQ2M6
IE9kZWQgR2FiYmF5IDxvZ2FiYmF5QGtlcm5lbC5vcmc+DQo+ID4+IENjOiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+ID4+IENjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPg0KPiA+PiBDYzogTGVvbiBSb21hbm92c2t5IDxsZW9uQGtl
cm5lbC5vcmc+DQo+ID4+IENjOiBNYW9yIEdvdHRsaWViIDxtYW9yZ0BudmlkaWEuY29tPg0KPiA+
PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+PiBTaWduZWQtb2ZmLWJ5
OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BudmlkaWEuY29tPg0KPiA+Pg0KPiA+PiBKYXNvbiBHdW50
aG9ycGUgKDMpOg0KPiA+PiAgdmZpbzogQWRkIHZmaW9fZGV2aWNlX2dldCgpDQo+ID4+ICBkbWEt
YnVmOiBBZGQgZG1hX2J1Zl90cnlfZ2V0KCkNCj4gPj4gIHZmaW8vcGNpOiBBbGxvdyBNTUlPIHJl
Z2lvbnMgdG8gYmUgZXhwb3J0ZWQgdGhyb3VnaCBkbWEtYnVmDQo+ID4+DQo+ID4+IFdlaSBMaW4g
R3VheSAoMSk6DQo+ID4+ICB2ZmlvL3BjaTogQWxsb3cgZXhwb3J0IGRtYWJ1ZiB3aXRob3V0IG1v
dmVfbm90aWZ5IGZyb20gaW1wb3J0ZXINCj4gPj4NCj4gPj4gZHJpdmVycy92ZmlvL3BjaS9NYWtl
ZmlsZSAgICAgICAgICB8ICAgMSArDQo+ID4+IGRyaXZlcnMvdmZpby9wY2kvZG1hX2J1Zi5jICAg
ICAgICAgfCAyOTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPj4gZHJpdmVycy92
ZmlvL3BjaS92ZmlvX3BjaV9jb25maWcuYyB8ICAgOCArLQ0KPiA+PiBkcml2ZXJzL3ZmaW8vcGNp
L3ZmaW9fcGNpX2NvcmUuYyAgIHwgIDQ0ICsrKystDQo+ID4+IGRyaXZlcnMvdmZpby9wY2kvdmZp
b19wY2lfcHJpdi5oICAgfCAgMzAgKysrDQo+ID4+IGRyaXZlcnMvdmZpby92ZmlvX21haW4uYyAg
ICAgICAgICAgfCAgIDEgKw0KPiA+PiBpbmNsdWRlL2xpbnV4L2RtYS1idWYuaCAgICAgICAgICAg
IHwgIDEzICsrDQo+ID4+IGluY2x1ZGUvbGludXgvdmZpby5oICAgICAgICAgICAgICAgfCAgIDYg
Kw0KPiA+PiBpbmNsdWRlL2xpbnV4L3ZmaW9fcGNpX2NvcmUuaCAgICAgIHwgICAxICsNCj4gPj4g
aW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaCAgICAgICAgICB8ICAxOCArKw0KPiA+PiAxMCBmaWxl
cyBjaGFuZ2VkLCA0MDUgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gPj4gY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmZpby9wY2kvZG1hX2J1Zi5jDQo+ID4+DQo+ID4+IC0tDQo+
ID4+IDIuNDMuNQ0KDQo=
