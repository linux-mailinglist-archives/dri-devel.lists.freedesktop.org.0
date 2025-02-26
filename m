Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12FCA454C4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 06:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5390410E20E;
	Wed, 26 Feb 2025 05:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwcjQeNM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6019D10E1B8;
 Wed, 26 Feb 2025 05:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740546329; x=1772082329;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5HiozetuKSUPfMJCxGOdH1/QRVV3FjIBn99QpWwCaAg=;
 b=WwcjQeNMcMTaxSh8mi9MoySvz4SZwz+x7eiMWYGBio7U7Xc9kP6f/Pie
 XfL1yZ+mFkhYO/EM9w0YkXM7Jf5TuOYf2rrdQsc8HMiFGNzbpbmyVIXCs
 dsnZnMgkDh3G++ta/GUkZdZ1etjtmrXFQD0I2sfeMdbGXNzze5ypr1ziZ
 QV9bYx24MZoqAyyOi+8axMbhv2trnF2j9ufA3H4xkdGekO3BCSoOu18tW
 la4JP0eNcboox6wOLvETRzPtPKNq5B4k2f9nyzJK0IFrYS2OmendNlsp0
 iWdWlxFAUeSyMB7k6u5iyg/+jcNpETIYfLJps34ymSWClDTQZKqEE4oDj Q==;
X-CSE-ConnectionGUID: mE22xnGNRISbXpXqnTGIKg==
X-CSE-MsgGUID: 41RvkxIpTHG8pYMxOkXJSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45162613"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="45162613"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 21:05:29 -0800
X-CSE-ConnectionGUID: 95UuB6xfRY+LxL+7rPYcrQ==
X-CSE-MsgGUID: WCINmEXnTwqkA7Q6Gp+fGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="116601054"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 21:05:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 21:05:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 21:05:28 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 21:05:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSa84MUP2J5g5sBb/tcbG6cOZB7Dg+xwkBIXe4yU9kPsjlQc6l+IqB1HV88avCtM1Q3D/Ygog+lsoUc+iKynQfyYRX8P66R3ONiM5jp5Be15IXZBXU5uHL4y/2aS/Pz+5+XpMDV8od0N1uMgjevJS3nvQAZtFeQbWFjj1dfLgh5e6SrHMqr0vluCpCV5RCZ6b1sWNpyZjvhsd2pOkeI/fKEvnJmI2XHUcpq3aMkN0aPYBUKL2vXSo79FeEdC2etpQH1GkawqDj75eR7D07PvBM/NHS/zCbVm7lc/uuckSukqPIcn/qHld3IXamoCH1moSSa2GTF4r/xTE0tYRn8BIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DP0+Jp7AUZcZxuphsneQXc09IsMDQ6/JlSi+3hCmuk=;
 b=Ga/wWY3ABMjefxUCTsVz0GZujM7Du109feBURpCYkEkFfGY1ND7ljrLZW+a6C/BaVN4RwK2h6bX4deHUs7E2G2BLwWZCUsUTo5fT9n53sVyyrB/vJOmyG6JdlBQZ7xb4AJ8N1PKQWHVoa6u1CJCsbmlRD3o8RXuXsXgHATI4rP1VGr0a2KGMoyRKDZPi2t2vHtJgwWgwQw0BSXTC77/FjaUV/QJROUEGla9a3cgQu//YhlFt3ZRWaBp6gmAXT1V+lyCfuVMzkX+JbJkxNQgm+u+z3IEnG4rmgGJ5SdynqxuFMQMSJbA0qMlh4YiSuM/+Xbj1dO/xXnftC7UsbXgV9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4947.namprd11.prod.outlook.com (2603:10b6:303:99::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 05:05:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 05:05:21 +0000
Date: Tue, 25 Feb 2025 23:05:16 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <jeffbai@aosc.io>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "=?utf-8?B?Sm9zw6k=?=
 Roberto de Souza" <jose.souza@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Zhanjun Dong <zhanjun.dong@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Mateusz Naklicki
 <mateusz.naklicki@intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Kexy
 Biscuit" <kexybiscuit@aosc.io>, Shang Yatsen <429839446@qq.com>,
 <stable@vger.kernel.org>, Haien Liang <27873200@qq.com>, Shirong Liu
 <lsr1024@qq.com>, Haofeng Wu <s2600cw2@126.com>
Subject: Re: [PATCH 1/5] drm/xe/bo: fix alignment with non-4K kernel page sizes
Message-ID: <3byh43hetsh37gd544nhurkzhn6ynotlzittvcqjxxwgqg6ucf@b6sdl65ssyxg>
References: <20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io>
 <20250226-xe-non-4k-fix-v1-1-80f23b5ee40e@aosc.io>
 <wcfp3i6jbsmvpokvbvs5n2yxffhrgu6jyoan3e3m6tb7wbjaq6@tbsit7ignlef>
 <Z76WIgGvvhlbYl/j@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Z76WIgGvvhlbYl/j@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW2PR16CA0031.namprd16.prod.outlook.com (2603:10b6:907::44)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4947:EE_
X-MS-Office365-Filtering-Correlation-Id: 0291e2d5-9882-4173-f78a-08dd56232b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+MOmthp5HLXrnNBaMYBKhfz9pX67ktcUjRXTPE6oZA+FAtkwzeTNQ+Y7kiuE?=
 =?us-ascii?Q?qgxkHzwvvjkzjEzZ1JbF9HISjFeTbS46Hbf/SSaUwaV+n+eeIZLPsr201ZEA?=
 =?us-ascii?Q?Sqds9ycKYQyHybinZv4DvIPmqBe3HRTisUnxf/3ol9dvdVvtWV0ccuV/W7Dc?=
 =?us-ascii?Q?wYA76cF9moL3HQK3Urq+VYj7/KrlSjBsS/n/ZTA0RuQm6TofbIUmztwBW1hC?=
 =?us-ascii?Q?SVj9mN/pWKzmHw1iL2vkLWY0uwHoRvgDy32yR3ToKC4qn9bG0DV1OGq8F2/e?=
 =?us-ascii?Q?oUFKdad3zUzsG0p5t/h7isp/Zi+is+HN5PdgyZU86ReuylCxM9Lctval33JS?=
 =?us-ascii?Q?Omo55MA+4dwCEzC0slUVArDBtC+6QR9TjFR5QAloOa+ibd/hwcptdSffCErB?=
 =?us-ascii?Q?ztFySqdAX2d+kveEl1mXxyiUh+coHUKQWonnVbhJKNuELSyYPa/FoNJj1LsO?=
 =?us-ascii?Q?7SKmyXCI6qwARAto/EFJVxLgThY7ehtYHhEgzNVVdfOCo/9fnnuPsn/Cj+YA?=
 =?us-ascii?Q?QhZGYSJPVI4HDELmUraE7e+K8gxxWa2vuah0qwwFndhh1Dkpo9cpobtXcxEo?=
 =?us-ascii?Q?WAcWyxJXf53qIiRJ2wVJ7sT77zlgBh+5rboE2eD38kwRFddS8zFemkVnr5lA?=
 =?us-ascii?Q?E1b78eA+kTzdP8gHhsxintIQTnKuc7i40Oy9yOXOqY25owKnQX83kug+n2td?=
 =?us-ascii?Q?SNL5gnMqcnX+uro+Gbdt9x49kLw1pz1ec1j81uBLkRd0d+lA1ppEcDHR12v6?=
 =?us-ascii?Q?TDxJ3TMfVqH9cLlsfc5eQpnIsuWw5ylH+56IyN71uHFKCjWYeKbp+OvTyGRl?=
 =?us-ascii?Q?sMV5jn2J6hQKmvUBrXvouqwgO1txrKi6ClB7yfrImRApKPSuuixsQL6KRshf?=
 =?us-ascii?Q?R9WvIPuhLUDCSrXBlm+CgF7UHOhsLNXsyK3ey8ZMe1dPlcjTWcKhM3rg2s4/?=
 =?us-ascii?Q?mUsljbEdJ882lRowVR3gnmtA2j/wv5c8THUoO8vDP63yy2w4wyO232BMWSOS?=
 =?us-ascii?Q?7/UMvws75qFz1926+sjxVwrep2zRcpFvQ3Ol+fC2A7Oe9NLNk0QPx3qVxpty?=
 =?us-ascii?Q?K6N+VIA9PdF87Q7ZFEzJyNiIkZUNCX0mYIqBY+PKk1sxXeDEL/my28hQW8KZ?=
 =?us-ascii?Q?it8hx8X4VD7+G+h9gF9Idpxwf7JBs8BWuc/osLOTjVDax7lWHcf3ldncoqgk?=
 =?us-ascii?Q?gVoCWSz/ceXk8a0BhRmP8dYjqmPbmg/vOetK3yIYuAept+u6WT+3n01zeLDE?=
 =?us-ascii?Q?CKEG3uixbkHOhvzzr1+JGArjUFVriHRa2p1Y/jfyRjDKf5TVudKWPbUlf5WR?=
 =?us-ascii?Q?13ijWCw6RaDzSl34bJddE0NP4Vj96L3xyYehS9LO9zOAt+rQ/kl7H3rkdSp+?=
 =?us-ascii?Q?i0pU+yKxzADRF6L9b4kznbjOcRlk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cXuzjwTAOYwEE+zF8ATXNHEdVI6yEZVu7TmLQPDesE8dxIyy611Fn1TVbR4k?=
 =?us-ascii?Q?QMNO88hB60JxGARDlv/svQf0MnDCW32Kuwx4vzXzlUy+8oSFZjpMnsoUsYY/?=
 =?us-ascii?Q?awrd/dQaZGrb0QutV+eZf1zhPp/h26agscKv61CnycGoPR52Lal/fvtwpbss?=
 =?us-ascii?Q?muCoAldUvMy/IbFyjxEavQH7qtyCPLsUoqGUoH948M30X339yi80+XFL6V1Y?=
 =?us-ascii?Q?A4jzxbgYRvGap/98WjfDo4Rmk55Q8bhygXEzmVrl7w9mMzJl9G9Fbg7z724a?=
 =?us-ascii?Q?5TSVxhKTvSIuGZpsAe2JR94t8OT4Feq9P6NvWUG7ra60A65EITZn6PXgXxfG?=
 =?us-ascii?Q?xZw6k4ltfmNe02UD02zMzpNe8YTXtGlyyPXxwAwR8k1eRCEdIAsiK89uWP2y?=
 =?us-ascii?Q?aua6ko+sGFixhW2aDaE3GBnpDD2dOrOAwtK5egXQckKpt1alR6mp1ZwpF0fo?=
 =?us-ascii?Q?NwDIfvkTvVC/XggfSt5JWSbSwpiGCsuy1ueuOwcu5BWRu6B7FEmsCADGsCat?=
 =?us-ascii?Q?FikjIxqKL+4KqxpHWrUWPux0GA66mtXUfMDoalL76Ry5Z0lNabulPMEgwkoK?=
 =?us-ascii?Q?EbWUMO1DZbQaEKfwTIW4jbaUU0VWF5Ebl0aRXkAD1LyDD3TaWUQE6kHXizT6?=
 =?us-ascii?Q?0gbi0x9AD4fgAZGdOyV5fnEZ3yhZe6tYFzCPh9UobBUHRivmyziMcoRp7NVm?=
 =?us-ascii?Q?zmqRT1tK3ylPONJQHSIy+VLEM0Rf2/2U1n379q3FZ6CKk3GbpZlPZnySHOHj?=
 =?us-ascii?Q?26wXbH6E+l6jSywd6yiVfRbuiGyjX9+A/PwgkLpzXQ9xASW8envpi8je7Xm8?=
 =?us-ascii?Q?/RrLUowet1/qRlCTcY8eZpN9u2At04OvdCx/F6LqPcwGKZfFznRZ2uVX6OE0?=
 =?us-ascii?Q?fWfbbnxR2uC+CQeb2PqmsGqFsHJccl2amocN+JdzlouuQcGjyPylpmFetdfo?=
 =?us-ascii?Q?HWNcB6HWMiMJyjr0uHA9KclHOZdRhu4adR8mQGVQfhOlDTeodqQCr480a1R4?=
 =?us-ascii?Q?agn0sLlnNAAJEJGrj2JRfflzyN3u7EIyKdCa/8xiuH9G3JecEdV1wLDAv7Bo?=
 =?us-ascii?Q?XeW8Ma83grDzASByaq/iJnmXMZ7v54n9gtQygNhJVXGz1UOUu6uHzSIsjjA8?=
 =?us-ascii?Q?Hk2CxiyMEo5cfmaKwXAECMooiE52AEV3DH7+LH6EjHNRfBo2t2PE8iUbCNLg?=
 =?us-ascii?Q?mjra4p9LQZMQWygzfjbH/AG/3RA4XHV52w7pfUbYjFp+hrSbgih7yRUD4eEF?=
 =?us-ascii?Q?wRdmNsHtLgUA65AaMggRkC2G+o5yONEEnIlQwIwoCvdW7/Bm55mGN8RM6dmC?=
 =?us-ascii?Q?eD8kyI+EHp23W0t1Ewi4TczmmQ4CRQGsGkPyaf18xOeg5UUTR42AM0LSVti2?=
 =?us-ascii?Q?LenpMck3Bvuhed3aJjioJ4SPo5a0uJq6V6WPzYKuOIKaFphcacuSt7kl8Abh?=
 =?us-ascii?Q?WKdSnT8F/63qHpx2i5skwnHIUmHhImaFthLfedqha2nV68JX/BjjFXC9XHJL?=
 =?us-ascii?Q?y8G9i7wzRxAemRSVUvFXv2igEhEkXcRCg0Tf7cbArFFod39ang4fsboVpCT0?=
 =?us-ascii?Q?Q76ZQc3es5R7Smj+KbBIvCnJIoDC0H9t33X2W2VSuAonYM8H9XliahpaSBFE?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0291e2d5-9882-4173-f78a-08dd56232b75
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 05:05:21.2305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ect6CpKlYNO9XMShuIwmJAYS6X0+nnrOhIlYYzNkj+fGJDQeDJON9WFCwOVCkhC4DxaMAlL3+ceZYJ5domivlpffs6+b3ES59pAnRkil3tI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4947
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

On Tue, Feb 25, 2025 at 08:18:42PM -0800, Matthew Brost wrote:
>On Tue, Feb 25, 2025 at 09:13:09PM -0600, Lucas De Marchi wrote:
>> On Wed, Feb 26, 2025 at 10:00:18AM +0800, Mingcong Bai via B4 Relay wrote:
>> > From: Mingcong Bai <jeffbai@aosc.io>
>> >
>> > The bo/ttm interfaces with kernel memory mapping from dedicated GPU
>> > memory. It is not correct to assume that SZ_4K would suffice for page
>> > alignment as there are a few hardware platforms that commonly uses non-4K
>> > pages - for instance, currently, Loongson 3A5000/6000 devices (of the
>> > LoongArch architecture) commonly uses 16K kernel pages.
>> >
>> > Per my testing Intel Xe/Arc families of GPUs works on at least
>> > Loongson 3A6000 platforms so long as "Above 4G Decoding" and "Resizable
>> > BAR" were enabled in the EFI firmware settings. I tested this patch series
>> > on my Loongson XA61200 (3A6000) motherboard with an Intel Arc A750 GPU.
>> >
>> > Without this fix, the kernel will hang at a kernel BUG():
>> >
>> > [    7.425445] ------------[ cut here ]------------
>> > [    7.430032] kernel BUG at drivers/gpu/drm/drm_gem.c:181!
>> > [    7.435330] Oops - BUG[#1]:
>> > [    7.438099] CPU: 0 UID: 0 PID: 102 Comm: kworker/0:4 Tainted: G            E      6.13.3-aosc-main-00336-g60829239b300-dirty #3
>> > [    7.449511] Tainted: [E]=UNSIGNED_MODULE
>> > [    7.453402] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05756-prestab
>> > [    7.467144] Workqueue: events work_for_cpu_fn
>> > [    7.471472] pc 9000000001045fa4 ra ffff8000025331dc tp 90000001010c8000 sp 90000001010cb960
>> > [    7.479770] a0 900000012a3e8000 a1 900000010028c000 a2 000000000005d000 a3 0000000000000000
>> > [    7.488069] a4 0000000000000000 a5 0000000000000000 a6 0000000000000000 a7 0000000000000001
>> > [    7.496367] t0 0000000000001000 t1 9000000001045000 t2 0000000000000000 t3 0000000000000000
>> > [    7.504665] t4 0000000000000000 t5 0000000000000000 t6 0000000000000000 t7 0000000000000000
>> > [    7.504667] t8 0000000000000000 u0 90000000029ea7d8 s9 900000012a3e9360 s0 900000010028c000
>> > [    7.504668] s1 ffff800002744000 s2 0000000000000000 s3 0000000000000000 s4 0000000000000001
>> > [    7.504669] s5 900000012a3e8000 s6 0000000000000001 s7 0000000000022022 s8 0000000000000000
>> > [    7.537855]    ra: ffff8000025331dc ___xe_bo_create_locked+0x158/0x3b0 [xe]
>> > [    7.544893]   ERA: 9000000001045fa4 drm_gem_private_object_init+0xcc/0xd0
>> > [    7.551639]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
>> > [    7.557785]  PRMD: 00000004 (PPLV0 +PIE -PWE)
>> > [    7.562111]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
>> > [    7.566870]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
>> > [    7.571628] ESTAT: 000c0000 [BRK] (IS= ECode=12 EsubCode=0)
>> > [    7.577163]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
>> > [    7.583128] Modules linked in: xe(E+) drm_gpuvm(E) drm_exec(E) drm_buddy(E) gpu_sched(E) drm_suballoc_helper(E) drm_display_helper(E) loongson(E) r8169(E) cec(E) rc_core(E) realtek(E) i2c_algo_bit(E) tpm_tis_spi(E) led_class(E) hid_generic(E) drm_ttm_helper(E) ttm(E) drm_client_lib(E) drm_kms_helper(E) sunrpc(E) la_ow_syscall(E) i2c_dev(E)
>> > [    7.613049] Process kworker/0:4 (pid: 102, threadinfo=00000000bc26ebd1, task=0000000055480707)
>> > [    7.621606] Stack : 0000000000000000 3030303a6963702b 000000000005d000 0000000000000000
>> > [    7.629563]         0000000000000001 0000000000000000 0000000000000000 8e1bfae42b2f7877
>> > [    7.637519]         000000000005d000 900000012a3e8000 900000012a3e9360 0000000000000000
>> > [    7.645475]         ffffffffffffffff 0000000000000000 0000000000022022 0000000000000000
>> > [    7.653431]         0000000000000001 ffff800002533660 0000000000022022 9000000000234470
>> > [    7.661386]         90000001010cba28 0000000000001000 0000000000000000 000000000005c300
>> > [    7.669342]         900000012a3e8000 0000000000000000 0000000000000001 900000012a3e8000
>> > [    7.677298]         ffffffffffffffff 0000000000022022 900000012a3e9498 ffff800002533a14
>> > [    7.685254]         0000000000022022 0000000000000000 900000000209c000 90000000010589e0
>> > [    7.693209]         90000001010cbab8 ffff8000027c78c0 fffffffffffff000 900000012a3e8000
>> > [    7.701165]         ...
>> > [    7.703588] Call Trace:
>> > [    7.703590] [<9000000001045fa4>] drm_gem_private_object_init+0xcc/0xd0
>> > [    7.712496] [<ffff8000025331d8>] ___xe_bo_create_locked+0x154/0x3b0 [xe]
>> > [    7.719268] [<ffff80000253365c>] __xe_bo_create_locked+0x228/0x304 [xe]
>> > [    7.725951] [<ffff800002533a10>] xe_bo_create_pin_map_at_aligned+0x70/0x1b0 [xe]
>> > [    7.733410] [<ffff800002533c7c>] xe_managed_bo_create_pin_map+0x34/0xcc [xe]
>> > [    7.740522] [<ffff800002533d58>] xe_managed_bo_create_from_data+0x44/0xb0 [xe]
>> > [    7.747807] [<ffff80000258d19c>] xe_uc_fw_init+0x3ec/0x904 [xe]
>> > [    7.753814] [<ffff80000254a478>] xe_guc_init+0x30/0x3dc [xe]
>> > [    7.759553] [<ffff80000258bc04>] xe_uc_init+0x20/0xf0 [xe]
>> > [    7.765121] [<ffff800002542abc>] xe_gt_init_hwconfig+0x5c/0xd0 [xe]
>> > [    7.771461] [<ffff800002537204>] xe_device_probe+0x240/0x588 [xe]
>> > [    7.777627] [<ffff800002575448>] xe_pci_probe+0x6c0/0xa6c [xe]
>> > [    7.783540] [<9000000000e9828c>] local_pci_probe+0x4c/0xb4
>> > [    7.788989] [<90000000002aa578>] work_for_cpu_fn+0x20/0x40
>> > [    7.794436] [<90000000002aeb50>] process_one_work+0x1a4/0x458
>> > [    7.800143] [<90000000002af5a0>] worker_thread+0x304/0x3fc
>> > [    7.805591] [<90000000002bacac>] kthread+0x114/0x138
>> > [    7.810520] [<9000000000241f64>] ret_from_kernel_thread+0x8/0xa4
>> > [    7.816489]
>> > [    7.817961] Code: 4c000020  29c3e2f9  53ff93ff <002a0001> 0015002c  03400000  02ff8063  29c04077  001500f7
>> > [    7.827651]
>> > [    7.829140] ---[ end trace 0000000000000000 ]---
>> >
>> > Revise all instances of `SZ_4K' with `PAGE_SIZE' and revise the call to
>> > `drm_gem_private_object_init()' in `*___xe_bo_create_locked()' (last call
>> > before BUG()) to use `size_t aligned_size' calculated from `PAGE_SIZE' to
>> > fix the above error.
>> >
>> > Cc: <stable@vger.kernel.org>
>> > Fixes: 4e03b584143e ("drm/xe/uapi: Reject bo creation of unaligned size")
>> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>> > Tested-by: Mingcong Bai <jeffbai@aosc.io>
>> > Tested-by: Haien Liang <27873200@qq.com>
>> > Tested-by: Shirong Liu <lsr1024@qq.com>
>> > Tested-by: Haofeng Wu <s2600cw2@126.com>
>> > Link: https://github.com/FanFansfan/loongson-linux/commit/22c55ab3931c32410a077b3ddb6dca3f28223360
>> > Co-developed-by: Shang Yatsen <429839446@qq.com>
>> > Signed-off-by: Shang Yatsen <429839446@qq.com>
>> > Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
>> > ---
>> > drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
>> > 1 file changed, 4 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> > index 3f5391d416d469c636d951dd6f0a2b3b5ae95dab..dd03c581441f352eff51d0eafe1298fca7d9653d 100644
>> > --- a/drivers/gpu/drm/xe/xe_bo.c
>> > +++ b/drivers/gpu/drm/xe/xe_bo.c
>> > @@ -1441,9 +1441,9 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>> > 		flags |= XE_BO_FLAG_INTERNAL_64K;
>> > 		alignment = align >> PAGE_SHIFT;
>> > 	} else {
>
>} else if (type == ttm_bo_type_device) {
>	new code /w PAGE_SIZE
>} else {
>	old code /w SZ_4K (or maybe XE_PAGE_SIZE now)?
>}
>
>See below for further explaination.
>
>> > -		aligned_size = ALIGN(size, SZ_4K);
>> > +		aligned_size = ALIGN(size, PAGE_SIZE);
>>
>> in the very beginning of the driver we were set to use XE_PAGE_SIZE
>> for things like this. It seems thing went side ways though.
>>
>> Thanks for fixing these. XE_PAGE_SIZE is always 4k, but I think we should
>> uxe XE_PAGE_SIZE for clarity.  For others in Cc...  any thoughts?
>>
>
>It looks like you have a typo here, Lucas. Could you please clarify?
>
>However, XE_PAGE_SIZE should always be 4k, as it refers to the GPU page
>size, which is fixed.

yes, that's what I meant: I think we should use XE_PAGE_SIZE (here and
in other patches in this series) instead of SZ_4K. Even if both are
the same, it makes things clearer.

Lucas De Marchi
