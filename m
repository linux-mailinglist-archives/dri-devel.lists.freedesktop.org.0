Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EC89D525C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 19:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FE510EA17;
	Thu, 21 Nov 2024 18:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cLwsyh46";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E39310EA17
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 18:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732212650; x=1763748650;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Fg8h5r1tGrl5eO3FndwjSkk0fJS1JTb73LeawLfK5OE=;
 b=cLwsyh467uegvEMCdUzemo9ClSkATUiDaSSS12xgkR3xdZKuhoQJElTk
 cUlsdCKSPgNxdeqiMlvD9HZPrxgrKG8ho+lI9xg0Kb/njxymZmfpyIbMS
 hfmYTr6GNSbhnjIfr6S25OSJjUi1hMziZuuUHMlvDJjCSo2lfrbnQsHB+
 Wdo0kcHLVZqhvWhZjwQ4eX7AgNTz6APlntf+muAy+2zMcfMxQ7xoXXKZa
 DfpsxTxHlv1/t6KVA4lmv0qTByRn80COhjLGtl6URTSmQV6VQJGKQl1V3
 HZPExA5kXOZUiLgQUU+JXSbuu/9JQZKYQB5qhB3UFTHZRY8TjAqzb3S9y Q==;
X-CSE-ConnectionGUID: pkAvGf7PR/WA6p5OfEVM3A==
X-CSE-MsgGUID: Mllu03DUQZiFZ+A5qVPGVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="49867675"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="49867675"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 10:10:50 -0800
X-CSE-ConnectionGUID: dMTQl0wvRBmO+xo4SZqPQQ==
X-CSE-MsgGUID: ZYLaV3g5T/aC4TOzmKtfSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="95282622"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 10:10:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 10:10:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 10:10:48 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 10:09:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rY0uHBKFdr/8DS6BrJ+TDAX9a1U8yLXpiJeXkn4IgM/r6XyuXa4O4E0X1jPIfVv6B1VOKBqOty3pU9ErimYJ0F797qdUQFClZyyV2LoJN23vDk1H5Mt40Q8OdytUwepkIVqw9WA96OstYItozWTB3PFHvG+U/GIJqRy9HPriLPjBgGtEpB9LRacrSNhhHxGVg7qZuEvhDchjqc8kf2JpbmLPyLDITUnOcya7c5RwGMYSwGdFHreLt7h12cYS227uJN2bMkJlosdUqQfw7FEeNnFNpdnUSvNttnOHvovLnpvWJCn9rhAmgmFG7/ZxTYenzqRYry9OwSIWxiDEzOZ9NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2P7wD6T0d7kjGgWU2K6l8h8quBFTUUPHOqTPngXY2Wk=;
 b=QCApP8zikB1fTQ0+IgOvfnJOgjLrila+0bwN1osOllw4gSB7QGvYiB55W9LdGWnZLNtM+CruKanK/o7ehJ1NuwVT9+a/aHHUUkrwy3A6QoxcyjgyHQahvd4h/nEMdTH5HBPZ8BNTOXRIJjZzdofJFd9Z0p6hdd7Gid4vQLv8VcnNyPMkiKM3arwi8ccfJpBPqIl+AiuB0kzzLG2yQDrs7yun68T7y3XXPQN8MypCDlRz+hTe5xSviIj1jR89JpcxCVqFSjaAHgg6WROBfWqp4Aw+OJVN+8hSQen+WLoMoSu90vOfl68iz3kNxMftQHT+ciUkHVkl70a2XqQZEAkmUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8525.namprd11.prod.outlook.com (2603:10b6:510:304::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Thu, 21 Nov
 2024 18:09:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 18:09:53 +0000
Date: Thu, 21 Nov 2024 10:10:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Danilo
 Krummrich" <dakr@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ltuikov89@gmail.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/sched: add WARN_ON and BUG_ON to drm_sched_fini
Message-ID: <Zz93lbvb0TgqB5eH@lstrano-desk.jf.intel.com>
References: <64c478a7-0afb-4b9b-8a7a-6e204a79cc20@gmail.com>
 <Zw0xHB_UNOvRq0L7@pollux>
 <6b656a2e199d1fa1d33684572a93e327cba0ae83.camel@redhat.com>
 <a936d96485fbd8401439a0939abb15f140ed5018.camel@redhat.com>
 <32fdb74a-00c5-489c-b561-c530d23c4098@amd.com>
 <4b67bd14cfc6066edab969471631aef3e719b25e.camel@redhat.com>
 <d103054f-7331-4b00-8105-3e88fdab0486@amd.com>
 <85a29addcc1c42a339292b536d46c397677d5729.camel@redhat.com>
 <bf44095a-8f31-46c4-8bf5-cf98b4848a76@amd.com>
 <a0ed99471ff6d122433e0281036329f6b62d308c.camel@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0ed99471ff6d122433e0281036329f6b62d308c.camel@redhat.com>
X-ClientProxiedBy: MW4PR04CA0313.namprd04.prod.outlook.com
 (2603:10b6:303:82::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8525:EE_
X-MS-Office365-Filtering-Correlation-Id: 82601be0-54b0-4ffc-bc0b-08dd0a57b2a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?VlC9pWuSK0DTtYenSg91gJWjZDyZjKfUmtd2rTOVEFvsIQy9TAVMvCoQUG?=
 =?iso-8859-1?Q?xzBWKGUYgTbIsHMCoDBC4B7+vBI7etY/mvGcODCaLINLFVwoNbVk/ty8Mc?=
 =?iso-8859-1?Q?95wwu1GZZ+hjx7ipx/8uao4r8w24pxEruFiMEZskG73CpyABkJTZB24MJC?=
 =?iso-8859-1?Q?WAlma0dvWpQ+cCt7ngYhgJ50AT6yGcxqoC/KFcTF8dbU0EKOGdjz17Fg28?=
 =?iso-8859-1?Q?XRV1w2Fu2Z+dw10oCZxuoELVxF0GVDF6kn//jr42eFgNnUy8d6AuABqq9c?=
 =?iso-8859-1?Q?9m/6RuGz/T4bqbkr8jHrFuoGfoo27HtXo5oiO+gsETbPh0amey3NZiT3Ac?=
 =?iso-8859-1?Q?FUSTpFBRM0yjBQ31Xch9rpT36bernFOPRQ6+PXSaOntJ2O5hyfgQpoP9Mr?=
 =?iso-8859-1?Q?BkEnqxzDDDOsprG/NkODHmLyhDZNCGdsocobta/7vqLZ2r++kgsNJ2Vqd8?=
 =?iso-8859-1?Q?7yL4PVMgPip7POdZfgDT/ak3IunyVQoR95v27pwOV3NyjSKAMssE1sDAeS?=
 =?iso-8859-1?Q?3FcXaJj2P1DZ4BAdWL473/nT6a9t1AfTESOonR4W4Vns7vyBpiW965e1qB?=
 =?iso-8859-1?Q?9I7fPBKX4x0+0aWRCkOzWs3+nrNnNvirev3Lf5W2Q6Y264wy8uAQXypzbl?=
 =?iso-8859-1?Q?eMO0z0yuNeeod1YqFCfPi5bYCVgzrXTWtMYvDAeo/qprEPq3ZOJRKEfFF7?=
 =?iso-8859-1?Q?PzyLDuWK1TxXgZo2a3jODd7UKUZxtWLONxxtw6vWWF429F13B6XUss4W6K?=
 =?iso-8859-1?Q?BYJtHP2L7lEisEaQP1nv2ZeX5DxC2/k7L0agtKlgVrGDq7tNk0nS9esUWk?=
 =?iso-8859-1?Q?592iNaT+NZo/gvVfPVNR83btR0JoK26y4nkbxACyAF128L0XrJBuxEBiZO?=
 =?iso-8859-1?Q?gyyrA5nY2fMltzxjfkclSZiClDbPo2CZCnAACfPhLNbukPUchuMMd30T5c?=
 =?iso-8859-1?Q?IVuwJpLmm4TlnxW8v88mmur+tGQX5mnbF0jFoIOz5FZcswX8eWfZFIxyDS?=
 =?iso-8859-1?Q?QNGKwqdBSyRLcjlC0Z/o/L8fiD9/yG8Cfcylr+7MOlBeSKvdTF/xfDo9Ou?=
 =?iso-8859-1?Q?hSI4qSdJYCHwx/DeoawHiSr3X3LA6Juhs/hiLwqfLM5T+7v6PJZyBjGYxR?=
 =?iso-8859-1?Q?kc2oO6t1fW9umK9j//QprdqBltYQM8leVD1QvIvxS0Fiyk2gNTSN84DrNh?=
 =?iso-8859-1?Q?DiNF3swKHY/s0mPEb5toayalvs2Jsu14ZwD3zeNcCZyrQSyBex1Wt2I/OT?=
 =?iso-8859-1?Q?+jIgsidhg1BYYRGVfTl/S6gxRKULl9mFy5q/4aenOfS5ltR9NIP32/vq3k?=
 =?iso-8859-1?Q?IeBpACr1xdQRF5GFuFCBVvKhwaqqZaLw7g3Sm7gsjU3fIqktoHG1/JesSZ?=
 =?iso-8859-1?Q?NH8T4Fn02e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pFgvLLheijF/WcayRyRMTDCTa4DXD6IiOwPn1qPKw5d+nIdFoqSr2mtW4+?=
 =?iso-8859-1?Q?O32miq+LSfuujMWRzwp2bEpjyihElvKnnZ/gXocz/QPa2Siv7vAbl2hhaf?=
 =?iso-8859-1?Q?Ph6kxsSt2LQceszoMCSaSPbhyuYglKT0r0PkYROMkoy6jtyPUOIPWhn5i9?=
 =?iso-8859-1?Q?WrRwXKRqYEd1n5h2C5MvOcyry/RrPOlYo8XSobNUql+2a4wnHUptrOj3RF?=
 =?iso-8859-1?Q?GneHsG9R9PXOhYqYiXbEHDUJLpY153SL/px9nLARdbYc4IUqkrro795SYj?=
 =?iso-8859-1?Q?DGnotjigyrdIyj7QvlKljhsSDhm4ztfC/C3r/8MqQgsoBwYJwsW+ZppOpl?=
 =?iso-8859-1?Q?bF1hDUdlyMWo/JVPYvIFtq60foVc41KJD3YSQR+emn2lgAGSMv64kzaSak?=
 =?iso-8859-1?Q?ch5uy5VjQgGPDTZtWeRhjOSKWRXgFB396ZGigWg5cM3tTMbrzjJ07muvcz?=
 =?iso-8859-1?Q?V7CwrX9XQL7gJjaa36xEACAV1XQWrD85bAgHeOnPpxGtWNfAMVyS7KBEti?=
 =?iso-8859-1?Q?cOLHwYk1yq0uBn+eFQfqeZ7vlMSI/YmoQItlRIrlDFcE+NO5Nczookgue0?=
 =?iso-8859-1?Q?6PH0gGAtPSAzMfbInL/sToUi+37pb8BQ8Z6mqnwxmfeizqXbWKh+OmLyNM?=
 =?iso-8859-1?Q?3/pz9bC6V6TNMg7j7hB8BnhvzsU2TXLwu2DlwrXoUSc2fstGVggwZ4NklH?=
 =?iso-8859-1?Q?6YKqCur4m55EuvZLSNCU4MiqJQoI8dOBJbHJs8R2TBPbKC5kKUD9/BGI1H?=
 =?iso-8859-1?Q?pkZxs1z/nTgDuHB/9o65DLFb44PYfwGKIAmMBLzmqlgorG3pzRIYucr9ck?=
 =?iso-8859-1?Q?vqJ1IfMdqvjcz3+bGdrX/89WMoTdtn2riVyiaM7oq6kZEtO98DTZZNMvSv?=
 =?iso-8859-1?Q?BbY45SYGfc7mXx0ejKW2eHTB6Dn3sShITalR4qwkAfjftmiub5QywIEdtd?=
 =?iso-8859-1?Q?glQGOXzJe6D7dLrBBrNekaYbX+aL5UolPkbCTlJc0/sza7gkTs/+pTxFQq?=
 =?iso-8859-1?Q?l6UazibLKOubDCuqUoBmjdpepwg1YWBM6ltrfae4d4Q4aS5NRbI0Vvn+48?=
 =?iso-8859-1?Q?M55zxWeqB41yKUPH2Fckf96LHE9hF2jpTNvuZAYRzTNlRMs0J5NuzFRqPF?=
 =?iso-8859-1?Q?SSRfeuIwzMcfyPZPyJ57cnUmLJJNIyz4aN9QaJlSn5i0Vt8J3VVuS0sr3y?=
 =?iso-8859-1?Q?eSpCJS/1dcicdZ5w8hXvVxAfzCWCLHKX0zwo586GQjWF4NifS7n2Qy281w?=
 =?iso-8859-1?Q?q6nlThKf6lvIbLQ8F+LyTR2/kl3Ja0q0UDzJVm6+zgVGbU+QiQSHH6SAB9?=
 =?iso-8859-1?Q?OQ/GgviDsS6hsqNFn/CazApIXi+X4byASZP0wkEPBIcUTLsFg6jdv8qsUN?=
 =?iso-8859-1?Q?gHbe7y5h+MOT2zKNIZgiRoXojbAiaUTCocwzkdwoq1rgqBhL06wCkZ0K4q?=
 =?iso-8859-1?Q?SmsswHiHtLt8q0bkHs6O69I4yia6e6sOkOpMt7cyO3V105sUR/hneP5CfV?=
 =?iso-8859-1?Q?LcR4LC2p/lJMhm8YSlGDxT3EUp02FPvfmJI2oo+PjHWE+p4pyave/F42ZX?=
 =?iso-8859-1?Q?Bj3WtIIJRmkxfcpcxp3m0q7/eonw30vubxr+mYj2hvjBKseJsUFKtnR1Yr?=
 =?iso-8859-1?Q?oY2opSPeQPxA85Es5a5sbi7fGh7UWB7NaOu243EZZ+NZqdhAgi435DEg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82601be0-54b0-4ffc-bc0b-08dd0a57b2a6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 18:09:53.3989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2DNP0WPJXSqBVG+53qelONYze5KXYUddLN95m4v5Reelsgxs7S03ZXzM6yi4KQJ6Y5bszvEZcdx/+5l+4x5LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8525
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

On Thu, Nov 21, 2024 at 10:06:54AM +0100, Philipp Stanner wrote:
> +CC Thomas Hellström
> 
> 
> On Mon, 2024-11-18 at 12:48 +0100, Christian König wrote:
> >  Am 15.11.24 um 17:07 schrieb Philipp Stanner:
> >  
> > >  
> > > On Fri, 2024-11-15 at 15:39 +0100, Christian König wrote:
> > >  
> > > >  
> > > >  Am 15.11.24 um 14:55 schrieb Philipp Stanner:
> > > >  
> > > >  
> > > > >  
> > > > > [SNIP] 
> > > > >  
> > > >  
> > >  
> > > >  
> > > > >  
> > > > > But you wouldn't want to aim for getting rid of struct
> > > > > drm_sched_job
> > > > > completely, or would you?
> > > > >  
> > > > >  
> > > >  
> > > >  
> > > >  No, the drm_sched_job structure was added to aid the single
> > > > producer
> > > > single consumer queue and so made it easier to put the jobs into
> > > > a
> > > > container.
> > > >  
> > > >  
> > > >  In my mind the full solution for running jobs looks like this:
> > > >  
> > > >  1. Driver enqueues with drm_sched_job_arm()
> > > >  2. job ends up in pending_list
> > > >  3. Sooner or later scheduler calls run_job()
> > > >  4. In return scheduler gets a dma_fence representing the
> > > > resulting
> > > > hardware operation.
> > > >  5, This fence is put into a container to keep around what the hw
> > > > is
> > > > actually executing.
> > > >  6. At some point the fence gets signaled informing the scheduler
> > > > that the next job can be pushed if enough credits are now
> > > > available.
> > > >  
> > > >  There is no free_job callback any more because after run_job is
> > > > called the scheduler is done with the job and only the dma_fence
> > > > which represents the actually HW operation is the object the
> > > > scheduler now works with.
> > > >  
> > > >  We would still need something like a kill_job callback which is
> > > > used
> > > > when an entity is released without flushing all jobs (see
> > > > drm_sched_entity_kill()), but that is then only used for a
> > > > specific
> > > > corner case.
> > > >  
> > >  
> > > Can't we just limit the scheduler's responsibility to telling the
> > > driver that it has to flush, and if it doesn't it's a bug?
> > >  
> >  
> >  We still need to remove the pending jobs from the scheduler if
> > flushing times out.
> >  
> >  Without timing out flushing and/or aborting when the process was
> > killed we run into the same problem again that we don't want ti block
> > on _fini().
> >    
> > >  
> > > >  
> > > >  Blocking for the cleanup in drm_sched_fini() then becomes a
> > > > trivial
> > > > dma_fence_wait() on the remaining unsignaled HW fences and
> > > > eventually
> > > > on the latest killed fence.
> > > >  
> > >  
> > > But that results in exactly the same situation as my waitque
> > > solution,
> > > doesn't it?
> > >  
> >  
> >  The key part is that dma_fence's have a documented requirement to
> > never block infinitely.
> >  
> >  
> > >  
> > > Blocking infinitely in drm_sched_fini():
> > > 
> > > If the driver doesn't guarantee that all fences will get signaled,
> > > then
> > > wait_event() in the waitque solution will block forever. The same
> > > with
> > > dma_fence_wait().
> > > 
> > > Or are you aiming at an interruptible dma_fence_wait(), thereby not
> > > blocking SIGKILL?
> > >  
> >  
> >  That is basically what drm_sched_entity_flush() is already doing.
> >  
> >  
> > >  
> > > That then would still result in leaks. So basically the same
> > > situation
> > > as with an interruptible drm_sched_flush() function.
> > > 
> > > (Although I agree that would probably be more elegant)
> > >  
> >  
> >  If the wait_event really would just waiting for dma_fences then yes.
> >  
> >  The problem with the waitqueue approach is that we need to wait for
> > the free_job callback and that callback is normally called from a
> > work item without holding any additional locks.
> >  
> >  When drm_sched_fini starts to block for that we create a rat-tail of
> > new dependencies since that one is most likely called from a file
> > descriptor destruction.
> >   
> >  
> > >  
> > > 
> > >  
> > > >  
> > > >  
> > > >  The problem with this approach is that the idea of re-submitting
> > > > jobs in a GPU reset by the scheduler is then basically dead. But
> > > > to
> > > > be honest that never worked correctly.
> > > >  
> > > >  See the deprecated warning I already put on
> > > > drm_sched_resubmit_jobs(). The job lifetime is not really well
> > > > defined because of this, see the free_guilty hack as well.
> > > >  
> > >  
> > > drm_sched_resubmit_jobs() is being used by 5 drivers currently. So
> > > if
> > > we go for this approach we have to port them, first. That doesn't
> > > sound
> > > trivial to me
> > >  
> >  
> >  Yeah, completely agree. I think the scheduler should provide
> > something like drm_sched_for_each_pending_fence() which helps to
> > iterate over all the pending HW fences.
> >  
> >  The individual drivers could then device by themself what to do,
> > e.g. upcast the HW fence into the job and push it again or similar.
> 
> I have talked with Dave and we would be interested in exploring the
> direction of getting rid of backend_ops.free_job() and doing the
> modifications this implies.
> 

Sorry again, catching up late.

Got any details to dropping free_job?

Gut reaction is this is fairly large subsystem rework, touching many
drivers, and great way to regress stable software. 

> Matthew, Thomas, any hard NACKs on principle, or can we look into this
> in a future patch series?
> 

Definietly not NACK outright, but see my concerns above. If ends up not
being all that invasive and good cleanup, not opposed. If it starts
messing with existing reset / job cancel / queue teardown flows I would
be concerned given how hard it is to get though correct.

Matt

> 
> P.
> 
> 
> 
> 
> 
> >  
> >  But what we really need to get away from are those fence pre-
> > requisite violations Sima pointed out. For example we can't allocate
> > memory for run_job.
> >  
> >  Regards,
> >  Christian.
> >  
> >  
> > >  
> > > 
> > > 
> > > P.
> > > 
> > >  
> > > >  
> > > >  
> > > >  Regards,
> > > >  Christian.
> > > >  
> > > >  
> > > >  
> > > > >  
> > > > >  
> > > > > 
> > > > > 
> > > > > Grüße,
> > > > > P.
> > > > > 
> > > > >  
> > > > >  
> > > >  
> > > >  
> > > >  
> > >   
> >  
> >  
> 
