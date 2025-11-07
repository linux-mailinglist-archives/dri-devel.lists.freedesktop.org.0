Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70580C3F461
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 10:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FE710EA59;
	Fri,  7 Nov 2025 09:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XGCNyWGu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DDA10EA5A;
 Fri,  7 Nov 2025 09:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762509302; x=1794045302;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uXxxRpEehkEy6yyOIvFDKCBN12AvCMZ21g1wZk9muwc=;
 b=XGCNyWGugiZzxu86TbmqbYVQnAMB+NRqfXjwQMkPCCzse6Eg0l/TNndM
 sYcPHjmTAtkjtmpCbOxRWg0teU1Q9pRiNo4a/1untfkquAWvhmtO3Fzlp
 cVbTIACDMHiIf/yEcrhWXCuU8BeWSsR2bvAL0JA1JES0KpWlV8oTE6Q5O
 wlsHl0hmG74EXVzSiJmozVRIAZ7YO59xZCmranyQThvurS739Ycy8OtpZ
 tw3mQd6fHQ+XJRXbOVmrmZkel8tTZfw3ms4O+2Aw5FaekQUiyH3h+l0ZW
 oEdQKusyrTgJZM+zr6Qmt5/aiCzIRVtrNVUl34VRSfr1MHO2AQPMV0gw6 w==;
X-CSE-ConnectionGUID: AnGKqDM0Sx2qc9hEHOoB8g==
X-CSE-MsgGUID: PLI042rISMeUaOTMhsUB3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="82059654"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="82059654"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 01:55:01 -0800
X-CSE-ConnectionGUID: nudYGQXtRqaO9yfULISL1g==
X-CSE-MsgGUID: byN5QIWmR+2A8j8gT3PD+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="218742570"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 01:55:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 01:54:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 01:54:58 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.35)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 01:54:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JcNyI2av84GWyiyfTSTvV0/TsjAFRtfaWhpAAhtJFeMlJ+7biodQ8Yx7XdnHlr8tpNbT2p33Khjd84/FanmlorQDUxlAqFYPWC26tNPvwvAKor9QHLpNG4cH2QDE0hFFsheGiYrzbNc7vDLFqp9fGQC3kgaSYbenf2zmsxsLZWh66AEdEaJj1xL2QHmCbgzm+idi50jrv9GIJ3wRTKzn1UjPjzH4FQjLsDS8GCsvl0JJrTJwbV8C39EPV/shdnEp+qWxmwGBzYObAWTODxmcGMtW5c01IKDxhuOn9VAgeg/tbCwHVVzJfSgb2EDOqKs/1XBCVnbUvj/fRYiGcZgJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uAxTbvaf+8corwrAxdx/KZkoYQQ8neMlgEKudiQ3dQ=;
 b=cf+Avf08/1ahWiNU4ynJjzjzspLJAPKcnDFfQeIdPqSpKnGIP93jA3NPDgh3SELapOpFiFduL1YTD7o17iWOT4G6ivuCeOcOCWAmIimrg87mhsbjRRUaOBYdF7o0LUrXQRwKqAsVtigJbnG52tThIiM2jmPc41U1U9jr0AuxApfel4XiMd/2/CiNfQG5TsA2dFnUiET/MA9b1/lzIpF0zshYMFSw29ktlGjmSyVklvmq2vLLVQcb65/dWJJEiYciY6EbUCXpWlVf8bzTh/PO0w9uNdY849W7YGN0fcRhS3h/G+Ruteb23MI77xgu+PQvitKg/vABYvtWpCfUy8N/uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5365.namprd11.prod.outlook.com (2603:10b6:208:308::18)
 by SA2PR11MB4876.namprd11.prod.outlook.com (2603:10b6:806:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 7 Nov
 2025 09:54:56 +0000
Received: from BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::8637:9cfc:1235:8987]) by BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::8637:9cfc:1235:8987%4]) with mapi id 15.20.9298.012; Fri, 7 Nov 2025
 09:54:56 +0000
Date: Fri, 7 Nov 2025 10:54:25 +0100
From: "Winiarski, Michal" <michal.winiarski@intel.com>
To: "Muqthyar Ahmed, Syed Abdul" <syed.abdul.muqthyar.ahmed@intel.com>
CC: Alex Williamson <alex@shazbot.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Laguna,
 Lukasz" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 28/28] vfio/xe: Add device specific vfio_pci driver
 variant for Intel graphics
Message-ID: <cp7slxgwbevlgifr76z2ldqihcukte6vrcr7dquat4pqmcr2ri@x3qwjrfkcmzl>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-29-michal.winiarski@intel.com>
 <DS7PR11MB6104D1246DA5ED88325D2686EEC3A@DS7PR11MB6104.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS7PR11MB6104D1246DA5ED88325D2686EEC3A@DS7PR11MB6104.namprd11.prod.outlook.com>
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5365:EE_|SA2PR11MB4876:EE_
X-MS-Office365-Filtering-Correlation-Id: 984fef5c-8c6a-4560-8cba-08de1de3a8b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d042b0s1WjBvK3ZEdWJDcFZJNmlKWnkyNWUyS0pEZ0c0MkdkdUkvRXJhd3lq?=
 =?utf-8?B?S1VCNG9oeWFGbmtwNy80WEpHbjE2K05tMnJxQ3EyWDdCeXJCdTkyblp5VW5j?=
 =?utf-8?B?YWNXa21iVC9XcXIwdmVkeUxad1pHMVAzMWUycWJPcWNraWRKcE1HazRONFF6?=
 =?utf-8?B?cFFvRGo3VGdvdmJaRkdxZUNEdm15eVZ5U2toelRlYWhUeUpuRmh1Q2FmUWFL?=
 =?utf-8?B?WThPMTJ2TlBlM2NIbS94dUw1M3NsRC9IYlVzVzBzdWRGN2tMQU9tOXpWWnhz?=
 =?utf-8?B?OVNhY2hQMHhXUFFReERwN2RPNWtrUmtuOWk5c25UUE1LZnhmSjNVZXdMK2dJ?=
 =?utf-8?B?b1Z4MHZRRWJ2bjVsc0J4SWs5VkVNazlhSnZveEtSZXU5cTVOaWVDRUFFbGxI?=
 =?utf-8?B?SmFiZ0gweXY1ODVRbTZGaU0wd2FNMWlvZXV5QmNybjREM2l1MTh6d1VENkE3?=
 =?utf-8?B?Zmk5YlVNSCtVbTFEazMxUmVSY0NQQlVNbnI1REZST3BTREdCd1pacVBSS1dS?=
 =?utf-8?B?d1hoQklGWENtY3V3aU5nckRoQk9odHpubGFoVmVET1NicGJGSUZDbGtSaXlk?=
 =?utf-8?B?QXBMWjZRcFJDK2Y3VXBiTEs4K0J4bjZwYzV5V21hRUVWQ0J3SVFXdHU4aktE?=
 =?utf-8?B?ZmI2VmVDbE5jRjYvUUovSjBmN2I5dVpZelo3cE1CbC9nQXhEbHMxUWxLMGc4?=
 =?utf-8?B?ZWxwb0crMUVra3E2Wi9yK0pBdXRYQmc2SFVKb05tbTh4ZVJlOTBzZjJnNU9N?=
 =?utf-8?B?cElMRE5ZQWt0K1RseDNVQVpMZHF0UzRNM20yMHJMbEJZYjI1S0tTTXN2alJR?=
 =?utf-8?B?TVlHOVNicjBhays3WjJrM282dTNjbzdRS3doM29LOGJ6MGpSS3ZsMVJPQWUx?=
 =?utf-8?B?QVJ0MU1jbXZZR3ZzT3M4SzZ2R0lOOGNlREdsT3plMkRza1NkNFI3V0ZjOGFy?=
 =?utf-8?B?bzJWbTVhZHJqdHUvKzZuOW9TWEpWZGFZV0s2enRGenJwN2xRZjZBVlVpYUgx?=
 =?utf-8?B?cVdtanE5YVU1VEdGaitERnpBN091eHNUazZSRS9XS0oycXJhZzNVbUo1T3Ax?=
 =?utf-8?B?aGM0WjNrcjhreHptZkhBcStBQ2tXOW9HSnliTVBzSFdDQzZEUTRtajVVeTVS?=
 =?utf-8?B?VVlwZGVhVUEvZlcvaHVieDhDbFdxN04xczJ4UVpuR2N0ZVJORzZNd1VXV3pm?=
 =?utf-8?B?aE5wcjU3VG13aTd2dm1VbVgza2hyYnpjZ3pyZTE1QmVTKzJBS29YcmlDZk4x?=
 =?utf-8?B?YTJ5R0d3Mysxay9pdWptenJuSFhDZ1l3UG5WenlkN0gwcmd2OGZhdis1czhk?=
 =?utf-8?B?Z0d4WlZ1Um5yS3dKaWxvN1oyWFlObWs0Qnhja3lYbEk1RGhaOVZMQ2haYkhn?=
 =?utf-8?B?Z1pad1VWcGxZZDM0NG5aT0FjbXN6cE10ZEVRMVFiQVptREZaR0VHZmxJaE5I?=
 =?utf-8?B?ejI5VHliRjNXWjZjaEVnOCsrZ3hSeHFSRWpaTU9uWnZaVFZjL3NLY3BkSWhQ?=
 =?utf-8?B?SWQvRnBNaHJldlkwMjVxNUV5Q2x6dmwzc1ozeE8yWTJ2NDB4aDkzUGlQbmxN?=
 =?utf-8?B?VisybXJMSUdwTlFGMHFDcEJYdHFXc2ZjN0NFakNqYUJrVUZJckQ1VzZ2ZmRq?=
 =?utf-8?B?YjRQTlZhbTlUQkpDWUtuU1gxSUJYV09ZMklRT0lzaUtmTDRHN2d0bGVhbktF?=
 =?utf-8?B?KzNoZHhQTzJiL00rcEhxWFpKKzdMZGhINDRqeHRhcGxTRk5uZ0UvL0QyZGJ4?=
 =?utf-8?B?a2UxeEh1WHZZL1ByRGFsRWZxR2VLZlgvK2JNZDJlVTdlRDlyY1ZUWnYyajFN?=
 =?utf-8?B?N3dacFM4UGRJY0ltTjhPSVF3MmhDS0ZNdDRmM0VqYXR2elNhTVpHSm4ybHJY?=
 =?utf-8?B?ODJzMXlDckszR1QwZkxlSTBBTm5wOGI1QzBlQ3RxVEh3U3JxMGNEMTQwWTVl?=
 =?utf-8?Q?rPyqFLaAQ9uoZCbaxgoJEgN69sV3DW7U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5365.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm1NcnlBc2xQZUw4bWdyVVByY3dtMDZYMnR6Ymt1MngvT1IwRzAxbTNMNVVZ?=
 =?utf-8?B?cWRLaERpN04vUkhFYnA1TU8vVmpseUJLZSt5ZlFhOHh3N3pGYngzT2hMeUVa?=
 =?utf-8?B?ZUxhNkJHUy9ML0gyd2xYanVxWk1UK3I1Tm8wUTVyQWFncjl2bzNnVHkzdm9I?=
 =?utf-8?B?T3BuSkxGbE1Xa0I4MURXTFBJYVNKSXM0MUdFT3lseWhVMk5WRWVTQTIwaitn?=
 =?utf-8?B?YUVIYWFzVjM0a2d4SmxDTnNCYytZTlZsMnFqSmU2ZmYzNTU2MXl6ZDRoVWky?=
 =?utf-8?B?b1pJcU5FOENkOEhtTjdRdHIvRUhpRy9PTzZBOFpheDZaVy9ZeVFoc2xZVDZY?=
 =?utf-8?B?S1FVbHcveHoxV0ZoYUNYdUg2akgxd2FWNFJYMDNNWG5KdnlibTBsQzUzbHJ6?=
 =?utf-8?B?UTB2WHFzWWhJWXFveDkrNEY0NUJUOU1NamdXZVcxMEs5RFBWTXhsQUNib2Vp?=
 =?utf-8?B?ZG40SmZQMzBudHhuTG82NXJSUnIvK1NFNDNiSlpmQjN6YkVDeXZjNmlYK0tw?=
 =?utf-8?B?TkhLU2ZCTlhYZS9lN3JDaXNHNERvYm5yN3ZtSVhBbDQwekRYdSt5RlJBMGY3?=
 =?utf-8?B?M1REUks3ZkEyM1FuWktPcXM3S1ZWQWJRSklCWURyNFRHazBhSS9sKzFUaU43?=
 =?utf-8?B?bzNWcjM5ek1CeXJUbEEwM1N1aW01RFBwL0JnK0V3bzR6ZC9JYklXbVFLeFZL?=
 =?utf-8?B?RzFFcHZKbFdzSWNuSEpWNEQxZlIvZC9zMG43VHZrNFlPZ3BXRFB3WnpiTGkw?=
 =?utf-8?B?S1NTbm9Za0pyckI4UHBUc09pSmJLWnFCZjJpR1l2eTFlR1NOR3lvQjJ1Z1dt?=
 =?utf-8?B?akJ1cm55enlxa0l4STY2TmtCSG4wb0J6YTc3SFBzb1BmYnBjK2h0bXplN2JT?=
 =?utf-8?B?WU9pZC9vdDBNT1ZJdkNDTjhyTExhWUphc1VzbjhCTlhvWUl4WnQ3SXd2WTlu?=
 =?utf-8?B?U1NsR3ZqNmIzV1lUREg3cDJuQnpWZkJCYWc0LzJ4QlZCN0xWMm5XeXphM0FQ?=
 =?utf-8?B?NUNJb1llMHF5T2ZHNVFRcEhQYThhZUhmMDU5WmhTRnJ1VHVFbys1VFFtY0ZB?=
 =?utf-8?B?K25Ia3lmVWxZYTNBRHdib1FuVXFsVEZEWWZDcXVTelVuV1grcFRlSTdnQy9L?=
 =?utf-8?B?ZFR6K2RYRlNRZE42T28yNkNrWHFWK1BmZHpKSjBVMFg0TGNnaStQQWxPMzUr?=
 =?utf-8?B?TWVuTERIMDhjUjRTTVBFeDRYODRNL3dlcDdBY3Z1OFRyQVBob2hCZGFNem9O?=
 =?utf-8?B?U1AxOTZqdmY2M1lycG90TmNRMDMySHV1NFNneWxRdGVabmNSZzJQQy9uNjJC?=
 =?utf-8?B?ekRVNkIvcURQMnM2ZjMyakZ1OXRMSk1jdVo4TGc3WWhsOVdmZUxoUG43R2lh?=
 =?utf-8?B?R0Fvc0I0SUJIZWxaSFRHUEJKenVyZGpRMGl0Q3hidFdXSk1ISkljbjBZNEda?=
 =?utf-8?B?dU1kUU4wcndhZ25zQzdkdCtRZ3JlaG5OYVR1Qk5nNHdLdnlOb1hiMUZURm83?=
 =?utf-8?B?eHY2RkltdnM0aUswWG1hOFFBVHhJcjdHWXJLVGIyVWtVVjE4cmpFbzFTUHU4?=
 =?utf-8?B?R0daM3diOTJGM082SWxGZnJSOTBiQmtFcFBjeTcrZ2J3MXdyYW05RlNQWVdi?=
 =?utf-8?B?cEZzTFJSRkI1YytBbWFGUWtBeWlONVpwL2VTWkxyVkFZUStPTkZQQlRZUlQw?=
 =?utf-8?B?OUc1UUsrdzlLVDExM3RVSGNOemhkWE1adnk5N0RzR3lnTG41dFd5d293ZklO?=
 =?utf-8?B?MFNXbFNBb2NHS285TnNGaFc3dWdQQ0lpMDVId3Y4ekpkWGN0Y0tNYUtxdXBT?=
 =?utf-8?B?dVp5UklsMmFGWWd3QlV5Sm1KODlnTHV3RGd1RGEvSkRlMG1Id2lNd2hXSVF5?=
 =?utf-8?B?UGdDWHJJR3pyVitWUm5EaFloQ0hRd2xUeW9xaHQvRVBPalpXQ2FqTnh5NStE?=
 =?utf-8?B?YU1xanI3NjZZY3duZXVVWEFkUDZJOWpIVG1jZUdqdEpobWw2d2t2M3Bsa2ZH?=
 =?utf-8?B?UVJkM08vR1hOa29FYjJzNUREL240TGZOYnJhYjNRdzBZYnJvMHUrcHNYVU1R?=
 =?utf-8?B?UlRGNDA3dmUrWGdVNUdRZnZ4YWJVT1BPVFdQZVp3cG00TWVYVmpNNmpXTHBT?=
 =?utf-8?B?SUk5OE9IbEtiSk1zVTdBSklrbC9HZThTU013a01JWmRwREtYbHE3YTZCV2l2?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 984fef5c-8c6a-4560-8cba-08de1de3a8b5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 09:54:56.5614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /YOwrDhqFGZVyBFq5FE4QQE1tZeqMX7wVKjT2y6hzmO91n1xZWEPI3p1qBRyOI0oxQkF1v0ZLq6Q0lXFIpBjInp92hUzs5sjoWGCZN46Pnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4876
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

On Fri, Nov 07, 2025 at 10:38:05AM +0100, Muqthyar Ahmed, Syed Abdul wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michał
> > Winiarski
> > Sent: Friday, October 31, 2025 2:02 AM
> > To: Alex Williamson <alex@shazbot.org>; De Marchi, Lucas
> > <lucas.demarchi@intel.com>; Thomas Hellström
> > <thomas.hellstrom@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> > Jason Gunthorpe <jgg@ziepe.ca>; Yishai Hadas <yishaih@nvidia.com>; Tian,
> > Kevin <kevin.tian@intel.com>; Shameer Kolothum
> > <skolothumtho@nvidia.com>; intel-xe@lists.freedesktop.org; linux-
> > kernel@vger.kernel.org; kvm@vger.kernel.org; Brost, Matthew
> > <matthew.brost@intel.com>; Wajdeczko, Michal
> > <Michal.Wajdeczko@intel.com>
> > Cc: dri-devel@lists.freedesktop.org; Jani Nikula <jani.nikula@linux.intel.com>;
> > Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; Tvrtko Ursulin
> > <tursulin@ursulin.net>; David Airlie <airlied@gmail.com>; Simona Vetter
> > <simona@ffwll.ch>; Laguna, Lukasz <lukasz.laguna@intel.com>; Christoph
> > Hellwig <hch@infradead.org>; Winiarski, Michal
> > <michal.winiarski@intel.com>
> > Subject: [PATCH v3 28/28] vfio/xe: Add device specific vfio_pci driver variant
> > for Intel graphics
> > 
> > In addition to generic VFIO PCI functionality, the driver implements VFIO
> > migration uAPI, allowing userspace to enable migration for Intel Graphics SR-
> > IOV Virtual Functions.
> > The driver binds to VF device, and uses API exposed by Xe driver bound to PF
> > device to control VF device state and transfer the migration data.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  MAINTAINERS                  |   7 +
> >  drivers/vfio/pci/Kconfig     |   2 +
> >  drivers/vfio/pci/Makefile    |   2 +
> >  drivers/vfio/pci/xe/Kconfig  |  12 +
> >  drivers/vfio/pci/xe/Makefile |   3 +
> >  drivers/vfio/pci/xe/main.c   | 552 +++++++++++++++++++++++++++++++++++
> >  6 files changed, 578 insertions(+)
> >  create mode 100644 drivers/vfio/pci/xe/Kconfig  create mode 100644
> > drivers/vfio/pci/xe/Makefile  create mode 100644 drivers/vfio/pci/xe/main.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b890ff265f03f..d73348c5f3f3e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -27008,6 +27008,13 @@ L:	virtualization@lists.linux.dev
> >  S:	Maintained
> >  F:	drivers/vfio/pci/virtio
> > 
> > +VFIO XE PCI DRIVER
> > +M:	Michał Winiarski <michal.winiarski@intel.com>
> > +L:	kvm@vger.kernel.org
> > +L:	intel-xe@lists.freedesktop.org
> > +S:	Supported
> > +F:	drivers/vfio/pci/xe
> > +
> >  VGA_SWITCHEROO
> >  R:	Lukas Wunner <lukas@wunner.de>
> >  S:	Maintained
> > diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig index
> > 2b0172f546652..c100f0ab87f2d 100644
> > --- a/drivers/vfio/pci/Kconfig
> > +++ b/drivers/vfio/pci/Kconfig
> > @@ -67,4 +67,6 @@ source "drivers/vfio/pci/nvgrace-gpu/Kconfig"
> > 
> >  source "drivers/vfio/pci/qat/Kconfig"
> > 
> > +source "drivers/vfio/pci/xe/Kconfig"
> > +
> >  endmenu
> > diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile index
> > cf00c0a7e55c8..f5d46aa9347b9 100644
> > --- a/drivers/vfio/pci/Makefile
> > +++ b/drivers/vfio/pci/Makefile
> > @@ -19,3 +19,5 @@ obj-$(CONFIG_VIRTIO_VFIO_PCI) += virtio/
> >  obj-$(CONFIG_NVGRACE_GPU_VFIO_PCI) += nvgrace-gpu/
> > 
> >  obj-$(CONFIG_QAT_VFIO_PCI) += qat/
> > +
> > +obj-$(CONFIG_XE_VFIO_PCI) += xe/
> > diff --git a/drivers/vfio/pci/xe/Kconfig b/drivers/vfio/pci/xe/Kconfig new file
> > mode 100644 index 0000000000000..787be88268685
> > --- /dev/null
> > +++ b/drivers/vfio/pci/xe/Kconfig
> > @@ -0,0 +1,12 @@
> > +# SPDX-License-Identifier: GPL-2.0-only config XE_VFIO_PCI
> > +	tristate "VFIO support for Intel Graphics"
> > +	depends on DRM_XE
> > +	select VFIO_PCI_CORE
> Shall we make it default enabled with "default m " so that config gets enabled for first timers and no need to enable explicitly. 

No. The disable-by-default rule is intentional.

VFIO driver variants are generally not part of "Hardware or
infrastructure that everybody expects, such as CONFIG_NET or
CONFIG_BLOCK".
There's nothing about xe-vfio-pci that would make it an exception.

For more information, see:
https://docs.kernel.org/kbuild/kconfig-language.html#menu-attributes

Thanks,
-Michał
