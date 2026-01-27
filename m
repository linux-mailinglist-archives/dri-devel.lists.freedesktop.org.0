Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QE5+AnF3eGljqAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:29:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E26ED91111
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B8810E040;
	Tue, 27 Jan 2026 08:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdYTBGNZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21C710E040;
 Tue, 27 Jan 2026 08:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769502571; x=1801038571;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/PMfoDx7SLhruFoWrAH7qTY1fizLTodl6OBwKQfZijY=;
 b=bdYTBGNZiRZDASidlSYy5/D2e+ZqZIzd7/0BL3oNm+izzCbuYnwWNubn
 YH9hgP8D4BBMj7YvoN1qlI5QMK01T3fuxMBP4y1GRWZUhl9HOYNrPbFRl
 9RNi3muwUDWsJ8SBsRUJrP1yql1GWQW0Dd3fbAhBsMpINxi7MUy6GQd0a
 UQyAE0EXcbuILmrAVrNLnK2AaUAs4/BFmTFvL2a1CHGLC1Ev29cJlvXTw
 q39WJZ/jFTiElxEeGz/sgMZrPMlNst6eSwbfvU0StygsfS1EKzNWawOCi
 veDWjCITFQB4H4BGzXKW8zLwNIQ1t++YfTFEJEWdvkf7vdggi3aBY62LI Q==;
X-CSE-ConnectionGUID: E6928v5YSG64vry4B7cmLw==
X-CSE-MsgGUID: KF3HVHV7TOCamoZlcg223w==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70593238"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="70593238"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 00:29:31 -0800
X-CSE-ConnectionGUID: bxiKCPi7RdCPY8+2lEmUZQ==
X-CSE-MsgGUID: UoUEngopR4uL+Cgjzk6u7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="245521627"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 00:29:31 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 00:29:30 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 00:29:30 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 00:29:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSYl/y4V7dMfmTywyDN7zbtQTrM8nSSEyDLYLQPyZpxVuW6Pplbs42DyziS0w3iSDuE3jH5z8ZW5KHrbPXqA+bgwDR9R6Ku9O+C3h4zaapnrT4cGLq9sfgWBLX3KRYT4tcYYZnJOpb2BZil7xZ+BezaGLTzE+V2ZK3uLO06CkYVwretP/WkqduJQeAAdvc1kn7o9CwoXNWql+zy4z99HlAPGlSVHR1oNQfkfL+uE2XKvwu4bTbjX6tKoNLD0PJ+rRVD5EvfA5N8IgOexwPVNpg6yqcMKugQB1A4m8S1v8oqI95KpkuWHcQE0XgQmN5GSLMcPqhZVWO4nxfu/B+gNnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BxZJXHKsMaC1HtVxYGB/0cSJyPiNgoXwnXPQ9bkSmw=;
 b=leDsjBqU3i+UBA6bbmIS2O78EudBjYJ+DbhQJZJbgoTdlYNqA2vP+ZXkkjxVf8ZG+R6CIfo4v4miYD7lPa0LVT+yryMCmiuxR7baeNvCkzxyBuisQLFCD4ClLKzcnk8jM1oul1+n3n32swuRPa88hpn/4vf8dguQLD4HUAg5J83su5K6uVP+zEMYsmxd5F/lwR6vEh6q7k9qMe+Wuft8AU0fpmmVWCzN8jjmZDHnYM9NsGOBDqfY/clBKJXtt63UMHZUXtq9CdtrQNNGODRpoc1Q2UW20QNT6xgMl8l/qZon8Qy3oSXFBYZp/1CYLImF9a4p/KF0tcfVvHiee5lsYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV3PR11MB8507.namprd11.prod.outlook.com (2603:10b6:408:1b0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 08:29:23 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 08:29:23 +0000
Message-ID: <cc9d924c-4da9-4651-b9fe-01e06bce5c2f@intel.com>
Date: Tue, 27 Jan 2026 13:59:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] drm/xe/xe_hw_error: Add support for GT hardware
 errors
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>, <ravi.kishore.koppuravuri@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
References: <20260119040023.2821518-6-riana.tauro@intel.com>
 <20260119040023.2821518-9-riana.tauro@intel.com>
 <aXB7rXem6U5Fzw7D@black.igk.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aXB7rXem6U5Fzw7D@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0175.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV3PR11MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: e38d50b2-85e9-4a83-f757-08de5d7e2c64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjhDbWluelNEYm5jVldod2k5ayt0cHNCUWJpdXNSQ1h1aWJGa3F2MFhvODNS?=
 =?utf-8?B?S054aVFrWHFXN2huaUhHOW5HUjFHRVVwYmxhblY1dThDY0pYTVE0ci9vOEVy?=
 =?utf-8?B?eTAreDA4cE9rM0RHY3dEamVVcjd1VkU3cVlXbXBKTTJwbGgyUWRCZVpSWmZr?=
 =?utf-8?B?b1pmYmVEQVQ1VkxJcUY1L3pjQm81WmlUMm1NQWFTVCt2WmlUL1l2V1JPQzQw?=
 =?utf-8?B?WGt1MmROakNtV1ljc28wdy82SThEK2ZmNG9ZMWR2NC9KWmFTRWxGUWdvQ3oy?=
 =?utf-8?B?STVod28zWjNiRnpqNnEvZ2JoWVZPSGoydHdRbGNidlptN0dSb0hVVzc5NWVn?=
 =?utf-8?B?eDJ6dmJHV3l2djBKZjhxOGxBQmNhMERVOGNTdkdCcDQyT0M0VWZpYzRzTHhh?=
 =?utf-8?B?TU9lZ25nUDB5SndRamlaQUlDNkJSSXZtL3E4TG5uMDJTN0RmcXI0bHlPdWdp?=
 =?utf-8?B?ekdQV1lHNkJITElsejYxOHRsUktFSCt0QUxMSmJHT2xNN3VuNktMeHYydzE0?=
 =?utf-8?B?bnNQSnVORlJ6L01TTVFVdmVUeWZkT1h5VlFlOUlVOEJpOW9aVDhqQWI3SkQx?=
 =?utf-8?B?SXY1cTlIOWJmOFNGdzIyM0FYZEtnTHY1LzhOQWxTWGJ4VDVVLzUxalNYVDEv?=
 =?utf-8?B?WGxWWmdOSEwxUzU3S2h4SDNrOW1SSkJHVEcrWWNONDlpTlBia1FkRFcydGhh?=
 =?utf-8?B?MG1qb3I4MzJXVFFFbE1XMHJwMkF4L1J5VnlDY3dvQzhGRFRqcW9PbHRhUXdL?=
 =?utf-8?B?cEVuaFEwbjdLN2h1TFZCTGpEVnZFNzJ6Qkc0aDlCMHVFRnFDcnkzZDJJQ2Ir?=
 =?utf-8?B?Q0VVOVM0bkpsbm8zTVVFS2hUdU9iYytJTWVrb0c4UDY3UEZtQ3RiejRHa0Nk?=
 =?utf-8?B?VGZja1YyR01HUE5JNUFrSjBBdE92T1YybVRaME1EdDJ4UWI1dnFaYXFWYUJ3?=
 =?utf-8?B?ZU1lSVJmN3UwZFhDUDdlUExvdCt6TzdwN24vUjhpN2ZPMHdaRnlqNEk4c0U5?=
 =?utf-8?B?STlSVm1xS2pJSG5waDZOQ1NPY1R4SzdRdTgwRzF4bUlkOWpXUGNHTjFKY0VD?=
 =?utf-8?B?K1pjdFN5Rm12SjRKUmN4NUVCU2RmYmxKVVh3R0pXVWJPSjJlQWl0TzNwYVM3?=
 =?utf-8?B?b05CbTZTWXFsYTVnVHUxYWxyRUNhcVpCQ1pLWVAzSUpWOGdBbnJub3VoNzNM?=
 =?utf-8?B?ZXJjb1NsVmNxd01WYnRZNnZ5b1NSM00zbVZyVHlRY0JpSm5hZXN5OHhBN3VM?=
 =?utf-8?B?WG1DYm1ieW5HRjhzdVdtOElJcWpUb2JydUpVckRTTDB5NVh2WVBIdUtCbGhX?=
 =?utf-8?B?eFlCZnNheTNYL2lCOXl4dFFXSUZ3c24yUjFvTFpsUVplR0xSRS9nZkljY0o0?=
 =?utf-8?B?UExlcC9iSkZXQmpvM2xlUWpFV2tUK05Xd0NidzhNVnBoZy9aNXlnamhzcU5S?=
 =?utf-8?B?dDZQUmlWa2s5a21KNzJuL2Nua3lLR1dkN3BGMUtBV2RrRkMrYVI0b2ZIK2ZF?=
 =?utf-8?B?Y25Zd1BmOTRMUVNZREdqTE1iSU4xZDc0SGZzUzVtQVJDMFVIZGJjNTFZV2I0?=
 =?utf-8?B?UDJHRE10ZWxYOENQQlUreEVLdnJ3NVNCVy9yak5PTFg1U2g5bitXYmR6cERr?=
 =?utf-8?B?ZjNFa0p5ZjhCdmpCUjZaRzk0QWlIOXVjZ3hKWkhxR3lQbmFyLzNiSlM4UGVa?=
 =?utf-8?B?aGN3UUgxVmtlQkJTSEdKRS9adENJNVkyb0phb1ZuOVQ3ZE1VTDdEc2dxbENE?=
 =?utf-8?B?Y1JJTmdlRHFHQUphZ3VJV090OXZGWTh6OFJaWXM2VnBrZFlPN1R0U3lBSHE0?=
 =?utf-8?B?dEFabklCSCtyTjdYK3dVaEtUVXV4SnJ3V25acGlYUTk4UDBmZ0pxLzkremNt?=
 =?utf-8?B?ejBhQm5CMGRiNk9odVJlNnE0MkJZaTFWZGlIS1FhNG5xdDNMdUI3RGZpcnRB?=
 =?utf-8?B?RXZaRGxzclhVOUg0eG0vYlM3RkpxZHRVUjZoRFpRRUlrSkF6QWRHYzIrd0d5?=
 =?utf-8?B?TW4yOHMyRGd3T0FkWW11OGloUkZmendUZjBEWkk0dS83VUswMmhXQzVLQkwr?=
 =?utf-8?B?ZTRhb2hwbkhvVXcyV1dGSTh6MTBkblRWYk9hZ25yU0FkZjQwQ2xKc1NwM3dO?=
 =?utf-8?Q?u1vw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWlac2pxaWtJS0ZSSVRGdkJSWGQ0S2YxMDBPYjYzSUlTcnNNZ3NpcC9mNU9C?=
 =?utf-8?B?eEtpUi8yMWUxUDFCOTJXMEM2cWRhVTl6M0ViSkt2VWw2eEcyc1VCZTBHT3ds?=
 =?utf-8?B?cWZxZWpMdTYydk0zU2pZV2s3ei95Nm1lcEZ2YXBjNTlRVTNhZDZlSjlFOUcz?=
 =?utf-8?B?MW1kUUpGY0RDaWw2QndYRGRoNWQrSTNROTRWTWpENHBUb1RUZGlEWjdMSjMx?=
 =?utf-8?B?RGxDQU9ieFRGZFA1SUV0a3hxN1lEZGtyTk5UNmZDTyt2OTFYYWhsMlhzOEht?=
 =?utf-8?B?ZUVyaFVlcXJBZ050SWhyMWRuZVJIZ3VPSVBxMUJBc1c5SEZtbDRPMnNFdkVJ?=
 =?utf-8?B?U3hobjB4N2RBOURtL01SRm9XeURyY204S1RtNW9LamhEaHcxZ3V4Mit1N0Vv?=
 =?utf-8?B?VHc1YzVZNjh3c0tlSy8wUGNjL0lDaGJReHVSdExmNENrbmM5TGpHNTdENGxG?=
 =?utf-8?B?K3V2QVRPWHVaM3dDdXZGR0xFb0libWkxTkhibnRWa1hkZkNTb0t6amorN1FW?=
 =?utf-8?B?a1Fpbkh3WEV5dUJsMU9OSEdkU1ZGbGJ6dTlPTjlxQjNGVHFjakdEMlFrdVJT?=
 =?utf-8?B?MXcwMEFndWNuTDRhbXBmcFB6VnBRUm43V2VHYWFrdk56Vk9kMUtJVVBGNG9m?=
 =?utf-8?B?TGVFM3F4TlRQcGpCVEZMcnJUWUFNMDVaRHVDVm5PRGlIUVpDZjhRV1pEYmY1?=
 =?utf-8?B?S2cwSTNGdGYrY0t6N2tPOGJ3akdSRVdVQk1sa2dIYXVDL1VBc2R6allJTTVL?=
 =?utf-8?B?d25nVXZvNHYwdFNMN202K3RaRTBzUUFmSGVMSnY3VHF3RnhxeVh6aTVEQWZy?=
 =?utf-8?B?YWpGdHdybnpEZU5UdGJOc2VScXFDNzRGWDFYejlYbFBrK2kydGwzQ1NQc2FP?=
 =?utf-8?B?WVBjRnlSVkU0NktuVG1WVW5DV0RoVFoyRTIvWXZCQk5PWGZkNEVhK1N5R3px?=
 =?utf-8?B?cDVyUEd5US9MMk9MYzVDeFQrTk45blNhVk9PbXNGcjBteEoydjArMzd1ak42?=
 =?utf-8?B?dXVIUlpMQlhvNkMzUWlVQ0dRQ0w3Q0FsTndXU05UeEtzaG1BRVZBbC9RcVFj?=
 =?utf-8?B?UG83WHdSNXRJeXZjTkZLZ0tnWjVzUVd0MUc4ajBYbDMya2VYbHhOd3BJK1RO?=
 =?utf-8?B?SmorbnZ4OCt4QjRZNmZEUFBUelRzUFBmTE9IMXFhd1dwNHo3dHBTcVdrTTUv?=
 =?utf-8?B?dTdLWHRLRkZvaGZJdGhsRUdIcUg2R3lpN0hpbVNYSzl3eW1NR2ZVbkNxZkZ3?=
 =?utf-8?B?N0dWaXJEYW9Ga2djaW5TOWxERThQZ3NZdHYyNlBFWHREeXg3QWRCMGYza0dD?=
 =?utf-8?B?U0JnUjIrQVlNOFhPMHBaaTZVOGR1OUVuRWpPaUpRby80YXJyN3RvaHRuNmMy?=
 =?utf-8?B?bzV4QWF2SFZlRTNHcnZXc05IUk1VY2FWV2hZemFxQW56eTIxZXQ0WW1jN1Jk?=
 =?utf-8?B?LzBxd0lGUUVnNTR6MjdLVUxYQWlPU1hMMmJ4c2dYZU01djBMam9ab29YWG1n?=
 =?utf-8?B?UkZlayt3RGM1Yk1XazhyRndQL2h4SFRidkNHVWpPbE9iVWFnMTFVZm55KzBC?=
 =?utf-8?B?cUVYV2RlZVBwTWloNWljay9TWXNNZHc0RGx5cmJyUXV2OGZPTTZ2YWtCT3RI?=
 =?utf-8?B?TzQ5ZHR6eUE4di9uaUQ3OWg3Z0R1c0h6bWdkOHM0aWtsVk9yZ3o5ODE4RGtJ?=
 =?utf-8?B?UVh0dHFtNWtRRk1hbjlUOEcwcVdsdWNOMEM4VTJYeWVwc0pWd1UyN3JGcWZx?=
 =?utf-8?B?TGdMQklxeFlDWGdMQzYwczhQRlRwbWJZbnJ1N2tRRUFpWDcxU2o5RDQ1MWNr?=
 =?utf-8?B?QXBzVTAvU0M1RVBEeFRPYjlQem1jaHV1OFN6dE10Myt5OEtLSnRZa2wvK3d1?=
 =?utf-8?B?RXlKM3FhK0hRbEhrc1luUFBOcERWZ3cwd01vYVhML3lqdUh4dnZMTU9IZmdE?=
 =?utf-8?B?WlBCc0hyVEFxOFM5UUtRL3JuditRRVArVEFoc0pTN1ZjOWw5d1k4QmtIMnV0?=
 =?utf-8?B?RGlURUxMMUdWWThhRVpGalcyNmh2bVNIdmpCWGVZS3YwYzRWT2ViZ29ZTUdN?=
 =?utf-8?B?dG5SNi9GY3dQeXU4ZU1MT2t3L0hPUkQ5VTkva2VBRUl3UXJ6TnJ0VFZoTEht?=
 =?utf-8?B?V1h2c3NSbVJiRkJRcW1xNFptRDVUdnI3VllBbm8wQlU3c2V6RnlnS2F2S25v?=
 =?utf-8?B?eno2c1d5ZDZpeWdXTWtpY25tODBtTmYrMlZnV3hZMEdhd21raUVFL05YT2J5?=
 =?utf-8?B?VGZaRlB0aGg2a0RPdTRNbUpSeGJMbzBrSTRYajdudFUxdy8vcm0vMkFUTTUw?=
 =?utf-8?B?OGROeWNiOVRuYlk5NU1mMlMzcXRyR0loeFVHdERjWk5BYUJkREdRZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e38d50b2-85e9-4a83-f757-08de5d7e2c64
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 08:29:22.9565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qZCpC2tJCpu/+m+xm0Tl0l8eOomEcWQIDBdlAKgcwQmGWP8aZZxRRAMaGbdMaf6+TtHMk/TQ3pcN34TCAeOxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8507
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,intel.com,ffwll.ch,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riana.tauro@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E26ED91111
X-Rspamd-Action: no action

Hi Raag

On 1/21/2026 12:39 PM, Raag Jadav wrote:
> On Mon, Jan 19, 2026 at 09:30:25AM +0530, Riana Tauro wrote:
>> PVC supports GT error reporting via vector registers along with
>> error status register. Add support to report these errors and
>> update respective counters. Incase of Subslice error reported
>> by vector register, process the error status register
>> for applicable bits.
>>
>> Incorporate the counter inside the driver itself and start
>> using the drm_ras generic netlink to report them.
>>
>> Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: Add ID's and names as uAPI (Rodrigo)
>>
>> v3: use REG_BIT
>>      do not use _ffs
>>      use a single function for GT errors
>>      remove redundant errors from logs (Raag)
>>      use only correctable/uncorrectable error severity (Pratik/Aravind)
>> ---
>>   drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  53 +++++-
>>   drivers/gpu/drm/xe/xe_hw_error.c           | 182 +++++++++++++++++++--
>>   2 files changed, 220 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> index c146b9ef44eb..5eeb0be27300 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> @@ -6,15 +6,60 @@
>>   #ifndef _XE_HW_ERROR_REGS_H_
>>   #define _XE_HW_ERROR_REGS_H_
>>   
>> -#define HEC_UNCORR_ERR_STATUS(base)                    XE_REG((base) + 0x118)
>> -#define    UNCORR_FW_REPORTED_ERR                      BIT(6)
>> +#define HEC_UNCORR_ERR_STATUS(base)		XE_REG((base) + 0x118)
>> +#define   UNCORR_FW_REPORTED_ERR		REG_BIT(6)
>>   
>> -#define HEC_UNCORR_FW_ERR_DW0(base)                    XE_REG((base) + 0x124)
>> +#define HEC_UNCORR_FW_ERR_DW0(base)		XE_REG((base) + 0x124)
>> +
>> +#define ERR_STAT_GT_COR				0x100160
>> +#define   EU_GRF_COR_ERR			REG_BIT(15)
>> +#define   EU_IC_COR_ERR				REG_BIT(14)
>> +#define   SLM_COR_ERR				REG_BIT(13)
>> +#define   GUC_COR_ERR				REG_BIT(1)
>> +
>> +#define ERR_STAT_GT_NONFATAL			0x100164
>> +#define ERR_STAT_GT_FATAL			0x100168
>> +#define   EU_GRF_FAT_ERR			REG_BIT(15)
>> +#define   SLM_FAT_ERR				REG_BIT(13)
>> +#define   GUC_FAT_ERR				REG_BIT(6)
>> +#define   FPU_FAT_ERR				REG_BIT(3)
>> +
>> +#define ERR_STAT_GT_REG(x)			XE_REG(_PICK_EVEN((x), \
>> +								  ERR_STAT_GT_COR, \
>> +								  ERR_STAT_GT_NONFATAL))
> 
> Shouldn't this be FATAL?

No it is correct

#define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) - (__a)))

index=0	val=0x100160
index=1 val=0x100164
index=2 val=0x100168

> 
>> +#define PVC_COR_ERR_MASK			(GUC_COR_ERR | SLM_COR_ERR | EU_IC_COR_ERR | \
>> +						 EU_GRF_COR_ERR)
>> +
>> +#define PVC_FAT_ERR_MASK			(FPU_FAT_ERR | GUC_FAT_ERR | EU_GRF_FAT_ERR | \
>> +						 SLM_FAT_ERR)
>>   
>>   #define DEV_ERR_STAT_NONFATAL			0x100178
>>   #define DEV_ERR_STAT_CORRECTABLE		0x10017c
>>   #define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
>>   								  DEV_ERR_STAT_CORRECTABLE, \
>>   								  DEV_ERR_STAT_NONFATAL))
>> -#define   XE_CSC_ERROR				BIT(17)
>> +
>> +#define   XE_CSC_ERROR				17
>> +#define   XE_GT_ERROR				0
>> +
>> +#define ERR_STAT_GT_FATAL_VECTOR_0		0x100260
>> +#define ERR_STAT_GT_FATAL_VECTOR_1		0x100264
>> +
>> +#define ERR_STAT_GT_FATAL_VECTOR_REG(x)		XE_REG(_PICK_EVEN((x), \
>> +								  ERR_STAT_GT_FATAL_VECTOR_0, \
>> +								  ERR_STAT_GT_FATAL_VECTOR_1))
>> +
>> +#define ERR_STAT_GT_COR_VECTOR_0		0x1002a0
>> +#define ERR_STAT_GT_COR_VECTOR_1		0x1002a4
>> +
>> +#define ERR_STAT_GT_COR_VECTOR_REG(x)		XE_REG(_PICK_EVEN((x), \
>> +								  ERR_STAT_GT_COR_VECTOR_0, \
>> +								  ERR_STAT_GT_COR_VECTOR_1))
>> +#define ERR_STAT_GT_COR_VECTOR_LEN		4
> 
> Now this makes me question about FATAL_VECTOR_LEN, perhaps we should add
> it? Since we already have enums for it, I'm wondering if we should reuse
> them here instead of having separate raw values?

Hmm let me check.

> 
>> +#define ERR_STAT_GT_VECTOR_REG(hw_err, x)	(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
>> +						ERR_STAT_GT_COR_VECTOR_REG(x) : \
>> +						ERR_STAT_GT_FATAL_VECTOR_REG(x))
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index b42495d3015a..bd0cf61741ca 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -3,6 +3,7 @@
>>    * Copyright © 2025 Intel Corporation
>>    */
>>   
>> +#include <linux/bitmap.h>
>>   #include <linux/fault-inject.h>
>>   
>>   #include "regs/xe_gsc_regs.h"
>> @@ -15,7 +16,10 @@
>>   #include "xe_mmio.h"
>>   #include "xe_survivability_mode.h"
>>   
>> -#define  HEC_UNCORR_FW_ERR_BITS 4
>> +#define  GT_HW_ERROR_MAX_ERR_BITS	16
>> +#define  HEC_UNCORR_FW_ERR_BITS 	4
>> +#define  XE_RAS_REG_SIZE		32
> 
> This looks like it can be BITS_PER_TYPE(). Also, why do we need a separate
> macro?

The reason i kept a separate macro is that for_each_set_bit requires a 
unsigned long, but the register size is 32.


> 
>>   extern struct fault_attr inject_csc_hw_error;
>>   static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>>   
>> @@ -26,10 +30,21 @@ static const char * const hec_uncorrected_fw_errors[] = {
>>   	"Data Corruption"
>>   };
>>   
>> -static bool fault_inject_csc_hw_error(void)
>> -{
>> -	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
>> -}
>> +static const unsigned long xe_hw_error_map[] = {
>> +	[XE_GT_ERROR] = DRM_XE_RAS_ERROR_CLASS_GT,
>> +};
>> +
>> +enum gt_vector_regs {
>> +	ERR_STAT_GT_VECTOR0 = 0,
>> +	ERR_STAT_GT_VECTOR1,
>> +	ERR_STAT_GT_VECTOR2,
>> +	ERR_STAT_GT_VECTOR3,
>> +	ERR_STAT_GT_VECTOR4,
>> +	ERR_STAT_GT_VECTOR5,
>> +	ERR_STAT_GT_VECTOR6,
>> +	ERR_STAT_GT_VECTOR7,
>> +	ERR_STAT_GT_VECTOR_MAX,
> 
> This is guaranteed last member, so redundant comma.

will fix

> 
>> +};
>>   
>>   static enum drm_xe_ras_error_severity hw_err_to_severity(enum hardware_error hw_err)
>>   {
>> @@ -39,6 +54,11 @@ static enum drm_xe_ras_error_severity hw_err_to_severity(enum hardware_error hw_
>>   	return DRM_XE_RAS_ERROR_SEVERITY_UNCORRECTABLE;
>>   }
>>   
>> +static bool fault_inject_csc_hw_error(void)
>> +{
>> +	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
>> +}
>> +
>>   static void csc_hw_error_work(struct work_struct *work)
>>   {
>>   	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
>> @@ -86,15 +106,121 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
>>   	xe_mmio_write32(mmio, HEC_UNCORR_ERR_STATUS(base), err_src);
>>   }
>>   
>> +static void log_hw_error(struct xe_tile *tile, const char *name,
>> +			 const enum drm_xe_ras_error_severity severity)
>> +{
>> +	const char *severity_str = error_severity[severity];
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +
>> +	if (severity == DRM_XE_RAS_ERROR_SEVERITY_UNCORRECTABLE)
> 
> If we have FATAL case in the future, should we come back refactoring this?
> Perhaps the reverse logic would be a bit more future proof.


There will be only two severity levels correctable and uncorrectable and 
that is confirmed for XE KMD

sure i can reverse it.

> 
>> +		drm_err_ratelimited(&xe->drm, "%s %s detected\n", name, severity_str);
>> +	else
>> +		drm_warn(&xe->drm, "%s %s detected\n", name, severity_str);
>> +}
>> +
>> +static void log_gt_err(struct xe_tile *tile, const char *name, int i, u32 err,
>> +		       const enum drm_xe_ras_error_severity severity)
>> +{
>> +	const char *severity_str = error_severity[severity];
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +
>> +	if (severity == DRM_XE_RAS_ERROR_SEVERITY_UNCORRECTABLE)
> 
> Ditto.
> 
>> +		drm_err_ratelimited(&xe->drm, "%s %s detected, ERROR_STAT_GT_VECTOR%d:0x%08x\n",
>> +				    name, severity_str, i, err);
>> +	else
>> +		drm_warn(&xe->drm, "%s %s detected, ERROR_STAT_GT_VECTOR%d:0x%08x\n",
>> +			 name, severity_str, i, err);
>> +}
>> +
>> +static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err,
>> +				u32 error_id)
>> +{
>> +	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras_counter *info = ras->info[severity];
>> +	struct xe_mmio *mmio = &tile->mmio;
>> +	unsigned long err_stat = 0;
>> +	int i, len;
>> +
>> +	if (xe->info.platform != XE_PVC)
>> +		return;
>> +
>> +	if (hw_err == HARDWARE_ERROR_NONFATAL) {
>> +		atomic64_inc(&info[error_id].counter);
>> +		log_hw_error(tile, info[error_id].name, severity);
>> +		return;
>> +	}
>> +
>> +	len = (hw_err == HARDWARE_ERROR_CORRECTABLE) ? ERR_STAT_GT_COR_VECTOR_LEN
>> +						     : ERR_STAT_GT_VECTOR_MAX;
>> +
>> +	for (i = 0; i < len; i++) {
>> +		u32 vector, val;
>> +
>> +		vector = xe_mmio_read32(mmio, ERR_STAT_GT_VECTOR_REG(hw_err, i));
>> +		if (!vector)
>> +			continue;
>> +
>> +		switch (i) {
>> +		case ERR_STAT_GT_VECTOR0:
>> +		case ERR_STAT_GT_VECTOR1:
>> +			u32 errbit;
> 
> With this I think you'll need braces to make the compiler happy, so either
> add them or move this to the top.
 > >> +			val = hweight32(vector);
>> +			atomic64_add(val, &info[error_id].counter);
>> +			log_gt_err(tile, "Subslice", i, vector, severity);
>> +
>> +			/* Read Error Status Register once */
> 
> Why? Can you please elaborate?

The register will be populated only once. Even though there are multiple 
vectors reported, the causes for the subslice error will be read and 
cleared once.

Will add it in comment.

> 
>> +			if (err_stat)
>> +				break;
>> +
>> +			err_stat = xe_mmio_read32(mmio, ERR_STAT_GT_REG(hw_err));
>> +			for_each_set_bit(errbit, &err_stat, GT_HW_ERROR_MAX_ERR_BITS) {
>> +				if (hw_err == HARDWARE_ERROR_CORRECTABLE &&
>> +				    (BIT(errbit) & PVC_COR_ERR_MASK))
> 
> I'm wondering if this can be a (hw_err ? x) macro for this? Perhaps it'll
> help remove the duplication.

It is used once. Will check

> 
>> +					atomic64_inc(&info[error_id].counter);
>> +				if (hw_err == HARDWARE_ERROR_FATAL &&
>> +				    (BIT(errbit) & PVC_FAT_ERR_MASK))
>> +					atomic64_inc(&info[error_id].counter);
>> +			}
>> +			if (err_stat)
>> +				xe_mmio_write32(mmio, ERR_STAT_GT_REG(hw_err), err_stat);
>> +			break;
>> +		case ERR_STAT_GT_VECTOR2:
>> +		case ERR_STAT_GT_VECTOR3:
>> +			val = hweight32(vector);
>> +			atomic64_add(val, &info[error_id].counter);
>> +			log_gt_err(tile, "L3 BANK", i, vector, severity);
>> +			break;
>> +		case ERR_STAT_GT_VECTOR6:
>> +			val = hweight32(vector);
>> +			atomic64_add(val, &info[error_id].counter);
>> +			log_gt_err(tile, "TLB", i, vector, severity);
>> +			break;
>> +		case ERR_STAT_GT_VECTOR7:
>> +			val = hweight32(vector);
>> +			atomic64_add(val, &info[error_id].counter);
>> +			break;
>> +		default:
>> +			log_gt_err(tile, "Undefined", i, vector, severity);
>> +		}
>> +
>> +		xe_mmio_write32(mmio, ERR_STAT_GT_VECTOR_REG(hw_err, i), vector);
>> +	}
>> +}
>> +
>>   static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>>   {
>>   	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
>>   	const char *severity_str = error_severity[severity];
>>   	struct xe_device *xe = tile_to_xe(tile);
>> -	unsigned long flags;
>> -	u32 err_src;
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras_counter *info = ras->info[severity];
>> +	unsigned long flags, err_src;
>> +	u32 err_bit;
>>   
>> -	if (xe->info.platform != XE_BATTLEMAGE)
>> +	if (!IS_DGFX(xe))
>>   		return;
>>   
>>   	spin_lock_irqsave(&xe->irq.lock, flags);
> 
> I'm wondering if we really need this? We're already inside irq handler so
> what are we protecting here?

This is not related to the series. Will have to check
> 
>> @@ -105,11 +231,44 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>>   		goto unlock;
>>   	}
>>   
>> -	if (err_src & XE_CSC_ERROR)
>> +	/*
>> +	 * On encountering CSC firmware errors, the graphics device is non-recoverable.
> 
> ... "so bail immediately."

The code is quite intutive but will add it for additional clarity.

> 
>> +	 * The only way to recover from these errors is firmware flash. The device will
>> +	 * enter Runtime Survivability mode when such errors are detected.
>> +	 */
>> +	if (err_src & XE_CSC_ERROR) {
>>   		csc_hw_error_handler(tile, hw_err);
>> +		goto clear_reg;
>> +	}
>>   
>> -	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
>> +	if (!info) {
>> +		drm_err_ratelimited(&xe->drm, HW_ERR "Errors undefined\n");
>> +		goto clear_reg;
>> +	}
>> +
>> +	for_each_set_bit(err_bit, &err_src, XE_RAS_REG_SIZE) {
>> +		u32 error_id = xe_hw_error_map[err_bit];
> 
> Does this need bounds checking against ARRAY_SIZE()?
> 
>> +		const char *name;
>> +
>> +		name = info[error_id].name;
>> +		if (!name)
>> +			goto clear_reg;
> 
> Shouldn't we atleast give the next id a try?

yeah makes sense. will add it.

Thanks
Riana

> 
>> +		if (severity == DRM_XE_RAS_ERROR_SEVERITY_UNCORRECTABLE) {
> 
> Ditto for logging per severity.
> 
> Raag
> 
>> +			drm_err_ratelimited(&xe->drm, HW_ERR
>> +					    "TILE%d reported %s %s, bit[%d] is set\n",
>> +					    tile->id, name, severity_str, err_bit);
>> +		} else {
>> +			drm_warn(&xe->drm, HW_ERR
>> +				 "TILE%d reported %s %s, bit[%d] is set\n",
>> +				 tile->id, name, severity_str, err_bit);
>> +		}
>> +		if (err_bit == XE_GT_ERROR)
>> +			gt_hw_error_handler(tile, hw_err, error_id);
>> +	}
>> +
>> +clear_reg:
>> +	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
>>   unlock:
>>   	spin_unlock_irqrestore(&xe->irq.lock, flags);
>>   }
>> @@ -131,9 +290,10 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>>   	if (fault_inject_csc_hw_error())
>>   		schedule_work(&tile->csc_hw_error_work);
>>   
>> -	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++)
>> +	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
>>   		if (master_ctl & ERROR_IRQ(hw_err))
>>   			hw_error_source_handler(tile, hw_err);
>> +	}
>>   }
>>   
>>   static int hw_error_info_init(struct xe_device *xe)
>> -- 
>> 2.47.1
>>

