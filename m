Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30AFC99F74
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 04:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8806B10E518;
	Tue,  2 Dec 2025 03:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SL9OmVo4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7F710E453;
 Tue,  2 Dec 2025 03:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764646058; x=1796182058;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GgsB7iAGLJBB94sJdWLckfw6hE75bkXrGGiYiDXTeXE=;
 b=SL9OmVo4fXWhRJUWZrMk/Ngy8PGzKEDLEC4f+Oovwv6ko8GUoHvykWY6
 pD9TUIsO23+EE8789j0DC8rKNR4QaRdpn9NG1NGYBSKkD6rg2Olnsh/cQ
 55KnzR1cykaQRP8C9KArl/XokjHP8LVmhGmEIWVu9QTA4O5vDTqYZ0LhT
 7XGviaai3c8GAYhItZlFhiiq+QrDy6dLVTsadIp1uSH0ESmM95OqeIlKu
 kYjk22F95V16TBUL9HX6a21EdMNsKCCK1QQDEKxFMNVXMZ3OSVbXSbPx6
 qEupWxkM7Pzu3Stwk7X0GbmFwDNJ2uhHwt2+/29wQCWIr5yBfFJo9p/+d w==;
X-CSE-ConnectionGUID: yty1gxvrR3y0WWXNhPuovg==
X-CSE-MsgGUID: KpOmwEL5Sim8edp2aLpqFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77231950"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="77231950"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 19:27:37 -0800
X-CSE-ConnectionGUID: Zeil0otyRKyKZF+kLapqVA==
X-CSE-MsgGUID: 8uCSQTPyS42ALDZw76Q2GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="198625662"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 19:27:37 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 19:27:36 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 19:27:36 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 19:27:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RgX8oOjtqHD1lqpoajoFHzmsHfaLpdTbj8GAjm5h3+iTBF3KyKJcWvQeGPILVlOUZ4Qr5Jrfe6fsspZDMPfqmmkSsP9ViNsCzr6BTUgneA6nRPRDazylGPwy996jh1quHdrRsZZdO3FEF2/C+9IL1ZwwEWTCaiuqmqLA6gguanCUExB1nZ8zFivnrlCU0K0ME6Pg/JncA8RK+7E79nIAb2lSwDRTcSGWDdcRkD8b3gEdhm/bSGJZj4mm/AitkCu/vQaDY8/ZPkt1s/DsXQuPbs7p2hJrM1qCl+YXVV5Po4a45X6Fq1xp47ZMCm6A7wwwYMbMuWdTA5zt6QcxYBOvvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5UcZ6f1IyA+5L8iQpneyUqbiEpNCbMJTPwp4iAYRjs=;
 b=Osd+wTB8O8c4M6Ruxd3LA12nuWdnrqXhjliPJD9YTTUZLWMbXsRUuQCthBVRQTLGQKIolDkibfckBCRAClZBSwPdogA0EK8FhvmKXZxg72gezLMs+j28IptOsDuAUYIe+Dh//9u5M+JkP7umYwfkD0x0DGJKYQevUf8dQi6YCTdy503DC2E0uZBA40FgMzszsY363kCNfjH7iBcw+gf6Of2b/2jvklBP9VnmT5JpxeAig3qSOfFhb43zkThiHM3KsERLq2x2M0AYKaWYMzsAmpI921r+qp3vw/djYXo/NoR8X54W3SSTVuswYbEGCd7eM+oDMgN0n9HC4yBXuIfpaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA0PR11MB4544.namprd11.prod.outlook.com (2603:10b6:806:92::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Tue, 2 Dec 2025 03:27:32 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 03:27:32 +0000
Message-ID: <e1e3760c-0fb0-46c1-b3e7-e1a17da71a04@intel.com>
Date: Tue, 2 Dec 2025 08:57:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/xe/xe_drm_ras: Add support for drm ras
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <lukas@wunner.de>,
 <simona.vetter@ffwll.ch>, <airlied@gmail.com>, <lucas.demarchi@intel.com>
References: <20251126143652.2843242-6-riana.tauro@intel.com>
 <20251126143652.2843242-8-riana.tauro@intel.com> <aSdLhiET8uIMg1zg@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aSdLhiET8uIMg1zg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA0PR11MB4544:EE_
X-MS-Office365-Filtering-Correlation-Id: 59c9187a-a7dd-4bc6-4f05-08de3152bac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tk5oT1lMSUVoY3pPWG5KR2d2UUlVdHZOSEYrSHdvakNJdEJoVE0rVStXdkZ4?=
 =?utf-8?B?V01kL1pVajZkRHN3ZWFiSVlPV1M3UmdsMmhNM0NtUDlOdEc3UG5EYmExV05v?=
 =?utf-8?B?cThCWTI3YTZDbndFQUVpMlo0Z1ZkQ2dKbXFheDRKOElwaUdkRDV3UUp3cDZR?=
 =?utf-8?B?MTY2enE5ZXp5OG1LZzBnL0M4Wm1rcENVaGNXNFRTb3R5R0NWcEdHMFlsbGJl?=
 =?utf-8?B?TmpvRXlyQjNCWE5ZRE4xK3JScVFqTTR6bjFUQzljZEF4Z2tKbkppWW9paFNq?=
 =?utf-8?B?OHgydk5RYnljdDUveHhvbTMvSEI4NENqK2FwSGpKYi9mK2d2RnM2ZlBNUlNq?=
 =?utf-8?B?S3QycDhKY2paMFVyTWNvaG9ueUNqL1hyb2prbzkrMVpCbi82UDlNRGFITVFE?=
 =?utf-8?B?RlVTZEQxVDVQeEhwMmV5WjBFVUdOR2lEVTAzYjloMU84QTBKNTMveURHbTNj?=
 =?utf-8?B?MFZON0dqUlJFY1lYd21jQWFKUDRYRWEvQTlGRlVucFhTaHRIcVhJNGJmb21Y?=
 =?utf-8?B?bUowUmlNeUUvc0xLM1R4M3VVUHE3SHE0ZEJsTWVWM0hYZ0tHb016VC92WCt4?=
 =?utf-8?B?bUNUOU5vNXd5ZENNQ2VoeERXOVU4WkovZkJZQ3NPb2t2bGFFR2wrVnhYdzd0?=
 =?utf-8?B?ZUhDSHBaRVVyc3cxVjJTTVFkSlU4RUJnREsyRUV1NUZuSUhUeW93bFJDRlor?=
 =?utf-8?B?RU5zR2VaMkNtNllXdEhsaHc3d0NiODR5OHBLeDJNNFhaZ1VhQ3grclB6RUsy?=
 =?utf-8?B?UHgzdEJ0b0d4eWV6NElyVmJ5UUlVd1dHZGQ4aFpiQ2NETUhocTlLMGVlM3Vr?=
 =?utf-8?B?eEIvWmdZYkZvcGhPVWdOSHRVa3hqd2ZLOWFzOGYrekxhN29JUUxtMXRodGZs?=
 =?utf-8?B?Y3p2b0xTN1pwWVpza2l0bEY2N21EVFhEdVp0ZzJtb2gwcFhIa081eTBHLzNQ?=
 =?utf-8?B?TmhWenMrNnNHaDRRNHJUU3BuM1k3RnpRb2xFVkJwTGNtZmUzd21PQ1pFSWc2?=
 =?utf-8?B?dmhUY1pDa3A2ZXhNWGpPY0xwNVNzZlFKcUppRHJISTdxaGxqTlo5Q01ObHNT?=
 =?utf-8?B?OXRZeXBrcWhGV0tLWlZ0TG9pU1g2aThPa1JnalI4aGxtQ0FHVitNZDljVmxx?=
 =?utf-8?B?RG9wbFlwcFhmdkNnT2lyY2lQdmY2clVaM2RDa0xHdUJ0cUZQM0s1R2QvTlhn?=
 =?utf-8?B?d3pBUVdpQk40WVZQeW5KcDc4M21WbnN5Syt2WXNmbmxIbmpUeHYzVzIwSUJO?=
 =?utf-8?B?a3NXVTFRWTFtdnkzclR5UnM2SE5XZ2puZGprTnkzS1J3dVg5eURrYjRqTDRo?=
 =?utf-8?B?Z2gvVWpXOTVTODBOZU5sTkFHaTNGOHBoT21TUzVscTVoL0FYU2M4OURlK01Y?=
 =?utf-8?B?aXZFNzVIRmxRUnNPUklnUHRMcGtJekI1c3g1RHJHdCs4WTVEMmFWZWppMHNW?=
 =?utf-8?B?ajhVUlpIS0g2eENyalNGZ0lxUC8xSjBHaitDSmllc2lWTlZybnU5eGRZSTh6?=
 =?utf-8?B?a0QwUUZUUVF5TFJ2VFdNZU5CNEoyWnB4Yy9NS1pRUEdiWU5laVpRSEtYR3Rv?=
 =?utf-8?B?Rk80RGtJd0N3M3BkNHFjalUybnhlWExZamlqcC9oU3V0eGlGamdXZjhpUjgz?=
 =?utf-8?B?djM2aWp2WkFYRnlXRS9aWU5FZEkzSU1HSks4WDZlOEU0Q1dYQVhiVUV6SSt1?=
 =?utf-8?B?T3Z5aXRIbDl6ZitJMmpLSTB6dHhGT3A3Mm1tbkNNc2RVODdqdkJxaHJ0QzBj?=
 =?utf-8?B?cklieWNiQ0hUemZVbjB4RW1EV2RNeGlRWWEwMnVlamJSaXNTOG4xQ2tZS0J2?=
 =?utf-8?B?NUJJbTZtNVpZeXJMTVR2c1NXN3VwVGlxeGN0aHo2MXBPR2kyZFJ6MVZFMnV5?=
 =?utf-8?B?ZzB0UzZJeVM4bFNMN0VGbGhxR2xOTlVsSVdaYmFybTB0OFFCbDJTeW9jY2pt?=
 =?utf-8?Q?IQK5EqMG0oRuT5zZikQ0MdGU2/IQO2wC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGRGOFVHMzdTdHY4Y29MSDdwWEh3bW9QY29zZ2lPNHdOQVBVWXdqcnBuakpB?=
 =?utf-8?B?empCUC9VL2hkRmRtWlF2WTF2emdZN1o0UE1rbGhBMi9VT3podmtOR1FLZllw?=
 =?utf-8?B?bEU2Z3h1L2dYZnJvdHhoeVFJRUZnQTJ1cTVLQk0rY2hIZjRtY05Oa3JIYWh2?=
 =?utf-8?B?byswYmlyK2tYTWtRN0t3SWNrS3pyTkFmRlYyU1poOUpVa1k5NFJYb3VGTVdp?=
 =?utf-8?B?S1JOazZOMVhkMFJ5eXZCaGhQZ0h0N21iYnBXK1ptcDhiSFovNVB2UHVmZFhL?=
 =?utf-8?B?WnAzTnluL0Zqc3RTVkVoaFo1ZlE2WlZNVUg4WmNmN0VqSWp2WkJUeUNhcm1S?=
 =?utf-8?B?aGdyZ3FINFl1WlB0YVoyWmZ6VXJuUzBYdVkxVGw4SVlselZ5WHF2cEJCSjE0?=
 =?utf-8?B?U2ZJTXJRYWZpMXp3dCtnYzNJL3diVzRaWjFtSzJNZmh3KzYrOU56dWZNeE5l?=
 =?utf-8?B?MEI1MmVheS9NL3VUNXczRXBFRWJlcDFkRmZRK2tCWDBObWtSU242bVd2N0dO?=
 =?utf-8?B?ZnBmaVp2K0lGRU5lMER0b3N3UDlydEtoeTFWejRscUYvRVlyRHBsbmJDSzVz?=
 =?utf-8?B?Z0Q5Rmkyank0bmJkOXZ1Q043UjlEVGpuTzdEdFN4MzBDb3N0d2xySnJwV1k4?=
 =?utf-8?B?dHdlR1o2M3J3Z1VmYitOcjJLOGdVMUlSTUpMS2M0emNIaEtMeEhFNmVMNFN2?=
 =?utf-8?B?cnpDMmdiamw3K0h0VUJ2azd0ZFBVZVcwTmp0WmJRdGhacFQ4T3p0alBsWUxP?=
 =?utf-8?B?eU5YQ1Y3UGdiQW9mVmJjUG1mQlo1ZFpsM05sem4yRU5ZTDV0dXB0VXZmL0FH?=
 =?utf-8?B?djIrbGp6NEJ1U0VMQkpmZVIxUHpZS0JjUlpIbGMwNjJtRENVNzMxTmpzODlN?=
 =?utf-8?B?c3JPOFBTNDhNY0hMNGxFZTRpMi9nbFBzTWdvd0FHL2J6YkVpRmhBbnBkYks1?=
 =?utf-8?B?aXJudWZOTkxkeHQxMUVVdkVnZi9KZVdodjcvb2V4ZmRQSk1IL3ZuOTFJcjJC?=
 =?utf-8?B?aTBSMGtwVTU0bHRWWU12aGV2MVBqWGFEaVo1Qy9jRU9IU2dCbEVSQnRhK2R0?=
 =?utf-8?B?YkpaSEhyaTVka0JRWG5QU291TWhkQzhQMDRVNE1TcFh5WWYvSTJCL1BFdjZi?=
 =?utf-8?B?YmpzeExKTEdqcDQxcFlhay9SWU10NGpRQ3oxUURibUgrNG5lS2F3anNSQU9q?=
 =?utf-8?B?S0RJem1Fdm53U29EUlFnQnFOcUhQamFsU3FVTHBFRmExWE4yN3JZZVdJRU1w?=
 =?utf-8?B?VEdpUVdFR3lRL3EvR05LZDdhTFpiWk9udG9HZDlEOUhjeklDL0NoWkhySzNR?=
 =?utf-8?B?N0hrdk9ZSUQxQjJOcjM0ZFdJTU4yTCtVbmZqWlFWeHVCQnBwOTh5OGtvWGVu?=
 =?utf-8?B?SjVSZGU4ZEl5ZUdnUWxjY1dzc0FOc3pwaFBaVGZvb05pUkxBZ1kyV2pTSCs0?=
 =?utf-8?B?OU9HNTJXYzRnL0FlOXFxbGJVdk9KNzU5akIyOWl1U3VDWkF6MGlwWEwreFJm?=
 =?utf-8?B?KzlqN05ndHZmL0huc252YjFLb2taQ0pxUFBVUWNSVFZoWlQyL3Z6RWZvdEdh?=
 =?utf-8?B?Sk5ZV2E0QnM3d1U1WWRqUHc4RHJEc2RKOXZNRUpPaFlSTEhXTm40dEEvZkpu?=
 =?utf-8?B?Z1JkYVY1ajdsR0xUMW54NEZMS1hNT1F1K2J6MG1CZWdTRWcweU5OSjFiSkVy?=
 =?utf-8?B?TGlGWEo4Q3d6MEs4RDZKQTF2Nk8vZlhjM2FjMkZ1eUhRM3lHQzF3QjdaUEJm?=
 =?utf-8?B?RXBEaStCYXpkWkVBekQ1cWNDV2E5VVdHdzg4QmlkbDd4ejU0ZTFmaVlaY3dX?=
 =?utf-8?B?azBnZS9pQmNkQVlZeHlvcEJxU3ZsVzN3dTJKS0pPT2NpL08zaG0rMEZpeXlG?=
 =?utf-8?B?TkRqdWlvMXVGR2lNL1JDWEg4TlZXVy9Jc21McERDak53Sys0V0xPUThQS3BD?=
 =?utf-8?B?bzRkQUNqTkpPdU1FRUdQQTZINlZJU2NYQjRnYzFSZEJxVlorWXd2dUxSYURC?=
 =?utf-8?B?aWJzWUdZTmlBRXFOYk5iVmhvMDd1eStMa0FYUmppMHloUnhadzNvM0xMZEN1?=
 =?utf-8?B?YzNIRC9laVZnMkdtdFpiOTJab0czcS8wT09tRFYrSm5rUGE1YWJsOENQSTFK?=
 =?utf-8?Q?uXY+7mjKYTzmopvl/7eNC1nhg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c9187a-a7dd-4bc6-4f05-08de3152bac2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 03:27:32.6953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbOQxYDY64P3jLbhTk3YU/LJrz+922mDI6sn4bwL5NWiYj8DIXmEj+JlHiyri68qkMIcg05xmx5+/nO+In+06A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4544
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



On 11/27/2025 12:18 AM, Rodrigo Vivi wrote:
> On Wed, Nov 26, 2025 at 08:06:45PM +0530, Riana Tauro wrote:
>> Allocate correctable, nonfatal and fatal nodes per xe device.
>> Each node contains error classes, counters and respective
>> query counter functions.
>>
>> Add basic functionality to create and register drm nodes.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile           |   1 +
>>   drivers/gpu/drm/xe/xe_device_types.h  |   4 +
>>   drivers/gpu/drm/xe/xe_drm_ras.c       | 221 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_drm_ras.h       |  12 ++
>>   drivers/gpu/drm/xe/xe_drm_ras_types.h |  54 +++++++
>>   drivers/gpu/drm/xe/xe_hw_error.c      |  38 ++---
>>   include/uapi/drm/xe_drm.h             |   5 +
>>   7 files changed, 313 insertions(+), 22 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_drm_ras.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_drm_ras.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_drm_ras_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index b848da79a4e1..7bc805b33e12 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -41,6 +41,7 @@ xe-y += xe_bb.o \
>>   	xe_device_sysfs.o \
>>   	xe_dma_buf.o \
>>   	xe_drm_client.o \
>> +	xe_drm_ras.o \
>>   	xe_eu_stall.o \
>>   	xe_exec.o \
>>   	xe_exec_queue.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 6ce3247d1bd8..69097e3b3995 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -13,6 +13,7 @@
>>   #include <drm/ttm/ttm_device.h>
>>   
>>   #include "xe_devcoredump_types.h"
>> +#include "xe_drm_ras_types.h"
>>   #include "xe_heci_gsc.h"
>>   #include "xe_late_bind_fw_types.h"
>>   #include "xe_lmtt_types.h"
>> @@ -353,6 +354,9 @@ struct xe_device {
>>   		bool oob_initialized;
>>   	} wa_active;
>>   
>> +	/** @ras: ras structure for device */
>> +	struct xe_drm_ras ras;
>> +
>>   	/** @survivability: survivability information for device */
>>   	struct xe_survivability survivability;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
>> new file mode 100644
>> index 000000000000..5320e845e9d5
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
>> @@ -0,0 +1,221 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +#include <drm/drm_ras.h>
>> +#include <drm/xe_drm.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_drm_ras.h"
>> +
>> +#define ERR_INFO(index, _name) \
>> +	[index] = { .name = _name, .counter = 0 }
>> +
>> +static struct xe_drm_ras_counter error_info[] = {
>> +	ERR_INFO(DRM_XE_GENL_CORE_COMPUTE, "GT Error"),
>> +};
>> +
>> +static int hw_query_error_counter(struct xe_drm_ras_counter *info,
>> +				  u32 error_id, const char **name, u32 *val)
>> +{
>> +	*name = info[error_id].name;
>> +	*val =  info[error_id].counter;
>> +
>> +	return 0;
>> +}
>> +
>> +static int query_non_fatal_error_counters(struct drm_ras_node *ep,
>> +					  u32 error_id, const char **name,
>> +					  u32 *val)
>> +{
>> +	struct xe_device *xe = ep->priv;
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras_counter *info = ras->info[HARDWARE_ERROR_NONFATAL];
>> +
>> +	if (error_id >= ARRAY_SIZE(error_info))
>> +		return -EINVAL;
>> +
>> +	if (!error_info[error_id].name)
>> +		return -ENOENT;
>> +
>> +	return hw_query_error_counter(info, error_id, name, val);
>> +}
>> +
>> +static int query_fatal_error_counters(struct drm_ras_node *ep,
>> +				      u32 error_id, const char **name,
>> +				      u32 *val)
>> +{
>> +	struct xe_device *xe = ep->priv;
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras_counter *info = ras->info[HARDWARE_ERROR_FATAL];
>> +
>> +	if (error_id >= ARRAY_SIZE(error_info))
>> +		return -EINVAL;
>> +
>> +	if (!error_info[error_id].name)
>> +		return -ENOENT;
>> +
>> +	return hw_query_error_counter(info, error_id, name, val);
>> +}
>> +
>> +static int query_correctable_error_counters(struct drm_ras_node *ep,
>> +					    u32 error_id, const char **name,
>> +					    u32 *val)
>> +{
>> +	struct xe_device *xe = ep->priv;
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras_counter *info = ras->info[HARDWARE_ERROR_CORRECTABLE];
>> +
>> +	if (error_id >= ARRAY_SIZE(error_info))
>> +		return -EINVAL;
>> +
>> +	if (!error_info[error_id].name)
>> +		return -ENOENT;
>> +
>> +	return hw_query_error_counter(info, error_id, name, val);
>> +}
>> +
>> +static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe,
>> +							     int count,
>> +							     struct xe_drm_ras_counter *src)
>> +{
>> +	struct xe_drm_ras_counter *counter;
>> +
>> +	counter = drmm_kzalloc(&xe->drm, count * sizeof(struct xe_drm_ras_counter), GFP_KERNEL);
>> +	if (!counter)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	memcpy(counter, src, count * sizeof(struct xe_drm_ras_counter));
>> +
>> +	return counter;
>> +}
>> +
>> +static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
>> +			      enum hardware_error hw_err)
>> +{
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	int count = 0, ret = 0;
>> +
>> +	count = ARRAY_SIZE(error_info);
>> +	node->error_counter_range.first = DRM_XE_GENL_CORE_COMPUTE;
>> +	node->error_counter_range.last = count - 1;
>> +
>> +	switch (hw_err) {
>> +	case HARDWARE_ERROR_CORRECTABLE:
>> +		ras->info[hw_err] = allocate_and_copy_counters(xe, count, error_info);
>> +		if (IS_ERR(ras->info[hw_err]))
>> +			return PTR_ERR(ras->info[hw_err]);
>> +		node->query_error_counter = query_correctable_error_counters;
>> +		break;
>> +	case HARDWARE_ERROR_NONFATAL:
>> +		ras->info[hw_err] = allocate_and_copy_counters(xe, count, error_info);
>> +		if (IS_ERR(ras->info[hw_err]))
>> +			return PTR_ERR(ras->info[hw_err]);
>> +		node->query_error_counter = query_non_fatal_error_counters;
>> +		break;
>> +	case HARDWARE_ERROR_FATAL:
>> +		ras->info[hw_err] = allocate_and_copy_counters(xe, count, error_info);
>> +		if (IS_ERR(ras->info[hw_err]))
>> +			return PTR_ERR(ras->info[hw_err]);
>> +		node->query_error_counter = query_fatal_error_counters;
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int register_nodes(struct xe_device *xe)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	const char *device_name;
>> +	int i = 0, ret;
>> +
>> +	device_name = kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
>> +				pci_domain_nr(pdev->bus), pdev->bus->number,
>> +				PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
>> +
>> +	for (i = 0; i < HARDWARE_ERROR_MAX; i++) {
>> +		struct drm_ras_node *node = &ras->node[i];
>> +		const char *hw_err_str = hw_error_to_str(i);
>> +		const char *node_name;
>> +
>> +		node_name = kasprintf(GFP_KERNEL, "%s-errors", hw_err_str);
>> +
>> +		node->device_name = device_name;
>> +		node->node_name = node_name;
>> +		node->type = DRM_RAS_NODE_TYPE_ERROR_COUNTER;
>> +
>> +		ret = assign_node_params(xe, node, i);
>> +		if (ret) {
>> +			kfree(node->node_name);
>> +			return ret;
>> +		}
>> +
>> +		node->priv = xe;
>> +
>> +		ret = drm_ras_node_register(node);
>> +		if (ret) {
>> +			drm_err(&xe->drm, "Failed to register drm ras tile node\n");
>> +			kfree(node->node_name);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_drm_ras_unregister_nodes(void *arg)
>> +{
>> +	struct xe_device *xe = arg;
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	int i = 0;
>> +
>> +	for (i = 0; i < HARDWARE_ERROR_MAX; i++) {
>> +		struct drm_ras_node *node = &ras->node[i];
>> +
>> +		drm_ras_node_unregister(node);
>> +
>> +		kfree(node->node_name);
>> +		if (i == 0)
>> +			kfree(node->device_name);
>> +	}
>> +}
>> +
>> +/**
>> + * xe_drm_ras_allocate_nodes - Allocate drm ras nodes
>> + * @xe: xe device instance
>> + *
>> + * Allocate xe drm ras nodes for all errors in a tile
>> + *
>> + * Return: 0 on success, error code on failure
>> + */
>> +int xe_drm_ras_allocate_nodes(struct xe_device *xe)
>> +{
>> +	struct drm_ras_node *node;
>> +	int err;
>> +
>> +	node = drmm_kzalloc(&xe->drm, HARDWARE_ERROR_MAX * sizeof(struct drm_ras_node), GFP_KERNEL);
>> +	if (!node)
>> +		return -ENOMEM;
>> +
>> +	xe->ras.node = node;
>> +
>> +	err = register_nodes(xe);
>> +	if (err) {
>> +		drm_err(&xe->drm, "Failed to register drm ras node\n");
>> +		return err;
>> +	}
>> +
>> +	err = devm_add_action_or_reset(xe->drm.dev, xe_drm_ras_unregister_nodes, xe);
>> +	if (err) {
>> +		drm_err(&xe->drm, "Failed to add action for xe drm_ras\n");
>> +		return err;
>> +	}
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.h b/drivers/gpu/drm/xe/xe_drm_ras.h
>> new file mode 100644
>> index 000000000000..6272b5da4e6d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_drm_ras.h
>> @@ -0,0 +1,12 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +#ifndef XE_DRM_RAS_H_
>> +#define XE_DRM_RAS_H_
>> +
>> +struct xe_device;
>> +
>> +int xe_drm_ras_allocate_nodes(struct xe_device *xe);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
>> new file mode 100644
>> index 000000000000..452ff9a91510
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
>> @@ -0,0 +1,54 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_DRM_RAS_TYPES_H_
>> +#define _XE_DRM_RAS_TYPES_H_
>> +
>> +#include <linux/limits.h>
>> +
>> +struct drm_ras_node;
>> +
>> +/* Error categories reported by hardware */
>> +enum hardware_error {
>> +	HARDWARE_ERROR_CORRECTABLE = 0,
>> +	HARDWARE_ERROR_NONFATAL = 1,
>> +	HARDWARE_ERROR_FATAL = 2,
>> +	HARDWARE_ERROR_MAX,
>> +};
>> +
>> +static inline const char *hw_error_to_str(const enum hardware_error hw_err)
>> +{
>> +	switch (hw_err) {
>> +	case HARDWARE_ERROR_CORRECTABLE:
>> +		return "correctable";
>> +	case HARDWARE_ERROR_NONFATAL:
>> +		return "nonfatal";
>> +	case HARDWARE_ERROR_FATAL:
>> +		return "fatal";
>> +	default:
>> +		return "UNKNOWN";
>> +	}
>> +}
>> +
>> +struct xe_drm_ras_counter {
>> +	const char *name;
>> +	int counter;
>> +};
>> +
>> +/**
>> + * struct xe_drm_ras - xe drm ras structure
>> + *
>> + * This structure has details of error counters
>> + */
>> +struct xe_drm_ras {
>> +	/** @node: DRM RAS node */
>> +	struct drm_ras_node *node;
>> +
>> +	/** @info: info array for all types of errors */
>> +	struct xe_drm_ras_counter *info[HARDWARE_ERROR_MAX];
>> +
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 8c65291f36fc..2adc2e6540f6 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -10,6 +10,7 @@
>>   #include "regs/xe_irq_regs.h"
>>   
>>   #include "xe_device.h"
>> +#include "xe_drm_ras.h"
>>   #include "xe_hw_error.h"
>>   #include "xe_mmio.h"
>>   #include "xe_survivability_mode.h"
>> @@ -17,14 +18,6 @@
>>   #define  HEC_UNCORR_FW_ERR_BITS 4
>>   extern struct fault_attr inject_csc_hw_error;
>>   
>> -/* Error categories reported by hardware */
>> -enum hardware_error {
>> -	HARDWARE_ERROR_CORRECTABLE = 0,
>> -	HARDWARE_ERROR_NONFATAL = 1,
>> -	HARDWARE_ERROR_FATAL = 2,
>> -	HARDWARE_ERROR_MAX,
>> -};
>> -
>>   static const char * const hec_uncorrected_fw_errors[] = {
>>   	"Fatal",
>>   	"CSE Disabled",
>> @@ -32,20 +25,6 @@ static const char * const hec_uncorrected_fw_errors[] = {
>>   	"Data Corruption"
>>   };
>>   
>> -static const char *hw_error_to_str(const enum hardware_error hw_err)
>> -{
>> -	switch (hw_err) {
>> -	case HARDWARE_ERROR_CORRECTABLE:
>> -		return "CORRECTABLE";
>> -	case HARDWARE_ERROR_NONFATAL:
>> -		return "NONFATAL";
>> -	case HARDWARE_ERROR_FATAL:
>> -		return "FATAL";
>> -	default:
>> -		return "UNKNOWN";
>> -	}
>> -}
>> -
>>   static bool fault_inject_csc_hw_error(void)
>>   {
>>   	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
>> @@ -146,6 +125,20 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>>   			hw_error_source_handler(tile, hw_err);
>>   }
>>   
>> +static int hw_error_info_init(struct xe_device *xe)
>> +{
>> +	int ret;
>> +
>> +	if (xe->info.platform != XE_PVC)
>> +		return 0;
>> +
>> +	ret = xe_drm_ras_allocate_nodes(xe);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>>   /*
>>    * Process hardware errors during boot
>>    */
>> @@ -178,5 +171,6 @@ void xe_hw_error_init(struct xe_device *xe)
>>   
>>   	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
>>   
>> +	hw_error_info_init(xe);
>>   	process_hw_errors(xe);
>>   }
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 47853659a705..053cbe1aafbb 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -2273,6 +2273,11 @@ struct drm_xe_vm_query_mem_range_attr {
>>   
>>   };
>>   
>> +/**
>> + * RAS Counters
>> + */
>> +#define DRM_XE_GENL_CORE_COMPUTE	(1)
> 
> The feedback we got from Joonas is that we should also make the string name
> an uAPI defined here in the header.
> I'm afraid this series is missing that part for all the patches here.
> Perhaps we should also mention this in the docs in the firs patch as well

Sure will add this. We may need mapping for node_id and node_name as well

Thanks
Riana

> 
> Other than that the series is great, thank you so much for picking that up!
> 
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
>> -- 
>> 2.47.1
>>

