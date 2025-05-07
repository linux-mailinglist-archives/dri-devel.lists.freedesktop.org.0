Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC43EAAEDF2
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 23:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BD810E1CE;
	Wed,  7 May 2025 21:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lJNLBinf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D7710E1C7;
 Wed,  7 May 2025 21:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746653915; x=1778189915;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fKhc3Ry7nlO65Rz5YbGMgsyLDmcr92/Tt94agkDRQsI=;
 b=lJNLBinfYDKDMzoxeWm8hxoiuOhJX/EieLyHRG8jGF263biRO5Y/3f0o
 ED7/lN3kY7CMfCMdFtNeFFMa2jgs7eys7C6jIXb/cxnH01vm4lAN40Q7w
 Y3idF7cmzwiVM2q7RaVaRp5xz7k2gjJsN74kTmNfURQjXZjgw9npqRPfU
 1QPK1I/7MA0fY2E8ALNuNn049fRrHymj3Awo+PtXNow4uESTG27ULF/Vt
 n5NM7jY9mcfT0D0gPwe8IbsmOBqu1jw48KK/ZNmSrk/+HhyOfSKzVL7jB
 kuyV/WI7tlBI7hFyeLcKpnwuMAO/+GoOupzjZsikvBDmARdxO6GAaJsZL g==;
X-CSE-ConnectionGUID: w+k9HqzTRQeTzjFuP+BWEw==
X-CSE-MsgGUID: 9UC3LCc8S1KAOlGEORxqoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48425874"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="48425874"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 14:38:35 -0700
X-CSE-ConnectionGUID: OM2hDFc2S+26/8CGlYcMLQ==
X-CSE-MsgGUID: +hR+7P2+TtmynfH7HDhdsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="137083291"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 14:38:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 14:38:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 14:38:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 14:38:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8sRv6xhrMrZH4f/XLm+csXvO9ougqEe3hUBuRWQmvM/+207AIlGPdUJNyIQ/S8GCx87WxZhXGW6Wz30JqrBmyZrGjtgSeB7YzjpjEzFA6YH1NlBvMD5E3dqyRJMOdfJNxJWcqPjC1YMMd4wz/m3FX7trqkDbuHPTPoWlVst9rkNGEd45QLvI/enWvlvJ5NaKamJshaX9qqgqlXBU19eDSG5FGBWE5JVGsWFhAmb5EanFiyCYAOzj0JEkuwsl/jc6M8s6EtTALfPts8XBGrzEjdxGUf2TyEpaCNimg1ldhm3zRVkBt/KwHFXNu+yZfcH3/2+q5XaUHCwiVpWN/pw4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pomhwbk9SQ3pPFNJ+aiPQuU16GMrOZ+p37izbik4lLE=;
 b=bm4NmGm/v98+zB33y7cLIUwbs/W7u1OtkrB9hZUgSx1YDR173+zQyeKmqsAe1jNKkYWgoqiIq9dH55g7B3rmfiUAeXODZqs9bHTGlJlOFEzx5M+LxhsAXTWRUpKFnl7FQu/69Un9hQxxomdbxXERwVlYW5bFY+/6vhrE+yvAtiWdnPCce3IrsPYRQ1vZcchHqqjalid8Rat63fAIMMICCQR/iMjtBTBNucEnhG9/DT9w9jI+RI8zvBn4E4JdUVCCQY47rxDT1vT7PzJSxCoW9QX0DoXMusa1QA1FhADuayGGrk2nhldkVLmy27grfJgJK832pDu60BjA95evGa08yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB7543.namprd11.prod.outlook.com (2603:10b6:510:26c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Wed, 7 May
 2025 21:38:29 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8699.012; Wed, 7 May 2025
 21:38:28 +0000
Message-ID: <8a5be8fc-a624-4bf9-926c-c7317f966717@intel.com>
Date: Wed, 7 May 2025 14:38:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/9] drm/xe/late_bind_fw: Introducing late_bind_fw
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
 <20250429160956.1014376-4-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250429160956.1014376-4-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a03:505::21) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: 72a0de57-b0b5-4907-ad25-08dd8daf8152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVhFa1ZRU0htZjJwaFhZVTJHV1h0UXhsTytuS1FKSHBNbHIwNU4yMGs4QWpi?=
 =?utf-8?B?ZzFMeW1ZYkdOR1ZTNHYwUXBKclNKT0Y2eU5uMTExb2lQZmF5bi82WDJuSEpm?=
 =?utf-8?B?S2czMUZaSG1Fc1VmZm1ycW5zWEZSUHlLYjB1Y3RwNXdxdHlwcm9vSDZNQXQz?=
 =?utf-8?B?M25XTGMyMnNKRWU5QVRWS1hNRm9nZjhNZTM1VFM5d1lacFRaKzNtZDJxWmxi?=
 =?utf-8?B?VjY4SE9vMWFTY0o2YUdBOE1oV3ZwNmQ1eExDNFQyY3ZOUGtVbG5uTGRZSWg3?=
 =?utf-8?B?eWxHTWpYTUVkQU4xMHpROU9wZXN5MEhxMWl5akNFbUdDRU95WkZNYzZ5ZU9a?=
 =?utf-8?B?QzNFOGNLcGRwTnB0aGphREpuekhleWpmOWJ6emhIY1dKL2hrUEViaEVLQkcx?=
 =?utf-8?B?UXBxcVQ3K0VXajNGdGhyVERhUzRIVVN0NTI5UkdING84WmV1VkJRdm9tc3Ns?=
 =?utf-8?B?Tm50ZVJFNVJEQWhDdmh4QmlvYjlXYXhzQmJpWDVLTktucW9NZjdHK3hiTHZQ?=
 =?utf-8?B?cEYzbVJVTXRJa0ZtbDVIMFRSUmZOdkg3NnBuMUNyK2ZKVEhKTThUQmdSWVFm?=
 =?utf-8?B?cEFaSWcrVzVRQ25NY0tTdFluMGF1ZC82bGsvS0w3RDl0SnNoZThUTS9qZy9L?=
 =?utf-8?B?ZEM1Nk5HdDltVTgxcEhMTTAxN0p2cTlna3Flalh3WnRQNW8rTjcraWQveXFD?=
 =?utf-8?B?blZpc2VVdzlTam1LME5jUUFtVS82RlZYWnhOSWQ3T2RYblJTMmVDOVMyY2x1?=
 =?utf-8?B?TGp2MUZUSjF5bkllc3RnR1pqc0xMQ1YxbjNLSGdmYUxQbmF5SnBOWFY2YTk5?=
 =?utf-8?B?dlFwSVZvMUhzalNIQUlrcUZwbWg4RFhJbVFHbWowNzhmUVlSSlV6aVduejRD?=
 =?utf-8?B?aVB1Z3hTUmM4R044WGQySmFyTlZ5YmtXZXFVV1JZc3k3SnVyZDFMMmkvVW82?=
 =?utf-8?B?MzloNWNtVFhuUkpOY3crTm5rR0JTUG5Kem9jT2JEbUEySHgxdUROZzZCVzJj?=
 =?utf-8?B?Y3h6UkVpSEFIOWduVWlIbllHWEo1b09OdmVTWGxhaXJhYmtzK3R2R0d5dGFu?=
 =?utf-8?B?YzJZZ3B2eHl6QXJLWHBxMDBhS1FBK3BtdlFsYUc4MEROeFVScU5ZNnBuMEhZ?=
 =?utf-8?B?NWhlQUZCMzhBZ0w4TFFKalcxeHZsalRvNGhJOFhqZGlGSmN4RTMzbEc1LzVy?=
 =?utf-8?B?MDBJSUNKdUxpbHBncWltQkRiZHZOcFJFZWFiRG16SzlzTGovb0JwTlhMUjlt?=
 =?utf-8?B?K1ZMbFc1cEIyOExxODBEbDFtd2pJcFh6OEFoWkVKRFZsckpoeXBDb3lURXE1?=
 =?utf-8?B?OVRPamMrMVI1bkJDR2lRQ3FRSHBGd3M3ZjRuQ05jQ2R4RzVtSWNFWWVRWjlu?=
 =?utf-8?B?MFpKcU9hVXk0aHB4ajBteUpvcU43T2lMaUlxTDd3ZkRtQmltVU5uWEYyMXZU?=
 =?utf-8?B?SE1CYllYSEFWUlcrKzc0UThTNGZiT29pSzIrcENFK3RVOFk5b1N3dTZYUHhH?=
 =?utf-8?B?dWRGU0FMQU0zbDB0dW1NandNVUQ1Yk55ZkVwS25ncFhmeHpudjB5UmJGK21H?=
 =?utf-8?B?VDYyTDFXMjVQK1l2cG5XbTgyTVVUOTBER1dTZkRKRWRUaUt1OWhaQWhDSHdk?=
 =?utf-8?B?VVRNNnZ1bVRGTGJYLzM5NlBwaktkVE13Yi9hdkZVby84eFlPWGFySHo1Y2VQ?=
 =?utf-8?B?UUlYVCs0dHpzNlBuU0tEbVN6SmZnZDlwMDMrMFhpZU9PR2FHVFVXU053aVBw?=
 =?utf-8?B?Sjh3Tk5XVlREeE5EVlkrd2J2QUVZR200ZmtPMUhib2I4NXoxZHJ6cTZpQ2kw?=
 =?utf-8?B?SjF1LzM3YjBONnBZTk5aMGUzZkZDVXVTNTdrdzJSUGV5NHd4WENTYTJtVXNx?=
 =?utf-8?B?MlJCYVFVcE5rckRyTFZydFZldTlxYnJJd1RyTUx3dmhwMFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkdCUVpSZTBWc2J6blp3aUMrM2dKczN3N1BHamYvaGRUeEo0bEZUeGcyZjl0?=
 =?utf-8?B?cGJzQ0Fwc2x5QnAxNVRmMit1VG5ja1lwWTVKWmk3c1RISlBpb1RXcHJick9r?=
 =?utf-8?B?ai8zZ3NLeXllNkQ5VHJXVEZrNnphQWMvZ0hiUmZlRGhzQVJYbFVrdnlPYjRK?=
 =?utf-8?B?aEw0aWVWbVFEMCs0Ym5vcHdoS3F3aFVpUmtNVjZrY2ErV3hlSE1jdXZNQWFq?=
 =?utf-8?B?dkoramdQb0t5RUkxbnVnQ2QvNGxwVjE2WEtFWVczOHcrOHArTVZpdmJxSWV2?=
 =?utf-8?B?ZHVhRVpta0NNRlFSSEIyaUJvOVBJOFhmTGFZN3c5UTlDdjFGWEVqNGFoVHBG?=
 =?utf-8?B?ZWx4a3JaQXBCTUx0ckF0OGplUGVYRXI5VCs5ZzZmU29CbDJqSFhQU1NqMWow?=
 =?utf-8?B?L3Z6Z1pQWGJ3ZzB1K09ieEt3RXhLZm92cVc3SXZ6aXBkWENZOUdKb0RTZkRi?=
 =?utf-8?B?RE9lZ1RtQktPKzdNTU5jMVBVQ1NZMHg1V1ZqOVlPWE9OY04zUHRML29nc0Mv?=
 =?utf-8?B?SWk3MTRFL3ZNN2wvNWkwMk5jZFpMR0pPT3VPK3I4eFJzZW1lVVhSaWpWUlJy?=
 =?utf-8?B?S2gvcFVRSEtkTEF6V3FINDMvMFVjOVltcDRNREFnWmtFMWRML2dJcENUZEdy?=
 =?utf-8?B?NFhRWUdXV1RYcjJYcGpGLzl1TGtOcHQ2ckMrb3NmU2w2RFFxMVJ1QlZPdS9y?=
 =?utf-8?B?RUNiMU1malNJOGJmeFQzbDQ3UGM1UlY1Nk5pbTYxSFhtMDcxaVVUakNndVJF?=
 =?utf-8?B?THVNUjNxaURWcHdjZHdpV0lrRXlEN1J1blh2a1pnYXBKaXUxUWVXRUc1WnB5?=
 =?utf-8?B?cmZjUENwV1ozSkUwZXQyeTh6czBMMDdiZWVZdlpneWNWWE5DckRWbGttTE02?=
 =?utf-8?B?ZmFHUStNL1BZVUgwdVdJTENWcEZ1U05vaWljMndHT3pOTCszS2QrR0xPVHdm?=
 =?utf-8?B?WUV6Nys4WllSMXM2VkdxNHFIam9BY0lGb2kxb1ZUSEpyb1A2WjRUM3QyL3F1?=
 =?utf-8?B?cnhQS01jR1BCT1ByNmU3UTVteFl1TUQzbVRoelNCd2NNeTJQekJhSmxxbHB1?=
 =?utf-8?B?SnVyQm1YbWhpNmlmcWFhdnE2UEhwVGszU2VQdE1hcjR5RUl3L1NoMzFxeERM?=
 =?utf-8?B?OVVsa2lxQ3pQRjBqT3o4QVpuQ1lhVEJoTmJZK3gvNDFnK0pXZUhBWENKdGU5?=
 =?utf-8?B?ajQ5QUFEY2grZXVRdjAxYXlhZGtNK0FXVitWOU9MS0Z5NHZwTGV1SzVFZ29Z?=
 =?utf-8?B?cVpKWnMwalhjRCsxZE00SW1uay83dlN6L0RueVVDQ1BrN3hYbHRxa0pCUEhF?=
 =?utf-8?B?empLL3EyaEhZeWJ3WlhlT2J0UDNobG9NZGpkVGNBMEl2TDVpa1FjWVZEL1la?=
 =?utf-8?B?QUdRTDNkaFFlV0I4Z2RPV2tsUUhnZEZvSTlZblFRY3pzUFRRSFR1T1RSQW5h?=
 =?utf-8?B?WUp4OFdQamhsZ3hrcmMyazUvR2tEZVlHWEs4YzVUeUFvSWJtcFNxR2Vab2xH?=
 =?utf-8?B?b20vc3lpb2FsR3RieThhSVVVNHlNS3d0OVEzeitkRUZWNVdJV255OEtzMzRl?=
 =?utf-8?B?L1hVUlFkQloyeHlNSjFhazB2OHlXaElWTG5WbnVxQmozc0Z5dExGQlczdUVO?=
 =?utf-8?B?clNpR0tiZ3MwL3pKR0ZyU0doR2l1dkV3Szdpc2NLTFVIcmFaYW9wZUZnQ1Vu?=
 =?utf-8?B?VnNKVnRqSWxCVG5GbGEzbHBLQldMT2wvYWpyZHcydHdzMEpSTWQ4dEF4SUVV?=
 =?utf-8?B?QkpTMWZJYkJ2bHNtdkFPZDVXKy9BQ1BjRkVnelkyWXlaOStTRkVIUVdtSXZa?=
 =?utf-8?B?dXh3U0lDUThmZCtYVS9Dd0pld3RXRGhIZGhjV1dHK21VUkxpbnh1QUdBNEFS?=
 =?utf-8?B?ZEhmTjN5bFJGWlVTV3N4bTdVYVNwMmVLd0RYRTdoOUw4d0xHY0piSmZ0dTUr?=
 =?utf-8?B?OU8vYlRCNWtFNE1rU3JkYlY1Ujh6YVdQdGk4WEdFQ3htRG0yNUJPNU9rVXVo?=
 =?utf-8?B?bnJQVUVhQ29RQ2VpVHhFUmtsUDJ5aE9RaUxsSHU3bmlBM1ZhdFQrSjkzV2dw?=
 =?utf-8?B?d1lBaUFzUkN3YVVBTHU5QzQzMTBZMmh3MEVCeTZDem93RU1nczc4Y3k0eDRQ?=
 =?utf-8?B?eFVnTDBrUFZVN3lIaDFoMFN6UDNhelFnNHZGN3pJWjg4cDJtNkUxVFFqTUh1?=
 =?utf-8?Q?zJ4C0pRTCrY46zvUTpUkGUk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a0de57-b0b5-4907-ad25-08dd8daf8152
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 21:38:28.6924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QsCpXS6o39HpYGWH7+wtDSuAvf7l9fr2vVv/P3vYg2T0q4pGKY8p+1hC08GbCYkO9mK/XzxoIEbs0cC4ACyAtbiCvTYyQ6xbQgDkzAWtY7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7543
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



On 4/29/2025 9:09 AM, Badal Nilawar wrote:
> Introducing late_bind_fw to enable firmware loading for the devices,
> such as the fan controller and voltage regulator, during the driver probe.
> Typically, firmware for these devices are part of IFWI flash image but
> can be replaced at probe after OEM tuning.

This description does not fully match what's happening in the patch, as 
the main thing happening is the addition of the mei component.

>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/Kconfig                 |   1 +
>   drivers/gpu/drm/xe/Makefile                |   1 +
>   drivers/gpu/drm/xe/xe_device.c             |   3 +
>   drivers/gpu/drm/xe/xe_device_types.h       |   4 +
>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 104 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_late_bind_fw.h       |  16 ++++
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  95 +++++++++++++++++++
>   7 files changed, 224 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
>   create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
>   create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 9bce047901b2..a8cc1876a24f 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -44,6 +44,7 @@ config DRM_XE
>   	select WANT_DEV_COREDUMP
>   	select AUXILIARY_BUS
>   	select HMM_MIRROR
> +	select INTEL_MEI_LATE_BIND

I'm not sure this is enough to guarantee that late bind will work. This 
selects the component, but the MEI_GSC child driver also needs to be 
built for the component to bind into it on dGPU. We can't select 
INTEL_MEI_GSC from here because that depends on the graphics driver, so 
we'd go circular. For other components (PXP, HDCP, SW proxy) what we did 
was notify the distros that they needed to enable the new config for the 
feature to work instead of selecting it from the Kconfig.

>   	help
>   	  Experimental driver for Intel Xe series GPUs
>   
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index c5d6681645ed..6de291a21965 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -76,6 +76,7 @@ xe-y += xe_bb.o \
>   	xe_hw_fence.o \
>   	xe_irq.o \
>   	xe_lrc.o \
> +	xe_late_bind_fw.o \
>   	xe_migrate.o \
>   	xe_mmio.o \
>   	xe_mocs.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 75e753e0a682..86a7b7065122 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -42,6 +42,7 @@
>   #include "xe_hw_engine_group.h"
>   #include "xe_hwmon.h"
>   #include "xe_irq.h"
> +#include "xe_late_bind_fw.h"
>   #include "xe_memirq.h"
>   #include "xe_mmio.h"
>   #include "xe_module.h"
> @@ -889,6 +890,8 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> +	xe_late_bind_init(&xe->late_bind);
> +
>   	err = xe_oa_init(xe);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 495bc00ebed4..57b63cc9b8ac 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -16,6 +16,7 @@
>   #include "xe_devcoredump_types.h"
>   #include "xe_heci_gsc.h"
>   #include "xe_lmtt_types.h"
> +#include "xe_late_bind_fw_types.h"
>   #include "xe_memirq_types.h"
>   #include "xe_oa_types.h"
>   #include "xe_platform_types.h"
> @@ -543,6 +544,9 @@ struct xe_device {
>   	/** @heci_gsc: graphics security controller */
>   	struct xe_heci_gsc heci_gsc;
>   
> +	/** @late_bind: xe mei late bind interface */
> +	struct xe_late_bind late_bind;
> +
>   	/** @oa: oa observation subsystem */
>   	struct xe_oa oa;
>   
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> new file mode 100644
> index 000000000000..7981fc500a78
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation

2025?

> + */
> +
> +#include <linux/component.h>
> +#include <linux/delay.h>
> +
> +#include <drm/drm_managed.h>
> +#include <drm/intel/i915_component.h>
> +#include <drm/intel/xe_late_bind_mei_interface.h>
> +#include <drm/drm_print.h>
> +
> +#include "xe_device.h"
> +#include "xe_late_bind_fw.h"
> +
> +static struct xe_device *
> +late_bind_to_xe(struct xe_late_bind *late_bind)
> +{
> +	return container_of(late_bind, struct xe_device, late_bind);
> +}
> +
> +static int xe_late_bind_component_bind(struct device *xe_kdev,
> +				       struct device *mei_kdev, void *data)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
> +	struct xe_late_bind *late_bind = &xe->late_bind;
> +	struct xe_late_bind_component *component;
> +
> +	component = drmm_kzalloc(&xe->drm, sizeof(*component), GFP_KERNEL);

The component is unbound and re-bound on every suspend/resume, so if you 
do allocs in the bind function without freeing them in the unbind you'll 
keep the old allocations around. Why do you need this to be dynamically 
allocated to begin with?

> +
> +	mutex_lock(&late_bind->mutex);
> +	component->mei_dev = mei_kdev;
> +	component->ops = data;
> +	mutex_unlock(&late_bind->mutex);

This is a local variable right now, so locking around it doesn't do 
anything.

> +
> +	late_bind->component = component;

This assignment instead you might want to protect.

> +
> +	return 0;
> +}
> +
> +static void xe_late_bind_component_unbind(struct device *xe_kdev,
> +					  struct device *mei_kdev, void *data)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
> +	struct xe_late_bind *late_bind = &xe->late_bind;
> +
> +	mutex_lock(&late_bind->mutex);
> +	late_bind->component = NULL;
> +	mutex_unlock(&late_bind->mutex);
> +}
> +
> +static const struct component_ops xe_late_bind_component_ops = {
> +	.bind   = xe_late_bind_component_bind,
> +	.unbind = xe_late_bind_component_unbind,
> +};
> +
> +/**
> + * xe_late_bind_init() - add xe mei late binding component
> + *
> + * Return: 0 if the initialization was successful, a negative errno otherwise.
> + */
> +int xe_late_bind_init(struct xe_late_bind *late_bind)
> +{
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	int err;
> +
> +	if (xe->info.platform != XE_BATTLEMAGE)
> +		return 0;
> +
> +	mutex_init(&late_bind->mutex);
> +
> +	if (!IS_ENABLED(CONFIG_INTEL_MEI_LATE_BIND)) {

also need INTEL_MEI_GSC for BMG as mentioned above

> +		drm_info(&xe->drm, "Can't init xe mei late bind missing mei component\n");
> +		return -ENODEV;
> +	}
> +
> +	err = component_add_typed(xe->drm.dev, &xe_late_bind_component_ops,
> +				  I915_COMPONENT_LATE_BIND);
> +	if (err < 0) {
> +		drm_info(&xe->drm, "Failed to add mei late bind component (%pe)\n", ERR_PTR(err));
> +		return err;
> +	}
> +
> +	late_bind->component_added = true;
> +
> +	/* the component must be removed before unload, so can't use drmm for cleanup */

this has now changed (see 8e1ddfada453 ("drivers: base: devres: Allow to 
release group on device release") ), so you can use a devm action here.

> +
> +	return 0;
> +}
> +
> +/**
> + * xe_late_bind_remove() - remove the xe mei late binding component
> + */
> +void xe_late_bind_remove(struct xe_late_bind *late_bind)
> +{
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +
> +	if (!late_bind->component_added)
> +		return;
> +
> +	component_del(xe->drm.dev, &xe_late_bind_component_ops);
> +	late_bind->component_added = false;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> new file mode 100644
> index 000000000000..21299de54b47
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_LATE_BIND_FW_H_
> +#define _XE_LATE_BIND_FW_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_late_bind;
> +
> +int xe_late_bind_init(struct xe_late_bind *late_bind);
> +void xe_late_bind_remove(struct xe_late_bind *late_bind);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> new file mode 100644
> index 000000000000..ea11061ce556
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -0,0 +1,95 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_MEI_LATE_BIND_TYPES_H_
> +#define _XE_MEI_LATE_BIND_TYPES_H_
> +
> +#include <linux/iosys-map.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +
> +#define MAX_PAYLOAD_SIZE (1024 * 4)
> +
> +struct xe_bo;
> +struct xe_late_bind_component;
> +
> +/**
> + * xe_late_bind_fw_type - enum to determine late binding fw type
> + */
> +enum xe_late_bind_type {
> +	CSC_LATE_BINDING_TYPE_FAN_CONTROL = 1,
> +	CSC_LATE_BINDING_TYPE_VOLTAGE_REGULATOR
> +};
> +
> +/**
> + * Late Binding flags
> + */
> +enum csc_late_binding_flags {
> +	/** Persistent across warm reset */
> +	CSC_LATE_BINDING_FLAGS_IS_PERSISTENT = 0x1
> +};
> +
> +/**
> + * xe_late_bind_fw_id - enum to determine late binding fw index
> + */
> +enum xe_late_bind_fw_id {
> +	FAN_CONTROL_ID = 0,
> +	VOLTAGE_REGULATOR_ID,
> +	MAX_ID
> +};
> +
> +/**
> + * struct xe_late_bind_fw
> + */
> +struct xe_late_bind_fw {
> +	/** @late_bind_fw.valid */
> +	bool valid;
> +
> +	/** @late_bind_fw.id */
> +	u32 id;
> +
> +	/** @late_bind_fw.blob_path: late binding fw blob path */
> +	char blob_path[PATH_MAX];
> +
> +	/** @late_bind_fw.type */
> +	u32  type;
> +
> +	/** @late_bind_fw.type */
> +	u32  flags;
> +
> +	/** @late_bind_fw.payload: to store the late binding blob */
> +	u8  payload[MAX_PAYLOAD_SIZE];
> +
> +	/** @late_bind_fw.payload_size: late binding blob payload_size */
> +	size_t payload_size;
> +
> +	/** @late_bind_fw.work: worker to upload latebind blob */
> +	struct work_struct work;
> +};
> +
> +/**
> + * struct xe_late_bind
> + */
> +struct xe_late_bind {
> +	/** @late_bind.component: struct for communication with mei component */
> +	struct xe_late_bind_component *component;
> +
> +	/** @late_bind.component_added: whether the component has been added */
> +	bool component_added;
> +
> +	/** @late_bind.wq: workqueue to submit request to download late bind blob */
> +	struct workqueue_struct *wq;
> +
> +	/** @late_bind.mutex: protects the component binding and usage */
> +	struct mutex mutex;
> +
> +	/** @late_bind.late_bind_fw: late binding firmwares */
> +	struct xe_late_bind_fw late_bind_fw[MAX_ID];
> +
> +};
> +

A lot of the variables/enums in this file are unused in this patch. Can 
you move the additions to the patch in which they're actually used?

Daniele

> +#endif

