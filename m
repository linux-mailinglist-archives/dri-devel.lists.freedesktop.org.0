Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4581FBA95DB
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 15:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5499710E420;
	Mon, 29 Sep 2025 13:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8L4xZrN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B88410E420;
 Mon, 29 Sep 2025 13:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759153066; x=1790689066;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TsJTvXoIUvJvsuAC4C7ZMc4OqDcmqHtEv2ljx+OHFIM=;
 b=m8L4xZrNXEGAjinRw+l+LmmfP9vK14sXI6SdMa1TMIrHxu1Y50mk/kxE
 r9Q+QWhTcvTjQUIpqtj2w92ojSm2fA9VS4OfPtbL9nM5qLnjmCoPfT5gT
 v1mzgd7xwor3UjGXYAcaDQSeuaYOMOMnmucWsLEXdEqKvlX8+JeJ6ICpj
 qJilJGj75/K1BuumtsX2Qrm5gbTlt/hO+qLn1JE6xbrKdkTWuefx9lYPb
 3Mt0G6EJWlRqbP1s6DkAjVMwW+/Z8gWGgQOyJ9q8pQAdmWKhH+RNa9MT/
 1cZy+STCX9XP6eCzfC/pD9xquROjYVwDOLb6CkCkHagyyTwt9CgZrjZ1+ A==;
X-CSE-ConnectionGUID: yWE6wz2CSSaJXClHvt1+eg==
X-CSE-MsgGUID: 3gcCnJgjS3iAkMhuowW9eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="65245028"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="65245028"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 06:37:45 -0700
X-CSE-ConnectionGUID: SLwXrDgmQGGsjo7+Px8eUg==
X-CSE-MsgGUID: 1hwnnea3SjOg9Ui00iljEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="215388720"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 06:37:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 06:37:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 06:37:44 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 06:37:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyqczDwX/FNdDg2xXIoLdcYvw5T04ONOG3b0DLELvcQNn0lG7wAhxyxh5cA5YJ7xV6ndvuftNPLSDQ6sEfLQxOcdkE+R18HFQ4Mzp1+CCD5ppzcBMePTmwRZoNm1mlO+d6w72HBe3Oa5vTxMAhiwmBCGRdD/58/QZhKAFN9Sc+me4Izj8L7AyTcYWkIT0uDGXAyCSA1XRPcdImDcNApAQGXhoto61sFACUBdbjOzJs7l2E6C3JWzFWJPuL7oCDACHVdCTWOTcZkjpcebu51LOeMaWcH70eFatrPllja+xmAnEL5imqHuybnDAUZ5g1UeQIeQTW76uQj2jm55SBRNQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrMt8B78kojDzxs/H6dj+hq8comEcdbVtAUV2ixTc6o=;
 b=EvHFUp74cmZ+AWriPZtL3eWKav41xdAWPT9WJyxd4n72sZSNH/0ZQh71AoEvi8PFvbAxWGO+q7e2FBTPRtWXuqkhMMN6l883o3oRV2qy8bHoZWmiBgWidiFKec8TsaH3U92+vrzZPIY/OOVim/6seWu1ABKx7bYWomjfMrPVUs+mY6jKnPog3h0jjFdV9GjJfbwf21pZsJxwvLQ1v0C0wYLkRKC19wUtSaw13wWeYWchXbY962+f6qhJ0E75ePiRSItNvyZ7HpZIiZkFnEn+c1+WhvPf8Gex1EE5KAd/ec2pRKGUb4oCzLQoDwl7MPwl4cEExMIumVTWXDuLt46FMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB8120.namprd11.prod.outlook.com (2603:10b6:806:2f3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Mon, 29 Sep
 2025 13:37:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 13:37:42 +0000
Date: Mon, 29 Sep 2025 08:37:38 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <linux-pci@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, "Icenowy
 Zheng" <uwu@icenowy.me>, Vivian Wang <wangruikang@iscas.ac.cn>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>, Simon Richter
 <Simon.Richter@hogyros.de>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/xe: Move rebar to be done earlier
Message-ID: <5osrqzgrh47n6rpjulvsixwbhbh5vwxrrn6p6hpodnwisjfung@lmivgjb66oed>
References: <20250918-xe-pci-rebar-2-v1-0-6c094702a074@intel.com>
 <20250918-xe-pci-rebar-2-v1-2-6c094702a074@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250918-xe-pci-rebar-2-v1-2-6c094702a074@intel.com>
X-ClientProxiedBy: SJ0PR13CA0047.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: e11e9dbd-7313-4ff9-8718-08ddff5d5d5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o0aQLd8g24zoUYvAVbA6L+jtXhTEGzFqZzh9mLVzaCF7v9/e4nspGKgeVsa4?=
 =?us-ascii?Q?GWggnR5DTq3eZL+0xBzjdnRFd2ggO6QfvuFEQOAOrRNjVQ+7FpZPgxWa4eP9?=
 =?us-ascii?Q?68gJDwtfS21aGJAxQdEy8aWJQdKWXB3MAp+C1TDhxbEnDwBX76L4AlhTlBZr?=
 =?us-ascii?Q?JF+RslvVjIV0Lz/Sc7zqUt3b157H5VHsiemGzAKccbb1BaND+f2Ot6q7Q0LW?=
 =?us-ascii?Q?pME6YkuKZmxsAzNdP50aUHrSUNgXTpyLuUnQUiNVF1Ru7gfugFibypyPHkzL?=
 =?us-ascii?Q?Hk72rc7DHXOzVTmi52+80GZa75+HEvfqGyo6jS8ig1mItHdhwHa9ozRaDtgI?=
 =?us-ascii?Q?c5cf5mo0vWVPCkHY2QT5b+efV2prrUWLTt/Sbu9ouNm0mv3T3xFLm8o41gll?=
 =?us-ascii?Q?Nv/ZCj0qoFWI2WzaLBtNow/ijfZeA5XpVsMGwv78WGa6h6VLXDGaZdEWrw3N?=
 =?us-ascii?Q?s/IlpXijXmQvXtPvpvYLpZo/h6hs9XOfeJYapMu1/etTu7AYaYEI21m4Ta2i?=
 =?us-ascii?Q?EZBWvrbzX2TIBbP/KJG2ovEfJOv+NdRTZkpvwAMgs50EQDRl+e91cLyu3INh?=
 =?us-ascii?Q?SBf5YD9OrW/EIOInLH2FhTDYopZ16qKW7gXPOBHmO13weKHnCyC6lpPLDuSE?=
 =?us-ascii?Q?RyKFMpb+PP7mvDJusPhOQPQ1eMDqSTmLytdx5Kq0Bi77zBP84Ad92TnygMdw?=
 =?us-ascii?Q?o0uFuBfuiJbC7Til5JtqYn2Mmm/BS8fSqsOjmTvW6C3lG2a1m+AFIAxAbG3J?=
 =?us-ascii?Q?B3zZq/GPemkVXy/T+4e13TnuGhcz9hNeooFGBWH+8JzOvk5HyTeGIq4Rs1Mt?=
 =?us-ascii?Q?vW0XdZT/C1iVHmimMXWlZ32EVm/0I9FcJZUsN/RIrF5OtFD0QlqjyxV7gosu?=
 =?us-ascii?Q?0pAG1NCfav19ll/4/ThonwhJSRLLROy+LAAEIzktqF5N9ojnkIgWbkpCSGPu?=
 =?us-ascii?Q?Pvznr1m48/AE/Ui0k7nKJz9k60xTyauKPlv8vPw6E0H1p+ONMdbrP9yVS5l9?=
 =?us-ascii?Q?DEhuv60qRS7DgdoMs7w2EUNdGBhO19VMZOV/3iuDv/8MoVwzUWPAL9Q/Gc31?=
 =?us-ascii?Q?V/NqxUJdrcgVSOAhIhNwncDWiMITghZ9MOjlntIGwJBaU9hKeBsx3nc6erPJ?=
 =?us-ascii?Q?KpU9kqYzf6nn57T5rCwB9O/gttrlaP0HCMhaDlSexXQGiB9O3tu80ThknSd1?=
 =?us-ascii?Q?3pbjW7rZmCuqQ0xqxbcr/SMfN7FO1bUz3ip3i7EViGkwu3c8QZ9dwbhjniMH?=
 =?us-ascii?Q?jXKjbi544fhDFCO3ewQSnW/LI/xQhnuO8/lhuCHE8L8eSkrLWbs+2+jxjfYw?=
 =?us-ascii?Q?+O8oqV/kpBaMb/bRgSgyuxyQHr7RcblULuT/FU0Xababu+ZNB/0CfhROkQec?=
 =?us-ascii?Q?4KFPkBfZq6x04N0DzZa3mOEutxaqjyNjSPk3o3aD7cW7wLyFryCIOGwgYh7X?=
 =?us-ascii?Q?WYrmwXLNUGUFafu+/wmAlKm9DnRfKifK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qr59/icnYGvQ3UKW+ySKchMrrn5sGYJ+zlCc+OMWeE60zu2hOd1LuaQIofWH?=
 =?us-ascii?Q?WYB3QiW1ORIicupWshBup+DpH5VAvPc6+537954ocWOvmjqQMa4AAlBatX2W?=
 =?us-ascii?Q?ZZVQ+/izOesVEF3q6OPVzaKjW5rh8krbeTJErujLIiBDlvLkay1IOVQkkr+N?=
 =?us-ascii?Q?xF5DX/aRua+/zmZ3mxhTP1QdtRpdBJKWFBWHLZPVAZbiJ/iipiKdWuGkCJ4u?=
 =?us-ascii?Q?xro2EJTc4XfzO/vBVa06u4rGShvw+JTeRgiEKnlNDKL+u4uiNf/IpfkrCQA3?=
 =?us-ascii?Q?SBrTJRCaqG4gwL4yp6vITVTdLVuI8mCjK0GuKkf5FjPphkiVPLpq5Y56ldR8?=
 =?us-ascii?Q?v9fm9f6d834/FItBe1YURPmi/LnItLWn/PRBI7trgn5E1DjZ1D4BPQpYRdeR?=
 =?us-ascii?Q?Gy6utD78wNHQRRFwISSPixbacptGqDyNZxsR1U/BwZJPm6/QArX6vSuJiqoG?=
 =?us-ascii?Q?H7R71gnpubEdVYA+pANJNcnS1yIjp2Me5fx8kPmTrOQB6TQzsnXBWX3m0Ib/?=
 =?us-ascii?Q?r5E31WarvgkVS1qrSuwj2VNUv32x4RrIJhGsDfaEmjt31EmzRWQa7Qbva8Wo?=
 =?us-ascii?Q?vTdXlbW8eQL9K8sASEmIZbVa12K3rG2DVb8LWHzo40FcQ3VPU5F2k4GaD/Cg?=
 =?us-ascii?Q?kPdT9C3eZuvVy3dieburQ1NTgov/uxb5+7TKQpzrJiwvmNHpo0nyHkpGaAhG?=
 =?us-ascii?Q?QpMgUrVi+q+pHAAhKYcC76OZRPK1+68gm4vtkuOawGqVDlu1YvM6VrtpyNDt?=
 =?us-ascii?Q?0gjBohnBuOb41Nb00kvZGxtSpEU2jauGzBial2+VCiY3bXsBIb1w7PsFrNzr?=
 =?us-ascii?Q?YRzUw4hHKwEeFd2UybMuAJMgIwHqHCmvOpJ+DKMG4M5pWcyHLQ2gR/s94L42?=
 =?us-ascii?Q?fJa/aNZUKo+0+/eeI39ynOHnRAUTAnU4WV0v9wE4DbF0vvdKnWBH9PWRUbSN?=
 =?us-ascii?Q?Fa2IyxtoouyRRqEyRw6IYotQTDxFUyLEO+5mTJa9gCpTextT3qpi5xDh14Te?=
 =?us-ascii?Q?RjQZ102lYDeJ+o1JlBKGadPrJAc/f4WJf5D/qOOJn2n+IKbpUA+XqY3yB83y?=
 =?us-ascii?Q?Wd2hGNmsVtQk3RAkLjh8BZMytCFoh0gUYbuNSpMgObYNy826mMc8bWFr9DLn?=
 =?us-ascii?Q?BmeL427zSv70VH9VCnbWfKGdgDmfCVpnv//JzE+6T4547dmAd00R26jy125D?=
 =?us-ascii?Q?v6Wks0y9hyj0CU3fiIP1jw+5Pf//TP0lp7fdNiFDPNZH9ii3ijD7hkzyLOJs?=
 =?us-ascii?Q?n8NeKsBoK8LPkSrbLfVbrhpxwfeXMCUifD4p68VoudP01hsiPWXTAknmj/oM?=
 =?us-ascii?Q?AyzsZXooJXILyC6NhS8jjZmdX7LKEgQxOZnfrsjKlgaLTr56prlJRrnb1YV7?=
 =?us-ascii?Q?dFuMd3aJFS102upHgmSUUuJ21ctcTuU2WJ0sTJoR1Z1DcOjsbcNRGYnCAN9a?=
 =?us-ascii?Q?2TLk43deHB7AW53O5X85tweOQtp22AFxu7+U2pJ4vrv5VtS6hTtrhLQCeLvZ?=
 =?us-ascii?Q?8ZTnSkd7fkAe3sdFzfgEtOWpH9bqHSdz0KqKQURjCwmXBUt6YSNMUUk6Gfnx?=
 =?us-ascii?Q?TwKx3BAKBAheoNVvY7lRMnZO7dHgDAGPKnTtothhf02cuBKCaMDUOIyR7NLV?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e11e9dbd-7313-4ff9-8718-08ddff5d5d5c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 13:37:42.2382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PYDcTE9jnCqCG/1aXZXzl8eXidTUc3GJrur5Hu+vblM9vnnjov1rcqvLY5oNTnw4e9ryu84Su6J4Vn0tqK+isqmK/PsDqNo40KDDpqAHzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8120
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

Hi,

On Thu, Sep 18, 2025 at 01:58:57PM -0700, Lucas De Marchi wrote:
>There may be cases in which the BAR0 also needs to move to accommodate
>the bigger BAR2. However if it's not released, the BAR2 resize fails.
>During the vram probe it can't be released as it's already in use by
>xe_mmio for early register access.
>
>Add a new function in xe_vram and let xe_pci call it directly before
>even early device probe. This allows the BAR2 to resize in cases BAR0
>also needs to move:
>
>	[] xe 0000:03:00.0: vgaarb: deactivate vga console
>	[] xe 0000:03:00.0: [drm] Attempting to resize bar from 8192MiB -> 16384MiB
>	[] xe 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]: releasing
>	[] xe 0000:03:00.0: BAR 2 [mem 0x4000000000-0x41ffffffff 64bit pref]: releasing
>	[] pcieport 0000:02:01.0: bridge window [mem 0x4000000000-0x41ffffffff 64bit pref]: releasing
>	[] pcieport 0000:01:00.0: bridge window [mem 0x4000000000-0x41ffffffff 64bit pref]: releasing
>	[] pcieport 0000:01:00.0: bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]: assigned
>	[] pcieport 0000:02:01.0: bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]: assigned
>	[] xe 0000:03:00.0: BAR 2 [mem 0x4000000000-0x43ffffffff 64bit pref]: assigned
>	[] xe 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]: assigned
>	[] pcieport 0000:00:01.0: PCI bridge to [bus 01-04]
>	[] pcieport 0000:00:01.0:   bridge window [mem 0x83000000-0x840fffff]
>	[] pcieport 0000:00:01.0:   bridge window [mem 0x4000000000-0x44007fffff 64bit pref]
>	[] pcieport 0000:01:00.0: PCI bridge to [bus 02-04]
>	[] pcieport 0000:01:00.0:   bridge window [mem 0x83000000-0x840fffff]
>	[] pcieport 0000:01:00.0:   bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]
>	[] pcieport 0000:02:01.0: PCI bridge to [bus 03]
>	[] pcieport 0000:02:01.0:   bridge window [mem 0x83000000-0x83ffffff]
>	[] pcieport 0000:02:01.0:   bridge window [mem 0x4000000000-0x43ffffffff 64bit pref]
>	[] xe 0000:03:00.0: [drm] BAR2 resized to 16384M
>	[] xe 0000:03:00.0: [drm:xe_pci_probe [xe]] BATTLEMAGE  e221:0000 dgfx:1 gfx:Xe2_HPG (20.02) ...
>
>As shown above, it happens even before we try to read any register for
>platform identification.
>
>All the rebar logic is more pci-specific than xe-specific and can be
>done very early in the probe sequence. In future it would be good to
>move it out of xe_vram.c, but this refactor is left for later.

Ilpo, can you take a look on this patch? It fixed the issue that I had
with BMG. It needs the first patch for the full fix, but the fixes are
more or less orthogonal.

thanks
Lucas De Marchi
