Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FC890FFF2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 11:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF91010E87C;
	Thu, 20 Jun 2024 09:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fP5Dscio";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD9310E87C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 09:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718874516; x=1750410516;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7Qax08djbmx+BPQlm2ugvEvwDP6SaRpVUlb3JDyfrCU=;
 b=fP5DscioNpMAXGRTcZ1VK9e7upuin5ZfBa9mknlZMF5Gw9/0iBPm2iDk
 gSB3bdXOU5QnUQMkGUKgx/bdeUwt1FL4vOrW5LCYrvEm6e8ud4c++WOGF
 l5Dz4tEp5yWZAfVkHDmCdItqJTZPWsM1Dy7TJgdFXtuW6s9sXAfVoMPn8
 Hapj2QLRzodn8mTcrd7W1LPc0Ie0F2w2NOMLh5vYpJiJH0yOFBu5l43P1
 2lmNOe/EijKHHgQY2S30CCu8zUnMDBO7AWAbvjlBXTyp7ZGpyvYOjOwYi
 bmExBmP3pSvp9cGhmY0DSZ+zOZp9uK0OUlKQmnw5y2oPOYO5deqJauwl8 w==;
X-CSE-ConnectionGUID: mEw1m06gTj6KDB0M/pgX+g==
X-CSE-MsgGUID: ep6VsjcaRNijDjYhRi/7Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15958415"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15958415"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 02:08:35 -0700
X-CSE-ConnectionGUID: luTirqOAScWzhY9uHiuyaA==
X-CSE-MsgGUID: uMcLghzDQq+UkSFUkeHQAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42054994"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 02:08:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 02:08:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 02:08:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 02:08:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bf+tkhyGLSV1rW5M/Utz0/pHYxNqxDtmX8Gow1653IW/LhvlKnQ3OZG3BNeqGJ+sud7jdhJoQHu8qpZ8kXZawI3xHHsLK+op8t4QvC0EH/SJW58TRJrVe5pnhTtOD4RtIT1FL3EDOeCcvHz3ovIk/t4xRo4zUSNtE9pogYM6emq7IwRnmy6dVq1yeDWjsHtQqBcTqJ80RP9sPrA2bWq7XPIv4BU1Hj0SOfLpbTqkt2zQNQLEQqi8UBMvdmXS4cXhOQBuCHPn4dMtPycMf9VS6S2MxTnJR26kjS4UPoJK4CIj5+pVanwOlMAVP1QNABrutqpXvKWTzDz8uFy6HLme4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDPq2JNsnx7jpxzp9sJX0E5sapC8urmIdyyP7gtPdp8=;
 b=Jk+UPXubAzq6FspG6ftSdC27YQbjHZgoBCVu3AFatHsiMXL84by3cc33orhxOEBQhu+/OL8vitMsXiyLbuvQmIMZA9Pt00MDkHEBBRa5eqn1SIpeWwq6LtU6IdezAHjzeCOnejHOKqGdiPCQy2hIOLNWFZAsZgeWA0HPqRcrzQUJBNy3JAQxM7JSGN/Rx68DDYl2Bpwb78ZAT3zX3IGt4qyu63EaSOZA/+Yx8aZ3jB8vj7LY+EAsvSEJMBpbkLGbMSwIFHImf7/p+PogAuKe6GxDdfLIh8gUPqWs3bpdgj+huvcyCv7ORI8SEVsTsDRrtVhQHSme4aR9IliFS+jjww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by PH0PR11MB4999.namprd11.prod.outlook.com (2603:10b6:510:37::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.27; Thu, 20 Jun
 2024 09:08:32 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5%6]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 09:08:32 +0000
Message-ID: <462151b9-be3a-4a77-8455-c879623ee1ab@intel.com>
Date: Thu, 20 Jun 2024 11:08:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 00/12] Improve test coverage of TTM
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Amaranath
 Somalapuram" <asomalap@amd.com>
CC: <dri-devel@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <cover.1718192625.git.karolina.stolarek@intel.com>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <cover.1718192625.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB9PR02CA0013.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::18) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|PH0PR11MB4999:EE_
X-MS-Office365-Filtering-Correlation-Id: 97928d70-1a17-467c-acf6-08dc91088edb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDdNcmRpUERzb0gxY3lCa3pVTDFINjBUQ3l3MUZZc05SeWVjTlREanVBRTRM?=
 =?utf-8?B?VU52SFF5TUZsQ2s2QzVKL2pxNzhjNTVVUDBHUmpLamlQQnlBcXMvaWtNMS9Y?=
 =?utf-8?B?cjhDNGZrZndQVThKYnlxUGlRMDFyQm8yQVkwd29vWXFQYW9uTFlSQnl1bG9t?=
 =?utf-8?B?cjZUazFqZXlTekU2WFJRRUhDRzRtV2Z2M0xDNzF0SGZDZGZKVTIvMDQySlhF?=
 =?utf-8?B?c09yT0lwYzd5TzVKUVpZK3lTamhITjBybnR3aEpqREdQRG1YOCs2NnVkR2w3?=
 =?utf-8?B?YkFVNHJOSno5eDUwR2N3cWY5ejgxN3M2QzhoNEt1UzZvT3MvMkJLQnpZR2tj?=
 =?utf-8?B?cGcwaU0wbVc1dVFnTm5Zelo3Wm9OcjcwQVdoUEJJOXlBU2M3SE4zUWNjZ29D?=
 =?utf-8?B?YjF1YWFSdWliYTlUbHA5cGVLcGFXVE40d3FYWTd1L1kzUHBadVB1dGVTSEc2?=
 =?utf-8?B?RWVERGcxQk1xOHJlZGtnK3dqZzJJbFQ2WDdRS3VtNnFwbEkwTXBaNGVidVlp?=
 =?utf-8?B?VFRMRXFBUlIxa2VIWUljV3JXOXdsbHNyMzN2NHhveVZoNG1sOWp4cmNYSFEw?=
 =?utf-8?B?cUFPNXo0RnpvNXJpS0VZWVZ3L2tnUW5GaXFFUDFFS1AzM2JUbWh2c0tsbTNH?=
 =?utf-8?B?L3NDSVNEZE4vQnppZHVGWHpTWjR6dkRXMlBLZHppWDdBcC9uQmlzbUhNZklk?=
 =?utf-8?B?VFZ4ZUhIYXBGU0szUTNLYjFJZVo4czdwZ1JFek0yREs4djdOVmFtL2g1QUtH?=
 =?utf-8?B?cVNlOWVtaHNQbWYzeVhGWHNnaDhXTFYzbkE5bVFnUlAxNjVGWWJScnBvRU1L?=
 =?utf-8?B?N0QvVFpWWEpTU3NpV3dyQ2gwSVBLaHlibnBiTW9YZk9WZGRzMzlaS1J3YlJ0?=
 =?utf-8?B?ODdmdndLaEpxOVZtdEMvSm5OelYrR3I1dmxFdFhyRTVVdEF3QS9SbUdnV1Iy?=
 =?utf-8?B?YnQ2ZFljbjYrWTBQeTNWY2NVS2ROK04rck9PMVRyL1cxSWxjc1dBK3lHdEs1?=
 =?utf-8?B?UEl2eG5hZnZGQ2NTUThDdTE0NHRnRG9GN3ZCZkp0SzdiVlB5VVhjRXl5QnFw?=
 =?utf-8?B?ZjRMWk9aZmJLdDRkdlFtUEhKamJtZnpZeXdnTVJKc3dROHVmUmkveHVsOElM?=
 =?utf-8?B?Z2lQZkp0L2RnODJvcGpaQjFrWDlQYXlYb3MvdVhNUmd4WTZ4TjUzS0ZLOVRV?=
 =?utf-8?B?a01oUHZKR0dwbU1iRWhPSVhobEh4Q2lFTFpoUnhvVWRiTFVudU1XMk5KdGFM?=
 =?utf-8?B?TkpYT2k4dkFtNEdDVGQzeVRCMGtmL0d5M0FaMEZTVkRnY3ZWUW0xWDEwckp5?=
 =?utf-8?B?dFF5d21TanE5bjM4dnh6SEhQM2pWZjB5WFNNZnI4MHlPekFQVGRtU3N0dUpa?=
 =?utf-8?B?OEpleHBuUmFNZXhrdFMwR2IxVTVWanlnTTQvbmd3bEx1V3dFQW5vd1hKcEg4?=
 =?utf-8?B?N253NlJYNHRtdUg0RzI2MnNIQVlVWFFleFFVS3J1aGRhSmxzNUtpYTVaUU5W?=
 =?utf-8?B?SVFuUVB2ajNoVmVzRkFQVTFMbDMrRHpOOWg0T212RGNmelVER3VJdUZER1lR?=
 =?utf-8?B?RzFQWW54a0c4YzhHdU5IZWJhb1dSeEVPTVlWaWZaMnpiY1dVSFhmLzVaeXEx?=
 =?utf-8?B?L1hWeEtCMjE4NTBDNHF4UmlWcUVpQUJqWDA5dys4cjZZTStiZnJjZitoY3VJ?=
 =?utf-8?Q?e1J0dXCKAR7VoaUbdg+J?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODR4QXAwMDBQWnBiMDBsc0JlNzA2NnA1Q0RvYmFzdGgrZjJHeXR6MmdCZHZ4?=
 =?utf-8?B?WVhaR0c3T3RtNG9zM1VLblUveUdvNFIzRlZrdFNOditxRnQyb2tqcE5TSkxD?=
 =?utf-8?B?bjE5SENSZi96WjgyWlYrVE82WDcvVzdTQ3ZnSERraC80MjNSV2pyZFZaQVJE?=
 =?utf-8?B?bXJGUlc1ZnhacnlkWXV2alJFSmFMZm9ITG1mYVpRYko5ZENjODIwNGhLMHdt?=
 =?utf-8?B?eURycnRWUVdKQStqcVI2Z1BGNzV2QkJNVzVWRENWRWdzOS9Cb3ZkOVpJdzBp?=
 =?utf-8?B?cW9vTzNlVUdTUld6bHJGWnVmVkwrTVRMRk1rbUJEVUhoaTlSOHZKRjJReHRk?=
 =?utf-8?B?TTE0b3pZUkZWTzB0S2tiRFdBWFJSODIxZm42OWlRKzVyUWF0Q2pIRlhyQThG?=
 =?utf-8?B?WnJObURuQkFZR3dYYUV2OFVCY0toSGhBS2NPeXNMYmIwTXUvWDZlVHYxYWVi?=
 =?utf-8?B?U1I4bm9OZ3ZzbCtsdEZWWFBCT2JUR0lYbE1rRnhiQk12T3ZyK0tERjFqbExz?=
 =?utf-8?B?cGJyVWZieWp4QmdkNktWQXpoZlVuRld0M0lBRkNCdVlBeFgvOS9IRFNXbG9m?=
 =?utf-8?B?aVpYVVk2dEd1Mkd1Z1BVQ2JPSUh6NmVrRnpwQWtoczdBNFAvcXZaK2hxTm53?=
 =?utf-8?B?WW85UVhKUlpUZXQvWk03RmswV25ZVk5NMm5Yek42cWloV2ZTelFrOFBURlNj?=
 =?utf-8?B?MWtKSDArcVRYQkVlemlSeHR4WHFhRWxOMUd1K3I1STZYK21BSXMzR3IySnlv?=
 =?utf-8?B?bTMzNUk5eGR6VnBZYUMwTTZnSVNuaWVoQStsWXhlSDJDeHhTYUcvc3ptcCt4?=
 =?utf-8?B?OWswZVdsdmJBWHpQa3lPckEyK1NaemdxSkdGL0FPQ2haMXZMcTZJaUt6WExO?=
 =?utf-8?B?MFpLMktyS1lSTTZrakhIWS91M2JWZ1paQmNMd1c4cWRXZEF1RHcvendVRjBM?=
 =?utf-8?B?MUN6aEpuVlBIM0xlUmVydWwxanJhK3Rma2Rla3phWXIzaVZuRzJrU1VkWjZy?=
 =?utf-8?B?NmhEcmZBZm9tNjBubkRTRHQrVm5EdTBMVEZnSDNzQ0s2U1hGNG91cG1YK01r?=
 =?utf-8?B?TUJIQjBOeEtndGpzekZ3enczQmpCUTJaOE9Dd05CaDRKUkVGNTY3T2grYlhV?=
 =?utf-8?B?S3FtajF1cUN6MUl4VEgvR1F5RnIvTmkrUXJXalpsQVl1cUd6cUREcHgwcFdw?=
 =?utf-8?B?MTVmOFpsWThpMFdaeEZFNUpyK1ZVdDRFN3I5b3dSZkhqc21Tc0xIZFZRSXA4?=
 =?utf-8?B?K2h4QjNRQTR4N3hQSVV0YzFzRHJMdG04Z2tNeGloK2d6RmZxazRYMUtMNXhV?=
 =?utf-8?B?ZGVoczZIM2NVWnIxSE1rVGdkWlplRnhFQTY0ZThSK1F6cDBZcTdLaGJMaXRJ?=
 =?utf-8?B?TWwwbGdtazk3ODVFNzljUk93eDJ4NEMyNnpaUnU3R0srdlBYZ0UyZGxmdmtr?=
 =?utf-8?B?ajltclJRTVErTDlINnRUSjg0QnBaNXpRVm5kR1R2VzArOWFuZnY0SytNSVMx?=
 =?utf-8?B?SS95SWRLUzRBKzBSc2Rhek1FN2FyZGg0dS9aN21XTG1VaEozOWJCTjh1WDB2?=
 =?utf-8?B?NytQa29UUTJvRk1mZ1RRdThKdU1kNStObG9oV2hDTHp5eS94QWpNcWlSUHRl?=
 =?utf-8?B?enlnZWs3cVZOUlk4WDNGenJLc3Z5ZmlJOUtNdlhubTBGZy9zQ1ZOSEpLWm9l?=
 =?utf-8?B?djUyNzBrY1Z4U2h6OTljSmo5empFSVVyNllMWmV2R1g4d09pZ1FrblAzdStI?=
 =?utf-8?B?ZUhtLzV2QWNoSjdZN2xraGVDWFA2Umo4U3BPc2xGZ1RTZmlzNW5NMXZGTTla?=
 =?utf-8?B?ODVrM0xXZU5uUGt6enR1Wm5mVkRvT0ZZdFVNbTVpTFVuYU82SVQ4M3ZEYnVl?=
 =?utf-8?B?cW04NThSSExjRWI1YXVMNHN2T2RyWE1ORUp6NkVaT2RIQWI4cEJjMjNjaXhM?=
 =?utf-8?B?Y21nWVVlb3FGbUMyQytFczB4dWJNb2ViWXg1VGxxZ2tXNVMrMDZNaFdraDBt?=
 =?utf-8?B?cG85bkJubktBTjNQRjZJaDd5TmNuMTF5TU5JZDdXcXVLejUvaE02TUdHVVYx?=
 =?utf-8?B?eWtlTmQ5MW9rQStma0dNc05Xb3hITGdmNDdwb05ndU5VTTNQRGRNa1RBcVBN?=
 =?utf-8?B?MjJuenYrZitDMGZGcU53SlVWRkV3dnVZOVN3UDdYMEd5Ymg1aENIcXh5WG16?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97928d70-1a17-467c-acf6-08dc91088edb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 09:08:32.3353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLAN6clIR1Xf11syPrnsy8/wAf+WeK4cLqsQyTp6Y1hmuh08afDE53zvee92qW9GYwFiaxyMiXwK/xUDn97Etxkd8gKegsJ0EUDqR+L4VYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4999
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

Hi Christian and Amaranath,

On 12.06.2024 14:02, Karolina Stolarek wrote:
> Introduce tests for ttm_bo_validate()/ttm_bo_init_validate() that exercise
> simple BO placement as well as eviction (including the case where the evict
> domain also requires eviction to fit the incoming buffer). Prepare KUnit
> helpers to handle such scenarios and add a mock VRAM manager. This series also
> includes some updates to the helpers and more definitions used to define
> "special" memory domains (e.g., one that can't allocate resources or is busy),
> as well as drive-by fixes for the tests.
> 
> There are a couple of areas in which this test suite can be improved.
> Suggestions for future work can be found in the TODO file.
> 
> Use kunit_tool script to manually run all the tests:
> 
> $ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/ttm/tests

I collected r-bs for all patches in the series, they apply cleanly on 
the top of drm-misc and drm-tip and all the tests pass[1]. Would it be 
possible to merge them?

In other news, we enabled TTM KUnit tests in CI for Xe driver, the 
results can be seen on patchwork. For example:

https://patchwork.freedesktop.org/series/134956/

(see CI.KUnit step)

All the best,
Karolina

--------------------------------------------------------------
[1]:
$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/ttm/tests
[10:49:50] Configuring KUnit Kernel ...
[10:49:50] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=8
[10:49:53] Starting KUnit Kernel (1/1)...
[10:49:53] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[10:49:53] ================= ttm_device (5 subtests) ==================
[10:49:53] [PASSED] ttm_device_init_basic
[10:49:53] [PASSED] ttm_device_init_multiple
[10:49:53] [PASSED] ttm_device_fini_basic
[10:49:53] [PASSED] ttm_device_init_no_vma_man
[10:49:53] ================== ttm_device_init_pools  ==================
[10:49:53] [PASSED] No DMA allocations, no DMA32 required
[10:49:53] [PASSED] DMA allocations, DMA32 required
[10:49:53] [PASSED] No DMA allocations, DMA32 required
[10:49:53] [PASSED] DMA allocations, no DMA32 required
[10:49:53] ============== [PASSED] ttm_device_init_pools ==============
[10:49:53] =================== [PASSED] ttm_device ====================
[10:49:53] ================== ttm_pool (8 subtests) ===================
[10:49:53] ================== ttm_pool_alloc_basic  ===================
[10:49:53] [PASSED] One page
[10:49:53] [PASSED] More than one page
[10:49:53] [PASSED] Above the allocation limit
[10:49:53] [PASSED] One page, with coherent DMA mappings enabled
[10:49:53] [PASSED] Above the allocation limit, with coherent DMA 
mappings enabled
[10:49:53] ============== [PASSED] ttm_pool_alloc_basic ===============
[10:49:53] ============== ttm_pool_alloc_basic_dma_addr  ==============
[10:49:53] [PASSED] One page
[10:49:53] [PASSED] More than one page
[10:49:53] [PASSED] Above the allocation limit
[10:49:53] [PASSED] One page, with coherent DMA mappings enabled
[10:49:53] [PASSED] Above the allocation limit, with coherent DMA 
mappings enabled
[10:49:53] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[10:49:53] [PASSED] ttm_pool_alloc_order_caching_match
[10:49:53] [PASSED] ttm_pool_alloc_caching_mismatch
[10:49:53] [PASSED] ttm_pool_alloc_order_mismatch
[10:49:53] [PASSED] ttm_pool_free_dma_alloc
[10:49:53] [PASSED] ttm_pool_free_no_dma_alloc
[10:49:53] [PASSED] ttm_pool_fini_basic
[10:49:53] ==================== [PASSED] ttm_pool =====================
[10:49:53] ================ ttm_resource (8 subtests) =================
[10:49:53] ================= ttm_resource_init_basic  =================
[10:49:53] [PASSED] Init resource in TTM_PL_SYSTEM
[10:49:53] [PASSED] Init resource in TTM_PL_VRAM
[10:49:53] [PASSED] Init resource in a private placement
[10:49:53] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[10:49:53] ============= [PASSED] ttm_resource_init_basic =============
[10:49:53] [PASSED] ttm_resource_init_pinned
[10:49:53] [PASSED] ttm_resource_fini_basic
[10:49:53] [PASSED] ttm_resource_manager_init_basic
[10:49:53] [PASSED] ttm_resource_manager_usage_basic
[10:49:53] [PASSED] ttm_resource_manager_set_used_basic
[10:49:53] [PASSED] ttm_sys_man_alloc_basic
[10:49:53] [PASSED] ttm_sys_man_free_basic
[10:49:53] ================== [PASSED] ttm_resource ===================
[10:49:53] =================== ttm_tt (15 subtests) ===================
[10:49:53] ==================== ttm_tt_init_basic  ====================
[10:49:53] [PASSED] Page-aligned size
[10:49:53] [PASSED] Extra pages requested
[10:49:53] ================ [PASSED] ttm_tt_init_basic ================
[10:49:53] [PASSED] ttm_tt_init_misaligned
[10:49:53] [PASSED] ttm_tt_fini_basic
[10:49:53] [PASSED] ttm_tt_fini_sg
[10:49:53] [PASSED] ttm_tt_fini_shmem
[10:49:53] [PASSED] ttm_tt_create_basic
[10:49:53] [PASSED] ttm_tt_create_invalid_bo_type
[10:49:53] [PASSED] ttm_tt_create_ttm_exists
[10:49:53] [PASSED] ttm_tt_create_failed
[10:49:53] [PASSED] ttm_tt_destroy_basic
[10:49:53] [PASSED] ttm_tt_populate_null_ttm
[10:49:53] [PASSED] ttm_tt_populate_populated_ttm
[10:49:53] [PASSED] ttm_tt_unpopulate_basic
[10:49:53] [PASSED] ttm_tt_unpopulate_empty_ttm
[10:49:53] [PASSED] ttm_tt_swapin_basic
[10:49:53] ===================== [PASSED] ttm_tt ======================
[10:49:53] =================== ttm_bo (14 subtests) ===================
[10:49:53] =========== ttm_bo_reserve_optimistic_no_ticket  ===========
[10:49:53] [PASSED] Cannot be interrupted and sleeps
[10:49:53] [PASSED] Cannot be interrupted, locks straight away
[10:49:53] [PASSED] Can be interrupted, sleeps
[10:49:53] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[10:49:53] [PASSED] ttm_bo_reserve_locked_no_sleep
[10:49:53] [PASSED] ttm_bo_reserve_no_wait_ticket
[10:49:53] [PASSED] ttm_bo_reserve_double_resv
[10:49:53] [PASSED] ttm_bo_reserve_interrupted
[10:49:53] [PASSED] ttm_bo_reserve_deadlock
[10:49:53] [PASSED] ttm_bo_unreserve_basic
[10:49:53] [PASSED] ttm_bo_unreserve_pinned
[10:49:53] [PASSED] ttm_bo_unreserve_bulk
[10:49:53] [PASSED] ttm_bo_put_basic
[10:49:53] [PASSED] ttm_bo_put_shared_resv
[10:49:53] [PASSED] ttm_bo_pin_basic
[10:49:53] [PASSED] ttm_bo_pin_unpin_resource
[10:49:53] [PASSED] ttm_bo_multiple_pin_one_unpin
[10:49:53] ===================== [PASSED] ttm_bo ======================
[10:49:53] ============== ttm_bo_validate (22 subtests) ===============
[10:49:53] ============== ttm_bo_init_reserved_sys_man  ===============
[10:49:53] [PASSED] Buffer object for userspace
[10:49:53] [PASSED] Kernel buffer object
[10:49:53] [PASSED] Shared buffer object
[10:49:53] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[10:49:53] ============== ttm_bo_init_reserved_mock_man  ==============
[10:49:53] [PASSED] Buffer object for userspace
[10:49:53] [PASSED] Kernel buffer object
[10:49:53] [PASSED] Shared buffer object
[10:49:53] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[10:49:53] [PASSED] ttm_bo_init_reserved_resv
[10:49:53] ================== ttm_bo_validate_basic  ==================
[10:49:53] [PASSED] Buffer object for userspace
[10:49:53] [PASSED] Kernel buffer object
[10:49:53] [PASSED] Shared buffer object
[10:49:53] ============== [PASSED] ttm_bo_validate_basic ==============
[10:49:53] [PASSED] ttm_bo_validate_invalid_placement
[10:49:53] ============= ttm_bo_validate_same_placement  ==============
[10:49:53] [PASSED] System manager
[10:49:53] [PASSED] VRAM manager
[10:49:53] ========= [PASSED] ttm_bo_validate_same_placement ==========
[10:49:53] [PASSED] ttm_bo_validate_failed_alloc
[10:49:53] [PASSED] ttm_bo_validate_pinned
[10:49:53] [PASSED] ttm_bo_validate_busy_placement
[10:49:53] ================ ttm_bo_validate_multihop  =================
[10:49:53] [PASSED] Buffer object for userspace
[10:49:53] [PASSED] Kernel buffer object
[10:49:53] [PASSED] Shared buffer object
[10:49:53] ============ [PASSED] ttm_bo_validate_multihop =============
[10:49:53] ========== ttm_bo_validate_no_placement_signaled  ==========
[10:49:53] [PASSED] Buffer object in system domain, no page vector
[10:49:53] [PASSED] Buffer object in system domain with an existing page 
vector
[10:49:53] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[10:49:53] ======== ttm_bo_validate_no_placement_not_signaled  ========
[10:49:53] [PASSED] Buffer object for userspace
[10:49:53] [PASSED] Kernel buffer object
[10:49:53] [PASSED] Shared buffer object
[10:49:53] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[10:49:53] [PASSED] ttm_bo_validate_move_fence_signaled
[10:49:53] ========= ttm_bo_validate_move_fence_not_signaled  =========
[10:49:53] [PASSED] Waits for GPU
[10:49:53] [PASSED] Tries to lock straight away
[10:49:53] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[10:49:53] [PASSED] ttm_bo_validate_swapout
[10:49:53] [PASSED] ttm_bo_validate_happy_evict
[10:49:53] [PASSED] ttm_bo_validate_all_pinned_evict
[10:49:53] [PASSED] ttm_bo_validate_allowed_only_evict
[10:49:53] [PASSED] ttm_bo_validate_deleted_evict
[10:49:53] [PASSED] ttm_bo_validate_busy_domain_evict
[10:49:53] [PASSED] ttm_bo_validate_evict_gutting
[10:49:53] [PASSED] ttm_bo_validate_recrusive_evict
[10:49:53] ================= [PASSED] ttm_bo_validate =================
[10:49:53] ============================================================
[10:49:53] Testing complete. Ran 102 tests: passed: 102
[10:49:53] Elapsed time: 3.305s total, 0.002s configuring, 2.635s 
building, 0.572s running
