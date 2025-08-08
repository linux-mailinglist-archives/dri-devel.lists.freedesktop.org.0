Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E0AB1E8F5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 15:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBC510E93E;
	Fri,  8 Aug 2025 13:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIwjm1Ip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A3210E939
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 13:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754658692; x=1786194692;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kCrJchKg3yMlE9qRdLmDczVM/S81dXeduPSQ/mf+unI=;
 b=YIwjm1IpETBIQMlCGDcRX8qQxFWPte/sTuvZB8yjX0W8yRB2VDo+BwQs
 g5HPQlMckp/ocz5SpecJX8kStr0tqqFlZDAf6IaMH/akcCggVOrYAeIF3
 8tlW/SsbCzvBAK5+DKhaL6aPoG2Qxd9IDBy9ma9O2mwE7lSPLs59noZM9
 tw+OInuoJeF84/aNFp167mN/8xNNBB37EgynWxQMyx18DT4rddc+hnuz4
 4w9Yq4qcwNAVzTf44i7NZhxygBBm87F24S1Qkhe0Y9yb8Qc2X4TouQiVb
 /EJXH1S2to+3tj0B/E+gVUerbKR6NGVAQfq8JXKjkG6osSkfcAJ0MU5Wc Q==;
X-CSE-ConnectionGUID: YSH6M1VvRnGkLRhVNKO4jA==
X-CSE-MsgGUID: 64pDyN4oRNONbtJ12QJqEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="59619879"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="59619879"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 06:11:32 -0700
X-CSE-ConnectionGUID: EbeRu0PvS06bBniLPXOx7w==
X-CSE-MsgGUID: +g/UoytjRsKDghoRLB44aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="164544872"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 06:11:30 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 06:11:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 06:11:29 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.79) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 06:11:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRqtZRMEzG1kIpMRlm20CUKMKyAul8VdKBN1cYmChvGomVITQ3DFTYpH7g6lETDwWg2U5sROhC434SqrPYaxS+J0yYl90BQAqAULIjPx1hW7tV+yb/72+XJrOgF2DpVwSCdInwhWIF8PJ/yOTOsPgwntgftYy9z+XciZ2ucUzWWaCKQIJTSo/NgjH7/kt7gvTR0jCYmdTSIrj7YXIyzLVH1hE4uB3+VPYKob7eWHcLTkBdY4Mr74I6Xz/Da+xbA741WMfbYF1xXNHxj/1XvG6+yaWe8Ki6otzw+r8IrckHi827dX0vMV0ZPzOWFCgLx2iuz3qoUKpgOkvvLSvIKJzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlFm9kLNOmiw9SBL85XinMUnEHp00Sgq6aym1kmsVio=;
 b=mtJZ+tEqJsZoACPPvOMAFqmlSzQVgRN1bobfg9ADZ2Q7f0z+HAT9fUN5yN7Wt51cLnJ3QXnwL06KglGAAIQFw7TKrbzuPYSCyX4XV5Be2l83+k/SUEwLHIS9W/rcInLuZOREqPrCOf0APzv4pXvutazH9N0UdeO28xMPEulN4uRpefetr/oS9JtKRyTOnrpbi8jQNJdNlrLvF1/5GhIDRyjSQVs4V29k6RP+3TkxnipB/LSsruJbSX2INbLLUS+Vipw6WtVS46lBaZSzEvBr2Wf89u8Tr8vCrIb2uE/fCtVyLeHWN/2+w5YZ2vxYmCIdELwaRCyk228rxFycZJT44w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7379.namprd11.prod.outlook.com (2603:10b6:208:431::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 13:11:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 13:11:27 +0000
Date: Fri, 8 Aug 2025 10:11:18 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Juston Li <justonli@chromium.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpu/trace: TRACE_GPU_MEM should depend on DRM
Message-ID: <szqogm2xmsmruu36ttl3rewrlaraku7n2xnff3gjkznxq3hdgb@xh75zonga2w6>
References: <43ea77e79722abf6c16c3c7b59b25453cc88a4c6.1753948197.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <43ea77e79722abf6c16c3c7b59b25453cc88a4c6.1753948197.git.geert+renesas@glider.be>
X-ClientProxiedBy: BYAPR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7379:EE_
X-MS-Office365-Filtering-Correlation-Id: 9618f0af-4c53-4cd6-3372-08ddd67d1527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mHleQE1zUeUiZw0Re3aYPRxGyEFo9enNP+UbR+O+ARMBt1aCDo3CZgpld6J0?=
 =?us-ascii?Q?hiUT1dymL4zLOwWL/Z4D+giIxLQdLgIHv2v2FT4Q7Kwsw21fO6r3hd8VWvMU?=
 =?us-ascii?Q?neydH77ko1WtjLgvmBtmXYLKBDNHlGj4PkwXLJL2iVcNUWCOiztEmOr7HLmo?=
 =?us-ascii?Q?n4KssLDN/Ra6HbjHbcdmqnJ0bUSIKIZaiZSl+LC5ssQ6CuaHqwN9SzxZ6Se6?=
 =?us-ascii?Q?/WEUOsGljF++iuja6FC+S4LJAepp08JhW/RMQInW8jMqDny1TwiFom3yoHo6?=
 =?us-ascii?Q?jGf5uKY0cioI/WrUIvCSdelvTKIHeSQkYphIlhzRmfuj47xQMdZGl3m2yuRF?=
 =?us-ascii?Q?0IeSUpoVZxvPBA4BSMt8asSu/sLVxUIW9H0Okx8TvVOQpooEfcJQD21avp9R?=
 =?us-ascii?Q?3GO8xPQErbtdjtPNfwFYsTVDxbaVR9YkQWrS08gEhDHhvOGNawvFZjwjJcZs?=
 =?us-ascii?Q?2SyeMziOYwfNJf5ILqLKGU82ngFSMJItvpBSYpIgNADNjYuxe93zzXS/w/WZ?=
 =?us-ascii?Q?SV8XSZUQGDp1D8SzVywZNGWDbmUbqXUcueSn5hW+Uyq3I+ioCKHwrZ2PG7sW?=
 =?us-ascii?Q?rhBXBtqqpshTBhx1g0gA5ORy6HcpITTTrb+F/ILdXlVbzol+Tlts/9ElvJiC?=
 =?us-ascii?Q?W7TBHcqP6DJPt1fq9Yv2W1xsaQcdppWBV9B3iR2jZfxBzD2zp2W5qjIlKBtT?=
 =?us-ascii?Q?btxOjvD9zAn2IrOsRyM2tkLGqyFxweidq9Z7p7OL8q4sie1cMHfr1MV/nuLc?=
 =?us-ascii?Q?n8MiD3rkK6IQhEVWKJ5F3s123sjLCI3ZOIrftLWFTcUY/BwTvztpqL4WPSNk?=
 =?us-ascii?Q?mYnQpt9XvGJST0foXWXl1gQECFIg8dkXKGfrOs2FZAdIEq++rF+PPvgoSpFo?=
 =?us-ascii?Q?r+bG5HkY7NI7BavJhMPQS40pXhFNttkfmay4VXos4WTJkgebglpd2gzPfBiC?=
 =?us-ascii?Q?jyg4DfitIvn66RXlupwTTlI4PYNAe24MsKJ0ShAA8vbCNb7mSMOTb+fhiRMt?=
 =?us-ascii?Q?GO/ixUZRserquOHZU59aB5ejV6D93ZqF8wosBEV/T05896TdwhSezTXMHPQo?=
 =?us-ascii?Q?VzP/NU4LexITB72fvV0FGXc1JobBVob9NMKMFGz3S8Bww3CKwSpKRcJGIjMJ?=
 =?us-ascii?Q?9tT+jOsaTgT+TiiPSj0yuKkGjxzYfuN8/JejUyo8ZDHbOtOIh9nRD9H2NVhO?=
 =?us-ascii?Q?kfAWoqgAaB+v7cv6epIZ0ya3XlBhjM4r/qEIj2mRMzpFAfM/GSTv8tnVl1DS?=
 =?us-ascii?Q?S5Aaf4NCEWfwmwT2soWmeCjRAh+cjT6xRz7oR6/uAVD7pF/toibaDIM+KBZi?=
 =?us-ascii?Q?lGSjogbw1UzNT+bz69qjaRsNHfUOGZwBlOMl4tkl6MO/py1qvyij03QEaJSZ?=
 =?us-ascii?Q?85IvZ+IUFylO8+pLE3mUOeb7/br4wy9GchRGvsd0vqOGyRuK4w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bw921AfpD8bnZvBEs968gIjerjhIidhJc80NGcS59PtMi9Ayy+jqQ4euRzDE?=
 =?us-ascii?Q?C4EN3twJjKRTzPMyc58aPhf9IkeoETw5lg/Kk/jGbY/EqR5uSp7VWNqGuHf5?=
 =?us-ascii?Q?ATalAKiB6OahsXl78Vuju8yklZiZcemsr+jGSQDAoX6PuK7Cj5ImhRrxcqFC?=
 =?us-ascii?Q?46bumocmQ/wG9iAh29t4FVplxmoaTPCHS6ClhcPUK9sz2v5Cj7a0Nx7G1wY/?=
 =?us-ascii?Q?AwIsJCf9gQjVslBnYx/wcbQLo7obd51MSiudBiVat2fW0WouMmtB9OaflHbV?=
 =?us-ascii?Q?ewYxFwN37qiGXqEiP17+0j4zaZZbLQ8iQ9mXYGp/zegMfuW3brAAfRkhnwo5?=
 =?us-ascii?Q?FXJmqx3Sy6tcwPZlMKM6PbY5uSbKbnIEFfWmDxGPHzgT1UztD/ofrS19OpBp?=
 =?us-ascii?Q?RccWv1sbCzE+L7hDZ5qPAg9lrImlejQIRHtwuSNX+tiAqw4cz9j6cqiTkhBz?=
 =?us-ascii?Q?7bhTmkN+wdaHbIWVafeUSTZM6RmDQp2vs0j8hvkcnPEvZoN+4OQGVtidsgI4?=
 =?us-ascii?Q?7IqerWj7MzSGaekksiIQhGZVmhGxXB0i4MP4wrHQ2F7MtV6/Gyv0rZQDMQtQ?=
 =?us-ascii?Q?61hk+1gp0OUPCR0auCTSiJZahmPw/Sr5WdF6TBxBSPPoW7WhM6FZK6YRHMHd?=
 =?us-ascii?Q?yDdgeYep0nHah4dwy+z+mmsX10S+yS/fYs2cIEUzz/SCIIVOxvyFPnG714w5?=
 =?us-ascii?Q?VkogqwraotpqbbvP25II8oEE//D76SGNmQcwJMgsoByf6ty6K6GNK6KYKbVT?=
 =?us-ascii?Q?A0RgzxKaxUbrffGDBnF6SrVm/R7nWEwDeTT88ttEIFFxVEpJW2n3OA3pm6hn?=
 =?us-ascii?Q?CPixCbiNKHkYjK8ZTk2udN4nqQZzH8XZvQXtYuB+zOogz664tjQyOHTfAOhB?=
 =?us-ascii?Q?j0RYCW/aUKmFJC5ohrDjWidjBomJjwJidBC1PAphsW/2sA8uK/TMf7Jv/CGI?=
 =?us-ascii?Q?IVfpy71huhsQx/7uI5MVNh7AGUYgVWap7bmpWY8rDDTo0ho5iKT3IywMpW3r?=
 =?us-ascii?Q?KlmC9+u4XshDketl2K6OpCKQxH+l00AEvU/juZAOXNCblofoZly3A8b3/sfj?=
 =?us-ascii?Q?GSVspvYelDQ8VFSx8g866C14oyI1I+QtAZ3p6JRcBiBedUz1dhqNlpSDXmVb?=
 =?us-ascii?Q?Nu6n4vB6Tl6wLJM3KwkBo+BKQlhsiMIey5R1werwwYZFMPhoo8ptRHTHep+3?=
 =?us-ascii?Q?uaiz17BmCPQ39ADbHoyxHWOkeIBI09Cx54/nVVfeGvPicf8Mj3Tcyy3UxOoc?=
 =?us-ascii?Q?UnKotfGYlnMFJwDs5WSs6/GcV90/efW/HaOVMf7g17LMIoIPJ+4Mr2F8P1vg?=
 =?us-ascii?Q?wTru1AZnFU8AHDs3djDPgdy+5u0VIrxo+KZe6kug99Yx7Z3d4o+F5IXDdw+r?=
 =?us-ascii?Q?1ASu5JBUInEUbtg8OZMlqZ13bYJQZ9fJlZE/Vx0GCgoQFpLt+Px1Lzr0nQGe?=
 =?us-ascii?Q?kQEaboqh66nFWKWFFo/DBM8qptl3fPbT9Q0VX7cabD5wtm0Q0KsKaNGR0iB1?=
 =?us-ascii?Q?Vta3k+ka53ooVemVTrDCgUWP0d+tbqwpq3U87nEYgZHJ2JHVZplg60X2r9pr?=
 =?us-ascii?Q?m/R/42yDHPCA86nPhJ+eb37whKEJB4DgYQv51uOZWIJ0JNdoU3ka3OIU3FTI?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9618f0af-4c53-4cd6-3372-08ddd67d1527
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 13:11:27.4923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ahz5OKXx9ScY7HhE4ebq5MtJaeq3dMoT0dQ+ME+BDb77okKJUjahnkYbJpur1pzgq60iHpkqdZiFZHI/B73rAYx3HxWWzrhpu7nVNe9AM7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7379
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

On Thu, Jul 31, 2025 at 09:51:13AM +0200, Geert Uytterhoeven wrote:
>GPU memory usage tracepoints are only used by DRM GPU drivers.
>Hence add a dependency on DRM, to prevent asking the user about this
>functionality when configuring a kernel without DRM GPU support.
>
>Fixes: 5d95cbf21a4a550f ("gpu/trace: make TRACE_GPU_MEM configurable")
>Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Currently there are 2 drivers using it: drm/xe and drm/msm, but there's
no real dependency and in future more drivers may add these tracepoints.
Juston, do you have any other drivers planned?

Lucas De Marchi

>---
> drivers/gpu/trace/Kconfig | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/trace/Kconfig b/drivers/gpu/trace/Kconfig
>index cd3d19c4a201c9c6..7f405ce7df5a0a42 100644
>--- a/drivers/gpu/trace/Kconfig
>+++ b/drivers/gpu/trace/Kconfig
>@@ -2,6 +2,7 @@
>
> config TRACE_GPU_MEM
> 	bool "Enable GPU memory usage tracepoints"
>+	depends on DRM || COMPILE_TEST
> 	default n
> 	help
> 	  Choose this option to enable tracepoints for tracking
>-- 
>2.43.0
>
