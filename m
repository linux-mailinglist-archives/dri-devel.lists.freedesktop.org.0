Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725A79A9B60
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 09:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C28210E5F5;
	Tue, 22 Oct 2024 07:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="x0o6GHVL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7825D10E2F8;
 Tue, 22 Oct 2024 07:43:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZuHqif62enhNkZlTHu/kise58FkEZRc8PZRBDGwiKNuGoPQSSrbSXoOKd1V4JmbAV0JUzfRmkthIHyyS/5kDMxjMIhQ5N9tEso4623Rf5T3szz/RcaBpsmN/47QmoncTTOw7p3ywhwzXm5kEAYRj9hOFWZkb4KaNyqW2XckE4LtfBALNsrKLhJEc1gFtuaoGYpqpAfYo0cHui6sN1CgzfVEzTrkTPaQ1LuwK+WJvm/lcs93ruwqIcFenLGmxYRDK3jVkyjhK/mmVWZ7XhDalWNt5eYxxOo+BLBfBe9sbgbTmGmkw5OVUJ+vXB9CY6k/NoohOsAD/U81vRm4UDP82qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=um0j1PLZ1pN9G9TTpXCPj4SPfUCUhk0K+IEYJ4VCmb8=;
 b=rlInEePzYqp9nR83f+Ycd2evhv2mj/Km/jIUJG9iX7arQFeHABfjmm8MlgVlpJwEGu8ZO5waSQ8XvU7yPhzMHDpGYI7r4Qzp/37GDIxCDPfaewt82X0KzEC5PnErfP53Ba0zTGg3qWOFCe21GMqZDwbm1e2F54Mk9SVzqBXr+moEbliOEgPdZKgYwak4dcXpGeLdxwDxzUN2H3UwvYDC/3ut+DmTdFRLqTcA56N3xvwMF4ixVuk2reEw9EglOlQPPs53ar5Cn8ppdfsrtkC6a68zKUOi9BfQ9IaDToBBF6r2yFbxszXohUteOIdTDZ77jFnCY7xZvsYGpu3TV6AX6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=um0j1PLZ1pN9G9TTpXCPj4SPfUCUhk0K+IEYJ4VCmb8=;
 b=x0o6GHVLJcIrGl05BHhQwxSG24jkMiJ/e04kmqvzLOwGSa3uw07KQZoWuoT7o1JJMe2taTl/Qo4F/4xExInT+87wSz6pt3nw7By4wx2RfuQ6Zpbb5xiLurD/mHtDVpPjpILun7PRXav4/svgs96BrP/V4prl4EviQ9UBxt5Hwec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7689.namprd12.prod.outlook.com (2603:10b6:610:14d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 07:43:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 07:43:29 +0000
Message-ID: <1057097f-02f4-4f0f-9ac5-37aa84570b47@amd.com>
Date: Tue, 22 Oct 2024 09:43:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drm/amdgpu: track bo memory stats at runtime
To: Yunxiang Li <Yunxiang.Li@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alexander.Deucher@amd.com, tvrtko.ursulin@igalia.com
References: <20241018133308.889-1-Yunxiang.Li@amd.com>
 <20241018133308.889-5-Yunxiang.Li@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241018133308.889-5-Yunxiang.Li@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0361.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: 05835946-6e43-4054-5049-08dcf26d3886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWZrUGhxNW0rSTg4QjVtUUgwWDdSdjdkM096cEZtN3RVamd6VEluM3NqdGNn?=
 =?utf-8?B?UkpQbS9nY3BsS2lVOWsvdHNDNEJRcXdCV0ZKR2JLelcyOERZQ3NSTExSV1RG?=
 =?utf-8?B?V25LT3N1SGFPQlYyaHorQnk3ZHpMNUxnQ2FwTkpmRjlKUE5JNzVrLzF5ZFV3?=
 =?utf-8?B?NDRTUFIyM1hVcEpFOXZvZnJpejhJT3BXR3ZxQnh0R2NmOXJkc0hJZWVXVSs0?=
 =?utf-8?B?UitrVEwybzZ5K1pQZmFVQjArWll1TkYyN0c0QXplbzdCR2kzR2xGcjhIb1M2?=
 =?utf-8?B?b2w3UkxCUUNuOWZ3WjNzdzZ4TjNCVE9JT01xemx4N1B4R0E5eHdJSjRDMnAv?=
 =?utf-8?B?bzJoamNVTE5zelFPekx4ZWRnc3orME1IN1JIelVGc3RzMWtBZzJGaS9FSVYx?=
 =?utf-8?B?Rk5oSm9pTzEvTUY5aUkxUndKL1VCdUlTa0xMYlpNZ25wVXNyVmNiRnZkVVZw?=
 =?utf-8?B?L1JLSlBsQVRnMHIrSFlBYlYwUWZCV0JoVXQraGNsYWdwZEtFWXptcXI4ckZz?=
 =?utf-8?B?dXIvOEtmeHk1dzU3emVvYnBSZDN5UDhDLzZFNTQySWpuKzdnMEROWmtaWFkz?=
 =?utf-8?B?VGF0QUVqYkE1S2V5UXVaWHFZMHJIUVBhNjQrMEZqcEFNZFVJR3YxTHFtZ1kw?=
 =?utf-8?B?Zkhya3ZsWnI4SGpXVVpTYktTenBITHE1WldlNVN4ZU16cVArYzNLT0tQblN4?=
 =?utf-8?B?VnJLZE9xVDN0bktsL0FXeGtLWnRWK3N6cjdxY1BWV243emZjZndvOXhyZUty?=
 =?utf-8?B?WnFhTi9EMnk5QU94MGpzcW85VGZEc3pDK2RINlNoMERGTWgvcVhOWlZSQkRo?=
 =?utf-8?B?R281cnRtamxCUmgxQkhJemgyN1JTUHd6c1pqaGxHek5NdC96VjVsR0ozY2I2?=
 =?utf-8?B?SHVEaHpMdkwxRC9VUjZ5ZkpwYi9tcnFibks4Z0NNOHZoMmVMNDM2TkpBcnhr?=
 =?utf-8?B?N25YbkVFSmw3Z3ZHY0k5Nks2QThxRk1ORzI2YUNNa21tMVNSYjR5QnNmUXh4?=
 =?utf-8?B?RldTQkUyTVRmMUFSNDgrbnJWU0NWbkRhKy9BeUFLRnpWSjY4dWRLbEt4RmdB?=
 =?utf-8?B?eW9QK2txYmVXT2hGY3VQR0RiTHBKUXlxcSs2WTJ2QjNqM0Q2MHNlZXJIZWRF?=
 =?utf-8?B?S0dFSTlDT0M0dzhDUEpsenp3T1Z2YUZIdWpWTmEwb2g4eG1qTS84Y3FpUy9i?=
 =?utf-8?B?Szh0TG5GL0hMSk52RzRNd3FESGlSdUdvTU16UFNNSkt5ZkVsa2l4VWRqL2Uz?=
 =?utf-8?B?eEFxVERrZm8xd2F1ays3NWdCZ1VncjE4TkRsRW1OOGhJOVRhNFMwWUtwMXIx?=
 =?utf-8?B?dnNUdUdiZmprdXFDQkdlTklTZE5UeW84WTEwVlhtcC9LaEpveHVBRVR2aHVD?=
 =?utf-8?B?eVYvSUs1RkZ6SDM4b2RPTURRcm5SV1d2T0FaazIydmVKYkhrMWtQaTlTZ0FH?=
 =?utf-8?B?NW1Kc01uWWdCRmJJcCtleS9jbzhuUnVKdmJRMDVVVkFCMVV5TCtTSVRFVlpp?=
 =?utf-8?B?TU1NQlNEK05JVWRwRHkvRzNBNHNnY1l1U0V6MEM2NEpqMG45UWVieFgrMUJT?=
 =?utf-8?B?UExZelI4aVRnZWNXMnZ2SC9tTERWTWZUNmc5ZWFrYXg5Q0V4WnZBM254NFh0?=
 =?utf-8?B?NnEzc3VzNVRUZUhRVkRjTGgyZzRKa0s2ZERFQmhXWEg1RE9zNUl1TzRRUTdx?=
 =?utf-8?B?dys2UkduK2JXczhNN2lIc1FUekZOdFl3Vm1EM0hQSGFxeE5IYzVKSUZiMUNh?=
 =?utf-8?Q?G9jZKvco0S7yDhblwuigM8/Wm8FoUZHJW70QuLG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkFhMFB6alcvd2htUmxEWmEvNkZlUjk3S0R3dks3UGkrZDFDU2oweDhrL0VT?=
 =?utf-8?B?Nmx2UWUzNGN5VXZ0ZTRFTzRLL1BKL2hmUlR2RzVWejRPeldVdmlzNXp6c0pI?=
 =?utf-8?B?dXhxYkNZTURIOFUzVHRoRTBJN1FmYWl1R2EyZFFoTzFUNkxDWlFSWGl2Y3du?=
 =?utf-8?B?MkQyNS9Vd3hCdlhWcmZvM3diRWs5L3cvRENZejN1YVN5ZHhmRG1CMUlWeEFG?=
 =?utf-8?B?SndsV0lnSlZnbG15aGt5QWdjSzlVVHA2VG9oeFJ3QUxiRHduUjlGbGRURThY?=
 =?utf-8?B?R2pnWWkzdHB1VGxWMHhYYmhpWkltT2hpQVNJK3ZxbjhtL2RmWG8yR0NhU2tj?=
 =?utf-8?B?RXdISTlLOTdNYXFndjAvU2RkNWEzc0c4dVRqa01EcDh1RGxISUFLQUVkT0xO?=
 =?utf-8?B?b2Y0RkcyQXNQWGF2OVM3SUNleTlaMW02UFd0NU9pU0lWc3NoVnZ4dERqQXZX?=
 =?utf-8?B?cEJvcjNrNFhvM0oycHBXWGlPQmZKYTIvNVBiakNrUXFBQjd1eWpJYmI3NEEy?=
 =?utf-8?B?OExiUG5FTmNEL0w5MjVvR1d4QVl1Wkt5Q0prY3pPcnpNTlBnbjdoTzNicGx4?=
 =?utf-8?B?NzR6OWpKcDcyQU4ydm9oUmxObGVJby9LVHVyZ2piZmxyTGtHWXpNOEoxeWZX?=
 =?utf-8?B?NTUwUWJyT000WXk2UmdZK0RrS2llYVNVNzY0Z2pYd2hNdkFjVDZCZXJncjJP?=
 =?utf-8?B?R1FWQ2tpeURKbkJrYkR6bE9GUEQwdlN3ZCtqTlhkNVovcWM0b0tTZVlVc0lh?=
 =?utf-8?B?M0RuY1JQRklwZHdxdDZGQ0U4ck5Ec1phYzFxVDB2WHBBVGJzazBibFlkOHR6?=
 =?utf-8?B?cG9mMzhJN3FkOXY4NU82a21OeTFDNFZYVUdjckFLVXBmamk5NWp6aXBZc2dl?=
 =?utf-8?B?b0VUZGxiOWdEdWlkeFhnb1V5Nm1USGltSTMzRGlhQ1FhUWp1L2NpblBjUjkr?=
 =?utf-8?B?aElyTXZCMVRvZ2xaTlFrdTNXL29LczNJVUdSZ25VeGdXTlhtVTVaVjFGV2JN?=
 =?utf-8?B?YnF3SWZhSG01L1pKTm5nRDVmdHJ1S0hMcDhoM2hkZitIUGczRXpua044OEZB?=
 =?utf-8?B?NVVCeUF2aEh5YzdZekg0VFVVU05oZm9xMFo3anUzNlQyVkVON1FxRXM3THQ1?=
 =?utf-8?B?RlIwM2xkck1aNUhsL1NwRzZrSnY2bDNDOW1Cb0xwK3ROQzBsRWo1WkpmZ2dL?=
 =?utf-8?B?alRjdFRERzVCekNBQ0FDUUpSSW9mbkJJcFhzWGJFeTFIVTRDajFBMjk0YkJ1?=
 =?utf-8?B?M0V2ZHQyclRYV3hzYXFoMmpyN1ZPeVNFckFyVlF5eTAwNGEzQ1ZzdTd2a1Fl?=
 =?utf-8?B?UCs1aCsrRGJ3WWhhVFZKd0N5eE9NaldjSFpTbHF6dHE3dnd6ZW5VT01vSDRt?=
 =?utf-8?B?VTdUMElwMkwxM0s2VHdFa0t3L2lsTGk1bkFJL0dBY2Z3L3pUMVhERVUvL0Q4?=
 =?utf-8?B?RHU4M2xzZ1J0Uys3OFV0bEZmaTNFQnRSZEl1OWNPUnFkdWFXQ2h0RmJXY09y?=
 =?utf-8?B?cFBFNEpCRkwySWp6Qi9aK0htM0g4ckliMWQvMGN5dHNvcmNTZS9xSUV3SjNu?=
 =?utf-8?B?MkNOT3l5VTEvTzRPSDFnK2dmV2RoaU5PM0FlRlI3N0RWdC9nNnFwemRUMGti?=
 =?utf-8?B?TjdkaHJlcXdYSUdDSks2L2tPc3ZHT3Fzelpod0ErVlpmSDIzL1gvZHNqWllE?=
 =?utf-8?B?V0ZlZGRxWHpxZkVqTzJVVDMxQU9FSGNnK1VzU0c3bS9UODRVakJKbTMzOWNx?=
 =?utf-8?B?ZnNYQzZ6Sk1EZG1QLzJ0aFVkNWM2M256VmVvNHlINzhvNkZRVTZSMmE5OVFk?=
 =?utf-8?B?WnErMVVTZlkxZG5iSzlhV1hlMWZ4L3NnbktTUlZjY0dOVTRoeHhIRFBxdTAw?=
 =?utf-8?B?cS83TktvMlpRTVZ5cmpsMjFNSEtZcUhTMWJ2NkF5R1h5TVVlTWRWcXo1Y0lU?=
 =?utf-8?B?VXZSaFFEUE1Tbi9DQW1aWDBQZTlrVC9wTjA1VjlkVGl5SlVibUc0R0pTRTh5?=
 =?utf-8?B?NGNuVVlQQ3JjY3JwWW9HRUZjS2dFMGZySzdFTlJZdStJc0pySGM2YUVaY0Nl?=
 =?utf-8?B?Qk9tbTJ0UkEzVGFmek1nWGhxMlhBSFJCeUxRSDVZZ2pxamNYRGRzaDlWV2Rx?=
 =?utf-8?Q?le9Qh+iMbOpCEVS9Nyv5aaQqX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05835946-6e43-4054-5049-08dcf26d3886
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 07:43:29.6427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crppftEguf8T4cxF2evDq7FH/Q+X2QiOa6eCY/t+r0kGRrP18qyCIW7CP0zJ2tBk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7689
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

Am 18.10.24 um 15:33 schrieb Yunxiang Li:
> Before, every time fdinfo is queried we try to lock all the BOs in the
> VM and calculate memory usage from scratch. This works okay if the
> fdinfo is rarely read and the VMs don't have a ton of BOs. If either of
> these conditions is not true, we get a massive performance hit.
>
> In this new revision, we track the BOs as they change states. This way
> when the fdinfo is queried we only need to take the status lock and copy
> out the usage stats with minimal impact to the runtime performance.
>
> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  14 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c  |  11 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  82 +-------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |   3 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 204 ++++++++++++++++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  13 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c   |   1 +
>   drivers/gpu/drm/drm_file.c                  |   8 +
>   include/drm/drm_file.h                      |   1 +
>   9 files changed, 220 insertions(+), 117 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index b144404902255..1d8a0ff3c8604 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -36,6 +36,7 @@
>   #include "amdgpu_gem.h"
>   #include "amdgpu_dma_buf.h"
>   #include "amdgpu_xgmi.h"
> +#include "amdgpu_vm.h"
>   #include <drm/amdgpu_drm.h>
>   #include <drm/ttm/ttm_tt.h>
>   #include <linux/dma-buf.h>
> @@ -190,6 +191,13 @@ static void amdgpu_dma_buf_unmap(struct dma_buf_attachment *attach,
>   	}
>   }
>   
> +static void amdgpu_dma_buf_release(struct dma_buf *buf)
> +{
> +	struct amdgpu_bo *bo = gem_to_amdgpu_bo(buf->priv);
> +	amdgpu_vm_bo_update_shared(bo, -1);
> +	drm_gem_dmabuf_release(buf);
> +}
> +
>   /**
>    * amdgpu_dma_buf_begin_cpu_access - &dma_buf_ops.begin_cpu_access implementation
>    * @dma_buf: Shared DMA buffer
> @@ -237,7 +245,7 @@ const struct dma_buf_ops amdgpu_dmabuf_ops = {
>   	.unpin = amdgpu_dma_buf_unpin,
>   	.map_dma_buf = amdgpu_dma_buf_map,
>   	.unmap_dma_buf = amdgpu_dma_buf_unmap,
> -	.release = drm_gem_dmabuf_release,
> +	.release = amdgpu_dma_buf_release,
>   	.begin_cpu_access = amdgpu_dma_buf_begin_cpu_access,
>   	.mmap = drm_gem_dmabuf_mmap,
>   	.vmap = drm_gem_dmabuf_vmap,
> @@ -265,8 +273,10 @@ struct dma_buf *amdgpu_gem_prime_export(struct drm_gem_object *gobj,
>   		return ERR_PTR(-EPERM);
>   
>   	buf = drm_gem_prime_export(gobj, flags);
> -	if (!IS_ERR(buf))
> +	if (!IS_ERR(buf)) {
>   		buf->ops = &amdgpu_dmabuf_ops;
> +		amdgpu_vm_bo_update_shared(bo, +1);
> +	}
>   
>   	return buf;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> index 7a9573958d87c..ceedfc3665c18 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> @@ -40,6 +40,7 @@
>   #include "amdgpu_gem.h"
>   #include "amdgpu_ctx.h"
>   #include "amdgpu_fdinfo.h"
> +#include "amdgpu_ttm.h"
>   
>   
>   static const char *amdgpu_ip_name[AMDGPU_HW_IP_NUM] = {
> @@ -60,7 +61,7 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   	struct amdgpu_fpriv *fpriv = file->driver_priv;
>   	struct amdgpu_vm *vm = &fpriv->vm;
>   
> -	struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST + 1] = { };
> +	struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST] = { };
>   	ktime_t usage[AMDGPU_HW_IP_NUM];
>   	const char *pl_name[] = {
>   		[TTM_PL_VRAM] = "vram",
> @@ -70,13 +71,7 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   	unsigned int hw_ip, i;
>   	int ret;
>   
> -	ret = amdgpu_bo_reserve(vm->root.bo, false);
> -	if (ret)
> -		return;
> -
> -	amdgpu_vm_get_memory(vm, stats, ARRAY_SIZE(stats));
> -	amdgpu_bo_unreserve(vm->root.bo);
> -
> +	amdgpu_vm_get_memory(vm, stats);
>   	amdgpu_ctx_mgr_usage(&fpriv->ctx_mgr, usage);
>   
>   	/*
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 2436b7c9ad12b..5ff147881da6d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1156,7 +1156,7 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
>   		return;
>   
>   	abo = ttm_to_amdgpu_bo(bo);
> -	amdgpu_vm_bo_invalidate(abo, evict);
> +	amdgpu_vm_bo_move(abo, new_mem, evict);
>   
>   	amdgpu_bo_kunmap(abo);
>   
> @@ -1169,86 +1169,6 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
>   			     old_mem ? old_mem->mem_type : -1);
>   }
>   
> -void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
> -			  struct amdgpu_mem_stats *stats,
> -			  unsigned int sz)
> -{
> -	const unsigned int domain_to_pl[] = {
> -		[ilog2(AMDGPU_GEM_DOMAIN_CPU)]	    = TTM_PL_SYSTEM,
> -		[ilog2(AMDGPU_GEM_DOMAIN_GTT)]	    = TTM_PL_TT,
> -		[ilog2(AMDGPU_GEM_DOMAIN_VRAM)]	    = TTM_PL_VRAM,
> -		[ilog2(AMDGPU_GEM_DOMAIN_GDS)]	    = AMDGPU_PL_GDS,
> -		[ilog2(AMDGPU_GEM_DOMAIN_GWS)]	    = AMDGPU_PL_GWS,
> -		[ilog2(AMDGPU_GEM_DOMAIN_OA)]	    = AMDGPU_PL_OA,
> -		[ilog2(AMDGPU_GEM_DOMAIN_DOORBELL)] = AMDGPU_PL_DOORBELL,
> -	};
> -	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> -	struct ttm_resource *res = bo->tbo.resource;
> -	struct drm_gem_object *obj = &bo->tbo.base;
> -	uint64_t size = amdgpu_bo_size(bo);
> -	unsigned int type;
> -
> -	if (!res) {
> -		/*
> -		 * If no backing store use one of the preferred domain for basic
> -		 * stats. We take the MSB since that should give a reasonable
> -		 * view.
> -		 */
> -		BUILD_BUG_ON(TTM_PL_VRAM < TTM_PL_TT ||
> -			     TTM_PL_VRAM < TTM_PL_SYSTEM);
> -		type = fls(bo->preferred_domains & AMDGPU_GEM_DOMAIN_MASK);
> -		if (!type)
> -			return;
> -		type--;
> -		if (drm_WARN_ON_ONCE(&adev->ddev,
> -				     type >= ARRAY_SIZE(domain_to_pl)))
> -			return;
> -		type = domain_to_pl[type];
> -	} else {
> -		type = res->mem_type;
> -	}
> -
> -	/* Squash some into 'cpu' to keep the legacy userspace view. */
> -	switch (type) {
> -	case TTM_PL_VRAM:
> -	case TTM_PL_TT:
> -	case TTM_PL_SYSTEM:
> -		break;
> -	default:
> -		type = TTM_PL_SYSTEM;
> -		break;
> -	}
> -
> -	if (drm_WARN_ON_ONCE(&adev->ddev, type >= sz))
> -		return;
> -
> -	/* DRM stats common fields: */
> -
> -	if (drm_gem_object_is_shared_for_memory_stats(obj))
> -		stats[type].drm.shared += size;
> -	else
> -		stats[type].drm.private += size;
> -
> -	if (res) {
> -		stats[type].drm.resident += size;
> -
> -		if (!dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_BOOKKEEP))
> -			stats[type].drm.active += size;
> -		else if (bo->flags & AMDGPU_GEM_CREATE_DISCARDABLE)
> -			stats[type].drm.purgeable += size;
> -	}
> -
> -	/* amdgpu specific stats: */
> -
> -	if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) {
> -		stats[TTM_PL_VRAM].requested += size;
> -		if (type != TTM_PL_VRAM)
> -			stats[TTM_PL_VRAM].evicted += size;
> -	} else if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_GTT) {
> -		stats[TTM_PL_TT].requested += size;
> -	}
> -}
> -
>   /**
>    * amdgpu_bo_release_notify - notification about a BO being released
>    * @bo: pointer to a buffer object
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> index be6769852ece4..ebad4f96775d9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -300,9 +300,6 @@ int amdgpu_bo_sync_wait_resv(struct amdgpu_device *adev, struct dma_resv *resv,
>   int amdgpu_bo_sync_wait(struct amdgpu_bo *bo, void *owner, bool intr);
>   u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo);
>   u64 amdgpu_bo_gpu_offset_no_check(struct amdgpu_bo *bo);
> -void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
> -			  struct amdgpu_mem_stats *stats,
> -			  unsigned int size);
>   uint32_t amdgpu_bo_get_preferred_domain(struct amdgpu_device *adev,
>   					    uint32_t domain);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 9fab64edd0530..a802cea67a4d7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -36,6 +36,7 @@
>   #include <drm/ttm/ttm_tt.h>
>   #include <drm/drm_exec.h>
>   #include "amdgpu.h"
> +#include "amdgpu_vm.h"
>   #include "amdgpu_trace.h"
>   #include "amdgpu_amdkfd.h"
>   #include "amdgpu_gmc.h"
> @@ -310,6 +311,134 @@ static void amdgpu_vm_bo_reset_state_machine(struct amdgpu_vm *vm)
>   	spin_unlock(&vm->status_lock);
>   }
>   
> +static uint32_t fold_memtype(uint32_t memtype) {

In general please add prefixes to even static functions, e.g. amdgpu_vm_ 
or amdgpu_bo_.

> +	/* Squash private placements into 'cpu' to keep the legacy userspace view. */
> +	switch (mem_type) {
> +	case TTM_PL_VRAM:
> +	case TTM_PL_TT:
> +		return memtype
> +	default:
> +		return TTM_PL_SYSTEM;
> +	}
> +}
> +
> +static uint32_t bo_get_memtype(struct amdgpu_bo *bo) {

That whole function belongs into amdgpu_bo.c

> +	struct ttm_resource *res = bo->tbo.resource;
> +	const uint32_t domain_to_pl[] = {
> +		[ilog2(AMDGPU_GEM_DOMAIN_CPU)]      = TTM_PL_SYSTEM,
> +		[ilog2(AMDGPU_GEM_DOMAIN_GTT)]      = TTM_PL_TT,
> +		[ilog2(AMDGPU_GEM_DOMAIN_VRAM)]     = TTM_PL_VRAM,
> +		[ilog2(AMDGPU_GEM_DOMAIN_GDS)]      = AMDGPU_PL_GDS,
> +		[ilog2(AMDGPU_GEM_DOMAIN_GWS)]      = AMDGPU_PL_GWS,
> +		[ilog2(AMDGPU_GEM_DOMAIN_OA)]       = AMDGPU_PL_OA,
> +		[ilog2(AMDGPU_GEM_DOMAIN_DOORBELL)] = AMDGPU_PL_DOORBELL,
> +	};
> +	uint32_t domain;
> +
> +	if (res)
> +		return fold_memtype(res->mem_type);
> +
> +	/*
> +	 * If no backing store use one of the preferred domain for basic
> +	 * stats. We take the MSB since that should give a reasonable
> +	 * view.
> +	 */
> +	BUILD_BUG_ON(TTM_PL_VRAM < TTM_PL_TT || TTM_PL_VRAM < TTM_PL_SYSTEM);
> +	domain = fls(bo->preferred_domains & AMDGPU_GEM_DOMAIN_MASK);
> +	if (drm_WARN_ON_ONCE(&adev->ddev,
> +			     domain == 0 || --domain >= ARRAY_SIZE(domain_to_pl)))

It's perfectly legal to create a BO without a placement. That one just 
won't have a backing store.

> +		return 0;
> +	return fold_memtype(domain_to_pl[domain])

That would need specular execution mitigation if I'm not completely 
mistaken.

Better use a switch/case statement.

> +}


> +
> +/**
> + * amdgpu_vm_update_shared - helper to update shared memory stat
> + * @base: base structure for tracking BO usage in a VM
> + * @sign: if we should add (+1) or subtract (-1) the memory stat
> + *
> + * Takes the vm status_lock and updates the shared memory stat. If the basic
> + * stat changed (e.g. buffer was moved) amdgpu_vm_update_stats need to be called
> + * as well.
> + */
> +static void amdgpu_vm_update_shared(struct amdgpu_vm_bo_base *base, int sign)
> +{
> +	struct amdgpu_vm *vm = base->vm;
> +	struct amdgpu_bo *bo = base->bo;
> +	int64_t size;
> +	int type;
> +
> +	if (!vm || !bo || !(sign == +1 || sign == -1))
> +		return;

Please drop such kind of checks.

> +
> +	spin_lock(&vm->status_lock);
> +	size = sign * amdgpu_bo_size(bo);
> +	type = bo_get_memtype(bo);
> +	vm->stats[type].drm.shared += size;
> +	vm->stats[type].drm.private -= size;
> +	spin_unlock(&vm->status_lock);
> +}
> +
> +/**
> + * amdgpu_vm_update_stats - helper to update normal memory stat
> + * @base: base structure for tracking BO usage in a VM
> + * @new_mem: the new placement of the BO if any (e.g. NULL when BO is deleted)
> + * @old_mem: the old placement of the BO if any (e.g. NULL when BO is created)
> + *
> + * Takes the vm status_lock and updates the basic memory stat. If the shared
> + * stat changed (e.g. buffer was exported) amdgpu_vm_update_shared need to be
> + * called as well.
> + */
> +void amdgpu_vm_update_stats(struct amdgpu_vm_bo_base *base,
> +			    struct ttm_resource *new_mem,
> +			    struct ttm_resource *old_mem)
> +{
> +	struct amdgpu_vm *vm = base->vm;
> +	struct amdgpu_bo *bo = base->bo;
> +	uint64_t size;
> +	int type;
> +	bool shared;
> +
> +	if (!vm || !bo || (!new_mem && !old_mem))
> +		return;
> +
> +	spin_lock(&vm->status_lock);
> +
> +	size = amdgpu_bo_size(bo);
> +	shared = drm_gem_object_is_shared_for_memory_stats(&bo->tbo.base);

That should probably be outside of the spinlock.

> +
> +	if (old_mem) {
> +		type = fold_memtype(old_mem->mem_type);
> +		if (shared)
> +			vm->stats[i].drm.shared -= size;
> +		else
> +			vm->stats[i].drm.private -= size;
> +	}
> +	if (new_mem) {
> +		type = fold_memtype(new_mem->mem_type);
> +		if (shared)
> +			vm->stats[i].drm.shared += size;
> +		else
> +			vm->stats[i].drm.private += size;
> +	}
> +	if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) {
> +		if (!old_mem)
> +			vm->stats[TTM_PL_VRAM].requested += size;
> +		else if (old_mem->mem_type != TTM_PL_VRAM)
> +			vm->stats[TTM_PL_VRAM].evicted -= size;
> +		if (!new_mem)
> +			vm->stats[TTM_PL_VRAM].requested -= size;
> +		else if (new_mem->mem_type != TTM_PL_VRAM)
> +			vm->stats[TTM_PL_VRAM].evicted += size;
> +	} else if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_GTT) {
> +		if (!old_mem)
> +			vm->stats[TTM_PL_TT].requested += size;
> +		if (!new_mem)
> +			vm->stats[TTM_PL_TT].requested -= size;
> +	}
> +
> +	spin_unlock(&vm->status_lock);
> +}
> +
>   /**
>    * amdgpu_vm_bo_base_init - Adds bo to the list of bos associated with the vm
>    *
> @@ -332,6 +461,7 @@ void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
>   		return;
>   	base->next = bo->vm_bo;
>   	bo->vm_bo = base;
> +	amdgpu_vm_update_stats(base, bo->tbo.resource, NULL);
>   
>   	if (!amdgpu_vm_is_bo_always_valid(vm, bo))
>   		return;
> @@ -1106,29 +1236,10 @@ static void amdgpu_vm_bo_get_memory(struct amdgpu_bo_va *bo_va,
>   }
>   
>   void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
> -			  struct amdgpu_mem_stats *stats,
> -			  unsigned int size)
> +			  struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST])
>   {
> -	struct amdgpu_bo_va *bo_va, *tmp;
> -
>   	spin_lock(&vm->status_lock);
> -	list_for_each_entry_safe(bo_va, tmp, &vm->idle, base.vm_status)
> -		amdgpu_vm_bo_get_memory(bo_va, stats, size);
> -
> -	list_for_each_entry_safe(bo_va, tmp, &vm->evicted, base.vm_status)
> -		amdgpu_vm_bo_get_memory(bo_va, stats, size);
> -
> -	list_for_each_entry_safe(bo_va, tmp, &vm->relocated, base.vm_status)
> -		amdgpu_vm_bo_get_memory(bo_va, stats, size);
> -
> -	list_for_each_entry_safe(bo_va, tmp, &vm->moved, base.vm_status)
> -		amdgpu_vm_bo_get_memory(bo_va, stats, size);
> -
> -	list_for_each_entry_safe(bo_va, tmp, &vm->invalidated, base.vm_status)
> -		amdgpu_vm_bo_get_memory(bo_va, stats, size);
> -
> -	list_for_each_entry_safe(bo_va, tmp, &vm->done, base.vm_status)
> -		amdgpu_vm_bo_get_memory(bo_va, stats, size);
> +	memcpy(stats, vm->stats, sizeof(*stats) * __AMDGPU_PL_LAST);
>   	spin_unlock(&vm->status_lock);
>   }
>   
> @@ -2071,6 +2182,7 @@ void amdgpu_vm_bo_del(struct amdgpu_device *adev,
>   			if (*base != &bo_va->base)
>   				continue;
>   
> +			amdgpu_vm_update_stats(*base, NULL, bo->tbo.resource);
>   			*base = bo_va->base.next;
>   			break;
>   		}
> @@ -2136,6 +2248,22 @@ bool amdgpu_vm_evictable(struct amdgpu_bo *bo)
>   	return true;
>   }
>   
> +/**
> + * amdgpu_vm_bo_update_shared - called when bo gets shared/unshared
> + *
> + * @bo: amdgpu buffer object
> + * @sign: if we should add (+1) or subtract (-1) the memory stat
> + *
> + * Update the per VM stats for all the vm
> + */
> +void amdgpu_vm_bo_update_shared(struct amdgpu_bo *bo, int sign)
> +{
> +	struct amdgpu_vm_bo_base *bo_base;
> +
> +	for (bo_base = bo->vm_bo; bo_base; bo_base = bo_base->next)
> +		amdgpu_vm_update_shared(bo_base, sign);
> +}
> +
>   /**
>    * amdgpu_vm_bo_invalidate - mark the bo as invalid
>    *
> @@ -2169,6 +2297,26 @@ void amdgpu_vm_bo_invalidate(struct amdgpu_bo *bo, bool evicted)
>   	}
>   }
>   
> +/**
> + * amdgpu_vm_bo_move - handle BO move
> + *
> + * @bo: amdgpu buffer object
> + * @new_mem: the new placement of the BO move
> + * @evicted: is the BO evicted
> + *
> + * Update the memory stats for the new placement and mark @bo as invalid.
> + */
> +void amdgpu_vm_bo_move(struct amdgpu_bo *bo, struct ttm_resource *new_mem,
> +		       bool evicted)
> +{
> +	struct amdgpu_vm_bo_base *bo_base;
> +
> +	for (bo_base = bo->vm_bo; bo_base; bo_base = bo_base->next)
> +		amdgpu_vm_update_stats(bo_base, new_mem, bo->tbo.resource);
> +
> +	amdgpu_vm_bo_invalidate(bo, evicted);
> +}
> +
>   /**
>    * amdgpu_vm_get_block_size - calculate VM page table size as power of two
>    *
> @@ -2585,6 +2733,18 @@ void amdgpu_vm_release_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>   	vm->is_compute_context = false;
>   }
>   
> +static int amdgpu_vm_stats_is_zero(struct amdgpu_vm *vm)
> +{
> +	int is_zero = 1;
> +	for (int i = 0; i < __AMDGPU_PL_LAST, ++i) {
> +		if (!(is_zero = is_zero &&
> +				drm_memory_stats_is_zero(&vm->stats[i].drm) &&
> +				stats->evicted == 0 && stats->requested == 0))

The indentation here looks completely off.

> +			break;
> +	}
> +	return is_zero;
> +}
> +
>   /**
>    * amdgpu_vm_fini - tear down a vm instance
>    *
> @@ -2656,6 +2816,8 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>   		}
>   	}
>   
> +	if (!amdgpu_vm_stats_is_zero(vm))
> +		dev_err(adev->dev, "VM memory stats is non-zero when fini\n");
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 6a1b344e15e1b..7b3cd6367969d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -24,6 +24,7 @@
>   #ifndef __AMDGPU_VM_H__
>   #define __AMDGPU_VM_H__
>   
> +#include "amdgpu_ttm.h"
>   #include <linux/idr.h>
>   #include <linux/kfifo.h>
>   #include <linux/rbtree.h>
> @@ -345,6 +346,9 @@ struct amdgpu_vm {
>   	/* Lock to protect vm_bo add/del/move on all lists of vm */
>   	spinlock_t		status_lock;
>   
> +	/* Memory statistics for this vm, protected by the status_lock */
> +	struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST];
> +
>   	/* Per-VM and PT BOs who needs a validation */
>   	struct list_head	evicted;
>   
> @@ -525,6 +529,12 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev,
>   			bool clear);
>   bool amdgpu_vm_evictable(struct amdgpu_bo *bo);
>   void amdgpu_vm_bo_invalidate(struct amdgpu_bo *bo, bool evicted);
> +void amdgpu_vm_update_stats(struct amdgpu_vm_bo_base *base,
> +			    struct ttm_resource *new_mem,
> +			    struct ttm_resource *old_mem);
> +void amdgpu_vm_bo_update_shared(struct amdgpu_bo *bo, int sign);
> +void amdgpu_vm_bo_move(struct amdgpu_bo *bo, struct ttm_resource *new_mem,
> +		       bool evicted);
>   uint64_t amdgpu_vm_map_gart(const dma_addr_t *pages_addr, uint64_t addr);
>   struct amdgpu_bo_va *amdgpu_vm_bo_find(struct amdgpu_vm *vm,
>   				       struct amdgpu_bo *bo);
> @@ -575,8 +585,7 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
>   void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
>   				struct amdgpu_vm *vm);
>   void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
> -			  struct amdgpu_mem_stats *stats,
> -			  unsigned int size);
> +			  struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST]);
>   
>   int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   		       struct amdgpu_bo_vm *vmbo, bool immediate);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> index f78a0434a48fa..bd57ced911e32 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> @@ -537,6 +537,7 @@ static void amdgpu_vm_pt_free(struct amdgpu_vm_bo_base *entry)
>   	if (!entry->bo)
>   		return;
>   
> +	amdgpu_vm_update_stats(entry, NULL, entry->bo->tbo.resource);
>   	entry->bo->vm_bo = NULL;
>   	ttm_bo_set_bulk_move(&entry->bo->tbo, NULL);
>   
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 714e42b051080..39e36fa1e89cd 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -859,6 +859,14 @@ static void print_size(struct drm_printer *p, const char *stat,
>   	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
>   }
>   
> +int drm_memory_stats_is_zero(const struct drm_memory_stats *stats) {
> +	return (stats->shared == 0 &&
> +		stats->private == 0 &&
> +		stats->resident == 0 &&
> +		stats->purgeable == 0 &&
> +		stats->active == 0);
> +}
> +

That needs a separate patch and review on the dri-devel mailing list.

Regards,
Christian.

>   /**
>    * drm_print_memory_stats - A helper to print memory stats
>    * @p: The printer to print output to
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index ab230d3af138d..7f91e35d027d9 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -477,6 +477,7 @@ struct drm_memory_stats {
>   
>   enum drm_gem_object_status;
>   
> +int drm_memory_stats_is_zero(const struct drm_memory_stats *stats);
>   void drm_print_memory_stats(struct drm_printer *p,
>   			    const struct drm_memory_stats *stats,
>   			    enum drm_gem_object_status supported_status,

