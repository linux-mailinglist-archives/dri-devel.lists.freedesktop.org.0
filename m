Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF49B87E2D2
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 05:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836F910F230;
	Mon, 18 Mar 2024 04:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hlqVYZIr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5832810F230;
 Mon, 18 Mar 2024 04:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710737111; x=1742273111;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LcrXIgMUw0BzHJ/xv6Xw1l41G+A79gtRO3BWuECei/4=;
 b=hlqVYZIrEel0xBJQl2EOMY2JvTdnSsKDFzm6cvd/UiGFVo+JeCVGWvrY
 dWJBeJT+UtPEGXKs6joxzY5L3C6kxL9hASSJe5s9xhxIxHqexJ3KCsrjs
 zHODJwUNSQbRreZtyUMHX/9Uk8PhhCgVGN/jLvOko5ZJfRun3oXNrzKXu
 YxEfWVh1L6lNuaK0IEoXURKjS7u8pPtu+UpattkwotBH2Qyph0/ZB4FwE
 PYTQsdz3QXi67wbCVjGo7isjJCoYDHFLuXI0YGa4UUmkO5o3NNM1HMf67
 PJD3NveKlmOlze17a6bAI8y+QtJrQH9Leogqo9i1vpEJoUBzIB9AysxBc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="9363042"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="9363042"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2024 21:45:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13824270"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Mar 2024 21:45:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Mar 2024 21:45:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 17 Mar 2024 21:45:10 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 17 Mar 2024 21:45:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGG2SvazbbLfj/LrS6kTzr4ZFs3TnfNpzDy52h1U5zzotsJJh5Sq5ZWMtBHkRCVVDKKHnjT1HRqGXfAI80bcIXQJMAixu1hBagpHxhRzOxj5PsGnvbL7oMkBUPz5mARaWHyCbNMbnzzUAzq3ESf1uBn1rkWsn3b460U0N4l4aT9+rEg2OCBI3c208wIHAUNx8uv4FS8+NIwsHO8LI826yKZJVrHWS5R0TqfH6ukLq+MqScHd17IOrPOiGlAqk5oK9CL6gdEZhFaRHOwxlgw3UQiXQTNfgEqw8RLBBe9fAblg4cBxa/Hffcho0wslL8AqkCIyKazdD5xJy/+SDieQxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2sS0zymcsVKTfVdQseGnHu6LjdCJX8u0+BDIdPZSLY=;
 b=RuACDTIY2SCTBOLy7iH6NkBIGwKeKzYZEU1AleRQorFGZHwuAyDu2yD7at+7uLuAx576yfl1AC1uTUBpEXMUwQNdBZy/XV+x2W0P8/b729ixMyUXcbLunXfPa2P5mkaYv8HrZNzIZEy8PHu3KMqLriO2ddBeT/qMWv1umGJVn7i6ah45mw7le716xyc9bsIo90fWP6r68NXx3zvSfIio0XDF9U8p3IJWeYgYk/DnAE88B8Pbwgh+efak0JP9OOxBkHgybxjUAdelGWP8v2E/FeRMgVv0cvr8dUBu3ogrv11AE8vTFclTlrr3I9Ogz+56cPWnhnA5nXjEuYTGX+YyLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4642.namprd11.prod.outlook.com (2603:10b6:5:2a2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 04:45:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 04:45:00 +0000
Date: Mon, 18 Mar 2024 04:43:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: wangxiaoming321 <xiaoming.wang@intel.com>
CC: <lucas.demarchi@intel.com>, <ogabbay@kernel.org>,
 <thomas.hellstrom@linux.intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: Failed getting VMA cause display stuck
Message-ID: <ZffGYCzt7dUe9Ox9@DUT025-TGLU.fm.intel.com>
References: <20240318041244.1239610-1-xiaoming.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240318041244.1239610-1-xiaoming.wang@intel.com>
X-ClientProxiedBy: SJ0PR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4642:EE_
X-MS-Office365-Filtering-Correlation-Id: ed39fdb8-ae63-4def-b661-08dc47062b6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZbXj0ty16vLZFYikiNM1LYcd36OgyCBz9+gMM+uqalBnrP20pcPoDrb8jUkQRP+S4WFA/976sDu/S6UXRqIu+4zRCTHEyDEfnlxzBeG01yml1EXeJNCqTy+cNPgE7VOyTKyGAmtjjE4JYf/1t9A6F0iXncKj8IQKsYak3vtTDx5eGjkXhKWMKloaid+dUo7+B1gkZ8XLDvZs21jyqNvr9+2hZWB4rcso4HueW9tcTAvT6dnyMMZwre0eTQaGGrtBZmu8f4Ur+W0+Qw2FcQvsvO8gQSEqu78WHFxaI6Y9Ai7hForsnINcRi61S46OXpoaMJeCDh8ebWjXBxYxw04c/BtQfE9encpMdqdvMRwbeUU1Pt3tRpEqnO44wOcsCYHSvfuOI0uJ5jJN3CLcOQk+h4NZnx6VjwIg/aJKsWvSKJkwt7J2pWRjgjkReQuD4uhEqZ96vEauf+u3Is+xX3jopgbQxxD3/0FjtMeHV5/OAM/WFdvM+HYFOf3U0aCkuGgr7MPyTdVffmxd7CJTTzT0rg8dN9o52ob/TdYxDFdL5nG2x1Edxn20u96qH2EztbKVwblDCckZeaSniBvYrK/n1PIPdi9z8q1FqXXAewcEhcw/gaC57xWmxrpDzOUFulCRbKd2+wCsmQ/q7BOsimNCN/xBsAHx09dhOwCrWoX9Aso=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ilRN5mKyTvJ7ua6lIidV325+8UFdEy0+B7FAvz63jl4Z5I8gd4bU6O1SV19p?=
 =?us-ascii?Q?Yaiy4bDiqHJky9VTCYo7V0Vd3HM7XrKP9l/AfiF0vBXkE73YANKTVyNoM/XD?=
 =?us-ascii?Q?ITRMGgjaUCEqv0jC3Z33JRFrChfcyF0LrUbGoD86bVQVIihfKC0lH5Iy6/L2?=
 =?us-ascii?Q?TRguG71PCq+dfig88et5PtXzecBBOiEpExStVGfHerlcXfGsgYYq9Pd4+NgA?=
 =?us-ascii?Q?4tr4ogKARL/pLFbiDihF1JgvOT/snLEOT6yfKRrKSF8yrA7C7I4tbrQhztrx?=
 =?us-ascii?Q?j/WBuVJdvCKjrUClULlc6hlIEBnLILRrt1TEPzzJ+5Lwo6HgYnZLsDDVplz7?=
 =?us-ascii?Q?CarSQNnf7r89BopADrNqlQmn6NfCAsK3qgJDnzmqH+oFSe8y2ZKS/BaRMJYN?=
 =?us-ascii?Q?vRPi5bvgZyck1avN1fyfuu7+CwQChWNN+E3Cfo4T0+YgTyuX/FrTtOM8zvfQ?=
 =?us-ascii?Q?f5EOU58OtVfI/tdvKtb4RvYgYYB5MIWe9L0TU1vrPs1OqjETYiZFSeqwUbh8?=
 =?us-ascii?Q?LAB9J7XZzW3ScCjgT6MxoJJ5HQL6bfFX3Rhv6IZaKu8+GU60pNCTqdb9xMT6?=
 =?us-ascii?Q?gs14nEzyqDd8Rr/L4UQ+xC6c+/1ih2YuemWWlOdBkNw17IdzKdFDV3YqEeDX?=
 =?us-ascii?Q?4u8oZh8ejsVu0aqr+Jd+AjqTJRw/oWC7OWspMY5qjkysG3jt3MG7oIMbhKeX?=
 =?us-ascii?Q?XphWBnxkTAbeU3KWnCS+O07YpgoZlixqyrwcOul+7z10Th02hrktNQ9H6hzF?=
 =?us-ascii?Q?w5THW86kyb+Xxqdlr7NQWZH1ECQjGJAZltMuFTxzdIbyNgqP0HPDA+ucBA+0?=
 =?us-ascii?Q?ywlj0l/h9MPknu6H5It5iaUnkFmlon9dPtpDMY/TQGGXe7qHs7jDFIpyXR2c?=
 =?us-ascii?Q?r2xOLIb6VFmK3CdgALqH/FCjLMzTzb6ks3Xfw0HnCch5CPDXo180nqEd07G+?=
 =?us-ascii?Q?JYfKPVHz8rr83EYw8spQWRWpqjVs7XCFAonK8C9gFxBLXSc7afPn916fsKsS?=
 =?us-ascii?Q?bDkfq2N6HdScRAoAon2tyAFUX3rKeSbpFHZ84fIWKs11JxrtEohXm3zyHsdf?=
 =?us-ascii?Q?y8TbhlhzpdoZJ1eYF0DUWZ5V9TfVWMeTgaVYrA3l14QHPe8M5Lo+AvFK9TVT?=
 =?us-ascii?Q?2qIbijGlkEPdWBL1qaKICADKiN+Mm3gtP5yepmT0OGNHoz+ysMirIQzJ4Ty4?=
 =?us-ascii?Q?ceGyQnCV/Gn1HOHgIVUClWRyMNCicloJCRrYIjYOvYsgK2ByA6djydynQbkH?=
 =?us-ascii?Q?0ukmH1q+TGZRwELHQc8z/ozjQc7lFOpiW61KG8Qs8MrU+yYBLjXRrLHAV0Nm?=
 =?us-ascii?Q?+WekRT48wa2jSFTL4p7HJuN7wS1Rw6Ud4QYoPzF7e1BCxLa9D0AUSaNakZN4?=
 =?us-ascii?Q?F84DR0J4WnVX5gnQCp9dixyNJiUOmgyTyJRpDkNUN3UIAt0PILj+ScKvTrQi?=
 =?us-ascii?Q?Udl8T6zSW5VIpmsN1tHdzcFJcfW6gJRLfJNMmH2xQlZExfr1C1bySJ2ABeb+?=
 =?us-ascii?Q?ZrpzVLu/bduKDasfFHTBIYpNu4zL2OAEqd2JX55mDLDQGj0zSoC8p9EdBOhs?=
 =?us-ascii?Q?/8jslpcBkf5p7flVs5NcgHXEin1nUsVWao23SmEZGQboDMWkE5nxkUCBVXLS?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed39fdb8-ae63-4def-b661-08dc47062b6d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 04:45:00.5067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 875zd8JESIZBi1PFSdt1muggPLddtuen9jVgLZsp/fykezjjKeQmK+RID1pcp0dXyvbohi8iBAfY4+6lWWY5zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4642
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

On Mon, Mar 18, 2024 at 12:12:44PM +0800, wangxiaoming321 wrote:
> The failure of binding VMA is duing to interrupt,
> So it needs to retry while return fail.
> 
> Signed-off-by: wangxiaoming321 <xiaoming.wang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 99aa5ffb0ef1..d33476b631e1 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2621,6 +2621,9 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>  	}
>  	drm_exec_fini(&exec);
>  
> +	if (err == -ERESTARTSYS)
> +		goto retry_userptr;

This doesn't look right. If the user presses ctrl-c we'd restart?

Matt

> +
>  	if (err == -EAGAIN) {
>  		lockdep_assert_held_write(&vm->lock);
>  
> -- 
> 2.25.1
> 
