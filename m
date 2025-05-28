Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FC4AC61F1
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 08:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3059010E589;
	Wed, 28 May 2025 06:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrnFwOwY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB05910E584;
 Wed, 28 May 2025 06:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748413815; x=1779949815;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X6RfU/A/Rur/478/btmx1+QYqrf82TYvOJHtxhSmm8Y=;
 b=VrnFwOwY/rODw11X9EGArm1Tp8hkrFQK/ZbG8n33F0R/scwf9VjnL4c7
 FZUEQH+BQI5L0PCVBDZxKzE2sNUIWiRrzcrEUl8C9cMCCn3RoN1Cjg/LM
 ZgEJCXCalXjzkklc7PZRw5oFYJJV84pzb1NjVNBaHfqiTBy5KUPe974J0
 79EeJn5595OBrvrO88zvkPPOA8RiDwdBYrQ74DbYhF8ldp+YoSzu+qfKN
 uRufVOVDJdMF8yTA8S/QIO/SzyhDQzUSAltHUT1+ePYBYgeJxf4nUcbwq
 wmoDvZRsAko+VckxtyoOwBLkQ6brGcvJUjyaqyxZdcxRgs02h2+9UPNJ+ A==;
X-CSE-ConnectionGUID: Yky7sLIkQy2ZBkSpSo/T3g==
X-CSE-MsgGUID: zQ0GaybsSi2acbkXr3797w==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61775088"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="61775088"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 23:29:37 -0700
X-CSE-ConnectionGUID: MUIbb8hDT4CXkiTlzQKEUQ==
X-CSE-MsgGUID: Kk9olkHUTfmJgmWFYXEU0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="148010542"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 23:29:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 23:29:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 23:29:36 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.78)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 23:29:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMCvjR5in/uBz4UpHZS8SJHlOD4m7q1DzykakNFwHJQA3HOBUHEqTtu3i6ln4RWG1cxV/wVa1vnYD+MPlbNBfU3VzMq6Cma60tpgDzxxtfPn+C4eQPuvanG/KfmCxJAU6J7clw1PWli9TYEcH/OYzs/NvcLbZn8Su97u2e+QlNaKLQsvOPBftjZ/RdvnXkxrex6X0Iar0s8o+pqU1gEr+REuXlG5XSM+P+AAk44DCbMUrIx9SZOi0iuHQ6Z15yWxinkv3XJ6qKGCRkP6orfS5NjTTILj5cuAi7uIX9iX2lhzIfH9E9cvwWqQTNhuYG1APUxEgNC0MYY++F0xZNTkIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6RfU/A/Rur/478/btmx1+QYqrf82TYvOJHtxhSmm8Y=;
 b=LM5NGtmD5yL/7gedTcsACvVPFmHWjE3vPWP0H/v0mWkHPC02tqpDvyl4NwTpD2ynRSRZm3IlbuAoXX4t1Uw+Pjw+AvRgLrdFDGBvV/YIFHLSGjH/cm4sNJOlVaGPJn5msm6G+kfgVfQyetcK+F/C91mczYDy9sMJWwdGAIOZBawzgu+NJXISXO4eUKLAwN+I8oikE4/JptgzrSutHn/Aske2oR1NRev2Dl1ujiBvf0m5tVpi+BjmyIqa61BUHDUFbmr2QQu35kdwbArnAXUgWZco1zcWcZI79mo5rgoBS9Ow3LCCB4SqyKSPfQEFRzv0kex2GPB8lgm16ZH2NhxAqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH3PPF10E309DEE.namprd11.prod.outlook.com (2603:10b6:518:1::d08) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 06:29:34 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 06:29:33 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, Reuven"
 <reuven.abliyev@intel.com>, "Weil, Oren jer" <oren.jer.weil@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomas Winkler
 <tomasw@gmail.com>
Subject: RE: [PATCH v10 06/10] drm/i915/nvm: add nvm device for discrete
 graphics
Thread-Topic: [PATCH v10 06/10] drm/i915/nvm: add nvm device for discrete
 graphics
Thread-Index: AQHbxaAYsfXeRjkanUq+gmwHohKWMbPhn5sAgAG3RSCAA4oAgIAAx3Rw
Date: Wed, 28 May 2025 06:29:33 +0000
Message-ID: <CY5PR11MB63664E3CB820B011A01ADDD9ED67A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-7-alexander.usyskin@intel.com>
 <aDGdWof1HfViERND@black.fi.intel.com>
 <CY5PR11MB6366E83555BDF8B89C9DD6D9ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <aDYF2cBPdb0EHRrX@black.fi.intel.com>
In-Reply-To: <aDYF2cBPdb0EHRrX@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH3PPF10E309DEE:EE_
x-ms-office365-filtering-correlation-id: 2f94bb06-b3c6-498d-6530-08dd9db102cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?U2t6MUdKN1lxTzQ4K1FNZHh6SloxV0FkU3ZacFZMaDhCRHlGaXpkL1JBQ3gz?=
 =?utf-8?B?NjB2ck9DelVPQ29IeWVOMWZ3dlNSQVo1Y2pEREUvUmVablVSNlBQc1U2U2RP?=
 =?utf-8?B?RG5ZMXBxamdDTzIrbGt6S2dZRWRDMTlUQTBsU28rN0x1bDU0NzFIbTdRdkVr?=
 =?utf-8?B?b1hvNWlnbkE4U0RkNUFTdnlmcWhzQVF2dUxRb2FlWlZ3VzB2YWFaMkxZQkFH?=
 =?utf-8?B?K3ZkOU9kTXJkZHVucmxSRzVpZjhrUHZoNTdLNHRMRGcycFdVQnlWL0pQM01W?=
 =?utf-8?B?UUVJc2xKVGN6amFsZklUdXhxR0xMZHVmYzFuYW91WklkamlOR3hsVFFZZ3VK?=
 =?utf-8?B?eWQzTWlSN0pnSklxb1ZGZmxsSEJQOXpZQXlKQkFIOWd5TUt6Q1Awek5JOWFz?=
 =?utf-8?B?WmpaM1JuV3BYZ0hyNU5QcDl0MnFCdmhrYzBXNjBibTJncEF1WnVoUmVhOElL?=
 =?utf-8?B?cVdVUnlBekpjSXBnRXJIc3daNlRmeEUxL1k3VDJRTWpyMTZwZVJUeVhFakNS?=
 =?utf-8?B?bmxJMGhZV3V1RG02SUVrWSt4eHBRSW1pK3UzNW1lZFM4d2tpTVArQWRjMUgw?=
 =?utf-8?B?c1FEcmluU3RXSGk5djY2WjFYd05lK2NWdGpsTGJlRjZPRTZnbmRLR1Y2U3Nk?=
 =?utf-8?B?alYwUjdSNEloZ2xnajlhVDBuSDZyVGpvZE5HUHpNb0FpY1FNdDgvR0dlYm04?=
 =?utf-8?B?WjdWZE00V1VjdDlFUE11cHdnU0lUTThZQzZjYzdpdmFLUGNIWEoyZ1Vod0tw?=
 =?utf-8?B?Rkdod1AxV0JtbEVsNDFVRU1CYk95dVdZMkNWT2xQSU5WaWc1MFNrb2Y2TFdG?=
 =?utf-8?B?VERwNFlBZW9XYUFJZytMMUVzdWNTTnVWYWJSSiszWmNhelZDKzJhTFlKSG9N?=
 =?utf-8?B?S2dLYldpV1IxWnB4Ti8vNEhTWjFXUGtjOHRIYkc2MEVCL016SHN3QWkybEoy?=
 =?utf-8?B?WlA3L0xnYTYxTDI0dUpTUjNhdlFhN0hMNW5EVEVFd21kOTBNR2V6K085MUJQ?=
 =?utf-8?B?Nm5zWEY5NisyTjBCRVV3SnYxcEw2ZlA4NGwranVlTmN2a2N6MnltSTloc3V2?=
 =?utf-8?B?ejhKOUtwRklpS1pqaGREWmNubW10eU9Danlxb05JWWtjYWhZbEhVTFRyTitB?=
 =?utf-8?B?STdvVjMrbG5qVkFCSFNKMmRUazdieDZsa1dreHdaZXM2YlNvUzViRTZETzFT?=
 =?utf-8?B?bk8zRHFtN1c3WkJoV0JSUDJSZUZQaVdBb1NjeFRKRmRNeS9LdGJCSlBOUC9E?=
 =?utf-8?B?dzZWMWluTFRwRTQ2T040dlhVRDhDaGJ3dHdnV1FqVFVtSFhGZ1AzUnhuTGtZ?=
 =?utf-8?B?cGxMZmZkSDFBT1RUUzRCTEFHREtOeG9pa012bUpXUy8vc25UTkFDa0NULzgr?=
 =?utf-8?B?amdRWFI1Y01xeU5mOVBhSy9Pb3lEUkM3QWYxTmRBdE1LQU9jelREVE44NE9u?=
 =?utf-8?B?c21tWGdwUTNtNGMvanc4MjlvUGdhOXQ2VGdYRDVjQkxlbFhMbWtXVkgyWHZB?=
 =?utf-8?B?bXVMSGwwSUFzSEhsNGpUcHRkNVA0THFxUWN3T2lGb2lVVktEdFFrUmZXUUVT?=
 =?utf-8?B?aTBnVjUwV05RQ0lOY0R3VzNuamsvMlN5b2V3Y082UVZUcG9OOTFmcUVRZTZ5?=
 =?utf-8?B?dlRRem4rYUJ4NUhXZzk4YU5VVFo2a3k4NFZOb3l0RkFFZTViOFpPVzRmcEFB?=
 =?utf-8?B?b1pZQWxETmRCRTdDOWEwZXE3M0gzS0lpeUtwcU9lalVSTXpvMERUZG9Vamov?=
 =?utf-8?B?QndyMFdtWGVMNUtRUW1RSnFkY0gvOGJvUkJSSlM1d0JyMHhydnhhNWpIY2dn?=
 =?utf-8?B?aUdaVzZ1S1pPVHUyOVhFTkNaSjFRZWlGNGg4b3JEU1BOaGZqVUJzeHZhN3g3?=
 =?utf-8?B?STlUYXYxOUU3SjhTOSt0aXBLdHhsN0lvYlU2RVZSU1pIMFVhc1RtVzR1WHhw?=
 =?utf-8?B?UFZGM2h5SmRQUWd6YmNBMC9CZFEwdnJlRGhHY2V6dytTdUdkdHBESUNLZUgv?=
 =?utf-8?Q?1jOoATkeNNQXM8ZrwUMeG1UocXihLQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1lob0E3TTFOa2c1NTY0VFF0azBaOEFEcFUzSTFrNmx4TWhUZUkrazBSYUdB?=
 =?utf-8?B?OTdoSnJENnMyMlBnd3Z3VDFQMmVONFYzNEtrcEFqamhtZkZBaTN4aGpKcys3?=
 =?utf-8?B?VzhJL2dGSnptaHNwL3huU3ZEemJjRW5OU2NOVkdMcmtIT0xoQTRLdUwzdktD?=
 =?utf-8?B?T3A0aFhlOWZJMzVEQmRmU01NTS9pV3k0MkFUNmhaUktBbWZkWlZ1L2JrYmxa?=
 =?utf-8?B?NEJVMk5tdXlXd2NEcjRUTTk5MHhYeWZuS3hlc0tBS2UzQllrRTdVYmxwSUU3?=
 =?utf-8?B?Tmd3SlVTa2Rla0JZeThMcWJud3NuQkxUR2JxSWkyOStqbGtWR0k0d0U5cVNS?=
 =?utf-8?B?U0hrSHI0UUFaaWszUUlSZ1F0MC9oSi9jQkNNQ3NoQy83UCt6SmcvWUNhZVRO?=
 =?utf-8?B?Wmtwd1kzTS91R0U3TlYrNDJLQnAxd1VyY0thWis3ek53MThpeEhOSDZZazFi?=
 =?utf-8?B?dm9KN1FnS0ZtdzZyLzFNbXByRWk0ZXF6Qk1tTUEyZUtWTTdTd1JPdnhuSTA5?=
 =?utf-8?B?VTdPc2lCZFVGaFJDc2NhYVZsRkFTdlNjcEgvdDRYaWo4clhDaHBUTGhOS1JL?=
 =?utf-8?B?d2NacUhEeFhnR3RBRks2S0tVN3lHbE53SFY4ak8xR3VvdC9TRWNJYUg1U2do?=
 =?utf-8?B?Qkl4NVdmY2ZPeC94bngwQ1RaVjVLQWFXSzRLWi9GbEgyZVQwTVRWaFRtSnhv?=
 =?utf-8?B?SlpCOW5wYkJVMUhqaDhGZzQzd1BGbTh1WU5YRGI4b2pJL0R0VldpaFcwWWJK?=
 =?utf-8?B?ZzJOWXVpTk5lcStWMmE3Mjg3eDhDc2FaVVptdlZQdkdGckpTL3N3RCtwSnc3?=
 =?utf-8?B?bVliMUR3ZDRmd0QySXE5WlRLMkVzQUc0bXVIVWhoSndPNUtJSkJOMm00TnFj?=
 =?utf-8?B?MXBGMmtlK0hacTA1Y0twQ1NFT3dkSkJVd25GOXdJN0RZeFlhNjdveS9HNTF1?=
 =?utf-8?B?UjRxQ25KNTlXZENWZk15ZDVWTkwvWFBFalFHakhRdFVXOXZLZ0pMeEd5cE9T?=
 =?utf-8?B?cEZLSXhXZllFbGFxRW5rQ2tWN3JmcmlqQ3ZUWW5iaHNEaVNWalJqYWMzUXRI?=
 =?utf-8?B?ZFhzNUc5ZzZqYVo1VTZxQ0RZOTE3d3FnMStvVVhkVlVUdm9SRjl5dTlmaUQ5?=
 =?utf-8?B?blpEeUF1dGxMSGkyZkFSTUMxZzN5bXA4QWFoNjVjd2RGRXFkRzIyalZ2RWEx?=
 =?utf-8?B?bzcwVFlIWDdUVUJMdWxSeGFWZWxPY0RKR2NrdjBYUTJqRks1dlpiNFdoUy9L?=
 =?utf-8?B?R1ZJTVdPU0pyUVpJZDVIWmViSmJsb3ZrbmxjakdURzEzU1hpdVU5aFZPQ2dC?=
 =?utf-8?B?UHBuR051ZmFzZm16eENkVUNSNW9FTTloYVBFNzh5SFgxWVQ5THhseVdVSnIx?=
 =?utf-8?B?VXZxVWNpRnBRbUMxRFJ0ZHVwdEhTTUlMdDZ1ZnBBTmtlMGZLTkJubEl1bThG?=
 =?utf-8?B?eDJzU1N4YnJGMkVQM2RJZlpGNC92bkluRDUvY0ZjMTFxdHZIWVBORzdwcVpx?=
 =?utf-8?B?TEc2MndHOHNEVENpcnN5WGhtWmtIWGgzUit2ODV0K3ZpNUpGQ0JidUZ3MGFF?=
 =?utf-8?B?MUQxVjdyajZqNUhESzdLMkFXY21ZcE1WT1VqQXc5MS92aUMrYjh5T2gzbU5N?=
 =?utf-8?B?YThMU1FvYnQ4UENPNVQ2UTV3Y1FsSktyTlBVZGpUd3BsY0ZNbkljY2lqcTd3?=
 =?utf-8?B?ZHROaEpSWlBRNmthZW9pRk9uY0NERkR0UnhudzczVlc1Z3V1VnlzU3hwcUh4?=
 =?utf-8?B?T0pyaVhSV1NNSExlakpZM3UraURxL1dnbGZFVktQdjFRdTRyaWVLZElzc3Bp?=
 =?utf-8?B?VGZvamJxNWZEZ0h5T1BpcllkMVVFN2FYZll3YXpQNkhJVkNVeG1PMVJkQUE0?=
 =?utf-8?B?bVZpTGh4SnZMcHQzSCttTncrcHZpVU5QWGlRMkF4Zi9yUmU3M1k0c2k1TldH?=
 =?utf-8?B?aVVZR2ZYY0xWVlczNWJQRFFHVTNKZFNXbVdlTzAzbWUwWDJpbHRnU2VyOVRj?=
 =?utf-8?B?Y3p0bDM5OUQ3SGdZTjF4aGhYL3VTMTFXVkpKeHhjWWhvZ0VXeGtERkI3SEpT?=
 =?utf-8?B?Vk5QTGIrNldFaTdYdFhiL2pzcUw2Q0h2akN1dC9KYXdvTlRCbk1vVWhKZkVF?=
 =?utf-8?Q?92+LZ8ak39NTmu8L9nmdNcxUh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f94bb06-b3c6-498d-6530-08dd9db102cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 06:29:33.7822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /RRIvtKZPEiTJ1YusMUyzZ/WGUsuOwZ5n7O/dCX4Qakqg0yYBGcZzx3X/jNyXDrwp8X1cK2+7yX5ZVtS9Dp1VilvC9jIfc5VANSY58u9Tew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF10E309DEE
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMCAwNi8xMF0gZHJtL2k5MTUvbnZtOiBhZGQgbnZtIGRl
dmljZSBmb3IgZGlzY3JldGUNCj4gZ3JhcGhpY3MNCj4gDQo+IE9uIFR1ZSwgTWF5IDI3LCAyMDI1
IGF0IDExOjMwOjIwQU0gKzA1MzAsIFVzeXNraW4sIEFsZXhhbmRlciB3cm90ZToNCj4gPiA+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjEwIDA2LzEwXSBkcm0vaTkxNS9udm06IGFkZCBudm0gZGV2aWNl
IGZvciBkaXNjcmV0ZQ0KPiA+ID4gZ3JhcGhpY3MNCj4gPiA+DQo+ID4gPiBPbiBUaHUsIE1heSAx
NSwgMjAyNSBhdCAwNDozMzo0MVBNICswMzAwLCBBbGV4YW5kZXIgVXN5c2tpbiB3cm90ZToNCj4g
PiA+ID4gRW5hYmxlIGFjY2VzcyB0byBpbnRlcm5hbCBub24tdm9sYXRpbGUgbWVtb3J5IG9uDQo+
ID4gPiA+IERHRlggZGV2aWNlcyB2aWEgYSBjaGlsZCBkZXZpY2UuDQo+ID4gPiA+IFRoZSBudm0g
Y2hpbGQgZGV2aWNlIGlzIGV4cG9zZWQgdmlhIGF1eGlsaWFyeSBidXMuDQo+ID4gPg0KPiA+ID4g
Li4uDQo+ID4gPg0KPiA+ID4gPiArdm9pZCBpbnRlbF9udm1faW5pdChzdHJ1Y3QgZHJtX2k5MTVf
cHJpdmF0ZSAqaTkxNSkNCj4gPiA+ID4gK3sNCj4gPiA+DQo+ID4gPiBMdWNhcyByZWNlbnRseSBy
ZXZhbXBlZCB4ZSBkcml2ZXIgdG8gYWRkcmVzcyB0aGlzLCBzbyBsZXQncyBub3QgaGlkZSBidWdz
DQo+ID4gPiBhbmQgcmV0dXJuIGFuIGVycm9yIHdoZXJlIHBvc3NpYmxlLg0KPiA+ID4NCj4gPiBJ
IGNhbiByZXR1cm4gZXJyb3IgZnJvbSB0aGlzIGNhbGwsIGJ1dCB0aGUgU1BJIGZhaWx1cmUgaXMg
bm9uLWZhdGFsIGZvciBYZS4NCj4gPiBDYWxsZXIgc2hvdWxkIGlnbm9yZSBlcnJvciBmcm9tIHRo
aXMgaW5pdC4NCj4gDQo+IEZhaXIuIExldCdzIGF0bGVhc3QgcmV0dXJuIGVycm9yIGFuZCBsZWF2
ZSB0aGUgaGFuZGxpbmcgdG8gdGhlIGNhbGxlciwNCj4gc28gd2UgZG9uJ3QgaGF2ZSB0byBjb21l
IGJhY2sgcmV2YW1waW5nIGl0IGluIHRoZSBmdXR1cmUuDQoNCk9rLCB3aWxsIGFkZCByZXR1cm4g
dmFsdWVzIGhlcmUNCg0KPiANCj4gUmFhZw0K
