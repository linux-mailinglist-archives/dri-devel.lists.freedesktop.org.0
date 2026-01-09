Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FAFD0BE6B
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 19:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D6A10E92D;
	Fri,  9 Jan 2026 18:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMOdsWZ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ACF10E928;
 Fri,  9 Jan 2026 18:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767984193; x=1799520193;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tgCMNA0NeZkn0AbXoQtuOWznpBxmCFVSqq0N96axEOM=;
 b=MMOdsWZ4Y2f+SjtW/vnLvLH/+JqyHf0FNDuVGWrmFaj06r/vyQqp6TO3
 RMqPX+ymeq/QdfCVEI+PEynR6YkcaqbKs6Xgn3GcJlBdBT6IXwldYrORV
 WDInmcPgOB4rFvyH8uTgKj5oQ+91lcwsPrYmMQeWyH7ZDpsOj0FydqOEW
 Fd0b2fHNmPvyNSShuQpYTYIvmvG1NKJEYGWfr/r66+ZcAvqaT5MxwrUHW
 WTso/sPZp4wwoW77OseQ8j9VKE4/IEIPT/Ml3dN4Aa8m5huouxkcPaznX
 7TDn/wv09wS8ZremLcbJlHbTzOsI/GG7dskEaT+sT4MKN9NkOb0kmRnqF Q==;
X-CSE-ConnectionGUID: xIJKGIIiRBeKFdmxYHnzXA==
X-CSE-MsgGUID: SaDgrqbaQhmODAonN0BezQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="86787468"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="86787468"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 10:43:12 -0800
X-CSE-ConnectionGUID: 6HnkSnpETouSYNUeKNuC6w==
X-CSE-MsgGUID: 1dAwbipiTySAFJKOkP0JaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="203546255"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 10:43:12 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 10:43:12 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 10:43:12 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 10:43:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHYsForb7X2dcrRxdEnfkCDxACW1dI/PfxbEOA7ck4W031Vz97eKhpY7HAbqxwpGDk0o1TrrWP1+cXDUoxd05GCRX4DAp9nj/Fz9uQzM2dgoWztpbMtHA29G64Y7g/LtpJ0Ccto07WxiukJCkTybvVJyAftRe4EMXVgulg9Hn1QLYP9TidfttxAcrWdItNabKe1fj7ok68CIwSJvQc+deq+BpcWy46Ur8I12dzBCYR2qnovdnvrFLWy048NdAWuIeC9cZxgcI5MFj+4GKWFyYJlsXLOWWAs6bLUEpbHT3Lkc7ZTQpsWZrKRaAmzZwLxLaOWU79kOX2UDRxGh+6qDzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XkGxRnFIdgW9GUV1PG2rqjzBIL1bNCyLVX7X3brB4g=;
 b=bJjfLRjD+5h2qlltAZN0BuMFqhq/1G9odbtjunGrgz8f0G8VxUOQ5qtAR9vWk5dITIYYb3OeeJi6ifxnOgi/5YcAJglTJCQ8C+VJY8/evkbuGiUjUzmuF4odChPGq+zU7z2XbXvwmkOdSfJdo2gyMbqjQ1EfHYyjuRSSQqT/pES3CfjFznvpjQUKCipgU//R+Gg4IAWBwMJsEl/R2DWaeGIirBWv0upEoS4rNszT0Vjmwn57/GXOqJoktngutNxkc6X4QRsLUhzVFgh2abZA7ZSR/QYRXAMiyUlkH6da8giWwOXxbj8einekFgpXArblxIC9y+rqDZphgf/vR5NLJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7327.namprd11.prod.outlook.com (2603:10b6:8:105::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 18:43:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 9 Jan 2026
 18:43:09 +0000
Date: Fri, 9 Jan 2026 10:43:06 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: "David Hildenbrand (Red Hat)" <david@kernel.org>, Francois Dugast
 <francois.dugast@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Balbir Singh <balbirs@nvidia.com>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, <linux-mm@kvack.org>, 
 <linux-kernel@vger.kernel.org>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 1/7] mm: Add folio_split_unref helper
Message-ID: <aWFMOvGldokHHgIn@lstrano-desk.jf.intel.com>
References: <20260109085605.443316-1-francois.dugast@intel.com>
 <20260109085605.443316-2-francois.dugast@intel.com>
 <59fb1669-2908-4cab-b3c0-b97479da3fb9@kernel.org>
 <20260109103741.533c1b807f3ccf9a6f0264de@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260109103741.533c1b807f3ccf9a6f0264de@linux-foundation.org>
X-ClientProxiedBy: SJ0PR03CA0297.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: bf94485e-9d4e-439d-da9c-08de4faeef79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iqczwwGHWGp1YwR+ngbM58oITF9QJAKlUK7CEuJT6Od3vRWvfl39zYUgITNP?=
 =?us-ascii?Q?5hk/25XBH8wEsaNJnAt59AHOZdmhyM0nJp4bpnGxP5+9ASinnJbhgEsMVznI?=
 =?us-ascii?Q?0u2OcyJXAwHIT9JNJSaZlePy7vMH0SRGdm3aba6KWLAjM4fSXQhTY8Yaff1A?=
 =?us-ascii?Q?gQnFVXIbbOP9VSNlMrVTKu4mth95SnrV0cUzytSanvfWpulmk35+ytGzMkc9?=
 =?us-ascii?Q?HsACusgSOnhwL7G8122OEutziZCHdPeXUsFcIA0sK4chfH5T0R6c3qyz1UsA?=
 =?us-ascii?Q?Q7NLEY8cM/dEwWdqOScuWlzBxlRgnE+5Fs/oHHqsfnwJkBLdWdD6X2ufizWb?=
 =?us-ascii?Q?ZwmCHjXc8XPNDAFKU12c6nPKKUr61/6TPBFesqbbzWUJCnxY3Nz1ZO2WBw/8?=
 =?us-ascii?Q?7KC3Ho8SVJOJzAjl+q0buJAmgVWqJf4mWj8iTko302sfECoRheHOcnWlUesD?=
 =?us-ascii?Q?K+cyObgRWW0HJkjpdYgvClL2FD/wKV8ZKiGyYGiwZkOX5Iimbm6a0nhhGGAB?=
 =?us-ascii?Q?aLun2UpCPPLFxV47hxJOvTDlSXNi0AVVjU5qTNYtiVVG1LhYsUzF6P//rgIQ?=
 =?us-ascii?Q?Z3LxToqapULlwU6Inn/+1MTF+IPnZ39yBnDqMq9a5NJBupZSHFTA2AHv/ZZZ?=
 =?us-ascii?Q?IgJDKs6896pUkiVxtE3Cx2n65tWoydzkWA4U7bPXCmOZEHh2pQAHsD9Lal1w?=
 =?us-ascii?Q?dhUy2kdRJZq9K8LURAf/mDF2tcLHjbc/fwypJgwyZuwxBOKCtwfjW+xr4V7h?=
 =?us-ascii?Q?TiiWl63AXN22L1xWxwoHiVHTIoqvMmkMT1nO5xN953pplnGMaaBfuhOkUcrl?=
 =?us-ascii?Q?tCqKKDwjkouAazoU0+Q7LgydPEzafnE8x1Oovg+90yMOq0Y9pnL2vDBsLohl?=
 =?us-ascii?Q?6rOBAA70IzgObKuZTNXuZ9tnNy8DEfBr0jsUza9nYGHhLOVvN+XmgxxqOUy6?=
 =?us-ascii?Q?DCRtT2OjMGkc0kaMwrGp1Si4xDfEc/pqY8WAZhXNpQh6T6DPfUJzK0MvRCJv?=
 =?us-ascii?Q?t479fXCnmp/en8FOurbE4EYHLCZFlJH3pE9dEiVW7Ge14IwYAEGdJnUhYbfu?=
 =?us-ascii?Q?xL+jOgKd5cSO7BFPbrRo9pD4o3lX23CDRhOSvPD8iWrAi6G1diEbhAAedIPn?=
 =?us-ascii?Q?gw75Sh66qy5zZa9IswdTnSrUZDbr5m0fMcmztLzfj/Ec6JjRxY3os0XgT7me?=
 =?us-ascii?Q?WRJyRnJptnF+C5h9Y6itHpUEmMe4YY+S8Wy/TRGoJG9DpmXUZU3le5+0EFeR?=
 =?us-ascii?Q?hnTxygUg8jrz4KK5fWUaF1iVQTcXh+KZWkvFhYAZ6+E40eVA2zL+VKRXOhcP?=
 =?us-ascii?Q?M+wPF6QhL8VFzBGku568JsNdYguR7kK70p0Ae8oqmhpIUMfLLLFSzB7FVosU?=
 =?us-ascii?Q?WKDemOOHfa4RQkfrasypR/WZMhyzmUbuyCPyYFoUJKQp+PWv7g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V5v4rLkUdNy8PhRobWGDqd7kyuZFOBtYYY4meHBS3C9fbLb17R+95IxRcGAo?=
 =?us-ascii?Q?QAkMc93g54NBh4a4XgZd7S/oPN2D+WvUjqwc72g69Ic46Jr82ks/JL4wkl8m?=
 =?us-ascii?Q?h2w/ANR4CXHXZhDvY9+nUO0K1TWEIHbYBTjR3BX0cQD1DYhE/s9mqK7dX8OU?=
 =?us-ascii?Q?wWfhtfFm5+WK7F2ZzOdIM1+9ah31/QsghghuVKf2tFXfZzO8Yqg0KFXvVvq/?=
 =?us-ascii?Q?prFknYVmNHejOSqbWoqOFbd6/jSMOw9IUj/HY7KIQIIN8emDVMwbQO0455Wf?=
 =?us-ascii?Q?K/sGDzvixMT/zESo2C3ecfy9tL21MX/D/Mwn4beJqi7mVnBrVszfU+Guj3uf?=
 =?us-ascii?Q?cVrBbUJjXqThUH2sashqz+0esKbkYYvKeQku5b6bYwTM8BK4zcTkBvTImJ0y?=
 =?us-ascii?Q?mRGPhiPpwVeZ26HwVdq1ASWE0TQ7RyFEggxzHN5SLjl5S1zaMzDick7p8syk?=
 =?us-ascii?Q?RIJJTvs82+Lu2YDAp9NwikJwqyZ2ya1Iu08vv7aBU/XIGIQZ2c5hTdk8sFqe?=
 =?us-ascii?Q?h9rqg0ma7GHhm+YBuD8N8Br3GLqJnxwEqdN+P3Kt1ddRFYwdJe4p+U4XQIe4?=
 =?us-ascii?Q?Ocj/WgF6hRGuhBFDWjgHryjPwon5HQhSLE2UeynmgriQGn1ffGkLc7BKpSZr?=
 =?us-ascii?Q?uD/4MtwUyP5Q5Y8aeG87XQNCUyc1WOWh5uI2/CaR/7Hr+vcpUbwIOc8OKhSh?=
 =?us-ascii?Q?uDXCJQxpirLUL0FHe/rtVLyFIsrm5oq11CZEUGpHJGoZkmRk8z/8PtJ/DgMN?=
 =?us-ascii?Q?aGDFfdvo9/QnVmVMR76zGpFk0moB+7XshpdROqGbPkWmSsWhsNqEObSunws8?=
 =?us-ascii?Q?bssvN69+aUD3MXevwZ+82QMxqrgpWr0wkuOC5Bz+JxUIHDRMMMea0RB8blNo?=
 =?us-ascii?Q?mo847O4+iyCY3f4ph5RfuhAsVGcDVZ1ZvZTrfBIiiws8tzDWXcTIG9oQr3Hi?=
 =?us-ascii?Q?2PzDxB3ZHoM+xgqgG0yns8qVG0bjkr0m2DTavc0YJuwjHfmk0xVdong3SVFi?=
 =?us-ascii?Q?sQhngWJzWzNSJGqSHTGLuLLb/l08LPPNR1AFKQ41/HLc4Lh2in1P+wCHRKaW?=
 =?us-ascii?Q?6t5kPiiNhKw3s0wzl+sVGYT0WEdhXHtmnit6dHVoRZ2o9qLFmgL52SLqwik3?=
 =?us-ascii?Q?q8BxpCx3aDsnQdrEC25RkcxiSUfqpVUELtD2Mtb4I2EKfTCOKd5wWq9HpWZM?=
 =?us-ascii?Q?ktMJ2Im58+frOc2bOsljKF0qp9Pp2akxAgSsNX+l73qmlfLQC1Ri1wDnFA22?=
 =?us-ascii?Q?zF4xSP90T5lskKbuDdgGFRJ90yDQJvw5MkujQEF4yLxuKPrTm7YLcxoH5HyU?=
 =?us-ascii?Q?9ysX4oc9Gxkj78aOVgGVpc6k++HBo38KncaC2YF2y54g/50qNa4vNSMDpoBc?=
 =?us-ascii?Q?vziTUyxKQSi28yHzqnATavQBDTTzkJJGndL1bwyv1kQnd2lplqBo+rLS4LVv?=
 =?us-ascii?Q?Ss6GnStopqfqU2a1J46kWvw5/L6Oxhxe0sKLE05RVwNB9tPQZaiir4+5dBiW?=
 =?us-ascii?Q?9CVGNBBQFxlk+SsgZz42P+xydubJiBTJ6v+EB5h1nt9HiYtVS8lwEp5gfOIJ?=
 =?us-ascii?Q?XGGvor9UyE73J1P5v/B3+ZKC64tm60J9Z2Na1QqUn5EAYQO1y4ydxYPyabOZ?=
 =?us-ascii?Q?HX8skohYYZD4UP0qyvsdjGqHsQKCg4ZE4zK2+YjBTQgmv/jUHRr1CHwGpXqz?=
 =?us-ascii?Q?qwwucenqabKNR/H6CFg9YpBWHahVdRjMXr9IlIoKw0xFSXr6GTr/sk0633tX?=
 =?us-ascii?Q?TTCuBR+3yQBDvuk4AHf2p+mLXHiB+8M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf94485e-9d4e-439d-da9c-08de4faeef79
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:43:09.4529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2FIoIZEyV+3qXbbe9/OCAKGDJQy3aDTlrYuhQAECJ/E/oKxp//f6XvgeOIPx/bnPNUicXzn2mp1HBTRyEKjyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7327
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

On Fri, Jan 09, 2026 at 10:37:41AM -0800, Andrew Morton wrote:
> On Fri, 9 Jan 2026 14:19:16 +0100 "David Hildenbrand (Red Hat)" <david@kernel.org> wrote:
> 
> > I'm not CCed on the other patches in the series or the cover letter, so 
> > I don't see the context.
> 
> Both linux-mm and I received a random subset of this series.  Something
> went wrong.

Apologies for the list workflow issues. Here is the link to the entire
series [1].

For future reference, when we submit core MM patches in a series, should
we CC linux-mm plus MM maintainers on all patches in the series, even
those that do not touch core MM?

Matt

[1] https://patchwork.freedesktop.org/series/159119/
