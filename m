Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E22A5BAC7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 09:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198CD10E12F;
	Tue, 11 Mar 2025 08:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCZhAh22";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BE410E12F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 08:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741681515; x=1773217515;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6ySlVE8pZM+yvEj1Uv9CcNl8OeIF6yo4+E6AQBjmuGM=;
 b=mCZhAh22elezdhPaRD0g74iIq27eyP8EgI+vDkipfn1RcVGrlPgtKVw0
 QtN79o64T3OYaM4q5ZxOFBEAelmE8JblnYmaKYg+oJ0p72+hj6VR5/Nig
 G4tuiY0m5ethoPCvdelJ0L+mbBHbXkA6X0BRv2v2we4urpzhs2tCLxTbK
 9rs+JP07mn68X1qQXFTWBdeRJx27OIpcDriZvjKkvwPVMImph61G2Mq50
 BhHNShfKqNAIgQTAlYOeUHO+gD9EX305M2U+bz6jZfIllnpcijkZjnNKT
 lfnbxG4pEoYqgIIz1nllFXoP7p7XDPZzLo57YwBeU9mM0cV88IefJ+MRR Q==;
X-CSE-ConnectionGUID: xIsm5M8cRFeZleFoTWYbdg==
X-CSE-MsgGUID: gnsk4BiXS3KWLYsvXnh3VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42423243"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="42423243"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 01:25:15 -0700
X-CSE-ConnectionGUID: nHTlPvkyQ2qAxAV3KIHEog==
X-CSE-MsgGUID: P1iKG2JdSmubH+5PFlK2kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="125445510"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2025 01:25:14 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Mar 2025 01:25:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Mar 2025 01:25:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 01:25:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njzpPrXW6dm2RDqAjUgZt0aW77BwXH5beGmVw+5hDxCbpfom8SJiaKR1xD25R/zEVyB7Y+tB03Rdh5p9YK5hWI/8C0aUvfh56tQHLSAQe2EqT2w1TXJHQEaNGb0vVNxL3dXOQFgTVhg7s4/LalAG3aIL7SwYuwWokNs3vcb9cL0JzqbixHkmHYAdV4b6cAhWFC0m9/ZMD0WhNba+VXi02GZA+AzOdAiBhjYNN3512GkIKzQVWxDtAY/eCzUkp65M4zGJOzlHQqRMiuPS/o+GtP8GIgM7ruq3Viwau+T2Plnp9RyUOWRdTmybLB2zuUYTsgSw87OgcTOcgtRtSohSSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3woGJbLw5Z3bIWN6gb15cx3yj38pNGkMheXwobrOMUU=;
 b=aWGv7N8kThrIbyIiKuH3f1/vbscBG5qxEQL3h4ABY0Vo9V0ktaRMAy8m1vnqYv5r1Sk/ZouF2itgFMXYEFLZd/pnh7pWFXDMSiyPS24SDbzso4nOlV+KXXyEqDAIxJM8G6lAKL1cZdjF+6JvvKUFRde84Kg4EaxWjpG7+3SPf8xdWvk/BtsqJrpGu3DITn21318TA1TGAm0Glowss1fY/Ia7rx4ygtBvzoBcrocvJP4VPkK3Pu24sw/Fo1vlfPzBWymZLOI0Rb+7xrMz+y9tTDflFQ3nhVGQeeJLacZBjeAUaM4xnCQcZbg/3G/YGHVAHUXuT2OLlca95xLUlDD3rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 CH3PR11MB8316.namprd11.prod.outlook.com (2603:10b6:610:17b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.27; Tue, 11 Mar 2025 08:25:12 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::6c31:ab8a:d70:2555]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::6c31:ab8a:d70:2555%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 08:25:11 +0000
Message-ID: <be353276-3dce-49c1-8a35-164a33ddb9f9@intel.com>
Date: Tue, 11 Mar 2025 10:25:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] MAINTAINERS: Change habanalabs maintainer
To: Oded Gabbay <ogabbay@kernel.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Ofir Bitton
 <obitton@habana.ai>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "sfr@canb.auug.org.au"
 <sfr@canb.auug.org.au>, "jgg@nvidia.com" <jgg@nvidia.com>,
 <koby.elbaz@intel.com>, <konstantin.sinyuk@intel.com>
References: <20240729121718.540489-1-obitton@habana.ai>
 <20240729121718.540489-2-obitton@habana.ai>
 <dc139f06-3f5a-4216-93c2-1e8b3b9c27ba@intel.com> <87cyevy9k0.fsf@intel.com>
 <f543ec81-1092-4700-b695-c4126f122444@intel.com> <Z8q6pCmCnVCCvBJK@GABBAY.>
Content-Language: en-US
From: "Avizrat, Yaron" <yaron.avizrat@intel.com>
In-Reply-To: <Z8q6pCmCnVCCvBJK@GABBAY.>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL0P290CA0009.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::6)
 To DM4PR11MB5549.namprd11.prod.outlook.com
 (2603:10b6:5:388::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5549:EE_|CH3PR11MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd2fdce-af01-487f-5ec0-08dd60763d62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjFRYVRkTFZvTlpPZWRyOXprTjRDR3V2bnlxeDdwMUdaWTRaV2dldU40QS9x?=
 =?utf-8?B?bXRhOGQ1WUYreDNZejZmTWNyaVhFcVpHZU5QemNDT1pyOHJLSU1RcmpCaWVX?=
 =?utf-8?B?Z0FHQlNJalM3Qm01U3pPMGNDTjhDODZaclFFNE5COE04NStoSlIrY085Ny85?=
 =?utf-8?B?OVVCa01wSG9MQUF5anp5TmZ2eXFqWGxRV1o1Q0pPTUlvbk9OczBES1ZOOGJU?=
 =?utf-8?B?MlRYMlRaWEZxWHlDOG5QdXA3azZDdU9TSVlDbmlnUjdmVm5nN3F6L2NnQ3Ur?=
 =?utf-8?B?allsYjRVYUZocFpmQzgwTUZ6cThhZ0NEbWFvZFFXNHF3VG9UcU5QRTA0bmZp?=
 =?utf-8?B?bzFhdEJ4YjVxRnk4U25WMFoxbThnd0ZOSmZ6MXNRdXVWS1hiZmFLVFpuVGlL?=
 =?utf-8?B?TU9mdnlTQkpsUTBaS2pxVW9jbWJ4NG1YdGttamRyd0IvaHN3NG5ZOHh2R2F3?=
 =?utf-8?B?bVNIZkkrLzZ3SWJUNmdxTXVKSlRXeDFlUkxBOWxhN25JNmFiZC9JQkRKb1pZ?=
 =?utf-8?B?ekxYbEhadzNvblg4bktFeUdQenBscEVTT1YzbkthSE8ydEVPd0tlNTZnanRY?=
 =?utf-8?B?VW1rUFExenRDYXBXSCs4TXgvZmY4bVhubS8vSkV2R0RkdnZ1bnJ6SEY0T01U?=
 =?utf-8?B?cTQ1NW5mclBCOWg1MzdEZDBJdVora3BhUTBZRVVkd2djeVNqbWxZQitaQkdS?=
 =?utf-8?B?TXY0b3VMYUx5MmRXOXRDQUFCRGhLejgrSWdzUmxXV3hJeCtwT1ZDZjI4STVL?=
 =?utf-8?B?d1BSeEhwS1Q3M3Z6Ym90TlRUOUNpM0RtRkxvdkpydW9aWkFVYktjclhWWTRs?=
 =?utf-8?B?Q3VrUk9BL3RLK0dDZzEzNWZoN1JxWFplWEdVRkRqbmNrSm1WdFF6K1NVNEFU?=
 =?utf-8?B?ME1rKzFzSmJ3SWpTekRwRTlYcE1vc2FQeFNoTW5iVFhnYTFlWG5PNTRXSCs2?=
 =?utf-8?B?eXQ2Q2prb3JoMnZSQkxramxWUnlwY0U3S28vb3c4UzBaWkR5MkMrcjd4L3RO?=
 =?utf-8?B?TDQ5aHNIc0lqeUtnRHRYYmNRR0NERGtMeDRsSzdaRjIxMWh4VUpnSWw3emxs?=
 =?utf-8?B?MVRKQXhsb2lHbDFuUjJ4WFFqNW9QaEpNYlp3QTdGV1h5V0swVUxYWjRQalFT?=
 =?utf-8?B?U0wyb2FVdHBmUE1NVk53UG9mck9HbnZ4ODRjQzlPZEZPMFFaTGQ2R1NDZXpT?=
 =?utf-8?B?MHJUMTkwckFKa2tKU3VWRlJRSERFV1V5K0p1SWc2bGpoK05zQzJsell4eGxW?=
 =?utf-8?B?UXlLWFp4bFhPVjlsV0NhQTdqRTN4d3RIZllrSHIyRk5JaWlvMFg0RVdHWUZD?=
 =?utf-8?B?aERML1cyRk1PZ2VMQVh4c3FWeXhGTHZKV1dXaytHUG5yVmpWdU9RSzRvMFAw?=
 =?utf-8?B?ZDN2aVhQaFlib0NOd3pNNWFSTnJYbTRVZXVDckErZ0NkSXN6bWdKYU14WlZM?=
 =?utf-8?B?T2pnVlF1clZUS1dMZVg2cFhzd0txaW9XSFVIK1lSdE16b0dkbE9FdFlYYzFY?=
 =?utf-8?B?Y1djZUhhVXJrN3J5RHBVZE5GOThoWXZxckRSdEoyUStVcXYvVlg0c2MyMFlJ?=
 =?utf-8?B?ZXorQ0gzVlhJYWZPditpM2dRRXRhU1F6aWkzUGxKdytXMWtxektNWlozRnUr?=
 =?utf-8?B?aWw5dUV1bXpuUmtHc0o4ejlHYUQ0TmZxcUhaWTVpUlNTNGFwekxKK3NSSUc2?=
 =?utf-8?B?MDhCL2hzbHUyc2RBclI3Z3NYNytSbHNmcS9YZmtkRXVlQkVHQ1RIeUEyZ2cy?=
 =?utf-8?B?YVExQ1JSa0k0K2YxZktvd1dpR2VJYkwvYzc2S2VzRzBuTEZ5RW41Nk9pRWxw?=
 =?utf-8?B?YzN4TC9CZTJnREF6TFBxb013Qm5ZS3BqSTdjOU5JY1pmYU0xQ1FsOGpGU1Ro?=
 =?utf-8?Q?QZnD31qLto6CL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2lvS29xblZOdTB1Mi8wR2ZJYjgxVnEvTjRNTWlEQ3VWOVF5M2toZ25kREQx?=
 =?utf-8?B?L1QrdVJ5UTl4VFIzTFZrTWJOVVVpRElxcjdKYTJURzRJNWFodHJIL2FEWmVp?=
 =?utf-8?B?RlQwOG9qaXpYdm1PSnMvdHhZMm5WRGpReEw3bkNzTzY5RyttL0lMZTdGbmc4?=
 =?utf-8?B?Y21mb24zbmZlSXUwZ2hDQTdIZ0tzc3NOS1hHSkpNWlZTR1IxUE4wVmdTcnJB?=
 =?utf-8?B?M1BDeHNBNWRSbXpFNm14YWVyekw5aEF2S2Y3S3A1eVpIZHZOS2UxZ2gxcTRZ?=
 =?utf-8?B?M20vY0I0NTNVWkRRajJ2YmJXNDh6cXF0d1o1MVp1elBhZnR2cmhjcnNqQTBx?=
 =?utf-8?B?WHB4NHorS01kNEwzWk5hZEtDZWVRS2pxbjZyeEg4Rlpndk9MSVdCbUNnTjhX?=
 =?utf-8?B?K3dMMXFnSTJ1NXpyeVFMU2krekYvU2hnOXA0SjhnOGF4UVlndHNYZGhBTENw?=
 =?utf-8?B?S3Yxd2hLV2FqR2ZabkxoQkR1V1duZUJxbFZaYlNidzBZeWIvSHk4U0wvN24y?=
 =?utf-8?B?UUxhejNtekJBdUw1YklUdExDcGQvZVh2VlNkQjA2bFpnMFRoS0hQYkQybzdV?=
 =?utf-8?B?SE5ZUTNTNG9lMHZEaXpId3FvV1dYWXllMG1PSEZCYzE2b2FTZ21aVXVqeWtq?=
 =?utf-8?B?WE1XU3lyRlBNb202WnVmbS81Nm0reHpOcUgxRS8rbGt6UW5XRFFDMWtvSU5Y?=
 =?utf-8?B?SFVqU0NrR3V5MGlvMTdtVFlHajN2VnpQUTlGc1V5WG1kdWV2K1U0eklyOW1r?=
 =?utf-8?B?WnFSVkRnc1JITTY3ZTVuSGZCRk9DaHZJN1pIUFp4NXhqeWVlTzh2WCs5V0dM?=
 =?utf-8?B?dU5wQU8zV0p4S2I1R1kvV1B3dHZOUGNYbHpFN3JpOEFyZThFNjZINnNxV3RZ?=
 =?utf-8?B?VkVGZTBJeGVvVzFHNUczM29UL1NibG1YZnNIalpCMmJJaXpocEc2Zm9tR0JE?=
 =?utf-8?B?ZDJFNDNhT2ZkOFpVbCswVlhrbTRlRElJMVY0OVh6NUdkNURFUFF2ZTY2RjhH?=
 =?utf-8?B?ZGdVcEgxREZEdEtDUDM4RnVzS2Jzd1U1UlpVbURaYTZYK0dNQkhZSGFHMzFt?=
 =?utf-8?B?c2R0Z1ZOcWVNWjI1Wk9GVkJDT0FDdm04OXlpZHlPZ1grMWp2N3NORXprMkph?=
 =?utf-8?B?aVROZDVtbDRBa3NRVUR3ZWpWUys3Sk5QaXFnUHZ0SXpsYktlTm9wWEd0bmZQ?=
 =?utf-8?B?dUQ0RWZhRlJQQndYTEpuTzBKYitYSkQrbWFzUEdvMWRPdlMyemlFT0NVLzl4?=
 =?utf-8?B?QklBNjFJY2t0OExyRDdRbld2SlhxaUVobVVMdWhnVjBJMXRZZ0ZaTmp5aVBM?=
 =?utf-8?B?NGYyRk5yRXFKUFRYTE5lTFNoU1VIQzJxaHhKbW9qL1ViNDlLWEQzU0lMdXFp?=
 =?utf-8?B?YmZoaDFJRWQwTG9PU2xmTDVaZ1I1bWROZVU2VFUxTHlHYUZpYk15c3BIM1JW?=
 =?utf-8?B?ekpWNkdYSHIycHg0NDlVOENBRnZSK0hlczVFU2dUNFh0SEhHS2l5cmQwY01p?=
 =?utf-8?B?aldOajVFLzVTU0IraTlweXBrbjBPM0xtdWlOanhZdGlGTWo3dlR6L3pSTWdN?=
 =?utf-8?B?cURldnMzamFldFF5Zm1nMEUyZ3RHOTFVZkI3a25oMFVuZjhLN0cwMGR4L1Nn?=
 =?utf-8?B?cVcydXZDZDd3bmwyQVRaNlRNZkoxNW1qMnR0Z0Znd2JuaFRGNVkveDliS0JZ?=
 =?utf-8?B?RWc1U2hmVXNtR0w0bEo4a3I5WDg3WjVlWmRudlVnVzVEN3pnMFRIN2xTZ1J3?=
 =?utf-8?B?emk4cG9jSCtuS2kxUTRoNStCUG9GS0pPUlV5Wk1LOFZiZTZWakd1YlJOL1Nk?=
 =?utf-8?B?ZU5UZFRueWRMNTR4KzNveXZteWJ2cHlXOWpRTXhZTjZIdzd1Y1g4c2Y2akRj?=
 =?utf-8?B?MG9kVnorR1BGc1dTb2FkeXloWFNsc2JmRFdybkxOb0JGQXVkTnYwN0kzQW9z?=
 =?utf-8?B?WjZwMnV2VGg5OTBCY0Y1N1haN0JWSDlxR2xwQzI2WFEzRThRUDlodExsRUZO?=
 =?utf-8?B?S1lFdDFJUkJ3ZzN1QmcyeDdIbmdKRXRzOGgrZkJPNGsrQzk1RkdER1NUNVFm?=
 =?utf-8?B?YVhTRWowQ0V5Rkk5RU1KUjMyb08wckJaeWg0L2NiOFM2UzJIU3p0R0xNdml3?=
 =?utf-8?B?WS81R3VyQmFncy9rYVRtSVBkaXZDZ0xaZmltUVRqUnpWZWZQWmNHQWw3Z0Mv?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd2fdce-af01-487f-5ec0-08dd60763d62
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 08:25:11.7010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cG7LpQSVH4tBo2cu7oh2lr1tqfSJNw3rFVjwphyvxbfBGPBObYVsbIL4SNo06ZYmzlv8dvXXjk7v3AxOefCDQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8316
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


On 07/03/2025 11:21, Oded Gabbay wrote:
> On Thu, Mar 06, 2025 at 03:51:24PM +0200, Avizrat, Yaron wrote:
>> On 05/03/2025 13:57, Jani Nikula wrote:
>>> On Wed, 05 Mar 2025, "Avizrat, Yaron" <yaron.avizrat@intel.com> wrote:
>>>> On 29/07/2024 15:17, Ofir Bitton wrote:
>>>>> I will be leaving Intel soon, Yaron Avizrat will take the role
>>>>> of habanalabs driver maintainer.
>>>>>
>>>>> Signed-off-by: Ofir Bitton <obitton@habana.ai>
>>>>> ---
>>>>>  MAINTAINERS | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index ed2d2dbcec81..a4b36590061e 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -9599,7 +9599,7 @@ S:	Maintained
>>>>>  F:	block/partitions/efi.*
>>>>>
>>>>>  HABANALABS PCI DRIVER
>>>>> -M:	Ofir Bitton <obitton@habana.ai>
>>>>> +M:	Yaron Avizrat <yaron.avizrat@intel.com>
>>>>>  L:	dri-devel@lists.freedesktop.org
>>>>>  S:	Supported
>>>>>  C:	irc://irc.oftc.net/dri-devel
>>>> Acked-by: Yaron Avizrat <yaron.avizrat@intel.com>
>>>>
>>>> Apologies for the long silence — it’s been a challenging period with
>>>> the Habanalabs-Intel merger, but we're back and ready to continue
>>>> contributing.
>>>>
>>>> We'll be moving forward with our roadmap — upstreaming the latest
>>>> HabanaLabs driver, including recent changes and full support for the
>>>> entire GaudiX series.
>>>>
>>>> To support this effort, Koby Elbaz and Konstantin Sinyuk will join me
>>>> as co-maintainers on a regular basis.
>>> Should they be added as maintainers in the MAINTAINERS entry too?
>>>
>>> Are you going to pick this up and apply to the Habanalabs repo, and send
>>> a pull request with it? Or how do you propose to proceed?
>>>
>>>
>>> BR,
>>> Jani.
>>>
>> Yes, in a later patch, they would be added as maintainers in the MAINTAINERS entry too.
>> Regarding your second question, we should start with merging Ofir's initial patch.
>> Any additional/upcoming changes will be initially merged into the official HabanaLabs repo as you mentioned above.
>>
>> Regards,
>> Yaron
>>
> Acked-by: Oded Gabbay <ogabbay@kernel.org>

Reminder: can someone pick it up, please?

