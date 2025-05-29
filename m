Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97523AC7759
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 06:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7063910E2B6;
	Thu, 29 May 2025 04:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X6EEoQGR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2082810E0DC;
 Thu, 29 May 2025 04:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748494510; x=1780030510;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UfBvVrr2TUoxdl7uhC4P6IetCT1G9UcK0kFsOLfzKeo=;
 b=X6EEoQGRRLWyDnVVqE9/LF/DtrfgSBr0LM8Xxp5xC+Nh5eUAq7LZ3bxF
 ZvfTlVJYvz3sdDVaeZiZnC05dTm8qrMLB2BumgikLRtfU1p/wdD7dReky
 wScPlKujm06h+bcwp86ai39CCvQ56ezeU63quz1LjxpivqDvVW+7BwNmo
 wIRGY/EoYI31LPSgTvfipQGCRuHILKrR5Nfa65HS7971yhFvlIEJpuC2I
 ZNdzI3O7YwDmF67JSJOIMQe9iyqJk4eSIfm2/h4zMw2udKZJw7l0E+QTj
 90qHX8Ibt/wqWJ7pcwwx7S2LHWdvZdmFMA2qHfv692x8c10+BWnvtauVN Q==;
X-CSE-ConnectionGUID: nNgqKGzAT2i25JVzYxmgdQ==
X-CSE-MsgGUID: EY2vMJbuTZ2V35t3O3o+zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61594671"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="61594671"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 21:55:10 -0700
X-CSE-ConnectionGUID: ay3SOL/RTnWUxCd8vvp/rA==
X-CSE-MsgGUID: L8U8OXF7RfSu2Bk94c0oNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="148736850"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 21:55:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 21:55:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 21:55:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.40)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 21:55:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMvWlOf/nRAr6ucTmdP1RQB4BKmZduwzHiHKo7KGaqXf8A7F3aJYJS2DI+Dvs3Cy4h707uM4fKhD2rRysl3zl3MHAEALoS1EseTSXwdnvCkXyhFAbDIf2fgsA7EAwwJAugzvznkR+ZK1TYquQ8bskL8bUfnl39n0lYSH3esr42tJ8LXd90LecbBerLgye9+mMMyxrhgmvAJo5ijQ209eGHRJqr8QVZD7RCjtRppZ2l/QB/bZEqZdOJJ3oliJs7ig7as65m5MtHG9qwAKAqCmfSUWjO/gtTEdHgCVXpb/qGMlf6g600U20/3dJM5z61V0SRsPZQc1qMLdbySFRCPPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UfBvVrr2TUoxdl7uhC4P6IetCT1G9UcK0kFsOLfzKeo=;
 b=AOJP6YNU5w6KSAboQjYLI77fCVkl+mpKD78WFquakLV2XX3Ysuscj1YxAyy52B6EnoaxobRTSm/EIxwOZtnN/fPGVGXqE9sAELSlJR5C3ATsYRnlbWJhyM7NV5PkOxJPSnINVglhZ8HTMXIss5l415VAHYQe0rt4XpL6owIqoMz2UiozjprK3bX9e10UPhScO3+YsGQxT1u1evifRTOSb2JvP/I/7mlcGCv3Y+NHTbh7vW2LPhcM18uf4uJFmT3vT0MREI0ZqHSpP05tewivPLC9IeYK1BqWK8Uyx5bJwTMEZcKlsa8SIzEkVB3UUrfuEEUn2k6N7dpHLBFENjs6rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB8248.namprd11.prod.outlook.com (2603:10b6:208:447::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 04:55:03 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 04:55:03 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Pierre-Eric
 Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>, Philipp Stanner
 <phasta@kernel.org>
Subject: RE: [PATCH] drm/xe: Fix NPD when saving default context
Thread-Topic: [PATCH] drm/xe: Fix NPD when saving default context
Thread-Index: AQHb0Bl6ol8qqjrFk0ObDrmolpqfFLPpCjhg
Date: Thu, 29 May 2025 04:55:03 +0000
Message-ID: <SJ1PR11MB6204E74753DAFAC2B34C8DCF8166A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250528-fix-sched-v1-1-c042ef23ff8b@intel.com>
In-Reply-To: <20250528-fix-sched-v1-1-c042ef23ff8b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB8248:EE_
x-ms-office365-filtering-correlation-id: 700b45ec-2c6f-4516-8c4b-08dd9e6cf957
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?aHJvNk9qaDFpVGFGRGlIVlJhK3NWYWZpcENjelRodHBQMmVhSlhHa25zTnVL?=
 =?utf-8?B?Qkp6Um5ObTc1b2VBTTI2OGpxK293SXdNZEFGb3krRFFLSE1sQWgzaVg5bTY3?=
 =?utf-8?B?N1ROcWxTSFl4RjBZQmJkTGROaWFmdE5aWlRQV2pYRllQSFlSdVJjMUl0OFhH?=
 =?utf-8?B?ajhKS2tidHJ4b3VYWWM3WnNxQ0dwbHY2RjgvdWJjN1NsNHNjNkVub3plazRy?=
 =?utf-8?B?dVE5ZDJRNDFucTV6NGx3ZEFIdmQwYzVwUEFxeWpXcWRjcGRpaGRiYmtNeE5B?=
 =?utf-8?B?RW9Fb21ZcFFlNmxXQytma1R6Q1BxL2xyYjhPV05FS0RlMVVOTVZTcGxqdHM0?=
 =?utf-8?B?S0EwV0MzVFdpZG5NVUpyUmw1TmFXZzFRb1J2bm5GTS9NZU1YclArRWtCdFZW?=
 =?utf-8?B?L1pVSEYzQ0l1QjNnYk82aVlQNWlqb0RObEdOQVVzK0RqQVVEMFlhZTliR0tq?=
 =?utf-8?B?V1FLZXdaZnNRY01pRlZlR05zVFBSZmlBWTBIYXA3NXIrUWltT0UyVmlFT2Nr?=
 =?utf-8?B?Y0FMSEFWQXIwQjFKK0s0SHNCTGFORUFCL0NpcmJoU0JPNTBtTUZVWUlMM29n?=
 =?utf-8?B?a3BxK0g1ODd1QWFKVmJaWVdOZHBsMHcyZUFpbXY5UGVKQ0YvTUJEUzd5Lzhx?=
 =?utf-8?B?aFdPa05kdkdzQ2UrYmZhMXFXNTdvTTRFZ3JZdWt0enpJeno0M1dvd1BPb25x?=
 =?utf-8?B?d1V6enRQRkgrM1V5aENZYkRmNEFXVndTb0x6Wk9sdXVMODR2Y1ZBbHlLQTJQ?=
 =?utf-8?B?ZXJ5dzhRd0s3Y2pUc0MyMjhhMmN1VjNlNHF4RmI1aHBTeE52UXJKOHdwYSs1?=
 =?utf-8?B?azBENTB3YjFJSkNIWEN2OVNJKzEzSUxkMVc2cjVjRjlZZCtXSHUvMVpzNTRx?=
 =?utf-8?B?MHhKTGtpaERsUit2VlZvWEk0M3pNa2QvOEZpenZ4THA2UkU5ZU03cUhJeFRj?=
 =?utf-8?B?elNvb2JmcEJXZ1MzVUZXM3ZkS293NW5EcXlJNDY4cjNuOU5LZWl5bktmUi9G?=
 =?utf-8?B?S2dZTTc1N1BqUGhvbEJzSzIyMDd3MWFtdk5pdUxEYVlMUVArV0dZVVgzNHoz?=
 =?utf-8?B?aVNDbkU2VGtOcU1zQzRZdkYrME85ektMY3RWL2Z5LzFkSENCYkFLenFhWERK?=
 =?utf-8?B?WXRvNFVPUTF2V1pUdHZvR1o5WXBzWlJPQk5BNEM2clNpTXFoenM0cW5BYkJF?=
 =?utf-8?B?cmJjbDM4eEo1NDdaTmEvbm1rMXd6NWVoMnVOaTZNSkZZM0ZKWWtkVmhOWUtr?=
 =?utf-8?B?bVN0K1dVaHJIazVtYnJOZDhUL1h2R0VHUFlwMnM2VkJIa0ExNkZYMTAyR0N2?=
 =?utf-8?B?WnB2TWFEUG1QRnR5NXU5TXpVM0kvMTdQS2JmdGJwMm1kR2JrcXRaVkFkajNu?=
 =?utf-8?B?V2NyZ0gvY2Q3ak5Qa1lUTzdObGxaL01lRmkxU090U0J1NUd0UnFPT2FVZ0JL?=
 =?utf-8?B?dXFRSFNqQW85aHVCTC9qUFNNUEs3WFlVOTkrbkg2d0ltZUFIeFhQamVLb29I?=
 =?utf-8?B?VUk5U3o3ZWhOQ2d2aXlzUTJTTXZGa0JJSmx5dFNtSTVlcndEZUNnZEJUb095?=
 =?utf-8?B?TE1zY1hwYWtKMUJxZ3NiRlE4RFQ4dzhwVmdVWlhmSGFqdWVqTnVsbUxOWkVO?=
 =?utf-8?B?amlXbHI3Y1o0MEVwWHpWUTNFVlM1WnBnK0UyK2F3cFBOa3N3OEM2eTRKWE9m?=
 =?utf-8?B?MXlTNFJKdTdKT0N6aW5Nc1RXNk00eHF2akIwUW1YaUxnMk5hYy96NkZOcWIv?=
 =?utf-8?B?cW91LzdLWWdzRWRmWHZLTERIWHB0ZnYrQlFTT2RMZDdrM3R2U0hoT0k3TXpT?=
 =?utf-8?B?Qk14cGRZbVl1MG5adlhFYk5BeHQvb1U4OHYyVXh6azh0cmtIZE1nYU1wbmR1?=
 =?utf-8?B?c2dmVTNHRUZ4Z042Z0gyQmQza1dnaEJwNzY1RmgvenpZbTN4eXVneUJ1TlIy?=
 =?utf-8?B?elFsZ2UrcGc3YzIrS2dDTUVMSGRLZS9tYnJHSVZuVlNmaU9WMmE0dHJJM2R2?=
 =?utf-8?Q?3JVx95UYD/n47jl7rsmWWxfTbLe08c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVlKVHRkQzBrZHBnaGtpRmI0WkZLYWdjeExHNGJqeTV3dWtUNHV5QVRPalBx?=
 =?utf-8?B?QUE0VVJLOUV3clRhemFpZkZ5QWxqVkQ1QWw5aHUrY2pKREh4VFROMEIyb1RX?=
 =?utf-8?B?Rk85WVRvTm1lWEd3UWpkNklqRzRiYXJ0R01BMVRIbmE3QnJ0T0NPYkZzOUI4?=
 =?utf-8?B?WThvK0I1dzk4U3dNazNhS1FiemtubkpUelp5azRCd0ltbGFLZ1crQU5lV1pT?=
 =?utf-8?B?MnQwdHhhWXBmUVBpM3RkWEMrVGJxdkVEdUNJcEFINzlUV09zUUplaC9KUGoy?=
 =?utf-8?B?YTZrTlBncGtaamJZT0xsbWt2ZDJNbEVjL2oyNDdtOVZFRkdUSGwzd3BneGw4?=
 =?utf-8?B?V0dQVUU4akVKUHFwTmdpUW1pb21JOWp3ZStlSEVCRjdkNjFpUm5HdTYvSkky?=
 =?utf-8?B?LzVKSUczMDBvenJSOGxLSndBT3J1Uk84cEdKL1NER082SW5XTStnZlVZZmhZ?=
 =?utf-8?B?ekxnem9aR2Rhay85NEQ1MG1KMFJzcnpJdHVQSE5oZk44blJCclpFUHZ3NlVq?=
 =?utf-8?B?UWYxWnpWMTJZcUdvbFJpY3pIblNhZ1Z4UlhsVHBlcjlhbDl4dVFSZEZ5WHpV?=
 =?utf-8?B?bTUvWDBqUi9uZzVjUEJyYVE2R2tiZmFHdTF1RlFSYzFPMHlRb2YwRTdqM2or?=
 =?utf-8?B?d3gycGFSbFFUL1ZyajBxdGNWQVdzZVh4dDBYM3N4V1I0WitzaHpKcjNvbk5k?=
 =?utf-8?B?SHh2Zjc5WmI4b2IzTDBTb1VqbExoSUZJUk5tK1dCOXU3U3lMZUU0RGlLV3ZR?=
 =?utf-8?B?VWxoTHlVSWlDdS9la2UyTkNxbktBM2ttRWNGS2locDVNSGZMR2NnRDR4VFY1?=
 =?utf-8?B?bUpFbFE5bGQ1b2xFV0RDdVhxcGxuQXVxNW5vWDhnaTdtcVcwZlJGaFdKT3Q2?=
 =?utf-8?B?TkVvdzhzaHpsRHM4NnZDdEVoMWVLeHRNQUtWREw0WEp5T3o4U0lmaGlsUUdr?=
 =?utf-8?B?dnVvMWhkQzJGSGYyUUs3NTcwK3E4VGYzRXF1cndKQ25xQkg4RjErc2JMY2dZ?=
 =?utf-8?B?bHBWVHBKUlFndTV0ZlZMNVVMUDQvc2M3N1JTZDNQUUMzS2RmUlEvaklnQTNW?=
 =?utf-8?B?ZTU1RUpWZGFwdUR1ZGVzZzl2eFpTN2JKQURobk1OQTdsV1g3eTUvcVBBUjZu?=
 =?utf-8?B?WWFIcjd5QURkTzRMODhSMy8wM0xCWVFpTXNvZkZNNFd3aUpmanJmWXRmeis0?=
 =?utf-8?B?RDc2bDQzKzVnc3dPRG5vUUFRaXcxdWtxaEhUKzQrSnI5d1N6MEFoc0p2VW4x?=
 =?utf-8?B?aDhUeUN2OXZ0SE1EeUhXR0tRaU5FNnNkV3hmNFpXS3hUdFVqM2ZTWUhBQlYy?=
 =?utf-8?B?SlBFaW9qR0NEMmRXNFN2bWh2UkZDVS9WU2tvWXBqY0p0UTBxd2luN3RDNzJz?=
 =?utf-8?B?UmQ5VmtYU2FTVGJjT1dFbGo0MC9RTVpnV3F0WWFoSS9tVmxjd1R2VUpLbFVy?=
 =?utf-8?B?MTZ3QVRpbDczOE9TTHVZL3Z6ekRkdEkwMTcwZ3ZTZmE5M0EzMUlOd3E0SWFj?=
 =?utf-8?B?RzJpSlhPWDZCQW5WanNEZjdjMU5WUFRXdXR6RWxwZU8yWTBzcmIxdXZ5enBT?=
 =?utf-8?B?ZWllOFRzZnhyYU9sVHFJNUtobXVMUUJJMTJVa0QzbDBXRUo1L0NIakZsRlZJ?=
 =?utf-8?B?MDR6d0pBSGRTN3NQSEtHNEdmc3IyZkFOTlo1Y1QxQkZXdWdmM1F0NVphVFZ1?=
 =?utf-8?B?M05SVEpKYU0xT0w2YkkvQXE5bmhEN0lKUE50TzNhenZQbmR2RmNzbzhnVTMx?=
 =?utf-8?B?SDlVRUN3UzF0Tkk1VXBpdTRvdnRjNHNSUS9xVThWNFNEVXkzZGZhQVEyeUk5?=
 =?utf-8?B?bW9ULzJub2xnV0Vzc1FMN2FmSkFib3ovU1ZLSWNYL0JNaGhjRmp5ZjdNcjIr?=
 =?utf-8?B?M3EwY1ZrNERCZE1KdVZhTXhrQmQ1cm9ZTDdYZTRwMW9Edy9RSWN3TTdIb1V4?=
 =?utf-8?B?c3MvQ293MWMxV3lQQkVzcCtQdUJIb202ZWc1aWdETkgxTzZJRzVKRFRlbGtU?=
 =?utf-8?B?TkR1L0RUVlpSM1VLQzJYZG01b2lXM1NpQjN3eEZwMlRGK0V2bnhidzhtR203?=
 =?utf-8?B?NXZxVExBeG82VHV6c29BRFNKWkF2QkhGU1hZMWVuSmlnNCs0NGppNE1YZThB?=
 =?utf-8?Q?HBqiFp8huJxMNdSaExFK3/e+q?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 700b45ec-2c6f-4516-8c4b-08dd9e6cf957
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2025 04:55:03.3269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MF0LswbHBPbhc1957DtcloQiYu+roSLzC/1x0H+tmKKZScryI9YyEvj/38MeMhJputuUJFC4zUAJMihnKwNnUp/46ZKK3dxcXfD7QjZ+nis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8248
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTHVjYXMNCj4g
RGUgTWFyY2hpDQo+IFNlbnQ6IDI5IE1heSAyMDI1IDAzOjEyDQo+IFRvOiBpbnRlbC14ZUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGlu
dGVsLmNvbT47IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEZSBNYXJjaGks
IEx1Y2FzIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+Ow0KPiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+OyBQaWVycmUtRXJpYyBQZWxsb3V4LVByYXllcg0KPiA8
cGllcnJlLWVyaWMucGVsbG91eC1wcmF5ZXJAYW1kLmNvbT47IFBoaWxpcHAgU3Rhbm5lcg0KPiA8
cGhhc3RhQGtlcm5lbC5vcmc+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL3hlOiBGaXggTlBEIHdo
ZW4gc2F2aW5nIGRlZmF1bHQgY29udGV4dA0KPiANCj4geGVmIGlzIG9ubHkgdmFsaWQgaWYgaXQn
cyBhIGpvYiBmcm9tIHVzZXJzcGFjZS4gIEZvciBpbi1rZXJuZWwgam9icyBpdCBjYXVzZXMgYSBO
UEQNCj4gbGlrZSBiZWxvdzoNCj4gDQo+ICAgICAgICAgPDQ+IFtdIFJJUDogMDAxMDp4ZV9zY2hl
ZF9qb2JfY3JlYXRlKzB4YmQvMHgzOTAgW3hlXQ0KPiAJLi4uDQo+ICAgICAgICAgPDQ+IFtdIENh
bGwgVHJhY2U6DQo+ICAgICAgICAgPDQ+IFtdICA8VEFTSz4NCj4gICAgICAgICA8ND4gW10gIF9f
eGVfYmJfY3JlYXRlX2pvYisweGEyLzB4MjQwIFt4ZV0NCj4gICAgICAgICA8ND4gW10gID8gZmlu
ZF9oZWxkX2xvY2srMHgzMS8weDkwDQo+ICAgICAgICAgPDQ+IFtdICA/IHhhX2ZpbmRfYWZ0ZXIr
MHgxMmMvMHgyNTANCj4gICAgICAgICA8ND4gW10gIHhlX2JiX2NyZWF0ZV9qb2IrMHg2ZS8weDM4
MCBbeGVdDQo+ICAgICAgICAgPDQ+IFtdICA/IHhhX2ZpbmRfYWZ0ZXIrMHgxMzYvMHgyNTANCj4g
ICAgICAgICA8ND4gW10gID8gX19kcm1fZGV2X2RiZysweDdkLzB4YjANCj4gICAgICAgICA8ND4g
W10gIHhlX2d0X3JlY29yZF9kZWZhdWx0X2xyY3MrMHg1NDIvMHhiMDAgW3hlXQ0KPiANCj4gU2lu
Y2UgZHJtX2ZpbGUgc3RhcnRzIHdpdGggMSBmb3IgdGhlIHVuaXF1ZSBpZCwganVzdCB1c2UgMCBm
b3IgdGhlIGluLWtlcm5lbCBqb2JzLg0KPiANCj4gRml4ZXM6IDI5NTY1NTQ4MjNjZSAoImRybS9z
Y2hlZDogU3RvcmUgdGhlIGRybSBjbGllbnRfaWQgaW4NCj4gZHJtX3NjaGVkX2ZlbmNlIikNCj4g
Q2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gQ2M6IFBp
ZXJyZS1FcmljIFBlbGxvdXgtUHJheWVyIDxwaWVycmUtZXJpYy5wZWxsb3V4LXByYXllckBhbWQu
Y29tPg0KPiBDYzogUGhpbGlwcCBTdGFubmVyIDxwaGFzdGFAa2VybmVsLm9yZz4NCj4gU2lnbmVk
LW9mZi1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3NjaGVkX2pvYi5jIHwgMiArLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3NjaGVkX2pvYi5jDQo+IGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3NjaGVkX2pvYi5jDQo+IGluZGV4IDU5MjEyOTNiMjVkYjMuLmQyMWJmOGYyNjk2NDAg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zY2hlZF9qb2IuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfc2NoZWRfam9iLmMNCj4gQEAgLTExNCw3ICsxMTQsNyBA
QCBzdHJ1Y3QgeGVfc2NoZWRfam9iICp4ZV9zY2hlZF9qb2JfY3JlYXRlKHN0cnVjdA0KPiB4ZV9l
eGVjX3F1ZXVlICpxLA0KPiAgCXhlX2V4ZWNfcXVldWVfZ2V0KGpvYi0+cSk7DQo+IA0KPiAgCWVy
ciA9IGRybV9zY2hlZF9qb2JfaW5pdCgmam9iLT5kcm0sIHEtPmVudGl0eSwgMSwgTlVMTCwNCj4g
LQkJCQkgcS0+eGVmLT5kcm0tPmNsaWVudF9pZCk7DQo+ICsJCQkJIHEtPnhlZiA/IHEtPnhlZi0+
ZHJtLT5jbGllbnRfaWQgOiAwKTsNCg0KZHJtX3NjaGVkX2pvYl9pbml0KCkgaGFzIG9ubHkgNCBh
cmdzIQ0KDQpUZWphcw0KDQo+ICAJaWYgKGVycikNCj4gIAkJZ290byBlcnJfZnJlZTsNCj4gDQo+
IA0KPiANCg0K
