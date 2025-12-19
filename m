Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1040BCD07C2
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 16:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F69E10F01F;
	Fri, 19 Dec 2025 15:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P/p2D4dR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F0D10F019;
 Fri, 19 Dec 2025 15:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766157717; x=1797693717;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=+68x99L1W/B+SK6ouK0yq7R59l6QuA1d6U5U0trzvBM=;
 b=P/p2D4dRShRCJQH6++hjJxyAbvactDG2npdFZBcxfIzO55Dvh+h+q2ks
 aRXzH3h0VgGClmL7Tn1ZeZbjNVzUsDKF+Y+tDt/wOHeZRaiVyzyCcwa43
 aK4/0N7mu7BaPv37QU8GoZ0716pTZGd80n7xUsEMzPgYo+vyxk1oZCq2J
 gQbDSWxg3J79gAyqAG6y7rM4WT1XnFE6fEQD906JI6bq/dEnQszd/2PR4
 +cJ0CgWJyqBH57PtAzx9KCAuu43JBrsqsuZ9BWDL53pL+4G4T3Tp0Cz4G
 0+NlHCVuEk+BmBMyoy8aL22O38fwmTTH/jg5+5C8q8FL8Rst8fWRWhbC+ g==;
X-CSE-ConnectionGUID: q2/7mhOeSsqXv4928KAlYA==
X-CSE-MsgGUID: kvICPuz7Qxa8pd+WxuBEXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="90776539"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="90776539"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 07:21:56 -0800
X-CSE-ConnectionGUID: SLnJCqiMS0e/DSnuv6Xikw==
X-CSE-MsgGUID: 4wf45ODySl+ocneHexEnDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="199133977"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 07:21:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 07:21:55 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 07:21:55 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 07:21:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpiLvtXnAiIYPBXMGXvyp3vkRku/dfmW2Dax7Yf41fY8BdKC0ZyXGWqg3MQz2IFh2uN3bKy7K7GD2mzr3sptXeaL/IPsJJ6AQaZG1/n7K/5MwsMpgA8zikO2iMXvDwwTusS82X7ghWvfBCWftD8im6lVtGcoO4JQ3YHAHP9GoJlz40UkSRmXw8oHIOUcJoDpqzSiGWdt1XTF05xjtVtOKK3BNefnVqiFdO6CgkA0cUtYW/xlCBu9UiSuG9UmNhSYZIyvir8/QWryKje66snZBZFPQFwv+MjL5DMRvfIsH5nJ1R9JNRBohTLHfU4Bp2p3E3AiKjT/y/ScqLuecBFgxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uzJqumvTRRsTz00BuqQM0W3nKut0MSgPopZcuP3jKg=;
 b=MA3hGpjn2c5UxSFkqpgOZOywkjW5P3f6qFHSeymR0TTqSpJmkEqMd02YG5Mca0rO2ModtVXrPZz7m675sr+zhkN/Wf9Xvomme3iwgpr28bGAOMIhKv4eiLE3X0RiFDopup0dLftUvs28mDVaUBgSImXnmdDWcr+9MizLF73r6zcYPlA6gLJ1QpZUAfwvsJ7dDlbh+8eRnuTvJgVivnhBrgCFXQ6mnnapEFoyvNuc0854kxYgNSx3gKzIHvO6Ee5mDV86nkzHjVkmQ4LH69miw9bKfPeXgD9vw08T5VgkRhzF1/GVoUUUAWhYLVb20yt1X8iLliasNmpJfDbIOBGrxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 15:21:51 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 15:21:50 +0000
Date: Fri, 19 Dec 2025 17:21:42 +0200
From: Imre Deak <imre.deak@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>, Jouni Hogander
 <jouni.hogander@intel.com>, Vinod Govindapillai
 <vinod.govindapillai@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
CC: Ankit K Nautiyal <ankit.k.nautiyal@intel.com>, Jani Nikula
 <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIGk5MTUuQ0kuRnVsbDogc3Vj?=
 =?utf-8?Q?cess_for_drm=2Fi915=2Fdp?= =?utf-8?Q?=3A?= Clean up link BW/DSC
 slice config computation (fixes)
Message-ID: <aUVthnYmAibDfaqA@ideak-desk>
References: <20251215192357.172201-1-imre.deak@intel.com>
 <176585164976.91286.8511052780566467299@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176585164976.91286.8511052780566467299@a3b018990fe9>
X-ClientProxiedBy: LO2P265CA0367.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::19) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|IA0PR11MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: f7cac7be-183d-4234-0fae-08de3f12548b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2gRgYhFBqy/thCXRgzK8tNRiYHSa9o2KzR8UP7CH5u6CyIph5StKwYliOo6X?=
 =?us-ascii?Q?l2EdfxQr1aBSKUFzwmJE7oAvCWz34mPkh8Ts7B7eh5/BZcfQpGUZjkCHeXKL?=
 =?us-ascii?Q?rZ9fWXZp5ljtL6c4fQuen/4dAD7zS62D2IMoqVa0SNrBl0qe6lO6BrhgqyVt?=
 =?us-ascii?Q?Q6k2nFqxOGTvTgmAvfsaiKQk1Z3aj6Mqk7s+jpOwgA+QLyWW9hNOebLJa+Jl?=
 =?us-ascii?Q?6qAYWOUHMJMTrod7OqKIgf47bsaz4zJftZQxczPEcepbUad+FDjVYuiE6L4W?=
 =?us-ascii?Q?2apixvHf4UIkxgvTbRqHLvPzw8kvHQqwSuzuPOOpo3366iPn4psrVX1I4ZLf?=
 =?us-ascii?Q?XJ5F1JGeaT9Ga5zYP6hhtlb10p42GbsbPSbw0UG2prFMlYFES9e2ppD0qOz/?=
 =?us-ascii?Q?7pZuQNoFvcIVYmexuplmoszYRLO3TqB09ko2bZl4o6yGmETnJ2M2ia/0t37T?=
 =?us-ascii?Q?PpbfuxgIVOopP8H9nYw4mCov2f2bdJ5tCUNXXZLLygEe81ssg3bWRJm+Q85j?=
 =?us-ascii?Q?bHSb5xr8KRlWNgdD/A6cHvkA6qiRf6d+gRGV/Sy9a03RAh5BHWUNM+EIvMIN?=
 =?us-ascii?Q?ue3dQL9f1ysMRv3iDqHh9wp+c8Blrd3gYArniUd+4PgUFOTAdyO+OGP624hi?=
 =?us-ascii?Q?RzjrI8JIb367o+AdJDjrhpIwAUYNo2gJaMOuQYFlkcYeCdsX0qKaQ6mrSaQ7?=
 =?us-ascii?Q?3plGyXGMXYrJT/sq0G37qEsrHLTLjkuetlagn4CqAOQ/vL5eKa1NLJvhaBFh?=
 =?us-ascii?Q?tM8QvJZVX2gV5MVkhDEnnd/AgaledsDavKREUmZOrNMvMPXNnWKlj3q7e1VG?=
 =?us-ascii?Q?9Mgo11AACEE59Nq0TwnMDSJD5W0F3AJkB32VeeWy4eIALgJrtQy7wc06qcWw?=
 =?us-ascii?Q?zTGyljllP6GhkmjdelNLZXkjfcTkEFnBPVit9LQSTKmCZP/9AV8Zo85EwVZX?=
 =?us-ascii?Q?bhKY5zXPSonKygwArGhdPJdOEk8hwiTgFTh8iIa7dJcpjR8H1KRpCEwfoKru?=
 =?us-ascii?Q?lUkfNw94ccDnlin5Blg467d7eEZNwJ4zQquioqFzHUqLK+8AznVhM/Wf88/s?=
 =?us-ascii?Q?sezP8BD37CkvVNnQg28mWVCXFdOi1sJTR64fznYJ/khx9EJ1GC15gyjco1KB?=
 =?us-ascii?Q?ew3F5KqV7vbR9XSzHAhzjE3jLIusEKLRuU9VC89UGjAALQLL2dTXe7EHjpfc?=
 =?us-ascii?Q?tlwxdf4xtCNwTjwsyLZRtgoS+AHUjtZdcOybQYJmMzPO8/ExgmZTIatIcONQ?=
 =?us-ascii?Q?ZU11s6YX653s4aZvl6jhI+etwnxzy8CRW2P8vI9uABIlQVeNZpglhm6xl5I2?=
 =?us-ascii?Q?3APEEtFNfgLz9y6seNd6NkokvPJNZqIUEbJDq60gdogUZvdYj8pARDB9oLPU?=
 =?us-ascii?Q?pTJdW45fZPkfSXCQV7NAfJDl6V11xv5/mCKH10fK2ZMkvDA3Uw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EO5FAu7892oZHWwqGPFNwyW91s2eWFko4TsvbHlTOFyNeglEUS6BQMDCZi/1?=
 =?us-ascii?Q?cWxvwCurZ3zXHxj8llvbYmZ7hDyTPx0fYuulmB32HaD7oPUHjYcCr/TfoeM7?=
 =?us-ascii?Q?45cmGGVd6TFWTm7VdHRkOVWinN6e2re1eCO04UNJSEYrnBLFtn7p2BTBDgMe?=
 =?us-ascii?Q?y8ZP+a6PjkRuFBQLC1SCylYbZdHuFgoPe3R9GCjKW/5Eukkfk6DwURVGXQWI?=
 =?us-ascii?Q?QvkZMawISBiuuzPZYbXyj+leb6hWkSXo+dacHki3SCB7AToG8Pszy5jazm+s?=
 =?us-ascii?Q?si6xScnc0uqOQstH6/qUYnMnAGYEXKWJn7sSaf7GATtP1KmvQlBgFpTHaQjY?=
 =?us-ascii?Q?wW5ErrbkyKGZiuGqXKqAp2QfZirG6QEFMQUacvn/ivESvSI1+ImG19HbRkCj?=
 =?us-ascii?Q?E/6ht9o2bIz1iThqlSO7J8gSOBTUxMoTkH9K/nLqn/htGbkuWh6NTqG4Lhfs?=
 =?us-ascii?Q?8LuM2gCFFCv0sqxLz2I2Gpfl5JVuTVcYxCAZv56p9+tSn7c+ktbSNPIEoGda?=
 =?us-ascii?Q?HHeRj90d+w/lXxLI6vnF1fS3AFmbVN9lcgfJ1d6aEwwwRnVVgQ07STJK5364?=
 =?us-ascii?Q?8lDeJHSbOosia/pbhQmg5uR6AGwgyoIpTJFyF6OeRsUz1/efhsGnqTnoujA/?=
 =?us-ascii?Q?Y1jWdqN/3cAHTT24tFHoWxHd5rWq6H9ZlHxHzLO+Kat5WQFnrpYWR3Dl1wX4?=
 =?us-ascii?Q?U5+cbJMkmtitMSD+b4ru9T/0Og6sEDqbG+KNMdKm1Uc5wWK/6l+NqQ5yJTr4?=
 =?us-ascii?Q?kQI5zWznMrTLmc0SfJpu9DqOjXfrEJNv6WLtNYWpK1/UahuP6n8R+qUHJyhY?=
 =?us-ascii?Q?Uav4hz95fDN8GbZ2g9cWPtF0ZMBsdHY+jqoO7TxU5bEWqO70ph7Qei/HIQfb?=
 =?us-ascii?Q?4JukAvhuDnQ841UmkPePfIsCUek8o15ctCWvHx4uSJaI39I8cFDql2fy7suM?=
 =?us-ascii?Q?WigyFBcp1D+7PlI3RXuiojfBFNOjCijtQ/D/+AGcCAZ7eT8U5j2+/EICoc1F?=
 =?us-ascii?Q?3PAPfH80c9y2HLvCBQede/S00MO/d4YNjdUTlMXIy7S6mOT+nIRg8jlftTj1?=
 =?us-ascii?Q?Od5f7hQB68A5QZDfPOEkLGIt2GXe9tq11Hzef0U1LDknPJiC72kigXXbONV1?=
 =?us-ascii?Q?e97VEeyUE2da9tjFZJVee7vwEiOf+YVcAAoVH5XEME3vzfeMz4L1G3PDVFsv?=
 =?us-ascii?Q?HD6cLJT5E2YT4JI8H0fkRzqlLvWPmu9Af7keo2k4RcsXkRyaUodj6VWuv3tw?=
 =?us-ascii?Q?edZzJS9LvRevGv2tdvDiqgIr/AkubGp1u48GSj/MLcOpoggcxE5TWyasj1fi?=
 =?us-ascii?Q?qJ6R4VDp2sHvLOaPIYzruvQnkM+723Dq3xKtCN3D8swek994lfv4kPzRDJSl?=
 =?us-ascii?Q?YFLu0rCZ50Wq7gkgsHnaSThNd0W0tWsx4nyOpITNbHwgy+qh0w7e7QQvGyEl?=
 =?us-ascii?Q?/VMwlf1z7eEAD7ez3t1cBUO7z9VRuNfuER5Jo7bW57beoc4PTgekSpZ+nm9m?=
 =?us-ascii?Q?2tFsmXHhIFcdc+tX0OfOjX4Fyts+sQ1qpQaGkJVP9M7tl4FJ864otfxj4Ho0?=
 =?us-ascii?Q?kSaTRID7+cRSVs6Qq7WdL3hHfzBsZft41vUdYYv8EsihgF95Jl37NQb0L2cy?=
 =?us-ascii?Q?N2ZKtBYUiEU9QZ+FSd0GOI7pkFJv9ByzuPI+27ntS5FqmLsxWOWZqKv2OP/d?=
 =?us-ascii?Q?h44hjqMsfys8pOaxQbW/1ifgNGPywMcOrSsHfnUlSTtx7kSaTq1h7pxIfFaD?=
 =?us-ascii?Q?Bh0RzYORtX0AX4JwR6FSmq0oOCp2jNOmpx0pnkAviHeISOoTVneqxijnTcP3?=
X-MS-Exchange-AntiSpam-MessageData-1: jReFmbJzOwMb0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: f7cac7be-183d-4234-0fae-08de3f12548b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:21:50.0702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: khVGp4QsSQ2aamF0h8/rFyZUE4f2LYSLm6nFyznBMsIw6qde8xpwAmSeExmzqx1n6+4YgdKCBtNNV0o+eBKK3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 16, 2025 at 02:20:49AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915/dp: Clean up link BW/DSC slice config computation (fixes)
> URL   : https://patchwork.freedesktop.org/series/159046/
> State : success

Thanks for the reviews and ack, patchset is pushed to drm-intel-next.

> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17687_full -> Patchwork_159046v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_17687_full and Patchwork_159046v1_full:
> 
> ### New IGT tests (27) ###
> 
>   * igt@gem_exec_balancer@alternate-sync-async-flip-atomic:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@bad-pitch-128:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@basic:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@basic-process:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@basic-with_one_bo_two_files:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@buffer-sharing:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@dp-mst-suspend-resume:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@extended-modeset-hang-oldfb-with-reset:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@fbc-1p-rte:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@fbc-pr-cursor-plane-move:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@fbc-pr-overlay-plane-update-sf-dmg-area:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@fbc-psr2-primary-page-flip:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@fbcpsr-rgb101010-draw-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@invalid-bsd1-flag-on-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@legacy-cursor:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@plane-upscale-20x20-with-rotation:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@pr-cursor-mmap-cpu:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@psr-rgb565-draw-render:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@reset-multiple-signaled:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@single-wait-available-signaled:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@smoketest:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@sysfs-read:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@system-suspend-modeset:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_balancer@yf-tiled-8bpp-rotate-0:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_159046v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-tglu-1:       NOTRUN -> [SKIP][1] ([i915#6230])
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@api_intel_bb@crc32.html
> 
>   * igt@gem_ccs@block-copy-compressed:
>     - shard-tglu-1:       NOTRUN -> [SKIP][2] ([i915#3555] / [i915#9323])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@gem_ccs@block-copy-compressed.html
> 
>   * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
>     - shard-dg2:          [PASS][3] -> [INCOMPLETE][4] ([i915#12392] / [i915#13356])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-5/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg2-6/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
> 
>   * igt@gem_create@create-ext-cpu-access-big:
>     - shard-tglu:         NOTRUN -> [SKIP][5] ([i915#6335])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-10/igt@gem_create@create-ext-cpu-access-big.html
> 
>   * igt@gem_ctx_persistence@smoketest:
>     - shard-snb:          NOTRUN -> [SKIP][6] ([i915#1099]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-snb1/igt@gem_ctx_persistence@smoketest.html
> 
>   * igt@gem_ctx_sseu@mmap-args:
>     - shard-tglu:         NOTRUN -> [SKIP][7] ([i915#280])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-4/igt@gem_ctx_sseu@mmap-args.html
> 
>   * igt@gem_exec_balancer@full-late:
>     - shard-mtlp:         [PASS][8] -> [ABORT][9] ([i915#13562])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-4/igt@gem_exec_balancer@full-late.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-mtlp-8/igt@gem_exec_balancer@full-late.html
> 
>   * igt@gem_exec_balancer@parallel-balancer:
>     - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#4525]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@gem_exec_balancer@parallel-balancer.html
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#4525])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-4/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@gem_exec_fence@concurrent:
>     - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#4812])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@gem_exec_fence@concurrent.html
> 
>   * igt@gem_exec_flush@basic-wb-rw-before-default:
>     - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#3539] / [i915#4852])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@gem_exec_flush@basic-wb-rw-before-default.html
> 
>   * igt@gem_exec_reloc@basic-cpu-read-active:
>     - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#3281])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@gem_exec_reloc@basic-cpu-read-active.html
> 
>   * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
>     - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#3281])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html
> 
>   * igt@gem_exec_suspend@basic-s0@smem:
>     - shard-dg2:          [PASS][16] -> [INCOMPLETE][17] ([i915#13356]) +1 other test incomplete
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-3/igt@gem_exec_suspend@basic-s0@smem.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html
> 
>   * igt@gem_fenced_exec_thrash@too-many-fences:
>     - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#4860])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@gem_fenced_exec_thrash@too-many-fences.html
> 
>   * igt@gem_lmem_evict@dontneed-evict-race:
>     - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#4613] / [i915#7582])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-4/igt@gem_lmem_evict@dontneed-evict-race.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>     - shard-glk:          NOTRUN -> [SKIP][20] ([i915#4613]) +5 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-glk8/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][21] ([i915#4613]) +3 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
> 
>   * igt@gem_lmem_swapping@smem-oom:
>     - shard-tglu:         NOTRUN -> [SKIP][22] ([i915#4613])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-10/igt@gem_lmem_swapping@smem-oom.html
> 
>   * igt@gem_media_vme:
>     - shard-tglu-1:       NOTRUN -> [SKIP][23] ([i915#284])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@gem_media_vme.html
> 
>   * igt@gem_mmap@bad-object:
>     - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#4083]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@gem_mmap@bad-object.html
> 
>   * igt@gem_partial_pwrite_pread@reads-display:
>     - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#3282])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@gem_partial_pwrite_pread@reads-display.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>     - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#3282]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-glk10:        NOTRUN -> [WARN][27] ([i915#14702] / [i915#2658])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-glk10/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_pxp@create-protected-buffer:
>     - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#4270]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@gem_pxp@create-protected-buffer.html
> 
>   * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
>     - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#4079])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-tglu-1:       NOTRUN -> [SKIP][30] ([i915#3297] / [i915#3323])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-cycles:
>     - shard-tglu-1:       NOTRUN -> [SKIP][31] ([i915#3297]) +4 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-cycles.html
> 
>   * igt@gem_workarounds@suspend-resume:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][32] ([i915#13356] / [i915#14586])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-glk8/igt@gem_workarounds@suspend-resume.html
> 
>   * igt@gen9_exec_parse@bb-secure:
>     - shard-tglu-1:       NOTRUN -> [SKIP][33] ([i915#2527] / [i915#2856]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@gen9_exec_parse@bb-secure.html
> 
>   * igt@gen9_exec_parse@secure-batches:
>     - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#2527])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@gen9_exec_parse@secure-batches.html
>     - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#2527] / [i915#2856]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-10/igt@gen9_exec_parse@secure-batches.html
> 
>   * igt@gen9_exec_parse@shadow-peek:
>     - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#2527]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@gen9_exec_parse@shadow-peek.html
> 
>   * igt@i915_drm_fdinfo@busy@rcs0:
>     - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#14073]) +5 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@i915_drm_fdinfo@busy@rcs0.html
> 
>   * igt@i915_drm_fdinfo@virtual-busy-idle-all:
>     - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#14118])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@i915_drm_fdinfo@virtual-busy-idle-all.html
> 
>   * igt@i915_pm_freq_api@freq-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#8399])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-3/igt@i915_pm_freq_api@freq-suspend.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][40] ([i915#8399])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@i915_pm_freq_api@freq-suspend.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle:
>     - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#14498])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-3/igt@i915_pm_rc6_residency@rc6-idle.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][42] ([i915#14498])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle.html
> 
>   * igt@i915_pm_rpm@system-suspend-execbuf:
>     - shard-glk:          [PASS][43] -> [INCOMPLETE][44] ([i915#13356] / [i915#15172])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-glk6/igt@i915_pm_rpm@system-suspend-execbuf.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-glk1/igt@i915_pm_rpm@system-suspend-execbuf.html
> 
>   * igt@i915_pm_rps@thresholds:
>     - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#11681])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@i915_pm_rps@thresholds.html
> 
>   * igt@i915_power@sanity:
>     - shard-mtlp:         [PASS][46] -> [SKIP][47] ([i915#7984])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-6/igt@i915_power@sanity.html
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-mtlp-5/igt@i915_power@sanity.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - shard-dg2:          [PASS][48] -> [DMESG-FAIL][49] ([i915#12061]) +1 other test dmesg-fail
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-1/igt@i915_selftest@live@workarounds.html
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg2-4/igt@i915_selftest@live@workarounds.html
>     - shard-mtlp:         [PASS][50] -> [DMESG-FAIL][51] ([i915#12061]) +1 other test dmesg-fail
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-7/igt@i915_selftest@live@workarounds.html
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-mtlp-3/igt@i915_selftest@live@workarounds.html
> 
>   * igt@i915_suspend@debugfs-reader:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][52] ([i915#4817])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-glk5/igt@i915_suspend@debugfs-reader.html
> 
>   * igt@i915_suspend@fence-restore-untiled:
>     - shard-rkl:          [PASS][53] -> [ABORT][54] ([i915#15131])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-1/igt@i915_suspend@fence-restore-untiled.html
> 
>   * igt@i915_suspend@forcewake:
>     - shard-glk10:        NOTRUN -> [INCOMPLETE][55] ([i915#4817])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-glk10/igt@i915_suspend@forcewake.html
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-rkl:          [PASS][56] -> [INCOMPLETE][57] ([i915#4817])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-7/igt@i915_suspend@sysfs-reader.html
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-3/igt@i915_suspend@sysfs-reader.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#9531])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>     - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#9531])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#1769] / [i915#3555])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#5286]) +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4538] / [i915#5286])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>     - shard-tglu:         NOTRUN -> [SKIP][63] ([i915#5286]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-4/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-tglu-1:       NOTRUN -> [SKIP][64] ([i915#5286]) +3 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-mtlp:         [PASS][65] -> [FAIL][66] ([i915#5138])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#3638])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_big_fb@linear-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>     - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4538])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:
>     - shard-glk10:        NOTRUN -> [SKIP][69] +226 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-glk10/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][70] ([i915#12313])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#6095]) +19 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-10/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-3:
>     - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#10307] / [i915#6095]) +133 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg2-11/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-3.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#14544] / [i915#6095]) +8 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#6095]) +96 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#6095]) +35 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][76] ([i915#12796]) +1 other test incomplete
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-glk8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
>     - shard-tglu-1:       NOTRUN -> [SKIP][77] ([i915#6095]) +44 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][78] ([i915#12313]) +1 other test skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#12313])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#14098] / [i915#6095]) +54 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#6095]) +145 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#14098] / [i915#14544] / [i915#6095]) +4 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4423] / [i915#6095])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-19/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
>     - shard-glk:          NOTRUN -> [SKIP][84] +340 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-glk5/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#10307] / [i915#10434] / [i915#6095]) +5 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#13781]) +3 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-tglu:         NOTRUN -> [SKIP][87] ([i915#3742])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-4/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio:
>     - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#11151] / [i915#7828]) +4 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_chamelium_audio@hdmi-audio.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
>     - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#11151] / [i915#7828]) +2 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
>     - shard-tglu:         NOTRUN -> [SKIP][90] ([i915#11151] / [i915#7828]) +4 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-10/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>     - shard-tglu-1:       NOTRUN -> [SKIP][91] ([i915#11151] / [i915#7828]) +5 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_content_protection@dp-mst-suspend-resume:
>     - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#15330])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@kms_content_protection@dp-mst-suspend-resume.html
>     - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#15330])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-10/igt@kms_content_protection@dp-mst-suspend-resume.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#3116])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-tglu-1:       NOTRUN -> [SKIP][95] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-3:
>     - shard-dg2:          NOTRUN -> [FAIL][96] ([i915#7173]) +1 other test fail
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg2-11/igt@kms_content_protection@srm@pipe-a-dp-3.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-4/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x32:
>     - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#3555]) +3 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-tglu-1:       NOTRUN -> [SKIP][99] ([i915#13049]) +2 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-max-size:
>     - shard-tglu-1:       NOTRUN -> [SKIP][100] ([i915#3555]) +3 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-random-256x85:
>     - shard-tglu:         [PASS][101] -> [FAIL][102] ([i915#13566]) +1 other test fail
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-8/igt@kms_cursor_crc@cursor-random-256x85.html
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-3/igt@kms_cursor_crc@cursor-random-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-tglu:         NOTRUN -> [SKIP][103] ([i915#13049])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-10/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>     - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#13049])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [FAIL][105] ([i915#13566]) +1 other test fail
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x21:
>     - shard-rkl:          [PASS][106] -> [FAIL][107] ([i915#13566]) +2 other tests fail
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-64x21.html
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-64x21.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#4103])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-tglu-1:       NOTRUN -> [SKIP][109] ([i915#4103])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#9723])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#3804])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
>     - shard-dg2:          [PASS][112] -> [SKIP][113] ([i915#3555])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg2-3/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
>     - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#3555])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#13749])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-4/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-tglu-1:       NOTRUN -> [SKIP][116] ([i915#13749])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_dp_link_training@uhbr-sst:
>     - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#13748])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#8812])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@kms_draw_crc@draw-method-mmap-gtt.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#3955])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-3/igt@kms_fbcon_fbt@psr.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][120] ([i915#3469])
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-tglu-1:       NOTRUN -> [SKIP][121] ([i915#658])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#9934]) +3 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@2x-plain-flip-interruptible:
>     - shard-tglu-1:       NOTRUN -> [SKIP][123] ([i915#3637] / [i915#9934]) +3 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_flip@2x-plain-flip-interruptible.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#9934])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
>     - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#3637] / [i915#9934]) +2 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-10/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-tglu-1:       NOTRUN -> [SKIP][126] ([i915#2672] / [i915#3555]) +2 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>     - shard-tglu-1:       NOTRUN -> [SKIP][127] ([i915#2587] / [i915#2672]) +2 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>     - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#2587] / [i915#2672] / [i915#3555])
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
>     - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#2672] / [i915#3555])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
>     - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#2672] / [i915#3555]) +1 other test skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#2587] / [i915#2672]) +2 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html
>     - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#2587] / [i915#2672])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#2672] / [i915#3555])
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#2672])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-tglu-1:       NOTRUN -> [SKIP][135] +42 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#1825]) +19 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][137] +6 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-tglu-1:       NOTRUN -> [SKIP][138] ([i915#5439])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#15102]) +1 other test skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#8708]) +3 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
>     - shard-tglu:         NOTRUN -> [SKIP][141] +21 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#15102] / [i915#3458]) +4 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:
>     - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#15102]) +11 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#15102] / [i915#3023]) +8 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render:
>     - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#15102])
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
>     - shard-tglu-1:       NOTRUN -> [SKIP][146] ([i915#15102]) +17 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html
> 
>   * igt@kms_getfb@getfb-reject-nv12:
>     - shard-dg1:          [PASS][147] -> [DMESG-WARN][148] ([i915#4423]) +1 other test dmesg-warn
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-12/igt@kms_getfb@getfb-reject-nv12.html
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-19/igt@kms_getfb@getfb-reject-nv12.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#1187] / [i915#12713])
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][150] ([i915#12713])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-dg2:          [PASS][151] -> [SKIP][152] ([i915#3555] / [i915#8228]) +1 other test skip
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-11/igt@kms_hdr@static-toggle.html
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg2-1/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_hdr@static-toggle-dpms:
>     - shard-rkl:          [PASS][153] -> [SKIP][154] ([i915#3555] / [i915#8228])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_hdr@static-toggle-dpms.html
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_hdr@static-toggle-dpms.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#12339])
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-4/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#10656])
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-3/igt@kms_joiner@invalid-modeset-big-joiner.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][157] ([i915#10656])
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>     - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#14712])
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
> 
>   * igt@kms_plane_alpha_blend@alpha-transparent-fb:
>     - shard-glk10:        NOTRUN -> [FAIL][159] ([i915#10647] / [i915#12177])
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-glk10/igt@kms_plane_alpha_blend@alpha-transparent-fb.html
> 
>   * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
>     - shard-glk10:        NOTRUN -> [FAIL][160] ([i915#10647]) +1 other test fail
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-glk10/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:
>     - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#15329]) +9 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html
> 
>   * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
>     - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#15329]) +9 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-10/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#12343])
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-4/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-rkl:          [PASS][164] -> [SKIP][165] ([i915#15073]) +1 other test skip
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp.html
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][166] ([i915#15073])
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
>     - shard-snb:          NOTRUN -> [SKIP][167] ([i915#11520]) +2 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-snb1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
>     - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#11520]) +1 other test skip
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
>     - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#11520]) +6 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>     - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#11520]) +4 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>     - shard-glk:          NOTRUN -> [SKIP][171] ([i915#11520]) +8 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-glk5/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
>     - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#11520]) +3 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-10/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
>     - shard-glk10:        NOTRUN -> [SKIP][173] ([i915#11520]) +4 other tests skip
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-glk10/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr@fbc-psr2-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#1072] / [i915#9732]) +9 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_psr@fbc-psr2-suspend.html
> 
>   * igt@kms_psr@pr-cursor-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#1072] / [i915#9732]) +4 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@kms_psr@pr-cursor-mmap-gtt.html
> 
>   * igt@kms_psr@psr-cursor-plane-onoff:
>     - shard-tglu-1:       NOTRUN -> [SKIP][176] ([i915#9732]) +12 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_psr@psr-cursor-plane-onoff.html
> 
>   * igt@kms_psr@psr2-cursor-plane-onoff:
>     - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#9732]) +10 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-4/igt@kms_psr@psr2-cursor-plane-onoff.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-tglu-1:       NOTRUN -> [SKIP][178] ([i915#9685]) +1 other test skip
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>     - shard-tglu-1:       NOTRUN -> [SKIP][179] ([i915#5289])
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#5289])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#3555])
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-4/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-tglu-1:       NOTRUN -> [SKIP][182] ([i915#8623])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][183] ([i915#12276])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-glk9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-2:
>     - shard-rkl:          [PASS][184] -> [ABORT][185] ([i915#15132]) +1 other test abort
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-4/igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-2.html
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-1/igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#15243] / [i915#3555])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-3/igt@kms_vrr@flip-suspend.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#9906])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-4/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@perf_pmu@busy-double-start@vecs0:
>     - shard-mtlp:         [PASS][188] -> [FAIL][189] ([i915#4349])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-mtlp-8/igt@perf_pmu@busy-double-start@vecs0.html
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-mtlp-7/igt@perf_pmu@busy-double-start@vecs0.html
> 
>   * igt@perf_pmu@rc6-suspend:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][190] ([i915#13356])
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-glk6/igt@perf_pmu@rc6-suspend.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-tglu:         NOTRUN -> [FAIL][191] ([i915#12910])
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-10/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>     - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#9917])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-16/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   * igt@sysfs_timeslice_duration@idempotent@vcs0:
>     - shard-snb:          NOTRUN -> [SKIP][193] +57 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-snb1/igt@sysfs_timeslice_duration@idempotent@vcs0.html
> 
>   * igt@tools_test@sysfs_l3_parity:
>     - shard-rkl:          NOTRUN -> [SKIP][194] +6 other tests skip
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@tools_test@sysfs_l3_parity.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-glk:          [ABORT][195] -> [PASS][196]
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-glk5/igt@i915_module_load@reload-with-fault-injection.html
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-glk5/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-dg1:          [DMESG-WARN][197] ([i915#4391] / [i915#4423]) -> [PASS][198]
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@i915_suspend@basic-s3-without-i915.html
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-18/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@i915_suspend@debugfs-reader:
>     - shard-rkl:          [ABORT][199] ([i915#15131]) -> [PASS][200]
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-1/igt@i915_suspend@debugfs-reader.html
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-3/igt@i915_suspend@debugfs-reader.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x21:
>     - shard-tglu:         [FAIL][201] ([i915#13566]) -> [PASS][202] +1 other test pass
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-64x21.html
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-64x21.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-rkl:          [INCOMPLETE][203] ([i915#6113]) -> [PASS][204]
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:
>     - shard-dg2:          [FAIL][205] ([i915#6880]) -> [PASS][206]
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-dg2:          [SKIP][207] ([i915#3555] / [i915#8228]) -> [PASS][208]
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-8/igt@kms_hdr@static-toggle-suspend.html
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg2-11/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-dg2:          [SKIP][209] ([i915#10656] / [i915#12388]) -> [PASS][210]
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg2-11/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-dg2:          [SKIP][211] ([i915#15073]) -> [PASS][212] +2 other tests pass
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>     - shard-rkl:          [SKIP][213] ([i915#15073]) -> [PASS][214] +2 other tests pass
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
>     - shard-glk:          [INCOMPLETE][215] ([i915#12276]) -> [PASS][216]
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-glk8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-glk9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-dg2:          [SKIP][217] ([i915#3555] / [i915#9906]) -> [PASS][218]
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_vrr@negative-basic.html
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg2-11/igt@kms_vrr@negative-basic.html
> 
>   * igt@perf_pmu@rc6-suspend:
>     - shard-rkl:          [INCOMPLETE][219] ([i915#13520]) -> [PASS][220]
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@perf_pmu@rc6-suspend.html
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@perf_pmu@rc6-suspend.html
> 
>   
> #### Warnings ####
> 
>   * igt@api_intel_bb@blit-reloc-keep-cache:
>     - shard-rkl:          [SKIP][221] ([i915#14544] / [i915#8411]) -> [SKIP][222] ([i915#8411])
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@api_intel_bb@blit-reloc-keep-cache.html
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@api_intel_bb@blit-reloc-keep-cache.html
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-rkl:          [SKIP][223] ([i915#11078]) -> [SKIP][224] ([i915#11078] / [i915#14544])
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@device_reset@cold-reset-bound.html
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@device_reset@cold-reset-bound.html
> 
>   * igt@gem_ccs@block-multicopy-inplace:
>     - shard-rkl:          [SKIP][225] ([i915#3555] / [i915#9323]) -> [SKIP][226] ([i915#14544] / [i915#3555] / [i915#9323])
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@gem_ccs@block-multicopy-inplace.html
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-rkl:          [SKIP][227] ([i915#9323]) -> [SKIP][228] ([i915#14544] / [i915#9323])
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@gem_ccs@suspend-resume.html
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@gem_ccs@suspend-resume.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-rkl:          [SKIP][229] ([i915#7697]) -> [SKIP][230] ([i915#14544] / [i915#7697])
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@gem_close_race@multigpu-basic-threads.html
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_ctx_sseu@invalid-args:
>     - shard-rkl:          [SKIP][231] ([i915#280]) -> [SKIP][232] ([i915#14544] / [i915#280])
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@gem_ctx_sseu@invalid-args.html
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html
> 
>   * igt@gem_exec_balancer@parallel-contexts:
>     - shard-rkl:          [SKIP][233] ([i915#14544] / [i915#4525]) -> [SKIP][234] ([i915#4525])
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@gem_exec_balancer@parallel-contexts.html
> 
>   * igt@gem_exec_balancer@parallel-keep-submit-fence:
>     - shard-rkl:          [SKIP][235] ([i915#4525]) -> [SKIP][236] ([i915#14544] / [i915#4525]) +1 other test skip
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@gem_exec_balancer@parallel-keep-submit-fence.html
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-submit-fence.html
> 
>   * igt@gem_exec_reloc@basic-write-read:
>     - shard-rkl:          [SKIP][237] ([i915#14544] / [i915#3281]) -> [SKIP][238] ([i915#3281])
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@gem_exec_reloc@basic-write-read.html
> 
>   * igt@gem_exec_reloc@basic-write-read-active:
>     - shard-rkl:          [SKIP][239] ([i915#3281]) -> [SKIP][240] ([i915#14544] / [i915#3281]) +6 other tests skip
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@gem_exec_reloc@basic-write-read-active.html
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-active.html
> 
>   * igt@gem_lmem_swapping@parallel-multi:
>     - shard-rkl:          [SKIP][241] ([i915#4613]) -> [SKIP][242] ([i915#14544] / [i915#4613]) +2 other tests skip
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@gem_lmem_swapping@parallel-multi.html
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.html
> 
>   * igt@gem_partial_pwrite_pread@write-display:
>     - shard-rkl:          [SKIP][243] ([i915#14544] / [i915#3282]) -> [SKIP][244] ([i915#3282])
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@gem_partial_pwrite_pread@write-display.html
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@gem_partial_pwrite_pread@write-display.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>     - shard-rkl:          [SKIP][245] ([i915#8411]) -> [SKIP][246] ([i915#14544] / [i915#8411]) +1 other test skip
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
> 
>   * igt@gem_set_tiling_vs_pwrite:
>     - shard-rkl:          [SKIP][247] ([i915#3282]) -> [SKIP][248] ([i915#14544] / [i915#3282]) +4 other tests skip
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-after-close:
>     - shard-rkl:          [SKIP][249] ([i915#3297]) -> [SKIP][250] ([i915#14544] / [i915#3297]) +1 other test skip
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap-after-close.html
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-after-close.html
> 
>   * igt@gen9_exec_parse@batch-invalid-length:
>     - shard-rkl:          [SKIP][251] ([i915#14544] / [i915#2527]) -> [SKIP][252] ([i915#2527]) +1 other test skip
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@gen9_exec_parse@batch-invalid-length.html
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@gen9_exec_parse@batch-invalid-length.html
> 
>   * igt@gen9_exec_parse@bb-start-out:
>     - shard-rkl:          [SKIP][253] ([i915#2527]) -> [SKIP][254] ([i915#14544] / [i915#2527]) +1 other test skip
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@gen9_exec_parse@bb-start-out.html
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html
> 
>   * igt@i915_pm_freq_api@freq-reset-multiple:
>     - shard-rkl:          [SKIP][255] ([i915#8399]) -> [SKIP][256] ([i915#14544] / [i915#8399]) +1 other test skip
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@i915_pm_freq_api@freq-reset-multiple.html
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-rkl:          [SKIP][257] ([i915#4387]) -> [SKIP][258] ([i915#14544] / [i915#4387])
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@i915_pm_sseu@full-enable.html
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-rkl:          [SKIP][259] ([i915#7707]) -> [SKIP][260] ([i915#14544] / [i915#7707])
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@intel_hwmon@hwmon-read.html
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
>     - shard-rkl:          [SKIP][261] ([i915#5286]) -> [SKIP][262] ([i915#14544] / [i915#5286]) +4 other tests skip
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-rkl:          [SKIP][263] ([i915#14544] / [i915#5286]) -> [SKIP][264] ([i915#5286])
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-rkl:          [SKIP][265] ([i915#3638]) -> [SKIP][266] ([i915#14544] / [i915#3638])
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_big_fb@linear-16bpp-rotate-270.html
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
>     - shard-rkl:          [SKIP][267] ([i915#6095]) -> [SKIP][268] ([i915#14544] / [i915#6095]) +9 other tests skip
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
>     - shard-rkl:          [SKIP][269] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][270] ([i915#14098] / [i915#6095]) +1 other test skip
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>     - shard-rkl:          [SKIP][271] ([i915#14098] / [i915#6095]) -> [SKIP][272] ([i915#14098] / [i915#14544] / [i915#6095]) +14 other tests skip
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
>     - shard-dg1:          [SKIP][273] ([i915#6095]) -> [SKIP][274] ([i915#4423] / [i915#6095])
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-12/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-19/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio:
>     - shard-dg1:          [SKIP][275] ([i915#11151] / [i915#4423] / [i915#7828]) -> [SKIP][276] ([i915#11151] / [i915#7828])
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-15/igt@kms_chamelium_audio@hdmi-audio.html
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-15/igt@kms_chamelium_audio@hdmi-audio.html
> 
>   * igt@kms_chamelium_edid@dp-edid-read:
>     - shard-rkl:          [SKIP][277] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][278] ([i915#11151] / [i915#7828]) +2 other tests skip
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-read.html
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_chamelium_edid@dp-edid-read.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-rkl:          [SKIP][279] ([i915#11151] / [i915#7828]) -> [SKIP][280] ([i915#11151] / [i915#14544] / [i915#7828]) +6 other tests skip
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-dg2:          [SKIP][281] ([i915#6944] / [i915#7118] / [i915#9424]) -> [FAIL][282] ([i915#7173])
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_content_protection@atomic.html
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg2-11/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-rkl:          [SKIP][283] ([i915#3116]) -> [SKIP][284] ([i915#14544] / [i915#3116]) +1 other test skip
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_content_protection@dp-mst-type-1.html
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2:          [SKIP][285] ([i915#6944] / [i915#7118]) -> [FAIL][286] ([i915#7173])
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_content_protection@srm.html
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg2-11/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-rkl:          [SKIP][287] ([i915#6944] / [i915#7118] / [i915#9424]) -> [SKIP][288] ([i915#14544] / [i915#6944] / [i915#7118] / [i915#9424])
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_content_protection@type1.html
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_content_protection@type1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-rkl:          [SKIP][289] ([i915#13049]) -> [SKIP][290] ([i915#13049] / [i915#14544])
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-rkl:          [SKIP][291] ([i915#13049] / [i915#14544]) -> [SKIP][292] ([i915#13049]) +1 other test skip
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
>     - shard-rkl:          [SKIP][293] ([i915#14544] / [i915#3555]) -> [SKIP][294] ([i915#3555]) +1 other test skip
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-rkl:          [SKIP][295] ([i915#4103]) -> [SKIP][296] ([i915#14544] / [i915#4103])
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-rkl:          [SKIP][297] ([i915#14544]) -> [SKIP][298] +5 other tests skip
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-rkl:          [SKIP][299] ([i915#13691]) -> [SKIP][300] ([i915#13691] / [i915#14544])
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_display_modes@extended-mode-basic.html
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-rkl:          [SKIP][301] ([i915#13707]) -> [SKIP][302] ([i915#13707] / [i915#14544])
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-rkl:          [SKIP][303] ([i915#3555] / [i915#3840]) -> [SKIP][304] ([i915#14544] / [i915#3555] / [i915#3840])
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_dsc@dsc-basic.html
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-rkl:          [SKIP][305] ([i915#3955]) -> [SKIP][306] ([i915#14544] / [i915#3955])
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-rkl:          [SKIP][307] ([i915#1839]) -> [SKIP][308] ([i915#14544] / [i915#1839])
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_feature_discovery@display-2x.html
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-flip-vs-fences-interruptible:
>     - shard-rkl:          [SKIP][309] ([i915#9934]) -> [SKIP][310] ([i915#14544] / [i915#9934]) +5 other tests skip
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_flip@2x-flip-vs-fences-interruptible.html
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
>     - shard-rkl:          [SKIP][311] ([i915#14544] / [i915#9934]) -> [SKIP][312] ([i915#9934]) +1 other test skip
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>     - shard-rkl:          [SKIP][313] ([i915#2672] / [i915#3555]) -> [SKIP][314] ([i915#14544] / [i915#2672] / [i915#3555])
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-rkl:          [SKIP][315] ([i915#2672]) -> [SKIP][316] ([i915#14544] / [i915#2672])
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>     - shard-rkl:          [SKIP][317] ([i915#14544] / [i915#2672] / [i915#3555]) -> [SKIP][318] ([i915#2672] / [i915#3555])
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          [SKIP][319] ([i915#14544] / [i915#2672]) -> [SKIP][320] ([i915#2672])
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
>     - shard-rkl:          [SKIP][321] ([i915#14544] / [i915#1825]) -> [SKIP][322] ([i915#1825]) +10 other tests skip
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg1:          [SKIP][323] ([i915#4423] / [i915#8708]) -> [SKIP][324] ([i915#8708])
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
>     - shard-rkl:          [SKIP][325] -> [SKIP][326] ([i915#14544]) +13 other tests skip
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-rkl:          [SKIP][327] ([i915#1825]) -> [SKIP][328] ([i915#14544] / [i915#1825]) +24 other tests skip
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
>     - shard-dg2:          [SKIP][329] ([i915#15102] / [i915#3458]) -> [SKIP][330] ([i915#10433] / [i915#15102] / [i915#3458]) +4 other tests skip
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-rkl:          [SKIP][331] ([i915#9766]) -> [SKIP][332] ([i915#14544] / [i915#9766])
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
>     - shard-rkl:          [SKIP][333] ([i915#15102]) -> [SKIP][334] ([i915#14544] / [i915#15102]) +2 other tests skip
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu:
>     - shard-rkl:          [SKIP][335] ([i915#14544] / [i915#15102]) -> [SKIP][336] ([i915#15102])
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu.html
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
>     - shard-dg2:          [SKIP][337] ([i915#10433] / [i915#15102] / [i915#3458]) -> [SKIP][338] ([i915#15102] / [i915#3458]) +5 other tests skip
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt:
>     - shard-rkl:          [SKIP][339] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][340] ([i915#15102] / [i915#3023]) +4 other tests skip
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt.html
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
>     - shard-dg1:          [SKIP][341] ([i915#4423]) -> [SKIP][342]
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
>     - shard-rkl:          [SKIP][343] ([i915#15102] / [i915#3023]) -> [SKIP][344] ([i915#14544] / [i915#15102] / [i915#3023]) +11 other tests skip
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-rkl:          [SKIP][345] ([i915#10656]) -> [SKIP][346] ([i915#10656] / [i915#14544])
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_joiner@basic-big-joiner.html
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
>     - shard-rkl:          [SKIP][347] ([i915#15329] / [i915#3555]) -> [SKIP][348] ([i915#14544] / [i915#15329] / [i915#3555])
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
>     - shard-rkl:          [SKIP][349] ([i915#15329]) -> [SKIP][350] ([i915#14544] / [i915#15329]) +2 other tests skip
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-rkl:          [SKIP][351] ([i915#5354]) -> [SKIP][352] ([i915#14544] / [i915#5354])
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_pm_backlight@bad-brightness.html
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-rkl:          [SKIP][353] ([i915#3828]) -> [SKIP][354] ([i915#9340])
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-rkl:          [SKIP][355] ([i915#15073]) -> [SKIP][356] ([i915#14544] / [i915#15073])
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
>     - shard-rkl:          [SKIP][357] ([i915#11520] / [i915#14544]) -> [SKIP][358] ([i915#11520])
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
>     - shard-rkl:          [SKIP][359] ([i915#11520]) -> [SKIP][360] ([i915#11520] / [i915#14544]) +5 other tests skip
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-rkl:          [SKIP][361] ([i915#14544] / [i915#9683]) -> [SKIP][362] ([i915#9683])
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_psr2_su@page_flip-xrgb8888.html
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr-no-drrs:
>     - shard-rkl:          [SKIP][363] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][364] ([i915#1072] / [i915#9732]) +1 other test skip
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_psr@fbc-psr-no-drrs.html
>    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_psr@fbc-psr-no-drrs.html
> 
>   * igt@kms_psr@pr-sprite-mmap-gtt:
>     - shard-rkl:          [SKIP][365] ([i915#1072] / [i915#9732]) -> [SKIP][366] ([i915#1072] / [i915#14544] / [i915#9732]) +14 other tests skip
>    [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_psr@pr-sprite-mmap-gtt.html
>    [366]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_psr@pr-sprite-mmap-gtt.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-rkl:          [SKIP][367] ([i915#14544] / [i915#5289]) -> [SKIP][368] ([i915#5289])
>    [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
>    [368]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full-aspect:
>     - shard-dg1:          [SKIP][369] ([i915#3555] / [i915#4423]) -> [SKIP][370] ([i915#3555])
>    [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-dg1-19/igt@kms_scaling_modes@scaling-mode-full-aspect.html
>    [370]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-dg1-13/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> 
>   * igt@kms_setmode@invalid-clone-exclusive-crtc:
>     - shard-rkl:          [SKIP][371] ([i915#3555]) -> [SKIP][372] ([i915#14544] / [i915#3555]) +2 other tests skip
>    [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html
>    [372]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-rkl:          [SKIP][373] ([i915#14544] / [i915#15243] / [i915#3555]) -> [SKIP][374] ([i915#15243] / [i915#3555])
>    [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-6/igt@kms_vrr@flip-basic.html
>    [374]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-1/igt@kms_vrr@flip-basic.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-rkl:          [SKIP][375] ([i915#15243] / [i915#3555]) -> [SKIP][376] ([i915#14544] / [i915#15243] / [i915#3555])
>    [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_vrr@flipline.html
>    [376]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_vrr@flipline.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-rkl:          [SKIP][377] ([i915#11920]) -> [SKIP][378] ([i915#11920] / [i915#14544])
>    [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17687/shard-rkl-3/igt@kms_vrr@lobf.html
>    [378]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/shard-rkl-6/igt@kms_vrr@lobf.html
> 
>   
>   [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>   [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
>   [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>   [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
>   [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
>   [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
>   [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
>   [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>   [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
>   [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
>   [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
>   [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
>   [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
>   [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
>   [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
>   [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
>   [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
>   [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
>   [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
>   [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
>   [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
>   [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
>   [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
>   [i915#13562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562
>   [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
>   [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
>   [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
>   [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
>   [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
>   [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
>   [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
>   [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
>   [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
>   [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
>   [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
>   [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
>   [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
>   [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
>   [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
>   [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
>   [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
>   [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
>   [i915#15172]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172
>   [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
>   [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
>   [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
>   [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
>   [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>   [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
>   [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
>   [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
>   [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>   [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>   [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
>   [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
>   [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
>   [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>   [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>   [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>   [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
>   [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
>   [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
>   [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>   [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
>   [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>   [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
>   [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>   [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
>   [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
>   [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>   [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
>   [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
>   [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
>   [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
>   [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
>   [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
>   [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
>   [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
>   [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
>   [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
>   [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
>   [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>   [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
>   [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>   [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
>   [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>   [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>   [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
>   [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>   [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
>   [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
>   [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
>   [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
>   [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
>   [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
>   [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
>   [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * Linux: CI_DRM_17687 -> Patchwork_159046v1
> 
>   CI-20190529: 20190529
>   CI_DRM_17687: 89b7f1ac50d51d9c2334e119fe40de41b366333f @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_8666: 8666
>   Patchwork_159046v1: 89b7f1ac50d51d9c2334e119fe40de41b366333f @ git://anongit.freedesktop.org/gfx-ci/linux
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159046v1/index.html
