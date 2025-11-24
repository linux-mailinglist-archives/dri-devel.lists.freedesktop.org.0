Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F541C82C66
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 00:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D46310E32A;
	Mon, 24 Nov 2025 23:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUj8ORwa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E521210E327;
 Mon, 24 Nov 2025 23:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764025750; x=1795561750;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+VZC5XIb0AYj7oWtO2UjT7cOP/xmd+mCl1xi1lueVBg=;
 b=mUj8ORwa2yXzNY1AEPfRE2WAk9x3ynWsPB086hCJaloVO2TS5IAhFX/M
 xjWkRZmkYbhpl/KnI6zsi4EGvdQUGfMs+vD5W6yWoGi+4a3DtA3CLRBN3
 0Ds7DOaXJ390iHa2RRMV2Fef0sPS2i147oaVkKIq/oy1R+CG20RhIfPZE
 aImYALSLdRFmHIpaeLfoD1QqLgpcdp5+yYT1gr3SCVYtQqPihN64vFqnT
 3CebSSzWP0xafWbcHA2cf5lH6zABPpKJAwPPonqn9C2BoCBwove+zl7Tv
 owBIUhhAdfRofmucHqbvc7F9eCsGiDG+vQGygdekPbMHdbUk0HopIzeeP w==;
X-CSE-ConnectionGUID: R/zydyJYRBCQDaMs/RD1Pw==
X-CSE-MsgGUID: 6ugi2/JKS9+GkNiZn5kXIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="77512320"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="77512320"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 15:09:09 -0800
X-CSE-ConnectionGUID: dR5H4+6WQ+K1LfR0dIRBAg==
X-CSE-MsgGUID: EQmCdBY4TBqciwfN/QXdVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="192550305"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 15:09:08 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 15:09:07 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 15:09:07 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 15:09:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utXJFiI0DJtonoRXzVnQcX9ynx1c4+UanNioZXKZPINFzYDmQHsiFgHCESFs/iWiiAAPCXFk5Tl4tT+of8TLBSGdWiDAcWZ6xIQNU9Feyyu2++qbViGwfNJp5sEQmLNOUdessF5n/xPTRk4aCPEwuVxnIeXLqpQSG/byy36PTF3X7R2saZ108DS5vST+Eu6LM0Hi5m6MIlyryixjcnamN7NdqgV5btlpHdSPjNXChHXlZi0G3iMIjqjc0Xq8CMSfbdj/yz5w6oDXgRychRqx9G+ZpDGJfTxs6Pi9ZeOC70FCxeUG5F65+iCTTn5ZUCWTdUqL1Ff41Ln0hvxIrXSVvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s48OR5zhXVYffGbWPTR/LYkbzdYwJuxeoe0K6c0ofrs=;
 b=X5n9GdGUVjELrl8HYfPlq/P2bxRW3HPPcDjYS2ZiBESw3ysWxiJhHVfy4TLd2GmS+bx5idO6qAVQ+8xm/11H4/17mag+9w10/MHBlogFFd+5oblGEtOyiN68U0da07bRkDlOvD2NPT7amKR/LyuY7IIygw96L4T9Ma6wSTO8ON291l1vgMl8bzTR2cPaullpgYwYZ2E4eVjSykE/5Tcr1TgeimWtsYPymYAq6LlTBhgveWRgMMVhLuM2r/9/a4hNt4KuJ4aoyaz3oYUCXUAeUih9t3TaD1aFPdOiBD1O3hL0mGKDu0ZdLaNOalwiGRi2BE6rSqJkMl2i7hAocnmgQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPF9EFFC957B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f40)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 23:09:05 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 23:09:05 +0000
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
Subject: [PATCH v6 3/4] drm/xe/pf: Export helpers for VFIO
Date: Tue, 25 Nov 2025 00:08:40 +0100
Message-ID: <20251124230841.613894-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251124230841.613894-1-michal.winiarski@intel.com>
References: <20251124230841.613894-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0013.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::25) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPF9EFFC957B:EE_
X-MS-Office365-Filtering-Correlation-Id: d77c8a11-6afb-498b-c7f1-08de2bae76f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aExkZk5Cc2FQOXBKUHYwaXhja0FYRTZjQjduSDhYVkl6T05rU2dxSHdrM3kr?=
 =?utf-8?B?Smg0K3JTQ2hmVzRBZzd4dkVCTG5FMkdMcm5aNVVMbHhiNURvMlorQjZ6bWVl?=
 =?utf-8?B?RDRwWG9zdE5yUVJqMEwyeEFTS3lHTjQ0Q2pyOHdZQ05DcGRFTSsvYVE5OUNW?=
 =?utf-8?B?VlIwaVVSK09ac3FqOElTTVAxb0ZBa2w0ejBPWHRBNU1TNzVzckNIM1czUFd1?=
 =?utf-8?B?bWhXd1JGL3l0MHpyZVh0eWRNYkNGOTMwM015QThWMVVuWTBXbVNpTFRKNG03?=
 =?utf-8?B?Y2NTU0hIS2lvbFFBL2VsempvKzlVQVc1clhDZkdSdHpFQkd4Q1c0ajlsVTRH?=
 =?utf-8?B?UWlwQXFGeER0WW9hVkZ5d2MyU0hNQVdVa201YjBmSm90R2ZnSHRGdlVXTEg4?=
 =?utf-8?B?ZHZQcUgxR2QxT3p1SGQ2VUdBMUs3NUFJNjRVV1ZGSEtDWVQzQXI5djdHaUdH?=
 =?utf-8?B?RENoL1pqYlYrNkJLQU5GeVp0LzA0aEVoOXdnaXJtQmVIN2s5ZGljd0ZCaGwz?=
 =?utf-8?B?a3pxQ1Fza2hESHoyRnZZZTNSOERsQytISlBMWkVndWRwVWEyWW5PZDJKTE9H?=
 =?utf-8?B?ZmJ3dVNNZTNoK1ZIVFU2SkhMcURBRzV5VUFSQi9EMEpSSVlEZXp2SHBaNnRs?=
 =?utf-8?B?K0NPZTBva0taOU1VcXp1cHI1dk4rZEl1WjJ6UEF4R3Iwb05MaHIyWkhpSjlW?=
 =?utf-8?B?ZUZTdTh4SUorRVZzVTV1c0hDeCthczduNG5FeFpuRVlDTXlPam9ncGxiMFZ4?=
 =?utf-8?B?dmNkUk83WHRueXJMa0ZCZXNNaG9Cb0lMMW96Ymx6aFJNWWo5cGhvY2JQYXEx?=
 =?utf-8?B?SkFsYjBKdGR3K2FCaXdWMFdJRjhVRzJ4ZzR2V2twT29HZWpTd3NYV2NyNTVW?=
 =?utf-8?B?OUI1MUVaOTc5Q091TmU0N0NJWkRpQVo2QlFhdmlPN2RnVkx5aEt4eHdxY1Nt?=
 =?utf-8?B?bkpmUWpzMUdLcDVKY3R3TmVhNEJpMkNMemZJeTA0bmgyTjVKREExSlVOREVs?=
 =?utf-8?B?MkVSbTAvdjdETmFzYllnWnNUdHlCR2x5dGZLSzMvelk1d3htZXBVLytEK1Vy?=
 =?utf-8?B?NXdpbktvNm5qVENOOHA0MzU3d3djWlF4RUhtd2ZTTUx2OWFIaGpCQ0tpS1Rh?=
 =?utf-8?B?T2RzZGxSaHgvWll2YlF0Ri9NZi8yd1NHMTFNQ0ZjQXI1L1lRdVRJV0Ixc096?=
 =?utf-8?B?STRGNTc1QzcyOC9Jb1NyWUtkR24yMXlRay9NUTZEcWF3blJTYlAvTTYrM201?=
 =?utf-8?B?YXROSGpTSi9lMXErdmVBR0RaZ3B2TzBhb0N5SVZvQmk3dDhoclgzYndXemZL?=
 =?utf-8?B?OFJVMzZOS3gxS2FnVEdjMjJJLzIrTzZpWERMUXRKY3plQjJqajJCalo1TXAz?=
 =?utf-8?B?bGlKZ2d1SVdFWU5BQWt6dmIzb2Y4bDFlNXpwYTFPYStiekkwdlIrOXFqcDU3?=
 =?utf-8?B?eFFhTHpadHFIdlZ3NGRSdHV4ZFVldU15dkRuVFBhendQS3NDeithZlhvQnRu?=
 =?utf-8?B?TTIveUFRTXFGa1d5MmxzTWs1TEorRkR3Z2ZycUFhaXdySFl3ZHBpeUhUTStk?=
 =?utf-8?B?RGdCa2ZUcjBNVEVLRHZxelJ2V0p2K1RQZHhURUZhbSs4bXJSK3V0UzZuL2tD?=
 =?utf-8?B?anVoVG9xVWxZUnhWV0dlSmJxd0hnL2pFS25YNW5MZUxPUjZaSzRHbWY3b3cz?=
 =?utf-8?B?aG9jQVdsdEV3MUU5dWt3Zm05NHZCQktXZ2xpMWd6dXdxdW1pbktaejFQOE5o?=
 =?utf-8?B?OWlsVjBySlJWMDdZaU1oenl1SkJSWUZPSEl4eGJRU1hBSno2TXJ3YTIwMWd5?=
 =?utf-8?B?OEpPdGZWbmJMWEZQU3EzZzRGVkZBQkYzVnZ4MGtjbVBGS282RU1mdVdZd0lv?=
 =?utf-8?B?K1h2SGVuNkQyaGdGODFPd0pHRnpzRU02OHRDc0FNTitiV2drNEtkQ0ZNelZv?=
 =?utf-8?B?VDB4cWplRWNUeWZaaTZGRFJxVVRJMklCTE5lMVJwWmlXVTc4OWZ6aEhRdnFS?=
 =?utf-8?Q?8Q6QdaysNBytz6FmJEEXg/t9ge4S88=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjFGWjZWVCtXWUhSekkzcU5wbjJIaEhYL3dxd093RmRiYlpqbmc5SE9Udk9L?=
 =?utf-8?B?ZVZwTEExQStaRDVMbjh2M3NGYWhzcVpNYyttWDFwN1NwNjBYTjZGbkJzb0d0?=
 =?utf-8?B?YTVDaGtZSnRTa0FhUVJTYStmVjF5NVJzYkRmTGNicGU2b3RaVzNFZ20yK1pS?=
 =?utf-8?B?V2FEejFxSFNMbERoTmY4QlUvazR4SzZ0RWlyMWRFaE1oWXdUUnRqbTJOOWFP?=
 =?utf-8?B?SWlheDdmUnIyUTBnQVhTRDhhcktPM0E3Rnh4SFZsUW5vU1ZIL05nY1RxRDJ0?=
 =?utf-8?B?MWg1cGZ0L2gzUytVSU81cWxDcXN3WXFjTEJPT0svL3ZxM29uY2E5dDNuc3Fx?=
 =?utf-8?B?eVZGL0JTdXlOaGQ2WnVLekxKOEw2L1VxSGE3S3BMeFk5ZENkYjZkaDl1L0s2?=
 =?utf-8?B?MGVyMHVOd2JrTXhSaFR5bHcwLzJTUEhzLzcvTlhjLzh5eU9HblBVN1BqbDcy?=
 =?utf-8?B?KzNLc0ErZVV1ZHl6QWJId3AyTHJIbmV6ZGl6YTlzOXdta0RQKzhyYjN0cEcz?=
 =?utf-8?B?K1F1YkJHYVFqUzNueTNOMTlwelR1SFY4WWJsSzNCcHJkMDBwK3ljakxPQ3Fk?=
 =?utf-8?B?U0JISFNURXBBTlRzTEU1Qi9XclBacFVyV2QxT1F6UVhYbFhvSEhSMThndU95?=
 =?utf-8?B?bVFnd0p3dVZXRUp5LzBkMldBMFplQTlsY2dERDBaaWxuOHN4TTZVRlRsTmlT?=
 =?utf-8?B?OHVqdmVDV25EcE1PaHhrVUVXMDlBejVXUHFrMDBoU2hoZEwybXBaNC9ZRDAz?=
 =?utf-8?B?OThsRkpBZGR3U3JPaGxranFnL2hydzdia01CT1liUVk0czNxZmNrREc3Wmoz?=
 =?utf-8?B?SEl2Y2VIQTl6WjIrWTNUZElLRzhvTmV6NEQvSnV1a1RoZFp4elNtQ0tVWkY0?=
 =?utf-8?B?REsyTmFvVGZVOWVZVzJER3hNekJmL0xucDN3Uk1mUVlmVkhzUkowVDJSaTIz?=
 =?utf-8?B?Zkx3U2JpQ3hmUk52NkxPZzdvOUMzRVJZNHZ5aHlzbk1iWnBZaGREZCt6L0xH?=
 =?utf-8?B?ZjFzaWY4b3Z3bm1HSTB0THl5ckxGUVNHQ1lxS3p0YmIrdXhiOXBaKzNKUkI1?=
 =?utf-8?B?bDdLUnlZOHFGb2l1T3gweENGYnQ1RUVITUgwS0I1bnB4SzFxenNoWGhKalli?=
 =?utf-8?B?S3prV3U0c1FrRC9qWWRXQjNTMy9ibGpqMzYyWUNPZjYrNzNqV1dnMHd6VFZ3?=
 =?utf-8?B?N0pVR2N6dDV3OHpvTjIvWFIrQ0h4cDdkak5MZ1FKZnQyelJtY1BsNU03MThZ?=
 =?utf-8?B?NERiUStYSjRCVTIyeUFzRERyclNBaWE5cm0rTFR1aVJLUlJ0WmpzcGpJeUNH?=
 =?utf-8?B?OWlQSWFmOWFPeXhoMkM4a2FzeUZhSk1od1ZHV2VGM04rTlhld3hUS3R6aTFP?=
 =?utf-8?B?NXl1K2tuZVloV1ppNWFNdzFMWWZoNTBwRnZnV3dGMCtUdTcxRStmK2JzQ2pX?=
 =?utf-8?B?N0FhZnlwYlpTbUNidkpqbnhNWDlSWDNrZ0xyM254NkxLdkNwT1ZwSDN3NWYw?=
 =?utf-8?B?UHRncy9CUmJKQ1J2QWs1ckw1WWpReS9LMk1NTHNLdkthbVhsWFJGSTVvVVFC?=
 =?utf-8?B?dWRtSVY4Ym1FUWpOdEFvTFgzcjBXY0ZQcFdlUUFZM2laUkVJc2R3MExSbWFF?=
 =?utf-8?B?KzYzN1d4V2ozeWl5RTN2NjJzQVNVY1lvQjNxZXl0Sk85NkxhUk5kMEhQQlVQ?=
 =?utf-8?B?UGt6aUtJSzVsUXhUbjBDT3NBeFB2R290MUlCNDRoSGdXT2E2cEFzaXltRVFu?=
 =?utf-8?B?L2VaSTJ4MWordTZpcDdHa2NleWZNa0V6NzVmNVhpaHlNUTkraE51bjZpOHZn?=
 =?utf-8?B?WkVsYk55ZGxocCtEMlU5STBxR3pGRWR6RHl1bWlNZ25kdVRBRzBidW82S1l4?=
 =?utf-8?B?WG1JaHZGYVl6WG5RUmxBcmd3REIvZzk5ajNsWWhCd3J3VEdFNERDMXZ1QWs3?=
 =?utf-8?B?ZzJORUVuaGlKRmxUbjVURUdKMGRwZnBEM0REeDNRTG1hMzdMSEFvOFh4aitj?=
 =?utf-8?B?dDdsMlRzQ2M2ZDEwS25YUVJicXdOZEtqd2lDTGc2TkZUM3VrQ3pkL0FlYWhz?=
 =?utf-8?B?YjZrR2RYMUZLcDFVV3JucUFPdmpQdkFtTFVuK1F2TDFzOXEwTXcvVDZMQ0Ja?=
 =?utf-8?B?N2dxcWRBY0UwWEh1Y08xNlB0dVpJNjBNd1Z5dkx4QnoxdDVCZ2h5S3FkK2dV?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d77c8a11-6afb-498b-c7f1-08de2bae76f1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 23:09:05.4489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: irOm2mV37l/BWA/TVHiChXUGoQERxIIaUaHieC3OoFNQ0XxA38XN1OKtbf47WUknjcRHwqEleubjvVWIPYuo+uEhj6nsLVJX/V0cNxHkfto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF9EFFC957B
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

Device specific VFIO driver variant for Xe will implement VF migration.
Export everything that's needed for migration ops.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/Makefile        |   2 +
 drivers/gpu/drm/xe/xe_sriov_vfio.c | 276 +++++++++++++++++++++++++++++
 include/drm/intel/xe_sriov_vfio.h  |  30 ++++
 3 files changed, 308 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
 create mode 100644 include/drm/intel/xe_sriov_vfio.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b848da79a4e18..0938b00a4c7fe 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -184,6 +184,8 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_sriov_pf_sysfs.o \
 	xe_tile_sriov_pf_debugfs.o
 
+xe-$(CONFIG_XE_VFIO_PCI) += xe_sriov_vfio.o
+
 # include helpers for tests even when XE is built-in
 ifdef CONFIG_DRM_XE_KUNIT_TEST
 xe-y += tests/xe_kunit_helpers.o
diff --git a/drivers/gpu/drm/xe/xe_sriov_vfio.c b/drivers/gpu/drm/xe/xe_sriov_vfio.c
new file mode 100644
index 0000000000000..785f9a5027d10
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_vfio.c
@@ -0,0 +1,276 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <drm/intel/xe_sriov_vfio.h>
+#include <linux/cleanup.h>
+
+#include "xe_pci.h"
+#include "xe_pm.h"
+#include "xe_sriov_pf_control.h"
+#include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
+
+/**
+ * xe_sriov_vfio_get_pf() - Get PF &xe_device.
+ * @pdev: the VF &pci_dev device
+ *
+ * Return: pointer to PF &xe_device, NULL otherwise.
+ */
+struct xe_device *xe_sriov_vfio_get_pf(struct pci_dev *pdev)
+{
+	return xe_pci_to_pf_device(pdev);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_get_pf, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_migration_supported() - Check if migration is supported.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ *
+ * Return: true if migration is supported, false otherwise.
+ */
+bool xe_sriov_vfio_migration_supported(struct xe_device *xe)
+{
+	if (!IS_SRIOV_PF(xe))
+		return -EPERM;
+
+	return xe_sriov_pf_migration_supported(xe);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_migration_supported, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_wait_flr_done() - Wait for VF FLR completion.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function will wait until VF FLR is processed by PF on all tiles (or
+ * until timeout occurs).
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_wait_flr_done(struct xe_device *xe, unsigned int vfid)
+{
+	if (!IS_SRIOV_PF(xe))
+		return -EPERM;
+	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
+		return -EINVAL;
+
+	guard(xe_pm_runtime_noresume)(xe);
+
+	return xe_sriov_pf_control_wait_flr(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_wait_flr_done, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_suspend_device() - Suspend VF.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function will pause VF on all tiles/GTs.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_suspend_device(struct xe_device *xe, unsigned int vfid)
+{
+	if (!IS_SRIOV_PF(xe))
+		return -EPERM;
+	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
+		return -EINVAL;
+
+	guard(xe_pm_runtime_noresume)(xe);
+
+	return xe_sriov_pf_control_pause_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_suspend_device, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_resume_device() - Resume VF.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function will resume VF on all tiles.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_resume_device(struct xe_device *xe, unsigned int vfid)
+{
+	if (!IS_SRIOV_PF(xe))
+		return -EPERM;
+	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
+		return -EINVAL;
+
+	guard(xe_pm_runtime_noresume)(xe);
+
+	return xe_sriov_pf_control_resume_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_device, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_stop_copy_enter() - Initiate a VF device migration data save.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_stop_copy_enter(struct xe_device *xe, unsigned int vfid)
+{
+	if (!IS_SRIOV_PF(xe))
+		return -EPERM;
+	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
+		return -EINVAL;
+
+	guard(xe_pm_runtime_noresume)(xe);
+
+	return xe_sriov_pf_control_trigger_save_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_enter, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_stop_copy_exit() - Finish a VF device migration data save.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_stop_copy_exit(struct xe_device *xe, unsigned int vfid)
+{
+	if (!IS_SRIOV_PF(xe))
+		return -EPERM;
+	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
+		return -EINVAL;
+
+	guard(xe_pm_runtime_noresume)(xe);
+
+	return xe_sriov_pf_control_finish_save_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_exit, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_resume_data_enter() - Initiate a VF device migration data restore.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_resume_data_enter(struct xe_device *xe, unsigned int vfid)
+{
+	if (!IS_SRIOV_PF(xe))
+		return -EPERM;
+	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
+		return -EINVAL;
+
+	guard(xe_pm_runtime_noresume)(xe);
+
+	return xe_sriov_pf_control_trigger_restore_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_data_enter, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_resume_data_exit() - Finish a VF device migration data restore.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_resume_data_exit(struct xe_device *xe, unsigned int vfid)
+{
+	if (!IS_SRIOV_PF(xe))
+		return -EPERM;
+	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
+		return -EINVAL;
+
+	guard(xe_pm_runtime_noresume)(xe);
+
+	return xe_sriov_pf_control_finish_restore_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_data_exit, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_error() - Move VF device to error state.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Reset is needed to move it out of error state.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vfio_error(struct xe_device *xe, unsigned int vfid)
+{
+	if (!IS_SRIOV_PF(xe))
+		return -EPERM;
+	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
+		return -EINVAL;
+
+	guard(xe_pm_runtime_noresume)(xe);
+
+	return xe_sriov_pf_control_stop_vf(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_error, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_data_read() - Read migration data from the VF device.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ * @buf: start address of userspace buffer
+ * @len: requested read size from userspace
+ *
+ * Return: number of bytes that has been successfully read,
+ *	   0 if no more migration data is available, -errno on failure.
+ */
+ssize_t xe_sriov_vfio_data_read(struct xe_device *xe, unsigned int vfid,
+				char __user *buf, size_t len)
+{
+	if (!IS_SRIOV_PF(xe))
+		return -EPERM;
+	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
+		return -EINVAL;
+
+	guard(xe_pm_runtime_noresume)(xe);
+
+	return xe_sriov_pf_migration_read(xe, vfid, buf, len);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_read, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_data_write() - Write migration data to the VF device.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ * @buf: start address of userspace buffer
+ * @len: requested write size from userspace
+ *
+ * Return: number of bytes that has been successfully written, -errno on failure.
+ */
+ssize_t xe_sriov_vfio_data_write(struct xe_device *xe, unsigned int vfid,
+				 const char __user *buf, size_t len)
+{
+	if (!IS_SRIOV_PF(xe))
+		return -EPERM;
+	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
+		return -EINVAL;
+
+	guard(xe_pm_runtime_noresume)(xe);
+
+	return xe_sriov_pf_migration_write(xe, vfid, buf, len);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_write, "xe-vfio-pci");
+
+/**
+ * xe_sriov_vfio_stop_copy_size() - Get a size estimate of VF device migration data.
+ * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * Return: migration data size in bytes or a negative error code on failure.
+ */
+ssize_t xe_sriov_vfio_stop_copy_size(struct xe_device *xe, unsigned int vfid)
+{
+	if (!IS_SRIOV_PF(xe))
+		return -EPERM;
+	if (vfid == PFID || vfid > xe_sriov_pf_num_vfs(xe))
+		return -EINVAL;
+
+	guard(xe_pm_runtime_noresume)(xe);
+
+	return xe_sriov_pf_migration_size(xe, vfid);
+}
+EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_size, "xe-vfio-pci");
diff --git a/include/drm/intel/xe_sriov_vfio.h b/include/drm/intel/xe_sriov_vfio.h
new file mode 100644
index 0000000000000..bcd7085a81c55
--- /dev/null
+++ b/include/drm/intel/xe_sriov_vfio.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_VFIO_H_
+#define _XE_SRIOV_VFIO_H_
+
+#include <linux/types.h>
+
+struct pci_dev;
+struct xe_device;
+
+struct xe_device *xe_sriov_vfio_get_pf(struct pci_dev *pdev);
+bool xe_sriov_vfio_migration_supported(struct xe_device *xe);
+int xe_sriov_vfio_wait_flr_done(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_suspend_device(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_resume_device(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_stop_copy_enter(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_stop_copy_exit(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_resume_data_enter(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_resume_data_exit(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_vfio_error(struct xe_device *xe, unsigned int vfid);
+ssize_t xe_sriov_vfio_data_read(struct xe_device *xe, unsigned int vfid,
+				char __user *buf, size_t len);
+ssize_t xe_sriov_vfio_data_write(struct xe_device *xe, unsigned int vfid,
+				 const char __user *buf, size_t len);
+ssize_t xe_sriov_vfio_stop_copy_size(struct xe_device *xe, unsigned int vfid);
+
+#endif
-- 
2.51.2

