Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E208998E8D5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 05:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBBD10E782;
	Thu,  3 Oct 2024 03:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ssyowz+F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53C710E04F;
 Thu,  3 Oct 2024 03:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727926204; x=1759462204;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5Rbp2m+os6VZ83RpBLTBcBEn9XQOgXXGnd0s2tMB37Y=;
 b=Ssyowz+FVusS3DGSeGt0rxxSksWxD4+7YJhU1BZ1TmQZDIh7pmkCIn4/
 HpyY4/9iGJNXjfdePf4IVs91a7NtZMgV+MAhFCZn7HzjmMmU2cJjASWbr
 Jc6HmRY75AivFwCpAX4XHRY8wFrCWMGZcb0FPYoKryN/L7hhaAso/uAnR
 IprQYpCvUDhV2diPsXulC6Evafj9xEaUnx4sJbd7aIT2zXrT/XFch8hUj
 Xj8V7pTbKJYReGHjn+QKBwUaT3JV+wfgOLuJ/6Anz2OMI0G/kLoiSKukl
 hklwcdtEpZKi6b6a1Ax2Vm9bOwyenNAM9cgwsLy9MVO8Z8yXLTrbmLmIG w==;
X-CSE-ConnectionGUID: 72UifvX0SfCql/B+PGJ50Q==
X-CSE-MsgGUID: WtjPBoiORpqAYdQFRiS3Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38494363"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="38494363"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 20:30:04 -0700
X-CSE-ConnectionGUID: VoWwoR5IR5uGn1JJi4knrA==
X-CSE-MsgGUID: Sd9PM+b4QyiterlBzUGXvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="73885137"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 20:30:04 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 20:30:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 20:30:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 20:30:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 20:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hlrRz4I1Atokem7X4n8PMFng0igzk66RjU1zfZIehEleB0TAsGLPa8RyZBdmYhcDoSRvDz+YK2p7fi9Kc983nfJ4ur3CL1J1tOEkfTBHtH6LkC+5+dur8d+hugSktjY8CcDDfxOf+xzvO0qsc1PjlBO40pdsIl8yo15dFX608Za4zMd65zeF3xqoiQ5KPc9QjJD2OjJf9NPc0O3kPmY/6Aa25wzdF/ifRlB2u5zp6UorEKEPE+LE7JIL74QQfeLGX1BX4rNywxEdEvg3g0PKcxd+mjzVG65CLKaNHicWwbD76O3Ado/bJ1AHcUFR8AEiAj3YfykX2W4ybPfBa9eEtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gn0xDoIwxjyhsAcEAf1XMV4jSPr2rNTAFRxf0+0Ov68=;
 b=AtgsZ1F9K6sBvM6S5Bi9zF91wI+4B9n4JfPHmFZiKjHyxl2Jg0ACB0uaeXZcGJoN9cvg+NwqZ13fN7AG/yTOZZ5Y5GdBmul3WQtzAGQfw9bwv4/L6stvFuePu50QlaI4SZEObMOVvxkWoLobEBg++Hc2V1WkD5/oe+zX0/CMp8X1Mfv+0blM0JrK837G2TrJ6dY7GLbwWKGyKYjBQJr+DjR8ss1twi0gdimbUsHyszCwRzkhtaV4W1dzvkGvFLd2V6pO+HJnzWR/m534bwd8tfg3Fhb1u6o21rfiUXPwZ1WwpglEcxzHdesLc+7qHR8eGqA0lmJhoqA3l/D78kSrbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Thu, 3 Oct
 2024 03:29:58 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8026.014; Thu, 3 Oct 2024
 03:29:58 +0000
Message-ID: <39e840e8-4600-40a5-b69d-8720e24297df@intel.com>
Date: Thu, 3 Oct 2024 08:59:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/sched: Use drm sched lockdep map for submit_wq
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <dakr@kernel.org>, <pstanner@redhat.com>, <ltuikov89@gmail.com>
References: <20241002131639.3425022-1-matthew.brost@intel.com>
 <20241002131639.3425022-2-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241002131639.3425022-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::10) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|LV3PR11MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: aae44f5a-203b-4d43-a408-08dce35ba81f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmVuZnFhZllYR3V4TStXbmhaWlgxL0ZhSmtlS0VUc1ArOUkzbndRT1pZYzAx?=
 =?utf-8?B?RmQzY2poOWVIVTQwSVFiVDUzcGVDZmgwZy9CQTZKRjVKd3ZocTlSeXArMm5M?=
 =?utf-8?B?U2VZcDBDOGwwRlNGUlhuOWJFRmdFQ2xwV0tuN3pReWNaeWJlei83UlVwYTJY?=
 =?utf-8?B?V3pYMDB6M0xPdkhzNmFKQ3ZXK1NFb2hwT1pTdlA5MnErT1grTTJNeElNbmc2?=
 =?utf-8?B?YXM4anIxS3lpSmE4SlNuTW94bWhtUm9DdUwydUlTSUk5aXVSUk50K2V2ak1h?=
 =?utf-8?B?Q29RTkZaZmYrNzlIaEs5OTNnTzkvbkN0cEMyRjAwOXlLY051WHo4YituNk9H?=
 =?utf-8?B?SkZta1RNcE83THAzZUp1dEE2QUo0MGp2N0FYdmtaSTl2Y1lLSnhCQVpNTDND?=
 =?utf-8?B?ZS9OMEJUQmRpOVFDMVpDRnBSbDRqeUszZ04wT2xhcEtVWVNOcldkcEVMMlRN?=
 =?utf-8?B?MHdpWENYU01oaXBYQ25XbDJTTG5tNFhySG92UFhVYmlIb3BSS1JyRmNsbEhs?=
 =?utf-8?B?T1luenRlcUFFQnJiaUJ4RkV3cnBWMEVaRk9maXRhbHJMeWQxb3NiaGwwd25D?=
 =?utf-8?B?L1p0b1NPUGNLbkFubFF2T0tnWSthUjdyMDluZWhJdnRBbU1OUkZTSVhnbUtX?=
 =?utf-8?B?c3h3cldzZ2pVREZXR055RUF3dVpzYm5xY0tpNEtJKzZydnVYTjNlSmhUb3ow?=
 =?utf-8?B?Q0JjdzBBQ1NxMU1nOFNXajIxZDJvaVlyM2dxMkJpVUwzWmg1bnRveVk1MU5k?=
 =?utf-8?B?TzZpN2N1dUhhbkR5cGhFZCtwU0FacXZOYWNjcGQ1b3QxU3dYazg5enJkbytE?=
 =?utf-8?B?K1BwYmVTVWZBSk5ZdjlxVm15ZUN1Vm5yRS9KRWhUZHM0aTRwcnVOSWpoYWVY?=
 =?utf-8?B?bmVrOXppNDQ1YUVmcDVsZGcreUl0dXIzelE4UzVrUEtVZUtOSUlocXR0WC9n?=
 =?utf-8?B?UDZ3dmRGOUtENmVEMUorYlJ5R2ovVHQzZHNZb2FncWxhUTRVd3VmTlhVMEdv?=
 =?utf-8?B?RnR4UFBuajhyVk01MXl1bm5TNlpacWc4U0RPSy9uT0JiQ0ZjL0FGNi9adXdF?=
 =?utf-8?B?dzRsTlRiU0c3TEVQdHdvS0pyYVZkRjVZWDZJQ1Y3ZXhYdHRmMUJYN0hMUjNF?=
 =?utf-8?B?Y093ZWtaZHlORzcyVXV0SnBWbW5RdDdXQzk5VDJwSFFLd1BENjh0TmtobDlY?=
 =?utf-8?B?dVRpRWJ6WXREbWE0S2lzblpEc2FxbXdsR1Vhd2dEYS9UWGxMZTdCVzhCYWV0?=
 =?utf-8?B?WkN6dEFPaGZHK3FYK0xLeW9Bb0V4S203enRqeVk4K3VSOXBWSVB5bUd4Z0Va?=
 =?utf-8?B?cXVzOUUrWXVRVmtZb1N4TGppZ2lNZ214MlJJRHltN09Xb0VsejBRUmZyV2hR?=
 =?utf-8?B?VHRvbGhOSVNDN2ZZL3NWT2tSbDFZZzZZcUdrYWJzdERjUXllcWlXempydDI4?=
 =?utf-8?B?MTdDVC9LVFhlbWt3aDZlUUNGcG1haGNGbjZwTlQ4TU91QjZBd2JTZWxkdm9K?=
 =?utf-8?B?TktQdlhNNkFVaE4weWFkMWJ5cWpKcm1rVjlzTklhYndLT09QK2RLY2dkaUdK?=
 =?utf-8?B?Zk8wQXY1Lzl6bFArQU9Hc3V4NStVNlJLSHBMOHd6NGU4NEF6YzlRM2s3Q2pa?=
 =?utf-8?B?NFB3VkpRbUlnQkhvV1g2V3Q1d0V6cU40aGNiblFqQjlXbEJrc1VEM09DL3Bs?=
 =?utf-8?B?UG45Z0F1ZUh5N2hSUVRrNmZjUzNCNHR5b3ZmdXZaUmpKcjkxdEhnUHV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzhrRGlkTFk1L1RzV0NwVEswbm91MzgwNi9oc0c0ZEFDdFNJTVU0Sk9rOHRm?=
 =?utf-8?B?T2ZJWmxyMmVnYzNuLzgybDBJMmhqcm44dlpReTVhWEJPS1N6V2U3QW5PTENC?=
 =?utf-8?B?bXVhQjlycmp5VzgxWnNWN21NSnJMR0J6WFhPTnpXZkFPMGlJV1JPR0NVS21T?=
 =?utf-8?B?ejJObXpBZGt5VjBMOVU5SEh5WGdUVXVlMDE3UlZvR2ExSW9PUTBINTM0eHpt?=
 =?utf-8?B?ajJHYUZLdVVPQWRWbElsZjhVTEZWTVhuUE5HVzFQcEZIN2dUVWJOeElmdHhF?=
 =?utf-8?B?VVVabkpnMmdOdnQ3Tmt3OFZvYndiSUpxR01ZMml3OFU5ejZTMEFNQmk3QlU0?=
 =?utf-8?B?NTZLdGZSdVd6S2g3VkdmdjNRUzY3cHdoN0ZMbTJFeUhZZDdLaFRHbU1pTXhP?=
 =?utf-8?B?M1hEbzRrSE1nZ3R4NlBmSUk5MGhHa3JYemlzb0k2ZnUyMW1ibEJxYVExVCtT?=
 =?utf-8?B?UlUzWDMrWUExOUZqREZwTTZCTXVYODJnWVdvMC8ya2trTVI2OGw1MlRLeWVH?=
 =?utf-8?B?N0Z5T3RMMGt1VHk0aGRCYW9wR0p4Tmp4VHpCaUNlY3JDMlRLSi9HRk5sVkJ0?=
 =?utf-8?B?SmRnVm9QdmtNUXVqRFYyZCtUbWo2aGlsbllJWFM1WEgyczVxdk5zajd0WnM1?=
 =?utf-8?B?d05QUU1LeHNzWEtjelVsV3g5aFdFdGJmcnZ5U2lMT3dkblY4ZHVKeTFqVzBk?=
 =?utf-8?B?bEk5Y2NDd0dUNG5MMXVNTmhkT0VGTCtJbENGdkJYOFdxQnd1c2wwMnZETGkw?=
 =?utf-8?B?bzArblpKVlR6blVMcjVIRkdaYmtSZlhoODhNTExTV3lYSnYyeFNPeUVkeGNK?=
 =?utf-8?B?OTBKb3l3ek45UnBlYndVamZxUXA1K0pTYVlnNFpNUGRrOXZ2MlRxWVI5UjBV?=
 =?utf-8?B?dnNmeGhMeXdNa1V0RCtvTnNadzBZOGNZdUJRMnlBdnhucU1EQU5SSjdqcFNh?=
 =?utf-8?B?YmVLOTcvWThYakE3a0JZbW5nNUNLbWx6MnBGUE1IRG52YzdKdFNHMis0WGsx?=
 =?utf-8?B?MEx5NEpVOWNWWmEzTzB2VXN4ZWovbVgwTks3UlFFc3lCeDQ1cXdreFRONmVn?=
 =?utf-8?B?Z0FFZ0VyaUYwV1FEZkcyQUxZM01VSGpYUExOS3FLZXNMRGVhSEhMcGRWZDVL?=
 =?utf-8?B?MjVpT2xSNWcxUjJMNXJXM0hVeXJuVWJKLzJpdGlzajQzZllERjBjZ2JuYXBZ?=
 =?utf-8?B?U3YyM1VBTXpFOU1tdDQxTkw4M1lLNStPN0lZM0NsZERkL0U3MTNGWERmMXcr?=
 =?utf-8?B?M01sWGN1OUFnYzlGTzNWcGQzcTh2Y2hybTh2QmV3TEduK2xzMGVYWUYzZTdx?=
 =?utf-8?B?V0daUG9OUWd5Y2F3MXlEOURqS25ZWGdGLzE1NzhaaHFUcG1ScHBFNE1jc3Vi?=
 =?utf-8?B?MmhRUk1SWVFOcGoySkZRRzVOUDZCVThtWlloTDdJNDZ6anU5ZWUvakF1bGJD?=
 =?utf-8?B?VVdScTRsWnppOWYwWXJwWGVRZ2FsL1JjcEtLZGVFQ2szaVFLK0pmTVRtekpl?=
 =?utf-8?B?dUVKOUhzcUhmczRwNUNzR3JDUVNxVXAzTkZPYzBUbFJhNFQyUStvSWZxaExo?=
 =?utf-8?B?WVN3bFdlQzVJaURVcHU2N1dSRHE4ZHo4VUhHNENQU3pySzNsUE5WRGVjckZs?=
 =?utf-8?B?Nzg4WDJqOXVzOURWK2QxblJLOHpSMG13c25YTWU3cWZBL3JiTUdPTVdGVE5D?=
 =?utf-8?B?bURoK2xxTEptODJZeXdiSmcxME1XVW9abkptMVRTc2NlNjJzU2Z0cGRlV204?=
 =?utf-8?B?dThjTXlQclpkUEhnbE9LenZmaGFXQzNqaG9ZTmkwYmg3SFFQUFJBNUgycXds?=
 =?utf-8?B?dFdKa1Y5K3pVTDNhTlNJQWhrbzRJRVB3Z2YwNGxTc1Zid25ZYkM1c0lleVJn?=
 =?utf-8?B?OWZzWHQ5dytDNlBvbDVWV1BJM3JBU2NPS1R4a21lQXpUMnR1NXIyTXU4a2dk?=
 =?utf-8?B?K3B6U05nM3F2M3U4OVlwWUtqeHMwVFBCRDBEeFpaNWtNTGhvYzFlYmgvZFEy?=
 =?utf-8?B?SldnV0FyTjFKbHpMaHRkcGF1L2dpMXNqanNtQWVDMldSRlFTQmxydkFYMFl1?=
 =?utf-8?B?TkMwVmVjTVVVREZLTnRvMkc4VmNraGgwVGlWb1p4OW9lZHNrK2p0SEU3M1Z1?=
 =?utf-8?B?YmY1aGg1WmdHQ0Q1R0ZIZUFIN1VGdUFrK2F3dnRWT050Wm5TaHR4MFJqUVF0?=
 =?utf-8?Q?tI/LCrgc1+W7kDHgApC0W5A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aae44f5a-203b-4d43-a408-08dce35ba81f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 03:29:58.4854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3AgmplVbt1teQHg4ZZLtt5HBtoe5CzS6oCP//42zivXfQDqq0PfWyfZq1yOCb8yVFtENx369RmoeIRaUK4+dKaSoH/aPSvpDP4tzXI+e2dg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8603
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



On 02-10-2024 18:46, Matthew Brost wrote:
> Avoid leaking a lockdep map on each drm sched creation and destruction
> by using a single lockdep map for all drm sched allocated submit_wq.
> 
> v2:
>   - Use alloc_ordered_workqueue_lockdep_map (Tejun)
> 
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 36db5c7736fc..e32b0f7d7e94 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -87,6 +87,12 @@
>   #define CREATE_TRACE_POINTS
>   #include "gpu_scheduler_trace.h"
>   
> +#ifdef CONFIG_LOCKDEP
> +static struct lockdep_map drm_sched_lockdep_map = {
> +	.name = "drm_sched_lockdep_map"
> +};
> +#endif
> +
>   #define to_drm_sched_job(sched_job)		\
>   		container_of((sched_job), struct drm_sched_job, queue_node)
>   
> @@ -1270,7 +1276,12 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		sched->submit_wq = submit_wq;
>   		sched->own_submit_wq = false;
>   	} else {
> +#ifdef CONFIG_LOCKDEP
> +		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name, 0,
> +								       &drm_sched_lockdep_map);
> +#else
>   		sched->submit_wq = alloc_ordered_workqueue(name, 0);
> +#endif

LGTM.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   		if (!sched->submit_wq)
>   			return -ENOMEM;
>   

