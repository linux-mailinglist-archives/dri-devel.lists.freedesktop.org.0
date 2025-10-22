Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B1FBFE7D1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 01:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8356410E1D0;
	Wed, 22 Oct 2025 23:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kI2riUze";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD4B10E1C3;
 Wed, 22 Oct 2025 23:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761174817; x=1792710817;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T7oyDpOYIm4yJ/Z+FTtgN7Utp1pHTRRFGEtRREu3sEY=;
 b=kI2riUzeJZlGGaXoTpO29IsrWNu6Hd86eA43q63fi0L87ZOKT2FLiBFc
 /rF+lNIhjqte9z8hTBUlUFAkEUn7FR9ohO95Bu8WR0CBieqPOau1c2GMl
 C7xOM3Zft/l4Q9WMRmnWQZKYwRV1+FZT7ZReRNz/uGPoSszCkzalexC7G
 bHwUCEDIWXfs7U0H2Hd0usSQL27o9jUzhB4wNLjfn5w4hKEpkEv9Rw8Ds
 cPAZPBlKACIrBdLd/11NlyXWKbnqmF7BfZ4mxiMsCOA/VHL+oeWL9UYRV
 4zFe98JwluWantgyVXmF4KiNxuYQGIdwVwnDola0P1YZAQhqNyZwROq2d A==;
X-CSE-ConnectionGUID: G95RhTSzSAijuqkzor/cNA==
X-CSE-MsgGUID: 0JbM0sNAQzC/wu4kXCfVAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74774611"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="74774611"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 16:13:36 -0700
X-CSE-ConnectionGUID: ro5xMcjdQ7GWQwvxafdtRA==
X-CSE-MsgGUID: oxlrBD//RB+f1J8Cv2RMKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="183935250"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 16:13:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 16:13:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 16:13:34 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 16:13:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RR2S8tKEVWQ3xqKz5pCwLIUMFt1kwXsnAtJie9jlAoyqRociUAi/Eyf0eM7e7Wt+GLB04ptVGZ2kzzLP6r7GkVl+Cyjx+w61TI8Yyny/qbNGvTEpC28X7G4NcqF5CCli74wdNb+D4Jpn8aZ+TK0nKAYjCkk5D7AvEvOh/4ndKN1L5zhTMxOrnWOrqnIw9/B/+EojeEcA5P9jYrOCg3bDP5q3bWS8oB7XQekygcMmTDx+lD5pLC7xHb+rX9WFxOOeUhs4sL9jgFiynIRZvUj99dFX4wybkB7VNNYSkdr6A04cVZIgF9JIbXdiEzt+ULGGLnMWBxkxoResWlr3VUDDUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhuvhwfqvTUBvVE/dKDbrBzl6P9bJhlcVq54HzxJKSk=;
 b=thLlSYdspQ6zaZw7vmNIsPDBol+r/OncDofphhT8jRZOFgN7FU0uP7BXKK8KdMaDbo3tyK5PPQrEhkvWQxFy750Bn/ytKkZLrmm7XwAHOaqvs0Rq4Bu7SrWAabtJLnnF9JB3TUNNHYjK6IbMhH7BguM2e0/1CqxyRZaKg2Y4k9RPqu9k+xMCodUwtzvx69MAlFv1BMFN/akkWD69vKHfXOcxvPYjCOU47SFCfkLnSVFcJDES+Tj5pUYqx5XZCfXZEOMuKorKpr08/U7C+w/8hIQcJwsqDhxn+pqgn9WCeR8cERcoosxPm/WuuN2v7fLNMp8HJttdQte3stIxZ6gx6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB9497.namprd11.prod.outlook.com (2603:10b6:8:263::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 23:13:32 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 23:13:32 +0000
Message-ID: <dc361e6e-a5bd-429f-8988-038723450a03@intel.com>
Date: Thu, 23 Oct 2025 01:13:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/26] drm/xe: Allow the caller to pass guc_buf_cache
 size
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-11-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251021224133.577765-11-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0036.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::9) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB9497:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a94ecf7-be13-4838-1c15-08de11c09e3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVU2ZWk3RVg5dlRodzcwYUd1RUduR0M2azM2bFVEVDBod2pOZ2RDTVZkOG1S?=
 =?utf-8?B?N21rUUJ1WXQ5S3R4SVJoVHZ2em9wZTQ1cHlGVU4ydktzSHgwZ1d3M2d6YURa?=
 =?utf-8?B?QmE2cGZ6N3BMZ2FVb3R3ZVU1MS9JZzhoZ2JlNDJqSmV2STdWbzUrQTZlc0tV?=
 =?utf-8?B?WFlLdjBpSUQ5eDB4WmNBMXd5NTF5cWVjNWpGVnlsR1NZcEtuai9Fb1kxMWY1?=
 =?utf-8?B?QTBvT01sZ3ZzaXdGdmdLZG5VQmlkZUZCcTRzQkcvQ0RxVFdaN0dyMlp0UXJD?=
 =?utf-8?B?RksrVDZnY2pZOW1nVjA0bHdMeTJqUzhXUWw5OU0vRkNGQlJjc3E5YmZ6SkQ2?=
 =?utf-8?B?TmwrS0N2YzFuWU9NYW03VkZPYWFmdituRncvZ0dwMEJjd1NyZzZTd2dIQ3Ns?=
 =?utf-8?B?cmw0MURGQ2RORjcvL1JmOUFZSlR2dXd3bXRKTDdhOW1qKzkrdUtlOEpFT2dR?=
 =?utf-8?B?QUs5cEtSQ0NFbEdvU3F0SFd0cmRBWUxXTUZnY3k2RVZ5SFV3T0V0VVpaMWdi?=
 =?utf-8?B?aVl2Y1FPUGI4Y1k0K0wyd2tKTHc0TVNRSnVKbm1uOGpyYThPUlNzN2IrUW1J?=
 =?utf-8?B?bnluS1JMN1oxUzZVNUZKRWxBczhveCtlTGlXbE9aQjJnc2hEc2N3S0gwR0tW?=
 =?utf-8?B?cHlsd2FxWWYzQ0E4Sk1OUW9xUTdHSE4raTgzbHFvNUM1dDRmYkhuSGllTmlm?=
 =?utf-8?B?bzA3a09OaXpnL2xEeExRUTFlRXcvbVA4eGJRbWlReGdkcVBGcEZ4b0NhVXBH?=
 =?utf-8?B?V0R3SnpCRy9qSnM2Um9tdmZVdlJDKy9xTGJScDl3N0pzVFdQUTBwTC8wcjFw?=
 =?utf-8?B?Q0VDNHgwdUdRVkJVQmtpNFpwVUpVSnRvbitHMjJFaVNZd05UcC8rVGtoZzZt?=
 =?utf-8?B?MDQyaG5QbXpxcXEzOE55TTQyR2o4SUZMT3VoSXNyUkZPV1Nyd08yeVNQNlZF?=
 =?utf-8?B?OHhNVlozdmJWdXRVSW1LRWtKcGdNRVZSVjNORm1QOEdYc2dBMDIzUWIvVGdk?=
 =?utf-8?B?YU1VSzFrUktRcUZFTnhidWVqeXlwWmUzMUpUa3dPL05udUozb2pNTzNrbXdG?=
 =?utf-8?B?QXNIcXJaWFFlRDRRWlFNdVE2QUh0M3pQd2xNejhVcEdzMDl2RTNpZVZ2VWxG?=
 =?utf-8?B?cFBUYzN5TjVvVDFPT0ZwcmIxN0c4R3VaaXBDMVpTR29mY0pVWWd4cERDQms5?=
 =?utf-8?B?KytSdGtTYmxnMU1lSDg4N1B5ZnZjejF6TUptRmNMdmpOeWs0ckhPRDNCQUI2?=
 =?utf-8?B?eW9iS1lWN3ByaVYxKzZKVEQrVVYxZnJrSCtUTUlKZDZ3TU5jM0NIc0dHZkJE?=
 =?utf-8?B?ZG5JVUJjTTNmd0RlTFdtZlhrM21kUDRjcGt0T09ucTl6NGt0aW54ZUtKVitO?=
 =?utf-8?B?NFk1MnFtY2Nsekg5blVtblNEK2NxKzlTY3gyLzhZZ01QdGN0cW5DczdaRUVQ?=
 =?utf-8?B?d1l5NjRRMnU2bExIOFZ3a3RmWmZNZTZTKzdQNHI0S3VHREJuY2hGYitSSGFD?=
 =?utf-8?B?Qjd4Q0RDQU5hWGh1NDBKdzBXOTllYWM4ODkyTVBrK252L3hEa1VhcXF5aVhq?=
 =?utf-8?B?LzVNVG5Jc2xDUytsTHNSV2hBSm5ocjZ4dFBiTWQrNE10Yzg3dERtU1VTVHRj?=
 =?utf-8?B?QXk3alU2T3JaWllXV0MwQnM2Y2RHWjBBKzZYZEUwNGNFU0FObFRTVDJBVUJu?=
 =?utf-8?B?TlpqOTNiSENYUzhQVVd4ZE4wcktXUURqUWg0eFJUeDBlWk1TWkFsSVZDMzB6?=
 =?utf-8?B?TmVPWkNKZVRwdHlVWlVUQTZlT3owM1Zxa2czUTJaYjNpczVwWmcrcnNiWUUy?=
 =?utf-8?B?bHNiVnFUaXdMOXB5OC9YR1JYRkFTWFpBMDBtSEUxM0xwVUN6blJzRVdxTkpE?=
 =?utf-8?B?dnQ4eXhQV2FhaTJSZ0M4ZDY3V2Rla2xSeUd3bE8xSUIzdGV3RTdIOFNjM1ph?=
 =?utf-8?B?SnoydEQzaDVhaS9NU1JxQWVjdDlOZDNWRldBRUF5SHNPT1BFcGo2N2NtUWlF?=
 =?utf-8?Q?LieTVwHyjjfgwUAs+dPy5OjTSqdqGM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2lDeitGUWhQajlxMVFrdmZtbk9uT1Nrc2YrWUk3bDlrMFRQRmlnQ244TnNM?=
 =?utf-8?B?TlJqVzVaMldYRTBpdWZqdjhRVXRIUTlCTlhrRnpiMUdBQnRCMW5wcmZPWW92?=
 =?utf-8?B?bHlGbWo0NTBOdEo0THVJOWZxejlmSFhuSDg2RUhkMFoycVgwdE9hUnVXSUVl?=
 =?utf-8?B?L1UrVktDVlVDWTlUUi9xYnYvRk1qbjJ4ekJUNWFiQmVJTVNzYVRFR0FkUXNM?=
 =?utf-8?B?SjJLbE1oOW9icFhERUI3QXJmOWJES0tnSHdoQU1tbkZwczB6bnovL0pjYXh1?=
 =?utf-8?B?R0FHNkFSUmV2MVJVdDc4VE04Q3FGanZzM1RlSjZwTjVHZkMyaW1wZE16d1Vs?=
 =?utf-8?B?cE5pTnRYbWxJOTJib1JKM0pDcXdqNnhReE16MVlpY0cvaGFCSkVhV0FUU2ty?=
 =?utf-8?B?ZzYxcGZZZHJZQ2lBRVk4Q0I3NjZlSFBVWWd0SDd2YnpNcWZjNXhGSWR4Mmk4?=
 =?utf-8?B?bUtDN1h5dFZkWXZYZEFYVXI1NTRmV05xVS9QSUJlZ2FBQTdRYVovVDd0T2l5?=
 =?utf-8?B?ZjVQSFA5V0JPSDYyMTlpWERpeUdDM3prdGVBUm1oai94b2F4SEVtdjh3cWYv?=
 =?utf-8?B?emo1b2lsRTc0UTlMRmMraVBoODMxZUgycU0rKzFPWFFPLzYrSmVwSVVWQWxX?=
 =?utf-8?B?c2JWQjlJN2JCYnUzYzF2bWRZM2xLZGNGRXpxclZQRmdZVmNXaGpaZEgwY01i?=
 =?utf-8?B?K0YwS0R3RU1MNmpKMmtrUkZ5ZTB0R0hqUWRTaXF6R2h4NVNWRmFOc2ZpS1k5?=
 =?utf-8?B?RVIzWENQUGxySmpuNWdHazlDbUt3UGxTQzlhRVNOaFVCSjZtaTA5RWhiMzhE?=
 =?utf-8?B?bWJ2VHhOM0ZXcGFJQjhzc1RZb3hLMUtra0tDcmF4Y090YS9EaEt5aFZ3cUxo?=
 =?utf-8?B?Z2ZWeE9vM0ljU25pK0gyak9kekhWM1k3bitxRFBJWFhoZVBBV3dJQUcrd0RZ?=
 =?utf-8?B?RSsxNHdZNkRZZjRzeFJEay9QMGk4V3RjMVlhRlBMYWdEbzQ5eWkzZ1JLVENp?=
 =?utf-8?B?V1AraGYrUzEvbzM3ZDFYUFdDOW5LdC9NdjhXcHZoeW5JUUhFd0tKbW02aVhC?=
 =?utf-8?B?aDBhQkFyZDM4REh3K3p4THVzTW1rMEV2TWVXNkJtaTBCeGZTQkNtby9UYWpx?=
 =?utf-8?B?RE9BR2hwRTBwbm9WZ2lraURYTXNuMVlvc2liM292WDduVklhSlA0TmlwZUgw?=
 =?utf-8?B?aWpXazJnRnkxWTY0TEsvVjdIVDJ6anlDMFkrclB6dTl2MWZVMTg4NG9IUGN2?=
 =?utf-8?B?U1dYVVA0T1dYUGlpV3RsZzhXaThUeEVMR250L0I4bDhGOGNpTjI5dXRsNVE5?=
 =?utf-8?B?SlR4Y3BWWkd3a0Q4QmgwVVpLVlNtK1R2NkpnK2JQelJyVWZQVzM3c0UvcERh?=
 =?utf-8?B?azN6dHIrZU9nVTNRSzFGUXVObUlra3AycFV1TVJ2RnhXZG1yR1ExVXhzWlV3?=
 =?utf-8?B?TnVWNnltRHhjdW9jRU9jT3BQUkNHTm1TZVJ4NmdiNTdpQTBUTnBDZml4cjN3?=
 =?utf-8?B?MThMVFhwK21qRXVkQU55SDExeHRMUW9lTWdwY0I4TVhtSVYzVFV0bEdKSC9x?=
 =?utf-8?B?dndvK1Yyc09XUGdSNTVMNG5kNGgwSzc1STFyc094akloUkhuWFZJY0JMbG5Z?=
 =?utf-8?B?YUx4b1YwRFBMWkJLUEgxR2dZM3lsTTNMNlpuQTYyUlhBc1hzUFMyQlNCV3Zv?=
 =?utf-8?B?cFJlazY2Y1FZNFJEd0NCamZXaTJlUWpjQU1adDB3OWZBSk5XUCtBbzNYTjhO?=
 =?utf-8?B?Yno0L0I0ZWsvOFpCQmFXWStacHNBVEFFS3FtTkk3bndkem1CTThPbi8xVUZj?=
 =?utf-8?B?Tytxcy9aUC9BNldrL0FaQW1vamw0eTI4WVBQM2VWZzUvK244bi93REJwZXRm?=
 =?utf-8?B?Z2hLT3N2emRHQlI1VzJMS0VrMUJxR2ZFeDR6RmlybzkrS3lyNUNkYnVhT0Uw?=
 =?utf-8?B?MVFpUlJqK1ZYZStDQ3p1Y1lNS1FOL3ZTVnd0RmNxWnpURlpaNmFZY1FqRXla?=
 =?utf-8?B?Ty9qc2NybVNHTW1YbGtWQVEzaFZCSWx3SHZ1UXdOaTJzNFlFaEhCeW1UYjF4?=
 =?utf-8?B?cWdta0tTZ2NUamRqd0FFdmw2ZXNQL0Z6YlErSEs2NE1EaWc3MjYvdHg4REZV?=
 =?utf-8?B?YjlXUHgra2VwYzNUNmpVc3RXckZRbW9uOWVLZHBDRGpISkhXQWlQcDJicC9Z?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a94ecf7-be13-4838-1c15-08de11c09e3e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 23:13:32.2014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4eMLf+qJ7HmcMEcH9jElq5iGGiuFcV0HTTU/wPbYwi5HjLpT8ve2R5C7Xy4kqNqFHrLWkQ+jSm+qdCKuRQkGM2Km+RX6KiY0kIcpgDjNevw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9497
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



On 10/22/2025 12:41 AM, Michał Winiarski wrote:
> An upcoming change will use GuC buffer cache as a place where GuC
> migration data will be stored, and the memory requirement for that is
> larger than indirect data.
> Allow the caller to pass the size based on the intended usecase.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c | 2 +-
>  drivers/gpu/drm/xe/xe_guc.c                 | 4 ++--
>  drivers/gpu/drm/xe/xe_guc_buf.c             | 6 +++---
>  drivers/gpu/drm/xe/xe_guc_buf.h             | 4 +++-
>  4 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> index d266882adc0e0..485e7a70e6bb7 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> @@ -72,7 +72,7 @@ static int guc_buf_test_init(struct kunit *test)
>  	kunit_activate_static_stub(test, xe_managed_bo_create_pin_map,
>  				   replacement_xe_managed_bo_create_pin_map);
>  
> -	KUNIT_ASSERT_EQ(test, 0, xe_guc_buf_cache_init(&guc->buf));
> +	KUNIT_ASSERT_EQ(test, 0, xe_guc_buf_cache_init(&guc->buf, XE_GUC_BUF_CACHE_DEFAULT_SIZE));
>  
>  	test->priv = &guc->buf;
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index ecc3e091b89e6..7c65528859ecb 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -812,7 +812,7 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
>  	if (err)
>  		return err;
>  
> -	err = xe_guc_buf_cache_init(&guc->buf);
> +	err = xe_guc_buf_cache_init(&guc->buf, XE_GUC_BUF_CACHE_DEFAULT_SIZE);
>  	if (err)
>  		return err;
>  
> @@ -860,7 +860,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_guc_buf_cache_init(&guc->buf);
> +	ret = xe_guc_buf_cache_init(&guc->buf, XE_GUC_BUF_CACHE_DEFAULT_SIZE);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> index 4d8a4712309f4..ed096a0331244 100644
> --- a/drivers/gpu/drm/xe/xe_guc_buf.c
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> @@ -28,16 +28,16 @@ static struct xe_gt *cache_to_gt(struct xe_guc_buf_cache *cache)
>   * @cache: the &xe_guc_buf_cache to initialize
>   *
>   * The Buffer Cache allows to obtain a reusable buffer that can be used to pass
> - * indirect H2G data to GuC without a need to create a ad-hoc allocation.
> + * data to GuC or read data from GuC without a need to create a ad-hoc allocation.
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
> +int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache, u32 size)
>  {
>  	struct xe_gt *gt = cache_to_gt(cache);
>  	struct xe_sa_manager *sam;
>  
> -	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), SZ_8K, 0, sizeof(u32));
> +	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0, sizeof(u32));
>  	if (IS_ERR(sam))
>  		return PTR_ERR(sam);
>  	cache->sam = sam;
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
> index c5e0f1fd24d74..5210703309e81 100644
> --- a/drivers/gpu/drm/xe/xe_guc_buf.h
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.h
> @@ -11,7 +11,9 @@
>  
>  #include "xe_guc_buf_types.h"
>  
> -int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache);
> +#define XE_GUC_BUF_CACHE_DEFAULT_SIZE SZ_8K
> +
> +int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache, u32 size);

alternatively, to minimize code changes, we can have:

int xe_guc_buf_cache_init_size(struct xe_guc_buf_cache *cache, u32 size);

static inline int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
{
	return xe_guc_buf_cache_init_size(cache, XE_GUC_BUF_CACHE_DEFAULT_SIZE);
}

but up to you,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

>  u32 xe_guc_buf_cache_dwords(struct xe_guc_buf_cache *cache);
>  struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 dwords);
>  struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,

