Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F252DA7505D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 19:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3EF10EA77;
	Fri, 28 Mar 2025 18:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gOr55O5s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B6410EAA3;
 Fri, 28 Mar 2025 18:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743186474; x=1774722474;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h6kDrahdJaJM8e4b6PuYSTmTQnz+pogqsXgSjBLrEVc=;
 b=gOr55O5s58vhfwy+TqqjGqeJZnidcjoIww5+dvJibWexQwaFX0H+k/Fu
 gO7Q4Ny8szx5YYlSWbsNW5TXQc/CMa1P+9vl/mZoX/uzhrf7JJH9pt3Zw
 cINmZJ2o9vv9nwzD2qEe0FDHYdC6EJ62pWP6QCR0C5Qs+x5FwzEasI7x4
 rspvgpRdsRuWItpznTPBm59VIdIecqmmthNUqAkmIOuqyYUOh4qn12c7v
 s7e5hVpcU5+7OgTw+9IpnK4YIkdYHKKcIwMdZOm++hl/rGu/RMqE+Kpwg
 /FdaFUNxohsgyhC+V5qUbpTJ9GqCLUJHeWZest6SkQ6g3vDFzofPGbDd5 w==;
X-CSE-ConnectionGUID: KbW5ITcNTi2HkeKNR9PGjw==
X-CSE-MsgGUID: cAGYoERcQvy6oblkgb7glA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="62090613"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="62090613"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:27:52 -0700
X-CSE-ConnectionGUID: gbFKFbZzSVCtiowS3zrBaw==
X-CSE-MsgGUID: 55eLb8n4TkKmvv9xXfAUBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="130728772"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:27:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Mar 2025 11:27:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 11:27:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 11:27:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTJRv8rL2AClEe3kySoAo85YyoGc6sK5J4Jrgny1htOWp7Wg1DzLDOKERu5ukOLBuOS5dz2EW4AC44BzaRmVZ9kvMIfgwEF6RLEEQBhLpu97lu2SpF4lD1TawiVEniDYd3tw9qLoqgsJZBSaQZlkk9w6J8tOBHYWrukFlu1KFFuOqXg1eG6Ng0sgj8yf+wcB/MVrWTzlYQhEBjiv2G1i3zJEA3k1Td07xoXW7d9F81yiR1doNueotUFyvB2BrlvSLvcuIdNUO3CMahliDSHDFTFsMCup72VIxjfOJ1xyrW7rHVBIbDMgCzPrlsm57omWnVXyCUXSlvvTQuictGApwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJjrcNxfRf4uBPaS24lO813RoJQGIZpnLopPNXbaY6o=;
 b=uBhisXRtNA6alAT/qwra54h/h3h/J6nnDjwjg8SZcPcnQa3LDpZ/sUoj6MqDY1hVWSdWX9gvSEAOYEALJ9LSYZ/x5hxdSJbDyXZQ59eMLvQ5lTH3xWDqZdxmkIMTs9kfxTJ+6blaAAwCPhV+jvui6Ciwmn4bai2dhqyFyAa1zdQX6U7xoPz4+3+MXNtn6s8WhWW/vKSScIMGVmzjGA4jhKPCCU82l4CcB562SkUvboxArvLh+RH9g5zcUHs7JHPvNKlTIKpQfGszRqjIIVrievUvmkhxLs6D2AhivWKfJlOoTRy+9gJKdNjFcb1mDi2+npFsgzU4EI8usWHfVoIoqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN6PR11MB8145.namprd11.prod.outlook.com (2603:10b6:208:474::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 18:27:50 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 18:27:50 +0000
Date: Fri, 28 Mar 2025 14:27:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Oak Zeng
 <oak.zeng@intel.com>, Matthew Brost <matthew.brost@intel.com>, Arnd Bergmann
 <arnd@arndb.de>, Matthew Auld <matthew.auld@intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: avoid plain 64-bit division
Message-ID: <Z-bqIaInowqtHeVc@intel.com>
References: <20250324210612.2927194-1-arnd@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250324210612.2927194-1-arnd@kernel.org>
X-ClientProxiedBy: MW4PR04CA0123.namprd04.prod.outlook.com
 (2603:10b6:303:84::8) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN6PR11MB8145:EE_
X-MS-Office365-Filtering-Correlation-Id: 071a2cf2-06b4-42e8-bbc6-08dd6e263ec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TP/O9HEQFwZmSk6efiu9AQENKGZ8z5JpRxRcqozbujUd3boFP2+iOxQ/AkTO?=
 =?us-ascii?Q?OmyRbP1whyMH0RQnFKjnL6IKVo2snA/WZ9JQ/4BVFE93lP/FULd4k9XU1PH4?=
 =?us-ascii?Q?I+6kKbJYip1M6YGSUnFFWt9l7ft/WAFiJUf+kWI967BWWzgo0JgdxRIQ1kS6?=
 =?us-ascii?Q?UjP4Drnzd4vi4E17Y1j1XjTpbSc13G0eRZvsoZuuTT3qKu8aXH3tZF327QNq?=
 =?us-ascii?Q?7Uc4K+P0kespq5RAex0fOhihRAhQzMyDNm0PWTwTk28fzms+O3YbAOWIs0TQ?=
 =?us-ascii?Q?ChYHP4Wx2XNDKO0AFxmZmcP7gWxrCvZCKC7zKIZ2XkO9a5r3f6dDuv08ETHo?=
 =?us-ascii?Q?vxOF0u1uwMNkAfb8pZLdN0ZYtprsiDEE29iUd0M4UIS7VbpB2D+AWshycUa5?=
 =?us-ascii?Q?lo5KTnTJV18UO7ChlA0XCsaUgDBHABhr/5Ki4TsymtXy5bFcrWEt9hSKTzao?=
 =?us-ascii?Q?LoFzrY3OwIGBNShev5LLIcTn5+E4rht0Aw4+mVfQ1GZb+qWX3Ry5vD4VGLRP?=
 =?us-ascii?Q?lNr2YYaxb9h+9LmL+X9eOrRO6QbEOSeSnmmcyglUgdJ9g1J81HNC5dh495mZ?=
 =?us-ascii?Q?2Wc2aCWMkUUovfzMZ3GYHOFDfGvmGfgW52tg7aL1E1RjvCSY6eQZjRXJrg74?=
 =?us-ascii?Q?OH8Elgjph474bzy+5/lWyqYe96NpZd2LDOj/Gy3P0Gk6wY241pEyDLV686mI?=
 =?us-ascii?Q?/8MpPcn6QeD9wqmalOfhnZOiWU2Oq0zH6ATQSTzLY7PsZ5p4vXycdKPxOEcu?=
 =?us-ascii?Q?ki4LNdCcwUNHfp75upkh267cbS4SOvkak1U6sTCw2TdrT64ptZnW4cD7VXMV?=
 =?us-ascii?Q?RVDG9ABaTJcZxy5R0qkYYwlUcEaQ+tyARA1IWh5NOLh3N8Ra2Nhw+nLgXyeX?=
 =?us-ascii?Q?uejd8AYe4qnoUEHeaz5orZDqFta2UpfDcqW3n6uAQyeyquwEY1gIqxpxiE0w?=
 =?us-ascii?Q?WU6uC36WrK1w7+iRGC+D/YcFbya95Tf4V0x+ozjL3/2wia6G/5/Or0UCb0aI?=
 =?us-ascii?Q?dfXPndIWVaWVfK4DNkZpp/61Ajdyuf8gadmQ2ZIkxUz3b52gO5NyXabHhVTp?=
 =?us-ascii?Q?TxHsiM5sW2r0iqE4HGUngXQSPGggxCD8PINIspD4IbIXkarea1LnA6n74QxU?=
 =?us-ascii?Q?vrpjI29qH3/e6LC0ZjsBFxLGy07sM4QxSf0sZlaDf+u9MvTiUoMQhMNjirGR?=
 =?us-ascii?Q?6iUaOXyVWpVLOHckBDoTbGtxreWI+Rdh9N6bkprJZoapemMGDuMjIkh7KbI4?=
 =?us-ascii?Q?YO2DYntLz9iGH54RWHNGIjEmsUtW4TDaCxpvRPDcHVGzLgqdUzpSPafGlOKU?=
 =?us-ascii?Q?NKhP/O5ta2ab50NJBjdtnfwooZl3WMIcAph6ETulr22asO0GzzjsGX8nUx7b?=
 =?us-ascii?Q?4I99DtSstS3oO7fCrr581T2KxNh/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+0QydB72wjvoBMttqW1I0yVfCjeyq0S5xKbXC2d0h0NADeMsIZxzQPH+uCf6?=
 =?us-ascii?Q?x9qUMbQx+EevnyFE/GX2IVG/d6RfsQG+2f4Qll0OIG6VobRkIF2+sDnzfJp7?=
 =?us-ascii?Q?hJy5HQTkehiNc+Zm/oECHTtrK+vJ+iHtAkW5tFPrY8R0nidQf1GsUsXXnmdf?=
 =?us-ascii?Q?iFK1Qr8I74IgvTJZgkCwxmnPstmV5YgWcbvflq4QccSnVTyWVb7YsTLmDiFU?=
 =?us-ascii?Q?M/AXxcQVaMEZPzuiypyhmmcln4pduDaYp4NT9XlG5csNDLB9nr4MT2eK+NwF?=
 =?us-ascii?Q?MWUf2BGuYvw75EVS1j5HHGIZoUinCmbMPyrqHNvZzXOqCSy4qnGORhqXaFCB?=
 =?us-ascii?Q?e6AX8RBa4uWGV0ruhaoebiML6aJSG7Zui5zQlX6g4jYJ90vSQBaYOsegi1ks?=
 =?us-ascii?Q?AaFtRz1rDWbg/H91vJI/fPc3GJvl6K/d31rUVT5u607Dsxrj0Oq4BAB2kUvO?=
 =?us-ascii?Q?5ytaGc1e5KNo7Ev9gHws1+Kt0r5D/av0MyxT5cLXy9Na6bmtgpsrYtRB0XNl?=
 =?us-ascii?Q?ZUVAqr7lAG0LjLMjsotU7GIiVi7WbnIipAyJ7dXjPtgv88a/6LbE1T4OfJ95?=
 =?us-ascii?Q?oGOU8I3rRoCe4mQBVXjjA8e0beyA+YoDNwhBOf69m1tISmyN5Fq5FGL9VD4S?=
 =?us-ascii?Q?b/8Nkzm01M4uIJS5XtALxluw0PP1a4ieYuEV/OGZddYMmPgCQ+59+yYcojSV?=
 =?us-ascii?Q?pR40XIuY1opwD98rwdicQbUxvy2/aTMiaozGdWw5W4Ds2ALxUIwTAhVHdPA+?=
 =?us-ascii?Q?+MiMEAbX7sWU4Ly4ZgZZQDQVy9AGtDQ1I/B/ft18Ip5zd8PI7kPQSPfWRKod?=
 =?us-ascii?Q?fVzTPQE5Vr/lFWv7mGHLAQFXlN2AZJvlfC/+TF8Oi9dtj3V/1ITEtmCwPPdU?=
 =?us-ascii?Q?DCNtAIdb5c18H8USYWj1GMvNTIhRJGF+p6TiOX11hCD98BpBZ2u76z3U7deL?=
 =?us-ascii?Q?V7l+5Vzw68w4nnKgAM8XXwzOa81/onalDLQ8wgzSqusFFBnINxbKcqcIV6u3?=
 =?us-ascii?Q?pgVScF1ku+Nyr9zPTv34wqb8Grn7HmIbW4OfGCE8KzLqrzwoxAel74ar5OBP?=
 =?us-ascii?Q?PR7dL1846xziTF722gScUlQAmouZZzeHFbH61KHVbrlU+uqf2E9l3Be2Qic5?=
 =?us-ascii?Q?ydRu2EGJfvOHCb0iV4UeTQKwXa6QEnhYy2yE1e/MV5IxNE4rLivIeSMOBzjo?=
 =?us-ascii?Q?6VBQN0rywz1rKkxHO34NS75sUthwOJvhJYXOYW8epXzL27sixyqr6PIDD+cO?=
 =?us-ascii?Q?7zr/3lspYSjcG2HZRJpjFV5WpZ0Nad+68LYOMoV8TmqgKNbN36yuYdXkacSh?=
 =?us-ascii?Q?Qg0GKwKI1xTIw1QpsX8X1FC5ZhhWR4O1sAF6KYpe1P6mj2Rmwy9oag3D1+nr?=
 =?us-ascii?Q?jIR9oxPIew1lS8f4RaLKqGQf50QGCLYTbESFjmAx1VKKN8gNe8Wwl+cxgJ0K?=
 =?us-ascii?Q?E3bXu9fsgJcyvYcGNj1yAvxOLMxGyNVC1dVbbiYB08P0wgmVmgFcjpnwHwaT?=
 =?us-ascii?Q?W5RFa1Eh+VlPtNMNc9vEa5q9Zg2Et6NiWHyvzW1p4M/rw3JPVNHKQwiPgm4H?=
 =?us-ascii?Q?FNwDQ7HBd7+jVFR+xB8oVVjOAgU+i8/jwGOERFBOlCwDNdfeiH0B2TP8gHWB?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 071a2cf2-06b4-42e8-bbc6-08dd6e263ec5
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 18:27:49.9273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xuFvIxFA0oncRQGffdP9LqmTkh+cUmCpbXCGfXNpnOcrzUclaSR13ggFDDWOYBZzlmlBDZg3KHkXVRQ0NDUnHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8145
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

On Mon, Mar 24, 2025 at 10:06:02PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Building the xe driver for i386 results in a link time warning:
> 
> x86_64-linux-ld: drivers/gpu/drm/xe/xe_migrate.o: in function `xe_migrate_vram':
> xe_migrate.c:(.text+0x1e15): undefined reference to `__udivdi3'
> 
> Avoid this by using DIV_U64_ROUND_UP() instead of DIV_ROUND_UP().  The driver
> is unlikely to be used on 32=bit hardware, so the extra cost here is not
> too important.
> 
> Fixes: 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushing it right now, thanks for the patch

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index df4282c71bf0..aafb6209f2d0 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1547,7 +1547,7 @@ void xe_migrate_wait(struct xe_migrate *m)
>  static u32 pte_update_cmd_size(u64 size)
>  {
>  	u32 num_dword;
> -	u64 entries = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> +	u64 entries = DIV_U64_ROUND_UP(size, XE_PAGE_SIZE);
>  
>  	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
>  	/*
> @@ -1558,7 +1558,7 @@ static u32 pte_update_cmd_size(u64 size)
>  	 * 2 dword for the page table's physical location
>  	 * 2*n dword for value of pte to fill (each pte entry is 2 dwords)
>  	 */
> -	num_dword = (1 + 2) * DIV_ROUND_UP(entries, 0x1ff);
> +	num_dword = (1 + 2) * DIV_U64_ROUND_UP(entries, 0x1ff);
>  	num_dword += entries * 2;
>  
>  	return num_dword;
> -- 
> 2.39.5
> 
