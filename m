Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C3BCB5A16
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 12:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE9210E1ED;
	Thu, 11 Dec 2025 11:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6OasHmT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF27310E058;
 Thu, 11 Dec 2025 11:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765452289; x=1796988289;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L97Z1ZsEO8p3NMSyiIS62t6PtIBJm6xz/HxQKG/7Vb8=;
 b=j6OasHmTHC6xK20v7S12kCyI16KZtfIU2eEIX9zS8w8Z00zDageLnpwP
 eHaK62pPHXP98/BCsYtXu80wNka4wLrU4EVoQDqwABdPymwqykbDswAen
 G2k6vkv5mpeX8wjWbf2R1lectljcRSHr82GKDtvQpuhKfztCTIebp7v5m
 f4aP1qOiBg0whdSwsNgMM2QeZcyA/rLdF3NabDE+ZAkAQJ5cSnAN1ZcVl
 Pg9V5zhS6S1uZr44819LWK2+Rwt7RABW4H0RRBGNSfB9G3u3y0njKlwb5
 JdNi5ccr0i7O9cTV83FofAoSu/h8f4PtLX95ONe0fjwPJG9/lUjbTeJ7w g==;
X-CSE-ConnectionGUID: sFVW6pJPQTWr7EuLWFkSCg==
X-CSE-MsgGUID: c/fKo4WbSJ+oK68r7rvO6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71277581"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="71277581"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 03:24:48 -0800
X-CSE-ConnectionGUID: 2pTPHAHJRumYarQyYgA2Tw==
X-CSE-MsgGUID: q8K49DyTR2W+0wj4G9Wg2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="220141974"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 03:24:48 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 03:24:47 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 03:24:47 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 03:24:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tra2AYrY0FTJ2E/mCwmKzW5HMK7FiDRBxHot/wBv+zj8pmL+/7T0NMpuz1J2qVcq3RLdNzuy1+uxnjUjqroD8x+9AyHIjQYp/IRXpOrfNepDXDgfEIZlMEXRm//L/kWYCM5XLUhruYxIiyXGVEJx33fSoBB7A8ByFw03CiT2GbrzvyMGgF5NM1CKifbLk8/t7ISU6RI601+UMMR3dzsb7jdjIAD04vIpnZWGpjJNj8evWpofD8u5qkgA8Vha+/wk+90L3l8zlVEWH/cVt6rZPnQZwdD0OdCFogFXeyH+RNeiIW0DneNLvAPe3meISbxt4zxap9Zl32yZVJ6YE44nBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QY97rjXZjIEYivzK8eUULJHOPSpfmHpWHN8axuplIaA=;
 b=dimaknyTMhwFymBNBjJkA24iTKy3pplF3AD1jUQM+h98qL0oDhKjKU6LQfCIVeWUPUeBe5ALAGSOrQNjPSzbi1LpurBKS2ABdVB6SZj1v6va1KRnhcZAbLqc6UDnftWMiOh2Q8CjWx3f0WAfefjl8jku3aJnc52ckIXVzQd0qH5RlVuOmrHsEiTMSQncWFA7sQQScR6oJ2TY89m2NG9vVLz9D/ZWHwoH6hFu7yIDTRVxK7zcajwiHcoNh+PuQYv6eOgCO8HldI7i9xs7E45sIer8Fh2ttWLITQ9/98PKu206Ye3XmczNcN+EmPAEc+TL1NE2Oa1gyMsiZqbJu75XrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CH2PR11MB8815.namprd11.prod.outlook.com (2603:10b6:610:284::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 11:24:45 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 11:24:44 +0000
Date: Thu, 11 Dec 2025 11:24:31 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <stable@vger.kernel.org>, =?utf-8?B?6rmA6rCV66+8?= <km.kim1503@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v3] drm/i915/gem: Zero-initialize the eb.vma array in
 i915_gem_do_execbuffer()
Message-ID: <ezfzff7burfabd2b4ofna5pmue2m64zn3gin2uyefnk7fczizk@f52nhwgfliyh>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251210165659.29349-3-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251210165659.29349-3-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: TL2P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::12) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CH2PR11MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: 5359104e-f3a8-4727-ee0f-08de38a7e2a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTFLcGtTNWNUZWlRbU5jSUx5Vk1kRWRIbDlHeFp6dkJub2ZJRFptbnBsN3c5?=
 =?utf-8?B?WjJMUXRuVE5wbC9PMmFYUzRjZVJuSUJWLy93cy9TREdnTjRQMk0vSGMxT08v?=
 =?utf-8?B?KzlWNjRub0ZyUnkyODJRZytzSEtJZXlNWWoyeTByYnNQcGI1QW9LUy9acUts?=
 =?utf-8?B?Tk9uaWhqSFRIMzJBU29wOVR0a2NEcE5hMzQvMlp5c1ROclNkTnFpQjNFaTZo?=
 =?utf-8?B?R3JiYnE2RlRzY09YQkd2cU1qZ3NpKzJVaHVDN25QdGJvQVVldFBGRnQwMExn?=
 =?utf-8?B?MTc3VGVieGRERWMwb3NkTWNlSWFBdmJjMFVGWk1oTThPSWZLVWx6eWdrVUxq?=
 =?utf-8?B?a2tJZG1tY0Q0YkxlejkranZOa0VhSXU0L2w0QWcwN0FMajlZc2Rqb1NVY1Fx?=
 =?utf-8?B?YVVOY1ZrT1NKZk1sTWErM2Z6Zk1KcHJIYjRtQitpUjE1emcwM0FwNEh1TGl0?=
 =?utf-8?B?VUdXaVFEeVlRVDNJYXhrakpDbFpDNi8yUldEc05DY25CZklvY2RRcTN2TXVw?=
 =?utf-8?B?MmJsamhxQnZYUVdtd2w0NjNuYm8vQ1Z5Yyt5Q1J6MzRtV2haSm9tWnAwSENl?=
 =?utf-8?B?dVduNjAvZFRtQW9VOUhsT0xBejRWc0pjZXdLYlZxbkpzSEF5RFN2Z2pLaENG?=
 =?utf-8?B?andnOHBoNlB1Y1I1N3lYMS9veGZ0TkNPRWdoQlJBQzFSSWhaUVpSWUgzcnZY?=
 =?utf-8?B?U3ExMlBYMWt4K1czS2VzUVVhVzhlcVF0dlorS2JqbXl6VnFDdkxiMGM0WXZP?=
 =?utf-8?B?UHFYRHFoMjZRalpYMVVoK3VCem13clNpSjJEMzdyeWVTS2tOM1dLckV2RTVI?=
 =?utf-8?B?OEdBeVJFOGozT20zZlRidHhiUVdSUVRpYmM1WUFTUjdydEVLdDFUc1lucU1F?=
 =?utf-8?B?TTBSWUIvS0JyVm41Ulpucy9UNkx1dnpFaDVOaWNOM0pBSUxnTkFiWUFzOEZt?=
 =?utf-8?B?Q24wekZNQTQ2K2pYU1NnQXhPZnRqS1N3UTJLbjJYTnJHSm9mNlRJMlhlbnNN?=
 =?utf-8?B?SnlGME9Pa2hVNmxSQnhoZUozQ2FaanJ0TVRjSjBwaXlzeGZlSWFlM2Q3QnBo?=
 =?utf-8?B?SnRCOFRRS3dOUk9JdDFmTm93Q0V2a0dVeFJOUUxsMU5pdURXcGRacUVTNFdv?=
 =?utf-8?B?d3RFZUdxL3lhd25pV2RiNGlhMHoyOTZmTXNpb05QRVU1di9PR2NtaWdpcEkw?=
 =?utf-8?B?UmdTbXRmZVJpNzM5TzdqZm1rbUNiYXhwS3BVUHRHZG52RXhTODcxRzR5eXZQ?=
 =?utf-8?B?R1VGRi9yLytWNllnVjNWNHRueTkwMmhDT1BpRTk5L2FQVVozaTlkRmppY205?=
 =?utf-8?B?SmtIYzZhVDJjZHZ4cUpxZlFMMlh3aFhaWVdqekJOb0ZUY0VOVCs0cUh0TmV2?=
 =?utf-8?B?OWk4blhKdm9Vby9iV1NsbUc2RDVEcFRZRXhINHY2ZEI0YkhsVDltYUplNjFI?=
 =?utf-8?B?RkZGRzVuaG10R3dKZnZWK1hmTVFNTkFlWTNGWjk0V3h5aTZ2YTVlaXhFdTgw?=
 =?utf-8?B?eU9aZGVBT2ZnR0NTU1pBTlBNTDRvZnp3TzEvb3oxcHhoUTYvV05HM2FKa3Nu?=
 =?utf-8?B?SHFXNXowZkYzWmFrc0dkTE45R0NuQVFLUEtCVEtYL3pVdzVCTEovbjNoUEJE?=
 =?utf-8?B?VUxYaGVoVDdDTTQ5MG1kcnZBN3ZZaXM4MHYvZWhMdnJNUS9PWUd6eGZiWjIv?=
 =?utf-8?B?YTFQRVVFQk9mZXdUeTF1N01TTTV3NjRxTXNHdkFBazFzS25nQWRlSW5YdUtk?=
 =?utf-8?B?T0dqV3pweE1hRXNMak81NTlUU0k5TXQrSDdyK0d5WnpWck4rSm9YQ09saGlo?=
 =?utf-8?B?Qjl0N2JrTzVGR3FsSGhWK1FJdjYwelFUTTRPQUNnUjRxK005RDlQU09wamdZ?=
 =?utf-8?B?Y1Y4enkrVTJQL1BoZUU0Y3d1Mmd4b0JraHFiSFNpUnluVDRXais0Q3hKWWN4?=
 =?utf-8?Q?cTdvmRMGljH8pJYDrlkDro0y7uZ3tPAR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTJqZWVoOG95aXRjL2hTL0VEUzl1N05uM1loZWFvUW5YaDVWaTN2cHQ2aXBI?=
 =?utf-8?B?TUdRbjFxTjBXVHloNXIwdkgvbHVCdGhjV0JROWNqcmJuR2lWRnJXZldsSlZR?=
 =?utf-8?B?TU10djFEeHZWUHlRSFM5WitoVW1Vb3YweGdmZ1hValA1MlBIUGcyMkFiQkJ3?=
 =?utf-8?B?UzA1OWtHMm1UMkl2MWlnRUpsRFJQZmQ3QzF1RlB3QUVvVFRJcTFFQWFwdkVT?=
 =?utf-8?B?T002VDZaMkY0NHJwallaNTM0SSs5dkkxSEk5ekZ1UmNPLythT1BPTmMvUHhm?=
 =?utf-8?B?aXhlcnR6Ni96YjdTUVl2OFRENm1rSXp6QUhnanI5MUcwR3dMbFZuTGVWWURO?=
 =?utf-8?B?KzNPcnNzZDNGM1hZWXNsVDF0WDM3MW4rc0wzM2N6dHlWaERFWjgwUXl5akZC?=
 =?utf-8?B?NG5DTlNEWVA3dWlWWENKMGpBeXdHYVJhRkdoRDlLQ1d0eTVFNllkTUVZYk1K?=
 =?utf-8?B?RkdKUTQ5aWlhQnVURXVvVEpMT2JQR3BvNXI4R2RLMU9DRzVNcHRoeWw5WkNP?=
 =?utf-8?B?eU1vMFR2MEtndkV1bVE5dHZZbTRWUWYrZVNHM1FjOERkbVo5bk9rS1JNOVJK?=
 =?utf-8?B?YmRMd2l4WUdKWVg5UXNJWjloWDNjOHk1dlRHTVVOVE5OeVhoWjRIMktnUnRu?=
 =?utf-8?B?UXNWdFk4c2dCbSt5bHEwbzRQYXJnZTB3WUFEekR1MzRGRld0bVk0V0lzM2lz?=
 =?utf-8?B?R2JNTGhqK1pmVVhhSkM3MUlGaXRvTHU4MHB1MkpzR0NiVG0rUC9Zd0dNVkYz?=
 =?utf-8?B?YndqNGZDaVJvcnhSaTJ4TU5rc2dqVWRxcU9OZnhpVm5yWFpaMi90UmpZaUJY?=
 =?utf-8?B?UzI3cjZodkJlR3VIVDlqbGxmNGRsZzdHYTdWTUx6czRBcHAra3ZjdU1BNUw3?=
 =?utf-8?B?QmlBNkFGMUF6TXkzUkFYQkgxMUhjaGxKUGFCZS8wMml3NFRrUjJ3OHJQajls?=
 =?utf-8?B?Yi9ZNEJvcFZQUzdFTnFGUGdBU2trdmJ0bTdTSDJTL2EzK1Z5U2UzUDlFSDhj?=
 =?utf-8?B?T0xUMXNMUWFHOCtBYXF2d28xMHd0UmcyVzJZcEdZQkJla3d4OFNBeitGZ05M?=
 =?utf-8?B?WFQ5NUoySGFsZis1L1NKM0VtWXRseXBlVituRkxzNGJpY1BlLy9NUWhtWUNN?=
 =?utf-8?B?V2JuVEZ0NjJmMUVPbkVTUVFrb0NFWFA0d1JYbWttWUZncUxGbmt6bWtNRGQz?=
 =?utf-8?B?aXVxaGNKUWVOcHRNbFc5TlF0cjlDMndIS0FFSnQ1NzdMaDhBbFVCVE1CcGw2?=
 =?utf-8?B?d0J5T0x4YTBlcXNCYzlPT2R3eW9IcGtyUk5va0ZIckx3K1M5N2g4aHNlNHRL?=
 =?utf-8?B?ZGdxQmNrMlpkdklWajZUbXV3UGhQUE1xL1VmTUlWUHdVRG9CNytRbFdpT3B0?=
 =?utf-8?B?dlR1eWYrbEZtdURnS2Q0eEFWZGNjcmZLTzhxSzJiYktDN0czdXpjM0hTZmhw?=
 =?utf-8?B?dzVaaUhrRGFqUWRKc3pIY2tOaSs5aDladUh2aDZzWHYzRzQ0QzRTaTJkSmU3?=
 =?utf-8?B?VjNrUnlUNzhmSnducGQ4WmdFcVg4ejFXNi9tRmI5a2lKMkl0eHB0bXZibTdX?=
 =?utf-8?B?NEI3RXh3aURHUFp0Mm1VSDFVZVNYVmkzbGZqSWZlMzVxdmxKTFE3SXR0V3NZ?=
 =?utf-8?B?TXFGeTJ2c3pNcmUxaEVMZVpJSDhJZ2Q3RGlvbVJYL1ROTHR6Yy9uWjlvWFg2?=
 =?utf-8?B?QW4yRS9sY1VqRGQ4a0d3T1BGeGpGWGxHa0kyVWVML2RheDErUkVUT0lwdTNP?=
 =?utf-8?B?M21SaHlZbGxUQUZCakJvbHRZeUJyRy9rMHQxaFkzS1N2WXNETVByeCtxdXgw?=
 =?utf-8?B?ei9pNG14QUNSTTdZaDQ5TnFjMXhnZE1hZHdqbHZuT09qWkkzWkVkanBCeFBW?=
 =?utf-8?B?MFhITEd3S1ZDYUVwTHN0eXJZd2NYaE51L1VJNEZ5MjNwVEM5SDFINWdvTk5q?=
 =?utf-8?B?SDE5MDFXWlRPczZhUnNiV3Q1Q2FRdFJQWG5ReURWN1A5VmM1MmltemtnQ0dW?=
 =?utf-8?B?eTM4T2dORmNGK1NuVDI5ZSswSEE0STA3V2c3QlFEUUM2MG5PVURhWS8rL0NE?=
 =?utf-8?B?UUYrbTFTUW4wRnhJS3o3RG9nelY0VGc5UFFyc21ZS21xR1MzdWQwMmRZZzhT?=
 =?utf-8?B?L01xODg5Z1pWTmVjWVpFT1h1b1E4NHlEVTA1bzB1NTE4SzAvM3FuenNiV3J4?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5359104e-f3a8-4727-ee0f-08de38a7e2a4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 11:24:44.8692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRVKp9wnAgws766eF9AW3d+yGfZOyevgx7y5Flx23IoxkDaZ8iBIeywK+2UzzopwwU1ajP9/Gk8wbbzO/XzmggkAArqu2+L/9uHu/x+LIfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8815
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

Hi Krzysztof,

[...]

> @@ -3375,7 +3360,9 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  
>  	eb.exec = exec;
>  	eb.vma = (struct eb_vma *)(exec + args->buffer_count + 1);
> -	eb.vma[0].vma = NULL;
> +
> +	memset(eb.vma, 0x00, args->buffer_count * sizeof(struct eb_vma));
> +
>  	eb.batch_pool = NULL;
>  
>  	eb.invalid_flags = __EXEC_OBJECT_UNKNOWN_FLAGS;
> @@ -3584,7 +3571,16 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
>  	if (err)
>  		return err;
>  
> -	/* Allocate extra slots for use by the command parser */
> +	/*
> +	 * Allocate extra slots for use by the command parser.
> +	 *
> +	 * Note that this allocation handles two different arrays (the
> +	 * exec2_list array, and the eventual eb.vma array introduced in
> +	 * i915_gem_do_execubuffer()), that reside in virtually contiguous
> +	 * memory. Also note that the allocation doesn't fill the area with
> +	 * zeros (the first part doesn't need to be), but the second part only
> +	 * is explicitly zeroed later in i915_gem_do_execbuffer().
I get the gist of this comment, but I think you could reword the
last sentence:
"Also note that the allocation doesn't fill the area with zeros,
because it is unnecessary for exec2_list array, and eb.vma is
explicitly zeroed later in i915_gem_do_execbuffer()."

> +	 */
>  	exec2_list = kvmalloc_array(count + 2, eb_element_size(),
>  				    __GFP_NOWARN | GFP_KERNEL);
>  	if (exec2_list == NULL) {
> -- 
> 2.45.2
> 

-- 
Best Regards,
Krzysztof
