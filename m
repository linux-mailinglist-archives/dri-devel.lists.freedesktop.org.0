Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Bet0KlHLi2n7bAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 01:20:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E41CF12045C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 01:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67DD10E153;
	Wed, 11 Feb 2026 00:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQ9GJnNB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF3110E14F;
 Wed, 11 Feb 2026 00:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770769228; x=1802305228;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2XRU/QOnYSvIWkpAO/ZsoJn61QzvRqvVIfLvqfBvvYQ=;
 b=eQ9GJnNBunRQ2yISAvXF2M3dv2tPWoDxL468vQRRDhSCp/G5jD72GQP2
 n5Uf7tCTkoN4uqvZqB8qYU/45UDywvT5doAeA24Ag8UbQRxc3BBtQ5adD
 Z9R2w2fX/4j9gG+BjTI/f2u66I+YQ+uImGS1pjLWh9dIgrFfu2kivEzgm
 D6OvyH15oVFORSIHjTM4chYoqKjRr5Wiz4zQqGLEiUHtHdmosEkZ9NGLi
 skQdkk8qbV2ftFvjRPYt2LKRh7JY3WCC8fAgWIVgxvUl6B9rV6PRIAL18
 RL1NKW9Bhl3m8O5gpzYV67uMrExJVD8ftNHS9YTY7ZDe4YoU7TJrUSmPL Q==;
X-CSE-ConnectionGUID: SToBFA4/SEGhr7uOXaiudw==
X-CSE-MsgGUID: oXNVmh3fSaCjXUUhnGvkEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71628356"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71628356"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 16:20:28 -0800
X-CSE-ConnectionGUID: IpjBG1fpSCOhVmUHlRlIXA==
X-CSE-MsgGUID: FH1YKlIfQ0SY0P8WXfTKMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="242689088"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 16:20:29 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 16:20:28 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 16:20:28 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 16:20:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NfmLRPqUhU8fseB/SMy2hKhbKMJXAkbSb/yh2R1UNjcELRINBl9faVuqOhYPHj1TSc3uq6tpYblP1kzXomayjdegR2EPzR4QW0DoC8RK5LWjYBoH50QdDl135lx4tDg4tQptv86H5F1qXyElKGVTaQMYwJxNzcBalV8FmeK0tqHAtDpQxXqsN8rJ7o5vJxW5OIrt1+o9RzldzRVXGiXMXuin+E2jzWdLxGkvTqz9abPylT/6AOHVZbX3CNPMsTT6Md3UqCGq5Rt4XXN1bCIGylNOq0GKFxu0zQhHqBg4IWrtnfaepkIP3S9ZDIcGN3NjpNNyq49EPt3gBdvbS+5DLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VV9IDGg728f4CiJ4hFflGY48mfV0YSUqLFtwRM07Z1Y=;
 b=aYsnOB5kelIY+y9uXb20e+4pTuAZ+srlrsA807LhvmlnmN3KPxwCzcaj6XZZPnP3ufDgkl3NWYggPyU2prSZeAztMtxOUnD6Jo2yVk9s+fBVMMGlqboaH2fLGtpwdRWuMeMu0R0FF+K6lm3t4H/ZH0umcz0Orr6TUue4LU9p8+ZcP5ls0pemcXGZsBq1xGMxWdx6RjvnSWReW1pLUP808+3MqXgeLdSsFQJh7tEYd1VPWehw7Hl37LgUkVCQuFFyDjXaclKyFkna8vQHga/bbHFAQDrVV+ryniSZCpnXlpeNCOudcZLzLMWxd1X0/9yYTNGxhJyTUiKyKMd5kGSsyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB8398.namprd11.prod.outlook.com (2603:10b6:208:487::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 00:20:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 00:20:25 +0000
Date: Tue, 10 Feb 2026 16:20:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/3] drm/sa: Split drm_suballoc_new() into SA alloc
 and init helpers
Message-ID: <aYvLRig/NgaKhlHy@lstrano-desk.jf.intel.com>
References: <20260210105929.4089794-5-satyanarayana.k.v.p@intel.com>
 <20260210105929.4089794-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260210105929.4089794-6-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4P222CA0021.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB8398:EE_
X-MS-Office365-Filtering-Correlation-Id: 70550d99-437d-406e-87ab-08de69035a29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?A3m8W1cKMir/GUXTpuC38s3wSzEqDu8tnWSfC37GKVTrjvfVZVLeKi8ejJ?=
 =?iso-8859-1?Q?S3PGe/eZCx2Oa2gLvd/vor+d2Am1i18p1ud9rAtEvp742CfLIek07s62tE?=
 =?iso-8859-1?Q?Osk9owFEAmNgHhHzg/2ie8PHzwhM4407LDRQ3Ex/3pO7Qx/PtGSggy5QU0?=
 =?iso-8859-1?Q?4llGzWWvDFQslTrQ1XJf7or/mD5qU3qi5Aam/zmbILi6Yb/4ShSIxyagk1?=
 =?iso-8859-1?Q?QZblCH+jQq0A6NYctFFRrduhHTDsRX58409i890tKyF0zdO2AWrHdG1CzM?=
 =?iso-8859-1?Q?DgtvinK+R4yTXjL+M85WLlkLaiP25tpmkXlbGkzgwgC/ub/KgxKGrXWNdI?=
 =?iso-8859-1?Q?orT0FZeKZIhcQwV6msQq3nCnwWUnHkAFpZyk3tc+190jJWeDg1bsiOWTgH?=
 =?iso-8859-1?Q?lkMpE5I5tW2aD1rYy0+/thoTPdlIRAhLFUDOGwvY9H2tY9hWstbkkySupy?=
 =?iso-8859-1?Q?g92koh6XdnB5ysJZTfF+vvbh/JAGehXhHhhi4ll6U4YOz88t7knp9Ql/U8?=
 =?iso-8859-1?Q?fS6g0/nUBuhMa2tmAHPkO0WdezXx196zxNqflJqUccwW8+L6ScXGtE8C2k?=
 =?iso-8859-1?Q?avtsNMjjDblMWLVj/QVXy2/VO/ohBfqzyWJ4/TAXwnKlc3y3VCyctiP0rC?=
 =?iso-8859-1?Q?ePW9jCrhFyNkssw2mv1dtvsNhSJ9MTFlJtJ9e0DbHVEJqODFGqvcfZWPoq?=
 =?iso-8859-1?Q?vLrkCISmCSoGBiQn5NJn3U3O974/jl55nBeCP1NjRAiHzXh0MRp1fuQJ4i?=
 =?iso-8859-1?Q?IZiRpb7EJvfauC0yu7Mi68h5wFK4GMRB67aOpDEa0RhrR6CJuArQBHzvoO?=
 =?iso-8859-1?Q?PdfKMpPO2Sna7ZZhi7lJ1s2ePuttw4a+VyNw6b6Bg33dLCXW2TG+d6NIdP?=
 =?iso-8859-1?Q?xmdCE6G4csI+ZbIHua6KpTqzBC+bIOOqDIYUk5d5ivCswGwuwhXKl/JZGO?=
 =?iso-8859-1?Q?c1WdgvoZNvfhYmiuNYc8tVcaoJFGaJY8YqW/W7hPphZAAm2QDpclWHmDJv?=
 =?iso-8859-1?Q?POlUBwDl8BTqfjkD4+f9lofWbX//P76dU60MTyo5m54a4J8/Q8ZRfD5qgA?=
 =?iso-8859-1?Q?qyy0eXgxpxsZA72lmuIwilOihfJJIByGRm9UEqk8ui2xqu++bdT1AAYrcs?=
 =?iso-8859-1?Q?eGTeifsfhlvgKrdxIUhgdkHhLaelizf18CG4jyZcfX/mWLb7HdUsF1jeSV?=
 =?iso-8859-1?Q?lJtdg0FwEuwY3aO8zt2SOarLI8zQzZH+spaoyK4FDzmAIQ/jBzTg0vmJAj?=
 =?iso-8859-1?Q?3CMDtUWqZ8R37wQINWFZK9fN0NxGaacwqmWBAaIX4grvy7XY2oHclZgR6n?=
 =?iso-8859-1?Q?NoGlTIRziHUPSQYXCHp57IXSkZkiBjUpEmb2Yfdj7TtjfuwZJk5AkkVX+n?=
 =?iso-8859-1?Q?a4KmkGO9/vId3nYU/SfQNC6mh2ymgyswj0rlAhVvr4o+HxqofDfFJhduf8?=
 =?iso-8859-1?Q?hDLhUXVRI6oYUewAUPmJXaws+lSjPcMnPS178OP12njgTfR9lLZY9OxVA7?=
 =?iso-8859-1?Q?69PBwnvfF6q2GxS1IwTU2RSW1PDNToYrk2POzVOVOK+rlIPcMQK8p2R9dR?=
 =?iso-8859-1?Q?FzvUIgGlQJAHIl7Bq4sYUmwSbmvrAMrincZZmhG5zpTayJNwdEE91yVhHg?=
 =?iso-8859-1?Q?84bIQmdqjages=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fjNAO1KkfQTi/EgS6RJ0XPin922PR8CXpBaGJC+g0YSQ4yfwfQ/qtT4Rw0?=
 =?iso-8859-1?Q?RMholUP6K+smXF4d/7Lm6sUs52yVz7MA4kpG+XeWk2giwbmMYcnZG33usW?=
 =?iso-8859-1?Q?QR6WR4VIjhJkptzQJW11G+UpLB1c6jA4R7YKusW7YhQBV+qsz/+g1QjE/o?=
 =?iso-8859-1?Q?fOAbIBuA8204SWaFuLm1ej2/G9K91Od65a2dBKkE6WlA0Q5QLK2VNxB7W9?=
 =?iso-8859-1?Q?983+HfnLh8ZZAESfwXVaYub0uieH7RNocGGtF2PNDFj9rCF0TLgghg1Lie?=
 =?iso-8859-1?Q?kXrxd+GOPd1eS8gq0Ra7nxSFruWYkOkCNArzjzmO18Er13r/P5zJPGyDJ8?=
 =?iso-8859-1?Q?6vV9oYCtyozDpM1BhQyqnHR/364dRU7W1AzLWxT6hweOVOakQ2yMbG7oAx?=
 =?iso-8859-1?Q?zq0oOIQFv9rPqU2HipthF+4SviYKsOoKI4MvPxbvPv9Pc2OH/klVOh3yiv?=
 =?iso-8859-1?Q?jxLqtCJ9Mt7mJ1unxLGJeOei+dS7YuCw4XKBSamOJU0pNLF4aY/PENukuv?=
 =?iso-8859-1?Q?kl06eMHpUexn23Par0iS/DYMA05OhW6UopPtOQmARy0uRxt7h1NkXP6Iss?=
 =?iso-8859-1?Q?3gj8PY5rx48Cd3BzsfsvVDm2RRv1ntjJnZBhqqQsgXAyr0fnuzNmpzqjcZ?=
 =?iso-8859-1?Q?hankLZcbtBBLjsYswn8C6jBWUTFUsOi4HJKLOZvOw2x/dasvts6/rWMbLc?=
 =?iso-8859-1?Q?E7wk/R5OIiir+P0THSAcyJsPSsRJaX3vueM420y4huw1rVzk3YCvMb3qyJ?=
 =?iso-8859-1?Q?2cjHehapJWYMpRQNwsFxVehjrbE0K33i++GKBhMwtiZJj8qx8GZ31VOplk?=
 =?iso-8859-1?Q?Rp4aRQFWXb0BI2nxH1H2pSeuX9fHazbS97lBdhYbAN6cL5pDUxhb7xFL+N?=
 =?iso-8859-1?Q?cRaQJsrur0cHiRHyjq9+zQeb5QJu2QbjWUQFlWm9rRy2z+ED96tbu4i+0w?=
 =?iso-8859-1?Q?tJGVnGm1J9B5uBlRDgsCse8I+R4uO/kT7PYz6q3lK1WPyhvjd6+TcaGmQ3?=
 =?iso-8859-1?Q?PBfNOIHx4b+PJaM+myU0Jv+5mvz7WYpuknKConGIcje7QftbGZDqtEgnV4?=
 =?iso-8859-1?Q?ep+8t+zjnwFehcXg46GQo6PoflL5xRNfdJuc58vJ0+AACPYP7mv7xXiu2T?=
 =?iso-8859-1?Q?ZjZuPUIOI2651CVkHawuilu1wVOsd12HVFLbRFLv0Z3nftqaEsFBKEepea?=
 =?iso-8859-1?Q?RxTXvJGWfYtqxuelHV7ZqX+PzS4TEx8zR1ozS4ORBdkk6H5dXSXMNyfyCX?=
 =?iso-8859-1?Q?ySQchl8v4V65Cn1187h3AAoJWy+dcCHdtF22Sfg52OKbIpevOdXLiRZf/o?=
 =?iso-8859-1?Q?vvqxerWMCCTnZZhdlwlNd9TadekjdvMjutYjGPecjIF3uL01I4fUMrl4tb?=
 =?iso-8859-1?Q?s/04v+80sd9wpsxKbGD+QUN4CD0Ixm+xRnkZc+jQO8NeFiR3r/CEs5V1CJ?=
 =?iso-8859-1?Q?qSN3e5m6hfyoLd1+uF3kJBO221N44np8EemFDI+1Y8aMA/FBj3ANQgix9d?=
 =?iso-8859-1?Q?0E94foWHUW9z2nl8i452/3fuAljnfOqWLJ1RudH2DANP0J9/zFNhA2XPva?=
 =?iso-8859-1?Q?n22P918PLlD+hVViNh1UHeI468lyLVKV2kr2/dQnPwzMcvzI9TAzKHgCVB?=
 =?iso-8859-1?Q?c0toe3KtGfuJaw5mUpZT6amKRs8NYZMDmd++3HRZJOukHuFu2qmFi5GaF1?=
 =?iso-8859-1?Q?iIubNPOgVrc0PoV6jvrU5BrgbYCwHEOZ9xr4RYWoXa3brFGMez3GQhdJUE?=
 =?iso-8859-1?Q?U6bzgKUvSbUrp51dVIfVdUIw4jEAr0iZYiY6SEHJTAWFCeofHaxeJOQhKK?=
 =?iso-8859-1?Q?FQ+3325p5g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70550d99-437d-406e-87ab-08de69035a29
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 00:20:25.2911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGzv8RxT2W/TuT2Cm+IcuQQdgJlEm0p8Clr1s/hBWpvUeVCeW/W6SQ31ARyMrBSVeWPKcGVnm+EAO8TlfC14uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8398
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,intel.com:email,intel.com:dkim,lstrano-desk.jf.intel.com:mid];
	RCVD_COUNT_SEVEN(0.00)[9];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: E41CF12045C
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 10:59:31AM +0000, Satyanarayana K V P wrote:
> drm_suballoc_new() currently both allocates the SA object using kmalloc()
> and searches for a suitable hole in the sub-allocator for the requested
> size. If SA allocation is done by holding sub-allocator mutex, this design
> can lead to reclaim safety issues.
> 
> By splitting the kmalloc() step outside of the critical section, we allow
> the memory allocation to use GFP_KERNEL (reclaim-safe) while ensuring that
> the initialization step that holds reclaim-tainted locks (sub-allocator
> mutex) operates in a reclaim-unsafe context with pre-allocated memory.
> 
> This separation prevents potential deadlocks where memory reclaim could
> attempt to acquire locks that are already held during the sub-allocator
> operations.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> 
> ---
> V2 -> V3:
> - Updated commit message (Matt, Thomas & Christian).
> - Removed timeout logic from drm_suballoc_init(). (Thomas & Christian).
> 
> V1 -> V2:
> - Splitted drm_suballoc_new() into drm_suballoc_alloc() and
> drm_suballoc_init() (Thomas).
> ---
>  drivers/gpu/drm/drm_suballoc.c | 110 ++++++++++++++++++++++++++-------
>  include/drm/drm_suballoc.h     |   8 +++
>  2 files changed, 97 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_suballoc.c b/drivers/gpu/drm/drm_suballoc.c
> index 879ea33dbbc4..b97ffcd98d45 100644
> --- a/drivers/gpu/drm/drm_suballoc.c
> +++ b/drivers/gpu/drm/drm_suballoc.c
> @@ -123,7 +123,7 @@ static void drm_suballoc_remove_locked(struct drm_suballoc *sa)
>  	list_del_init(&sa->olist);
>  	list_del_init(&sa->flist);
>  	dma_fence_put(sa->fence);
> -	kfree(sa);
> +	drm_suballoc_release(sa);
>  }
>  
>  static void drm_suballoc_try_free(struct drm_suballoc_manager *sa_manager)
> @@ -293,45 +293,74 @@ static bool drm_suballoc_next_hole(struct drm_suballoc_manager *sa_manager,
>  }
>  
>  /**
> - * drm_suballoc_new() - Make a suballocation.
> + * drm_suballoc_alloc() - Allocate uninitialized suballoc object.
> + * @gfp: gfp flags used for memory allocation.
> + *
> + * Allocate memory for an uninitialized suballoc object. Intended usage is
> + * allocate memory for suballoc object outside of a reclaim tainted context
> + * and then be initialized at a later time in a reclaim tainted context.
> + *
> + * @drm_suballoc_release should be used to release the memory if returned
> + * suballoc object is in uninitialized state.
> + *
> + * Return: a new uninitialized suballoc object, or an ERR_PTR(-ENOMEM).
> + */
> +struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp)
> +{
> +	struct drm_suballoc *sa;
> +
> +	sa = kmalloc(sizeof(*sa), gfp);
> +	if (!sa)
> +		return ERR_PTR(-ENOMEM);
> +
> +	return sa;
> +}
> +EXPORT_SYMBOL(drm_suballoc_alloc);
> +
> +/**
> + * drm_suballoc_release() - Release memory for suballocation.
> + * @sa: The struct drm_suballoc.
> + */
> +void drm_suballoc_release(struct drm_suballoc *sa)
> +{
> +	kfree(sa);
> +}
> +EXPORT_SYMBOL(drm_suballoc_release);
> +
> +/**
> + * drm_suballoc_init() - Initialize a suballocation.
>   * @sa_manager: pointer to the sa_manager
> + * @sa: The struct drm_suballoc.
>   * @size: number of bytes we want to suballocate.
> - * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL but
> - *       the argument is provided for suballocations from reclaim context or
> - *       where the caller wants to avoid pipelining rather than wait for
> - *       reclaim.
>   * @intr: Whether to perform waits interruptible. This should typically
>   *        always be true, unless the caller needs to propagate a
>   *        non-interruptible context from above layers.
>   * @align: Alignment. Must not exceed the default manager alignment.
>   *         If @align is zero, then the manager alignment is used.
>   *
> - * Try to make a suballocation of size @size, which will be rounded
> - * up to the alignment specified in specified in drm_suballoc_manager_init().
> + * Try to make a suballocation on a pre-allocated suballoc object of size @size,
> + * which will be rounded up to the alignment specified in specified in
> + * drm_suballoc_manager_init().
>   *
> - * Return: a new suballocated bo, or an ERR_PTR.
> + * Return: zero on success, errno on failure.
>   */
> -struct drm_suballoc *
> -drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
> -		 gfp_t gfp, bool intr, size_t align)
> +int drm_suballoc_init(struct drm_suballoc_manager *sa_manager,
> +		      struct drm_suballoc *sa, size_t size,
> +		      bool intr, size_t align)
>  {
>  	struct dma_fence *fences[DRM_SUBALLOC_MAX_QUEUES];
>  	unsigned int tries[DRM_SUBALLOC_MAX_QUEUES];
>  	unsigned int count;
>  	int i, r;
> -	struct drm_suballoc *sa;
>  
>  	if (WARN_ON_ONCE(align > sa_manager->align))
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  	if (WARN_ON_ONCE(size > sa_manager->size || !size))
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  
>  	if (!align)
>  		align = sa_manager->align;
>  
> -	sa = kmalloc(sizeof(*sa), gfp);
> -	if (!sa)
> -		return ERR_PTR(-ENOMEM);
>  	sa->manager = sa_manager;
>  	sa->fence = NULL;
>  	INIT_LIST_HEAD(&sa->olist);
> @@ -348,7 +377,7 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>  			if (drm_suballoc_try_alloc(sa_manager, sa,
>  						   size, align)) {
>  				spin_unlock(&sa_manager->wq.lock);
> -				return sa;
> +				return 0;
>  			}
>  
>  			/* see if we can skip over some allocations */
> @@ -385,8 +414,47 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>  	} while (!r);
>  
>  	spin_unlock(&sa_manager->wq.lock);
> -	kfree(sa);
> -	return ERR_PTR(r);
> +	return r;
> +}
> +EXPORT_SYMBOL(drm_suballoc_init);
> +
> +/**
> + * drm_suballoc_new() - Make a suballocation.
> + * @sa_manager: pointer to the sa_manager
> + * @size: number of bytes we want to suballocate.
> + * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL but
> + *       the argument is provided for suballocations from reclaim context or
> + *       where the caller wants to avoid pipelining rather than wait for
> + *       reclaim.
> + * @intr: Whether to perform waits interruptible. This should typically
> + *        always be true, unless the caller needs to propagate a
> + *        non-interruptible context from above layers.
> + * @align: Alignment. Must not exceed the default manager alignment.
> + *         If @align is zero, then the manager alignment is used.
> + *
> + * Try to make a suballocation of size @size, which will be rounded
> + * up to the alignment specified in specified in drm_suballoc_manager_init().
> + *
> + * Return: a new suballocated bo, or an ERR_PTR.
> + */
> +struct drm_suballoc *
> +drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
> +		 gfp_t gfp, bool intr, size_t align)
> +{
> +	struct drm_suballoc *sa;
> +	int err;
> +
> +	sa = drm_suballoc_alloc(gfp);
> +	if (IS_ERR(sa))
> +		return sa;
> +
> +	err = drm_suballoc_init(sa_manager, sa, size, intr, align);
> +	if (err) {
> +		drm_suballoc_release(sa);
> +		return ERR_PTR(err);
> +	}
> +
> +	return sa;
>  }
>  EXPORT_SYMBOL(drm_suballoc_new);
>  
> diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
> index 7ba72a81a808..b8d1d5449fd8 100644
> --- a/include/drm/drm_suballoc.h
> +++ b/include/drm/drm_suballoc.h
> @@ -53,6 +53,14 @@ void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
>  
>  void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager);
>  
> +struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp);
> +
> +void drm_suballoc_release(struct drm_suballoc *sa);
> +
> +int drm_suballoc_init(struct drm_suballoc_manager *sa_manager,
> +		      struct drm_suballoc *sa, size_t size, bool intr,
> +		      size_t align);
> +
>  struct drm_suballoc *
>  drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>  		 gfp_t gfp, bool intr, size_t align);
> -- 
> 2.43.0
> 
