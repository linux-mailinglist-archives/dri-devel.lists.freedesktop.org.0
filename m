Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 550A9900BD7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 20:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72C910E076;
	Fri,  7 Jun 2024 18:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yn0MmPhK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7DF10E076;
 Fri,  7 Jun 2024 18:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717784360; x=1749320360;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p9cfCMk6jyBsBLaEZyQu5NE4wY5dICEBAuD0zdUIrc8=;
 b=Yn0MmPhKdKRUo32l1ZCBQQJOZDi8897HUpyRAHmZlyRNOKrIUT48qcYr
 BEYefeJ0JfnmU5vZw9/wBYDlq7kdf2L47hGbATzi9tY0tmpiSI+LuAeW1
 mCHgo2yG/RdT9nYqHWHJaThGAz5siNJFzENkFJdRHR5PrVN5Htywyi6/R
 UbeKJ3wshHhff8ZsKIgMxKPnM+MEsyYikLavObCy3Z+0idDhMMy40XqJJ
 4dIliWVlTBDhbXa7bYjL+zOqQ3TBFZLeCxc2bQ2kbhG5W6r0VJ650qtkR
 xVY32LPXHv8h60O9fwPNE7UerqW/8FBpWAL1X2AK7O+6ZeQoZ0ztj0COq w==;
X-CSE-ConnectionGUID: u9M9nekET0mnts1h1DM8mQ==
X-CSE-MsgGUID: tMxIEZ4nT9qc7hdQ5x1ZpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25173207"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25173207"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 11:19:11 -0700
X-CSE-ConnectionGUID: wqv2Ewh9Rh6FmSJPxaYGFw==
X-CSE-MsgGUID: 9ExqPaocQMOLnmS1GqQkCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38976378"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 11:19:11 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 11:19:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 11:19:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 11:19:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ka4JxezLAnftwM+hV4O4MdD/RnWYXUZW1iX3DYSlST+e88VDNMzZ18eAa1LiKzG9nZ2ruZltbPvpuZU95NEqXi09FwGKycEBUrn164TlE2qH+vICi3FeJVJhBhDf+dvtnPygCgo/yrvVb5UlmRUUuZsbOgJk1eLBTISGPWojbC6FZW7mAUAXnqGbBsKoovccZydAx2QBHPYPLgB6K6OKfk9pD6JrxJ5JNMoRqsWPLFc60uNxOzYRrCnkEuqY971QrG65kArR6nyJ0belZJ3PnyflValPkfB0Xm/SgbxSmoVVAiRs7lJU1vxAigUOtJtYLE24H9RA1jchXtBvLRojRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Q0f7ofXdMwGAvgK08mhpwvNyehjWqV4kv6U965uGq8=;
 b=BHJ4DDGwF5eIWfzvTRRWTglyZd8qs3czQXlGwT6dlaAJGaQttjJip29PdoidBh5h2Kwa3zcBO+CBx2jQn0Pdz5nQuva/o5NLoIaaKhY0yBa/Vq7A+E6kl73AtdaVHmNe3SUY9uBkZEXmg1DB3MJI8w61jfhtBMHAIhcChi2AI0W19TEW/IayHAJdjW8DMQhfWyRC8AUSru1vYdwqtF7bLcv5pxJpytLVopdHzJKPVrG5WqUOP52sy0aGQjWWw+/VJ+f2OdvXSh7yfChSO0m8+I/IbXIDHR7QN0HmRnaiMJa0a+61cmpvWbiJcdyt7yaCzZh97W6NPeudq25PodRXaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS0PR11MB8686.namprd11.prod.outlook.com (2603:10b6:8:1a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 18:19:07 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 18:19:07 +0000
Message-ID: <185a4d70-4f1b-4b95-acc2-d2e26cb0052b@intel.com>
Date: Fri, 7 Jun 2024 11:19:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt/uc: Evaluate GuC priority within locks
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: John Harrison <John.C.Harrison@Intel.com>, Andi Shyti
 <andi.shyti@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 <stable@vger.kernel.org>
References: <20240606001702.59005-1-andi.shyti@linux.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240606001702.59005-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::34) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS0PR11MB8686:EE_
X-MS-Office365-Filtering-Correlation-Id: 6168a0ec-3d9d-4a82-b272-08dc871e51a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnI4Rmg5OGVPN3FzcVVPS1dGL0djNUw3RGROUS9TSE9TcG9HZ3JtcVAvY2k3?=
 =?utf-8?B?UThWT1QvbDN0RG1scEZuMnkrU005OUdJQ3pmek9YdDlSemdWQzNYbWNNL05x?=
 =?utf-8?B?WTg5SHJRMUpIQXRqVzcwdmhpWkdlL01kM1pKdUhxa09BV21POWhMZzdQZnZv?=
 =?utf-8?B?OXUycUFhWkQrdEVCTk1teWNielRpTnlxTVlQdnpWMnBIREVrSHZZSlZBdDV3?=
 =?utf-8?B?NSs2TjlVNU9HS0Yrd2tJdmhGeGVsdTdsbzgxZWJpYlU5R2M5eXNNVmszOWVs?=
 =?utf-8?B?WmlXOFZ2WlBqZ0ZQRGcrc0JOT0t2d1pEbU9BWWRLNGFrMXJPeXk4RnE3UHVp?=
 =?utf-8?B?RjRJaFFRSXVRYlkvcjNHTytqeW05M1czQmFVcUhtN1JZbm9ZVjU3T2txZWU0?=
 =?utf-8?B?ZlBuNzY5cVptSzVTbnZmZHc5Z1I0K0xYN01wT29BalR6Mmx2T3hNQlAzdHVC?=
 =?utf-8?B?emxlY1RJUVZoYmtEMlJHckRxUk1PQThaS3BSMU9USjVCb09DZi9kZzJUbzFL?=
 =?utf-8?B?VTRoQU5RL3p3ZGNJdTFPU09zclNiNUtDWERoS2wzNURZNTVqcEhwQWRFOHIx?=
 =?utf-8?B?Uk5zMkFOQ1VxL1VrZlRYSEhMTUFYZ0twT2kxMm1raXRTMlMrVEV6QTNaQ3h4?=
 =?utf-8?B?bTZKa3JjTmtIZncwZEQ1RlgyL0NWcVpnTWRiOG1vcnI4YTVxcC8zczZkQmdu?=
 =?utf-8?B?OFBmazRWa0p0bVlzV1htTWhITXNEa0FpMWhHU0o1THAyNHQ4N0cxSWs5YUFP?=
 =?utf-8?B?dUZzSEp2RjIyZ24rQmhvVjhRdms2cGdRN0t1TENRQmM4Qk1nYUovVXY0V1J4?=
 =?utf-8?B?anM5SkRoY3gyWmVmZ1h3dzg2djdiVVJmNjBoYkYrYWk3RVR6RHFuTkNBTmMr?=
 =?utf-8?B?Z0pSTGlybzlPUTNGRjMxSHdaMjdLdG90ZEcwRWxiTjU0MGNRaHFXaW9mdnFt?=
 =?utf-8?B?RTh2V1dDMTgrZWE2aTAwUWl5UlZrUFpwa1FodlNTWUZkbjJ0bEVOTEdWTXpa?=
 =?utf-8?B?blRyUnRLWkpYbm41QmJKcFQvZmxoMG1YUGx4S2ttS0hmeDhOOThVREI3OEF6?=
 =?utf-8?B?WGhIamRHNS9kSDRZeDR0eDBpU3hFd1VMY21MUG4yL2doOHVDdmJuSXFocm5p?=
 =?utf-8?B?T1l6N2hneUljZjBmY28zVUhMbDRyaElJUjdKL3JDSk1lMVd5TEt6Sis5QlVY?=
 =?utf-8?B?VFZaSHBKcXYreXBRZyt2K2NWSlg1S0pkTFNqa3Z6OXllNGpiNHNQbk9QcmVN?=
 =?utf-8?B?L1lNZ3c1d0xKMzhFbzM0STQ4bDViY2c2MlBvdURTa1oyU0xva1k2a1ZNU2l6?=
 =?utf-8?B?OTUxWGhJN0w1UDlYWEhVUzF5cDJlOEw3WlQ2b0l0d1NNblpxbThGVXBmbm9D?=
 =?utf-8?B?QndzN1hneHRPUXhtZ1puQnZsOFVjNkx0blp5V0lsTTJnMkg1TEJ1VUwzaVpS?=
 =?utf-8?B?VkVuMXZobEFGY1B1cktuRTBIb0pYU1drT0RpeGpwclZmN3V0RGJuNUtMaFBW?=
 =?utf-8?B?OXRwbitLdFNRc1RIaVIwRXNvaXdVUE41Ykx4TFBPbU9sNTN5VnpkWWdieFpL?=
 =?utf-8?B?UnRMblBobmVGM0J1a29HVU02NlNjbFBHTkJtVWVaeW8rcVZ2azZOQ3hXQ1Ri?=
 =?utf-8?B?VzZFZnZqeXlZaGdKR2VyNmZDL2ZYMlpUd1hFSXhxaWdzMEhyd2FCQ1RGVTVz?=
 =?utf-8?B?cVovU0hxOHA0cGJxeDlMcTdVMmE3ODZ5RDc0Y0YxcFA0TWVwL1gyQ0JXUys0?=
 =?utf-8?Q?YmD3IbTaNunuFrKUw9zGaSiaGvLx8EvJUtSrVnF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1pGY3I3OWl1Z0pBVW9aZjQza3RsUE1Bdk9DaHcvbGZveDNmVjJDTllVNTZl?=
 =?utf-8?B?MCtSRDF4bDJZWmZCbkZRc3dhVUg4WEJURlJodDVFN3pZQ0hyTWlUQ09BZVZ3?=
 =?utf-8?B?VitZcGRNYXowQUt2OFR4eVF3Rng5N0dNa3FkOWVmNTIyb1hmYk5Jekd2akpo?=
 =?utf-8?B?OU5DTDJ1NkFQNkI4ZU03OVhKWWFOVlIxNWdOTGdqRkNsSytuOXZjKzNkdllP?=
 =?utf-8?B?UkRTOU42THdnR3BidjhUVEFlcE8vS3V0VTVORlUrdTE4bE9iYU5LOEdxU3lE?=
 =?utf-8?B?U0NlMDVkN0pHaFR1MCtXejlyTG9wanFLVWJleklKalc5aTlPVGpBNjlKT3hS?=
 =?utf-8?B?UjA5bVYrOVV5b3hLemdnZkFpQkVIcXc4Q3EwR3M4bG1Zc3RCcW1XQXRQd2hI?=
 =?utf-8?B?QmkvU1pGQlJIbnNGc0R6VEFnQnBhWW9zei9VY2t0d1hDMDYwR3RZcURtTkdG?=
 =?utf-8?B?TFZ3dGNHZVZqay92UU5aai9TT0ZLMCs4ZUMrcFUxT3R3aU1TNE5oWTkzbXo0?=
 =?utf-8?B?ZXBJUjg4cmczRWNkZnF1amFQWFI0UCsrWDU0TzJDdTVJYWRQdVlZT0JNcUo1?=
 =?utf-8?B?S0tnNngzU0pMSlA5aGdiaG5wTFV3K2taSkFRYzNwdVYvZlY3a1VQMTVnUXVh?=
 =?utf-8?B?L0tnTjlETWsvTHZGeEsxVUlBZmZwYTV5R0UyZE80SFFxSnBaMzMwRUNGNGF2?=
 =?utf-8?B?dkV1cHpEZzVrOHFzTzVhMElxRTdHYTdiZ0IybUV1K3BxVnF0eDJtZ2h6QjYv?=
 =?utf-8?B?WmxKOWZBU3NMZmtsOE5oRzhrSHpvUTQyZWJ0bW45Ymk1aXVHdVBTY2dkQWgv?=
 =?utf-8?B?SFpRN0dNWTRqWmYzNGp6Q3lCc3RMN1JyVm1KS1kwWEpzdktmWWlHbHBZdnlI?=
 =?utf-8?B?RHh2M0FiZEQ1cjI2c1NFeXIxK25oUXVYY2V2YXVhQ0xraCtiOGxTQmIxU045?=
 =?utf-8?B?RGxHSWNUMVB3eUZVSzlSb0VvQW9tZjk3aVdBSE9EaU5rU3U4blNvTURleVBZ?=
 =?utf-8?B?RktoQ1dRYU5pd1c4OXJabUVvUEQ3MU5BR3ZyRWRJWXpLMStBWGx2RG9MdEMv?=
 =?utf-8?B?VUxqTVJKc1l6RWhWeXlsYnAvL0ZxWmQ0MElTWjhCZ2t1NEtOckc0ZDRSK3R0?=
 =?utf-8?B?RlBRczJPa0dyTFRYZ2pSZnpYOW5IRU5LR3NGVUx0cG5uUUE2MFEveDZabUpr?=
 =?utf-8?B?UWhxdFVTM0xEUDJVTVhRbGFYM2tTQ0lkSlhpcjV2N3NEbXdmTGd1UkZNakx1?=
 =?utf-8?B?WXBBaDVWZWtveGJ3TllLMWMrV3FsVGZiSXBiK0FDRU4wZzZqcW1XR2FvMXpk?=
 =?utf-8?B?ZGpqcjkxN1hyTXZqSWhnN2g5ZUpyOTJVT0xyQlRnbklQMlhBWUt5K3AvaThM?=
 =?utf-8?B?SjZHdkk5NDFXTWpUak1XS0Z1S09oV21KMnBUY3ZPSUt4a2xYTTNua3piWHlM?=
 =?utf-8?B?RlNNQVd2YkxUbDA1d2t6bk50YWpqWXNJd3NHb1c1M1BnZ2hEaWZ3dUFOaXpi?=
 =?utf-8?B?U1lIdm85YjJVT1BzM21qU0JoTi8vZVp4U3FzT2NydU9xSFl5Mmc2QTNVR3ZO?=
 =?utf-8?B?RWxObWZkSml3ZUcvUmJxRS9jSzRSMUQwZ2QzUDRPWjEyRUFnditTcnVGV3N4?=
 =?utf-8?B?aXp0QndENS9TVmJHdC9vSXVvUWpneXA1RjNOOUJpd1RzZGdzcmhsTm9NWDRD?=
 =?utf-8?B?a3B3OWlWNmFzWEtnc3Q0bTNOU0J4VVBDUFVGY3ROT2VMWW5WRTNsQ1FmdCt6?=
 =?utf-8?B?YkI1TVdteWxKWldPWVVkK01raWlNYWlyWEM1VE9YVHZRdkNYd0JpSWdGQno3?=
 =?utf-8?B?RzhJL09LNlUyOHpCOU5uRkZuekRoUGlSSlhZMFRIYnZ4clc5V0w0UUJSTzJZ?=
 =?utf-8?B?ZmZ0b2N1YlFnZDVjRTRBVEJlTXEyRlc1Ny80czhqOFArRDd6eDlaWGREd2Zk?=
 =?utf-8?B?S1NheFJUaVAwam1paGVxbHE2M2Zjekd4a3AyYjRBNzVRY2lsalBTbTRwTXEr?=
 =?utf-8?B?VHlEYWhRTmlpdW9HWS96K2xaeWpIUmtkSkVFQy9Qd3djWWVRYWFwZXRQVjRQ?=
 =?utf-8?B?K3A0VExhRkgzWndNTUU5RWNHVnJTb1Qwakg4VWJUTHF0a2FZUW5vRVVtZ2Mw?=
 =?utf-8?B?cWFxRGV1QVAwdjVRRjBSYkVuRWxWQ2gwVGtUKzlEUWh3c2F6RlRmZldIcGFl?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6168a0ec-3d9d-4a82-b272-08dc871e51a7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 18:19:06.9766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPnGi6Pf31JeiMEoA9LYatOMvAw/pc64bTAOh7X0CJN1dxTEJCYtFs+lWFcFyiuh/NPTVzB5DgTPXEtwt+fapTQjHVy+SUmtqeEtoMzSoN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8686
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



On 6/5/2024 5:17 PM, Andi Shyti wrote:
> The ce->guc_state.lock was made to protect guc_prio, which
> indicates the GuC priority level.
>
> But at the begnning of the function we perform some sanity check
> of guc_prio outside its protected section. Move them within the
> locked region.
>
> Use this occasion to expand the if statement to make it clearer.
>
> Fixes: ee242ca704d3 ("drm/i915/guc: Implement GuC priority management")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org> # v5.15+
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 0eaa1064242c..1181043bc5e9 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4267,13 +4267,18 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
>   	u8 new_guc_prio = map_i915_prio_to_guc_prio(prio);
>   
>   	/* Short circuit function */
> -	if (prio < I915_PRIORITY_NORMAL ||
> -	    rq->guc_prio == GUC_PRIO_FINI ||
> -	    (rq->guc_prio != GUC_PRIO_INIT &&
> -	     !new_guc_prio_higher(rq->guc_prio, new_guc_prio)))
> +	if (prio < I915_PRIORITY_NORMAL)
>   		return;
>   

My understanding was that those checks are purposely done outside of the 
lock to avoid taking it when not needed and that the early exit is not 
racy. In particular:

- GUC_PRIO_FINI is the end state for the priority, so if we're there 
that's not changing anymore and therefore the lock is not required.

- the priority only goes up with the bumping, so if 
new_guc_prio_higher() is false that's not going to be changed by a 
different thread running at the same time and increasing the priority 
even more.

I think there is still a possible race is if new_guc_prio_higher() is 
true when we check it outside the lock but then changes before we 
execute the protected chunk inside, so a fix would still be required for 
that.

All this said, I don't really have anything against moving the whole 
thing inside the lock since this isn't on a critical path, just wanted 
to point out that it's not all strictly required.

One nit on the code below.

>   	spin_lock(&ce->guc_state.lock);
> +
> +	if (rq->guc_prio == GUC_PRIO_FINI)
> +		goto exit;
> +
> +	if (rq->guc_prio != GUC_PRIO_INIT &&
> +	    !new_guc_prio_higher(rq->guc_prio, new_guc_prio))
> +		goto exit;
> +
>   	if (rq->guc_prio != GUC_PRIO_FINI) {

You're now checking for rq->guc_prio == GUC_PRIO_FINI inside the lock, 
so no need to check it again here as it can't have changed.

Daniele

>   		if (rq->guc_prio != GUC_PRIO_INIT)
>   			sub_context_inflight_prio(ce, rq->guc_prio);
> @@ -4281,6 +4286,8 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
>   		add_context_inflight_prio(ce, rq->guc_prio);
>   		update_context_prio(ce);
>   	}
> +
> +exit:
>   	spin_unlock(&ce->guc_state.lock);
>   }
>   

