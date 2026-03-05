Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNxUB/LsqWmFIAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 21:52:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D7C2184AC
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 21:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CA310E19B;
	Thu,  5 Mar 2026 20:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aH40AIpK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2D310E19B;
 Thu,  5 Mar 2026 20:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772743917; x=1804279917;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JaXLw93XxIJRL9NjqrKZVuj2hE9YwJRafITknODBBy0=;
 b=aH40AIpK/87rhSCWlcVWNnnP0gYfK2RsE/d4aXxmH+bemnOPCbW3vHeC
 PENsesdQosAINQrOr6N5pqHeC14jgrzl6TXRJmsdN23M6kpg/XuZ5cd1y
 tjcpCAhgdik0DIkfu7+QvXDxFC87pVHroztsPbHWA8w3J3yRTOKD99dIB
 IzEz8uhBWdQVdhn6mYzCJj9q58JYPZXG3eUs+Vx2cioaL1eECIRwlT2Rz
 KBVx/YbS1FG/HQ6kMF3glstLG2LuwSiXY4aW2ZARwCLBf0amxoHkk/65n
 tvkPZb4Y2F1woZ5bDHJKwPt+yBQS5kcc0poCc7VlDJG/1HgVS2JbkgU19 Q==;
X-CSE-ConnectionGUID: uLn/lXggR1+YTeqA7QqReQ==
X-CSE-MsgGUID: oe+Q9A/dRBmv/IEIbrsuqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91236400"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="91236400"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 12:51:56 -0800
X-CSE-ConnectionGUID: VcJlo0W2RW2erEy4y0c/IQ==
X-CSE-MsgGUID: 8433vljyRjmSV4bQCGmoqw==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 12:51:56 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 12:51:55 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 12:51:55 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 12:51:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+FzIYBK+scEhHrYf2428Ji3f9TZmxvleb0CUbUGGCxwKMRyykOjkGvSJiZwl9ZHLDXkcUgX0dgbkFMyUMMEQWfHPPRnmWRi5K8mC8y4+sFV/rhyCEsCQ1rXz2q05rX4coM8HY9GO64ZRzT0B9PDmH6d5qmfKOjf16pQIBDTOzwfSclyMo4uA2TG2RFHO9agKxMGyeU+nR8qmA7Q6nGtXc7p5SNwQnlj7H/80aMq5iPKT/r+bR5kaFA1rAFgOC4oUkfFBwbjGqWw6HNmYMd/oDcq9MzkXnADysx9kLXXQGKqP5am1vWm/f9ElOjgKrqpy55PnHTWLzd2nsc/886yTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OAT1O/7fI3oVptlX86uEtuSngQOSjJGBQK6FrL49ig=;
 b=y2fGTG0c73Zy0rT5G5MQxTkRRbGmVB5zl8pJ6KxkZ/9osAGvYoUMoV6KA7eJxN4ZHFXD31dTK8OOnEpjK9Bl47pG8Vjf3kHcp9po12+sCzxpiDWhsBnfKdufx6nT7+ErXpzCly2lsCU0HO6qsINQiVpNIEGF+9XVzKgKZ9cA8jrHJ1HeN0QBQc83CbksKbH2Cp68YwaKBo1camtlUGSnS5W2NzH84HmLikkM7xIil9y0H9FJDlFgdjxXmYLOPmNnyTBNoislIo0REk+dea5XAb8TnzYzQugrQdhPnPz11z060BMQo53cX6TNdmGRcICfVYL113yZKsCMerGX8S7Y4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Thu, 5 Mar 2026 20:51:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 20:51:51 +0000
Date: Thu, 5 Mar 2026 12:51:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
CC: Chia-I Wu <olvaffe@gmail.com>, ML dri-devel
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Steven
 Price" <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, Christian
 =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, open list <linux-kernel@vger.kernel.org>,
 <tj@kernel.org>
Subject: Re: drm_sched run_job and scheduling latency
Message-ID: <aans5SMXDbwhpqY8@lstrano-desk.jf.intel.com>
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
 <aajkqXZDGUFPlq1o@lstrano-desk.jf.intel.com>
 <20260305092711.20069ca1@fedora>
 <aalWTOZSNYcKpvdd@lstrano-desk.jf.intel.com>
 <20260305115201.6fb044f0@fedora>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260305115201.6fb044f0@fedora>
X-ClientProxiedBy: SJ0PR03CA0048.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB5966:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d0073a-9664-4ae9-1f6a-08de7af9070b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: w0uA7roZVEcq4Z274fEJhUJpquoGoE1tPgKzzyHWSjUCts2dFWc4UAQkEO6uk9xmnpu2IYzw3uwAu6v+gr6iAIBxWtK8uYFPnRrGrO2DlkETkWZgXRRavsVkdvz5tbn/cjDxPlApla4enIfhEkAAsgl80OlNseqhbhQn3ZqQgW18dXgZ6HtNoAR7S2mskYb6uih+pWRqg3+DFzW3hkMlfKjtJb1nmPakS72sjJeAEk2TJ2eHJAFigEvQXlee8j4BDDqwa7cNaUe1teUUVhJWU9uQXLTaJnsLlj1yS/w2XyCtL6vyXPar7nPe7yJYX6g3wpWGl7zf+ml6w7/H2EHLkrUddTGCRlmY46vM+3GD2t5SmqeDhX6TOozaB84Tis6nzBq57/bWzNXHdjpJGjloermw6gvGhLtny6SOta9kVIgwZ/QGsvmpqCat4Kn4MeOBCW2czvhcgC/0QT2HxRpG4xgO5VptciOv8qwx5RHlaXgs1XlUfa2t92IkW/6FVdKnPNJ2eVSUnfTUInT92oSh14Q8CgUItxiKArJyYYq4dlW3W9L90707TBRa6b4truzg6ZR+GTTr3xGry3EaLvGaZnurcHM9qB+7L+00or4KFEc2kgDPq3mRUyhmjE9m9o+A63entSUi20sVMqPUIXKmuvwiDVllYYXokaXIdsAvEkPHyrGc6xU3TTzTJYAzQ8r1SSd/c/MnHTW+AYtPGvBQkNwE00Aq3g8GAPT3Emz82Pg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3kybWVZc2crSUNKUWIwL0RyWVFRVFloa1hTTlliWDFaWitmR3V4cjJNRk05?=
 =?utf-8?B?UVVmN0d3K3g1WDFNV3VNV2ZQdldGdzhLKzlMOHZjMkNYR0pwWllsb29udzFr?=
 =?utf-8?B?aVlRSSthTXVzaTQ3c2IwenZqU3ZIeHU4Q25md2Jac1dPWllmaDdvWFRpR0I5?=
 =?utf-8?B?aFZXSm5PYmdLUTRNQVVydHB2KzZ2ZlNEbUF6bkRlaVpVMjFBUGhjMU85SHR3?=
 =?utf-8?B?STg4T3BGdG9LaWdhOXplNkJHVVpJVjhtZFY0Zlhva21sN0ZBZGQyU1dDaGtR?=
 =?utf-8?B?cS9uUGg0UVZNSjJxN3dwWjFvUG5Qb0V4TkJ3azJpRlp2YlRUWlQ2dS9Cd3hI?=
 =?utf-8?B?OXVxd0R5ekk2RGNaTitIcmJMdTZSM1ZxYXhkdXh0bG5RNndIaU1RaUNQZnRl?=
 =?utf-8?B?clFKY2M5VjFxQysxOUJuTm11SGNJOUsvWkFha20ySExvTzBnK0JQM2l2c0VD?=
 =?utf-8?B?MEdNRkRKZmlMRzVSRVgxQWZmQjMvck1pakdHMnZ2Y3Zqb3RMNWo2YzFrc1lo?=
 =?utf-8?B?UGgvNkh2YlRXZmlsMnZNOUdjZURCU2pwWUZQOTBDU08wMHlFNGJoc3dKa0lG?=
 =?utf-8?B?YVRRZWYyVjRZc0pYUW1wNDZMdEFpb3NFOGFkK1hkdEdINUE2L01KOTBkYk9C?=
 =?utf-8?B?Z2cxRVE3ZHdiN0crVEF2UHBvSDBxZlVJMGJKd0tjTGVEY0ZSNlVXTkcycUlp?=
 =?utf-8?B?VzBtM2ZmY3NEa2h1ZmpzRmFiOTZTazN0ZkVCMTRVRjJsYVo2ZThmQnl1dXNQ?=
 =?utf-8?B?RFFqZW9GRDNzNkczeHhxSWtpVUN2U3FjNHdPT3hPQmZ2ZTFXQUZyTFdHb3Vs?=
 =?utf-8?B?MEhrZW9Ndm1BRlhvTytZWEJSM1QvUmhWdnFLa1ZPdzFiQ1FLK3hOSW5JVHN0?=
 =?utf-8?B?ODVnRldIOEgvU283Z0hSSmNMR1BGTldhdE5laThERnA4ODExVGxHSlpvZDRa?=
 =?utf-8?B?NHR6UWhncjNJd2lJM29XLzNYU1F6SnZEb0czVngyMTNtM0lXTk1LY2dibWU5?=
 =?utf-8?B?d3d4K3NuTFR6YVEwNHJ2azNDN2ZDcUxXUXBHalRJNVlLUFROR0xXZllneDdL?=
 =?utf-8?B?OGhVVnhxckhuODNqVmg2NWZkNmNrUjl0KzgrcVh2UkNuMjR1Q0NUUUpZNG5y?=
 =?utf-8?B?K1RIZ2JaZ2NoQTl5SnpBRGlRNzNxRUFrUk14MmlTOGNRSjZ6dHpyQUI5Y3NG?=
 =?utf-8?B?SDJxSWI3ODgxL0U5dGVjVGRFeWZhSGFWNWRBM2c4clIyWU1taXdoTk5aaVJC?=
 =?utf-8?B?aE1nZ1NxU1JtTlNHcm1BcUVhaTlFU2o5YitOTHJmR3FjTXFyM2pIUDNrMmlq?=
 =?utf-8?B?R3FSTjdzR2RGT01CbWdlUUcvckI0M3pJOC9GOHR2QjEyS2dYNDlZWUx4S0Zx?=
 =?utf-8?B?NFJCM3d3ZXh0L2t3dUtxVjgzVzRDeWRTNHA4ZlhHdXhsem9mQ0tSdzZwN3A1?=
 =?utf-8?B?c29yVzNhQU9zR0o2UlFaSHJ3bDUvQWRMbDBwUjVFdlB1aEVydG40cDlTVzY3?=
 =?utf-8?B?d0liTW1NOEJEVGQzckNlUnpjRklTSXZZQitrVW5mMk1QY0tnYnpPb0puV3Aw?=
 =?utf-8?B?T0RqVXNHMEJpbDNGTWJGRmgvUGt3T3JoTDV4VDBRMnVRTzNpa1RTZlBsUSt4?=
 =?utf-8?B?bm8xcGVONE9jQnJaYVU3OG5SZFlBQmdHQURNK1k5ZlovQzNheE9Eb2kwZ1U1?=
 =?utf-8?B?SHFXYUNlYkVHWmIyZzBZRjNaZTlkazFvMVQ2eXgwbWV5WGtKZVFFazlYR0ZI?=
 =?utf-8?B?eVpUUFY2a3J5eHZsb3NJL3hXYW1pSHdONFRQRjF4cUc2VGhEUFFUUU1tRkhN?=
 =?utf-8?B?RkVWOHRkMVhNM2V0VnljbFk4dS9QU3RwbnhYRHlDdENVdDFtQ1FlcmV6V0kv?=
 =?utf-8?B?enozQUcybFBrYVlDY1RmSXYyajc3cjFwTHd1OHJvamI3cE0vcndjdXc5SERK?=
 =?utf-8?B?V3Q4eFBlRXVLTFUzcUFabXo0TGRPdmZwWUdCWmpCSVdpWUdDSC90UWtvRnJ0?=
 =?utf-8?B?bGZRaDI2L0RtemFSZDFwQWYvK2hITGxVOW03Z2JhaUJoMmZpTFlrOXpnL0hn?=
 =?utf-8?B?QnpOY2d3Z0ttZFduaVI5Y2pPbnZwU0F0Z1BJaWJaRmdhSjRLUkJNRHNYUzdP?=
 =?utf-8?B?TWZ1OG5HZTJHZGVQUTZIeEl6akVOVlV4clhNcktvRVA2MElQSFZFMk8zRkNZ?=
 =?utf-8?B?enZkRjVQaVZqd1h3VlB5YTJPd09oREpQQ3J6dzVpQ3VEaDlRYjdkaVJtc2ti?=
 =?utf-8?B?QitieFVPVmhDRU5yNnByVUZINE0yRU9VRHZXVklTUmhiTXNBbkFZUjFGaU5S?=
 =?utf-8?B?YnlTTUpPN3Nud2FhSVdBMnA0d1FjQm1Oa3dhRXlwcTVicFZCalJXS0ZTK21C?=
 =?utf-8?Q?NZLrBaxF1wMH/AAE=3D?=
X-Exchange-RoutingPolicyChecked: INy+lGODSINzG1bbjfiyjxNyy/Y/RBHcudhACu1wjIRPmJ0loAzUGw8jxcvJjEnBLpiSp0LbvER+sOxCm6tgVncNzyJ7b5wKZvEfiw7jnuHhYXJpZHQO6kZoQ15sNscrRbnYiAuYJRzQijcBPXsgaXUibIinJWMG49t8V3gtflDMA7xI64LaUNg/PL5QOetjhyFRdLoi+vRSd7KCMdKu4iQOk8cykW6bus7rQkAPLZPbbL3WkhZESeEt5yqhxD+NwFRDfIZqTY/pC3tbbtuf70RtZwtfoAyZFdHF6p7UXduquGiR+g/XBpbLfc/lbQ62rjY8VlGK+ADmM7Hd4Xv5xA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d0073a-9664-4ae9-1f6a-08de7af9070b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 20:51:51.8560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AmBGhKb8+zQAJQmaOHs8YiIyITZigmOcqU+H7uzJNEBLyVqwggpLXzpYWg7lUo3XTq8QSnXxLBgetlm03EPqkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5966
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
X-Rspamd-Queue-Id: 75D7C2184AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,arm.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,intel.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 11:52:01AM +0100, Boris Brezillon wrote:
> On Thu, 5 Mar 2026 02:09:16 -0800
> Matthew Brost <matthew.brost@intel.com> wrote:
> 
> > On Thu, Mar 05, 2026 at 09:27:11AM +0100, Boris Brezillon wrote:
> > 
> > I addressed most of your comments in a chained reply to Phillip, but I
> > guess he dropped some of your email and thus missed those. Responding
> > below.
> > 
> > > Hi Matthew,
> > > 
> > > On Wed, 4 Mar 2026 18:04:25 -0800
> > > Matthew Brost <matthew.brost@intel.com> wrote:
> > >   
> > > > On Wed, Mar 04, 2026 at 02:51:39PM -0800, Chia-I Wu wrote:  
> > > > > Hi,
> > > > > 
> > > > > Our system compositor (surfaceflinger on android) submits gpu jobs
> > > > > from a SCHED_FIFO thread to an RT gpu queue. However, because
> > > > > workqueue threads are SCHED_NORMAL, the scheduling latency from submit
> > > > > to run_job can sometimes cause frame misses. We are seeing this on
> > > > > panthor and xe, but the issue should be common to all drm_sched users.
> > > > >     
> > > > 
> > > > I'm going to assume that since this is a compositor, you do not pass
> > > > input dependencies to the page-flip job. Is that correct?
> > > > 
> > > > If so, I believe we could fairly easily build an opt-in DRM sched path
> > > > that directly calls run_job in the exec IOCTL context (I assume this is
> > > > SCHED_FIFO) if the job has no dependencies.  
> > > 
> > > I guess by ::run_job() you mean something slightly more involved that
> > > checks if:
> > > 
> > > - other jobs are pending
> > > - enough credits (AKA ringbuf space) is available
> > > - and probably other stuff I forgot about
> > >   
> > > > 
> > > > This would likely break some of Xe’s submission-backend assumptions
> > > > around mutual exclusion and ordering based on the workqueue, but that
> > > > seems workable. I don’t know how the Panthor code is structured or
> > > > whether they have similar issues.  
> > > 
> > > Honestly, I'm not thrilled by this fast-path/call-run_job-directly idea
> > > you're describing. There's just so many things we can forget that would
> > > lead to races/ordering issues that will end up being hard to trigger and
> > > debug. Besides, it doesn't solve the problem where your gfx pipeline is
> > > fully stuffed and the kernel has to dequeue things asynchronously. I do
> > > believe we want RT-prio support in that case too.
> > >   
> > 
> > My understanding of SurfaceFlinger is that it never waits on input
> > dependencies from rendering applications, since those may not signal in
> > time for a page flip. Because of that, you can’t have the job(s) that
> > draw to the screen accept input dependencies. Maybe I have that
> > wrong—but I've spoken to the Google team several times about issues with
> > SurfaceFlinger, and that was my takeaway.
> > 
> > So I don't think the kernel should ever have to dequeue things
> > asynchronously, at least for SurfaceFlinger.
> 
> There's still the contention coming from the ring buffer size, which can
> prevent jobs from being queued directly to the HW, though, admittedly,
> if the HW is not capable of compositing the frame faster than the
> refresh rate, and guarantee an almost always empty ringbuffer, fixing
> the scheduling prio is probably pointless.
> 
> > If there is another RT use
> > case that requires input dependencies plus the kernel dequeuing things
> > asynchronously, I agree this wouldn’t help—but my suggestion also isn’t
> > mutually exclusive with other RT rework either.
> 
> Yeah, dunno. It just feels like another hack on top of the already quite
> convoluted design that drm_sched has become.
> 

I agree we wouldn't want this to become some wild hack.

I could actually see this helping in other very timing-sensitive
paths—for example, page-fault paths where a copy job needs to be issued
as part of the fault resolution to a dedicated kernel queue. I’ve seen
noise in fault profiling caused by delays in the scheduler workqueue,
which needs to program the job to the device. In paths like this, every
microsecond matters, as even minor improvements have real-world impacts
on performance numbers. This will become even more noticeable as
CPU<->GPU bus speeds increase. In this case, typically copy jobs have
no input dependencies, thus the desire is to program the ring as quickly
as possible.

> > 
> > > > 
> > > > I can try to hack together a quick PoC to see what this would look like
> > > > and give you something to test.
> > > >   
> > > > > Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and won't
> > > > > meet future android requirements). It seems either workqueue needs to
> > > > > gain RT support, or drm_sched needs to support kthread_worker.    
> > > > 
> > > > +Tejun to see if RT workqueue is in the plans.  
> > > 
> > > Dunno how feasible that is, but that would be my preferred option.
> > >   
> > > >   
> > > > > 
> > > > > I know drm_sched switched from kthread_worker to workqueue for better
> > > > > scaling when xe was introduced. But if drm_sched can support either
> > > > > workqueue or kthread_worker during drm_sched_init, drivers can
> > > > > selectively use kthread_worker only for RT gpu queues. And because
> > > > > drivers require CAP_SYS_NICE for RT gpu queues, this should not cause
> > > > > scaling issues.
> > > > >     
> > > > 
> > > > I don’t think having two paths will ever be acceptable, nor do I think
> > > > supporting a kthread would be all that easy. For example, in Xe we queue
> > > > additional work items outside of the scheduler on the queue for ordering
> > > > reasons — we’d have to move all of that code down into DRM sched or
> > > > completely redesign our submission model to avoid this. I’m not sure if
> > > > other drivers also do this, but it is allowed.  
> > > 
> > > Panthor doesn't rely on the serialization provided by the single-thread
> > > workqueue, Panfrost might rely on it though (I don't remember). I agree
> > > that maintaining a thread and workqueue based scheduling is not ideal
> > > though.
> > >   
> > > >   
> > > > > Thoughts? Or perhaps this becomes less of an issue if all drm_sched
> > > > > users have concrete plans for userspace submissions..    
> > > > 
> > > > Maybe some day....  
> > > 
> > > I've yet to see a solution where no dma_fence-based signalization is
> > > involved in graphics workloads though (IIRC, Arm's solution still
> > > needs the kernel for that). Until that happens, we'll still need the
> > > kernel to signal fences asynchronously when the job is done, which I
> > > suspect will cause the same kind of latency issue...
> > >   
> > 
> > I don't think that is the problem here. Doesn’t the job that draws the
> > frame actually draw it, or does the display wait on the draw job’s fence
> > to signal and then do something else?
> 
> I know close to nothing about SurfaceFlinger and very little about
> compositors in general, so I'll let Chia answer that one. What's sure

I think Chia input would good, as if SurfaceFlinger jobs have input
dependencies this entire suggestion doesn't make any sense.

> is that, on regular page-flips (don't remember what async page-flips
> do), the display drivers wait on the fences attached to the buffer to
> signal before doing the flip.

I think SurfaceFlinger is different compared to Wayland/X11 use cases,
as maintaining a steady framerate is the priority above everything else
(think phone screens, which never freeze, whereas desktops do all the
time). So I believe SurfaceFlinger decides when it will submit the job
to draw a frame, without directly passing in application dependencies
into the buffer/job being drawn. Again, my understanding here may be
incorrect...

> 
> > (Sorry—I know next to nothing
> > about display.) Either way, fences should be signaled in IRQ handlers,
> 
> In Panthor they are not, but that's probably something for us to
> address.
> 
> > which presumably don’t have the same latency issues as workqueues, but I
> > could be mistaken.
> 
> Might have to do with the mental model I had of this "reconcile
> Usermode queues with dma_fence signaling" model, where I was imagining
> a SW job queue (based on drm_sched too) that would wait on HW fences to
> be signal and would as a result signal the dma_fence attached to the
> job. So the queueing/dequeuing of these jobs would still happen through
> drm_sched, with the same scheduling prio issue. This being said, those

Yes, if jobs have unmet dependencies, the bypass path doesn’t help with
the DRM scheduler workqueue context switches being slow as that path
needs to be taken in taken in this cases.

Also, to bring up something insane we certainly wouldn’t want to do:
calling run_job when dependencies are resolved in the fence callback,
since we could be in an IRQ handler.

Matt

> jobs would likely be dependency less, so more likely to hit your
> fast-path-run-job.
