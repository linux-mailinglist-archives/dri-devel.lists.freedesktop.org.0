Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C08BD2F08
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 14:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9AD10E1EF;
	Mon, 13 Oct 2025 12:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSSik9s4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CF510E11A;
 Mon, 13 Oct 2025 12:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760357887; x=1791893887;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tGm1I8DSdxUIqn2CJpK9uu9Ycm7NZwOoZpGfIpvuQd0=;
 b=QSSik9s49cBrJSqLgs6K4BZR0oC3UYGfzKy83LZxDxRw9kIC9wpPPshs
 N7huDJv7bIwnNld9TEix4+hYafci4tbyr0g7oenqph03IoeAbWcixXRDq
 sdO7b4GJx/N9XuYPqJQ/AaQpUMQ8+5xU30dbIau90kEwIuA4nZMjX6jwn
 VMN6eHOmG3I41XzDdAe5lEO0i7xedZAwgDeBazJvhDhY7KNT2qfoJg0vT
 7VVxesqG+Tk0OyY+BD/XTjbdnPOWSo7L8/MN9t0ALcBW60yp5RpMdI4JV
 LkYUmOtlDcKFmHqF7DHhHRhnZcJMot24UqJtkRacsWdB2JenCa9qlF6cH A==;
X-CSE-ConnectionGUID: A9wxZDCXTl67QXs4KrsAgA==
X-CSE-MsgGUID: 9hIp3SLrTIKwESc+GSJeMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="72752797"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="72752797"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 05:18:06 -0700
X-CSE-ConnectionGUID: XQ9a8dmITt2t7gdknQEH6A==
X-CSE-MsgGUID: FHHG/8ZdTcChRk28YZeB9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="185597179"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 05:18:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 05:18:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 05:18:05 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 05:18:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVM7KRFu2tiWCZdz5c9Y7k0CUlk2cTlm/sX/l3U2i+U2Qq6BpuGp8ieKdffsI7AVh4J/84wBr4cm9+c/HNFpwtG3QVzxYl5DU4skRCgFi09I+KmULozc3/jEacJ2Mv5jw+sRD3wdh1uzeez675jTl/uCosKWHkBc7buRLo5Ct2xj2K1jYAbtK4/5CCQKQVnhUjxi8WtYUvMwfQtcX5qmWg7OXo8R/FDqn1a5TO397qExxzbVmwNrkG+ZM5SQabiRjDgohJkKZyIglYrtCrSbrCIgCwQBMv1XK/yzSgPQz0/tVejr9i/mzWH7tUNNDuArqfdABws1HWdhMWQrgKHcjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReTAbn1Tojdg3hZy9QMHWk4nWKiexM373G/vNbH9LE4=;
 b=EZo16SMkPVgL+z+GLD10hbCm0BiUSiH7QuoczHDPZ+EACWwGIwtesGoCo7Ztcht6DWz81tkj5FhjLvn3Or1P5YEqMKwqzJF2DE3EfpANOyaTpRguAPRTQWbDrefkrz9Tbf4qJo6HsEBqbmvZa5Nd8PTfhUkrpCEi4ARSNiDf0fH02LAHN7M3Fkt5ygbxHVRvQIP8XMUR8+5y6M2OHqLxy5PZHszd8iQC1n34TKwZjlG7ILFOOS+dQifkkV0qy4s5ewbfJsqjmfxqej+Gsm2UlCXuv6TY00/kXZbtGyqCmx1YDnj56Qv63qOPkOGarGgoZ+MNVk0lvrtEUr4CIYuJsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB7704.namprd11.prod.outlook.com (2603:10b6:a03:4e7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 12:18:03 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 12:18:03 +0000
Message-ID: <83f83d86-a89d-4315-aa01-9c48e782bd60@intel.com>
Date: Mon, 13 Oct 2025 14:17:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/26] drm/xe/pf: Add helpers for VF GGTT migration data
 handling
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-18-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251011193847.1836454-18-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE0P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: 732e383f-8d15-4904-e296-08de0a528e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHJkRG91bmpoby9LN21sdEY3TDAwamdzZ1JXKzFPeElDbld3ZzhvTzIzWjFz?=
 =?utf-8?B?RzY2VFo1T2tPMDRYRlpoeVBDY0hDamJKM2Vsbzl5VlVuVmVmNHVkMFEvVml0?=
 =?utf-8?B?WHlYZWhPeUd3NHVjclF6TUR5eGhhczZrNGFYM2YxME4xRE5UOVpreWVMbjNw?=
 =?utf-8?B?SktuN0JJTndWb0hFOEZOMEpqc1hwU3VWWEFTREdab3dxeW52cE9RY0NTUXM4?=
 =?utf-8?B?bEZXdk15WWd0aS9WOU5WVXBuczN5NFg1bFhydkxxWm1sSlFWRmVPbmZuekxG?=
 =?utf-8?B?OFRZcWdNYklDa2dQV3dPbzh2OHNtNkMxaVEzYkJhaE90UnVEVEdFbC9BNUVR?=
 =?utf-8?B?NFp5dmZaU2ROWU4yVGZZUXNJS1o3dDkyWTN4TlFpMU9MQzNDTkVJSE1SaTYz?=
 =?utf-8?B?TFp5MDlGZXlxWHNqbHlJNXEvczlJeTlLMHVocEx0YTlrUC9RaXZWakxMQlk2?=
 =?utf-8?B?TEY5OFp6eTFoa095V3RKZDhzVUY1d2I0ajV6OW9LTWpRRnBEU3RFS28zbXB6?=
 =?utf-8?B?OGx6SGRnQ3JuZDZSOXVNT2lnVHplbVNYZmhoRXYyOGNneFVlYUZKaEtmS2xx?=
 =?utf-8?B?ejZQbW1ZV0dXWUdYM0lLSmRvVzZJblY1bVMxRTV0a0dvTXRvREFSOEZQNUtU?=
 =?utf-8?B?R3A0eDgxd3k5U0V1TVcvZTU1dlVLZW91QXNQRUJEYVNwK3Y4SlYxL05JSWFy?=
 =?utf-8?B?NkU0b1pTNTUwck11OFp0ZXE4Qks3c3ovbXM5RTBVZ2g5QnNuYmZsUUptb0Rl?=
 =?utf-8?B?blAwMnlnYUJrRkN6L3VVU1BBZDh6L2RSVlhpOFJwREJIalBjMVdtMDFWeWdh?=
 =?utf-8?B?emp6WUhHSmRVSFoxVmxBdGZTdlpkd05wSHV5STQ2Q3JaazIrUUdiUVZPbFps?=
 =?utf-8?B?elExR3d0cEVYdG5ma3hwclFKU3o3M2FNYTIrbnFuSHdYaFZGWXRRbWF3amZ6?=
 =?utf-8?B?azVudi94ZWROb3BTUENZQzlSR3RVQVZERUxJUHpBZmd5WEtqZjhOV1VLUlpL?=
 =?utf-8?B?RkcrVEg5b3NVZXFPQ0RkNStjZE1FbmNBZllvVTRQY2RIL0d3dXJkQXBqRFFB?=
 =?utf-8?B?OTkxY2IvbHJ3aGFJSjM3QkRPMDlidTd6b29tdlRRb3dWcUlJb21VVGdVdkRT?=
 =?utf-8?B?TUZxUWFsR2ZpY0ZDZDRFZmU4cStFMGtIUkpmVHRtWmFacGZwakM2NzYrdHhi?=
 =?utf-8?B?eXBtck44OVVsWk9FZjhjTURDZzBUaUJ6bGpUQ1JaWUFBcTYxRklqYkovVlFk?=
 =?utf-8?B?VEZ4NVR1MDlOQngxaHFoTG1JOURXNk4vOU5GNzdlOFgydEx5UmNzcS91RHR2?=
 =?utf-8?B?ZjZIc2FPZUZyQUtBOERKYk1iMFRGbGtNUmVRNklHZWJpZ3lZbEVzY1lvN3U1?=
 =?utf-8?B?Z204Tk53ZWpVSlFHbE5YOTY2MzluWlVmaFhlWDMwS3pRSE9PQkJlTXlUZnJ6?=
 =?utf-8?B?R21BWEJhTy9paVFKTlhqVU5wUU5DSkhwR1VWRlpSWHN5TUpuYlpIV1d6MjNj?=
 =?utf-8?B?RkRua2djbkx1UldYNXZkMVNSekNFUDFncytnVitmQ2xyWGZSU1Rrdlg2WGoy?=
 =?utf-8?B?eWVoV3pSb2pWRkJhWXZuTVE5RjJrUHV5MTQ5ajlXWUxUOVZhQWMveHo3eS85?=
 =?utf-8?B?dEt5SFFwUUJPT2V1eUZvL2RqMHpGWnZ5V05JZGJzNThzZzgwTGtVQzFnOTBG?=
 =?utf-8?B?VlNZU3k0aXlvNzdQVVY1U3V2cUNqazVGZFEybnF4bG5RZHVNQmtCbWVQbE51?=
 =?utf-8?B?OTRvTDVheHNHdDhSVzZUKzFJd0M4b2RTU2lCemdpNEZoTUpaMmN4b1l6Rk9E?=
 =?utf-8?B?RUhzY1ZINGxWU2YwZ2MweXB2T2VTTWZRVk1DV3M4NmxzQS9TN29tU2EwSFBE?=
 =?utf-8?B?Umlxdmp4VWJOcFhUYU1ITTBoSkVQUnpoTTgxU1BqYk10WE0wemdIU1JZVUJF?=
 =?utf-8?B?aTdCU2NWWnpNZXlOa0UxaTREZ1FPZjRmblhZV1FWRTc5R1dRTU1hcit2bVdH?=
 =?utf-8?Q?VHVi95a1WI/pNH+BnCK6R8jpEaQBJM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkFXZVNNdUhWcTNBZTFET1Fscm1YbTMvbjkzSWhoWTZtb0F2dC9ZS0hlRGlm?=
 =?utf-8?B?RTNIZGNFZjRIelFqSEZKWUI3ZGErRDl5ZWVTS1pVeHR2cWhXRU9uS0ZsOTFr?=
 =?utf-8?B?bm0xcURQd0tVMk5uY3EwcWJaNWIvV2V6Z3Rlelc5aHNIYjFKazVYU05iZDJW?=
 =?utf-8?B?dlQ3dXo4eVpmMkRIaFNZekVpZCsyWFlOaUk0UXZUK2t3WXM2TVBRMzFFdm44?=
 =?utf-8?B?ZGFvOU5FeVZpWHJPSG56MzBkT2pwMDJpQVhkTHZ1RVZVY2xQVEo1RStscGpk?=
 =?utf-8?B?M3RwdXR1N3o1QkRPbWFqUU9QNTJCSUdNT3piWUkzV1R6bG0vbXA1UUFRa280?=
 =?utf-8?B?aUhFLzJJYkpkSmgrZVpnUHBlcFMwNmpkb2hFZWRWbVlLY3pDNEV3MlFrWkJz?=
 =?utf-8?B?cDhjbk5icExoYmRyclBCeDQ3QStXb2FnOE9iTmZDY0liZmwyMnVINHRxQTBP?=
 =?utf-8?B?eEFLQlV4Yjl3ajV0dmFIQTJUWGd4QjVUdndqZmpDczA3UkhsV2hYbWIyRmZS?=
 =?utf-8?B?OFRFV1hPb2tWRmV4OERHL0FTdEJ4MjdDSWJ1b2JiTVI0RHRVRGlzM2hsZ2JW?=
 =?utf-8?B?QlJFSEJKWHdqNXd2NVJxNEtSZVdBMTM4eEo1WkFRMGlXdG5YVXNlMU4ybnhD?=
 =?utf-8?B?SzFoVWd1QUNiOExYdlNNZXVVZFRHRlZ1bGdMa2F6WlVFKzB0SHRKSFg0YlJQ?=
 =?utf-8?B?azJqTGlQeGxFblUrczlKeUhJYkZ0aG9Bbk1YVy9GQnR6ejdsTVJLdTFTZFlp?=
 =?utf-8?B?V0tYekd3bUxyTitwTWdUeUkzODIwZnpaSGF6NEszdVUrYVlVQWZHNHlDQUdr?=
 =?utf-8?B?QzdMZUJQVEJFbHhLWVdQMHRndmtyV0svVVA2VXdjR2EzUnhDNmR4OFlPV29L?=
 =?utf-8?B?b0ZFbVA4bEVROTNCM0hoS2RZd2oxM0hlNWc5aDNrK3J6Q1BmTzluRGtmVUNm?=
 =?utf-8?B?YTUxU3lPMS9YencvaWI3UzZ4TVF1NGJwOUQ3dXpiL3hHMWZUT1FnVmFhWHpF?=
 =?utf-8?B?ditXSHhSclRLS1Z1ek9Kam1HYThYcDQ3QWQ0cWlPZTkwWlo3V21NeVVUamlF?=
 =?utf-8?B?UVZHY3ZydTJpZndKWHhteVg2cnVOSHJDMGNFK1lrbWtHQlNuYjM1MGZ2anZM?=
 =?utf-8?B?SVNEdUFIYitUdjYyb1dHZUdJMGdDRHJSNkdSN1FtMUxMY2t4QUVwL2xWZ0ZU?=
 =?utf-8?B?M1poQVJBbDMzWHBBUGxSdWY0SENUeWxtN1gvN1FCc2MrUGtTak5PNzBrNGRE?=
 =?utf-8?B?TnVwRnF0cERhRVB3d2ErdVo4NEpKMDVtOFUycGkyNTdIMGZ4VUJ4OVVuOEl5?=
 =?utf-8?B?MHFQQkZBOGNxU0w1bmgzcFVaa0FOS0VhN3g5aEgzQTI0dnduMmhFZm9OZUVP?=
 =?utf-8?B?S2d1ZVpZeUdhNythRWY4NEF3d2pUcVdoZk9hR3BnTVJFZUQyanVWYTVQZHB6?=
 =?utf-8?B?NnVLdGVaeEJnd0dySmN6UlVWSStKbDQ2OVhQYzZ1dVp3YVVVNm1pZk1EZDBB?=
 =?utf-8?B?UUxRNDhybTFGbWNEQ2JucWMwTGEwekpnQlY0WFBxVHJYeEhFSGJCTkRtTzVz?=
 =?utf-8?B?OHNPUDhNdVZ4dkVUZkUrWVVDcVJOQWJRSGtvbkx0aFBtNmttbldsbWxCNllG?=
 =?utf-8?B?aFpGU0lVTENqZDhMOFVWYkxzdGJPWEZUSUlyNnJJZ2daNlcxaXIyOWVJM2Z5?=
 =?utf-8?B?eWJTNzVhN3dWZ2hnaXpOZTJ0RTQ0UFBXWWNLbGlTck56THhPK0pXRzFxNncr?=
 =?utf-8?B?Zm5zbGFyME41TEVOaHlYK1ltWnBmL2tWdlhESEtDUnVzYUJwZ3FxSDE1Y2hJ?=
 =?utf-8?B?czE4ejhzSmdNT21HTFBVVWNjTnRoRXM1TUNlWW1IVUFRRkRIRWxVQ3NsbVpv?=
 =?utf-8?B?SnphSkVZMmVnL1doVmRuNVVFMkEwWUVWYmxHcFZxOFVsL0JMcWFnckZ1T014?=
 =?utf-8?B?eSt4eVl3NWx3R1Jza05GcDh6Zko4eGZPWWxWczE5bnZLcWE1NTRvb0RQd2l5?=
 =?utf-8?B?OUdRY1lVb2ptcTdwYnRCTWM0NExscmtDNENpeW9iWnk4bGlTYzFwOUZRZENG?=
 =?utf-8?B?cEJVaFRPcjVHczlGUXJ1d1F0RWRMNlBQSFlLQ0g2RWMyaVEwS2IrM3lRbVF0?=
 =?utf-8?B?Q0NVT3cyUnpWc2dubGNhSGp6R1REWmpiYUgzSlNYaU5GWVNIL2NZLzlKb2Uz?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 732e383f-8d15-4904-e296-08de0a528e84
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 12:18:02.9542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: abx30jOOKjppoTyKpxws91XzTn+F2UXedcBVU/sQynAXaDBQomUMXMnXPCbCsVRiPUO/zIq1OhLNzCR++tdYKiktXp1iFux7nQ2bhUrGeoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7704
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



On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> In an upcoming change, the VF GGTT migration data will be handled as
> part of VF control state machine. Add the necessary helpers to allow the
> migration data transfer to/from the HW GGTT resource.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c               | 92 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.h               |  2 +
>  drivers/gpu/drm/xe/xe_ggtt_types.h         |  2 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 64 +++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  5 ++
>  5 files changed, 165 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index aca7ae5489b91..89c0ad56c6a8a 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -138,6 +138,14 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>  	ggtt_update_access_counter(ggtt);
>  }
>  
> +static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
> +{
> +	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> +	xe_tile_assert(ggtt->tile, addr < ggtt->size);
> +
> +	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
> +}
> +
>  static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>  {
>  	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
> @@ -220,16 +228,19 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
>  static const struct xe_ggtt_pt_ops xelp_pt_ops = {
>  	.pte_encode_flags = xelp_ggtt_pte_flags,
>  	.ggtt_set_pte = xe_ggtt_set_pte,
> +	.ggtt_get_pte = xe_ggtt_get_pte,
>  };
>  
>  static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
>  	.pte_encode_flags = xelpg_ggtt_pte_flags,
>  	.ggtt_set_pte = xe_ggtt_set_pte,
> +	.ggtt_get_pte = xe_ggtt_get_pte,
>  };
>  
>  static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
>  	.pte_encode_flags = xelpg_ggtt_pte_flags,
>  	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
> +	.ggtt_get_pte = xe_ggtt_get_pte,
>  };
>  
>  static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u32 reserved)
> @@ -914,6 +925,87 @@ void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid)
>  	xe_ggtt_assign_locked(node->ggtt, &node->base, vfid);
>  	mutex_unlock(&node->ggtt->lock);
>  }
> +
> +/**
> + * xe_ggtt_node_save - Save a &struct xe_ggtt_node to a buffer
> + * @node: the &struct xe_ggtt_node to be saved
> + * @dst: destination buffer

correct me: this is buffer for the PTEs

> + * @size: destination buffer size in bytes

and this is size of above buffer

> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size)
> +{
> +	struct xe_ggtt *ggtt;
> +	u64 start, end;
> +	u64 *buf = dst;
> +
> +	if (!node || !node->ggtt)
> +		return -ENOENT;

hmm, non-NULL node must be initialized by xe_ggtt_node_init() which sets the .ggtt so this second check is redundant

> +
> +	mutex_lock(&node->ggtt->lock);

	guard(mutex)(&node->ggtt->lock);

> +
> +	ggtt = node->ggtt;
> +	start = node->base.start;
> +	end = start + node->base.size - 1;
> +
> +	if (node->base.size < size) {

so that's looks wrong, we are about to save 64bit PTEs of that node

we should compare size of all PTEs not the size of address space allocated by this node

> +		mutex_unlock(&node->ggtt->lock);
> +		return -EINVAL;
> +	}
> +
> +	while (start < end) {
> +		*buf++ = ggtt->pt_ops->ggtt_get_pte(ggtt, start) & ~GGTT_PTE_VFID;
> +		start += XE_PAGE_SIZE;
> +	}
> +
> +	mutex_unlock(&node->ggtt->lock);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_ggtt_node_load - Load a &struct xe_ggtt_node from a buffer
> + * @node: the &struct xe_ggtt_node to be loaded
> + * @src: source buffer
> + * @size: source buffer size in bytes
> + * @vfid: VF identifier
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid)
> +{
> +	struct xe_ggtt *ggtt;
> +	u64 start, end;
> +	const u64 *buf = src;
> +	u64 vfid_pte = xe_encode_vfid_pte(vfid);

try to define vars in reverse xmas tree order

> +
> +	if (!node || !node->ggtt)
> +		return -ENOENT;
> +
> +	mutex_lock(&node->ggtt->lock);

use guard(mutex)

> +
> +	ggtt = node->ggtt;
> +	start = node->base.start;
> +	end = start + size - 1;
> +
> +	if (node->base.size != size) {
> +		mutex_unlock(&node->ggtt->lock);
> +		return -EINVAL;
> +	}
> +
> +	while (start < end) {
> +		ggtt->pt_ops->ggtt_set_pte(ggtt, start, (*buf & ~GGTT_PTE_VFID) | vfid_pte);
> +		start += XE_PAGE_SIZE;
> +		buf++;
> +	}
> +	xe_ggtt_invalidate(ggtt);
> +
> +	mutex_unlock(&node->ggtt->lock);
> +
> +	return 0;
> +}
> +
>  #endif
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 75fc7a1efea76..469b3a6ca14b4 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -43,6 +43,8 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
>  
>  #ifdef CONFIG_PCI_IOV
>  void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
> +int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size);
> +int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid);
>  #endif
>  
>  #ifndef CONFIG_LOCKDEP
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index c5e999d58ff2a..dacd796f81844 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -78,6 +78,8 @@ struct xe_ggtt_pt_ops {
>  	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
>  	/** @ggtt_set_pte: Directly write into GGTT's PTE */
>  	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
> +	/** @ggtt_get_pte: Directly read from GGTT's PTE */
> +	u64 (*ggtt_get_pte)(struct xe_ggtt *ggtt, u64 addr);
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index b2e5c52978e6a..51027921b2988 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -726,6 +726,70 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
>  	return xe_gt_sriov_pf_config_bulk_set_ggtt(gt, vfid, num_vfs, fair);
>  }
>  
> +/**
> + * xe_gt_sriov_pf_config_ggtt_save - Save a VF provisioned GGTT data into a buffer.
> + * @gt: the &struct xe_gt
> + * @vfid: VF identifier
> + * @buf: the GGTT data destination buffer
> + * @size: the size of the buffer
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_ggtt_save(struct xe_gt *gt, unsigned int vfid,
> +				    void *buf, size_t size)
> +{
> +	struct xe_gt_sriov_config *config;
> +	ssize_t ret;

int

> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid);
> +	xe_gt_assert(gt, !(!buf ^ !size));

there seems to be no "query" option for this call, so both buf & size must be valid

> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	config = pf_pick_vf_config(gt, vfid);
> +	size = size / sizeof(u64) * XE_PAGE_SIZE;

?? something is wrong here - why do we have to change the size of the buf?

> +
> +	ret = xe_ggtt_node_save(config->ggtt_region, buf, size);
> +
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_ggtt_restore - Restore a VF provisioned GGTT data from a buffer.
> + * @gt: the &struct xe_gt
> + * @vfid: VF identifier
> + * @buf: the GGTT data source buffer
> + * @size: the size of the buffer
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
> +				       const void *buf, size_t size)
> +{
> +	struct xe_gt_sriov_config *config;
> +	ssize_t ret;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid);
> +	xe_gt_assert(gt, !(!buf ^ !size));
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	config = pf_pick_vf_config(gt, vfid);
> +	size = size / sizeof(u64) * XE_PAGE_SIZE;
> +
> +	ret = xe_ggtt_node_load(config->ggtt_region, buf, size, vfid);
> +
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return ret;
> +}

ditto

> +
>  static u32 pf_get_min_spare_ctxs(struct xe_gt *gt)
>  {
>  	/* XXX: preliminary */
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index 513e6512a575b..6916b8f58ebf2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -61,6 +61,11 @@ ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *bu
>  int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
>  				  const void *buf, size_t size);
>  
> +int xe_gt_sriov_pf_config_ggtt_save(struct xe_gt *gt, unsigned int vfid,
> +				    void *buf, size_t size);
> +int xe_gt_sriov_pf_config_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
> +				       const void *buf, size_t size);
> +
>  bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
>  
>  int xe_gt_sriov_pf_config_init(struct xe_gt *gt);

