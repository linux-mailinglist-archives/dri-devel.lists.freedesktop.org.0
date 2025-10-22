Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E032FBFE772
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 01:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E1010E1B9;
	Wed, 22 Oct 2025 23:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QrTVB1ej";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1706C10E1B9;
 Wed, 22 Oct 2025 23:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761174155; x=1792710155;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w8eB3X4wSxgGsuR8SyE0JuADZpbsVhFYVFCOVB8eBR0=;
 b=QrTVB1ejRjotv1c/I0zaMnd9vH8R40QgUV4WORX3SM4AZKgxlh2JWh9s
 DLYwCSYuKeNt9lkEvP6ruum9807+CbwkNRcYa+EH5hNn7hCauCFwU1i91
 c57EYKIv9uwiOnA0RcTloIH0g0ePRtDG1tLhTj1L5NOeBaQWhUt2/FHrb
 Dqchp1iUGbZSQ3St3E/sZInPgpFi9Dczzl1Ff8QVpkuFCzGSNQQlmaEb+
 FAMKBwpMa3px2ye9wHAhcFJmJxV8dlALlJGsusXVI8MWfPxXnpcIkXVcm
 Nx7iQcsiBXaHKvFmn58jP0j24jOX5hVzMgkos2NN5hhaDu2gj0klt6MVj w==;
X-CSE-ConnectionGUID: vqDilb+AQqOTJ6Kh/N5dFA==
X-CSE-MsgGUID: svNsoGDuQkactFzYZgZfgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74773844"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="74773844"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 16:02:35 -0700
X-CSE-ConnectionGUID: ido0q+a8TsuH8J2KK/E8Lg==
X-CSE-MsgGUID: O/glKAJySY6Fy6QEy0aZAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="189122234"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 16:02:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 16:02:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 16:02:34 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 16:02:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KChETfLH9DDsvwHMREQVuodEpwX/FInyUOqPGTknHqr3BmpLchTFwZDJcHq+LngKTh2EKJ7fJj2ZCASTUwRyYBaz4+MPLWdHNkUgO7N4HsA5jWysL3JTB+NPyGz2GJHrUm1vicIYlQ2aLtpqpwZveAIhDoV628ikTi/otdprB/IjYfdx/Kxpa4xtbkrQAw+gRjzd4+bOe2mCG4+PVTsgFSpmMBtkz/Qv7JlXllocTIEBfJ8rOSkH0iTsQnkbURvIZskK92+6zU6gzi+PqsWC44k9JFOugEHO306gl4Dk277GFaM/pZqePwa81ithsLWnDuSIe55Nly9GpMd58AZ7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViANL2hLJBwqpzs2v4u9uGRmboqW4pEicFLtxJ9D9vs=;
 b=vIZJUbnIUsOxypFP8sLd5BNyWgVcNTLH69zTp5Pzx/XxBD/wiWuUqDNdC2oY+2fclNben4VyKLhKu7+L0lWMc2WuFzo8ecrDTA44esfoYdYRrO+Sh2bS3IR314cSFy9jjUCZIVHrVTMenEW7gWwSPdrZmgOGBrx/oFN/f2wrxIBhGvL36eQZXvXdKh0Hfcte+ICYJJgk9QxonAat8UBTVeVAG+ENQeGtGbzc5nMs4dFei7JrfYrb6O4ISbosydsLtte4NNSewhTY8XCEYmQqdCDXhE5HzuCYjJ/OYFc4vOQ2taohh9b4wQ44bI6eXUgT9tzGKO+dSYneR3ab/EUcsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA4PR11MB8913.namprd11.prod.outlook.com (2603:10b6:208:565::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 23:02:32 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 23:02:32 +0000
Message-ID: <9d7ccca5-f6c8-4a6b-9319-e183fac9a5af@intel.com>
Date: Thu, 23 Oct 2025 01:02:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/26] drm/xe/pf: Expose VF migration data size over
 debugfs
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-9-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251021224133.577765-9-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7a::6) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA4PR11MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: a2670813-f825-4d1e-9c12-08de11bf1509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmFvQzlDd3Z5QUVUbGhPejk3RHFEZm9iUU9FOE90VHpPUWpxTE9DWkFQdDhh?=
 =?utf-8?B?K2lSMEtuRDBmY3VGTkRVYlpEY1ZiYUE3TU5UUzVackhxT09KRlBnZGRRS2Y2?=
 =?utf-8?B?MnJYbmp6V0VEVGE2TXhyU0JkNVlJSU11Tlk0NlBVbm1kV1BWelhCUm1WWTV3?=
 =?utf-8?B?NHdaZXVVZm5HRjVlSnJxcnZaVGxzYk9ZNTRxYkhSUGIxeTN3TUFYSkYvdVdv?=
 =?utf-8?B?NnV5YzdzUnFuQ2s0Vk45YW9MNE5aSm15SkowSzkySmkrRVZvbFA2Ujk2ZDVh?=
 =?utf-8?B?MEFzcjdtaExCWHN0THV0MElOQUF0ay9hNjV3SzZRM1FaK2xzYzVaczhJb0lW?=
 =?utf-8?B?WUxpSytjdlRiRERvbEtIWk1tU08ySEhFOEdvWUlzc3greE9DenQ2Q0JvRU53?=
 =?utf-8?B?Nk11bUpSVUVIeEg3MGIva1lycUlGQ1NVdXdkcDQwNzR0QUtQVEFXN0NYOXhE?=
 =?utf-8?B?QWZrVFZzVm9LYWZvYkxEMkF2YjU3TTlnVFhnMFdIYWZ6aCs3Sk9yazVFODFo?=
 =?utf-8?B?RHFxMWFUL1Z6a2RTOVZVcis3SFIxdGh5MXFTUEtuWFY1S0R3aTBXenNxbWht?=
 =?utf-8?B?T2ZMM1A0NG9Oak5GMStGOStKT0Z3c0JEdXlnNTBFYVZjYUJEMzI0Z3dCOEUz?=
 =?utf-8?B?NENBZ0lzenJVaWhod2pNc0Z0S3dXb0pneERLTEw0c1hXV2NLcnBxc0RLQWly?=
 =?utf-8?B?R0l3OWhlWWNLaFdmS0JHSFdDVlFCdkk2dHBXK3dTdW5jSXVKZGhISm1mT1E5?=
 =?utf-8?B?UnVTSTNzdHZmd2MrZTE2b0xyOGFmQU5QSnA5ZEE2eERUTVprSnRrWmdnNDF6?=
 =?utf-8?B?TnJ3bGp6UklnUkZkWDFZMkZzdnB4MU0xcmdrUXlpSzZHNEVsWEFoM2pjUEJ4?=
 =?utf-8?B?b092NGlSMEQ2QkdSSm1PVWlvcW0xbWcvS3k1THY3bHFLQW5IZUZOMUhrWWJF?=
 =?utf-8?B?N3MxVjRGSFF5RFUyY1Z2OHN2aksvM0t6MUtrWWVVb0krWVZ2dEc1NVBxWkg4?=
 =?utf-8?B?MzJ3U0xDc0F1bWNEYUtPV1ZQQTVheXlqbzh5R1AwR1JGMDhyYnN4WHk0WWJk?=
 =?utf-8?B?VG5xendsWEh5TkFDSDAwZGphRjBtOFo5QVJjNnBVVUY1NFRscWFVNW4vVDdX?=
 =?utf-8?B?Y0RrNTdPTnhkQ0dDY2FxMjdweGt1L2QxUitHYVVGVkpDSVZuUmt3ckcyMUtj?=
 =?utf-8?B?ZFdDWGxqNkhFVnl3V2tXNmxOZUN3ZFE0VVpsNmJrM2RhTERJWWgrT0VkREVt?=
 =?utf-8?B?aWZtM00rK2E1aGYzbVVqTU96YjNrTkpOeE16VDM4YlZpbEFDeGpSQXVzSGM4?=
 =?utf-8?B?R2NrZ2VkMkhINnAvUmZjUVhpT20zL0tYVkRaaE9jRDJqZmp2QzVZc3JSblhE?=
 =?utf-8?B?ckNNRzI2YVFQQUhhN2loMTh5UUZiY1J1T2VXazBhcGNmUTM3dkYvaGV0WGlY?=
 =?utf-8?B?OURJeXU0bnBmTmxQaHBkUzdGZjRnUXhJQlFta0dPalZSNEtpOWc0bUlHczlm?=
 =?utf-8?B?QU5EZnpCM2xtaWltbFlyd2wyK3FYQ2VGdUt3a0xLL08rN3krTWxSeG8vQzky?=
 =?utf-8?B?RXhmZlZGbUlOaVZhcjRWQXNIVUpjeXhNaVozcUdWdGlURnFUUHpkZTUvZTVN?=
 =?utf-8?B?bElGSUNuaFhjVVhwRGJ4MDAzYWRzd3JOZkJ2aEZxNEY2dTBteFU3NkZvb01a?=
 =?utf-8?B?cWNudW1MWS9YYTVqdE55bzhSVjJ3RXMxNUZCNzdMZXp0Q2JCa3JnZUpsYU9R?=
 =?utf-8?B?VHpXMjAzRTZzbFFyYVAwTVNrRTdsSzYrZFhTTktTa2R5dlNFWXYzVGhGOHJa?=
 =?utf-8?B?THJkMklEVkhXM2d4czlpVjMvRWd5RWN2dk1ORExhTVVYTUo0NDlVVXVnUHNL?=
 =?utf-8?B?THRJcXBOQU05aXpHK20xemFkV3lMVlNxZW9McGhUcXB5RCtkbUNRdGtMVE5a?=
 =?utf-8?B?Y1NvRUtYcWxXdHBRMnNmVXc4YjlsR3ZSS3BEZlB1VVJNWndkYlloaG5pNkhC?=
 =?utf-8?Q?sFG9O1NFTR81xizU4QhWHU+UcQBeGg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXYraHBwOXdCQlIyVVNvdHBEaWlRM0ZQcHo1cnQ1RnVFN2ZEM3dXVnhNL2k0?=
 =?utf-8?B?ZzI4eGU0YmZEOU8wUkQxcU1YSndDVjQ3aEpiSWdFWFN1KzZnclh3cTRjZEEx?=
 =?utf-8?B?cVAzRndEUjhhWktLV0pJdCtOUk1TOXIxaVJzNmNrd25JMjRxRlExa2RVMEhh?=
 =?utf-8?B?V1NxZjdQWDlocWZjMi9ZeENwOUVmQW1WZGpybVBERzhXbUVIZ2tFU3JTL2d2?=
 =?utf-8?B?VUZPR2JuUEMyM3pYcGx2TmV3Wmh5TlhSekhSYUVBVWxUZlB3VVNHRytzQlk5?=
 =?utf-8?B?aktkbWVDTWw0ZStKN0psQVFtVDh2R050eWtYd052bXZWTVl2cjdURE9hVlcw?=
 =?utf-8?B?RUNxakdjWEpEZjc1Slpia0tKTnI0SmYxaEN3VFZkRU0vVjRvcWhCV25hRUtp?=
 =?utf-8?B?YVpUbGcrY21ObEZHQnJYeVRLTnZIWFZEK1JIK29EdkxiSUdpODFKZnVZWENh?=
 =?utf-8?B?K2lMYVN0SUhrcThJZnBITlB5WE0wN1dZSEw5dDV2QkxwZm5wSkpiZ0tIY3ll?=
 =?utf-8?B?dlcxaDB5cDV4NXJpTVdmcFpGQURaSDdvQ09wbGloRXV2enhTRE1VYWVoS2ox?=
 =?utf-8?B?NkNqM2VjV29GdXp5bXkrczRrOWhkdmlPNzNFZTRweGZ0Ump1dkl6VXNIMzNl?=
 =?utf-8?B?S2Fndjk5azJWM0owTE5mVFNoNkJ2NDVWUGlZTWxRbjFJOUE3eWdIaitaZjBn?=
 =?utf-8?B?dllRWU50aXYwOUdqWEJDZSs4K3N0d3JBQXpuNEh2K3o2MnJSQTRML29kczVT?=
 =?utf-8?B?dmg4cWwybi8yQUYxSUhkcndiMklvcVhNMmtxUEllYTU2dFNLaTZ4TDV2ZFdN?=
 =?utf-8?B?UGQwbllwSHZGL1JUVkdWcmNROTExdzJ5QjEyc3hkME9Lb2xmV1JwWWJYZ2Ry?=
 =?utf-8?B?T2RxQ3dWY09aSUYwRjJVWXJIYm90bzdONE1TZEpPcFhkOEZGM0l1bVhHK09l?=
 =?utf-8?B?a3E5Vm5ISnBwMHFJSlpScUdkbHdQQi9UTGFqNkJVWW55VzZpYXlSNXdHeEhr?=
 =?utf-8?B?dDNZRERmc1pWcjhVTjRhZXJLUXBoM2R0aVdjZ0ltb3dleGlYdlRwQW9VS1hr?=
 =?utf-8?B?MG1TeFNxVGFpT01aajlQaVBSeVllM0tQckFxMkMwQ21hN0hHVUszN25WU0dQ?=
 =?utf-8?B?amZFbFFrYXdUdHRFeG5XK2kxanpHNzRGTDJZWlhxUWtjemJPWEVHU3FXNHlx?=
 =?utf-8?B?ejZlSStkRVl4ejRpM01iTmhKVjltMXdJa1FpYU41eGJXZTAvVUdZeHc1SzV1?=
 =?utf-8?B?WVBzNkxISmRaSmM3VFNEOC8vN0J6VkpOQXBCWFZiRzZMVDJweW1zNS9xRllM?=
 =?utf-8?B?Um80RzUxdlpyZWp2bUUycTAyWjB4Q3FLbHFMM3RHbERWRE9sTTZaOEVBaHVT?=
 =?utf-8?B?R1FoQm9vaEZqWGp3MFhpZ3V3YXE2OENZRXZlK0NtdDc0cXNxVzYvbzR0UTBQ?=
 =?utf-8?B?U04zVnZweTlNQUdPMXdlMGtZL29XU09QYUpCSXUrb0w0RFZOaFZuRERJaERI?=
 =?utf-8?B?NnljVkIxeEhobDVEVkk3M3lhRWYvdVQyK25xeXBnQWRsU3VzZzNYWG5La2pp?=
 =?utf-8?B?TS9qRTNwUkxRbTNuaFJSdFVvMXlPRGhSamlSU3BJTnhZSHNrY3lhZU8zTlQ4?=
 =?utf-8?B?Z1hTaDlxaDFjd2JWOHEzYmwxdmtoK29CcVZDTHpkMG1XTEt4R3UwSE1LM0pL?=
 =?utf-8?B?Q25mRHBoaGE1K2kzd2pKQU52N290UGZOd2lPb09qUHZSY094bGo2eUlKTGg2?=
 =?utf-8?B?dlVNQ2k3a2xpZTlZN0lNNXNzRUtnRHJ4bWUrTFdzcWZaOW9ydi9JK2RGOGlW?=
 =?utf-8?B?Q2ltTVNUVjZPZ2JZNXRhMXdVOS9uYWhwdm1HLzcwQzZnUkk5OVpBU0hicWp0?=
 =?utf-8?B?SDNWeVJNQlBYQkNPZkNRMVRLdDZqTnk1eWxoOWZwOVEzQmQxVzJZS0JKL3Ro?=
 =?utf-8?B?UGdYNi90REMwQzREYmRSNmtwZU1HSC8wTjFaRi9jcXdJVEhBbmFsQnhtSlJJ?=
 =?utf-8?B?S0ZDYkVHTFFiZFYwbWNFUUVsMFl0V3crekxrcW5zZzhVcUczOHc3c2FVelVM?=
 =?utf-8?B?YjR6S0xJK2wyaDJwNEdHVUFINGdHNGtjUERFUWtYb1Z0cVk3bG9iUm9FbjAx?=
 =?utf-8?B?K3lsRWVTTmRmeGdkZXRYdFJqRHc2VE9CNTREVnAwUkMwZWZyVkFEK25yQ0Y3?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2670813-f825-4d1e-9c12-08de11bf1509
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 23:02:32.5646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRJDg6nNpTvkA/CDOjGHYMdsTLd0BjTaQt6V/bS1eHt4aZBSaENdahHaeGfAlZu7BOk8uJHBbgU+KA2yeFXXfa4B9hnfNJqEX7/PsZvZD1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8913
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



On 10/22/2025 12:41 AM, Michał Winiarski wrote:
> The size is normally used to make a decision on when to stop the device
> (mainly when it's in a pre_copy state).
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 19 ++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 29 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 30 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  1 +
>  5 files changed, 81 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index 8ba72165759b3..4e26feb9c267f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -395,6 +395,25 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>  }
>  #endif /* CONFIG_DEBUG_FS */
>  
> +/**
> + * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: total migration data size in bytes or a negative error code on failure.
> + */
> +ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
> +{
> +	ssize_t total = 0;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +
> +	/* Nothing to query yet - will be updated once per-GT migration data types are added */
> +	return total;
> +}
> +
>  /**
>   * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty.
>   * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index 1ed2248f0a17e..e2d41750f863c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -15,6 +15,8 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
>  int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
>  
> +ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
> +
>  bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
>  bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
>  void xe_gt_sriov_pf_migration_ring_free(struct xe_gt *gt, unsigned int vfid);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> index a9a28aec22421..bc2d0b0342f22 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> @@ -14,6 +14,7 @@
>  #include "xe_sriov_pf_control.h"
>  #include "xe_sriov_pf_debugfs.h"
>  #include "xe_sriov_pf_helpers.h"
> +#include "xe_sriov_pf_migration.h"
>  #include "xe_sriov_pf_provision.h"
>  #include "xe_sriov_pf_service.h"
>  #include "xe_sriov_printk.h"
> @@ -254,6 +255,33 @@ static const struct file_operations data_vf_fops = {
>  	.llseek		= default_llseek,
>  };
>  
> +static ssize_t size_read(struct file *file, char __user *ubuf, size_t count, loff_t *ppos)
> +{
> +	struct dentry *dent = file_dentry(file)->d_parent;
> +	struct xe_device *xe = extract_xe(dent);
> +	unsigned int vfid = extract_vfid(dent);
> +	char buf[21];
> +	ssize_t ret;
> +	int len;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = xe_sriov_pf_migration_size(xe, vfid);
> +	xe_pm_runtime_put(xe);

IIRC during simple "cat migration_size" we might be called twice
to avoid that we can calc size in .open instead, see config_blob

but not a blocker, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> +	if (ret < 0)
> +		return ret;
> +
> +	len = scnprintf(buf, sizeof(buf), "%zd\n", ret);
> +
> +	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
> +}
> +
> +static const struct file_operations size_vf_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= simple_open,
> +	.read		= size_read,
> +	.llseek		= default_llseek,
> +};
> +
>  static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
>  {
>  	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
> @@ -263,6 +291,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
>  	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
>  	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
>  	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
> +	debugfs_create_file("migration_size", 0400, vfdent, xe, &size_vf_fops);
>  }
>  
>  static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> index 0b4b237780102..88babec9c893e 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -242,3 +242,33 @@ int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfi
>  
>  	return xe_gt_sriov_pf_migration_restore_produce(gt, vfid, data);
>  }
> +
> +/**
> + * xe_sriov_pf_migration_size() - Total size of migration data from all components within a device
> + * @xe: the &xe_device
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * This function is for PF only.
> + *
> + * Return: total migration data size in bytes or a negative error code on failure.
> + */
> +ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid)
> +{
> +	size_t size = 0;
> +	struct xe_gt *gt;
> +	ssize_t ret;
> +	u8 gt_id;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, vfid);
> +
> +	for_each_gt(gt, xe, gt_id) {
> +		ret = xe_gt_sriov_pf_migration_size(gt, vfid);
> +		if (ret < 0)
> +			return ret;
> +
> +		size += ret;
> +	}
> +
> +	return size;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> index df81a540c246a..16cb444c36aa6 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> @@ -18,6 +18,7 @@ int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfi
>  					  struct xe_sriov_migration_data *data);
>  struct xe_sriov_migration_data *
>  xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid);
> +ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid);
>  wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid);
>  
>  #endif

