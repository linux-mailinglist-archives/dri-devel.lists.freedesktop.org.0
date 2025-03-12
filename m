Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42664A5D415
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 02:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C4C10E038;
	Wed, 12 Mar 2025 01:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V3oGwvo2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365E210E038
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 01:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741743447; x=1773279447;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lK4xktmhmtsLcBmwsWCeVzG6OHgFPKoSSQkcbFdxrcU=;
 b=V3oGwvo2MHL89tfB/ncmxVMOQTFCho4dc9HH6QNOGxCrJASjMlM87/rb
 q4qnr3YM4VTUBLoWbfdlUySzRKfwjBYjf6Bvr/gEFixy0bJScllSqwJv3
 BF2ESVa9Tqv/fC7vskxtuJIRsx6jU9YNx1MkBPrTfrzGGVZNdt/TYJgRZ
 HPrSWXSRx6Wc48j1nsUD1JKQb0I6M+4YE8FIN7zJJxtvn5kSP8VY+o2G7
 wfE3YzuhglJmfdZUexsn724fM2CVS84bvVx2u+hzXr8J3JCKOyXnsGH9J
 cwJ3eM4UG9/GPQj7xYTYAUFo9SfzqF7x9XewbXMbXKkVpV0RxmzvCZ433 g==;
X-CSE-ConnectionGUID: rRRlZM5uTMCwl7/RanHZrw==
X-CSE-MsgGUID: kODcrsUrT3iQbxrUkMs17A==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53448234"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="53448234"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 18:37:26 -0700
X-CSE-ConnectionGUID: xdiefz1USOiaGnhD7Cgomw==
X-CSE-MsgGUID: z90UtD4KRYqZQl9mdttPYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="120193427"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2025 18:37:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Mar 2025 18:37:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 18:37:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 18:37:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JC+Ld3koqNdb6HXxIN6fJjismL6kLF/qHhqM9shxmAeq/VkwcbQeND0HQz7R4wHGKqhUDBcvrxUv+KmFNKQ50VdHA97CbEbBWgSGxgTsv2Vj6xO/nKjUQbF46xQyph9GTds7Udb5+RljWdUn1rJuP+N+PuC2a/msvT6aqQKnTfJ5UWmgUpyfByW7Ejj/WOHNxnCkO9UzO/roDz12VERoS8W/4wYUNMxiRljhH6fr4764XE9FlV4wckNaMkVAurMwsSoeavV40nquB98Ou7fyWWossF8SIbU+C3WRvUAKROEyqOEJzsxZrjyiyd3q94EJME2azO28nKqzsd9Dg/hODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Su8yCl/m9HJ4ipeRf8wS/T3VyEUWJ0hgUDBZiqYVC8U=;
 b=COFBWTAkGQlKULOOFJZkHgPg7b+pLeCP9meBRCdlWMYRd+s0AvI/QdqO5Pu3RgpaEAn8M9e271tTvELXFlsEind5HACdS5t6BwY1H46p7Dd9pZ++vm/9jzLi5UEm3udCVDH2cTrjraiwF01qjtmiHeUnwi8HSmsBt6kCZ9ExtfKumU89wlunFIEYPSF2PmCYaDHvQUq/IzXo0IVInAlswMErByo5yGyAQY21HMGmxx5BIr4iMUJFUC1OrlYDFqWPySRGjXq42+R/gNoeu5zJq0Y55hQvJLJHZRlWh/lxwMp6F3doAau/3gGRuh5t5LuEcKba64TsY+Sql9I7rPGrVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by LV3PR11MB8766.namprd11.prod.outlook.com (2603:10b6:408:212::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 01:37:17 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 01:37:17 +0000
Date: Tue, 11 Mar 2025 18:37:13 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alexey Kardashevskiy <aik@amd.com>
CC: Baolu Lu <baolu.lu@linux.intel.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
 <kvm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 <sumit.semwal@linaro.org>, <christian.koenig@amd.com>, <pbonzini@redhat.com>, 
 <seanjc@google.com>, <alex.williamson@redhat.com>,
 <vivek.kasireddy@intel.com>, <dan.j.williams@intel.com>,
 <yilun.xu@intel.com>, <linux-coco@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <lukas@wunner.de>, <yan.y.zhao@intel.com>,
 <daniel.vetter@ffwll.ch>, <leon@kernel.org>, <zhenzhong.duan@intel.com>,
 <tao1.su@intel.com>
Subject: Re: [RFC PATCH 08/12] vfio/pci: Create host unaccessible dma-buf for
 private device
Message-ID: <67d0e549d4d27_201f029458@dwillia2-xfh.jf.intel.com.notmuch>
References: <Z4Hp9jvJbhW0cqWY@yilunxu-OptiPlex-7050>
 <20250113164935.GP5556@nvidia.com>
 <ZnDGqww5SLbVD6ET@yilunxu-OptiPlex-7050>
 <20250114133553.GB5556@nvidia.com>
 <17cd9b77-4620-4883-9a6a-8d1cab822c88@amd.com>
 <20250115130102.GM5556@nvidia.com>
 <f1ac048f-64b1-4343-ab86-ad98c24a44f5@linux.intel.com>
 <20250117132523.GA5556@nvidia.com>
 <835c7751-d8ba-4af0-812f-2b3a9a91d0bc@amd.com>
 <20250120132843.GI5556@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250120132843.GI5556@nvidia.com>
X-ClientProxiedBy: MW2PR2101CA0025.namprd21.prod.outlook.com
 (2603:10b6:302:1::38) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|LV3PR11MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: 37b5634f-18cf-489a-67b2-08dd61066c5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kzkxq8zPsyIXGe0BThEHRfArRJy3R4j37lCV1QxvGzVF+zI/UfjN3zPTJwyA?=
 =?us-ascii?Q?8HHxo/z/mDb3V79KO63pHAUtK3MVspTnfDW2mY4DYwSosN4pFwE07bfibsEE?=
 =?us-ascii?Q?5p/VIbLJp+IN6LjY00hRAOuS9pp0KfI69XtWCJJXxc7Llu/sSmUDzZd0mU8g?=
 =?us-ascii?Q?D7dSTRewPfBgyS9w0KkidOhWo8qYuoKj6wlzg1vD48O/f/USagGeUcO+I3ii?=
 =?us-ascii?Q?OQ6zvNM0KNJwWOZjd51aHmk7u/J3c9rSLYx5wZJNmQmlbDOm4QjhHc9tbua2?=
 =?us-ascii?Q?Aux6DJ+vqoKmqcsPCu0efKoML/HArDzOrfcNAD4MnvKtENtJOmTxB8O1BJ0p?=
 =?us-ascii?Q?BxrUsZbLPo86p3SKTyRiy3aaIb8V0tY8+e2n6hhOXjnTMVpEv+xOUyuuIRqD?=
 =?us-ascii?Q?SCuWKEFeHl50eeh6S0i4uXKOFW+Lf76mzFTtLEwnanjr+c0wsUDtYwKfoeVF?=
 =?us-ascii?Q?fAXHPff7KTnPi9lwsI89ZR2LDCfUmt/3cRvKjE0XGrMmKAE/ejvPLvaTzvZ2?=
 =?us-ascii?Q?9u7AqMXRD+0P1Kai90OZUzIrANwPWUO8pH8VGp6OCGTRXr+RWo78msJkJYh+?=
 =?us-ascii?Q?Oux+k8jBnUQjdPdes9zzjqRYycpd7Tgwqu4EG5AxUGrUZVTaF61VV1BSYw6B?=
 =?us-ascii?Q?Rc5Ii/LP7+s8reNbtP4TNkMM3vbO96gDwmnRkMcI/h9OO3UsDJOtWJP75IH5?=
 =?us-ascii?Q?lVB8dklwS5zXlk1WzuihNuievaW6ZO8EQ0Alyfn7Piziv6KWYKa2IGmXA3Qh?=
 =?us-ascii?Q?EjwLMYcwsjXkXnF1Pp9ZvSp2kNO9q2FHlbNMVmo3pR905rJJGY0i4/VyTOqq?=
 =?us-ascii?Q?jsbf1z+qZG0Tg0dnt8BdwgIhkv45aJ1vOX4pg0+iW1TjJoPbH73KdqG9tWz+?=
 =?us-ascii?Q?shr1i08lstb5b+jG3WCbhOSmVs/oa2RrJS5yYgRB31BIwH/NXtNgysoRjOpP?=
 =?us-ascii?Q?Q+UTSabBzbcmUqBy7uAurSe8YJ6flB6DIewSD6pHtr1PO3g83llQr6ad+aXx?=
 =?us-ascii?Q?0fJrvcxuCWRDq4auHDgZAcdURGy6jdmWMrhcEpr83iwJYipXe6gxgATj6dIh?=
 =?us-ascii?Q?AddYg45T8EEJ+Vn0vS03U0sV8++PE/bMtxDE3ukVUhK0JMR1r6Six09L7/03?=
 =?us-ascii?Q?gjQCQ42ZgkvSGRyxEC99NXcLiOTI8yT466tiRs2kPvPuFqQmn4q0PxbRc7UO?=
 =?us-ascii?Q?5bhKBK+p5dIpKNjf4oeZfnfZcqH4fZF6Vjmj4kgtQV8th5xj9+ZXZPJLMNGt?=
 =?us-ascii?Q?II359vQBf9BAVQBXXIFvdUqaTJgYzMO+rydkLRispOflMlUkGxiB2It6jKa2?=
 =?us-ascii?Q?Rv6oJs3Nnvya4tGnM3tZTXtojgO0D+wJFXDBa3MmhmdO+4QXvINQhpktY1mH?=
 =?us-ascii?Q?aqRivjasiieU3uyav4PePS0HZHSj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8107.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ttrl8dLU7exUQCLVc4KQwjKgtPQkM2R9IiqSAJxuXFtjUg6asrMb43p+3mBV?=
 =?us-ascii?Q?2AKVeqT6KhjlSCQD2x6/FUtmM1bDiriMC+u1YOI1u0T/ODeub07WR6t+CogI?=
 =?us-ascii?Q?vFMIKlvzrjzMMeuZWSKDyf9mRNLuyCfcQ+kNuuaHCaz1+HGb2/r5aV7fzuE2?=
 =?us-ascii?Q?5OwYUo8dBLPxblVVXS/MXdz64YlBP5viqUefI0ehosxBZXHmgrlYd1yqlk0B?=
 =?us-ascii?Q?/WtVZDqPz/4mW4KWPEBo5rjPzAdCe1VlIBt+f1ZSfzer+7ohp2XPMV89S7Go?=
 =?us-ascii?Q?lE092PAmdW5NZ9su0f7m7ThXFHAyZFDez1FhCLCKW0sZ0xHGb9CCk8nbW4S+?=
 =?us-ascii?Q?7BYwGWt7Jr+aI5MWOspWziB8g52tPg2DzSaD4HSubgvyXk9giIdWLMDDfCms?=
 =?us-ascii?Q?P/zF3LwsRQDj12MUA6S9YM2A/QKBH2PKX6CJD+PibS+MGMCFXFaN9xGVZ1Rh?=
 =?us-ascii?Q?MXhCcMIa+vRsN4+hzKhO8mWnDQoGsbSiyZJ0UPIHjatc5X5jM8xeElte0a1i?=
 =?us-ascii?Q?21PwvDns/7BjHnkyqKD96hgzmDHil+mHn5U5h7bNPCpBNvb0WdMZZbY/M17w?=
 =?us-ascii?Q?bGX793hcJLA0yWTLwH9fwvtwYyveQOYhGxoKRLsgdAiDNDqpnNF6Y02yxMpk?=
 =?us-ascii?Q?Vz71p4rCysLPBVSK9t909DyyrzYkSwbny0HE4j/aEqUcHmaPbus5zZ1wDl0m?=
 =?us-ascii?Q?zZiezpveJ8oT1uwMBSHvWslvEb/1XkK31M2S0dLbfshswTiVoPLI3Go17fRJ?=
 =?us-ascii?Q?gEfXUAJEFZnAWkn5w4Dfdv8sfITp9ZohcfPWXJJOu9imT0/+f/iPVVpJtVPJ?=
 =?us-ascii?Q?WXAQLYniOa//w8DDVdEjoPx7ea7OvY6Up6ESD8bSF7r5Woiub58ljSzcrxZA?=
 =?us-ascii?Q?8WZl9hKLDNWhsprRt4DyEsVPXqNgnburSAZPS0798Cy+7UbEL5w/kF5lu6SP?=
 =?us-ascii?Q?Te19HkkIKdEhGGdH61wF6wT08gVc6ze9Trrg2CHeG7Dta1LhKkR4Z6D1fmw4?=
 =?us-ascii?Q?1/w5BwW4FvLQS1r4Lbbs3Dpi8zcgIthkpbYZCO3tfL5xy+Tp1c045mrYD9MU?=
 =?us-ascii?Q?ZnZafgmdgOgNEt7oSKdqwftJ54jMjB8JF+gkZdgqRClIu0CfNxu/jbgnMVN2?=
 =?us-ascii?Q?VlAlYeJE7E/AZHqjLbW7DTvea419OsnEqxF2FnopDRNYhN29aXSFCS7+wQsI?=
 =?us-ascii?Q?/1T7UkFNRRmmrWCVtRtmpYxqoQqQ/L/QtkiZd2dv/ymXQw/EqN6Pcnfg59tB?=
 =?us-ascii?Q?XmVZA9KyhehQ+9DXPI1zHKuIFFb63SWRUZhSzz3Z6MV9yuifRe5Tg48t8JIV?=
 =?us-ascii?Q?DXRigpE1bYJ6LmylIAh4wGuCx9gJs5HPXrWRi13yJ1hLVP/ebal1OT4+OZH4?=
 =?us-ascii?Q?XVe916I7smxIG/xVRiOvgOVpiZp1RNJF2hsakCz49FdXJ/96smV37HIC/N7R?=
 =?us-ascii?Q?gpBbGn1MUayuC1tklPA7hEpEgdC4nj7EfTEmEkUEXZZnj0lbGbip9ocapUK0?=
 =?us-ascii?Q?sNbnJ2IkhaZbCeyBZKhF6xxIZIvQ3C+ZGUYExlZncVHqat0xJgLuXeQlzS/P?=
 =?us-ascii?Q?dUhYYjw8NciON0X8H4SzLfRUlmmaazYbp3XSM3N+iZCl44RHxmN0XkLPXTrw?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b5634f-18cf-489a-67b2-08dd61066c5c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 01:37:17.3926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4zyWPgxAbFeVdbfvJBOeiPHtC20mGPC6h/cUgUUQ2LmVVQPoU3S/0/gh8AbqmCI8jeQOC/uc7+CczncDSjDee3GjFgjhjHOUFipeSc348E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8766
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

[ My ears have been burning for a couple months regarding this thread
  and I have finally had the chance to circle back and read through all
  the discussion on PATCH 01/12 and this PATCH 08/12, pardon the latency
  while I addressed some CXL backlog ]

Jason Gunthorpe wrote:
> On Mon, Jan 20, 2025 at 08:45:51PM +1100, Alexey Kardashevskiy wrote:
> 
> > > For CC I'm expecting the KVM fd to be the handle for the cVM, so any
> > > RPCs that want to call into the secure world need the KVM FD to get
> > > the cVM's identifier. Ie a "bind to cVM" RPC will need the PCI
> > > information and the cVM's handle.
> > 
> > And keep KVM fd open until unbind? Or just for the short time to call the
> > PSP?
> 
> iommufd will keep the KVM fd alive so long as the vIOMMU object
> exists. Other uses for kvm require it to work like this.
> 
> > > But it also seems to me that VFIO should be able to support putting
> > > the device into the RUN state without involving KVM or cVMs.
> > 
> > AMD's TDI bind handler in the PSP wants a guest handle ("GCTX") and a guest
> > device BDFn, and VFIO has no desire to dive into this KVM business beyond
> > IOMMUFD.
> 
> As in my other email, VFIO is not restricted to running VMs, useful
> things should be available to apps like DPDK.
> 
> There is a use case for using TDISP and getting devices up into an
> ecrypted/attested state on pure bare metal without any KVM, VFIO
> should work in that use case too.

Are you sure you are not confusing the use case for native PCI CMA plus
PCIe IDE *without* PCIe TDISP? In other words validate device
measurements over a secure session and set up link encryption, but not
enable DMA to private memory. Without a cVM there is no private memory
for the device to talk to in the TDISP run state, but you can certainly
encrypt the PCIe link.

However that pretty much only gets you an extension of a secure session
to a PCIe link state. It does not enable end-to-end MMIO and DMA
integrity+confidentiality.

Note that to my knowledge all but the Intel TEE I/O implementation
disallow routing T=0 traffic over IDE. The host bridge only accepts T=1
traffic over IDE to private memory which is not this "without any KVM"
use case.

The uapi proposed in the PCI/TSM series [1] is all about the setup of PCI
CMA + PCIe IDE without KVM as a precuror to all the VFIO + KVM + IOMMUFD
work needed to get the TDI able to publish private MMIO and DMA to
private memory.

[1]: http://lore.kernel.org/174107245357.1288555.10863541957822891561.stgit@dwillia2-xfh.jf.intel.com
