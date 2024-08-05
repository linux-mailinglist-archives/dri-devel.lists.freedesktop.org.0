Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D39948416
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 23:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD04010E2A8;
	Mon,  5 Aug 2024 21:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H87Y6yuT";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D1110E2A8;
 Mon,  5 Aug 2024 21:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722892939; x=1754428939;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7ko+BvDeoCdK49V1G4BETJKPwt4bIN2caatRZ5UcM+E=;
 b=H87Y6yuTqT4Mk1hcVA+jMDEGL0Fnc4OE2zJMEwjGwJPcmSZ9U/0MbQ6D
 pf1pLUEGvbHqSGBU5EDpT9dalnHIE93iu58Qe6OCT5O3CZZTcqnJdXwKI
 fC3AZ/cX5k8d2LXGzAhy98G9siv/MGeA6LgWHyr62azstvYeTZQ9ldSs3
 ZDcBXa9PDTh/hRUyZlrUyr7e9tVuIKFNe5Uo+8Mq/vBAka3vRfaYzVCw7
 W/o3vsM/MF5aa0iJPPi3BmUhE9Y61lOm6sL+TtO8MnE0987imbydOQFnM
 ByRIRLj8SHgsMQW0hKuxL9NuGXeRUpO7ie+VqVJKlwkNQiUAfJ7ouTcKL g==;
X-CSE-ConnectionGUID: 4GYINOKPTzSAOCdc0NJgng==
X-CSE-MsgGUID: ANmjf+q7T+eV0H14wSdzjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="21004412"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="21004412"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 14:22:19 -0700
X-CSE-ConnectionGUID: pbpZHTcdSnmd0jVN2j+VWA==
X-CSE-MsgGUID: shGqFtfbQXeLVubXTMpHjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="56502098"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 14:22:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 14:22:18 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 14:22:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 14:22:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 14:22:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WwedQZrT1c5m27O9lNbEY2S7cLIwFYL0Ag7PVVa1oTSSRJ1JZ4RobSs6UorkPESpE01tE2oKuwbU4pFFLdPqJeZt3zyknFl9UJ7n5EBIqElBnCdzPVMVSvSbbGvF7wkiU0atbMBG5n3eDyjbl4H0V9AJop1tSItfNmsMW7kWyfoO38szMsmctNzQ2AwqMRfbhOCzLhfgsF3c5SXQhMtdDuu0C/+ItGmxwsWeYZ3de00K9IQN8LnKPrLZWmR4rDhDuOjND0bU1RsEd2hyAuw2Pubt3TfgTQogvatZAYGTJcdPubyXqM2eq5E4RkrerPGVl2di/TXKesutbIQOV7wx+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iBs4Myyfi0DUyQojs6phi+OU/WQFA3k0PEpn3bJjAc=;
 b=rZF7qVfhYTWyTEMm4xtmniZVk7AbgC5Akrp83KrwCV8kNB/DLXl7hX3/1tdldJZCKxYEuEEyM1KAW3G9+oBVKt7nVo4Zxubl0Zm47V6jDC2Bp3kL7KneZljyrLJ5G+5muBNIZrHfMhYGdaK7scRFpYgl3vwPRjrb6GyU6Alhd5um4j8cRZ4qs9Ke3BQMMj9q0ft+y76Uqwsdimhx/1eH5rIBq3I7oxZdj+hcrDvNBd2howWGliazDxgd0xSXjGvrfdvW6j9uKzpcZZwTYQxnQ+1rMVYMdKYq+TOS4l393CU8qjR0+1vyt+PJYiNliEFJ2kai/F5Z0znrCM9QbxYXvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA1PR11MB6442.namprd11.prod.outlook.com (2603:10b6:208:3a9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Mon, 5 Aug
 2024 21:22:15 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7828.021; Mon, 5 Aug 2024
 21:22:15 +0000
Message-ID: <7853e9a0-d2fb-4ce3-b071-2cf8fda45a43@intel.com>
Date: Mon, 5 Aug 2024 14:22:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: ARL requires a newer GSC firmware
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
CC: <DRI-Devel@Lists.FreeDesktop.Org>
References: <20240802031051.3816392-1-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240802031051.3816392-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0039.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::16) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA1PR11MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f39477d-31e6-414e-c0cd-08dcb594ada1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXc3NWVCUlFIQUtLbC80UWhDclBnbDdaUHRsOTlPZDkvdWNJUkF6djlyY3ZG?=
 =?utf-8?B?R0JYdHBQWW5OcTNuN3FBZ1A5dm43b0IycmdPanZJSVM4OWtsell6dWFCdTJt?=
 =?utf-8?B?dDIzUCtVVCtrV01IR2g2SHRUZllLMzJRZVE2SElPV3NvendMYnY1NC8xTG5S?=
 =?utf-8?B?Snkzb2lSMmRKaFlhb01Vb1QzOUFhVkRxcE1yaDVxcElNSGtESnExTCtIeG1M?=
 =?utf-8?B?R2QrcnFsemUwTlJQdTZsYndEWlRuMUFrMHNsekNncEtsQ0wyenM0aWFhL3J4?=
 =?utf-8?B?K1I5bGhFL1BxZlJNc2cwQytObGIyRHJ4R3N3cGRzcWNyOFo2QmlJcGdzOFps?=
 =?utf-8?B?cStZYTJPRFQvVmJnaXVoZkxNcWpBSWMyNFdYc0xrRGR6bC9xcEplcVlDOWxQ?=
 =?utf-8?B?MXc4M28zRVhSRTNHT0VQejVtWG92b0F5YWxZVldCMmQ3RDh2azNTMnB0S2Z5?=
 =?utf-8?B?QmtabTRuRFY5bU1HUCtvZVd0cTdUYkxRL0luTWhmMDN6QVptbUt4NVBsSXVT?=
 =?utf-8?B?ekxPcFFubFhQKzQ2MkVLZE8rclE3dWI4Z2ZONlorUkNIT3A2enVkbFQwSnpn?=
 =?utf-8?B?U3Q0WjN6dEJlWU9wTDNpOWxuSmI4TkhyaU9QM3BNUmFnVW04enRSdXdaaHpU?=
 =?utf-8?B?VzRrUDVtSkE2K3RiNlJVb1JzcmhBUDFnRi9mZ1RzaVFrWXZGeFhjdHo4U0hS?=
 =?utf-8?B?Z0dnU1l5bDJucEtDZHM0VGd5QmRWdVNkQ2JZNk1jR015NUJqQmRtNk81cFVp?=
 =?utf-8?B?aDcwZTc5RnlEcFZGN01NN0tCRDdPS2RQZHdxWVJjMlRCb3hFSUczL08wMW8y?=
 =?utf-8?B?V3A2cGtRM0o5QVRhd3NRRmpGNWJnVmx0YUc0QjVqbDVzSVlhMEkyc2VtRG93?=
 =?utf-8?B?TVozWjQ5UFlzTlVCa2xxd3I5RnFHSXlEamtpMGdTeEtRNTluZlMySDc2eUhi?=
 =?utf-8?B?OXk4N0xDOVNNU1Vjb21RS3kvOGtXYWhyZUlVWWVrdk5senRtVnJtQ1JITHBV?=
 =?utf-8?B?WUZxcTl2MStwUEcwTDFoNUxYbGZOZHFBOVZkZ2EzbjRQYk1SNWVuZW5saHlS?=
 =?utf-8?B?QThqZ29DVDFObHQ4YUlhaS9uQW9YUkt5ZjVtbXBYTHhrSURkWG5aQjlWQnRh?=
 =?utf-8?B?VHNNSVlFTmluWktGdG5teUxHM011eGhTSlk5TkwvNmpYemxoaDVZUXZQakhX?=
 =?utf-8?B?d1FXK0x3TXVndDFFejlzVlNCaDJCbHVtaFU2V3UwVDEvN3JxNlZ0YWoxZGt4?=
 =?utf-8?B?TmRhZ0pyM1JBWnJrUmZ0TlRndWJDdzJpbXBGTzNkWFB3c0pBajVybDk0bzNG?=
 =?utf-8?B?TVVpY2I2dVNKd0c3VXlnbHRHZmdNSk5wajcxMmJuWHRNd3oyVSthZmhHU2Rv?=
 =?utf-8?B?SlRac2QzVmRiQzExRmp1VTZFa0dva1ByYVNQVEJRaVBIOHVXTnhIL2ZNMDN3?=
 =?utf-8?B?WUYreUdZa2JFMFZBdzNta25iSXJzeVd2TngrOEFQZ0dmczA2bmZUSnNaUW9B?=
 =?utf-8?B?Z0VxR2dFUW55by9ENXgyM2hyb3J0TzBmUlZvbHFBK0EycUZ3Lyt6ZHZpejhk?=
 =?utf-8?B?TzVzQm10a2pUa0VSSFlTUzh5NitJUFF2V1lkTzFGL0QvcDFqN1dHMHp1eEww?=
 =?utf-8?B?LzNWUGI0NVZzUzBPRVBOZG95eTNkWnNYbEZkc2JJUmdnUmtFVXJCOWNmQ0Z5?=
 =?utf-8?B?dXpQTVdLWVMwYlo0bWdsbHdIUDZaV29JalJWZi82MGFVaFhrNG4wS2tkc2g5?=
 =?utf-8?B?L1I4eW5FQ1JOeFhTQWkwODNXVW85UkxTYlZBMXhFVlBRaStSK2wrZkhIZVJ6?=
 =?utf-8?B?VHR3NG5HUUxIZ3VLeWVVQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWlNNTJGczE4SUQvNzJSTWl2eENpVlU2a3RmYlJzZEFyR0dUWTV4bjJIcUxr?=
 =?utf-8?B?OEg2Q25NN05Da21KQ1EyZmNjNnYwcVQ2ZThoNzZyVFUwWnhDSGFTcExQUVNI?=
 =?utf-8?B?Y0dvQVlxZkVkQ1Znbm5rQ3Z2VTFvU3F1UU1kaUpGOTNiMCtnS3NPek96ckZM?=
 =?utf-8?B?bE80aUtReHgwSnJEbE5JSkRFVWttbUVCS2t6MzFEU3AvaFRsOGZxQU05ZHlB?=
 =?utf-8?B?RzFOSzg2bVVZWlFZYzd2bG1rN0dxNXBIaE1hMnVlVHhlY0xaNFRMSWFHb3A4?=
 =?utf-8?B?OTVmOWM0Y1lKVmcxR1p1ZExxandKQmh3Q2N6Ly91VE9obytJekxHbS9TRTNT?=
 =?utf-8?B?akZoV3RlTEhoTi8rSzd2RkxsbCt0V25oK0RXRkUxZ1JubnhwNnJyVkRZZ1lQ?=
 =?utf-8?B?dWZyZWliMm5xMHN6VWlQci95bGRxYm1GTGZrR3ZZQjUwdi9SZ3Y3cWdkaGZa?=
 =?utf-8?B?SlVFOVE0M3Bqa3Q4WU1oNmJzZS80YVFETFBKeDBNS29sdWtRWGVEQVNYbXhi?=
 =?utf-8?B?Tkt0NUNHR05QU0xJRFlHQUZuaHZieHRiMTVxYU5haEg4WVJvbHJoMnZ5S1dh?=
 =?utf-8?B?VGxtZTlBK1VFdVZ1SHVkQXljNFNZa0c3SzhiWlZhTVlkQWVQVjQyK3RYdWt2?=
 =?utf-8?B?TjgrZ2JmK01KZ1dsSForcC9oTjhCOVVVMmhSRVpramVnZDlEanBxcHRway9n?=
 =?utf-8?B?N0dTaGpFa3o4M3hhalV2Y2JKc3ZhZ2ttYlJQQmRJalBUZEFpcnRXN2wyaUdM?=
 =?utf-8?B?RGI3ODZVeUlFL3djb2t2aWtzRUhObGpOelVIVERGU0QvU05QMDk1bU9FOWFu?=
 =?utf-8?B?b1k2UlYzb3dJSmZoSVRONlczeVZoZHB4MlE0cStUWVJVMFA1bUJsa0daZVRj?=
 =?utf-8?B?R0VPUDB0bUU0d1kxRitRRjQ5WmU2a1hhR1M4VXlCaTh2VkNrN0Uwd1VNNW94?=
 =?utf-8?B?YUNreVZYWXJ0bndub3dxVmR3QzBTY09wNzdVdjE4aWt3Z0ZzVFZaQ2VOMlhH?=
 =?utf-8?B?b291TzR2N3YrMWRYWllmdDdUY05NczNYRFIxeUY0SGJaVG83aG4zbDhZZjdZ?=
 =?utf-8?B?aXFpQmU4bjFnUWo0RysrcXpzOGFRKzVjaDdyV2EzbFJsL3JyL0U4RzRYRHVv?=
 =?utf-8?B?VG90dnZrclB6MU1KK1B5dFc3VUhMOUFNU0tDNmJ6YmFwOTVyVEFveGNiSDRR?=
 =?utf-8?B?TnhVVE80Vk82TVB5UGdVaUoyNFlvZTNNSldyQTBTT3FYc29vOFZOTDlOS3RJ?=
 =?utf-8?B?U3RURkZnekdmeU1RcjZ3SHNrdnFMZ2FLU245SEtZc1piemg3OGRydjhXSXJU?=
 =?utf-8?B?QW9lU1JYdCt2aHhFNThoNWZDeC9nN1BQRU9XNm1GL3RnZEFnQXhMaktkV0hY?=
 =?utf-8?B?bC82K1ljbDA4OXZkVU1GK00rM2JZZ2NxMExuRnpHOWF1SFB3ODE5THJ1V2ZH?=
 =?utf-8?B?SWNsYzJpc3Y4azNsRDZIdnNCRFh3RGZKZG5RNDFRNDYwREJDRkFHSlBlbUJW?=
 =?utf-8?B?NFF1dEpuRDlHMllhOCtKOXphdGZ1ekxxTG5HajQ2ejIwYXZnNktaL0lmYWNi?=
 =?utf-8?B?ZGIxaCtoV0IreEdidHluWkQ3R3hlZ2RJTWI2SFpGd2Z6S2xRdit0Mjh6RExo?=
 =?utf-8?B?U2Jaa3BLY0ZHTS9WQmE1TGdrRWx1Q0s1aGRKazE3NmYxaklYUTBRUWZxb3RP?=
 =?utf-8?B?aXIycWtrWk1NekZkR1d4UjcwdDB4OG51cWdlWDFUbW9TZ1E3REE5REVYVFlm?=
 =?utf-8?B?TEVkUno0WmdkdWFGUFRSZ1BMYmw5K2lNQmErR1RkL1Nvd3dOcmhtNVphT1V2?=
 =?utf-8?B?VGJPL1pjQ0NtZUUxSlhMZ1lhRU1xY1NiSlgvajAzN3VncW5VL20vN3U5L0Vr?=
 =?utf-8?B?VEFZQUVzeVBjTjJvaUk0L0cvdXpGK2EvVWxnQ1ZTeEsvcjN2NWVPN25VNWpC?=
 =?utf-8?B?S0psKzhBY0NHeVUrcnJ6VGhyUFNFQjFvckxtZnlkcEZoZmJnclpSVEtxeFov?=
 =?utf-8?B?NHBrRk05SG8zNVVRT29zWVN1ZE9qTXBJaDJxMmp0ZG9ZTlRtYTdoTEZCSGdE?=
 =?utf-8?B?U0NzY1VpeG92M3k3ZEZTeXpZeGhzSDViNjBzQmpVWDN5Yjlab1RZZnU5U0Ey?=
 =?utf-8?B?a0hPdVVkblJ2YTZ4eVRQaFNwSEN6eDVvVWJJeUp0RVhnaUFMdThOSmhqQVls?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f39477d-31e6-414e-c0cd-08dcb594ada1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 21:22:15.3846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 186u2NOCf41b8CZDVwLUkKMGYuCf5xlgeCI6GwMTIV18EWifppTDIZ/cNMRnHuyAStqymhxIOReU2rstB0BbDJOhj1ouyAHArtXeVKebNUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6442
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



On 8/1/2024 8:10 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> ARL and MTL share a single GSC firmware blob. However, ARL requires a
> newer version of it.
>
> So add differentiate of the PCI ids for ARL from MTL and create ARL as
> a sub-platform of MTL. That way, all the existing workarounds and such
> still treat ARL as MTL exactly as before. However, now the GSC code
> can check for ARL and do an extra version check on the firmware before
> committing to it.
>
> Also, the version extraction code has various ways of failing but the
> return code was being ignore and so the firmware load would attempt to
> continue anyway. Fix that by propagating the return code to the next
> level out.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

This needs a fixes tag. AFAICS we already had the ARL-S pci ID in the 
kernel by the time we removed the MTL force probe, so the best fix tag 
is probably:

Fixes: 213c43676beb ("drm/i915/mtl: Remove the 'force_probe' requirement 
for Meteor Lake")

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 31 +++++++++++++++++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 10 ++++++--
>   drivers/gpu/drm/i915/i915_drv.h           |  2 ++
>   drivers/gpu/drm/i915/intel_device_info.c  |  7 +++++
>   drivers/gpu/drm/i915/intel_device_info.h  |  3 +++
>   include/drm/intel/i915_pciids.h           | 11 +++++---
>   6 files changed, 58 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> index 3b69bc6616bd3..551b0d7974ff1 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> @@ -212,6 +212,37 @@ int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const void *data, s
>   		}
>   	}
>   
> +	if (IS_ARROWLAKE(gt->i915)) {
> +		bool too_old = false;
> +
> +		/*
> +		 * ARL requires a newer firmware than MTL did (102.0.10.1878) but the
> +		 * firmware is actually common. So, need to do an explicit version check
> +		 * here rather than using a separate table entry. And if the older
> +		 * MTL-only version is found, then just don't use GSC rather than aborting
> +		 * the driver load.
> +		 */
> +		if (gsc->release.major < 102) {
> +			too_old = true;

nit: the 102 major number just indicates that it is a MTL/ARL image, so 
unless the binary is corrupted (which should be caught by the checks 
higher up this function) it should be guaranteed that this matches. You 
could probably skip checking for it (below as well).

Apart from this nit the patch LGTM, so with the fixes tag added:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

However, given that this is a non-backward compatible change that we'd 
be propagating as a fix, please get a maintainer ack as well. IMO there 
should be no problem since this is only breaking for ARL and that 
platform hasn't been publicly released yet, but I'd still prefer a 
maintainer to confirm.

Daniele

> +		} else if (gsc->release.major == 102) {
> +			if (gsc->release.minor == 0) {
> +				if (gsc->release.patch < 10) {
> +					too_old = true;
> +				} else if (gsc->release.patch == 10) {
> +					if (gsc->release.build < 1878)
> +						too_old = true;
> +				}
> +			}
> +		}
> +
> +		if (too_old) {
> +			gt_info(gt, "GSC firmware too old for ARL, got %d.%d.%d.%d but need at least 102.0.10.1878",
> +				gsc->release.major, gsc->release.minor,
> +				gsc->release.patch, gsc->release.build);
> +			return -EINVAL;
> +		}
> +	}
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index d80278eb45d73..ec33ad942115a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -698,12 +698,18 @@ static int check_gsc_manifest(struct intel_gt *gt,
>   			      const struct firmware *fw,
>   			      struct intel_uc_fw *uc_fw)
>   {
> +	int ret;
> +
>   	switch (uc_fw->type) {
>   	case INTEL_UC_FW_TYPE_HUC:
> -		intel_huc_fw_get_binary_info(uc_fw, fw->data, fw->size);
> +		ret = intel_huc_fw_get_binary_info(uc_fw, fw->data, fw->size);
> +		if (ret)
> +			return ret;
>   		break;
>   	case INTEL_UC_FW_TYPE_GSC:
> -		intel_gsc_fw_get_binary_info(uc_fw, fw->data, fw->size);
> +		ret = intel_gsc_fw_get_binary_info(uc_fw, fw->data, fw->size);
> +		if (ret)
> +			return ret;
>   		break;
>   	default:
>   		MISSING_CASE(uc_fw->type);
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 02f28a6170c39..17561b53648e2 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -546,6 +546,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>   #define IS_LUNARLAKE(i915) (0 && i915)
>   #define IS_BATTLEMAGE(i915)  (0 && i915)
>   
> +#define IS_ARROWLAKE(i915) \
> +	IS_SUBPLATFORM(i915, INTEL_METEORLAKE, INTEL_SUBPLATFORM_ARL)
>   #define IS_DG2_G10(i915) \
>   	IS_SUBPLATFORM(i915, INTEL_DG2, INTEL_SUBPLATFORM_G10)
>   #define IS_DG2_G11(i915) \
> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
> index d26de37719a72..eede5417cb3fe 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.c
> +++ b/drivers/gpu/drm/i915/intel_device_info.c
> @@ -203,6 +203,10 @@ static const u16 subplatform_g12_ids[] = {
>   	INTEL_DG2_G12_IDS(ID),
>   };
>   
> +static const u16 subplatform_arl_ids[] = {
> +	INTEL_ARL_IDS(ID),
> +};
> +
>   static bool find_devid(u16 id, const u16 *p, unsigned int num)
>   {
>   	for (; num; num--, p++) {
> @@ -260,6 +264,9 @@ static void intel_device_info_subplatform_init(struct drm_i915_private *i915)
>   	} else if (find_devid(devid, subplatform_g12_ids,
>   			      ARRAY_SIZE(subplatform_g12_ids))) {
>   		mask = BIT(INTEL_SUBPLATFORM_G12);
> +	} else if (find_devid(devid, subplatform_arl_ids,
> +			      ARRAY_SIZE(subplatform_arl_ids))) {
> +		mask = BIT(INTEL_SUBPLATFORM_ARL);
>   	}
>   
>   	GEM_BUG_ON(mask & ~INTEL_SUBPLATFORM_MASK);
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index d1a2abc7e5139..df73ef94615dd 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -127,6 +127,9 @@ enum intel_platform {
>   #define INTEL_SUBPLATFORM_N    1
>   #define INTEL_SUBPLATFORM_RPLU  2
>   
> +/* MTL */
> +#define INTEL_SUBPLATFORM_ARL	0
> +
>   enum intel_ppgtt_type {
>   	INTEL_PPGTT_NONE = I915_GEM_PPGTT_NONE,
>   	INTEL_PPGTT_ALIASING = I915_GEM_PPGTT_ALIASING,
> diff --git a/include/drm/intel/i915_pciids.h b/include/drm/intel/i915_pciids.h
> index b21374f76df23..2bf03ebfcf73d 100644
> --- a/include/drm/intel/i915_pciids.h
> +++ b/include/drm/intel/i915_pciids.h
> @@ -772,15 +772,18 @@
>   	INTEL_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
>   
>   /* MTL */
> +#define INTEL_ARL_IDS(MACRO__, ...) \
> +	MACRO__(0x7D41, ## __VA_ARGS__), \
> +	MACRO__(0x7D51, ## __VA_ARGS__), \
> +	MACRO__(0x7D67, ## __VA_ARGS__), \
> +	MACRO__(0x7DD1, ## __VA_ARGS__)
> +
>   #define INTEL_MTL_IDS(MACRO__, ...) \
> +	INTEL_ARL_IDS(MACRO__, ## __VA_ARGS__), \
>   	MACRO__(0x7D40, ## __VA_ARGS__), \
> -	MACRO__(0x7D41, ## __VA_ARGS__), \
>   	MACRO__(0x7D45, ## __VA_ARGS__), \
> -	MACRO__(0x7D51, ## __VA_ARGS__), \
>   	MACRO__(0x7D55, ## __VA_ARGS__), \
>   	MACRO__(0x7D60, ## __VA_ARGS__), \
> -	MACRO__(0x7D67, ## __VA_ARGS__), \
> -	MACRO__(0x7DD1, ## __VA_ARGS__), \
>   	MACRO__(0x7DD5, ## __VA_ARGS__)
>   
>   /* LNL */

