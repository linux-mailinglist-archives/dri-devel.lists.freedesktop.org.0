Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03FBB95164
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 10:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B4510E5A6;
	Tue, 23 Sep 2025 08:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qYNIFuqY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013051.outbound.protection.outlook.com
 [40.107.201.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9547B10E5A4;
 Tue, 23 Sep 2025 08:55:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IviuSnqy6U7MRZed3k+EJTy7U8lX90Q2Z+LsgMMdmO5Qii8+VSIcJweN1P10YVMA8AQEOMM5nOr5r03AqP6tKNsoKFSGa17isyvocnJ9WbSXrORgIolHAKiagOfV92deEGfsWvNmvaSLG4QUtH3ADIyc3IRZR7h6IeHfdEUVjii9BWiqSgoFKc1Fonc3hpkRYcZNZYCu3tV54DxBOPlUJHkJ4K4GFeZEztIFShqRc/dobXDaojdVIhdtv4rqXeCyy6M5vwRVOXVvvudvaIJG1idtxcQmFoQFGk/pBfcqfYeirqxf+7LZ9nkiTtX74AbYDgmhd6WB7ckxJOvmeXgdQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kauovZgAPh8/n9Syrz6UNx8Naz3MLfPorIsaUj3E58c=;
 b=hAi3+jgcL3BS3vvpDG01aQZcCGyLQRcHq7+TuaFAvpWiWEdfLfJe/53DeHLcXqxRwNeGU0hxTi8Jfgosa7H+2YHosytXNuE9t9PqP3u0sBz9dRCrYjlE3RvEFhA8yYr8C7Ifso5u8e7d15CPrOz6Cmm3yZqEgmYuFXHQS9sxWFJyNQ3A6aKb8d8r9YlTXhvugrT5ulIO1OUU25fEni6W4wNj4S2u3FL7pdbTWplJ7flkijigggPTRo9LMlUdQ0149OHClh1ukIyAhji2H29KfnGMF2trI0PVK7Bh0JleEFLBxBT/xC2Se22jarERlaEFefSoKanrSn4cBTqbFRbTbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kauovZgAPh8/n9Syrz6UNx8Naz3MLfPorIsaUj3E58c=;
 b=qYNIFuqYnKDVZ7OtMyCu+dxbn2njv4lQH4FvYk06rsa5euypB2Q+mD7zMnOS7mW7PiXnMWZpcSjDEsaKWGtNuCqUEGWUewWJlu7MrTRgj7qo05FHC/lTphuiwYW3syu2JtBhTeCqrzeMU85rPC+TwMSu91+c4ENvLn1hDLvvG3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by CY5PR12MB6203.namprd12.prod.outlook.com (2603:10b6:930:24::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 08:55:06 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%5]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 08:55:05 +0000
Message-ID: <19d29a41-0bf6-453a-84b4-72b76f47b9c9@amd.com>
Date: Tue, 23 Sep 2025 14:24:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/buddy: Optimize free block management with RB
 tree
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: matthew.auld@intel.com, jani.nikula@linux.intel.com,
 samuel.pitoiset@gmail.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, alexander.deucher@amd.com,
 stable@vger.kernel.org
References: <20250909095621.489833-1-Arunpravin.PaneerSelvam@amd.com>
 <6f6841a7-57bd-49de-9b55-b5b0514a2749@amd.com>
 <20250909140519.GK4067720@noisy.programming.kicks-ass.net>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20250909140519.GK4067720@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0107.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:276::10) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|CY5PR12MB6203:EE_
X-MS-Office365-Filtering-Correlation-Id: 58196185-fb5e-4f52-f3cf-08ddfa7ee3d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajhLRUg0UzdlbTR3TEFsM2dNUHhTRXRmZ3lWMGxEaW1hdlFrWU9nWDlSUnNW?=
 =?utf-8?B?RGptRXUxcFVnWHZpcTB2R1haMlZxK1ZWRjlzT3Y4YndBUzJvOFpBNGU5NkVO?=
 =?utf-8?B?RVF5TmFyMVhkL0ZNaUNtdnVobVl0aGg0ZXdyVUh6NjFoOTUwaVduL21DTEFv?=
 =?utf-8?B?bXQrdy81US9RUlEwT0wwZW1xV3ViRkRDS2h3UGhlYlFFUURGWGpLZnlCOVdo?=
 =?utf-8?B?YUhMbzQ3ZXUvanN1OGpUUFgxaHVaekNUVit3Z2dueE1LblY5dE13VTNMZVZF?=
 =?utf-8?B?Z2VhZHRsQzQ4czBTS0hYUEhjclJXSDA0R21WRlJZcENpZldFVXJsYSt5VHgr?=
 =?utf-8?B?YjYyNVFOUStlcXpueHVzRWdFK2RMYUJ1UEJOck40TzByYnRBUUFWOHg2MjVj?=
 =?utf-8?B?TEJISXNqeUdoQ2J2SHBINzkyT0NYVGFhNjJ3WDRRaU5HWDl6M0NjNTNMcHN6?=
 =?utf-8?B?dmNNVHpvSXF6eE1IM3FqZ0ZVRkc2WDFsdk4xYSs5V3JJTVdRaFgwQzZCWGhU?=
 =?utf-8?B?SktqMTdFekhYcGtxa0lIMnlVS1U5bFN1aGhwMENVK2N6VXgwZnFFWXNON0tk?=
 =?utf-8?B?bUxMUVliSU9EWXpUY01MMnV3OURsWlowRTFmWGpxZ0VmTUduRlhXRGpvdkFy?=
 =?utf-8?B?aXJZcVJ2S1gwTFRMRExUMHZGSFNnamNIT1hXNFg5czJleENwQ2phWlVGZm1s?=
 =?utf-8?B?eWV2Zk11U1FRWVVyOUIyTGFLZCtkUGlqS1FPNUxYQkJxeVNlckNITW1tbFhN?=
 =?utf-8?B?b1IxNFF4L0pyR2Q5NGpTU1RodktNanZ2Z0hyS3pHTnFRSGVCY1RGdUowUFJv?=
 =?utf-8?B?TWdEcGpWR1hxMGtjRWkxLzRTS0VVYWZ2L2tNMlhpeHRBeUlwOFFaVVVjV1Za?=
 =?utf-8?B?aTRVdmNKNnlsWnYwdkNCRlBvMFZubS9TQ0VSbmZPeGg2clFvaUxMRk9SWXMv?=
 =?utf-8?B?dFRiVHBKZ0JReDFkSnpiSTRXWDRQbVF3RFFNekU2MVJxK3M4OUdIK09ucVVQ?=
 =?utf-8?B?cDdHM0xNRm5iK2grWnFJVnE1THkwMmovM2tJTkwyWmpTakJId0YyL3N0WHl2?=
 =?utf-8?B?QW1sU0kyVUNCMVV5bXgvcHhQUWxLaTVxbEYvRnNEMytxUGo2RG9MU043Qitx?=
 =?utf-8?B?U0hMVzd1MUtYRTI4eWswMXBmTExvSERva1Y4SDhMU0V5b2cvVmRaQmhvSDJh?=
 =?utf-8?B?cU04NU1lamJ6YWpEWkNFRW41ZUhRWFJDOHU3dDVPc21xUHpIcnYzWXY4bHlZ?=
 =?utf-8?B?T3lOOVhGWEVqRk1BN2pEYm43Smlnb3MwU1NYLzRBV1IvbERCTmNoL0pNSUpw?=
 =?utf-8?B?aVA3WFplS29YUkE3bGF3NEh1OGlJODVINjVmMDZRRnU5bjRvNkQ4MlRvTDlL?=
 =?utf-8?B?cnE5amNTK202VGE2elhZVXhtbFgwUTQ2SDZmUHNkdW9HVDFJVlJXN2haaDNa?=
 =?utf-8?B?N05iVE5YWVNzeUtMUzZvTGRZdFR0c1JMd2lEU3Q3dnNyUVBUUHNUdDJweURa?=
 =?utf-8?B?bWZzemNtd3hEa0t4VDZkdCtRVUNXaFpnVlJ3bitPWW0rV001N3pOMHAreEk5?=
 =?utf-8?B?WkJzNS9QU3lHN1BLbnF0SDhBTm5idUtZc3RXTTQ5ckhJTjZKY204QmEyZEVC?=
 =?utf-8?B?QlYyeGFiNWRjRXNKWTcraHBIOFMrd0pJRmwzL2pxVlhOR21OYlJHNjUvRi9P?=
 =?utf-8?B?N040MGd1OW5MWUlLVXRDQmc2dS9BOEpZYkUzaHRHdld6bk1NL2p6UWM2Y0NY?=
 =?utf-8?B?UUEzb1pnOFp1RWJwYUlmMzlCdCtienNWaXVrMFJPcTdjZmljTVRBY0xCOVR4?=
 =?utf-8?B?WnFtTHhqNDBpcFNqa1pkY2dLQ2g3bXhVM1RlaWI0U2gyOHBuRWcwelY1OW9K?=
 =?utf-8?B?RkVnVDJIc0FHMGVrNkFPazJsYVkyUW5YSWdVeEtHakwzUnpUbkQrWktPUmxQ?=
 =?utf-8?Q?/3bPwtNFixA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFhUY3JnNy9pdmJrSDhvZGtmK1FFRUxQbGJ0Y3NHSHZiV3ByUXREd1V2WlZi?=
 =?utf-8?B?TllJdFBVSERRWHM1VUtkcU1zQUVRS1VZV0R4amR4QittWm81T3hhaWlLUnJF?=
 =?utf-8?B?MmgvSWxYS2FuNjVjbXJaODNVdEVGaGVMYzdqQS9CSThaK1VRSmM5QVgreGNJ?=
 =?utf-8?B?VzJyTCtoQXk2WnlBSWFBRzVZZ3FnSURaYko4dDZSUWszUHZRQUl2K0c5Ung1?=
 =?utf-8?B?dVJFeHA2aUozLzVsTnZGckpnVXBBWmQzR0h1WEY1VldXTVl2NytuNEMyRGpL?=
 =?utf-8?B?UEFheG1OSy9QL1VWbWJiaVN1OEs4WEhJZ001d3FNdlMweEpGRDZJbVk1Q3Zm?=
 =?utf-8?B?K0hxU3V0ZTVDdVIzMy9wUmUwTDZWSS90TDk4dDh0ckNtQXZNdWFEWm5pMHJt?=
 =?utf-8?B?dmExTGF1V05UTm9HTTc3SGJZVzMyaEpZWEpjNCtSV3lYU3JBb09wZUdDYVJp?=
 =?utf-8?B?NDcwNitPeUhpV0NIM0ZOL0lkR3MvVkFtVVJrRzhSdnpLZGdDbVhrUllUUmJX?=
 =?utf-8?B?bUVBTURaNVpHV2VTYTU1cXBDSDcyRy8zSVBjanVRNGJvYWI4clB1cll2SGps?=
 =?utf-8?B?WEpDaGltVExWWG45MWFRc3l5b0tLM2l1ZUlUaFViWHhJTXE0VmNqSkhsd1BU?=
 =?utf-8?B?QjRZdHBYTWIvWHE2MlJ5QktaR2FIbHVxZ0ZJcjdBNWNsWStHQXpSSDRkNVpt?=
 =?utf-8?B?YWRtNGtzeTExK2V4bk80UXlVaEtJYXBKUUxjUmVRZEYrYTA2NGlWcTl6ZERJ?=
 =?utf-8?B?N0k2S2NKZ3djMGpONjVQZ1VyaS91UnpCMWFtVS9RNGZ4QnROaHlLT3I2eGE3?=
 =?utf-8?B?WThlZzhjL09NS2EraVhpWGJHTzBnZThSTDBXRzZOeWhNTlEvTlplaWErNHlt?=
 =?utf-8?B?d1RFeFFlbWpQTkFOdm5sWWFZVUZXNlpJelp2c1VlYTZvRXNMVjZoeEU2TjNR?=
 =?utf-8?B?ZENwSWlkUW84QXNLTXVZbEFDaC8wWS9zN0syaTZBU05HN1pTamNTWnhublBD?=
 =?utf-8?B?T2t0TFVWZVN4d2VWMzlXYWdtNC8valJWc2dJNmpyWlJqTG1UYmZUc0I0dFBE?=
 =?utf-8?B?WURCc3NFbHdaMW1VYzBZT0hLczdHd3BYVmFkV0FpRGgzeU80Tkdoa0JSamdQ?=
 =?utf-8?B?eUE5T01QYzY3cS9GMHNXcG4wRVh3SzQwV0NDKzRMRWppNmdXRzE2VWpuVlRs?=
 =?utf-8?B?NWF6VmpwTzRSTDROMzZqbm56ZzZ1MTh2U05QTVN1Q2RUL3k5ck5lVjdrVFhS?=
 =?utf-8?B?VlN5dkNUL1lmYVZ2Nzd0Q0h3bjJzbTl0Sjk5dmc1WFpSdUJiR0lzZitMWHNN?=
 =?utf-8?B?alBuZVZQWGovdVh2YTdrUlFmclp3LzQ4dGVHdHEza0FTVEZTN3lIenp3aGRN?=
 =?utf-8?B?Wm52M0IrZWVCQVc3RE1hVEU4TmJXUVJaVmVxa2FkY3Jhbk5MUkRpYVpLeFUv?=
 =?utf-8?B?MnI2S1RJZ000bDlZNkFJNmVVeFROSWNxRkJlelhBSU1EL0dpUDh5SG9ndlo3?=
 =?utf-8?B?T3RHdFpkZjBHSmFLOW03KzdDM0Y1SjAybTkvcFBDUERFcFRUWC9uL3JneTh2?=
 =?utf-8?B?QlRLU2VaZlBnR0s4VmV4Y1BLUlNjTW01UUF0M0ZlUVVKZmt3LzZ1WWN4NTE4?=
 =?utf-8?B?NzRYSEtRc1c1SmlFdG9rMUkzZVp2K0FsbGsvSkFVVUFRc2JrbExSTnBqdU9j?=
 =?utf-8?B?M2RBWDJmK00yUTBzOG01eG9TbzVwTU1xMU1YSGhwQ3Y2Tzg5djBtU2JSVzJS?=
 =?utf-8?B?MjE0NHBlNy9SeTByZXUvSHNENHZtQytpczhRd3ZXdlFFcVVsUDRaR2pVa3k2?=
 =?utf-8?B?TmpIcEM3V1Z2MGxFdFNYenRuWkQzSmJ1cEdGL0JWMkNNR29kS3k2bDJFcXBz?=
 =?utf-8?B?alFJcFBhc25TZkJyUnhiaVMzK0tOVkFZMEJJNjhOTzRGTEE2Uk91RE5vWjho?=
 =?utf-8?B?d3Q2S2pQQXo5Kzh1NEI0Tlp4VTAwa3NOU05qaUtONDYxZGw5M3VuTFBYN1dH?=
 =?utf-8?B?UElvcE8vRmJsVVRFSEhXeXBiVlVLOVpIVUFyV1BtSVRUYlRaOGtOK1lCckJs?=
 =?utf-8?B?dzZIVWExbTBEOFNLVE04clRrenR3Y0QxdktvSUdHdW5TaVQrOXlXNDVEdkpB?=
 =?utf-8?Q?A+Dtuaujb3GVlXAxXbysXMlLt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58196185-fb5e-4f52-f3cf-08ddfa7ee3d5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 08:55:05.5865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9OOPn5XkUmT+3FZS32uwh39KNE/wfOA823gh4SGdja/O4aKDAGMyJF/jaNspK63pwZYo17fsOjDYPbskKQjyKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6203
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



On 9/9/2025 7:35 PM, Peter Zijlstra wrote:
> On Tue, Sep 09, 2025 at 02:04:30PM +0200, Christian König wrote:
>> Hi Arun,
>>
>> On 09.09.25 11:56, Arunpravin Paneer Selvam wrote:
>> [SNIP]
>>
>>> +/**
>>> + * rbtree_for_each_entry_safe - iterate in-order over rb_root safe against removal
>>> + *
>>> + * @pos:	the 'type *' to use as a loop cursor
>>> + * @n:		another 'type *' to use as temporary storage
>>> + * @root:	'rb_root *' of the rbtree
>>> + * @member:	the name of the rb_node field within 'type'
>>> + */
>>> +#define rbtree_for_each_entry_safe(pos, n, root, member) \
>>> +	for ((pos) = rb_entry_safe(rb_first(root), typeof(*(pos)), member), \
>>> +	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL; \
>>> +	     (pos); \
>>> +	     (pos) = (n), \
>>> +	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL)
>> As far as I know exactly that operation does not work on an R/B tree.
>>
>> See the _safe() variants of the for_each_ macros are usually used to iterate over a container while being able to remove entries.
>>
>> But because of the potential re-balance storing just the next entry is not sufficient for an R/B tree to do that as far as I know.
>>
>> Please explain how exactly you want to use this macro.
> So I don't much like these iterators; I've said so before. Either we
> should introduce a properly threaded rb-tree (where the NULL child
> pointers encode a linked list), or simply keep a list_head next to the
> rb_node and use that.
>
> The rb_{next,prev}() things are O(ln n), in the worst case they do a
> full traversal up the tree and a full traversal down the other branch.
>
> That said; given 'next' will remain an existing node, only the 'pos'
> node gets removed, rb_next() will still work correctly, even in the face
> of rebalance.
Sorry for the delay. I have been discussing with Christian and testing a 
few code
changes. Maintaining a sorted list_head alongside each rb_node is expensive,
which is the main reason we are moving from a list to an rbtree. In the 
force_merge()
function, we only call this during normal allocation to iterate once or 
twice and merge
the required blocks, not the entire tree. Therefore, rb_prev is 
sufficient, and want to
avoid adding unnecessary complexity for this simple operation. 
Therefore, I have removed
all the newly added macros in v7.

A full traversal of force_merge() is only needed during the buddy 
allocator's fini() operation, and in that
case, any slowness or timing overhead is not critical.

Thanks,
Arun.
>
>

