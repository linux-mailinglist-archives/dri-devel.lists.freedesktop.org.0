Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FF29F94A7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 15:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C3A10E4D4;
	Fri, 20 Dec 2024 14:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZaijbfWr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2EA10E3AC;
 Fri, 20 Dec 2024 14:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734705697; x=1766241697;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ztSP4YxSuTlxqTO2QQNpUbtOH2oIvfKaLopY7zG98+o=;
 b=ZaijbfWrCIEcvqcWlRaarUDqKkyIZ8u9GPULJmMLiv8S4ZAnAsTPDYDF
 XKqm9i/Dqv22KJRrJ75VlvxH5hpJ2HqNBOwapYI+b4+QRDKAxJq6Zl9qH
 lPQvTFLNcJNOdo4HQb8G2dEZXIpysIIAqe0Bc/kw1LYssEGRcoeygPOFl
 5HiMoTAvQD9oEv3ex/+b4sDeiOsmn3enXO0xE1H17Tim3bji1n9z64JWr
 0fJRAX0yk36YeQhSw5cqeFgf7Bh6NZP1oRLyaGfaSc4xastKWlbGy0EI/
 +qldM7wWl3gWgAt4nR9fucm4ZW40C8kXc/4yJx7c+X76T30Lw+6ZFxiET w==;
X-CSE-ConnectionGUID: tpheYksvSf6WHjjhDlOo7A==
X-CSE-MsgGUID: qmp+WlBsQYePNIE88bClUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35471887"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="35471887"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 06:41:37 -0800
X-CSE-ConnectionGUID: k1uCUzwwT2uAbig22ReSRA==
X-CSE-MsgGUID: PQbaT74IQ7aQTo5mNE6pnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="129343193"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 06:41:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 06:41:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 06:41:36 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 06:41:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVEg93UTO9aHLzZeQVjZmrMz2aunYiMiW4vDkkUMhBmBkvIGU9a+NvOOqhO8pj/2ASqKKmKNfTCUNyqMbTufrNHz8oaxZD9OJ7IozY/5qp4jWKPvw/odilP2fzwsNoP+4U8UXpr3WO87eptOdVEGQWGFfu7+HW04EoXe7+u1qTb3A3oxolBPeF+dJH4zZwW6A9/aC2ZNO9Hk2mn5fsRA+4yPISrfgsla7lEIBBs7GZ3VPW/HYOb7v4JR5DweJyEfaw8pwpgnY9tScVCEOhTE/RX+xvqHHl5BABFhnvn9A72yskfpGhAst1Z2jMK29lUiCFvTcW0M1Th6KA5mgqKPBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mUw8UFJVlNOJT0oPUeGErn/BUynJNP97hB3TrbvePo=;
 b=Fd+lagKFBlR5/3AE68UOFoIqoD92ZNKLrtRDtW2n84olpveXFnYUXA/s32wiVYcgIm2Cj/x0an+0wqKOnznTEChacHYBw8+7AV5vkcP0ts624M5Hi10RdN5EVFxyk5o7pJuJLKRd55BGdk/iEMECFDK+RvbaTA4NwB6BUOxnfpL48aHUh+ZRm8DlVmrJgxb+JHq2atHgCdGTtjqrFqpW3nZQyQZ0DkIPy9hj3CUIGdHd5pUbkyhyjjvt5gFfoliyDHdxThjOyekAJ/dMor3r+ZyvoHS1HuKuaOLoXHmwgaR0FVUbTVPTvz6R+Szo1KPyIo0Z3IelZNGjWj6S1rFqGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SJ0PR11MB5199.namprd11.prod.outlook.com (2603:10b6:a03:2dd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 14:40:59 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 14:40:59 +0000
Date: Fri, 20 Dec 2024 09:40:52 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dim-tools@lists.freedesktop.org>
Subject: Re: [PULL] drm-intel-next
Message-ID: <Z2WB9KDsuRN-xgo-@intel.com>
References: <Z1n4VhatZpvT5xKs@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1n4VhatZpvT5xKs@intel.com>
X-ClientProxiedBy: MW4PR04CA0317.namprd04.prod.outlook.com
 (2603:10b6:303:82::22) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SJ0PR11MB5199:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa8d5e7-cb7a-45ba-fd2c-08dd210451c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?pnhpzmmHCg65OQAhLQAatZgIeva/KOgsNXkcSVBwYxL0lALrXRDYyCWWv/?=
 =?iso-8859-1?Q?tRPD22punCXeTbH4DwHk9/rZwhACuPwxNAJloU1NbMxK2ymahxBzuwNms/?=
 =?iso-8859-1?Q?xexaMseJznmoAFjSla2ydR7KcUqbfYLgNsYp6IK7zywpbQsl/K+xmcQliL?=
 =?iso-8859-1?Q?pp6k3fopHFhjN2SNlL6pppH2cL9z2pKMz+CsO/rUjzGqUhPxauW3Dov90W?=
 =?iso-8859-1?Q?esmJ2gWt2LI0Yffi/gn5hbElnjXyPnVEqElzhGuatFuQWO4xfYAzmTEigl?=
 =?iso-8859-1?Q?Rq+iehGUOdandcclL/BurncjjgWjHp+b/YjsOVoVdFeaJNOms6l48KgjxK?=
 =?iso-8859-1?Q?p36pgOZ3GZKtJIesCPr0wPSUSe/Zq/mw+i0iX6fdwCDg3eW92qjE9tl1Md?=
 =?iso-8859-1?Q?59jg8ChpQKWB3uosZf8rKWF+wxKlX1/qAHhn8B3Jwyu2d9tDd79HgtjRnf?=
 =?iso-8859-1?Q?6dowiiS1k8d4EWONbSgu689Qxgwp61LzKhZ+VJAM6AAuI7ysojWdTkqr6k?=
 =?iso-8859-1?Q?nQibx29IJaf3S5Q8e7UamZTm2MM9IWTLtifzTM+o/r5sMkMYuhx6XffL7X?=
 =?iso-8859-1?Q?Bdm5lP5BV/Exj3h2k8plgqoea/L9t0b8GORqpBnmHgvu3wpMvCiOtSv6Sr?=
 =?iso-8859-1?Q?zN2tAytIgK9qrjS0uQkYwuYCO/FwwvT70Fn7MpKx854RsYIUhAdbG6a9Qh?=
 =?iso-8859-1?Q?QWuQwZOvWEmfxjYJj0zDlV2VcW73FIHEMcJkrbWk++mJnLLhbP+3K65+vZ?=
 =?iso-8859-1?Q?IQpyHys7T1hZVr3WvK8CF704EZn0s07GqAw1z+hgv+beeHI6iNnzQ23wcf?=
 =?iso-8859-1?Q?oMH6aZkrbiZvogO4nRHbyExbeSvG+ItjXVn/IsTLhECfC9pmfG+eftvGwX?=
 =?iso-8859-1?Q?H2hoFcGj48c5bBHIKQ/xc3+lZMigghSTH+LEwNcCjTbHe4CeaVCEEFTZ8y?=
 =?iso-8859-1?Q?Z4zR6hIUEJpFSdHGJMqG8PPet92195AsyJ0GcyyBpCKrcLuA0DM9i9vHyi?=
 =?iso-8859-1?Q?ISZmRie4ycus4QxZIrk7nUS5dFLiBY8BpO5m4uqUcY+G1lGKkfGE991U4m?=
 =?iso-8859-1?Q?VwkrlTcMEVE+oSjFeeD85twmvqrT5f95KQ4BOijvogEGKM1+Zx5wL9oCRf?=
 =?iso-8859-1?Q?QxlordhI56480RTi6LUG/fYmjq2q2fZtpsgXiKEL7kG0XDzPVqTRiazDhd?=
 =?iso-8859-1?Q?RREfKuG5MCkLB2Yy6ym6Gnikl9ERFdYvBngrP6h+m3d6D78FWXzklLwxMe?=
 =?iso-8859-1?Q?JRcAQd2a5qLHxadq8qCbBNcPtZ8u5GOdOvl5YBnWrOiahEmCwefJqqOcNg?=
 =?iso-8859-1?Q?w87AAJKhsUwO209U0c0iVA1tD6Eteby3tHh3U5SRRi1eM2vFXEk6oKsliF?=
 =?iso-8859-1?Q?uaT5tlGgaOKFfgOSx2SB9ZpgJyn/rbSQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?sq56ZZlhYUFvrqU9CO6At3Tw/G+Nc2cmzRaiPDpq4SeY6ZeEsUu7/jWNVu?=
 =?iso-8859-1?Q?u7ghh9NNVCyLH4cIKFsYe6G+4beDvfGidbQQ/ut3isLLcEAbLVcmaHsV7C?=
 =?iso-8859-1?Q?sHzTVkmlV+oqTx3jbMvarwa1WZUSwFYsodwm3YQpI2tKEsfzJ/xEQ1Wt8B?=
 =?iso-8859-1?Q?bRT5hFUvB9LEDxJEr4W4N69sPzNRstDvaDc2xi2uBwhv9x6YakgKeEUGxQ?=
 =?iso-8859-1?Q?iqmC2PJ+3jrfkT3rrVNgRLJlNYWxz3zYpi45txx10zFkn/UyoMF3AK3HIG?=
 =?iso-8859-1?Q?cCp4e712UkFsulJfTjwER3WUQG5ptWwe5BklePvmeOTpv6hjgkeddTSWFP?=
 =?iso-8859-1?Q?Qh3uNW/BmlCBnJjxjBYr2G4UnCXYYNivZ1q1F8oBru6EI0mcL3VH4fIVQY?=
 =?iso-8859-1?Q?BhMO/gPjoZP2+DMq+yHxHdRszqzt0giaOg1rqsPlFEDyNh8G1awC/UICM1?=
 =?iso-8859-1?Q?s38fO/4dXKf0sWcvtm0ox4tdMC3ov//CcUUGYeRFQ4RmltaZ2vpZ50pl/A?=
 =?iso-8859-1?Q?R4lvuyF50KrNP/oZthDCzJ0JuCuziJv/hDcYwqP1LjqZCYrgFil5BHrABp?=
 =?iso-8859-1?Q?lF8zlWwL/e6sR54sm+yDFp5mRgbQonsGHb9zDQqBtW4CRCUSrXAEs3em4r?=
 =?iso-8859-1?Q?j6RB+AF/XbA3PshoBGKE0y2czWlrllyKjHLVsLiQmVj5GdzWtpi/seRtJO?=
 =?iso-8859-1?Q?5/sajRpeSgiFOOeQVhUMMiyoTUq4I90Rm3h/RO8sata07IZ7/StIlqKt3r?=
 =?iso-8859-1?Q?1Icysx4kxLJ3Xxjd6Xsv220QH1xJK0VZFOGscJhimPnXMkIuQca77uJTHD?=
 =?iso-8859-1?Q?PPbp9RSNJEBd4mLtIaPgl0dAu3wAlLYrOeGzYIcEEGTp5hW59X9EAIVUcY?=
 =?iso-8859-1?Q?uNDzyX1dup1Af9TDGwmwCiMy6G6f8Kl5IoWMfSZoZud6a4uFaO8YK36mXc?=
 =?iso-8859-1?Q?UnvHW/l2jbkKn+EQ0JD5EJfIQnkSbrS65Y45XOuU7IxdPSc/O6Gkxy3SLF?=
 =?iso-8859-1?Q?yRGrS+llDBLkgTjCmbqnOwDNITQ1hqJdAbRcvhdsO7j9+69XT2UOGOWfjc?=
 =?iso-8859-1?Q?WCX+WIPlkyBC5U5kYXH/JGtkiXXKHL9V4zIbRRlb025qQi6aeadR2Mvf0X?=
 =?iso-8859-1?Q?VmvpdNSGbcjTCTeTly6nEsJkcXQQoMgggebgE1eovIpshUvQXxrIWXUmV7?=
 =?iso-8859-1?Q?ILrKSAtgc/v4MGnUdzY4awCvLVukY4B2E8bs3YtVoXlPKii1pxd+IXixgB?=
 =?iso-8859-1?Q?s1OpU2SVDU1n2eyxQVWPaXpUFlx9wk5/JsfOOCU2VuhihJHu4v60j7CQqN?=
 =?iso-8859-1?Q?Gg/0EdvlLaQFNQiHOd0XLNA/vR/Pu3t8lg9t+0Txo8hNQ9z/z2iNwHtjS8?=
 =?iso-8859-1?Q?NoQfhhjtjyXQsUyqySNxxbpYWWXN7FLHThqJ3GTpuU+Vj7Ayz6GTGaQmtl?=
 =?iso-8859-1?Q?q1JRznl1rfsTKM4DIEstbz4h9VXAyPu3uIUONOSee7G+YKiMPikSLN+UFE?=
 =?iso-8859-1?Q?oAFPvgb4FgXhky7Gahpkg6+e/OHS6GCbBe9xeFYf8OjVHvkt6VxadL6rPk?=
 =?iso-8859-1?Q?LsW3FWYOGnRkcgN+YM3gfZ/XcsynTngmkqgv+AGp9Ml2oNUKkunlKNr4S1?=
 =?iso-8859-1?Q?e5mEwIrDvhFhcx2AricismS0wy7ydlETOpQCulVeCGUwG72GtnGx0TOw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa8d5e7-cb7a-45ba-fd2c-08dd210451c3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 14:40:59.3887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nb6HBaDlpLRCS/XJHqRI65YAD2s8x+i8GQ8gaHrAY+XoGzhbeb22alGWQeGdBmO2jmNQnylgCyGWYNE+CAyk0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5199
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

On Wed, Dec 11, 2024 at 03:38:46PM -0500, Rodrigo Vivi wrote:
> Hi Dave and Sima,
> 
> Here goes our first drm-intel-next round targeting 6.14.
> 
> One drm/print change coming from here. The rest is mostly
> display changes and one GSC FW update for ARL platforms.
> 
> Thanks,
> Rodrigo.
> 
> drm-intel-next-2024-12-11:
> Core Changes:
>  - drm/print: add drm_print_hex_dump()
> 
> Driver Changes:
>  - HDCP fixes and updates for Xe3lpd and for HDCP 1.4 (Suraj)
>  - Add dedicated lock for each sideband (Jani)
>  - New GSC FW for ARL-H and ARL-U (Daniele)
>  - Add support for 3 VDSC engines 12 slices (Ankit)
>  - Sanitize MBUS joining (Ville)
>  - Fixes in DP MST (Imre)
>  - Stop using pixel_format_from_register_bits() to parse VBT (Ville)
>  - Declutter CDCLK code (Ville)
>  - PSR clean up and fixes (Jouni, Jani, Animesh)
>  - DMC wakelock - Fixes and enablement for Xe3_LPD (Gustavo)
>  - Demote source OUI read/write failure logging to debug (Jani)
>  - Potential boot oops fix and some general cleanups (Ville)
>  - Scaler code cleanups (Ville)
>  - More conversion towards struct intel_display and general cleanups (Jani)
>  - Limit max compressed bpp to 18 when forcing DSC (Ankit)
>  - Start to reconcile i915's and xe's display power mgt sequences (Rodrigo)
>  - Some correction in the DP Link Training sequence (Arun)
>  - Avoid setting YUV420_MODE in PIPE_MISC on Xe3lpd (Ankit)
>  - MST and DDI cleanups and refactoring (Jani)
>  - Fixed an typo in i915_gem_gtt.c (Zhang)
>  - Try to make DPT shrinkable again (Ville)
>  - Try to fix CPU MMIO fails during legacy LUT updates (Ville)
>  - Some PPS cleanups (Ville, Jani)
>  - Use seq buf for printing rates (Jani)
>  - Flush DMC wakelock release work at the end of runtime suspend (Gustavo)
>  - Fix NULL pointer dereference in capture_engine (Eugene)
>  - Fix memory leak by correcting cache object name in error handler (Jiasheng)
>  - Small refactor in WM/DPKGC for modifying latency programmed into PKG_C_LATENCY (Suraj)
>  - Add drm_printer based hex dumper and use it (Jani)
>  - Move g4x code to specific g4x functions (Jani)

Dave, Sima, any issue here?
I noticed you picked the drm-xe-next already, but not this...

I'm going out on vacation today and will be back Jan 7th, when
I intend to send the last PR for both drm-xe-next and drm-intel-next.
That will be beginning of -rc6 week.

If there's anything wrong with this, please let me know so I try
to address it before going offline or I will fix/adjust on Jan 7th
along the rest...

Thanks,
Rodrigo.


> The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:
> 
>   Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-2024-12-11
> 
> for you to fetch changes up to e7f0a3a6f7339af55f1ca2c27131739d75569c08:
> 
>   Merge drm/drm-next into drm-intel-next (2024-12-11 15:06:05 -0500)
> 
> ----------------------------------------------------------------
> Core Changes:
>  - drm/print: add drm_print_hex_dump()
> 
> Driver Changes:
>  - HDCP fixes and updates for Xe3lpd and for HDCP 1.4 (Suraj)
>  - Add dedicated lock for each sideband (Jani)
>  - New GSC FW for ARL-H and ARL-U (Daniele)
>  - Add support for 3 VDSC engines 12 slices (Ankit)
>  - Sanitize MBUS joining (Ville)
>  - Fixes in DP MST (Imre)
>  - Stop using pixel_format_from_register_bits() to parse VBT (Ville)
>  - Declutter CDCLK code (Ville)
>  - PSR clean up and fixes (Jouni, Jani, Animesh)
>  - DMC wakelock - Fixes and enablement for Xe3_LPD (Gustavo)
>  - Demote source OUI read/write failure logging to debug (Jani)
>  - Potential boot oops fix and some general cleanups (Ville)
>  - Scaler code cleanups (Ville)
>  - More conversion towards struct intel_display and general cleanups (Jani)
>  - Limit max compressed bpp to 18 when forcing DSC (Ankit)
>  - Start to reconcile i915's and xe's display power mgt sequences (Rodrigo)
>  - Some correction in the DP Link Training sequence (Arun)
>  - Avoid setting YUV420_MODE in PIPE_MISC on Xe3lpd (Ankit)
>  - MST and DDI cleanups and refactoring (Jani)
>  - Fixed an typo in i915_gem_gtt.c (Zhang)
>  - Try to make DPT shrinkable again (Ville)
>  - Try to fix CPU MMIO fails during legacy LUT updates (Ville)
>  - Some PPS cleanups (Ville, Jani)
>  - Use seq buf for printing rates (Jani)
>  - Flush DMC wakelock release work at the end of runtime suspend (Gustavo)
>  - Fix NULL pointer dereference in capture_engine (Eugene)
>  - Fix memory leak by correcting cache object name in error handler (Jiasheng)
>  - Small refactor in WM/DPKGC for modifying latency programmed into PKG_C_LATENCY (Suraj)
>  - Add drm_printer based hex dumper and use it (Jani)
>  - Move g4x code to specific g4x functions (Jani)
> 
> ----------------------------------------------------------------
> Animesh Manna (1):
>       drm/i915/psr: Disable psr1 if setup_time > vblank
> 
> Ankit Nautiyal (9):
>       drm/i915/dp: Update Comment for Valid DSC Slices per Line
>       drm/i915/display: Prepare for dsc 3 stream splitter
>       drm/i915/vdsc: Use VDSC0/VDSC1 for LEFT/RIGHT VDSC engine
>       drm/i915/vdsc: Introduce 3rd VDSC engine VDSC2
>       drm/i915/vdsc: Add support for read/write PPS for 3rd DSC engine
>       drm/i915/dp: Ensure hactive is divisible by slice count
>       drm/i915/dp: Enable 3 DSC engines for 12 slices
>       drm/i915/dp: Limit max compressed bpp to 18 when forcing DSC
>       drm/i915/display/xe3lpd: Avoid setting YUV420_MODE in PIPE_MISC
> 
> Arun R Murthy (3):
>       drm/i915/dp: use fsleep instead of usleep_range for LT
>       drm/i915/dp: read Aux RD interval just before setting the FFE preset
>       drm/i915/dp: Include the time taken by AUX Tx for timeout
> 
> Daniele Ceraolo Spurio (1):
>       drm/i915/gsc: ARL-H and ARL-U need a newer GSC FW.
> 
> Eugene Kobyak (1):
>       drm/i915: Fix NULL pointer dereference in capture_engine
> 
> Gustavo Sousa (18):
>       drm/i915/dmc_wl: Use i915_mmio_reg_offset() instead of reg.reg
>       drm/xe: Mimic i915 behavior for non-sleeping MMIO wait
>       drm/i915/dmc_wl: Use non-sleeping variant of MMIO wait
>       drm/i915/dmc_wl: Check for non-zero refcount in release work
>       drm/i915/dmc_wl: Get wakelock when disabling dynamic DC states
>       drm/i915/dmc_wl: Use sentinel item for range tables
>       drm/i915/dmc_wl: Extract intel_dmc_wl_reg_in_range()
>       drm/i915/dmc_wl: Rename lnl_wl_range to powered_off_ranges
>       drm/i915/dmc_wl: Track registers touched by the DMC
>       drm/i915/dmc_wl: Allow simpler syntax for single reg in range tables
>       drm/i915/dmc_wl: Deal with existing references when disabling
>       drm/i915/dmc_wl: Couple enable/disable with dynamic DC states
>       drm/i915/dmc_wl: Add and use HAS_DMC_WAKELOCK()
>       drm/i915/dmc_wl: Sanitize enable_dmc_wl according to hardware support
>       drm/i915/xe3lpd: Use DMC wakelock by default
>       drm/i915/dmc_wl: Extract intel_dmc_wl_flush_release_work()
>       drm/xe/display: Extract xe_display_pm_runtime_suspend_late()
>       drm/xe/display: Flush DMC wakelock release work on runtime suspend
> 
> Imre Deak (6):
>       drm/i915/ptl/dp_mst: Fix slave transcoder enabling wrt. DDI function
>       drm/i915/adlp+/dp_mst: Align slave transcoder enabling with spec wrt. DDI function
>       drm/i915/dp_mst: Add a way to disable the DP2 config
>       drm/i915/adlp+/dp_mst: Align slave transcoder sequences with spec wrt. DP2 config
>       drm/i915/adlp+/dp_mst: Align master transcoder disabling with spec wrt. DP2 config
>       drm/i915/dp_mst: Fix connector initialization in intel_dp_add_mst_connector()
> 
> Jani Nikula (69):
>       drm/i915/sbi: add intel_sbi_{lock,unlock}()
>       drm/i915/sbi: add a dedicated mutex for LPT/WPT IOSF sideband
>       drm/i915: add a dedicated mutex for VLV/CHV IOSF sideband
>       drm/i915: hide VLV PUNIT IOSF sideband qos handling better
>       drm/i915/dp: demote source OUI read/write failure logging to debug
>       drm/i915/psr: add LATENCY_REPORTING_REMOVED() register bit helper
>       drm/i915/psr: stop using bitwise OR with booleans in wm_optimization_wa()
>       drm/i915/display: identify discrete graphics
>       drm/i915/display: convert HAS_D12_PLANE_MINIMIZATION() to struct intel_display
>       drm/i915/display: convert HAS_4TILE() to struct intel_display
>       drm/i915/display: convert HAS_DOUBLE_BUFFERED_M_N() to struct intel_display
>       drm/i915/display: convert HAS_DP20() to struct intel_display
>       drm/i915/display: convert HAS_GMBUS_BURST_READ() to struct intel_display
>       drm/i915/display: convert HAS_IPS() to struct intel_display
>       drm/i915/display: convert HAS_MBUS_JOINING() to struct intel_display
>       drm/i915/display: convert HAS_SAGV() to struct intel_display
>       drm/i915/display: convert HAS_HW_SAGV_WM() to struct intel_display
>       drm/i915/display: convert HAS_ULTRAJOINER() to struct intel_display
>       drm/i915/display: rename i915 parameter to __display in feature helpers
>       drm/i915/display: convert display device identification to struct intel_display
>       drm/i915/display: pass struct pci_dev * to intel_display_device_probe()
>       drm/i915/display: add mobile platform group
>       drm/i915/mst: pass primary encoder to primary encoder hooks
>       drm/i915/mst: rename intel_encoder to encoder
>       drm/i915/mst: introduce to_primary_encoder() and to_primary_dp()
>       drm/i915/mst: use primary_encoder in fake mst encoder creation
>       drm/i915/display: make CHICKEN_TRANS() display version aware
>       drm/i915/mst: convert to struct intel_display
>       drm/i915/mst: change naming from fake encoders to MST stream encoders
>       drm/i915/dp: add comments about hooks called from MST stream encoders
>       drm/i915/mst: pass intel_dp around in mst stream helpers
>       drm/i915/mst: unify MST connector function naming to mst_connector_*
>       drm/i915/mst: simplify mst_connector_get_hw_state()
>       drm/i915/mst: unify MST topology callback naming to mst_topology_*
>       drm/i915/ddi: use intel_ddi_* naming convention for encoder enable/disable
>       drm/i915/reg: convert DP_TP_CTL/DP_TP_STATUS to REG_BIT() and friends
>       drm/i915/dp: refactor clear/wait for act sent
>       drm/i915/ddi: rename temp to ddi_func_ctl in intel_ddi_read_func_ctl()
>       drm/i915/ddi: split up intel_ddi_read_func_ctl() by output type
>       drm/i915/ddi: refactor intel_ddi_connector_get_hw_state()
>       drm/i915/ddi: simplify intel_ddi_get_encoder_pipes() slightly
>       drm/i915/overlay: convert to struct intel_display
>       drm/i915/overlay: add intel_overlay_available() and use it
>       drm/i915/plane: convert initial plane setup to struct intel_display
>       drm/i915/irq: hide display_irqs_enabled access
>       drm/i915/irq: emphasize display_irqs_enabled is only about VLV/CHV
>       drm/i915/ddi: clarify intel_ddi_connector_get_hw_state() for DP MST
>       drm/i915/display: prefer DISPLAY_VER over GRAPHICS_VER in display s/r
>       drm/i915/dislay: convert i9xx_display_sr.[ch] to struct intel_display
>       drm/i915/dp: use seq buf for printing rates
>       drm/i915/display: convert for_each_power_well() to struct intel_display
>       drm/i915/display: convert for_each_power_domain_well() to struct intel_display
>       drm/i915/display: convert power wells to struct intel_display
>       drm/i915/display: convert power domain code internally to struct intel_display
>       drm/i915/display: convert high level power interfaces to struct intel_display
>       drm/i915/display: convert power map to struct intel_display
>       drm/i915/display: replace dig_port->saved_port_bits with flags
>       drm/i915/display: remove unused for_each_crtc()
>       drm/i915/cx0: split out mtl_get_cx0_buf_trans() to c10 and c20 variants
>       drm/i915/display: convert intel_display_driver.[ch] to struct intel_display
>       drm/i915/pps: debug log the remaining power cycle delay to wait
>       drm/i915/pps: include panel power cycle delay in debugfs
>       drm/i915/mst: add beginnings of DP MST documentation
>       drm/print: add drm_print_hex_dump()
>       drm/i915/display: use drm_print_hex_dump() for crtc state dump
>       drm/i915/display: use drm_print_hex_dump() for buffer mismatch dumps
>       drm/i915/display: clean up DP Adaptive Sync SDP state mismatch logging
>       drm/i915/dp: add g4x_dp_compute_config()
>       drm/i915/dp: move g4x_dp_set_clock() call to g4x_dp_compute_config()
> 
> Jiasheng Jiang (1):
>       drm/i915: Fix memory leak by correcting cache object name in error handler
> 
> Jouni Högander (1):
>       drm/i915/psr: Disable Panel Replay as well if VRR is enabled
> 
> Rodrigo Vivi (8):
>       drm/i915: Remove vga and gmbus seq out of i915_restore_display
>       drm/i915/display: Convert i915_suspend into i9xx_display_sr
>       drm/i915/display: Move regfile registers intel_display.restore
>       drm/{i915, xe}/display: Move DP MST calls to display_driver
>       drm/xe/display: Delay hpd_init resume
>       drm/xe/display: Delay dsm handler registration
>       drm/{i915, xe}: Move power_domains suspend/resume to display_power
>       Merge drm/drm-next into drm-intel-next
> 
> Suraj Kandpal (10):
>       drm/i915/xe3lpd: Update HDCP rekeying bit
>       drm/i915/hdcp: Handle HDCP Line Rekeying for HDCP 1.4
>       drm/i915/hdcp: Fix when the first read and write are retried
>       drm/i915/hdcp: Remove log for HDMI HDCP LIC check
>       drm/i915/wm: Initialize max_latency variable to appropriate value
>       drm/i915/wm: Refactor dpkgc value prepration
>       drm/i915/wm: Use intel_display structure in DPKGC code
>       drm/i915/display: Refactor DPKGC code to call it from atomic_commit_tail
>       drm/i915/wm: Modify latency programmed into PKG_C_LATENCY
>       drm/i915/wm: Club initialized variables of same type together
> 
> Ville Syrjälä (51):
>       drm/i915: Relocate the SKL wm sanitation code
>       drm/i915: Extract pipe_mbus_dbox_ctl()
>       drm/i915: Extract pipe_mbus_dbox_ctl_update()
>       drm/i915: Extract mbus_ctl_join_update()
>       drm/i915: Sanitize MBUS joining
>       drm/i915: Simplify xelpdp_is_only_pipe_per_dbuf_bank()
>       drm/i915/dsi: Stop using pixel_format_from_register_bits() to parse VBT
>       drm/i915: Introduce HAS_DOUBLE_WIDE()
>       drm/i915/cdclk: Extract intel_cdclk_guardband() and intel_cdclk_ppc()
>       drm/i915/cdclk: Extract hsw_ips_min_cdclk()
>       drm/i915/cdclk: Extract intel_audio_min_cdclk()
>       drm/i915/cdclk: Factor out has_audio check in intel_audio_min_cdclk()
>       drm/i915/cdclk: Extract vlv_dsi_min_cdclk()
>       drm/i915/cdclk: Factor out INTEL_OUTPUT_DSI check in vlv_dsi_min_cdclk()
>       drm/i915/cdclk: Suck the compression_enable check into intel_vdsc_min_cdclk()
>       drm/i915/cdclk: Drop pointles max_t() usage in intel_vdsc_min_cdclk()
>       drm/i915/cdclk: Relocate intel_vdsc_min_cdclk()
>       drm/i915/cdclk: Unify cdclk max() parameter order
>       drm/i915: Grab intel_display from the encoder to avoid potential oopsies
>       drm/i915/crt: Split long line
>       drm/i915/crt: Drop the unused ADPA_DPMS bit definitions
>       drm/i915/crt: Use REG_BIT() & co.
>       drm/i915/crt: Clean up ADPA_HOTPLUG_BITS definitions
>       drm/i915/crt: Extract intel_crt_regs.h
>       drm/i915/crt: s/pipe_config/crtc_state/
>       drm/i915/crt: Drop pointless drm_device variables
>       drm/i915/crt: Rename some variables
>       drm/i915/crt: Nuke unused crt->connector
>       drm/i915/scaler: s/intel_crtc/crtc/ etc.
>       drm/i915/scaler: Remove redudant junk from skl_scaler.h
>       drm/i915/scaler: Pass the whole atomic state into intel_atomic_setup_scalers()
>       drm/i915/scaler: Clean up intel_atomic_setup_scalers() a bit
>       drm/i915/scaler: Convert the scaler code to intel_display
>       drm/i915/scaler: Carve up intel_atomic_setup_scalers()
>       drm/i915/scaler: Make scaler in_use a bool
>       drm/i915/scaler: Extract intel_allocate_scaler()
>       drm/i915: Don't reuse commit_work for the cleanup
>       drm/i915: Intruduce display.wq.cleanup
>       drm/i915/dpt: Evict all DPT VMAs on suspend
>       Revert "drm/i915/dpt: Make DPT object unshrinkable"
>       drm/i915/dsb: Don't use indexed register writes needlessly
>       drm/i915/color: Stop using non-posted DSB writes for legacy LUT
>       drm/i915/dsb: Nuke the MMIO->indexed register write logic
>       drm/i915/pps: Store the power cycle delay without the +1
>       drm/i915/pps: Decouple pps delays from VBT struct definition
>       drm/i915/pps: Rename intel_pps_delay members
>       drm/i915/lvds: Use struct intel_pps_delays for LVDS power sequencing
>       drm/i915/pps: Spell out the eDP spec power sequencing delays a bit more clearly
>       drm/i915/pps: Extract msecs_to_pps_units()
>       drm/i915/pps: Extract pps_units_to_msecs()
>       drm/i915/pps: Eliminate pointless get_delay() macro
> 
> Zhang He (1):
>       drm/i915: Fixed an typo in i915_gem_gtt.c
> 
>  drivers/gpu/drm/drm_print.c                        |  23 +
>  drivers/gpu/drm/i915/Makefile                      |   2 +-
>  drivers/gpu/drm/i915/display/g4x_dp.c              |  25 +-
>  drivers/gpu/drm/i915/display/g4x_dp.h              |   6 -
>  drivers/gpu/drm/i915/display/hsw_ips.c             |  20 +-
>  drivers/gpu/drm/i915/display/hsw_ips.h             |   6 +-
>  drivers/gpu/drm/i915/display/i9xx_display_sr.c     |  95 +++
>  drivers/gpu/drm/i915/display/i9xx_display_sr.h     |  14 +
>  drivers/gpu/drm/i915/display/icl_dsi.c             |   4 +-
>  drivers/gpu/drm/i915/display/intel_audio.c         |  54 +-
>  drivers/gpu/drm/i915/display/intel_audio.h         |   1 +
>  drivers/gpu/drm/i915/display/intel_bios.c          |  15 +-
>  drivers/gpu/drm/i915/display/intel_bios.h          |   8 -
>  drivers/gpu/drm/i915/display/intel_bw.c            |   2 +-
>  drivers/gpu/drm/i915/display/intel_cdclk.c         | 175 +---
>  drivers/gpu/drm/i915/display/intel_color.c         |  81 +-
>  drivers/gpu/drm/i915/display/intel_crt.c           | 163 ++--
>  drivers/gpu/drm/i915/display/intel_crt_regs.h      |  48 ++
>  .../gpu/drm/i915/display/intel_crtc_state_dump.c   |  14 +-
>  drivers/gpu/drm/i915/display/intel_cursor.c        |   5 +-
>  drivers/gpu/drm/i915/display/intel_cx0_phy.c       |   2 +-
>  drivers/gpu/drm/i915/display/intel_ddi.c           | 491 ++++++-----
>  drivers/gpu/drm/i915/display/intel_ddi.h           |  12 +-
>  drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |  23 +-
>  drivers/gpu/drm/i915/display/intel_de.h            |  10 +
>  drivers/gpu/drm/i915/display/intel_display.c       | 111 ++-
>  drivers/gpu/drm/i915/display/intel_display.h       |   3 -
>  drivers/gpu/drm/i915/display/intel_display_core.h  |  17 +-
>  .../gpu/drm/i915/display/intel_display_debugfs.c   |   7 +-
>  .../gpu/drm/i915/display/intel_display_device.c    | 278 +++---
>  .../gpu/drm/i915/display/intel_display_device.h    | 155 ++--
>  .../gpu/drm/i915/display/intel_display_driver.c    | 298 ++++---
>  .../gpu/drm/i915/display/intel_display_driver.h    |  38 +-
>  drivers/gpu/drm/i915/display/intel_display_irq.c   |  52 +-
>  .../gpu/drm/i915/display/intel_display_params.c    |   6 +-
>  .../gpu/drm/i915/display/intel_display_params.h    |   2 +-
>  drivers/gpu/drm/i915/display/intel_display_power.c | 948 +++++++++++----------
>  drivers/gpu/drm/i915/display/intel_display_power.h |  29 +-
>  .../gpu/drm/i915/display/intel_display_power_map.c |  56 +-
>  .../drm/i915/display/intel_display_power_well.c    | 567 ++++++------
>  .../drm/i915/display/intel_display_power_well.h    |  35 +-
>  drivers/gpu/drm/i915/display/intel_display_reset.c |   4 +-
>  drivers/gpu/drm/i915/display/intel_display_types.h |  25 +-
>  drivers/gpu/drm/i915/display/intel_dmc.c           |   4 -
>  drivers/gpu/drm/i915/display/intel_dmc_wl.c        | 314 +++++--
>  drivers/gpu/drm/i915/display/intel_dmc_wl.h        |  14 +-
>  drivers/gpu/drm/i915/display/intel_dp.c            | 110 ++-
>  drivers/gpu/drm/i915/display/intel_dp_aux.c        |   1 -
>  .../gpu/drm/i915/display/intel_dp_link_training.c  |  23 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c        | 663 +++++++-------
>  drivers/gpu/drm/i915/display/intel_dpio_phy.c      |   7 +-
>  drivers/gpu/drm/i915/display/intel_dpt.c           |   4 +-
>  drivers/gpu/drm/i915/display/intel_drrs.c          |   4 +-
>  drivers/gpu/drm/i915/display/intel_dsb.c           |  73 +-
>  drivers/gpu/drm/i915/display/intel_dsb.h           |   2 +
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |  20 +-
>  drivers/gpu/drm/i915/display/intel_dvo.c           |   9 +-
>  drivers/gpu/drm/i915/display/intel_gmbus.c         |   3 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c          |  36 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c          |   9 +-
>  drivers/gpu/drm/i915/display/intel_hotplug.c       |   4 +-
>  drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |   6 +-
>  drivers/gpu/drm/i915/display/intel_lvds.c          |  49 +-
>  drivers/gpu/drm/i915/display/intel_modeset_setup.c |   2 +-
>  drivers/gpu/drm/i915/display/intel_overlay.c       | 184 ++--
>  drivers/gpu/drm/i915/display/intel_overlay.h       |  19 +-
>  drivers/gpu/drm/i915/display/intel_panel.c         |   6 +-
>  drivers/gpu/drm/i915/display/intel_pch_display.c   |   1 +
>  drivers/gpu/drm/i915/display/intel_pch_refclk.c    |  26 +-
>  drivers/gpu/drm/i915/display/intel_plane_initial.c |  56 +-
>  drivers/gpu/drm/i915/display/intel_plane_initial.h |   4 +-
>  drivers/gpu/drm/i915/display/intel_pps.c           | 174 ++--
>  drivers/gpu/drm/i915/display/intel_psr.c           |  86 +-
>  drivers/gpu/drm/i915/display/intel_sdvo.c          |  12 +-
>  drivers/gpu/drm/i915/display/intel_tc.c            |   2 +-
>  drivers/gpu/drm/i915/display/intel_tv.c            |   5 +-
>  drivers/gpu/drm/i915/display/intel_vbt_defs.h      |   8 +
>  drivers/gpu/drm/i915/display/intel_vdsc.c          |  80 +-
>  drivers/gpu/drm/i915/display/intel_vdsc.h          |   1 +
>  drivers/gpu/drm/i915/display/intel_vdsc_regs.h     |  12 +-
>  drivers/gpu/drm/i915/display/intel_vrr.c           |   2 +-
>  drivers/gpu/drm/i915/display/skl_scaler.c          | 286 ++++---
>  drivers/gpu/drm/i915/display/skl_scaler.h          |  11 +-
>  drivers/gpu/drm/i915/display/skl_universal_plane.c |  25 +-
>  drivers/gpu/drm/i915/display/skl_watermark.c       | 724 +++++++++-------
>  drivers/gpu/drm/i915/display/skl_watermark.h       |   1 +
>  drivers/gpu/drm/i915/display/vlv_dsi.c             |  28 +-
>  drivers/gpu/drm/i915/display/vlv_dsi.h             |   7 +-
>  drivers/gpu/drm/i915/gem/i915_gem_object.h         |   4 +-
>  drivers/gpu/drm/i915/gt/intel_ggtt.c               |  19 +-
>  drivers/gpu/drm/i915/gt/intel_gtt.h                |   4 +-
>  drivers/gpu/drm/i915/gt/intel_reset.c              |   3 +-
>  drivers/gpu/drm/i915/gvt/display.c                 |   1 +
>  drivers/gpu/drm/i915/gvt/handlers.c                |   1 +
>  drivers/gpu/drm/i915/i915_driver.c                 | 115 +--
>  drivers/gpu/drm/i915/i915_drv.h                    |  19 +-
>  drivers/gpu/drm/i915/i915_gem_gtt.c                |   2 +-
>  drivers/gpu/drm/i915/i915_getparam.c               |   5 +-
>  drivers/gpu/drm/i915/i915_gpu_error.c              |  18 +-
>  drivers/gpu/drm/i915/i915_irq.c                    |  12 +-
>  drivers/gpu/drm/i915/i915_reg.h                    | 122 +--
>  drivers/gpu/drm/i915/i915_scheduler.c              |   2 +-
>  drivers/gpu/drm/i915/i915_suspend.c                | 141 ---
>  drivers/gpu/drm/i915/i915_suspend.h                |  14 -
>  drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |   1 +
>  drivers/gpu/drm/i915/intel_sbi.c                   |  22 +-
>  drivers/gpu/drm/i915/intel_sbi.h                   |   4 +
>  drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   2 +-
>  drivers/gpu/drm/i915/vlv_sideband.c                |  28 +-
>  drivers/gpu/drm/i915/vlv_sideband.h                |   3 +
>  .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |  11 +-
>  drivers/gpu/drm/xe/display/xe_display.c            | 114 ++-
>  drivers/gpu/drm/xe/display/xe_display.h            |   2 +
>  drivers/gpu/drm/xe/display/xe_plane_initial.c      |   8 +-
>  drivers/gpu/drm/xe/xe_pm.c                         |   4 +-
>  include/drm/drm_print.h                            |   2 +
>  116 files changed, 4251 insertions(+), 3479 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/i9xx_display_sr.c
>  create mode 100644 drivers/gpu/drm/i915/display/i9xx_display_sr.h
>  create mode 100644 drivers/gpu/drm/i915/display/intel_crt_regs.h
>  delete mode 100644 drivers/gpu/drm/i915/i915_suspend.c
>  delete mode 100644 drivers/gpu/drm/i915/i915_suspend.h
