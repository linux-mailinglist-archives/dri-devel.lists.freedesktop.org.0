Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC65B9F18A9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 23:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F14910F117;
	Fri, 13 Dec 2024 22:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aPtno3wl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013A810F10E;
 Fri, 13 Dec 2024 22:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734128174; x=1765664174;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oboBoDL1qY4/1JCATu/a4Wg9nRBlMmqvFwbSwW5e07M=;
 b=aPtno3wlYQ54kMktWzXd/+C7HBodZQp8dTNYKhDilOAxrvwpP7n1Vlct
 lmRp4PhZI+FNV1QLszWuNBTwU1wLzTAkmi2LzgPCnGuCC/HFyjURwNJGU
 U4YTc6uvlTNBx0pH++vG8p6STVwQeFwO5DTsrjNvk5CR9dR25zeVaILy1
 upcLZICnIzxqiO3az3VPGepEYBIpFVcE89L7W+VZBotNEJsQav0QU6Jkz
 shR60C0anSaBYoLyzUari1MgctUPvY7Ob0ZAXIjJ+oYbPJ1hSBJG5cMA0
 8U3FJeA513hpFp4/Se4zLOZcYyDxleNXgB6QkF27/G7kFq+4dmQdjfO9K g==;
X-CSE-ConnectionGUID: lk6ABbPYQkKd0Hn2WUuQJA==
X-CSE-MsgGUID: 6haA/gJYRTiIhjMyZcD73A==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="45200349"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="45200349"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 14:16:13 -0800
X-CSE-ConnectionGUID: Ryy15ksiQ9+vggR+GdIQGQ==
X-CSE-MsgGUID: k8i4MtWjQOyP+YKEdBRL7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100801132"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 14:16:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 14:16:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 14:16:13 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 14:16:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWKkAVqlQH7pwbFJMQ2pKUQR2Dztp2K+3hHPhwsO3pGm5k4Ua1WTqNLnop0jUpIXaerW+AcSbmPua9UiS/mBdm/mYy9PkfuxhlQDA+PJrgZmduc78SM+ynvtmLbijp2/5MpYubdtiE9v7LP3C/fMpDzPugqkxQAE5Fjk9GzOIzqNusR4dhQZlwqi8euM2skkwSrsB9QiyJg74umsJabef7p8k60jJm6QRlWGG7Fd1KyOtPHAW8i4EJsAhaeQ2ZIoCW1GsKEkks/CCBvHi+ueOzlq7ueskV5egk5aGoTXfAADmfYrDg3zfULSl7N8xqDSPQ+gzOUy8THxbwtfqkCo/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHvn3oaXeh2X+kczq747ru1SANiEWf3mkzoJtsujQTg=;
 b=aJppcZnsIelXd5DqhS4YmvlqdAU2g3En57gYpyLHRUnDPDkU7G5jNR1yXUjku3PmQuRa9RKbAEn/jn2NjTEc9571+iA5fSRM3HiDkFs2U6REt8usuXCs13jaltiQcGkZDjx5CuNrKb2lm1pEsyugbPiUhPtT+ohjgiCpYAq/DcKQJRn5F58iDf5WY1TXKBARoZzD6KvKCEq8QqBMh6zpQTDxI4vaH/XBtjwjhygYoURGCo4rdCk1PsupPqXItQ1KsQR1cEcQQHToov0bJ0KTeR7f174wgHuxNGY/ASkXvgz3MBefIMS/csMFiP/ypmS67IfN+wc70rAFxRWqhsetwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8211.namprd11.prod.outlook.com (2603:10b6:610:15f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 22:16:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 22:16:09 +0000
Date: Fri, 13 Dec 2024 14:16:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 03/29] mm/migrate: Trylock device page in do_swap_page
Message-ID: <Z1yyUyJViOIkRYTz@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-4-matthew.brost@intel.com>
 <874j3rexik.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874j3rexik.fsf@nvdebian.thelocal>
X-ClientProxiedBy: BYAPR08CA0027.namprd08.prod.outlook.com
 (2603:10b6:a03:100::40) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 250d131e-96ad-4c1c-95da-08dd1bc3bee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GfOL4xoP5dCozACRWwo/yT3BriNDMEfQCjOnstEXqFKR4w2wDR6mKiePft?=
 =?iso-8859-1?Q?Au14u7LniCZz8rzSRYl0Z2GRtAVkmEvlcSD1ic0y/bZpqpuWzst7iTAz44?=
 =?iso-8859-1?Q?9Tp9cklwQh3NpSfDASPrVnRM70+rGpROtDj+cKURhZAXw4AS0LCMdqapkU?=
 =?iso-8859-1?Q?ptNC3HXExcAiCu7lqApb53VCC35XZe1LGVGWTUz8piwN6sym97XRAEcXiQ?=
 =?iso-8859-1?Q?y6OodxkHrG1rsaY/odmCU71seTdzpAbLtGj8zt/x2N+KFKQIlv2Bk2EUdp?=
 =?iso-8859-1?Q?AHpJa6n2ajJ0Q4cf9Ob7MH6HzqFi3ippOmIL4MYeX6Z0t+3Hsegcq46JcN?=
 =?iso-8859-1?Q?zgQMfA2fUgj7C/jMmDNEIKOOCR7Ccxeky7f2AxhP2aE7l0WI0JMAU/qdfe?=
 =?iso-8859-1?Q?dGe5Ql8zp+Ou4sqqlOuYw0tNZUXOJ2GT70UdcQLjIJxbxVa4hm15d1KwRl?=
 =?iso-8859-1?Q?FdDAsdJ213yI1mNid58iDRMAM4M3LXkkP/0MQ3OageJ6z25XWS249IzGwQ?=
 =?iso-8859-1?Q?xDUQBvS88IpOuzTQwqy80zvPQ2N9wbOuRVP4N4P6yHyUfGpaYmi/152UcS?=
 =?iso-8859-1?Q?f7q7kcYsk0zxk6TbmmnuNFF9GwzsGtEdpM9XfTxHQ2LDSkUI9T72v3aurC?=
 =?iso-8859-1?Q?f0kv9Ko9vfNzaV1RKsp/aPqNuYUCwskajhKJUj5E44g7laxi0JA++5pGA9?=
 =?iso-8859-1?Q?kzasL+DXQySp7rcEEJcpH7IxNJTCkvfNv3qbf5wAExCxUv39NNVMq0SQ+w?=
 =?iso-8859-1?Q?MCKb5v2emyFG+fDNjivXJeROX2JjFxAFL4Uox7rvrfeB20biuA5WpaUimJ?=
 =?iso-8859-1?Q?PLJA6UxlaUwO+upkrnca80eR7D0L3mF2oOlE1XAma8F6lX6JGJM3qnpjQ6?=
 =?iso-8859-1?Q?yLaOazHl6NM9QpzfgQIgZifg8AVfuFQyiY25XFXxlcbEFsILkO4ITtu0oM?=
 =?iso-8859-1?Q?ssvEQ/n/ppe9Uj8EwugBwCPNBiBRfdwzLs0297nme0HYHpJjbu4bfofiEM?=
 =?iso-8859-1?Q?HVoCWHswmp73CsiBKpygRqrl3PhY52HmjEQGXzM0IrzjzstB4To/yerbft?=
 =?iso-8859-1?Q?Gr7nnlzokuWtIli/iGr3rs4h3nI0Nc0WOpWw4t4m3CezCrjR80bTBLEbZD?=
 =?iso-8859-1?Q?RAx6+b/XWsiuNwBRdYZqV9/2QTBGB0YXyEfLgAUPaDC4nz0JhTXZUUu7pD?=
 =?iso-8859-1?Q?r4B5G36Q6vrypQzFBLqq5EDpIOXLkXa1hGxUaul/MypNGjLp28s89O7aeH?=
 =?iso-8859-1?Q?keVPECEGK8a/2AkwcWhz8nsbnG5JED4vs1ROwJdd/kZeF5AIkxK8zmCSNn?=
 =?iso-8859-1?Q?ug1t02Q0idTpqK81o8fsuZi9i8XL07rtBn1HOoV6MrTHIRIqO06GLRHq5O?=
 =?iso-8859-1?Q?BFKS3kLN41bS4TFYhb4RHAKME3i3oflQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0N4Fu+WTNTB4V0ZivYgPK8cHTpfbRi3GnykCRnfF+KQnnEWVx8J3vYmutB?=
 =?iso-8859-1?Q?zzzAHI+H9UFA0+9a4uCey9cbJr5QAj93DlWqQe+IGtZiU0uiVrAM3eXm8T?=
 =?iso-8859-1?Q?DvG63NEgkr/BNeLILI62zwq/8wK//yqT0xU7LKT33Qgqe5CW/s6/q1QUkz?=
 =?iso-8859-1?Q?qb9b0ngVuvqB7nkWRTm1H1XXXle/70PPW56Sd+i0mFisdHI8fJArg4E+zj?=
 =?iso-8859-1?Q?bcJEcIhuBV+niNOTNa8zO2pM9ISvTMVLpb4yZvokdCaetbDO+Foqvb9SBO?=
 =?iso-8859-1?Q?Az3Ze80+d19+dvpLiKe3A6rl5k3tlWgrxunmhSpYaW50abmWeEWB34hc+6?=
 =?iso-8859-1?Q?A8FK+WaU3nsrpUVEmMXnUiH8KSS5628RPb+D/JNOoFDVQ0fuZemnUh00Ws?=
 =?iso-8859-1?Q?QELYa4Cxx8BL0DevKZOB13p/qwMsvNZFiF7oBy9TfpsI6uD3HU64s9bEEc?=
 =?iso-8859-1?Q?EyLwQAKo/YVUL4afgYlBPkn+K1XLCdRr/ihluLcR0OHljCHMJX6x0O8WBM?=
 =?iso-8859-1?Q?RUISWrPcCxVCid0KMIlCaPShkE16uwUIerQzC080x8EvMISE8EqvYCW3yF?=
 =?iso-8859-1?Q?g8eGxFAU3mUbMh9lZ+haAwI71KItltp8LcZwvus9/dhzjQikMEC76YZAro?=
 =?iso-8859-1?Q?P/5Ucczasl6b6ZroBK0FBQESII0GM3Gey7+hUsEKQSRLgMAb34Ev6fxV/e?=
 =?iso-8859-1?Q?fFNz/MvVa956cygGVBPjxbAmyj1ZQgFeO00H+yqa2kUhQP/54KkUl1sFQQ?=
 =?iso-8859-1?Q?/L8y85CrRagb0LjKoCcK5bkxQAHewGXzYy3SbaDZN3yeRZKNaQ2k/fCsOG?=
 =?iso-8859-1?Q?/LM3wkpAuUpLwEGj02lz/ioxVopMAqOoE8K4s+4yYgukhVPujhyqY1TBrm?=
 =?iso-8859-1?Q?wwhdHFqUKjJDVtAffn1nhdvbFeO6GkZ1VfYor07a7kpZXvDje5jw+Kbg1+?=
 =?iso-8859-1?Q?meDdDJUv0g6UUjAKuPzwUsJubYIuTmU0oxxIRjGjOJeHD8EyegHiQjo0nR?=
 =?iso-8859-1?Q?sFGQVDl0/zCtSf7cSnDSIsvykwP+0yHNr+Q3wvsGTZmOT/EMtcrUC7gmtk?=
 =?iso-8859-1?Q?VKejlarR8JQmMZtth3SYXLz+nNt+WMulf2p9O5Zyo8ZCv7pYGwMF8KggPx?=
 =?iso-8859-1?Q?wnHfkewVX5QlHgEPtCUKBSS0dwUZOK4wRz3FXyNyfWTIMqDUhZpi5s08O/?=
 =?iso-8859-1?Q?mh1z/+d2ZszobnGOmkmKkQ9NciLmTINepyfiGWigiKDd1pIEI5CzvqrwQi?=
 =?iso-8859-1?Q?5GDYMvxesdIk7Mn/9OGfaeHShdAyl+kxLd2rotR+1S9TWylq7b4UNTT/Dk?=
 =?iso-8859-1?Q?lehDJ/i905GD6hD8k4Om8GZ8/SpPc666jVaVSN1GyEXyzinDv3CzY+Xcq7?=
 =?iso-8859-1?Q?5ly5/f6lvHuTSYJUHXB7pjRzZmndz6TUWWPQmwrNS23jfy5ld5quNi2l2W?=
 =?iso-8859-1?Q?Ur+ocbgkE+8gcpAzKSNoREYaLpLgzWoKPD5xWxLEch5lNGjHD3Wv6+Ynr9?=
 =?iso-8859-1?Q?exHUaEg/l9kizrJ9Ah41Z72qrOWz9D0qPNybydhbSFbfE0pKd0YLhu4cBV?=
 =?iso-8859-1?Q?GyT3xP3ylCeCrNcN+JUX/4C6JMJYHN1Lr9DHBf2Fmy/xTeQk3lTpR9NN08?=
 =?iso-8859-1?Q?wRo3L8KVrehZ7tzAdPzXYpQwIa/YeV6oK0xudOPh3X/dw+h8SbSAzt9g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 250d131e-96ad-4c1c-95da-08dd1bc3bee4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 22:16:09.3855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8egQktL5GrjljT0gQ8WHQjrtRwwQAsX/lCoIT/qEYWObE3jbsRJEViEs+g71/sOVvgYKE9Ru8YbmN3oVkPx3aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8211
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

On Fri, Nov 29, 2024 at 10:31:32AM +1100, Alistair Popple wrote:
> 
> Matthew Brost <matthew.brost@intel.com> writes:
> 
> > Avoid multiple CPU page faults to the same device page racing by trying
> > to lock the page in do_swap_page before taking an extra reference to the
> > page. This prevents scenarios where multiple CPU page faults each take
> > an extra reference to a device page, which could abort migration in
> > folio_migrate_mapping. With the device page being locked in
> > do_swap_page, the migrate_vma_* functions need to be updated to avoid
> > locking the fault_page argument.
> >
> > Prior to this change, a livelock scenario could occur in Xe's (Intel GPU
> > DRM driver) SVM implementation if enough threads faulted the same device
> > page.
> >
> > Cc: Philip Yang <Philip.Yang@amd.com>
> > Cc: Felix Kuehling <felix.kuehling@amd.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  mm/memory.c         | 13 ++++++---
> >  mm/migrate_device.c | 69 ++++++++++++++++++++++++++++++---------------
> >  2 files changed, 56 insertions(+), 26 deletions(-)
> >
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 2366578015ad..b72bde782611 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -4252,10 +4252,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> >  			 * Get a page reference while we know the page can't be
> >  			 * freed.
> >  			 */
> > -			get_page(vmf->page);
> > -			pte_unmap_unlock(vmf->pte, vmf->ptl);
> > -			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > -			put_page(vmf->page);
> > +			if (trylock_page(vmf->page)) {
> > +				get_page(vmf->page);
> > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > +				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > +				put_page(vmf->page);
> > +				unlock_page(vmf->page);
> 
> Isn't the order wrong here? In the common case put_page() will have just
> dropped the last reference on the page and freed it so the unlock_page()
> needs to happen first.
> 

Yes, this appears wrong. I haven't seen this show up as a problem but
certainly a put should be done after dropping the lock. 

> > +			} else {
> > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > +			}
> >  		} else if (is_hwpoison_entry(entry)) {
> >  			ret = VM_FAULT_HWPOISON;
> >  		} else if (is_pte_marker_entry(entry)) {
> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > index f163c2131022..2477d39f57be 100644
> > --- a/mm/migrate_device.c
> > +++ b/mm/migrate_device.c
> > @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  				   struct mm_walk *walk)
> >  {
> >  	struct migrate_vma *migrate = walk->private;
> > +	struct folio *fault_folio = migrate->fault_page ?
> > +		page_folio(migrate->fault_page) : NULL;
> >  	struct vm_area_struct *vma = walk->vma;
> >  	struct mm_struct *mm = vma->vm_mm;
> >  	unsigned long addr = start, unmapped = 0;
> > @@ -88,11 +90,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  
> >  			folio_get(folio);
> >  			spin_unlock(ptl);
> > -			if (unlikely(!folio_trylock(folio)))
> > +			if (unlikely(fault_folio != folio &&
> 
> We don't currently support large ZONE_DEVICE pages so we should never
> get here. I think a WARN_ON_ONCE(fault_folio == folio) and bail would be
> better.
> 

Sure will fix.

> > +				     !folio_trylock(folio)))
> >  				return migrate_vma_collect_skip(start, end,
> >  								walk);
> >  			ret = split_folio(folio);
> > -			folio_unlock(folio);
> > +			if (fault_folio != folio)
> > +				folio_unlock(folio);
> >  			folio_put(folio);
> >  			if (ret)
> >  				return migrate_vma_collect_skip(start, end,
> > @@ -192,7 +196,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  		 * optimisation to avoid walking the rmap later with
> >  		 * try_to_migrate().
> >  		 */
> > -		if (folio_trylock(folio)) {
> > +		if (fault_folio == folio || folio_trylock(folio)) {
> >  			bool anon_exclusive;
> >  			pte_t swp_pte;
> >  
> > @@ -204,7 +208,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  
> >  				if (folio_try_share_anon_rmap_pte(folio, page)) {
> >  					set_pte_at(mm, addr, ptep, pte);
> > -					folio_unlock(folio);
> > +					if (fault_folio != folio)
> > +						folio_unlock(folio);
> >  					folio_put(folio);
> >  					mpfn = 0;
> >  					goto next;
> > @@ -363,6 +368,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> >  					  unsigned long npages,
> >  					  struct page *fault_page)
> >  {
> > +	struct folio *fault_folio = fault_page ?
> > +		page_folio(fault_page) : NULL;
> >  	unsigned long i, restore = 0;
> >  	bool allow_drain = true;
> >  	unsigned long unmapped = 0;
> > @@ -427,7 +434,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> >  		remove_migration_ptes(folio, folio, 0);
> >  
> >  		src_pfns[i] = 0;
> > -		folio_unlock(folio);
> > +		if (fault_folio != folio)
> > +			folio_unlock(folio);
> >  		folio_put(folio);
> >  		restore--;
> >  	}
> > @@ -536,6 +544,8 @@ int migrate_vma_setup(struct migrate_vma *args)
> >  		return -EINVAL;
> >  	if (args->fault_page && !is_device_private_page(args->fault_page))
> >  		return -EINVAL;
> > +	if (args->fault_page && !PageLocked(args->fault_page))
> > +		return -EINVAL;
> >  
> >  	memset(args->src, 0, sizeof(*args->src) * nr_pages);
> >  	args->cpages = 0;
> > @@ -799,19 +809,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
> >  }
> >  EXPORT_SYMBOL(migrate_vma_pages);
> >  
> > -/*
> > - * migrate_device_finalize() - complete page migration
> > - * @src_pfns: src_pfns returned from migrate_device_range()
> > - * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > - * @npages: number of pages in the range
> > - *
> > - * Completes migration of the page by removing special migration entries.
> > - * Drivers must ensure copying of page data is complete and visible to the CPU
> > - * before calling this.
> > - */
> > -void migrate_device_finalize(unsigned long *src_pfns,
> > -			unsigned long *dst_pfns, unsigned long npages)
> > +static void __migrate_device_finalize(unsigned long *src_pfns,
> > +				      unsigned long *dst_pfns,
> > +				      unsigned long npages,
> > +				      struct page *fault_page)
> >  {
> > +	struct folio *fault_folio = fault_page ?
> > +		page_folio(fault_page) : NULL;
> >  	unsigned long i;
> >  
> >  	for (i = 0; i < npages; i++) {
> > @@ -824,7 +828,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >  
> >  		if (!page) {
> >  			if (dst) {
> > -				folio_unlock(dst);
> > +				if (fault_folio != dst)
> > +					folio_unlock(dst);
> 
> How could the destination page be the faulting page? I think we can drop
> this check.
> 

Yea, will drop.

> >  				folio_put(dst);
> >  			}
> >  			continue;
> > @@ -834,14 +839,16 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >  
> >  		if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE) || !dst) {
> >  			if (dst) {
> > -				folio_unlock(dst);
> > +				if (fault_folio != dst)
> > +					folio_unlock(dst);
> 
> Likewise.
> 

Same here.

> >  				folio_put(dst);
> >  			}
> >  			dst = src;
> >  		}
> >  
> >  		remove_migration_ptes(src, dst, 0);
> > -		folio_unlock(src);
> > +		if (fault_folio != src)
> > +			folio_unlock(src);
> >  
> >  		if (folio_is_zone_device(src))
> >  			folio_put(src);
> > @@ -849,7 +856,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >  			folio_putback_lru(src);
> >  
> >  		if (dst != src) {
> > -			folio_unlock(dst);
> > +			if (fault_folio != dst)
> > +				folio_unlock(dst);
> 
> This one also seems unnecessary.
>

Same here.

Thanks - Matt
 
>  - Alistair
> 
> >  			if (folio_is_zone_device(dst))
> >  				folio_put(dst);
> >  			else
> > @@ -857,6 +865,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >  		}
> >  	}
> >  }
> > +
> > +/*
> > + * migrate_device_finalize() - complete page migration
> > + * @src_pfns: src_pfns returned from migrate_device_range()
> > + * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > + * @npages: number of pages in the range
> > + *
> > + * Completes migration of the page by removing special migration entries.
> > + * Drivers must ensure copying of page data is complete and visible to the CPU
> > + * before calling this.
> > + */
> > +void migrate_device_finalize(unsigned long *src_pfns,
> > +			unsigned long *dst_pfns, unsigned long npages)
> > +{
> > +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
> > +}
> >  EXPORT_SYMBOL(migrate_device_finalize);
> >  
> >  /**
> > @@ -872,7 +896,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
> >   */
> >  void migrate_vma_finalize(struct migrate_vma *migrate)
> >  {
> > -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
> > +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
> > +				  migrate->fault_page);
> >  }
> >  EXPORT_SYMBOL(migrate_vma_finalize);
> 
