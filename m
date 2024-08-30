Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FD7966B74
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 23:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718B410E74E;
	Fri, 30 Aug 2024 21:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a5Wc3c7/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5127010E07F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 21:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725054321; x=1756590321;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=og2agCwx8W8sjngH/YFJvuVFQCH2mgNdj6MA8STfr7Q=;
 b=a5Wc3c7/0RKg/k6+8LK+/QzoKPP2wiIlvyGgPU15We/JHykcIodC2Gyt
 2N2VdnZd41Dl2kLfcePZbTGeXiX8/DHDPaQluIpSFXHDjsbmGDcwCrcvd
 BDT51+XOp716jkm2W3HZa1a5GQU4hrArkpsPf2QRoJIjjDsVDfhDMqpXN
 WCRN3TpKHwECavPHM+TdP/VGfhNYbwkMCtP/u4CZHD0mQXvDGeS2JoM3Z
 nYqZT1H2Iv0Oh98t1a5tRodzyIZ0ecTP5DOYd4EnJ4Q7I42l0TDjq1B2H
 9rBFqP4/HJ2lv7IH2GOYlUa95yNcyvybrHN/LgV4PiG5sSzyjuPGGeWBj g==;
X-CSE-ConnectionGUID: HzHvhdOWT8+pKMC8+9LgYQ==
X-CSE-MsgGUID: eDkf26i4St2xCYmXLkkjSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23838736"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="23838736"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 14:45:20 -0700
X-CSE-ConnectionGUID: k2kjVwlWSQyruOfIwgLQ7w==
X-CSE-MsgGUID: y1X1t+7+S8qVCbF30kumFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="63632735"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 14:45:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 14:45:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 14:45:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 14:45:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 14:45:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFlwwHPbVLDLjd4AKQtuQSE7kM6VYHjkb4BkONRS/L5VQn5bsCVFx7zorDPqWP/58Fq/D9tkabutLO/iMXPpwDznCsCch/S67OvUVULx50cAfAXifohhq6Gkox3UpySRaLAgIu86BQjw8BcAn/20OQcTKG1/s8xx7iI5EKdyETJwrciiY2eiNlTFZOnKRO9AsHaSGhaChErRoZ4NcsV+C6Lvt24fcE4p1vzhL3e9HqAD6/HAro8FEkBrUeA7lcK8MrZSK1bsQhF0iRcPNZb9ImS5QctgvWEcYvEDWj8OC69HWzKU/leRC/yROS4uSICj6i/2QA6/pK+/0yDAmdAm9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjoqwvK9FlX3rGkZuFW6ukL94zsbLj7AWbovcOwWZgQ=;
 b=aFGihzcPd2Zk06CigMFRSh5eBqxGnvyZR+tNqZckFAhftgVKCFsBmrbMRtCxr23TIAsUzqg3ItDoG5NGMenbV+DePNoord3J7fM3pDtHVX/5DzwgZgsV4zO6TKFZp86Sdx/c+oPUFe40teOi4F/2caI60bxF/Ltk+LZFXbXg70d+Yj4sS1m7sMVl4ZRwdvgKo5Tqo6XW6Gp9Nz2JJtgnyvF8Yi7rFFWY5S8MlDkmgP/9F6ATcrdF6GnC87Ltp1DZ2qO5Oxb5X3OujPP/8nwVF7Hw12wwCieEdeU/551S4oNPdMjawzAjiftlfPeVqULGWdIPYUouEaTY6yXAq/bhHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7928.namprd11.prod.outlook.com (2603:10b6:8:fe::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.28; Fri, 30 Aug 2024 21:45:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Fri, 30 Aug 2024
 21:45:17 +0000
Date: Fri, 30 Aug 2024 21:43:44 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Boris Brezillon <boris.brezillon@collabora.com>,
 <dri-devel@lists.freedesktop.org>, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>, =?iso-8859-1?Q?Adri=E1n?= Larumbe
 <adrian.larumbe@collabora.com>, <kernel@collabora.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Danilo Krummrich <dakr@redhat.com>
Subject: Re: [RFC PATCH] drm/sched: Fix a UAF on drm_sched_fence::sched
Message-ID: <ZtI9EMzHZW3DkHw/@DUT025-TGLU.fm.intel.com>
References: <20240829171238.609481-1-boris.brezillon@collabora.com>
 <bdc018b8-3732-4123-a752-b4e0e7e150dc@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bdc018b8-3732-4123-a752-b4e0e7e150dc@amd.com>
X-ClientProxiedBy: BY5PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7928:EE_
X-MS-Office365-Filtering-Correlation-Id: bd6382e9-7142-42b3-1348-08dcc93d0974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9OR7pEIJuTV+O46SIjE/wkWMJw2/oLB4dymJwrJRtbDE0fPkovnaP3udbd?=
 =?iso-8859-1?Q?ZXwzYJa1IMjwg4ZB8UaWUoLV85bh6fNz2t2Bj6qF39Mp1kkxk7CPPWMYcq?=
 =?iso-8859-1?Q?uucLnXSsLCLGEVgZ9gm4qP1fWdlY62Als3udmovorbaK9Orldf6jbGyXHE?=
 =?iso-8859-1?Q?AtOUCuoa6ZiLPCb4eSCiYcBgblPtK/mPGMditD6gjaz9ggHrVULy9rnd7D?=
 =?iso-8859-1?Q?twyC8BigZlYAQh5i9w6AkAW4GEsHTp/il+WIWzQelBCUBGF+KVB79FrDe7?=
 =?iso-8859-1?Q?U/AtHm+PqSw6Sb4ZTXu5rUUJIJZ+dpwkUAeNwIjYIvJuJ7HCSKLLB7r7hj?=
 =?iso-8859-1?Q?FIYvU0oyZCX330LhqoeMmkuv6s02t8YBAL7QCt7ewKKB2p9cu7YXmtShg1?=
 =?iso-8859-1?Q?WRX6BBI30antC0siOOKIzYs2xdS68+QsUCtgV3a/kTB0ywjDkb7+9ND4Z/?=
 =?iso-8859-1?Q?gh6296QWM9HXrUk/GLD8Wk+1r3X+v6NXhTUelnWc/3kpJlRFGURjOAia0m?=
 =?iso-8859-1?Q?Nau0v0lQLBMr/w5t91OpGCzkgUZcte+C0IEl4UjIVAENIiFpYeDiDx0bJi?=
 =?iso-8859-1?Q?tXKrKRWmymcqXJ8pGxfbh7Z5eA2IxpGYzEEzX+M/YJc9MQ6iVfqgrFFIQn?=
 =?iso-8859-1?Q?A4lqfiWeQfa9Gz+YUiNU/U7+lQCiiNfkW00EQ3SVdEiLyCVwGbmg+zGGEN?=
 =?iso-8859-1?Q?aWSksAH2nYn/AsqmfhFWLF2dSr72Rz4tf8takgm71ik1HKB0BoHMiVlSIf?=
 =?iso-8859-1?Q?G6pJXZr9825NR1ZlM/JZpOnRv6Bd5Go/h352/QLBaRqoAyP23ug0RrMFRI?=
 =?iso-8859-1?Q?AF5sNxq7Yk5TrWM7t6bC0H4ViKbtawcu3p4A2R8nwGqdQvY+hB+f0dFo58?=
 =?iso-8859-1?Q?Td/WEeVNGBT8KDP/PKQ0r4MlcJd2aD072e0XL9rfA8qvpc+i5yLaSZ9wcH?=
 =?iso-8859-1?Q?SZzrl0JJ0T0sahf9aTtjD1AFYpYp9NgX7LqusLyVbwxXTIrpY1TRcJgTLX?=
 =?iso-8859-1?Q?nSUR+7Mtu55GuXe++2sDL5Y7/f8OiPgWv8DhLyXeWgfVHY/cTFXkvsXDhM?=
 =?iso-8859-1?Q?Cc5zQT9QYOmXSekT3pcP8K5OP3lLm8JDlcpsLGAJgGd6RTM+faTxBACIYu?=
 =?iso-8859-1?Q?WYKcdjybIu9z8SldW31ua0YrhhmkhARnFUxVX4ASFewUrNySq5aFy1xXSq?=
 =?iso-8859-1?Q?BLXbvJqEkGoLPWJB6VbOZbko9FhzBMk7MxbmZpgRQsLy+DIwidHcu2tlAP?=
 =?iso-8859-1?Q?00G0gzGNGzuvRdGxjOMrnLnWcBGS7+kIiDQll5MLvJEJBZkWrd87T8nS5Z?=
 =?iso-8859-1?Q?byCqEdXeFhpdTb2mOj3z+fkZP8uBYh5V15OKTy3/bpLupebE0WqUVOnf2g?=
 =?iso-8859-1?Q?sw4R1+q/wbuNFJaMB+iCvwFhKs6/FYbg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QaUMKKgkcF3djnGKiUQ2A8QguwSspOx93zObwDBXkwllIiNUxL2ZcNyPnC?=
 =?iso-8859-1?Q?ARxbBb5xmVfn8jQezhQR3HMqJGowFRPMC5WLyvB766aImEn33jPhgPSxbX?=
 =?iso-8859-1?Q?ao+Qptrso+7SFv82rfryZi85yadWArtIpCoJJHcz2xlMrm3qHX3C2aJHC2?=
 =?iso-8859-1?Q?dBFa9qso4cH1CP6zgBYsI4V4eGM+XxulP1kMrG1Ox5FRDbmlFYaqoczhpo?=
 =?iso-8859-1?Q?Ca3hsHud6tSR4aaPApbRXnhwXqbL9Ntflr/AxDUz8BgdyWjPtnkvrFzIMG?=
 =?iso-8859-1?Q?5oD8GGBHeYCtPalWiL1cKH5tCWl2h0F5dfpJE6WzqFrAtstN0dqhXvfTO0?=
 =?iso-8859-1?Q?Er52heGAe9FiTav6zNmS7elz8LSBqevVfYiQsJ91FVAXV9DrwrubUdFwjU?=
 =?iso-8859-1?Q?l6rf3GkhxeGjvtlj1rqkt3eXg7WHmezTiC6YUNqA91Ra7oiQz9KPzShmp9?=
 =?iso-8859-1?Q?YTCOFQquSG8hX3+cj/TcADqoWREnG73y2LQeZgzHk4usBNnSKV9AGUif/W?=
 =?iso-8859-1?Q?gy/3QRiKbx93iQvBpuhwhgMSkn4qYsFJ2RgLeKqYPS9LxC3RMhYFkXgfxz?=
 =?iso-8859-1?Q?z7tQr21PF/g9k4P/OtD6XI2kZhqphKqK0VsK8JmL880s0V4vrVR31dAd8y?=
 =?iso-8859-1?Q?VqOVdb9luKjDUZhjwxTKKmeilqd9Tw0itgsIKDSWSIdxhCxMr5oJFCv6FD?=
 =?iso-8859-1?Q?1qWX3MOTggW/8jFXBL81Tbcf+r8j/cXDcrwoamIbnYKd6oWf4N/a8payq9?=
 =?iso-8859-1?Q?wsos+f4eBoBlgvpulXkEWC7gGkdcf1MgHkdsfwr8k6zlyJhlEQ16SNeaoM?=
 =?iso-8859-1?Q?qrvAfnqItbKex6vuPjn777fjpUbYLPJTf2RZ58P4Gm1pq+c5UVdkoC9LpL?=
 =?iso-8859-1?Q?N1tzIrnMbeNalXefCnNsU6FnKxit/EtEWPa1C+9u63ikVDI2vYT+qq+YHN?=
 =?iso-8859-1?Q?N2jEL2e3bLZyCnuy8h29f8QDqR9GPC5WFFFKX4UKoiMX2xqE7u+Izas0vy?=
 =?iso-8859-1?Q?PeV+nZeaejHm+ZWJUXmImN7GWaAvOfiKtRKAxHXh7tQGS+CmTumpndSMAh?=
 =?iso-8859-1?Q?t30djW1vjjnFJTRPYceWz93iRF6EZO/MnZ3JRK6yYdMo8ZVmwv8DUAZyXZ?=
 =?iso-8859-1?Q?kkGSP6IwGeZA9K1bPA4AZ3TeRI8Us9Zc6uOwoSZ/9VRVAgf8ZJbFQchtzA?=
 =?iso-8859-1?Q?J2pYXIgmgtlm+/67mfnAxQPn/0nugrLK4oX8WOItqZ7vVhAlSLN+mQSsBH?=
 =?iso-8859-1?Q?9TB4gOJ9vg3hfNrLrMILn38mWTkX2kWew84WhsA6HFRlQCmQUzbrjZd9by?=
 =?iso-8859-1?Q?sNazcsSiOmiAlfzZa6qdWTm2dyFHe8ON1NvATRDilRsruq39q//btoFJwA?=
 =?iso-8859-1?Q?nfxhX/Y+npWussuwuoXcGcbmwGuMCc2lPoA9kopfsqaiZl22xOO3g0XLNr?=
 =?iso-8859-1?Q?/aDJDhsocAGDIKxdq1BevnZCFuTU8llwOTkyxXG+z5DQZ2CycLqS98m+6I?=
 =?iso-8859-1?Q?v0NxM2EgJs1R+AGo1YvEwOwEcFzPVa282fgEYssoucpIj73cD6LETXcM+U?=
 =?iso-8859-1?Q?6MeZ2kEQxUcOVofkI3tA6Eh+aYle9QRWD4R08657w7s28lAmbyhjZU39WC?=
 =?iso-8859-1?Q?RsOY7QzREec0Jkb/xrBln5FJ4Ao/8tN5PQgVySgESJYt8GOc0QpOXfNw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6382e9-7142-42b3-1348-08dcc93d0974
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 21:45:16.9545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JOwMGGOSqP5kEyhgyVpQx9THKbF/5388xADjuQdkxhj5MJFIaaRdfspayfsw3zCT6mo1CWCPdJNdZHvYt0A+Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7928
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

On Fri, Aug 30, 2024 at 10:14:18AM +0200, Christian König wrote:
> Am 29.08.24 um 19:12 schrieb Boris Brezillon:
> > dma_fence objects created by an entity might outlive the
> > drm_gpu_scheduler this entity was bound to if those fences are retained
> > by other other objects, like a dma_buf resv. This means that
> > drm_sched_fence::sched might be invalid when the resv is walked, which
> > in turn leads to a UAF when dma_fence_ops::get_timeline_name() is called.
> > 
> > This probably went unnoticed so far, because the drm_gpu_scheduler had
> > the lifetime of the drm_device, so, unless you were removing the device,
> > there were no reasons for the scheduler to be gone before its fences.
> 
> Nope, that is intentional design. get_timeline_name() is not safe to be
> called after the fence signaled because that would causes circular
> dependency problems.
>

I'm quite sure happens, ftrace for example can and will call
get_timeline_name in trace_dma_fence_destroy which is certainly after
the fence is signaled. There are likely other cases too - this just
quickly came to mind.
 
> E.g. when you have hardware fences it can happen that fences reference a
> driver module (for the function printing the name) and the module in turn
> keeps fences around.
> 

I am almost positive without this patch this problematic in Xe or any
driver in which schedulers are tied to IOCTLs rather than kernel module.

In Xe 'fence->sched' maps to an xe_exec_queue which can be freed once
the destroy exec queue IOCTL is called and all jobs are free'd (i.e.
'fence' signals). The fence could be live on after in dma-resv objects,
drm syncobjs, etc...

I know this issue has been raised before and basically NACK'd but I have
a strong opinion this is valid and in fact required.

Matt

> So you easily end up with a module you can never unload.
> 
> 
> > With the introduction of a new model where each entity has its own
> > drm_gpu_scheduler instance, this situation is likely to happen every time
> > a GPU context is destroyed and some of its fences remain attached to
> > dma_buf objects still owned by other drivers/processes.
> > 
> > In order to make drm_sched_fence_get_timeline_name() safe, we need to
> > copy the scheduler name into our own refcounted object that's only
> > destroyed when both the scheduler and all its fences are gone.
> > 
> > The fact drm_sched_fence might have a reference to the drm_gpu_scheduler
> > even after it's been released is worrisome though, but I'd rather
> > discuss that with everyone than come up with a solution that's likely
> > to end up being rejected.
> > 
> > Note that the bug was found while repeatedly reading dma_buf's debugfs
> > file, which, at some point, calls dma_resv_describe() on a resv that
> > contains signalled fences coming from a destroyed GPU context.
> > AFAIK, there's nothing invalid there.
> 
> Yeah but reading debugfs is not guaranteed to crash the kernel.
> 
> On the other hand the approach with a kref'ed string looks rather sane to
> me. One comment on this below.
> 
> > 
> > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: Danilo Krummrich <dakr@redhat.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >   drivers/gpu/drm/scheduler/sched_fence.c |  8 +++-
> >   drivers/gpu/drm/scheduler/sched_main.c  | 18 ++++++++-
> >   include/drm/gpu_scheduler.h             | 52 +++++++++++++++++++++++++
> >   3 files changed, 75 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> > index 0f35f009b9d3..efa2a71d98eb 100644
> > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > @@ -90,7 +90,7 @@ static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
> >   static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
> >   {
> >   	struct drm_sched_fence *fence = to_drm_sched_fence(f);
> > -	return (const char *)fence->sched->name;
> > +	return (const char *)fence->timeline->name;
> >   }
> >   static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
> > @@ -112,8 +112,10 @@ static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
> >    */
> >   void drm_sched_fence_free(struct drm_sched_fence *fence)
> >   {
> > +	drm_sched_fence_timeline_put(fence->timeline);
> > +
> >   	/* This function should not be called if the fence has been initialized. */
> > -	if (!WARN_ON_ONCE(fence->sched))
> > +	if (!WARN_ON_ONCE(fence->timeline))
> >   		kmem_cache_free(sched_fence_slab, fence);
> >   }
> > @@ -224,6 +226,8 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
> >   	unsigned seq;
> >   	fence->sched = entity->rq->sched;
> > +	fence->timeline = fence->sched->fence_timeline;
> > +	drm_sched_fence_timeline_get(fence->timeline);
> >   	seq = atomic_inc_return(&entity->fence_seq);
> >   	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
> >   		       &fence->lock, entity->fence_context, seq);
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 7e90c9f95611..1e31a9c8ce15 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1288,10 +1288,21 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   		sched->own_submit_wq = true;
> >   	}
> > +	sched->fence_timeline = kzalloc(sizeof(*sched->fence_timeline), GFP_KERNEL);
> > +	if (!sched->fence_timeline)
> > +		goto Out_check_own;
> > +
> > +	sched->fence_timeline->name = kasprintf(GFP_KERNEL, "%s", sched->name);
> > +	if (!sched->fence_timeline->name)
> > +		goto Out_free_fence_timeline;
> > +
> > +	kref_init(&sched->fence_timeline->kref);
> > +
> >   	sched->sched_rq = kmalloc_array(num_rqs, sizeof(*sched->sched_rq),
> >   					GFP_KERNEL | __GFP_ZERO);
> >   	if (!sched->sched_rq)
> > -		goto Out_check_own;
> > +		goto Out_free_fence_timeline;
> > +
> >   	sched->num_rqs = num_rqs;
> >   	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> >   		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
> > @@ -1319,6 +1330,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   	kfree(sched->sched_rq);
> >   	sched->sched_rq = NULL;
> > +Out_free_fence_timeline:
> > +	if (sched->fence_timeline)
> > +		kfree(sched->fence_timeline->name);
> > +	kfree(sched->fence_timeline);
> >   Out_check_own:
> >   	if (sched->own_submit_wq)
> >   		destroy_workqueue(sched->submit_wq);
> > @@ -1367,6 +1382,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
> >   	sched->ready = false;
> >   	kfree(sched->sched_rq);
> >   	sched->sched_rq = NULL;
> > +	drm_sched_fence_timeline_put(sched->fence_timeline);
> >   }
> >   EXPORT_SYMBOL(drm_sched_fini);
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 5acc64954a88..615ca89f77dc 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -261,6 +261,52 @@ struct drm_sched_rq {
> >   	struct rb_root_cached		rb_tree_root;
> >   };
> > +/**
> > + * struct drm_sched_fence_timeline - Wrapped around the timeline name
> > + *
> > + * This is needed to cope with the fact dma_fence objects created by
> > + * an entity might outlive the drm_gpu_scheduler this entity was bound
> > + * to, making drm_sched_fence::sched invalid and leading to a UAF when
> > + * dma_fence_ops::get_timeline_name() is called.
> > + */
> > +struct drm_sched_fence_timeline {
> > +	/** @kref: Reference count of this timeline object. */
> > +	struct kref			kref;
> > +
> > +	/**
> > +	 * @name: Name of the timeline.
> > +	 *
> > +	 * This is currently a copy of drm_gpu_scheduler::name.
> > +	 */
> > +	const char			*name;
> 
> Make that a char name[] and embed the name into the structure. The macro
> struct_size() can be used to calculate the size.
> 
> > +};
> > +
> > +static inline void
> > +drm_sched_fence_timeline_release(struct kref *kref)
> > +{
> > +	struct drm_sched_fence_timeline *tl =
> > +		container_of(kref, struct drm_sched_fence_timeline, kref);
> > +
> > +	kfree(tl->name);
> > +	kfree(tl);
> 
> This avoids having two allocations for the timeline name.
> 
> Regards,
> Christian.
> 
> > +}
> > +
> > +static inline void
> > +drm_sched_fence_timeline_put(struct drm_sched_fence_timeline *tl)
> > +{
> > +	if (tl)
> > +		kref_put(&tl->kref, drm_sched_fence_timeline_release);
> > +}
> > +
> > +static inline struct drm_sched_fence_timeline *
> > +drm_sched_fence_timeline_get(struct drm_sched_fence_timeline *tl)
> > +{
> > +	if (tl)
> > +		kref_get(&tl->kref);
> > +
> > +	return tl;
> > +}
> > +
> >   /**
> >    * struct drm_sched_fence - fences corresponding to the scheduling of a job.
> >    */
> > @@ -289,6 +335,9 @@ struct drm_sched_fence {
> >   	 */
> >   	ktime_t				deadline;
> > +        /** @timeline: the timeline this fence belongs to. */
> > +	struct drm_sched_fence_timeline	*timeline;
> > +
> >           /**
> >            * @parent: the fence returned by &drm_sched_backend_ops.run_job
> >            * when scheduling the job on hardware. We signal the
> > @@ -488,6 +537,8 @@ struct drm_sched_backend_ops {
> >    * @credit_count: the current credit count of this scheduler
> >    * @timeout: the time after which a job is removed from the scheduler.
> >    * @name: name of the ring for which this scheduler is being used.
> > + * @fence_timeline: fence timeline that will be passed to fences created by
> > + *                  and entity that's bound to this scheduler.
> >    * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
> >    *           as there's usually one run-queue per priority, but could be less.
> >    * @sched_rq: An allocated array of run-queues of size @num_rqs;
> > @@ -521,6 +572,7 @@ struct drm_gpu_scheduler {
> >   	atomic_t			credit_count;
> >   	long				timeout;
> >   	const char			*name;
> > +	struct drm_sched_fence_timeline	*fence_timeline;
> >   	u32                             num_rqs;
> >   	struct drm_sched_rq             **sched_rq;
> >   	wait_queue_head_t		job_scheduled;
> 
