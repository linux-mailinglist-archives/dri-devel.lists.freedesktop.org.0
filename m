Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 435D3C899F8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 12:59:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E20A10E5BC;
	Wed, 26 Nov 2025 11:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iK0CK3AI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECA610E5B4;
 Wed, 26 Nov 2025 11:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764158357; x=1795694357;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=u1JsRylM1yUJK9KxPa0f/+PsHtgnvTTq8HylXHAw87U=;
 b=iK0CK3AIudTeNBSPbJl5WPyDjhR5HbOqoF2AycwR+moXhCl8Es4Y1AkY
 7WZN2dMHruWddxM4VOVOMGyMF4P383ZZ/ATIh3Xv/gtQ0LvOsQUdYeLX/
 eSsVAfy0mwv38MWCk/h/GlZ4xQcCORMDbD5RmbxuX7SzxfJ/cwbGFu7s+
 ctFhVzNdvb5bEWE1dwyfmQ7/zIngxjOrywoKxhCmtBdGvrSYiVCwG9HPK
 JgFl6n09GOJmTegfgvbFbnTZH5phGWO8igfeu0xTxDgtzoxY8oHkhkQEh
 kdqc+2Ig4hsEUP79IfEm3uM8XWEA5VFiQra/FSjvq/hpgxzr2WOHKmOKy w==;
X-CSE-ConnectionGUID: uaVTMJQsSpeQ5tSiGu+QBw==
X-CSE-MsgGUID: YiDbK894QNiVD+Tiwk6e7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76517702"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="76517702"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 03:59:16 -0800
X-CSE-ConnectionGUID: lKN889GgR1+KoIBIP785fw==
X-CSE-MsgGUID: AeRu7lALQ9eEfIoCiVDZXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="223882659"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 03:59:16 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 03:59:15 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 03:59:15 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 03:59:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b93e4j+ZIxHGPUAtAX+oi2LIElUQpWx/2qSrzkQ0RucggQYUpBikxvc+gcO9Yjvyl4aQryCdkowSUcuxvxiY10fsoOK+YdzkRxfUJLgBvh2tP6yJy3qwcVzzL2STz07UjnM1flMl/2UjA+Fa0IcSwLqWIN4/8wuT+8qiM2Zur+8I1RCqdonPcupKjd4zuiCEgDF8RjJYqDBD4L+0IjXrZATNbqTPqQ9ISRT1VkpEW6C/JDdlYyTLiY8RQYBYsc/j8Rbb24WRMX0AR2qr+rWcWXt/tOGnCGg8gqLWPsyw7sh8Q2Qp/SME0Bj60nR8yJBa8x1UdBWJ4MhO8H91l2wW8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nm7vkhTNCPgLAzPBpqtjIbotYK8zf+wr+DCbA4VBA4=;
 b=tvlqoR5Aokll51NYW3fTnKxS4n71cijJz/8zPbw4rTSEj5LHZoT8njpopQ91s/VZf5oOzvGygnRRE+6cGK2iHgVVASOjsA1U76Uopnasf89Pk3gxPEQj1Dh8cW7MP6fee9jwWJ+YqxquEqRuZjBwkKYwPSHZguxr6sZdvcUseVGw/DG4JlYx4o3fSaRdndwZHGFjUSlxaUUx4G5dbrJliVhw8NyEST+uPQacxdG0a9Arj4g+iUZhdSO5j6UT1PJ5IzMuoxHGykgTivBkALfNzg1csU+JqEj7AgCpktC/Y15hX7mzcYlOB3yyq808Pv4ituJ7PqpxeO1MVz3AJVqVEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS4PPFAC42FDD50.namprd11.prod.outlook.com (2603:10b6:f:fc02::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 11:59:08 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 11:59:08 +0000
Date: Wed, 26 Nov 2025 12:59:04 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas
 <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer Kolothum
 <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>, Christoph Hellwig
 <hch@infradead.org>
Subject: Re: [PATCH v6 4/4] vfio/xe: Add device specific vfio_pci driver
 variant for Intel graphics
Message-ID: <g5dfoghfje5qq3zjfc7gstchzwedbfygpcrgcllw7u5pit7pik@fbmz6of6ljle>
References: <20251124230841.613894-1-michal.winiarski@intel.com>
 <20251124230841.613894-5-michal.winiarski@intel.com>
 <20251125130814.1c0bb7e3.alex@shazbot.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251125130814.1c0bb7e3.alex@shazbot.org>
X-ClientProxiedBy: WA2P291CA0041.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::27) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS4PPFAC42FDD50:EE_
X-MS-Office365-Filtering-Correlation-Id: d139589a-e2a1-4a9b-7c51-08de2ce333e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFFOWEdrUWNWUFpIRE5iMjNSbUJJTUJ3Y2REQmRpWVpydWZIUFZYVEhYOU12?=
 =?utf-8?B?eW9haGNNY1RvbndIUFphMnNBUG83OVhqWHdpdGpCem5GTHpQbGhmTVo4eTdz?=
 =?utf-8?B?NGxJUXEvUUJ4Y1V2QjhtVVhDYktNYlRCU1cyNmc0bTllcWU3d1NLeU9zN1Vx?=
 =?utf-8?B?d21zdi9xWUN5UHoxWGk2RmIyUHlXUHBjdWZ5UERCWTJiWTZuR3VSbGFCc1JV?=
 =?utf-8?B?TkZ4bDV5OFU0c1ZCTnZEODFlV0hrd3hZekZCRWNabStKdzR3YkNDVnlNeUxo?=
 =?utf-8?B?aXFnNnZWcmJqdDRDWVF0TENkcEROMUdpRXhhQlc4SHFOeDdtK2xVN2toQUhw?=
 =?utf-8?B?MWFHUWowbmE2NXIwT05ONVZiWG9NYVdDQmdmUnQwSzJXRDArTHAzMVZZT1lm?=
 =?utf-8?B?YnRjN3ViZlBHUDc0anlLempoczc0alBaR2hHWGhYUjN1bkFyY08wTWFqNFAr?=
 =?utf-8?B?eEZPam5TRHdWN2dHVnVRaFlJNE8vdy9pd00rV1AvTzlxcXdNdEx5c3NqN0Vo?=
 =?utf-8?B?UFU3di9wbGdSUDJCRkMwSERuZEN4VUxaTmJaUVIxUjFxVk00dUN0WTRmMWk4?=
 =?utf-8?B?SE9KNmNQS2FLdDd2SkhyMU9PRW95T1h5MHlZVi9tOGthWkJ6eXBmOEFzOG13?=
 =?utf-8?B?bVd6SjhQVkxOMHdxWWFCWG8raDRZUUpEaHdMZVVMZWZXSE91QXVLYUZxc0ZY?=
 =?utf-8?B?M0dlRzJYUFVYc3g3OU96NnpVc0RKck5YSlhmTDZBYS9lN2ZTRGpvQkkyallM?=
 =?utf-8?B?OXkxMlJibUZOMmNVdVU0ZEVNeCtjTnhWdkxpcUJ5anZ0ZExGTFNFTzRCMW5P?=
 =?utf-8?B?UTJRZUJYdHJUaHdZWG1aR2R2V05saVpGZU5XQjNtWVRSWHI3OE1sY2FsUll0?=
 =?utf-8?B?UStlNWg0bERla21Henc2R1pCaWlSNURJK21EM2R3bVh1bEZwajhYeDhyVmNY?=
 =?utf-8?B?WVArUWFldGFSano0U25SVTVOOGI0MlY4K2lQYXlnak12QzlydkZjSGZMZDRP?=
 =?utf-8?B?SVRiWi9HdVZxam1lTWZjRkIyUFJzY2ZrWFlZS1p5d0kvc3pKdHZqeHp5SVBj?=
 =?utf-8?B?NmNOZGJTcWlZZ0t4TEFOZ1ArNnVoMWdveEtTSXRoa01hZHZ4SFZyN0Q2RUg3?=
 =?utf-8?B?dlVIdFMyNkl3WkxtWmR5ZHFIMGU3ZzJINVNEbzhZb2lld3RxL2xpWnY1bFBO?=
 =?utf-8?B?WmtScElzN3BuQWtHR0hNTllBRDVva0RCbFRuZGFUV045bUNXZmRNZ1JTTWJB?=
 =?utf-8?B?RGloU2JNVFlDR2JhclNwWGxXMjhteERKOWY4WEU2SE8wOVViTzhPUUVHSlFx?=
 =?utf-8?B?dkhxcGQya3lVTGV0d1hYcGxSWTc2TlY5UUYvRm16V2hRN3pVcXhkSURZNUJu?=
 =?utf-8?B?MnIrRy8zNWU0Q3E4RU1oQkVTUDFYazRvdnBVZVRzZldMK1hkWUNoYzJBK3Vw?=
 =?utf-8?B?VjhFK2tGdjI5RTdHbUtvcklERDNWakdvMlVOMnpjQmcvU1ZnTDZUZVgzaFZ6?=
 =?utf-8?B?TVJXL3V5dUVuZmE5U1kxRmd4RThwQUtlMFVwaCtvMHlvQ1UvajNheFE2bjFj?=
 =?utf-8?B?V0NzYVFVTngza0k3UkRkdGFJYXAxbnlqTmVIMVRxQXlzd3E5bUNrTTV2T2dB?=
 =?utf-8?B?aFAvZnlFRmlTQWlqQm90WDFXVkFjMHdKNnhSSGFSc1h4OWxrTHVqbDlPTTQ1?=
 =?utf-8?B?enJscDh6UXBlQnZhR25xMDg0REoyanpzSjZBUWc1cWx1V0FTNDRJd0VPelFM?=
 =?utf-8?B?SlBoTjJtNVcwTjBRNmtvNVdBSTdhbFBCYkpXQVU2UEFDRG9temVsZHhTQW1z?=
 =?utf-8?B?Tk1HNzN6cEkvWGtBRncxcVR2bHE3QjNYbGxtTzJBMjNqNkNwc3h6a0V5Sis2?=
 =?utf-8?B?eEJTeXJCM1lwM1dxYnlsaXJWSDBHaHovWmRCU0dMR3l0QmVCWm9Ib2JEdEVn?=
 =?utf-8?Q?v9tpNvWCQEqAzlxkUcuWvU34iD16cr8e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzBUNlpMV2xpcUZLZjdodW9xTU4wcWs1RnYyRWNDV2ovd1hrZ29xL0dzR0RP?=
 =?utf-8?B?dVBMSkIxZURydzlJcTdqZEJoZHYyc1BDTzNaTG5LLzJUb0QvZ1MrWXpEaTNL?=
 =?utf-8?B?cjNMMXRnYU84ZjUvUkhtM0hxWmV5UGZ0Qkt0L2kyR2g1NE9Hc2FLNm1iZitP?=
 =?utf-8?B?bDRoZkltNFFmSE9TR3pKdHhRRzRLYVpJTFRTZ1E0bTk2SHN3N21YT3h1TGtu?=
 =?utf-8?B?alVPNit6Q2xTVU9tMHBkc0dZTG1pdnBxeDF4OGozVVdXWFpJSERoQUFVbzZB?=
 =?utf-8?B?WG1Mc1R1Y1Y0OVptNWZrQUJPdG1PeDl0MTdHK1lOWk1WTHRFQzRjenUvanFs?=
 =?utf-8?B?VTlXNU84UUVvK1NjRjhDWkt5RWZGMlhMRWpXUmVIbEg3NjYyYlRnVnRmMmdC?=
 =?utf-8?B?QTM1ODh0S25UN29UY285MXZ5U3hmRGRPUm13M1VWMnlXMmhnMU52VE96Sjcx?=
 =?utf-8?B?SXZ0NjBka243RnRaYktnaTQvOGdFMXh0eitVNXZIWXhOcS9SUGR4ZXYwZHkr?=
 =?utf-8?B?cVBmVE5XcnRCMkpRc1F6STROTktGTGJ4bVMrZEdXckxMKzJ4M0E2MEphRTJm?=
 =?utf-8?B?NGQzZ3FtWnpQR2FpZTY1L0xzaG5IY1dYL2hZSVhhQnJXSDI0em4wMzFrYnM4?=
 =?utf-8?B?NzdXamlYdEgyZDJrM1JRS0ptYTNzemdWYWUycXJ3cWt3OWhzOXBhZ01zdVVO?=
 =?utf-8?B?WEVaSzI1enJBUlo1RGhrNVhuWXhFN3cvLzdpYXJtUDBEVjcrc0YyVmU2MmEr?=
 =?utf-8?B?Sk5KZnRVZGhVcGhreWM4cklScjB4K0kzZEQvMDh4U1NiR0U4YVEvSzFmMU9p?=
 =?utf-8?B?amY1czNyd3NvSVljQVFMUWd3ZkZJbDltSXZ2eG5kYUMyL0EyM1BPMEJxNTRz?=
 =?utf-8?B?OUJrRWdvdXIxZGp5Sm5abFFrZXpFNzB4S3o3QXlXV1U5WlNENjBNMThwZkhu?=
 =?utf-8?B?TnJwRjIrY1JkTk04WFhxcDRISk9uUGFWQWFXcFkyZElNRTZiNmYzWU1wQ000?=
 =?utf-8?B?SjZOcll1a2Nsb3BrL2tHVFhFTTh2SDlBOWdFTXBmbG40MTlkbHlkanhiaUQ5?=
 =?utf-8?B?Wi9KRnN1WkF4UFUxdG9lanoxdGF6b25mQlB3SmMxbFcyS1F4L0FQWlF1MWhE?=
 =?utf-8?B?dW9DM29nWDRCTkx5ZW9neHc3b3BKY296cjgvWTNqTWZRUHZwL1YrcGhsT2M4?=
 =?utf-8?B?RGh0am4yWXBWQ0x3andmSHpaNWRlbW0zaURaMFcrQ1ZCbEJCYnNxZDRUcmVB?=
 =?utf-8?B?NTlqT1pjSkpTaW1ncWZzK0JNN1JMa21HNFJFYyszWWRGNlJyNFNOQ2dJU3U5?=
 =?utf-8?B?WmR4STlqb2hxRjZURVJLbUdtb0tWTEt5NFUxKzVibHAyWVBQQlhuZ2hWYzc2?=
 =?utf-8?B?U2tqRUt2Y3lVWWN5czZqclR1TXNOSE9maXIzWE9HRDl0bnFjMDUyY21zb016?=
 =?utf-8?B?U2l2WmFaNjhNbTZRM05MUWFsbEs3aTZuVWF4Skl4V0wyTmc1YUkzUWVZMUdy?=
 =?utf-8?B?NktmNFpQNmNxZk01eFRLMzBNcHd2M24xbXBGNGpDZy9lYXpGTkhUYzVJZmc0?=
 =?utf-8?B?bGxIcTc3WldVTFFqR0dNTXRsOG92b1c4aVBCQWZhR3hPRzRNVFJJTjk2QWhM?=
 =?utf-8?B?TDNRT3ZJM0dyaEtsYXRRQXU1clBlLy9LTmxjT1RtR3FRYUROVnN6RUJPMHZV?=
 =?utf-8?B?R002UDllSHdiU1VKSzQ1eHA4bGgvOGxaOVhzZVN4SmJmSU14dWM5TXFaWTdY?=
 =?utf-8?B?K1dSK3dXeFZXMmdKeEV4aitSN3JxRFFuTlIzTlkyRVVQazJBT1ZPMmtwWnJS?=
 =?utf-8?B?d0RnMlp3VS9odm95RURESVcyUmVpK3ZNSXpMQm1WLzhRU0ZEUDhMakpySG1N?=
 =?utf-8?B?VDhBVTcydHNxRzlVSExNS09oUW1IR1U0aEdEMFJJb05lVWxnNm9ZQjZpWEMx?=
 =?utf-8?B?WTZkVmNkUmJZeldIVE5TeUtpZFAwOFRkaHVpeGdlZW9uM09ZUFFjN3ZqeGkr?=
 =?utf-8?B?bVdUQWx0RVYxNlZtRWpaL0ZjVUpzNStKMEtjeFNXR3kvL0JyNXF4K1pXdmRu?=
 =?utf-8?B?NkJva1pGdFpqUUtHeFZ4TWxOeGVRZFlPTFlmaFBGREhtTmNQMVFhcmczZjFy?=
 =?utf-8?B?Z3dIQ2FmSk1lY0UrTWpneUpHNWhGTGRxcytvN0R0QVJsRm5jOE1UWi81bkdY?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d139589a-e2a1-4a9b-7c51-08de2ce333e4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 11:59:08.6176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pB+l+JTdUIPLCOE9WKhC9iZYamKulruYdNXZ1ERs/yGqukg+GW705hLRvFwtEUySRTtWxckP8i3EFPAcF8idP6l9G3Vtz+wBT94jnLtukcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFAC42FDD50
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

On Tue, Nov 25, 2025 at 01:08:14PM -0700, Alex Williamson wrote:
> On Tue, 25 Nov 2025 00:08:41 +0100
> Michał Winiarski <michal.winiarski@intel.com> wrote:
> 
> > In addition to generic VFIO PCI functionality, the driver implements
> > VFIO migration uAPI, allowing userspace to enable migration for Intel
> > Graphics SR-IOV Virtual Functions.
> > The driver binds to VF device and uses API exposed by Xe driver to
> > transfer the VF migration data under the control of PF device.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> > ---
> >  MAINTAINERS                  |   7 +
> >  drivers/vfio/pci/Kconfig     |   2 +
> >  drivers/vfio/pci/Makefile    |   2 +
> >  drivers/vfio/pci/xe/Kconfig  |  12 +
> >  drivers/vfio/pci/xe/Makefile |   3 +
> >  drivers/vfio/pci/xe/main.c   | 568 +++++++++++++++++++++++++++++++++++
> >  6 files changed, 594 insertions(+)
> >  create mode 100644 drivers/vfio/pci/xe/Kconfig
> >  create mode 100644 drivers/vfio/pci/xe/Makefile
> >  create mode 100644 drivers/vfio/pci/xe/main.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index acc951f122eaf..adb5aa9cd29e9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -27025,6 +27025,13 @@ L:	virtualization@lists.linux.dev
> >  S:	Maintained
> >  F:	drivers/vfio/pci/virtio
> >  
> > +VFIO XE PCI DRIVER
> > +M:	Michał Winiarski <michal.winiarski@intel.com>
> > +L:	kvm@vger.kernel.org
> > +L:	intel-xe@lists.freedesktop.org
> > +S:	Supported
> > +F:	drivers/vfio/pci/xe
> > +
> >  VGA_SWITCHEROO
> >  R:	Lukas Wunner <lukas@wunner.de>
> >  S:	Maintained
> > diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> > index 2b0172f546652..c100f0ab87f2d 100644
> > --- a/drivers/vfio/pci/Kconfig
> > +++ b/drivers/vfio/pci/Kconfig
> > @@ -67,4 +67,6 @@ source "drivers/vfio/pci/nvgrace-gpu/Kconfig"
> >  
> >  source "drivers/vfio/pci/qat/Kconfig"
> >  
> > +source "drivers/vfio/pci/xe/Kconfig"
> > +
> >  endmenu
> > diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
> > index cf00c0a7e55c8..f5d46aa9347b9 100644
> > --- a/drivers/vfio/pci/Makefile
> > +++ b/drivers/vfio/pci/Makefile
> > @@ -19,3 +19,5 @@ obj-$(CONFIG_VIRTIO_VFIO_PCI) += virtio/
> >  obj-$(CONFIG_NVGRACE_GPU_VFIO_PCI) += nvgrace-gpu/
> >  
> >  obj-$(CONFIG_QAT_VFIO_PCI) += qat/
> > +
> > +obj-$(CONFIG_XE_VFIO_PCI) += xe/
> > diff --git a/drivers/vfio/pci/xe/Kconfig b/drivers/vfio/pci/xe/Kconfig
> > new file mode 100644
> > index 0000000000000..4253f2a86ca1f
> > --- /dev/null
> > +++ b/drivers/vfio/pci/xe/Kconfig
> > @@ -0,0 +1,12 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +config XE_VFIO_PCI
> > +	tristate "VFIO support for Intel Graphics"
> > +	depends on DRM_XE
> > +	select VFIO_PCI_CORE
> > +	help
> > +	  This option enables device specific VFIO driver variant for Intel Graphics.
> > +	  In addition to generic VFIO PCI functionality, it implements VFIO
> > +	  migration uAPI allowing userspace to enable migration for
> > +	  Intel Graphics SR-IOV Virtual Functions supported by the Xe driver.
> > +
> > +	  If you don't know what to do here, say N.
> > diff --git a/drivers/vfio/pci/xe/Makefile b/drivers/vfio/pci/xe/Makefile
> > new file mode 100644
> > index 0000000000000..13aa0fd192cd4
> > --- /dev/null
> > +++ b/drivers/vfio/pci/xe/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +obj-$(CONFIG_XE_VFIO_PCI) += xe-vfio-pci.o
> > +xe-vfio-pci-y := main.o
> > diff --git a/drivers/vfio/pci/xe/main.c b/drivers/vfio/pci/xe/main.c
> > new file mode 100644
> > index 0000000000000..ce0ed82ee4d31
> > --- /dev/null
> > +++ b/drivers/vfio/pci/xe/main.c
> > @@ -0,0 +1,568 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include <linux/anon_inodes.h>
> > +#include <linux/delay.h>
> > +#include <linux/file.h>
> > +#include <linux/module.h>
> > +#include <linux/pci.h>
> > +#include <linux/sizes.h>
> > +#include <linux/types.h>
> > +#include <linux/vfio.h>
> > +#include <linux/vfio_pci_core.h>
> > +
> > +#include <drm/intel/xe_sriov_vfio.h>
> > +#include <drm/intel/pciids.h>
> > +
> > +struct xe_vfio_pci_migration_file {
> > +	struct file *filp;
> > +	/* serializes accesses to migration data */
> > +	struct mutex lock;
> > +	bool disabled;
> 
> Move to the end to avoid a hole?  Unless you know mutex leaves a gap.
> Maybe also use a bitfield u8 for consistency to flags in below struct.

I'll move it and switch to bitfield u8.

> 
> > +	struct xe_vfio_pci_core_device *xe_vdev;
> > +};
> > +
> > +struct xe_vfio_pci_core_device {
> > +	struct vfio_pci_core_device core_device;
> > +	struct xe_device *xe;
> > +	/* PF internal control uses vfid index starting from 1 */
> > +	unsigned int vfid;
> > +	u8 migrate_cap:1;
> > +	u8 deferred_reset:1;
> > +	/* protects migration state */
> > +	struct mutex state_mutex;
> > +	enum vfio_device_mig_state mig_state;
> > +	/* protects the reset_done flow */
> > +	spinlock_t reset_lock;
> > +	struct xe_vfio_pci_migration_file *migf;
> > +};
> > +
> > +#define xe_vdev_to_dev(xe_vdev) (&(xe_vdev)->core_device.pdev->dev)
> > +
> > +static void xe_vfio_pci_disable_file(struct xe_vfio_pci_migration_file *migf)
> > +{
> > +	mutex_lock(&migf->lock);
> > +	migf->disabled = true;
> > +	mutex_unlock(&migf->lock);
> > +}
> > +
> > +static void xe_vfio_pci_put_file(struct xe_vfio_pci_core_device *xe_vdev)
> > +{
> > +	xe_vfio_pci_disable_file(xe_vdev->migf);
> > +	fput(xe_vdev->migf->filp);
> > +	xe_vdev->migf = NULL;
> > +}
> > +
> > +static void xe_vfio_pci_reset(struct xe_vfio_pci_core_device *xe_vdev)
> > +{
> > +	if (xe_vdev->migf)
> > +		xe_vfio_pci_put_file(xe_vdev);
> > +
> > +	xe_vdev->mig_state = VFIO_DEVICE_STATE_RUNNING;
> > +}
> > +
> > +static void xe_vfio_pci_state_mutex_lock(struct xe_vfio_pci_core_device *xe_vdev)
> > +{
> > +	mutex_lock(&xe_vdev->state_mutex);
> > +}
> > +
> > +/*
> > + * This function is called in all state_mutex unlock cases to
> > + * handle a 'deferred_reset' if exists.
> > + */
> > +static void xe_vfio_pci_state_mutex_unlock(struct xe_vfio_pci_core_device *xe_vdev)
> > +{
> > +again:
> > +	spin_lock(&xe_vdev->reset_lock);
> > +	if (xe_vdev->deferred_reset) {
> > +		xe_vdev->deferred_reset = false;
> > +		spin_unlock(&xe_vdev->reset_lock);
> > +		xe_vfio_pci_reset(xe_vdev);
> > +		goto again;
> > +	}
> > +	mutex_unlock(&xe_vdev->state_mutex);
> > +	spin_unlock(&xe_vdev->reset_lock);
> > +}
> > +
> > +static void xe_vfio_pci_reset_done(struct pci_dev *pdev)
> > +{
> > +	struct xe_vfio_pci_core_device *xe_vdev = pci_get_drvdata(pdev);
> > +	int ret;
> > +
> > +	if (!xe_vdev->vfid)
> > +		return;
> > +
> > +	/*
> > +	 * VF FLR requires additional processing done by PF driver.
> > +	 * The processing is done after FLR is already finished from PCIe
> > +	 * perspective.
> > +	 * In order to avoid a scenario where VF is used while PF processing
> > +	 * is still in progress, additional synchronization point is needed.
> > +	 */
> > +	ret = xe_sriov_vfio_wait_flr_done(xe_vdev->xe, xe_vdev->vfid);
> > +	if (ret)
> > +		dev_err(&pdev->dev, "Failed to wait for FLR: %d\n", ret);
> > +
> > +	if (!xe_vdev->migrate_cap)
> > +		return;
> 
> It seems like the above is intended to cause a stall for all VFs,
> regardless of migration support, but vfid and xe are only set for VFs
> supporting migration.  Maybe that much needs to be pulled out of
> migration_init into init_dev, which then gives the migrate_cap flag
> purpose where it otherwise seems redundant to testing xe or vfid.

Yeah - I'll remove migrate_cap and test for vfid instead.
The test for xe_vdev->vfid at the top of the function will be replaced
with check for pdev->is_virtfn, as we do want to exit early in case
xe-vfio-pci was bound to native PCI device (not VF).

> 
> > +
> > +	/*
> > +	 * As the higher VFIO layers are holding locks across reset and using
> > +	 * those same locks with the mm_lock we need to prevent ABBA deadlock
> > +	 * with the state_mutex and mm_lock.
> > +	 * In case the state_mutex was taken already we defer the cleanup work
> > +	 * to the unlock flow of the other running context.
> > +	 */
> > +	spin_lock(&xe_vdev->reset_lock);
> > +	xe_vdev->deferred_reset = true;
> > +	if (!mutex_trylock(&xe_vdev->state_mutex)) {
> > +		spin_unlock(&xe_vdev->reset_lock);
> > +		return;
> > +	}
> > +	spin_unlock(&xe_vdev->reset_lock);
> > +	xe_vfio_pci_state_mutex_unlock(xe_vdev);
> > +
> > +	xe_vfio_pci_reset(xe_vdev);
> > +}
> > +
> > +static const struct pci_error_handlers xe_vfio_pci_err_handlers = {
> > +	.reset_done = xe_vfio_pci_reset_done,
> > +	.error_detected = vfio_pci_core_aer_err_detected,
> > +};
> > +
> > +static int xe_vfio_pci_open_device(struct vfio_device *core_vdev)
> > +{
> > +	struct xe_vfio_pci_core_device *xe_vdev =
> > +		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
> > +	struct vfio_pci_core_device *vdev = &xe_vdev->core_device;
> > +	int ret;
> > +
> > +	ret = vfio_pci_core_enable(vdev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	vfio_pci_core_finish_enable(vdev);
> > +
> > +	return 0;
> > +}
> 
> Typically migration drivers are setting the initial RUNNING mig_state
> in their open_device function, are we implicitly relying on the
> reset_done callback for this instead?

We are relying on reset_done, and know that we want to make it explicit.
I'll add proper handling here and in close path.

> 
> > +
> > +static int xe_vfio_pci_release_file(struct inode *inode, struct file *filp)
> > +{
> > +	struct xe_vfio_pci_migration_file *migf = filp->private_data;
> > +
> > +	xe_vfio_pci_disable_file(migf);
> 
> What does calling the above accomplish?  If something is racing access,
> setting disabled immediately before we destroy the lock and free the
> object isn't going to solve anything.

I think we can savely remove it - IIUC, the upper layers are taking care
of the race by taking a ref as part of read/write.
I'll do that.

> 
> > +	mutex_destroy(&migf->lock);
> > +	kfree(migf);
> > +
> > +	return 0;
> > +}
> > +
> > +static ssize_t xe_vfio_pci_save_read(struct file *filp, char __user *buf, size_t len, loff_t *pos)
> > +{
> > +	struct xe_vfio_pci_migration_file *migf = filp->private_data;
> > +	ssize_t ret;
> > +
> > +	if (pos)
> > +		return -ESPIPE;
> > +
> > +	mutex_lock(&migf->lock);
> > +	if (migf->disabled) {
> > +		mutex_unlock(&migf->lock);
> > +		return -ENODEV;
> > +	}
> > +
> > +	ret = xe_sriov_vfio_data_read(migf->xe_vdev->xe, migf->xe_vdev->vfid, buf, len);
> > +	mutex_unlock(&migf->lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct file_operations xe_vfio_pci_save_fops = {
> > +	.owner = THIS_MODULE,
> > +	.read = xe_vfio_pci_save_read,
> > +	.release = xe_vfio_pci_release_file,
> > +	.llseek = noop_llseek,
> > +};
> > +
> > +static ssize_t xe_vfio_pci_resume_write(struct file *filp, const char __user *buf,
> > +					size_t len, loff_t *pos)
> > +{
> > +	struct xe_vfio_pci_migration_file *migf = filp->private_data;
> > +	ssize_t ret;
> > +
> > +	if (pos)
> > +		return -ESPIPE;
> > +
> > +	mutex_lock(&migf->lock);
> > +	if (migf->disabled) {
> > +		mutex_unlock(&migf->lock);
> > +		return -ENODEV;
> > +	}
> > +
> > +	ret = xe_sriov_vfio_data_write(migf->xe_vdev->xe, migf->xe_vdev->vfid, buf, len);
> > +	mutex_unlock(&migf->lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct file_operations xe_vfio_pci_resume_fops = {
> > +	.owner = THIS_MODULE,
> > +	.write = xe_vfio_pci_resume_write,
> > +	.release = xe_vfio_pci_release_file,
> > +	.llseek = noop_llseek,
> > +};
> > +
> > +static const char *vfio_dev_state_str(u32 state)
> > +{
> > +	switch (state) {
> > +	case VFIO_DEVICE_STATE_RUNNING: return "running";
> > +	case VFIO_DEVICE_STATE_RUNNING_P2P: return "running_p2p";
> > +	case VFIO_DEVICE_STATE_STOP_COPY: return "stopcopy";
> > +	case VFIO_DEVICE_STATE_STOP: return "stop";
> > +	case VFIO_DEVICE_STATE_RESUMING: return "resuming";
> > +	case VFIO_DEVICE_STATE_ERROR: return "error";
> > +	default: return "";
> > +	}
> > +}
> > +
> > +enum xe_vfio_pci_file_type {
> > +	XE_VFIO_FILE_SAVE = 0,
> > +	XE_VFIO_FILE_RESUME,
> > +};
> > +
> > +static struct xe_vfio_pci_migration_file *
> > +xe_vfio_pci_alloc_file(struct xe_vfio_pci_core_device *xe_vdev,
> > +		       enum xe_vfio_pci_file_type type)
> > +{
> > +	struct xe_vfio_pci_migration_file *migf;
> > +	const struct file_operations *fops;
> > +	int flags;
> > +
> > +	migf = kzalloc(sizeof(*migf), GFP_KERNEL);
> 
> GFP_KERNEL_ACCOUNT

Ok.

> 
> > +	if (!migf)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	fops = type == XE_VFIO_FILE_SAVE ? &xe_vfio_pci_save_fops : &xe_vfio_pci_resume_fops;
> > +	flags = type == XE_VFIO_FILE_SAVE ? O_RDONLY : O_WRONLY;
> > +	migf->filp = anon_inode_getfile("xe_vfio_mig", fops, migf, flags);
> > +	if (IS_ERR(migf->filp)) {
> > +		kfree(migf);
> > +		return ERR_CAST(migf->filp);
> > +	}
> > +
> > +	mutex_init(&migf->lock);
> > +	migf->xe_vdev = xe_vdev;
> > +	xe_vdev->migf = migf;
> > +
> > +	stream_open(migf->filp->f_inode, migf->filp);
> > +
> > +	return migf;
> > +}
> > +
> > +static struct file *
> > +xe_vfio_set_state(struct xe_vfio_pci_core_device *xe_vdev, u32 new)
> > +{
> > +	u32 cur = xe_vdev->mig_state;
> > +	int ret;
> > +
> > +	dev_dbg(xe_vdev_to_dev(xe_vdev),
> > +		"state: %s->%s\n", vfio_dev_state_str(cur), vfio_dev_state_str(new));
> > +
> > +	/*
> > +	 * "STOP" handling is reused for "RUNNING_P2P", as the device doesn't
> > +	 * have the capability to selectively block outgoing p2p DMA transfers.
> > +	 * While the device is allowing BAR accesses when the VF is stopped, it
> > +	 * is not processing any new workload requests, effectively stopping
> > +	 * any outgoing DMA transfers (not just p2p).
> > +	 * Any VRAM / MMIO accesses occurring during "RUNNING_P2P" are kept and
> > +	 * will be migrated to target VF during stop-copy.
> > +	 */
> > +	if (cur == VFIO_DEVICE_STATE_RUNNING && new == VFIO_DEVICE_STATE_RUNNING_P2P) {
> > +		ret = xe_sriov_vfio_suspend_device(xe_vdev->xe, xe_vdev->vfid);
> > +		if (ret)
> > +			goto err;
> > +
> > +		return NULL;
> > +	}
> > +
> > +	if ((cur == VFIO_DEVICE_STATE_RUNNING_P2P && new == VFIO_DEVICE_STATE_STOP) ||
> > +	    (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_RUNNING_P2P))
> > +		return NULL;
> > +
> > +	if (cur == VFIO_DEVICE_STATE_RUNNING_P2P && new == VFIO_DEVICE_STATE_RUNNING) {
> > +		ret = xe_sriov_vfio_resume_device(xe_vdev->xe, xe_vdev->vfid);
> > +		if (ret)
> > +			goto err;
> > +
> > +		return NULL;
> > +	}
> > +
> > +	if (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_STOP_COPY) {
> > +		struct xe_vfio_pci_migration_file *migf;
> > +
> > +		migf = xe_vfio_pci_alloc_file(xe_vdev, XE_VFIO_FILE_SAVE);
> > +		if (IS_ERR(migf)) {
> > +			ret = PTR_ERR(migf);
> > +			goto err;
> > +		}
> > +		get_file(migf->filp);
> > +
> > +		ret = xe_sriov_vfio_stop_copy_enter(xe_vdev->xe, xe_vdev->vfid);
> > +		if (ret) {
> > +			fput(migf->filp);
> > +			goto err;
> > +		}
> > +
> > +		return migf->filp;
> > +	}
> > +
> > +	if (cur == VFIO_DEVICE_STATE_STOP_COPY && new == VFIO_DEVICE_STATE_STOP) {
> > +		if (xe_vdev->migf)
> > +			xe_vfio_pci_put_file(xe_vdev);
> > +
> > +		ret = xe_sriov_vfio_stop_copy_exit(xe_vdev->xe, xe_vdev->vfid);
> > +		if (ret)
> > +			goto err;
> > +
> > +		return NULL;
> > +	}
> > +
> > +	if (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_RESUMING) {
> > +		struct xe_vfio_pci_migration_file *migf;
> > +
> > +		migf = xe_vfio_pci_alloc_file(xe_vdev, XE_VFIO_FILE_RESUME);
> > +		if (IS_ERR(migf)) {
> > +			ret = PTR_ERR(migf);
> > +			goto err;
> > +		}
> > +		get_file(migf->filp);
> > +
> > +		ret = xe_sriov_vfio_resume_data_enter(xe_vdev->xe, xe_vdev->vfid);
> > +		if (ret) {
> > +			fput(migf->filp);
> > +			goto err;
> > +		}
> > +
> > +		return migf->filp;
> > +	}
> > +
> > +	if (cur == VFIO_DEVICE_STATE_RESUMING && new == VFIO_DEVICE_STATE_STOP) {
> > +		if (xe_vdev->migf)
> > +			xe_vfio_pci_put_file(xe_vdev);
> > +
> > +		ret = xe_sriov_vfio_resume_data_exit(xe_vdev->xe, xe_vdev->vfid);
> > +		if (ret)
> > +			goto err;
> > +
> > +		return NULL;
> > +	}
> > +
> > +	WARN(true, "Unknown state transition %d->%d", cur, new);
> > +	return ERR_PTR(-EINVAL);
> > +
> > +err:
> > +	dev_dbg(xe_vdev_to_dev(xe_vdev),
> > +		"Failed to transition state: %s->%s err=%d\n",
> > +		vfio_dev_state_str(cur), vfio_dev_state_str(new), ret);
> > +	return ERR_PTR(ret);
> > +}
> > +
> > +static struct file *
> > +xe_vfio_pci_set_device_state(struct vfio_device *core_vdev,
> > +			     enum vfio_device_mig_state new_state)
> > +{
> > +	struct xe_vfio_pci_core_device *xe_vdev =
> > +		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
> > +	enum vfio_device_mig_state next_state;
> > +	struct file *f = NULL;
> > +	int ret;
> > +
> > +	xe_vfio_pci_state_mutex_lock(xe_vdev);
> > +	while (new_state != xe_vdev->mig_state) {
> > +		ret = vfio_mig_get_next_state(core_vdev, xe_vdev->mig_state,
> > +					      new_state, &next_state);
> > +		if (ret) {
> > +			xe_sriov_vfio_error(xe_vdev->xe, xe_vdev->vfid);
> > +			f = ERR_PTR(ret);
> > +			break;
> > +		}
> > +		f = xe_vfio_set_state(xe_vdev, next_state);
> > +		if (IS_ERR(f))
> > +			break;
> > +
> > +		xe_vdev->mig_state = next_state;
> > +
> > +		/* Multiple state transitions with non-NULL file in the middle */
> > +		if (f && new_state != xe_vdev->mig_state) {
> > +			fput(f);
> > +			f = ERR_PTR(-EINVAL);
> > +			break;
> > +		}
> > +	}
> > +	xe_vfio_pci_state_mutex_unlock(xe_vdev);
> > +
> > +	return f;
> > +}
> > +
> > +static int xe_vfio_pci_get_device_state(struct vfio_device *core_vdev,
> > +					enum vfio_device_mig_state *curr_state)
> > +{
> > +	struct xe_vfio_pci_core_device *xe_vdev =
> > +		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
> > +
> > +	xe_vfio_pci_state_mutex_lock(xe_vdev);
> > +	*curr_state = xe_vdev->mig_state;
> > +	xe_vfio_pci_state_mutex_unlock(xe_vdev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int xe_vfio_pci_get_data_size(struct vfio_device *vdev,
> > +				     unsigned long *stop_copy_length)
> > +{
> > +	struct xe_vfio_pci_core_device *xe_vdev =
> > +		container_of(vdev, struct xe_vfio_pci_core_device, core_device.vdev);
> > +
> > +	xe_vfio_pci_state_mutex_lock(xe_vdev);
> > +	*stop_copy_length = xe_sriov_vfio_stop_copy_size(xe_vdev->xe, xe_vdev->vfid);
> > +	xe_vfio_pci_state_mutex_unlock(xe_vdev);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct vfio_migration_ops xe_vfio_pci_migration_ops = {
> > +	.migration_set_state = xe_vfio_pci_set_device_state,
> > +	.migration_get_state = xe_vfio_pci_get_device_state,
> > +	.migration_get_data_size = xe_vfio_pci_get_data_size,
> > +};
> > +
> > +static void xe_vfio_pci_migration_init(struct xe_vfio_pci_core_device *xe_vdev)
> > +{
> > +	struct vfio_device *core_vdev = &xe_vdev->core_device.vdev;
> > +	struct pci_dev *pdev = to_pci_dev(core_vdev->dev);
> > +	struct xe_device *xe = xe_sriov_vfio_get_pf(pdev);
> > +	int ret;
> > +
> > +	if (!xe)
> > +		return;
> > +	if (!xe_sriov_vfio_migration_supported(xe))
> > +		return;
> 
> As above, ordering here seems wrong if FLR is expecting vfid and xe set
> independent of support migration.
> 
> > +
> > +	ret = pci_iov_vf_id(pdev);
> > +	if (ret < 0)
> > +		return;
> 
> Maybe this is just defensive, but @xe being non-NULL verifies @pdev is
> a VF bound to &xe_pci_driver, so we could pretty safely just use
> 'pci_iov_vf_id(pdev) + 1' below.  Thanks,

It's a result of a review feedback from previous revision, but in that
revision xe_sriov_vfio_get_pf() helper didn't exist. I'll use it
directly below.

Thanks,
-Michał

> 
> Alex
> 
> > +
> > +	mutex_init(&xe_vdev->state_mutex);
> > +	spin_lock_init(&xe_vdev->reset_lock);
> > +
> > +	/* PF internal control uses vfid index starting from 1 */
> > +	xe_vdev->vfid = ret + 1;
> > +	xe_vdev->xe = xe;
> > +	xe_vdev->migrate_cap = true;
> > +
> > +	core_vdev->migration_flags = VFIO_MIGRATION_STOP_COPY | VFIO_MIGRATION_P2P;
> > +	core_vdev->mig_ops = &xe_vfio_pci_migration_ops;
> > +}
> > +
> > +static void xe_vfio_pci_migration_fini(struct xe_vfio_pci_core_device *xe_vdev)
> > +{
> > +	if (!xe_vdev->migrate_cap)
> > +		return;
> > +
> > +	mutex_destroy(&xe_vdev->state_mutex);
> > +}
> > +
> > +static int xe_vfio_pci_init_dev(struct vfio_device *core_vdev)
> > +{
> > +	struct xe_vfio_pci_core_device *xe_vdev =
> > +		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
> > +
> > +	xe_vfio_pci_migration_init(xe_vdev);
> > +
> > +	return vfio_pci_core_init_dev(core_vdev);
> > +}
> > +
> > +static void xe_vfio_pci_release_dev(struct vfio_device *core_vdev)
> > +{
> > +	struct xe_vfio_pci_core_device *xe_vdev =
> > +		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
> > +
> > +	xe_vfio_pci_migration_fini(xe_vdev);
> > +}
> > +
> > +static const struct vfio_device_ops xe_vfio_pci_ops = {
> > +	.name = "xe-vfio-pci",
> > +	.init = xe_vfio_pci_init_dev,
> > +	.release = xe_vfio_pci_release_dev,
> > +	.open_device = xe_vfio_pci_open_device,
> > +	.close_device = vfio_pci_core_close_device,
> > +	.ioctl = vfio_pci_core_ioctl,
> > +	.device_feature = vfio_pci_core_ioctl_feature,
> > +	.read = vfio_pci_core_read,
> > +	.write = vfio_pci_core_write,
> > +	.mmap = vfio_pci_core_mmap,
> > +	.request = vfio_pci_core_request,
> > +	.match = vfio_pci_core_match,
> > +	.match_token_uuid = vfio_pci_core_match_token_uuid,
> > +	.bind_iommufd = vfio_iommufd_physical_bind,
> > +	.unbind_iommufd = vfio_iommufd_physical_unbind,
> > +	.attach_ioas = vfio_iommufd_physical_attach_ioas,
> > +	.detach_ioas = vfio_iommufd_physical_detach_ioas,
> > +};
> > +
> > +static int xe_vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > +{
> > +	struct xe_vfio_pci_core_device *xe_vdev;
> > +	int ret;
> > +
> > +	xe_vdev = vfio_alloc_device(xe_vfio_pci_core_device, core_device.vdev, &pdev->dev,
> > +				    &xe_vfio_pci_ops);
> > +	if (IS_ERR(xe_vdev))
> > +		return PTR_ERR(xe_vdev);
> > +
> > +	dev_set_drvdata(&pdev->dev, &xe_vdev->core_device);
> > +
> > +	ret = vfio_pci_core_register_device(&xe_vdev->core_device);
> > +	if (ret) {
> > +		vfio_put_device(&xe_vdev->core_device.vdev);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void xe_vfio_pci_remove(struct pci_dev *pdev)
> > +{
> > +	struct xe_vfio_pci_core_device *xe_vdev = pci_get_drvdata(pdev);
> > +
> > +	vfio_pci_core_unregister_device(&xe_vdev->core_device);
> > +	vfio_put_device(&xe_vdev->core_device.vdev);
> > +}
> > +
> > +#define INTEL_PCI_VFIO_DEVICE(_id) { \
> > +	PCI_DRIVER_OVERRIDE_DEVICE_VFIO(PCI_VENDOR_ID_INTEL, (_id)) \
> > +}
> > +
> > +static const struct pci_device_id xe_vfio_pci_table[] = {
> > +	INTEL_PTL_IDS(INTEL_PCI_VFIO_DEVICE),
> > +	INTEL_WCL_IDS(INTEL_PCI_VFIO_DEVICE),
> > +	INTEL_BMG_IDS(INTEL_PCI_VFIO_DEVICE),
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(pci, xe_vfio_pci_table);
> > +
> > +static struct pci_driver xe_vfio_pci_driver = {
> > +	.name = "xe-vfio-pci",
> > +	.id_table = xe_vfio_pci_table,
> > +	.probe = xe_vfio_pci_probe,
> > +	.remove = xe_vfio_pci_remove,
> > +	.err_handler = &xe_vfio_pci_err_handlers,
> > +	.driver_managed_dma = true,
> > +};
> > +module_pci_driver(xe_vfio_pci_driver);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Michał Winiarski <michal.winiarski@intel.com>");
> > +MODULE_DESCRIPTION("VFIO PCI driver with migration support for Intel Graphics");
> 
