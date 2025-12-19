Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F26DCCFFB5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 14:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFB410EF9E;
	Fri, 19 Dec 2025 13:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QqKi+a58";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8BA10EF96;
 Fri, 19 Dec 2025 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766149830; x=1797685830;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=djLxlIm7sjopa+jm8GKqvN/RGI5nlrHWjOx5uOoePqk=;
 b=QqKi+a58PtjZ5FveLPq9oMSL34yUPfdH6dRszHsn98oJUpV+Hb2JCD4b
 VctbLstWePLrQqAMSokbp5ec00R8Oht4qV1M5qDfUolBrEXTUsJHshycv
 e2VhxLrfJkoGscZEqISOljiBIIgh4NhylBx3dPVCL3PzzQuubsqp5tH3y
 3wfj9ye+FJpcpWOniaYT6jIc7cq8HpODTt/BsH5HVpqko5o7n4wavo/Pz
 VioqhIklGyKKyxyoVE8wE5BI9mhEzqQWauLwy+oQUsEbhqW4BgSiZtqtc
 Bj1g2nRKagI5hdCXiSTGbCqRJ5OnC1vzx2YIQvSSwklfsI5eYQ26oKE3y A==;
X-CSE-ConnectionGUID: TIbRBR+qQ9CQK+D5ncb6YQ==
X-CSE-MsgGUID: +avakif3QBmYekVjEPRmAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71955341"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="71955341"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 05:10:30 -0800
X-CSE-ConnectionGUID: ZWqxwwWiQO+jzMWCdv3fEg==
X-CSE-MsgGUID: ZmynWFPJQMm3ox/PZ1lIDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="198619896"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 05:10:30 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 05:10:28 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 05:10:28 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 05:10:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyPtgfAI/dWRS6PFQarVuaBKQh/YRIiuWgLbdmcMexLuT+fRbq9I1Ym1Om10OwZ1ZoKqtMPw5BeRrezWblbl14z4KV0ol8JV41jL22sWm6gs3YyU17WCQgyU6S3hi6yogv8DtKD9M2G8nHKD6ykcMC6OaEP/fImXukEjLuWbqksYvG4qH1OVTKz1bRzgg6RKD1Zbf/HgD9fYyjVgyevw9mdiX9sQAovP3VI9XGLkdTTpg6lyOeARA3CxU2OyHZ7XYvxuBcC0yILGYjy077Vy9KYam0vnti3rv4Ya6QiE7BSyGaNvAsKFqGivQoiN6yAZcg9CA2/bj7E9X/2uENeAMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEMuHF9y6kSqveAvX2dQvLbNYGHI2aV9+tu8W3njnXM=;
 b=N0cSmuDKkh8L/sPlMYN+RAP0vWuJ98Zc9WxfjbElc0P81oduWuNsydB7Yu897dUboJDeMqnos+GD/3KrFGAQl1hyhCsMFmH/6ogGx+DD57sUH2J4GJIkJA9zk9d7hlv8ndWGN1JkLO5ygYjKi4kGbKakyBrLB/Y7AhEodfYhF2Fthc/f53i8s5a4O72Jk7/D9wwAYG43Syv5fFuuuooG+FG+bbpkXW3Sanq2cWtNWofzKXTes/EltX7PXfs79ifHyoi4Rlj+BWtD+/Dbl3YlEHSkZWcRvjOIJXp5kd97/a9wKA3VYqzMvJFhuftZvYlLozpDjhxlArMxBk3Nb4lJYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM3PPF1A07FAA60.namprd11.prod.outlook.com (2603:10b6:f:fc00::f0d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 13:10:26 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 13:10:26 +0000
Message-ID: <5dc6186c-cb88-45a7-bdc3-aa6d509e75ed@intel.com>
Date: Fri, 19 Dec 2025 18:40:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 39/51] drm/amd/display: add 3x4 matrix colorop
Content-Language: en-GB
To: Tvrtko Ursulin <tursulin@ursulin.net>, Alex Hung <alex.hung@amd.com>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <shashank.sharma@amd.com>,
 <agoins@nvidia.com>, <joshua@froggi.es>, <mdaenzer@redhat.com>,
 <aleixpol@kde.org>, <xaver.hugl@gmail.com>, <victoria@system76.com>,
 <daniel@ffwll.ch>, <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <louis.chauvet@bootlin.com>, <mcanal@igalia.com>, <nfraprado@collabora.com>,
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
 <20251115000237.3561250-40-alex.hung@amd.com>
 <83bf2281-e604-48fd-a8ff-533ae86bc52e@ursulin.net>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <83bf2281-e604-48fd-a8ff-533ae86bc52e@ursulin.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0204.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::16) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DM3PPF1A07FAA60:EE_
X-MS-Office365-Filtering-Correlation-Id: a2539199-e5c3-44c8-5430-08de3efff996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sjh1YVlQOGVHUGlnOWxXL3V5dEJYSGZ1TlN4TVhEQUpGTUtaRzNIWDhjUUdw?=
 =?utf-8?B?Rm95TWpiNStPekpiazJoQkpkdWc1V1lyRzdQbW1zVWpMWk1RWjdieEYwZlQr?=
 =?utf-8?B?ZlFLaTJtZ1BBcDB0UzQyTU1wNUM3N1dmMkVjdC9RSExIUE5zVWtPS0NtSkRt?=
 =?utf-8?B?bm1oTHJPSlN3dU80YXFpanNkdTJxZTZlaGJwRGEvZVMxL1dRT3M1N3BrU0tY?=
 =?utf-8?B?MEtCTzFPbVpzRlFCY1FRVldQcENKYWNMNXAyeS96YVQ3Sm9kd1V5UnBiYlFr?=
 =?utf-8?B?VnJIbWhXOXpFem4vK2dBWjJWdW5UWkNPK0NGdTl4UU9GV0NFYkwwdVVBb3Fw?=
 =?utf-8?B?MjV5S2pGbW9iZFUycG5VTFVGZ1VjZEt6Wko2d2RiYStmL296aDRQazlxS2RQ?=
 =?utf-8?B?L2YxUDRRYzRuTFFjWFN6VUtRbUpBdjJINEZzY1NOZGxQM205QlR0T21DbFhQ?=
 =?utf-8?B?N3FMSEpNVmtSbEt5WnZTanZFWVA4dHJTUHVQRHBTT2JXckRUMnB6WVNpcmxn?=
 =?utf-8?B?N1czQ2RDN284TjhEVDRDN3dXbmdpakdqMUNhVUZHTGZiZ005V3JoM3lnbGZV?=
 =?utf-8?B?TnBnRytzdXdDNHJwYWxjOUMyOXdqbUhVSGZJZC90S3VFQW5HQjlDeG5ORng4?=
 =?utf-8?B?MTFISFFiamFud1RkazlIbzFPcFl0TkIxYmt0MG1lRmh2WlBibmhZbnJCTGRt?=
 =?utf-8?B?UnJUWFVuQSthZk1NMm84WlVqZnBHVmlQWVlaemVUaUVndUlDYVliQnFCdnlN?=
 =?utf-8?B?VFVQTy8wdGh0dnB2Z1JMS3lEM01QTVltY0tWWXc2cENLeWhSeVlSNzF6ZnNT?=
 =?utf-8?B?WldGMG51TnNicmd2dzBJZjNVV2lPQTlDN1RWazliU3haSzlGV1ZISEhHdEsr?=
 =?utf-8?B?R0o1ZXNmQ3V1UWNTTnRxRlVwclhjdFJXWTBKd1diQ21VcGJEemZ1c1lzRUVj?=
 =?utf-8?B?eCtIUWJsU2d1RjArcVpBaWJSbDdoSGF4eGdFYXR1T2o3dEJXdnJQUW82dUpa?=
 =?utf-8?B?TlFQeHBaWXczUE9iMFdwMEJrTEpNZktUdFRQVmRDUVFtaHFqTFJYYktMUGp3?=
 =?utf-8?B?Q3BZY01wOXJUVmJETlZ1K0dvRmUyL0RMZStlVElVUUsrbGErdGhnaU5BT2tM?=
 =?utf-8?B?d3lqVUVVcFVReVFxdjNiVThGNXBROVFtYk5NVU9IWXh4NStPS0t1dzJldkx2?=
 =?utf-8?B?cmNPR01RU3JNRVVRTk91eXJzR2U4V0llWC9GYUg1NVdsTzNBMTd6ZE01MTRX?=
 =?utf-8?B?YXY4YTF5Ykp5c09rb0NXVEhQaytJN0xqZkhVVjRsWGhVWTBiUE9ocDF1cVFl?=
 =?utf-8?B?ZHRUN0FwUEYyS0oxT2pYbE5OMWdLK3g1UlZxSGhHdEorWnNwUGNZbEEyeHo5?=
 =?utf-8?B?VHhLbXQrUmg4WGVoTGJpQndmL1hlcFJmVmh4OTBnaU5UTmFDZ2JFaDRHaUpP?=
 =?utf-8?B?YXhibmd5dzJKL05uUG9vcVFqeDBNT0J5UlFLSC9XalNhUmpndThFTTh5SGI4?=
 =?utf-8?B?YnV1NWRBWVJiYkdza2M2MnF1cHFrMTBGV3JpUEY2K0haQ3BvbUNyK282V2oz?=
 =?utf-8?B?QUpPN0p0Y3R6L0g0MlVuaFMxUUVVTGdhRE16V2ZLZFRMdy81YkdTWjVGTWcr?=
 =?utf-8?B?eGhsWE0vTUptQzdKN2I0MnhDNnVQWmxGcjZsVGtHZTlJelIwV3NQWURoV0Ev?=
 =?utf-8?B?Z3FGUGVTNjR3YXh0cnhxTFppejBSVHdTRXJ1b0plek81enlIbGcwb3M5VmJG?=
 =?utf-8?B?S1dYSzlicFVVd3RlalZrbmdiRHQ5Nmx2VW5ibHVhc0tnTDZuZmpPaVAyMWVW?=
 =?utf-8?B?NWFzYUc2eEl5Z1dSNkk1K0Q4WmRPUkUxVFF1VTZmVTdtMGhBYTVrMHc2aEJv?=
 =?utf-8?B?bmhFcm02Q0ZIU1RmYi9ZZmtKSkFwZ3F6TTFvVTRvQXhJNDJBZ0pGRW1FeTlK?=
 =?utf-8?B?N2NucEhJcVlEckpUSWZqV0tGb09MbFZWYnNYNFE5Y0J0UjJWMlJzRS9JRFZB?=
 =?utf-8?B?YkFFY01CUDVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzhnS2RIOXlkM3JTSmUxZEZoN3A4K2VEU2E1Zm1IaWNEazltSXcybktMZmV3?=
 =?utf-8?B?bEo0RlZBS1ljVFp4ZkIwUEdrV293c2toRy8zZjFnSFFBY2YwRGVvVTZBYWty?=
 =?utf-8?B?MHJ1Y0NKMnhOcGtpUHpFdVlJV1FJYjR0eXBidHBiWVN4dk9FNklqdVJXVUVZ?=
 =?utf-8?B?cnp4amJ3dUwzemswN0RYSHlGMTlSU085UmtySUpwc1p3dG8yU0thT1VrVm5C?=
 =?utf-8?B?L203ZlIyYzNwZVEvOUhKQmxITXZaV2FYL2F4aVpwdlFoUGtXWEFWMTNRYXlp?=
 =?utf-8?B?WU1aRjNzQ2loUnEwbHlaMS9ObWVTa0luTjZkbG96MnRuaFhMZ25xQWtObTQ1?=
 =?utf-8?B?dTY3Y2xuUlhyam9xRnF5bWtsUmc0REk5VTFMb0o1b3ZwUnhySGt5UVdNRnVh?=
 =?utf-8?B?TjB0Yyt2dVZrYmQ2Y3ZNbWZUMkJxZ0l2d0JkRklRMmNHU3lmZnE0SG1zODZs?=
 =?utf-8?B?bDU5bFpVYndML25XVUQ5QWNtZFpIdE5NdEJBYVlZcUdSaW1ieTVFYU9vWmhQ?=
 =?utf-8?B?YkdqMUlpc1lBNERqODBHVFl2R0tqV01kVE8yVXU0SlhPSWkxTVo2azYyUStz?=
 =?utf-8?B?Z2hTNGVOTURQWmVBSStHaWx3ejVqTkg0ZWsweDZib3htNUt5Q0xLT1dwSExS?=
 =?utf-8?B?T3UzNHF0c2d6Q1k2WklzUzAyeHp4ZFdmWnNCY012ME4rOGhVaENFa0pjK2FJ?=
 =?utf-8?B?ZThPalNYQVNyakl4NGlKQjdlQVRzTmhRekxUQy9VOVg2bTdUZHFlaXBUQjNp?=
 =?utf-8?B?MHUycDBsNUJnL2JwWTR2MEhRLzM4aElqWmJ6ZVcyUDBEN2oxL05PbHF6cXdJ?=
 =?utf-8?B?SnFaNUk5NkNmeDdZWVZnNnRIKysrNW5obWFaRjg4MW5iZ3QvVm40Z1phTE1C?=
 =?utf-8?B?QzJZalRGMDlVbGxzT1hxOXhJZmtQMHVDR3R2WU91SU5PS1ZGRkl2NDFOSDIw?=
 =?utf-8?B?aUovMENZc05ScXZqVEhlYjkxS3pXci9GQWwyK0JJdmY4cU1TZGU3VTdYRldn?=
 =?utf-8?B?T1VCZ2JzT1NXRmRwK1lERDB6SXVYRnJ6KzRPckJhTTdUdnRkK05GNWRPSUtC?=
 =?utf-8?B?VzEvc2VvL3NOZnJEanhNRXMraEk1aHZNMWFvWk1UN0QrSkRUdUxxczlwdDBU?=
 =?utf-8?B?aWtYc2ZFMndaMGprZ2JtYVp4ajRxSXlpUUZpaEYxcWdjeTlNaFliUU9rSnFT?=
 =?utf-8?B?c05KajlDYzhYdy8ySE9RcmxDRU9oaktwSTRpVU5BRDFFVGFCS2ttbkU0T2VC?=
 =?utf-8?B?MTNYbXFTd0ZFdVdSeUJiMDFPblNNZXY5TDBVVGNXaWt0OGhGLyt3UC8valA5?=
 =?utf-8?B?SXdCTDJIbDNjVGhDZHNHTi9idWNEWUVUaEdqK1ZzWmZQNDJQWVN5TXZFNm9K?=
 =?utf-8?B?MEtxaGdWTlZFK0Q4OTZGc3MxQTRXTTJSWXBsdldFSVBaMi9YenY4dE9mUkxh?=
 =?utf-8?B?RzV6M0lwcGowYXRkUDN3YlhhZy9ZTDVlb1U2MkFBMm85Z1h5MDNockxraVpL?=
 =?utf-8?B?M2lEbG15QkcxNk82eXdoTmplSjNJd2dlckR6OE5ibE5VclRKRmpkRnhzKzZ1?=
 =?utf-8?B?djVRaXNwOEk1dUF2d28wdU0xV05lTWkzN2RDYWRlYkgySHJoa01JWlNzUDN6?=
 =?utf-8?B?OHVZNjNxN3NnLzV5TmZ0NlplNTg5eWJjQkprUEhUZHozMG80WnVRUmw1NVpE?=
 =?utf-8?B?N055NE5ldXBrQnFZdklndndISDZaemlubDlaSTl6a1BUNzM3R2tmTk10M3pN?=
 =?utf-8?B?Z0ppSm1Mb0kzWW5weVlSeEFVOFBSM3V4MXlyMGh0L2NXeFU1YU1Td0h1WVNG?=
 =?utf-8?B?VUloV2xzUEQ5djIrWUloeTdycHBhaWNzMURtbDFRSXhvbFcwV3l2NHBnNU5m?=
 =?utf-8?B?UzE0MDN6bFcrTFRselh4ajZlNTg4ZkhDMys5Q1MrTGVCWEx5bXNyZEF3VGR3?=
 =?utf-8?B?VHc4U0FzSzF1bHJCOWNPa0h1WGVtTTlpbXdhU1NnYnNVNUxVamQwMllJVVJL?=
 =?utf-8?B?dTBmMllvT0ZOblNmb0t2MlBpU284eGFONnFDN3RZTUlkQmJWejB5Wjdqa1R3?=
 =?utf-8?B?c21HOWhwcjdwYk9EanhGcmkwZzNVczRaSk50Q3FNcVhjYTlTcklJYXR4VER6?=
 =?utf-8?B?VXNiQkVRT2JJam9aNXZqUklBK3RTWE9NdEMzWWREbUh4U3lEL0d1blpKNnpp?=
 =?utf-8?Q?2IDktKxQm+Kx46lOFt+vAQc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2539199-e5c3-44c8-5430-08de3efff996
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 13:10:26.1478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zg4Zvw1f0fj8s2kgy3ayWiRhnjDwFwikUlbw0KU20QVRW3IfdbwC0JfRPv7IMVqMs2EHREjMnt6ZjTgzg6oYhzbF5uWuzrk/FhsiHehordI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1A07FAA60
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



On 12/19/2025 6:11 PM, Tvrtko Ursulin wrote:
> 
> On 15/11/2025 00:02, Alex Hung wrote:
>> This adds support for a 3x4 color transformation matrix.
>>
>> With this change the following IGT tests pass:
>> kms_colorop --run plane-XR30-XR30-ctm_3x4_50_desat
>> kms_colorop --run plane-XR30-XR30-ctm_3x4_overdrive
>> kms_colorop --run plane-XR30-XR30-ctm_3x4_oversaturate
>> kms_colorop --run plane-XR30-XR30-ctm_3x4_bt709_enc
>> kms_colorop --run plane-XR30-XR30-ctm_3x4_bt709_dec
>>
>> The color pipeline now consists of the following colorops:
>> 1. 1D curve colorop
>> 2. 3x4 CTM
>> 3. 1D curve colorop
>> 4. 1D LUT
>> 5. 1D curve colorop
>> 6. 1D LUT
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Reviewed-by: Daniel Stone <daniels@collabora.com>
>> Reviewed-by: Melissa Wen <mwen@igalia.com>
>> ---
>> v13:
>>   - Remove redundant ternary null check for drm_color_ctm_3x4 blob 
>> (Coverity Scan)
>>
>> V10:
>>   - Change %lu to %zu for sizeof() in drm_warn (kernel test robot)
>>   - Remove redundant DRM_ERROR(...)
>>
>> V9:
>>   - Update function names by _plane_ (Chaitanya Kumar Borah)
>>
>> v8:
>>   - Return -EINVAL when drm_color_ctm_3x4's size mismatches (Leo Li)
>>
>> v7:
>>   - Change %lu to %zu for sizeof() in drm_warn
>>
>> v6:
>>   - fix warnings in dbg prints
>>
>>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 52 +++++++++++++++++++
>>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 15 ++++++
>>   2 files changed, 67 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> index b958f9c0a0c2..298f337f0eb4 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> @@ -1378,6 +1378,47 @@ __set_dm_plane_colorop_degamma(struct 
>> drm_plane_state *plane_state,
>>       return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
>>   }
>> +static int
>> +__set_dm_plane_colorop_3x4_matrix(struct drm_plane_state *plane_state,
>> +                  struct dc_plane_state *dc_plane_state,
>> +                  struct drm_colorop *colorop)
>> +{
>> +    struct drm_colorop *old_colorop;
>> +    struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
>> +    struct drm_atomic_state *state = plane_state->state;
>> +    const struct drm_device *dev = colorop->dev;
>> +    const struct drm_property_blob *blob;
>> +    struct drm_color_ctm_3x4 *ctm = NULL;
>> +    int i = 0;
>> +
>> +    /* 3x4 matrix */
>> +    old_colorop = colorop;
>> +    for_each_new_colorop_in_state(state, colorop, new_colorop_state, 
>> i) {
>> +        if (new_colorop_state->colorop == old_colorop &&
>> +            new_colorop_state->colorop->type == DRM_COLOROP_CTM_3X4) {
>> +            colorop_state = new_colorop_state;
>> +            break;
>> +        }
>> +    }
>> +
>> +    if (colorop_state && !colorop_state->bypass && colorop->type == 
>> DRM_COLOROP_CTM_3X4) {
>> +        drm_dbg(dev, "3x4 matrix colorop with ID: %d\n", colorop- 
>> >base.id);
>> +        blob = colorop_state->data;
>> +        if (blob->length == sizeof(struct drm_color_ctm_3x4)) {
>> +            ctm = (struct drm_color_ctm_3x4 *) blob->data;
>> +            __drm_ctm_3x4_to_dc_matrix(ctm, dc_plane_state- 
>> >gamut_remap_matrix.matrix);
>> +            dc_plane_state->gamut_remap_matrix.enable_remap = true;
>> +            dc_plane_state->input_csc_color_matrix.enable_adjustment 
>> = false;
>> +        } else {
>> +            drm_warn(dev, "blob->length (%zu) isn't equal to 
>> drm_color_ctm_3x4 (%zu)\n",
>> +                 blob->length, sizeof(struct drm_color_ctm_3x4));
>> +            return -EINVAL;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int
>>   __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
>>                     struct dc_plane_state *dc_plane_state,
>> @@ -1581,6 +1622,17 @@ amdgpu_dm_plane_set_colorop_properties(struct 
>> drm_plane_state *plane_state,
>>       if (ret)
>>           return ret;
>> +    /* 3x4 matrix */
>> +    colorop = colorop->next;
>> +    if (!colorop) {
>> +        drm_dbg(dev, "no 3x4 matrix colorop found\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = __set_dm_plane_colorop_3x4_matrix(plane_state, 
>> dc_plane_state, colorop);
>> +    if (ret)
>> +        return ret;
>> +
>>       /* 1D Curve & LUT - SHAPER TF & LUT */
>>       colorop = colorop->next;
>>       if (!colorop) {
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>> index 4845f26e4a8a..f2be75b9b073 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>> @@ -74,6 +74,21 @@ int amdgpu_dm_initialize_default_pipeline(struct 
>> drm_plane *plane, struct drm_pr
>>       i++;
>> +    /* 3x4 matrix */
>> +    ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>> +    if (!ops[i]) {
>> +        ret = -ENOMEM;
>> +        goto cleanup;
> 
> Does this cleanup path leak the list->name allocated a few lines above, 
> outside the diff? Kmemleak appears to think it can leak from somewhere 
> at least:
> 
> unreferenced object 0xffff8881143c1e00 (size 32):
>    comm "(udev-worker)", pid 588, jiffies 4294888494
>    hex dump (first 32 bytes):
>      43 6f 6c 6f 72 20 50 69 70 65 6c 69 6e 65 20 33  Color Pipeline 3
>      31 33 00 00 00 00 00 00 00 00 00 00 00 00 00 00  13..............
>    backtrace (crc a75af242):
>      __kmalloc_node_track_caller_noprof+0x525/0x890
>      kvasprintf+0xb6/0x130
>      kasprintf+0xb2/0xe0
>      amdgpu_dm_initialize_default_pipeline+0x1ce/0x840 [amdgpu]
>      dm_plane_init_colorops+0x19c/0x2e0 [amdgpu]
>      amdgpu_dm_plane_init+0x4c4/0xf10 [amdgpu]
>      initialize_plane+0xf1/0x280 [amdgpu]
>      amdgpu_dm_init+0x23d0/0x7450 [amdgpu]
>      dm_hw_init+0x3d/0x200 [amdgpu]
>      amdgpu_device_init+0x67cd/0x9b20 [amdgpu]
>      amdgpu_driver_load_kms+0x13/0xf0 [amdgpu]
>      amdgpu_pci_probe+0x437/0xf30 [amdgpu]
>      local_pci_probe+0xda/0x180
>      pci_device_probe+0x381/0x730
>      really_probe+0x1da/0x970
>      __driver_probe_device+0x18c/0x3e0
> 
> Could it be a false positive, or leaking later after the success path, 
> or some other path I am not sure since I am not at home in this code.
> 
> There is no error checking on list->name either, so I supppose the code 
> which can touch that can handle a NULL harmlessly?

I sent out a fix for this (and some) today.

https://lore.kernel.org/intel-gfx/20251219065614.190834-1-chaitanya.kumar.borah@intel.com/T/#m3893809764c761af38043dddf7cc962b8c3aa44e

We need list->name just for registering the enum. 
drm_property_create_enum() makes it's own copy. Therefore, there is no 
owner of the string after init function's context ends.

As for checking the output of kasprintf, I judged it low probabilty 
enough to skip it. I see it being done both ways (i.e. with and without 
error handling) in the kernel.

==
Chaitanya

> 
> Regards,
> 
> Tvrtko
> 
>> +    }
>> +
>> +    ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
>> +    if (ret)
>> +        goto cleanup;
>> +
>> +    drm_colorop_set_next_property(ops[i-1], ops[i]);
>> +
>> +    i++;
>> +
>>       /* 1D curve - SHAPER TF */
>>       ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>>       if (!ops[i]) {
> 

