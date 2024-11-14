Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EBC9C841F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 08:45:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3ABC10E7AD;
	Thu, 14 Nov 2024 07:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eRrznBPN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B0210E00D;
 Thu, 14 Nov 2024 07:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731570349; x=1763106349;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ofcIORvZtqCH4jEItovQAT3hA9e5Vm3kUJINfS41nqU=;
 b=eRrznBPNhKSB2z2H7WEqZ+ddbIFhCYMmhW4OXxpdazWP84g8cZKQej9b
 Zh2b4dCbitftzavWvhIFGSsiKUc7UA9ArL9a7j9tUPVgF2NOblRphYy7g
 jK9Y2c2rRw41fMyNl4IPcgiM2zsypwqEZXqArC+mVhJaSInRCaoDjMaHm
 9JlAY/tCaZ3Rd4xXRHfaDq3eYzJYzHMVZvFaB3NcebTUv1f6BHv1njWYJ
 V4/ttN1HU3hdfGt09sxyDqSBzgfllxOivab+GD5MDGiZDUYA/nTBmUQbn
 1AmAs/QkZ6+yp4N/owWQP235XxXkbrgeOvlG/vXgBjXOH7GB1sAxRh+l9 Q==;
X-CSE-ConnectionGUID: /G/aRC+URkWCUJecTIil9Q==
X-CSE-MsgGUID: Jgv3yR9OTvCKz2V+8MnoOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31673638"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31673638"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 23:45:49 -0800
X-CSE-ConnectionGUID: CZcHlK0FQq2AE/3A8IW9aA==
X-CSE-MsgGUID: 5soVDSr0Tr6r2Fz4Cyy4dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="87874272"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 23:45:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 23:45:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 23:45:47 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 23:45:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d1WEn3QR8tbkFWyZwOp1QsinLPlEufXtTcKcnovoY8QQ0ob/EGgWMClHDrHWpXiJuladdMSKzIZS2Jv3pjxaKK+hwm9wNE/oFKnX2UY0krEmuXYbVuQyLKdT650bRIjOlPvlJVjJ2NuQVhnfQlGvjv2zZlHbfknngskJXvdAoz+uhK5G1hHYrMB3sDYsybJ6KcMPiVy2P7ZjEq/IzLR97t+I3V4R7J9IuNhrd9WOygD5Cxg2p8f2Sy5+5o3W3impGBJZW9xyB/Jpozlvc7Y75wOfi0tLzM1kIWeE7MFSrXippCPnlt/SjBhBuKHm1d7aIHrXPlWaOEx1fNNHw9vf6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUAhIwUYEeZNEi9irMtPk5u4qxgQbYvkIAiWKUn/InM=;
 b=Gmobou/DPXBqtLbdobFvI+BNK1rSXRA07dJWFfegiRaUOeFwO5JyvdBdXp5wM//xGeGRxgNVFhIcaY4UsinlnOS7IudIK2pXI408KmmAzj0+Icjy3FIExHPlbha85b6vvcxj1EfDARrE4ounTSJ1f/fd1X7FBRFbJyuASQx/ej9OSsKzbgwzBHTzLEbZtzG6euwJ8j5sHxGIBjE2X1hPYaO6piKLh2n603keFGAcbbldx2TS3VIG74JVFshykZQGOwC5YXs6fwUAPy4mP1nYka9oKetlxczl99u4zl+BY4Iss2f9RoacXpBK6QcWrxZ4cKw+W9THUBLnGkDBwypmYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SA2PR11MB5212.namprd11.prod.outlook.com (2603:10b6:806:114::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 07:45:44 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%5]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 07:45:44 +0000
Date: Thu, 14 Nov 2024 13:15:32 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Su Hui <suhui@nfschina.com>, <lucas.demarchi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <nathan@kernel.org>, <ndesaulniers@google.com>, <morbo@google.com>,
 <justinstitt@google.com>
CC: <matthew.brost@intel.com>, <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] drm/xe/hw_engine_group: Fix bad free in
 xe_hw_engine_setup_groups()
Message-ID: <ZzWqnIGZEv-_-Lbc@bvivekan-mobl1>
References: <20241114063942.3448607-1-suhui@nfschina.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241114063942.3448607-1-suhui@nfschina.com>
X-ClientProxiedBy: PN3PR01CA0126.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::16) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SA2PR11MB5212:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a7331f1-6def-434f-0ee2-08dd0480585b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1BwcFJZVVhWNkZ3eVBFUE16U2ZPTlF0WUhOa0VyRDBDQlJKRE5JS0djRWto?=
 =?utf-8?B?Z2FEQjNsNFMwOVZYd2JwSzg1ZnhrVTcycE1ISDdNQkNPdWFhcGg0QkQzcStD?=
 =?utf-8?B?dnRXdzRCUmlCcVNNRXFIU1FqTm5WOHlES3lHR01PdEJwWHNNRHg0bkFVWTZC?=
 =?utf-8?B?aG1kZ2N3YThwMlR6dURNWXVXZVcvVSs1TVpZK3RtdjA4TXU4TUtCUU1DSXlv?=
 =?utf-8?B?dG1qNnBsMFpINjBBK0tNbi9qVmpVSXlVdGtwYnc2cjdvZ3RQREszK1VSb1BB?=
 =?utf-8?B?VEROTFppQVYxSGkvQW00ZEpvbCtXMzRPYTBUSlF2M2RveklOUVRaTUwxb2Vy?=
 =?utf-8?B?Z3FrQWgxMUlwTnJTQzdOdjJVR1VLNHZJQzk1algvYUZISDR3STNXNS9IRXdr?=
 =?utf-8?B?ekx0T251Rmx1MnVJWTh2RHhlRFU3V21KTU5GcXZ4SkFZUFJNbFBkVEp0bTZm?=
 =?utf-8?B?SFFISDZwLzZROER1ZVk0SzFZQUpxNjZPemZvZEdnb0swZlY1TmhzWXMwVzRY?=
 =?utf-8?B?T0RheUtSNy8vOFV1QjJsdzEyVHZ3SkRHUVZxWjgzZmdTTGhDOE9LaGZtakc3?=
 =?utf-8?B?WWxzeTlRbTFjV01hRHo0SXdxNGt2OW9qeTdSaXJVVUhYZXpFZVJkQjNGRUp0?=
 =?utf-8?B?Z1JpQkxTNldSaFBXMG00Z0hnWGNiSTQ4c1hITmUxMGZSOXFEK0ZzdDc0OUhT?=
 =?utf-8?B?T3huVUdkTXdZNlFiNTN2R3JMYWlNWEdKeDVGdWlER1ZpSDlwZitvQ2xUclJI?=
 =?utf-8?B?cURtYzdBYzd2dk1BT3ZKbU1zWEVSRm5KWmk3M0k0NVJiVE5GYWgyUmxPM1VO?=
 =?utf-8?B?ZXlrakxOYmgraXplSnJNa0tISHhycHFjVXcvY0pUTEhhaDZkNnZyOVc4bzNO?=
 =?utf-8?B?QnpYYWVsb25nQmV2Ry9IYURhdys0bkhzODBMQ2JlaUFhY0t4TUNhWDNETzEy?=
 =?utf-8?B?V2RJc3pRcHg5TVpmWnhsVDhReitBaGRsL3cvSkdIOW9xOU5DU3VvbG1iVWNv?=
 =?utf-8?B?TlN0UFh0cUZrWU5XMjFpY1F6REhIaWNzMG1FQ3h6QlBOa09nUDE4em1rVjhm?=
 =?utf-8?B?ak9JSm1UVnVhTGd5UGNVLy9BZnBYR1NlTmIrSFhWOWpYQ0EwbmZQTWtJTW9x?=
 =?utf-8?B?dEozbmUvdFdCV1VWV0I5ZUhGL21ENU5GTXllblFkMmZvYi9HK1Nnekx4K1hr?=
 =?utf-8?B?cFZ2NW1GYVg4MXNyZGYrRXBLNkk3dkU1bkZoRk1rK0E4N2NFanp1Q2JibG5i?=
 =?utf-8?B?Z2ZXOGpuckprREJEb0tzSllmWmIvOXMxUnFiR0t0OC8yT1VmT2RyWWFIQjBR?=
 =?utf-8?B?dmJIckZnSGxCWHUwRVozY09mRGoya0JkaWVOcllDSTc1SVE1bGpQa1hSOFA1?=
 =?utf-8?B?TUdSUVdoUU93aVRsR2NFY21xM1k3UUhWNElYcEFWQllaMzY4cXM2cllaWGxS?=
 =?utf-8?B?dDlpS2JEb0tLY1pOV2duVW5RVEtFTGpXeXFHTFZxTW9JM3B5UGpWdFlRQjNQ?=
 =?utf-8?B?NUhzLzFPYy84MVJpRUNrbHV2dnVHT0lsRHAreFJONDl4L01YUlJMdldvL2dI?=
 =?utf-8?B?U0N4Y3NneE9STnFlTHA0TDFrLzhVMms4a0ZEUnFGS2xZRWo3WUN6Ty80VjRL?=
 =?utf-8?B?TmUwOGhMV1JvRzdmQlRlUXlNNzFUWEMwTmxsZEZwejBaTGYxdTVqbzNxVU9k?=
 =?utf-8?B?U2wxU09EMnYxamw1YnhRZllaY0l3cTlFWVNyUGQ4L0RvS042c3hqVFpzS3JX?=
 =?utf-8?B?NHRBZnhubzliL2RiRGhZSnpySG50SWFXajE0TWJGNm1mZ2hsQTU5TExTTVg2?=
 =?utf-8?Q?0Llck0FiA85J+pmiNy1EY6IzwXxBM7G5o1Gns=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE1Lc3AvZWlYdEY1eEJiYXQ5WnU3R2oyVWcrdk1zS2d4b2ZkTmQ1TzI3WExJ?=
 =?utf-8?B?dGNqMCtiOWU1R1N3bzVmcCs1dDRFSU9qakV3KzkwblhTVjhpQUNTQTJxb01N?=
 =?utf-8?B?Q1RjNjlkSnQ3OC9SVUE4OUR1UjU5T3dHNTQ5RkJnNU1jK2RGVFFpZFJ5VXFl?=
 =?utf-8?B?Zk16WUc2TkZsQUlpYlhvWStPcktVVk1xNld2TnR6Mk41Q2puYWZDTXdCUldo?=
 =?utf-8?B?ODBQL29CWUhUQ3BhOTVGRjFJWVlva0p4aithYjIyblRJdVo0NEV3OW1BSjJQ?=
 =?utf-8?B?bmtPNEVBNkZLSUc4UVNjNFFKdGxiRlg5cm5LTmZRSUR3M013OERRMm0vQk14?=
 =?utf-8?B?UFludWVuSDU3S3Z0bCtpdlZqNTFnWE1FdTlPd0tVNUFnbmFPMU5kMm54TTNw?=
 =?utf-8?B?WUwyOTBFVVpmR3dWWjg1Y2dxN2E4aVJ2TDNYN0tXL1lNbCsyaFhXYnJSbC9L?=
 =?utf-8?B?ZVE1eGlBQW16eDJVd3Y5TkFWWXNsSENlWjlWUXA2azNlVW9qREdFTTcybnZl?=
 =?utf-8?B?c1lNMmJQS0tMOGZwM3c5bEVoQjNMTEcyM1ZjRzk3YnVQcUtIM2NxNkZTTERT?=
 =?utf-8?B?dlFZSFgvRnlQWFNHT2NmenNMQjlMeEkxWExwNGRpR05NUW1UcUpqYzFEQ2g4?=
 =?utf-8?B?MUUwNXBuckdtWVNEbDJRdjkwRThZTlBwZkVLY2R0VHU4Y3k2aml1SG8rTU1i?=
 =?utf-8?B?WDQ2U3BRZjBGekJXQ3ByZm5zRHFrblhJc1JteHEvNElMMzVNNmx5T0tQYjMz?=
 =?utf-8?B?UTMrWGZCZ1k1QjN0RTlBSXB6VUVZVGtpWGcrRHpYRXFiMGlVM1poV25vclRt?=
 =?utf-8?B?Y2QrV1Viakg3QUdGRWZZMGJSU2FOdjRYc2MxODg1VWhDYWVHRjJTNnBvaUlF?=
 =?utf-8?B?VkFTMmhHR1NRU0JxOEd4YUJ2YXl3cFlZdzQ2b3hVVnVzeis2VzI3cDdIQklK?=
 =?utf-8?B?UzVOV3J6N1JPbVN1aUJMTUZPUG53c0R3VnFBZGpMdmVGanR4VndxY2VMeHho?=
 =?utf-8?B?UDNTZDFXamhDdWhxNDgyQXd4dCsvWFNBTGs4V3R6czkwVDRLRlNwNHNnbkpN?=
 =?utf-8?B?MExwMm84ZFlwUGcyelpwamptMVR1YnY1cUE4ajBNa1d4YUhnY0NURUdTKzhT?=
 =?utf-8?B?ZUJPazNaVFhZUEExSVRZek9jdDJnZXQrYkd6KzJpc29WbEwwbnhMNFJBKzRS?=
 =?utf-8?B?ajhpRk9vcndCWjVkdm91dlU0ZWJQYzBFeHRlbmxvekRYdzlTVm95cWt4dVNo?=
 =?utf-8?B?ZHZuOGNjZmRXSEszMHZPeE5pQjA2UXdTMnF0ZVBINUFaVTB0d1ZheEdNUnY2?=
 =?utf-8?B?WkJXWFlqNC9iTW9od3JjZUdhb05wVjRDVU5UaFdTMEUzZFBySko3MHAzUmEv?=
 =?utf-8?B?OEUxNG9BaTMvc1ZzWWV0b0xXMlQvTjd0b1dMMEMvYUlZNjMxWlR5TjBUak5w?=
 =?utf-8?B?WVMwUklhaVpKMmpZcXVrTGNxSEZWMUQ5WnpLeSsxT3pvdTJ6dThmYm9NWFZF?=
 =?utf-8?B?UGFIQ0h4WUc3WENBQndTcGo0NHpWTTFCNTBDckpZTWZoQm5qUFJJSFFWT2ZQ?=
 =?utf-8?B?OFNYNXZ5aUlkeW1SUGhWeWRZSnJRaTJLR3gwbFg0TitDYVhjSG9mTmRDdEZk?=
 =?utf-8?B?VXN1QkRIY3k0ZzBUM0FDdHlQc1d1dGJPaXFBWEhzOElQalpmV1dIcUorc0RK?=
 =?utf-8?B?STYrY0xwMUVTSTVGTW1VM1NIMmpSUUFpU2R0cHhkK3hCSGVycDJHVGdBbEFD?=
 =?utf-8?B?aDR4eE9Nb0QwM2oxY21QbTBIb012MG1zZlBWNS9GK2txZzAwNU9JMENVSCtC?=
 =?utf-8?B?QUEvZEVMQUtNTmF0NXVmcFl2WHo5L1dkUmpCdGFsbURuWit0YW9UNXJHRFAr?=
 =?utf-8?B?cEtJMjZYN3pRZ0x3S2lta0tWV25HT0hXRkl4SWZDb2QwbGVDSjI2NTd2bGlP?=
 =?utf-8?B?MjRVY0l0TlFkSDBKZE4ya2QzSFdPQXVZdkhuREVOMFg4dllTZFVyN3dzbEJt?=
 =?utf-8?B?NkVXVWp6TllBbHNnRkdpcGhKeGlKL09OQ3pvcE9XbFA5TDVyVnZqOEo2bVli?=
 =?utf-8?B?SmJYQnJOV2RQaVJ1YzVkMlVuUC9rMnV6OG9HVFh0OU9qWUhWK3dMbmhYQnNu?=
 =?utf-8?B?LzMvMHBjMy9uMTZIV2pVRVJHUVVvK1BEbXZFUUdiejlzdFZESlkxdVFtYzhY?=
 =?utf-8?Q?Sop93pKxcqQkWqGhZT4YR4s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7331f1-6def-434f-0ee2-08dd0480585b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 07:45:44.4726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7P3r9EAEe7JDfABPBt04nb5dZLNWQFb2ssBGFvQA0WSoNrRkcqRkFYlVN+3tjRygAklO9YbQJ0rxJl9vpXKM0WwmPY4S2mWTALTczeol9T1evwoOqflU88d+0vh9G9pL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5212
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

On 14.11.2024 14:39, Su Hui wrote:
> Clang static checker(scan-build) warning：
> drivers/gpu/drm/xe/xe_hw_engine_group.c: line 134, column 2
> Argument to kfree() is a constant address (18446744073709551604), which
> is not memory allocated by malloc().
> 
> There are some problems in hw_engine_group_alloc() and
> xe_hw_engine_setup_groups(). First, kfree() can only handle NULL
> pointers instead of negitave error codes. When hw_engine_group_alloc()
> failed, there is a bad kfree call for negitave error codes in
> xe_hw_engine_setup_groups(). Second, when drmm_add_action_or_reset()
> failed, destroy_workqueue() should be called to free 'group->resume_wq'.
> 
> Free 'group' and destroy 'group->resume_wq' when hw_engine_group_alloc()
> failed to fix these problems.
> 
> Fixes: d16ef1a18e39 ("drm/xe/exec: Switch hw engine group execution mode upon job submission")
> Fixes: f784750c670f ("drm/xe/hw_engine_group: Introduce xe_hw_engine_group")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 31 ++++++++++++++-----------
>  1 file changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 82750520a90a..ee2cb32817fa 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -51,7 +51,7 @@ static struct xe_hw_engine_group *
>  hw_engine_group_alloc(struct xe_device *xe)
>  {
>  	struct xe_hw_engine_group *group;
> -	int err;
> +	int err = -ENOMEM;
>  
>  	group = kzalloc(sizeof(*group), GFP_KERNEL);
>  	if (!group)
> @@ -59,7 +59,7 @@ hw_engine_group_alloc(struct xe_device *xe)
>  
>  	group->resume_wq = alloc_workqueue("xe-resume-lr-jobs-wq", 0, 0);
>  	if (!group->resume_wq)
> -		return ERR_PTR(-ENOMEM);
> +		goto free_group;
kfree can be directly called from here followed by return, instead of a
goto.

>  
>  	init_rwsem(&group->mode_sem);
>  	INIT_WORK(&group->resume_work, hw_engine_group_resume_lr_jobs_func);
> @@ -67,9 +67,15 @@ hw_engine_group_alloc(struct xe_device *xe)
>  
>  	err = drmm_add_action_or_reset(&xe->drm, hw_engine_group_free, group);
>  	if (err)
> -		return ERR_PTR(err);
> +		goto destroy_wq;
There is no need to clear the resources on failure, because
drmm_add_action_or_reset takes care of freeing the resources on
failure.

>  
>  	return group;
> +
> +destroy_wq:
> +	destroy_workqueue(group->resume_wq);
> +free_group:
> +	kfree(group);
> +	return ERR_PTR(err);
>  }
>  
>  /**
> @@ -87,21 +93,19 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
>  	int err;
>  
>  	group_rcs_ccs = hw_engine_group_alloc(xe);
> -	if (IS_ERR(group_rcs_ccs)) {
> -		err = PTR_ERR(group_rcs_ccs);
> -		goto err_group_rcs_ccs;
> -	}
> +	if (IS_ERR(group_rcs_ccs))
> +		return PTR_ERR(group_rcs_ccs);
>  
>  	group_bcs = hw_engine_group_alloc(xe);
>  	if (IS_ERR(group_bcs)) {
>  		err = PTR_ERR(group_bcs);
> -		goto err_group_bcs;
> +		goto free_group_rcs_ccs;
No need of freeing the memory here and in the following lines as we have
managed it through the drmm_add_action_or_reset call in
hw_engine_group_alloc.
We can simply return the error code.

>  	}
>  
>  	group_vcs_vecs = hw_engine_group_alloc(xe);
>  	if (IS_ERR(group_vcs_vecs)) {
>  		err = PTR_ERR(group_vcs_vecs);
> -		goto err_group_vcs_vecs;
> +		goto free_group_bcs;
>  	}
>  
>  	for_each_hw_engine(hwe, gt, id) {
> @@ -126,13 +130,12 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
>  
>  	return 0;
>  
> -err_group_vcs_vecs:
> -	kfree(group_vcs_vecs);
> -err_group_bcs:
> +free_group_bcs:
> +	destroy_workqueue(group_bcs->resume_wq);
>  	kfree(group_bcs);
> -err_group_rcs_ccs:
> +free_group_rcs_ccs:
> +	destroy_workqueue(group_rcs_ccs->resume_wq);
>  	kfree(group_rcs_ccs);
> -
All these kfree statements are not required.

Regards,
Bala
>  	return err;
>  }
>  
> -- 
> 2.30.2
> 
