Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49FAAFD151
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 18:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C84D10E1B3;
	Tue,  8 Jul 2025 16:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a4MF873n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A3B10E028;
 Tue,  8 Jul 2025 16:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751992472; x=1783528472;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NbguqEaPIKV2pXEE977m1XY2/b+fc1jGzp+Y1w4H27w=;
 b=a4MF873nOnITz9YsEsKZ50Vc3yzwzf6BMF3mHp0jy0tYcylZ2O2ebT7Y
 GmYG+/H6zF7k7KVVyA3XAA+NQYQ4vYBHNGZ7ywvEc9AsRFdes9i0lbH2A
 YmOla0rCQl3M/lrBkRhNtT++MAnxQwC9AQFa9stnwHPxafp+XeWgUNNEW
 /oXGsZHPAeIe4hzGEO9+ugaEuQ7AoDUDD5xMYs28r2MCmdqCKCOTgiXa+
 V77r0IIQY2BtfS4WK9I3NQ05BpxdyZ+Yjg7TXVlwf7KYPhrMfgF57tZ36
 EonAaeBjFx98FMYvG0uT4zMMA3XGuaVZouQCSuqiW18XhdTGgQ+LNlTHW Q==;
X-CSE-ConnectionGUID: 9ODbHM5MSZiIltykDBL8oQ==
X-CSE-MsgGUID: +sco5g4YS62Dh9dJjTcMfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53451491"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="53451491"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 09:34:31 -0700
X-CSE-ConnectionGUID: ulY9p5UNSSCPlpZ6ebxZgw==
X-CSE-MsgGUID: KmRK/HwPTpS3s2WHvchjzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="155659462"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 09:34:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 09:34:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 09:34:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 09:34:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjpnusnJiyU7+V+wB9OqlYq5rCarm6tZe4AthaAgRSkg7v0XpOd7+rusgQdGjyVGXnoNu3Ksrpj9FUMxPrlDwhy815MnLFaLq10yJamI9Nzqz+IRiDcUSJUhHZKYwA+7gkMOu2S/xjU4Aw/nlGetXmGZ2X1HzP9n3Oi3bJUscm+FEdxRFiFXJ8VNnPV6C5YyIYRvcGiWXGVcTvCHLbH2wSfwivusuTS8991YTTd1tzkV1aBW6QTAJtIg4x5CSKmgTzmtRROy1iMkiNmmmBO9nqd/UNZcP0DyOupX/HsHXpSkBPWT2KdhNFRNWFJY7R7isHL8z+jwmQTAe+MZxIxOsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbguqEaPIKV2pXEE977m1XY2/b+fc1jGzp+Y1w4H27w=;
 b=TgH0RQ0koTnHSx/CkOmQhfjvzcd8GFeM/uRuYa1XvuTe+1ufjTqIYdB6oV54yuH5XixWos+POjdVtqmVNZalFjKSUFVMuTERlFDwyedeHOh45snWZ4qsWiXJH4cMKlykt21nHdfe2nNy+mtK+QOPwFq0yQzT1MZ6Yc4YRe7nJyoJXnq/rhuKZ9/47czekB6HS2xAJMNGiD6XqKw8YlFun8IYi0CUuJuK+W4WHErmKTF8B7IhKXsSHrDEQIHMn6QRs60gDqDzTIYGKiY6a4NWapAVpg6pnH0X4DMHqmbFX40vDMWe8r1ghcDdBG5QmKHQiFvgxb/PlZY1ctxGjK8QVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ5PPF8225D2149.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 16:33:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Tue, 8 Jul 2025
 16:33:57 +0000
Date: Tue, 8 Jul 2025 11:33:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Juston Li <justonli@chromium.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Yiwei Zhang <zzyiwei@google.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v5 1/2] gpu/trace: make TRACE_GPU_MEM configurable
Message-ID: <ltofswvoumvtno5a4ycduh6s7hosx5sxph452gthrmwax36tsx@ihzw5tkvags7>
References: <20250707203849.545312-1-justonli@chromium.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250707203849.545312-1-justonli@chromium.org>
X-ClientProxiedBy: SJ0PR13CA0055.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ5PPF8225D2149:EE_
X-MS-Office365-Filtering-Correlation-Id: 69f4a8b9-aefe-4a40-e908-08ddbe3d3c40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i38w3HrEe0FPx72jhpAPqXqqRWekn4VpAXkydv/PWtEkOky++bZQP7KJIC48?=
 =?us-ascii?Q?AMvjeS+Xne6IQYVexB4XZVt2JWw90JXTyd7bo913x0rc3IxvRLDL5Y4/Aecb?=
 =?us-ascii?Q?/5wPME0iCW48ZBu7Zsz+DNUFLsJuqFZVTMYQXd8aSdjTeCOxF4zUWZqy6/fa?=
 =?us-ascii?Q?xiv3BFfQ86PuVa4YXDTIeyBSMxWSgmwNKt6pb8UT2mgyMTltM+rmGTeE7iyK?=
 =?us-ascii?Q?uLdh5Qwwrsj60/YHajBodfpf8ngu3m7Gj6obUcWad3UQuhC6lITDmBV0bgcq?=
 =?us-ascii?Q?pwLc8UVaJTVaXA3GOTCmfSYy6hzX4HPTXqFNXMvzpYs1Wt7i89tPXvJO3MpT?=
 =?us-ascii?Q?+aTG/luFN4wfVuzIyfPZn9vRYtpzo9ImK+XK5HkmPgscbWkmZd19i0ZZ8gsO?=
 =?us-ascii?Q?PQn0vWwP1lK+FMD1Ihcr8kjOUVMPhQpAqMhjryXTk/mDis0aXmaaxpzKs/cN?=
 =?us-ascii?Q?wWIQhu2Q6vTQUVOKOW7Du9xzkH5shREemQtuaNKOUbPK0C7Ad/TEi9/eZEes?=
 =?us-ascii?Q?JxW1474/dQIF/7yloDPpnT0nqeglWt0rpLtJ/jdP/sutFM5nk3KI2UQCM2/4?=
 =?us-ascii?Q?E1UbVN8tndwUDi0YsZ+jaQ3z+6ejG3tgf9vvEZsrjbHVghxSBf19cxnxrrVM?=
 =?us-ascii?Q?JYZUtxDYH1PepSQE2E2Bcq/+EjOlfE8e6CwPw6bOSZvka/h1kcP2O9Y+wxYA?=
 =?us-ascii?Q?OPg4PSHpM8jGXXgbNKs28DZUdp1ju7t2ht7ahw0sH1yJPhU55T1ZEX4yt3VI?=
 =?us-ascii?Q?DiAcK0WWpb6A+Ckz516faxVijEdEwk4NfwYyjYdb/AoBhfj8PcViidozf4nu?=
 =?us-ascii?Q?GoewC9tPRb6m9Xop/F9n0TU6lSRBrxbin0r+Csku2a4urCqxSEeBbkYoi5Lj?=
 =?us-ascii?Q?XhvSrfvb42wZFroP1qfA90wAMAxvzEQwBIg0MvJQwhgGmcYSKHZFvvREnJS6?=
 =?us-ascii?Q?37fR7ZRld73qGY0HOr6HytKcT1zoR5w+gGv2HeRaK3PvcCr7YbXWQytSmBdf?=
 =?us-ascii?Q?G/8Mr7v55BrPKJgIx8Gr87MVXZtOO0arUQTtcIRntd1oQKLpV9Ml4k+dt4fX?=
 =?us-ascii?Q?HKqF71UsjCcMWILcTfyEDvon5IeoWjIp9cJrywSQgQ6J5Zd2q4qAmakeOBbJ?=
 =?us-ascii?Q?eTwvc4kfT+IOChVzlVIo7B5AsAFgA4qd8gJ4G4c8P/zlW7NuiqmPw0MLzG1N?=
 =?us-ascii?Q?Ulew0wJYKF3p0SOnEVZROgVZO9HyqBXhMNfsgh49/yYRz90VGH7eNpRe93gq?=
 =?us-ascii?Q?tIsINtSFdWAEQdkuPIKB2uiRmzKhHsPp24e3pVjGgcUBmV2qEaPr6/YguD4z?=
 =?us-ascii?Q?TG+FP8wYBPeFseB4F6rErG5mNlxl96eyIjL2mFhS4yx4ebvq3KKubJidUa56?=
 =?us-ascii?Q?pAFaRcebaogg7MOeEf3QoFfLcKVd14PW9tLuDzgdoy0pV5sxPQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ITZK5Q8483s9RYRtdd2Pascmp8mb5Ira5fei4NcZp2387BwyIRelP/6ntt5j?=
 =?us-ascii?Q?IBLmENvAvZQPMiihqJcaDB/NvYiaSuGP+OlAHMCfVSeNuug7JejwgWo4XS2g?=
 =?us-ascii?Q?JAet4SMSLsI2hDMCI1oqbHCvymoKwvqtL9YLB4WNAlBKz7hWj2Vp8G1hjqqr?=
 =?us-ascii?Q?8VdEYuAc872tzcXkjJCXofKNAdyc37wlEpZlCs8lOde69cwPNZ6dImcD7QUH?=
 =?us-ascii?Q?kLOhj1RA/N/FOcxsvGcu83fm56OetrLxATtK5SUeeyR29+YtH3II1IUgROEl?=
 =?us-ascii?Q?491RpHAtd6v0pHlenlZrRM2PPCji4hobeaXX0bUOCPwZnqdxx2ZMsmm0EY74?=
 =?us-ascii?Q?DJm/D8WnzZywDjjJAtXynROHx0nyAAR2ywFtFVtN9jY8AeCBckcy1ugVzvvt?=
 =?us-ascii?Q?wz5hDJynsQ4kfLoZwAG9ugy5YPf3WgI2kU2Nn+elicYkqxB8X1n2lYN+v3jj?=
 =?us-ascii?Q?yctZWIpUUhTzZdf/ow9wPCUrI/9INLxp6c5CwR0/XvW44RnhDD762mOypawv?=
 =?us-ascii?Q?gxvH8PcBdbzQv70hmBmPpWP/hmCVVKGTWX9L+CW62/RGmBKX88/gmSWS7NzE?=
 =?us-ascii?Q?MuNunMKzFvXVyWOWQ/hDfnQy1Acpm54641wZh0DlwX7+ygpFz+/gc7fSX3rP?=
 =?us-ascii?Q?wF5LHwgQKGJR7udS+0KRT5VEUYnV0v+CcadfqWOkmpXgiQ3MI1O/4qFj2NyJ?=
 =?us-ascii?Q?7eKrE9SQIpwT6qvybXVjpIWizdYE74sredHHclORW6KDKv38xNl51+XWcB16?=
 =?us-ascii?Q?nQdb+J/unlBaSRDsV1tfFF3WCgVMmSU1d+gm1MHP7nCrUfO5vhWfHENXBkmq?=
 =?us-ascii?Q?Fzq4XlrMeEXvScyLuRDxKoiEk81hqomprNPpte7kMDjseuhiZKV4NHMa7cLn?=
 =?us-ascii?Q?H5HlO9HU/NyQ24GxhBQPlYeph09b5Usq6cy8JJsc73u1g9WAmjhg/OT0vBAj?=
 =?us-ascii?Q?XEdRGGrONMBOcwYifbX53lYYfqZEPjp8uAMGcdnOOqvVKy6AhWOzKrCIZmd4?=
 =?us-ascii?Q?OjIx2WEIuvVTuLH5U5ior6AdzKvX4ECBd7PQAVh2wmKmNEwwyF/8NO2FRmKm?=
 =?us-ascii?Q?qOozODUET3itu7G6TZ03r1qPlHJBNNwpKu9c0a2x7DTxgl3QrON+56U9dLU8?=
 =?us-ascii?Q?ocNXIH2o5fb+UDWJxG/60VF54FaHKucuNVtOKjOlDqvo+U5lJSqZApHjywjS?=
 =?us-ascii?Q?3P+gpZKfVL1fxefCdNDs9IdBfrDrDQkpAGwb9WpVXyWKlzzj0j1lc+TbTQOh?=
 =?us-ascii?Q?tGqJmv3OuGJ203Kl2YnhLTzrQpa99WCPiWBHweyD531o28V/xmUh/KXixddu?=
 =?us-ascii?Q?gtmB/vtWD1XkvjbAvCmNs60sWgHIyNCA/l9FIbukMvdqlQ5OyPXORR0DSMGq?=
 =?us-ascii?Q?o05eMrKBQRI73i3rzJ70rasSfYO3swWzXLOHNdwkR3m5okaLiug/FDGGphGb?=
 =?us-ascii?Q?94ZXN/KiJgRrW156ZeqqV7Nfbe7D6Ru/CytD/G3AJsgD+mCl/JPlo3bPCumA?=
 =?us-ascii?Q?iSwhQPgjILYWdFmhHsF0s7xWgIggJAjCk3csA1/jy5VvT7MZsM9vnF7Ul2PK?=
 =?us-ascii?Q?24GcACOKwZVk62HCpueCboq40kOuxWXJUEwxxxL9cHv+vR0KDKS0mKyzl9AQ?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f4a8b9-aefe-4a40-e908-08ddbe3d3c40
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 16:33:57.1036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLszC/sOTpCgjiHmG4x9TFipNVDIws7HJYlORrf6nQn+HbqbSp+2bIOlNJ/2U1QVFOnpeoQRIUANGLT4JsEEEUOuLA2yLlxtq+qIeWgyWl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8225D2149
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

On Mon, Jul 07, 2025 at 01:38:22PM -0700, Juston Li wrote:
>Move the source to a better place in Device Drivers -> Graphics support
>now that its configurable.
>
>v4:
> - Move source location (Tvrtko)
>
>v3:
> - Patch introduced to replace per-driver config (Lucas)
>
>Signed-off-by: Juston Li <justonli@chromium.org>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

This first patch is now applied to drm-misc-next.

Thanks
Lucas De Marchi
