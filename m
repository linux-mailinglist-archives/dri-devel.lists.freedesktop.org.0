Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C548FBAE4CC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 20:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF2010E630;
	Tue, 30 Sep 2025 18:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YN2uvIpO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824F710E62D;
 Tue, 30 Sep 2025 18:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759256726; x=1790792726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6nsrE+apZF1PgWaHPpfVuUZKRrHimp5nYJCWUd2O3IM=;
 b=YN2uvIpOxCcG5S6BFVX25MBjOuQpwJb+9sxjRvxSwdISyUFT5755Kfto
 j5A6+hbz/m1hpjmvg/edkZAXV9/BPDg5SWo5fvIXQO4t53Rn4yN263MWq
 GLTvW3nL4fxZmWZiPRJCno4IdmGdW07+YmziEoBD52Ibm+Z3lXg7jvSrU
 7dl2X4UxYKTWqRKmLgxyLgRaZDGJGR8gPg+sPuaUWFroBkf1BKGpKQmKB
 rdu+MQLnpcNiTTWQegIw3SGDd3uuOY1NNf0FyDylo0h2vWocw46V/jLKV
 HNmVTl1XDoo+6qQtwnZ8+v611ULLVvnfa/ZN8dXQXVj9LzMzfqldjBsPN A==;
X-CSE-ConnectionGUID: HW2EDOhgTCqTsO5L/oyu7Q==
X-CSE-MsgGUID: au2ZJthHTwyPTInds825Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72140363"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="72140363"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 11:25:26 -0700
X-CSE-ConnectionGUID: 6p034uA8S7GK0VtW5cpk4g==
X-CSE-MsgGUID: UAnv/JeCQMqn34MSvpTmXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="215724429"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 11:25:27 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 11:25:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 11:25:25 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 11:25:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncPIjo2J64I/VCSSgimuSe2XW7m69CFUmgyYQ8FGcDddTWByPMSCGwDQtIM/QKfI3hd2XbMZQDuYtfcYqLZooSi6kTTnSN7Ffn+ssstgRkbxAP3MYtW2rw4FMwA2FKf8RIXFSs+F9ZieD4VLz8kS+phyHiIyr1Rmwp5o9FVwQNTdZZ2LxgcFg15qu3q3kA5sK+/PCaWGO+tSEcrRrhCEnTYx/ye56SyW7FBGlXZtkWU8Bjt2yleRLGHBWosXFhfpbRJKCEiau5aMOF7orErWuALEtARIGuZub6pkDElBlCXPcKrk2+yCKXLrZBO0HXZBAT3yYwGNPbp4vUt/Q5JXnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94jIiCmR9q5dlSdsGmO6+cD7XL3hAl+wFKRHgaNKxqg=;
 b=hiuE6Zzj9gx1J8cc7X5vlAoATJp0gwSNZ7ez4x1zxEJmcKi3wbYYbvQpAQVpL6yko9eDkI31l+Moim6pYy0ffKbrMaz0eZhb0I/uz8wzLrWoF1ltqMg8UisLGem6lb2TM4R1oh5cuVrV7y6yRBmIsjY4UPDuY5QRurEFwWdKHmz+J6Hwr1J0puxaH6XN90DNYo8ky+SC/vV4ePu6aafs6+Z+HWuKtsIt9+xEz13dOsdA+2hwcAsdMmf3tBjmFKpMUUCEI1CiSXW5DBc3jsdGhEYcE7UFHk8JE7ecpSVSqvmOtcJkxf28bcZoRyNuLDLAGNekan5+4kiRAq6D9SNviw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by BL1PR11MB6052.namprd11.prod.outlook.com (2603:10b6:208:394::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 18:25:20 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 18:25:19 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Swati Sharma <swati2.sharma@intel.com>, 
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v6 4/6] drm/i915/dp: Pass DPCD device descriptor to
 intel_dp_get_dsc_sink_cap()
Date: Tue, 30 Sep 2025 21:24:48 +0300
Message-ID: <20250930182450.563016-5-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250930182450.563016-1-imre.deak@intel.com>
References: <20250930182450.563016-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0005.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::13) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|BL1PR11MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: 67943420-d60d-47f2-eb97-08de004eb62b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0daamZ2REsxYklsdEJiRWZmU3p6T3Q3U0dHRlU1amlUcUpSSS9zT3lEcDJ4?=
 =?utf-8?B?UkVhUVk3R1BYcDVhUHZFazc2QXZYYUVuZE90NlZiUk53WStrREFYUFBtaW9V?=
 =?utf-8?B?V25qS3lJVFF3V21GbWN3Y2c2eUcyR2grMmVOZHVBc2FTdzArMVBjWGxtZUg2?=
 =?utf-8?B?a0VkTXk0NTlkOG1KZ0M1bSszLzJSNjFlMVh4UTdHdFlSbjF5MGhqZVU1ZGVk?=
 =?utf-8?B?dXdYeUx4VzBNeFNocnhwMVNON25TdC85enlJSGVGOUN6cU40SUJTVGh6bjRB?=
 =?utf-8?B?SnRnNGZETVBnK21Pa1doYXQ4OG14THRhdmhRb2g4L0ZqbnNIZlEwSWhBekRv?=
 =?utf-8?B?SWd3VGg4dlVDaG8yWE1zQ1o1UGFYQWpqOS84MVFRTmJPYjhwTlJBcDdpS0hT?=
 =?utf-8?B?cnhvZVNRMTMrakF4aEZQcG5UZmVsaUh6Q2NjUXh3dmZsR3F4ejVxczdCQUpy?=
 =?utf-8?B?NXVnM1FlclQvMm8zcXpTaXJaUS82ZnAxcUVUb1JsbWVsSGxzV3ZwQmNRU0ZZ?=
 =?utf-8?B?SmNpRW91dDNZVStibWloVmd5VE5LTW92dXV3OHlWeWpmbkdyY2Z5Mk5WYktH?=
 =?utf-8?B?ckJoL2RRRHhsWDJkSXR0M1YzRm90NDNSeHl2NlB6QUM0WHhGTXIzbGpsaUlL?=
 =?utf-8?B?WDZYL1B0NG43L0tEd3JkenFGS3I3U29QOXQyWHpSN29SQXdTdnlZU1pJakVk?=
 =?utf-8?B?dFhZRTRUYjNHV1creTZ3RDg3UW8zNVAvbTgyTEFyNHJYTlEzSVRVS0JPWk0v?=
 =?utf-8?B?YWpDZUx2UEFDQXFrTGF3UGE3b2R3M1p3SXcxejJ0emR5UVdyTDBSdGN3Z2tJ?=
 =?utf-8?B?TmtLZEVraW9mVHc4VUFpckNPKy94by9WN2tQbm1sQUVJVW5TajlSbVJPdEgr?=
 =?utf-8?B?bkVrWmJpNFZtYjhvekFjQzNzY0xPd3ZKZldkUWJsREh2b1JyY2hJZEdHbEVx?=
 =?utf-8?B?a2dOSEsvZ25rQUN3NlBDWkhmWEkxUXd2UXc4UjZQK1lScXV5cUUvZGlFWUZH?=
 =?utf-8?B?YXJ6YThPNlluL2pBSXhQd0krODdGNGgvUWFLOHR4R05md2dtc1JXWCtPZXJj?=
 =?utf-8?B?UXNVMDd3Z2ZJWnltdjZtTjNsbXhJeUpscnFWeDYvSUlKUTRLVHBUVHZqWlNw?=
 =?utf-8?B?ajhzZ1A3NG0veUMwYzlWbHl1YnBaZFcvbmxpOHJMdzM1Q2NHNUFPZE93YlVv?=
 =?utf-8?B?VnduSTJGcFV4RHV6QS9qa1pMN1FpZmJPMEdEcHQ3eTU3dk9ubUxnckJxY0Ew?=
 =?utf-8?B?S2Z4VjlUelJPRTlZakpSem5nUVRSa1QyWnIydGdnNk9sM0hRcUZXTnBieVFO?=
 =?utf-8?B?M2VlT2dlaU9FZHpJYmxySitxZGlremxuK2RLRnQyTVVXb2hIS2Q0djNJL0RX?=
 =?utf-8?B?c0w2Z1M0MDM5emZXZXppZDhNOUFha3VTL25tSGYxZkdIMmxMa0t0bHBCRFNP?=
 =?utf-8?B?NnVDSHl5OXJTV053cWxFdmtGNWZka3lRNG84eXczbXNuTGpxcTVtakxSUnhR?=
 =?utf-8?B?WlR4ci9Dejg1RHZaTWwrL2dkZ0RsMEJ4eVdqZWJqTXBkMXMrVkVuN01EME8r?=
 =?utf-8?B?Z3BFMnhPcDd0am0vMkk5RnlKVE1sanB1SHRnUkJYZTBOTTFOd2RpWjIwRE5m?=
 =?utf-8?B?cjcraDFFUzFQY3p4NUNvOWZEblpwamRCdUE2dVpEblgvMFZ1Q2E3aXp6NSto?=
 =?utf-8?B?cjlHK3BPU1E4RW9LMXpWTWNMb0pMTlo3UkkvZDVrbXVCT2xRY2p0VWR0TFlj?=
 =?utf-8?B?MlBJc3pIKzhocTJuNnZ3TEQzOW9lQlY0TlZtZDF5eG9TanFuZFFHWFBkL0pj?=
 =?utf-8?B?ZDJManBwN09uMklFdDh5bDl5aWpVcHhEa2FBc2ozZ1lxY2sxaDZzSzJ6RjNa?=
 =?utf-8?B?TDZYZVVkVFJxMlgwNDZWK0JqZWNUNVB5UnUxVThIRFBXNWtwWXM4QUthN2FC?=
 =?utf-8?Q?9mwV9+TG3sr5oQmpO68Q/6qwRLd6yfiZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkVMMDNiZ3AvWk1MQU9FNm1FMU5KdmFmNTFscGNUWjFhQ2JGd0ZrYnpoOU1y?=
 =?utf-8?B?OG44Y29oNlFuM24yVXh5SjVYMEVLYWJyQ2V0VWpSVmwyVHpNeE1WdmRhbVIx?=
 =?utf-8?B?ZkNKNE5tYXI5TlV4OTlQRUFPZ1VzalNWVk1qbThGZVIzenBWamVDZWdURFBh?=
 =?utf-8?B?dFlEU083UGMyaXlZSk5lWnBRZlZHUGRpSUpYdTVMZjlXRDNlbE5iT3UzakYr?=
 =?utf-8?B?ZTVueXFhalhxMGp6clprbzEvaHZzTTI3OFgvWVpOUDNvODk2SXhnenV5b05Z?=
 =?utf-8?B?LzdUR21iRHZvTWtxaUwzU0o5MkxRVGladkl4SkRWVXVib1creFQyTGlGYW9H?=
 =?utf-8?B?YTMxc0xIZmM5VU1WSmJwK3B6eENRM1B6Yi9sanRtdG9OZjFORWVGekhUL1VG?=
 =?utf-8?B?VTUzR1hWR0ZNV3lQTENVZnZZRkV5N2d4bHhDZ3IyeHN2RHBSL3dvUlZNRmEw?=
 =?utf-8?B?MjZlcTNHWlkyQkhtWVRKMG1lQ3NHM1UzQ3ZJbG5zWk5OMHNEVTZOdm5tUTlx?=
 =?utf-8?B?KzVyb1FENW9UNlM5TGlDdnJhU0xwYWFZTDdpRkRhM1FXM3lIblRhZXp6Y1Rx?=
 =?utf-8?B?WlZneitVbkJFMXlHTWx2ZFNMbFVpaVBKN1MybFM3NWdHQU9wS083aXhTOWNi?=
 =?utf-8?B?enUzL1ZsQzR4cWRGSDFyL3F1cmZwTHpLZHdFdWxUbUFwNktLL3ZXVitGcjB5?=
 =?utf-8?B?cWw2MGpWdDNJeU9jVWJFbmlkeWpLWXhVQ2pQbDVmRWFGZEt6TGJ1NzZQT1dM?=
 =?utf-8?B?L21KSTNKY0hXaHEzT09VSnU3bWcvKzNaWTUyZFE5U2RveWozRDU3Q3pUZ0lV?=
 =?utf-8?B?U0MrYjRTRTNXYU4xYXlHTmdrNXZ3VHl6TGpLM0t4SDVZUTlSYnI4b1lqcXlK?=
 =?utf-8?B?cXRmZXdibVkyN2N6QkFFcVZ4eGtEay8rbmZsYTFUYXZyWEloZWhvVDFyNTV5?=
 =?utf-8?B?Z0pKQWxXQ0xMTXVSNHdkS1hxK1dxQ0RwUlF1eHdYZmRUaWJFMEVMQkg4aGUy?=
 =?utf-8?B?OTFLdFVaVndwNGF0WThkTlhXUzg4R3phUnM5Z1VzUWF0eWhzWjNBWFYvN1RV?=
 =?utf-8?B?ZWx6U3ZrdmFJRjY3SEcwSjNaUi9zb2cweWxmZzhkdzVxOWhJTUhnMDVuZ0Nt?=
 =?utf-8?B?cWZlM212eWxvK0tEWEJmRk1OM1dmQXc5WEt0L29kT1JHOFVvZVYwbVZadmJG?=
 =?utf-8?B?QzBwN1FuVUNtZzA5RFJQVjJ4VjFzUXJleDZSb3REUjQzWVl6UU41TElIU0dm?=
 =?utf-8?B?N1JqbG5EaWVRN0ZkZ1g3ZitqM210UE03TmEzUmlYZkg3T011bHBKMmMxU0do?=
 =?utf-8?B?UnB2ays4bjdFRm1wSFJGeUVoaFBTamlZWjhkZDJDeklxOGYzVmtqSU1Lc3lJ?=
 =?utf-8?B?dWhha2hqbFVJZHgva2ZINUJRa3dzam9KTlVhM1Y5V21OY3lNcGsxN3FNZzRq?=
 =?utf-8?B?aGg5QmZ2aWtlbVp1cHZMZWRmSEVIek1FeUtVVGV1aXpKb1FFQmxXUmxmblRy?=
 =?utf-8?B?bGdJQ2IxbmpvWm52djYrclRjMjAxSTZ6SUhqUVpvRDR1N3lJVHlScCtaSG13?=
 =?utf-8?B?aFlYdThMT1ZFd3Fhdy81OEh6bk52UzQyaDR3OTllWlNtRXVxWHpSOHRHMFpG?=
 =?utf-8?B?dWM1WXpDSWpZZHRNcG02UHQ5SnFHNlgxNi9mSm5uOWpSVXp0UGV6alVPd3Zq?=
 =?utf-8?B?QXk0QmlPeE1ZZEZVQjkvNUUxTVJEOHdGWE4yV25IdytOWlRBN0RWenBHN3hr?=
 =?utf-8?B?bnZaM3pTREw5d1V3d1hkRS9hVWFIS0ZNdTFJb3pQWURZNXpjWjRNSXBleDJZ?=
 =?utf-8?B?c002SElmY1ZLNXd1UjFNR0tuaTgrcW1LdzJhNC93MFBEbi9VMktxUXAyRjN5?=
 =?utf-8?B?Qi9kVGVLL3ljOTA4cGxwV1Fhb29WL00wak5YaFhvOGNlQ0IxdUVhTjNGRmhn?=
 =?utf-8?B?b2JTZ21PR3ArcVZySUVhQm5HdDBJRlhhd3Ftc1NhVngxL2dLVlZmdGJ5UWdx?=
 =?utf-8?B?S1RBRElhUUhiV0lTOFluMDdJMm1FNStXcjlVVzJRSHhxMzNpdFUrWmNVZXR4?=
 =?utf-8?B?a0hFeXBGZndKSDhnUnRBMTNsdGIwbE9JOWxkVjRhUSswYzlCV2g3UStydEpD?=
 =?utf-8?B?bXBmSkt2QXBwVG5JVTUvMnJ5Szl6S2VvV0ZyNXR6c1ZGM0hFUVVmNW9kYm95?=
 =?utf-8?Q?jGmyJ+IvCKzYnJNFbE5hIKDhyNrH6rk/3d5l1uKnmPoN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67943420-d60d-47f2-eb97-08de004eb62b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 18:25:19.9443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mj0W1rfF2ilDQmC9ZkTXHbonorC0Q5oy9lWxHJg6QiCu0LtY9/3aEbsgJcOBJeebM0A2d0GKfrzaejsDT4Ucgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6052
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

Pass the DPCD sink/branch device descriptor along with the
is_branch/sink flag to intel_dp_get_dsc_sink_cap(). These will be used
by a follow up change to read out the branch device's DSC overall
throughput/line width capabilities and to detect a throughput/link-bpp
quirk.

Reported-and-tested-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 5 ++++-
 drivers/gpu/drm/i915/display/intel_dp.h     | 5 ++++-
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 9 ++++++++-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 491a804c1f6a0..2dcc20bcfa0ba 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4180,7 +4180,9 @@ static void intel_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
 		    dsc_dpcd);
 }
 
-void intel_dp_get_dsc_sink_cap(u8 dpcd_rev, struct intel_connector *connector)
+void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
+			       const struct drm_dp_desc *desc, bool is_branch,
+			       struct intel_connector *connector)
 {
 	struct intel_display *display = to_intel_display(connector);
 
@@ -4231,6 +4233,7 @@ intel_dp_detect_dsc_caps(struct intel_dp *intel_dp, struct intel_connector *conn
 					   connector);
 	else
 		intel_dp_get_dsc_sink_cap(intel_dp->dpcd[DP_DPCD_REV],
+					  &intel_dp->desc, drm_dp_is_branch(intel_dp->dpcd),
 					  connector);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index f90cfd1dbbd05..b379443e0211e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -12,6 +12,7 @@ enum intel_output_format;
 enum pipe;
 enum port;
 struct drm_connector_state;
+struct drm_dp_desc;
 struct drm_dp_vsc_sdp;
 struct drm_encoder;
 struct drm_modeset_acquire_ctx;
@@ -199,7 +200,9 @@ bool intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 				    bool dsc,
 				    struct link_config_limits *limits);
 
-void intel_dp_get_dsc_sink_cap(u8 dpcd_rev, struct intel_connector *connector);
+void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
+			       const struct drm_dp_desc *desc, bool is_branch,
+			       struct intel_connector *connector);
 bool intel_dp_has_gamut_metadata_dip(struct intel_encoder *encoder);
 
 bool intel_dp_link_params_valid(struct intel_dp *intel_dp, int link_rate,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 352f7ef29c281..f2266b2653046 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1658,6 +1658,7 @@ intel_dp_mst_read_decompression_port_dsc_caps(struct intel_dp *intel_dp,
 					      struct intel_connector *connector)
 {
 	u8 dpcd_caps[DP_RECEIVER_CAP_SIZE];
+	struct drm_dp_desc desc;
 
 	if (!connector->dp.dsc_decompression_aux)
 		return;
@@ -1665,7 +1666,13 @@ intel_dp_mst_read_decompression_port_dsc_caps(struct intel_dp *intel_dp,
 	if (drm_dp_read_dpcd_caps(connector->dp.dsc_decompression_aux, dpcd_caps) < 0)
 		return;
 
-	intel_dp_get_dsc_sink_cap(dpcd_caps[DP_DPCD_REV], connector);
+	if (drm_dp_read_desc(connector->dp.dsc_decompression_aux, &desc,
+			     drm_dp_is_branch(dpcd_caps)) < 0)
+		return;
+
+	intel_dp_get_dsc_sink_cap(dpcd_caps[DP_DPCD_REV],
+				  &desc, drm_dp_is_branch(dpcd_caps),
+				  connector);
 }
 
 static bool detect_dsc_hblank_expansion_quirk(const struct intel_connector *connector)
-- 
2.49.1

