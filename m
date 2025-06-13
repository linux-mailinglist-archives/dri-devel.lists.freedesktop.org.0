Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B69AD9355
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 19:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE5B10E048;
	Fri, 13 Jun 2025 17:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uzu6Q8F3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA8A10E048
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 17:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749834010; x=1781370010; h=date:from:to:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=5E0dq6aER+HCBu/cANkg3hLa2ZwTrOyl5mSrmKbqaAg=;
 b=Uzu6Q8F34mCZOym2YLaVx7MTV/bxRRD4YlcfFjIMBP9DlDnE10AljGaA
 GsI0t9o2x5dS2hsUXq+q32AmUEETSjmHbjq8+FAFmcVNeLxLZpa5Yqlrb
 UoVw1kzWl5ZlYKr861PtWucI2DqpEERJVOdlZcssGjv/NB7xN8Ah+zw3B
 sj33/v8aQ4OoRU9FGbgTKYLBSkUILUPB8zITptKxtYqcZH8cM6ccl+aFX
 xw0Gd6ex4Jf5vsORMhIJ3FZN4yyEVolGIo2MsrPIOsoQoOMNINoNsf/Hv
 4vM64/nQs/3WrkEJ01/NhjR3xuwAITgtEVGq3S9qGNdBnkyb4tYNCq+kb w==;
X-CSE-ConnectionGUID: OvcDT6q5SpSB99RMN5dVQA==
X-CSE-MsgGUID: uxOWwlZ/QsKXN8e34Pi4Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="74590225"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="74590225"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 10:00:09 -0700
X-CSE-ConnectionGUID: T2j5FA9YT1ybUbgj7j/OUg==
X-CSE-MsgGUID: JMjt0PsxQ+u/mL+e3Ze/Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="148773374"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 10:00:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 10:00:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 10:00:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.74) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 10:00:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPq6hhFEveUUTf2cZzqLQNpDeBz2WPvHU7PU6+D5kCV7Zmar2/RlmURIqYsuVrNOwkMIsqYLjOHsD/rqF8ttlvoEhp14FhmTNh6Dpc32bK5z1d2rhtme0KNvGCpdviq2b/FcBttG32ofhYSktu1AhemRduQSiQuZ5dmywf22BkazCgq2xYYN9FwfoZwSw10XWAHCS5WaWRiH5qWGFjoeISl19NG7oZ75yHtJU2e32WLpzpFU5fgwXH/d4d8qUNu1thxOSaA6YQI91sd60q3g+Qdz5QAr+sAWJtRY1Wp2eQE9hAHB/r6tC3yK5sWyGGOwX11YETpjLFw65BzGryDLjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5E0dq6aER+HCBu/cANkg3hLa2ZwTrOyl5mSrmKbqaAg=;
 b=Wz4y9Qo+h3aVfKyvBN8TorWqbOvoTjUZxo+xDaby9GqKsNTIMf4ltUhHJkJyE2SempqoFNrKm9VUD7NZyqN/LRZAYVejWuvJxl4+I1YdBKBmZP8XhUKXxOaWSD8WdvqWpB6H3/KlcNmahYNwY25nyTb5T1Vw8yL8aFSZ3TCPHxWfY36h1S2Z5RZ6vSsIs5xNXKvWkzTps7cV30Kz28KSN5Q2MyI6QqdQzHh8e/P9PZGXgF/S3s1mtEulavBHp4xoP0+Hnt5t90wnZJG7+oZroFhJBrNflzFLEh5CZ5TLfHYxwZY1hWp0k9WWal/pOlRGVUncyjKv2v7IzFqA/6sivA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPFF2B8F6C64.namprd11.prod.outlook.com (2603:10b6:518:1::d60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 13 Jun
 2025 17:00:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 17:00:06 +0000
Date: Fri, 13 Jun 2025 10:01:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <dakr@kernel.org>, <pstanner@redhat.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: DRM scheduler issue with spsc_queue
Message-ID: <aExZdkcnBVvX1DCa@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0281.namprd03.prod.outlook.com
 (2603:10b6:303:b5::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPFF2B8F6C64:EE_
X-MS-Office365-Filtering-Correlation-Id: ba6e882f-49ce-4bdf-6e50-08ddaa9bbf6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXlYWEZFN1ZidERzV0dKRWxiRmw4aUZMMU82SWR4eTB0T0twSkNVR1huT1U5?=
 =?utf-8?B?OWU1NjdNWFRtQlc1bXVrQkwyUmtRTFBiTEdQQ09Ibng0OHlnVklvNU9sYkhn?=
 =?utf-8?B?S1BiK2xTc3NxM1pHcFBtNjdvcllYb0xPdkZMQWtWWlNjeE0xMG9rRkpVSnVX?=
 =?utf-8?B?TlNBcE9MbEJKa3VZanM4cW52UjNzWDh4eFZxVkh1TWNSbFVuVk5oOUlZQUR2?=
 =?utf-8?B?cG5QY0huU0lWT0FGT1o5WFhSQVkrS0xXNHp5K05scWEyekpBYkorR0hQRmMr?=
 =?utf-8?B?ZGJtUWNJckVadS9wS2p6RFIwOEY4bUkxbGNYa1VNenRRd3ZsTUQ1b1EvNnFJ?=
 =?utf-8?B?ZDUra2IxMjZmaXVWU1RKTFJVOEJpMUtPWVZhL2lXdlF0a3ZQTFlMRmlvckEx?=
 =?utf-8?B?a05NOWJMUXZXUSsyaVRzM01HTlNmUzZEdERabWpMaW00dmcvZWtLOHl5aDRH?=
 =?utf-8?B?ME44NGd0cUxnWlIzbUx0cHkvRHc3eld4aE8rNGVPQVZWNytwZ3ZRZllObDRE?=
 =?utf-8?B?Y2RKbEVWRFAzRWxIRCtvanVwL1FBQWVtK2ZrNDN2Y1V0VzZWVzNhRXJyZE5U?=
 =?utf-8?B?QWZiK2ltK25RZFA3OVRDSjlZL0RPdFNic0RFT2M3azlkcktLRlVSWFB3czBn?=
 =?utf-8?B?NVAwRGtsWmVzMC9iYkVmR21OZGQzb1pXcmN1eUpTU0tTV21raHFKZ1lSMmdP?=
 =?utf-8?B?c2Vmai9DOTJGS1VGcjJ4U1g0d0Y5TURyNXJwNXA4cENkRFpiZHl0OGc2ME9i?=
 =?utf-8?B?dEJuNjRaK3BFNWNpMkxibVgyclI2ckpXUmFid0oxSGZFbDcvd2hwaUtsM3E5?=
 =?utf-8?B?clNMOGwrZUhrT3J0K2xvWDVSdEREemVmbWY0NTVjeExvMi9ubk8zVjkrUGRh?=
 =?utf-8?B?cmE1NVJLZjM1ODROQU92djVoN29rOUo2OEdzMHFTWHlEeHpncldlOXNzNE00?=
 =?utf-8?B?NDA0ZTE5bHdGQ0ZocmMrNjVYNW5qWityZjVqeUZOeW5uWjlUVG5VTlFkMjRE?=
 =?utf-8?B?YkJPZUNCVjlpMjM0dmRFZ0RmZmdSRzBtaDFYeHRxb3pkWFBldm5nK0FweW9V?=
 =?utf-8?B?NmlmRkkxU2pzQyt1NWdHTzlmaUw3V0pIeit0Ky9CWWRMa3VMVnJNSi9FYjdQ?=
 =?utf-8?B?eU1uWmpqMFM3UTJBa1U2RDFYSWhsVUxVa2lXSkgrK25CVitDb2VGRVkxbnpu?=
 =?utf-8?B?RTZPa1NUaGF4Z1h6ZjVucjRDNzR2TjZuNGJ6Tk5JRGJQMjJiMmkyMEVVVGxs?=
 =?utf-8?B?eEJQbDRBUGpmbk1UeGpSS0Z0VjRBSGE3VFV1djl4dVc3NzdBMHRpbWVUT01x?=
 =?utf-8?B?MjRLSmh4S2REOWkvSndPQWp4QWtNZ0NQUjhZdjJTZXJ6TlQ0L3F1bkw5QXpV?=
 =?utf-8?B?UGpkb0JMQlhYQkQxdjYvaXVTbmcwdCtzd0tHRTZOcWhNcEF0YU9MMVZod2I1?=
 =?utf-8?B?dTBqQWtOek5yeUpyYXRoOXdSZEJMTURlRkZRblVUdkpIY1g0YzFrRmZkNVc2?=
 =?utf-8?B?bjd2RDdGZS9xRUFFQm5xc3E0WVFucmF3QXJOY3hFK0k0RFNRUVVCUldBa3dP?=
 =?utf-8?B?K1pDN2dSQnFoZXhCNCtGZFI0bnFTR1IrMzhLYUtoMHdFNThjUCtGbjZ0eTVK?=
 =?utf-8?B?MDh5UWJVckJ0SkYzWWxDUWZyK2dDUk1RZVBnQTJOZnhaL3ZlSVB3czFDMytq?=
 =?utf-8?B?ZVBmTEtpY3hjTHdabGtLbkdmdmNEM1pVMmtBQkxob0l3ZmUwQTJZQXRDTzUw?=
 =?utf-8?B?QXk2Z2U0eEZHbEQ5OVo3cVc2UjBNT01mTkdZK2w5MGFYdStkcjF5aGFEWnZy?=
 =?utf-8?B?bWREeTVhZzVNZUZIdGtHSWFxelplelc0SVY5VWkwcE9hd05CQzQ2b3lET2g3?=
 =?utf-8?B?M1AwRXJMQTVpdDd2Y2w3b2QvS2F3M09VTk9NbXQ2RVkwekE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEYzU2VPUGVId3NwcXV3L0hjejlLR1lURkxLejBTNGR5Rks2WDc3UCs1dFBG?=
 =?utf-8?B?NTdJWlFMQW1QeTdXandBbC9uRWpGZXkvVHdtQllQVk8xZkR5VlQ3UGcwMTBh?=
 =?utf-8?B?VjA1OU5CTnl5WnJmUXVWOHhsZTY4NkFCVTM0cVVVVk54b1FtOTgzY2hkQzhn?=
 =?utf-8?B?RnpkSUxpaWg2QTNtai92S0ltYUpJTDJDUDIveTBYK2ZQZUQ4MkVlRGJhK1kr?=
 =?utf-8?B?djF4bFppQXdLcDZIYlJENFJqTThZZTlaM3luVEdiVnNQVmZDTXU0bmRkQmxu?=
 =?utf-8?B?L3pDaWtqMERhRVZPWkRZb1FiWDZYSzdiNVFoR0Jobk9FMFB1ZXQ3bERkSW1h?=
 =?utf-8?B?WE45WWxIb25yNCt4aWpJd3NlRkIvSSt5YjJheWJTZWJnWlE4MnFIU05DVFNq?=
 =?utf-8?B?N2VCeGkrWHpVYWpJTWhJdWFiMFBqR0pBaWxIOTZGa2pJME1xK3czcHRGNy8y?=
 =?utf-8?B?WFdodlVJY2xEQjJSTllDL014QnhFTmhvbnRIajhSTU1DQnhkdzlCdzB4VXk4?=
 =?utf-8?B?MmdJQ2NWdmo4YlhJRDJaQXg5a0o1VlhPZGp6QUw3UVRSMExQdi9kRTZBWlVU?=
 =?utf-8?B?SUdsZ3AvZmxYVjRZOEU1eWROcXUyc3RRSFZ5YkYvVDQxKzJoNk8zQm9BRks2?=
 =?utf-8?B?RTRLSUwzQ3pHdTNZOXRaYmxua2JyRFFVZFRES0tqejNnelplN2VkcXIyMEUr?=
 =?utf-8?B?ejkxS3o5TnQvMjFKeklQYk80VEt4ai9lMGY5YWw4ME53QjRCL1Y4TGF5bmd4?=
 =?utf-8?B?NzFDR3RQdHJJYzBYYkcvZnk1TE5kTG9zMGhyTW4vWWhOLzJyK3hNdUhQVzFV?=
 =?utf-8?B?b0lyY3d1TnlIak5qK3dGRFdwdmducW1sMTNpOXVVdjJrRm1HeVZvTHAvK2l1?=
 =?utf-8?B?S0dNU1RyWkpJWFl2TW5RSkcyZ0h2akYvdmlDbGRjeE1zTTkwSG83NzVlQVZF?=
 =?utf-8?B?WGYzM1NhRktWVG9ORVVCR3dwTFJZNkxMWFFPeURpUW5vL3JmUThJOFE2Nm1D?=
 =?utf-8?B?ZkV1K1JyNnh3TjNaR1cxYllyQ0dXS1lkaUZLU3ZUVUsxYmtFT1FzZER5VzMx?=
 =?utf-8?B?aGVvNlN0bmR2Z3Ztbnl2V0hZOGZKKzBUc3gveitWMVVRSzJLMkdrdXVadzdS?=
 =?utf-8?B?RFdIZEVmUnpxaldsYzJkZXNucGpKV0N3ckdvVFd2QWdsWVBSMW1KTVJGOFd3?=
 =?utf-8?B?dUNoT3VsTkdzV3lSOXl4SDdiUS9EdVBuRis1aG9NdlJlTUsvM1lySGFOaEdM?=
 =?utf-8?B?MC9aTXNydjI0eFd3UWRJUlRxZ1dwYlYvZnFIOC9LczNTelhmb216TGplTmZs?=
 =?utf-8?B?UmJ5bEJJbVlDVXI2VUQ5UmNEQi9RZ3RzdDRGTXJaeVJUWTg2MjM4ak5hVmFD?=
 =?utf-8?B?R08xa0JGK2xwRGpPSDlmWTMydXM4eDRzTDUyUGZ2cXdOdnhnRGpVdG1NaU1X?=
 =?utf-8?B?OVd4a2ZYRXE4MVBxa2QwSmlBN3FyaUZycy84dGFqSE5WOEFpWFE1eStzQTMw?=
 =?utf-8?B?bVZhQ1dOSFhFeVZxMlRSd0V1VDhqZ1BpazRaUDJxYXFJTm1PdVZaeWNBcmNu?=
 =?utf-8?B?ZUk2ZHErNE9HVGplbjZib1BuNmpoejBYMCs2ZTVNbkF0Y3UxdHoxeTRhcXpv?=
 =?utf-8?B?RWJhSVpLbllmQ3JNTCtXOXdBMnpHN1AxbUh4a0lURmtYR1VzZEhKS1B0N1Fo?=
 =?utf-8?B?K0l2TUFnL2FBeGxjRG40NWhybFV2VmsvQ3U2NWlOcHg1YS9hWVdUVnp3RVRh?=
 =?utf-8?B?aWMwdS9RU3k0VEpYcEFWNDZtMHRrelJrQWhqSThzMTcwZER4ZVJsQm9xSXFC?=
 =?utf-8?B?aWd2MkxMbXBnTVpCWThhS3BmbWFldnM0T0lJOGtveS9wQWtaOXBPb1JIdEhu?=
 =?utf-8?B?SzNGK1d0dXlYUE56V3NvQkExb1plTkNGbG4vU3J4MWlHZjhDcWZrUmtrSlAw?=
 =?utf-8?B?ZllYVG56VTVsQkhYSGsyZlJIVVgyMTRUc2pxR0thTk1jbVcya0VRQjJZMFlj?=
 =?utf-8?B?bFNJRThldS96cjNUMmRldCtFVFg0elhyWC8za011cXpranZmUzZKRWwzckdt?=
 =?utf-8?B?MXVvRjNtZGlqRE1ETHA1NUxESEZUVytoeUx3QXZ4RzFJcXp5R1REL2wrNUVa?=
 =?utf-8?B?WG92TWdNY0xNZ1RmdEZkTENVMXQwV0MrbWJYdTdMVVU5R0p2VTRjOEhyak9G?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6e882f-49ce-4bdf-6e50-08ddaa9bbf6d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 17:00:06.5816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OarwJ0ExCopduHmNODI3O2mdwxt2UbvEGhOWeEXTIY/dBoon0f/FYBZ7mnyL5d/1r3HP0zuambFmqcuEN7JSFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF2B8F6C64
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

All,

After about six hours of debugging, I found an issue in a fairly
aggressive test case involving the DRM scheduler function
drm_sched_entity_push_job. The problem is that spsc_queue_push does not
correctly return first on a job push, causing the queue to fail to run
even though it is ready.

I know this sounds a bit insane, but I assure you it’s happening and is
quite reproducible. I'm working off a pull of drm-tip from a few days
ago + some local change to Xe's memory management, with a Kconfig that
has no debug options enabled. I’m not sure if there’s a bug somewhere in
the kernel related to barriers or atomics in the recent drm-tip. That
seems unlikely—but just as unlikely is that this bug has existed for a
while without being triggered until now.

I've verified the hang in several ways: using printks, adding a debugfs
entry to manually kick the DRM scheduler queue when it's stuck (which
gets it unstuck), and replacing the SPSC queue with one guarded by a
spinlock (which completely fixes the issue).

That last point raises a big question: why are we using a convoluted
lockless algorithm here instead of a simple spinlock? This isn't a
critical path—and even if it were, how much performance benefit are we
actually getting from the lockless design? Probably very little.

Any objections to me rewriting this around a spinlock-based design? My
head hurts from chasing this bug, and I feel like this is the best way
forward rather than wasting more time here.

Matt
