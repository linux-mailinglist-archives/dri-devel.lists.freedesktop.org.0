Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF32A6AE91
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 20:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B840310E6BB;
	Thu, 20 Mar 2025 19:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iyKfsBCf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB9A10E6B9;
 Thu, 20 Mar 2025 19:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742499137; x=1774035137;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IE5o86B9d9q7xREs3Kv86C2+tYZdZJO5hf9xEXzDP6c=;
 b=iyKfsBCfzirqxMXoMsN00dEUQfoF+JY2gIlZVdgkvsmcIuGWg4yuk88l
 HMF8i0+8/tr/JNFU1d9/pv3IVmmoSM4Dcz1zkCRubd4B9arODu0wWXt8C
 HXjvcv7otL9ap77oulEJgF5dRucakP/s37cwmZ2dPa+SUUEsjcHFXBqob
 akFxT+8zKr/TGFJpfuQh+DRrv4WFXGHTiXlKjh6aLrtuJ0IWR+wFzeIwD
 FJdVWF392hfEhqOOMyAC+Wm6eLp+zT/LA4M7ac5gwdkrpAFWzstm6abDw
 WdrAq6U9O5OoUdW9ZH4H/b4hzoLf5kJptXmm+2pHvM7zt9qeDwFiaJ9PX g==;
X-CSE-ConnectionGUID: o2fpd/JWRgS0hHDuGry/lQ==
X-CSE-MsgGUID: GyxmZK4tTn6a8n3FC2Qo0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43679247"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43679247"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 12:32:17 -0700
X-CSE-ConnectionGUID: GhrvdFQZQ9+nCPOj5CbRXg==
X-CSE-MsgGUID: cjb4y1ZlSlas6zW5VmCMng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="128259242"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2025 12:32:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Mar 2025 12:32:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 12:32:14 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 12:32:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRqZvvbGfvbnTb39P72E1ltiIvI+XCFLTPrDxL2p3T0k78aXzmhtgfxdSsUXEI23sTwkvWi6LdShSjQs1N94K1huJRc4v8H0pY+Pykhav8tm8FYlXpLVjuX76nyNcyxBsXT8jiSsRpDUhuxnlS3urYYLLrh4QWV6mzK5IX3Mbmy4wlKkXMLwSlIG1IWECr1cxm963CskOstln4C7NmG4lAZb/oyXpR363Z/WkOMPxk0tM7bF/0f7OgQ2F7eUTH4aUxKa9Yw9/MaTo9nWgMBfVAlx5Lp3m89CH0aBYmHV6jyp7oe7Crgufd36JYDWbg2+76A647Yt2NmnSm6rKTgClQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiEX15qMlkTDEmh4XlEenYBpKVblp76ssfrRgKf8k8o=;
 b=k+tuSBisevUIRO5TtDHQLdYrcmkPaHrTA6l6goLkYzFr3iQUQwAEvHwAVc6sfGXVAm0aGuj94nl1twNwRzZ6YDDHfffcVFfcBOwjNnA1QbnxnitPfTod59716dvAz3DFMuIGxnr/98sVgM4htuLfTJFcIVzwNJtu32pKGcuhieLwiQnxqSkUdsuC0wnF1ngfVRgEG8kGBmGBFS33FoNoZdMul1/5ogJMan+YhVh1JDvMNtG9CG1bZ5WV9b96k58eEw0opZBC1eVdZEqaobDynCNvC4K1uk+Szl4B8JLK042kgOMVnXOKUSp/Oje1hju+OOm25ouqUXuu07srRwXDng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH0PR11MB8190.namprd11.prod.outlook.com (2603:10b6:610:188::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Thu, 20 Mar
 2025 19:32:12 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 19:32:11 +0000
Date: Thu, 20 Mar 2025 12:33:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/7] drm/gpusvm: mark pages as dirty
Message-ID: <Z9xtgs/2etNDxStw@lstrano-desk.jf.intel.com>
References: <20250320172956.168358-9-matthew.auld@intel.com>
 <20250320172956.168358-12-matthew.auld@intel.com>
 <df6221a54416141166f98a6eebc495c472bacfe9.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df6221a54416141166f98a6eebc495c472bacfe9.camel@linux.intel.com>
X-ClientProxiedBy: MW4P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::9) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH0PR11MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8e6725-36ed-4a80-c227-08dd67e5e942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?lpBcQpm0qU6ocS8YJCPyvEDutTtmhVxxBvP23v8uuncgKH8pqzrJmYNFG3?=
 =?iso-8859-1?Q?kf3KdtOXF6iEv86Z6EuqZLXPFo9Jr45UAo5Grm7UkXUVBSt31jkCODc4zq?=
 =?iso-8859-1?Q?yF4A3Mg7CRgMXZ+8tNTjvGLkvqTpq+Cp5yv2iyD9jRADhH97uBBP2RABP/?=
 =?iso-8859-1?Q?Yx8/TEFQy+vQkMuZGccF9JQi50GjT6Ulsp7yXWNXeXe1Fm7gzqPQ3u7yOI?=
 =?iso-8859-1?Q?te4uUWE2ZpVgedo/kfUF3jR3b7lrO7881gpgXXRpmjA4UtuIJHUGkcxfBh?=
 =?iso-8859-1?Q?8R6XhzdJNfoOD7LvPJ2GlZoDxX3oWfJLJPH9+CeeI0Nrny6EYt1OYrDuOC?=
 =?iso-8859-1?Q?kxs2UQRsOSoWW9gvRDYmsmSRAX/gR2yhm0NVyXOwECHmdeMemfPRIcKblu?=
 =?iso-8859-1?Q?f+nuj50FnFcBuNzY+kH3gLxG4xGv1FSEh3cci5s20eTtnp7Mu+I2Mo6gnU?=
 =?iso-8859-1?Q?mlhwZHyvxftV/E2dpWtetzbNwM/26XXiDA1yAZmB+MGCgoQFZ5t5+wR5Hj?=
 =?iso-8859-1?Q?h23YU/ktg9Pg+o8gNy0v+cK3ZrBPBsE3i5M46flUxq/cFCCXrVgVWIlpEn?=
 =?iso-8859-1?Q?yTS2YW8LvdukLajNRx261OBPa2krhnwrMmSsXRjn6TCfmtUSdnLYxflBj2?=
 =?iso-8859-1?Q?95aebWF0Z7hJDApc4Tjc6jRvVbBy+w8L8WflUn0gUpxvyu0YZDzMav8lTY?=
 =?iso-8859-1?Q?VVZdOVjdVgz2+wxuQvDbDbLImxAJED7yGfoTHnY4SXZqzL5Fd3626gU2Yo?=
 =?iso-8859-1?Q?eZk9g8OoINKBxx1RagrLqbXfpsImW+iDVJrvuWgIJh0w96V9821oFBu6bX?=
 =?iso-8859-1?Q?+vOUj9az1hj0GiFq6Et9gbPX4Lck/zV+sOAfcjx0W+H7UIb9GPhRc1Nz2Y?=
 =?iso-8859-1?Q?d5PjGoPUx4lK+EJVXnk1yeseRZni2rDgdjM23xejiuzOIiP0eu3DRvJKTt?=
 =?iso-8859-1?Q?yR4hTeW45ufZK63NNLE//zANn1ysaAFqVrmz3qYateIn7j4KU8LP79Tzmj?=
 =?iso-8859-1?Q?JCfUThpQd+PMP2dXmR2OoRdXuw9bSAktmqtK1JJZuDf9UvVa4C2/7W/m1v?=
 =?iso-8859-1?Q?jtGq+QWvLteTdpx10ZELFVpu5DhjMxQIoKOMbBPXxx5KGHtFi3SIvJfC+1?=
 =?iso-8859-1?Q?syw5hymp5u3G59g0kwaHoUSwsd7FpaJOm9A1WdWdId6JbSKHLnelhjSL8Z?=
 =?iso-8859-1?Q?ap2zuJ+BYIs78BaydKLQuOvII5V1KnxzBmHKesFXlm/fS2CdSFVV5XUl1e?=
 =?iso-8859-1?Q?RYV+biKEcvNwZGjnsJdAIJ4H1LQZJopwdIoOUmI1kyeKxvi58kTHo4z64B?=
 =?iso-8859-1?Q?VmcyB3HZ2vKGOhpkX5pWXBUhex8d9H/M6QJlsyxZauDcxzwx4aNmS/OWwH?=
 =?iso-8859-1?Q?4o7R9ucu8YkMAYG+LnjQMwm8fOg04/QuNt/Jz7Roo3tl0FxFz3C3rQgkka?=
 =?iso-8859-1?Q?LoleEz6U/EZOWEpa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?t7VQOoajQ0oX6MaWJJceBnD9QbCODNLiwg9WveGzFpXrmX2dJNWTgRJWBD?=
 =?iso-8859-1?Q?JKBiJ9jsi/ziVQB2ZV8qxhP4AOGJUTnpzV+REIJuRlpg9/VCsPy9ZzKK9a?=
 =?iso-8859-1?Q?8hrYCT3H07w+Ked/nbIAFJXfc7QpE6z4DBwjD/CRXihaQeljZEZjLAKCWS?=
 =?iso-8859-1?Q?XwcCx9949arWzcSbP21RImHFak6vaelwCvdfYVWChh3F9DOTXWT0Wggq9B?=
 =?iso-8859-1?Q?+ZBLDf0WXoZQBSl0MwVRLWPibr+0Le2/t3gvZ6JkLxiXqL3vGhfui6GWQi?=
 =?iso-8859-1?Q?AIjf8nA8qLiI4O6Rk/hJVXw4m3iO5YX2EqIliGTD976AMvj5qDjoWrRDCm?=
 =?iso-8859-1?Q?K2ii06/KWhKq5sev9RM4MPBzOm7pcDSLjz49K9UIb2cZE35nB/ZovSCUi3?=
 =?iso-8859-1?Q?ayQ7ftRTZKLoM4cbX1V/SPSIaqCeUu2hhyWy4Rcrc1cpMjTd3y+fIXO6mN?=
 =?iso-8859-1?Q?Td6X2f5ieQWsy3mWmF3weytsG8V6PDSxnL8kslzY4dmxiNw2IIMvN0WJCN?=
 =?iso-8859-1?Q?5tONOxlcNMWGr9gbMwBSOEJsHqUAeIVTk6j/+syXEglcpfW2xweOofieeS?=
 =?iso-8859-1?Q?N/ApbzU64HFZ92NeLsvlPXXcU1IHoMNdUWL+4FGh3k7boShCmli6soZVqy?=
 =?iso-8859-1?Q?J6nlSok9SA8pY6hWslHvMtGoLqHVYupLj8IaCYBLkOZm94oKSQnR1ubXax?=
 =?iso-8859-1?Q?RaQRPdKZKSD1r0NuSFaD32+dqq0WHJPUHGjsAz7jnEYrDoIHKgQDnaFddD?=
 =?iso-8859-1?Q?+drewYs5Oi79DbB+SV+ukIIy2RjG6SEIrh32fuB4vbdTHMjfKZzFDy5kim?=
 =?iso-8859-1?Q?IK7Irbc/hI1Yhs5ky4c6RwvnO6Z5A0eE5/Fe3aD18kjOEt4ZW9jIB2Q30b?=
 =?iso-8859-1?Q?Jah/bASLN7aXO3BM5L3bkhT7QrOBd/VBCe/10ItKRR2a4c5Bd/B5spCpyc?=
 =?iso-8859-1?Q?XGO60uIAGkA4l3jo3yHFv4SJc7uybpaaaB94ZEIyqYm87/vIaqmBUMpgVE?=
 =?iso-8859-1?Q?AXpDcNO5qgER2tI5RxVV9tOy7TEfvOYWvqQiGVMlGtyvcl05+y7LriL3Vo?=
 =?iso-8859-1?Q?OU0bea/14bmMFSd9XVG5TyXglxJD5sjV3ovgk/HQh8hvLp3pjqrI2Tpb+c?=
 =?iso-8859-1?Q?CeoS10uXEYFaykENL0tuDCaN5gbiJp7bO2HiNIM1g8PS2wzR1iFf5bFLVo?=
 =?iso-8859-1?Q?eph8p78G6kl3AXzrEJqZAF/wEAWHIyLx5g1R3QRTIAgwNUlkJ26VAlsIX2?=
 =?iso-8859-1?Q?q1nE8I0exfjAkNO3WaoRe0tv5Kmk/kPdwjH58MN9aWv8KtNB1Za3ju7zMY?=
 =?iso-8859-1?Q?3XcfRY0LIwOly+msyzrMF6bmb+6Fq2gSY5rutglccYf9DNSnHDXBARPNHT?=
 =?iso-8859-1?Q?MfiMzEBdhi3sj9VtZBnN29yYQ6GuBqH/zUoDKqXjSgMrdnldlql3rccau2?=
 =?iso-8859-1?Q?0RCsU89+rPY2iUoyWKF4A+iEwXAHXJBUypEB5JjPMGiWL8/2NlgYO1EPaH?=
 =?iso-8859-1?Q?R9u4Z5uqJLHPiXrC4TBU5B4eCAFf8HG5WlFXy+tqVkDKWGkkLyG7W5ghg/?=
 =?iso-8859-1?Q?+e3x+e8/qQkvWlI9dlq03Zp3aBK2tu6AIMXP0Vk5ZI9rEvkSoB5vF9oKkM?=
 =?iso-8859-1?Q?wI5IQOCGzqweYqa6wVDBJEm8WW6K5i9zxdObJzOVckX/e/dRfS9d4ddw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8e6725-36ed-4a80-c227-08dd67e5e942
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 19:32:11.7070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKxSZiwqGTHReBVNDXOUhmUrRaT+OwprrTd7jH2t5uyVWzWe0k3sNJ9sTOmqW688XmH7xy0UYfI4q8wgwMeR3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8190
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

On Thu, Mar 20, 2025 at 08:29:42PM +0100, Thomas Hellström wrote:
> On Thu, 2025-03-20 at 17:30 +0000, Matthew Auld wrote:
> > If the memory is going to be accessed by the device, make sure we
> > mark
> > the pages accordingly such that the kernel knows this. This aligns
> > with
> > the xe-userptr code.
> > 
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/drm_gpusvm.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > b/drivers/gpu/drm/drm_gpusvm.c
> > index 7f1cf5492bba..5b4ecd36dff1 100644
> > --- a/drivers/gpu/drm/drm_gpusvm.c
> > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > @@ -1471,6 +1471,7 @@ int drm_gpusvm_range_get_pages(struct
> > drm_gpusvm *gpusvm,
> >  			pages[i] = page;
> >  		} else {
> >  			dma_addr_t addr;
> > +			unsigned int k;
> >  
> >  			if (is_zone_device_page(page) || zdd) {
> >  				err = -EOPNOTSUPP;
> > @@ -1489,6 +1490,14 @@ int drm_gpusvm_range_get_pages(struct
> > drm_gpusvm *gpusvm,
> >  			range->dma_addr[j] =
> > drm_pagemap_device_addr_encode
> >  				(addr, DRM_INTERCONNECT_SYSTEM,
> > order,
> >  				 dma_dir);
> > +
> > +			for (k = 0; k < 1u << order; k++) {
> > +				if (!ctx->read_only)
> > +					set_page_dirty_lock(page);
> > +
> > +				mark_page_accessed(page);
> > +				page++;
> > +			}
> 
> Actually I think the userptr code did this unnecessarily. This is done
> in the CPU page-fault handler, which means it's taken care of during
> hmm_range_fault(). Now if the CPU PTE happens to be present and
> writeable there will be no fault, but that was done when the page was
> faulted in anyway.
> 
> If there was a page cleaning event in between so the dirty flag was
> dropped, then my understanding is that in addition to an invalidation
> notifier, also the CPU PTE is zapped, so that it will be dirtied again
> on the next write access, either by the CPU faulting the page or
> hmm_range_fault() if there is a GPU page-fault.
> 
> So I think we're good without this patch.
> 

I was going to suggest the same thing as Thomas - we are good without
this patch for the reasons he states.

Matt

> /Thomas
> 
> 
> 
> >  		}
> >  		i += 1 << order;
> >  		num_dma_mapped = i;
> 
