Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKCdEs+Se2nOGAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 18:03:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27901B297E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 18:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6600710E298;
	Thu, 29 Jan 2026 17:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nVlNMXqb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386AE10E298
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 17:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769706186; x=1801242186;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u3J5gdTcK5Jmly6d9JpaoTMvxkol/RM3+/73FLUEAlM=;
 b=nVlNMXqbT0pdjgSjYkKUlyt1sroY1F52XXdrbZB8Lw1/9c6nGaLsj1kb
 uIjPrMfXQCLbdI6zz7MP0S9lHwcSfCvSspsSSi0axr2hA5N+nuDR2eGRP
 5YNkDRN8eiLByTO7zW8y32w0q51UQE7UiAyIUcwYgyx7X9NNxkqn8raHq
 k8avudUw/cHfzC95musasCUpmPeNOrCao0KqnZKWu8YCutjS7BgXxH7bB
 V267+i3RuDQvsc+9YTWd54+bU2cFk6YDDabnrLAf0NWi11Un83BGZgEa0
 JgCRVd01d1gw53npXqq9Hu4S7F9/Jo6fksLFnaF8p82qVuQTkZoQRS9hO w==;
X-CSE-ConnectionGUID: waWewhbySpCH5psVlJDflg==
X-CSE-MsgGUID: Layi1HQaSeKx67bl24c2PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71005355"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="71005355"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 09:03:06 -0800
X-CSE-ConnectionGUID: +nlHoGCHSMWy0sfhT4RCLg==
X-CSE-MsgGUID: 4fqhtkjrSbaJ7+Bp9tCQxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208537117"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 09:03:05 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 09:03:04 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 09:03:04 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 09:03:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOKLuhrX8azMaMbt/tiHpLMG4JHYd5x0Yq4vyEo7vWPpTm7vgLWNwfVMjnC6w1Djaza6gBWdmzIG2ut5E0eWyo1unRxl5e9ZHug7vZanJUSxzPKnl3y2CXo1ZDhk0FbFzpdBXaIrwov08Ey/sps857G4EAWf4+qEcH/RiqCzPx02rLlUet1kpdGurDOCk/MQaTrO/sIUaE8aXXfB/vDn4MMtcCQcvCBxtCGnVlJ3YgyPm7yk1LKA3ycnKJA5lgdQFbZ/GRWicUIjDH7qGV+8cMOGcTtf6h48L/1h8HsWzg7PQd/pEaQJTIejntAaZHTKUogeTYoQYVRhXPpEmFUNbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzufF/Ca7Rrng0nlPflO9XxRmC6amVypWCDf3fhoz/4=;
 b=L7ilb1dw7EwQ9aGb+1mwKP5khguuldSLW5pfnR0V83cIteGoIoq7eqfalFUFGVI5pxRy94ZV/+SOjUgIFCc0cL0s/HdaCiN7pkd6+W/tl5Lp+/3CLhfju4RgUtiUJeHvZM8g4QfGJrDO/gnqB8KBYbnSvj4cjnvWkxoTD4ava1WqWdgMe1CRA8S9HdNQWfOuP6hlDiWs/tzokHhY8ythYlhyPqLokckdJcS5wBg3dlCURnlpwABKAOZPy9vih/VCBn5UfYfvmcY8aln+MDZN4z1EWt4MeJQPi6DzmzPrO9LvXJy9dMrpbnNedx30rdTu5H+duk/IHq1dVzIZ7JFHnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by SN7PR11MB7114.namprd11.prod.outlook.com (2603:10b6:806:299::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 17:02:59 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::81f7:c6c0:ca43:11c3%3]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 17:02:59 +0000
Message-ID: <e122f276-5d19-4c88-bf41-4a4633ea2c46@intel.com>
Date: Thu, 29 Jan 2026 09:02:58 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: sleep instead of busy wait for BMC
To: Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>
CC: Pasi Vaananen <pvaanane@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20260128-jk-mgag200-fix-bad-udelay-v1-1-db02e04c343d@intel.com>
 <338ff7cf-1c7d-48da-b1b8-37aac440fed0@suse.de>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <338ff7cf-1c7d-48da-b1b8-37aac440fed0@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0055.namprd04.prod.outlook.com
 (2603:10b6:303:6a::30) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|SN7PR11MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: a95f155a-b9b6-4a82-c1aa-08de5f58412b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFBQY0FiQkZ6S1pla3B3OTdsU0JyL3RHcEhheUxmZ3FCQkwrUU5KNzdFSHkx?=
 =?utf-8?B?eWM1bko2TU4zZm40a1hDZFNtakhROWJBV0ZrWDRrSnIwaEhiKy9WMzVqbEQ4?=
 =?utf-8?B?WXhndXliRWtYdFpsUnVBNUpJTTRSTDFpZjVTdHUzbjhGNmxoSVo4b2tsUE5Q?=
 =?utf-8?B?aUY3OEloT1d2UUEzM1FKTFNVamM4czNOcytxeUlvNjlGY0VvanI2T2wwKzEx?=
 =?utf-8?B?c3BkQXpRajI1QzVIRjcvZkI0bmdGVlhoUllObERpYXBIV2F0U2dyOTI3UU9Y?=
 =?utf-8?B?N0J1QmxQOU9IRnRMTjRsb1E1Y1NPQ053a0FmUU5pblVQbmtIUUhwby9kMk13?=
 =?utf-8?B?TjdqWnRxZi9mUlFqWjl5SmxrRHJhMG53VnI5Y2FYcXorSnp2c2lMNDV4ektq?=
 =?utf-8?B?THU3TGRFYVFhMmROcU1zUmt4QVRVaW9hcC84Q3J2SThzTnd0TkRKU3BQd0xQ?=
 =?utf-8?B?cEFJREFGalpPYjVnaHhzZXRucDBUVlpjY01GZnRoRGNkbVd6QWNndlhSbDFP?=
 =?utf-8?B?aWFxc2ZkWVN4c041RjM4MWducmdRb3c3dXU3LzJkZkhTMTE3cExaRlNLZUpp?=
 =?utf-8?B?eFFpb2d0bVpva0FmT3ZVU2QyejYxWWN1ejVhRUs1NVJDdG1VbnJtNUVPTTlw?=
 =?utf-8?B?N1JDZ0Nqd1gzbFhSTDcvQTlQNjRHTkNrT1ZybUhwZjhDQVZDdFZzOUo1RkNM?=
 =?utf-8?B?akJIY0R0YUxQcUpuMTVIa2pqT0JEM0NwVm9rRCtXRG9ZS0R6R2ViQjZwdzVF?=
 =?utf-8?B?eTAyV3JqcC9NaVgvenVjOTcxSnQwbzlvcWU1TW1DeUZZTm1lcFgwdEJ3M3hB?=
 =?utf-8?B?WWhZMTVSUkh4ZEo4Y0dQaHBUdUZUaXJ4djFWVGYzNHZOY1ovMWgzN1lvdVls?=
 =?utf-8?B?YXloSHRYTUIrbjRlZEx3TnRqWkRqeW9zMS9Da29zUUhhL0pQekE0bk9WSHNi?=
 =?utf-8?B?dTdlSis4dXFtZUt6NU5wZmE0bzF3aUM3K21sTWhmMVdtNXJaOURhbllNMzYx?=
 =?utf-8?B?N3VzNWd4YlBlc0NNYzgzSDJiVU9abWg1TUlWQ1dpNWZqdG5HSGlRWmFnUW5J?=
 =?utf-8?B?SUNPYnYxbm1Wd0dZeS9tUGF6NEh1K0JWMUppUXYzVGF1VlQ0djAyeFVJRGNO?=
 =?utf-8?B?ZkJPTVBxZXJDWXF0NUVjamd4N1I3LzFSbUdMR3VPRDdzNk5ZUTVrUW1sRnBj?=
 =?utf-8?B?dEI4bzRodHdBVlZ2WFdRRlZwZ1JqYU5PVzJqc2VlbG9FaUlKSWZ3UDdHOHdT?=
 =?utf-8?B?Q0tNaTVkMS9CZ3FuVVhmVzVkT2pxSXBTR3dCbC80VGFZVmtIcDFjdVBMaUpM?=
 =?utf-8?B?RUdQWkd4TFlTV2pQNWRQWUN4VzZ4RGphT2FESmFvWXcwWXd6MmhnMHBZUUJw?=
 =?utf-8?B?VXNrTENna2dsM1M5WUlkcm5oOTc3SDFERWdiOWE5M0hoenVlUThoeGpTSjRW?=
 =?utf-8?B?V2hheGZ5UW5pQUV6cE1sVnNSaldDelI1aHNtU3d6UUc5WTkxZ3B2UDNvRkgy?=
 =?utf-8?B?RjlZeW81QldJWnRNUHJxVGdhaitGZExFVllibEJpUDE0UkZLRDlKWXloUFNW?=
 =?utf-8?B?MjlHSnQ3YmtScTRTTnZ3cUhsa3IrRENIWC9TYUV3bFhKdDI2QzBOK1M1a3Bo?=
 =?utf-8?B?TitrOUoxcWEwMWdOc29TelJ0MGNCTGFLdkxQbVh1VE54TGkwYnF3aEorWGd5?=
 =?utf-8?B?dU83Yy9ubEprang2cEpmQVpqTyszYUdZRzRBSG1WTkxzMHpCYXhMeW1lcUdv?=
 =?utf-8?B?cEkxOE9LS3Y3czhSRTJyZU54alZ5REJkVkpQSU4yWUoxQWdJU0RDU0M1V20y?=
 =?utf-8?B?czdZYUxYM0V6NXk0MDBhUk5DYlRrdUJYVy9ZOVhYZyt4Ynk3NHVVQUNvWWFT?=
 =?utf-8?B?VzlhUUp3c3dUeVZQaDYzMk5zQlV2NE9zOTZtM0xwRTBrL2xPdDRCNmttVUpk?=
 =?utf-8?B?ZW5KTGdCdVFYZXE0OWxTd29kN29YNDR5U3Fnc3hFOXlFZzhRYis0cVZxR0pB?=
 =?utf-8?B?RG1WdDhaaEJ2VHpxcUtPYisxZks5SXRKaWpNOVRBeFo3Q1ZKcFRjbFhNdzNR?=
 =?utf-8?B?eWVTbEZ3cTZ6YVlHVUFDVmxiKzk2UUZLaEZ4SGJXM052R0FBdXFkenJHS0Rw?=
 =?utf-8?Q?Xthc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGQvU2lrTTFrNm5sYnlyT0d5RjV1dENIUjVnTVZjbWk5ZkFmQng1MmEvSnBv?=
 =?utf-8?B?bGtwc1M2UGVhYUpIUlRxZXFONkhnaXpwNVNnKzFwNEhWMlZMREhKUGxQaGdV?=
 =?utf-8?B?KytNTkI5SFZqTzdSWSt1TFZZdkRZelpMQ3diaGxFc1d6V1JqQ3BaQzY1V3lh?=
 =?utf-8?B?NjczK1k5TEdqT3dPUm1VV0pYNDZtcElDYWRhLzRsTXliN3pEODlmNStlVU45?=
 =?utf-8?B?VS8rQnF4SEVPWWZwL3lRVXkrM1VZUVdINnBlMS84aVQ5ZDc3clM0Y1E5Njhy?=
 =?utf-8?B?Y3g2UUV3NGxzSU1EejlTTGFJbFNBcVl0cGJGcXpTMkFUTVQ0UEFRcmRCcCtk?=
 =?utf-8?B?LzZyOXAxNEx6Zitwd1UwVnVyNGF2MEZJekg5dHFHb05QcHVZdkxHVDV5YzV6?=
 =?utf-8?B?TndzWWNWQlR4NFRzTzFsY0VNNFJ0YzdyZExHUVlzOEYyVkNSaHRKV1ZDQXMz?=
 =?utf-8?B?bDE1eHBpcndpU1p4N0FJMmZXRk5vbEhGa012d21oa2ExdGU2YlRibW1SemVw?=
 =?utf-8?B?U3BLVm5BUGFsaTQrcGZtWjUyTlZ0OG5zRUs2VWZ6bzhQaEhjbFUxNG9YdytO?=
 =?utf-8?B?N1V3Q3BYc2pvQkhHeXQyUHIzdzdSc3RFTmU1cFF4ckkxaGRZRlFnR3ZwbnQz?=
 =?utf-8?B?a0FxSFMzT21xZklLeWFKbUxrSXQrdFhpMExCL0xkRFFNeStzTzZodm5sMjZu?=
 =?utf-8?B?RUowQzkvakMxQmFQdUJDSHJFZ2h6UityN0NWMVVwYkdaL0g1bWRCcjlmQkJl?=
 =?utf-8?B?dUYyNUpVOUw5b3dZOHJnZ2kxWHpQbWdSRUhya1FiRUxQV00rbGVKeDdOMUIx?=
 =?utf-8?B?NFJ1akxIaEJkbHhqS0VvOWFEbXlFdFROVEJ1aFQrLzlNNjAvb0Y4QmpnYVhE?=
 =?utf-8?B?eUxFR2tMUzBCYWhtWVhnKzlFUVpzcTZwMW9IS2VpMVlVRFdmeHVIdGFTaEFC?=
 =?utf-8?B?bnBUUzBySjcwZnh1WXRGSmJqbWE2WFRIVVJ5RWZKcTZnOTc4SVNKQ0tmQUdl?=
 =?utf-8?B?TWJFUURYSWJyckgrVVZJckg3Y1lnaXhzSWRPMUdtM0svWmtxYkR6NFRlK1dJ?=
 =?utf-8?B?M0FXTzY1OWxsZzJ3VmNtclM2VVlPaHNROFNURHpwaW5ienhJY3dXYVJib0Yw?=
 =?utf-8?B?MGJXd21nY3NqNUdIZ0RQcWQ2aWlRRHBlbXY0eHhRSEtZVENPWmRsOFV6MmND?=
 =?utf-8?B?dGJ5bytWSTJUeGIyVWdBOENLSm1MK014R1AwcXhwMGMxelJ1UlFIaHJjaUhl?=
 =?utf-8?B?M3plZHpEeXhiVEJwSGJmWkFobURZODU4QlgzbkpiM1ZmNjBxUk1IMEV3VDUy?=
 =?utf-8?B?Mlc5MGFycXhzTFZDZitIWFl2VDUyZndxbkU5ZFBmYmxOL2RNZGdjSndjMzhF?=
 =?utf-8?B?M05NbkF2QnYwdGxBRnpJSkFmRTRoZkxaZXRYVEt6NVExZCtTK3RKV082NXov?=
 =?utf-8?B?dnE5Vi9ZUzdlMktGVEE2MmVJL1czWFdXSW9NQUtDUlFyM2ZxYWcvalMzUXhr?=
 =?utf-8?B?anpGSnlEV3dKL1ZWa3J5WW5lY254V05QNDYySFZNeURRZW40TU1jNk5WVWZ6?=
 =?utf-8?B?bmkwM2NVODhSNVQzeHFpVkZOTzlUdTZ0Vktwc1hIUFFpckVNeUwrc21YZDg3?=
 =?utf-8?B?cm9PVUh4QjNRWmV3N3kvQzI2S1llWmdlUTlnUHB0VTJmYlk4TzdNZFlydjBs?=
 =?utf-8?B?UE15MHFac1VoUU45Uzg1VlhXbDF4QkhkeUNBQXRRd0tzaEp3NnVaei9lQytB?=
 =?utf-8?B?bkhJUGxTNTFMU2RCTUxWaURWWEd6MFRld2NOTDNQdVZVdEhEMUpOK2JsREJN?=
 =?utf-8?B?elFLOTRlYzVsNml6ZnNGWW00ZExubHV3SitWWGRLOCtvOGhyTXRMazN3Qmpk?=
 =?utf-8?B?YlRkaWxtZGxOQmpwQ3dPKzU1NDZONTlaVkFqTWRUcE5sQzZFdTRubGVCczBv?=
 =?utf-8?B?dHpXSmJabUVHNDRqT1BvbkRvZkxIWGJsa2hjdkUxSFo1RzZIYWdZdmtHcktJ?=
 =?utf-8?B?bVhJdzdxOUhqYjBOc2cxSzJRRnpOLzByRFVEcnI1bW9IZ1lrY1lIUEVUb2RI?=
 =?utf-8?B?bDJsOWFxZVB3S2crWnkwOFE0Mmhwcmw1b3JiNjU4QU5TRWxMR0t0VVA4cWkr?=
 =?utf-8?B?Zzk4Z3BBZTlYRW9XK0x6c1lnLzUrTW5IV1l3eGZ2ZXdNMnovT3V3eXI5N1Rk?=
 =?utf-8?B?RXRhdU83L2M2OWk1MG5oTzl5SlNyWHlhMmJKcUlzUWZvU3dzVWpNYTlHTFU3?=
 =?utf-8?B?ckRrR1dqVk4rTGVwQkhIejRXdHRFbXVsUjI3aXNiQ3dCcnJaaU54ZUhLeTdw?=
 =?utf-8?B?N291eGUrOEVnWGo5bXpTaW1hVzNTT3h4b1YvY3lFWnN4elNWOFlaN3ExVStW?=
 =?utf-8?Q?Zw7crFjr2w2fqk4Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a95f155a-b9b6-4a82-c1aa-08de5f58412b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 17:02:58.9996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8a2ZawXMb945KAT47m+iAF/3UzlR7hMKE90YaAnWEcq48rl8veI4XmGsRfiwx76NJoVaDkT8atHynRCIzSFel8gdlkUPxCB6MVecB07qqGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7114
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jacob.e.keller@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:airlied@redhat.com,m:jfalempe@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:pvaanane@redhat.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacob.e.keller@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 27901B297E
X-Rspamd-Action: no action



On 1/29/2026 12:15 AM, Thomas Zimmermann wrote:
> Hi,
> 
> thanks for the patch. If I'm not mistaken, you have fixed a long- 
> standing bug. See my comments below.
> 
> Please double check my comments and, if valid, integrate them into the 
> commit description.
> 
> Am 28.01.26 um 21:41 schrieb Jacob Keller:
>> The mgag200_bmc_stop_scanout() function is called by 
>> the .atomic_disable()
>> handler for the MGA G200 VGA BMC encoder. This function performs a few
>> register writes to inform the BMC of an upcoming mode change, and then
>> polls to wait until the BMC actually stops.
>>
>> The polling is implemented using a busy loop with udelay() and an 
>> iteration
>> timeout of 300, resulting in the function blocking for 300 milliseconds.
>>
>> The function gets called ultimately by the output_poll_execute work 
>> thread
>> for the DRM output change polling thread of the mgag200 driver:
>>
>> kworker/0:0-mm_    3528 [000]  4555.315364:
>>          ffffffffaa0e25b3 delay_halt.part.0+0x33
>>          ffffffffc03f6188 mgag200_bmc_stop_scanout+0x178
>>          ffffffffc087ae7a disable_outputs+0x12a
>>          ffffffffc087c12a drm_atomic_helper_commit_tail+0x1a
>>          ffffffffc03fa7b6 
>> mgag200_mode_config_helper_atomic_commit_tail+0x26
>>          ffffffffc087c9c1 commit_tail+0x91
>>          ffffffffc087d51b drm_atomic_helper_commit+0x11b
>>          ffffffffc0509694 drm_atomic_commit+0xa4
>>          ffffffffc05105e8 drm_client_modeset_commit_atomic+0x1e8
>>          ffffffffc0510ce6 drm_client_modeset_commit_locked+0x56
>>          ffffffffc0510e24 drm_client_modeset_commit+0x24
>>          ffffffffc088a743 
>> __drm_fb_helper_restore_fbdev_mode_unlocked+0x93
>>          ffffffffc088a683 drm_fb_helper_hotplug_event+0xe3
>>          ffffffffc050f8aa drm_client_dev_hotplug+0x9a
>>          ffffffffc088555a output_poll_execute+0x29a
>>          ffffffffa9b35924 process_one_work+0x194
>>          ffffffffa9b364ee worker_thread+0x2fe
>>          ffffffffa9b3ecad kthread+0xdd
>>          ffffffffa9a08549 ret_from_fork+0x29
>>
>> On a server running ptp4l with the mgag200 driver loaded, we found that
>> ptp4l would sometimes get blocked from execution because of this busy
>> waiting loop.
>>
>> Every so often, approximately once every 20 minutes though with large
>> variance, the output_poll_execute() thread would detect some sort of 
>> change
>> that required performing a hotplug event which results in attempting to
>> stop the BMC scanout, resulting in a 300msec delay on one CPU.
>>
>> On this system, ptp4l was pinned to a single CPU. When the
>> output_poll_execute() thread ran on that CPU, it blocked ptp4l from
>> executing for its 300millisecond duration.
>>
>> This resulted in PTP service disruptions such as failure to send a SYNC
>> message on time, failure to handle ANNOUNCE messages on time, and clock
>> check warnings from the application. All of this despite the application
>> being configured with FIFO_RT and a higher priority than the background
>> workqueue tasks. (However, note that the kernel did not use
>> CONFIG_PREEMPT...)
>>
>> It is unclear if the event is due to a faulty VGA connection, another 
>> bug,
>> or actual events causing a change in the connection. At least on the 
>> system
>> under test it is not a one-time event and consistently causes 
>> disruption to
>> the time sensitive applications.
> 
> I'm not surprised. The drivers for some of the server chipsets have been 
> imported from old Xorg's user-space code, so that there's something to 
> work with in the kernel. We've since been fixing them to better 
> integrate with the kernel.
> 
> Not busy waiting for the BMC is also a little improvement to any other 
> workload.
> 

Right.

>>
>> Reading through other DRM driver implementations, it does not appear that
>> the .atomic_enable or .atomic_disable handlers need to delay instead of
>> sleep. For example, the ast_astdp_encoder_helper_atomic_disable() 
>> function
>> calls ast_dp_set_phy_sleep() which uses msleep(). The "atomic" in the 
>> name
>> is referring to the atomic modesetting support, which is the support to
>> enable atomic configuration from userspace, and not to the "atomic 
>> context"
>> of the kernel.
> 
> Yes. "Atomic" means "apply all changes to hardware, or none".
> 
>>
>> Replace the busy wait with a sleeping loop based on read_poll_timeout().
>> This ensures that other time sensitive operations are not blocked from
>> executing while the work thread is waiting for the BMC hardware.
>>
>> Note the RREG_DAC is implemented using a statement expression to allow
>> working properly with the read_poll_timeout family of functions. The 
>> other
>> RREG_<TYPE> macros ought to be cleaned up to have better semantics, and
>> several places in the mgag200 driver could make use of RREG_DAC or 
>> similar
>> RREG_* macros should likely be cleaned up for better semantics as 
>> well, but
>> that task has been left as a future cleanup for a non-bugfix.
>>
>> Fixes: 414c45310625 ("mgag200: initial g200se driver (v2)")
>> Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
>> ---
>> We still do not know if the reconfiguration is caused by a different
>> bug or by a faulty VGA connector or something else. However, there is no
>> reason that this function should be spinning instead of sleeping while
>> waiting for the BMC scan to stop.
>>
>> It is known that removing the mgag200 module avoids the issue. It is also
>> likely that use of CONFIG_PREEMPT (or CONFIG_PREEMPT_RT) could allow the
>> high priority process to preempt the kernel thread even while it is
>> delaying. However, it is better to let the process sleep() so that other
>> tasks can execute even if these steps are not taken.
>>
>> There are multiple other udelay() which likely could safely be 
>> converted to
>> usleep_range(). However they are all short, and I felt that the smallest
>> targeted fix made the most sense. They could perhaps be cleaned up in a
>> non-fix commit or series along with other improvements like fixing the
>> other RREG_* macros.
>> ---
>>   drivers/gpu/drm/mgag200/mgag200_drv.h |  6 ++++++
>>   drivers/gpu/drm/mgag200/mgag200_bmc.c | 27 ++++++++++-----------------
>>   2 files changed, 16 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/ 
>> mgag200/mgag200_drv.h
>> index f4bf40cd7c88..a875c4bf8cbe 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
>> @@ -111,6 +111,12 @@
>>   #define DAC_INDEX 0x3c00
>>   #define DAC_DATA 0x3c0a
>> +#define RREG_DAC(reg)                        \
>> +    ({                            \
>> +        WREG8(DAC_INDEX, reg);                \
>> +        RREG8(DAC_DATA);                \
>> +    })                            \
>> +
>>   #define WREG_DAC(reg, v)                    \
>>       do {                            \
>>           WREG8(DAC_INDEX, reg);                \
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c b/drivers/gpu/drm/ 
>> mgag200/mgag200_bmc.c
>> index a689c71ff165..599b710bab9b 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_bmc.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_bmc.c
>> @@ -1,6 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   #include <linux/delay.h>
>> +#include <linux/iopoll.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_edid.h>
>> @@ -12,7 +13,7 @@
>>   void mgag200_bmc_stop_scanout(struct mga_device *mdev)
>>   {
>>       u8 tmp;
>> -    int iter_max;
>> +    int ret;
>>       /*
>>        * 1 - The first step is to inform the BMC of an upcoming mode
>> @@ -44,28 +45,20 @@ void mgag200_bmc_stop_scanout(struct mga_device 
>> *mdev)
>>        * 3a- The third step is to verify if there is an active scan.
>>        * We are waiting for a 0 on remhsyncsts <XSPAREREG<0>).
>>        */
> 
> Either these comments or the original test seems incorrect.
> 
> The test below is supposed to detect whether the BMC is scanning out 
> from the framebuffer. While it reads a horizontal scanline the bit 
> should be 0. That's what the test is for, but it gets the condition wrong.
> 

Ahh... You're right, I didn't read the change carefully enough.

>> -    iter_max = 300;
>> -    while (!(tmp & 0x1) && iter_max) {
>> -        WREG8(DAC_INDEX, MGA1064_SPAREREG);
>> -        tmp = RREG8(DAC_DATA);
>> -        udelay(1000);
>> -        iter_max--;
>> -    }
>> +    ret = read_poll_timeout(RREG_DAC, tmp, !(tmp & 0x1),
>> +                1000, 300000, false,
>> +                MGA1064_SPAREREG);
> 
> The original while loop ran as long as "!(tmp & 0x1)".  And now the test 
> stops if "!(tmp & 0x1)" AFAICT.  This (accidentally?) fixes the test and 
> makes the comment correct.
> 

Right, but that changes the functionality. I'd need to know whether that 
swap is actually correct.

> 
>> +    if (ret == -ETIMEDOUT)
>> +        return;
>>       /*
>>        * 3b- This step occurs only if the remove is actually
> 
> Since you're at it, maybe fix this comment to say
> 
> '... only if the remote BMC is ...'
> 
>>        * scanning. We are waiting for the end of the frame which is
>>        * a 1 on remvsyncsts (XSPAREREG<1>)
>>        */
>> -    if (iter_max) {
>> -        iter_max = 300;
>> -        while ((tmp & 0x2) && iter_max) {
>> -            WREG8(DAC_INDEX, MGA1064_SPAREREG);
>> -            tmp = RREG8(DAC_DATA);
>> -            udelay(1000);
>> -            iter_max--;
>> -        }
>> -    }
>> +    (void)read_poll_timeout(RREG_DAC, tmp, (tmp & 0x2),
>> +                1000, 300000, false,
>> +                MGA1064_SPAREREG);
> 
> Again, the comment and original code disagree and the original test 
> condition appears to be inverted. It whats to test of the BMC has 
> finished scanning out the final frame. The bit should turn 1. Instead it 
> tests if the bit is already 1, which is likely true. Hence that's 
> probably where your 300 msec delays comes from.

Either that or the first case was checking for a 0, and looping the 
entire time because it was already 0.

I'll need to double check which is true and make a v2. I'd be more 
comfortable keeping the logic identical, which is my mistake on not 
inverting the condition with the change to read_poll_timeout...

> 
> Best regards
> Thomas
> 

Thanks for the careful review.

>>   }
>>   void mgag200_bmc_start_scanout(struct mga_device *mdev)
>>
>> ---
>> base-commit: e535c23513c63f02f67e3e09e0787907029efeaf
>> change-id: 20260127-jk-mgag200-fix-bad-udelay-409133777e3a
>>
>> Best regards,
>> -- 
>> Jacob Keller <jacob.e.keller@intel.com>
>>
> 

