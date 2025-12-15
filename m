Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7D3CBCF3A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 09:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF85410E39A;
	Mon, 15 Dec 2025 08:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdgAj7eR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B80C10E39A;
 Mon, 15 Dec 2025 08:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765787190; x=1797323190;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w3sNYL7tuC6KwU4Aq6+VulGBmfen79m2SISvTmGpoRI=;
 b=UdgAj7eRTk9Nkgfg+pwSg9S7iLEh1t+hrw7ZAlztlfy1zimkPY3yCiIi
 PWbv4LPOZwiCWjS1Fvv8LHUIPvsNfHFzh7CqhLedCA3xPk0ov3kuWpFtS
 vAgwBF+Gw798818nIYZNqGwYTW16weIOVlepoKohqHjm9V8bR6gmPdx9Y
 oi3Cvi7rp8eQtT/CdzoT1Kl9NGcqrCgdpkxxBxai8Rk5fbDCkjfiv21A7
 sqGvSBE54lmxVPBEFUiHXE3/i5UFyOoE17QO1WBQoIYQw6HPOyEGiw9YS
 4TqftQDn0uEhDpAZ8SkqtV8KiBfuxrpF/zPo54Qci1n2Qc1VGB4ZbAiCe Q==;
X-CSE-ConnectionGUID: eBuk3X2SRuCBJKF3ub9hvA==
X-CSE-MsgGUID: HxO7iG0KTPuAhCIOa7bDhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="93157887"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="93157887"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 00:26:30 -0800
X-CSE-ConnectionGUID: I9MWJCiYSGuQVw4kBtaQqQ==
X-CSE-MsgGUID: 4w9tUeTQTkebS9SvR4eUNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="235056026"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 00:26:30 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 00:26:28 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 00:26:28 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 00:26:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0F+q/4J8eaDg2pmoTkjIxzlD+Dv4FZSVDVwrBgJzv67u0XLEKi8ee1TMV/2Fjz+B4YEUUvs6fKaefshCMEbbScb3GvL9cItoHtIBCBGwmCrpjP4lYzD4Ax0KyxkP0VjWCqETx7fz+VV5Dz3mwYMoF2nQ9HSmPSchjKhkcLzNfG5tpreXWGtQrbHkmOFp3y3wRin9et3ToZGrLWSKq8ntcmAtWY5qYXW5XtvHGOUNmKpckYBEHf1P7ZA35aNcjv6uRDuoPUgDyAWnidzBtmiLUOW0jtNaZ1+3CzAq3Fm3Be073y5rHkvDN6l4BfzyVkyQdLZAGAO4jk8edg1Hs5zqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6sJojDX1uguEcp8aixEtKKwLUkhTza+ijPGwy0+jsw=;
 b=PV5jfWcSXuBlSi5cCN0O33YCQ59hY7THClcsVQwbrm9tvnheGtphPdH/zFHtTlhk4fWp+m26+OqMRZkgQlzhxHJc/OeTxEvTUBo8XeDuQBw3487dH1B6LDFu9BOvAdVGYCH/B121ymqSXaIX01uIjAl4xUhj/O+58r6xKuzYQJnrqzjXP0TfRVDcF8KGh7sj3QaehJDKcKgLnzXJANSAbru4ew4iXUEZq3M9huJwG4EUdDsVBw06c86XooSFs0Mmek4L1Xv0dgNFSvyE+j+CxcbYDBw5eIMR/RV/HnKZsgyQnynIu8UcLaK7FZVNpjWcNvABR5mDsWde01knupC2Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MN6PR11MB8147.namprd11.prod.outlook.com (2603:10b6:208:46f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 08:26:26 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 08:26:26 +0000
Message-ID: <764fd0c7-1679-475f-82c1-98ec85220203@intel.com>
Date: Mon, 15 Dec 2025 13:56:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v8 14/15] drm/i915/color: Add 3D LUT to color pipeline
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: Uma Shankar <uma.shankar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>,
 <harry.wentland@amd.com>, <mwen@igalia.com>, <jadahl@redhat.com>,
 <sebastian.wick@redhat.com>, <swati2.sharma@intel.com>, <alex.hung@amd.com>,
 <jani.nikula@intel.com>, <suraj.kandpal@intel.com>
References: <20251203085211.3663374-1-uma.shankar@intel.com>
 <20251203085211.3663374-15-uma.shankar@intel.com>
 <aTwwBMKUp5AYmFTN@intel.com> <f24364ad-a861-4fcd-93ab-3230a6b3299b@intel.com>
 <aTxi0OvIyTXjiUZ7@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <aTxi0OvIyTXjiUZ7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::12) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|MN6PR11MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: ea804daa-370a-42f8-2212-08de3bb3a37a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVpDTVdBM2RSWWc3UnNxaWRYYjVjdDJUSlNMMTRZWmsvdHBYYWc5ajlQNFVn?=
 =?utf-8?B?QVkvMkVOVHRDMlpyamZmQ255Wk1TTWZaTGp1NEV1MGVkVWVleHQ4ZXNBMXNB?=
 =?utf-8?B?RitxbkxzZ2dNODgvSmN2VTVPUkpiRVNBMDNHWmV6TktvU281eGR1MUlUNkw1?=
 =?utf-8?B?ZnJubmFQbUl1L2xmNUswT3FObHNJVmdJU3o4VkpxYmRnOUNjQ1RoZDFzelhI?=
 =?utf-8?B?a3VRNmJyV2duR2dTYXdaTW1jQW5DMFlpZldWWnVJb2VoM0h3VVhER25mWjB5?=
 =?utf-8?B?dzNXelFoUzhLUGZOUTdhZnZULys5dE4veTdmY2xoazNoNEJ4Vzcvc0ZrR2px?=
 =?utf-8?B?TmVkV1ZleGdIekp2MHZiTHpYR0ltSlV0STlLMUp1VjVtQVcrOEw0UjI3M1Jn?=
 =?utf-8?B?dzkyRWliVFlTY21seGNYTUEzVW1acWNmeERqdEpuVkdJZDNUaUtPK1h0L1po?=
 =?utf-8?B?MlMwT1RmZmJ0QlJEMndpZTVMaHFOTVgrNmFDYVNTNjJZMjNBSWlFQzZRQVlz?=
 =?utf-8?B?Kzdwaml2d1lUZXdzVVBLamRIVFZhcFh1eVA3ZnBhZVVOa2J0Rmg0ZHFZVXln?=
 =?utf-8?B?MEJZdVpmRGFteHIxcDhhUWZUMWZXaEhUMWt3eHdwWC85elhlV1ZBWTNZVDI2?=
 =?utf-8?B?RS9KaHE3RG9PdlkvUERLUktJenl2eG1jRHQxcWxuMDR5eFRCOGU4RlZVQmk3?=
 =?utf-8?B?OWlRZWlwWmI5RlRLMnVQVHprc0lLNFU5NGx6MlFSYW8xNk9aU29uWU8wblkv?=
 =?utf-8?B?ZXFjV2JSeUxwQnJUMitGMGorZk1QNEdNWkFndXM3QlJzT3ZydFM3ck15ZG5L?=
 =?utf-8?B?M1hkWW0rc0JFOXN4Sk1qejZxYmlXYjRldDBtcXViVHdkR3BzU2E4bkt0SG5U?=
 =?utf-8?B?SGtBdnpMcVVQekFrUGsvZ01KTSszekpQd2g0TGxCa3pueFl5RWhMcDJnQk4v?=
 =?utf-8?B?WUF4c0cvTk92dEdiL2xvUTBNZndCWW1VVENrY1BQRzYvbmsrVkR5amFYRWFs?=
 =?utf-8?B?MkFncXdYekFGMlE3TDdxcFZTczdzTXdWRUFYS3Evd1BuK2RQcXBiWGtTYWtJ?=
 =?utf-8?B?TGlURVU0VzNhaWJOOEFwNGxiSngyU3RIdTRiZlVWRzEwWThNejEvOFR3b2Za?=
 =?utf-8?B?VTZraXVVcjluQUdOTWhRZDY0NEwwK093YndFRUluNVRmYzNNcHlka05TaXhz?=
 =?utf-8?B?WjZqTitKZHlLbnEwMFIzcVE5c3ZwMk9jZGNxRklyelNFVDZKNURKeVU4dnNM?=
 =?utf-8?B?UmwraE0wNmd3RnhTVkJVL3dQRThYZG1mMmEvR1FzZThacStISmlBNHBJb0Jx?=
 =?utf-8?B?TURYN1RuTEZnaWlaaFhudjBlbUg0NUpzSEN0bTd4Z3h3cnBJV2hZZ1oyejFq?=
 =?utf-8?B?OEtVeG1oN2o5bTdjU0hVWXNwbTBjK3NkZWY1aTRHTUhhcDRSdVBLTXdZSjVK?=
 =?utf-8?B?T1NwQmoxR0lnZ0Q0NEc3V0dvUW1rVG8yUFllcGNNYW5UNHdKWWNYaWZveXFn?=
 =?utf-8?B?SzRRR3luUVl3SEplNFRsN2E5UUVpVWFsT3EybU4rbk11VVJ2a28xekpJSGxZ?=
 =?utf-8?B?aExoM0ZFUmdQaEltSGNnK3MrRk5PMmY5WUJlUGZVSWl2MzdzeGxVMXU5WFRM?=
 =?utf-8?B?OUgwM2l1OFBXRVRWYzdMYnVKUU0xUmt4VHpkdVB3ZnNpclI1eW9UUkNjSHJp?=
 =?utf-8?B?d2xWSDllM3N1VVdDdnhVTldydVZvd0NqT3I2U2RmamJJOWUzRkhNSGdRWTQy?=
 =?utf-8?B?aXI1SG0wS2hMN2lPWUl5SHhxVUVtMkFOWjlXS3Uxa3ovUitydEp6eE9JRFQ5?=
 =?utf-8?B?Z044TTZaY0VPeHM3SWROekR2enNjVldaNzVEb1U1STZDSzZQR1B4Ylcyd2wz?=
 =?utf-8?B?L1g4M0hQUzdGMjFFZFpWUyswNzNqVW1VdldMZzdtQm1reWlGUmZ5K3I4dEhY?=
 =?utf-8?B?Zm13bWJhalA1ZGw1TkFKc01pTVBZdUs1aTNNMC9USEFNRUgwT3lnMHhRT2Vl?=
 =?utf-8?B?Sy94enRaWHZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tmg4OG5CM2IxWWdhZTBwQmtZdVVwZ1JRNGhPVVZ1WXMzeExsZTVLOG1JSHpv?=
 =?utf-8?B?NFNya2Y4SHF6Um9OeEw3Z2pzaThQeW9PSXdiNE9DTUNSUkhRUVplb1ZPcjdS?=
 =?utf-8?B?Y3FGS1ZVejNJU1FLejZyTGcvRHJCU0hyb2NSVThUazIrYUdhem9ubG51eFla?=
 =?utf-8?B?Uk1qRk1JYWExUUFyb1MwbHd6WkRqMy9oLzk4S1A1OUd5MktqemRVSnF2bE5y?=
 =?utf-8?B?OUVzcEhkbzhTcXFqTTVqeWhRaUhmODFvWGJlSFF5dVViU25JV2FjMUNkdzFS?=
 =?utf-8?B?MzlkRUJTa005SFE0V1hoaEQvcW9sVXlHTmV1NG5aYUxkS1BibjhDS2JOTVV5?=
 =?utf-8?B?a2lUVm83Um9nZTJYODVucDA3Y3JrZzhweVlHS3VqSFRFLzFsbFRyN0p6OTJJ?=
 =?utf-8?B?VkpuVUt6UXdsN2pRS2QrbE5EaTA4Y3FCSVlHT1lvTGppcUo4alR4SUhPSUsw?=
 =?utf-8?B?QlNTNk9mbVVscjVleTFZb09RRnNsMVhYWW9Uak05anRGTHF4TGZqZlZrUmJN?=
 =?utf-8?B?eUoxUGpVWks4bENyRmdKRGI0VkNzVHRIalZwM0lYVEtNUkRSTlRqa08vc3RN?=
 =?utf-8?B?UzFKU1NUNW1ZN2F6L0NaYy8wRzJzM1NqSzd3ZzlqRVRUT3dCWjRJNjNTeitH?=
 =?utf-8?B?eGlxL3UrQnNTdFdMeGU0WEk4dmFpb1lKaXBDWVkydGo2VUtCOVpkQ3k2bTJz?=
 =?utf-8?B?eGhxOVFYd2paNlBwRjlrVmNnQWsrdzJaWjQwdUxIejBrYkQvUFVWVElmemNT?=
 =?utf-8?B?WWZvS3RmQjdiWC9YRmVBREltTjluYll5UE9QVUphWkFLd2hYKzJHN0IraVB1?=
 =?utf-8?B?RXdFd0hBZU1JZWpVZFY2bFUwTDFaTWVTUGlMVnUvNHEzN1FJUXZzMHJ2ZFcv?=
 =?utf-8?B?L0xhaWNjVUsvZGNYWmxka3FjTnA3eVhRRVVhYUVnbm5vMll0Tld3OUFScHBy?=
 =?utf-8?B?TisvMTIvVEw2UHg5WjA4ODY0eTdYd0VtUDhKNC9xYjdTL3d5eXRFY3FESktN?=
 =?utf-8?B?WlMzcGlaRFNOdzJaLzlvdXlOS1N6dCtXQngzU2F2MjNSZ3hqZ01KbGhaU2Rl?=
 =?utf-8?B?NXFXaE15b3JYSVVQOTRXaVJkcGNaaFJ5VmlmYk1EcWFXQlljOHlhcUtmT0Vy?=
 =?utf-8?B?NW45cmlSZXNwclJKTEdST0o5NWJCVXVTRW5NV1lKVlhpY05ENG9vQVBleng4?=
 =?utf-8?B?TlNIYmRWTkRsNWRmT0pKRitqQlhORkRDL1luclVaekcyZzNEVTF1bjVWNXRQ?=
 =?utf-8?B?UmdCWk5yVTcxZWhuZjZxNmc5bHVwRk41Sk15cFIzR2tYQk5sdGV3S0pyZkI5?=
 =?utf-8?B?TzlLMDhuVjF0ZzdNSkZVNi9nTkNDanBlVlhOUlIyNmtoMkNtUzljdk5tR0g1?=
 =?utf-8?B?NVgwT1BDbVRqbWsxMzNWWVJKWnpkczFqbTM5eCt0M0ZSTGdKaVU5anpYdHhy?=
 =?utf-8?B?TDNoU0U3cStLdVU4RUIzUTBpNTFUODk2cnFxMVEvbzlPYnF3bHR3YkU2UWt0?=
 =?utf-8?B?RVpEeTJGb1BsZDk0MGRCandZdkNWMzRVR2p0OHNVL0xTN29rYXdnNXMrM1kr?=
 =?utf-8?B?amY0Q1pMU05vNHBLblFBUS9XbGprR3VWdGtEalVTTXZ2Wmk2VU4zcWI5S1BT?=
 =?utf-8?B?Mk1YSWtLSGFTRGVyeTNYejF5YnV0RXN6YlNab0JVRDI3eVlSYy8wMFExNlZi?=
 =?utf-8?B?aWZUYVJyYkVKUTR6NkpBdEV2cjlkSGgrY2h4ZTNlc2htalJodEhtTDNsRE1m?=
 =?utf-8?B?UnpSSmFtMnFxZmFxL3VPNEFjVmhkclN5alZUT1dsTkZxQVo5UFByaVRQaFhP?=
 =?utf-8?B?cDlQOUhYZVVZUGlsSlZTUW9PbTEwY3JvSG82UjFLRTUxa3ZGbjQ2RWFHV3pG?=
 =?utf-8?B?amEzOHAzYlM5Y1Njc0ZVUW5yZzNrMVZPbnZldmFHSU9rQ3NnMTZIRXJMcS8v?=
 =?utf-8?B?KzJGYW4ydTVuaVZGQlM4ZmdGTlh2aGZTT2drYkZUQmlTUXpCQzJSeDVQYS8x?=
 =?utf-8?B?UHRKbEdiZWhGY1ord0JUcGtaeDN1a24rbHpzZU1XVEJNQnJ2RVpsSlc2OC9E?=
 =?utf-8?B?VTBPSVpqWTFTdlhBVEd2Tk0vTUZmUGZzbGorYlBCa2h3TCswZW12TzJndXp0?=
 =?utf-8?B?NWY0NGV1SzZGWCtRcnJLRkw1MlE4N2xyaVo3RC9BUmRXWXVLc3VzdUx1bklI?=
 =?utf-8?Q?heeXZVaEETUN7YhtrC1xhWo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea804daa-370a-42f8-2212-08de3bb3a37a
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 08:26:26.4025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cM9hNVdyHrtg60NJuaOC7tWnJD5Xxlx6K14yKu1pLpZ6sJOv3ZE0pDrseAQpslfb/fmTsu4maGr/ipMeqn8endyjQsTkTrgIFOQcrYYMdbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8147
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



On 12/13/2025 12:15 AM, Ville Syrjälä wrote:
> On Fri, Dec 12, 2025 at 11:16:56PM +0530, Borah, Chaitanya Kumar wrote:
>>
>>
>> On 12/12/2025 8:38 PM, Ville Syrjälä wrote:
>>> On Wed, Dec 03, 2025 at 02:22:10PM +0530, Uma Shankar wrote:
>>>> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>>>
>>>> Add helpers to program the 3D LUT registers and arm them.
>>>>
>>>> LUT_3D_READY in LUT_3D_CLT is cleared off by the HW once
>>>> the LUT buffer is loaded into it's internal working RAM.
>>>> So by the time we try to load/commit new values, we expect
>>>> it to be cleared off. If not, log an error and return
>>>> without writing new values. Do it only when writing with MMIO.
>>>> There is no way to read register within DSB execution.
>>>>
>>>> v2:
>>>> - Add information regarding LUT_3D_READY to commit message (Jani)
>>>> - Log error instead of a drm_warn and return without committing changes
>>>>     if 3DLUT HW is not ready to accept new values.
>>>> - Refactor intel_color_crtc_has_3dlut()
>>>>     Also remove Gen10 check (Suraj)
>>>> v3:
>>>> - Addressed review comments (Suraj)
>>>>
>>>> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>>>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/display/intel_color.c    | 78 +++++++++++++++++++
>>>>    drivers/gpu/drm/i915/display/intel_color.h    |  4 +
>>>>    .../drm/i915/display/intel_color_pipeline.c   | 29 +++++--
>>>>    .../drm/i915/display/intel_color_pipeline.h   |  3 +-
>>>>    .../drm/i915/display/intel_display_limits.h   |  1 +
>>>>    .../drm/i915/display/intel_display_types.h    |  2 +-
>>>>    drivers/gpu/drm/i915/display/intel_plane.c    |  2 +
>>>>    7 files changed, 112 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
>>>> index 08f3b5b47b8e..e7950655434b 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_color.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
>>>> @@ -4062,6 +4062,52 @@ xelpd_plane_load_luts(struct intel_dsb *dsb, const struct intel_plane_state *pla
>>>>    		xelpd_program_plane_post_csc_lut(dsb, plane_state);
>>>>    }
>>>>    
>>>> +static u32 glk_3dlut_10(const struct drm_color_lut32 *color)
>>>> +{
>>>> +	return REG_FIELD_PREP(LUT_3D_DATA_RED_MASK, drm_color_lut32_extract(color->red, 10)) |
>>>> +		REG_FIELD_PREP(LUT_3D_DATA_GREEN_MASK, drm_color_lut32_extract(color->green, 10)) |
>>>> +		REG_FIELD_PREP(LUT_3D_DATA_BLUE_MASK, drm_color_lut32_extract(color->blue, 10));
>>>> +}
>>>> +
>>>> +static void glk_load_lut_3d(struct intel_dsb *dsb,
>>>> +			    struct intel_crtc *crtc,
>>>> +			    const struct drm_property_blob *blob)
>>>> +{
>>>> +	struct intel_display *display = to_intel_display(crtc->base.dev);
>>>> +	const struct drm_color_lut32 *lut = blob->data;
>>>> +	int i, lut_size = drm_color_lut32_size(blob);
>>>> +	enum pipe pipe = crtc->pipe;
>>>> +
>>>> +	if (!dsb && intel_de_read(display, LUT_3D_CTL(pipe)) & LUT_3D_READY) {
>>>> +		drm_err(display->drm, "[CRTC:%d:%s] 3D LUT not ready, not loading LUTs\n",
>>>> +			crtc->base.base.id, crtc->base.name);
>>>> +		return;
>>>
>>> Just ran into this while perusing the code...
>>>
>>> This check could be implemented exactly like intel_vrr_check_push_sent()
>>> so that it works for both the DSB and non-DSB paths.
>>
>> We did discuss this briefly[1], but went on with this as a first step.
>>
>> My main concern was if it is a good idea to poll for a bit in the middle
>> of a commit. I understand that this is done for TRANS_PUSH_SEND but that
>> is the last thing we do for a commit.
> 
> It's a single register read so not a big deal perhaps. But if that's a
> concern then the entire check could be moved to the start of the commit.
> Hmm, or perhaps we should move this check to the end of the commit as
> well... Not sure.
> 

Having a dsb poll with timeout equivalent to a MMIO read might be a way 
to go. I have to check if it actually can be done.

Another way would be to implement all this in the state checker at the 
end of each commit.

>>
>>> The 'return' should
>>> just get nuked IMO.
>>>
>>
>> So just move ahead and program irrespective?
> 
> Having dead codepaths is not a great idea since they're never tested.
> Also we should try to keep the DSB and MMIO codepaths as similar as
> possible to avoid weird heisenbugs.
> 

Yes that's a good point. From that perspective it would make sense to 
remove the return from the MMIO path as well.

>>
>>>> +void intel_color_plane_commit_arm(struct intel_dsb *dsb,
>>>> +				  const struct intel_plane_state *plane_state)
>>>> +{
>>>> +	struct intel_display *display = to_intel_display(plane_state);
>>>> +	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
>>>> +
>>>> +	if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
>>>> +		glk_lut_3d_commit(dsb, crtc, !!plane_state->hw.lut_3d);
>>>                                                 ^^^^^^^^^^^^
>>>
>>> And this looks like a pretty major fail. Why is the 3D LUT stored in
>>> the *plane* state when it's a pipe level thing?
>>>
>>
>> With DISPLAY_VER(display) >= 35, 3DLUT can be attached to a plane.
>> (Bits[23:22] in 3DLUT_CTL). This is the only way we are exposing the HW
>> to the userspace right now (through the new plane color pipeline uapi).
>> Therefore, it lies in the plane state.
> 
> And something makes sure it's only used by one plane at a time?
> 

Unfortunately, even with the latest color pipeline UAPI, there is no 
good way to represent a HW block which can be shared/attached at 
different stages of the pipeline. So right now, we expose 3DLUT only 
attached with the primary plane.

That way we don't confuse the userspace with opaque commit failures on 
trying to enable it on multiple planes which would otherwise make the 
pipeline totally unusable.

If we do find a way to expose 3DLUT on all the supported planes, then we 
have to start worrying about it.

==
Chaitanya

>> However, there are (soonish)plans to adopt the color pipeline for crtcs
>> too. Once that happens, it needs to be handled a bit more carefully. A
>> potential approach is to allow userspace to program the block with a
>> first come first served semantics and fail the commit if it tries to set
>> 3DLUT both on plane and crtc in the same commit.
>>
>> [1]
>> https://lore.kernel.org/intel-gfx/b01cade8-ba63-472a-a95f-bba9af57afbb@intel.com/
>>
>> ==
>> Chaitanya
> 

