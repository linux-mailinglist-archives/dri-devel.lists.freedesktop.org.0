Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IlDMoeonGklJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:20:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC4517C485
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54D810E440;
	Mon, 23 Feb 2026 19:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n5/xafyn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330C610E42F;
 Mon, 23 Feb 2026 19:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771874436; x=1803410436;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Clvt1uB/stM28d1qK4Rlfmnf823uth9Q3T8HiplX/vk=;
 b=n5/xafynaSPSaxaIQXQfOi/eRUAP55JVJBbB0nVBSwmR6tbWqVj1d7bF
 iuiZeFnWsRL+3a7rS/retwZigButeGJRRSP/QXcMlSsV8wKnUUAqcFNOx
 LstJOmCyL+ALSNs7qT/oHT86wrN4Izhfg/x4wnTBkPCmjA1OhAdHVc5t/
 uQbCOdJhn4iwENAyxkRtx7KduNkprgleWWolw/F67xdjdWrsbhbAqahHz
 u7nwzS1RhK9Io3yK65bMi+/X9lSdogszSZeUJjzYJcZlFIbWuIJa6FWyV
 YLa21/63daE8T5P6nPdhL8aVSZz4fPYmoNWxxNl2Vm12trDPtPtphLRqY g==;
X-CSE-ConnectionGUID: cqoUS35rTmS5P8qVYh//2A==
X-CSE-MsgGUID: WHm1Z4gSQkC8HymTyPkt7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72981545"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72981545"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 11:20:36 -0800
X-CSE-ConnectionGUID: nBHrHnFwQHihHnIy/F7pOg==
X-CSE-MsgGUID: 0k9BSQdKR9KVTPrvegU2eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="238621123"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 11:20:36 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 11:20:35 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 11:20:35 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 11:20:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bsOLacEEvWODaLN50tP+voVql/d92s/ycSp2riw23EnTp3tMlFLiUfOOsOxwRqrc/ziX9Zfiu8mi0bWomY7QdTDE/EwPyIrALXzIgVXzQhcWtSFakKRF/V49FwmEPpEIAmOpMZ/yvz1McGUIrKrjcMmUwy+yAJ/SL4sLLDkN6WCpQeCZQl6mJUnMqLBzpcnDmnWcDj1Fj2MXcJaBFKDb6emngnA+uAmbOd9X7VYZif5k6Uokx99cr5KZTjxgKP6v8ftFJaYpBbuf07s0O1X2YczxBRBaF5jYGzwTx9Sr/LjW4XYuMlW5LvZPBcyCrWqdZP9qJt/g+JrQ49KH50pWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThalbKn7V8ru9Asel/XHnx4avFMvqLKryBehs4BHdh8=;
 b=PWDLQGA1wl2nqw1ld+32YDldxVwBYspCzRXcB5nMtXnKF/adHbbyO5UvylG5MNFkq+rd/iZzZiuh3JBBJgczxCTvsDIspnfyyMGxYiDIXOcIFbTrOMvgN/PfesrHaIegEAaBpTZ46RcdTntZtvQUrKUaTYzvRcnUo0esIeq6cmRVZC48z1TjDSdd/zwewB20T2OBrTWmQA1TgAMrh+rJt7G8uTvnYAlMp32d57FSa2valVnEefyRokYGN8vuFxCY7f5eBzG47m9n/AD1AErAQCqqmeS6hAlfSdjZHHEsq81n7S8n/X0lYbZUT09f1M6yZdrNi7sWQ9LgAKGe7OKrSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 19:20:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 19:20:29 +0000
Date: Mon, 23 Feb 2026 11:20:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/selftests: Fix build after dma-fence locking
 rework
Message-ID: <aZyodmAdQgWRX95Z@lstrano-desk.jf.intel.com>
References: <20260223172553.1663749-1-matthew.brost@intel.com>
 <af898ec2-c373-45ce-b78d-2002f43e3dd9@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af898ec2-c373-45ce-b78d-2002f43e3dd9@amd.com>
X-ClientProxiedBy: MW4PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:303:8f::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: b7bfe151-192a-48da-1d0f-08de73109b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1AxZnBTTC83eEJSNmFpcmxlNnRHTjMxM1RTSnRnVTFnNlJUR1hlb1JaV1Fq?=
 =?utf-8?B?bHR1Nit2U1VZY1VZUU5OeWd2YnZ1Qnk1S3YyaXhRSXVQanpZeG81NDU1cTRx?=
 =?utf-8?B?Yk1BazhjZ1RDbkdvOUREdExkVFN4bkF5S0ZXbjFWZ0NqaWR4MHc1bHd2dWNZ?=
 =?utf-8?B?MGRaTldBUGtrZmMzbElyL0tQR2FDK3JVNnEzVmxjN3hEUHBCWTVYZ0MrWVIz?=
 =?utf-8?B?dmZ6V0ZrdmFFMXlub3lKVmJydS9oTjU4WW00OUNHS1pkbkdteVZhbElFN213?=
 =?utf-8?B?SzJtTGxOTmpsQWxIbTJFajRrV0lVaXFYMkhkWjc0Zlg2ZW52L0QvVWY0Y2Nx?=
 =?utf-8?B?YnJIS3NJNUM0cC9uL05RejNYNFd3SXpieXFkOEpqcjFpRnlvRnFxQlVpWlpR?=
 =?utf-8?B?Yk1IcnloOGEvdTNSL1ZMVGxmdnNIUzM3V3MyYWhmY2Q3WHFha0EzTlhCcWhQ?=
 =?utf-8?B?TVIxaWRpcTJzL3k4MkkwSWFIM3d2V0JRNnhVVzg0UVNWTEt3Zmp3NVBKVUVx?=
 =?utf-8?B?MFFRbC9XYUJkNkx0b01nQWdEN0pjVzE1a1dWMlZjUmJ0MFV2L1JmTVBNM1h0?=
 =?utf-8?B?VkFJTXh4T0dQbkNtWXRxMW1SeHlXN3FlVitpNDNLdmpEcGNkR2tvenUwOVU5?=
 =?utf-8?B?b0RYZ3hIdkFxYTVlc0RIY1pScVB5OUhKbmNnV2VLaFVhNVZhMzU4c2k5NjNa?=
 =?utf-8?B?c1pOSnduajcyL3pFRkVRSFVCR0FDN09PMjhaa1VXS3Q3TE0rRVZVZUlOaHlr?=
 =?utf-8?B?YysvemRTZllTYkl6dGJ6blVwUkVzakd0MzhuMWpWNVRkVUpsWGJFdkUyNEx5?=
 =?utf-8?B?S3VIU2o0MEhranFTVEdFKzRocCtEYk1oQ0VqVGppZHNMRTk2Zys3TDBCRzRO?=
 =?utf-8?B?ekxPdklObGZSazlrTDBzN3lPRm05djB4NXVBaDFqb2lBSzlUNU1sL21jbVUv?=
 =?utf-8?B?elJEYzN1QUJMNktUOHFhTVhDbXpHSFVzdDEwd3hOeTExenkxcTRkRzBnQ1Nq?=
 =?utf-8?B?R01tV0pKcSsvbzV4bDlOVUQzQ3NrdUx3UC8yT29qd2dzY043d2Vza0RNZUFG?=
 =?utf-8?B?VnA3TUlERVRMam43eDBJWUFoMnRiUyt4WUsvVkVhOU1aSFEyN1dKQ1pSMFdy?=
 =?utf-8?B?OHZ6SjlSdWVoTW5hVzMwbnlnZXB2YnRZT0wxR21PQ29nNkNOZjdNVkJVS3hZ?=
 =?utf-8?B?K0NIYnU1SE9UMXFNbStNQnI5cjBrS0JjK1QyMkp4OTFra1c1NGlyVWlxemRI?=
 =?utf-8?B?bThHVkRhSlRweno1WDRFYWJ4bnp2TXV3andVY3d4Y0lnam9TeHhqUTRCVmVq?=
 =?utf-8?B?WHFXMHl6UjV4LzREb1hoSHU4YzdKQzc5TjdqT1QyUlgrVGhJUVA4eGZvbEdK?=
 =?utf-8?B?b2pJdEJUZXlHc1VYWURqYjNqYXd0anNsaHc3TFFIckl5YkZMdXNWcEdZUzlS?=
 =?utf-8?B?dWRTbS9DL1V0L0tDOU0rK3BTRFVMZWZiam1pVDAwbVl2WUFSU3ZUYnVRZmJ3?=
 =?utf-8?B?d3RkdVBXVzBTSmVTVnd2dTQ2OTF1U1ozTHNzbGJVenRIYkNoaTJ5Qko1SzhS?=
 =?utf-8?B?QUJNbng3OWxmRyt5WEVsTGd3VFdlSGRLazlCV1dBUjlwVDY4OFVRTG51c3Bt?=
 =?utf-8?B?VWJhQ0VTV3d6NTRJZEJFUGZGcy9PTDBVZml5Zk0rcTE2ZmJuUHNHanFWUFVj?=
 =?utf-8?B?dE43clpFQXp3YlpXazNRRERHbmx4dFgwa01yZ01tSk5tVGZvR1RZU29PVThx?=
 =?utf-8?B?NSt1Y1NBN01kNFNCcGNBaHBXVEs4RWNtL2M2aXlQYStmUnhMSDI1OWVrK2Mv?=
 =?utf-8?B?UHhPRW5xNEtjNncwbmJVdTRwSFZSMGw3eENKN3NucDVWMlk1OHUwMEszWHVP?=
 =?utf-8?B?OGxzM0t2cHJTVTlNWkNxVVhiZERuV2dPUlJjZjhaRUVyN01iMkRYN2dzSitH?=
 =?utf-8?B?VXpKNjRMUXduSU1JRjBtdDdUeStOcE4rV2VMZm9VaDF6MkFLSXhZTUY5dkVa?=
 =?utf-8?B?QzZzM20wSUIwMGkxQVcrWlpRcTNtVG15NW9LWmF1Z0V6L09OaFRxQU8rQXVa?=
 =?utf-8?Q?SPx0Yj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzJsQmpKUU9HdUhWdG9KcW1HTmY4ZGpqQUpFZlE4UzE3NjZOYUZRdk94Vi9N?=
 =?utf-8?B?c1BjdnVydTBJZ2pmK21XbDdybnNrUnV3eEl2QitNb0pGZUV2czRHNzFlOVA0?=
 =?utf-8?B?amcxdXZQVXYyZFZYdk9VUTF2UGx4bUtjSWpZaGhPOVZKZkZNN0V2RmxzSi9Z?=
 =?utf-8?B?d0JIZUg3VnZodGdjcUNNUUZ2VEptTnN4K1JRNnVkdVZVQU9BWENVWlFUZFRD?=
 =?utf-8?B?UU9mZlZyVVpMbm42cHJEMERWM3NkYmNzWnE5eXhjV1lnU2hMRkR6R0IrckZy?=
 =?utf-8?B?MHNXR1VOTWJsNzVlYjR5RkI4REdCdWhRMzd0R3NkM0RJamdzOFRTd21iNWdr?=
 =?utf-8?B?TVJ6cDVzWjhCQ2Z1UTJSYjVxK3ZuT0g4azN1OUxUUFM4ak1HVXpqVUdQbmN1?=
 =?utf-8?B?dHBzMno4Y0kzQk15M1NadG84K3lHVDlYQUx2b3kybDFWUkFYbWJHTWE4czFT?=
 =?utf-8?B?OTJoMHdZNGxWYlFnYWUxMEZwMUllMXhrdHZrNGwvYVN5bHJTQmpQWkxQbStH?=
 =?utf-8?B?dHBaNlk2My8yU2p6YzVhOFBqVWVqVmtQTXJpcDdZN3hUVU8wQzRJbTFOYTd1?=
 =?utf-8?B?WnhGcWJSQi9GbUVjRHl2NWVZcHd6QUlIWk9nQXprcGE0Vk5scGl2c01NcFdJ?=
 =?utf-8?B?akVsYm4xWHZHZkRsSWdkVmVOYXpXWERFVWc1RGp4cWNYMXRJeEJncXFqd2JD?=
 =?utf-8?B?M0d4NENwUGN3SWozNk5rQkdSY3c4bzJGVHJ0Mkg5UmhCTGs3VGpFREYySWJM?=
 =?utf-8?B?NFhFYlp5R09UNEowQ3Jiakd2MlhwakJvdE1hWlA5WmtkNnQ2NjRYVHlYdXRs?=
 =?utf-8?B?VkNaQXNlUFF1c25LanFOMUJRalo2cXBvSVVaWVJDK044ZnZLLzlyUG9aaVNu?=
 =?utf-8?B?Yzl3S1hMdFZuTE5Sa2E3Q3lTUzR3VWJKM3VJVDlKS2pJQzdxZ0FIYXV1V3VZ?=
 =?utf-8?B?U1crMHRHTFJMUTVMdDBtSXhGNGVJSFV0RXB5STlkY1ZTamhBZW5sSEJCS0Vu?=
 =?utf-8?B?QzFqbC9scmh3SmhaR2lkZ09jQVBTSmZncE8xNWYvZXFoVFBKc1paK2Vlb3FZ?=
 =?utf-8?B?UisvaHBMd3RQTWdOUU5xbkdDd2hCQ1VVajZPd0dWbnRDM1RpQlp4SUt1UUNB?=
 =?utf-8?B?TVdHSW1nSXZ5cFlJK0RZcmdZSmh2QkwxV2h5ektmL1Uxa2c3aktiRjk1eitH?=
 =?utf-8?B?TStvSnlXNFIxVW92TWFzRXhHenZ1Y1RtNFVUUWlOcDdKa0dZa0FxK25icHRm?=
 =?utf-8?B?eTNrR0grNzdNM2Qzb2Q5WEhpM2FrRUxIb1hlUVorVG51UG0yTmJVM3Nwb2Y0?=
 =?utf-8?B?aEcxMHFaeXNoeXkwMkR1K2dsdWVvVXNkYTV4OHJwdlM3Vlg1TTNoM3ducnMv?=
 =?utf-8?B?VS8zWm5ycFd0YzNienBabklZWFc4eEo2aVA2MkhIaDRqQVJ2ZHdqVk03N2FW?=
 =?utf-8?B?azVDMUl4UUUxbzZqVG1WK0Y5RnJmMzRNMElnWm1FSWE3VkFGWUkwbFJ4VDBl?=
 =?utf-8?B?WTlrd3BmWjBnZjdBUWxKa1J2ais4YnM3c0ZLRUZxMHIrQnRkeXBQWHJvWGVE?=
 =?utf-8?B?UUZvZ3A3emN5Y0VLVkdJOWhhL2I5V2ZEbkVvTFJEUENxMnZLd3BWNmxUY3pt?=
 =?utf-8?B?Z1VpRVVUcGtFcG5sR2VnV0VzR3NBdkRnLzIyTDJhMGZvaFlnNkRPb1l0Y2ZQ?=
 =?utf-8?B?U08wZGZqU1JBSTZTd0ZGM0toZlc2dlc5azNGcnlrdW82RG1uMXZ2N0lMMW8w?=
 =?utf-8?B?dzFvN2JqMlJsMTV0aFBoMEJUaTY2bHV2RGdrRnYxcVE5cjgzcWlvelp4Rjlh?=
 =?utf-8?B?NVJjei9kcjdIZWY5RlIxWk1RRXluMnBTSGszTVFBREQ3ZlZPdFAzdlpjL3RV?=
 =?utf-8?B?Z0FMVk1DaVhrTlVZbFRKTGlZSHd2dzBTNDZESExONUZDeWUySXJWSFgyKzBR?=
 =?utf-8?B?aE5GY2tXaWFOYnBzVkR3ay9wRVFhTTVld3pIRmhoVWhhU09HaHl6Zk1JOHh5?=
 =?utf-8?B?dTR0QTBOeGJVeEptb0ZXQzNZc0ZZYVFQN1I5SGxmL0RoMjd3elZRa1ppcUJy?=
 =?utf-8?B?WDkzN0tlKzJQalVGMlkvQkVFd243TWY3djRuRm03OTBaZ280UGFZOEpzZUV0?=
 =?utf-8?B?RzlGSk8yRm4rYzhmekVBcXRMcGZoL2FZRXhOWVNZM29WV1Y4V2JBcklxeE5r?=
 =?utf-8?B?QzdaVjJoK0huVm9Id0lvbGhDSk9DMXBRN2IvQU5XUFNydTdNVEhaTXJzSm1I?=
 =?utf-8?B?WnV5NWZ4Y01kRGp2d1lHZ0ZuenNIZzVNN2NkYXhadEV3ZnI4QXU4M0lmdUdo?=
 =?utf-8?B?a1E3S3VDcUl5ZjIwZndKU29ZQzBGNnhSUUZkQkdHMGl6a1A0aXN3eTIyY2VD?=
 =?utf-8?Q?pdUfdZq3F2eG3DvM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7bfe151-192a-48da-1d0f-08de73109b66
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 19:20:29.8696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zll8lc7E/+SZaNgwaDlOolbA9YsYT2fgBFs+1kfQQC7jmbEh7LQeO/Hn6wkYAPxROgYq2zoJhf2/oxKBS6qAzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6312
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,amd.com:email,lstrano-desk.jf.intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,01.org:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 7FC4517C485
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 08:13:34PM +0100, Christian König wrote:
> On 2/23/26 18:25, Matthew Brost wrote:
> > The i915_active selftest no longer builds after the dma-fence locking
> > rework because it directly accessed the fence’s spinlock. The helper
> > dma_fence_spinlock() must now be used to obtain the spinlock. Update the
> > selftest to use dma_fence_spinlock() accordingly.
> > 
> > Fixes: 1f32f310a13c ("dma-buf: inline spinlock for fence protection v5")
> > Cc: Christian König <christian.koenig@amd.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Thanks for the patch and sorry for the noise, just one more question below.
> 
> > ---
> >  drivers/gpu/drm/i915/selftests/i915_active.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/drm/i915/selftests/i915_active.c
> > index 52345073b409..9fea2fabeac4 100644
> > --- a/drivers/gpu/drm/i915/selftests/i915_active.c
> > +++ b/drivers/gpu/drm/i915/selftests/i915_active.c
> > @@ -323,9 +323,9 @@ static void active_flush(struct i915_active *ref,
> >  	if (!fence)
> >  		return;
> >  
> > -	spin_lock_irq(fence->lock);
> > +	spin_lock_irq(dma_fence_spinlock(fence));
> 
> Is it guaranteed that this is called from interrupt context? E.g. why is spin_lock_irq() instead of spin_lock_irqsafe() used here?
> 

Idk, this i915 stuff I’ve long intentionally tried to forget to avoid nightmares.

> That's basically the reason why I missed this.
> 

Also, please include the intel-xe list for CI — that will catch issues as well.

We’re making it a bit further now, but we’re hitting a lockdep splat [1].

I can dig into it now; hopefully it’s an easy fix. If not, I may ask for
a revert. Give me an hour or so to look into it and I’ll report back.
But again, please include the intel-xe list for CI on risky DRM common
or dma-buf patches — if the patches apply to drm-tip, CI will run. You
should have permission to trigger this; I believe all AMD emails do.

Matt  

[1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-ptl-1/igt@xe_compute@compute-square.html

> Regards,
> Christian.
> 
> >  	__list_del_entry(&active->cb.node);
> > -	spin_unlock_irq(fence->lock); /* serialise with fence->cb_list */
> > +	spin_unlock_irq(dma_fence_spinlock(fence)); /* serialise with fence->cb_list */
> >  	atomic_dec(&ref->count);
> >  
> >  	GEM_BUG_ON(!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags));
> 
