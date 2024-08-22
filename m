Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E4295AFF0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 10:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA6D10E353;
	Thu, 22 Aug 2024 08:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nlTqmfIL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BF110E353
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 08:11:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yog1sif5RX3eM1N9yIlQxgmWRAGxXjVkrdJLnnsRxc6PboBoCfkaieZaNVs4JN0kqi+4IheBC6xxqHyeMDV2MHH+SgOY16wGAPPZnK8D4hdRMrLwMb0kgRlkE4A+DSvjGLYlLYvMUXWuqTLGe2qLRw1DnU3mrC2PzDGyaFBE2W3p/oTUrYr2MGNCgt0KEVB7OE0IWXe5T0o4xIDUDFURD2r7u7+US0yW9rlPSPwdFrfkc5TFDPkW7ONwJ5YP9BugG3FfnPFeWuyYhr9d6WviypKjNLY0epUQ3Sc1Md9jCnxjD/q83V8U2MHWi1vOfrmGMrZuelFBmkdjM9wy0wmSNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duvHtm8oCbdNlvxLKbdq08yhkcJQQiFUlJLFs6dRNc4=;
 b=IswMF1ydewNieW1XDxn9Fn/01rHma1hDSdQKXVwW6Zl4CXa70YK1CefYKd3/+cR3x1Gvsxw4d8jGVFbTF/747h838P7c4ji1NAfl2HT4l9C6hxsanA+BbdHvQLRctBrsDAx/n5Aot+75QPr0XADAWDdmkrJ9KL6E581HncuukccIoSx8gSA2LG2+amyBtacAJ72wyFP9u3x0dIsO3k2mIIceZNn8hOcnQTqp0sW+8Ki/QNVhHOcMTdrPL1tVodWfJtBPVAvpKUMJulUtHcGWb5Vn4TxkQt4kzETGacZolVH99Q+QpM/75x6iUiit+dGNZW0jUc7KdLY+R9wRQnOcUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duvHtm8oCbdNlvxLKbdq08yhkcJQQiFUlJLFs6dRNc4=;
 b=nlTqmfILgXwpJa64EwILq4w9Y3hV1z5PVj5xOgoksX2WgU+hfdl25CHN2wPiYGZkPaTXeoWDcfQumwSMk3y7K5/tsNQXDFDife/Qx+5W6JNWVCAq0U7odljJhEL7m/jxltGl1y0PfMzxGdKTe/uRl7jHEumbfpHJMK4lxBnSh4c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB9245.namprd12.prod.outlook.com (2603:10b6:806:3a7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 08:11:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 08:11:47 +0000
Message-ID: <194af8a6-fd7e-4d4d-a773-305fd9fd0a4a@amd.com>
Date: Thu, 22 Aug 2024 10:11:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] udmabuf: cancel mmap page fault, direct map it
To: Huan Yang <link@vivo.com>, "Kasireddy, Vivek"
 <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240805032550.3912454-1-link@vivo.com>
 <20240805032550.3912454-2-link@vivo.com>
 <IA0PR11MB718542BA11A38A5BD40ECB00F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <de3f3cc4-5e0a-4524-902f-4913addba227@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <de3f3cc4-5e0a-4524-902f-4913addba227@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB9245:EE_
X-MS-Office365-Filtering-Correlation-Id: d9204903-6c04-456b-b856-08dcc282112e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3F1eld6c0kvQVQvRXNyMzY1TS9lVHVJSzRvazZ0L21IdUlvbnFlZ2dvTzl3?=
 =?utf-8?B?dWpSV3RkZURzZlNCZEMvbXF4NFdhTGRmSU9CQk9SallLYXB5ZmNtQWZUeThr?=
 =?utf-8?B?ZDJXUk42QWJiYVJYakNuaEpwaG5vQ290dXNiUWNET0NDdGhqbkJLMmIvZHJX?=
 =?utf-8?B?Q3VCK0tsQVh1ZlpNaXZDZnArM296T1VyOG52cjVpNmdmNk5OeGhibjhPTFVK?=
 =?utf-8?B?SElOU0hCRVFPaUdrbE96NWhxdUlsajZNNlFBblhqd2wreXQ2WFVZQkIzTFpP?=
 =?utf-8?B?VHBoQmg2ZWMxUVJ5S0F3ZzZPZGRVdmh5UkRybUdYM1JOczBUaWZDSWF5NUpa?=
 =?utf-8?B?dnU0RnpMSFZzb2NYRVgvUzJKdGdiUHo2RXk0TDN1aHRpR0RNR0dpaG5rdkVj?=
 =?utf-8?B?TVNob2tLcnlHUVFxQ3FIeHpGb3dya1k1NjZzZkhjMnNNcGN5dHNTeElZVVcr?=
 =?utf-8?B?OHdxOXZYZUNtWVBkb0t4VERhbE1MZ1JSUmJEK1RnMFBqR29XMnR5WU01WE1p?=
 =?utf-8?B?RzJlbW03TE82VlRNUXVoSE9DSlRZcFpnODdtZ21LUXBncjlDMENGM2lhNEZF?=
 =?utf-8?B?dFF1TkY2dTJYeFA0Q3FZRUVwSE8zWVhONXZSbmNQdEtkbmRQTXM1VFVxdkZ5?=
 =?utf-8?B?OVMzY1FxMTNmQTBlaTBRU2l4N3YwaWMwSVk2SVp5dUJxVTd3akowd09NaTZw?=
 =?utf-8?B?NXBBU3BlY0M0TlEwdzRZR1BLTWQ4SG11VTkzY1JuS0hueTYxc09ZMmdjY1BO?=
 =?utf-8?B?cTNXTGg3NlhUM09Kd09KRVhwS2xXUHQ1c0JHQ21sT1NjNUdWTHQzWWNUeHVv?=
 =?utf-8?B?THlEL0Y4KzBWaVE5OEZpcmdOKzlqM1dJTzZMakEvbmVWSDM3OGdIcndvV25U?=
 =?utf-8?B?Zk1hWUlmM3VuVlFnUU9aUzRlNWFiZVhKVFc4MUFHOGllcUtRNnZpV2loWVdK?=
 =?utf-8?B?eGtNajhqU3IzNlc4NzgvMWlNemV6dDZ5RENFc1JteXI2SFRudnJ6VzZjS2F1?=
 =?utf-8?B?U2NlcjdxcWpDNG9jaFVzNUxXZFdML0tISVFuRG9hZ1c4cTI2ZDJiNG5GRGpM?=
 =?utf-8?B?NnVFVFo2R3FYYURXbjMwZnJBM3J3Zi9Jb2lielRrQ25QYXh6UlVja2VOV05m?=
 =?utf-8?B?L0ZvVTYvdFhBcVBLUzRLeGovekJMMWN5Qkx3b1loMFloUFA4RWM4bElhNlYw?=
 =?utf-8?B?Sk1FNm9hZ1FKUGlpU0lVejV2QlZnUHVJRGltM1NkUXVTbEhkLy9qU0V1c2ta?=
 =?utf-8?B?L3AzakFRaC9zc2xnWnZVbVg1bWFoVVEzRFNEb25LeHpIUGRPMDBiT3dPcHoy?=
 =?utf-8?B?cUxWdGtmdGdWZ05nU1JoNmNwWkY0azJENHh1UXVqaWtXbnpxcjZFM0F1T0Zj?=
 =?utf-8?B?UlVNMk9xQWx0RnE2elJWajBuMlpLM0xOT2tLYWFTUFNrREFraUxVMDF0b29Q?=
 =?utf-8?B?SkVPdklKaVRpYlR1R0pVbGN4RDZ1eVNtTU9pU3ExNmlEOTJMZjE0aEJRSXFT?=
 =?utf-8?B?RndGSTFHTW55MWtMTWFVM29Tb1U3RU53NE1BU3RqQ2dxdWI2bUVLSnUvVDl4?=
 =?utf-8?B?MDhUQ293RUlGWGsxTFkyMjBCV3JtUjdBOElWY1d2OGlKYUU0b01NTU1Ec1Ra?=
 =?utf-8?B?U2ZOWlBkQWU5RmVoWHpwZzluWU5JbUEzcTRWQjlRV2NEbGZVWTYvUXIzMDJr?=
 =?utf-8?B?SURsaVZSalJnSzRIRmZnNVRkZGFDN3E0QW5NQ3RmclZvbmx0SnBWSXpCL0ZS?=
 =?utf-8?B?MWtyUncreXM5VzhJaVFuY3RGcGZOWVpHWDZkODJBcERSaU4vK2loTHlyTCt6?=
 =?utf-8?B?TnlhbjR4OHMrZXFaUWFtUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFlybVA0SHBack52UXJFWTcvU05jVnY4c0tneUdQVjIwMVh1SVFXUksvRXg0?=
 =?utf-8?B?SDZRR0lDdzdMT25GdUltU1ZqUGhLaE0wczlkemF2TTgrdkl1MC9rRXdKMnZo?=
 =?utf-8?B?NHFFTjF1S244ek9LeXEyMjIxQTVlVHpUKytjdFNIdkZkMFVQbjdrVkJnb3Qr?=
 =?utf-8?B?K1NrdjhaenZCQlZodUh6WTBwMnYyZ2ZUY0RCdkVEeFNPRzRkRjA4b0tTZjlB?=
 =?utf-8?B?NisxZDJvdUtZcFBvN1ZrVVZPMjZtK0JZVkR1L0V3aXc3UC9XK2Y1dE81ZGZx?=
 =?utf-8?B?SEZWTGF5RGxMYjk3MWE2YkIyRC9tQU1BYTNZY2I1WjNSM202MytXejZoL3Fi?=
 =?utf-8?B?UFBnQWUzMjlNdTZNbmd5enU2cHNTdWJUdDVDNjkvYmhiVnpxajZSTjdzN0Zn?=
 =?utf-8?B?SUhVSVN5aEpLanZBMjJ5Qmhyc1VGWkZZaitCTGR1Y1NLZEVYZDhrdEJjdGRq?=
 =?utf-8?B?YmJkRk1nMDdFVlJOdkVqSHZMa08vdmN2SW5DNGFaRlRvUjZSdk1xV1g4Z0NC?=
 =?utf-8?B?d2JKWUZGZ0RxS3ZJSlMxc3FlWTNXRHZ4UFlTSkNxendaS1U0Q2tJODVEZFQ1?=
 =?utf-8?B?K3dmMGFkV1phOFpUS0tRWjRhZGlNUlBXVjVXY3Z6dk5DVnoyWFlwNHNTZ2Y5?=
 =?utf-8?B?Z0V6TWxMdjlEUm0rNXBGcHdPRWRGMDdKVE5Xck9mTkpQM1EzVWNhRGhBWDJq?=
 =?utf-8?B?VUM4bU1ZekNvRHBZdUxWa2RZZjRiSGVzUnZ2TlF4VEZVS3lXcjBjOS9oSGhk?=
 =?utf-8?B?Wnl1a1o2UDBOb2d2dWo2TEtpK1BKRk1kMnJ0VkZ0Y2hCb2l6OEprRFJQa2Iw?=
 =?utf-8?B?VFFsbDdpL2x4bkxwa3pkZXhqeU56WFEyZG1NV2hLNGZkbDYzcVNEbzFrQkR2?=
 =?utf-8?B?cGt2Zm9YeUJQbTQ4Q3lpSmM0VXZodmhsci82K1FjbEkwclFob2lMSkNwbVdO?=
 =?utf-8?B?Wk96dFlrYy9XazlLdzdWeTBQMWUrWHR6bkEyT2Q3VFhmZW9GZnV1ZEtjM056?=
 =?utf-8?B?aWExd1JIRnRwSFYzUEVWeDltQ1lkTzhsNVYwRUNlNjJzMzZ0c1NQMUZvNVpv?=
 =?utf-8?B?bmNET0YzVVBZZy81S0NqMkF4L0pCQVR3eU1OUDVGdmFpSjRQYVFHaittNW44?=
 =?utf-8?B?Qkc1WExiamh1WGFGZ2NNOXVHQzhDcWFFVDlteklPOVR5VVBZTUZHZjRid2pO?=
 =?utf-8?B?UW0vTDFQZTNoa1BKMVIweWZiUkJlTnkrdkpGTnVhc09mVVJBT2hsamV2bXUx?=
 =?utf-8?B?dndlc1ByY1p4Smxpb1ovSVkxOGk0V2VubzJpRjEzdHpTbEsrc0d6Qmwzd252?=
 =?utf-8?B?TjJhQXpwaWFSVDBUV0NiY1pPQTNhME9BVEJEZ0IwTmNVNERzZ1B2aDBORUR1?=
 =?utf-8?B?d2d6YnJqLzhxcDhXaGVvY0EvZzl0d01NbEN1VGk1M0JEaTdCaS9PbXJtejdP?=
 =?utf-8?B?RDZHZk5CcGJYd01CQzl5SXA1MVBRY3VoV1FuNmNRWG5aTkhFRDdobklPL0hN?=
 =?utf-8?B?b08rMnFSNVlxWko0QzhHS0NmZ0pBYzkzUDR0QlM2Z3U5RmNKajJ4VHBXVnZv?=
 =?utf-8?B?bnlES0NTbWVaaUd1YzNzVFhPL2xXZEtjY2ZPc3VSc01OUGtXMElFRnhWSnVE?=
 =?utf-8?B?V1E3cUgxR1c4UnNtYzV1UEpRcFB4RGc4NDJSQWo4VzhJOHdkSkZGOWlDOXgx?=
 =?utf-8?B?WEtlUHkweWY4bmdoeld3bjNaOXVZYzRHcUVMeGVsaFVPbDc3Nk9uRUlKREVU?=
 =?utf-8?B?bzNPWW9jbjRDTzhvYkVNMzZJc055TDQ5UjZCVmpDd0NyMFprUHQwYmxXd1ls?=
 =?utf-8?B?dmxHcW5Nd04zc1hrRG1TcE55UFNjZ3k5NW9CQ0tlVThxK3pkU1Y2cXFQWmhk?=
 =?utf-8?B?T1VyT3dYazdZcXVMVXJMSGNPYWhmUXNvNUYrbDdRU0R2dDhJNkZLVENkaHNj?=
 =?utf-8?B?MjlaSnJyYkRMKzBiTGpqMTNJNUMzSFJyMlQzZ2w3Q0hnTVBLb2xvdmVNZ1p6?=
 =?utf-8?B?bkhHRDRoeTJHd1A1NEhVTTRhcFlOelg1UURyQ0VSOFpVemdiZUFJNHZqR3Vn?=
 =?utf-8?B?WWNidmhtMEVOQTFIZVgyRDNkMGNKODdLSkJjV3hlbjAyUDBic0JzL3NKL21O?=
 =?utf-8?Q?VyV1KWOoW1xdtbfXkNm3iVFss?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9204903-6c04-456b-b856-08dcc282112e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:11:47.0693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Lpze0nzJz2UH1p5DrZFcB2RvoOVJmsnfT01ea/R/fh5VKcD3Q/8LATGwX1RrJM/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9245
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

Am 12.08.24 um 04:49 schrieb Huan Yang:
>
> 在 2024/8/10 9:28, Kasireddy, Vivek 写道:
>> [Some people who received this message don't often get email from 
>> vivek.kasireddy@intel.com. Learn why this is important at 
>> https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Hi Huan,
>>
>>> The current udmabuf mmap uses a page fault mechanism to populate the
>>> vma.
>>>
>>> However, the current udmabuf has already obtained and pinned the folio
>>> upon completion of the creation.This means that the physical memory has
>>> already been acquired, rather than being accessed dynamically. The
>>> current page fault method only saves some page table memory.
>>>
>>> As a result, the page fault mechanism has lost its purpose as a 
>>> demanding
>>> page. Due to the fact that page fault requires trapping into kernel 
>>> mode
>>> and filling in when accessing the corresponding virtual address in 
>>> mmap,
>>> this means that user mode access to virtual addresses needs to trap 
>>> into
>>> kernel mode.
>>>
>>> Therefore, when creating a large size udmabuf, this represents a
>>> considerable overhead.
>>>
>>> The current patch removes the page fault method of mmap and
>>> instead fills it directly when mmap is triggered.
>> I think it makes sense to populate the vma when the first fault is 
>> triggered
>> instead of doing it during mmap. This is because the userspace may call
>> mmap but does not actually use the data. Qemu works this way 
>> depending on
> Yes, the idea of this is also related to the concept of page fault.
>
> However, the folio has already been pinned during creation. I think 
> using the page fault
>
> again is theoretically sound, but it may not save memory, only 
> increase context switch overhead.

This is not about saving memory but rather correctness and desired handling.

A mmap() operation is for creating the VMA and *not* filling the page 
tables. That might work but is not really a desired approach.

Regards,
Christian.

>
>
>> whether opengl is available in the environment or not.
>>
>>> Signed-off-by: Huan Yang <link@vivo.com>
>>> ---
>>>   drivers/dma-buf/udmabuf.c | 39 
>>> ++++++++++++++++-----------------------
>>>   1 file changed, 16 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>>> index 047c3cd2ceff..475268d4ebb1 100644
>>> --- a/drivers/dma-buf/udmabuf.c
>>> +++ b/drivers/dma-buf/udmabuf.c
>>> @@ -38,36 +38,29 @@ struct udmabuf_folio {
>>>        struct list_head list;
>>>   };
>>>
>>> -static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
>>> -{
>>> -     struct vm_area_struct *vma = vmf->vma;
>>> -     struct udmabuf *ubuf = vma->vm_private_data;
>>> -     pgoff_t pgoff = vmf->pgoff;
>>> -     unsigned long pfn;
>>> -
>>> -     if (pgoff >= ubuf->pagecount)
>>> -             return VM_FAULT_SIGBUS;
>>> -
>>> -     pfn = folio_pfn(ubuf->folios[pgoff]);
>>> -     pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
>>> -
>>> -     return vmf_insert_pfn(vma, vmf->address, pfn);
>>> -}
>>> -
>>> -static const struct vm_operations_struct udmabuf_vm_ops = {
>>> -     .fault = udmabuf_vm_fault,
>>> -};
>>> -
>>>   static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct
>>> *vma)
>>>   {
>>>        struct udmabuf *ubuf = buf->priv;
>>> +     unsigned long addr;
>>> +     unsigned long end;
>>> +     unsigned long pgoff;
>>> +     int ret;
>>>
>>>        if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
>>>                return -EINVAL;
>>>
>>> -     vma->vm_ops = &udmabuf_vm_ops;
>>> -     vma->vm_private_data = ubuf;
>>> -     vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND |
>>> VM_DONTDUMP);
>>> +     for (pgoff = vma->vm_pgoff, end = vma->vm_end, addr = vma-
>>>> vm_start;
>>> +          addr < end; pgoff++, addr += PAGE_SIZE) {
>>> +             struct page *page =
>>> +                     folio_page(ubuf->folios[pgoff],
>>> +                                ubuf->offsets[pgoff] >> PAGE_SHIFT);
>> Please don't use struct page pointers, given the recent conversion to 
>> use
>> only folios in udmabuf driver. I think what you are trying to do 
>> above can
>> be done using only folios.
> Yes, just use pfn. Consider of HVO, must use this.
>>
>>> +
>>> +             ret = remap_pfn_range(vma, addr, page_to_pfn(page),
>>> PAGE_SIZE,
>>> +                                   vma->vm_page_prot);
>> Could you please retain the use of vmf_insert_pfn() here, given the 
>> simplicity,
>> among other reasons?
> I will make the correction.
>
> Thanks.
>>
>> Thanks,
>> Vivek
>>
>>> +             if (ret)
>>> +                     return ret;
>>> +     }
>>> +
>>>        return 0;
>>>   }
>>>
>>> -- 
>>> 2.45.2

