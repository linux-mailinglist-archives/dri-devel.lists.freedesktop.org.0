Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DB0B92911
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 20:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A4310E075;
	Mon, 22 Sep 2025 18:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vqf9XciT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7DA10E075
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 18:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758564739; x=1790100739;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LhbvFGJX8gBKt3AdmwU2t6WJcCNHyS1Thp/Y/jOrs0c=;
 b=Vqf9XciTh406RXcLuChPEiPUdr6eL/XJ7vvvzcwidHs4BokkAezUgWAH
 hwb32SkANnSeGQUBCrtg2mj6uMbZUzDT0MiGTaki6P1nks7CxjNPj2sXX
 d+dRaP6xP/eecz6FFilRtfsyLm2Cv7dWPZcKsZ6tL2fsCqfdRMz1c7mZL
 HltOKPDtzV85rE5Tp6MB2L1fdCxHyUS7ZhsVA//lkOZFrs6a/Qyf2M2D0
 N+GRH1jTCgEsBqJKjpRES8MZo4CBtcEwcmlGAHKsLwCh/4Pg8PfxgSfRv
 ockDKCXoMxQZFOBCpj5Xji3hVHqO3GSSLDM7mBzFOYOLVfgC2dVkSfOPN A==;
X-CSE-ConnectionGUID: S7zX9/XXRDOlug746/ym8w==
X-CSE-MsgGUID: f24kfkWPT1qB6mx1YKddjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60750158"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60750158"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 11:12:18 -0700
X-CSE-ConnectionGUID: ZUVHz5ocR72nHWWso530wA==
X-CSE-MsgGUID: 7kp2Rj0LTFqZG0012QmJSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="176470987"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 11:12:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 11:12:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 11:12:16 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 11:12:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tg3u66cwBTqVdAQq+mL66GzhzwEQzJUFY+C62BXVOGujPEw3ryZyi8NK/M/M9yhxLPRXXnqa8i99zj/bNZ4g1BkeRN0kSydYycS4c7xcfRt+8vJPRKE47na8hTklBIzhfqFS0qpBG2Fh3ipohpSOP7OXnlKgBoPdSj31srjvhlp6TrOKDhFZneAQhbDZfsCEIUGBEMT11g6KgxxF1RWAcWwd53Nl9zvlRPKC5Lx1SEZhn/dt4nR1OGewV8FKdKEh0Ws8L8OzU7l3uzNg95PMVD7xI160ClOhzMpH9WFHr29t6QZRt+xUmuAFWklFAJJn4/hlmu2ZqBRZbmVOdQRLPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O92tX/E+X2ACFIt4QV2fpJKc/R0Is7I36anMprXHnwg=;
 b=jB3VqsUXWdUdhuiBB1/2vjl87aqg32A3PEd78fXuVwPs/BomuqEGUeX2kqVwbi4F56e2XvOmBAvj+RHGKwcsyXY2pNZseIxm8GFw/fAScdDDUDxfrHInBuZYr/gxyPB9vVG32GlODkxuTYK24qHAqTxdnICiH25w6sYisrdDBNPkyWNGeKnS5esnM+PNI6XA1o12p6NB+US8o6rlovnntjBWwWTwuHGy+6go3vGae8LYfeK28tmnxTsF83lUBleRp0rrCJduWYhsTyAjt530nRfIEIe+uT/V56Ssi6AG+htXdpkTNcrEq9mGcQ9LGPc6PZ2XxIIDeRFGy1tMGOC0YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4856.namprd11.prod.outlook.com (2603:10b6:510:32::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 22 Sep
 2025 18:12:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 18:12:13 +0000
Date: Mon, 22 Sep 2025 13:12:09 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: <jani.nikula@linux.intel.com>, <samasth.norway.ananda@oracle.com>,
 <simona@ffwll.ch>, <deller@gmx.de>, <linux-fbdev@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, George Kennedy
 <george.kennedy@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Sam Ravnborg
 <sam@ravnborg.org>, Qianqiang Liu <qianqiang.liu@163.com>, Shixiong Ou
 <oushixiong@kylinos.cn>, Kees Cook <kees@kernel.org>,
 <stable@vger.kernel.org>, Zsolt Kajtar <soci@c64.rulez.org>
Subject: Re: [PATCH] fbcon: Fix OOB access in font allocation
Message-ID: <by7vvxkeeukabmpaalhcasdhqjucnpldctqz7etervljbl72jj@nkiatx2dxhih>
References: <20250922134619.257684-1-tzimmermann@suse.de>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250922134619.257684-1-tzimmermann@suse.de>
X-ClientProxiedBy: BYAPR07CA0078.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4856:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d59a5e-0148-4872-7d41-08ddfa038e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?2RKY6r98IQ08o0Y+ELVOnISQoOUFkzRyDQePmEXIJFZ9Lio3t9QQqtYZd3?=
 =?iso-8859-1?Q?jU8p0TMQYRYaeSSc1Pv1gc2XswjBffGLftyj+9xPwVzAhGVEhfqHSvqUMI?=
 =?iso-8859-1?Q?n+aVqekY00GKHkhAOk9OttkJMd2d2J0BFOuPDeq7OsJy+4eQzxxWObs4bN?=
 =?iso-8859-1?Q?bezmjImNhfsKk9RKDYxlojayQl2Mq0UvKnLd/KJxSBZwSvkAioJHtZKYda?=
 =?iso-8859-1?Q?WM1MoGo+Yzsd1Eh5fpxKmjEn9YYnt+KEH7aLD8FdthZSgKoTLimxS1EDST?=
 =?iso-8859-1?Q?082Zb6oSA5BL0PoX2AHtdimOrpiWnj1emH1LN9t8dCjGf5vJuuhjSn6dNC?=
 =?iso-8859-1?Q?SGWhK1+5z8d3I4HvtqJpTieNrr6w8IBRRjcmpicaJ5i8q/7CGuxoCJkqSF?=
 =?iso-8859-1?Q?1lb4TSfU47kooFMHbUU0uDXMg0qoJC4eFUrY86s9AGt/k3I0AWPDnWL3ek?=
 =?iso-8859-1?Q?mzFk746NLeVhA8vQ9cXyEZIApGKUAO8zfGOm+zHmGQMrZ4YytyZ4Cd/ALy?=
 =?iso-8859-1?Q?HmZ117pdhZRLRYUxNmCk+Qpb6VjK4RdFyFj7msgkSvDHDn0rxdumQhkOKB?=
 =?iso-8859-1?Q?uR6qnN+96I2mz4yV/eFEtTjgTDiBHKqPmYHd7VabaVqdESCrKbwX3V3xAi?=
 =?iso-8859-1?Q?xxXE+IAyciNF0c3/znoSaRqSVtt4fDzlndGxD9vgMJc6hv6nTiI2cW9PgT?=
 =?iso-8859-1?Q?ZV+pLvsSnG3fOQgXgm7YpAX948kYJZ9tAzJUh9S7zv4rfpvdqRcpPjGcXP?=
 =?iso-8859-1?Q?QDIME8Sxn5Gi7M3nPae9HoFzPgY4Nm0s1TfOZcBm/vRVix0qkz1WgyhD84?=
 =?iso-8859-1?Q?mBpHqlaTdrSVif4AWsc2JD1pv7VKUZkTcXuJgG9Jd+YgJdxqQDuRRnXdNO?=
 =?iso-8859-1?Q?2PWZZYfYb0SXVuIEOZnv5O9iiPhe3V573mcU+Opss+14Xds+CUbWoaED6K?=
 =?iso-8859-1?Q?1idjPh9O/ZD4UAyXvBGnJZGjAUY82eLt2AV2BQebeS9wgXRci6qNHDi36m?=
 =?iso-8859-1?Q?mjRlrwKHKqV1xiJcqnNT39AT34RhFAZ07fKcFJcWsJF/V5xAeyZN4o+OH4?=
 =?iso-8859-1?Q?aYu1B3r/46+5zwFhDwLL9vORTzgUvNmev2v+U2Iub65Lja3Pz0+enkEjJx?=
 =?iso-8859-1?Q?hzrxwylNBehnNQeCxC6/23sXC3gpD7qKTmOR8KdnjpENaZbgVEjjMfyLDD?=
 =?iso-8859-1?Q?rGA9FVchlin7BOnOqy9TY5F3PCCy00ypByE2blHh7Cn+ZL/WWr8O/mfyTm?=
 =?iso-8859-1?Q?vds5eDEAfY1HwwbS4zz9BkGRbBRrStTF4T6PzsrYKW5OUYAm2sLtNz0gTe?=
 =?iso-8859-1?Q?jr0XL7AU/i7M6t5Fau9wLm4pR7MwV+QaUpKPVGuves6kCXwRpAwkQ2ATgB?=
 =?iso-8859-1?Q?2M6uwxhrtcIXq9QkXZ40Go63h2Abs/BwNdq+AqWtd8tuKIrXEUAurqN89G?=
 =?iso-8859-1?Q?OOZWLJ5fj1R5yZiBuE3P6EL0QGSusMOLjLhm+miAaX7UvPRidFHOxCEMwM?=
 =?iso-8859-1?Q?A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cCilnYD0j4Eg4wmtJXrWuB2zkFEwVk1WQJcNggONCHtgDckIkUIJ5x/zic?=
 =?iso-8859-1?Q?c7JaicffAb2hkzUC515xxWQ+AEQlprojkv+JAh80xaKKSNkkttPNCVeKeA?=
 =?iso-8859-1?Q?A89uyddp9qEOMnomP5tp3FsmgLJPj50sLT/wwk54JSORmb6aANBzImvVGJ?=
 =?iso-8859-1?Q?FzHsj4OTWfQaGAY7GSGP/K1dosxC+HQZInw1PJD3eGtNsefetGY9NBFxi2?=
 =?iso-8859-1?Q?KCdA/aySi2M/koHwYcdbSCmuE4e7c/G80+eOSOVbMWAlm4STfcIJ6jm3A7?=
 =?iso-8859-1?Q?rVJPojdcyc7YYNgU87pzmPsz+AU2YF4FR0x33JE7vGbGwB8bCSxhSLB3Qg?=
 =?iso-8859-1?Q?RfYXzsYIfqSB+G1+E2mmCnx6PuIZb+uApjJSdLQg5Vm7VDpp2yb/DlU8kw?=
 =?iso-8859-1?Q?7Rnlm3sBIX3bgoBeuSUabL7hETIjyqEgEhITk5Nv+77W3oc2/lJWF9nYkO?=
 =?iso-8859-1?Q?0C/lclyIhnQgX5HU8Pw4VskIczovS5KjhXAWSXN7a3QNpwkeFaRf0EWNgt?=
 =?iso-8859-1?Q?hV7DENX8i4knMlOjjfm+UXkr/Fm22KLcOnvtzbygb3ZPiBaiijl7g+8z5y?=
 =?iso-8859-1?Q?U9MDHFyt9WkWt/yQiNQ4Pd3zwUGq2mF/rcGWclkG/An9vPyRBAWPBOmOeC?=
 =?iso-8859-1?Q?HIBij9LFoS/yZK36pa2VNRHEVgIy8qz0FOMCPj3UfEerkdbc580+oxaIgC?=
 =?iso-8859-1?Q?kVuhpY5M61ZN3f/SWFugs/r6Zh8m0DdET6B8LIvNQ1N+mn7sj1+LNOHjIK?=
 =?iso-8859-1?Q?GiG0scvqFRAfpl32wyZFtZfBPwlS8P+A6qv+9POzg+VCFVJTOwjDtZCr5Y?=
 =?iso-8859-1?Q?/RU/xC1PJthU5EPZKZn077/YHfbFPHR5/CmUz5d7MnrzxcHeFwli1dPAjh?=
 =?iso-8859-1?Q?TOzjPNXzkMjS1lId3musRGqHyydHx8Sw4olx30pZJejV3WInKcilhqlKNI?=
 =?iso-8859-1?Q?YFr9R0JpUyJiIdIa0mt75KuvAEg/D/TY+WxMGQCQ/mMfBvCC7Ufdjg7Ftx?=
 =?iso-8859-1?Q?aOm4k3iBCbkeqI0n7sFG+SKOtEjPXDfI0IzvCwwrFgPMS7y4YTVOlsRa6H?=
 =?iso-8859-1?Q?BlA3EsEJp+wGLeQx1EiSVUmuF3wK/OnMVARdrQ6VfpDVO1pf9yJfS82QDu?=
 =?iso-8859-1?Q?cVAMSAcJ9QuNjGrN/4VMShkkGLZVz1g/QmcCo5e5cKtD0/btcJeAOe4YFt?=
 =?iso-8859-1?Q?arYtJLNXXExfi9qizGiv1I25DOCGXIeYJWfQ5lSSOOHjeoxBGMrg4x2Y7s?=
 =?iso-8859-1?Q?acJ9+qst4JsCMxyw8Mx/HZOErwjnpYqxOKKeFELiLf29Ct9qLbJnZXZbmG?=
 =?iso-8859-1?Q?IESTFVwhRT9Nht7lUsKa03oybp2WdsgL9d+e9rNCw156pvwPxXOOhjYy4t?=
 =?iso-8859-1?Q?pnjhEideK18UKfQzHdFjCgrTzN77X4z9fFm/Btyt6iBJ+no/U0d0rfwOYI?=
 =?iso-8859-1?Q?s6IUOasgbqwUmAklWfdQyExrvhT7DrH8W9lKnW/zeRstZNlO4I5C6LnabW?=
 =?iso-8859-1?Q?i8Ftb2EANZvBtTbDmtZiKpaE2B41uPxaVE6iX4w2WbiUiKOcK3fe+A5wQm?=
 =?iso-8859-1?Q?WreeVQ+zid3ehNO0I89V6FsqfO4umzqmL+99Le+1tbaZQAdRkX+mNImTni?=
 =?iso-8859-1?Q?X1cRQFQZ+LHwec/Y0xoHnhwqG1HNAxbDy+NFzawLPnGn/jCUbhhLFh2Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d59a5e-0148-4872-7d41-08ddfa038e38
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 18:12:13.6850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4N2hVfCvLhzzst9/hro1yhKlfrJ6rn5AV+HT0HX89JspBXwEpqyvvXk6CaaP+JLfT0IIFjzy031HvY0S/qrYt9gEt0XBuRThqptUzrAA2Zs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4856
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

On Mon, Sep 22, 2025 at 03:45:54PM +0200, Thomas Zimmermann wrote:
>Commit 1a194e6c8e1e ("fbcon: fix integer overflow in fbcon_do_set_font")
>introduced an out-of-bounds access by storing data and allocation sizes
>in the same variable. Restore the old size calculation and use the new
>variable 'alloc_size' for the allocation.
>
>Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>Fixes: 1a194e6c8e1e ("fbcon: fix integer overflow in fbcon_do_set_font")
>Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
>Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15020

this one too:

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6201


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>Cc: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
>Cc: Thomas Zimmermann <tzimmermann@suse.de>
>Cc: George Kennedy <george.kennedy@oracle.com>
>Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>Cc: Simona Vetter <simona@ffwll.ch>
>Cc: Helge Deller <deller@gmx.de>
>Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
>Cc: Sam Ravnborg <sam@ravnborg.org>
>Cc: Qianqiang Liu <qianqiang.liu@163.com>
>Cc: Shixiong Ou <oushixiong@kylinos.cn>
>Cc: Kees Cook <kees@kernel.org>
>Cc: <stable@vger.kernel.org> # v5.9+
>Cc: Zsolt Kajtar <soci@c64.rulez.org>
>---
> drivers/video/fbdev/core/fbcon.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
>index 5fade44931b8..c1c0cdd7597c 100644
>--- a/drivers/video/fbdev/core/fbcon.c
>+++ b/drivers/video/fbdev/core/fbcon.c
>@@ -2518,7 +2518,7 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
> 	unsigned charcount = font->charcount;
> 	int w = font->width;
> 	int h = font->height;
>-	int size;
>+	int size, alloc_size;
> 	int i, csum;
> 	u8 *new_data, *data = font->data;
> 	int pitch = PITCH(font->width);
>@@ -2551,10 +2551,10 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
> 		return -EINVAL;
>
> 	/* Check for overflow in allocation size calculation */
>-	if (check_add_overflow(FONT_EXTRA_WORDS * sizeof(int), size, &size))
>+	if (check_add_overflow(FONT_EXTRA_WORDS * sizeof(int), size, &alloc_size))
> 		return -EINVAL;
>
>-	new_data = kmalloc(size, GFP_USER);
>+	new_data = kmalloc(alloc_size, GFP_USER);
>
> 	if (!new_data)
> 		return -ENOMEM;
>-- 
>2.51.0
>
