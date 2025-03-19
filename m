Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41986A6863C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 08:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E4110E2E7;
	Wed, 19 Mar 2025 07:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="z//pERIS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062.outbound.protection.outlook.com [40.107.101.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7D310E2E7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 07:56:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMVKiTQkEkvsotcmfCCuBWjBSygK/sPpkYW6XqoEy5+KjNfjItVdVOyND8xEfCtPH69PjzOOZ9C5EB8lJnCWgmyxDc2/wPoaySac7o+zs+vZJC1LcJQh+CLo74fxd2RJ/W+dprGq+qfHCKSIfNrchU0C3PqOdpRJ1cjHwpokr/p/F7jAcgtWk2Rb6x4PM4ege/yrkRkitPzkP7J/iMHdTQ474PCIPxVpfBGjQ3DFAI9gKNPqQawmz5L6oEv/blCUyi9VL+wAG26Q/Y1iAp43lORpMYYcqe6N4yBy4aqyeqjfTP+YQbhW8JDfWIgDiJ1yEKwRv51rvzpyg6iZLwNrKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfjUB0N0DxTadwtDRYnYhR1+s+hCy4UJT3K5MNamjUE=;
 b=E1Bi+j7vuRYk55j4mf+MiIRwMI/PIBQxdD5aASTBec5FDCaNYSZvcZ2cJDZIzhMYRGCH01My76gdicwOKJeBt7zYkWtNN3abiIpQ49sihOv55OAnOKQSeoXobVBCE5vJrMQvS8LW1MTRszAXXGXp6z8tu9CO7a9eVUmvKI8MGrxBSWwspFFq/e0PVjPduRGB9sn+clQLQg+4rOLksVdVgj56QCG6KM1tlCH21yV1NEFcBUbj8gqDuzmRqH36V3035SS2tvPEM0tdTfOfp1g8POPyQLCvcVbCYpg/hsxeM/k86CiUhHcB2hvf7kbv2ip2RMZNOOOcuIi+nsLA0/ad/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfjUB0N0DxTadwtDRYnYhR1+s+hCy4UJT3K5MNamjUE=;
 b=z//pERISbiVC+q3XYz1X0S08BnRKkwK2PpCzl/2cYZ6COQ0T/unQOQrHyNymSVJkxLCS7oWqpRbUgtfiH62P9KtSLfNU0tsKeWWRyFdyAZZc9YN4KyeGmMKEWa6gsUA6gMvU8ivJBcl0zDazcVogE/eLIRtdwzwqPzy6PW/1XBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB7865.namprd12.prod.outlook.com (2603:10b6:a03:4cc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 07:56:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Wed, 19 Mar 2025
 07:56:00 +0000
Message-ID: <c1fcc69e-e782-4050-8941-176bfe68e10a@amd.com>
Date: Wed, 19 Mar 2025 08:55:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/gem-shmem: Export VM ops functions
To: Daniel Almeida <daniel.almeida@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>,
 Asahi Lina <lina@asahilina.net>
References: <20250318-drm-gem-shmem-v1-0-64b96511a84f@collabora.com>
 <20250318-drm-gem-shmem-v1-2-64b96511a84f@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250318-drm-gem-shmem-v1-2-64b96511a84f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: 68b681a2-5b62-4bcc-26da-08dd66bb7cf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dk1rcGhGNUhYQmgrVzRiNUljcnhwVUlVMEthKy9TUmtoelhQekgxMzM2b0Uv?=
 =?utf-8?B?bE5xYXM2aVNqZVphczk0ZWJyZFM5M1BNNGJqT2dGbmM3VUZ2RkpTaHF0aVBj?=
 =?utf-8?B?ZmFvbUtlUnNWNUtIWENibDdBVXFPc0xxMUNsV0VGSUtJSC90bDRFeFJJcUlP?=
 =?utf-8?B?Wkkxd2Q0S2lmSTI0ZHhISFlma0hQOFl4c3Ric29ZMUhGc08vYjkrOWE4TmpC?=
 =?utf-8?B?REVQa3g2Y1R0WU9qTEREMmorM0JxNkZlR094cmVqTEVTR0dwNFBnN2xJZHAz?=
 =?utf-8?B?MUdWc2F4ZDg0a0FUOFFaN3o4NG5JRklXUHBJZFNTYndVSGlVenk5SXlKZFJB?=
 =?utf-8?B?Q21yZW1IWk13TXhWYkxFOEJGM3VpNWNwR1ZYd0RmaU01bFc0Z05GWG12bE1P?=
 =?utf-8?B?VEVYVVdtWGM5b3E2V1F6R1hkMHF0Q3A5N2E2bmlrMnhtT09oUFdqektkOEZ4?=
 =?utf-8?B?NDVCa2xqdG44U0VyYmpjTS9IODBpTWw3eXgySnZONXJWbkx3MjRXblRBNUpN?=
 =?utf-8?B?bWMxZzVhMEw2QUJlazhjVUxLV0UrOTdlNXM5N2M5L2sxVEFsM3BDcGRjcGVo?=
 =?utf-8?B?U2V1RkxaMUJYZWFJSEFoTEVGZHpVOEpMYklNVnJCcitjSE51VVlkMk4rTmNl?=
 =?utf-8?B?QVE3eERSczREUDNPVUcyL3FSMllGTDk5NlcyaThRMVBXd3FIZHBmODhyL00y?=
 =?utf-8?B?blVINTZiQlg4MG9QZmZ1dUs4aHpRanlzOGlseDROR0JqWlhyT01va3pyR1dP?=
 =?utf-8?B?WmxrRHVMWlFuNHlCWTFDdU1qeWpVbW1FdTZlVmd4QzlqeWt3aWttbzk5UTJW?=
 =?utf-8?B?TU1wSmJUZzM4ay95NFQ0K0VMd2JuaXB6YTJxZEpndnd5MHE2TFdDWVZtQlVK?=
 =?utf-8?B?OVZXVXNIcFBUYjdOZEpyZDhPZWIxdkpydExyNksxcWlKZlVTSUdPaE94bnVp?=
 =?utf-8?B?TEJaYklJcGgzUlM5aTdwVEVMbnhZQ0lxTnliVVR6czZ6VHRIVFU1NVBlalRo?=
 =?utf-8?B?c0h5bkFQNUF3Zm9nTUsxMS9ZL09QanhGdi9sL1JHTlFOQnBvdGZmRW9kUmh1?=
 =?utf-8?B?S2tvdSs2QTdWSjFyd1JmZkczbnZsR1dvMkRNVkVOWEEwekl5bGNmelpwVkFH?=
 =?utf-8?B?NjJQWXM0QldGdEMvT0gxQ1NnWU9GTC9NZGNQYTBXMk14NlJHdzRqUjRTQWhs?=
 =?utf-8?B?Ty9KWWlONDlBc3psNzcxa1ljSC92d0tnSzUxSHhNaHdoZFZmV24xZzJxcmwx?=
 =?utf-8?B?QTRIdXo0aUlQV3pGNXVVZzU1OTR3bFB4blR3aXV0TFQrVG9UQkNZODVONS9r?=
 =?utf-8?B?dWZvampTS2tGUTNoVW5Vd0k5K25acUFHWEpSWDFSWDAydHdhdVR3WWVKcDVi?=
 =?utf-8?B?UW1yckpYblUxdHFnYSsxcDdERFJaQkplNDdqZXE5T0g5K2ZwZXpHaUc0VEFo?=
 =?utf-8?B?MWFYZnN6NFIxV2pWU1N0bXNRN0tNcHZadTlhREg0V0grSTBiRDE0VVRSYW9u?=
 =?utf-8?B?NTg5TkorbWNncTJ2WjQvMWZTc1kyZTBraFFmcEpOemFSQlcyNGxHdHFhcy9L?=
 =?utf-8?B?SjhQMlN5OThBWU5rT3cvb3VGZ3lrandEY0ZTWXRRSDJYRUZLS0hNdHdldUJv?=
 =?utf-8?B?OUJMR0VSUkF6dHNScjdlc21UQnFKakFUbHoydEE5NEV6Uy9iZFFuOW0yZGJh?=
 =?utf-8?B?ZlNBb0NpU3QvSU9OUW9TTUpMdnNXU1UranoycWQ3SDRRRnoycmxyb3FoNWMv?=
 =?utf-8?B?OXRoeWdCMmJkVVJPazZLYVVWWmpTVkJLWmhrOWFCL2svZk1PQ0Z5L3BvQ0VE?=
 =?utf-8?B?RU5IMEpNMnVmRUE0QTAyMzJWTjdUSnlLSHpRRXZJYXJOeXpEd24yRGtoSGJw?=
 =?utf-8?B?ZklnQXFmVFNEQmZmQmFlb09RVnRKMGkyTVJKMlRVL0NqY2R0MXE0bjkwQUZO?=
 =?utf-8?Q?t0bDyVSWcrA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWxxYVJzbzB4QmJtemRHQm9TeTZod0VMdUZWNkxtbFhsanI4QTh5ZkVEQ0g4?=
 =?utf-8?B?VmV2UklRZDZnTmRhZHh2SVhzN1lkbWlYbk9pOHpEbDV2dzJLcDdRcVZZczV2?=
 =?utf-8?B?Y3V4a0JxM0V6S0wrQ2JORjlGL2V1Y1lvNnJnVm9kZFpUVnhFOGpuT0JtbFlD?=
 =?utf-8?B?Y0J6ZkZPT3kvVVdFQ0JkZkRsQ2FNeEZEdVJ6TTgvYS92bm5QVXdjVE9oWG5E?=
 =?utf-8?B?djhDcHdXNTVRb3RZS0VDQUJxejJuMW9PZW5HaGoyY1Z1bEpjZjNXREhoTEJn?=
 =?utf-8?B?WkJMRkpyUVllUnllVE5BQlJkZ3Juc2pFTGVvNDM2d1NlQXhneWt6OE92a3B0?=
 =?utf-8?B?RVFLcWkrVk14bHFzMlZta25naWxuOE80OGJLUTBkV1ZxL082ME1uS0NGUVdq?=
 =?utf-8?B?NHhTdTlJc3N6QWRKZzVuNUN6V0FuODg1d1BzM3FnY1pRRG1FcFRTb01hMkhY?=
 =?utf-8?B?dTNyVis5NGM2NHYyQ1BraytoMDkvT2kyQi9qcXFzTk9JbTVkTnZHOFZPRE1M?=
 =?utf-8?B?MDNNNmY4aDdQUEdOcmdBTVB1SmEwOTV3M1YxeEJIdjdhanpzbVlyN1dDWWN6?=
 =?utf-8?B?dUVOY25QMVdrbGFNSmZRVGJ3NmVjQ1N2YW1QWm9lNmttZTlONVFEZlplcHor?=
 =?utf-8?B?SmVENDE3ZzVYTGdUOTM5c0FuT0l6dElsVWRMYWJOTUhWKy9IeEtjUXZhOTUz?=
 =?utf-8?B?Z1BaeDNKUzJacWtlUE9CT2NYRWtxSmUrV3Z0VkZISCs0QmxFS2hvdmdJNER5?=
 =?utf-8?B?ZkYyOGpqeVFoV3FuNmpBMklJMms1M1psRU0rOHkvNW1mRHlocUR0NmdXWUVM?=
 =?utf-8?B?M21iYjlsYThzcmZ4S2ZURUxzanB2cGtnTUNIaWs0UUZ0Y0ZiWnlUT0Y0bHFE?=
 =?utf-8?B?aUZjT1VpdWplNXk4NlJjOTBhR0dlMHkzd3dib0l4VTg1MmNRcjRZeTMxZk9r?=
 =?utf-8?B?SzRaeFR6dHpBbzRleWx0anR4RVlOTEJkT0ZIUlBUcXRPYkI2OFRYU25CLzBF?=
 =?utf-8?B?RklmNXJQK05OV1dxczU0MnUyVEtGYXpIaGR4Z2hsRDN2eTZuWmxFQUFmLzdq?=
 =?utf-8?B?SThraHExSSsvOXVxUmhYVUpGbmtBTUphRG01RWJ2QW9icmM1VjVXbyswS3lO?=
 =?utf-8?B?MU5LanhyTFg5R3FXRDVmNFBWMjlqSkR0dVhwekZHckJNa0M4Vm1ndG5IL1Zo?=
 =?utf-8?B?VTA2czQ5ak5PSWFUL001Z0lQUDBBdkhuWWFXTkhKbVNOYmN5eEJURmRoT2Fo?=
 =?utf-8?B?cDJIN0hEcUJTUjB1NDBGWlI3a1A2WTdoS1JqdFMxS0lkbVUrby9ENGFoN2p2?=
 =?utf-8?B?S1Q2NnQyM3RURS9Va3pUUlhLU1VzZ2x0UHFjTFcvbVBIUW1lUXJrY3hmY3Vl?=
 =?utf-8?B?Y1BvMlpMSndLNk5Uc1BENU5YbXZ4KzFhcUZiTXZXNlh2TGdTbzRMbFNtM2sx?=
 =?utf-8?B?Y1BXTTVUWTh3VEc2UHdFUVVsRHR2QVRuKzdCa3hVMDI0cHNpUHV4eDdnU0p1?=
 =?utf-8?B?Y1lPSGRPN3FTeVN4NndCODJweHVoWkpwMEQvZ1Bma1llRzhsdjg1M0NnRlQ5?=
 =?utf-8?B?OU03bDJ4SnlxNHphNDI2cHRUdU1Fc1BMa09hRUdVZTU1UWJ6STJPeVh3azNN?=
 =?utf-8?B?MlE2WXlrMWhjNEo4Zjl4VEJMbGdnV2NVU21rNEJjalMrWTB6OWhnR3RPaHFD?=
 =?utf-8?B?WEt5Qjd2Q1F4ZXVqeXdOaVN3MUo1Vm9CK1Nwb0pjcEhiYytSUGtKdnNyYW0r?=
 =?utf-8?B?UTk0VGdoZHQ3SjdmVy9SdzVseW1UNU9zZW9lMm1zSDNnM0ZVN1RBVUk4NWp2?=
 =?utf-8?B?cEVEMVJTSG5hMEVhR2JoRFJLc21YY2tmV1ZGKy8vR2FhNWZTTkVlS3kxUGlG?=
 =?utf-8?B?cUErVld3QWp3NVhQVTJ3bFNoOThKYUVhNkhreVJTeSs5akdWK3F0MkFHSDEw?=
 =?utf-8?B?YkJMc09kV2VwbjF4ZjFaQjFiSjhOQWUrZXNSNzFOSWtDKzNjY2N3WUt3R3l6?=
 =?utf-8?B?MXVBWlZqMWpqZ1NBc1JzNkxrWjhaU01uZjhoMjlPMDNGS2dnQ3ZhcWRIU1Zy?=
 =?utf-8?B?MmsxaEtBSzVpREM2R2VLanRUNjFZWm9TWWRWQ094TTNyQW9adnBNcXN5VndE?=
 =?utf-8?Q?0ALfvcepM6ljaLwGy9w6jwVdC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b681a2-5b62-4bcc-26da-08dd66bb7cf9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 07:55:59.9416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51YOe2Y88aJ+abEiS9O/QiOTqAuymRRUPbL5nwfhuEI4RmmK3cpKgHfmvl5IoxZ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7865
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

Am 18.03.25 um 20:22 schrieb Daniel Almeida:
> From: Asahi Lina <lina@asahilina.net>
>
> There doesn't seem to be a way for the Rust bindings to get a
> compile-time constant reference to drm_gem_shmem_vm_ops, so we need to
> duplicate that structure in Rust... this isn't nice...

Well "isn't nice" is an understatement. We can have that as a short term hack, but I don't think that this is a doable long term solution.

For this particular case here it most likely doesn't matter, but operation pointer structures are often used to identify a certain class of object.

So exporting the functions and then re-creating the constant operation pointer structure in Rust doesn't work in some cases.

Regards,
Christian.

>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 9 ++++++---
>  include/drm/drm_gem_shmem_helper.h     | 3 +++
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index ec89e9499f5f02a2a35713669bf649dd2abb9938..be310db5863871604f3502ad1f419937d4c20a84 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -535,7 +535,7 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
>  
> -static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
> +vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>  {
>  	struct vm_area_struct *vma = vmf->vma;
>  	struct drm_gem_object *obj = vma->vm_private_data;
> @@ -564,8 +564,9 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>  
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_fault);
>  
> -static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
> +void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
>  {
>  	struct drm_gem_object *obj = vma->vm_private_data;
>  	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> @@ -586,8 +587,9 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
>  
>  	drm_gem_vm_open(vma);
>  }
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_vm_open);
>  
> -static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
> +void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
>  {
>  	struct drm_gem_object *obj = vma->vm_private_data;
>  	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> @@ -598,6 +600,7 @@ static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
>  
>  	drm_gem_vm_close(vma);
>  }
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_vm_close);
>  
>  const struct vm_operations_struct drm_gem_shmem_vm_ops = {
>  	.fault = drm_gem_shmem_fault,
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index d22e3fb53631ab655748d7f6c628ffdb402f6324..b70d3cc35bd194e7cd718bee220408b5dda568bf 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -132,6 +132,9 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
>  			      struct drm_printer *p, unsigned int indent);
>  
>  extern const struct vm_operations_struct drm_gem_shmem_vm_ops;
> +vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf);
> +void drm_gem_shmem_vm_open(struct vm_area_struct *vma);
> +void drm_gem_shmem_vm_close(struct vm_area_struct *vma);
>  
>  /*
>   * GEM object functions
>

