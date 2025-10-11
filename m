Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC68BCFB87
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03B310E349;
	Sat, 11 Oct 2025 19:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ORmTXQF1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F8A10E112;
 Sat, 11 Oct 2025 19:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211646; x=1791747646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9vA6uIk6Rmq/0p5/vM02s5kOPtRGsebjmkYmCmIITfk=;
 b=ORmTXQF1FyFKhzp41Qp+SWpTZOoThketGkwAwmV0H5KKVWB1ijc2pdZU
 +YrLvrBj5neQuG8P/edLP8jx4QBBwHNakGjm7bPHKO2BMtHMOfDMnWLa2
 DnwosSKRszYMMR995LsyrVpu2yPI3RMg+dUzN5cIdAViZWfxaJUoh1Dx+
 XqvGtVsynlga6SPBVll/x9tmD0n1vboQGMbWVHKWxYgLGVC56XJXw/+On
 lqxg6LAfoW38nXxxKT/TH1gghXmU6d1Pgu+lE7gqvXFVDT2/wBxmMLz/o
 buKsMLUbpIDB26nsWraNlxnfpuq2NiY2Yi5fmkAr6wvDiqEIpySUXOCqo w==;
X-CSE-ConnectionGUID: EgjG2z0mSfmKUgk6xPEkpg==
X-CSE-MsgGUID: Q3rEW91BQb+zrHhvuLl9vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="61431564"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="61431564"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:40:45 -0700
X-CSE-ConnectionGUID: e4APIgdtTRugBqbhdrYPMw==
X-CSE-MsgGUID: QSJ9GrEoSkGqcoJd2Akdtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="212202609"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:40:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:40:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:40:44 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:40:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjTXPSm3nNMhy5yPOmKZcm0ITiyClySCq+hH7v3ARWYHQ/VNu12UzEQ94NmVsqmQ1O0UH5qvRKOcBE2jXmniW0YNu5xeaNSa90odcQ02GJKTaQibaafqi1bhI/LQUSAhEXafnP6iW5ZKAF44a4H3BQE1rkk4giG9TPBVM7rK/pqlIXSRpo8eY3OJb/1/XrMkOJKPr9jCOU0XK6WYn4/ftA7QUfuOmQGfMYGlZ34aSPpWWZwdG2vYkNPBFA1lPy1rCm+9sOlhMIbw7NKAuwhf4TW6vhMZuhxfygyFPvL/lUj0EaZo5Fb8DUv9zqhXvj6CBR8d17Qmb63/y8K0QJQZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEA0q45c4oz4MSc4CCZKjG476Qm67MPL+o4/d/0VUio=;
 b=OtdR14Q8Ch9OhqsKFK0RGmK0KBP0qakiyF98RsXqDNwkbYZ/yi3BNpu0BNojxqEkeNLRWCWtPaXkagwmBqcBgkmJTolxyLiHXXiFqvim64+1s+SW38zik4iz3Rf7ow0eCv4vn+FYliDbY38+4G3NBC3iNbOBy/rru7dBrfgdHQBWmYhxWIMbyT6D3e4a70kaE/MQ3D0OchKh3GkvCfHfhn4LG/BKJ90QYvkOqrZZqYxxnb6OEuhhTsu72P/Vt50xBq0SNLADPXInUIb80B6rFpCroZOg9IINoJJIMS7dNSjBkJrsZSualWpYEIFwlEW2sQVr6rrAO7/OxQLqKL0yYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF2E67D388.namprd11.prod.outlook.com (2603:10b6:f:fc00::f60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 19:40:42 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:40:42 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 06/26] drm/xe/pf: Add helpers for migration data allocation /
 free
Date: Sat, 11 Oct 2025 21:38:27 +0200
Message-ID: <20251011193847.1836454-7-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P195CA0051.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::40) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF2E67D388:EE_
X-MS-Office365-Filtering-Correlation-Id: 105a1d0f-0b94-4a96-d833-08de08fe108f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0l0eU1na1R4YnFIc0ZNcGxBdVJQclBrR25aU3R6OUNNaGVrZlM2Tmt1dDV2?=
 =?utf-8?B?VkZERGZER054b3hpT2NaSHBncU56djdHdCt0eldmcFN1K1NGandVYndnQ3pt?=
 =?utf-8?B?Vys0NGFDanBWR1oxTVovSVROcFlmL3FMbnpOcXBxZnovdmIxTXI5TkpIdmJK?=
 =?utf-8?B?dFphMTJyMU9WV21ONXc0YkkvRmtnbXEvblFBVVJVc04zNEVDNzVZTEdvK3JF?=
 =?utf-8?B?YmRzeXJVOStWTXFtTGY0UG9vbjR3a3M2M2RRdnBXaHRmZlg0SWUwQ3ArV24x?=
 =?utf-8?B?eFlJTkxUd2I1RzV0c1lrQUtCK1FOVnRENlk0ZUU2ekZtNWpmY2Rqb1hUSEJn?=
 =?utf-8?B?NFBjZ09aT3pMN3hJL01RSTRRcElxK3FZOCtXWHU4UjZ2UGZlaXlueHJ6L3Nw?=
 =?utf-8?B?d0lGd29KdWVJSUc5aytXVVh4TWJlSmw4cnlrWWQwcE9ZNktZZEorbCtyYTBG?=
 =?utf-8?B?VVVRTERiczRBM29hMVVOYjUwdnEyUVZaSEtubE5rRUhnWVNDbmFEUjVpbyts?=
 =?utf-8?B?V1J5bjZiNTdYTk1UOURVbVFCb3YrL28wbEhwQXJhOHlIMVNLVmRkYVpEQTRE?=
 =?utf-8?B?RjNHa1IrcmlXZ25tU09udnl4QnFrbEROdXhzOU5lSk9QTTZKUS9Mc25LVnRR?=
 =?utf-8?B?NG8yWmNxZUc2M09OOWZFTjZVa3lDMndJeGI2S2hwSEZIL3Y5NWgzV21RWHc1?=
 =?utf-8?B?THk0NFZEQ0ViTU95NXAyUEZsUXBPR2dVcW1aZlJZZkZPamJ1bUNRZlBUR1FC?=
 =?utf-8?B?Q0V3UUJRd2VkTDRMNC9wcWExU2ppZ3FSK0gwWUhYb1hFdy8wdXM3Y0xzYSs2?=
 =?utf-8?B?RTVxSGJuam1GSXdKM1pLREZKRGx6N2lUSEVTdWJ1cjczZUhZZnRGQStjb2FR?=
 =?utf-8?B?dVI3Y25GYzZFYVpMaitnTVAvTUVYN0lGdEQ3eXFoN3NSYUNnUnZmemVydCtl?=
 =?utf-8?B?QnF0SjZpZVFGSUYvT29yZDc2bDVwS216VWNxZTZDUFpSQ3p5bllxS20vS3BR?=
 =?utf-8?B?QnRmZmc0VFo3bWlJTVZYVXBsNDNtZVpMdm9xSUJJSG03RldhYXFkRFhBd1RC?=
 =?utf-8?B?alBPZ0hMSmF1bmJUNEFSc2krUm9JejhXb3RSdDBJUFBIL0EvdjVhYkZ2Vkh3?=
 =?utf-8?B?clFtNkpTTFozRzliVHBjNFkva2VkalBpYzQ5cFpadHNRWjVzWjgxVzIzcnhJ?=
 =?utf-8?B?WEdWaHo3QkgzQ2p4RDJlRWhXdU1qUnFHbjR2M2FRMVBncFhRNUZHaEdYSmR4?=
 =?utf-8?B?ODlIaGxLWnZ6Smc3ZStLRG9vZTF4SE5ZZFlRaVljTHZvb3EzbGdnME96Ky9X?=
 =?utf-8?B?cjZrcTBpbWk5TWV5cHpsT3JmY3gxZDRTZlRnVUVtbFlBWXE2ZnJnOVpnbzls?=
 =?utf-8?B?Y0lnQy84VEF4ZXJDazd2NmFpL0RhVkJJVkRpZEd5Q2Rnc2oyUW1UUXJiREZJ?=
 =?utf-8?B?UFg4dGJkaHJUTmMyQUZCelhLckJWbjgzdkdEV3dTVU40OVlQOWVSczFFcVNP?=
 =?utf-8?B?SlY2RlZiNElYT0Y3dnZ4RkZMUVd2ZHo1UGpHeUlFMTBzVmJLSnRQSldEbk5m?=
 =?utf-8?B?VnNJSEEwNnh5NEc0TXNsYWdFcVJnYlBGYkRDZ0YxajJyZlIwYU1aQTZGZHJ5?=
 =?utf-8?B?a1JISXFuY0dLUk04Rm9SUWMxMDlZT2hUd3U1QzMvTzZBY05pOGRUZVBkYUs3?=
 =?utf-8?B?dythcXJ5K0VmK3orNElwNVdHeWNxclZrLzAzb3NnekVlSGhiSkZPSjRlV2sv?=
 =?utf-8?B?Z2Foa1pHNFlvMC8xTk5BSVF1eHJjaVczYjBpRTFsOUJaeGQ5aXRURUJzSjh5?=
 =?utf-8?B?LzdjdzNsQVVjbUNrOVpUNFQvRFY4Mndic0MxYUlOVU1uWXkySDA3N21EUjNx?=
 =?utf-8?B?SzA4ZTFjVkdTVlVsUWpnWlY0d2RDU3dPeVRqejFJUnJCb0x4bjFGNWp0a3k2?=
 =?utf-8?B?VWpXQURoTU45TWtjQTRmRXF5WlpjQmUvOEpTcmJrZ2hzc3pNb01xWkt1aWRs?=
 =?utf-8?Q?/xeTXB/Fr8dVHlhFUtUlCHRR0BfdEU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3plRXltSXZYYjkwUVZhTGEzbHMyaCtrbE9pWitPNTVFVFRqU2xvS1dUQXQ3?=
 =?utf-8?B?S0dUOGJkdE5TbllFcnp2bkRjZ1kwbWVGNnozRzRrQ2pIS1c3WnZUMXlYOEp2?=
 =?utf-8?B?MTErY0tZT2JNRXZXWk8wMVJQVzRvNlZUcGdJMUM2bEQ2dllneVpUSmV4V0xU?=
 =?utf-8?B?ZTZWN3ZtSWwwekpNNHFwUUlPYkpUTk4xeFlvdk1qQmxEallOSlpTNkcxZzVz?=
 =?utf-8?B?Q0h3N0lScnJKVnhCUEZjaWNYMFQrSnRLcGJ2d2IydkVXMXFnbGpJajVSZTMr?=
 =?utf-8?B?RzlKYnBaUmRYeVc5UUVLUGtLTFNsNG1zbU9PSFAvL3R5Mzgwb3NGYWJrQ0hK?=
 =?utf-8?B?dUV0V2JOUlE4TFFNOEJUQzR0cDk3b2ZGa3NHUzl5T3Z6M2laT0l6UzZ3THFC?=
 =?utf-8?B?cVVTc2RPSWFMaWRSYmJrOWFkR2xBRE9LM2h6SDBsU0JQZ0xVd2U2dmIxV0h2?=
 =?utf-8?B?VmgySXNOWnlmblpDL2Y2REdqOC9wOXhGY3BNQ0VSL0VUd2QvVktnZWl2WGxW?=
 =?utf-8?B?QjZMd1JxTjQzRHQyZmM5VTl5SjZ3a21BMmY1ZkowWDlTZ2p3RG9IUXlJbm5r?=
 =?utf-8?B?OVZ3YytqUXhrWU5BU0ZxNG1Zb1BKVmpRMURtNWptdElDdm1MWWtHUHdjd29Q?=
 =?utf-8?B?bmZ5Sy9pSmttRWh6VmJlL3p5SWovYUlJYVZ3U2dlakFubWtlMXgwQ0kyeDNm?=
 =?utf-8?B?Ukx3cnJWcisraWZhdW1UUVovUXM5Z1pXdUtzVmdYTW1oWW9wT0Q4dDF4T0tu?=
 =?utf-8?B?U1Z4N2hBQjJ1NUVzd1JPSHI3OFlwSDU0T3hZK1dIY1hmcUg4WVJka05RLzhO?=
 =?utf-8?B?TStLcEFOcFowR2lQaHZlUGRQelc1bnNrMDF5VDZYWTA5WkcxdjdPYitkdnRz?=
 =?utf-8?B?M3hRYU1zdktpelN1TjlKWXhiRUVQTGRNRWxQeFdYOCtOc25nRHZKRnYvL2FE?=
 =?utf-8?B?c2tLd1BxS2ZXaFV6VFZNczNuWm83S1NvVWFUREU0MG8vQ21MbXFSc2tIK1Bi?=
 =?utf-8?B?UXJjZGxNdTVYcXZscEtoNG50NXpadWRHM1JjODdTOG1FRXVIUzlTTWhwUUY0?=
 =?utf-8?B?VzJOTjdwcGYzeXIvcnozMXFDdFc2V1VTbmMyMGZYR0NMY05nMG91a1g0Uk5O?=
 =?utf-8?B?SXRHcDJycC9iQWtXR0xyRlZTOXpUL2k1OXJ6bWFsdm5FK0JaemxtOFpsSDgv?=
 =?utf-8?B?Q1FkT1hydnhLZytpcG8rekF4RWVHNHVWemlNcEFKZ1BESVBsME4zZmR4Qkxw?=
 =?utf-8?B?b0M4Vm9jeDBVQTJ2d00zVTdYelFjdS9DbFNXenZQT0IvK3VSWml1Qy9WMDJx?=
 =?utf-8?B?K2Z5bHNwcjBFYTZ1eGpZT0llVUhyWkFOWmd1Z1RBdHBCbzh4c296Wnh5c1oz?=
 =?utf-8?B?UjRVRm9DaGR4aDQ1R1R1QkFsZTlHT0R6Y0hKa1ZXUzVtazA4S0x6UHJMTk9D?=
 =?utf-8?B?dnBQQUQ2dzkxZkZVVnFaR1VobTI4OUlqT1I3T0wxa2hQeHZ5a3JWYmdTUmxU?=
 =?utf-8?B?ZE9KNFRISm8rbE5ocjdaaDNCbTIxa2l4TVZVTDJmbE83VDRmL1NncFVvQ0xN?=
 =?utf-8?B?T1FJSmh2blByMjlSQ3BmNWU1WmhmRE4xTE9HNnBJMWN0eVRNWnhxbGNBN1hZ?=
 =?utf-8?B?VHhVbUtyU2ZEaFBWODhaRXN5Z3dKeENSN0VwYkdURFp4TE5zRkdQMjZET28r?=
 =?utf-8?B?WjZ2KzBCckdXaUU2dDFmamRnUlE2SytRSXMrZDhpZlp0MzFKZEd3NEJJcnRC?=
 =?utf-8?B?M3AyM1pVdk9sNjhPbXNzQ0lMeGU3bkhzd0xKQTdGQi9zdktyeDM3SmdFaTht?=
 =?utf-8?B?RUFVRFFOK0dlcDR1NUtDMGFtU2Zjc1JPSm9yYXVhendjYWp4Wjd3U2x0dW1v?=
 =?utf-8?B?bzVYYWJZUVRSM0VOZGU5cDRoWlV2MlMxcVFpeGZoOGtjTjZzNjQ5STJxSHkr?=
 =?utf-8?B?VHoyKy9IdFdLNlVWNHo0V2UycUxsaEZISUdBZ2dFUGxWRDlRN3VGOW1saUEr?=
 =?utf-8?B?a1ZiOFJEbWNCVkk1ejZqYnlqRHZ3V3F0Q0hzTVVSR3lmMDhiL3ptZHp2T2ta?=
 =?utf-8?B?bStyQjh5NGVEVm5BdDRQblFQUTJYdEQ0ZytXU0czWDJHcXVpTzhJZVZyVlU3?=
 =?utf-8?B?VkFVbVNlM0xMaUEyUGFsWkZ2eEZVTkRBNXIvZ2xFamtXK1pCYW5wdDFkMVE5?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 105a1d0f-0b94-4a96-d833-08de08fe108f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:40:42.6984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ciHj//lKnbGEMIctiy8V2hElCWzjNVl1o1N/x34w3E+5BegFnWpvD4gymCdzKhyU5gPdmFQ3WkDnLrbKKpV/7qf6MxO54j042uxoJo2Ulms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF2E67D388
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

Now that it's possible to free the packets - connect the restore
handling logic with the ring.
The helpers will also be used in upcoming changes that will start producing
migration data packets.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  48 ++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  10 +-
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |   1 +
 .../gpu/drm/xe/xe_sriov_pf_migration_data.c   | 135 ++++++++++++++++++
 .../gpu/drm/xe/xe_sriov_pf_migration_data.h   |  32 +++++
 6 files changed, 224 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 71f685a315dca..e253d65366de4 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -177,6 +177,7 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_sriov_pf_control.o \
 	xe_sriov_pf_debugfs.o \
 	xe_sriov_pf_migration.o \
+	xe_sriov_pf_migration_data.o \
 	xe_sriov_pf_service.o \
 	xe_tile_sriov_pf_debugfs.o
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 16a88e7599f6d..04a4e92133c2e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -20,6 +20,7 @@
 #include "xe_sriov.h"
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_migration.h"
+#include "xe_sriov_pf_migration_data.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_tile.h"
 
@@ -949,14 +950,57 @@ static void pf_exit_vf_restored(struct xe_gt *gt, unsigned int vfid)
 	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED);
 }
 
+static void pf_enter_vf_restore_failed(struct xe_gt *gt, unsigned int vfid)
+{
+	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
+	pf_exit_vf_wip(gt, vfid);
+}
+
+static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid,
+				     struct xe_sriov_pf_migration_data *data)
+{
+	switch (data->type) {
+	default:
+		xe_gt_sriov_notice(gt, "Skipping VF%u invalid data type: %d\n", vfid, data->type);
+		pf_enter_vf_restore_failed(gt, vfid);
+	}
+
+	return -EINVAL;
+}
+
 static bool pf_handle_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
 {
+	struct xe_sriov_pf_migration_data *data;
+	int ret;
+
 	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
 		return false;
 
-	pf_exit_vf_restore_wip(gt, vfid);
-	pf_enter_vf_restored(gt, vfid);
+	data = xe_gt_sriov_pf_migration_ring_consume(gt, vfid);
+	if (IS_ERR(data)) {
+		if (PTR_ERR(data) == -ENODATA &&
+		    !xe_gt_sriov_pf_control_check_vf_data_wip(gt, vfid)) {
+			pf_exit_vf_restore_wip(gt, vfid);
+			pf_enter_vf_restored(gt, vfid);
+		} else {
+			pf_enter_vf_restore_failed(gt, vfid);
+		}
+		return false;
+	}
+
+	xe_gt_assert(gt, gt->info.id == data->gt);
+	xe_gt_assert(gt, gt->tile->id == data->tile);
+
+	ret = pf_handle_vf_restore_data(gt, vfid, data);
+	if (ret) {
+		xe_gt_sriov_err(gt, "VF%u failed to restore data type: %d (%d)\n",
+				vfid, data->type, ret);
+		xe_sriov_pf_migration_data_free(data);
+		pf_enter_vf_restore_failed(gt, vfid);
+		return false;
+	}
 
+	xe_sriov_pf_migration_data_free(data);
 	return true;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index af5952f42fff1..582aaf062cbd4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -15,6 +15,7 @@
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf_migration.h"
+#include "xe_sriov_pf_migration_data.h"
 
 #define XE_GT_SRIOV_PF_MIGRATION_RING_TIMEOUT (HZ * 20)
 #define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
@@ -523,11 +524,18 @@ xe_gt_sriov_pf_migration_ring_consume_nowait(struct xe_gt *gt, unsigned int vfid
 	return ERR_PTR(-EAGAIN);
 }
 
+static void pf_mig_data_destroy(void *ptr)
+{
+	struct xe_sriov_pf_migration_data *data = ptr;
+
+	xe_sriov_pf_migration_data_free(data);
+}
+
 static void pf_gt_migration_cleanup(struct drm_device *dev, void *arg)
 {
 	struct xe_gt_sriov_pf_migration *migration = arg;
 
-	ptr_ring_cleanup(&migration->ring, NULL);
+	ptr_ring_cleanup(&migration->ring, pf_mig_data_destroy);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index 347682f29a03c..d39cee66589b5 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -12,6 +12,7 @@
 #include "xe_pm.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_migration.h"
+#include "xe_sriov_pf_migration_data.h"
 #include "xe_sriov_printk.h"
 
 static struct xe_sriov_pf_migration *pf_pick_migration(struct xe_device *xe, unsigned int vfid)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
new file mode 100644
index 0000000000000..cfc6b512c6674
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_bo.h"
+#include "xe_device.h"
+#include "xe_sriov_pf_migration_data.h"
+
+static bool data_needs_bo(struct xe_sriov_pf_migration_data *data)
+{
+	unsigned int type = data->type;
+
+	return type == XE_SRIOV_MIG_DATA_CCS ||
+	       type == XE_SRIOV_MIG_DATA_VRAM;
+}
+
+/**
+ * xe_sriov_pf_migration_data_alloc() - Allocate migration data packet
+ * @xe: the &struct xe_device
+ *
+ * Only allocates the "outer" structure, without initializing the migration
+ * data backing storage.
+ *
+ * Return: Pointer to &struct xe_sriov_pf_migration_data on success,
+ *         NULL in case of error.
+ */
+struct xe_sriov_pf_migration_data *
+xe_sriov_pf_migration_data_alloc(struct xe_device *xe)
+{
+	struct xe_sriov_pf_migration_data *data;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return NULL;
+
+	data->xe = xe;
+	data->hdr_remaining = sizeof(data->hdr);
+
+	return data;
+}
+
+/**
+ * xe_sriov_pf_migration_data_free() - Free migration data packet
+ * @data: the &struct xe_sriov_pf_migration_data packet
+ */
+void xe_sriov_pf_migration_data_free(struct xe_sriov_pf_migration_data *data)
+{
+	if (data_needs_bo(data)) {
+		if (data->bo)
+			xe_bo_unpin_map_no_vm(data->bo);
+	} else {
+		if (data->buff)
+			kvfree(data->buff);
+	}
+
+	kfree(data);
+}
+
+static int mig_data_init(struct xe_sriov_pf_migration_data *data)
+{
+	struct xe_gt *gt = xe_device_get_gt(data->xe, data->gt);
+
+	if (!gt || data->tile != gt->tile->id)
+		return -EINVAL;
+
+	if (data->size == 0)
+		return 0;
+
+	if (data_needs_bo(data)) {
+		struct xe_bo *bo = xe_bo_create_pin_map_novm(data->xe, gt->tile,
+							     PAGE_ALIGN(data->size),
+							     ttm_bo_type_kernel,
+							     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED,
+							     false);
+		if (IS_ERR(bo))
+			return PTR_ERR(bo);
+
+		data->bo = bo;
+		data->vaddr = bo->vmap.vaddr;
+	} else {
+		void *buff = kvzalloc(data->size, GFP_KERNEL);
+		if (!buff)
+			return -ENOMEM;
+
+		data->buff = buff;
+		data->vaddr = buff;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_sriov_pf_migration_data_init() - Initialize the migration data header and backing storage
+ * @data: the &struct xe_sriov_pf_migration_data packet
+ * @tile_id: tile identifier
+ * @gt_id: GT identifier
+ * @type: &enum xe_sriov_pf_migration_data_type
+ * @offset: offset of data packet payload (within wider resource)
+ * @size: size of data packet payload
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_migration_data_init(struct xe_sriov_pf_migration_data *data, u8 tile_id, u8 gt_id,
+				    unsigned int type, loff_t offset, size_t size)
+{
+	xe_assert(data->xe, type < XE_SRIOV_MIG_DATA_MAX);
+	data->version = 1;
+	data->type = type;
+	data->tile = tile_id;
+	data->gt = gt_id;
+	data->offset = offset;
+	data->size = size;
+	data->remaining = size;
+
+	return mig_data_init(data);
+}
+
+/**
+ * xe_sriov_pf_migration_data_init() - Initialize the migration data backing storage based on header
+ * @data: the &struct xe_sriov_pf_migration_data packet
+ *
+ * Header data is expected to be filled prior to calling this function
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_migration_data_init_from_hdr(struct xe_sriov_pf_migration_data *data)
+{
+	if (WARN_ON(data->hdr_remaining))
+		return -EINVAL;
+
+	data->remaining = data->size;
+
+	return mig_data_init(data);
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
new file mode 100644
index 0000000000000..1dde4cfcdbc47
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PF_MIGRATION_DATA_H_
+#define _XE_SRIOV_PF_MIGRATION_DATA_H_
+
+#include <linux/types.h>
+
+struct xe_device;
+
+enum xe_sriov_pf_migration_data_type {
+	XE_SRIOV_MIG_DATA_DESCRIPTOR = 1,
+	XE_SRIOV_MIG_DATA_TRAILER,
+	XE_SRIOV_MIG_DATA_GGTT,
+	XE_SRIOV_MIG_DATA_MMIO,
+	XE_SRIOV_MIG_DATA_GUC,
+	XE_SRIOV_MIG_DATA_CCS,
+	XE_SRIOV_MIG_DATA_VRAM,
+	XE_SRIOV_MIG_DATA_MAX,
+};
+
+struct xe_sriov_pf_migration_data *
+xe_sriov_pf_migration_data_alloc(struct xe_device *xe);
+void xe_sriov_pf_migration_data_free(struct xe_sriov_pf_migration_data *snapshot);
+
+int xe_sriov_pf_migration_data_init(struct xe_sriov_pf_migration_data *data, u8 tile_id, u8 gt_id,
+				    unsigned int type, loff_t offset, size_t size);
+int xe_sriov_pf_migration_data_init_from_hdr(struct xe_sriov_pf_migration_data *snapshot);
+
+#endif
-- 
2.50.1

