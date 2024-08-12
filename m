Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D204694E83D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 10:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5271210E089;
	Mon, 12 Aug 2024 08:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DOWba2XQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1A210E089;
 Mon, 12 Aug 2024 08:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723450025; x=1754986025;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ifvfDSU5hU6ixZN6NrVZwiJs33vJq7zJQohhxnG0nGs=;
 b=DOWba2XQnxWTHCIgvbmYbjQiF9q8sktijax72JouyvgT/TD0pnO5L7PH
 k6jthuv1u/o2auUS4WRZrLMp35C7DdBeJuK0S8viIJ+sYKsFnOuJmUDbe
 m1AH0Og1wOGQoukYaK9OhUSSlOG20SCNn1bBRpJzj9xIPJbSsMP4mwytj
 rw5ZxH6UXDiEfNI+zyYs0Iq6wuOzcNPp8DhsLcSuCfcB7RX9cPlOFB0Fs
 OU53sIEWe38Uw+qNZx79Z6z44ghDEcnxLsp8dA5UQiFzTi/vVX0bXCOKI
 xx2r0OiCs0v02kWd4f10ayhz+nJiiTDn3HfgazVsk4YvsmAYaEMdvZVy1 A==;
X-CSE-ConnectionGUID: qu9DjmSEQiK+vK/WbBLcYw==
X-CSE-MsgGUID: 8NvHDrRPTBqRrJblRHp3BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="32167221"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="32167221"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 01:07:05 -0700
X-CSE-ConnectionGUID: 356kAANDQdmevqyP4DGLIA==
X-CSE-MsgGUID: GTHCmBtfQii6qt22ELefDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="58085508"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 01:07:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 01:07:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 01:07:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 01:07:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZVK//JFGt8N3AJwHsoLQNw7RgdJX7oPjqNrm/NUd5x8M1BqjWNhmGjf5U9OD7MCZjtWfh3+0X/6f1x4mRJQ3HI9BpTFPTCtx+7voeNwf4M9ek42lx5Hhzit+g7EtGVDGajdvsNhuDm+4kOm8I7ytSIKHt4Zrzr3mJm1T7+wCNHbf6IiS6QU3dzcqL6/LjX2Ar03Cp3O7lamcvywo4Vh/72OxVXc2tuj0qotwQaqn28Ujd0UUUsm0myF3zugxNznCsVTBZNFaZYKO0Dnrtc7KKhoMeQ7IKuFahTpKEb9M6cNC+c6HOUKZqd6LqnGTV5DSDHuDRYeupw7bYGxfwEKjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+h+0m94U35WuQd6Ti6/GixhWrkFuuet38OgJa4orV4=;
 b=beqyBFx9q43M6fZ+UciwOzCD9n63Rfy02cROeH0cMhYMHKUlsuEc3V41QO0wR005E+aA0L6eLktwISNeLgKEWN3dLx9l2PmOMbdPX0hbxx/Ah0W5zzJbu3NEy1DyscIirkOWX1dJYv9d/CXmYXAnnJ4uChjkQ9lCVgFLxvBqwzIJXWJs48ivg0TP1C+iUP1fj3RtbFKANA1uDwMP8th0asyDrOO0WqkFpl4mkurqhofl7vrjuuwGnu9GNQra/dH+uuU8ypKhbHtR+efJpx+UTeUZ4A98sKzpfakjjmr1oaYu2w7c+h9n99Ph5kdXS0bvcjJuchZO4zOf24G/uPn7PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA3PR11MB7555.namprd11.prod.outlook.com (2603:10b6:806:311::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Mon, 12 Aug
 2024 08:07:01 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 08:07:01 +0000
Message-ID: <97712faf-2859-4245-a15d-2805f25b4c6a@intel.com>
Date: Mon, 12 Aug 2024 13:36:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/uapi: Bring back reset uevent
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <francois.dugast@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>
References: <20240812074812.1457164-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240812074812.1457164-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::14) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA3PR11MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 406e5348-42f1-42eb-f2fc-08dcbaa5bead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHh0QTlJSWNkblc4WUR6VEFTa1dJaHJaR1hDd0ZjV2dzbDVDN0tqYjdmRkJa?=
 =?utf-8?B?dUNFUVAwVU9QVXJWZkZzY3BDTWREMGdWMXBxTTgyZ3orNnlUeFM5WEh5UmlO?=
 =?utf-8?B?dDZRUDdrcDlwQUJhTXo1Q3ZSWmVXcjRXMzNJUk42aEZta3JWWDZjSWpHL3R3?=
 =?utf-8?B?bWhCL05iRHNocGRUazBkWUhXVGxGYkl5YlNOUGNiU3c0djNPY3VJWkNNUVlB?=
 =?utf-8?B?c2NISG80dzJzUmxBSEZEVTgwdXA1WWJvNlVvaVJydmxXMGJDZTRXcDFJT2No?=
 =?utf-8?B?TnFZOFllQUZkTlo3TU9BenZKa1lSMFpab0lldHNvK0V6bm9hTFYzTHp5YWxW?=
 =?utf-8?B?ZGRyMkY2ZlM5dHpHbE1SV1VNY2h4STcvVVl5b2NidE82WkRZVEd4cHBmaEVk?=
 =?utf-8?B?b3kvemRFN1ozRms4VW9OOGxmS0J5Z2tzYU1yenpyeWlubGV4NDZ4MEo5SDlI?=
 =?utf-8?B?QlBKUDVzbjhhNkw4eCtVaGsxdkhzWVFsYllGcUFzeW1qcnFVdTFFRlV5MUdk?=
 =?utf-8?B?K1poaWk5cHpyVlYwSzRnNG4rdC9wU2JreWJXMnkxd1BHdjlrUlMxRWRPbURH?=
 =?utf-8?B?VWlmdGxkNVNEcVRFUUF5WjBDVzRFUmFPYnZhU29iK1hWSXNRcnRhd1NBVWtX?=
 =?utf-8?B?dnE5dmZVWlF2bHJTeitvdENaZVBWbkJ6RmwyVXRZNjM1bzF5ckNweE1WanQ1?=
 =?utf-8?B?UkN2R2tmYXl1NHN6TWQ4bHVLSllYUnREcnJnWHNqVE1BOEhhM3dSQmc4VU13?=
 =?utf-8?B?SW1MRGZJQ1dsUldEVmtSelBvVy92L3REWFo0V2JFdm5BVTZQU1ErSjBiall5?=
 =?utf-8?B?RGFwUjJUV3JMNW1heXZDL0RzQ2JYL3ZqSHNuNitsa1EzN0laRW9aWnNTRlNE?=
 =?utf-8?B?ZzEyeGN2ZkV5eDJ6akFwS0hqRFJ3RlpaREVxdXF0N0tmRFhZMnd6ZzArOExt?=
 =?utf-8?B?NWhtL1JnVFVYdnZORmhpb2lOREplS3dFdkpYY2gwUlVkdkRkQURrbGFJZjlN?=
 =?utf-8?B?eDFQVDFvR0pjS1lxQ2w2RnBmMlZLbjB3VjNpSzZ1azBZL1ZNWGJsYnRpUS9Y?=
 =?utf-8?B?UElLTzFFSy9OWWtMclVzMXNCT21RTksvcW0yUzg2YkVUNldybTZxV095VUIv?=
 =?utf-8?B?UzVkL1JpYy85RGVZU2pCMStYZnl4N0R0eGtIejVuU2RkSnl3TG9SWElzL2Zz?=
 =?utf-8?B?M1pjK2ZMVTlXVCtSQjdBekREaXNJT2pjZDFVcWN6MXM4Rm9ianRGMVV4c2ZR?=
 =?utf-8?B?ZGFTb3ZBZG5ML1duV0hXR2s5K3E2YjBLZ3h0SldpSFJxY2VhQ2lEdFZTUWZl?=
 =?utf-8?B?ZHozczFSbFZBNXMwNHhIa3VqV3VxZlpkckJ0R2NiRmV3aVljcjdGU2xkdnZM?=
 =?utf-8?B?MlNwR2F0ZXlPazF2aGRxa1ZibzhHWGlzT25jaTV0d2owQUNhYVhkV3MwUW1T?=
 =?utf-8?B?NHB0ZjRDNWR6YjFXYjN4eXpCcm9iOFdmcTNmeWpLcmVQVmRJM1dweVg3VDAr?=
 =?utf-8?B?KzdPblFOekJUZjZGT01uazB5MXlyVVRhdlpuancvT08xL2lVQXoza0pXT1U2?=
 =?utf-8?B?R0todTBPSkpHWXJGRDBxVVd2ZUFwc2E5UmRiS3BNc0NLUXNVZzhDRXZHUkhu?=
 =?utf-8?B?YUhyVTE4emk3dnhRWmZnY0V0L04vMUQ2RTJkL1lvL3hNL0RadXhYQTMydWRE?=
 =?utf-8?B?NFo3UnEvOXBpRUQvT1NkYUU4U09yTVNqQWlpK09uRTQ2dHZ4NmQxZ2pMYlBx?=
 =?utf-8?Q?6shcDTCHgmdHqQGgjI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUo4Y3hwcityU2dadG9OM1JxR3FkUUVGUUVmWllHZzlTb01UNytvelRLemds?=
 =?utf-8?B?OGdnTCt3dUcvZUVNMjF1emFqc2lGaXY0V2YwOTVMaDNFcjdLUmRWdmxsRmcw?=
 =?utf-8?B?WVcwQm9md1Q0VForTTFZV01abTd0aHpkc1hoOEpXNWhCMldIUURFZGxUVHZM?=
 =?utf-8?B?aHZDdXYzR2pmd29wRlpIMlRXNTFIQUtXNmhWWUhGOVhJTHIycTB2UXI0dmVx?=
 =?utf-8?B?Mmx3TTVIZStSNXg4RmNPM1NVWkhiT21TdGwreVAzQU80UUtVd2V2emtJS1ZU?=
 =?utf-8?B?akh4VnZ0dEwzTmdOL0toYjA4WlFocE1sTE91eHo3TU5ncU41c0JOUmhhRUhj?=
 =?utf-8?B?UWlza2J5Y1JEQ3RwUytReXhwTlhlc3I3VlFubFRDQlVCREhFMEhqeEF5TnFK?=
 =?utf-8?B?SHlyMzhNSU04OXFMOFlSSW82Q1dlNnVqZGVFdVpWbGlGSzJWeVBCSXVRZEZp?=
 =?utf-8?B?aTlhNjNhMHhucUNtaHNDQk9lV296eWVOeTJRTEJvRDFrV0FIbE43L1h3cWpi?=
 =?utf-8?B?amJtanlXSXI0SU1kK3NpbVlSSzhKcFNRSThXNnRDc0tTemtBNUIxK0hqQUFN?=
 =?utf-8?B?djBiaUlHd1V3Mk9RMjh5bHJYeEU1T3hZdklzbjVIcVRaM0ZLT3QvUHN5TFA2?=
 =?utf-8?B?eGtMVEZhQ0s2bGFNSEtCVnhKcy9LSkVlT1lVa3hYSHo1bTFUSXhrK3I0NUp1?=
 =?utf-8?B?WXMyLzZpbldkZldJTVg2VU5TdkRYdHdLT2g0OFpkbnN5U1FFV3BEUFYzdi9Z?=
 =?utf-8?B?NWs0YjVQQ0M5cnVHZFlRWVlQQnlKZkQvMHQzLzVsK2R0S0krL1M3WHZ3SlBZ?=
 =?utf-8?B?RVI4VkRYNEJsRTFnRkdWSHZvenhUZnc4WkdCTDV4OU5QTFpnck5BTUV6Rmd2?=
 =?utf-8?B?SGIvK2JhTzNpdmhnWmlGL21LSS9SN2lURHdCdGxnZ0F2NlVxK0JZaXdsVWQ4?=
 =?utf-8?B?N1BDQmNhV2paMUYreU9vYUdmenhQOVBzNFlqV2NpVHJHaWY4dEllNWJtNVN1?=
 =?utf-8?B?M1Q5bGRzYW9YRjNoU0ZzWlZ2ODErbkFlZUVLT05DazArMzQ1RmlmbEsyb0wy?=
 =?utf-8?B?c0xmM0dnRjRiUThyektlc05JSjhYa3cwalBGSzUxcjVraTBPQjJrbThHM3RG?=
 =?utf-8?B?NjRweDlhZWRxRmV0TGI5Tmh0cHZwaTgzbGYrMmsya3lHZHhRU2N0cTFvYVo0?=
 =?utf-8?B?MEZjYW5vY090bnd5RGowM011ek5OazNBWGYvaFpPMWlNdkVKQUpOWlZMNmFP?=
 =?utf-8?B?bUhXdjZGK3FJVmhqSXE2ellMSWJ5VytYQTJjQjhON2VUbDJueDdKKy9nbWlL?=
 =?utf-8?B?bTRKSzV2dzJoYVhQOWFkanZqM1dlS3IwZHdaOWJ0dncyUkQ2UnYrNHltUU40?=
 =?utf-8?B?eUlINUlIbytwS3pqZnRYcEJuWVZCTU5YYnM4bGlZMjdiNjdEbmFRVnc1T2Ni?=
 =?utf-8?B?dk80QlNMbElhWDlVSUZFWVRlbmlGcFVkQUhwVUhQK2JKU3NGQjRnamZXNzJ1?=
 =?utf-8?B?VGlvaDlKdFc4U1VxSWNmbzRWTWs2SW5ONks2MjFlak5uNndQMHQ0TnhkZkVT?=
 =?utf-8?B?WFFvajVBNS92N3htWGJJVXJ4L0ZsVzBOK2lSTmxNS1JsTU93RGdhUmVZU1Zv?=
 =?utf-8?B?ZnNEN0g5T1JJSTlsVkpzdFBKUHBESytoSlFXWlJPUW1uajhzWTlFVWtXYVpz?=
 =?utf-8?B?N0kvYWI5emJ1NHpwR0RBNTAraTY2c25FQjRvb2RJaUhVK054RXlxUVBOOWFM?=
 =?utf-8?B?Rmtsc3BXbE15MUxvejJ5SkQ5TmFpSzNxVDg3bHdyVVZGeWlVYjBvSURSTng0?=
 =?utf-8?B?czNWdTdSOHFsc2Z6d2Fsc0lQdnNIcjVoWTlxeXlCaGNIMUR2KzY0TkFVTGpU?=
 =?utf-8?B?NUFlU3pqRTRqaWdKVXFuaGEzTldZY1FrZEJ1WUs5RWxTT3EvRkNPLzA2Mkx3?=
 =?utf-8?B?K2JhRFFTcDBtSE8vRnJQbWJRVWFYSlZSNXdwOEJXcUpmWUlaS2RseTNJQ1hB?=
 =?utf-8?B?UTEyaWtRM2krcVRsc2dCNElsMFN2a3RXdEtaYXpqUjVGQjRPRWllYk9Xd09R?=
 =?utf-8?B?RWJEVXU3Q0pOaHlKM1BCaVJ2Q1dyQkpxVEZDUmVmVzVXckZWb3lyZTNnWGN0?=
 =?utf-8?B?Yko0aVFSUFV4SzNnSGkvTGg2UVQ1WnBqb1Y4amRDZ0FPWHJlTFVCcUxoSDFa?=
 =?utf-8?Q?hheR2VIgrowj8W480Ipptyw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 406e5348-42f1-42eb-f2fc-08dcbaa5bead
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 08:07:01.3941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkoEOju+PaYCZFc7KVL2PNEGfGt1qZy4Mq9BajcVwt5FXn2Zf5ArNoGCOtmfZ8bXZQOEycenVM6WucUS/8EAyRvWNaA+5Sxh7nlnvHy6TLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7555
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



On 12-08-2024 13:18, Raag Jadav wrote:
> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> This was dropped in commit 77a0d4d1cea2 ("drm/xe/uapi: Remove reset
> uevent for now") as part of refactoring.
> 
> Now that we have better uapi semantics and naming for the uevent,
> bring it back. With this in place, userspace will be notified of
> wedged device along with its reason.
> 
> $ udevadm monitor --property --kernel
> monitor will print the received events for:
> KERNEL - the kernel uevent
> 
> KERNEL[871.188570] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0 (pci)
> ACTION=change
> DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0
> SUBSYSTEM=pci
> DEVICE_STATUS=NEEDS_RESET
> REASON=GT_RESET_FAILED
> TILE_ID=0
> GT_ID=0
> DRIVER=xe
> PCI_CLASS=30000
> PCI_ID=8086:56B1
> PCI_SUBSYS_ID=8086:1210
> PCI_SLOT_NAME=0000:03:00.0
> MODALIAS=pci:v00008086d000056B1sv00008086sd00001210bc03sc00i00
> SEQNUM=6104
> 
> v2: Change authorship to Himal (Aravind)
>      Add uevent for all device wedged cases (Aravind)
> 

Thanks for the Patch.

You are extending the UAPI beyond GT reset.
Please add your Co-authored-by:

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c     | 10 +++++++++-
>   drivers/gpu/drm/xe/xe_device.h     |  2 +-
>   drivers/gpu/drm/xe/xe_gt.c         | 23 +++++++++++++++++++----
>   drivers/gpu/drm/xe/xe_guc.c        | 13 ++++++++++++-
>   drivers/gpu/drm/xe/xe_guc_submit.c | 13 ++++++++++++-
>   include/uapi/drm/xe_drm.h          | 29 +++++++++++++++++++++++++++++
>   6 files changed, 82 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1aba6f9eaa19..d975bdce4a7d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -955,6 +955,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>   /**
>    * xe_device_declare_wedged - Declare device wedged
>    * @xe: xe device instance
> + * @event_params: parameters to be sent along with uevent
>    *
>    * This is a final state that can only be cleared with a mudule

since you are here. Please fix typo s/mudule/module.

>    * re-probe (unbind + bind).
> @@ -965,8 +966,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>    * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
>    * snapshot capture. In this mode, GT reset won't be attempted so the state of
>    * the issue is preserved for further debugging.
> + * Caller is expected to pass respective parameters to be sent along with
> + * uevent. Pass NULL in case of no params.
>    */
> -void xe_device_declare_wedged(struct xe_device *xe)
> +void xe_device_declare_wedged(struct xe_device *xe, char **event_params)
>   {
>   	struct xe_gt *gt;
>   	u8 id;
> @@ -984,12 +987,17 @@ void xe_device_declare_wedged(struct xe_device *xe)
>   	xe_pm_runtime_get_noresume(xe);
>   
>   	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> +		struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
>   		xe->needs_flr_on_fini = true;
>   		drm_err(&xe->drm,
>   			"CRITICAL: Xe has declared device %s as wedged.\n"
>   			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
>   			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>   			dev_name(xe->drm.dev));
> +
> +		/* Notify userspace about reset required */
> +		kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE, event_params);
>   	}
>   
>   	for_each_gt(gt, xe, id)
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index db6cc8d0d6b8..5d40fc6f0904 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -174,7 +174,7 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>   	return atomic_read(&xe->wedged.flag);
>   }
>   
> -void xe_device_declare_wedged(struct xe_device *xe);
> +void xe_device_declare_wedged(struct xe_device *xe, char **reset_event);
>   
>   struct xe_file *xe_file_get(struct xe_file *xef);
>   void xe_file_put(struct xe_file *xef);
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 58895ed22f6e..519f3c2cf9e2 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -741,6 +741,24 @@ static int do_gt_restart(struct xe_gt *gt)
>   	return 0;
>   }
>   
> +static void xe_gt_reset_failed(struct xe_gt *gt, int err)
> +{
> +	char *event_params[5];
> +
> +	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> +
> +	event_params[0] = DRM_XE_RESET_REQUIRED_UEVENT;
> +	event_params[1] = DRM_XE_RESET_REQUIRED_UEVENT_REASON_GT;
> +	event_params[2] = kasprintf(GFP_KERNEL, "TILE_ID=%d", gt_to_tile(gt)->id);
> +	event_params[3] = kasprintf(GFP_KERNEL, "GT_ID=%d", gt->info.id);
> +	event_params[4] = NULL;
> +
> +	xe_device_declare_wedged(gt_to_xe(gt), event_params);
> +
> +	kfree(event_params[2]);
> +	kfree(event_params[3]);
> +}
> +
>   static int gt_reset(struct xe_gt *gt)
>   {
>   	int err;
> @@ -796,10 +814,7 @@ static int gt_reset(struct xe_gt *gt)
>   	XE_WARN_ON(xe_uc_start(&gt->uc));
>   	xe_pm_runtime_put(gt_to_xe(gt));
>   err_fail:
> -	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> -
> -	xe_device_declare_wedged(gt_to_xe(gt));
> -
> +	xe_gt_reset_failed(gt, err);
>   	return err;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index de0fe9e65746..b544012f5b11 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -560,6 +560,17 @@ static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
>   	return ret ? ret : freq;
>   }
>   
> +static void xe_guc_load_failed(struct xe_gt *gt)
> +{
> +	char *event_params[3];
> +
> +	event_params[0] = DRM_XE_RESET_REQUIRED_UEVENT;
> +	event_params[1] = DRM_XE_RESET_REQUIRED_UEVENT_REASON_GUC;
> +	event_params[2] = NULL;
> +
> +	xe_device_declare_wedged(gt_to_xe(gt), event_params);
> +}
> +
>   /*
>    * Wait for the GuC to start up.
>    *
> @@ -684,7 +695,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
>   			break;
>   		}
>   
> -		xe_device_declare_wedged(gt_to_xe(gt));
> +		xe_guc_load_failed(gt);
>   	} else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
>   		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, timeouts = %d]\n",
>   			   delta_ms, status, count);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 460808507947..33ed6221f465 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -891,6 +891,17 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>   	mutex_unlock(&guc->submission_state.lock);
>   }
>   
> +static void xe_exec_queue_timedout(struct xe_device *xe)
> +{
> +	char *event_params[3];
> +
> +	event_params[0] = DRM_XE_RESET_REQUIRED_UEVENT;
> +	event_params[1] = DRM_XE_RESET_REQUIRED_UEVENT_REASON_TOUT;
> +	event_params[2] = NULL;
> +
> +	xe_device_declare_wedged(xe, event_params);
> +}
> +
>   static bool guc_submit_hint_wedged(struct xe_guc *guc)
>   {
>   	struct xe_device *xe = guc_to_xe(guc);
> @@ -901,7 +912,7 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
>   	if (xe_device_wedged(xe))
>   		return true;
>   
> -	xe_device_declare_wedged(xe);
> +	xe_exec_queue_timedout(xe);
>   
>   	return true;
>   }
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b6fbe4988f2e..dd2f36710057 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -20,6 +20,7 @@ extern "C" {
>    *   2. Extension definition and helper structs
>    *   3. IOCTL's Query structs in the order of the Query's entries.
>    *   4. The rest of IOCTL structs in the order of IOCTL declaration.
> + *   5. uEvents
>    */
>   
>   /**
> @@ -1694,6 +1695,34 @@ struct drm_xe_oa_stream_info {
>   	__u64 reserved[3];
>   };
>   
> +/**
> + * DOC: uevent generated by xe on it's pci node.
> + *
> + * DRM_XE_RESET_REQUIRED_UEVENT - Event is generated when device needs reset.
> + * The REASON is provided along with the event for which reset is required.
> + * On the basis of REASONS, additional information might be supplied.
> + */
> +#define DRM_XE_RESET_REQUIRED_UEVENT "DEVICE_STATUS=NEEDS_RESET"
> +
> +/**
> + * DRM_XE_RESET_REQUIRED_UEVENT_REASON_GT - Reason provided to
> + * DRM_XE_RESET_REQUIRED_UEVENT incase of gt reset failure. The additional
> + * information supplied is tile id and gt id for which reset has failed.
> + */
> +#define DRM_XE_RESET_REQUIRED_UEVENT_REASON_GT "REASON=GT_RESET_FAILED"
> +
> +/**
> + * DRM_XE_RESET_REQUIRED_UEVENT_REASON_GUC - Reason provided to
> + * DRM_XE_RESET_REQUIRED_UEVENT incase of guc fw load failure.
> + */
> +#define DRM_XE_RESET_REQUIRED_UEVENT_REASON_GUC "REASON=GUC_LOAD_FAILED"
> +
> +/**
> + * DRM_XE_RESET_REQUIRED_UEVENT_REASON_TOUT - Reason provided to
> + * DRM_XE_RESET_REQUIRED_UEVENT incase of exec queue timeout.
> + */
> +#define DRM_XE_RESET_REQUIRED_UEVENT_REASON_TOUT "REASON=EXEC_QUEUE_TIMEDOUT"
> +
>   #if defined(__cplusplus)
>   }
>   #endif
