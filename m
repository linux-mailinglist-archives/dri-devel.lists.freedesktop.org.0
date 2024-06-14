Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0256690927C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 20:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3A710EE25;
	Fri, 14 Jun 2024 18:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cE2CVv79";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A4C10EE38
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 18:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718390731; x=1749926731;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Nx2MDvnRvJ5UzQ+Qd4FbcfZNQUw+X4H9e7xXTvYv8EY=;
 b=cE2CVv79W2GMrguSE1wXzqImwnwVQ12V6slW3Xbb2Z58JGPqZn9ppFj/
 PlC4xF9YvujZ62qYb5sQVOsnfKwByNXjngD/3wS0KUNnWcDXYAW7lnwrv
 p6UuiStJzeBROcCOqGRzDqMSnoDASmU5c9FwM5fGTirwbuLL7SVdw7bSk
 S8qbMsXcBicVNDMlHUx49k4nj1dFeCTE40RfYFLKkxLFSbfPNWg2XK9wr
 3hvNFKMDAu7yr0VxNUUi21oJsTvvMCw5qngaMqbeSfpWIdcCTBT0m0eNq
 rDvsSHozk+UET8wxjzIb3kIU4bRXN12qV1yiyXFtDaqWYIdlwhmHdisSF A==;
X-CSE-ConnectionGUID: ZTjHqME8RCidzrxU+rg1jQ==
X-CSE-MsgGUID: /52UMNSXSYC88gD0eZ3pFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15169319"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="15169319"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 11:45:29 -0700
X-CSE-ConnectionGUID: SKEYEfQVQMeHpznGspjd9g==
X-CSE-MsgGUID: h0yyIm7HSIO0MQm0XfyZig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40675829"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jun 2024 11:45:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 11:45:28 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 11:45:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 11:45:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 11:45:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzSWVRp2cmZElEexY+eQ7XXdcFDZPVkSD54VCCJfFGiItka84sGAAmp1HO+zfmTImMEjVuO7gwSWyOyiN5Y3VfkzqDQS41QFhk9jOoxbF7IVVq1zz3Teft3h2tsq4dmXAqcCL92wqUKfOsTdqz6tazI3TdT+W1+XsVTj3abJM8nOgX0bOnEIWhGwGuT04IxTwQN/Q0Ny7B04rzqExPjR17kAqyw+S71u7+Crd/IprUbWQWthtOiIcx8pMts9eK76PjcFyMTWcyqywaWIKw3YAK5A6fX25lVWlBVRIGjYA073PCHHpo/nuPuwnlpZuyMmKN0miux+eSkVBYhuE7PKGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JETaTnyiFvE3NfLFVOig0SxcdJf5VhZiiZw7qC6Wh3E=;
 b=IojRIa8iV5R7bhOzak7wTVDjCQBMhxy4NT4do+qAtaOoLP11gfZrxhnZ2nPpeDJmSM5Wi2r9jPJyNVwoiPxeUvaCEzFT7Zc6qLmEWJeWRixINAJmPQeRzPWP1UuQtqQ60N1jpUMmw6tsRYCvhA7nZy46muK5wHey18eLxL/Kgfr20mQ5jRVHamxj09duLkfpn6uNmp9CpOLjpr6Gnbh7zEgJbt9Vza/JbHsnXDrwgt6uSA6ePwr+3XXwveLipyw6QcosqdU6pksQN4yCMMUdngJ9fbYQS0+qh0agOPGCjO9Y+8uKK6n0vDnQLeAlsPhmTEEeoUxO7VVZMGXtNnBpnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB5959.namprd11.prod.outlook.com (2603:10b6:510:1e2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.26; Fri, 14 Jun
 2024 18:45:25 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 18:45:24 +0000
Message-ID: <adedc1ce-6cb5-493b-ba0f-f18cf22f0b28@intel.com>
Date: Fri, 14 Jun 2024 11:45:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/print: Introduce drm_line_printer
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Jani Nikula
 <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <20240528130622.1152-1-michal.wajdeczko@intel.com>
 <1bf31a4b-fede-4044-8390-abb2b833608d@intel.com> <877cfbivrv.fsf@intel.com>
 <146d5133-f3be-4411-b020-a177254a65bc@intel.com>
 <82333a8e-1951-41e0-a08c-9d2abfb480ad@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <82333a8e-1951-41e0-a08c-9d2abfb480ad@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::8) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: c8874bf1-1518-44fb-6f3a-08dc8ca226e1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VE1zN3Rva1FsRzBrcTl1MGNuV2ZwVUIwUytxYldrOGl1RnFYYnptWDNQUlNS?=
 =?utf-8?B?Z29XcGhMMU9jdmhhQ240QUpxZE52cFYwRWRQdWZsbUgxS1h3dmpDTmRlR1RC?=
 =?utf-8?B?OE9SSkllUms1NW1JUENKbTRQZzArcHQ5OGlhOHpRUm1kZ3VWRzRDdm5iUHVT?=
 =?utf-8?B?OVFEZDVGYzlVWFpYYmN6Q2Yzc0JOdzVVa1paVWgxNVk5Y2ptV05jU3MvVWpJ?=
 =?utf-8?B?cHROdXpVVFgvOEFuelp4QnpxTVBUM1hpNk54QW1jbDZzQnlhM3FNelVYWTBF?=
 =?utf-8?B?RFlhRE51bnNEWXAxVXM2MEpicUE1Wmg5TlltWEpVOGhzVEM4OVAvUUF4ZEkx?=
 =?utf-8?B?cHRMeW00d1I4ZnYydnVtdFVET1N3OFdxcWd2dEhlT2JrQUh5ZFQ1VzY0K2Qv?=
 =?utf-8?B?TUpxbFBlZmpsUnR0TWVsTitnYUxHUlZoOHQrZXZ6SWZRNFJ2VG43cFFqVzRp?=
 =?utf-8?B?R2J1azZ0UVFoenRrcDJpZ01JU01xQ1VjMXE4bEswVlhMQnBUcXJsZHpFZmpW?=
 =?utf-8?B?UHVqRG9SZi92S2JPRmV4akxFVjdZSVc3SWZwV2xBRnNiUnNQbEdqTVE0eGJK?=
 =?utf-8?B?cnYzWHFBanFCVnF6R2ZUT0Ezb09LcDY0TmJWeWhNMGZLKy9xdXNYS04xVElP?=
 =?utf-8?B?Nk5jTis4cThvWHRYem1QVlJGQloyR0RRQVlEOE5CbnhTTzE3SzM2b24vZTJv?=
 =?utf-8?B?SzFuS3RLOG9ZNis4WjJZQ1h6ZjhuRHpTL3ZadEJ6QzRRcHdNNWNaZlBNMVhw?=
 =?utf-8?B?RnpVMHBKWjZjajN4ZmdQUjRuMllDYkxIeExFRnFxQlU4NHE0c0lybjhZYllM?=
 =?utf-8?B?ZDF1amYzRjRWSmVwRC9CdVdCL0pXcFNuK0xob0VMSk1IR25yNTZGWExnZVV6?=
 =?utf-8?B?S0ZoNmY5SzBDUzZnVHdaSDZCMVZsMDVyd2pUNzYvWkdMZ3RwVWtwT1V2R0Rz?=
 =?utf-8?B?ZFh2MnhGMFJLWDJnTUNJTXBZcnRMRjVqYkdFOG41NDQ3K3psbXdiVGFqeWlI?=
 =?utf-8?B?N0VYd1pmY2ZodWVwWWluUWV0YWNJajB1WlZvbG9SY1l2d1dVZm8zdlVwSzV5?=
 =?utf-8?B?UHJRVEUyY3BKZGh6TkNOSkE3NVlQejFrZEdqQk1zdVNuSWh4RDdLWFhNTVpx?=
 =?utf-8?B?dEFCZ1JhMFdBRTlacjJNbEdaT0dMMHhTSGZWYk5lQlRxalRaZkdDZks5VFgr?=
 =?utf-8?B?TThzenRSWnNidUFwZ1RkWWlUWUdwMWp3Nlhxcit2bkY0MmJCcmk0L3BlWms5?=
 =?utf-8?B?WEQxNk0wc0VJK3AvK2R6V0g1UTFPTEFrTzBxTWRPRXNRMkxsOGhPNXdnd1NT?=
 =?utf-8?B?OGdQejNLcDF0K0xSTzNRUlA3TDBpVHFtZFJ0TEVUZWVkbkxMM3FTTEVXNWtI?=
 =?utf-8?B?SmJLRVN3akRXT0FmRklWanBSWE82MDlQS0p0QTBVSU91RjZOTlFRblYxOHBO?=
 =?utf-8?B?eWtuUmIyV2txMS9QRHo2Qm9WcDZFMWRhRmRPKzJaRkpFNTFGQ24vZGNBaHUz?=
 =?utf-8?B?UitYTDB3S2ViQnl4RzI4M05TbEprdzIxR1N0Zyt0dTFrY0ROV1hEMk1SYWFo?=
 =?utf-8?B?VWJRMlVFVHRQWjJDVkpvOCtnRkZRdXJvcUhydnpBRDZXYXRsVU1PcVdkRFAr?=
 =?utf-8?B?Vkltc3pSNjQ4bjRZK0ZubjZXM0NMTFRLSGFiWmQzdGxkdC9mN0ZwS2tiRFY5?=
 =?utf-8?B?c0ZLQjJuR2Znclh6ZG4zK3VEZ3FhK2puc1lxWi9yb2t2VUJkVmUvU2JaOFQv?=
 =?utf-8?Q?ug83AXjqYgDu//SGf4O14jsgEs2GlIg91BeKIuF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3pKL1B6YjlNWE5GWkNoRnp4ektkMGFWU2VQMkVsc21UQXNKNlpkRFBOaVFB?=
 =?utf-8?B?aVRPK1F0N1NEdmFXN0Nub0JjSGsybXpuU3IvOEZMUytnbUJtNDNDV2daZjJl?=
 =?utf-8?B?bkloeWRJTjczSDFUeDhvSW1sOHo2WVZVazVhQTNvaGdSMkE4TVRnMjdEYW9m?=
 =?utf-8?B?ajFqUTgzaTJWZEcxRVZvL2JOekoybENpVUh1WEFYMkNxY1ErZ1A0QVE3OHIr?=
 =?utf-8?B?L3pUc3JpZ0JybDhXQmpFcmhrL3hmQk11RGJ0M245WXJWUTVBKzhIYXRyTzNN?=
 =?utf-8?B?eFJYd0wzVkRWTVgyY2hvQUhBbFFlUmZGOUFKaFBrN2xsM3JxeXF6R2lkczRi?=
 =?utf-8?B?cGFGajBMcXR1M2R6aUo0b09jWUxOcjhyeGdXWXFMWVBMVDlwSDlhR1hCZDh0?=
 =?utf-8?B?QVZXZ2dYM0wxUEtzaEp5c2tEb1R3OTJRQ3l3SUh1d3l5WGVTcXpCenFXek9i?=
 =?utf-8?B?THhBK0h6SlNIQ1kxajcxVFhSMVRNa0prcXU4a3JyT2RvMWNZbGRpbnluSkkz?=
 =?utf-8?B?Vm9xMC9oSGYzbC9KeVN4bU1vMmVEc2ltVE4yMi9uT2w3UHZpOWRGUDA0dXZT?=
 =?utf-8?B?TStpenpZd0toSXlIVXhwZE9idnF6N1pDNGVZOGF6WUFiZFZHeDYzTnhlUkta?=
 =?utf-8?B?RFlmVEh4amN0R0ZXNDRxbFJaODUrNXdGYkp3SEh5UURqUXI5UHF0aDZuaExn?=
 =?utf-8?B?VGV1RzlRQXdWelNtUHN4RnQxbCt2aVRjdWNzc3Rqc2hESzllUGZvTTh2U1E5?=
 =?utf-8?B?dTNIbVN2N0NtQVdpKzgrbmZzNWUzWWFEYWw3aUwreXAxRE45K085K2s3enR3?=
 =?utf-8?B?cHpORkNTQVJLL0J4a0REeUw2aHVjbnhzZHluS25meG5vQW1lT09hZXp1RkpK?=
 =?utf-8?B?ZVBLMTFHR1NWVDh0TE1JbUprOE1CaFpUQ1A0WGsrWXlTTTM4T0VJMVhpODZY?=
 =?utf-8?B?RkdEWFpGRjhuRWFTdFpYNUFCZ3UwZ3hUaWZ4L3ZET28ySU9xbGo1cnZwTnlK?=
 =?utf-8?B?b0pNR1BhMHI5bmZmMUtwVGVkYjhLVXVNOU40KzNHNWNObmxDRlo0OWxTNW85?=
 =?utf-8?B?bDRycFM4UGJadzNuVkYxdFM5VFgwSHc3Q0N3L0tETXNDb0g4Ry9aRWQyOW45?=
 =?utf-8?B?ZVVlTmlOWFhBaWdoNG1WcmZSeWtyRldzRnVVd2JSa3lXSitsWHVyMFpnVTM4?=
 =?utf-8?B?OVU4QW9SZjBDNkhla2lnd0VGSFVOOW1QRXRUODd2QTVoR2d4OGZxOTN4YUhM?=
 =?utf-8?B?bTh1a290a2ZKTit1MFd2QmE2U0RadjNwaWtKQ2FVb1UveHJxVGZ1MWtYNlFx?=
 =?utf-8?B?d0RzUUF2d1RoUzdJdUdGZSt4YjQ3MEJPRmswMnc4TVJTMENjKytLMEZXY284?=
 =?utf-8?B?M0dRb1NCdTczQlBKbWtEQUtsL2kzaFplbU1RVHpPUm1ZNklaZjIvMllLMGpL?=
 =?utf-8?B?Zk52TEIrTUovdExYck9tbzNzT1V3YVdaUTh0aHFJNVJjYkhhQnBzdkdSa0xv?=
 =?utf-8?B?QThSUUxXRWZGMFp0c3pCU3dOcXEzaHg2Y3JyT0M1SEVHeXFRTnpiNG8reEtU?=
 =?utf-8?B?bmN4ek1FL1B1NE82eDZnOCtRNENKLzVlZjFmWGo0V2NtRWxoVDhYb0lZeVF1?=
 =?utf-8?B?ZWpQN1BVajZpU3RwcjJ5NTBQa1FaaXBxa0FuaWVhdXI5blZTbmF5Yzl3Qm9l?=
 =?utf-8?B?UTN5bElpdkM1UVhMUUxCV2J4d2lnUXVDV1EwSFdkc3QxRjJuMy9HRGJRUmo2?=
 =?utf-8?B?YWpvVzM2SjE4bUJuSURoK25mTWlxcGdIZWpEcm9UWEpZOWgwMHpHekZ3SnB3?=
 =?utf-8?B?Z3FpNjU0MzJXT2txZ2VpRm1JMkIzYzRNZW9VOG9MQnFqaXdwanI2T2g4RjZi?=
 =?utf-8?B?TDJYZVBrYUkwclphZDNLc1ZWUDdMWTRJRkRrSGd6TGs1ZHg1VXA3dm1yaGJW?=
 =?utf-8?B?SnJGWkFJMFRoZ1czOWV3bXA5dHVwRVRQZnRUUmxyTzhKNlNJeGF3UVB3RWdr?=
 =?utf-8?B?QUY4bzdYbDU3ZXJmTUhLTWhTTUk1T0d3KzhnRFo0TzAxb2ZIaXVqc0JkRU4y?=
 =?utf-8?B?ZWdqTmxWT1VNM1g1M3JRVmxMdFNxeWZIblhFNWZDNDhiOXdSRVNFQWowdnc3?=
 =?utf-8?B?dktEaDA4aHduS2VlY2lJZU5rVTdJT005Y3ZDUGhsSzA0dEd3MXlPbFBpMEsx?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8874bf1-1518-44fb-6f3a-08dc8ca226e1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 18:45:24.6048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4qyUOdysrVQP8WgLggEp+8LHdbZSpPHCqD6qpovVybOSMAyevTom3+JAGjuj0XsK8ioTgCjqmiTtbZqKx7BYyAxJHeseYcCUC3pj3q4STw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5959
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

On 5/30/2024 14:27, Michal Wajdeczko wrote:
> On 30.05.2024 20:47, John Harrison wrote:
>> On 5/30/2024 00:49, Jani Nikula wrote:
>>> On Wed, 29 May 2024, John Harrison <john.c.harrison@intel.com> wrote:
>>>> On 5/28/2024 06:06, Michal Wajdeczko wrote:
>>>>> This drm printer wrapper can be used to increase the robustness of
>>>>> the captured output generated by any other drm_printer to make sure
>>>>> we didn't lost any intermediate lines of the output by adding line
>>>>> numbers to each output line. Helpful for capturing some crash data.
>>>>>
>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>> ---
>>>>> v2: don't abuse prefix, use union instead (Jani)
>>>>>        don't use 'dp' as name, prefer 'p' (Jani)
>>>>>        add support for unique series identifier (John)
>>>>> ---
>>>>>     drivers/gpu/drm/drm_print.c | 14 ++++++++
>>>>>     include/drm/drm_print.h     | 68
>>>>> ++++++++++++++++++++++++++++++++++++-
>>>>>     2 files changed, 81 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
>>>>> index cf2efb44722c..be9cbebff5b3 100644
>>>>> --- a/drivers/gpu/drm/drm_print.c
>>>>> +++ b/drivers/gpu/drm/drm_print.c
>>>>> @@ -214,6 +214,20 @@ void __drm_printfn_err(struct drm_printer *p,
>>>>> struct va_format *vaf)
>>>>>     }
>>>>>     EXPORT_SYMBOL(__drm_printfn_err);
>>>>>     +void __drm_printfn_line(struct drm_printer *p, struct va_format
>>>>> *vaf)
>>>>> +{
>>>>> +    unsigned int counter = ++p->line.counter;
>>>> Wrong units, but see below anyway...
>>>>
>>>>> +    const char *prefix = p->prefix ?: "";
>>>>> +    const char *pad = p->prefix ? " " : "";
>>>>> +
>>>>> +    if (p->line.series)
>>>>> +        drm_printf(p->arg, "%s%s%u.%u: %pV",
>>>>> +               prefix, pad, p->line.series, counter, vaf);
>>>>> +    else
>>>>> +        drm_printf(p->arg, "%s%s%u: %pV", prefix, pad, counter, vaf);
>>>>> +}
>>>>> +EXPORT_SYMBOL(__drm_printfn_line);
>>>>> +
>>>>>     /**
>>>>>      * drm_puts - print a const string to a &drm_printer stream
>>>>>      * @p: the &drm printer
>>>>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>>>>> index 089950ad8681..f4d9b98d7909 100644
>>>>> --- a/include/drm/drm_print.h
>>>>> +++ b/include/drm/drm_print.h
>>>>> @@ -176,7 +176,13 @@ struct drm_printer {
>>>>>         void (*puts)(struct drm_printer *p, const char *str);
>>>>>         void *arg;
>>>>>         const char *prefix;
>>>>> -    enum drm_debug_category category;
>>>>> +    union {
>>>>> +        enum drm_debug_category category;
>>>>> +        struct {
>>>>> +            unsigned short series;
>>>>> +            unsigned short counter;
>>>> Any particular reason for using 'short' rather than 'int'? Short is only
>>>> 16bits right? That might seem huge but a GuC log buffer with 16MB debug
>>>> log (and minimum sizes for the other sections) when dumped via the
>>>> original debugfs hexdump mechanism is 1,245,444 lines. That line count
>>>> goes down a lot when you start using longer lines for the dump, but it
>>>> is still in the tens of thousands of lines.  So limiting to 16 bits is
>>>> an overflow just waiting to happen.
>>>>
>>>>> +        } line;
>>>>> +    };
>>>>>     };
>>>>>        void __drm_printfn_coredump(struct drm_printer *p, struct
>>>>> va_format *vaf);
>>>>> @@ -186,6 +192,7 @@ void __drm_puts_seq_file(struct drm_printer *p,
>>>>> const char *str);
>>>>>     void __drm_printfn_info(struct drm_printer *p, struct va_format
>>>>> *vaf);
>>>>>     void __drm_printfn_dbg(struct drm_printer *p, struct va_format
>>>>> *vaf);
>>>>>     void __drm_printfn_err(struct drm_printer *p, struct va_format
>>>>> *vaf);
>>>>> +void __drm_printfn_line(struct drm_printer *p, struct va_format *vaf);
>>>>>        __printf(2, 3)
>>>>>     void drm_printf(struct drm_printer *p, const char *f, ...);
>>>>> @@ -357,6 +364,65 @@ static inline struct drm_printer
>>>>> drm_err_printer(struct drm_device *drm,
>>>>>         return p;
>>>>>     }
>>>>>     +/**
>>>>> + * drm_line_printer - construct a &drm_printer that prefixes
>>>>> outputs with line numbers
>>>>> + * @p: the &struct drm_printer which actually generates the output
>>>>> + * @prefix: optional output prefix, or NULL for no prefix
>>>>> + * @series: optional unique series identifier, or 0 to omit
>>>>> identifier in the output
>>>>> + *
>>>>> + * This printer can be used to increase the robustness of the
>>>>> captured output
>>>>> + * to make sure we didn't lost any intermediate lines of the
>>>>> output. Helpful
>>>>> + * while capturing some crash data.
>>>>> + *
>>>>> + * Example 1::
>>>>> + *
>>>>> + *    void crash_dump(struct drm_device *drm)
>>>>> + *    {
>>>>> + *        static unsigned short id;
>>>>> + *        struct drm_printer p = drm_err_printer(drm, "crash");
>>>>> + *        struct drm_printer lp = drm_line_printer(&p, "dump", ++id);
>>>> Is there any benefit or other reason to split the prefix across two
>>>> separate printers? It seems like a source of confusion. As in, the code
>>>> will allow a double prefix, there is not much you can do about that
>>>> because losing the prefix from drm_line_printer would mean no prefix at
>>>> all when not using drm_err_printer underneath. But why explicitly split
>>>> the message across both printers in the usage example? This is saying
>>>> that this is the recommended way to use the interface, but with no
>>>> explanation of why the split is required or how the split should be
>>>> done.
>>> You could have a printer, and then add two separate line counted blocks.
>>>
>>>      struct drm_printer p = drm_err_printer(drm, "parent");
>>>      struct drm_printer lp1 = drm_line_printer(&p, "child 1", 0);
>>>
>>>      ...
>>>
>>>      struct drm_printer lp2 = drm_line_printer(&p, "child 2", 0);
>>>
>>>      ...
>>>
>>> p could be defined elsewhere and passed into separate functions which
>>> each have the line printing. The two prefixes can be useful.
>> Except you can't have a multi-level prefix if using the info level
>> printer as that does not take a prefix. And I'm really not seeing a
> but it's up to you which printer you choose as 'primary' printer that
> will render final output
Not really. The choice of printer is dictated by what the code is 
needing to do not by how the developer is feeling on that particular 
day. And this isn't about some random developer's situation, it is about 
making a clear and concise example to show said random developer how 
this feature should be used. And that means not using every possible 
feature simply because it is there even if that usage makes no actual sense.

>
>> reason why you would want the line count to restart in the middle of a
>> single atomic dump operation.
>>
>>>> Also, there is really no specific connection to crashes. The purpose of
>>>> this is for allowing the dumping of multi-line blocks of data. One use
>>>> is for debugging crashes. But there are many debug operations that
>>>> require the same dump and do not involve a crash. And this support is
>>>> certainly not intended to be used on general end-user GPU hangs. For
>>>> those, everything should be part of the devcoredump core file that is
>>>> produced and accessible via sysfs. We absolutely should not be dumping
>>>> huge data blocks in customer release drivers except in very extreme
>>>> circumstances.
>>> A devcoredump implementation could use a drm_printer too?
>> You mean for reading the devcoredump file from sysfs? Except that the
>> whole reason this was started was because Michal absolutely refuses to
>> allow line counted output in a sysfs/debugfs file because "it is
>> unnecessary and breaks the decoding tools".
>>
>>> Is this only about bikeshedding the example? I'm not sure I get the
>>> point here.
>> I would call it getting accurate and understandable documentation.
>>
>> The existing example is splitting what should be an atomic name "crash
>> dump" across two separate line printer objects. That is something that
>> is so unrealistic that it implies there is a required reason to break
>> the prefix up. Documentation that is ambiguous and confusing is
>> potentially worse than no documentation at all.
>>
> all below setups will render the same output.
> which one, in your opinion, shows all potential of the drm_line_printer?
>
> 	struct drm_printer p = drm_err_printer(drm, "AAA BBB");
> 	struct drm_printer lp = drm_line_printer(&p, NULL, id);
>
> 	struct drm_printer p = drm_err_printer(drm, NULL);
> 	struct drm_printer lp = drm_line_printer(&p, "AAA BBB", id);
>
> 	struct drm_printer p = drm_err_printer(drm, "AAA");
> 	struct drm_printer lp = drm_line_printer(&p, "BBB", ++id);
As I keep saying, this isn't about showing every possible permutation of 
the feature. It is about giving a clear and concise example that 
demonstrates typical usage. Further non-typical (but still trivial to 
explain) usage can just be described in a line or two of documentation 
without needing dozens of lines of example code. And given that the 
example is meant to be 'how to use line printer' not 'how to use random 
other printer', the middle of those three seems the clearest to me. 
Although you seem to be missing the ++?

>
>>>>> + *
>>>>> + *        drm_printf(&lp, "foo");
>>>>> + *        drm_printf(&lp, "bar");
>>>>> + *    }
>>>>> + *
>>>>> + * Above code will print into the dmesg something like::
>>>>> + *
>>>>> + *    [ ] 0000:00:00.0: [drm] *ERROR* crash dump 1.1: foo
>>>>> + *    [ ] 0000:00:00.0: [drm] *ERROR* crash dump 1.2: bar
>>>>> + *
>>>>> + * Example 2::
>>>>> + *
>>>>> + *    void line_dump(struct device *dev)
>>>>> + *    {
>>>>> + *        struct drm_printer p = drm_info_printer(dev);
>>>>> + *        struct drm_printer lp = drm_line_printer(&p, NULL, 0);
>>>>> + *
>>>>> + *        drm_printf(&lp, "foo");
>>>>> + *        drm_printf(&lp, "bar");
>>>>> + *    }
>>>>> + *
>>>>> + * Above code will print::
>>>>> + *
>>>>> + *    [ ] 0000:00:00.0: [drm] 1: foo
>>>>> + *    [ ] 0000:00:00.0: [drm] 2: bar
>>>> Not really seeing the point of having two examples listed. The first
>>>> includes all the optional extras, the second is just repeating with no
>>>> new information.
>>> You see how the "series" param behaves?
>> The second example doesn't have a series parameter. If the only purpose
>> is to say "the print of the series value is suppressed if zero" then why
>> not just have that one line? Documentation should also be concise.
> it was already documented in that way:
>
> @series: optional unique series identifier, or 0 to omit identifier in
> the output
Precisely my point. Why do you need sixteen lines of almost totally 
duplicated example when you have one line of perfectly clear and 
unambiguous documentation already?

John.

>
>> John.
>>
>>> BR,
>>> Jani.
>>>
>>>> John.
>>>>
>>>>> + *
>>>>> + * RETURNS:
>>>>> + * The &drm_printer object
>>>>> + */
>>>>> +static inline struct drm_printer drm_line_printer(struct
>>>>> drm_printer *p,
>>>>> +                          const char *prefix,
>>>>> +                          unsigned short series)
>>>>> +{
>>>>> +    struct drm_printer lp = {
>>>>> +        .printfn = __drm_printfn_line,
>>>>> +        .arg = p,
>>>>> +        .prefix = prefix,
>>>>> +        .line = { .series = series, },
>>>>> +    };
>>>>> +    return lp;
>>>>> +}
>>>>> +
>>>>>     /*
>>>>>      * struct device based logging
>>>>>      *

