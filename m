Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJahD7B6c2kfwAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 14:42:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 911C47669A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 14:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA66C10EAD3;
	Fri, 23 Jan 2026 13:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ywrg0L5r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010067.outbound.protection.outlook.com
 [52.101.193.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A3810EAD3;
 Fri, 23 Jan 2026 13:42:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYXejbjrLng9LbuY/Bw2/28C+RXP5GfIxb94eiJAfXAgVJYamcDZctmWCqnq1KZlYWYUqS/w5wR18TaITtOU/KDeHCpTzvf5ci//E0o0qc+TUW3A+KSPpN8Nx8/tEyjNISeQOWBNvoJNTpknlX7k1Lm1kb9YWQmPyRyNTbA6Xt/BhpiUfHviWdxJzPkhrNayQO8f60396tOi15FII8qMVQgKy4tmFO2JK90TFrsrhQ1m+OPQLVHAoBn5bKvVuWKn3sFGIj/KJNfRmaTpqNnUlHVn51omGk7Zeh0rLe7x2iI+WAh7bgwjp+acQLldWY5ThLjoUM+HKRBMVnDHRHiKVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJYN4jQ1TUy3HCZ12Ac3BZD1ToFMwpRfoGByyqCZyCI=;
 b=agAukc9jMn9Fv5sdP3aQiDre7T/vU9Wjc3zqS0lYJs7nM4RUgsMdU6A+axuRfzDdyKWkeUiTqjDJndJ4A3Bs3QUm/p0OJ4sDr4EoJIlk7xuejyjXLkCz1AwTO+Qzl9xFlvPmIPYFaoS26U0H0RvuWaofeKuDfOEPeFY3oemX/NUP8jDjZmd/2FwjgS/HRPrWy1c6tJegJ1cF9wugGW/H/UQmddhjuPOXNMjIsBGu9lWiqYJ8LZQv5uu4WRKMImcZ/f4SFNAPuHjy3FJHkPB/f98YHtYwnI7Z5qH8X6lNI8C2HEZDnyLCquCVaOZ4xpvJ7nM+DyTrYvJ23cUOW6King==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJYN4jQ1TUy3HCZ12Ac3BZD1ToFMwpRfoGByyqCZyCI=;
 b=Ywrg0L5r3r1QkPfOw1fRtR8sz2OMd66OuHlRINORhxCgvlnShUWm2Rv7JWHBCxc1bHHii9u40vIg3SpfDSuipCw+c9uOZlFcNlEetK1yM6TGCDYdTXoLLiqPu5ApR+oO4I9PVxBsAesRiyNJPo29R+nn3j6Xh1DU0O7ohQI/kFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB8423.namprd12.prod.outlook.com (2603:10b6:208:3dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 13:42:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 13:42:01 +0000
Message-ID: <16fc7a46-92d3-4f17-b02f-ce038796b6b0@amd.com>
Date: Fri, 23 Jan 2026 14:41:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/radeon: Raise msi_addr_mask to dma_bits
To: Vivian Wang <wangruikang@iscas.ac.cn>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "Creeley, Brett" <bcreeley@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, Thomas Gleixner <tglx@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev
References: <20260123-pci-msi-addr-mask-v3-0-9f9baa048524@iscas.ac.cn>
 <20260123-pci-msi-addr-mask-v3-3-9f9baa048524@iscas.ac.cn>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260123-pci-msi-addr-mask-v3-3-9f9baa048524@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0793.namprd03.prod.outlook.com
 (2603:10b6:408:13f::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: 334f1bb6-ba40-4f24-ed39-08de5a852fd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1VDblpsUCtWbXlCZTA4MnN5Y0UwNGZDdkVtQVc4SjJQVXFndkFoVGhybWEv?=
 =?utf-8?B?OVk4emdxNkRYY2NmQVlZY2cycm9SbHZFR3dzZXhmdGFITU1FbmdWUVNJWUZO?=
 =?utf-8?B?dm1HUk9OQ3I0Q0M3QXBPOHN3WWJOTnBEOC9sSEVwVGt0eUlLVm1VekhJa3V1?=
 =?utf-8?B?RUVRTEdyeDdYUWhhZmJPNEtOSHBEdDZneGllTGRCTjY2ZXRPMGZqajUxN3ZC?=
 =?utf-8?B?ZWlIcC80b2ozeTBLRDBtMWhSejRtK1AveEFEKytiaEg5QXJiL3pzZDZncmJY?=
 =?utf-8?B?TWJrbjlYWVMxc3N3VVB5SUZKZmFxL1RjOVpyUmNlbS9SVzVLWXRJRFlLL2k4?=
 =?utf-8?B?TXM3U1o0MW5DMURvdTVtbnVnSTVpSVpEcVdsbUdZL2JNS0NHNmpGTVZxTDNW?=
 =?utf-8?B?MUNQRWQzaEl6bm5BTEpCZ3Juc2FUQkFZYm8zdVYzc0RveC9McTJiUnB3RkJM?=
 =?utf-8?B?NG5nUnpFSWhBZC9UQWx4c2NBd0srZU1OQmdUUDVBQmRtZ1pBSTFBWFhEdm96?=
 =?utf-8?B?cy9nYTE1OERUQUcxeTRmZDV2bnVsdXQwMjMyUjNKaitSYWx3SjV2UWtVc3NK?=
 =?utf-8?B?S0gxWk9HanlicjZZaEY1ZlRidzNBdlE1Qk1zNEJ1M3ViMmlac1B2WWlpSTRn?=
 =?utf-8?B?b2ZuZmtXYnhHaDdyd3cxTVFKQ29sVEtLVWZNbzVZMVoxcHJBbWlwZGhkcUNz?=
 =?utf-8?B?czZZZi9KVHdYb2RCUFQ3SUVvaDlMOHgxdGFWQnRzQmtTaUhVcHF5M2IxQUR6?=
 =?utf-8?B?RTBnUkwxYmN3cTQzbkVHTjh4ZXBjWHRvL2Rtb1pNNGlndmkyRmY3OUQxQUJK?=
 =?utf-8?B?Tnh5UWV0aGY4dWo0bHpSM3hvSjZja0pvdmUxYjZyUlVnMWIxZFQzaVBTZ09E?=
 =?utf-8?B?M2p3ejRIM2NxVzdXZllaSTdQbHp4QlozdWdkVXdJK3I3cFZRWjZzRWVjZUVU?=
 =?utf-8?B?RmJ5NXhkWW9ZemVZODVId0lyUEFUa3JISEJtVVhvZVcvL3RuUTJDS0RvbWIr?=
 =?utf-8?B?cTIyejNyeThuRTl3b2N6YWFUVWYvZE5XMFFtUkk1ZXk0SU9IL3QxVFRJTmJV?=
 =?utf-8?B?RXBtR3hob1AycC9oV0xyak55SzZYQlhaMHFPWUcwSlJxTHNvbTIzVVNvU3R5?=
 =?utf-8?B?eEdWT05DbkxpSTBrQ0FKOEFsendZMkFLaUNybVNqUmtmYUxIQ1J6enNndFZ0?=
 =?utf-8?B?Y0NKaWtXT0JpbTNUTnBYYjNlakR2ajBjeDQ3TGNUTGFValZuSENRL29nQ2g5?=
 =?utf-8?B?NkVjRHB5dGFuUG92NzJ0RExsNmNvSzFTMVhGY0RhaTVkNFJCMmkvMjViMEx3?=
 =?utf-8?B?WVI3NGphbFpQemVTMThCMERCWUd1eWs0V25LckVrUFFZTk52M0RZQWQ3MWJ2?=
 =?utf-8?B?VmZmZDI3N3hoaVBiejJSVS9taVNpVkJhdnBuQzNCMXYremY2RUtsRUpZbHY3?=
 =?utf-8?B?cFpFQXhxS0J2WEp5Tno0TElqTHhEWTFQTDQzNFNaeFEzNkdOUWxZRXdENk80?=
 =?utf-8?B?S3AvZ2Iyb2Z3VGhzWWFxVG9iTXEzV2VPRXk5ZUpmRnRQdE5WdHN3dFFxVThZ?=
 =?utf-8?B?bVlNNlFsNTZJWnhQM1RXOWNCdk9keko4TmY0SVFUV1NVWVZ2NWt4QVpTdFY4?=
 =?utf-8?B?SXBXcnhLY1VVaTZzS3pvdXNxcEZwemo5Nlp3L3FoTzd2eHBlK2pRM3N5UkR4?=
 =?utf-8?B?SnVkMWF2c3JxMld5eG1CTENEM2VCdHQzWUl4Q2xLbU04LzluaE9OYVkvVXRS?=
 =?utf-8?B?ekUzZFNmaE5jWmJ0WFZrMkdtZmJGNEYvY3RVMGx1NkMwRi9ycWVrYWdzRG9p?=
 =?utf-8?B?SFNMRENwZmRZQm0vTzVZMW5Yd0RQd0ludVdCM1p5Umc3RnhhVndUb2Flb1ZQ?=
 =?utf-8?B?RmQ2UmpHQ2JEQ1FYWGR0cU1ROUFpYXlzZDFVQ1dGSjJDQjVrcnozd2d5aVFR?=
 =?utf-8?B?eXpjTzBRSlVsYTA2OVdFa2xnWndqbkowWk9SWHBseGMvczJTaHBMWExGOFlS?=
 =?utf-8?B?VXFnRG5nWDJZWFprdm1XaW01aC84eC9QcFJSaVBNL3FNUkpsMnFPZHpSbElE?=
 =?utf-8?B?RUZRcTNVZisrbFpPdTJDVUpFRWNRUWljZmNISmxnY2xQbjlkdVJnT0RMWkpp?=
 =?utf-8?B?M0RmMklYSkZpS0doSHpFOXVWdExoN1Q4eWdHclNOTGM2MkdKQTM2dmNEdDJK?=
 =?utf-8?B?ekE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWxhZEpodXdTNEt2cGEyak8vNG5HYUtOeFM5dlMxWTVjakF0NTZ4TGtIa1BU?=
 =?utf-8?B?Sm9HZ2FXSmJmRlNvZHJ4Q3g2OTJnTzV0TXJObllZMUdKaFJINy9pWHVNVlBP?=
 =?utf-8?B?bWFYSDFZSDRNbHg4SWpUUlFtWHZTVnZiY3VHbmRmckFEbzhvYngyK09xck9B?=
 =?utf-8?B?TmFQOFluTkUzVm4yaG1oVEsvek9CTG5HTmtZNlRHcno0N0Vnd2tGeEFPVnNT?=
 =?utf-8?B?TVZUNUNyMVAxYXA2TjdPdDdBMGdGZ0JCb0Y3U1ZGOFI5ZGhZSUFPYS9KYmVN?=
 =?utf-8?B?akRHbE5kK3R0dUh5Z3pHZlBTT3orL2dMRmhOUkR3R1p6ZmRFbW9RTHp2dm5J?=
 =?utf-8?B?aVNQcUdLdTFEWk5MVks0czdNcXhiYjd1ZDNSbHY5NS80UzFYdHVFV09KZFQv?=
 =?utf-8?B?Yk5uZzlRbCtGSUViNFJxWUpNR3VtK0xLZ0VYUVcrZXhzc2hSNXhjWDR2MG5i?=
 =?utf-8?B?NThvMWsxRk9ZMkNGaWJZWXJSU2FFbUpRcHU4cFZLd0RPR3UyV3o3SXNTcE5j?=
 =?utf-8?B?OGQ2TGgrS200d1drSHlUUFQ4SlA5ejN2cXVwaFdFQkxzbWRuTmt1TzQwT2pC?=
 =?utf-8?B?Y1hTcHNIRkFCSzMrb3NYQTJoMGxYSmRmRWdMNEZYVU9ZYnNXMDRENDFWRjg0?=
 =?utf-8?B?N09sNUxQMnliWm4rbE5YaVBaZFJYelU4Zlkvd3VPd1V2N1F5WkFLS2lRYmwy?=
 =?utf-8?B?Y1VCRnYzRitjeXN6OUs4M0VqSEhwSmE5dnRLSm4ycTVRNm1ESVJMblpFYVY5?=
 =?utf-8?B?d2NuTFovN0YwUStNNWFZNUVFWi80amoxaHNDMVI1TTByVUR5NVR5K0NsZGFz?=
 =?utf-8?B?TjlpYkU2Wlc5Yy80TERWay9NUTdXc2RUbkR1TU96QWowaWV3ajJ3aTkvUVIy?=
 =?utf-8?B?bVNvTmEwQll6NTM1ODJiTzZXT3ZQT0tIdkJIa0dwTHRlZTBvZTZlajVUYjFu?=
 =?utf-8?B?STJaMGNPVm1uZkVNT2VCdWNYc0dRMzllL0orTGI4V2dGNXo0NlRCZFdIUmV1?=
 =?utf-8?B?OUpxcmR0cFgydVF4TjkwYm5TN1kyVytGYk9WMXpXL2J3aGpPMFJSV1doKzVr?=
 =?utf-8?B?c1VvaURKYm1CMG9SUnJlUFNSVTJ1VGtnMjFRZzA0bGp5b1Y2MjFpdkpXZkN0?=
 =?utf-8?B?bGtWUGpxMGUzNDBPblJpR3dCWjlLMHlkckk5WnFKTVI0dUxxcDJreWNuTUEy?=
 =?utf-8?B?ZjJhaVpyT0V5VjdKeXRPVU9NL1N0K01LNFkrSXZFZEErRG1IYkVFczYzYUNp?=
 =?utf-8?B?ZVB0OUJHSUxLK3VIUStHSzdCeHh1L3ExWEJYUXVsWkorSGVjVW1vdnpGbnYv?=
 =?utf-8?B?VVo1TEdLc0ZmM3JoNzhpWTNmZEhmRmtkV3pRUlBXZmJzRGJ0aUtUb2ZpbjJv?=
 =?utf-8?B?ck5CcFJVT3hOak5abzl6ZWNPazNaZGJjQ005a2s4QVY4N3hDVUsxZHpnK2xU?=
 =?utf-8?B?dmFvbXpPOXgvUVVXNk1RMXAzR1A4c3VrSGFqMFZwK1VFY3R0V1FRdTFXK3dI?=
 =?utf-8?B?eG5wOUpnL2EyZWJSQXFLbXdTak9VZjJYZXEydWtNV2I2NjRqVTM5MjBidGlF?=
 =?utf-8?B?L1FUbTBncUhDNmFFMzNnQzVGZ1NYdEg3V3pscU1rZUFlSFhtZk13Q0JYNUpW?=
 =?utf-8?B?ZldmYmNPSE15YmJOOGNnb2dUd1NxT1VzVDBQc3lHSHcwUVVNa3lYZ0l1YXF0?=
 =?utf-8?B?Z0ZiaGFRRFNnbTYxTVhtUWFqSXA3RjBDSjVSWEhYazFwR2MvekppeitKT2tV?=
 =?utf-8?B?NVRIcno4Ni9SZnJRRHAxcjhXN3NIMmU0bVRJTzlhdzVRZ0NTb0MwTWd4ektp?=
 =?utf-8?B?VGUzczNtbjdMSDRBbndJUGwyYlJPL3lPOHBwZ1hqWjRsUkdpMERiaDhocTdq?=
 =?utf-8?B?WVkxNVVqWVpSVFhDdlZjaGxGZkJqbEpiOTQ5bDhySjIzOXZlMTNQZndBOVdU?=
 =?utf-8?B?bWxKNVh0NDdwYTUycHRWc0ZDSCtQbG5NQVNla0ZOMVVPVURrcHNqOVBDeGZi?=
 =?utf-8?B?cXNsaUJYRllYYzk3dkV6VkMvaU9SSTNKZlhlaC9FNXVHdFF5UmlpdGdRN2R6?=
 =?utf-8?B?V0o0MSt2dU9LaHJGbVBEUW5MWVpHNTRWNFh1N0xVb0grNllGV1hYYkVXeWxL?=
 =?utf-8?B?SFhYeEZqck51MjZlZzNjSlhTR3pGTmsrZW5wTWhLUFhaQzkvTkFrb2x5SEJv?=
 =?utf-8?B?NWNVSGhRdGgxYkVEMnVsNFFsUGx1SEVzUXYrdzZiMVJBMTJPeVVoM01OYVRO?=
 =?utf-8?B?RFRLN2tOYnVKOGx4QldCV0p3Q3FPYWZ2eS9TMkRJY3JiOUVEaUQ1WUx0aEV3?=
 =?utf-8?Q?scj1+VK3x4SVDTpGn4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 334f1bb6-ba40-4f24-ed39-08de5a852fd7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 13:42:01.6957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6lC1CR72z071iWlg9sMh94nzVM3QqmYTgJNgb7yMSE7s137T3o7Fa7nSVv2oq+6X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8423
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[iscas.ac.cn,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,amd.com,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,perex.cz,suse.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,netdev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 911C47669A
X-Rspamd-Action: no action

On 1/23/26 07:07, Vivian Wang wrote:
> The code was originally written using no_64bit_msi, which restricts the
> device to 32-bit MSI addresses.
> 
> Since msi_addr_mask is introduced, use DMA_BIT_MASK(dma_bits) instead of
> DMA_BIT_MASK(32) here for msi_addr_mask, describing the restriction more
> precisely and allowing these devices to work on platforms with MSI
> doorbell address above 32-bit space, as long as it is within the
> hardware's addressable space.
> 
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

Looks reasonable to me, Reviewed-by: Christian König <christian.koenig@amd.com>

But please note that this is rather old HW which we don't have around for testing any more.

So should anybody complain about regressions we are probably going to have to revert that patch without further investigation.

Regards,
Christian.

> 
> ---
> v3: No changes
> ---
>  drivers/gpu/drm/radeon/radeon_device.c  |  1 +
>  drivers/gpu/drm/radeon/radeon_irq_kms.c | 10 ----------
>  2 files changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> index 60afaa8e56b4..5faae0361361 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -1374,6 +1374,7 @@ int radeon_device_init(struct radeon_device *rdev,
>  		pr_warn("radeon: No suitable DMA available\n");
>  		return r;
>  	}
> +	rdev->pdev->msi_addr_mask = DMA_BIT_MASK(dma_bits);
>  	rdev->need_swiotlb = drm_need_swiotlb(dma_bits);
>  
>  	/* Registers mapping */
> diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
> index d550554a6f3f..839d619e5602 100644
> --- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
> @@ -245,16 +245,6 @@ static bool radeon_msi_ok(struct radeon_device *rdev)
>  	if (rdev->flags & RADEON_IS_AGP)
>  		return false;
>  
> -	/*
> -	 * Older chips have a HW limitation, they can only generate 40 bits
> -	 * of address for "64-bit" MSIs which breaks on some platforms, notably
> -	 * IBM POWER servers, so we limit them
> -	 */
> -	if (rdev->family < CHIP_BONAIRE) {
> -		dev_info(rdev->dev, "radeon: MSI limited to 32-bit\n");
> -		rdev->pdev->msi_addr_mask = DMA_BIT_MASK(32);
> -	}
> -
>  	/* force MSI on */
>  	if (radeon_msi == 1)
>  		return true;
> 

