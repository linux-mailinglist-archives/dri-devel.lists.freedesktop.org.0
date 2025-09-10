Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490B5B5246D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 01:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5316710E9CC;
	Wed, 10 Sep 2025 23:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1C8R2nK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DC810E02B;
 Wed, 10 Sep 2025 23:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757545587; x=1789081587;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GHsFqUqP19fCcV7VGF3EHytEhAYq1sANdKch8erUyz8=;
 b=C1C8R2nKP9MH0E5srQoslVX1gESflCnN4b80ILe7qvqYENEy//ceSOzF
 +ofqvrSZ+s1kenW3768xjR+rs7AuoW4T9PjpsS3GkiLKvn6+qtJXbSRBV
 aFhZJdgKtmsbZdetqDxFxZZXa4KkL5KqRZku/QyYoBHH6GsTZ7oOcJ3Og
 X3pG8ikxFC/whYLepYW05uSwg7v0FlPk3CWIMzI5cpnydSWZN6ZFNorIp
 jG8jNKM7zfvTH+5Un7q6HSIaXZtmjrtxos2xzboJyUckOm4vH9K29PZVb
 UlZWhi6U3zkIGNwrLb0NLFKM8YqnOfFBRfQ1cPWqAL7zGLfWRo05tU7MH g==;
X-CSE-ConnectionGUID: 612nfJDJT7KenNTp/Eajaw==
X-CSE-MsgGUID: HVJWu32ERs24yt6s/+md8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70966886"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="70966886"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 16:06:26 -0700
X-CSE-ConnectionGUID: Lfqbga1HSvyZvegHf2CVoQ==
X-CSE-MsgGUID: fha2l+usQXy9SdJ7pN+lLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="173106176"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 16:06:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 16:06:25 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 16:06:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.67)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 16:06:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6tFsYWb2yA7KaF/mHyBxgqxlquvddBExbKhLStjN0jjEWCEckezTjCDxKqXf1pXXuJ5jjfBxQFk4sYYsofOYdPufd495+9pa60/CvkLcSNcUhnTZ9OcOOdVPPOOaYTcixXLHIdd7+JvgcfL03kCKFlSy6lEwOYl4Ul21jTx4Bl12HXtzfKrs7jjYGOz9ObzxLMFtaDR4DMQFQy0yNj4P+TjsIPfKpLNQ42uGQQkMQdvG6ZA2C15b/PUkzLoZ4h/fN2Uuxxs9r0NQTcxS6SpEsxhrgX+90gCQVQDi9lgOcSBSWoC/XzZ1GsqFxs6abZ4Puq5oR4fBAuPZWIyH5SVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdDtnBNYer/LtPE0EknLuBSAAGzbWxPdj3Mxg4LJudM=;
 b=lwCykBHY8YL9lbR0tqH0DCRdGX3STzg5HmTai8gyFD1c3ejNID/aqSv2ta0Hlu/WumXzVnNHOHosXE2qHvI7tt3EgjORQY0MZpNcPni5d4TMd2wXBCvZjxFtWqsTq9VATmZ4laDSZ7/bKDrr0KaYvBtNJxFrpf/KJdXNrnDAmuCDW+0Y6tr3YHhwQi6yUzafTxoAWMKKNTMMdXUFyFqaLsHrJQ5SNMgXLwJmah+ZfhAna+1gJrz0PgpVw1D7K7fQipXtuj8CDN9NXkdRpTnir9epUmJIE5+jWwW6tG3VQj09mV5+a/stL2lHv75c2ySP7YMEqAd05PyOpXpT1ZoXoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DS4PPF2AD6B04BA.namprd11.prod.outlook.com (2603:10b6:f:fc02::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 23:06:21 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 23:06:20 +0000
Message-ID: <5e38ae5a-49e9-4b38-8ecc-0450b3c5e167@intel.com>
Date: Wed, 10 Sep 2025 19:06:18 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/i915/guc: Add synchronization on interrupt enable
 flag
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Andi Shyti <andi.shyti@kernel.org>
References: <20250902151419.231828-1-zhanjun.dong@intel.com>
 <96ea5929-1254-4b36-8d7d-f63cc769a756@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <96ea5929-1254-4b36-8d7d-f63cc769a756@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0193.namprd03.prod.outlook.com
 (2603:10b6:303:b8::18) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DS4PPF2AD6B04BA:EE_
X-MS-Office365-Filtering-Correlation-Id: 2009bc76-7508-438d-7964-08ddf0bea7d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1dpV1dlYXNZRnBEVy9oRkFLYVE4YThMcmZha2NBQTFpb1VmSnpaSTl3VXd5?=
 =?utf-8?B?a2VGemZJTEVnZ2J3R2NWVGNJeEMxZE0wbzlOREZjNmVFU2MxS1V1K1J2MXBP?=
 =?utf-8?B?MkJTRkdZY3NNSE5yS1M1c3hlS1pvb09IakVlTDIwOXo4ZkM3N1pHQkl2SVpF?=
 =?utf-8?B?V2MvdHF1cS9SMS81UU5udXpRdmxlSG1SNjZIK3BKTHg2SlJVMnBETDJkRzBP?=
 =?utf-8?B?VlpCK0lESDdmcTErVTRhWDUzcms2TG9OUWRDYndHbVhCRnJ4TGsveEhncU93?=
 =?utf-8?B?enhLTmJKazNMWi80Y0NKYS85OWQyNENQaUtsZS9XTm85Lyt3WFNodFJzdUg4?=
 =?utf-8?B?ZTE2bHNuSEVaci93aTh4MCtRbGx3cEIrS0VOTUF0N2MvL0JzRGRnc2pIRXFL?=
 =?utf-8?B?QVpJYWhYd1JhUHN1b09UcVdLREp1OXVmV0RtU3NpOUhxUkFzaGpNek9FREI2?=
 =?utf-8?B?ZGpLamJvWnpQdmxMbEhPcnIzNGZZQXk4T2FWR1BPYzZURW1tUmZ3WFVpNVY1?=
 =?utf-8?B?KzJQRDFWNTl5MzBZUXdaelRYRHlqQ2dMN2pKVUk3TG5RYTNFMlRUWEtkS0lk?=
 =?utf-8?B?YUUxVnpUOFJpOW1hc3YxNlk5dHRwTXpjVzVWRGhhdStzUWhNV0lzaUdMSkQr?=
 =?utf-8?B?b2MzUGVwYlZUS0lUUEQ3ekwySm5VVWdtajRaQ1FFMElGWXVmcHdjQTJHU3h4?=
 =?utf-8?B?cSswVzBBMzgzUW5mRXlWSGpuMENSL2xPTGlWTmpJSGJ1YnlsUGdieExVUEdC?=
 =?utf-8?B?NmEwNnBhL0RybDFsV0FhMEU0ZUhFNFRxOS9XNnRnNlBFWFFQSWNFaEZTbk53?=
 =?utf-8?B?MitYQXViS25BVVZYcnc4cEEzUk1XUWlVa1FPaStlTW9zQ2JZWWhwS3BRdWh5?=
 =?utf-8?B?SHNWdkFWTUcxSlIvWlpjVWVWVm1PU1Zrb3labmtoWGZnb2xuTzd5TWtYbDRL?=
 =?utf-8?B?R2hYNVNraXpZMmFpQUdwSnp0S3p4enprUzNCRlVEVC9HaDU3cHlGVmlreWIr?=
 =?utf-8?B?L3dCRDdLNm1kbVpUd1NpT3ZPS2RuTUdUaFF6QzN6NkV3NVp0UityT1RudHRw?=
 =?utf-8?B?SlhYNWVjdU0wcE1BQk5NREV6bXpLNlNUSzAveEg4UnpKL1pwcExaSGg4UmRS?=
 =?utf-8?B?cDRWVzNYTGlNbFVnNFd2VE92dGI0SnVXQUpzaE1UdVVIWjVCMStMN215YlYz?=
 =?utf-8?B?QStTb2lac2liUHRMVndHd2Y2dVZDSTdOVGI0aW8rY2U1dGVjYmg0V3BNUE5T?=
 =?utf-8?B?U0h1dXdpdmxqczVEOHF3RDM1RDEwZHl4UUtmUDQzd2ZtQlg5YmFpc2dHTk9V?=
 =?utf-8?B?MzA0Z2NKbS8rN0pzd3lrNWo3QVJpM3owQ3lwMXlIaTBjOWw1VlJxNlR2UjBS?=
 =?utf-8?B?Mml3aUhqSHBjWjdnZjErUVNVUldXSW5wdEJKeHZhc2d2Sk9PaW1mcnNoSE9R?=
 =?utf-8?B?eUVjSDl2c3ZweWtabnpjUVE0YlJ4T3M3RHl6K0RPNXBXWnJoYXlkQTJ3WjdJ?=
 =?utf-8?B?UUY5aFZBRGlieGN0VVQ4Tk1Rc091NkpNT1RrYzZBZmtxMGkyUmlkRm9UVXhz?=
 =?utf-8?B?dzcyUVBheTFUWlZjVVYzWUkvWk9sQWpPZjNOanczYks0U0ZBZ0tqSHZ1eUNo?=
 =?utf-8?B?SURYblJ1QVFLam01dU1CbFBTUThkZlVuNWNuOFpCYmo1dkYrTUEwVU5XRm1I?=
 =?utf-8?B?VDZEUG1kaHpYMGIxaHRVK1FlWnhSV3U2NXpXb2FYdExpWDBPRlpubEU3V3ln?=
 =?utf-8?B?cHRFWWZzanlLOGNmOFBvRTlJbFRZTnQyRi9JUkM4V0VJRS9KbysyY2UyVitl?=
 =?utf-8?Q?x5eE00p7A2pjwHLLOunclkPNxm17OJJap4wtk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1JVOW93REVGY1NMQVZWM05pNytuSjF2cVlicXFSVFZKelpUMmc0cUtIYjhO?=
 =?utf-8?B?SUxBdEVvUlh1Ty84N3VoTzhaMGhYT1dINE8wMVRsZ1JrTmtxSGlzMkREOWZX?=
 =?utf-8?B?Q3NiRXRLdkh2UzcyNE1BdnlBdUJwSVFRZ0J2WFI5Unk0TkdwRGIzRUdRMzIr?=
 =?utf-8?B?VlQ2WU9LZXlSS3hpcWtGaDNIOXJZUmU4bE5NOUdqMEhhekkyc1dQdldkT2ti?=
 =?utf-8?B?MDBNWkx6ZXl1KzlVTmVEOXc0cmpRNC93bEZROXpMNDdDYlZXUDJ2SmZnQjEz?=
 =?utf-8?B?Skt1Wm9KNVdLQUczMnQ5QmV2YVRXQW5tb0w1VE5yUlZQbXRCeCttQ0VsU3Iz?=
 =?utf-8?B?Wkp0R0ZzRTc3RWdrN0tZMlJ6cW5pWWNSYmxNK3p2TGtPNTk1cEpwbEhzWTVp?=
 =?utf-8?B?QzhMNDIxS2VzdTFYb2ZrT0lYNzN4d2NubWV4bHJ6ZTFHekRVZmxRTVhtaGV0?=
 =?utf-8?B?ZDNCMmhlUktRaVdpNmZ1WDJrOEZFVlVpZ3ZsSEc3L1Y2QVY0cFhjdHNNZUN5?=
 =?utf-8?B?MnRBbVBhUjR6VUZUTDZjN09senhrWkZ0UTF5UW13Q0hseUJsRHBHejNkZUtQ?=
 =?utf-8?B?NnpxMWR2dlNZZWFNb1hudmEyWmgyaXhIN2hPNU9XeFRUdHdkNSsySjhkTlJk?=
 =?utf-8?B?Q3VxTUxVUHdmWUI0UlNnbmYvTlVQaWZnYytvVEQrQy80by80Q3ltZjJ3S2lP?=
 =?utf-8?B?d0VreVQ4ZXFEaWdSSU1qQjh2SEQ2MmFBZFJzV0VXTit1SWxLYk41RDJrNllD?=
 =?utf-8?B?dkpjeW4wT25lcXlSQ2ZmSVoxN0ZTakpaZTB3c1BUOW1hVWZrWDBTZ0xLcndX?=
 =?utf-8?B?VlRzenY2ZmcrWkp4TGVaditxbzhLRVRQU0NPZDgrZFBzY2xjMVNmWjBPRml0?=
 =?utf-8?B?bUhQV2Y3S1NZYUFBVEhMa1l3LytDY1FkMVh2V3lxOVQvSnVjQlRadXVCQjVP?=
 =?utf-8?B?VVBzYzl6UzZVV1o2aWsxNFVyOStiaXkyWVJXK05ncVdsTWNXT0haL3FRYm82?=
 =?utf-8?B?QkoySDIrUGtDWGlPWjlNR2xSSmJ1VFNGd2xTMitpYlhOQzdxY2RIU2N6QTRT?=
 =?utf-8?B?N3RXQW03ZXhtTmwvVUwyM09veVdPd2pnZXpoZ0JrQzJFSjVGaEliZ3c3b1NI?=
 =?utf-8?B?L1RMcmZWa3FLQlBpSGIrdXFFeDE3QmdCZmtuRTlOcFhSYmZLRE9DR0Q0cjBF?=
 =?utf-8?B?WE8xd1J5ei9oSmlPWi9FcHZvdUM4YXZLcWxrSDJ6QUZCTTcvUFB3RzVPeXUy?=
 =?utf-8?B?VkN2U204VHY4UDdsYzRWL1FKUkRmNW9jNGYrdERyMklCSlkwMngzeDFMQS9w?=
 =?utf-8?B?Y0grd2FyMXVETEZ6UUhwRUJrbU9sMm5uMmRtcVluMmpiditUTHZlbi9lQ2pu?=
 =?utf-8?B?WEpidnBRb2MzNk91SDhXL2k3QWpGcFEvYWNFMllzYjZJYzY2bm0wc2wxV25j?=
 =?utf-8?B?bko0WG01dVVQc3lPZk5YbmpZMVpiMml1dUdFRnFZd1N2KzQxcDhwc3YyRDBi?=
 =?utf-8?B?Q2p4aGZmKzhKbDllbDF2bGdMTVFpZHZYVm85SG1jakREMS9yMXMzV1d6M3VQ?=
 =?utf-8?B?bmg5a0pvRjI5elIrWXd1QUJJS09lRXp4R2dKdGlLQ1EwNzNNTXVtUXR4QVVW?=
 =?utf-8?B?WUFxS1lwMnRWNkVzMHp2bk9MZHVzYVVCb1gwNWVacHdzNHRJVE8yNk5odEdU?=
 =?utf-8?B?bWtoYzRkTE8vYnZOQXkrdVY5ampJNDJ2MGpHRlFMbHU4WWNuZDRPN2JIanN1?=
 =?utf-8?B?ZHZyVHNqYlU0ZDhONHZFNTVDSVFtbHo1bElsN0tOb2o0TVUwRTRBdGpteERN?=
 =?utf-8?B?YWRnY3V3UHptbHBic0RZcWJ2d21OTlVNNU9DbGpsMEFFZE5pTHh4SXBoemg1?=
 =?utf-8?B?c0xGd2NObnBBWGVmOXJhalJWMlJnb0h4UFZDb1Rud0k5OVEyaVdCNGYyNTJ0?=
 =?utf-8?B?ZzdYZ2lhRlkyRjRVNnc4Qm9rQlFnZXhFOTVZWkRhWWlHekVTbzQ2ckNTdnhz?=
 =?utf-8?B?c0h0Umd5SjQ2R2dpcGNncS9TK0NkR0F6RDQ3VGdCWWVweFd4Mk5LWGw5MVRj?=
 =?utf-8?B?OExpNEJkZlJ4YjZhajJtYzBOV0djR05QUFU3TFM4SlVlVEU5OHpOc2J0Zmhk?=
 =?utf-8?B?SmJwbXVNRmFYb2VUTnZqVHFHNmg3d29yUlEvMUZweUxjejJpZXd5U3hFVnVr?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2009bc76-7508-438d-7964-08ddf0bea7d6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 23:06:20.8761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5m1X8MYmCV4BVgFrlPLJ+hXlwVFiiwqDtTNhrQFNlGpWWKi3O/SzN88jSab88MWWPVtOMCEjkTPP6GjQbRe9Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2AD6B04BA
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



On 2025-09-08 6:35 p.m., Daniele Ceraolo Spurio wrote:
> 
> 
> On 9/2/2025 8:14 AM, Zhanjun Dong wrote:
>> Boolean flag access from interrupt context might have synchronous issueis
>> on multiple processor platform, flags modified by one core might be read
>> as an old value by another core. This issue on interrupt enable flag 
>> might
>> causes interrupt misses or leakage.
>> Change the interrupts.enable type to atomic to ensure memory
>> synchronization.
> 
> I am not convinced that making this variable atomic is actually helping. 
> The issue is that the tasklet is running after we think we have stopped 
> it, which is much later than us setting guc->interrupts.enabled to 
> false, so there should be no risk of concurrent access to that variable.
> 
>>
>> Fixes: a187f13d51fa0 ("drm/i915/guc: handle interrupts from media GuC")
> 
> I'm not sure if this is the correct guilty patch. While this adds guc- 
>  >interrupts.enabled, that shouldn't have changed the timing of things 
> around reset. The issue seems to be that a task already started isn't 
> cleaned up properly, while that patch changes how we stop new tasks from 
> starting.
> 
>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14834
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> Cc: Andi Shyti <andi.shyti@kernel.org>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>
>> ---
>> Change history:
>> v4: Add back skip on disabled case for tasklet
>> v3: Drop skip on disabled case for tasklet
>>      Drop memory barrier
>> v2: Add skip on disabled case for tasklet
>>      Add memory barrier after flag changed
>>      Add Closes tag and typo fix
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt_irq.c    |  2 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c    | 11 +++++++----
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.h    |  4 ++--
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  3 +++
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c     |  5 +++--
>>   5 files changed, 16 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/ 
>> i915/gt/intel_gt_irq.c
>> index 75e802e10be2..21804eec8320 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>> @@ -20,7 +20,7 @@
>>   static void guc_irq_handler(struct intel_guc *guc, u16 iir)
>>   {
>> -    if (unlikely(!guc->interrupts.enabled))
>> +    if (unlikely(!atomic_read(&guc->interrupts.enabled)))
>>           return;
>>       if (iir & GUC_INTR_GUC2HOST)
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/ 
>> i915/gt/uc/intel_guc.c
>> index f360f020d8f1..1b8d3bbfa16d 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -100,8 +100,8 @@ static void gen9_enable_guc_interrupts(struct 
>> intel_guc *guc)
>>                gt->pm_guc_events);
>>       gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
>>       spin_unlock_irq(gt->irq_lock);
>> +    atomic_set(&guc->interrupts.enabled, true);
> 
> Leftover blank line
> 
>> -    guc->interrupts.enabled = true;
>>   }
>>   static void gen9_disable_guc_interrupts(struct intel_guc *guc)
>> @@ -109,7 +109,8 @@ static void gen9_disable_guc_interrupts(struct 
>> intel_guc *guc)
>>       struct intel_gt *gt = guc_to_gt(guc);
>>       assert_rpm_wakelock_held(&gt->i915->runtime_pm);
>> -    guc->interrupts.enabled = false;
>> +    atomic_set(&guc->interrupts.enabled, false);
>> +
> 
> Extra blank line
> 
>>     spin_lock_irq(gt->irq_lock);
>> @@ -146,14 +147,16 @@ static void gen11_enable_guc_interrupts(struct 
>> intel_guc *guc)
>>       __gen11_reset_guc_interrupts(gt);
>>       spin_unlock_irq(gt->irq_lock);
>> -    guc->interrupts.enabled = true;
>> +    atomic_set(&guc->interrupts.enabled, true);
>> +
> 
> extra blank line
> 
>>   }
>>   static void gen11_disable_guc_interrupts(struct intel_guc *guc)
>>   {
>>       struct intel_gt *gt = guc_to_gt(guc);
>> -    guc->interrupts.enabled = false;
>> +    atomic_set(&guc->interrupts.enabled, false);
>> +
>>       intel_synchronize_irq(gt->i915);
>>       gen11_reset_guc_interrupts(guc);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/ 
>> i915/gt/uc/intel_guc.h
>> index 053780f562c1..40242bbb166e 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> @@ -93,7 +93,7 @@ struct intel_guc {
>>       /** @interrupts: pointers to GuC interrupt-managing functions. */
>>       struct {
>> -        bool enabled;
>> +        atomic_t enabled;
>>           void (*reset)(struct intel_guc *guc);
>>           void (*enable)(struct intel_guc *guc);
>>           void (*disable)(struct intel_guc *guc);
>> @@ -393,7 +393,7 @@ static inline int intel_guc_send_busy_loop(struct 
>> intel_guc *guc,
>>   /* Only call this from the interrupt handler code */
>>   static inline void intel_guc_to_host_event_handler(struct intel_guc 
>> *guc)
>>   {
>> -    if (guc->interrupts.enabled)
>> +    if (atomic_read(&guc->interrupts.enabled))
>>           intel_guc_ct_event_handler(&guc->ct);
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/ 
>> drm/i915/gt/uc/intel_guc_ct.c
>> index 380a11c92d63..f0ee3f1235d4 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> @@ -1326,6 +1326,9 @@ static void ct_try_receive_message(struct 
>> intel_guc_ct *ct)
>>   {
>>       int ret;
>> +    if (!atomic_read(&ct_to_guc(ct)->interrupts.enabled))
>> +        return;
>> +
> 
> The GEM_WARN_ON below is there to guarantee that the tasklet is not 
> running when we don't expect it to. By adding this check above, you make 
> the check below impossible to hit, because interrupts.enabled is always 
> set to false before ct->enabled, so we'd always exit silently here 
> before reaching the GEM_WARN_ON.
> 
> I see 2 alternative approaches here:
> 
> 1) If you can motivate the fact that we're ok with exiting silently here 
> without logging an error, then just remove the WARN_ON from below and 
> exit silently if !ct->enabled
> 2) Make absolutely sure that the tasklet is gone and not running before 
> setting ct->enabled to false (e.g., you could leave the tasklet as 
> disabled and re-enable it after the GuC is re-loaded).
> 
> Daniele

I agree with Daniele that make enable flag atomic is not a fix, it looks 
more like an improvement, but not fix the issue in tasklet.
This patch will not moving forward and I will make another patch that 
focus on skip the GEM_WARN_ON under some condition.

Regards,
Zhanjun Dong

> 
>>       if (GEM_WARN_ON(!ct->enabled))
>>           return;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/ 
>> i915/gt/uc/intel_uc.c
>> index 4a3493e8d433..9d01c3c3d504 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -659,7 +659,8 @@ void intel_uc_runtime_suspend(struct intel_uc *uc)
>>       struct intel_guc *guc = &uc->guc;
>>       if (!intel_guc_is_ready(guc)) {
>> -        guc->interrupts.enabled = false;
>> +        atomic_set(&guc->interrupts.enabled, false);
>> +
>>           return;
>>       }
>> @@ -687,7 +688,7 @@ void intel_uc_suspend(struct intel_uc *uc)
>>       wake_up_all_tlb_invalidate(guc);
>>       if (!intel_guc_is_ready(guc)) {
>> -        guc->interrupts.enabled = false;
>> +        atomic_set(&guc->interrupts.enabled, false);
>>           return;
>>       }
> 

