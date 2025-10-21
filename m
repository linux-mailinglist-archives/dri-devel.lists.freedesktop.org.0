Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A18BF42C3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 02:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3E810E54A;
	Tue, 21 Oct 2025 00:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZMILhBEU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4CE10E54A;
 Tue, 21 Oct 2025 00:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761007527; x=1792543527;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=njXBulJV4uv6INWrxpLOKGkYtGpKcoyO0mO9jdQuyMc=;
 b=ZMILhBEU05kI7PmdXnhaYpV2Jlv9YN5LuisqnKD6juBWT1Fk2oxqte6y
 haJ2duOdFShNV5nsBW2tEppr4nDwDm38Vzpb6yT7lAwdJ7KIoSdqXIlmB
 BwjhnAPVKiiLgezcHCDQfxZzfEosgbk98YM/GqDjFQVyx0FmpudVz8MA7
 W7Wt0nWrREeXyaGiXgGCJTvwwG0B/yiZeNtok64JCk36LqshF0vH+WtZv
 jGqF7YtdAm6uaZ4XxP5OSTFhPXTooFbsx6UjxWZOpUs9qURJWMOlsenJd
 dVMvr25f+rEE12Ce/UWhcdYdx529kfazkdPaHQdzV+FTSTECnBQ2lf4vp Q==;
X-CSE-ConnectionGUID: othyhJ1yTz2xbDsOmIRzHg==
X-CSE-MsgGUID: saj4ARj+RXKzG+FtYFqfLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66993452"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="66993452"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:45:27 -0700
X-CSE-ConnectionGUID: bUEX+9J/Q++ayh8ab3RHuw==
X-CSE-MsgGUID: o7MN1T6aSveFAvVJFgew5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="220623287"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:45:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:45:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 17:45:26 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:45:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0p0knHVUu4ADQUzxnA5j5GK9L7UlOC8/dIIVqNLmDFLeGNC/S8BgPcwhyO9t4kl1C2/LOXUrLsOYadVxSiBbbJmDWJYrNjnNn5SdMh90Z6tz/+RlP9PCuoI8iBb02fulxTODFAr+SpofuP2XCespTDGp3JQwMriVta7I2qyEQumUcsMH+32Kj942xpJeKCgkV2arCAZoahUuralTy6VQx4vxS3uatG+Hs2p7ViiNPvSARNP2FS+MdTdp4wfpadmGRI04sehGkQ4KwfFkPgGtB0+1OJwW29rISpB3o5QHcNM16bFjY8MuLhKyqOspmZh//ATzzsLcMsMIyXqCyxIaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MoXX+eIupzGAAfX6FfC4Ib4S015OuhrViUEF3W9dEDo=;
 b=tT2CXvagyrsIaWA7bL/aC6iFlRjGycWeiuEUOmzwbSzcyHAZaE3okkrTDY5viG4AzO73DPxbHtN523ZtKyOTXOvDYfOe+7MAINtMiATcUlRs+VB8l0LnLScD5NQ69t/EC7EpGCuhQ5lvSfE7bNaK9GGpbQpRmMXidWA+sb1yNtr9NY9FFiKMKNFFKgC8rHflJJO9KCXrMKMiBFwfE/CJqyOhlTnTq1Z/gQNz/rj1fqJigYsk2IMN+8qnzXvBI4BthRhbtwI1yi60kFzNPCTjNCjDY3ttFu/cuXnFxTuV6VvzBWRRDCTNKwZ67WA7wbdvqmAjC8nLpxW2moHNdmtshQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB8062.namprd11.prod.outlook.com (2603:10b6:510:251::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.16; Tue, 21 Oct 2025 00:45:24 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 00:45:23 +0000
Date: Tue, 21 Oct 2025 02:45:19 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 10/26] drm/xe: Add sa/guc_buf_cache sync interface
Message-ID: <vlyglvvlvxldtm5kozujqchtbzgzotfyho335ezgdxu7o4skco@5yvzdertnwum>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-11-michal.winiarski@intel.com>
 <aOvuJI/BNJZKPRgL@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOvuJI/BNJZKPRgL@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: WA2P291CA0036.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::9) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: b858db61-863f-4d91-c32d-08de103b1eac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzhZcUUrKzFDTDJkREY5OWlXcXYwYUFDdjRoRld3Z1J0Sk5KbllHOStOMDNz?=
 =?utf-8?B?UDltS05UV01DUUV1bkIxWllJQklaa1F3bWZzeHA5ZThsSnpXL0o1bTJoTllr?=
 =?utf-8?B?ajZyc09UOHFweEQrUUhXZWJWeURNYXZkMEVKeG0vay9YZ3Fqbi9ZcmM1cWNj?=
 =?utf-8?B?cmZRMnFheHZjZkl1aUpvdmJxK2ZrUWs0ZCtWK0NmcVpLUS9FRCt3K2NMZFZO?=
 =?utf-8?B?OEtJTjdxN2ltb0dtQW1HeDN3SndrQkE1cEx0eUswb3Z6L1E2Y0htTndXTmRs?=
 =?utf-8?B?TnpBOFhRMHlxQ3lLamFXN1B5U3JRcnBNS0phVW56STd6S2doSGFvSzUyU0Zy?=
 =?utf-8?B?ZHhNK2t2cVU3bWhESDJLeFhrQW4xeGFCbWlLWmplbzRHZWh0UVJLeDdHY21J?=
 =?utf-8?B?SHpmMms1NXhXZjNxQVhuSEk0dE1VajRiSWlVWjFoTUJRQ1pTSG4rQ0hGV1gy?=
 =?utf-8?B?enVkV0hQdVRxQkw3aUNGb2RYTUYrdjU3cmRVRHMzcGdBaU9IVTZyVHlFblZk?=
 =?utf-8?B?Q1hHZHZaeUxXaXBwdlUyK084UzdiTlhhRTJySGJjVzlLZUpuV3hXZlREWUhw?=
 =?utf-8?B?ZmQ2Q0tKdGFhdmM4OC9JTU84eWtUdW5KcFExZGZvc24yYysreXlNbWFxelk4?=
 =?utf-8?B?Ym1Zb3B4OWtVNmdrZG5rTHlpb2pGZFUvVXAySXpiOW9uMkhhdGdadjJnbExy?=
 =?utf-8?B?VUhJU3dEZVJBSDBucHJnaDlnVzFpc0tzOE84N3ZNNXNlV2EvdE5OY3dXZzlV?=
 =?utf-8?B?azE0MlE4OUc4SEpCOC82VEFIR3JrMVMreFJWYzBWSFlyQmhMeHR2SmZWeVEv?=
 =?utf-8?B?aURJZWtsUXphbUxLR0Z5MWFHMTgvMlVCZjNPZ3IySHVEdFJ5OWNKU0FTWDBu?=
 =?utf-8?B?U3RXZEJ4bkcxL0ViaWZwUXAwVFo3Mkh4cDE1NUZWTEZJUmEzL21vTHZQMHNz?=
 =?utf-8?B?Rlp2TmhnY3YrelpCd2FSODBwb3l5M3djZU9CQnVwSkEzTTFnSXhWTXlDSDNB?=
 =?utf-8?B?WWlQNjBvcDNrMzRYbHA4RDFCSGhqM1lnZWhRWFkyUG44OHNjd1BoeTZYc0hF?=
 =?utf-8?B?T2pmVWV4bVFoNVZtQ0NkMWRvS0lUWEQ3VmJScHdsYURqZHZxeUlEdXNIQkxl?=
 =?utf-8?B?Wmw2eTNEdFdhMjBOYkNQdERhYjh2SkxYUitPY1dNZnRmZzI3ZlFpM3VVb1kr?=
 =?utf-8?B?cnF2dVJWWGp1KzQ1QXJ4N1Y3aENCam1vbi8ya0V0QnMyMFMzRHdkd0JrVGMw?=
 =?utf-8?B?ZWt5aFNBQ0ppTjNzV1A3TUxKVy9qRkYwOWNlaDdjWUpidVAyeFRNcmwrdmNE?=
 =?utf-8?B?eUltYXZURlplYVdWZlhaVXlWdWQvM1h0YmU3Yk9FV2ZoU0NzUkx3anBJdStv?=
 =?utf-8?B?Rkg5RytvekQ3dXQzRkpxRWNGOHQzQU8xMFNhRWQrVmhzSTREcFhxRks3cHVt?=
 =?utf-8?B?a3JsMEt0YmI4NmwzTlNNS08vZDdVTXQ1c1dJdVVPODR5WG9rQnJSdjdrZnNK?=
 =?utf-8?B?VUdmeTAxbWprSUZnUU8rdW9idXZoaWZDSk5LYmpmSVM0UzlDRXBESkNqUWNu?=
 =?utf-8?B?c1R4SEU5ODRoYm5IMXZWUWtSbFRYTEVlTktyVnBnbURsbHJwUDhTN3B1V0dl?=
 =?utf-8?B?S01pdXFtcU1HTHp5d2hJSjhFUXpKL0dGbExvZ3BnNDNUYjBCSXRGQnNjYVZD?=
 =?utf-8?B?R1haY0l5NUUvdzVSTTZVM0poTnduYlZTNjBLRHJkSnBsL1ZXYnFtbHhjRE9w?=
 =?utf-8?B?ZjRBYkp5VUNyVE9BaGladSsza3c5b0FEeHdMMUVIV1R0d3lhbHFxcGRMSkh3?=
 =?utf-8?B?cVF4bUUwVEZiK3lpenExNi9NWlUxUE93eTVpTVBITXROSXNGVUVySVhXR0VK?=
 =?utf-8?B?bEdnWElYb0JFaGZ0UU5iQmpqTC9HQVgyeGFycnRneUI4elc4VTMxMTd2eEVw?=
 =?utf-8?Q?7YcrQeGAm0WRnbiiawnL3SQ+KlcxHD0T?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3N1WVU1eXNSKy9NVUc5MlBmMGtCeThvMUczU0lHbUVNNEtnZm9UUFRiKzRK?=
 =?utf-8?B?NHVwcjRQUW94dUFQSXhKa3Q2LzA3UC9xbXdLL09DYlNIdk1KRVFWa0VwV09J?=
 =?utf-8?B?N0MyOHlWOFB3SFNPajNHWGsyT2FKNDljNnE3OUJTbWxTanY3c3VENGg0QUkz?=
 =?utf-8?B?VWpaZU0zM3VSZ2JqM2U0S1FoQ0FuT0MrQmd1V2ZWdjl5aHFLT3RvOUVJRHBU?=
 =?utf-8?B?NFpUaHhzNXduVUpsaDZuMTBpcU5NcVl6ZVVDODFpVWVyb3o2SzUvTTBpcHl0?=
 =?utf-8?B?RGg1akJoYnRsZitoeXgxUERqU2Y4ZmxJN0NOMmtuYlZWRVFObkNkK3NNU0xq?=
 =?utf-8?B?OEExVjVyREVaL1UwT2hXU0FPTko5aVpvYk5mK0c1VkJvWVdhUkRWNVlDZDVq?=
 =?utf-8?B?Zi9aRzMvUWpCQTFLRkdjbjhsM0s1RXd2ZTAveTB3SmV2VDlES0I5ajZDR0xm?=
 =?utf-8?B?eDFTVW1KcnI4aUtYN0FFaWNURGJLSDFTbWZIZlZqNDVOQTdkYnJhMDJmVHVi?=
 =?utf-8?B?S3l6Sm1VQ21pK3BkQVVOVkJmeVNQeXhlZFRDR3hjOHpwak1WbFlDNUc2Mjlk?=
 =?utf-8?B?dFlXVVpmS0dsWityRElCZzlOcHhrT09CYjV4VU1XUTlQZ29qb3Z0SXhjeERF?=
 =?utf-8?B?UnRJZUQ0V0c3SFFtdC9GbS9xVXp0dlkwcEdyZkFsSCtYMDMxSlNqRUJSek5Q?=
 =?utf-8?B?d3ZiaFlaaFZRaDl1REp0emtCOXd1MXNJaEtSdkZ4T09IbHBXQmQ2NW5EMTBS?=
 =?utf-8?B?WGZEYndTaW44MGNLcHBvQ09OTVlDR1FWUXNadlVnMzJ5eFJHQUF1ZjhET0Zv?=
 =?utf-8?B?MWpSczFMcXRCZ3ZkcDVGbnplcjRSejlsS2tQK3RlTllFcUY1cTNPTllWOURQ?=
 =?utf-8?B?ays1aktUTklBM250VkRhWENRT2k0QWZqWmxOVHNtd1gvaUxwNFgweHZjVGo5?=
 =?utf-8?B?TUZEamt5Vy9WZ1ByZFYzcEVMdzd2dlY0Mk9CY3ZPQWpZQnZxTUc1Y0dSbEx5?=
 =?utf-8?B?UVhKVkpDWEw2UXhCNnVDemZqM3ROOTF0cEtDY0owSGI0eW1Lazl1a0lFV09u?=
 =?utf-8?B?S21GU0JHYjN2NmlNejUyaGhyY1FCR2wwS1NQcmcyZDRqYjBaQ2NjakgzS0pq?=
 =?utf-8?B?RTgyaEdROTZiOUo1YmlrNCtBSEdVd2dwS0lMQXVnRjVqaG1UcEZPTXplRUgr?=
 =?utf-8?B?bnduZGFaU05IZWxzbUIwRW8zaUlEb2Rzb1VUREF6cGQyMzRpbUE1bmpMRkx1?=
 =?utf-8?B?QmVMYVlSRlVTZUxST0NHRUk5OHlQQ084Z0puK0dya1VVQjE3b3RlcTVuTGxp?=
 =?utf-8?B?TGxQR2pKdzl0elBOaVFDbDVJN3JLWVZlT0hScDJvOU52RWJYLzEyY0J2ZHp1?=
 =?utf-8?B?eHprL3NEbmdPbHVPUWdtTCtYSnJ5d2kxdXpyKzRnVEZKT2lZUHlIdHBsSEk1?=
 =?utf-8?B?R3BJc3dTM3VteUlEVEY2cklvTER5ZmtZbGJzSDNVbURyOFIyTVdtbFRwTm1r?=
 =?utf-8?B?eDIzTHJxeGN3UEhmMVBRck1za3NZTUVaMU83MmRaUDZpei91am1QcXFQVnNP?=
 =?utf-8?B?QXQ2N2J2ZU9WQVBNM0dlRUtpT09reXpLbnBITk1TbjlXMDVwYTRhdy9nRWdz?=
 =?utf-8?B?d1pzN2xReHBINE41Vklzcjl1bmo4TkdZcElyVndYYk1jNXdxMnJ3SHpXK1lz?=
 =?utf-8?B?V3VlWG55bzhqcytsSjR0QWZTKzV5dWpvcGQ2YlpiSEpWMmlGUldLL3A3UmFq?=
 =?utf-8?B?SXhGdUFQZUpNKzN4WkIxSkdWWW03OEVxcVUxY1h4RzBDcmRUemVBUnl5ZWpt?=
 =?utf-8?B?MWtRZ3hOc2NpcGFNeThPbGxUaTh2a2xWdDROUXJWVEJXbXJNQ2VwTGJDMjgw?=
 =?utf-8?B?eDhZdVF3bHRraVZiYk9BMXdyUEVCRUtIZDNiZzZkOTFRbVBkNmdKSmUwczJ1?=
 =?utf-8?B?TnpZT1A5RXUvQmhEL1FGSnl2Tk5CSnVkU0pzdHcwNGJCS1hDaGxzK1YxVW5V?=
 =?utf-8?B?TlNYNlpBYThNZXp2cVlLRmdtby8zbHA5RzFoNmVJRlR0cmIzN0Z1SXM2QWtk?=
 =?utf-8?B?dkgyS2JKeHVob01yalRGNjdOd2l1b2N1Z1RncTZyaFZ2WnVmV3kxY2JvQlEy?=
 =?utf-8?B?azVTL1NFcVg3YVNCWnFub2FTcHZSMWxtVDA2aHBKdGhuNFhYUTZKOVFVb3gy?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b858db61-863f-4d91-c32d-08de103b1eac
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 00:45:23.8788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJ3M1CQnycZvSloeFnTaQo+FsCAzo9gZr+rpZ/2SxF5nAqYaCL9LHL2LOWUOj+CVKkLU07Bi+AQhanL6hLgSMUl1V2Worhy8XZOkcSlP1WY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8062
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

On Sun, Oct 12, 2025 at 11:06:28AM -0700, Matthew Brost wrote:
> On Sat, Oct 11, 2025 at 09:38:31PM +0200, Michał Winiarski wrote:
> > In upcoming changes the cached buffers are going to be used to read data
> > produced by the GuC. Add a counterpart to flush, which synchronizes the
> > CPU-side of suballocation with the GPU data and propagate the interface
> > to GuC Buffer Cache.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_buf.c |  9 +++++++++
> >  drivers/gpu/drm/xe/xe_guc_buf.h |  1 +
> >  drivers/gpu/drm/xe/xe_sa.c      | 21 +++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_sa.h      |  1 +
> >  4 files changed, 32 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> > index 502ca3a4ee606..1be26145f0b98 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_buf.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> > @@ -127,6 +127,15 @@ u64 xe_guc_buf_flush(const struct xe_guc_buf buf)
> >  	return xe_sa_bo_gpu_addr(buf.sa);
> >  }
> >  
> > +/**
> > + * xe_guc_buf_sync() - Copy the data from the GPU memory to the sub-allocation.
> > + * @buf: the &xe_guc_buf to sync
> > + */
> > +void xe_guc_buf_sync(const struct xe_guc_buf buf)
> 
> s/sync/sync_read ?
> 
> or
> 
> s/sync/flush_read ?
> 
> Patch itself LGTM.
> 
> Matt

I'll rename it to sync_read.

Thanks,
-Michał

> 
> > +{
> > +	xe_sa_bo_sync(buf.sa);
> > +}
> > +
> >  /**
> >   * xe_guc_buf_cpu_ptr() - Obtain a CPU pointer to the sub-allocation.
> >   * @buf: the &xe_guc_buf to query
> > diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
> > index 0d67604d96bdd..fe6b5ffe0d6eb 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_buf.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_buf.h
> > @@ -31,6 +31,7 @@ static inline bool xe_guc_buf_is_valid(const struct xe_guc_buf buf)
> >  
> >  void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf);
> >  u64 xe_guc_buf_flush(const struct xe_guc_buf buf);
> > +void xe_guc_buf_sync(const struct xe_guc_buf buf);
> >  u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf);
> >  u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> > index fedd017d6dd36..2115789c2bfb7 100644
> > --- a/drivers/gpu/drm/xe/xe_sa.c
> > +++ b/drivers/gpu/drm/xe/xe_sa.c
> > @@ -110,6 +110,10 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
> >  	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
> >  }
> >  
> > +/**
> > + * xe_sa_bo_flush_write() - Copy the data from the sub-allocation to the GPU memory.
> > + * @sa_bo: the &drm_suballoc to flush
> > + */
> >  void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
> >  {
> >  	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
> > @@ -123,6 +127,23 @@ void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
> >  			 drm_suballoc_size(sa_bo));
> >  }
> >  
> > +/**
> > + * xe_sa_bo_sync() - Copy the data from GPU memory to the sub-allocation.
> > + * @sa_bo: the &drm_suballoc to sync
> > + */
> > +void xe_sa_bo_sync(struct drm_suballoc *sa_bo)
> > +{
> > +	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
> > +	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
> > +
> > +	if (!sa_manager->bo->vmap.is_iomem)
> > +		return;
> > +
> > +	xe_map_memcpy_from(xe, xe_sa_bo_cpu_addr(sa_bo), &sa_manager->bo->vmap,
> > +			   drm_suballoc_soffset(sa_bo),
> > +			   drm_suballoc_size(sa_bo));
> > +}
> > +
> >  void xe_sa_bo_free(struct drm_suballoc *sa_bo,
> >  		   struct dma_fence *fence)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> > index 99dbf0eea5402..28fd8bb6450c2 100644
> > --- a/drivers/gpu/drm/xe/xe_sa.h
> > +++ b/drivers/gpu/drm/xe/xe_sa.h
> > @@ -37,6 +37,7 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
> >  }
> >  
> >  void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
> > +void xe_sa_bo_sync(struct drm_suballoc *sa_bo);
> >  void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
> >  
> >  static inline struct xe_sa_manager *
> > -- 
> > 2.50.1
> > 
