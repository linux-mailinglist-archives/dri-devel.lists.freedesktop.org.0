Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F70BB2B002
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 20:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560C910E02A;
	Mon, 18 Aug 2025 18:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a7fLPBW4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAB110E02A;
 Mon, 18 Aug 2025 18:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755540785; x=1787076785;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PU/QIeGMzPr+XIWwqwg4jXvrmJTIX312aN++469bqiE=;
 b=a7fLPBW4Y/2bKOjhhRDg6hhcg2UjacuJVmkrpWMp6qtqBON401aFo2n/
 bgcQ1aNx2vZ6hkEhxms7CQi47iKdqQdxT9l+mdGP3fAAzVe/7hQ9Nnh8k
 uGgAS4ogT/UFzenroUz6iDKeR15cl/6wRX5qTGxinv9CIlCpvc1BAMB8k
 ykItMbQ6KUHZHaqNbgcZ9uSLp2NieUjieF+yjWmUHipPPsDSr2mLd6nSD
 okhF07FvMF40jEjQPTGgyPUgqElnXP0qjjgZUKYq1zAyG/vzHZ2gZ3Wjc
 +S0wrjYccsip91x7L4ELzFkl2MF5DTBq7qxzfVgl/JG3GFPXbjVc5hCQz w==;
X-CSE-ConnectionGUID: dr7wjL8CSdC7Gu8eP0BSuA==
X-CSE-MsgGUID: /K2bi4FJTdqlV8AE3/yuew==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57701719"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57701719"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 11:13:05 -0700
X-CSE-ConnectionGUID: LN30QdLDTD6K4JA4vKoNZw==
X-CSE-MsgGUID: c84oZHWGRDquIxpu0/mP1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="168031690"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 11:13:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 11:13:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 11:13:03 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 11:13:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUVcL9XT6c4zO6AE7xUlItk6EqrJQ3RRC2gaAe2bBSCrOpx0/q11me5ZvnAqCw7aAWPACsx+K8xx4qEMsTzw96eOQdwc/77WLmjGhalflQp7X+d3Cd5oDoYoNCoIGaJFcUGojQxtEykJ1fV7s1SgYiKbF3Kq3EMb410sTwcuRoI5y6KjjUF7apzRMnTYZSPCXxy8PfKgwnp4r6zIVE6wvvFyLFucU2YjQ7D5RS5nUceDAgHzvLG3sz8ZxVcRCwPtETEe6CC3vUZpb6dWWnPEAvg7khDtQPNISisVnhpdV1vYbCHe8xVNd4BXRuOWdiJLkVU3s7g7WeE3H8Z6cPGjqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDRPExoVM/eSRsXZL6Nbsiq4mvh/lSbrrqDLWI/aZpI=;
 b=EcGcC4GjuzkgOWN7kInXd4G50HixYoRO/KOSQ0sM+Xy4UDy8YvznZehjePl78IpLdXOMFIKrCJyBBnX9e/pJkOI92RhtEL2/4wiyOqsvHQjrHQqROf5aBbQvsY4MmE81m8x0XHQg1ataKo/dUIpTU0H49f5sa8BJdPyl+ioZjY0HW7GDJvmAQFtJyd/huYAXFBVlbCoy1Kxct9Gsdw4hr7MFrV4DKcF/vbyWrQlOZH7UeaT8Tb5A8ws9M+21AXYRnjeMMztA3M02jX1uIwxGQQFq2VYNXWw/dOfRi2Q87uZmQ6fM+zWXKCUdhf+qwDXCcMINdif0hmQdCiLP5SR12A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH3PPFEC89C124F.namprd11.prod.outlook.com
 (2603:10b6:518:1::d5d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 18:13:01 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%6]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 18:13:00 +0000
Message-ID: <cb71ea7c-e29d-4733-8451-7983011f9ac5@intel.com>
Date: Mon, 18 Aug 2025 23:42:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/24] drm/gpuvm: Pass map arguments through a struct
To: Danilo Krummrich <dakr@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Boris Brezillon" <boris.brezillon@collabora.com>, Brendan King
 <Brendan.King@imgtec.com>, Boris Brezillon <bbrezillon@kernel.org>, "Caterina
 Shablia" <caterina.shablia@collabora.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>
References: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
 <20250814105950.2177480-2-himal.prasad.ghimiray@intel.com>
 <DC5QAWS5QUG8.28DC0DJFT5S2X@kernel.org>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <DC5QAWS5QUG8.28DC0DJFT5S2X@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH3PPFEC89C124F:EE_
X-MS-Office365-Filtering-Correlation-Id: c2e49ddb-2353-44be-3c3d-08ddde82ddd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmFTU0gydFI2eVFYK09QUTIvc1hjVmpReU03dGhBTXMrRklSdUhsOS9CVGc5?=
 =?utf-8?B?L3RUU0V3MVdKS0UwdXltNHF6WmFuN1RpN1c5dGJhTU1oYStsZEZYTjJsT0gw?=
 =?utf-8?B?aktwVEtkZmhFY1lTYUZuWk9ZK1pOWTBXNFBTNm85dEZiQmcwVU9NTGFFVGRu?=
 =?utf-8?B?RGM2YlhybEw5ZkJ2R0RTQjhidzdGSDY2L1V0a3VLQ0FaSnFMS1ROTGVNNHV2?=
 =?utf-8?B?V29QQ290aEd3eVJHdGVQZUpFT1NVaUkwVWlWRGhrMWtpQ0xlQ3g4MVVqVHBu?=
 =?utf-8?B?QnJTdFNlQllseGxjL0tSb0xNOG9tVy9ZNEZHa05GaGFMRDMrczdiRTkvbUJm?=
 =?utf-8?B?djVjOXhNS3VzNitsZTMybVQ1ZEdkUUhkK1gzd1JJNkErUzFWb2w3TERqSlZ5?=
 =?utf-8?B?MkFZNWlaZnhqNnpvRkpvS3hycWhhRE0zUmhzYmI5ODBHZGkvUDh6blpiVjJl?=
 =?utf-8?B?N2w1ZmxnMU43TXZTeTBpK1ZsWWU2b2V0WlhrNkFoS0kwOEdYTHl2S1FndzdM?=
 =?utf-8?B?VVVQN28wVmsrSnUxRTh4cUZmbE55SkRuNWEwUEhMd3gyclM1Y0pjQzJCWWg4?=
 =?utf-8?B?VUVKbHRZQ284bUNhcS9rQTdIYXlFcFkxUUF2c0JFRkU0aGJVM1k5L2FXNWFV?=
 =?utf-8?B?aUR1d0JjQ05oVFhqYTF0NC9yMTdic0FWODJTbUJJZjllMHdKU0RqUUp0Vmdp?=
 =?utf-8?B?QW9KdGhYWGZxZ1FsT0RKUEtGRXQwQzIzckd1Mkh3eDFJd2d4MkJ2dkdoSTc3?=
 =?utf-8?B?RitMdE94NnNHK243RmNCZGhXWGxBM3NOd01RbytOSWhOUzYxOEM5THcxQ1Zu?=
 =?utf-8?B?ZVJSaElTRWtaY0lMdlkvc0JHTFZoUU9rQWFaRHdEY2dwenFQUk1wb05keUt6?=
 =?utf-8?B?WUprVTdJREZjbHZUR3U3aVExeUU2bzVpMGlNMG5KcElzSTN1blZmMWhJamRQ?=
 =?utf-8?B?cDA0Mkt2ZXJoNFdwbTd3WjF5YlVUeEl1Yklmblp1aHpUeFMwRmFxYmF3M1VI?=
 =?utf-8?B?ZFgzUTluZzZFQnBwWTdyREJ0ZytXY2NEeGZOazBZaTZ1U05Ic3RiTVEwZ0dT?=
 =?utf-8?B?R3prUkdqWE4wSlhPck8rRFNuV1hqRHdOOWp6RlZiL1hlWThNTTNNd1RVNmFv?=
 =?utf-8?B?MmpVQmNURkpQNWgyU2pXejl3OVNHN0lCVTJ1RHExRW1hcXZNWEpONmJTekwv?=
 =?utf-8?B?K3cza25lTkNJSjVSQ2tBMDlaakova3JELzdtN2dRV0p1cTBYckZla2RjaDRJ?=
 =?utf-8?B?L2w1K1llRldQWEJ3MVpHTmVYWVNTZFpiY09yUTJCU3lTbEdaWWYvYisva1FY?=
 =?utf-8?B?U2hiR3JBTjBOaWN6OWo4Vkpla2d1S3p0eXg0ZmhlZ2thUzMrVjlvRnlkMHNS?=
 =?utf-8?B?UnUvcEVkTkJ6NmVZV1lqSzgvei83cVVmU0JDYTFXUWNjV3FuSzgwUGpCZEJn?=
 =?utf-8?B?UDZySSttMm9KZVJhQStJbFQ4K25vcWZqRVhEWTVHTzNMTzByWkdIbEhIeFk2?=
 =?utf-8?B?a2VQWHFQZlhLdjNwWDRuWXQ3aWo3dmMwRisxMEh5eDY2ZzNqTjU0ajhjY0ZV?=
 =?utf-8?B?QVhvRFUzMWxjYlZuTXE2Zk5DaFlGSlpxNUFKVjY1WTE5bnFBZk5pQjRvYUpr?=
 =?utf-8?B?ajZZbHc1djFuYTB3aXppTCtUcUhZZ0dqMkNCOXY5WU9pcS96QXcyTFVrdm1u?=
 =?utf-8?B?d05wVkNxcG5HV1NKbS9tTTlSYTVWcXQ4UTh5ZkVheFJHOXdiR0VJSXRWc2wv?=
 =?utf-8?B?amd6bTlJYjQ2OGtlQm5wZFd3bExaMzdNYXZJTnArZjZ1amNEKzJ4WS9JNWtO?=
 =?utf-8?B?MEdjUFlUcUpZOW5KVHpBdlhlZzU2eEwrN0hoMU9XeE13eGV3K1NmbmFrZVVv?=
 =?utf-8?B?UHV6QjFFV2s2aHdJZjZDMkdnOThDMXZYYmIvcDhhUnFuWGgyWWRORysyVHdS?=
 =?utf-8?Q?3vra5Zmo3k4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmpNL1Vrd3hhajZITWpWZ3k0THk2aWFSTkFIYU43OEhMT0JpTlhGYklIaDJP?=
 =?utf-8?B?bW4wWWYzdTNjdDFXdmJOenhGVUNHQUJCUmRtQUlaZExzY0ZQQllxeG05ZUpI?=
 =?utf-8?B?TzNIRmNqN3NtMHFnZENSejNOY25RcGlWbzRUdGh6cG1QbS9rMDhTOXlNWWNL?=
 =?utf-8?B?a2FFcmlxYy9aam9aQWpiTzgrZkpocDVMNnR6ek9PeEQzd1FDUjV3NUlWN2lt?=
 =?utf-8?B?M3AvZFlibVlKaGxuTUhvTGl5RDlrZHNnNmZqUzFKbWh2ci9CNzh4eGpyZENL?=
 =?utf-8?B?TmNpbStRRjc5Uyt0bnM0SERCQ3hOZkJHTENvd05KeWdweEtaVG1vbW5UQklB?=
 =?utf-8?B?RXlrMFl5bzZPTVRReEFtZTBxTWNBbkJzQmM0OXRqRmxBTmVsN3NoZTY5TkIx?=
 =?utf-8?B?SGJOWXZMZTIyOTUyeWJjMFgyeXRWMGhYTy80WnR4cVhuNzByWnM1Mi9nWEZT?=
 =?utf-8?B?bVh6ajNVeHB3cmQvRGp1NEFGSzB6TUZ6THFGUW1MYk9HK3g2Sm9UdVYrSDgx?=
 =?utf-8?B?c3lUM0tWR0RvelRURXU3TUdoRTM5di9RdXBGcXc1WmhJOTVWRzRLOElIak9j?=
 =?utf-8?B?RlpVVytGWjQ2NHNLdWw0ZzhlelZUZmg3d0ZScHNEamorLzRyWjBRdUtZa0cw?=
 =?utf-8?B?WHY3NjVvcTZWYnY0K0tpTnVQb0hITHdSb3M1WFJmNlFwMGFwSUNoLzNXWVhO?=
 =?utf-8?B?R1dLVGxiTFhSMUhBdmFPcVJlVlZRekVXOGNrblJ0cGl2ODF2QmNoK2JNempM?=
 =?utf-8?B?V0hsOENrcE00WjBLUnRNUStBdHAwYStkeHZ1WHQ0bXB3QktKVWN6M3FQOUVv?=
 =?utf-8?B?U29XakVsS2lld29DWFhHcTYwUDNZM2JFSVVWejYzN0xHbGxCV21Dd1MxalNu?=
 =?utf-8?B?M1JUcUVWbVI1RGlsb0IwbC9jUEVZQ1lZcVdXMm5CQVk1M1ZYUHRBUWFVUWZ3?=
 =?utf-8?B?ZFZtU253YzRML0hKN1Q3Ykc1SGxOTEt2ci8rTFZNYTh1TDNwQ3ZGVnl6eGVF?=
 =?utf-8?B?bndQTHNkQXdIR3Buc0RSajU3MGV6NDdTaGNRL1AwZ1Y2czIrTkRHK3JTdFpN?=
 =?utf-8?B?YkpxOEpjTjBlSkYrK2xwbUtJWVR2WjhZSWltNitNSWI1TnpnejJzUkk0MUQ5?=
 =?utf-8?B?cEpDTWxRZE5VK3gwclliTFVUcTJEZFNMS3ZqcDgxNGhzdTZWdGkrRTVNbWNC?=
 =?utf-8?B?a1BySWljcjN6OHdZcU9EaWI4NHpaRGh2QklIZno1ZXUrM2o1MVNINFBIdGMx?=
 =?utf-8?B?cTFybTNJQ1dyWWZhOVRDckxvNVlJMDh6MThYTERLV3k4T3JtVU5mVzAyWlNs?=
 =?utf-8?B?RHVTQkh3elRrNlFTaVd0WFJRWVpCNHJ6bkppY0srQ1dlbTBzK1NuS2EybVJa?=
 =?utf-8?B?eXR3a01HdVBHK1pMNEZiZDRjL3hFTVFqQVRMMk9KTWhqSEt4MzRSMXczend6?=
 =?utf-8?B?MHZQRGxuT2Q1TEJlRnVoVEJzNXZOSTVza1ZLNC82VENDUm9EdTlmTlpZNlBu?=
 =?utf-8?B?N1dtSVRmcnFQYVVWblRLSGxZQWppZy8xbFgwalN3RHREcDZTcVUzZVRsTDVY?=
 =?utf-8?B?RDk4TUdVOHhXNmFnN2UvY0hCYmRhMWZIUDE2VzVYNzdoQWlhTDBZWk5ycC9u?=
 =?utf-8?B?U1BlVHZJR1VyQkprRnRGMGdwTEdkMEpoSUtjR2NzeHhnUC9Ia2pKeXZpMnU4?=
 =?utf-8?B?cVcrQzEyMERXUmF2elJUNFREdERpY05ibEpIb203QXNzLzlEbGVOTllXZ1JM?=
 =?utf-8?B?azYwSEN5MHdrREw2SVlMODgyejhVOS9valVMclJxWjBKbHRsUDdrdTlqUzFS?=
 =?utf-8?B?aTdENnN2YzV0VzVPUkhPNWxRK2lnRStWVGhVYnorTUlxR1dDNmRYMDIydStQ?=
 =?utf-8?B?R2ljZFIyM0RzeGd0T1JkSWZvLzM4cUk2R0ZFUTV5eWdya1RxSUpTL1BncDlm?=
 =?utf-8?B?WHpYNnR0d0RMNDFHT2RGUGpnTnQ4VXNDRjB0RWY3WWFMa2YrcC9tbitsdnkz?=
 =?utf-8?B?TXNKK2hzaEZTaXdad3pUNUNiWU1VRzdHckJBS00rVE9mMUh4TFRhRlN6c09H?=
 =?utf-8?B?cmVRK0dtb3ZQWjNsMFB2REZ4WmM1TnNDL1FTWDhOK2l4T1d1VmtyaHMxblpH?=
 =?utf-8?B?S3JRYzBiV3V3TmlFYm5GbWRkbG9kZzNRYXRlbmM0Z3lRVWFIRWRqZHhyRSs1?=
 =?utf-8?Q?SMs+JiuYDCp81XXC2d9WN8s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e49ddb-2353-44be-3c3d-08ddde82ddd0
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 18:13:00.8866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvUbZAmdyMwDc0xyE/600kkaFAhzLseet9UACrmgkH4vC9HNZozwr6lsnv6APK45yWTObMCaPD0Bx5ZbD+CL7VPjiVq1VVMabnk6n3VIBhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFEC89C124F
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



On 18-08-2025 22:57, Danilo Krummrich wrote:
> On Thu Aug 14, 2025 at 12:59 PM CEST, Himal Prasad Ghimiray wrote:
>> From: Boris Brezillon <boris.brezillon@collabora.com>
>>
>> We are about to pass more arguments to drm_gpuvm_sm_map[_ops_create](),
>> so, before we do that, let's pass arguments through a struct instead
>> of changing each call site every time a new optional argument is added.
>>
>> v5
>>   - Use drm_gpuva_op_map—same as drm_gpuvm_map_req
>>   - Rebase changes for drm_gpuvm_sm_map_exec_lock()
>>   - Fix kernel-docs
>>
>> v6
>>   - Use drm_gpuvm_map_req (Danilo/Matt)
>>
>> v7
>>   - change member name to map instead of op_map
>>   - use local variable to minize the code changes in _sm_map
> 
> I know it's a thing in DRM, but I'd rather not have the version changes in the
> commit message. Please move them below "---" or into the cover letter.
> 
> (No need to resend for this. :)

Sure. Thanks

> 
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Brendan King <Brendan.King@imgtec.com>
>> Cc: Boris Brezillon <bbrezillon@kernel.org>
>> Cc: Caterina Shablia <caterina.shablia@collabora.com>
>> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: <dri-devel@lists.freedesktop.org>
>> Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Acked-by: Danilo Krummrich <dakr@kernel.org> #v4
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v6

