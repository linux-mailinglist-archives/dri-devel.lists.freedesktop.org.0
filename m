Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC83BCFBC3
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F020210E353;
	Sat, 11 Oct 2025 19:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJRgZf0o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F0B10E353;
 Sat, 11 Oct 2025 19:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211694; x=1791747694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=KJ00HeMraVs8UeXvtXuEi5HR659oUI5XJaPoj5ZYjl8=;
 b=nJRgZf0o2Tv8HVrhe15ksv9ToDweLM52ULWzBzqwRfKZXS9YUSl3mqro
 bOs63HQ00OTBK69TxCHR+V0zLSxQquOjM0gPxzsJo9A9ilzoKIejJl2m6
 pOlKu7q1zf667FPEnSgXOMp3XQ3NVqYHK7Xhkf7jMPWqgA/l1aOwB6teQ
 mQ7yV8i0rr+juHStY1GPTK3jKwBHA1RVZ64RQHbX4Md3XCLLDFmL0WPYR
 VkYUB23VE/e9w515zpzogfulECAkZHlZwuhKblBgwG00xCbzBqahIIjEf
 BPaVqFCBmo4k/IWJAfQ03eQmRpNbRdFSOdowf3QgjE3wlCuGkjJjSTrkT w==;
X-CSE-ConnectionGUID: nDflC3a4QkC9OWHKuqUv9g==
X-CSE-MsgGUID: Q54gp00FTjKZhuEl1Ev95A==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="73842088"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="73842088"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:34 -0700
X-CSE-ConnectionGUID: ih1v9N0TQly/RfoC0E4Jgg==
X-CSE-MsgGUID: foy6dsGSSqikzFc8bup7QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="186344028"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:41:33 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLRVo9kR30JILbZBfH0s5tL1HJlb7o/ACURBBtEsBlNjrOxIZ8YpfRbwuWqUh2Di1RxVsYzDqJ8Wp58EX9Ocr0ZPN0NsPpvUXgQVKQbvOibTWZnMI/v8/2AAJvhwqMKOmVbAUWuAMGQ/oE0tWnm0YWZbcLwXOWt+BMcl98eIU5Ndm1dXc6vY1yf42AhDoqisKOw1WDg3WZJpXX5gNexYdfeyubBynm/nb9AxPiuBJ57wQtOZ9Zb6Cfxd1KUyt1uG5LXactWn9lp/uikC3cCv8XDUU8ASxq8w1CUJIkhTb22kdE1aOcFsTQFsdWJ9YhMGpxaVW99ISTe+MwJp3HyG0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0F7OK9TfhyPa7ZmIqu2Yp34szadAp/tKtZtDQ5k8D4E=;
 b=OMnMN+EVQf4LP34zBnhnXwDyCRKcAhqYWC6B6EjHsS+51YWWCKDWrT6RUNsjfk9N6WOgFrlzIPxQoeIqEpdcRKeWwP0BFHiq7mXrp1K6m3SDaJcqh7Alzoi8LdW8W1m8HlCsUA58lxX+G9G04hzUVXfzvoIeH6+994hSj1KYxPF0PahqFqjNkCTV70XymVKacf0NHGzn9ZaCJTR5JTspCpwOCqW6q7pQOgooDxG23hXwjNi96Vze+fWTPnpRP2qlBgLS9AuSfm0os70kf0WPgBcQyR4laTP9PniN6CduVrg6dg6/F5xZKRxCcya7r85iLFYxizeebgbKV6yNLC9wbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW3PR11MB4681.namprd11.prod.outlook.com (2603:10b6:303:57::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.11; Sat, 11 Oct 2025 19:41:32 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:41:32 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 17/26] drm/xe/pf: Add helpers for VF GGTT migration data
 handling
Date: Sat, 11 Oct 2025 21:38:38 +0200
Message-ID: <20251011193847.1836454-18-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0298.eurprd07.prod.outlook.com
 (2603:10a6:800:130::26) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW3PR11MB4681:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c696655-cee4-4719-8e23-08de08fe2df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlNEZjBkWUZvOWo3T2JTbzYwSHgvUWtVYVVVajd0TFRtL0lMNkhFVHBkVlFP?=
 =?utf-8?B?UDk3eDJmeWtmQW5OeW1EWThSaDR5MDJuNTBqTURocU5ZZmFSRlhla1ZjdnVX?=
 =?utf-8?B?QTQyY0cwZWJsbE1wUEN3QmI5Y3Awck8xMXJ1TnlyL2pTK3FhUHJVS0lMUWkz?=
 =?utf-8?B?UVhpZzZLcUNPZWpCZjhHNEw0eDlhS0dyekdjNFpGTVlLc0FUTVplZ1Q1Y2tR?=
 =?utf-8?B?WitpL1pYcDNyeVJRQWpIRHZsdlFVNEtCRnd5UWlzeGZKV0Q1bi94ZWhoaWkz?=
 =?utf-8?B?dmRsa0krN1pPeVhxVGc4aGIxd1RyMTdkalp6K3JXRjRpL1ZTNUtwc2ZLeWpO?=
 =?utf-8?B?bjVLM21kQzM0cS9GTldRSURUR0s1dW03MEFiS1J3TGZiTWFndlE4N0FYczRz?=
 =?utf-8?B?WGVkeDJpa2Y2N3Jnd0k4a0dERGxyd3BwTEJ3MlBzVFBER0IxcUlMOEVIOE5N?=
 =?utf-8?B?SWFrSmdsVitvVGZlNm9VTnJKQXBFem9LZWZSMWk5RTdKNGIwU1h6VWNJT3la?=
 =?utf-8?B?eUo2THMzblNja2FnOExVVG5aeUcwenBDTjEvTFk0WUFja3E1NXVWaWFwV3ZS?=
 =?utf-8?B?dHJTdWxneXQ2KzEzTUtvUU0zajl5WnJ5ZlpuMWNQaU1YRWR6b2hrRGxkak1y?=
 =?utf-8?B?V2JUa1V2cS9jN2lVQ0xmdXVPTDUyUlFFS1dRZDJHTE0zSWdIZ1Y1RlBCbDlu?=
 =?utf-8?B?NU9IalhRZ3NEZmovM3ZaWndncXMybTBlOGN4NURsM2VPVStZVmM2UEpFSG5p?=
 =?utf-8?B?WU5YYnZjamJzSk5PQlBlazZLdDByV2l2bVpDY3dUUDU0UVM0UTgvUVg5ZUZ0?=
 =?utf-8?B?NVdjWERWcWRvTk9odzRaUUUyS0RtaU5pWEc2aGhjb3dybGU5NVczVmlHSkJM?=
 =?utf-8?B?YmFaQlhZZWFHRi9TZEhSeXRQdG1TcHlnVittK0JSUTRVZUluMXFNM3BLa1Jo?=
 =?utf-8?B?VHh0SSsrVklYWExLWnBlR0JYZ3hudi9DWE1FdVVhTHlDUDJ6b3NqK09qRXls?=
 =?utf-8?B?RlJvREU2WGVjWENYT0E5Wnc1MCtTR1JmR1ZpMWgvTnhLZE15QS9XR0RNL254?=
 =?utf-8?B?SEZBNm1PL0RBOXFQNTlUUFcyVG9xMmZQaDRjTGtSVW8zS0JoZHFUYnk0c0Zo?=
 =?utf-8?B?bG9RTGUyU2prNjM4aEg3eU9pZ3FqZDFqWk5UaXBVeFMzR01nWGxlMDJuVnNJ?=
 =?utf-8?B?MVgrNDg2ejRIU1FaMDdaSGdIQTd4U0FXck1FMklpNE1jT3FqYVowRXgyUkJU?=
 =?utf-8?B?RDM2aFZjYmxrcTR4VUdGekw2MXk2R3MxMWhYR1RNckdaajZkWWxhNkNnZXRW?=
 =?utf-8?B?SUxRTkVIRXVxcDA0WkpaaWZCRWoxM05JUGlVU2h6ZnZZdnpJVGNyRHE3YURK?=
 =?utf-8?B?YnVqRU5IYlhwZGRnVTNRNVNzREY3ejhIMk56N2h5ZDMzdHVmYnV6by9LTlVn?=
 =?utf-8?B?WTY3YS8vQUpkanZ4bmlYWlJsSHpqcDVocFBVZmtLZ1dBK0UrYXdhSEUvVzM4?=
 =?utf-8?B?WWJOeHFWTUczck51d3ZmejdJdzlpMUh3ZVdmQVNycnloRmU0K0xrTDZJUkw2?=
 =?utf-8?B?ekUwRVlVaDVPN3hLRDB4UTEwdVdhRGZibHQ5cVJuVkt2K05vL3FPZmlhN3ZY?=
 =?utf-8?B?eXhRblFYalIvb3pkM2ZxeE5oWDFScml1N0VDSEFFckhXdEJpTHlVaEdWVmhp?=
 =?utf-8?B?bklkbjNQT0tOT1l1VCsyQjIxQkg5T0lDYzVSY1BuTUkzeWlQY3IvVTJHVWdQ?=
 =?utf-8?B?Y1Rob0kwQlNzVXZCdzc3b01TNEFCdTZ4eEd3ZFZsKzBwMGU0cjMwdzhKTDg5?=
 =?utf-8?B?NVVzVVZoY2l3ZHRUcGtPWDBZUU44aDYzSFh0Um81eU1JSDJmckJQVFg1dUpo?=
 =?utf-8?B?S3k3elBJT21EMFVmR1A1ci94TVBrUjlVSDk0S1ZtVjVtb3ZTUXRVQmgyS2ZP?=
 =?utf-8?B?MVB0eGlhMWdLeFVlVkVjeUowdTlHRVFoaG4yaXAyZ09aT2N2eDlHK1ZhV2Qy?=
 =?utf-8?Q?fUaVrYJ8SLQ108aHtMbZUIWAC3hezQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDlnenI4ZENmOTYwMkJjSE05UEEzQnRPR1lFaXhKMnhEUTdNWUM5Q25uSjdL?=
 =?utf-8?B?Z2toUzRGMVA1Qk9SRGJEZ3pQdEdueVZnVXZCdU11SThoT1FMWHRxYmt2aUVE?=
 =?utf-8?B?cTlLSERDamVSNnF0S2k4QjM3UzU0b0N4Uks3UEFCMjRXdW9MSDZ4MTlDbUpX?=
 =?utf-8?B?OEZmY0YwN3ZxdjJpOFA5YVVuR0oydnh1N1ZVRlI3K3RJdHNFcU44aHY0MTF6?=
 =?utf-8?B?dXdzWW9NeXNNU1pMR28wemYwSU1GYkI5WEc4QStuSm1XVDlldG05UDhwVitV?=
 =?utf-8?B?Y0lGOGE1aElnWXFEaFZVV1RqRWdpNno1TEtJK1E3M0JjbjlqY3NackZybERS?=
 =?utf-8?B?S3JwODV4bkxrWUZaNlRRTWZqdExjRlF2cnIrYTRqSnJWMlJ2d3FxUzUrdTdR?=
 =?utf-8?B?dHJrd2YzZXliK21rYTJEOTIrMkNVWmVXTC85TG9VUlRzVUdBOWtub1pua2xJ?=
 =?utf-8?B?K3Z4MXdyK3NjcEZkQnRRWitOU2h5cDBEdWRXYXdzNjAxeHlITy8yckt6OXV1?=
 =?utf-8?B?VzQ5WlVISmVxMkp1MngxeXd0YS92UmJHWjhXaWlLUlpzOGp1bWs5Z2hFelc3?=
 =?utf-8?B?YmQ5aU5hcG5Ca0FlWkFYR1NJM3VNczU2YmJLL0piaTQxNmVGU3RpZ1lFTW1T?=
 =?utf-8?B?L3NBVmRHVlYrUHozclRtN3RzeUg0QWxlUmJqa2NBY01oNGZpMExveWNlbXEy?=
 =?utf-8?B?V2JyclQ1QmM1Zm5kdlUyak9rZXprZU52T1A1Z0g0RXdCQXJoNTAyUHN3Ujho?=
 =?utf-8?B?SUVidXEwMG4zUFRWeEFrK0s3QmdWc0IySVhtYkFWcm5zWjFaWGY0VjJwSE1Q?=
 =?utf-8?B?TXlNK0hSM2VPSzBwNEY3bms0S1lwVUtzOUVOcStnTFkyU2xyTW1GWm9ZclVK?=
 =?utf-8?B?UytQbXptZWZCR21KZENSVmlpZ2RFd2dHcnp4dVFEdVhiUnNDWG1nRlh3N3Rl?=
 =?utf-8?B?NGVWaXF1UURvMGl4K0hrVVVsV1I1YlNsSlNjUXdlaFdZR1IxZXU0dUJ3c1RK?=
 =?utf-8?B?Y1Y4OUVyeDFxdjd4cnRicmt1VkVBRExXWHVwUGxsajBwZzZYelUxSWxBMjlK?=
 =?utf-8?B?VmVib1ZUSnluTFpGdE9BbUxyQzUxeFgxT3psd2kxRlZLRXphU1JBZzJsSDhp?=
 =?utf-8?B?Q3hIMlJhbWZZdENUc01kY2UrMURLa0s5RUhMYWRjbEJ5Wlp6UXNGbTNtUUJG?=
 =?utf-8?B?VElLL3hGNmJ4Z09GRGkvamRvM0RnQXdUbUp6cFRKRFI1NWpYYzVDdmtnMFVy?=
 =?utf-8?B?b0pRU2xTV2I5Z09XcEVYQkV5c3AvajV6bjBDeGV0eXUyZElERi9FU1g1a1Rv?=
 =?utf-8?B?blpYS1FCNVMrNnRKQlAyUU5KUHZKWGZ2VWdKWWI1dUFmeUhnV3FVMmkrbzNC?=
 =?utf-8?B?UXZ2dXhINmNxeWVsRWhQakZEbHVvVm4xOUptVzREdFlrcS81V2NxMkFLczNX?=
 =?utf-8?B?bWRPdnFlZHdOWW9jQm43VTZtV055TFgxcDdFN0lhNkxjYkFXSlc1d1cxZ1Nv?=
 =?utf-8?B?NnBhSEVwbmgwc2tlcVVScWpHL09ZZS9PSEZoUmVpWkV6Qm5lOTZmcis5NHA2?=
 =?utf-8?B?WVUvNDNTUVljZVBVQU5EM3A5cWc0YVVtVDRFUzllZ2YyRFBTRmlya2NBdDdK?=
 =?utf-8?B?cldCUWFEbER1eUJBQ0RTeUQ0OGVxR3lwMTFoYW1KMEd3cmdRb2w3MkI3dFNn?=
 =?utf-8?B?c3ZuaU8vQnZkcUhVNVF0SC9yTVlpdTdpRjAwSUlrUFlEOE1ITTRFL3IybzJt?=
 =?utf-8?B?VFZpRGQ1SE05ajVsNnJlRmhZQUZIWjF3VVE3WlJNWnNiMllyVnpjUWdBQndq?=
 =?utf-8?B?bWxEamJGNDhHbThEampMNldoREZPVEdQVXpldzdESlZrME9laXJJOXhNSG9R?=
 =?utf-8?B?YS9aNmE5a3YzUC83ckM2MlMwQ0pLSDEzazFjcHNkektUajdWekwrcFV6RWFn?=
 =?utf-8?B?OWdhT0R4aWoySUpRYnNEOXFtMHlZRGdnUkRsRjAwQjY1ck9TdVV6eitUOHNK?=
 =?utf-8?B?QlZsSzBpdHpFUFd3eDQzaW4ya1A3VWZwWTIxWUNmdWphR1kyT0hLUVIxSHYx?=
 =?utf-8?B?YzJsNXROVkoxbUVFOTBJcFc2TDU2aXIzOWl2aWFLWkZVM2xhV2J2dE5NK0ZX?=
 =?utf-8?B?VjdWODRnL2FKOGdhaVVDYW83Q21uQll2cUtwMFZxTkYweGcyaVp2ait6djZP?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c696655-cee4-4719-8e23-08de08fe2df3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:41:32.1425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QU6nPvjc/J/721cxW4J6Z/LYLgNbUDUVtp9jwq5Snhy7N2If98w7yjxVhwfKzegRnNP+VDxM9Lest2p1AVZ2ZVCpfWH+YeaecYZCgkbnUzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4681
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

In an upcoming change, the VF GGTT migration data will be handled as
part of VF control state machine. Add the necessary helpers to allow the
migration data transfer to/from the HW GGTT resource.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 92 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h               |  2 +
 drivers/gpu/drm/xe/xe_ggtt_types.h         |  2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 64 +++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  5 ++
 5 files changed, 165 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index aca7ae5489b91..89c0ad56c6a8a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -138,6 +138,14 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 	ggtt_update_access_counter(ggtt);
 }
 
+static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
+{
+	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
+	xe_tile_assert(ggtt->tile, addr < ggtt->size);
+
+	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
+}
+
 static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
@@ -220,16 +228,19 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
 static const struct xe_ggtt_pt_ops xelp_pt_ops = {
 	.pte_encode_flags = xelp_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte,
+	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
 static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
 	.pte_encode_flags = xelpg_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte,
+	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
 static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.pte_encode_flags = xelpg_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
+	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
 static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u32 reserved)
@@ -914,6 +925,87 @@ void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid)
 	xe_ggtt_assign_locked(node->ggtt, &node->base, vfid);
 	mutex_unlock(&node->ggtt->lock);
 }
+
+/**
+ * xe_ggtt_node_save - Save a &struct xe_ggtt_node to a buffer
+ * @node: the &struct xe_ggtt_node to be saved
+ * @dst: destination buffer
+ * @size: destination buffer size in bytes
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size)
+{
+	struct xe_ggtt *ggtt;
+	u64 start, end;
+	u64 *buf = dst;
+
+	if (!node || !node->ggtt)
+		return -ENOENT;
+
+	mutex_lock(&node->ggtt->lock);
+
+	ggtt = node->ggtt;
+	start = node->base.start;
+	end = start + node->base.size - 1;
+
+	if (node->base.size < size) {
+		mutex_unlock(&node->ggtt->lock);
+		return -EINVAL;
+	}
+
+	while (start < end) {
+		*buf++ = ggtt->pt_ops->ggtt_get_pte(ggtt, start) & ~GGTT_PTE_VFID;
+		start += XE_PAGE_SIZE;
+	}
+
+	mutex_unlock(&node->ggtt->lock);
+
+	return 0;
+}
+
+/**
+ * xe_ggtt_node_load - Load a &struct xe_ggtt_node from a buffer
+ * @node: the &struct xe_ggtt_node to be loaded
+ * @src: source buffer
+ * @size: source buffer size in bytes
+ * @vfid: VF identifier
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid)
+{
+	struct xe_ggtt *ggtt;
+	u64 start, end;
+	const u64 *buf = src;
+	u64 vfid_pte = xe_encode_vfid_pte(vfid);
+
+	if (!node || !node->ggtt)
+		return -ENOENT;
+
+	mutex_lock(&node->ggtt->lock);
+
+	ggtt = node->ggtt;
+	start = node->base.start;
+	end = start + size - 1;
+
+	if (node->base.size != size) {
+		mutex_unlock(&node->ggtt->lock);
+		return -EINVAL;
+	}
+
+	while (start < end) {
+		ggtt->pt_ops->ggtt_set_pte(ggtt, start, (*buf & ~GGTT_PTE_VFID) | vfid_pte);
+		start += XE_PAGE_SIZE;
+		buf++;
+	}
+	xe_ggtt_invalidate(ggtt);
+
+	mutex_unlock(&node->ggtt->lock);
+
+	return 0;
+}
+
 #endif
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 75fc7a1efea76..469b3a6ca14b4 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -43,6 +43,8 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
 
 #ifdef CONFIG_PCI_IOV
 void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
+int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size);
+int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid);
 #endif
 
 #ifndef CONFIG_LOCKDEP
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index c5e999d58ff2a..dacd796f81844 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -78,6 +78,8 @@ struct xe_ggtt_pt_ops {
 	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
 	/** @ggtt_set_pte: Directly write into GGTT's PTE */
 	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
+	/** @ggtt_get_pte: Directly read from GGTT's PTE */
+	u64 (*ggtt_get_pte)(struct xe_ggtt *ggtt, u64 addr);
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index b2e5c52978e6a..51027921b2988 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -726,6 +726,70 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
 	return xe_gt_sriov_pf_config_bulk_set_ggtt(gt, vfid, num_vfs, fair);
 }
 
+/**
+ * xe_gt_sriov_pf_config_ggtt_save - Save a VF provisioned GGTT data into a buffer.
+ * @gt: the &struct xe_gt
+ * @vfid: VF identifier
+ * @buf: the GGTT data destination buffer
+ * @size: the size of the buffer
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_ggtt_save(struct xe_gt *gt, unsigned int vfid,
+				    void *buf, size_t size)
+{
+	struct xe_gt_sriov_config *config;
+	ssize_t ret;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid);
+	xe_gt_assert(gt, !(!buf ^ !size));
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	config = pf_pick_vf_config(gt, vfid);
+	size = size / sizeof(u64) * XE_PAGE_SIZE;
+
+	ret = xe_ggtt_node_save(config->ggtt_region, buf, size);
+
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return ret;
+}
+
+/**
+ * xe_gt_sriov_pf_config_ggtt_restore - Restore a VF provisioned GGTT data from a buffer.
+ * @gt: the &struct xe_gt
+ * @vfid: VF identifier
+ * @buf: the GGTT data source buffer
+ * @size: the size of the buffer
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+				       const void *buf, size_t size)
+{
+	struct xe_gt_sriov_config *config;
+	ssize_t ret;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid);
+	xe_gt_assert(gt, !(!buf ^ !size));
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	config = pf_pick_vf_config(gt, vfid);
+	size = size / sizeof(u64) * XE_PAGE_SIZE;
+
+	ret = xe_ggtt_node_load(config->ggtt_region, buf, size, vfid);
+
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return ret;
+}
+
 static u32 pf_get_min_spare_ctxs(struct xe_gt *gt)
 {
 	/* XXX: preliminary */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 513e6512a575b..6916b8f58ebf2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -61,6 +61,11 @@ ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *bu
 int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
 				  const void *buf, size_t size);
 
+int xe_gt_sriov_pf_config_ggtt_save(struct xe_gt *gt, unsigned int vfid,
+				    void *buf, size_t size);
+int xe_gt_sriov_pf_config_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+				       const void *buf, size_t size);
+
 bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
 
 int xe_gt_sriov_pf_config_init(struct xe_gt *gt);
-- 
2.50.1

