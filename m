Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DF4BD0D69
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 01:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9439510E0D9;
	Sun, 12 Oct 2025 23:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IWzjRumZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BA110E075;
 Sun, 12 Oct 2025 23:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760310556; x=1791846556;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gZbl+J6BncIx+HPmCAjZcOeQxg/7E3qBKDgb99jGGqQ=;
 b=IWzjRumZHkNLIxsYhRetGDmWdxNWCU9omPEAl08yw9RIVaMNZwP2rjnW
 fBcTU7y9vIcqJ4k3ZDa89bLpha4SsjvQmyym6iBIKb6xWp6DdlDoDEN1R
 17Z9ppH23u42X5Mm58GqTNjwRovVvV3uPMkX0LNO4q4LXLW5tGb6xzJ0M
 ir1EjQyazfjU4wvHB4/hjvR4Wlbh8ziUjvtcr0X2TTVUZiBdSXV9YOrNd
 nJH4Scy7w54pcjtVeuqM/Cvn85Roe9n4LzdYSKaT9G20LFkX7x75xaSOh
 Vsi4SQ4RTsRyWsSbQP/qVTkMNbvHJMNIQ3nDK/zlGqJ9qFZ6QaaEeJxct w==;
X-CSE-ConnectionGUID: b/d1EcseQv+s58onf557jw==
X-CSE-MsgGUID: 5c9EHvfPSP2j0ZZFjkfrVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62338584"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="62338584"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 16:09:16 -0700
X-CSE-ConnectionGUID: fi68nti+QiiT1WXKNVQZ8w==
X-CSE-MsgGUID: 35YMUVdxSa+1UnNulpGFOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="218556736"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 16:09:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 16:09:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 12 Oct 2025 16:09:14 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 12 Oct 2025 16:09:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQg11o3xP/AFVGd8MHPAYn35smDkUx1Hhoo21ZaedB7t9VG7JVAxK+OWUIn3ZC7XD/DxxwDYQR9D+JPKO3MCriX5Asf+7x2jYMLDb8NTtl1nfeQ8CJ9sCfWlFjzJ2AQO8IqzshwLay0XbBlXQ8/xfV3iS0WBDrSeVFY4L/rIxnJ6dAU5i0dFwagl8312jKIPop4fk0PUdTalWEYNMTp6le1gRkfn0yZ/ZJJgi8yV4KkcCQGgJx9wvyUwZgshsLRJZTcg2hlAL3o6H4Eg08KhK64pENphJ9q7U51uKbKaP621TES0DREN1v2KhxtWPZXcKEO5lebwCb0Q0pdu75yZLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYaOIHAGGTN/8ZFjBUPSrUoEkOawTPyveQ/ka8fSQOU=;
 b=ohkTQDo5pXLlPxxR1cCXHTdxepOjDMVEz1SlcNhfUXX5OWjODBf1EnkaPrsyEvQ0iAekP0TB5uJxEwg8h4B98ep/IUDXoCEVymfnvivjTHpBQBBrGuTKx8Vnh/aDWOSDEO7YLGRngjxgYioNWF994N1ky6LwXGJsobjRMyK3dnyN+Gm2jqZJ5WV0j0y7rICLX0ysM3Wddi/uomvt6mo1FcEHUSOrCG2zyNPIYgPHnqGaqyIWIzaEPo9L+0ru0cMxqT/ud0BTSAT2DZ/M3YvbBMgozYOa8LPCG6xzecWQqeiRRtW1VBhf5aXNNubEUeYmo7CbXmN0hx8bxuwlQp6sxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by LV3PR11MB8728.namprd11.prod.outlook.com (2603:10b6:408:218::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Sun, 12 Oct
 2025 23:09:12 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 23:09:11 +0000
Date: Sun, 12 Oct 2025 16:09:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/ttm: Avoid NULL pointer deref for evicted BOs
Message-ID: <aOw1FA4j522F3yTr@lstrano-desk.jf.intel.com>
References: <20251012124544.1325125-1-Simon.Richter@hogyros.de>
 <20251012124544.1325125-2-Simon.Richter@hogyros.de>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251012124544.1325125-2-Simon.Richter@hogyros.de>
X-ClientProxiedBy: MW4PR03CA0261.namprd03.prod.outlook.com
 (2603:10b6:303:b4::26) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|LV3PR11MB8728:EE_
X-MS-Office365-Filtering-Correlation-Id: adafc792-622f-47c3-b0e3-08de09e45af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDRBOTlCekJ2L3N4czVYdkNqcTZJQzZEdTFYWm1uQjUvbmpnVmRLUk5kSmxX?=
 =?utf-8?B?ckE2Z2trRVBIRzl3cmtUdUZmSXoydEZPTGlCYmZ0UmsxZ01WbG1uSnl5U0xu?=
 =?utf-8?B?aDZQNGpLSGRvV2p4MU9vbWRiR3o2M05IY3djejhSNGlScC9YWG5JY3A1RlNh?=
 =?utf-8?B?LzhGTUJBenNjOXBpQ25vUDA4OEVLVjB6S01UdlVZVXhlWlZWRjZPQyt5VUg1?=
 =?utf-8?B?cUpLd0xFZGt3U0wzc245RlpSaFJvdWpOYWptVVdjQzRvdjQ4Zmxybm1vc3Vl?=
 =?utf-8?B?QXJoLzJBWitIZy9PeXpiRWZMZUVjRkxuWlRHdWg1VlhlOWEyTWdJb05wYjQ4?=
 =?utf-8?B?ZXh5N2RJRFhnWlFwL0FvYml6b2xVRC9GWXJncXBaS2FjM1pOVjhHdGZHWGdi?=
 =?utf-8?B?OHErZzk2V250c1E1MWNUeU0xTkgzYldRZWJaSmk3dGE2SnhoT1JVL1NpRlBC?=
 =?utf-8?B?M3FTMkpBcnRoUVViMm9sOU43RWhjZklPbU92SVVZVUNyUUpOdTlvVjZndzlJ?=
 =?utf-8?B?ZlkxeTFWTGdnVEFrOU52ei9wYWZFMjAyR09vTzBybXR2N01yVEhWTlhIdWZI?=
 =?utf-8?B?SXV6NkY5UWpLSWVUYUhwVlZ3V1IxMzVCRkg1UVNOTldNamFuMnZzM21HWU4w?=
 =?utf-8?B?UUk1NGpjUWVqZ29ibWdvUlZZYlZjNTE1b1NYNXA1U09WcUp6ZUFoTjVxZ1Rp?=
 =?utf-8?B?ZzJTR01tS2kxekVsdFFnQ0t1R0V0NWZKc1ZIQUlGa1JFOUV4dTE1c0R2SnpU?=
 =?utf-8?B?enlRTjFJZDVuRkJnQlBsYXdJQWVOZTRyTVV2YnBsMDdFa3lRbmttUjR3RDY5?=
 =?utf-8?B?TkRESmZyazROTUZwSWF3QzlwdVZHOUlFSmlia0lYTVAyMXI5WUhrTDhqdXE2?=
 =?utf-8?B?OWhQdHBnRndadDF5QlBCK2xXMXRTU05ZeXp6aXg5RUNtUm8yQlUrZGdEdCtW?=
 =?utf-8?B?a1JuaklOUmR4bnQ4emJweHNGNHZnVnZUL1BFUkJoNStpRHlKRzhZWm4zYnpa?=
 =?utf-8?B?Yldpczh1NEtxcHNZbGJPQ0VLVkV0bCt1RG5UMWtYcEVCKyttRkxNUUdTMmpy?=
 =?utf-8?B?SVJBaEY0a3l5VHpPWUNBeEg0WlNzckRvS2tXVXcwdzFyYTdPWTFYdldMMXpM?=
 =?utf-8?B?blRCN0t6T3hmbU9KMTBxWlYzUTBwOU9YWm5oK3RDcXQ1bm1jL0U4eENRSTZ6?=
 =?utf-8?B?RXQzTlBOaXczQ3JQSzZOQWpWMXB1azR5ZTNiK2NEdll0WFBtTVUrb29pWEZj?=
 =?utf-8?B?WTd1ekhaRjdvNzNuOXR5RTQxR3F0UHpjNllvZ3pTR2lVSDIvZXA3ZmcvRnlP?=
 =?utf-8?B?N3R6eWI5QUw5OEtINlhUK24vTGVKOXo2bHhlVXhYR1kxdVRKOFBuRXhTVnd3?=
 =?utf-8?B?clh4K2JibWJ1ZUEySFQ0aG9DcUp1QWk5MG5EYzUrVGtzYmx0S0xGUXU1dmZR?=
 =?utf-8?B?Z3pTTlRrN2RiSTRoWTh4T3BUUkx6UmQyMU1rWE5mUGlyWkwwSHhBK2o4bHpu?=
 =?utf-8?B?cUZXejlkL05tR3U4aksxNmxkcGlvbE1veFlUSHlIbXMzYm9zbXBuUWR6T2k4?=
 =?utf-8?B?VG9PaEdOTm5PSUxiRjhMY0VtcW9iSElnQVhwWmtuRWR3dkJmNEpkR1JKOWow?=
 =?utf-8?B?VXNOeEt3VW5mYlduUTY3ajJ6Rkd0QnpMRFdCMDZPanQ2bGR0aXdwQkpYNHNm?=
 =?utf-8?B?dkNPSldSNmtSQndQMFpFOFlSTzg1emRvQ2ZnU08xQzdQeG4vKzlLWS9MdFJU?=
 =?utf-8?B?VjZEd2FDd0ZmY3NYb0UvRDcwcW5VTVUzUDdveC9aMnZQNC9uamYvZzdocDIw?=
 =?utf-8?B?ZFJIOWZZTk1mNE9VY1NRSlo3T21Wa0I0VzJtakhQNVlZODFTSCswWS9mMktU?=
 =?utf-8?B?YUpOU2laSkhaSnRwT0E1VSsrc3AxZEJDTjZYWGhLMm1TYlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NExuYloxcDZna3AyYU5ZMTdERzdVWVEyaHRqdU9CSDN0aisra1FXQ2E0Snpy?=
 =?utf-8?B?Q2M4VVd5Q0VJSm1VczN3aEc1bXZZSE54V01NU1Z1OUxYbVZZMlVZS2tDZDJ2?=
 =?utf-8?B?ZStuTTR6cEVRNUVlSmtHVFlwblZVWnR1b25qK0FtWUY4SndVK1g1d2JHci80?=
 =?utf-8?B?cUZHcGY2RUVrM3Jzbkh0OGJQMEQwZW0raXpPTi9aazRuUkZ5ZXB2TStDMUhE?=
 =?utf-8?B?WE5qN3RaZ2ZWc1BUaUNsV00xREd5OWIzTnlreUUxOGJZMlR2bVBCWkt2bjl5?=
 =?utf-8?B?M0ptYm5WWjFuNjZFMUhiWlVHYVBWc0pOOFByVmtiVzJKZGFOMXBTc3FBT0NF?=
 =?utf-8?B?Q1ZXdmE2NEh6RDJXd0JXM01MQ2ZrR2NONkwyeGhiY3lNUzJhVUt4OTV3a1NW?=
 =?utf-8?B?eEZlTGNYMWJEVUUxNWJIMS9uK1h1MXVlZkpPcEZRTmNNdlE2R3VOeVVaWFhw?=
 =?utf-8?B?dkRCbEwyYi9IYm9zdGo1Rk5PRFpLSllHQ1JHZUtlbUpoZnNjS0cyTGFDbVlo?=
 =?utf-8?B?QlhVc2x0UkQ5MmVuSXVHdFZUdDRpMHo3QXVrcEt6bm1rUmxiVDdZclNBWVdn?=
 =?utf-8?B?TVZYN0FTQm9wSHZhQnJsT3dVNXh1MTh2eW4yaEthWDVrSlppRGk1OFNlZDJt?=
 =?utf-8?B?bXJWQXQwb2hqdjlUdmdjTUtRRzdLOVI5UVNUdnlyMDdFdGw5VHRQRnhwcW5q?=
 =?utf-8?B?QnJoQmhtOWxrKzdWTk9tTkxYWVNvRGJuNStNR2N4dFdwMC96YXUxNHB4Nk1o?=
 =?utf-8?B?WUd6V0l3QlplUDlNUzd0dE1LVmlTNFBRMy83aDZ6dkVnbExTSGRZbTJFc2JW?=
 =?utf-8?B?V2xqelc0UWFLREFZV1pjOGt1eG1pQ1RPeHNKdURDL2hKcXhYL3h2YW8wamRB?=
 =?utf-8?B?RGV5L1R4SmU2TlBkc0lxVE4zTWJMRFdsR3BQT0NWZm02bm1GZUNtYXQyaFU4?=
 =?utf-8?B?OGhiYll0dTVhVXZCaG94M1grcjdnaVU5aWFwclNVY0tzek83N2owSFZsYlEv?=
 =?utf-8?B?T3ZibGJtOStSSnk0Y0h6RDQzQnplaWVRQ3JqUU5NbThFcythNXBUMHlhUGV3?=
 =?utf-8?B?NzF5VmpEb0ZYaTJJWEdodkRJTjc0dm9VTHNBZEZNazlpTnUyNmVXZS9hbzYy?=
 =?utf-8?B?UGFpQStHai9ZRjJMazVraStXUFRXejVCSnhiNnNaS1dIUEl5eFhOWTZpc2Z6?=
 =?utf-8?B?ZFZmMzAyS2ZOaHdYTUZEejBUQzRGYWRKVFpLZ29VSGppdUpJVTN0bXhLckVU?=
 =?utf-8?B?K0VwSmt6Zm9GcHk5aVJUK0QxNEhqUCtFenVSK21iSnBkZWFydDBtTUZCcFR3?=
 =?utf-8?B?QzNoTlVtdjljQWJ0MTRRZnFDZjJ2OTNHaXV3ZVB5MkpMZXl4dHZReVREMUMw?=
 =?utf-8?B?alVtdFc2ZmR0SnNYYjdFUE9BVGpzZWZNVThwLzdjWVhlQ0crd2hGWXJhdlV1?=
 =?utf-8?B?QWJyRHQycWZwTmVvSEswMGRWcjZMTUNPampWaDh1YUxFWVJTcEFLalJPMjdr?=
 =?utf-8?B?WDNCS2R5TDBPM1RhajJGbUhseE9kQTFqalpkQmF2RFNDSkgzQ1ZKUlNzQ2ZD?=
 =?utf-8?B?ZnRLdjU0MVg5aVNOWTRlNGlXZS96M1ZITzVHYW1ZY0NGSjc5YkdhK21VRjd2?=
 =?utf-8?B?SjRWeXZMVUtaZi9TeE5mRXFpallUYkt3TmRYT1k2VDkzcytHMzV6MVI5RFMr?=
 =?utf-8?B?eGZqSEpFcTR4L0Y4QkRPVUdvRUV3RFVNVUZaM0tEZEtEQlptWmE5YXRsNmMy?=
 =?utf-8?B?TEVEM3JpRUpCcWpmRzJiWW1yNTFmaUZ4VXhmQklIMU9qejBJMllZV3lBaDR2?=
 =?utf-8?B?bngrVXBMSXVNSGNOekx2VkQ1djFpVkgvSGpOZUV2d0N2RFZ3UXFIRlpOREJq?=
 =?utf-8?B?KzRMNUxLV0RaZ2QxRTIxdFZFamJyVHBMRCtKenJac0p0bE1lQjZjUnU3aVBz?=
 =?utf-8?B?TWRPS202UGZNaG5JRnZCQ0hCVDBUYUU0RkZwbGNxQlZOSkg0UmNvU044UnFD?=
 =?utf-8?B?RmJqS2VEUFl3RG96QVkxcTdBNGZUNGlIbTlWQ2pOVWo1RWtNMjY4dWR4M0Rs?=
 =?utf-8?B?K1NDcGJuRm4yWFUzQ1VvcmI3RDBOYUkwTnA5NmRlNnNFOEV0Mlh2dE1INE9j?=
 =?utf-8?B?NUh6cGJOYXdMSUczZmpsU3JQM3hoYWdPWVMxSzhkRkczYWI5ejlEOGwwWEkv?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adafc792-622f-47c3-b0e3-08de09e45af9
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 23:09:11.8674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCk4fCBIm82ArjAgiYpthXwRShK/6Y9cA5ilpb3wyx9Fo6B0NLswf6Np/PmZLYcE+JeV2QTx7HFWmF78/cATPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8728
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

On Sun, Oct 12, 2025 at 09:45:32PM +0900, Simon Richter wrote:
> It is possible for a BO to exist that is not currently associated with a
> resource, e.g. because it has been evicted.
> 
> When devcoredump tries to read the contents of all BOs for dumping, we need
> to expect this as well -- in this case, ENODATA is recorded instead of the
> buffer contents.
> 

Please include dri-devel on TTM patches.

> Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6271

s/Fixes/Closes

"Closes" is used for linking to issues, while "Fixes" refers to the
original offending patch that we need to backport to stable. So, you'll
need to include a "Fixes" tag here, along with CC stable.

Let me review this GitLab entry, but it does seem odd that bo->resource
is NULL. What kind of WL is this? I think this might be possible for
a faulting VM that defers validating the BO and performs the bind in the
page fault handler. But for all other WL, I really don’t think this
should be possible—unless I’m missing something.

> ---
>  drivers/gpu/drm/ttm/ttm_bo_vm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index b47020fca199..99bd75be8b1a 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -434,7 +434,9 @@ int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
>  	if (ret)
>  		return ret;
>  
> -	switch (bo->resource->mem_type) {
> +	if (!bo->resource)
> +		ret = -ENODATA;
> +	else switch (bo->resource->mem_type) {

This is really odd style. I'd prefer:

if (!bo->resource) {
	ret = -ENODATA;
	goto unlock;
}

Matt

>  	case TTM_PL_SYSTEM:
>  		fallthrough;
>  	case TTM_PL_TT:
> -- 
> 2.47.3
> 
