Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B84E2C12C19
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 04:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B22610E242;
	Tue, 28 Oct 2025 03:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XA7OeWKa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159CC10E0F3;
 Tue, 28 Oct 2025 03:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761621771; x=1793157771;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OwROjY+sRzwymsiMSNwiR9+X/vcOXvYM2PP1EUGJPFg=;
 b=XA7OeWKagSKsSPIj1SrKEKlfzQlr3S98NGdDiQz+dCqDxzduHMV9nxba
 3p/+vjllTOhLGpgwbqhLAd77gEb6Mz6pJumPkoaY/XA4E7W/sbOMViqAV
 oGYAf9wEb5puKeFqtTB0Mi/MN5HSiNhgD8AbzOGnLSzlA5pSWqSYFVNsl
 15BQ6cGLNPGf9a1uGWlx8m9KCNOcbKdUoUg+K4oUILCLzlVfJ9QXZo8p4
 tUz8k1GVMRvVpHbGnjzGnw0FLt1d77SPg/vhc80Vr8cBRaR1XldOwqg0N
 chkwCHlSh+YISThz7bOS9rsaAUDre4occaVQeASwOvQlhoooiqRoXTZkJ Q==;
X-CSE-ConnectionGUID: RZznL6skTya+UPPiacghnQ==
X-CSE-MsgGUID: Fup5iTQwQX2VxPqQaDqWyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63863807"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="63863807"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 20:22:51 -0700
X-CSE-ConnectionGUID: mNBnNIPwS3SJv1MLYHdAMA==
X-CSE-MsgGUID: 9syFJcYNQrGACQB0jBy3xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="185686044"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 20:22:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 20:22:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 20:22:49 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 20:22:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPJNrwihDXJLjvUZZm3zXxjtComp01alyXT+B6/Kwu9vIpkrKEcy0aA6cBMVERhQJGrprIb0f97s5nt78mCY6Gbz/VKAO8HFvU4YLsmduvs7LrQKoVIp/P5bcnCCtzJKrBCL5/q4pGBfky9/JNKeWNFKx+L87zQinQoViOgeGCVWYAc/+ojHc/GoNslFgXY+vMJL37gfF29iv2RYYgfur2nxT2LEnsjoyQOcdNTaIxe+yr1NZ7HpEmlLnOG+qj0jOqSxOgAxP3+z6QJlgkr6yjAYLVTYrl0tAZaAUBWMnJzTuiJIOsnjYf60ppQqEVp5MjgxA0QRVsdkKStaLqB2RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwROjY+sRzwymsiMSNwiR9+X/vcOXvYM2PP1EUGJPFg=;
 b=kVgjIeXq8kTHqvMMqM1jnSx9GrVVN/u3WYy34dF6zAhjyZE5dLREWkK7bTty6w66ckwsq5x2bMSqSP74Ogw48wkAFsCikbrQpbbmGIXBrwGSejNS4wqY1QMY72k3dlIJp16BLPuLH8Inz2bHwVzAKDa2cqYz4kzXGfSvsB9G1jRYSC2a7APq3lYDkBhu0DPed1oMGwZ8Cz0TQI5W/sheev7CwrFjJKlliaW5h3njlVJyneOjzE3f5tnyg7uVtQZQAyMa5C1oXGxU+4g4anROIoYva4K5a1NurJi+/OANKr3BGMqsPKB6g6USg+M7SYAyfrp0l8N+hAbQw27UujmILw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by IA4PR11MB8943.namprd11.prod.outlook.com (2603:10b6:208:569::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 03:22:47 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 03:22:46 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Winiarski, Michal" <michal.winiarski@intel.com>, Alex Williamson
 <alex.williamson@redhat.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Laguna,
 Lukasz" <lukasz.laguna@intel.com>
Subject: RE: [PATCH v2 16/26] drm/xe/pf: Add helpers for VF GGTT migration
 data handling
Thread-Topic: [PATCH v2 16/26] drm/xe/pf: Add helpers for VF GGTT migration
 data handling
Thread-Index: AQHcQtwelI0Y81ZIbUiyKUecm7d3fbTW7QuQ
Date: Tue, 28 Oct 2025 03:22:46 +0000
Message-ID: <BN9PR11MB5276E25C0636FAFDF1D4FDE48CFDA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-17-michal.winiarski@intel.com>
In-Reply-To: <20251021224133.577765-17-michal.winiarski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|IA4PR11MB8943:EE_
x-ms-office365-filtering-correlation-id: c4c935ac-d9b2-431d-a611-08de15d143b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?UUJ0NEhST2l0Rno2L0lnR1dFNUROb3pXVmpDeVFQOUx2T2ZwR1RHT3VSUkVi?=
 =?utf-8?B?QWswYXMyQXQxclV5bDRJbXJpOUM3K1A2MGpQN09YTlY0WFlneEMxRXJ0ZENv?=
 =?utf-8?B?dTkycDJ0dzZCK0VLOGdSaUZ4QnJ3MU9jMXZScmt4MDcyWFVSWWNoTHJPTWd2?=
 =?utf-8?B?WUFsbWIyOGFFeTMvN2kwd2hYSmN3eDJ1bTNuMUtPMG5TUGlqcXcwMm01OUpE?=
 =?utf-8?B?VW5oWGZJaCtESzN1RGhVdHBqL2N0NlFFQkFXaURkMGJMNW9YNFhMSHNza2g0?=
 =?utf-8?B?WFdFZ0RrUVdXS3V3Y1FFdTA4NWtKQUNyclhuK0ZuakhQTEVmRmlnUG96OHVD?=
 =?utf-8?B?bWVQSzcrckVVOTRwZ0ZMUkkxRFByeG1ybXVPQTJyZVl1QlNFN0hTTm1LRVJu?=
 =?utf-8?B?NGVTelVBVEo1bk0zNHNVSWFUSVFlQjNGWkh2Z3JCT1VlQUlqV3BIRDRJRTlG?=
 =?utf-8?B?aHNtUGYwS3RTaVVobGFjV1d1RGoyUnRHUUFNOEFNSkdiWkh1VzFPb3Nzb21y?=
 =?utf-8?B?dFNNd3dlWDBKdGo3MzZ6TmtUUlp1ZUhEOWplVDZaRkFzaXp5QVlEOCtRRXN0?=
 =?utf-8?B?Y3BycU1wbkRxY3FOZ0JSNjZNTU9uUFFvbGlSWUtxbFJtazBBZFVGRkZ0WlV1?=
 =?utf-8?B?UjJjdXd4U0lRZ0VaL1pKbVkxTThwMmJUYWRBV2k0ZFlLRkNhRTFNV3hlbUtO?=
 =?utf-8?B?dWdlSWJPWnhWcFlQdGlOcWZsWFFrV2hoR3E5VzhuL2VseWViVGgxWmozalhi?=
 =?utf-8?B?MXY2NEJnT044RjRHWVdiTTBKUFdvNjJaUStyLzRKT0lGak15SGhkRXRpVTEz?=
 =?utf-8?B?UTBaY1oyY2pQcy95YmVmL0RqZy92enBKZXVIaG1iRHZhTk04RjF1UXNOaUQ1?=
 =?utf-8?B?R2s1d3MyUjVMSVBlbE1nWWh0MmJPb005VUw2dldFdThXcjNkZ08zQ3J1dTFT?=
 =?utf-8?B?Z2w0dnJlVnIxQ0srbGZNK05FUDZ2UzNlSFZFd3RpaWJzV1dLcGs5eW1aY1F5?=
 =?utf-8?B?dG1RRHNxNk1BanZJdUR4N1dUSFIxd0lCdjhXcDZDQWdUU1A1Y09iaFArelJT?=
 =?utf-8?B?NzFpTG1KT2NTbFp3SVNzZmVFTWpLOVJnZFZ3QTAweVZZdDdWQy9IdEw2WkY3?=
 =?utf-8?B?OStPeEZZcUt4TGgwLzhyOVJTM3pGQ3VCR2dhaitvdDdnaW51Y2t0MnpDMXgx?=
 =?utf-8?B?WTNyZkFyV2FuK1lnSElObWc1QS91M0FaM05MVk1VblZjQ3FzWHlmd0ltSm9y?=
 =?utf-8?B?TEdjNWVlWUF4cTRvdGtidWpMaVhaTXdrQko3NGRpTnh0YnE2OGVQb2o0TVBs?=
 =?utf-8?B?d2tRWlNpM2ttUVRXZ3Z2VE1rS3BNTGV3MU0wU0FHY0FJY1BDbmV3VVg4MDlV?=
 =?utf-8?B?QkpTR0YvVHVnTVFjbUV3SUQ0aThvajhFTFhQN2JlMktpZ3dycFJ5QVFEZXVs?=
 =?utf-8?B?MnJXdVQyZTlKQTE3bWoyc3RLc3dYWUgxcno2WG5uK0M0ejNCRDlrUFMxOTF2?=
 =?utf-8?B?bGQ2b2dsRjR3cHJleGxvbGlBUWdBVGhIaGFGbWh4UGlYOUJhQVM4NmUxOC8y?=
 =?utf-8?B?SUZMOU1wTEFJM0l3am82WENPOWVvQzB2cU5nN2VJUDFjc3lmSUJXMWhvZDdk?=
 =?utf-8?B?VGJKTDlXUERrREF3alRGVlJMa3FwMEFGbHJBVlpIMkJjT0NvMjh0dUNOczJP?=
 =?utf-8?B?eHhSK2FJK3BMQXhZVWJIYnhBUTQ3VjRTRVkra2pSaXQ4NjR4SXR3d3ZQWmh2?=
 =?utf-8?B?ZlRwYkd0N3ZkYS9TU1lwUCtLWU5pZWZ0ajFiS1J4eEt5c3pHZWtvQklkOG5z?=
 =?utf-8?B?UHdFVEx0eDhYbklBanRWVUt6ZStKTTBBWGRKblpYZHpTYkZFbW1ya2VRZVVk?=
 =?utf-8?B?c3p2MGFscnBtY0ZXUVlXRGlCTWdYV3ZrQ2xZM3FpbVJTN2ZmNkE1NGZON3BK?=
 =?utf-8?B?Wnp1N3E4VmNITFFrb3N6cnI5Qi8wSzloVGVTT24zL3dFVi82N1VjNEtmMGxo?=
 =?utf-8?B?R2ZLeUJERXVOU1ZFb0lMOXZJa2JYUzFYOW91VXVDd05VZmhXWXY4cDR3UkpV?=
 =?utf-8?B?K0QzcHpsTkRtNW1qdHFoOU45RWdsM0sxMXdmUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SllmRzE4RzAzdnRMeG1DNXdPVkRtMHY0K3ZHUEJhRzR1QkFVaXArMDVIV3NC?=
 =?utf-8?B?REFjTGdTcUhFU2NYUERYTmtVUjFpdWxnVVZMdzFsY0IwRXlrV1Q5U1phbVVC?=
 =?utf-8?B?cVdyd2RUbXlyZjZQek51LzFEV3FLbENiaElEeEkrYkp5andkL3luMEFxeW1T?=
 =?utf-8?B?NUVhN2VCdzVGSnFhNFREWUhzYkQyVFJ5UGtHeHhQKzc3b2o2ZUY3Q2kwaGMx?=
 =?utf-8?B?MnZ5QUpXYVJSa3BOTlBCaWFONkpBaFlseXBycHptNUN0YnRSdWpiaENwZ0pw?=
 =?utf-8?B?VFdESE0xZ0QwWDg0OURnbldJaU5RTXRzUFM5dnZacEUvYjYrT1ZjMEMwVUJO?=
 =?utf-8?B?K1ltbnBnNDdxeUlTQ0pUdkNUekpManRIKzliQ2M3dUNwU3NDME5lc0p6M2pV?=
 =?utf-8?B?TGhyNWhkTzhSTkVrNHZvWStrbE5ZNHl0R2J1ckE2Y2s3bDQwOFdod0RKbXdU?=
 =?utf-8?B?WHJ4WUFYK2ZnMFJkVDJNUGprRnZMVkxSaThLODhROGdjc2pySTh4WnV3MVZ0?=
 =?utf-8?B?aEVlSnlkbnh6Q0Q4eE81TVB2aWJyeGtpUnFmclhkWG9QNlFJaExSUHJ3SHpk?=
 =?utf-8?B?bmZXL0EwKzN6TXMzWU9nTFFrNUVHOGViUWo3aUhxZmRCZDUxeXRDOWVRTnNB?=
 =?utf-8?B?c2s2UG5zRVZQcnlsQ2plNVNPdWh4T1N5cFRyL042a1ZUaWxKWUZKdENwaGNo?=
 =?utf-8?B?M1EzUUtFLytQMUsvcUNXOUZ1UFYyYldkWWl5eXFzQ2JFazRqYmNRRWJPTUhM?=
 =?utf-8?B?VlduU1Ywc1pabktVVnRiNG5ZK29McUVxNkFvUkNCb2tNbHgxa2NacVZwUHJn?=
 =?utf-8?B?UFJMY1hoek5EbTBnUmkyeFZhdTBwYUdzbVBUNURaUnFDZ2ZuVkowSEMwMnRz?=
 =?utf-8?B?RlBZOGFXYWoydWhxdmg3Q0IzbDRINzZMaUVXSEdqU050WnIxY3hEOVpDa0pU?=
 =?utf-8?B?a3cvOTVRcVRkekNLMWhRUWZmUURsN1piUkFvd3VXQUN2bzZGYmdiemJiY0Nn?=
 =?utf-8?B?ZTJ2VUJPVnJ6by9vdmN5cjhBZkpFZjUranNkeUx5V2poQ1NLVlRPQ1VyQjN4?=
 =?utf-8?B?RFdBbFlDRWxUV2NCeXZhbTJ1T1FhWWxlM0pZRk05eVJCWEh5Z204Tnp5elFz?=
 =?utf-8?B?b0FiTHhNUDgreHRLQXFLRXRRcVlLRFlySkU4T0FLUEpCczhsWnJpRU9qbmxm?=
 =?utf-8?B?akpnT2hsZG9nb0FoUnl5WWVkUENlRGE5eVk0WUEyU3BXL0VoUWM0Qlk0dHpK?=
 =?utf-8?B?YXdiSXlIUS9icElMV0hRNzhkZm04WEc1NGl5Kzh3RTVSZFVzUW10anBKdm9m?=
 =?utf-8?B?M2hwNTBJMnNuaU14VktSdkl0dU1qUFo2TWppcjc0UngrUXhTbDFnWk5JVmZS?=
 =?utf-8?B?SEY5VW9HNkhFdWpPRnBJMDlvUmUvQWJ2UlpkME4wVzY0SUl1YUNkbjFsVFVm?=
 =?utf-8?B?aXExcitsTlp6a0dFL3YvcnhOODRhZUVrNHYvQy9uRkRVOG5nMEJ0QVByYlVT?=
 =?utf-8?B?TWpvRks3NkZXQmRKVVlJUW1EZW5EL1FWSWZoalNnS20wZGZZKzR2TVJEZGxm?=
 =?utf-8?B?MmxsbEJmVTJTeS9JUUdzdUprUWtyTFVnNkEwRUpzdFBWZXVCeXFyMVVoNXky?=
 =?utf-8?B?RmU2VGs2elRJSVlxSmxMRW9ZTEd6QmljSzlSbjlDbXlVcWVSbWZRUVFabjNO?=
 =?utf-8?B?dFdNZ2lwQjdPaVJ6L2lYYkYvYk1UMHN3SFkrdTVpVHdLZW16T2NNRUNpZkg1?=
 =?utf-8?B?cXlvb25sejdGYTFEY2U4Y3prWUc5a2ZBRWJTcTVmMCsxd1BSUmZNbi9xM3cr?=
 =?utf-8?B?YlZZQUlIZ2JrYjRYOUovUmQ2di8wTFJKcTZrUDQ2ZXNOdUR0dzFGM29LMlNt?=
 =?utf-8?B?OUxxQU9oQ1hKR3lCNEJmSnVselBVOE1HK2NYeHZ1ZUxEemFVejA3UWxXK1pK?=
 =?utf-8?B?ZmhnMnVYbWNJampmZXlkZUN3eitlZXRQOG9abXZiOTVaaHBJMml0UVdFeUUw?=
 =?utf-8?B?VXRhSjE5WDFaSGM1N0dOQVBSK0cyMytMMjlpbTVnYXJ6M2xWeDFnOHZjNmJl?=
 =?utf-8?B?Z2Y2OXUrL21SNUpJRkxGbXRuYThYaFNCVFpDSi9ROVBPRmJBUlowOXFJWDRC?=
 =?utf-8?Q?xYqiB1c7yeH5rUj64XJGJfps6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c935ac-d9b2-431d-a611-08de15d143b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 03:22:46.0921 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: htRO7QDxmd2KzJDprlKZ4LXr73IxUgqLhkdu4Hg/RgjLiRjx/7C5dwKjPISHp0l+3f2/SW088J46qZCoTcdZNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8943
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

PiBGcm9tOiBXaW5pYXJza2ksIE1pY2hhbCA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+DQo+
IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyMiwgMjAyNSA2OjQxIEFNDQo+IA0KPiAraW50IHhl
X2dndHRfbm9kZV9sb2FkKHN0cnVjdCB4ZV9nZ3R0X25vZGUgKm5vZGUsIGNvbnN0IHZvaWQgKnNy
Yywgc2l6ZV90DQo+IHNpemUsIHUxNiB2ZmlkKQ0KPiArew0KPiArCXU2NCB2ZmlkX3B0ZSA9IHhl
X2VuY29kZV92ZmlkX3B0ZSh2ZmlkKTsNCj4gKwljb25zdCB1NjQgKmJ1ZiA9IHNyYzsNCj4gKwlz
dHJ1Y3QgeGVfZ2d0dCAqZ2d0dDsNCj4gKwl1NjQgc3RhcnQsIGVuZDsNCj4gKw0KPiArCWlmICgh
bm9kZSkNCj4gKwkJcmV0dXJuIC1FTk9FTlQ7DQo+ICsNCj4gKwlndWFyZChtdXRleCkoJm5vZGUt
PmdndHQtPmxvY2spOw0KPiArDQo+ICsJZ2d0dCA9IG5vZGUtPmdndHQ7DQo+ICsJc3RhcnQgPSBu
b2RlLT5iYXNlLnN0YXJ0Ow0KPiArCWVuZCA9IHN0YXJ0ICsgc2l6ZSAtIDE7DQo+ICsNCj4gKwlp
ZiAoeGVfZ2d0dF9wdGVfc2l6ZShnZ3R0LCBub2RlLT5iYXNlLnNpemUpICE9IHNpemUpDQo+ICsJ
CXJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsJd2hpbGUgKHN0YXJ0IDwgZW5kKSB7DQo+ICsJCWdn
dHQtPnB0X29wcy0+Z2d0dF9zZXRfcHRlKGdndHQsIHN0YXJ0LCAoKmJ1ZiAmDQo+IH5HR1RUX1BU
RV9WRklEKSB8IHZmaWRfcHRlKTsNCj4gKwkJc3RhcnQgKz0gWEVfUEFHRV9TSVpFOw0KPiArCQli
dWYrKzsNCj4gKwl9DQoNCnN0YXRpYyB1NjQgeGVfZW5jb2RlX3ZmaWRfcHRlKHUxNiB2ZmlkKQ0K
ew0KICAgICAgICByZXR1cm4gRklFTERfUFJFUChHR1RUX1BURV9WRklELCB2ZmlkKSB8IFhFX1BB
R0VfUFJFU0VOVDsNCn0NCg0Kc28gYWJvdmUgbG9vcCBibGluZGx5IHNldCBldmVyeSBHR1RUIGVu
dHJ5IHRvIHZhbGlkLiBJc24ndCB0aGUgcmlnaHQNCnRoaW5nIHRvIGNhcnJ5IHRoZSBwcmVzZW50
IGJpdCBmcm9tIHRoZSBzcmMgYnVmZmVyPw0K
