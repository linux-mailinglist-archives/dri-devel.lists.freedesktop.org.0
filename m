Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 954A0CD6EAD
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 20:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD28E10E721;
	Mon, 22 Dec 2025 19:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJJ2IuEB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FD510E24E;
 Mon, 22 Dec 2025 19:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766430249; x=1797966249;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=imuZ5ygGbFEn3bYO5hvkxncCg4wwhhtW0+TLUIStuPo=;
 b=OJJ2IuEBpdmXzaWIFdmilGUksnsxv9vKh5aF1oFk6oUh8lrEX5zQN7AQ
 M3HpqctRH1Duvjn/zyQMPqen1vA/nkl53w+7mclPHOg/zS/oo/J9tGixf
 RhizILWySFLUp9Qra1JcuMrJOjAo15acZCayPxJpu8MkJdZUmt+lxUcC8
 NSnt2+HUft9WWDRSsGtcqfSRNVmixhC+Bagt1hCXVETkXDi8dpJTAk3T2
 /5rTagv8vY60DbVfc0Pintn3/8fNmvqtkcduTZVWAeiv8LKX0tudFrMdo
 lhjdOYELX2ffAV/QQYg31IYtHUjCDhc7HG76ylFa8qwIZbF3sYOJ2rCmp A==;
X-CSE-ConnectionGUID: X+eqpsb8Q+yzZC/h9pP7pA==
X-CSE-MsgGUID: wmIPqheZSX2IZ3kRPWGFmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79007048"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="79007048"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 11:04:08 -0800
X-CSE-ConnectionGUID: L97FCQ92Qz+tNlbufM9Piw==
X-CSE-MsgGUID: J0gmlbZzT6SUsRa5H/jECw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; d="scan'208";a="204546006"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 11:04:02 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 11:04:01 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 11:04:01 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.39) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 11:04:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WE+JpJ5165f/VlqcWmclU52AwYX9ysAZLA2YyWB2gjxrjqztoqHj/mmbIT6h8jkyNmJAXkW8cqsnawJ6pqCM7FpUgqYA5H4xJfrb8wHq8m1BJz5KP3HMhAMyY7XTEI46H88DSa+YbYgxCh8LGlv0UEjeNXaWIxplTtZZuS0uqnI516gEl0joPZgI05wB0rIbwdN1GvdNgtvi5USRCkmdMXUhv0fRkevRP/FHsUjNEYB95mxk3J6jF8Xzk4KYYudYnEVfCkFh0zxjRaRrKQB8zzWx+8yj/5RNDbaBO8bBgRvyp9TkL/cF1h6AUW9JFka2UjFUNn4Wo2U8HkH9NPMxdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERPuwZqSSCOiN5/nISg0nrSTlJg1NTar5DtceeSxvAs=;
 b=y8eEKPhkIgeYCNP1wWOrUzTlfA5AO4rNuQMVcodGIUCA3ZPcsKyg32W0FL7EpLNz6ygQcLE2IUT/08yu4z0BuQJS6gETasfGuPot3olPI1CxsFi7mKJ+RIBT4AgRdDB8wS9/i+APVEnOVckcJr2tfi1KZ39OWP0twrIm367d4z69tpE/tPx+FwqJVLPzwPdItyA3PyAc66tHTDeaTEPDuMsCqUqpXhRMVxdiVwB4PEtxh7XjHQKBmJ/Yp3PmB/GCmd/ipw1nReJ22GbpF5IjAhXadN3Vf48DWzBeQ+r9/jJSDBvKpwr3IXzhG6gc5goryzqDfGgLc0VLdo7Y2OVwBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB9471.namprd11.prod.outlook.com (2603:10b6:208:5b3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 19:03:59 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 19:03:58 +0000
Date: Mon, 22 Dec 2025 14:03:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/configfs: Fix 'undefined reference to
 xe_configfs_...' errors
Message-ID: <aUmWGyJNfbBmFFlt@intel.com>
References: <20251222175006.9706-1-michal.wajdeczko@intel.com>
 <20251222175006.9706-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251222175006.9706-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0381.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB9471:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d53b88-97f6-41fc-b6c6-08de418cdca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IvRfJsnfrnYJJMWihkNUN4qoqjbcArk+9PsLcc8fNNIaYD9bSgKwFi/Utv7F?=
 =?us-ascii?Q?9RANVEClCD3SL+IL8CjbdMvvaG9WvwUx9/Xi3CFUXT5+R+nOkIKMUN0Sfe79?=
 =?us-ascii?Q?mQuc+XzIIFryilQdITye3QgGiTMMAFn/DqcTMG3P/lrszU7MPxG5rz8jA2IB?=
 =?us-ascii?Q?FXQs88LRMsORABZyCBkHBgIOga5FuTn9OhxYabC8UNfdUZ8aFuIi3EhKNk++?=
 =?us-ascii?Q?A+ztwmKmk5yMJddhAJIRwwMNeEzlPB9WV2NXhh/sQYDso28U7MIGDf6VfVLv?=
 =?us-ascii?Q?ptUpep6sg20YvHPshtMia62O8DZ6i4LsGdxaOuUyvG8SlxUxbEplisJMcFEs?=
 =?us-ascii?Q?0CDzFluz5QmpsULWK1U+qIB0rezFBTPNwBrAxB1LJ+QOlGrHq6Q4A1v05Ll7?=
 =?us-ascii?Q?jbXnt4Rs03XkpjbM/zwAS128RLtTCpepvaPopZhs0tnqetb/U/fBAVa1MpQu?=
 =?us-ascii?Q?shPbGtTQymDYaBkPTq92fz5mmhVrFpKwpE++XwKDCl5qlSutMntwicOU4vQ2?=
 =?us-ascii?Q?kPwbOw3fYhl/TXBsG4RliaD9jrn0zivI+o3BRcq6bmLL0Aek+oGb4YWALlp+?=
 =?us-ascii?Q?T7cx8EepQtgN7j5RHtjrNeSYFbPHaDkmEDioY6Nzb1X4jor5mf3xyXRkwAM1?=
 =?us-ascii?Q?4wnN1zH8GR0l/tj9TLGlg5sMcbd+rbvPfyEy2TcRt3D6ZeRj2ObqP2WdX7oO?=
 =?us-ascii?Q?wiEtdb+ZQnD8Ihj1N7hpDNvOdWsXdqz0ToqWrtL/L1te1xr5ueYXxh1kGtr7?=
 =?us-ascii?Q?8+vDqPJ8AfXXvus3Rl8gG79Cb2QUWYuzkTpqkLVWmX9HPcte8YNJHdEeICix?=
 =?us-ascii?Q?ZuZqs+UVgIW+eL6zDAaj8cYlzFhCu9WQrq41E3vZUJUJE1UcEMLB3XcoqER2?=
 =?us-ascii?Q?7+1ho1sxTiJIgRWyCjcYVlxk8DBB9DMfUldleJOBPiqbJAgmRaljtSZrZ7gs?=
 =?us-ascii?Q?pfyxFIskqwdiYvrTsDmRJeCG/YMG3F70jXNTQ8okbGBvR0/LZQTweLEE445v?=
 =?us-ascii?Q?1IurngauTwpG0UZgFVujp8D77RWGQAyzmmI4xr9nawriT8KgQ/VPJtswJVwC?=
 =?us-ascii?Q?OdNpdeQEWwPeYG5ZTeH/1GDQXdepHkAFoCzNM+A4diSpVEs3honhwYhxEM/4?=
 =?us-ascii?Q?tfDAQbuJ8FclOMHwvYy6rdZRL5+ktnZ3huxd6kO62w+ahi14htrcX3v03QaV?=
 =?us-ascii?Q?WOTVI2bs94shTX9sT9vt+XSQztKDHvyNvDwsClxmOSLDk6vW9Pm1Zc9ooOa2?=
 =?us-ascii?Q?DrSqgU+VRhzqOb8ItF5G+hQlpL2xDWVNPDK7uqG314cAKC22YrBonwv0D6I7?=
 =?us-ascii?Q?DNNJJKqeWf9T0XsxB2t2f0o4J4jvavZL6U5xN5B2v8n8Dw0vEruHPU2Nn2Tg?=
 =?us-ascii?Q?Z/v1noysvc6VnnZ4fZQ2ag4/sNvVGw/nzAGfcfYfT+WBC/h0f5mQSb+ZV9BS?=
 =?us-ascii?Q?Qqn4RUTo02CcqW21Zydpk9obLTnnSZ18DFeL1uoFAea+bm2we6/IuA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lOczFtYvH/CmbHcSLEvSk0uK3WMzVwYEyPxSdpmrhvih8P1jzVZ75Jgs5kCm?=
 =?us-ascii?Q?UOpgsY2Ta0s9xuKSV3o/rtkBzrUrAwiz0xHjcZlNsCNvrfwPE3yTxTVfVTYx?=
 =?us-ascii?Q?KfRAAfhiX2YvEL78qjeYoII9bfmm9Vv0KQYGCsXNRhjT/hcwvbsabC2JXvdF?=
 =?us-ascii?Q?eRjs6xLhSNMqdXAMfSJo0Anbo1YI5wTMj7YdsBHy/qLyc86b4l9CFriaAaki?=
 =?us-ascii?Q?yOg19FW9IkIVxFk9BizjWVwHELJjgkU9n5C9wmggQNEFi7egTe7e7WVyX3MH?=
 =?us-ascii?Q?7lxSMovY2/NS9afDpWiH9cdOKZXeq9ZHy5Yuor43vGZohlWVuL2SlJxEYI/q?=
 =?us-ascii?Q?Eh4H5zTubkkrfwQnYTy/Hp5BIhyEl3V7tzrdP/wWC6WfTCM1wCzCqfqL2Rb6?=
 =?us-ascii?Q?NMkmLbhvEpoh9s5NN3C3dxKRkLOVHQpu00Y0R3LOznni9w2x3T0nTJEXKe3a?=
 =?us-ascii?Q?UT4BQyj8QJN5q6dRktdOT4e58Mj2D3LS6DNRSwWMPMLeRs/67BFQPz/WoVJ6?=
 =?us-ascii?Q?GRx611icYv5WssHaA0zuKeDwbdpHt0NQcojL2Qz1XOhxt/wHTXaaPI1cjZS8?=
 =?us-ascii?Q?dXxk0Z9XsEXPlbCeOV0FwZUXsDUvC+ewhrhQ/EeXyfk4IlFA0ZMOTOKpxLMd?=
 =?us-ascii?Q?eGM9b9DgfaNf0vfNecWwgIzPBdEXw+IdqDwOONvjawxa3eBGq8/3tDV6ycKI?=
 =?us-ascii?Q?Q/W4l1aRAr5zB0zuKP7q8lFBMiW9usJRJI5HLBFY78mUN/s1AmMwdVYpiEER?=
 =?us-ascii?Q?J9PuZ99fqBHy+K3Q0iPaH7w5D9aUXpL49dbB48P/J8pAhKHwmJa3puPrG27z?=
 =?us-ascii?Q?NUqD4T7SM4nMVQyK54/hi6XYTq7EXoyNY5rel81jvWI9CJewVZkmHCZynmw4?=
 =?us-ascii?Q?WUyWMSIye2uT+IKkFbB4/r9zO/rj33X/ufvDeAUKIqGdTNDBlBH/XxcGIUJ/?=
 =?us-ascii?Q?2rXnG1hbbOdhnz9l59zS+G2eYk+Q2uVBzEer+8/ZGf+SBxd/smWBETfFyy6d?=
 =?us-ascii?Q?JQCMqU10Wfc140/V1WB0BLv8imeYuY/ya67qQbNHhMpbIxBClfZZ3xoELvM4?=
 =?us-ascii?Q?AkqdDAR6OQYUFO1qoBzayi0Ks5ka+PmSXmv3MpNh4tGj6QFh6pUt7kEIjpE5?=
 =?us-ascii?Q?FsXsOD5PmbnEAm8Hpk70iqPaRUJRsUwRLuS9FJPCixfpczYoLzsP+/EV+Bu0?=
 =?us-ascii?Q?X4EDQuAVpPVlmP2ZxVzI5zoXV5pFrXeg2jcLaciy6woJhKjM++C69PQQTixN?=
 =?us-ascii?Q?4hbyzIZ1uoiThW3S/TZYJu8+ARY9Th/SZTpgLVa0HJ3CwBWMVTUT8YFyZb6R?=
 =?us-ascii?Q?/0NhrIROVufIY12kqUwoHZq2q8J9btsP2j60xHwY3LVEPMGuj46jg3swa84+?=
 =?us-ascii?Q?xK/bSKUSf48ADRmrKb4OOBPGmeB0It0ZEnhf5w5PTP2WpvSJLPEUmGKSeGrQ?=
 =?us-ascii?Q?PYWzT5J7/cV7a7QeEpvhbZgZILyUj6SROruO7prFgxO3eIzwNJBfqYtA+gSC?=
 =?us-ascii?Q?N3K1M0FKuGBYXJHE4xJGKfPZSn0OE0dHFjkV0gEOXqn0vbLQD6Wz+ZwrwBKn?=
 =?us-ascii?Q?+OKaJs4D28iG0bHp+XbTZXSx2rtJniOL3f3x+BlKiGDS7dKwoPVf32Lw5W7b?=
 =?us-ascii?Q?k0pqWr13rhBpztjr/maE4qEnJzlxcGOVJjotUZ31n5xxqIEi93UNdb2x+Haw?=
 =?us-ascii?Q?xHJsIsnFMRDZ9LFqrLq+wSnhoCRae/dMPvs/8W0B6vm4K8lR//o/BI+xW6MW?=
 =?us-ascii?Q?ok2tNjL1bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d53b88-97f6-41fc-b6c6-08de418cdca2
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 19:03:58.7814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hAbut9F9RWYHlhLudzkv/odMfoQ6R6+svBVSaLx32zEwiIEB6mlkH/yCB0XinczZlj+UvquluCC79KaLSxjbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9471
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

On Mon, Dec 22, 2025 at 06:50:06PM +0100, Michal Wajdeczko wrote:
> On configs where Xe is built-in (DRM_XE=y) but configfs is defined
> as a module (CONFIGFS=m), we were not enabling our configfs stubs,
> which might lead to the following build errors:
> 
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
>    xe_guc.c:(.text+0x2f08): undefined reference to `xe_configfs_get_psmi_enabled'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
>    xe_hw_engine.c:(.text+0xedc): undefined reference to `xe_configfs_get_engines_allowed'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
>    xe_lrc.c:(.text+0xb30): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_mid_ctx_restore_bb':
>    xe_lrc.c:(.text+0xbc0): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_init':
>    xe_lrc.c:(.text+0x32fc): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x10): undefined reference to `xe_configfs_init'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x18): undefined reference to `xe_configfs_exit'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
>    xe_pci.c:(.text+0x1514): undefined reference to `xe_configfs_check_device'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
>    xe_psmi.c:(.text+0x508): undefined reference to `xe_configfs_get_psmi_enabled'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
>    xe_psmi.c:(.text+0x5c4): undefined reference to `xe_configfs_get_psmi_enabled'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_psmi_enabled':
>    xe_rtp.c:(.text+0xba0): undefined reference to `xe_configfs_get_psmi_enabled'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
>    xe_survivability_mode.c:(.text+0x434): undefined reference to `xe_configfs_get_survivability_mode'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_sriov_pf.o: in function `xe_sriov_pf_readiness':
>    xe_sriov_pf.c:(.text+0x2a0): undefined reference to `xe_configfs_get_max_vfs'
> 
> Fix that by using IS_REACHABLE check instead of IS_ENABLED when
> deciding whether to stub variant or not.
> 
> Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512190407.CcUFXX2F-lkp@intel.com/
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 9998ec7c9956..ab75485b08b6 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -12,7 +12,7 @@
>  
>  struct pci_dev;
>  
> -#if IS_ENABLED(CONFIG_CONFIGFS_FS)
> +#if IS_REACHABLE(CONFIG_CONFIGFS_FS)

Well, I'm not 100% confident with this. And probably the Jani's suggestion is
the safest one.

But perhaps this is acceptable in this case, only because if
we are built-in (y), we are not able to use configfs at all anyway...
our configfs usage already depends on us as module...

>  int xe_configfs_init(void);
>  void xe_configfs_exit(void);
>  void xe_configfs_check_device(struct pci_dev *pdev);
> -- 
> 2.47.1
> 
