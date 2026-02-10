Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Xnp8MwqyimlhNAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 05:20:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21548116DDB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 05:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C3510E198;
	Tue, 10 Feb 2026 04:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUDfcKWX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364E110E198;
 Tue, 10 Feb 2026 04:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770697221; x=1802233221;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3RZUctZxTPXT/XKUVSBhKJ3loso/j+0PZGj+jqUk7/M=;
 b=mUDfcKWXLooPsh4K0g1PM7RBqn3dE5PJv05JYkA4KQ6+iwwnRAlM/6ml
 RBhchZcA/l8pvkOIa/GkH8bY2JP7mpyw0zA97QUQs9UP1/4gChHGdLcQW
 Jk6t2RxavKKvGcas3VQfaWxoO/ze/TnxE/PAVTLJYsDuGuT41S4lJmLbk
 tbS1QxMbsKbqq/qp6ieTqtw5h2ti5vsGSNNW9Waipg4Y4JWbVEp3rhzHD
 plFKQc9sJQmtIbv1o+H8Y9+/JavM1agmGxEn13wMsEfJoT+ynEogj77mW
 kuVc4FASJnw4mIYjEnbePT5DoK/uNwsZuondMM4xAep04uum5kHdDGeEf g==;
X-CSE-ConnectionGUID: ZgX/WVKYQeOinFfAyT6PsQ==
X-CSE-MsgGUID: vSD8J3DRQK+6EDGJz5ItkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="70831714"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="70831714"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 20:20:21 -0800
X-CSE-ConnectionGUID: NvvJ41XtSSK8AZ/ZcyuuoQ==
X-CSE-MsgGUID: KxVy+VeWRU6us6/bQJ/yLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="249426129"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 20:20:21 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 20:20:20 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 20:20:20 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 20:20:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKBqGhTaDr1xDzbYdWMZFG8s4ZcqMgUZQ3k+0q6u07WIw83dCmg4/WYIsTG1GVKJ79YVIW2rNYXAcDU+UTAcsawNx7VbgVeAbh3CQ5fuXxtuJd+bE60pHqCsobpVGixdUS/la4VKRxyWObS9hh7OyMPtXj5mcjitdDN3sNTGuFe6e55U6fT+c+IR/jyl7NXXcWBRpcqmmZl1z/L7L1siHbDZIGoQQJNiF/EJ2j9TC4Y3goYGYzTPmIGSmGYilpLCCk4pgaZYyGC/5n9q+sVppSdAsdtqfzVvYyVURli5yszdijU1xLuTz1yJCaBIVPMEW2PSR/GpkjxrQKde1uEYyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxhQvPIgyND3I5zJ0/n8FcL9tDhhGbrGcu2/vN1HbtE=;
 b=br5888Ci/MjVVYftTLhYF3pRDWteoXPzl5uTG89K32Ot1Hu1zQ50RVh7d0cF6ORIzcxvvwhickQ0hty8KgpXwn8ZnrA8iNiEk36z7iFjJzBTvZbyRIPvnqwaaLjy5S0scZQpp/CJFccsZ5oHAvb2LHtoLyx7gdipChiB7i6hNCrdPihPySd223rv6x8cBNIVgEK8mBBH2b0U0p2WJJwfXWyb3/y+RaEGV2XHBmTltRDXM5SpIxLEKaSAAhKYjG8piX7CDhH8VoUZIc2LnEMeeEe3ZqyW/NNF7dR1GuN8O3SCzs/BlHrO6S61Ri44CdaGXXCSz1dxc5SpWQdsVuRPKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 04:20:17 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 04:20:17 +0000
Message-ID: <c92532e7-4133-404b-a2b5-398ed69562c8@intel.com>
Date: Tue, 10 Feb 2026 09:50:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] drm/xe/xe_drm_ras: Add support for XE DRM RAS
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20260202064356.286243-7-riana.tauro@intel.com>
 <20260202064356.286243-9-riana.tauro@intel.com>
 <aYI3K0dQ46h4LIGN@black.igk.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aYI3K0dQ46h4LIGN@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW4PR11MB8290:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f4eefe-f1c0-4c0d-31a1-08de685bb1da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVRvVDFqMXdvd29yZlhOS09CK2VpRnhIVTFRdmtDWUlyK2lucndvQk1DRk9Z?=
 =?utf-8?B?NTRSNEd0akd0U09qZy9FbE1kUUwwbEZQejVEcVlkYXIxZDhnZ1FlQVkrYmJX?=
 =?utf-8?B?anMyNmJYc3dPK0hMU09rVys5NTN0SzRIRmdhb1gzODBXenQvNi8yOTNYc2tj?=
 =?utf-8?B?S0U2YWRmY0NRWG1zTHAvV3JNN21vQXRpaUprdEdGMjRDd2FaM3Z0VTZaRVRH?=
 =?utf-8?B?NytSK1FsU2RDNGkxQmY5VEpkRUVNMHRkUndjRFJyUlZYTDBNWEhRZlN3SDdD?=
 =?utf-8?B?UEhmaERCK0MyeUNkWGsxalkvYXRhamJoaEtPTFFxOGhBdkRDSlBSUVA2ZGdn?=
 =?utf-8?B?ellSYlU4ejdYanBWNWNQdTNBSVhoaUZFVFF4ZGhXZXpJM1VEWkJ4ZThFWEl4?=
 =?utf-8?B?djBGakcxNFBWaFNJQVhTMDRaR3FBZ1ZtMVdWMlZ5dGRrSmxlaHBxOXgyWGN5?=
 =?utf-8?B?ZnB1LzNkOWwzTTcwY2RUMjNiZHhsd0pvL1R4ZkpuQ216OFRQSVlraTMyZFNN?=
 =?utf-8?B?dUYxOGlRTjFNYzhiSmRaUVNNeDA0dDB5SXYwZFJXNFRRaXpxTmFSbUNQU3la?=
 =?utf-8?B?NmNJUjFMY0YyRnhKczY1MmtPTGZIdzZBUEhVcHJnL2xpOEptSUphZkt4UnRH?=
 =?utf-8?B?Yjc5VkhmMTFpNUhyR25WTXB6dTJCS3lxdHF4T0YrYjdqNjlpcXBHWG50RTdv?=
 =?utf-8?B?UzRpQXErR3c1S1hqMDRHNkdtM2x4UWQ0bW8yeDVYTHZGb1ZOdUlDcDNwcHdY?=
 =?utf-8?B?eUlPR2V3MmU5ekprUkV1dmRhNDlpNnhMdHZCM3RHMy96NXpYWTk1Z2xXS292?=
 =?utf-8?B?K29Hd1lwOWI3RUtaY21DSitpZHFmZnVvWmZ2dXVXY013b3JQQWhKQ2EveStz?=
 =?utf-8?B?NE4yZ3Rya2NOUFREZ0IvakRKQzJiLy95aElVakRlNUJORDQ4R1ZLSFc2WG0x?=
 =?utf-8?B?dlVNS1E1Mkh2aENxQ2FuaGJ2OTBtTTVrTWRIWEt1cVE0MHhMOVBpUjljUG1K?=
 =?utf-8?B?OUJPZXNhUjZ0b0FGL0h4T3FNL0dpY1JOTUpiNExmY2NCTmZ4Z0xyNE0wTmVs?=
 =?utf-8?B?VzRtdmFuSk9xQStENnlMR09JTERucTIyTWpRd1hkNHhLRURxRzQvMDlxRUV5?=
 =?utf-8?B?VCtoWGxPZFFCUVgwVlhyQ3NML25XclpUTFFvd3JYQVhWWXdleXZOamh4SEwr?=
 =?utf-8?B?UUVxRWxOK3JKUEo5d2ZXUmdsYWxJZ094WW5EcktJSlIyZW01ejJHdk9HQVNE?=
 =?utf-8?B?WXQwUTduQW9Cd0xheElxdVh1dmowUmV6VmVkN3pmd0JwbnRoNlh2M2dWZHhY?=
 =?utf-8?B?T1R0V1g3SFcyTTkzS2RFbFpENDRKeitRZEtwTDNqT2d3dEJvT2x5cVFmVUZv?=
 =?utf-8?B?MTNTVTd4R3dLUmF3MDJRampTOGdNemRmK1pNTzJSSXB4R0lDa2J0TjFTbmx6?=
 =?utf-8?B?RDc1MGk1c0RERk8yZHFOTlBpMW5EMDFLMnlFWGJBNmFIQXpSU3Q2YU0yUGlN?=
 =?utf-8?B?a1pqVDh3YTRMRjNXM1IybkM3MFpkNTk4WDhDRjdyOS8raXlSaGhsb29JVE1U?=
 =?utf-8?B?NmhseTZiaFNsdFM1NE81NHVvWUtjdmRVT1ZqSFFyM2pEdTE2Q2tiS04ySXE3?=
 =?utf-8?B?eUw1RXJlV0RrcnN0SWMrK0lwMFZ0OHFlRllIVVJiblB3NUZIMVQvRnIzb1o0?=
 =?utf-8?B?RUo1TUVxdFFlVktXclVKdFgxL0dmakRpcVlzWGxtTVhmT0F2a3ZUSUFVbmV4?=
 =?utf-8?B?NUxQcGF2RmhMenBXUnZwR1JINHNRblhPa0dNaDJOMk04aFJlbFFCL3c3K0Vx?=
 =?utf-8?B?S2JmUStwQ2NqSXBWQldibUgzVzUrNXpLK0dMTVJHd2djelArcFhnZDVNNGov?=
 =?utf-8?B?c2ZJNnQvUGM4ODRPdm5ZN2ZTWTB1SXA0RzA0NUw4cTAvRGxPUFloMENDcFVM?=
 =?utf-8?B?dDFyUC8wUFdhcE5rdUpaR1VQNXNhT1YzN2RpUVhzNDJLY005SWNCQjhGb1dk?=
 =?utf-8?B?QlZWaHJqd0xTTE9vVWVmOW0vTWt5Qm1DWDB2YzBMcVE2OWZlVVoybCt6S2g3?=
 =?utf-8?B?QlpmV01SN3pSTEhEYytxWGdFcUFaTEhna0dkODRFUWFuMWI5MG03SjJZRys5?=
 =?utf-8?Q?HIQg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVRHV3YxdjcwVm9ROVBwaEgzUngvc3ZhRWxmenVPaFZDVmthbENJNjRKNmtm?=
 =?utf-8?B?Nkk2REtYUnhOWTNQZGtkOEovM0hyK0wvcGZyM2F4SThNVXl0dUg1NUpDY3Yy?=
 =?utf-8?B?em8zTHMrdnhvYjNjYS9wampDSytSQTZPQ0F6V3d1QVB6VWM0RTUxbXdwMlF5?=
 =?utf-8?B?TmNwRjNaOUVHZ2VMZCswV290VnFrajJvWE5mRDh5dE53b0VzRk5vZ2l3YSsr?=
 =?utf-8?B?YzBnLyt2UThtUmN6bHdnZkNFei9FRk5ZempwL2lxTTNCWVlOUmpWVmlGamM0?=
 =?utf-8?B?UjF1cXJ0Uy83cnQzaWdvOFBJVjRPb0twZHFHUkNJOUIwR1FWNWdXNEdzWnJz?=
 =?utf-8?B?eEFWeVVibFZGdUJYaHRHbjlQeVNCR2IzZFN1MDVWdGZWTndoUXZuV2pSaFg3?=
 =?utf-8?B?TFI1Y1NsRDBjaWFMem51UW01TnNmUHBaZjRGbFkxKzEzWHZXcHRiVmQ5Y2tB?=
 =?utf-8?B?NkpRQ1k3d1k5M2M2OE1WenFhMGlDb21KcVIxdTFsVldtamZ2OEM0UzdSRm0y?=
 =?utf-8?B?ZzZKdXJOSVg5NVRlRi8wWFlyYVc2d1NWbzc2K2VwOTNDaW91bkZuU2l3S1dY?=
 =?utf-8?B?WVVHZEZuL2k1WTBEZzdNN2pIZ3pTWUhLcDN4K2l0UzZpSTgraWN3VjR3eHVy?=
 =?utf-8?B?UlFxTXhHaHRpUXpDa2dwZTVhMnMwVmpCK1MxZHI5WFY2QUppWFlPY3Z1MXpE?=
 =?utf-8?B?NXVyM0NsR1h2b3JqckFwWVQxcjJMNUtvT1VXVGpaQTJXV3JTeXJaanNENG5K?=
 =?utf-8?B?elFrZUJ2d09QaWk3WHJzSUFsRWd1UEJyRSt2akZBRmVLb3gxcWoyTzFDY2c4?=
 =?utf-8?B?NUdjRXBTRWtLUDZlK1hnTzI1eEhXZUszZUx5dHRKY01GVHVsbHNVVCtpaE9j?=
 =?utf-8?B?azJyblF5dGhjRm5UL0hCWDdBUXlJWms2ZW1ldGJjaXpXc1ZGOW9PSms5YjZT?=
 =?utf-8?B?MzlrVmlvK09kREYraWZPemZIOXE5a0ZDbm1MNk1EK3lHSWxDODZMdkJtc3FY?=
 =?utf-8?B?UnFJaVBxemdOOU5oM1FFN1ZPcUZZam40cHhmVzV2T0xaVjVCbG0yL013aWJm?=
 =?utf-8?B?TDRoUHpuK1lwUXBEMHZ2dGFibnNYTG5BTnN6MlJFbEFFOWc0aVJaeWcrUmZu?=
 =?utf-8?B?bVZTZXF2aER0N25jU2ZlR0FOTlhPRHR5VW5rK29jOVFLVUwwaXV4WXhEZnJl?=
 =?utf-8?B?eEdjUkltUG1qZlEzWlB0MVdWNEt5cmtnTmdQZ1Q1WVQ1dVFFeU9zKzkzNTZE?=
 =?utf-8?B?bERjNFlUUzh6TVhaMFdWT1BKL1Q0cXBJWjFtbjF4MGZGc2lTUDcySHpkK2dI?=
 =?utf-8?B?b2tUYjU5TWZyZU40RzdCYjMxNm9hcnQ5bkZsdjIvd1lPMDNMKzFLYVUwVzhI?=
 =?utf-8?B?aHFzRSt2dDJXWi9vQzlJbEJ5ekNFWXRNWS9GZGluckZRN0tWV0tCSnJVc0Ir?=
 =?utf-8?B?aHQ4QjZxT3FJSzV5N2VUdXU0TmpsM1daWCtjNWs2Z1FnTUczNjF0MFg3OStJ?=
 =?utf-8?B?Nis4TmJxYWpBUHpIMjQwblBZWlE3VEJvOGhJY0JPbm9PRE1CSWF5Tmp5eXNh?=
 =?utf-8?B?Ukh1b000Z1VVTi9JUnpCKzVnNXBTN1ExVVQrYVBOcDRZUWFIZ3ZKVE5mNzA4?=
 =?utf-8?B?U2pzT3k5c3pxRHE4NEgzNGpSZ2FFUldGZ1NCaFNDdnB3MGNzYStrYldLdWZs?=
 =?utf-8?B?N0lWSE9Ec0pEVHlBQ2kyb2ZtUlpub29kTFRETXA2eWhMK2JwVVNYRkhRbnU4?=
 =?utf-8?B?K3JPdXAwNFNtSkNWclZ3OTZMbW9wUmZPcCtqTkFZOStBV2s2ajduVEJYQTho?=
 =?utf-8?B?WWlEMEMyZXpMRG8xRlhLMzZPdmNqc1BiSFZGQ2lEcTh6ajVGOW1wUDRaQTJN?=
 =?utf-8?B?NEVGMUpIRGpMN2R6U1Q4NkZTc1VLdVluR3FrZi96QmFVV2FocmtqNHI1UzFp?=
 =?utf-8?B?dTNDcWlNdWhldzUvaGFsQlZnK0xNZkc4aDJ6eVduVVpCN0x0M1BvWVYvaUJQ?=
 =?utf-8?B?L2g2dDFNeXRGS2FwU0cwcFlRV2xyRXV6QzhHTkk4T3psbTZqOWJJUHJsRllZ?=
 =?utf-8?B?eVp4TzBtakVzVldFNklNL0p4TzlkMWJtN0lvaU45MG9yWXdjNUN5b2lMS2Zz?=
 =?utf-8?B?SGJuKzVCV0wyajRidERmdGVaZFo1NFk0WVB3TElqYkhKUGliTG03VXgwaG1Z?=
 =?utf-8?B?YWNKTWljWWVNNWpyTklkZkdJeDJzT1hwcFo1aTdPSVRlbUhLdVMvVXJCSEJN?=
 =?utf-8?B?eW9qNk1UVWRJWkdUSzk4V1FYWmFURDJaR081R3FrclBBb1k3d3ZWOURZRUNC?=
 =?utf-8?B?MlA4NE50WjdHQ0h0RVcxTGl1dWxUazJqTXNUcERFZFhiaTVyaUNQUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f4eefe-f1c0-4c0d-31a1-08de685bb1da
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 04:20:17.1816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OP+gj6HqlxVg8kFoTNVqRBi1ixJG7JeHh4bZdL/ilVJ+UJWS77GZEzmj9Sw7L8xUrSOUWqVAVfcL8ndya7qgpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8290
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riana.tauro@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,intel.com,ffwll.ch,gmail.com];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 21548116DDB
X-Rspamd-Action: no action



On 2/3/2026 11:28 PM, Raag Jadav wrote:
> On Mon, Feb 02, 2026 at 12:13:58PM +0530, Riana Tauro wrote:
>> Allocate correctable, uncorrectable nodes for every xe device
> 
> Punctuations.
> 
>> Each node contains error component, counters and respective
>> query counter functions.
> 
> Try to utilize the full 75 characters space where possible.
> 
>> Add basic functionality to create and register drm nodes.
>> Below operations can be performed using Generic netlink DRM RAS interface
> 
> Punctuations.

Will fix above

> 
> ...
> 
>> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
>> @@ -0,0 +1,184 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +#include <drm/drm_print.h>
>> +#include <drm/drm_ras.h>
>> +#include <linux/bitmap.h>
> 
> Linux includes usually go first.
> 
>> +#include "xe_device_types.h"
>> +#include "xe_drm_ras.h"
>> +
>> +static const char * const errors[] = DRM_XE_RAS_ERROR_COMPONENT_NAMES;
> 
> 'error_component'?

will rename.

> 
>> +static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
> 
> ...
> 
>> +static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe)
>> +{
>> +	struct xe_drm_ras_counter *counter;
>> +	int i;
>> +
>> +	counter = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERR_COMP_MAX,
>> +			       sizeof(*counter), GFP_KERNEL);
> 
> Can be one line.

yeah will make it a single line

> 
>> +	if (!counter)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	for (i = DRM_XE_RAS_ERR_COMP_CORE_COMPUTE; i < DRM_XE_RAS_ERR_COMP_MAX; i++) {
>> +		if (!errors[i])
>> +			continue;
>> +
>> +		counter[i].name = errors[i];
>> +		atomic_set(&counter[i].counter, 0);
> 
> Do you need this?

It's clear to anyone seeing the code that we need to
initialize to 0.

> 
>> +	}
>> +
>> +	return counter;
>> +}
> 
> ...
> 
>> +int xe_drm_ras_allocate_nodes(struct xe_device *xe)
>> +{
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct drm_ras_node *node;
>> +	int err;
>> +
>> +	node = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERR_SEV_MAX, sizeof(*node),
>> +			    GFP_KERNEL);
> 
> Can be one line.
> 
>> +	if (!node)
>> +		return -ENOMEM;
>> +
>> +	ras->node = node;
>> +
>> +	err = register_nodes(xe);
>> +	if (err) {
>> +		drm_err(&xe->drm, "Failed to register DRM RAS node\n");
>> +		return err;
>> +	}
>> +
>> +	err = devm_add_action_or_reset(xe->drm.dev, xe_drm_ras_unregister_nodes, xe);
>> +	if (err) {
>> +		drm_err(&xe->drm, "Failed to add action for Xe DRM RAS\n");
>> +		return err;
>> +	}
>> +
>> +	return 0;
>> +}
> 
> ...
> 
>> +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
>> @@ -0,0 +1,40 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_DRM_RAS_TYPES_H_
>> +#define _XE_DRM_RAS_TYPES_H_
>> +
>> +#include <drm/xe_drm.h>
>> +#include <linux/atomic.h>
> 
> Ditto for linux includes.

Had thought this needs to be alphabetical. Got a similar
comment in a different patch.
Will fix throughout the series


> 
>> +struct drm_ras_node;
> 

Thank you for the review

Thanks
Riana

> Reviewed-by: Raag Jadav <raag.jadav@intel.com>

