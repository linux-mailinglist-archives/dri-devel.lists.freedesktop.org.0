Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B58E297D044
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 05:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D0E10E790;
	Fri, 20 Sep 2024 03:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXWlAeuQ";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F1C10E78C;
 Fri, 20 Sep 2024 03:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726802583; x=1758338583;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0i4+n9IocDN3E6Da6tqnu3ETD9cQ6D7e6Fy6IivdtX8=;
 b=IXWlAeuQX7kRL+sPA43x0v/8i6nXBVOM3A4RRP778yem2KXO74Rr3cFO
 cW6B4f444vM/eKNJdX3ovTjKpBlnhCXnSMUr2l/IqtO+LSEa3LpNxrT2D
 rE1cefmrKQxU7HHMSE0LwuTb8+kyWbZFx6v0mD6O2YPQ2CAiEPAO4DFTu
 Q40f1ow/LJgDeAyn/huLKXxM6W9UlOBHX/d2DRVa6UPyaDkq5VSqado67
 U8psQdKIG/zHbP+Natg8/2Lxn4aEqPShOb0DbOMO9axX0S79HahafoHwn
 X9S5AsPxADf+osM9l1K7cMSghkyNZZS/IxG5p/H37ixXb48qbF8t/gAtt w==;
X-CSE-ConnectionGUID: eFP3J7OFTne4lLQHvLA1VQ==
X-CSE-MsgGUID: ZeoCE5gKSw+LsJrowJzz8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25670410"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="25670410"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 20:23:00 -0700
X-CSE-ConnectionGUID: Cv7EY9qPR5WooLjiGTYnYw==
X-CSE-MsgGUID: lXFhrVz7Sg2DCoHRixaIqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="70982007"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 20:22:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 20:22:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 20:22:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 20:22:58 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 20:22:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9kmo2y7gHLhuHI+8mQizCMzmtAdSG5kdJ4HSVzOe7uD3jQ/NRfpD+Feqoved+b8CaApbmZ3BEjFjDGTHQsZ9vDesyfSjql7coEUnXwMfAaYUaGoO2CJN8pENIBR+wnve56NuQdIkVLuRRR8UFkMUua5dqqfH/05hhY7x6IrazJNiVbwUAlcW/H5yK/7eS25Je/anaZHRsXqLRwO/VYUzm8fUvKLtzbvWsOgP3xbGXa/uO5aBsaqHOhL9QUsMBPRcShCMmVH+ceH4KbXQh26GU3GWAeJANR1K0yWvq3rcs8zcF43udPxPdusHB/sIW23dNd6GblMkp+V6cHNDyV3HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0i4+n9IocDN3E6Da6tqnu3ETD9cQ6D7e6Fy6IivdtX8=;
 b=HxXuJjOz8Fo4cLL7VgA1bNUHU7a47wonN4Ltvzxu1MnspDFGOsH9OzEjajom9wFd8PM7xZWWbH+TrKPzGI8FGTYPQ3pHaVHtdyeyK1eBHk7FxT9Eiv5lsYI43eYppd6v3pSegltWHYZnc6L5TEF012EyB69OoDGm74TIu0UUkqwZuEPhyS3uFzWaxcklubbdrHohD0/yijxavIlijFkIj1eJ2Uc3o90KjnVVhS7iLWdZtPRJqmdTTqBuEFbXXZkl3EP1krVe9BViIdMjm6J1anSOltt3YDHDDvUAe1JM0YUFzaUSEX6cukVj1BJVVVeterWOn6fiCj6fCSl90YbBUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS0PR11MB8688.namprd11.prod.outlook.com (2603:10b6:8:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Fri, 20 Sep
 2024 03:22:56 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.7982.012; Fri, 20 Sep 2024
 03:22:56 +0000
Message-ID: <50c56da1-9be2-4176-a8f3-ddc124340f84@intel.com>
Date: Thu, 19 Sep 2024 20:22:52 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/11] drm/xe/guc: Improve GuC log dumping and add to
 devcoredump
To: <Intel-GFX@Lists.FreeDesktop.Org>
CC: <DRI-Devel@Lists.FreeDesktop.Org>
References: <20240920032007.629624-1-John.C.Harrison@Intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240920032007.629624-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:303:16d::15) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS0PR11MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: 0013c5f4-e69a-4156-eccf-08dcd923857b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGJIVVJFYWtYVktoZFA4dTltRm4rRm95a2NXaXEzT09JU2RUOUxaa3RoeStO?=
 =?utf-8?B?NG5Ta3AxTjVXQlo5UGlXUS92cWwzRlNkNUdXRXNTYTd6VC9vRTRITkR6bEtw?=
 =?utf-8?B?V3ZyZk9obXBGdzFFSlRpWFVKR0V2d3Fpd3gwSXA1eGpuV3YzaXN5blE0dFpl?=
 =?utf-8?B?Z0JuNVhQaGNud3FqRzB2blpLUE1LZElWaE54YitIMmE0YitJaFFacUNzK21B?=
 =?utf-8?B?bjZTWFEyeTYyR0NlemFlSHZEaTQ4RnNiem5yT3liUlR0OXhFc2NESTcxckww?=
 =?utf-8?B?RDZER25MR3krV0QxOVd4a3pyVGEyamlHZkpBK09VRnRtZm5wTVMveW16cGRB?=
 =?utf-8?B?QnJlSHNNUkpqOFUxUGsvazNwb1dwU05qbjdkN083Q2dOczRpWHFOYmlubS81?=
 =?utf-8?B?ejZXaktaNVNpWDViUERrbXorL3ZiMEs1ZlhHNmlPMzNRSHk4WmhsdEtwUVh2?=
 =?utf-8?B?M1JmTUtJend2OWNCR1Q4cGhkdG9MS1ZoRUxtNHowVklxbmNoSTVxNGRXMHZV?=
 =?utf-8?B?L1JDUlZCZGd4aHFXb3h6MVovM2VrK1VsNW1TTCtnb1ZpSjlMQUlkbmwxbVQ4?=
 =?utf-8?B?eGliNEthMzRNQy9ZNVdwdHF3SkJxakJOVkpRanhyKy9heHIxcmk4dGM1R2ZO?=
 =?utf-8?B?SndXakI3L09seHl1cURHL2FWbFBuZ01hMGxLNy83aGQyalR4cmtLbHF3YkhZ?=
 =?utf-8?B?M0xUWTcxaDRwVTlhRW5ieCtKbWJPU2I4c2RYSUwvUjJXVG10ekFKL2ZOWTZ6?=
 =?utf-8?B?bTVYc00xL1BucGR2Vm05cXVPZllhN0tCWWkyUkQrbFhvMXhFWmF5SEgzY1B1?=
 =?utf-8?B?Z3R5Q002bk1NdVkrVy9obFNwZFNNcVo1MG9iTnZGR0ppT1FQNFp5M1FFRmpo?=
 =?utf-8?B?cG9ueThyTXdqY0haUFJSS3R1ODBQS2d4citaTGYwcmliV0JteXNha1E4Q0VP?=
 =?utf-8?B?NnBpUnVId0M2RFppV21ya254R0tZWnlrOXJpMFA5L2c5SENOTGlnYUdjdGRM?=
 =?utf-8?B?clFtYWk4cmNITG11U05UM29VaW5lZzlKejMxRmFRdW9HZDlMVkdzZzBNUjdv?=
 =?utf-8?B?QlVWOHhZVVVSTFc0Um5ucjdrTDNJUkFORUE5OUZ4ODQ3R1dBbWwwVm5JaGVD?=
 =?utf-8?B?bnZGSlVBNFgydTE3WEYva1o1cG9QVHhpVTMzNkVlRndKb21HQVBjMGh3SmVq?=
 =?utf-8?B?NExDM1Fvc2VCdVBLRW1CaWJMcTNrV2JHRVU2TjdiQm5OZnFNWFl5dmczR3hI?=
 =?utf-8?B?YktoelpjOUlpZEFwVXlrU2xHTkRoSkpBcWlhR1lZMFR0T1ZnSUlSSHhCOTh1?=
 =?utf-8?B?a3ltRFQ5djZ6ZW9FRFNHZmJ5T2luK2NUeUVxdWttTFlJQ3U0OEMzRkNwcnhS?=
 =?utf-8?B?b05IZ1VkbGI5UCtnanJCamx4VGRZV1JzRjVSVTJhTGlRVTFaSVdRUXFDU1Za?=
 =?utf-8?B?VVc2VFdpOG00NGhJWDA5a1dubDZ6dWJuc3hoREZtOXJMTUQ3Vmh2VDJITllZ?=
 =?utf-8?B?MGQ4Vy9pc0Znc3RJamRiRGRhb1VCdzVDMG9hb1FOSjRkd0tYcWloL0JxaE5H?=
 =?utf-8?B?TVZzQmlTTURxY0YxRkZ2YUJtVnJ3UXFDbUhZeGFrVmgyUUh0ZTU3NmxzZHhY?=
 =?utf-8?B?ZjQyVTVTQ0srenh0SjdPRFQxdWZYRzhNQVlsdWpaUncxemlqaU54NFNvczll?=
 =?utf-8?B?T3pQZHgyR0ZibmVTMTRiUWl5VFY3dDlHeVRzN3BUSHFOTzlYKyt3UWVDQ3o1?=
 =?utf-8?B?Qkl6VEIweVNMT3I3bjhVK1ExL05XeERXMER3YjJhVmxsS2F0MVpJSXNKQWtW?=
 =?utf-8?B?WFhneG13ZW1INHFDQVRnZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGEvKzRWOTR3MUFtaTJaZHFxcE11cmtvek1MZmZHVWlJOGJtc1E5NjZVTDJk?=
 =?utf-8?B?SjJxR3RuL3pLeHp5K24vcGp6WEkvTDg4RWp4ZjdjclpTTzgyVGhMSEUrWWw5?=
 =?utf-8?B?VWZ5SUdkY05IUCtaOVlJTnhYUFJWam5acFV6WnpxMGkzZ0ZDTmtDUG9QQTlp?=
 =?utf-8?B?ODBaczh0U0ZvZ1lPaG1wMWVLL1pITXgrZmNFdU13bk4xSHlWTThrRzB2U2g5?=
 =?utf-8?B?M25aYjFXZk5ZNEZSM2JoenRVT2lWVm5sMUhIcDBrZGZrL21laGl4ODRiVzFv?=
 =?utf-8?B?U1JCUDFmVkVDWG9hVzJGYnd6all4THpqZEdXRGI1RGUxV3ZraHZleG1ORnNz?=
 =?utf-8?B?Z3hoOHVYd0RZU1JQOXZTdFlFTkdac1QxWnptKzQrK0dnbzFHYVlJcVlTd1Nl?=
 =?utf-8?B?SURDMlMrN1paM3kvdzJKL1hDV2dyK0NyU2lLRzBtcUV2N2pwdUkzQWNPbmc1?=
 =?utf-8?B?SFBYeFJrcHdsTk1UVWZ4WE4yWGY4RHlBZm9reFFndUhkQTl6Ykh1c0pOM1Ay?=
 =?utf-8?B?YzRnTDlLdG80c0gzMGtrRnZWeDhQbWNyRWtVZks0ektqcDNHckZObWZiOURw?=
 =?utf-8?B?TXJPSUtvVUdGYWtZQW4xV3NIU2JrTjNrT1A2QVVYL1V3cElKaFZuRzdwaUx6?=
 =?utf-8?B?MGVYcEVUL0F1Z3RpKy8yM2IrZHpTWU5TcktablpGOW04N0EvTHh4WWlhMXhq?=
 =?utf-8?B?bE9qLzVZRm1lY3MwVmpSOE9MQWl4cW9PT3QyNkFaQkhSUkNkQ0t6Z3pFWXJV?=
 =?utf-8?B?Q0VhbHNtQjI5RmFwc1FTeFp6VUN6aXdXUkFabkYrQkJPUk9VbGIzQUpiSFFU?=
 =?utf-8?B?NC9xQzlGc2dlV1U2YXp6QmxnVkJFQ1E5Y0UvT0t3K2dud1p2NldzcW5ydm1Q?=
 =?utf-8?B?YThndUN4T2ViZVFxalNTMEM3VEkwNS9EWE1oUm81R3pyKzlFYmZNRURHUTFN?=
 =?utf-8?B?L3JNZVRHaHlpK3Fkc0ZEakY5QzNza29ocktXcXZxK1lKb2oxSXZVeTVnNi9r?=
 =?utf-8?B?cHFjdElld05zVk9GZVJwYkQ2ZmdLL3g0RGZnTmI2Mk9XT296MFp6V1ZIUWQ5?=
 =?utf-8?B?OFlkZ0Y5anplcVJ3eWxiMk5tRStucml1dmk0OC9TNjhkM2luQkJWdFVKZnA5?=
 =?utf-8?B?MDV0Rm9FUmVGeUhqcDgyMDRDbGM3QzBwL3Z0SitBbVExeFpjTWpEMDREa0Rz?=
 =?utf-8?B?aUovT0lxQVo4R2hWdnVNUWJRMnN4OVJTajNnTVg4QlMrNnZuVmpVcVIzcUdt?=
 =?utf-8?B?YzZXRUpMUFJDL2tnVnMzcG1LYzRHcDRvU1crWS9kazdIcXUxRXUvRU9jMUhP?=
 =?utf-8?B?S2wvZEFPQnh2VWtON2doR2JpdStybC8zZFVNS24yelNnWHhpMDRjNldBRjcr?=
 =?utf-8?B?R2hwT3hiMlEzUkVXZmhodjZ2YWc5elYySUhBUDRBZ2Q3UXVWaGhlRDlZQ3FZ?=
 =?utf-8?B?WElKM21TN3NPcTMvVUozaGdTYUVVeWxSQUZQWXIvVkhJaDFrRXI0QVYvLzl4?=
 =?utf-8?B?dmpiT3lPWWlqRTcxUHk3TUVUL2UvbnVqcUxGTnRFMDQ5UXVpdnNyRjZLRGlt?=
 =?utf-8?B?dzdyclpqTkxrc2x5N2VnMmttSER4R2JCSTFXSU5UV3huZDdZUzZ0N0gyZng4?=
 =?utf-8?B?bCtCTHc4QXJweUdmNTV4VXlPQkxRcS9kZjRNSnYrZTlBZWc2SlVjaDZoVnVP?=
 =?utf-8?B?dE9YSUlOOE5UMExZOTg0VllQVUlwNU9IbHJTVGNoVUwwRmhoN3AzaUpVbmZW?=
 =?utf-8?B?NkxsY3F2YVVRMUJRQ0hhY2xqM2lEb0IyZmdZb1VoeXdaVkNZOHdEVFkrRTlM?=
 =?utf-8?B?enRPbW83Z2s4djh4SThBNkliRnZVQnNPejlZZ3FEeE5xU0hTQTNPRHBwNVA0?=
 =?utf-8?B?U3g0Y2loNWgrZnVadkNUU3FpM293TlRMOWNLaXlNR1dpK3E2VXVoUDFWUXA3?=
 =?utf-8?B?TVp0bVFJbXVPMkRjd1pKSFZnV3FCM2diZml2NnlpcHNLa1ZrZnVpVGdzSnRv?=
 =?utf-8?B?RTlJWFdRMUZubDB0SUNyd3Z0QytYRWVNdnBscTRncU1DMmRhdTNodUtvdWla?=
 =?utf-8?B?Yk1KcUpPdXJ4NWg4eXJDeUdEQlRZMmRSR1pab1lweHM4RWo2TXhmY3lxbHA3?=
 =?utf-8?B?T1ZmeTJ5SlJNN0dGdWg5ZHFkcEgzS2F6NFUxQWgzVVcvVXllSEIxWDVjanIy?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0013c5f4-e69a-4156-eccf-08dcd923857b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 03:22:56.8177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90Pm12E9wQdu+LAi1kNxWwf2cXfeG9u2WCs/WBcCvxghAhL5nKGhmdsuh9P2/p//dv1AXLiXLrJFnmCxq8ezwfTILBhX5YPqwk12qM+AWNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8688
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

Please ignore, sent to the wrong mailing list!

John.

