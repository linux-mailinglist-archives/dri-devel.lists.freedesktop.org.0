Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AA5C9A849
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 08:42:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D8B10E5AF;
	Tue,  2 Dec 2025 07:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwZZkEco";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFE910E5AE;
 Tue,  2 Dec 2025 07:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764661364; x=1796197364;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CNw3Gahdu1xm7ohQcI+vLwSjeZ/RdJ+ctNSfDKgXz5M=;
 b=XwZZkEcoYAJ9pHHxWg0nHrnf2byqbK84l6cK3s9gxM9ANZLQLrKQdNEP
 jm2GFfupEddaAfW4uwA6lyh+otlRrYU/PVX9cKsrNSZlgGUnXHf8efwko
 X9GD2JIHBvGACDKYK+GnCejCLSPNm1wcqUlP5yDrSsSeV/p1fhOVfVvfq
 cyH7ENooKf58aL7zGzhXohGufRK9s2u27IwHK9pHWzit7YE7PbDEcaILp
 yJkGXpqDHPEvIjgTSUgLoXr+UsTdbjr6k4pnhiZds0UjVXNFXALFohnXk
 gf2qUW4DWe7czhMMz5DR9E6IsVldFlb0ydlUUL2CRUkZQ7Is2Tm343l3X Q==;
X-CSE-ConnectionGUID: EAX7SJK8S5eL9fNYcpF11w==
X-CSE-MsgGUID: R0GXRiXjQSyiLWQ9gnfNng==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="65621545"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="65621545"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 23:42:43 -0800
X-CSE-ConnectionGUID: VHub2dHDRuCzNoCgvJjmCg==
X-CSE-MsgGUID: hkVuWQ8HQ963YuBRBCEkgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="217643603"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 23:42:43 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 23:42:42 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 23:42:42 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 23:42:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZFEwWoKkLCK6KQ6QxVopd9wcYaQtnrmSDJPPXEJJrBVKY0hbp0rilnbrJEzkGW8oaCtK5YeF3MfYfQG1h3E0LkCixD1IhJGlkz6ZOpJ1kemM9oKt6SK9l80lgknJAttwSx21FdmziiegBx8wNr2DoljTSJ2svYQgkX2miYRp9mPDkvuwQU9nnk++rZ27cSOQdlTKhpOlIuR8OPGcntBKG8i3Lk8f4/odSZF5PCH2zRmKlmj5zdu9QdLnhOuxoDrCu2jxdbAFi/7xC6xe1W54rt7o1EVCX4OBCLwxShT0FK5WYKNhk2WJsgVkeDFKwFIdTC83bJU3UcluC+8qGiPxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmMhANsHlXJQsLXopqEAXT2S8SP8N4Ch54gCKC54muw=;
 b=UkGujWgj71H8f5MNDrwWgacPtxc6g0s0VqlF49Cw63tGv7qtXjtgJ1w8ttjzZIM5qW2cDmG38sM9pdCVGbvAhZlpj1Ud+Uo/tf3tdAhpEUoPQUE1/iGoe+ycOmM/7sqqDi6oFuz98dshJEhxs4ARZy6dX8ylX5vPbiQFPdX7QAZ+vhpNDWFE3EPkDQgnldpOCRFoSdy5LLeMc68DBq+ww+/beG28rhpUwbxGSNgK7JzDor9omPkn/XSyAdua0TikJPxVp1HAiXV3uOUcoRgK6ls9HoF8k9RNySihJmxNtf9V10W3bBXDcgFGhDlt12pXHeQNOP7cjAttpRWt8IdrZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 07:42:39 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%6]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 07:42:39 +0000
Message-ID: <045b308b-c5ab-4ad2-b25e-3fbda2b14590@intel.com>
Date: Tue, 2 Dec 2025 13:12:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v7, 01/15] drm/i915/display: Add identifiers for driver specific
 blocks
To: Uma Shankar <uma.shankar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <chaitanya.kumar.borah@intel.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>,
 <harry.wentland@amd.com>, <mwen@igalia.com>, <jadahl@redhat.com>,
 <sebastian.wick@redhat.com>, <swati2.sharma@intel.com>, <alex.hung@amd.com>,
 <jani.nikula@intel.com>, <suraj.kandpal@intel.com>
References: <20251201064655.3579280-2-uma.shankar@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20251201064655.3579280-2-uma.shankar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0142.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::16) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|BL3PR11MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 511b8ff3-cd0a-491c-dcac-08de31765e3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTNxMll6eHNLQ1Rwd3oxKzlRTTN1TGxHMDRmTzlVTWU2S1NXYXZ4V2FGcjg3?=
 =?utf-8?B?TldFU0VkQzlnWlowNVJPLzljNjhIVVBPZFpkNnpEMXBPcUY5MTNVWjJROTdG?=
 =?utf-8?B?VUFsWmdGNkkxakVxL2JrdFFHZ01XVTFMNVFxeW1YdWxLY2RMcHBGNjd5RE8w?=
 =?utf-8?B?VW9SdXcwWVk4eGlnTXhqeUd2QUtadVo2djRYK282Q1kwaFE3MW1MekVKVVRl?=
 =?utf-8?B?bFZCZzlQcFdSSXJhakE4UkJXN2lWc00wek5FY2xtYi94YWE0OU1NU1RpS0dR?=
 =?utf-8?B?bVRCSm5sRTRkL2xOQ0hxVW1VcFZxbWZwWk1RMzVzb1RXK1FzVWVtc0d2Qyt0?=
 =?utf-8?B?amhuK1VmOHZMYno2bzJ2djJsdlZQTXIvcE9wM0svWEpxcUR5bzJFUERmam9W?=
 =?utf-8?B?aldSS3JSYmh2N0lUcXdRV0F2TFpFQnhIZGZ0clgraTZyTDhBQ09MaVJ0cS83?=
 =?utf-8?B?QjM2WmNMcjhRa3RaNS8zL1p6S1hsNnNYTzV5cDEzMnF6enhscFBuSllRdDU1?=
 =?utf-8?B?K1BQVWNjRzk2dDBGRUFIR01iZzFTRElBdXFOcGdmL0RCRG9mOGhGcDdlRFZz?=
 =?utf-8?B?UjFBNUppdmE5KzExWk8wS1UrcXo0ZU8yV0V6dTI4UnpYUlZRYjhZTlF6bFow?=
 =?utf-8?B?NlB0UzI4SVNuYWdtRmRxSnpENi93M3g5SktQcjRIUXVXNUF3c29pVHRIc3lV?=
 =?utf-8?B?RnBRVTd1WURwN0YxTUNicTU4SkJWd1YxNHd2VTQrN1BmVXkyajNFSDJMN3o0?=
 =?utf-8?B?QlhhTUNtUFJKbmZaaWxiYStXNFBlVlAvL2tGQnZKdisrT0VKSW5Hbm83TDlX?=
 =?utf-8?B?TU1oOGY4Ni9FbFRpc21SQ01SNDAwRSs1SGFLTDBRMk5VaDZqNlhXRzUrQjZM?=
 =?utf-8?B?cmlLQ25tMVB1N3NMM3BEa2xtc3lyLzByV2JFeGlDVENpZGNXQTZmM1I1Zm5N?=
 =?utf-8?B?ZDVUQWxlbTY1VDlmd29LZ2tZeG01WjlKZFU0MDBza2V3UDRPdGxHeXBQTkxp?=
 =?utf-8?B?cllnYU1XWTFVQ2pFYnNMMmx5UFdKYzhnSWExNkpHQ3ZvS3FuZVFQR1dJZWlO?=
 =?utf-8?B?My8rbGtseDVhYU1Qa283cHVXYkhmamt1TFlDVUJNWkF5aW1hSmZLaU9OVUd2?=
 =?utf-8?B?dklXWG4rM1ovazVQNXp1TnQ2WHk2SFBaZ3lUa2pGa0tiRExPSTlLVjRjd1lJ?=
 =?utf-8?B?NlZkRlJYQzJOZkIySzlDS3g2QURub0g2S1VHWDVieEZ5NTBlNmxHYVdNUVFo?=
 =?utf-8?B?MXVtVk5YTUlmc2tzZ0Z6Wm5WYVZzeEFqOFZMWXVkSW5ZNmRQNytXTXE1RXhz?=
 =?utf-8?B?azZuWUhBbnZqMWJEVGcvZGtsTnhTb3FZbnlqU241L3NqaFB0VUxiMy9PTFdE?=
 =?utf-8?B?Y2MyTDNkaUNGbWxZVDNPbGRTeCtGV0d0Q0UzcngzejVyRGlXWHcrY3kwZ0xC?=
 =?utf-8?B?WnRxTUlpRWpuUTVWSVhuVk9vYzhzM01nVEthMDNNWTBhaHpyWWNSMHMrTUVo?=
 =?utf-8?B?YkxsZWh5NUxBeTNqV0k1RmI4TTJFUGFKZ21LcytEM1N6K3RVa3lWUVUxUVZz?=
 =?utf-8?B?YW1uOU1YL3ZuWnJKSHNUUXQ1UWlpUzhHUXZ4eHNXQnBUamMvdXF2WHQxWDZV?=
 =?utf-8?B?RnVYemd0Nzl0dFd3dFRKaUsxVnY5RGs2ODF1SUs4ZHZDVGs4R1VOZEtvQW5K?=
 =?utf-8?B?UWRpdnZRbUNuN2EyMGVjS21EckxXOExrMEhrQjhBSjZqaEZjNDFadk9XSFhD?=
 =?utf-8?B?RFZTUTUrTGFsb3IrTUxod0NsbVc0TnN3TnhrRGFxT01yUUNlSWl2NEd5a28y?=
 =?utf-8?B?Nkt3RkNBK1oyUk4wcnVWdFpUZW9QS0xXUUFlVWVTVk5RZ2o0eW9KTlljQ21N?=
 =?utf-8?B?aE56eXoyM3RmQmtiVXAvU05TK0w4SEgrOWp1MjY4V2Q0S0pGUUxCUWVSWFhX?=
 =?utf-8?Q?mtw3YrClAfsH4sar+NDa0Djz+/C4kcwA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3FtOGFKbGJCYzJnc1lkUFIyNGhZNG54TEptL3FmbDJzK2FVMGZycTdTTlRr?=
 =?utf-8?B?c3pWRDE1RnBzOFkwblQ2UW9JQ1Zvb3ZKZUpPNzRVR2IvQzc3YXJ1K3NSZVJF?=
 =?utf-8?B?N3hFZWFncytzc3RJSStVVy9LUTlwY3l2MWljZy96QlpxR0UwUHJFaVBVSnVC?=
 =?utf-8?B?cHE0RmZsdW5hd2M4eUo3Tys5bWF1bFZydzQxaXhaQTNHUGc0eDd2aWIxRTNq?=
 =?utf-8?B?cG5PbGhDZXVqdGpXUW1IT1B3Z1Y1M2dPMnNDMVNjUnVoMlBpSmhBSW9CL0Vm?=
 =?utf-8?B?SXg3RUIrb2llZHNOaDdrS1F1bitiTzlyVVZUcW9JS1RSR2NIQ09yMDRMOVFJ?=
 =?utf-8?B?SnhKb3JBWVJ6TldsTFpxaEhmWmFCQ0Rqa1VHQVU0NzR1OUZyUEVHVUxYdnpT?=
 =?utf-8?B?UVZCWE9DNjhwelQ2dzMvUnBSUTNsUjdDZkVhZng3VFEyVFRFMFNYRU96c2Zn?=
 =?utf-8?B?dElaUHdndEt0U1QySVBXZVJYbXN5SmpHQWgyY25HKzdvNmg5SHkvU0FDdHQx?=
 =?utf-8?B?VEdvbkJRcGREeDN0TGlPUDVndzI0VHZ4OGxpb2NnVXhkUGk0K040NUZxSEJv?=
 =?utf-8?B?WnloVFNONitRM3I2bHFvdkFsRlFLRGlRRXBqSEJFMDBZMUpYTXFxc3hydTR5?=
 =?utf-8?B?L2xtb2lSZVYvRit2ZmNHR1R0R2MrZFZyNzZGNlc3aVdIOCtIeGo2ekh1UWZ4?=
 =?utf-8?B?aUJacjRmY2xvYUhWbVdBNXN5bE5iT0RsVVRETnRBclJzdnJkRFZEc2JRM1VV?=
 =?utf-8?B?MHFacktINDZDTG5heGtudjVJbHAvK3VGLzAxYkdhbU9VQ1UrYTJDbmhlYzhi?=
 =?utf-8?B?Tmx6dkg4Nk5nWUZvOHpVNXMxU2U2R1hya3QrVitTTDE3NHE1OTFxQk9zWUls?=
 =?utf-8?B?WlZNSE9KbURvbVRlUld3dFk4T29nS2I3Um9aaStySTVzQkdWN2JrMml5N2xO?=
 =?utf-8?B?dVdDczBKTGFTVDhiR3FjNnU4bUpDR0g3eG5PV0NqbVFsUitIdFcrY3lOR2JY?=
 =?utf-8?B?c1dXbVdOOHg5WHNyNWVuUFh1YVFLcUpCSEwvaUZwbGtEWlJUbWpSMWloWlpG?=
 =?utf-8?B?NjkxMWlpdUN1WUdQUytHTFQ5djlwUGNUcVk2c0FHYmpqaS9tcUFVNWg0c0hm?=
 =?utf-8?B?VTFpTVh0c0dIMGo3VHlncDJ6UUdvRHVYcnZYVWFoYjFLNzdScGtSTlZPY2hu?=
 =?utf-8?B?Q21GaGZUVWNhZW96dDAvWGZQNkRUcmVEejAwY1pPTUdNVmN3TC9LTXVrSWFl?=
 =?utf-8?B?S01jR3hHWGJENTQrODhXV20xQ3AwazZ1di9SUk5YeGkvMEoxL0l1L2ZZSXdt?=
 =?utf-8?B?MHp3alZhOEZGVUpJWHNJaUtWVUluNEVydlMyclZoVHAyaDZaWDJ0TWhDTCs5?=
 =?utf-8?B?aFdvUTdxeVJRV3RpblYyZ092TEhvRC9KZkN1cGpuTmsweXJsUVpKa2dnT1Fm?=
 =?utf-8?B?V28yQndKUFRVVWxrQXp4Y1QzeFliOHBTTVpuNDZ6K3l2a0MwNEhwMjlSWnFj?=
 =?utf-8?B?bGptNEgwb1ZhV3YwNjkvc0EwYUorRS9qTjZ2anF3eTNSR3o3TTFabGN3TTc3?=
 =?utf-8?B?R21Qam1oSHY4UHJlODRxOHFnY1JUWmxOSU04S3BmMGd0K09SNjNNdmZyazIx?=
 =?utf-8?B?eWFhZ2tScXRWd0JNSFkxTkQwbVBTbnNldytLL0IwcU1VdTVpR1pEcWRxTVlD?=
 =?utf-8?B?R2Z3dExZckl4ZnR1TzVhU2wvS2YvNlpORUQrcm8zd0RWUm5NNmpSRE5tMU5L?=
 =?utf-8?B?ODdlUUVjYjdyT0Z0eThSWmFVYkNsRDY2L1dzTW5Ha3hId2YwUzRqK1cxODRC?=
 =?utf-8?B?VFNyVXd5NFZHTmp4OUVGNmJ1RTB3Qk1zdjJ4NXFWSGZZQnAxMDlrWU5iQWMx?=
 =?utf-8?B?bGV1TG1jdFdiWjlXWXlvdy9IalA1RGtLbzB5OUN6TFRNZTlOVlp5TGI5MjBR?=
 =?utf-8?B?OGVwdzVsd3NqbTU4ZjN1RUI0cXpYakE2M1VNVXAxOENpbysxOGd5NXIwNFhU?=
 =?utf-8?B?MnhzWWZCL0tVcHJtSG5wYmRFRnZ4Y05SaWtSVkpKSzlOcURzdlNxYXFyaGJE?=
 =?utf-8?B?RUVpZHJ3MmJBK1ZoejNUU2hBZjRiVElwbmlEVzhDNkpad1QzZjQrNkx3U0tu?=
 =?utf-8?Q?4zLWbPlHuTZ2y72Jur6fFxaP4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 511b8ff3-cd0a-491c-dcac-08de31765e3b
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 07:42:39.3451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxCn/YP5k24Q19hEd4ghua34BigvHda1d49bnydB1+PpqeoJvWtrAsPn5T4r3H4jESlVKn1HPaXYHOWojsOkMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6532
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

On 01-12-2025 12:16, Uma Shankar wrote:
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>
> Add macros to identify intel specific color blocks. It will help
> in mapping drm_color_ops to intel color HW blocks
>
> v2:- Prefix enums with INTEL_* (Jani, Suraj)
>     - Remove unnecessary comments (Jani)
>     - Commit message improvements (Suraj)
>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display_limits.h | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.h b/drivers/gpu/drm/i915/display/intel_display_limits.h
> index f0fa27e365ab..55fd574ba313 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_limits.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_limits.h
> @@ -138,4 +138,12 @@ enum hpd_pin {
>   	HPD_NUM_PINS
>   };
>   
> +enum intel_color_block {

Can this be intel_plane_color_block/pipeline as we get a new 
block/pipeline for crtc which can later be named as 
intel_crtc_color_block/pipeline

Thanks and Regards,
Arun R Murthy
-------------------

> +	INTEL_PLANE_CB_PRE_CSC_LUT,
> +	INTEL_PLANE_CB_CSC,
> +	INTEL_PLANE_CB_POST_CSC_LUT,
> +
> +	INTEL_CB_MAX
> +};
> +
>   #endif /* __INTEL_DISPLAY_LIMITS_H__ */
