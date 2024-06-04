Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9DE8FACFE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 10:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810AC10E431;
	Tue,  4 Jun 2024 08:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDdzezVs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC98E10E435
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 08:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717488015; x=1749024015;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eA7WQGd28dmYOVYmRMRkOz1jRa+zdHGtK6Lvni0LvII=;
 b=RDdzezVsz0oUQ9iWPjatP4YRVmQsiLP3ObNF24I8GRB3WvsR4LdlZiMO
 YDe97VcMXS5bJrcaHipl64p9YwLkU7Z2BZMf/MJFng1NuB5U9JYlxaHmu
 1XBX74osvZcD5a0eRZSbDFSxN6/9Nbz88zv9aM1the9PxCkq4KzPksUzO
 9Xa9L0JcmtgQGV4DE68AxCIm3xSQe+IM2ZiQFqIb6uInylFbkyeFfE0nq
 3rHlRZ0o0b0QwVNfuUVSdV0K+NncFqDLm6Sy4CFVSbAIKcCn+vu7VcJpo
 AmlWx9hz19Ezxr9429kHJhcofNCXdYtkYbryb/sL+rkRYGFoMdAWJk/CO g==;
X-CSE-ConnectionGUID: CkTRoaHSTdKMl+tU6SIWhw==
X-CSE-MsgGUID: Yak9IDFJSuimEle6M00W3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14240993"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="14240993"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 01:00:10 -0700
X-CSE-ConnectionGUID: NC/sslmPSRiTtULqQ/Fr5g==
X-CSE-MsgGUID: lWfd8BD6RBOSZ1GhrkZulQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37213300"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jun 2024 01:00:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 01:00:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 4 Jun 2024 01:00:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 01:00:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlqfGXu+BxFIo06PX31pdTn5BuzZJrTTwriAwM2m3rHVJnY4GblqTBZGkC8tN5jrHGEjCWhQuZfH89rKcNDNYeBUZUtevlWc3WiuMhx956bXrVrgyxiHLXGXsVAOsQ6TgPq3OgvasuF6VqnFc3uH01CVj3hjkxgqLi3OAzzz9lnjfbQhSBtTMYNqoxv36hgcY2o/f/LhgRwjEarTVd7AZIrrvmH9ZlEzSyn47O3DAtD73i3dmzbDY/ZEZ854YMwvMTTKV6BSlY6sZqro8ndtR2sH5mVMSt5KiEh/3MS525OX5t1eHOzaQmWKkXiK0sjQEYzlaO9HIDk6qxHC86NiRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3HH4CJHhYfHxXDoXhLWgN2V82Io7vdCQ2XmXiPsqfY=;
 b=NzYFwsXyfSpAVml0J84JBWkC7uNym6/v84svkmGNa3Bz+xceZyu/lPsXLXiEREGKcO+pzj5S2zCXJk4Sh71u3p2TmLH7VJD/6SGFhKnahqzh/vW1FydhZrQslowncuS44GA61NHotNu5HsxjiNCfbnjQd1mbBvcXZAa1uAOi0D5PBxjunlTglBRIFccZ6MQ34nTM3lzv0sJUkoWDVkCjmBQTHAnY3fOvVTMRxPGOTXHPe2qqm4Z5GONK5inie2k5AMk8pJNdNsZdMxlO6Bbe6tuOtJd+7QwEiX4xzvHXFLYAORyAg7cQdQzFFwyXi6o0sZyC3nJEVcRRNZxMevymaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by CY5PR11MB6308.namprd11.prod.outlook.com (2603:10b6:930:20::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Tue, 4 Jun
 2024 08:00:07 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::d244:15cd:1060:941a]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::d244:15cd:1060:941a%7]) with mapi id 15.20.7633.018; Tue, 4 Jun 2024
 08:00:06 +0000
Message-ID: <445fae9f-ea1e-4864-9f0e-f348c51146a1@intel.com>
Date: Tue, 4 Jun 2024 16:03:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/22] iommu: Add iommu_user_domain_alloc() interface
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Kalle
 Valo" <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, <mst@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Thierry Reding <thierry.reding@gmail.com>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 <iommu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20240604015134.164206-1-baolu.lu@linux.intel.com>
 <20240604015134.164206-2-baolu.lu@linux.intel.com>
Content-Language: en-US
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <20240604015134.164206-2-baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0027.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::22) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|CY5PR11MB6308:EE_
X-MS-Office365-Filtering-Correlation-Id: 39a8ab03-a3df-4770-49ce-08dc846c58dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|7416005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3FrT2FCSUswMGtJUnhPaENFWVMzd0FuNTlnNHRGVjhoOTcxQjEwVUZ2TGQv?=
 =?utf-8?B?aitTOXBXUDVpN3ZyMU55Wk1JdE41ZTdESVVXclZNWGhEQzhTck9maFRTaDFv?=
 =?utf-8?B?ZjZSL1hMWlZJTXUrSlp6MnJldFJLTE5VSjJUbFJYWlg2RGNmVENpeld3ejFO?=
 =?utf-8?B?aGR6WGYrdTFhUFFISzlyeXl5SnR6UWZFQko5YkJzRDZHSzJIYXlHV2hDWFBH?=
 =?utf-8?B?MkdmcEtmNlRXRXNWbDc0UmtuWSs3WGpycU1sSkVib2F3UnpIMWUzZk5saXdD?=
 =?utf-8?B?QXlRYTdWcXd1dU9yRmVNdnFwL2pQRHpITnNMcWdZOS9BUGlTNmlBUW5JV1VF?=
 =?utf-8?B?TWxpemJuOThSY0RwbXFDMWlXWXE0bE5YSEtLLzIrYXJsMUg5a3YxZHBjcGVG?=
 =?utf-8?B?QVVQRlY1Q0VTVnZ5OVZYbmludnVMQktPMERrRk5qR3IxamlNcittYjVRTnB2?=
 =?utf-8?B?aTRPdlJ3ZDg2R2tySUpBUnJ0ZVJOWUxacUNzM090MHkvOVJqVEd3emFPMHpw?=
 =?utf-8?B?R2FLYnpsTmtnbDdzSGJETUJwU05QSzFMSHJXNDVkQmsvbUZDN0VnQnVabGlI?=
 =?utf-8?B?RnZiZE40eS9CSE1vejZGSVRsKytGcmRNNXYrODNTRGR0dDBGMHJFMXVJMTZ5?=
 =?utf-8?B?WHNuaXdLc0haUEN6TkhKVjBDbm56SWZPK0dZWllQZklCR1liVkFhTUhXNFh4?=
 =?utf-8?B?cWRMRlRpQW9vWXYwTnRncVkyTGtwMVhLQkg4NjZsaFUvUUU5UFBnK2w2ZG1p?=
 =?utf-8?B?WlZ0azBmS3laTkRiVms5TlB0a3FCUDZrNUtHVS9tc204VWJVK3oxM1N2bzBn?=
 =?utf-8?B?cWgreGNWTEZKV0JmcWhsM0dLcjBWNzhpYmpqajR0WGFXUzJQbyt0SGZCUy8x?=
 =?utf-8?B?cVhvbjVrWTdTd2JNK0U5WCtiK29sYWE3ZmJqcnNPeUFBL3dEMHpudUxGcXZa?=
 =?utf-8?B?b0tBYm1rb0I3MVJoRnlURTNMNk51ZGdxTW5DMVUyNzJRL3d5WlRGcmxuSlFn?=
 =?utf-8?B?UDJXUnJFaGlYREJXeE8zMXI5bTNHbnlyRXMvdjdRTXllUkNNOG90TVlLN1c4?=
 =?utf-8?B?UWNJci9hbjFrTStYUlB0ZGp6cTA0Z2VwZThTMTZvQ2xXWDk4aTVFdmJsV2hH?=
 =?utf-8?B?eSthVVRWSVMzcFJpbXdwRGcvOGM3NGd4bE5rc3VVQXZKa1IzUGtIVXdGZVIz?=
 =?utf-8?B?Sy9ybStqTHZqVEJQU21BV3FiZ3VuM3htZXJIWndPWmluRTgvRjZWeDZMWGFa?=
 =?utf-8?B?bVU5T0pua1ZuSHZJQnEvWlEyWmgzUkhBM1pEbWpOQ3JHNVVPMU54NkFwK0lv?=
 =?utf-8?B?eEl2Ymc0S2tmYnJEQy9veVhsYVkyQ0JsNktwTjl0czRDY1l5dlIxN0wrS1Y5?=
 =?utf-8?B?dStDU1BNVEdpOHJJSlk3bGlJeHZNS2Uwd2xzNGg3SUtLSkxTV0oySVZKSjhj?=
 =?utf-8?B?Zkp5QS9OeWlVRHJwVWNTdWdXcURpSGVFS1VrWGxsKzd0aVdHZHVqQ0FTVEVl?=
 =?utf-8?B?V3M1NElyY1Q2WXBYd2FLTlErWjR1M0ZwcWlUMExkZmVjVG1IU0dLbG8wUE80?=
 =?utf-8?B?d3FOMWRKMWhkMUxvTWQ3czdUa2ZPUzIySFZoNGhFUVpNS0ltTGhQVGUvQ2Za?=
 =?utf-8?B?UjRCRGtjSmNHOTRFc3doNGk3Nlh5RDJFOWhYMU9hSkg2NDBRTDJ0RVl6NU0v?=
 =?utf-8?B?dXZVc2dYb2diem0zdVZyMFBiWnhNRWF5elZWK1VxbnpzV3ZvT2gwMjFBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(7416005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXJHQzMvNXo0Tkp2Z2d3a1lVc0ZzanNEOVRvUkNsVXVieE9iMVBRWUhaMzhv?=
 =?utf-8?B?NE9xQTAxWTBBcUFvaU5DSldQc0RKRnlJVjZLTjM0a0dCRjBpSnZBdGZ2ZUtC?=
 =?utf-8?B?OUpaMm42cGFnQ2NxOTdhL2NnL3VXT2h6enBVcjNEK3Ryb0NCa0s5UGtVNFVx?=
 =?utf-8?B?ekRhb2w5Q1pIbFdhbll5SVE1N0d5Qjk3aU5GVGwvUXVxTVBHOU5WbGh4K1Zv?=
 =?utf-8?B?OGlEUjM2WTN1aTRlR0ZnU2ZIczcwS0o4ajI1bjFSYnlkU2tnSytvZG9ZUTEy?=
 =?utf-8?B?MnpWUTlxeHBNVDZCVDdlRzdrUG9Lcm43UjdweFJ2UnNEVjFBenQ1OTUxZzd4?=
 =?utf-8?B?MHA1SE5tRWlGVTY1Z2hpaGpKSTZnNUQxMGlSOXNmMFA2bWlSYllUZitlM0wv?=
 =?utf-8?B?V1VJbFAxdG1GWXlUQWNsY1NpTUMxdVNQRGR2eU14eThOVlBHU3BIU0ZJbURK?=
 =?utf-8?B?SHRsUWNqcC90bnlhQlhVQWZhSXZEZjczbXFtQ2xXcFRmdGJVNFJpV1FPT0ZO?=
 =?utf-8?B?MHpFYVl0cXVNdlFycnp0UUc2b3liS0tBNDkvbG10ZkxUK2t5NXZvNk9GVjVD?=
 =?utf-8?B?YXViSURXQWJBVm1rOHVybkJBQ0hoMmp5N2dJclp3QXZLaklFSCtCTW5iQy9R?=
 =?utf-8?B?U0Q3UkVjMElVc0c5Um5JSndIRXkzeTFrVzlvTlBvRE1uSVpKa0k5bWE1SUlP?=
 =?utf-8?B?aVEwenorMU50N29kN1RsOWdOcnRoRktIRzRwTElzM2dFZUdKY1FPdHRFNndJ?=
 =?utf-8?B?NlgzaXNDRGJyVTJ5UzlTTnozUlhSYVJidHZ4MWNrWXlDeE9PbzBLdWhYQkNh?=
 =?utf-8?B?b2dUdlpJdWI4QXlDSTRNQnlQN29XZ2NPek9GYm1Td1NIN3FlWkxCMkVnckJq?=
 =?utf-8?B?MFhzbmI4SVpEODZ6eFBOLzB5ZW9GMy9XZElNUHdJU2wxbkoySjJ1SFE3WWdJ?=
 =?utf-8?B?U1ErZUhtM1dkZU90bDBoNVFpY25pRU5UbVBHQU81WmNlU2U2aUZCUzFCVVZX?=
 =?utf-8?B?WWpMSFhYWWRQOHJuL0tTd1ZHYmYyenNiMFRqMDNtb0FWWlIwOXRlODJReWpH?=
 =?utf-8?B?QlpyellPbXJJNU5VZ1AwV3JhbzY0SGM0VEpFRm5zWmtsT1VoOWJMeDdJa2JF?=
 =?utf-8?B?TTEzTjhhKzVBU3pHTjBEa2lEclliTVl2c3ZObTlnWmdlN1pTb0h4WW9QU3BN?=
 =?utf-8?B?dFBFbFJEemdLM2w3Q0dLWW05alF4clppNGlzRW8waVBVOGNDSzFvZ0lRQlQr?=
 =?utf-8?B?TmNVSGlLMTVxMk5PZ25RMTlsdFdnRS96R3NjaWVKeXQrZXFheXZPN1pyeUVv?=
 =?utf-8?B?MHF2bFovbXZtL1ROdlhUVzhHMWlXVXRKSHViZ3JSVzJZT0RqWHk5K2JDTXU3?=
 =?utf-8?B?LzFyd1NXZ2c3dW1mQU1YSmtEM2k0d2JRUm5qN29TcGlXUFRsNEh2Mmo3dHVJ?=
 =?utf-8?B?c1MvQXNpeTY3dFZZZjBFa2s5M05RY2dRTFFMQS9BSFNtWFZBbzd2MHM5Unc0?=
 =?utf-8?B?Q2FDaGNodlJ0L3RQTllTOCtOZC9NaldjSHBkUmhXV1lmWElMdHpZUDBNUEZl?=
 =?utf-8?B?bDIyRyt6V1N2SnF0ZHp1STZlWWU0MmlseWVZUkhEeE12LzVBRTNHWDlubW93?=
 =?utf-8?B?MnhHMmNaM0YyL25Jd2o1OVRVK0dEOUkyR0kxT2JRbFhUeklhTmFZZ2YxNU1W?=
 =?utf-8?B?RGZBcVovc0k4NHI4RHJLbkFUSzJUZ2ZDN0QxNkZYTFBRV1JQRFppMCtsK1pa?=
 =?utf-8?B?UEErZURpNnlYUFRHK0RYODdIT0JVZkFSd1daSi95dzdzQUZBQVA1WWNVMGkx?=
 =?utf-8?B?M0NnMWQ5bGs1d2g5bytkL1RwN0VVOTlRQ052Y1dtYUtpeTV0SVFiRGNqRW1M?=
 =?utf-8?B?aDhaVEJKWS9kRUtTeHZUMys3YWlDV1F1OCtDWnNMejZDdnpFQi9ndnVoUU40?=
 =?utf-8?B?NEhkRnRPaGdva3h6RmdxaDZwcDNvZVB0eUp5SGMzTEYxLzloSkZYZlVNU1Yy?=
 =?utf-8?B?QXZCYWN1RlNGMm9ndlUxeStDZ3hpdkZXNSt3RjdGcW84TkVCRHBGWW5qSVg3?=
 =?utf-8?B?NDZVTTJrYnNsdkd4SnF2eCsxTjRXUmVQMTJKS3o1M1grOXdwVm9JUndsdW9i?=
 =?utf-8?Q?X780RPU8C9pUV6ThWRYqTZW5o?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a8ab03-a3df-4770-49ce-08dc846c58dc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 08:00:06.4962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QxZmtKOuj5RpwJtPXylCegX0fwH1VmuRqGKWv/Wi8D63cQEoZveZNiiiE0OaxzFGb6KFmtkdq/gOyFFxphpSxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6308
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

On 2024/6/4 09:51, Lu Baolu wrote:
> Commit <909f4abd1097> ("iommu: Add new iommu op to create domains owned
> by userspace") added a dedicated iommu op to allocate a user domain.
> While IOMMUFD has already made use of this callback, other frameworks
> like vfio/type1 and vDPA still use the paging domain allocation interface.
> 
> Add a new interface named iommu_user_domain_alloc(), which indicates the
> allocation of a domain for device DMA managed by user space driver. All
> device passthrough frameworks could use this interface for their domain
> allocation.
> 
> Although it is expected that all iommu drivers could implement their own
> domain_alloc_user ops, most drivers haven't implemented it yet. Rollback
> to the paging domain allocation interface if the iommu driver hasn't
> implemented this op yet.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>   include/linux/iommu.h |  6 ++++++
>   drivers/iommu/iommu.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 48 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 7bc8dff7cf6d..6648b2415474 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -780,6 +780,7 @@ extern bool iommu_present(const struct bus_type *bus);
>   extern bool device_iommu_capable(struct device *dev, enum iommu_cap cap);
>   extern bool iommu_group_has_isolated_msi(struct iommu_group *group);
>   extern struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus);
> +struct iommu_domain *iommu_user_domain_alloc(struct device *dev, u32 flags);
>   extern void iommu_domain_free(struct iommu_domain *domain);
>   extern int iommu_attach_device(struct iommu_domain *domain,
>   			       struct device *dev);
> @@ -1086,6 +1087,11 @@ static inline struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus
>   	return NULL;
>   }
>   
> +static inline struct iommu_domain *iommu_user_domain_alloc(struct device *dev, u32 flags)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +
>   static inline void iommu_domain_free(struct iommu_domain *domain)
>   {
>   }
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 9df7cc75c1bc..f1416892ef8e 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -2032,6 +2032,48 @@ struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
>   }
>   EXPORT_SYMBOL_GPL(iommu_domain_alloc);
>   
> +/**
> + * iommu_user_domain_alloc() - Allocate a user domain
> + * @dev: device for which the domain is allocated
> + * @flags: iommufd_hwpt_alloc_flags defined in uapi/linux/iommufd.h
> + *
> + * Allocate a user domain which will be managed by a userspace driver. Return
> + * allocated domain if successful, or a ERR pointer for failure.

do you want to mention that this is for paging domain allocation?

> + */
> +struct iommu_domain *iommu_user_domain_alloc(struct device *dev, u32 flags)
> +{
> +	struct iommu_domain *domain;
> +	const struct iommu_ops *ops;
> +
> +	if (!dev_has_iommu(dev))
> +		return ERR_PTR(-ENODEV);
> +
> +	ops = dev_iommu_ops(dev);
> +	if (ops->domain_alloc_user) {
> +		domain = ops->domain_alloc_user(dev, flags, NULL, NULL);
> +		if (IS_ERR(domain))
> +			return domain;
> +
> +		domain->type = IOMMU_DOMAIN_UNMANAGED;
> +		domain->owner = ops;
> +		domain->pgsize_bitmap = ops->pgsize_bitmap;

this seems to break the iommufd selftest as the mock driver sets extra
bits in the domain->pgsize_bitmap in allocation. Override it may fail
something in the testing. you may need to check if domain->pgsize_bitmap
is set or use &=.

static struct iommu_domain *mock_domain_alloc_paging(struct device *dev)
{
	struct mock_dev *mdev = container_of(dev, struct mock_dev, dev);
	struct mock_iommu_domain *mock;

	mock = kzalloc(sizeof(*mock), GFP_KERNEL);
	if (!mock)
		return NULL;
	mock->domain.geometry.aperture_start = MOCK_APERTURE_START;
	mock->domain.geometry.aperture_end = MOCK_APERTURE_LAST;
	mock->domain.pgsize_bitmap = MOCK_IO_PAGE_SIZE;
	if (dev && mdev->flags & MOCK_FLAGS_DEVICE_HUGE_IOVA)
		mock->domain.pgsize_bitmap |= MOCK_HUGE_PAGE_SIZE;
	mock->domain.ops = mock_ops.default_domain_ops;
	mock->domain.type = IOMMU_DOMAIN_UNMANAGED;
	xa_init(&mock->pfns);
	return &mock->domain;
}

> +		domain->ops = ops->default_domain_ops;
> +
> +		return domain;
> +	}
> +
> +	/*
> +	 * The iommu driver doesn't support domain_alloc_user callback.
> +	 * Rollback to a UNMANAGED paging domain which doesn't support
> +	 * the allocation flags.
> +	 */
> +	if (flags)
> +		return ERR_PTR(-EOPNOTSUPP);
> +
> +	return __iommu_domain_alloc(ops, dev, IOMMU_DOMAIN_UNMANAGED);
> +}
> +EXPORT_SYMBOL_GPL(iommu_user_domain_alloc);
> +
>   void iommu_domain_free(struct iommu_domain *domain)
>   {
>   	if (domain->type == IOMMU_DOMAIN_SVA)

-- 
Regards,
Yi Liu
