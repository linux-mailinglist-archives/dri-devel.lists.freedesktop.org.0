Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81050A9647A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 11:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C408510E559;
	Tue, 22 Apr 2025 09:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFWplkH8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B351C10E554;
 Tue, 22 Apr 2025 09:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745314442; x=1776850442;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=Ap36ei89wwyuTFEJGMKZdGy+glDzxJ+ODD1sgpBlnh8=;
 b=nFWplkH8eht5aUY+kzsugYgiq2mowDp2e/UzfM5XPpZ3kYutFlsY30nH
 +K+MtgPTI4gEDjgs5pNyjQd12Y4iTPq+FPoiQH/zUWi2+gsfgi23PGkqZ
 ej1YKz5kwGxyVKRN5jo9B9+fcc34UCs1F8+1DRDb7qTASqbnl1uG++jgo
 V/Mc3E5qjJGwpZ7Nqam0Enndjk3S2KCf7UlMY2EhDVCwqou2GRaPkd3TD
 /A4sNvyvfulqpuGMD18O9i35jZLJtbegYo7uFBHoYrq5FNvrYJvSSnZuX
 OnkHSh4X079WB7CeOvO54TM6Y9OSp1UBEH36yZk9zqwj68ex17y/XxfY2 Q==;
X-CSE-ConnectionGUID: 4aACIod9T1CnfIVAsVYpEQ==
X-CSE-MsgGUID: 6kfS8h1GQJCNu8eOF0ewvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="57846707"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="57846707"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 02:34:00 -0700
X-CSE-ConnectionGUID: KJSprvdqRSiFKoRM2nS9xA==
X-CSE-MsgGUID: PjMeQhDrRr6Dw6mVUGVl9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="137118873"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 02:34:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 02:33:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 02:33:59 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 02:33:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOnJyzxukBofJejaqbmXuQgUP/Xcm89bkHELLFBiXEYrNCXTdF7EVesmdi8xe37juRFV7Nb6TyUIOOIg+sHdPaXs3K+I5jZVjh/wqp4L482B+mNwprDputUj9XgwgWKrGbzbMPKqy03b3NzYJ8oj5SqPH2E2LRaKEgSxcpMo96NDECE1+SkNXviW1nMiJeqV5Kx+A8I0KuWss5fXohil4vIINAdgz9VGjCX+iaNHwnZBs2kWRJf2HE8Dre6bGpudwJkci2K2fgbrbdCSAurNyidjempz9PxLDuRnfkFoTUrY0JTMF/oaNKb1q+PERuCbuN59/A/MqUh1n4xmGqggDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mk0OsrR+66Y7La1xB6Y6nPvFvkGEi0JRatDDmr8oSIA=;
 b=kZdPLGStLE2tRYx6jLvIs97ICvLGGDIvg+OvCnH6vtiIfdhQt5rY8E+1hdzwzZLAyF0He1af0DmU0WM8quMnovmHD+To9DeYM3gTmwsLux/5fD6Uo+N7qEKiWuwBTAxeHVemJXSLgeaJihQrKbw//LyXJWR8i2SyI3omAnzsya0yKjvUvV7OQ+ab9mzhp8KtSAZDxvTQaER+fPCZrRDojrwi/5khEETAAAclExeHG6CzhhubQjbWJA2w4ClmWhZYmG+UoYkfeKpUK6wqP/TlSwV0K8PG2r7ghM8cf//tUTtouQwTOHjMJKr5TSUwflU7CU7hXrzUsdc0zFMpL+QyUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 09:33:04 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 09:33:03 +0000
Date: Tue, 22 Apr 2025 12:33:07 +0300
From: Imre Deak <imre.deak@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <vinod.govindapillai@intel.com>
Subject: Re: [PATCH v3 1/3] drm/display/dp: Export fn to calculate link
 symbol cycles
Message-ID: <aAdiU3K5EV6Oq81a@ideak-desk.fi.intel.com>
References: <20250417-hblank-v3-0-d3387df7efce@intel.com>
 <20250417-hblank-v3-1-d3387df7efce@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250417-hblank-v3-1-d3387df7efce@intel.com>
X-ClientProxiedBy: DB8PR04CA0017.eurprd04.prod.outlook.com
 (2603:10a6:10:110::27) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CH3PR11MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: f6cc35bf-4808-4180-934a-08dd8180ae19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HCMLKcHb73ukgXOJ7/wC9S6aPTsnBbqVoijuf4704/b+ODToZxVl0TTaw1Nv?=
 =?us-ascii?Q?rNsbXfFPxYc11v1eKsSJzfyFr3VlN4MoQ9RHRfUxa7prM7jGGqtVOMVmMpxR?=
 =?us-ascii?Q?FbB2j7cz8Nfd1d3+svw2wxxQSbdXCLsCQRLwly8STutE68OWUExEmtEy9gU1?=
 =?us-ascii?Q?DULwyERIVLq987rvPm6g4680AeIGW/V4PYMOLG10IF+DiSiDzr3Hl8W5pcWp?=
 =?us-ascii?Q?dgxsnCKm+YNLFTJSM/3KepxcsWSOjuMt+7/xAgM559+qNUfbvtiBNssuhLX4?=
 =?us-ascii?Q?G+YbAg7wDEx4pikFcsflqP2lS2s3Dl1m2CPpPPTm8u6WmSlFOEjkIo1k/YrH?=
 =?us-ascii?Q?wJb9DSTnTCzhT03ybYhWRuA4iPgzgGwpNpNb1R/oaqTtX54gPaSD+u1ONWMu?=
 =?us-ascii?Q?vTFyl84pSOpZxHNzXQOVGcGhCClHb/kzWrX3kmIVMBnJceSfs5xXgG1+Hb9p?=
 =?us-ascii?Q?HShY9dfp+iBBEBNui5nmUr2vlIgTDUrRFR7qzjk+MkfQHJi8q03ky6GDM4Mt?=
 =?us-ascii?Q?7LPKx+F+CBApVPmrgQ4YO1tT4vOKwXqPloVbZD/jknvH3IzfIH74OW6sAx+1?=
 =?us-ascii?Q?NwYonPadsgIjrEFfLt1dyhRcTemIQqrn7jYLgDeT/SDazU18n64PxhhEGlHG?=
 =?us-ascii?Q?2lXzFq1dGgf57pEcTXO+N+NRB3lP2RLlz5h1dCfYK+hOEVPjoHyVooU9dLu6?=
 =?us-ascii?Q?gaptxszYQKMNQiId0j26UyrI4i4TYPsFpNUORkH2hlkCPgh2kUS/hD4SU1xb?=
 =?us-ascii?Q?KsD9v8gtmHnV1x2jtdDfbBUNHRBFW036mV4kwnMZLN8ZQ6KdpG5WzPlQTOsk?=
 =?us-ascii?Q?qKrYQISg4o2G8yz1LQI90wR05SUdpdLM6e2qrzw9WG73+vT8zHfQ78DOw2kq?=
 =?us-ascii?Q?MjSaJ3Bz5t5Etww59oeiQ7De5PIQQ8DEY0lFp+1asES7xR/ikyHAFWk6LcAZ?=
 =?us-ascii?Q?EQD7gpAdp+CQRamLIITrzl5ttSRAmquAalW92D9im88WKtkLjb7vc7sZZHcR?=
 =?us-ascii?Q?AxVFSJp7u6QJwDWrb5vUre0vRbLtwCydw7fqHN1LRtjfj8XQ7sUehOg12XmZ?=
 =?us-ascii?Q?sJFoSjhd+WJp+DFO3PJP9XEIYCcaPUVQW27IVcX2mZW0zlAhUJkWjRiq/wkD?=
 =?us-ascii?Q?bYRFsHOSMVTelNtpWAGuotiZoaOakVqPgDUJX/V9QzkaNYxJnIuGWo2PRgrQ?=
 =?us-ascii?Q?q96q/KubRasO0vdKT7mD42mrQ62EfLFs28oVcvPoltj3EEWxRYUlFNJQYWpW?=
 =?us-ascii?Q?HvhjNQqNUNwjc+29V49nVZxQOQvkxHR3eMxYJkXiyCfCvo1E1p1Ue14tg/O3?=
 =?us-ascii?Q?tj/0f0ctXt6YyJ52b9ZaeSGttBLpZkEjVeOwHk3nQwgcymupM8ywmf+RVioQ?=
 =?us-ascii?Q?gE9AERZc/+4XnOYbvt+VBkzoeljXBj0tPv55/fx/I3PXs+nJyC3FJwZyYtfC?=
 =?us-ascii?Q?95SMsjJv3nk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qf6Pne+5b90/u+erxfdNgBE53lYwz7a43yTIRw5+NWyvtaX37W8gOKs8Q2Z2?=
 =?us-ascii?Q?GvoibPLPboidWGoEhV1orQhQYkivWi5tt5XfnTYLXMw3nkeNYUq7jwBv1muz?=
 =?us-ascii?Q?x9/yizAfdKPp4pqjs+sXyYFe4yFQsBUqKoPQ0i3B60yg5LgJClq4fAEPUdZI?=
 =?us-ascii?Q?CBvs4LKIKojURVvKIVH5uKdYdqJDYtxD5Z+xgzp2SvzXXf6je+poyUYAjKSw?=
 =?us-ascii?Q?qbBDm0Cf2AXOVDpHRfHucgft1lz0vmhP1Q7PvhhThBRNDXfBDNSzMQ38+nxK?=
 =?us-ascii?Q?ADo6DuU1hvWzcGOOsO0yeoi5QITBuafAg0p7I7tPq3GIY/CZ6ZnQY0tij0RC?=
 =?us-ascii?Q?IgihAm0ab64ZpwYu9d6frYKyHIO5SgLFysTCRnmLID31VVrtvkHY3vajAyhl?=
 =?us-ascii?Q?Ubs16JAYjaZB1Wguhx8/5nj36u0HNwMg3ZFjAHB9uEGnz+xQLQCb7eW8tBsu?=
 =?us-ascii?Q?zsGwoWsxaDw9HpNjeZuscRsn6e+VqRkltVcM7d9JjPbO6Bo9orL/1ZbF22oc?=
 =?us-ascii?Q?7TqOPYhHiAA7X8wd/I2icxbSskjwSQQfcTddyyQDMwF7vToZ5+y14t44OfAk?=
 =?us-ascii?Q?fedCZGmKG60GziBCoXOxrIar+8C3MF5MfgqWMmD3ZKEDaGs0araH7boGZMla?=
 =?us-ascii?Q?HazjCGljQHiRnn/4TOsdk/J6hckyIg8q7jyj8fQIUnx4CoNubxEx9/crcRnU?=
 =?us-ascii?Q?9Fz9flDW0YmmJosoNx4MOZaS6XxTY7edjobq2oYlwkVqqyO9tM283IJh8LX+?=
 =?us-ascii?Q?+Srak0/ARmarV/jnS9aHh1GWxQPBL/2kyvoZQhyWId4FXp1wxBP+y74i62Nb?=
 =?us-ascii?Q?4lifEwH0KhMr47Au1ahcZdZrJa2JxxSWOyKz9bQ5az3k3HajbOxZ1AjCvRT1?=
 =?us-ascii?Q?GIHvt6yq/OfQraViL/UHa6aaekgmMfflrjNFpGLVTUsVJuwlALybXEIkwWgc?=
 =?us-ascii?Q?OKE4WxUXFvFeuVkdb0XBxkUoI6tQxaoAJHaC2oKKzdWokJtEdgHdKB8jSflC?=
 =?us-ascii?Q?DvLn2pPZSjnMewuylQgkJ7jAe4+u97GFEQZ0/lTVD3YEhf/sxAF/tnR5SMhH?=
 =?us-ascii?Q?5aZ/qty2yAIaE+xIsFysF+cfsxcL5ui7E+R+eRuLqaal3fYOSX/ir69e2peV?=
 =?us-ascii?Q?LO2MvGMbk1xyeLzSmbfrA/DrkSMO/mHkqEFF1tJBrYjokG5b6Nugcm6KNMGZ?=
 =?us-ascii?Q?8uqKenUsSKqLkM1Tp5Zhsb19UC8TBCmKvcyhxXWNUEov/NEM4+R0v62Yt0SA?=
 =?us-ascii?Q?1peaXoTmEY8T833pOO667w5PCfhaw8bhV1UB+ewjZ4ytj7u8+tbctOtQZOwW?=
 =?us-ascii?Q?OPtJf7lcbPVwIFS1ijbX3VrOURYNHLA/p5ZFBgLPmhl4FMvKZqYhyjPa+5Ey?=
 =?us-ascii?Q?n5o53TrM+FVTSHk9b1PSpmCYStaV5ZddeLLUF/Hd8OyFdUrw1qGqMlJ8c7Zz?=
 =?us-ascii?Q?YJExoh6rkvuqz4QipKBap+qiGPLBkzEaMU5uhaPLQVpYDbrHJ9RaIjsO+Bdb?=
 =?us-ascii?Q?mFPA22El6ThDrzd3rIvgKb6UxxL5dJgY3L2rgcuba7UJQLL8DFj/ug+8LvYz?=
 =?us-ascii?Q?m41neGvKm/CxEAQMJpn2UW08rs7qq8bA5FkNR66A?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6cc35bf-4808-4180-934a-08dd8180ae19
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:33:03.6865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pm5btpy2AF9wBE4M36xZK45a+0V92d0fDG6LL8oQtZlDaw+AHKrJ1kYEppU+vRoU1WBrGsFayzWpZVhNh1iClA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8096
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 17, 2025 at 04:22:28PM +0530, Arun R Murthy wrote:
> Unify the function to calculate the link symbol cycles for both dsc and
> non-dsc case and export the function so that it can be used in the
> respective platform display drivers for other calculations.
> 
> v2: unify the fn for both dsc and non-dsc case (Imre)
> v3: rename drm_dp_link_symbol_cycles to drm_dp_link_data_symbol_cycles
>     retain slice_eoc_cycles as is (Imre)
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 53 +++++++++++++++++----------------
>  include/drm/display/drm_dp_helper.h     |  2 ++
>  2 files changed, 29 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 57828f2b7b5a0582ca4a6f2a9be2d5909fe8ad24..5ce8ccc3310fb71b39ea5f74c4022474c180f727 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -4392,26 +4392,33 @@ EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
>  
>  #endif
>  
> -/* See DP Standard v2.1 2.6.4.4.1.1, 2.8.4.4, 2.8.7 */
> -static int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
> -				     int symbol_size, bool is_mst)
> -{
> -	int cycles = DIV_ROUND_UP(pixels * bpp_x16, 16 * symbol_size * lane_count);
> -	int align = is_mst ? 4 / lane_count : 1;
> -
> -	return ALIGN(cycles, align);
> -}
> -
> -static int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int slice_count,
> -					 int bpp_x16, int symbol_size, bool is_mst)
> -{
> -	int slice_pixels = DIV_ROUND_UP(pixels, slice_count);
> -	int slice_data_cycles = drm_dp_link_symbol_cycles(lane_count, slice_pixels,
> -							  bpp_x16, symbol_size, is_mst);
> +/**
> + * drm_dp_link_data_symbol_cycles - calculate the link symbol count
> + * @lane_coount: DP link lane count
> + * @pixels: horizontal active pixels
> + * @bpp_x16: bits per pixel in .4 binary fixed format
> + * @symbol_size: DP symbol size
> + * @is_mst: is mst or sst
> + * @slice_count: number of slices
> + *
> + * Calculate the link symbol cycles for both dsc and non dsc case and
> + * return the count.
> + */
> +int drm_dp_link_data_symbol_cycles(int lane_count, int pixels, int bpp_x16,
> +				   int symbol_size, bool is_mst, int slice_count)
> +{
> +	int slice_pixels = slice_count ? DIV_ROUND_UP(pixels, slice_count) :
> +					 pixels;
> +	int cycles = DIV_ROUND_UP(slice_pixels * bpp_x16,
> +				  (6 * symbol_size * lane_count));
> +	int slice_data_cycles = ALIGN(cycles, is_mst ? (4 / lane_count) : 1);
>  	int slice_eoc_cycles = is_mst ? 4 / lane_count : 1;
>  
> -	return slice_count * (slice_data_cycles + slice_eoc_cycles);
> +	return slice_count ? (slice_count *
> +			      (slice_data_cycles + slice_eoc_cycles)) :
> +			      slice_data_cycles;
>  }

This is not what I meant. Please keep the two functions separate, don't merge
them and don't introduce changes unrelated to what was requested. The following
is needed here:

--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4393,8 +4393,8 @@ EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
 #endif
 
 /* See DP Standard v2.1 2.6.4.4.1.1, 2.8.4.4, 2.8.7 */
-static int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
-                                    int symbol_size, bool is_mst)
+static int drm_dp_link_data_symbol_cycles(int lane_count, int pixels, int bpp_x16,
+                                         int symbol_size, bool is_mst)
 {
        int cycles = DIV_ROUND_UP(pixels * bpp_x16, 16 * symbol_size * lane_count);
        int align = is_mst ? 4 / lane_count : 1;
@@ -4402,13 +4402,17 @@ static int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
        return ALIGN(cycles, align);
 }
 
-static int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int slice_count,
-                                        int bpp_x16, int symbol_size, bool is_mst)
+int drm_dp_link_symbol_cycles(int lane_count, int pixels, int dsc_slice_count,
+                             int bpp_x16, int symbol_size, bool is_mst)
 {
+       int slice_count = dsc_slice_count ? : 1;
        int slice_pixels = DIV_ROUND_UP(pixels, slice_count);
-       int slice_data_cycles = drm_dp_link_symbol_cycles(lane_count, slice_pixels,
-                                                         bpp_x16, symbol_size, is_mst);
-       int slice_eoc_cycles = is_mst ? 4 / lane_count : 1;
+       int slice_data_cycles = drm_dp_link_data_symbol_cycles(lane_count, slice_pixels,
+                                                              bpp_x16, symbol_size, is_mst);
+       int slice_eoc_cycles = 0;
+
+       if (dsc_slice_count)
+               slice_eoc_cycles = is_mst ? 4 / lane_count : 1;
 
        return slice_count * (slice_data_cycles + slice_eoc_cycles);
 }

> +EXPORT_SYMBOL(drm_dp_link_data_symbol_cycles);
>  
>  /**
>   * drm_dp_bw_overhead - Calculate the BW overhead of a DP link stream
> @@ -4486,15 +4493,9 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
>  	WARN_ON((flags & DRM_DP_BW_OVERHEAD_UHBR) &&
>  		(flags & DRM_DP_BW_OVERHEAD_FEC));
>  
> -	if (flags & DRM_DP_BW_OVERHEAD_DSC)
> -		symbol_cycles = drm_dp_link_dsc_symbol_cycles(lane_count, hactive,
> -							      dsc_slice_count,
> -							      bpp_x16, symbol_size,
> -							      is_mst);
> -	else
> -		symbol_cycles = drm_dp_link_symbol_cycles(lane_count, hactive,
> -							  bpp_x16, symbol_size,
> -							  is_mst);
> +	symbol_cycles = drm_dp_link_data_symbol_cycles(lane_count, hactive,
> +						       bpp_x16, symbol_size,
> +						       is_mst, dsc_slice_count);
>  
>  	return DIV_ROUND_UP_ULL(mul_u32_u32(symbol_cycles * symbol_size * lane_count,
>  					    overhead * 16),
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index d9614e2c89397536f44bb7258e894628ae1dccc9..98bbbe98e5bc0ce0f9cdf513b2c5ea90bb5caffb 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -971,5 +971,7 @@ int drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
>  int drm_dp_max_dprx_data_rate(int max_link_rate, int max_lanes);
>  
>  ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc, struct dp_sdp *sdp);
> +int drm_dp_link_data_symbol_cycles(int lane_count, int pixels, int bpp_x16,
> +				   int symbol_size, bool is_mst, int slice_count);
>  
>  #endif /* _DRM_DP_HELPER_H_ */
> 
> -- 
> 2.25.1
> 
