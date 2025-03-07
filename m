Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6F7A5658C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 11:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B4D10EB38;
	Fri,  7 Mar 2025 10:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tg2fx96N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E725F10EB37;
 Fri,  7 Mar 2025 10:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741343823; x=1772879823;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lnNgYKUhije+4uHs+m5VjSkcz4N8gDaXB7mg9GhSES8=;
 b=Tg2fx96Nk6TEMhy8QBZtCGsqtpsnkkKhcbCOS7sahRrlysBhSxRxC3Zh
 lj48dKzsTXRasWzyqZR48kDC5q4FxQx8tgPTqYx5s3LHSJ3Pp66Gqa362
 UIJ1KjQZkfkyNCB4hL/XKvi4YjC1+U/NRjJF8oRaGuGxmAqi9hoPXguDD
 ywL27dp2NY92VarNGaUfawshS2Wt+F70a/f4cvF1K8eVBPIMkQUK74rGw
 eJ241/lf+VZg3Y8B24VNq2nlub7tcIMzBZ7FTqsS0DBbEeBagLtEz2n4F
 vzEWIpNUIeCzqgv/Hnh+v0/9jXNtDNFnEDJ0LLx+tyHwQzlcpF0La0UF2 g==;
X-CSE-ConnectionGUID: 4ACeOdjLTtOLy6xFmvHCxQ==
X-CSE-MsgGUID: z1gTnPjqTI+aa32S7jOTRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46315031"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="46315031"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 02:37:02 -0800
X-CSE-ConnectionGUID: pRtdrFb8QPWtdYRIhJRomA==
X-CSE-MsgGUID: ccqxjz7ZReWPwXaYToAdGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="156501164"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 02:37:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 02:37:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 02:37:01 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 02:37:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQAyqfDlcN0Kx7J3Jne8eH32RwZehJgJJw4bQlFVX6iEslEc/jKteZQw6mVARWv5v6JdnkjodNAr5T46Qp9fRXz+/MjxdTqvmHRlPYNJmz2Y4Ly/AZuH2WzY0AGO292tz1b46w+1CG56C8ZBSbCZux3TPsNQs1ugcwQeHbcr9dDWR9mtONZmg82qutxgqh5SWWpj0wVPrp21K3jsVBCF0NCsdZqAAwJ3LiUIqY8B2KYmYFE03MfCFD5X71aFKkf3C3j+I5ipbRsx8O4MYhBz9d2HSQyjP/72jBg7OCVsgm/7XFV/duOk+/v7RC/HPik6S48dIN3ibsxwLdqzdjEayQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9BrXbZozw18NeJcn8jgl7BTSPEaHCYgxC5AczZaI/Y=;
 b=kAk5ubMB87Cb+izDy7vyzNodCmg5hFrfZ8ZQKWQhpp6v7jWXiDLTH3kmMqfoP7pNfB27LXo2S3P0n1ZiEPTjGToBO3LiHSdVj2zQ1kMHTnUBwSPyGywZ9cta8sqnom5Tim63InhdiWim6P0G/DpLCnfehugMnwW4LfX/wVPQ6vXUpWfmmKXhAmXpyCoYox2rvAPzug3PCWyKfM+OjM17vFvLeuc44UDcsBjKuDq+Pe+okQOKwCgJH13fxGWpZ8dIx5bglFDwpj933AEw5A4zY1oU7bjPTd7S5fzeQe0GCfZfRxuzUXK7s0xKflEuEqVMu/G8sUMNE3qJeyvkLMJvVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 DM4PR11MB6285.namprd11.prod.outlook.com (2603:10b6:8:a8::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.20; Fri, 7 Mar 2025 10:36:19 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%2]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 10:36:19 +0000
Message-ID: <fcc8167b-5416-48bb-a8ad-b6896d3d8b8c@intel.com>
Date: Fri, 7 Mar 2025 12:34:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] drm/xe/xe_gt_pagefault: Disallow writes to
 read-only VMAs
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <matthew.brost@intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20250304170854.67195-1-jonathan.cavitt@intel.com>
 <20250304170854.67195-2-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20250304170854.67195-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0090.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::31) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|DM4PR11MB6285:EE_
X-MS-Office365-Filtering-Correlation-Id: 02f490b9-dba8-49bc-6f1c-08dd5d63e53e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0c1Skd5Vng0WlRYd0gxMmNrOUJJZmE4TFpHSlR2SUZJUHpCK0p0M0FmNUVU?=
 =?utf-8?B?TzNSeWxscGlrN0tKaWZaYzBDTmFqQ3duNGF2M3ArWFU0VnVQOFJmenRpUzlS?=
 =?utf-8?B?TWtTZnZkNkl4YmxZdFZvVCtIMUxpV20rTE1sdkM2S01ta2h4THgxZ0Mxbkkv?=
 =?utf-8?B?VDBjTm9TNHNLdkNrRjBzYzhSb0pCQ051cEMyNi9SZVhCSENGYzk3V2JQeGM0?=
 =?utf-8?B?ZWJ0aXUrWWV6RDcwSEV6Nm9mUWxINDVYeW1BbmN0eG80b2p5WWI5QWZkODFS?=
 =?utf-8?B?U3JCTzB1ejhTZ1psNDBxRUliTnU4RnhOYi8rWmRiSkFmTmZSd0F0dzFscEsr?=
 =?utf-8?B?TmNEcm55anMwODVhRGU0ekNEYTI3WEZzTHVoVW1sTzJmM2h1aExKYXpnRFEr?=
 =?utf-8?B?eDRLckxBdGt2Umh1cHpWZ3FwOVN2eWY5Sk4vUUE3bFBBN0syRjIyM0xaeDcw?=
 =?utf-8?B?WjJoYnhTbnJuZ2JEODh4eExUQ000R3dvcVhva2F3WkVKK1dpazhhNlhsazFP?=
 =?utf-8?B?aCtZbHhrSjkvcTBtNkwvdkhFclRQSWJqWlRxS2ZZa0l1QVpXUXpNSVJUSDRM?=
 =?utf-8?B?eWt1V3NLL1FYZUtNR2ZLS05jQjhubFpxVW52am0rVmprYTlCSjdDVU5OelI2?=
 =?utf-8?B?N1NEa0VrSzNFT2szQkY4aVVCN1FFM2s3VVROMzlzZ1hINWNoc1MyUVFqUU1H?=
 =?utf-8?B?bGlnbVlMd0hsWkFlbzk0N1g4MENuYm9HTHhFVlNiYzZtY2VyMFJjVDg0aEZ1?=
 =?utf-8?B?ZVRHcUxhenhLcWlLeXI2OHI5Z1U1d1I3bHlGQUttb0FPUGdGQStvcE1sdExD?=
 =?utf-8?B?WVJLUno0RXBkV0NBRDN5enhlb0hZdW5oaXpFSzlRVVJ2SmlBL1ZaYlM4UHRI?=
 =?utf-8?B?WDhhYUhCMVpoUVQwSTFmTjNLMGJlaHVxS1REeDQ0V1RFTEJ5cFhSUSt3S0Qr?=
 =?utf-8?B?MEpXNFZ0OWR4WnQ1UWVtOFZmV3FCNjI4TlpDNllkUDc4WVB3WnR0eCtuVTdh?=
 =?utf-8?B?eklyTXg5WS8rTkp4ejdqNGxMNGNjU3hqR2dhTDZHRFo3Uyt6Vm9POExNenl1?=
 =?utf-8?B?dUZad3Erc0IycDBsdWhrTW9BaGtId1VYYU5tdk5lV2hodGdEVW9OLzZUeElG?=
 =?utf-8?B?UnZFUkZFVWFZQ2hOS2dsTUo4VGRPVXZEV3FyRnVaOStVYWg1SlAwWHpkUXQw?=
 =?utf-8?B?UXpBWU9iZHNoRk5NMFo1ZlVYNHZ2ZHlrR0Z3aTJ5OGtIcTJuakJZWU5YWlps?=
 =?utf-8?B?Yys3TG1RbUtqY2t2bUt6Z282QmVlUmpiUnBvb3RWZVYrb1VXMERETUR0aXcv?=
 =?utf-8?B?eFg3djNuNlQwRDNJZEtnUm1DK09PQTdFek1DVk81OGZxWnhQVTVLRE5HRjhM?=
 =?utf-8?B?WGd4NllxWWxzSGRaME51K1h3VEVmSC9SZGZucXZqNmxaSUh1cXU5WXF3dlo0?=
 =?utf-8?B?TGsrMFBPQk9TZlB0VkVIcFd3WXM2WTFBajBYWEVnL3JDdzNDakRDVnRiSkhG?=
 =?utf-8?B?TDRudmFGa1ZLaml6QUZqT3NLTDdCaTRFZXFZWXhFakRSSWZuSmlSRlpTc1BL?=
 =?utf-8?B?U1laZDQwOUo1cGttQjN5dlNBZjlnV0xobzVpN01XaW1yMEkxbWYyOG9MMTRL?=
 =?utf-8?B?TUFTVUtNQXlRT2FCM2czeW1Sd1hmUXh0dXhWWVpwcmZVdWRodkxORlZ6ODk4?=
 =?utf-8?B?cW9zN3U0Tk1jMDArYndXSmZubzd0LzJBdUY4cXQ4UG0wekhGRmpYa0FCMzY4?=
 =?utf-8?B?andnSkpPQ0RneVFwQTQ3ekI5YkRFZzlPZzNHN0FSR0pra0Z4aDluNWhtaWRY?=
 =?utf-8?B?NDd0SWxSdXUrL1BLRTNhR0g1OVFzRlF5SFFKY0R4S04zTXBOOEVvY2JHamw2?=
 =?utf-8?Q?w8mf1ordGn8n8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnc2dnRYK2habHZLak1qVEo1RzV3RXZDeW53UndpRkVRU2pCWDFyYW93MDBI?=
 =?utf-8?B?dXNpbDliNkhRVUIrUzhyUDZRT0h1THJ3UEtoS25qaFl2bUpLdGFXRjh1Y1NT?=
 =?utf-8?B?KzhHaytBZFRrb0NTV0wzWllsUnRTQmcrcmt2TkhjWTJTRVZsRm5vZUpJVGJB?=
 =?utf-8?B?dStzblV5ZzZjYTNIZGpldVoxZVZyc1hweWE3MVBCcEI3NHRpcFZkYXhjeVhq?=
 =?utf-8?B?MldqR0JPTWU3TSsvL25HNG9vTFdGWDgvOVNEZEJWK1JRK1JId241cndmdEVY?=
 =?utf-8?B?a1owTlZGczhpN01qOEpuY3NvRWd4aTg4VUFpU2FjUFpSVElaN2FsOVhpci8x?=
 =?utf-8?B?cXlNMzJyM1JyVzlHWnd0Yk1NY3hwU2kzRUdKbW92MjVYY3hWakJaNlNDdGNM?=
 =?utf-8?B?RWVCY21xQzF5a2tWZ0ZNQkhnb0ZzQjF1MncyS2o4QmppZVQxbWFlU1JNZmgv?=
 =?utf-8?B?c2k5eTJhR25peWRFODY0VjN4dGVOZU5zRWt6cG1UZVVOQ0xzdmZUT2xnS0Nj?=
 =?utf-8?B?R2FjNVpFSWtrVWJPb296eVkwRGdtdjl0cW1NZ0JBbkdaNWVmbnhTajY0YS9K?=
 =?utf-8?B?YlJqR3kweGtPSmVsSnlzMGtQZzNLSEpxMENzZE1DdmQ0SjVLYmZ4TjYvbFA0?=
 =?utf-8?B?cXpZV25yMjdndUU4NlNKUXZ0Z1MwUmpwQ2F2L2FtMytxY05DWGtQM0IxZ3ps?=
 =?utf-8?B?bzFuWFF3bjRyNEYzcTUvNWd0cE5hRmtSc3BTTGhwV2RLaEJYV3NkbExmcDJK?=
 =?utf-8?B?bm1oYWVmZSt5Sm5uTW5YNWY2LzJ2SEVhemxMRHd5d2lLNThWOGJ5bjRoTm1n?=
 =?utf-8?B?SVQyREgydDdEZ09DWDZQeDJWRjZQTWk4YWM1elhlZEw3ZjAwWFgyMXlKNDBi?=
 =?utf-8?B?V1NBR3Y2T01pbTBmcXcxRlRISzZ0UmhXckhJbmtnQXBUMFBoWTlEc2NqQ1Bo?=
 =?utf-8?B?ck5qTnhPUXhNdTFsdkpsemh5K3lpSHlYSjFiMExIY1hkRGpSSmRnTytXS2t4?=
 =?utf-8?B?MnovZlFjNFRONmdVWHpKdGRpUWdTWjRoTkFXcjV1ZkwvRmdnVlNNSW9mYm8r?=
 =?utf-8?B?VEJZQmdCMFpxY1V6c0h6NUFFcno1bnpoU05oTHpCdDkvRmdGZ20xaDdaWXJz?=
 =?utf-8?B?bEZPYm1jQ0ZxeUZoVE5VRTJtZTRxcUw2b2ZpTmtyeitkdHYwcWI2amVicVZs?=
 =?utf-8?B?cEprVDRuNUpMRDUwdVRxV0YrTU1OS3FkRkRYQWR5RUJYcHVXeU5PY0tCUllF?=
 =?utf-8?B?SFQwbFZ3RHpPWS9KNFpkS1hXckdXL2Z5WkFzUVlYMFZQb0xSbFNDWDlHM243?=
 =?utf-8?B?bnNKU2VxY0pwYkg1SmpGTWQ4OXJFR0hRS2xCK0VUVk5zeE0vbTJzQW14NnhO?=
 =?utf-8?B?dmIxdzN5M3kvZDV3MGFXSjlzVUVjR0liTmpSeFJ6enIrUHd5MUxsZjBFeWVm?=
 =?utf-8?B?TE5DbzZJNHlEalEwMW5idEV2NnBJWjQrakZha3ZML1hlUlowV0JQbE0zVGZ3?=
 =?utf-8?B?UlpsNUt3b3BFNHZ2ZGtVeE1kaVUwRldtQUE4WFp5TTBUaWpVT1l4WnczcDJK?=
 =?utf-8?B?dTduellKNzZSSXl3UEtYYUtRTVNkekpSTzlvSkROb1pISzRWeUdmTkhJOWFI?=
 =?utf-8?B?N0o3a3pqZllibSttMklWaDNzbjlLZ2x4eVVIT3VIR3R1NVZMK1l2N2Q5UFhG?=
 =?utf-8?B?aG40aFdBYzZUalppdVVGRWQ1VG5ibzdvbDMva2NUK0YxaWtpMStBTVByYkk1?=
 =?utf-8?B?Ukp2ZG1QY1hVeEVMbG5YWXJ0WVRaWlNKckpjMGcxYzNTKzlGRDZIbGc1QU1W?=
 =?utf-8?B?eDdqbE5lU2hmZk1VQk42MkVGNnZtbDBWV05pVGdIL1VQYXJnejl2b1c3THRF?=
 =?utf-8?B?ZEY4NDU2bDRONndOMVJ1RUNoaVozSllnQ2VKeTBZTVZTSWpUTFB1Uy9TQXB4?=
 =?utf-8?B?K3dvVU4yM2F1eEFlZDZiekxmdlFaWEFteEpwU2tXZmdwUnBvWmNsWHltMG9s?=
 =?utf-8?B?YTNvZmx2VGVHK1dBc3ZranFZZ2FmczFVc3A1K3lBWDFiRmdzcWgrNkk5TWFX?=
 =?utf-8?B?d0dlOXo3V3RkU3p3MFpmcExlRy96d2xoSXVUYkNSNG5WSkNtREs0Mk9BUFlB?=
 =?utf-8?B?cjdOdldPdkp2eVNUK01VTnltQ2xZMkt6bUh5Q3lyR0UrVktrU2xPZnpoZ0g3?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f490b9-dba8-49bc-6f1c-08dd5d63e53e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 10:36:18.9382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqYaI/G4E9NX52KKolwp7HB1uSLTT0001FS42oco68SoptHzlAeqqohFNE3wlP6WJ+/wSbEfpSIXLHnsG54GlwMrzCbhH+Om6t3py5ww9gI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6285
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



On 3/4/25 7:08 PM, Jonathan Cavitt wrote:
> The page fault handler should reject write/atomic access to read only
> VMAs.  Add code to handle this in handle_pagefault after the VMA lookup.
> 
> Fixes: 3d420e9fa848 ("drm/xe: Rework GPU page fault handling")
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 17d69039b866..f608a765fa7c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -235,6 +235,11 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>   		goto unlock_vm;
>   	}
>   
> +	if (xe_vma_read_only(vma) && pf->access_type != ACCESS_TYPE_READ) {
one question, if the PTE Present bit is disabled and the page fault is 
caused by atomic load/store eu instruction, will the GuC deliver 
pagefault request to KMD with ACCESS_TYPE_READ/ACCESS_TYPE_WRITE Fault 
type instead of ACCESS_TYPE_ATOMIC?

G.G.
> +		err = -EPERM;
> +		goto unlock_vm;
> +	}
> +
>   	err = handle_vma_pagefault(gt, pf, vma);
>   
>   unlock_vm:

