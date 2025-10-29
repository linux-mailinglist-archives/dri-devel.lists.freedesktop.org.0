Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BE7C182C2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 04:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0130910E6ED;
	Wed, 29 Oct 2025 03:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AHe3RIXo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF4A10E0EC;
 Wed, 29 Oct 2025 03:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761708441; x=1793244441;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ekx8q/s/5m0aNz9UZwHRVeXzuHQ/sbo1GG70cKkQeiE=;
 b=AHe3RIXoUuStUIQpJFKYH2b8yPlnMicHRKD+U6QJAPm13dUYup5BiPMA
 L22CzCkbGO8Vut2nbS3+tXEGCcMR7EJqpt3xOtjibxCs+XVDZhBoWtCvm
 UzGNv0facg18TkYJNYaEG0jjbeyPFt34hP6p3esJmxp6HT9ilO+OXQ1Lq
 gK50aTE/yObGbBv20rE06RrJ1L+/djXyTbm9ZR8EWv1rXdqmwubhvnzW2
 wthvF/OGw2+gdu4Rct8jwxk8wVhDeNZS+yi/pU6JvZDbrlWKdOA8+/vFI
 s1dKh/sHkMrnYZ/uiACI3EHojOFdWwnsjKniUK941YWoKz9d8gU8HgMel A==;
X-CSE-ConnectionGUID: 1EzFS0vBRmuWfzF162Py2A==
X-CSE-MsgGUID: bmBPsVhVQ6aTga8l6tIe4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74938855"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="74938855"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 20:27:20 -0700
X-CSE-ConnectionGUID: rEi4ws9zRn+3BRVJ4B8jWw==
X-CSE-MsgGUID: P6+oNoVkRhiumbvfWCfLgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="185168295"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 20:27:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 20:27:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 20:27:18 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.35)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 20:27:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e6DSI3NqbBDCf+dmwaOVRUD76esNpxZlGO3KHU78JMi+3bnU+iRtsr2KSxXraGaFFEmjYfGu+yZC09geoYNKZAlH3zZ9SFfsxRo3GkHI4ej/c0pSjGNsLNCXjvt0NTmlemale5mBhNFtroat1FrMvzzUNu+/LjRCQbQWml1MKwxo/d5R3u8D+ELm/h9MQDUYxV2cwBehlH+7C5uu1ljHBgT6LCVMcYdoHqf1UEpyoSaq2ZWHjbcB629EDpjKM7KvL4MlVituGSwiEvdxIGuZSklcfhTKNBFSVD5+p1XDFIB0f0eN41r0EvL1B7FEUAPdySj3kR/kiSv5O7GmECpu1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0u1SQQ2xnKIMMVcmH2x4wlHkQdP+Z/7L8dLlP9bEfw=;
 b=nEoDmp3gVhc6cMDJ1ZnOTdbaQWHiTt668XRs3+u/gl5ac01NV31rL1T7v46TK6AxrxaGwYbUMZ3ZE/IyvaIHc1rBCikPGDMDYje6SriBAlFtQpNz2+CGNMq2XBGv8Y3+xP0KnMqx8SOj6q46Py16fsbBZQoN4yk9ycA2cfkc7dj3kdPTdKeFfCcszy/pNh4H/WSjam7xb5dkHiqeBfJRo18ta7y+kyTZxXdSrhrGOCuzw8FKzynTQjM298SV22D+dM38jBIpnh44pRGiN4DrDah1TWRfTrXSq14d6FEpuy2ie//lHED3Tczsi8+SOYKfBAC7IMFCD7H+KqKVryEvGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8809.namprd11.prod.outlook.com (2603:10b6:806:46a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 03:27:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 03:27:15 +0000
Date: Tue, 28 Oct 2025 20:27:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 10/15] drm/xe: Use the vma attibute drm_pagemap to select
 where to migrate
Message-ID: <aQGJkJqG9Un1i3lP@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-11-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025120412.12262-11-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0044.namprd07.prod.outlook.com
 (2603:10b6:a03:60::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8809:EE_
X-MS-Office365-Filtering-Correlation-Id: ee69b887-7e7b-49a1-a726-08de169b0e9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?aaDBTy5JV1F7nJO4whWwQxEKE47TTlj4kUUDshNrUmeYUQDksZ4qgnjoDR?=
 =?iso-8859-1?Q?oTVl62m9OGax1UE/UR0syChqvOE/p9RVseLWearTj48d52DJx5tkovK8G/?=
 =?iso-8859-1?Q?iMygIEcYDaLzx9wyo7LO05iLWWnHficbT6eudZ2T6dVPbTDZ123ZGwSo9C?=
 =?iso-8859-1?Q?Sl5cb/ND41NTt0TZ93UnisbPQRP7D0hCkPEizGB1shgDZsTfIig2eD0uLk?=
 =?iso-8859-1?Q?gRR9fPjPHD8MLMW6T0o+N9cGLgdzDQ+zbY+G4IFk4iIYL+RFc/4swvcfp7?=
 =?iso-8859-1?Q?QnsYjlWAyiXR7GkBWvYtPS5NFVu/sSbVigjWL9EsKLdGfFFVjqPm6HMo5C?=
 =?iso-8859-1?Q?WMvUYh+OookEFh3KnSzVnCrs9iLoNPbdt79lBI2TGs2g7L9jwpYXWwC2u8?=
 =?iso-8859-1?Q?YwHztE2TzVYxRAJkmwNpHknMMm3tZkMNdx8MvhAexRsPefu/fqo1cIDHfx?=
 =?iso-8859-1?Q?xM9Z3zjeiY9MTt6ZZipb5W5prPE/A3waBjQtsFJYJBIDR/hZ1hu8UuICUI?=
 =?iso-8859-1?Q?QJPkqfAe6f2LvPdPL5jcH9RrDupFn/qLbTCyuJdIie+1bXf23VSmRyC/Uu?=
 =?iso-8859-1?Q?xuAAH++kwtCTCG1gNr3QoAYI8LpdyB+sSu+tqD9/EuxjqhTMIU4WEh1xXM?=
 =?iso-8859-1?Q?HRKzFyHMh/MLnbombpx3MAFltno0hidDuB5mEItO+FZ4dsRLllShSe4LCb?=
 =?iso-8859-1?Q?PBDLXSiTA34c6QeSdgsAZ06FAkWlYkxCT+WKGUwdNjT2gXbKWG6NIs8lP9?=
 =?iso-8859-1?Q?O2Akl3tBUQi2xZRXmyNUxYLbDnGzDy8av7wSM/OasRPreZwvXPs4Npf0ZX?=
 =?iso-8859-1?Q?Aim2OgOW8LGq3SV4vYfpJpz18Qyw7zTvu6kCdDWM+fuW5s2i63qz39H8HS?=
 =?iso-8859-1?Q?Z7Fr0vrK8Y+Btu4EfEn2zRaspHe+kJ2EoG+qE9NRh7dUfSicpGTwHL/eeC?=
 =?iso-8859-1?Q?Fd19Y85DGI4zpwmcLf5GeSXlXHUHh/NutMpIjz9SWB880TFAHgDyRe7B7U?=
 =?iso-8859-1?Q?NHerd3dac/a4c8oWS1xwhY1jjA0tcxre6f213+D8ZrMojKJJGv9XzUeqNX?=
 =?iso-8859-1?Q?u1YQOeiQmKS+u5WtyXZP70fNjRoW3DY0XKOd0X3g5cukzZANZ9jrQ9eaYc?=
 =?iso-8859-1?Q?FOKAanr8NY21Ip14o5n5SiIxy5tQ0VJ9Au7ddYK2g9y5EUWdZKCm7mwqaT?=
 =?iso-8859-1?Q?z0/Cr5IrOtKALx8gmmeDYAG9KhIMyY2ZmrqJY1g5wV0QafNGSQBA5II03U?=
 =?iso-8859-1?Q?Y98INZ+cpfRLgQZqmHFtwL3ybjjHMpheZjoNiSOhdR1xUxnfo/yPu4MDMR?=
 =?iso-8859-1?Q?Du8vONWnugWx+Ri1y8n9JyqPuByKjUrDvvUz9mRnDr8H3QqhtYfHm9myIQ?=
 =?iso-8859-1?Q?6gaNlIZiMwWGGE8q7YZ1+v9QdryrMp6mlvTNAEJp8zcC6NY3bfzDiStdJV?=
 =?iso-8859-1?Q?OgHfXpEGkbYrhTNu2DBU2HnO4E2JqPLllmen4x7t+g8ptvJkLF1XMmZYbs?=
 =?iso-8859-1?Q?JWTtuf+5x7e1mLqGE1kAEA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?14BgUU/JdH39iQqhwYSQdacp+SWO5VKZUaQlNiw8Mbti34gKgGR12nEoal?=
 =?iso-8859-1?Q?7T0CJoymIihLsBCnUlYQF9OBkapTiGsIHBnLrwuhgHRJpNBf6ABi+uDvKe?=
 =?iso-8859-1?Q?PTM3smPn3FIYIdWUCnEqVCn5vtY1LgS0gi1F5t5JLC93wtrltugGxwuXg7?=
 =?iso-8859-1?Q?PTGVn9Hk1qi1JxiB3X4VCwkcGQtLyt5wu4yLO0fuZ6BExJYkmdqFIHdJBV?=
 =?iso-8859-1?Q?FprNoZagmRURU0S/WSyCFf+0k/7bBF/1jLrCigQ45sJIrIbqOepqBNjAxx?=
 =?iso-8859-1?Q?LsVPCDCSqMdBl7XdbSWycPJ/18s2TNf4cIrFU4Ufttw8PCWJFtdJ8fLxTf?=
 =?iso-8859-1?Q?lNbA/EUjFoX9NYwuRFS7IqmfeZ2z3FV3LQo2MQlwQ+iaURIRcIFVL73m4x?=
 =?iso-8859-1?Q?aRw00EgiVOeH/ruGxvHPwHP5MvfQf2jeQSq0+hFVNwKN8QO9zh/Cx6J0iH?=
 =?iso-8859-1?Q?y6J4/ut0Dlgqo3KuWJo37JlHqVsR5ZRUzHQVi0x+ghjxj0/FuCEkCn4ys+?=
 =?iso-8859-1?Q?1+10FDaF9T4G/+yRrvOHfGygWYw0dPsd98CX/ZrP92Ypb8f7wAWYXsrgLJ?=
 =?iso-8859-1?Q?n40Vhs9+6MpW/6K5I2BKA+KaZzXzP+Ex1mIww140W9PCYxzdev1LN3SXJn?=
 =?iso-8859-1?Q?sxgFgBF2wjRjoj3CScL6Fsc53gRqVxXVDJ8WCezSN31+5rw+hdePORJDOM?=
 =?iso-8859-1?Q?Pww9VnHC3x3PTSU96pb8wEoTLsjy/lDonpNsIhD9pbeX6EvpSZ/EXY7sFX?=
 =?iso-8859-1?Q?zdTW/swuZi57BzSG20gH4pRaleA/gyUoXisLWXcJvHjEnKYLijpdAO8oJU?=
 =?iso-8859-1?Q?D41cxN1hwrX/vqINGpjZMi5efNMEEusGTMTsujNkNHy1IgLq/fjfFhhgUF?=
 =?iso-8859-1?Q?I5wU8WocmG5FROgePvcW4q1T6OEeFvlI0NTQ4OtHY1plnHsj/ngG5FLMDb?=
 =?iso-8859-1?Q?sSaH1ThTtYj4uPhni5x4iabMXoUTwgIdkGihQM6hBKBhWXDjmf+n4SoBGv?=
 =?iso-8859-1?Q?zz8eQjz5AdFuPejPABrjfRebzQK9SADRB40uF2fUnN9fHl0eSZ0HaUOf2C?=
 =?iso-8859-1?Q?YqvtsDixGCuUMHvtFVrQibfc6MikWEy2u9rPrFTlC6+LF8pPzIwehEDNT9?=
 =?iso-8859-1?Q?oQwUtwIZzLYg0m7+dbhsANPCJ6pdhYxPc4clAFgGRfCwMv7Xu/MxSV3fa/?=
 =?iso-8859-1?Q?jKyLYAaiTT5cav7PWjRWLkSxVkcTzWOLoF8n92YSwl8DcIOxi1Zr3SChbz?=
 =?iso-8859-1?Q?FVpvkAtYaDSNio6wLIgecl5LhxMFINEte5YElcZNSL4YnYbxoRALpExIKS?=
 =?iso-8859-1?Q?Lezb0jK+b5WZkjeq99kygNuo3c1yzjaBwmurf3WE2Y7EsDZpKi2A91gLgA?=
 =?iso-8859-1?Q?g+kGh2l9oCHrATSVKD2JBXux0Si8pxbLqZeaymSxA1s8PYWRe69GCcI53a?=
 =?iso-8859-1?Q?O21WQZADi6fZ+RsIIlgfPQ9vRaWzBGSHiCLRq3xPHxDcpY/AdBPuL4gowV?=
 =?iso-8859-1?Q?tJBXseF+lxq2z/iWybX2ecYsn3DhhDBfZtWDyUf3auU3wk/ZfuHL4m8iLn?=
 =?iso-8859-1?Q?iq4q0PIMGYSvlp4pCTxQiVdPP1LDhEJMJ3QIciVhxn5ozdjbgTOsD3zi9N?=
 =?iso-8859-1?Q?YssZc0X49xkXBjPxDN06fphrSJ1egCq0QbBu40fjJThZl6stXQ7surXw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee69b887-7e7b-49a1-a726-08de169b0e9d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 03:27:15.5798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adKDWAxbj5KC/CyupzG285sZMQqdMVK+bp5cdUAtahYmUpD2ndEEvKx2SDKkf6as8LDcgZLKem926BtB7D1EAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8809
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

On Sat, Oct 25, 2025 at 02:04:07PM +0200, Thomas Hellström wrote:
> Enable migrating to foreign drm_pagemaps.
> 

Slightly better commit message ahead of merging.

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c      | 39 +++++++++++++++-----------------
>  drivers/gpu/drm/xe/xe_svm.h      |  8 +++----
>  drivers/gpu/drm/xe/xe_vm.c       | 19 ++++++----------
>  drivers/gpu/drm/xe/xe_vm_types.h |  6 ++---
>  4 files changed, 32 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index d27cedeaf70c..36a6ac293e71 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1132,9 +1132,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	if (err)
>  		return err;
>  
> -	dpagemap = xe_vma_resolve_pagemap(vma, tile);
> -	ctx.device_private_page_owner =
> -		xe_svm_private_page_owner(vm, !dpagemap && !ctx.devmem_only);
> +	dpagemap = ctx.devmem_only ? xe_tile_local_pagemap(tile) :
> +		xe_vma_resolve_pagemap(vma, tile);
> +	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
>  	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
>  
>  	if (IS_ERR(range))
> @@ -1159,13 +1159,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	    xe_svm_range_needs_migrate_to_vram(range, vma, !!dpagemap || ctx.devmem_only)) {
>  		ktime_t migrate_start = xe_svm_stats_ktime_get();
>  
> -		/* TODO : For multi-device dpagemap will be used to find the
> -		 * remote tile and remote device. Will need to modify
> -		 * xe_svm_alloc_vram to use dpagemap for future multi-device
> -		 * support.
> -		 */
>  		xe_svm_range_migrate_count_stats_incr(gt, range);
> -		err = xe_svm_alloc_vram(tile, range, &ctx);
> +		err = xe_svm_alloc_vram(range, &ctx, dpagemap);
>  		xe_svm_range_migrate_us_stats_incr(gt, range, migrate_start);
>  		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
>  		if (err) {
> @@ -1482,7 +1477,13 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
>   */
>  struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile)
>  {
> -	s32 fd = (s32)vma->attr.preferred_loc.devmem_fd;
> +	struct drm_pagemap *dpagemap = vma->attr.preferred_loc.dpagemap;
> +	s32 fd;
> +
> +	if (dpagemap)
> +		return dpagemap;
> +
> +	fd = (s32)vma->attr.preferred_loc.devmem_fd;
>  
>  	if (fd == DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM)
>  		return NULL;
> @@ -1490,28 +1491,24 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
>  	if (fd == DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE)
>  		return IS_DGFX(tile_to_xe(tile)) ? xe_tile_local_pagemap(tile) : NULL;
>  
> -	/* TODO: Support multi-device with drm_pagemap_from_fd(fd) */
>  	return NULL;
>  }
>  
>  /**
>   * xe_svm_alloc_vram()- Allocate device memory pages for range,
>   * migrating existing data.
> - * @tile: tile to allocate vram from
>   * @range: SVM range
>   * @ctx: DRM GPU SVM context
> + * @dpagemap: The struct drm_pagemap representing the memory to allocate.
>   *
>   * Return: 0 on success, error code on failure.
>   */
> -int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
> -		      const struct drm_gpusvm_ctx *ctx)
> +int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
> +		      struct drm_pagemap *dpagemap)
>  {
> -	struct drm_pagemap *dpagemap;
> -
> -	xe_assert(tile_to_xe(tile), range->base.pages.flags.migrate_devmem);
> +	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
>  	range_debug(range, "ALLOCATE VRAM");
>  
> -	dpagemap = xe_tile_local_pagemap(tile);
>  	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
>  				       xe_svm_range_end(range),
>  				       range->base.gpusvm->mm,
> @@ -1778,9 +1775,9 @@ int xe_pagemap_cache_create(struct xe_tile *tile)
>  	return 0;
>  }
>  
> -int xe_svm_alloc_vram(struct xe_tile *tile,
> -		      struct xe_svm_range *range,
> -		      const struct drm_gpusvm_ctx *ctx)
> +int xe_svm_alloc_vram(struct xe_svm_range *range,
> +		      const struct drm_gpusvm_ctx *ctx,
> +		      struct drm_pagemap *dpagemap)
>  {
>  	return -EOPNOTSUPP;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 5adce108f7eb..c7027facf6e9 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -94,8 +94,8 @@ int xe_svm_bo_evict(struct xe_bo *bo);
>  
>  void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
>  
> -int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
> -		      const struct drm_gpusvm_ctx *ctx);
> +int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
> +		      struct drm_pagemap *dpagemap);
>  
>  struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
>  						 struct xe_vma *vma, struct drm_gpusvm_ctx *ctx);
> @@ -276,8 +276,8 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
>  }
>  
>  static inline int
> -xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
> -		  const struct drm_gpusvm_ctx *ctx)
> +xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
> +		  struct drm_pagemap *dpagemap)
>  {
>  	return -EOPNOTSUPP;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 3c3dc1b1ace9..381d4b4abac9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2355,18 +2355,13 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  			if (prefetch_region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
>  				dpagemap = xe_vma_resolve_pagemap(vma,
>  								  xe_device_get_root_tile(vm->xe));
> -				/*
> -				 * TODO: Once multigpu support is enabled will need
> -				 * something to dereference tile from dpagemap.
> -				 */
> -				if (dpagemap)
> -					tile = xe_device_get_root_tile(vm->xe);
>  			} else if (prefetch_region) {
>  				tile = &vm->xe->tiles[region_to_mem_type[prefetch_region] -
>  						      XE_PL_VRAM0];
> +				dpagemap = xe_tile_local_pagemap(tile);

Per kernel test robot, dpagemap needs to initialized to NULL. There is
existing code which tile to NULL after a for_each_tile loop that can
also be droppped.

Everything else looks right.

Matt

>  			}
>  
> -			op->prefetch_range.tile = tile;
> +			op->prefetch_range.dpagemap = dpagemap;
>  alloc_next_range:
>  			svm_range = xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
>  
> @@ -2897,7 +2892,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  {
>  	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
>  	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> -	struct xe_tile *tile = op->prefetch_range.tile;
> +	struct drm_pagemap *dpagemap = op->prefetch_range.dpagemap;
>  	int err = 0;
>  
>  	struct xe_svm_range *svm_range;
> @@ -2910,15 +2905,15 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  	ctx.read_only = xe_vma_read_only(vma);
>  	ctx.devmem_possible = devmem_possible;
>  	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
> -	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !tile);
> +	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
>  
>  	/* TODO: Threading the migration */
>  	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> -		if (!tile)
> +		if (!dpagemap)
>  			xe_svm_range_migrate_to_smem(vm, svm_range);
>  
> -		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, !!tile)) {
> -			err = xe_svm_alloc_vram(tile, svm_range, &ctx);
> +		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, !!dpagemap)) {
> +			err = xe_svm_alloc_vram(svm_range, &ctx, dpagemap);
>  			if (err) {
>  				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
>  					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 70856d536047..5313bf2afa54 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -413,10 +413,10 @@ struct xe_vma_op_prefetch_range {
>  	/** @ranges_count: number of svm ranges to map */
>  	u32 ranges_count;
>  	/**
> -	 * @tile: Pointer to the tile structure containing memory to prefetch.
> -	 *        NULL if prefetch requested region is smem
> +	 * @dpagemap: Pointer to the dpagemap structure containing memory to prefetch.
> +	 * NULL if prefetch requested region is smem
>  	 */
> -	struct xe_tile *tile;
> +	struct drm_pagemap *dpagemap;
>  };
>  
>  /** enum xe_vma_op_flags - flags for VMA operation */
> -- 
> 2.51.0
> 
