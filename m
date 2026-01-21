Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNLmDXzgcGnCaQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 15:19:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D79415850D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 15:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0233B10E7F9;
	Wed, 21 Jan 2026 14:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RmCr9pLf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4060A10E7E2;
 Wed, 21 Jan 2026 14:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769005176; x=1800541176;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OD2xSVk/SHe+wysLIV0vQ5JKqwaxjpzKkbwa+XFvds8=;
 b=RmCr9pLfJuxU4Vhirvx6Y4RmAOJ5gJXReG1+x8OYtZscFSB+qU6K3biY
 TI2kEY1pCX3ajRJgwChaTqaW5+aAS3elocrcyZTonZ6lyTj4GpubpYqPx
 RIyj/v+xjv5JL0vbLcoRXZVInWPecHV2bh2qjZNOHlAO6mTD1lj9uJihF
 SqjjPdWzkpsVtCXKajb9ZLQq9SwEoLY91mGJMqyiHWsVybbitoPoHdLqJ
 ZcUDynEmQczOU6bEXTqnuBV67aXOIrcmN0VgNlmoLYLz0vG/RPhP6R3Xo
 1dlbaM1Taycj+kW8UGhzTgr18CtIEr7dSLfBtj7to3lz/QAsz6PXQygrQ g==;
X-CSE-ConnectionGUID: esOD1+bmRueDY5OQQ143sg==
X-CSE-MsgGUID: 1w629MB4R2S+ZzSyFz0Pgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70397577"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70397577"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 06:19:36 -0800
X-CSE-ConnectionGUID: NfpwewYLQsmXL2p+97S6wQ==
X-CSE-MsgGUID: tYkB2cv9Rtq+GlU8E8PrxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206699039"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 06:19:35 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 06:19:34 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 06:19:34 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 06:19:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMt5ETKfol2wfVAJqY2ojDfvy+qObQd8T3yRtrFJZgJzogJLIkRa/rnbuaL6YcdFYT/1emFM/bnQSNYQW9UCMze88O3z1lWmfZweb72wiQW5lBP3eFh8grWUTu/kLKqvJkKPO7TfDc5gEOqlS+SVPEh/WAvTXJSjTBq0c2V5JVq7A/Injz/yhldtvtW0HkMfVmgifkbjQL7KE3OUOPlqsxRw0F3yA4pPjqiAJFtS9jCLu8kesNNUZq7dOQuXWeb7g26TzlVt6e14kSCeqQ/2ThhdWOguYV/Iy61eShRYv2B2o08I/DUSwOBX6GNEJlyBjDp6g3Vw0f6hNyY1TNBwwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4zTLthRu+mqNFhRxj4YdF4jYWvCdyEmaFLGX4OtfUU=;
 b=DAzt4DelI033QLInXdutpIKWSMpUBMnUgL4apTg/lAj/7g5gPFVs7HcffA6SuPwtvEHspy+p9keJnLdQX4EIGXZWajCQPnwxd2FKD/ao21xpgR9Ix34xQJQNNXfvRPoIxH3mULRvCaoIm3llGXUizJAhq1TvF/L9OAmC3X3hhdClv6lB0yy/5Tki6bx44AZWoScO6hJYNxXqP51E4JLP+cvxHybEtn1fY2g6w4JihP9Biw+Ft26oGXVp2fseE602Czcww02jDR9iTEn62MhGWGHr+ZHKASXDi2ZjHVOjenMsvLV+O9hzGR2RWbzYOke0e7kvrKXCaPtWViNF8MtG1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS7PR11MB5967.namprd11.prod.outlook.com (2603:10b6:8:72::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 14:19:27 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 14:19:27 +0000
Date: Wed, 21 Jan 2026 09:19:22 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dim-tools@lists.freedesktop.org>
Subject: Re: [PULL] drm-intel-next
Message-ID: <aXDgaporPS3I6T4J@intel.com>
References: <aWkNThVRSkGAfUVv@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWkNThVRSkGAfUVv@intel.com>
X-ClientProxiedBy: SJ0PR03CA0237.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::32) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS7PR11MB5967:EE_
X-MS-Office365-Filtering-Correlation-Id: 41164dc9-feae-4df5-5eb4-08de58f815c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?OVg38kj27s9WYWFzmZBtotFv8UG1fGqDXwrsjOFH2f7r5CollsIPbOO565?=
 =?iso-8859-1?Q?p3EmeSPc9xZG2x1Xm8zwDzZ09GC/VvROnH8qLGRZfb3Wrg/b2lE+cm5IIJ?=
 =?iso-8859-1?Q?x7L9IPKXRwi9XvikzazWnkXsarPQwV+MnZKCG1ZdwhbgCIDM9qceJD5kdM?=
 =?iso-8859-1?Q?6lXPxSAVGuq4b7OdYuQQYcPttYDKwaCGq6GnoWRD4jcmPR67oBco3GM80m?=
 =?iso-8859-1?Q?lqR1Xlalz1jptK0pJNG0ByLxNvwcL88OquoZA6PXiVlVv2SrVIWNWTcM93?=
 =?iso-8859-1?Q?8rmwu8cLXonVNI0bZtg2pCHLsDucTI7GTShmL16Y009E1VHC8HXJZ1lA71?=
 =?iso-8859-1?Q?JC2XtIP+Zx/JEgUGWiJQ+GnJEmhjhnqiM4fS9o9blHovK2GDNoFUFY8tF+?=
 =?iso-8859-1?Q?J6i646v2ksaqMrJQi0lZk/LZw9J0EMyD3k7FyMNXxKYE84LAEWcLwmN+et?=
 =?iso-8859-1?Q?7/KEXjJLcdniWMS2A4RiYPCcSnkj2ZDwZWH3ls2bB5S9jsDgjfni8ODFdd?=
 =?iso-8859-1?Q?9CPVarZj3l6qevzmU1oBzZgVtsl79aVXvhW1/BFvwDBx9YdxoVlpAKMmFu?=
 =?iso-8859-1?Q?7H29H3b1+43SJcUk2urA0GraiLF2QjaJOHPcsQ52tZ1KpfTFDKe3Onxf6/?=
 =?iso-8859-1?Q?tPGfzI8/cupmH0tR8jNlmNK7T1yX+TiAPMnTTGlUTk/NUqJmokIm+WPElR?=
 =?iso-8859-1?Q?fJWM4S5uQw1D2ehOXXbu3wg327H7WVCZPA0ycbTR6fAQiDm1FzHsfXkJvm?=
 =?iso-8859-1?Q?6VYmQQX1QjU1dCfS/yOzFOtWSUV+VF/mzl/gxn2RiTi5NNY0sdDfY3tgaH?=
 =?iso-8859-1?Q?C4Bc8/5Y7q13vbCrPwIO7mcvsqmXKL9Q8YvkevzVhO04kNmHdY1nxH8pj8?=
 =?iso-8859-1?Q?/EB6wN4uZA4EPrdkBYWiKYbwCwbtzqRlU2znOuC9aEEEZrnU0Lp/yr+z5Q?=
 =?iso-8859-1?Q?JDN6IGOzdhUWcoLfWeWujvFeJAxWFYlc6kzwAsiUF2gQtMzpHFkuB5lPr5?=
 =?iso-8859-1?Q?EcLxf4p2IG3VwhQ1vFHDBt/pjEFrKge1gaok0i80ae2bSzA8FnQAHLW5Jv?=
 =?iso-8859-1?Q?fzcBkt/rGHqLnv4x7UJz+9W1OdABq3sLfifiMjm5TSGMBQcheyIoGj2UhY?=
 =?iso-8859-1?Q?x24flqSc+PYrFHUsBqREIDibDqKpWEscn369qcgCey4tBqChE2gPZSaQhK?=
 =?iso-8859-1?Q?j+6yIGSONUUk43I+XZLvXBRoTUuv8RQNDAhCnR5mJwyRzBU8rNlSY8pIm/?=
 =?iso-8859-1?Q?QYDUL0gjFzicOsW9wQnxQwEQEgZKOiOn8ggQgzGvS8j3u28yZ1KHn38cPe?=
 =?iso-8859-1?Q?4AE8bn4DggucKXa6SVLNXu3lbAI9pwQcaS7FikK6apI0M5bHrBfC9YnNn5?=
 =?iso-8859-1?Q?WYPLjfVEFVhkeMYJsOX8lj47pBM36WXAStjm+fHR3xXYSZMxdkpm8CcE8B?=
 =?iso-8859-1?Q?gEHtFAsUEMsog1KvHk85IIRMhkmew5rUzQEXp0FFHrgZCG7Sie85WwDIWD?=
 =?iso-8859-1?Q?KJ2Jr+EQ6qj1G1Crj8Ulvt9s2fhfcz4QKeQ5GG8EhEFlvqKDp03tiwdvSf?=
 =?iso-8859-1?Q?eSI1Ud2s2LbsQwjVNZFjiOr5Fiay?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?E/wENeWTjFLWIwhB9igbOuncarvvYwIieMMcERiAnHN3TO1AqvXMVJWkcE?=
 =?iso-8859-1?Q?hgqHyO2CKRqkz4dGhBJCibcn99piOeLDpn4xgY4XCBwWXjNXKR0TFyJWkd?=
 =?iso-8859-1?Q?CBaPfDIk3JZCrq7BV3oGyi9SK+CqimkE5yUBhYG9zsNjq/vW+EeO793kr9?=
 =?iso-8859-1?Q?91E5UsTJLbCmkYM8BibIH60MfUnejHkb2A1aM6VB3DhNjwjy0t7xdeTIlt?=
 =?iso-8859-1?Q?awzarXMLZfpAvFDEvFxnKGnCssD3O6xlrEDmSEsx2eFrYGD8lH9RVcqZAW?=
 =?iso-8859-1?Q?l0PgPVC+zmVdo4uUdpsNltjUiOIyA1YdrGHJ8Xg8N2MSY4Wq9Yit5b6pWk?=
 =?iso-8859-1?Q?QwXV8jMC6qjigi7eNJ5ZxSP3t29ZfSt1ZleupH1Ki6xJb9OnMmAX1MeFTy?=
 =?iso-8859-1?Q?QaUZgxIfMFZ6CM4oyLElA/ajfFK8xbbW1maTrYs4TcWx6riS4I2kq68tQE?=
 =?iso-8859-1?Q?hpZyoDQi0VMc7ywJzD0s+oi2fcO0Ssxn9LQ7aJVjuXwv2r3n+1xlr0bZGY?=
 =?iso-8859-1?Q?7oZptgA80YhwmgKGCh+S3FoKhHvkj4i9f3uu1jD2Jb0+8eFq+vvUZacIcX?=
 =?iso-8859-1?Q?R65V+YUNSyBbRiP+8t6tfbLmMg/FQwyXF/KtztkqZMDOVjlwhh3ZdOyGoH?=
 =?iso-8859-1?Q?EqU8X30CtFpIJRTl10g7XoxdefMiCTgc5RpsJD5B7oQeVF4cBabgrjd4eC?=
 =?iso-8859-1?Q?IevkcjsncICjS1TzCsE1scGdnh5bLxydqV9awkiNAbxyTQwhe+pYgimH56?=
 =?iso-8859-1?Q?UNOKQY9jHc9mZEEtVa7PwICoXBzIlrlUrrEqxd3gP9KmRAQiRjuM9UeEUW?=
 =?iso-8859-1?Q?4uhMQnhe8ZpCj/ETKdkOD1n5A3HV8gnScRKrKT0u3OwFM0r+xkVBcv138d?=
 =?iso-8859-1?Q?ujajVoghHZw4gBGwqFCJmVKlJIOQPE64ieQsbopRxCX+xfX2q2ALkyCAtX?=
 =?iso-8859-1?Q?KwCrnX93+yN344+8PxhJm12yKPA43CC2wMiS1tseJYWCUHe02tt1Z/63zJ?=
 =?iso-8859-1?Q?6JauOI+XQocmI8pzlMu/xoMVyc9JLr7kLkFZs27oqxJl6xESoeVaGtNk4q?=
 =?iso-8859-1?Q?i+TdObOdzwgUmbUTEbJicV4b2SKd8k7tb8/XUvdV6qjeE6qte5v2VMp5I/?=
 =?iso-8859-1?Q?pkg7cnhXLE2LYAd+8EzyW75QPOlDNgqbNOARe2EmI09YxAZJWIPyYyaZKB?=
 =?iso-8859-1?Q?vJcxJeldtpIKVnT6P6i1psIb2VcitJb1hulM3BS0UB/TIUmt1GlxQ71uFg?=
 =?iso-8859-1?Q?7FfVsqyuSoyN2gECA0SWmN1OFK6vKupK+kAWU3IGUmz0vsC5skmIFMJYUr?=
 =?iso-8859-1?Q?sdcESYViE33GMDgJinzFIofVzS/PswNngIEEX0GJ/8t+LVmeqX+wOldPJL?=
 =?iso-8859-1?Q?S66ocDsHuBkzhvw8z7Xxq3HpkG7J1DlCLPYTblyl7oibOJl8jYZGeFFRbm?=
 =?iso-8859-1?Q?luAtdDqzh7ZHLqf7a6GUUzuTSz7QryuzLLGkMGacmOZA+4XaLkblPfX8CR?=
 =?iso-8859-1?Q?JGHvRlutZTCEZMH6BHiTDwhSDziubzGugJWoDgUbUgzIBTAe6jROwla97M?=
 =?iso-8859-1?Q?uQcIWy8cKFt3V3OGeVEhkVBEb0+4vcMXd/qR12BHjyivKqw5WjRayqApGZ?=
 =?iso-8859-1?Q?3wIsmY5A3dltjEy4hK/rDy3Mm8SfVEJGpSjcASV4XZv6IEoRjgCvLAI3AM?=
 =?iso-8859-1?Q?A7Yx9ggUiAn2aNbowp54x7t/k51cWtgzXGa5POoUo30CuI46xRfGVBpb/W?=
 =?iso-8859-1?Q?UunNy6/JS3dt/RiImzFdE2nkIz0eQgirRVeDmMxKBuejzelWMehCBuipPC?=
 =?iso-8859-1?Q?fBnONMq/2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41164dc9-feae-4df5-5eb4-08de58f815c7
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 14:19:27.6828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLzSOP9itNaWQe8Fv0d9z3LX2tX+54c1dTXXSUDX6+RxrCQmsSF7vCk8+Ca9OiXSMOFQuj3ewIRRZt/aAqvs+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5967
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,gitlab.freedesktop.org:url,intel.com:mid,intel.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rodrigo.vivi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: D79415850D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Jan 15, 2026 at 10:52:46AM -0500, Rodrigo Vivi wrote:
> Hi Dave and Sima,
> 
> Here goes our likely last drm-intel-next PR towards 7.0.
> 
> Thanks,
> Rodrigo.
> 
> drm-intel-next-2026-01-15:

Dave, Sima, anything wrong with this one?

I noticed this was not picked up yet.

the drm-intel-next-2026-01-15-1 is indeed messed up, but this one
here should be okay.

Please let me know if anything is missing.

Sorry and thanks,
Rodrigo.

> Beyond Display:
>  - Make 'guc_hw_reg_state' static as it isn't exported (Ben)
>  - Fix doc build on mei related interface header (Jani)
> 
> Display related:
>  - Fix ggtt fb alignment on Xe display (Tvrtko)
>  - More display clean-up towards deduplication and full separation (Jani)
>  - Use the consolidated HDMI tables (Suraj)
>  - Account for DSC slice overhead (Ankit)
>  - Prepare GVT for display modularization (Ankit, Jani)
>  - Enable/Disable DC balance along with VRR DSB (Mitul, Ville)
>  - Protection against unsupported modes in LT PHY (Suraj)
>  - Display W/a addition and fixes (Gustavo)
>  - Fix many SPDX identifier comments (Ankit)
>  - Incorporate Xe3_LPD changes for CD2X divider (Gustavo)
>  - Clean up link BW/DSC slice config computation (Imre)
> The following changes since commit 35ec71285c9311395b14bedc60fa94f6b7e24d2d:
> 
>   drm/i915/pc8: Add parent interface for PC8 forcewake tricks (2025-12-19 21:28:48 +0200)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-2026-01-15
> 
> for you to fetch changes up to d30f75d2dba913754dbacb982b19b783a30253ea:
> 
>   drm/i915/dp: Simplify computing the DSC compressed BPP for DP-MST (2026-01-13 18:42:21 +0200)
> 
> ----------------------------------------------------------------
> Beyond Display:
>  - Make 'guc_hw_reg_state' static as it isn't exported (Ben)
>  - Fix doc build on mei related interface header (Jani)
> 
> Display related:
>  - Fix ggtt fb alignment on Xe display (Tvrtko)
>  - More display clean-up towards deduplication and full separation (Jani)
>  - Use the consolidated HDMI tables (Suraj)
>  - Account for DSC slice overhead (Ankit)
>  - Prepare GVT for display modularization (Ankit, Jani)
>  - Enable/Disable DC balance along with VRR DSB (Mitul, Ville)
>  - Protection against unsupported modes in LT PHY (Suraj)
>  - Display W/a addition and fixes (Gustavo)
>  - Fix many SPDX identifier comments (Ankit)
>  - Incorporate Xe3_LPD changes for CD2X divider (Gustavo)
>  - Clean up link BW/DSC slice config computation (Imre)
> 
> ----------------------------------------------------------------
> Ankit Nautiyal (16):
>       drm/i915/vdsc: Account for DSC slice overhead in intel_vdsc_min_cdclk()
>       drm/i915/display: Abstract pipe/trans/cursor offset calculation
>       drm/i915/display: Add APIs to be used by gvt to get the register offsets
>       drm/i915/gvt: Add header to use display offset functions in macros
>       drm/i915/gvt: Change for_each_pipe to use pipe_valid API
>       drm/i915/gvt: Use the appropriate header for the DPLL macro
>       drm/i915/gvt/display_helper: Get rid of #ifdef/#undefs
>       drm/i915/intel_alpm: Fix the SPDX identifier comment
>       drm/i915/intel_cx0_phy: Fix the SPDX identifier comment
>       drm/i915/intel_cx0_phy_regs: Fix the SPDX identifier comment
>       drm/i915/intel_display_params: Fix the SPDX identifier comment
>       drm/i915/intel_dsb: Fix the SPDX identifier comment
>       drm/i915/intel_dsb_buffer: Fix the SPDX identifier comment
>       drm/i915/intel_gvt_api: Fix the SPDX identifier comment
>       drm/i915/intel_lt_phy: Fix the SPDX identifier comment
>       drm/i915/lt_phy_regs: Fix the SPDX identifier comment
> 
> Ben Dooks (1):
>       drm/i915/guc: make 'guc_hw_reg_state' static as it isn't exported
> 
> Gustavo Sousa (3):
>       drm/i915/display_wa: Keep enum intel_display_wa sorted
>       drm/i915/cdclk: Implement Wa_13012396614
>       drm/i915/cdclk: Incorporate Xe3_LPD changes for CD2X divider
> 
> Imre Deak (19):
>       drm/i915/dp: Drop unused timeslots param from dsc_compute_link_config()
>       drm/i915/dp: Factor out align_max_sink_dsc_input_bpp()
>       drm/i915/dp: Factor out align_max_vesa_compressed_bpp_x16()
>       drm/i915/dp: Align min/max DSC input BPPs to sink caps
>       drm/i915/dp: Align min/max compressed BPPs when calculating BPP limits
>       drm/i915/dp: Drop intel_dp parameter from intel_dp_compute_config_link_bpp_limits()
>       drm/i915/dp: Pass intel_output_format to intel_dp_dsc_sink_{min_max}_compressed_bpp()
>       drm/i915/dp: Pass mode clock to dsc_throughput_quirk_max_bpp_x16()
>       drm/i915/dp: Factor out compute_min_compressed_bpp_x16()
>       drm/i915/dp: Factor out compute_max_compressed_bpp_x16()
>       drm/i915/dp: Add intel_dp_mode_valid_with_dsc()
>       drm/i915/dp: Unify detect and compute time DSC mode BW validation
>       drm/i915/dp: Use helpers to align min/max compressed BPPs
>       drm/i915/dp: Simplify computing DSC BPPs for eDP
>       drm/i915/dp: Simplify computing DSC BPPs for DP-SST
>       drm/i915/dp: Simplify computing forced DSC BPP for DP-SST
>       drm/i915/dp: Unify computing compressed BPP for DP-SST and eDP
>       drm/i915/dp: Simplify eDP vs. DP compressed BPP computation
>       drm/i915/dp: Simplify computing the DSC compressed BPP for DP-MST
> 
> Jani Nikula (30):
>       drm/i915: move display/intel_plane_initial.c to i915_initial_plane.c
>       drm/xe/display: rename xe_plane_initial.c to xe_initial_plane.c
>       drm/i915: rename intel_plane_initial.h to intel_initial_plane.h
>       drm/{i915, xe}: move initial plane calls to parent interface
>       drm/{i915, xe}: deduplicate intel_initial_plane_config() between i915 and xe
>       drm/{i915, xe}: deduplicate plane_config_fini() between i915 and xe
>       drm/{i915, xe}: start deduplicating intel_find_initial_plane_obj() between i915 and xe
>       drm/i915: return plane_state from intel_reuse_initial_plane_obj()
>       drm/xe: return plane_state from intel_reuse_initial_plane_obj()
>       drm/i915: further deduplicate intel_find_initial_plane_obj()
>       drm/{i915, xe}: deduplicate intel_alloc_initial_plane_obj() FB modifier checks
>       drm/{i915,xe}: deduplicate initial plane setup
>       drm/{i915, xe}: pass struct drm_plane_state instead of struct drm_crtc to ->setup
>       drm/{i915, xe}: pass struct drm_device instead of drm_device to ->alloc_obj
>       drm/i915: drop dependency on struct intel_display from i915 initial plane
>       drm/xe/display: drop i915_utils.h
>       drm/i915: remove unused dev_priv local variable
>       drm/xe/compat: remove unused forcewake get/put macros
>       drm/xe/compat: convert uncore macro to static inlines
>       drm/i915/display: use to_intel_uncore() to avoid i915_drv.h
>       drm/i915: drop i915 param from i915_fence{, _context}_timeout()
>       drm/xe: remove compat i915_drv.h and -Ddrm_i915_private=xe_device hack
>       drm/i915/utils: drop unnecessary ifdefs
>       drm/i915/display: remove accidentally added empty file
>       drm/i915/gvt: sort and group include directives
>       drm/i915/gvt: include sched_policy.h only where needed
>       drm/i915/gvt: reduce include of gt/intel_engine_regs.h
>       drm/i915/gvt: reduce include of vfio.h
>       drm/i915/gvt: include intel_display_limits.h where needed
>       mei: late_bind: fix struct intel_lb_component_ops kernel-doc
> 
> Mitul Golani (12):
>       drm/i915/display: Add source param for dc balance
>       drm/i915/vrr: Add VRR DC balance registers
>       drm/i915/vrr: Add DC Balance params to crtc_state
>       drm/i915/vrr: Add state dump for DC Balance params
>       drm/i915/vrr: Add compute config for DC Balance params
>       drm/i915/vrr: Add function to check if DC Balance Possible
>       drm/i915/vrr: Add function to reset DC balance accumulated params
>       drm/i915/display: Add DC Balance flip count operations
>       drm/i915/vrr: Write DC balance params to hw registers
>       drm/i915/display: Wait for VRR PUSH status update
>       drm/i915/display: Add function to configure event for dc balance
>       drm/i915/vrr: Enable DC Balance
> 
> Suraj Kandpal (4):
>       drm/i915/cx0: Use the consolidated HDMI tables
>       drm/i915/ltphy: Remove state verification for LT PHY fields
>       drm/i915/ltphy: Compare only certain fields in state verify function
>       drm/i915/ltphy: Provide protection against unsupported modes
> 
> Tvrtko Ursulin (1):
>       drm/xe: Fix ggtt fb alignment
> 
> Ville Syrjälä (6):
>       drm/i915/dmc: Add pipe dmc registers and bits for DC Balance
>       drm/i915/vrr: Add functions to read out vmin/vmax stuff
>       drm/i915/vblank: Extract vrr_vblank_start()
>       drm/i915/vrr: Implement vblank evasion with DC balancing
>       drm/i915/dsb: Add pipedmc dc balance enable/disable
>       drm/i915/vrr: Pause DC Balancing for DSB commits
> 
>  drivers/gpu/drm/i915/Makefile                      |   6 +-
>  drivers/gpu/drm/i915/display/i9xx_wm.c             |  17 +-
>  drivers/gpu/drm/i915/display/intel_alpm.h          |   4 +-
>  drivers/gpu/drm/i915/display/intel_bw.c            |  19 +-
>  drivers/gpu/drm/i915/display/intel_cdclk.c         |  60 ++-
>  drivers/gpu/drm/i915/display/intel_connector.c     |   2 -
>  .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   8 +
>  drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  13 +-
>  drivers/gpu/drm/i915/display/intel_cx0_phy.h       |   2 +-
>  drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |   4 +-
>  drivers/gpu/drm/i915/display/intel_display.c       |  46 +-
>  .../gpu/drm/i915/display/intel_display_device.h    |  18 +
>  .../gpu/drm/i915/display/intel_display_driver.c    |   4 +-
>  .../gpu/drm/i915/display/intel_display_params.h    |   2 +-
>  drivers/gpu/drm/i915/display/intel_display_power.c |   3 +-
>  .../gpu/drm/i915/display/intel_display_reg_defs.h  |  15 +-
>  drivers/gpu/drm/i915/display/intel_display_types.h |  11 +
>  drivers/gpu/drm/i915/display/intel_display_utils.h |   4 -
>  drivers/gpu/drm/i915/display/intel_display_wa.c    |  14 +-
>  drivers/gpu/drm/i915/display/intel_display_wa.h    |  12 +-
>  drivers/gpu/drm/i915/display/intel_dmc.c           |  25 +
>  drivers/gpu/drm/i915/display/intel_dmc.h           |   5 +
>  drivers/gpu/drm/i915/display/intel_dmc_regs.h      |  60 +++
>  drivers/gpu/drm/i915/display/intel_dp.c            | 515 ++++++++++-----------
>  drivers/gpu/drm/i915/display/intel_dp.h            |  17 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c        |  77 +--
>  drivers/gpu/drm/i915/display/intel_dram.c          |  42 +-
>  drivers/gpu/drm/i915/display/intel_dsb.c           |  31 +-
>  drivers/gpu/drm/i915/display/intel_dsb.h           |   4 +-
>  drivers/gpu/drm/i915/display/intel_dsb_buffer.h    |   4 +-
>  drivers/gpu/drm/i915/display/intel_gvt_api.c       |  43 ++
>  drivers/gpu/drm/i915/display/intel_gvt_api.h       |  21 +
>  drivers/gpu/drm/i915/display/intel_initial_plane.c | 193 ++++++++
>  ...intel_plane_initial.h => intel_initial_plane.h} |   6 +-
>  drivers/gpu/drm/i915/display/intel_lt_phy.c        |  54 +--
>  drivers/gpu/drm/i915/display/intel_lt_phy.h        |   4 +-
>  drivers/gpu/drm/i915/display/intel_lt_phy_regs.h   |   4 +-
>  drivers/gpu/drm/i915/display/intel_plane_initial.c | 442 ------------------
>  drivers/gpu/drm/i915/display/intel_rom.c           |   8 +-
>  drivers/gpu/drm/i915/display/intel_vblank.c        |  46 +-
>  drivers/gpu/drm/i915/display/intel_vdsc.c          |  35 +-
>  drivers/gpu/drm/i915/display/intel_vrr.c           | 281 ++++++++++-
>  drivers/gpu/drm/i915/display/intel_vrr.h           |  10 +
>  drivers/gpu/drm/i915/display/intel_vrr_regs.h      |  68 +++
>  drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |   2 +-
>  drivers/gpu/drm/i915/gvt/aperture_gm.c             |   5 +-
>  drivers/gpu/drm/i915/gvt/cfg_space.c               |   2 +-
>  drivers/gpu/drm/i915/gvt/cmd_parser.c              |  26 +-
>  drivers/gpu/drm/i915/gvt/debugfs.c                 |   4 +-
>  drivers/gpu/drm/i915/gvt/display.c                 |  23 +-
>  drivers/gpu/drm/i915/gvt/display.h                 |   2 +-
>  drivers/gpu/drm/i915/gvt/display_helpers.h         |  37 ++
>  drivers/gpu/drm/i915/gvt/dmabuf.c                  |   6 +-
>  drivers/gpu/drm/i915/gvt/dmabuf.h                  |   7 +-
>  drivers/gpu/drm/i915/gvt/edid.c                    |   1 +
>  drivers/gpu/drm/i915/gvt/execlist.c                |   2 +-
>  drivers/gpu/drm/i915/gvt/fb_decoder.c              |  14 +-
>  drivers/gpu/drm/i915/gvt/fb_decoder.h              |   2 -
>  drivers/gpu/drm/i915/gvt/firmware.c                |   4 +-
>  drivers/gpu/drm/i915/gvt/gtt.c                     |   9 +-
>  drivers/gpu/drm/i915/gvt/gvt.h                     |  26 +-
>  drivers/gpu/drm/i915/gvt/handlers.c                |  21 +-
>  drivers/gpu/drm/i915/gvt/interrupt.c               |   5 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c                   |  24 +-
>  drivers/gpu/drm/i915/gvt/mmio.c                    |  13 +-
>  drivers/gpu/drm/i915/gvt/mmio_context.h            |   5 -
>  drivers/gpu/drm/i915/gvt/opregion.c                |   3 +-
>  drivers/gpu/drm/i915/gvt/page_track.c              |   3 +-
>  drivers/gpu/drm/i915/gvt/sched_policy.c            |   3 +-
>  drivers/gpu/drm/i915/gvt/scheduler.c               |   8 +-
>  drivers/gpu/drm/i915/gvt/trace.h                   |   2 +-
>  drivers/gpu/drm/i915/gvt/trace_points.c            |   2 +
>  drivers/gpu/drm/i915/gvt/vgpu.c                    |   6 +-
>  drivers/gpu/drm/i915/i915_config.c                 |   3 +-
>  drivers/gpu/drm/i915/i915_config.h                 |  10 +-
>  drivers/gpu/drm/i915/i915_driver.c                 |   2 +
>  drivers/gpu/drm/i915/i915_gpu_error.c              |   2 +-
>  drivers/gpu/drm/i915/i915_initial_plane.c          | 290 ++++++++++++
>  drivers/gpu/drm/i915/i915_initial_plane.h          |   9 +
>  drivers/gpu/drm/i915/i915_request.c                |   3 +-
>  drivers/gpu/drm/i915/i915_utils.h                  |   4 -
>  drivers/gpu/drm/i915/intel_gvt.c                   |  13 +-
>  drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |   4 +-
>  drivers/gpu/drm/xe/Makefile                        |   6 +-
>  .../gpu/drm/xe/compat-i915-headers/i915_config.h   |   5 +-
>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |  22 -
>  .../gpu/drm/xe/compat-i915-headers/i915_utils.h    |   7 -
>  .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |  11 +-
>  drivers/gpu/drm/xe/display/xe_display.c            |   2 +
>  drivers/gpu/drm/xe/display/xe_fb_pin.c             |   2 +-
>  drivers/gpu/drm/xe/display/xe_initial_plane.c      | 189 ++++++++
>  drivers/gpu/drm/xe/display/xe_initial_plane.h      |   9 +
>  drivers/gpu/drm/xe/display/xe_plane_initial.c      | 321 -------------
>  include/drm/intel/display_parent_interface.h       |  17 +
>  include/drm/intel/intel_lb_mei_interface.h         |   3 +-
>  95 files changed, 2017 insertions(+), 1443 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.h
>  create mode 100644 drivers/gpu/drm/i915/display/intel_initial_plane.c
>  rename drivers/gpu/drm/i915/display/{intel_plane_initial.h => intel_initial_plane.h} (60%)
>  delete mode 100644 drivers/gpu/drm/i915/display/intel_plane_initial.c
>  create mode 100644 drivers/gpu/drm/i915/gvt/display_helpers.h
>  create mode 100644 drivers/gpu/drm/i915/i915_initial_plane.c
>  create mode 100644 drivers/gpu/drm/i915/i915_initial_plane.h
>  delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>  delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h
>  create mode 100644 drivers/gpu/drm/xe/display/xe_initial_plane.c
>  create mode 100644 drivers/gpu/drm/xe/display/xe_initial_plane.h
>  delete mode 100644 drivers/gpu/drm/xe/display/xe_plane_initial.c
