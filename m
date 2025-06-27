Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DD1AEB816
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 14:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69CF10EA0E;
	Fri, 27 Jun 2025 12:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n2u+e7Yv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F4610EA06;
 Fri, 27 Jun 2025 12:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751028548; x=1782564548;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dHVMgzcg6PbpTtAkq7Mnrnya4mut/fPGs7eDLJzF2vc=;
 b=n2u+e7YvUB+Iha9vyj5weCIEqkwM2ZjPF3aUCSb+kxawIQbnUhrih2Sq
 l96jSuZzrS9RNyqX4bVGHXFhYDEITOqr30365K0Tk2rPsStxDAqUf0ABO
 R3mJhl1cMvH+Vlq+xg80TntFa3zagkWcG1DjieKHo5zw2/z2Q1vdEQbB1
 Z3DFVJ8dPNHs3d9PlXIdNbj22Ny1TVkj4jUgjBjMx0Tmrvc1bzXc/llJE
 kFb7UePCazaFGWE1pRnd4I0ekcRycfD9OF1mlmlruWR7A4UDym63NOyfj
 UiANDNYV05D9rer7CuHdrjZY3ofymTbVBVA6Tkq9vyj7lc1U1dgGgte8k A==;
X-CSE-ConnectionGUID: M5OdQVgyTYC31YJh1+Jzqg==
X-CSE-MsgGUID: ypnH4++gQPu5T6zui40Kgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64031870"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="64031870"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 05:49:08 -0700
X-CSE-ConnectionGUID: YR6q/B4zR42U3roZZvbXFg==
X-CSE-MsgGUID: q0yq4N0ATeek+6JNGMp4hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="152969612"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 05:49:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 05:49:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 05:49:07 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.68)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 05:49:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwTNA2FbGTov05HYJKHU2VCxxj3YCUHMXloaRWs9F+EE0q0U1VQk46z28jNWW2hWy/qtCxw2ldWFkTEsG2ItwFDJ0SbkoSgEQqN4CtWk/X/7OJ1fduOuE4G7FTlI48Fq7z4U8g1Ph7wnGWHkGAMCPypiMk0Z5v9CTps2Z3TCNtPHpwbvA6E8K2wdSJEYKWT8J6rEX52oQ4fHVtF0i7JOa+yGCZDzZwmbf9Fz0Yr9nHVmPhylte6ZJJbEsOD9gHdZfSkxQKEQ3tsq1j9CmOH2qvRbbMP2H5QX8K0SsHOJudVEjIJBKWIb8UeAiXJ8kSZ3mVGIYtw5KK81PIHFOU/beA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpQyjiD78eErZGagRvtO0Q9VM7BYjNg5O6YPt9aZNlg=;
 b=V4CUFwXd86M2sJ3wkZFk1oW01o4jTgKIKSovs1HA1dQlcAfC9YAAeF555PQe+iX6MMVE+9Oo9/iXISVKcm85wKKuTh23p9u+GqEPqSrAVlsApCRsEnGe7W+Ow6CE3PB9wb9+tdAlVq704FbHqzS6v9B/8c75zK1vWC/MzUhpqRuS4JIiNlgJinq+VqNRWh7goycqgTLLHeQmQZfUwIgLQTFbX/2xLrAYTynWBFbJs+bdBUi8KSWZaHhOZuaxPFMMmLvI0mBmE9leNr/ACqmFb9cO/gHNUyHetnSir5WMN6u/PyQBc6NQoFPas+oLxwySlQD9X5kLtujj62JBUmsiPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH3PPFD9C09B4A7.namprd11.prod.outlook.com (2603:10b6:518:1::d54)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 27 Jun
 2025 12:49:04 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 12:48:59 +0000
Message-ID: <1c605457-9df5-4ea4-b5c9-92413bd58eee@intel.com>
Date: Fri, 27 Jun 2025 18:18:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/10] drm/xe/xe_late_bind_fw: Initialize late binding
 firmware
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-5-badal.nilawar@intel.com>
 <f1bfbdf6-8f66-477d-92e3-50612b4c4b71@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <f1bfbdf6-8f66-477d-92e3-50612b4c4b71@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::12) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH3PPFD9C09B4A7:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a5e2509-cd82-4ec0-3867-08ddb578fc19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFpjUUl5Nm0rNE4rS3ZwdzlqcFU4dVZYMjhIZnRPVU9tVGd2M201b2kxczJ0?=
 =?utf-8?B?UUovM01QYjlxb3NJVXg0K1dCSjMySkFXVEsxV2RNVG5IbHNIYzJOZTlFdDR4?=
 =?utf-8?B?VW81dHZ3Zkd0YnBVOGEvQUdVdjNobjZXbHU2THp0VHdoQWlWQUFJaVlLQ0ZZ?=
 =?utf-8?B?M3Q4WmhiR0Y3VXpkUGtFYXVDMjN5RTJJK2M4dUxqTGpSUmd3R3hDREhUUHpj?=
 =?utf-8?B?LzlJZGIzOGNHTnZkSWw1cm9UNjVpS3lRTmR1VE9TM1N5b2hDbkNMbFZmMWV6?=
 =?utf-8?B?SzFjM2llcXdLYmJkQzVyVGNXYjR6akowWVczK1h0Z0lLUjhhNnF1d1ROd2c5?=
 =?utf-8?B?K1VvQjlzTmNvc0lSMVdCTThuNkVDQXhoV3JGV2hIOXRRS3hTQ0x5ZlVqcS9J?=
 =?utf-8?B?bStRY2NGR2czRlZNSlEyaUtZV3hVcGVjbStDbU9VMWVWQmM2UjN5ZUdPM0Fk?=
 =?utf-8?B?bms1alhXem5YTlhnU3pqM1drS2hGVkdkYmhrQ2hrVFpVZVVwNzlucnFrNTFL?=
 =?utf-8?B?MDNJR2lTTzJLQmdoN1dUdEdHUHp5ME8yajJybS9xUGdUNHhyL0lLeThlbDBQ?=
 =?utf-8?B?Rk1qR2FiMWVmdjVpS1dZbFVJaGY3NWdwMjY2bXZpcFdoK3hrdk9yOTdUT2xx?=
 =?utf-8?B?QWo4b3RVV04yMlFFUi9haEdJMHlGK1REeTAwR1puUWUvZGNQODVSTW1kVGF6?=
 =?utf-8?B?dGJLSXgyUzVOZzUzb203WGl3dHJTWVlTWGFla1B5STRONytrRkxwTWNjVTZZ?=
 =?utf-8?B?SnNOaEJSbjk4TWlXMnBFSlhZMTFvZjN2Y254L2FZVUdQTTFpa3kvbjVRT1Nt?=
 =?utf-8?B?VlJxcmpISEF0TkZzYWwvM2loUjU3SFc4T0o5cm94TWJEeC9zeXl1ZU5tNVo0?=
 =?utf-8?B?UWhqNXZCV0RhdDV0UzFQQ3pGU20xWHNoM211aUtqemJyOUNlNU5BclVFUktP?=
 =?utf-8?B?ZldKWDhWLzhiVnhRQTJxeXBGTWJnTEhWTEFuaXhsV0RsbFR2Z2dzc09EaktD?=
 =?utf-8?B?MFNuaHZrL0orcjhNbEROb05NQjZKSk43YTJ3VjlnME5XK25raWFsNm8xL3cy?=
 =?utf-8?B?ZWpZVzh4SHNoYitseFN2OGk0VFhEUmMvcEZsYnErd29pRlhDM0duVS8ybU91?=
 =?utf-8?B?R2xvWEE4dVpra1NydndDQ0dNZ2J0R21SR0VPZWZ5cWMraW82RldUT2lMTEZa?=
 =?utf-8?B?ZjJoK1BCWlFSZzZOcTEzR1RnU2RadmdWeUg1K09XaWZGckVSWWJGSkRvcDlj?=
 =?utf-8?B?UW9BLzk4cGFENUZLTzAvbjVtdzc2OFpMcWNLMWNwelNsaEs0TDBGRlFwZW9G?=
 =?utf-8?B?VHhZY3dSRDFDQkVpOFMwOEViQmxHWnhkQ25ZOUE3UEwrL2FYMFlqV3c2OFhB?=
 =?utf-8?B?T1VDR21BSVpHclhvbEZCaXFib0hmZ3VXOHY0K3hNZ0R1QVRiWFJtRzZBckpm?=
 =?utf-8?B?MHk3UFNuQ3RYRk4wRE9BVW9PRndwdkltU3BKVGYrNm0xMy9JdGJWSzVXRHFC?=
 =?utf-8?B?akYvdGtQNExSQ0pseW5HT3Bxak5pSmhRcUY0R2h0bDgzV24wbzJXekJmZDMy?=
 =?utf-8?B?eFdkRUF3SW5GMGE3K0xhOVA1WWhremQ1NDB0QjB6RDB2d29SbE9hWjJ0c2Zv?=
 =?utf-8?B?VFk0K3oxYXJCZFpkWE52U0c4NUp1VWdjNEhmbkVZMS9obFN3MC90VmY4VDEy?=
 =?utf-8?B?VTlBU2xHTCtFb0tnOXQ1UENqR3pVdGlXbGVrNnRiWVBpaldmYXFxYm9jY0hu?=
 =?utf-8?B?UmtNQmxnVXZyclNIT0xqWEpZa2FqUktMeWNEYWtsdEZkSnVLSUZRS2F5Uy9z?=
 =?utf-8?B?NkNEUnRWNXJpb3BuU3hXenpPNGNQQ05ScVZoTk5ROTYyOVZDUTV4M1M3YkJJ?=
 =?utf-8?B?VmMzc1dUZTBvdzZuM2R0REowdUdlYjRvQ0lTN01hRXlHVklvdDJiRTlxejQw?=
 =?utf-8?Q?cAtz9Fr7/kc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWNVNjR5WHRGWlgxTVBQVW5ndklwLzdUWTc4SExXZU45WDVaSDA2eGg1U3ps?=
 =?utf-8?B?ZFkweFYzZ2FMc0I4T0kvdWxMaWJ3MFlUalpnK09oZnFmSDJQTkNIVFN2eW54?=
 =?utf-8?B?cGwxWC9FQUo0ZWY0RUNZMC9GUDZpWGFRV3M0TWJMMHUvYitneEFJbmpqUFJ2?=
 =?utf-8?B?RUVJSHg0Y1JVOThVUDFyR3M2Z29oOUxpc3RuT1J5SE9jcU5TWE52dWY5YzVy?=
 =?utf-8?B?UmRlN1NNRWxtaDVTdjgxT2o1VE5waG9HSHk5aEpkSURqVksrd3ZaclJucFNj?=
 =?utf-8?B?dllTSjlPYWt0bU82UHJuZFA0QnFaNWtObTdCNThQN1J3cTFSMjViZ1loTTdH?=
 =?utf-8?B?elI3cTE0dlpXMEVQMlpXR0lkTERBa3NpS21ZeFJiVmFRSkEvK3l1WnRLMUY1?=
 =?utf-8?B?WjVSOFEzcnQ5UmtJdUF1RnNiS3UrYXpxMm5NdGl0TE9jcTExanFUNHRiZ2w3?=
 =?utf-8?B?STBKTHpBbUFHQUpmY0pnbHdZNFNreXpkQVlMZUl0SytzWEhiSDZ5OFlHOWNC?=
 =?utf-8?B?aXJXMUVUVHFQOEJwYW9ucEYrVUYwQ0w4a3BLK2RENEFBV3hQSXhtU0tWbEM4?=
 =?utf-8?B?bVNVRGNxaUZZdW9zTm9SWlZXaGNsbURjdW81YXdsMFFaVXdqUHp0TFc5RWtu?=
 =?utf-8?B?RmtsclJqZW9mSmRGeXRER1lOdWFPRkJlSHh0MTVHNm1lR0p5SzNLRmU5UG1O?=
 =?utf-8?B?TDBsVTlPcy9CcWMvRVQyek1OTVZnYnBFNkZlclg0RW5HWDhPZ2FNZHRRd1Vy?=
 =?utf-8?B?eEJ1UnBGd2lsVTZoa09DOXFyVy9pU3R5SlZWY2dlbVV2bkVDR0pSZ044NmF2?=
 =?utf-8?B?eTdzaWJ0NDZzZ211R213ZnFnUm9teDJlUGZhM2xxVlpjeDFJYWQ3ZXE1TnZB?=
 =?utf-8?B?YU11Qm1RTDhNTnVTVjBZZjE4OHFCY1Ewa3BMbGlPV0FRbnhMN1lPdjhSbG83?=
 =?utf-8?B?VndnWm1vOXJHeWNtTzd4UkUya29rdC9nSGs5VUxsazVBOFphQ09SOEgrNWpt?=
 =?utf-8?B?czVnUE84S3kwa0l1Z21Rd2ZuT3NBVHlQN0JnY01Pc1haa29HUmkxTUxqSDFk?=
 =?utf-8?B?S3J2T3IvM0tPRGxBTkJmcUJtMGJMRUc4dEkrL2JJdlhtREM2eFhGOCs5NWtQ?=
 =?utf-8?B?dDlRWWJtVTc2WGJRMFVMdTNxSnIwcmpGcHlDNlFsMncwSS85MG5Ka0VxcVQ2?=
 =?utf-8?B?RVRGcHcwZklvZG5FSGNKWUJha3JUVkVwVFcwQ1VZZ1A4dHZBZnRYYlJibWdk?=
 =?utf-8?B?R2dqaE9GdnNILytPc0RrMWIwd081cjRWLzNwbFRoWnFaYlI5blcvenRJL3hB?=
 =?utf-8?B?OGgxRmI5TGt3OW9RWFRUaWhtWEVoSnQrYW5DWXJzNUc1bmllNzJKbXdaSUFP?=
 =?utf-8?B?d1BLZ2lCWVRQYVdZcDFhaU5oUUVWVkZwcXZuUVdmZjQrd1NjdXRCT1E5N3dG?=
 =?utf-8?B?MWZGVkRzWnZ2d0I5cURsQkErRkdSZkpaWWRLeFR5WllqUy9paWJZWWJWRk1V?=
 =?utf-8?B?R041ZThHU3pUOEFldmZTaWFYSWhUSGFYNnQ5UTV4SzAzbEZ4UlJka0pFS0l5?=
 =?utf-8?B?ODVkaThhRnMrcnltQUMvSGp1MWEvTk9nOUdTbXZHdW9wanFwZ0RlMTFKSzB6?=
 =?utf-8?B?VDU2L0RQTkZWSWl3dmpJTUdHWVRQVVNTSG5yc1dKSXRnblZQS0k1cHhNZ1pQ?=
 =?utf-8?B?RHpscUIydi9aaWlJSHErOXRyOVVMcmRPVnd1YUZBQ08xbzJ3Z1VpSmUySGF1?=
 =?utf-8?B?eENTb1U4WGZvSFZlREJiREMzNDcxaGtJd1cwTGtvYkZkeTFqUEh4TzExa2Rq?=
 =?utf-8?B?Tnh2TVRXT0R1NWNGT1c4U1VZK0l0K3hSZTg0Wk1Benl1NHhjeUVybW5oVFlN?=
 =?utf-8?B?MHlYN0d1M1FEd2VuV25lNzJicnE0OGRaZWpvZTd0eUU2VjhBVmQ2Qjk4N3F5?=
 =?utf-8?B?d1Fkc05YaHlRdDRIRjRDQ2RUUm9tL0hyR09yOGljZ2ZORXRzbVcxRktVZmMr?=
 =?utf-8?B?MmR4ZDJCYzFXT0VnL3BEMVMwdnBPV3UwRmkwK3FuQmJXRThFRS9Rd2ZtdmVT?=
 =?utf-8?B?VTRtTmV2bm9pejZJMmpYZ0hxTjJiMDhrY084Vm9EaEliSHNpYUdKV0dsbGhi?=
 =?utf-8?Q?mYag3q1Ec2I6bNBeQ4Rf+xl11?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5e2509-cd82-4ec0-3867-08ddb578fc19
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 12:48:58.9500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7wGb4pGFL15JZ1AK4RQLs4EMf1cPG7hgXtJdLCdImVU2cUIXUcugJ7wZeowaBOrTAoYTr6JSewM7S0Yx9y29Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD9C09B4A7
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


On 27-06-2025 02:36, Daniele Ceraolo Spurio wrote:
>
>
> On 6/25/2025 10:00 AM, Badal Nilawar wrote:
>> Search for late binding firmware binaries and populate the meta data of
>> firmware structures.
>>
>> v2 (Daniele):
>>   - drm_err if firmware size is more than max pay load size
>>   - s/request_firmware/firmware_request_nowarn/ as firmware will
>>     not be available for all possible cards
>> v3 (Daniele):
>>   - init firmware from within xe_late_bind_init, propagate error
>>   - switch late_bind_fw to array to handle multiple firmware types
>> v4 (Daniele):
>>   - Alloc payload dynamically, fix nits
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 103 ++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  32 +++++++
>>   2 files changed, 134 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> index eaf12cfec848..32d1436e7191 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -5,6 +5,7 @@
>>     #include <linux/component.h>
>>   #include <linux/delay.h>
>> +#include <linux/firmware.h>
>>     #include <drm/drm_managed.h>
>>   #include <drm/intel/i915_component.h>
>> @@ -13,6 +14,16 @@
>>     #include "xe_device.h"
>>   #include "xe_late_bind_fw.h"
>> +#include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>> +
>> +static const u32 fw_id_to_type[] = {
>> +        [XE_LB_FW_FAN_CONTROL] = CSC_LATE_BINDING_TYPE_FAN_CONTROL,
>> +    };
>> +
>> +static const char * const fw_id_to_name[] = {
>> +        [XE_LB_FW_FAN_CONTROL] = "fan_control",
>> +    };
>>     static struct xe_device *
>>   late_bind_to_xe(struct xe_late_bind *late_bind)
>> @@ -20,6 +31,92 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
>>       return container_of(late_bind, struct xe_device, late_bind);
>>   }
>>   +static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
>> +{
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>> +    u32 uval;
>> +
>> +    if (!xe_pcode_read(root_tile,
>> +               PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), 
>> &uval, NULL))
>> +        return uval;
>> +    else
>> +        return 0;
>> +}
>> +
>> +static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, 
>> u32 fw_id)
>> +{
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +    struct xe_late_bind_fw *lb_fw;
>> +    const struct firmware *fw;
>> +    u32 num_fans;
>> +    int ret;
>> +
>> +    if (fw_id >= XE_LB_FW_MAX_ID)
>> +        return -EINVAL;
>> +
>> +    lb_fw = &late_bind->late_bind_fw[fw_id];
>> +
>> +    lb_fw->valid = false;
>> +    lb_fw->id = fw_id;
>> +    lb_fw->type = fw_id_to_type[lb_fw->id];
>> +    lb_fw->flags &= ~CSC_LATE_BINDING_FLAGS_IS_PERSISTENT;
>> +
>> +    if (lb_fw->type == CSC_LATE_BINDING_TYPE_FAN_CONTROL) {
>> +        num_fans = xe_late_bind_fw_num_fans(late_bind);
>> +        drm_dbg(&xe->drm, "Number of Fans: %d\n", num_fans);
>> +        if (!num_fans)
>> +            return 0;
>> +    }
>> +
>> +    snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), 
>> "xe/%s_8086_%04x_%04x_%04x.bin",
>> +         fw_id_to_name[lb_fw->id], pdev->device,
>> +         pdev->subsystem_vendor, pdev->subsystem_device);
>> +
>> +    drm_dbg(&xe->drm, "Request late binding firmware %s\n", 
>> lb_fw->blob_path);
>> +    ret = firmware_request_nowarn(&fw, lb_fw->blob_path, xe->drm.dev);
>> +    if (ret) {
>> +        drm_dbg(&xe->drm, "%s late binding fw not available for 
>> current device",
>> +            fw_id_to_name[lb_fw->id]);
>> +        return 0;
>> +    }
>> +
>> +    if (fw->size > MAX_PAYLOAD_SIZE) {
>> +        drm_err(&xe->drm, "Firmware %s size %zu is larger than max 
>> pay load size %u\n",
>> +            lb_fw->blob_path, fw->size, MAX_PAYLOAD_SIZE);
>> +        release_firmware(fw);
>> +        return -ENODATA;
>> +    }
>> +
>> +    lb_fw->payload = drmm_kzalloc(&xe->drm, lb_fw->payload_size, 
>> GFP_KERNEL);
>
> here you're using lb_fw->payload_size before assigning it.

My bad, I will fix it.  But I'm curious why drmm_kzalloc, unlike 
kzalloc, doesn't perform a size=0 check. When size=0, kzalloc returns 
ZERO_SIZE_POINTER, which is absent in drmm_kzalloc. Even if drmm_kzalloc 
had returned ZERO_SIZE_POINTER, the check below wouldn't have caught it.

>
>> +    if (!lb_fw->payload) {
>> +        release_firmware(fw);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    lb_fw->payload_size = fw->size;
>> +
>> +    memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
>> +    release_firmware(fw);
>> +    lb_fw->valid = true;
>
> You can now use lb_fw->payload to check if the FW is valid, no need 
> for a separate variable. not a blocker.
Sure.
>
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
>> +{
>> +    int ret;
>> +    int fw_id;
>> +
>> +    for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
>> +        ret = __xe_late_bind_fw_init(late_bind, fw_id);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +    return 0;
>> +}
>> +
>>   static int xe_late_bind_component_bind(struct device *xe_kdev,
>>                          struct device *mei_kdev, void *data)
>>   {
>> @@ -86,5 +183,9 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
>>           return err;
>>       }
>>   -    return devm_add_action_or_reset(xe->drm.dev, 
>> xe_late_bind_remove, late_bind);
>> +    err = devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, 
>> late_bind);
>> +    if (err)
>> +        return err;
>> +
>> +    return xe_late_bind_fw_init(late_bind);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> index 1156ef94f0d5..93abf4c51789 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> @@ -10,6 +10,36 @@
>>   #include <linux/mutex.h>
>>   #include <linux/types.h>
>>   +#define MAX_PAYLOAD_SIZE SZ_4K
>> +
>> +/**
>> + * xe_late_bind_fw_id - enum to determine late binding fw index
>> + */
>> +enum xe_late_bind_fw_id {
>> +    XE_LB_FW_FAN_CONTROL = 0,
>> +    XE_LB_FW_MAX_ID
>> +};
>> +
>> +/**
>> + * struct xe_late_bind_fw
>> + */
>> +struct xe_late_bind_fw {
>> +    /** @late_bind_fw.valid: to check if fw is valid */
>> +    bool valid;
>> +    /** @late_bind_fw.id: firmware index */
>> +    u32 id;
>> +    /** @late_bind_fw.blob_path: firmware binary path */
>> +    char blob_path[PATH_MAX];
>> +    /** @late_bind_fw.type: firmware type */
>> +    u32  type;
>> +    /** @late_bind_fw.flags: firmware flags */
>> +    u32  flags;
>> +    /** @late_bind_fw.payload: to store the late binding blob */
>> +    u8  *payload;
>
> Why a u8 pointer and not a void one?

It should have been const u8 * as firmware structure has uses const u8 *.

struct firmware {
         size_t size;
         const u8 *data;

         /* firmware loader private fields */
         void *priv;
};

Badal

> Daniele
>
>> +    /** @late_bind_fw.payload_size: late binding blob payload_size */
>> +    size_t payload_size;
>> +};
>> +
>>   /**
>>    * struct xe_late_bind_component - Late Binding services component
>>    * @mei_dev: device that provide Late Binding service.
>> @@ -32,6 +62,8 @@ struct xe_late_bind {
>>       struct xe_late_bind_component component;
>>       /** @late_bind.mutex: protects the component binding and usage */
>>       struct mutex mutex;
>> +    /** @late_bind.late_bind_fw: late binding firmware array */
>> +    struct xe_late_bind_fw late_bind_fw[XE_LB_FW_MAX_ID];
>>   };
>>     #endif
>
