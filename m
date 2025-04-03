Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E793EA79A6D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 05:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFF510E8F3;
	Thu,  3 Apr 2025 03:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rrCLHw0o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D72610E1FE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 03:28:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MioBFtvfYKCGjxQeD+1GXC/ngZv11zEZgay0ickxJJAGr4Vi6Ke1YUwshjwQWzYn9q35dZ/3SZjYMVBDj7fsaOuQ/8pjeG6KoDYOOkJszvgJfIG1bLRzbAuMnWaHnReSsnt2KIksTWzOZMS0w/qlEdkSNqvZR5AOCjUsmgC+MlxFvTAgjbdhYFW8LaRfxp/5Vr+f9ebp4Reu3Puno4IwYB75ZCz3kOBhriFhIvIsNZKCUbqZDdFcAjFZbCNvWM0UnAPgNpgvpAT/aucMXKpZV24u608JOtwnFJqNvNjtXDoRs2roVioMqt9zTKdOA6O0mezH0WVbmjaQWtTw1wHtPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mm8tX3WIPJcIJmlPEvXnxDqmosQy2E0TWxfup/fCYgM=;
 b=Kts6ubd33ld7+VJi2bwGe1XElXn9n/Dr3m2bkDdtHsEtQUpMcifRZIFLpwCi65ZzF6x25Xag0Jvp4cyTXS0kqTSyS5LamGE9nTdFLPZFGOe2cQsvC++3AcrrqeWTOflKZK86HwquUkpOlJkp4YwT12DMFzom1Ai/HTg0b7vao/LEojBmLRgEkpkGTJeAFZn6v6YHLA6zjrpQcvL/SlGIXNHfFzKd5/pOibewnlrL1tnTpOYy5Pbubo16jMT2RSf2XKk6cRqf6pUalady3bTyc37mKFLCqgA31EXVRHQ92PfePKLJKXY4jZvCHZQqxjpkDRTAfxUkZdzYFJqEHJmP5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mm8tX3WIPJcIJmlPEvXnxDqmosQy2E0TWxfup/fCYgM=;
 b=rrCLHw0oD9xbXuYLdHEzcUdSLx8IKBq5vmEjOqa02kLlc+YUEEBn2Pksv+J9H7zmTxFVODLW0OzniJTR0kql0wbMc5AtbUFRriA1m+A7pUPUfTIPsATzfT6WTe2a0+Ds5AhqvRku7SI6N+/iDtPnSauaiFY9zwXUxVF+AxRF5q4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by CYYPR12MB8923.namprd12.prod.outlook.com (2603:10b6:930:bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Thu, 3 Apr
 2025 03:28:53 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941%4]) with mapi id 15.20.8534.052; Thu, 3 Apr 2025
 03:28:52 +0000
Message-ID: <885bf81e-0aa4-4fe7-af81-a4a4485474b7@amd.com>
Date: Thu, 3 Apr 2025 11:28:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/virtio: implement userptr: add interval tree
To: Demi Marie Obenour <demiobenour@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250321080029.1715078-1-honglei1.huang@amd.com>
 <20250321080029.1715078-8-honglei1.huang@amd.com>
 <810789ec-c034-4bdd-961a-f49c67336e45@collabora.com>
 <6e796751-86f3-42e5-b0a6-3a3602d3af13@amd.com>
 <975582a3-313b-4989-aac2-c3b309ba55b6@collabora.com>
 <6fb21077-c254-49a7-97fd-64c87322ea43@gmail.com>
Content-Language: en-US
From: "Huang, Honglei1" <Honglei1.Huang@amd.com>
In-Reply-To: <6fb21077-c254-49a7-97fd-64c87322ea43@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0191.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::6) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|CYYPR12MB8923:EE_
X-MS-Office365-Filtering-Correlation-Id: ec349abe-3533-46ec-67b6-08dd725fa7da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1k4MCtmRnRaMGhUYW5RZWk1b294WUFjV3h0MUsyV00rcVJQT0NnTzRrSjc5?=
 =?utf-8?B?dGpVa2pJUURCSXJmZndzYWtyYkdoVEs2SUVKamVvbmFZdmFERXB0RzlIZzlW?=
 =?utf-8?B?YXpUekdIQStxSi9FZzFRUnZLZXUyVjVuVUJESDh4SDNxY0RQUjBTOFd4K3pu?=
 =?utf-8?B?MVhvTTNGM3NaNHhwdExic3k4K3hpMUhZcEs4MUhsMmdISHdiZVZ5ZFpjekl3?=
 =?utf-8?B?dXhlSG5ZdkRiL1dFVTJXeHhFL251NktqL1FXMHBYTnVhVnBIeXoxNi9nSWpI?=
 =?utf-8?B?N3ZpanEyWXd0RTRqaW9JaWFBT0ZUVmV5RG9mdXFZQUFwS1U2SmFXSldCcmhh?=
 =?utf-8?B?L3FmbDMyNVF5a0Mvd2FhQndoUnBQUWQrbENpcXlkL0pHNlNjTnJJb1hwdE0z?=
 =?utf-8?B?VXRjTGtQcHV1K1hlQ2RtZ0twY3I0NFUvckZNLzUxbTVmb0FDdUJMdHlYMjRa?=
 =?utf-8?B?SkxlRVg2aU1RK3h4TzB4eTRKcEMvajY1Uk02RmUvZkEydXRKbzF5OFE2L25E?=
 =?utf-8?B?akpLaTFrc296Y0dkM1o4WUJaTHR6Ti9ibC9kRTRpTVI4WVJYczNaRmNuVmxr?=
 =?utf-8?B?alRGY0FrT3RXUGNrZ3VsSHpSdWRIMnBLMHA4emhPalV0T1VPVTJDVHF2R3Ax?=
 =?utf-8?B?bGtKdyt3L0JsRzNFNkNIcTZnSDV1R29XdXQzN3ZVNXR0WklsMUhnZjYrR3Bl?=
 =?utf-8?B?Q3ZmbHYrNk40VFdPZDdDWTlQLy9WanFmYUQraHhxSnIxVmNCNGFldzhqb2Nh?=
 =?utf-8?B?R1RtWndxTElPenpwWjZ2eEZPVVpoMTZKYXFNNjVQMWVidTFPdDlReUVzejF6?=
 =?utf-8?B?aEptdHQ2QUtSUE4vUDNMeUlZSkwrWEJVdTVjbXkvekV1eC9PSjZUakhZcGxv?=
 =?utf-8?B?QjNaTEw3ajNEWlhMbldDN2ZiTzR4bS9NellUdzI0QStINTRqS0E5bEFrRFN4?=
 =?utf-8?B?OEJKZk9FVUtLYmdaTGRlUUJUQ25sQUNsdVh6Z1gwWU51VTBhWmVqUVlkN3Vh?=
 =?utf-8?B?WERiZHRvN2VJemwwZTJhV1ZpM2xtY3Bnc3VjRE1seTBUdzJweTVkZGV6ME9h?=
 =?utf-8?B?QU5rcVdGbWpzZUdZQ1JtdzRVRDRWWHR6WnMxRnVIYkEvMUZXQllSZ2g5U05Y?=
 =?utf-8?B?aW5QYmNXN3NkUlcwa0M1Z2hhTkRpUTFzcS82cTU4TlJnTHJNeTJWZ1dKVUly?=
 =?utf-8?B?T2J6cm9EZlE2cndHYU92VEg3M1o2YjUvL3ZaUXQ4TmpkanlrZEpTMzFYTjRy?=
 =?utf-8?B?Mm8vUUJqbVlkcjJtQmVFcC9kcHBWTThPZWVGUi9JLy92MkRhMVI2NTU1R2pz?=
 =?utf-8?B?UXo2azEycHNwem5EbjRvMnkzRzZsNFNNeUhHTmxyTk5qUktLL1lzN2lJTjJV?=
 =?utf-8?B?RTJCc1ZRUnpMcnZLR3pxYlZXUytZOUNzKzBhLzdTcjFPZEU3NXlaRE1mZmhO?=
 =?utf-8?B?Z01udDNwd2Z4TDJHcjBHY3NHZTZ0d09IcGZvdllWak9VTVA0NDNKMzVNUWpF?=
 =?utf-8?B?MlNNbCtjSTZwZlNIcDZEbE1qWk1RSjhIYzc0ZzdaQ3Rtbk11bFZ0a1lzZVp0?=
 =?utf-8?B?L1Qxc2d1aWVxZHd4UWlVcWlUQUpRK3VCWGpBL0Rjc2VzU1RjVCtqVEZwdElk?=
 =?utf-8?B?d3A2cytqVlc1TmlkWFVKbUsxQ1haTmhyTkplS3FESzNPaEVVYXJybStNUWdT?=
 =?utf-8?B?OXNJNTA2aVp6SzA2N1FKWDZnM21vK3AzVHRma2ZxM21TT1N3dTBkUG5SdkRN?=
 =?utf-8?B?ek9PLzd5RlJkZE5jQnJPeS9DL2tManRET3IzV0NUb29GYTRxOThkY1FXdmdh?=
 =?utf-8?B?WER6bXJCejNsVUFFRTEwNEsreFloSGZaQnhzdk0rV0RhUUpvOExLdHM3QmtZ?=
 =?utf-8?B?ZjNYNC9lTTFBbGxtelBDLzVuZmF3cXZDVlB6Vy9HZU12d0pyS0VRMzNKOUU0?=
 =?utf-8?Q?eb2vjh0pkCo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzZCQUxobGsxdW1yMURBV3NFZFB3akVONzhRSWZlc3NUUDI4UXpEMHV2WDJO?=
 =?utf-8?B?ODU3YW1YbXArL1I4MVpqZ3czVmhZQkJ2akRTME41QmxBY0NKTk44UWpQZHls?=
 =?utf-8?B?R2lJSmR3V1U2YTVDeUtoc1k0TjNuays4YVB4UHd6dTVoTzlENjIvb005SFdV?=
 =?utf-8?B?WWU5N1VTWkUwTm1DMkEvSm1vSEhvOVZkZzRtYTZKS1laUVRmSDA3ZVNJRmpO?=
 =?utf-8?B?aGVFd0hBQXQ1d09VL0lBMU5FcGdUMkpkeFZJSVo5MStZV3pVVVIwb1BiWU52?=
 =?utf-8?B?cXFZbGNISURhNi9FbkVSeE9Xd2lXVllkVmlSaDJscnhTcU9ramNsZkV1VlQy?=
 =?utf-8?B?Q2FieDllbThOUHV0OE55VHJQNGF2T0w3a1pRak9XYThNUW85QTBiVkZMbkdx?=
 =?utf-8?B?YzNXUkhqU1phcnlCc2VkL0ozRmJXSGo1eW0zSjBKdC90Qnk2K2lzODFadFlC?=
 =?utf-8?B?SHRkd1p0bTJ5QUhjTE0rMmZvK3FOemgrNHFMSkxWN1l0aC8wdjNvTzhPVUZD?=
 =?utf-8?B?ZGdQandWbDN3aDdqK1pocDFTYXJoYi9uV2ZtdmpNUmtJV0xPYTUxMEVzN3Jo?=
 =?utf-8?B?THFnS29LazF0aUI4d0JOcWlmRTllcFUzdkI2YjBzWGwvZ3c2M3B6K1IxeTZS?=
 =?utf-8?B?bHh1a0I1aGtNVjBkVGRRNVNoQ0hiektvRVhOME9yc2ZRMWdyclgzeUZjNUZq?=
 =?utf-8?B?U2NZQUg2NjhZNVdNc1MyUmVHUk1GRE5vNytlMnpycUVCNDNIbzllMzRDOVlp?=
 =?utf-8?B?QTBKOExKTEpGd2VDODY5L2VmSDVxTk1PZEl0andQbWwzZ1VCRGFuMmNURkJ1?=
 =?utf-8?B?VHRtWW13NDVTY3V5ZTYrWEZwQm1ONjh4M3B2aHEvUytQbVU1SWpxNE51WWV2?=
 =?utf-8?B?bit1ZWpWVDZSdUtNT01FaXc1Mm5lWFpnWHZWM1d0NnU4RmNiczEveFF1Rm5l?=
 =?utf-8?B?SzYrZncxNFNXaWN0MkpLNTFmYUFlR3M5cmRiZ2F6NGVVVmdDNGVFdTkxUUYr?=
 =?utf-8?B?YUhlZVdGNDJFRTlJT1pValpOQ25wQnI3MkpDQ2RSRVpoWFFCWkVDM01Vcnlw?=
 =?utf-8?B?OVViUEU4QkdtOUdGdTRna0pMNEpWU0cycEQxcFBKMHJyRnUrdDhhalhxTjdI?=
 =?utf-8?B?bEdTd0VpaU1ZRmdhNXlTdS9oWWdJdk9CNGRwRk9pUHFWcW1SOEZqQkdGSFY0?=
 =?utf-8?B?V2ZKN1ZVR3c0TWNkU3dxdGVuZ0FHVWpyUmoxQVh0elEvREE0SllDN0VYQUJQ?=
 =?utf-8?B?elBFWlZHdU9YRDB0ZGxpMWt0UStwZzNTdlB1U21lQXlGNjU2N2hHZXk4TGZM?=
 =?utf-8?B?NE5Rd3UybVdLemNtMEt0OEN3eG1KL0kvRm0xUmZYeFpoWmYzRDBZM1EyT05x?=
 =?utf-8?B?OVY2OThlQU5ZUk5EMUhNRENSUzZvbUdtajU5VU5nL3lTU3h3QU1hVTdjSnFz?=
 =?utf-8?B?Yk9kRTFPNVV2MnczLzVBY0Rrc05oaGdRSzVhTENQVUtYYTRpdm9UQmlhZHlS?=
 =?utf-8?B?ZC9MZ1RiQ2xpQUhhRm1ZU3kzWmZwajFFQklrazZ4amNQWnhORXpaUFBvMEhx?=
 =?utf-8?B?d091NEx6emx3a0JzREhEKzVndjhPY3d2RmRhRFZKb1BHYUNnV1c2OXV4clIx?=
 =?utf-8?B?a3MzdnBXOUlMNlo2U2ZBbCt3aG40b0xLYU5XbGk1YTlMWC9ZUzBOcjVPdDR0?=
 =?utf-8?B?UndMWmdEWjhoMWZJN3lGeVc3UmhBaytFbStHVi95YmpvbGpnUE1jUEJuc2NY?=
 =?utf-8?B?T0xtd3Fwc2tZajQyWmN5Wk53YU5GSVJsVVdQazhNM25jVkJYK3ZIZnRtSHZx?=
 =?utf-8?B?TWcvcUFVUVB6Wnc1YkZrTld2THBjWWFBejRwemh1bit2cFoyN2pPeGhYbXlZ?=
 =?utf-8?B?SWVva1gxbXdnY0tQU2J5bXNQKzlIMnVjK2dHSE12bDRPWEZLS3JBRGpBbzd6?=
 =?utf-8?B?WXdiNkhUdllkR3F0a09nTzRIeXVKRlVIWU1udXZrSjRFUmhCSHBUUU94K2Js?=
 =?utf-8?B?MFZINDZUOWtrRU5oc2s3QmFVUkkxWDA0UjArelZZL0RBVFBadGpzK0pwVDZC?=
 =?utf-8?B?K2xTRXRhR1hDb296MXFFM1BEVDhDRmdzUGVsSjZkREl1eDV1VnJXS1I1Lzl5?=
 =?utf-8?Q?tDs42EAjjj/kWIFTJ9h8b200c?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec349abe-3533-46ec-67b6-08dd725fa7da
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 03:28:52.3801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vm9TNnB+b4Ssn2dU5dB069u6JL9I4rvLkPBGh3q7fyPsZjPLHqSxD1FYY4GQRPeXXeWkHKNr1Xw3Io1H3KqfTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8923
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


Hi Dmitry:

Really sorry for missed this comment. Yes it can be done in UMD, 
actually the interval tree is used with the MMU notifier normally,
it is for preventing create same MMU notifier for overlapped areas.
Cause this version patch set doesn't have MMU notifier, removing 
interval tree is reasonable.

Hi Demi:
Adding interval tree can make virtio userptr has robust check, it can be 
done in UMD. And for AMD userptr driver, it is a SVM type driver, it has
both interval tree and MMU notifier but userptr memory is moveable in 
it. No interval tree for Intel i386, not sure about the Intel XE driver.

Maybe I can remove the interval tree in next version.


On 2025/4/3 2:45, Demi Marie Obenour wrote:
> On 4/2/25 8:34 AM, Dmitry Osipenko wrote:
>> On 4/2/25 04:53, Huang, Honglei1 wrote:
>>>
>>> On 2025/3/30 19:57, Dmitry Osipenko wrote:
>>>> If the purpose of this feature is to dedup usrptr BOs of a the single
>>>> process/application, can this can be done in userspace?
>>
>> I assume it can be done in userspace, don't see why it needs to be in
>> kernel.
> 
> The kernel definitely does not need to be responsible for deduplication,
> but is it safe to allow userspace to create overlapping BOs, especially
> ones that are partially but not entirely overlapping?  If the userspace
> libraries ~everyone will be using refuse to create such BOs, then
> overlapping BOs will be tested by ~nobody, and untested kernel code is
> a good place for security vulnerabilities to linger.
> 
> If there are no legitimate use-cases for overlapping BOs, I would treat
> attempts to create them as an errors and return -EINVAL, indicating that
> the userspace code attempting to create them is buggy.  Userspace can
> deduplicate the BOs itself if necessary.  Of course, there need to be
> tests for userspace attempting to create overlapping BOs, including
> attempting to do so concurrently from multiple threads.
> 
> That said, probably the most important part is consistency with userptr
> in other (non-virtio) drivers, such as Intel and AMD.  If they allow
> overlapping userptr BOs, then virtio should too; if they do not, then
> virtio should also forbid them.

