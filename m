Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB286B0C699
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 16:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC4010E555;
	Mon, 21 Jul 2025 14:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ORFSVuBP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D53310E553;
 Mon, 21 Jul 2025 14:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753108826; x=1784644826;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nRDUe8JcGeD314wm2+ncG6YzHC5RzywHfSNcCrMtyfk=;
 b=ORFSVuBPWTfbjlI5iX0UYtXcX6Z40BU2q4SHdF/MHtcKEu5533h3vNfw
 0S4L3Bvd1YoMaRZq4X2KmhMwtYYHt447N6ZyO7GUzr1gP9VeIKbYBwix0
 oGuuMb53FtB8kX2kN79ucW7NNR6uFRtBhRqXIeTL429NzJE8VthoGX4Vj
 4rPrlQH6zIi0r9oXl1bc31ecjeDZW9N6rCs4j6swj9tOON2o/aQW6zJ9z
 uDFH9d5LKKLsvM7aXBq8qBzFVAe4q7TEoJr9m+sYthRGsbIjr9HbBvXOW
 hMY/g5DD47U2pTiyThdcYkCmrwJrj5cINf5WmvSu0ZRAzqKyputtWzq9v g==;
X-CSE-ConnectionGUID: tuDU1PFDSQK6S1WEtNeMXA==
X-CSE-MsgGUID: nSwoXR3qRyaqoySoBytnZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55269151"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="55269151"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 07:40:25 -0700
X-CSE-ConnectionGUID: PeI3vXLqRWawWeGmpj7aGw==
X-CSE-MsgGUID: d+O7gNuGTuecZ3fh1GzG5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="164512735"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 07:40:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 07:40:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 21 Jul 2025 07:40:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.57)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 07:40:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLBJ4G9jD87oYxOof7orOgkr+6LaGppNFaqRHiJmh7VirnVmlcIUgAPFbIHST+KgTkmvSpirY067bJHoof3gwSdK8cZW8d9A2prRKvDaEqn2yruBNl3vEqw+UMewZsw//oG2XmonDP+4jNp3zIVGFbmkjwtAJhXl0WI1yZ7X4i5sBvS/xVHbxNPeLSgvyln6abOddsGl3nvDVGfBSYW7lXz6ghs/QC5GyidJqgQyAK8CCQTGvDH6T/BKzGsO+FLizcRyitv8++le7pBkEf+vWta5oymHWo+XQEFi0n9Zd1nNSMNNExrf1B6/gMYrvlxbvJhMplbl4NCPjAB+pVmfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/n2AKK0Cj+gW81JarkkacpDC8+jjunmwdPIsBDVxSTU=;
 b=qnWNmGNy35U+4eiCPOI04DvTdMGIyKFTI1/uy91UdzyE5dCDuUSFbR46Zt1NEW80pindfuHvQoDnYxc0x5myzwT/mOzhe2bXqvwF97fMsw1Xa2nhf8bEeret2CyRa3sQV/fDj/mwA/JpfmHrfU1UyDQa/gFOnn/ILkI00cxGOILJaQLVNM/espHx/Y5GMER2QQ1FPhgwcANORNueGG7osI/7eSIT+Hmv/Fi11JGCuHUbhc+oUBBY8Gq+Pr9kF1evl2Qzjiff9nl4Ee21Mn0A7qTVeidHvvSnJ0kGlIN9JRAeI4CAGv1mFRekAYCACobNeCsbaCfEnP79bK8IBujeHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA3PR11MB9159.namprd11.prod.outlook.com (2603:10b6:208:57e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 14:40:06 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 14:40:06 +0000
Date: Mon, 21 Jul 2025 10:40:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH next] drm/xe: Fix an IS_ERR() vs NULL bug in
 xe_tile_alloc_vram()
Message-ID: <aH5RQTOMVdQrv-a7@intel.com>
References: <5449065e-9758-4711-b706-78771c0753c4@sabinyo.mountain>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5449065e-9758-4711-b706-78771c0753c4@sabinyo.mountain>
X-ClientProxiedBy: SJ0PR13CA0077.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA3PR11MB9159:EE_
X-MS-Office365-Filtering-Correlation-Id: a71978f4-3f22-4d5d-dd46-08ddc8647c25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WZSjOMUei8YUckBfdsIqD2COKOKPumz77JDGexMxgcqdD9NykRz9/KrND6Za?=
 =?us-ascii?Q?7CjFZmDfd7KjTHl3Ub9JYcC9OgxB5DcDL5xWnojRpDXsRC5Rd/FZs4O+Y61R?=
 =?us-ascii?Q?CZj1gHfkd4MqR4hEak+KhhHZvusAqGKHSE/Z9piw5QQ6FpyBYcPsKY3gl149?=
 =?us-ascii?Q?TBs8nxucf2xQE6HRriYKLj8eBg1CMO5zD/1Y06H8JiJCV4UNH7lcURafMu7E?=
 =?us-ascii?Q?WbyKFVXVXXqIVZGP9jHLXkud+WJdJ/csgjlb5ih4Vttqo0ONTi2jQaXhJWie?=
 =?us-ascii?Q?B56VEOy73I2F2KAm4sCKqYVDUbrqUrhxAkgbKXC3npIy/CVuI/qMFSHqzquK?=
 =?us-ascii?Q?tQ+GKagGs6pLjq3fKRnxVMwUC5RwgJzrfP13CndujP2yk4K1iRJCht/YuTyj?=
 =?us-ascii?Q?yZnA1l+rKfjh12wLKo6idgKmUS5YyXkptJS8Vk/UHa2/ravBaxYsPY7WURBo?=
 =?us-ascii?Q?ep2C5/4ZYIPjqHerIJL/LUKa7zz6GJAfqO19mywmOQ+G4kOoJy71EqBS7Awv?=
 =?us-ascii?Q?X7dmzVUY0hLMKQdPK8knogYvpv0JfrVOiYnB64OSogRnmlBFNyF587ugbL/X?=
 =?us-ascii?Q?X/N8kPBr2KbtaXQeXbPGewVW00xKtPLUf5Sf/ynOt0Efkf9VDkJpeLfVnq5Y?=
 =?us-ascii?Q?UB/L40MhehHpE2htlqrekPi519ibCCX35tBnnG8zW7g1oDTg9M94P8tkutex?=
 =?us-ascii?Q?XOQXhJph05Vj+pkMiqSAbVYyo7tLTVBIKwOhC4vWEGYNdNNtZCWjsEDgyDXP?=
 =?us-ascii?Q?MW8T34YbOrWHO1Bu0EsPsdTARUQny3z9/AYt0M0b6qJ5eVeYltGB2WYXOIHB?=
 =?us-ascii?Q?97JeQlwj2WoR2TaeZjA7cIuvnXE1KtPCSpQ7JYmbsfJOKvEAwt+UqS6Z79KA?=
 =?us-ascii?Q?f78xaaPGcYTkbhbA2OQJzc1dRxB286A1FJiK4lwbFvxe79CuAmzvh5tVmVks?=
 =?us-ascii?Q?WA89+vga5zcSC3tXWHoteq5XglRMOyDoGmjHlk/gtumU+9qp1lLQIMQ4Yb/L?=
 =?us-ascii?Q?Ph/v4QEI+5/MtGwYd5ci6AMM06MvtakVUK310ddlsiVSsW7+3g1OMDMA0Vbp?=
 =?us-ascii?Q?amRkQ+4UaS6PbTLigDSF0506zzNMdzphY5OJRN+m6Wmg2axzpoFdjl3En526?=
 =?us-ascii?Q?mTPwYWj8eIIc7XqQ9wE04j9D7Bg/JbbMN7Mva/Dfb9/pPcDIaeoiDtjq7yCe?=
 =?us-ascii?Q?kj/l8LIpGNeZbCgegPr4DfVlkeO06Om0qcrEMQqg2ipr5YowNLOVT8zVcvg2?=
 =?us-ascii?Q?9OZYZfQvG4xt+umWDG/1KHsRwDTjJ1eIeJRUZQHPZ9GP4zk7HNbskddqkT21?=
 =?us-ascii?Q?qw/5bg543PWg1Gh2Ztz5PoP3+Cljl7kaSMMLgc/OvayIIoN22BZ61lRPIkBB?=
 =?us-ascii?Q?BHugC59RMetP7+E2oip7qYmUFQCEuxP5g00tcDtN1PCXI63ghCE9IlkQvgT2?=
 =?us-ascii?Q?SgnWftWCqxM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L6w+ysCIMsVLk3APdStcTF+oP3EcbQjFYGebDQp+NDqJou0MqHWpQZSjJCWn?=
 =?us-ascii?Q?A/6XVRrp9gXlajtUgoR9EZxZJAc1IiDP4OChaDl0h30Gw0GMGmC4e/ZNETuX?=
 =?us-ascii?Q?kyil2QweBmALJbWkKh48s1S2WU21uq7kONVf1liwhH/+U4TQ9CykW0DaXmUn?=
 =?us-ascii?Q?8pjUT/AODDMM8JTXZm5Z1FC4dGAlyfArW0lhW3H6p6vtdbfNQxn8Zlj+w1JD?=
 =?us-ascii?Q?sncusrA7wc+ka2RgKD5hWEv/3HbZaQL8JYuBVeScxZY3npwv9boxxombf6zT?=
 =?us-ascii?Q?yNyruBwhnnxObN3vHkGylnGD2pV3Y5VtIyhxbFy9ta1c8i68zcmiyNT5i+Y7?=
 =?us-ascii?Q?Hv5vPGBFEcJLslrrqjlbJ3IHza1Llp9PTBB/4gF0y0YX3yWjpgsPESMU2PpP?=
 =?us-ascii?Q?5GvGNntl7gn/ghp+rqZc1q8EtNbCtLns1u5ITGyIzOPQCX1S6+JHikGUYGRK?=
 =?us-ascii?Q?apyXqFDc0C+6qJnTgnMAQzr87OyfP/QiiM434XB4bcnCZj7md9qZFs+x+5hH?=
 =?us-ascii?Q?Bf03A2d7QXTOpaJQ7c6xACVg/iWFrClDNEyxnTgIPD7ggWrLxFwfXYNRPRWl?=
 =?us-ascii?Q?EuKvaVFULOGYF0xFgxt4THKUHQBSh2MhH4IHUmS7FlOg24xCTdA+dDRUe3+A?=
 =?us-ascii?Q?viXKPls/zdV7LOshGF3iJjw5XxA0y8CV30zBtZ37hKqNMV/vjbI4Aewvk8KD?=
 =?us-ascii?Q?CdogTV0mvavH64CtgLN4w7ovDJVDr680XyjvIlxax4gieLbt91sP6NCZBkoI?=
 =?us-ascii?Q?5JTCo6IxSH3IUPOY685YYFf1/fnzjCuJxAhxFGpXuPBY+A9bZlm+lvL1JkbL?=
 =?us-ascii?Q?7H/3SLitgl6pPcbG9kFbZ+pftPez1aemPt3Row7MbjooWhdpuDPOmJ+GKye3?=
 =?us-ascii?Q?/zgGQOPSipfBXmM/qjvKXSfYY6rDKd9fp18HsX7aPqMdid8/zjczAc7iwVoh?=
 =?us-ascii?Q?F899TAy6wOC/zawiGa7U3zSsYupOOGSCwfFqKH8feakU1F+CwG/fKFnOsm4U?=
 =?us-ascii?Q?iYvNySCS3MjzOIHnIdWqAzkUgEMpHOdML2CEwVF7H8W4G0FzFfNwe9QAmbSA?=
 =?us-ascii?Q?A+EEMr3g672moL0EqLGxPAPIPzZEDUBP+MZxsb7HMK22bsuSPmegBDJY8Vnr?=
 =?us-ascii?Q?TjPHSHgC/HXPYidctk9immcSpwXKq2RV9O6437onRf2AJCb6qsKNsK/B52BW?=
 =?us-ascii?Q?ls/JcoW9LODjhQpeomyvvCwiFzT0DbVVLwCnjYPKrhrI/kH2yM/gtSifQuoF?=
 =?us-ascii?Q?nZkyexxaIMQ3qfDEPIXj/Ze/VHiZ0faGe278RDz80zHhyxZbxuPOd8CmRQUO?=
 =?us-ascii?Q?vJqbBbZQ0or/Bil6MkW7sC4PJr/R+nTckV8m/TV8s8+OmGtizv0leVHiVxbl?=
 =?us-ascii?Q?/v/sXe+T4WlbDqdBf6GemJV/FJ1Su57PcysMmfMrNFbP8TQN6/XTmt7setQP?=
 =?us-ascii?Q?DCB7kwq6csdpJrzGy35m1HN+Eg7ospgUk1QY4HZAIiaZLYp73WpIk1gjURdl?=
 =?us-ascii?Q?pY94WFwfXvHBxNG9yx2jBwZUfYJ9/ERQSvZhYjLJCbIJXEM9lZTtEH1ctnNi?=
 =?us-ascii?Q?QE05tlIOSOP1Ye+b3MhOcpQo7RO75UE9spXubHOA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a71978f4-3f22-4d5d-dd46-08ddc8647c25
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 14:40:06.3732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SSc5weROl8yuQGvwwCX+CYxIDTddCX+6tmh6BUQgTZjIHOfXikKojzVQy72r1Z7KFf4yULyj96+Y2aGY8boBIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9159
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

On Fri, Jul 18, 2025 at 04:23:05PM -0500, Dan Carpenter wrote:
> The xe_vram_region_alloc() function returns NULL on error.  It never
> returns error pointers.  Update the error checking to match.
> 
> Fixes: 4b0a5f5ce784 ("drm/xe: Unify the initialization of VRAM regions")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/xe/xe_tile.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 0be0a5c57ef4..d49ba3401963 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -120,8 +120,8 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
>  		return 0;
>  
>  	vram = xe_vram_region_alloc(xe, tile->id, XE_PL_VRAM0 + tile->id);
> -	if (IS_ERR(vram))
> -		return PTR_ERR(vram);
> +	if (!vram)
> +		return -ENOMEM;

Indeed correct, from the drmm_kmalloc to the probe where it is consumed.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushed to drm-xe-next

>  	tile->mem.vram = vram;
>  
>  	return 0;
> -- 
> 2.47.2
> 
