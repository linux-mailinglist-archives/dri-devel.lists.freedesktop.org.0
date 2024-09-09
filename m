Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC15970CCD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 07:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCAC10E2AB;
	Mon,  9 Sep 2024 05:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O6byVEuk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82D510E2AB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 05:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725858188; x=1757394188;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8iMJMu09/+CSXEOYkD0gC8DzVDmbVQ5e1od8QFFBqOs=;
 b=O6byVEukbTmo6ySvQTVfPTcHJgrXLLcPXRAilbXkNIMVqg0R95B0WoMy
 IE5fsEkKXnKkle8/HjjeLDiE1L0Isp1UzaU0+cLOYZjMeCThplGeaXPew
 nTorHALuM/j+CA2Sl6Z8xynl/VMM2JG0ClRMPxdBXvb3KjaZY9N9A+dmC
 B5GYCW3KpXtmT6Be58JR0sK47/cTOYwiH4NXhaWQ0S3gQT4ios59l0230
 NytDbbWeMq+A1BdElrWriZ6YQwNfMGjHMWVaex5UWJt1r2X175ekR84YF
 kIzfOnQJGA6NMU+e0tN0psILh6zUguA6kXEbeONpVI+SwoatyKvV3qDjl w==;
X-CSE-ConnectionGUID: ZbPdekAtSS6xWLz/JHq2gQ==
X-CSE-MsgGUID: aSi/QKzsSF2scID7Dsc1iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35193960"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="35193960"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2024 22:03:05 -0700
X-CSE-ConnectionGUID: GNw+7PkNR7yTu8j4oUzdTw==
X-CSE-MsgGUID: oBGF/24XSHa3abKbGd0StA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="71496336"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Sep 2024 22:03:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 8 Sep 2024 22:03:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 8 Sep 2024 22:03:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 8 Sep 2024 22:03:03 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 8 Sep 2024 22:03:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSMbybig8i/oJfrmggx7xPew0Np36azjjZmAy+bnuuIYhLiAEde+ElZ+kgOYylXdGg6hKLmAIEeyWRUZxxptIHVTbYDnUoygvfddMVVW8m4/V20G0033wFiqEdRaAGyBhMJhO+gOXW/flSf7ALTRd3OiLapsRh4jmWGRvvBD11GJp6VUoeaa1a7hG0OXQYxNN9HZ915XYg7uRCE7JIB6wy1G3Xg96PxAhd+ZCCmIp4BLVgNowW2ePuN6vwN07ophX1TiGMHtBqMwMmwtURiz+B+htP3/jQuNFCONTzqCaWD0oKqh8oVRv4tMJOL86XadV7maMrRWHfiBUeQUV5Yw6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8iMJMu09/+CSXEOYkD0gC8DzVDmbVQ5e1od8QFFBqOs=;
 b=yF4F0Imm3aI4Z5UfJ4RSPDtrGerv4Uyiv4RrvSgJsH/wZRo5T8MixOXS2Y0o2SlBq6DFRgud7WJjMuDoagyGmn0U+E2dohnv4F5vz4JhVIxrVRc7NuJx3fHBV8gE1BCFj7VhlcNxl9cxoMsHrRYEGz3yyARFdFCUW8xBwOPnbDjlw2yA7liv2SjZQDOCpi+Kanxmi5lg3H68g3Af5FG/biPMATjAq4SannGExs63CPoV4NlTt8XMTwzlCT2Zz30YRKfOQivz65F5rQgQvOqxrYin9zrafgyiFrm/zZCTrkghKrKiNcXlAvUnC5t6PIROiLnzP4P6LsqGXp3c91cOvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8)
 by PH0PR11MB5206.namprd11.prod.outlook.com (2603:10b6:510:3f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Mon, 9 Sep
 2024 05:03:01 +0000
Received: from CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::271b:c621:d244:6105]) by CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::271b:c621:d244:6105%4]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 05:03:01 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Gerd
 Hoffmann" <kraxel@redhat.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v5 4/7] udmabuf: udmabuf_create pin folio codestyle cleanup
Thread-Topic: [PATCH v5 4/7] udmabuf: udmabuf_create pin folio codestyle
 cleanup
Thread-Index: AQHa/d0l2PFrjUd2QESgNcp6qjqyJLJJdJ3ggAD92ACABEyJ4A==
Date: Mon, 9 Sep 2024 05:03:00 +0000
Message-ID: <CH3PR11MB7177760ADAF50756F886989CF8992@CH3PR11MB7177.namprd11.prod.outlook.com>
References: <20240903083818.3071759-1-link@vivo.com>
 <20240903083818.3071759-5-link@vivo.com>
 <IA0PR11MB7185AA974CF7207048178187F89E2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <d213c597-ec2a-4685-9048-5b477f64853f@vivo.com>
In-Reply-To: <d213c597-ec2a-4685-9048-5b477f64853f@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7177:EE_|PH0PR11MB5206:EE_
x-ms-office365-filtering-correlation-id: 65103a07-4d08-4951-5291-08dcd08cadcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NzdKWUx1LzlNaWZkOFJONnQ3QU1HR3lFaG44UWxWUGNwczhRaGhxL0lwVitK?=
 =?utf-8?B?d08zdm5KRlJ0YlZpbWphZjJrWC9oV3RUY0oybnljMFprK0pBWVBRN28wQVZi?=
 =?utf-8?B?NTlWcUZQUURlN0l5aHBuTEUrWDE2WVNDYzZ3TXhtY1Q2S2Z5ZTU2dzJjZ0ZH?=
 =?utf-8?B?eFd5d3Yvc1ZjSmR1SEN4dnFYVkNxdGlLOFZHN0JpTDBCWGR1eUpkdUdhOC9V?=
 =?utf-8?B?RXZUODFmd2FScVhIV2owWkJYekp6WE9DUHAwallIaFJ6aDRVR01uOFRLT2Ns?=
 =?utf-8?B?V2N0c1FsY214TlpYSDZVY0NhWGMzUUMrMUFYaitiN3pBemlPamMyZDZwR2V2?=
 =?utf-8?B?TUpMQ2ZZQyt3cjZyTGV0c3dlbzhWQktld2pqdTg3TTgyRUVUSksyN2FHVmQ5?=
 =?utf-8?B?YlZCelVLZDZyUmFRR3ZlUkpua295L1NnWHJnUFdkVVc2Z2ZqR1AvWWxzQTZB?=
 =?utf-8?B?NXkwMUtqWUZNdENLcmxFS2NQSW5ET1AwdGw4SU82QWtIWjFGN2Q3SURZSm0w?=
 =?utf-8?B?WHhEam5RTitIVzhYYzZFMnBpU0pPOVBMTklNcFNvVkY2UlQ3eVVhdzRGbEJh?=
 =?utf-8?B?dzdBbFZxMW93OFhYSDZRcjF0dVdhWHdUNkpPYlRmVGNaM0JGc01HT2J5aGtR?=
 =?utf-8?B?VHhETzZZUHJUQlRSR1BRSDN1b0dYdit4SXV1RUUvN0Z1aWV3b29laDljam5N?=
 =?utf-8?B?TE1TcitIem9vdHRjUC9PN3lMUlZSOTZHS0lXaDBHSmtjRmdlQUhaSDhXT0ZJ?=
 =?utf-8?B?Wm16RTYrN0NteDJaVlVYazBrc2doSTR1aWlRbWxqS3A5c0RXcWJGejZLT1l3?=
 =?utf-8?B?THBBNlZKSTlFUGtTWGpPRENLQVQ1dmN1MEh1eFYwajlZMGFYbzRPMFMva01F?=
 =?utf-8?B?VWhrMGZ4aWt6SDNRdkRGZlJ4eHN4QVJoZW1WTCtQKzNTdjhjVG1wcnhhWHNL?=
 =?utf-8?B?TkZ2MVpKSHFJbGtCWVUwRG5JWUI3M0pHeFgrU25GVjZ1NnpPOFhpUlRoWWhW?=
 =?utf-8?B?bGNMZC8vaHBXYVdoWUJ5MlhFVGQ1MU9BWVdmeDJ3VnM3bE82NHo5K3BJc05n?=
 =?utf-8?B?VkNUUmpxWHFnOVNSeHIrV1hER2Q0M3J1VUlsZUdvYVMreVFDdG03TGcxSkE4?=
 =?utf-8?B?WHB4TWNmbFcydG5OT2RJMWpaNlNGYjM2QVdJLy9nQWliN0JxNG9mNWcxOEJF?=
 =?utf-8?B?QUplbDAraUtSbjJEamNKaEZRUXJjZERpOWVoR2NvalJac0xndU9iWTRSRnhB?=
 =?utf-8?B?YXFZOXdXcHZlbjJoTkw0SzFTS0c0YTRmYUl4MnZ3Tk1uazV6WlF2d2Eyb1RH?=
 =?utf-8?B?dS9iTmVXVUJRc0hqcFhQV2EyeWQvVERUeUpYOW4wb042WlZOU0xaeVhmc215?=
 =?utf-8?B?NHlCTk1UdXF2OS9HYWlsVzdFQ0liUXl0TSt5MzVFNU5ibnBqUGJiQnhzcERh?=
 =?utf-8?B?T2t0MkdBdUkrWUZPQ01vOHc5QTB3TWFlNWdMTGZEZUZ3aVV3WVhRS21FNElB?=
 =?utf-8?B?OVBQWlRrL2cxM2VJTGVxM1dld3dTUkZOUEFCTnpTMkR3TlhKYnJQejYyb2cv?=
 =?utf-8?B?Z3FvVHBzV1ZYMWFWNE54UjdZdmYrUWlzTUszNDBpQzIyQ0l6aWJqNlVpZ09L?=
 =?utf-8?B?bVgyQ0VPbTNTOXZZL2JCalZYVVFtR1hSQjZlRkNmQTNPaWJLUHpzY00zeDZo?=
 =?utf-8?B?VW5ZZWVDZitzWEhLKzhFejNZdHdHOGw2NzBza3VMNXAyNm13Uzc4c3kzc1A3?=
 =?utf-8?B?UGtNaTNocDVTMERTM0o3eFB3dFNWMzZIRUpFRnBJZG40VytEaXRYb01TaGNp?=
 =?utf-8?B?RTN4RUVKOGxyT3o3TGdacWxYd0tLSHA4M0xvRnIzYXNiUmZ3UnM1OHp3c3Qz?=
 =?utf-8?B?WjRYSXRxTEZSNndVeXhyTjFzUnRLdTVJWUdGODdYZkNGRHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vkg3cVJnYWpRZ215ZlB3dm5VaW1PNUN5RDZvK2NlYzZrdnROYjZUdnk3SUVs?=
 =?utf-8?B?RlpxUnpKUTZyb2g2UWRkQ2MxcHAwb25FVW5YallpeDZITWhoc2pJc21ZVUtl?=
 =?utf-8?B?ZWFXeUo0S0oyZy9lVzJWOVUyUXd0dWNTK0dCdzd3Mkc0U1p0bzhYL0J3TXln?=
 =?utf-8?B?cVRGNFBaY3hVQzZQekk3TVgzSXYzYnAwUjNUOEZwZHBjNzFlbWlwRWdnV2Jw?=
 =?utf-8?B?R2lVaFdtTFF4Smp2WHFTNkdMR1dGNXRwOUl3TVNwbnFDT3NOeldBR2pDdkgv?=
 =?utf-8?B?VytIYjdmbkxnU2pjSXRXUUFVL2Y5NWVFLzJPTGFnaUo4M2hFalNweEZyQ3JK?=
 =?utf-8?B?dWxqbXQ4VWdMOEFtNDBOSFkxb053TmZsWFZIZ3JuaEU2VTVQOFNBZnBGa0RG?=
 =?utf-8?B?dVFLellmNllmaWphc015R3FPS2QyR016R2xKS0JGU0RHOWk2dTRVb3dkVXA1?=
 =?utf-8?B?TUpxa2VKWkp3cDJweHVLamduVzdtUjJWRG1vVkVwK3lSYUVWNUdPZitmSUVh?=
 =?utf-8?B?ODRmaXpkTTFna3ZYNUpFN25SaEtBL2hZNVJEZjZkWXZ2bEEyd1BaNlNsMXRK?=
 =?utf-8?B?ZjBhRm84V3p6a1dRcS83Y2hpenFmQ0U2SlNRQlpvekRFK2R5azdtTnRkYk5T?=
 =?utf-8?B?NmVJNWZMRGswQnJkOXlUMEFTSS9kWENMUWhaenFCWVRZbmluSFJDR1VpYmlm?=
 =?utf-8?B?eVlMQXQrdW1vVXlpcm5KRXBrZGs0VTQ2N3VqNXVYSFVFTHR4RW51ODRSamR0?=
 =?utf-8?B?Yk5sM3dLOXVZS0wrQlNnSGFXUzJ3dERHM2NhK1ZnTGc4MDM0dUtPY3p2bzQ2?=
 =?utf-8?B?b0RpRjVCRE5pWHZXSGZYbDcvNmZZaktJRDZuU0xOUzdlWlg1aHdKTFFQS0Rx?=
 =?utf-8?B?OCsyemNSb0JCWS82Z05Mdjc2MFB0c3lPTXZqM3NoRGJnQkZ3bWFtaWZ4VE1Q?=
 =?utf-8?B?akJHcUtkN01FL1p1eFFrbUhwc1gxajBVQ3N2WGV5UFVuSlpjVDlrZDZmZUJM?=
 =?utf-8?B?WDZMMzZIaXIzYm0wRXZmYWZJM2ZaenRxMGtjamZmVWVTNE1sbjcrdGt6TW5B?=
 =?utf-8?B?MEdPOGtIdU5QL0hSVUgxU2lpMUttM0JFVzZCN2NCV1orNkVpVjB0YXE1M1ZG?=
 =?utf-8?B?U3E4RzFDWXZqV2d3UEthaWx0OFJrbHBCZ09TMEdQMVA3QUF6RG5VdTJNNXZB?=
 =?utf-8?B?T2FXc0JVVG42T1hvRk5GMHVTSlFvRVo5YW5STU9uMXRmNzBqL24zU2lTbjRY?=
 =?utf-8?B?bmRBVzBEU0U1K1BTZ29zNmkwb1BvY21Ld3BhYkZXUFlqM0tLc0FtdnBoYUFl?=
 =?utf-8?B?Z0dEd1BsRjN4MlVpdmtrYnViRkxLVkRKV3gxbFI2V1ZCWWQ5aFlyWFNWbDBi?=
 =?utf-8?B?OU80U083TVNXa3ZFa2F1M0RGOGNVbXNkSmR1clgxb2hhbHQxZUtYYk5yeWhj?=
 =?utf-8?B?amJvYU05OUdQUzJaeHFnbXB3cWhzZ0ZXc01oclpOYmpkQk8yNWgvb2xUWkh3?=
 =?utf-8?B?a1BCQUlGdHRSUSt6azdpYTlVSDJYcDVOeFpBQ2JKRWFudHBxNkVBSHdBeFBq?=
 =?utf-8?B?YVVDbG5pSEo5NWF0ejBlTmJmbTRUdlBkcWRaVHR3Q1RMUm9WSGhjM0U1ck9x?=
 =?utf-8?B?eHdUV2Jpa2pVTnEyVDQ3VCt0anF4clF3elhTb2p1UzRRaGV6SzAvcldlTm9H?=
 =?utf-8?B?RFh2M3BVZnhDTUxGSWErUjluMlZOOVd4ditCV3RGL3hVazNhQXNwZmtHbS8w?=
 =?utf-8?B?QzNvMjVpOTMwUEJDYzNibEIwaEMxaFpLRVFSYUU4UFlXd2wzcVpMRitjbWNi?=
 =?utf-8?B?SE15L1BjWmFKWUVaY1Q1ZFMxVzcxOTUwbTRyd2tjY09HaHkxYlNBSnFCWStB?=
 =?utf-8?B?YzVvVFpCVXo5dVBwaXVMWTdPSGFwWTlHMStvazRLdVN2VkxKSnJGdzRBanpo?=
 =?utf-8?B?bDVIQ2FpYVFBdTVlaW9SeEtxOHRmdVBiL0dwcXgzZzROdXNiclV4bUVWTVVl?=
 =?utf-8?B?S3lNZ08wK0I5YnFmUk1KMU84aXRpbVFsVnkzSFg0Z1poMklUb3ZLWUtCQzhy?=
 =?utf-8?B?UGpWR1dZVU0yWnRhOWk5T1Y0UkZFZVlaZ2xVN2hhS3p1eStLRHRUdmZHNkp2?=
 =?utf-8?Q?v/3t6fRfXrwrQfLaOoGjT7fKO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65103a07-4d08-4951-5291-08dcd08cadcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 05:03:00.9200 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ggVK3+jtTdlnP0ufi1gNQEZ8hlxp9rYZauuDwejPofU0IGm237FqwfJ/IrFhXBu7MhJ9NCA6oxqctwvkpx1qJSNR18giVMMfJFUvHAJk3YU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5206
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

SGkgSHVhbiwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDQvN10gdWRtYWJ1ZjogdWRtYWJ1
Zl9jcmVhdGUgcGluIGZvbGlvIGNvZGVzdHlsZQ0KPiBjbGVhbnVwDQo+IA0KPiANCj4g5ZyoIDIw
MjQvOS82IDE2OjE3LCBLYXNpcmVkZHksIFZpdmVrIOWGmemBkzoNCj4gPiBIaSBIdWFuLA0KPiA+
DQo+ID4+IFN1YmplY3Q6IFtQQVRDSCB2NSA0LzddIHVkbWFidWY6IHVkbWFidWZfY3JlYXRlIHBp
biBmb2xpbyBjb2Rlc3R5bGUNCj4gPj4gY2xlYW51cA0KPiA+Pg0KPiA+PiBUaGlzIHBhdGNoIHNw
bGl0IHBpbiBmb2xpb3MgaW50byBzaW5nbGUgZnVuY3Rpb246IHVkbWFidWZfcGluX2ZvbGlvcy4N
Cj4gPj4NCj4gPj4gV2hlbiByZWNvcmQgZm9saW8gYW5kIG9mZnNldCBpbnRvIHVkbWFidWZfZm9s
aW8gYW5kIG9mZnNldHMsIHRoZSBvdXRlcg0KPiA+PiBsb29wIG9mIHRoaXMgcGF0Y2ggaXRlcmF0
ZXMgdGhyb3VnaCBmb2xpb3MsIHdoaWxlIHRoZSBpbm5lciBsb29wIGNvcnJlY3RseQ0KPiA+PiBz
ZXRzIHRoZSBmb2xpbyBhbmQgY29ycmVzcG9uZGluZyBvZmZzZXQgaW50byB0aGUgdWRtYWJ1ZiBz
dGFydGluZyBmcm9tDQo+ID4+IHRoZSBvZmZzZXQuIGlmIHJlYWNoIHRvIHBnY250IG9yIG5yX2Zv
bGlvcywgZW5kIG9mIGxvb3AuDQo+ID4+DQo+ID4+IEJ5IHRoaXMsIG1vcmUgcmVhZGFibGUuDQo+
ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IEh1YW4gWWFuZyA8bGlua0B2aXZvLmNvbT4NCj4gPj4g
LS0tDQo+ID4+ICAgZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYyB8IDEzMiArKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCA3MSBpbnNl
cnRpb25zKCspLCA2MSBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZG1hLWJ1Zi91ZG1hYnVmLmMgYi9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jDQo+ID4+IGlu
ZGV4IDQ1NmRiNTg0NDZlMS4uY2EyYjIxYzVjNTdmIDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJz
L2RtYS1idWYvdWRtYWJ1Zi5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMN
Cj4gPj4gQEAgLTMzMCwxNyArMzMwLDY3IEBAIHN0YXRpYyBpbnQgZXhwb3J0X3VkbWFidWYoc3Ry
dWN0IHVkbWFidWYNCj4gKnVidWYsDQo+ID4+ICAgCXJldHVybiBkbWFfYnVmX2ZkKGJ1ZiwgZmxh
Z3MpOw0KPiA+PiAgIH0NCj4gPj4NCj4gPj4gK3N0YXRpYyBpbnQgdWRtYWJ1Zl9waW5fZm9saW9z
KHN0cnVjdCB1ZG1hYnVmICp1YnVmLCBzdHJ1Y3QgZmlsZSAqbWVtZmQsDQo+ID4+ICsJCQkgICAg
ICBsb2ZmX3Qgc3RhcnQsIGxvZmZfdCBzaXplKQ0KPiA+PiArew0KPiA+PiArCXBnb2ZmX3QgcGdv
ZmYsIHBnY250LCB1cGdjbnQgPSB1YnVmLT5wYWdlY291bnQ7DQo+ID4+ICsJdTMyIGN1cl9mb2xp
bywgY3VyX3BnY250Ow0KPiA+PiArCXN0cnVjdCBmb2xpbyAqKmZvbGlvcyA9IE5VTEw7DQo+ID4+
ICsJbG9uZyBucl9mb2xpb3M7DQo+ID4+ICsJbG9mZl90IGVuZDsNCj4gPj4gKwlpbnQgcmV0ID0g
MDsNCj4gPiBDaGFuZ2UgcmV0J3MgdHlwZSBhbmQgdGhpcyBmdW5jdGlvbidzIHJldHVybiB0eXBl
IHRvIGxvbmcgZm9yIGNvbnNpc3RlbmN5Lg0KPiA+DQo+ID4+ICsNCj4gPj4gKwlwZ2NudCA9IHNp
emUgPj4gUEFHRV9TSElGVDsNCj4gPj4gKwlmb2xpb3MgPSBrdm1hbGxvY19hcnJheShwZ2NudCwg
c2l6ZW9mKCpmb2xpb3MpLCBHRlBfS0VSTkVMKTsNCj4gPj4gKwlpZiAoIWZvbGlvcykNCj4gPj4g
KwkJcmV0dXJuIC1FTk9NRU07DQo+ID4+ICsNCj4gPj4gKwllbmQgPSBzdGFydCArIChwZ2NudCA8
PCBQQUdFX1NISUZUKSAtIDE7DQo+ID4+ICsJbnJfZm9saW9zID0gbWVtZmRfcGluX2ZvbGlvcyht
ZW1mZCwgc3RhcnQsIGVuZCwgZm9saW9zLCBwZ2NudCwNCj4gPj4gJnBnb2ZmKTsNCj4gPj4gKwlp
ZiAobnJfZm9saW9zIDw9IDApIHsNCj4gPj4gKwkJcmV0ID0gbnJfZm9saW9zID8gbnJfZm9saW9z
IDogLUVJTlZBTDsNCj4gPj4gKwkJZ290byBlcnI7DQo+ID4+ICsJfQ0KPiA+PiArDQo+ID4+ICsJ
Y3VyX3BnY250ID0gMDsNCj4gPj4gKwlmb3IgKGN1cl9mb2xpbyA9IDA7IGN1cl9mb2xpbyA8IG5y
X2ZvbGlvczsgKytjdXJfZm9saW8pIHsNCj4gPj4gKwkJcGdvZmZfdCBzdWJwZ29mZiA9IHBnb2Zm
Ow0KPiA+PiArCQlzaXplX3QgZnNpemUgPSBmb2xpb19zaXplKGZvbGlvc1tjdXJfZm9saW9dKTsN
Cj4gPj4gKw0KPiA+PiArCQlyZXQgPSBhZGRfdG9fdW5waW5fbGlzdCgmdWJ1Zi0+dW5waW5fbGlz
dCwgZm9saW9zW2N1cl9mb2xpb10pOw0KPiA+PiArCQlpZiAocmV0IDwgMCkNCj4gPj4gKwkJCWdv
dG8gZXJyOw0KPiA+PiArDQo+ID4+ICsJCWZvciAoOyBzdWJwZ29mZiA8IGZzaXplOyBzdWJwZ29m
ZiArPSBQQUdFX1NJWkUpIHsNCj4gPj4gKwkJCXVidWYtPmZvbGlvc1t1cGdjbnRdID0gZm9saW9z
W2N1cl9mb2xpb107DQo+ID4+ICsJCQl1YnVmLT5vZmZzZXRzW3VwZ2NudF0gPSBzdWJwZ29mZjsN
Cj4gPj4gKwkJCSsrdXBnY250Ow0KPiA+PiArDQo+ID4+ICsJCQlpZiAoKytjdXJfcGdjbnQgPj0g
cGdjbnQpDQo+ID4+ICsJCQkJZ290byBlbmQ7DQo+ID4+ICsJCX0NCj4gPj4gKw0KPiA+PiArCQkv
KioNCj4gPj4gKwkJICogVGhlIHRlcm0gcmFuZ2UgbWF5IHN0YXJ0IHdpdGggb2Zmc2V0LCBzbyB0
aGUgZmlyc3QgZm9saW8NCj4gPj4gKwkJICogbmVlZCB0YWtlIGNhcmUgb2YgaXQuIEFuZCB0aGUg
cmVtYWluIGZvbGlvIHN0YXJ0IGZyb20gMC4NCj4gPiBUaGUgY29tbWVudHMgYWJvdmUgYXJlIG5v
dCB2ZXJ5IG1lYW5pbmdmdWwuIFBsZWFzZSByZXdyaXRlIHRoZW0gYXM6DQo+ID4gKiBJbiBhIGdp
dmVuIHJhbmdlLCBvbmx5IHRoZSBmaXJzdCBzdWJwYWdlIG9mIHRoZSBmaXJzdCBmb2xpbyBoYXMg
YW4gb2Zmc2V0LCB0aGF0DQo+ID4gKiBpcyByZXR1cm5lZCBieSBtZW1mZF9waW5fZm9saW9zKCku
IFRoZSBmaXJzdCBzdWJwYWdlcyBvZiBvdGhlciBmb2xpb3MgKGluDQo+IHRoZQ0KPiA+ICogcmFu
Z2UpIGhhdmUgYW4gb2Zmc2V0IG9mIDAuDQo+ID4NCj4gPj4gKwkJICovDQo+ID4+ICsJCXBnb2Zm
ID0gMDsNCj4gPj4gKwl9DQo+ID4+ICtlbmQ6DQo+ID4+ICtlcnI6DQo+ID4gTm8gbmVlZCB0byBo
YXZlIHR3byBsYWJlbHMgaGVyZS4gS2VlcCBlbmQgYW5kIGdldCByaWQgb2YgZXJyPw0KPiA+DQo+
ID4+ICsJdWJ1Zi0+cGFnZWNvdW50ID0gdXBnY250Ow0KPiA+PiArCWt2ZnJlZShmb2xpb3MpOw0K
PiA+PiArCXJldHVybiByZXQ7DQo+ID4+ICt9DQo+ID4+ICsNCj4gPj4gICBzdGF0aWMgbG9uZyB1
ZG1hYnVmX2NyZWF0ZShzdHJ1Y3QgbWlzY2RldmljZSAqZGV2aWNlLA0KPiA+PiAgIAkJCSAgIHN0
cnVjdCB1ZG1hYnVmX2NyZWF0ZV9saXN0ICpoZWFkLA0KPiA+PiAgIAkJCSAgIHN0cnVjdCB1ZG1h
YnVmX2NyZWF0ZV9pdGVtICpsaXN0KQ0KPiA+PiAgIHsNCj4gPj4gLQlwZ29mZl90IHBnb2ZmLCBw
Z2NudCwgcGdsaW1pdCwgcGdidWYgPSAwOw0KPiA+PiAtCWxvbmcgbnJfZm9saW9zLCByZXQgPSAt
RUlOVkFMOw0KPiA+PiAtCXN0cnVjdCBmaWxlICptZW1mZCA9IE5VTEw7DQo+ID4+IC0Jc3RydWN0
IGZvbGlvICoqZm9saW9zOw0KPiA+PiArCXBnb2ZmX3QgcGdjbnQgPSAwLCBwZ2xpbWl0Ow0KPiA+
PiArCWxvbmcgcmV0ID0gLUVJTlZBTDsNCj4gPj4gICAJc3RydWN0IHVkbWFidWYgKnVidWY7DQo+
ID4+IC0JdTMyIGksIGosIGssIGZsYWdzOw0KPiA+PiAtCWxvZmZfdCBlbmQ7DQo+ID4+ICsJdTMy
IGksIGZsYWdzOw0KPiA+Pg0KPiA+PiAgIAl1YnVmID0ga3phbGxvYyhzaXplb2YoKnVidWYpLCBH
RlBfS0VSTkVMKTsNCj4gPj4gICAJaWYgKCF1YnVmKQ0KPiA+PiBAQCAtMzQ5LDgxICszOTksNDMg
QEAgc3RhdGljIGxvbmcgdWRtYWJ1Zl9jcmVhdGUoc3RydWN0IG1pc2NkZXZpY2UNCj4gPj4gKmRl
dmljZSwNCj4gPj4gICAJSU5JVF9MSVNUX0hFQUQoJnVidWYtPnVucGluX2xpc3QpOw0KPiA+PiAg
IAlwZ2xpbWl0ID0gKHNpemVfbGltaXRfbWIgKiAxMDI0ICogMTAyNCkgPj4gUEFHRV9TSElGVDsN
Cj4gPj4gICAJZm9yIChpID0gMDsgaSA8IGhlYWQtPmNvdW50OyBpKyspIHsNCj4gPj4gLQkJaWYg
KCFJU19BTElHTkVEKGxpc3RbaV0ub2Zmc2V0LCBQQUdFX1NJWkUpKQ0KPiA+PiArCQlpZiAoIVBB
R0VfQUxJR05FRChsaXN0W2ldLm9mZnNldCkpDQo+ID4+ICAgCQkJZ290byBlcnI7DQo+ID4+IC0J
CWlmICghSVNfQUxJR05FRChsaXN0W2ldLnNpemUsIFBBR0VfU0laRSkpDQo+ID4+ICsJCWlmICgh
UEFHRV9BTElHTkVEKGxpc3RbaV0uc2l6ZSkpDQo+ID4+ICAgCQkJZ290byBlcnI7DQo+ID4+IC0J
CXVidWYtPnBhZ2Vjb3VudCArPSBsaXN0W2ldLnNpemUgPj4gUEFHRV9TSElGVDsNCj4gPj4gLQkJ
aWYgKHVidWYtPnBhZ2Vjb3VudCA+IHBnbGltaXQpDQo+ID4+ICsNCj4gPj4gKwkJcGdjbnQgKz0g
bGlzdFtpXS5zaXplID4+IFBBR0VfU0hJRlQ7DQo+ID4+ICsJCWlmIChwZ2NudCA+IHBnbGltaXQp
DQo+ID4+ICAgCQkJZ290byBlcnI7DQo+ID4+ICAgCX0NCj4gPj4NCj4gPj4gLQlpZiAoIXVidWYt
PnBhZ2Vjb3VudCkNCj4gPj4gKwlpZiAoIXBnY250KQ0KPiA+PiAgIAkJZ290byBlcnI7DQo+ID4+
DQo+ID4+IC0JdWJ1Zi0+Zm9saW9zID0ga3ZtYWxsb2NfYXJyYXkodWJ1Zi0+cGFnZWNvdW50LCBz
aXplb2YoKnVidWYtDQo+ID4+PiBmb2xpb3MpLA0KPiA+PiAtCQkJCSAgICAgIEdGUF9LRVJORUwp
Ow0KPiA+PiArCXVidWYtPmZvbGlvcyA9IGt2bWFsbG9jX2FycmF5KHBnY250LCBzaXplb2YoKnVi
dWYtPmZvbGlvcyksDQo+ID4+IEdGUF9LRVJORUwpOw0KPiA+PiAgIAlpZiAoIXVidWYtPmZvbGlv
cykgew0KPiA+PiAgIAkJcmV0ID0gLUVOT01FTTsNCj4gPj4gICAJCWdvdG8gZXJyOw0KPiA+PiAg
IAl9DQo+ID4+IC0JdWJ1Zi0+b2Zmc2V0cyA9IGt2Y2FsbG9jKHVidWYtPnBhZ2Vjb3VudCwgc2l6
ZW9mKCp1YnVmLT5vZmZzZXRzKSwNCj4gPj4gLQkJCQkgR0ZQX0tFUk5FTCk7DQo+ID4+ICsNCj4g
Pj4gKwl1YnVmLT5vZmZzZXRzID0ga3ZjYWxsb2MocGdjbnQsIHNpemVvZigqdWJ1Zi0+b2Zmc2V0
cyksIEdGUF9LRVJORUwpOw0KPiA+PiAgIAlpZiAoIXVidWYtPm9mZnNldHMpIHsNCj4gPj4gICAJ
CXJldCA9IC1FTk9NRU07DQo+ID4+ICAgCQlnb3RvIGVycjsNCj4gPj4gICAJfQ0KPiA+Pg0KPiA+
PiAtCXBnYnVmID0gMDsNCj4gPj4gICAJZm9yIChpID0gMDsgaSA8IGhlYWQtPmNvdW50OyBpKysp
IHsNCj4gPj4gLQkJbWVtZmQgPSBmZ2V0KGxpc3RbaV0ubWVtZmQpOw0KPiA+PiArCQlzdHJ1Y3Qg
ZmlsZSAqbWVtZmQgPSBmZ2V0KGxpc3RbaV0ubWVtZmQpOw0KPiA+PiArDQo+ID4+ICAgCQlyZXQg
PSBjaGVja19tZW1mZF9zZWFscyhtZW1mZCk7DQo+ID4+ICAgCQlpZiAocmV0IDwgMCkNCj4gPj4g
ICAJCQlnb3RvIGVycjsNCj4gPj4NCj4gPj4gLQkJcGdjbnQgPSBsaXN0W2ldLnNpemUgPj4gUEFH
RV9TSElGVDsNCj4gPj4gLQkJZm9saW9zID0ga3ZtYWxsb2NfYXJyYXkocGdjbnQsIHNpemVvZigq
Zm9saW9zKSwgR0ZQX0tFUk5FTCk7DQo+ID4+IC0JCWlmICghZm9saW9zKSB7DQo+ID4+IC0JCQly
ZXQgPSAtRU5PTUVNOw0KPiA+PiAtCQkJZ290byBlcnI7DQo+ID4+IC0JCX0NCj4gPj4gLQ0KPiA+
PiAtCQllbmQgPSBsaXN0W2ldLm9mZnNldCArIChwZ2NudCA8PCBQQUdFX1NISUZUKSAtIDE7DQo+
ID4+IC0JCXJldCA9IG1lbWZkX3Bpbl9mb2xpb3MobWVtZmQsIGxpc3RbaV0ub2Zmc2V0LCBlbmQs
DQo+ID4+IC0JCQkJICAgICAgIGZvbGlvcywgcGdjbnQsICZwZ29mZik7DQo+ID4+IC0JCWlmIChy
ZXQgPD0gMCkgew0KPiA+PiAtCQkJa3ZmcmVlKGZvbGlvcyk7DQo+ID4+IC0JCQlpZiAoIXJldCkN
Cj4gPj4gLQkJCQlyZXQgPSAtRUlOVkFMOw0KPiA+PiAtCQkJZ290byBlcnI7DQo+ID4+IC0JCX0N
Cj4gPj4gLQ0KPiA+PiAtCQlucl9mb2xpb3MgPSByZXQ7DQo+ID4+IC0JCXBnb2ZmID4+PSBQQUdF
X1NISUZUOw0KPiA+PiAtCQlmb3IgKGogPSAwLCBrID0gMDsgaiA8IHBnY250OyBqKyspIHsNCj4g
Pj4gLQkJCXVidWYtPmZvbGlvc1twZ2J1Zl0gPSBmb2xpb3Nba107DQo+ID4+IC0JCQl1YnVmLT5v
ZmZzZXRzW3BnYnVmXSA9IHBnb2ZmIDw8IFBBR0VfU0hJRlQ7DQo+ID4+IC0NCj4gPj4gLQkJCWlm
IChqID09IDAgfHwgdWJ1Zi0+Zm9saW9zW3BnYnVmLTFdICE9IGZvbGlvc1trXSkgew0KPiA+PiAt
CQkJCXJldCA9IGFkZF90b191bnBpbl9saXN0KCZ1YnVmLT51bnBpbl9saXN0LA0KPiA+PiAtCQkJ
CQkJCWZvbGlvc1trXSk7DQo+ID4+IC0JCQkJaWYgKHJldCA8IDApIHsNCj4gPj4gLQkJCQkJa2Zy
ZWUoZm9saW9zKTsNCj4gPj4gLQkJCQkJZ290byBlcnI7DQo+ID4+IC0JCQkJfQ0KPiA+PiAtCQkJ
fQ0KPiA+PiAtDQo+ID4+IC0JCQlwZ2J1ZisrOw0KPiA+PiAtCQkJaWYgKCsrcGdvZmYgPT0gZm9s
aW9fbnJfcGFnZXMoZm9saW9zW2tdKSkgew0KPiA+PiAtCQkJCXBnb2ZmID0gMDsNCj4gPj4gLQkJ
CQlpZiAoKytrID09IG5yX2ZvbGlvcykNCj4gPj4gLQkJCQkJYnJlYWs7DQo+ID4+IC0JCQl9DQo+
ID4+IC0JCX0NCj4gPj4gLQ0KPiA+PiAtCQlrdmZyZWUoZm9saW9zKTsNCj4gPj4gKwkJcmV0ID0g
dWRtYWJ1Zl9waW5fZm9saW9zKHVidWYsIG1lbWZkLCBsaXN0W2ldLm9mZnNldCwNCj4gPj4gKwkJ
CQkJIGxpc3RbaV0uc2l6ZSk7DQo+ID4+ICAgCQlmcHV0KG1lbWZkKTsNCj4gPj4gLQkJbWVtZmQg
PSBOVUxMOw0KPiA+PiArCQlpZiAocmV0KQ0KPiA+PiArCQkJZ290byBlcnI7DQo+ID4+ICAgCX0N
Cj4gPj4NCj4gPj4gICAJZmxhZ3MgPSBoZWFkLT5mbGFncyAmIFVETUFCVUZfRkxBR1NfQ0xPRVhF
QyA/IE9fQ0xPRVhFQyA6IDA7DQo+ID4+IEBAIC00MzQsOCArNDQ2LDYgQEAgc3RhdGljIGxvbmcg
dWRtYWJ1Zl9jcmVhdGUoc3RydWN0IG1pc2NkZXZpY2UNCj4gPj4gKmRldmljZSwNCj4gPj4gICAJ
cmV0dXJuIHJldDsNCj4gPj4NCj4gPj4gICBlcnI6DQo+ID4+IC0JaWYgKG1lbWZkKQ0KPiA+PiAt
CQlmcHV0KG1lbWZkKTsNCj4gPiBJIHRoaW5rIHRoaXMgbmVlZHMgdG8gc3RheSBiZWNhdXNlIGlm
IHRoZSBzZWFscyBjaGVjayBmYWlscywgdGhlbiB3ZSB3b3VsZCBub3QNCj4gYmUNCj4gPiBkb2lu
ZyBmcHV0KG1lbWZkKS4NCj4gDQo+IFllcywgdGhlcmUgYSBtaXN0YWtlLCBidXQgSSdkIGxpa2Ug
c2V0IGl0IGludG8gaGVyZToNCj4gDQo+ICAgCQlyZXQgPSBjaGVja19tZW1mZF9zZWFscyhtZW1m
ZCk7DQo+ICAgCQlpZiAocmV0IDwgMCkgew0KWW91IHN0aWxsIG5lZWQgYW4gaWYgKG1lbWZkKSBj
aGVjayBoZXJlIGJlY2F1c2UgY2hlY2tfbWVtZmRfc2VhbHMoKSBtaWdodCBkbzoNCiAgICAgICAg
aWYgKCFtZW1mZCkNCiAgICAgICAgICAgICAgICByZXR1cm4gLUVCQURGRDsNCg0KVGhhbmtzLA0K
Vml2ZWsNCg0KPiAJCQlmcHV0KG1lbWZkKTsNCj4gICAJCQlnb3RvIGVycjsNCj4gCQl9DQo+IGR1
ZSB0byBvbmx5IGluIGlubmVyIGxvb2ssIG1lbWZkIGNhbiBnZXQuIGFuZCBtZW1mZCBjaGFuZ2Ug
aW50byBsb29wIHZhci4NCj4gVGhhbmtzDQo+IA0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+IFZpdmVr
DQo+ID4NCj4gPj4gICAJdW5waW5fYWxsX2ZvbGlvcygmdWJ1Zi0+dW5waW5fbGlzdCk7DQo+ID4+
ICAgCWt2ZnJlZSh1YnVmLT5vZmZzZXRzKTsNCj4gPj4gICAJa3ZmcmVlKHVidWYtPmZvbGlvcyk7
DQo+ID4+IC0tDQo+ID4+IDIuNDUuMg0KDQo=
