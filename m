Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B17768A7461
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 21:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E69E112CD6;
	Tue, 16 Apr 2024 19:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fO4rD8XA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8033C112CD6;
 Tue, 16 Apr 2024 19:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713294515; x=1744830515;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P4aIAdNHI2y4VMqXZIFY+o6CoXT6eKwJJzRl0he4pp0=;
 b=fO4rD8XAucDAeVMxnqTeyieAH+D4RmC4yI0N10HXb9f5xZPdMgn6CDdP
 8ZFCJHXhnbsLrlFzek5eacAcNDrHGT4JnpcXUMKooR//zUmsH3gg8cIgU
 4V8C3evkVGEI/cu5hVLq/ODGXlEA1BQjFggRd9UJ20Qrj97WSezhbtZqI
 1N28rs2AIBbfdpIAvPxibl1ynIkHyi1Zhp928IXOXgc60tH08cy544AEL
 M8itDOcn43l/kLSwErSSBJczPjfPwOUjGqn24YxsA1YJxJax4g5I8e1bk
 hwzcOUrz1HRP+ib6Fr7lC0xbhLSJLPYu+MCK58394qD9QopVBmoavuBG9 Q==;
X-CSE-ConnectionGUID: LG0BSjI0Q4iaz5XvchXUMA==
X-CSE-MsgGUID: B9jWnICYTIKCyL6On3X8UQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="31239642"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="31239642"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 12:08:34 -0700
X-CSE-ConnectionGUID: prdFnDrmR8CF0hEpw8yO0A==
X-CSE-MsgGUID: 1CYI3aiPSp6jeO2OXcDkgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="22834771"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 12:08:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 12:08:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 12:08:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 12:08:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 12:08:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kF4oUJPam5ZyX/5LuO/Ya2W/y+3zy6rPrjTBUWO2NxvMpKU9f/KH0F3zkf5C5cwNQlieVRnNRH7pbWy3doMO6giP3TdwIbHSfije8F2OTfDL9KRgV+dZgjXynZoXXyaxNgcFQxafqALnJefDsQqLsbc9JshCv+Inh4Xe/vlQlhsTvmagNp4Um9TvG4snaTNnOumsKxFCV0X/dDs/E1KI0DFWrxwAlppYata2eXhBiKbOs8curX4Ui8HuwAJiM32tZm18nMb77q1meuJR9vAOuqysJJUZfna5qfj96TboKLqBfRypjeB4ZVjphuUqrLJkx5rvPuOFyy10fppDyssd/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlXato4wrLzPfISFE5YZdlR2noj4T20gexiE0UyUbVY=;
 b=n/JPMxHQ2xPJmG9WWhUTxh8+RJ1xGYN1ySgfMKPOdXZwtOO/kRTj58UPTababVXwRPWASLvs26N74ZtL9wrw/xeRWhocgA/DBjAbBn5npih1mVifB123wmGQ6sFUImHAjkpWpAl3FE8tYozZnkMraytU1OqY5w5L8iA4CVQ4ItCxfmlw3Z8sibl4LxHffeJRQb67PDyt5ROxbRyRPTT3QqD5sEos3p9OxOES5My/DZmVsVtDq/WerVi54mlv4kXjB58UJsDuarM2tebZKIHNAgszBBM9RmLo2PdEFTxXcno7n2n1UotWWcjQTvPuahbz2Te7AcxKTayL6ZweBh9/ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8767.namprd11.prod.outlook.com (2603:10b6:408:215::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Tue, 16 Apr
 2024 19:08:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 19:08:31 +0000
Date: Tue, 16 Apr 2024 14:08:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Lu Yao <yaolu@kylinos.cn>
CC: <ogabbay@kernel.org>, <thomas.hellstrom@linux.intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: select X86_PLATFORM_DEVICES when ACPI_WMI is
 selected
Message-ID: <vxcohxeef53mqgz5frmo5n3ol42eyawqvcrzti4ebh2qnaqpnp@qckpzayhjemk>
References: <20240415025215.15811-1-yaolu@kylinos.cn>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240415025215.15811-1-yaolu@kylinos.cn>
X-ClientProxiedBy: SJ0PR05CA0183.namprd05.prod.outlook.com
 (2603:10b6:a03:330::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8767:EE_
X-MS-Office365-Filtering-Correlation-Id: a27f767a-0221-4d81-ed56-08dc5e489af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yBmUtruliF0hVSz/AciQ+Y+r5LrNMrKfwY77aPNs4/faXCrJk9WGzQujgkWCDM8cmlwZxhM86uZWdlbWOWe7GOa8kZxNhgViMzLWyLq28QJY0nI3mSuPTX0BASaGTuTY5uinGF1R8ro3vfWgtP8ZDkl7rUZwhHL5oo8APLL/RTUO93JVnEE9VoHymU7EUqX3nU9t+jegJWBRFn4Zpcq6dy5y2tWGYok4JpSeK4HKV7KAijRvdOqUFCgymPiMAqO6SJq124XP8asQb9XKple3nY8z2YADge578T9HjdtX+3snAtLIrNxALDCPT7jJVVG7t97RYKUt7PHDkuCzSqaeRAvmAQMhBJ1vPM2Vm37G7KWSABkb6JLosHFNAPEP1FuGQDY9krYspRwXOSCCvPECrvloWBePEQsUh4GxfOlQYkY4wT9hfhPfQebjn0VaOMDAABbwAy9ul517K3B5d5UgVUNkBTuCRx2M3vxZrOl/Cp42dt6GTnEzFsSZCwrZuIn9hKMXaIuPFx0BlO22EX2UFJG3Zju7hwlOrdOeYnzhr79FgZYSik4CD/MEomSv1Fok0ibLa/PqDm2ug5nBzV45+v1/9U4OOXk+CSWv+J4XsEqLgvpA2pFPn7bMjwXPh7OBpKT2fM+I/O3RKVVSkuK94dD9fltDsa9N2CCICxtV8vE8+VjibSxanKeV5oBE/CigTNRK2vrdu+jBOx+yRjz7lA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(7416005)(376005)(27256008); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QKwOPkiyRDbpkS4oEwmfbWTxRVBpYvUCwhM5qYn6kMw9PftIqa1kU9vyT2eh?=
 =?us-ascii?Q?urwFEFjhGfVCQcc6UUWWYbrEzEaJSijaF/u7gqefHrroZ1+juTWplqrxSVLF?=
 =?us-ascii?Q?v/uYGTpM2MPGbwOHjttRXPJZcqqHsxDgCIpStidJynlLmN0npm1EvaRn5EKx?=
 =?us-ascii?Q?SCwqrb9ELyhcKzlhY2XRk6sMFKrLxg1re+qHefYXD190fBO2oXw+b2mk+aj5?=
 =?us-ascii?Q?cTX3cm64a7KYwsDB8ib+9tUd5KK/EZNVUQusPiQ+i/8cf26pWWu1Zz8VvhYA?=
 =?us-ascii?Q?NI3G0JxbB3QSgPU0DeyKEfshGn1Rj7iIjXoN9HZoQ3G2CwKHCIOpCg5e1+gk?=
 =?us-ascii?Q?bEKGsXjsQlgClqL6EOFQ3vzxPRB5OEfTqRHxnNXnrVzflfih4EMcJL8PXDXi?=
 =?us-ascii?Q?gWDlKciiCPB9x+WSpluaCUDYgGmAUFajObRxiquwDA+CzJRmQimS/j5ybw8G?=
 =?us-ascii?Q?BbeidYio5hueXSgQZLKWGjDNIgBWfMG+oICVwDToUhctHEnjzTt+/RPO3zpJ?=
 =?us-ascii?Q?P9I6Ixgz8mxbd+pXatrK8RGxj7kjnVoSWdO1ebNh7drMLKyUFxEuvVsSfqF1?=
 =?us-ascii?Q?k/UQiqiXL32yKKFQ/rP2xYD2xR5Tbf1K+Dj9TsEGANjfg2vONIfWPuj6kh6x?=
 =?us-ascii?Q?o0LQschuq6ToFttkmnQmLoSa1orTMxz2pPUFo/XZnxQPegfKey134MWuxNPv?=
 =?us-ascii?Q?bymnqhKbFHVf4YxACHy7m32lJF29RyvN3gu5bGikbEudQpoIG6a525/EARTX?=
 =?us-ascii?Q?axnEP6vJBjaN3CusU7YQGUBolcLuYn46TiZEw7kVkl6DA75dqcL4a9cfcwm0?=
 =?us-ascii?Q?8ZCwb9tBoIZNykdYJlNxk6X/CTktt2rigYhBm4Jv6fVKe7RS2rk6fMS63/7a?=
 =?us-ascii?Q?PerDa9TNvpTmys3MN7bDzYeGqgnY7A3HLgrn7alHiLbqNMi3CdZlXdlLP9a1?=
 =?us-ascii?Q?Q2KOWSMqPcKCgYWuH3Vqu/ciuP4Mnl/ejz7UqhOjeeS/SfA8ZgTM00EXhrNP?=
 =?us-ascii?Q?DVrn1wAsKqvF6gAyxSsByjNHsTG1rbZiLXQHwOeeTBQuxgTZeJ28mWk/bLAw?=
 =?us-ascii?Q?QiMvwd0YD1D1K+2eQD10dCItQPKqNIQGrpZVBg7RYhM7KUKkAQMkYWu5fwch?=
 =?us-ascii?Q?hSrjLugnNtWN9P8987wmSn7diXXxdKwRmWQRiKc8dcLkGzZGupcIb/e1sZu3?=
 =?us-ascii?Q?JRx4j5bV/PtP6akajXzSx3nPy2mnyJZp9itIDO9EiyjMdaDptEOSeA66Pln1?=
 =?us-ascii?Q?BOywZwk5+MutqfwcVbMqYzxfmkQ3XZFHneO9Rrhc+Rh0AdT7ux9kgqit43Ff?=
 =?us-ascii?Q?cFRTvlpWkdaAN1ueC1wGsvrlnUcODNvtslCF7UgZfXJ3wS7hrWWLe2exkV7y?=
 =?us-ascii?Q?9QmNL4EibvfopdvGCX/9KbA4p3ZMDKRX1k3VZ5E2mMrHiMLUY8rvClUwXH3E?=
 =?us-ascii?Q?GNQthNxY9nLMmMBKPP2Iz4G4HxDMpq3B22OMwMz64gNDXyp2Nfgb3FDjygoU?=
 =?us-ascii?Q?o0TkOxBKvfoy7JJWpZiG0HAFlbOioaqhnKUWaF14EyDXtUdnz5gs/wANDsh0?=
 =?us-ascii?Q?x9yqy9dqIEbp0uzm7z5P4K2355dsdk89L5dBjbQKaKFvC/6eXNEiL4hF2B+Z?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a27f767a-0221-4d81-ed56-08dc5e489af2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 19:08:31.1708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iczn7RynzZjwEBc7B0TsuPkF1IFfmMHE0VC3E/iSDh2lsMn5z/29ReWVs3YYcnICMpgfG5MpbZD58VSAKjuzgRFfjXxyUhUhqe9dm4w5X+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8767
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

On Mon, Apr 15, 2024 at 10:52:15AM GMT, Lu Yao wrote:
>ACPI_WMI is a subitem of X86_PLATFORM_DEVICES. And X86_PLATFORM_DEVICES
>is not selected in the current Kconfig, and may cause Kconfig warnings:
>
>WARNING: unmet direct dependencies detected for ACPI_WMI
>  Depends on [n]: X86_PLATFORM_DEVICES [=n] && ACPI [=y]
>  Selected by [m]:
>  - DRM_XE [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y] &&
>    (m && MODULES [=y] || y && KUNIT [=y]=y) && X86 [=y] && ACPI [=y]
>
>Signed-off-by: Lu Yao <yaolu@kylinos.cn>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

and pushed to drm-xe-next, thanks.

Lucas De Marchi

>---
> drivers/gpu/drm/xe/Kconfig | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>index 1a556d087e63..f483e69a5d0f 100644
>--- a/drivers/gpu/drm/xe/Kconfig
>+++ b/drivers/gpu/drm/xe/Kconfig
>@@ -26,6 +26,7 @@ config DRM_XE
> 	select INPUT if ACPI
> 	select ACPI_VIDEO if X86 && ACPI
> 	select ACPI_BUTTON if ACPI
>+	select X86_PLATFORM_DEVICES if X86 && ACPI
> 	select ACPI_WMI if X86 && ACPI
> 	select SYNC_FILE
> 	select IOSF_MBI
>-- 
>2.25.1
>
