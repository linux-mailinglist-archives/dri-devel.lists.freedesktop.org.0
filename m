Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2924748C5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 18:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A004110E5D4;
	Tue, 14 Dec 2021 17:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649BF10E5CD;
 Tue, 14 Dec 2021 17:03:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OdQ9pL4Mmokr+liLjURdDiJ0rLP6IT7kboXKC1FQi0wBtpNurbCuiRhbh4apkx9xqUBEBPko/zUZSF/PVR9NYEwqS7/oQcCbU+LECBIKA0rIiGtxV2zljyJ3zr0UNlqi533TAb45EARujyPLJHceyU5W0yhkG/Gj4j3r/UsM/q0N3qdmwRXH6cHB6mZBXwXz2UNtGvjAa1emB3c1lfe8rSmrEZnjcR1beUJtDyidSI1vLPSR0ea8MfCNy4iHcoROpAarYGgZ4YRkwfrOY3yLYOxsn47FbqekRu3irJ/ez+zq2pvtxxBc/VhSe/Jo0ZHK5oQzSJyQvRIJoPfn3Th0nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eo/KwfSIYvU3GZKxyRAZHq/IihdEu2qEwD8Y+MExX68=;
 b=Via93h+eSn8H0v9tGHtmBYjE9OsqFNG6Af5tQ3584YK+Th8NLzMvM7/i3+1vQB0KbWlTjetkg5dSh6BRCD2iVepVYvYXonknxjzTi5ytV3OwUTqITEINnowtrC1rsf/APFJtNizpTmCMIUbWY7Qsl0gq5OXfzP0vciuvwBgwAQLbiS4UFaTQy5+Ev95muCe/PGu+SFh7EaaZe7jyKMv+NdfcsyOJhZm+8pdk0Flu8d4ZbrY6/pyHqRyF4prYCppabUoPkCJ/xmmHUQ+lKfmvhWpZvHRhLflS5r2774MhvCwzdxZKh3fCNG88GfT/LYB15CrH5JtB/s6o8++Ruix7Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eo/KwfSIYvU3GZKxyRAZHq/IihdEu2qEwD8Y+MExX68=;
 b=zceMzSfpwCqjgRusit5l/X26Qo0hOJqYBxOxwqsYxtSuICmm5x1fwiuDcD8gcEIjmFnbxp8/qZ5RXe2sKa9jQjzk9kdEbZ4fyrS6za1lp7SzJsDi+fkM3YSeNlTquumR4Myjax0ehBXSzVLKyrKBguwerRmdZyiN/Geiz+BtsMY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB4234.namprd12.prod.outlook.com (2603:10b6:5:213::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 14 Dec
 2021 17:03:55 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c%7]) with mapi id 15.20.4801.014; Tue, 14 Dec 2021
 17:03:54 +0000
Subject: Re: [PATCH v2] drm/amdgpu: introduce new amdgpu_fence object to
 indicate the job embedded fence
To: Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20211214111554.2672812-1-ray.huang@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <20f336a4-0bfd-9988-ee3b-a8206f045f7e@amd.com>
Date: Tue, 14 Dec 2021 12:03:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211214111554.2672812-1-ray.huang@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MN2PR04CA0032.namprd04.prod.outlook.com
 (2603:10b6:208:d4::45) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2be3e230-4af6-4791-6caf-08d9bf23b5b9
X-MS-TrafficTypeDiagnostic: DM6PR12MB4234:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB42347930B1203287CA8F8DC2EA759@DM6PR12MB4234.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:110;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tewyt1/tR/zY7R1mayUagzP14iWy+sMND+6RZBQLNvrTBg7DMQKgQk3aZz1joLbF3pGwdGDx6z5c8N8BDJTE2piWD0DDvi7qsWdJJmIUNq1j5MxcYoViXEylHmqF6eC0FxCQH84QCHLSdBx9E3hQT9c0KmWVKdi3avw6t96Rblk2n5d6+c0yMvswHmlgJGUY5nWQSWH3WvwISFqIT9eMCOr5dtNOf8FBXsL1cfbhTRTN2JdyVeJd29c6kyefceAZ1alsczB8wWJpOJ9mxNcAxkxUNX5wcK7BOUL5OnCJzHlR3od4YMB6J1yFZdWO73C7V1ASNw38GGNYMfQoSWAFdyvMwQvMThHyTUCL0dysKWRpEyNuLBnbpB9kvSFvGWYPnUSK9uTtuQhDPyk81UrSyvmKNDNo3ChXTQHclEDAkQ1a6nSDLUlff0Y0RRBwG5HHIvbbjPjr3/9GabHxQoJTFWs5iD72CVcgjj6AjO4nOazuc4u2A9hgq9Q3WgTRuTy//YxqXVoqqirhD5iVHG9x4P82AdhjyQVf4D+Oj9zN9MbwbmekZQsb+8Aj/37X9Nv1ef5j3XVJ5NuzsBhLhwvFQsp3iKdzY6uwUo+DMn0whHQHbTrSfiSTxuC1rJ61DHvAVLHH285gJwYA/X3KUx3CvPtGw5WI1PKveSlEpKYESdhh5qlydq5d0Y8OVsuJsbsFwmrBE3cHlsbBBFvH11E8ONPJ7BO3n/93/7ZvdL+nxdo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(8676002)(44832011)(508600001)(36756003)(4001150100001)(8936002)(38100700002)(6486002)(31696002)(2906002)(86362001)(110136005)(66476007)(6666004)(6506007)(6512007)(2616005)(53546011)(5660300002)(186003)(66556008)(66946007)(4326008)(31686004)(316002)(30864003)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3FybzFheFgxcWFGU0RucVlwRmRoMm9lclJSWDhoR0lzR2FDRVlXSytRZmFJ?=
 =?utf-8?B?RkVXREQ2Zm9WZXlPQ0U0b2xhN0h6SFBmVmpsVVFjdjlkSlE4bGpCdEs1dURD?=
 =?utf-8?B?QnNUbm9McHJ4NXpGbWwrc3dZdDA1SW1qTWh1RGlrSisyLzNLb1k5QWtaUFM5?=
 =?utf-8?B?M2FhRytoak1vK3FHbTMwMFZyQUNiVTJOc0daVzhXRytIeW00YjNidkxOTmF4?=
 =?utf-8?B?YklBSFV0QjVkWnVEV3lXVWJLVkp6TmF4bXlKWWdvbCt6Yi84NWNuNWd0ZzI1?=
 =?utf-8?B?cjExeDQvVUVMQllWbWRMTENYRHJyRUhzRVZqaTc1K1JSeFBDNVZCZzExU0J2?=
 =?utf-8?B?Y2hiTWYyRXZEUFRDS0VxblprZWZiZzJ5aGJ4eDZnOExtT1FFWk01M3FTWmtx?=
 =?utf-8?B?U2lKdUVXeVVydTNRMzRLVWtDWDNsS01KOStMNmZQNFpiN1pQRDl3MlJFbVJZ?=
 =?utf-8?B?dVMxUmd1ek9OZm9DOFBoQ2JueVFoMW05VFhOY1QrL3hwUGdlVGdMYVZLdjNG?=
 =?utf-8?B?dkhXQlhLaS8xR2c4VGV1UDdMVFYxeFdzbXJrd3lBZ0NFSmdZQmRBbU1JY0V0?=
 =?utf-8?B?S29NWFB5ODdVVjZDd0JuRExyOXJsNDNockxVcDh2Y1NJREszNWVFeHVqQmlT?=
 =?utf-8?B?SDdMVEl0L3VuSllQNWtBVUVxS3drMFpEMmhheElTWnZYbWxxMk56L3phVkl4?=
 =?utf-8?B?V2EraGlHNEh1T0VTUU5rSHg0UUdMa0xkVkUvTTd2d2hOWUdBY3ErN0ZXcnZR?=
 =?utf-8?B?MWMzWVR6eWhKTHdSSlNHTnU3eEVoWE5zTkhnUnpDeG5jS2FWSm9sdE1oREJX?=
 =?utf-8?B?d0lQVnh0WnpDZXpWL3RRU3pBUDJ1TUh5SHZacjJ1ZzZNNi8ySVROWFdQQzQ1?=
 =?utf-8?B?QkViUmRWRHVreUp5bWQ3MHV5OVVDTkUxTmpLYmk2Q0pUMDlPTEVSUVB2bFB4?=
 =?utf-8?B?NmhITzIrSUNqRTJSall1K2tlU2hxQ3U1K05mbWhvSjZkNC92RW5EZW9jL2Ir?=
 =?utf-8?B?b0ZNUXJTTjQ2ZVJ4eWF2Z2JpQ3BqbkhCR0pzNnVxTlBGdGZ4TzBsd2thYlZs?=
 =?utf-8?B?b0xNb0NUNDhrd1llNzQyVGVmNkpuL0h1WVVRTCtkWGQ1Q1kxSWwyYWxidFhn?=
 =?utf-8?B?SEpkdWpLNXozQ1B2bDFxOG5jMnNlUHJ0eU9nYmYxVllGS1dYRlMwdlZEMFBS?=
 =?utf-8?B?YkZWcWlLQ0VQRGxPdGE0cE5wd25PUXZkNkxVY1NMamRudC9xSXZXRTE1Q29J?=
 =?utf-8?B?cDFvVmUzUWFCZWtXMGVQUTBlL2MrNExnV3VSM215RmJSSnNOTWNNUU5PM2VM?=
 =?utf-8?B?YjMzK250Zjd2NUZ2S2pCVWN0OW5XNzFVbENRSk1ZY2ZNRmtWZUxwNjM3YUVV?=
 =?utf-8?B?N2paTVZ0VnZPcS9FOG9CbW4rUjNCbmNSVmtwVUgvNytmbEtGSG1ES1ozV3BR?=
 =?utf-8?B?ZnJjREVud2FwSUdLR3Z2Skd0TFhvNUpCdDdnVmZ6TFBLUjJLMTE3eWZGd2Zs?=
 =?utf-8?B?bTk4Mzg3SkliaVJSTFVDdXR1L3lIa0huajlNdjA4cXNxVFB3c3Y0WFVUZmdn?=
 =?utf-8?B?YnFMemJuaUZadTFpM09lTmJkL2lISVgydlEweXhtaEtRVFhEVDFUdGY5TlE2?=
 =?utf-8?B?cmg1NXJwR3BiTW5BU2xYSWpISllMTDhjOXg5emZwSU1OVk4wN0JiVjZHMGxz?=
 =?utf-8?B?WFpFWWh0SzdxNGNFZ2VpL1VWYnM0NVB3QU45ZmtWaEFoaGtLRk1wME11YnZs?=
 =?utf-8?B?U3U4R2FyNW9YTmFzcEJVSjRuQWNyLzdBTldMVVluRXppT2FMUWRWTUdRaEoy?=
 =?utf-8?B?Z29NWXNaQkJIUnpPNWI1TzFOMW1WSllnMi92S2NlUkVYMEwrQjVXOVl6THR6?=
 =?utf-8?B?L216N0tEa0dkVVFvUGlVcHE0MmRUZU9hdUJsWmRrZWwrd0ZPUGZBcUxlenNX?=
 =?utf-8?B?WjhtbUFaTGRQN3I5ZWE4QUJvZkV0akpFOUpRRzRHZURWWnljb1QrSkhscmJC?=
 =?utf-8?B?OERjbU40akpyb25NVXR4TUdHZnBuWXhWR3JEUzV5Z080RjF4TFozZHNrekZ2?=
 =?utf-8?B?eFQ2WDl2U2xZOE9qTFhYYVJLQzhmMXV2S1QyamRoR1ptdzJxMnBpSFdUakpM?=
 =?utf-8?B?WG5WOUZYOVZaWG9Tc3QrQ092RUllQzhWUlNUS0RYdUVrSXVnWlFyK0JiZmxp?=
 =?utf-8?B?T2FwT2tMaXBpQWJzQ2JML1Q1K2lsRUFzY3JPQ0I0SmNkZ1dhR3dPLy9mZHo5?=
 =?utf-8?Q?lMGLsDh790koNi1oWQU2rT7DOiEUrh0t4f1hidYyhI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be3e230-4af6-4791-6caf-08d9bf23b5b9
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 17:03:54.6974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KFXeTVaTteqKeuww5pk9NKejiALzwgkvw7lcOK1DIwMO8+IGOedOWRJWC06L8a43E4VisJcwMWsu2I/FpMdPZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4234
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
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Monk Liu <Monk.Liu@amd.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021-12-14 6:15 a.m., Huang Rui wrote:
> The job embedded fence donesn't initialize the flags at
> dma_fence_init(). Then we will go a wrong way in
> amdgpu_fence_get_timeline_name callback and trigger a null pointer panic
> once we enabled the trace event here. So introduce new amdgpu_fence
> object to indicate the job embedded fence.
>
> [  156.131790] BUG: kernel NULL pointer dereference, address: 00000000000002a0
> [  156.131804] #PF: supervisor read access in kernel mode
> [  156.131811] #PF: error_code(0x0000) - not-present page
> [  156.131817] PGD 0 P4D 0
> [  156.131824] Oops: 0000 [#1] PREEMPT SMP PTI
> [  156.131832] CPU: 6 PID: 1404 Comm: sdma0 Tainted: G           OE     5.16.0-rc1-custom #1
> [  156.131842] Hardware name: Gigabyte Technology Co., Ltd. Z170XP-SLI/Z170XP-SLI-CF, BIOS F20 11/04/2016
> [  156.131848] RIP: 0010:strlen+0x0/0x20
> [  156.131859] Code: 89 c0 c3 0f 1f 80 00 00 00 00 48 01 fe eb 0f 0f b6 07 38 d0 74 10 48 83 c7 01 84 c0 74 05 48 39 f7 75 ec 31 c0 c3 48 89 f8 c3 <80> 3f 00 74 10 48 89 f8 48 83 c0 01 80 38 00 75 f7 48 29 f8 c3 31
> [  156.131872] RSP: 0018:ffff9bd0018dbcf8 EFLAGS: 00010206
> [  156.131880] RAX: 00000000000002a0 RBX: ffff8d0305ef01b0 RCX: 000000000000000b
> [  156.131888] RDX: ffff8d03772ab924 RSI: ffff8d0305ef01b0 RDI: 00000000000002a0
> [  156.131895] RBP: ffff9bd0018dbd60 R08: ffff8d03002094d0 R09: 0000000000000000
> [  156.131901] R10: 000000000000005e R11: 0000000000000065 R12: ffff8d03002094d0
> [  156.131907] R13: 000000000000001f R14: 0000000000070018 R15: 0000000000000007
> [  156.131914] FS:  0000000000000000(0000) GS:ffff8d062ed80000(0000) knlGS:0000000000000000
> [  156.131923] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  156.131929] CR2: 000000amdgpu_job_alloc00000002a0 CR3: 000000001120a005 CR4: 00000000003706e0
> [  156.131937] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  156.131942] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [  156.131949] Call Trace:
> [  156.131953]  <TASK>
> [  156.131957]  ? trace_event_raw_event_dma_fence+0xcc/0x200
> [  156.131973]  ? ring_buffer_unlock_commit+0x23/0x130
> [  156.131982]  dma_fence_init+0x92/0xb0
> [  156.131993]  amdgpu_fence_emit+0x10d/0x2b0 [amdgpu]
> [  156.132302]  amdgpu_ib_schedule+0x2f9/0x580 [amdgpu]
> [  156.132586]  amdgpu_job_run+0xed/0x220 [amdgpu]
>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 117 ++++++++++++++-------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   3 -
>   4 files changed, 80 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 9f017663ac50..fcaf6e9703f9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -444,6 +444,7 @@ struct amdgpu_sa_bo {
>   
>   int amdgpu_fence_slab_init(void);
>   void amdgpu_fence_slab_fini(void);
> +bool is_job_embedded_fence(struct dma_fence *f);
>   
>   /*
>    * IRQS.
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 5625f7736e37..444a19eb2248 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4483,9 +4483,8 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
>   
>   			ptr = &ring->fence_drv.fences[j];
>   			old = rcu_dereference_protected(*ptr, 1);
> -			if (old && test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &old->flags)) {
> +			if (old && is_job_embedded_fence(old))
>   				RCU_INIT_POINTER(*ptr, NULL);
> -			}
>   		}
>   		/* after all hw jobs are reset, hw fence is meaningless, so force_completion */
>   		amdgpu_fence_driver_force_completion(ring);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 3b7e86ea7167..3a81249b5660 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -77,16 +77,28 @@ void amdgpu_fence_slab_fini(void)
>    * Cast helper
>    */
>   static const struct dma_fence_ops amdgpu_fence_ops;
> +static const struct dma_fence_ops amdgpu_job_fence_ops;
>   static inline struct amdgpu_fence *to_amdgpu_fence(struct dma_fence *f)
>   {
>   	struct amdgpu_fence *__f = container_of(f, struct amdgpu_fence, base);
>   
> -	if (__f->base.ops == &amdgpu_fence_ops)
> +	if (__f->base.ops == &amdgpu_fence_ops ||
> +	    __f->base.ops == &amdgpu_job_fence_ops)
>   		return __f;
>   
>   	return NULL;
>   }
>   
> +bool is_job_embedded_fence(struct dma_fence *f)
> +{
> +	struct amdgpu_fence *__f = container_of(f, struct amdgpu_fence, base);
> +
> +	if (__f->base.ops == &amdgpu_job_fence_ops)
> +		return true;
> +
> +	return false;
> +}
> +
>   /**
>    * amdgpu_fence_write - write a fence value
>    *
> @@ -158,19 +170,18 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f, struct amd
>   	}
>   
>   	seq = ++ring->fence_drv.sync_seq;
> -	if (job != NULL && job->job_run_counter) {
> +	if (job && job->job_run_counter) {
>   		/* reinit seq for resubmitted jobs */
>   		fence->seqno = seq;
>   	} else {
> -		dma_fence_init(fence, &amdgpu_fence_ops,
> -				&ring->fence_drv.lock,
> -				adev->fence_context + ring->idx,
> -				seq);
> -	}
> -
> -	if (job != NULL) {
> -		/* mark this fence has a parent job */
> -		set_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &fence->flags);
> +		if (job)
> +			dma_fence_init(fence, &amdgpu_job_fence_ops,
> +				       &ring->fence_drv.lock,
> +				       adev->fence_context + ring->idx, seq);
> +		else
> +			dma_fence_init(fence, &amdgpu_fence_ops,
> +				       &ring->fence_drv.lock,
> +				       adev->fence_context + ring->idx, seq);
>   	}


It's probably me missing something but why can't we just move setting of 
AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT
to before dma_fence_init here or even into amdgpu_job_alloc instead of 
all the refactoring ?

Andrey


>   
>   	amdgpu_ring_emit_fence(ring, ring->fence_drv.gpu_addr,
> @@ -643,16 +654,14 @@ static const char *amdgpu_fence_get_driver_name(struct dma_fence *fence)
>   
>   static const char *amdgpu_fence_get_timeline_name(struct dma_fence *f)
>   {
> -	struct amdgpu_ring *ring;
> +	return (const char *)to_amdgpu_fence(f)->ring->name;
> +}
>   
> -	if (test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &f->flags)) {
> -		struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
> +static const char *amdgpu_job_fence_get_timeline_name(struct dma_fence *f)
> +{
> +	struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
>   
> -		ring = to_amdgpu_ring(job->base.sched);
> -	} else {
> -		ring = to_amdgpu_fence(f)->ring;
> -	}
> -	return (const char *)ring->name;
> +	return (const char *)to_amdgpu_ring(job->base.sched)->name;
>   }
>   
>   /**
> @@ -665,18 +674,25 @@ static const char *amdgpu_fence_get_timeline_name(struct dma_fence *f)
>    */
>   static bool amdgpu_fence_enable_signaling(struct dma_fence *f)
>   {
> -	struct amdgpu_ring *ring;
> +	if (!timer_pending(&to_amdgpu_fence(f)->ring->fence_drv.fallback_timer))
> +		amdgpu_fence_schedule_fallback(to_amdgpu_fence(f)->ring);
>   
> -	if (test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &f->flags)) {
> -		struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
> +	return true;
> +}
>   
> -		ring = to_amdgpu_ring(job->base.sched);
> -	} else {
> -		ring = to_amdgpu_fence(f)->ring;
> -	}
> +/**
> + * amdgpu_job_fence_enable_signaling - enable signalling on job fence
> + * @f: fence
> + *
> + * This is the simliar function with amdgpu_fence_enable_signaling above, it
> + * only handles the job embedded fence.
> + */
> +static bool amdgpu_job_fence_enable_signaling(struct dma_fence *f)
> +{
> +	struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
>   
> -	if (!timer_pending(&ring->fence_drv.fallback_timer))
> -		amdgpu_fence_schedule_fallback(ring);
> +	if (!timer_pending(&to_amdgpu_ring(job->base.sched)->fence_drv.fallback_timer))
> +		amdgpu_fence_schedule_fallback(to_amdgpu_ring(job->base.sched));
>   
>   	return true;
>   }
> @@ -692,19 +708,23 @@ static void amdgpu_fence_free(struct rcu_head *rcu)
>   {
>   	struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
>   
> -	if (test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &f->flags)) {
> -	/* free job if fence has a parent job */
> -		struct amdgpu_job *job;
> -
> -		job = container_of(f, struct amdgpu_job, hw_fence);
> -		kfree(job);
> -	} else {
>   	/* free fence_slab if it's separated fence*/
> -		struct amdgpu_fence *fence;
> +	kmem_cache_free(amdgpu_fence_slab, to_amdgpu_fence(f));
> +}
>   
> -		fence = to_amdgpu_fence(f);
> -		kmem_cache_free(amdgpu_fence_slab, fence);
> -	}
> +/**
> + * amdgpu_job_fence_free - free up the job with embedded fence
> + *
> + * @rcu: RCU callback head
> + *
> + * Free up the job with embedded fence after the RCU grace period.
> + */
> +static void amdgpu_job_fence_free(struct rcu_head *rcu)
> +{
> +	struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
> +
> +	/* free job if fence has a parent job */
> +	kfree(container_of(f, struct amdgpu_job, hw_fence));
>   }
>   
>   /**
> @@ -720,6 +740,19 @@ static void amdgpu_fence_release(struct dma_fence *f)
>   	call_rcu(&f->rcu, amdgpu_fence_free);
>   }
>   
> +/**
> + * amdgpu_job_fence_release - callback that job embedded fence can be freed
> + *
> + * @f: fence
> + *
> + * This is the simliar function with amdgpu_fence_release above, it
> + * only handles the job embedded fence.
> + */
> +static void amdgpu_job_fence_release(struct dma_fence *f)
> +{
> +	call_rcu(&f->rcu, amdgpu_job_fence_free);
> +}
> +
>   static const struct dma_fence_ops amdgpu_fence_ops = {
>   	.get_driver_name = amdgpu_fence_get_driver_name,
>   	.get_timeline_name = amdgpu_fence_get_timeline_name,
> @@ -727,6 +760,12 @@ static const struct dma_fence_ops amdgpu_fence_ops = {
>   	.release = amdgpu_fence_release,
>   };
>   
> +static const struct dma_fence_ops amdgpu_job_fence_ops = {
> +	.get_driver_name = amdgpu_fence_get_driver_name,
> +	.get_timeline_name = amdgpu_job_fence_get_timeline_name,
> +	.enable_signaling = amdgpu_job_fence_enable_signaling,
> +	.release = amdgpu_job_fence_release,
> +};
>   
>   /*
>    * Fence debugfs
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> index 4d380e79752c..c29554cf6e63 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> @@ -53,9 +53,6 @@ enum amdgpu_ring_priority_level {
>   #define AMDGPU_FENCE_FLAG_INT           (1 << 1)
>   #define AMDGPU_FENCE_FLAG_TC_WB_ONLY    (1 << 2)
>   
> -/* fence flag bit to indicate the face is embedded in job*/
> -#define AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT		(DMA_FENCE_FLAG_USER_BITS + 1)
> -
>   #define to_amdgpu_ring(s) container_of((s), struct amdgpu_ring, sched)
>   
>   #define AMDGPU_IB_POOL_SIZE	(1024 * 1024)
