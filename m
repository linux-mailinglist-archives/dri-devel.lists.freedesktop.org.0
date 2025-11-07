Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED9CC40E86
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 17:41:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC2710EB1B;
	Fri,  7 Nov 2025 16:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Et/q8HpD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B5710EB18;
 Fri,  7 Nov 2025 16:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762533697; x=1794069697;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=atCVzlUqQnloMiTFboSHjxPkRpGmm4WpOw4WOR1LorI=;
 b=Et/q8HpDjKPb7l28w2SkLZNYnvh8R12/SuqUWCuDIuLBcVXBv8H2kxiL
 aU8QPKJ/g7Iepyxw1gJN90lqGm5V3zqDGEwzlH5IOUhmoCvA8eu0ldlBN
 zNYJzxvkh+Ji57TxhUZ4xDopBjjlVw3g/1N60RHjg0rys9ZQZwLBLHVBB
 K4oIdgRrFfb5qqNfPU6NTNImaEawPzwu6Zknug0z5E4sB++Sz1xUMsmKv
 Fr2rKMqDHlYgVX5xskXPJip93n3nUtsw4PsHrXA4tgmHtpusa/q1qlhXC
 yKdU8/CprKC958ktP7D2tqxzGkI75MMet+UTs5zhwnFqqNazB1k3UAWeH Q==;
X-CSE-ConnectionGUID: yXT1eqf1RdWq8S0rv0yJBA==
X-CSE-MsgGUID: jz1VOhNPThmDe85PNDFR6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="87316112"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="87316112"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 08:41:36 -0800
X-CSE-ConnectionGUID: Qf6M2X6NTfaRAJWcpTezDg==
X-CSE-MsgGUID: 9PIX6MdzQXCZNpHXNsBTsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="187802641"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 08:41:36 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 08:41:35 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 08:41:35 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 08:41:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmKH5GYBgCnp/R8Bcd4Ae2RW5lx+SCdnBXjaThVzwddSY0+S5Meal46D6OEzulGD41Apoc19oPkLObiepcpy5+g8Eq6gq2tUXH/8e8Mnp2v/56N/6APEF+EKX/+Afr1VJ7AIh6I2GSahw+V0cY2fQUA0XjZIZr4VSAx+B0JfslLHFgffMGvyCByknT/T6Cd07RAsiKLQRaaYOFRY8oRYi6hv4f+XBgdt25uKeAYOxjNJ0GW51Ul7+eOthf1tFvmS5wfkjBFZunpUXdsZ0D8eZ9TQ6bNEYisEfc8cbxGu8bDwLL6mcfx6jf37TNsVQ5TGNX/gf6VhUuRtflqbTiapGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1D6fF03B/7JFEerQksk/XoOv8IXY7DEQuohImHFFTws=;
 b=SKE+r3fxXPM1IKCJO8n57Yj+34ZAhqfrrLeU82RlfYyQTV2zo0ebM5vFugzAqNjUpBS9BLe+3vhvih7VP9Cv02lXc2WyfzZqqUjERNCfzy5HT1VoFVMglAU+kafA333Fr7+eqJgSiPJsvxOII2up0o3MhUZl0mANPr7L2lw8AKjQmH1NRCmkWyozFySGrR/SJvkeAXynkyX5eFa0hn/trh86dHxtAMfi9j+U/AQdtLHIjlzDb3RjV7xab6Uw4dd2UxW3PNiIh1kuC0zC2DwfoHFXLwLk5KyTIA3Hy8i9TXzWmT2N7fZReYiUwTfTPbxCLlEbC9tt1kGgaHDrzYgtqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB7961.namprd11.prod.outlook.com (2603:10b6:510:244::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 16:41:33 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.015; Fri, 7 Nov 2025
 16:41:33 +0000
Message-ID: <515fb46c-0711-4afc-89ea-31fc076f3396@intel.com>
Date: Fri, 7 Nov 2025 17:41:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vf: Enable VF resource fixup unconditionally
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
CC: <dri-devel@lists.freedesktop.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
References: <20251107161000.1938186-1-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251107161000.1938186-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0138.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::36) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e6309f8-935d-4b58-cf79-08de1e1c825f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWpHcVN4Z0NOV29vcUZpZFZ5Rlp6T1VvUEo1TGc4dnpjR25Qa1ZsUjRRaDBC?=
 =?utf-8?B?SXVsbDZOazFMWWxRWkJJOUE3bTUvS3VkMHBmcVZMSnlMUlNPanBnR2tBRjY5?=
 =?utf-8?B?Z3pxMFh0bTZoWm5id3ErM1pBbUV6Mm1qSm1MNC8xOTY3N3JYc1h5cWNzU1Fy?=
 =?utf-8?B?SXFtZ0R4U3E3a2hEYWc5OGh3SllISjNvdERwdG83K0d4Uk1STDFZbHNZSkhJ?=
 =?utf-8?B?T1BNM1VZdVRqTXcvcmZEVGlsSGhQcXM2ZTJuZEhyOFFKNmM5M3E4NDVadkd1?=
 =?utf-8?B?S2dZRC9HSCt6S093Yi9Ic0ZOSTB0dTB5Y3dqbU4rZ3Z6Wm8zcXRGWkdFV0U4?=
 =?utf-8?B?VkR5d3p0N2hRSDNSOWN3UG1xNTM1ZG5pcCsvc1lBNUh6M3BYYnV2TFQyUHlj?=
 =?utf-8?B?VG1HUnhuWTI5UVlNQnRGRmtKcG1ONTBIMUp0aHJmOG02dWlBcXhBWTZEVVhR?=
 =?utf-8?B?cDZQeU1jNzdBSGFxRjc5SlQxWXlqd3RQY0RNdUQ2aFVXdDIvWU56a1ZGNG96?=
 =?utf-8?B?YmNtUE0rb3M2NTBrSEFrNjkySmNPNGlnUUhUOTkxNTF4dzR4eDEwR2FyNE54?=
 =?utf-8?B?UlZxK09HamJrL0JjUXZFbWZUYnBhQlRIZEdsanRsL0l4OER4OWQ3WEZLSkxH?=
 =?utf-8?B?YjhIeVJmMWZSUS9GSklUQndvMHo5LytOUjN2VGdHSmhwQzBuQkMwcVRMbDJ3?=
 =?utf-8?B?WVk5NWtGNGVDMmMyVEJjN09HRXZ0c1lseVBUSkJjN2piVVZHcDZFSDRhMldR?=
 =?utf-8?B?bVBBcWFSM0NwWGlyMVZ1OGNYTkZLeTdjOXpuSkl3eUx0VTQrVjIrZXdNSFp2?=
 =?utf-8?B?KzdVZi9wckJMY0s0aVRDWnprN2NaUkR2V1MwM0x0TTZZSUo3NU52N2hJQzl3?=
 =?utf-8?B?WDFvYll4SXVCdmY3UVpGZHo5UzR4aVBKU04wNG1rZ0pxcWhUalZoK2lESnRs?=
 =?utf-8?B?S1pxdVVlSTVHM25kWUtXbmxYQ0lUVHp4eHBWVXVmeDJFRE1xZ0RWRDVVRXhy?=
 =?utf-8?B?OVQ2cDU4Zm4zWTRKdVNUSjIvZ1YwQVJZUG1VaTdUSDRyc0syb3F0aUdkV2Nx?=
 =?utf-8?B?WXBzLzVoUFV6K1F4L1oza2ExY3Z0UjlIcWxmdDVoL3FyRXMzQVlXekFnamZ5?=
 =?utf-8?B?TTJSbmdIcHdvTXcybEdFWk5rbWhSUXVuQWl6Mnd0eGtoSnJLaWlIRnZja3pp?=
 =?utf-8?B?SzlCRFFCZlh1b1RTWGY5b203SG82TW8rLzdUaUR2cW5xL21HbE1pK0ZPSy9q?=
 =?utf-8?B?b2hqVXAvamhMa0pFUS93d28yVU91WnZwakNpUXRVdXdPa05adUNVWHNVRXNF?=
 =?utf-8?B?WVJxbnc0T2cvcVpUK0t4blR0cnIyMlZ5ZXNSODNSMitONzdIbDA1VVNHRW1X?=
 =?utf-8?B?b1NxRUNTeEk4dnhHcVcxa21GRUl4cXZQWFN0ME15N3lKLy90eXltcy9XU1ls?=
 =?utf-8?B?ZmF0UUE5YmxYeDN5enFzNi94eVhVUks3bzVMeUVCSGd3TzByR3hCajFtYUI1?=
 =?utf-8?B?ZDJuMEtXaGtrS0I2YjNyMTZlSTM3cVUyb0gvRVB4QUl3QUo4ZXNrREtvSk11?=
 =?utf-8?B?aFVnNVNUZnZYMFFBTFp3MlNjTHNSeEFFMVRORHVvTDkyR3FqZVV0MVVnRlBO?=
 =?utf-8?B?K05HRDVzbFhpMEV3MWR1bmdiT0I3VlNJRlRwVlRQaVRTazF1VTZmS3RDYkNj?=
 =?utf-8?B?Zzh1VTVNRkh1anFmdVRCcDFLcTJ4U2dpWlA4ZkxKWVFVc1RXUnVzZVZ3ZEF3?=
 =?utf-8?B?NDJBTkNza3l6VnMwM1FZcEtuZ08zYzd1d2ZGN1IxVG9DREF5VjlZenFUSisz?=
 =?utf-8?B?Tk9aUG15dC82enZwTjR6aGhKb1QxOGZDMzJhTFpXeFhWR3JqWWlYUVFYL2Jt?=
 =?utf-8?B?U3ZXMFpjYkdFK3h2dnA0K0d3QUlOc214eE1JdW8yR20yd1ZoZ0NRSEw4bENs?=
 =?utf-8?Q?BVcXujInZx24FEA64/I2LEIDXGKLL0uQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SElTbjhuVkEvOVVqdGF0ZGZDVUFLWDNhUVdqRmZuWTZBQ3Myb2wvaXd1czVp?=
 =?utf-8?B?dWRzVGNGc2lsV1Vyb2dSQ0h0RnBqZVpibS9OY1h4VHZQYVFoa1ZQZFA2aUk0?=
 =?utf-8?B?ZnhCWlNReTVkcmVLcjZjWmNyY0E3aVVFS3lWQ1ZLa3Vib21jOVpkNzlaVmo0?=
 =?utf-8?B?Q3VLWm53Q1dxVDVlSm5Udmt2c01ITlRSNk5KbHNzZUpGZ1YrZkF2R1dPWlNk?=
 =?utf-8?B?aitUVE93VXJMRWlHcHhOdVloK3RpZFRUS0hFenAza2h4N2NCbXJlY1orcFdm?=
 =?utf-8?B?MkZDTkliMWlPa1RvZ2tjN0xBeXRSUnFXc0Y4RllqMEd4Q3BRTnZjMGt5MVJz?=
 =?utf-8?B?amNpT1JseVR5TjcxMmV0Qlpta3kvMlA4ajloQUpybHZnK1NBS0wrNi8wMCtN?=
 =?utf-8?B?bE9FY0dqZnozbFF2ZG5GR2kwVWpVc3ZEcEFZV3J0V1NZR2U2NUhLQUpCZEdX?=
 =?utf-8?B?TCtrNEpQSHo5U1lkNmdhRTEyWDhDMmU3N1NITUFBNVpGUG13MEZ6M0hlRzN6?=
 =?utf-8?B?VU4vV2hqQk5DLzZRNjhWNXlNc3Y1a2V5T2piUzY4Qk53N0wvSGw5VTRXTHA2?=
 =?utf-8?B?RVhrOUMrOXJNMGhhN05hMnczbnFuRzQrNzgyQzE0Q051dzZVTnZINmJLVndV?=
 =?utf-8?B?MXZlSnJvTkM5ZVh6OGtobExmZGwvZGp6NU1kU2hHdTdOMEp5blNSQmMxY2Y2?=
 =?utf-8?B?YlVpbXFsTVlTMkhDcUxIV2V6Mms0Tm01RzFocjcvQXBLaXBnMkNvQWlPbkZH?=
 =?utf-8?B?S01nZUlIdEVnRU5XUXFWam9BQmFsaForaGNXTHJOcEJscERmTlF2MDJFOHhO?=
 =?utf-8?B?eTF4dHVRTW0rYkVzZmlPZ25HbmRHVkNUY0RLSS9ldGhjK1luQXdpME43UzVu?=
 =?utf-8?B?djNRejllNVBvemhic0VlR3RxaytXcW1VMUZidmd0cjhXUzNJVkF0cmhmZ2gr?=
 =?utf-8?B?VWR3ckVKZXRjYm5PZUxKaVZybUp3cTMvbkJIaXcrVWp5RzNhSWt0Z1RSeDhS?=
 =?utf-8?B?UmsvVjVFa0dXZk1XR254QlN6SGZpTERwdkhrdjNhb3dKa0FTRVl0ZkVNVllw?=
 =?utf-8?B?QVJrdEJ3ZlNYRi9EdE0vZWZrSEpIeVBJc1hFbUo3elI2QUpUOHpOZEkwU09N?=
 =?utf-8?B?MTJiZEJ4Q0dHZnAwek9hV0tDRldobHZuUzZtS0lYeURuRDdyblhFaWMyc2Nx?=
 =?utf-8?B?NEsxTGUwK0wwL1hqcEk1R1BNL05vckk4QXdTb1QxOGVGMlFIakYzTzB6L2hS?=
 =?utf-8?B?eXJFUGloZ2pJdlpJZzhPbXNzcmNtY2xvemEwUEo1K3VDTXBrM1hXQVRTcmVs?=
 =?utf-8?B?OVIwRDBsRHRsTzg5aFlaSjlrMlJ6VUp6OGFEdGI0YUhBU1l5WXlGRW9md0xG?=
 =?utf-8?B?d0txUnJ5ZzVGa0hKby9BOVhxK0NJaG41ME9UZ0RWK2NiRDJGaWVQWlBHdGsz?=
 =?utf-8?B?SWs2aVBuSUJCamdiQ21IL0RHaXBHeGhnVEVKS0FxL0ZUMlJpTTRhS250TjBX?=
 =?utf-8?B?ZnovSSszc0NRU1N4cEpLTytpR1BOckwrcmhwdVVVQ1NpYndhU1dncnN1bExn?=
 =?utf-8?B?QlcyeFlCUmpkSHV4eDZIclFMbWhTb1ZPTUJkcEg1M3EvUmxqUjUxSnE4aXI5?=
 =?utf-8?B?bmxIZ1RhUVhiNzJqQVVsdnVwZGRHaUU0K0szbXlHSXBvaTNsbjU2RmI2bE40?=
 =?utf-8?B?czR1VDRCTnhqUk9yUExVcEg3SmdRQ2tRRElMbmg1WXFMbnVRc1VlNFFSUkcy?=
 =?utf-8?B?MGFoTlRJVVhvcmd5VUhzODV1cHNGM3BOekpmcnkwNjI5RHJjOWcyaGx5R1pP?=
 =?utf-8?B?eEtaRFBvQWNjLzIyN2FLcDUxWEhON25PbXdNcmkycGJiaUlIaEVtdERDTFI2?=
 =?utf-8?B?enBjRk1pVmlxVXZhdzBDOWFMR2VocDVNWDdUM1ArK0hZTm9QSUI3VUJpOTdL?=
 =?utf-8?B?dVRuSVU3VjJvZDJjWWtVZ2pJVXJyc3VaYnVmbmljeWhUTjRNM1gwOFRnNU5B?=
 =?utf-8?B?eHZpZVFkMnU2RXFVcGZCSUE4V3JNdFJkb3IrUnZBVmQrKy84T3JjcllPR0Rq?=
 =?utf-8?B?ZytxT294MU05aTBneW1Kc2F5aDl3M3l4UzhqamdGUU1mWCt0THR5N05xMEl4?=
 =?utf-8?B?TzExT3o3ZVVWTFRSQ2xXaDdUeFM1RG1zVVd5L1o0UHR2dE9EUXFOVkxzU1JI?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e6309f8-935d-4b58-cf79-08de1e1c825f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 16:41:33.1171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HG4aWVCkqWL47Bv8cxdQSxiMGPfbmWpN1NASE7t55n8oM/UrgJbCVjb0Utxu0Q0guBvRLBiKUMZTwShjmnaAtZiI6hFWj+b8wJ8yJzORoHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7961
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



On 11/7/2025 5:10 PM, Michał Winiarski wrote:
> All the feature enabling code is in place - drop the debug flag
> requirement for VF resource fixup.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 39c829daa97c7..284ce37ca92d7 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -156,14 +156,6 @@ void xe_sriov_vf_migration_disable(struct xe_device *xe, const char *fmt, ...)
>  
>  static void vf_migration_init_early(struct xe_device *xe)
>  {
> -	/*
> -	 * TODO: Add conditions to allow specific platforms, when they're
> -	 * supported at production quality.
> -	 */
> -	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> -		return xe_sriov_vf_migration_disable(xe,
> -				"experimental feature not available on production builds");
> -
>  	if (!xe_device_has_memirq(xe))
>  		return xe_sriov_vf_migration_disable(xe, "requires memory-based IRQ support");
>  

