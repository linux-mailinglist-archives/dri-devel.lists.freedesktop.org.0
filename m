Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF53AC3A650
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 11:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69A110E88D;
	Thu,  6 Nov 2025 10:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zh3QX2tj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6093F10E028;
 Thu,  6 Nov 2025 10:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762426547; x=1793962547;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HxPSdl7Uu18Smp0saZe/Nk05pqgkr/QPN3gbn2YwWbU=;
 b=Zh3QX2tj3ow0ouKg+4vCluFz99qBbraQTb4jLvwCU1d1/He2Jitp5TfW
 t1Q4kr1MCrHa51vrYutwwDOx34qMcfOTKLEJ1CVR1b9qQO/Wa02SuThRS
 bNYkUzppMzbVTVXZp68fYJaUYFCLN2r+X+vtiz/06nWhcOhLC3wPikHBe
 viiB0IdW/1QzLRjlY6qGHNm4eR9OPRiGYUJgQIrFhY0CtKGpj9a/aQT8Q
 54/lQtr85pn39FH+hBCQe9aQtGyfSIPd6AuQjYSuQ8nKA4wZOEBHGiIbq
 3mcvpCFG+35BwYk1i3zXErY45swWNNCCUpApsTZOWH45ZXCTNuaxgHYBv Q==;
X-CSE-ConnectionGUID: HGQN7oYTTU2p6MYmVKQNgA==
X-CSE-MsgGUID: Rrd2WJ9XSa2mKNLfEeaY7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="68419080"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="68419080"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:55:46 -0800
X-CSE-ConnectionGUID: zNUkXAjtSDi9Rk9R6DgtkA==
X-CSE-MsgGUID: LkNVgtZSRe6oUTYTxrHClg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="188173796"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:55:46 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 02:55:45 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 02:55:45 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 02:55:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioLKU6syd8EhA92qpm+fDyqWBf5b2iXq+C051IuFHiKwVJtvsAscySY2iR5m2rMqJD2Jz6VcUG5xRTJTbr6R7Cva4W3SE4+odOrDK5DokyxGqVLhtERwjNUUlfRaXCvp1SSXarRkv6z1CDJ9WdAKG3xZR2l4XGXjHfQDf4LDBFPb+o6xB5hZOVpDUYoNnc7Ygb3GYq1/Lqir5R7744M7OdaKQBlPtecqc/MAS8m6Kxl61mU+z6w6hDZEt3JOEHTQElytzLTSqhiNlBOpeO+7LAU40WCfXKHpUof3C6duy/CjYAYw7vmHHXgohh2HJqiT35h76gUHHGhDshKDQ+u1/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipSNJgp6oEyIkusnbuZvXVe3RThU07fjI92yJfdJGU0=;
 b=hRSeV/25CFe5MyBYGDB0/NJ9+hSzp0tVxO0gFBococ6PHMTudwuh8uns0ElvclYJvicbAucnGQ/TNZCqfFCfKj7uUqkeIicL2h0+WgmUIFsfMx8V+AloEGjmjtT2OGRcaXNRiT/BdAjlGVAGMbmDu/QLp0UvL20ERUMmI3TI/+r30Vdsktzd1/zRrhnG6v1WrQGKZnM+l2tj8YLUSTxpPNcPKuJ2rL6iKDj8NJZBUgDQoMsLuExM710nZf4r1xRHQiqGKxQlshpnowvvSig+Vi1yyWF/T9ZosX98W/Qmw2qSudnK9CnzdJXSvOFb5rJNFANLFJI3HqjDYIyk6o7lPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB7047.namprd11.prod.outlook.com (2603:10b6:510:215::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.7; Thu, 6 Nov 2025 10:55:43 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 10:55:43 +0000
Date: Thu, 6 Nov 2025 11:55:38 +0100
From: "Winiarski, Michal" <michal.winiarski@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: Alex Williamson <alex@shazbot.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, "Shameer
 Kolothum" <skolothumtho@nvidia.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, "Laguna, Lukasz" <lukasz.laguna@intel.com>, "Christoph
 Hellwig" <hch@infradead.org>
Subject: Re: [PATCH v4 28/28] vfio/xe: Add device specific vfio_pci driver
 variant for Intel graphics
Message-ID: <7dtl5qum4mfgjosj2mkfqu5u5tu7p2roi2et3env4lhrccmiqi@asemffaeeflr>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
 <20251105151027.540712-29-michal.winiarski@intel.com>
 <BN9PR11MB52766F70E2D8FD19C154CE958CC2A@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BN9PR11MB52766F70E2D8FD19C154CE958CC2A@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: BE1P281CA0294.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB7047:EE_
X-MS-Office365-Filtering-Correlation-Id: 1611ea9a-cd86-45c1-afae-08de1d230769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWNIdXUzMFpvRW9jQ2ZJei9EdlovRVZaUUEzVXZkOThCeVVldUdzc1pIRExh?=
 =?utf-8?B?QkF1Z1BMdzE0UmhsZ2lYRGZrdkt4ZWx3MXU1RGdHVHBuaGFVaHhmbHFiZTE2?=
 =?utf-8?B?cTFJZ1pGNVllbjhQL29ZamlqcmtqbUtoM0svZHFJbEhYclBocU0zandlUVFv?=
 =?utf-8?B?bGdpaE5aT1BteGlVWlgxWGdXbTB0cmpCZTVCUFppcUMzOXA4VHZmam4wWTdt?=
 =?utf-8?B?dTJsbW9TbisvTVF5dERKS0V6QUNucm1aaVZKcnZuS09ZYU1tdXlNR1F1dTRm?=
 =?utf-8?B?US9MWjRWOEJUMXBzeGd4eTZBVlJhaTBZSWFWQk9ucG8vWkdHZU1OcHlSTkcr?=
 =?utf-8?B?a3l5c05pUDlQVzNVU21DbkxKaFRUSXJnS1JFZkcvY0Z2K3Z0Y3h1MHQxS2Ez?=
 =?utf-8?B?a1NSMDBJNldPblczeWMwK1dvV3hyYkozZVFaMS9FYnptaEZzSmlLYnNwWGk5?=
 =?utf-8?B?d3laa3NjalBWY3F6TE1NbFRrdGFHd3dRbzV0bGhJNXNBLzd5L1h5NkFLeHN1?=
 =?utf-8?B?NTdZc2RaeFFlL1h4TVJMS1lMK205Q0p1RGRSK0ZDaTFOcUJaVVN5bVFPWXVR?=
 =?utf-8?B?UnhKRUtIL2RlSlNWNXdVTjhhSnVQVjNBZFRvT1p1VjNpMG9TNm16ZnAzcjls?=
 =?utf-8?B?Q2huYTRacUJiK0U1Z25adlp1a1FvNHpNOWEvNVFsZ3ZzZjVwRjluUHc1TUlN?=
 =?utf-8?B?YkVvbnU4cnArK0tKdVZZaTJOOC9kMGRVektLa1YzbWtKa3ZreWd6YmJYK2Mx?=
 =?utf-8?B?eDFRUFU3VjJqeFJDNG9yd3VtMG5UeGNMbEpPWXByZlcrY3piUVRRM3BuVWRh?=
 =?utf-8?B?a0M3YUNCdldBUDhwaUdiUWJvTmlzWFpnb1pUMjB5b01nOXp5Q1ZlemJzYjRX?=
 =?utf-8?B?TERrdkhpaHJvVlUraDVxU2VSYkdvQ2IxS3dzZ21ZcUcwak9HczZRM0F2MmUz?=
 =?utf-8?B?U1NDWVhCVC9PTDBkdlkzdktnWmVIZjQ5Z2xQdmwyV1hKb2tTZEdPODA2dGhS?=
 =?utf-8?B?QkFUZUQ1ZHg1OWdUeGhraXFPYnhKemtSWm1qSmVPakRFMTFTQ2Vva0tkZ3pU?=
 =?utf-8?B?UmZlay9pRWx0TC9JZXlETFdSOHNMbER6M1NxZXo5bG9OOXlDb0tocXpRc2o4?=
 =?utf-8?B?d0pKMmdXN0NhN1lsUjJpeFJtLzBDWWw0WEdjV3lHL2lnVU8yREpEWGJHSlB5?=
 =?utf-8?B?enpXSG4xRkJHZy9KY05McWpqT1c1Tnk4aThMd1kzdXN0L0REVXR5a1lUTnpB?=
 =?utf-8?B?T09tV3VXMXNpUFVXUy9CcXVXU2d5eWErMUVkRlVCVnZ2RWFDN2JJYzhWMmd3?=
 =?utf-8?B?d0tYbEd0TUllVlZuclBlTTJlekN3WFp3L2Z1a1p6TTBtVmQ4d1ZzbU1qVVRK?=
 =?utf-8?B?MlVDMTk2UXFWWkw5cWJSczA0Rjd0T1d3ZTVFVjJXS3ZVNU8rR1E3N0FxVVpI?=
 =?utf-8?B?UjEzTWdGa2lLZCtCc3RsUE9pNjY0Y25NeFZ5VWZTbVQ0a3E4bHI0dlV2VHRG?=
 =?utf-8?B?Q0dJSTVtWUc5T3laUy9VNHY0RkViNSt1VGVXNVVUZ0tFdFJHbXRHWmFYQ2NS?=
 =?utf-8?B?RDFXdDJ0dTA4UUkxUGp6UXppR0hGd3puVVpPemNkUXBXVU5KblZJOXA5cnZa?=
 =?utf-8?B?M2ZxMk1TQ3dOYkRXTDA4bWJPL1RSTkhtYXovbnduMFlEdkxESnQvaklTVUY4?=
 =?utf-8?B?Rkw0UFZGQmNiTWt4RmU0RUloQSs5V0dXbmFUbFlNRGpoYW5NdmFPcWtXc0xS?=
 =?utf-8?B?cytxM3VFazhKd1BkWncxZlZZQ0lpa2toMEs4Nlo0eGlSdnBtenhuYUxVekIv?=
 =?utf-8?B?UnowYWlmNDlZNnlvbTZXZXQrangvajlYS3FkNUZSdWlIWTJKdFQzdFkwOXR4?=
 =?utf-8?B?ZVVwbVV6aTB0SVFrOUF3bUtoR3Z2ajNvQU1wYTM1QmNQUys5VmJiaHNiQmpJ?=
 =?utf-8?B?VXpUNG4yRmZwb2tSQ0xHSVBqT1k1eDV4TlZISU5kRURnanEwdjdxcXhMTnRD?=
 =?utf-8?B?OU1GTHczc1dBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDAvc09zY2tzaEkyL0VFamVVYStHWG9yU1Q2Z2FQOWxOUExRQTVpTVUvd2FW?=
 =?utf-8?B?NEgxU0VzeTh4eU9tNXNUUWNSazBEUXRCK01FMFpNbUFCY3c4ZWFsdmI5T08w?=
 =?utf-8?B?bG4vd1VGZTNQMHVwQ0hBZU1tTzdLNWtKSGN6dE91ZnI5QUlIZUJORXB6RVFX?=
 =?utf-8?B?NUJja0dBZVdTU2l1bWd6ZThTUFVONFJOa0s5KzZ4RGMvZEwwQTVJR1VyOG5O?=
 =?utf-8?B?QUE2azkvOHZDL1lhUWp0cTFHbkR4UVVycXEzUDJCSURydDhhc1ZES0lRK2VO?=
 =?utf-8?B?MW4yOG12a3Rzdi9QU09uSG9GMTJ0Q2paQXFpU3Z6WWVJZTdYVHB1SUNJRmZN?=
 =?utf-8?B?dXh1eDVpV1lxN0RUbzQ1S1VDTzJ2L0Q4bnRoVHU0clpJRWFZcysrMjRaQ1Rs?=
 =?utf-8?B?ak5vSWVnaS9NYzlBd0VIeWZDMERObEtvdVRVUmJpK0NCanZlUGt5R0Qva3NN?=
 =?utf-8?B?NFZsdE9lbnBSRXNvQnpLZTZvMWROODZaZ1pKZnBrb25KQ2tNajhJTWxPOE5v?=
 =?utf-8?B?QUFsZE1odFkzQVpITk02UkoyQjNwdHFFL3R0cHhMOGVTSThrTFhNWXpyakZs?=
 =?utf-8?B?ZGtiRWRlRExCemtxb0o0ZklEeVh1WHZtUTh6cE5teCtBKzRkWkV2cldVVUNZ?=
 =?utf-8?B?b0pHZTV4bjhDcktoT21vcXNNdHBiNHRuV0t1ZmxTd2hMTjM3SGgvZjg2WndJ?=
 =?utf-8?B?TFNYbEJoUGRRV0s4bTRSMWl0Y0hXWVI3dnZJMGsvTjRZOU5IQ3RWazljY1pn?=
 =?utf-8?B?eEdVSGtuejlPSkF6dDg0aG9GU0lsNmZzdW8yMGRySXkvdis5NWZGYmtpSXNq?=
 =?utf-8?B?ekllNmJrRVlEeUpaczRHUU9pWElVN2EySjkyUEhRWmFKSUFOY3hPY3JtRmVt?=
 =?utf-8?B?dkJVVTNpTFNyeVMwdmRwdTdGN2RpdWZ2UE9EMjB3Rktza0pkUVVyMUhVUDhH?=
 =?utf-8?B?NnI2OWhWZ3pheTl3MGxMSEFUdkZ5alB1dFpEQmhjdEZQMnV0TUhibG04L1hM?=
 =?utf-8?B?TXFickRQWUxkQ3I0SlRHM0IyV0NIMCtVNURCa1dWNDFUc0RHVU4rN05xVkgr?=
 =?utf-8?B?eERZR2tFVGNFbmIzNURqU1cvQnAzMFphODNnQVBTWjZHRm5zTHhjaXVtL1Zz?=
 =?utf-8?B?LzROU09GRDVtcFg0Rmk4YWJNN0ROMmU3cWxkZC9hVE1QanQvR2hVQ0QxK1A3?=
 =?utf-8?B?VXBZQm5laVVudXZ4aXRjd3I0bUlkcnpsd1ptSFF0eUt4dGVpN0xjaGRjRW1l?=
 =?utf-8?B?a0IxRWEwa0pkcnRUelM4MWoyNG8veWtKQ0RFdEp0ZnhDMWVHbVhyYXlBWTZ6?=
 =?utf-8?B?UWN5bXRjU1ZYc3A1bVd5OHFOU0psOGRqb1g3djNISWhOVXZHMi9DRXQzT3kx?=
 =?utf-8?B?MjU5K0I4MFBxTVZUWE93cTIweVhOLzdESittUzlJRXJSdU9oaHE3RjBkT2ZV?=
 =?utf-8?B?bDR4OXhhOEtlcGhOeVlVK1hUa0NvRkxJc3ZySnJSWTJiTjJ0QjQrOXFmUzNZ?=
 =?utf-8?B?M0pQUUt5Y3NXQlZ2WFdPY0dCVHJPZGpTK1JaVzVWblB5U09hdldjcnkzL1Ni?=
 =?utf-8?B?UnVCTU5OOUNTWGtZRjdqOTQ3ZTNtNjFkeS9hZjhMVkdRcHZhZWxXdzBNNEJV?=
 =?utf-8?B?MlZtMmZlaU16ZzI4NExKWXczMFdEY3NpVVlOTG1XaFU3Y0g4aEFpY3NGcHJF?=
 =?utf-8?B?akUvT0VHcmlRVWxDZEJRYmRjUUV1Y1FjOHRBSDZqcUp3enZGOWdNV3l0UUUy?=
 =?utf-8?B?UW5iMkh2VXhsZVg1a3RqR0Zhd3pMZlAySUhLUlhwNnh4QWJTR2MvUlJ5Z3ND?=
 =?utf-8?B?SitDeUwraUdxUU1PMFhOU04zY1ZnQkZUSHd5NGg3UGJyam1MYmx4SjBZVXdP?=
 =?utf-8?B?bnZlQXZtZlFvbk9Dcklab00xTllSRmlYaWx4aHFKd1AzSjdqemRTNlNPdnBy?=
 =?utf-8?B?ckZhQVdxVnJ5aVJSZ0FMU3hWai83VGFxdzZITWpIbXcxRGlncXZZeXBzd05Z?=
 =?utf-8?B?NC85WERHTStkdHFPQ0dpNU0rdWZUdUZGK0ZMTWJDcFlkODdaYlVtTlI1Qmlx?=
 =?utf-8?B?WFNQZ0xlV2ZiMmMwYW8rbWZ2bENhQXpsWE1qSi9XSUhhZ2NKRWdwaTMvems2?=
 =?utf-8?B?dzBNdCtUZmw4cWJhNjhQL2JCMXNYN1VxcHpOUjVyV3NWMkRjUElYdUNodjRH?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1611ea9a-cd86-45c1-afae-08de1d230769
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 10:55:42.8444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ya7aTno4xkiBgPaanIXVLOd2cRS3GNrE9RFHaCgdlS+WxKBTPv5bhId4a2RQq3WIn57v0iHixwvCrxGie/yWMsKUB6RnDMJUfBNzN+gBtyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7047
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

On Thu, Nov 06, 2025 at 09:20:36AM +0100, Tian, Kevin wrote:
> > From: Winiarski, Michal <michal.winiarski@intel.com>
> > Sent: Wednesday, November 5, 2025 11:10 PM
> > 
> > In addition to generic VFIO PCI functionality, the driver implements
> > VFIO migration uAPI, allowing userspace to enable migration for Intel
> > Graphics SR-IOV Virtual Functions.
> > The driver binds to VF device, and uses API exposed by Xe driver bound
> > to PF device to control VF device state and transfer the migration data.
> 
> "The driver binds to VF device and uses API exposed by Xe driver to
> transfer the VF migration data under the control of PF device."

Ok.

> 
> > +config XE_VFIO_PCI
> > +	tristate "VFIO support for Intel Graphics"
> > +	depends on DRM_XE
> > +	select VFIO_PCI_CORE
> > +	help
> > +	  This option enables vendor-specific VFIO driver for Intel Graphics.
> > +	  In addition to generic VFIO PCI functionality, it implements VFIO
> > +	  migration uAPI allowing userspace to enable migration for
> > +	  Intel Graphics SR-IOV Virtual Functions supported by the Xe driver.
> 
> hmm another "vendor-specific"...

Ooops. I'll switch to "device specific driver variant" naming here as
well.

> 
> > +struct xe_vfio_pci_core_device {
> > +	struct vfio_pci_core_device core_device;
> > +	struct xe_device *xe;
> > +	/* VF number used by PF, Xe HW/FW components use vfid indexing
> > starting from 1 */
> 
> Having both PF and Xe HW/FW is a bit noising. could be:
> 
> /* PF internal control uses vfid index starting from 1 */

Ok.

> 
> > +
> > +static void xe_vfio_pci_state_mutex_lock(struct xe_vfio_pci_core_device
> > *xe_vdev)
> > +{
> > +	mutex_lock(&xe_vdev->state_mutex);
> > +}
> > +
> > +/*
> > + * This function is called in all state_mutex unlock cases to
> > + * handle a 'deferred_reset' if exists.
> > + */
> > +static void xe_vfio_pci_state_mutex_unlock(struct xe_vfio_pci_core_device
> > *xe_vdev)
> > +{
> > +again:
> > +	spin_lock(&xe_vdev->reset_lock);
> > +	if (xe_vdev->deferred_reset) {
> > +		xe_vdev->deferred_reset = false;
> > +		spin_unlock(&xe_vdev->reset_lock);
> > +		xe_vfio_pci_reset(xe_vdev);
> > +		goto again;
> > +	}
> > +	mutex_unlock(&xe_vdev->state_mutex);
> > +	spin_unlock(&xe_vdev->reset_lock);
> > +}
> 
> this deferred_reset logic is a mlx unique thing. See:
> 
> https://lore.kernel.org/kvm/20240220132459.GM13330@nvidia.com/

Interesting, that doesn't match my observations.

[] ======================================================
[] WARNING: possible circular locking dependency detected
[] 6.18.0-rc3-xe+ #90 Tainted: G S   U
[] ------------------------------------------------------
[] qemu-system-x86/4375 is trying to acquire lock:
[] ff1100015af3ec30 (&migf->lock){+.+.}-{3:3}, at: xe_vfio_pci_set_device_state+0x22b/0x440 [xe_vfio_pci]
[]
   but task is already holding lock:
[] ff1100014c541a58 (&xe_vdev->state_mutex){+.+.}-{3:3}, at: xe_vfio_pci_set_device_state+0x43/0x440 [xe_vfio_pci]
[]
   which lock already depends on the new lock.

[]
   the existing dependency chain (in reverse order) is:
[]
   -> #3 (&xe_vdev->state_mutex){+.+.}-{3:3}:
[]        __mutex_lock+0xba/0x1110
[]        mutex_lock_nested+0x1b/0x30
[]        xe_vfio_pci_reset_done+0x2b/0xc0 [xe_vfio_pci]
[]        pci_try_reset_function+0xd7/0x150
[]        vfio_pci_core_ioctl+0x7f1/0xf20 [vfio_pci_core]
[]        vfio_device_fops_unl_ioctl+0x163/0x310 [vfio]
[]        __se_sys_ioctl+0x71/0xc0
[]        __x64_sys_ioctl+0x1d/0x30
[]        x64_sys_call+0x6ac/0xe50
[]        do_syscall_64+0xa1/0x560
[]        entry_SYSCALL_64_after_hwframe+0x4b/0x53
[]
   -> #2 (&vdev->memory_lock){++++}-{3:3}:
[]        down_read+0x41/0x180
[]        vfio_pci_mmap_huge_fault+0xec/0x310 [vfio_pci_core]
[]        handle_mm_fault+0x8aa/0x13b0
[]        fixup_user_fault+0x124/0x280
[]        vaddr_get_pfns+0x1d2/0x420 [vfio_iommu_type1]
[]        vfio_pin_pages_remote+0x173/0x610 [vfio_iommu_type1]
[]        vfio_pin_map_dma+0xfd/0x340 [vfio_iommu_type1]
[]        vfio_iommu_type1_ioctl+0xfdf/0x1290 [vfio_iommu_type1]
[]        vfio_fops_unl_ioctl+0x106/0x340 [vfio]
[]        __se_sys_ioctl+0x71/0xc0
[]        __x64_sys_ioctl+0x1d/0x30
[]        x64_sys_call+0x6ac/0xe50
[]        do_syscall_64+0xa1/0x560
[]        entry_SYSCALL_64_after_hwframe+0x4b/0x53
[]
   -> #1 (&mm->mmap_lock){++++}-{3:3}:
[]        __might_fault+0x56/0x90
[]        _copy_to_user+0x23/0x70
[]        xe_sriov_migration_data_read+0x17b/0x3f0 [xe]
[]        xe_sriov_vfio_data_read+0x44/0x60 [xe]
[]        xe_vfio_pci_save_read+0x55/0x80 [xe_vfio_pci]
[]        vfs_read+0xc0/0x300
[]        ksys_read+0x79/0xf0
[]        __x64_sys_read+0x1b/0x30
[]        x64_sys_call+0xcc4/0xe50
[]        do_syscall_64+0xa1/0x560
[]        entry_SYSCALL_64_after_hwframe+0x4b/0x53
[]
   -> #0 (&migf->lock){+.+.}-{3:3}:
[]        __lock_acquire+0x1aff/0x3450
[]        lock_acquire+0xde/0x280
[]        __mutex_lock+0xba/0x1110
[]        mutex_lock_nested+0x1b/0x30
[]        xe_vfio_pci_set_device_state+0x22b/0x440 [xe_vfio_pci]
[]        vfio_ioctl_device_feature_mig_device_state+0x9c/0x1b0 [vfio]
[]        vfio_device_fops_unl_ioctl+0x289/0x310 [vfio]
[]        __se_sys_ioctl+0x71/0xc0
[]        __x64_sys_ioctl+0x1d/0x30
[]        x64_sys_call+0x6ac/0xe50
[]        do_syscall_64+0xa1/0x560
[]        entry_SYSCALL_64_after_hwframe+0x4b/0x53
[]
   other info that might help us debug this:

[] Chain exists of:
     &migf->lock --> &vdev->memory_lock --> &xe_vdev->state_mutex

[]  Possible unsafe locking scenario:

[]        CPU0                    CPU1
[]        ----                    ----
[]   lock(&xe_vdev->state_mutex);
[]                                lock(&vdev->memory_lock);
[]                                lock(&xe_vdev->state_mutex);
[]   lock(&migf->lock);
[]
    *** DEADLOCK ***

[] 1 lock held by qemu-system-x86/4375:
[]  #0: ff1100014c541a58 (&xe_vdev->state_mutex){+.+.}-{3:3}, at: xe_vfio_pci_set_device_state+0x43/0x440 [xe_vfio_pci]
[]
   stack backtrace:
[] CPU: 18 UID: 0 PID: 4375 Comm: qemu-system-x86 Tainted: G S   U              6.18.0-rc3-xe+ #90 PREEMPT(voluntary)
[] Tainted: [S]=CPU_OUT_OF_SPEC, [U]=USER
[] Hardware name: Intel Corporation WHITLEY/WHITLEY, BIOS SE5C6200.86B.0027.P18.2206090856 06/09/2022
[] Call Trace:
[]  <TASK>
[]  __dump_stack+0x19/0x30
[]  dump_stack_lvl+0x66/0x90
[]  dump_stack+0x10/0x14
[]  print_circular_bug+0x2fd/0x310
[]  check_noncircular+0x139/0x160
[]  __lock_acquire+0x1aff/0x3450
[]  ? vprintk_emit+0x3ec/0x560
[]  ? dev_vprintk_emit+0x162/0x1c0
[]  lock_acquire+0xde/0x280
[]  ? xe_vfio_pci_set_device_state+0x22b/0x440 [xe_vfio_pci]
[]  ? xe_vfio_pci_set_device_state+0x22b/0x440 [xe_vfio_pci]
[]  __mutex_lock+0xba/0x1110
[]  ? xe_vfio_pci_set_device_state+0x22b/0x440 [xe_vfio_pci]
[]  mutex_lock_nested+0x1b/0x30
[]  xe_vfio_pci_set_device_state+0x22b/0x440 [xe_vfio_pci]
[]  vfio_ioctl_device_feature_mig_device_state+0x9c/0x1b0 [vfio]
[]  vfio_device_fops_unl_ioctl+0x289/0x310 [vfio]
[]  __se_sys_ioctl+0x71/0xc0
[]  ? entry_SYSCALL_64_after_hwframe+0x4b/0x53
[]  __x64_sys_ioctl+0x1d/0x30
[]  x64_sys_call+0x6ac/0xe50
[]  do_syscall_64+0xa1/0x560
[]  ? __lock_acquire+0x73f/0x3450
[]  ? __lock_acquire+0x73f/0x3450
[]  ? __lock_acquire+0x73f/0x3450
[]  ? lock_release+0x10b/0x340
[]  ? wp_page_reuse+0x82/0x100
[]  ? lock_release+0x10b/0x340
[]  ? wp_page_reuse+0xcc/0x100
[]  ? lock_acquire+0xde/0x280
[]  ? count_memcg_event_mm+0x20/0x170
[]  ? lock_is_held_type+0x8f/0x140
[]  ? lock_release+0x10b/0x340
[]  ? count_memcg_event_mm+0x20/0x170
[]  ? count_memcg_event_mm+0x20/0x170
[]  ? count_memcg_event_mm+0x20/0x170
[]  ? count_memcg_event_mm+0x114/0x170
[]  ? handle_mm_fault+0x1300/0x13b0
[]  ? handle_mm_fault+0x3c/0x13b0
[]  ? lock_vma_under_rcu+0x8c/0x230
[]  ? lock_release+0x10b/0x340
[]  ? exc_page_fault+0x77/0xf0
[]  ? irqentry_exit_to_user_mode+0x100/0x130
[]  ? irqentry_exit+0x31/0x80
[]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
[] RIP: 0033:0x70dff032eb1d
[] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
[] RSP: 002b:00007ffcc0367ff0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[] RAX: ffffffffffffffda RBX: 00005748e046d600 RCX: 000070dff032eb1d
[] RDX: 00007ffcc0368080 RSI: 0000000000003b75 RDI: 000000000000001d
[] RBP: 00007ffcc0368040 R08: 00000005748df663 R09: 0000000000000007
[] R10: 00005748df663060 R11: 0000000000000246 R12: 0000000000000001
[] R13: 0000000000000000 R14: 00005748e055f0b0 R15: 00007ffcc0368080
[]  </TASK>

In short:

0: set_device_state
xe_vdev->state_mutex : migf->lock
1: data_read
migf->lock : mm->mmap_lock
2: vfio_pin_dma
mm->mmap_lock : vdev->memory_lock
3: vfio_pci_ioctl_reset
vdev->memory_lock : xe_vdev->state_mutex

In other words:
set_device_state takes xe_vdev->state_mutex and blocks on migf->lock,
data_read takes migf->lock and blocks on mm->mmap_lock
vfio_pin_dma takes mm->mmap_lock and blocks on vdev->memory_lock
reset takes vdev->memory_lock and blocks on xe_vdev->state_mutex

copy_to_user/copy_from_user doesn't have to be called under state_mutex,
it just needs to be taken under migf->lock.
The deferred reset trick exists because migf->lock needs to be taken
under state_mutex as part of reset_done callback, which completes the
chain and triggers the lockdep splat.

To me, it looks like something generic, that will have impact on any
device specific driver variant.
What am I missing?

I wonder if drivers that don't implement the deferred reset trick were
ever executed with lockdep enabled.

(BTW: Looking at it in more depth again - I do need to revisit the
disable_fd flow on xe-vfio-pci side, so do expect small changes on that
front in next revision)

Thanks,
-Michał
