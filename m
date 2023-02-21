Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4E469E485
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 17:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FDC10E877;
	Tue, 21 Feb 2023 16:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478CD10E349;
 Tue, 21 Feb 2023 16:26:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAj9cfD6Wui8jvtsdUuG5GHEdpMaluGkB85BjkfxNd5qCCs3GsZ5a2Zk26Jv2JAVhen+0qms6zPxnwnHdq64P2sio9NIjgXDK6bv/s+mj5IjY1gwfKl5n8n51Tz1Z1O9knLnCGka2msWHBAJrAS9tgyeAFvJEs5Knud1XqIEOnh/jHcGXIkZefcWQiCAQEnJCiWFWRC648CBkg63hOBAIZvY2Q2sfNEt7TLSd3xOJ2mkz02DSoUJokoI7ZqahdcPcRFXe8vDoNq9eTJpeacWsT+O4PW7TZ/ozOS6TYANezbqc/DrWX3vKt2Oyb4XtcFgt5jPybRFmlbJg5QLy4Sedw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vl9hI/8i/Gyx0uJOfs16WFqki5J76hnlaHtU0cFiNf8=;
 b=FURkbv5Zad1YSKCGGCOjw8cRTzgfh6DwNcQ84JeSF8h7ltqWgm0yivq9f7Mk3GeMLubmppPRyi2uTPoPWaaAB3duL/8RgsRo3alNK4UdiM0PAVqm5RfNTjx0KqrSJ+k63WQa7mnvRjY+I9aqT7UQOTE3RIM824seZLuP0YY1C0UkILjTfX8npAQLD6AxoF3bI5yx8j5fxQkHVHmFrpp88noyReUv5Vu4VRpTq9XR2cJsmsaQyNjKlZ5pQo0B9if9La07b91r7FP7fkye+soYDNfJFHh53ZYxDlgPvLgcUFpViCfs6ph4W8fhgihboGp7TWTm9xXlVifd/py35fzMXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vl9hI/8i/Gyx0uJOfs16WFqki5J76hnlaHtU0cFiNf8=;
 b=HezfDbQtj15ps6fg56uuhF9BXFVOclqqr1butuK/FxM/GQwBP9OVmKPu7uNJSxWFDcKCD8hpr4d4RW2z1HDWkspu8saq5kh12w4acYfgbQlHxIjFAOQr4aPQmv0OyrNiKx/nXLRyV3mO7R6f1HxzOO6Fm7hQhVFH5SMcuIAPV3A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB6472.namprd12.prod.outlook.com (2603:10b6:8:bc::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.20; Tue, 21 Feb 2023 16:26:40 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da%5]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 16:26:40 +0000
Message-ID: <48e5eae7-4848-3aa2-2cb4-5c7ba32a9848@amd.com>
Date: Tue, 21 Feb 2023 11:26:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/amdkfd: Fix an illegal memory access
Content-Language: en-US
To: qu.huang@linux.dev, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch
References: <eb49be7c44ae95c4d18e66b59874ef1c@linux.dev>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <eb49be7c44ae95c4d18e66b59874ef1c@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: QB1P288CA0027.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::40) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM4PR12MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: f801e6a0-1f98-461c-b5f2-08db1428694d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IPyLFqR7mRtTae4r+vZf6U78sHu6hiD1IWNBaSWl9aKgGcQp2UyFY7H7T/LTK6YxReI8r1oVT959azkKyJ4F+ouXd+oFZ8Y6xcarcaOMYsGVkrSes4dPu5WNzcBTY7IhSyre1HBHzFDdzwwfQtsVIzc80O4bosoU5/ZFSjodF2Fp7S76vFiWXBwtOaMRQsTtnFBjfAPB77mirdd3JevLJrjq0NzAPUbrPgJnClbPmJqejVns9g37xq1wC8+o8SeoMjlK3j+2HCdyrLpoVRHnAo346KWyH2pOw6IV2I8q5rTIjDVppr3V+4ZbtTWBuZwgxrml1Kozi+jDda93m/NIbMBDUp2AC84zKNv9khgUjRsxuuZl0H9ZB3CFA0hfX4B7PXCMvMqrqdmbIRkLt4HCEOxItnKseq+E63hQ4b71PB5++0QDteOGOQwmnoamlNmdm/kV0UxZpoa9c2RNmqhOIAO+YkjCEzKKJ3f6VxOHXdCPQ06hqQ2t6C0uMt9RbrB3gd6gNnggIZ0Bhwfps5noGef0uoO3l2kWkiN4/lZ98uFhBLxvgduX51Old5vV5djQmnQTw5MhixMRaBsAia6aRKQzsb38drFqvAGsiUUTmpjrahHsehMjAwlYeHT83j0p9KUhd3MruGvZsicAPsYNngvrUHJUsOHZSVGikDAcdxgHPBM8g4WWw/wRna0Hl+XwbHL1J1hm0PjOynvPTHYhGyh54uIVtPMgyuvoc4TaLqM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199018)(6512007)(8936002)(186003)(5660300002)(26005)(2906002)(6506007)(2616005)(38100700002)(53546011)(44832011)(31686004)(41300700001)(6666004)(8676002)(6486002)(66476007)(4326008)(86362001)(316002)(83380400001)(66946007)(66556008)(36916002)(478600001)(31696002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2N5dkFVL1BLMENIcXlwMEVFdEgyN2V0VVFJdG5jRkZMa0RpamJzRU9oUmU0?=
 =?utf-8?B?anhxeS9DRVBucXRLNVFMNGJna1p3dmJkYWVxMjZHQUgveU5mR2xRN05WTndn?=
 =?utf-8?B?ZGNOVWRiMllEYXdybTgvVVBRVmZjZncxUmM5eUxReHA1QVhSajF1ZER1Nmdi?=
 =?utf-8?B?NVp3a2dsNmlxdW9JS1FKcXZQNitBMmVzNXlZYlBXaUIwYVRid05uVVErcnJB?=
 =?utf-8?B?NEJORVVWWlBPa1pBZU9nRnRSV1ZJU1ZpRFdqVk8zT1Z2ZDJFWjY3dUh3cU9J?=
 =?utf-8?B?TkkzZERIL3FCOWc1bWZua08rQVBDT3ZUK3FyMFhpWDRYR2xqOW9ORGR2bnNo?=
 =?utf-8?B?aUd2a2Y2UXRCanhxbDJVRkRpeCtaM2JkL3RDUENnNGxsTUd3WkZWK1NweXZu?=
 =?utf-8?B?TnB3R2Y5QjBHRGVsSEY0VW16NDcwSmpSVXg1SWxUOGtTa0JEK0NHNU9iZUxL?=
 =?utf-8?B?UitXT2F0eTU1Wnd3QTZPQzV0NFd2azFnMngvem01ZVlWZHlQUmlSeEl0UXlT?=
 =?utf-8?B?cm5HeUF5VmZ4WXNvaXdrbXViNnFPUzM4cUtWRTkzOENLUnF4c2dpeVRwU1Nj?=
 =?utf-8?B?WnFrUURZRnpDRVZMYlpmSHlUTTBTdElBaHlmdHBIVkFqbHhYZ0JwTzlvWmUz?=
 =?utf-8?B?RjVTNWxocm03aUVpRGsyeTlpeWIrVEtleHRydlZoTG9GbDJ4TFR0R09ML0N5?=
 =?utf-8?B?V2xqbGsydi90c251T1hyYzNYOEw1aE9Fd2RSd3QwTGtMakdZbGM0ajZDU2ZR?=
 =?utf-8?B?dXc3Z0ZIc2JFK05YL3RIbHYwZzVyYVlzU0lKa3BJMXJUYnh3STRGeWh6eFlI?=
 =?utf-8?B?Wk9qM0lCL2J1VmF2RkZEbVc1a3habUp5THVjNDRobHZ4a0o2cHVNMFFqcTV3?=
 =?utf-8?B?cUN1WkxXTHJqWmFtV3cxUlpxUDh5UTlLKzVRcnAwRlBQRFpaSEwxQVl0WTVq?=
 =?utf-8?B?YktwSUY2MzZLRjJNS0xSKy81L1luVzZDQjN6TGJ3VG1sRDc5cGlKM01HS3Fz?=
 =?utf-8?B?WmFlcFl3aGU3Z3ZWczIvTlZEbmVTTE1sYnY0TEoyR3NTM2FvZzFZRXZVTFYz?=
 =?utf-8?B?QkJMRGs3R1JvTzRvS2FtUmtNaVdsWk9OaUVvYWxhQ0NKZXlmclBWazFVNmQx?=
 =?utf-8?B?SjcxY0RJQTRONWRneHRMTFR6cVhKeGYrRHJUbStCbExzS2UxeW81V0htTUFw?=
 =?utf-8?B?cnNLSFRGZmxKZG0vSm92UjcyWmJ5TGFLMjE2cWNNOHQvdHlyQ3o2M0thZlM5?=
 =?utf-8?B?MDdWaVRiMXNBalVmOTNUamFjcjB5eGwwb210V3hWZy9yT1dGM3BGR25CamFY?=
 =?utf-8?B?NWlOVEp5aWFBTy9ydGJrcDVLWjM0Q1QvcGxoemk0Vkg4VTNpcGJ6cnVGMUVa?=
 =?utf-8?B?U0F2S3hsQ2FpenplWjhjZzBORzcvdEd5eEY5Y1FGWm9ndmZDQ3dub0pBaG1D?=
 =?utf-8?B?d2tYbk01QTJQdnFHYkw3eHlKOHBMRFRiZ3o4TEIwNXR5cSs3L1Mxd0ViYVRN?=
 =?utf-8?B?V2x3dWFtalUzREEvV3JSc2RWKy8zRUZ1RzBOUkdJZ2JrVlVQYkxzNktZOEU1?=
 =?utf-8?B?eWxHc1hHRWhmU2E0MXQ3U3NocmY0NDJzT08vRWpydU5jM2NWWjVGcUE4dE1q?=
 =?utf-8?B?dXBQVWlXVDE5aGF1OHc3ZlRBTXdmVkJvYU4wZkFlbmlIV29SSWRCSWN1ano4?=
 =?utf-8?B?b2hJQ3owVDlxc0Z0TzFBY002N00xSHNMQVRtRTh4N2NGK2dPWS8vdkoxZFg3?=
 =?utf-8?B?ekZUM3A0a2tGZE1RcHlncUh5WTZEME91ZmN2L3ZEaTh3UmRvVFhxSGloc2tp?=
 =?utf-8?B?SjNJTTJtQjlaSVM4MVZ2djJuT1d1Y2JjdFozMkt2QmU1UkFWQU1RMWxCczVu?=
 =?utf-8?B?QTFSWFJuNFVLczFuc0NBeU5xUUlSUXlQTXkrL2R6MkVSeFdUV3pHanFrZm11?=
 =?utf-8?B?dUFGOTVxdXd2NWZicWVyYzBGZ0gzdllyeVpqd3JINEQ5aUtJaDFTN2JsZWZD?=
 =?utf-8?B?WGErMVpjSFpxYUdzdC9pNitFVG1CQWZjOWtsVi9HUjhjeE5HRXFndmMrODlS?=
 =?utf-8?B?VFZKZkRReU1pVWhqNWU1a21ObGlPc3NxdHVBMGFUTDRlaHVWdzA0bmFKWk5P?=
 =?utf-8?Q?L5Sz7jaCY6bR1ZP/GF9/yLy9e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f801e6a0-1f98-461c-b5f2-08db1428694d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 16:26:40.2254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PidKQ5k5LHq3cNKz5qvmhUN7bJDoWzOfxHh5bc4fZgZwfIcoevctXRJ24KK+fPDR6AycV+ad3aCZnq1s3uKysQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6472
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-02-21 06:35, qu.huang@linux.dev wrote:
> From: Qu Huang <qu.huang@linux.dev>
>
> In the kfd_wait_on_events() function, the kfd_event_waiter structure is
> allocated by alloc_event_waiters(), but the event field of the waiter
> structure is not initialized; When copy_from_user() fails in the
> kfd_wait_on_events() function, it will enter exception handling to
> release the previously allocated memory of the waiter structure;
> Due to the event field of the waiters structure being accessed
> in the free_waiters() function, this results in illegal memory access
> and system crash, here is the crash log:
>
> localhost kernel: RIP: 0010:native_queued_spin_lock_slowpath+0x185/0x1e0
> localhost kernel: RSP: 0018:ffffaa53c362bd60 EFLAGS: 00010082
> localhost kernel: RAX: ff3d3d6bff4007cb RBX: 0000000000000282 RCX: 00000000002c0000
> localhost kernel: RDX: ffff9e855eeacb80 RSI: 000000000000279c RDI: ffffe7088f6a21d0
> localhost kernel: RBP: ffffe7088f6a21d0 R08: 00000000002c0000 R09: ffffaa53c362be64
> localhost kernel: R10: ffffaa53c362bbd8 R11: 0000000000000001 R12: 0000000000000002
> localhost kernel: R13: ffff9e7ead15d600 R14: 0000000000000000 R15: ffff9e7ead15d698
> localhost kernel: FS:  0000152a3d111700(0000) GS:ffff9e855ee80000(0000) knlGS:0000000000000000
> localhost kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> localhost kernel: CR2: 0000152938000010 CR3: 000000044d7a4000 CR4: 00000000003506e0
> localhost kernel: Call Trace:
> localhost kernel: _raw_spin_lock_irqsave+0x30/0x40
> localhost kernel: remove_wait_queue+0x12/0x50
> localhost kernel: kfd_wait_on_events+0x1b6/0x490 [hydcu]
> localhost kernel: ? ftrace_graph_caller+0xa0/0xa0
> localhost kernel: kfd_ioctl+0x38c/0x4a0 [hydcu]
> localhost kernel: ? kfd_ioctl_set_trap_handler+0x70/0x70 [hydcu]
> localhost kernel: ? kfd_ioctl_create_queue+0x5a0/0x5a0 [hydcu]
> localhost kernel: ? ftrace_graph_caller+0xa0/0xa0
> localhost kernel: __x64_sys_ioctl+0x8e/0xd0
> localhost kernel: ? syscall_trace_enter.isra.18+0x143/0x1b0
> localhost kernel: do_syscall_64+0x33/0x80
> localhost kernel: entry_SYSCALL_64_after_hwframe+0x44/0xa9
> localhost kernel: RIP: 0033:0x152a4dff68d7
>
> Signed-off-by: Qu Huang <qu.huang@linux.dev>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_events.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
> index 729d26d..e5faaad 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
> @@ -787,6 +787,7 @@ static struct kfd_event_waiter *alloc_event_waiters(uint32_t num_events)
>   	for (i = 0; (event_waiters) && (i < num_events) ; i++) {
>   		init_wait(&event_waiters[i].wait);
>   		event_waiters[i].activated = false;
> +		event_waiters[i].event = NULL;

Thank you for catching this. We're often lazy about initializing things 
to NULL or 0 because most of our data structures are allocated with 
kzalloc or similar. I'm not sure why we're not doing this here. If we 
allocated event_waiters with kcalloc, we could also remove the 
initialization of activated. I think that would be the cleaner and safer 
solution.

Regards,
   Felix


>   	}
>
>   	return event_waiters;
> --
> 1.8.3.1
