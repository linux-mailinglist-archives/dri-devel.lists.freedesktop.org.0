Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6820C0C06A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 08:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8768510E13E;
	Mon, 27 Oct 2025 07:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VtFieBKx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FA510E0B0;
 Mon, 27 Oct 2025 07:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761548541; x=1793084541;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SrBqfvkkxcDS7asiLYkh4Kg3w3CwiqBXTDeSW0C1BmQ=;
 b=VtFieBKxeUzY4WDZ/8J9O79Q1IAZoDv+MaFP34NbO64Ym3a4DhLdduZS
 Q9xHt/nmQYqP234IONCLpDZxZcNFhRn9gMwN3mwQKihF/xhBvwEJAZVZY
 SZu1n0EStyizUcv8VXiVJYCyfjgsbIwh/4NEwU7H5aBDYgNDkABZMFfcg
 7P4y0Qyo7bDpfHWIkv780j6TMRUlS1a2bmwH1GIv5xZzD1yyDxZ7zpKtZ
 xfle3CiW3PbTgcZhHFdKnMFBkYl++ZicRaDOO99dTXUeTS+mTWDTHiPg4
 MPpTlX36pP7CJFHEfOCzRwCRLPTDAhx0hbnvh72JTMS4SMN17oEgIjo9e Q==;
X-CSE-ConnectionGUID: fHIzgUwZRrGM5vI0A6PG3g==
X-CSE-MsgGUID: vmZKZIuRSkC43lPE+6q++g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67453685"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67453685"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 00:02:20 -0700
X-CSE-ConnectionGUID: p9ys+tj5T3KLaUji0ynEFg==
X-CSE-MsgGUID: miEl++XCQWa4gaVNOxV9EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="215619302"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 00:02:19 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 00:02:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 00:02:19 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 00:02:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3O3uOATSYP8YoQPKGuvJNXPp+2SMHDUm5m8IRmJeTL8UPDgmRuHMwxPPuv3uux+T7KidhUbXfSu18YR1dLtomCm5//3O108kTxlR7lOnVN/aOkbD/ax0OlXVj7AhsHM1l2Py3D6iU57+EcmZLc1JlqPXly11w3VZHpSZR/tIwLsdUg+5zZNY9N2MpGRR/aK7ZsoYCZcAnzhzZlA4WrOtYB7s7uXnV7gO3C1BzwVznhN8SAyG8TuVuAhiy1xBOksjwDDNK4X7U2qx1KNDyXDNhHFdEpW2iUk2mnRhRMJ3367FiO5HoYm3tIw9I18aMH02br3hjFvkurxOvsqQKZi8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrBqfvkkxcDS7asiLYkh4Kg3w3CwiqBXTDeSW0C1BmQ=;
 b=txut1xfhOFVh612RRdOnlNwZrlC5F22oMZrlhMSPjhY/v5l246pRAieR1VrR6QQmMF5eHfsIChI++u+UZx0bM2ys4tlcepZqC8pGeQxEILBRDBp+oxEpleLY2qE4P+sIWrI28L5V5l9+smJUVi2nOuFFUamghfoSbOlN1L4uyYkB3IG++L9aRD1b5zP5QvGJbWbAmhDljnGYTXAtGExomljDTJHBpBP0K+HHO/0ZjTVvjAjp7kLLWAFrwNryR/01xDjuRSejgJsIxpJbn/KcQ4qnvEYr26God57oci5lvqkL08RD7aSXL3I28NS/BikFRhwqiiUFhRSiMzPgkB71EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SA0PR11MB4526.namprd11.prod.outlook.com (2603:10b6:806:96::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 07:02:17 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 07:02:17 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Winiarski, Michal" <michal.winiarski@intel.com>, Jason Gunthorpe
 <jgg@ziepe.ca>
CC: Alex Williamson <alex.williamson@redhat.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Yishai Hadas <yishaih@nvidia.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, "Laguna, Lukasz" <lukasz.laguna@intel.com>
Subject: RE: [PATCH 26/26] vfio/xe: Add vendor-specific vfio_pci driver for
 Intel graphics
Thread-Topic: [PATCH 26/26] vfio/xe: Add vendor-specific vfio_pci driver for
 Intel graphics
Thread-Index: AQHcOuckc1ufEeIXKUOKyILnSl0s1bTNSAQAgACoHwCAB7gboA==
Date: Mon, 27 Oct 2025 07:02:17 +0000
Message-ID: <BN9PR11MB52762F4BE3D250A0F40023A28CFCA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-27-michal.winiarski@intel.com>
 <20251021230328.GA21554@ziepe.ca>
 <rqgewmv4g7xsoxfez6y5g6etl7s6o7vqcqmbbmjftebdtxssvj@2uao5kmhkow2>
In-Reply-To: <rqgewmv4g7xsoxfez6y5g6etl7s6o7vqcqmbbmjftebdtxssvj@2uao5kmhkow2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SA0PR11MB4526:EE_
x-ms-office365-filtering-correlation-id: 4eae644c-55d6-40a8-3f57-08de1526c3d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?SFZsaU1mR1J0bmlYZ2w3c1BXb3pMUlhWUWZ5UXc5TkVRMDRUbWE0eFBLT0pw?=
 =?utf-8?B?T016bmdrNmlZRE9vanlZZ3c5RWN4OGZTdmJIRzMwREpXbExYVGpobU9ldHRo?=
 =?utf-8?B?QXpGdi83QmN6VDN4VXJ2YUhVKzdkdjgvS3dNQmNJZ0ZmNGNjbkh4WXhhS3Ja?=
 =?utf-8?B?UmxtbmtyNW4va3prZ2NIOWZhd3EyWnRDUkZ6elhCbzR1WGc1WCsyV2hpSVl6?=
 =?utf-8?B?UHlBYzlnZ2xGODZ3aU9BaVQzUFhUdzJyZDIyL3grYVJzV1BaNXFIY1E5bTV4?=
 =?utf-8?B?d0dQWHEzZEp0c3BTOW5LQUFDeU9lMk0wY2NrcGJyRUtic1BjcGs4Vm16MlBC?=
 =?utf-8?B?aUJCNXhGVlZwRGJxdWpPZnFUK1IxT3JseGNVTlJQQm0rWHI3cDV4SWo4Z2dy?=
 =?utf-8?B?a3MvKzkrallxblpkaDdMc2l5em1ZMDhpc0lUWm1CbzgxemVmYlFMcjFzL0U0?=
 =?utf-8?B?c1BtUlFRUU9pdFhOelJKL0lrNVRsNHpZOXpMZy9iQzZCU3pqZzBoZzhnV2ZH?=
 =?utf-8?B?eTZkeHQrRE42cm5Rdmh0citwYVV1QTU0dForVUl5bDY3NHIwcUFRSUUwbUpH?=
 =?utf-8?B?RGhDWERIaUtmeEpDeHNZcklreWF2SUU4M1ZrazNKbmRsTXpFWS91dmhpL1M1?=
 =?utf-8?B?U1VHeUhMdFNMMlZJOTRtRnFkQ0FNMnZRanlJQ3hlamtRcTBhSlNLSktGNlY2?=
 =?utf-8?B?QWpSSVVYU3pmeTJncjIyMVRZMzNsMEV6SStHcTVIdEY5QkhmdC9oYjBxYUZH?=
 =?utf-8?B?eEVlWk1QeS9hR3pjZFMzOGFjOTlCSS9neElEZ3QrZ2ViYVJkNlVMTTBTNnJ6?=
 =?utf-8?B?K1d2dEVxeXlyNS9jRldKcE9KWFkxTXJrZitKRnlnTmhlYW10bHRML1Y1dXNn?=
 =?utf-8?B?U1J6S0VFcU5TMzJHY3pSZ3RrZ2Q2WEVZRVVITGNDT05JZHJVZjdIaG1XdUpB?=
 =?utf-8?B?TVRWcHJuUkdaRWQxVGJyd3ozT0I3SlhoRlJUYVFETmtMVDhTOHBSMFVheFVL?=
 =?utf-8?B?NjhUOVpEL0VmL085MEJUSEpLWGlhMkI4RXhLeklmUmduRWVOZ25mbmY0Vkho?=
 =?utf-8?B?TUNJcVIwNUlaV3NhUVFQd2h5OE5wdmg4YVZoSmlGVVdYcXdiV0NvSm9kdkN5?=
 =?utf-8?B?aGMvdUh1QUpSWGVxWHU2dkV6aEloS2x4YUxuekZyc04wOElNcVpKb1ZVWmZw?=
 =?utf-8?B?MENHS1diTWZEbGRPcjlXWlNZL0pxVzVrSEp3NWpLV05kZ1ZrVkpyOGFGU0pr?=
 =?utf-8?B?SExBOWVyL1ZyT2diZlhEWFFrUUU0aXRqYTVvclI1RGZiblNaT2NZbE42TU5a?=
 =?utf-8?B?WG53c0RnNm1SWnZ6NjZlMmkzdU1zaGZoV09lTUtPc0dVKzZrdUlqbWlZbmVo?=
 =?utf-8?B?STcvcWtHTFljaHNYU1FQTEM4MThHWlRJZU9uQ0czdzE3QkhORURnSEZuU0kv?=
 =?utf-8?B?QzZjVTAxdEwybXJxNVdaU29sR3g5My9RTXhtQmpPY0NsNlFMOW9TaVA3ZVRt?=
 =?utf-8?B?eTBBbThydkI3aERoRzZvTE45MEF5WUphSkVGcHBpN2YvMmZNc2RPb25PVDNQ?=
 =?utf-8?B?VUVCMG8rdm1LS3NFYXBrZzRyQzRSeHZETG8rTHNEbk45VGhYNVFUNzJhOEQv?=
 =?utf-8?B?UFRFNCtVTFR1aGpXczM1L0NSdjM5c3BFQnpHZThaOVl3cGg5eTgzMzZUTUdT?=
 =?utf-8?B?Y3VLc01IU3oyNEpKQU5YYWZjN3V5U0RmNnVOcm9HcVllVldPcE5ObmZWZi9Y?=
 =?utf-8?B?VlNqSEVKeHJ5d3BrL0lVN2gxVG00dU1xdDM3dy9yUm5lM1ltbXU4YWNiVGc0?=
 =?utf-8?B?cE9PNU9hR2dQU29EZk5Ha0NXZXBnWjJaU2ZjVW5ULzNxQmVheXI3YjIrYUhm?=
 =?utf-8?B?MjNxQ2tOTVN3N3ZlcmRHdUlkSXRzSnhrUW5NcmRhWTBaaHZIRTl3d29UWmlR?=
 =?utf-8?B?TWd0aHZpVlJGVnhMS2pKQzRDUmZ3dHZwdFkvN2M1c2kwY1N2SEkxbCtQVTV5?=
 =?utf-8?B?VHRyVGVPdU1zaFdRejh2bEltN001SWl5NVdoZG16Sk0zanhNVEtVcWtRZ0hY?=
 =?utf-8?Q?KQTFia?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Uk9kL0lUQjJEWUlhQ2dHRnRHQVRQZm4xSmFxSnMyKytvRzVtSy9TUW16eWV3?=
 =?utf-8?B?OFlodnlDbC91YUs0U2NzUjRNYUNUSmN3MW9Kb2N1V0srVm5IeWdDWFk1dVYx?=
 =?utf-8?B?YXR5K3dVTHJQVjRmaW5Tc25YbExVbUIxSlh1Mlc5ZWc5TDdmTGptdzN3VnlV?=
 =?utf-8?B?U2daZUsydDJ2OHJUNGJ4bFJUd2NsdG1CZmNldVR6bmRTUXVyM3g1VExBWnJk?=
 =?utf-8?B?aGRnS2tHdyttTkpSNDVVRnNOR2hVMUxoaTB1Z2ROcTdqRkhCMXpFMEhVY2Mw?=
 =?utf-8?B?dU9hWUR1blAzcWdDZUg1c3U1QnI2QU11OWZqcVJyckJ5d3IxSURhaW1ydm1H?=
 =?utf-8?B?YW1ESnZsZDgwNmw2aURWelEwQThuVjZ5R2lacldJVHl1Z25uVnFTOCtBK2hG?=
 =?utf-8?B?U0tTZU90Ykk1cVU1NzZiMUxENlg3aHBPRGJ0eloralM0YURjUXp2Nk5od3Ju?=
 =?utf-8?B?M3NGVDFJUHAzZDhIQzJGVzBWQzVoSmZYTFZPRnRaRnFXcUpzVGlxQjcwY0VE?=
 =?utf-8?B?emJNVmtOdXNGVld1eHFQNDR2WUtSQnRjYXVQL0RNckRCZHhuY0lZZ1RtNzRF?=
 =?utf-8?B?eTZKbmFEcTh6TDRHSTUzTDNRRWZkdGFGNE1nL25wT1A1VUFrd1dUb2VybTVW?=
 =?utf-8?B?bTc2cDhKd2piZG1zUVlaUk15di9ScjE5cm5mVzNRTHQyRzZBSmNNdXVQVHYy?=
 =?utf-8?B?NkZlbW50L1haSUdMOVJaRS8yNXZjUWN6NlUyaDZSRVVka0NTV0I1TE16QnNX?=
 =?utf-8?B?SEhCeGJUOWgzU3pFWEFnWUM2cW9XempzWkxuQkZyZC9RbElQY3dTNXRpWUNw?=
 =?utf-8?B?S0JMSDJvTkxLajBYZVlDRno0MVk5cS9wYWlXcDRIMnlFSXVvWTRGcjNtdHRT?=
 =?utf-8?B?WGRXN1VVei9MUjEzQXVITzBGSlNLckloempQRkl2YjEzMmNJbnExSjl4WXJR?=
 =?utf-8?B?djZVa3FDS0NYVjE5N2hqdkRNc29sWGRoK09vK3IvNjVEc0FLV2VsTWVXTzJN?=
 =?utf-8?B?cEIyWC9xK3hMdFlpenR2U0tRSEZYaUw3T01MOXdOVFZUTUhTU2E0VXlaN25P?=
 =?utf-8?B?bWtoazB1ZXd1S0t6NnFvTnNiR0JLK24xUDcyUCtYNHREOWhtNGI4MUJRTWsz?=
 =?utf-8?B?bS9rU1hJbUVMMXFpTzM4VnBIejY1NFI4Q3VwRGo5QTd1U216UXBkUFhRbEZa?=
 =?utf-8?B?Z014cXdMQmxwVVVnendhOTBBZi9Id1dtbE83cnJwbmZ5TDB4VGQzSTBCWEJN?=
 =?utf-8?B?ZE5lM0JOU3pJbGE3YXdxeVZjMU1jWkIrV0lqbnMva2JITzRNN2F1QzlBQXNt?=
 =?utf-8?B?cHk0bWJaUHpVMDVzVU4vU2cxMWpsYi9GaHRXd0Vzc2dndXFPU04vZmlTYnRD?=
 =?utf-8?B?bzRNRGgzM1E1ak85b1p6Q3ZSS29ocHFWRTlnUjNwR1NNOHk1Q3VmSFljN001?=
 =?utf-8?B?OXhkTitqejRaeFZJSUd0dE9BQ2JGM29kK0FGZTBzc3NTL1lqTEtQd3JhUk1q?=
 =?utf-8?B?QXMwWjd5eENHbTFDbk5SWmFGS0tRVm1JVG5zMit0MlJrNG5lbW4wYjdtaFdE?=
 =?utf-8?B?WVc5M2dnU3FlSGFyKzFLTzR0WC9ZWG11ckZjc3NmemJCM1BkTXVnNTJMZHp0?=
 =?utf-8?B?TThGZVV1YjMza1dKZFQwY0U2WEVOVWdlVVNpYnpWaHYySHF2dHZ1QktjcVRP?=
 =?utf-8?B?d095bUNlVVZRNGpvRmVPWGIxTFFMZlByQ1VMT1hqTWJEeHU3Q0FSZ0NicjJh?=
 =?utf-8?B?VHBQYW5JRlY5SWhvQUVsM0dNVFJRZ3Urb2pvcFo4dDFIQ1pZWWNVc3A1SW42?=
 =?utf-8?B?SE1zTDJEaEZrQ0pjaXhDTVFQejBZOWI0eDV3RkZHNjFLWDhRRVJRRjQ1Q0ZW?=
 =?utf-8?B?U1RhQjZTMnh3bi8zYXlpcEtXNVNWcFZJelhjeE15MVNtcVZwQkRPWE16SGxk?=
 =?utf-8?B?TDNUZ1FVcEgxNDhYTlcySXJucnFEQklBMDJJRUVWRjU0ZURuVjNycEFXOW5t?=
 =?utf-8?B?SkJLWVZNUWhHR0hTWkREMmtkTVJ1WXB3aGpHTW4rSjMxUFM4eHBBSTdZM3lY?=
 =?utf-8?B?T1RsdXA5WjJ2b2RlYzYwcTlnVFhoNlZTQWhEUlg0M010MDJkZzdBZFBoclFl?=
 =?utf-8?Q?orfyIZnnfdCdvwTTejgijOwoO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eae644c-55d6-40a8-3f57-08de1526c3d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 07:02:17.1067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D7KULrXmJvTzqzudR81rfYTBAZb5mEFjztO/mZHSZxeAVfk50uK60NSs7kBn0ZCYcbcXSjyjF721lYELsEg2jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4526
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
IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyMiwgMjAyNSA1OjA1IFBNDQo+IA0KPiBPbiBUdWUs
IE9jdCAyMSwgMjAyNSBhdCAwODowMzoyOFBNIC0wMzAwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6
DQo+ID4gT24gU2F0LCBPY3QgMTEsIDIwMjUgYXQgMDk6Mzg6NDdQTSArMDIwMCwgTWljaGHFgiBX
aW5pYXJza2kgd3JvdGU6DQo+ID4gPiArCS8qDQo+ID4gPiArCSAqICJTVE9QIiBoYW5kbGluZyBp
cyByZXVzZWQgZm9yICJSVU5OSU5HX1AyUCIsIGFzIHRoZSBkZXZpY2UNCj4gZG9lc24ndCBoYXZl
IHRoZSBjYXBhYmlsaXR5IHRvDQo+ID4gPiArCSAqIHNlbGVjdGl2ZWx5IGJsb2NrIHAycCBETUEg
dHJhbnNmZXJzLg0KPiA+ID4gKwkgKiBUaGUgZGV2aWNlIGlzIG5vdCBwcm9jZXNzaW5nIG5ldyB3
b3JrbG9hZCByZXF1ZXN0cyB3aGVuIHRoZSBWRiBpcw0KPiBzdG9wcGVkLCBhbmQgYm90aA0KPiA+
ID4gKwkgKiBtZW1vcnkgYW5kIE1NSU8gY29tbXVuaWNhdGlvbiBjaGFubmVscyBhcmUgdHJhbnNm
ZXJyZWQgdG8NCj4gZGVzdGluYXRpb24gKHdoZXJlIHByb2Nlc3NpbmcNCj4gPiA+ICsJICogd2ls
bCBiZSByZXN1bWVkKS4NCj4gPiA+ICsJICovDQo+ID4gPiArCWlmICgoY3VyID09IFZGSU9fREVW
SUNFX1NUQVRFX1JVTk5JTkcgJiYgbmV3ID09DQo+IFZGSU9fREVWSUNFX1NUQVRFX1NUT1ApIHx8
DQo+ID4gPiArCSAgICAoY3VyID09IFZGSU9fREVWSUNFX1NUQVRFX1JVTk5JTkcgJiYgbmV3ID09
DQo+IFZGSU9fREVWSUNFX1NUQVRFX1JVTk5JTkdfUDJQKSkgew0KPiA+ID4gKwkJcmV0ID0geGVf
c3Jpb3ZfdmZpb19zdG9wKHhlX3ZkZXYtPnBmLCB4ZV92ZGV2LT52ZmlkKTsNCj4gPg0KPiA+IFRo
aXMgY29tbWVudCBpcyBub3QgcmlnaHQsIFJVTk5JTkdfUDJQIG1lYW5zIHRoZSBkZXZpY2UgY2Fu
IHN0aWxsDQo+ID4gcmVjZWl2ZSBQMlAgYWN0aXZpdHkgb24gaXQncyBCQVIuIEVnIGEgR1BVIHdp
bGwgc3RpbGwgYWxsb3cgcmVhZC93cml0ZQ0KPiA+IHRvIGl0cyBmcmFtZWJ1ZmZlci4NCj4gPg0K
PiA+IEJ1dCBpdCBpcyBub3QgaW5pdGlhdGluZyBhbnkgbmV3IHRyYW5zYWN0aW9ucy4NCj4gDQo+
IC8qDQo+ICAqICJTVE9QIiBoYW5kbGluZyBpcyByZXVzZWQgZm9yICJSVU5OSU5HX1AyUCIsIGFz
IHRoZSBkZXZpY2UgZG9lc24ndA0KPiAgKiBoYXZlIHRoZSBjYXBhYmlsaXR5IHRvIHNlbGVjdGl2
ZWx5IGJsb2NrIG91dGdvaW5nIHAycCBETUEgdHJhbnNmZXJzLg0KPiAgKiBXaGlsZSB0aGUgZGV2
aWNlIGlzIGFsbG93aW5nIEJBUiBhY2Nlc3NlcyB3aGVuIHRoZSBWRiBpcyBzdG9wcGVkLCBpdA0K
PiAgKiBpcyBub3QgcHJvY2Vzc2luZyBhbnkgbmV3IHdvcmtsb2FkIHJlcXVlc3RzLCBlZmZlY3Rp
dmVseSBzdG9wcGluZw0KPiAgKiBhbnkgb3V0Z29pbmcgRE1BIHRyYW5zZmVycyAobm90IGp1c3Qg
cDJwKS4NCj4gICogQm90aCBtZW1vcnkgYW5kIE1NSU8gY29tbXVuaWNhdGlvbiBjaGFubmVscyB3
aXRoIHRoZSB3b3JrbG9hZA0KPiAgKiBzY2hlZHVsaW5nIGZpcm13YXJlIGFyZSB0cmFuc2ZlcnJl
ZCB0byBkZXN0aW5hdGlvbiAod2hlcmUgcHJvY2Vzc2luZw0KPiAgKiB3aWxsIGJlIHJlc3VtZWQp
Lg0KPiAgKi8NCj4gDQo+IERvZXMgdGhpcyB3b3JrIGJldHRlcj8NCg0KaXQncyBiZXR0ZXIgdG8g
YXJ0aWN1bGF0ZSB0aGF0IG5vdCBvbmx5IHRoZSBkZXZpY2UgYWxsb3dzIGFjY2Vzc2luZyB0byBp
dHMNCk1NSU8gcmVncy9mcmFtZWJ1ZmZlciBidXQgYWxzbyB0aGUgc3RhdGUgb2YgdGhvc2UgYWNj
ZXNzZXMgYXJlIHF1ZXVlZC8NCmtlcHQgYW5kIGNhbiBiZSBtaWdyYXRlZCBhcyBwYXJ0IG9mIHRo
ZSBkZXZpY2Ugc3RhdGUgbGF0ZXIuDQoNCnRoZSBsYXN0IHNlbnRlbmNlIGlzIHNvbWVob3cgcmVs
YXRlZCB0byB0aGF0IHBvaW50LCBidXQgbGV0J3MgbWFrZSBpdCBjbGVhcmVyLg0K
