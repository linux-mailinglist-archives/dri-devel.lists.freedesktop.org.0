Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C41BBF4260
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 02:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC33E10E547;
	Tue, 21 Oct 2025 00:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EG1U0636";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E1810E114;
 Tue, 21 Oct 2025 00:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761006715; x=1792542715;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=d+prbJ4i5XZOL8KT4WdIepstXgiibSwvJUV7q79K9PU=;
 b=EG1U0636RRi5EvHoYjIfCdgoxyH/k2hYzb0gkp8dpOb97Zon5APKOMRZ
 RFQlWKEyeO6J4maIst4/D2Yk+oRr07jd/Sdr06GsHUYz973rwLg1V0o6R
 rako6KiLkWtPtnKVkXSaYFcc31WhjjlJEvcpOIRdH1/VQoa5XLrXSFVYv
 bzOAmHwHhbhS6KkpFMHmBF5cHMqOqXuHhckKc1JAfbCvKx5jCjPOqag/N
 OD05Yh1Hw19rOOkpE3Ay9Ed0yyv+koVwpqOWU4brQ+Bj2rbihnnwcRSMP
 iOdzspShQJWGWSrgWoIjE9yxQJLQjvG8nSS1yCr+sVoJ2E8FDc+LGupIv g==;
X-CSE-ConnectionGUID: UIKe8ZH8RRapm9mtJdukyA==
X-CSE-MsgGUID: go5c+XdLTbC4iPpcrQt5rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63226391"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63226391"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:31:54 -0700
X-CSE-ConnectionGUID: +rCBceJeTuWf39636gGa9w==
X-CSE-MsgGUID: Zb3/L543Q9qkyUgA9dxOZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="188561843"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:31:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:31:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 17:31:53 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:31:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8gdIQHvWFo024iLmNWV3QIuIGx/dWnO3pcYqQtnrTlvN+GIwul3wAlaMDNbEHQw+KRk9VQx1G7lAKN7lXL6PNj7xoqbNXGTicR+y9cij6XnQmNOEHCADheI/9GHHxD1eqtXpnEEqw3UuxIbvtRKvaXc05RCigv16DYDI1yB8XjYmiYn41oAH6PcldESCdZGBgF0PS0lvQW1+vHpd0Ywr0b2tBuFHbBwRjb1NQnWoxztmA6UNUn+kdY8Uv8bbKhMBADAPA7C5u/3iLs19PX6CwMfr/6MgOSvbWB+e4vXsNGeyEZqScZeYgHIFaz65+FyQ9YP3/kY+VA2nFPHB5T61A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i97/4Ua6AWyoCKTfBXFKWZb7M9/iG0vuoryn6NMtY9Y=;
 b=u5CqQiIKIgoqUP6jDuH9OsA+SOEXqvHkMybhaMPTMdAdKJRSTSSVDgyylUPD1RBjRwOzkZmSP9r7AtE5GrFJmFVTMOcerKLt4gBCy4KKPMLNeGQuqvueZRYHatZF1tYyDn6gOmJamndsXDPfH/QiIR9yJ10KV1Jipotj9fFIPAxsPdIt+3W/JMYM18IPDGWwi3cKM0errMA6n45IgKRA7StPUwe3qJ52VoG5vNSd4qs8cvTrb8QA3ww8kw/nswYfJZ9yyA6nrbGSgMJyqyVEjl8eL7upKSrmafLFONQkfmgPV3lIXegGFdfbzuZoyBa1DLQdxTaTxQzvq0xP3mYxtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 00:31:51 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 00:31:51 +0000
Date: Tue, 21 Oct 2025 02:31:48 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH 08/26] drm/xe/pf: Add minimalistic migration descriptor
Message-ID: <idh5nc3urbbwrtklgbmqujkrhvmlxw4ourhkov6z23b4cw5u7l@hmf43vjxnfq7>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-9-michal.winiarski@intel.com>
 <f6cc6c10-3260-40e8-848f-d12e535bdead@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6cc6c10-3260-40e8-848f-d12e535bdead@intel.com>
X-ClientProxiedBy: BE1P281CA0434.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ2PR11MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a0a7a0-18e9-4037-afb0-08de10393a84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eitOMUxBejQwV1RENnZDcm1kdkU2bmNuVDhaUnVRWE52eFpud0luc3g1ZE5h?=
 =?utf-8?B?b21DdXMwYUd4YUFyVHNDVUhNRVpBR25waVlVM0p5bmlkMmxEbytWRWtIaFRr?=
 =?utf-8?B?bkdxTWF1VHFLMzJ3L2xkaDljVHdOMkxTQVMyRVB5ZXJIelFlZXc2ZEE2NUNS?=
 =?utf-8?B?VjRFd29EZXdkdlZxU2FqYjg0RUxHMFUwSFZuaGExdWphT09FcmwxTkNWM1Nz?=
 =?utf-8?B?S1EvMFFIQkhZaHhGVWNVSmRmWXJDaW5ZajQ4UWtZdDYvc1lLU0VBUW16VUpu?=
 =?utf-8?B?U1ltSHRYT2JoMUErdGQycTQvdmI5K2dia1pwSmduS3RNZGNWZzVTUDVqNTBs?=
 =?utf-8?B?bUVSVDhpSkJVV2tJeHI3NE5VNm81WktlbDl6VnFSRkJEVS9ZbGRQc2YrZ201?=
 =?utf-8?B?Z09iaEpaV1pRdWRaS2VqNG9naDBBWEJuZnpFZVhzYndLelpmZWpEZndVOEg0?=
 =?utf-8?B?QXBmZmhTNW9rZWdYQ3pRa1M0YURSSUpHZVQyRDZIUVZ0MmpNVkpueVNkaUxX?=
 =?utf-8?B?UFhtRW1WaWEzcHF1V3JoZHdBdlAwRC9ldlRWZlU4bXlxdkRrZ1NQc2wzL1Br?=
 =?utf-8?B?dE5zZnlIYkQ3SmxNOHh0bEc0SENoTnBKdWg2VEl4WmN4OTIzSEFQd3psZFYz?=
 =?utf-8?B?eC9ranJKVGgzQVFkcWwwTjNVRnRkVnBNYmc4dk9MTkpjVWZrQzBLOEdpai8w?=
 =?utf-8?B?dHZNOVBFakFlbjI1Zkt4K20wRnROd3lOd3JQWkd3R0t2UHVsR05jSzBadmty?=
 =?utf-8?B?VEdydEs0R2c2M1E4eDRqclBqUHdHbUs4Z3hEUUZPQUFPS2JIb2krZEtoZ1RX?=
 =?utf-8?B?MXRLa0pOYXkxcGJ2UGMxRUpHOWh6WTFDUHFpalZVQmVKVE8vMXJvOCtTazBC?=
 =?utf-8?B?S3BZaTg0SXBQVmd6QUJtcFpoM1JLQ2E2bG53VFZEUHF4THRQQ0U2U0gxa2xy?=
 =?utf-8?B?OVk0TSszL1JHR0ZkMlc5anFVN2l2NW1rMTYwVHNnL1diNlJNVmhtcExkSFR4?=
 =?utf-8?B?ZnBYeWhLem1FdUd4ZmRON3BBWVNMY2VMQzhIcHRCY2NwWWt2aXZpOXFpZ2Zp?=
 =?utf-8?B?UnpkdnpHZndTMjdBV1RYQW4zTHBnZ1pHZEsrTjBBQkVDVjMrRGdzVjJmdzMr?=
 =?utf-8?B?ZWM1QnUvelphb3J1bGpRWjAyYlZZWC9XcGNia0NMajBPRGpBSVJ2K1F6MFJs?=
 =?utf-8?B?Nmt5T1pZV3NqclJmTUFpMGxQUWZiZTJPOFg3T3NEMk9JeGNBQlRWdDdiSzZa?=
 =?utf-8?B?SXlJWVRvNDhFSTJwdDdwc0dPNE1WR2tIOVlxZVpoRVdUN2tKNFdZRW45L3Q5?=
 =?utf-8?B?cmFielR1aTF6WW9ZNDZzSXA5MmFRaXBGbWtQUHFXYUZPbFV4UXZGeC8xMFQw?=
 =?utf-8?B?cE85RDk4d24xQWdNbmFVdnR4UXNaWit3VnhEaDVqanlnaWU3dW1BWlhTcE9i?=
 =?utf-8?B?b3dnZTl4SjRhcmUranU1Z0s4ZHlPQlN5cGdWMTFHUXJGcG9yNG5maC9TZWQ3?=
 =?utf-8?B?K3JlTE9QWHB0ZWlkNElCbWI2Z3gwaHEydWRsRURFdUdjN0U0WWFvSWRqMDdm?=
 =?utf-8?B?QStyMktQV2UxOExMOHpiN0hhV0p5NEg5cFpIaUN4WG5sT1dOSGRHSFdUNEFU?=
 =?utf-8?B?WU9wZmVmWCtJTjdsTkNYeEFRRnVwMDRVVlkvcmMwNHdsbWd3cmhsNk15RWFF?=
 =?utf-8?B?S0VKQ2JJTjVsSzhnQTIvR01ORlh1TDNKTWRNYzlZaCswVWxUdkR4ODJYWjA1?=
 =?utf-8?B?SDFjSHEvR1dKOG1SV2JjdjhSc2ttZzh1RmFHL212dkF5UC9nMndmc0R1U0FJ?=
 =?utf-8?B?RW8xbC9qSnQva1BYM0hzMFAyZ1c3bTRXNEtRWnhBd09ZazlZR2s2dDZjWXRL?=
 =?utf-8?B?MGh0MWdET0hUcW1OM1p3ZlhROTFNTHdoOGJtemdySkFKKzkxY20ydXFoZGV6?=
 =?utf-8?Q?+2OgIoZM8WzM9zdWEJqpGJgfdzTegyfF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE54RUxLR0d4d1h1NG91NzVJckJRNFJYTHJaK1hxRDZKOE5WU1Y2cmdaWFB4?=
 =?utf-8?B?NlRZdUI4TDI2L0p5UWFsNEhuSjV4S1dYdkhOcTB6VEFTTXdYa0JaWVFGMS9t?=
 =?utf-8?B?RFVnTG9pT1BRMUVvbVdzWEJ0Nk5LeEo4K2dzNzQ1aXBFdUhTZ2RJNUt3eS9S?=
 =?utf-8?B?VCtLQVlReklncVBvUGpqTXNLMlZ4T3pUaTl1YTQ5ZG5KN2toRTJXVGV6RjlS?=
 =?utf-8?B?ZWpFaWErTkRPRVU5OHo5RGw1MlRTOSs4aTl3VmpDTnpRaGdOQ2xMRncySHRz?=
 =?utf-8?B?U0IvcFJ5WGVNWDROYW9ibW9jZVJDaW1mSm9hU2ZIeG5JYmxFeWZndUlzOXZs?=
 =?utf-8?B?M2RKVjByNGZXUVJqczFKdjRLTDZuSVFaSlI0bytGclNsbnhPNkpxT1U0V1Ni?=
 =?utf-8?B?NUV3VkJuaVZabk9NaFV6ZVlYQVhqT3N1TDMrV043YVY5MmFxOEQrcEFRS2oz?=
 =?utf-8?B?NGNiWUtHcUFlY3JSOUwyREl5WDYwczZWdW9ObEV2VWhQb0tlU0tVUDJ3aTJJ?=
 =?utf-8?B?TU5nVHhFUisxYXRIRlBiZmFrOXV6VVVQdXdSQXZjczlBeFltR1UzdFQ3RStz?=
 =?utf-8?B?WGFldmhVd3Jzb3V5bHd2QlNzSFUwbGU3dURRQk9Oc2Y1MUNiSk55SHhBRUxI?=
 =?utf-8?B?ejdiOERnUlN2OFR1azBFZXl1a3VQcGs3aS9za3ZnY2JkbTBtWExLYUxBejZ3?=
 =?utf-8?B?MUNya3FHZzhHMFhyazdMbWFZRGZQbUpwYmJ4U2lCSHVKOEJGRHNaTE1pZndz?=
 =?utf-8?B?N1ZOdWd4YUdxSGdxRTZ6dG5sS3BOaXFzSGk3V0F0UGJXVlB1cWJrWi9mb05p?=
 =?utf-8?B?MS95KzFCOEdsZ0RDQmREVmNMQXNSNnVHaHpsRVJWWDFMK1AwRDVRdmVESis3?=
 =?utf-8?B?SXlmcXFCRWk5S3F6ZGhSS3hWbVpEUzVidkhqUTQrSEhOTlVvdmlKWEV5aXBy?=
 =?utf-8?B?c3ZNd2ZSSzBzSXZlcy85blFRaEVnQUdUa1NZUjFmakNOak5mQkVyYWc5Qys5?=
 =?utf-8?B?ZzQyRVhYRFpYNjFjZXlkVGh2NmEvT1hpZm5IUUhPSUNISjBiYnhSL0NOM1k2?=
 =?utf-8?B?QkVqTGt1ZVh0dEtEZXRpSUFFWXRFbzZBVk0xK0U4TUJTV1RmNDRwcCs4aEtr?=
 =?utf-8?B?VWtzZ2tSQjQ3enlkSmhKQ3pRc0NsVy90Y2FKOUhtZk5PQlg5QnpDcmVSS1hY?=
 =?utf-8?B?RHpnN1BubGxqSzJIbSt5L3ZTNEVpeS9VZ1ZjM05ZTUpzeHJEK1FsQXJaZUNN?=
 =?utf-8?B?bEMzNHFUVFVSK0hUQzRKL1czaitvblBuTmVxT2Z1NGVabUp3S1VONUhTbGNG?=
 =?utf-8?B?RzVwYkpQcGhwWE1sYzZndVNIWVBOSy8ydHdyWUVrcXNxdHRVdWJYMTdXRkhY?=
 =?utf-8?B?VGVwS2RIdEtSM2U3THhyYm9IVVFwaTFhSi8xbFRadWN0VDkxbllPanQ3R1NM?=
 =?utf-8?B?bjREZXNDbDZuVjkwUHQ0WnRONWliSXBJY0lPUWpOR3hIUFNpcVpvVHFQWndj?=
 =?utf-8?B?aFhGN01tN2hsUFk2alBlOTF6MGsxcFpMSElZUHE2aWNuQU1jbktoQ0MvRklO?=
 =?utf-8?B?Z0NCWXB1QWFOOGliWTBKc1B3ZytaY1hER3YxWEJUQTU0NDc3OWdBa2VMRERK?=
 =?utf-8?B?cmRSUFovKzU0Y2J1NndjeDlWdXV0RFJtNzVpaFRSb2EzdytKdVU2anZVbkdp?=
 =?utf-8?B?MFBIR1NlUUVCcnVXcnI3UnZWb3RJSFhwcThLZDBRK2JwNEI3enViVEc2U3pj?=
 =?utf-8?B?S2VoYkNmUXBkU2hqYTFUeVRwS0NIaUdpcDJQY25iTGl4dU55OU9tWWRXWVBl?=
 =?utf-8?B?VnQ4azNCUmkvN0pia1MvbEpXWGNDam1Da0d2MTdIL2VsaFloUEcvTktWeXZ5?=
 =?utf-8?B?bTUvQnY0QlBydlpzbGFXbEQ0cm1mSkZCQ3l1Y2Q5LzM3VTRSR2hpeTNOTDZB?=
 =?utf-8?B?dXBkamZYM0Y3R1ZtTTgvdng4d0FjcXFZd1JQV095cTN4a3FaQVpHNVF4OUdj?=
 =?utf-8?B?b1VwSXRxRno5KzlvYUcyWW5iWGk4SHMvK0pOUDM1YUh3bkJsVGh3MWZBWW5V?=
 =?utf-8?B?emdKTmZqR3VPc3Z6U1l0bDFwMHd2MkVkMUwrZlVuZUc3NmsvUEZJYXRSMlcz?=
 =?utf-8?B?YXh2K0diSmxQeERJSThpQUxUcGdDcGNxZlo0SUtXVVZsMHJ4WC9hc1B0VGl5?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a0a7a0-18e9-4037-afb0-08de10393a84
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 00:31:51.6383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4sRAKleqoQXprEMAjx/0+lkZIi52xpCwRFl8lpE0mSlW4ctZDgKhbfRaMce+a7K/PXjrqrMX+rApPgeHi5mGgsJ1A1h5xmo8pUyROGZ/9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8370
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

On Mon, Oct 13, 2025 at 12:56:34PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> > The descriptor reuses the KLV format used by GuC and contains metadata
> > that can be used to quickly fail migration when source is incompatible
> > with destination.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |  6 +-
> >  .../gpu/drm/xe/xe_sriov_pf_migration_data.c   | 82 ++++++++++++++++++-
> >  .../gpu/drm/xe/xe_sriov_pf_migration_data.h   |  2 +
> >  3 files changed, 87 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > index 9cc178126cbdc..a0cfac456ba0b 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > @@ -186,10 +186,14 @@ xe_sriov_pf_migration_consume(struct xe_device *xe, unsigned int vfid)
> >  static int pf_handle_descriptor(struct xe_device *xe, unsigned int vfid,
> >  				struct xe_sriov_pf_migration_data *data)
> >  {
> > +	int ret;
> > +
> >  	if (data->tile != 0 || data->gt != 0)
> >  		return -EINVAL;
> >  
> > -	xe_sriov_pf_migration_data_free(data);
> > +	ret = xe_sriov_pf_migration_data_process_desc(xe, vfid, data);
> > +	if (ret)
> > +		return ret;
> >  
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> > index 9a2777dcf9a6b..307b16b027a5e 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include "xe_bo.h"
> >  #include "xe_device.h"
> > +#include "xe_guc_klv_helpers.h"
> >  #include "xe_sriov_pf_helpers.h"
> >  #include "xe_sriov_pf_migration.h"
> >  #include "xe_sriov_pf_migration_data.h"
> > @@ -404,11 +405,17 @@ ssize_t xe_sriov_pf_migration_data_write(struct xe_device *xe, unsigned int vfid
> >  	return produced;
> >  }
> >  
> > -#define MIGRATION_DESC_SIZE 4
> > +#define MIGRATION_KLV_DEVICE_DEVID_KEY	0xf001u
> > +#define MIGRATION_KLV_DEVICE_DEVID_LEN	1u
> > +#define MIGRATION_KLV_DEVICE_REVID_KEY	0xf002u
> > +#define MIGRATION_KLV_DEVICE_REVID_LEN	1u
> 
> as we aim to have unique KLVs across GuC ABI, maybe we should ask GuC team to reserve some KLVs range (0xf000-0xffff) for our (driver) use ?

I'll start the discussion.

> 
> > +
> > +#define MIGRATION_DESC_DWORDS 4
> 
> maybe:
> 	(GUC_KLV_LEN_MIN + MIGRATION_KLV_DEVICE_DEVID_LEN +
> 	 GUC_KLV_LEN_MIN + MIGRATION_KLV_DEVICE_REVID_LEN)

Ok.

> 
> >  static size_t pf_desc_init(struct xe_device *xe, unsigned int vfid)
> >  {
> >  	struct xe_sriov_pf_migration_data **desc = pf_pick_descriptor(xe, vfid);
> >  	struct xe_sriov_pf_migration_data *data;
> > +	u32 *klvs;
> >  	int ret;
> >  
> >  	data = xe_sriov_pf_migration_data_alloc(xe);
> > @@ -416,17 +423,88 @@ static size_t pf_desc_init(struct xe_device *xe, unsigned int vfid)
> >  		return -ENOMEM;
> >  
> >  	ret = xe_sriov_pf_migration_data_init(data, 0, 0, XE_SRIOV_MIG_DATA_DESCRIPTOR,
> > -					      0, MIGRATION_DESC_SIZE);
> > +					      0, MIGRATION_DESC_DWORDS * sizeof(u32));
> >  	if (ret) {
> >  		xe_sriov_pf_migration_data_free(data);
> >  		return ret;
> >  	}
> >  
> > +	klvs = data->vaddr;
> > +	*klvs++ = PREP_GUC_KLV_CONST(MIGRATION_KLV_DEVICE_DEVID_KEY,
> > +				     MIGRATION_KLV_DEVICE_DEVID_LEN);
> > +	*klvs++ = xe->info.devid;
> > +	*klvs++ = PREP_GUC_KLV_CONST(MIGRATION_KLV_DEVICE_REVID_KEY,
> > +				     MIGRATION_KLV_DEVICE_REVID_LEN);
> > +	*klvs++ = xe->info.revid;
> > +
> >  	*desc = data;
> >  
> >  	return 0;
> >  }
> >  
> > +/**
> > + * xe_sriov_pf_migration_data_process_desc() - Process migration data descriptor.
> > + * @gt: the &struct xe_device
> 
> @xe

Ok.

> 
> > + * @vfid: the VF identifier
> > + * @data: the &struct xe_sriov_pf_migration_data containing the descriptor
> > + *
> > + * The descriptor uses the same KLV format as GuC, and contains metadata used for
> > + * checking migration data compatibility.
> > + *
> > + * Return: 0 on success, -errno on failure
> > + */
> > +int xe_sriov_pf_migration_data_process_desc(struct xe_device *xe, unsigned int vfid,
> > +					    struct xe_sriov_pf_migration_data *data)
> > +{
> > +	u32 num_dwords = data->size / sizeof(u32);
> > +	u32 *klvs = data->vaddr;
> > +
> > +	xe_assert(xe, data->type == XE_SRIOV_MIG_DATA_DESCRIPTOR);
> > +	if (data->size % sizeof(u32) != 0)
> > +		return -EINVAL;
> > +	if (data->size != num_dwords * sizeof(u32))
> > +		return -EINVAL;
> 
> isn't that redundant ?

It is - will remove.

> 
> > +
> > +	while (num_dwords >= GUC_KLV_LEN_MIN) {
> > +		u32 key = FIELD_GET(GUC_KLV_0_KEY, klvs[0]);
> > +		u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
> > +
> > +		klvs += GUC_KLV_LEN_MIN;
> > +		num_dwords -= GUC_KLV_LEN_MIN;
> > +
> > +		switch (key) {
> > +		case MIGRATION_KLV_DEVICE_DEVID_KEY:
> > +			if (*klvs != xe->info.devid) {
> > +				xe_sriov_info(xe,
> 
> maybe it should be more that info() ?

Promoted to warn().

Thanks,
-Michał

> 
> > +					      "Aborting migration, devid mismatch %#04x!=%#04x\n",
> > +					      *klvs, xe->info.devid);
> > +				return -ENODEV;
> > +			}
> > +			break;
> > +		case MIGRATION_KLV_DEVICE_REVID_KEY:
> > +			if (*klvs != xe->info.revid) {
> > +				xe_sriov_info(xe,
> > +					      "Aborting migration, revid mismatch %#04x!=%#04x\n",
> > +					      *klvs, xe->info.revid);
> > +				return -ENODEV;
> > +			}
> > +			break;
> > +		default:
> > +			xe_sriov_dbg(xe,
> > +				     "Unknown migration descriptor key %#06x - skipping\n", key);
> > +			break;
> > +		}
> > +
> > +		if (len > num_dwords)
> > +			return -EINVAL;
> > +
> > +		klvs += len;
> > +		num_dwords -= len;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static void pf_pending_init(struct xe_device *xe, unsigned int vfid)
> >  {
> >  	struct xe_sriov_pf_migration_data **data = pf_pick_pending(xe, vfid);
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> > index 5b96c7f224002..7cfd61005c00f 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> > @@ -32,6 +32,8 @@ ssize_t xe_sriov_pf_migration_data_read(struct xe_device *xe, unsigned int vfid,
> >  					char __user *buf, size_t len);
> >  ssize_t xe_sriov_pf_migration_data_write(struct xe_device *xe, unsigned int vfid,
> >  					 const char __user *buf, size_t len);
> > +int xe_sriov_pf_migration_data_process_desc(struct xe_device *xe, unsigned int vfid,
> > +					    struct xe_sriov_pf_migration_data *data);
> >  int xe_sriov_pf_migration_data_save_init(struct xe_device *xe, unsigned int vfid);
> >  
> >  #endif
> 
