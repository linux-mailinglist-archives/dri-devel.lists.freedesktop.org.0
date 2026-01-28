Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iA4CJhe8eWnoygEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 08:34:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E01E29DC92
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 08:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF0410E237;
	Wed, 28 Jan 2026 07:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hs5WZjgz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F8610E237;
 Wed, 28 Jan 2026 07:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769585682; x=1801121682;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zkw/CLD0VFVahHx90z/bIur7LwbG5AsWRE+siQ+tFYg=;
 b=Hs5WZjgzYxBLhwUbmdiIHokQxz+hGa3ZeeKNXZpKlE1wXeoq3jQblbWh
 Ks4iiAU84J2iCmrdKW9wxckrhszQENSxyZGKjqgSHRkfOUZ/H+9LE1HPJ
 8nGpcXHQt5yS/TpwulNNlxkIny3JOtdwtRTqZW8n/S6CwKF1nwgC+x+96
 ln+g34Thb6EguUXxFsdOWUrJmHbLUHEUCnD+31MCPmPx++WUlUL3f6ZyU
 wJF+XtSmY9W992BjPXye1h+PU5VbsT6eG3U4nkGF/hPjjVcP2nKtKAHjc
 hga6QP4ZhrqKSMoYIWx1LJoUBLMXrP/gtEjLjoRvQU6A0j4gX0v89QsUr w==;
X-CSE-ConnectionGUID: t0y5mwZuQ4O4A50OF0vxcQ==
X-CSE-MsgGUID: 0qn6/Wl2SUiwTtXG2EBCeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="88211952"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="88211952"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 23:34:31 -0800
X-CSE-ConnectionGUID: KTmGQ3w+Q1KsPvkWK986FA==
X-CSE-MsgGUID: 4OVfALfnS6eX3exSwTtWTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="207439095"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 23:34:31 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 23:34:29 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 23:34:29 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.43)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 23:34:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNbF4dSoIl6bB+84nARSrtEFnA97XspVd5WtpYIM84dvPXiRxp0qMtGiNU4BIeKhDm4deS6FZjk7aXYzMOwzlhiyIzCHL6W2Tqj7da4DgPqeFhRq++V4Kgb9RHfGlFefdfCbDGQiTbDC4G7YMnw5JcQVhlqvstEB4WmYU6HEIYgcr8QSTDWyc3bs3jg2XZFjDL39N2wjnoM41MS72+ucyziTo1q1vl04Lll3TvEBR4b0ZHXxbbCJtF3k1udGR8e4ecrV8D89GgeQChULt10kvmZxLe0MrTrpLCeINgklb9Lxd7YCJsCE/12ZKBd1vfXZ3x1u4CDyVGnep+I6uyTL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btz8SbjVKnKGGF1Gl7iTlbLu2uPY45Dy8SHoiKsTr3g=;
 b=cMwBctxMnjnmCBRjpGitOu0FEXOMVmGBZ2cEYNBYpbusWqu3yGCEqdvi/pcEkii2bTIxR3fi4X6REGvbT1iLjJ8JxHXL82aVfhTnjBek+re/zfnRUprK3VNfGU5I6/PMrWZ65AaHVZ+YZN5QpNOai4JMb9mCEIGXIGOSpFFia0XldsQDC50GvekuPwRWjbDNjHNmhY4B9vNPlHVgRYv4UlL8sJNQp3pkbHQZP8ZfN9oTN/kjEzmI2gsQbTBrneh183uYzDAgc44rG5XrHiem+G7uftUZjyx8h3ooei4uZ7oyExXyj+ePBl7jv4Q4s6q4Xw7JChcjnZPgyshN5d1cwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB6925.namprd11.prod.outlook.com (2603:10b6:510:227::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.15; Wed, 28 Jan 2026 07:34:24 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 07:34:24 +0000
Message-ID: <2a41c135-5e30-496f-918d-7233051d7a4f@intel.com>
Date: Wed, 28 Jan 2026 13:04:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/xe/xe_drm_ras: Add support for drm ras
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20260119040023.2821518-6-riana.tauro@intel.com>
 <20260119040023.2821518-8-riana.tauro@intel.com>
 <aW-039yu1OXXSrdz@black.igk.intel.com>
 <cddd882c-348c-416b-aeb2-f92d3b7f41c8@intel.com>
 <aXm3kI6tAJkrO30F@black.igk.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aXm3kI6tAJkrO30F@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: 20480607-3865-4287-f28c-08de5e3fa8f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXpxMjJVWlhEeUhSa3VOejZ1UGhzWEU3K1o2QnBZV3F6dHYzL0kvQ0ZvYVcr?=
 =?utf-8?B?TlozT04xS3NKRVRTL1hDS0VwQkpGRmtLVDF4dXd6VnVqVDRjMGFyOVVQYjdh?=
 =?utf-8?B?SXc2WWdXRjNadSswM1ErQTZ4dlVncktFd3FkZitramxGbkdKd0xLTlBsNUZS?=
 =?utf-8?B?N2R3Qkt5Y042ZnZXT3UxUFdVRDBjMWUra2Q0NncvTmhJS004NE1ndms5SVFB?=
 =?utf-8?B?MjdQQm96N2JzdERxZ2tUU1hIUnpaQlpySjRLcC93WW9NS2RSS1BBajBUZXZT?=
 =?utf-8?B?VW90VFZpYUVPL2xpRC8rVXFIWUY0S3JnNWlIRENJTXZLY1hyVkN5bkNwTzNW?=
 =?utf-8?B?RWJqRU0xQnk3clRYWm5IUjkwVzdockxib1Z6WVdkWGM5SWlvTjlaOXUrTWJZ?=
 =?utf-8?B?a2pWejJhN2RWWDAveWxWTWlqbm1XMGsrTGRXdkhWNHozeFN2N1RMMExMY2pI?=
 =?utf-8?B?Z3YxN05WUmdvc09va3JpUytIQ1lWY0NVVGhXTFRzdXRRM21lSkdoVjNYVk10?=
 =?utf-8?B?UklwSEJKK0hrSThRUHVIWmkzVkQ3dGFYZXFJTnErMm9YME44bGtCdVp5VW5J?=
 =?utf-8?B?VWhrVmRMRFhRWDZadU12azdqWUhMRmVGZVNNWHd0YTdEaUp2alNFUkIrajlo?=
 =?utf-8?B?Z0VmbXVCRi9pT1pWdDFINnRDWUM4NjZrbW9iQ1ZqdDZwNVFxSnJnblYwK084?=
 =?utf-8?B?eGdQQTBNVXNWL2owdWhJSGdrZG9jMW44TG5mUWpYSjZFWVkvU0hvaTBIRnNC?=
 =?utf-8?B?cXg5QW45U1d5OThta0RIeFFwdzl1KzBaRUp3ajhTd1kvTjdrWnpKanpHdUpN?=
 =?utf-8?B?MFZBVzlmeWw0MG1YcUtxYkNGYUlKYlNuZUJKVGNFNWRIWDFuOVpXWmNkamZY?=
 =?utf-8?B?REsvektnUk9TWFQ3aU5YclB1TUg4OXlVMXlmQllkUHlvY3lOZTNQazFEcHBJ?=
 =?utf-8?B?Ukg2L2FNU1ZIN25KM1dzMWZCTW9hVVlkU0FWaU41cWpHT0VWUWFSZDc0Y1NM?=
 =?utf-8?B?RWlLbXVpK3BEMFhvVUdPZFRKVVg2Mzh2V05BZG1nTzFSWmlaUkhCbDJzZ0FZ?=
 =?utf-8?B?UFBJZ2tOMGdQUk82RW8xZTk1TnI0Qjc1akpFQS94TzJTMEpLWStOdGgzVExl?=
 =?utf-8?B?SW1tSnBZLy84dWk5Q25takg3eU1sSnVLdVJKbW5HeTV0U3dJVU45VmZrZ3R4?=
 =?utf-8?B?eE1tNWNmeXZvRlVjWXpTZTNZRXlUMktJNDVTRTQ0eFhXN0ZYNWJlc1ExcEY4?=
 =?utf-8?B?RHJ0eG4vZzl2Q3Z6TFlWUlZ5VjBrZWloMVlCbVZ4bUo3RzZHdms5c3FpL0Ri?=
 =?utf-8?B?TmNPMjdRaFNNTUJmcXE0V1N6NHFLZERZTFVVcklTOGlsTU9SWC9sb0xXNXY0?=
 =?utf-8?B?ZitCWGROMUQ3Wi9lNEliRDYyR0dDa1JSbGpVZjZjVXN3a0taYWxLcmFiaTJ1?=
 =?utf-8?B?ZkYrUm5WN0VNNUpBNTRRZFdnR1pmdTlsRnpQYzZ3c3BjRTNmZlNUREgwY1BF?=
 =?utf-8?B?QTJqMmpBd1MxWVhqNk9tYkVyNmJNTDlNV1M2dWtrZzJ4NXpCODdlUWFwWDIz?=
 =?utf-8?B?OGxROHVUanlSdnkwc0lkNVJNdlhsT2p2MWNPa3M3bVB5QUhIMkoyK1NvTGVT?=
 =?utf-8?B?cHZXK1VxdXF3MldTWXFJNGRQTzdPeDQ1dmVvNjBEVEpOSHhFdzNNY1lmRjgv?=
 =?utf-8?B?eDRDcDZ3SGo1eGo2ZUJHQmkxSDVDOVNmYUZaNkkxQzV4VnBQTjhhaWVxZGJM?=
 =?utf-8?B?bzZJeU41aUN0VElkdGQ4UzVzWXZMWkhhUlBEYjNwTDFTT0lkUlRNS3AxY0lz?=
 =?utf-8?B?dHZUTU96TCtwTm9DQkVzc2EzZEpnNFlXdUJwSU1qSU4xNFhOVC8vQm1mbkw2?=
 =?utf-8?B?VzUzUnNxRzl4VnNvR2tjcDVneW5ldFB2K1dQQk5Va0QrcHVlSXJFMjREQVdR?=
 =?utf-8?B?TWpodmhGOWJCRk00RVAwZUdWcUZqSlBuQVZjRkxHVUdJZHJValE4RHUremxa?=
 =?utf-8?B?bTZ2SHBuY3E5aGIyQU9KVzhhd1Q1em1lZUNlNzdDU2F6VTZaNTFmWWFla3Bp?=
 =?utf-8?B?cENIblQ5RjVtVGJmWGlxTUdiQ0lYWmhLeTcyZHhwVUJaWStyckRGb0NQeStV?=
 =?utf-8?Q?r5k8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGtJbkpmaGEvbU04ZzJWajZkWjByRlNxS1RDcDRqZEtWakVncDBoTHlPYUp0?=
 =?utf-8?B?NUF2ZE5mZmp0SVoxTVlSSDlJZmhBR2pMdGRqWXNGckt1OUFnOWFySFZGMHAz?=
 =?utf-8?B?dEs0Z0Z0Ujg0VlRUL2tnNEoyRU41bEljL3hNVXp4aXRycFRhMCtkRkN5T1FY?=
 =?utf-8?B?eFhxZW55VHlLMDFHRm5mU2Z0VGQxM2hicU9JYWE2YnV5UFE4Y0RaQzZZbHo5?=
 =?utf-8?B?bkZGWURMa3RWUlJUbUV5RGpUZGx2TC9aZzloeHdMaXk3bUUwRjVXUUJYY1hh?=
 =?utf-8?B?Vzg5UlZGOTQ0dmprRGgvYzRXaFpZc1Z2U05aeEJuQTN4MkViRTloN2JKcWZa?=
 =?utf-8?B?Q0psOVRpV1BVQks3MGFidlZTTzFrVEt4RXFMSVBBamJvc3NGWk1BcTRkcUhw?=
 =?utf-8?B?Rk1PVHNlbVhHOWpxakpLVmdEY0RQc3lUMU81bjZWTU5ydVYvMnlJV3daTlJu?=
 =?utf-8?B?dll2citEd2lmTkJZL0EzZ1JQbjFwRjhSQlJYQXZUL1lvVXdub1lFTWMrQWZi?=
 =?utf-8?B?eVpjMlBJd0R0T2VIcHdBOWJUV0xnK2FjL2tGMmpIV1JneCtkM2RoQ3dpakJ6?=
 =?utf-8?B?bG8xandlRjFKaFo4cytFNmhaVDVMTU1URHdvek8rU1RVZW1MYUFtVGZ4UmE3?=
 =?utf-8?B?aG9xU0wzU0NsMlU2ZnluOTFZcGQzTVZ5MElDTXFxQTROUnJlTHVTTkc1SElM?=
 =?utf-8?B?K3ZUV081SjFiRGZyMnZmTllGT21pc1NVdXM2ZlRIYXJSL1hYN2xjSGUzcGR6?=
 =?utf-8?B?cVhQMDNBSUtBTmVuZXNCQjYvZGg1NWRwZnFabUVOVEVQTGNTNUd0cmNhd01Z?=
 =?utf-8?B?NG5MY1VtWUREUTZHZTJtTkRGcWdHNm5YdFlQTldVN3dPc25GTDFPMXpzRFRE?=
 =?utf-8?B?dU82VFpxVStob2hRNFl6TndwK0NpWC81RTJzVndLaWNManFlR01mWnFzM1FW?=
 =?utf-8?B?TWNIMkpUZnBVZktiamwyQitwN2c2WmNKUzh3SFFITFFLR1gxcUdrbVhoV0ht?=
 =?utf-8?B?eGI0QVVQaUtUdEU2Y0xQRVpEcVNIRHRtMnhjSkJYMUJNVWRRV3RCZEp2ZkVv?=
 =?utf-8?B?dEF6L2tjOFZYWFR0OWwrNzRJQ0RMWGdtZE9MY2RqSDViWVlrZmpTRDE3Z0dL?=
 =?utf-8?B?eTdzYzAxaVY0OFB4cUNVS0lMamhadkl6ajNodURsOHVNcHhhR0hrRnJKaGhv?=
 =?utf-8?B?RzBqV2t4aUZwWGVlOGQ4WU1aYmE3UVNhbjZBWENHcmV6ZXZYUWFZOGdIYnFQ?=
 =?utf-8?B?ZzhacFRuZGhIeXNiZm16NCtKQlF1VUwzYVdyL3lzZmQ5ZWRuYXIrenJtaHpa?=
 =?utf-8?B?Y0ZWdWVGcFFLdE1GUlFSSldqQWlFcGlZWVFRYlQ5bnphczAxT2s3WGxlK0Ux?=
 =?utf-8?B?cG5JQmM2b3Znejh6WVVmOHQrR1l1a25SWGhCMXk1ZzhrU0FyeUVHYXRUWHIz?=
 =?utf-8?B?ZHIzUGZraTNyMnJOSnBvREVpZ2kwcUtUZ3ZxamZxSmxCQXZjVWNqRWRGUXFH?=
 =?utf-8?B?NzFyS1hPdHNScmNDVWd3NlBMenpKZnk4b2prdEpFckFrWk12Lzh3Ti9JUFls?=
 =?utf-8?B?d04yRjN2ditWNzBPdG00RkVKVzhHREVEaGZMS1BOQ1c4dEF3YVdaSHlaZHZp?=
 =?utf-8?B?Mmh5UytnWDdYMnI3UTBPWmZoOHdnanpjbmZYVW91YkRRNWpsQ1dPVmpIV0k5?=
 =?utf-8?B?S05oOSsyZVhLRjd6T2M0U3RmSGp6bDh3aVFvNnRjb0Y0eEZ3dm1kK05OWURD?=
 =?utf-8?B?enVCTHg0RmVoN1grUldtRW5ZWTdWd0pyeTRic3hZNXNkWUwrVy8xL2doTFQw?=
 =?utf-8?B?MlhzVVFGd2p4SjZKampiU044M05wc2lCdk5VbWNhRGNFUjVQVU5XU3J0cU1y?=
 =?utf-8?B?OFczNUZuMStyb0JDL2VHTHRWUVZweElrQ3FiUFRLTEw4cGlYRkxsK2taREY0?=
 =?utf-8?B?dTFWbHlveVpPU044MkpQNDVFRWVkampPQ0R5YVA5eW9GNVJlVnBwS2M0QlFZ?=
 =?utf-8?B?TFIveTdiZVFSK2VLZVhEYWc4RE9YNmk4ckF5UUYyTTRmUXZuNCtZU25ub0Uw?=
 =?utf-8?B?Q0pueUVLSUFmVUFDVmJkTmQyeFlOeno1bXkyQXpQcHdSTmFERTBhbHA3d3Rv?=
 =?utf-8?B?WHVxcC9aVXlvUWQrWkNsMWVURDhCTnNkQnB6TndzVWdFYmxoTFBPaTkxaVI0?=
 =?utf-8?B?MTFBUTNGeHl2Nm9UNmJmU2lLNk9FdTRQMkNnVnpkZi8rc3pLMWFLNlVFajhI?=
 =?utf-8?B?R0thQkpvRDdRbHpxVXFaY2tKejQ5SDMxYXp0V1BVTnFFSldEa3AzY2pRcGxh?=
 =?utf-8?B?akplcnBtQ2NYK3RIWm5lSnorQkdHT2oxVVdESXVCWnc1SWF3ZVIwZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20480607-3865-4287-f28c-08de5e3fa8f8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 07:34:24.7944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFlInlKnx/6pBHtS3fKfH3WIErmmWu/C0WmRGwZjrLzR0GJDlbE5Ofb7nuWnsIhieCSJ0AOH95Dr0muej89jYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6925
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riana.tauro@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,intel.com,ffwll.ch,gmail.com];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E01E29DC92
X-Rspamd-Action: no action



On 1/28/2026 12:45 PM, Raag Jadav wrote:
> On Wed, Jan 28, 2026 at 12:21:18PM +0530, Riana Tauro wrote:
>> On 1/20/2026 10:31 PM, Raag Jadav wrote:
>>> On Mon, Jan 19, 2026 at 09:30:24AM +0530, Riana Tauro wrote:
>>>> Allocate correctable, uncorrectable nodes for every xe device
>>>> Each node contains error classes, counters and respective
>>>> query counter functions.
>>>
>>> ...
>>>
>>>> +static int hw_query_error_counter(struct xe_drm_ras_counter *info,
>>>> +				  u32 error_id, const char **name, u32 *val)
>>>> +{
>>>> +	if (error_id < DRM_XE_RAS_ERROR_CLASS_GT || error_id >= DRM_XE_RAS_ERROR_CLASS_MAX)
>>>
>>> This looks like it can be in_range().
>>
>> in_range has start+len. Should again use count here.
>> This seems simpler
> 
> I just had another look at this and wondering if we really need lower
> bound check? error_id is already unsigned right?


added this because error_id starts from 1 and not 0.

the entire condition can be removed. This is already being checked in 
the first patch

+	if (error_id < node->error_counter_range.first ||
+	    error_id > node->error_counter_range.last)
+		return -EINVAL;

Will remove this in next rev

Thanks
Riana

> 
> Raag
> 
>>>> +		return -EINVAL;
>>>> +
>>>> +	if (!info[error_id].name)
>>>> +		return -ENOENT;
>>>> +
>>>> +	*name = info[error_id].name;
>>>> +	*val = atomic64_read(&info[error_id].counter);
>>>> +
>>>> +	return 0;
>>>> +}

