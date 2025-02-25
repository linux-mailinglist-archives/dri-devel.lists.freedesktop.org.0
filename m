Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4575AA449F6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 19:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B377810E790;
	Tue, 25 Feb 2025 18:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iEsROx6u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DDA10E78F;
 Tue, 25 Feb 2025 18:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740507392; x=1772043392;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KbDs7lWjdreQFiJDvgX5XA7LovXwpdDEwVIkEacE/vU=;
 b=iEsROx6uyiOo7tlZuQho7ad2f8xQfFIFJqVLvrfXm0ZNxpJRg5yix56y
 zVKK/ZAAnCrSG/3E5kp8UQT3lHzxw8n6/LZ+q60zX1rFcpKx7b07C58QY
 NuC8uHCOLb0eMbfuGkEFpQ1u/8KAC8lzHvcdjJiUIvQmUccZh13ZToVF6
 th72ffLIZaU0Qhi9TeEFDsT9jUYNatQtdgWBN4CdjXd5ViaH7JxerLT9O
 7gAT3Gd87NnDVdmFl5eqLS+bM0S1CFYVpeoAmEyiV+CyGZEpl/GkXHnEp
 NTNoLxLE8AtFPXaK5zbaKTBk/sop6hmERgeMz77rtE/mq8o4Jldxh5mbe A==;
X-CSE-ConnectionGUID: O5C8BaO4QN6nDr1d+jBXqg==
X-CSE-MsgGUID: AE7w/L8PTEym8jKTWTTAkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="51965095"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="51965095"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 10:16:32 -0800
X-CSE-ConnectionGUID: fgEQgRbGSOCw7pOHEwOz6A==
X-CSE-MsgGUID: K5Ph5yQ8Q7CJ5WPXCrl54A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="153641988"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 10:16:32 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 25 Feb 2025 10:16:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Feb 2025 10:16:31 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 10:16:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=badhJcicJgtAd7cFQloLQFNdbavYX6R3A1WdrItBeOoQY+4VOPuSdRgTZ3PahuK68TWl3Wc4SXot7vNdgudw0RNDiispshsk6L5Jjj/7U6KVDWTabm/aQSp6ZdaUK6eaaPXUYg+Adh+bQLz4HsuAklj3PkJD0vKjwYG6D2aes87rwaFShxXU5sOmUIoSe1FMi4QEtmdE4j+r4n0AK2yJql+w02sNJm+HCgyRxeMQPp4ch4YbOysy5Ty4LlD7OAcrB/AgQaaXNeo3N8VOqtMjgZV3XBaVoZ0Y22TArFzzfK5njcr9jPJZmjuThzgf5iM3WUr7JoEMIgrE9ZUb9tDTag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQwOmq26evGdbP1pWkULdjWmz/JoCrRgx7406oOSASs=;
 b=y8eHWXWwlS1otDctZcrN2QRi0FZfRRR/PZCC+aqrWpjxTWoPomrrvd5couz3lE32n+cDr1y5IHiPLMEaDOqsaHdvVC7kTNA1ZWpmNwZnz9vgVh/Cvd7veK76f4MzpY0KFOyZrW1DhKqHtHOojdFWmtJqTgKXDjhcpiLNXK6RKC+DRBfwWOnH8Yd5l15sHWM9MPRsfiughqp8xaMeiN6U5Aj1k3qCbQcxHW+8og0iiUbfrjX2WWxTmmsRfsJbi08vQqxF3Yrakzdb4Q6AaSzHvuuI7m0LtR9RAdwSVh+Owuy20FuNaRenD39blkkx5ktp5q1HN4LbgTUjd0rssFG/+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7871.namprd11.prod.outlook.com (2603:10b6:208:3f5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Tue, 25 Feb
 2025 18:15:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 18:15:44 +0000
Date: Tue, 25 Feb 2025 10:16:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v6 04/32] drm/pagemap: Add DRM pagemap
Message-ID: <Z74JEG19WX2Wc2AN@lstrano-desk.jf.intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
 <20250225044311.3178695-5-matthew.brost@intel.com>
 <c43d98e4-7f13-480c-82d0-3d400fdf97a4@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c43d98e4-7f13-480c-82d0-3d400fdf97a4@intel.com>
X-ClientProxiedBy: MW4PR04CA0238.namprd04.prod.outlook.com
 (2603:10b6:303:87::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: d3c4c46c-929a-40ee-50c4-08dd55c86bc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?frvSkwyN8hHCV5GT/CAYHvUoiUHw0GTGsNXDeBv6hi22/F6rLa+579dhGL?=
 =?iso-8859-1?Q?+5lz2k9bKUpGc0eyyl3lO1+pY8q3n+vapXyk2CwW2NR3cjj0DfbeiLOx6q?=
 =?iso-8859-1?Q?EvJHbK75bHNyBjKrEnoZSeH4USrlcTVY4YC9UNpD0NoULkUJqxoSWaZB7e?=
 =?iso-8859-1?Q?lt6GrtZQ4EEP3cmPu/jHHqjMhbYzQSWikDRgX/EHoMfrVkfOMqAEk2GOQC?=
 =?iso-8859-1?Q?QioH0hNDWPt7AiDFU2Nq53lI24fH0eQGOzNcKtScU6vjI4vShEFbH8macN?=
 =?iso-8859-1?Q?TTZEIFV0arhRICACNKsyPCQEKNRus29sauPldFq+ftGGWFtDAC5ZSqe8Se?=
 =?iso-8859-1?Q?sQEf3O5oYvSBTQbKhpWqI75qgJOJ2YwpYzuVo/RhClSrQ0WEvyMz/9Acch?=
 =?iso-8859-1?Q?iNMubWl70dsHpyCWnmW3VECfRr4dcNWeP1nz8ykxRcV5vVPhOx1GvD7a6A?=
 =?iso-8859-1?Q?Yyqee6onr52TwikqKyrPnUWhTpm65tKApS4uUEJWiGD77QFl7hxMIu9utF?=
 =?iso-8859-1?Q?pdcdX5DtS9ShbP5JWB47KcSBCWQTJ6lTQhI3s0qEHRx0YsqFlsc5lqDOEU?=
 =?iso-8859-1?Q?HkLLId9yCL2iVaygWiLnjO+3O9mFTbrDFUeh2FaVkIg1jABRHQqajuCLNf?=
 =?iso-8859-1?Q?P4PwjuXL8G9urMUoVV3fzrMhkfkXnXnxsXeMEcs6EfffKMDkllh6kiBx3G?=
 =?iso-8859-1?Q?8GDEMO27e0QiIh1GK6k4KUGXaxuk+KgsxW0kpvizy1hH1bw+pm2hXhCbjh?=
 =?iso-8859-1?Q?kZ9Gvb5ioD1qKzrvrjVLZOKQ+z6JDN7JJ5MoWvZJ9T/5wEdiZmj8JIkQuy?=
 =?iso-8859-1?Q?q/dVpck1pZ84MXKmRhTECRqbe6EBqkHnPvNzA8mUDHyri8BzkrAIW9FBHK?=
 =?iso-8859-1?Q?U2RXpsucv0hPqgCg2CErgam8c4JDUxe22NQIcSyOgkHNfCrSguwRG/AjG1?=
 =?iso-8859-1?Q?n/y5zBj3D/QU+5eTxLD4zPailCx72K7aikvfv+Ih2Hf7imyy0zx/9Qy7gs?=
 =?iso-8859-1?Q?k5Ef6SOiFB8p6hmRqlpu30DF7pCrv4+bq8QXs2PIT/IlB8W6kbbHjFTB5n?=
 =?iso-8859-1?Q?WJvCge+qQLYoBWCI8Ol69ebSulg/Wx5jXdDxgTthoPyZ6bHh57FRNiE132?=
 =?iso-8859-1?Q?Z0oDK2zQFfBGv1fQlRDl9n+8GguvpEcVX/OSLAH+sNe12guz10boS0RJ9u?=
 =?iso-8859-1?Q?VPMP5fu93bG0mObRQipdZaTC7kf7nbW7YBJDBlieS727q+piBEZ5pWOFN9?=
 =?iso-8859-1?Q?5t1ebNkOl71QUz1B1d2DXaOvYRapotvWjyxk2boqfdRbh//O8+6MlK4BU9?=
 =?iso-8859-1?Q?a4yY3wnUH6UJ2K1SzZleXQu56FOBkLQ04vceCf+k7uH6B12b4vV3an9HLB?=
 =?iso-8859-1?Q?1jY2g6OZircgChwBIoA85kABwRkDZO72sMqEw2pTeOSQhfbAYl/uI8tl9i?=
 =?iso-8859-1?Q?8wKDtXm69vOlJFwP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Aq645ZQjGQsB6MDXZtTpasC4oiHHFcmIa0p3wb6/FL5vnFr03X+z8Beemt?=
 =?iso-8859-1?Q?41jESN7e/zYONTjdNZPRwW45scdaqrDvOiQUqg2uUZooXi09N0YEtky7QE?=
 =?iso-8859-1?Q?hMWU3dj2uXdE2E2bzPVsDNemW+OSrueAaTb0iRtHSdL/6OlLoI539MKFC+?=
 =?iso-8859-1?Q?iiImdzQG3I8Kn4sJlJ5P9jp6uLW+hCzepTXRY6sgiPrruc1U7XmvVYPFqy?=
 =?iso-8859-1?Q?hhvVePtPfixR/EWWhFdrgAjrLpOX3KiaBiWtIbMa54F6kPIGy1q7gnqVyb?=
 =?iso-8859-1?Q?qf98HfnlT+UcmBRVrP96VpAJkgUyRKXF7jT6g+wuTwuUKLIvdUE+pxaHbT?=
 =?iso-8859-1?Q?pzMuUZkI3NYe0Zp6UK1t1l2wXbXmMH7CZBRzWuot8mtbPtf4vsurHgyEBj?=
 =?iso-8859-1?Q?HSaC0gAx5jhXvmIl/NM7T9+cok3vtfGe9K4vqRhVXHFaMkFEFgtcbj9XBY?=
 =?iso-8859-1?Q?n9CHot7dYOshaBRwcF3bCs9hjIcNyZSRv82YLwhOMUkbKwLSy7Y0gr7qGU?=
 =?iso-8859-1?Q?cmF/mZHaji/6+qhRtHpGtlmyyRA71tSd2h005t0bxl2Brz3OvoTRnlYbWP?=
 =?iso-8859-1?Q?hceLa22NLFAfYrSckvpBJEZsEckAwODImu5zNfJ5iPVwDOmuwb6W/8l/ii?=
 =?iso-8859-1?Q?N66TJHhYCAyBMf2GnHP01OJ/osqcSlz4k+sP1ODG1V0+Bgs9Q+8WV3+Ygf?=
 =?iso-8859-1?Q?UdGjlj15afWjZOjx035oDJI5Kv25NoHPt/dnQ5/6Fh/MFkaR348KCCmjcG?=
 =?iso-8859-1?Q?MY5pAvM1cu9T657r9RX07QvJePs3mtK8BSL3Zyrppd9uvSvO+FZhzSRbaz?=
 =?iso-8859-1?Q?i/dcTT5FmeadPF8IY06JfLawHHtV5WBI373wPx6B50NByNjqjO6W+ezNn7?=
 =?iso-8859-1?Q?TDKhPNrXWKUJmOxRi1lI8t8XeT9OKvmtFUbgCyN7TpfT+PTL6Cb+BGgi3d?=
 =?iso-8859-1?Q?MwoSucErZtVTtaHT8A5ZkINAidu8xMBjkhLWRMPsP3/L7/t6HApEBSf5JM?=
 =?iso-8859-1?Q?8S8zfpuX4QFRn5DW/p3x+KUP85PiAMjSrQLK/vgUf0evUMUKYPQuSy3k5l?=
 =?iso-8859-1?Q?zfZuzU9pLmJ5Xi0GftIiox+Za2u1buykHOb9JsRQ9gi1UXsaXQ7Wgigla7?=
 =?iso-8859-1?Q?JZInillsp+k/yDzm/XzvxW5uCSDcn5MM0b8l6gLR3Ji7ecNt4+WKT0kyQb?=
 =?iso-8859-1?Q?V6cEsaPy4VIn1NbTmtHZ/IsEWspDyJRiWKTTGj1/vNWAU6XDlfJVc4Qghr?=
 =?iso-8859-1?Q?Ft7DxRfZXiTZLZMwk1vha1NbgyPhW4V8e81PIL9T0BWhTeni9xQ0lCdQM6?=
 =?iso-8859-1?Q?KT04uAwbR3QejJ2h8ZpFTMUbyzk5IbFJnF2rc0QpOj6ZXE4BraTeRMSgCl?=
 =?iso-8859-1?Q?IE38knkZRj4AnZF8I+R9Ha8La/xsH6EhYgbHr9aUzzOVPReUq9LnHLYLqr?=
 =?iso-8859-1?Q?KAn0kMVRp8JWNMtkNDnJe0ml/nnYhthkimgBuoyzPvY+s5oD4JCvjqt7K+?=
 =?iso-8859-1?Q?LH3S2n6Upi8E+u3sSBANXQectSMSJ05Clz25BLdT46tjryOOcohahiY1Tw?=
 =?iso-8859-1?Q?MCKar8LnzECA3bsrEiJUhhQqMdKo9JANK2TlwaPU6pUrDJ+TUmbc3j+bPm?=
 =?iso-8859-1?Q?S364fuhr/OtK+zGgRyjAvKOZiMPFgCRMHvnfuvy94VXccMdG82/KBdNw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c4c46c-929a-40ee-50c4-08dd55c86bc1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 18:15:44.7602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dn0JaXg8Io6f2x8draRagCmr5GIeFhqoCdwnrC5H/dyqZ++RfOI4kdRsS6FnjaIMXIevnjQ17igTPz8vi94rcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7871
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

On Tue, Feb 25, 2025 at 03:06:34PM +0000, Matthew Auld wrote:
> On 25/02/2025 04:42, Matthew Brost wrote:
> > From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > 
> > Introduce drm_pagemap ops to map and unmap dma to VRAM resources. In the
> > local memory case it's a matter of merely providing an offset into the
> > device's physical address. For future p2p the map and unmap functions may
> > encode as needed.
> > 
> > Similar to how dma-buf works, let the memory provider (drm_pagemap) provide
> > the mapping functionality.
> > 
> > v3:
> >   - Move to drm level include
> > v4:
> >   - Fix kernel doc (G.G.)
> > v5:
> >   - s/map_dma/device_map (Thomas)
> >   - s/unmap_dma/device_unmap (Thomas)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> > ---
> >   include/drm/drm_pagemap.h | 105 ++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 105 insertions(+)
> >   create mode 100644 include/drm/drm_pagemap.h
> > 
> > diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> > new file mode 100644
> > index 000000000000..2634abb1e8bf
> > --- /dev/null
> > +++ b/include/drm/drm_pagemap.h
> > @@ -0,0 +1,105 @@
> > +/* SPDX-License-Identifier: MIT */
> > +#ifndef _DRM_PAGEMAP_H_
> > +#define _DRM_PAGEMAP_H_
> > +
> > +#include <linux/dma-direction.h>
> > +#include <linux/hmm.h>
> > +#include <linux/types.h>
> > +
> > +struct drm_pagemap;
> > +struct device;
> > +
> > +/**
> > + * enum drm_interconnect_protocol - Used to identify an interconnect protocol.
> > + */
> 
> Getting some build failures here. I think just needs something like:
> 
>  /**
>   * enum drm_interconnect_protocol - Used to identify an interconnect
> protocol.
> + * @DRM_INTERCONNECT_SYSTEM: DMA map is system pages.
> + * @DRM_INTERCONNECT_PCIE_P2P: DMA map is PCIE P2P.
> + * @DRM_INTERCONNECT_DRIVER:  DMA map is driver defined.
>   */
> 

Thanks! Will fix.

Matt

> > +enum drm_interconnect_protocol {
> > +	DRM_INTERCONNECT_SYSTEM,    /* DMA map is system pages. */
> > +	DRM_INTERCONNECT_PCIE_P2P,  /* DMA map is PCIE P2P */
> > +	DRM_INTERCONNECT_DRIVER,    /* DMA map is driver defined */
> > +	/* A driver can add private values beyond DRM_INTERCONNECT_DRIVER */
> > +};
> > +
> > +/**
> > + * struct drm_pagemap_device_addr - Device address representation.
> > + * @addr: The dma address or driver-defined address for driver private interconnects.
> > + * @proto: The interconnect protocol.
> > + * @order: The page order of the device mapping. (Size is PAGE_SIZE << order).
> > + * @dir: The DMA direction.
> > + *
> > + * Note: There is room for improvement here. We should be able to pack into
> > + * 64 bits.
> > + */
> > +struct drm_pagemap_device_addr {
> > +	dma_addr_t addr;
> > +	u64 proto : 54;
> > +	u64 order : 8;
> > +	u64 dir : 2;
> > +};
> > +
> > +/**
> > + * drm_pagemap_device_addr_encode() - Encode a dma address with metadata
> > + * @addr: The dma address or driver-defined address for driver private interconnects.
> > + * @proto: The interconnect protocol.
> > + * @order: The page order of the dma mapping. (Size is PAGE_SIZE << order).
> > + * @dir: The DMA direction.
> > + *
> > + * Return: A struct drm_pagemap_device_addr encoding the above information.
> > + */
> > +static inline struct drm_pagemap_device_addr
> > +drm_pagemap_device_addr_encode(dma_addr_t addr,
> > +			       enum drm_interconnect_protocol proto,
> > +			       unsigned int order,
> > +			       enum dma_data_direction dir)
> > +{
> > +	return (struct drm_pagemap_device_addr) {
> > +		.addr = addr,
> > +		.proto = proto,
> > +		.order = order,
> > +		.dir = dir,
> > +	};
> > +}
> > +
> > +/**
> > + * struct drm_pagemap_ops: Ops for a drm-pagemap.
> > + */
> > +struct drm_pagemap_ops {
> > +	/**
> > +	 * @device_map: Map for device access or provide a virtual address suitable for
> > +	 *
> > +	 * @dpagemap: The struct drm_pagemap for the page.
> > +	 * @dev: The device mapper.
> > +	 * @page: The page to map.
> > +	 * @order: The page order of the device mapping. (Size is PAGE_SIZE << order).
> > +	 * @dir: The transfer direction.
> > +	 */
> > +	struct drm_pagemap_device_addr (*device_map)(struct drm_pagemap *dpagemap,
> > +						     struct device *dev,
> > +						     struct page *page,
> > +						     unsigned int order,
> > +						     enum dma_data_direction dir);
> > +
> > +	/**
> > +	 * @device_unmap: Unmap a device address previously obtained using @device_map.
> > +	 *
> > +	 * @dpagemap: The struct drm_pagemap for the mapping.
> > +	 * @dev: The device unmapper.
> > +	 * @addr: The device address obtained when mapping.
> > +	 */
> > +	void (*device_unmap)(struct drm_pagemap *dpagemap,
> > +			     struct device *dev,
> > +			     struct drm_pagemap_device_addr addr);
> > +
> > +};
> > +
> > +/**
> > + * struct drm_pagemap: Additional information for a struct dev_pagemap
> > + * used for device p2p handshaking.
> > + * @ops: The struct drm_pagemap_ops.
> > + * @dev: The struct drevice owning the device-private memory.
> > + */
> > +struct drm_pagemap {
> > +	const struct drm_pagemap_ops *ops;
> > +	struct device *dev;
> > +};
> > +
> > +#endif
> 
