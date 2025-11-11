Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E73C4A2E0
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D2910E4C2;
	Tue, 11 Nov 2025 01:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRgecixH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD2A10E4B9;
 Tue, 11 Nov 2025 01:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823148; x=1794359148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=d8qjWSheMZo0WA1TBrro7J3djB+xmynEFC9iPUm7b6Y=;
 b=cRgecixHyQC8yBSqxi5OiAtjTNuOzZD1STcARC2sazRnY2XhVjr8pTIU
 ELlUPqIsjeADo4xeP5tYP0LV+qPKVCLuNcGFIWvTbq+ReHzc27yAz3rdd
 mGzYU+pnbCvYGluZxCLcdD1XDQDU+/mklpRj8reOt/32hRbdBrxm9+Vvs
 udFAZBMJUAJGCZGoc5jsS9XmNwf4l7VYz6K/JS2G5Woli3MEEA3mfjVGg
 uf562ft1VqqFZcOzRhbsGPzSbv7uLAhfqw8ihhVkv7T+oisRQVOC+D/Ni
 lfbE3uiYtCv95FeQmiQyEkY4D/OxYi6DBuUMe9IOl75DqQekez2zTk63L w==;
X-CSE-ConnectionGUID: 4/wO8XpgSQeXuGzXcFz4Ug==
X-CSE-MsgGUID: KslzPHNlT0uiFZVH4utrKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64794463"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64794463"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:05:47 -0800
X-CSE-ConnectionGUID: dL8LRK2WTR+SIlMJ0WD6xA==
X-CSE-MsgGUID: sBQkznbgSiyN0l0UrNuk5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="193203688"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:05:46 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:05:46 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:05:46 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:05:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZS9cvAV/A1Iki1z93EGkJJk0JmsgBoCZYipRYLJSaeijoR6bZWNryIJiJte/zbaPt7SXd4tZqLXR9teV0C98kGnZr4etcu3YYE1Gw001gHhvPJipdsj54PEcHMDiJBmpY1PTo8/GjtStfPyvFNBCkc9jKJE2afYzyh7ygUwkXrhT/V9AqKauo4hCyR2SuclXcCCByGPUOaQeTYulQVsDrF8mCv/wlrGUX7ZcynBPWuI9tXM7BxrLIchf86DMEQnsE7/EMmad93rA+c4rlg7JyIeQMrAyj6EstEwPuisM2F7HaGMV7q/tVxX1fQ6S+7FLzibpPJLRecJ6jtI+5YSbXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QZ/TPNl7jgmk7HpEtvEZzuhNqJzBMWF3P0m7ldPK94=;
 b=ihe8EcYMCfm5KGZ6WHwPRmImE4HQ1TTpZU6KriHuIcyloizgpIEbfp+TnbbjbufpbOs5PFzxqf11XxWxJvQUGIPvtavyX+O/osyUNZ4tZLrla2SbrnHwet5HIJ4gg0icIaW08EO7wBBj0R9bZzEpp2w/pOQSgVyJaNC0z3bJXKVoU6EV+BGcKdSDn1wqFwzCfeX1RGtzaS+u/acblG7LBQDH/fZqMOZYjjLhN9TCgYdIobzSctN3jrbER5wCcC9H2a6UNKNZIRE4NSzu/eQLK6zJ5I3xLAoV4Yehc5Wg7Ubpembaf+7hUoIu6EYGkWiT5Ok7qJZYRBzVE1WdbGqdQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:05:43 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:05:43 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v5 08/28] drm/xe/pf: Add minimalistic migration descriptor
Date: Tue, 11 Nov 2025 02:04:19 +0100
Message-ID: <20251111010439.347045-9-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::7) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f0be25-5d04-490a-b3ba-08de20be703c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bklrMCs4Qlo0YTVaUzdkLytNSlF4K1BqUk9jZHI3YjdXc0ErQ1RDMVIrUmt3?=
 =?utf-8?B?QXdpRlBsMGRkZzVXM1VqTU1CMnh2S0pTUjY2a05heHZoOTJoOEN5b1VWMG1n?=
 =?utf-8?B?dmFZb2x5dnQrZFVONFByS1ozR2Q1OVdrYkhPSDd2eVFkRUNic1JPZlZlM01s?=
 =?utf-8?B?OVBIcFhtOUdTWGNDSEQxeEN1R2FJYTAwWjNpZE54UFAwZVJyTW9Cakgzb2dh?=
 =?utf-8?B?bk9teDIwd1J4bm5vS2U5bzEreEZSN1JtVm44bU9PQWgzOW5Kd1M2YXh2Njdv?=
 =?utf-8?B?eHM2OW41VGJ3czZ2QW5aU1hsd21PWGQvanVHTXo2VTRaU0NtS1lldzZJSEZw?=
 =?utf-8?B?NHg3ZURVd00xamJFSmVGR1pzdlJ3VVFCZGNkYUdXdFJKYVloTXRWNERsQW5R?=
 =?utf-8?B?MmVFdGFDU2lpUjBxbXRmRTNUeFpsRklqbFRzdzJIWHNXRUFwSnhmOXkvVlJ2?=
 =?utf-8?B?Y282Rkl6Ukl1NnZxL0F1Y1NDaXlrRVBUWkNHZlVqdmdRaytWMG10dXc5cjhG?=
 =?utf-8?B?NmVWWFZING94cDhjYml2YmgyenNpYmNObTgvVmxUMk1zcW1kYXNHQXBTaDcx?=
 =?utf-8?B?Y3BxZ0tPR2lHSlJ3Uks1eUhST0hjRUF5amNHMS9pYmh3TVpZc1M1UGMrNTZ2?=
 =?utf-8?B?OVA0OGlHMTlRWEFiZHdlUzFyc3Y2MEw1R0lGYkd5NjU0eEduS2IxUDBsc1hR?=
 =?utf-8?B?ZUwvTDZtcWdSdFpUamZSbmk5b2lLTzJSeGJLNE9jcThEc0c3Um9sNGlzdXE2?=
 =?utf-8?B?ZE1saG5ST1lkWFZEMG96aGNsdTBBOUxRVXFmZ2wzUGlJRUJHN1hHNjYzTWNv?=
 =?utf-8?B?YlZkMTU5eDlFQWE5T3V6WHM0S3YzcEtwTGtKNkREQVBseXJwOXlrc1YxZVdx?=
 =?utf-8?B?cVFpbjFhMTNzQWU4VVNOT0VjZHFpMnJXakkzcktJTFY4cFRoY0kybjBxcUdW?=
 =?utf-8?B?dTNRME1aK2dJVXhrM1dESVBaeHpuMXIzUndtaUJXTE5MZlN5SjFSUzJtbzRl?=
 =?utf-8?B?MUorMTRqN3B1R0tnckFBWm8vaHpTbnRHVVlBaXg1NEVuUXF6WHJMZVFmVzZO?=
 =?utf-8?B?N2lQK3hZVUJPUXpZL0taQXlBT0JiK1huc2pNbmEvUU5EdE1UNEtMYzhJRHhl?=
 =?utf-8?B?NmUyQjFlZGluM3c5WmlucGFRYkU0clQ4T01VWkNRNkUzeXRmUlNPbTlUQWVO?=
 =?utf-8?B?UDVLdG1WVDlhb1Jxb2JkT1E2ZGhzK0VKZGhvc0sxOVJiVlZJZHNhYkZvSlQ3?=
 =?utf-8?B?eTh1M3dsR01lOWdaZnVRMSswWDZZMHBDWmJ2c29zSzcyL3NZNmFsYTVvNXF4?=
 =?utf-8?B?OVdrL09qS2prNjNtV3JpR1VGMGhjS01Na3VPOGRwRnVvb2NxS1VvUlJ6cVRy?=
 =?utf-8?B?SmRYbnlxL0ZmRWZONys3cFdUdURqNDRsWGFKVVRRVlZJWk1CTkNpREZBSWlK?=
 =?utf-8?B?MWhlMnJEakxrOEVWUFRrUDkxWGttZjdtdFNEeFU3bUg2WHpobkJ3UFZ0cHo4?=
 =?utf-8?B?bllYaWFwcjdrQkN3MVdETVNEMjBJTHVsNXR3SkIySGNJR1Z6K2hJNkFjWDNm?=
 =?utf-8?B?R2QwYU5nQVRmYUJmS09ZZlBPckRZbXEyK1NvS1JMS3NhcEZzLzJvWWhrM1dJ?=
 =?utf-8?B?YlIwTVljN2R6NlpaRmRUS3ZQUXk1cURRWWI4T3ZQa2plVGNhVW1Rc0JMTzVD?=
 =?utf-8?B?MmhIS1FSM05kYVNiMUEwVGxOQkZMOFNRaU5LRWo4bGIvRW83a2pYWUVtUUt1?=
 =?utf-8?B?cmE1VktITzdyejQ2WVI3MDJ2N3JGTndtVmJBenB5MnhxNXdqdVFCQ1V3dzJ2?=
 =?utf-8?B?UzB0cEFVZ2ozN3ZNUzU2YlZCb25NeGNmSUdJZkdFaDNxRExlbE1QNTJBNHk2?=
 =?utf-8?B?OUZFZ05FbjZQVmE3NGczM1VxaC95SkErd1ppSnNCNUNzeWhFbjhTR0taMnE4?=
 =?utf-8?B?TDlJRVJ1VUl2LytvVEpsVmxGWloyR2pkSWJnRG9YejQrMVFOQmJnZTJkQ1k3?=
 =?utf-8?Q?UQDt5XUWP31W5VLPdwgBOYXt+Bor04=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZndQMXV5SU8rL1NIdDc1U2V4cW5DSEtveUtGc1E4QWZjaSt1TjFPaGRPY0Qz?=
 =?utf-8?B?c1RtRmV1U1Z0OWwrUXhlekNaSDhxNm1MTHdZT3pSYnN2ajE4RTJiY2pYeitv?=
 =?utf-8?B?eUIvaFdUTVJRUFMxR0c3Vjh4TkNIbzRSOHpOWmczZlRYZnIyWWNIWjA3eEsx?=
 =?utf-8?B?NC8xMVg2N0RKVGNlZElBRWZSaVpoWnA0WmdEK3d1SEZMSjVlNzlvR3YxN0Vs?=
 =?utf-8?B?R1dPRXk3UEVjLzhNZyt3djVBbmRsR3FVRE1zd2owTUI4dXZ6Z0ZUZmg4OVJJ?=
 =?utf-8?B?NTBrRmtIQ3lIcEt3L2pPOUdPWDNOMTFJM2tqcHpYNENma0hid2txSHkzMDJ3?=
 =?utf-8?B?TDd5NU5oNUlwRVYwQVg1aEpBUjQ0YTZiTnJZWmdWV2doTDRkKzhUZ0ttbDBK?=
 =?utf-8?B?b3Y5UkRWcUFSbnh2RHJIaWgycUZ3RDlnZExLTytVQzhWTVgvN1dZTVJVRHRF?=
 =?utf-8?B?MUtCNDdTdlN4Tno3OVZkdlBBbjdXWnU5Z3NVNkRhdk0veWxwR25iWXFzVXFT?=
 =?utf-8?B?ZTNod2xNaHZKWWtIN25URytrZG5ibFNudkMrakZYYnJmYm1hOUFYRlFPcmc5?=
 =?utf-8?B?aGpGMjUzWVFqYjNMenVrQmhkb2ZNOVpIc1N2ZW1JR2Eyd1hWKzgzYzNlL2Vo?=
 =?utf-8?B?WHp5M003ZDhYUVc1NFJOR3E0N0NyWGpBc1hFMk01WGVWSHJkL29ydGlrNnBt?=
 =?utf-8?B?elkvOVg2V1hvbjBKSmZNSVBLeEcvTVJBYmZzSG4xQzBLRS9YTTR1WGUrdnhj?=
 =?utf-8?B?aWhFVDFZTWE5Y2Y3R0hSMkx1TmFUMHRwVkkzek4yMFI4WUZnS2lyamdoamI1?=
 =?utf-8?B?eTd3VzdqWC83VjBacXMxZjIrRENyZGJOazdPNFdkcjR2eGtqVy9iTndkbUpN?=
 =?utf-8?B?ektvakgxeUlUUjVMWVkyRkR1L2RLWG9YVitmUytZSzk1U21udDdFMkZGSFNr?=
 =?utf-8?B?TmdBNzQ0eU9WSWQzNk13bzZVc0hlbWp3QzZhcXhNbFpuRFJCMFc3ZlZ2UlJ2?=
 =?utf-8?B?dmFzMUc1RzNUV3pORjcxY2J4a0l5T1BJY3BjdG1ZbjI1OWhLUDhBdUtLeWxN?=
 =?utf-8?B?T01mOGkwZHJCK2NkM21rV3lsR1VoVmJSWWxQOTdSbUJsWlZJS2ZxS3FYajJp?=
 =?utf-8?B?RFF5ck1LdnBoam1qeUpmU2pMZVhlUndpVldBZXcyQjlHUTdrdHZrbzdIdWkw?=
 =?utf-8?B?Y2grS0VWTW9NRjhhdDNuVjkxQW15cm1SaWxxRTJIaVovZHlCTHo3emN3bWxZ?=
 =?utf-8?B?MDE5Z1UwR1FmZEdUUFhpK2VnQ2p5VHBwSVlrQlRTL2NLUlRWMDk2NXRLUVB3?=
 =?utf-8?B?ZUljc0N1b25LTmpxSTRkMU9TcS9xUXNJRHl3RGU3aUlxOVRIWlFJZ0xlemE4?=
 =?utf-8?B?TlNyVnhmUkxOWXNvTlRqa2k4OXhOd2dXN2ErVHMwaUVsbzdPZ2tteXNFUFB2?=
 =?utf-8?B?UlZnd2VCVVJLKzBCdXVGZDh6YjFXSzh0cnlXZ0hvNkNOZXhoT2VHOU5RZjh4?=
 =?utf-8?B?YjdtWmp4aTlSTG9qM1BONEY2anE0Rkoyc1RxUi9sQk40V29PejFWS3hIdXM0?=
 =?utf-8?B?cVoybTI5bGR5bkVYaERsZHNVZHQvQnJKZ29qOHN1OU5YbkdWYmFFajlOenky?=
 =?utf-8?B?WjBlYmxpOGlSd3ZNVklzVmJpbitCdEI0VUJUdFgwS3F0U0pIalJQbmtvTTRF?=
 =?utf-8?B?Vnk0WUUwdWxVdHdLUDF2MWxObml5dFd2NzNDVHZkWnB0b2czdFpQai9zWjhl?=
 =?utf-8?B?US9vL1RrajNFd1g0M3BGREZUZmJnbDVkYjE0RE9keEkwSTRibFdQeUJzbUdG?=
 =?utf-8?B?VW5iSms0cUtMYzE2K1BnTHFtSklmMjVpNXBkNUN2NHhEenhhL3Nka204Ympz?=
 =?utf-8?B?THNZemtOWWZ3VkpmUnZldk9RTjAxa2VXa1hsYXMzaG1zRm1NVGNXWUlrdUZG?=
 =?utf-8?B?RnpRVGpuSk5IbmM1MGhwR1dFVlJiM2hCQmN3MlRYMmNZTWkwWlVlRWpEZVc1?=
 =?utf-8?B?UGRHdFkwRkhKK01Hb1QydWd0UXRFTHgycmw2NXAzaE9rWnQvKysyNFlYZ1Fa?=
 =?utf-8?B?d2lIWDl2UXUzc3FwOWc0RTdQWVJLS0dvZXdEMUJIU1FYNFNQazRCNlVKdGRK?=
 =?utf-8?B?WTJSYkJnN1h4MHZWYzlxenBaYnB0clEyenFDSUV0d3czM1pmQUQ3bXRydWl2?=
 =?utf-8?B?N2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f0be25-5d04-490a-b3ba-08de20be703c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:05:43.3148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rDmC6agUXa89EWo8mN0DQoXn9IhIFr67HOwt5xE0RNzW4zgCNmEyFakInazulAKCIvSPAIfNEBo5RWlNPiTqeoHwfEVmkyNqc/n6veImJUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6279
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

The descriptor reuses the KLV format used by GuC and contains metadata
that can be used to quickly fail migration when source is incompatible
with destination.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_packet.c       | 92 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_sriov_packet.h       |  2 +
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c |  6 ++
 3 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
index c612f37e9707c..bab9946968964 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet.c
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
@@ -5,6 +5,7 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_guc_klv_helpers.h"
 #include "xe_printk.h"
 #include "xe_sriov_packet.h"
 #include "xe_sriov_packet_types.h"
@@ -350,11 +351,19 @@ ssize_t xe_sriov_packet_write_single(struct xe_device *xe, unsigned int vfid,
 	return copied;
 }
 
-#define MIGRATION_DESCRIPTOR_DWORDS 0
+#define MIGRATION_KLV_DEVICE_DEVID_KEY	0xf001u
+#define MIGRATION_KLV_DEVICE_DEVID_LEN	1u
+#define MIGRATION_KLV_DEVICE_REVID_KEY	0xf002u
+#define MIGRATION_KLV_DEVICE_REVID_LEN	1u
+
+#define MIGRATION_DESCRIPTOR_DWORDS	(GUC_KLV_LEN_MIN + MIGRATION_KLV_DEVICE_DEVID_LEN + \
+					 GUC_KLV_LEN_MIN + MIGRATION_KLV_DEVICE_REVID_LEN)
 static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
 {
 	struct xe_sriov_packet **desc = pf_pick_descriptor(xe, vfid);
 	struct xe_sriov_packet *data;
+	unsigned int len = 0;
+	u32 *klvs;
 	int ret;
 
 	data = xe_sriov_packet_alloc(xe);
@@ -368,11 +377,92 @@ static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
 		return ret;
 	}
 
+	klvs = data->vaddr;
+	klvs[len++] = PREP_GUC_KLV_CONST(MIGRATION_KLV_DEVICE_DEVID_KEY,
+					 MIGRATION_KLV_DEVICE_DEVID_LEN);
+	klvs[len++] = xe->info.devid;
+	klvs[len++] = PREP_GUC_KLV_CONST(MIGRATION_KLV_DEVICE_REVID_KEY,
+					 MIGRATION_KLV_DEVICE_REVID_LEN);
+	klvs[len++] = xe->info.revid;
+
+	xe_assert(xe, len == MIGRATION_DESCRIPTOR_DWORDS);
+
 	*desc = data;
 
 	return 0;
 }
 
+/**
+ * xe_sriov_packet_process_descriptor() - Process migration data descriptor packet.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @data: the &xe_sriov_packet containing the descriptor
+ *
+ * The descriptor uses the same KLV format as GuC, and contains metadata used for
+ * checking migration data compatibility.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int xe_sriov_packet_process_descriptor(struct xe_device *xe, unsigned int vfid,
+				       struct xe_sriov_packet *data)
+{
+	u32 num_dwords = data->hdr.size / sizeof(u32);
+	u32 *klvs = data->vaddr;
+
+	xe_assert(xe, data->hdr.type == XE_SRIOV_PACKET_TYPE_DESCRIPTOR);
+
+	if (data->hdr.size % sizeof(u32)) {
+		xe_sriov_warn(xe, "Aborting migration, descriptor not in KLV format (size=%llu)\n",
+			      data->hdr.size);
+		return -EINVAL;
+	}
+
+	while (num_dwords >= GUC_KLV_LEN_MIN) {
+		u32 key = FIELD_GET(GUC_KLV_0_KEY, klvs[0]);
+		u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
+
+		klvs += GUC_KLV_LEN_MIN;
+		num_dwords -= GUC_KLV_LEN_MIN;
+
+		if (len > num_dwords) {
+			xe_sriov_warn(xe, "Aborting migration, truncated KLV %#x, len %u\n",
+				      key, len);
+			return -EINVAL;
+		}
+
+		switch (key) {
+		case MIGRATION_KLV_DEVICE_DEVID_KEY:
+			if (*klvs != xe->info.devid) {
+				xe_sriov_warn(xe,
+					      "Aborting migration, devid mismatch %#06x!=%#06x\n",
+					      *klvs, xe->info.devid);
+				return -ENODEV;
+			}
+			break;
+		case MIGRATION_KLV_DEVICE_REVID_KEY:
+			if (*klvs != xe->info.revid) {
+				xe_sriov_warn(xe,
+					      "Aborting migration, revid mismatch %#06x!=%#06x\n",
+					      *klvs, xe->info.revid);
+				return -ENODEV;
+			}
+			break;
+		default:
+			xe_sriov_dbg(xe,
+				     "Skipping unknown migration KLV %#x, len=%u\n",
+				     key, len);
+			print_hex_dump_bytes("desc: ", DUMP_PREFIX_OFFSET, klvs,
+					     min(SZ_64, len * sizeof(u32)));
+			break;
+		}
+
+		klvs += len;
+		num_dwords -= len;
+	}
+
+	return 0;
+}
+
 static void pf_pending_init(struct xe_device *xe, unsigned int vfid)
 {
 	struct xe_sriov_packet **data = pf_pick_pending(xe, vfid);
diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.h b/drivers/gpu/drm/xe/xe_sriov_packet.h
index fd8da5069b53f..2731e52cf7efd 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet.h
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.h
@@ -24,5 +24,7 @@ ssize_t xe_sriov_packet_read_single(struct xe_device *xe, unsigned int vfid,
 ssize_t xe_sriov_packet_write_single(struct xe_device *xe, unsigned int vfid,
 				     const char __user *buf, size_t len);
 int xe_sriov_packet_save_init(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_packet_process_descriptor(struct xe_device *xe, unsigned int vfid,
+				       struct xe_sriov_packet *data);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index ad5a45ddb2ae4..dfcc50203062a 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -177,9 +177,15 @@ xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
 static int pf_handle_descriptor(struct xe_device *xe, unsigned int vfid,
 				struct xe_sriov_packet *data)
 {
+	int ret;
+
 	if (data->hdr.tile_id != 0 || data->hdr.gt_id != 0)
 		return -EINVAL;
 
+	ret = xe_sriov_packet_process_descriptor(xe, vfid, data);
+	if (ret)
+		return ret;
+
 	xe_sriov_packet_free(data);
 
 	return 0;
-- 
2.51.2

