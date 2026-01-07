Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB54CFD35E
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 11:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C1E10E58B;
	Wed,  7 Jan 2026 10:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+Jh8k6w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35E510E0EA;
 Wed,  7 Jan 2026 10:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767782251; x=1799318251;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BDVBJMGh1orwbhbsjxuS0fAW1tpFukw5Rv24fAyFccQ=;
 b=a+Jh8k6wRGwUB1skppPZsn11FMZpMUZdN5cKjGhzZgywqFEKhDWzWEHe
 mKH8LO4WvlK2+A1gCGBKWKLLSYBC/FsbjQsxaxnJnQg71SOiycHxI9ZXp
 YVOh56r+qr2ahJSYgWn9+ODExgKH0UukgIcSYJnC3e1gu/LKn9YI4ZwSN
 IyGBzLuQVLVz4fqYSLsBeAxnP8+ndyVbl2X71yT9p3h0L3pAyovsTdYVx
 4hZe9iukBXZaHFhinfMTL0wbxH72Yemch5r9yexbcthgcJAeuaUhxeu2a
 dA61Gu8MaKMhJSYTVcXn2Vj1Fa6tv8f4Qe8GByijCwPkJgPYYIJ0z6/lQ g==;
X-CSE-ConnectionGUID: Rxndo9rJSLuQlrxUH6MCSA==
X-CSE-MsgGUID: qi7U5r18Q/2yAl1Z3RrU3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="91807640"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="91807640"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 02:37:31 -0800
X-CSE-ConnectionGUID: vVbaBvfERHeMKpOEx4bw8Q==
X-CSE-MsgGUID: n5wrAlpxRmGWMQLwk+0ffg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="202951732"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 02:37:30 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 02:37:30 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 02:37:30 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 02:37:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXuGIyrrJa5MmrOyUk93h9fsM4rjxPwTPBoNLPBic3jeNyS0acd0C7NtTtcgAK2NtleQpLAzE+A8+HPoXaPjp7HoHTThXO/xK9EDGBDcP9Lm/7tGpq6FN6BO4SQxoKEvz9cA79WWGUVmjs/8x4JVijYIw6qw6bc3s7Ogo3BnxwDhzSNzvn90ufTW7vb3EtsUEJs0aBZD+l6zU+gjTFXmEQzMrB3u6PeKjGIzYnaiWwXXoP5qd2iB24JvJi0luRHn6055q6FpqIv/chzD0gbLYewLpKMFIwnZi4J9SkdR4G7BPcex+OpwWubGe5ctKdCPye26QEarWF8qcmuE+8N+wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9p7jULGuQ2c3Zb3KJLOSZIX+MMmxjQlCY6ar0hurXY=;
 b=AQcoVGaOmovXxoxJ73VaRxsaXRGEFgZsHRD4k6weZLQYEVizWf5Nhi8jeuPDfmwvhDPRLJIRf4FrRGCDnLHT1S5wltLFa1UL66rfts+nbgKB0WCjYCb3pPGuJfPqtbPA3r3YIP+CGrkQMUkdmFEBsWsLEKdLxqRcwW4IUgKdlUiUEI10A+KNXUikX+Tm48TfBJ1mcWkCl3Gf1XEhzVxGwj3PjvIhkhM73LUriNmK1dT1p4w96qmpY6ow+Z0usEgX4nVJSqO9nPFUqL//rTuQVM9VcjQheo1Kh4WqNm6x8bBM4gvEGcrf1M95HpUXR4K7cFWn690RE9/Hpx/+LWSSUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by DM3PR11MB8735.namprd11.prod.outlook.com (2603:10b6:0:4b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 10:37:27 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 10:37:27 +0000
Message-ID: <10b31338-7a36-4c35-9e7e-48d9c4c8051a@intel.com>
Date: Wed, 7 Jan 2026 16:07:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/buddy: Prevent BUG_ON by validating rounded
 allocation
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>, Matthew Auld
 <matthew.auld@intel.com>, <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
References: <20251222065238.1661415-4-sanjay.kumar.yadav@intel.com>
 <20251222065238.1661415-5-sanjay.kumar.yadav@intel.com>
 <60ab8e82-a079-4ca1-adcc-ee50cfc5641d@intel.com>
 <a6d5c716-9f09-412a-9613-ba3213d20b4c@amd.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <a6d5c716-9f09-412a-9613-ba3213d20b4c@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0357.namprd03.prod.outlook.com
 (2603:10b6:303:dc::32) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|DM3PR11MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 647e43f6-615e-49db-1c71-08de4dd8c0cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXgxRGUxMDQ0dTNLZXRxUzZXTm9Ma2k5bFVvMndIM3N3SWNidGxWTkY2T2M4?=
 =?utf-8?B?ZDZuOGxJSVlwOTVLQXNVc1ZldXROd2ZFRXk0bUdCcVh3MmxrV2pBRFZsRUlW?=
 =?utf-8?B?bW5raVV0OW9TQUNkV1c0ZHhqVGVnY1lqYVovNnlxTXdNaTlFSUFtZkQzdTBX?=
 =?utf-8?B?ZDJpWXBFc2Qwdk5DRkRONk0rdktuL1dtdzVqaW1VK2lHVk1YeEo0N0RTeUxl?=
 =?utf-8?B?bHhxNnNCN2p4YUY3QTNwQW1temphaTZTM2pQS1J2MkxkSUdSM0xkSFBtVWVL?=
 =?utf-8?B?RGNrMUJ0WmVXZDl1SXNwZThTU0ZuTk9sZmFnYVhrNWNjS0kwMkdKQ1BjNzlY?=
 =?utf-8?B?Um5qUkpLOHFNYkRIQmRqSkVMdTJhUFVmbmFoQ1A4WUcyV0tXZFZBVjhzNERo?=
 =?utf-8?B?TWxRTU0rR2k3S2tiUU56MWtyVnA2ZFp2NnI5QmFwSjlwckNTN2hhQjRaTmVi?=
 =?utf-8?B?aU56d0UrL2VTK2ppMjR3TnZJa0ZzR2FKNjlzKzdGTERMa1pRSDgzUUdCOFJs?=
 =?utf-8?B?Rnh3ckh6SmVuYlFnWGhkTmtvbDJMOUpUeW1vdWl3ckNEcGprcGJ1ZTcwNGJt?=
 =?utf-8?B?ZE81NllDR2Z6eXJYUHhTMEo0QUM0N3ZRL09HcEVlWG5RYmxsNHhmeERnempN?=
 =?utf-8?B?YmptOUZIUmtRNGxvRGJwSzgxL1lGd1c5VGVVWHVETnlpT1pocnNHTGI4UC9H?=
 =?utf-8?B?UWxLVXJ5bGNhL3hFdXh4eTloeTQrQzZ2Qk1iaCtETVNsYzNRTmZKdkRlaTlU?=
 =?utf-8?B?ak9JUzRWUjZwTkZhTDdZL01QM3dSN2loR0Y1ZHJzZVdaZmYxS1c2MTRmRnY3?=
 =?utf-8?B?WTNwMElQbDkzUnVMdndIdHlyVHZXRkxsd2xWR1FUd2UxRUIzcVZWOEVqd2p6?=
 =?utf-8?B?bjBwZS9hWlBzaXpvZVNxK0kvZEZZYS9FaGR1alRMN0RjL3AvRXZuVFZpK0Rj?=
 =?utf-8?B?K2tRZU8rR1JOOG9TQUZrQyt5K1dJSWthNVR1QlZmRU96Z2M1VGErZ2Z4UFJY?=
 =?utf-8?B?a3ZWMk90MlY0dHlXcGZpQW5lTmQ0WEtXVmlUbkdHdU9lQUMwcnhLZEwzaVFL?=
 =?utf-8?B?L1RNckNQM3dJM0Q2emJrK0JFSjMyQWl0ODhwR2tBMFlOLzcveHovZUtxditU?=
 =?utf-8?B?eHFqMzdFUEZQMnVsL0pqbTllQ2JMMzJqYVBwSEFjMDYrdGgrREdveGtLWXEy?=
 =?utf-8?B?Q1pWcDdtUkEwQXpVN2hEbGFEdkF5N0YrS0xRUVNLS25OSElpelByL3FRZWdY?=
 =?utf-8?B?L0xuYzgzdTZRNGxVcGhJZjlzV3l0cWRyQ3p0YWUrSFJxbkxVRDEyRWV3MDBh?=
 =?utf-8?B?UzlxQ3RIOStYWEpXUUt1bWZFM3FzT01mbk52clh0SjB0OXp4cHM0NVFtWW84?=
 =?utf-8?B?VXhzTy84K0ZTa0wzSHZQQmQvWU14aTNadWNGS0xlbTY4YjA1cVkrZ2dXYzJF?=
 =?utf-8?B?NytoTzVZNWJwZkRjVkw1U1lLOTM3ZjQ1UUI2R3VwNnkwLzcrUGhqa0kxbVhS?=
 =?utf-8?B?SXVrVjFudmVmbDFUK3RoQ3lBRHJBNkVrSm1ITVRjMkF0TU1DR24vYTV0WUFq?=
 =?utf-8?B?SjRMWng1d2xrbHZSQlMzYXRVTFZzS2JWUU9Cb3dlUStabHRFc1d4NDFHcE14?=
 =?utf-8?B?N2F0U1dlbWQ2bGxOd0krSmwwTEpKTHNlQUdnUWRYZ3YreEd0RGJQNHVvWFBh?=
 =?utf-8?B?YnNZQlBPYmVGb0V4M2RmQUsrRGV6ZXoyMmpGTm9ZQ2lMN25tRTlic0dXVGRa?=
 =?utf-8?B?ZEEyNG4yL1hQeGtFbDJOWTJHK3VBTE5yRXhRTVFzNytzYkdzUzluRUZwWGNP?=
 =?utf-8?B?Y1diU3huVXRRaXlXcWZncE1NSHhKV1p6OFc4VUtTQ2JaaGpUTDZoYVB6OWRs?=
 =?utf-8?B?YlQvUUlxbE1HcWhDcFNLVi9vbGR4T01XWitId3RaWlNzT1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RC9OaU1aeUhxYkdGUWFuU2ZjcnpCUEF2cXRncUtDY2xTdzdDYnpieGlqNUkx?=
 =?utf-8?B?cjdBL3FPOUdIZjZmcU5ISU52U2lSOTZSQktrSUtJckxqVDdYS09weStuZ0g0?=
 =?utf-8?B?WG5ZMmt2a0FlWUxMQU9lSXlUQ2lIS2JqV1BpSVBCN0NycHZoT0twdVFaaUdP?=
 =?utf-8?B?cERaMFVoMnFpYTF2V3MxR2FUejBnOG5KTmV4cy8ycnFTLzQzR3ZJRllnbG81?=
 =?utf-8?B?UDVFSTFXQzRpRkR6SHFiRXJtbFprMDRGMlN1Q0VQVWI1VEFCdUxpd1JkekNE?=
 =?utf-8?B?WkZqMCtMM2dUbVRXbEdKZ0JhY2dYekVySDFBTjJGU2Vzb1RGaDBQVnlzVldP?=
 =?utf-8?B?Sk1VRHN1YXhrUTkyQW9aZkpVRlRtUkMxaU44R0lUK3U3aE02MWtwK0FRYmhZ?=
 =?utf-8?B?ZkNrbENyMGdyNXhGSkNxSVZrQWZWbVVMOHlmS2Qva3ZSenpsRmhhNVQ0M08v?=
 =?utf-8?B?UnUxTWJpTURQYXdpMERqRExtMTk5YjlkcmpFR1JjcnNEZ1Bjeml2SFJVZzd5?=
 =?utf-8?B?TXhybEtQZFJMKzY5eGhCdjZpRm9KcURYTDFUZUk2bWN0UkVWcERjcWJFT1ZF?=
 =?utf-8?B?d0NOMld6MEd2bm90WTB1Wm1FMmxYM08zbTNGNWtLSnZ5ZTZCNHJsMEE4Tkh6?=
 =?utf-8?B?KzR2Q3A0c2VWbnByOGtjZEtkNEllS2JYR2RuR0laU2doSHdzZG91MVhrZGln?=
 =?utf-8?B?Y3hrcWRyQXRZWXk3dTFPZzNvSzZFOGtERDBLdjNydnpRcU40RjRCWjBSeDdU?=
 =?utf-8?B?Q3BXN1pSdThyUEJ0SnFQTXBNWUFEV1FFYWZXVXl4cGk1VW01VVVqQ2wzaTZn?=
 =?utf-8?B?dkpqWTZ3bHFSLytkTzJ4UUkvOXcyV20rRnBXVmorVHRvNHJVMG8ybGhWekNs?=
 =?utf-8?B?cFV2QXZIbXJSQ2g1Yzk1dHNIaFdwTlY3cHdxQVk2NVNaUmNwYUZmd1BtNVBh?=
 =?utf-8?B?WXZFQWxiL1krWWY5UjhPeVB6bkt1OGZoS0U4eTVTNlhVR2dGemNHUTJxUjZZ?=
 =?utf-8?B?R1Z0YktGaUtoV2t6NVlYQjBwMzVhbHBZQzZyVUtMV29rOTFUY1duT2VibFJ4?=
 =?utf-8?B?aHlVL2tNWjhSaXdwVVRyVGF4Q29hK3hpOU93UzNJVTQycmZ6RzRmdTgvTG0x?=
 =?utf-8?B?RnRoeG80L0tOVE9VNmtFYlQ4RnRHQVZlU1lORy9aWUYxMzlBU2FSbWFlNjZm?=
 =?utf-8?B?dnJxM0FPR3R2b1E0WkNFL3IyaVF2Tm90VTRwRkV6QzdwRXovSUZHa1BPYmZU?=
 =?utf-8?B?MktVTTNrQ3p6LzVsRUpwTzBiN1Q2Tm9zUGc5elpJQnlHZFVsdFVUcHFIZlhW?=
 =?utf-8?B?cnRNaVhOd01ZVlQ0NlU0UTFza1N2TmFyWVd0M3l4eW9tYitBT2Q3T0NzQUl3?=
 =?utf-8?B?dndid3ZRYnZJWW5lZUVtbmh5R2xnWVR4UGd1cDM1cWJZNWlnZG1weEVRS01w?=
 =?utf-8?B?d3gvdnhiYmFzNkQwRE9zQlR3MHpRanVpWUtIcXpGUFhxWDdIRjhLODBldTBl?=
 =?utf-8?B?NXh5cEVWOXdCS0hoWC9ySnJCcnJySW9LcjhVQUdCc0VsYVFnWnRZMjZzM0t3?=
 =?utf-8?B?MG1sYTlwWUNjMXNRb3p0bm5UY3hXa0hoalVtT2txL1QyZG1obUNaRHlIeENB?=
 =?utf-8?B?Q2wxeU9WQThJS2p5bVZMdEUvdXo3cCs5V1RPR2xWOGp4RWRxc2FqaTZ0Tnla?=
 =?utf-8?B?TjkxOEdncmVjbUdxSUNNeTI2VEs4WDZ3KzVqRDNsUzlCK2xxbVAvZEIydm9S?=
 =?utf-8?B?UnBTTVd5ZVpwcDNGSFpCR2MydjJTNTRsK3g3L0JROFFVaG0vZGw0SkQrM3Zo?=
 =?utf-8?B?ZGx3V0ZZdVg0V3Q4QUtSNkJHNi83WEdqYjVybXM4YTBBMzdHUTQzQVQ5T25p?=
 =?utf-8?B?V2R6SWh1b2sySFFvUEV5QVZudnJUU2hGaVg0aEREVFVqUytlN1kxbVRMVll3?=
 =?utf-8?B?a3FVZU13VWhmK1ppYUZyS2MyT2ZiK3lNK1ZOMG11NWdPa1MwckRtdzZUdld0?=
 =?utf-8?B?N250WC9kdU9TQ0o1bXc0MXJPVWpYYy9XMm9hbk13RGxERHU2Y3VkV3ErZUxl?=
 =?utf-8?B?NFVkams3RFVCbVFaSW1KMFo2M1Nha1QrOWdJdE9xTDZLbzFwSS8xQktaRitk?=
 =?utf-8?B?NkJ1MXhUaThJUS9SN0pYbjVUNG1ZVEV5aDhnaGZORE5PYXFRYkxMMFhiSjBN?=
 =?utf-8?B?K0ptaC9tQ2tEYTJPMDdwd2VsL0xQZjJYZHVQNjZhc3c4bkVPbXpkQWM1NDhz?=
 =?utf-8?B?aG1uS2wwYndwR04wZG9RWlJGY0RYMHFEVTdGbEY1QUFwaXdZUkYzQ2RnZVJr?=
 =?utf-8?B?YkJUTzJmQzJzQWJiYjRxdEp0Tng5Uk9VVTVkUFFVTGNtWmNOZVNObitXUllJ?=
 =?utf-8?Q?cFBPbZLx6WNQkNmY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 647e43f6-615e-49db-1c71-08de4dd8c0cb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 10:37:27.7605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ya74yPALZx6kdhmkSCdhfc12OCTjMAx1eK2KYNMXITakUe2ZwAXEdt6CGdwU8tBK/FoZHb7TUdzb7mZFIaIhwN+DKrEXYu/OXTQ3raqfZ8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8735
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


On 07-01-2026 15:10, Arunpravin Paneer Selvam wrote:
>
> On 06/01/26 21:34, Matthew Auld wrote:
>> On 22/12/2025 06:52, Sanjay Yadav wrote:
>>> When DRM_BUDDY_CONTIGUOUS_ALLOCATION is set, the requested size is
>>> rounded up to the next power-of-two via roundup_pow_of_two().
>>> Similarly, for non-contiguous allocations with large min_block_size,
>>> the size is aligned up via round_up(). Both operations can produce a
>>> rounded size that exceeds mm->size, which later triggers
>>> BUG_ON(order > mm->max_order).
>>>
>>> Example scenarios:
>>> - 9G CONTIGUOUS allocation on 10G VRAM memory:
>>>    roundup_pow_of_two(9G) = 16G > 10G
>>> - 9G allocation with 8G min_block_size on 10G VRAM memory:
>>>    round_up(9G, 8G) = 16G > 10G
>>>
>>> Fix this by checking the rounded size against mm->size. For
>>> non-contiguous or range allocations where size > mm->size is invalid,
>>> return -EINVAL immediately. For contiguous allocations without range
>>> restrictions, allow the request to fall through to the existing
>>> __alloc_contig_try_harder() fallback.
>>>
>>> This ensures invalid user input returns an error or uses the fallback
>>> path instead of hitting BUG_ON.
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>>
>> I think we should maybe add a fixes tag:
>>
>> Fixes: 0a1844bf0b53 ("drm/buddy: Improve contiguous memory allocation")
>> Cc: <stable@vger.kernel.org> # v6.7+
>>
>> ?
>>
>> I don't think current xe can actually trigger this yet, but not sure 
>> if amdgpu or something can somehow trigger this in some obscure case.
>>
>> We could maybe also add:
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6712
>>
>> So it auto-closes plus gives some more context that this fix was 
>> motivated from code inspection and not some user report. Otherwise I 
>> think the change looks reasonable,
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

Thank you, Matt A and Arun, for the review. I will include the Fixes, Cc 
(kernel version), Reviewed-by and Closes tags in v2.

-Sanjay

>>
>>> ---
>>>   drivers/gpu/drm/drm_buddy.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>> index 2f279b46bd2c..5141348fc6c9 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>> @@ -1155,6 +1155,15 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>       order = fls(pages) - 1;
>>>       min_order = ilog2(min_block_size) - ilog2(mm->chunk_size);
>>>   +    if (order > mm->max_order || size > mm->size) {
>>> +        if ((flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION) &&
>>> +            !(flags & DRM_BUDDY_RANGE_ALLOCATION))
>>> +            return __alloc_contig_try_harder(mm, original_size,
>>> +                             original_min_size, blocks);
>>> +
>>> +        return -EINVAL;
>>> +    }
>>> +
>>>       do {
>>>           order = min(order, (unsigned int)fls(pages) - 1);
>>>           BUG_ON(order > mm->max_order);
>>
