Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A3FAFEF36
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 18:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E4A10E349;
	Wed,  9 Jul 2025 16:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CaMUM+1o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C16810E349;
 Wed,  9 Jul 2025 16:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752079987; x=1783615987;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7aJKa6CIymindBwEjA0VsXlSpGPfq0tEZZUF4LJR6KI=;
 b=CaMUM+1o5j96d1sDzR0/hS1kCYR0cYsmF8+iKUF9bFQZC6FVs+YNcP3s
 mALeEa3ruFzZeP93OOOcyUDpYK4roD4OEM0uoyS9Ys7s7jx7asAGRd5fz
 Mto6DiAvKfpKvcTSIS51YcBhKkoPjdlBeOF0pak9/HNARR/xKL/yetW9N
 HMVmfcpU8z95PKNzxW0YcF0N3zJrFFaexEi1x79g1AxrVUNDK1af9HSY7
 LvsbM68sb6JyXmYMr3MjoQbzxSVqOzipA7CFUNc7nFUJNbueAtffEpGjo
 TKYxfwrhHI1MbHJZgWiSeUVLyUqPJTqGzZOKAWNhOCMxRtIfuo+hdoQP1 Q==;
X-CSE-ConnectionGUID: 5fZF5UEXSmiNj8QY+E4vPw==
X-CSE-MsgGUID: EFaXka9iTsuglqdDC8MuUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54318720"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54318720"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 09:53:06 -0700
X-CSE-ConnectionGUID: d0x6GSVlRDWz6Rj1xcuq7g==
X-CSE-MsgGUID: VdQV0jZkRh6a77x9sBkh4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="186796364"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 09:53:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 09:52:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 09:52:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 09:52:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ok6FPdqKqmppnC2cFmhqy059e8s3tuKY1BQkUVsaJtPxwuo0HdAISVSJVtO42lR8Sz0wdAsY9Ph3yj5N4JPs4nRt0BtOVNHUyBkkjyD3u6HqctnBScZ5Kw87diGqvhuqAI71/STobp6QUStt1ZU3wylvkavllGdacmAQtJ4RxSHyIU1K433S05Uy8ufWvJ8ZEZFV3uDSTVZkPpjTFYjIgHH9+YWogMpgWbesy2x1HxPTozcs/+biMYrjK0ktCS6fa4dRNqKYUXchKAuJ85yW8cCbV4bn9nlxtrlDSQsMIHye2UrXNPdt4tIlnClsqKR3/bjB6D3qQR18gxNFvjq2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwA/PeSwLEGpYbDZAKbb3oP2YFVWuekKEEiVCV59YZc=;
 b=v0dDmfCUtgZHzh2DsedYMUsXFHNpQ08pxAIlautMJYClEQlyEei+0fAMV4AJH7hSugsA2tKNCEU5gyWxAeXvm630hM9SG5NNJ537HsoiZBCjPeOSm62jVMzGOJzmNpS4yqN9T7waxE0Y7/sKy6VifTJlId8KRn1gGoabrdBPFzwkRjJ0Mz/RHeftLYPcXn7wFNpeKP1PrN5X76i5ELMLhOqZwGpsZE8t0ujQlCxp1bDkLG0J+pZun2u10F1TTT9wQRHVkyK0kHXXeH7mQcVyb98b5WqarTCC3+q2DuuoxvAIsU+qTg4XHjVsii+ED3i97Y37Xr6nzEFgkB7zNpHaeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CO1PR11MB5091.namprd11.prod.outlook.com (2603:10b6:303:6c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 9 Jul
 2025 16:52:10 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 16:52:10 +0000
Date: Wed, 9 Jul 2025 12:52:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, Riana Tauro <riana.tauro@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 <sk.anirban@intel.com>, =?iso-8859-1?Q?Andr=E9?= Almeida
 <andrealmeid@igalia.com>, David Airlie <airlied@gmail.com>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/9] drm: Add a vendor-specific recovery method to
 device wedged uevent
Message-ID: <aG6eNcygPshsSlC8@intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-2-riana.tauro@intel.com>
 <aG5xglf8BeGzleWM@phenom.ffwll.local>
 <d42e17ef-30ce-4bf1-9948-7f08fd6f3bac@amd.com>
 <aG56Trd1h5WbWYJt@black.fi.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aG56Trd1h5WbWYJt@black.fi.intel.com>
X-ClientProxiedBy: SJ0PR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:a03:333::18) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CO1PR11MB5091:EE_
X-MS-Office365-Filtering-Correlation-Id: d34c7f92-f114-4324-5c0a-08ddbf08f1f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?mRf2wWMcnXlnJZviDsfBHp+BUgst0PLZ5k+kEiKbHnYTynzcYOOZWKvwo/?=
 =?iso-8859-1?Q?ZFYgs/FyF+HLPkA3vCuXEmRMVW/x0xdJUZkMv4w4DLZgMZLjlAJkwvWbQX?=
 =?iso-8859-1?Q?6D1BbAv7O51bTkNElaxCXNuGi310KWnpKZ0iNkaT41ZAdDhkAuZwJRwjKh?=
 =?iso-8859-1?Q?VIpUyhTQMRo51YExH/FGarLpSEJ0Up1l16wksotcM3E3ELMxcOljmdSJI4?=
 =?iso-8859-1?Q?OOFTaVboA9Pa77ORwvSv1LBEOhtOq8qrn4tTMFn60/oaX3hOdKEx9U1UvN?=
 =?iso-8859-1?Q?7YDID2SQM5CtC45gn8tX9egR578DXGp/bazRp+qs3jBYNh8I44d7GdLCQ2?=
 =?iso-8859-1?Q?DLZj5uduWp32c3ZYMgHPP3YtWARONEpNUy3fl9fgDOib1FW4TIxSOpaFHW?=
 =?iso-8859-1?Q?wZyISEvjVrYhlQAbrcdLvJBUPG+l6VTyrY4LZHhU/wxUwPsvbFz8uWMmpn?=
 =?iso-8859-1?Q?1OIuHC48ilwoo8w6nzQ4in3bMGy/zuFAxwt1cwIv176hh5vwxbuAGx+s4b?=
 =?iso-8859-1?Q?+ChO2Yl4OgMf2qheawRLtRHlxg9Oie1p45JOyecsF5URbjjC9Y7+lL0lsn?=
 =?iso-8859-1?Q?x9drXrWfud3vB0LgRuRpOJ45QOQp4JNI6sWhMrqXIIPTre+7zu15jxs+hj?=
 =?iso-8859-1?Q?+Sb1TsFhv3sCGsKciWJGdLbplyOrcz9r2ka+FMDmBJJgIyJis7VfbLJ77S?=
 =?iso-8859-1?Q?zmgrD00K17uyiZtJ3LkrEaq+V9KumVjlOEeu6nVD9gQxxVLYnYWXoKcqB9?=
 =?iso-8859-1?Q?5X3Uhb6yMhMM2+FO/o/5cdRVsWBLf9ZD+YISpjbq1uihrkebhcBInOtYGE?=
 =?iso-8859-1?Q?Gg85dLvFI6WoCU579glNlY9a13LPaBOZd/jYLDXf/JkCUXVlXfEAmvZPp7?=
 =?iso-8859-1?Q?13ig618DfAJYaGn4MK61Z30/aEFTm1xhwdHmfBFNDJMCWOQaDFHxcFPsFz?=
 =?iso-8859-1?Q?9jlwTZW0ujCW0C/Kah0CugSmlS5JC+O2xDST0aISYDvoxY9iEmcSfBGMnD?=
 =?iso-8859-1?Q?Hxb1ycRtTFBT+lYrYlIV/njNGUx5ycq452IKzMfQWKAe4p8Pr4Fj2u3EnT?=
 =?iso-8859-1?Q?scE8DBgnDHm2VA7gOjjkMzCYpGnLrPSJrDKnTkYVyPzkC3fcoVxzyYXHF9?=
 =?iso-8859-1?Q?VC/4JvExEBE4UFhjWxoBZIZTb2xXKSYoXYAJWZofTlcNi8Hxczsn5Fe7UF?=
 =?iso-8859-1?Q?G23Ctmbukktj9sMKSS0IU3ibtOs/0z+YvrEsGRybDlTkZ5NoiFdCdHUXBW?=
 =?iso-8859-1?Q?PePliOvmIO2+6sZrA1W6o9PSOennbr3T6yyugazyCG8yF/cIUj+fOSOgGB?=
 =?iso-8859-1?Q?/t3V27bNPq1qrzO4xNd1d2ca+mbf3WkPY8mY1v/bEfGXBoLCzuQnpolfii?=
 =?iso-8859-1?Q?W8nfL434X8V1N2uGkpj3oQ2vKGQWCHcA/WwZOMqkwDDS/1o1QAEUZkKns5?=
 =?iso-8859-1?Q?Qs4o7Bn2qsD55E/lqECdQ8f4QSH6fW9Id1C7SiLkT4J+xR5Y+/tDWfYqGw?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?z2PDUOO4Y9+kCSZqTsQY/GeirXc4nQiPiac3RnPuSZOVsx7msC27Zlofp9?=
 =?iso-8859-1?Q?aFSjjN6Pphr6QWsojn/ucC5mlbME7zX+Cq++1InF2pVuVWVRop6zMKf3Xm?=
 =?iso-8859-1?Q?VvB7fI0ygilBzf4MOg7jc64fN8HmG8m8Fy6YszW+ynHqdBfJ03UhCOeoyu?=
 =?iso-8859-1?Q?549btSO+KF7/RwRYrpZbV1Z20O9gSdNr3IlGn5KgBUrSYOmYM7kVBm+Y1U?=
 =?iso-8859-1?Q?GJuggKhn3PBJPIs7IhjT8LD06F3+Q0Cuv5uPbqx7cKNCK6QUOG9eK/XZ6K?=
 =?iso-8859-1?Q?OcydvaRGrq6hlYUP9vdSeuvqkGtflQpef+4BP4gE0iRWgGrRK7W3w6QawC?=
 =?iso-8859-1?Q?ok4wAKyhu/oXSDWPzSP+K+F/ZBs+U6p+z3tLQTrVVVrXCbGWdNZGsVm1Gu?=
 =?iso-8859-1?Q?rN1DENYg5RnOwA/eNvXmXXxkXeTvY8pxa9/aB0di4h7UC7cJEppT2SI2q0?=
 =?iso-8859-1?Q?uf1Ow1exEL6jy5UDG1qFESJOZC/l+B6bXtz4Ojeionb1WyOAQsg7SXx5pe?=
 =?iso-8859-1?Q?JvMve0oFGA6zsq5FOkMmZYaDRqsdiCeia8iLVnsDwEsyZGuN22Re8mWEce?=
 =?iso-8859-1?Q?s1FMRXoTVVucQ2ykDh/PLRuXpZxAHoAhOUcHz+XP/mSFwsNmkSu0ggysUx?=
 =?iso-8859-1?Q?shBT8qUNdKT69UwAVPRQhA1tKM48jG4QVxeMx7eIvxw1c5dHhZgyOMHUmq?=
 =?iso-8859-1?Q?KjTL8YZmujACjFe7LlYf6Wlm3pJQMYMkigqF1J+RCxWW4qj1Da9KRg3kXH?=
 =?iso-8859-1?Q?7Kdnf9Tg4j6dGQ2064OfPD+LMM1ayD5d7A1HpSjy8Clm89fmzQJeXY5e7b?=
 =?iso-8859-1?Q?NUqF6hsGWY/wWFs31oI1CUEssfTqEtZeH0pFq+H10qXYBpGv4GUDmAeR+Q?=
 =?iso-8859-1?Q?tbqj0Bh1blGo38lbc4s5bDRjJBOWokxTTYtlnL/TNj1H2uUdYIIdVG9fnk?=
 =?iso-8859-1?Q?vGY6B9H/GmfR5JnqdfAxwOlhTgQXB0nM8uGBMzHwixYeI5sZzId9VshGyp?=
 =?iso-8859-1?Q?okJjeoEbsNajqOi1iOLEkIE4/gp1DBu2Smni3ys/jnJ8Xrtjzn1CrpbFpU?=
 =?iso-8859-1?Q?SkkWQ4EEy4EdA8lnWsDI9GL9/0lemn49TWB3d5C8vMZ5PXndJ+PVEsl8jk?=
 =?iso-8859-1?Q?2pnamaCh3Y8q6et9rEl861yeJbm48uI1292HJVbg+RKEnbDRL89VALkTyA?=
 =?iso-8859-1?Q?TakDoD1Ui+SjaNdu+JnC64F8PU29AZkAbT5g2ziT8+0wG2Wi95lBZMqHsO?=
 =?iso-8859-1?Q?+QNbN8ncJsNhC9JdH11LzOnPV5RatDiuShjjrcyQkUFy3/rzhelj25SAsQ?=
 =?iso-8859-1?Q?LoEiYebxef72RV3ScnJZkzmJiXxPFCzSVSKkAxGD8CmuyPvzytWxExWnir?=
 =?iso-8859-1?Q?kZHienTPayHHlqR6F6+rU+y46qtIGk+CvYb1q/LpPGWvNfgUguv7PqLkQK?=
 =?iso-8859-1?Q?ds7GPKcMu//1JkHmMOZauopM2R89YEMA5nSg8fn3i8x5102JXKGnPJ8Mzt?=
 =?iso-8859-1?Q?R181zDCUvuj+gJfZAix4+4+JDVGIoOjaF0c9VEfOrw8OFomXqYJYeuRVvF?=
 =?iso-8859-1?Q?76Wq8ymDT+GgYZi2dS8m2c02Q69XtozdZsiqK9337TnUs1HxQbwvg4UxXU?=
 =?iso-8859-1?Q?wGlv0nXK9FcixaJnD24FF3TMpj+mJUxKuswRZFyE+JW9N0BuJeSOG0cw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d34c7f92-f114-4324-5c0a-08ddbf08f1f7
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 16:52:09.9574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vja7bBw9jZh//fEABOXOYwcvL2HerC347wenBEQfjUwffSHVN2RuIyJc7K0TPtA00mxDiQGCjxwP2vcv8v2oiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5091
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

On Wed, Jul 09, 2025 at 05:18:54PM +0300, Raag Jadav wrote:
> On Wed, Jul 09, 2025 at 04:09:20PM +0200, Christian König wrote:
> > On 09.07.25 15:41, Simona Vetter wrote:
> > > On Wed, Jul 09, 2025 at 04:50:13PM +0530, Riana Tauro wrote:
> > >> Certain errors can cause the device to be wedged and may
> > >> require a vendor specific recovery method to restore normal
> > >> operation.
> > >>
> > >> Add a recovery method 'WEDGED=vendor-specific' for such errors. Vendors
> > >> must provide additional recovery documentation if this method
> > >> is used.
> > >>
> > >> v2: fix documentation (Raag)
> > >>
> > >> Cc: André Almeida <andrealmeid@igalia.com>
> > >> Cc: Christian König <christian.koenig@amd.com>
> > >> Cc: David Airlie <airlied@gmail.com>
> > >> Cc: <dri-devel@lists.freedesktop.org>
> > >> Suggested-by: Raag Jadav <raag.jadav@intel.com>
> > >> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > 
> > > I'm not really understanding what this is useful for, maybe concrete
> > > example in the form of driver code that uses this, and some tool or
> > > documentation steps that should be taken for recovery?

The case here is when FW underneath identified something badly corrupted on
FW land and decided that only a firmware-flashing could solve the day and
raise interrupt to the driver. At that point we want to wedge, but immediately
hint the admin the recommended action.

> > 
> > The recovery method for this particular case is to flash in a new firmware.
> > 
> > > The issues I'm seeing here is that eventually we'll get different
> > > vendor-specific recovery steps, and maybe even on the same device, and
> > > that leads us to an enumeration issue. Since it's just a string and an
> > > enum I think it'd be better to just allocate a new one every time there's
> > > a new strange recovery method instead of this opaque approach.
> > 
> > That is exactly the opposite of what we discussed so far.
> > 
> > The original idea was to add a firmware-flush recovery method which looked a bit wage since it didn't give any information on what to do exactly.
> > 
> > That's why I suggested to add a more generic vendor-specific event with refers to the documentation and system log to see what actually needs to be done.
> > 
> > Otherwise we would end up with events like firmware-flash, update FW image A, update FW image B, FW version mismatch etc....
> 
> Agree. Any newly allocated method that is specific to a vendor is going to
> be opaque anyway, since it can't be generic for all drivers. This just helps
> reduce the noise in DRM core.
> 
> And yes, there could be different vendor-specific cases for the same driver
> and the driver should be able to provide the means to distinguish between
> them.

Sim, what's your take on this then?

Should we get back to the original idea of firmware-flash?

> 
> Raag
> 
> > >> ---
> > >>  Documentation/gpu/drm-uapi.rst | 9 +++++----
> > >>  drivers/gpu/drm/drm_drv.c      | 2 ++
> > >>  include/drm/drm_device.h       | 4 ++++
> > >>  3 files changed, 11 insertions(+), 4 deletions(-)
> > >>
> > >> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> > >> index 263e5a97c080..c33070bdb347 100644
> > >> --- a/Documentation/gpu/drm-uapi.rst
> > >> +++ b/Documentation/gpu/drm-uapi.rst
> > >> @@ -421,10 +421,10 @@ Recovery
> > >>  Current implementation defines three recovery methods, out of which, drivers
> > >>  can use any one, multiple or none. Method(s) of choice will be sent in the
> > >>  uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
> > >> -more side-effects. If driver is unsure about recovery or method is unknown
> > >> -(like soft/hard system reboot, firmware flashing, physical device replacement
> > >> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
> > >> -will be sent instead.
> > >> +more side-effects. If recovery method is specific to vendor
> > >> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
> > >> +specific documentation for further recovery steps. If driver is unsure about
> > >> +recovery or method is unknown, ``WEDGED=unknown`` will be sent instead
> > >>  
> > >>  Userspace consumers can parse this event and attempt recovery as per the
> > >>  following expectations.
> > >> @@ -435,6 +435,7 @@ following expectations.
> > >>      none            optional telemetry collection
> > >>      rebind          unbind + bind driver
> > >>      bus-reset       unbind + bus reset/re-enumeration + bind
> > >> +    vendor-specific vendor specific recovery method
> > >>      unknown         consumer policy
> > >>      =============== ========================================
> > >>  
> > >> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > >> index cdd591b11488..0ac723a46a91 100644
> > >> --- a/drivers/gpu/drm/drm_drv.c
> > >> +++ b/drivers/gpu/drm/drm_drv.c
> > >> @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
> > >>  		return "rebind";
> > >>  	case DRM_WEDGE_RECOVERY_BUS_RESET:
> > >>  		return "bus-reset";
> > >> +	case DRM_WEDGE_RECOVERY_VENDOR:
> > >> +		return "vendor-specific";
> > >>  	default:
> > >>  		return NULL;
> > >>  	}
> > >> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > >> index 08b3b2467c4c..08a087f149ff 100644
> > >> --- a/include/drm/drm_device.h
> > >> +++ b/include/drm/drm_device.h
> > >> @@ -26,10 +26,14 @@ struct pci_controller;
> > >>   * Recovery methods for wedged device in order of less to more side-effects.
> > >>   * To be used with drm_dev_wedged_event() as recovery @method. Callers can
> > >>   * use any one, multiple (or'd) or none depending on their needs.
> > >> + *
> > >> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
> > >> + * details.
> > >>   */
> > >>  #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
> > >>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
> > >>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
> > >> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
> > >>  
> > >>  /**
> > >>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> > >> -- 
> > >> 2.47.1
> > >>
> > > 
> > 
