Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAA1C67D90
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 08:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB8D10E425;
	Tue, 18 Nov 2025 07:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FNSAsPin";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78F510E318
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 07:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763449869; x=1794985869;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ac5FAQw0UUZSR0+QhqXokMpCYxXJnXxzLeafKx08K9E=;
 b=FNSAsPinLuuzZ05Fs1cIayeHi/A42WdG4hpsC/NZPbWscDir7CqPUPUs
 xGCQkKHvU13NakglPDFZwPjtd93+465/OyLhSC9rX3c8EvNZaJWVT6tWc
 mv1WQZXQCtxYb6/iRojg/VfT2XAndenHlR902kLLHCqL72B10TLJGkBC9
 PDcHH73Gxu8neS0abeSyrA68FtCXk7Ke+8ROcw5bMks6i4GWBQKFwNfCZ
 FyArTp7CM6ZcCa0AvAwEKZqgJMyWjLqCt/UaToGxO9wjYqFziYNyOm2+5
 HIyT+Z12nA4OJY9ep4i1w9tZ51AFDnsjEZM2wKUNTnwxsqOiTdrSBmUjJ Q==;
X-CSE-ConnectionGUID: FbAWM7+tQlSPHXGz4hz8Lw==
X-CSE-MsgGUID: Jrv3NipcR0mpFeY4HmaR1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="88113973"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="88113973"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 23:11:08 -0800
X-CSE-ConnectionGUID: JHLj8fDFRyO2yg1jyTN9qg==
X-CSE-MsgGUID: ATJYK7cWTg6Vx/XnTyGflQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="189942573"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 23:11:07 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 23:11:06 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 23:11:06 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 23:11:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIICT8rFi4hrybfQrUc2McrsgL0Ngju3k5vL2rHmYeFk6AEZJu+hdWjbkRtOKFgERTGRcs+1wEbrHQtHFSCSk19Gp+S60TaXjPsGZnq31NaTlrmRHpfHce44quiAxXLS2V+kaUWJeJr+L5jDEHtpVuic+t50bc02bg+E0SV00AJz1w2L+/u9mvdnUZLtx+n7DLXzc2vrLaJm3bE+WUXbnvJo53Kn3EvVBq69SNkxdvfpU/O5CqUt7lJa8xOV/0LaQrRU0iV0+m2K5flr4UqLV/iJ+vWWm9CWLsANdszNDxQde1fFUrVdcGMIxpRbduEjzmSGYac5KRutaSY514kaxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ac5FAQw0UUZSR0+QhqXokMpCYxXJnXxzLeafKx08K9E=;
 b=Cpc/lLCVz50BSTL6JJZ4IUQE0sbG/8AoXIBXoA3ccfgkTI9figwmX7fvtRu92XFAKq/aFhX0U3WWCRkBXGSnJrv70Yi2l3ZIClm2O58vjs1O9BoImmX96jaZvgUNpb45GKiwSFCRyouzSYwWl3dOdN4fLwsFP8dnuEpvrS+6PKADOCzQUUskONNoTKNILGV0JJpj8ks7SYsC97ULNqLHH5/806TZnmANv+eSYRhlkFjDSglCdQ1XLQmmfiOd0eR3YH0xzrA8JLeDP3Zel82g9Hmj3dkJVRiQ2XadNVJiMoJ6rfrKGkGFInuG1AyW7PQec0l5RhosEBlp7pxhIwFXwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CO1PR11MB4980.namprd11.prod.outlook.com (2603:10b6:303:98::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Tue, 18 Nov
 2025 07:10:59 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 07:10:58 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>, "Robin
 Murphy" <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, "Ankit
 Agrawal" <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, "Shameer
 Kolothum" <skolothumtho@nvidia.com>, Alex Williamson <alex@shazbot.org>
CC: Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-hardening@vger.kernel.org"
 <linux-hardening@vger.kernel.org>, "Kasireddy, Vivek"
 <vivek.kasireddy@intel.com>, Alex Mastro <amastro@fb.com>, Nicolin Chen
 <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH v8 07/11] vfio: Export vfio device get and put
 registration helpers
Thread-Topic: [PATCH v8 07/11] vfio: Export vfio device get and put
 registration helpers
Thread-Index: AQHcUvHChFxcVdm3dUei4Y3GBAL1Y7T4Dttw
Date: Tue, 18 Nov 2025 07:10:58 +0000
Message-ID: <BN9PR11MB52764795D6B6405785A2C5228CD6A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-7-fd9aa5df478f@nvidia.com>
In-Reply-To: <20251111-dmabuf-vfio-v8-7-fd9aa5df478f@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|CO1PR11MB4980:EE_
x-ms-office365-filtering-correlation-id: 81d4fa21-5ddb-4175-fa34-08de26719f92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?Nk13aDBzamRCenp5TDNxbFpTSEZZN2NrNFY5ekZXNWNreHZ3Wkd1b2lQVGF3?=
 =?utf-8?B?QmU5T3JiZVFnNEk4TEJKVDdlN0pKVmp6TkxMbkJPOEZSSEJac3ZOdTUwaFNT?=
 =?utf-8?B?TnplbDBwMU8vWm5wZFFveWc4K1cyV2QzREovWGJlQXljZ05nNVRJOUhWZzVy?=
 =?utf-8?B?RFd6QWM5R0pDZk51VjdPN2RGTWJZYXgyY0xPMnRrVXJhWW9FYm5DQkRaM0xY?=
 =?utf-8?B?M01PWHBtcDVuc0NWUUNqWHRSTGZBdXhVRUpGT1dIZEtHUVgwL3hxM2hWWFVh?=
 =?utf-8?B?dkhTOWpjRzdRVG1mOVk5YXpkMEFtM2paZjlEVmc0bEdyNnFMN2IyWmZUcmUv?=
 =?utf-8?B?M2J5TG9FTFFTNTQ2YWhrUUR2MzZ0bFVkeXhCMm9PZkZ6ZTNCTE02aENMWXU4?=
 =?utf-8?B?WVJkaXZQc3ZPZ29QdlRvWkRRRDNOOHpPaWF4Nm8zc1VzaGs1dm5VWlJ4YlhW?=
 =?utf-8?B?ZFhOTitPZ29RdURvTWhzVWFvemc1SEhHd2lXZFVRZE5xaUdicWdQRmRyK2NL?=
 =?utf-8?B?RHhSOURPa3BQa2dMVUk0YTNrTFF1TkhJMHhBVzlTN1N2ZlpmYzRBNjBzNExL?=
 =?utf-8?B?UFlFbHdzbXR4NGhkWGZ2YkpMRjF1MUpBVlNFcnZCSU5TcjZGRUZEWG9jWXV0?=
 =?utf-8?B?UXFqLzZlMjFjL3VTMEZoM3JIWkZzMFF4M3lrVm5ONWJadjFObHFjcVVlOFlj?=
 =?utf-8?B?cDlBa0t6aFBFMjE5cWdEMExmV0RPYm9JMWxUUDdnUkRQZS9EZlg0K0VYWnFo?=
 =?utf-8?B?MmpnL1RiVDhNVWR3eWFCb2lJVDI2ekl5ajBhb0J1NlA1SmpncHZCejhEUHp6?=
 =?utf-8?B?YjFEK0dLSkMwVmRoY0lmZG9wYUZ0Wmx1amJNTHhrZDh5VG5udUkrcGNIZ1p2?=
 =?utf-8?B?RHErZ1VNcUpXamZUa0NXWDZia0M5eEJ6enB6cklZd2JDQjFkbW5Na0tjVG5L?=
 =?utf-8?B?QzRCK2NJbGhmOWpDYm80S0hoNXo0YVd4cmI0eHM4ZHFFN1NmNmZJTjZrZXBS?=
 =?utf-8?B?VklmU0doUzQ2Y0tIemp4QlBxUk02RTdJMGE0d29wVmhrSzdDUUtGTHpGdHQ2?=
 =?utf-8?B?QnRma2J1bUVmVlpZRzl6RElKaHpMc1AvK0wySkdKclM0akVlUTB5Y21nb1N3?=
 =?utf-8?B?RHlHOG9lRWNDUGZieC9xYUx2aTFVbXY2Tms0MDA3RUZMOGNKNGlqME0yUUxM?=
 =?utf-8?B?L3lsRjQxbzhXeiszdStkZWxMeVhmdFR3dzdDRGhZM1hUYXlIbHQrdkZFbEhH?=
 =?utf-8?B?RjNOVk5hZEg2ODB5YnF4dHEzUllMT3EvcXFkM1Z5OGkzd2lONG15MUY2bEtx?=
 =?utf-8?B?R2w4dVdyRHZDZHNNNXFadWlTWVhFTnNia255dHYyenNGbjkreCt0cG1GY3N3?=
 =?utf-8?B?cDYwNXRzamtqcmRJdGF4VFluWm1SMHR3dHc5UkQ0NTRSOXFZam05MWhDeDJC?=
 =?utf-8?B?ckFVRmh0TFJiZWZpamgwWTZhWHpmUnpuekJlbHFSR3NsVjRycFZuQXpMMVBz?=
 =?utf-8?B?cTljRnd4ODhhaWVVVkpUVzFEYThCQlBwcVBJekllNVFEVS9IcUlVWWt2MDI3?=
 =?utf-8?B?anVRcXhsZW5xSHdNUGhQT0RlVnA1MGRzREdxVjJTblk0eG1qTXZHMUI0T1Jh?=
 =?utf-8?B?WGVwVTA4WDUvajZxNFR5Wk5DNnFYcVgxemFlYjVyMjlQRk1lSmNDWWMxYzRT?=
 =?utf-8?B?SU9pdnBXcFY5cU1rdUlOOVdrY0FNSUZYR1BQaDFWSy9SKzVCUStKc1JTMGUx?=
 =?utf-8?B?SDNocWhDSHNiMytmVjh3TURlSlAyenJzZXYrSzJmbEdkS1VrTnZxN05nZTBJ?=
 =?utf-8?B?cWRTYVF4aDBkRXJ4WVhSWFptSjZ6M2pFNFU2bVk1OHk5Ync1V0dUKzFvWDJt?=
 =?utf-8?B?UWpGVTJOWFIyYVU4UEQ3RDNaNlJSeXBWNDNSK284MksxRGEwSlF6Zlk5T25K?=
 =?utf-8?B?UExibFRYaWlsUHBYWlBncGtTcnFhMFloWXpIL0UvSzZKalM3d0NubURvdmY2?=
 =?utf-8?B?cnovS281V2svdC9yUW9aTThHYWZCVWxGMHFOUzFDbXE1Nnp0NU5DNXlPZ05U?=
 =?utf-8?B?TXdBU0F5ZnVlcGRKT0ZBYlJnZkJLTEVsMUtBZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXZpcE9oeTEzTjQxSlgwNHdQY3FQQU5ZMW0yRy9nUEt5WTBVeWZWbC83Wnp0?=
 =?utf-8?B?bzZ4ZnVRRVM2VWpGMzhXakJDTzBwNmFrZVhmZjR1UDNxa25HUGlYZHNqTWtN?=
 =?utf-8?B?MXd1NjNoTkdKTFY0Qm5kRU9zaCt5aTBDN0VOQ3lGeEtRbGI1d2VWVjgreWlR?=
 =?utf-8?B?QUhUVGdwM2hCdlpOYXoyeXlVVTZuUHI3NS9GQ203cU9kbm5tcUpXcXBjL1Vp?=
 =?utf-8?B?N2lvQ3RORUVPbVFUcHFzeW4rclJZdVVmbVRZL1VhOGtDcklTcEdNQWdtQzQv?=
 =?utf-8?B?NmgzWmM4WTd4aEhMMmpJazM4cVR2VjdIUGZYend0WTFybzRpQk9vbEhPWWVN?=
 =?utf-8?B?VE40ZVllZFFBbUt0U0dyT0YyV1o5bVBvTDNKaHFRajFiVno2WGFPVXZkdk9C?=
 =?utf-8?B?MXZzQ1BSc1RIaHFRU0VhUG1mSEYxbW14SjVQYUtzeEhtWW8zdUFwL2xqajZv?=
 =?utf-8?B?bW45cG81dlVhMi9HZkd3cCtRMFk1QnpMK2dQeEo3Ky8yOVVlc0lQTlJuUGda?=
 =?utf-8?B?VUJVS0RBMllwMkY1NjBXa0xQNWQ2c2g2eGFCS3ZDN1FSbHNQWXd0YlU5cEdK?=
 =?utf-8?B?NE9NNVF5Q0RSSElkbFBkaEtVdVF3ZjJPNnV6T2F2eEQra0l4LzRoTDNIT3l6?=
 =?utf-8?B?S1B2OW9HMS8wbVQ3clVHdDY2VEFwUlBxK0RMWTFGbXJnRkdWdUlZbkhOZ2lE?=
 =?utf-8?B?VTZFbjhjbTBtdVVMdExEdWFRSHV5UHNZWnkwMDQwbTVRam9QdDdRSG84eUQv?=
 =?utf-8?B?R1FySmNBQTMvUGd0aTN1ZnYrNG8vOHp1SWp0VlNyaktyVlBQa0tkdFdScXJ0?=
 =?utf-8?B?M1gvN2tUcm1ubEZ0VEpWZWpmVitvdWw4UU5VTTJnb1V6dllILzgvR1pIY0Vy?=
 =?utf-8?B?QWhid3Q1N1ZnZmpqQUJ3UDNodTZ5bWgzdmtnWUFIeVI0dXVvUG5aNUdEWjNW?=
 =?utf-8?B?MlJLbWJnUEJ4bk9tVVZLUXJOVU0vcE11em9BVWVvTENEcW5OUFNpN2RCS25y?=
 =?utf-8?B?aXdKR210RG5ITG9PZ2w0UXN2dnlOOGFWRkw1Z2M2c2taaEMxb04rOGYwL0Fj?=
 =?utf-8?B?d1A2RDhSOEw1MnFaOVBaZE05MVdMb24wcWZNakRGeTZhRGlWNG9Tb0kzNUwx?=
 =?utf-8?B?UG5nVU9IL1BsZmM5Ym1PbzJFMEpzNWpzeUVITW4vbHNvVWY1L2dMYndMT0xO?=
 =?utf-8?B?ZjdQKzZmeHdqQlJKcWs5dU45TWpOZHpEeXI2RHBFL1c4Uk5TZm51dFJNQ1Bz?=
 =?utf-8?B?VTNQZDBJbjV2UnNvakxaVVMzMGhnSEcxakJLMmUxRUkxV3dJbk5vb0N2dHUy?=
 =?utf-8?B?eGtGc0ZiMUxIK1NLRW0rZnpVejVlUE1aMjRzVVM5UUx3WFBhSEtXZ3c3dHUw?=
 =?utf-8?B?THhsQzZ3UUxSNWJhekVTdzN3bmZlQ2dXcnpsRmp6SlhQNWxES3BGdlBkUzdr?=
 =?utf-8?B?Q2p6ZElPbDI0akYydWZJdEpISHZmakpNZ3lYZ3hDdWdwRkYxZHRJcmw5R1Jk?=
 =?utf-8?B?RDNzbjFVMUt3QUJraTkrQWRYeDB6NmI4dEdzV2o0VnpHSXpTR0NodFc0Ujho?=
 =?utf-8?B?YUZheGxEZTdWTUhPKzNEV04zYjhrM0JHdUpIUnBJNjhlRDB3UDg4RSthb2JP?=
 =?utf-8?B?c1dDQjBqNy9QVmNaVkdKeUxMYmp5blVYNWNMemlXYmcxeWc0WlNqVGdsYVg5?=
 =?utf-8?B?YjlSd3R4RnNRYVdhVi9LaGxpZGZKU21KdnNJRFA2UVI3QVFPWVR2K1NIS3lJ?=
 =?utf-8?B?NEpzOW5NRkZwSm52eFZSUXJWMHRFMFFCeWhpKzUzT0tmekdvSHBPdkY0STVD?=
 =?utf-8?B?OXdkRTBHc1c2a09rQjNyd3FpMUJRVWl6aFlZcWk0N2x4MDduUENCbjNBUDN2?=
 =?utf-8?B?cExlT016Wm03YkN3U3kxVkZ2Smk0aXZNY3VZRmsrY2lQa2dFUjBmVFJ5NXUy?=
 =?utf-8?B?b1FZd0xxWVNVdTdudURaK1FieTA4MEp4VTF0RDNiVE1FWWhRSXY5akw5Z0dv?=
 =?utf-8?B?U1BHQlk3QlFHN3RQcUlEaFFmcXFJVGJ0b0xCRDZ3TGJCOG1UanVWOFVkMmNm?=
 =?utf-8?B?MHNrRFJOZlo5R2hHM052V1E4aExGT01oU0YwNG9lOHd5NDZjU2VnR05jWHRt?=
 =?utf-8?Q?yy8JRwwA20VFhlqHLNjvfbYMw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d4fa21-5ddb-4175-fa34-08de26719f92
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 07:10:58.3170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BrWwLupX4PhjxI0esTDIAxUvxtCvwE7yW9IPml9Kt5g8VyXnzlPVjy13mt+IyrEdoLRW2bAPM6vWng+lG3hKrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4980
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

PiBGcm9tOiBMZW9uIFJvbWFub3Zza3kgPGxlb25Aa2VybmVsLm9yZz4NCj4gU2VudDogVHVlc2Rh
eSwgTm92ZW1iZXIgMTEsIDIwMjUgNTo1OCBQTQ0KPiANCj4gRnJvbTogVml2ZWsgS2FzaXJlZGR5
IDx2aXZlay5rYXNpcmVkZHlAaW50ZWwuY29tPg0KPiANCj4gVGhlc2UgaGVscGVycyBhcmUgdXNl
ZnVsIGZvciBtYW5hZ2luZyBhZGRpdGlvbmFsIHJlZmVyZW5jZXMgdGFrZW4NCj4gb24gdGhlIGRl
dmljZSBmcm9tIG90aGVyIGFzc29jaWF0ZWQgVkZJTyBtb2R1bGVzLg0KPiANCj4gT3JpZ2luYWwt
cGF0Y2gtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG52aWRpYS5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IFZpdmVrIEthc2lyZWRkeSA8dml2ZWsua2FzaXJlZGR5QGludGVsLmNvbT4NCj4gVGVzdGVk
LWJ5OiBBbGV4IE1hc3RybyA8YW1hc3Ryb0BmYi5jb20+DQo+IFRlc3RlZC1ieTogTmljb2xpbiBD
aGVuIDxuaWNvbGluY0BudmlkaWEuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBMZW9uIFJvbWFub3Zz
a3kgPGxlb25yb0BudmlkaWEuY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4u
dGlhbkBpbnRlbC5jb20+DQo=
