Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DFE8A7A3C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 03:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B12410E614;
	Wed, 17 Apr 2024 01:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yh0OQdw2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C30C10E2C5;
 Wed, 17 Apr 2024 01:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713318285; x=1744854285;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cqjCxcuXlahlFkhpob81PViKegia/QehYirCNkYXJ4o=;
 b=Yh0OQdw2HhUD3S6CpIQjbQpS+gV/hN7zuy+EiWZpE4CdLXzdxt+tNjhA
 3x2TJGtEnM7sY75RAfucyVlcbMIoLn1xQvnUleDUJQ9Iv703cH3fIeKyd
 uYk89j9MFb5kJems8Ou7qSTIJQ/Ryx1o35z2xOk4TS3jMnji/XYG+Xgl3
 q5JtEoX6J3f2l/BOWGr3Mt3QUjqJ9Qps6yw1D3HZDQi5DUR5VBJlLbLmQ
 OkDTWrtGVgjlm1rKKQysdHMZzHbPhVY3oY92xZw2JjzPSuzdbAujK4GTA
 FQ0QvQEkYeEO8f7kSBoOjFkmSosqPeQoRA1LfKvzToDSELsHQFye0UcQo g==;
X-CSE-ConnectionGUID: hCaYrBzYQhiJ/TjLn9LlYw==
X-CSE-MsgGUID: JyO6AD6qSyS8RC4Q3IDNpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8653275"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="8653275"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 18:44:43 -0700
X-CSE-ConnectionGUID: jKvojHMXRli/fcFN8CPrAA==
X-CSE-MsgGUID: dWSUMUEVRR6ct6B3S4AT+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="27253351"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 18:44:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 18:44:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 18:44:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 18:44:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODl4ego5rHLbRiZlT7kshMo5CBJg8DA3/51C9BKfXxvKFNDonosbF0OETp2oE7pBz47xaF6YpzW/37KTdKweuxDVcN8Dnd4ccjMmqSsHixdTGWkeHIJLSRI1j9FOeDOW49i2+um8cOl6nrCrVR0xLthP1wKZmqqA0JVWny8ZNppOwLEp4MkRRVwFe8yQdNcDzHc6JgF52+jzxwmytmAseUDifhIIbV3HE0Xv4oh+cwu0y2IfTCHEVCwcLZhoX2KcoFGKb114tnj7l36amFgsxnKnnOYdHSPGb1ejoOL5dIMgDlRijOGnKiu7RDQ6hJznoDatxZx2+xCqg9MjLVVZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D78NvCopoIL6sjnNqONW0Bd0Kiz22RfkBwcVfY4YVHg=;
 b=XFDGbs/JlOiWboy3EQdavKBsDnGtSwiQ0OaygxLuGtEN+Ocxxl/Z6uMErlxCBjfkGERR//jvkeM+08q36rNdGCt0xUrsEIZ5y2UrXwT26CJjJuxhH2bTj1l9McD2MRw6/bKTWWvio5r+kqgC7FM8Eut/ZteUPzndgZkAEhlSoDmebfBBoT+yykFZ+QJTvYisMRGrxsQy0Bxj/GUEBVXY5/8U94mrU5z5XeStMt81h03EDabPEi238RiOF2idxGJIBPvQ/dKvq0TV9xSFAsNG6pK4L4NPFRwrVKSHr7GEvvCj7mKTMTuu8hYNX7Ht5dhTBDvyimTpr0OM/l5Q0KYwFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6947.namprd11.prod.outlook.com (2603:10b6:806:2aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Wed, 17 Apr
 2024 01:44:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7472.027; Wed, 17 Apr 2024
 01:44:39 +0000
Date: Wed, 17 Apr 2024 01:44:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/9] drm/ttm: Allow continued swapout after -ENOSPC
 falure
Message-ID: <Zh8pgadLeSpHB9Hr@DUT025-TGLU.fm.intel.com>
References: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
 <20240416100730.6666-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240416100730.6666-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY3PR10CA0008.namprd10.prod.outlook.com
 (2603:10b6:a03:255::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6947:EE_
X-MS-Office365-Filtering-Correlation-Id: fee27dd5-b78a-424e-5aef-08dc5e7ff211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VX0Ll9oPQcWpyAPLpTPY3PnVcf1KOCmlW4tRITWdmaz5f3ju3IM7w+r9iCh2oppFEyjU/rD3MQHLmJgdLYuWAxTzvnGoSsO/bjv6uW9Hv6zlegLtZd4/Am7GgeQwRi0sb1H15ACEW4wJFhYVJMkqSjt6OeVOfRV000ctJsW62J+zAuFCs3Vxr4wUE8ozjSR4bT7j/Y1y5E1mXrKYyx9BYcsUxEDMjDhUH5oH26qkIiZkdUkBKWPCCEZif4qij6tMYnj3EB4r/KoOng7k2z3S+DzPChU8PrmNxO+JzDV1/8RgbZK+rxNHNQhGxdT5KxuPl6cXX7fI46LH++iujvZLfJIFgWGdh+7pKGQHVMe4+prdGs00frSvA8wdnghvDJQNQQZGuQLtm/gCrBOtwsfEomzfcp9q4AmkWzoNJ3D6pA315yM+j+G/n7IoFvKgs1SygJfK9NhP6+8doZGeyA6goNqPgqsbkt/FAgYXaujzPelR6TLiwPt3RW6DndThRfA5JjS+eicnBnDo6utakTWpGxXWMfrRsqpDQ/H/8De2Dai+OlRWWpVD1KwQ38bVn+Y4vVeta3ho2jRzoUZ1kkDrwntoot+jbA+90N66Jfze7bjLbofniDhI8BLs1MGmqN0fr8oF4C7d1tonRbIeICWO7s2sIMYZh6sD8Fkv5Y/390o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?w1C3C98dKAqmDzBWaPQW5jrs7dVLAusW9ORGO4oZk7ZLNDT8yGVz/hawS9?=
 =?iso-8859-1?Q?YW+BU3Gm0NQLFGzEn94HgE1K86elWfrpcycd8ngeyZs8rEHzGWGfwElA6O?=
 =?iso-8859-1?Q?gYPqd+DQoOO0zGA+SPLXb+e5egAOgYblKPzy5SFn2jKU7qnfLDWeqLobM8?=
 =?iso-8859-1?Q?g181SPlti01aeEryYfSj22WyOKabjGPM+hsGuWeCOg6kDBDkC3RpWgCGP9?=
 =?iso-8859-1?Q?qTXmM4aJBgM2SwmL0ZqfcjZ1DWsPeEwRhUiW6YNpcf+Q/UCf0xDZQuOWOU?=
 =?iso-8859-1?Q?EjNA3YQVUhHY5Oo+vKn7w/jL3wfff2N+xAaoBNHJ4JAe2TwBHaZmfYsbDg?=
 =?iso-8859-1?Q?JD8C9b/JOBVDG/46lIq8s4MTd/voGrIVBR3R991CoxOyjUhYIt0NLkFoz7?=
 =?iso-8859-1?Q?ofdLGhQGoj8vV1KQWD8ijDfvgZDoP3xnK/51+zSeBwaZ1gPUH98eMk7JhN?=
 =?iso-8859-1?Q?e7YFgvWmr2uwZ/xFTMxXP3jirtAFGC1bDFa9ZstAs7KPryQcmaN/+m5dpt?=
 =?iso-8859-1?Q?aoCNWWW2P/iRyMG+5QZAdM/cLIdIm630JtZOyHIqLQ1LSWG0aPmPKDS5qX?=
 =?iso-8859-1?Q?7FjWzVhn3XdWdE06c4iOFezvKr71djxiEm3bJeb75AhmqdXNr/QoG2Bfp4?=
 =?iso-8859-1?Q?02qdTbnxQZzxkWSv0sVAjOIdaCqSpbIgyGaDagg/xn0uLplfM3u7f3BIkf?=
 =?iso-8859-1?Q?eWPQhCzg9RE3X2VqQvFxC4gVc9jZbrOSybOuW6sXVoLtTPXaVhISmDvLMX?=
 =?iso-8859-1?Q?fC5qS1tNdd5ZUYg+Ou9NTNPjPelS2M1r7YwZ4p9NOHfcPhJVDlJ1slJdRu?=
 =?iso-8859-1?Q?qd3xtA+4Rhux77LcqkCr1puqYLjRbk/KdMBr8cLom3wxvW2SzwZUBpH0Vz?=
 =?iso-8859-1?Q?VfzX4bx9J0ozjcNBqv7baBLVvYLNAuHp3U6IzLdyLo0WBb9pzazUna8HVX?=
 =?iso-8859-1?Q?CyF/0C7EoLzkoRhR0R++75SzYD1s2W5qdsY7yOUsykTGg1iF2B2cvVZ8mE?=
 =?iso-8859-1?Q?dlFDK4kBLbeU2tSktu8/po4nmk3kosuPGgnbe42CedAUOiaFazWdeip/CU?=
 =?iso-8859-1?Q?0F3LYcBdIc/tlcTz5+NI+D6Sbvuqqu8Rt/wdkFBDVgozIWkhVI0iTN4UmQ?=
 =?iso-8859-1?Q?8T4SVoARsoWae9UMc/EfDpOJAgcof96iNfpcv6N2+n3jIpMazXLI2ae5bK?=
 =?iso-8859-1?Q?RrYEHkE1u/9X/1s+8c/fwFh9mbrK5+rJUfZzTUCLACajoK3Iy7m97vnPoX?=
 =?iso-8859-1?Q?RyIhCLuCNCTb98Ws/r1juREjlNVQTdYWeYS+MgGk1kaeP0rja9tqjm5MPs?=
 =?iso-8859-1?Q?UoIDET1hcckcTp+/P0RfYOniFVG3YX3auUrlvqm2JKImeoTTZ2EAhG+sSN?=
 =?iso-8859-1?Q?btraxZx6Y38qAoPtGXG4vueMTMZdJtCdCBuAlziQzWmmdKZfqF6puzHzIH?=
 =?iso-8859-1?Q?ZZ6UtpzXnUxIwzeBBq3Gbz+/4X+ixHTBw478QDB2vu+B7UaqA+ZYYYupsC?=
 =?iso-8859-1?Q?afqVWrxgCzLDCSqHOGMWpiNSXbRhTeH9Q0TPeyRAVdPTR149ZUwxdgFH4j?=
 =?iso-8859-1?Q?dr1rATi+LEedcV7ES+JWiykRLNcpnTkAAGBtbEhuV7KbWUp23FMM/bXgvm?=
 =?iso-8859-1?Q?1MCqgxY1H5nH4mj8jt0vGRX0pbzjqiHL2eyWTQ/PO5OuT/oFvxaQtXmg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fee27dd5-b78a-424e-5aef-08dc5e7ff211
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 01:44:39.6293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sWszcQTmmEslLuZrW4/PlE7zSweuKRtaVcCx/x+tGQA9SkGkq6p+tYwuw7FLbakMwPYBoDwbzzDmTW+Y8aD7Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6947
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

On Tue, Apr 16, 2024 at 12:07:25PM +0200, Thomas Hellström wrote:
> The -ENOSPC failure from ttm_bo_swapout() meant that the lru_lock
> was dropped and simply restarting the iteration meant we'd likely
> hit the same error again on the same resource. Now that we can
> restart the iteration even if the lock was dropped, do that.
> 

It is not clear what you describe in this commit message (-ENOSPC ==
-EBUSY + lru_lock dropped) is true (no comments in code).

It does appears to be true after examining ttm_bo_swapout() closely.
Maybe out of scope for the series but would it be possible to add some
kernel doc to ttm_device_swapout stating this?

Patch it self makes sense to me.

Matt

> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_device.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index e8a6a1dab669..4a030b4bc848 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -168,15 +168,20 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>  
>  			num_pages = PFN_UP(bo->base.size);
>  			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
> -			/* ttm_bo_swapout has dropped the lru_lock */
> -			if (!ret) {
> -				ttm_resource_cursor_fini(&cursor);
> -				return num_pages;
> -			}
> -			if (ret != -EBUSY) {
> -				ttm_resource_cursor_fini(&cursor);
> -				return ret;
> +			/* Couldn't swap out, and retained the lru_lock */
> +			if (ret == -EBUSY)
> +				continue;
> +			/* Couldn't swap out and dropped the lru_lock */
> +			if (ret == -ENOSPC) {
> +				spin_lock(&bdev->lru_lock);
> +				continue;
>  			}
> +			/*
> +			 * Dropped the lock and either succeeded or
> +			 * hit an error that forces us to break.
> +			 */
> +			ttm_resource_cursor_fini(&cursor);
> +			return ret ? ret : num_pages;
>  		}
>  	}
>  	ttm_resource_cursor_fini_locked(&cursor);
> -- 
> 2.44.0
> 
