Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIlLGvuPcWkLJAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 03:48:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9816113E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 03:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF57910E0CF;
	Thu, 22 Jan 2026 02:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VX7EmctU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8648310E004;
 Thu, 22 Jan 2026 02:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769050103; x=1800586103;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0eyN2zXdsnc/HHvSyzqLGX9DVayhXjQOkAu2ZpdI3OM=;
 b=VX7EmctUUW5K9wS7F9hsoE542t3ckDlgfyrOk++qUApPAOZeofWu9fuG
 VIIV/U7j5OZcOjlroRcosW/6GlGMD8hLSrPeGSwq0PZkSM1Fmjdsit6rf
 S/G8GUwQTmjVIwmraHy+pCO11DvfrIhT5BcJl6KkWiUrWeM1+Q/EAYM/2
 Sbjmo3ZgG6ciJSRKF2wf9ZUkIlhRbi+lSyBTD2Zimrt+ojL33qBLeFiar
 A37wodK6GlYWWXlJklcTY+vX0bmemgMzRvv0rYMini+vUrrFNS20H2SF3
 ElRb7DCTruLuYCstqW/xsUG7HaLgQhpEfhDLpbUtgOG7cjWvQdqeiIbcV w==;
X-CSE-ConnectionGUID: fjK7BXtyQJWd4B6tSVnftA==
X-CSE-MsgGUID: rE5eKE66Qqu0ascBkeyPZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="87864478"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="87864478"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 18:48:21 -0800
X-CSE-ConnectionGUID: JgxGXH5ERo2httLZrrIJBA==
X-CSE-MsgGUID: C86E/oTASLSYjVMurfP6Cg==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 18:48:21 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 18:48:20 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 18:48:20 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.16) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 18:48:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5euSg2KO+2zfsKCL2S1Vb8AyamRNpZz0C8LWzUhOWIiF2bJY6NKN/cCGj2ql13FNUmUk4TqfCQu7faRVJx4K6HwgwExLDe2Q23AtXyP/8+eSBHx8jwUvxRM4vrk00FDrNqob8ueUwtPIXMV1ONnp56RlzRGbJhoafLSr91/91jGLAQowGZg6EP+ZP2CoCLAqPpZeL6qrTg5qeDYgzWCHcjDDpILry3Ftok5S53wVjrHzgCUNAm7o1L3Nki4tQ2TzPL58p4/UsWmsE07ZAK4YrxN+orBZopX21IR5Ki0jRCibuUcW+uwrgGUlNJ49AeP4Vn7f2EnqnbDgrrk64wXYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOEXMbOh1XqOnsAR7gWjuSUfnxYduEDDunTjqXnRS7E=;
 b=KY+NxIm7NugCUh5yMYm6QrrMR1TiQm6wivUaywGZi+7xgI+gkrw78ixZtnplokRigM8Pfr11XoZ6pdVsCjJQnbBbiGlifFE73YQI3NBkZl4rAXHHzFlxgIIi/HmAm+jz//Pvuzv51kG0CJuv9OeBqh+9ZCKwHIi8PkEdAa90bkVbAqiQu8Es6rZ3Ne6GRS0C4uq9wttDgigstkdyglQCOq69yhT8f0IdkUkBwaMRfVSVZe+HNqsJO5tYM4fm2oqQbv8sRe5RGAFiqMvCzFLXU0+3OUvzX4DevWqAMwN7KWapxX3CMNwNjHqgRXyfl+4FdTo5/GwhFnuyhp+Vc/8ZiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ0PR11MB7703.namprd11.prod.outlook.com (2603:10b6:a03:4e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 02:48:17 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%6]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 02:48:14 +0000
Message-ID: <df992384-3752-461b-93bd-b9955bcc0423@intel.com>
Date: Thu, 22 Jan 2026 08:18:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drm: Define user readable error codes for atomic
 ioctl
To: Xaver Hugl <xaver.hugl@kde.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, <harry.wentland@amd.com>, <uma.shankar@intel.com>,
 <louis.chauvet@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20260106-atomic-v7-0-d51d9a351684@intel.com>
 <20260106-atomic-v7-1-d51d9a351684@intel.com>
 <CAFZQkGzQ3GmUHibTJS2xCWsya2=Bh_Uo8zjqN5f_K4HMdfpHCA@mail.gmail.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <CAFZQkGzQ3GmUHibTJS2xCWsya2=Bh_Uo8zjqN5f_K4HMdfpHCA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::15) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SJ0PR11MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f6005f-80a7-4a68-3439-08de5960b060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTFqQS8rdW9pcytQTnRuU3k4KzVMZDNoWlV6bkNzbCtOaGdOMS9xRmpTV2Z0?=
 =?utf-8?B?cFhxVk9UVDZEVnVTWjhNWnRoUnBjSHhQSG9UTjdvampnWWYrUG1Qa0NQSjBV?=
 =?utf-8?B?Z3BmeW5KN1FRVDRjZ2tsZlZmbFNnblFqS1pyZk1SRjRRZU1sTGNhc0tURXRS?=
 =?utf-8?B?NlFZaUdZdllNNGFodjNpZ2hZS3Z2TzY2Zm5nNTlNdXJJRDFXTXE5cXBGeW9o?=
 =?utf-8?B?UkRhMTROb3R3SE8rTHBrOGlJaHpUK3dVYjhCcjM3cW9UcXlzOCthR04vY0Rl?=
 =?utf-8?B?emRLaExsSWkwTjhDUzRRc2FRbjFlT2hEakhpdmkrR3ZlSVFzeGxRdTlTOTVy?=
 =?utf-8?B?MGVNdnluMU1PMWhiem5jVzJDeHdta3cwVU0vS2ZYOTVTNklXZk8wdldWbEJK?=
 =?utf-8?B?Y1UydTBjZFJpSzY1VThFQTRvdXhSaFdwNmtmVCtQUjhGTDduaWdBN3NwRHNL?=
 =?utf-8?B?bzFPdWxVK091Wm5JWlZ0TkNkUFhsYVhrL3hXRmthYVJSOGtxeGJUZUtQYVJD?=
 =?utf-8?B?bUlLMW9aVWlWZ3RBZHhJNW5SdTRoNkl4Y0lKYjdUKzQxL0U5a1M5cHVMcDBS?=
 =?utf-8?B?bDYrSGNMNmVSRzF1S1JLWGNQWWtDYXJKOE1hN01oRWJrRHJZMmZXb0F3WFBJ?=
 =?utf-8?B?SFk5VDYwaDBpeW9iWm1oR0QxYllPaEduRStaVDFGd3VVSlZsOGlyaVJZOFEw?=
 =?utf-8?B?aDAyamVWL1hFcGVIcnJUa0pPS0FMUzBJOXQ4RG5YZnJNRDJTRlJYeHB4cjR1?=
 =?utf-8?B?ZFVaSFhTM201bUk3STN3aVlaRHRoc0JrVTZpRDNNYjVESXVxK2tCTlBhQTU4?=
 =?utf-8?B?TGtmYjdjY0dvM0pzcXp5TVhkNm5mYStIWG1jdUc2QjEwaVk5Vk4yUW44dFZE?=
 =?utf-8?B?YkRscFZpRlBQaTJjS0tWd1dSdU1CbFpUTWErajB2SGVURmtZV2E0cHNrb0h6?=
 =?utf-8?B?ZVd4U0lEd2czeEhtWmtNVEs0ZW1JY0J4Skx0MVkzL2tJQXc5T045OU9ZV2xQ?=
 =?utf-8?B?ejFlTXVmREp4VHdza0hPN2s5OFdrTzV0cWkxV1Q3T3hFUXUrWSszeUFWUUZP?=
 =?utf-8?B?V2xkclZEdUpHaXdxRGN0cks4dy9Rb3dCSkFLYXNLc1EybDczMmJBQ1NFUlZN?=
 =?utf-8?B?VVJuU0pkT01wZjRXT3dPVnZ0YVV6a0xBL0gyRm01N2RTejYwbVM3S0hqdFli?=
 =?utf-8?B?WnllTm1aaUVaVlFuUzBHNkgrVnhPbjFPSk15bDNDRm5PbjFzeEdaYnpWYmRk?=
 =?utf-8?B?ZU9WVUtmSG5yMFo3TFpzTEcxVWJFcXBuK1ltK3krcEF2a2YvVzUvV1ZjT0w5?=
 =?utf-8?B?Ly9Sd2QyOHVlbzVRR2dWOFNMeEVncnhrcDlvS0RFamhOak1aZm9vZVZOQzZ6?=
 =?utf-8?B?dlljam9kc3U5cjQwT2lPV1lMOG9ubTZXdHgydzhSN2tYKzNuU3I1VHEydE1R?=
 =?utf-8?B?L05Xay95UklKbmtCVjh0RlROeGRwV2xxVkIrOXQweUZLdWNtYTUxempzYVY0?=
 =?utf-8?B?SUN0dmxaOXpzWXMrem5qNDgzeXFWRFhOVHZPN2NXYUN5bVNWcW56eEppR3Nt?=
 =?utf-8?B?REZmYUZscDREb0pSSklPUjRsdHhBSDlrME5uM0g5MHJaUmVHc1oyR0owSWEv?=
 =?utf-8?B?Q3YwSzFaQXNXUVI0ZStlWkEyUUk0SUh5TjBkbVc3UEp3VFdSUWk5MzAzS3JJ?=
 =?utf-8?B?WmN6ZHNIRFdraGM3SzRuQjV3bU5Qb3V6TzJTMytLd2dURnZGeFhwSmZxTVpG?=
 =?utf-8?B?NHJxYTRwbFYzcjhjMTdwZzlRMy9ISTFmaDRORFQxd0pKdGdOR0hxaWVvSCtw?=
 =?utf-8?B?c3lFNHI2UEticXlrelpMZ3VCMEc0SVQ2Y1phNFlNRGYzRGtJT0o2SDZqWXF6?=
 =?utf-8?B?RXdhbTZFVC9DeDlucWZZZkE1Z05ONnY2UDVrOHhFTGh2T1NkOVdNSDEyclUv?=
 =?utf-8?B?REhQRWZOZ0ZqVGZOYkl2Y2lvOVlINTZrRWp3Wll1bkdPY1BrYTg0bWlxUExN?=
 =?utf-8?B?eHE1NEsxRk9MWEpVZGJud1RnMHVxUzYrZThFWmt3TGNuMkh0d09MU2FzNzB3?=
 =?utf-8?B?MDZoOWRJUDd2NUMwM0FMY0c1UVd6c1BXai9MNmVram85L3V1a045K1h5cnM5?=
 =?utf-8?Q?iP0Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0twak1lOTU2WXVOLzJCRzdRakZMeFNJTWhGNi95bStQdFRjMVVyTDRWTEpZ?=
 =?utf-8?B?M2R5WXFKMC8rS09JMWNLUHhocE83MDRSZnFqTzZMT05EVkFVRTlNbHN0RFRh?=
 =?utf-8?B?VmloMDBVYU90ODEvNVY3bXVsb2l5c00ycCtrbTB5blJSM1EyQTlhck4rVVda?=
 =?utf-8?B?Tmh0TGdTYkM3QWxsWElOSXJGTEF4ZVRHMFloWGcrQlVsRGtPMytxdFZSY29S?=
 =?utf-8?B?RTErTzR1Ymxnc3ZsdDJVNTkrT1lwa0NZYWZPMjRXREhjb0NlaFBiWlM0OWlN?=
 =?utf-8?B?d2NJMnpYTVR0SUM4VmZzM2Z5TDdCT2NmUDZGRVN5R2gwR1BRV3lBK2oyTUF1?=
 =?utf-8?B?YWtEaUhreGxPcFpYbHlGN2hqdFJ4YmdSbXlJUnpGMTIwRG01eExQTVdyTjEz?=
 =?utf-8?B?N2VDV1hxcmJtenVvczVwMWxOWkdEbkZoNHBYTHJCcDRWMjRLSHBzTHdUU1lx?=
 =?utf-8?B?YU8xUUJsSmM2SUV5eDAxaTR1cTZBWW1BaFJtMGZCbHJQTEdpU1VMdDVHWU9y?=
 =?utf-8?B?RmtXSHFVcjh2eTk4RExudjVEWUpsQk0ycElTeG90OXRDUlM2WjRoRWlvaG1t?=
 =?utf-8?B?bnlTcEpxM2dCNDlDQ2xBRVp6eUo0NGxtcXJHMElndXdHT1JyWGRjNFFZLzJ4?=
 =?utf-8?B?MjZ1bTVSQkQyS1NSdTRxMGpsYkhtdGVsQ3RFZmFMb3gvMXpJUEhyd2Jqdk40?=
 =?utf-8?B?bllpVDZQMEVlVE5OQ3lJa3NmYStBSC9DYzR4TlBHUEVJT1lBVHV6TWJHYUtp?=
 =?utf-8?B?ZWhnd1NKMnk0L0c1QzlDUEdzS1pjR3h1MnJWYzBXc3dwOWR0UUFMT2gxd2w4?=
 =?utf-8?B?KzZpOHI5OGtHL0EzUDFON3JpTHd0Q045ckFUWitMMmhXVjRVbTZwLzIyNEhS?=
 =?utf-8?B?aHZlVS95QStRWmZFbWhqU3FEbVhCZmlFSVplVm4zR2hmeFA4VDdwODlZMk5n?=
 =?utf-8?B?VTNTcDhIckl4eTNXSlJxK1NEWlVjTWdQZjNXOXRPQUUwVndrRE1MWFNNZVVM?=
 =?utf-8?B?anJyTER4empIVCt4TkFqN0Jud2xTUjE1Z09SNlJIRmh5a2laUHNRNmJuMUlD?=
 =?utf-8?B?VnVmZkVZZkplbDlnTUZzbnRWL2svZGVPazlpQXllSmlnNWNXNXhEbklHWEs0?=
 =?utf-8?B?eXpMNldyUFlQYXRhdVozQU9VcU01Z25SeUdCTFJWcUtSa2VqUGZEYjA0Y1Jp?=
 =?utf-8?B?T3JQcFRObnlwWnZXMkpLRGo3Nm9yaEZhbmlyQkRlc1lhbnZ3TXdIc05DRnZj?=
 =?utf-8?B?Y1l0aE9aY2VDSE1SSUlyQTRIRlZaRUJ5N3hjRFpFYmJjNUxrOGNjaE44bXFX?=
 =?utf-8?B?NmZtTHV2V3hlV0JpSkE1YlpPQUxIZkhMNTlIenFxV056RTYyNStHWmRvLzRj?=
 =?utf-8?B?KzFidlkzSWRHMndYdGFHYXZDaFBlalVFK0RkOW5BMTRacmZ4V1FNU01PTGNZ?=
 =?utf-8?B?WXpCQ01rSjlJRlpwUlVaeU9VdC96RjZiMXp1MFhxOGtxYnl4K2h5cm5QckJS?=
 =?utf-8?B?WXhNaVdUS3ZmZisvSjBMT2lvNHhRU2plcHI5VlNzSTlyWGlwK2RxbXlEdERm?=
 =?utf-8?B?bk94aW9EeS9PVGVLeHhOeEE3bTk1ckJqdksxbVg5ZmE4aWpWM0kzMmlZd2Ja?=
 =?utf-8?B?RVN5NWVKdWliWi9rK2pFb2dQOWdZRExxSmNGZEZRakU3ZDBNdTZMbzJvQlUw?=
 =?utf-8?B?RzEwbU1MVDF6Y0NJcDJMSCtrMGFyd3UxbC9nTldlVDFSTFVMODZRRElaRTZh?=
 =?utf-8?B?aEZweEE1WXVLMFA5eDV3VUJldlRHQlRSWkVVVHQ1aEorbWswUU5mWjNjTWpa?=
 =?utf-8?B?OTVLdG1pU05QVVcrbEtONmhXckJrUVpsMEc1c0dDSTJhdml4eFlscGdkNmFZ?=
 =?utf-8?B?eXBhYXhFbVZmb3NSTzd6anhud25FOTFGNWkxWWZjTGdTVTI1eUt6WTN3WUFD?=
 =?utf-8?B?UGM2QjlOWFZQNkVOYnZRM0hRZW1BTXh4S0kwVXBDRytudVo2U2xBdXhSRlp5?=
 =?utf-8?B?a01xcS9wMHJmMWFpVmVBbXg2VGhOdnJOYU5rRFUxTnVBUmVBajZNNkNsZHpu?=
 =?utf-8?B?aiszTDA0WUhIKzVCS09tay9uOXZodEtlS1BHdmxEcDY1dk9kaVp5WDkvckdk?=
 =?utf-8?B?Y1pYU2x0R3JQdDN3MUhmMUZwU21QK0wrOWpwcHFzRlR1Smt0OHgvWi80WGV5?=
 =?utf-8?B?dktBbHBlL1VxT3AzR2V5OXNCbjdlWS9Hc2xOK3B2clVWekdkN3Z4SUhlRXMv?=
 =?utf-8?B?ZFBmTk9KL01SMEp2QXlPTUJVU1B1dlJNL0hyWDRDSno5SXl6ZjZwclA0aHIr?=
 =?utf-8?B?Vm5McWtRQjVwOUYvL2VnS1dNS2VYN3JHT1NyaktubWczSXR0SElmUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f6005f-80a7-4a68-3439-08de5960b060
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 02:48:14.7709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O07aEgZHP7eOwx0r8YN6J0BLQmJasNZquLr3JWQVxHx0kd2K4Z/kgbtB4KJG2NaDlDDACmJAgwHI3HPsfEIgjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7703
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,amd.com,bootlin.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 1B9816113E
X-Rspamd-Action: no action

On 21-01-2026 19:17, Xaver Hugl wrote:
>> +       DRM_MODE_ATOMIC_ASYNC_NOT_SUPP_PLANE,
> I don't think it makes sense to have an enum value for this, the
> per-plane support for async pageflips should be reported to the
> compositor in a way that doesn't require atomic tests. Once that's
> done, trying to do async flips with it is just invalid API usage.
Sure will remove this!
For getting to know if async flip is supported on a plane or not 
IN_FORMATS_ASYNC can be used.
>
>> +       DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPP,
> Same here, there's already a drm property for async-capable
> format+modifiers on each plane, so this falls under invalid API usage.
>
> One more thing I noticed for the failure codes: I think it would be
> better if INVALID_API_USAGE and unspecified errors would be split,
> with the latter being the default error code.
> Afaict with the current version the compositor would be told it's
> using the API wrong when it's just a normal test failure that the
> driver hasn't added a more specific error code for yet.
> INVALID_API_USAGE would then just be for actual "you should know
> better than to try this" cases, which should never happen in correct
> compositor operation.
Got it, all driver compatibility/not supported will go with proper error 
code and anything already known to compositor but still sends it wrongly 
will fall under INVALID_API_USAGE.
> Other than that, the API looks good to me. I'll put together a KWin
> implementation soon.

Thanks for the inputs and review.


Thanks and Regards,
Arun R Murthy
-------------------

