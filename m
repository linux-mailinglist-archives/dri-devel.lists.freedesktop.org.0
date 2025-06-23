Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0191AE45CD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 16:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F9610E3B3;
	Mon, 23 Jun 2025 14:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VTsJl9Zm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B15110E1FF;
 Mon, 23 Jun 2025 14:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750687320; x=1782223320;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=n3lmvp/mFhMNxZKQL5d3tUMeIvPTHVR7nG86zHNebVI=;
 b=VTsJl9ZmbuXbeeRdMjwrFXXCklViy+OesCaFCXx7XkJMgVBCmprRPr6F
 KlRn2Fhg2Eaq4dArQieqzPS4j7AU4SFDNPRjsa068aMcKVMUP13s6qWtw
 +Du+AqlCzbjdH4Gt7L+ITxinyyLikebnFbXI9BGje2m0QFFDhoEiMhssf
 omwGhwG1sxDCqi9yehMNf/q64RFu7KxOjeeQ1tM8CjcGnKcN0KWOAx2vH
 ErgkGpIZFzRYmhGxEzOPJ0ihIxUlMhUe5EUtm48WUvHMtoz6NR07rkAac
 NYPjn8326xBF1HtDa9tulYgG/MfzO3iO271u0nv0+DPXDi6VXvzwKHrmZ g==;
X-CSE-ConnectionGUID: bi/s1HBBR32/oL4GCAC6Xw==
X-CSE-MsgGUID: x6udbGcgTAqtVJ1nuwCgpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56701646"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="56701646"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 07:01:59 -0700
X-CSE-ConnectionGUID: peMODWqCRPaoFSh1eH/nYg==
X-CSE-MsgGUID: jxgpEdvPSkGdxrGpRuBL/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="157394255"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 07:01:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 07:01:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 07:01:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.85) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 07:01:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdEZdKhT+WuJo0nhaubGk5jv0i+vFEJPjzU2IsmjTzENY6NK2q7wLNdtTgFGSDLkaOB5dByEbPk3NWT1jmzLoTyHYPFVD7yrf09GhHjrLU8/yw9stfSeLYmhsJsgHh4TRsZJ1LbQCqlOdsV/fYjERVK1qnK0DoJGDml3lfHxA/P8Aw9LyEzct4kTa0h3jMsID8CrvdJvMBWFytqcpgGvThD3QechcA1i0zrB11F3LcFfEsSp5Pt6uziXoYgYx/cRUm/1GqRPtIpKREoHlUildwoiT3I0HlC33h72mBg098hT3Ufw9DiVWfZsm76q2OqLiV/U4jBkLH9ey12Avr1auw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPGBLLWWvvDdMY8Ez+l26oy/GWUZOqlSZOgp58Nb2Bs=;
 b=x3WQR0T3O132Htvg5rQREBQcruoKEBYkc66T4lRKdtZEFimbEWy54wh+6zm12tWtpsftXZ079M7a/d0kmZOVzx28GDLL6bP6WfNv9dQH43wbpIlzu63X8V4z5JvPtB3/EEAGOIQy/Tgys64kLgVak3ZjMN6KBRN4EteOtbkEQmSg/M8XKdFCC8GHqHiLp/dod90PDvrsQzk1/C3pVShFmSvpzBTKVbMr7IxKCib6vJUWAhratFhj+Nk4+yY1oXST4jmGGLS7syL9cuBHe9LiU1o/CMWzEICv5O8UHeenzK+NN+G8nCxSl6UkZjfgLOffiSc1HaIMs6sXry+9FRgihQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SJ5PPF2F7FC4EE6.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::81d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Mon, 23 Jun
 2025 14:01:55 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 14:01:55 +0000
Date: Mon, 23 Jun 2025 14:01:42 +0000
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
Subject: Re: [PATCH v15 5/9] ref_tracker: allow pr_ostream() to print
 directly to a seq_file
Message-ID: <kd4urnnwx22njawv54ppewljkwlh2usqa4iengp64bpxyevpad@26vjqeu3dvn3>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250618-reftrack-dbgfs-v15-0-24fc37ead144@kernel.org>
 <20250618-reftrack-dbgfs-v15-5-24fc37ead144@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250618-reftrack-dbgfs-v15-5-24fc37ead144@kernel.org>
X-ClientProxiedBy: VI1PR04CA0091.eurprd04.prod.outlook.com
 (2603:10a6:803:64::26) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SJ5PPF2F7FC4EE6:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b0525c7-c796-40a7-f47d-08ddb25e8304
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akFuNnJWdjlRVEdJUFBKMWlvQnI2ejVFaWl1TEVoT2dta1NNdnQzcjJFdnBS?=
 =?utf-8?B?eXVHYjFsUTlOb2JPQ2RPMDhzbVI5Nnkxb2Vaa3l5M291NFo3bERiRHg2MWhR?=
 =?utf-8?B?Snc3NjZpK0wrQm9FMTZCTzNLNjhNUUJnQ0FHblZJeFA1a1p1Q3JaSllTMFEy?=
 =?utf-8?B?eENTMnpiWE5FVjJsM2d0RHh0MElVWUV3Q29ZbWFrZXhBaXducERRbXd4Z25B?=
 =?utf-8?B?WVRTVU5sblpSaXR1V2FuVWVjdkdhR3BUTEt0bUtENUM5SHN6dkRVYXJYSVhy?=
 =?utf-8?B?anZrR0J0MXpRWWZoUmZyRE1BVy9YQkttVjdleEU1OGtjVkUvVFNPTUFvVW5y?=
 =?utf-8?B?Q3o1KzZmdEdlZjh1OVdGcG41WWJxeW1mMDAzQ3VOMFB2cE1UaklCK3ZlNWor?=
 =?utf-8?B?dnZRVzArQXB5blpuWEx3aUhTeStKRGJ2Nk1yVWszVEE4OGYrcjIwc05UYmMx?=
 =?utf-8?B?VVpuZ0tQdDR0WTRhVWQ3TU5JaDFJUjlOQ0JOc0kwVTVxZWtES2t1RG5yYUo0?=
 =?utf-8?B?a0I2Q1ZKUjhyNVUvRHhFbE52K09VM2w1Z0xPbGhMMDJ4QlBnUmtQSVhldHlF?=
 =?utf-8?B?c01Bc2tPdVU0SUtpYzU4UjhvekNzZFVmdVpOQXNwYW9zUXFoUUp3aWVIeWZr?=
 =?utf-8?B?VHdnc2RwNkF0R3hiUUVzTjhvejgzUDUwUlFNZ081Z1ZaWnk0ejdXdWVuTlA0?=
 =?utf-8?B?S3dUeENOSkwwbnJNckxLUW9UakVZNTdtTGxoYkw0SFFLamhPcDNsbTA0Z2pp?=
 =?utf-8?B?UjBFZ05uTXVMSTUwRjNsVG96U3NSMUR6M25nQjZoU1J1QkRDZlZsWFNCRmUz?=
 =?utf-8?B?d0xYSFNMTHNKYXdqeXBYMkZ1Z20remZ5Y2VuKzBRRGo2SkZlcDhCQkhBU3Ru?=
 =?utf-8?B?VlBLaUFwYzArYkVVNUhFRjRKNy85VHlnODBlWFlTM3lPMmhDUHdmTHJxbVBz?=
 =?utf-8?B?dUl0a3NmTTcwSXFrMHJqSSszQ0JVTExCM2dBOHJvdkl6U3h3NWpyV1hnUjJR?=
 =?utf-8?B?MU90Nk5jQWIwekZJZUk0a1dRSHpVWGVJNmF5SHBuQXl2RXROdktZVFNUQ01t?=
 =?utf-8?B?bmdtY0hUaDR4VXkwaEQ3bm1jWFVEbFZHanQ0S2pvZ1hRbmxhckNPN3lIcUNE?=
 =?utf-8?B?QkpUZ1JXSmEyUmR3OUtkOGJtNXRzOFhUc2ovZThMMWduTHgzYlpXRFdIREpU?=
 =?utf-8?B?M2lRTC90VzdEeS9DdkNpUU02YWhqbGM1L2ZuZGkwK1JxZXhSWGtDWlZpUlFx?=
 =?utf-8?B?Zk1jSlQ2YUIxajUzcFVCWjFTdkxKalpxVGVWNGV4NG84aHRaZTFDcitDbnZh?=
 =?utf-8?B?Rk9OSmUvb1VyVjFCSWhFMjAwL0YrWHJiV01FSGRPZmFvSVZSWFNyc1d5a2Zo?=
 =?utf-8?B?Nm9DMnVMdVNBRXJlemdzL2duRTI3MEh5dlFQVXJhZXlmdTdkYmNZYytxYkVp?=
 =?utf-8?B?eE1lQ0xUb3RjY1JxT0NyN1ozWTNPSVE5b2FVemtHVDBBbVpIdG11MjlZYU16?=
 =?utf-8?B?VUliUlBYemZlQlRscVpFdjE3aFZXME9YSDAyOHJKYVZINjhoYWQ4SnNnQmM0?=
 =?utf-8?B?U1JURlY1QWdONFNvMzZ0VDFVY2x0cHFaOThOeU1OOEV3TUNoTzk4NjBYSU9O?=
 =?utf-8?B?ZWRjdTRkQWdqTEltUnJuMVR1RmwyUUdkR3hiTEJKaVBuVEtlOEFtNUk2RkdR?=
 =?utf-8?B?My9wUzhET1FFY2VFNVVhamluYzU1MHVEZDg5Si8vbXFmQkFKVVZncWZ6YzlU?=
 =?utf-8?B?L0dCNW9UbDg0SVBRZkhoZVEyS25FeUNqdloydXpOYmlDdWRSUFdWVmp4YTR1?=
 =?utf-8?B?V0creXltYW44QXVRZCtMM1hkT3pmUWZiMnNEcHo0R3lvQXQrZXF4TUEwaWQ5?=
 =?utf-8?B?ODJZMGp1N21HR2lORWRZcGZPeUhzNHNHYnFncVFaK3l2eDVLbzYyUEZpMWxu?=
 =?utf-8?Q?1G17MN0p1lg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVlnRWRDM1FvaTNHLzBaaXVxb2Fld2gvc2hObS9jV2pPeEVyRXdheU1VaHRu?=
 =?utf-8?B?YkhBVHNXQ2VWN0NHYTFHK3BYZlNvemUvR3N3Y2FVSEVHRXF0cmg5bFBzbHhX?=
 =?utf-8?B?elRyQXM4Y1ptaFBRcjRtQ3oxeEhNUk11M2NTSVZxbzZFVExLdDExNVZvL0pt?=
 =?utf-8?B?WWNKV0N2blNHQkZCSElRcnJQVEUrcHlYSlVqNnZNMVlEb0Z2bUxuMWY0NnVJ?=
 =?utf-8?B?YUdSVmFvSUUwVXJsUlJudSszMXltRWpvQzkxRE90dGw5TTVLZ0RMSlpUZjY0?=
 =?utf-8?B?SllpNE0zSXEvT29QRy9BU2lFOHZCK1pJUndyOE5JRENSV056QXJvM3VsNjVv?=
 =?utf-8?B?L1Z2R2VrMklzQm5rUHdOcW9wbkZacmF0alJYT0NJb3ZmOFBUcStQa3VLamVJ?=
 =?utf-8?B?MVR4U1NGV3NnTkpIMlRpd091WUYzUlFWc1gxdkxYWmUyVDNJOFNBQmJsVVVq?=
 =?utf-8?B?MURDMW1ac1cxVlpqQ0lzb2dCYS9pYjc3bklpKzRsTkQ1RnNXTWtudkEvM2Fy?=
 =?utf-8?B?V3NxUUpIV2xlZEdIMEZhUysvajVMSUhEeVlyZ3VYR0lnRHpPd1Vtd0hUSm9v?=
 =?utf-8?B?TUNhMElraFlPTTVQSytSZHBvQS9va2VqdTQrQmZBVWxrck94Rk0zaGR2T2t2?=
 =?utf-8?B?dU5uN1NGV3lubURlTUw5VCtLS3Y0K2pNWTFGSDdlMDQyUGFKa3ZUdXN0QTdh?=
 =?utf-8?B?NGMvRXhDV0pRNVcyS1ZwaDVaVDhlcDlHVmVOenAyZExsYkFxUXBJRVZ3K3dz?=
 =?utf-8?B?T0E4clFFdHRHWGpjcHBsNDNyUmJsendTUUZqL3FwbzRJTWs3VUtnR2RiNmFH?=
 =?utf-8?B?ZFplSDNwYXZPcUhpR1MyMFpYZjMrS01Damx2R25HZ05mZ3dEU2M2NlJ5WHhE?=
 =?utf-8?B?dWdsa3luNmk3K3JndzBZc0xLakxYKzRsV20xN2Z5TFZ5enhVVWFlc0lKVGNV?=
 =?utf-8?B?SFlabHBSbHdtMWU1UEpiYUlBU1BSOVZ0N2pla1ArSkJpcnhjMXNyNE53c2xs?=
 =?utf-8?B?d3F0MWJFditsZDExMHM3MGZmK3UzV1QvdmtZQWkrOCtlOVp4OWU1TDhWd25h?=
 =?utf-8?B?TC9FaGVleWJTUG9kSXhQcU1hYmpqZzE2ZHV1VFhmajZFNGxMbXFBUEtWZWYv?=
 =?utf-8?B?OCt1bGk5L0YvZ3RsTDk5RHdyVHBFNTd3OURVN0lXMi9kZUU4cW5BYlBML3h5?=
 =?utf-8?B?S2VYWE9QMjhqQ0JPR3hGelhYN1lJN3RMaVR6MGJTa0k2U3pvNjZWaytVaWNo?=
 =?utf-8?B?RVJJcEdvR0d5UlUrODFuSENOenN4bC9ZclVrb3ZMVjVqRmtCdFFnK3IwYTdG?=
 =?utf-8?B?WXJGR0d6NUhOVHB2RS9wY05GNmdPT0NxMUlWdEJPVkE5V0JkcHVpQXp6T0Z6?=
 =?utf-8?B?M3d1anlnM1F0Q3FXVlZHVzRtdHFJMUphWFlnZndLU3ZSSE96OWM3ZmVsNjN1?=
 =?utf-8?B?VUF2V3o2dGtWU2ozd0pmUk5qa3dXUnRLRTVoRnZGUEx5RW9MVHh3azZ2cFJP?=
 =?utf-8?B?N29kS2xnTDdISjlvVko0NlJ2eHJWUUZ4ajd0bzZuaHd5ZFYwUVZxbXZjdCtW?=
 =?utf-8?B?SmJsTkc3U3VuQ1RQNmEzV1g0RGY0WFIvOW1TT0VOWUtPZkF6Nk5NSlhnWlZC?=
 =?utf-8?B?N3k2cGYvQ1J3cjc5c0pOMDJXc05IMEV6NFdMeWUzc1lnYWFJM042K3YwKzlL?=
 =?utf-8?B?UUtUTEhuYmdLNnZ5eldxY05oYzE1N0NnWGR5WmRFYU4rK00vQWpQK0t4TWpL?=
 =?utf-8?B?SW5LbEJHZGJsOThiMENEbTlURFFhVzllUHczT0ZTcXd3Z08vNmJQY0sxMC8w?=
 =?utf-8?B?TFhyTHp1a3h4RmVCZVlnNzh6ajV1ZkZsdi9iZnQ4dlJkWUcxUXM1UHNjMmNV?=
 =?utf-8?B?Z3QwNXVVTi9PRUNJalJhZ1YveWFCOVVVMlNTWDNtMTN5SmcySVFjWlBxYU9B?=
 =?utf-8?B?UVdHQ3pMN3RKZ0tIZ1oyL1l4MUZ1cUpha1dlMk4wQ25GZHo4TkJFZVVMVmdX?=
 =?utf-8?B?WVZlQ01BOXZmQnkyb2lkNGNMYjVHV3NQZVc1endyN2ZVNFN3cUtoaisxSVNL?=
 =?utf-8?B?KzRkTnlYemp2dHFxTXlCdHEyVG1sOWRrR2VJZlhtMlRQNFpCS041Y20yQTg3?=
 =?utf-8?B?OEFhWm9aMjNkOTFLNW1pcEpwYXFqWEVrRXR1SzBSeVlsd3YzRUtBYXR1d3Fm?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0525c7-c796-40a7-f47d-08ddb25e8304
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 14:01:55.4463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rq77noilL3PRC2nj9+6vdta+0ClZpOAtHoydS0lxBfyUWQ43RLc8Ub1CnXe6VD3Lf0Z0RJM7sLhBscONoSRSbKoggsLoJcl5IjMf6WiVqLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2F7FC4EE6
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

[...]
> +static __maybe_unused int
> +ref_tracker_dir_seq_print(struct ref_tracker_dir *dir, struct seq_file *seq)
> +{
> +	struct ostream os = { .func = pr_ostream_seq,
> +			      .prefix = "",
This is also a "ref_tracker_*" function, so maybe use the same
prefix as in other functions? I mean .prefix = "ref_tracker:".
Unless, you have a reason for leaving it empty ;)

---
Best Regards,
Krzysztof
