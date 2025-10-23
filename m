Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA5EC02DBA
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 20:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9479610E941;
	Thu, 23 Oct 2025 18:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KeHZXZ6C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B319110E940;
 Thu, 23 Oct 2025 18:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761243003; x=1792779003;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ts2+NP2lIcCgn25bXLs6HhkhAdE6z9X/RuWpgEMwLb0=;
 b=KeHZXZ6CIreuQynNMdZxGgPDM2u27ZEHfTXEFgTI65v+s+8YKFBDkRIb
 ZSqdtqQ+X5Qsy7DXwNbzSg023UZkzbYRqcagsxGR4Un4Ej6q953Tv4hdH
 yz1rGmClJIoH0nNkyN3PUCudkrwYRpFq8iQgGu3nwusOI9tflOetRgEtW
 8141nvaypDc5bH8hHPzSWSxj3WtG4S/C73HdzxRUXyWNsEfzzqTDohTsK
 7LU/WYH8ypXwVO7mjJEjaL3qUcYNNxG2vY55CPIK4QzgRA/tYlHZm7AZ1
 OtC1Aqbnn82gRQhXStOq6VHloS326ITAhLwBYmdMBn7b6/WWJM47lom2j A==;
X-CSE-ConnectionGUID: +hKsSJ94Q0G0sF39hUT0NA==
X-CSE-MsgGUID: t6JTcFBwSxSHa3/EtJwY4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63329533"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="63329533"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 11:10:02 -0700
X-CSE-ConnectionGUID: 9SHzx8dFSjOrpmL81wCXXw==
X-CSE-MsgGUID: 1uCAbse7RXWr/wk0bKRVBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="184151933"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 11:10:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 11:10:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 11:10:01 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 11:10:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmcZHeci/ZFZo8bWVvSXMcuPwWessk7XJ2wXjjnN54R80E/dY+0tJ7pV0iiXuP5eUdALgr8GIXpyhFHRSaOneWLCLVgOH/ZANveShXj6mZUFiqXx8LU+fW0siEOgIfaEDx7EpDOWJ4VqvBwxgjcLtgtsYv1X8Vowxx5uSvdObIs1qvL1SKCVcYqRP/sjuS+hqE1SQmweKjwv65ujiAnv4NqNENT27ZAKmbCVn+wk5Eui/j1h7Y6WoTHKu2M1GJoRwsw1WIY/64R0auAsVmaNC4P5OiIPz2HbHZGgL9yDECUOfdmN6Bydr8RiWMg1uYOvyLcNqJENfQGRfeGYl9m4FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNpn9xuz3B3BUM8UnFfuZLnnRZdhdus2Zsg1otZy1lM=;
 b=UuY3BNIeGMjxPQt4Cp2ArE5lOU6BHkurOw7M+bOA/a4j3lvM8Xad/LtKwmjwgKKvd0LqL7pyoMe/fSfwsLX+oMvnnzz0Vt1q5CzIigdXQ1Zt/RVfeOIADsS6is1BsVHPUOmCwRlTLmGJtv5SsyDTT3wZb5sqS68ufD0cJISzwgE+YLzE9/HsP1OiI7UJnGaRBSBwl2NKfY9/uxeuCPie4402Q5H9nuGgWvEgby9gOAnEzIxUfWr3YNXVF+TPibhcyASR81DSbhppX8mHpiJejMKZUNRwCjz8vEQrnQbSNiu4ClSgSfwCIwf6rFbyKFfvwZSZM0/7t8T1jQp6ZjlRpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7511.namprd11.prod.outlook.com (2603:10b6:806:347::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 18:09:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 18:09:59 +0000
Date: Thu, 23 Oct 2025 11:09:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: <phasta@mailbox.org>, <alexdeucher@gmail.com>, <simona.vetter@ffwll.ch>,
 <tursulin@ursulin.net>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 05/15] dma-buf: inline spinlock for fence protection
Message-ID: <aPpvdINe59gYfr2v@lstrano-desk.jf.intel.com>
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <20251013143502.1655-6-christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251013143502.1655-6-christian.koenig@amd.com>
X-ClientProxiedBy: MW4PR04CA0253.namprd04.prod.outlook.com
 (2603:10b6:303:88::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: fd87130a-072c-4b71-2ba0-08de125f6120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUR2T011aksvTUg3SWR5c3V3VGRRY09KbWM0SkkzOU9zQzdBbHdCRjB0dENv?=
 =?utf-8?B?N0t4elpRUVY1S21VNElrZ3NyYUg1THpEdU1ZdFBpTS9vRllGblB6SEJKLzZ1?=
 =?utf-8?B?VjZiOXZCQmNKMEo2L2l4MHV5K0ljRDFwbVpQSno5eCtzckZqQUdxblZmbVMy?=
 =?utf-8?B?WGJka3V5dDJTMmNRMmx5MGl5Nk5oZUl0OThpWkQxcjQvTlgzKyt4M0g2eGZt?=
 =?utf-8?B?N3BRNFkrbHo2V1hUbjUvc0dXaS9UNTdmZ3NTREZaMHlTTUxoa2ovU2FXU3Jl?=
 =?utf-8?B?RTM0MVpYZlY3UEExcTE0cXhRWVFWbmpaZU9HbllQcGFSZ1AxT2ZtNHpicVJi?=
 =?utf-8?B?bkRoeXgrVUxSamdqTVhLSmxDUkZwRVN4MnpmcWZLUzZVaU9sbmNteGsvYy9n?=
 =?utf-8?B?UVZxL1A5dXM3cncxRm1UNmhaaHJNY0c0NmlDdFhrc3B6cjhQMjh1STlycU9W?=
 =?utf-8?B?cnVuRXROVk5nM3FFdzFpWWtMK2l0TFh4T2RFZmF5amVNb2NPditBRzZXZ1hr?=
 =?utf-8?B?N1BUUStaUGorbU9WTiszRjZHSnc2cDRrZDZQa0ZiREdWekNjdUR6aVRLekF0?=
 =?utf-8?B?WFlTaFozYlZQaGVHMGNoQlNyZVpMUEVxbk1HSzVJRm1XVVNZR1cvWFJOaCtU?=
 =?utf-8?B?bUJXaGgxaURtZk9ZaTVBL0svcVBjVGxHL082bG1DMGtvRDhvNytjK3AwMU8z?=
 =?utf-8?B?WnJxbFNQUDA3dE9lK3IxZzRIZ1dvWHUrNmJWNWVpYWpIUExTclFTZEZhUVRC?=
 =?utf-8?B?M05GNlVuZlVndmFoUVViUEgwRlV5NXBvSXRwNDh0ZmNmUWdLMFVnVUZCSy9V?=
 =?utf-8?B?Z0lPRjBVcTNqM1hwYTJtMzNjSlMreWxMNHhiVmV0ZVhSazNSeElxVHBOOE9a?=
 =?utf-8?B?TWl5RVBxKzlkV0FaenF0ZDIyUkVucjhCSEV4SWkveUszUC9ZOFhYbDc4NFFH?=
 =?utf-8?B?RjZ0cXhpVGsvc0ZxL0NTU1ZGQzI0SlFnalNCUFBBR0RudE5kbzBPQW1hNUFV?=
 =?utf-8?B?bEZYc3NYa3Vzd05GbVpEWnJkZncrTVBVVExGK2tiR1RtdVNTNGUvQWx6Zk52?=
 =?utf-8?B?VVFxMHcxdGJLRnp0NUkxVEFBbVZITTZveGxRcUY1UXZjVmptYkFGeUlxTzJY?=
 =?utf-8?B?dTQ3SnhYakh6a3FNVEg0U1ZubnJCRktvbGg2RjNDekQveTQ0bGpGZm9ZeUN0?=
 =?utf-8?B?TFVaeitJcUkwb2NmTzJMVTZmT2I1K0JEQ3BWOXJuNEpsSE9WYW5DV2dwend4?=
 =?utf-8?B?MXJLMk0yU2FFeWI2MS92cEpXd0xmSHhMZ0JoZWJmTmRoZTBuL0tQdkk4YUdq?=
 =?utf-8?B?TVZRLzdPZTNlaUpkaEZxU2RjNlV3eVlPMTdEQTRzTWdUKy9JRDlHZlg0RmYy?=
 =?utf-8?B?a3ZoN1dsQU90MnFhS09qL2RjMjI3NFRVNkpsaXN1NzdnU3NuTTNQYmY5MVJ4?=
 =?utf-8?B?SDgrZzVYOXpqSSsxTVYxdCtTYzFweGNZV3k0RXpCcXI1N3RBa2RQc2VCRms0?=
 =?utf-8?B?andNK0EwV3NGSGh5MkNwTEJwWVhkMGhoYU13VFgyR0JDczZIbzBkbmlYaHVn?=
 =?utf-8?B?SW5kU2tBTlZ4QVJZaUYrL3VEYmtlWG5xQTd1dmVGdVhJSi9SM1RvcnJhRTJY?=
 =?utf-8?B?a20xOG5QSExZQzEwM2NXay91SjBtSHQ4UkdjU3NVd2doVHFBVWMxYkJoWmxI?=
 =?utf-8?B?VDF3aU1tK04zSWppd3lPZVlhTVM5bkVjM1NUNWhHTVRtVXpaQjBLM0ZsWUky?=
 =?utf-8?B?RUJKQ3Q1TmtPKzBVWXJoeGZGTCtzSGNXZ0puUUdjblhieXUzdE9xZzdyNTFy?=
 =?utf-8?B?dndBbktDMW1XYVVmaFdEdXFxR2ZkUDVZT05xSjQxYVRNa2IrakdkWjAzODFD?=
 =?utf-8?B?MGZYQjl4NEM2aDRtZERYMWliRTlyeGhNM1dyZERLWWlNQ0h6ZTFJa2pNUk93?=
 =?utf-8?Q?lBXKViURv4ah4VRV86OAaFWV1RDQx+2d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTBLM2g0MGcvUUZjR0dPR051OFM5MVlOaVNZbE1oN3JyMDhaOEJyYnpUUzRD?=
 =?utf-8?B?elhkYnUwRFdrNGRVMjlSZW9BVGYwcElhNXNoYmROdFZJL01jMjY2b3hyY2dZ?=
 =?utf-8?B?UXVLWjhWOFp1OE51Q3FBL0hMZFg1dmw4Rm45ZWE0QTYralRMTjkvT1ZRVWJu?=
 =?utf-8?B?L0VQT0dPY21GKzBhdG5IVWppM3B2ckFmU3dPekFra2h5NUpadDlJbkxoOW9Q?=
 =?utf-8?B?K0x2bFhWNWlaSEM5Tmh1MEU5RitqejIwdGZVSXJaYjdEMHFKWU5MdzNZOUs0?=
 =?utf-8?B?Y1BDVGFsb1FjVitPTjREMVdLSnZtN2dtVEM1ZGtoVmxDU2RyZEtyTjkxTXdO?=
 =?utf-8?B?LzQ4eGpDNEhSM292Z1U5dk5KbkM0cVo1bW9PSWhpR3h6VnlSclZsakdhc0pj?=
 =?utf-8?B?R3Q1dFhLT2pLdmxaUEF2aHlBazdCUzJ2bm9oWTJ1TnNFdm5IYS9SMEFoODNS?=
 =?utf-8?B?YlZQdHIrQmRTWm9OKytMZThJNUpQWDlCUHNENW1hK2JPRVRpYUJXVkp6N1JE?=
 =?utf-8?B?clNKd1ZNS0JrWU4xclVmK3h0cG51VXNKUkgwU1YwMEJpd3ozVGRlYWluRDd2?=
 =?utf-8?B?SEVvQU9jKzZCdW0yUW5xVWtMVFVRby8xY1FIUzNOK1J0SXY1c1pna1JvR1VU?=
 =?utf-8?B?SGtIbXVpblZLVHZ0aXVXb1dZQ284YTRzcFpQMEJEbjN4ZmVrYk5SenZDcGlR?=
 =?utf-8?B?YmhqbGpZK0ZORFFhNGdpelM4Z2UxMmdpbUxTTHQwOE9NUVN3NTZWdzk1ZERU?=
 =?utf-8?B?ekZPRHFJem9Uc2JMSndxYWxXMitWclp5aWR0ZTFkaTR1TUVNRHdJQWhwemxv?=
 =?utf-8?B?V2ttNEdHQ0Vld3gwaXlHaTZ3NERBeUdTSWdDT1BZbHdTdkZ0b0JaZFJDQWdY?=
 =?utf-8?B?enU1ZGZIMTBJMFd0M28rOUFhRnZKSHBKV01DclpSN1ViOG9wVHB0Y2hOeGdt?=
 =?utf-8?B?UzZnWW9pdk1uN3puUTBqZUJDeGJMZmJuQjYvSEcwOVVHR3lxS1hROWFUVWVs?=
 =?utf-8?B?NUpMSVN1Ymp2QU1yT1hMeVNEQmpqUXlWTkhvL1lGZ3VQUW1WK2EycXI1Tjl4?=
 =?utf-8?B?b0hVMEpQU29WWHJmUUNhL2grWmh5SUJ1ejJacmM4TklDREtab0NTNC9TZU1l?=
 =?utf-8?B?SGE0eW1EYURyTUl2UVJOSTdYeFVHMGR1SGZrbHpFYlR4cVFuNGdrRmpaZ2Z5?=
 =?utf-8?B?MXpmQTBzUXYya3NWbXQ4cWg0WlZPMVVnSUdyaExoMDE3bXJIOERxU1hwVmFP?=
 =?utf-8?B?dkp1STk2K2MwaUpJbnY1N1BUWm1CRXV4TmgvaFlIVS9nUFloNzRrNTVuUmgw?=
 =?utf-8?B?bkJKdjdtMTJKbzRPVExUOVo1MFVRU0tSYTBIK3B0c245em1tODRsYzdQc21P?=
 =?utf-8?B?elRrRFduTTl0QkNQUlZaYVgxTzh6RjN3R0V5ZnFWNHVYTXFGcTIxbEovakpY?=
 =?utf-8?B?aXVwQk9iVEczdXBrU2IwUXIwVFIrUlVPU2dtT0ZUajhBTVByYzJrN3ZoVFpB?=
 =?utf-8?B?NUtIVHdEalBkc0t6YzJwbzZsQ29XQlBjSDBRRDlRYituNmZPS0ZYa0w3dnRD?=
 =?utf-8?B?NFNqazdVSENzSmQ2RXFRbFNmMDlUc3ZNQmJqeW1mSzBtd3REWlZ0eGpKUkRk?=
 =?utf-8?B?VnV2NDV1UXRIeXRNVTU3NEo3V09pYUJYcjNHamk0SnlRR0lLd1RZdU9xWjFN?=
 =?utf-8?B?REZVMnpDMjVzZjN6bGtvcE80RVJCKzVVZUJHaUZJYjlIOEYzL3B4d2NRbTNM?=
 =?utf-8?B?WXNyeDk4eUs3YmxLaTFzNU9VRjVkMkk1Vjk1OEoyRCtIdFBlVy9lQm9zVWZL?=
 =?utf-8?B?ZVJpTSt5Ym1mc1JWYzBLYjFFVHQ0ODliU1BXMFptYlU5VzdWaUo3cmJqV2p3?=
 =?utf-8?B?cWNYc3l3R2lEZFAvUWxVS2lyUXZnU3RoQUVmSmVkd1VxcFVJb25uU3hISktO?=
 =?utf-8?B?YkJLT2xiM3cwdXJOMzB5MitPVTlDT09ZSUNBRGRQS2hZWjBvMkpXMTZsRzhU?=
 =?utf-8?B?TXpmZ1hIaFpwMlRLc2ZLNGFTR1Q0OFpDOVc4V1RFRmc0dW4wdnFqMjhtSWtH?=
 =?utf-8?B?OEF6TTQzeFFmRjVmdTBlcFozNmtDbkJYQlRxTE1nSzY0WkdiWkJYUXV4dERp?=
 =?utf-8?B?V055L2tlVEl1OTV2UExyZFQzYUpqWTg2a1d1ZHNVOEVUYjlWOHZPRnd1YjJM?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd87130a-072c-4b71-2ba0-08de125f6120
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 18:09:59.5740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lLnlBcXjnR1Px6JyeS3sryviNIcJMszrWLjgSZn6NpKLHLqeNUonXf3HV53ZmhmmwpEtCOuwj+bDUU2rwur7lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7511
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

On Mon, Oct 13, 2025 at 03:48:32PM +0200, Christian König wrote:
> Allow implementations to not give a spinlock to protect the fence
> internal state, instead a spinlock embedded into the fence structure
> itself is used in this case.
> 
> Apart from simplifying the handling for containers and the stub fence
> this has the advantage of allowing implementations to issue fences
> without caring about theit spinlock lifetime.
> 
> That in turn is necessary for independent fences who outlive the module
> who originally issued them.
> 

One thing Xe really wants to do is use a shared lock for HW fences,
since our IRQ handler walks the pending fence list under the shared lock
and signals the fences. I don’t think it would be desirable to split
this into an IRQ handler list lock and individual fence locks.

It would be great if we could come up with a way to support this model,
ensure it's safe for module unload, and document it clearly.

I’ve thought of a few possible ideas:

- After a fence signals, the dma-fence core should not be allowed to touch
  the external lock.
- Only export HW fences to the DRM scheduler, which guarantees that after
  HW signaling, it won’t perform any dangerous operations (e.g., making a
  call that takes the external lock). This really isn't generic solution
  though.
- Create an embedded dma-fence spinlock structure with a refcount and a
  dma-fence flag indicating that the external lock is refcounted. In
  dma_fence_free, drop the lock’s refcount.

In all of the above cases, the rule is that all module fences must be
signaled before unloading.

Thoughts?

Matt

> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence.c              | 54 ++++++++++++------------
>  drivers/dma-buf/sw_sync.c                | 14 +++---
>  drivers/dma-buf/sync_debug.h             |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c |  4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   |  4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h   | 12 +++---
>  drivers/gpu/drm/drm_crtc.c               |  2 +-
>  drivers/gpu/drm/drm_writeback.c          |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c    |  5 ++-
>  drivers/gpu/drm/nouveau/nouveau_fence.c  |  3 +-
>  drivers/gpu/drm/qxl/qxl_release.c        |  3 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_fence.c    |  3 +-
>  drivers/gpu/drm/xe/xe_hw_fence.c         |  3 +-
>  drivers/gpu/drm/xe/xe_sched_job.c        |  4 +-
>  include/linux/dma-fence.h                | 42 +++++++++++++++++-
>  15 files changed, 99 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 39f73edf3a33..a0b328fdd90d 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -343,7 +343,6 @@ void __dma_fence_might_wait(void)
>  }
>  #endif
>  
> -
>  /**
>   * dma_fence_signal_timestamp_locked - signal completion of a fence
>   * @fence: the fence to signal
> @@ -368,7 +367,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>  	struct dma_fence_cb *cur, *tmp;
>  	struct list_head cb_list;
>  
> -	lockdep_assert_held(fence->lock);
> +	lockdep_assert_held(dma_fence_spinlock(fence));
>  
>  	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>  				      &fence->flags)))
> @@ -421,9 +420,9 @@ int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp)
>  	if (WARN_ON(!fence))
>  		return -EINVAL;
>  
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock(fence, flags);
>  	ret = dma_fence_signal_timestamp_locked(fence, timestamp);
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock(fence, flags);
>  
>  	return ret;
>  }
> @@ -475,9 +474,9 @@ int dma_fence_signal(struct dma_fence *fence)
>  
>  	tmp = dma_fence_begin_signalling();
>  
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock(fence, flags);
>  	ret = dma_fence_signal_timestamp_locked(fence, ktime_get());
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock(fence, flags);
>  
>  	dma_fence_end_signalling(tmp);
>  
> @@ -579,10 +578,10 @@ void dma_fence_release(struct kref *kref)
>  		 * don't leave chains dangling. We set the error flag first
>  		 * so that the callbacks know this signal is due to an error.
>  		 */
> -		spin_lock_irqsave(fence->lock, flags);
> +		dma_fence_lock(fence, flags);
>  		fence->error = -EDEADLK;
>  		dma_fence_signal_locked(fence);
> -		spin_unlock_irqrestore(fence->lock, flags);
> +		dma_fence_unlock(fence, flags);
>  	}
>  
>  	ops = rcu_dereference(fence->ops);
> @@ -612,7 +611,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>  	const struct dma_fence_ops *ops;
>  	bool was_set;
>  
> -	lockdep_assert_held(fence->lock);
> +	lockdep_assert_held(dma_fence_spinlock(fence));
>  
>  	was_set = test_and_set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>  				   &fence->flags);
> @@ -648,9 +647,9 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence)
>  {
>  	unsigned long flags;
>  
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock(fence, flags);
>  	__dma_fence_enable_signaling(fence);
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock(fence, flags);
>  }
>  EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
>  
> @@ -690,8 +689,7 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
>  		return -ENOENT;
>  	}
>  
> -	spin_lock_irqsave(fence->lock, flags);
> -
> +	dma_fence_lock(fence, flags);
>  	if (__dma_fence_enable_signaling(fence)) {
>  		cb->func = func;
>  		list_add_tail(&cb->node, &fence->cb_list);
> @@ -699,8 +697,7 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
>  		INIT_LIST_HEAD(&cb->node);
>  		ret = -ENOENT;
>  	}
> -
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock(fence, flags);
>  
>  	return ret;
>  }
> @@ -723,9 +720,9 @@ int dma_fence_get_status(struct dma_fence *fence)
>  	unsigned long flags;
>  	int status;
>  
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock(fence, flags);
>  	status = dma_fence_get_status_locked(fence);
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock(fence, flags);
>  
>  	return status;
>  }
> @@ -755,13 +752,11 @@ dma_fence_remove_callback(struct dma_fence *fence, struct dma_fence_cb *cb)
>  	unsigned long flags;
>  	bool ret;
>  
> -	spin_lock_irqsave(fence->lock, flags);
> -
> +	dma_fence_lock(fence, flags);
>  	ret = !list_empty(&cb->node);
>  	if (ret)
>  		list_del_init(&cb->node);
> -
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock(fence, flags);
>  
>  	return ret;
>  }
> @@ -800,8 +795,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>  	unsigned long flags;
>  	signed long ret = timeout ? timeout : 1;
>  
> -	spin_lock_irqsave(fence->lock, flags);
> -
> +	dma_fence_lock(fence, flags);
>  	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>  		goto out;
>  
> @@ -824,11 +818,11 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>  			__set_current_state(TASK_INTERRUPTIBLE);
>  		else
>  			__set_current_state(TASK_UNINTERRUPTIBLE);
> -		spin_unlock_irqrestore(fence->lock, flags);
> +		dma_fence_unlock(fence, flags);
>  
>  		ret = schedule_timeout(ret);
>  
> -		spin_lock_irqsave(fence->lock, flags);
> +		dma_fence_lock(fence, flags);
>  		if (ret > 0 && intr && signal_pending(current))
>  			ret = -ERESTARTSYS;
>  	}
> @@ -838,7 +832,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>  	__set_current_state(TASK_RUNNING);
>  
>  out:
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock(fence, flags);
>  	return ret;
>  }
>  EXPORT_SYMBOL(dma_fence_default_wait);
> @@ -1046,7 +1040,6 @@ static void
>  __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>  	         spinlock_t *lock, u64 context, u64 seqno, unsigned long flags)
>  {
> -	BUG_ON(!lock);
>  	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
>  
>  	kref_init(&fence->refcount);
> @@ -1057,10 +1050,15 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>  	 */
>  	RCU_INIT_POINTER(fence->ops, ops);
>  	INIT_LIST_HEAD(&fence->cb_list);
> -	fence->lock = lock;
>  	fence->context = context;
>  	fence->seqno = seqno;
>  	fence->flags = flags;
> +	if (lock) {
> +		fence->extern_lock = lock;
> +	} else {
> +		spin_lock_init(&fence->inline_lock);
> +		fence->flags |= BIT(DMA_FENCE_FLAG_INLINE_LOCK_BIT);
> +	}
>  	fence->error = 0;
>  
>  	trace_dma_fence_init(fence);
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index 3c20f1d31cf5..8f48529214a4 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -155,12 +155,12 @@ static void timeline_fence_release(struct dma_fence *fence)
>  	struct sync_timeline *parent = dma_fence_parent(fence);
>  	unsigned long flags;
>  
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock(fence, flags);
>  	if (!list_empty(&pt->link)) {
>  		list_del(&pt->link);
>  		rb_erase(&pt->node, &parent->pt_tree);
>  	}
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock(fence, flags);
>  
>  	sync_timeline_put(parent);
>  	dma_fence_free(fence);
> @@ -178,7 +178,7 @@ static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadlin
>  	struct sync_pt *pt = dma_fence_to_sync_pt(fence);
>  	unsigned long flags;
>  
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock(fence, flags);
>  	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
>  		if (ktime_before(deadline, pt->deadline))
>  			pt->deadline = deadline;
> @@ -186,7 +186,7 @@ static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadlin
>  		pt->deadline = deadline;
>  		__set_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags);
>  	}
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock(fence, flags);
>  }
>  
>  static const struct dma_fence_ops timeline_fence_ops = {
> @@ -427,13 +427,13 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
>  		goto put_fence;
>  	}
>  
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock(fence, flags);
>  	if (!test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
>  		ret = -ENOENT;
>  		goto unlock;
>  	}
>  	data.deadline_ns = ktime_to_ns(pt->deadline);
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock(fence, flags);
>  
>  	dma_fence_put(fence);
>  
> @@ -446,7 +446,7 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
>  	return 0;
>  
>  unlock:
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock(fence, flags);
>  put_fence:
>  	dma_fence_put(fence);
>  
> diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
> index 02af347293d0..c49324505b20 100644
> --- a/drivers/dma-buf/sync_debug.h
> +++ b/drivers/dma-buf/sync_debug.h
> @@ -47,7 +47,7 @@ struct sync_timeline {
>  
>  static inline struct sync_timeline *dma_fence_parent(struct dma_fence *fence)
>  {
> -	return container_of(fence->lock, struct sync_timeline, lock);
> +	return container_of(fence->extern_lock, struct sync_timeline, lock);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> index 5ec5c3ff22bb..fcc7a3fb93b3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> @@ -468,10 +468,10 @@ bool amdgpu_ring_soft_recovery(struct amdgpu_ring *ring, unsigned int vmid,
>  	if (amdgpu_sriov_vf(ring->adev) || !ring->funcs->soft_recovery || !fence)
>  		return false;
>  
> -	spin_lock_irqsave(fence->lock, flags);
> +	dma_fence_lock(fence, flags);
>  	if (!dma_fence_is_signaled_locked(fence))
>  		dma_fence_set_error(fence, -ENODATA);
> -	spin_unlock_irqrestore(fence->lock, flags);
> +	dma_fence_unlock(fence, flags);
>  
>  	while (!dma_fence_is_signaled(fence) &&
>  	       ktime_to_ns(ktime_sub(deadline, ktime_get())) > 0)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index db66b4232de0..db6516ce8335 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2774,8 +2774,8 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>  	dma_fence_put(vm->last_unlocked);
>  	dma_fence_wait(vm->last_tlb_flush, false);
>  	/* Make sure that all fence callbacks have completed */
> -	spin_lock_irqsave(vm->last_tlb_flush->lock, flags);
> -	spin_unlock_irqrestore(vm->last_tlb_flush->lock, flags);
> +	dma_fence_lock(vm->last_tlb_flush, flags);
> +	dma_fence_unlock(vm->last_tlb_flush, flags);
>  	dma_fence_put(vm->last_tlb_flush);
>  
>  	list_for_each_entry_safe(mapping, tmp, &vm->freed, list) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 77207f4e448e..4fc7f66b7d13 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -631,20 +631,20 @@ bool amdgpu_vm_is_bo_always_valid(struct amdgpu_vm *vm, struct amdgpu_bo *bo);
>   */
>  static inline uint64_t amdgpu_vm_tlb_seq(struct amdgpu_vm *vm)
>  {
> +	struct dma_fence *fence;
>  	unsigned long flags;
> -	spinlock_t *lock;
>  
>  	/*
>  	 * Workaround to stop racing between the fence signaling and handling
> -	 * the cb. The lock is static after initially setting it up, just make
> -	 * sure that the dma_fence structure isn't freed up.
> +	 * the cb.
>  	 */
>  	rcu_read_lock();
> -	lock = vm->last_tlb_flush->lock;
> +	fence = dma_fence_get_rcu(vm->last_tlb_flush);
>  	rcu_read_unlock();
>  
> -	spin_lock_irqsave(lock, flags);
> -	spin_unlock_irqrestore(lock, flags);
> +	dma_fence_lock(fence, flags);
> +	dma_fence_unlock(fence, flags);
> +	dma_fence_put(fence);
>  
>  	return atomic64_read(&vm->tlb_seq);
>  }
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 46655339003d..ad47f58cd159 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -159,7 +159,7 @@ static const struct dma_fence_ops drm_crtc_fence_ops;
>  static struct drm_crtc *fence_to_crtc(struct dma_fence *fence)
>  {
>  	BUG_ON(fence->ops != &drm_crtc_fence_ops);
> -	return container_of(fence->lock, struct drm_crtc, fence_lock);
> +	return container_of(fence->extern_lock, struct drm_crtc, fence_lock);
>  }
>  
>  static const char *drm_crtc_fence_get_driver_name(struct dma_fence *fence)
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index 95b8a2e4bda6..624a4e8b6c99 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -81,7 +81,7 @@
>   *	From userspace, this property will always read as zero.
>   */
>  
> -#define fence_to_wb_connector(x) container_of(x->lock, \
> +#define fence_to_wb_connector(x) container_of(x->extern_lock, \
>  					      struct drm_writeback_connector, \
>  					      fence_lock)
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 1527b801f013..2956ed2ec073 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -156,12 +156,13 @@ nouveau_name(struct drm_device *dev)
>  static inline bool
>  nouveau_cli_work_ready(struct dma_fence *fence)
>  {
> +	unsigned long flags;
>  	bool ret = true;
>  
> -	spin_lock_irq(fence->lock);
> +	dma_fence_lock(fence, flags);
>  	if (!dma_fence_is_signaled_locked(fence))
>  		ret = false;
> -	spin_unlock_irq(fence->lock);
> +	dma_fence_unlock(fence, flags);
>  
>  	if (ret == true)
>  		dma_fence_put(fence);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index d5654e26d5bc..272b492c4d7c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -47,7 +47,8 @@ from_fence(struct dma_fence *fence)
>  static inline struct nouveau_fence_chan *
>  nouveau_fctx(struct nouveau_fence *fence)
>  {
> -	return container_of(fence->base.lock, struct nouveau_fence_chan, lock);
> +	return container_of(fence->base.extern_lock, struct nouveau_fence_chan,
> +			    lock);
>  }
>  
>  static bool
> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
> index 05204a6a3fa8..1d346822c1f7 100644
> --- a/drivers/gpu/drm/qxl/qxl_release.c
> +++ b/drivers/gpu/drm/qxl/qxl_release.c
> @@ -60,7 +60,8 @@ static long qxl_fence_wait(struct dma_fence *fence, bool intr,
>  	struct qxl_device *qdev;
>  	unsigned long cur, end = jiffies + timeout;
>  
> -	qdev = container_of(fence->lock, struct qxl_device, release_lock);
> +	qdev = container_of(fence->extern_lock, struct qxl_device,
> +			    release_lock);
>  
>  	if (!wait_event_timeout(qdev->release_event,
>  				(dma_fence_is_signaled(fence) ||
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> index c2294abbe753..346761172c1b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> @@ -47,7 +47,8 @@ struct vmw_event_fence_action {
>  static struct vmw_fence_manager *
>  fman_from_fence(struct vmw_fence_obj *fence)
>  {
> -	return container_of(fence->base.lock, struct vmw_fence_manager, lock);
> +	return container_of(fence->base.extern_lock, struct vmw_fence_manager,
> +			    lock);
>  }
>  
>  static void vmw_fence_obj_destroy(struct dma_fence *f)
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
> index b2a0c46dfcd4..3456bec93c70 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> @@ -144,7 +144,8 @@ static struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence);
>  
>  static struct xe_hw_fence_irq *xe_hw_fence_irq(struct xe_hw_fence *fence)
>  {
> -	return container_of(fence->dma.lock, struct xe_hw_fence_irq, lock);
> +	return container_of(fence->dma.extern_lock, struct xe_hw_fence_irq,
> +			    lock);
>  }
>  
>  static const char *xe_hw_fence_get_driver_name(struct dma_fence *dma_fence)
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index d21bf8f26964..ea7038475b4b 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -187,11 +187,11 @@ static bool xe_fence_set_error(struct dma_fence *fence, int error)
>  	unsigned long irq_flags;
>  	bool signaled;
>  
> -	spin_lock_irqsave(fence->lock, irq_flags);
> +	dma_fence_lock(fence, irq_flags);
>  	signaled = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
>  	if (!signaled)
>  		dma_fence_set_error(fence, error);
> -	spin_unlock_irqrestore(fence->lock, irq_flags);
> +	dma_fence_unlock(fence, irq_flags);
>  
>  	return signaled;
>  }
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index e1ba1d53de88..fb416f500664 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -34,7 +34,8 @@ struct seq_file;
>   * @ops: dma_fence_ops associated with this fence
>   * @rcu: used for releasing fence with kfree_rcu
>   * @cb_list: list of all callbacks to call
> - * @lock: spin_lock_irqsave used for locking
> + * @extern_lock: external spin_lock_irqsave used for locking
> + * @inline_lock: alternative internal spin_lock_irqsave used for locking
>   * @context: execution context this fence belongs to, returned by
>   *           dma_fence_context_alloc()
>   * @seqno: the sequence number of this fence inside the execution context,
> @@ -48,6 +49,7 @@ struct seq_file;
>   * atomic ops (bit_*), so taking the spinlock will not be needed most
>   * of the time.
>   *
> + * DMA_FENCE_FLAG_INLINE_LOCK_BIT - use inline spinlock instead of external one
>   * DMA_FENCE_FLAG_SIGNALED_BIT - fence is already signaled
>   * DMA_FENCE_FLAG_TIMESTAMP_BIT - timestamp recorded for fence signaling
>   * DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT - enable_signaling might have been called
> @@ -65,7 +67,10 @@ struct seq_file;
>   * been completed, or never called at all.
>   */
>  struct dma_fence {
> -	spinlock_t *lock;
> +	union {
> +		spinlock_t *extern_lock;
> +		spinlock_t inline_lock;
> +	};
>  	const struct dma_fence_ops __rcu *ops;
>  	/*
>  	 * We clear the callback list on kref_put so that by the time we
> @@ -98,6 +103,7 @@ struct dma_fence {
>  };
>  
>  enum dma_fence_flag_bits {
> +	DMA_FENCE_FLAG_INLINE_LOCK_BIT,
>  	DMA_FENCE_FLAG_SEQNO64_BIT,
>  	DMA_FENCE_FLAG_SIGNALED_BIT,
>  	DMA_FENCE_FLAG_TIMESTAMP_BIT,
> @@ -351,6 +357,38 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
>  	} while (1);
>  }
>  
> +/**
> + * dma_fence_spinlock - return pointer to the spinlock protecting the fence
> + * @fence: the fence to get the lock from
> + *
> + * Return either the pointer to the embedded or the external spin lock.
> + */
> +static inline spinlock_t *dma_fence_spinlock(struct dma_fence *fence)
> +{
> +	return test_bit(DMA_FENCE_FLAG_INLINE_LOCK_BIT, &fence->flags) ?
> +		&fence->inline_lock : fence->extern_lock;
> +}
> +
> +/**
> + * dma_fence_lock - irqsave lock the fence
> + * @fence: the fence to lock
> + * @flags: where to store the CPU flags.
> + *
> + * Lock the fence, preventing it from changing to the signaled state.
> + */
> +#define dma_fence_lock(fence, flags)	\
> +	spin_lock_irqsave(dma_fence_spinlock(fence), flags)
> +
> +/**
> + * dma_fence_unlock - unlock the fence and irqrestore
> + * @fence: the fence to unlock
> + * @flags the CPU flags to restore
> + *
> + * Unlock the fence, allowing it to change it's state to signaled again.
> + */
> +#define dma_fence_unlock(fence, flags)	\
> +	spin_unlock_irqrestore(dma_fence_spinlock(fence), flags)
> +
>  #ifdef CONFIG_LOCKDEP
>  bool dma_fence_begin_signalling(void);
>  void dma_fence_end_signalling(bool cookie);
> -- 
> 2.43.0
> 
