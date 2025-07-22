Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D987B0D41F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 10:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C408210E623;
	Tue, 22 Jul 2025 08:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jmaO4PIp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31CA10E623
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 08:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753171588; x=1784707588;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=j22Oy/bQnLJuvCSJd6nw1HjT7QAvp35WaC9Q7iXVpdo=;
 b=jmaO4PIpPN+M1FcpGoGxK6sjmGxg9cBZCLN3SsRkG4jYi524j0JOQdyF
 vr+HKK5C96/WEWdHXN/++TXemaIlR8ux/y3dakvkYFeFufVJZaj8PYAuu
 Kzzgub2Qr0zoUXjgub6my0xHfK8bR9aYV0XLQqvdZReuTz4GQRVq2hwgN
 st1m6gvqQ/jqsQ6tuYMzKwIBwO+gFyRvX1xDac6ibMcVG1PF0xzlLqM29
 zkE3UTxwjb5XNm7mPtdfXibCuBScjbTNtXySnNoseCQORnRbrdZYDUCQd
 zktEpXLgJDyyRW5WtXVWn+D+QoORja1GPLSMJ6cx4bZHpuUY3IkTy9FCu g==;
X-CSE-ConnectionGUID: lKE/Zd5PRFm9cSk54eFFVg==
X-CSE-MsgGUID: oPoUBTO6TguC0mAMlJTY7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="72864484"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="72864484"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 01:06:28 -0700
X-CSE-ConnectionGUID: zz1SrMWFTn2KgMz32Oh2/A==
X-CSE-MsgGUID: kBPgj1g9TJmbmhj9x9hZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="164746163"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 01:06:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 01:06:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 01:06:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 01:06:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GI1j33jxQvEAegXJQUxRadmIU+Ut/9Fa+bfqVRtrLKMf+Qw26s8Cmon5X1lV33Ff7el3+r50XJO1WadYLus9Op7zoYbblapZo3l2OZ1pUnv6mFN3bjcE7o/xB1gNFTygOLerk2/qY2YbdVUWaW5ul/mgS9nv7hU5pET0STzSgiNphIhaqsh3UU/k7xt80faPsxHY4nQX4i2IFqMAovePAJfpIWo4xntdhad2qD5leRCjiQwihJuXWaaOYTRsMGrEJyAS/dds8BMQBHzYF+Z6wx2roQz/EIi4fdakX/ORV5vtEN7hhgLkBo1Ld2w4yuIt0v/ygynoaH5AYeAG0l5OzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6LX2Lc2FZgzXAbG8ayxdVjr6zhT1E3QZbP3IFevjBU=;
 b=ddeQaN2h0nc5EvIyHvjaNdzf7i7Wpm/Z7L5Cfoklz64p2GDZOjonCQVAA2ERwE6GzIk6ZzyAC98Z2hyuhXqJUJF0ZHtoxpNIfTXHYlL6RacaBglxrtT+hST8GY3rAK0jka+cl+JasFrLsW/Cwxk1mBYr3iDPBrLNfTSXXbyQZ70ybulipIYbO0wApp8QJHuWkSxIApM4UoOjq9qmZXPzMFzveeKBM/Mk+NxWUCMUHQXk8EBAyU1v0gwSmKKWrU62/Xxdr+a6jcfHuUStSTCzf1vsc2YlI4UQv9ulNHG+mqqoI5NOPvw7yqm/Z3WDtxIx6P2hRS9m3g8NP/WzImexjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB6144.namprd11.prod.outlook.com (2603:10b6:8:af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 08:05:43 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8943.028; Tue, 22 Jul 2025
 08:05:43 +0000
Date: Tue, 22 Jul 2025 01:07:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <phasta@kernel.org>
CC: Danilo Krummrich <dakr@kernel.org>, James Flowers
 <bold.zone2373@fastmail.com>, <ckoenig.leichtzumerken@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <skhan@linuxfoundation.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH] drm/sched: Prevent stopped entities from being added to
 the run queue.
Message-ID: <aH9GwaquE7OR0HFY@lstrano-desk.jf.intel.com>
References: <20250720235748.2798-1-bold.zone2373@fastmail.com>
 <66a14b005fa3dc874f4f3261b93901af1292bde9.camel@mailbox.org>
 <e7c0f63678a93261182b69aa526217821552a150.camel@mailbox.org>
 <DBHNK2XQHUIW.TQHV41LR5D8I@kernel.org>
 <aH6B7JruWCkReaLw@lstrano-desk.jf.intel.com>
 <80f569dd3c42f11927324ea80e7c14ac2d3352b5.camel@mailbox.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80f569dd3c42f11927324ea80e7c14ac2d3352b5.camel@mailbox.org>
X-ClientProxiedBy: SJ0PR13CA0216.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::11) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: c4682e38-5654-4842-d09c-08ddc8f68e5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1hrWmdhTXprVjRKL2dmWHhWZm0zSUpLOGtoL0FEcGh2dVEvZE54WUkwZ2d0?=
 =?utf-8?B?cXJWcUhnUzRuZnlnQ1BMT1pKNnNuaE5RQTR6S0FwYTZSblo0bVlsekc4R0dB?=
 =?utf-8?B?YUZYN2x0dFVEWEQvb0pFejhIaXZFRFdpa1huUXM5ZU9JTU9kMEhuSytYQldF?=
 =?utf-8?B?ZXYrdVFHSHgxT1NZOUprT3d2bDlHMEVScmdTTWZvSk84bUtGUmJ2RFkycU91?=
 =?utf-8?B?WGhLa08vWXlwdXpkK3hEbUtvamRYMmhtMURaY001NjVxTWlmUDE4akF2RTFr?=
 =?utf-8?B?N2pXaTB3V0pLdmo4VmtVcUx4UEtManZrYlR3emZuY09xL1ZReXhHbUY3eGNa?=
 =?utf-8?B?bVVsWFQ1cnRtZUp2S1ZiZS9EQ1dpQ2dUWTRCVmFwRDlJN1BKalBUMEY4RW9p?=
 =?utf-8?B?bVVkU3RyZGNzM2RZRyt2N1grRHB0YjFrUzdoR29RVS9RWDhpOXJ3c3FDSWxn?=
 =?utf-8?B?YlVpNEVsdVVVTWlhR1NmbDI2bnRlOEtpOEt5bmFja0MvbTJFek03YTQzRS94?=
 =?utf-8?B?V0thczIyc3I3UXQ3a29ETW8zTFExMkh0VmdQamdqV2hqQnRLYWNWRkI4Mldi?=
 =?utf-8?B?QjBRalNmbmNHb0pwV3phL2dKYmc1Uk1CcGgzZ2RTR3NzNytrZkhoQmo5aThT?=
 =?utf-8?B?aERwWTczVUo1NVZLeHpndktGcU4rZjAwamFXVGxRNm4zbTBaSS9xQjFIVDNK?=
 =?utf-8?B?b2pnSnVWU2dDK2N0T2RoODNrTGpmQTBUOVEvM2pjcWhaODgzSHNxUWlnVnhk?=
 =?utf-8?B?YUk5Nk54WmcwRFVTdU9UdXArT2hWb1grZTUzS0RqNHpnbDNnR2RyS01KSWgy?=
 =?utf-8?B?WXVLbFUxanN6WTNCKzFlYytQeS8ycFE5K2V3TU5Tc1BaV05XeVJIYzhHTU1i?=
 =?utf-8?B?dmxScmFLbDYwdC9TQyt1dTV2dU8zbVpscVRwb0ZNU2lQVkJ0Rjd5dTBIMGlL?=
 =?utf-8?B?bExFd1IyRld2YWN2TEIvaWNrWWtSaDA4RVRlMlJ5b05vOTMyV094aHV0dUxm?=
 =?utf-8?B?ZHJ0em5kV1p6eG9UOVlXMUdVWDRENVNnUDViQ3o5TFp5dktPQW9kOVE4OWU3?=
 =?utf-8?B?Smt3TkxLUERmNUwzb2Rvdk5peHVYQTNyOHR2UzVoL2gxSjQvem9CbnZYejhh?=
 =?utf-8?B?QlR2N1FFK3cwV3krTWptSUhwR0dlWmcvRmhVVmNrT2lZRzBSZGk0a3RWZlEw?=
 =?utf-8?B?cm9ONVhQcGdpcXliNnppcHkyMjdzZi9tSVN3cjErY0wxeEN5dnpBU2svYVNQ?=
 =?utf-8?B?eGplUGxTRHJHbXJZWDJ0d05HYk5JWGtNRzVBNFhsTGR5YkxDTmhjTlA4UWw3?=
 =?utf-8?B?QlRUSDBETHZEaUJxNmIzdjdkSmE3aWN5UzI1U1BSd0x6V3JKbkZwTU9CSHZy?=
 =?utf-8?B?aXJjTGxhbUNBRTA3VW1uVVF3YkRHb082RnVCRGVrd0ZJZ2lGbGk2Z3pzdnU0?=
 =?utf-8?B?ak5OUmRVRWl6TEpLVUJiS21rdFdpcHhRdGNNS1liMThUY3NWbTdZRkJiZS9P?=
 =?utf-8?B?cHphUUFZNUYvcGNDU2phM0hDUjRaVlRjU2xUYXZod2RLbmY0V2tZZDFtT2VC?=
 =?utf-8?B?T3RWVURXelFhL0JYYnFoUHFzOEdJNUJnckFQTjlhWFBSQWtabWY0SVZFWnNK?=
 =?utf-8?B?SEN1Q3hiSGhkcUdMR2d1VzJNM0tpU1lPUENrcENITmFOQi9mMHhOYkxEek5N?=
 =?utf-8?B?WEZWODdNanBwbGdoSnJjb0VMd2JmSXVzSTdBSVJLbHJSVVNNUkM0czVibkR2?=
 =?utf-8?B?SHQ3VGlicGQzZWJ6QWhUM016RkVrM09GS1JMSUtMTXgyYzA5QlVHYUpUSDMy?=
 =?utf-8?B?em9ZTkF1ajFDc0dHeGJqZU1vTlduVHcrL0wyblNOdkhMTmZBOUM3cXhmQnNE?=
 =?utf-8?B?Y0RmYXBlNEVrOVp0UkdIYWs1Z2tYTkhZejlKN25SSzltKzhCbmF2NnQyVzBF?=
 =?utf-8?Q?e5n7M3EV1Q0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VExFMithNjF2S0xTSVRaVVBQeFBReVUyVkhYMXhuN0dIUURSTWNSNEp0SFhK?=
 =?utf-8?B?TCtYU2c1ajg5bFN3NHJmcit1bElrUTdzalMvNjh4S3Q3eUQwS2d3QW5mcENF?=
 =?utf-8?B?djVPNTk4VjZ3b0UwaE9RMWs4Vlg5V0tWRndEbi9SbTVqMzY2bk5hSERQREQr?=
 =?utf-8?B?MlRsNzl6VkgzSmllUlpFWm0wWEsvd2pxUzdiblE3RytKOUMrdURqUDFNUytS?=
 =?utf-8?B?bHF1aDhmMUdFWThWdXh5aXBQM1Y0eVB6NzAwT2Q5cktIMjV1V1g5dmdHcG55?=
 =?utf-8?B?bHh3MUpFRGNkbkNwbVpYelMwS296Z2R0cnFlWW13dzlYOWpZN1c5NlAvM3l5?=
 =?utf-8?B?YXc3QzVubnd5aGpvbHJ4L0gzSmVTcVY0U1JWRUFPU3hRMU1tTzdlbnVqRUd0?=
 =?utf-8?B?RUhpZE1WbFNsZXVhSnI0aExtTzZaWnBBSjI0VEEvQmg0d3NKK3FBYWZIVSsv?=
 =?utf-8?B?bWtYblFEd0VvT2t6M1JFdmt6aDJzRGdYNk11MktQbUtzOVJwUmVNQm9OanFK?=
 =?utf-8?B?UVFGajdXN3F1c3hLY1Z1U3BoZ1pLOHpOeWdCY09HWTFhS2JrekhrMmZJeE9E?=
 =?utf-8?B?dmtibUZEVEJucjNRbFEwLythL2xtYVoxNHJCOEN6ZGtUYjdsWkhVcldSR25Q?=
 =?utf-8?B?YTdnbWZ1UVRLbmdNZm9LUjFHaXVvS0N2MkI0NlpKS2w3ZDRDampSVkloc2hJ?=
 =?utf-8?B?eDV3a0JSVjFLSmxrTEFkZmxoSUlBTU1VQ2hzbUhEb1ZVMGVZTVNHTm9KMCth?=
 =?utf-8?B?VXlxOWpHbFVMb2hacjFtdlRFVk9CZ2FBQWJrSWlqc0gyNXZXWWZreGx0RXQv?=
 =?utf-8?B?WENxMzJuV3hJMGJVS2FnZGlCd2NGbnlCRFNsbk5ESHRySy9xN0Y5YStiaUND?=
 =?utf-8?B?a25GTnltcnpqNFg3QTFEcUZFTHZZd2w3WjUrTzZTK3lZZkZsdm5GNFd3OG4r?=
 =?utf-8?B?RGJtUFR4QnpKeDdjMnI3ZVQ2SDB3RmJBMUs1QTlEMW9SMS9wam1USXNnS04v?=
 =?utf-8?B?SnlnUHlidU1mLzI0VHBnR3ZjdllRNGFQUFM0Y21Ic0JPQmEvWGIyRFZaK0dy?=
 =?utf-8?B?NHNjT2lLWDVISjhvL1lubGJ0ZDBndmh1RkE1VW5zSUNETWc1ZWhZYWFPYnpU?=
 =?utf-8?B?ajdwZUFud1RYMjVpN1M3dU80a0lKM1ZpajYrbnFKeHpOczJSL2UvazUyenpP?=
 =?utf-8?B?aTV5SlNFMHZwc1JJUHZ5b0pETDRlQW9BUGM3NGovRFZJZVB5R3ZXOFhlU01F?=
 =?utf-8?B?R2t1MERNU3lNSXp5blE4YmNacHNHNTRSNzRKaVV1Mnp6UERpZnIySkJBTGo4?=
 =?utf-8?B?elFDVTF3M21YQ2prVzVra2l5aHJSbGFTbStzODAzb2x1eDRJdFJpZlZPNnY3?=
 =?utf-8?B?TEdpc2pzMlVJTW5vYldoeTZ5Mkg3R3J3WnI3ZWl0TDdLMmpiWTBZZ2htTmcy?=
 =?utf-8?B?UmR6djltNStoSGM2ZmhKVlpkVVk0dFVXVkt5UjFodlBOMVhDV3hhR2NqRTYy?=
 =?utf-8?B?N1R5cmN2TkxkazY2T1VBaWY1dE9RRUR0S1dxTUtrMkFXdmlBeHpTU0M3WUMx?=
 =?utf-8?B?UURoOWh4OXZmRy9zRXJxUFg2VVJnK3psTGZjV2p1T3JhN2lMMWxUWTdtYkpO?=
 =?utf-8?B?WlRPZktTMzNUbjI0S0tueEtyT1F1WmJmT0VCM0hPWko2TjVaL2gxaGlFcHdI?=
 =?utf-8?B?LzNlNHlsY3RNc0Y4MGlKTkFIaWhLL3pTYjlKZmdsTncwOUowRHA3YXlWb0ZT?=
 =?utf-8?B?alZDZ0o1YlV4M3JVaFNXWFJYRzZWMDEwc1AvSTVTdVJKd3N4NVZ2OGZjazc4?=
 =?utf-8?B?SzYyblJuRXdJaDZxODUxMUhxZ25oNFBTdmNTMVV6cExVOWFiZThhOEcrNFk3?=
 =?utf-8?B?cGtWcWxhTGRMQzBEdEdYWWpob1RLNURsM0ZWdVUzNEVMSXh5NUorUGdqQzU0?=
 =?utf-8?B?NnZOTmlod1VEeXZHdUk3Qy9qT1RMNFNZVWxIVjFNN2JscUJqdDBSZ01LdWZu?=
 =?utf-8?B?dlFmaWY4LyswOE5mdzlOSGZnNHNmWElqVFRqdDlaVXAxTVlxVWhHL2d2V0ZE?=
 =?utf-8?B?S2JlbEZTK25wM0VFWFBzbm9xSFFQQ0Z4VlArUS9KQytCYnNocUorOSt0WHc2?=
 =?utf-8?B?TFhleTZFNWFjMXRranQyNm44cEh5REFGOHBNYmYvbzlXL21sR044LzgrdjFH?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4682e38-5654-4842-d09c-08ddc8f68e5b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 08:05:43.4004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2tAGgZ4AK+1J4I0ofsiS+Wvrqs+WFsKdEGY8qfMB/6A8s/HE8/SMBmREZJ/geoJaCYuPwnezdFxKv5TDnmXL/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6144
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

On Tue, Jul 22, 2025 at 09:37:11AM +0200, Philipp Stanner wrote:
> On Mon, 2025-07-21 at 11:07 -0700, Matthew Brost wrote:
> > On Mon, Jul 21, 2025 at 12:14:31PM +0200, Danilo Krummrich wrote:
> > > On Mon Jul 21, 2025 at 10:16 AM CEST, Philipp Stanner wrote:
> > > > On Mon, 2025-07-21 at 09:52 +0200, Philipp Stanner wrote:
> > > > > On Sun, 2025-07-20 at 16:56 -0700, James Flowers wrote:
> > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > index bfea608a7106..997a2cc1a635 100644
> > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > @@ -172,8 +172,10 @@ void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
> > > > > >  
> > > > > >  	entity->oldest_job_waiting = ts;
> > > > > >  
> > > > > > -	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> > > > > > -		      drm_sched_entity_compare_before);
> > > > > > +	if (!entity->stopped) {
> > > > > > +		rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> > > > > > +			      drm_sched_entity_compare_before);
> > > > > > +	}
> > > > > 
> > > > > If this is a race, then this patch here is broken, too, because you're
> > > > > checking the 'stopped' boolean as the callers of that function do, too
> > > > > – just later. :O
> > > > > 
> > > > > Could still race, just less likely.
> > > > > 
> > > > > The proper way to fix it would then be to address the issue where the
> > > > > locking is supposed to happen. Let's look at, for example,
> > > > > drm_sched_entity_push_job():
> > > > > 
> > > > > 
> > > > > void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> > > > > {
> > > > > 	(Bla bla bla)
> > > > > 
> > > > >  	…………
> > > > > 
> > > > > 	/* first job wakes up scheduler */
> > > > > 	if (first) {
> > > > > 		struct drm_gpu_scheduler *sched;
> > > > > 		struct drm_sched_rq *rq;
> > > > > 
> > > > > 		/* Add the entity to the run queue */
> > > > > 		spin_lock(&entity->lock);
> > > > > 		if (entity->stopped) {                  <---- Aha!
> > > > > 			spin_unlock(&entity->lock);
> > > > > 
> > > > > 			DRM_ERROR("Trying to push to a killed entity\n");
> > > > > 			return;
> > > > > 		}
> > > > > 
> > > > > 		rq = entity->rq;
> > > > > 		sched = rq->sched;
> > > > > 
> > > > > 		spin_lock(&rq->lock);
> > > > > 		drm_sched_rq_add_entity(rq, entity);
> > > > > 
> > > > > 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> > > > > 			drm_sched_rq_update_fifo_locked(entity, rq, submit_ts); <---- bumm!
> > > > > 
> > > > > 		spin_unlock(&rq->lock);
> > > > > 		spin_unlock(&entity->lock);
> > > > > 
> > > > > But the locks are still being hold. So that "shouldn't be happening"(tm).
> > > > > 
> > > > > Interesting. AFAICS only drm_sched_entity_kill() and drm_sched_fini()
> > > > > stop entities. The former holds appropriate locks, but drm_sched_fini()
> > > > > doesn't. So that looks like a hot candidate to me. Opinions?
> > > > > 
> > > > > On the other hand, aren't drivers prohibited from calling
> > > > > drm_sched_entity_push_job() after calling drm_sched_fini()? If the
> > > > > fuzzer does that, then it's not the scheduler's fault.
> > > 
> > > Exactly, this is the first question to ask.
> > > 
> > > And I think it's even more restrictive:
> > > 
> > > In drm_sched_fini()
> > > 
> > > 	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> > > 		struct drm_sched_rq *rq = sched->sched_rq[i];
> > > 
> > > 		spin_lock(&rq->lock);
> > > 		list_for_each_entry(s_entity, &rq->entities, list)
> > > 			/*
> > > 			 * Prevents reinsertion and marks job_queue as idle,
> > > 			 * it will be removed from the rq in drm_sched_entity_fini()
> > > 			 * eventually
> > > 			 */
> > > 			s_entity->stopped = true;
> > > 		spin_unlock(&rq->lock);
> > > 		kfree(sched->sched_rq[i]);
> > > 	}
> > > 
> > > In drm_sched_entity_kill()
> > > 
> > > 	static void drm_sched_entity_kill(struct drm_sched_entity *entity)
> > > 	{
> > > 		struct drm_sched_job *job;
> > > 		struct dma_fence *prev;
> > > 
> > > 		if (!entity->rq)
> > > 			return;
> > > 
> > > 		spin_lock(&entity->lock);
> > > 		entity->stopped = true;
> > > 		drm_sched_rq_remove_entity(entity->rq, entity);
> > > 		spin_unlock(&entity->lock);
> > > 
> > > 		[...]
> > > 	}
> > > 
> > > If this runs concurrently, this is a UAF as well.
> > > 
> > > Personally, I have always been working with the assupmtion that entites have to
> > > be torn down *before* the scheduler, but those lifetimes are not documented
> > > properly.
> > 
> > Yes, this is my assumption too. I would even take it further: an entity
> > shouldn't be torn down until all jobs associated with it are freed as
> > well. I think this would solve a lot of issues I've seen on the list
> > related to UAF, teardown, etc.
> 
> That's kind of impossible with the new tear down design, because
> drm_sched_fini() ensures that all jobs are freed on teardown. And
> drm_sched_fini() wouldn't be called before all jobs are gone,
> effectively resulting in a chicken-egg-problem, or rather: the driver
> implementing its own solution for teardown.
> 

I've read this four times and I'm still generally confused.

"drm_sched_fini ensures that all jobs are freed on teardown" — Yes,
that's how a refcounting-based solution works. drm_sched_fini would
never be called if there were pending jobs.

"drm_sched_fini() wouldn't be called before all jobs are gone" — See
above.

"effectively resulting in a chicken-and-egg problem" — A job is created
after the scheduler, and it holds a reference to the scheduler until
it's freed. I don't see how this idiom applies.

"the driver implementing its own solution for teardown" — It’s just
following the basic lifetime rules I outlined below. Perhaps Xe was
ahead of its time, but the number of DRM scheduler blowups we've had is
zero — maybe a strong indication that this design is correct.

Matt

> P.
> 
> 
> > 
> > > 
> > > There are two solutions:
> > > 
> > >   (1) Strictly require all entities to be torn down before drm_sched_fini(),
> > >       i.e. stick to the natural ownership and lifetime rules here (see below).
> > > 
> > >   (2) Actually protect *any* changes of the relevent fields of the entity
> > >       structure with the entity lock.
> > > 
> > > While (2) seems rather obvious, we run into lock inversion with this approach,
> > > as you note below as well. And I think drm_sched_fini() should not mess with
> > > entities anyways.
> > > 
> > > The ownership here seems obvious:
> > > 
> > > The scheduler *owns* a resource that is used by entities. Consequently, entities
> > > are not allowed to out-live the scheduler.
> > > 
> > > Surely, the current implementation to just take the resource away from the
> > > entity under the hood can work as well with appropriate locking, but that's a
> > > mess.
> > > 
> > > If the resource *really* needs to be shared for some reason (which I don't see),
> > > shared ownership, i.e. reference counting, is much less error prone.
> > 
> > Yes, Xe solves all of this via reference counting (jobs refcount the
> > entity). It's a bit easier in Xe since the scheduler and entities are
> > the same object due to their 1:1 relationship. But even in non-1:1
> > relationships, an entity could refcount the scheduler. The teardown
> > sequence would then be: all jobs complete on the entity → teardown the
> > entity → all entities torn down → teardown the scheduler.
> > 
> > Matt
> 
