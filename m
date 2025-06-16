Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC1DADA99C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 09:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1C810E2C8;
	Mon, 16 Jun 2025 07:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a4s/tF/V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E3110E2C8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 07:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750059643; x=1781595643;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=A52MiugFqGjV8Wwf6PSI4/0QXGn8RuIQutDX+tn61O8=;
 b=a4s/tF/VwADVP1wHsCO1IkHxAFKgt/RLRFshfg+aAksu47zKCcybraCV
 0irAXhmV1xP832McN5TLTVOPRQl9faLrMdOVeKJX5cw15AFu1Bh/M2UVJ
 UK9fo50gbfGZyGXd6HIwIdczUA0OThBZaGWVOI5hLHjfspfWG664fD6Yr
 mAb6g/TpvHCwIjGbfzEqJmaKFH6IEF+uAMisoeBOCDVCrO+shBHpIuEZX
 T9F+jrH/6InPacXKpyrv3bWcGE0o+k1gqF5Ige8o/zMf2vvXIRqWXrl5O
 MI6seNZPWXaDrUfGLwcvLaJJ++dpBLkBJw7JVlfD+0f+KnpsPG9sFigQ0 g==;
X-CSE-ConnectionGUID: 7wkdopKhRZqIGIDJwocPJA==
X-CSE-MsgGUID: KBbtmYx3QIW9XtTVPkKu3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69770646"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="69770646"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:40:42 -0700
X-CSE-ConnectionGUID: xPi/58YqQ5StKfMReVuCGw==
X-CSE-MsgGUID: Hm/+s8ZLQ4qvISGvionIUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="148941355"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:40:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 00:40:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 00:40:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 00:40:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDqDES58C8YxatuoPwDkf5xphxi10eK9nu486ZbDPbpK26CWdnNdNPoCL0JnALilaOEToputm4bYOvpvJThglDBaJ4T6voi7YKyGhYNNKcpwuNT5zO7YvP9t2F+gx+ujakzgRF1NDUJu9F/wpVwMq+8SXg/c1ucTq85QtNgUgeH8YCXBLgysZeWKRwkU+lyxQEGsubuEyMXSM5S1E0nknUBBTI4KMUsCLVHNIfVkfY4CrcpbZ0CceRg4fY//c1cFTcBW7usqYn7VFLQy50AoDLrhHZBUSCpg8TVZC9BbeSOHfPf2fD0kFxiQaNZIOXgIQ5DqUWAUk7XvHBDeDOvJ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1O85Oxhak4F+E5+yRl4DztpynS/1c0/2J7zTZ4p8n8c=;
 b=OrLvEabDln+b5QJaB5mVdqVh+X8BAj0ohtktOSeKuTs1IzzcIdMtvv8KbGMMxRMJmpn0S0EtI7g6wP5nQ+jo5wznI1dwXMpjWPVqLRd48JsLIOKKJVnHqTJLsWIrp6+1LGIJj00Rr9/CFhqZHC7FGfIfRxgSHFCYBx65jCfY4Ect2dSOxUdKS5NB5JG8MSJ6Qfuu2qbp+9pEidd74DcDazeuhuYxpwjjQ4tY2qlMU01S4exBfDiazBvxkmuQ1N+TnJd5gXAAhuU04AgrwKrS+Q+3ZKqME8b84pZ/ivUkhXUP9UfPAasv8cGZUb7AT/2WG0rnBm0v4yE9mjvnVsMSqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8184.namprd11.prod.outlook.com (2603:10b6:8:160::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Mon, 16 Jun
 2025 07:40:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 07:40:39 +0000
Date: Mon, 16 Jun 2025 00:42:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <dakr@kernel.org>, <pstanner@redhat.com>, <simona.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: DRM scheduler issue with spsc_queue
Message-ID: <aE/K12vukPvj6VSM@lstrano-desk.jf.intel.com>
References: <aExZdkcnBVvX1DCa@lstrano-desk.jf.intel.com>
 <0b0b8367-abd4-4982-aeec-08f8b95a286a@amd.com>
 <aEx3zmQ4T1n5wdKO@lstrano-desk.jf.intel.com>
 <7636678c-d5fe-439f-a86a-4f038e7cf692@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7636678c-d5fe-439f-a86a-4f038e7cf692@amd.com>
X-ClientProxiedBy: BN8PR16CA0002.namprd16.prod.outlook.com
 (2603:10b6:408:4c::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: 1856e7d7-b83f-40e1-23dc-08ddaca91714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFRXaVE4OU5scjcyeVE3STdkL084NUtYUGRINzdWWUc1SG1VdFpoSmhDa2lR?=
 =?utf-8?B?Y2RyRE51dm5zazZnYjYxK1ZZbXRTdzl2YW01ZUk4MzBCVlhhbi9ZSk5LTWp3?=
 =?utf-8?B?c0c1LzBtUW54b0tpU3ZrRFdySENPUFF0eWtITFdTMDFPS0NGMG8zRkFNc2Rh?=
 =?utf-8?B?ZGxCWDgwTCtUZzBWbzdhVXJoc3ZvWS9KazFrWnorK28zWW91R1dLNzAyTi80?=
 =?utf-8?B?L3MzMDEwUExKNkNTbXlpTnRUTEhnVUFSTmI3S25kamluN0FKRG81djZHdEZO?=
 =?utf-8?B?YmhhQ21DRUpmNENhQWErZ3dmZHRPSk5VT2ZkUldzMEFpTndPb1NsMVJ5L0dz?=
 =?utf-8?B?b3BmWVV1eWVDcUxVSEpIN2k5S01WdWJVN3RnL2J3b2pBcFR0SDNnVkduQWRW?=
 =?utf-8?B?eDgrV1VFN3E0eGVmQ2t1cThWR1c3bmZUN0V6U2pwd01GQlBDMkE4cW1ETUdw?=
 =?utf-8?B?S1Q1NkgvbjZneGE0OFZCTGFZZ0hkNWxaTk9BYWc5Z2p3blZyOEdZNE9xeitF?=
 =?utf-8?B?Y3FXQWpvclJSSFpubm1JeTBPa0pWbEdoOUsxM01neHRQU2I4V1FNVlg1SXhX?=
 =?utf-8?B?L1lSY1dwNDVFNWVld2tJOHZNczNQK0M2N0tIZDBPdzN2N3RERitrUFY5eTZX?=
 =?utf-8?B?bnFqK2N2MFlQNENZeUFRaUJSZnlhaDF6blFKWFZjd2UxS0wxMHZONk43M3FJ?=
 =?utf-8?B?Z2ZVSnFtdms4bE1yNm03RHVwWFhIei9TdllaMjZweTBDdzRYT1o0WldVbFNq?=
 =?utf-8?B?UVQ5S0tzTXJYbVNlTjM2bXcyZXNDSk0zN3Nremg0ekRNaWZnajJ6azVIVzN2?=
 =?utf-8?B?K0QyYzRDeENoTXVTZHVteWNnOElvZWFFVkVxWERVR0pka0lvZ25aWkYwczFT?=
 =?utf-8?B?UWl6M09qdmFnejN2c1ZFbldLa1RyVEhDc0MvcXM1dDdzRnRNRU9kS2JoVSt6?=
 =?utf-8?B?YWtjSStKWS90OTVLbm03aE1TTGdyVFVySm5QMUdGcUVoWlFweHRNa2pqUm1V?=
 =?utf-8?B?dktGSVVhaEFmekZwL0dUVnF1NGM4TU5wWWhFWUw0bDhoaFk1eVNvSXgxV2Nu?=
 =?utf-8?B?U2EzV1daQ2xiRTg1QklSTi9qSldHOUFwSTVsaXlZTWVmbVRoWDk2K0RXdTRX?=
 =?utf-8?B?ejBwODRwRmJKSTFHdjluRWxpQXc3SFRlMzI0WDdSaHkydkplUkhva05tMkd0?=
 =?utf-8?B?NmJ2ZVdKWUtTODRkTDJNYVRnUWhLQVlJNUJEaXhPMlRzSmdkY2xyUjdvdVly?=
 =?utf-8?B?VWtEc3VVQ1B1eEEzMndzekxjMVB0V3YwNmNVeFU4dWt2SkFOWjNkYzZGQm5O?=
 =?utf-8?B?cU1XREl4ZTBXYkFOdCs0V2JVbU1sRkFhWk1kWVBFaThtR3ZCVVhBc0JIQ0py?=
 =?utf-8?B?QlRWOHRxblRiaXptdUp4QjJhbHJVY0JuNjd6NlRkSElUTmgxRXZiMUNDYkxz?=
 =?utf-8?B?b3BLQ0hxeDRKVFNSTEJVaFU2Q2ZPcjFqSkR6aDg4SU45MHY3eGdFL1poaU5z?=
 =?utf-8?B?dFlJMmRFVVR5cTR0UUluYW4xbnA3Tkw2Ny95dHEzbXcwRm1lNzlpd3hGbTR2?=
 =?utf-8?B?NUNaRVRQVE5XbVl5aGFDSW1vZVlxZkZKaWtYZE1aUDVxRW1zdysveXFzS3VU?=
 =?utf-8?B?VW42YVgvUHNmRmNYZlFmY2RBek1uVHlpMkp6d1dueVJBUHZCdzIwS1QrcDE3?=
 =?utf-8?B?Z3pjM0dwRDhlRk9HTDdHQUs5REhLMzJiMXZpSWNvTHByMTVzeG9LVEo0cTZG?=
 =?utf-8?B?NDdGZ1IwQ0FJZ0VzanNSQ0UxN2JRKzRLR2ZZaW8va0ptWmVTbXlBR2pYc0lh?=
 =?utf-8?B?VWdBSnNTbnFURm5IdWc3TjhxRk0wR1krWDJDVFRoaUxuUXlRcWxadThNRUtT?=
 =?utf-8?B?NFVkbnVxYm1OLy9IYTZac2pBTXFQSFlvdVZKQ3FQVVNYYXlxS2tSVmtsMy9a?=
 =?utf-8?Q?55PhRPqFy2I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2phNjIzQnBNZU9xYzhyRTVuWUpiV2V0K1gvZE1hTDFwVzhaNGpZQWNPWW0v?=
 =?utf-8?B?dURrZ3JnbDJ1VTAzQkoyRy80dGpPRmU5eHpic1JUSFlVaTNnVytBUUFaQXZR?=
 =?utf-8?B?OGp2NGFVK3Y5VTBXQlo2d2t1OHZXOUNvUHBudnJDR3JvWCtoUkdVUDhpdFlh?=
 =?utf-8?B?dW1NcUY4RUY0M1RveXZuM2Y2d3phcjE1dnNBeEx2VUlmMlFRaFNRcFNpSVRJ?=
 =?utf-8?B?T1R4YXlTTURmUCtYR012T0Q3UlgwZUtsclM5bVh5di9NUUR6aVN1cTdZbDMy?=
 =?utf-8?B?eVlMMnNMdXBicGxkcHYzdVJxSUFmMlNuMTRlOUdscWd5VHdmNllvVVlEM0FH?=
 =?utf-8?B?Q3VaRCszWEIrVTJvbmdoSzUwVmhQY1h2V09wMkVtK0hOZElwdFJwVVFKSm1o?=
 =?utf-8?B?Tm1UL2ZrTElzZXpxbEJZb1pjcHU3SUI2Q0hmcWl1U3VMT3FORVp4b0hOaWVB?=
 =?utf-8?B?T0VsbUNUK0dEak5JT3lUTlhZd0swU1ZIUEJDUnByeUU5Q1U0WXhmdXk5TkhN?=
 =?utf-8?B?Q3BCZko2OHJHbWF1SFoyR2ZWSjVFRk53b0dHNEhicXJsanNWTGVkM3gvV2Zi?=
 =?utf-8?B?MDNacEdpdmh5MmN5U3VCQlJPMDRmcEdwUkRQNmIzdzcyUkhhMkVQZUd3WVFB?=
 =?utf-8?B?cGd3eW1jTXRCN1puRFduNTdzSUlYZkdhM0JqYjZjTXF1T21qcVFFTGpUenk2?=
 =?utf-8?B?TDhWSWdnek9VUFVpS2l2OVlsZGdhUWdjaWFkQ0hnR3l4R0xyaGxhbEdFUzIr?=
 =?utf-8?B?VThRUy9kelhkb0V4TGlnaFRickx4ckFwWEJmc0dXd3JETTkxTkdQdERBeDBV?=
 =?utf-8?B?b1pZQVhBb0c0azRvUGNZOVg4TkxSbThLeXJ4YkxBS0g5cFlyWDYzMnpQdXls?=
 =?utf-8?B?MkRZV0RqeTEvQ0Q0dTFLMzN0dEN4dGxJcUV3TjFkUlV5aHl4RXR3eEFkS0Vl?=
 =?utf-8?B?bmhLSDRUZkgrYVVnZVZXU0w5YWRmWTVTdWVKd1h6bmxEUDlaWEU0OGtBaldu?=
 =?utf-8?B?bTdEQzBMQ3Jlb3d1czhybVA1YmU0ZGR0WktUYUtDL1paSllXeFE3TjV2c3ND?=
 =?utf-8?B?TExGYUpnVy9ZSUtlQWZtS0hjNDlqYU9sUFhBQ2lKWHBCNjRMRUIzdnZvQ1ZR?=
 =?utf-8?B?NmVxcjd4TlNCVmFHUzVtbXcwL2k0NjB2d0JvZmNrWGx1QXJpd2pnck1lUXo0?=
 =?utf-8?B?bjBzeXRFekJzd3MwQWNYK2NZUWdMOTk5d1dmUkhjR01UWUQ1cUxmNkN2eDZ4?=
 =?utf-8?B?YzFtVWJYYWIrcG5YaFNYaDJ0eGp2WnJncUt5YmRNaWozWTgxaFh1TUlkVWxp?=
 =?utf-8?B?ZG41Z0NIYkgwSXFBSUhya3U0TmZybXpuN3VoZitSQ2ZETGlNNjVkQVBWSWlO?=
 =?utf-8?B?Qm9oYk9RY280am1mZ0ZwaGY5cFBrcDhRb0htTVRyc3FXV1JUYXZKaEc5R1NT?=
 =?utf-8?B?cEtSM3lobUpLc09hc0ova1crdTByR1RFQ3JNVlVCZUUrbDlKQ3ZCUU1hc1BR?=
 =?utf-8?B?Y25Hb3R2MTQ5SFVLRlV2UDZpUkVBVFEyL1R6WGZ2U2VneGx5ZTJsR24yR09r?=
 =?utf-8?B?em5wOVVHMHZQR1YyUFlqWjhoUEJFcHR1bzdVdVpTeW44VUs3L1lDZlEzVWxs?=
 =?utf-8?B?WUtpRllxdDdLVWhuNDhlUndEZVdGWHdsZjFQL1U0b1p0M2NhZGpoc2hLNDJ0?=
 =?utf-8?B?emZyNkdKS1dzdHRoZmxoQlRmNnZ1b2JZU2c5aWlRQnQrbzZQMDkzcGVQUVNh?=
 =?utf-8?B?aDl3cHlMbnB3ZUxvekt5Q2lhZlViTFY0blZlZ3U1b1ZhMkszSDRETEhqVlg4?=
 =?utf-8?B?TjQrM1pmUGtKaFBGOFBvSHVtWkNwYlhhTkcwNFVMOVA4MmZnSHd1cWhCNEZk?=
 =?utf-8?B?KzU2bS9pdDkrZHN1WUxrSjlDbDdqV2hkRGx2U2ViaEJUTHJuYVNzWkRrR1Qw?=
 =?utf-8?B?WlRpS0dWbG90dnY1VncyYjZkSm5sSk0rb3Yya2l1RENMTWZVY3UxMCtManNh?=
 =?utf-8?B?cTFEaE8yb1ZnRER3cEFQRzBUK3FJWHVwbVdsajdGcXJnQkpHMmVnN1g0MkI3?=
 =?utf-8?B?eVdsT0NJcGNxUjMrL0p6YzdXVXF4K2FqWko4RFZ0Mm1IR2FlYWFWQTNsaVFz?=
 =?utf-8?B?cy9mQmNacDRiZGVaeTRqSEFYbEV4UkFuZ0lMMmszVVJOV0Z1R000cG82aEll?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1856e7d7-b83f-40e1-23dc-08ddaca91714
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 07:40:39.4436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqUahbBMZNZTeHmAm1fmFEneo3Sw18Ip9m/w1m9vZJuNZTPBqWclgHoD3XWoB6q1uk8e32pcVOCajst2K02Atw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8184
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

On Mon, Jun 16, 2025 at 09:24:38AM +0200, Christian König wrote:
> On 6/13/25 21:11, Matthew Brost wrote:
> > On Fri, Jun 13, 2025 at 07:26:22PM +0200, Christian König wrote:
> >> On 6/13/25 19:01, Matthew Brost wrote:
> >>> All,
> >>>
> >>> After about six hours of debugging, I found an issue in a fairly
> >>> aggressive test case involving the DRM scheduler function
> >>> drm_sched_entity_push_job. The problem is that spsc_queue_push does not
> >>> correctly return first on a job push, causing the queue to fail to run
> >>> even though it is ready.
> >>>
> >>> I know this sounds a bit insane, but I assure you it’s happening and is
> >>> quite reproducible. I'm working off a pull of drm-tip from a few days
> >>> ago + some local change to Xe's memory management, with a Kconfig that
> >>> has no debug options enabled. I’m not sure if there’s a bug somewhere in
> >>> the kernel related to barriers or atomics in the recent drm-tip. That
> >>> seems unlikely—but just as unlikely is that this bug has existed for a
> >>> while without being triggered until now.
> >>>
> >>> I've verified the hang in several ways: using printks, adding a debugfs
> >>> entry to manually kick the DRM scheduler queue when it's stuck (which
> >>> gets it unstuck), and replacing the SPSC queue with one guarded by a
> >>> spinlock (which completely fixes the issue).
> >>>
> >>> That last point raises a big question: why are we using a convoluted
> >>> lockless algorithm here instead of a simple spinlock? This isn't a
> >>> critical path—and even if it were, how much performance benefit are we
> >>> actually getting from the lockless design? Probably very little.
> >>>
> >>> Any objections to me rewriting this around a spinlock-based design? My
> >>> head hurts from chasing this bug, and I feel like this is the best way
> >>> forward rather than wasting more time here.
> >>
> >> Well the spsc queue is some standard code I used in previous projects and we have never experienced any issue with that.
> >>
> > 
> > I can quite clearly see this not working on my test setup. I can (kinda)
> > explain it a bit more.
> > 
> > Look at this code:
> > 
> >  65 static inline bool spsc_queue_push(struct spsc_queue *queue, struct spsc_node *node)
> >  66 {
> >  67         struct spsc_node **tail;
> >  68
> >  69         node->next = NULL;
> >  70
> >  71         preempt_disable();
> >  72
> >  73         tail = (struct spsc_node **)atomic_long_xchg(&queue->tail, (long)&node->next);
> >  74         WRITE_ONCE(*tail, node);
> >  75         atomic_inc(&queue->job_count);
> >  76
> >  77         /*
> >  78          * In case of first element verify new node will be visible to the consumer
> >  79          * thread when we ping the kernel thread that there is new work to do.
> >  80          */
> >  81         smp_wmb();
> >  82
> >  83         preempt_enable();
> >  84
> >  85         return tail == &queue->head;
> >  86 }
> > 
> > Between the execution of atomic_long_xchg and atomic_inc, the submission
> > worker could dequeue the previous last job, reducing job_count to zero,
> > run the job, observe that job_count == 0 (drm_sched_entity_is_ready),
> > and then go to sleep. This function has swapped for the previous tail,
> > so it returns false (i.e., not the first, and does not requeue the
> > submit worker at caller).
> > 
> > The race window here is tiny, and I would think preempt_disable would
> > make it impossible (or preempt_disable is broken drm-tip a few days
> > ago), so I’m still a bit perplexed by it. But again, I assure you this
> > is, in fact, happening on my test setup. My test case is an SVM one,
> > which involves all sorts of CPU/GPU faults, migrations, etc. Not sure if
> > that contributes. I can show this race occurring in dmesg if you need
> > proof.
> > 
> > The change below fixes the problem. I'm going to post it to unblock
> > myself.
> > 
> > diff --git a/include/drm/spsc_queue.h b/include/drm/spsc_queue.h
> > index 125f096c88cb..ee9df8cc67b7 100644
> > --- a/include/drm/spsc_queue.h
> > +++ b/include/drm/spsc_queue.h
> > @@ -70,9 +70,11 @@ static inline bool spsc_queue_push(struct spsc_queue
> > *queue, struct spsc_node *n
> > 
> >         preempt_disable();
> > 
> > +       atomic_inc(&queue->job_count);
> > +       smp_mb__after_atomic();
> > +
> >         tail = (struct spsc_node **)atomic_long_xchg(&queue->tail,
> > (long)&node->next);
> >         WRITE_ONCE(*tail, node);
> > -       atomic_inc(&queue->job_count);
> > 
> >         /*
> >          * In case of first element verify new node will be visible to
> >          * the consumer
> 
> I need to double check the code path once more, but that we got this wrong while could certainly be.
> 
> The code originated in userspace and atomics are also memory barriers there. Sima had to point out that we have to manually add smp_mb()s here to make it work. 
> 
> >> This is a massively performance critical code path and we need to make sure that we move as few cache lines as possible between the producer and consumer side.
> >>
> > 
> > Well, I can't say I buy this argument. If you can show me any real
> > workload where using a spinlock here vs. going lockless makes a
> > measurable impact, I'd eat my hat. Also, FWIW, this code seemingly
> > violates the DRM locking guidelines we're all supposed to follow… But
> > anyway, I'll go ahead with the fix above.
> 
> I probably have to take that back, see another comment below.
> 
> > 
> > Matt
> > 
> >> That was the reason why we replaced the spinlock with the spsc queue before.
> 
> Well we replaced spinlock+kfifo with spsc the for round robing peeking implementation.
> 
> Background is that because of the spinlock even a "peek" transfers the cache line as write to the sheduler thread, and when you do the "peek" even on the idle entities then that starts to not scale at all.
> 
> Since we now have the FIFO implementation and avoiding peeking all the time into the job queue of idle entities that might as well not suck that badly any more.
> 

I think if the consumer (scheduler) always tried to peek—e.g., by
checking the SPSC tail rather than the job count—the current SPSC code
would work as is.

Matt
 
> Regards,
> Christian. 
> 
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Matt
> >>
> 
