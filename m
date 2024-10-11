Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1494599AEF6
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 00:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296FF10EB34;
	Fri, 11 Oct 2024 22:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B6wR4SpM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF50310EB34
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 22:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728687563; x=1760223563;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6n8UNh06k9Zazcx5TV1myWNfgJnjk2QfYTo05yW7pGU=;
 b=B6wR4SpMNj10/uqsdsikihJHG+/gAFbMVhrdBE7wbknsB2lMcDlkheWB
 +fgco6TcmJmSRpr6pwc2TsWyeagbgTQEU/Njx6bqsfznrgp+OEFEJ2OZv
 gRMtIDSoNoERAdjH3zGo4FksqyiOcsGnWxHui2cq4K9KqpgIOoY4iOvVo
 8GiMgKUaSPpZXKfuokDMXeuH4jEgGe6J32C8j8vxcyK7oeqQzyzTa6yj+
 hlwFEZzIxKeXgtnYcxrHSvRf4M8K1eLiLh9UMJNrgoM4fPzYuAfYCqxs1
 fA5oqpBP86f1eVO/1PmyejH+3Fu/vKaCaGoW2S7rQdASM7WbeRkLhRFhe A==;
X-CSE-ConnectionGUID: 88SXtNeNSYeJYMPufqNkbA==
X-CSE-MsgGUID: 48gFWtupRHaiwQvS9SUKNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28191044"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="28191044"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 15:59:23 -0700
X-CSE-ConnectionGUID: 1LirZwz7TKqT+AiIOyvJMA==
X-CSE-MsgGUID: wvfYXUVOQD6nZcHb9E8NRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="114500825"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 15:59:23 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 15:59:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 15:59:21 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 15:59:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pehcPaXpDzx4CN0HciTIZs09BYZDm8mNMz5tBNuuEXt2uqsHIXKkv2PuCFtsw4dkL+ZhRp+ysbYRXRPQ+fDAi4qVI2poEsDx1XlP5hrTHuauy+/6D10LJzU4AVBmAul5kJON5bx6UZLmAgnaqK0lRgT9YTCxiAIz2vM6+NMlW91lAcqcfZhzFbO+W7Bg0POeyn5UPiQGogiLnbGY+wFsgZfGxuRc4DRtYtj24BuNsz+6dcgyWNVNZtkKM8NY8wc0oI/3ZXX2mCJJKXRXUrGKD4tjuVo8lxQ+hDOBrvn7LQIjwzFfTkMOO+XIvdNVv5HfpqVpO7UUdKVfEc02G/U0AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6n8UNh06k9Zazcx5TV1myWNfgJnjk2QfYTo05yW7pGU=;
 b=ZsF8NliW+cwNMEEsXbM0ZP3xy9mCA+LzPWzvjRPVJ1aGtP5a0hkvt/S/fsD0ZheSVhgQhRLjTKo2aAgrRWbSFxN2ppmjCjNkuwvS968L0bw4Pr1AZOvxtNc+p/Sk1KWNIY0xaPClWlunHNNGmzV7BmPZChmQuZzSDTFFHBhUsUfKig4fMJGxbRH1ZNdwZlUtcZoxbTfph7EVMawL+txIwTWqMxVFMCiYbv0XsBiEEyNyrzhPLODW2ZWIwZIqxF8Q657k1sGbWWRRwEc6EifJrGBejr2eOgkVTGJvehrkqB0IqmZCxxalNBFIrX1/CqBKRRHlPj8f/1nPc/CU10HCcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7366.namprd11.prod.outlook.com (2603:10b6:208:422::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 22:59:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 22:59:18 +0000
Date: Fri, 11 Oct 2024 17:59:15 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <linux-kernel@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, Ian Rogers
 <irogers@google.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 0/5] perf: Fix pmu for drivers with bind/unbind
Message-ID: <kglvkq6bnyoiefibcljd5h42sznexpm6h2b7clkx5faafy3nw4@op36lmq2p4nl>
References: <20241008183501.1354695-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241008183501.1354695-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:303:8f::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 673763f1-378f-4bc4-9db5-08dcea485613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MKpV6sw9UhbzsefEMuOu+pXjkZeNo3u6XNoUnX/6Egaj9g6CLzFm5ZmOnenL?=
 =?us-ascii?Q?8n7GGoG34p7dATBZlPVQ2B+jy/92gMlpbRlV0+uMC0G6YaOsImKZkQpTTGcR?=
 =?us-ascii?Q?XrJJ6SL8ok2wSqDX2vyGP1wt1U142NplQUsAPf5m8nIEZ0OjdACVWtXvfU38?=
 =?us-ascii?Q?mbeplao7IJ6kpMOwGWIS6oGZYQECziG9ErIpPIRtSUZ5k8/a/Fbyj9+VC3Mu?=
 =?us-ascii?Q?9ypLQupBETWG8YD6wsFgCVJjI5uZW5P2oWus95yUZnzxSZdj8lO2sIigbN81?=
 =?us-ascii?Q?YkKbn1X9DvSShMKptQuv0sUxsubxZvdGPsdXyqLMlIypqE93Bc92wMdCz4rC?=
 =?us-ascii?Q?ceFfQ5ViJiL+ueB5WT0FV3nCGHlgwOCUZMKj1OVwnc83XIGZtkVAUJTcyaRE?=
 =?us-ascii?Q?nmxQRoU0e9lGEsmg/w59nLfciMHVVTdjV63w1VTZNl9BmO6mpEId8WRWHO+s?=
 =?us-ascii?Q?LaWcz6VTvZpNSv4p+2ojOQcuIZ3Ue5KIiZjDbgdDomIk0esz5DC/sDok4JWk?=
 =?us-ascii?Q?6qkmIXyKfcrboAHehhyvkEOXVCfuhxQS2W14UQLKQkJPkZc43gtrGqmz5qO6?=
 =?us-ascii?Q?+46nM+Dg2G1U2fY25odLekeSykh9bhdUjpEhoC4VTen64uuewbTUJTfMKUEH?=
 =?us-ascii?Q?bHel4zq7cYJWhdkdFy4JV8Kw0Jezgu1iqh1bbn56xFcDsdSLh3xEeLVnBRi7?=
 =?us-ascii?Q?L2mQO4D0jpaw/GkMpV4ad08Z/k5RWNAHcyyKwLSrketTjyRwM0h9SxvFfppW?=
 =?us-ascii?Q?xJrlqEafCWBC4tYmC8IwBbnen3VopyqvQCfBIpQP/g3j8dlhb34itr+ZBg/Y?=
 =?us-ascii?Q?4hLak9soQYIACXBTrUJnS80NoUrXplYl1K/H5VevQKY5EyPZhvHhI+6Gzm1G?=
 =?us-ascii?Q?NUWNBGmWW2CUKFVDKD3mUcDk4qRPH2Jf6kHLdnt1gUVbjbWLWvWIzMX8lMSX?=
 =?us-ascii?Q?RghXauSHrCNKax8bjIvFLucNXlqDUXnkX5hMO0NbOUUHX6Bfv2C8OzI0T6uK?=
 =?us-ascii?Q?R64loZcAh4+2pPd96vOESaKqTpZQ9yPEcUdp7dIQVyzzfufl7CGa5ihBu+DR?=
 =?us-ascii?Q?b5H6TE/b4DonqMauEvJH3FYR9ckqARANqeeb+vec1bPwTgf9oqvfkpFedj9L?=
 =?us-ascii?Q?xG3VLlJaLmV/8Omi4pqS5dDZiKvK8M2c5vMeo1/dssYBcwIRS5CBX3YxzvZI?=
 =?us-ascii?Q?Xlvx+2iYFVfshmr9eqN9y7HGRCzsiSJdHMSyBmHx2Vno134cZrqoCDwOXtzF?=
 =?us-ascii?Q?D3R372JpKOORgr7MbO1sSeMFTTI27sP/Cqtry++Y6G9suKA+qkFZUh78UTOt?=
 =?us-ascii?Q?FTg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4LmNoMD5TrrMixUcyHZtEK/Z2KFNbkZsIJJRx3uo2uId1U0/MQSsjqPtpKnX?=
 =?us-ascii?Q?DLHNHEHvQOBMc3cu5uR5/5v7x4L8XUf3icZnxCMN4I/uBHiDNEOksZkh+lp8?=
 =?us-ascii?Q?lLXHGh0ygAkltJI/cSPjM7/FWCOFXLTLXMWcM5OTs4rcGlE2RlEoahc6quWz?=
 =?us-ascii?Q?i0tXD0t99EXwN149lHdoBFgi8D9a4TYr76QpbY6wvFEfYQAnV2PzxeMpEalT?=
 =?us-ascii?Q?eFOJAgm4+vgVqGnYLYU+AG6Ie1ZYezkLFpXwUl2HOSCrQTGevMOCZNeAtsbn?=
 =?us-ascii?Q?b4wddCeqPpOR73fQPSf0nj809GhF4pzLnrt+1WVl6RkYbROq38hNPy4LI/5Z?=
 =?us-ascii?Q?cN6o6jwUZlpeRxP+MPtQ3bIEvy21aWT65bLUbziJM3BRGRWoI1C0iFkeY9cT?=
 =?us-ascii?Q?YtFO5ZLWm+5oRhZPEAtt/NCBDOz3C2X5yRGhHUvbLilEipvxEY0JwhW19Y7x?=
 =?us-ascii?Q?1mHdwoBWtAu8DXJWHwvzqSxTFpqLLrAROrqpMaK31fzqj04nPxEA2oPRfX90?=
 =?us-ascii?Q?/SfZR7lPTqYfs2SJ/mWPmJYcvffhz+sKJ8r6hvouXVpTFAgQ7BDvSr7G4Ops?=
 =?us-ascii?Q?c35cWuGIg1tm37R0yWE3pJhhisw6Mqyuzu/AkWbwpBg6e1fxQVppcsBox+ds?=
 =?us-ascii?Q?xl1llS4lyqtodsmxZUNS83nr+tEA2nz+Sw3MnzzCYuo4HWcRkJJHmiOsjRw2?=
 =?us-ascii?Q?mIdNj7vOBAJd3O15uREc5rgWJjRix+jkdpn5xYDeYIP+KwHJgzjDcGZTHj0+?=
 =?us-ascii?Q?J5mWsgXRi7PskvtRVihBwfH3prmbg8ePB2sheniXGNCcT6Ry9qNP3rAQecMI?=
 =?us-ascii?Q?+1wDmwGnlVhTbaNIqBxjrxapV9ivjR4ec+ep4P2Wm1o6ULHzPAWshev+o7kc?=
 =?us-ascii?Q?GBtEZCgx9zaHOM9ocmPjl5D2yQ7dVkL3rMyXxowPsvbtx+4DtWLXPXhG8sct?=
 =?us-ascii?Q?iyd9DaSBKl6mUMr/ucnbYl5D6bCUxJGuE8f/u4vOqJ3tst3iTXv4JkGDJw27?=
 =?us-ascii?Q?VVorV4d0R8ZNu++wwaSAnHXpxe3tlPAtspI7Fl1CTkPGRQLCvl9sCtOjueBt?=
 =?us-ascii?Q?58rVHt+8138h9MhKY35mHhTZ2otYZcUq3FcfrX+Cc0kOgDEWJ5ier10YOUDm?=
 =?us-ascii?Q?HCjIjE+MB7xu6OC1I+RUBOzXapEaEfziAyhiYsZJ+AvO9VaJYGBuBdMTKK0H?=
 =?us-ascii?Q?rcmg/w1BVVHkdQC0IW7x5UlC5TzjR1kruWn5TML+fAl96dZmOd1B11mlCb2Q?=
 =?us-ascii?Q?STzYLwl3De7rGqSq7GHYEoISbEDEf+DztPblmzJSH9aWNNHGra+XcT5czkSi?=
 =?us-ascii?Q?FaTxw/wqp7cMvkgfsblovYoi1PpUvwye91NT8qxV2FM5mrZibh7Nf9p/t0+x?=
 =?us-ascii?Q?YmKhoEuRnleNLFA9yLoRrwMKYFjrYfY24Z15CtKtnwYV8aLi5P7akTdc5V5V?=
 =?us-ascii?Q?K+fmmUAeLZik880S+wKhzTLmFAZiixWQQBgpOr2XFX4K6FBg36wWnF9y8iEt?=
 =?us-ascii?Q?GddcrBGKrp68mDDUF18neuaSNYKm3iJky3vcNp7falE9p0UfmV39Hbhf9zl/?=
 =?us-ascii?Q?BfiL7G4G+lEU4r1EwJM9fVZQcgFmiF7Au9vgF1ta3ajV9zTrSrooWfDPPz8v?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 673763f1-378f-4bc4-9db5-08dcea485613
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 22:59:18.4060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fc9bqskPVD23oiQ7C8fK/9i40Is6x5IYxq/NeMJnZpkv45BwZNThi+6HKgDQ2LFHu5eViTAFepZJmxTdn4cEYjBrsX3OhTrKAgcZ3KUjPIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7366
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

On Tue, Oct 08, 2024 at 01:34:56PM -0500, Lucas De Marchi wrote:
>v2 of my attempt at fixing how i915 interacts with perf events.
>
>v1 - https://lore.kernel.org/all/20240722210648.80892-1-lucas.demarchi@intel.com/
>
>From other people:
>1) https://lore.kernel.org/lkml/20240115170120.662220-1-tvrtko.ursulin@linux.intel.com/
>2) https://lore.kernel.org/all/20240213180302.47266-1-umesh.nerlige.ramappa@intel.com/
>
>WARNING: patches 1, 4 and 5 are NOT intended to be applied as is. More
>on this below.


I also took the patches 2 and 3, that are the ones needed, and applied
the i915 changes on top. I sent only to i915 mailing list since I didn't
want to pollute the mailing list with resubmissions of the same patches
over and over.

These fixes also worked for i915. See
https://lore.kernel.org/intel-gfx/20241011225430.1219345-1-lucas.demarchi@intel.com/
if interested.

Thanks
Lucas De Marchi
