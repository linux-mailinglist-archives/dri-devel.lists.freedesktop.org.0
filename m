Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFA69723EF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 22:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314B110E6AF;
	Mon,  9 Sep 2024 20:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HO0yaf9o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D2910E6AC;
 Mon,  9 Sep 2024 20:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725914865; x=1757450865;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ly9P4w24qa+jfvKFg8E5qEQBQJsiycWg23lQzhgz+G0=;
 b=HO0yaf9obgAnHxM8K2tEotFTqu8xS/DMRrhhobAc6zjwOvpcuDCZcQeT
 JNZuG+2QQ5SBxqoFjWhdmZGEoKMMswLFUs3B1eLdnmYhIm2CgOSPN7s80
 1Kq+bqAarpCaXDlrm3hUSyRYWVOrpbNIkezK55cIdmikVz4DW0dsQZDxb
 rGs3brRp+EqxF4wtRfRR7kXCFLg20zj1G5X17ESXnLwzHWZ5aeuVB1FKg
 hO/zJ5NiH9um6Z8y9PFQYngT80zQI9P2SD41Z3tDRDb5D2ahhP5nPAEfz
 K8obRDJBX2y/JqebMygzMBc39oK9FJJ7bc3fEc5E2s9FuJxZBFeJtGHFm w==;
X-CSE-ConnectionGUID: RamONCQxTjqSJQz3kXwssg==
X-CSE-MsgGUID: 5OQTCRFaSOiUccUU8Z8mrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="42150492"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="42150492"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 13:47:44 -0700
X-CSE-ConnectionGUID: k+O41t3RSI2tvXpDLQ+w4w==
X-CSE-MsgGUID: SKfrk7IBSe2/XyGioHJoOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="71193925"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 13:47:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 13:47:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 13:47:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 13:47:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 13:47:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMdwrYACdZiPz4hApsqAezRrTDgoCWR0HZBG8L79/JjTUMh+hwJr/7UzECNzjaPh4sPDaYfH9eQ2ciEUuXNNSpekp4q78HaHAG5KhiUGzwlvU20mgQOoQ0tXkMerjOOTeYIIa1XsJv3MQJq5ek+EG1rzXnXm/qfORv8lHuWQq4GOVr9BuvuHKgnUaG9MM1GAO220AvE0EH9J1J/oxzJfrDpf84cCvHn24X8ltm+/RZBJV+fM6YXbsbdRqGih4fFDrdUEE3fpkSyK2glBXWbY6fikE5D9Px6NtcSJX8SuIwYxzyv8/v3jLcMdrzuXZnmMKbQLFUMGb4+ADc8lzoT3Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJY9FeFwKZPrfQgZob+vL7OT1+8Xt9alI4Et/L2woEQ=;
 b=tAUR/fwylBO5ALqbq056K6oX2UnOeJD1af82U80HmTmYTBvwAAC8znHgxoFAVWkMPrFzt/iN4Rmto24EYGf8JnajW+VTbyotj8B5dVfrvpexV4OO27NrT6N+B4d8ZNy6fbee7Vh6XmGPjaq6zLXa8KublKRJbR1+AJ/uUcSeKL5G0By8WXlmexNo09DyctIASY/RamkTdm3VdUyWIHFqQMtj/eZeCJJsgvrwxfewQuYEN9YmamFrvVw7UCWvHLrDOURdAwKrpm4/gWtER6aFFiB4bJbvMaX56Eje3H0FP3nHVfipobnMsnkMEW66nodINYBrZEfaKvluCfYxIKQLTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Mon, 9 Sep
 2024 20:47:38 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 20:47:38 +0000
Date: Mon, 9 Sep 2024 16:47:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Arnd
 Bergmann" <arnd@arndb.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Riana Tauro <riana.tauro@intel.com>, "Jonathan
 Cavitt" <jonathan.cavitt@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: fix build warning with CONFIG_PM=n
Message-ID: <Zt9e4K-MGEqt4QhC@intel.com>
References: <20240909202521.1018439-1-arnd@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240909202521.1018439-1-arnd@kernel.org>
X-ClientProxiedBy: MW4PR03CA0249.namprd03.prod.outlook.com
 (2603:10b6:303:b4::14) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|IA1PR11MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 4837446d-2857-4104-cdf9-08dcd110a1fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ui/QmHyq8aNfvfEEilytmAD7rs+DYtWJ3O6mO8p6x7WvgA0V+rRhLmCVvUjN?=
 =?us-ascii?Q?2+ppsdFe9IE2qdycLh6aDJA/N2OxgHeJWPT4HaQ9jMVVL5rlZNBzYnoJ/OoB?=
 =?us-ascii?Q?PmXc/flvCf0OeKjHP0cGDMGDlnVpiWfnNrhAybBPK7h/yTMfsytUlfJRUG13?=
 =?us-ascii?Q?X+UTLdTKrkebOQnorGm1MBik/aBe39S6x8lWVyaSgvlXOPpTj9APomR5sox5?=
 =?us-ascii?Q?b9XwGPV/GusRjBeIZZUKhfF4/BfbTYKwnq4M8tHY3ky4xTjSjZSpZkx1ScSU?=
 =?us-ascii?Q?8T9hWzK3ErFaFvH4mQmF/s//3iQUxtc2TSWplMVJRvAT9StZHVefHgtJ1uLl?=
 =?us-ascii?Q?yJyYkVDY3SBXJy216PR9z5I7l69hkA0vWAFshUGGQOOEdfKnDuhE18CmPien?=
 =?us-ascii?Q?QGTfd4mQKBrrSxZUVxOGbaImDtHvBhqf2J5Nmr8e5Et594rbdO7Xkz1MDKm2?=
 =?us-ascii?Q?gdiycZ7Upt2cDP8eJiguZ1fz0Ttff3P1W5O1JRJ5CLy7+ZFAK2GAt47NJ5Kj?=
 =?us-ascii?Q?g8wsQNrTsWhQH9bdPwN2UJZZUMmIg0wcWNyOMtS84uv/aiLUrjYMwcpeR5Zb?=
 =?us-ascii?Q?c0Kd18QL9R6kXDrMvFlyrH5sxc3/aaoV/BgB4dzNvTnjLitr9Lq00lBd46GL?=
 =?us-ascii?Q?Ep6Ns92ajgOfFfwgM57ve45JPRLiex3099SsMNMCgZ786v/UBN+Hw4oP3ijc?=
 =?us-ascii?Q?2xpaONUyPXrOsfK0ZYCBC0nhmekmPIBoef0l7EfQhIr9zdWakOD8ysJAu2fV?=
 =?us-ascii?Q?1x8NW7cNpvNVx1AMw9LUpQj5hm1RHG7m63hH6eKMAEHcbgJK1kKEr+HbRRK1?=
 =?us-ascii?Q?qptceRyzjuG4pQV+2S3dabVbRbrx/f/iZwID1LFHoB1AwHQfMujEPDXD8c4d?=
 =?us-ascii?Q?pmvCk2kWxDH9MoC6Ra46ncAyRdsUbLHcBm+QmhQVn5ygp5gbIlaXz7VJQs+R?=
 =?us-ascii?Q?3qrsc/b273C0iVT/r76y/ANLWZLWD+bBvl5KxEXJvmXYG68RwglnjlluDHOG?=
 =?us-ascii?Q?1QU6wfs+j8iXJmPNUvHGdUY/YIsRP7TW3PlBawbpOwllrO1yrWaedlLTGM8O?=
 =?us-ascii?Q?7DEIOuewCdJSxLByvrqMTuc8kSAZM7KesiiwpZoNnQlUAkkJvDK00lFvIsyB?=
 =?us-ascii?Q?CFpHLW+VN1D11b0ZxGuzThQm5PRanlKmjCMsrGKVDmtuYMx6lwiKoAtmG7ip?=
 =?us-ascii?Q?w/zorx5L77pYI9N8FLiYeqm+9VEer6g6QGNh5jtZIBOREE82vQfGibalf4f1?=
 =?us-ascii?Q?jcQZhlKR38uQ6FbD3JP0hLpwvtHs9ChM/DlyACyG8nYcSbzERMs2FRYobfet?=
 =?us-ascii?Q?Ab9i2LVafcdHf+rMuoezgjmWuBZ4fYKkBWFiqQ9xfxBPhg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QlUFzmttAJSPgraCNF9bo4Uy451yNpEdoVW514t0gk+QDFTAe4p9MsaiZA80?=
 =?us-ascii?Q?y4tLYdrVGseO9EQ8fJfcUiRydyWXMP5elgX5oPDRx3g+kIYN9YLKD7wfhQVT?=
 =?us-ascii?Q?8SJTJhPt1Aqo6CWbmoE4Aec50jOu9gziEc0AzE+QwI0zaaHm1VHbq70+2/pO?=
 =?us-ascii?Q?t9DINumdGLOfqhuMWm2PSuIK5BqWxrb9+MUc+RA08RRgFvD9S1hmnao/BkW8?=
 =?us-ascii?Q?Av8C6WWRZap70jc+4QvMyE6Ui6gIdApogcK6ecqLF04C3++hdHgcuIithzyn?=
 =?us-ascii?Q?e26YCBBklA9rWWynqDgEcoHSFcz6uK8zolucAHN/YHhowdNsmhTWvt7wVxci?=
 =?us-ascii?Q?M8qFPAu5/++uS898NjAngAEhhv6zcQBpJR/bt5myIQB1quBA4zsFYYPpzyUV?=
 =?us-ascii?Q?NaU1x534k84hLIWWB5URK751ive6EohDAwvvSVyicLezKBs0AVbafTXsyryh?=
 =?us-ascii?Q?L+wmCdjx5cea3zN1qU3vpRvIM+qu0DJAZMi6jWYqAJFZFd/liWj+YP3RUs/u?=
 =?us-ascii?Q?UsbD0jOSnH62TvIKSkts0Ip7iPXy2dxLnRXNu8cA5PkW+qhL2z0cEYn66I/L?=
 =?us-ascii?Q?vMs7HRS3EUOIKuyKihYzIEx2dMLyBCMCPPWtXSpP/7alsPg7Uail1ZROvAQL?=
 =?us-ascii?Q?yS39b4KHATiPedvHt5hhOXowbgBXZk1Br+GEqe81vQo12PokOlvzuS73mZCt?=
 =?us-ascii?Q?YuAkgscVWrT00RDDmYWfd3K1kYKgOPW4otSiMDV8veR4HBSLV4snMZHhdQtP?=
 =?us-ascii?Q?ktoCxwGPI4uUGEvUXRUUTi8ZiR8/ytjGTHNmfTj/DYsgNP0x1hdONwgQpvJz?=
 =?us-ascii?Q?KkPLlGGopt2VxOM1+YGXmd8o9lWXyXLf6trjheuDe2vCGs9PI3LD4PqEOEzg?=
 =?us-ascii?Q?4XGKVn/iE9WGjntUR4gAQWHr1/GO4t72nUw432uKROKuF/TwWvCnVzRAOrG5?=
 =?us-ascii?Q?DSiDR/xcPt+ZhdmWGYOPoSzRvR7vkBwly2xZeGFfgwMvHk0oTazwQpi7pmve?=
 =?us-ascii?Q?4WI82EqZ7C+qnpSBE7uJXGvfpfTk42mrQXgLzx8KuNFAOPZn0ldNyeBWKC4p?=
 =?us-ascii?Q?qzcpx8bETveLUVB97Ok+jCcCjGabiOCTuL/Bz7V1ng17JMMhf8XHRpzqgapI?=
 =?us-ascii?Q?sza46FysxOeQwa95r8RQHM9fDzfSa2Ci5deohKY0ZeABK+YJu5BUPNMFgGJX?=
 =?us-ascii?Q?idZtzyrP6tRfWEm8Cg3hDsPw8jkNOT8aNzgPth8wF4Z2nFqrI6VHJqSYPYwv?=
 =?us-ascii?Q?Ty+MpLqrGp3zSrzcg1jk18by1b5Noh96tuBR9hJfkdT+VIf+UhRfkW6xzt+A?=
 =?us-ascii?Q?troq7NpZcnqQAmb6JO84oNeRYlKnAoKGUFjqNB0/j4L21jSU0wnefnUptJ0E?=
 =?us-ascii?Q?EGB/hCPeK09k03PbLnS0fg53fIfoaaDPNC+5J6CCMKauDTxotH2Jzn1Qsw1K?=
 =?us-ascii?Q?ZaWYegWzt8F2siRFetZOmhIU5fukWB65mpKcpXCR4AA8FS8pgKgbXpYJRNvD?=
 =?us-ascii?Q?vALuG230N9fT0LMId8W9RwAa9dk4vKheBGb9nzKpXcARvp2zFylvp6C8ukMa?=
 =?us-ascii?Q?kVn7bsWYR3UDMSEDpFvGKtSbOWXzcl1V4XhLjgREv36Q49ZKZPYVghPbGd30?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4837446d-2857-4104-cdf9-08dcd110a1fb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 20:47:38.4835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pTZmRujLVUT9YyPWPt27N2Wmn8zbSbpK3TE6vaMTW8Bwt7pKh9ViYeLaFZdtcoydjg1cdZHfkhYomBztM6n9+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7198
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

On Mon, Sep 09, 2024 at 08:25:08PM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The 'runtime_status' field is an implementation detail of the
> power management code, so a device driver should not normally
> touch this:
> 
> drivers/gpu/drm/xe/xe_pm.c: In function 'xe_pm_suspending_or_resuming':
> drivers/gpu/drm/xe/xe_pm.c:606:26: error: 'struct dev_pm_info' has no member named 'runtime_status'
>   606 |         return dev->power.runtime_status == RPM_SUSPENDING ||
>       |                          ^
> drivers/gpu/drm/xe/xe_pm.c:607:27: error: 'struct dev_pm_info' has no member named 'runtime_status'
>   607 |                 dev->power.runtime_status == RPM_RESUMING;
>       |                           ^
> drivers/gpu/drm/xe/xe_pm.c:608:1: error: control reaches end of non-void function [-Werror=return-type]
> 
> Add an #ifdef check to avoid the build regression.
> 

Thank you

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushing now...

> Fixes: cb85e39dc5d1 ("drm/xe: Suppress missing outer rpm protection warning")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 9c59a30d7646..a3d1509066f7 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -601,10 +601,14 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
>   */
>  static bool xe_pm_suspending_or_resuming(struct xe_device *xe)
>  {
> +#ifdef CONFIG_PM
>  	struct device *dev = xe->drm.dev;
>  
>  	return dev->power.runtime_status == RPM_SUSPENDING ||
>  		dev->power.runtime_status == RPM_RESUMING;
> +#else
> +	return false;
> +#endif
>  }
>  
>  /**
> -- 
> 2.39.2
> 
