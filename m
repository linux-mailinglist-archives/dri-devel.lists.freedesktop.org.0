Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525678BF242
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 01:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F01811273E;
	Tue,  7 May 2024 23:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0GKWOZY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D36F11273E;
 Tue,  7 May 2024 23:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715125546; x=1746661546;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RiUo7giwUvX+hXP6c8ZTzdl2WOWVwrNKympsEKX+McM=;
 b=n0GKWOZYPdc7kTz63s1CwyVKiIqFKt+Tz4cytSsWdPcAffFvKO+4F7vc
 gpYiQqZUQ6BWSXTT42k2cDQHHe9VDxU+oT0fyH9eVkiBzZ6wu9bsqyUoL
 ZEOPvuEjX3FS//dO3rH6OyEx80E7gftT7W3A30D13sB2se3EZ1yrpF7JL
 hHJe6n4FuHLfxpSynx7w2MbK3T4eSpxIY36tWahsxNqMf1vxDDRorXtSN
 Z3iCDxAI77pie6EZxOz5IcqIXc0Fl7h1YMBZtcnCRMZWK89Pect1+xmHI
 rdYKjSGjtnKl0T04c87kogHT9hKby9OUbgbdDgQkAADS6x7r7I7qZlhbT A==;
X-CSE-ConnectionGUID: kd6lCJ2aR2GR02mRfIRe/Q==
X-CSE-MsgGUID: 7hVmwRNdRWedoydrG88Kgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="14750821"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="14750821"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 16:45:45 -0700
X-CSE-ConnectionGUID: oA7T1+lCTESbXwIE/euL9A==
X-CSE-MsgGUID: teMOB9WXTSSHbX4mEhV0wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="28556172"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 16:45:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 16:45:41 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 16:45:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 16:45:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 16:45:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsrarxcK+oxhYzccqMJDa4BwcOxfdH3YTfaLg7KawGMiUTT45ZzLWoFEpyVqD6GbPiwd+u+PgPTSMHEBrPeim5vK+joNBEjyBnqwfzBJvbI6bHBwXUS7yquY44UpUuBpQ598Hmc67ecVeMAse6zIp5Ie38LPS4Ub4g2OP1CAQbfOlFCrZT/ocbFBidVlmgpHOC/zBz+pNzwFCXRDp82cofOah+H/5mUErc8gWYcqeI60oxrDn4x66BE67N8cGH0nwy2/mKpcnQ3cDa57bZca6RP2YZ8aU09i5KhekasI6X35B6aiIELU6I/Pr8hbCenp7A7v2mqOUs/COXprIaeIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJ/UK1ny4bRBdQ494bfUweWk667CyC6OXUBFE1nkKnE=;
 b=OBx4rbJ6JqlHpfnC9iOzrb8GH+mIOr/Uwz0QBRdhZ8Qr9yHVstI+LUWwV5zeOWZ8UWDQtu8A95NT8CoNamivOpNUTUlf75dCc0Hx1Vqw5xircEHyJL5E3J6BUVeDpmDhUN7jAqZGn9laa1myCzKtTwMF8oo/leOoTatNOSIJjkbZhrUxXB/G7pWMtMbGu64okGTvVu0nm0whnejwdm5bDiJP3HVKcZHenNxZB9qp8IbDhXAtXFkFTyEC7NMTLLmNY+IJfOCw6uoBHU4r4CB8XoTm/01BxolNxiT/m/8vJllVAMInmtaJBmbV6Yrv495nuEqPsgyprQiC3XiYNBdTpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW4PR11MB5911.namprd11.prod.outlook.com (2603:10b6:303:16b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 23:45:38 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c%3]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 23:45:38 +0000
Date: Tue, 7 May 2024 16:45:36 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 5/6] drm/xe: Add helper to accumulate exec queue runtime
Message-ID: <Zjq9IDk2xKtuOUYT@orsosgc001>
References: <20240507224510.442971-1-lucas.demarchi@intel.com>
 <20240507224510.442971-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240507224510.442971-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:303:16d::25) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW4PR11MB5911:EE_
X-MS-Office365-Filtering-Correlation-Id: f6616d24-36d1-4f73-7fcd-08dc6eefcc2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVFucVVCVFlEbXJuRWVQVEtXOE1TSUthUlNraVVidGM1cGF0U2M1L3J6d1d3?=
 =?utf-8?B?UmIrWVZmOUJ1K1ZYN1A0SXU2a0UvK2lZc0QyTW9GQzRiRkVTelVuM1NYQXdC?=
 =?utf-8?B?Si9LeFc5Ri9FQ092Qi90ZkU3aVlnbUZyU2ZwTElvOXk0bXhITXhqd01JQm15?=
 =?utf-8?B?SXpyMTI0M0h6eWw0YW13WVRpcVl6UFdXMnpmU1V0dWdYdXlQK3pBZUltRGRC?=
 =?utf-8?B?NzhJVTJhNlcxbmNtNXV1Y3J3b3RXdzZ6SzZCOUhBSklwcmJ0VDNFVHBoRDNW?=
 =?utf-8?B?T2xWSlJlY0FMWVBhYmpxQ0ozMDUyNlI3a3JtRnlvWGtzZUJJVzU3OEh3WTBh?=
 =?utf-8?B?ZnpoOWozZTJraDdiUXJ2WWJPTHljclZKbWtuc2NtQjROcG9BdC9lODZJRFhx?=
 =?utf-8?B?UVhjKzhoYVFIZjRHUVc4OUxwZlFVZFhmS1NVcHN3WDdRL29JMCtucDE3Q3ZL?=
 =?utf-8?B?WjlhZmUyZGtIV0s2ODVpYlJ4U3h1dDdJSTQ4UFVmYTJEcjVNZ0xRRzlnbDNy?=
 =?utf-8?B?VTFSRkttelBvNFlKQjRaRUFmWlhmM1VLRVJTanpZSGhxL3ordTFhazExRUph?=
 =?utf-8?B?WjU3Unc3ZXRJdlhBWHN0NGZ2ZHZjazJPVUpCR08wS3BTWnduWjdGZ1R3N0dx?=
 =?utf-8?B?SjhxdmtISzI4RXFwcWZIcVo1ckZubzBvM1k4amN0NTVURFlBek50ZTExNWlD?=
 =?utf-8?B?cURiTmtNUGVOTm9rNWY3NlRRYXlRdkZNT2JaWkdtMk9nc0VodTkrU1dvcGFs?=
 =?utf-8?B?c3BCL1o3UW1PV2dMTzhISklqcE56YWhyZm9tZmxLT0p6YkIyVnh3ek9rWmEr?=
 =?utf-8?B?Ulc5RkhHTWtsY1JmN1IzdHJ4WTB4QkdWQURUc3d0U2N2dXJadStMWmVlSkFM?=
 =?utf-8?B?WWJlU2pFaFZIblBsa2g5UnMxNGJud0pqMUFpVnBmaWcxQXRQR2o3d0JjN20v?=
 =?utf-8?B?NmpaZjcxbitOUTBFRjhmTE9NbVRtRVcxOTcyYUNJWkdMT3hZVEtqb016cUdP?=
 =?utf-8?B?SmJVZW8rSXJSOWVuMVBENGNjVjRHM1FsTmlnQlVqUDZzWEFYd3BQN1ZyUEUx?=
 =?utf-8?B?TkI1QlRpdHRWcUJUSVV2ZUFta0VTUTlPcGVZN1JKajhhUjV3dDJpRjJ0NWY2?=
 =?utf-8?B?d25SSC8zaUQ2K2hCOExRYXlKSmM5VDgyS2VhbnNqTktiUmNXeFdMcUM3OWIw?=
 =?utf-8?B?cU5vSFhoZXdxcnV2NmhodWVOZXFOaGd2djUrb1VrYVR2bWp4N0lCc1l4T3hs?=
 =?utf-8?B?ODJQUUFOUCtEL1M0QmNmTGdtQnhZQ2ZWSGNmanRJMlhaK3AyQWdFNVZzM1VT?=
 =?utf-8?B?b0luVEpmRWMrR09vU2d0WWo0UjlxNGR3VTE4dWw0bVR6VFhaSlMyRFV3TmxB?=
 =?utf-8?B?TFBPVFQ3V0N1OTlZeTlhMEN4VG52aS8va1ViOHlJVS9BTFpjeVRlOVRZOEUz?=
 =?utf-8?B?VnFXZ1VJS2RjSUZhOGdCVWxhdWlUVjNmOXZSV09OYmpXcUs1ZzAzQWdsTVFH?=
 =?utf-8?B?cWQ5NU1tWm95azhVQ042QmpENzJEcUZTMTEzNXpuOVRDbTA2UEg5elM2TmUx?=
 =?utf-8?B?QmdwalNGWXJCd1dRT1lzSGlaY0VSU2Z0QlVaQWpTdkdNWTZIdHYwWWd1V1FX?=
 =?utf-8?B?TitUSWpFbWY3TU0wd2ZoMjZTSXJNYU94bDQ2TGZHanlzd0x2cG9tTURKTlcx?=
 =?utf-8?B?WVFxcmFtTFZqQm5uSHJUaWF2UVpsREpXOWZyT0J5U2ZBN1ZNZ2JqQ1B3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UThndUF0MkQvbG9USVZtM1gxWkxQbjFqc3NGa1g5K25JRjB2YnVyb2tCV0lL?=
 =?utf-8?B?djBaMngzSnFZRmFQMisxdGFQWGlEcU5NMHdmbUlxZ3ZoTUhZc2R3OThYdjAw?=
 =?utf-8?B?NDhaREFUbWh4TENiYkZUSXNuNERiK1VScGMrTDM2ZXFsN1hvM2pjMjhZaEJZ?=
 =?utf-8?B?bmFFdTg4ZkJjcDRGZFhvM3RYOHYrdE5KTzBzMDcxN3k5TUhxWEU1dUdlYUpJ?=
 =?utf-8?B?T1N3SlBWV1E1bFhDOWNPVC9OZmxTamgwMEQweFU5R2Y1MHZoSDllU21RK216?=
 =?utf-8?B?SjVjaTNObTdRS2plVTIrVmFkZXFzVi9OM3VCYjNmWWF3bjVyeEZMcGpZYytR?=
 =?utf-8?B?a1FIZ1VRSFJyM0JsU0VtSjl0dW5EVk1iZnlpRkdid3BGR1VBcDVPNmc2aERj?=
 =?utf-8?B?R05RV3dpRFUzWlIxZmdTN251emZTanllbGdOVi9LalRnZHZUU2tvOUkrRHVY?=
 =?utf-8?B?S0FJdTZXWmRHbHQyc0dKYXZFeE1CNEYvLzBMRU9MY04vOXFGQmFxQ2wrbUM2?=
 =?utf-8?B?Z2JOUjRWdzNoUy8rS2g4dG56R1B0U0RMV0p1YXpWekdaOVgyWkhsMzVNT2la?=
 =?utf-8?B?M2svNWRwUk5YMURUbFRpanJyT1hTNmdlTjlrU2xKVytBcWhZVEpVSEI0MXli?=
 =?utf-8?B?ZmtzdG1yQWZMV3dCYm90dzlhYk51UGo1VUZEYzk5a0twSE5Reno4b3FXUVcw?=
 =?utf-8?B?Q2ZLV01OUmczbytwTlJTRDgzVmcrM3NyMkVHNDV2MGw2eEVrNVdtamhoWlRK?=
 =?utf-8?B?dUQ1VXE1eDRTTDRLcW5MM3hkM3pCNys3bm5PVlI3QloxeVIxYkVrUFhiL2pD?=
 =?utf-8?B?VWZ5bGxISEU3M3d1K2hjenM2Z1ZUbitSaE01QytUVm9oMmZWUG1Kb2hzeXAy?=
 =?utf-8?B?SjZkcGo3TWRhNFNPckhwNC9SR21qWVZnaytsakJNdDJ4eCtDbW5yck9naXJi?=
 =?utf-8?B?alp3VTRkTzBsS0ZzWUIyaXRvcFRMVW1GSHZwbXRMMXpMRDZXR2hiQVlBcmJx?=
 =?utf-8?B?OUVBVjBQK1Fob2NtN25CQyt1dlMxZzFPOStGT2J2VnlKL1dBdXk5MHNncXpL?=
 =?utf-8?B?NnVSaFFqTUlFd1lvWlVMeEpNK3lnS1cxK3MzTEcvTENpVGtMS1UxbHdDVWFL?=
 =?utf-8?B?UHlYWk91enJrNzFDMHVUUytKNmxOZEpmOUx2K0o0RXBtSGRVQXlDNFRweHgx?=
 =?utf-8?B?QXFVUkZoUC80SlZiVmhnaUpOcnhBVVNlRm1UN2xyUnJienBXMWkvQm9tZXNx?=
 =?utf-8?B?ZGNkbTdjY1cxb2w0Yklkc01BN2hkYW5PY2s1eXY2anlERmxyVkFpcTZKVWxZ?=
 =?utf-8?B?NVhEZTlIQXNqSzVhNHFkVDRnU0VBaVhLclc1R1JvM3c4aEEwaVVuSXN1b3dp?=
 =?utf-8?B?VXg5WXNBbVBwSUNsbExrQU15cElyQm54emhEQlNDV1MrS3pweHpEdFBTV0Iy?=
 =?utf-8?B?dHdwcUo2Qzk5ZWs1cjNMd2tXWmYwM013ckdQZUhzNnFJUW5qa1ZCVzZ0YXJJ?=
 =?utf-8?B?VEZpMmxrbVJCMU5DcjZNM05BNnVvSUt2aEt5RG1kUXNmU2wwdU45OW9rZzhK?=
 =?utf-8?B?NUozMGhzWkh0QmduQmZPMlFIc2NjSWNUbjhFTHlRTG9HcUZBUk5XVUlWYzhi?=
 =?utf-8?B?T2M1bTY3alV4NG16cGozSXVTMHYrN1BwaW01NTB6TlhSVDdrank4MzBPWWJ5?=
 =?utf-8?B?YVFnWUhWVG9yU1pyQVVWRyt3a1dwbE53ODRXVXVqMU5TQW4rUFpzWStZSlZx?=
 =?utf-8?B?SkFDRW5xdUlIa0dNSkM4bCtQZGFuemRUOHJCZzhSUmNWQ3dFTnhndkhwQXhW?=
 =?utf-8?B?WDJnMGVpT0RaUTNOa2QyN1c5T0oyMDBET3A4YnN1TEpNUE8vTmY1N2wwRVZY?=
 =?utf-8?B?Qi9WRTlnSENuVVZJdVhjQU1KSkZaM2hVdStNSU8wVWYwZThtdlgvQlF6VXNE?=
 =?utf-8?B?REdrR3hIZWFkWUprVVBoVHd5a3VrRXFkMEU3UDVtaU04NkNITTdtY2VqaVVL?=
 =?utf-8?B?MXRWS0VacjVOUi9lSVp1WmFKL2JwUEo2aXI1WldSZlEvOFhEbVBVTjJwTFpE?=
 =?utf-8?B?QnRpYmtQQ1JSM2JEcEdFdW1XUG50SnkwdTRwMU5ISDBHTHVLY3BZQ2ZSOVl3?=
 =?utf-8?B?dTJWK3c3bEtiSjdINmh3WTB2dUJpYUxwQnRZUk1IUkEvR0ZYbEZsQVgvSVJV?=
 =?utf-8?Q?+kG2ZYLVKQUAekha5vM/27g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6616d24-36d1-4f73-7fcd-08dc6eefcc2c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 23:45:38.6444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gyKKrSmvdhsQeeQF6eeDiU203lDEUEFDusM3X18BU/Im8fo7NhYAM9wumvB2WPxV2HDkwEKhDto/5FwNsgHN8SWCUkdO6l4XQoKqkVVF5bA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5911
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

On Tue, May 07, 2024 at 03:45:09PM -0700, Lucas De Marchi wrote:
>From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>Add a helper to accumulate per-client runtime of all its
>exec queues. This is called every time a sched job is finished.
>
>v2:
>  - Use guc_exec_queue_free_job() and execlist_job_free() to accumulate
>    runtime when job is finished since xe_sched_job_completed() is not a
>    notification that job finished.
>  - Stop trying to update runtime from xe_exec_queue_fini() - that is
>    redundant and may happen after xef is closed, leading to a
>    use-after-free
>  - Do not special case the first timestamp read: the default LRC sets
>    CTX_TIMESTAMP to zero, so even the first sample should be a valid
>    one.
>  - Handle the parallel submission case by multiplying the runtime by
>    width.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++
> drivers/gpu/drm/xe/xe_exec_queue.c   | 35 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_exec_queue.h   |  1 +
> drivers/gpu/drm/xe/xe_execlist.c     |  1 +
> drivers/gpu/drm/xe/xe_guc_submit.c   |  2 ++
> 5 files changed, 48 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 906b98fb973b..de078bdf0ab9 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -560,6 +560,15 @@ struct xe_file {
> 		struct mutex lock;
> 	} exec_queue;
>
>+	/**
>+	 * @runtime: hw engine class runtime in ticks for this drm client
>+	 *
>+	 * Only stats from xe_exec_queue->lrc[0] are accumulated. For multi-lrc
>+	 * case, since all jobs run in parallel on the engines, only the stats
>+	 * from lrc[0] are sufficient.

Maybe we can drop the above comment altogether after the multi-lrc 
update.

Umesh
