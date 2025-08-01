Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C5FB18756
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 20:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F39A10E8DE;
	Fri,  1 Aug 2025 18:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hJiEbUNJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DD810E317;
 Fri,  1 Aug 2025 18:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754072827; x=1785608827;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NIWzdH8wRTl/npnSbIlvY4JIQSai/cRscW4FllQAPSU=;
 b=hJiEbUNJ01PjLDDLEd4W0E1SzZ3zXdqQvKE4KihSi5R4RHHl4QoW4gN7
 Dz7GmP6mQ4r/B/TVTxb8KREaFIBc/ZCma/ExrbBD+ZhidVc7/VhnMthZk
 yG4ObnOOI8Vk1XfcUqavYoqAprvt8rZXFObf+6Xucpu4+6Y41Gzynq2Zd
 q1xeFbCf6WUMY7LCvdaAlE9qkDdjj+SAQO8awk833BEDXbN+mwG72ZnZY
 RvarMb2VpcBciBcRBi6C5DRj5lCwXwG9JETfPb/aCae8UaRT1FMPP+mIz
 FBMcm7bOsxFOB0MPDjr/jc2c/zmIG+g4JeyqZdSOtS8W88TKn0HSA3P+t g==;
X-CSE-ConnectionGUID: gd7nRvG2T/mIyR0w9RUkcw==
X-CSE-MsgGUID: oqfWYnv9SSCYkZoU2J+/tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="74018456"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="74018456"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 11:27:06 -0700
X-CSE-ConnectionGUID: 1tUjIH6mQDm735GudppKoA==
X-CSE-MsgGUID: lBedIqnISL+ZeLZQiBcLkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163185826"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 11:27:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 11:27:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 11:27:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.84) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 11:27:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzFRfPJf3lmK79g2MCWdfu/ioUDfiN4FCT45FFxhJM39ewyIeKvjt3+x50xoxenwN+fNV9MuUyKRWabDORX8qPJ3P6Wmtm+HyYr4GOUJ/tTUahf66W8+MbtTKtAy+uGsAfJW4CmLm0Il2MBpjOu+98fLSjVUctfppJ2Si/NBR0JBaE+6DNZIMdQPPXzvEux+MBawAXnKztLMgp7Sco8Ux97u1QZZPEamTkSeISaR0v4etp5wnIJG8MkWEMUwFvZvvyjeZMZMSWovGM8bdmr1DYliY6qc+bIOfj4acQl5qg1nmeC/MUpnHciMJXQ1CsK/4CCB2mN83sTAw6PZ24wCQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIWzdH8wRTl/npnSbIlvY4JIQSai/cRscW4FllQAPSU=;
 b=DgbXfNfwTxq8dqFhFKwhVvGbaNFQv/kpwoFZGRethop49OieJB3DCZzF03P3zOnZR99Idbg0G9mpYgD8qsk1oLtubFHfWCLUnm/qAzSdvCS8gzGXwZBDmVHavwQ7pTCaCU6Pcn9Ijdfz1xm0QHcocqKwV7Dqhdil2P/ClJzzBfjnvmU3/JI7kt3mMy24XhffvbHtYUEcjry3D2q2GErQnDc69vX9oVELwVMzDyA+3VSzt1A9O/DbXN+tJY8PZAZuK4FShDn4fje9y1zIh6XUAK1luWEbjviWtChtl36SmCS1G58367TPqa3KU/66YM/rnFH0vpDnhzak7OJVZX63jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7339.namprd11.prod.outlook.com (2603:10b6:930:9f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Fri, 1 Aug
 2025 18:26:47 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8989.010; Fri, 1 Aug 2025
 18:26:47 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Colin Ian King <colin.i.king@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH][next] drm/i915: remove redundant repeated checks on err
Thread-Topic: [PATCH][next] drm/i915: remove redundant repeated checks on err
Thread-Index: AQHcAvd5ydsQX88xz0KCWgSgRU1OrbROHYFA
Date: Fri, 1 Aug 2025 18:26:47 +0000
Message-ID: <CH0PR11MB5444A54DF5DA955CC30A8FD3E526A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250801151705.2432911-1-colin.i.king@gmail.com>
In-Reply-To: <20250801151705.2432911-1-colin.i.king@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7339:EE_
x-ms-office365-filtering-correlation-id: 2ce00d17-b959-4255-8c0c-08ddd128f9cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N0lBZk82Uk4rYVZ2cVpVZGVySlJQb3FuU0tHSEdOZUtjMEQ1eE4rcVBGOWgx?=
 =?utf-8?B?bzBQV2xZRDI3UDdrRmRZcllKYTBPaDdWUzd1cExCcjMzOFFiekZsZnIvem95?=
 =?utf-8?B?czlSc3E3TEE5QktHSFRpOUIvUTUrTHV2ZjM5eDFSM0VVU2kvZVh6NWxTM2po?=
 =?utf-8?B?KzZ5WW9UUlpJbG5TclIxQ3FCV1Ivdk55aFRDcmtXWEhXNzg3K1RNdERYWTFE?=
 =?utf-8?B?MXVxeEYrWVZ2T0RGWU1rZ2R4c2N6eTJ2S3hGdzN5Y0pPRHEydm95MVpFYVFu?=
 =?utf-8?B?QW9Ma3VPRXB3a1owS2IwOHZwbUdOUWx3TmJtMHIzY2xVS1JnUzNjM1g3dnRh?=
 =?utf-8?B?WXJHTjA3akk5OGpPQXpYTytsclJIdjJRejNGSzNjNnI1Nk96TmtTU2tvcFI5?=
 =?utf-8?B?OWNSTDlSbzZPQ2YrN0Mxb0ZFbHpOOWppblBqbjh1a2xzWmxRaWJtT05PY3pz?=
 =?utf-8?B?ZDdmYTdCYWMvdmZGQ3c0U2hrbnZwMWtNM0NnVGtHa2pvd3dRaDZaVGFPWVNi?=
 =?utf-8?B?TGNLMUtFM3BkcTZVc2ZvRzFwc24vanV2SjVOanFUc2tkaUF0TmpnMFNuZlFt?=
 =?utf-8?B?UzM4TitFdVJaeEdwakViOXhPME82bTRQejQ3WlJ1bUMwSHNxQ2ZtS1pWTE1H?=
 =?utf-8?B?c2k3YzJrenZSUnczMG9zYVBxYS9pRmEvTW1jM3FRZHZkUlVYSWJ3d21UbG0w?=
 =?utf-8?B?em1ZbnZPR25ubUUwZEpwMkRoQ2xESTNxelFKc0I0SjRnNzhRcFgzY1hGUmxB?=
 =?utf-8?B?ZmczQlhvYS94Z2dVMVJRb0Q2WFRENTltNG5IdXFNcnFXaGVKcUtnVzNHZDNR?=
 =?utf-8?B?SzErNnNBUWtmVFgvaTh5czBpTWxQSnFiTlVUMFFudnQraHpyaG1ob0xpRjJ4?=
 =?utf-8?B?NklYRXVibnZsaU56L1h0MFZDLzR4bVhMUG14R2hUakplOFRXUkxRSmsyM0N2?=
 =?utf-8?B?dGV6SnhRTUFTT0NTZWRpUGJ5MDRGM1Fjdi9rRGFNZ1IzMHI2ZC95UlZlVmZm?=
 =?utf-8?B?R2tvekNLelJud3E0VVdiQk5qelNXNUc2ekhpWEVwUDNleU5pUzFrZnpRVkE3?=
 =?utf-8?B?RFJ0SFhMdnhQY0U5VHFTSURGR2RQcm5Wd3ptUEpvajVwOWpxbmc2c2IrODZB?=
 =?utf-8?B?NjBwYksrTXZidWFZd21FVVRlNnZ6Wjk5R0tNakszTmNDRjF0T0JMSURnaXBS?=
 =?utf-8?B?VU4waWxlcmlobnE1ZW9RRHVYRml6ZmFPTkQrOENHYVpkcUVTeTZNMVU1ZGZI?=
 =?utf-8?B?NDY4TVFDWi9FemZVYXI2M0w0TEVQTk5WT0FqWWNkbFBSb0Q5WFJXMElEOWtK?=
 =?utf-8?B?MWhGSWowdDRBVW9LNzZqdUg5VGZzd0dtb3U2d3FDUkZ6cWhnS09BM29ORnNT?=
 =?utf-8?B?KzNmejNZRjM4dE9Qd1BpS1JqSzVTYnU5alAxZHhKbDR2dlVkciszMDVFd2dV?=
 =?utf-8?B?MDlvdjJKOE1GZlYybUNxMlNwTWhWeUREdnI3SlVoRkFBK2Z6czBqdTMrMWR1?=
 =?utf-8?B?T3N0endlTVlaaHk1WTgzZlFkRnBlQm5tNlh0bmRRbWRJbnV0c3ZsOHhtd3lq?=
 =?utf-8?B?STdGbGhLYnZQUE9HS1MzNE9PK3Vma3lZOGp3emlvUzMvR0d2RllMcDRUNTd5?=
 =?utf-8?B?SzgrYkk5UWYySzdpeFNhblhUWWFxZGZsRlBLUkVzTWtEL0M4T1B2UTA4UzVw?=
 =?utf-8?B?elN5cjA2d2p6WFpSQmQyNWpicWVCMlpSZWRXbWdPRzFlU0ZGbm0vVFpvWk9R?=
 =?utf-8?B?WllWRUJRUW9vSGVwZkVpVXFkU3ZVRm1MbmVlL3FtNzhhci93WTg5anB1bVVD?=
 =?utf-8?B?NFhhVTJlWEZiNHcwalllQWlleGVac0hMQ1VLRkpGaHphS1FrTkRrSmQ4ZWZ6?=
 =?utf-8?B?UGs0bE9RMnFyODdhMVpObHl3MU1WU2I2V1BTT1NMOEUrVzZYQlhTbU5hSXNI?=
 =?utf-8?B?OEZVZGdMM1I5b2U0Vkd3WDZsalIvYkdubWRRQlNPTkZJb25HY2l2TWdaNWhQ?=
 =?utf-8?Q?4ugRSZjD+QSbaS0zI6X2KyVf16yGE8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFZJRFFkVXlDbzBpbkJEdHZMeVB1NEIyVzVsUHo4Zy9yeXpVcHdiTy84M1hG?=
 =?utf-8?B?ditzTUhoQzZpT0E0UDhQNnFrYnBuTjhaeFp2VkZ0c05lT1NWSkxlT1k3dlJL?=
 =?utf-8?B?RlhwL3VhYjBVeHRGUkx1eTV2RThzSmVGZURnWXJMVThVSDhtMlgrZFk1Z0ha?=
 =?utf-8?B?WkNadElTSjB6dWtHVjlXUFo5Q0tYS0hlQys4Q3pzRE1NUFJlKzlzVzIvVzFN?=
 =?utf-8?B?dVMwTDNYWkRkRVluanVqcThyVUw1cDJXaUJUM0IxK0tZT01QaWtaaHAyT2pj?=
 =?utf-8?B?Z0NkWm96WWhsWDJMU2c2clNESmQrUE1NYUVMYjhFWVd5cGd6VHNNTEV5M1RM?=
 =?utf-8?B?WDl2dzBtYkxVa3NJSWJZekVOeDVhZ0dZRlc0dU9OMnBIOTkvMHJHR2lYSU84?=
 =?utf-8?B?UzB0dFR0Z2E2ZDVvYVYrd0JESHhqMVE4YmQzMW04YUJObXVveWR6UUZpNnpQ?=
 =?utf-8?B?Y1VMVXFVU0VIMHk4ekcyTFhtV3FTMjR1NmtETC9WY01IQ1VndXJXNWltaUx4?=
 =?utf-8?B?bC80bFBIVkF0aktjZjVGMjNOeUZkeGJmMFZnNndwMmM2T3ZRMmpjRFUwRmRI?=
 =?utf-8?B?Wkd1QjBrVzlYSDNjTFlENEJyVTZHRFFVV0VBU3QzOHpvaDNweVpwcnkwUDZ3?=
 =?utf-8?B?T09GYnZaK0N4SjNkK050WU1Lbkl3a25ESXlibm5ZWDdEWUQxTHR3anlhVzdi?=
 =?utf-8?B?OGZld0VrQkFiUWlhYkNZKzlMaG9vTVpVRGJWM0dxeWRzZHQycnM5NjRwQkt4?=
 =?utf-8?B?aElsQkVhNVZqb055SjRCbTZST0VNSU1vaXpJWGtUY29KbEttTlZDc0FSRFE4?=
 =?utf-8?B?a21MK1IvQzZrNmFmL1ZWaEJqZzYxZXFDSTdhZnRFeGM0cG1TS2VSak0rN2xy?=
 =?utf-8?B?TzUwbmtBK1oyckNQOXpBZHFnc2N5aWY0MEFNK2x5NFdNRzR3d0RjOTFtMWNL?=
 =?utf-8?B?WGJ6Y1ZyRnVqMElvcWxmYzhscjNtclZVVFV0Q1B1Tm1zcmFrQ3FmM3R1dnZ3?=
 =?utf-8?B?MGhMT2txajVrOS9NRzBSSXEzR2VqeFhuSlc3UWNHekxVRU9RR0VhYy9HVEFU?=
 =?utf-8?B?UkNUbEZITExnanJrQnhKaElGQXJEVXNZc25qTzk5d3pkdzdVek5KYlVEOVZD?=
 =?utf-8?B?VjlGbUx2WnordlBhU1k3TE9LdzRTNnd3bkJETThXMUtFOGhvRjEvcURxZzY1?=
 =?utf-8?B?NGFIQ0JlQTU5bzhoaDFWTmVVQno4YUx6MTEweUpZY1htWkxGNHJMeXpxeHdi?=
 =?utf-8?B?UEdPZUtoWEhjeklxdWtKRlpDcUtiTi9xNkxTTGsyS1lWeCtjblRhMnlHRWph?=
 =?utf-8?B?VXN0YldWaThFakZnYlBXRW55eWdQS0tUcU0wN3hFMThWcldBR1RtOHBoa3VX?=
 =?utf-8?B?andQMTBuWUJjSGNDbW03T0MwV0hxMnJNZGdkdVRLWkdZRWZZeGRTdWhQaVNL?=
 =?utf-8?B?ajJ6RFZIdEQ0WTZhaHBLa2k2RVZ6K1dMVHNMd05WZ3hyRUlTckNQWFp3ZWhs?=
 =?utf-8?B?ZTRGQUVJdFpaVFFyS25oWngzQ1UrWGFzWldXN28xckptTUhaOVhranN3WW5i?=
 =?utf-8?B?ODlOMzVxTXhjRHhXcFpQL29JSkQ4TUgvZFNNOXJGSjZEZ2EzdVJYMGR4dEVH?=
 =?utf-8?B?S21HdURxVFZzWFY1aWtESjllZ1dSb05LamN4dEFWazNmRlVWOHVtLzEvMDRR?=
 =?utf-8?B?ank2aXJjOHlmMTlrWHRwZzl1U0MvNlZCTHNqaG43TEx1ak02QTVNTXdnL2NL?=
 =?utf-8?B?cHhSV09nMkhBRFU4RXdZMlRIQ0NPTWtOQnYzQzh3aWFGLzl5aCs0elNER09q?=
 =?utf-8?B?ZVQxSXNiRU9NVEFUb3g1cFdtZFRvbWNyYUt3RmMrQkNBQ3o5R0toZm5JMnR6?=
 =?utf-8?B?SU1LWGl3dmt4UkZvWW9MM2xFL1pnWVRBN0VYeFY1eDlFRVlLTGxneFQraC9M?=
 =?utf-8?B?VnE3K1J4WCttY2xML3M2N0tGYS9QTVZjRFhNYmdHaFVCL0pvaDZBdlA0cnNj?=
 =?utf-8?B?K215WUhhd1YySHhPby9PTjZOOGtneFdQbUNFVGN1aXU1b1VHN281NjUzMTYx?=
 =?utf-8?B?UEp2Q0x0cW1TRmdLQUEwby8wNnFGWDJYRklMdWxjUlhuaVNhYXFLQzBKczZr?=
 =?utf-8?Q?k7jy3WcQT7pbpW+hQFzqL+3d7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce00d17-b959-4255-8c0c-08ddd128f9cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 18:26:47.5710 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EudxtkFLzrIfwBcQG+MEY+uDdyxBiu8qla00Hf/3fVfY9VTwuqZJN1ZnmKorc6aV/+pxF8Nwc0PUZ+g5I2sq+SeXFWnQyrVGOdO2CWJ8Ubc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7339
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLWdmeCA8aW50ZWwtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQ29saW4gSWFuIEtpbmcN
ClNlbnQ6IEZyaWRheSwgQXVndXN0IDEsIDIwMjUgODoxNyBBTQ0KVG86IEphbmkgTmlrdWxhIDxq
YW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlA
aW50ZWwuY29tPjsgVHZydGtvIFVyc3VsaW4gPHR1cnN1bGluQHVyc3VsaW4ubmV0PjsgRGF2aWQg
QWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT47IFNpbW9uYSBWZXR0ZXIgPHNpbW9uYUBmZndsbC5j
aD47IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCkNjOiBrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnDQpTdWJqZWN0OiBbUEFUQ0hdW25leHRdIGRybS9pOTE1OiBy
ZW1vdmUgcmVkdW5kYW50IHJlcGVhdGVkIGNoZWNrcyBvbiBlcnINCj4gDQo+IFRoZXJlIGFyZSBh
IGNvdXBsZSBvZiByZWR1bmRhbnQgcmVwZWF0ZWQgY2hlY2tzIG9uIGVyciBiZWluZyBub24temVy
byB0aGF0DQo+IGFyZSBhbHdheXMgdHJ1ZSBiZWNhdXNlIHRoZXkgYXJlIGluc2lkZSBhIHByZXZp
b3VzIGNoZWNrIG9uIGVyciBiZWluZw0KPiBub24temVyby4gUmVtb3ZlIHRoZSBkdXBsaWNhdGVk
IGNoZWNrcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5pLmtp
bmdAZ21haWwuY29tPg0KDQpSZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5j
YXZpdHRAaW50ZWwuY29tPg0KLUpvbmF0aGFuIENhdml0dA0KDQo+IC0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9taWdyYXRlLmMgfCA2ICsrLS0tLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vc2VsZnRlc3RzL2k5MTVfZ2Vt
X21pZ3JhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvaTkxNV9nZW1f
bWlncmF0ZS5jDQo+IGluZGV4IGQ4ZjRhMTBkNzFkZS4uMzkxM2I0OGNlY2U3IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vc2VsZnRlc3RzL2k5MTVfZ2VtX21pZ3JhdGUu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vc2VsZnRlc3RzL2k5MTVfZ2VtX21p
Z3JhdGUuYw0KPiBAQCAtMTQyLDggKzE0Miw3IEBAIHN0YXRpYyBpbnQgbG1lbV9wYWdlc19taWdy
YXRlX29uZShzdHJ1Y3QgaTkxNV9nZW1fd3dfY3R4ICp3dywNCj4gIAkJaWYgKGVycikgew0KPiAg
CQkJaWYgKCFzaWxlbnRfbWlncmF0ZSkNCj4gIAkJCQlwcl9lcnIoIk9iamVjdCBmYWlsZWQgbWln
cmF0aW9uIHRvIHNtZW1cbiIpOw0KPiAtCQkJaWYgKGVycikNCj4gLQkJCQlyZXR1cm4gZXJyOw0K
PiArCQkJcmV0dXJuIGVycjsNCj4gIAkJfQ0KPiAgDQo+ICAJCWlmIChpOTE1X2dlbV9vYmplY3Rf
aXNfbG1lbShvYmopKSB7DQo+IEBAIC0xNjEsOCArMTYwLDcgQEAgc3RhdGljIGludCBsbWVtX3Bh
Z2VzX21pZ3JhdGVfb25lKHN0cnVjdCBpOTE1X2dlbV93d19jdHggKnd3LA0KPiAgCQlpZiAoZXJy
KSB7DQo+ICAJCQlpZiAoIXNpbGVudF9taWdyYXRlKQ0KPiAgCQkJCXByX2VycigiT2JqZWN0IGZh
aWxlZCBtaWdyYXRpb24gdG8gbG1lbVxuIik7DQo+IC0JCQlpZiAoZXJyKQ0KPiAtCQkJCXJldHVy
biBlcnI7DQo+ICsJCQlyZXR1cm4gZXJyOw0KPiAgCQl9DQo+ICANCj4gIAkJaWYgKGk5MTVfZ2Vt
X29iamVjdF9oYXNfc3RydWN0X3BhZ2Uob2JqKSkgew0KPiAtLSANCj4gMi41MC4wDQo+IA0KPiAN
Cg==
