Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E061EB2293B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 15:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24C410E5F7;
	Tue, 12 Aug 2025 13:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ch9WyML8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEB810E5F3;
 Tue, 12 Aug 2025 13:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755006684; x=1786542684;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dEJgUb5vuCMWwyF9fECgg4bX+NpjiD97TUdWKFdq8VY=;
 b=Ch9WyML8KKB8M/Xvb5ZidiZZXd+VWiV1ANqgkXLAVWS31UTr+alhrBzJ
 e10/IFpW0eyBB17zCFQiDJc+iyQZ14+PLC9hc6F0tfA79EneymgvcdUau
 C3tuxhisnRVoX0L3zRUqfz8YqKqrvOh7PJEDJvlI/euWAFMw5dM4cxQvF
 DIB9Y6F/EoTcp8RrTnPTjUfqGMxMrpKhSuAAa5Fribw5GUU0qEQKakwLz
 f36CKf30xB4tQBlFxeA0sr6o4CDLagJWcwAs/WxQbbSVQfIuHeMm/pLSa
 XHQbm75eCsHtdRG2JZvfOsRsgdxEm7TTCeyOudtXWBskH0EN1iM+IooJL A==;
X-CSE-ConnectionGUID: l+5/hFTgQUKVPInvwdT1lw==
X-CSE-MsgGUID: ntTg4NHRTPentWHW7JVBzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57361551"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="57361551"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 06:51:23 -0700
X-CSE-ConnectionGUID: D1wmVtU7RlSdNlS86rB1HQ==
X-CSE-MsgGUID: AxMKLlrpSTen/goqV8HVFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="166994213"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 06:51:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 Aug 2025 06:51:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 12 Aug 2025 06:51:22 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 06:51:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIpJusrvSMJ011WjZp/1etsoTVx/7PhZC3HZuYNtI/0D5GhdhAYgqYihOGdb+LmP+lnSoVBPiCHcXbgsZ2ikwb/+4wXUCWZbczQEgKr42H7o6/OxXvsC1Mu6VfdjxPaEdEoEkw2jRLBOHj/OPyP5mVpM9nviEeF0Wk7M5C/JrnFnCpVemw471kxTzuswx4IV2wJgmb6S8IhcJBsRnCQZy9AHoFDTVpbBoJj8LD1B5N7WDqJV0rSUr7szXIdBfAwlcxkpzc6vTZhSHVYP7KCCS5AwIyIY2UNg996psKzYXSUtrAJf87CzFY1aVq0UyDqC8cMLi2Ms4K5s7EaibRfJ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvZ/9bp6GH20Ccpa4YhD5FhnTpaJuErExsYkfFcRtKg=;
 b=Jp9J1fEZtpFWchtLIUy87b1PtZQ5m8E3kiPslbnTkUaoeJfhAKKt2ZuKsJwYZoKo/MMlodFiyR53+HKn/vuAMMHK1YklTbsvwun/GHfiZA49naOb/gRtTY+0ULAsLt0klGlQ3wHFcPnIjkXZ+cWdNJYckMG75rufsFXxuPzn01MBto2d/AAwBUoZj2PnnMH+NGQG7uFPZLncKm+IMGaexnFtBheXGdcwOhJx7XhttD50o1MJryPc0R/msm9lMaf6P6ZzGdNz9mTunYsnwNoHr0Zv04JrGrccpHjneyKqp1z9OzDYshPTvu6Zw92IZs7HOAcruZ07sv1l949PCsVcxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BL1PR11MB5304.namprd11.prod.outlook.com (2603:10b6:208:316::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 12 Aug
 2025 13:51:20 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.9009.017; Tue, 12 Aug 2025
 13:51:20 +0000
Date: Tue, 12 Aug 2025 09:51:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <zhaoguohan@kylinos.cn>, Karthik Poosa <karthik.poosa@intel.com>, "Riana
 Tauro" <riana.tauro@intel.com>
CC: <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND][PATCH] drm/xe/hwmon: Return early on power limit read
 failure
Message-ID: <aJtG0xmBBgwnTANg@intel.com>
References: <20250812065930.15847-1-zhaoguohan@kylinos.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250812065930.15847-1-zhaoguohan@kylinos.cn>
X-ClientProxiedBy: SJ0PR13CA0174.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::29) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BL1PR11MB5304:EE_
X-MS-Office365-Filtering-Correlation-Id: 40e64e02-83db-4092-7420-08ddd9a7512b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WDOxfaxYVTSnHiPF70uGSI6C/s5hGd9JnKkrufG8Yre5VBMRwpGBoYSJ3ZVm?=
 =?us-ascii?Q?yZOaNwxxN10hk2LYf4J8JlaDsmjlSx0PjcBM0+WuR42IaJ9oy1diYD9BLBpO?=
 =?us-ascii?Q?NexuAJQu7r5kS9EyPnyYErP8mpCVSazAHmSGOlbFc6aIDFFugBVv9uKUqZpi?=
 =?us-ascii?Q?jyWJ99g0dHMh72Z1xNxPCi29gnTMBuWBJ5gWfVxX2CAkNoSHIiM1SeueAO1+?=
 =?us-ascii?Q?NkkUe8h0m3eayzcBO2848kqynMN4VEgPTp1dUJ8Mp8VdSuMwIThEaDcV7A1E?=
 =?us-ascii?Q?1a2HabDFNmbPScOOoXNxLY/Ga0USu8WQbE2+0Izk5LkKgwnazzVZUm52+Kpc?=
 =?us-ascii?Q?ZQ1Lq6Z5cnUzqVNI9xyP0ccBB/l6gg0J7As3v1OA1t/Fja86B0gxhCyQZUdC?=
 =?us-ascii?Q?4lMDEDVGzs4YKwkPFfjNRwqpn8gkX+ctkxucL8eHVRauw5YUMXiPA8s07zA9?=
 =?us-ascii?Q?uohXrxPHHqW0MgU77Hc3HQkMk4yGGPnuzluk6oQJb1h12aOdWxekVhMwK3e9?=
 =?us-ascii?Q?8UJ4qASaJtrziSxvPiXfWg+X98ajuRzN+fHFhzxVNZpcWj7l8Zm1QBNggCP6?=
 =?us-ascii?Q?h2VIjyowXrun+PN5h0+ZkmJS7j/b96fXoFoKyJDKgydHlyxgAlq7MBQR7rZH?=
 =?us-ascii?Q?tAxsAw4Nok0KDACSAHDZpPBDTwc+Mwkgo0r6VZmt1kfGNAabfkFgfz3LaKK2?=
 =?us-ascii?Q?skLH+Cm6MG4qTQC4F0OteiADJCoVCP9zs2BukJBWbm/2dZqOcTh6c+q8Qk4r?=
 =?us-ascii?Q?JqbZqcTsrsea6E7tn0JbDdXipdqFrwe+LblccFeZY5cSxmgX3T8gCqTHm4jK?=
 =?us-ascii?Q?m0e7kYplwCnfbH/HgdbovDgPlA9miwYPgIY4UXoo5Y75t6/EJigKM5CFUI/Q?=
 =?us-ascii?Q?b7fCwDurS5G22Ta69/KeNEBGm0nn3VngOa6y1YHwfcvpPcS2R0JxutMxyO44?=
 =?us-ascii?Q?3BLdeMRgcf1NsGEsMTQ/D3uVPDYZpuT2AIkQgEUskbcO2f/ayGx0thEj3w3M?=
 =?us-ascii?Q?rd42Df3w8aSLtvHYh6yTt5LTGLRv2WcCZXodpP/EzVsM/Hf9Zyw0FgSB9GJu?=
 =?us-ascii?Q?raY87MrA0xevUMLY2H8SW/5aUWbW7dapC2EBCJwrJpd6gAsOltawiK6qmLqD?=
 =?us-ascii?Q?rF0FkkjalbT/X+3SZF2b3ND8FXil44OMe/J3d/HF1x8TMCQQLLssVj/e4VmY?=
 =?us-ascii?Q?D7Xic8npBRQRMcE9q4uMB4tozYH1FTo65Z/5sGuoSfFoTAMeupbbKXYok+DR?=
 =?us-ascii?Q?JYMTGUS9/Y73gxBHcVHRxtXEwlbxepBh3ubLmQNESu8WoO3M3uykaII5PP86?=
 =?us-ascii?Q?qI6MRbl3OAfCN3Po3vobSIi2GabUOKBT52aG+piAoTi8a0abA3a5mwQoEASD?=
 =?us-ascii?Q?qOgXqCplpMZ6h99TI9HNBGCY1V2heXjQE0X3sfPgjmID+qDNUh1fzxa1Ql++?=
 =?us-ascii?Q?+i8CUUw/ea8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aDI3dIbW0e8xs7LjjTUQaKbJ3BstwOEoxgK7aBX4ivw4wCnf6bbFCfNQlXDq?=
 =?us-ascii?Q?WU3aAUbQPJwRemslKb8UQjco0NGF8nyvMPvsfnjnzyMOyZ3vjgsolJ6UvE1f?=
 =?us-ascii?Q?JvNtjAmGt5YsDOpmua7h0rBYFGXz9V+icwOE9vnMpGvNoa/uVm3zWtEdNMmC?=
 =?us-ascii?Q?z/TfRUzQRDh98VssKNHM0tHdF4AKRi/p2Eq7s44QxwPBnmZ60BSdA9l+v0D5?=
 =?us-ascii?Q?ZKPcCbs4ITuo6hWzPuBqfC+RHNSajo2LMC13OcQKDwxJ0kG08xIg/V5VQa49?=
 =?us-ascii?Q?0OSwO/MJiamTLZ35gews3RMXPwvwQYdQvv35Dmi3a6OCLhiqowUZMoNzjsFb?=
 =?us-ascii?Q?Yra5BueS553a6GGM2gcfb/DDqxIiQ/reXWRMv+LkwK/fYr9RgExC1zIX3Yer?=
 =?us-ascii?Q?tnnfeUGRmnVKeyzAeN0RENXG8cnBCD/xaMJ1eDl8/iuFlRllL9vCW5eUg8cb?=
 =?us-ascii?Q?W/hveLEL5fXambdELTptM/e35GNQRShBokqc25VhMBmbuBgzWbg9+ZbZ5Trl?=
 =?us-ascii?Q?K//UwoKqiy3MQZuE/x4uz054dUWtV2Y+VhoGDNgtNLjaKons+GRfUbla06uY?=
 =?us-ascii?Q?iISI1Q92+S1bTx/b3lWBdA0Uun+48/HbkiaXGpmc7T6xdVsJGEL2rAY+fK4o?=
 =?us-ascii?Q?bws0j578PqFH2hiYKtXESyq0R+0srPRn0HK0/wJARSD1uLnpQ1SC48YUmOVq?=
 =?us-ascii?Q?+OZGeVuCRfLJY5BRVYomndYQBKU0TmYpy3LZlEz5ZcBj5D718EnhEhBpcPqi?=
 =?us-ascii?Q?DaU4DAAlc8y3CL34Y8sSE7iDmwwkUCZE/9va8InzqVgSgPmv1KHGfDadqKvA?=
 =?us-ascii?Q?JifybxW9R1MO16JMYmJDRHihkPYtV7G44qRRNgOfRjVM38tSsMdL22Pe3kcn?=
 =?us-ascii?Q?XZBGKFezxmb3qGBwC+jQgjjT9ex7vGbLSBxvO2nbLgZZiS8r6EfBNEmHFx0Q?=
 =?us-ascii?Q?eFq/zM4z2FUBSfuvVLYq7FPdy8kBbIRwS8RD4iITWZKkVkzzDtw7Izs/Oo+L?=
 =?us-ascii?Q?ifSelUz5FM/BMmlEgKBQivjghSSstoKZeNmXTT9g214Yn3WONqbZ/5QbH+3D?=
 =?us-ascii?Q?bKbJod8Y24bOzNQ3Qht4I5X+H/+joJnfZxkgMCHuO+J0VL4wyXChhYl9Vq9E?=
 =?us-ascii?Q?zvyyL8XE67BBb/UA8ROUWz4SZi+vE5Y8IQP300Ods7kK46tapNE5qsz2qkjD?=
 =?us-ascii?Q?+68johiGOFPFqO1XP1lpI8tuHPS8EugxqG/FE8+KZYd3E45NDvLW+UqBbdsP?=
 =?us-ascii?Q?JmsglCWpmEYX2eTJtm230HUZdecZUyJOMcdMXYwYBL0kWffMg3Gf2lZ/tLm+?=
 =?us-ascii?Q?ImpRiFQabrdzrN/kHDXMG5b5+meRKHIxqRS3Sg5zr4E0etVG/MqmTYrFysz/?=
 =?us-ascii?Q?qWtIfQlbct4yABIbz8xOYoarmI1BPYug0/1jJdGAYY7msZ4/gtfpTAciei9s?=
 =?us-ascii?Q?9LESifEjsQ5jXep1epzN3zQl9zCEJ0qre707beH9O69Aut7efkON6/2xQO+D?=
 =?us-ascii?Q?z5PcTYn+RVO2kNUH4N0UTgvVOb4UWtFe2Fs4w91blbOwHbJQMYZpjeMc0dNb?=
 =?us-ascii?Q?ixephNGfUxoqb4BNIkyryz8cuPReRzvdXQGyX0x5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e64e02-83db-4092-7420-08ddd9a7512b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 13:51:20.4112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2z1BBjJ1wbLdPs2fsW+lzEikUOUeYgFOg7wucUHLkTCwB0d357EufTJR/o0htQ5hxUcszp6XNczkJMUBF/wIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5304
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

On Tue, Aug 12, 2025 at 02:59:30PM +0800, zhaoguohan@kylinos.cn wrote:
> From: GuoHan Zhao <zhaoguohan@kylinos.cn>
> 
> In xe_hwmon_pcode_rmw_power_limit(), when xe_pcode_read() fails,
> the function logs the error but continues to execute the subsequent
> logic. This can result in undefined behavior as the values val0 and
> val1 may contain invalid data.
> 
> Fix this by adding an early return after logging the read failure,
> ensuring that we don't proceed with potentially corrupted data.
> 

Fixes: 8aa7306631f0 ("drm/xe/hwmon: Fix xe_hwmon_power_max_write")
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Karthik Poosa <karthik.poosa@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>

It looks like the original idea was to try to write even if the
read failed, but it was not a RMW function. Then, when it got
moved to RMW this ignored error was forgotten.

> Signed-off-by: GuoHan Zhao <zhaoguohan@kylinos.cn>
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index f08fc4377d25..eb410c5293e7 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -190,9 +190,11 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>  						  READ_PL_FROM_PCODE : READ_PL_FROM_FW),
>  						  &val0, &val1);
>  
> -	if (ret)
> +	if (ret) {
>  		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>  			channel, val0, val1, ret);
> +			return ret;

Please change this to drm_err. Now this is an error that needs to be visible.

But also, I believe this error needs to be propagated up to the caller so anyone
using hwmon will have a clear indication that the write failed.

> +	}
>  
>  	if (attr == PL1_HWMON_ATTR)
>  		val0 = (val0 & ~clr) | set;
> -- 
> 2.43.0
> 
