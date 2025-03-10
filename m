Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3000A59754
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 15:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD63110E0BB;
	Mon, 10 Mar 2025 14:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="x2eOePKx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3AA10E0BB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 14:17:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzTBMWmsN2z9nn/6zfe+7H2ow/39dAl0YztjyiuPclrM0gEd281n7mu6CudIq3wIE95DK8Sb76Fm4jSgV4X8Vw3FnWfinr6AhzvjpXckv3uECDSFT0uU/KoLP9zfUrwrWaz3EPSGshaW7Q0kpogxb6DMrgsZTZoNexC5w1atyFWdfrFKOereGovbGgYDop7uG+mo/zT1xij9Wjb5j4oh6+HNaiFo9vf0HKD2zNxqoaF8A33jniJ4Fo2Pn1G6ikpwqMvANgeWD0oJS7+WNUTRnyBRmw4oAdVQ3ByVpHlywaE0Kw4Up9sqZ5czslgqAHyRH2Qho5usgstz41KuPUY7XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKY89rEA+ribjh2lznT55aRaGNBigwic6eh6FaJU3tk=;
 b=kVdNc9waJ6NrHMZsPH3AxJIldHbwD5MVnoYqfy8tkm6cWJg0xH+wUOk4lFXvtnCQLI4GApQvZQXuxgJHPSCIiEIM9NUA3cDsTqRBKRZBV3X2ctmIdfTb1DLXU3PoHN/LRvQXFSEwIrnJyn5rL6iX6VfnN6gnPSZolEHFiZ4VWLQtBwDpnuyqUrxBJIeOd5iKcGd4xILvhCgK3Xh2lTGcQZpXaylaSZu7eBDNEQaXPu+yy+9jyEsrMgeTq/XYnLUQsWfjG1HkbSaaV9K2H/g+6/+6BikvEXHKgIwNu34E0SnDSi/ItLrqn8woKm6iexbzEqcCn9q29HIru4gbNOGQ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKY89rEA+ribjh2lznT55aRaGNBigwic6eh6FaJU3tk=;
 b=x2eOePKxxsPBXrk5Tm0memPPQC4GJfdFzIKW2NNnYBnkaFwG32/tmwR8rej+ob5wKnAXyXRq/Xbbhlmls2kfly3JfesVXcE+iX4G3wJ/ZKS8NQ3QjkhqLWGlDFsS/8ThOzK13aRLIY7Bp170676ew2F2XJcChcspCsSkL5yZRSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9430.namprd12.prod.outlook.com (2603:10b6:610:1cd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 14:17:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 14:17:06 +0000
Message-ID: <f5fdc666-dd72-4a4f-9270-b539a3179382@amd.com>
Date: Mon, 10 Mar 2025 15:16:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/12] dma: Enable dmem cgroup tracking
To: Maxime Ripard <mripard@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tomasz Figa <tfiga@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ben Woodard <woodard@redhat.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9430:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc24a74-b51b-4c53-7cd4-08dd5fde3cd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGxUQjNKRjhCOFBPdnc0dnVJcUZmNzZxNzNWR25jVXNuN2xWeXpsUStKZ2lw?=
 =?utf-8?B?czhQMWVSZ1FjaFE2d3M1Zmc0ajdtUmtSWlBreWFKY0I5dTFmNWVaZ0RQTHVY?=
 =?utf-8?B?QnZTSWRxT2V6VUlPOEF1UEFsZlpLYjNlZURzL0FzY3I4aFJNYjlXZFNPWXNk?=
 =?utf-8?B?ZFpMNTllMmxvdkw1WnlibUMxQ1dGOE1kWHBjTVVaeElxUk5OUS9JcmdiWm9B?=
 =?utf-8?B?aXdyajJ0WGN1eVY5U3M2RFF1OXVXQ24wYmVSR1NkRlNncE5lOTZFSUR1b3RS?=
 =?utf-8?B?WE1DRmhkVW1rSkxkcFBGRlZ6ZE50bURCTkdJeUtHSm9BdDJZME03RURjakFq?=
 =?utf-8?B?eDZGMkZPd2JBbHRQckFyMjliQ1Vvc0lZTk1aSmNpNzJDTkM1YlpHVjVpOENU?=
 =?utf-8?B?d1JDa1N5b3krY2wyQzhQWmlVbm5VRHFxODJYWXNvUk9RMUVvWTZLUllIYnBi?=
 =?utf-8?B?WmJFVHdmU3E5cjROOXNUM21PYTQ3eHZxcTFhdXlvQzZ1VE9mUld6TkRjSm5n?=
 =?utf-8?B?bkV1RTNaS2ZtZ3ZpMUl4MHA1STVtczVXNjBGaXllWWVSQVA3NG5hQUtBbFRE?=
 =?utf-8?B?ZWpjOTV6MGEwQmZ1RHYrNnpNeUxhbkVTallNYnBLR0sxUEtBWVhhYTNFZUJh?=
 =?utf-8?B?SDlRUWV5L3UwSDhPOGVya3NhMmRNVG40UG1UR0ZPdm9ZN001THh2UEdZdmFv?=
 =?utf-8?B?MFk1VVNkdWtJajJtcllmUGpuZTM5ckoxWThtMEVvMURpbHRSRHN5VnZuQlg5?=
 =?utf-8?B?UnBRNHdrMlFZOFdjN0hXWVUxdy9ka25aZGZvSVpTa1dYY2l2dFpLVzBYQ3Ru?=
 =?utf-8?B?dHZLWG05MFNGZnYzSE9MT1E0RTRkTFV6ZzRVemVTTmNlRkVNeXpFMzQ5REZK?=
 =?utf-8?B?NDhUVzZzY2EvZjkzbzB2RUlmYy9DL3NnS0FBVll5YWJEamF2R0JuRW5EUE5u?=
 =?utf-8?B?REgvSTl0d0xkOWx0NVl3bllqUWRoalVWN3hobkIrSllSeFBBalBFcDBVTm5W?=
 =?utf-8?B?VlhGa2ZiN21MclFYTFNCRzdRa0FMNThITFAwZDRsZUZHQ1lQMzlGaUVSZytT?=
 =?utf-8?B?U1VJYWVaNEJBbEIxSGpnclJDR243RlNMVVFzVWpFTGJqZXZBVDIzR0xsZFdX?=
 =?utf-8?B?VE9pM2ZHTTQ4NTBCeVZvUHVPMlF0M2FwTFdZdVpTaEs0aFRCemFIMjZjbXBR?=
 =?utf-8?B?TVFVMnRRcjdyakIzWkdPNlVNT2o0S3VPTGhLR20zQk1INEFJaEhwTmk4K0FG?=
 =?utf-8?B?aXJuS25XcGkvUDJpclJOM2h4cWNvRm1SaTJkY1Y3eUE4Vk5udFI4Q1V4blE1?=
 =?utf-8?B?K1dTbXJFUlFLTDRDMWd1R01SK0tVY3d5L0wzUzRiRitncDluVVZJdVgwUldK?=
 =?utf-8?B?TzJnOGxYMktzeDVmT1ROMGJkWVVSK0syU0NRRjQ5U1pNL0hCQ1dBZ2pxM1Fq?=
 =?utf-8?B?WXp6QUg0WHhPQWo4ejZ0Q0hwNnB1ZkxzQmhHS2pmc2pjOTFEWkFSbm1mTGpR?=
 =?utf-8?B?cnJEejh5dnRuOWh0aWpJYUVZS3JNeG5WSEVibEgwYTk2Z0c4dzRrQ1FXVlNR?=
 =?utf-8?B?VzlMYmk4ZXl1aUpnTTJGbndsOU1FeXg1OXVkSFNQRXpoNGVmZk0wdWtZUEtQ?=
 =?utf-8?B?UE9qWFh0cFVEZjFvMVJ6YnE2SnlWUnRXNkJuL3ZiK2d0d0NGK2JZaG5mQzkw?=
 =?utf-8?B?NXNhVHBqb29RK0VDNXQwREEzOXAwVG51c0hmeHRoZHRCZWRZUWNiRDZMbHE5?=
 =?utf-8?B?cmtXb0lpd0VxaEtza1Z1cWN6VzNkcjl3S3FUZFBDQUo2ZWNhelZvZ3J1Umc3?=
 =?utf-8?B?MzZMVWFNUThjZktwa0l1b0htbTc3akVxcHZFbHFSdVVHSjhqWnJsVGM4K3FK?=
 =?utf-8?B?dVEybE1tbktNK3JQb1NnR1o3RXE1anpEZktjUXgxZVNVQmxTTFJFeVNaY0VT?=
 =?utf-8?Q?jOJ4oGQMHnk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjQ1aFUxVGtTdkxJSmJHUHBiMXlHcXUvS01mTHR0anQ5R2xtWFhHMm9HVm1k?=
 =?utf-8?B?dHFIbExiaTRiVDJZRm5SU0xUY0lMVk5IMGhSbklPYmtDbWQ4RjI0YzBWZjd5?=
 =?utf-8?B?NENXdnB5VUFKM2h0OEYyV3hTTEVldkM1bzRuSmUyRm1HeEN6NzFmSENqNVQw?=
 =?utf-8?B?bE9LTFdxbm5Za3BUUzVtK2pZKytBSVROcGpTY3hjSlN0RHBHNWw1OW16TnA1?=
 =?utf-8?B?TVRlYmk0VWd1a2c1VU00V1RTZDcvb2ZNSDlvbUNzUGthMDFVeGdUZEx1cVRj?=
 =?utf-8?B?L0l2Y0pnUDRjOGtoazFmTmJHcGJ0em1QaWRleE9qYnR1NFVPbmhScXg1N1cx?=
 =?utf-8?B?eTNUdHZUS2lyUEtmNXhvc05jeVFCVk1pWUFvemFiRjQveTRTMVZTRzVEdnpp?=
 =?utf-8?B?a0J0UGIxTSt6SFVZMFJEUDU2OXJab3dBdTQ0WHpSOWpmbkplbEt5UXYrOFhv?=
 =?utf-8?B?Mlk2WHZ1Y01tS3VPajgxSHVBVUJ0c2dnWHhvRWpFc2NFQ1QyNFU3TUxPZitm?=
 =?utf-8?B?QmY5aG9Kb21McWpuQjNjSjQ4bUQ4S0VFZ2JMemdPWGliZU50UGlEY0lPUExr?=
 =?utf-8?B?eDRkVHg4MFVMZWpzRmNPOG5IUlI4dy9wTEdRcHRlU01MYnVGZjJGM0QxZUgz?=
 =?utf-8?B?UWxCdlQ0VWhDOHJEdklBWU9QUVZtc3JmanQ1MzJWQVpDK3F4M3BIVEw5M0Z6?=
 =?utf-8?B?OUFjWWttUHBjOUdjaTA5TE1qN3lWRmIrM2pxeHhrM25BNytEQmFXNFk3cnJl?=
 =?utf-8?B?NXJJMzB1c0c0WElRVk9XMERadVhoU040cUtDUDJaQ2d3dUsveHZ0aXkrczVQ?=
 =?utf-8?B?dUFmaVNIT0xSbTh3UGw2aTNTSUVHOFJaNUJDUjdUSWN1dmxCZ1daWi8wRnF4?=
 =?utf-8?B?c21MOWNhaFIxTFBzcGRyMXV5VFI4NStmMExvN2lzWEhZZW1jVGJnNlBSRlhU?=
 =?utf-8?B?ZHcwMlBxTmhlbE1UZ3dFZkJJb2Y3YVhWM2Erb3ZEVU1CMWd0ajBnUE9OQ1hl?=
 =?utf-8?B?eFNmVXZHcktpYUk0RW1LQWFvbk9YanNKRGRYUlZBbmtyZjRYSnlSZUdnd1Rx?=
 =?utf-8?B?Y1YzaEZXZzBnTmxxUFZzK05hd1pUNDhTQUdDREtMVDh1WUIzeFEyNHdwdGVz?=
 =?utf-8?B?NjFySXJjMTY3cTN0Qm9wa1lhdFZWcXdqTVRBVkZma0hHYUZWRzlaM0R6L3hZ?=
 =?utf-8?B?cEpnZVIwdUU0K2twN2RUUHVUcTcrZ2hnVEJjV1hWL25NbGpzallYbDlZYzU0?=
 =?utf-8?B?c3o0SGdxK1hmTDR1MnY3TmNubm1rQ0R0WThmZm9qSzlqdWl1UWN4UzNOYzJT?=
 =?utf-8?B?a0ZEOFh0T21Nenlna3RCRDdUM2dRRG5CdXdHTVUrdzhIRFlCZ29mYUlTWlpy?=
 =?utf-8?B?V2FXc3VFUjhwTTNJd2hCbXFLSjRtQ3Qzd0gzUGFnVnROOS9lamtMVkpXZGIz?=
 =?utf-8?B?d3VZKzlHZzNCVGlMekE2bm03dVJQRGs2OW5ON3JlU0t5cXYvRUlTYTlLR29F?=
 =?utf-8?B?dzEzYWV4KzYreld6V3ptbmE0bG9HZ0xPc01JRkZWZngzMHZuUmwrM3FLM0U4?=
 =?utf-8?B?TVh6OXVVS3RnRlNtZWJTRzNpcmFaaGlKOEhneUEvVForcE1RdVl3azI0U1pF?=
 =?utf-8?B?QTFKT2JkcFZlM2lpeFlTQy8xblpXMGRvVkVhT0JUd2x4UXdjdDdEMEt4TE1u?=
 =?utf-8?B?Qm56QVNjREltdC9YYlhZelF2RlpFc1J6MkZpa0UrclJzTWk1ejB4aDJWS3c4?=
 =?utf-8?B?M1dFZmVleUhXL3BjNnRyTWtTcEtsSkM4MXA0OHl6eVAxMVhwdWhkWlRDNURV?=
 =?utf-8?B?WFhNc0dpdVJibGR2QThVVlRMSmdTdTdzWU1FNW80bUFsNTBrWTBkWUx0Uno0?=
 =?utf-8?B?Q0xicHZ6RG4vbEMyNU9jRmViYTVtdGJBVlNSSDJoYWM5dTQ2UnRLZHllSmU0?=
 =?utf-8?B?QTdLY2xJeTM4RkkwYW9RdTRIc25ZNi9xUHNnbXYySHVHL0x4cmorM2JwenJp?=
 =?utf-8?B?bHBZZHBPbFlwU1IwMHVFV1JqMWpkbVZIWlhYSVlzanR0OS9Ed2xYSENCaEx5?=
 =?utf-8?B?MFJMTndNVWI1VGcrcTZDMnVvNENuS21DcWd2ai8wSVNZZ0dxSkNlbjZMamY5?=
 =?utf-8?Q?s56BNreoSzot9oboAA1c/OHNv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc24a74-b51b-4c53-7cd4-08dd5fde3cd2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 14:17:06.5622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mYk4IwgRz9z0HychzA2rKaQRSSjKCOnIjXbqeFv8HGJEC6zTmgpw9d6tvrLkrVLz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9430
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

[Adding Ben since we are currently in the middle of a discussion regarding exactly that problem]

Just for my understanding before I deep dive into the code: This uses a separate dmem cgroup and does not account against memcg, don't it?

Thanks,
Christian.

Am 10.03.25 um 13:06 schrieb Maxime Ripard:
> Hi,
>
> Here's preliminary work to enable dmem tracking for heavy users of DMA
> allocations on behalf of userspace: v4l2, DRM, and dma-buf heaps.
>
> It's not really meant for inclusion at the moment, because I really
> don't like it that much, and would like to discuss solutions on how to
> make it nicer.
>
> In particular, the dma dmem region accessors don't feel that great to
> me. It duplicates the logic to select the proper accessor in
> dma_alloc_attrs(), and it looks fragile and potentially buggy to me.
>
> One solution I tried is to do the accounting in dma_alloc_attrs()
> directly, depending on a flag being set, similar to what __GFP_ACCOUNT
> is doing.
>
> It didn't work because dmem initialises a state pointer when charging an
> allocation to a region, and expects that state pointer to be passed back
> when uncharging. Since dma_alloc_attrs() returns a void pointer to the
> allocated buffer, we need to put that state into a higher-level
> structure, such as drm_gem_object, or dma_buf.
>
> Since we can't share the region selection logic, we need to get the
> region through some other mean. Another thing I consider was to return
> the region as part of the allocated buffer (through struct page or
> folio), but those are lost across the calls and dma_alloc_attrs() will
> only get a void pointer. So that's not doable without some heavy
> rework, if it's a good idea at all.
>
> So yeah, I went for the dumbest possible solution with the accessors,
> hoping you could suggest a much smarter idea :)
>
> Thanks,
> Maxime
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Maxime Ripard (12):
>       cma: Register dmem region for each cma region
>       cma: Provide accessor to cma dmem region
>       dma: coherent: Register dmem region for each coherent region
>       dma: coherent: Provide accessor to dmem region
>       dma: contiguous: Provide accessor to dmem region
>       dma: direct: Provide accessor to dmem region
>       dma: Create default dmem region for DMA allocations
>       dma: Provide accessor to dmem region
>       dma-buf: Clear cgroup accounting on release
>       dma-buf: cma: Account for allocations in dmem cgroup
>       drm/gem: Add cgroup memory accounting
>       media: videobuf2: Track buffer allocations through the dmem cgroup
>
>  drivers/dma-buf/dma-buf.c                          |  7 ++++
>  drivers/dma-buf/heaps/cma_heap.c                   | 18 ++++++++--
>  drivers/gpu/drm/drm_gem.c                          |  5 +++
>  drivers/gpu/drm/drm_gem_dma_helper.c               |  6 ++++
>  .../media/common/videobuf2/videobuf2-dma-contig.c  | 19 +++++++++++
>  include/drm/drm_device.h                           |  1 +
>  include/drm/drm_gem.h                              |  2 ++
>  include/linux/cma.h                                |  9 +++++
>  include/linux/dma-buf.h                            |  5 +++
>  include/linux/dma-direct.h                         |  2 ++
>  include/linux/dma-map-ops.h                        | 32 ++++++++++++++++++
>  include/linux/dma-mapping.h                        | 11 ++++++
>  kernel/dma/coherent.c                              | 26 +++++++++++++++
>  kernel/dma/direct.c                                |  8 +++++
>  kernel/dma/mapping.c                               | 39 ++++++++++++++++++++++
>  mm/cma.c                                           | 21 +++++++++++-
>  mm/cma.h                                           |  3 ++
>  17 files changed, 211 insertions(+), 3 deletions(-)
> ---
> base-commit: 55a2aa61ba59c138bd956afe0376ec412a7004cf
> change-id: 20250307-dmem-cgroups-73febced0989
>
> Best regards,

