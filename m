Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721BAC2AFE8
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 11:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E4210E3A2;
	Mon,  3 Nov 2025 10:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QXy9Ri6z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2FB10E3A2;
 Mon,  3 Nov 2025 10:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762165162; x=1793701162;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+yp+5yLLTGxJR16blKfDzfL3pMVnY0BI1nSNGTdGTzY=;
 b=QXy9Ri6zMjuR/SrFN0FQlbezs3yGRWbaqiAZtlIxXCNUR+vXKMIiAlsm
 8uOp7LtIvNkLp/YBGG7EbNN5abj4jWkgmhzPahVn7/2vyvz1kyAzhAM0t
 pN11a5dOKDc7B2QldvF/dIi26/OvD9N9IezlgMZG1VFjij6bCmhemJeLH
 ydCaYce77A6malckulyrQ8JsCeisOmgd9xYm97R4lfZgPztahA2nl7GHv
 ScLYRwVvk5Iums2h0BIAXVjF0uHMRKuqsS6ZOs3Og6FXyJqwrgK30FZD3
 +z18YCeGUV/M9LAkIVHFTOX0d3nldN9vjiaMAR3wGZWHzr2NJXVsKMWSe w==;
X-CSE-ConnectionGUID: kUE87lbSQIeGoWKlGaA8Kg==
X-CSE-MsgGUID: DkmpSSgvR7GQ1WDjhbAwCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64154400"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="64154400"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:19:22 -0800
X-CSE-ConnectionGUID: rIwE1dntQA2Us8yV7k3w6A==
X-CSE-MsgGUID: 1x0+tVcDRLGZihWG/FR6wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="190927258"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:19:21 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 02:19:20 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 02:19:20 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 02:19:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEcdJYvs4CZG/L30IKhmpXpMg6o0nOA33NCaVa+U7wt+SNAVwb48FaqF7ltZljHAmo94zRtUbSuPnOU1JmPorV9ZIxie+PYmpuoD4cXfVOIbzUF/7r43tBSXj1ujLHwRMJkvM4tkyzOIfVfRM5cWbXbscOFAjw4rWFbsfY+DCgcOc6GMM4c/DOL/Rqt20RI4Sw7Ax6TuS6NusWcsRPeKJ7E8S6aeRg1A2R8W9PA0aYLMCO+JelPwqg4qYiV9sVR6rU4Laf+scRBFD+8zf6/Dp7RVmsgI+rPAW1KRbLq2ch+9rkOdoJNrcbj47cZyK3iUdhhWN598TpeZz1Dk+kJ6gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTvvSOK1WB4fOEabH0CorCeOMFGLd/nVYJRRZQa/8Js=;
 b=Ltfj8Q8/zw/MDej+dZYtyf84OkURNlSkbTi1pjus/P4cyWcFbaPOS6O+rqB+1zYPzV3tXbNkBP6cOxbtmC/E8wiT+v797splvL3zHh9Cd3nCP6+9lWSsR/OsYbJZABcteR8jaEEJ27oHVjh4c2NVkTvxvqXkJ+qgoAEvSkvrKZat+kLMRLa+mUCh7wnTSGQKqFnO4fPSDh3DwRq7geQzKiI3w6DtzJc4bLCiYaXBGUK7nvpga+5ChJSrmyzYKiZG3An1pL/7fiQ3CPhoDb7tuVkcPJB0Tno4CdoyujgOreqKUZB4c3zLw5VPY3Ugc+LlQUxCorPwbO+z53JoxakI7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by LV3PR11MB8744.namprd11.prod.outlook.com (2603:10b6:408:215::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 10:19:18 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 10:19:18 +0000
Date: Mon, 3 Nov 2025 10:19:07 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
CC: <linux-kernel@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko
 <mhocko@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 1/3] drm/i915: replace use of system_unbound_wq with
 system_dfl_wq
Message-ID: <zduzgow2hyvxfzmrhqansber4eeg63av6i533oihvx4ubxdqaz@wu64gw66b4jt>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251031100923.85721-1-marco.crivellari@suse.com>
 <20251031100923.85721-2-marco.crivellari@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251031100923.85721-2-marco.crivellari@suse.com>
X-ClientProxiedBy: DUZPR01CA0107.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::25) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|LV3PR11MB8744:EE_
X-MS-Office365-Filtering-Correlation-Id: 477e0d3f-bd09-47c9-f4f9-08de1ac272a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlhtWWpuZ29CT2YrRXZDVFdmOFN0ZGdNQ2E1dHhUelNwblhaVERCbVpXaFZm?=
 =?utf-8?B?alpJS0VLb2pZNnlBVDh6c3dIaERYYUtmWlRkRE9OOHlDakphQ2R2eks1bVN3?=
 =?utf-8?B?eGp6QVR3a1FXVGRUMWFabG9Bd0RIakNzbHFzMFdJTjZWNW11cWlUaTU0ODAr?=
 =?utf-8?B?b0wxcFMzeXgvZE44UFhHdlp1WXMxRlVQMmhndzlpanI2aVVoaFpFdnk4ZHk1?=
 =?utf-8?B?MVdRL3BpZ1UrdXNQeEMzMW4xeU8vUGpYa200WmcyVXpTcXVWUENxYzlkY2Fo?=
 =?utf-8?B?cm5BWGxma0dURVdWWWFqcGUxMmpSNzVNZlBHT2dqSitzRG9TeHAvK3dvRlh3?=
 =?utf-8?B?QlJQa1c0VHo0ZEhGT3l6eFdLV212cVJ4TVpsb281cERwS3RsMVY5bG5EMDB6?=
 =?utf-8?B?NUlNYzRNSk9jSHVjd3J2Uk1LbkRUbDZVSEJjcXZIeFZ5SndCVG90OVdUejFh?=
 =?utf-8?B?YWZTdVZrMXZnWEpBdTJTRTMrYjdqQ2lDby9GOFRPdkFUempGSC9RTlpMaFF2?=
 =?utf-8?B?bm1tK1EwSW1RbDlmZExwTlJiWlpwaStPazJVc1lKRFlFRitQVitPSGNpSXV5?=
 =?utf-8?B?aENSZGswejh0N3dyeU5DUjl5SEJxeFpvZ1VYNkdGbloxQ3dIM0ZxbytNcXhN?=
 =?utf-8?B?ZG1pUTFBcTRDMHJvK256NCtLQTNiaEx2TDVCSm4rY0x4RUxPZ3orZS9GbjQ4?=
 =?utf-8?B?N1QxYW1sd00xY3UwcnpzWkU1VE9ZTmVHNzhndzZTbHJLbEpsTEcyRmpkaFZi?=
 =?utf-8?B?U05tNjhsZnlVS284bnNDN2ZZQk1RczVxTjVDUk40RWRkVFdUQjNHemRNUmZG?=
 =?utf-8?B?T0RpZlQxVXAwVnpvcXQ4THVORGQ0VEpwRVh2TlJyQVNVa05rL3JQWXJGWEEw?=
 =?utf-8?B?dncvdU5ldEx6c2MzRkVYbHhoRDB5Ymo0ZEtjczN6d2lVZFBBTEhDam5XMk9X?=
 =?utf-8?B?UldPMng5S2czS3dRUkcwTkU1dmpGNmdEZHY3UmM3bzhiL3BDRmZHUXVTV0x1?=
 =?utf-8?B?NWxxeVFtTXVEWU1CVXVLZEZSZmptVDNYcENDMXNBRWp1S3MxSzB0VnJoOUYz?=
 =?utf-8?B?bjgzQ1FqSEQySTQ2bEQ0R3dKVFpKUmFGVndvOWFDUDB5Y0x3cnhQc0NoUWNh?=
 =?utf-8?B?b3ZuTEF5dkp3eUpiTkpkeDRZQzE3T3Bab04wazF6bDAwcUc0UDBFSGpkT0Zk?=
 =?utf-8?B?QUQ0b0trdVhqWkRZMmMrb3hFVWFMU3pYV2F0YTdTTVZsTnBJMlAxcklicnhk?=
 =?utf-8?B?SXZLdnhlWW5Zc2ZoSmk3eVQvSjJzRUwvaGEvOXJXalBYS3VLVC9vNDNmcHhM?=
 =?utf-8?B?TFBqL1BzVDN1UlVNYUZzMG5LdFdMMFNFbXozdGI4enQ0dmFQRXpyNDNSRnVr?=
 =?utf-8?B?cmoxRWVZSHRUTEpOcEhaSWZoUlJBcmlIVkl4dUNISkw4QWxWelVNN3pDZEg4?=
 =?utf-8?B?VFN6TitqTjZRb2ovT2EyY3NGc2QrMGcwODYyN1Q1SXVObjdYeHBpRXQxY2Fu?=
 =?utf-8?B?QXNKY20vTmNQWnJpbXRIUit6djZteUx6b3Jxc1JISEp1OFA0d09WSndQRkJ2?=
 =?utf-8?B?RTdPT1dhLytnSGM5N2hRTmZCY0NHb1JuQ3ZwWlRqOGpSaWRxL3B3TmxoWXBC?=
 =?utf-8?B?Q1VWNjJNcnJXTC9xUjJRbGphSm5pdmdXRmFUWlI0anhLN2NjUmxlalZtKy81?=
 =?utf-8?B?UWpLMVJLSVRtNks2RUtaT3lyYkZWY3dST00xNkRlaGY2RnVDN2hoUlMwRHRM?=
 =?utf-8?B?dXRIRWpTM3pKcmNwT2xWaklWUEd2VFM3M1QxTnp6MUlzck5aMUpxSlFSU2xj?=
 =?utf-8?B?ZVd2TUI5ZXVZbitpeitjWUFxUXZuaEJ5WVg3SFNKUEdwTkxWOWgvNnpzbGpF?=
 =?utf-8?B?NEZxNnRHdEZ4M0xsb3Bqb0tKVzBLZmp6MFZIdXEwQjZrcE1saXRwT1d1eUVD?=
 =?utf-8?Q?JWbZ03tZUZ1xS36hyuoUqBZ/FI1GksAk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3prSi9NN2t4eVYydGlPSThCZ3hHdGNsTHh0RUlhNkk1aG81b3RWUytKWmhu?=
 =?utf-8?B?a2U0ZzJVak5OZ2pkZXp0YXVsczZQMEpZOWljcXdMQW05SU85bnd1UWU1N1Nj?=
 =?utf-8?B?RWZvZlpsMHJFeE94N2JHWHlmbjFEQWYwVGdRajRmMy9BdzRWSzR0K2xuK2Zk?=
 =?utf-8?B?dUo2Sk1XdktyWEx3Zkk1WUJaTTdoMjBKUFFGMDRtcmdia0t3RWdXL1RnME9J?=
 =?utf-8?B?RTFCWVcvL1h3cVd2aHJjMVRpenhVVnRBY3UzVElMS0h4d1FHcHEwUzNEQlhN?=
 =?utf-8?B?bHJtTmNaVllKdTBROUJHMFBubk9zemR2NjBaWVdKOGlJelR0U1dVVEhZeVRl?=
 =?utf-8?B?djhVdCsxWXlORnh0Y2NiKzJJckZJRTFiM0Y1ZWtYcWlCdmlNSjBBZDdWNWVO?=
 =?utf-8?B?OEdRZDVTQytEQmtvaEhyYzhQQzE2d0ZnaHlteExtcDNCVWpwTHUyMFcrT3Fw?=
 =?utf-8?B?bFlhWU14YW04ZHRSVnlmL3JoWUFHblluQ1FNSEcwaGxiQkNSRVQzSlpDc042?=
 =?utf-8?B?Q3lNMjEyYm56RDhSamh2SStEUDE0L2NGVTJ3NG1pa2wvWHhnSzhkaC82dUxk?=
 =?utf-8?B?SWs0WWxTei9USnBxYTBqWThIQWV5QXNHZ0c5MjNvTTRsN0xWZmcxNjMydGNz?=
 =?utf-8?B?WnZvRUY0WEVzcUphYlRHaVZYaysyOTFlM1c2OUVpaFUwSkNwTHJxeUZmTlVT?=
 =?utf-8?B?TmloblFHclRYOTJDNUowRnlxbDFZdHNHRHBOTVFkRk80V3RqUzVSM2JERy9K?=
 =?utf-8?B?Ry9zcXBpV0l6S2dneHJSUFRIM1JlbUwrZHN5SVNnUjZUam55K2ptY1JOUG9N?=
 =?utf-8?B?bHhKRUUyVUNtbnRBZ25DK2plMm1yU3Y5M21CZmtGZ0pZK2ZIYndsaVZTbjEy?=
 =?utf-8?B?OHJBcFFsWXo5aUVrNEZMQ0NHMUN4T1hRcEYxTk54MFE5ZWtaM1gxaGZLYTd1?=
 =?utf-8?B?bFBKcGZQblR6SEhlSXRVK0I1Q3A1TTRKMWt3ZDlCdWNyUVlramhYb2ttVmZo?=
 =?utf-8?B?dSs3QXNGUDgrUXFldXBkNHB3MER3YklMRlI5S2dsV3Z1UmRXM2VObXA4bTF4?=
 =?utf-8?B?R3NvQi90aUFGcUw2SGxYRi9tZHZXUHN3RU1GVVNKY3lTRmMzQS83aW0zemYy?=
 =?utf-8?B?SHk3MWZSZ2dUQS9xaWh6RXJydFo0dzlmWktNSmNJVU94MnBXM2VmWk1GbkFP?=
 =?utf-8?B?UHE1eElKOEtIcFBzYlhsbTd0QjZGVGVzTlJMaEordERxZ25QTVVvS1BJeVdX?=
 =?utf-8?B?RGJteVJZVjNhSUZVbmNYaGdwVTlVL3prS0xPWjdTTWQwd2NWeUNFRjBMRHJ5?=
 =?utf-8?B?RGwwRldPL2xRcjJJb091bU1pWkw0VHl6VEtmdmlVUWg5UVcrSEt4LzR1Ti9P?=
 =?utf-8?B?ZVhrMmtUTWFZNzZHbWEzZ0lJMHhYS2h2MzV4U1ZkK1BITmhSK1czNldPdEJM?=
 =?utf-8?B?Ym9YN0JXTWh4Q3dxNVdzTmdrYzd1VmljNjMrU3c5Z2VHQ3UzZFc0QVpXemUw?=
 =?utf-8?B?WWxKMDV4L2dYVEhUWE55TTBVSUFiUVhIWllHVksyQWRJMTRVMWt0NmlYc1RM?=
 =?utf-8?B?aVd4ZWdVN0NUL1NtcnZxYmU1TjJnREE4OUFJbUtLSWZXYmxmdUFpWFVtbDFo?=
 =?utf-8?B?U3BBK2o1dzgzL3NlcmNxOEd4VzF3YkZYTUx0YThYUFJRaWlybzNRRDZQM1Uy?=
 =?utf-8?B?LzhCUVpBUVRkRUtsdkpPcFV6VWxNS0t0TjRDOVk5UHlRYkFRV1U5Q1hsblNR?=
 =?utf-8?B?OWhDUWFOaTRoaVduaVNzUmc1SS95NmNNUzNPSFBwbk9xZ1dUNlZqcHpjT0JJ?=
 =?utf-8?B?YlVtU2M5VGdUemJieVhzSWljNXZsbWN1Zi9za01uYXVUTUM4Y3ovdzJUN0Y0?=
 =?utf-8?B?YUdJWjNWUEE3bHdEcll4RlJzSko0Q0ptNHNBdjBWSThjUWdiQ1ZsNUJtaGhS?=
 =?utf-8?B?bldEa1laV2x0ZFdIQXk1OEpoTWpKb2gweGRhK2lQWEtXY042L2FLbGFxdDFU?=
 =?utf-8?B?M3BlUUltQjNrR1JnUDNIRnpqT1dUT1o1bVdQeFdKTDM2Tmp3cWV1SnluV0dr?=
 =?utf-8?B?emNoSDdpNURKakVqd3V5MXhzaWhjK09GU2Y1YUlpS2xHcDN3RVRjcnJYbVpF?=
 =?utf-8?B?YlBSMm5kNjBRb25FM2wrTzd6Q3g0aFhCbmN3T29IcFhORndOV1JEU2dRdmhl?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 477e0d3f-bd09-47c9-f4f9-08de1ac272a5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 10:19:18.4569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLXs6D1pEgH5S+tL414U+gZD+TdofTIyvByiJgQ+8qvkinDTpe0Whrs/6a7vx7y05Wk951s6P2SluVgjuCTb30Qtl0pdr534jHP4I8Fdp4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8744
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

Hi Marco,

> Currently if a user enqueue a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> 
> This lack of consistency cannot be addressed without refactoring the API.
> 
> system_unbound_wq should be the default workqueue so as not to enforce
> locality constraints for random work whenever it's not required.
This commit message is very similar to your previous change:
128ea9f6ccfb6960293ae4212f4f97165e42222d - did you do that
intentionally or is this a copy-paste mistake? This is also
prevalent in other two patches, so I am curious.

> 
> Adding system_dfl_wq to encourage its use when unbound work should be used.
Please remove this sentence, because this has already been done.

> 
> The old system_unbound_wq will be kept for a few release cycles.
> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---

[...]

-- 
Best Regards,
Krzysztof
