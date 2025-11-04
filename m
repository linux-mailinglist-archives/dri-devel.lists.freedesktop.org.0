Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39936C2F9FE
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 08:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE8B10E534;
	Tue,  4 Nov 2025 07:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GNf5ZmbL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47D010E533;
 Tue,  4 Nov 2025 07:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762241470; x=1793777470;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zb49GnosAU0hiam5rpP4pmeusaK2FzsCZzkK29ezu6Y=;
 b=GNf5ZmbLcYH83ujglvLmvkRPYMfttBDZkciRI3yVpSOFL/rQH+nXVNG5
 /F0h7zJB7ni6pTLhKU47o7ujAeRpdIGgV/mnDnQqVZOyhftTkq0Rm6cj+
 k55YdHZQBVslrvkht8K0ZId9wWFAMoaF+XkSVkIWrWe0SLCkDPDWzoIle
 WeUYEPtUFI6hxFB5MljeUluP/S28A2sMO2ibN4xUVMwubCPx48BYb9e3U
 +3Bq3cwtXVDATp+0oY/80umQlEGdGqahBzDlT0RKNwrKpEkYdqr7wLVs0
 ydhbJBkQE8W1MPAdvNvETIf6jSEJS4dk0ASJ90bHs6BdkEJpeCaM4pJYQ Q==;
X-CSE-ConnectionGUID: Ohxpx6a3TamTfUCsKUVoUQ==
X-CSE-MsgGUID: wcCCu8+pRq295NeLXRCO5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="51899247"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="51899247"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 23:31:09 -0800
X-CSE-ConnectionGUID: 2fUwkPrYQBCLFT5u3pZlUQ==
X-CSE-MsgGUID: OUEr8K4aRnWRdp9QvTLRLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="191395702"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 23:31:09 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 23:31:08 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 23:31:08 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 23:31:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hj+67ySYcCjd6QpCxH0RCc/8z7UQlvoHrngL7wSEaIr35D6o5mUbgJ4lyw6nblXItqSc/4G7iiPLdgiCTgQ7jTVWmoM0RoaR2CVDWxrtY7W64p0ucYD+2HFSL2+gB2UbX/mB98cYeJfS7QR8eRWeM1nFeWP2K7O+aRptQs28RQq8nRToLwh3fa5taoKLpuFsrTU0fzp/vNi/BmWUflavTbb11Tj6baJoGUqz2vj4olYfgUOC2FJMMYlmre+0Nc2zcMSs+rToHfwrDAPVloq4FHx2upcWhlUuXDy7EdIcZxmQOH7YM89qdjhxRVoQYIJcomj2gBcaOKv77Dt/fncTPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GlkCA6yYr4VjC5gVGKz+cyKHQzIbfyxRRJgSiYmodA=;
 b=OADZHE7H/mRm8c0AIKw/8b4GnzomfK2DiV6JoLvgbDGfj41gWJOmGsFnVZDL/1P3cJ2BQkKgVYnaF6vEb3EgbrVvoCcilp7BXZdisRZGd5cI8r5Mdu3PebTm4BvPHOhoBb8TIhirx865fNTZdK7teM/SnClZ94eD09sver4q7/cZb07k2+rDPF9SHDrQnsZc9TEn1PPvCcgLOzT+P4sBwXk6nchC9Cr+rV2V4EE/buYoPYeSM9xNCU4SxXIquWF2eniFmYEUeeRojeB67iGnyx3Ei3ZYaZk40BtIVMm/QJJCZN1oS5NXRCunFtY4YhZPmydqrM5bZSsb2aMYcdz3jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SA3PR11MB8003.namprd11.prod.outlook.com (2603:10b6:806:2f7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 07:31:06 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 07:31:06 +0000
Date: Tue, 4 Nov 2025 07:30:52 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
CC: <linux-kernel@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko
 <mhocko@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2 1/3] drm/i915: replace use of system_unbound_wq with
 system_dfl_wq
Message-ID: <vzwd2i6wn75oxn5e34xwky74ezpjjosyhx5kvcvwvywhohzegq@xfhhlcdei6it>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251103164800.294729-1-marco.crivellari@suse.com>
 <20251103164800.294729-2-marco.crivellari@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251103164800.294729-2-marco.crivellari@suse.com>
X-ClientProxiedBy: TL2P290CA0026.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::13) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SA3PR11MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: 381a5d9c-6d64-4030-9089-08de1b741dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEE5UlZWd0tQOVJka05INVlHeUNtQjV3QjF6cEl1WmtLV0pCMlgzbC8waHRx?=
 =?utf-8?B?dUkvTmNuR2M0K2JVRHlIYkxoZGhBRjgyTUhpRitFRHcyaHJuaXhiNEhUeER2?=
 =?utf-8?B?YjZveGdGdlMzSExpSHZvbmNzUk1LV0p1ZGlpYTZySXZDOTJId1Z4T2tvdVFn?=
 =?utf-8?B?dUFHVkFCclc3OFhkbVZsK21tNDY5aHN4M1ViY0twUjAveGgzSGZhWlFTSWlF?=
 =?utf-8?B?RmRlaEUwOTRoYWRJajV1QmhkTW95dFJGSHlETkpwa2RCMm1wYWpEQSt3bnBk?=
 =?utf-8?B?bW8xalFyZktzNHlCcEtudm5tci9obGJ0NU44aHp6aytPc3U5ZlRORlo3aGg3?=
 =?utf-8?B?UzhOcUxMSlB3eTRmYytXMG9zNHZFS29BNGt0OEJhcU5rSW5IcDh2TWR4MFZl?=
 =?utf-8?B?VDdKaHZBYS9qSTN0TVRjSWFaR3FVSjc4aDdjK1ZDVkNoY1VVTGwzdEJ5VzVQ?=
 =?utf-8?B?cWQvR2JFZy85ZjhXVDNQazdjcmtPdUJ0Tm5CSnc2d290c1ZlMDJnY0ZRR0t5?=
 =?utf-8?B?UWpYNEliSWE4S0YzblVXYjZ3SytUQkFnR3JEOTN6SGJyS3dOSUtkSzh3M2Q5?=
 =?utf-8?B?K1gxblZSMGN2blJwZVBUUHgvSVEzc1VwbUJYSTA0bFM1dlM0ZFpJeEVmZ3ht?=
 =?utf-8?B?ODJ1aktoUXcrOUI4OS9NQ09lNlFIcjEwNXp3RVNIalFHbkE2bmVycHVGQjRq?=
 =?utf-8?B?UHZ4b2kreHViVm9JWlU4MjlvZlpMdis0VE5NbHdjWGtOV1M1QVJsWDJEQzV3?=
 =?utf-8?B?c0czMjVRSkQ2YUdqUDR4T1Nnb2xnTVBBVmdSN0k2V2ZMc3NUM0dpak5ucTRS?=
 =?utf-8?B?dVpiTU9IaUcrQklIYng4R3FUT09JVzhxSlNadG5pdWhSR05kYkk1b3MrYUF4?=
 =?utf-8?B?ckQ0NHdvZkNTN1M0SmpRVkZNZDQwQlRZMFF4STVxTXU5R3lOdERqQnc0RktY?=
 =?utf-8?B?cVR2VENZd1NkSHpMdXllaXBGVStHVjZrdk9oeDI0SHRBb2EwSUlXMXBneUhL?=
 =?utf-8?B?WnluWU4wMFBZbFkvY3VOSXY3QzlPSWYwa2RRRTVKM0FoeXdIV29HQmR4eXFB?=
 =?utf-8?B?eEllQkhxQzdsbXQxN25icnkreGJVKy9XUjBHQ2dqR09zcWZkUTR6TUxnSXFO?=
 =?utf-8?B?bTI4THVnZE1IQ1BFeGp3OERVdlk3UHZHTjh2NmhuNkU5ajIxcmxqMXExNDVL?=
 =?utf-8?B?WmlnTi9kN3JGcDFocDRhWlNrSTN4RUx4bS90ZFJTY2F1UlJuZEVrQUplOEdq?=
 =?utf-8?B?aEtrWk9BNGlIT1ZNemYyejI5cFEzTS9TYXdXQmtyUVlseFAxOTlISVFQUUVp?=
 =?utf-8?B?c2lySHVGL3lJaVZIUGNpSW1XcGtralcvSHdVSE9IcGo5Tk45RlBWWnVLVTho?=
 =?utf-8?B?MGNHNHYrVjZGR2dVNURLV2Z5QlJIK3BpNG5VcWtyWkV5K2RPVDNqYXhiQUVN?=
 =?utf-8?B?NE9mVEsvdnhBeDAyVGVqdjhrMHh2QTJuK0RJRWsreDJBUjIwSmZBZm9kMjF3?=
 =?utf-8?B?NXYrRmhZd2ljTGVQOFNSem4wMGc4T2FudVFId2ZIUWVET1h5YUFFK3JxeW84?=
 =?utf-8?B?OTBIOEU5RVlJTmFIUWJ0alBLaDg1SmxVTHorU0s0WnY5V3JuZlZvUmZjaXI4?=
 =?utf-8?B?Nk1zZENWYS8rbDdubWs1SEk5RkVaUktpc0hiS2VqU0lwZW5EVVV2S0l4dHJs?=
 =?utf-8?B?ZG43SjBhcG93c1FxWVNLZE1BRVdBRnUwODVFaHplTjZDSHVTWWJhWEF5TjIy?=
 =?utf-8?B?SWNpaElSK1h6QkhLUDBJSGJicVBoM09rSFlRbkF0WEJlNERNMjBnOTE5a2Vy?=
 =?utf-8?B?RXNjeFoyZTJuREF2cXl0NHZML1hlVW55YTJMeXdvK0x6M1ZyYXJUNk9QZk9J?=
 =?utf-8?B?dUE4VzQzN1dGUkNKSE41T3hvOWJ3S2N0d2t4UUd3a0o3Q1pVMG5VSVBvVEQ3?=
 =?utf-8?Q?b15qDYBbT1RfvyEjwAc2nlFb0QoRH95k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmdWd0ZlNUZYUjhLeGJqaDErY1JtU1orUFNoV0VIRjU3WmNuVjJ4cjRTL25C?=
 =?utf-8?B?ZGcza2ZoYmFhR3hMWHJYS1VYemkraFlJTFozYmZjWFJnV2Q3cnNoTmRiaUlW?=
 =?utf-8?B?cDd2SkxXTzNteTV0dmxLanNINEEzNVU0VWVQL0ZnYWtjMzdHZjlVOU83NC9h?=
 =?utf-8?B?WnY3aitzNTlQK1dpa2V1dVE4b2lCYW0rZUdTL2sweXJWNUtscVo3cGZaL2lD?=
 =?utf-8?B?L0FIRHNDam5MTTkxeVYxWjhYU3RKOUx1Zk5zMGp6SEdlV0NkVmhKTzFRRXBS?=
 =?utf-8?B?elk2M21HV2V6Q3VYaExacys4MythNDJYOGV0WlJ2NDh1VlpLVU03dkhhWThS?=
 =?utf-8?B?MEh6WXAzWWxRQmt2TVNzV29qM2VWRDlFQWlTME9WeXd1RGc3VURXUm1FZHV4?=
 =?utf-8?B?V05sNDFYNnRiTkFUVU9iOERBeVFqU0NBNjAwUUlCaWxkVEFHUjA2bEllcm9t?=
 =?utf-8?B?TkJCeUpPZUhXUGhrdFdMTUlmb0RHaTVReTdKOHBmWVJYV1ZVcU92V1FHS1E2?=
 =?utf-8?B?bzVTVUp2QUNxTjRnRWo1SWIrMDFzZ3JUVUtZZG5tVnIwd2xZbXdlQ0lnNU53?=
 =?utf-8?B?UE9lLzVEYm42YnFodERLWmM5dWRZbTJ3WVlsSGQ2QTFJR2tpcFl3M3A2MS81?=
 =?utf-8?B?SGxRTmRFSkJVNUFTeHFSYW8vOC9Sd2Q1Nzhva01TQ0U2b2JMckhOTWVkQkhV?=
 =?utf-8?B?V1BrQXdWR0JocFVKWkNnUXBBTmJObEtaYUtOUmM3YkdiM0t3VWpZek82aVVM?=
 =?utf-8?B?M3FyVzkwVU1zZjE5Nk9jUEpHWG1lc0VVY2VNc3M4bU9BZnp0NEFsYlNBdThi?=
 =?utf-8?B?ZExxSjhGVk43Q0hSQW9KOXNUb0RwNVVQeWJxZFlnaGt4VVJkSmlxWlNCalFE?=
 =?utf-8?B?QTY4UkdGVVRQL2lRTjZIUVZjM3dpVWMxTlc3SjRWeUFXV3VqbDhQVEkrS2lw?=
 =?utf-8?B?bkgrL05vejRxbWNsdDJYQW15bEl1dFEzNHdYNm9waEwvMlZOZE5NUGkwZzR0?=
 =?utf-8?B?cXVVMldkZk1JaytkR2sxQTh6OE80SXRaMERPVFcxaXhVMUdpNFZ3Mm9KRU9N?=
 =?utf-8?B?cW1LcFJidWxSNW0ySDhwUERwV09zVUJzUHh3MVNyaVFBTCttOEhrNlZWOGRC?=
 =?utf-8?B?LzAzUWpqbEphSjlCems4TWZsSzJUTGpEcVZNeTBBL3k2bm5TNi92RTBzTHkr?=
 =?utf-8?B?S2lvZDFTZS9iTFMyMDNBbGt4RUNibWlZVHJaOVYrYXdXRVRZU2d3VUtLenJx?=
 =?utf-8?B?eFdKcFlmSmpiKzFGa3RJWkVVOEE3cVR4a1dTN1VrWElkMmRSdUtrQU9TVFpM?=
 =?utf-8?B?ejRsUTV5WThxL1hFSGd2eFRMd3krV2VlK2NXeE1KYnF5OFplSVdmSllXKzNy?=
 =?utf-8?B?d25xNi9Waml0Ti95TW5IaFlEeDhoWnFsOEhVb01makFycXoxWTdudDl0NmZo?=
 =?utf-8?B?czlMQVVnNVNiNmpnU2tDeTNLVGZ1cUI0UTdHbVJFZUVBMDZwdy84NXNTNVRH?=
 =?utf-8?B?YlI1VHpQckZSYjFPU3UxM0FYSEw0VmhVQjF4bG50dXJwRkJJTjB4ZWhmMWZF?=
 =?utf-8?B?aHFEM0R4SVVmTTFOeTdONTN6QXkzdWlJeWFHNHhZaVZnRmdWa1pXVHZOd0k1?=
 =?utf-8?B?bXpFL0cxcTFzdk1hQjEvQ1lrWDBjcjlGd1VpTjZhd0ZhSWUrMVNHeC9GejFN?=
 =?utf-8?B?MGlVaFVNMVpiWksyU2lxMFNrekZmdk1vMnVKVnpjanR4eXRGTU9Ib0ZxVlp1?=
 =?utf-8?B?SzE4MkVCU1QrQU1LZDVqWnFzVmg5V3VjNVduVi81a3l1R0cveEx1RTRCbWFw?=
 =?utf-8?B?WHJOdHpSNXFnamtyaEs1UVo2eENrNFhha0FZdll0UFZjS29YRmNkSHhCeVpP?=
 =?utf-8?B?Y3ZIZHVJd0M0ampkeVg2VUprKzQ5TDZFRFIyQWkwTWtlVFBtQ0tTMXhPUU5h?=
 =?utf-8?B?eVMzMlVRR3Raam9aVjNzQ2NjRjRKTHc2NlJNRXREckU1MUVqdFRqSFBhYTcw?=
 =?utf-8?B?bWU3ZVJhNERJYmhyUVFNeC9wWWpOOEx4S2tteFlEUkxKWU9jZnVybTdmZG4z?=
 =?utf-8?B?NnJ6R00vbjRkbTVRcFN2aS9OQVR4bFdWZGpkWXgzVnJ4VDRueGZaSWNYWXEy?=
 =?utf-8?B?Y2l5NVpBNWxvOGhtWFY2a0FEV0hNT0lkMWZsRmxRc0ZLbkFLOWY5WUU5SWRF?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 381a5d9c-6d64-4030-9089-08de1b741dd9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 07:31:06.5606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Roho/pQNmja/r5YSGwYFwMnMIy7nxFh/TK4Ed7Vgo03QoC7R5YWTi8VUFqQVM9dNSAMuF4Ne1GBX613QGZcnDLXKACwQEU+Cq39TstbS1vI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8003
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

Hi Marco,

Thanks for addressing my previous comments so quickly!
I have one more remark to the wording.

> Currently if a user enqueue a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> 
> This lack of consistency cannot be addressed without refactoring the API.
> 
> system_unbound_wq should be the default workqueue so as not to enforce
> locality constraints for random work whenever it's not required.
> 
> The above change to the Workqueue API has been introduced by:
> 
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
I appreciate you adding the references to existing change, but
I'd rewrite above two lines to:

"This patch continues the effort to refactor worqueue APIs,
which has begun with the change introducing new workqueues:
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag").".

Otherwise, the sentence "The above change to the Workqueue API
has been introduced by" to me suggests that you are trying to
re-introduce or fix something that already exists in the kernel.

-- 
Best Regards,
Krzysztof
