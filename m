Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD93AFEFB5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 19:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF8A10E342;
	Wed,  9 Jul 2025 17:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZ7bxvbs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A348810E04F;
 Wed,  9 Jul 2025 17:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752081645; x=1783617645;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=B1oAc1/N1z7bNeYTMllVMm7LZyurXpSfyaTZwTYqySo=;
 b=iZ7bxvbsWnybWebFRWg+IpneqohehwiPSXUvigWAkKsKrjWHiFpCeQ2Z
 l8xCAhgbhkvSR5764f3ZIwOv8NFFdAMTsylKjYk2ZaKm+/fxSC98qpxJe
 y7sR4IUTfj8SG8tQei5tapNw/byVrjhe2QvcvpJHqPdMpTiJkCfe6vz+o
 T53uQrh00Ewq3TZaRq4mooXVUX/+Cm8FpzQeXpf/3ZQOnO/Y8RG/NQJY/
 I8cqjeEWZamMr+Mr3UWQnttICndGEUuzfk4HkvHEKTs+iXnsGzaCVvuvc
 4g+UczM2ln4RTQDkbuGloE8lNVrI1VNm1tEEQX0gD6+hZfE/ET2USnTHY w==;
X-CSE-ConnectionGUID: dq8DxFn8Tbu7SkWYxsH/5Q==
X-CSE-MsgGUID: fJSsVp5fRbOkdj0dehSgIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54322674"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54322674"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 10:20:43 -0700
X-CSE-ConnectionGUID: nY30O3vDS3WM60qY8zK+Uw==
X-CSE-MsgGUID: ie/ROZpfTRqPgCjVrIqJRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="186803614"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 10:20:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 10:20:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 10:20:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.77)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 10:20:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPiBYd63CRw5VUHoIT1Wr/ICF07OdGF4lb4Z0Srb8mJKcrGrFA9iygGP02tUN6/zBJPwGibhFIfhtXvfdQqsGn5lK+jGndju3lKgnawc1p5pSAZzHPjWFj4pDuJ7G0s+pQpCoTZgbnLyVaJs9oZfhQeXuQl6BETTkAZVJuRSfRvtc+/ZoNZfIN4VEjfz2kE76ZN2ksrIv2c8EGo3qL0jvztm8Tf4pe79VbYiIoLNVi8GAcj6K004TKw+9cJbQ5blod/4fY5fuLxI7wJlHqL1+gW5rasZO8+dA66PAswD3AYGJdQH6ytcJYgP9Rha1RkREGxh1YJf5IDLWdqnbwMGAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSyAL3RNR0JJElklmCLPsgLkFxjAxpfQpxadUzfgNWo=;
 b=vdO8kKDKgOnOLb6XgfvSzIJA+hk+NOvxcBG8/PZF2CPB6SCJx18o6eie5suNa/40U0OW2kK7ZD304PpMhz8nkANMbSLsDtlxarKAGSAdDi1nzYzPOQxHGIouGp64svGvwoyJV2t94Kw08BCeKZ7b6kk0CbEarAHd1FCfqtsVQ8lfFJKNLAFE2iaISpCjP5NJ44yjGl3V0wXeoasybU/RBcHwuxsMYvwYqNAqXhjO87THDNfNCUkhhIGTTEzRWI+mWuF2YPgkWK9t9nz1xvXJUWOdpTDtMhd/NhNhB2jjPi3dW18ss3GzcdJXO63sC11BBds3nrUfgexduAb2Yx+NXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7347.namprd11.prod.outlook.com (2603:10b6:610:14f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Wed, 9 Jul
 2025 17:20:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 17:20:37 +0000
Date: Wed, 9 Jul 2025 10:22:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <kernel-dev@igalia.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH] drm/sched: Avoid double re-lock on the job free path
Message-ID: <aG6lTURGI2tVqRP+@lstrano-desk.jf.intel.com>
References: <20250708122032.75668-1-tvrtko.ursulin@igalia.com>
 <aG3z38CePTKpvjfE@lstrano-desk.jf.intel.com>
 <9826ee93-d14f-473a-a53f-581f02391569@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9826ee93-d14f-473a-a53f-581f02391569@igalia.com>
X-ClientProxiedBy: MW4PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:303:b6::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: e7bfa0a0-9d4e-4f42-66e5-08ddbf0cebda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?3kg1CgtGLk0Bn4lnvJUm29y9RpMDFcxqRh/Xty8MfoULgW9NiWFraKATvx?=
 =?iso-8859-1?Q?2Kf/ZjNYv0Tc4742qWMwDlkZoH8oBP7rq2eEZa45PzpbWOo9TZM1deGCOO?=
 =?iso-8859-1?Q?C9FsG19Sl8CnIsnwvqE+Fzm/7LRM7tTS/+UQS2NwGMI3waUF9ogTmsPp0p?=
 =?iso-8859-1?Q?as7MbeguRAR8/J/D6jYM84juhTxsZnGIwe7Z1XtvG/6BEmFbOEq87qqUWU?=
 =?iso-8859-1?Q?hFVtd7F0CxxwlR111NnJw9HVO95Crv2zS5qytKAv89uDJG8K5GTUbX1n6J?=
 =?iso-8859-1?Q?JGKq2s+5IuPMOgeicrRIt2Ctf5lWAnVL0Ca509zwd/RUbR9g/e0mU06y8N?=
 =?iso-8859-1?Q?LYHHtSFoJRqgNiJ3gqZXude/bcFI1papwDrpWa6OuXDzrHQffbBr3MRhxW?=
 =?iso-8859-1?Q?M5OZGBqq+teWVUGGsyHDX/y741cR3figqY8vuUgOwQCx76pP3huB3fMs6A?=
 =?iso-8859-1?Q?nJQ+WAWHQUgu4KMgDlfeV0Ra+O92QAUkNZarbC/xRPBGoasBkzoB1RlnvW?=
 =?iso-8859-1?Q?/PTXjI96+TYW3Y8f3UjBvs1OYxK5/1hy+cUl8NUDrn9Tk390NVgs10Cz2x?=
 =?iso-8859-1?Q?UVoNY8mGXvWVgsKaBPnf6n1hENpyByxrFyZuF63gt7KwQVATYIBqUfMtCT?=
 =?iso-8859-1?Q?bsJILbm7kVNmmESFuYG3iy2VJLOenBofKsXjWb9SWaztQnmNuMkQITfaf1?=
 =?iso-8859-1?Q?uWq1aJOgecI8IsMqfs3MBE+6c7rpG0kK5VhfISrI6s7ecAsJwHmbxLmhqC?=
 =?iso-8859-1?Q?3FSw7qgzC2ln1J911TbRpLz7LUspS2DGWnCL1Jj0qteEBg6u9NT1OMuyCu?=
 =?iso-8859-1?Q?6HkTA80pv2KQdKPz+Bq9D+ruzKHCtVUgn7NjHURk1rVaILBFSFRz2NXq9Y?=
 =?iso-8859-1?Q?9mgRVjepOmEzB5qXL4Qb4BxYN2ep+JoBbba8PVgkuC1fTzGvmAziIysX4J?=
 =?iso-8859-1?Q?cOgt5JXygkHaOR+DDGymJ5l7PMTWAtu0zoo3/XQDqjXw8e3PKqtdZvAYOQ?=
 =?iso-8859-1?Q?eiv/hHsGkzwJ22tsIIRumTzMGQK+x0RBNGh6atGsk93D6VPmZgCsQ5mid2?=
 =?iso-8859-1?Q?UOsdVzIUYrCrhdajvcPrfR80DTO1U+zM7WFJyXr0QP8VcHca0jqvS/+yL6?=
 =?iso-8859-1?Q?jPwQHic//JoA0f9zFdieBwkrBzsska0k0e1A8BaiU8BXQrGBzp6JPOl1HT?=
 =?iso-8859-1?Q?iKHqMP8jdOFS7UNt8O2P5763PpseReYNNtoLUV1m4GcPFW+XmNZerB2aWV?=
 =?iso-8859-1?Q?8RF2osZBnBGdXTpi97nynRiqa9thWI5TcdpB0vzMYmKSh6kgXMeyW+u/AH?=
 =?iso-8859-1?Q?IfYYIs2cX7yvzv788kIZVzvjCUXRKIwEOgyLjXtbPycvLGr5/a7AUALAjw?=
 =?iso-8859-1?Q?JXRhD4RN/9C19f6wyjmAalseDnaPpS7Al/ov4qnwwzJmVjmPHImTPtYC/p?=
 =?iso-8859-1?Q?yw0aCjfE2Dodb4jRIeRx8YI5oRuGl67ydLl9XmPu95Hm6arlpNflbD3PNW?=
 =?iso-8859-1?Q?Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ecy8ogzxFU9DUDdlscn05JCwQG04SJbaQi2Hg/KE+n0cQirm0Jiv/NNWmm?=
 =?iso-8859-1?Q?gRmxSbWcsr+pHcYw4hNOW2vFqMniMTcW9O7DAvVQcsfhMs8kbjHAgXYHFW?=
 =?iso-8859-1?Q?bCTYJEc1WbiFf/Iy8ZONE9zlCPhIGOviJD/hCEuQadPw2YGwddMdWfoDMM?=
 =?iso-8859-1?Q?BBvWK6EuDnSThG29dRmvUn0mHDl2gNmAyCrE61UElv2Vizrw9LIR4NsR6w?=
 =?iso-8859-1?Q?uiqTkdUhZ+jYvx3Uhfl14+c/yxUJ3LQjn/IQWi6ZLnmxjj0zTTehtiajSv?=
 =?iso-8859-1?Q?WmRpTrRymKsui/pezOTiKvddv9JWctVkkMdx6ibI46TqlLU+qY+jOZJjpv?=
 =?iso-8859-1?Q?tracQDy/blJlxSg0cU1vMkrRtk7qJ1x6H1A3fWdvpqzvTiMRDnZWgWDbIk?=
 =?iso-8859-1?Q?KbggrEJYpAZfVWhU8PfKfUi4wrbcEKQYyxWmJTzJo1MX5JLoYRLpi5UkAS?=
 =?iso-8859-1?Q?zPIPNCFnxT8K2gESG/iH4WbOK7iXLGaEWtQm+VOkktC7Fk+wTKIkF5yMW4?=
 =?iso-8859-1?Q?DJgCjroXSKTwBe2Gc0bFD+ld4YgX2PR4beBV8cdhVj3rQ7rIOz9S/vinuC?=
 =?iso-8859-1?Q?bpqkPyjCynELTblfAR8mUrqWujqeQ/pYEa5rJEo8W1v7Przid17hv/Oc54?=
 =?iso-8859-1?Q?b88Sn47D/X0lt85emf3nzJ8Ak51esHNOTm3hQXqvcIlQQrQt9XcOCBAzPB?=
 =?iso-8859-1?Q?rNKVHwJuH/RBqmenMMAmnDbRnR8TkVrcGSVpS96HPNs3zi4OJBgFVXUlLp?=
 =?iso-8859-1?Q?NpBS8XBIKjiHotmhF1DskBRXD3sVG8b+Z6Rw0ba+i05IZiBrt1YKnR3It/?=
 =?iso-8859-1?Q?wkbh0XeRVSMaeothnqeQVqFG0pBgfDjU8sdR++ybkg8ClBvytSVqAfS1ic?=
 =?iso-8859-1?Q?+ryWib6N377at1DPiDpiuBiBRU0zEEw0tW/ziIPRxUu/uuQGB3xrJLnorH?=
 =?iso-8859-1?Q?egN+QwC83T5ssq6FTgQqM4B/ivZV4Egidk7R7t087ls8pKvkFV+3ZFcREH?=
 =?iso-8859-1?Q?9gIqNSJ/9vI6oGmCU86G1ItwRQZDuPn8ZxioYUOUpi5tSKkXjaaQF8tQNo?=
 =?iso-8859-1?Q?01XLtF0e50Ip2tUMr16nwtt2+a0gRwyl5leM4pXVjuaA1G0SZJjBB/XiWm?=
 =?iso-8859-1?Q?bIJCOysVP35XRZ1hf+Nt9csuut7YStiAQg2fSvS//VNm6VG0qTz3Uq/MtN?=
 =?iso-8859-1?Q?AHQLlBRU2tZQaRaM38N2kxUG3UKMMqua84WodYSX/WY0Lbg/ih+p5iJObc?=
 =?iso-8859-1?Q?hMkz18UE1XchCYsFiI9Cnc2+Sx+k9eqYTtMhFzRszxXlk+30x6CxjT5zkH?=
 =?iso-8859-1?Q?B44gMfB18hfBeEE9iSymmOysvHa1q++a/1w0XhnLSuJ2TGlqqJl6uDu8w/?=
 =?iso-8859-1?Q?iY8RndiCoWU1zRXmo9M0OkF3CC4Wo34pFR+73rkN7S/zkfa7V6j150N02p?=
 =?iso-8859-1?Q?crLRW+moGFTFcdkBlog2GQytmanGN0zBIxSTjOyF5mZw+rVu7iW7hQS/vh?=
 =?iso-8859-1?Q?UwH1xOjiVBLeDLmeAtkbMrsv/WivQ+CAFQqDXINcCFUu4fUOGR8oesCv3c?=
 =?iso-8859-1?Q?pGe1cO2dEkiXgGR5jBtRHo1VRfJ96Ic94WnOHFstDsW7LoQM5Bpjzouywm?=
 =?iso-8859-1?Q?kTlJ4nmy7RESCm1+xcF34/3XgtcptUNsvB/XOBrBvSpbsEJHtot8DsMg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7bfa0a0-9d4e-4f42-66e5-08ddbf0cebda
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 17:20:37.6326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ODJ2GUd9y9tGgEyKkdGV//0b5Mq7woGM6yA/AfxdDIjgGrmgh3vBBUNpxKy3bskhi3t4Krsqn7pWMAhKN/BzIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7347
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

On Wed, Jul 09, 2025 at 11:49:44AM +0100, Tvrtko Ursulin wrote:
> 
> On 09/07/2025 05:45, Matthew Brost wrote:
> > On Tue, Jul 08, 2025 at 01:20:32PM +0100, Tvrtko Ursulin wrote:
> > > Currently the job free work item will lock sched->job_list_lock first time
> > > to see if there are any jobs, free a single job, and then lock again to
> > > decide whether to re-queue itself if there are more finished jobs.
> > > 
> > > Since drm_sched_get_finished_job() already looks at the second job in the
> > > queue we can simply add the signaled check and have it return the presence
> > > of more jobs to free to the caller. That way the work item does not have
> > > to lock the list again and repeat the signaled check.
> > > 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > 
> > The patch looks correct, we do have CI failure in a section which
> > stresses scheduling though. Probably noise though. Do you have Intel
> > hardware? I suggest running xe_exec_threads in a loop on either LNL or
> > BMG and see if the CI failure pops. If you don't have hardware, let me
> > know and I can do this.
> > 
> > With a bit of investigation in the CI failure:
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> Thanks! I don't have the HW but I was able to press re-test in the CI so
> lets see. Although at the moment I can't imagine a failure mode like that
> could be caused by this patch.
> 

I ran xe_exec_threads in a loop 20x on BMG without a failure so CI issue
seem unrelated.

Matt 

> Regards,
> 
> Tvrtko
> 
> > 
> > > Cc: Philipp Stanner <phasta@kernel.org>
> > > ---
> > >   drivers/gpu/drm/scheduler/sched_main.c | 37 ++++++++++----------------
> > >   1 file changed, 14 insertions(+), 23 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 1f077782ec12..1bce0b66f89c 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -366,22 +366,6 @@ static void __drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
> > >   		queue_work(sched->submit_wq, &sched->work_free_job);
> > >   }
> > > -/**
> > > - * drm_sched_run_free_queue - enqueue free-job work if ready
> > > - * @sched: scheduler instance
> > > - */
> > > -static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
> > > -{
> > > -	struct drm_sched_job *job;
> > > -
> > > -	spin_lock(&sched->job_list_lock);
> > > -	job = list_first_entry_or_null(&sched->pending_list,
> > > -				       struct drm_sched_job, list);
> > > -	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> > > -		__drm_sched_run_free_queue(sched);
> > > -	spin_unlock(&sched->job_list_lock);
> > > -}
> > > -
> > >   /**
> > >    * drm_sched_job_done - complete a job
> > >    * @s_job: pointer to the job which is done
> > > @@ -1102,12 +1086,13 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> > >    * drm_sched_get_finished_job - fetch the next finished job to be destroyed
> > >    *
> > >    * @sched: scheduler instance
> > > + * @have_more: are there more finished jobs on the list
> > >    *
> > >    * Returns the next finished job from the pending list (if there is one)
> > >    * ready for it to be destroyed.
> > >    */
> > >   static struct drm_sched_job *
> > > -drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
> > > +drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool *have_more)
> > >   {
> > >   	struct drm_sched_job *job, *next;
> > > @@ -1115,22 +1100,25 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
> > >   	job = list_first_entry_or_null(&sched->pending_list,
> > >   				       struct drm_sched_job, list);
> > > -
> > >   	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
> > >   		/* remove job from pending_list */
> > >   		list_del_init(&job->list);
> > >   		/* cancel this job's TO timer */
> > >   		cancel_delayed_work(&sched->work_tdr);
> > > -		/* make the scheduled timestamp more accurate */
> > > +
> > > +		*have_more = false;
> > >   		next = list_first_entry_or_null(&sched->pending_list,
> > >   						typeof(*next), list);
> > > -
> > >   		if (next) {
> > > +			/* make the scheduled timestamp more accurate */
> > >   			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> > >   				     &next->s_fence->scheduled.flags))
> > >   				next->s_fence->scheduled.timestamp =
> > >   					dma_fence_timestamp(&job->s_fence->finished);
> > > +
> > > +			*have_more = dma_fence_is_signaled(&next->s_fence->finished);
> > > +
> > >   			/* start TO timer for next job */
> > >   			drm_sched_start_timeout(sched);
> > >   		}
> > > @@ -1189,12 +1177,15 @@ static void drm_sched_free_job_work(struct work_struct *w)
> > >   	struct drm_gpu_scheduler *sched =
> > >   		container_of(w, struct drm_gpu_scheduler, work_free_job);
> > >   	struct drm_sched_job *job;
> > > +	bool have_more;
> > > -	job = drm_sched_get_finished_job(sched);
> > > -	if (job)
> > > +	job = drm_sched_get_finished_job(sched, &have_more);
> > > +	if (job) {
> > >   		sched->ops->free_job(job);
> > > +		if (have_more)
> > > +			__drm_sched_run_free_queue(sched);
> > > +	}
> > > -	drm_sched_run_free_queue(sched);
> > >   	drm_sched_run_job_queue(sched);
> > >   }
> > > -- 
> > > 2.48.0
> > > 
> 
