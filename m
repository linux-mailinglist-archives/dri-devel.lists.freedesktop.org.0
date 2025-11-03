Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD75C2E48B
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 23:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9EF10E4D8;
	Mon,  3 Nov 2025 22:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/GFZIgs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A6710E4DE;
 Mon,  3 Nov 2025 22:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762209456; x=1793745456;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vQZIy/zBTUjowX8lJdnOzbLbBWIVSGnqbOUNe8w20YE=;
 b=h/GFZIgsZfefwxp3ZOvAuDwfn8BypdSxvO2wm1OFMpxkOeN3oZ8IsEr7
 RiMegZkZ5QNfR4+TGbeYr8txqbRl53qa1iozMstCTRFvWeFRe6sVGWQ90
 8/0O193rodp4kGX/8zhG1SVf/XUMGW73H5YHe8janTsGkiy2Wdpj163qE
 5n03ftbCLvlAP556PBTk4BZfLoum23MTU9rsAwnsLMMbkOIHT6C9fElvX
 xaWaamhY0Satc0sHLJMx2Bu2g/siEnL3WBXqMfVOJsI8xLdNbtKMBDUrp
 cfq+R7J/UtiFyb7sbbrIKqYalyQC0cFiltgfCgPVBBex/6XA356OdlQcW A==;
X-CSE-ConnectionGUID: G5cX2JI8Rumnmm6Qup5cOA==
X-CSE-MsgGUID: YOaRD2LaQ5G+uWFy3CQjRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63993763"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="63993763"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:37:36 -0800
X-CSE-ConnectionGUID: 8gnDTWVqTMqBHLVv4mHuuw==
X-CSE-MsgGUID: ie1W8VAGTomOCtBuHL1qHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="186666712"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:37:35 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 14:37:34 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 14:37:34 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 14:37:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0pSiEQwC4kXQNqXD+lT04nnPuxGftGcfM8pBmoJkgo8RSFv5S2gbjPIV4VWGznRvZwvp/pure+2GnufRP3uGrwmtGgWPG/POgnm3rulYPAZo+a9lVyvKfJhIYjcGv5N2ST6CwUZye2PPH55YSkL5yw40KYFwgOZC/zdup4MF5RuAVWmecs2GkBmBx0r14C0f5u+WI6aRnLHuh4BFsPQn2O1u/o5RgkhdSQ1uwZFB1i7EWAJEJoRXuH8T0HYmNrQ8/HXjlG+5uMgId3NV5kmixKVJQ1SIcAh48CQ2F+9fG3uWq4NEbdD/VVa9aEwYhK4KDKDdNID6EwA2n66xYLgUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05f7isybWj0Y21bSK6D/BxqodTTUNWXtZLOMhn1aV1E=;
 b=AqnbkOQA5HH5p6UHK6ZVrqPvt8MqVhrPJ2oBOuZM8DTM8xvIE5oC6DPZcaeBus77tWoxqTjg+aynKIGXHMpsH1J98WfSpIKRpts7iypnPfnoLv7E5kDC3oCWBbtyZpty5d3v4ZuIFAMMTa5wsFUbwfgW55LJbTfEGqZot7pam4fVi1euJEAG/nf7r7aEXplzCRYi4lhUfVnaePro9hrftsPPULH/2ZmDrXsd2cqVYXa6le6lRDSNb0+LMD+qdnNqU+VMRhnEuUi0+o8i65NfBccPx4ftpq4VxyzH9xnNxeF7ftqrPgRJcrIMP9q9XWzXUGG7pz0JJTF0NXpraChi9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7649.namprd11.prod.outlook.com (2603:10b6:8:146::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 22:37:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 22:37:32 +0000
Date: Mon, 3 Nov 2025 14:37:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
CC: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>, Christoph Hellwig
 <hch@infradead.org>
Subject: Re: [PATCH v3 22/28] drm/xe/pf: Handle VRAM migration data as part
 of PF control
Message-ID: <aQkuqa8u6nFVo26k@lstrano-desk.jf.intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-23-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251030203135.337696-23-michal.winiarski@intel.com>
X-ClientProxiedBy: BYAPR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::37) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 11785d90-69e1-455a-3651-08de1b299417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rk5EOWZhZlY0YytPME94SU9rUHNjRTBISmZPNFljN2I0anZPTlEvWVhxTmZZ?=
 =?utf-8?B?ZkVOaWRqM1dvL1FReXNRVE1GaTNpTXRXckxXb2dCNnRKY3dtM1VGRTZZZ0lP?=
 =?utf-8?B?MEJ4RFV2Y2VHNjBxRjRzbktxV1RFRjZiZ0ZpQnFoUEE1eTZROGF4NC9XS28r?=
 =?utf-8?B?ZUNlUGljV2ExTWtaZGlGeThnbllobFA4WGhkWGY1dWc3NWJEbkU0dUE4d3Rl?=
 =?utf-8?B?bUIrSG9GbjlwbDFvSkRRYVJXVGJWczIrRnNzTnlKMEZSZTdlNUVESXdENzBP?=
 =?utf-8?B?RnBqTDNlMmZDUFQzdEVpTEFJSFVyQ0ZjUkhJYmJ1eDJQdis5NVlBbXF5TTRy?=
 =?utf-8?B?Y2JGOXE0S1hJSUlzR04wb2M2UE96bFBLUGh4bUR5dXNjNmVsRVZ0SzhOc2Fa?=
 =?utf-8?B?a242T1A4N3ByUXJKdDdzNlExaG95Y21RQWZKUHEwN0NlbS9NT1hmOUQvNi9Z?=
 =?utf-8?B?U0JyNDF1U09mZjlXVWFza0oyUlRrNVViZUZJNkhRVkhTR3VPcjFpbEpGS09R?=
 =?utf-8?B?aExHSVRvR1pQenRMak01U29NTThFQ1RVWVBjOGhYek9LU1kyMEprWVJrK01o?=
 =?utf-8?B?SXFXM0xkR25qNFNhOGFNRVdjQUVHcllXYmVIM082cUE0Qng5WFA3N1BVRzZB?=
 =?utf-8?B?d2xkNVpNTzA4cTRtWHljMWhNKytONXZuc1RxSW1ycWwrM0FKQlRTWVZpNUdn?=
 =?utf-8?B?MTFHQlNOM3ZQVW5GbG9QMFZDRXY4M0ZvYWFDTTBQaENPVjNBNHQ3YzV4YTJF?=
 =?utf-8?B?S1dwWi9ZSWE5SURoOE80bnBTU3NJV1R0eEhWL29GTUdGY3M1Q01EMkVNd2R4?=
 =?utf-8?B?TDBVOUprY2hMNXd0aUhsblBrZWkyN2UxRnFRSFliN3puV1BiWE11Y0hmZEhK?=
 =?utf-8?B?Q1QwZy8yclErT0pFWjBaclphd1RsS012UXY1R1cyL3R2S3M2ZlVzRVpyZnFB?=
 =?utf-8?B?dTAxNXpJRCtIZmgvUHA5THNjYmFuVmtBRHlGb0JIREEvUzRYa1RSWUU0NHo5?=
 =?utf-8?B?OVA0cUViekNFMmt6U2JneU96c0U1R1RHZ2xRMndmR2F5Z1ZoK3g3aWdHaHRR?=
 =?utf-8?B?YzloS1dPcFhhbjR6UDlaRDgwaFVPNEYxTTlPYVI0SXMrVlYrRkphUmNBZlkw?=
 =?utf-8?B?VjR4WG5Yd2xodmVFaWlRUlY2OG91Tm0rOEt6bzNnZW5WeCs5SVFiUFhveG1J?=
 =?utf-8?B?NW14aHM1aFpxZ1M5SzZOOVhrcVBjTWlzMExyRk5oSXRUYWJlSHNUYjducHEr?=
 =?utf-8?B?MkRmNVBNSEZ1S2liZVkvQXd0ZUl3WGNkT0ZYOTBlTEdJQW9SVlFhb3ZHNFhD?=
 =?utf-8?B?bWdVRDM1bTBDUTVFbWtLN0Q2aWdLQmE5eFoyYjhuNmltc3l2c3daeXo0QUJ2?=
 =?utf-8?B?NkQ0Wmlab1JrOHRHTmcyQ2tWQjFmeHI5bis2SHhEOFlXMi81OUxGTnJhYlFU?=
 =?utf-8?B?eWFLRUM1YXdPY0ZhQ0xTRjJXOGVSUFhwWVk1a1JSS2lMcnRnKy9IWlY3UXY2?=
 =?utf-8?B?OVdyYkxoOUNIN0xwZXlvU0JBQXVoZEEzbFlRMVhYbkZMVG9PL0FPZ29WR2gz?=
 =?utf-8?B?QmNlL2dnS3ZsdXF6cmIvNWFuVi9OWEZLdWZiZUZ1aFZVRzhPM2hhdU9lZ2NW?=
 =?utf-8?B?SXE1UFJpc1ZFZDFVaTk0L3N0bkZsbC9VS2U4VjdtSG1CcXh5UzJvNFdLSjZo?=
 =?utf-8?B?Z3Ryc3VCbXZtVE1YbUwzRmJjSkpENTY0cHJ2dk9pTDNuNE5xaFEyVVVRenl1?=
 =?utf-8?B?dTNSUE83QjUxa2VkOEZuZXNhMklNUWNVMXl5b2w1U201V2tuczRWL1dVcG4y?=
 =?utf-8?B?dHZGK0hCT0lwR05qSXF2YmtJRDZWeTZvdHlvWVdkZWZid20vNGErV2pFdi9o?=
 =?utf-8?B?ZUl5WkpKTGFjTjRBM2FmdytKZjNFK2FidGplcUZJcENkbnJ1OHFFdHNwN3l2?=
 =?utf-8?Q?OB1m9Wvvh/hjOAYN1DfuKE6/vUcQ+iWN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MG13UVZtUUptbTRRb0NUK3RXZVdSY0Z6aWRoN09EVWYydUxLZjhzYmp6d2FG?=
 =?utf-8?B?UFl0RCtUaUhaTE5FUDNndmtDaWxsdm4vSnlSckdYZTlTNlZ2Q3l4M21rTW9a?=
 =?utf-8?B?cVAxOTNNdWU5VHdsQWJNU1hHRGV4M09qQUJVOXMzVzNWRlJucnY5RzdFVjdl?=
 =?utf-8?B?NHFqT3MzNmxCZjMvSzZ4bXFIWHZURDdTRVlhZ2dCY016MXJCQWlwZGhuV1p0?=
 =?utf-8?B?c0JJSlVWWnR1aldsd3pWaHdubWJCWlFBV0tKdWZtNm4ySnZGQVlMWVBLQTlu?=
 =?utf-8?B?b2ZVQWFkNTYvZDkzZ0QvYmxnWDkyWU0rOHRBK0JZeHkxdHFxRDQ5M2tYZncv?=
 =?utf-8?B?TUZmU0hsdHZ3UTJnVHhZWVJCdVZWUDRCbXMvUWd4RkxpRW1OU0pGNi8rUEdz?=
 =?utf-8?B?REt5L3lKUXlSNWJhc1I3cFVXOWlBRnZLdnlRZjFiTkVZSjRvcTZ0eHo3SXg5?=
 =?utf-8?B?U1dhalJrcENMU3BiVFgycWJNUmdGUGdVY2dEblFPQ0Y3dlpJeno3dFlYV0RR?=
 =?utf-8?B?RU9oM0NuUWlSQXhmcFJxa1h6VW1mN1dCMG8zMkV1Q0UyOCtWY2JGNytldjFq?=
 =?utf-8?B?Nk90b09sMUJaNWZoeUpsakhka1FuYlRYd1diRkhZaGszVFdEK0VzWEtxR3VR?=
 =?utf-8?B?Z0xvSUlFeFlxOVZ0ZSt1eEJGWnNrMXhoTVluN3A2amY0VVJXK2Z5SExrRTVz?=
 =?utf-8?B?YVVtWmZ1ckZZOWludk1kWGxQcFpEK1NkRGkvVm9ELzVDbC9rQUNoeWJyc3Yy?=
 =?utf-8?B?Vk5WVkdabGlzU1NSeGlDTVhsZ29QZC9GSkF6ZG8wK2x1bXppS2cwWWZaQ3Rh?=
 =?utf-8?B?Wjh4K1VIcWY1NHpPdlkrMmJyNVc3Z1lOcEdOY2ZZNFRZcm5jNXpva3BNWXZQ?=
 =?utf-8?B?K3RJWWQ3Zzk5TURhRXdKK2RDY3paQXJ5bENQZWNzQ2hZU1ZaaUtvVU85dTls?=
 =?utf-8?B?a25WNGFkTU5OeHN1UGk3SEZxSGRwS2h3WUN3Ly9QeGRZZC9GeldhaE5nbkFI?=
 =?utf-8?B?Y1QrbXhoUXgrcEMzd1JTVmZaVnRIczNtMEVzanlqV29qYjBmOThZa2xFanlv?=
 =?utf-8?B?QmZPMWxsdEx5SnNtMTZKVy9FZTc1cWFWSDQzZHV3MHNpNGRVQmlZQzI0eGE5?=
 =?utf-8?B?dVB0bmRDSE40MkFjMktRRjY5Z0QrTytMd0xXdjZBZWVEVUFOREZZTENEcExF?=
 =?utf-8?B?azJNYUNPRmFFaGlTalMyY1p1SHNVZTBzb0hJWjNMNFVHRnFsRzFMVEUrU1A5?=
 =?utf-8?B?NmttYzhCNTI0ZzhkVy9tdm5HeU5GVng5RndVNDQ3NEtZdjVkOWdJR1UyMFQv?=
 =?utf-8?B?OVUyZ2RjTzVBU2o4b1F3dHJjTlRqeXdTeUQrTmxBdCt6UjJOTkNvVjFLc3RW?=
 =?utf-8?B?bGszcnltOXJERUdQMGQ3R01VbG5JM0VDY0JnVnJDUW9BemJWRXJGRzl0YWps?=
 =?utf-8?B?aUNYa3JFaHR4bjVKcFB1WnZoczg1c1ZWbVZrQTJqdU5FSTdsVFRUdnRSRzJz?=
 =?utf-8?B?UU1lcmJTY05nbEJSN2JveSs2RWREaG5RU25iWlgyMlFuWnBheVJ4Yi9PT3hH?=
 =?utf-8?B?c200NGRsNGcydDcyY1lDLzlQQ1VRZ055aGRKYVJadUp5SVZCWUlsTHo1L3E2?=
 =?utf-8?B?SXpTRUh6VENxVEJQSk1CQjVWeTUzMFlPNm53clZwdVpvWkZ2d2JxazVpWVRy?=
 =?utf-8?B?SllyY0ZsdXB3Rm1jNzVDZEEvTVk0U2s3ZVNRV0pscGY2ZlJyaDZRNUF6MDhQ?=
 =?utf-8?B?aGxJWTA5cmdXT3ZxaS9LdktVMlJtSWptUmh5OVZabzB4SzU1cTQrTW03R2tw?=
 =?utf-8?B?ZmNLWTB2MUd2SWRtRGFzVGN4S2hjcWRoSFF0MjdNZ0VvS3ZVUUg5R09QOElT?=
 =?utf-8?B?TzdWenN4WjZXcnNBS1FRaU1OeVVRa2pFTVVwZ240aXhUVDI5S283MUphb1dU?=
 =?utf-8?B?aVhWY2oyRzA5bDdReUxKbTIrWkthb2Q4YzlvWk9kT2V2WmliWjdmZ0xzS1Ru?=
 =?utf-8?B?cUJBNkpQRi9laEliMVNoemFJeHVIbG85TG92N3hkV2d3NXZMUHVLbHJWVytM?=
 =?utf-8?B?bG5ZczU4cTRXS0ZlNndiYy90d2svb1VSQjVQL3VTUndoUytvV1RLZDJQVm0w?=
 =?utf-8?B?RVdHZVh1L0tGU1UzN3dwNmk1ZmprQ0JJYXROM2tWVzkxMEN0QmVXUnByd1hL?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11785d90-69e1-455a-3651-08de1b299417
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 22:37:32.7701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: som0An8nzUslXbFG3UCGxbR3tpoWtGKPM43VJ8L8he2g2PDrA2bhLqUTGJgMj/1Vf1m/Yc2a5gysxL+Oui+sZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7649
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

On Thu, Oct 30, 2025 at 09:31:29PM +0100, Michał Winiarski wrote:
> Connect the helpers to allow save and restore of VRAM migration data in
> stop_copy / resume device state.
> 
> Co-developed-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  15 ++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 213 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   5 +
>  .../drm/xe/xe_gt_sriov_pf_migration_types.h   |   2 +
>  drivers/gpu/drm/xe/xe_sriov_pf_control.c      |   3 +
>  5 files changed, 238 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index 7cd7cae950bc7..de0f63610e780 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -880,6 +880,18 @@ static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
>  		return -EAGAIN;
>  	}
>  
> +	if (xe_gt_sriov_pf_migration_save_test(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_VRAM)) {
> +		ret = xe_gt_sriov_pf_migration_vram_save(gt, vfid);
> +		if (ret == -EAGAIN)
> +			return -EAGAIN;
> +		else if (ret)
> +			return ret;
> +
> +		xe_gt_sriov_pf_migration_save_clear(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_VRAM);
> +
> +		return -EAGAIN;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -1095,6 +1107,9 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
>  	case XE_SRIOV_MIGRATION_DATA_TYPE_GUC:
>  		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
>  		break;
> +	case XE_SRIOV_MIGRATION_DATA_TYPE_VRAM:
> +		ret = xe_gt_sriov_pf_migration_vram_restore(gt, vfid, data);
> +		break;
>  	default:
>  		xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
>  		break;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index 5e90aeafeeb41..7ccd43545fdac 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -19,6 +19,7 @@
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_guc_buf.h"
>  #include "xe_guc_ct.h"
> +#include "xe_migrate.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_migration_data.h"
> @@ -505,6 +506,207 @@ int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
>  	return pf_restore_vf_mmio_mig_data(gt, vfid, data);
>  }
>  
> +static ssize_t pf_migration_vram_size(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!xe_gt_is_main_type(gt))
> +		return 0;
> +
> +	return xe_gt_sriov_pf_config_get_lmem(gt, vfid);
> +}
> +
> +static struct dma_fence *__pf_save_restore_vram(struct xe_gt *gt, unsigned int vfid,
> +						struct xe_bo *vram, u64 vram_offset,
> +						struct xe_bo *sysmem, u64 sysmem_offset,
> +						size_t size, bool save)
> +{
> +	struct dma_fence *ret = NULL;
> +	struct drm_exec exec;
> +	int err;
> +
> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);

It is a bit incongruent that the dma-resv lock is interruptible here.

> +	drm_exec_until_all_locked(&exec) {
> +		err = drm_exec_lock_obj(&exec, &vram->ttm.base);
> +		drm_exec_retry_on_contention(&exec);
> +		if (err) {
> +			ret = ERR_PTR(err);
> +			goto err;
> +		}
> +
> +		err = drm_exec_lock_obj(&exec, &sysmem->ttm.base);
> +		drm_exec_retry_on_contention(&exec);
> +		if (err) {
> +			ret = ERR_PTR(err);
> +			goto err;
> +		}
> +	}
> +
> +	ret = xe_migrate_vram_copy_chunk(vram, vram_offset, sysmem, sysmem_offset, size,
> +					 save ? XE_MIGRATE_COPY_TO_SRAM : XE_MIGRATE_COPY_TO_VRAM);
> +
> +err:
> +	drm_exec_fini(&exec);
> +
> +	return ret;
> +}
> +
> +#define PF_VRAM_SAVE_RESTORE_TIMEOUT (5 * HZ)
> +static int pf_save_vram_chunk(struct xe_gt *gt, unsigned int vfid,
> +			      struct xe_bo *src_vram, u64 src_vram_offset,
> +			      size_t size)
> +{
> +	struct xe_sriov_migration_data *data;
> +	struct dma_fence *fence;
> +	int ret;
> +
> +	data = xe_sriov_migration_data_alloc(gt_to_xe(gt));
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = xe_sriov_migration_data_init(data, gt->tile->id, gt->info.id,
> +					   XE_SRIOV_MIGRATION_DATA_TYPE_VRAM,
> +					   src_vram_offset, size);
> +	if (ret)
> +		goto fail;
> +
> +	fence = __pf_save_restore_vram(gt, vfid,
> +				       src_vram, src_vram_offset,
> +				       data->bo, 0, size, true);
> +
> +	ret = dma_fence_wait_timeout(fence, false, PF_VRAM_SAVE_RESTORE_TIMEOUT);

Then here the dma-fence wait is non-interruptible.

> +	dma_fence_put(fence);
> +	if (!ret) {
> +		ret = -ETIME;
> +		goto fail;
> +	}
> +
> +	xe_gt_sriov_dbg_verbose(gt, "VF%u VRAM data save (%zu bytes)\n", vfid, size);
> +	pf_dump_mig_data(gt, vfid, data);
> +
> +	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
> +	if (ret)
> +		goto fail;
> +
> +	return 0;
> +
> +fail:
> +	xe_sriov_migration_data_free(data);
> +	return ret;
> +}
> +
> +#define VF_VRAM_STATE_CHUNK_MAX_SIZE SZ_512M
> +static int pf_save_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> +	loff_t *offset = &migration->save.vram_offset;
> +	struct xe_bo *vram;
> +	size_t vram_size, chunk_size;
> +	int ret;
> +
> +	vram = xe_gt_sriov_pf_config_get_lmem_obj(gt, vfid);
> +	if (!vram)
> +		return -ENXIO;
> +
> +	vram_size = xe_bo_size(vram);
> +
> +	xe_gt_assert(gt, *offset < vram_size);
> +
> +	chunk_size = min(vram_size - *offset, VF_VRAM_STATE_CHUNK_MAX_SIZE);
> +
> +	ret = pf_save_vram_chunk(gt, vfid, vram, *offset, chunk_size);
> +	if (ret)
> +		goto fail;
> +
> +	*offset += chunk_size;
> +
> +	xe_bo_put(vram);
> +
> +	if (*offset < vram_size)
> +		return -EAGAIN;
> +
> +	return 0;
> +
> +fail:
> +	xe_bo_put(vram);
> +	xe_gt_sriov_err(gt, "Failed to save VF%u VRAM data (%pe)\n", vfid, ERR_PTR(ret));
> +	return ret;
> +}
> +
> +static int pf_restore_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid,
> +				       struct xe_sriov_migration_data *data)
> +{
> +	u64 end = data->hdr.offset + data->hdr.size;
> +	struct dma_fence *fence;
> +	struct xe_bo *vram;
> +	size_t size;
> +	int ret = 0;
> +
> +	vram = xe_gt_sriov_pf_config_get_lmem_obj(gt, vfid);
> +	if (!vram)
> +		return -ENXIO;
> +
> +	size = xe_bo_size(vram);
> +
> +	if (end > size || end < data->hdr.size) {
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +	xe_gt_sriov_dbg_verbose(gt, "VF%u VRAM data restore (%llu bytes)\n", vfid, data->size);
> +	pf_dump_mig_data(gt, vfid, data);
> +
> +	fence = __pf_save_restore_vram(gt, vfid, vram, data->hdr.offset,
> +				       data->bo, 0, data->hdr.size, false);
> +	ret = dma_fence_wait_timeout(fence, false, PF_VRAM_SAVE_RESTORE_TIMEOUT);

And also here the dma-fence wait is non-interruptible.

Aside from the incongruence, the usage of drm-exec, dma-fences looks correct.

Matt

> +	dma_fence_put(fence);
> +	if (!ret) {
> +		ret = -ETIME;
> +		goto err;
> +	}
> +
> +	return 0;
> +err:
> +	xe_bo_put(vram);
> +	xe_gt_sriov_err(gt, "Failed to restore VF%u VRAM data (%pe)\n", vfid, ERR_PTR(ret));
> +	return ret;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_vram_save() - Save VF VRAM migration data.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_migration_vram_save(struct xe_gt *gt, unsigned int vfid)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid != PFID);
> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +
> +	return pf_save_vf_vram_mig_data(gt, vfid);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_vram_restore() - Restore VF VRAM migration data.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_migration_vram_restore(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_sriov_migration_data *data)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid != PFID);
> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +
> +	return pf_restore_vf_vram_mig_data(gt, vfid, data);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
>   * @gt: the &xe_gt
> @@ -544,6 +746,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
>  		size += sizeof(struct xe_sriov_pf_migration_hdr);
>  	total += size;
>  
> +	size = pf_migration_vram_size(gt, vfid);
> +	if (size < 0)
> +		return size;
> +	if (size > 0)
> +		size += sizeof(struct xe_sriov_pf_migration_hdr);
> +	total += size;
> +
>  	return total;
>  }
>  
> @@ -602,6 +811,7 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
>  	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
>  
>  	migration->save.data_remaining = 0;
> +	migration->save.vram_offset = 0;
>  
>  	xe_gt_assert(gt, pf_migration_guc_size(gt, vfid) > 0);
>  	set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_GUC, &migration->save.data_remaining);
> @@ -611,6 +821,9 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
>  
>  	xe_gt_assert(gt, pf_migration_mmio_size(gt, vfid) > 0);
>  	set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_MMIO, &migration->save.data_remaining);
> +
> +	if (pf_migration_vram_size(gt, vfid) > 0)
> +		set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_VRAM, &migration->save.data_remaining);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index b0eec94fea3a6..85b43b2cceb73 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -25,6 +25,11 @@ int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
>  int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
>  					  struct xe_sriov_migration_data *data);
> +int xe_gt_sriov_pf_migration_vram_save(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_migration_vram_restore(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_sriov_migration_data *data);
> +
> +void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid);
>  
>  ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> index 9f24878690d9c..f50c64241e9c0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> @@ -20,6 +20,8 @@ struct xe_gt_sriov_migration_data {
>  	struct {
>  		/** @save.data_remaining: bitmap of migration types that need to be saved */
>  		unsigned long data_remaining;
> +		/** @save.vram_offset: last saved offset within VRAM, used for chunked VRAM save */
> +		loff_t vram_offset;
>  	} save;
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> index c2768848daba1..aac8ecb861545 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_device.h"
>  #include "xe_gt_sriov_pf_control.h"
> +#include "xe_gt_sriov_pf_migration.h"
>  #include "xe_sriov_migration_data.h"
>  #include "xe_sriov_pf_control.h"
>  #include "xe_sriov_printk.h"
> @@ -171,6 +172,8 @@ int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
>  		return ret;
>  
>  	for_each_gt(gt, xe, id) {
> +		xe_gt_sriov_pf_migration_save_init(gt, vfid);
> +
>  		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
>  		if (ret)
>  			return ret;
> -- 
> 2.50.1
> 
