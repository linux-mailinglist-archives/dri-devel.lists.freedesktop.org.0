Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0F6C1E82B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 07:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AA710E89A;
	Thu, 30 Oct 2025 06:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IWVhbkrZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F27710E898;
 Thu, 30 Oct 2025 06:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761804484; x=1793340484;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F1M8O+MpqHXh2dQe8en1K0jsV+kOJqpbqP5n026dMg0=;
 b=IWVhbkrZQ4MNcz7mHghaqllhgeR/7KRS+iUirark2n8S/BJb6Kr0WGX6
 eLEht5mnI2nq52iqEDnltkBBUJOnU4WXpzvcksLnwqKYqsnhQfzbtYsaj
 o1JKeVmw6IcFJgLo+xaiDwvF+rr6kH3QmiPvfQ3gg/bvn9UAfapnm5NMt
 ovDPXD6jb2+vS5z58O//ki0c7vmOL1s26X2FjklQoZuw70/naLE9s1LXe
 QNHc3SLcqG+jBFp4eW9eFCY2TzcfZ8Wz4HKicrV1JXsEDhaF3F7crou6/
 aESwrfCvex4rojoN5ZRPHjV4F5iwmfT3Gir/iGG0Yc4d83gHOeZtB26tX g==;
X-CSE-ConnectionGUID: MEyWEdyrQIKxLlIlb22VDg==
X-CSE-MsgGUID: xnZxJef8TpC2N7IQwp9ssQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="81566354"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="81566354"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 23:08:04 -0700
X-CSE-ConnectionGUID: XZTP5+0uRLqiByY4qZc4Zg==
X-CSE-MsgGUID: /Zs7SC6mTZ6RG/vgTT4e5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="186607626"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 23:08:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 23:08:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 23:08:03 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 23:08:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PtcdgEtMcmiY52rVsEauY+eWMluO8IASP0Qze+MY5TB6QG2uq5GVBuwsJ63aGbm2fDJqOkV+k6G1XI+OWZf9GFRBHxUmVY9AvqT1YV4AyQZGLPw5sdC5CabjxhMxKFtCgzAHVVLT7Ud6sgE30dp13GZZXxa0m264PVLSR4wOyAqKIsb0f0tj5qAMM+1rkDDZPPEeQdR83+N+Zq/dCucq3dCg4buVG9Boia2WnywXrEORxnhSdFoFWAQGccmpZg8jYqrQnwm6C7j4ntpMOxEenwu8qQqI1CyccoJ0YLlt5zuR8yprcKBL0OPQcsVjzti0xjqMFqTl+lz9twQptRFHfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4gJsfiUPIX2pWqdIb2rSqzbDSsgPJcCa2a32QOwftbo=;
 b=C0IuWypvMtntRpLoQdCc426foW/aBTpH4Tkc8UgzrbWUxvHkgPBAS+oKBUaWvDfwnm4sYP3ZqU/fKW97pUF75QXUX+v951VjvfyTf3xNNIv6AmoGenAORwGHzY7SaUHNiLo6A6hM/X+j71xiBNbwRUTDBPyaqBHSL6VK7oUmRqTyhD56WOVlYGYNGcf8HrTGuE0riZaeuvcZpP0ujfHH/FEOwADNs3OFPgTo0EnXIUp/NP5w9y4RKFHuB5IEW26W5P+JuhF7p3rIGjhjp1e3dPliqFJlDCrysTVn5j2/prMwNWr6LfYRDUpz8cKNaUcRFiA/WmO8s4Ou/A5vXs7clA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DM4PR11MB7208.namprd11.prod.outlook.com (2603:10b6:8:110::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 06:08:01 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.9253.018; Thu, 30 Oct 2025
 06:08:01 +0000
Message-ID: <ede86234-da1f-4975-8ceb-a27dad72e35f@intel.com>
Date: Thu, 30 Oct 2025 07:07:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/26] drm/xe/migrate: Add function to copy of VRAM
 data in chunks
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-22-michal.winiarski@intel.com>
 <72f0caa9-50b3-4fb0-bc4b-41e67886be35@intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <72f0caa9-50b3-4fb0-bc4b-41e67886be35@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::28) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DM4PR11MB7208:EE_
X-MS-Office365-Filtering-Correlation-Id: 52dccf7d-daee-4e40-6220-08de177aae4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTA4SksxRCtMZkZhZTQyWmFnRnEwK2xyVHBhMEpyYnBUR0ZIcmgrbVdUVCtN?=
 =?utf-8?B?NEhJQlZRb2czbG9UamZVa0dtUTdlcTM3MS9Na2tQVVl0SnNsVU1mcGpEUG41?=
 =?utf-8?B?QVVITElHQVNtemNvK2dMbTdzUXkydURCdGVRRWZ1eDR2WUJsdTVyZ2dhSEh6?=
 =?utf-8?B?TnI5ZGpNTGxualN2M1dibm81aFlZSzg1RnIrT1ZhbTV1TDA5dU1COFlKU3ht?=
 =?utf-8?B?dzloZFBXSDZTQUo3YmZGeGZtMndBdURXUE5QVEJDTnJnbXU5dmZtWUx4b3NK?=
 =?utf-8?B?azdTaWIxeHB6ZFFQWnk3dkNINURyeXNVUlNaRkRCVHFPOGFZcVcyQ1VXUmpk?=
 =?utf-8?B?K1V2a1dBYmkyOGZLd3FwdGhjeVhrUnJUdmRmTTNGdENnVjUyRVdJMWFzREVK?=
 =?utf-8?B?SHE2eW1xaVVyUldYY0V4T2tSbzBNRUR0RDZocjdodVVNSFpNbm56ZGR1eTlv?=
 =?utf-8?B?anJWWTEvUDVoSHk1UmNqaHRIbDA3UEdKZzJzQUMxQlF0L3d1N3JyMGcxSnIz?=
 =?utf-8?B?b1VNOG1nUmVYUlJrZS94UHFtb0gxSjJrYmwxQytzbThsZkIraUZUSWdwb1cv?=
 =?utf-8?B?SFFUU0dDRG5uTVc1VVJndUswbFFhUUd4WWMyMWxQTk8vYlo5clBldldTMnpM?=
 =?utf-8?B?MUdYWlFwWFYyK1lHckFHZGFON29RdnZyK1hzaEZUVmIzNXpmQXdLMytrb1BR?=
 =?utf-8?B?VXhSMnVtSUc3THZhemcxM3FjU2tGTFhLdUd4LyttSERkN0VocCsxUVZReVAz?=
 =?utf-8?B?bm9QK3dvMVliaTJsSkMvOGZGaXJtT0R0NGV1aGxGenVlK0lwRE1jeWN1dW9v?=
 =?utf-8?B?Y3FmakpaRlAreUE0RHdCRmRsc1ZMZWlxam5BTHBKVEIwQ09ldG1MK0xlSWxl?=
 =?utf-8?B?TVNJUXFPUVFuajkzaDdCdUhOZ3E0MUp6OEhuWm9wSGVwckUvdGpMN2JaT3Vn?=
 =?utf-8?B?VXR2ZEhvZE5mbDFmT1Z5Z2V1dWdTWll6ZW1Ha1B4UVh1WGpwMGQ3T213OGJG?=
 =?utf-8?B?MklMYWgwd0drMDJJWDNOa2orQ0tVNUViaWd4c0pEUGlrYjBRcmx3dWJWbjlG?=
 =?utf-8?B?cjd5VjFEUEU4V2FmL2NGWVIzSVU1azBlSjNsQnRRWmtXM1J4Z1I3WGxPNFc3?=
 =?utf-8?B?dWcxb3RzdHYzWEtITGdOckg4azQ5UW9NZWVFZUtOSkFTSHJFNC9sTUh6c0M3?=
 =?utf-8?B?V3RVWEVscVdEd2UvZTFiVzc5ekxqODhPRk9Yc2hxYWNycFpQZTVnWmdMaFhT?=
 =?utf-8?B?VUl1SUc5NzVDOFJtWmJqVm04ZWxHNmhIWWFONy83N1pQMFMzWXRVOFZ2OEFV?=
 =?utf-8?B?ZGtOV0pRQWQxS0Qva2pvWEw5YTZ5Z0VZQWRpVlVFaWhVa1VZS2l1ZDlCUmJZ?=
 =?utf-8?B?MVpmWFdTMmhMSWNtNmlNZGtkbXF2UlFDTkU4d2N6ZHRxVFc3cVhBbjRkd25z?=
 =?utf-8?B?NmNwVnQwMEtJZkpweUVLdkVDUURPL3lZMUZKd2IyUFlsZWhidlI5aU9DRitz?=
 =?utf-8?B?VFQ2Uk1oOGo5bHpUYyswL1d3cUc4d1ZMM3dxRkl5NWg5TWs1QTRONDZuSkY5?=
 =?utf-8?B?c3BOTFJITEgzMU9IMmFKVk44ZlVITDRNL3BWcjcweElxcGFtRXRJVHZXUVRO?=
 =?utf-8?B?QW9YcEZMb3FwUW1oWFY5T0JHNEJoajJCNUZ3VnRDRlY4R1RGNWVaV0JYUDVk?=
 =?utf-8?B?bHpDSjdmOUVKQ3dLQ1U0RUo1QVo5a3R5MEN2R2tCUkI4ODBqVHpDbHlDbyta?=
 =?utf-8?B?elYvT2lFanNSMmlKVEZVR2hCTnFFOEFxQlN4OGpJQ2hnaVhFWC9kQUYvZnZC?=
 =?utf-8?B?UEplV3RBdndvbnRJbEt5akc0SGY0NS9NQVpieXZybTdhMTB0b2RQZTRBNGpw?=
 =?utf-8?B?dTE2MldZeEJhL2ZBYXNUQXdwNmYvZjBKSlBCZEdhRWtRMTU5clVFYm9UbmlI?=
 =?utf-8?B?N3NtRld2RU0yUUcvcHhUYUVBM2psbWk4SWszTTl0RFd5Vk9rZXVZclBKLytJ?=
 =?utf-8?Q?m8lup0REEUBPZOZdYOzGoe3RIjB3vw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXBwUzNPR09tNTVEcnEwbzhOb0QrUGVidFVGRllKN1VlVXBwOVA3Q2NLL1E3?=
 =?utf-8?B?c2tlZG5YZnM0TDFFMGdtWlhKblBMOXdGNHJxQVBqeW1saHgvT2EvSk9Nb0ls?=
 =?utf-8?B?TTEzNm5kdDhKWnZFOVQrRnFhRmxIaHpndnp4bjBZWm5qSmM0NTN5NkVYb2pN?=
 =?utf-8?B?Vkp2a3kxejhRcTBwdkZuTXdxcVVFYWEvZ3dLeVZyTkpVRDhndktObW51M3Vk?=
 =?utf-8?B?NDRaeEtaV01Gd0VFYVc3SWRTZklGbEdXOTU5bXRqdXlRR00wT3g0c2Nad2JJ?=
 =?utf-8?B?WjEwS1huenBsdzJYbFA1czAwaDlITHpROUIveXZUc2JaaEVZeXlTdU5ZUnlR?=
 =?utf-8?B?RHEwMlJvK2JOWHJSWDdGaHo5SHZyYm1JSEtyZWZKUlplOXNPS3hLOTNJYlhy?=
 =?utf-8?B?Wjh1ZHVFS25Camx6NmJGdTFPeXdYVzFRM2xMcDFoSzJBZTRjU0F1RkdBZldF?=
 =?utf-8?B?cDcxaU1MeklKWmd3ZUtPRE1GallMS094bGdydGMrZ1BsQVl2b1FIVURVeXg1?=
 =?utf-8?B?UnFhV3VIc1BBcSttenlDc01IZHBzUmpkOWd4Q25NWDErenh3NU51d1NjR1Bj?=
 =?utf-8?B?L3IxMkcxLzZPbUhtaWk1UUhwN2QwRTkvaGF5ek5FMmhlb2RrOUN2Ui8xSHJ4?=
 =?utf-8?B?K05NY3RlZFFIRHVYK3JpdGlHTHBpNE40TXJZTW5CZ21ubW56eWpBclVYK0o3?=
 =?utf-8?B?RklZbzVscEZSdGFJZ2o2a2x0RjNwV2xySHVnUUI3L1ZmQUc4eGF1UTFOZUVv?=
 =?utf-8?B?YnVsckJjTXBJNHdnYld0YjVoUlNHQllCVVNscXpxeTFCMlBMczhNTFBCUTha?=
 =?utf-8?B?RFJsTGxreUVNU3hFL1duN0UyS0FCQnhhd2RyVHdMOFhQc2hMN0RlMzZETThJ?=
 =?utf-8?B?ZTBZVGtscU44Uyt2bmFLRW9BQXJkZXpLRFMrcFBCY0J1V1NNa1dEeDlNMnMr?=
 =?utf-8?B?YzRKK05qRmVjZlNYNWJDS2V6UDdHTHFyaHVMT0VMSk1jQ3JqQit6dncwUHJS?=
 =?utf-8?B?a1llTDhXTC9xK1J3NDgxREU4UGh3OHdFVG5CenZETTJIS3hFd25GZEwzdDYx?=
 =?utf-8?B?N0hKamNscGlEYjBNcmF5bVZubFB1NEtWS0JFcUJXcHNQQ05PMllvZThNVExo?=
 =?utf-8?B?aExKVEhDRGF6c2ozMlp4L2JDYU5FREdPbUwxT0xlMGxjVldjTTRQLzJsKzNx?=
 =?utf-8?B?WEZZaEhaZGV3dWVGYjJiUkJLeEk2WlN4bzNzeGFKQmdOK2QwOVpDYlBielpL?=
 =?utf-8?B?N3lCV1JGZVZ1ejZ1d3RsV212MFA5ZXlhQTB3eGd3YkdrUEJtM3ZmcEpILy96?=
 =?utf-8?B?dW1PbUNHQllZMnhOdHZwSDZFYjFwNmFYYnd4SzV5SkxxTmxaaFYyTnp1Si82?=
 =?utf-8?B?blZ0MGtEOCtRcDVvcTlUN2J4MUN2Q2l2T1d5YSsrNEkxaVkxUzRTUnlVajdi?=
 =?utf-8?B?UUgvVVFicFQxbXI0czFrUXVjcEtlcG00amNTdDVUcTlTM2Y0eVpkcmNGS1BP?=
 =?utf-8?B?YWlUQXpqbVAxUEVqcVpBU3EzZVNUNFQyc0QrcVV0WkJjQkNaVG4ySE9tQ0Vq?=
 =?utf-8?B?Nmx4aEpkb1pXQVRQYlZlOEZCOHMyamtVdzNjUTF5VVZMRHlYc2tsckxnczhW?=
 =?utf-8?B?NkpiTU9PNG1yVnZNMlFlejdxMHpmWmo0WWFkdjZ5MmFRMFJ0ZkVML204RzVH?=
 =?utf-8?B?VGI1SzV3czNGWnNCbk1ua3pUcGJvYWhic0I3NU9kSytWYVNaVnZJMDg2aDNL?=
 =?utf-8?B?MHZlOVdZMjNVb1JyVTRsZFc2czNqekU4TWxPZDEvNjhwczIzMUVVd1ZLUWs0?=
 =?utf-8?B?ODFENDVDcmh3OVJ3ckUzNnMzTUpYMERuRG9kVWJVQko1WExzNG96dWttaldy?=
 =?utf-8?B?NHBLeXRyTGlQbkpOelN4WDJlb3JHekJlWWxUMFJBS1pJZ3Z1dFNoSnZYcmhZ?=
 =?utf-8?B?akNBU3d6ODhRNG1OcUJ4bFJSMHdkajRQYS92eEpQQzNzZUM1SlFLMERFM1d1?=
 =?utf-8?B?dmRaejlnYm15azNUVG1xcW9nVVFmWXdQcGJMdFk0cDA2bjhNNHlyZGxocExw?=
 =?utf-8?B?c2NCa3lKNWQwMGNpc09vamM1bjFtVnR2UjEwMFlXTkNYbFBKOW5uZU9SNlI3?=
 =?utf-8?B?c3M5OHIxK1RieHFhVFNlRVBpdktiMWFhMEZ2bnBQbGZJNitjbHBOYm11VVFj?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52dccf7d-daee-4e40-6220-08de177aae4b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 06:08:01.3185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XitNmmHVp4kLIyV14ZSnmODvGIX+YlGCYU+xRKTz7Ho1/R5s6kHB5Fh1+to2J7I7EfS3nQLp13hqvQ1rOOTAeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7208
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

On 10/23/2025 21:29, Michal Wajdeczko wrote:
>
> On 10/22/2025 12:41 AM, Michał Winiarski wrote:
>> From: Lukasz Laguna <lukasz.laguna@intel.com>
>>
>> Introduce a new function to copy data between VRAM and sysmem objects.
>> The existing xe_migrate_copy() is tailored for eviction and restore
>> operations, which involves additional logic and operates on entire
>> objects.
>> The xe_migrate_vram_copy_chunk() allows copying chunks of data to or
>> from a dedicated buffer object, which is essential in case of VF
>> migration.
>>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c | 134 ++++++++++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_migrate.h |   8 ++
>>   2 files changed, 136 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index 3112c966c67d7..d30675707162b 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -514,7 +514,7 @@ int xe_migrate_init(struct xe_migrate *m)
>>   
>>   static u64 max_mem_transfer_per_pass(struct xe_device *xe)
>>   {
>> -	if (!IS_DGFX(xe) && xe_device_has_flat_ccs(xe))
>> +	if ((!IS_DGFX(xe) || IS_SRIOV_PF(xe)) && xe_device_has_flat_ccs(xe))
> being a PF is permanent case, while your expected usage is only during of the handling of the VF migration.
>
> maybe it would be better to introduce flag FORCE_CCS_LIMITED_TRANSFER and pass it to the migration calls when really needed ?

I don't think this change is necessary anymore since we removed support 
for raw CCS copy. I'll revert these updates. I tested the copy with 8M 
blocks on BMG, and it worked fine.

>
>>   		return MAX_CCS_LIMITED_TRANSFER;
>>   
>>   	return MAX_PREEMPTDISABLE_TRANSFER;
>> @@ -1155,6 +1155,133 @@ struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate)
>>   	return migrate->q;
>>   }
>>   
>> +/**
>> + * xe_migrate_vram_copy_chunk() - Copy a chunk of a VRAM buffer object.
>> + * @vram_bo: The VRAM buffer object.
>> + * @vram_offset: The VRAM offset.
>> + * @sysmem_bo: The sysmem buffer object.
>> + * @sysmem_offset: The sysmem offset.
>> + * @size: The size of VRAM chunk to copy.
>> + * @dir: The direction of the copy operation.
>> + *
>> + * Copies a portion of a buffer object between VRAM and system memory.
>> + * On Xe2 platforms that support flat CCS, VRAM data is decompressed when
>> + * copying to system memory.
>> + *
>> + * Return: Pointer to a dma_fence representing the last copy batch, or
>> + * an error pointer on failure. If there is a failure, any copy operation
>> + * started by the function call has been synced.
>> + */
>> +struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
>> +					     struct xe_bo *sysmem_bo, u64 sysmem_offset,
>> +					     u64 size, enum xe_migrate_copy_dir dir)
>> +{
>> +	struct xe_device *xe = xe_bo_device(vram_bo);
>> +	struct xe_tile *tile = vram_bo->tile;
>> +	struct xe_gt *gt = tile->primary_gt;
>> +	struct xe_migrate *m = tile->migrate;
>> +	struct dma_fence *fence = NULL;
>> +	struct ttm_resource *vram = vram_bo->ttm.resource;
>> +	struct ttm_resource *sysmem = sysmem_bo->ttm.resource;
>> +	struct xe_res_cursor vram_it, sysmem_it;
>> +	u64 vram_L0_ofs, sysmem_L0_ofs;
>> +	u32 vram_L0_pt, sysmem_L0_pt;
>> +	u64 vram_L0, sysmem_L0;
>> +	bool to_sysmem = (dir == XE_MIGRATE_COPY_TO_SRAM);
>> +	bool use_comp_pat = to_sysmem &&
>> +		GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe);
>> +	int pass = 0;
>> +	int err;
>> +
>> +	xe_assert(xe, IS_ALIGNED(vram_offset | sysmem_offset | size, PAGE_SIZE));
>> +	xe_assert(xe, xe_bo_is_vram(vram_bo));
>> +	xe_assert(xe, !xe_bo_is_vram(sysmem_bo));
>> +	xe_assert(xe, !range_overflows(vram_offset, size, (u64)vram_bo->ttm.base.size));
>> +	xe_assert(xe, !range_overflows(sysmem_offset, size, (u64)sysmem_bo->ttm.base.size));
>> +
>> +	xe_res_first(vram, vram_offset, size, &vram_it);
>> +	xe_res_first_sg(xe_bo_sg(sysmem_bo), sysmem_offset, size, &sysmem_it);
>> +
>> +	while (size) {
>> +		u32 pte_flags = PTE_UPDATE_FLAG_IS_VRAM;
>> +		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
>> +		struct xe_sched_job *job;
>> +		struct xe_bb *bb;
>> +		u32 update_idx;
>> +		bool usm = xe->info.has_usm;
>> +		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
>> +
>> +		sysmem_L0 = xe_migrate_res_sizes(m, &sysmem_it);
>> +		vram_L0 = min(xe_migrate_res_sizes(m, &vram_it), sysmem_L0);
>> +
>> +		drm_dbg(&xe->drm, "Pass %u, size: %llu\n", pass++, vram_L0);
> nit: there is xe_dbg()

Ok

>
>> +
>> +		pte_flags |= use_comp_pat ? PTE_UPDATE_FLAG_IS_COMP_PTE : 0;
>> +		batch_size += pte_update_size(m, pte_flags, vram, &vram_it, &vram_L0,
>> +					      &vram_L0_ofs, &vram_L0_pt, 0, 0, avail_pts);
>> +
>> +		batch_size += pte_update_size(m, 0, sysmem, &sysmem_it, &vram_L0, &sysmem_L0_ofs,
>> +					      &sysmem_L0_pt, 0, avail_pts, avail_pts);
>> +		batch_size += EMIT_COPY_DW;
>> +
>> +		bb = xe_bb_new(gt, batch_size, usm);
>> +		if (IS_ERR(bb)) {
>> +			err = PTR_ERR(bb);
>> +			return ERR_PTR(err);
>> +		}
>> +
>> +		if (xe_migrate_allow_identity(vram_L0, &vram_it))
>> +			xe_res_next(&vram_it, vram_L0);
>> +		else
>> +			emit_pte(m, bb, vram_L0_pt, true, use_comp_pat, &vram_it, vram_L0, vram);
>> +
>> +		emit_pte(m, bb, sysmem_L0_pt, false, false, &sysmem_it, vram_L0, sysmem);
>> +
>> +		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>> +		update_idx = bb->len;
>> +
>> +		if (to_sysmem)
>> +			emit_copy(gt, bb, vram_L0_ofs, sysmem_L0_ofs, vram_L0, XE_PAGE_SIZE);
>> +		else
>> +			emit_copy(gt, bb, sysmem_L0_ofs, vram_L0_ofs, vram_L0, XE_PAGE_SIZE);
>> +
>> +		job = xe_bb_create_migration_job(m->q, bb, xe_migrate_batch_base(m, usm),
>> +						 update_idx);
>> +		if (IS_ERR(job)) {
>> +			err = PTR_ERR(job);
>> +			goto err;
> this goto inside 'while' loop is weird

Good point

>
>> +		}
>> +
>> +		xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
>> +
>> +		WARN_ON_ONCE(!dma_resv_test_signaled(vram_bo->ttm.base.resv,
>> +						     DMA_RESV_USAGE_BOOKKEEP));
>> +		WARN_ON_ONCE(!dma_resv_test_signaled(sysmem_bo->ttm.base.resv,
>> +						     DMA_RESV_USAGE_BOOKKEEP));
> xe_WARN_ON_ONCE() ?
>
> but why do not use asserts() if we are sure that this shouldn't happen ?

Ok, I'll use asserts

>
>> +
>> +		mutex_lock(&m->job_mutex);
> scoped_quard(mutex) ?

Ok

>
>> +		xe_sched_job_arm(job);
>> +		dma_fence_put(fence);
>> +		fence = dma_fence_get(&job->drm.s_fence->finished);
>> +		xe_sched_job_push(job);
>> +
>> +		dma_fence_put(m->fence);
>> +		m->fence = dma_fence_get(fence);
>> +		mutex_unlock(&m->job_mutex);
>> +
>> +		xe_bb_free(bb, fence);
>> +		size -= vram_L0;
>> +		continue;
>> +
>> +err:
>> +		xe_bb_free(bb, NULL);
>> +
>> +		return ERR_PTR(err);
>> +	}
>> +
>> +	return fence;
>> +}
>> +
>>   static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>>   				 u32 size, u32 pitch)
>>   {
>> @@ -1852,11 +1979,6 @@ static bool xe_migrate_vram_use_pde(struct drm_pagemap_addr *sram_addr,
>>   	return true;
>>   }
>>   
>> -enum xe_migrate_copy_dir {
>> -	XE_MIGRATE_COPY_TO_VRAM,
>> -	XE_MIGRATE_COPY_TO_SRAM,
>> -};
>> -
>>   #define XE_CACHELINE_BYTES	64ull
>>   #define XE_CACHELINE_MASK	(XE_CACHELINE_BYTES - 1)
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
>> index 4fad324b62535..d7bcc6ad8464e 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.h
>> +++ b/drivers/gpu/drm/xe/xe_migrate.h
>> @@ -28,6 +28,11 @@ struct xe_vma;
>>   
>>   enum xe_sriov_vf_ccs_rw_ctxs;
>>   
>> +enum xe_migrate_copy_dir {
>> +	XE_MIGRATE_COPY_TO_VRAM,
>> +	XE_MIGRATE_COPY_TO_SRAM,
>> +};
> nit: it's time for xe_migrate_types.h ;)
>
> but not as part of this series
>
>> +
>>   /**
>>    * struct xe_migrate_pt_update_ops - Callbacks for the
>>    * xe_migrate_update_pgtables() function.
>> @@ -131,6 +136,9 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>   
>>   struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
>>   struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
>> +struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
>> +					     struct xe_bo *sysmem_bo, u64 sysmem_offset,
>> +					     u64 size, enum xe_migrate_copy_dir dir);
>>   int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>>   			     unsigned long offset, void *buf, int len,
>>   			     int write);
