Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D20A7BFE644
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 00:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB1C10E85C;
	Wed, 22 Oct 2025 22:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCpAMJS3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0799210E85A;
 Wed, 22 Oct 2025 22:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761171509; x=1792707509;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CntCF4CfxFuuLyLDIRZlw2YtGrWbYwAPfY82d3XD9NI=;
 b=bCpAMJS35fSJGnne9kfJO1il6Znxpy06wWy6Lv2YvYeQpOiSOsqEhJpn
 71ACbwRJ+0yN78wGXyYbyHXHgxNyA8dKPt5BeUSe1trL78kKx5SntV2CJ
 orQ7lwuIpZftlIQTxUv9Vz875PG0w5RwFSyE1WwdI8LkiZBJRm5/iJAjX
 h5KKF6R/1FTWWIBAPmJQnqBqkH+NF0GkdzccgNSJx4UWWcis4EfZKHhcl
 14NI3Q0+jAKIPpIS/whjXCRkNLb/h5bbUPog1C7jL535HDnenPuc9oWXP
 RUx3uYAIVcvINsNq+uspc4gI/PpgwqR5UQNgxODaIKWI8lWSCqT5OIPAw g==;
X-CSE-ConnectionGUID: jK+PgvV5TwubGZiPAKZf/Q==
X-CSE-MsgGUID: pVH8FDZyRqyV6WAlvhgTdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66975279"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="66975279"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 15:18:28 -0700
X-CSE-ConnectionGUID: 6vzxPjfdSXGXPNlRLRSjxg==
X-CSE-MsgGUID: b3zMgOUpSz+ptO2O+cLyZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="183690851"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 15:18:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 15:18:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 15:18:18 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 15:18:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laV+xaJeo2qTOAfdVrgM+Hx7e6zuiZzJfoy4IQQ+v0v3GBxQAOLs7GUh2jSFUUryu0QC5qIMXV4UOuiz6Vr1lF0f3AaufqwfxmH239tZEA8PTjP/jImNxpoQ8L6OYvmqPy3bvcai7K7MISBUpjfLHHIveTgNMQ9Ed1PzobjRxExn8/l+HdXw6YLnB96P7xO8YdjYOTxrnxLMfZbH2GZsYGvkrdhoae3UBzNENk5aqKGLk04LLss0tMRqrN4QCf1l4zEiMKhma0xxBW2Uhx8Zx9CdC4ucsmL6fVAnvi/gbFDGuJ0h6RaSs2BFw1/+PJxYwQPbUKw9xrLhDVDafLkGkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WViLKjgj1rq+r2Lf+n3/mcRemI8Aa6VC4cDDxOxFOtY=;
 b=TScuhp72peAIVvOn/93uk+f5ntGphqMQJNH3MxZBFnQZ998vCwwW3pEuaEBlZ2UB0h76Qz4scw8+ABk2H50kaGGZoCqJtc8sxvVzER2oMAywZbRZkiif+3yTpR2nHr0KwNp+1fnk6jmkll1A9su8FhM+KoDV8w4uuyQpYXYX7ABYAJZ0omGpyAuN4xkP7+aPDDvor1M6kBoAwdOaBj7te11LzfE/Blx8RM3RARl47nze3Xg370kP54ofhnq/JPjwsHl5tHjbh4fcadieTlBiL48ICvBNgC5zWzReQcFrhJKHosGFzV7GIYQiWVTWGCqWyKvdCKCjBrs5HyVafr9RWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM3PPF1CFCD9AEC.namprd11.prod.outlook.com (2603:10b6:f:fc00::f11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 22:18:15 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 22:18:15 +0000
Message-ID: <830ac907-684d-439e-9612-e8d2f32d97b6@intel.com>
Date: Thu, 23 Oct 2025 00:18:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/26] drm/xe/pf: Add helpers for migration data
 allocation / free
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
 <20251021224133.577765-6-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251021224133.577765-6-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::8) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM3PPF1CFCD9AEC:EE_
X-MS-Office365-Filtering-Correlation-Id: 3757a69c-9c6b-46f9-9def-08de11b8e574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjdwaUZ4eEc1NkpETzR1V01oTnFWbU00elV3ZXVrejFEeVhjd1dDbUVPVWk3?=
 =?utf-8?B?ZGNMTzZSSG5VVlhRbWpPSlJwWUEzc3d3Z0JBK3ltNzVOaURWdnIvUmF3aXFO?=
 =?utf-8?B?c211VWxGcm5aYklac0VCZkFKUGdsVWNtd2pNdy9SM24zZElDNk9PSFFpK0VC?=
 =?utf-8?B?clFEcTcrT2l1d1dRcXdJWVNTWXhsSjdrK1JUZVR0VzZNam9WL3RoYis2d1hD?=
 =?utf-8?B?V2FnZ25VSTI1MVZseFdMS2JmbDRac3AzYTYzL2J0NHpDckU0V1p0b2k1Mjhn?=
 =?utf-8?B?bmlobWZuTnVEb1J0cmJTRVZvb3VWdXlPY2tobW9CKzZqV3JncFVCOEVXa05m?=
 =?utf-8?B?VTY0WUxMaGI3K1hvZVJ0VHdDMTRGSGdkSGlsd3VCNlNwVGlmc1ZlVzRsM0NI?=
 =?utf-8?B?UUxLUXVuVWJ2d3VhZ3VZMDIrTWM3Tnp5UnJ1RVFmZ05aV3pUK0tRY0lhaHMw?=
 =?utf-8?B?TGtnZFNLV2pMM0JmS0tXNmhkSHJvQlU4Z2JjenNYNGplTjN3cFZTQTljZTF6?=
 =?utf-8?B?clJtanU4YTZtZ0NmMC9maXYyQklQUnJLQjArdllsZ3Zmei82R0FTd044dTBE?=
 =?utf-8?B?RkVVb3dCU3luN081N3dzdGRjcFkrWXRZa2crbnMyZjZKbHRLUFlhdFl5UEhh?=
 =?utf-8?B?YjVLUFEwejVqY0taN2pKUnh5ZUFZQW95TVF0Rm5uakp5Z2w2cVpBV2hjK3hH?=
 =?utf-8?B?dFFaVGN6VWg2MHBRaG13UnBBY2NUM0NSV3dDUWJLaFFSeVd2OXJwdFhJWEJw?=
 =?utf-8?B?T3hEWW9oeXN3UHJBbW53N0pJRXBkZ0JZNUpqNE9pZEorcHdFR3VOYlBhTlQ4?=
 =?utf-8?B?TmNjVHFaNFVDeUlJWElJR0xPQncwRi9vQVNETWNNTEZ0d0Rlckx4ODIxN2FQ?=
 =?utf-8?B?Y1pkTTJTTWlUdm00MlgrRm96WFdmZjBUZ1ZrY0wrMStRdVRiVnRTb0ltbTZi?=
 =?utf-8?B?U3oxa3pyU0xWTm5MazV5dUUrdHphbDJBdWFxTXBoU21GRXdCVG9UaThLRWpX?=
 =?utf-8?B?SGdlNVZPVXVHWWNkMStOY1JuN0g1VkMxVXYwMGpjV0lUU0NCY0pJZ1BWNWR3?=
 =?utf-8?B?ZjBNdDcxMFUvT1EyOHAwRTloY2oyV3k1N2Z6Q1BaQTRsZ0hIVkFOb3UxS3pF?=
 =?utf-8?B?V25HZE9Rays0Ym5DbTliVyswWTVvYkhuQ3JXZko0VzBmWlh3dG10RjJGMkFa?=
 =?utf-8?B?bFI0RzZJL05PL054TUlQaGM0WnlBV2llcFZYOHgvS3ZQRHIwMFV2cWxPa3JJ?=
 =?utf-8?B?RGdmUEJaVVhiVk42cXB2cjFkYkNHNGphOEdyWWxnaEpjbW9LR2t1MThKLzJ0?=
 =?utf-8?B?U3IwWkxzVHczV3NhcC84bGN0dG1GbUxuM25wMTIvNDB1UEVZUzZQM2k4b2l2?=
 =?utf-8?B?WTFmNm5hQ2k4MGtOU3JFcFg3Vms2bUNBVGNwYUtYK3NETXV5ZGIzNVBQOUhO?=
 =?utf-8?B?clBVZ1pGKzVUQTA5dExLSkgrN2VVYzlSWjNXTGwzcGpBVkpSL2lYN2JVZ0Ni?=
 =?utf-8?B?TlhXM243YTJVKzA5ZnVpRzNCWU1Jd3Q0WUlJNWg5UGswOFVNZSs0ZXh5dTZV?=
 =?utf-8?B?K0h0cHNkMDRBQWk0M0oyT01VNm1jTjR6anVOLzYyQ0NUVHRpZW9maC9peUMy?=
 =?utf-8?B?enVhTGMyTzMwbmEvWmFxaWJSMkd1YTA3OGwwMkFvMUt6WmxuSjRKSzFZVlB1?=
 =?utf-8?B?cjRwalM1bHU3VDJrUWNtY1gvU0lWR1U3SktHTU9GTXZNeGpKTlNncXdGVVpu?=
 =?utf-8?B?VTNEWjRyLzIvK1hDbzZ1SDQ3bVBjd3lVQVAwS1BIejlIVGJtdE1uQ1daa052?=
 =?utf-8?B?UjJMVWVqRmpLSmI3Zzc1eWpGaFMrYjllYnlXaEowNTduV2hyOTdMOWRZZ2Zl?=
 =?utf-8?B?ZzRUMjJza1BISC80YWd2VlVBZERvOUJ4YUF6OXBORWhyRzJRd3JFNU4ySDgr?=
 =?utf-8?B?M1Q2M0lCTFFIUzVCc2w5UUN3emMxOXUxTk9mNVR1dFN3TG1JblhPamphNjZs?=
 =?utf-8?Q?8O1/GDs4fveH5xp1TNSesiUklLLHvo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDlhVXQ4aVROdGFCckFVd09oRkVEZ0ZQY2VCd1haQUM5aWVQeVQ5WitEYVE5?=
 =?utf-8?B?N0ZJcHhUemtjY3lYbzJQdi9UUDFVODB6N2o2b3NHQTE3a2tZTUw5NngwY1lj?=
 =?utf-8?B?YmhKQUpDbnpqU2ZEN2VyQ0YxMW1FY0pabWcrbFBTQWVkMEpZZFZtTjBzdmdB?=
 =?utf-8?B?VWFPZ3V5V0dEb01iWGhPYjNxNXFYamM0NWM5b3FYVWh3bmIwNEk2Q05hdmdi?=
 =?utf-8?B?bWtPWFFmVSt5TkxidmpTUVZYVzNJWlpOQUgyYmgyb3NnUUtVVHJCNWx0MEJo?=
 =?utf-8?B?bm1VVUpKa2E3YllwWHRDNE5CRnJvZS9najQ3em9BZmk4ZWM1UmtkQlRrUFFk?=
 =?utf-8?B?VXc2SFFmNksyWmlGSTZDQzlNa29Da3RMTTB4ejduUzk1ckE4ZnEzSVY4NXlJ?=
 =?utf-8?B?U056WDRMcUlnbG9GdEh1aWdVMjE0YzdSaHpjODFmNVNDdjNiVGMwZDNWUlV4?=
 =?utf-8?B?cGI4Q3ova09mcW9heDU0SzlwRWJDQjF6TWxmd3FGZGJqT0tqdHRBRk9IbjYz?=
 =?utf-8?B?ZlF3NkhlNGZLaEp4UXRrVGpDbG90RzBabEZISkNUOWVaVmI5SGw0QWpSZU5w?=
 =?utf-8?B?YTV2UXJ1ZzJ4YkJVRjBNT2d4Njh4NXRvaVNUQ1pRaURnYkNUOVJFeFdLamZj?=
 =?utf-8?B?UkhubGVFa3RUTUZDeVVaeDFzWW5NdkZVdkxocjk3dkRSakRsdldIWWlLRVNt?=
 =?utf-8?B?Qms2cmVWcUJKK3YwN3FNQnRUZzBqa1VSRVEyR0g5bVFReXNuQ3U1bDhJMDM1?=
 =?utf-8?B?UFRFaWhSWE9OazVxZkk4Sm43UDNxcFJ3N095WUV6SHBZNDlleGdDSDQzYWJp?=
 =?utf-8?B?VVMzd0pBNCsyTnlDRURtMzVwbW5sRGpRSGQyTXZSbSt3T0tWa3JpRlFKY2tu?=
 =?utf-8?B?REZEK0YxNElUbEpJcHZuV0VZS241TXVCT0lnL3NtMHJxUWNaL0M1T1c1T2kv?=
 =?utf-8?B?SXNtdk9qU2pkb3dDaXlXOTN0a0lrNDJBWCttTnlWZFJEVU1hdXJTZTJjN3h2?=
 =?utf-8?B?QlZyTEN6Njd6TGprLytkbmxBeDZxU0FDc28xcDZKR0xVQmM0anlmTUUzM3Zs?=
 =?utf-8?B?OVBnUHNFUXM0bG8wQjJEWEhHS3lsLzFZNHJEWFIrb2drWlVSaHhKMFpIa0lH?=
 =?utf-8?B?MCtIUGRLZjZDSk9hWkczZDU4U0RzNHd3ZnY2V09ZbTVGK3hMQW93TFZLRGFL?=
 =?utf-8?B?WVR1aFd5YzdlMThOcHY1NFhJR1VoYTJUUTJSdGJjb3BFRkU0bGkrWkFaM2Zx?=
 =?utf-8?B?UkVQZGd4Ny8zL0ZnenQzSER1YkNlN0dBTUREYVFzM0JUK1U3SStadG0xbFZI?=
 =?utf-8?B?ZHZVVEVVbEZ0ZTluUmJUYllJZUVuYVpMSXdpR1Uzb0xZdWtIN3AxbWFFbGNT?=
 =?utf-8?B?NWhuOEIzYUs0NVBqNm9FaE9xSWI4aGtvS2pwdkpjTGtqbW8xL0EvaHlpbjR3?=
 =?utf-8?B?d2toS2tKOWt1bTlIbTBqNTY2R3p4eG15YkMyT0VWZEdqT29HNGJUK253bG5F?=
 =?utf-8?B?ZkdRWFhnaEhhdlpIWmt5ckVpU1JUZVRjRHl4aVI4aWxXT0d5ZGg4bTY2TTRk?=
 =?utf-8?B?UXhPdm9CTG9tc0ZFdGRWMDM2ZSszSXFKbk5LNFpvOWpqaGR1RWtlMUtPMjFV?=
 =?utf-8?B?QmxKNC9GYXVhU3gzOHpkWVBpckcwREMxWDdSekMrbCtUTS9FZmFzTGJLMG5T?=
 =?utf-8?B?MVJIR0ZoMVNCZWZjb0NqN011NkVXS2ZvYTd1M2wwOE92ejJDTG5YdXZ5dUlq?=
 =?utf-8?B?YnV1azRId21IeFVyb1Y0a2NoZDdwVEM1OU4yMThOWXVqNno4YUFzSkN0anl1?=
 =?utf-8?B?WGV6MXJLaWZRZDM4a3AvT1NHWUtJOW1hOW85QTg0MUdhY2NUbHk2bnpnZlhI?=
 =?utf-8?B?a3V0YmpSMjBGc0xqZVY4K05TMjBmTFZkVmNnN0s1aW9Dc0sxdmJpNnRQZlhG?=
 =?utf-8?B?Y3hBbWMvOHg2UXVEbGNGZjJlaHEydkJXWjlZTDQyRjBibFozWkE5ZEY0bjZZ?=
 =?utf-8?B?MDI2WUhEWHNOZzVGMGYrUUwxZFY3MzY5R2dwUjBGT3VHR3prcy9sRWRzOW5Q?=
 =?utf-8?B?aHN6NWMzWEs1MUJHMDNJaWU5WVoraWhiazRWZk1LWGRmaFBTSVZxL0huNlla?=
 =?utf-8?B?Nko3TFR5WUVuY0l4N0UyRUJxd09oM05DdmpmVnNzekQwdGFlUytFbVdpbUM4?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3757a69c-9c6b-46f9-9def-08de11b8e574
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 22:18:15.6947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fvux9+NPT+IwIx2gyMDVKdh91xzPBF+ySIBYFcWg/7jiRhUCosHMyvNBma+/WNIEUuvMeWmNRqdpGnWDEbYVS1SRHOBO7lw2g2Sr7Pk4v0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1CFCD9AEC
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
> Now that it's possible to free the packets - connect the restore
> handling logic with the ring.
> The helpers will also be used in upcoming changes that will start producing
> migration data packets.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |   7 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  29 +++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   1 +
>  drivers/gpu/drm/xe/xe_sriov_migration_data.c  | 127 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_migration_data.h  |  31 +++++
>  6 files changed, 195 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_migration_data.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_migration_data.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 89e5b26c27975..3d72db9e528e4 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -173,6 +173,7 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_lmtt_2l.o \
>  	xe_lmtt_ml.o \
>  	xe_pci_sriov.o \
> +	xe_sriov_migration_data.o \
>  	xe_sriov_pf.o \
>  	xe_sriov_pf_control.o \
>  	xe_sriov_pf_debugfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index cad73fdaee93c..dd9bc9c99f78c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -18,6 +18,7 @@
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_guc_ct.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_migration_data.h"
>  #include "xe_sriov_pf_control.h"
>  #include "xe_sriov_pf_migration.h"
>  #include "xe_sriov_pf_service.h"
> @@ -851,6 +852,8 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
>  static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  {
>  	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> +		xe_gt_sriov_pf_migration_ring_free(gt, vfid);
> +
>  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
>  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
>  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> @@ -1045,6 +1048,8 @@ int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
>  static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
>  {
>  	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> +		xe_gt_sriov_pf_migration_ring_free(gt, vfid);
> +
>  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
>  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
>  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE);
> @@ -1078,6 +1083,8 @@ pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
>  
>  	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
>  
> +	xe_sriov_migration_data_free(data);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index b6ffd982d6007..8ba72165759b3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -14,6 +14,7 @@
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_migration_data.h"
>  #include "xe_sriov_pf_migration.h"
>  
>  #define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
> @@ -418,6 +419,25 @@ bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid)
>  	return ptr_ring_full(&pf_pick_gt_migration(gt, vfid)->ring);
>  }
>  
> +/**
> + * xe_gt_sriov_pf_migration_ring_free() - Consume and free all data in migration ring
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + */
> +void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> +	struct xe_sriov_migration_data *data;
> +
> +	if (ptr_ring_empty(&migration->ring))
> +		return;
> +
> +	xe_gt_sriov_notice(gt, "VF%u unprocessed migration data left in the ring!\n", vfid);
> +
> +	while ((data = ptr_ring_consume(&migration->ring)))
> +		xe_sriov_migration_data_free(data);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
>   * @gt: the &xe_gt
> @@ -543,11 +563,18 @@ xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
>  	return ERR_PTR(-EAGAIN);
>  }
>  
> +static void pf_mig_data_destroy(void *ptr)
> +{
> +	struct xe_sriov_migration_data *data = ptr;
> +
> +	xe_sriov_migration_data_free(data);
> +}
> +
>  static void action_ring_cleanup(struct drm_device *dev, void *arg)
>  {
>  	struct ptr_ring *r = arg;
>  
> -	ptr_ring_cleanup(r, NULL);
> +	ptr_ring_cleanup(r, pf_mig_data_destroy);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index 9e67f18ded205..1ed2248f0a17e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -17,6 +17,7 @@ int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vf
>  
>  bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
>  bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
> +void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid);
>  
>  int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
>  					  struct xe_sriov_migration_data *data);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> new file mode 100644
> index 0000000000000..b04f9be3b7fed
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_bo.h"
> +#include "xe_device.h"
> +#include "xe_sriov_migration_data.h"
> +
> +static bool data_needs_bo(struct xe_sriov_migration_data *data)
> +{
> +	return data->type == XE_SRIOV_MIGRATION_DATA_TYPE_VRAM;
> +}
> +
> +/**
> + * xe_sriov_migration_data() - Allocate migration data packet
> + * @xe: the &xe_device
> + *
> + * Only allocates the "outer" structure, without initializing the migration
> + * data backing storage.
> + *
> + * Return: Pointer to &xe_sriov_migration_data on success,
> + *         NULL in case of error.
> + */
> +struct xe_sriov_migration_data *

no line split

> +xe_sriov_migration_data_alloc(struct xe_device *xe)
> +{
> +	struct xe_sriov_migration_data *data;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return NULL;
> +
> +	data->xe = xe;
> +	data->hdr_remaining = sizeof(data->hdr);
> +
> +	return data;
> +}
> +
> +/**
> + * xe_sriov_migration_data_free() - Free migration data packet.
> + * @data: the &xe_sriov_migration_data packet
> + */
> +void xe_sriov_migration_data_free(struct xe_sriov_migration_data *data)
> +{
> +	if (data_needs_bo(data))
> +		xe_bo_unpin_map_no_vm(data->bo);
> +	else
> +		kvfree(data->buff);
> +
> +	kfree(data);
> +}
> +
> +static int mig_data_init(struct xe_sriov_migration_data *data)
> +{
> +	struct xe_gt *gt = xe_device_get_gt(data->xe, data->gt);
> +
> +	if (data->size == 0)
> +		return 0;
> +
> +	if (data_needs_bo(data)) {

		struct xe_bo *bo;
then
		bo = ...

so will not have that long line

> +		struct xe_bo *bo = xe_bo_create_pin_map_novm(data->xe, gt->tile,
> +							     PAGE_ALIGN(data->size),
> +							     ttm_bo_type_kernel,
> +							     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED,
> +							     false);
> +		if (IS_ERR(bo))
> +			return PTR_ERR(bo);
> +
> +		data->bo = bo;
> +		data->vaddr = bo->vmap.vaddr;
> +	} else {
> +		void *buff = kvzalloc(data->size, GFP_KERNEL);
> +
> +		if (!buff)
> +			return -ENOMEM;
> +
> +		data->buff = buff;
> +		data->vaddr = buff;
> +	}
> +
> +	return 0;
> +}
> +
> +#define XE_SRIOV_MIGRATION_DATA_SUPPORTED_VERSION 1
> +/**
> + * xe_sriov_migration_data_init() - Initialize the migration data header and backing storage.
> + * @data: the &xe_sriov_migration_data packet
> + * @tile_id: tile identifier
> + * @gt_id: GT identifier
> + * @type: &xe_sriov_migration_data_type
> + * @offset: offset of data packet payload (within wider resource)
> + * @size: size of data packet payload
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_migration_data_init(struct xe_sriov_migration_data *data, u8 tile_id, u8 gt_id,
> +				 enum xe_sriov_migration_data_type type, loff_t offset, size_t size)
> +{
> +	data->version = XE_SRIOV_MIGRATION_DATA_SUPPORTED_VERSION;
> +	data->type = type;
> +	data->tile = tile_id;
> +	data->gt = gt_id;
> +	data->offset = offset;
> +	data->size = size;
> +	data->remaining = size;
> +
> +	return mig_data_init(data);
> +}
> +
> +/**
> + * xe_sriov_migration_data_init() - Initialize the migration data backing storage based on header.
> + * @data: the &xe_sriov_migration_data packet
> + *
> + * Header data is expected to be filled prior to calling this function.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_migration_data_init_from_hdr(struct xe_sriov_migration_data *data)
> +{
> +	if (data->version != XE_SRIOV_MIGRATION_DATA_SUPPORTED_VERSION)
> +		return -EINVAL;
> +
> +	data->remaining = data->size;
> +
> +	return mig_data_init(data);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> new file mode 100644
> index 0000000000000..ef65dccddc035
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_MIGRATION_DATA_H_
> +#define _XE_SRIOV_MIGRATION_DATA_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +
> +enum xe_sriov_migration_data_type {
> +	/* Skipping 0 to catch uninitialized data */
> +	XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR = 1,
> +	XE_SRIOV_MIGRATION_DATA_TYPE_TRAILER,
> +	XE_SRIOV_MIGRATION_DATA_TYPE_GGTT,
> +	XE_SRIOV_MIGRATION_DATA_TYPE_MMIO,
> +	XE_SRIOV_MIGRATION_DATA_TYPE_GUC,
> +	XE_SRIOV_MIGRATION_DATA_TYPE_VRAM,
> +};
> +
> +struct xe_sriov_migration_data *

no need for line split here
> +xe_sriov_migration_data_alloc(struct xe_device *xe);
> +void xe_sriov_migration_data_free(struct xe_sriov_migration_data *snapshot);
> +
> +int xe_sriov_migration_data_init(struct xe_sriov_migration_data *data, u8 tile_id, u8 gt_id,
> +				 enum xe_sriov_migration_data_type, loff_t offset, size_t size);
> +int xe_sriov_migration_data_init_from_hdr(struct xe_sriov_migration_data *snapshot);
> +
> +#endif

just few nits, otherwise LGTM

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

