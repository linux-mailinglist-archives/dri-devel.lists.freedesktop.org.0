Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8CBC68164
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 08:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB84210E41A;
	Tue, 18 Nov 2025 07:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bNJKSooc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9232A10E41F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 07:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763452735; x=1794988735;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xJF3yfBpgy0l/FZ6Tkz7WvP1ElCGYA9OtgnFLJcz5oU=;
 b=bNJKSoocar2s3ez6oM9QAUeKxYaCR+mhPb2mAvaHXUUiHdnADrKzmULN
 zV8dbDn9MiYPAhRir1aWV/RJOKmEgIMMXiGkr0kb5fLvo8cZxP6R3/D1m
 wg2amr2DgzhhkrwcgsKLDgjEboFsIzHVpWICIJgQcQDI+sckB9zbSKcti
 998zFf13LfTFXVWVwhQEmwrqmfHT5D/FIfebjo22VyMFZo5hnm6BmprAl
 Q+PpoPvMM8nZb5ofp2QTubPH3GA89dlPSTFVEpp3plEPdKAJ9hAtvG3Zf
 2eGRwzQEc+rslPt686/P0xHeovOSXW1KLs41SYSx/Stt8LTvfD7LPB/7F g==;
X-CSE-ConnectionGUID: euX3+xmrSp6b05ts9JDHtg==
X-CSE-MsgGUID: 0XhTRjVEQyaCeEWJFRS42Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="75785597"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="75785597"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 23:18:40 -0800
X-CSE-ConnectionGUID: xGaBIZGFRO+a2Zhb8va3sQ==
X-CSE-MsgGUID: 4aNdRzC3SKCeH4bKDxzvEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190843397"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 23:18:40 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 23:18:39 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 23:18:39 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 23:18:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBgWJVjcb6F3LukXSxLHA5vqFdSPQwqo2scucBl6UfbhbCBOKTPxhU61ovpN0g89OcVYBVgyKjNwp8VpXl4wefB5txvn5cNYjSqpqKrGr3DHK92KCbrklE322Bwp+MFz5B/FAeFrUq0d2uzgKHv4XOtaF638hZm0rlG54KgQakXufFc1Un+KV/13GJ8ydtZ6mgmMRW+fGLcNFqABzAgEbA9nt+koGZxg4hLIZ04dRt+p5+hbhB/rKw1IWpxaZ+pukeCeHpPLlT48a2nNzfdsDbhH0smePHxizou2Xl5eXP1dv7Ny2HKPnbs2kjedmnIlnBtdNm8WekUlvTXKXOhPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJF3yfBpgy0l/FZ6Tkz7WvP1ElCGYA9OtgnFLJcz5oU=;
 b=E6k10upV983ScXUmgSaoJmr78fznSSXRZXFZQg6f6P22Me5Al5+PzKsh4lPyAmMooJtKQrvDEjvQ4vX2U2OjP2li1xootFlJ136WZW+/pmMuEXEVEK6OWPHzb/LPuTquH3Q8Vv2EU6HdHud1CUBrdFVhhEhOrYF0HU2S1LJ+NO+mKjYr5szfNoG/CKHYd87cf7WVfC4gkMLD98/QPN5pVkIKVrrlLr+xdu86o6wBa3PvXdEbKrXG/MVqD4QVZ5715Muf0VO093IAN4WMs3+idlUVSDSP/9uh0Y3pdqGb+MPtFXEs65ZS37+SwOdY7OqozmE1Y30SQIGWSmdqyntoWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CO1PR11MB4980.namprd11.prod.outlook.com (2603:10b6:303:98::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Tue, 18 Nov
 2025 07:18:37 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 07:18:37 +0000
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
Subject: RE: [PATCH v8 09/11] vfio/pci: Enable peer-to-peer DMA transactions
 by default
Thread-Topic: [PATCH v8 09/11] vfio/pci: Enable peer-to-peer DMA transactions
 by default
Thread-Index: AQHcUvHIktoMrvUl+keVP/eL057qqrT4D0Pw
Date: Tue, 18 Nov 2025 07:18:36 +0000
Message-ID: <BN9PR11MB52767F78317AF3AB94A5B7D38CD6A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-9-fd9aa5df478f@nvidia.com>
In-Reply-To: <20251111-dmabuf-vfio-v8-9-fd9aa5df478f@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|CO1PR11MB4980:EE_
x-ms-office365-filtering-correlation-id: 90a93a6a-4ac4-4163-5c9d-08de2672b0fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?NFhHYWhwUFpyaWllUFNFUHFJUFpzRGxvRU5abkRDNW9MZlh1RXVWSFVFb0lq?=
 =?utf-8?B?ZjBydmJ6aDlwZWw3NzdkaGV0S3F1VmR4Zyt6eW5tcVFNRjdETnh2bzE0Mk5B?=
 =?utf-8?B?YW9DcjJsYXNxRGNjNVlqVzlUQmEvWXhhR1F4NDVjQzFCbUZCL2xFelk4dHRi?=
 =?utf-8?B?dE1LZlN4NjlMVUZ0MFhBNkZIN0crRlRXdlI4QlZLNFFDZU85UzVYQnNFdVl1?=
 =?utf-8?B?MmtqVWNMQmt5elYrT2FsNUxUMmVRYVZWK1BuRVNyU0RnSHR2NzIvd2ZsQTU5?=
 =?utf-8?B?d0ttcE5GMkI1Z1pvKzR3Q2RoaU9qOEVhVjlPMHZ5djdWRjFBd2JaTVVTNmFS?=
 =?utf-8?B?YjRJRHA0UGpuZ0dpWW1NeXhBcFZkTkxma2l1R1ZLRWxHbXNwWVBWd0UzZi9V?=
 =?utf-8?B?MGRiamVvdW1KQzY1Y2pvNERoeFprWEN4TllaZzhzQmRON2FiQk5Fb2hwd3lx?=
 =?utf-8?B?Zy9saUJEMHhpaktHTjNNTzNBOHJpZU5ONFRjR2ZXYVJkSXNySTd5VTRLbW12?=
 =?utf-8?B?SUlYU0N0dFZQWDcrTnBpazFzbVIrV3FRYXpoWHhod21UYkdTb1NYV05SamQw?=
 =?utf-8?B?bDJKRzNNOWROb3FjSmVqT2pHN29NMTFCV3gzdExaZ29kZEx5RnhvbGlsdHhU?=
 =?utf-8?B?NEVobFFRc1VyYzRya21zVE5qck1pNGhoOW5HUDRHa3FyNWRIbmFWWjJLMGQv?=
 =?utf-8?B?SVdBaHFoQXlLMm1FZ3VFa0w1SXhMbVBiQTZzS1doWWVjY1k0cGIyUWFaSDBN?=
 =?utf-8?B?ZWFsV3lmTC80M3FvaUsxQ1hPUEhHSitBYUdzZTBoNVh6TG9uajlvNmpqN0Mx?=
 =?utf-8?B?OGFOd3lEa0huWUR2azA1bjd1bFhxM2h1Z0d4MW1uS05rNElOeUdaZEcrTGVz?=
 =?utf-8?B?Ujc2aThxcG9GZVlLNkkyUE93UG8yK0Z3KzFRYWVkRzlzUmdhWWZPWUxKVWRG?=
 =?utf-8?B?ak9sS1dtWU1vWWszYjc3WXFEdHhGVW1KZHBDa2IxL29mZjFWWlMwT29NdWR1?=
 =?utf-8?B?SVA3ajBRNmhVYzRKSFhRSzMvd3ROcVp5YnNxd2NkREFXcUJiQmdaRCsvdUY1?=
 =?utf-8?B?Wk13ZmFoMjRKTyt2dXBrcFhWUUpyUkhzN1M3eDhUdUNJSi80RllybXNRSDhz?=
 =?utf-8?B?MjlXVzl1VFFKY2owMDRyb2pyNFVaWFVuTFZBQzNxOXVLNXNITnJPVzRZOXp5?=
 =?utf-8?B?YXUyUjVnN1JKZ29GaFNQdlE0SDhNK2NIaFA2bXBFQUlrWVZHUEQ3TGMwTUFI?=
 =?utf-8?B?K2ZFNzZpMDZJenFtK0xzbDk4UEZOVDkxSTllYUhIK0NuZ29DNFZiSitmQ0Fp?=
 =?utf-8?B?MCtnNjV3U1dycUtVaXZEN0xuazgrSW16M1F1K0ZqSFZpNEZ0TFBqTENDWFF4?=
 =?utf-8?B?a0NEZXVKbUZ3MS9yOFRXa2xNZE1Hakora3pIZjdwTGI1WWlxbThRYnFWZWFz?=
 =?utf-8?B?TG54SHdVYkhWeWx4c1VYQU5OcUhpYVVBQ21hdGw1SWY3dEprL042SG41KzFE?=
 =?utf-8?B?Y3FXVGswSkVnbkNjQWptTGFSeUVpZlBDRE9tZVlaWTFLTnRzNXg4S0dvQ1pw?=
 =?utf-8?B?a2RMc3A3WWNDNWxJNGVncDNNejMwL1hnVklidlNFTUM5eU5BNlo0YTQ5ak5z?=
 =?utf-8?B?WVYzaG5VY25xTWw1bVhpM1FDbjFBUVAxTG5maDYyemhsUkcybzhuNWJIOHpu?=
 =?utf-8?B?RXZrZ2IwNTJBUWxNKzJXRkR2dzBtRmw4MXZRNHJlUzJoYkRpME41ZEdKaEs0?=
 =?utf-8?B?ZXg2Zkdic3Vlek53cGphSFhJY2JSVGdSSk5JY05TamdLdzkzU1pSS1Z5TG5F?=
 =?utf-8?B?VUxLa3c4TGxRTVFsejhndWZtZ0xmTmFtSTNoMUNibHZmVzdhdTM4bURrZXdF?=
 =?utf-8?B?SE1tYy9aNXJaNWlDWlNUYVNsN0o1enF2dHAwMU9RRHpSSDZMVTJnY1lRdFFn?=
 =?utf-8?B?eHV5V013bHBycFd5QStDNTFCektzdzVtK0ZWNDN3OUJRTmJsY3pnU3FPSE5L?=
 =?utf-8?B?MVhtR2xnMzA3K2hjNTFFNGl2SllVZjBuUDl0Q3czRmRxYlo5Mm05RU1NNFFC?=
 =?utf-8?B?SXlEVVo3RTJtZVBZaXIzVmNjT2RqdGU5SmRDdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXdtUWIvTEs3Z3NmUXdhdDI4SWZxb0hzQ3ZGZjVyWlNrNjRkOGFtVWd1Zkpp?=
 =?utf-8?B?WnA1V1B4aUIzaGNXaE9vTGlMK2h4aGhER20wcS95WlI1WHJ3aE1OUExvdFJ5?=
 =?utf-8?B?V25NNHlMc3g0VEw2ck45QlFXdm14VG8rNm5QenV4Z2l2VmFjQ3VXVk45ZG1E?=
 =?utf-8?B?SjRhRVBsQksrc0l5S2lsUXF0YThja29wdlEyYlYyM2VhZlM4M0RHV244Mm1M?=
 =?utf-8?B?eWhqZFNCcDI0eUx3SU9vcERSb25rUmZzM01rVEVWMFB3WXJoV1NXUWh1cFk1?=
 =?utf-8?B?SkoveHZmRHpZN0t3aTAycThUQUFoQTlNbUw4MThDdkEvOXRGNXF0QjZ5Umo5?=
 =?utf-8?B?VVQ1L08rdjJuT0dyaFFEcW1jbkRtdXVjN1BOUEdoWnMycmtrbG53cU12eFEw?=
 =?utf-8?B?MWZGTDJjaXRYWUM0VUx4ZThIQjZjM1hkcjI3R2ZMMWlsMllOUjh0b3ErcGZl?=
 =?utf-8?B?MjZKYnJpQXNwWDdnRWVFSGZwQXg1Mk1Ud3B3eWZlMjhHblY1bHN0bXQ0RGJZ?=
 =?utf-8?B?M3Vac0FuZjR0elEyWko5ellHQkkrbXZESnM4eUtrU09OK1RSQVFrWTJ1ODc0?=
 =?utf-8?B?RzdZUU83V0xqODZLSll0Z3BlT3p6UG40VVZZZ1paUnF1QjlUdFZhSXplcjRO?=
 =?utf-8?B?bllsdGNVOG82TmNuV0QwdTM1U1ErMmZSbzEwYmFEZkswSzErZnRQZVMySWZw?=
 =?utf-8?B?N2lJeVpBY2EwdG5EdlFkRGZRdHNDTjVvNGlQYTRSWkJucEN4UTdBNXd5SWlj?=
 =?utf-8?B?dWk1UXBiNnd2cUdua0poclI5bEVPVmliVE1sVnN5WlYzdmNlb0k0d1BuVFM4?=
 =?utf-8?B?eUZaM3l4UEY4ZGFVNzduSkMvSU5LN1Z3SW16NXEzTXV3ZWcxajNjOFZhNlpr?=
 =?utf-8?B?T2RHUm1MU2taeWI2VjBNV1paNWVVWGZLYy8rM0kyU3crWUliVWNnN3AxYzZQ?=
 =?utf-8?B?NUREOTZwS2lnTjZaUzQydytQZ3BhcFpkWndDeUU3blF3MFh2YjFJWGVWbkNE?=
 =?utf-8?B?cXJvY29jL0ZYSjVxcW5SZXNRWlJnSE9kQlhMbVhtdnQ4VmtYUXF5R09BcTFP?=
 =?utf-8?B?eXRLZk1FRys4NVlxYTJDSTFieWJHU0RYRkVMR1RnbWJBYU81OXk0MTRmTDhU?=
 =?utf-8?B?RjFQZ1JiSFZaWDlqMjJ5UkcwTXprYU1CMURVaGNGR0FDeVVtUDUrVEd5NWR3?=
 =?utf-8?B?ZTJyMm50V2dRME44NWkxN0w3Q1RCS0RQS2dWMDZjQzUvUUdhbUlzTCt2TDVX?=
 =?utf-8?B?MXFwNExQS0FTQlBWejMzcGJpMVFWR2U1Mnc5UjA0UkxiS04rK0gxdTQ4K2Qy?=
 =?utf-8?B?QmlyckdxV0c3UHVpS1BUdk9hT3dnVXdpS2xCYnNoSW5jM1d5Y0tXM0JsREdS?=
 =?utf-8?B?alc1dFJRcU5NakVDcS9tSkl5bWdJOWpza1krWVpiOEU1WkNwcHdxYTYvRlBL?=
 =?utf-8?B?RjVXMUY4K0F4ODExWU8ySlI1aHFnOTJLcG9ZUXNLSEl1NWMzemlyU3k0Qzhv?=
 =?utf-8?B?eHR1a0ZHVHdRS1JwdUtYUStRZWtTT3EzM2tWdHU3MUtBWmJLZmVPNXFidWwz?=
 =?utf-8?B?cENNMTA4Y2ZVWFEzNml3S1VLRTVQWW9BN0RMSTZiVXU1SCtOUEprWW10TW1L?=
 =?utf-8?B?UDI1VkIzN0N3SVB6RWxWOTdGVUY3ZysycVhpekw1ODAzUDUzVk9GQTl4emkr?=
 =?utf-8?B?VWNENnhvVklUTENhOTJoMGFGS1pnOXRuZTFqMnNqbTBoZ0V1VFJ0MW1NaVMx?=
 =?utf-8?B?R2NMS1IxZWk4TG9kTHR0dFJxcE54L05PeHZhZitXY2dIUEtiRHMzcFNuajhC?=
 =?utf-8?B?VVhnc2ticVZ2VFlNWWwwcGJaVzJuK09zU0JSVk9weVVzNnNMZDN4SDlsNEJH?=
 =?utf-8?B?T1RQSENCbXRHYlZNNWFlU1N4ei9YK2VHa3pVMHdpRFpXMDRvZ1NRdytDQWZi?=
 =?utf-8?B?RFBxSkVlL21XNi9VaG9qaHpnbktQR2tLYW1vVTZsYzlaa2hXSVA3RDFNSHZ1?=
 =?utf-8?B?Q3dYQWRQK1BZa29qTW1kZHJoS015QzVxU1pzTFY1UDRrZ1R6V05yRzJhOEFy?=
 =?utf-8?B?Qi9HTXEvSGlFZEZBSmxaclhSd2IxL3V1RGpQU1ZpbDRyNUo5WHBOZWlHcDFy?=
 =?utf-8?Q?XzohF7Okb4rCoCner0TX6vrnC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a93a6a-4ac4-4163-5c9d-08de2672b0fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 07:18:37.0223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3emO3rjbZVIOsr/D6y4LNY0gJm3cgzcySkWTp6NcaKzuISTEWg2kgYllsaeqfMJSCm4pktCe4ORLHtdqir0Tpw==
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
eSwgTm92ZW1iZXIgMTEsIDIwMjUgNTo1OCBQTQ0KPiANCj4gRnJvbTogTGVvbiBSb21hbm92c2t5
IDxsZW9ucm9AbnZpZGlhLmNvbT4NCg0Kbm90IHJlcXVpcmVkIHdpdGggb25seSB5b3VyIG93biBz
LW8tYg0KDQo+IEBAIC0yMDkwLDYgKzIwOTIsOSBAQCBpbnQgdmZpb19wY2lfY29yZV9pbml0X2Rl
dihzdHJ1Y3QgdmZpb19kZXZpY2UNCj4gKmNvcmVfdmRldikNCj4gIAlJTklUX0xJU1RfSEVBRCgm
dmRldi0+ZHVtbXlfcmVzb3VyY2VzX2xpc3QpOw0KPiAgCUlOSVRfTElTVF9IRUFEKCZ2ZGV2LT5p
b2V2ZW50ZmRzX2xpc3QpOw0KPiAgCUlOSVRfTElTVF9IRUFEKCZ2ZGV2LT5zcmlvdl9wZnNfaXRl
bSk7DQo+ICsJcmV0ID0gcGNpbV9wMnBkbWFfaW5pdCh2ZGV2LT5wZGV2KTsNCj4gKwlpZiAocmV0
ICYmIHJldCAhPSAtRU9QTk9UU1VQUCkNCj4gKwkJcmV0dXJuIHJldDsNCg0KUmVhZGluZyB0aGUg
Y29tbWl0IG1zZyBzZWVtcyAtRU9QTk9UU1VQUCBpcyBvbmx5IHJldHVybmVkIGZvciBmYWtlDQpQ
Q0kgZGV2aWNlcywgb3RoZXJ3aXNlIGl0IGltcGxpZXMgcmVncmVzc2lvbi4gYmV0dGVyIGFkZCBh
IGNvbW1lbnQgZm9yIGl0Pw0KDQpvdGhlcndpc2UsDQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFu
IDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg==
