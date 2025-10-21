Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DC3BF42CF
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 02:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2AD10E54C;
	Tue, 21 Oct 2025 00:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJblV1FX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4CD610E54C;
 Tue, 21 Oct 2025 00:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761007647; x=1792543647;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BZiAiW5iShqif29Rc6pVnYhmltn+27Ej8fvwtx/gd1U=;
 b=jJblV1FXcTPLPfFWW36hHMbmgvj5diOdPKeYuN3d6Gk0mC4EjIeTsCWO
 pqutRrm+7VYWnHaJ3melDWmUhO999rPGuP4HuBb7uQpr/rmotR4oigi4U
 b99XyfYe/Sv1j39U2X5EhPVNKAJ04wT0WBlUsZDT5Z2R1qEj+CQJnmSlv
 HSSN7/yBEDNlmAdaR9AjVivSsNBT98ZHCLlchUOZSNMI0gXrpXAnSQ/WJ
 4XUsaB2FdW0Z+QSgm4sbJwXAKqnA6PbnJpj2OJMo5rAFwMwxOHojy+6UN
 YT4BX4/Y5Lf6hoGwWn+NMbOyMNzhvFy2AUmUbHMTvQnTq34ckf8pisrzS Q==;
X-CSE-ConnectionGUID: 1/g/57hwQzK6oOaJIpJ7eQ==
X-CSE-MsgGUID: Ql7Sm1qcT4yFTyZmvZmvzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74249606"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="74249606"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:47:26 -0700
X-CSE-ConnectionGUID: mclzcoDnRuCbE+WH407vwg==
X-CSE-MsgGUID: FKupqXNhT3mtI29Ytd5TAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183016865"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:47:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:47:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 17:47:25 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:47:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJpD/NmXnN7dO3cUvl/21h4a5/4DGMgWKPUoiHpMdEp2gxxEdc4TJEiHqcwJglntoFyDPH/6scTH4rTaja/wJBLSfic56hSsVBaBiK4D5iDHfE9CXsovCN8h9Fd2vnAaPI7Muzol17nOPaeTe7ZpEpXggHMekbBfJnP+3mMmlgkeqgtWwm/zCWdceWotAqHthn+XSOSnXJAs6pl+8gYUtc9F70LPqAWT2SoyKfBjE+fFoD946pmArT1zcVI+ma5eiFlBbntqVMxSN2zyJeZNiUkkYVN9iChbbls9doflGhCUvpIkrAdmsdDQLaIVkACt8/2eQfSDB2WzVpcGLv9ajA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqwdUpzcElRkoGyZXjpv0ojn9Lmg8zXni+ymIUIvToY=;
 b=I4RSF43TJs+MjqhQIqC6q+INhDxRjrGH/Ta66Hwxv3D8OJiXCcVqz5ll/ousL2yr4l3xCjR87DuxF9ibGeRBP5EdT7RRnXi12J3kThGb2OSxhgDkvvbRPoqgcGKMg2TiZhIv1ZzH9x/tnY3lCGBD/mXzGgZXglBdi5NKMeJzT6RtMAKpzjra2NDor+8oRV9ux444oAGDQb8KZhdulIa1IhI8dByPHGHFkh5TnwOYaGO+KkfHcDSr3kOqeZp6DhjK+yPWD0T09Ajybplhd5dmVAsz3mRAYwOKxVp5imsQgHN5IkEw7TS8y6KRrGkM8gmeMBMJ6NEw55OfD0kq0Tayuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB8062.namprd11.prod.outlook.com (2603:10b6:510:251::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.16; Tue, 21 Oct 2025 00:47:23 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 00:47:23 +0000
Date: Tue, 21 Oct 2025 02:47:18 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH 11/26] drm/xe: Allow the caller to pass guc_buf_cache size
Message-ID: <xak4eutwq2haltvwcsrxlixu2vumnsib3wnexrrnugcol4wayq@maabjjl6y6op>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-12-michal.winiarski@intel.com>
 <12627457-669a-4bc7-a020-3bad4dd0ce25@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12627457-669a-4bc7-a020-3bad4dd0ce25@intel.com>
X-ClientProxiedBy: BE1P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86::6) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a163095-a760-46a5-2dab-08de103b6580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzhPUThCSFgvOHZIK0pnLy9ibW90aWdnOW1CK28xRFdIbEk3dWxnWm1Cdmh6?=
 =?utf-8?B?Y2dBakhrV0Z0MWsxZ2FzWlpFR2VVT0dRcGRrOUc5cXBiK2RGbmJlVnJJZzAy?=
 =?utf-8?B?NFo1VVpmK0NJZXQvRFZiWUFRRGlVYmhzN1EwT2c3TWpjbjA1M2JtbG5FaXlv?=
 =?utf-8?B?ZjRVSnpEMzZqQ0FwMjUrMmx0OHU5djUwTkFEN2ZzLzVRSTVId2tVcFdONGs3?=
 =?utf-8?B?cUZBcWRhSkQ3eHlMSGVQVG41cjc5VDZuTUx0VDZsd05qRDRPcHljMXBjclcr?=
 =?utf-8?B?MXBXdmdsc2pwclJ2ZldYS0U1Y2hlVkd3R1o3SkVjTGZPSGtNUFB1Mmp0OWFU?=
 =?utf-8?B?VzdlQkp6SHFDYmRyMXJRdUI0MGNJQ0pCeVhIM0lnNXJQN3lmYmY3aFBnK0lx?=
 =?utf-8?B?N0FheGdVWUxLZHlqS3I0UGNZN2FXMEllRkFkZ2U2UFJ2UU43NkNRaS9DMVVo?=
 =?utf-8?B?dGt0dkN0RlFFdEpjbWp0aFRxbk1YYUNjSU1RRk9KbnZGNmlpNHpTay9kZmtU?=
 =?utf-8?B?OWZiWjY3WmtjK0xOb0szTVB1ei9IMmdmRzMzd3RabFlJenMyUFNvOXEvbXlL?=
 =?utf-8?B?T2FocStqa3NDOGVwN2IwVythOCt1TENjcTZBZC9BTjZybEpNZFNHaU03ZnNK?=
 =?utf-8?B?ODQ0NTRST2xpbitxbjU2WnJQV3Z4d0p0NEZHZlJscGVmVXUrVURpK2I4S0Jt?=
 =?utf-8?B?cmhvODlEMjQwMzBBajRDWXpRZ1hvckJZNytQWjdZcHlQUHpyZ2Z3bWdrME9P?=
 =?utf-8?B?ZW1JOVNUeGppZlFHVnZQRmxOam9pZVI5WkNWNXJaZWlXTmEyTXFnN0dHYXJB?=
 =?utf-8?B?UEgrR0VyTURJYkkxdHZOajZpNmlxL2Y5QmpKSVlpMHk3dlYvWHJWS21FNTd2?=
 =?utf-8?B?N2FQYlc4d0lCcjFDcVpLekEvOGY2Y3grYmI2TEJBVFByWHlzemRHcGxYSW5l?=
 =?utf-8?B?b2xBQ1Q5NlgzWmUvVXJ4VnY0TC9NTXBOYkZub2lOL04ycFJVbUFOcFFTSGc3?=
 =?utf-8?B?aWZNOEx6Q2pVRDU0b2tIQWVEcGV3cThMdGhON1czWStGT1R2eWdRSUYxbzNM?=
 =?utf-8?B?OW5wSGRsTFkwLy9hT2xIQitZVTZqc3pmR295cmpWMUl6aFpMSkFxWlI5cVFY?=
 =?utf-8?B?Vkl1Z3R0SVVwdmdobm1MaUtRdkxvNnJPN2dOVjBhY1dKa21zTEhhQkNNOE1k?=
 =?utf-8?B?bUNoUU54UlpZUDBMSXJiU3p4TzlwUWdQYXlrRTJ4MDczVFNya1E1T0JXUS9p?=
 =?utf-8?B?bXNjSlIxdld1V0FUVVF4Z3d4ckE5cHdLV29JcFFZbFFwdklxbjZSaGdZdHpj?=
 =?utf-8?B?VitlMmRGdktxbHlueHBXa3I1MkVFMC9TQVYzTWU3T0FFdmY4TUcyWlp2UHRy?=
 =?utf-8?B?TWpqVmV6R1gvbHRxbmJGM0VwVkNoRk01ZHdOR0JkZ1JDKzMzUXNYR2ttbWN0?=
 =?utf-8?B?L3oxb0tLRVRmMFdTRmJ4dlJ5aDQ1T3p0REtjSjZveWpIUjVtSzB5eTRiWWx1?=
 =?utf-8?B?bXhXREVVNjNJNklrS1FjOEdRRzR3bmpuLytudENkdTY0ZVA4UGJhQldOMFBX?=
 =?utf-8?B?dDJ3ZWdteXozWVdaa2NiNTNtS25HMWF1UjB1T3c1aDhVaUsxRzZ2bEFManM2?=
 =?utf-8?B?eTZ5TTliaGVnbHBCSEhlcUlTQlZUcHlWNDJvajdBRTI5enJpRUJVamRFVE5D?=
 =?utf-8?B?ejlqTkdCZFBNd2xlWFU0V0JoclU4L3FGcTVROUwxNHBNeUtLNEJ3MkZKRVoy?=
 =?utf-8?B?K05Vbi9VbmVRSkJ2ME02QVZBdGJscHE4a3NOeSswbUcvd2FaUitFWjF3RURu?=
 =?utf-8?B?c2FRV2VNMDVoTjh3QnJQbW4zRlZoNGY3d2h4eGdlcm1rZjBzTFNTS24rWFRW?=
 =?utf-8?B?Q3dsWHRSQ0pxRWxkMjIrbjNIR3FEbi9WTGh0L0ZkU1IrTmM1TFBpM3duYXdx?=
 =?utf-8?Q?Ojlbsg/rpiAwl4aFUQQ+JL+hFQHG5rh9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG1hckRlWHZLbmxZVjV5NlJWcUNPR2xnQnd3N1Z6em8vWEZGSkFiUGo5T0JO?=
 =?utf-8?B?bk45U2JPSGxWZld2VnBiSVRJTEY2T1RkTktaR2hXaFlLL2RhZnVwSVM3L05B?=
 =?utf-8?B?emprL1pHTysxUUowOGJTYktJU0JDRGtINitqSkxueW04eDhCZmkrMjJWcDFs?=
 =?utf-8?B?RVFxdWgyUmVqSzQ3bURHRm5YVTgxT2hpLzI1MndOMDNCQWRZd05XYThBR1N6?=
 =?utf-8?B?cHNHTEhYWTkzZmJJVmlscXova2JBRlJSenpFL0svalhxR1BBSktoaGdYWkV3?=
 =?utf-8?B?QmNJNGJWampjTlNTR1VPNGd5RTlQQkFlS3pkRS81L0ZKVWFMd1BTRFJiN0J0?=
 =?utf-8?B?NzZEb0tvelhHVU5Wa0RQMFE4NjJsOU5kcDNVWjRmTWdtU2t5cTYrWE5JRmtj?=
 =?utf-8?B?YmVCNW51a0dkSHNHUEdBeXg2UDJyTUZUQ1V0TWZuNkdhcytUdUhndjd4RUpt?=
 =?utf-8?B?RklDL002cG9WRXRoUjhIVHdqUUQyaDVWRUhOZGdGdFJZQWNabjdmSTRvcXk2?=
 =?utf-8?B?aDRhWnFIbUR1OXRqbnM0MmllRWxCZldldDF0YkwvRG81eDdUdU5hZTc4bFBz?=
 =?utf-8?B?dGcwQ2pIQlhlblI2Rm1BeUVBMHczb2JGNmlXN2g4ck9Na0ZvQ0IvbVFyMW1p?=
 =?utf-8?B?Ym5MOE4wb1JQVUloQnprYkVOTy9La0dNWUpIYy9PSFBwTiszb3dKWnp3NGNC?=
 =?utf-8?B?MWJJSS9Gbk9oQzErVzhtalBaT2VmazlRN1BjRkViSkdGS2xtNWlLejhoMGpN?=
 =?utf-8?B?YVEyZXN0bVl4ZGExUVVSWElPaS9RU2s2UnB1emVaU0lPNDZ5ZzcvT1ltSFFU?=
 =?utf-8?B?eU1CMDlzelMvZmNZekNxUHZGU3EzV0pZZmY2OHk2TXJRUGx0L25zazQ5Z3ZR?=
 =?utf-8?B?UTJ6dUg2bVpqdCsySmJkdXRKQzdFU2l0NXZsYmRRN2xSeGFwYzJWOFlPbXRs?=
 =?utf-8?B?SnR5Vi9VVGF5Y25pSDY1bDlseXpIRlZIdWJLVFkwSForeHJuTi9qUzFFVGUr?=
 =?utf-8?B?ajB6WmFBNURURkg4WVUwM1V1c1RWcDFlTUZwN0JSNExGL3RCNXo2TXpxU3Zq?=
 =?utf-8?B?dktlN0VsczZmVzFzV3ZlQThpVVh4Qm82YnUrQ2dTWWR2UCt6QUJFWGViNHk0?=
 =?utf-8?B?eDltekpKa1d4ZkRzdWN3YmpCQkJhQlVUNGdSZWsrcCtTRWZRRHZ6N080RXBo?=
 =?utf-8?B?REFYOGQ2ckkrY1FrMTVNQ2NnRjhtTWpZa0xZYzlhTm9FTE96NnFKWDNqd0dJ?=
 =?utf-8?B?OEg2K000M2hXMCsvRnM0bXIveVU4U3lpM3doQmx3STIxUkZkQ2FGVmdFNjht?=
 =?utf-8?B?YkhUQm9SWGUrcDIxSEMrVnNpM0dld3VSSmNrQXZpWm05Mi9ieDNGd005Z1Q2?=
 =?utf-8?B?Mko4THpabjNhOXJXcENnRFFJZGtsVFF1bTl5VDVOemVTZlkvcWhYUmZXejhS?=
 =?utf-8?B?NmFkY1FOZUd2Z29TTExab2NLazlWWnNQd0k1QnArUTU2emNxNHNRSjV5eXlK?=
 =?utf-8?B?czkwYThNUDFPeFBBNk9lZUpyUlBWbVBsQXZqS0lUZ3JOV2MxNjVUVGEvYVpi?=
 =?utf-8?B?bzhWcUUwbHAyaVB6VHhiV2hSQXRTejZHaFFIM2ZQaW43MzU1M0hMOVA4Wlc4?=
 =?utf-8?B?TS9WenJnL0NIKzJMU2lYbDBkUWtteHJZSlQ1dk5TTkprcXZUNUw5REplNjYr?=
 =?utf-8?B?ZEpUVThPOWVjR29sb3BsWnNUNnE3TG0rcTFnUjZPalA4N3NsV3AvSDVraS81?=
 =?utf-8?B?Q1NZMHRKdk1DSDR6SUQ5ZlJlRWM0ME9TbmwvbkJrSzVDNVNOKy9Nem5LTDA3?=
 =?utf-8?B?cVhzOWIrbTMxeituMGhCNk80YWxicFVYZmpoK0ZrOGlaZ1JBTlg5YXR4ckps?=
 =?utf-8?B?NnJ4ekxBVkZMa3Vrd3VPeHJQZ3UyelBGcDNCYm5MMHg5NHJaT1NDUzVCcXZl?=
 =?utf-8?B?QWF0MFJIdkVhQ1MvRndZZzUyQnR6WVp6NTdNY1dtV1Z4Q00zSzNCZGpQNFla?=
 =?utf-8?B?dnBnMnExME9oaGJQeEFPSXhRWGZzTEVPSGlhazhaVU5IU255Z2R5dHR2cEts?=
 =?utf-8?B?SmMyci9XNmdtaEpvOUI5dm9WVXRFYUJSck1oUitUQ244NjNKOTU3WVhjaVVq?=
 =?utf-8?B?Nm1kaGZZN3kwYTg0RThiV2MyQ0xmRlNRSFZFeC93SURaU3V4SHlhVUZUNDVt?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a163095-a760-46a5-2dab-08de103b6580
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 00:47:22.9153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6R0UWKHzyElK1DnodWoqCqPVUKrgwEKgmL1rmYFjQfTcITU/Lzyhosw8MvQhuQhIRZqpvHsa2bKbaOa/UmMdEOHSARqXQIZaI0bkkoimO80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8062
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

On Mon, Oct 13, 2025 at 01:08:39PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> > An upcoming change will use GuC buffer cache as a place where GuC
> > migration data will be stored, and the memory requirement for that is
> > larger than indirect data.
> > Allow the caller to pass the size based on the intended usecase.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c | 2 +-
> >  drivers/gpu/drm/xe/xe_guc.c                 | 4 ++--
> >  drivers/gpu/drm/xe/xe_guc_buf.c             | 6 +++---
> >  drivers/gpu/drm/xe/xe_guc_buf.h             | 2 +-
> >  4 files changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> > index d266882adc0e0..c273ce8087f56 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> > @@ -72,7 +72,7 @@ static int guc_buf_test_init(struct kunit *test)
> >  	kunit_activate_static_stub(test, xe_managed_bo_create_pin_map,
> >  				   replacement_xe_managed_bo_create_pin_map);
> >  
> > -	KUNIT_ASSERT_EQ(test, 0, xe_guc_buf_cache_init(&guc->buf));
> > +	KUNIT_ASSERT_EQ(test, 0, xe_guc_buf_cache_init(&guc->buf), SZ_8K);
> 
> SZ_8K added to wrong place ;)

As buildbots & CI already noticed :)

> >  
> >  	test->priv = &guc->buf;
> >  	return 0;
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index d94490979adc0..ccc7c60ae9b77 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -809,7 +809,7 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
> >  	if (err)
> >  		return err;
> >  
> > -	err = xe_guc_buf_cache_init(&guc->buf);
> > +	err = xe_guc_buf_cache_init(&guc->buf, SZ_8K);
> >  	if (err)
> >  		return err;
> >  
> > @@ -857,7 +857,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> >  	if (ret)
> >  		return ret;
> >  
> > -	ret = xe_guc_buf_cache_init(&guc->buf);
> > +	ret = xe_guc_buf_cache_init(&guc->buf, SZ_8K);
> >  	if (ret)
> >  		return ret;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> > index 1be26145f0b98..418ada00b99e3 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_buf.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> > @@ -28,16 +28,16 @@ static struct xe_gt *cache_to_gt(struct xe_guc_buf_cache *cache)
> >   * @cache: the &xe_guc_buf_cache to initialize
> >   *
> >   * The Buffer Cache allows to obtain a reusable buffer that can be used to pass
> > - * indirect H2G data to GuC without a need to create a ad-hoc allocation.
> > + * data to GuC or read data from GuC without a need to create a ad-hoc allocation.
> >   *
> >   * Return: 0 on success or a negative error code on failure.
> >   */
> > -int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
> > +int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache, u32 size)
> >  {
> >  	struct xe_gt *gt = cache_to_gt(cache);
> >  	struct xe_sa_manager *sam;
> >  
> > -	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), SZ_8K, 0, sizeof(u32));
> 
> maybe we should promote this magic SZ_8K as 
> 
> #define XE_GUC_BUF_CACHE_DEFAULT_SIZE SZ_8K

Ok.

Thanks,
-Michał

> 
> > +	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0, sizeof(u32));
> >  	if (IS_ERR(sam))
> >  		return PTR_ERR(sam);
> >  	cache->sam = sam;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
> > index fe6b5ffe0d6eb..fe5cf3b183497 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_buf.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_buf.h
> > @@ -11,7 +11,7 @@
> >  
> >  #include "xe_guc_buf_types.h"
> >  
> > -int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache);
> > +int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache, u32 size);
> >  u32 xe_guc_buf_cache_dwords(struct xe_guc_buf_cache *cache);
> >  struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 dwords);
> >  struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
> 
