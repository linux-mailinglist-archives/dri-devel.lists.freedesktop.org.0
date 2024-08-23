Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB3D95CE2A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 15:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A144510E86E;
	Fri, 23 Aug 2024 13:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvv35BgC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2866C10E86E;
 Fri, 23 Aug 2024 13:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724420498; x=1755956498;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FrQ+ZpFC0kWAKd+uy115KQFYU4l4dlOL0ZQFEsH7eyE=;
 b=bvv35BgCZGpBU8kSfYYdn9IDA6RhgQzYu6UhOlrAXOEvDvmrMDph/NnO
 CZP8Xy28JzOihPLQFTNzjJV+2rdbgJXtiTjIWkbraOxnDABExnRsJUGqd
 Y34mrl4nMioeljxO0k9555JF62RwhskCr5E1m7IPt4I7fvJfO6Gr7HYxD
 aQFDzekhZF4yYxJYvuDNbk/DWltHb6x8oHDE0mck1R/6+gmoO3IcpP3FM
 facsrqZk5eKVV7Yqrl6749qZvBYknmkM+GA3cs6vGpD7IczkVtw6ASq04
 2Q/iwWuMa3GDZXls9Mud5Tos80DUn8cEevchM6guxa7eTQy8gkNxzgBla Q==;
X-CSE-ConnectionGUID: YVmephhpRc6KalsitlNIkQ==
X-CSE-MsgGUID: oCQ3gRAQTvWr6iW2JdD8JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23041656"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="23041656"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 06:41:38 -0700
X-CSE-ConnectionGUID: uoq3CV8RQZqlimz7GBP/SA==
X-CSE-MsgGUID: dahYQG8YT1qnxylfmtWGJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="99319285"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 06:41:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 06:41:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 06:41:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 06:41:37 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 06:41:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o10rVhg59iW24R4bhUYY3aGLMPYhL//OVmi3+0328B95FsPemESNug6qW/cFbdpjTCecNjTK1pEDZUaCVWpLMqUhZq8emR62F3xuM3PUoGlntVJRBb/58dgb6ftT1dhfShBbMnUReaJkdzkQLtByR8vBiOXUo4MJBxjjnrUFff3cRj9/MAPTGzkVUTvNiwQ+8FYAXoitO5+8Qj3xJtxYucnUxrRDbzu4VWdPw8IGRSSZwW56s622HRc6nm2l5pCsM8SD1PKlfw4sZlLlB9rahLUQ5oAZ/mp82BAR2HQHdRRNvJsly2Fa8ZnmXt/S8exotNEoXe8Xf2RB4J0wpQEv+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYPAxIaQmeT4IXgATEHBHFDFdBqhzJYcQnDV8hyCsDM=;
 b=wpuAoLp8pwmXzxeHVR4XIoVfY3mKdidX9Azd2CI/5PZVXWwTfmOhnFefa4GVXYnOJNpPdEPiVKJ0J6a4IbdYrzRZr3fapGcb/LNd5w04ukTrm5YvU9V3XLjzH4OoawzJX7YmFFNo8PuBPLB9o5JWDFlNWj7HxClJ49Nv75hhNEGnjnEBaUWuLIwy/KGg7xMPFCZhP+PPI0irB7syUMnw160GJRHr5HvO5E/Ojjj9phLMjFD7ClahA2nDnhQ8RUhDxo9lyB+Nk5374c3iDKYiVS4P7Pd6b0CGlDRWz/45ntU8yLEghJQr7zyvJBKYu4zLxLSCCoRUBq/3YhapvGZOYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA1PR11MB7016.namprd11.prod.outlook.com (2603:10b6:806:2b6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 13:41:34 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 13:41:34 +0000
Date: Fri, 23 Aug 2024 09:41:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gt: Continue creating engine sysfs files even
 after a failure
Message-ID: <ZsiRi0i80gRqTOIg@intel.com>
References: <20240819113140.325235-1-andi.shyti@linux.intel.com>
 <ZsUJIFVKuIX_pbDw@intel.com> <ZsWYIBsuFKAqVpIS@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZsWYIBsuFKAqVpIS@ashyti-mobl2.lan>
X-ClientProxiedBy: MW2PR16CA0028.namprd16.prod.outlook.com (2603:10b6:907::41)
 To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA1PR11MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b4ff9aa-da50-4c49-124c-08dcc3794ddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5Cpsb05j1fvVsXSoLng8Qvv9MBe30GhIkquc0cXyk0stH4BgY6YWs73iDzLb?=
 =?us-ascii?Q?vB09a7iNQ6mL/0Za8ZHJWPwKELVLB1tqxgjloX0R0frwGdI7QqUHILDwaYBp?=
 =?us-ascii?Q?PXuxMwpokdwAQfcUKa4/T6tKdTAOemGOhka1WZWdwpTQy2zZisjUkoYKlX0A?=
 =?us-ascii?Q?23GJdo7w3kspxUU74xXa52oE4vy2GfsTg24x7VBL8/8B1k0Qd+CNt9fpHxEB?=
 =?us-ascii?Q?AWQd5vaFCq0rDUU8UB7cboj9Jg1GbF2IwQeghfhww5EmLV82EoteF6KjS1hI?=
 =?us-ascii?Q?3p3nkZl3b5xEzdTuAhqiNHSzh3Y27tNp/xQeRUlMrXjmkCTgxEONSiR1YPH+?=
 =?us-ascii?Q?rk2djoksPrTSFWaGO0NoTFzR2oxqOow3hrr0bE2a7sSMwDkoLQm/2TfLnEqX?=
 =?us-ascii?Q?yxVatmdxHn6ORPnsMdpib9zdMq5f8mv4eyVtcr4/g3zRTuMuM2dkZBRNifJ6?=
 =?us-ascii?Q?5XwdK3Y9ADf04ii3HQvGF9xYax0kImawgiqFsz3lZ/Mh5bxQpe4exj2lurVa?=
 =?us-ascii?Q?oi16N1xfX7UybFQVNmc63CtpbW486eBdNYFKV8Ym4IWFd/UjCuny2ReIsEf4?=
 =?us-ascii?Q?Tn4Z+XJEHicLPWIqscKwrki1/nCHgg7nZQYY24vZoa2bMHfRspHObuswRslK?=
 =?us-ascii?Q?9sNXgrqIz1NijE8/IqU/ZxErPNAnZ8+6EkbxErQ3uE0Vl+DWpfRtcOfRX6bl?=
 =?us-ascii?Q?g0pSShqju9eSPz702qiyM7BoXO4/amDtU8zPdjM7tSZiH2vUxT8I66YwX8Zg?=
 =?us-ascii?Q?jCoLTYe1iJomHuTV/veZ+HzXZ/N3iG58wLNmf+JznK5zqt+aQBQLQAC0l6Zy?=
 =?us-ascii?Q?aQ3BrHdZ8Cw2vSskDROYeXO0VEZGwyoWVTIwmS56J90UpQ7HjPZvDReCG+u8?=
 =?us-ascii?Q?T2KpleioE42gt/UtusA2+zyBagYP4mxn02So/mP6djxtkaW5yeW6b8CNAOog?=
 =?us-ascii?Q?RyEAecLXReqEYO+HKPSz3SNyhSYfx544FOPWm0UegkNZCaWoE5tOv25V55da?=
 =?us-ascii?Q?ab5AKvKDZNbIrOkuFkJEIVK7mm4wgbTdQN/uD1goYJarulgwIFgHSa5485ij?=
 =?us-ascii?Q?p1ZzvkaIQ+Tdh8ugYDxEdHE8N7gRD80ekW1xqDHS/pQB2eDP+9i3cGjKFQqa?=
 =?us-ascii?Q?fWsth77aCYxE6ohmPsMgUFrijtgSEw4RPdEGmArR1YFl/z+FKcsowC+m/Dj5?=
 =?us-ascii?Q?XYCADZRnhfChomGF1lk+CPh6WonG9Cs+zbeV+9kvkFzxyQuiWc78f2Y6eZKX?=
 =?us-ascii?Q?8f1NKGz9xQwEaLljhD1EqZOlFxxG9VyvKKJUZK90jwWZzAM5kUg9mw7HMSUH?=
 =?us-ascii?Q?WAZxDeO/2VnPrBRqZ1z/w2tlGx62GJOk22uQDlrScUFjOw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PNp8JHeC+FGnC5ndwIdmuadTH4GwiHTKdP/5FXv0gKj3ME0oCnWlwC7ILasO?=
 =?us-ascii?Q?eCqff07620HfbEK1MN6h33yUIptqwe+R264GEx3LvDsCBR7GXON1ryx02CM/?=
 =?us-ascii?Q?G6cHinhiCLAaIB9sr1B+lUygw+KOWg2F/5K7c53lYW63y6w1z6F5stPDFWbf?=
 =?us-ascii?Q?FuwZp5J+3eX15zRvGZpT+XuZ19Junz0fLRfQLYRyYipH4Tx1ihmuwJkHMrrA?=
 =?us-ascii?Q?jua9rwr4mCyur+xj+je4wiO8cgJTbjtqPqXyeEctM3yAzhHuDmF3lItFSRhw?=
 =?us-ascii?Q?O2cdsuWrGACXQY1f6/jdE9H4G9Tcjdag+OULpikE6xrGiXsVZru9nkxRV/O/?=
 =?us-ascii?Q?wSilW/PNtu/bNnvrH0tN5GotYeXHdAw+nbxmcivtozPLNpfWh84A8EjMK2Ld?=
 =?us-ascii?Q?WnzGIQQqoDe/UMopfcDEuegM2iVYDOtz15vF1BaJHnUJ6cctl95eeXOTgz4S?=
 =?us-ascii?Q?+HacL+pjVe925QsP2ZbU6/oRW5x0UniamFVP+atYlQAcNvg0snPDbhOR7ECf?=
 =?us-ascii?Q?eb2vw8Q7EpsjpSEUQ94SSzfhpgsQr9pfKS+L19INkPXNTXKjvTV4bBD6gT/m?=
 =?us-ascii?Q?78/96tUy03mfDTuYC1+67f6CmE2ZymV0B2ryL3DguBsZV0BMi81zUvEDjOAR?=
 =?us-ascii?Q?JtxJdXznsa5awvdN4HRLb2mLX3NsC7ZZDnle1+jwAfrRVyVqHoSj1VqZyFge?=
 =?us-ascii?Q?d+jFhN1hIRv+3ZhNvXw971P9ISXvvqaRFVokemRFTpGEI1wZ2CruNUr0UimW?=
 =?us-ascii?Q?uThrZykE6te6Y2K0AmyWSR9HMB+0HLMMvgFJ3pJ3Yz7ALEFDeG9+uWvFvWFw?=
 =?us-ascii?Q?75NOMu5zGHSuiwR3kTfACMyCyIiLilnnaySbZqKQUx5Y7xSDABkSOa8wTX4h?=
 =?us-ascii?Q?n+0vNsQEZJdu41waAUMr7WoDK+vaHFj8CRK5lhrrNCb2SvhtKo1Sd/WuyyQ5?=
 =?us-ascii?Q?IzNRVzcfgMBmxgxaGRnCdWxlUG7hi6x+pdXTfqhkU8F+MXodV57T61VZLFrK?=
 =?us-ascii?Q?AF0wXgY4WdV1yyiuQKywkpOrxUst8VIzoeO/rrwVS2gC4MO1SzzfweHHE9Hm?=
 =?us-ascii?Q?EfNdZQJffUFHWQ9a6JqzQ/PpsChC2gyZTlwfI0Am9wiJnuZH37hFsxhSDWNf?=
 =?us-ascii?Q?ZiBs1zBRuI2ndPyQvCAgv7oGuhoWIVh/aSXGr2zB/LkB74CPTbT4tCU6XlNu?=
 =?us-ascii?Q?sIwSMX5KzZ0ZbdJtV5Y6W2+eBLT3O8NqEAmKKESTUo0NCX6S91wpxcvBFyKG?=
 =?us-ascii?Q?0iWRy/KVzvBDs5Qos8/UjBk+NXc6S82NICNKy0DPSqsufM3XBeAJ9U82X+4l?=
 =?us-ascii?Q?qGUtSlwNcqua7aDXQCDASDnhFk2KmGfp1IpvDfd1hYEOV8ezSQzVthzf7cS7?=
 =?us-ascii?Q?EsPpmfa7LnfAssv2xk1hrOKu0WKSx18Q19QRXJV7brCOLtzCDAxccoBU3IFP?=
 =?us-ascii?Q?9SqtJ5j3woeu06R+tkzP7nC7hzEhinNOv58quNBQVp2POKpNnKM7H2lbUNXW?=
 =?us-ascii?Q?75vE9tcXvsHozOVTsxS1SrgUY4+u+7OAAH0Qms3x09QrfLvl9VHrfrDrj+8i?=
 =?us-ascii?Q?s+nIlhJdZYuL58BpI+uaGVNftauVmg1mOJMrghRbAhoVvZnbd60LkHiU9BTw?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4ff9aa-da50-4c49-124c-08dcc3794ddc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 13:41:34.8746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qoytAOwn4P5PqHsd5kJZlUacjSvslxFSZgiSPWtGRlVZ60gEoFlV9sM3I3tPEX6Ceep8Xpo1FQ5wpljI0OeI2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7016
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

On Wed, Aug 21, 2024 at 09:32:48AM +0200, Andi Shyti wrote:
> Hi Rodrigo,
> 
> On Tue, Aug 20, 2024 at 05:22:40PM -0400, Rodrigo Vivi wrote:
> > On Mon, Aug 19, 2024 at 01:31:40PM +0200, Andi Shyti wrote:
> > > The i915 driver generates sysfs entries for each engine of the
> > > GPU in /sys/class/drm/cardX/engines/.
> > > 
> > > The process is straightforward: we loop over the UABI engines and
> > > for each one, we:
> > > 
> > >  - Create the object.
> > >  - Create basic files.
> > >  - If the engine supports timeslicing, create timeslice duration files.
> > >  - If the engine supports preemption, create preemption-related files.
> > >  - Create default value files.
> > > 
> > > Currently, if any of these steps fail, the process stops, and no
> > > further sysfs files are created.
> > > 
> > > However, it's not necessary to stop the process on failure.
> > > Instead, we can continue creating the remaining sysfs files for
> > > the other engines. Even if some files fail to be created, the
> > > list of engines can still be retrieved by querying i915.
> > > 
> > > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > ---
> > > Hi,
> > > 
> > > It might make sense to create an "inv-<engine_name>" if something
> > > goes wrong, so that the user is aware that the engine exists, but
> > > the sysfs file is not present.
> > 
> > well, if the sysfs dir/files creation is failing, then it will
> > probably be unreliable anyway right?
> 
> Are you suggesting that "inv-<engine_name>" is OK?

it is okay I guess.
But my point is more on, how are we going to create this if
the creation mechanism is what is likely failing here.

> 
> > > One further improvement would be to provide more information
> > > about thei failure reason the dev_warn() message.
> > 
> > So, perhaps this patch should already go there and remove
> > the dev_err and add individual dev_warn for each failing path?
> 
> That's a suggestion, but it doesn't mean that it necessarily
> improves things as it might add some innecessary information.
> Just thinking.

okay then.

> 
> > Also it looks something is off with the goto paths...
> > 
> > That if (0) is also ugly... probably better to use a
> > kobject_put with continue on every failing point as well...
> 
> ehehe... I came to like it, to be honest. Besides I like single
> exit paths instead of distributed returns. In this particular
> case we would replcate the same "kobject_put() ... dev_warn()" in
> several places, so that I'm not sure it's better.
> 
> If you like more we could do:
> 
> 	for (...) {
> 		...
> 		...
> 		/* everything goes fine */
> 		continue
> 
> err_engine:
> 		kobject_put(...);
> 		dev_warn(...);
> 	}
> 
> And we avoid using the "if (0)" that you don't like.

nah, no strong feeling from my side. It is there, let's
avoid unnecessary refactors.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

on this patch as is. And sorry for the delay.

> 
> Thanks,
> Andi
