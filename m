Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB03FC4A304
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E3010E4C6;
	Tue, 11 Nov 2025 01:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KSQK8vmW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E6910E464;
 Tue, 11 Nov 2025 01:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823165; x=1794359165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=f1DZErlhti0VsaHIsP1YTp6m6db7A1oLttqgvH6reGw=;
 b=KSQK8vmW3J6LexqM/7dVyQxwNMkJQCyoodm5UdjI0a/IfrLnosfvr9XM
 5qDtMwzpu9030HFyZVa5oZpfzshA9nizIRN/E9JFo4Uv//y9YikvieUdE
 bv1GuWlhqVssFoAoFeVHIkLVrc4I4jW0B9yhssFUF2I4CnWgilW5oZCbH
 jc7sa3kP4hHqLTKXG6pbnBIr/DUFLNsrnPw6QzkUmq2NH4j2FnMlJadqF
 LHVVwIh8BNKiht7bJZnfMWeau9Qfm96kU+vWZStVKcCcvhL8+4UzCy1wz
 oSeNINYxRIEoNPznLsGbzG58FIFeSvltVc4zEeYkYY2nHYhZI3jJuGIhM w==;
X-CSE-ConnectionGUID: pWNUvrdISg+w7YQp0eOW7w==
X-CSE-MsgGUID: 2KPJiqz7Rg+DyJ7ji5+geQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82277600"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="82277600"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:05 -0800
X-CSE-ConnectionGUID: lMr2y+WwSd+sa65cNJyA2g==
X-CSE-MsgGUID: 8rW+RkRNT1yD1E1ZMhg44w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188460325"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:04 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:03 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:06:03 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.37)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXudgib5ZsbqJxtN+hgAMP0vWNUOCtLlXZ2wMXjOknpm84ufKsQD3LyjQiNFOe7ZKnPFkobAzMqWR6gLkK0BU96RTHnQomPAcOEBXOPhJcnVC/dR2fjQDsFUXNhJMvkLW8iHXrIKvEbCO4Umao0zbUZ4H/U8GEzN3eb16Fh3BsTK1LZMJGABmCSd3Pu8jaU78ftrH+8ThClCLPLdubc8WANnYNIvShxejrhOCznc2I/azvAdLLdvnE/jEIaIROWJjzmMVkiFpcWD1DTbqvC8S39LkBmCV9lWkAhEB5esaVuKcD7UBAMwx/YRgrLYx/qWwUys7B+vccLMy2nP9BDeBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5smbwVEVcZ5Z1I2eLFWpN0NfAqPp6Yorxt7TQ9FpIcM=;
 b=I+YYM7Bw7ERptpl/w47XF333ij9zPN72PWbr8CN6tUap+0POJ3ZasXxQ12O91p3BGMhFqT3utvTcA6EFVVfkiTK/LuQ5Yb2qN3v0U3egBnGMiQvlKBurANAbp00Im/zW43yn6gi/vKQq3/X83NRlYCSwbnS4tGh+HhBF/MPH1nr8pTMlXQt7FPDi1RlP/qx1RY1w36CjIQREKBWlnydxCIOaHzZVLKE/JvJOMP8g92RvmD/TjpW891iva0dWdcPVU7KV/b8loV9WJM1OHCWMQDFNkQLOa5jxL/uFxbj3hN7oj9tzT6AirI8vFfjLZkeNexZH7jXviDil6IrtSRj16w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:05:58 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:05:58 +0000
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
Subject: [PATCH v5 12/28] drm/xe/pf: Increase PF GuC Buffer Cache size and use
 it for VF migration
Date: Tue, 11 Nov 2025 02:04:23 +0100
Message-ID: <20251111010439.347045-13-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::26) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c8fea2c-888b-4154-50d2-08de20be7923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUxZeGszZ0dOeW0xczZPam5EYnE3ZlJGU1hCOHFrNDh3dnVUZFBRQlg3a0ov?=
 =?utf-8?B?SjVmRE51VC9NUFY4V2dFankxbWhLa1Q4OXFUTUo5VUttRnF5NFc0VXExZTl2?=
 =?utf-8?B?a0tsSjlxMmR5dFhNNEloWEtxN3UwZUNsRmJocmdtZEUyUWhpUjlFSk1kbk9L?=
 =?utf-8?B?cXFoS3hCTlJoK3gveFN0UEI0NmU0OGo3ejl5QVNRek5GOFJyL0ZlV2V3WjNR?=
 =?utf-8?B?TGlWbHRQckpxcm1henJsY3NER3ZKSmo3dHZab2FZM3N5aU11OU9WNDB4dmVx?=
 =?utf-8?B?MTB1Z2ZqM3hCd3BQa2ZLaGVGNUFrS3V5WGphMFZvOWFsQlRqcWZscTZtTHlP?=
 =?utf-8?B?aEZ0YVZWQVF2ZklWcXphUVlpSFhuajhGSjZwSHJVYldkbm1pb1dUUDRQRkVp?=
 =?utf-8?B?UkJ2UnAyYzdmV3U2eGpGSk0yRFcrOUdYbHpDbFoyMWZSRytUak1jZHYrcjNM?=
 =?utf-8?B?NXUzZTQvMko5YXBteFBLSlJPZU15NTFKbHUzRUUxTmJWRnNtTjZVVnVpU3NL?=
 =?utf-8?B?WEJYZTJyTGdaVnZuVldueXFSbXV4T0UrdnBhM2pvcjlXTkd3VGlnR0lzUWFU?=
 =?utf-8?B?VURPNzRjeW1wUFJuVlVIK2JXblp0OFpSWUpJS0Y1QjZzdWxYL21kcU5hSXY5?=
 =?utf-8?B?cWJwVGpaZTdEZUhJcHRQZnFuTXh6K1FDb1cvT2pWTWZoWkRrb3kvL1luMFVL?=
 =?utf-8?B?THRZc1RlUFRuL0RCaUdFUG1DL0tieUwyV3BGeWEzTjNBb2JRUGJ1L1pGTGJH?=
 =?utf-8?B?YzNzOEhZYkk3c3RkeEZHODljQTUrWG84QjlNOFRjR1Y2cFVYWEhrNWg2VVpC?=
 =?utf-8?B?RXJyWXBPTXVvL29Kd2dHZFpXaWYwVlk3bUJ0UzZXRzJHWnBRSldBbFIwWUMr?=
 =?utf-8?B?ZEFpTWhzcnZYejVOeUUxeURyVUZBbnY1WmNKbjJRbWkxMjIxUjZhcHVkVjRq?=
 =?utf-8?B?NHFHRW1aMFViWmhTb2JDbkJiNDR6NkJQdGFWWXc1VjhVY2dBQVRMa2JoWlRy?=
 =?utf-8?B?RVZZVTRBb1VmUzgrZ0lmcW1KNUdsbEt2TjZMeFVZR2F1a1RESlFuN3FvSmFH?=
 =?utf-8?B?UG9neXNhMU1XZndJTEdlTnFpNHdvZEx4ei9LS0doV05BNnZYc2NvUkpBSVJi?=
 =?utf-8?B?WkJDQXNKdzJHWmN5NXkwT0l2bXZOcWYxM21JLzJtNU0xTW01S0lmZHFFOEZn?=
 =?utf-8?B?dkZWTnhXaFlwYTBHTkx2OGkybWh2b1ROUjZ1emd1ODVaa0JUTGltSkdzS1ps?=
 =?utf-8?B?QkV3NzFnSU9NNVRMb0RKdXJVcG9SeGpSaXdzRFEvdDNJUjQxc0NTTUk0RXRn?=
 =?utf-8?B?Vy9hMU9PRVZqU3JzKy9POTJkdDdlbncxNDY0bXUyRkZpamFOSGIybHFYNWN6?=
 =?utf-8?B?Y1VpT2tOR2xHMEo1a0VMMTVWNkFoQmZzK2lsWm5BRCtUcjZqQkZWRU9NM0ly?=
 =?utf-8?B?TzZES2xPTVRHbzZUVS9QSHpPbDZUV1NJNm9pYVJFaFhORkYzaC9taXZXUUJN?=
 =?utf-8?B?cHNHOUw5UHUwK2JyQ1pISjhsSndScDQvWEVHTm1xZ2FCSlVQb3A2YzlrYjRw?=
 =?utf-8?B?YzNKVnIwZ3MzN2ttcUlpamNxbHUxTzBmSGhuL3Y2N0pDd29IV2tmenp1T05Z?=
 =?utf-8?B?NHJGeUovcXB1UVN4MExZTG4rbTdMLzFyaExHNzg1UVVvYXhTRWdmTXM4YXgr?=
 =?utf-8?B?Wk5HRUl1NkkzT0lNdVlZRUx5U0tMME1lam1ITHRNS1h0OXBrdTNoNmlZM0lN?=
 =?utf-8?B?YTVwaTBweUxOUHpPTGtaU1lSYnI3Vy9pcGVTdVdxMXlUVm93SWVjWnczdkVt?=
 =?utf-8?B?d0FRRXMzVVF5blFaUzlKcGdocUJtOVpqTkVjSFd5b0E0bitRemhkbWREL0Fm?=
 =?utf-8?B?SkUzeHhXZnh0dVpkNk9jQ1oyN1E1RUIxd0QydE5tU1JySHJtbExiV0I5aEtj?=
 =?utf-8?B?c2pxOXR0UkxhK3FudU1MaUEyWUFpb2dOQmNER0NsSUxvb1poYmc3eVRpY1JB?=
 =?utf-8?Q?tIy0DPWudeprm5rxUE6F+yveBCUCms=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTRUSU9IWVl0M1VOakVtdW53UGZ3TGJkWHIzdnkvc2JibDBZQ3FGOTUxTjVV?=
 =?utf-8?B?Z0VtQjcxYWpVVlY1eXU0VEFOSDI4RHFRSUJJS3ltVUtNUTZmeE5VcnBmaWZs?=
 =?utf-8?B?WUo1eW40anR6dUE0cmVPdTUzaDZFNGJLSm9uZUFxaGZlZURZeVNsdzJYMGlH?=
 =?utf-8?B?dXdSVkhIc0toK0YwWUU4T3JwdkZxM3dUV3lIT1pTZXhGTSsxbjJpRis2U3lG?=
 =?utf-8?B?U09ZclFGR1phc3EvcEtTV0VSaktQWk9NM3AvVVNKa3Rjem5OdHhhbWJTY1Vk?=
 =?utf-8?B?T1ZqTWoxNC9FYnZOZi9GQzRVSDdMZW0rUkVyaXlOZ2hqNEJNd2NRQnZhTzNU?=
 =?utf-8?B?SEFieWVra1B1aXQrcWI5bm05U0NpaDB5M252bnN3NW9Sa21RMFRSR2NLOENK?=
 =?utf-8?B?UnZTSTE5T1pzeHBTMlRhbzVuRC9xMHdUbkF3dHNBWmVaZVp6OGNScGJ1Z3VL?=
 =?utf-8?B?NjQrTWxITU1HQjBrU3VlNkh6OE12ZGc2VitxNm1OdGNWV0c5YmYvUFY0TEFZ?=
 =?utf-8?B?dUhKTmJlMlphT3VpVVVvckQzdGZZNDZNUllxVUVGNWFCaWdUejNuSUQyaktG?=
 =?utf-8?B?THlmKzA5RG9ldS8xUGJGUmdhbU8xaUxJYUNxcHlCbklsTmRQNDBobkt4a3pk?=
 =?utf-8?B?MTI5TnpwZVkwaVBJL2c1dmNucVJKZ2tEaGh5NW1nWU5DTEdnU1A3Nkc3MTVD?=
 =?utf-8?B?L21hSjNac1R6YTVrSEFxZzNOd0drSDZLOFRMTWZVVlhPM014OWJyYlhGOHdV?=
 =?utf-8?B?Uk84VjZWVnZRSWhxQmgreDF1dnczL25TVnpqVU80bWpxQ3VkNjA3M3A2Q1dt?=
 =?utf-8?B?Q3N3K1V5YVJFYkZMcTJmTlFIWDA2dlpmaHBadkZyVTRMbENpamFXeEJKeHVl?=
 =?utf-8?B?R1d6YTFrcU1TY0dsOGY4eXNTZ2sweDNCOUdTK0RRT3NNeEIxUmxqa1F4SGtV?=
 =?utf-8?B?MWQ5Nk5hYjM5bTZBV0xsQ2pIVExBSm4vSkVWVDJYck1MZ2pGRDdTRkxJS3lz?=
 =?utf-8?B?bElCZlR0YU5ZUXN2LzVRZkJwN1hhTGdHbm1QTi9obWV3b1BlTG9Gc0FDNjYw?=
 =?utf-8?B?RVhYSkozZ3Vhem4zWFFBL09ITkFXMFlDNDhhbXg1TS93VnlUZmtNdkMzZTVq?=
 =?utf-8?B?cENSUGF5MmJsNUZNbU11d3BYTTVNZGpwMUt5bU5DYVVtZHRlSjBYdkFMd1lq?=
 =?utf-8?B?dHdGdFZ5bWxJRVNzeXdNa1RtWjlvMHZsQ1U3N3dXRitXWXNSWnZPQTNVbDBL?=
 =?utf-8?B?cUhINmZwa2dRZ01haHduWERXQ2MxWVIybkhRdGliK0tkeEFxRnJDcW53SHVt?=
 =?utf-8?B?ZzB3QkwwTHh1RXluYWk4aXM0YS95ekQvRXFvNjF4Q1IybmtEcHpVc1N2RnRy?=
 =?utf-8?B?VjFwNklvc3pTbUlpWXpPWUZta2I4cmZPNEZDZUQxTnRiRXVrcHY4a3BsYnVV?=
 =?utf-8?B?d2F0SWZqTytrR0lsSjZtSjA0amY3a0F0SVZsY2dydzkzdldBdGF6aHBOUTdC?=
 =?utf-8?B?ZENhV2x1bWR0ZGs3WDlEWU1PZlFFTG9hNENIWGY3RS84WjNRVzBKdXQrcFhF?=
 =?utf-8?B?SGp6SWFVUm9XU3dySk5TbS9wZ1FENlp5b21KOGl1QkxmaEN0VVNzN21XMEtz?=
 =?utf-8?B?R2lUMVMyaFg3Tmp6R1Jpb0FtYnNpa0U0ak1uUWNMSkNtZGtENlM4OEpFaVE3?=
 =?utf-8?B?L2VJb3QrQlYwRWZxMDJEZHNoNkEyc2dpWTljL2VEVVZvRTBMeXpRbWNibDlx?=
 =?utf-8?B?SHpYWXg1TU5Fc3Bvck1SYzI4TllsSTBTbGkrVnpzQm1TeW56ZUpZM0FObmJG?=
 =?utf-8?B?SHozUW5xYXdrSDB2R0FVT0pjNFpHOFgyUUFRTGdzSmJ5MEI0bUNwTm9CbTVE?=
 =?utf-8?B?dXhLL0RsVlFnck1aWHc0K3ZkdHBQbGpKbmlSNk9sazVYdUkyc1lLMzJCSk9y?=
 =?utf-8?B?OUVpeGtRaVRDa3JURFNMcUluRjBOOERTNC9pVWkzdWZlRExjWVpIOFluL1pj?=
 =?utf-8?B?MVdyUUZ3Smh2em5sTlV1V2ZmM0dvWU5oeEhMYmRBUDBFRXZVUnFwekhGNUZl?=
 =?utf-8?B?M3pJVm13Y2FWVTY2aGEyWUxiV3FTZktDLzdyM0NOOHQ4RWJOZU85SUZUVmEw?=
 =?utf-8?B?blpSY0gzeEVWMmxhY1VkRHY5bXU4YWYvRzcyS0htcG5sUVAwOWFyVE1BczRy?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8fea2c-888b-4154-50d2-08de20be7923
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:05:58.2469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jp1RPjfO3ZhE3oRe6sM2IMRJOYDgVAAVSif5bqB+cFJlQpdJg5F3f00pk8BPPCc2tO6upsy85DsQ+Q8KqPGtEmo91ULvLBFjpmGaIFvn7LA=
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

Contiguous PF GGTT VMAs can be scarce after creating VFs.
Increase the GuC buffer cache size to 8M for PF so that we can fit GuC
migration data (which currently maxes out at just over 4M) and use the
cache instead of allocating fresh BOs.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 47 ++++++-------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  3 ++
 drivers/gpu/drm/xe/xe_guc.c                   | 13 ++++-
 3 files changed, 30 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 0ffe64ee469fe..7b5338be15065 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -11,7 +11,7 @@
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
 #include "xe_gt_sriov_printk.h"
-#include "xe_guc.h"
+#include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
 #include "xe_sriov_packet.h"
@@ -58,73 +58,56 @@ static int pf_send_guc_query_vf_state_size(struct xe_gt *gt, unsigned int vfid)
 
 /* Return: number of state dwords saved or a negative error code on failure */
 static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
-				     void *buff, size_t size)
+				     void *dst, size_t size)
 {
 	const int ndwords = size / sizeof(u32);
-	struct xe_tile *tile = gt_to_tile(gt);
-	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_guc *guc = &gt->uc.guc;
-	struct xe_bo *bo;
+	CLASS(xe_guc_buf, buf)(&guc->buf, ndwords);
 	int ret;
 
 	xe_gt_assert(gt, size % sizeof(u32) == 0);
 	xe_gt_assert(gt, size == ndwords * sizeof(u32));
 
-	bo = xe_bo_create_pin_map_novm(xe, tile,
-				       ALIGN(size, PAGE_SIZE),
-				       ttm_bo_type_kernel,
-				       XE_BO_FLAG_SYSTEM |
-				       XE_BO_FLAG_GGTT |
-				       XE_BO_FLAG_GGTT_INVALIDATE, false);
-	if (IS_ERR(bo))
-		return PTR_ERR(bo);
+	if (!xe_guc_buf_is_valid(buf))
+		return -ENOBUFS;
+
+	/* FW expects this buffer to be zero-initialized */
+	memset(xe_guc_buf_cpu_ptr(buf), 0, size);
 
 	ret = guc_action_vf_save_restore(guc, vfid, GUC_PF_OPCODE_VF_SAVE,
-					 xe_bo_ggtt_addr(bo), ndwords);
+					 xe_guc_buf_flush(buf), ndwords);
 	if (!ret)
 		ret = -ENODATA;
 	else if (ret > ndwords)
 		ret = -EPROTO;
 	else if (ret > 0)
-		xe_map_memcpy_from(xe, buff, &bo->vmap, 0, ret * sizeof(u32));
+		memcpy(dst, xe_guc_buf_sync_read(buf), ret * sizeof(u32));
 
-	xe_bo_unpin_map_no_vm(bo);
 	return ret;
 }
 
 /* Return: number of state dwords restored or a negative error code on failure */
 static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
-					const void *buff, size_t size)
+					const void *src, size_t size)
 {
 	const int ndwords = size / sizeof(u32);
-	struct xe_tile *tile = gt_to_tile(gt);
-	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_guc *guc = &gt->uc.guc;
-	struct xe_bo *bo;
+	CLASS(xe_guc_buf_from_data, buf)(&guc->buf, src, size);
 	int ret;
 
 	xe_gt_assert(gt, size % sizeof(u32) == 0);
 	xe_gt_assert(gt, size == ndwords * sizeof(u32));
 
-	bo = xe_bo_create_pin_map_novm(xe, tile,
-				       ALIGN(size, PAGE_SIZE),
-				       ttm_bo_type_kernel,
-				       XE_BO_FLAG_SYSTEM |
-				       XE_BO_FLAG_GGTT |
-				       XE_BO_FLAG_GGTT_INVALIDATE, false);
-	if (IS_ERR(bo))
-		return PTR_ERR(bo);
-
-	xe_map_memcpy_to(xe, &bo->vmap, 0, buff, size);
+	if (!xe_guc_buf_is_valid(buf))
+		return -ENOBUFS;
 
 	ret = guc_action_vf_save_restore(guc, vfid, GUC_PF_OPCODE_VF_RESTORE,
-					 xe_bo_ggtt_addr(bo), ndwords);
+					 xe_guc_buf_flush(buf), ndwords);
 	if (!ret)
 		ret = -ENODATA;
 	else if (ret > ndwords)
 		ret = -EPROTO;
 
-	xe_bo_unpin_map_no_vm(bo);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 3ad3c3609b415..148ee07dd23a9 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -11,6 +11,9 @@
 struct xe_gt;
 struct xe_sriov_packet;
 
+/* TODO: get this information by querying GuC in the future */
+#define XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE SZ_8M
+
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
 int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index ecc3e091b89e6..a686b04879d64 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -24,6 +24,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_gt_throttle.h"
+#include "xe_gt_sriov_pf_migration.h"
 #include "xe_guc_ads.h"
 #include "xe_guc_buf.h"
 #include "xe_guc_capture.h"
@@ -40,6 +41,7 @@
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf_migration.h"
 #include "xe_uc.h"
 #include "xe_uc_fw.h"
 #include "xe_wa.h"
@@ -821,6 +823,14 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
 	return 0;
 }
 
+static u32 guc_additional_cache_size(struct xe_device *xe)
+{
+	if (IS_SRIOV_PF(xe) && xe_sriov_pf_migration_supported(xe))
+		return XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE;
+	else
+		return 0; /* Fallback to default size */
+}
+
 /**
  * xe_guc_init_post_hwconfig - initialize GuC post hwconfig load
  * @guc: The GuC object
@@ -860,7 +870,8 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	ret = xe_guc_buf_cache_init(&guc->buf);
+	ret = xe_guc_buf_cache_init_with_size(&guc->buf,
+					      guc_additional_cache_size(guc_to_xe(guc)));
 	if (ret)
 		return ret;
 
-- 
2.51.2

