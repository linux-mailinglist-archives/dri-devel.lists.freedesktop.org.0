Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D6EBA19C3
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 23:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DC310E049;
	Thu, 25 Sep 2025 21:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxGR4inK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7D410E049
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 21:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758836456; x=1790372456;
 h=message-id:date:from:subject:to:cc:
 content-transfer-encoding:mime-version;
 bh=a+qfxC4wG25L7ih7oTLZvngRczLYsBR1Apefnh+FJ6I=;
 b=fxGR4inKOwJRmncqwjlQ5eXnquLW991TQVafxLuajAPb9kTut0uVSMGC
 MweWL2j2LBKzpyYn1qfLbPZALN2LOlAIzqSe35CE0fMTK/SWvg4kUZL3q
 H62wdRYJaEnUa5ThQYxufprQkor1ttlus2tzyyOivaCqeuGnSyuRW/jn0
 rGB1Keld4XhVthkI1pILoSVDP4SmXn75Hy7aCa1wUP9zxJtnkFo3BhZFZ
 Jju6sxvLVT3mDh2XtBsp9YC8V65RWAxw1kCxZIad4M7CsilmdNp+HARt2
 miGKqrY1VbOdcy8eSQjMjHZq2vIrVV/fNkcz5swX/D/QxACk3JpgRth+Y Q==;
X-CSE-ConnectionGUID: zkMjHSRTQp2zkI6fxUd/YQ==
X-CSE-MsgGUID: K/ZmwcJwS361fFJFpufLfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="86612427"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="86612427"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 14:40:55 -0700
X-CSE-ConnectionGUID: Zeg9qU7BTmG7516lMgoLDQ==
X-CSE-MsgGUID: c4j8b1DuSvOqfZt1HJmoPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="181831817"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 14:40:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 14:40:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 14:40:54 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 14:40:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tz0BKP3yEeBOEesY/UX69TRKK00Q0S+fKvCpP7yM38oRMlCRzo1YASKI2ULJhMV3Q+B3vb2l+BjL+OEEI4dw9Lzu5cz2A6FVErYGys2ps1+I3i1nd5+meexqAL/mI6XUiN+/ifog6vuNtwz9pCRsqOBY5b321ZhtblkGQxLNCJJsnAEFr/b2wtc/sQrCCRZglY3IkpbpBbj323tI7Vq6nAUMkUGSZqop/V2xDlGqXt2iL5M93zNF8S6MgeaBhQPgPbjovTZf0LBUKHc0sMMV+wJEe0wUMbnALggd1fDrPI2s7Wxu0WYBpu0xAQItthDfjqOYAV4JTWrV9BbZm+kZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNR7OPu9Mzo1jwtRyureTn1HF1OSamSm2hAqNSQFn8c=;
 b=vOgTX1IDnSRt0zl/ykd8I521ysdrWjeDwJEOXrV5U6tZnHGVL8FkYZNXMY8M3V3CXWeItTtoGmW5Jo/Crz0LLww7/C4PbjcDj2NBazK568ItGmPkXzLHhZWGQiexcVer6N4p/yB3AcZB8Y3Ugg8L2AsLm5Vum52YWEJe6wYP0dPCEu8OqyfvcKD7bOylbPoImZ9iLwPSr1QfX6PDlX6dkDdo8rIizwlwHLuUpkBL3aydndtvd9zV1dnrvs2jdkmJZum1GPF5DjZC9JkjFj3OTo8qsR3IVtA7NQD07ETUNV8khQtn35EGGrQaDdnO8/h7RteI8rYNIMa4sIXMZxa5tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7767.namprd11.prod.outlook.com (2603:10b6:8:138::5) by
 CY8PR11MB7846.namprd11.prod.outlook.com (2603:10b6:930:79::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.10; Thu, 25 Sep 2025 21:40:46 +0000
Received: from DS0PR11MB7767.namprd11.prod.outlook.com
 ([fe80::6aa1:bed1:34ad:6279]) by DS0PR11MB7767.namprd11.prod.outlook.com
 ([fe80::6aa1:bed1:34ad:6279%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 21:40:44 +0000
Message-ID: <da02d370-9967-49d2-9eef-7aeaa40c987c@intel.com>
Date: Fri, 26 Sep 2025 00:40:39 +0300
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: "Elbaz, Koby" <koby.elbaz@intel.com>
Subject: [git pull] accel/habanalabs: fixes and updates for drm-next-6.18
To: <dri-devel@lists.freedesktop.org>, <airlied@gmail.com>, <simona@ffwll.ch>
CC: <konstantin.sinyuk@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::22) To DS0PR11MB7767.namprd11.prod.outlook.com
 (2603:10b6:8:138::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7767:EE_|CY8PR11MB7846:EE_
X-MS-Office365-Filtering-Correlation-Id: 33353775-f50f-4d8c-a191-08ddfc7c2e82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDRYQmgvK3h1aGpwYUh2Y1paWDZjbVJxWHpxUzBZZTU1OFNJb3lVNm5zZHZV?=
 =?utf-8?B?RDBvbTJJSHFQNnpzQ0MvT2xsN0gwb1lxcnRyZlhKenRMK29SYlFWSWNsZmpo?=
 =?utf-8?B?Rnc4MFU5Vm04MXdhUW00Y0xHcXhHSTF5RWJVRVpqUU9qdXlNSTdNT250Sm9Z?=
 =?utf-8?B?VmZPSUtWZSs3cEh6NE1rT095c0tadW1PUWJQcWMrczBZd1JDblpNZlJFOVZh?=
 =?utf-8?B?QUtpaTJjenN0RVhZcm5mSERVM2RWdllxUGhTUTU5bFNuOXltSHdvc2E0T3R3?=
 =?utf-8?B?WUFUT0NFTENlcmlBdU94M1V3SUlBcVJtYTlkNmtlTmNPMUJNK29nVm8zdVcw?=
 =?utf-8?B?aXg0aDBqK0pEVHhVSlRlUkF0M3YrcVVkaHlhbGxjaHMxQStaR1Q2MkZKM1hW?=
 =?utf-8?B?ZnBPMFFaa1V1RWJna3RMcnJqZ3h1clRuQTRjS3owQjVxYXdSSGMwTFdJTm5R?=
 =?utf-8?B?RHZWdERxNU54SUpGdm1IdEJ2WTcybHVZdWFPTksxT0J6RFRta1JTS3BOVjZE?=
 =?utf-8?B?OWE1enlNL2xTVW0xcE05cmMvclRCeFdOd01BV0lkdVVpT2JNUkw5RExaZzR4?=
 =?utf-8?B?cUtCdldxUGxDRkJ4RFU4UXM0Y2xmSHJZQU9TTjdWRk5Hd2xmOFVSVkoyZmRl?=
 =?utf-8?B?ZkF3YkxpL1A2dGNlblFCV1NTUmlpT1NULzFZRzMrZ2FPVDZZOGN1L2wxVlB1?=
 =?utf-8?B?c3JXTmVuQUt4Q25YT3hKZitvc1N5ZkhPMmpGcVRLd2ppUXRpVmlHc25xbndJ?=
 =?utf-8?B?aDVTUENsRXhiSUlaLzJGaTlSNGZSTDRVL0NYZXhQczR2T3FKMWdDdHIrQTVo?=
 =?utf-8?B?WmRUQzNWNllDa3VaaUZRMGx0Wms3WXl3WmVrbEQ5NmQxTlBGK01SSGwyWXFH?=
 =?utf-8?B?UmduSXZ4WldKaWlWSHZUcGIxVThWUjIvc3FyMUlZdUF5bS9RQTlEZ0NZNEwz?=
 =?utf-8?B?MXlHL1g3WmZOSDdxUzd3RGwrNENZOTVZLzJoeUFoc3Z4ZFlNUkVjaWZmcjlH?=
 =?utf-8?B?TUExTzlGenl1eHhMSitqRS9WcHppYUF3M1lyREJQcy9KSUtVeHEySHU3TXVH?=
 =?utf-8?B?SkJOOTRFNFFkRWQvU0trRW53ZGhkSnFkelVXSXFLRzREZE1HYXBIdDBTc3lJ?=
 =?utf-8?B?TXIvMG1Xb0poVVZqRExuZVFBbVRpTit2WUlQbEVZSm1iQ1hmbEhSLzUvS2lW?=
 =?utf-8?B?SlNUTVVMVlFvYmwrdXpXTUxTRzdhUHdtaGFiLzJsWHUwbHRvVm1ZakZlNWVU?=
 =?utf-8?B?WUF5dW1OZ2NTV2ExNGdjQ0dDYkxWK3NvL29WK1VLUTBEajZGT3lDZGE3b1dw?=
 =?utf-8?B?Ulo2NTYyVDZiRjJvRVYzVmpLbkU4WGtaT2dVY3ZrNEFqZVpWYVF0QUNmS0tM?=
 =?utf-8?B?aThNL0JGdlRKQ0dhZ0ZUbi85aUNwSmdKaUhET1pYZTg4TlNHc25vYkZIQjRB?=
 =?utf-8?B?b0FvcHN2TzlUQWl2cEp3Q041cS9EczdiRUNHY2FHS0RkU1RnZXhzWkxIejNK?=
 =?utf-8?B?VnZkd1RVZHVxY3l2ZDZ0Y0lGK1FUU21ZNGU5bE9OamcwRGtMNjFFbEFKcGY1?=
 =?utf-8?B?TDA4Z2h5dGlYOUNYZ0o3Z245bjhRNUdQVVkxYkhxNUtkU1lVYTNhR25EOERj?=
 =?utf-8?B?cU83S1FRQ2pnbStqbFgxL210b1BQSFhwd2V3Vm11RDFxdUduUTREMFdBYnht?=
 =?utf-8?B?MS9OdjF4UDFnbDZIMXl0V3plRmUydSs4TWJIR21JcDlIV1BTb3ZRL3FNRDZz?=
 =?utf-8?B?NS91RE9HUXdoc3NzUmlpZFpwTmVlTFp0ZmszQWVGK0tNcGkvV05lVlRrV3Nl?=
 =?utf-8?Q?yfyF222ohzgfakIkRFrScH5DAS3EbbwlMsyrU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7767.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm9oeGEydFJ0SXQzQzdFNGxTbkc0eDFtak9TUWhNYlI2YU8rL3hzSlllU2dt?=
 =?utf-8?B?ampWMDFGTWZUREJXc002WnU4dEJwaWIrbUtuTUZUZmtGTVlxcDluS3RMejFx?=
 =?utf-8?B?dVZaZ3UzN09UUjNPWDJrOE1pOG5nNU8rTmR0eDJsWEp0Z1VhdG85NklLK25O?=
 =?utf-8?B?Nzgva3JBS0Z0ZFRpK0FjMHV4MWJDdGFsWWJMMC9Vc1BiVFBnM0M3T1NlUHVs?=
 =?utf-8?B?bWJ4YThpT2p4V0xucW5QazZHenpGdTJNbmlxT0dUQ21JRS9JWWRCY25BbEtZ?=
 =?utf-8?B?aFkzdUVVODNTblppZTd6OWs5Tk1uREZaaHhYZWI4RDJIYXJEYk1PU0M4VVF1?=
 =?utf-8?B?MjFkQkZQQUVNdmswMGVtQ1BPdnhxamtxeXdyeStiUjZ0NDBHMFkwQmdUU01K?=
 =?utf-8?B?THVpWUVzN0ZvUlBtZDNxTlVRcnV4YUVxTWZQeWVnM2FXbklnL2Fhcmpubk81?=
 =?utf-8?B?U0NQNDErMzVOd1dNV2hvVWo2bkVFeENVKzhHaGw4dlh0VEpGM2ZEYjIrNEFM?=
 =?utf-8?B?QnpZZmxHZnBzb2VCK1pUNTFUUnc5WVJnQllFYjREcGRoWE84MWhURnhHNkVU?=
 =?utf-8?B?MHZsT2dueml4UFhSZ0swTElHaCs4Y0lXRHYzRzRSZ0NjUkFvOTJJSURDMUhr?=
 =?utf-8?B?R2tBRVZWUGt3Sk9YdSswc29CWUh3Mlk3UGhOU2NCeHpJc2NZcnF0a3Uvandx?=
 =?utf-8?B?dkdJSTFnOWlsY2xhd0tETTJja1JlWE1zZTMvTmR2SlU5eDlaRFVidlF5azdV?=
 =?utf-8?B?aGFINXhJNWppUy83c2RYckFsOWVIREp0NXBvMWhzRFV4NzVVSlNyenEwLzAz?=
 =?utf-8?B?blhwZUljNWhoVTdIR0haTldDRFZ5VUptT3g5ZjdGb1BGcUJvdmNOamlCUEpE?=
 =?utf-8?B?MDY4Y1RXOE1qVURDL0tlY2dTa25hQkNSd1VkQWh5SE8yS2UxOUlTSmdSTG5i?=
 =?utf-8?B?MmFMaS8ybjcxajRJNmpCcVFDVTZLRUE3b2pxaUl6UnlhZGdkZG9MZkp0Vk1x?=
 =?utf-8?B?TUsrNHM0QnRUUEtzclZNOUxDMzNKdDN5R3haYmRWVkZVYTJwZitPMjYyZzI2?=
 =?utf-8?B?Niswb2s2aEtNaGVMUnZxZ2JMY3p3MzhZWEYyNC94alpCRWU4WEpPVnN3cnpW?=
 =?utf-8?B?dzMzeTBndktyYWF3TndTZFFpV2pFMmJEWTJPa0dsQmZDTlZ6c0RPUy8rVlRu?=
 =?utf-8?B?Ni85cFZpWkNqQ0J1b3U3UnkxMnh5UEpQdWNlNDFZYkNjaWR0V3g1ajlJZkVm?=
 =?utf-8?B?bUszSDd2d1NNcll6NithSllLOGRibldQQWI3Tm14TXBSMjcvcllneTVIQThV?=
 =?utf-8?B?c3haRU5CcjcwUmtVNDgzNVBObnpyT1Q0SW9XMUgwRmFIWi9RZW5pd2JEcG4y?=
 =?utf-8?B?di9obkdDV2ZTVWRQK3ZMVWN4WUkrSmtvWVlUanFMVUFtL2FFanJONUNWbmk1?=
 =?utf-8?B?TWliQmg1a2NuUE91bEh5Vzh0d2lnb3d5d1cyM0xGdWtHeFo1RDVOYnMxMmtE?=
 =?utf-8?B?Y2o3aW5CTDNvSVRTSHNJRFF0a1hjdzV2UWxHTkd1UmxUV0h1Y1NlclJlQ0hi?=
 =?utf-8?B?Mi9TczdjZTZ4R2hFWVFrUEdYeFZicWhHL0FhR3RlSGdrbmt2UkRxL1Q2RDVV?=
 =?utf-8?B?YVZ4ekhiWkU2R3hxVzZDZ1RLeDlzWW92Nzh0TndQZkoyenVSdm5uWGFJUnRW?=
 =?utf-8?B?aDdCMFh3bVIrTWQyRDhBNlJQQndMRmxBM0MrQUFucGNLcmFrWldHSFI5K1Z1?=
 =?utf-8?B?WWVMcldEZzFxSTJkTExHYnpZYlVQa21zN1dZb1R3aXU3OG5oUTlkR1dLOW93?=
 =?utf-8?B?Y3ZaZ3N1c2dwUFpReCtNQ0JoUElrbEwyWjYyQjB0ajF5c1BPWG9DQ0I2UFZi?=
 =?utf-8?B?SFc5Yk9LRGhuSGpHa3Y5Wm9xYkdrcGxwT1BCNXkzaUc4RjVlbXBOOHc5Y0FG?=
 =?utf-8?B?ZjhpczJ6VjBHcVFvWkhRak5ud2ZjSkNxMENCNVJVclpMOHlCOHBkeE9xN292?=
 =?utf-8?B?RHMxQnZ1Nll6bllxSDBXc3RQTXVUOHpnNTJheDFad1VaclEvbjJQUjhFYjE1?=
 =?utf-8?B?eDl5QWxzMWlYbVY1SzVpMFpsSmFzL2czTGJKNnpUZnVaTXcyejBVdmZvSzFN?=
 =?utf-8?Q?Frza5tWD6otwUWY+M4OBCfMVd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33353775-f50f-4d8c-a191-08ddfc7c2e82
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7767.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 21:40:44.4502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dakpfh1D5NhSJz6S4vnM7eTzZxV2B5BUA2cbqidOJJRpLn8KidxUHcj8IxTrJ5YtdA5rEGJhxLHqd8OcLNebbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7846
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

Hi Dave, Sima.

We are excited to continue the upstreaming of the accel/habanalabs driver,
based on the work previously done by Oded Gabbay and Ofir Bitton.
From this cycle on, both me and Konstantin Sinyuk, will be maintaining
the driver upstreaming, ensuring regular updates into drm-next.

This tag contains habanalabs driver changes for v6.18.
It continues the previous upstream work from tags/drm-habanalabs-next-2024-06-23,
Including improvements in debug and visibility, alongside general code cleanups,
and new features such as vmalloc-backed coherent mmap, HLDIO infrastructure, etc.

Full details are in the signed tag.

Thanks,
Koby


The following changes since commit 342f141ba9f4c9e39de342d047a5245e8f4cda19:

  Merge tag 'amd-drm-next-6.18-2025-09-19' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-09-22 08:45:51 +1000)

are available in the Git repository at:

  https://github.com/HabanaAI/drivers.accel.habanalabs.kernel.git tags/drm-habanalabs-next-2025-09-25

for you to fetch changes up to 6ca282c3e635cd98cc5a9bb24606b41379e1fd8e:

  accel/habanalabs: add Infineon version check (2025-09-25 09:14:45 +0300)

----------------------------------------------------------------
The notable changes are:
- Correctness & Robustness
  - Proper error handling in mempin path (`-ENOMEM` vs `-EFAULT`).
  - Gaudi2 BMON disable fix, better CPLD_SHUTDOWN handling.
  - Clarify context lifecycle after `hl_ctx_put()`.

- API & Cleanups
  - Remove legacy VERIFY_WRITE access_ok().
  - Fix typo in trace output.

- New Features
  - Vmalloc-backed coherent mmap support.
  - HLDIO (NVMe Direct I/O) infra + debugfs hooks.
  - New passthrough APIs: error counters and P-state queries.
  - Expose Infineon firmware version.

- Debug & Visibility
  - Log register accesses from debugfs.
  - Gaudi2: stringify engine/queue IDs.
  - Improved recovery after dirty preboot states.

----------------------------------------------------------------
Ariel Aviad (1):
      accel/habanalabs: add HL_GET_P_STATE passthrough type

Ariel Suller (1):
      accel/habanalabs/gaudi2: stringify engine/queue ids

Ilia Levi (1):
      accel/habanalabs: remove old interface variation of 'access_ok()'

Konstantin Sinyuk (5):
      accel/habanalabs: disable device access after CPLD_SHUTDOWN
      accel/habanalabs/gaudi2: use the CPLD_SHUTDOWN event handler
      accel/habanalabs: add NVMe Direct I/O (HLDIO) infrastructure
      accel/habanalabs: add debugfs interface for HLDIO testing
      accel/habanalabs/gaudi2: read preboot status after recovering from dirty state

Moti Haimovski (1):
      accel/habanalabs: support mapping cb with vmalloc-backed coherent memory

Pavan S (1):
      accel/habanalabs: add Infineon version check

Sharley Calzolari (1):
      accel/habanalabs/gaudi2: add support for logging register accesses from debugfs

Tomer Tayar (3):
      accel/habanalabs: return ENOMEM if less than requested pages were pinned
      accel/habanalabs: clarify ctx use after hl_ctx_put() in dmabuf release
      accel/habanalabs: fix typo in trace output (cms -> cmd)

Vered Yavniely (1):
      accel/habanalabs/gaudi2: fix BMON disable configuration

Vitaly Margolin (1):
      accel/habanalabs: add generic message type to get error counters

 drivers/accel/habanalabs/Kconfig                   |  23 ++
 drivers/accel/habanalabs/common/Makefile           |   5 +
 drivers/accel/habanalabs/common/debugfs.c          | 324 +++++++++++++++
 drivers/accel/habanalabs/common/device.c           |  23 ++
 drivers/accel/habanalabs/common/habanalabs.h       |  56 ++-
 drivers/accel/habanalabs/common/habanalabs_ioctl.c |   6 +
 drivers/accel/habanalabs/common/hldio.c            | 437 +++++++++++++++++++++
 drivers/accel/habanalabs/common/hldio.h            | 146 +++++++
 drivers/accel/habanalabs/common/memory.c           |   9 +-
 drivers/accel/habanalabs/common/memory_mgr.c       |   5 -
 drivers/accel/habanalabs/common/sysfs.c            |  11 +-
 drivers/accel/habanalabs/gaudi/gaudi.c             |  19 +
 drivers/accel/habanalabs/gaudi2/gaudi2.c           | 386 +++++++++++++++++-
 drivers/accel/habanalabs/gaudi2/gaudi2P.h          |   9 +
 drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c |   2 +-
 include/linux/habanalabs/cpucp_if.h                |   4 +
 include/trace/events/habanalabs.h                  |   2 +-
 17 files changed, 1442 insertions(+), 25 deletions(-)
 create mode 100644 drivers/accel/habanalabs/common/hldio.c
 create mode 100644 drivers/accel/habanalabs/common/hldio.h

