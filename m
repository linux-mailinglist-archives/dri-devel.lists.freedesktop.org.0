Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922E8AB97C8
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 10:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCA510E9F6;
	Fri, 16 May 2025 08:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LNyG/mH6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C2810E9F9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 08:36:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kO88bcHneD/w28DOD/9jVoGRu8iIFwDzGlWj8lW6mY+EEz9I/8PMenDhs5rQpiHgaCGtyKZezg1msmU8xTe+TgELnwOXWzsEu7qXlPNTqeDptaL6DvN8vPsvJBs163ZZu2VyWorf8BMEspzpchYZVSPTOtVglSGayoUyLszMTKbXyqsEEObqwwTWpDJ2nnI8oj65tTPDIb5NnjIkNqJS0aN5zwomYlyTVafxmXnY1Bq/uCVnmtJADtOp15OYIIIyEyS5AvRot2k+/jjBJDhn4YNSFdYrZwI+4fQDjm4dzl1O3riCR5jNVef5xSBU1ve4DuNqlW3cV7c410RkAgLXKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/cRNckzpJFd40AMTLZEfNweRtQ1ySIqGKLG4b7Mr9k=;
 b=OkRff4pRYMRrDxOYHbiukQMihtsqHFNl4lmOR5LEiI15TFOF/2ZAPXww9C5/nTcLAOOT4hUSe7RWdvYLYnCp195PMKZWLJpEcO+sccnbpXpN9myYgul0MADO888pj3ZEqcmkYs5Q9tmCkTzi/ks2tdErgUY2tkYqGp6u7zU6fsYSS8YgyJxf0yNSHldAp0rhC3pWmQRAHxgGVJt2/IXM6taRkRNOINt001O4uL/TVPx6UgTw5TfCUPdELlcGr2Q5hSqfjwcPMpq36mbjaGDjUQHlhHDyXodhbHp9woeyV0R0hylM+NRhBjtoxlqJnqDihwyL7Mo22mqJ8mJFo7XY+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/cRNckzpJFd40AMTLZEfNweRtQ1ySIqGKLG4b7Mr9k=;
 b=LNyG/mH6/1KsgYXl6uijfm/HKsfhe8st/kPJ489JS8gvQ/ty5JmDJbzv5DNvpbCmFjs9CkY33Gtsg7bG5wpA6vC/0XydVS1lUqtyAAE6vslhdgmIxiEWpIcqToOvQqAiKpou9t2nfMlAlVlWfjn9IAsHmZS6/ErFWIypXTEzwZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7596.namprd12.prod.outlook.com (2603:10b6:610:14b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 08:36:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 08:36:17 +0000
Message-ID: <5c11b50c-2e36-4fd5-943c-086f55adffa8@amd.com>
Date: Fri, 16 May 2025 10:36:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for
 system_heap
To: wangtao <tao.wangtao@honor.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "tjmercier@google.com" <tjmercier@google.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wangbintian(BintianWang)" <bintian.wang@honor.com>,
 yipengxiang <yipengxiang@honor.com>, liulu 00013167 <liulu.liu@honor.com>,
 hanfeng 00012985 <feng.han@honor.com>
References: <20250513092803.2096-1-tao.wangtao@honor.com>
 <fdc8f0a2-5b2f-4898-8090-0d7b888c15d8@amd.com>
 <5b68b2a50d48444b93d97f5d342f37c8@honor.com>
 <ef978301-6a63-451d-9ae6-171968b26a55@amd.com>
 <9f732ac8b90e4e819e0a6a5511ac3f6d@honor.com>
 <50092362-4644-4e47-9c63-fc82ba24e516@amd.com>
 <2755aae2f1674b239569bf1acad765dc@honor.com>
 <2487bad4-81d6-4ea2-96a7-a6ac741c9d9c@amd.com>
 <a3f57102bc6e4588bc7659485feadbc1@honor.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a3f57102bc6e4588bc7659485feadbc1@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0200.namprd13.prod.outlook.com
 (2603:10b6:208:2be::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: f130d784-1e91-4827-5acf-08dd9454b9e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzR0UEpLZUNaWGgzRk12Z3JPcnhYRnNlTk5VelVGVmpFTDY1cytnOWxZTy9q?=
 =?utf-8?B?cW9DZ1FLSkJLRkdmcjJuL1JxWVluMmZiWmJ6dHYzSWJJaFZIUCs5UDhzZWYx?=
 =?utf-8?B?OGhFeEVwYUZXamdVVjFYS3ZNQ1BWcXNSYVJFbERnbGsyMFhTa29yMEgyMEc1?=
 =?utf-8?B?VGllQnpnSDhyUUZnTG9oU3BUZDBGL2hHc3VqU2Y5QXhyZTNrQnRPaHhYOVkx?=
 =?utf-8?B?aTdQR25jUWdkRmxwdE4rVDIzYWx2YWVYOUU3dnozRXNiRzc5NWJnaXI2MGhY?=
 =?utf-8?B?MHR3aHVBanhLUncrMmpleWVhY1RlNFRTUjRHZU4rT1FHZHlVTHA1YzJsTk44?=
 =?utf-8?B?YmZwV1I1b2pVa29maG1BN0lCSjhZV2RwbUJlMkJ1aFBWb3QvbkhxVnR4Sm5z?=
 =?utf-8?B?eWloMmc4Y0VXcFJHUll3c3V2YWJSWTVoYXNVWVFTV1VlTjRvL21uQ0g5bjJC?=
 =?utf-8?B?Q1JRanVxUlhpUXFsMHI1c0hlR29vcGc3bzY2djhNZVY3T3V5eFoydTlROGh2?=
 =?utf-8?B?QkdzQnpTamdpVU5OUEZ3MWw1YkwwTDNrMkVZL0hXU3V3cEN3YlRPMGRtZUs1?=
 =?utf-8?B?d0w3WjlMRndmMC95aytFc1NMc0R6NDZrRURpRDBiTHNUNDdjTGs2M0dkbmpU?=
 =?utf-8?B?NitHeUJLang2dmFLdThhMHl6MkQwTnVJRndNSzZJVW9DdjFYdTVsMG5NQ0Rs?=
 =?utf-8?B?V2ZaUml5QXEwUGsrVkpEaWsvYllrdEtMdTFLTWNZK1krQkJVb21xYU1mbUVX?=
 =?utf-8?B?Vld0bEhBdUpvR1QyMXFjYkVUTWFzYXNwK1BpcmF1ZXpiUTRXbjgvMVljK0Fu?=
 =?utf-8?B?NS9qN29qaENvRUFZQXdONjg1VlBETnFmbGt0MlJFZGVvdm82Rm5ESWEvd2hs?=
 =?utf-8?B?eGcwb29tNlJ6bmpKa2d2MWpTWkdWTm1KdXN2b2dTQzBXdEs0MEZjRHN0M1A4?=
 =?utf-8?B?Ymhlc1pxM2F2RnJTWFh1bkVLb00yekJ6UkpOTE1mT1cyUXVtZ2FqclUwUUw3?=
 =?utf-8?B?VFJQVkZLcUpOMm1rcytPVTV1MWZ4SU5ieDVEcmhsSlBJQlI2dUphY0VsZm9O?=
 =?utf-8?B?c056NjJIN3NhL1Y2Tkx2emFGU051QXYvTHhFRUNoNVR4Um8rRHliS1UxeXBa?=
 =?utf-8?B?a2lhMElZOXdQRXRYdVBkMXl2WE5OQWVXUEYxZ255elkvNGEvVTJGWDNma2lB?=
 =?utf-8?B?M2xpbXdaNDV4MFNSdEdFZGlEbmh0anNBK0I4TlZJU1ViZERGMERlK1V1VFVH?=
 =?utf-8?B?V1A4TEZCUnZLRjhwUW1JT0hLbEszTTJQYms4eHllU1ZvR0VyeHBDYVc2Tm96?=
 =?utf-8?B?Z1NiSlAwRURyVk5JTks0MmQyQ2U4ZVI5bTBPcjBwOE1QSlhvUDdDalR4RWRD?=
 =?utf-8?B?RHBWWGx1QUlhdjdrbmVtenNDc1Z0Y01ncUhJd0NHWUxVNmhqZXpDQkM2MDUy?=
 =?utf-8?B?cW5qN3JJVFl6QytSb3BSZ055UDVGaHdPR09MeTVKdzJyRkU1WnZDTHZQVlJy?=
 =?utf-8?B?MlhReGUvbTdrMGkreDI1TFhuQis3dFBWMVFuU3kxWW5kMkJhUmdzc1pNb2lL?=
 =?utf-8?B?SzZKb21xVWIwRUlPcGZIdGhUT1krdy9xNmEzTEUrT3R3V0ZOcTdYMkdVUzJX?=
 =?utf-8?B?RW1jSFFXMytsdkkvUzJ2ajlETzM4eGgzY2U0dXo4NjZPUlBWZTM5YWFabEgy?=
 =?utf-8?B?Sy9BMFpONktMSHdka1g5UzJYQnJ1cnQwTDFvVHAxcm5mYys5dHN0MFZ6S3Nm?=
 =?utf-8?B?bTZGY1hicXBCNzRhMmxKd0ZMNjBUVHZ3M0QzSnJ0V1FSWkpoenJIdzZ1dkZJ?=
 =?utf-8?B?M3NBUjFjS0xHYjAzaEVSUzI1L04vZ091eFh5UUtaTTBvNmFHcHN5cGF2cDdB?=
 =?utf-8?B?YkFRRkRHd3ZpakZSaUZLdFRVa2hGTmE2K01uSEZzWHV0K1hFTktKTXd6d2FW?=
 =?utf-8?Q?/+So//fcDyo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0dsd3ZHM0hhVlpDZXVObG15TjM4VU5lYnV4ZHBINjBmVzIwUWVyanp2NVBN?=
 =?utf-8?B?cTBpYVVWcFc0SU9Kd2RpMEt4YTZ6d1h6SkIydjZNZWdYeVhHeUtUU2wrYmdY?=
 =?utf-8?B?Sy9lNU40MEhFUmdvSUt4azJmTHdsMURRWmNNb1FLU1NVdUF3bmErRFlGVFhW?=
 =?utf-8?B?bTh3S0F4dGlwWDJHUWtTby92VnhPZS82YTBmSzVYWjluZzZoM2d5ZkVDNXdU?=
 =?utf-8?B?WGJvUllpVzdtYkdmdzVtbFU2eFVMMENpaFV0WkpOcUd0WWE2UXdkZzY1Ullr?=
 =?utf-8?B?b1FRa05RSlZialNTbzVNa1VTc012R1dkMjdiNk1FY04zZ1VVMDZwU1JYamtB?=
 =?utf-8?B?MWlLei9pRjNlSC9NSUdhU2V6eUh1MWhaRmdUbHExeVNlcHR0SDhHWitvQ3pv?=
 =?utf-8?B?U1QzVnpaczJFd20zWTlIWjRaa0JlN2VRSm9UY2NuL2NTSVZpZmkvNis0aldi?=
 =?utf-8?B?UkY4RUJjNVVLc01yYXZvZ1hKanFMV1V6OENGR21CUGQyclRDZ254TFYxcy80?=
 =?utf-8?B?eUdjakYyQUIrODlncEZsRlRNZ2crVkhNcGN0Z283MWRxcmd1RmJzNWl4V1Vm?=
 =?utf-8?B?MVFKNlZVbGNURS9nSERLaDMwMDBsQmFXNWhaMGJQUk5wZE40a0ZWQ0c3a0hI?=
 =?utf-8?B?djQ5RHVkK1ZUYzB2R3hwTjA0MkNuQkNXdkoxNlV0YmpZbFpScXlvSThVM1hr?=
 =?utf-8?B?Uy9xQzlld1hpUS9BcnVXSDQ4L3FoSFpIYVlIcElZem0vbU83Z28yamhBRGNI?=
 =?utf-8?B?M1NsT2w2aWd0THZnMWJBemEvTURVUXhJT3Q2L0J5TUZ0RXpTZnY1Q1IxaTZ5?=
 =?utf-8?B?ck1HRE1rUFBRWlp2ZGwvWHNncFdsNnNRcTNVOHJsTWNiWkQ5emNZN3d4VUJw?=
 =?utf-8?B?NS9PQnUwL3FPdzI5aXNkTjBIeTNITytlZS80WUc4Q2VQdm5uYUxjUjBJZ3hw?=
 =?utf-8?B?c3RqUkZNc2t4b0cvYmNBbTBiOEhlY3pid3cwRUJvc3AzRWxDcjM2RHRzVG9n?=
 =?utf-8?B?M0VKcTZsSkNycnNoM0w2Z2pkdnYwN0tzL1lUUk9FT0o1SWgwa2I4ZGMraUJS?=
 =?utf-8?B?S25hRkRUQUdvNlFpS3V3eS9Bc2dXZDJvMnZNUlpCNmkxZU1MNTIxQ0NRQ3R6?=
 =?utf-8?B?R2RrVkNvMXJCdmNuSWozWEtHREczbUNTZHk0c1hqRVhRaFpuS1VoSGpxdlp3?=
 =?utf-8?B?dzg0UEpFUTJUczYwMTg0VXZHV1pwcGl0UlU1N2Q5cG8wNFNZcWxSdjdvZThm?=
 =?utf-8?B?dGR1Y0ZjNGZMMU9HaGF3RUxqM0h1WGcycXhFTi9pKzUrV1hkczdHRjA0d2o0?=
 =?utf-8?B?UDhDeXVXSkp3TjczbStDU3JrUzNrOUxRR2wzMlRLckNjYTk5TzUzMmhXa1ZW?=
 =?utf-8?B?RVF3My90d3U2TUEweVpjTldBdFhXUXRreExJK3Z4RDJabVZxR25OcDZtNlBR?=
 =?utf-8?B?OXd0OEJyTSs3OTQrakJzTWI2T1UxbjRwNkNwLy9KRHA3MzFXTWhFanlDaUNx?=
 =?utf-8?B?ZVVYa3YvRFluWEdhTlNVMk54dDlLUm1LZG01S1lLVlJlMXdWL2pVbm1CNW52?=
 =?utf-8?B?Tis3ZXJLYjZ3RUNCY2JrbjIzT0FqZGt1UVB2c1dWZjlvRGV0bXdPL3R1TlVB?=
 =?utf-8?B?MVcrK1BxS3JLSmNLU0ZpbWdWWnIvQmhGOWlhc3MxeGVmY3A1SHRJMzFaQnR4?=
 =?utf-8?B?NTJ4aUN2SFY4TThwNDZLVU1sdDZ3dUhVSFNsMWRMcjZQNDZldGdncTZnYnFH?=
 =?utf-8?B?YXJUMjlXT1lHKzFob1BXZnVMbnJpa25OQ084L1hmWXhla2hHR0UyQXkvOHI5?=
 =?utf-8?B?V0w4bG9XMS9iSTJjV2RmN2xJNG9FdHFmRWVta2RDYXVaVHBQRHRTalBsSjlm?=
 =?utf-8?B?RDNDcHcrM0VjcWRwMy96NCs3K1N2QlkwTDU1VEMreDNKSXg5Rm9sMDlIdVgx?=
 =?utf-8?B?enk0VGpTZVhUUHZOdlh4clBWK1BkcTNpYmdhK3Z5dWFYZVlJL1pXL1QyZHZB?=
 =?utf-8?B?M1lFOTFvbElVWDhNUmhqU2VnSnh3ZGYvekExZG9DaytKZ09EOHZmTVA0Rldt?=
 =?utf-8?B?Rk0wbzVBK2hiTGhmdThNbmtDWUk2d1E2Z2JtbDdZcXloQVh0dUdzOW1hMVRL?=
 =?utf-8?Q?rooByNgDMOf8HTvCqkjBDAbBd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f130d784-1e91-4827-5acf-08dd9454b9e4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 08:36:17.5463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rbVl6POnh5jYjT/7jYo4vPpWbG3fIT9GeOEjzHbB7U63sfANNtjNHWPp2oEgu8Ev
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7596
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

On 5/16/25 09:40, wangtao wrote:
> 
> 
>> -----Original Message-----
>> From: Christian König <christian.koenig@amd.com>
>> Sent: Thursday, May 15, 2025 10:26 PM
>> To: wangtao <tao.wangtao@honor.com>; sumit.semwal@linaro.org;
>> benjamin.gaignard@collabora.com; Brian.Starkey@arm.com;
>> jstultz@google.com; tjmercier@google.com
>> Cc: linux-media@vger.kernel.org; dri-devel@lists.freedesktop.org; linaro-
>> mm-sig@lists.linaro.org; linux-kernel@vger.kernel.org;
>> wangbintian(BintianWang) <bintian.wang@honor.com>; yipengxiang
>> <yipengxiang@honor.com>; liulu 00013167 <liulu.liu@honor.com>; hanfeng
>> 00012985 <feng.han@honor.com>
>> Subject: Re: [PATCH 2/2] dmabuf/heaps: implement
>> DMA_BUF_IOCTL_RW_FILE for system_heap
>>
>> On 5/15/25 16:03, wangtao wrote:
>>> [wangtao] My Test Configuration (CPU 1GHz, 5-test average):
>>> Allocation: 32x32MB buffer creation
>>> - dmabuf 53ms vs. udmabuf 694ms (10X slower)
>>> - Note: shmem shows excessive allocation time
>>
>> Yeah, that is something already noted by others as well. But that is
>> orthogonal.
>>
>>>
>>> Read 1024MB File:
>>> - dmabuf direct 326ms vs. udmabuf direct 461ms (40% slower)
>>> - Note: pin_user_pages_fast consumes majority CPU cycles
>>>
>>> Key function call timing: See details below.
>>
>> Those aren't valid, you are comparing different functionalities here.
>>
>> Please try using udmabuf with sendfile() as confirmed to be working by T.J.
> [wangtao] Using buffer IO with dmabuf file read/write requires one memory copy.
> Direct IO removes this copy to enable zero-copy. The sendfile system call
> reduces memory copies from two (read/write) to one. However, with udmabuf,
> sendfile still keeps at least one copy, failing zero-copy.


Then please work on fixing this.

Regards,
Christian.


> 
> If udmabuf sendfile uses buffer IO (file page cache), read latency matches
> dmabuf buffer read, but allocation time is much longer.
> With Direct IO, the default 16-page pipe size makes it slower than buffer IO.
> 
> Test data shows:
> udmabuf direct read is much faster than udmabuf sendfile.
> dmabuf direct read outperforms udmabuf direct read by a large margin.
> 
> Issue: After udmabuf is mapped via map_dma_buf, apps using memfd or
> udmabuf for Direct IO might cause errors, but there are no safeguards to
> prevent this.
> 
> Allocate 32x32MB buffer and read 1024 MB file Test:
> Metric                 | alloc (ms) | read (ms) | total (ms)
> -----------------------|------------|-----------|-----------
> udmabuf buffer read    | 539        | 2017      | 2555
> udmabuf direct read    | 522        | 658       | 1179
> udmabuf buffer sendfile| 505        | 1040      | 1546
> udmabuf direct sendfile| 510        | 2269      | 2780
> dmabuf buffer read     | 51         | 1068      | 1118
> dmabuf direct read     | 52         | 297       | 349
> 
> udmabuf sendfile test steps:
> 1. Open data file(1024MB), get back_fd
> 2. Create memfd(32MB) # Loop steps 2-6
> 3. Allocate udmabuf with memfd
> 4. Call sendfile(memfd, back_fd)
> 5. Close memfd after sendfile
> 6. Close udmabuf
> 7. Close back_fd
> 
>>
>> Regards,
>> Christian.
> 

