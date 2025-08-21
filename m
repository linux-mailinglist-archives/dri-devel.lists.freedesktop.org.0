Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F786B3008B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 18:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8670E10E385;
	Thu, 21 Aug 2025 16:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QmLWQPpZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E649D10E2A4;
 Thu, 21 Aug 2025 16:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755795318; x=1787331318;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HUz3wySM6Lzge7J11oSHsyYFNRkQmPxONe7pu45hPq8=;
 b=QmLWQPpZIFXWAcPN+BnZdoao2Pvz1DYHbDUzmmPmNu3Cp2niaSOo7UQs
 0oQZnfv+m3pwfE1GEd2aMF5g4K+5/+lzW39HKPLwVFmp5m3hdQ8syi/Np
 oEIVOkyt8Iqyuon/Ovn8U6zoPXEiNnKDAUwQE0oTHNhgXXvOvn3EOc/k0
 1sAUHU9GSTgvm7fAR6znfKzFH87Zh9otHYwDAfxX5t6MyLIMtDHTD6TpY
 HBJO4cIGP0u2NM41L3RnTRbAeGWMGWUUs2Q5D79UhChsPfQYhaApSy06Q
 nDfXBH+lTRetHzt/G3YDf0LlsisI1Yam+L+JmhWM2lP3rExdoUVLJV4nc w==;
X-CSE-ConnectionGUID: mzf518VYTa+/dX3hAnWU1g==
X-CSE-MsgGUID: 38ij/PreR9yMhP66k5iIqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61739817"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="61739817"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:55:17 -0700
X-CSE-ConnectionGUID: K7F2v4IvTkiVN+SNqXsRdg==
X-CSE-MsgGUID: 9pihOalrRjmJN8LYg6fsEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="169276935"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:55:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 09:55:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 09:55:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 09:55:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLR5zFue7mu8f+auSpCg7kKA6tu0Bn7FFAyb1DIRJ1SJGi/PoJAFYc6nKFvgQxVjh+p4G/bMg/uMCW9RVHg48KeA9YOSfCodMiYhlCqAfCOK89o5S8Faw8dd3CugD8xfV1Yk/oZ8TxKUJ4/kSqtji6Avxgv4cw+e1oNjIBUn3xMsiNK5grnceHr1wJibBGLZr71du1/Lcsv9+zZ+jfp2F1XcHIhWFjkLTZ2IVT0PZhP9q/fGd9A1oXjGza+BNkL7nzXj/zdNwZjynYM9iYWwGip4xzq9BDNP2iQHkeYDuDNYHNFCDHgylRWzusYxZapB78OMtxPYMOZkV9Nb0nQwww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oiK4KuxyHxDHCd6fGU6QmLkd+klEW8tO891ikkFLgkU=;
 b=Oe6Tzo7b6fUm9N5nIT2xeYQJC3QlIczRvW5vrhQheTQQhZ5hmEqAhD5De4oMuLJxCcwDkNxQNxqnB9sqoIjFq/yi/uu2JeYHTga4pZzo5DLR847APCax43z8FQ+GHDzdaqMKFBN6r3+O5kuFvEUXttre4u8E0iZaKd5+8dy0TQO7OBvCTOGkCnrNe4NzmvfQT1MWBaC8/oTAU1PDEv9FGxU64IkI+W6cdmhpzeLU0EoR0Tyh0eMmholgcIJ0A6Ho+koDZI4E6CJfNc88ilY78jQj2vIfCJC9NiYcuKAGzTPhH/GZyViJF13kel5I1FwltjVNZO17HNrq66Ao53LzeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DM3PPF6C1A2BDF1.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f2b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 16:55:14 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%6]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 16:55:14 +0000
Message-ID: <0475e7d2-c8eb-4f69-b68b-2b0b86c62e9f@intel.com>
Date: Thu, 21 Aug 2025 22:25:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gpuvm: Rename 'map' to 'op' in drm_gpuvm_map_req
To: Danilo Krummrich <dakr@kernel.org>, Boris Brezillon
 <boris.brezillon@collabora.com>
CC: <intel-xe@lists.freedesktop.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Matt Coster <matt.coster@imgtec.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Matthew Brost <matthew.brost@intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20250820152335.2899501-1-himal.prasad.ghimiray@intel.com>
 <20250820180742.20623521@fedora> <20250821130146.471cd653@fedora>
 <20250821132535.0424d0b4@fedora> <DC84DX5YA27J.2UNA0LDKUMUB9@kernel.org>
 <20250821150124.30c387da@fedora> <DC858O8WDXVQ.2KJJTV9020XHJ@kernel.org>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <DC858O8WDXVQ.2KJJTV9020XHJ@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0053.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:270::7) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DM3PPF6C1A2BDF1:EE_
X-MS-Office365-Filtering-Correlation-Id: 38746d76-2cb1-4fdf-9644-08dde0d37f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVBYU2FrMHdVTTY4azFCR1hSQWYwM3ROTEdSTXN1dmpRc213emtyOU43RE82?=
 =?utf-8?B?aDRacHBxNG1GTmxVNVN3R2FlbHh6d2hBUnEvd20zcXBXbnl2VGkwMVc1d0VV?=
 =?utf-8?B?dHQ2YlZJcWFkNEV6Nko0V0FnMSt6U0gxQjNKT3dnaHJBSVowODlsNnRabXNh?=
 =?utf-8?B?bGZqMm15UmdkNnIxVjZ1cHZBbC9lN2tzNEZDSTM0YjBLbUN4T012SGJvbFVo?=
 =?utf-8?B?NkRsSkpaWkdFZm90cFhiRnkvcHhNc2w2aTIveGdxa25vUkhnRzVGZ24vbmRX?=
 =?utf-8?B?UGplWmZXODU1eGVUNFk3RWg5ZkhDVXJhc0ZnRTZmcktQTWxYdzJ2c0ZRdmJq?=
 =?utf-8?B?Nis5WFZIYldhMUROcE9aamlyQUcvZUd3Z1FlK0JrOFNzWU42NTVHR05hLzEr?=
 =?utf-8?B?QlJGMGZ6T3h5TnU1QVRBQzkxTUY1UUMvQjlCTUxKWjQzd09mVFowcko0UGdF?=
 =?utf-8?B?NmQvV0YwRGJLMXhWVEN2WWZ0ZFU2OFJnZHZaSTc2SXlUU3Fkd1VJQ2RwUzdi?=
 =?utf-8?B?THlENmgvalphUWxRUWpLblI3eHQ1YStxS2krS1RoZ2ZvemxCdGFxemx5WXdo?=
 =?utf-8?B?OVJ4ZkZVY2s5eGduZXlFREQyRXNUWitWOGNKajNkQ0gwUjUvcUtYamdiRlRO?=
 =?utf-8?B?dnNYc2IvYXpObXBSSm1FejhsZUxoQjE0V1Fuc0RxaG1FZlQ0UnBPUE96VnJq?=
 =?utf-8?B?b01WYnMxcDl1eU9wNlJFOXRwcnREY09Td1JtclcwV0l6TjlJMFpid2ovcENE?=
 =?utf-8?B?SnFEaDJBaWQ4T0hlemcrSm9LZUt0MDRjbVp2TUU3QWhJK2hpUG5SRHJWV1hk?=
 =?utf-8?B?Qk9kY3NNditMdy9hQjZNY2w3dmJWTjgxNy8xcWVRMFhCQ3pkendVSzAzQjBr?=
 =?utf-8?B?SHZMM0tTSUVycXNKQ1Y4YnRwSEJCU0pwT1JzOTlvNDJUVFRwVm5WMGw1ZXRj?=
 =?utf-8?B?dS9DSzBBMVdaRFY1WWwzUTRNWkJGM1ZzL0NOL2RHaDBIVUJFNlpNSUl1dnlH?=
 =?utf-8?B?bFFSVkJ4ZlZWcG1QRWcrVUphNHM4cGJOM1UxWHYzcEVEY09ZZHdQUVFpNmNr?=
 =?utf-8?B?cEYzRWExcW1NeFZYeEJockR6K0x1UEhHNGZiNmJ4Y29tQ0ZwMG1aTVltSXo3?=
 =?utf-8?B?OW1TcTdPYlVCaGhiNS9GRUhISmJ5RFRyOHNZQmE2RmpxUkpSVnR4UFBHMHdU?=
 =?utf-8?B?R1FRVEk3VFhiVSs1T0F1bk9LNzlRVFRRdG1GTnVJWkJmbmpBK3pwbWtudXZr?=
 =?utf-8?B?K3pjT3pLcnR0Q05jb1JuNDkwbGdkYmllTklDdVRBb2tWUjFiTXcwbE1NWklD?=
 =?utf-8?B?WTRTUkRuRWJBWk1WVjZJbEZoRXJhYVVZZlBZMld2NE9ZQXBycTlya2hndWlK?=
 =?utf-8?B?ZnM0RkZvMTZ2dzJPT3JJbHpuTXlCc005NnlUU1FOcmNSeXAzWFY2cEdmWlJL?=
 =?utf-8?B?bUFMeW9NWVJWUDVRSktEM1MxK2dYUDZVS0tLQlNuT2xKMko2M2RUY1FpZWFR?=
 =?utf-8?B?RXRhZHY2eU4wMFg3RzBRV1poL2o4Ti81dzcyS0NSWFQxRVorbFNRSk1xNlVn?=
 =?utf-8?B?bUVrVHd3QVQxa2xOcXNXOHJrUC9ORGxFbnlLekphS29vYTFULzVOMUtMZFJE?=
 =?utf-8?B?eFpLVnI4bEgvUmlIa3pmanhBRUJlUzZSN29Zb0VvWjNlNnFhSXFoYnJ4b2pn?=
 =?utf-8?B?SjNCenNnNFlZM3BVTmNFMXpkdENkSUppbU04cEdHTjhhM0JRbjR1OFFEelhW?=
 =?utf-8?B?cmdid2haQUNMQlUxMXZVY1grMys4VlNhNUtINkJtem9ZVGxhdkxoRTRYNDdV?=
 =?utf-8?B?U3E1bGRKNExxdjJPdWN1MjdSS21BTGpYZzBlZ2pRYURrQjlTSTVYZXErd2lD?=
 =?utf-8?B?elk2eU9vd3pKUXN2K25IRUR3dzUrVmNpZUhRT1V3elJyanNjNS9TR0Y4UDlq?=
 =?utf-8?Q?7skf9G5bOIs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHJsRjJMWjhBQk56QVUzODFLK3lJWXFwNU5VeXRaWm1GVVBCTVp0c01ncm8w?=
 =?utf-8?B?YSt4Y3E4NndQbHNWTWJ3S1JzY2dVaGYxV2VmNUVBSFFBeDhsWXdOZDJUMUtj?=
 =?utf-8?B?ZEZZaVdKc3d1NUdzZFg1OHZ3WlJzZHd4dU9ZRUFTL2tMcGlKUGZxVnJPZXB1?=
 =?utf-8?B?NkhVZWU3NnZhTHZKRG93MlBoWWxsLzRJUnREL0I4TnlBOEs0UWRKbUlUMEtJ?=
 =?utf-8?B?RG1pUXJ2eTNRUnNhbVBuRUZhVkNXKzFBL0doM3hYeU5HM1dmOFkyWG1TTCtn?=
 =?utf-8?B?cXc3OWVDUEtZNzd3OW9TalN5cDZheXhSRjlrbGd0aG5qaHEwUDlUM2RQUE0z?=
 =?utf-8?B?ZlJPN3BHd1VJWmNLaDVsVlRETTl4Q0tKUXlmbVF6NlZSMWJuNDhyMmxraEU4?=
 =?utf-8?B?VFJsaUErcEVWU3QxazVMTWVXcitrL1ZmOEZxUlhtTkE4dm1LVkN1M2NRT3Jj?=
 =?utf-8?B?WjdERXhQRU8zZnZ0RHMydlo2TTR3SFpoNUhuVG5MZTRUeWRvMy81RHdxenF4?=
 =?utf-8?B?VlpJbzdYNlBCZk5ObHRzOVFRN1FlbFkrWWcyalNpVHpGd3JiRVJSRFFLZFFB?=
 =?utf-8?B?SndsTCtPY2U4WmpCaGNiQ3FrN3FDbDRpczUyUXBoMkJXWmkwUDdvN2FreUxw?=
 =?utf-8?B?WWF3NElHaHdZQ2FQbTVrczVsSDhIK3VKVTZqZVM3bDhnV0hSUFRBWGVGNU5L?=
 =?utf-8?B?SjNoMkg0R2RadkhQdjk4WVdUQ1BncStQSFdUZWtmQUoyY2puSXBzMGd6WCtB?=
 =?utf-8?B?cDFqcForOGV3WG4wZUhDSEIyeHRwOU0wSmxUdGMwUUVJdzNtWU05WlY1cTJG?=
 =?utf-8?B?VWdQS1F1L3dxSzl0Vlpabms0QmppNlhsdGN0aDF1TEhjYUpMYm1RUW4zTUx0?=
 =?utf-8?B?eXRSMG1hR2xzRHVYRitnbHZCZ0cvVFhIeVh3SXZoRnRJYzRQOHI2WC9GRlY5?=
 =?utf-8?B?TFFxVTFhYXBTREVVSXBTV3JmVlk5NEpxT1RWNmdyWGJFdFA2OERnVWExZlNy?=
 =?utf-8?B?ZW9BV0pRNUpLUlEzenRBYS9rcENTclZTTjVKYkFKYmdUNDdDZUdTWlBFbStz?=
 =?utf-8?B?VHVJK0VubEdScmtFemNPUkVXN1N4UGxFVlBTVTd4ZGtLM1hQYXA1dENtelhO?=
 =?utf-8?B?RDROd3U3RGFhaEtKVThRaXM3TVhTNmNaMitWbmhScEpnRG4wNWc0RVAyckFN?=
 =?utf-8?B?MXJrNUVsUjZkcExIWXM1eFc4TUxlTzR5cnNMbmhNQXJIcDV3N3d2aG5GRTlX?=
 =?utf-8?B?TUtRQThMZXA5OE1sQTVJcmZYRlF5d2xhTFNQWFJ6dXloVlpNV0taK1BWZWZZ?=
 =?utf-8?B?S0pvNXJHZWQyYkptR2Fha0U2eVBNTmEvRzJSWHU2Q0JvYVlEeStFMG9rK2VR?=
 =?utf-8?B?K1FWQ29XaUlYZzFSMWZSL0FoNEdxZ0tCREhxdUZMY202RTAyampIbXNOWFdl?=
 =?utf-8?B?aFJjNCsxdlJMMXE2NVk0dGg3cCtYQUR6WG1NMHRla1FRbDVyaFUwMVlwNnBZ?=
 =?utf-8?B?QmluYWlzc0s3ZWdKbThUVkI2d1JDZXVpUmZ3RDNYZzBzb0xFZFdTclZjTUwy?=
 =?utf-8?B?WGlCWW9WbkR5L1Y2N29FOXNpS0s4TFhBOU9sSG9ISHdDVVRkdDUyYVVBSHph?=
 =?utf-8?B?NkdwYitsTlptN0laeW9pMjBFTEZPb09YNHE4cHJtL3lSZXFHUXc0MURIWmJR?=
 =?utf-8?B?R3BFWUJOdUZybUNuU1B6RmZPdlNrbExwMlRzV2xDazZOQS9UVW9iS0docmN6?=
 =?utf-8?B?dlREMi93ZVA3SGFxd1lXdDZ1UVFrSjFKV3lPWTgxZG4vTWdwSFdFM3NDNzB3?=
 =?utf-8?B?UjJQdml1QW9xK2lJazZIQVY0cFcxUkt4MUE3WnBCWGpQcGJ5bGpRT2FPMEVz?=
 =?utf-8?B?cGhGZzdEcHR0Y002c1d2b01DaU81TXpVZHlOUlJlQkJiTm50VmE3OHBrZ3Zl?=
 =?utf-8?B?azJ3N2NCRXB5Wk5lSnlDSDFqekNTaE5udmx1dHBRVHZKd1hrTGYrNHJPYmtY?=
 =?utf-8?B?elM0THVIT3orUEF1MlZDNGIvdG9WYi94M3lxb2lMWkZIYTFENFNFUlJmOGJ5?=
 =?utf-8?B?TEJTQ1FzRHFxTUVOLzAxTjJwK3BwaVNxNVV0NkNPdHhxZURvOHE2ZFdCc3Fh?=
 =?utf-8?B?MXhLWnVpRFFFTFNkQjAzWm1ua01DRUpCZWt2WUNMK0ovVFpYZWZrT291RTJ1?=
 =?utf-8?Q?oa8kdhr1LvDD9WREM6Gjftw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38746d76-2cb1-4fdf-9644-08dde0d37f95
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 16:55:14.4283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBXc3BMEqmaWTEZdeFKzxfnZrovRbWVS5Y7J69HNz+pdLnNohzfv13Ed4CkGtYfrZZ5MlEp5RLq5ydZFuZOnr0Z3t59DacaRfVDBvRN7qpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF6C1A2BDF1
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



On 21-08-2025 19:05, Danilo Krummrich wrote:
> On Thu Aug 21, 2025 at 3:01 PM CEST, Boris Brezillon wrote:
>> On Thu, 21 Aug 2025 14:55:06 +0200
>> "Danilo Krummrich" <dakr@kernel.org> wrote:
>>
>>> On Thu Aug 21, 2025 at 1:25 PM CEST, Boris Brezillon wrote:
>>>> On Thu, 21 Aug 2025 13:01:46 +0200
>>>> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>>>>> On a second thought, I'm now wondering why we need drm_gpuvm_map_req in
>>>>> the first place. It would kinda make sense if it was containing an
>>>>>
>>>>> 	bool madvise;
>>>>>
>>>>> field, so you don't have to pass it around, but even then, I'm
>>>>> wondering if we wouldn't be better off adding this field to
>>>>> drm_gpuva_op_map instead and passing an drm_gpuva_op_map object to
>>>>> the various map helpers (like Danilo suggested in his review of the
>>>>> REPEATED mode series Caterina sent).
>>>>
>>>> More on that: the very reason I introduced drm_gpuvm_map_req in the
>>>> first place is so we have a clear differentiation between an overall
>>>> map request and the sub-operations that are created to fulfill it.
>>>> Looks like this was not a concern for Danilo and he was happy with us
>>>> using _op_map for this.
>>>>
>>>> The other reason we might want to add drm_gpuvm_map_req is so that
>>>> information we only need while splitting a req don't pollute
>>>> drm_gpuva_op_map. Given I was going to pass the flags to the driver's
>>>> callback anyway (meaning it's needed at the op_map level), and given
>>>> you're passing madvise as a separate bool argument to various helpers
>>>> (_map_req just contains the op, not the madvise bool), I don't think
>>>> this aspect matters.
>>>
>>> Good catch! Indeed, when Himal picked up your struct drm_gpuvm_map_req patch,
>>> there were additional flags included in the structure. Now that it is
>>> essentially a transparent wrapper, I prefer to use struct drm_gpuva_op_map
>>> directly.
>>>
>>> However, given that you still have patches in flight that will add a flags field
>>> to struct drm_gpuvm_map_req I think it's probably fine to introduce it right
>>> away. Or did you drop this plan of adding those flags?
>>
>> I need the flags field in the op_map too (so I can propagate it to the
>> drm_gpuva object), so I'd rather go with an op_map object directly and
>> kill drm_gpuvm_map_req now.
> 
> In this case I agree, let's use struct drm_gpuva_op_map directly.

According to the kernel documentation for the drm_gpuva_op_map 
structure, it is intended to represent a single map operation generated 
as the output of ops_create or the GPU VA manager. Using it as a direct 
input to ops_create contradicts this definition.

For drm_gpuvm_sm_map_ops_create, the values align with those in 
drm_gpuvm_map_req. However, this is not the case for 
drm_gpuvm_madvise_ops_create.

If we plan to proceed with deprecating drm_gpuvm_map_req, we need to 
clarify the fundamental definition of drm_gpuva_op_map:
Should it represent a user-requested map, or an operation generated by 
the GPU VA manager?

