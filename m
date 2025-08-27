Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B596EB38BA3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 23:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C65F10E0D4;
	Wed, 27 Aug 2025 21:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cw46WkoZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949D010E0D4;
 Wed, 27 Aug 2025 21:50:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=onMvJipcaXExdbkxkyW4jg12rs4EXWXtjKL4ZZ8EGWJrLEUoftVjKp4oo67B3Ar+ZwfrjM8yn4STYNmHhNp+AlcFTNh1w+LgMiOhegqNDYlFWEoiWfrhQ1ghF1ra/SZ4iGsf/RtXAlpKfGRZ7t3w95guv6TJ9kwO3/O+S3u4B4GOAbjYTo9OZI8fw0kA0ILzm8HTB79fHlimz6JUwftvrKeD+1aBU9S+VrjWBWPO6BtrRm8Bwq7f6m5UG6o76InYYAQwZ20TLS/hPNDHau1h+n8ZrwzFaEpxoObrkeFziPoVmDu0nk1Cn66jw0BS+YpD8UCO1f8XskAB+j/4idTi1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0g0q1sXumief/L9QPtC5xF+UOAFqyxR/uj7CZYXVCM=;
 b=ksOJ7FGpY7akZXgP9RkMOWascdpplxBFLYT8VPbvYgA9J5tw+YNjYe0UH5CwV8LABUBCu2qHnXHikh1nJhI8Cnk6eI+pzXzFxDx+Mizw9NDAYHBgQ8dEYLDw9ShVbIZ7ayP3/ZHDvUGrnYSEQEQFpPOLejldR9eORwYGxuhDoaskTkwPrPjmNf2EKRKLrhZB2h1qOkLbzqJl31K06atxpcopd+wJVV+QWcMtKm45yJ+nSg5Q/0IfWLd5UWMrQS3lZQ+8OZlmfJ23m5mtBt3koI7AdebWGeJtcDyZ4mgMlBUbLXy26AEbmXrATe0UA5BQybtfHgE0LBffgCEKv/XvJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0g0q1sXumief/L9QPtC5xF+UOAFqyxR/uj7CZYXVCM=;
 b=Cw46WkoZDaWPcs9Y85/aiMpBH0q/ro6jmU9WFD8pgHYu7WStD1K12ZaOlMelEXmWZ27xdEVNRsilppBQ8baA9jOeIDrIYxApvI1gLFhG5J6BfJw+sgvdlGmepf4gdWtzqNZ1wjixhNutax0w4yMIveOIExsVnuyVMha1ZiviNjt9HM14XVUybdu86qgwkDA6X6BGDyzCx5nJ+pbwOawl/HdugKWBgIWLqHWYhIlR68nOJxEvmnBK/3e388IiwjYWCTZRJvkPmAa6nu2qVwgMyiOHW8pkyDRLTgGD096MTeQel+Tpy1zNBAIQwOpEbVzu2a1hhxnPTrsizv3A6IP9rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by DS7PR12MB9041.namprd12.prod.outlook.com (2603:10b6:8:ea::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 21:50:39 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 21:50:39 +0000
Message-ID: <2532f8a1-83ba-4f72-aae7-9d810eda417a@nvidia.com>
Date: Wed, 27 Aug 2025 14:50:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] gpu: nova-core: firmware: add support for common
 firmware header
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-2-93566252fe3a@nvidia.com>
 <9adb92d4-6063-4032-bf76-f98dcfe2c824@nvidia.com>
 <DCD2VJ1WJW2O.VM7E4PD3DFYO@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DCD2VJ1WJW2O.VM7E4PD3DFYO@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0038.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::13) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|DS7PR12MB9041:EE_
X-MS-Office365-Filtering-Correlation-Id: d5ca10de-7e2d-457f-d247-08dde5b3c339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0pDTENxd3VjY0RtR0Q2L1ovWk9QdUVtbDdHakRleWpKSXNackFKZitxRFlY?=
 =?utf-8?B?RiswUk9wSElLdnlPc0ZVMkd0MjlKNUtKY0pTc0FpRnp1THc5OGhJQzhVeTRp?=
 =?utf-8?B?RWc0UzErVWNxcXh4TXFpMWRUcGpTV1Bnc1VkN3BYOTlMSWkzV2QwYS9IVTJl?=
 =?utf-8?B?TnB6S3FRV0hta2ZSSjl6Rk9ZeUxvak9mWUwvNm1JNmxRcHpnVHp1OWJvcGJ1?=
 =?utf-8?B?dE5UMVVxYjlpOGFhYlZYcHNnZHhqN2xzRGwzY1hjQ0g1TVRpY2FKaHkvbzBp?=
 =?utf-8?B?b09ES00rYlFwaHVjdTJ4eVp1cEtGSHBNN2hGSHZZcnBMbzBVMXVWMkxUUU15?=
 =?utf-8?B?WUdvekpzSmNEMmp3Q09tcXNyeTVXM0FwbGdKcXplR09NNnhzc1BxN3NXbDlS?=
 =?utf-8?B?ZWhzZ3NSc0wxT01ZSUoyRmt1TTkzNGI2SUllSGxNdWZRRDhiblN1ZHdLcGN6?=
 =?utf-8?B?WjFJeVQ0TFc4andYV05HWkY0NmtQSWtQbEtrRzlVMHBjb0dQbUE3cTZKZVVM?=
 =?utf-8?B?M2ZBTXdLUTdVcmFjeVBmbU1UM09CQWU1NlpoenVpUnQ3WDdtQnBGQnk5MEs4?=
 =?utf-8?B?WWY5bnFSZGNNS3dCMlJQamhQZjYrcDVYaDRMWklBbTM5QnpYWXVCaW8yY0xQ?=
 =?utf-8?B?N1dFWUUyTVlURTFnVmRqUnFxMG1DNWVtcklHVm5uMjBLeFdEK3FRZ09wSmdJ?=
 =?utf-8?B?enFsZVJDYW5SSkdDLzkyV0xxa0Vpa0dmT0gvTFJOdHZiOWhSbllnbGtocFNJ?=
 =?utf-8?B?bXNQZDhrWVl5NWZReEhzdFRwSWw3dnZvM3hpMi9SZktISHVldDlmQkt5ZW52?=
 =?utf-8?B?dzA2NTlOU3A4R29Mck9PUEYzK0JzMlpFSVBkWVkzeEt3MVArMnRLMFJnMHgr?=
 =?utf-8?B?RWdMVlY4RElwbm83S3ZBZmRwTzNtWnhTd0pkU2xPc3VueUZUbTBENW1QQmxO?=
 =?utf-8?B?ZzR0dEt3bUlaNFFoaW92RnR0TkZ2UU1ITTVPQ2VaRndkM1NKWVNyUkRPa2pn?=
 =?utf-8?B?QnllbWNBYytRZW9TOWwzNG96VjlKNTZNc21VdTF6ZFNycU5ZbTRiUE0wQ2s1?=
 =?utf-8?B?eFJwbzhCdFVoTGx3eHNrblJYeDNDZjJKS0RiTFF5UlVnT0doQyt2QnFUaS9y?=
 =?utf-8?B?VElnK2t1Mm9rc2o4cjB6enM5ejZ2RWc2NGtBYzRGL2lMeWtTRUtHbGFtRzhE?=
 =?utf-8?B?RlJSTVAvWW9RbUtETnI5b0ExcnovcStDV1JRVVF6NEhPRkYxWi9VeHBBZjhX?=
 =?utf-8?B?aWZ2TVlwUkM0YW84VEIvT2QyamNhZjZJL2N1MWpOSGUvb3pyaC9LN2xQSDNG?=
 =?utf-8?B?UHZmVlBFVnBMQTMvcEhCbEFwaHNramJzWHZ4aDJGNWM3QXk2RU1Oc2dkVUwy?=
 =?utf-8?B?QXlXUEpkNHU5QmxPbFljaGhwRWtXanlUUTBycTcvSzd6ODVVRTFsNmt6eWZr?=
 =?utf-8?B?ZDVCQzlTZ0NSTjNkeks3K1pCQ0FkMnkzVnFxS3lraDdLaXhXejRxUUR6THFu?=
 =?utf-8?B?VFBSY0xKWGtJRXVaQ0ppOUtiaFhKS0lCdCs0TDloRnY2bjBYM2MwTW5tbHB5?=
 =?utf-8?B?enlOYk9SRzBqV0IrTk5FWGEzcGJQQ3Z5ZkxZd09BWmYxQ3FrYm1HamVLVXNN?=
 =?utf-8?B?M0lYbGYxcXQ0KzJtWHlFeEVYeHBUQWZ3RkRUTjN4a09KUGVOMXoyVXZBNThD?=
 =?utf-8?B?Y0t6WituNFhVaVd3TFJhcys3YjFkTXg0amxHekxxcWNuVzB0bnNmSGJ1TzFq?=
 =?utf-8?B?WnJOREgzLzgyYXNBSHVtQTZSYmxtQ0E0VXFpN2NIT1hIakptbUc4NkQyWWZr?=
 =?utf-8?B?TGlIdXBnaFQ1NXlPR1pPVFJVWWJDZHpiYmFoWlRWRnE2cFo4a0dLVlJTQVE3?=
 =?utf-8?B?b0s0Rm9jN1laQURWOU1lZStOQW9VRFNTWDZIbVE0Z1NKVlNBemxhYXVNVG5U?=
 =?utf-8?B?Q2w5TE5qMUM5MG9CS0FabWNCeGo5UHNNWVFJdHZlVjlTeDVQMmNHNitqNXpx?=
 =?utf-8?B?ZitSelY3dXp3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXcrcGlrQ2gzdEg1dFNOcFZwZWRTcVRNSmlHNXhPQi9PQzZFR1FKSE9iQi9p?=
 =?utf-8?B?eGpzWm1xaTFpSmYrR2Q2c2hySWFiSld1dTVvWS9GZXUvNG9XMEV5ZWZUcVN2?=
 =?utf-8?B?SHRMdHY1YVBsRW1tUjJ4UEpiQW1nU0d6eXRBS2F5R1pad0FXNXVVNnlSTGxR?=
 =?utf-8?B?Wjh2T1pFQ3A1NTdSS2orR2MxMEI5THRNb2ZmUTAra3NBNGp3VmhoeHM5MUdU?=
 =?utf-8?B?S3poSjM2OUptdnpCSjVtdWMyUFdRd1ZFaDdXRC9KVGZ3Rk5uQytWVHJYUkFZ?=
 =?utf-8?B?S2VpR1BQNFFDY09sVHVOSWJpNXRSZXBNY0ZKOWhSb2s3a1VQOGppNkZ0eE0x?=
 =?utf-8?B?dFhINVdiTS82MW5yVjg4a3NuY1pIZll3YVFQWjNEQVJqVTIwMS9xM3k2K0ZO?=
 =?utf-8?B?bFg3azRBMnFlcTliN3VYdUlyb29FclZOV1VZeXUwS0VBY3FlU1hpUEVVMVZv?=
 =?utf-8?B?bDNZSExDbUhRWlRjQzBHcHZld0tGUHVXSkdmRG5TMkM0SUJVTitjSFB2K3h1?=
 =?utf-8?B?UVI5WjJpVTZLdkVqWjhmRXUxKy9BQjUzYnlabE9FSWs3bHJFM2hHMG9hcFZD?=
 =?utf-8?B?UkpkYXl6ZzVyK2p2OStybS9tdFFyN0VaUVJhU2tTZkEvN1V2NmJLWktxeEQ4?=
 =?utf-8?B?aGtoQWgwVkI1c0RDbnpLQ0RWTE5wVkFCSDBRNFdqazBDcmMwTnBldUJzVXR0?=
 =?utf-8?B?Sm9wZ2VHWSt5dXpFZ3JlZjRkQk9rc3ljT1hVcVhaWnZrdjgxM1U5MVZNNW1D?=
 =?utf-8?B?R2haK0V6czlPZk1nbDlxc21Jb01wbEluSTZPSVBuVFRHVUJHc3pONVg3NW8v?=
 =?utf-8?B?REJMNWFIRmxOS01hM1BOb3hKbTRUK1FNTXZwZGhMd3JZa2FXYytna1lTOHFu?=
 =?utf-8?B?U0UyZFZGSU50TXlaUHg4RFR6cG1zazBZazZBQWZaV3ZxM3F6amZkZTd4aHhR?=
 =?utf-8?B?SzF1b3FWWHJUbmo5alRvZjF5OGJuaVRCS3hKVEQwT3pmdHh1bjhzazdXWUZP?=
 =?utf-8?B?Rkd0NGtkcXdVUW5WdFJDUnQyRURJa1d0ZGEzSXN6WURDQTNaK0Z2WHZVZjU0?=
 =?utf-8?B?clFDUXhFZEJmMS9nbWRTU1Z1bVZibDlsZnI4NmpVcjBuNUFuMWQ4SURJdFhQ?=
 =?utf-8?B?SUFrTFdjdXBpSmdRQ05jWHlSajhmM2xScG9LQXQzRitMdVh6SnlpcEN6YVlP?=
 =?utf-8?B?OFNZWnM4Y1pjL2g3ZUljNUliU0c1ZEJqQko2TE5xdjh1eW1tNUROV0ViSDN6?=
 =?utf-8?B?THliZkRwbmpsSVFRdlVQS3k4MTRseG9TZUtyY0VvejRSbzJMVXdzeUhsa0xM?=
 =?utf-8?B?ZnRsM3pLN3pOZFBqNmZuVnFMUHNmZTB4Zmw3VXpKcWRWVWhqeEl2VldRRWQ1?=
 =?utf-8?B?YVhIVS8yT1JGb01jSS9PYjAvVXIwbFc4REJUa2VhVE9heGZFOVJsczJYdzVB?=
 =?utf-8?B?c2JTRzBicFpVR2pTTHp5VkZQQ0Jobm1xMXdXYUNNSjRzRzF3YUVDTGdLR0ZB?=
 =?utf-8?B?a1FsZVZjS3ZsdUh1bXM1enU1ZWtuem41M0F5VC83MUFwYVNiYS9hZTl0UWJa?=
 =?utf-8?B?eEh6OEFNVmVmNUdBOCsrVW9VM3VWWGU3WXZORkNmL0NvZ1ppSG56TmxwMm5Y?=
 =?utf-8?B?T1ZRYksyQTVDV3d4WWg4SDJJYXNCNHJva1dpTkZ1WnNCd004SWFlWWpMMGdV?=
 =?utf-8?B?VzM1T25xbEZlWVBmaU5id2N6MDhoM3dqMW8xVU5hUXpmbXRhZmVmMzhVQ2s1?=
 =?utf-8?B?WU5GM3VzYjRMRkk2ZVZZYTQzcTdPNGl2Wk5xeFRUQm92eFp0bjR6MnJtNWJw?=
 =?utf-8?B?NGphWHAxbGFZZE9WeHdTbHJPcTYzZDVXM1hvQ0JxYlFrTHovRzNtWWJpMW1E?=
 =?utf-8?B?MHY2WEZqV3VqR1YwYW5Lc2dKRU9rdDc5S09laHJSOHRtV0VuV3U2V1YrV1o5?=
 =?utf-8?B?bG9aZHlId01iL2w5ZjZrOS93SjF5UFdGYU83ZktyWGk4VWRFSU0zc1pqcDJL?=
 =?utf-8?B?ZnVjUEdSUUFBemZ2Lyt4ZWk2dmVMdXVlY1Q2QXZrZzFTZ2RORzNMclBJSnRq?=
 =?utf-8?B?YWJtUDFmZ3ZYeEZyKzdxYlI5UEtsdGk4RWg5TnVKTVBzNk10QXNJendITnhC?=
 =?utf-8?Q?dKbK5zyva6Zg1A/xLLqaeFw7q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ca10de-7e2d-457f-d247-08dde5b3c339
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 21:50:39.6073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SpXEJVsOJzhiE5Bj+cRHdxdUP8PoP8USFarLiLnB/3rkahac+T70ma2ZsYdWLfu8MDR+YXoBqtxC84LMGzT8HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9041
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

On 8/27/25 1:47 AM, Alexandre Courbot wrote:
> On Wed Aug 27, 2025 at 10:34 AM JST, John Hubbard wrote:
> <snip>
>>> +    /// Returns the data payload of the firmware, or `None` if the data range is out of bounds of
>>> +    /// the firmware image.
>>> +    fn data(&self) -> Option<&[u8]> {
>>> +        let fw_start = self.hdr.data_offset as usize;
>>> +        let fw_size = self.hdr.data_size as usize;
>>> +
>>> +        self.fw.get(fw_start..fw_start + fw_size)
>>
>> This worries me a bit, because we never checked that these bounds
>> are reasonable: within the range of the firmware, and not overflowing
>> (.checked_add() for example), that sort of thing.
>>
>> Thoughts?
> 
> `get` returns `None` if the requested slice is out of bounds, so there
> should be no risk of panicking here.

I was wondering about the bounds themselves, though. Couldn't they
be wrong? (Do we care?)

> 
> However, `fw_start + fw_size` can panic in debug configuration if it
> overflows. In a release build I believe it will just happily wrap, and
> `get` should consequently return `None` at the invalid range... Although
> we can also get unlucky and produce a valid, yet incorrect, one.
> 
> This is actually something I've been thinking about while writing this
> series and could not really decide upon: how to deal with operands and
> functions in Rust that can potentially panic. Using `checked` operands
> everywhere is a bit tedious, and even with great care there is no way to
> guarantee that no panic occurs in a given function.

Yes, .checked_add() all over the place is just awful, would like to 
avoid that for sure.

> 
> Panics are a big no-no in the kernel, yet I don't feel like we have the
> proper tools to ensure they do not happen.
> 
> User-space has some crates like `no_panic`, but even these feel more
> like hacks than anything else. Something at the compiler level would be
> nice.
> 
> Maybe that would be a good discussion topic for the Plumber
> Microconference?

Yes. And maybe even for Kangrejos.

thanks,
-- 
John Hubbard

