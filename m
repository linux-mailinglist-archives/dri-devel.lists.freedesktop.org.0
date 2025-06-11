Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA1CAD4769
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 02:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD8610E318;
	Wed, 11 Jun 2025 00:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nS3beO+L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D89B10E045;
 Wed, 11 Jun 2025 00:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749601113; x=1781137113;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8vbF+cAtiWD8XgvyWnqzcT+vZ7SiZNxj59Zq/usUz4g=;
 b=nS3beO+LNlDrsJ5EloOnZwbiyq7m2kdB+u+aAUGP1cUmoSdEjBKeC0mZ
 7Y9EZHX2fUg3tPCEqeHkUY8nM2o7yrX0jrySIVEoOmzYz6LEQS0MMIpZ/
 rcib8Pe4H6GKp6sbi5KIi2Ein1ND4s1zIVDEHQ+j+qYLUQTssoFYmwP9p
 Wu/2/5hFi/fjR8smHIdYmeVXxB5aRaRJMbgwMBZ0qgZNON3kw6NIsQzJY
 BBMSqnUlRi3gQQemY6ar07SNsnNdTFbjRUDOuFRHX+v5flzFzTBpQdRv9
 3uQqru6aYbVJj4JuXeTAteXFkgRWflNIkd+2DdT+V8uVyv09T0sXKhdlG Q==;
X-CSE-ConnectionGUID: 9yZ8GEiZSRaGn+rB9d3qwA==
X-CSE-MsgGUID: Eguxp0LmTTWFZM0FywDjxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51440533"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; d="scan'208";a="51440533"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 17:18:26 -0700
X-CSE-ConnectionGUID: mbIpkJuUSaKc1sU4FSyFJw==
X-CSE-MsgGUID: PjVCw3gGTe+M/sxN66064w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; d="scan'208";a="152138315"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 17:18:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 17:18:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 17:18:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.70)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 10 Jun 2025 17:18:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXNm6E/1LozzUBgevp1TZpSqg06iY8jR8majgdz8qHnTxyyCDmeyF7nFHFXZ5YBllp3538CJdBI9orJb9FJl5gBHfJOHkOUP1VWE//EPlFkk53MSn8s+k/Gi+PmAM61VBqDbmRWvw9mYj+ZMtEfsL9ZtPR1IeV5970+8WDfHle7k5M5Exh6TPMH1ZRNhEdEs5S10FfSQg0LPZBAXhwOUHXSlGyudAmnscLHBNGwCrsIjcIIRfBoGLMwau7Gn3c3rCCZwV9sL33dyHDhnPqeSo1E9uJUSxfmswvd5O+os9KK111yip9WP4t5UokN7l7LT296EbsZzJW9QAudG6tqvUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S40Sv4zvvMRxAs5wgNOy40GVwZPOhgQ1QYnS2M9TvAI=;
 b=JwfAH1GRmzzXipd3C95DjvnfhQCsASBl7KACNBM/rNA8Il2Bu86SlJo6X/y/gYlTTVEn2IE4LqeHZDCGBBbFu3Yi27lvKE4Lso2boQJxLKh3aw7XsqnUQm99CvAbIv6lEMzfVuQO6NXwJPmYocHb1e9b4Hkvzzaa1oXiSq8SxbU9LHbgS00n8MvDOYmLqYEZS8eClwav5edYBFoc3FigwDVlR/5k/EuO5pE2SxyHbZgXJOLmFce1vqkZlV+Q2gC35E0VGP8WfTFzttvjZ3ijpHRz8KR7dM1OvMYktDIin26RepDSXrzR4a5Ic4sWsTNWqoTPndTR5FhhDOZqZqO12g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS4PPF409BB8CE8.namprd11.prod.outlook.com (2603:10b6:f:fc02::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Wed, 11 Jun
 2025 00:17:26 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 00:17:25 +0000
Message-ID: <a51e1b65-dece-4ac4-808d-8749a1a21d8f@intel.com>
Date: Tue, 10 Jun 2025 17:17:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/10] drm/xe/xe_late_bind_fw: Load late binding
 firmware
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250606175707.1403384-1-badal.nilawar@intel.com>
 <20250606175707.1403384-6-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250606175707.1403384-6-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0185.namprd05.prod.outlook.com
 (2603:10b6:a03:330::10) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS4PPF409BB8CE8:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c1a5590-fa7e-4696-71c8-08dda87d57ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEpDTStweXlTcndPRzBtWmkvL0lmTWovcnlWL29adG15U1RhSHlQbVNDZ2M2?=
 =?utf-8?B?NXJWL0RJZXphYUxrSDJTYzM4ZTVMRStwbzgwTnlnc3RzYW9JdGczZzg0bFVY?=
 =?utf-8?B?cHJpMjZ0QjVSRUhQVnpOZEhya2VDV0wvWDlXdjAwaTRmYThZdkN5dEw4clpZ?=
 =?utf-8?B?YUpGMXdhNC9zYTA4ZXltc2JXUUhpOGsrU2hEd2ZzTmdMNzB2L05xYnYrTm5E?=
 =?utf-8?B?Q2lmMkZTbzQ2M2dXUVQ1cVFWZmFLT1ZUVEw4VXc5ZXJLeVFaR2xuYzF3WWxN?=
 =?utf-8?B?KzFxQWdsdkc3bEEyUzZweElRL1dXQnNuVWRYaHU3OStQMEN1VDVGYXd6Sm1F?=
 =?utf-8?B?V3pDQSsxNU9yY0VGejFLYjdiNG9PT1pGanFhYURsQTFEMjdscTFNOEthZUlC?=
 =?utf-8?B?QU8xczE2YTl1NEtDV3R2KzhRZ2lNdkR2b0owT3BxN09rZ1dFYlVyWkdnWGlt?=
 =?utf-8?B?S2plTDhyY0tHbFNaTUp4NTBKSFBQWm1WNjRHdncrTkViQk5xU0FTY0ZUOHhX?=
 =?utf-8?B?eHhwNFBFV051Rlh3Q253Vmprd0hFVXFHVy9OSUVmTGNWdTIrOWRNdlJnYks3?=
 =?utf-8?B?OWRQdjQ1YmhOaFp2QnB1OXR4YUJnRncrUWR5c1pTRGtFVU10S251S0RaUWpt?=
 =?utf-8?B?ZG1QSFl4T0Y2NnNIbmQ3YUtkNXMwVmdvcXQ4U2NoSGpqRVppMTE4bXRYZWZF?=
 =?utf-8?B?V0JGK0lKKzR1b0lYYnF4VXIwUGhKbEVtanVsSnF0NEtUdW1uT0tHeEpDMUtB?=
 =?utf-8?B?MzMvejV2cXBieFNoVUtqZTdXcHBmTk92V3dLbm5pbHVEQVlWNUhQbVd4VW5S?=
 =?utf-8?B?OWg1WXBQdUVqeWlhTk9SS0lhVkhRWVRLZi9peEFoT0hqSzlpNXpDOWVtVjhJ?=
 =?utf-8?B?NzFEeGQvT0w1bjJpOEN0THZma001K1MvUVRoaDFiRWJZemI1cGkxVG9hR1Yy?=
 =?utf-8?B?K0VwYzNVTVlzbFpPR1ZLa2RFdnV5U3RHTEtvaFlmWEIzQmhVZnozYisvdkdF?=
 =?utf-8?B?YnlIMGlEOFFTaU94Vk9vZG9HdW9Gdlg4NHViVHkvYW04ZW8xNXI0Q1FRYklB?=
 =?utf-8?B?aVB3MFl0aWs0WXRic1hqc2FXei9Bdjk5T3dTb3B2ampWdERNWjFvNUNMV0ZK?=
 =?utf-8?B?N3NwTDRPV1d5K1FXNTRnc3BhTEsvaHMwU1ZyRXluUWFCZDd6eXJhUVg5TDU1?=
 =?utf-8?B?ejUzSjd4d09MYnpKNHF5YytpUDJqTmorZVJmalpQN01abGJOaHp4ZDlPUXg5?=
 =?utf-8?B?UkpqaDFJRWkvVnVFNTZIV2VXcHFMM1dONWZQK3N5VkNzSVAxSXVXek01VUt0?=
 =?utf-8?B?S1NwWTZ6Q0NINUpVVkVQQlhVVFA1Z2xyaFZObjRSNE40bndDNTd4NjBHSEhC?=
 =?utf-8?B?ckY5eGttejRMY3VyRVNXRlY2NWNsNW1QSW1CUXM4ZkJrMVFzWEVzMS9FblJB?=
 =?utf-8?B?NExncFlCSFA4TDA3MHJtQXhDaTV6ZTEvQ1Z5MUZKRldzL0NBMXNFTFhCRitx?=
 =?utf-8?B?U3pSZFdLTGpMVnZmVHlJVk00S2psaVBwNDVuQjlVVHJSTFpnTmJ0S0tGVXhD?=
 =?utf-8?B?U0djUEh0Rzg0V1B3Yk1zdlJIZWE0WUMxdDdKc1puK1JYcVNORXFJUTdrZi9U?=
 =?utf-8?B?WkYxWTVVc2ppRHNBcTRtVVhZVGhvZ3BtdXczeDRHN1dXaCtVUldpTTM5R00y?=
 =?utf-8?B?RVlSOHhYQ1p1UlhWQmwvM3haZjJFb21xOG5yQXVaWVh0c0dwUHJ5TC8wL0lp?=
 =?utf-8?B?WWY5VnFuZ2kzZTMwcTJZeUJOd1FYcExxZzVPTG9IMVArSGUwWFJ5S0V3RkRI?=
 =?utf-8?B?RDNHVE1UTkFZWDU3U2I0SkZMUTFnLzVZSGJtWDBlUW5oeXYyRDExb0p1ZlZ2?=
 =?utf-8?B?QU5xamNaM2JLNGFtaTR0WnlpdHNpblNDL1Bwb1JScDIwbHMrcGx6ZlQ4a2E5?=
 =?utf-8?Q?CwaYlW/AfH4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVdaTU9DZE1pbUxIVjVJYzlGMWFEZHpnUzJ6ZWwzMDlVN0I3TS9uaG9BYk1z?=
 =?utf-8?B?cEhLc2dQRVVoV0ZBbUVaUW9vN29FcGI2V2NDblhVNGRLZEpRcXU0bzhlazNx?=
 =?utf-8?B?UDBGbW5BN0ZPZkVhTjF5eCszZ1RJVThuZmRLaStwOGk1WnFSeStRTU1sTlRr?=
 =?utf-8?B?R05uRnpVNUdxWGJSZTIyNW50VzU4aXkrVEtZNkNvQTg1aS9qb254QXBxbEdr?=
 =?utf-8?B?MU9oQ0wwakF2OEVQQVBnWXRRdVpVUjVjVEQwaGxxTy8rT3RaaXlPaXZlamkw?=
 =?utf-8?B?ZTU5Um4zL0FINlJBd3VneU9vK1lqU2pjV3d6UzlZc3dIckNhaVJXb2U4ZW8v?=
 =?utf-8?B?YVlQU3pMMmdRRHd6K29ZN2oycmNRQno3VFhibzk0QURtUTFFa3ZyRXY4a3M0?=
 =?utf-8?B?ZXJCc3Jib1BFNThheU1jVUpFdUJ1cFl6ekpxOUpuNnRTNWYxM2lSWHl0bk9v?=
 =?utf-8?B?MkZNOUcyR1VINk5HTm9TTlRLclFIVXhhaE52czFMOFpFU0o2WVJReDRVM2Yr?=
 =?utf-8?B?b1dkMjM0NGx2bnRYVnpBUmc0eFNOMU9ETGZ5WlVrVVE1N1VqWXQvaGRpTk04?=
 =?utf-8?B?YWx4RGJ3eFJHQXB2WlM2UmdLVXA4MTE0UHVyTWRDSlFKTU1ucFJ5OUpmNU9J?=
 =?utf-8?B?YXhwWEhZejltUzVuUFhPak1FbFBYcVY4UGFTK1UyNkZPd2o1MUs2b0RiSmgw?=
 =?utf-8?B?aVd2U0ZsZ3J2LzV1c3cvZ2tqLzJXUmkrTURrNE1vQmJPbS9NNXRSZjQ0MmlQ?=
 =?utf-8?B?WTUwa2ZYRjRWak8vdnArUVJQK3NIZmxqOWtNdGl5YXhvKzZSbTJUdW45WUpQ?=
 =?utf-8?B?dm1WVERrOTdEMWJlenpnNklZT1hvVVJkWFhadU4yb2tMT0tpdVVIcnFQOWRH?=
 =?utf-8?B?SDNraGx1ejhkcEtZRW1IOFlnS0RJVW8xSFpod2FmdFVnMXRkUis2NVFpdnM1?=
 =?utf-8?B?UGFCOUNZdEdZY0N5Z3B4Z0lQMWZ5KzJGSmhsc0pYc2w0cWI2YWVjSjhMeWpQ?=
 =?utf-8?B?WGJUeHpQWi8vdTBMTkFQVnB4RU4wNFVoZzFzdnhEZXlVdHVRNXZtSW9xa1Nm?=
 =?utf-8?B?K3ZOWVdMSjVjZFVnZmU4MHNsdUZIdlovOCtqVWFkaUsrZFVDMHFtS2NpT3Na?=
 =?utf-8?B?RkN5QXZkU1JtNjFsUGN0Z3dDWDRJTTR5SUpvUW9QcUg5Vjl5blhyV3BucHFp?=
 =?utf-8?B?blN6S0tqWGZoRjVWWFRhbVVSY05VeEIrK2x6ZVVzMlNVNktaVTU2VDJ4MVE0?=
 =?utf-8?B?VUlRWHBZTGpub0FNVCs1eE1ibFFPalZxQUkyd2ljZENHVmRQSW40SDAxRXQ1?=
 =?utf-8?B?dExrTXBIU2NWODA4SjZnNHNlRExCdlVzVEdBbzc1TzJSdmNYL1A5eGNNdllI?=
 =?utf-8?B?UlRhY1BkOXVyWVFvTWpCUFZBQ285MHkzYXY5c0NZZ2I0K3JrQzVRSGFEU1l5?=
 =?utf-8?B?V3R3d25TbGZ4UDd1OXRTR2hQYVBVbUhlblorWE5WWFZDR1lNMENEOW5vVGN4?=
 =?utf-8?B?Y2t6RlJGbGhXQUxpaTJRVzJoMXdrS0dxNkVId2h1emYycml5WW5YMmM4Z3pu?=
 =?utf-8?B?K1prUWxPeVE4d1pOQXFGY0VvdVptOHZ4cTRDc2NhN1VPTEJET2JXRVdzaXJP?=
 =?utf-8?B?NVBtTzluYlFUV0dMVE1UUXNJL1JFM1RRYkc5YVpQQVBCL1BrY1VLUGs3K1Vr?=
 =?utf-8?B?MWtVRDVNdStRVnlEbmRvdmZEbmtlUVcySUtaTElJbFM4OFdKeHBGK3lLOXhF?=
 =?utf-8?B?MGJVaFdBMGQ2SSs3YThiRS9hTGVNWEovRzMvSktVOVk3WithNGg1ZGdYVVNj?=
 =?utf-8?B?TVhJQldyR2FNamRKQUNZTERZaFlocTNDNkRCRDdyVS9Qcmk4OVVWMUxRVHBJ?=
 =?utf-8?B?dm5JSnJHenJ2ZmpYYURHQW1jcWdqMkM4NTAzeTlpU2pJczIwMDJhbkRKQkg5?=
 =?utf-8?B?a0FnbmRKczc4WDhncFpFTWdHNzY2VVJ3dXpYZG01OTYwenJUSlNzN240OERZ?=
 =?utf-8?B?Tm9CVit2MDQyWmpnZWxac3hWdzk1aURtbVdpdVNxcW13MEtKZ3o1OG1DUXNl?=
 =?utf-8?B?eDlzNndxb0FwMkFFY2RoQXdIaG01dk54RENaSmJpNFUwbTZ5a0dNRnpQMGNR?=
 =?utf-8?B?alhOZk1Yc0VJQnVHS2w5dFp0TWpPZlN0WFdoaS9ZZlp4SXpiQ0VLalNmSDBn?=
 =?utf-8?Q?TJMcSyM6ORapwyxvtFNH6VM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1a5590-fa7e-4696-71c8-08dda87d57ef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 00:17:25.7942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WiGhd8v/WDdcn8JV/waWZGPV7pFKPy0jYowRlee0C9uxm0Kl4O5oWOLd0pYqu0LVwzX9/YRBvx2qcEy0uU/CFFyVkpeKqlzUhl/4dHbSyWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF409BB8CE8
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



On 6/6/2025 10:57 AM, Badal Nilawar wrote:
> Load late binding firmware
>
> v2:
>   - s/EAGAIN/EBUSY/
>   - Flush worker in suspend and driver unload (Daniele)
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 121 ++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_late_bind_fw.h       |   1 +
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   5 +
>   3 files changed, 126 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 0231f3dcfc18..7fe304c54374 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -16,6 +16,16 @@
>   #include "xe_late_bind_fw.h"
>   #include "xe_pcode.h"
>   #include "xe_pcode_api.h"
> +#include "xe_pm.h"
> +
> +/*
> + * The component should load quite quickly in most cases, but it could take
> + * a bit. Using a very big timeout just to cover the worst case scenario
> + */
> +#define LB_INIT_TIMEOUT_MS 20000
> +
> +#define LB_FW_LOAD_RETRY_MAXCOUNT 40
> +#define LB_FW_LOAD_RETRY_PAUSE_MS 50

Are those retry values spec'd anywhere? For GSC we use those because the 
GSC specs say to retry in 50ms intervals for up to 2 secs to give time 
for the GSC to do proxy handling. Does it make sense to do the same in 
this case, given that there is no proxy involved?

>   
>   static const char * const fw_type_to_name[] = {
>   		[CSC_LATE_BINDING_TYPE_FAN_CONTROL] = "fan_control",
> @@ -39,6 +49,95 @@ static int late_bind_fw_num_fans(struct xe_late_bind *late_bind)
>   		return 0;
>   }
>   
> +static void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
> +{
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	struct xe_late_bind_fw *lbfw;
> +
> +	lbfw = &late_bind->late_bind_fw;
> +	if (lbfw->valid && late_bind->wq) {
> +		drm_dbg(&xe->drm, "Flush work: load %s firmware\n",
> +			fw_type_to_name[lbfw->type]);
> +			flush_work(&lbfw->work);
> +	}
> +}
> +
> +static void late_bind_work(struct work_struct *work)
> +{
> +	struct xe_late_bind_fw *lbfw = container_of(work, struct xe_late_bind_fw, work);
> +	struct xe_late_bind *late_bind = container_of(lbfw, struct xe_late_bind,
> +						      late_bind_fw);
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	int retry = LB_FW_LOAD_RETRY_MAXCOUNT;
> +	int ret;
> +	int slept;
> +
> +	if (!late_bind->component_added)
> +		return;
> +
> +	if (!lbfw->valid)
> +		return;

The first check is redundant because lbfw->valid can't be true if 
late_bind->component_added is false with the current code.

> +
> +	/* we can queue this before the component is bound */
> +	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
> +		if (late_bind->component.ops)
> +			break;
> +		msleep(100);
> +	}
> +
> +	xe_pm_runtime_get(xe);
> +	mutex_lock(&late_bind->mutex);
> +
> +	if (!late_bind->component.ops) {
> +		drm_err(&xe->drm, "Late bind component not bound\n");
> +		goto out;
> +	}
> +
> +	drm_dbg(&xe->drm, "Load %s firmware\n", fw_type_to_name[lbfw->type]);
> +
> +	do {
> +		ret = late_bind->component.ops->push_config(late_bind->component.mei_dev,
> +							    lbfw->type, lbfw->flags,
> +							    lbfw->payload, lbfw->payload_size);
> +		if (!ret)
> +			break;
> +		msleep(LB_FW_LOAD_RETRY_PAUSE_MS);
> +	} while (--retry && ret == -EBUSY);
> +
> +	if (ret)
> +		drm_err(&xe->drm, "Load %s firmware failed with err %d\n",
> +			fw_type_to_name[lbfw->type], ret);
> +	else
> +		drm_dbg(&xe->drm, "Load %s firmware successful\n",
> +			fw_type_to_name[lbfw->type]);
> +out:
> +	mutex_unlock(&late_bind->mutex);
> +	xe_pm_runtime_put(xe);
> +}
> +
> +int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
> +{
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	struct xe_late_bind_fw *lbfw;
> +
> +	if (!late_bind->component_added)
> +		return -EINVAL;
> +
> +	lbfw = &late_bind->late_bind_fw;
> +	if (lbfw->valid) {
> +		drm_dbg(&xe->drm, "Queue work: to load %s firmware\n",
> +			fw_type_to_name[lbfw->type]);

This log seems a bit too specific, also given that you also have logs 
inside the work

Daniele

> +			queue_work(late_bind->wq, &lbfw->work);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * late_bind_fw_init() - initialize late bind firmware
> + *
> + * Return: 0 if the initialization was successful, a negative errno otherwise.
> + */
>   static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 type)
>   {
>   	struct xe_device *xe = late_bind_to_xe(late_bind);
> @@ -87,6 +186,7 @@ static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 type)
>   
>   	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
>   	release_firmware(fw);
> +	INIT_WORK(&lb_fw->work, late_bind_work);
>   	lb_fw->valid = true;
>   
>   	return 0;
> @@ -99,7 +199,17 @@ static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 type)
>    */
>   int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
>   {
> -	return late_bind_fw_init(late_bind, CSC_LATE_BINDING_TYPE_FAN_CONTROL);
> +	int ret;
> +
> +	late_bind->wq = alloc_ordered_workqueue("late-bind-ordered-wq", 0);
> +	if (!late_bind->wq)
> +		return -ENOMEM;
> +
> +	ret = late_bind_fw_init(late_bind, CSC_LATE_BINDING_TYPE_FAN_CONTROL);
> +	if (ret)
> +		return ret;
> +
> +	return xe_late_bind_fw_load(late_bind);
>   }
>   
>   static int xe_late_bind_component_bind(struct device *xe_kdev,
> @@ -122,6 +232,8 @@ static void xe_late_bind_component_unbind(struct device *xe_kdev,
>   	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
>   	struct xe_late_bind *late_bind = &xe->late_bind;
>   
> +	xe_late_bind_wait_for_worker_completion(late_bind);
> +
>   	mutex_lock(&late_bind->mutex);
>   	late_bind->component.ops = NULL;
>   	mutex_unlock(&late_bind->mutex);
> @@ -140,9 +252,16 @@ static void xe_late_bind_remove(void *arg)
>   	if (!late_bind->component_added)
>   		return;
>   
> +	xe_late_bind_wait_for_worker_completion(late_bind);
> +
>   	component_del(xe->drm.dev, &xe_late_bind_component_ops);
>   	late_bind->component_added = false;
> +	if (late_bind->wq) {
> +		destroy_workqueue(late_bind->wq);
> +		late_bind->wq = NULL;
> +	}
>   	mutex_destroy(&late_bind->mutex);
> +
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> index a8b47523b203..166957e84c2f 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> @@ -12,5 +12,6 @@ struct xe_late_bind;
>   
>   int xe_late_bind_init(struct xe_late_bind *late_bind);
>   int xe_late_bind_fw_init(struct xe_late_bind *late_bind);
> +int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> index c427e141c685..690680e8ff22 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -9,6 +9,7 @@
>   #include <linux/iosys-map.h>
>   #include <linux/mutex.h>
>   #include <linux/types.h>
> +#include <linux/workqueue.h>
>   
>   #define MAX_PAYLOAD_SIZE (1024 * 4)
>   
> @@ -43,6 +44,8 @@ struct xe_late_bind_fw {
>   	u8  payload[MAX_PAYLOAD_SIZE];
>   	/** @late_bind_fw.payload_size: late binding blob payload_size */
>   	size_t payload_size;
> +	/** @late_bind_fw.work: worker to upload latebind blob */
> +	struct work_struct work;
>   };
>   
>   /**
> @@ -71,6 +74,8 @@ struct xe_late_bind {
>   	struct mutex mutex;
>   	/** @late_bind.late_bind_fw: late binding firmware */
>   	struct xe_late_bind_fw late_bind_fw;
> +	/** @late_bind.wq: workqueue to submit request to download late bind blob */
> +	struct workqueue_struct *wq;
>   };
>   
>   #endif

