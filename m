Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPDRLGqud2ngkAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 19:11:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1575F8BECF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 19:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B49510E461;
	Mon, 26 Jan 2026 18:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GNLtzCEd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE75810E245;
 Mon, 26 Jan 2026 18:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769451109; x=1800987109;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lxJCksWVgjYyZf6JiPOeT9j5oBPPn15cJin8Fvfrids=;
 b=GNLtzCEdzcumsrIeMgZmL3y/MYHIjMro/5xoXrN3wRmeY4McNZxl/ogg
 sKlAB6z6mq9zN9Ay7oF2KWsW6UYvbG9RIXqHTCDJO9LKGubYj8NmjstAu
 xd3MM+1abFIzmTD1IMr7Igi4/KxkxJilaeKD0hdAmchB8D7F5HtNbuXKI
 fDT7y6BVn0LQrkc9h3PVASy9t7EyaJeTO8n+X6TL2kVXnNkWTDTiYJxQt
 M/ubmUAp+BfSxJXZqiD8qAEkb/StdplgwsWCJ6zZArx8ZmheVg/+DwOXe
 K3OXs6Uzr7EWVPPWGQOVfcONG9MJdIIn5zfwxzoxAqgZMvayHC2nP12Zd Q==;
X-CSE-ConnectionGUID: 2sQCQ23aT06VbmcV810bvQ==
X-CSE-MsgGUID: I2CmNRC/R32y0Q5X58liNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70537455"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="70537455"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 10:11:33 -0800
X-CSE-ConnectionGUID: 5KKg+VdwSsKeyhvnIVqq5w==
X-CSE-MsgGUID: cOlE/39xSZyZ9nodQCTv/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="207625050"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 10:11:32 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 10:11:30 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 10:11:30 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 10:11:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1fBX+8o9MJtefe1TgTMD/74sUOkJu2xSzAiWfcWV64N6t47/W27wuonCWTmqhJXkTtfecpa5nj8Dpdd5zTStAd/RH1AlKQ+SDKjAtmjoZGXDzLouznJfx3zZlVf2jGzS+2plQ7qlN1Mu51LeTU9jmSHBw1whUrO7WgZxRrZbrWY1maW4JY9JbvhLqMRT9uoKczqRxSZNf38ercir3ifYw0tMA7fy4XrtmUjI7oNnCdrZ0FKCrqvVhhY+iaB2GayPog13/dmPIw7+XNM8c02eG44IRfjgNH0W8Z6T/+jqD7By79Mtq0ZWZQpPgqS5wBxS567U1R8JtkvbuSZTRVY9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5mvsjDDVbtiwXWq5ulUHql1qXcgOqkLbZw3IWa6jtM=;
 b=yBoDIq/EKLeAg2CeYrpWaf15xOiPAWnwXCWwrxscZdSnRmi2u1qkoR2dmCKmRXS32xUlo9ieRHt5splVNKNcJQ0QSb5jf+SKj+cd+ZrZHOTsxsM/iRBXbzNU9MG5y+Olxs9P/saGJ/+Is7QP51jHqd9lSGmPj0/Ff53j8DNXJq4Mn5hVhQ1tP1eMZXsb99sq/uKLvu4YT3i3VE5enaJGbGz74PkFd1epH6Mje5O17jTSpO+o90ShEq9XRqBU8iuJ9yUnG3hSWTYqH4uDrMg/oeQqSDIhMtGpmOoy1r1wZ64OzMyOCpDgTbWj3bIVV64BxdARRKZdMroh4YbfcISpfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CO1PR11MB4802.namprd11.prod.outlook.com (2603:10b6:303:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Mon, 26 Jan
 2026 18:10:22 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 18:10:21 +0000
Date: Mon, 26 Jan 2026 13:10:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: kernel test robot <lkp@intel.com>, "David E. Box"
 <david.e.box@linux.intel.com>
CC: "David E. Box" <david.e.box@linux.intel.com>,
 <thomas.hellstrom@linux.intel.com>, <irenic.rajneesh@gmail.com>,
 <ilpo.jarvinen@linux.intel.com>, <srinivas.pandruvada@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <xi.pardee@linux.intel.com>, <oe-kbuild-all@lists.linux.dev>,
 <hansg@kernel.org>, <linux-kernel@vger.kernel.org>,
 <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v4 4/6] platform/x86/intel/vsec: Switch exported helpers
 from pci_dev to device
Message-ID: <aXeuCXDQyFbUSe3Q@intel.com>
References: <20260123025108.3772255-5-david.e.box@linux.intel.com>
 <202601260115.T3rBZhUE-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202601260115.T3rBZhUE-lkp@intel.com>
X-ClientProxiedBy: BY1P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::16) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CO1PR11MB4802:EE_
X-MS-Office365-Filtering-Correlation-Id: 073a874d-ab19-41d3-ac72-08de5d062b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jz2daKOBeccxZn6sGFjJ2kiTX3ZbHnEIJF8iNJ+CnLUEJwaTPeh36UStoXzO?=
 =?us-ascii?Q?KYsO44f2Z2ldRttHOcQhHGZKPBfqdluXU7W2RZCPZ9ozJkuHTpz6Mh/RW27+?=
 =?us-ascii?Q?tqdrFlFX9KVLcTJER7KDw9QRcVCgqlmh/rA7eNHoWxdPa78pXnYZkbA3vzoH?=
 =?us-ascii?Q?3FUawChLAvkAq7cfIlMP+nSlcME/dz5JBg3AQgWo/tdzlN+Bz+NVEI8TqWJG?=
 =?us-ascii?Q?BowAn+cIGrVuXel/5Hd9a493vvsCpXzfzrf8sV7Q4ruQZbli7ie5VvXhsgrm?=
 =?us-ascii?Q?4zfWp97I6PFwG2sztx+gvV+EulDOs1jnIQn65WDg5WmZ+O+10u1IKEjCKXmd?=
 =?us-ascii?Q?dCNP/CQba46JydFrY2VFlpzLMtM92uEYPwwDrcCyyFYB87vu1dmPTnZ7C9+E?=
 =?us-ascii?Q?Aq+NoDbPjqD11IDdKG1saB5o2KwZm7vBOCa5wRUs2972KX0+8HjHOKUrwoMT?=
 =?us-ascii?Q?aVHurY9n4O9MWyemAbh3c4D7ZZVEk4PdHE3lvK0NZ5NaSdQ5XGtEtLgAqpMc?=
 =?us-ascii?Q?FEdkdyosxKynYaL1O5uis5cC1sIxYIngiZ+jEE//WOo3Qe1LtKjjfM4z9BHi?=
 =?us-ascii?Q?4jVUH0ZxFvbdITj3SZInZxUAFKfwZ+KnfKdxLbT4FMPkOlVEnl+N0rTWS7/7?=
 =?us-ascii?Q?mteVCdUhgOxZ3joWIOgjeR0dWOMh7dI2GX7xhzJHIzhF8uNRN73lM8e5pfTu?=
 =?us-ascii?Q?obMVoYbFhsgkGGEMpeY+iCctCs6NpgSnky+eaCFUIABSTNzV0IicUnKo5IBB?=
 =?us-ascii?Q?uqrMXBxgg1HqnPGvdCZzmapEmFm1UUl9gHfLh8+aBtiIJdoigRg8felNV77h?=
 =?us-ascii?Q?MiEN0M00sOLdyncslOpWsg8Sr9z3XwM+KFRJeS8PvVmGAe1vOcLQLdRhBnCK?=
 =?us-ascii?Q?LLCl1Gb4JxPxC4VRAkPtmBxUiEbWb6Qfl81auH/jj5l5iyoeMDaPbE/JWJTE?=
 =?us-ascii?Q?zGpF1bHnXvMK2m/6YFYHbxEERPO2lxb4ASQhg9ns0nVYhuQaOalAufepDuMj?=
 =?us-ascii?Q?pfYpEq785222XqQhVbK1aeDEi5HubfLhQdvpoM0JbVlLDLkxTSykhc4L/rzJ?=
 =?us-ascii?Q?OKqN1djqNRrVwwFruHoahre+OihaMtFaO0/7uVb8NxhTNRL0AUCjuJQ3m319?=
 =?us-ascii?Q?0G0zuRVOdUnjYorlEIlIccGmLekbRS2e7AggZ9lpf6pYoQjzJtGieMjfWJ2D?=
 =?us-ascii?Q?0EETlooa+1K2LzOYpo/ZeogGqErXMTSxoZxF75wMGdObxSCFMKPlfOHwBEf0?=
 =?us-ascii?Q?GC+SrkOoxLevgkQmPQHHsNN7Nec9teUQHRgxoMVG4H9Umgfb+7QVFmcm5vdn?=
 =?us-ascii?Q?mXZHJyIyC98DM7rp1oIkpCmnwevuf+z66FF88CVYX5oQWMYxvblKOqtyxbZI?=
 =?us-ascii?Q?G1R07xD2HHyfJnZVGbDw7ZKFDrOL4H9ihI911U4pqMypzARlBZKBPrbXWUAL?=
 =?us-ascii?Q?z0HxhkaNcwOnpQ1Us8cdHat2dQfdfLU3EODIv5TTBj7Gt74PASnzGkGLQKSc?=
 =?us-ascii?Q?PW6WuSJZJWtoR0nOdTYn6OWI5zqnBu4xo3f1zxxPm5BYZ1FkQGlWxWblFCgQ?=
 =?us-ascii?Q?8oPjd4Xh5IZuhdrUui1QoNPm3fh8YtiwbBjgm3Or?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q4JkAT3kI0HKaYFC/bxg2cjoADx6aKK0C/ibFN3LSzlkefrk9UOPY+eD7pIR?=
 =?us-ascii?Q?ysNbvRpfcokSecxwz4m9bIlDLYOb1dmbW9uVjBah2+A4E3A0feBszGlkH0Hm?=
 =?us-ascii?Q?c5u1KtGwT8AA6fMAL4qtPr0J8tMyzHE4xo3Ut2lH2YKAoqirFeHjq+iwnofj?=
 =?us-ascii?Q?2zSM3yGKD5FD4iqFRJrPkiJdft4YCUNv+R2BrNbE2/GD1XATKo9L1M2j1UdW?=
 =?us-ascii?Q?dUPbY0jft8H7eGT04S/4LZi/cIOORzjfTfNME9Je0jrRWVkfcr+t+nR5s9ax?=
 =?us-ascii?Q?JwmJCVjQ7R5dvGToIcTEsFPqnNo03ngzeiQni3hGYErsnEvVamJcbAiwl6/k?=
 =?us-ascii?Q?mCzChsDyxMMLGwLPJrwbiN7bXL6R0k+SHdxKFq6frkYcy+dZMOmP8LncLVjO?=
 =?us-ascii?Q?+pbUcCC6KcKfqDgxo7iKzHMgf1OB4EbXO54TUquFNqK0G3CWjx1jb+EXHBbR?=
 =?us-ascii?Q?NRRNHdUHO2eNfbSKZv97krRc2knHyaeKuk8Mpqz/U2+v2vJNqvNrSBY9M+EH?=
 =?us-ascii?Q?yX2f10ZKatDKjGqCC3mgQrYaF3P2Qf8YlNV00lp4SsPIANffo3MaXWHA4mJQ?=
 =?us-ascii?Q?WKC4lO0t7g+bBwTYTHAlH8oEBWr/VkKFGANi4OkK7Xu+ytuDgHo6++CCKC/c?=
 =?us-ascii?Q?NhVnv1JFb8T+IlrYFv4iQILLu2y6VzSOilXLJ61pjPHXsRJGBx2hD386G93A?=
 =?us-ascii?Q?IszCCChTlyARY3EWpiJ0Vw7VGF5VVSfZvpEDb64VEP9qcxygRxZssiu8u0g8?=
 =?us-ascii?Q?cu06homzeOPXG6efu+UVHrGfyq2KaxXJnxXZZKl+LO4DBQYRTlMfZOcqmJ1g?=
 =?us-ascii?Q?pahAxPqV5vNpC29OWmAHexOsgGbsjo1Q3MK7STJv2XcF5m+ZwREJNhHNWZX4?=
 =?us-ascii?Q?SWerYuShVzm2FxWXe1EuxMyqXUWP90r/9RUtFaELXa15VeaKUZCnGJRwO/2N?=
 =?us-ascii?Q?qV7eMHtuU1FiIMuyZf12eeYKi+4sH4WLiwDKeLucFV0Y/8CH5J1oU0OjqH19?=
 =?us-ascii?Q?ML6HbTBJ9yb1AI1ASPxrxAMIjZeYlmGdhQwutA+UwaJQbJ+ID4QWKhBUR2TP?=
 =?us-ascii?Q?L0iA4Gj2L6O6fiecouH3tk1RjbPH+wEiIvlXt2t/ZO1bXTDKLw1ybYHSj0vT?=
 =?us-ascii?Q?fls1ATF6SSE161WyJiQqU7yqGUUpqzQnedxCeIFnQqLG5FoxL4N2pHdNbxj6?=
 =?us-ascii?Q?V8fQeXlJMhl6nW5xU6Tfya08Tq1z83jXcX8e5xgfDGMSVcyf0W2/VBtks8PQ?=
 =?us-ascii?Q?5zwuEypXOc8sVotxx6WroVPFwVWmmusz4QmJk7QV0vnmOGQ4xCMJIEvtBQCv?=
 =?us-ascii?Q?UEkwrrf258NRKZNJgbOwB6WFOoDCS7eBa7R1N6ioBkx3xTu8OhFNDEAGhG+Y?=
 =?us-ascii?Q?CZLDnouN1OttL9IPuqbKm5A7orgEtd6VVx8LxNzjjsa6j8kA7WAT54wDL/as?=
 =?us-ascii?Q?fnlM9+CCcuo3jjxERD5fpdPgWTtohy4e6C29D7BioEHFBTVcxi1ceE2hcaJT?=
 =?us-ascii?Q?4+DjWatPAITaXQJO134hDDGeil+rCi/OGUv0s0DO/5Ik+Ny3p3eJTbOMmDe5?=
 =?us-ascii?Q?tOiHIVwiIGLOPVL1cUkeI2FM1zMNPA7WyBbRxAOvCzVJW3xl8zIstNsT5+8a?=
 =?us-ascii?Q?jvN6BzByha+rZumAIiiW3Jv5TE8eLzJqayM3/ncm0/OGwnjMhWFTYDPrP31V?=
 =?us-ascii?Q?PvwLGdqZ5jsfX4lzrHOH0+Rtt22EmG8nZ0YARTtxRaXbj9tSCaKI6lz8Lpv5?=
 =?us-ascii?Q?BoRQRS/vqQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 073a874d-ab19-41d3-ac72-08de5d062b99
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 18:10:21.8522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKPM2DwdJZElMIWfcFnUtsGwc0RcJBs2vBW649Vgg8yCh4vUEFoGW9sXf6ds13HF/Rk5Qg3gvQTG5UvFMH5eZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4802
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
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,lists.freedesktop.org,lists.linux.dev,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[rodrigo.vivi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 1575F8BECF
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 01:35:49AM +0800, kernel test robot wrote:
> Hi David,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 0f61b1860cc3f52aef9036d7235ed1f017632193]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/David-E-Box/platform-x86-intel-vsec-Refactor-base_addr-handling/20260123-105437
> base:   0f61b1860cc3f52aef9036d7235ed1f017632193
> patch link:    https://lore.kernel.org/r/20260123025108.3772255-5-david.e.box%40linux.intel.com
> patch subject: [PATCH v4 4/6] platform/x86/intel/vsec: Switch exported helpers from pci_dev to device
> config: x86_64-randconfig-074-20251025 (https://download.01.org/0day-ci/archive/20260126/202601260115.T3rBZhUE-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260115.T3rBZhUE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601260115.T3rBZhUE-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from <command-line>:
> >> drivers/gpu/drm/xe/xe_vsec.h:13:30: error: 'struct device' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>       13 | int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
>          |                              ^~~~~~
>    cc1: all warnings being treated as errors
> 
> 
> vim +13 drivers/gpu/drm/xe/xe_vsec.h
> 
>     11	
>     12	void xe_vsec_init(struct xe_device *xe);
>   > 13	int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
>     14	

David, you probably need a
struct device; in the beginning of this header to shut off this build issue.

Thanks,
Rodrigo.

> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
