Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C006CCA8EDD
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 19:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AC310EB99;
	Fri,  5 Dec 2025 18:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jqg4k2yf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527EA10EAA5;
 Fri,  5 Dec 2025 18:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764960868; x=1796496868;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rdgbn1+lk4eL+3I/raEM+vi7H7lJHcgpeqnv5R8nOmQ=;
 b=Jqg4k2yfwTB5oY4RcyHwYiCcdev60UqHoxWNRM0hJ0ExQsvqYug2FYBK
 x/HBWymeBdmHCZeaW6GcNTm++WNlecQoHv0F4agaUsuoiDX37zzKuuhUi
 6wI3XeoMO5CY/CYZme+DTvIN2rXCMYOzUpF1bPqqQvhsg8VkZXsyfensw
 60OQew9J3/o0cIHRao/Aqg4i7qd50PDuOSFMYPi4eLAu+k/AQHWNuM4ce
 DaYcGF8fp2rTAKwfYaOESB+q0c5B49z7N+NTo+Bkx72VmJJdcPCoClCqA
 /V2wdll5uhlLptaEi0Nu/qD6D1ZTDsvUg6g/OvzEFr2B1q6dVZiqKUT2z g==;
X-CSE-ConnectionGUID: t1SrovjwRW+qxiTlyM5yZw==
X-CSE-MsgGUID: Y7G/Bq/DTOeF6wgccNUIjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="78465048"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="78465048"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:54:28 -0800
X-CSE-ConnectionGUID: N58NdG/zR92I3wB6EAIqDw==
X-CSE-MsgGUID: K1LtjoqXTVG/AAXdjl42vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195180847"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:54:28 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:54:27 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 10:54:27 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:54:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y37Zsfa/65FvGNoKiT+V0OfFE10/4zEwfNX3wQiD+OLQgxUUOZwB+cU3PFVy9Wp1r4J9RaFv1IusSA4wW0tnJrfZrT9hr6GgmFwz/6PJqmwvmwRgDw04Ldfm3DZapGhN3cNufC7vR03ehp/2R1qty8PfLzkAbdfVYI7FPtn6+AJbQ5rZhGMRr7ID7UFc9oc4f/cTvCvDiLKBtsXSf3w0yBRmKB/bA1/u1eWHFx9KKedobH9R2G2YmjidA8SyyNuzpYgyIXDo8yQrl5B2lm54bVCpCr/Vu4G+EsBsoWS3wpGknoNrbR+QTzeagWDNJAPROKoPGcXRzhHG4c5wZT1kiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dF/tBUR3L+mgtC4SLIKTSbXnIC2NOwULeDGd9X49/Mg=;
 b=fj43lSUisED7dQfmTmarvu11Gnq2DeQgkkbfidul0a1HnEMg02sbAanXac8+6JobfNlBiOp1DrmBTokSdrHMXxYDfzGUX05+R/KNjliNrwHMp7JfPn3w759O7cjtseUyNtV4phdsxtEPuXGx2Itz6rZiA5QBfkykZRqNVxJXwm0Z2kW2s6KoAv9Pv/A3wiOA694ki8T3XM9aBuhKMwDB4O/Xf9/VIbri9omyPhyAaf1mV6UQB9fCtLIBA0/U0uRp5h+JsbM3v993Sx9euBDjmkddCx8Oz9I91qFCeqp+REjOuQkndNpmcDANwdyG1v/W+mw2GPeXe8WeX+Os6/2dVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPF740777B0C.namprd11.prod.outlook.com (2603:10b6:518:1::d2f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 18:54:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 18:54:25 +0000
Date: Fri, 5 Dec 2025 10:54:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Alex Deucher <alexdeucher@gmail.com>, Philipp Stanner
 <pstanner@redhat.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>,
 <dakr@kernel.org>
Subject: Re: [PATCH v7 2/9] drm/sched: Add pending job list iterator
Message-ID: <aTMqXdD/H3S8TYX8@lstrano-desk.jf.intel.com>
References: <20251201183954.852637-1-matthew.brost@intel.com>
 <20251201183954.852637-3-matthew.brost@intel.com>
 <0088fe0dd0d62b876d77b0f9e3a1c7586bdc5557.camel@redhat.com>
 <CADnq5_Pv20j+oSSFvfauUKvH8LUiVMCz2jgQyrDMw3CKACLNgQ@mail.gmail.com>
 <3f71a73a-8360-409c-8a51-55c37230d4cf@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f71a73a-8360-409c-8a51-55c37230d4cf@amd.com>
X-ClientProxiedBy: MW4PR04CA0235.namprd04.prod.outlook.com
 (2603:10b6:303:87::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPF740777B0C:EE_
X-MS-Office365-Filtering-Correlation-Id: 327d01f0-1b67-4d9d-25da-08de342fb59f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnEzNERvYmpsU2l6UllVNkJ0WmYyclI2eXIySkJISkJjUGtSaENla3VMb2Rx?=
 =?utf-8?B?eDJTa1FGMjQ5K3U2YVk0S0lodGo5VGV4U0xtbS9KM285ckpISTNkcnF4MzZs?=
 =?utf-8?B?VS9QdkZka0E3NEwvaDdENFIrL1Q0SGU2bXFCaVlEMWdYQUFWTnUxc2srcjR2?=
 =?utf-8?B?ZjNZYjlLUk5YeWQ4NVhYN1hRd0JKVEJ4S0E5T0YrdnNEK0pIcDVmc0xydll2?=
 =?utf-8?B?bzVaZUhUd0RHL2ZteUFCOGk5TTNKUGZOTnpJeWhxVGVwc2EzeWp5ZW1KUzZt?=
 =?utf-8?B?N3c5a0Rxb1dmSVVoVlVaSU92NCsveEF2WDFzNURienRpWmtQRVU2U1FNbVM5?=
 =?utf-8?B?NEEzNmU5Q3BzSUtybUZBY1hrSDBJS0xXVXUzbGo1Q1FNMXF6NHNnWnc3RVA5?=
 =?utf-8?B?dUpMV280WjFvSnpPcEtNLzk4c1RPVkpya3ZFWlgxVURuMk9TVlZKdURteWxi?=
 =?utf-8?B?VmY2QzZKTU94bnJBZ1p1SEs5UVN2WVNhL2RFUndkNHFJdmU1OUxnNEFYc2VU?=
 =?utf-8?B?WG1CUStQSXJ2dEF0eGNBZjJzTTlydGVhelM0cStTUW5reFN4L05RdHp6ejF0?=
 =?utf-8?B?dThZYkpZQmFhdjFiQUl5ZER5dlZPaHZHNFJlL1ZKNkV6UVJVSThOMGRQVlpE?=
 =?utf-8?B?aXJ1MDdBeUIzT3Q5RFAxdWxlMkwzWlNZUzFnZ1duWnkrZGF6T05ibFh3NXZN?=
 =?utf-8?B?aVBXV1ZSeENlbzU2clJrSlBoaS92ZndOUE9Uck1jS2V2d1cxZ2gxZFBuREZJ?=
 =?utf-8?B?TUQ2VkdEZkVGRURQcld1OWtpZmJ1Q1ZSRHNHTVFrWjhBcmNwaFhQNkFOSWZx?=
 =?utf-8?B?SnRoQ0w4U2xtZ3hSU0hQUlk3QXlIL2x0Z0haT1FtelN4V3pDcGJUUzZpUjA4?=
 =?utf-8?B?ZWtZaXRoOWlXL0FQc1JPdWdxbVk0TUNYcHpOOWMvUGwyaUhkYXVMaGZySXI4?=
 =?utf-8?B?U0pKVm9VVERFRDA1aXJSdWx6aUtKejZYMjg2T1drUTdNb0c1b0N1blduaWR5?=
 =?utf-8?B?RmhObC93cEhXY1JGODFyMVpQUjVzeG5EU0hWaHhlRG80dVlLUXlUelNSa1lH?=
 =?utf-8?B?bTFsZTlUNW1FbDhsamFTUFNBUFR3VFcwZUNaaWZwV0hZNGYyQ1M4UjBud21n?=
 =?utf-8?B?M0FxUlE3WGZFOWpMZ0Znb1RwTjJuNkc5eUNLdGJHYkkyWVljSVpKS3ZmV2N3?=
 =?utf-8?B?aHJET1lGb3FLZ1d4c2pQakZLb09GSnlPNm41R0s2MVBrd2ZVYVA5OHJaRllD?=
 =?utf-8?B?bllJNVBlOVNSME0yYjdxaFk5S2I5UUxxa3dWcTBUTUY0elU1VGVaWTR3Z2xr?=
 =?utf-8?B?QUlRZXBpWVpRaTNRTlhYVzczU1BHb0ZLVXNqNEoxR3h4ejFoc0xTTTl6UFRs?=
 =?utf-8?B?c0hhT0drZ3RGWUFLV2IxRWRVUTRrb1hhWGJVWDNqQ0x4U0NuZldQbXdWUVRv?=
 =?utf-8?B?dXdocjJHempvUkpXT2pXelgxSGZrTFBIL2FvZ0RSUmxjWHdoOW53VTVZT0hU?=
 =?utf-8?B?WDZRakRNR1oyZlhKYysxRmZWUnNJRlhrYzRmMFkvamliQTd2NFNoVFduMUlm?=
 =?utf-8?B?aFo1NGUzWVlRbzZnRHozQUlYakdZaTlpdUdQa1ZEaE1vQjJGOEVVc0pxdmhr?=
 =?utf-8?B?S2ZjSGdGcEcwajVJNWk1N2VhcUVvR3BibjdpTkZLbGVmNnFLRDk1cnI4RHdN?=
 =?utf-8?B?VE9hdXVpT2NLRmIweEpYWjdVMWpRTmV6THhrQ3hoU2VRcHlJQXp6QjMrNUtX?=
 =?utf-8?B?cjc1c3BHZmUwUXR3cTdhNWhoUSs5SVZJK3hSR1dQT3ppL0VIU0hIWDVTN3Nh?=
 =?utf-8?B?VnVCb292TktCcVNSOGx5M1ZnSktMOFhRdFo3M3ZWNDRaZXVuMlZkNDlxa1hp?=
 =?utf-8?B?NGZtbWozdFpacU9KeGJTUUUwWmpWUk5BRS9tYVZzcmUrb0F1d1phNHlYTDdJ?=
 =?utf-8?Q?PM2ZuGnODHuQEkw75dIAPip74Cs5VBYu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1o5djhZamhLYkphbmNITkZ2cUJhWi9BRGFDb2ZjZ1lNejkrUWtaVFdMM2py?=
 =?utf-8?B?RlVGL2xUUlorclNUZis3NS9lZFZqa2d4NGZYMWpiT3VIUTZ2N1ZXVzhTekFM?=
 =?utf-8?B?WVh1M05DSVNIOVdqL0xxZlJqcU9ydjFqR29hQ3l2bnVrWXF6eU9rcEErc1I3?=
 =?utf-8?B?TVgyajgwdCtETTlzTjRRdTBBQThmZm1tQ1A3QVdORDhEdWpVZGZ6R2Q5SWtT?=
 =?utf-8?B?bHJHZFRIL2RuWXhUUkZlM1g1eGdJbDNZTEN0YWw4U0N4RGg1UmllR2dPN3lx?=
 =?utf-8?B?OXRQbDIveXJJM29ZSkk5MTN4UXRpRENrbGRRZ3plazh6UE00U0VMdkZzVE5N?=
 =?utf-8?B?VjVneTZQeEtpTDBBcUhpRU5sU0dpMWd0Sk5LYUZOZE5DTlp5eWZISjN1MzJV?=
 =?utf-8?B?Q1FybUx0UjNNR0krcDFEOHBvVGNwZHA0VjVkUlF6OFNhdm9FbXNTUzBwWllu?=
 =?utf-8?B?WFV3aTYxcXJ3dStud1BiNGFrUHdJREl6bDFDMEh5R0dGa1pxWkxmRWswazIy?=
 =?utf-8?B?ZVlZcjFPVWN4OWt5V1FuMXR6Q3JBZFlMTTFnV0o2ZGF0dHE2MThyMmZwMGdu?=
 =?utf-8?B?d2VHR1M3RXBsZFQ5bzFZUTJ2ajNSSEIzOVdiVWI3UFlvellVU3cxeWFxYVZG?=
 =?utf-8?B?b2NkMitDOFZUaWh5ZFZ5MFJnR2NqeXdhSkJ5R0RGSWVDckdiblJuUS80cUFw?=
 =?utf-8?B?VVhKdWNoc3BaUjRJNEJ0UFFKSUdBejdlVjAxUHQ5V3NLQzY4dk92czlla0Ns?=
 =?utf-8?B?YVZXd05acW9iMEdvZ3o1TkZHeklLQ3kzdEJzbThWdWo4Zm0vYjliNm50NFdV?=
 =?utf-8?B?NXVsWEtNdEpCbWpzaUpHMWRWcWIvNlhOcFY4OTVXa1VHcEJac1Z3elRERkZo?=
 =?utf-8?B?LzZ3d2NCSWg2YjBGVEVXZlRET1NkMUExcC9hcXVvTDNtdm1yeFUzbDl5c1hJ?=
 =?utf-8?B?eHRMbURUUGJNTnluaVFTMThDNG5tMG56UVdMSVdsWkVtRnVkOUhKeWRyTkVP?=
 =?utf-8?B?aVkvZW9VV2VDcmovUlVKUCt0Rlo3bzNJR1UwM3MxY2dqWDVGdmgzVk5lMG1Y?=
 =?utf-8?B?NUpPMEFTRDZUN2RaekNQQ3NCd1hpVHFmTkFiM2JHRkhwUmZWUXFPYlVsaTNU?=
 =?utf-8?B?MGd0VTUxbDUxQUdlZHdySzVkUzZPOGFoOHB2N0tZNFlmN1RGcVd2dGdiVFpM?=
 =?utf-8?B?ZTdDZDZpNUUzU1h0WHFGZWxqM09GU3FuTThWbGVyT09IZ1B1WEUrRjNNL0s2?=
 =?utf-8?B?L21CWEd5aENBMldIWkZWSEk2bTdkYXhObmhHZ2JEMW15S0JHMmdrdERnRzJI?=
 =?utf-8?B?K2FQM0JENEMxTkk1cmZqeFpRR2ZWS2Q1VFNudjJWOGZxQ3JzaVZ6K2kxdVUr?=
 =?utf-8?B?N25mTXJtblRZSFdHWDYzaDZMOWpxaGtJd3BGREhIUFdBemRKQkI0cWM3b2px?=
 =?utf-8?B?T1VidGtKZEo2eVpOemRlRTduSlZFZXNPd1hxWWQreXNpTkdjRWZ1SThqVStR?=
 =?utf-8?B?WTJKMzNoTDREMUdNZHVOcW1rK3NORVhlWlZKVlpIcm93bTlHbEsvK0Q3RFNM?=
 =?utf-8?B?SVF5bHQzNStCcnpRb2w0V3JkNjJSMVBPM28rTkN5TWlINkkvQ2hyTXQvUmN3?=
 =?utf-8?B?WFl3NWdCRDZtYUxMNzZJeWZPbVp4cGpSaU9lcDBiSGUxUERqTXZya3JybWN3?=
 =?utf-8?B?eFV2aUsyYml6NUNIYnF1Y1BHdWpLOU5XSDl0T1VaV1RFWkhaZVVybnFKZXJN?=
 =?utf-8?B?V00wODNwTytDY1Yybm1pdWMwdXNhRUl1VGt3dmdFOTRtbG9hMldBODRWWnlF?=
 =?utf-8?B?NUVzYmpoTUxOUEZBVXp2eEtwbzl4MXBBSjljcVFQV1dyZk9DcXNLTzBrbHlU?=
 =?utf-8?B?N3NnbmUrRkNOQUw4Ujg3RGIwYi8xYm1jeU5oWXorQmVKdmFQdnc5bm1WUHYr?=
 =?utf-8?B?alZramN6MlJIMWZkZ1ZNa2doS1ArMUlSK2szVk15dHVVYms0UW16MlE2Wm1K?=
 =?utf-8?B?VjhTYnJPUkxGN3JvemJVM1BySHhTdWgxOTV4ZTY3LzBld1h6WStrdXdnS3hJ?=
 =?utf-8?B?d2ttTXZzaDBBMGVVTG90KzVVcDRnb2RDWGpsdkFlbjlxbW9wWkJMSml4MlIz?=
 =?utf-8?B?dVVoQUVhTUFNTzFiMFM1ZU5WMjVURzRNbjF1QlZKU0lEWGZGcmlGR3FpcWl2?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 327d01f0-1b67-4d9d-25da-08de342fb59f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 18:54:24.9492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/i96Ymj3J68ICCqLQ+5ONv7afTR/8HJj+75+NN+QuGDUFLWGkWRkD5zJQ+zBjqSgUSEQ0q4mZaBXiAr8PAxsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF740777B0C
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

On Fri, Dec 05, 2025 at 10:19:32AM +0100, Christian König wrote:
> On 12/4/25 17:04, Alex Deucher wrote:
> > On Wed, Dec 3, 2025 at 4:24 AM Philipp Stanner <pstanner@redhat.com> wrote:
> >>
> >> +Cc Alex, Christian, Danilo
> >>
> >>
> >> On Mon, 2025-12-01 at 10:39 -0800, Matthew Brost wrote:
> >>> Stop open coding pending job list in drivers. Add pending job list
> >>> iterator which safely walks DRM scheduler list asserting DRM scheduler
> >>> is stopped.
> >>>
> >>> v2:
> >>>  - Fix checkpatch (CI)
> >>> v3:
> >>>  - Drop locked version (Christian)
> >>> v4:
> >>>  - Reorder patch (Niranjana)
> >>
> >> Same with the changelog.
> >>
> >>>
> >>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> >>> ---
> >>>  include/drm/gpu_scheduler.h | 50 +++++++++++++++++++++++++++++++++++++
> >>>  1 file changed, 50 insertions(+)
> >>>
> >>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> >>> index 385bf34e76fe..9d228513d06c 100644
> >>> --- a/include/drm/gpu_scheduler.h
> >>> +++ b/include/drm/gpu_scheduler.h
> >>> @@ -730,4 +730,54 @@ static inline bool drm_sched_job_is_signaled(struct drm_sched_job *job)
> >>>               dma_fence_is_signaled(&s_fence->finished);
> >>>  }
> >>>
> >>> +/**
> >>> + * struct drm_sched_pending_job_iter - DRM scheduler pending job iterator state
> >>> + * @sched: DRM scheduler associated with pending job iterator
> >>> + */
> >>> +struct drm_sched_pending_job_iter {
> >>> +     struct drm_gpu_scheduler *sched;
> >>> +};
> >>> +
> >>> +/* Drivers should never call this directly */
> >>> +static inline struct drm_sched_pending_job_iter
> >>> +__drm_sched_pending_job_iter_begin(struct drm_gpu_scheduler *sched)
> >>> +{
> >>> +     struct drm_sched_pending_job_iter iter = {
> >>> +             .sched = sched,
> >>> +     };
> >>> +
> >>> +     WARN_ON(!drm_sched_is_stopped(sched));
> >>> +     return iter;
> >>> +}
> >>> +
> >>> +/* Drivers should never call this directly */
> >>> +static inline void
> >>> +__drm_sched_pending_job_iter_end(const struct drm_sched_pending_job_iter iter)
> >>> +{
> >>> +     WARN_ON(!drm_sched_is_stopped(iter.sched));
> >>> +}
> >>> +
> >>> +DEFINE_CLASS(drm_sched_pending_job_iter, struct drm_sched_pending_job_iter,
> >>> +          __drm_sched_pending_job_iter_end(_T),
> >>> +          __drm_sched_pending_job_iter_begin(__sched),
> >>> +          struct drm_gpu_scheduler *__sched);
> >>> +static inline void *
> >>> +class_drm_sched_pending_job_iter_lock_ptr(class_drm_sched_pending_job_iter_t *_T)
> >>> +{ return _T; }
> >>> +#define class_drm_sched_pending_job_iter_is_conditional false
> >>> +
> >>> +/**
> >>> + * drm_sched_for_each_pending_job() - Iterator for each pending job in scheduler
> >>> + * @__job: Current pending job being iterated over
> >>> + * @__sched: DRM scheduler to iterate over pending jobs
> >>> + * @__entity: DRM scheduler entity to filter jobs, NULL indicates no filter
> >>> + *
> >>> + * Iterator for each pending job in scheduler, filtering on an entity, and
> >>> + * enforcing scheduler is fully stopped
> >>> + */
> >>> +#define drm_sched_for_each_pending_job(__job, __sched, __entity)             \
> >>> +     scoped_guard(drm_sched_pending_job_iter, (__sched))                     \
> >>> +             list_for_each_entry((__job), &(__sched)->pending_list, list)    \
> >>> +                     for_each_if(!(__entity) || (__job)->entity == (__entity))
> >>> +
> >>>  #endif
> >>
> >>
> >> See my comments in the first patch. The docu doesn't mention at all why
> >> this new functionality exists and when and why users would be expected
> >> to use it.
> >>
> >> As far as I remember from XDC, both AMD and Intel overwrite a timed out
> >> jobs buffer data in the rings on GPU reset. To do so, the driver needs
> >> the timedout job (passed through timedout_job() callback) and then
> >> needs all the pending non-broken jobs.
> >>
> >> AFAICS your patch provides a generic iterator over the entire
> >> pending_list. How is a driver then supposed to determine which are the
> >> non-broken jobs (just asking, but that needs to be documented)?
> >>
> >> Could it make sense to use a different iterator which only returns jobs
> >> of not belonging to the same context as the timedout-one?
> >>
> >> Those are important questions that need to be addressed before merging
> >> that.
> >>
> >> And if this works canonically (i.e., for basically everyone), it needs
> >> to be documented in drm_sched_resubmit_jobs() that this iterator is now
> >> the canonical way of handling timeouts.
> >>
> >> Moreover, btw, just yesterday I added an entry to the DRM todo list
> >> which addresses drm_sched_resubmit_jobs(). If we merge this, that entry
> >> would have to be removed, too.
> >>
> >>
> >> @AMD: Would the code Matthew provides work for you? Please give your
> >> input. This is very important common infrastructure.
> > 
> > I don't think drm_sched_resubmit_jobs() can work for us without major
> > rework.  For our kernel queues, we have a single queue on which jobs
> > for different clients are scheduled.  When we reset the queue, we lose
> > all jobs on the queue and have to re-emit the non-guilty ones.  We do
> > this at the ring level, i.e., we save the packets directly from the
> > ring and then re-emit the packets for the non-guilty contexts to the
> > freshly reset ring.  This avoids running run_job() again which would
> > issue new fences and race with memory management, etc.
> > 
> > I think the following would be workable:
> > 1. driver job_timedout() callback flags the job as bad. resets the bad
> > queue, and calls drm_sched_resubmit_jobs()
> > 2. drm_sched_resubmit_jobs() walks the pending list and calls
> > run_job() for every job
> 
> Calling run_job() multiple times was one of the worst ideas I have ever seen.
> 

I'm not sure who this is directed at but maybe dial back the intensity a
bit here. I really doubt this is one of the worst ideas you've ever
seen.

> The problem here is that you need a transactional approach to the internal driver state which is modified by ->run_job().
> 
> So for example if you have:
> ->run_job(A)
> ->run_job(B)
> ->run_job(C)
> 
> And after a reset you find that you need to re-submit only job B and A & C are filtered then that means that your driver state needs to get back before running job A.
> 

This scenario isn’t possible in Xe due to the 1:1 relationship between
the scheduler and the entity. Jobs execute serially on a single ring. So
if B needs to be resubmitted, so does C. I’m not sure how AMDGPU works,
but it seems like a significant problem if this scenario can occur or
the scheduler is being misused, as AFAIK jobs submitted to a scheduler
instance should signal in order.

> > 2. driver run_job() callback looks to see if we already ran this job
> > and uses the original fence rather than allocating a new one
> 
> Nope, the problem is *all* drivers *must* use the original fence. Otherwise you always run into trouble.
> 

Isn’t that what Alex is saying—always use the original fence? I fully
agree with this; Xe does the same. That’s why drm_sched_resubmit_jobs is
confusing, as the way it’s coded assumes run_job can return a different
fence than the original invocation of run_job. This is part of the
reason I didn’t use this function in Xe—it looked scary.

> We should not promote a driver interface which makes it extremely easy to shoot down the whole system.
> 
> > 3. driver run_job() callback checks to see if the job is guilty or
> > from the same context and if so, sets an error on the fences and
> > submits only the fence packet to the queue so that any follow up jobs
> > will properly synchronize if they need to wait on the fence from the
> > bad job.
> > 4. driver run_job() callback will submit the full packet stream for
> > non-guilty contexts
> > 
> > I guess we could use the iterator and implement that logic in the
> > driver directly rather than using drm_sched_resubmit_jobs().
> 
> Yeah, exactly that's the way to go.
> 

I think we’re in agreement that this patch can be rebased, address any
comments here, and then be merged?

Matt

> Christian.
> 
> > 
> > Alex
> 
