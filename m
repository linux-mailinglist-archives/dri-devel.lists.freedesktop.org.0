Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A663EB2AE6F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 18:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101FB10E064;
	Mon, 18 Aug 2025 16:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vg9QT9T/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4F510E064;
 Mon, 18 Aug 2025 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755535456; x=1787071456;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KXEQqKd/jgd/yhHPLnQanWQ0jbUOGzvu77oPXB6Lsjk=;
 b=Vg9QT9T/OBfCoh8fq7DM78isTBkiV6RhMg0MEOASph92E1sVy4AaNyrM
 YGjEBJ3/95uVqIJaL3wtH1t5oeN0AkVhkbA530NqTL7Hmaj2C9duxLxvv
 yYy+MQaI2RejERie3kp8NPyDj47nowI0htnweCeQxBMowf9BXJ36Jnozu
 5Z1NAOHb4AiJBVTFbOLLY0lTvTUuMuhpuLitY6Ji+Q7IvR0CWPuxF+2fr
 G26LiyTxkfG4J11l85z3dj6NCQJXko1mUp1KFOVBp5rCQYp/UAPnkTMrV
 6aGqVf7JjfsOUF6i5axsFPP3f8KLl9iZeKB5DkEVJOpQHsHoywpWA/KdE A==;
X-CSE-ConnectionGUID: BKJMlaZuQRypugYHDIkUzQ==
X-CSE-MsgGUID: yEWAttIPQHOcFw+r7TjAnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57914061"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57914061"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:44:16 -0700
X-CSE-ConnectionGUID: 6o+Q6a8TS/StvD/ljeLQNg==
X-CSE-MsgGUID: wEYMzHKySGa0CLAzuLPlFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167863602"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:44:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 09:44:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 09:44:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.57)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 09:44:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rf2z/SNkJog2XK3OQj54hu+M89xqcaksvxToRPz0fcl6/b1xZTUbwQE5IqOs6fN/ZezMIuF0vfgsL1We29s1Wfna6CtIWs8Iy+SLYIPzLZovQGrhS/Xtn14pGPqTMJ8Fe24WFrTjcMC505G28KboGCR2dlZ9x6JrEpaYqGT0ZI3GFrYFZosCq1pa4CIIbfw25xPu8vPR3Wsg593yy0+Yy8a8NGe2lPMXrxJ8M0iJzMNF/bFI/lvZ1puYqZc7wIGE57GjHEDS4Akr3yfwdLSNe4SKFkiQDRLxXCe6+AIuAAdD1qT3hk2lxw+e9/b1/3OFfUTLJWWgrwGvcNycuQRepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZEaL/pqQcGyNWCekLjmppWKs1IZdz/eIYCL7uLYPzs=;
 b=AbhjGgRtOh+lF33GaCruQ8jLgEH/XDKwOm0TLVYieTBiHw9NWjVOILfEBz/LwoVZZTJ4NmkfLYHlXCu1x17b/Cbc10FRSVF2KHctBFxngipxWuqCKhlU+8llGXik+KNfbI9jKi09n3FHLKB00moIy7yMCt4MKy8bdpzFcPWH05QxwMnGNEV2WDkHEUYHLlfmJ6J/3SylApWJeVXjPq+nWKtktr5Cag68PQ2/TkYWy3xGEZ4TT+AE7raco1TRQU3ByoNdHqAcr92vE9INKeUpwgHArUuiXiwOjuFh70hKBf1+gW1VXNzNwXSkJRu722S7x+Dsn5CAW9wrxmnXfb35Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4717.namprd11.prod.outlook.com (2603:10b6:806:9f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 16:44:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 16:44:04 +0000
Date: Mon, 18 Aug 2025 09:44:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Subject: Re: [RFC PATCH 1/6] mm/mmu_notifier: Allow multiple struct
 mmu_interval_notifier passes
Message-ID: <aKNYUaPS0PiRk/yj@lstrano-desk.jf.intel.com>
References: <20250809135137.259427-1-thomas.hellstrom@linux.intel.com>
 <20250809135137.259427-2-thomas.hellstrom@linux.intel.com>
 <20250818160726.GH599331@ziepe.ca>
 <aKNT8GUu0r3i4Ikq@lstrano-desk.jf.intel.com>
 <20250818163617.GI599331@ziepe.ca>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250818163617.GI599331@ziepe.ca>
X-ClientProxiedBy: MW4P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4717:EE_
X-MS-Office365-Filtering-Correlation-Id: 7905642e-172a-48ed-1552-08ddde76713d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHN4R1NOejRrK3ZqbUpZZ25SZnErbWFscHFDeW5vbFNXQkZQMUJDV3VZUG1p?=
 =?utf-8?B?Y2lqbDh5ODk5SmtkZUpnVElYWUllQlgzcUtpWUUrUTJGUURJWnB2dW5hb3Mx?=
 =?utf-8?B?U053b1lHN3NnQjhtaFVydno4cHZQTkZLZVBvZ1BJNjRaaEVSck81d1VIQm1x?=
 =?utf-8?B?ckJGT0tjUm5tN3dadERXS0tPSkJRbjY4TEpKUkNEakw4NWlXZVh0QStyTU5t?=
 =?utf-8?B?bjRrSXJXVnZsUWxRa2kyOXMzdHZuTlhRbGUxSUVKSGF6MHNyc0dzRWFoRVlM?=
 =?utf-8?B?Q3lRQlFkR2J6OHZiVnpEOVR6d2VNSi9DTEk1b2tsckpFVUR5a0VVd09hbmZ2?=
 =?utf-8?B?RmR6OS9OL1k3TEd4QzJvdE1zRUgvK3l5ZE9hYVlEZnpIOCsybVBFVEV5WGY2?=
 =?utf-8?B?dUk5K3dRUjRCT0pDenlnWWwraVpUQk9kMjZBd0wrNlQwMXZDK0VpaHdwdjZr?=
 =?utf-8?B?VS8vWTl3WW1oMTE5NmJ3UE43MjJSWE1zK0lkL1I3K2tuanV5UjVoT3lMRkRZ?=
 =?utf-8?B?OHhIK1VrZVU4NW9NaUp1bU81N0N3ZjVVV1g4c2pJV2FSZVRQYjlmZ2ExZlVY?=
 =?utf-8?B?YnZPOWFhc1hLYzRodW92SG1DOXZkbUppK1FaU1VBSENoSFR1T0xYclFWdHVx?=
 =?utf-8?B?NmlaVWhzdHFFUGJJU1htQkVHcjRSU2RKTHQ2dEtKbWJvaXBkbUJacGJBeEhm?=
 =?utf-8?B?ek50eHR3T1BLQzJkR0hjbmtKcGJUdndlRHoyRW0vMmYrbE9OMWFaV1pzMzhv?=
 =?utf-8?B?ay9XRzJOaUtHYmdnNytEWUwwWVl0VUY5cFAvaW9GaTZFMG0vZXBYaUpmOVFF?=
 =?utf-8?B?TVBDQUJxOVU4M2JQNUxRWGROcEYxUndqZTh5NEMyMUMrK1BTOEhzKzhETkZ5?=
 =?utf-8?B?NWFZRjhmOTZWQURKOTV3QlhneElqNUJiSEwrQm9Cb25RQTZXSTJaNk9hYVhs?=
 =?utf-8?B?ell0emw0VE5kM0hrSUVpQVhsblZ1WjdPSmdaaVhkWXlyVnpiSTNjVThuNzVB?=
 =?utf-8?B?WkhiMENxY0NoWnFGNnNubk5yWTRPd3ZOcVJpb2dVbks4UHVzYS9QYno1Q1dC?=
 =?utf-8?B?ZFQ3Vk1ObmF4UmcvZ1B4aFI4MTRtTzhhN090RXlRNTdZZ3BmNHJaL05BaldK?=
 =?utf-8?B?VGxzK3BUdWhNellQbnRGNGdnMkJZNEd4a3FLRWRTSVV5eVUyR0x5WkU0a2RQ?=
 =?utf-8?B?NmRiVlFGMVlYVm0xaUhsblAvZWhRUWJxbmNTZDNwb2JEMG9LUnNzVzgyVDVW?=
 =?utf-8?B?a3FGcC9HZm1sNXB6RzlrYzgvdHlnVTVmRXhsL1k3STVHbUFrZ3c3SXdMU0pn?=
 =?utf-8?B?K0x2Vk9NM1RLMU1UV2FVRFdaY3NwVHhtWWxzUzBXL0tWazdva1hmdFM5TWly?=
 =?utf-8?B?YzZ4WTY5YlBUb3VPT3h5RWkxWVN2Z0xjMGc3RndjMkREQjVQQ3gzMjJZdjZh?=
 =?utf-8?B?b29kL0Zmd1NXa2p3Y05pVG1XQXUzRG9KdzlkM1BaSFRhMmdTQU5EekF3bDIr?=
 =?utf-8?B?SmptV0oyNGpwSDBaN1A4Zmx5YXd2RUFGZVV3aVppeDYzK2lVdEJDWmFKMUE3?=
 =?utf-8?B?WDdCZzZ5ZnBhQk9ZMUNVNVpCOUhiWG5FeUZNMlhCdDVVSzJhY05SdGl4ZFdT?=
 =?utf-8?B?WTdLV0VNMVFERmdaU05jY2s4YkpRNC80Z0xUc2dWbjBjVk1QaDhuRnFMTTBW?=
 =?utf-8?B?YTFYMnVzSHA5MWlXbVN1bVh0VFB6K2ZtWE42ZzVmd3lpa3k2MHFVeGNGa1F0?=
 =?utf-8?B?TWw2bFRsQitmNTV6UWNuR2d5S2JUdlRVdXlmL2FDYnRucXVuSm9ZL0k1WVFX?=
 =?utf-8?B?cHVBbnQ2MHowWUFmeEV3Y0JPQTEyN1VSNEJHeGxsQ3krdFNuQTRWTUZBTWw2?=
 =?utf-8?B?V3czM2h3bENsY0VMMCtXOFYydkdXZ2lWRDIwMnJ3cHBrbE1FWUlId0N1MHlI?=
 =?utf-8?Q?9hKzcaJY13A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlRHTklMSlVUM3RiaW5JMFh0UXhPb2NMdzlNL2xpUUhuS3Y5ZGFhTkdNWml6?=
 =?utf-8?B?YjFwWHJKSTJCVjVocHNSN1RSanVKUElLdW9FSVVETm5iSUE5TTNOSGI5SHlt?=
 =?utf-8?B?SjBaaFhlcHVqUnJpWUwrNlBNc1BnZ2wvMllFdHB3SVZWZDcwM3A1MTVDOXA1?=
 =?utf-8?B?WklzUVdNLzlYU0lHOWZUMU9jNjBYeGJid2ZOaEFkSlpEdHNDRGpiS2lMSkxk?=
 =?utf-8?B?YXJJaEo0WjJSVFg1UCtjZGoxN2NXNTJwWW5rQlFiR2lkeWNJbURYVXc3d3ZJ?=
 =?utf-8?B?Uzd2czIxakRvRW9uTTJDem00UUR6c2dsSFVGS2ZDMXorTXlrbHZZNWtoM2g0?=
 =?utf-8?B?L2VjNHNQMHFSaEJZbm56S05RQWtiY0Y5dHdpNmFLYTZIV0xhWFVBR2lnS28w?=
 =?utf-8?B?bXAyNlBIVStYM2FOb0pLcVlTNEU0N3liM0k3WW1ZVHZrT09haEEyRFoxa3pq?=
 =?utf-8?B?VElPZjJKTzZOWWRUMHFITGRmcHpXSU5MSUY2elRWVW5FWHVyV0F3NVV1U2VU?=
 =?utf-8?B?eXp2ZHV5b010V2VVNERPeFhaQ1FZeDA2bjRNK2Z0YkpQd2FYaFRvaWlNSEky?=
 =?utf-8?B?UWl5VTg1Y3ZaUEZmbHJDTkhQejg4YmROOVFLOGFkU0VoQlhBM1dHdy92QmpH?=
 =?utf-8?B?RGIyaGErdExwKzQwYnJiNWZFTDY4Qk00Ty9qOGpENXA3YUJuMUN6WDk3WXZQ?=
 =?utf-8?B?ZUdIdjRWNlY5WklZNW1hbjhwdU84MGZnenVrTEZvYmxmL1JqNlJQWFVuU0Fq?=
 =?utf-8?B?RVZqcUUreSswd2tpdnBiVGtIU1NqbU5WQUgyaE02ekgrQ0oxOWcrOW9hMllJ?=
 =?utf-8?B?UGdVOWw0QUZhTVFHWVo4b3JWSmU0Z3VEd1pKWEM3SytLa21uK0hpOTB6TU4w?=
 =?utf-8?B?UDNCVEdmd0JyWU9raGF6QXJpdXd0SmQ4VWNoVjVpbXppdEMrc3J4UDd2aUhn?=
 =?utf-8?B?cVg5b2ROZjlWdVNIaGR2YXRIbzhUZDVLWEszbjAwQVdNdFNqZ1pkOStvTVZY?=
 =?utf-8?B?bzArZUtDSWt1R3UyZzUzZkZvQ1JHSHZvckZURis2QVhtVnQxV0l0UlFzTHZP?=
 =?utf-8?B?OWpYalRmUGpFN3R2MWpXQjZLUDlQVVlPQitLSzZQRzd1UEhEakp1K2xnY21X?=
 =?utf-8?B?cmpZSlA1YWY3NkVoeEtnUUN1NnZHK3FPQ3RkMWhhR3oxaStSZFMyaHFCajVw?=
 =?utf-8?B?UHBodGJkQUpYL0E5Q3pMU3cyU3ZOaS9FWmtZcFRSUmJjeHQ5TFJVNTI2RWxl?=
 =?utf-8?B?NWEwbUdCTWVlSmVHSDlzWkdEcFFlbjF4ck1HUHdoSlJ5TzBhSDVrbU84eGFK?=
 =?utf-8?B?eUlFYVdTTGR6ZFU1NjdRYVZ6d3JOWjdNQjFBNE16RFNHWC9UcDluTTdWT3Nn?=
 =?utf-8?B?K0txM1R6bFJGYmhBSzEwRmhvMzQ2ZVBhVGxFYjJGOUJjeDlBSkFUNi9hMmNw?=
 =?utf-8?B?eTh5NUQvMFRaQVlVUFZWUzNMSnI5ZzdsMW90RmloUlpPQ29NUmNBbmtSV3lo?=
 =?utf-8?B?eVllaUFMcGI1ajlidlRtLzBDRlRmT0UrTTlNNXZQR0cwd1d1bC9qNjlza0xO?=
 =?utf-8?B?YWNucmFVU1MxQTRaTWZkeGtKTHRFZWhlelZCVUwwR3pSVzh5RjVlYVZvNEFj?=
 =?utf-8?B?T3IxMU9Jem16Z0xXcnU1WkoxYkVqQ0YzRzQrM21paFVsZXJpU2lBSmZwZ0F1?=
 =?utf-8?B?VlVtYkNKUjhKMEFtcWFaUnE0dU5NNlYva1pxUm5PM2FFYWIxQlRzT1VZdDFy?=
 =?utf-8?B?NzE0RU9QSzBmM1N5Q1NJNnRuUUJIWHB3NzNDN0dXSkczczFwaDZpUGZaelYv?=
 =?utf-8?B?QTZhaFlCcStPS3UycEF1eG9UN01YbE5NUExkWkxWM1laOCs3bjdvQm9Va2pS?=
 =?utf-8?B?djhzSjBUamJZOUtieHZlWTR4MS9VajhSbEZCbFYzTnAyRzB5aUdHZzlQTzFq?=
 =?utf-8?B?S0FqKzdBNEJ5SnRzSVhpZlNJN2E3SCtkakRFdjczamJEYzlONU9SdzJxQkdE?=
 =?utf-8?B?TmJpWTdaWTBINDRLS3E2WnJwcmV2ckNSM3hid1hObHNhTlFYdE5xbGxBano2?=
 =?utf-8?B?QmlCQjUxYzVCNDdFZHpVRnBzbnpHVmt3WlJuSkdVbm9WRmJKbnJPQkVwSHls?=
 =?utf-8?B?MEpmd1hCK0lnc1dla0h2aTVRSnRwdzNxNXRycmpKOGtSdEtFd21UT0svcnJS?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7905642e-172a-48ed-1552-08ddde76713d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 16:44:04.5304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWoA94jz0aoGVW7Kwla07yFFRBLphwa11ZazkJXTQ8omRYvKc29IyfKJX/8s3qiflCXiBS457rjiFDP4dUCSHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4717
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

On Mon, Aug 18, 2025 at 01:36:17PM -0300, Jason Gunthorpe wrote:
> On Mon, Aug 18, 2025 at 09:25:20AM -0700, Matthew Brost wrote:
> > I think this choice makes sense: it allows embedding the wait state from
> > the initial notifier call into the pass structure. Patch [6] shows this
> > by attaching the issued TLB invalidation fences to the pass. Since a
> > single notifier may be invoked multiple times with different ranges but
> > the same seqno,
> 
> That should be explained, but also seems to be a bit of a different
> issue..
> 
> If the design is really to only have two passes and this linked list
> is about retaining state then there should not be so much freedom to
> have more passes.

I’ll let Thomas weigh in on whether we really need more than two passes;
my feeling is that two passes are likely sufficient. It’s also worth
noting that the linked list has an added benefit: the notifier tree only
needs to be walked once (a small time-complexity win).

Matt

> 
> Jason
