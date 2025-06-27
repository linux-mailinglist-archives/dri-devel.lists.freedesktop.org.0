Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D31BDAEB09D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 09:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AC410E976;
	Fri, 27 Jun 2025 07:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZSbWJvml";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B7810E114;
 Fri, 27 Jun 2025 07:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751010810; x=1782546810;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JB4yXLKMOC7p61i47h1OEWzMHYxLuLsihG9UBuKPNRE=;
 b=ZSbWJvml5YEuxaK2coVefHsOnOJIunoO4md3XLd0+JkphNdQOkRhbJwb
 je756n5AltJ+ZTZhE/KvFSjeNnZMURNQWd1zRg99jmdy5x7pE5f8DGyyR
 c53ZIrhhataSplOQdFufxwhuA8rc1jHLLmrQfR5W2N1L1FIfzK+OR94Ht
 /h9r7V77k7RsuOLtXGIU2iT2q6rlqO8AuMfSRKmOYmzEnSy4tuDQbe26M
 dHjnefSumU6WuFeuChWz7IqgAJF2+Z8nSS0PP9yCX/csAQmTiYc6urqUg
 B2o2IcbURrDPKduI42SfN8dCOmiXBCR+pZXKD/oU8+lID619ffU3C/sUe Q==;
X-CSE-ConnectionGUID: goUHN5zLQwKUKRYaPmWcYw==
X-CSE-MsgGUID: M5WFhRjgS7aFeAkl4AgMtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="78759285"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="78759285"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 00:53:30 -0700
X-CSE-ConnectionGUID: OkFpqHktTZSuanWjxCSgYw==
X-CSE-MsgGUID: MkPQBy2VS924bJROK7juzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="152479246"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 00:53:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 00:53:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 00:53:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.47)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 00:53:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENujdn7z7awD22LmSd9p8KbpxJgH1yaZQHHS5SKtVYsjq84a9UrxejT6AiUVHonLj2g28U0iu1myuTVm1quIMyIR3gc1GRb5nEWeF41HYxpaCuHXMf4CV2ry1+QrrJVEMnOpKCUhgfsCvTeWB2z+X2qBTBAQyF0U/7RHyP3cKrGA5WsN4EiStzEGSGMMKmXLdP7oQwJwL3T/XxQ+ncNHGI5LadL7uCY15I1Tf6dMJeNEIzWgYr4eUO2JGpnoPOz2/e5ooJbu/wLpmige7vtdCgUSUT+jAPh9Efp4CivYL0MJWrAJjTRLN3/4K8pebdkemyMOiiNjcJeN2EY4BsKlZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rLy8a7arPDDG4mlFhEORvCw7hODINttA0YZXtdCqUs=;
 b=t3VQoKOOqVuaq7/V0IvtP4HjGmTRSK/UjI8Aw7JH8eGHK4SjKQL3Cgv6n8l1PPK0e7pO3HkOnUC1LloCMztlAcx+gXc1ELEX3TuG8GNYm1stSADyB/XclSoVHow9Cnc+Apcrkfs0686OpFMzog5mtOlcM0X9GY4oP+ToY88vm05JNpQri8JCEkr+9Jpaq77gPyfKRXQqOP9hR5kC9+QTbl+eJtOrytWHfpva1XZTz5a3xFSMjXu9aoRb1awo1G957zRnp6DQmIZ9BRgxoj6JLYN0ymJoTZ4t4aQScvHf9SmtE3gDZFzcqRxwnxlUdwbJfBG0hrhMLFz610KkGoRksA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS0PR11MB7481.namprd11.prod.outlook.com (2603:10b6:8:14b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Fri, 27 Jun
 2025 07:53:24 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 07:53:24 +0000
Message-ID: <20bdbd2a-4ee6-492b-9ceb-13a70cd2d767@intel.com>
Date: Fri, 27 Jun 2025 13:23:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] drm/xe/xe_late_bind_fw: Reload late binding fw
 during system resume
From: "Nilawar, Badal" <badal.nilawar@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-8-badal.nilawar@intel.com>
Content-Language: en-US
In-Reply-To: <20250625170015.33912-8-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::9) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS0PR11MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: ef4b0c85-ab6c-4fcb-4970-08ddb54fb197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnRidDI5V0lpeEFQbkF3L0szV2hNenNRV3FYRUZETmpOQ0ptTjl1YzhOWG01?=
 =?utf-8?B?SlZEKzEyMWw4bnJPU3Fwdzc0WjlNTVBBVG5ZSnZtTlc2bTIweldpVHZ1ejBo?=
 =?utf-8?B?a3hwbHA2d0ttY04yWnBQcUJIdEVkMzkyTkFmYy9naTk1Q1JEK2VaeENtYVBu?=
 =?utf-8?B?YlY2NXpuZ1I2akUvWE5RUHY0d3NGaDh0ZXZWTXhISjN6bUQwSW9CTFJZMkND?=
 =?utf-8?B?cmJ1a1M2L2lsZnkwNTJIM25qeXA1S2FvWTNtQldvOTlRbkswUjFSdFV3TzF5?=
 =?utf-8?B?cHM2MTV6dFVmYmF0S0JUZjk1Mkl0ZTJDcmlWbDhqZnJVbnhRV0hNaWdjSzNV?=
 =?utf-8?B?L0hCVmZqUlpBOUI5TmZUU2RjbmM3RUlpS1JlQTVqTXp3U3RrR0UrUXJmQXpM?=
 =?utf-8?B?Y3dGQTNmVFdGTGlwamJWMjUyZkxLUUNwU3BjcHdTdmZRckVSbSt4dktPRith?=
 =?utf-8?B?ZWNCcG5aQU1EVTVRVVhhdS9CdW1CSzd0VUJMbWJxUG9wTmJDUm5nVE9GMjR5?=
 =?utf-8?B?OU40eW1FekF3UEszMDdJUnhiWWVOdGxDL0l3YTB5M09hUmNNb3ZqM0NzUElH?=
 =?utf-8?B?eEo5UjhMVytUR1h0N0k4VkRMdUNOMTZzMnhhbjRBdGZlR1NBMld5Y0ZYQ1Fl?=
 =?utf-8?B?cUt0RzFkODUwWXJWTUJVdEVGUVlDT0UxdGl2ak55U0Vld29nTEhZSDFQWWlh?=
 =?utf-8?B?MVdZQUdneU5KbzJ2elpxczliNWcxdnZNL0prQ0k3VmNUdmdjSkFKMFJxMklZ?=
 =?utf-8?B?djZwbDhSdEdLN3IvUkpsMjM3R3hOdXYra3UzQjhmczc1a0p3bUVSc2tkMGRo?=
 =?utf-8?B?dE5SemRNMEpDZTQvMnQ4bDJFN3hzc2NKd3JXNTRVZHVHVnFNdk9oOFJlNk82?=
 =?utf-8?B?ZXR2cTExSWZHNlIvTGhpV0JxZEs1Q1lSN0FlYWpNTTdzZnptUUswdUd5eFdo?=
 =?utf-8?B?Q05GZUxkdDR4WmY4TmpTQ3R5QXFmZzVxWDhCNHZTcGl6eFhBbVJMNy9kcmJY?=
 =?utf-8?B?cTZBRmZoYmp4aHh0YkJJRW92WVRycWUwQjFGWmRuK0dpSHY5cE5pVUFqcTln?=
 =?utf-8?B?V1lrSlYzWUJZQ1VtWFZsaGljMWlCWUdjRXViSjJ0T21mZk0vTlFTdGhxL2R0?=
 =?utf-8?B?SXNBbTVrdEhHeEdETjVTQjV6TFNxakhHSkEyTGFWNTNYT0pGY2hLV1RoS0hp?=
 =?utf-8?B?MC9iUTcxU1dBOHl0OURiU1FuMFBzK2hvaXVpM01rWDVrNndnSC9RRk56eEtI?=
 =?utf-8?B?NFQranJYZFgxMkN3MWRoOE55c2dDaFBGUnJySzR0WW1xQ1pDelJtemt4cDVZ?=
 =?utf-8?B?Q2E2cTExZW1xUGhadTZjcVVrUFhzQ2ZLTWF6dTlkbjBGeTk1WDhIdkhyaDI5?=
 =?utf-8?B?TW9TaVJkanQvRWdTUGZlWU5sb3VrSTV4NkpGUERpaStsY29OcU5wcVIwRXND?=
 =?utf-8?B?WHNUUXlTMmlvdk4zTTNrYm1Da002enp1ZEVKeE5ScmFyVEE1RmQ3WXZpV1lL?=
 =?utf-8?B?WTRFYkZSRU4wTEZ2dFk2UU9FUTZzRkxtWXhkYmMwUlhkV2h3dFFKRDI3ZEtp?=
 =?utf-8?B?Wkx0azJSeTJSNXVaVjJodlJIMVc0UjkycHpqUjQ0MUlpakFyM3o1dkptUlhD?=
 =?utf-8?B?V2VtcDAvZHRteTkzazVzTTE2VHdHUmRmUzRsejU5NG9CUUxGc05NNTF4V0lm?=
 =?utf-8?B?SVJuNkVVTFo2c0hDR0ZkeXA2UDM5NWdqTUk0N3ZLZE93bHM1VE8yU2RpVC9Y?=
 =?utf-8?B?cnhRMHd6b3ViM1pMY2FiQmdHZ0xsb0lqSi9YOGdSMDFRM2NVd3pvUUxYSk1Y?=
 =?utf-8?B?V1hlZlk4SytLdll0cjVwdXRCeWJvZjBUQTUrMDE3RGkrNmU1WVNJcE9zdDl0?=
 =?utf-8?B?MUR4Q2Mwd0ZHRlFESmhqMENSZm1WZ0RYcHpETU5tVHJMeDluU3dkOXZXVnlT?=
 =?utf-8?Q?JzOTiOeMdaE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUlPNTNIamczQWFVcTV3NVhhMnR3eE1pRFZadmh1SXZoNTN5d1l2UWlVbHZC?=
 =?utf-8?B?a0FqRXFCSnIwQ0lsR1JsK2YxZ2tKMm9oMkpVZ29LTzR2enA5dTdXV2VYMWpB?=
 =?utf-8?B?eGs4Sm1TVEJ0TVlHREs4U2JVSXh6S09FbHRnbzNWcStzMFRaUW5UWU9mNkJW?=
 =?utf-8?B?Zm1id3c0emc2c2w4dUwvZjdtK3o2VkMycCtVUGdoUGRZaDR0ZEg3ejBNV1hV?=
 =?utf-8?B?bCs0ODVmK09aMUhEZ3hZVzE1ZkJwMHU4dHI5Mjd6TXh3OWQyWVl3Q3JQMVNE?=
 =?utf-8?B?bTJlbitURnBjcWJQZXhySHJ3RG52NThZRlpSdituU0dsVWZ1SUltSWpBQWJL?=
 =?utf-8?B?NjVlWHNsdW1QSXJCWVlEcldIdVNjWEdvbFVhT0xBNFl0L2RyQVhzSTQ2M3or?=
 =?utf-8?B?cUxuazh6Q2hrNVJ6MEhFdVAyWGZRSHI2bGV2VlZDYUFTWXNyK2dkaTB4Q0Ns?=
 =?utf-8?B?WDFSdUdjYnNwcHlPcmJNNVQxZm5rNXNXam9hbzQ1eTZWUFR5QytQRUJJNHlo?=
 =?utf-8?B?a0FpN3E1OTlSVytyR056Q296SlMwTEQxemxlUk1tQlQwYW1lRlhSWDlXYlc5?=
 =?utf-8?B?anBVQXVVdHJsR2kyMnA2SXYzU0RldWZQY2k0dTZXcEU5SFhUQ0ZPUlcyamhZ?=
 =?utf-8?B?SlFLbTdVeldGS2FKN2F5UGE0U2xqZjBqcElPZlpaMm1pbHZQbjk2YTNEejgw?=
 =?utf-8?B?ZXJ6U3dYM0NLUlpTM2tJdWh3RVlOODcvdHZSVjBVOHFpZk9YZEhadzB3cFpQ?=
 =?utf-8?B?dFNNVVdINTFzM1lUQU1BaEdZVmhxbmRVMEJ1N1V0bXNVN0VUWTFiNElRa01F?=
 =?utf-8?B?U3NxQnhCNWdoVUd3d1J1RTcxcEhKUFNhZkJ5a0N1MUNGdHp0eFNoZ1h2ZU1l?=
 =?utf-8?B?S2tOUWwwWi91a1IxaWJMVVlWUXhwOFMwVWxCRm5rYnI4ZHovZkJ5YlhrNVd1?=
 =?utf-8?B?SzhKWWorUzkzNTVtSjFod2FmRkZ0S01Zdm1sRWtNRnZiWElkY01EbEI0eXQy?=
 =?utf-8?B?clVxWmNQR1FMSkF0VnpiS0FJaEpQd3Zjd3JLMzhnbmE2RjNBMHFOMGc2aHlz?=
 =?utf-8?B?TlJCVm1XR1h2TEhlRUowMzZtQ3hpekpVcUR1SzhYWFd3cmJKdGNRUmpVeTd1?=
 =?utf-8?B?RGRUUFhYcTRqM2FMOTVYbmZGVm5nbnNRNklRRVZYZng3Wk8yV3FSQjNEbk1R?=
 =?utf-8?B?c0lPSnQ5ekZiWlFlSEo2TzFtWE9qbmlERXc0b205R2h1ZVlJVHQzOVRweG5D?=
 =?utf-8?B?aG5Jd0tZcGdyWEx3NVBrbjNMTlUxVXF2dHdkNy9jbFFrcEdmd2hZNXVpME1B?=
 =?utf-8?B?UzBpSVRBQzdYNkhFMmM5SmNvaU1Wb1YyOE5RNk9lbGlrYnpaWXdDM1lWWVl2?=
 =?utf-8?B?NUY3OTAxdG9HUmp3WnQ0ZndtZ1N2VEFBejRLVjU4UnFZQndmWnliSWJXTktt?=
 =?utf-8?B?U3NMMGJRci94QlZvL09HeVA5eGlQaHFTWnBnSFlvWUlTODlYL3hHaUR5YWww?=
 =?utf-8?B?ZG94QjZOeXZYK3FsSVBhZUpqU2pOQUQ0dmdEcVUvNkphTys2c2pwb09HUFNl?=
 =?utf-8?B?ZlNVbXVpNTl3MFdPQWU4a2R1SXJBOHloMEszQTV3TDR2OGRsaXZUZTNBTUg4?=
 =?utf-8?B?WXFRbnA2d2Nzc25WZW82TmNpZERGRXdiUnVzVUFOMXluUzJqTU5CUWVJdFhC?=
 =?utf-8?B?NksrR1luaktUS2J0MmtxbmVrK2o0Nk1SSkx0bEdXYUNZTVE3OWprYW5iOGts?=
 =?utf-8?B?UDFRK1V2ZlJtM2pVUjNEMTVZcXlXMHJQaU9yRTAwVUIyenArWGhFeTZUMHRJ?=
 =?utf-8?B?WEdyUmhXWjhaaXVnVmJjMmJ4cldKSXhxME1DaDV1OFlIK2ZhdjZWZjZSc1Fz?=
 =?utf-8?B?amlSUktoZDVheDBQdU11dzdiZ0JBZThSYWw3SDdYTXl3L1NBNk9ETHh4bFh4?=
 =?utf-8?B?WnhiaUNvcmR3RHUwdFB5NnVVMlFTdkZJWEREbFZTN3BiUW9ObkwwNUdOdk4z?=
 =?utf-8?B?WWFHZkhmODBCRjBkekdoZ0hqbkVCVStjL1U4VXVKbzlsR05uNmUrZ0twd1pR?=
 =?utf-8?B?YXFWb3UxOXlic055WGJDekNqUnNzMG14STJBUzJ3UWM2d2FoZjBZOFA4ZjlM?=
 =?utf-8?B?dzZlZ05pYmpvekxJS01tVG1UcTB4QzFLaG5iaUpKcmhLbTVSNVd3RTN3dFl6?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4b0c85-ab6c-4fcb-4970-08ddb54fb197
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 07:53:24.6800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+0gFcLGR5okmRFJxbL8l7gJPOiMDz8e0FdCAkKY+RkLI0dDgqBpEeJFISDCT+ZUyHP0t/WdTcLfA63+eZCRSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7481
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

Hi Daniele,

On 25-06-2025 22:30, Badal Nilawar wrote:
> Reload late binding fw during resume from system suspend
>
> v2:
>    - Unconditionally reload late binding fw (Rodrigo)
>    - Flush worker during system suspend
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 91923fd4af80..f49b7b6eab97 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -127,6 +127,8 @@ int xe_pm_suspend(struct xe_device *xe)
>   	if (err)
>   		goto err;
>   
> +	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
> +

During system suspend, MEI will unbind the component. This flush is 
unnecessary because it takes place within 
xe_late_bind_component_unbind(). I will remove this call.

Badal

>   	for_each_gt(gt, xe, id)
>   		xe_gt_suspend_prepare(gt);
>   
> @@ -205,6 +207,8 @@ int xe_pm_resume(struct xe_device *xe)
>   
>   	xe_pxp_pm_resume(xe->pxp);
>   
> +	xe_late_bind_fw_load(&xe->late_bind);
> +
>   	drm_dbg(&xe->drm, "Device resumed\n");
>   	return 0;
>   err:
