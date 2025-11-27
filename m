Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C717C8D970
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 10:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3D110E7EE;
	Thu, 27 Nov 2025 09:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fFXSHoWm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B1610E7AF;
 Thu, 27 Nov 2025 09:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764236392; x=1795772392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FBCEuPcMmp5CwCGYtZgiX+MHel7JbPx56FEdLNeDg20=;
 b=fFXSHoWmIrFenkgy/3H6xi3rHbVDu2Y1V7vHMM1tVgv3sKd5cu4iqD5e
 +wsiF3KLJj9wTwN1CVpD4/gRTh6LBzZp+zBM6Htczz0qEAJKEz75XrXGw
 NeTOtvUFP08hsHa0AIuuq+hKlBq1jor+OQhEZ5phEI8JWVBpgPeHVLcHW
 T9vSQSBKNjOL2wKrbDUWTZN5rHNy5XOH716i2pY+YjsnXsiUJcHmZPkhP
 wg9+xbcwTVn3XklsAu3VTCqFAEXGS1pquwDPIU92eXmXLPvBrC5F2PgXZ
 ouE6TAVvsYtZI4oCFDRskCvOjjU93FVIBgRg6+4BzirK9ouWWt+9DrJOq A==;
X-CSE-ConnectionGUID: 858MSTgdS1yBC223iQoX9A==
X-CSE-MsgGUID: i22VG7MwRumoB9CLe+zaIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70148380"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="70148380"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:39:52 -0800
X-CSE-ConnectionGUID: bmumjhEjQ1C9gAGBGaZvAg==
X-CSE-MsgGUID: MC/zb2GISp2haSpiuh/ruQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="193003579"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:39:52 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 01:39:51 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 01:39:51 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 01:39:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TraPLKxbmkFnjECPtiqx8F34Gf375RMYkr7zZWgp+8hY5fi/0OWAgW6IOLpXvckH9ut7YnKULfPoJejrem1XKw4UPg2q1IX0bxjJjVcqfJGdo7aQOgeIUDWXtiJKwORDGSrcVCY/qDC0yQT1094N99fPJcJE1umtUYUoyIaB+ebqQGgAH415NJhHdAFsz5p1bDj/uMllq5qqbmfny3sWdO1r00lvSSzkpYVvHRF88S5DkU1KJjaL2P7ebLgG1F6Xit8bBPbUDUkh7D36SWY08chjmLWPRxj/u4CDsUZWQqhs/q9QzoLNamjKEV9bXwRlYcewiCXp5QJcTmEA0ZTHGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElVwrkk2dcDYwqcNFIXsWapMDl1uO7KpiBotZvp1SEo=;
 b=n2G78kmULiN/F77Rsa98WjWXb214uHkvNckVZYEsD8fq8YMoKvc/xFotSSr8hpBxIzfoB3dLEJigDPAvuHXDHELNI/v9kT1v4OkkKeSnaTepE4tKRjDlWwtqhYz90H5xrsNLjVeK4qeEJ0NC9P7J8KNIE2McokeNPml/4ha3LpbFt7u1MWWA5UDn0woGaVm2yRFv0mxILcTLQjb3ih9lQffbytEbqoO1hu17sfMbFDf4bKHqipBqauQxg/OLrZ8BBaaZd0A+DOuA1OYvLT4FGgg4aeaBK+7KhZVB/GOUE5LCpa/wdNPrDJ0D/i+W+Te41izS2hbqXQSP9sDrst+qOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 BL1PR11MB5980.namprd11.prod.outlook.com (2603:10b6:208:387::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Thu, 27 Nov
 2025 09:39:47 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 09:39:47 +0000
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
Subject: [PATCH v7 1/4] drm/xe/pf: Enable SR-IOV VF migration
Date: Thu, 27 Nov 2025 10:39:31 +0100
Message-ID: <20251127093934.1462188-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251127093934.1462188-1-michal.winiarski@intel.com>
References: <20251127093934.1462188-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|BL1PR11MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c155e5c-626e-46f9-3004-08de2d98e734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1ZHckJQQXpWYjdLY1VaVzQ2RXlLQVBKeWV6N3l1QXVyb1V6eStUdHJqaTho?=
 =?utf-8?B?SGJUYzA0SCtadFl3RXVOUU12QkFQN1J1ejloY0NrNkVSSXp0Yzg5NFpISXFC?=
 =?utf-8?B?eU5WWTM5d2cyWHFyWXp6Y0g1NjliRGRGdVhJQWp4VlFOWkdNYitJb3V5ZlRQ?=
 =?utf-8?B?N3ltTkZiTDhvU0grdlA5WnUyS1k5eFZHa1UwVDdic1dZZ3Q0VEhoeGRBeThh?=
 =?utf-8?B?NTRTTlh5eGx2c3dSVHVYZm5SZXRXckJUNUhFZFFFNnlqek9ONTRTS2hpUml4?=
 =?utf-8?B?VnowOC84ZUVSTldNZnkyUDNVeXkwcCtJTG9kazNSWUNsZEpMdGVFNUVzVGNI?=
 =?utf-8?B?UExOeGZwOFB3Ynp1NzBFd2FGUEY3UHJhSjQySVl2OStlWDdOV01JYXZ6TzB6?=
 =?utf-8?B?bEVpbHF0cjFPWVNWUXp1blRPbVcxM2RoRXJzQU12V3h1SjdCNUVkK3AzVVph?=
 =?utf-8?B?RFlrWkc5RGpaY1haN1oweWNHaFhzSk9RMmg2K25TS0R5UFd1Rk1xVE1kTHIv?=
 =?utf-8?B?Ky9WcUNEMkRKcjFWbHFqeHdMdFU1anhuMDJNNEhEb0NINUd0eExwdkZZYTUw?=
 =?utf-8?B?RTRqNFdyaGdqZGM3QVlzYzhrRjVFNnFvYnRHYWYrNzRUemk3RmdXMjVSc3p2?=
 =?utf-8?B?aEIrOHNlMldBNmxSRExDNmJHcGx0b0FoWXdrZ3orVDRCNUdsdmxtQ3V5a2xH?=
 =?utf-8?B?U1FYOHgwUHc0QUdpallURU80bzVjN3BjVUhYazBUa0JlOERob3BLNnBUN3N4?=
 =?utf-8?B?bkpGci90VFV3WmdOY1pZRUlObzdnZldHY2U4eHVaSGZDaENsTnFkK2VUSG1E?=
 =?utf-8?B?dzBDQTYrclZib2RjWjZIYlJJMGdsa05udWszTGJ0ZnFPd3RCN0VpWUdwd1do?=
 =?utf-8?B?d0hjTlE4M1Z0R3JicXhWVUVPQ0dDVTJJMEtKa25RVU5WaDdlZ0xYTTJSRy9B?=
 =?utf-8?B?WEhqNUhud0F5NXY2cUFYcDJMN1h6L1ZQMnVRMWE2VE1tTzlhMDIvckFvdC9U?=
 =?utf-8?B?UHF0azZ4YTdyVytpSTJRcm5nODAwR2R1UFRzaDZPMXBna1J1RW96MTZnUFNq?=
 =?utf-8?B?YVJGQVE5Tjh4cjN2M2lUOVRYVkorSmpxU1BGaEdCaFFjUGNPWjF0REJrMXRp?=
 =?utf-8?B?RkpNTHFOdk5aR29NUTdFd2xzNTNkQWo1dnYwSFhKNVI3VWg0Z0tFSWs2Qng0?=
 =?utf-8?B?cE5BczIvNlNENjFGaks2SXdwK0U0S296ZjZubEg2RnhDSE91ZExWbk80bVlU?=
 =?utf-8?B?alRtV0NhREM5ZndaYW56QUpOOHFkSmZLRnV4TU51RE1CV0JRa0hFSVJiRWxY?=
 =?utf-8?B?ZDlxN3FmYVJ4TkJQTU5wa1JOTzhLTXM4dDNHeXo4R3Aya0U0Z1VhSXd3THl5?=
 =?utf-8?B?NkU1UmpuQXZvdkZENmI3blI3Tk9qVTJpVEJsU2xuRDBwNUJ1SnFueXlwZmRT?=
 =?utf-8?B?cFgybmczNHhCYXROc1JROWdpUGs5cW9QN0M4K2ZRTnJjaEZZTG1LNGJRTVU3?=
 =?utf-8?B?a3pIZ00rRFcycFJlNEQ1SHEwN3BQTzZ1T2lKTnZaTzQvUEZLeDJvdnNhZ0p1?=
 =?utf-8?B?cGhlZ0JidHl5eUlOMFJBSEVEWmd5VDQ0TjZyU1hDNlpiYzkxbk5TWjBOQm9l?=
 =?utf-8?B?Umdtb1JQUGgvN2tLaDRTZnJITDhSeEhaK3VqMzZ0a2s4azJEKy9TZVBUamcx?=
 =?utf-8?B?SHJTREFsTXQzYTdDWjdoVXNYc294bzZ3SWVsam9KY085WkdyYVZRREtOOGxW?=
 =?utf-8?B?RzVBcWpZUmUzNUdXcXlSNWR5cTNsSkF5ZkNzQ2p1YnNyU05sQkQycVVsSGxk?=
 =?utf-8?B?T1JteFQ5UVlveURPd3JscFBXVVdqRUxKb2RQb1NGdk43Lys2cmtkTnFRTFFW?=
 =?utf-8?B?WUphNWZDNmFrN1hTb0hVRXdrR2tWcUswVm1rN01MTmhqVUsveWkwNUVDVTJ1?=
 =?utf-8?B?M3FWZ3dDZzI5UzVmcFUrT1UyZXBibU5UZ2RhbjNmQk9PVGJGOEMxa3ZzNFpE?=
 =?utf-8?Q?S566oNBBgKeXl2HWMpO6/GWU3HK2gk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXB6RlhRZzBZYUQ3ZUNaaDVMbjFRNUJ5UmNIdkF3TXB0YlAyMVdQN0ZFcEVJ?=
 =?utf-8?B?QStiUTUyOCtQcmx6a2FsY2wyRy82Z3Y0alQ5cTR0eXcrR3JLV01yU2cwZGRC?=
 =?utf-8?B?WUM2SkpQMzlFN3dhR2pOM3hkaitHay95L2hRZ1RPaWFHR0FCZ1JsWlc2Q2Z2?=
 =?utf-8?B?cXVCRWt0OFV4MUxGV1lOZWRuN3VYeTAyMk1SWlFOZHNGMFA0SnlET1JOcC80?=
 =?utf-8?B?aVVCM0NVR05wejVZMndOM2ZVOTJXaVVwZ2JuODRSdzZZcUpOdzVRbFRWZzlq?=
 =?utf-8?B?QWVLeXRTVzdtcjEydFBvZjVqMGhucDRRM3k0SEloMXd4NXkvY2VUZ3I0MEVS?=
 =?utf-8?B?eGNkT2NjMk9ldUh5YzRwQjhjclFoR2oyUnNJZmhzVEJEaGtCeFVDdC9qbmU1?=
 =?utf-8?B?bG1qazJ2Z2ZaeTlDbGduSkZFV3dGZ1FjVUtrR2J2M2dEOXYyTTBvSHlQcGVh?=
 =?utf-8?B?RHRlaUlzZmRzbC94cHQxTVRRYnBqeitaNEk3R3BqUW42ckQ3NllZMHllVTB2?=
 =?utf-8?B?R2lVZ08wWnQvN0RLZUw2emVqdFB5YXRlckRIOWRDTS9zdC9sZFZPQVRvb3BM?=
 =?utf-8?B?WWNENEVHWXVqYk8vYm9FcVBieFNhUDBxYVdadURvZXBaZ1pVK0F5NUZIbHRs?=
 =?utf-8?B?NVpoOVdXZFB4OFE4V2crc3BwTDNjTHZXY3J1cEl2UENWZCtqOFdHUkFYazNy?=
 =?utf-8?B?ZHU1Q2Q1NGhjc3FoMHBsRkRweTlMN0NYSkViaitPcmN4d21Sa0xxRWI3Smpo?=
 =?utf-8?B?akhxenpFVE1udjVmUVVYb2pvbkF4MzBlaXRVbEtMeWNKc3RVdkdYU1ZSTHJX?=
 =?utf-8?B?N2w5TDZSbmtyc0U3V0lvdXZXYjI4ZmRKMUdEMWtjSEhvL1dsOEQ4bWtHZ1p3?=
 =?utf-8?B?WFg1Y1Uwc3gxa2tZYktWV2N5ejI0enB3bkYwNFhVcEtpZHBmRHRSRlFVQzlU?=
 =?utf-8?B?aC8wcWZHcitsZDhwQ2lJc3pGZDZ1RFFoZzFtTGNSemR5d3p5MVAxdGlid0I1?=
 =?utf-8?B?V2t6SzJMV0J2OGMzb1BDckdBbjhtZnpiSFh4MzloOENKYTJJMDgzVFVTK0NJ?=
 =?utf-8?B?YkszZjJjbWt0Ri93c1BQZFltVDRUMXZDRDdDNU42QlVPdGROS1FyNE5UeWdZ?=
 =?utf-8?B?WnRmbm5mMXJRV2U4alo2dG9MaFBFNVJVYitRcC9PZDdRSWt4NUFYM0ZGTngv?=
 =?utf-8?B?MklWN1BXajhlRSs0WTlUMEZVbVVkU21vSXJkVTdrTDI1WDVCdzVxZUdKWnE3?=
 =?utf-8?B?dXRCOWlkZXozQ1ByMmtMbkhNK0lSQmowdXBwa3g4K3hjZkVRaFNmbTJSNGE1?=
 =?utf-8?B?N3BZcmVudFowVmpaRzZxQ0pHdG1WdkpJWmJDeEJiOTk3ZlhocU9lUW1VVFY4?=
 =?utf-8?B?bzNLYlh5MUZjQjlneFlxQnNqY1NtVEVmOS8veDBnNUR1TlcvUHlJWWV4MFpK?=
 =?utf-8?B?M3RkK1FmbW0wWnFTVDBiR0xnUUVsSW1QbmFwNlk5UDdVclFaOGVXSkJFN2VG?=
 =?utf-8?B?aDc0a24xZHViQjRHeUZyLzg2TklTL0pvNHEvOWFDWjdhdHFJYm1qUTBESUFm?=
 =?utf-8?B?a2pXWS9wdkMwYWxoZTZDTGg5Q1p1V0wvY1pwVFRtNmxtRTRmUmJmaFFGeFFH?=
 =?utf-8?B?WFR1SmFjSVRWSFVVYnZLUjhsYkEwdmdYa3BVdlBvZUErb20wS1IvMnoxb1hj?=
 =?utf-8?B?ZVRvbEc3WDBieDFGOVNuaXc5cTdKeXJtQ1I0bmlEN2Z3ckg1dXZ1aWlOcjhi?=
 =?utf-8?B?ZC9MU2pyRHI0aFFaSjk5cVZVUHpaZm84YnhQOXZ1dHJSNk9yeFk2K1NsY3dX?=
 =?utf-8?B?RXVObGR6b0ZzZmd2ZWJTV1lONGUvVHR6YURzd0hMYUloQlcwUXlPOXhUbFN3?=
 =?utf-8?B?MWRKNy9lbFBRWnMwNExkQm5sSTU0dG1YdERiK0VsVU56a0F0K1V0d2ZudVVx?=
 =?utf-8?B?cW11WkFIQUpIVDhTWW55dXh0a01XVFN6NTQzQTRNRU1TMlQ3WmZwWHNLUU05?=
 =?utf-8?B?ckhvOHJ5MFZveG5zZmZvRHNkdjN0RUhvUWFPak5NZHdZQjc4enhaY3JXUUgv?=
 =?utf-8?B?eDBTczVBZDVySkZ2R0djVUNCaVlMRHhESEdBK0F5Q2pIK2M3ZTZCV2wvcFp4?=
 =?utf-8?B?T0hHN2ZSL1B5QjBWUThZMzYxUXlTTm9YdUVzVnVpTjUxbTV1WEhINlY3SlVn?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c155e5c-626e-46f9-3004-08de2d98e734
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 09:39:47.2841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 17V2JUIWmitZDJgIh6Ue55iY1RWSSvYtglJz4C4u6mAH11h24nYsDvB0lqvTDuztRphlA8GpDyGkMOIfXCBVvmiYsDiX8TSAee39fRjreqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5980
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

All of the necessary building blocks are now in place to support SR-IOV
VF migration.
Flip the enable/disable logic to match VF code and disable the feature
only for platforms that don't meet the necessary prerequisites.
To allow more testing and experiments, on DEBUG builds any missing
prerequisites will be ignored.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  9 +++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 35 ++++++++++++++++---
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  1 +
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  4 +--
 4 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index d5d918ddce4fe..3174a8dee779e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -17,6 +17,7 @@
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
 #include "xe_gt_sriov_printk.h"
+#include "xe_guc.h"
 #include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
 #include "xe_migrate.h"
@@ -1023,6 +1024,12 @@ static void action_ring_cleanup(void *arg)
 	ptr_ring_cleanup(r, destroy_pf_packet);
 }
 
+static void pf_gt_migration_check_support(struct xe_gt *gt)
+{
+	if (GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(70, 54, 0))
+		xe_sriov_pf_migration_disable(gt_to_xe(gt), "requires GuC version >= 70.54.0");
+}
+
 /**
  * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
  * @gt: the &xe_gt
@@ -1039,6 +1046,8 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_PF(xe));
 
+	pf_gt_migration_check_support(gt);
+
 	if (!pf_migration_supported(gt))
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index de06cc690fc81..6c4b16409cc9a 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -46,13 +46,37 @@ bool xe_sriov_pf_migration_supported(struct xe_device *xe)
 {
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
-	return xe->sriov.pf.migration.supported;
+	return IS_ENABLED(CONFIG_DRM_XE_DEBUG) || !xe->sriov.pf.migration.disabled;
 }
 
-static bool pf_check_migration_support(struct xe_device *xe)
+/**
+ * xe_sriov_pf_migration_disable() - Turn off SR-IOV VF migration support on PF.
+ * @xe: the &xe_device instance.
+ * @fmt: format string for the log message, to be combined with following VAs.
+ */
+void xe_sriov_pf_migration_disable(struct xe_device *xe, const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list va_args;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	va_start(va_args, fmt);
+	vaf.fmt = fmt;
+	vaf.va  = &va_args;
+	xe_sriov_notice(xe, "migration %s: %pV\n",
+			IS_ENABLED(CONFIG_DRM_XE_DEBUG) ?
+			"missing prerequisite" : "disabled",
+			&vaf);
+	va_end(va_args);
+
+	xe->sriov.pf.migration.disabled = true;
+}
+
+static void pf_migration_check_support(struct xe_device *xe)
 {
-	/* XXX: for now this is for feature enabling only */
-	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
+	if (!xe_device_has_memirq(xe))
+		xe_sriov_pf_migration_disable(xe, "requires memory-based IRQ support");
 }
 
 static void pf_migration_cleanup(void *arg)
@@ -77,7 +101,8 @@ int xe_sriov_pf_migration_init(struct xe_device *xe)
 
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
-	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
+	pf_migration_check_support(xe);
+
 	if (!xe_sriov_pf_migration_supported(xe))
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
index b806298a0bb62..f8f408df84813 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
@@ -14,6 +14,7 @@ struct xe_sriov_packet;
 
 int xe_sriov_pf_migration_init(struct xe_device *xe);
 bool xe_sriov_pf_migration_supported(struct xe_device *xe);
+void xe_sriov_pf_migration_disable(struct xe_device *xe, const char *fmt, ...);
 int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
 					  struct xe_sriov_packet *data);
 struct xe_sriov_packet *
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
index 363d673ee1dd5..7d9a8a278d915 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
@@ -14,8 +14,8 @@
  * struct xe_sriov_pf_migration - Xe device level VF migration data
  */
 struct xe_sriov_pf_migration {
-	/** @supported: indicates whether VF migration feature is supported */
-	bool supported;
+	/** @disabled: indicates whether VF migration feature is disabled */
+	bool disabled;
 };
 
 /**
-- 
2.51.2

