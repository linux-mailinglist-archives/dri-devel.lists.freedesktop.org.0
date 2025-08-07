Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6277DB1D55C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 12:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E3210E7FD;
	Thu,  7 Aug 2025 10:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ou+dk48h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CDC10E7FD;
 Thu,  7 Aug 2025 10:03:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sIwa5Z0iLZ8AeBeLwqCNr3rD13RmvwdYn3c4KJLphjx1gMvG8OCDCRezN2yOgSndoaeYMjLkJM5B3Ppvq8EpxCXvy7eU91gzX5zjvjlUpJbwvJ1B0fiRQTjvRiBvq9D7m5j8JuzdT7KelR1sUyMyVIVxhvvGylVCFo3b0bMLBXzoOIvzc2jpMxRxW92x62nUcV2dnDkZZOxifIPST/2UM/Bonmc6UYJN4lUkc2N8C7k1cQ49ZSe9KheJ2eignhvQgnXkaIAF68qTRzjbfru8iMGnx9wSssTUsB0U5ntNndKR22SpmuUyjvZzLTUSvD4gmJBhuk7gwk/JeIZ7dO+GPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NjhkL/HPv9RLoAdfc0EFgeRpUGmPQPimqYC6lD4jpQ=;
 b=tbjav2E4iA+osmwAn0D8ICIpamkL/r7pyAWsVpbn3PUKZrpXAvPxNi/mtF/CKgaJ4xC61RWA+vhxl5LJSgXmNxhUUIoy4j7KnQDZpD9zKqgZuHh/q/EKawvIw/91aBJ4Pri14enAv+aqL39qevp9Z+KpY6NVogamRbyQb1DVcAvDqFdIblIxmiwsVpgGkq8tW9s0DJfKNxATPgrDGbHKbkCP6CiP0+aCXWKxOdrCvtouqnuDvT/XTIGFjdEy6Zo9zFM1irognnhuN9q7iTfRwkmODc4kY7SYQiRuhcmrM8QXP3661y8CatMJTwugX6oosHriNSL0uQ8M7Y+P9t3r/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NjhkL/HPv9RLoAdfc0EFgeRpUGmPQPimqYC6lD4jpQ=;
 b=ou+dk48hQDM/CZm/x4ZA5N2RBSS65rWzFQss7dlbhsn3rXU0QirBtrmO5Mg6EN+AnfBH2BgyXUNGVl9ZJgGKy90p+10YCjzckko1ZheflbGN1vU+WXZlxlJW3ukcZC72jjhd0eTfusrrmoGc5bWOAVRWWkU7tDk2msfbJvjPY+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6484.namprd12.prod.outlook.com (2603:10b6:208:3a7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Thu, 7 Aug
 2025 10:03:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8989.018; Thu, 7 Aug 2025
 10:03:27 +0000
Message-ID: <9a632900-4ebb-40af-8bf8-bf55f8e25c7b@amd.com>
Date: Thu, 7 Aug 2025 12:03:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: skip disabling audio when device is unplugged
To: oushixiong1025@163.com, Alex Deucher <alexander.deucher@amd.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Alexandre Demers <alexandre.f.demers@gmail.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
References: <20250807094719.56145-1-oushixiong1025@163.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250807094719.56145-1-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0402.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c748df9-a0ee-4dcf-c25b-08ddd599a796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qkt5cFZMYzBBcXhRY0sxMWEwVWFDa2doNHZyd0x3cndzTG1obUVCOFVqT04z?=
 =?utf-8?B?bUZ5c1VpekdtcFNTWG9nUDN1MWpHZHNTMXdvVVpWYnJNUkUxTjNxQVJpRldQ?=
 =?utf-8?B?UHE2cnFKbHB3VjRnNlVwNzJrV0V6dFRHY0JLd2tVUjRKZmhpQXM0anVZaTMz?=
 =?utf-8?B?T3M0YVZ3TjhSczBzNUlGY2gydTdxdUlvMW9XTXF5eTJjM0tuQU1aalFDRkZr?=
 =?utf-8?B?bkxScDhtQTlBYU9kaVJwZ05oUlVvejlQcE9GazZSYnhZUmRuNi9iL21EK2o0?=
 =?utf-8?B?VGRPaDkzQzNwNk9jeDg0VHJ1SUhXY3hwUDh4VTBXREJ5Q0FET2ZVbFFPYmdP?=
 =?utf-8?B?YldjbC9VRzZMaGF1Y0x5NFhzY2pBem1zd2d0dW5qQWhWOXVCdmFCS3NSenFh?=
 =?utf-8?B?YzFWWHBreVZoWHVuWG0rWTdEOG9IZU4wVlFiOHhzL3Q3QU9jM3hNRjV3ZXQy?=
 =?utf-8?B?ZXA3U3BLRDJWQUFiZDhicGpDRUE0L29zemhicW1waXcvbjdIMUxLKzNVaEhY?=
 =?utf-8?B?WG5oVGl4UEp3UVg0dExZUkt0ZVBXMEVWanVoSG5lamJEc3hsUW1XSVlHSFZ3?=
 =?utf-8?B?dDh1ekp4RWVzZG01YlhNS3Fmdk1TazZqMkNTUXExd08wR2dtYTd3SEZHelpO?=
 =?utf-8?B?QkdLVFpqY0lvTnhSQUF4Y08zbVovMW1sQ3ZGbDJadStCSis0NEpOQzljRk8z?=
 =?utf-8?B?U3ZJWFZWbTh1WFVXcEhZalFMZU5jT1prUmVBeXhKcUJYSmtJRWNwNldmNzZ6?=
 =?utf-8?B?MlpQaEROcTZqdTIyL3g3SGtoQnlMMmZMb1hXalJEenJKYWpRWlgwS2dGa3pq?=
 =?utf-8?B?TnVvS1pROVlLOHZSK3I4U3pPK3g0ZGlIR0tvZktYUGM3YTNRU3BWNzB3eGtK?=
 =?utf-8?B?ZlRPWHFOZ29ZUDk1ekkyRzMyRncrOGk2ZHRmZHRkb3lWYW95VitneUhuZ1hU?=
 =?utf-8?B?MFhEUmdXQXo0YWhGdkgrZ1FubDRoUWJFdzIra2tVWXRaYkRJRWlHQ0VGNE5a?=
 =?utf-8?B?dG9hc1dCZTJQU1RQd0xJcGZBZ2NWN3pua1FxTlgvMDhYTVdtU1VYWmcrTUxu?=
 =?utf-8?B?U3FvOWxaeSt2V0R6S3BZTWlHK0dsR0h0SzY5eTd1R01NTWxIQkNVWlE4d0g1?=
 =?utf-8?B?c0ZjRWdFMGlFSk5sNnErSXhZSC9PMVFYdmVCQ2ZqZkVMNUQ1U1k0VmJTRXJu?=
 =?utf-8?B?dEdaeVJaOWllMXNydjYwN01RWjdId3RRN3ZkY0tsZXVyOTY0bVFDaXF6ekNn?=
 =?utf-8?B?Vm9WZ1ZUc1drL1pCSVJRckZLYm9ZVjNtRm5RbEJTK0I0dlNBYWMvTTVhU3E2?=
 =?utf-8?B?ckZYTmE0YW1UTDFkek52RTdpbG44Lys4dHZ3cTB0Sm1nSzJDaVFHaTRScHc5?=
 =?utf-8?B?NERYQndYdndqb0FFY2t0SUhyTUFVNnVkenNCSkpKWnoyQ2w2ZXBEb1BGejBI?=
 =?utf-8?B?VUcvYXpubHNuMW5CMnlzTXhMT1FuZjBVeTVFQkc4bTA0djZZRTV1RWd6WEEx?=
 =?utf-8?B?a042YzI4b1IvQ3E0bmRQOU9BVHdPcTFxRmhkTFgvclZuaWhlS1RNcGtOVkJu?=
 =?utf-8?B?aThSRGZDamtnNk5oU2VoZGdFR24rUnkzNEo2akNHV0h4d0p4di81RUpTMVhI?=
 =?utf-8?B?cE55eXVTK0dDT1RoZXkvSGw3OHM0K0F2Qi9PYlFXUndRRWR5YVA2RG9NRWhM?=
 =?utf-8?B?S0lTSHJVb083dlBCbkczSCtSMUNCZ09LK1huckZlbHFiTVJoWWtGdnBEQzhL?=
 =?utf-8?B?Mjl0YjlYTjlIQldvcW9qOG90eFd4YWpBZTdZOVd0UStuSFJTTWVJZXJQbGFY?=
 =?utf-8?B?bGx6OGxjTG5DTVhYTjNHWHFnUFlNSnBPYkRicU80MjArdXdCbWNsZ1ZOYytZ?=
 =?utf-8?B?NGJicVRjOXlVemtjVjhkMURXekkrMWgreXZCNUkrZCtaZ3BqS0liNEZ2Mnc5?=
 =?utf-8?Q?1C56d6w0giY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTBKUVE5RmxaR3IvQlRGWDdKWllHc1FqeUFDQVN3dmErSHhDV0RmbG80NlAv?=
 =?utf-8?B?eTJwQmpVeklOQ3Rsc2xQSi8ySGd0Y3k4Vm9SRXQ2VUNlU0l0NHFHS1RBaGxk?=
 =?utf-8?B?SUpNUjlyMUNmY0Nua1ZIRy9xTG9qSXF3emlkTHdORSt5UmljenBrRDhyZGpv?=
 =?utf-8?B?Y3NBWitUT21vS0JDREVlNGVEdlg3cHJLTGtqMFJidHpjS0t0bHRBbDVKVXN2?=
 =?utf-8?B?UklzbDNIciszSW5JM01YdjdGU0pxM3pjUkRUSFFGWEk0d0h6NW5maGd0Wldl?=
 =?utf-8?B?ZnkrQk1STjZBUlpNRWppczN1OXkvc3pMbEl6THcxejZoc1lVb3l6RDFvUzNh?=
 =?utf-8?B?aHR4T0xvK3FOZ2FRaTJOc1V1bzUwdzJqQjdGVnVnNjFYaEo1NGtHK25FVDJq?=
 =?utf-8?B?WTBQZVRsaGFwZFl1NTNmTFlPYk82TWRvVHRoWDdaOGFkaE43SDIvZTYya1BP?=
 =?utf-8?B?YTFRUHBXMWhMVFh2b1JVRWgvQlh0RkZWcVBtMkxETzN2TmlhRDlVM3pIRVEw?=
 =?utf-8?B?NUNhQm55bDM0OHMxSzBUOFJPRjd3d3BaaHpxMDZnZmo1K01DY29yaDNDSk5I?=
 =?utf-8?B?QitRMEdhekVBMCtzcDM3WXpSOU1sYmVna1E4bDZNSWZmd1pBeTFRYXNteHdi?=
 =?utf-8?B?YUxWY0VNaExmL0lSck9KK2lKSTIxUEt1NjlLYndsdXRHYy9KNFdDeXVyRVp3?=
 =?utf-8?B?RmdTcjNxeVNkSUVFclNmZ3FRbUF4cllJL3ZxdmhOYmx5NEtQa3RnYWNNcitn?=
 =?utf-8?B?R2pwTU1nck5MYkxia3Raak9tdFhRSEFYUlJLbjg5OGt4cnpWWW9HNHZUOVFN?=
 =?utf-8?B?Z2labG5yTmh6RHQ3NHlwRW1JYUprZTRxZGwzWkNWazJ6Q1dHNFN6cFo4cWtx?=
 =?utf-8?B?L0srSDVnZFFPYjF0WERtNmdzN294N2k0aXhDKzNXdXMzREdHektRMTEyZ042?=
 =?utf-8?B?ZEd4ODZRVXBCYjNOaFVkZlE1dUtXKy9Fc2IzeTZnR3lLWkRBcGR4UVdSMTJm?=
 =?utf-8?B?Y0doSTF2RXZNN2tNa3FiK1E5Y0kyVU9qZkZ0MkJzTFgrZEcvY25KNFFhaTV2?=
 =?utf-8?B?T2FDOThPdDlqY0N1bmZ3bVd4ZlRwZFpSUXV0VVF3QnhHS0RETDJQZFRHYXcw?=
 =?utf-8?B?TnNsejAzcTZJNkNrNHFFV1NSZUtFZ1YrMGx1OWc5ZmZEZHJ3YXZjUXo3L3Nw?=
 =?utf-8?B?RDc4S3VYQUtGbFk5WDFrREJEZDhTR255dzY1a2pqTGlpS1hqR0VEbEQ5NUo4?=
 =?utf-8?B?cE5CSTlwQWI2ZnBzWUFSMTZ3d3U1RkozZ25GSnV2eisxRlI1NUMxdndoN1JR?=
 =?utf-8?B?M1pheHBVU3ZscEtkanNOeW8yNHdkbE1TRkx1Q2JLTi9VWE9URnl2WWdHMEVL?=
 =?utf-8?B?SmdWK1JwaSt1TFNhNGx5RHZROHVtNmJzckVmYnc0OXVWNHJpUnVsNkh2NThO?=
 =?utf-8?B?c0RDUjErTkRvSlFqUWN5UER6Vzl1ZGxTZEhFbVFSL1RuMVE4VGREVmpEOUZu?=
 =?utf-8?B?dmMzUHNnS3lHWnI5MXpWNnFMelpKVFpCWEI1WXhJbmFUMHk5VHVpd3ZkUis1?=
 =?utf-8?B?SjhyUG9ZSERlWVBtNTBFMDhLRG1tS1pMWWNUZnlhR0dmQVhsVTdOdCsvSDkz?=
 =?utf-8?B?aFRQcVBaOG04QW4vZHVpZWpMcDhqWC9XSlo2K3dHbDh1b0Z6bWk1b2xmN2NS?=
 =?utf-8?B?MUc3WXk4WldsMWhISGQ4M0ZSNkc4ckVJM0dKKy9BNVc5UXlsREllRnhjekx4?=
 =?utf-8?B?TzhVNlZXZ2lsWms1c3dvUlhNZXJXOXYrOFcwWDZpbk9Tcmk1RFp3bCtlOWJH?=
 =?utf-8?B?L1hZRDRqRStnUlpYUWtNdWZMMWNXbWI5cUgvWVFUU1duTzYwa1BoenFDSGVZ?=
 =?utf-8?B?bUlzdUxuR212a2ZJcWlDU3RmOWxqM0NrakU3bllkWjdzOUU4RDF4VVlQN1hG?=
 =?utf-8?B?WnVMVUZVRjNyZ0doZHFQUHdqQ3Iva2VlbkJrQjNsQnFDN3VvUWNndzRUc1Qw?=
 =?utf-8?B?R2ZSZ0xvekw3cFpHNEFVS3hYVjlvQ2ZNYW9ORkdYa2NVa1FITDVIUW5TUlkw?=
 =?utf-8?B?V1BxS3pHV0ZNK0RwNXZZU1lDRll3QUJwMS9UdWkrQ0IzdTBsT0FyTzZiQURH?=
 =?utf-8?Q?OI6vid1uY2epifa9gqoiRo4JH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c748df9-a0ee-4dcf-c25b-08ddd599a796
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 10:03:27.6282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSuJEnp4h15cg0Dzyird2iQOF3nBPi+umxU7Es70sTzGOf3NKUkIa+0Gr0Hx2ORx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6484
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

On 07.08.25 11:47, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
> 
> When Stopping lightdm and removing amdgpu driver are executed, the following
> error is triggered probably:
> 
> Unable to handle kernel paging request at virtual address 0000000000005e00
> .....
> [ 2] [T10084] Call trace:
> [ 2] [T10084]  amdgpu_device_wreg.part.0+0x58/0x110 [amdgpu]
> [ 2] [T10084]  amdgpu_device_wreg+0x20/0x38 [amdgpu]
> [ 2] [T10084]  dce_v6_0_audio_endpt_wreg+0x64/0xd8 [amdgpu]
> [ 2] [T10084]  dce_v6_0_sw_fini+0xa0/0x118 [amdgpu]
> [ 2] [T10084]  amdgpu_device_ip_fini.isra.0+0xdc/0x1e8 [amdgpu]
> [ 2] [T10084]  amdgpu_device_fini_sw+0x2c/0x220 [amdgpu]
> [ 2] [T10084]  amdgpu_driver_release_kms+0x20/0x40 [amdgpu]
> [ 2] [T10084]  devm_drm_dev_init_release+0x8c/0xc0 [drm]
> [ 2] [T10084]  devm_action_release+0x18/0x28
> [ 2] [T10084]  release_nodes+0x5c/0xc8
> [ 2] [T10084]  devres_release_all+0xa0/0x130
> [ 2] [T10084]  device_unbind_cleanup+0x1c/0x70
> [ 2] [T10084]  device_release_driver_internal+0x1e4/0x228
> [ 2] [T10084]  driver_detach+0x90/0x100
> [ 2] [T10084]  bus_remove_driver+0x74/0x100
> [ 2] [T10084]  driver_unregister+0x34/0x68
> [ 2] [T10084]  pci_unregister_driver+0x24/0x108
> [ 2] [T10084]  amdgpu_exit+0x1c/0x3270 [amdgpu]
> [ 2] [T10084]  __do_sys_delete_module.constprop.0+0x1d0/0x330
> [ 2] [T10084]  __arm64_sys_delete_module+0x18/0x28
> [ 2] [T10084]  invoke_syscall+0x4c/0x120
> [ 2] [T10084]  el0_svc_common.constprop.0+0xc4/0xf0
> [ 2] [T10084]  do_el0_svc+0x24/0x38
> [ 2] [T10084]  el0_svc+0x24/0x88
> [ 2] [T10084]  el0t_64_sync_handler+0x134/0x150
> [ 2] [T10084]  el0t_64_sync+0x14c/0x150
> [ 2] [T10084] Code: f9401bf7 f9453e60 8b150000 d50332bf (b9000016)
> [ 2] [T10084] ---[ end trace 0000000000000000 ]---
> 
> The adev->rmmio has been unmmaped in amdgpu_device_fini_hw().
> 
> So skip disabling audio when device is unplugged.
> 
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> index 276c025c4c03..48b29990da7f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -23,6 +23,7 @@
>  
>  #include <linux/pci.h>
>  
> +#include <drm/drm_drv.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_modeset_helper.h>
> @@ -1459,8 +1460,10 @@ static void dce_v6_0_audio_fini(struct amdgpu_device *adev)
>  	if (!adev->mode_info.audio.enabled)
>  		return;
>  
> -	for (i = 0; i < adev->mode_info.audio.num_pins; i++)
> -		dce_v6_0_audio_enable(adev, &adev->mode_info.audio.pin[i], false);
> +	if (!drm_dev_is_unplugged(adev_to_drm(adev))) {

Good catch, but that looks like a workaround for something done in the wrong place.

A *_sw_fini() function should not enable/disable HW.

Regards,
Christian.

> +		for (i = 0; i < adev->mode_info.audio.num_pins; i++)
> +			dce_v6_0_audio_enable(adev, &adev->mode_info.audio.pin[i], false);
> +	}
>  
>  	adev->mode_info.audio.enabled = false;
>  }

