Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE9CAD44F5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 23:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB3310E5D2;
	Tue, 10 Jun 2025 21:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QsGQyFl8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7229F10E5D1;
 Tue, 10 Jun 2025 21:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749592051; x=1781128051;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n0NC6NDRpOO7XFC+PMwT5LNS3bkSrCNQ2kOd+f72qLM=;
 b=QsGQyFl8jgIHbEJ0vs/V1QW9lalWMGOsFtwBySGwKCBJ541v2jfh+nvK
 458OwnrMM5ath2qkBUbL42YqleB5B9Jv4GF06H5hrsdVoRuwWcppEFfo7
 uhMqUN9JQ8p+cxr5OuOmbRBHlEWQ4D8CAdlfm25gNjVhpz6WL7R4JBClL
 PRpzWgWvzBeHD9ioqE2ps5C+2XS05GMX7eR6mbZHpoU850XqTHCvLY58O
 QU5lYKyENEHByCkYkMqaER7JPG+T+zMcGu3Yb2oH9h/MgTNwCfUWkd6UQ
 fsE9zpYnjVojbgqN1OiY1Kh7bPehPxwA/q2lL5t7qXgmVkZJ5LaKprHW2 g==;
X-CSE-ConnectionGUID: AGc++79wR0WqGGatnVNv/A==
X-CSE-MsgGUID: Mq0rf0pBTVS6mK464r6fTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="62000086"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; d="scan'208";a="62000086"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 14:47:29 -0700
X-CSE-ConnectionGUID: 15Hhz4X/Qim+jaZUlBHz5g==
X-CSE-MsgGUID: UiPg0plAQFGrZjyawjGQpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; d="scan'208";a="147894608"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 14:47:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 14:47:28 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 14:47:28 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.55)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 14:47:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AS6326lqk2bG9IxQnC3/Oxl8Y85jqeBzvl4tiM0hPCu1O9eeWqXs+tnHi3f+gLvTik47UL57rmrHgpelvTdTCp85B9tFP+y73RYA6WFnmSdHw32tnq4Hi+/opId0FT34C4EHFhO3xDv5st5BMqAhdzLuIabTsCJZKrbJA5LgwV9j4Hv7UVyg4x12fqIp8us/7wS+aGf6mC86MHrBxoWAXkMRyNlXoRQNZIGoFdaYZXwbeBxQMx6IVnp/hOohgSqFGc/QJ+1hOWhYfAYYA6AopAvR9q79ltfSms194TGuuBfDxqxBuaIj+WC27klGSdQ3n4zChTLSkXiNIoVCoYYu8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9Z9ZktriheiUx7FPhLUBaGktXYOymQVW9J6eLiidYE=;
 b=u5sAUk8NhJ9YHItta7iSakTtkzocOE+qGLF3bNTvft3valJble7TLEDKweygtrVLd94Mt9PowbyqrqGyrnKllF2IP2KSEKE6q71tKcrj0jyMaG+CcCVADzgkd8vmLO7yygc6baJkrN7adlYTcCO6quhfrilw/v8Gcs7LVWKli54xoSv4eLon2KxGEXCg2XbO9AuJOTkecB9oGBKP93S9vro/GgzQ6qJENe1p2nMDSWgDtwkQ33BGL/3yL9WxegX9QcdHrzRtRYBKhrBce+YJKysCWVdm1aXOYvSOHD82GKdPdbpv5qnuAYUhT2fAmdIoQLVYtBlE0O3hjc9kO7uNWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by BL4PR11MB8870.namprd11.prod.outlook.com (2603:10b6:208:5a8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Tue, 10 Jun
 2025 21:47:23 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 21:47:20 +0000
Message-ID: <0414d141-f42a-4eb9-be0e-6fe1f09e42d0@intel.com>
Date: Tue, 10 Jun 2025 14:47:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] drm/xe/xe_late_bind_fw: Introducing
 xe_late_bind_fw
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250606175707.1403384-1-badal.nilawar@intel.com>
 <20250606175707.1403384-4-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250606175707.1403384-4-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:254::29) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|BL4PR11MB8870:EE_
X-MS-Office365-Filtering-Correlation-Id: 55163b80-068b-438b-2377-08dda8686087
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnlRTERjNU1NMWM4cmFESWs2QlFrNFlibE5oOFAxNU1mZG02Sjd0c25zL2Jy?=
 =?utf-8?B?Zy8wdDJlQkhZbHZaVnpVKzFYU0VEajZRYjArNktrL2NHODN5VWk1UWc0Vm5o?=
 =?utf-8?B?cWpSZkwxY0Z5TXM5OTVSTjc5MWtleTZvQjJyb0VTNEIyOXIwMlplTGxma1o3?=
 =?utf-8?B?bTIzKytEd2RndVVqdm5sVU5XUUovNHdNYUxQcS9mVWc4aWJYRTRZbWMyemhh?=
 =?utf-8?B?RnJxWWtKT0lkZ1FTNGJFQ09PZjJjMm1SSnVVMTV5QmpXTHNtdEtsQ3ZqR21h?=
 =?utf-8?B?QkpXbW5ZZ0VuSzlsd0ZMa2g5ME5raUdWK2htUldZQ0NHOVRYc250OGR5RTQx?=
 =?utf-8?B?ZzVUZG02UmtwRzExTE83MWlFRjBhZmRwOFp3cmdTNXF6N1NUUUtDUkhVMjl6?=
 =?utf-8?B?aE5KVVdmREtnSXhYaGFPREJFajJySm5Uc3dBdEtzQU9ZNXN2MVFvSWpaZjhn?=
 =?utf-8?B?ajZzVm15QldjYXBYTWZQSDlUTGVWV3I3NWEyWHJURmo0aGx3N3hEZGJ1V2hF?=
 =?utf-8?B?UUFhK2JFQ3RQT0VIdjd1bWwxZnY4b3FESUkxQ0FZTTgxV1dnWENOTkErdmFr?=
 =?utf-8?B?bVFtc1k1TXpnY05sTWIrbXVGajlWTXRWUXdQYzU1a09ZeFBhYXdPd09kaXhr?=
 =?utf-8?B?d3V6OVdnZFlRaWVRd0tuU3lFaU13a2dYVnVJbnJ4UFJ3TUVUZTBYKzMwV0lI?=
 =?utf-8?B?QVg3WTZBa2xKaHJEZlRJaERFYy9lU0tvL0ZlbHRtOFd2SUtUb202V3pGQndN?=
 =?utf-8?B?NDd0MjN4Z0lPelE4M0k4VnBCOFUvVzFKNE16ZGZneFRrMDYyVUJBSXZCS09P?=
 =?utf-8?B?RW1VOWRJeEJaekRRdkVFbmNFVGZWT0E3OUtSZGtRMzFtbERkMTkvbkcwSVRp?=
 =?utf-8?B?V25wdWllN08yQ0IreWlVc3V6T1dCUlg5NFRCNEdPSlQzSEdpbG5IOTA4R1Fm?=
 =?utf-8?B?UnhacHRMUUhKd3BFQzUvdDhDOFFJdVdjMjFtV3l6VU1FeVYvaEs5UGdjelBw?=
 =?utf-8?B?eFMwWU5RMVAvU2gwY0dIR2M4U3k3Yyt5dWdJVU1RRzB4NjZRMFJhZUNnQVJO?=
 =?utf-8?B?ZkxFYzVYV0xHY01sTmNUYlM3TGxET2FYL2lGUlFtV0FDYWsrditoWUROUnRw?=
 =?utf-8?B?OEZpTkt0clBTK2hwdXc0R2pGdVBGU0xhbzRKVHFsN3djRFVSQjN1M0xjcEJI?=
 =?utf-8?B?MzdCci9QVFgzOGpiNnRYdnRoRkNuZVJzcm4xNHlJRFZPOGR6MjAzdTl4OVEw?=
 =?utf-8?B?L0NtSnZoeVNjTFUwbGZ1QXh1ZlZoamFIQjI2Ukl3b0NhTERaSzhaYTcxa1lN?=
 =?utf-8?B?VmJWT3hscXltbGJ1VU10b3JMUmtFZVFMSVoySmVxd0Ivdlk4cnEyb2FYbHMv?=
 =?utf-8?B?OXlENHRnVGtJeTRMU2RQM0JYbExKZzBxUkt0bis1dGNjTW9hazl4L2g4SHBK?=
 =?utf-8?B?K2dGSlNqaTNkMHVyN3ZlYVlZMkZWeStkeWlnSmpBTGtOZ0lJZWZhSjVuY3li?=
 =?utf-8?B?bS9BNEMyMjM2bWE4YU5DbFJseFZlOTZZd2NVamdqRERXTUVaUkxUeUozK3Zh?=
 =?utf-8?B?a04xdEhMbVYzUEJMSVBrTmpXRFJxSi9rUldaNS9CK1NFTmxaZUVRTTIrQ2tH?=
 =?utf-8?B?dlpkY3NMN0xQZG1zU2t4L1l3UW0zTndaeFRIdUdmekg1RE10dXRDeTNkUzF3?=
 =?utf-8?B?OHZzYnZoRUswNDVLRXc4bTNmVzdrMlF3ZE50ZDN3ditONzh4WUhqR0JCZVBW?=
 =?utf-8?B?NStUL3JGd3pMOFZQdjNtMm9YZ2U4NG9VUzM5SkVtNkhMRUFTbzdmZWxqQ0ti?=
 =?utf-8?B?TjBvWVg5b3BaWndkSTNkWkpZcmJ2Qk96eG1sVTY1djJLYjVvVTZyeVFwamow?=
 =?utf-8?B?WVE1aXkwZGhmb0F0cUY1UXV0a0lkU3RlT1k5c0Q0eXRUYzMxQ2JhUVR0czI1?=
 =?utf-8?Q?MlInk0YTcPU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUJqaVQxa3BVZjJPUjcwUnViazBCUVFhNmZQcmxnTFdYWGFQNzQzTFRvRkM3?=
 =?utf-8?B?SVBLTkphTlBBbzlLalk2cFliS1JGcEZIbXM2ZnVSc3dKeWRtYWVuOFlZVHdY?=
 =?utf-8?B?UVJWK2JBYnVtZFJEL0JTdHo5ekx1cVcwLzJKWEJpWGtzVGlxM3FOZVYwYzhF?=
 =?utf-8?B?WmZpOGhpcGpGcHVTYmlYMXhHVWZrV2dST2NFTWdjdjRZSVB5a3E5bXgxWjJx?=
 =?utf-8?B?Szk2SjZ6bG1NNTdLb3lKMXVBQ0F0ckU3M2g3QWp2cUFoNSs2eU9MWURucGNz?=
 =?utf-8?B?MytyWWpoeUx1WW5ZNkxzeVQvM1FPT1VQdmlkaW1Ya3hFZlFmWW1uOW5vNERF?=
 =?utf-8?B?Y0FneFFtOGxNSWE0MWNBMzdJRWRXWmJqWk50RUVPaEtCS29rcXJGY05CMlRj?=
 =?utf-8?B?VkQwMWw4bmFWQThQQ1ZFUzl3NzNLWFIrbm80OXBDY2MveDJQamRYL0FERDdv?=
 =?utf-8?B?aWIvQVBQdnRrcUI3dVU5L0EwN2lrVHVncXUveWdnL2src3VleDFZVWV4NmV6?=
 =?utf-8?B?OUt6NHJRT3o2bDZadGFUakFXUlVROHVGemZpdnk1K1pHV2N5d29zQ29uOWdY?=
 =?utf-8?B?L3dYUittZUpTd0lPWVI5bkR0NFVwTlJkV2U5Q1Z0ZVk1STR0MFZTLzdhSkE4?=
 =?utf-8?B?bll1c0ViY3llb1dRRml6blAwcjU2V0JnY04xWHB6NVRzNC9Nbzd1aDBXdVha?=
 =?utf-8?B?bGFDR3hhUnFOMzN6R2cxYUJRK2NCUWl6WnNLTlJVNG1hTDBsbFI2NkduSTNq?=
 =?utf-8?B?c09jV2VQdXJWdUl4NE5LM2NxRFh2Sy9wMVE4dy94R3M5MVR6V0g3VnNWTWc2?=
 =?utf-8?B?cGF4YlllcTRPa1BGYXZnVStyWGp1MTQ4dzRLN2JMZ01WTExiWVlFTnlUTTBz?=
 =?utf-8?B?dllYOEEycnJwM1lrT3h1RDNiSHJUcnhobzlWOGVva3dLcnYwUFJaNWZydVE2?=
 =?utf-8?B?UWFaUno1RXY0QmhoQUlOQjkxVGtVY3dIaUVEb25oY0lERk1FQnN1RXZmZmNF?=
 =?utf-8?B?Und4OE9jREFpRmRoK1JraHJKUGxUMFp3M3JpL2VJbEhBUEp0NDVDWUhTbi9F?=
 =?utf-8?B?b0NUTmtuYjhDZWg4ZU9mRzlVeGFQc0dieVVPaFQ3YUJpK05pU3Q3Q1BrQzVo?=
 =?utf-8?B?SDgycHhmd25VK2hLUzVrS3d4emhtTUNqNWYrelh4MXFxUTVydEhud1JEdGNa?=
 =?utf-8?B?L0FGM3FGOHJhYWdhendpSmp1cCtROFlocG9EWkdYbko3ZUxyQU1wSTZVSkw4?=
 =?utf-8?B?bGdCWWVNMzA1eG10WDFHRmZ0Vm5ENlFFSTNpR2k2TzFWUzJISkFKbUlGWStB?=
 =?utf-8?B?ZmFRVWR0NTVweGVSZmJlUlhYYjhsNnVoamJRem84c1ZsTTJ3UWJmNVRRbjlo?=
 =?utf-8?B?ZjF4U0dBZ1ltTEswWmxDYU1wY1Rkd2gyT00rTUhTdmVXaHBXYTN0Y05rMjJp?=
 =?utf-8?B?dEw0bSt0YjBic1gzYlp3SlFYU3pmTFYrSUtBVmYvTlpuTWhudGF3SjdIOGda?=
 =?utf-8?B?SGNrVkc1VkIvRnI1eXZOakFlamwyMXZvdFlWenlzS09sYXN2b1hKVDFrN1Vv?=
 =?utf-8?B?UFVzUzR5OUZIb255VUlYSmxKaWNOMWJtVDJXcEV2a1lmNVkzT0RpQWxNZUtx?=
 =?utf-8?B?MGwwWnB2bzQ3Y0JrSTRZL211eWI4YVU4VnZmR3lZVERpeC9DRGxxWVdWYi8y?=
 =?utf-8?B?UU5ZKzNheldZenIyaWZ1clJzbTJWc3E5OGtEQ2hFbERyNnFoWGdBTzViYjhC?=
 =?utf-8?B?bkJoQVBHelgySmh6Zk9jNUVlYzU0UVI3Mk13WjRzc1VKU0V5QXRDb1djaDdB?=
 =?utf-8?B?aEhnNEh3bUczczl6ZDdxczJLdlZWdStOY0t3a2p4OVI2Y1NDS2cyeDRpWFVN?=
 =?utf-8?B?SktpekxNc0s0OHZma042Vk9UR3Vtb1lkTkpkeldDRi80Y2Zvc1JkeGFuR1Av?=
 =?utf-8?B?aXZ4am43R1F6Wm16UkR2T1VOcnNpKzNTMGl5WUp6VXBIMGhzdEh1R29XTUhZ?=
 =?utf-8?B?Szg2L1pTek5abHNUaGVBRmtnVnMrR2NJSmtXQXdjbEd1bTBBNEtuSDQvMFRi?=
 =?utf-8?B?OFY4Zk10ckhldTZMRlE1bXg3NlR2TG80bXVHNHlMQkhaVDBoSCt4UTR1ajFi?=
 =?utf-8?B?ZTRMUjVrU3VDVFFYeFlJM3RobkdLNXBHWW9jN3hkZzk4VmZKRTZqS3dnVjZv?=
 =?utf-8?Q?Z6k4KfBQdUT+nu/5Q4dRScQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55163b80-068b-438b-2377-08dda8686087
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 21:47:20.7072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oeRI5pUzr8sLIs9atdRu7YFaBT1vmjlYjOHInJ+qeDZwqazHNkkwbm5jykt9Z06knj6gZ2WLDfbnIJy6o2su7/1/J3wWB0deKgYll3Ea7ZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8870
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
> Introducing xe_late_bind_fw to enable firmware loading for the devices,
> such as the fan controller, during the driver probe. Typically,
> firmware for such devices are part of IFWI flash image but can be
> replaced at probe after OEM tuning.
> This patch binds late binding component to enable firmware loading
> through CSE.
>
> v2:
>   - Add devm_add_action_or_reset to remove the component (Daniele)
>   - Add INTEL_MEI_GSC check in xe_late_bind_init() (Daniele)
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile                |  1 +
>   drivers/gpu/drm/xe/xe_device.c             |  3 +
>   drivers/gpu/drm/xe/xe_device_types.h       |  4 +
>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 96 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_late_bind_fw.h       | 15 ++++
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h | 39 +++++++++
>   6 files changed, 158 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
>   create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
>   create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 01d231777901..134eee21c75e 100644
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
> index d4b6e623aa48..e062ddaa83bb 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -43,6 +43,7 @@
>   #include "xe_hw_engine_group.h"
>   #include "xe_hwmon.h"
>   #include "xe_irq.h"
> +#include "xe_late_bind_fw.h"
>   #include "xe_memirq.h"
>   #include "xe_mmio.h"
>   #include "xe_module.h"
> @@ -888,6 +889,8 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> +	xe_late_bind_init(&xe->late_bind);

I believe that the xe approach is to always fail the probe if something 
goes wrong, even if it is not fatal,s oyou should check the error here. 
However, make sure that the probe is not aborted in the missing mei 
component case (e.g., only fail if "err && err != -ENODEV")

> +
>   	err = xe_oa_init(xe);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 043515f8c068..3fda450a0774 100644
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
> @@ -549,6 +550,9 @@ struct xe_device {
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
> index 000000000000..22eb9b51b4ee
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/component.h>
> +#include <linux/delay.h>
> +
> +#include <drm/drm_managed.h>
> +#include <drm/intel/i915_component.h>
> +#include <drm/intel/late_bind_mei_interface.h>
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
> +
> +	mutex_lock(&late_bind->mutex);
> +	late_bind->component.ops = data;
> +	late_bind->component.mei_dev = mei_kdev;
> +	mutex_unlock(&late_bind->mutex);
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
> +	late_bind->component.ops = NULL;
> +	mutex_unlock(&late_bind->mutex);
> +}
> +
> +static const struct component_ops xe_late_bind_component_ops = {
> +	.bind   = xe_late_bind_component_bind,
> +	.unbind = xe_late_bind_component_unbind,
> +};
> +
> +static void xe_late_bind_remove(void *arg)

nit: no need for the xe_* prefix for static functions

> +{
> +	struct xe_late_bind *late_bind = arg;
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +
> +	if (!late_bind->component_added)
> +		return;

This check against late_bind->component_added doesn't seem necessary, 
because late_bind_remove() is only added via devm if the component was 
successfully added.
Other components might still have these checks leftover from when we 
didn't use devm for them.

> +
> +	component_del(xe->drm.dev, &xe_late_bind_component_ops);
> +	late_bind->component_added = false;
> +	mutex_destroy(&late_bind->mutex);
> +}
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

Would this be better as a "has_late_bind" flag in the info? that way we 
won't need to keep a list of platforms here if new ones are added in the 
future.

> +		return 0;
> +
> +	mutex_init(&late_bind->mutex);
> +
> +	if (!IS_ENABLED(CONFIG_INTEL_MEI_LATE_BIND) || !IS_ENABLED(CONFIG_INTEL_MEI_GSC)) {
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
> +	return devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> new file mode 100644
> index 000000000000..4c73571c3e62
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> @@ -0,0 +1,15 @@
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
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> new file mode 100644
> index 000000000000..afa1917b5f51
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_MEI_LATE_BIND_TYPES_H_
> +#define _XE_MEI_LATE_BIND_TYPES_H_

I think the "MEI" should be dropped from this define.

> +
> +#include <linux/iosys-map.h>
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +
> +/**
> + * struct xe_late_bind_component - Late Binding services component
> + * @mei_dev: device that provide Late Binding service.
> + * @ops: Ops implemented by Late Binding driver, used by Xe driver.
> + *
> + * Communication between Xe and MEI drivers for Late Binding services
> + */
> +struct xe_late_bind_component {
> +	/** @late_bind_component.mei_dev: mei device */
> +	struct device *mei_dev;
> +	/** @late_bind_component.ops: late binding ops */
> +	const struct late_bind_component_ops *ops;
> +};

It's a bit weird to have those 2 variables in their own struct, since 
the other 2 variables in struct xe_late_bind are also component-related. 
I understand we do have these separate for other components, but that's 
because the MEI driver requires it.
Not a blocker.

Daniele

> +
> +/**
> + * struct xe_late_bind
> + */
> +struct xe_late_bind {
> +	/** @late_bind.component: struct for communication with mei component */
> +	struct xe_late_bind_component component;
> +	/** @late_bind.component_added: whether the component has been added */
> +	bool component_added;
> +	/** @late_bind.mutex: protects the component binding and usage */
> +	struct mutex mutex;
> +};
> +
> +#endif

