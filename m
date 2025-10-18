Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EF0BEC8AC
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 08:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B918F10E032;
	Sat, 18 Oct 2025 06:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRLUAHyQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123B210E032
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 06:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760769839; x=1792305839;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Npo1gXF7idyxuvfjEME3zQAljc8Or3vbgbz1VQrSyfg=;
 b=XRLUAHyQjzFs4LGR/bw0phKYyIDNOQttnH1Rcsy7UGGpKPDKLxc5lH8Z
 8u/nfo5DroWP584oSWzqDcRHN+DFAyOGEmKVtUWGffHdAjWmysF0jyYtu
 duxOIO/AoAnL5N2UhJM+qUM0QE8c6PL2lvvRut68uRw/7LGPHPtP2Yg26
 o2C1tO+qkj9xn1mHd+yv85l28RFZZyN4jIotO836R+uJEjd8ATbPH2BYW
 FBXmMuyhNT/kJAlKloua5u54/mNz+oYWFtLIM9yes0BnEKwz89LwR2MIv
 EVuZq/XD8LgEpHdXTS7jEjWm3pNaT4cwZZXlQa3UC7w8NZNX8lMjsnSYH Q==;
X-CSE-ConnectionGUID: ZkcJIPZWTYS8r5TZOD4vAA==
X-CSE-MsgGUID: Cp4b67oLSkmSUsz7Jl2e3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="73260312"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="73260312"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 23:43:59 -0700
X-CSE-ConnectionGUID: NYCunhfUSXigW5af19iNMg==
X-CSE-MsgGUID: YUVWddj4SEClqR85QE707Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="213876917"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 23:43:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 23:43:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 23:43:57 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 23:43:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2E485DYCvNWja7AjXSJ9lARor5AMriIaK2YRqQI2yw+Q/uwNH79jOXgYFyrmv9LqMWlr/YOtR7jsw5znowBSYYW0QD69au02EdhkB/gMJBZYlTUWfhFgGbnA1QTsAFKeoOv8CAHkLP5Sw6pHERcY6pPDeoq4DlLrZDw/lf8lhvLp/9oB3DAzerDM8f8SS8MALL3yPFtY+oyXyQ/5Uvp9hZejUpfMEoxfxJZMoXL9x6ajUo9IXTP8j2/BRG1xS6deXsMWUmgRdga89HjJ43F1lIuSDDInH1sWmHFcql4Kx0HDah1lMgf/iga+7Nq2kENYr7kxONdhmHTN5iUOBzIOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwWvnnerEnOH555biMlHMrBLBOECCiLhQaTzqSLgBUg=;
 b=exhAjNzAgYO3cqgreNAKrUe/jmaiPQAfQSHlTVzj9o07MzJVyBA8IfNo8Cd32XO92WdcC+TE1sPCRRjnEIyrfznkQLLxe0ff+BsJoFWkgoOcoXbcxm2DPfokmOkLz6+WAkBywcRnBP0M0Td5dAnJpzZX8+U2n0hpmVmRWsR9HrYbSeEjq4E/8EJO50Bihk0qEtygrqH0qVHsF1nwQs1HU/CAiild130Rca9XOP4anXsLiuZgkGgcIk2RatxDRfvitG+lsGIzbqlwfPK4n8cm0l0JLGVodw0e1zteaOP9UGe12rpgxrvV62zwnO9IpwtS9LIHrxAnYbWMEi5jmIBkBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA1PR11MB8396.namprd11.prod.outlook.com (2603:10b6:806:38d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Sat, 18 Oct
 2025 06:43:55 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9228.010; Sat, 18 Oct 2025
 06:43:55 +0000
Date: Fri, 17 Oct 2025 23:43:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Rob Herring <robh@kernel.org>
CC: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Oded Gabbay
 <ogabbay@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Robin Murphy <robin.murphy@arm.com>, Steven Price
 <steven.price@arm.com>, Daniel Stone <daniel@fooishbar.org>, Frank Li
 <Frank.li@nxp.com>, Sui Jingfeng <sui.jingfeng@linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH v5 2/2] accel: Add Arm Ethos-U NPU driver
Message-ID: <aPM3J2jZcct7ODIp@lstrano-desk.jf.intel.com>
References: <20251016-ethos-v5-0-ba0aece0a006@kernel.org>
 <20251016-ethos-v5-2-ba0aece0a006@kernel.org>
 <aPHhXl6qdU1mMCNt@lstrano-desk.jf.intel.com>
 <20251017153746.GA1579747-robh@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251017153746.GA1579747-robh@kernel.org>
X-ClientProxiedBy: MW4PR04CA0254.namprd04.prod.outlook.com
 (2603:10b6:303:88::19) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA1PR11MB8396:EE_
X-MS-Office365-Filtering-Correlation-Id: 454d8b1e-5a97-4d7c-d891-08de0e11b528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3gzc21jdE5NSm5tN2pSdVFoUU1QN21rdzZuM2FrTTJOR01mdTIwWmg2NC9Y?=
 =?utf-8?B?dEhhem94VGNIRUVOZkt2b05WTmYwZyt6TURlNFZreUxkdnpWaWMxTG94cnBH?=
 =?utf-8?B?eEJEdTc4UW9hRFdwM2dGVit5elkyMDRuMnAvZTJ3dnJ6eEl3enJuN0Y2OUZO?=
 =?utf-8?B?dE8xL2I5ZUhVOTFGQno4RXdXRmc2d3pYRXI4YjhKM3oxK01mOFlKWFY5Rlh3?=
 =?utf-8?B?S1ZZRnZiWEFRMFk0dGF0VjhMcmdDNjg4L1p2SXdzRDROMUVDSmdBUFJ5RGVK?=
 =?utf-8?B?c3dwZ1o4TmxqRG5nZDYvOHdFTkExejRoeGpJNlpOcTd0ZDQ4KzVBZ29pMDN6?=
 =?utf-8?B?dlVCQ25zTEovZVVaNnRaMENiZmw4MHhnbHBnN2JEWGpNbmxjRUdQdDkwdmRq?=
 =?utf-8?B?cWc0NHBKU3Z3UkV6alBsdlRVRXhVdCtqa0lSUk1qOGVTRVBpZzN6MDdMeFYw?=
 =?utf-8?B?VDRTZkp2U2xPUkh4azhld0xrTC9GKzRPSXEwYmt4TTkvZTZqeGEvVVR6RDhq?=
 =?utf-8?B?YUdkUlJnVWFrb2RUd2M0VytSQmZIZW96YjVmOWI4c0t2VXNybGY1ZFJJVCtv?=
 =?utf-8?B?YmZ4V2tZMnA1bEZMd0E5VWd3SlpJM3FodWFwNG9MZS9kUnIyamRBS3ZlSGl2?=
 =?utf-8?B?dERsd29ON2NHSm5mM3o0U1lLR0VYT3pVZDdyVmFWa2pVYVhlUi82UkZ2V3RT?=
 =?utf-8?B?Vi9pbWVWRW5UVXN5VVNNYU8wd2VybElVL05iTWdIU05BVUl6V0tCWVpGZEh5?=
 =?utf-8?B?RmJZTWZEQ2E5YTJLS2ZSQTNVSTdmZURDYnRQaWlJM0ZuRytGRjFNSFdpUHJ3?=
 =?utf-8?B?TzY0akpzcTFEYUw5V0g2RWNNQW1TSklTYS9GY05VaDJqaUllbkxBZDJIZEFv?=
 =?utf-8?B?eTdDVktIeXIxT0F5ODFyaXB6UVE4eGthMnhBaE1veFIyb1llbU1mQWtQRlJL?=
 =?utf-8?B?Y05KQ2p1TjhYelgydW5MWmZzL0xHZkRkUWZPUUpkSDhaU3BzOVNsK0NQWjZJ?=
 =?utf-8?B?VlBBdXd0Rzdrb0JtaW5YUjRYWllHbDE2TTZoQlR5dmpScHVpaXZ2TzhzYTR4?=
 =?utf-8?B?Sjd4VElhZEMvVVZkdy9MUUNEWlVWaTZGRWlQY1liTUVPekR2RjF6Sm45SjIw?=
 =?utf-8?B?clZDcDNDT3hKV1R3ME1hMHZEVWMzRmVxTy9zYm5LaHRlQ1lKQVlqZjRhNDlB?=
 =?utf-8?B?Ujd6UnRtWXdxTTJQRm42TmNRbnNMU1hIcUFWSTNyY3ZnU1hFeFoxTlhoL241?=
 =?utf-8?B?OVFqa2t2ZDUzVUYyWFVoMjgzdlpQd21YaDk3MjltYnJsMU1nTS9mK1dsZitr?=
 =?utf-8?B?dVZSZjBzYlZCZnl2b1F4cUhYZ0J3cUErNnNwZ211V3NXYTBURDBLaVJOd3pp?=
 =?utf-8?B?Y1JKWVJmUXJ0d0h6cU1Pb2NEYkpYTnZEdkl2bHdIUE1vcnJ1cGxReE0wL0sy?=
 =?utf-8?B?NUowWFA2bk9NVUJhS2JEMExlQmhvK1VnQ3ZVTnZidEE4a01wMWJIRW52ZnQ3?=
 =?utf-8?B?OTJWai9uaTQ5Qlc5YlRVMVBMR1pOUzB0L0dKa0kyTlFMdERMSjJzREowZmtG?=
 =?utf-8?B?RmpFcXdEWU41ZDdlU3RldHN2bTVybldMWjhTbG1CSFJhZitkTElEWVZDZDEx?=
 =?utf-8?B?c1FzYU8xOFk1RkhFbTJubHh6Zkh5bC9LQ3RPQjgzeVZia1BVRkNrQXIyNGtS?=
 =?utf-8?B?N1RNQmcvWnBHREFtNUhRdWs1aUxvZ0NaVkNZU3UxclJlNWZYUGgwSHJlenk5?=
 =?utf-8?B?Zm93Q0NwTE9USnJkbzY1RC9oVjl3T3FyNHFsa0V5UHhFc2lXUEx1d2k3a2o2?=
 =?utf-8?B?MUlBVEgvUmdpOXYzNS8wUWFMcXdsa21JTUVnaENuNUdzV2JHRUNvOG5KQXN0?=
 =?utf-8?B?U1ZyRDhjSXVYMUJkNFEzWmcycVFGV1ZJREx1Y045bTNYQ2tRekVQdXlaOEVH?=
 =?utf-8?Q?1enYdlQxbHlQQKggiiz//G3fYf+deTAB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0J0V2FjSll5T0thN0ppVWNXZGFOQ0NSMGwvb01wTm5hc1YyNFhGMElXcmdE?=
 =?utf-8?B?eStvbXdsbklnczh5SHJjMm50RDU0QmVCS05LRUExWGYxWDdLN3NMYjN2Y2RY?=
 =?utf-8?B?OGxTZ05Cd3JBdDdkbU5FM2t4Y2ZRaTA3Mi9tYXoxNFo0ZTlrbVMwRFd6RDZw?=
 =?utf-8?B?elNuZWorRFlTWUFSM3lCYmhpZ1NwcUxmRDRyUVB6N0VuUFN0ZDVadjFJYnhz?=
 =?utf-8?B?bWs0RVlXdXJNdFBRTERQS05UVmpGcjVVOEx4dXlQV1JPVEh6U3VSZWMxRXcv?=
 =?utf-8?B?QmFtY1hFMzRsaVUvZnIxRExEVDd3UEw4K2ZGU2c0U2NacGhLaUd5ZVBqMmZP?=
 =?utf-8?B?MHc2REsyNkU1WnVKMDk3MVhicXZ2b2o4aEtGeXR6WjZNK2xTcjNKSit0OE1F?=
 =?utf-8?B?RGJRTkJVWnFTVGpPNlo4SDZuT2RlV1Z2UVgwY2p3MC9kNHNvcnlEMS9xeEJa?=
 =?utf-8?B?NE5NMVV2c011SlR5S1B6aUNuVklyYXE4dlcrRHdwWFB6QW5kVFpjcFFzZW0r?=
 =?utf-8?B?M0JUVHVhY29xOGI4NTJXVGp2UWtwcDJtNVdqb1llRzB4cmUybXh3SHB2N1lQ?=
 =?utf-8?B?MlFoRXlmaEd3ZWMrQ25RT1JGdGl2WWwrdDdkbWEzVTU5NERPMkZGQjhRUmdH?=
 =?utf-8?B?OUVaSGNSakxTN0JPUytjZVV5SWtqV05mWXJYOGxkcDFhNzBwRFAzNzRGWXNI?=
 =?utf-8?B?K0NSOUNpb29iUkJYanFBaWk4djVraVZ0TVdmUnJ2djJJTkdNenJRa2FhQk1o?=
 =?utf-8?B?QW5xSDNnaWNKQnlyVkxQNXNEclNZYUhtNFhNd1ZtMmRlQXFZSnNRd2p3dDlR?=
 =?utf-8?B?VXp6bGJMWkE2cnhQdG8wQnFmSFllbXRSOVJYaHZkZ3BqTGdxMXBvdmVQMVVy?=
 =?utf-8?B?YmYwRWF5ODdvQmdteDdQUERoU01MSWVqSldkdUkyQUptWUM5QXA2NzRoNFho?=
 =?utf-8?B?UVllZDV4Qkt4Ujk0b0hzeDRKYkZlK08zWEFZTFNzaW13WDJ0NFZBeWMwbE5V?=
 =?utf-8?B?bWZ4V011d3IyV1RBT0wvT0tTVS9hTjVCOC8vUElVZDRWZmI5SEdmZlJLU21n?=
 =?utf-8?B?b1dSbWF1QXY2aHBTMHlXL04xNWx1UkluSW90NHBhTmlKRTRDMGoybkYzQmFs?=
 =?utf-8?B?enhuczdlOElFQ2t2Ry8xb0ttRTRGbE1tQ3BQWmd3YlhBR3JXbUl1VmJlNkto?=
 =?utf-8?B?Q00yR25RaHJBamRBcmdUb29OakZ6Q2Z5TDlCa1RaSEFNMldGellNSDRQREZ0?=
 =?utf-8?B?a1Q3V0xBc3RhTHFqMFY1WFlwU0JaNzAyVWpzdTJFZ0tuN2lMQUVQU2h1UUNC?=
 =?utf-8?B?cW1WZWNIWnY2ckVpQmM4V01jUGlsb3lNRWtjeWJ1WW5hN1FZNEI5bmhRY3ZV?=
 =?utf-8?B?aTNoZUFrUEhkS0d1d3haSktVV1JIMXFaZngxTlB5b1o5ek1nZTkzS3l1THkx?=
 =?utf-8?B?Q1ZHdlJTeUxRODMrb3pXK1k0RENFdE5Fa21nVVVwMURIQk9pTFpxRzczVHhF?=
 =?utf-8?B?dGwwWWlEb3VzcDEvZjM5SHArTmxlZVFYK0RqaWhWMmw4YzFkSlBHVEtJeEdH?=
 =?utf-8?B?b2cyUUt0MjJCOVhLcHB3T0ZDd1lPRUxVVE0zS2U2THAzUStnWW9qbVRPcjB5?=
 =?utf-8?B?WllXVjBEUUhweDlDaHpNaVA0Mkp3ZVVWSGhrL0dxOHExS0pTTzRJbDVidWR2?=
 =?utf-8?B?TjBhUkhJUWxMRkp1cGJaR1VwNmVvNVJQN1hGTnk3RldlSSthVE43d3Yybzd5?=
 =?utf-8?B?ODJzK3hpb0oyM0V3eVVmbmtPUThaSFpRMTV4UENYSGpJOXAwbDlwT2ZSWG1i?=
 =?utf-8?B?djVRM29waWZyZmo5R3JUNG1WajVUREJPalN0KzZuZHEwZUtQN0JzR3ZKS2FU?=
 =?utf-8?B?QzM2OUx5NWtrZ0g5eWVRSlFKNm9zLzdaR1M5SHJERzFQKzhreXE5ckFMeGRH?=
 =?utf-8?B?M1Iya0ZHUmJPSHB2QlJXWWs3Q2pHVFZTaUdQWnJrY0Y1cWtYU0RFbGF4Mk5t?=
 =?utf-8?B?VXMrY2R0NkJJTm9aUTVma1QreGRWS2tRdnovRWhzbEFvVGg3aEVpUTFwUW1T?=
 =?utf-8?B?dktMalA5ZTZkNlMzZ0wrMVFDbkRMcVlkSURhWnZkc1ppM0REODdWZGpsRGFG?=
 =?utf-8?B?V0ZCUXZ6TFc0K25FVGp6V2JDc0RDRlB2WHhLQWsvN1paSmo2TEd4Zktqam5C?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 454d8b1e-5a97-4d7c-d891-08de0e11b528
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2025 06:43:55.1859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdYheQs6TdopY72aE8Y7KfQxGwwCthtdB5mHGwydmwfgg7313Y8d+V2/CX8yYQWRx/tKoCdp6tnZATio0ruyaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8396
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

On Fri, Oct 17, 2025 at 10:37:46AM -0500, Rob Herring wrote:
> On Thu, Oct 16, 2025 at 11:25:34PM -0700, Matthew Brost wrote:
> > On Thu, Oct 16, 2025 at 04:06:05PM -0500, Rob Herring (Arm) wrote:
> > > Add a driver for Arm Ethos-U65/U85 NPUs. The Ethos-U NPU has a
> > > relatively simple interface with single command stream to describe
> > > buffers, operation settings, and network operations. It supports up to 8
> > > memory regions (though no h/w bounds on a region). The Ethos NPUs
> > > are designed to use an SRAM for scratch memory. Region 2 is reserved
> > > for SRAM (like the downstream driver stack and compiler). Userspace
> > > doesn't need access to the SRAM.
> 
> Thanks for the review.
> 
> [...]
> 
> > > +static struct dma_fence *ethosu_job_run(struct drm_sched_job *sched_job)
> > > +{
> > > +	struct ethosu_job *job = to_ethosu_job(sched_job);
> > > +	struct ethosu_device *dev = job->dev;
> > > +	struct dma_fence *fence = NULL;
> > > +	int ret;
> > > +
> > > +	if (unlikely(job->base.s_fence->finished.error))
> > > +		return NULL;
> > > +
> > > +	fence = ethosu_fence_create(dev);
> > 
> > Another reclaim issue: ethosu_fence_create allocates memory using
> > GFP_KERNEL. Since we're already in the DMA fence signaling path
> > (reclaim), this can lead to a deadlock.
> > 
> > Without too much thought, you likely want to move this allocation to
> > ethosu_job_do_push, but before taking dev->sched_lock or calling
> > drm_sched_job_arm.
> > 
> > We really should fix the DRM scheduler work queue to be tainted with
> > reclaim. If I recall correctly, we'd need to update the work queue
> > layer. Let me look into that—I've seen this type of bug several times,
> > and lockdep should be able to catch it.
> 
> Likely the rocket driver suffers from the same issues...
> 

I am not surprised by this statement.

> > 
> > > +	if (IS_ERR(fence))
> > > +		return fence;
> > > +
> > > +	if (job->done_fence)
> > > +		dma_fence_put(job->done_fence);
> > > +	job->done_fence = dma_fence_get(fence);
> > > +
> > > +	ret = pm_runtime_get_sync(dev->base.dev);
> > 
> > I haven't looked at your PM design, but this generally looks quite
> > dangerous with respect to reclaim. For example, if your PM resume paths
> > allocate memory or take locks that allocate memory underneath, you're
> > likely to run into issues.
> > 
> > A better approach would be to attach a PM reference to your job upon
> > creation and release it upon job destruction. That would be safer and
> > save you headaches in the long run.
> 
> Our PM is nothing more than clock enable/disable and register init. 
> 
> If the runtime PM API doesn't work and needs special driver wrappers, 
> then I'm inclined to just not use it and manage clocks directly (as 
> that's all it is doing).
> 

Yes, then you’re probably fine. More complex drivers can do all sorts of
things during a PM wake, which is why PM wakes should generally be the
outermost layer. I still suggest, to future-proof your code, that you
move the PM reference to an outer layer.

> > 
> > This is what we do in Xe [1] [2].
> > 
> > Also, in general, this driver has been reviewed (RB’d), but it's not
> > great that I spotted numerous issues within just five minutes. I suggest
> > taking a step back and thoroughly evaluating everything this driver is
> > doing.
> 
> Well, if it is hard to get simple drivers right, then it's a problem 
> with the subsystem APIs IMO.
> 

Yes, agreed. We should have assertions and lockdep annotations in place
to catch driver-side misuses. This is the second driver I’ve randomly
looked at over the past year that has broken DMA fencing and reclaim
rules. I’ll take an action item to fix this in the DRM scheduler, but
I’m afraid I’ll likely break multiple drivers in the process as misuess
/ lockdep will complain. 

Matt

> Rob
