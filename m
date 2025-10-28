Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 875C0C14BFB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 14:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D7F10E3DA;
	Tue, 28 Oct 2025 13:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eu4bx+OO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2108E10E3D7;
 Tue, 28 Oct 2025 13:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761656704; x=1793192704;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tSJmkNA+D0G7SmWEqFb0fBJQUM9ukapmHEcLxOhFXA4=;
 b=eu4bx+OOHDnGAW7dREQYggCZqCE6TuCTrrmYAPHLGG40Vmk5ydmcXPgY
 2CZa/vM2rglsvZ45/6dE3w3twuEwyKZG78DUFKPaqsE3j+qOxBpfDgTU8
 HYa9WSE4jAdpBQVwemBDzyD+Ah+LUwWiimL1PVXmeHkV9ebqcQwpjUYVJ
 zTnKtsXq6xQEe6RhXReezfBNmUnIMIDQP21DjXJnqalX2Rwa8IOcGvpjY
 Bj1mEjVyojmhQ/7fGQsD7Wbfl4opp0HLwOf63uP8k1eoirLfiZtI/yKJ8
 /euktYIw14XJBlouX3/LRIeB9r9wCvIyb463AyTyeWUN3Kl6GaTIpi1tx w==;
X-CSE-ConnectionGUID: QFaNWsIoR7uR+8YXtDI+Vg==
X-CSE-MsgGUID: S1u+EFJZSQCyYMRavwIRtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63681438"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63681438"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 06:05:04 -0700
X-CSE-ConnectionGUID: N61ZvtqDQP6SxuFu5VR6Aw==
X-CSE-MsgGUID: QwVYNVbBQK2RBqDAvwrCxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="216000069"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 06:05:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 06:05:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 06:05:01 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 06:05:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QMMWoAVRHTps6d86QfG8DInQ86wr6PRBDAAo9FdpflXbq/Kfu8hhuyhZFJdQ0jEknOViB/3Xo20w9q09evXbzPVz6EnKBig25hq/l/DbZ2QA7KLq+cYap4fJWPWkmXv6BlttDLz89SRXkNcQTSKtDdZN9pwgIu0pZvjx6Nl1dNgjB3gZYvy/tlPIlPWD2AHxkhFRXizZ7bqLz6i2mNxVT4r/6K2VA7+9B/0EHIPU3gftpBN474suqbOgkX5fjQd60A5KFIyCYPeZM+cBp3CaaSX5HeseE03v/2hJOH7FgqCkS6khDcoXaCV7vMP0OSyWDBGDcBNBFRgNA8Wh3TwuTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IS0/uongaKU4BYgOh9gKpLPUdMcaaBbA7RYM49pbgW4=;
 b=vP5HXsYnJt5wXV3TrnTQDkiOMXm5nV4U9Cs/6Rv54lC75pJrKFyHSzPMvLEaa4D2mcrM3vYZZUbk0ENQapuOlxkvS+tcrpT/OZbgrtIfR9WfksAwm89sZS10bXp8XCxqQTQHrtfrgJigmwCbFN57I2OaEpCNpLJASJZKWGF8b/87rTOmd1BP8OdikFV77jmGMj8KnLa2dTwL2/GkR8vD3h9DdKq5E98N5/pQUgsGNvJwmauK/ijVKcsRNxRpff0sZNw27rZu8OM8eYcgmTOhwC027crhv8x94N89ctSX5HLcknGzFGtZi/Q8bdEIBJKNrB7JJIVq0dDb0wriHHU/ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SN7PR11MB7601.namprd11.prod.outlook.com (2603:10b6:806:34a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 13:04:58 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 13:04:58 +0000
Date: Tue, 28 Oct 2025 14:04:54 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH v2 15/26] drm/xe/pf: Handle GuC migration data as part of
 PF control
Message-ID: <lpsgfkendbj3p3vuwy3ifjt63jqvfovuc4uc4qiv3rjiqqqhfb@owshpnxntkvt>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-16-michal.winiarski@intel.com>
 <a8312322-8eb4-4262-b253-d598c819bc17@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8312322-8eb4-4262-b253-d598c819bc17@intel.com>
X-ClientProxiedBy: VI1PR0502CA0030.eurprd05.prod.outlook.com
 (2603:10a6:803:1::43) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SN7PR11MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: 03097401-7794-4c77-87b9-08de162298a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|27256017; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3B3QzdhV2dEbTlCMWpmQW9IT2E0UDdVUXJ3S0pzSXVnaDNVczZ6UmZ4QWsy?=
 =?utf-8?B?MzhHNnR0UVdYSk5GTjF1R1prZGpiOVhFT0xWL0ZUejltenptQmRlSjBkYzlZ?=
 =?utf-8?B?d05HOGM1eHBDUVFZV3FPeEh3SWJDVXFuTTl6anlzSkZFMnJpVXRLUEY2cUM3?=
 =?utf-8?B?OHVpVUxGblF4dzNpQTFjQytVbHlVV2x2dmdMRGtUalJYVm0wTm5FbUxkZ3Ux?=
 =?utf-8?B?YklNbVpJU3AvOC94bGtYeXhiVjNQNmlPaGRacWtCeEllRlJNbkJiTGtqQm1a?=
 =?utf-8?B?ZTkwV29COWxCZCtUN0hLKzZON29TRUNrVUJCZVUrVUFZL2VmY3hLNTZReTRD?=
 =?utf-8?B?WFlhdllORXI3K3p4MkEyNkJvOW5JMXlTN3ltOGRrNVFwSTB6QUM2bmtNWWZB?=
 =?utf-8?B?YTFlM3VUMXJLc1NheVhBR3VJeTA4TUtNc0ttN2RweUxxK082aXNTNk5nNVMz?=
 =?utf-8?B?UTA4NllvZlg4QVNjNG1MTFl3WHpGaTh0WWRzbU1LR00xOVZENnc5MmcyVHBk?=
 =?utf-8?B?amxaV0ZpN3NpT3NFSHFEZ2o2LzBncHNabVg0YXROZ0RZTlRvdnBuaXplZVll?=
 =?utf-8?B?ZHhRd0lEU25zR3YwZ1NkYkF0M01QaEdYR281WXRISks0clAxNjR4Yy9TL1Ri?=
 =?utf-8?B?cjFlQ3VwbS9FVTVUNDM1dlVQRElxbFpELzRGcnFmK2FvZC9qSjFTYVQzTzdW?=
 =?utf-8?B?dFB5NmMyaEVRb2FXcXU1UU0vTm1BRnVEdnB1Q2VWaTR4WjhKN29zL0llZXJU?=
 =?utf-8?B?UTgyVGpaT0VzY2I0YUx3aHdLVC80TlV0VmV1bGJJZkFaQ3ZndGpFN2ZFOEwr?=
 =?utf-8?B?RjByS1V6OTF6YUt6UGZTMmFvL0lOMTdDc2NOMGxGT1czM2pLU0dtMFk3a04r?=
 =?utf-8?B?MHhZRDJ3U0p5K0IwdndMOG5YSTRFMXEycVFEYTVCN2k2d1p6TzRoRXlvNUpT?=
 =?utf-8?B?aS9RRWxyM3NnWklPL3ZFQUJyQkxTRHY3KzRpdGFVby9LNThHWGZyemRBL0ty?=
 =?utf-8?B?T2ZPaHptamplY2tqVkVzOXU3RTFuQTE3dzRxVVNhNTBhYnlRYVdRYlk3MGNL?=
 =?utf-8?B?d3UrTXkxTXQvN2tyS01JbVRXRUUzdlZ6bkdXRWt3QjVRc1k5Y3J0OWdCdGpP?=
 =?utf-8?B?Ri8xNHY1Yit2VU8zT1VaRHhPckFRbk9hdW1TWitVTEwrbmJwdThHN3I2Wld0?=
 =?utf-8?B?Q1UrNGdZSWVmVUtGMU4vZWU2VjVhNzJiMDdGL09vQW50emNibzVQWE5XNTJP?=
 =?utf-8?B?bzBaMTh2RE5kbTdsUHVjUWRIV0N4aVZhblpzL0pOejgyakEwVlhxVDdqdWlV?=
 =?utf-8?B?VEFYK0tsMDBBa0UzeFNFS3lWM21sQTNBNVJvalI4QTcxNDZXcHczeHdrUnoz?=
 =?utf-8?B?S2doN3B0Vkx6Y1F1VHBwODJ2ZU1mdnhTMTdqN24rS2JSTG9BM01OeHdWYWNR?=
 =?utf-8?B?K05hSWpiTnE4V1Mrc2NhQ3daRnNVcmM1QWRsekd3UlNONXpFeStwTVZrNitG?=
 =?utf-8?B?aVIvZERhRisxcWQyUGdyVFNnY2hjSjBwaXRUS0M4aVpnL1dMd1orbWYzL1Z6?=
 =?utf-8?B?WFRMVDBXZmwxWXRyTmszZjUrbzY5amMzbkNVc1hmc3NLaHNJNDljMWdXTU9Y?=
 =?utf-8?B?cGswRHBNOEdQdWE5T0JZTXNMRm5DRmpqbjU3VnpFQWF5UEhlNndOaGdNVkdj?=
 =?utf-8?B?L3hPY0VDWFJhaGNGbGQ0dFgwL0UrRG8ybmw0SWRVdEttU0ZKeXBQOEFVQ29Z?=
 =?utf-8?B?a2U0QmIySGJWS2ViOWRhNGs4eU1oWExtSXBKUS9IQXEvUEw4RUVML2pEOHQ1?=
 =?utf-8?B?Q1kyYlR0SGdtM1Rkby83QStZR29kZFF0OW5ZRzJBZE1ENDVGYjhQOEhMWjhS?=
 =?utf-8?B?WHU1QXk4U09xMzNzRDlsZVJBbHU3bUhGZE15ZkdySWhUQWdIVDRTZklPYmpY?=
 =?utf-8?B?eFBYSWVXdEJ0TzJaSVhnVDJCOUUyckYxeUkvYy80czRlVHZxQnNobjE5VVdY?=
 =?utf-8?B?ZXg3MnQ3anZ1WFVjcjFNTGtZeWZKL0lXRUpHeEFVUDk2d3h3SENtOUl0Y2lQ?=
 =?utf-8?Q?c2K5fb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(27256017); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDZYTmpFV211RjdTVjRtaWhWaE41aWJHQnZaS0ZGNVR3YlY5WktnRWVxSzZH?=
 =?utf-8?B?M2J3YWRHbVlHRk5wMXJzL0R0dEU4Y2toNWp1eUx2VmduMXVOZHBGaW9SWjZ1?=
 =?utf-8?B?VUt5RHRnTzVhTWtzcTQ3OFNCQmFFdkkrdUVvNjVsUlc0dkpNSHlTSTk1ajQv?=
 =?utf-8?B?aS9xaVhXUk44NDlLMDE5eG5tamJVaGp5TFd6S2FUU0R1dGJCaytoVFM2QmVW?=
 =?utf-8?B?VFRFYVJFNmFxUER0N0xzOElXTmo2dE1PSnZKWlh3cGNmY2Q0VXp6TWFGa3RV?=
 =?utf-8?B?ZFpPbE1CemQxVTlndlJqakRiUHUrK01hYTFlMWx1Nm5VdzhVMDBoYmJpSHpT?=
 =?utf-8?B?RFo3THVzTFRQeHB2MWdHemEvVEFpekhIOXJ6SHRqL1pMRklqK2hLUGlveER2?=
 =?utf-8?B?dHdlZDNDdFA2RWd6R2dYUjAybFJGck9LRXVQTTQydDBlZTNaYWJLSSs0dnF6?=
 =?utf-8?B?WTllYXByUVJPNDZwdmE3dG5sMmN3dktGWGMrTFZFOWxhV2x5ZEpES25JM3ph?=
 =?utf-8?B?b1Fid3JReklSYWxBRU40dTFCZFdGUE1xU1RCZ3Y4ZlE3SkNQdUR6em43bmV5?=
 =?utf-8?B?cmN3Z1dZbHRmWTVRdlJlS2xaMmxrWUhGUHB4VTZwdElzYjloc21VZ0xaUXc3?=
 =?utf-8?B?WVUwVnp5SDY5QW9JR3FiN3RHaVozb2YrL202dkhoUWgzemVncnprVFlMOEk5?=
 =?utf-8?B?aWMzdnpDL3dabW5uMTkzaHZOM1gvV3VzaWZMMG5HRlZWSWdVUm92Z1Iya0w3?=
 =?utf-8?B?T1d4QzMxay9LaER3c2lPVkNrUkVHbjU5ZXNkM1Z4VCt0ZmU3REhROGQxd21u?=
 =?utf-8?B?T2FhT0N2ckR3Zmg1aldwblBZL0lSbUxzSzJwR0RFQkIwNCtOVm5LRnorR1ht?=
 =?utf-8?B?eWxtWms0d2tGOUFYWXRIOFZyQjV1S3JDNjJ5Kzc5SWVMeUd1VFR2ZWRNR0NE?=
 =?utf-8?B?L3JyUFkwWTVhOXZhRjdrQTB6VkEybEN3UXFxNlA4Zm1acmRReWtQZmdZdXIx?=
 =?utf-8?B?Y3Zrei95SDdLRlBHVEd3cTRCSmRPRC9uVHR5UTRYNURUQktIRk5JdzJSMHFC?=
 =?utf-8?B?ZlBXbDI4V1Y5SmpGV2VKczhVMTlpbmFRbzVHeXVUL2MwUlRxSmVBYU5MTEdN?=
 =?utf-8?B?MlI5UzV6VnNuY0N5MFlFbVN3WHRtcjZwRWRSZFBsN2pmUVNJdXNKNG5JMlor?=
 =?utf-8?B?SElVcFhNZzZaR3o3MmsvKy9aNVdaaXkxSVNoOFFGZEViZFFJZFNOb25Ga3dt?=
 =?utf-8?B?VXMzVXpyTkFLbm9sclJDMnkweHRPTmI2STV3d2VScTA5OFNhSXZkZkVIWVl5?=
 =?utf-8?B?RGduREpCTTU5YUNsRk9BUUVhTmRIVUtrTDFNai9ZVmpYV1F6aHVBdk41QSsr?=
 =?utf-8?B?cmhGOVV5TEZMdHc3cC9mYmIvSEZ0SXNMQWFjN1VHcmw1YTYrWEh1NS9Vd3Vi?=
 =?utf-8?B?Sk1JSFBybnlBa0paVGFJRXJCR0J2MEpGRUJ3dVRBTWxheVh6d3d4T2VWU09T?=
 =?utf-8?B?QlJtRFdxYktXNm0yZkdvcDNQdWowZjcreEVNS3ZldnNhbWdDNUJrdVRHN3VB?=
 =?utf-8?B?cmtzdFR5blhtV0treWd3NytlZ0Z4MmZGRWVxVEFnTW13aFZ6OHpWdFNhZlhW?=
 =?utf-8?B?WkcvZ1FxcVdqa0dYR2JQR0tIVU9vUnRjWXRvb0xBN1NwNkVheC9tOEdCSk1a?=
 =?utf-8?B?aCtoWFhyOW1hSllaN3lLbHF5L2xtWmtpZzFQcUlXU0h1NWJvblZTNnFlcU4x?=
 =?utf-8?B?MnhDTnhaOGV4REdvR1kxQ1N6MVdWTEQvRjVoaW80bjBNZ2VYc3U2QjVsT1Jq?=
 =?utf-8?B?aEt0UjZwVWVPYUZjUGVQMDJ0bGU3Mm96NXhGU3hwMkNCOFp0Q29tWU9kVXdi?=
 =?utf-8?B?dGJuZXpJM2NqWjRLUDVxR29EejBBbjlhVElmNEdXQU00cnRRZ2xNZ1phZUdx?=
 =?utf-8?B?QzYzN2xpWVVncUZTNmZTU2NSQTVqeUkzdDVRNitnQ0pPVys4cXNHZG5nTVFL?=
 =?utf-8?B?RWowdXJlamdQQyttemRNejdoMHU5ZHdUVkdzTXpicmVPUUF5SmdzYTR5UVRt?=
 =?utf-8?B?bzNXa01KZ1QyQlVoZEJuSWhRckoyWlhTT1o4N2pyZ2RJQ2V5cDE4cWRJT0hw?=
 =?utf-8?B?TUl6QmZQbWFWVUFqREpNanRqSHNuT1BHVldudmR1UEoydWw2cmtOSTErUUFH?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03097401-7794-4c77-87b9-08de162298a8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 13:04:58.2282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkagCgOgyokr32ziykyHCwdJePX7WJN1/K1/tih6QK9euW3W00fkwcxF+giN5qznaEHS7iAizXj1YJ3Y/AQlAYDQ9yNO6ioBH1tSSYJOTsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7601
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

On Thu, Oct 23, 2025 at 10:39:12PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/22/2025 12:41 AM, Michał Winiarski wrote:
> > Connect the helpers to allow save and restore of GuC migration data in
> > stop_copy / resume device state.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 26 +++++++++++++++++--
> >  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  2 ++
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  9 ++++++-
> >  3 files changed, 34 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > index c159f35adcbe7..18f6e3028d4f0 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > @@ -188,6 +188,7 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
> >  	CASE2STR(SAVE_WIP);
> >  	CASE2STR(SAVE_PROCESS_DATA);
> >  	CASE2STR(SAVE_WAIT_DATA);
> > +	CASE2STR(SAVE_DATA_GUC);
> >  	CASE2STR(SAVE_DATA_DONE);
> >  	CASE2STR(SAVE_FAILED);
> >  	CASE2STR(SAVED);
> > @@ -343,6 +344,7 @@ static void pf_exit_vf_mismatch(struct xe_gt *gt, unsigned int vfid)
> >  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_STOP_FAILED);
> >  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_FAILED);
> >  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESUME_FAILED);
> > +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
> 
> this should be in one of the previous patch

It is - note that we're exiting this state twice :)
It's a leftover from previous revisions (at some point we were
introducing FAILED state here). I'll remove it.

> 
> >  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED);
> >  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
> >  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
> > @@ -824,6 +826,7 @@ static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> >  
> >  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> >  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
> > +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC);
> >  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> >  	}
> >  }
> > @@ -848,6 +851,16 @@ static void pf_enter_vf_save_failed(struct xe_gt *gt, unsigned int vfid)
> >  
> >  static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
> >  {
> > +	int ret;
> > +
> > +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC)) {
> > +		xe_gt_assert(gt, xe_gt_sriov_pf_migration_guc_size(gt, vfid) > 0);
> > +
> > +		ret = xe_gt_sriov_pf_migration_guc_save(gt, vfid);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > @@ -881,6 +894,7 @@ static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> >  	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> >  		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> > +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC);
> >  		pf_enter_vf_wip(gt, vfid);
> >  		pf_queue_vf(gt, vfid);
> >  		return true;
> > @@ -1046,14 +1060,22 @@ static int
> >  pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
> >  {
> >  	struct xe_sriov_migration_data *data = xe_gt_sriov_pf_migration_restore_consume(gt, vfid);
> > +	int ret = 0;
> >  
> >  	xe_gt_assert(gt, data);
> >  
> > -	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
> > +	switch (data->type) {
> > +	case XE_SRIOV_MIGRATION_DATA_TYPE_GUC:
> > +		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
> > +		break;
> > +	default:
> > +		xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
> > +		break;
> > +	}
> >  
> >  	xe_sriov_migration_data_free(data);
> >  
> > -	return 0;
> > +	return ret;
> >  }
> >  
> >  static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> > index 35ceb2ff62110..8b951ee8a24fe 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> > @@ -33,6 +33,7 @@
> >   * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
> >   * @XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA: indicates that VF migration data is being produced.
> >   * @XE_GT_SRIOV_STATE_SAVE_WAIT_DATA: indicates that PF awaits for space in migration data ring.
> > + * @XE_GT_SRIOV_STATE_SAVE_DATA_GUC: indicates PF needs to save VF GuC migration data.
> >   * @XE_GT_SRIOV_STATE_SAVE_DATA_DONE: indicates that all migration data was produced by Xe.
> >   * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
> >   * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
> > @@ -76,6 +77,7 @@ enum xe_gt_sriov_control_bits {
> >  	XE_GT_SRIOV_STATE_SAVE_WIP,
> >  	XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA,
> >  	XE_GT_SRIOV_STATE_SAVE_WAIT_DATA,
> > +	XE_GT_SRIOV_STATE_SAVE_DATA_GUC,
> 
> as DATA_GUC and introduced later DATA_GGTT/MMIO/VRAM are kind of sub-states of PROCESS_DATA,
> better to keep them together
> 
> 	XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA,
> 	XE_GT_SRIOV_STATE_SAVE_DATA_GUC,
> 	XE_GT_SRIOV_STATE_SAVE_DATA_GGTT,
> 	XE_GT_SRIOV_STATE_SAVE_DATA_MMIO,
> 	XE_GT_SRIOV_STATE_SAVE_DATA_VRAM,
> 	XE_GT_SRIOV_STATE_SAVE_DATA_DONE,
> 	XE_GT_SRIOV_STATE_SAVE_WAIT_CONSUME,
> 
> and at some point you need to update state diagram to include those DATA states

I'll extract this out from control state machine, as it's conceptually
similar to save_vram_offset introduced later in the series.

> 
> >  	XE_GT_SRIOV_STATE_SAVE_DATA_DONE,
> >  	XE_GT_SRIOV_STATE_SAVE_FAILED,
> >  	XE_GT_SRIOV_STATE_SAVED,
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index 127162e8c66e8..594178fbe36d0 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -279,10 +279,17 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
> >  ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
> >  {
> >  	ssize_t total = 0;
> > +	ssize_t size;
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> >  
> > -	/* Nothing to query yet - will be updated once per-GT migration data types are added */
> > +	size = xe_gt_sriov_pf_migration_guc_size(gt, vfid);
> > +	if (size < 0)
> > +		return size;
> > +	else if (size > 0)
> 
> "else" not needed

Ok.

Thanks,
-Michał


> > +		size += sizeof(struct xe_sriov_pf_migration_hdr);
> > +	total += size;
> > +
> >  	return total;
> >  }
> >  
> 
