Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1A6AA17A3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 19:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164C410E450;
	Tue, 29 Apr 2025 17:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aXbe7eqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5623F10E158;
 Tue, 29 Apr 2025 17:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745949002; x=1777485002;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WmrjfBH/gZZR5iRkPXIk8vwOEL7bgAD0wuSK9iKPejE=;
 b=aXbe7eqZlprN92wLAm3zns5Iq+6nKpiFi3newGJ9g7xW5XMeNbI0Q/dU
 Bv9eY0gM+076gxJ1D2xqfb1N+654eB/WMOKlFNgHjIzUG7Dx6ZUhjPl6k
 1qv0sYP8Y+u6trIrmvXqfy5H2c2Qoi/DRPs/d9wSr4J+7u7IqEK99lfAS
 FkKhEJOg7cU4qB4TLCeARJmqpvvq1OQhq/LsImY165orCwTh+n6+VoKpf
 2p7iOHv78Ox9ahDaFTgjLlHPxN3GJ05LWlYMFw+TurR032/QbumpTd4n+
 OnBSUWWJjVlGr1w0La5xmYQXUOhgim8vrhdT6LB35sD9+9D3ChdNz6EZE g==;
X-CSE-ConnectionGUID: fPwK0ajtQNiQ2BL+L6+Hsw==
X-CSE-MsgGUID: 0We0TSwFRmemEVxN+3HClA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51406075"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="51406075"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 10:50:02 -0700
X-CSE-ConnectionGUID: z1M/q1ykSYWWH1eo7VILiA==
X-CSE-MsgGUID: 8Mrv1I/bRsiEy9G4qNYS8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="134844516"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 10:50:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 10:49:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 10:49:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 10:49:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EbZkCOrT2e88I8wwp6Xntw1lRdhJKLm/sf2DKSkv2YWRGxXgI9HIsE3LToHbbKouY8OKboYMgwc9AYAi5LxyCN3d4pSRIP4tslIxnA/irCTE8dv0CVr8wONd6GMJkw1cMvx4GKrGUJODfHaxnj7AiGb0MRj3sSgCzPSLSpCosQyO2AlmzI2SravXh2ajA8nNTCV7mH6zcgBTLEEDpVwRo1+VvEq1GY/kmM2bWP/r3WX3oMuZ2ewNARzvItL7MWRfb3nv4aecp+vfROmK5hi7gJXgNpqp/hPidKjUVcvvf3j0QiRl70OFiq4f6s9nbb4kS78YiYk7qVzrqbUYiDZEqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXo2teHV1PkClQdZOe6pNeAnwJjcna4vyALn+IjQtKI=;
 b=hG8Fp6HSlwAHudfg+E5o06cF3HOv7Xq0003Da4DXx2s4HP8xTLvkPA53Tw+m4bbaPwyLHjKqFdSOKaQZJvUm2LX9jjLN6YTxxCrAfOJQonCeow4fgKg4uaPJ+D/scjxGWlIHcOEcdKUDNxeSRsM+aFtWCyAWYl5+AwaYZPdn1Z13yWnyEcB+0IR/zfqqi7HWm4YRT0Sbilohdmw1ckBw9Tdtcx/pamKjT/VLpZgtcT202IriwAsNVRDEoQtxxww10ZP4AuJ46jE8uOYDUr7FYSyCvbnZ5sUFk9Fp3GwGRgSQeTtTK6V9OMRkWJJL8+ROz7H4wSMfUEkQQO2CzjO11g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9132.namprd11.prod.outlook.com (2603:10b6:208:56d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 17:49:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 17:49:56 +0000
Date: Tue, 29 Apr 2025 10:51:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Jonathan Cavitt <jonathan.cavitt@intel.com>, Arnd Bergmann
 <arnd@arndb.de>, John Harrison <John.C.Harrison@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, Zhanjun Dong
 <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: fix devcoredump chunk alignmnent calculation
Message-ID: <aBERlisb42uGjZ8j@lstrano-desk.jf.intel.com>
References: <20250429073407.3505712-1-arnd@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250429073407.3505712-1-arnd@kernel.org>
X-ClientProxiedBy: MW4PR04CA0306.namprd04.prod.outlook.com
 (2603:10b6:303:82::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9132:EE_
X-MS-Office365-Filtering-Correlation-Id: c7e28290-a30f-481a-5b8b-08dd87464088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0Ylgr71wUKAWDxsUHzX7Tj1GJHs/gbTee+2+sY9nft5ngnFbza84DMguo6ww?=
 =?us-ascii?Q?2b7bVwJQxIWYbX2lu/8ElNSyOkx7XPcJQ7j3edSmf6GqheV3+nUouqZ93abq?=
 =?us-ascii?Q?OPZ4AfVYgoV8skwbJnz8fOIpPp8m+YS8Mxddq4i+4uTNNkvGLFU2jmYxdNxe?=
 =?us-ascii?Q?aNfDvpl6EkZ+TAjenUcf6PYhTpBJ4cZUC4kR5NmWAeKX0CiEEk9a4A6qCSoR?=
 =?us-ascii?Q?U1faCPEL8Q25m3ldFJkgeckmYA1Agi31/UeVxFiBHZwv0dDRuVWZjO752RFr?=
 =?us-ascii?Q?Cv56BLgvb+ABiisnMY43C1I0Yescd45H++XK4ghH4/QEnfLo1wadp85tZWPQ?=
 =?us-ascii?Q?+6fJkanFhfbRjyrcuYKkdbjxsRbboZtRJ/04U5b52PZY+Mh9/C9uga56F9sg?=
 =?us-ascii?Q?q85akWdx8jqcmxqbP5WIQRQ1nuBTr510OEnpzKNGHiDDOQo8zBr/nLnsxo64?=
 =?us-ascii?Q?xlynsv0PPZ58I7tBK+DzXSAq7nZowIq/cHvwrBgeW2TRyuBrKzsRtIwD10Tx?=
 =?us-ascii?Q?0OhSBwb9IEtyxjjUBvDzSfhX2S9S/WAl7G33Hm5wS2WjhFIrwzNoJ4lk7zfM?=
 =?us-ascii?Q?1/zC3zI+IoksNyMmFx4TIRyknqMuULAhuNrghFaKe63FjDsFm/BwXXyjJn+X?=
 =?us-ascii?Q?WSCaPogbOsCiu46HeDYzONLmWwcTL7ANrDxxkdpZ0iTvac+aAaMjIEMFHkeR?=
 =?us-ascii?Q?nlm0gNg3FuRQ9w2KAKyuo3rw8qu8McKusJwnT7B52YSzmLfDWZWeRjqEPSzQ?=
 =?us-ascii?Q?PhUIEz+wG74hdWWS4kRsGbswbDE0nIzD7DkNDOsa1vOsLI4DzP1FpNCwz5C/?=
 =?us-ascii?Q?xK61/WB7plI50kPKvCH1Ok/wCHiPxhdCvDo+GzlRaprqImPeiJ+hLEnVU59k?=
 =?us-ascii?Q?5DH8hbDc7mZmq4bnj8iO43hOMVbMRB68hrSyOKYvIfQeYqdu9okg7JjtLzN0?=
 =?us-ascii?Q?cztl/2Rtyo0Dfx2VyEILTbgQBse+OFDA20CCPjLLQls+ydxBcB/uDwTBl648?=
 =?us-ascii?Q?2LAGYBl73/nR040vn2HrwiEgJvkyAg6kuwoi1coGZ5CGUIafaXhk8tRzvzrt?=
 =?us-ascii?Q?ZU1HZCnMuZCvGKYCiAccwzvRX4o0Dg2pUBkl1VvEKExwT0JtbTGB5IlLicu+?=
 =?us-ascii?Q?whvix+oLrHvwsuL5U+SY65b6q44Hz1eN+3sJbrYOTP7l2yQk0urOD/h8CIRD?=
 =?us-ascii?Q?HYlGbbm4QulXaObDD5MQIZ+98vElHxf6qJD/ubu0kxBbHsacA07IqEu3sq0a?=
 =?us-ascii?Q?QYfyTOIzsMYfXUcxtWhPMX3x+hbFkKcvm9IAYczCUkjTYj36YId4V1moSjA+?=
 =?us-ascii?Q?wuo1PDjh3FJytyAUWkxy+l1Tr02N8JbMaDUx/HUaHw+SLZmeGl/MY/kS4gyY?=
 =?us-ascii?Q?qDwn1mA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MnUu8VIB/RObOob97uI7+bDjzVbbJ5GPCmHNJ5QFw/KGSG0GVw1cHPFyQjJn?=
 =?us-ascii?Q?VkBgwJurwtgflBU6GEi3gMEeKr9CiujgeOL9hnNwSUNhx4L08OxeOp4XCJTj?=
 =?us-ascii?Q?EISkgn6TT6PiIJxZlsiNJzz0YGbNHmz4DbUtT51Qt6cCp68fB2ony/MeM5jK?=
 =?us-ascii?Q?RaVvEAJs6yp/J2agDwG5d19Aqh6JXBFuAnzKeN7yXDa+UkgvTHn7H0iiFLXL?=
 =?us-ascii?Q?GccbcS2ei0S2jbBR3ZVhjjcCedOpPtaJvBUxbvFtWs6WjOddvv2WGj/ocppy?=
 =?us-ascii?Q?I4RIZlHcClHUDbT2tHq1rMu3BScmiuEBjX5dXmuBwKdY+LUchtS2YRJLt37J?=
 =?us-ascii?Q?Ct2IbKu64ZedBrM6WC93p8pRIWPG8kWiPaMF0Rq1mw5OkNuxmJ0/06RrhyBz?=
 =?us-ascii?Q?5qn/UMdNqFDBDAjwqRLuqS+XFqa4cMcGfa7HebYQTK16jdNxlRAop6/JRk7e?=
 =?us-ascii?Q?qkKsIGZaEiMds/yqved85Vd6XK30EjRfb9IeBsDj39NmALqucVMZAo5bGwLG?=
 =?us-ascii?Q?FHZki0U5U0uZzifkWLoUyUFh2O6BHS88rfkam8uoOO0WqRJcR4ZTR8nAHeqy?=
 =?us-ascii?Q?HVbUvgXWHJeqQaEWleXevMDnVAdMm98g1jkpX2Qvw8MItNsqup+5MpXXud6c?=
 =?us-ascii?Q?wCqFosk2V3rrJ1ASKXzOa1hq1T+bxaVeGuoryQA6HW8S4cescbPAU9dXjIKT?=
 =?us-ascii?Q?kZLiXvK4re3oRZu+lgvYmn7u+fGb13JyLE1cYNi+qOKQ8P31brCDc21FaCgj?=
 =?us-ascii?Q?Pna/ZSmAI64WtCrAOsorQ2pPAB4gMvhP/26aF24vUNacOR9NKWxupGXMF31+?=
 =?us-ascii?Q?v03zy9KDG32V0IfNBXq7fjCLd48klOYBv3/uOG8Eq3dvxC+QqcKPi0d6qker?=
 =?us-ascii?Q?oYUpKhbW6OxjmQCZLDAKDLL0pkwteeKurBrQj6YPxfb9kZCiUnhp1h6dlxG5?=
 =?us-ascii?Q?J5EyY78fROnzWRx9pEwE1yl+rbuZIiqGu6OUHX8ev9AksD+q2uqGcOlvkLiP?=
 =?us-ascii?Q?rrI0iy7FyW7oXI1jXReb14y6n/5YD8RoeslFP3B6qwuJqJNx8yidWH3beiq1?=
 =?us-ascii?Q?ozn8Xd19KXRinsUxFbYW5YM69f/lZ4ijTLk7zAvdVO+EGd14bd/1xE3rdHbG?=
 =?us-ascii?Q?R3zDI4JCSf9JJbMDantG2ZTwMUIiChIJqaRu1JpIUIpWZd2hkkX4P8MiqBEN?=
 =?us-ascii?Q?4kNKt1QzvU1B+zJ76MrvTaWt6gBWjWyZaMPECmjGm4RKzwgovhgyKhYRpYek?=
 =?us-ascii?Q?vJ4JNtcKHpfFRiRBpEul0YzBEn09DB5yp/Hgkh1YWt3n7XBhsBgAfIgvY9WP?=
 =?us-ascii?Q?JvzkHOpKLft5+RGFM4yDoD8ptr8UDBOHal+b96n3FYAcf+2N1lksXBSlzVZ+?=
 =?us-ascii?Q?TrwX3/fhL6ft930fH9ClkimlGd8Ti70aLk1IrbiD8pi289ImKyG4YGSZiZsO?=
 =?us-ascii?Q?MHvRVth+LPtxvUh/ooHJ1BJtnBhkA7aY4RjHcHU2Ask1Pn17ncGKwrwgLFD2?=
 =?us-ascii?Q?EHOyRKUExgHaV/1GaE9J6rdmtwEjjdapAWPBFRu/rLGVJaMNgMloAk4oIGof?=
 =?us-ascii?Q?wIIqSoCH2+NB8c+J4U9iUgGDKCU8dSxM4lcIK4l1j67qHcAf0+VicX02sZjk?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e28290-a30f-481a-5b8b-08dd87464088
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 17:49:55.8805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bZXHqkyTt6n3yrfMF9lqHrAevgIy3AJm2cLWv2Lgim8BMExsMuK6gSPhywQOGnesuza8imoGlsrkRTXAwn3fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9132
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

On Tue, Apr 29, 2025 at 09:34:00AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The device core dumps are copied in 1.5GB chunks, which leads to a
> link-time error on 32-bit builds because of the 64-bit division not
> getting trivially turned into mask and shift operations:
> 
> ERROR: modpost: "__moddi3" [drivers/gpu/drm/xe/xe.ko] undefined!
> 
> On top of this, I noticed that the ALIGN_DOWN() usage here cannot
> work because that is only defined for power-of-two alignments.
> Change ALIGN_DOWN into an explicit div_u64_rem() that avoids the
> link error and hopefully produces the right results.
> 
> Doing a 1.5GB kvmalloc() does seem a bit suspicious as well, e.g.
> this will clearly fail on any 32-bit platform and is also likely
> to run out of memory on 64-bit systems under memory pressure, so
> using a much smaller power-of-two chunk size might be a good idea
> instead.
> 
> Fixes: c4a2e5f865b7 ("drm/xe: Add devcoredump chunking")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for the fix, I had similar one [1] but I missed issue with
ALIGN_DOWN.

[1] https://patchwork.freedesktop.org/series/148301/

> ---
> Please test this with multi-gigabyte buffers, the original code
> was clearly not right, but I don't trust my version either.

This was tested on 64-bit only. I do see an issue with this version
though. Inline below.

> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index a9e618abf8ac..4eb70e2d9f68 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -177,6 +177,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	struct xe_devcoredump *coredump = data;
>  	struct xe_devcoredump_snapshot *ss;
>  	ssize_t byte_copied;
> +	u32 chunk_offset;
>  
>  	if (!coredump)
>  		return -ENODEV;
> @@ -203,8 +204,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  
>  	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
>  	    offset < ss->read.chunk_position) {
> -		ss->read.chunk_position =
> -			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
> +		ss->read.chunk_position = div_u64_rem(offset,
> +			XE_DEVCOREDUMP_CHUNK_MAX, &chunk_offset)
> +			* XE_DEVCOREDUMP_CHUNK_MAX;
>  
>  		__xe_devcoredump_read(ss->read.buffer,
>  				      XE_DEVCOREDUMP_CHUNK_MAX,
> @@ -213,8 +215,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  
>  	byte_copied = count < ss->read.size - offset ? count :
>  		ss->read.size - offset;
> -	memcpy(buffer, ss->read.buffer +
> -	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
> +	memcpy(buffer, ss->read.buffer + chunk_offset, byte_copied);

chunk_offset is unset unless a new devcoredump is read which is every
1.5 GB. You will need always call div_u64_rem outside of the above if
statement.

Matt

>  
>  	mutex_unlock(&coredump->lock);
>  
> -- 
> 2.39.5
> 
