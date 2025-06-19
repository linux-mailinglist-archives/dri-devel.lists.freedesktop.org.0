Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9657AADFD4B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 07:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F132F10E99F;
	Thu, 19 Jun 2025 05:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbADWuPA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D89010E99D;
 Thu, 19 Jun 2025 05:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750312418; x=1781848418;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yoeZ8N2pDbyPCuz4OyUy55CHRsh4iYGhFL3hRiCHB04=;
 b=UbADWuPAkEKxEPiYOfT4Z2EUYlJtUVetzb2JvJzvL6Q2wW+QZmTWqZSn
 HfP91hgLFEDzo1Ag6vc3LluPBtHQzNwRf4kvwEVZCmuPJ7cpYnPwBtJYV
 Oi1QUbSxAuxdFnQH74D7pS4HFM0R7hPcdHFdhfJNZqPCHmQd+hl0XuLSO
 J6Bp0ZuPbRUjlmLTrh8SGRNYm7s+esxoizer3QOgWxsiwfy3AvdjJ1BBw
 u1Z1eZWqZOiW6JCY52x1ZJh0LeBG8qxy/6sOSH5ElY3cQ/K0mP6TJ6UD/
 65IFID/nqnl7tsI8EYQ+6VTdUqh1UjnwAe4lt27Bop1wlDGzdnVmhhLKE w==;
X-CSE-ConnectionGUID: XasNV5S2TU2rQaPi/RRodA==
X-CSE-MsgGUID: 1XiO6wqsSMyu4e1euH1z7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56353393"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="56353393"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:53:37 -0700
X-CSE-ConnectionGUID: tqriIugCT3iVVW8ToPDkqw==
X-CSE-MsgGUID: lJEFS8P5RKuWu0NYIxbVOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="150713636"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:53:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:53:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 22:53:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:53:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHxhHqBljY34iDX5955jbN6YP79Md5CHeaH6+BTJbtunx1Ibi9jckDiir/t3mbfA9WpnWCHOREAtjQXmVgK55h8PkkVlLtj4vfGd0VYWDM35npQYTAuQuXHEurU/Wbmg8Lao0UmXkkbXSRJpTYMC/L8zhQBhoO+06T70ICjrkpJ/uJ7ksm1Jpb8qvJiY4ZGmVj6yRjhJFfsHRBXhsqeuXYlJ+TqFjqi6KchXXsVlj0XOr9X7JA5vK4IygPgQ4pTrSw3pgRkoOMc4+YOHWsgEb6PhVoOxvxB4br10KrERqgqI5pdE5NvWDgeGjXS2hTvFWpThdMaFE3WIEmwtrDtF/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/O3qJ1jJbX6UwozxvDIwxCbZDNSyM2c9NWkOIp6pIn8=;
 b=qy4XsS6g7YXfbYDRegXhr1KZN9Ad055vM5xZGlVz0lwUfjpfsuVM3nKhykMfDYmxFNoXqXoG/pnfzoE2y4eWJs6JFQlId/Zg2BWC4/lVySqXKpv1QeZwCrlEitpcEnFUeUS0MtVJYJjwiXAnOPHjHGX4QeCfnl/B6twjkMMc1qxE7nEmf7Go7daA0uxEdUcLTbUJwTeML2c/96wOkjAVJGZQbi0xCJ5/aE4twCyqugyCQ6sxsc924USRnN5v6740SsFJnudct3HzBExFh4aJrIS75S1OjYYIo9hegoRuDnyLt1hiI/Gexl9XwqWZFtB+bZdgujpYEm3IwbqtjysgkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by MW3PR11MB4539.namprd11.prod.outlook.com (2603:10b6:303:2f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 19 Jun
 2025 05:53:06 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 05:53:06 +0000
Message-ID: <a8d2605c-930b-4eeb-8e4a-1aa9bbfbb960@intel.com>
Date: Thu, 19 Jun 2025 11:22:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/10] drm/xe/xe_late_bind_fw: Reload late binding fw
 in rpm resume
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
 <20250618190007.2932322-7-badal.nilawar@intel.com>
 <2c4f410a-3abd-4abc-84c8-13e7e3b40a73@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <2c4f410a-3abd-4abc-84c8-13e7e3b40a73@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::7) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|MW3PR11MB4539:EE_
X-MS-Office365-Filtering-Correlation-Id: bff6e265-7b81-4804-2066-08ddaef5900c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1BMa3NMNlRzOUVidU14d05nYlR1VWI1cmpFZ2VmakY1NHpMeWtnT2tOamV6?=
 =?utf-8?B?dFpWSnVVczAwYlpwZzRKckkwUUFXWDJzaStseGYyd0FVVmRNWDBFaERodEd5?=
 =?utf-8?B?MVY4OEl4anpGck11aWFrOTdQOFUrT1pMY0YvWnhUYjhGcDBqeVNHVjB1RUpS?=
 =?utf-8?B?SFdINHh5VDcxVnl2ckNWOHFGa0NrTXBkeklwTzFGMFNsamZrQVZ5RFY1VHdP?=
 =?utf-8?B?OW9RUWkwVWhQalliVDFPR09od0NHNE55cENWNHoyRjBnclRxUVV3SmR5TnRJ?=
 =?utf-8?B?QUFTWk52N3RuUnIvR05FSTBaS3hpVjlBMmJoL25tQ05yS3RZQW9aNGVxd3RL?=
 =?utf-8?B?S0p2c0ZaSGcrR0c3V3BPVUxSbTN2ZUV6WTVRajVtbnZSNGxMUG5LVlBCSll1?=
 =?utf-8?B?M3JMZDBlSGgwOFRUUERnbXNpNFo2Vi9tWVVOaUM4ZSt2TzNvMjBBeEhKallV?=
 =?utf-8?B?MVZhQ3hCOHZzU1V4UU56amRTd3MvUEMyVFBNVlpNeFM1ZTBYK2dlRUp4TnBW?=
 =?utf-8?B?dyt1UDMvV25SWmRaUlMrak05ZHZJUXVvSHRJbjRnODJmcmxDSnJUY0FpUng2?=
 =?utf-8?B?U0RCRnU2UER3aTJqTnIxTno4Qk5TaUJhVW9UZ0dqUmYvZEF3bldRR0V1dzZZ?=
 =?utf-8?B?OVB4bU5kSzg2djFBd3FuQWtiTnNXZWJEL0RVSkI1TmFraWJ6ZEdIMUVROUdG?=
 =?utf-8?B?cVhINkZmRHFIUzNuTnFpSzAydk02ekhMWkNsU2pEdFFEVzVMbE00Y1BRcGxC?=
 =?utf-8?B?SVAyeXpQdUh4VjZ6NlBCaHpmTW01ODJ6Qk54bTNJL0pwbWt5VUNZQmJ3c2JX?=
 =?utf-8?B?SDg2N1ZUUnMzckpjTnJVb1FCNFo5MTh6MW93YXNoZXRRMitsTm9tWHcwY2Ex?=
 =?utf-8?B?Q09OQU5kWk1RbFAwRkFKaDFrdGE2QmRnT1RiYXpvZ3JzU2p3aURDcXNWejEy?=
 =?utf-8?B?TThxUmZVWWZ3MG8rQUJxK2RUTVpvUnVobkxIV01GTkxHanlxcEUvcHgvZXVB?=
 =?utf-8?B?RlIzVkF6N0sxc2NjWWFFNFNjVDRqNEdoL25GblgxdDJrblZhYWVsc3kybVR6?=
 =?utf-8?B?QWUrTHF2amR5eXpGbk50OWM1ZFNzV1JrYk53WHVybEg1a2Y3Vko0Sjl2ckpz?=
 =?utf-8?B?YVNGbW1HZExsUzNDSG01YzE4ZVhMa1hBWFlRVldKdGYwVmlKbzd4YlVEMDlw?=
 =?utf-8?B?NUp6dTcyMzh4dm4zbjliMk1tc295RWQxOEc2YXhMVVdTZjRXd3RwY1plYTFG?=
 =?utf-8?B?UytCQnhGUkpoQjhDU0RseU9jMjBlSHM4c0RQWmF1OUh2YUNJMGhrMlEyNEdk?=
 =?utf-8?B?RGZrclNhSmNEdzB1bEVUcmVFcVVnZVV1MjVaOG9SbHNxelNISTB5RmZVZjN6?=
 =?utf-8?B?aWJPd2U1M1V4NTQyT1Z6SEtYbERqMW5STlVONlhtREFMU3pmdk5IZTZZOHYr?=
 =?utf-8?B?OEVTSUlXQlFKRlRaZW5wZklPM29NYUhxdmFHaW1jeGtTNHBMdG9qZU1ZRVNU?=
 =?utf-8?B?UGFGSVJLZVlqWGlRYWtMNUU2QXBnb1J3WDM3blF2WWUvbWhNRlJQdUxCMjgy?=
 =?utf-8?B?cU5sSnNvQVgzcVYzeGtTcXNjZUErVWdZb0xvMzlKajB5anJodGtDdXU0c3Rr?=
 =?utf-8?B?OEFxdGZXSyswR1ZqL3owSFV0eGFnL2VoK1BNSktzTW4vVDlMVnNVcXIxdDBZ?=
 =?utf-8?B?N0dWbWRKMGdlZmRrU2JmS3ZrbUJIbm4vN1gxWGVERDc0VWVWSkJvZUx5aWE2?=
 =?utf-8?B?SE5qNGxyUzZqcXo2dXRQdmlWODh5WUVyUEhYb3dqQ2hINHBNa0VxMlFSNWJC?=
 =?utf-8?B?TTZTdkZwMFpETFU4MzRSQVVadXJWRnUrdEIrT0QvZXRlSlpNRHlqMllubW5W?=
 =?utf-8?B?Z2xIaVQ1MFc1WkhSaHhGZmhMb3JlRnNvbXpFanVZbERQbG1jMk9tSWtjcVli?=
 =?utf-8?Q?IwKu+T2E9Lg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5536.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFpWelUwRW8rLzdGeldTZTRZZmE2c29FaVlKTnBSaTBxcnhEMnNqSitEMFpS?=
 =?utf-8?B?WDRPR3QzWjh0dFFVeUVXaC9hdHhTT0ExTEE5Y3pWb2hLalBDZ3FuUGV3WjRk?=
 =?utf-8?B?Y0pFbmg0SkhVdTZualdncldtS1I5aTNpTlRmaU9jRjJla3dCb08yd2JQZ0Rt?=
 =?utf-8?B?WXVrOC9zV2JXenc4RE5kTDNkNkRITVY1c0NSTURpWFpIWFVUSThQWVFIL2NF?=
 =?utf-8?B?QWJxdzd0eGxwdXV3bFRuY1lyZjZZOUZUbWF2Y0Y5Nk9SYUtSRFhVNzZCeXJX?=
 =?utf-8?B?anMxK1l3ajhUVzk3R1dHSFBWOE8wTHkwR0M5VmI2enBOV2dNbTdodU5TTDNm?=
 =?utf-8?B?a3A5YVNhQW9DRlYvbDlISW8yWlIxckpJWFZWNlJiN2hOd1doVUM4OE1XdWcv?=
 =?utf-8?B?dnVJY2Z6R1kxcDF6ZkRWNmh0NWd0dFoxS0RnWEZHaWc1ODk1RzNYcUY2S2cw?=
 =?utf-8?B?WXRzS0wrTWZod25Pekxvd0R2dW95OUdERWJwczQxL3VONGl4Ulo0VFdEMVlj?=
 =?utf-8?B?VFlhNlJuQWdGcW9IR1JkdnYrVWhTVnRnWXBhL3k0RjRQNXVCRW9sOG4vSGta?=
 =?utf-8?B?Sml0MlNFTm1EN29FNUdsR0xFRGU1dmVWQnZhNVZVVGlVWm1aRDNjbE9VblQx?=
 =?utf-8?B?dWRIUE9jUzRVcDFwZ0RtZkVpWFQ0clhKUEp1VHdNSmtkbDdXdEV1ZDBEOEFm?=
 =?utf-8?B?NVBrSXdSSkZBY2JCdVV4N0t3cytrS2JiV3J4RFhyYTJnREJFS1hMZ2FUTHkx?=
 =?utf-8?B?d2dEM0cxbG9uV25pS3lnQnY2dTRIdExtWWQ3NTAwbStXN3J1OTRnODI2Mmda?=
 =?utf-8?B?ajJYb1NUa2pmOENvcmcvVVdYSWhHeFhFdlBiNFdCVGRnalhPbnpPWWh2cGU1?=
 =?utf-8?B?Y2owMlNOa2tSNVV1VTRCbkxJclBTVmpYM0oybU9YV2pYVC9QZWpZb2d1TGxy?=
 =?utf-8?B?YXp0Um1qMTNLQjdtcGFESC9UTjJGV1VFL01ydVZrbVRhUTVKdTZobEcyMkoy?=
 =?utf-8?B?T05PWjFuNk1TUFJobXpXS2hZR2ZnK3hxbFRQbkRkMEtFRWV3bnRFM09EUFE5?=
 =?utf-8?B?TGdiMExmQjlnNUhiS05GUXQ0UWRmRlBNclQvTlBEUXpra0FTdVdDazZGdDBQ?=
 =?utf-8?B?TC9MTnp0R1pYK2xqOFh3aUZJaGlzSU1xN3AyNldlbW9OWlJsQ3NTZkJHVGJR?=
 =?utf-8?B?YkpTbURlb3pGMi95VnMxWFJiZ2RMbE9COFVEZjdZZWNrODJSc01MdjVXRVEy?=
 =?utf-8?B?VHlQNldER1lwNEpRZGR6K1czb3dJQnRuY29GYmdrSVh4SDFOenc4UmlqRmNN?=
 =?utf-8?B?Wk5XOEpQaUpvNUZSZ3ZFVlc3Qi9kQVljcTVBbklOdHU1a1VPQzc0UFpyc1Vk?=
 =?utf-8?B?ODlGamNmdk4wU1ZaTE1leC80REFpenBUL1BLT0VPMGhxRDJUNHZsRmNndkQw?=
 =?utf-8?B?NitObTB5ZDkxOG1lK2NvMjhoNkc4UmljOE1hRVlBclR3MzBUV0FoMC9KdHpM?=
 =?utf-8?B?R1F5Y2Z3NVd0NlMyRkpSbTg1Ny9jQjJvL3U5WUtycjNNTXlTVXZDWjN1eDZ5?=
 =?utf-8?B?T05abTZpL0hXL1hOUDQzbTY4bTQyWlEzamVlTXcvUitNdTVsRWJlQ2wvRVFr?=
 =?utf-8?B?dXlpN3ArdlBtMk9xZ3Z3VWZLdXBRM0paVEFLem9IRnZ1U0xtdlhqaWgzVGI2?=
 =?utf-8?B?cUp5Ym1tWkFTSmU3Y2djdG9IcGJudlBOd2RlUERmWVllY1R6NVl3SHZQL2dt?=
 =?utf-8?B?UGxLeCs5R1F0UFpnYXdhSjd1RFdXSnNVeExndzNhU3pWc3cwc3JDbTRHdUJY?=
 =?utf-8?B?aGY0RUt3aE9kcVdiMkJaTG9nWnVBdVozNEtyVkt1WUZMbGpvWTZwaGZaV0Nq?=
 =?utf-8?B?dFFURTFXckVpSzdJSFVha2U3Sm1vRW9zMXpoRUNLNzVVYTQ4ZVNRRHQ2UFZ2?=
 =?utf-8?B?b3RvVlFOcllEQW01TVpkRUlpMHA3V1oycFU2T3NieGFYY05RbjZRUTIxT09i?=
 =?utf-8?B?S1Y1YXVVNk1EdUM5M1cyeHlnMmdQN1V3c0pwaFpMeHQxZmRmZnNXNUpvVzFi?=
 =?utf-8?B?RWRDS1REbVpJN09lcGxoUm5QczdzamlvZDlwZkdxUTlIbkVnOVRrdTlTNWlx?=
 =?utf-8?B?UTV6MWxFWVVpVWtoN21TQjJvNGc5SW10aUlBOVE5NTcvUDYxT0Vkd0pOWjhh?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bff6e265-7b81-4804-2066-08ddaef5900c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 05:53:06.6803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhraCr961+f5pOvk0b6+c4kdI2hzhUV7wPX7Xf4eRoYYcohx7x7/90FuFbPRh5f+IaFfuwC3a/fPrSt62oSyXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4539
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


On 19-06-2025 02:35, Daniele Ceraolo Spurio wrote:
>
>
> On 6/18/2025 12:00 PM, Badal Nilawar wrote:
>> Reload late binding fw during runtime resume.
>>
>> v2: Flush worker during runtime suspend
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c | 2 +-
>>   drivers/gpu/drm/xe/xe_late_bind_fw.h | 1 +
>>   drivers/gpu/drm/xe/xe_pm.c           | 6 ++++++
>>   3 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> index 54aa08c6bdfd..c0be9611c73b 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -58,7 +58,7 @@ static int xe_late_bind_fw_num_fans(struct 
>> xe_late_bind *late_bind)
>>           return 0;
>>   }
>>   -static void xe_late_bind_wait_for_worker_completion(struct 
>> xe_late_bind *late_bind)
>> +void xe_late_bind_wait_for_worker_completion(struct xe_late_bind 
>> *late_bind)
>>   {
>>       struct xe_device *xe = late_bind_to_xe(late_bind);
>>       struct xe_late_bind_fw *lbfw;
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> index 28d56ed2bfdc..07e437390539 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> @@ -12,5 +12,6 @@ struct xe_late_bind;
>>     int xe_late_bind_init(struct xe_late_bind *late_bind);
>>   int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
>> +void xe_late_bind_wait_for_worker_completion(struct xe_late_bind 
>> *late_bind);
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index ff749edc005b..91923fd4af80 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -20,6 +20,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_guc.h"
>>   #include "xe_irq.h"
>> +#include "xe_late_bind_fw.h"
>>   #include "xe_pcode.h"
>>   #include "xe_pxp.h"
>>   #include "xe_trace.h"
>> @@ -460,6 +461,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>       if (err)
>>           goto out;
>>   + xe_late_bind_wait_for_worker_completion(&xe->late_bind);
>
> I thing this can deadlock, because you do an rpm_put from within the 
> worker and if that's the last put it'll end up here and wait for the 
> worker to complete.
> We could probably just skip this wait, because the worker can handle 
> rpm itself. What we might want to be careful about is to nor re-queue 
> it (from xe_late_bind_fw_load below) if it's currently being executed; 
> we could also just let the fw be loaded twice if we hit that race 
> condition, that shouldn't be an issue apart from doing something not 
> needed.

In xe_pm_runtime_get/_put, deadlocks are avoided by verifying the 
condition (xe_pm_read_callback_task(xe) == current).

Badal

>
> Daniele
>
>> +
>>       /*
>>        * Applying lock for entire list op as xe_ttm_bo_destroy and 
>> xe_bo_move_notify
>>        * also checks and deletes bo entry from user fault list.
>> @@ -550,6 +553,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>         xe_pxp_pm_resume(xe->pxp);
>>   +    if (xe->d3cold.allowed)
>> +        xe_late_bind_fw_load(&xe->late_bind);
>> +
>>   out:
>>       xe_rpm_lockmap_release(xe);
>>       xe_pm_write_callback_task(xe, NULL);
>
