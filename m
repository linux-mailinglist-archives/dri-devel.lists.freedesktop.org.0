Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 838E7AD5056
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 11:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A2710E5F5;
	Wed, 11 Jun 2025 09:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QEZI/5jG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F65110E3AD;
 Wed, 11 Jun 2025 09:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749634983; x=1781170983;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nSlyPAMXGahfFM/XxklEy2w1uqRE26tNSG7V6uTIceE=;
 b=QEZI/5jGTAruSW4oC5eyOD9VVqFSleYW5Bs/enLnbICSk7ELrs0h7Me5
 MgKbeGtc7+DCJCeHs9B8ActR7mj3nSdO4+Qx7ELz+NJdnEtVy22l9dMAp
 oYflkGf0cJbhVq/5ASJI8HeFqlc+469RI2QUfsl9iJSX28GtPg9rac6Z7
 1nz7DrJwVcczRJbvtPw18oP9knoiAzeUEWSwqoh6LId8IYMCHT7yj8cOP
 /wP0iwEHXQcrvN30vufzIoLFYoSkMSo2Zrf2c+/5lwPewHi6tITCDvqNn
 Ozx4CgS7A+4g/x3a4a7w4JsMWqb5EImU9u3Aey+KcquBcgP3o0C3W4j/Z Q==;
X-CSE-ConnectionGUID: AnWCwnKfRsG0vIjCEtxrnA==
X-CSE-MsgGUID: l6aRuVFfRgKStxeg4wK/7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="63118164"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="63118164"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 02:43:02 -0700
X-CSE-ConnectionGUID: Ph55nz5ETOy4t6eJ+4J/qQ==
X-CSE-MsgGUID: jIgcawe/Q8GoQspotP8EWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="148060172"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 02:43:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 02:43:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 02:43:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.80) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 02:43:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ma2bZLFGTNPc3XE8U/fRbFVoeqY4nDv81Tx8i5q2vLpGs/QZZmXOCMBr1lN0tSRGhdK3Nojyc8xEBC8wkA7Ty1Q3nLNtZmwz0JbFAb3xv74SyYSHD3Ls5l0ez6Aef4zudkfmgNRI0DsvhjT7kdy1wgRd1fCN8qahyhx63YGEmAtu4WL7y68CMHUm2eRRjT3qECBVUxXXhXPn5/2mra4/rxsUBt2f4gz6Pd2Mj7/5YMPuDvy+DtGQIo6h/mTWJ8Y2v3CKI1hv39pe7fIeTSV3gDGrY3ga05kfNukgPqdCu5QOLA5v6XMjBKR2vIJ1YId0E0D44RTLAs+InrDkvzOEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgeCOKckQrTpRbb2e5h/CJ7lNqCGM2NVN1k4UnocWo8=;
 b=hIlRVY39o1/aAPzfADE5qUtEmp/GvqaZs9HqTzBr0blKD959nt/Uv371YRHrYoxAjjciNru+ENhuW5+UGfsiZLnmrpd0VW8AuptyZ3BercJGn+O6a+MWfpw3jnjZDs/K5V4OlnuX0qf3X4Z5bQCRmMcvhtG0DWSCmta9Rplf0tWxKZosS04ZmvelTxc/9b+7x4m9D4lePHM9YwnJ57N0z0CZMhv1rlvwQCMu8w/CveweLWGknDc3uIOUkXj+n27oH6jpB85QXAru/8f9YOeM8r4NVBQCo0F+QjqRLC/pU7jRrMIYC+SkhMjY/FuKpogMjZTvDsLTxBSrW/ofAQw7hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH8PR11MB6708.namprd11.prod.outlook.com (2603:10b6:510:1c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Wed, 11 Jun
 2025 09:42:58 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%6]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 09:42:58 +0000
Date: Wed, 11 Jun 2025 09:42:48 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Jeff Layton <jlayton@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
 Qasim Ijaz <qasdev00@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v14 3/9] ref_tracker: have callers pass output function
 to pr_ostream()
Message-ID: <ktsjjdsvbyf6loaa5nnyotzdc4wenshcwwqnzm7txvv2n3dhgl@76qg4ynjzjuj>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250610-reftrack-dbgfs-v14-0-efb532861428@kernel.org>
 <20250610-reftrack-dbgfs-v14-3-efb532861428@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250610-reftrack-dbgfs-v14-3-efb532861428@kernel.org>
X-ClientProxiedBy: BE1P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::6) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH8PR11MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 63904172-54b1-45bc-e391-08dda8cc5922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGN0dENXd3U4bGJWemVSZVg0TWJ6aU1PVVdQRXZ1NkVKMHVNMmQwVEJ6dkJV?=
 =?utf-8?B?bGtHMzBUUGNJbGowSWlvNEs1andCRDExNTZRUDFlSjhVcWhNMXlCQ1NGblUx?=
 =?utf-8?B?OGxwdnBVcEd1cUpuUzZUSmpaSnlrVk4xYnhDMGsrU0JHVFVTSHQ4d1ZJZ0w3?=
 =?utf-8?B?SnBSUEFGMTFGQ1NYL1ZmWmV5Z2d0bXhkVlZxRnJBNmxmT0dwM0NSWWVpcDdH?=
 =?utf-8?B?a0IvSUFsRXhGdEpnOWZzcDNiUTVCVjRzSUNMRkhURmNhR3FjLzRsTVNBMWxo?=
 =?utf-8?B?c2ZDZHc3aFdGUWlJZkgyREFvQ3A5NEFjZlUxZC9PLy9MOU84V1RPcXdxRHhr?=
 =?utf-8?B?YThYcnpObHl6UjBBVm5Uck1NSUtXZ0JPUmlqR3JlNnFyeGh0c28zdVNUUlll?=
 =?utf-8?B?aUNkOGZqU2J0ajIzUXNlOGh6V0hPTjlTa0RxVW83d05ZRVo3eHpWMU12cU5X?=
 =?utf-8?B?YTZxUnhuU2hVT3N4V0dHbUc3RlV6d3pIaTRrM3Z4Z0pvMFdWY2k5bFFXVHo4?=
 =?utf-8?B?bThZWnFBby9laUhCbXY5dmlybnlzME5lRVZpekM1SjRidUxsZkRJOVpyaXp0?=
 =?utf-8?B?QWVjc0V3UGtYU0t1OWhyanZ4eDVybVVmdmgyUG56VjlsN2RvYUtuUGJKRDVO?=
 =?utf-8?B?U3JMV3VISTZGcG13Y1FiT0FJcDdvOWdWUHhTSkRTT1FiOWRGbVRwdTg3UitC?=
 =?utf-8?B?b2s0UFdENGR2czc2N3E1WVlIMHlKYU9IcUR0YmsxYnpEL1BLbGxTMnlOQlFR?=
 =?utf-8?B?VFAyYzZ4ZWlQNFQvOEFGcytDb1FkcjBFZkY1YWpISTVMLzVuUFVJd2g5RmZK?=
 =?utf-8?B?eWFFVmU3VStJK2JQbVRIeXNqb1UzbGxldVVRN09YbEZqa1kweFpSSzFnS0hn?=
 =?utf-8?B?a0ZTLzNza0orU1JpRTUrN2MxblFWVlRPWHpmU1Nud1VVazFZRXUxZnQ5bk1o?=
 =?utf-8?B?eHJ2OWlEaDFabmxhb0tySnFIYUhkRjY3bjNST2NOQ1phbWFETWxEbkhSZVlD?=
 =?utf-8?B?L1plSllPMmRpMXNxcVhMeDNmdTM4VXp2djRncDB0d3R5SlZLcStkVW1PZHpW?=
 =?utf-8?B?cWtZd1F3ck9UZ0hFK296L3NrNTRya21SbDZ6a2JMZUZFYy92N2txdDcvU1ha?=
 =?utf-8?B?NThldldIRmF6Q1BJbjZCZ3FQbFJWKzR5U3gwaFlCY1EzRDJjdXJiSlZCNGVn?=
 =?utf-8?B?YldIWkcvM2pjdWVGVkxITXZjMUxTT21PUjRlQ1NNMFNXZ2dHVWFpdjBZUGl5?=
 =?utf-8?B?VldjbW14UWk4bGgrT2Y0dVh1N3hJK1dsaDQ4Ym5lVEdvSTNiRkVGNkovZExs?=
 =?utf-8?B?dE1IMzFWM1NEV3ZWdGUxenZtRk5qUEZBTDlDeHBzNHMycFViSnFjcS9OY2pQ?=
 =?utf-8?B?V0FDd1duTisrd0ppZ3Z5MmcrTXZqZ2piWFozM1JVWVhNbHBnTm9FOEYxSDdP?=
 =?utf-8?B?RmhXRnVLNjNnWWEwMUw2bThsTnRpWDhwSmlXaEszL0J4L2ZJcFNHeDRiZmFS?=
 =?utf-8?B?WE9OR2RNOEhOSHE5bk90Mkoycko2ekJaYW5FWXArb3o4T1JTVWpkbm1vaTh1?=
 =?utf-8?B?ZTZ3dnBDNVZ6blhSRE5ZZm5JZHJ6STdkY0g4WFMrblRBRG5tQmp6LzRGS2J4?=
 =?utf-8?B?VVVEOGo0d0F0Ni9uWVMxRGVoZzE3b3Y0dlhaYnZDT3luVWdjckdtTzIwUjZO?=
 =?utf-8?B?U2RZVWJ5VTRFQ1kyQUM1RmcreWV4eEd4bVdETVpaOERYUmhkTmxIdFJOVUc5?=
 =?utf-8?B?TFpCMzNvTnlQa1RvYkRaeCsvR2lyMHJ1SkN0VkcrN1FBUmNsWHA5eERxKzBw?=
 =?utf-8?B?SE9GbFpTZG5Xem13emVBbEMwZG83dU1DZ1M2Um5lQnhrMy9pTE5uT1VnRFpu?=
 =?utf-8?B?R2VLZFBpYVAyRFhCR2NsaVRuMk5HY3ZBcG1SRU13ZDVqQURsTWRvQld0di9C?=
 =?utf-8?Q?K4wZSyFsI9M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVV0Ry9Sc0twWTYvRmNKU0dSNnROK2J2Q0dZbjBEV3M5TXp3V2JYcmJnNThn?=
 =?utf-8?B?VDhLV1FmVmpQd2I5NVlsdGlQUEdnL3M3aktvQ2VPUW1ZYXAxTVV6RkFQL3Ev?=
 =?utf-8?B?ckgrVzdCbFhZN2IyWmZPdkt4dXM1eVJNOHpZWlNuZ0IycWtZY1N4eGd0UmVM?=
 =?utf-8?B?TVFERm0zUmJrdE1ja1Jab09lQ1R3K3JaWW5zWnpxcDczMmg1Um80TWNUaTZ1?=
 =?utf-8?B?ak9oUFVvMStoZW03TTdwY0lqdjJYMStuSkZEWVJLVWNkVEdXTFhPd3AwbGty?=
 =?utf-8?B?dlBrclBvWUFGekZTMVo2Qkgzd2V2SWppQ0VFL3Zoc2xMdFNKcVgzMWVsbm9Y?=
 =?utf-8?B?K0NCNkdwejNGak1rZWNoLytkaWMxYVNHRldMNTJOTDdLNWZiYXVzN21hU3pR?=
 =?utf-8?B?L01FN2NvOWpsNGx3bHF4Wko1QzhvQXZ5bWRZQ3oyR0dKUlRFdzNVUStPcjk1?=
 =?utf-8?B?eHNGVFBMK29BMGkrUERwUHFPTXNRcm11RVFEQjBOdXJjdzNnZ1BabGEwSVRr?=
 =?utf-8?B?ZjZMYnBZMDhyS0c1am4rSGZpNEkzOEJ1alM2QU81aWN4bGN2em1ST1J2dzRI?=
 =?utf-8?B?cHVUd2FNdTFnVGFEbDRsWk1TTThLYmJPL3NEc2JqYWV1ZFpwMTNhSnFoTDN2?=
 =?utf-8?B?NkwrOC9OYkU4NGR6emwwaGpYZE1ZTU5KVHM4ZzZIYnE3Mk1wV1d4K3dYMjcx?=
 =?utf-8?B?TTNUQmRWOXlqMWFUYjVsbS8wT01sdFN2YVBiUWhSWC9NdXo2bEp3K2RDWWw3?=
 =?utf-8?B?RVR5V3p5RXRNQi9HV0w5Nkk3LzE5TWJhdkFSN0NQN1ZhWk1ET2JxeTdoMFlz?=
 =?utf-8?B?UkRJZmJEalBtOGRRUi9NT05WMzczT20rNHpORGZvVS9nbThnSzBzaURLSmNZ?=
 =?utf-8?B?ZGlUalFiNk1MSlFRS2xGS1E5dGErT0xXQUJJcFN2VWlFeVRodWIvNUZ5MmUw?=
 =?utf-8?B?c2pkQ2lZdkNWdWx5U09ITmU4YWNzcUN6ZEtxb0FpbEVINDczUVl2aHZabm1H?=
 =?utf-8?B?Q1ZLZnhMbEpSR1RNVGszTmZvajF0QUlXSDRsMDFzcDRIYWhVZ1M3VEdSeUdF?=
 =?utf-8?B?R3I5ZDI4bHhQZUhsTFJSMlY2ck8xZlQ0Y0hvSHBrUHVGRlN1ZnlVUVRacWVl?=
 =?utf-8?B?RGVDT2NMd3BIeFJqWHZkWlNIOC9hWVRSbHFnMXplckUvTGxFN1pMZkpWUkhk?=
 =?utf-8?B?bml1MjFkc3dCSlJndWI4ZUNDb3g3a3JXL3V1MExMaHZqMTJ4cHU1M25zaVNp?=
 =?utf-8?B?d1BBeWVGYzFOdlpuZlNqZkZYc24rN3lxblFzak9pM2pFSUFxK2pTWDBEbHpZ?=
 =?utf-8?B?MU11eHI1c2g4Qk90Q21MSmdMQmlseXJYb0x3eFcyd2p4Q2JUa2pBcEJTMGVI?=
 =?utf-8?B?VWRGVmxzTzExYXhJUXY0czNQcEZiUlJVYUNjNVBhdDBxRlFDLzY2aXNwSnNQ?=
 =?utf-8?B?KzR2eDJNWjBZNlg1QVNXVmFEVXNoeW45RzRRQ0NkdCs3NWlYWFNxbkN2bG9m?=
 =?utf-8?B?TTQwcHNYNVRXMGc4RlZlRzdhUFJKOHV3UCt1TGNHdVcvOTNnbWRVTy9jQ2dB?=
 =?utf-8?B?NEF1cEQ4YnZPRkErak84ai9HVEFicjc2cEw5aDJTc2RoZHVYOEcwZzRXU1J0?=
 =?utf-8?B?MzJ4SUF5MnVVYS9RV1JBdHNtVmVjQ01hUmNMUlMzdWpIcjBPSU1DY3pWNC9k?=
 =?utf-8?B?TEJaR21uUm4rSUtSQzdieWJZTjAzYk1sQy81UkJYSG45K1MvZSswM0RLZzZB?=
 =?utf-8?B?TUN1L2dkdHNIYk8wdHV1RVFlZ3VJczhDZ2xIYkhDN2JQQ0lzL1N0dFp5THlz?=
 =?utf-8?B?Nkh6RGtUK2dFU2trR0psQ2pUT0RpK3h4UVBwR0RDZWN0WFAzWVlzdEJJWXRp?=
 =?utf-8?B?ZjFDWmpaOUJFVzNvQ254Z09CcGJ6TGRQVVRlcGFra21hUVg2azBkMHFLSWJY?=
 =?utf-8?B?dTBxRWJhbzZUV0tHbHl2RElLU25UTUpSbTdIZW44aVU1bkhlKzRxUmhHMUta?=
 =?utf-8?B?ZFB3aURmSisvVDFqREcvc0VlKytLV2dsT0dYRFNMOWt0dUxnZmVkQ2VKb2lZ?=
 =?utf-8?B?cjUya29TbzBESmloTlFFeTJscExqd0Y1OXE4UFY0aHQ4a3I5RnR1a0lyb3Bl?=
 =?utf-8?B?a1dYTGQrNkxFSU9kRlJJcjJFKzROWFUyKy9zR0JQeDFsWUkvU3VocGx3YVZR?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63904172-54b1-45bc-e391-08dda8cc5922
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 09:42:58.1033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2E8CfqCLMLwSojG/QVE2hns01SqclVDElQcZ8obcb6RNTeFM2NnjnrH+jTXkjbYViN2CaYD74/g7T7cj+8XeUQDqeBOws09J0yrHgQyn/qA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6708
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

Hi Jeff,

> In a later patch, we'll be adding a 3rd mechanism for outputting
> ref_tracker info via seq_file. Instead of a conditional, have the caller
> set a pointer to an output function in struct ostream. As part of this,
> the log prefix must be explicitly passed in, as it's too late for the
> pr_fmt macro.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---

Looks good:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Best Regards,
Krzysztof
