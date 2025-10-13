Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168C1BD2AC3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 12:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148CB10E427;
	Mon, 13 Oct 2025 10:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nWtbPYl+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E01B10E1E6;
 Mon, 13 Oct 2025 10:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760353011; x=1791889011;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IqsNB4PbPXvW2EdbBjf2m0ueotyYjEDI61pKz6zgWHU=;
 b=nWtbPYl+WVMaJnQt84htirPCKHLBOdtf0szr4nXzQnVmmQlm3lKIY8sK
 rKKms4f7Eye2tZnPfXfX4na3bzFKJeVEWXxMgcRqmTfvJd1StuFNexAVn
 zg4xwFaWS/YitdzXkUEoQuNmKShaVE3VPrhvHRRAit92wSCcPY8XIZwcS
 mxnSDx1XU/W90Jhh+CnqlTRIXj9AIzkj7joKCk52GJLcjkxtJpNJWtWAL
 DLVEWZB2vISYzEcHOSQ79/QnQOFOd/pIhI6qWu5sUNuAQ4wGv7NozZY2y
 Yi91yeRD8OzgJhP3/00G5WgTY7Cai6q6KNIiZCBnYTMJJaqB3wCQBDVBF A==;
X-CSE-ConnectionGUID: KNR4KdN3SX23DVOKm4RkOQ==
X-CSE-MsgGUID: 47o2S8wvQuSqmjImqRSrHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62376363"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="62376363"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 03:56:51 -0700
X-CSE-ConnectionGUID: 0cAJD7S/Sc6OiiAiPfs7LQ==
X-CSE-MsgGUID: 4z+JpJxDRAmQwYB9f7N0gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="185986098"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 03:56:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 03:56:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 03:56:49 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 03:56:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agge20wfb1Mf0GdskG7a3bADhepe12BG0IGnWZQWtdra4UKibRKvO0DaA2V6EvqF3si7atnZ3p2+CJiXYucUSPZcIq+flVbEux2TlJFEqtcMhIKp6zbh3nG8mSq4116LpbYZ6cq0Ex+PfIODPd3YXDvTA7/xoS68HYYHSnmhhKTlgOb2f+riFuI9cYmivmKMS7VIHbGAj2UpozbInaMX/BRxn/TuIO5/oCmLdDlU713oGEG6LR7CgjirU3F1A8YMb5NWLdFem5J35dlCZV+MccD7OwOYhCtTowfSHDJ4J7jJ+hlfa7msO6pLLCk2nLBfWI6KMW3RqwVdcN3f6Quc+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kLcbEfuQDJfHOOL/bbdX1+f3kG/6zPt8YPU+rbUk30=;
 b=Olz4SWpyFkE6uMU8MPC6OuzKTq9wii4QD9/i30dKlZYCXtrQ6Q9wDtcZAHIrqp3n1Bo+rrVEje5YUS/FMUdNntjfKyikzegcvS5cXFxh6KKX0nLn7Poxyl46TQfU5dCUxHOL4tcQlkF3j5opJKjop0arLBIcIpRBqSSctjenzFekwPj+/XgYm7GA20xmkLLB79tFMBBTkCYoPgXBLLzkmhkpXh2FK/nw62+lgGo25z6D4Z4OODNdg5jHdZDiHnjMWQ0L9pR8/GHnKBVgEBmtQCaH2trx7HwflLSF8tW/SdBpZsxbmq31OgjBhr5q1uyi353sJB/+SPFXXrbgrBLMHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA1PR11MB7822.namprd11.prod.outlook.com (2603:10b6:208:3f2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:56:42 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 10:56:42 +0000
Message-ID: <f6cc6c10-3260-40e8-848f-d12e535bdead@intel.com>
Date: Mon, 13 Oct 2025 12:56:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/26] drm/xe/pf: Add minimalistic migration descriptor
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
 <20251011193847.1836454-9-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251011193847.1836454-9-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0127.eurprd07.prod.outlook.com
 (2603:10a6:802:16::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA1PR11MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: 558bdf6c-bacb-4bc2-bad0-08de0a473164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkVqQ2FXeWhBWmkzMkdaMXk1R2g1WTN0Rm55cGlMOVc3bzg3cVNBVklYYkVn?=
 =?utf-8?B?WkcxcFdKM2x2Qi90RE84WmpUTVYvMDNPQXZMTjRna2IrR252NnBvZk9WWmor?=
 =?utf-8?B?OGU0WTVqTzlYM0pWaUIvcVNWanhaZjVaWHZhZTBqZUpMSkJTdmp0ZlJVZDFh?=
 =?utf-8?B?dEJBRjRiTEVEZGdGdjdkaDhac3ZiQTJDRThuMUdIQklmK29lSXVJejA3M09j?=
 =?utf-8?B?VERvdXh4bUJ5L2xraE9VMzF6SEZEaG42bk8zNnZhS3RUaGU2blVONk11TXlK?=
 =?utf-8?B?QjJiRjlCUUxvL2ZaVXRvU0NIRXY1MG10clQ1d3Nrc1NqMWlRbkRnT1Z6dkJm?=
 =?utf-8?B?QndzNkZyYjZqZ2xKbFRpS2UwbU1tL3A5ZTNZb1NZU3VHM241NXU2RHRweXhN?=
 =?utf-8?B?cSsyUkpCNWUybkpQWTFDNmZrZWIvQUhicEFaN2FOS0ZYYXBjRzd6a3BqM1dX?=
 =?utf-8?B?aFpKQU9oOG85dVk2Tk9TeS9PUkIvckRndXdrWnVqTHF3eVQ1T1JMVFhsajdJ?=
 =?utf-8?B?UTdyS3U0ZVRpeUZyVnozZjRzamtmQlJhQ0lOUElobWE1ZkdJbUxqdXBtNVk4?=
 =?utf-8?B?dnZnTWJGUUsrSUlpQWpyU0oyV1hyUlh6b1dqREhTM1V4OERFYVRNcnlyRHpt?=
 =?utf-8?B?RVRtTW0wWmpvRUpMNHBtNzB5TWxZVFFuYXlNVEZWUmo2TlF2Z1IvTk1vNXhJ?=
 =?utf-8?B?SURaWWxxam9JSkdiUjA3M3BBR1BEanNZRThMZ1BDRzF4a1MxdkFsUy9WTXZ1?=
 =?utf-8?B?MnFOU2MzNWFSWnBmb2g4cUN2VVQxc09Hb2RzcHBSM2RpNEh0RUYrQWpqazIz?=
 =?utf-8?B?L0tWSE54NGt4emxvWWZtRUxyV2hadExDYitHb1pZbk1ZWG5pUU90UXZYYnB3?=
 =?utf-8?B?WlVhdWtTWmg2cWZYVkxwMGRLSEtoMzNNWDQwaURubExDa0VMK0REYzlqZi9D?=
 =?utf-8?B?U2FEeTBraWpKbDQ2amE2ZVUwT2VKZkM0MjFqRzlkclJ6NFcyQjJVbmN6dkpM?=
 =?utf-8?B?dno0a0J4N2IyMkxWMi91cEpkWHlBOXBkc2VIYnZvT3ZMdzRpdWExYitmcTRV?=
 =?utf-8?B?QmRVOGR6MldwRG15Z2ZDUUl1eWFiWENXMnlJY2RwMm9Ca2FRS0tXbXl6eFNz?=
 =?utf-8?B?TWd5SzkrUFBRSDl0TlRQUGpyRFltRjBuUzNxQmZoaDAzTHppTDRXMFpScWlK?=
 =?utf-8?B?WXlHWDMvcEJJVkhmbEdEd0pEanIrS1VqeStQbXhNRVhpQTMyZ1h5MjlxS2lE?=
 =?utf-8?B?bWhQMm5OQkVuRzFTREVHck85eE1UY0NxcUFqTUMzZDZhS2lERWZaMU94cVpx?=
 =?utf-8?B?UUl4S2RkN3dsTFcrUFp1dkRoaGJhK0R1MWJWY1RPNFN4STFCaGRKVnJxWGd0?=
 =?utf-8?B?REFEWnpRZndxQnJnd25vTEhOTkE4ZGIrNlVkYitYdWkvZEl0TGZWL2YwSmZS?=
 =?utf-8?B?Y0s4ZmZHeHBRdDZ1VlBMbU12dzlhOUNqOHMxL1dDelpOZGlqUDF6QWZSdlc2?=
 =?utf-8?B?MlMyVUhPZnRPY0ZZVy85a0lWLytRYy9FR01neGg5SW44MGtpL2k4WitxODVj?=
 =?utf-8?B?cGhkY3JaZXdHY1U5QVp2S2NJWFVHVTJHVlJ6TGFoY1N5NDVDdGpuR3U0c3hp?=
 =?utf-8?B?ZExBUUNYQTlEa0Y0ZlZ5ZkZpM2FObVZpU2lROGdabEdHMDd0cHhyMEFGaE02?=
 =?utf-8?B?Q2d6dndQSWtZbHBiQzl6dndDZWFKR2F1Z3FrblpyL3lKL0l4M3AzZUplOUlr?=
 =?utf-8?B?TTJUUnYrdlB6S3prVFU4SHNPQ1lXV1ZzZ3o2OUFKZzYyeU1INGM5RU9MMngy?=
 =?utf-8?B?UFFOdzBkbDNxazNEY25aMUF2eVBmbmdXNXB3NjRTUzd2QVRtRmluMEhjR04w?=
 =?utf-8?B?eG1hejk0QktGM01ncWcvU2lxOEpnVW1pV21BUnlGc0FKcTNpaG9NU1ZXM3VO?=
 =?utf-8?B?N1ZmcnBnOVlXS2c2aFdRSXY3NWR1aFJ4ZnZOMm54Wi9Cb1RsRXpTQTFaOUYr?=
 =?utf-8?Q?Ez2hcMhYNgMs6BX96A/+1y3sBumhXY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjJsOHF6WHR5dkRQdEYvWmk1OE9hcUNvSEF1eS9PaXBNVWJRY0FhTWdyVjZZ?=
 =?utf-8?B?THRQWnJqdWdQUGlodjhSZGUvMDlFVEkwby80eHJtM3hha2JqZE9DNGU5WFN1?=
 =?utf-8?B?T3VJUTJMNWpaRHVkL2wyeHQ2M3BCTVRFcEoxbWRpQTU4cEVMRGhRb0pHcm1Z?=
 =?utf-8?B?dDREZkd4VzNzRDhibTY5enNjRk9FRlhEVWVEbTJaRXRJRFJKaTdMSVplVmFj?=
 =?utf-8?B?Rk9LcnNhdVVmV0ZneDlLa2F3VXBTRWNLRlducXl1TVdoS3hPTUt5bm5vY2lJ?=
 =?utf-8?B?RlRJL01PQUw1U2FDazh4R2JEdnpua3JsUUozdUViY2plaVRuWkhCaVdzMFNH?=
 =?utf-8?B?WWhyak1yNzVDcnhoakRvNWtLWmhFNVFVbDFnZm55K28wVG96cXBicmljWm1Y?=
 =?utf-8?B?TUxsdk45bC90U2s0SmVBTGRZR0ZubkE1YUoveU1CVnI4cUxsYlBGL1lhYW56?=
 =?utf-8?B?OURvdjBIMXZZMmlLNmFvR1dadmtVL1plZEpIdVVrMUpRWE02c25KWnNtTGZj?=
 =?utf-8?B?QTlJQmU5ZmswTmd5RE1tV2kzdFR6eVdqMndHbHhaWnpHODVydThDRHN1MWhH?=
 =?utf-8?B?K1BibmxNRURhQkVURjFaaS84K21GNHNuKy9qTlNyWWlRT3AvOU05RllQUmJw?=
 =?utf-8?B?bS9qWGFnN0N2NERERXI4djA0SFIzS1pLUmM1RWlOU3FDT09MREdZSmgxdmNU?=
 =?utf-8?B?WnRwRUNBTXlsOWVScjVhcVlmN2Nxd2F1eUxoQmNpVUs5Qkw0cmpqTDZlZWlw?=
 =?utf-8?B?cHJ4NWFMaHBuZmszRWpERFNucDJBb2NtWmxueTdjV21abXdicUFwTzFPSTlS?=
 =?utf-8?B?TytuN1NvYkZZUElacUNRZ1BxZEZXajlvT24vajhCQ2g2eVR1eitwQ2E5clUr?=
 =?utf-8?B?UkIzUlVEN2xMT3FUdHNBaUowWUtKYTN0UEVPblpGdDFJWXZ4SmxoNytzSUVY?=
 =?utf-8?B?Sk4xRWIyRmFLUm1HZDNqd0l0aVV3aFZOdTZZRkQ4VkFhcXFJbmdCZjV2dU05?=
 =?utf-8?B?TVZUVzZrRTRTYUtQRy9BMlF3bDhaeUJjZytxcnAva3dtaUwrd3FaSEhCN2JU?=
 =?utf-8?B?eW9qc3ZBWE9NVFovYVhpMGR4cXFQenloOWpMWGY5MFFUOUxoTE1zbnpqWFZj?=
 =?utf-8?B?blYwM0tyYW5TaU5xQ29IblBJWUtFMkQ2UG9VM1FBb1E1b1A3U1pHeitBQ04w?=
 =?utf-8?B?ZjBwMk8zemZKYTNOTFNkeWlmR3NQU3N4LzFOUExmNDlCUk9QdytHUFg0eWNv?=
 =?utf-8?B?eTI5SnlvOER5cTFPMkI2U3JqMFI0dVd6NEpNeU1zcjJBbmRpcGNlWWgyNGNZ?=
 =?utf-8?B?Y09wNnN3WFk3MkJOeXBJWjRQZUF5L2pMQzN5V3NYY2lJZzBuaDNnb2o5R2Ru?=
 =?utf-8?B?L2l6eXFSenlRb0RYaW9qS2tEeURXRkZNcVlJd0JUbzhmbmVnRDBJZU9SNzZm?=
 =?utf-8?B?a3pGUzlOWWYzYlZFN25lQWRzaGhCTS81Q2N3Z25hQUc1Y0poRnZEaUlVRGZP?=
 =?utf-8?B?Qy9aRjBNOXUvS21adHVRdWFwQ0hsTjNxY3VGaCsybmRiR0NJN1lBZzVQMEcy?=
 =?utf-8?B?T3VNYTZKSGV1TTNRdy9ibFMxTnBYMmZNMXhJRHhwaUdISTk2a1BCMUdFek11?=
 =?utf-8?B?TVlCbnlnV3ZlOW9PZ2lCdWZzd1lNTllrckl6amtZczNid1poczVTbCswcW5I?=
 =?utf-8?B?OWZoenRUeGp2RWpzcitlTDBwbk9EL3NwVFdwU2NSNHB0NnlON0Jyc0dwV2Jr?=
 =?utf-8?B?T0l4NlY5ZTVqM25IZ21aeGFUa3BqT2JiSGwyL3lkSkJuMHhqVDB4cjlON20z?=
 =?utf-8?B?VDR4aE5vWm9qNjBQZFV5WHNweEtPV0VJWE9PSnM2MUhtN016U1VpNHZ0VGZD?=
 =?utf-8?B?OTRacHRtQ0l4c1RKT2haQzk1bmJIMWVkZUh2SzdGNFBxWFp3WkFVQnZDOU9D?=
 =?utf-8?B?cWNqaE1xdENxRU1ZVlBGNnp2UXNqM1ZGRkViam5sMGdtdklUU2xnR3F1WmpE?=
 =?utf-8?B?YWo0TDd5V0NRQVFoOWM0SWRMamxaYjExeG5OQW41aXR0UWNHMXM0U2hlYzRB?=
 =?utf-8?B?WllCMWN3bWROZzJRd3VmZnBlQ0dMbjRmUlBGT2NzU0FnRk44OXBUa3IvbG9y?=
 =?utf-8?B?ZDBuSW1VQ2I3d3RQOHhHMWREOXpnVjQ4Yy9pVVRaOFpwenhlbDY1MHF3dW1Z?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 558bdf6c-bacb-4bc2-bad0-08de0a473164
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:56:42.2407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6O4YC1KjlcL1vxUNAcqLlq3JCJecOPCw339XMCrKHao3FglEEfEybBKP5y1GY3l2U7DRLxZ5ahhnZ2O/Y5f0qqJDDRN0qeydp/i/1yUhrKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7822
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
> The descriptor reuses the KLV format used by GuC and contains metadata
> that can be used to quickly fail migration when source is incompatible
> with destination.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |  6 +-
>  .../gpu/drm/xe/xe_sriov_pf_migration_data.c   | 82 ++++++++++++++++++-
>  .../gpu/drm/xe/xe_sriov_pf_migration_data.h   |  2 +
>  3 files changed, 87 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> index 9cc178126cbdc..a0cfac456ba0b 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -186,10 +186,14 @@ xe_sriov_pf_migration_consume(struct xe_device *xe, unsigned int vfid)
>  static int pf_handle_descriptor(struct xe_device *xe, unsigned int vfid,
>  				struct xe_sriov_pf_migration_data *data)
>  {
> +	int ret;
> +
>  	if (data->tile != 0 || data->gt != 0)
>  		return -EINVAL;
>  
> -	xe_sriov_pf_migration_data_free(data);
> +	ret = xe_sriov_pf_migration_data_process_desc(xe, vfid, data);
> +	if (ret)
> +		return ret;
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> index 9a2777dcf9a6b..307b16b027a5e 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_guc_klv_helpers.h"
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_pf_migration.h"
>  #include "xe_sriov_pf_migration_data.h"
> @@ -404,11 +405,17 @@ ssize_t xe_sriov_pf_migration_data_write(struct xe_device *xe, unsigned int vfid
>  	return produced;
>  }
>  
> -#define MIGRATION_DESC_SIZE 4
> +#define MIGRATION_KLV_DEVICE_DEVID_KEY	0xf001u
> +#define MIGRATION_KLV_DEVICE_DEVID_LEN	1u
> +#define MIGRATION_KLV_DEVICE_REVID_KEY	0xf002u
> +#define MIGRATION_KLV_DEVICE_REVID_LEN	1u

as we aim to have unique KLVs across GuC ABI, maybe we should ask GuC team to reserve some KLVs range (0xf000-0xffff) for our (driver) use ?

> +
> +#define MIGRATION_DESC_DWORDS 4

maybe:
	(GUC_KLV_LEN_MIN + MIGRATION_KLV_DEVICE_DEVID_LEN +
	 GUC_KLV_LEN_MIN + MIGRATION_KLV_DEVICE_REVID_LEN)

>  static size_t pf_desc_init(struct xe_device *xe, unsigned int vfid)
>  {
>  	struct xe_sriov_pf_migration_data **desc = pf_pick_descriptor(xe, vfid);
>  	struct xe_sriov_pf_migration_data *data;
> +	u32 *klvs;
>  	int ret;
>  
>  	data = xe_sriov_pf_migration_data_alloc(xe);
> @@ -416,17 +423,88 @@ static size_t pf_desc_init(struct xe_device *xe, unsigned int vfid)
>  		return -ENOMEM;
>  
>  	ret = xe_sriov_pf_migration_data_init(data, 0, 0, XE_SRIOV_MIG_DATA_DESCRIPTOR,
> -					      0, MIGRATION_DESC_SIZE);
> +					      0, MIGRATION_DESC_DWORDS * sizeof(u32));
>  	if (ret) {
>  		xe_sriov_pf_migration_data_free(data);
>  		return ret;
>  	}
>  
> +	klvs = data->vaddr;
> +	*klvs++ = PREP_GUC_KLV_CONST(MIGRATION_KLV_DEVICE_DEVID_KEY,
> +				     MIGRATION_KLV_DEVICE_DEVID_LEN);
> +	*klvs++ = xe->info.devid;
> +	*klvs++ = PREP_GUC_KLV_CONST(MIGRATION_KLV_DEVICE_REVID_KEY,
> +				     MIGRATION_KLV_DEVICE_REVID_LEN);
> +	*klvs++ = xe->info.revid;
> +
>  	*desc = data;
>  
>  	return 0;
>  }
>  
> +/**
> + * xe_sriov_pf_migration_data_process_desc() - Process migration data descriptor.
> + * @gt: the &struct xe_device

@xe

> + * @vfid: the VF identifier
> + * @data: the &struct xe_sriov_pf_migration_data containing the descriptor
> + *
> + * The descriptor uses the same KLV format as GuC, and contains metadata used for
> + * checking migration data compatibility.
> + *
> + * Return: 0 on success, -errno on failure
> + */
> +int xe_sriov_pf_migration_data_process_desc(struct xe_device *xe, unsigned int vfid,
> +					    struct xe_sriov_pf_migration_data *data)
> +{
> +	u32 num_dwords = data->size / sizeof(u32);
> +	u32 *klvs = data->vaddr;
> +
> +	xe_assert(xe, data->type == XE_SRIOV_MIG_DATA_DESCRIPTOR);
> +	if (data->size % sizeof(u32) != 0)
> +		return -EINVAL;
> +	if (data->size != num_dwords * sizeof(u32))
> +		return -EINVAL;

isn't that redundant ?

> +
> +	while (num_dwords >= GUC_KLV_LEN_MIN) {
> +		u32 key = FIELD_GET(GUC_KLV_0_KEY, klvs[0]);
> +		u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
> +
> +		klvs += GUC_KLV_LEN_MIN;
> +		num_dwords -= GUC_KLV_LEN_MIN;
> +
> +		switch (key) {
> +		case MIGRATION_KLV_DEVICE_DEVID_KEY:
> +			if (*klvs != xe->info.devid) {
> +				xe_sriov_info(xe,

maybe it should be more that info() ?

> +					      "Aborting migration, devid mismatch %#04x!=%#04x\n",
> +					      *klvs, xe->info.devid);
> +				return -ENODEV;
> +			}
> +			break;
> +		case MIGRATION_KLV_DEVICE_REVID_KEY:
> +			if (*klvs != xe->info.revid) {
> +				xe_sriov_info(xe,
> +					      "Aborting migration, revid mismatch %#04x!=%#04x\n",
> +					      *klvs, xe->info.revid);
> +				return -ENODEV;
> +			}
> +			break;
> +		default:
> +			xe_sriov_dbg(xe,
> +				     "Unknown migration descriptor key %#06x - skipping\n", key);
> +			break;
> +		}
> +
> +		if (len > num_dwords)
> +			return -EINVAL;
> +
> +		klvs += len;
> +		num_dwords -= len;
> +	}
> +
> +	return 0;
> +}
> +
>  static void pf_pending_init(struct xe_device *xe, unsigned int vfid)
>  {
>  	struct xe_sriov_pf_migration_data **data = pf_pick_pending(xe, vfid);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> index 5b96c7f224002..7cfd61005c00f 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_data.h
> @@ -32,6 +32,8 @@ ssize_t xe_sriov_pf_migration_data_read(struct xe_device *xe, unsigned int vfid,
>  					char __user *buf, size_t len);
>  ssize_t xe_sriov_pf_migration_data_write(struct xe_device *xe, unsigned int vfid,
>  					 const char __user *buf, size_t len);
> +int xe_sriov_pf_migration_data_process_desc(struct xe_device *xe, unsigned int vfid,
> +					    struct xe_sriov_pf_migration_data *data);
>  int xe_sriov_pf_migration_data_save_init(struct xe_device *xe, unsigned int vfid);
>  
>  #endif

