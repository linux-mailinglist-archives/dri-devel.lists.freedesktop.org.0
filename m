Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 948DF9613B3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 18:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8AA10E371;
	Tue, 27 Aug 2024 16:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CzW4mLL3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A36A10E370;
 Tue, 27 Aug 2024 16:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724775114; x=1756311114;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PcufV+6/2xDshqspoZvb7IqsJRwWthe8VcX3rNBbYJU=;
 b=CzW4mLL3HmVxx5cauJDMJ75Q95BszCBxBm/JL2UlmkxgC/n646shtmo/
 sxbfRFf7JZjcYZBojbUMmY/aChxZqlBQbinb0PUoTQjVFM7gvVk1gFMoc
 XwHxN1l0a38psKE4tZsyUHTn7pmysHfsgRGhBlRjnx01ssarD1uAOHdKa
 B27rUO4IL8EhC4Som/j4aCx4MmJuI444AY0q3FYv4NrtHo+q4CYVsGt/y
 4DjMJrjDBdyTmJuen8cLqwDheG8rgi5zzWmrmZ9QsOayo3q7atKTs03cu
 ajtsSyqmORv9FoRd+x+WvdCF6b61bXLmxrCPCf5CPkgb3as/N8JJkF7jp g==;
X-CSE-ConnectionGUID: N0gaAxbLROikiPEXbuQqTA==
X-CSE-MsgGUID: 8ZUQxfe0SP+iOK4yWjJ52Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13239792"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="13239792"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:11:54 -0700
X-CSE-ConnectionGUID: sF0xJ8hWSdykhH8uGiOeMw==
X-CSE-MsgGUID: pypKfuDVSrabZOzBq0GIWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="67809256"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 09:11:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 09:11:53 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 09:11:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 09:11:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 09:11:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xACPXu3PgKe4tVXDTEdnHDpCX7wldNvlH70JVNwDjlyKLmHDoto7KZVgcZGw6xasQ6PauPj/xD5UcFUuwtK1eZBe1btTyz+V3S3AEBEGFB0uJ2PVDxIU+ecO85prsMN6s8sACHrS5IiPTLtB8qGkIjmst5JyqqY5JYWHdZ8cOwTI5sQGQ+GuYRarf4+j4dx/RNwjnJh6QwfMufXY8KouvtGlI9PO+H81r18hACcYzIkjIaoAAWolBvKQHPHywdaX8ihiz9yi06BiCXuznzXfVg9X2TLk8mV9XvtdeWN3cWGXb50GH9G2oNsXmQlUnsHrNdshA9P0HubIw00WdlvDuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okSeKM5i8jLKPqHM4fXs2sXF3RM9dbQhReq2VA+yMjk=;
 b=gHAJ5FZZYdPtIqb/6DO24XhCGNDAtowNrTymKRb/KCLJUDSe7bXfD98QYFYOe8rSYiiQqJq8Vy8a8MvizmaLeHprIiF27vO1lyZ37GEh6qSMDqHjXWoDJKb4I3tZ5uvxFkVPXs9HcrJIgw414h/8YJ9PTzUQCQcj8rd/YhFZgjVJIdv9B16DMKk/wwIVr0yNXw7HdJCS3tSuMIDf7MAAajdt1UKr9ChNQgZgnZ1cLEjsLLpTv7S/CeUqu425ExJSKzqpFsrnEClyetopX8j0qSoly+kHn2x0Molq4Z7gHVILjx+IQvSsr9gswhZGtyE61I8IZioX/2ooplCQm7butg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7112.namprd11.prod.outlook.com (2603:10b6:806:2b7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 16:11:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Tue, 27 Aug 2024
 16:11:50 +0000
Date: Tue, 27 Aug 2024 16:10:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <sumit.semwal@linaro.org>
Subject: Re: [PATCH v2 1/2] dma-buf: Split out dma fence array create into
 alloc and arm functions
Message-ID: <Zs36d0fJxz3aFIqS@DUT025-TGLU.fm.intel.com>
References: <20240826170144.2492062-1-matthew.brost@intel.com>
 <20240826170144.2492062-2-matthew.brost@intel.com>
 <aebe8cee-8674-42f0-b112-439da1ef7073@amd.com>
 <ZszWJaX9I3sh5jxZ@DUT025-TGLU.fm.intel.com>
 <52a68584-daee-4415-8ea0-7ebc737f8e10@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52a68584-daee-4415-8ea0-7ebc737f8e10@amd.com>
X-ClientProxiedBy: BYAPR06CA0072.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::49) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6161f5-17ad-4806-ebdf-08dcc6b2f51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?G26MrHrAIKCfaeNu/gSXZNVO/X8XeQ/WCYCqYPIVlrrInwLh5fkVyXeSMv?=
 =?iso-8859-1?Q?u7MJMB8pkcBFlewK9IJ0a4/XUc2sHYLzYVn4Qbo2P9MTSZVOwVNxvfMHfY?=
 =?iso-8859-1?Q?77zauP+GXd0Px9/tvJCUtQM9Ajl/S54DXQyWroZyxCnA9gzzfcEHWAe/Fk?=
 =?iso-8859-1?Q?aI0gL22azXtuS5+VGKy2l4UXu9b1pfWqR90bpyYvUmRbR5q/SeufHkwdbu?=
 =?iso-8859-1?Q?oNk6CVJXAjWsOSKuLS9rI2eGR2Jzi6gt+cCAjhw0W22q0zlZJw8bZyoO/I?=
 =?iso-8859-1?Q?Ka1K4CPEf9qFZHotrqfNZBp/LjCybPcRn914TlhTQMO//0cknCPiCt3unO?=
 =?iso-8859-1?Q?oScSQol1SkRZx5vTinmYE42foKPCJDOIEZ4n1Y8fXV5rWmvWydvYqInbHI?=
 =?iso-8859-1?Q?XXGbqedgu6HKXMMytp8BIV1UZ4kcrOLyKeXSYpEAEDMmZygYJnGNPycrce?=
 =?iso-8859-1?Q?IQPa8f7avPeEW813ql8GWAnvzRQz8vgwU/2FrRg4VYt/O4k4lIBlpOqaVb?=
 =?iso-8859-1?Q?+M6bmo+gtzIYS1FScqrwHHstPdF3gzpfIWV+DYCt3O2zyHLCxIWSDiQ0ka?=
 =?iso-8859-1?Q?hPHOsZdUO+IovcOa9H+Q8HY+BKh/usAA7iygru6GK3GGKV8knqJnbqlA05?=
 =?iso-8859-1?Q?hzSBZ9jdTQBLbS5utssbnwIAQ843V1Rdg6uNuaEwZbfNCWB8VXNAIUVGOa?=
 =?iso-8859-1?Q?td3aRAR9+1tCFOiPmTFX8HoZb89Jps3P6D0J+PU5YH6Z3HucT3NfGjDVsD?=
 =?iso-8859-1?Q?Q8CuIvOib8mX04iDLwkK8ileW1Q5PGN3KYkBPctrrUdWZRcXTOMkcSRTWj?=
 =?iso-8859-1?Q?jl4sLnJBj2aHK/NJTtdJ1TnKnPXawQR5AY80sZt4+XHNdOQnpKF89sYa1O?=
 =?iso-8859-1?Q?/vyGMol14A6shypTXozAEydrMTOJcVu6aNSSH2IOvpuO1p0Y5zkAwE7WeW?=
 =?iso-8859-1?Q?mlq2EquX/lNHu8FCpE1bCU+iCzhF/8GS25g3/eMjveQmuDAQ4aSM8z4bQW?=
 =?iso-8859-1?Q?NTK/A3qieI4KlQb6m8wESpVVgFITtblXBG/GkxY6bFYTBR+yz5pKNBpvtw?=
 =?iso-8859-1?Q?cmSgtxwZeAY+7g53mpNmEJ8g1hZo0DQqzlAc2Zc94lRDJXz2/crHUQsUsA?=
 =?iso-8859-1?Q?BpkUMbHpMpfTAs5k1/3zmRVWpLnqIavlu/rmaHyGU3Bqco031RPGxozmDo?=
 =?iso-8859-1?Q?zwl7F97KEI/FkSxrcnfNfo+gw6F0bUegJ2eL1hyqjrcjVKpTr7Q5IGOLaf?=
 =?iso-8859-1?Q?aWuScbT9e6YAWunzujc0BhaR7rfzSGQot63EW1GH5mVOObjhiczLePxFYk?=
 =?iso-8859-1?Q?RJdHcUUOqpycPOQJ5Seob1G2/Ej2dBtkdEscSijflbmyUqNV75JiY6n5Dp?=
 =?iso-8859-1?Q?Z6bcxXloVl3iWEiwzFiaqtZf3m3klShg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?guPy5zdOeVdEdYpYQaHhdWyZfs/Y+nbkUl4+n1Kb73eDiTF2OPucd9u5HE?=
 =?iso-8859-1?Q?5QqBqhaH5BJISCT2j3jM1/34cWJ1Qyf1DjP9RXuiLjHOE4LPWGS8NjYlb/?=
 =?iso-8859-1?Q?WBBkFK7DvJkfcyvaQU5WkFdh3cpoP3ISwB2aME+qweyuFQbAiLk59KRb/Z?=
 =?iso-8859-1?Q?9yf/LYNHix03IVEnwzzS9JMOVBcO06rQ+Y2vIyzS2kNjnkiWcumnXAiML6?=
 =?iso-8859-1?Q?mNtqGWp2f6g8XGQaDLwcnwffAk7/QJYmkMT1lDXyPVZ31bg7/dj7jtZIsN?=
 =?iso-8859-1?Q?7hLWgnaRUGPt+XpvlKTZzeZy34J7Tk/KiUaC4i0vnVSDAsxDMx3dxoLPrg?=
 =?iso-8859-1?Q?rkFMZGFBmyCjBCmuCTEAZqQiUxyMqup71xViJLA323EUSWE18T+xCQfQhi?=
 =?iso-8859-1?Q?pI6/JHYpUJE5Oyh/KJhVTFGTPphPICfYU8W7LUoaoJmsDdY4knr3ThD/tD?=
 =?iso-8859-1?Q?z/WbTQu/Se/HcZF6gp1oap0mR5fkMgr0wRTXoc4JBjVfXvwyJx3Rqpu8i5?=
 =?iso-8859-1?Q?qUwL3Ae8kFLOB8PkUFHaQbLw8CO1TaJX/ZSs2r0PkfXy8FL5s9wgqARWO1?=
 =?iso-8859-1?Q?JOaSGZmYRVmwBJEtDnd3O7jmGLM27TiiN/v0sK+VojGQczpkbPQUZF0+6w?=
 =?iso-8859-1?Q?fjhASMD7b6JrNxb0lFuuU8I3UBK0I7A/5Vs2iPG4eBhrbAkpkIwmzn8XwI?=
 =?iso-8859-1?Q?9gxXVDIZ16lW0JNx8pa4S0Vl4kBq3oA+MwGJ2ng5xERU/Yh/k79SDqn4VR?=
 =?iso-8859-1?Q?jjqtOHR5LAnc7aNMgIxOGcQkieGw5n7psgGQzI7F1tBPRk45WuyVZ2JTHx?=
 =?iso-8859-1?Q?H4yOILr3XqwaPAnS/l6Iv+wyqWQxFEo06d2hzeF+iNKl0fvMeD+gLvEHjS?=
 =?iso-8859-1?Q?J2P0hN629xWPMaadXAIbulxCPtYpBYxdvfumqRQDdKbIU1EP1Z3TX09Uu6?=
 =?iso-8859-1?Q?9qqhAFsAva81JOr58G4/uiN+ayuxmxGBpTn6FEQhaNwUk6DEQa6V+TyVKm?=
 =?iso-8859-1?Q?hLip+NyZhuBTT1fMtA0ot6Nd09WK4VUI7nE16I5V8xICIBKeV7fLv9wCxa?=
 =?iso-8859-1?Q?UrJCFp55EI8erze4G7z5lVAFpOmIa344v/NMz+1iur6hdi7yvqe6rgvajk?=
 =?iso-8859-1?Q?Nn0DOVIf3sxGT1qZqUZJGr54FbhoBZ1JQF9Bc4Is+ICzVu+Y2pfxruqBB/?=
 =?iso-8859-1?Q?eDsWWrN1nIwSszDdrzK0t8zqnK9J56l3MMCg2+OZxq5J2UUyANT8pxvTKh?=
 =?iso-8859-1?Q?ru/y05MOFAjHwSOEKUbwc+kbosfkwBNZxcd5ED+0BId4oDNUvZShulZ2l+?=
 =?iso-8859-1?Q?hXLwA3jm56zE7iWCRZBM8zPKUxZphu+d716GBnVGKR4VzdVtKYvLqCNOis?=
 =?iso-8859-1?Q?VKwEobB0eufy/+idGzcdNY8CkoGInxHFI1jikMEGHbkXcz4bRRz/hlJfd9?=
 =?iso-8859-1?Q?D6nIsBTiPvWlUa+1ABvVzjdhHVw2R7aj20f7jiWfh4vtljnDOUY4Umd7sX?=
 =?iso-8859-1?Q?QznnTHC29Zwrrp7hLSu8DjcssGmVvOS22zDOFjtm3PxHNl1jRltg1aK5hF?=
 =?iso-8859-1?Q?rfOtpLSR0JTUzx+LTHy3pfGr5NtlQXQOTGDE/bBTb5YGCmVYoAYaFDZFcH?=
 =?iso-8859-1?Q?CTCQJttGoPoLiDPzUWyGuBPAyVuE1yPwwMW4ZprtPkEUq7ACfzv4KVog?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6161f5-17ad-4806-ebdf-08dcc6b2f51d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 16:11:49.9839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXishnVVzMiHCChTz5QX056qDdMFqyviSbQ5/Xy6jGoRVID740IMe6qjlwGEohw7zDtTSZWXnAzdCnMYB3mrTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7112
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

On Tue, Aug 27, 2024 at 08:37:56AM +0200, Christian König wrote:
> Am 26.08.24 um 21:23 schrieb Matthew Brost:
> > On Mon, Aug 26, 2024 at 07:57:07PM +0200, Christian König wrote:
> > > Am 26.08.24 um 19:01 schrieb Matthew Brost:
> > > > Useful to preallocate dma fence array and then arm in path of reclaim or
> > > > a dma fence.
> > > > 
> > > > v2:
> > > >    - s/arm/init (Christian)
> > > >    - Drop !array warn (Christian)
> > > > 
> > > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > Cc: Christian König <christian.koenig@amd.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Reviewed-by: Christian König <christian.koenig@amd.com>
> > Thanks for the review.
> > 
> > Unfamilar with the merge flows to dma-buf subsystem. Do you merge this
> > into a dma-buf branch that we can then pick up in 6.12?
> 
> I can push the patches into drm-misc-next or alternatively you pick them up
> through an XE branch.
> 
> The change to the dma_fence_array is small enough that it probably won't
> cause any conflict, so both approaches works for me.
> 

Once I have a review on patch number 2, I'll go ahead and merge to
drm-xe-next. Will also reply here once that has happened.

Matt

> Christian.
> 
> > 
> > Matt
> > 
> > > > ---
> > > >    drivers/dma-buf/dma-fence-array.c | 78 ++++++++++++++++++++++---------
> > > >    include/linux/dma-fence-array.h   |  6 +++
> > > >    2 files changed, 63 insertions(+), 21 deletions(-)
> > > > 
> > > > diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> > > > index c74ac197d5fe..0659e6b29b3c 100644
> > > > --- a/drivers/dma-buf/dma-fence-array.c
> > > > +++ b/drivers/dma-buf/dma-fence-array.c
> > > > @@ -144,37 +144,38 @@ const struct dma_fence_ops dma_fence_array_ops = {
> > > >    EXPORT_SYMBOL(dma_fence_array_ops);
> > > >    /**
> > > > - * dma_fence_array_create - Create a custom fence array
> > > > + * dma_fence_array_alloc - Allocate a custom fence array
> > > > + * @num_fences:		[in]	number of fences to add in the array
> > > > + *
> > > > + * Return dma fence array on success, NULL on failure
> > > > + */
> > > > +struct dma_fence_array *dma_fence_array_alloc(int num_fences)
> > > > +{
> > > > +	struct dma_fence_array *array;
> > > > +
> > > > +	return kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
> > > > +}
> > > > +EXPORT_SYMBOL(dma_fence_array_alloc);
> > > > +
> > > > +/**
> > > > + * dma_fence_array_init - Arm a custom fence array
> > > > + * @array:		[in]	dma fence array to arm
> > > >     * @num_fences:		[in]	number of fences to add in the array
> > > >     * @fences:		[in]	array containing the fences
> > > >     * @context:		[in]	fence context to use
> > > >     * @seqno:		[in]	sequence number to use
> > > >     * @signal_on_any:	[in]	signal on any fence in the array
> > > >     *
> > > > - * Allocate a dma_fence_array object and initialize the base fence with
> > > > - * dma_fence_init().
> > > > - * In case of error it returns NULL.
> > > > - *
> > > > - * The caller should allocate the fences array with num_fences size
> > > > - * and fill it with the fences it wants to add to the object. Ownership of this
> > > > - * array is taken and dma_fence_put() is used on each fence on release.
> > > > - *
> > > > - * If @signal_on_any is true the fence array signals if any fence in the array
> > > > - * signals, otherwise it signals when all fences in the array signal.
> > > > + * Implementation of @dma_fence_array_create without allocation. Useful to arm a
> > > > + * preallocated dma fence fence in the path of reclaim or dma fence signaling.
> > > >     */
> > > > -struct dma_fence_array *dma_fence_array_create(int num_fences,
> > > > -					       struct dma_fence **fences,
> > > > -					       u64 context, unsigned seqno,
> > > > -					       bool signal_on_any)
> > > > +void dma_fence_array_init(struct dma_fence_array *array,
> > > > +			  int num_fences, struct dma_fence **fences,
> > > > +			  u64 context, unsigned seqno,
> > > > +			  bool signal_on_any)
> > > >    {
> > > > -	struct dma_fence_array *array;
> > > > -
> > > >    	WARN_ON(!num_fences || !fences);
> > > > -	array = kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
> > > > -	if (!array)
> > > > -		return NULL;
> > > > -
> > > >    	array->num_fences = num_fences;
> > > >    	spin_lock_init(&array->lock);
> > > > @@ -200,6 +201,41 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
> > > >    	 */
> > > >    	while (num_fences--)
> > > >    		WARN_ON(dma_fence_is_container(fences[num_fences]));
> > > > +}
> > > > +EXPORT_SYMBOL(dma_fence_array_init);
> > > > +
> > > > +/**
> > > > + * dma_fence_array_create - Create a custom fence array
> > > > + * @num_fences:		[in]	number of fences to add in the array
> > > > + * @fences:		[in]	array containing the fences
> > > > + * @context:		[in]	fence context to use
> > > > + * @seqno:		[in]	sequence number to use
> > > > + * @signal_on_any:	[in]	signal on any fence in the array
> > > > + *
> > > > + * Allocate a dma_fence_array object and initialize the base fence with
> > > > + * dma_fence_init().
> > > > + * In case of error it returns NULL.
> > > > + *
> > > > + * The caller should allocate the fences array with num_fences size
> > > > + * and fill it with the fences it wants to add to the object. Ownership of this
> > > > + * array is taken and dma_fence_put() is used on each fence on release.
> > > > + *
> > > > + * If @signal_on_any is true the fence array signals if any fence in the array
> > > > + * signals, otherwise it signals when all fences in the array signal.
> > > > + */
> > > > +struct dma_fence_array *dma_fence_array_create(int num_fences,
> > > > +					       struct dma_fence **fences,
> > > > +					       u64 context, unsigned seqno,
> > > > +					       bool signal_on_any)
> > > > +{
> > > > +	struct dma_fence_array *array;
> > > > +
> > > > +	array = dma_fence_array_alloc(num_fences);
> > > > +	if (!array)
> > > > +		return NULL;
> > > > +
> > > > +	dma_fence_array_init(array, num_fences, fences,
> > > > +			     context, seqno, signal_on_any);
> > > >    	return array;
> > > >    }
> > > > diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
> > > > index 29c5650c1038..079b3dec0a16 100644
> > > > --- a/include/linux/dma-fence-array.h
> > > > +++ b/include/linux/dma-fence-array.h
> > > > @@ -79,6 +79,12 @@ to_dma_fence_array(struct dma_fence *fence)
> > > >    	for (index = 0, fence = dma_fence_array_first(head); fence;	\
> > > >    	     ++(index), fence = dma_fence_array_next(head, index))
> > > > +struct dma_fence_array *dma_fence_array_alloc(int num_fences);
> > > > +void dma_fence_array_init(struct dma_fence_array *array,
> > > > +			  int num_fences, struct dma_fence **fences,
> > > > +			  u64 context, unsigned seqno,
> > > > +			  bool signal_on_any);
> > > > +
> > > >    struct dma_fence_array *dma_fence_array_create(int num_fences,
> > > >    					       struct dma_fence **fences,
> > > >    					       u64 context, unsigned seqno,
> 
