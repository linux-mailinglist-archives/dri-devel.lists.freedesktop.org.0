Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B2EB0129D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 07:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D285110E9AA;
	Fri, 11 Jul 2025 05:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gksxmGMY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C94310E9A8;
 Fri, 11 Jul 2025 05:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752211087; x=1783747087;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ErlGq566JvNs7fUPAUhdgKkruCvKczuRzHhQ8xk1zok=;
 b=gksxmGMYJLRlu1CGM2C57hIzsw4LsiTDQZ7Jts8MTplS6PhX/Qqsx4xR
 ma7ZHhWmw7Nr8J1ecCQ5EIM7rCAuaoWB1SgW2s4WhwU1j4QBxDQG5DD5/
 cZICrc56cBBWOQa5XuYM4T3bdrAPs0e71AjWd0vLzQJnHy7pwHuSXry2r
 yVaM7/DjYDT+8Q4IvsfYNVppprC+kKvbHpZTiLJD7AeDzxOu8WkOiarNx
 95YsC5E+MKcxTTY1rABFvKATAjFAI7QH83cjEoeeV6LS5NAiDcItzSBdb
 FehX2yMc9XndXMqeuBZ7yPAgR/ieVrMiNVMD7m2btzL5dCVlq3XMo3wyP g==;
X-CSE-ConnectionGUID: GNFkzLG3T4q53vIhMCd58g==
X-CSE-MsgGUID: 8sfIIyFdRHeNsM4LLV5bog==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="77049610"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="77049610"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 22:18:07 -0700
X-CSE-ConnectionGUID: 20l3txF1QPu2gYuGy829bw==
X-CSE-MsgGUID: cjnkB0upTvWqm5VH9Mi9bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="160296879"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 22:18:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 22:18:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 22:18:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.74)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 22:18:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Some74fcKj7yQWCLyRxSVFXaPrCOc2Dnb07a8XNz09RqR7bW6ybcaUAj0j6QHkv4klm8VgX2jtpBMma+zrLJ9CW4KBZd+hjaUynG8TJaWdq0qABP8bALvu6uoC3ZIyuzmS8CjQmF7jmTAXbKPLrvRat8/AP7Ndu24EIDywNJtAlXA9OZxyTuXGVA9QqrofaPMNrC7eLXXM4wWvKadg5izTleOTwFBG1DeCgN109obtGbjcsiAd46+IbBNjnjysXOoMCCIkVhU76A0XNmN52J+EeUGWOBMQFCRRn3fJLtXOB7d/IBuG9GTa4jczx2uGulQKn1tSTR1x1f6QE9DpKSMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFfh/5voSfmCDR8LvEW4i81fAHeWbJNdqV4+4IsFXvA=;
 b=fBrDMzedtM5fZQjd8WolntGdYWinN7LWH6/q6IfEl46u+laFjxjWWdTO8fD5cAcT8MNRnq7bioHMl2Xf1xcMzXn+0iYtLhm/WcRuqu6ucl0k5/ok2iUJwF5IicZqU9jeF9WIC3b6xcDvbaqhz3jbPSF+P3An8phcz0IfhD6LwSscwdR+CQCZm0+W2rkRPtnr6kow3Es0zf6ND4tQJwj8f3QyG0raWEd0ZoiPiEm3BKCXj4a5f6bR5K01sLLCgcnnlDNY3NHol3AxLsyPbzBoYiFivR7HlVV1SeZzMj0w9KdMzTgtHzQcQpL8Lkp9fiskg8KhtIDAj/hW2wCLSjjQtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ5PPF183C9380E.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::815)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Fri, 11 Jul
 2025 05:17:48 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 05:17:48 +0000
Message-ID: <75802ca6-42f9-48e6-bd15-72d2d38f5234@intel.com>
Date: Fri, 11 Jul 2025 10:47:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] drm: Add a vendor-specific recovery method to
 device wedged uevent
To: Raag Jadav <raag.jadav@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, David Airlie
 <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-2-riana.tauro@intel.com>
 <aG5xglf8BeGzleWM@phenom.ffwll.local>
 <d42e17ef-30ce-4bf1-9948-7f08fd6f3bac@amd.com>
 <aG56Trd1h5WbWYJt@black.fi.intel.com> <aG6eNcygPshsSlC8@intel.com>
 <aG-BcFN6M9BtjB2j@phenom.ffwll.local>
 <cd206f9e-be53-4b22-a166-ed18fa9b833a@amd.com>
 <aG-U9JTXDah_tu1U@black.fi.intel.com> <aHANtkxkhI4_Nb6R@intel.com>
 <aHA0qzCZH-gWCfOD@black.fi.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aHA0qzCZH-gWCfOD@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ5PPF183C9380E:EE_
X-MS-Office365-Filtering-Correlation-Id: 42423003-23a9-4c16-eb2d-08ddc03a4653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2FKa2VxTGJxSmc4YUNmMkdXQVpmelpESnJXZU5odXF3dGFoZDQyWEJQRzRH?=
 =?utf-8?B?OWFaR0p5ZzQwMkJYWVBUY2lTQUhBdTNiMS8wclhOa1lBMTFKWFhWRHliVGJP?=
 =?utf-8?B?SDY4ekIwMWd3ck5TWG1uWW43ZW5sS0Yra2ZlM1Z0dTZ3Qldrc3MrMWFCd1NQ?=
 =?utf-8?B?M1FCWHZwRFhVMDkxL1pJdXo5LytmdGpEU3liZGk1STR2a3doYzJXTXl1TG44?=
 =?utf-8?B?U0I1ZE9KVjB0SUlUUEVOTzhVMlhlUjdCN1o5eksvRFRaTWc5TmpmdzNOL01o?=
 =?utf-8?B?UEZJc3NOUGVHYk83d1pnSjd0QUZhSUhzclMzd1J2RUlpZEZDNTZLY080Q0o1?=
 =?utf-8?B?WUx3VlhGV2NrcEo5M2Z2K2krd3hZOUNaRWtqQ1NrRmplT2tlc0ViTTlDa09r?=
 =?utf-8?B?bUNtNTUrZUN6aXB4ZTZtdW9WU2xJS21JL2Y5SGVaczBhcklkbytVUDRCSzhs?=
 =?utf-8?B?MzJSRVc0N0lOdXlqOFJCSWxhWWFtTUpZcnJaeG05ZUdISWtyZGpRMHhiNEFX?=
 =?utf-8?B?NG1iWGVpTTk2ajNJNS9TdEJ1QkxNSExEdlZ0eVRJZ2lkMGpCUWF5Q3NZYzZw?=
 =?utf-8?B?NnhkM0xyaDNvMHBMWjR4NzZ4WkFUSmtmNUV2VHp4WkRHcUNtQ2l4L1NyU2tG?=
 =?utf-8?B?MGJRZHBuNU11dXNpSk1JMXBwMDlOSm9ybVhaN0R0cnNsUkRuVFd2cTR0bDB6?=
 =?utf-8?B?OXZCSU0xVU1WVmNVaVY1TGZFRE9ZTVhQd2VUbzcxT2JiRnkyZ3phbmo2MW1z?=
 =?utf-8?B?MnliVEN0eWFPTStNQ0ZLelB2TlRKQ0RJU1BmUGhaTUxIcTQvdW1QajdUNzBQ?=
 =?utf-8?B?NkNtMlZDaHg3U3lvV081L3J3NkllR1pKdEcvdGs5dGxhU0hOS0d3SHV3SHNp?=
 =?utf-8?B?OHpvK3ZVTW5lTkprVWp1eGZET1Npc0lyNURlTmlxQjU4ZVNoWk8raWNCUnpR?=
 =?utf-8?B?Y2NvSVM0UllVbmpnTmQwclVyQVJyTUcwL3RscFVxYlZ3eE8vZ3BQY0JmZFp6?=
 =?utf-8?B?ZEtWY2NkRnUrYWtzUmxsbUEyWGQwMXU2emRmaVA2NWxwa3BCNDlqRzhSTkRU?=
 =?utf-8?B?YkxhWDB2aVEzeTVWUVRINEs3QWVxc1NyVHAyZnNmWjJSSE5JbmR4cFhTcmUz?=
 =?utf-8?B?U2JlMkhJK25WbzdkMnNqT253YXl3M3c3WHdCZEk1Q0RkV1lOSW53QUsvUUU5?=
 =?utf-8?B?OWw5TWlXZkh0NzdXTXI0eEFKUk9Jai8xM1drNGJDTnptMm5TazZBUCsxS1RS?=
 =?utf-8?B?U1BodWRYb2NoaTJoWklWQTQ5a0JUY0lSdzhMU0JEMEVXWTQzdXQxVWdIZTMr?=
 =?utf-8?B?TkV3NDg1RGVqcWRCUmpHTFh3dmI5OFhVTHE5VCswaE95OWtZS1ArRUFwOWxJ?=
 =?utf-8?B?ZFNOVGtZVloxaTZZOERZSG4vcVRhaGFLR1o2R00rMk02MnJOZWJCOWVMNHlC?=
 =?utf-8?B?QUlXYVk1L1BtMHF1SEtvZjA2L2NMT3FpQ2g2MmJlVlkwQzBIeXBSMEx5K2RF?=
 =?utf-8?B?SEdaQjhUWm00cVh2aGJiQWdkbkdDdUREWmErZ2Vjb3M1OFJaU0ZXVzZJdFJZ?=
 =?utf-8?B?Yk4yVmtweVN3WUxnQTJ5QXZSN250VHV4Nlg2VTF0elZzTkhjaTAzWFhmakd1?=
 =?utf-8?B?Qmt0U0VwQTNoYmNseVZsc0NrekVOeVJpcTkvOE9uc3lOUEFwaG1xbUlZVm9J?=
 =?utf-8?B?NHBIUS9PRkNNdURIQk5HSjRkT2dlQ1hiSFpwbzZxZjhMbWk3OU1TWlBROHIw?=
 =?utf-8?B?U05XMmZ2cWl0dkRZOG16b3NQZkxjQVZuRyszYjhXS0dmZUdDcDNXem9Sc2xP?=
 =?utf-8?B?dXhEQUwwdHFRZG5nMmd1YWQwRFhyRlN1M0JXY213VS9rZGhaWWw0VW1lQVk3?=
 =?utf-8?B?ekRJcC9SYlZxUTYvSnloME5zektZbGpvcWZLUkhsWUVIS0VFei9IOXZweUdX?=
 =?utf-8?Q?vDN06J+I6UU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wmt1MWp6d1dILzVsWVI0TnVlalZuYVc1R2hiZ0xadGZ5NGVnZCttRlJvZlRT?=
 =?utf-8?B?Q3JWZ3M1eU9yVGFCU0ljRHI0VnBCRlVPR081MnN5WEZUaWpJSThBd0FXMk9V?=
 =?utf-8?B?cVUwWTh6b04wa2lIdlpBRDFiVWNrKzlsdjdldFdlemYwNEVqNVBNKyt0NVJB?=
 =?utf-8?B?SDNsQVpNYXlydTgrV3NWZG51NE9kVXlnRkkrenpCVkJVNVcvS2FNblQ4ZW9V?=
 =?utf-8?B?QTJuREdkc0VEanZjTVlzYzlkOVRrd2dETDlsN3hSWldJQ0FEK2FFWjNkbkVp?=
 =?utf-8?B?SjZTS2tDdFZ5YjVmNmFZL2NXb250RmZvWnNIbFZ1S29ZQitMMllPUDhaQ3N3?=
 =?utf-8?B?bjQ1VjhhVi9Sd2hmUUg2dEx0Q0FLTHhYZTlFSVo4dXFseldhdWtGRnd1a0ls?=
 =?utf-8?B?bStFN01YbklqMW1JcHRsZEE2WVJLclRldEo1WFV4NWM1dUQ2VFFGUFNUZUMy?=
 =?utf-8?B?aVJiWjJ6Z3VmQ0dDM2VnTE9hWDVQQm1nMjlWS1VrT05oc1Q4WG9zVE90Z1lj?=
 =?utf-8?B?QUhWUERwUktzQ1ppSGNrTkdNZTZ1dkVTZEpHVTdmMjlkcHQyMGd5enljelFz?=
 =?utf-8?B?ZG4ycm9MWlpWQ1k0ZU5mczV5VENnOExVM1Q5ZWVYMFpZeXgxcjZpSmJUUFhE?=
 =?utf-8?B?NEhlMm96dDAvWVhrdjJCWWJmSkRNem45bjIrQkt3VG92Q21XbkcxZTBsMW9x?=
 =?utf-8?B?bTZTaU5zMllBQ1NaVHVJMHlOempBczQxVjAwNGpPRWRHK2FtOHp5M0pmaGNk?=
 =?utf-8?B?YWU2bXRaTXhGNWsxcUhEeWo2eHpEaXNCKy9EbFIwQ0E3eFU3QjVuUlRCeGJu?=
 =?utf-8?B?NHlGeUhoODkzeGJFUU1KcjkyN2ZyYmo3dU9FY21tTVJFSHlCMm41RVdmbGU5?=
 =?utf-8?B?L2dPYWpWNXlyWk40WjJqRjBvckpKakNHN1UzWmtRbjlmblJwc2Rlem0vQWpu?=
 =?utf-8?B?TDR4K1Ntb2lFWm42dDI2dHBrc0MycHlaQmhYK1FGaEFLN1RET0xmZnhRb2U4?=
 =?utf-8?B?K25IbjdHL2hSY1Jabi9UN1phRjFqamVCUVlGVno0cWE0Um1tYnpVOEwzYktB?=
 =?utf-8?B?YjkzZkg4OWhTQWY5RWRmNXZ3SUdTRStuSE1iMWVzQWE2c0ZaQTVZMVNpNXpp?=
 =?utf-8?B?VjBNVkcvbVFxSmgwNnpnenRYdHlZQktETVkxbmVwNW52b21RN3ZsSlBXNEha?=
 =?utf-8?B?Z3JqSWJhMDc0STgwWjBOUllqMlNSdlJlNzlzcEVVenl1em9aZk1sdUo5SlJK?=
 =?utf-8?B?QzBGNWZhM3pTeU8rVVRHMnpmNjU0N21RNENWdndoK3pqd1d3a2pCZXluZGRt?=
 =?utf-8?B?S1R3WDc5U2M2QzhLeVljeHp6TkxqK0hNUHJtRk1BUWw5S2FqVlNEVGp5RW1S?=
 =?utf-8?B?SXpYdnMxNklRQmJNckFIcTQ5Q2F2M0hXZ0xPUkZrTFBCbTU5TkxYQ2Q2MXBm?=
 =?utf-8?B?MU9rSHZWVS80L0pqOURiYVZyb3B1WGY4SERpMG9MbkpyZjBFUjkwVHU3NElS?=
 =?utf-8?B?aE5xMFd5VjRGcHlReFdza0pqVXJJaGxtdGlFVzI2RDFiZmgxU1cwQUpVZXd1?=
 =?utf-8?B?WktnZTFyUnBtOGs4UTJxVFgvVHdNa0pONDRXbFM0dVBXUTRnVXF5ZElWTytm?=
 =?utf-8?B?WTY0WlV1V1FnTVc5eVl3bXZUanplUnZWbmdWdlFqS2FMWVBaZEpCdWxJVlls?=
 =?utf-8?B?TzR0WEV1Q2hmQUg5aVowZGJqbUkybTNVcW9aaTJxeDVuTDFIdTI3Ylk3bnBk?=
 =?utf-8?B?WE01L25pcDVKRlFsQ0xQNE5hb29jN2dBd0FlMWpSSmx0emJ0czF3L1pIbGtG?=
 =?utf-8?B?WlA4RkZRTmY3SHBDVVM5b0ZxYWhWN2dhcUVQOEc5QXBLMThwaTA3bHhFV3dP?=
 =?utf-8?B?b3pHbXZDclZab0ZIZDVzOW5icnhraEJya1JCTUkraHNuTHZVS0pxUEEzTWtj?=
 =?utf-8?B?V1VLTGowSkc4dWNOZkw0MkdXWWFRODFnZnhaTjhrSU9Wayt4S3JRMXppTHhr?=
 =?utf-8?B?YnJNU0hJOS85TnpDZ1FrcWhtMFlJc2UwaDNKZWk3Q040dDI4ZGRROHdiTnlT?=
 =?utf-8?B?RDJlWGtYYS8zRTZ5d1dKU2NMZlJDYjVVdU9xY1E4OGE1QWJWd3lvMHZyaE5z?=
 =?utf-8?Q?1R1erktyXmv4t+39bTU4Yksj6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42423003-23a9-4c16-eb2d-08ddc03a4653
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 05:17:48.1179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBHVjB6sPPc/GGHSbbtsTZe+CO9CWqvROtaU4R9SHTcz5kxq2MoeZR5KcpnBI0akjIOHw3+2hWVSSVajz0vGuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF183C9380E
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



On 7/11/2025 3:16 AM, Raag Jadav wrote:
> On Thu, Jul 10, 2025 at 03:00:06PM -0400, Rodrigo Vivi wrote:
>> On Thu, Jul 10, 2025 at 01:24:52PM +0300, Raag Jadav wrote:
>>> On Thu, Jul 10, 2025 at 11:37:14AM +0200, Christian König wrote:
>>>> On 10.07.25 11:01, Simona Vetter wrote:
>>>>> On Wed, Jul 09, 2025 at 12:52:05PM -0400, Rodrigo Vivi wrote:
>>>>>> On Wed, Jul 09, 2025 at 05:18:54PM +0300, Raag Jadav wrote:
>>>>>>> On Wed, Jul 09, 2025 at 04:09:20PM +0200, Christian König wrote:
>>>>>>>> On 09.07.25 15:41, Simona Vetter wrote:
>>>>>>>>> On Wed, Jul 09, 2025 at 04:50:13PM +0530, Riana Tauro wrote:
>>>>>>>>>> Certain errors can cause the device to be wedged and may
>>>>>>>>>> require a vendor specific recovery method to restore normal
>>>>>>>>>> operation.
>>>>>>>>>>
>>>>>>>>>> Add a recovery method 'WEDGED=vendor-specific' for such errors. Vendors
>>>>>>>>>> must provide additional recovery documentation if this method
>>>>>>>>>> is used.
>>>>>>>>>>
>>>>>>>>>> v2: fix documentation (Raag)
>>>>>>>>>>
>>>>>>>>>> Cc: André Almeida <andrealmeid@igalia.com>
>>>>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>>>>>>> Cc: <dri-devel@lists.freedesktop.org>
>>>>>>>>>> Suggested-by: Raag Jadav <raag.jadav@intel.com>
>>>>>>>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>>>>>>
>>>>>>>>> I'm not really understanding what this is useful for, maybe concrete
>>>>>>>>> example in the form of driver code that uses this, and some tool or
>>>>>>>>> documentation steps that should be taken for recovery?
>>>>>>
>>>>>> The case here is when FW underneath identified something badly corrupted on
>>>>>> FW land and decided that only a firmware-flashing could solve the day and
>>>>>> raise interrupt to the driver. At that point we want to wedge, but immediately
>>>>>> hint the admin the recommended action.
>>>>>>
>>>>>>>>
>>>>>>>> The recovery method for this particular case is to flash in a new firmware.
>>>>>>>>
>>>>>>>>> The issues I'm seeing here is that eventually we'll get different
>>>>>>>>> vendor-specific recovery steps, and maybe even on the same device, and
>>>>>>>>> that leads us to an enumeration issue. Since it's just a string and an
>>>>>>>>> enum I think it'd be better to just allocate a new one every time there's
>>>>>>>>> a new strange recovery method instead of this opaque approach.
>>>>>>>>
>>>>>>>> That is exactly the opposite of what we discussed so far.
>>>>>
>>>>> Sorry, I missed that context.
>>>>>
>>>>>>>> The original idea was to add a firmware-flush recovery method which
>>>>>>>> looked a bit wage since it didn't give any information on what to do
>>>>>>>> exactly.
>>>>>>>>
>>>>>>>> That's why I suggested to add a more generic vendor-specific event
>>>>>>>> with refers to the documentation and system log to see what actually
>>>>>>>> needs to be done.
>>>>>>>>
>>>>>>>> Otherwise we would end up with events like firmware-flash, update FW
>>>>>>>> image A, update FW image B, FW version mismatch etc....
>>>>>
>>>>> Yeah, that's kinda what I expect to happen, and we have enough numbers for
>>>>> this all to not be an issue.
>>>>>
>>>>>>> Agree. Any newly allocated method that is specific to a vendor is going to
>>>>>>> be opaque anyway, since it can't be generic for all drivers. This just helps
>>>>>>> reduce the noise in DRM core.
>>>>>>>
>>>>>>> And yes, there could be different vendor-specific cases for the same driver
>>>>>>> and the driver should be able to provide the means to distinguish between
>>>>>>> them.
>>>>>>
>>>>>> Sim, what's your take on this then?
>>>>>>
>>>>>> Should we get back to the original idea of firmware-flash?
>>>>>
>>>>> Maybe intel-firmware-flash or something, meaning prefix with the vendor?
>>>>>
>>>>> The reason I think it should be specific is because I'm assuming you want
>>>>> to script this. And if you have a big fleet with different vendors, then
>>>>> "vendor-specific" doesn't tell you enough. But if it's something like
>>>>> $vendor-$magic_step then it does become scriptable, and we do have have a
>>>>> place to put some documentation on what you should do instead.
>>>>>
>>>>> If the point of this interface isn't that it's scriptable, then I'm not
>>>>> sure why it needs to be an uevent?
>>>>
>>>> You should probably read up on the previous discussion, cause that is exactly what I asked as well :)
>>>>
>>>> And no, it should *not* be scripted. That would be a bit brave for a firmware update where you should absolutely not power down the system for example.
>>
>> I also don't like the idea or even the thought of scripting something like
>> a firmware-flash. But only to fail with a better pin point to make admin
>> lives easier with a notification.
>>
>>>>
>>>> In my understanding the new value "vendor-specific" basically means it is a known issue with a documented solution, while "unknown" means the driver has no idea how to solve it.
>>
>> Exactly, the hardware and firmware are giving the indication of what should be
>> done. It is not 'unknown'.
>>
>>>
>>> Yes, and since the recovery procedure is defined and known to the consumer,
>>> it can potentially be automated (atleast for non-firmware cases).
>>>
>>>>> I guess if you all want to stick with vendor-specific then I think that's
>>
>> Well, I would honestly prefer a direct firmware-flash, but if that is not
>> usable by other vendors and there's a push back on that, let's go with
>> the vendor-specific then.
> 
> I think the procedure for firmware-flash is vendor specific, so the wedged event
> alone is not sufficient either way. The consumer will need more guidance from
> vendor documentation.

Procedure of firmware-flash is vendor specific, but the term 
'firmware-flash' is still generic. The patch doesn't mention any vendor 
specific firmware or procedure. The push back was for the number of 
macros that can be added for other operations.


> 
> With vendor-specific method, the driver has the opportunity to cover as many
> cases as it wants without having to create a new method everytime, and face the
> same dilemma of being vendor agnostic.
> 
>>>>> ok with me too, but the docs should at least explain how to figure out
>>>>> from the uevent which vendor you're on with a small example. What I'm
>>>>> worried is that if we have this on multiple drivers userspace will
>>>>> otherwise make a complete mess and might want to run the wrong recovery
>>>>> steps.
>>>
>>> The device id along with driver can be identified from uevent (probably
>>> available inside DEVPATH somewhere) to distinguish the vendor. So the consumer
>>> already knows if the device fits the criteria for recovery.
>>>
>>>>> I think ideally, no matter what, we'd have a concrete driver patch which
>>>>> then also comes with the documentation for what exactly you're supposed to
>>>>> do as something you can script. And not just this stand-alone patch here.
>>>
>>> Perhaps the rest of the series didn't make it to dri-devel, which will answer
>>> most of the above.
>>
>> Riana, could you please try to provide a bit more documentation like Sima
>> asked and re-send the entire series to dri-devel?

Sure will send the entire series to dri-devel. The documentation is 
present in the series.

> 
> With the ideas in this thread also documented so that we don't end up repeating
> the same discussion.
It is mentioned in cover letter but i didn't send it to dri-devel. will 
add more details

Thanks
Riana

> 
> Raag
> 
>>>>>>>>>> ---
>>>>>>>>>>   Documentation/gpu/drm-uapi.rst | 9 +++++----
>>>>>>>>>>   drivers/gpu/drm/drm_drv.c      | 2 ++
>>>>>>>>>>   include/drm/drm_device.h       | 4 ++++
>>>>>>>>>>   3 files changed, 11 insertions(+), 4 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>>>>>>>>>> index 263e5a97c080..c33070bdb347 100644
>>>>>>>>>> --- a/Documentation/gpu/drm-uapi.rst
>>>>>>>>>> +++ b/Documentation/gpu/drm-uapi.rst
>>>>>>>>>> @@ -421,10 +421,10 @@ Recovery
>>>>>>>>>>   Current implementation defines three recovery methods, out of which, drivers
>>>>>>>>>>   can use any one, multiple or none. Method(s) of choice will be sent in the
>>>>>>>>>>   uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
>>>>>>>>>> -more side-effects. If driver is unsure about recovery or method is unknown
>>>>>>>>>> -(like soft/hard system reboot, firmware flashing, physical device replacement
>>>>>>>>>> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
>>>>>>>>>> -will be sent instead.
>>>>>>>>>> +more side-effects. If recovery method is specific to vendor
>>>>>>>>>> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
>>>>>>>>>> +specific documentation for further recovery steps. If driver is unsure about
>>>>>>>>>> +recovery or method is unknown, ``WEDGED=unknown`` will be sent instead
>>>>>>>>>>   
>>>>>>>>>>   Userspace consumers can parse this event and attempt recovery as per the
>>>>>>>>>>   following expectations.
>>>>>>>>>> @@ -435,6 +435,7 @@ following expectations.
>>>>>>>>>>       none            optional telemetry collection
>>>>>>>>>>       rebind          unbind + bind driver
>>>>>>>>>>       bus-reset       unbind + bus reset/re-enumeration + bind
>>>>>>>>>> +    vendor-specific vendor specific recovery method
>>>>>>>>>>       unknown         consumer policy
>>>>>>>>>>       =============== ========================================
>>>>>>>>>>   
>>>>>>>>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>>>>>>>>> index cdd591b11488..0ac723a46a91 100644
>>>>>>>>>> --- a/drivers/gpu/drm/drm_drv.c
>>>>>>>>>> +++ b/drivers/gpu/drm/drm_drv.c
>>>>>>>>>> @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>>>>>>>>>>   		return "rebind";
>>>>>>>>>>   	case DRM_WEDGE_RECOVERY_BUS_RESET:
>>>>>>>>>>   		return "bus-reset";
>>>>>>>>>> +	case DRM_WEDGE_RECOVERY_VENDOR:
>>>>>>>>>> +		return "vendor-specific";
>>>>>>>>>>   	default:
>>>>>>>>>>   		return NULL;
>>>>>>>>>>   	}
>>>>>>>>>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>>>>>>>>>> index 08b3b2467c4c..08a087f149ff 100644
>>>>>>>>>> --- a/include/drm/drm_device.h
>>>>>>>>>> +++ b/include/drm/drm_device.h
>>>>>>>>>> @@ -26,10 +26,14 @@ struct pci_controller;
>>>>>>>>>>    * Recovery methods for wedged device in order of less to more side-effects.
>>>>>>>>>>    * To be used with drm_dev_wedged_event() as recovery @method. Callers can
>>>>>>>>>>    * use any one, multiple (or'd) or none depending on their needs.
>>>>>>>>>> + *
>>>>>>>>>> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
>>>>>>>>>> + * details.
>>>>>>>>>>    */
>>>>>>>>>>   #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
>>>>>>>>>>   #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>>>>>>>>>>   #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
>>>>>>>>>> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
>>>>>>>>>>   
>>>>>>>>>>   /**
>>>>>>>>>>    * struct drm_wedge_task_info - information about the guilty task of a wedge dev
>>>>>>>>>> -- 
>>>>>>>>>> 2.47.1
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>
>>>>


