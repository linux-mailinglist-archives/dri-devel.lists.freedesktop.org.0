Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 603018AEA21
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 17:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7AB11120AF;
	Tue, 23 Apr 2024 15:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gz2mSIs+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DFB10FCBB;
 Tue, 23 Apr 2024 15:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713884708; x=1745420708;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qNQfRiGKYXzkZmw+bMsJHeL05RQJFDXyo4cdPeHtJb8=;
 b=Gz2mSIs+hKLQ63/L15SntkzFDZaqxPmpZxFr7t8MbfLgV14X+tB13zP1
 Zmnjt25jte82CTW/vkWHd4zsyVxIv+F9PH5Ua+mojmFAP7JlUKDqHjRbj
 jLr7bL7wq2ggTjktXiyH4IjCi7QrB2tY4h90WHfuuoQT8hzJh2wyFeCv0
 Mt5cJxRBxdmVvsqubFW2ayCUKwCqeiDes2JUbyZg6H1/awzPozJJFsUaY
 zfS9vtoQp4EbIfJca466vdSj8r6Q2Blqs+pC13YZFc2cuyktB2rs363e/
 v9wgRLYDXydTe2tS1IuWbGHN6COss40eRUhBVzkm7FZ9UsM/tSDb02wKQ g==;
X-CSE-ConnectionGUID: T8oo7SCVSo2Uq+s5cKkJqw==
X-CSE-MsgGUID: ONL30fUuTuytPFkGV18oVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9341829"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9341829"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 08:05:07 -0700
X-CSE-ConnectionGUID: 7ptvcTI2SPmPWoDX5KDORw==
X-CSE-MsgGUID: JbJ5HdOXRROH4v1gOcJC0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24369083"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 08:05:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 08:05:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 08:05:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 08:05:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 08:05:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NRz0+3w+xQvy7DcgbrJclSdtOUowanAJfJRUkaJA1k6fIXp64KcToRwCF9x4lMSoXgLAD3nq8YWfUhUICned+8uGI5KQovw/NdPC+bag+Z5ykNNMCaks9uukYecqUYHu12k8YVUh76AW3PHUDCdeGlGDFbn81Q10c5cXTJrCN9lgprlt/W+Qhe5SXrKssXXVcRKGHg8RW8cXgVw/XLeoxxX8qNVRYpxuTD4DIxo/ikPVOwUWCIMcGj4SrKKzSwcj73xggJx7/ue2Q2q01w1O7ZdpoXjKtMny1PhPFMpSF/aP1OZOXyvXUBAugEf+gJwWlhc906FzKPpAfDPd6zw8NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEqL7Ieym0zbjR42EK6TtPAY1T7ZcshIDolTrW8h7jw=;
 b=jPz5941g6vAG5PdMxZoaWDtrRqwWCGuhmLwATbMHLMnvuznJwStK75+S9xVKhnld28zQLX67jvC0Pmv1BRXWRFEO9fgqUeqREJPyhr6/KfM8lFR2mgnKjLFm//A//IsL/0hSTCyI0fqBZRNoy0wUsJEQJmWLSPIURvHvCNiNFXBr4bZryl8FPDlc4DeNv5qkCq61wfm7qE7VzhXVqiAMQgaDJNHyaWwWYtGU77KMOCIJH6lNR2s5a4a/t9BBfhcBmxS4yG/KIOGSBWCKJNhxKftCHt6KRZF99x3Tia+aoJe/ApPJ3UFZGPv/hBg67T1Iy2vv25nZQ/wzTbbu8Ku5gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA1PR11MB6807.namprd11.prod.outlook.com (2603:10b6:806:24e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 15:05:03 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8e17:1f3b:64f:9c67]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8e17:1f3b:64f:9c67%4]) with mapi id 15.20.7519.021; Tue, 23 Apr 2024
 15:05:03 +0000
Message-ID: <b3db0863-80b5-421e-b0cb-e2a9e0114206@intel.com>
Date: Tue, 23 Apr 2024 20:34:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/xe/FLR: Support PCIe FLR
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <airlied@gmail.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
 <20240422065756.294679-5-aravind.iddamsetty@linux.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240422065756.294679-5-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0232.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::10) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA1PR11MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e71946d-2112-4261-e143-08dc63a6c0f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NEhQNitSRnFIRCtZQ0NGWWR4M01SVW1qNnNrbHduRXdkdUp4OWdnTUNFbmlp?=
 =?utf-8?B?N0w0VkdIKzN4K2R1MDVtZkQvUGI3YkxsTTczZWFDVHRPK1N5TUE4WlZVUnI4?=
 =?utf-8?B?ZHhYSmRJWVI2b1llQlFPNWljMVlXUmlSWG9TN1pYQ1hrN2o4eDNFSnFqMStO?=
 =?utf-8?B?eTZmMSs3TXhMZUJCcUw3Z0ZzTFJKUjFrbFp3TFJvZWhWWENXV1ozeXByZXhZ?=
 =?utf-8?B?NlZKUzFoYjlmdU01eU1QQ3YyOUtmTkloRGZWSkFlSlEyMGNzS21iRm52Qzkv?=
 =?utf-8?B?c1FCejBQV1BxQlF2UUh2RnlEREw3TlhOaFN0WExlNWRJUEwyV3FNaTdnSDBP?=
 =?utf-8?B?UG1uOUMzV3dlRXVqNDdrTWQ3QTU4Rmc4Ty91cG04ZjM5UEtzZEZ2QnVTNXFF?=
 =?utf-8?B?d1VheGhwcDh4dEQrbWQvdWlNQ0xPeDBPWFVFdThURjZDNjJNdzBYd1VmeVQ5?=
 =?utf-8?B?QXZvWktBR1NxVjc3UnFjN0orL2QrVFJMc1NqL1pJcmQ0Mkk0MWxOVHVRTkYz?=
 =?utf-8?B?dW41WEkxMEVPWEdZZzlvTjFPZU9SdHU0WUFyN01nNEZIREJBY2haNFVZOElB?=
 =?utf-8?B?ME5kMWN3d2RPRnA0WFJ3SWFmM3M3TjFuZHBoRFV4MDNWdUJYdFZNeWs2eWtr?=
 =?utf-8?B?RUZwSzZvUDN1bldHVk9aRVZ1RDdHNFFkS082bVVDOFAvNFp2YjJGVVdkcHBU?=
 =?utf-8?B?elJTTDZoYVFCN1hvRVVhdkpWckZCQUZHYmsrYUNvTDhkWlVwZ3BGMElIalh0?=
 =?utf-8?B?a0xiUUJwQkxyRkFwSWpqMmFyclc1QWQ5c0twUXZ3UnBsdVFseG5WNFdjOXJw?=
 =?utf-8?B?QlBrOTQrZVkvb0VKTnYwdXJ3UDhtQmtSczV0cW9XOXFpWjBaaGFETkJYMHU2?=
 =?utf-8?B?eWJQbjYvT3lrVmhUOTJCbjczRDEwY1VGbW1yek1XS3p5SXRkS0ZCM2RmeDlx?=
 =?utf-8?B?MWVKM3cvOHNvcW1SSjBvWmc5ZFpUcEVCcHoxRlZBc3VUbS93WXhPK205WmNL?=
 =?utf-8?B?Unp6S01CMmtNZ0VZeFloVk9NbGVtaDV3YStMRk1nTFZPVm01RGpwR1RXMzQ0?=
 =?utf-8?B?UDJEL0hzeHBHTWNNRk9HRWViOUZNV1VsVFV1RTc0WG1oUGVieVhiazBnVnJh?=
 =?utf-8?B?V2Z6WG5zKytobFh3MnN5dnJ0ajZWdytSbGovWEtEU2dTdEdsT1cwbTZZRkpK?=
 =?utf-8?B?ZlFMU0VvYk9yR3Mrcmhmb1U2dlBDenVHQm56QWpIUm41RHY2VForNzBFbFc2?=
 =?utf-8?B?SDBwTG90UklSQ1g2eXdxaHV0UnFWVlJGd003Rmx5cW9wYTJVMkVMMjNCNHRm?=
 =?utf-8?B?QWdCakEyOXBINklzWWUzUC8wUVYxVDJORlJnSmZQQVJFVDFkL08zSGxJcG9E?=
 =?utf-8?B?bDZUWkY1bkhUU3ByTUsrU2llR0FjS2FWWVhvTnhMZ25RMVFMWWJGMVRWTmh3?=
 =?utf-8?B?ZU0yV1B1OVcweGNNeFp5Q0IrTVBnQWY1UzJsQ0YyRHk5bForUDY4TkxaV0dH?=
 =?utf-8?B?QUdqN1E5WlRyNUJHMlFwakFNN1RoYXMwTjJzcXF6SGYwSUdvbVNWSHkweXU3?=
 =?utf-8?B?MzVrOXZ6bmN5dW40SUlhVVB0b3RVSDM3THlCODMxY2UyTGIvNHdFMUtxTDln?=
 =?utf-8?B?NUxnV3M5SlpZK1FQVlF3VThUbkNmbFlmWElvRkJaVC9wOStydFFhZ3IyY3pR?=
 =?utf-8?B?Rjc0VVVIa0N5bmg4VVpieUpyVUpxTkUxSEdNTktqMWg3aGdsMkF2anlRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VytTbmErdmFwbVJwZlBuRExPL2ZoWmI0TjhjenpNNVZ1dUtSSGdzMlNXY3k0?=
 =?utf-8?B?cE1UZlROcWx3bm9GaWR4ekVZdzU3VytJTTFiYnpVWGZsSDBJcTc4enNXZE9S?=
 =?utf-8?B?SGFxdUpoakczdDFsdUVrUnpHUjVQS1R6UzE2R3pyNkY4MXJLOGJjQmRUUHF2?=
 =?utf-8?B?VmlSdlQzRTIxNkxvUjNuNUc5allIaWZkQXVIcVJRbnhlQXFwY1VPT0RVYnFs?=
 =?utf-8?B?WWdEdUlWNEJMVkliOFY3bnRJZWQrTjlsRUVKRysxV2orQ0RrUW52cTdaUnJk?=
 =?utf-8?B?N3FxSHpxekJ3bHowQmVwKzl0ZVl3WEljZTdjeXUyQWdxZmVZMTFGd1EwL0dH?=
 =?utf-8?B?Q0lRUXBQenNOalRrckVNa1R1SVN3eko2bmIvRVpXNVc0UEtoUi96RlZkOWE1?=
 =?utf-8?B?OGE3SHE0aS9qbWtON05WU1d5eUYyVkM5YmZxeEhJN1YxSkVZUlJTNTZKYjRh?=
 =?utf-8?B?SDFJcjdGSjlMQ0VKR2FSdDJSQjhnUnBTTldiS2xVS3VCbEgwcyt4dEJMR2Z4?=
 =?utf-8?B?VW53SEpCWGV1ZnBlcGhKZHZNd0R2VzBWV2xaZlg3WEpwWng5Y05FK29pZkVj?=
 =?utf-8?B?T1NRSEo2L012RHNoMXVQd3hnN1RMamZoMUtQTWRheWVNWHM1SDFlWG1HQk1n?=
 =?utf-8?B?YUdvSk92ODZUOU9JWUZ2RVJBN3o1WEd6Y3M0K2hBenZKVnVOOGQ2ZDBKQnMx?=
 =?utf-8?B?SEdXMmxyd2U3V2Z1V3c5c0xoaHI5bWhsR2tKR0JtcHY5UWx5d0pXTm9zd0NI?=
 =?utf-8?B?K3Ryd0YvN2JRNHVFSWQ5bVUzaTUwaHpXZFVqU2JDTlFUZVY4QTlmR0JsS3o1?=
 =?utf-8?B?TDhQRU9YN2svclZETlJkVGNUbitpR0lxTGdJZStiMHdUd3BHZGRDd001NW1X?=
 =?utf-8?B?eEFXTWVuQWVxV0ZqK0lYbnJGZi9hT0k1TVlzbnJLb1NxaEtoNDk5WG40UWpu?=
 =?utf-8?B?OERXNStxbHRDa0lnbllGUDUraTdCZEtSNjBub0wyeE4yQ2h6YlZmTEw3ZU5L?=
 =?utf-8?B?TkE0MHZwT0Vsdk4waDJSakcwKzE3TW5jNXNYWE1WUUVPbXcvMU1EYk8wMVRY?=
 =?utf-8?B?SStkQ1J2VUpkYW9oVXBpNHhDRi9yQklKcTU0cnNzZTVTWll6MmpHTmtwNmVP?=
 =?utf-8?B?RDBiL25pbkd2elMyVXVKRFJuR25UYnl2UUUzbElid0hOUG9NT3RWQTRPbjVV?=
 =?utf-8?B?RDBiNm8rR1BPNEE3bmdxZjl5M0x1Qno2SG1VOVBYVEt0YlBJdnpuL0UyMkti?=
 =?utf-8?B?NG5JUDFGNWhXenVTdEJwUjQ1d1hucVlVcWNEOVh1eU1XdWNJV3ZwQzZlZTVy?=
 =?utf-8?B?ZWVEdlU2K256alhlb2IwTE9YSktCeC9ta3l2WDRtYzB3RGxjd1V6dkFTbUtp?=
 =?utf-8?B?MnkxZXY3RWRXbjladVNwSlNid09WSEhLaXZIRVFPbjR6Tm1KeldPMjFHMVpV?=
 =?utf-8?B?Z0R4ak9YV2JsaFdHT05jQzllWVdrckFJb1BDUG5JS1BuejdVTVIxOUx4N3pr?=
 =?utf-8?B?Z3poSTk0amh2L3lSNGNpcENjMXpNUEFvVW5zL3ZWREwxYkhqRjNRWnBhTmFw?=
 =?utf-8?B?Qk96Vk84U2ZsSkZieWd5ZFk5OStMVE9jZGI2dWN5QmdDMG9EN0tPN0xwRk9M?=
 =?utf-8?B?VE1YSWJwN1dXdFpDNk9HTjdEMk1teXlURmU2cjYzRW5IUEV3ZFVtZHFUYVoz?=
 =?utf-8?B?Mk1Hczc5KzNSamNwdDlhMzRMNHdvRWY2d1FOajRwNTZIejJNN24xSG1iRDJa?=
 =?utf-8?B?dGN4c3hlRkFCUU5ubHJqVllVcC94REtIdHBuR2dLajVyNUtHY1JucENKVGZX?=
 =?utf-8?B?azBOMjBiL3l1QnhTVVQxRFNXWWZuNSsxMHVmQ1A1SnVyOU8zdmI4eHVMem9K?=
 =?utf-8?B?U1VDQktxZUZ2V1JFc1M3R0l0eFUyRk1EQ1JNQ0xhRUo3YmQ3cDlEakVQNmJH?=
 =?utf-8?B?YmtyRFB2RWZEMGtZWENoc1NPNjZ5K0JoWUx4RFZNbVJ5c05jMVd5L2ErWU5Y?=
 =?utf-8?B?UXFsY05FVkJQc3AxVUc4SHBDRFFadHZOdEZXcnJRNWpwS0lkQWRBTjBMSmRu?=
 =?utf-8?B?TmdtUkQybVo0Zng1WUxaS2RoN2NVQjFsSzZEZ0s3TjRJK3B3c2dCSTJFem1E?=
 =?utf-8?B?TWl3NXJwaXRtVktZRE5yK1RXL0xNTTFnM0dYVVR4SlNBT1hSUy9CZFdhTTMx?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e71946d-2112-4261-e143-08dc63a6c0f2
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 15:05:03.6584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLK4HGlGJXEYVUnwj1/Ivub36E+nBU/9vsgR7Bp4FUOP190h36NOdGk74aMbzjixsUbkopMHXnSN+0ff3T3nxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6807
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



On 22-04-2024 12:27, Aravind Iddamsetty wrote:
> PCI subsystem provides callbacks to inform the driver about a request to
> do function level reset by user, initiated by writing to sysfs entry
> /sys/bus/pci/devices/.../reset. This will allow the driver to handle FLR
> without the need to do unbind and rebind as the driver needs to
> reinitialize the device afresh post FLR.
> 
> v2:
> 1. separate out gt idle and pci save/restore to a separate patch (Lucas)
> 2. Fixed the warnings seen around xe_guc_submit_stop, xe_guc_puc_fini
> 
> v3: declare xe_pci_err_handlers as static(Michal)
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile          |  1 +
>   drivers/gpu/drm/xe/xe_device_types.h |  3 +
>   drivers/gpu/drm/xe/xe_guc_pc.c       |  4 ++
>   drivers/gpu/drm/xe/xe_pci.c          |  9 ++-
>   drivers/gpu/drm/xe/xe_pci.h          |  2 +
>   drivers/gpu/drm/xe/xe_pci_err.c      | 88 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pci_err.h      | 13 ++++
>   7 files changed, 119 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
>   create mode 100644 drivers/gpu/drm/xe/xe_pci_err.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8bc62bfbc679..693971a1fac0 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
>   	xe_module.o \
>   	xe_pat.o \
>   	xe_pci.o \
> +	xe_pci_err.o \
>   	xe_pcode.o \
>   	xe_pm.o \
>   	xe_preempt_fence.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 0a66555229e9..8c749b378a92 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -465,6 +465,9 @@ struct xe_device {
>   	/** @pci_state: PCI state of device */
>   	struct pci_saved_state *pci_state;
>   
> +	/** @pci_device_is_reset: device went through PCIe FLR */
> +	bool pci_device_is_reset;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 509649d0e65e..efba0fbe2f5c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -902,6 +902,10 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
>   		return;
>   	}
>   
> +	/* We already have done this before going through a reset, so skip here */
> +	if (xe->pci_device_is_reset)
> +		return;
> +
>   	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
>   	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>   	XE_WARN_ON(xe_guc_pc_stop(pc));
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a62300990e19..b5a582afc9e7 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -23,6 +23,7 @@
>   #include "xe_macros.h"
>   #include "xe_mmio.h"
>   #include "xe_module.h"
> +#include "xe_pci_err.h"
>   #include "xe_pci_types.h"
>   #include "xe_pm.h"
>   #include "xe_sriov.h"
> @@ -738,7 +739,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
>   	pci_set_drvdata(pdev, NULL);
>   }
>   
> -static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> +int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   {
>   	const struct xe_device_desc *desc = (const void *)ent->driver_data;
>   	const struct xe_subplatform_desc *subplatform_desc;
> @@ -986,6 +987,11 @@ static const struct dev_pm_ops xe_pm_ops = {
>   };
>   #endif
>   
> +static const struct pci_error_handlers xe_pci_err_handlers = {
> +	.reset_prepare = xe_pci_reset_prepare,
> +	.reset_done = xe_pci_reset_done,
> +};
> +
>   static struct pci_driver xe_pci_driver = {
>   	.name = DRIVER_NAME,
>   	.id_table = pciidlist,
> @@ -995,6 +1001,7 @@ static struct pci_driver xe_pci_driver = {
>   #ifdef CONFIG_PM_SLEEP
>   	.driver.pm = &xe_pm_ops,
>   #endif
> +	.err_handler = &xe_pci_err_handlers,
>   };
>   
>   int xe_register_pci_driver(void)
> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
> index 73b90a430d1f..9faf5380a09e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.h
> +++ b/drivers/gpu/drm/xe/xe_pci.h
> @@ -7,8 +7,10 @@
>   #define _XE_PCI_H_
>   
>   struct pci_dev;
> +struct pci_device_id;
>   
>   int xe_register_pci_driver(void);
>   void xe_unregister_pci_driver(void);
>   void xe_load_pci_state(struct pci_dev *pdev);
> +int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci_err.c b/drivers/gpu/drm/xe/xe_pci_err.c
> new file mode 100644
> index 000000000000..5306925ea2fa
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_err.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/pci.h>
> +#include <drm/drm_drv.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_printk.h"
> +#include "xe_pci.h"
> +#include "xe_pci_err.h"
> +#include "xe_pm.h"
> +#include "xe_uc.h"
> +
> +/**
> + * xe_pci_reset_prepare - Called when user issued a PCIe reset
> + * via /sys/bus/pci/devices/.../reset.
> + * @pdev: PCI device struct
> + */
> +void xe_pci_reset_prepare(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +	struct xe_gt *gt;
> +	int id, err;
> +
> +	pci_warn(pdev, "preparing for PCIe reset\n");
> +
> +	drm_warn(&xe->drm, "removing device access to userspace\n");
> +	drm_dev_unplug(&xe->drm);
> +
> +	xe_pm_runtime_get(xe);
> +	/* idle the GTs */
> +	for_each_gt(gt, xe, id) {
> +		err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +		if (err)
> +			goto reset;
> +		xe_uc_reset_prepare(&gt->uc);
> +		xe_gt_idle(gt);
> +		err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +		XE_WARN_ON(err);
> +	}
> +	xe_pm_runtime_put(xe);
Is xe_save_pci_state() needed here?

Regards,
Badal Nilawar> +
> +reset:
> +	pci_disable_device(pdev);
> +}
> +
> +/**
> + * xe_pci_reset_done - Called when PCIe reset is done.
> + * @pdev: PCI device struct
> + */
> +void xe_pci_reset_done(struct pci_dev *pdev)
> +{
> +	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +
> +	dev_info(&pdev->dev,
> +		 "device went through PCIe reset, reenabling the device\n");
> +
> +	if (pci_enable_device(pdev)) {
> +		dev_err(&pdev->dev,
> +			"Cannot re-enable PCI device after reset\n");
> +		return;
> +	}
> +	pci_set_master(pdev);
> +	xe_load_pci_state(pdev);
> +
> +	xe->pci_device_is_reset = true;
> +	/*
> +	 * We want to completely clean the driver and even destroy
> +	 * the xe private data and reinitialize afresh similar to
> +	 * probe
> +	 */
> +	pdev->driver->remove(pdev);
> +	if (pci_dev_msi_enabled(pdev))
> +		pci_free_irq_vectors(pdev);
> +
> +	devm_drm_dev_release_action(&xe->drm);
> +	pci_disable_device(pdev);
> +
> +	/*
> +	 * if this fails the driver might be in a stale state, only option is
> +	 * to unbind and rebind
> +	 */
> +	xe_pci_probe(pdev, ent);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pci_err.h b/drivers/gpu/drm/xe/xe_pci_err.h
> new file mode 100644
> index 000000000000..95a4c8ce9cf1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_err.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_PCI_ERR_H_
> +#define _XE_PCI_ERR_H_
> +
> +struct pci_dev;
> +
> +void xe_pci_reset_prepare(struct pci_dev *pdev);
> +void xe_pci_reset_done(struct pci_dev *pdev);
> +#endif
