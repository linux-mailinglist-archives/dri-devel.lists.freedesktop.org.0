Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3288A978B73
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2024 00:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1545710E1C5;
	Fri, 13 Sep 2024 22:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gCOHd8Gs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40A110E1C5;
 Fri, 13 Sep 2024 22:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726267277; x=1757803277;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/aryfmVUqymBu3D+56OGQ8Rzy/wMfIglYOT2p/L7SjU=;
 b=gCOHd8Gs0veCNtYsjBPTJI1yUHSePKX/ln/6Tnc0QNQjx7dDiOrVwtp6
 /Iuo2HWSh1j0QShU33CoEeXhe+rESp2h2EaKVVhtyKCRJUPAtH4/CSIiC
 /596ze8TTAx/C2dxy8cODiR4RRrN+KDvujMmotDdfGyffas5OKXHH/Rfq
 Ucf++/7zRm4AP4bFmbW3trcBCVZKpCnuqKRvJMt4taF88TQX4+iqg2sM6
 jipjYGfvvp7ZUsIK0kSd2CLSytJPMTNYGDyf16TFMchgDsSRP5A+WmRvp
 voLAfIbI8YPmYJN1ceuBhPflnqH6uYCE6wgcZyFMSQeRPB5qKHXstxpwD Q==;
X-CSE-ConnectionGUID: Jn3DCB20S7ywNBPtzDSx8Q==
X-CSE-MsgGUID: hUczKQCbQ/OApJmqc1+zwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25120001"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="25120001"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 15:41:16 -0700
X-CSE-ConnectionGUID: kAv5SMIPQZ24BqO08JeDuQ==
X-CSE-MsgGUID: M5MW77S3QxCc+GtymQm4UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="72598916"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2024 15:41:16 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 15:41:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 15:41:15 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 15:41:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avuWWYrEz7jJiMKPZV0mPwC6ggWadAqL3PebkSzVEg50rRwfqkh/JpUQkznpJrgcWfzWAFwsU6ICk2eltdEG/kHS6nBSDJdE/RRyqZ/57EfLRXINKx+BUIxpd+68IS1riFMMl/uONCwvBFQRLg4eXmnm70t1f/HJHLCcyo6Aslv1LppxYU3oZ3FI9vRUzDCKkZ69D7t6sMHj4FxWkqxv6uHHv7NHnr2LGpw1+1k1TRe2MFkuWNesSOoZa4i2QnCG5nwQrzcJaWmmpU/+Y7ySQCoid/Jy1Oahcr5S0sHGS4MpzwyqVoSdwl8zile+lyxo51n3n4pIDznvwyoobbbV4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOGhzR6JodouPT1rSo2ilh7aEjwsoG/UOyZ+8CgKfxw=;
 b=m9Q97n9hlXEprwrsoDv7AC2GjBUDqvI9Ut/R8Q6jtdb2wlwTXRiHOybrg7qtogLVNfgHCPNm7ZF10Iorldy/urRXoZZ1zv+J80hs1UuuqtrgsWHui8Y4L62Tn0AHjIJeAKsv0WvssDWgLtzZZofjGGBVAhqziCmX61Yhbf3/FT8hemvcL+Gi4WyVI9NbeD6kngz53c1RKw2mb9h1Ld5vpINQZHssyXTXI9//z1vA0wNjzKVezx4XWUcmNjDofbKXVNN92upnq6catb0I1OQWP8vDayqdYdifGP0uGRInooKbIPXXqu+n60ChuEN/nzVWXW7VdwRiHs3r01YhRr1P+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6567.namprd11.prod.outlook.com (2603:10b6:806:252::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Fri, 13 Sep
 2024 22:41:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 22:41:05 +0000
Date: Fri, 13 Sep 2024 22:39:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <simona.vetter@ffwll.ch>, <Philip.Yang@amd.com>, <akpm@linux-foundation.org>, 
 <felix.kuehling@amd.com>, <christian.koenig@amd.com>
Subject: Re: [PATCH 1/1] mm/migrate: Trylock device page in do_swap_page
Message-ID: <ZuS/NH/P8Fl+qptx@DUT025-TGLU.fm.intel.com>
References: <20240911030337.870160-1-matthew.brost@intel.com>
 <20240911030337.870160-2-matthew.brost@intel.com>
 <87mskehjtc.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mskehjtc.fsf@nvdebian.thelocal>
X-ClientProxiedBy: SJ0PR03CA0032.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df66325-96d2-42bb-f065-08dcd4452715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?EJb4bs/O8W1O3pGdg4GHp4r95dAQb+x+tg5Ig7VYEnbpOkc1GVfe+/bwK+?=
 =?iso-8859-1?Q?sHl7VbXqCMZ5F5H+ppoWds5NFBf2mrDsCyQo9JsjrI2JsI65NNt3M3JjhJ?=
 =?iso-8859-1?Q?oVXe/cZvyidH6a8FCikTjcFttNIC6KEarOdZ9DMO2dEGWrHGi4d48xek4+?=
 =?iso-8859-1?Q?x0v8e7hIi+ZLxb/3sYhVZNtA5E+j+7i8hHrjXrx2tYCIsDRRrnJPjL3KG6?=
 =?iso-8859-1?Q?0SiZXr5GQwlJ3Jfkm/lHOTXYHzCAJ6o4QBUYPK5ps+56zDcm9Q0/nh1OGU?=
 =?iso-8859-1?Q?c4hSRFKOyl20SOWE1dQqelQN6gLIzBGc0cKZPDp+M1a4qIIyrZ0eCDiR6q?=
 =?iso-8859-1?Q?eo+e0PKgvuWofeVf7j2uuzGWx5yQqi+zb9V3sfQeV06AdOyG95PErNZmu1?=
 =?iso-8859-1?Q?uGD6deMGE+YauGiXrWoEft3532aRXo9Hs/cCy12db3+48CNeXitJ+E5aAl?=
 =?iso-8859-1?Q?mhZ7WTvBlsfBEJf18agsV8wAwWTmImKldq8PHxiLQdSoTdYedYRXu7/llA?=
 =?iso-8859-1?Q?04onQS7rr8VzYU+oSG6QjcgHN3x7drG7sTGuQs4psDn39BwhZLYmXm/3kF?=
 =?iso-8859-1?Q?OXk28dWpnVJhJlT6uAC4o0uwms8pwXWFkoANCcYJdVVU9N6RAYc8hSZmVA?=
 =?iso-8859-1?Q?UJWszjBD+aTCdxTsi5iMycocFX0c7hYL7CSDUNw+U/WQrxDZLcNAHI9SzE?=
 =?iso-8859-1?Q?nVvhZDFvCdh1SxQfTQGSq3H69R/9un9mAlZdE6t9ZbpZ8eSH90U05wCvYJ?=
 =?iso-8859-1?Q?2vBZhXuvu7cqH7ktAyf3fXMuJE1Suf+7hLxUd8EoJyIGN3TlS4e/B2lxoE?=
 =?iso-8859-1?Q?jP8wgNcTmoU9itezFFj/TI9IcUrH/wvXqYq5zsAGSMPN14uIE9hYlEt1Qc?=
 =?iso-8859-1?Q?DBjVuEH2d52FHLKi+PLcBogHF5KZ7ml5h3bkOqU2xsdjbRXlZkGTlz+6B5?=
 =?iso-8859-1?Q?01TT5CYOD9yctn5uzjyJo1BZZk94axZ5EPWFyV0OT3RQhIzm4b0lRcwfRM?=
 =?iso-8859-1?Q?YjnF+wSzxXdYNKsJMYPvcUvR678pe2fAdjbLfBsDZb52kz+cgRQyxQuj9Y?=
 =?iso-8859-1?Q?7t6IHYIzby7XVNMT9yY6H95HoQByfm7EU8MFezo/nMtGYlgEAr/imvUGYI?=
 =?iso-8859-1?Q?4g3VhNkNRwwpEQi0H43ipP3TWGqK0I59j1q4fYWMWer91gJNPXIFYKnkQd?=
 =?iso-8859-1?Q?G+aoaCQyjX5tOr/0g+JvQ+DrepFrzFklI3Drssy23c8Rdo1l673TT1KqKp?=
 =?iso-8859-1?Q?8ORg5D/nbkyFdofnOHEUrIwaU61IDuXVXuZe8hfZIy+BNDVdgVNc1fdAc2?=
 =?iso-8859-1?Q?9VaLGxpayguCsLMZesnmz+ZwFm/p1AhX2//sj2p8x4w6t4UamrYOSZRcWv?=
 =?iso-8859-1?Q?Wuu0nvxd4UOb2ohX+2fBH9paUr3BCuKf/Oy+emkSc0DbGtTz6CrQU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TKBuIs3xIkOm8tsVL3foUwRW+S9pckOMow/VfVT6MQrF4AtxcKll5L2LwY?=
 =?iso-8859-1?Q?AiMe6/S/wVjMsCpIjLSAPTaRWIEshSy7G0qLo4fSyRXzxHb/6Z7MtUv+Qt?=
 =?iso-8859-1?Q?FGYBZjGOBEi8SBCS1YVy+f6g1IBrPh0Fj2uQk+8xu2TsOiLOCcOn6SYOWn?=
 =?iso-8859-1?Q?1eYbqK1fgVKFPFQPQrR51NZ+PwRXa76lwDvX5a4o8tI2RFlDXclkBSOD0n?=
 =?iso-8859-1?Q?dqd9HQuhstiiZGFsoEYdjAYhkHX50Wh9l7tmA5UiEMrR7v8whfdP3/ITbE?=
 =?iso-8859-1?Q?djQ934u8gBBF7hqhPA9ja564AcRlmkLtqzSjJwWe11zsJx2NIenU3qxbja?=
 =?iso-8859-1?Q?XwtrGUbMnT9DOhjKW8hJacxViDE6FaGO9tk/tsYOhDzWOn1JJ8f8hyclUC?=
 =?iso-8859-1?Q?ahd/YrABeSWIiUR4NrHN3LhdN4mUtIS+LlCQ4tqxAW7NsEa1P6srCPW0ms?=
 =?iso-8859-1?Q?e2AiJLbDpmnyiCpb6HWat81+OsWAnK1iX474pXqQb83UQeyIfFUyWs+kwo?=
 =?iso-8859-1?Q?o7IK01ae8wCStDBkVIptM4ibH/Tg9IQntVIFCamLeZiu+W6RQJftpAjx2m?=
 =?iso-8859-1?Q?NixSON94J/T6Bd/F0oJurpoLke9jtpjccIH89tOqXYFHFxEmTuZjdVTQi2?=
 =?iso-8859-1?Q?D17ilHpgjmVAHTwKuS7OCdRlsDBlSB8+ZZV/aOC29Hh4LlhXAW4T9kzC3w?=
 =?iso-8859-1?Q?Kz6fZwPu+BlStUXNbJpO9kOjEsnP0hktTbnPy7wEBAg0+HPSxmcRNyDWC1?=
 =?iso-8859-1?Q?qv0IP8jEOKndwOqaEt4/ou6HLmSNRL3+XOVBusd6+Lah4gFouGsWM5Nv6q?=
 =?iso-8859-1?Q?2kpN4B585XPgiBfZsjZlDvIKUGrvnkM+FWmHWW92zV8tnsEAsiv4lUpjZk?=
 =?iso-8859-1?Q?Hg6npmdq0XO9jukb9mZSEBDlBH9o8pK9xceMrM5ZsnKnmPcyjVzXq05b08?=
 =?iso-8859-1?Q?G4ysatpZ4wnmg4VIz30cDq9rlnE9NxYjRcP/ewuXru41ezZy2vCy6Ig1TX?=
 =?iso-8859-1?Q?0a7F6+iFQo1VgpwGMxc9KrSRpzUyer2xQm6iJX51N6sYMwH/wo+WYrpDYg?=
 =?iso-8859-1?Q?wuPRKa2H0rhd8im70AZZHfc/SinYzvF38T1uhdL7tq+XYhPlqa2116I5GI?=
 =?iso-8859-1?Q?MLyNRAnLTwNuKHscSKAke3d/B6paIpq2pe7xikt7RG/3fd2tLwP65oJzM4?=
 =?iso-8859-1?Q?fWWldCD+n54NjtuCfrC0pr/1qyAl/g96ThYAG3p972BM5k2Gu17n6ds9Mo?=
 =?iso-8859-1?Q?RT2eRrRXwBlcQiiMmVScpB3TYDPZqAjvPMZsfmWL5XLnyD2qQoaLPvnG6C?=
 =?iso-8859-1?Q?noZpfEilTNHp7puzIXAWicG2VjzKOj2qzwkVOfWxcdGqfashPrzDvUWFKB?=
 =?iso-8859-1?Q?E+OeyFSWd1YVHh/uUJ9ky6ruXcb779eOJJ1cCxqCfRSTht3YJnsMWeQFo8?=
 =?iso-8859-1?Q?HZ7iwfqZLe2CNZnpEa+dZIZo1l28rAAIiOhK7taFBUsEkow3nLwYCBTx3A?=
 =?iso-8859-1?Q?2z3Q++sTS75pbrNyzPc4u7sL/FfUHpuqRTU/a4dFIPGGM8NlJaoM6urfu1?=
 =?iso-8859-1?Q?LX6x9NlFqKRsLeARJxp0VbKBBi4v39gd7O3+Kf31TzVYERWTgUyZ65vfRG?=
 =?iso-8859-1?Q?1EZpbn3u+3QuWc6UVFAUHdJnRhDnl/3Oe+wptdgImCY/0NIYQq1Duayw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df66325-96d2-42bb-f065-08dcd4452715
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 22:41:05.5247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ogynpyb8zKgnA3z5ZdioQwvK3oPNZ+46hZSeXvwkkLaVXrgJBSy4Xx/Mqql+i93SInxx2L2FzVRVNGRVDYdsUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6567
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

On Wed, Sep 11, 2024 at 02:53:31PM +1000, Alistair Popple wrote:
> 
> Matthew Brost <matthew.brost@intel.com> writes:
> 
> > Avoid multiple CPU page faults to the same device page racing by locking
> > the page in do_swap_page before taking an additional reference to the
> > page. This prevents scenarios where multiple CPU page faults each take
> > an extra reference to a device page, which could abort migration in
> > folio_migrate_mapping. With the device page locked in do_swap_page, the
> > migrate_vma_* functions need to be updated to avoid locking the
> > fault_page argument.
> 
> I added the get_page() and therefore the fault_page argument to deal
> with another lifetime issue. Neither Felix nor I particularly liked the
> solution though (see
> https://lore.kernel.org/all/cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com/T/#m715589d57716448386ff9af41da27a952d94615a)
> and this seems to make it even uglier, so I have suggested an
> alternative solution below.
> 

Thanks for the ref, will read this through.

> > Prior to this change, a livelock scenario could occur in Xe's (Intel GPU
> > DRM driver) SVM implementation if enough threads faulted the same device
> > page.
> 
> I haven't seen the same in the NVIDIA UVM driver (out-of-tree, I know)

Still a driver.

> but theoretically it seems like it should be possible. However we
> serialize migrations of the same virtual address range to avoid these
> kind of issues as they can happen the other way too (ie. multiple
> threads trying to migrate to GPU).
> 
> So I suspect what happens in UVM is that one thread wins and installs
> the migration entry while the others fail to get the driver migration
> lock and bail out sufficiently early in the fault path to avoid the
> live-lock.
> 

I had to try hard to show this, doubt an actual user could trigger this.

I wrote a test which kicked 8 threads, each thread did a pthread join,
and then tried to read the same page. This repeats in loop for like 512
pages or something. I needed an exclusive lock in migrate_to_ram vfunc
for it to livelock. Without an exclusive lock I think on average I saw
about 32k retries (i.e. migrate_to_ram calls on the same page) before a
thread won this race.

From reading UVM, pretty sure if you tried hard enough you could trigger
a livelock given it appears you take excluvise locks in migrate_to_ram.

> > Cc: Philip Yang <Philip.Yang@amd.com>
> > Cc: Felix Kuehling <felix.kuehling@amd.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  mm/memory.c         | 13 +++++++---
> >  mm/migrate_device.c | 60 +++++++++++++++++++++++++++++++--------------
> >  2 files changed, 50 insertions(+), 23 deletions(-)
> >
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 3c01d68065be..bbd97d16a96a 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -4046,10 +4046,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
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
> 
> This is all beginning to look a lot like migrate_vma_collect_pmd(). So
> rather than do this and then have to pass all this context
> (ie. fault_page) down to the migrate_vma_* functions could we instead
> just do what migrate_vma_collect_pmd() does here? Ie. we already have
> the PTL and the page lock so there's no reason we couldn't just setup
> the migration entry prior to calling migrate_to_ram().
> 
> Obviously calling migrate_vma_setup() would show the page as not
> migrating, but drivers could easily just fill in the src_pfn info after
> calling migrate_vma_setup().
> 
> This would eliminate the whole fault_page ugliness.
>

This seems like it would work and agree it likely be cleaner. Let me
play around with this and see what I come up with. Multi-tasking a bit
so expect a bit of delay here.

Thanks for the input,
Matt

> > +				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > +				put_page(vmf->page);
> > +				unlock_page(vmf->page);
> > +			} else {
> > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > +			}
> >  		} else if (is_hwpoison_entry(entry)) {
> >  			ret = VM_FAULT_HWPOISON;
> >  		} else if (is_pte_marker_entry(entry)) {
> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > index 6d66dc1c6ffa..049893a5a179 100644
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
> >  		remove_migration_ptes(folio, folio, false);
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
> > @@ -838,7 +842,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> >  		src = page_folio(page);
> >  		dst = page_folio(newpage);
> >  		remove_migration_ptes(src, dst, false);
> > -		folio_unlock(src);
> > +		if (fault_folio != src)
> > +			folio_unlock(src);
> >  
> >  		if (is_zone_device_page(page))
> >  			put_page(page);
> > @@ -854,6 +859,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
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
> > @@ -869,7 +890,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
> >   */
> >  void migrate_vma_finalize(struct migrate_vma *migrate)
> >  {
> > -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
> > +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
> > +				  migrate->fault_page);
> >  }
> >  EXPORT_SYMBOL(migrate_vma_finalize);
> 
