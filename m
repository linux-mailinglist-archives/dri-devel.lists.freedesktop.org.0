Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C795A4267AC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 12:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680726E0C4;
	Fri,  8 Oct 2021 10:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DDD6E0D6;
 Fri,  8 Oct 2021 10:21:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNk8D6fKeq9CRJHU17wGYmclL2RFEHPjdqpv76zlH1vv4X2DK19eHROi7c1+lSB6UvyKjiUsVqZl/xmfbxk2jEBE2upMPqiZIa2q7gFGP+epIyu4RXk+U85SovMzXQ8KZX1owIx/7WePL0qvfD4bAbOzT9sgPyzGgZjRqRcHAyTEsISvrCh7V3vrWiEFIArufMjAp6Ck16zPU7BM0Qfpuv+TO//Aj93panBAaisI5vV88i4A6qYqCctSvy7P7+kkcvk46sGgz8p8+OMBiRQU4vp8Rg/B/Dpfc6FlSt82vH76DwLp2cuXkWGSJhhLdeZqEMifXbbexPdMukrmgAQG/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iH95oKyI0JiQe/wT4dilUFHE3DP1ObxuUOQWtUSwTgg=;
 b=hhlTKT/DatlJFbhNW2EtQZZgABc4QNpDQq0gKa+HH3uS/3UNs0dv4dSlgvCjjl+K9pGmWRgIWo6QsgAA3P3XByT6vTrq+OVjD9WMA2nypeMaQUghL8duLGD87lqmNWUXEdzOJlmVH5WfRmoDzmnp4ZGf3LrvjBk+IcMIzBLuBTn6+Wc4Xoe9lpXZbSLJoU/5QIcEf4xvY0s3n3ils3Bqnf3suhl9e00ZSghopiZihhz64yxNMbaXMUafkKu4NKUTjEO9tT6A8bfjZ2JLYFBLyKGFkNyfsLVYRDlAG4dHi4UcYT1n4JGNxUBdek6GJOBgHqaI31Xvf968Wxr5czJv+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iH95oKyI0JiQe/wT4dilUFHE3DP1ObxuUOQWtUSwTgg=;
 b=UeLZIb8UmeS5ujzR1hj8VhnEhgaY1wB+QturfuD2RgJDamfSk7irZ98p8UBzho18WfpDh07zqckG+ejm9hKz94zywwD3xS5GcPURST4slIv69iGjBuk8TmXJL+dpsvuYji0lnJ9VHZ7iifWGt0aFEKtploqRj6wLehv/FH6N3KI=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1405.namprd12.prod.outlook.com
 (2603:10b6:300:13::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 10:21:31 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 10:21:31 +0000
Subject: Re: [PATCH] dma-resv: Fix dma_resv_get_fences and
 dma_resv_copy_fences after conversion
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin
 <tvrtko.ursulin@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20211008095007.972693-1-tvrtko.ursulin@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9eca89ab-f954-8b2a-7af5-b4a63b90eed0@amd.com>
Date: Fri, 8 Oct 2021 12:21:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211008095007.972693-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM5PR0201CA0012.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::22) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:efac:61bc:bb73:d6b5]
 (2a02:908:1252:fb60:efac:61bc:bb73:d6b5) by
 AM5PR0201CA0012.eurprd02.prod.outlook.com (2603:10a6:203:3d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Fri, 8 Oct 2021 10:21:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61f8e162-7730-4711-3838-08d98a45654d
X-MS-TrafficTypeDiagnostic: MWHPR12MB1405:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1405F517A4DBB5784B374AB583B29@MWHPR12MB1405.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KtZXxF0Ka88BlH98s8SiJQPrUrkElLfHkm2VqdKI5lpnUf4lC7Xm6BEFpcfENafF/9lkqnCR0FvSwLjcpla++cQbhxKQW1n+ER6VDR3hDNbUKXL/m3ia1sjZ3usEIU7baMBm5rs7PHDTv6vKo2Pd4Cg6WSVzF7lu6IgN5gBg15ADbZW9RrBglFmofe3pic9KBVfiqC4e/T7A1JEy9nAQfpN+fq4c+jlkIPBqbS34isX8YNQnSNUfYaidJSa4eHJJpAJSmfgKS7MYgW2z9WhW73QKXnFXQB8Lt4GIhLaiIG6/86W2X9DZ90LBqS08T39QKrodQm2/K/4qBmS7sMuSrDMOhdMHofVjeWMIwBlWZNQ0992qAdvX01iVtO1QlVJH0GFtcUbtWmyzZWA7vm+FEvwbMjiiZHMlj12rLoB23MLL+1tYNm41173xIETJSCo+5tOanMDtT3mBv499MOanv5wsgt4PyQdwwSjEW5qKNZMUYFURFxh5eroyXVSL0ZVUzEPWuvgHfTaq2G+uTUYXjkwwlfWcNMp3iQUUtNuEfnOWEvT28rpz4oSkTpzs8ZouvoaA7t/Vc/d3DfdEjJpmdXFsiIU8/qFHzg3hqpLIdwEIvh/EpTl1DhOx9emoxl0AbYSjBvwuX+zD2azo8GicSnSWjv7B2YNCl8Uh5q3zVBLljx4McrHM8h1l9wndNxNnyW7sRrcjuZQEzr/syf4HIBBBGY7EGiLntdy9lH1qyssmjT0duMNZvt+9bGzWfvhn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(966005)(83380400001)(2906002)(508600001)(8676002)(8936002)(66574015)(316002)(45080400002)(66946007)(186003)(38100700002)(66556008)(66476007)(5660300002)(86362001)(6486002)(31686004)(6666004)(54906003)(31696002)(36756003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXkwcVRjTzV0MWZmV1lFdWo5c2w0VHhWcXhTZThJUzN2S2xVa0JZK3Ztck5o?=
 =?utf-8?B?M3pKRm1iL01VRmZVMVc2VWlwanZWTEVucW5wWWg0MHBnaG9URERzSGxXY2dF?=
 =?utf-8?B?NUc2ZWZCa2phYy90VWtTcE9aN2xNcUZVOFdSWUFpd3ZmOElOTzBrS0N6bDI2?=
 =?utf-8?B?MnJZamp3M3c0K3ZHZ2M5WGkxd0x6d0ZyQTZoMlRYU3ZFY0NyS05EME9RZ0ZG?=
 =?utf-8?B?QmR4RG1LbzdJM1FJSUxtMmZueGlZSmplc1doaXloV3BkTVNUYjg1cVJkdGRO?=
 =?utf-8?B?bkRwSlN4T1JiZzNpK0FjY1R0emZidFpMdXo3YXdGKzVYdzF1Nnh4aGRMM0pY?=
 =?utf-8?B?bFJ1UHFzQ3NyaWgwY1haNjNzUG5pVU5BQzdLaExnVXJEUVVCSWRoVjV4VlAv?=
 =?utf-8?B?NXM2MFU3WlU5cVFqYTlCbGs1V0xGcVptNDcxdE5xNFcwM0UxZVNrOW9ZV2lV?=
 =?utf-8?B?U3E4d2N3WjJHS0doMi8rSk50Um1HMmQyeWNaRGYyRFl0cFN0SHdkQndXMGRj?=
 =?utf-8?B?bUVOSittbW5FWnRTV1dyMktYenBwYlNxckVBekxTejMvQkF2eVhCaGZUZ3ky?=
 =?utf-8?B?d0U3L29TM28waitGQW1yUEt3MEp6NGpNWmdKUG1hY2tzWGRsekVkOEprTnkx?=
 =?utf-8?B?UHBjekdrdVUwbW1NeFIxWGJBakRBbGlvWXNTM3FSOWpDbCtNSjBpZjhlY2t6?=
 =?utf-8?B?a1UvTnBNaFdrR0l0OTBUalp1NWtGUzZxeFJyMU0xclVkK3Ribm43QTlPZzRU?=
 =?utf-8?B?azZXUkdYM09OMDJFRVBrdzBidUZpNklLdEYrbXRlemZNQVJXTkhzYmFwMmt2?=
 =?utf-8?B?cDFiT1NVaDYxUWNRSSt5K21WQmdHTWY4eFB1UUowTjd3VnBlWkVGeVh2ekpW?=
 =?utf-8?B?NzRWQWVFM2JlamRuTW8vY0swS1JBTjlGdnlZc0xOa3h1YUliTEQ5cDZUZE03?=
 =?utf-8?B?Z0UySjdzaFJidzQ5UzhPVXJXbkdCN090T3dhbkUrWUdGR3o1SHBoOU4xQkov?=
 =?utf-8?B?ZDQ5Q0VXZVhiUFlGZnkvVGNTZDhvTEVYUG5YUWNBQ2dhZytheW5teHcxaUp6?=
 =?utf-8?B?am1ZWVgxdXF6WEY5ZERQWTNZWFU3ZXFrcUdxUXIrTUV3WExjZ2tIajdkMnpD?=
 =?utf-8?B?UW1jNmxnemdkengzdy9mUWdGYnlPT3E0bEtSQ2UxL2ZaYlBtVE8yNDYydmJ0?=
 =?utf-8?B?d2tvcEgza2xac0ZNNTBQeDNFbnU5Zm9nWW1vaXhmOGFERDB1ZGNYbUY3ZEk5?=
 =?utf-8?B?Q0RHVnpEUk1nSEJvbzJVUXRtbXdGZW1ZcU5IbW9TNlN4dXU2ZWc3ejZ5ZXUy?=
 =?utf-8?B?Q2w0Ukg2ZHFSdDJ5VHJrdzYwdGxpS3pjbktBVnJGTnFGeU1yalp0V2xnUUli?=
 =?utf-8?B?S1l2dFc4WTQ4dEJZZE4rT1pPY0xSdXZROUd0MEU0end1MXJyT05sRkZiaXFx?=
 =?utf-8?B?QVJscnVPNFRqUWg2NWJjTlkzZ05OV3hiNXRDRmM4ZFRodlJ5bkFFcm9KVnow?=
 =?utf-8?B?MXAvK3ZUbSt3amRHbzBhcUk1QW40NnpJOC9WbTBxdzFBa01jdjBwMDh5L2VT?=
 =?utf-8?B?VDQzT3NhaEE4WVhsZi9HRFZFem1zT2Y2VzMzUlJWemN0UFA0RzIvZUUyRVJp?=
 =?utf-8?B?MVdHa3oxYXFtMWJpQTlBNXc1YUJNNDRZejFWNWFlYUJrQmZ4V21FUnFsa3lS?=
 =?utf-8?B?SkZVbC8xY0Q5OTJMblIzQkVta0hMY0VTU0QvN3RmR1NCdFVveWlVRk9XVUJU?=
 =?utf-8?B?OEE2YWJTbkJ0NFVQaWxXdndweklEbjZOSDBkN0hQOUhvRDRDU3QrR3BSQ2dr?=
 =?utf-8?B?bFVadWJ0S2FETW00ajhkUi9jV1lyTE9LNU5zekh4MVR6c2N5dURSZVp6aWVT?=
 =?utf-8?Q?GyU1imDMsxwYo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f8e162-7730-4711-3838-08d98a45654d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 10:21:31.1169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUYsWU3OtEOUWW9eHp8C/71nTq21CSV0qQNag98ymxIY9LpeEsU5X3EnEeN8mYEg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1405
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

Am 08.10.21 um 11:50 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Cache the count of shared fences in the iterator to avoid dereferencing
> the dma_resv_object outside the RCU protection. Otherwise iterator and its
> users can observe an incosistent state which makes it impossible to use
> safely.

Ah, of course! I've been staring at the code the whole morning and 
couldn't see it.

Going to write a testcase to cover that.

> Such as:
>
> <6> [187.517041] [IGT] gem_sync: executing
> <7> [187.536343] i915 0000:00:02.0: [drm:i915_gem_context_create_ioctl [i915]] HW context 1 created
> <7> [187.536793] i915 0000:00:02.0: [drm:i915_gem_context_create_ioctl [i915]] HW context 1 created
> <6> [187.551235] [IGT] gem_sync: starting subtest basic-many-each
> <1> [188.935462] BUG: kernel NULL pointer dereference, address: 0000000000000010
> <1> [188.935485] #PF: supervisor write access in kernel mode
> <1> [188.935495] #PF: error_code(0x0002) - not-present page
> <6> [188.935504] PGD 0 P4D 0
> <4> [188.935512] Oops: 0002 [#1] PREEMPT SMP NOPTI
> <4> [188.935521] CPU: 2 PID: 1467 Comm: gem_sync Not tainted 5.15.0-rc4-CI-Patchwork_21264+ #1
> <4> [188.935535] Hardware name:  /NUC6CAYB, BIOS AYAPLCEL.86A.0049.2018.0508.1356 05/08/2018
> <4> [188.935546] RIP: 0010:dma_resv_get_fences+0x116/0x2d0
> <4> [188.935560] Code: 10 85 c0 7f c9 be 03 00 00 00 e8 15 8b df ff eb bd e8 8e c6 ff ff eb b6 41 8b 04 24 49 8b 55 00 48 89 e7 8d 48 01 41 89 0c 24 <4c> 89 34 c2 e8 41 f2 ff ff 49 89 c6 48 85 c0 75 8c 48 8b 44 24 10
> <4> [188.935583] RSP: 0018:ffffc900011dbcc8 EFLAGS: 00010202
> <4> [188.935593] RAX: 0000000000000000 RBX: 00000000ffffffff RCX: 0000000000000001
> <4> [188.935603] RDX: 0000000000000010 RSI: ffffffff822e343c RDI: ffffc900011dbcc8
> <4> [188.935613] RBP: ffffc900011dbd48 R08: ffff88812d255bb8 R09: 00000000fffffffe
> <4> [188.935623] R10: 0000000000000001 R11: 0000000000000000 R12: ffffc900011dbd44
> <4> [188.935633] R13: ffffc900011dbd50 R14: ffff888113d29cc0 R15: 0000000000000000
> <4> [188.935643] FS:  00007f68d17e9700(0000) GS:ffff888277900000(0000) knlGS:0000000000000000
> <4> [188.935655] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4> [188.935665] CR2: 0000000000000010 CR3: 000000012d0a4000 CR4: 00000000003506e0
> <4> [188.935676] Call Trace:
> <4> [188.935685]  i915_gem_object_wait+0x1ff/0x410 [i915]
> <4> [188.935988]  i915_gem_wait_ioctl+0xf2/0x2a0 [i915]
> <4> [188.936272]  ? i915_gem_object_wait+0x410/0x410 [i915]
> <4> [188.936533]  drm_ioctl_kernel+0xae/0x140
> <4> [188.936546]  drm_ioctl+0x201/0x3d0
> <4> [188.936555]  ? i915_gem_object_wait+0x410/0x410 [i915]
> <4> [188.936820]  ? __fget_files+0xc2/0x1c0
> <4> [188.936830]  ? __fget_files+0xda/0x1c0
> <4> [188.936839]  __x64_sys_ioctl+0x6d/0xa0
> <4> [188.936848]  do_syscall_64+0x3a/0xb0
> <4> [188.936859]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>
> If the shared object has changed during the RCU unlocked period
> callers will correctly handle the restart on the next iteration.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: 96601e8a4755 ("dma-buf: use new iterator in dma_resv_copy_fences")
> Fixes: d3c80698c9f5 ("dma-buf: use new iterator in dma_resv_get_fences v3")
> Closes: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Fintel%2F-%2Fissues%2F4274&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C0a73b5d07f5f44cdc5a808d98a4109f9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637692834972816537%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=jhcO2Q8bGhLTW7b4%2BNn4TE3UCwBbAcQVuceJEwDK0fg%3D&amp;reserved=0
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org

Maybe we should remove cursor->fences altogether, but either way the 
patch is Reviewed-by: Christian König <christian.koenig@amd.com>

Please push to drm-misc-next ASAP.

Thanks,
Christian.

> ---
>   drivers/dma-buf/dma-resv.c | 18 ++++++++++--------
>   include/linux/dma-resv.h   |  5 ++++-
>   2 files changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index a480af9581bd..7b6d881c8904 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -333,10 +333,14 @@ static void dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
>   {
>   	cursor->seq = read_seqcount_begin(&cursor->obj->seq);
>   	cursor->index = -1;
> -	if (cursor->all_fences)
> +	cursor->shared_count = 0;
> +	if (cursor->all_fences) {
>   		cursor->fences = dma_resv_shared_list(cursor->obj);
> -	else
> +		if (cursor->fences)
> +			cursor->shared_count = cursor->fences->shared_count;
> +	} else {
>   		cursor->fences = NULL;
> +	}
>   	cursor->is_restarted = true;
>   }
>   
> @@ -363,7 +367,7 @@ static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
>   				continue;
>   
>   		} else if (!cursor->fences ||
> -			   cursor->index >= cursor->fences->shared_count) {
> +			   cursor->index >= cursor->shared_count) {
>   			cursor->fence = NULL;
>   			break;
>   
> @@ -448,10 +452,8 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
>   			dma_resv_list_free(list);
>   			dma_fence_put(excl);
>   
> -			if (cursor.fences) {
> -				unsigned int cnt = cursor.fences->shared_count;
> -
> -				list = dma_resv_list_alloc(cnt);
> +			if (cursor.shared_count) {
> +				list = dma_resv_list_alloc(cursor.shared_count);
>   				if (!list) {
>   					dma_resv_iter_end(&cursor);
>   					return -ENOMEM;
> @@ -522,7 +524,7 @@ int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **fence_excl,
>   			if (fence_excl)
>   				dma_fence_put(*fence_excl);
>   
> -			count = cursor.fences ? cursor.fences->shared_count : 0;
> +			count = cursor.shared_count;
>   			count += fence_excl ? 0 : 1;
>   
>   			/* Eventually re-allocate the array */
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 8b6c20636a79..3e1bff147428 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -170,9 +170,12 @@ struct dma_resv_iter {
>   	/** @index: index into the shared fences */
>   	unsigned int index;
>   
> -	/** @fences: the shared fences */
> +	/** @fences: the shared fences; private, *MUST* not dereference  */
>   	struct dma_resv_list *fences;
>   
> +	/** @shared_count: number of shared fences */
> +	unsigned int shared_count;
> +
>   	/** @is_restarted: true if this is the first returned fence */
>   	bool is_restarted;
>   };

