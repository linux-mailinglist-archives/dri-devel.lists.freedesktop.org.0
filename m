Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13435AFC3E5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 09:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F21410E5A4;
	Tue,  8 Jul 2025 07:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aSS80j7m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C4F10E5A4;
 Tue,  8 Jul 2025 07:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751959284; x=1783495284;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mdmPwNkeCH49vb+3tEvLmWG1OUaYsnF+qLr1xSFS7pY=;
 b=aSS80j7mcI9N+V5giirmcd0bbJwKUu2zUkCKmo1pRoZnZ1eMNj77xJqu
 GxuBmPk7CVf9BMdJGe7TobhGgcWrygGnM5TWKT1xGHwwFkK/PrZ3Rg0nh
 Z/RKuolhV7cCed4ruI/y94kygbu7MZPRC9DvyfJpafSoSdumiCDEz5Ylx
 kyTtjaqeCWmTmLPoXfMjmCKmA2Iocu5F7do8lBCHy1YZaUuH2ek5UtjXP
 qStNKcFGwxQTmgEQ7VansXTrjekibNqfkLijVohzMw7IAq2xH/gBLKAnR
 K6A3pot6A7XenRJlrRdda3/mpmI6SZt7RHI/761BJtEuR13XRAev2lR/9 Q==;
X-CSE-ConnectionGUID: QiR0liFiSx+uDlxtMp/5Rw==
X-CSE-MsgGUID: tMVfR9ZWSsKpE14v+9o9+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53903211"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="53903211"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 00:21:23 -0700
X-CSE-ConnectionGUID: daw+/QilSR6B6QqzuKWi8g==
X-CSE-MsgGUID: s9OpbqkWRiyE2526k1a3tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="156004186"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 00:21:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 00:21:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 00:21:21 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.56)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 00:21:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWy6Pbl3cxRVROO1NfgCFwH4thpRisBQaEZgPS1/Sbf4gx5LfaGUmYKWG8t45ft/eXpgWS8Ln4Qmpi+rkjZ/LjCv4sl2T3GJvtFg4oqtLesVDHL46OI4krV5rhK3BkxFoUHgErG3yJ4isqqJC/J/r55PmKncxtl+jKwZ9/vk6W7wc8G7VwW43LfjNfFRMchxhbj4R3pUR7bB7Ho7ks4E06NE8PX4/ILc9QoovpCQk6iGklE7HHhkXk31Cc/5zPaltaps+976j+Y5o7GtMLik624LSrhFX8IGqI4oj/D2smD+RJ/vOy0Rnm8AKo5Yq+wpfWBSBScm7xYzfD6mI+euJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05NyFLN9l3O179LCWG9U89N/bICyNYqzug1pA++AEmA=;
 b=IzIzZCylZt/YBviv56GzL4IpV3sw6jGWvwgGTA87iCazwrwZ2kcbciqBplbhGtmbn8FgcWHh6LE0JjDdj3SGrRtznCSuehiqLdPlUSrcc9FzkhHRsk894XRMm+AH7kTC7m7BMVvyDoqWfwpvgZ9/Wi8HS/+cknIq9ylAYyJ4UdzYnzN9mJN7KmaaflJQer09X2brlEK3Qyhxhc0WN64Ns0kOKabr9nnJAZofz7iHzAhx+fs24ErZwm4+n9kP9sQ1cnSLjxzV4Rzj2Qg5xe7+hoNey6bAh2s7sKmkPqIqayPokSDD17wvfZSfaLgMa5sZ6fr/9KI4t5wM5xD3eoyBLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4906.namprd11.prod.outlook.com (2603:10b6:806:fa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 07:20:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Tue, 8 Jul 2025
 07:20:48 +0000
Date: Tue, 8 Jul 2025 00:22:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>, Simona Vetter
 <simona@ffwll.ch>, "David Airlie" <airlied@gmail.com>, Melissa Wen
 <mwen@igalia.com>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 <kernel-dev@igalia.com>, <dri-devel@lists.freedesktop.org>,
 <etnaviv@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 7/8] drm/xe: Use DRM_GPU_SCHED_STAT_NO_HANG to skip
 the reset
Message-ID: <aGzHMu//q1uCfNDu@lstrano-desk.jf.intel.com>
References: <20250707-sched-skip-reset-v4-0-036c0f0f584f@igalia.com>
 <20250707-sched-skip-reset-v4-7-036c0f0f584f@igalia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250707-sched-skip-reset-v4-7-036c0f0f584f@igalia.com>
X-ClientProxiedBy: MW4PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:303:b9::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4906:EE_
X-MS-Office365-Filtering-Correlation-Id: e49d0f87-c1c8-41f6-e4b3-08ddbdeff66a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkFUOUN6UFBJam9lNU5FKzBDS1NjQVRvRHpDWWtQdVhZYUdVY0EyVjZFaWF0?=
 =?utf-8?B?ckpFcXpWS0lHVUkzQkk0ZlBiVzR5Tkp6S0pEVlFaN0I4ZkNDbXN3Q1AzRW0y?=
 =?utf-8?B?R1llRlBKR0xuQjVwM0Y1a3dZUWtoVmNKLzd6LzhNQnIrbVNSUUJxZm92SEM1?=
 =?utf-8?B?N3VxQTNDUEZ2UnJEN3NuV1M3VWFOMHlQMU55ZVdIbldIR3F1RzdpdWNaTlph?=
 =?utf-8?B?ODlKbllXK2ZGenc3TWg2RUg3ejR4cHh4WFBiS1NhQUtOT1lDcWVxYWplaXB5?=
 =?utf-8?B?aDBwc2xRRkdJZHJvMFUwTXRCc202UFk5M1JtaWxXaXA5ZDRiQVRoTFZURWw0?=
 =?utf-8?B?dzNqdnV5YlJCZEhPd2hCZDdYeUZtSmN0OGpoejh4MUxnU3NpNzBBWllwZUJ1?=
 =?utf-8?B?SkE4VVVkem51MU5HME5kSGZGWC9lU2c4YlNTMGZKSDlsazQrWXUxa0gweU9Q?=
 =?utf-8?B?MVZNekdZLzE4MnZqeTIyMzR6ZXFNWGJTc0ZhYnZVUmZsNzV3YWZlejFJcE1s?=
 =?utf-8?B?VE53RllIR0MyeGsydXRjb3ZCNUs1ZlZFZDRpNzZQWjV5cWE1cnFuWEpoUEVn?=
 =?utf-8?B?VzJpWjdvRVRzS3RWUzR4THlKbnF1Y1lFZG83eXZ1c0RQUWN4ejhIbElOQXZv?=
 =?utf-8?B?MmFYV29nTHpaMENsbkMxWC9OMzNldkFJTVZPRGZFeGlMWjNpS1RoSm9JaW5z?=
 =?utf-8?B?RzlhZEloWkc1MmJRR0NoMmkxMVF1eW9ZN3ZVaVhFL1NYdEpvM2NCMVNwdk9Y?=
 =?utf-8?B?ZUxOTmF5b3ZsMjVHNUdmMXkzS3dReU0vbHF3cEtNOWk3TW55cUFBMW9vSDJ1?=
 =?utf-8?B?SE1QSUplZ0xBRlhUNTQwcmpKdHdVRVRCbVlXcHM3VWI5NGNwUklQKytVUjk5?=
 =?utf-8?B?QVF2RFE1MEFsT1ZDMTJuQkxJd2doKzdpTjZqWDhKd0NncDhXUjBjUTBKMmhI?=
 =?utf-8?B?cDdwU3ZuMGY1OG95NFNqc0lxVVRpd0UyNkZOb0RHYXVSQVQ5Nzk0ZnpTRDBv?=
 =?utf-8?B?M1hSV253RkZScjJ5cUpobTNKWnUzcnJTRi9zM2dTMG01bGpVSE9yQ3JVa01Q?=
 =?utf-8?B?WTdsZVVSd3JqLzAvUlpuQXJ1NUNhbGlselVEMmJ6ZDVRRlBuR0dkV2JZS0Zy?=
 =?utf-8?B?V0VsUFR2UFpab3cydms3dXZwWlRWV05hUVpNVG9Ka2NPSGl5bnhHZVREWWlZ?=
 =?utf-8?B?VHRCOXlTYmtrNlI2L1VNeU50dXoxVEdwUGlnY0hneUF5b2xzK25ySjVzQnFT?=
 =?utf-8?B?am11OVBEY0Q2a0JsOVc1QS8zTW81NGIrcWJSQXc5Z1NzWnZ6UUhnclU5c2Ns?=
 =?utf-8?B?STZJUTR3aHZ5RGZ4QVRzSjEzekkzeDI2ZHJkeVVKWmJjWjJnSjdXNGRodWtX?=
 =?utf-8?B?Y2ljTG9jNElBcEs0QjVWTko3TEtGTFRBK0QrcVdGUEFhZnNtSXpaU3lCU3Bu?=
 =?utf-8?B?ZFc4TzI4dHdhcmI2amZJOWxlMHFNQ1paOElDcEFuRE52VGxEaHRTb0I3QUZP?=
 =?utf-8?B?TUZHbHRNVktKb1Z4Mzg5ZVFGd0lUQjdzS1Aza1N0M2RzOGxiVk11OTdmQmFK?=
 =?utf-8?B?OUFVZVhEODJESmNGMFJxOXVzQXB5R2VLZnRlR3dBTE9MYktmRitNZVpJNjFC?=
 =?utf-8?B?VCtZUE4vV08xdU0rY1F0VDhDU0cxOFQ3TDZzdy9TM0JkV1pva3h5TTZEUGJE?=
 =?utf-8?B?aEduOWZjT2s4WmxuN3lHdmNxTERCdTVzMmFSRXBSNmE3cTJ1a0tMcHZYL0wv?=
 =?utf-8?B?VzFTRzFIeDVpQUJUS0hicWxRQ0VpOStHUE9Cdi9HVEN4T0s4c000ZzBXZE81?=
 =?utf-8?B?ZWhQb01oV1FpVTZkU3RtQVV4UUtjMUpGcytrY0VYVG0xRzZ5Znd5UDdvbXA1?=
 =?utf-8?B?REJ6RC9TSU5jckNBMStWZGdYNi9rbW5XSVhRTFA5V3JFSHpHYnBHcEYyajFp?=
 =?utf-8?Q?ZxMwvJKl7Rw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkxCMGk5c1I5aHd6bnpOUkJWVkRRaXlwWXU4VEIycUk4QjgrM3lPRHhpQ3pE?=
 =?utf-8?B?QklNaTRUeEVaZlBkTGNDbENTQndRbElQZklxalU1ZlhNYTZnNGt6UDNoZWhC?=
 =?utf-8?B?dUFhRm5SMlJ4ZVB0TzdYbDRSeUlwQjNZU2FnbzdENy9QdmU4MTkyMk9IMEtG?=
 =?utf-8?B?dFRLNUNjWnoxczVXa0hQQk54ZXAzbHZ6SkphS0hZNjFva0lKUCtndmJycGFP?=
 =?utf-8?B?S1lTN0prdFVLQVZxaFZHTm5kNzZvaVoxSjMvcWRTb2lYaWV5anYxeWoxZWpI?=
 =?utf-8?B?N1QrK1dkT2VxQ0dwd3J3T0ZGUWs0NnJGREhVeVpNYU8wOGpya0pvY3Zxb2Y1?=
 =?utf-8?B?bkVUR1daajdnM0xxdXRGYndlVzlBWFdFSE16OGRkbXBHYkRDWHZDaHpGSFZV?=
 =?utf-8?B?RWltYVdEd2NkNlQ4NjgvUmVlMkZCMnFBYjduNm03MVI4MDFFdVRFR1BnTnBB?=
 =?utf-8?B?QmNEaC9FSkw0ZElBc0ZVc1FSR24rblcrWjVCemwzZ09ja2VXY2xRMExYNnZF?=
 =?utf-8?B?a1ZXQnVRNTV6anVZY2VVV2xPc0k3Z1dtcGFTdXNHWVBNUFMvZldDeGFSTVVT?=
 =?utf-8?B?Y1VPdkx1VnpuQ3UvbGUxTGJMRC9ieStMV0RnNkJZVU1vN1VxM3VoL3luT2Jh?=
 =?utf-8?B?MW9zTk1XK0dVYTFUUXMxSVFhNytIUEllVFQ3ZVArUWJxUW03dHhPZy9nT0Vw?=
 =?utf-8?B?eURwNzdETHlzWWllbGlOUFJ1R3luMG1zWmlpMEljM0pRcGVPNjJqd2xxYkpN?=
 =?utf-8?B?dmdkaEpKRmZJOU8zRi83a3pCRnJwTTJ0Vlc2blV3MkdpdCtOYkhidnNFLzJE?=
 =?utf-8?B?eGJ0Vm5Na0RnS29mcmVyYVE0RnFHeGJRd29QV2t6WXNhTS9rTmVJVnVramZk?=
 =?utf-8?B?YXFPbjN6WnIwSEcybHZSa0lWNVkxd3lScnZpQ3REUmJFRUV3Q1FCeCtoUTVq?=
 =?utf-8?B?UFhUK3dIbC9EbC93OFF1OUhDWnFZZ3E3WW9WdTF3TUdBZzdBa1pKODBKc25x?=
 =?utf-8?B?QzkrQjhaVjVoL1Z3UmZGN0UyRStFemxkeHdqYUtMaWJicWpnOUxrbkZTdHFX?=
 =?utf-8?B?UFU3WTEzeG9CK3lEWUI0SWZSRXJQa1hsb2ZGeE9TWFVRSWZKeEtmck5wcTdQ?=
 =?utf-8?B?NDU1enhJSFF4Nlk3Qk1lZmFkY25Ib1o0ZVpmbjduSWgrRzV5K1ZpYUxjVHhB?=
 =?utf-8?B?cGZmYTNtdFMvMVEyV2pld05DaXdoMEN3ZVY1MUhhUjR0d3JZeG9zQUN2akYz?=
 =?utf-8?B?dzBhSmEvTHRwSnJHdTRVSWFGUGtUTko4OTI4SkwxY2xpQnRhL1NRWThhQkwv?=
 =?utf-8?B?dHpiTld3dWovY1lHNFQ0eE1lZWR2VHlJdTRPV1RheDFqMWxQZVY1NFlpL0N5?=
 =?utf-8?B?L3F1cEtRd0x0MU1KWFJYVkZyS2FBcUR1Z0N0VmYxZVZFOCtqb3dKZklEalpj?=
 =?utf-8?B?M0cwLzVQYlhsWFM4WXR1WW5CTXBOTTR1cWNoWG9IOEszUDFDSWoxQkppYldn?=
 =?utf-8?B?OEZ5eTJ0MzAwMGJXOW1TTkxQQ2U2QlFoZGk1cW1JS2t5a1BzdENqVXhIMG8r?=
 =?utf-8?B?Uy9Vb204SWJERUlkM21KcWJ0d1NxNlJzdjEyR0MwQ3hQWkdHZUtmMGM3T0ZI?=
 =?utf-8?B?RjZLSzlLK0lsT0h2TXN4Wnk4S2NSSGUySDBHam84SVhYT1AxWEQvM1o4eHgv?=
 =?utf-8?B?K3E5Y0w5dDg5bW9xRUdtNzNoYWtFN2lBd0FHMXkxY09CdW8rS0ZtLzlkUVQv?=
 =?utf-8?B?VmMxZ1BlT2xVSEp0NjYyMUF6czRZMllROUJxek9sWjlDM1ZXdGdNaVN1ZVMv?=
 =?utf-8?B?NDBmalBTenR2ZmwrVW1JVjlRZER2ZUFiYlJVOXQzdTJMalRHeU8wdnBsTnVa?=
 =?utf-8?B?TmdjYzZReWlBTVVtNFJQYURMS2kydUJvMC9PT1dxMEZ2bHN6em45cjBDQWJJ?=
 =?utf-8?B?MlNoUVBrQ3pYRnJ5KzZzSDY4Z0EwelJjZkdPNWwxUmEyNXJDT0JjSzNWcGl6?=
 =?utf-8?B?cklRWUJjdEwrTFgyY0hkc0x2TWxjMnZkckRSMjl3dUpFak5JVy9rU3NPMktW?=
 =?utf-8?B?cGp4Vlo4WFpNb1ZSSW9wUjNEeExSTThUWFIrOFgwOFBkTVdJTEtsVkYrREpR?=
 =?utf-8?B?Q2xaSG1rek9XMDByZ3EwNm1KNWFoY3REdHRENUlhYmZSUnBNZS83aEhJVDRx?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e49d0f87-c1c8-41f6-e4b3-08ddbdeff66a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 07:20:48.6856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJXXV6F7fml4x5WV0N/x1qwujimL40Mjh+H3/JzhimFaya2WoLZgnbMqTx0dYmw91J/LIPFJ6qmjqJqhhBKPeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4906
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

On Mon, Jul 07, 2025 at 11:46:36AM -0300, Maíra Canal wrote:
> Xe can skip the reset if TDR has fired before the free job worker and can
> also re-arm the timeout timer in some scenarios. Instead of manipulating
> scheduler's internals, inform the scheduler that the job did not actually
> timeout and no reset was performed through the new status code
> DRM_GPU_SCHED_STAT_NO_HANG.
> 
> Note that, in the first case, there is no need to restart submission if it
> hasn't been stopped.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

I'm fairly certain this is correct. However, Intel's CI didn't run with
your latest series. Can you resubmit and ensure a clean CI run before
merging? CI can be a bit flaky—if you get some failures, ping me and
I’ll let you know if they're related to this patch.

With clean CI:
Reviewed-by: Matthew Brost matthew.brost@intel.com

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9c7e445b9ea7ce7e3610eadca023e6d810e683e9..f6289eeffd852e40b33d0e455d9bcc21a4fb1467 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1078,12 +1078,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * list so job can be freed and kick scheduler ensuring free job is not
>  	 * lost.
>  	 */
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
> -		xe_sched_add_pending_job(sched, job);
> -		xe_sched_submission_start(sched);
> -
> -		return DRM_GPU_SCHED_STAT_RESET;
> -	}
> +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags))
> +		return DRM_GPU_SCHED_STAT_NO_HANG;
>  
>  	/* Kill the run_job entry point */
>  	xe_sched_submission_stop(sched);
> @@ -1261,10 +1257,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * but there is not currently an easy way to do in DRM scheduler. With
>  	 * some thought, do this in a follow up.
>  	 */
> -	xe_sched_add_pending_job(sched, job);
>  	xe_sched_submission_start(sched);
> -
> -	return DRM_GPU_SCHED_STAT_RESET;
> +	return DRM_GPU_SCHED_STAT_NO_HANG;
>  }
>  
>  static void __guc_exec_queue_fini_async(struct work_struct *w)
> 
> -- 
> 2.50.0
> 
