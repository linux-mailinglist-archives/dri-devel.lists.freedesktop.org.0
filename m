Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1752A9DB5F4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 11:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E9010E350;
	Thu, 28 Nov 2024 10:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KPBTrZbU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1030A10E343;
 Thu, 28 Nov 2024 10:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732790871; x=1764326871;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zOPuAr91ZycHhcpMhkNZmdyc2FPclDpbtnC1zb1XGg8=;
 b=KPBTrZbUYdLCbToC2+3t811QuSxsf50042YhtDIAyjHfXbiN9wixdRdH
 2YKvO1cJBMQUVRA8ZVNVU6sXxJWLqx0t7Qczdlyc7iyNAo3T1+TZ+whc6
 iJQjSlgwZzf+EEe7CE+drDVXFZtLWWrhgk4YC08AlcFtd0t+o9kqEJifp
 j7U2JiGWo9kJNtpYlcgh7LEA5Wg+MVDJi69VvA1f9gp99Wr+cDo7YoJ7f
 57enRwp0SJqn1SDR2wRa7YFnzj8Plrs+c/CpHo+Of0hL5gFzoJ5cpPLaJ
 YJO+Z+zk9pJT2IIlFkfYKi1jI3bdWGhAcVgLNpN5x+W7OYiI4qe/12NRB A==;
X-CSE-ConnectionGUID: qDiYlVvKQ8epCSENR67QBQ==
X-CSE-MsgGUID: wbVHAJ64Rne5Ljpa6Ql8nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32387829"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="32387829"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 02:47:50 -0800
X-CSE-ConnectionGUID: 52UiJZOaSwCtLhstBzeD4g==
X-CSE-MsgGUID: sa89f6CwRU27ZhNULGjcdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="129703346"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2024 02:47:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 02:47:49 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 02:47:49 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 02:47:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfLAKrZXPLnvVTTIoupSyITsVeVSGUE2czMKwD9nupw/BEyrCYc0YpTp+NbTmWCmZ6zItCSjC7wk1ULlrt30TzUHu5xBZxbICfwoIYDfYT9Ygh3OnHkDGGuMRqV71aMgtMh4/iFA5+n9sEunB8X8/aEruC3ElGtYDzX4AzFjayxSqUMix8/KxpHT+JuMLaWCHHcmHPvJDRAjZofeR9QGshieJS+iD0C5jtUOyI7SEquFtJcYZrf5t7ecwMN5ScMPqJnG+lVErdgz3GNMM6F4jcJwUMsI8RDwXHhOuEt3LJt55/PlIi8x9eyUH5QJ37iml2m4V32OiNDwOOLalZZkIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+vO9RpwfmU7Co9WTi/vT/8U/vm79jsYN1rQNmv8tWs=;
 b=hxu4zAVkH74mNndhCUpFO+qC+gK4CXac8g699ZwOmRZZMOIJJ8gpGM9AZY/K0lu/TIWFVbL+VSrkbWcu2JG0x5t2OtGJjUvxuhyWw22//NFgMebTcgtapqfGZEeR/v2mOTQfznSGw260WVIUXVb5YQuhwJEi6QCmMJOUltUfzhW98336VN5QWfNEKq8TG8zbotYy9PU+R3GkLyWgw+3QOHkRkypPknEWggBe7ah9lSwMBw+wOtt6tysibDtdyO8eIFsyewVKjM0iyIeJsnkm5dmRdfD/d9MbixUBequvE3hgQoCqyWlUswkNBo8LsprmsQjjaP79pdlg9mg4e/VUsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CYXPR11MB8664.namprd11.prod.outlook.com (2603:10b6:930:e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Thu, 28 Nov
 2024 10:47:46 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8158.021; Thu, 28 Nov 2024
 10:47:45 +0000
Date: Thu, 28 Nov 2024 05:47:37 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v7 2/8] drm/ttm: Add ttm_bo_access
Message-ID: <Z0hKSYRokwJoi_T1@intel.com>
References: <20241126174615.2665852-1-matthew.brost@intel.com>
 <20241126174615.2665852-3-matthew.brost@intel.com>
 <0554dd02-06a5-4da1-821a-e2b26b651402@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0554dd02-06a5-4da1-821a-e2b26b651402@amd.com>
X-ClientProxiedBy: MW4PR03CA0318.namprd03.prod.outlook.com
 (2603:10b6:303:dd::23) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CYXPR11MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: 78306281-7f23-4da6-b7e7-08dd0f9a16eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?C6h+2NbFssISzhAJ1sXWftXc5Rqwqrdvs+1015BN7EdfyZ3GrCFm+nOIoB?=
 =?iso-8859-1?Q?0TIGLD1m+O2oS+sVSKhj7y2SmJHjaOxIfWiV+UPUcBlMh5CYbVGCQcs1bl?=
 =?iso-8859-1?Q?lRZKZvwzzHJ1Esz+f2L79w6mUuNw0sPlPhAGJAg0qSapcih4TBzdfFhRHm?=
 =?iso-8859-1?Q?1DhGiB6X+Bl/zNfAWjxS11P21J3MmV1KhOjSK9/9+qR4eRCiwccFi4Ct37?=
 =?iso-8859-1?Q?umEKZNAtZXuzhAh/QKTRuKh8cSiPmBwDk0GsJMbWdWL3bKW71pp89HaHGP?=
 =?iso-8859-1?Q?6PCofGXsNwXLB8LwcQUre2jn1idPP/Dtt4QQ2IKvckYnYghM8qK0e6tyjo?=
 =?iso-8859-1?Q?Xuk5eUUJPyzemCU6MI0s8Cor5t0+SgWvDhxaP2Hs5bbePCRC5bOPd7yc+B?=
 =?iso-8859-1?Q?lZk7KshoGVcMsh/ZTYBzatYp/frTgDgrfoYNplaUZwkQ06mbrWKlokAbAA?=
 =?iso-8859-1?Q?mqO+qnkotTt78NjwdWFLSkxFjyjMqaLpfZ72qtpP3sFGeZQDuUlfIY9V3B?=
 =?iso-8859-1?Q?DpEv3UWORGqB5LnM53D/P5qznOQWRRxHGyRMgLsW1QObQh95Hq06aefbLi?=
 =?iso-8859-1?Q?j/K7u+iV6SBhac3XzDIsgXfzYn+CF6p/KHO8mKsf6PjBdqJ93/r1d3vygr?=
 =?iso-8859-1?Q?dbwybNKCnXfMocRSRMrpGspIFFwZIhmyu7S+ALxTgR8iME5I2yjfEr5wBQ?=
 =?iso-8859-1?Q?uniR1sKfNjIxc5qOpQAWJTgm+QTVoPQHG7IFiriHIgO/ecJ9rmFZJ1ZY4w?=
 =?iso-8859-1?Q?K3wQa0hWpjP0uaLH13z9WBEUvcDsnCwaH2LUe3vOlaNefDoBvAF8j6lXuf?=
 =?iso-8859-1?Q?6uoTKxa2xG87zn7Qqwr7bf3Yn3vrcr4PwWiUNA0v/kI4nnYL/lBivrkGgr?=
 =?iso-8859-1?Q?ShvW47Aaw6AWVNY84pe5dNJnG3QRFEHTRFA2jIETqmbgtLpjUKMvuG/7vw?=
 =?iso-8859-1?Q?fRCRrz1NJ69/QP0TkPnyMJzhT4j2bT4ypt8pXHdI2yZmtPeP4gKIYQ17kO?=
 =?iso-8859-1?Q?/h7WSHJbnFBIOxiZCynDoMQag+key/RojXMW0KPMUZj9Xn5pshexWUQc/r?=
 =?iso-8859-1?Q?xijJs3vA/Oqcym4/JweEylKY4XeY+AXeZE9SdPpV8aEHPJSwLvnY5lnNNQ?=
 =?iso-8859-1?Q?aKkMbU4flhrFgRzH1RD2biKy2vgTLUkSMPkWlWj1UKsg7tXEnwLRJl6uU0?=
 =?iso-8859-1?Q?HPLuzoOck6Hg4z88U6BeICcyUad+39ruUkEZCbYnZDWdrpPVcmEmzU9oAB?=
 =?iso-8859-1?Q?JgSfQRh+1lWwNB6w8lAqjgQzpCNFfIfPLWgVHVNPIKm2bqAR7PfDp5b2DC?=
 =?iso-8859-1?Q?FUX2snRp9o6tsOeSnYf/90ki2LOaqUKKsj84XwOGg0HicWGshHL/tFlk40?=
 =?iso-8859-1?Q?Alw8HdDSs3Fh0Z/lzTVAWigCMkHSUJ2A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?yZKsrwI7jJgY34GWdcKRrGxkGMlNv59OXsOsFNNuuf+RQJ5d2smUEn3NQA?=
 =?iso-8859-1?Q?F8ixade2SfsJiwEdJp1NpdxY2sesTW4BKg/ku3OlEkREmRF84HGG9YtnFr?=
 =?iso-8859-1?Q?zLz4ksGIAGIJsTPp4f4Jd6la07oJt+FojTUe9jt5cIBs3rEKj3DWfBKs9L?=
 =?iso-8859-1?Q?gSL6s/1cqWmxwEQI/95wGknd7qsk9I4POFLEynjlMzR+vn7ID4+pzBardG?=
 =?iso-8859-1?Q?Lp/848lDDxLcLxN6zmVgvT+Sq5Ikh+VaLo7pNDSEbSiYool21gC56+XMIU?=
 =?iso-8859-1?Q?v1rbkBebih6Yp1o+KgyW9j5vErLne0doT/we5xm1ICCgCnH6IGy0aCXFeW?=
 =?iso-8859-1?Q?gHZahbL1JotSWgJHIhrzXrWtQ4QetHL5yywmBrwInE2R/HWq579N6c1RWF?=
 =?iso-8859-1?Q?e62RsWhsiitVVz3uHhfh9V1U2aGdevT9cGa/81QisRWVxrix6Avuf1aB0e?=
 =?iso-8859-1?Q?9cxXz/8vPYO54aCDQ5x8t9lTKu/+dqKCKBBbjgcnoVNAq0vYUMQGINLRbY?=
 =?iso-8859-1?Q?o7RgrClLi2PS4TNotjRO7BphX1tIGiIHZE7nUWJHT4pBaaYBMprgsMdqel?=
 =?iso-8859-1?Q?qogy0dFW5ugIEgESs/rr8Gb/XUjutBBHThtKZ2QKebT3D5x4FADsudR0oP?=
 =?iso-8859-1?Q?tA78XqSTpyg4mQ2AIsBzX24Kk1m839EaAk/7+h/Niy9kInmTfGWwK0+Tbo?=
 =?iso-8859-1?Q?Za/JEf/IGrylQxZGhsX9OE3GSglb3FVL7WgYqXNiyafrDX7qOh6MdoMGFM?=
 =?iso-8859-1?Q?pzVoGua4XECMEIPhoV1nPzCqCu2NkRWU4TnVQxOWvNmngAyQ7p6+hWAF4C?=
 =?iso-8859-1?Q?OpfyQdPg8Ek1zzBVt08iQh/f9+NiwvOfW3gIVnoyzdxUo9rvhthP5dfcXx?=
 =?iso-8859-1?Q?6cY50P5JGcaXQf+Pr18xHSVUGw7yvrmv3Ak8geOHWLVDrWlcJAwRvo7hK0?=
 =?iso-8859-1?Q?AsSUBqNhvFr+5vYslbviu46G72i54SgLtVnR7CgdqYUkBO9jKU2U2rqdJ2?=
 =?iso-8859-1?Q?rRmvc6GsBESwGsGmQ2WYUrl7LFX/3BKp7c2+GPQYTZFMy1/Uq2WbmulWa9?=
 =?iso-8859-1?Q?a/4lznGdIcPY/rQST8i9P6WzecAhmewdgp+nvf9EjM7sOeRbAkrENbvP8l?=
 =?iso-8859-1?Q?Xfn8GEakWNqLBPRahrh28bMdyNFteOoiRwtAK+8Z7/UK3bOJHbxm0uoRGw?=
 =?iso-8859-1?Q?96lAHD6G+Fe9pldSRPWqcbO85kkO+FySBzXwFVOrTjHBboGqOwB+Mylp7C?=
 =?iso-8859-1?Q?DXHVnjtY3FIZ4go7JQd9zTO61weW8s2X6qgmxJQA58kX9E+E0mYFQuawU7?=
 =?iso-8859-1?Q?UBpnEtsNDNS0Xws2Of9D0710bU0I3ySjDTr1bajgfMVXr34qMRmAoxHWsZ?=
 =?iso-8859-1?Q?mMHagDNWT5Gf36akGQ5NB6TLAyiQ04VYyc8qnEEuBbPy2I7/NG/SpQCv41?=
 =?iso-8859-1?Q?o1FRpXPTwmz1PdYv7wCiO/DikW5hSOuC0zR2NhScd/pN0YYYYs7eOWIC+8?=
 =?iso-8859-1?Q?MwZkW01/afyoHSL7g5AmJ9umHArVkxo2y+lEI9ZmqsED6qCCGB8/LTGPwG?=
 =?iso-8859-1?Q?tHG65pOrvbJHir8ccm/F8Nmym6BAVkbFb9pSTE7aEk/OL117IpuFZ1FN7v?=
 =?iso-8859-1?Q?BhOnWyE8dl6OurkGO+E4/3tU0joDbeUTyCy4929Wg2ZSZNfZmIiiudBQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78306281-7f23-4da6-b7e7-08dd0f9a16eb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 10:47:45.4013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Do0Azx3iXYBlaDiLGP6GK+a8lOlW1QUjS1+q5EkxllLYwou5U6VB3m61jl5UXQgbifkb2jjt1Zw6bLTLck4ihA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8664
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

On Wed, Nov 27, 2024 at 02:19:32PM +0100, Christian König wrote:
> Am 26.11.24 um 18:46 schrieb Matthew Brost:
> > Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
> > VRAM easily be accessed. Add ttm_bo_access, which is similar to
> > ttm_bo_vm_access, to access such memory.
> > 
> > v4:
> >   - Fix checkpatch warnings (CI)
> > v5:
> >   - Fix checkpatch warnings (CI)
> > v6:
> >   - Fix kernel doc (Auld)
> > v7:
> >   - Move ttm_bo_access to ttm_bo_vm.c (Christian)
> > 
> > Cc: Christian König <christian.koenig@amd.com>
> > Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
> > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Tested-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Thank you!

Ack on get this through drm-xe-next?

drm-misc-maintainers?

> 
> > ---
> >   drivers/gpu/drm/ttm/ttm_bo_vm.c | 40 ++++++++++++++++++++++++++-------
> >   include/drm/ttm/ttm_bo.h        |  2 ++
> >   2 files changed, 34 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > index 2c699ed1963a..f02d3966cc84 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > @@ -405,13 +405,25 @@ static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
> >   	return len;
> >   }
> > -int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > -		     void *buf, int len, int write)
> > +/**
> > + * ttm_bo_access - Helper to access a buffer object
> > + *
> > + * @bo: ttm buffer object
> > + * @offset: access offset into buffer object
> > + * @buf: pointer to caller memory to read into or write from
> > + * @len: length of access
> > + * @write: write access
> > + *
> > + * Utility function to access a buffer object. Useful when buffer object cannot
> > + * be easily mapped (non-contiguous, non-visible, etc...). Should not directly
> > + * be exported to user space via a peak / poke interface.
> > + *
> > + * Returns:
> > + * @len if successful, negative error code on failure.
> > + */
> > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> > +		  void *buf, int len, int write)
> >   {
> > -	struct ttm_buffer_object *bo = vma->vm_private_data;
> > -	unsigned long offset = (addr) - vma->vm_start +
> > -		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
> > -		 << PAGE_SHIFT);
> >   	int ret;
> >   	if (len < 1 || (offset + len) > bo->base.size)
> > @@ -429,8 +441,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> >   		break;
> >   	default:
> >   		if (bo->bdev->funcs->access_memory)
> > -			ret = bo->bdev->funcs->access_memory(
> > -				bo, offset, buf, len, write);
> > +			ret = bo->bdev->funcs->access_memory
> > +				(bo, offset, buf, len, write);
> >   		else
> >   			ret = -EIO;
> >   	}
> > @@ -439,6 +451,18 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> >   	return ret;
> >   }
> > +EXPORT_SYMBOL(ttm_bo_access);
> > +
> > +int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > +		     void *buf, int len, int write)
> > +{
> > +	struct ttm_buffer_object *bo = vma->vm_private_data;
> > +	unsigned long offset = (addr) - vma->vm_start +
> > +		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
> > +		 << PAGE_SHIFT);
> > +
> > +	return ttm_bo_access(bo, offset, buf, len, write);
> > +}
> >   EXPORT_SYMBOL(ttm_bo_vm_access);
> >   static const struct vm_operations_struct ttm_bo_vm_ops = {
> > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > index 5804408815be..8ea11cd8df39 100644
> > --- a/include/drm/ttm/ttm_bo.h
> > +++ b/include/drm/ttm/ttm_bo.h
> > @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
> >   int ttm_bo_evict_first(struct ttm_device *bdev,
> >   		       struct ttm_resource_manager *man,
> >   		       struct ttm_operation_ctx *ctx);
> > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> > +		  void *buf, int len, int write);
> >   vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
> >   			     struct vm_fault *vmf);
> >   vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
> 
