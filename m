Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B1ED07B81
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:09:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9023810E393;
	Fri,  9 Jan 2026 08:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xb4p6837";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41BE10E393;
 Fri,  9 Jan 2026 08:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767946137; x=1799482137;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RWY5Bj9TzyyB1wNqkullHmStOnZeWrMd45das/ZkjvM=;
 b=Xb4p6837FkEurWE/tG0rHB61Q9ObAt+BD46jU0tD14rVeejNfzfCx3s3
 d/M55CM5T8z2I29byaSGTkjImD7sYtgE10ov05Ec1z/HNPbRkYEsi2lq+
 13ktketGBiY/qYHHKoFtWUtprH/10ns6JIX+jFhrOqrBDwlsJsfYVzG2h
 ALA5magLg8GLA+9Qmc9586nN7oBkLt1J9/figg0Ab+lByLlqjMb1dC68q
 E+kwo4WIPIRnPCbYc2CaOEAm8PNhqkqk1uDbHzWdi/EplhDD3HLsxdRDj
 ZVyUAn8g3QVE/up+vxOE8WZTesiluas+6FyGiaXnDQ7/5EtqCD4Vw4Kqd A==;
X-CSE-ConnectionGUID: 2MwYEDRHSaemhLviBgcOvg==
X-CSE-MsgGUID: XfTd1r1FSy+XRbx/0UCGrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80693012"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="80693012"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:08:57 -0800
X-CSE-ConnectionGUID: ORiOmslpTNiLc5cYNXnvnw==
X-CSE-MsgGUID: GS5bu+KXSnqDmw2zKXHWkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="207556792"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:08:56 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 00:08:55 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 00:08:55 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 00:08:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmLi9NmI+dNl3WSNWjPS2k2jDrCm+DbyYhnkK/rqkZo5y6NAsBe7dgSvDWA/ir6BGvjblMNecjpA4N9Jdip0tgC39BUFpvUYGv6rlpKsdjbAqXrN+3qAEHyz/QduimcHokdPTRS4l/5JCRlXACJZYZa0GCyXp1smxViXMlYvSlC7405xoytSXIAM8MgjBunOKfyHqVs6ADBAMtFV7B/1HUQIqddCfBshC5cWZS1bKHKYU59GFWlWChxErF8Fa2fGkzqHLFnOg6qZGKPSSwJ/2PRqHIEcQtWcjSGF3T8juazTBj4HXwy6u5gu8HR+H8G00wJrFSqhCuBvKB4Dty9EXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3j/hl1yFTUYlNMJjWvpyVkb0LNKV3eGXSqWgyzLYJfk=;
 b=dkKpmWc8ZsRyB94yjqf5Z3U9ijIcnfy6MVWXJyG8RrHZkawcQBJ+ofitn1u7/QvRr3iN79FOcV6mEnYhq8sHas5RCUUrbdEGmnSN/T0P6MSAO1xp0COJozuFB6sm8bcs9C3pMO0DeaesUcukq/3GZNqcwGzAP9oglu9jI/42JRYhBVLAazGmrvrwtz9rKXq3ndxArlWIAGK7GDY0tfowLEC7tfT0hRiQmP3WSHIeYyUk2Xp/h7zuVQGtS55w/1HpiqV21lhh85VHJZWQfKFPzXRvBPeywzWVPowoeR5YP7zfNaK+wlAdmZJMcBjdfFzlkG3APc4Ild3IeGi/62Xsvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB5952.namprd11.prod.outlook.com (2603:10b6:510:147::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.4; Fri, 9 Jan 2026 08:08:54 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 08:08:54 +0000
Message-ID: <ac78c819-51ce-4a6b-a5c8-1f327d1d8a7e@intel.com>
Date: Fri, 9 Jan 2026 13:38:44 +0530
User-Agent: Mozilla Thunderbird
From: Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH v3 2/4] drm/xe/xe_drm_ras: Add support for drm ras
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>
References: <20251205083934.3602030-6-riana.tauro@intel.com>
 <20251205083934.3602030-8-riana.tauro@intel.com>
 <aTfcV5nb_vBOOBvP@black.igk.intel.com>
Content-Language: en-US
In-Reply-To: <aTfcV5nb_vBOOBvP@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0098.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::18) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB5952:EE_
X-MS-Office365-Filtering-Correlation-Id: ac7b79be-d76a-4d76-fb57-08de4f56547e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmJNMGNaQmFScURjNHQ1Z0orN1VFYXA1MVFuM3UwZ1Q4Uk5qMThXdzRHT3Ax?=
 =?utf-8?B?L2tESEtRTVlvV294djNSbWF6M0IxV1d3eUc5QjBwKzlzYmpMMU1QSk1KUGsv?=
 =?utf-8?B?WmZnRE5LODdZZ3dkaStmMHdIYjNuNXJHVnNFdGJGU0xpRnczdnFPbjJYckRC?=
 =?utf-8?B?SXNiODVwT2xFQWRXTUhRTjlOSTdjZnQ5OWVCWStJSlVnQ1FlOEs0bWYwYU5X?=
 =?utf-8?B?NlM1YWFWcnZNc2hFc296OTlSdDFrOHRsbWZLR2JPSWVOendFUDAxeW4zM1FZ?=
 =?utf-8?B?MzFHaVdNOGNNbHdpQUI1ZXllSDBhTEtpblJ1bXlONlpKY0ZKSHZ1UVVmS2c0?=
 =?utf-8?B?ZldTZ1M2SHBTblJMTEN4M0Y3M213LzhkNzZ3a2RZci9VeFJ6RnhyVE80M25i?=
 =?utf-8?B?ZEgxTlRFWDE1b0xyZFo4MkZldDFneUVSNTdoVXhObHhtQWhkcTRwblVmOVkw?=
 =?utf-8?B?VkJPZlV5b3FzZGNiRTU4RFRuQkFIMmlpVjIwemY5Wi93elZBeXRpRGFPcmN1?=
 =?utf-8?B?VVF3R3hjVlJvNnMweWNFOGRidlZvSkt1WkV5UDN5Kzh4N2VBeTFuS0dCTnVv?=
 =?utf-8?B?RTNKTjRTeWRhUFV1b2VaeHJjMlNsb3R2MWloWmx3ZHhRUm02cmNpU0ZtWlhD?=
 =?utf-8?B?SEIxaFJjVFhjTzNGUEk1SWN3Zmh4RWpZejgvQWVTZWd5YVJ1emFYbkFFamVQ?=
 =?utf-8?B?SVVZSHc1SS9UUFlZZzRPRjZzRGhvZnNmSUVaM2UzTU1MVVFscjZrV3RMOEVH?=
 =?utf-8?B?RlVEZmpEa1BwUmJROFF3emxNSFRVVW1IejB1bVYwWHNrTUhyYWxTdUdaUlUr?=
 =?utf-8?B?bHZHcHpwdE5NRkd1bGtBL2dsc3IzNXo5aVQ0N2ZzUCtWUGNKbGdvZzJPeFNx?=
 =?utf-8?B?U0dBUkRFdS9JY214ZTJNdjNwQ2d4eUtxcDhBL0taa0hlL0dZTzZnbkg0bzdZ?=
 =?utf-8?B?ZGU2TWpDaFFVeUxWYWU5Y3RxOXM2NklLcVlPTlZjSmFTc1prQmo5REhBSDMz?=
 =?utf-8?B?cE9SWmpvYnl2VzFLemF3Y1hZMnN4TUxjYzZlOXRtcWRBd252NExzSGNTMWNK?=
 =?utf-8?B?dmpTdzlWSndqcitJcDlKV05QOGJLTTNqUVZKNnVjR1praHlFcHpIMVhVdGo0?=
 =?utf-8?B?NGV2dmZSVjZhcG1IaG54Q2JIVlJtYSt4S1JpQXJibDAwby9yWlVxbmd6NkZ1?=
 =?utf-8?B?UGtieFBXbTRhOUdoVkVraFMvSGN4SmJsSWF1Z3BGdWNuQWswaTN2L1o0cHJU?=
 =?utf-8?B?S21IcXhWb2JBUDhHejVORnVva0dXRjd1aXUzRjhPRjhLWTU5WmlGa2U5cmtD?=
 =?utf-8?B?eEJ1eU1Vb1Nkd3E4ejJERm5CN3huTTMxYktDRzZCWDRXdjU5MTFGTVVEMmJh?=
 =?utf-8?B?Q2RVWnU4ejdsRU1nOXNFeThobi9wazVSMCsyQmwvTGlxVlhnMlFWSS9wMlJT?=
 =?utf-8?B?ZmcwaDlVcWdQNUo2VTYwbWgwYittQVZUY0dRak5NTm80ckQ3SXJoY3Fwait2?=
 =?utf-8?B?L1BJV1hEdWN1Zk9jaUJwLzk5SjBZdEs3SE9zMVdVSnErQTZucWlXM0RCTVdv?=
 =?utf-8?B?UXZ4Qm1lN3RsdmJWaHpHdXpJRytvSktlWHN5d2dhZWQ3OUxoTHdqQkl6alBF?=
 =?utf-8?B?RTZpNW01Z3FyYW1qM1ZqN3UrU0RjY1ZwZ1EzS05Tdkpwd0E1WFhnb3BTVVhp?=
 =?utf-8?B?MnQwak9JaStOeEo1NUlyNmIrNE8rTnlXQXlZVm5GZE15QWRmWEp0eDJQYkVG?=
 =?utf-8?B?ZWQxR3RCTW16YS9INnZOc1o3WCtoZEdnbUdOQ0lWYWpoV0JyVW1SdmkyOEg2?=
 =?utf-8?B?YmloUDg5aWV4YVRtOHZ6L0JlY05abXI4SlRIRG9vYWZsTEdmNlphYlQzZWl6?=
 =?utf-8?B?QytGaHZYVnJlSDQ0YWdIVFlPZGhOOUVLNGROL1BPeXlWSlNuRUd4dXowanoy?=
 =?utf-8?Q?RKuaEHR41T0Aucumre5BsUPph2nzR2g4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3R0N3pydnBSNEt5T3VQSUNTaGIrUndrZzZLMlM1WkltYU1OdW5yVzhJeEg1?=
 =?utf-8?B?RGY3TDZ4eEU1OEJORXNKTFdXWkJpK0RUMjJDaUtFSWVyeDRJZ2RremV4WGdH?=
 =?utf-8?B?NUYrZEFOTks0ZWFZOW1jNWdGMGNrZlpJK2hiREgrYVFtd04zOER6emFrRG5G?=
 =?utf-8?B?Si9hdG9GQis1L0hTb3ZpVXdxOXhlYmpoWjhVR0VRWEFuNVVOMTYvYlZHL3pW?=
 =?utf-8?B?RHA4bjZmckhoYkVtOXVvNnZ4K2FFS280OWc0bG01a2VLN1M3cW1OY0lETUN1?=
 =?utf-8?B?MHJlT3ZwMjNhZXVjbmt2STNMOGovSlFTNmNwY2hLb2F1dm1BYTVCUGcyNkRE?=
 =?utf-8?B?RlMwaWs1RVNYM01pU3czZlEreVdXYXlXSmRsSlNtTjFRc2pHYk1heU1weURE?=
 =?utf-8?B?azR0d0orRUxkcnRaQUplUWtDUS9PKzd1Q3cxS3JyMkZKSGVEWWlQbkJ0TE9p?=
 =?utf-8?B?Nm5lRVkrOVBQRm9YRjFpNnZFVTZLUG41dWNWZStKaDBZMHZwbzVsajFWVm1B?=
 =?utf-8?B?TmpxZldoMWdUWjFiVXNFTWg4UDIybVhuMmcvMlpOOTdnOHdubW9INXNwMjN2?=
 =?utf-8?B?YUg1V0U3MDhXWkZidmlpdHFCcGdaM3dyQUYwMTd6MVZLV29oRlQ2TzJzL3RX?=
 =?utf-8?B?NlpNVWkwSmZnYkIxQmhqWDV2dldGMG5FdnhhWGJHUGMxNUxON09CTlZyeHF5?=
 =?utf-8?B?MjJUYjBpNzdSMG01VnQvMVRIaFM1OEdoSmE2Z0Z2YjlIQkxKSDJTZ0RRb09i?=
 =?utf-8?B?ek0xcjl6dUUvd29RZXdlZW91eDI2L3kxL2dMTXp0cS9LNGtNc3R4ZUVMWnU4?=
 =?utf-8?B?ZUhHbDlEdGxTaWdDNlFJK2k0N2tNM2ZValZRbk5KRS9LcGlpcWxILzY3Z1VI?=
 =?utf-8?B?ZUpFT050WERwQldjSlU2WGlHY3ZweExQQU0vUmg2YjRaMk0vNnFoelByRVBX?=
 =?utf-8?B?YTlKS3ZhNUc3RkwxR3BJODdWYjYxYXFyZEVQaGNoSGpuejY1eFFCWWxKdnFP?=
 =?utf-8?B?NHMxNFl6c3dIMDhQTE1tNkpyeDFCU3JGTUFOWG9BTmdUU1p2SlpiWjVEdHFm?=
 =?utf-8?B?UEY0UDJtU0YrV3k4c29tUUhuYWs5dDFzdDd3T3JDeUlzS1NjVTMvS2NwcGkx?=
 =?utf-8?B?TTZ1NDVkOEZpdlY2elZWcnIwMVFhS05qMDBiYkpHQndYUXQ1OExES1h3NVlx?=
 =?utf-8?B?bGZHMmJuaUExMXQzVnpVci9sSS9SY2lLSVNCSXdSNDRjT3BJL2o0elVBYm1h?=
 =?utf-8?B?MjkxdnVHVTc3V3JKcDNBWHNyUEEvZExTYTk1U3ozNXZ1M0ZVQXl6c1lQZ2g2?=
 =?utf-8?B?b3JVazVvckFYSkE0QWVNSVRBNjNqL0szaGFFa2xaUnFTM015bDRpMGJhQTUz?=
 =?utf-8?B?QkdMNkZjUzB3L0JwZTZMN0hLenpPVDhnYjhVYXdGaVJZK0R0dlQ4TnlxSEIr?=
 =?utf-8?B?eEtnY0kzTk5yTmV5TXNCeTRQa3hjbTFmVmlhQnhzbk9xNTFlY29jY2NpSUwz?=
 =?utf-8?B?clUxUEpKa1pCb1grWnUxMEtjdTZiVnFEN2FFZHBhNzVxeEZ5VGMvTlg2bXhn?=
 =?utf-8?B?S3h1anRndVRMeG13SUhwK0dnZXRsM0pEZVRjd1J6OHU4OFQ4VVFFRXRRa1Ja?=
 =?utf-8?B?T0pxdmhTdHppKzR6ajVGQTJtbWhCR1ZuTWplRjQ3RjVKK0habkFjN1Q2TFBz?=
 =?utf-8?B?aXo3Z2FRTE92WUtKejlQcG1iZ1VtUVFxSUJrdVpzWFV0cXJ2MEZaTmhsTTdm?=
 =?utf-8?B?VGljSTJnSWV4eTJnN3ByV0xhNEdMMGhyTS9HTjJxUGhERFJzSDVTY2FkbTlx?=
 =?utf-8?B?dUVtSzJzUlBsNUdZalRCajBTWnZpNm1peGJZYVh1d2h3K0lMRjIxbXRBOFNu?=
 =?utf-8?B?T0t5N1VQMjBYU21vMVZ2cDlJb3BUbnNNV2IyRlUyY0pNVWVHdkZGb2hPOWMy?=
 =?utf-8?B?Z1YwMmsvN3JNSkhvY2k3bUhnbmNSMFcwRVBkYTM3Qkg4U3dSSUhYWHo4RjdH?=
 =?utf-8?B?OUxySTIzQUM4VUZLUVVJdzFqK3NqUno4NVgvTkV0NEJudlk4dUh6bEs0d21z?=
 =?utf-8?B?ZVNidzRCN3JWWUNkVmNiVXBGcURqajBFTmx3U3I2TVVEa1dML0dJd3hOUTRl?=
 =?utf-8?B?a0hqbmt6TGFxZVkrYi9tNElwb0pZZVpYUDZkWHBodTEvck5hVVVITjdIR0o4?=
 =?utf-8?B?ai9UTExDSVVYWEgxUUlNR25USnppNXZPY1N4WnJzZXc0czdPNjU2Zms5MHpn?=
 =?utf-8?B?RFlKVVBjcWtnK0luZlEyUWVQandkRXk4U3hXSk4waWFlMFY0MHFuZXRCblRi?=
 =?utf-8?B?bUNqN1JoYVFjMUJvMjJLbDRjbGsxbXYwb1RYbFloVkNWbm9CejBZdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7b79be-d76a-4d76-fb57-08de4f56547e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 08:08:53.9946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEqpHiGdeZm0gmDA7hlMCMI8GIYkNLFPOiq0X+0vvhbOZg/GlVgpfiBsTNIkWguaYHTfeYETOOpFN/KKj1K8qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5952
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

Hi Raag

Thank you for the review

On 12/9/2025 1:52 PM, Raag Jadav wrote:
> On Fri, Dec 05, 2025 at 02:09:34PM +0530, Riana Tauro wrote:
>> Allocate correctable, nonfatal and fatal nodes per xe device.
>> Each node contains error classes, counters and respective
>> query counter functions.
>>
>> Add basic functionality to create and register drm nodes.
>> Below operations can be performed using Generic netlink DRM RAS interface
>>
>> List Nodes:
>>
>> $ sudo ynl --family drm_ras  --dump list-nodes
>> [{'device-name': '0000:03:00.0',
>>    'node-id': 0,
>>    'node-name': 'correctable-errors',
>>    'node-type': 'error-counter'},
>>   {'device-name': '0000:03:00.0',
>>    'node-id': 1,
>>    'node-name': 'nonfatal-errors',
>>    'node-type': 'error-counter'},
>>   {'device-name': '0000:03:00.0',
>>    'node-id': 2,
>>    'node-name': 'fatal-errors',
>>    'node-type': 'error-counter'}]
>>
>> Get Error counters:
>>
>> $ sudo ynl --family drm_ras  --dump get-error-counters --json '{"node-id":1}'
>> [{'error-id': 1, 'error-name': 'Core Compute Error', 'error-value': 0},
>>   {'error-id': 2, 'error-name': 'SOC Internal Error', 'error-value': 0}]
> 
> Minor bikeshedding: Is there anything like 'SOC External'? If not, perhaps
> simply 'SOC' would be sufficient.

Agree. SoC should be sufficient

> 
>> Query Error counter:
>>
>> $ sudo ynl --family drm_ras --do query-error-counter  --json '{"node-id":1, "error-id":1}'
>> {'error-id': 1, 'error-name': 'Core Compute Error', 'error-value': 0}
> 
> One more (sorry): So this means graphics will be a different id? Or do they
> overlap? How does it work?
> 

Did not get this question.

> 
> Also,
> 
> [*] I'm not much informed about the history here but the 'error' term
> seems slapped onto almost everything. We already know it's RAS so perhaps
> we add it only where make sense and try to simplify some of the naming?

Let's keep the errors in the node-names. Removing it from error-name 
should be okay. Wil fix ths


> 
> ...
> 
>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
>> new file mode 100644
>> index 000000000000..764b14b1edf8
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
>> @@ -0,0 +1,199 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +#include <drm/drm_ras.h>
>> +#include <linux/bitmap.h>
>> +
>> +#include "xe_device.h"
> 
> This inherits some of the debt that should not be there, so let's try to
> get away with xe_device_types.h where possible. But please double check.
> 
>> +#include "xe_drm_ras.h"
> 
> ...
> 
>> +static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe,
>> +							     int count)
>> +{
>> +	struct xe_drm_ras_counter *counter;
>> +	int i;
>> +
>> +	counter = drmm_kzalloc(&xe->drm, count * sizeof(struct xe_drm_ras_counter), GFP_KERNEL);
> 
> Why not drmm_kcalloc()? We get a bonus overflow protection.

Will check

> 
>> +	if (!counter)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	for (i = 0; i < count; i++) {
>> +		if (!errors[i])
>> +			continue;
>> +
>> +		counter[i].name = errors[i];
>> +		atomic64_set(&counter[i].counter, 0);
>> +	}
>> +
>> +	return counter;
>> +}
>> +
>> +static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
>> +			      const enum drm_xe_ras_error_severity severity)
>> +{
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	int count = 0, ret = 0;
> 
> Redundant initializations, also why do we need them?

redundant code from previous rev. Will remove

> 
>> +	count = DRM_XE_RAS_ERROR_CLASS_MAX;
>> +	node->error_counter_range.first = DRM_XE_RAS_ERROR_CORE_COMPUTE;
>> +	node->error_counter_range.last = DRM_XE_RAS_ERROR_CLASS_MAX - 1;
>> +
>> +	ras->info[severity] = allocate_and_copy_counters(xe, count);
> 
> This looks like count should be derived from first and last, or did I
> miss something?

assigned it directly. Can be done

> 
>> +	if (IS_ERR(ras->info[severity]))
>> +		return PTR_ERR(ras->info[severity]);
>> +
>> +	switch (severity) {
>> +	case DRM_XE_RAS_ERROR_CORRECTABLE:
>> +		node->query_error_counter = query_correctable_error_counters;
>> +		break;
>> +	case DRM_XE_RAS_ERROR_NONFATAL:
>> +		node->query_error_counter = query_non_fatal_error_counters;
>> +		break;
>> +	case DRM_XE_RAS_ERROR_FATAL:
>> +		node->query_error_counter = query_fatal_error_counters;
>> +		break;
>> +	default:
> 
> Do we need this?

yes.

> 
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
> 
> Redundant initialization. Also, ret belongs to the loop below.
> 
>> +	device_name = kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
>> +				pci_domain_nr(pdev->bus), pdev->bus->number,
>> +				PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
>> +
>> +	for (i = 0; i < DRM_XE_RAS_ERROR_SEVERITY_MAX; i++) {
> 
> We could potentially have a nice for_each_error_severity() now ;)

Sure. Will check. If its used in multiple places then its worth having a 
helper

> 
>> +		struct drm_ras_node *node = &ras->node[i];
>> +
>> +		node->device_name = device_name;
>> +		node->node_name = error_severity[i];
>> +		node->type = DRM_RAS_NODE_TYPE_ERROR_COUNTER;
>> +		node->priv = xe;
>> +
>> +		ret = assign_node_params(xe, node, i);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = drm_ras_node_register(node);
>> +		if (ret) {
>> +			drm_err(&xe->drm, "Failed to register drm ras tile node\n");
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
> 
> ...
> 
>> +int xe_drm_ras_allocate_nodes(struct xe_device *xe)
>> +{
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct drm_ras_node *node;
>> +	int err;
>> +
>> +	node = drmm_kzalloc(&xe->drm, DRM_XE_RAS_ERROR_SEVERITY_MAX * sizeof(struct drm_ras_node),
>> +			    GFP_KERNEL);
> 
> Ditto for drmm_kcalloc().
> 
>> +	if (!node)
>> +		return -ENOMEM;
>> +
>> +	ras->node = node;
>> +
>> +	err = register_nodes(xe);
>> +	if (err) {
>> +		drm_err(&xe->drm, "Failed to register drm ras node\n");
> 
> You wanted to call drm_err_probe(), didn't you ...?
> 
> Ah, not upstream yet :(
> But perhaps an opportunity worth considering.
> 
>> +		return err;
>> +	}
>> +
>> +	err = devm_add_action_or_reset(xe->drm.dev, xe_drm_ras_unregister_nodes, xe);
>> +	if (err) {
>> +		drm_err(&xe->drm, "Failed to add action for xe drm_ras\n");
> 
> Ditto.
> 
>> +		return err;
>> +	}
>> +
>> +	return 0;
> 
> ...
> 
>> +/**
>> + * struct xe_drm_ras_counter - xe ras counter
>> + *
>> + * This structure contains error class and counter information
>> + */
>> +struct xe_drm_ras_counter {
>> +	/** @name: error class name */
>> +	const char *name;
>> +	/** @counter: count of error */
>> +	atomic64_t counter;
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
>> +	struct xe_drm_ras_counter *info[DRM_XE_RAS_ERROR_SEVERITY_MAX];
>> +
>> +};
> 
> Either separate the members with blank lines or don't, but let's be
> consistent.

Will fix

> 
> ...
> 
>>   void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>>   {
>> -	enum hardware_error hw_err;
>> +	u32 hw_err;
>>   
>>   	if (fault_inject_csc_hw_error())
>>   		schedule_work(&tile->csc_hw_error_work);
>>   
>> -	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++)
>> +	for (hw_err = 0; hw_err < DRM_XE_RAS_ERROR_SEVERITY_MAX; hw_err++)
> 
> for_each_error_severity()
> 
>>   		if (master_ctl & ERROR_IRQ(hw_err))
>>   			hw_error_source_handler(tile, hw_err);
>>   }
> 
> ...
> 
>> +/**
>> + * enum drm_xe_ras_error_severity - Supported drm ras error severity.
>> + */
>> +enum drm_xe_ras_error_severity {
>> +	/** @DRM_XE_RAS_ERROR_CORRECTABLE: Correctable Error */
>> +	DRM_XE_RAS_ERROR_CORRECTABLE = 0,
>> +	/** @DRM_XE_RAS_ERROR_NONFATAL: Non fatal Error */
>> +	DRM_XE_RAS_ERROR_NONFATAL,
>> +	/** @DRM_XE_RAS_ERROR_FATAL: Fatal error */
>> +	DRM_XE_RAS_ERROR_FATAL,
>> +	/** @DRM_XE_RAS_ERROR_SEVERITY_MAX: Max severity */
>> +	DRM_XE_RAS_ERROR_SEVERITY_MAX, /* non-ABI */
> 
> This is guaranteed last member, so redundant comma.

ok

> 
>> +};
>> +
>> +/**
>> + * enum drm_xe_ras_error_class - Supported drm ras error classes.
>> + */
>> +enum drm_xe_ras_error_class {
>> +	/** @DRM_XE_RAS_ERROR_CORE_COMPUTE: GT and Media Error */
>> +	DRM_XE_RAS_ERROR_CORE_COMPUTE = 1,
>> +	/** @DRM_XE_RAS_ERROR_SOC_INTERNAL: SOC Error */
>> +	DRM_XE_RAS_ERROR_SOC_INTERNAL,
>> +	/** @DRM_XE_RAS_ERROR_CLASS_MAX: Max Error */
>> +	DRM_XE_RAS_ERROR_CLASS_MAX,	/* non-ABI */
> 
> Ditto.
> 
>> +};
> 
> Also, all of the enums share the same DRM_XE_RAS_ERROR_* prefix, so let's try
> to have distinguishable naming. Perhaps [*] would be useful here as well ;)

DRM_XE_RAS_ERROR_SEVERITY_* will cause longer names. Any suggestions?

Thanks
Riana

> 
> Raag

