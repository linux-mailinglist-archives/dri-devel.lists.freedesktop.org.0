Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0A795D1B5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 17:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C4710EBEC;
	Fri, 23 Aug 2024 15:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZkFITMXi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E238410EBEC;
 Fri, 23 Aug 2024 15:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724427611; x=1755963611;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yYNZZmv5rgPApYrF5jIWgOLApy5SFsttpFQv0zrlvUk=;
 b=ZkFITMXif9x09iuoICo8hZaT3FB1dlnB3dy/3SmyCEzc442MqrZzFhMz
 r44INv00jYHCxc29F/g4yGQwuroE8qZrJ/3ziZbhfpyP35iSvzjiyajrH
 uofrh5OV1tV01s19YeSg6JnafpPXsOrFWKLbCWQLJ6iO667sLJ+kO4Dz2
 r2ekGKlfD9sVUFva9WgPpv/yoqTbCAg/K5TcPPuLakA9vavr/lfMekAWs
 Ur7kliJ/F1Pj0Zw2+7KyQEsC3fIFYXpR2EfeLwcB+w2+ZtCE1WV1u1uKY
 lawD6FBtt4l9H7NpnzbYwAFdtsWOQNCazS1jqPqgyGTwN61exYsCSdkXL Q==;
X-CSE-ConnectionGUID: PgWrCg9mRzi6bE1RAnYKvA==
X-CSE-MsgGUID: OqUa/OGvQFyRgReFLCiuMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33523610"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="33523610"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 08:40:10 -0700
X-CSE-ConnectionGUID: DEAiWHrVTAC96LcVAN0qIQ==
X-CSE-MsgGUID: uFF8bWUHQv+tthCIan4TNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="62133415"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 08:40:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 08:40:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 08:40:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 08:40:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 08:40:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLjinbcgfW+iux16xSBY+rt0oORunC8SIydxJpPnId+yNEvbpQATsUHmFJmlPbucz0uCIHZizltZgGE1iIyeYWqGF+Ixs24TlEdLMLB606auWIL5I3IXHX6QzrzEqqcdNNtehvMWKnYRPTLzurKhKaB5RiQWYk7tPZRx/nKCFlKfQV0nT8/XRvXYA7Mw4J+6euBmhnmWocwHUGqzGkhnRRUx2uhH7hXyu+hx7ElTgIx1IKYElNFSauOWHV03oC7VQPBmP/V7uKu1Dlax35Bv7DUDU9awXIY1057XNe4gOw7O/HpT6B+Cw+YInaGzs58+jtOJDv7C191gI7Kl2vY0TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79E1b0rs4RzmIL3DNF0ZRuZ/6Zf5IBl7rS0xfbdW/wQ=;
 b=quIS8QpXU3NspUmot9ac6bf5Nore5OiijuHIcRWHqC/GQ0KCJy/sTcAwL37qCQwY9XJoqMuuOnuP8eqwpkEl87krHGr/qmYFzEB5t1mdm9NDU63zf8qToxgSq1VkUGgrABDvKi6+mRY+8uslheWOaU9QakRB4e75MYfrT4KEmPdgauchjWqWk0sPVBKnYk2WH/byfh4VnGTpl7e1S5/BL4bypKa8TOI62scQpBi2Im0dSjKnT241/9ftvVm0voMHbxAdjM13KmA8rORxuyqTldnBM71yMrebIwHkV6icQFTKAqzpHHr/9lS8CQu6bFWPDVfzgXicI81O1bQgyZyx0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8163.namprd11.prod.outlook.com (2603:10b6:8:165::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 15:40:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Fri, 23 Aug 2024
 15:40:07 +0000
Date: Fri, 23 Aug 2024 15:38:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <sumit.semwal@linaro.org>, <daniel@ffwll.ch>
Subject: Re: [PATCH v3 2/2] drm/xe: Use dma-fence array for media GT TLB
 invalidations in PT code
Message-ID: <ZsitDqXwHtIBC5ul@DUT025-TGLU.fm.intel.com>
References: <20240823045443.2132118-1-matthew.brost@intel.com>
 <20240823045443.2132118-3-matthew.brost@intel.com>
 <2657940b-90b3-4abc-9f56-f6c6b70563ec@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2657940b-90b3-4abc-9f56-f6c6b70563ec@amd.com>
X-ClientProxiedBy: SJ0PR13CA0220.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8163:EE_
X-MS-Office365-Filtering-Correlation-Id: dab40d1a-a16d-4cd7-885d-08dcc389dd60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?efhOHnfPFEqpHaqokwhywHC1GcwY4WDxOLDOMhQX77xET6npR+uiQ2M3EP?=
 =?iso-8859-1?Q?fzwuZUGajnk03vmywjjn8vg6EDUY74kBfv1G0HytQ3pDUBanr756mKp3XT?=
 =?iso-8859-1?Q?kLJApxQ6FD+QOon/iIJq0hWOPUk2FsBY/Jyzmo0BpT5CqHknC/n790ltP6?=
 =?iso-8859-1?Q?xNnN0HH2oeNwMTzfXL3SNjC/EyCxfJdR7PnUiN3och8N3YrBQ1R28Xp6gi?=
 =?iso-8859-1?Q?mF9YUMpFXvlX+4Jj0saLVRAxG7XY+Mrw/QQ3MAqYH0VMdoa1VOqeRXGh6Q?=
 =?iso-8859-1?Q?zDQ/QKOSEMiAiZj4VDUpyiEIuBHr2B8hODcWph4RoYBK/g53bAI8V0AlNT?=
 =?iso-8859-1?Q?A8LQMbyWFgTs6IYQSqPXMvSB64IJfhlnMf5pgJ69FEHbBhok2B1Q73Lz18?=
 =?iso-8859-1?Q?XWo66dtoKpX58rzHumnfFkQNjTum9gU7v/ZebzG5SwWFt9JUTyBpzGj8+4?=
 =?iso-8859-1?Q?gBbJx3lNgGtyVT+e0rtf5cUbCgipaTHaln6X2NMYXQwETOx0UEJlXZSxQk?=
 =?iso-8859-1?Q?OaYz/StO7cJ1X7UUkwgtQLlKB+pxinhQiKD72IfCxbxUFHb7UpYgevXH5Z?=
 =?iso-8859-1?Q?iKgU60dZMKk0Zx4mheihwz5+4ApDGFqXk5HAKDeBACzb+M9uRlUIf9mQ6L?=
 =?iso-8859-1?Q?W4wNqUkTt8fasRhI/JLwQXUqpHupCseilcO6oABJjSb/M0V/IU5fKqSB6n?=
 =?iso-8859-1?Q?IEDQRFl5AXTESRz8HKXEtopoK8gL0bAMumSoFtG40ke/+SadqZGQNOXNQM?=
 =?iso-8859-1?Q?IvluR5yohLGt8XOGm24uC854iNBiHXQS1R+PJyupUWuV5UfUrIGMWm+S0R?=
 =?iso-8859-1?Q?GVsmHtK81UDHtFd6vcBQwwh9S5+4gcE9yZzOePzjrEgwXRlS/7luDU8O0S?=
 =?iso-8859-1?Q?b45BM+A+VuXAQ5xSUtP5HWhObR9g34+xCY1g5cEt4q/kWxVNR6oWmCtMtd?=
 =?iso-8859-1?Q?S64OIiekxYSf5grPC7H523RWcTxDOCrKY0uRxffvYFXc4ngaq8IiDU9vff?=
 =?iso-8859-1?Q?slGVo9YjDIfZDCLczdzNJbOV2e6Ang3IZjGvwPoRlare6WxghSzexmeZKE?=
 =?iso-8859-1?Q?Ob7R1bINc1v3hbe9LNOQhwHXiWrKAJC5DW1H46fDX1qFN9NCHSwI6jvZFm?=
 =?iso-8859-1?Q?Ew/EqXuRYXVZH8EGqxZhc8NEdDqg28iHSmLxIfiUDoWzsWYui+VRCvsFGy?=
 =?iso-8859-1?Q?3lAEhgZoy/Xx7SzdYPKzVsmEtrQ5eBOpyocEWVi8XgRoqbDiVr/5e8C40g?=
 =?iso-8859-1?Q?k3/+iiNHyoE9jMgRlzyTlG4jJwjwTd3+8aijau5hFJx19OtPfF3P/W6bzt?=
 =?iso-8859-1?Q?bD+DZK34dnwCW7ZPgWCi/DQEb9FZk5+nLOWs0lug58lmkVerDQG/+y44OI?=
 =?iso-8859-1?Q?q/+a3DWzVo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Kgrv9DGyn+2NMNxNGe2Lq+zqJrmzXylroEriWtxJL8XyfBB4otZC9AlS0T?=
 =?iso-8859-1?Q?d0Fv1s62qjX8h7JYZO8V8QuOmsSMXlwBe073CIuYeI6Kld33CyiZVnTHPv?=
 =?iso-8859-1?Q?433N5Yk6mho+7O1idveYmlYkrbMQ+zcvhZ5EgiRQsYidd/Uu8dAulprxhi?=
 =?iso-8859-1?Q?Vqdo6ZoLZ1yLT3k0BUC/DdyhkN4Yq9+6rDS46othCx0s5vUe/dMKeH7OXN?=
 =?iso-8859-1?Q?1IkHlC6T9fBjwUh1eDLGkp0AwHkwhI8rNg7pLjLoYWelbfgzK07Cy4opd8?=
 =?iso-8859-1?Q?bzPOeuqCMsSE9G9oGzGlopSVcN/pxW9oopypV+FUlNtyCdphwGKmJPurGO?=
 =?iso-8859-1?Q?/hfMmPrLmRP0OOEGZJRG4rVS7w2I7Ik6x5uXEKrEhBOv+ZIgo5UNVXBni0?=
 =?iso-8859-1?Q?RKr048mjUy056HVmsIyaUctUkLagKK99P8yqmsRGi+VL04qtROjxLg54Bm?=
 =?iso-8859-1?Q?HjnCif4o3OjvS2/M6glDigjx42oV9BcMpGKCYe6JZTXmYg8RQi259pwkVo?=
 =?iso-8859-1?Q?hP5tYuX9t89M1AJh1VU9YuLoAIBEddOvFB1IMQJkpqogFjnaQewReeT87g?=
 =?iso-8859-1?Q?C/BW+p74CYoOpJaCbJNtj+CWrHbTTSXtIa9B/5DKP2cxTgFc32nOZPwbpl?=
 =?iso-8859-1?Q?M/rl63kW/lYE8sYEGtYm/SyGK7D1iQW+yqvdgF4cy7Pj92soJX9ntL1BrG?=
 =?iso-8859-1?Q?DZlmzE2+hueo0lkikOEpSqOS7e3vA8TzvL3TWIBtZ1m+areHDmXxVEDlnY?=
 =?iso-8859-1?Q?LDGrZgvBEEodUuALs528eGdcvw1kxfPwt/6y8NQ5ObG0dQz9pdO3F/srCA?=
 =?iso-8859-1?Q?BWfgMUbwFTtsXgle08DCGptFpkHOZGP9/YGRmqc8eXXoOKYGHVoNJfVPj6?=
 =?iso-8859-1?Q?qWxREhhKe6m1/wXYzu3nKqmG91diV7wc+e4Ox/OcTg9d+c3HICaTz+l6Pj?=
 =?iso-8859-1?Q?fSyKhe5m4BoVeTixS25mKVVtrkdms+Gxec1563mFZmT8bWqzlE83I9A68p?=
 =?iso-8859-1?Q?FHEVfDWmgrTcQL97Ih1J+7wU4i7JfNQjxWp+K4ReqZHKmNYRcpmMwLS0t5?=
 =?iso-8859-1?Q?oDp5gJSe9UnhwXDqhlFX5B3ueqcE5Pjs/Yutyqb7+zizOaK29lsDL8TvzP?=
 =?iso-8859-1?Q?uPMqEk3Dsi6AjDd/XkvLO2itSjdIh1Hfx/oMK2apVoo3k0vX+rahonNy5j?=
 =?iso-8859-1?Q?h+m0jPj9ssFPlCG1OezxcFHMlM6WjK0hPEjwQjf3I3LyYo/2Ysn3XhpXLo?=
 =?iso-8859-1?Q?ncIZKMHC4OmuB0QySpgjSfLAYs8WkDmmkqY2+TiIQMf0SWFRKYEn1L6TZq?=
 =?iso-8859-1?Q?K/Et+9TxP7o7jTch8wrwlYqyG5Sm5ExK1pE3QsyPXdQzQlvTbZoIjWBhCz?=
 =?iso-8859-1?Q?YztdXJRFo+phWsYHv9ZDASrcVMnmawxEexR029o7+dmCPTpWJLyb3z/yCW?=
 =?iso-8859-1?Q?0dX5pv0ruPTwh7a4F1heXxmGndVU7PzTgYNnsZs+VPbPxd1cqR7MqktTTs?=
 =?iso-8859-1?Q?n/G6i8v41hNBAujUwy8KGKRyqVvcMPc84vglWnPD5oah0+6HxpnrAh5YeO?=
 =?iso-8859-1?Q?DY7BWCc++7S6UPoBrn4yfuB7rE5QexUQrn4GGPChRfigD5MNndrBaqCIEg?=
 =?iso-8859-1?Q?aOoP5arhyPhvBN5eMSbDup/j+L0XC4yXqahWYr3Pl+5SPMcHQrLucwhQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dab40d1a-a16d-4cd7-885d-08dcc389dd60
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 15:40:07.3203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rj8HQLbyWiAiQfY95dFj7XykkcTXxFE+ORJm7FyLgcwTu1ahw7H68eB0jgHc2Js00KQS0TBs151IhfnSCncVUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8163
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

On Fri, Aug 23, 2024 at 08:40:40AM +0200, Christian König wrote:
> Am 23.08.24 um 06:54 schrieb Matthew Brost:
> > Using a chain fence is problematic as these cannot be installed in
> > timeout drm sync objects. Use a dma-fence-array instead at the cost of
> > an extra failure point.
> 
> Mhm, IIRC we converted chain objects into dma-fence-arrays while installing
> them into a timeline.
> 
> Doesn't that work any more?
> 

Thanks for the quick feedback.

As is, installing a dma-fence-chain into a timeline sync doesn't work.

The 'fence' returned from 'xe_pt_update_ops_run' is installed here [1]
as the 'fence' argument. This blows up here [2] [3]. It does suggest in
[3] to use a dma-fence-array which is what I'm doing. 

The issue with using a dma-fence array as is it adds another failure
point if dma_fence_array_create is used as is after collecting multiple
fences from TLB invalidations. Also we have lock in xe_pt_update_ops_run
which is in the path reclaim so calling dma_fence_array_create isn't
allowed under that lock.

I suppose we could drop that lock and directly wait TLB invalidation
fences if dma_fence_array_create fails but to me it makes more sense to
prealloc the dma-fence-array and populate it later. Saw your response to
my first patch about how this could be problematic, a little confused on
that so responding there too.

Matt

[1] https://elixir.bootlin.com/linux/v6.10.6/source/drivers/gpu/drm/xe/xe_sync.c#L233
[2] https://elixir.bootlin.com/linux/v6.10.6/source/drivers/gpu/drm/drm_syncobj.c#L349
[3] https://elixir.bootlin.com/linux/v6.10.6/source/drivers/dma-buf/dma-fence-chain.c#L275

> Regards,
> Christian.
> 
> > 
> > Also fixup reserve fence count to include media GT invalidation fence.
> > 
> > v2:
> >   - Fix reserve fence count (Casey Bowman)
> > v3:
> >   - Prealloc dma fence array (CI)
> > 
> > Fixes: 40520283e0fd ("drm/xe: Invalidate media_gt TLBs in PT code")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_pt.c | 34 ++++++++++++++++++++++++----------
> >   1 file changed, 24 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 6c6714af3d5d..2e35444a85b0 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -3,7 +3,7 @@
> >    * Copyright © 2022 Intel Corporation
> >    */
> > -#include <linux/dma-fence-chain.h>
> > +#include <linux/dma-fence-array.h>
> >   #include "xe_pt.h"
> > @@ -1629,9 +1629,11 @@ xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops *pt_update_ops,
> >   static int vma_reserve_fences(struct xe_device *xe, struct xe_vma *vma)
> >   {
> > +	int shift = xe_device_get_root_tile(xe)->media_gt ? 1 : 0;
> > +
> >   	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> >   		return dma_resv_reserve_fences(xe_vma_bo(vma)->ttm.base.resv,
> > -					       xe->info.tile_count);
> > +					       xe->info.tile_count << shift);
> >   	return 0;
> >   }
> > @@ -1818,6 +1820,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   	struct xe_vm_pgtable_update_ops *pt_update_ops =
> >   		&vops->pt_update_ops[tile->id];
> >   	struct xe_vma_op *op;
> > +	int shift = tile->media_gt ? 1 : 0;
> >   	int err;
> >   	lockdep_assert_held(&vops->vm->lock);
> > @@ -1826,7 +1829,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   	xe_pt_update_ops_init(pt_update_ops);
> >   	err = dma_resv_reserve_fences(xe_vm_resv(vops->vm),
> > -				      tile_to_xe(tile)->info.tile_count);
> > +				      tile_to_xe(tile)->info.tile_count << shift);
> >   	if (err)
> >   		return err;
> > @@ -1983,7 +1986,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   		&vops->pt_update_ops[tile->id];
> >   	struct dma_fence *fence;
> >   	struct invalidation_fence *ifence = NULL, *mfence = NULL;
> > -	struct dma_fence_chain *chain_fence = NULL;
> > +	struct dma_fence **fences = NULL;
> > +	struct dma_fence_array *cf = NULL;
> >   	struct xe_range_fence *rfence;
> >   	struct xe_vma_op *op;
> >   	int err = 0, i;
> > @@ -2022,8 +2026,13 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   				err = -ENOMEM;
> >   				goto free_ifence;
> >   			}
> > -			chain_fence = dma_fence_chain_alloc();
> > -			if (!chain_fence) {
> > +			fences = kmalloc_array(2, sizeof(*fences), GFP_KERNEL);
> > +			if (!fences) {
> > +				err = -ENOMEM;
> > +				goto free_ifence;
> > +			}
> > +			cf = dma_fence_array_alloc(2);
> > +			if (!cf) {
> >   				err = -ENOMEM;
> >   				goto free_ifence;
> >   			}
> > @@ -2068,9 +2077,13 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   			invalidation_fence_init(tile->media_gt, mfence, fence,
> >   						pt_update_ops->start,
> >   						pt_update_ops->last, vm->usm.asid);
> > -			dma_fence_chain_init(chain_fence, &ifence->base.base,
> > -					     &mfence->base.base, 0);
> > -			fence = &chain_fence->base;
> > +			fences[0] = &ifence->base.base;
> > +			fences[1] = &mfence->base.base;
> > +			dma_fence_array_arm(cf, 2, fences,
> > +					    vm->composite_fence_ctx,
> > +					    vm->composite_fence_seqno++,
> > +					    false);
> > +			fence = &cf->base;
> >   		} else {
> >   			fence = &ifence->base.base;
> >   		}
> > @@ -2108,7 +2121,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> >   free_rfence:
> >   	kfree(rfence);
> >   free_ifence:
> > -	dma_fence_chain_free(chain_fence);
> > +	kfree(cf);
> > +	kfree(fences);
> >   	kfree(mfence);
> >   	kfree(ifence);
> >   kill_vm_tile1:
> 
