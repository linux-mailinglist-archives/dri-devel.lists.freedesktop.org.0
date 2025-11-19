Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 777FEC6CD5A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 06:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF1F10E223;
	Wed, 19 Nov 2025 05:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fyVzbFuj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F2910E223
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 05:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763531704; x=1795067704;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mc2Di4oMmOQY47KYu6FsJ2OeDXsYcJHK9ZeZwQFTodg=;
 b=fyVzbFujG1cYHL9Ny3PQxys7TyfT9O3L7i31xhiLVCaWNIW5I/e2etLy
 djVhHaxZWK+POzja9cX2Zs+LsNRXD1KFUGF1BfLM5gVhwEPgLwwHms0Hi
 uo/oCWjvrl8D3pwQvtNnZ/5FeFigqRRYXY6rdwkKwqs0SCBEWburLwc3B
 ejK9YMq3VlSaqWG03/VBlOozugrL4vHoG/Pm0TcJmAug2HcPou0MwYQw6
 nFfXW23aHU2ucIHA8IrUovVN7Wx3HD8N0fWDp5WSIOlKLXs5hyPmycN8d
 g/lc5v8yp8xNDG8TWNA0XTXl72bFzh5MC641p2qUp2rAA/fxd1pwVuDAL g==;
X-CSE-ConnectionGUID: 3JkRtDNZTXyij4r3lPJJgw==
X-CSE-MsgGUID: ONTFDDdFSv+1YAjn6RINuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76919413"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="76919413"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 21:55:03 -0800
X-CSE-ConnectionGUID: 0Avh8OPxSKaOe+hs1Qh2eA==
X-CSE-MsgGUID: vIVwUAdtTyCvq+w5HD8P5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="195896084"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 21:55:03 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 21:55:02 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 21:55:02 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 21:55:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/JiFCyDn8XuxrHH9+CxoTBaE0ZWEiJnQQsPZqUGwZaenwtQIc6G6m6craJJ8otiL/mtUA+NnKpxFsnPAhHTDw0Hz0aPfQB0yWmGXL7XvIBakvL6IBHRYbOodBsSaWs5wQOdTiwzmTRJGzG4dUDwCmDWDh8lgLeEgs9EFCsOlyjSzDZgpX4z67J/DbbTHbR+7mGlMeM92WOXTQJO1h0o7e6RVDuKUpe2jT5TdbZYVYZmVgLlkZK6OOEkYOUmNkd/OKxmbI0g1Onr/n4tj9siyTUOdhHPktGqFBZ1D90TIGlyM8srpySKJ/tOSHA4Al8CxrlD8/gj5haA8IWQGC/QMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mc2Di4oMmOQY47KYu6FsJ2OeDXsYcJHK9ZeZwQFTodg=;
 b=MeLwN2h60+59/k89djnpbJs5/RpJElXd3eNZzllBjmnRWflD1OZ5QFuXseql+mFqulfoIf5u2fX5E4CHtMbTfSejN64oa8Xhjr6FsWsRrCQLZ+1EWOVDbXL7y7lL94X/7vE009+riaSfYT/DgQsUNpvho8vrbHciAvUsskLi2Eywvs4ANoe4LdSdDHzbYXY2eFfg6u+7ruf95fnPaD0BO3U6Cp2IFoA2+sXIpdAsnrV0iakfBua/9G4/CBZ0hHW44FiL919NvFVQ2Ld2djVBlxYT/tm4iTv584UtrJTR+oNww1xXgvtiVV9tEw9z0B4FAU4vuY0j1p9wANyQWejmKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SA1PR11MB8396.namprd11.prod.outlook.com (2603:10b6:806:38d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 05:54:56 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 05:54:55 +0000
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
 <linux-hardening@vger.kernel.org>, Alex Mastro <amastro@fb.com>, Nicolin Chen
 <nicolinc@nvidia.com>
Subject: RE: [PATCH v8 06/11] dma-buf: provide phys_vec to scatter-gather
 mapping routine
Thread-Topic: [PATCH v8 06/11] dma-buf: provide phys_vec to scatter-gather
 mapping routine
Thread-Index: AQHcUvHAmZR7cSLLK0i0H/eU4WfhbbT5i5Tg
Date: Wed, 19 Nov 2025 05:54:55 +0000
Message-ID: <BN9PR11MB5276BC3C0BDA85F0259A35058CD7A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
In-Reply-To: <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SA1PR11MB8396:EE_
x-ms-office365-filtering-correlation-id: 53c5e5c2-0c60-4c59-8640-08de27302a7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?ckVlV05BOWtGb3JIS1drbGJScEw3Y0tEOXpWR2VPMjh0TWNRT1I3Mm5JNTlr?=
 =?utf-8?B?Nkw1TUx1WnlGNjhKZ2pMT0tqMGpYeDN4SFFWdTFram9EODNlZ0FYemdYSGty?=
 =?utf-8?B?eWZEc3RkMUtTenp0VDJ5anhRdVkzZ09SelZnbUQ2OXZmSnJlckVlSG8xNFN6?=
 =?utf-8?B?YXl3amFQSm1hYURtZ3NjTExZZEtNZHZIdmdVdkR3bjk2cnRUMDNKbDA0MGZr?=
 =?utf-8?B?WDNkVTd1NE96Wi82RzRqdlZLV3ZnTGg3ZjFGTEtMMU5ibE10SGQ5RDJnbS9L?=
 =?utf-8?B?a0tiVzhnc1p3ODhJZVNZbDErTnhnUnVITWxNaEZhRTAzSmNVd25kZUNDVWNC?=
 =?utf-8?B?NUhOWGVLTWlNTUUxbldod1p1NGNoMWR1NmxiZEtuQ0o3SkZ5VDVRaXloUnRo?=
 =?utf-8?B?eGFIRHlnc1hxZFQ1eE1BYjd2a2kydHdHV0UyMUJFdjdSVDBkMm41N0Q2R2pm?=
 =?utf-8?B?OTRHaHF0bWMvRm1JYjVvMWoyWnZNNHVJSlovaWdKckpoQm5Nd2I2cXBEamZr?=
 =?utf-8?B?Q2RsNVNidkhibE1ZNTdJNW1rWWZPWW5PK0lDOFRTejJhaFpVMHJpcmxHbHF5?=
 =?utf-8?B?QmNnUVI5dHNUanRQQUp5dzF5TXBaRzNBS3QxU2JsRi9iN2tOM0tZOHpJaTlG?=
 =?utf-8?B?TGlXNVB5NitxZXQwVWhTSVVJeFhib2RBRUp0aEo0M2liQzIyZ2VXSS9yazBO?=
 =?utf-8?B?WUhoWmVEYUwvVE5oYmJOUEk5WGFNWEE2ayttbjRxTFV4eXRuTlNtb1lFSGtB?=
 =?utf-8?B?bVJITk5jaWttYXZkckxlNXY5VXhsenkzZHQ5Q3F3elVGdUlDNmVyM2NIS3N6?=
 =?utf-8?B?RHBnODdTQjFWYTd5MHhPVGhGOE10ZlhzMHR1NTBNbnFoMmI4dDRhYUtBdFZU?=
 =?utf-8?B?MjQ1cG9wcVZxcmZvVjJJYzZHUDloUktya0dvTHJXRkxsL28ybmZwWVEyZ2NZ?=
 =?utf-8?B?KzlkdzZSekpkeG91VnZKeGU5SXNvN2ozVTZZdWJ6cDJqQ3ZXRStKcVZvQzcv?=
 =?utf-8?B?MVRXd01UejAvdzJUdUs0WDgvL2d0OWN0OVREVm5XbWljTGVkSEF5dnlSZ1ll?=
 =?utf-8?B?MWY3K2pHSVE4STJvb1BRVnlvcFhRN0YrYmxjaFV6SXpHNDdTL01xTlhLMFR6?=
 =?utf-8?B?bTU5OTNmblh6eXl2MUwwSURVMHhNKzV0OVhGcm5MSUptSVo2NlptQks4WEph?=
 =?utf-8?B?MlJjQ25lTXFheDRDQzY3bURodFJxanZaaGRuU1lvUzB6ME1mbGlYazdWSVQ4?=
 =?utf-8?B?RXpOUEJFNUpxUVE5a0JmM3ZVZDVyU0JybkdiTWs4L0FOYndSa2dQcXdiZ3VP?=
 =?utf-8?B?SHhQUUY3SWxwVzVtZmpkRFhsUjNjZG52QjF2K2JLbGRDL1NMOVlYNWgwV01s?=
 =?utf-8?B?YU1yeWt4SWF6Y01jR1FCQ2tBWlUycXNyZ1VMdm12dFdWWmt0MnFvSmU2WEtM?=
 =?utf-8?B?Zyt6M3dldmVNSmJMblNCc3EwU2R3LzR6RGRtRWJxd3pIOUV3UG42SThIMHo1?=
 =?utf-8?B?ZGtJL1hTV2RHZzB4ZFpFM2laQWx0aTFCKzIrK1JPbmNVTlFkOUl6aVZ5MklL?=
 =?utf-8?B?bjh5WkhQWGNVWWlCSGJCWTFEVUQ3akhZTVIxNHI0Z053ZXNUdm9VN3E1bEZa?=
 =?utf-8?B?Y0JPZEUrc215T1BKVkNaTklIdDYvRGZsMVdqQ05DL08zSFVtMmcxNm1ORytM?=
 =?utf-8?B?UnpQZkdka0ptOFU4TFlaU1IwTzFmN3FKMDJDc2dpMHpVLzBRdXFiQ0NvMExL?=
 =?utf-8?B?SGJWUnhmMktkR0xGdFU0bXVpVTF0bHNGeXdBbW1lbGN5OFRMd21wOEh5MzN1?=
 =?utf-8?B?ZXBzeEJzbS83blVLbWdsQjlvcnVYd1EyUXFEL3dtUVlRNEF1UEVOZzlvbzJs?=
 =?utf-8?B?Uk94WXdPYkhzdCtoSTJ2OU9Lckt6SWU0aFQ4U1IzaVZIS1BUdWE3aytRU3hk?=
 =?utf-8?B?VnNSUmNFY2NhY1ZEVEpMWjVNL21DVUwwalBIK3Jpblo5M3RrMUpwUUg0UXMw?=
 =?utf-8?B?ZWpuTGtiQkJVZXpXajlwendHRlZQR2k0eGtJWWtPSUxCWm5UR2IwRXRGMGln?=
 =?utf-8?B?N0hjcVRYSzhDZ1RNTW91ZDQzcVcycE10aHU5Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vis5U0NHTmtzN2IwaDU1SnhPaWF3TmkrR3I0YWdOVG9mdzM3QTNCT2hjUkpu?=
 =?utf-8?B?TGlFdEwvaXJvdzBHZXBBUElJNUlRRUpxVVZIck5oSDlPUGtwc2crN2h3QVdH?=
 =?utf-8?B?Y2dJSHNiakJjQWh5R1cwckRpZ0YzY1hyOFBpemY4MG1tVG9WY3VpS2J6MXR4?=
 =?utf-8?B?UkRjdWtVc1ZpbmNPSW5QeW1QeC9wd0tWdHVmc1Z6QjNBUTZxcFl1SU5xYXI2?=
 =?utf-8?B?NDV4ZzlmeG1KNFVnUXZUU05BbjBNRTJYYTBleDZ3NjROVkFTdmZ2RTluQ255?=
 =?utf-8?B?Rjc1T2NRTGR5OGZFU0xoc0hJcEh1anZLa05uNGZrR0R3RFlQaW9ZM01iZGc3?=
 =?utf-8?B?QnE3N2s5L3FSVFA0UDJ4OWlZNHpSWWdZa3VvWXpHT1BFR3o0YWpha1hBekhl?=
 =?utf-8?B?a3pGTXVrUExsa21neWpTZUZNR0wvZENUOEk0SjJBemVja1ZhNFZKeCtKN1Ft?=
 =?utf-8?B?elhvM05TRjl6SVFYR2NXWG92NktRbUgzOXowWDAzM2lEdTZWclVlbHkvV0lE?=
 =?utf-8?B?djh4TUdaSVU1dlJlUWVFSUtRMEwzTWhGdVBDR0ZTVk5zb1lMK2FOQ0w4eGtx?=
 =?utf-8?B?K0h3d0ZZZWNJZDczZGR6blJZcnZPSjY0MzNEOEJXeDkvR2E2TC83TEltTE5i?=
 =?utf-8?B?elR5bWFqL2ZZeEtmSlowQ0xTQ2xUcDVFVncyN3Bac01RaVNLNmJrSEVrTHVX?=
 =?utf-8?B?eFBpUi80UXdxWEpJakV5QWllU1pNUTlmVzN3ajM5Zk5FVnFtcTJFSUZsWDhV?=
 =?utf-8?B?WnZLMElpS2VzRmJ4S21BT1ByZDdRcEVCMW5sRWtpTFpvUGNtTUR4YlF5cHJO?=
 =?utf-8?B?WFdlMnhGdUtPY3RFYTFGdCtjT24xL2ZBWXpRV29yZDlSNHlxWEZ1KzczUGZl?=
 =?utf-8?B?THJjV0FoOGRnRmxGbzRpWTJVSng3NzBVUEhWcnlJSjlnTm0rRkZ4MkJjMURa?=
 =?utf-8?B?Mk9tY0VFUFhPWHVEQzZUWWNTU1JVV21NQkk1VDJreGxndjNlRUhKMVN5UjdD?=
 =?utf-8?B?RWViL0NTY3VCMDJrdjdLa3lLT2xBdXFWQXc2WmNXemQ5MitmanU0QVlqSzht?=
 =?utf-8?B?RGdtV2VQYXBEcVpGWlpMQlVKWkJaSW44M0d0clhmUGNmTHNXSEtORm14UkNi?=
 =?utf-8?B?ZkkrbmFTQ1lzYUQwVHBwdG10OHNjTE1uTDZQTVZscm9GekYzZGZSWkpmNmc3?=
 =?utf-8?B?NVhaL3VjQk0rWlpQOTM0dVFjbXJqd3JnVWR0TjZ6TFk4ZHJtS2NidENTb0d1?=
 =?utf-8?B?RkdNakkvSm9KZ1E3a1FtNEY4NEdDSmFaL3pjZU8zK1FkMUpCWUFUcUo1UFho?=
 =?utf-8?B?aVRlbzlTaklLZWh4NVpGdjVxUzNieFVqajRnd3VjR1dpMjNrVzc0TVhGNElZ?=
 =?utf-8?B?c0Q3ME5CSkY2aWxmZE9VYkwyaGV3M0RPMEU5OUplbWgxaDF2QmUwa3d5cTZn?=
 =?utf-8?B?MTZsMXc4ZHozWG4xQ0d4RVI2Wi80K1JOWnhpYXRyRWdqWmIzVm5sYm5VdEh4?=
 =?utf-8?B?SjUxeDRSdVVuWklhOWhYTnZhS0VSTjM5NG1PWDdiSm8xVzlINkhRVGhTOGxa?=
 =?utf-8?B?UUdJWUdCK1B4UlVBQmJSL0lIRjRqbXB3Y2NzWFk0bHdiQXdBMk54ekFpUVRS?=
 =?utf-8?B?YXhtcUljcytCWVJERXcwZTJRNUdzWEErZlBRTWg2NHBaSm1TMklIWVM3VkZ0?=
 =?utf-8?B?YXhaSklkbEVVWGJlbnorT0N5SWtGVlU5TzJiSElXc21KQk8yb3VHSWVrSUlx?=
 =?utf-8?B?SmdxTEhXYkhKN3FMbFYySVVFN1pTb05TY0FxbG12SkliNjRzbG1Rd2VxRXhk?=
 =?utf-8?B?VDI5N3UvSTR0ajJOZGNlK2pQbkNUTXYzeEppeDhaVERQT3NJS1pHMVhRbDNU?=
 =?utf-8?B?ZFE0KzhtczZCWDh0WlFUZHhhQ1VwZnBqNWlpUE5CcWVVS0VKNldpamFBc1I5?=
 =?utf-8?B?ckJ1NEJKeFErRit5MHVqcjNsVTNwYzJtK3RUd0JTYktoZ0FsL2FMRlR1azZn?=
 =?utf-8?B?MTFXKzFQaTdDZGpaUTdydkk0YmsrTlJ0RjhNNWRqNmxCK3lHVUZaaDJnbUw3?=
 =?utf-8?B?amJMYzBaQ3JUTTBQYU10QnpKVnFuNkRjbWVBR1YyTDR1ZTJVeXdtQ2xCU1lD?=
 =?utf-8?Q?lQtK0ChjOt2mQyWevNQtrjMly?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c5e5c2-0c60-4c59-8640-08de27302a7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 05:54:55.7754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2IMEmUT8hzYzurY7xNqS6pMLdAv3qfMhT4wlSufcdjX9N0DmhUX4l3FmRMRDi8lXKu8vc7XbKL2kQaqr8XaSnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8396
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
eSwgTm92ZW1iZXIgMTEsIDIwMjUgNTo1OCBQTQ0KPiArDQo+ICsJaWYgKGRtYS0+c3RhdGUgJiYg
ZG1hX3VzZV9pb3ZhKGRtYS0+c3RhdGUpKSB7DQo+ICsJCVdBUk5fT05fT05DRShtYXBwZWRfbGVu
ICE9IHNpemUpOw0KDQp0aGVuICJnb3RvIGVycl91bm1hcF9kbWEiLg0KDQpSZXZpZXdlZC1ieTog
S2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo=
