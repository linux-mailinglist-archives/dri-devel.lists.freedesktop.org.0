Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D1548A274
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 23:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4067710E342;
	Mon, 10 Jan 2022 22:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2071.outbound.protection.outlook.com [40.107.95.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A3110E213;
 Mon, 10 Jan 2022 22:08:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8TUO7MJcmy+jEBPmUUWF1fq6bGjdAenfmOOVxqMZa+79PXp0ThibkMss2hj+sz3ceEdA89aMEFFq/m5b+SJ3IhV/tvDnDxLdlZtvN89+H4PhHs+8OqZx/I5g/Vw2Pv+99vnVKtjp/kzkLdSpK5+yceCjaYDWa5wdUJC9wOAKZfxr4TmcpJhiUFdJgsa68oXeOR9GM+KPXjxAbXob2qFrO4H2uE9vBGJzzU+EfcecL1n0lt82xh3Q4cIQBpbZhmHtO3yCQ41vZxoVHK+e9ib94WxnxDVH1XR9HlDyXCVJGhnxTrzMCr4shaZjN9gKRdaKKSvB8AC+KJMOSBdwvxUCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlPQQWZuqRG/tWLiyE836D1wl1EZR9BGgQev1wS2W+U=;
 b=HRD6JMxsSN6d1iQ6slPlwDzDFCfFrrhWXLgs1bj+DiDHg1wCdNoB1TXA4D8BTCaXBwBR+jCMG0rJ2fKHk2cWYBYwLp7Ml+DQ0sNKYb5cQYNXVXLAihXdJfK+VH0Ufc5gmWoj6CFJpt/siwqmwrNtwkw+WEkvfYiYVDtfoPutJo+z+ASNq81AR8chRcmryo70+9HHbb7qE6+B6/eBGfbxVA6fCiyczAGuzKOQsA4nS5ehtyPm6KEL7xhzCe83Q0Pcm88tNr2J2CY/Oh4dCt898T07oOf0V7lxO8V5W9Q6oLjM4B1rnnw4dvtAHO7cfXHrHu8CXqumczZuX3XNPIxBzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HlPQQWZuqRG/tWLiyE836D1wl1EZR9BGgQev1wS2W+U=;
 b=O5tD3JwBt/d7aBQ+xyfx7sTpnhgPKNo0xsQg2gplb6u2Ll0Vljeqv1qPqLhafKvYBSoCr4nI5kxNKgZtdDjps0cw5vqyQPw4zWbi6Y19lO8U5X05nRzRSnseiudvdhUmnwnrxzQAZva4pYI1ylaZojQAw1jhQdUHXMJ2bvbQg2I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5353.namprd12.prod.outlook.com (2603:10b6:408:102::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 22:08:28 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 22:08:27 +0000
Subject: Re: [Patch v4 03/24] drm/amdkfd: CRIU Introduce Checkpoint-Restore
 APIs
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
 <20211223003711.13064-4-rajneesh.bhardwaj@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <f951514c-4aac-7478-bc49-c41b6a8189fe@amd.com>
Date: Mon, 10 Jan 2022 17:08:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211223003711.13064-4-rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: CH0PR03CA0437.namprd03.prod.outlook.com
 (2603:10b6:610:10e::17) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd5a3c9d-f858-46f0-4ad6-08d9d485ba80
X-MS-TrafficTypeDiagnostic: BN9PR12MB5353:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB53539AF621A3D6402C18C22192509@BN9PR12MB5353.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6nFLkCZ+CESgItPYo+4KQvNYUQvr4q/gAOd7IhvPvh8ynvzSira8dKCw6r6EmygyqxRUD9e6ybNw18s3cnhkbvWHCCZmWu+a28igfnFQDNPukUb1PO6vHv0xVDABxKq62higjUYzAIkWf0Swa/f+mQdF1Novw69rjJIb1N85hJkWtY3SnBfo4QB+3NVaDEJ1Dy1o59Qs70FyCe0uABaKpK8pxKar2KAdL8aTrrrhbq0K/3iS86s8qFxtRbzqTSZrGHOqebxnx9bIt09otCP6CBClBq59as5W/nXlMSnGWuMJibPVLivKxcDpYeOqIWJNP53w0ad0utaRbRSwQF0E9TecrqHxAebN0FDwcSiRKfV6Kc9tqs5mdC2Ti7IrPZr1TnzawYTjT6FEutok0+FVDtWN26WWvrRJMgRgcFmNNB/tc90O8cQc3jSVUM9GJ1BEuT8gdNXMcTs3ybvXCVJzgTPPiJ0bbnObPVRidOuUCa5gbCDlTspa2l40Oocw3WeyM1MkZhEx6NC9R446pHZQisocGr6Lo4oqVvhbczD3Ux3mzWgrBOi0dg+N1Gg3m/NL+9lIOXAhF4THE29wk6/Ug9OseERxz/x59wMCNCd7qwFr53UWnPu/yKJLlY+4z+Q9/EMrK6u6yDybMJ0dW2bFe/vFKsB/0PMATHKd4ESt+WKh5qinjBZ9RPTTC4kL4HaDsBL7UlMM+fSsekMjlVe0Mvn/R0G3QsXBSirunPZ/J7TzBF8Hs8E29KEI9Bm/B6wb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6512007)(31696002)(31686004)(5660300002)(66476007)(66556008)(30864003)(66946007)(8676002)(38100700002)(53546011)(44832011)(316002)(36916002)(26005)(6506007)(2616005)(186003)(86362001)(8936002)(2906002)(6486002)(4326008)(508600001)(36756003)(83380400001)(4001150100001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEFBek5rbTAyNTNwcEllZDhCaEpKMlFqcDFab29ubGhXcWlyaXcrbDQyVTBM?=
 =?utf-8?B?bGhObUJjR0x1V21yWEtoczZIUEJ3K3k0NEF3YkZqdExJT3kyTys1Z3JlMnF6?=
 =?utf-8?B?d3c2WVJQWWZjQmRteFlWSXJNWWQ0WkVNeU5XWVZjRHRlVVZ4QTkyb2x2YXhn?=
 =?utf-8?B?TTRnT0hFZUxmU2RtME5DdzR1bEhZZUxQaHJ1RDdXNjR6Y3hQaUdaR0lCRHlV?=
 =?utf-8?B?THhrQ1ZzYktzbmt5aklORVRCMzF0WjRzUnF1aFpYbWZWa3VTTWhMZzJkY0gw?=
 =?utf-8?B?NmhwcWR6bXFnV2xESUZ6cUUyZUlTbUNzc2hXSktsd2RzcVlIUWhMUkJ6RGFB?=
 =?utf-8?B?UE1UaytYYit6U2FaU1NKMnQ1QW1SMFNOSmdmRTdGZUQ0eG56MHVUMVlyV013?=
 =?utf-8?B?bC9HUHdieEh4dkl5V1hzaTZqL1RnTnRmcld3RmwzNkhVekd3aXpJa2JWWHVS?=
 =?utf-8?B?M1BqTU5rVnVydmFnOTA2Q3lPaS95WnJUekpmbjF0M1VnMmVDT3VkbkY3M1RO?=
 =?utf-8?B?ODk4ejRDcWZOLzNLQmVSN0lnOFRSblE5dDd5M3NSK3RMZ002SFdBeXdTY1ZG?=
 =?utf-8?B?V25KRlRWZWhqVGlGb3VzdVZKd2dZeGhPdExra3pUVVdCWWxDUWxTNzgyRVRS?=
 =?utf-8?B?em8rYTlSN1F1UEgySnpva3ZYWVNReU11UWhkUnBBTC9KTEwvNi92OHJ3SVJF?=
 =?utf-8?B?bUljbkhDM1RvaktKUEhUbHk2TytYRm4zVFlyYVNWWmNLaEdyalFUQzJXTG1p?=
 =?utf-8?B?aS93RzlCTWtwQkU5V05xUU4ycDBIdnlJUFY1bWhJenFlT2Jqblh4akptMHVs?=
 =?utf-8?B?NHEzam96ZFQ3c3dIejRHZVdlTHVSL0NsbnRlY1VnRWFmR0F0bnNUajlzbk96?=
 =?utf-8?B?V2I5ZDdVMVV0K2JZaHM3ZktGMGxobFkyY1dDcmwwNElOUFIzWGRkSGRHYjZU?=
 =?utf-8?B?NTgvREJxTFBXQnFSUHd3bEhYS0N1UGJiK2x5MlBDUWJJeFJ2bmVRWUgxVFJs?=
 =?utf-8?B?MzE0cFE5VEo3SHFGaTlPOGNMYWp2RFJGUkZ1SnB5YmxQYkpJREdqQi91YlZk?=
 =?utf-8?B?YWRiTkdiS3JZazBVTFc0VmQ2aWlndXBqZmVNUUxUQUs1M0Y5SDNsTFJNVjJw?=
 =?utf-8?B?S2ZMbTI1cCt4bnRrR1U2cWc2UjJhbHIzbFpyVDJzN2F1SEtyYlJOLzhtdVox?=
 =?utf-8?B?cUJydUZkQ2RvOXZGVytveUNWYlQxMXJTeUtDc3ZTWE04QmpzbW16MjlyTmps?=
 =?utf-8?B?bVV2OXdMTjN2UVl3U09YRkMyOWR2WDRpazVWTytNUjR4TGs1UmYybDA2bXZs?=
 =?utf-8?B?dzVlT3hCSHd3Y1dpTmVseVpoWlFKVWpGRWxXYjFkQmtXSkFWNlpMTVduQUR3?=
 =?utf-8?B?V3IvZmx3K3ZtYmlrRUJodlRFWFA3L2hhSDk3MDU3VTUxSWZnMFg1Y09NbW51?=
 =?utf-8?B?M1Q3YWt1VGtqZkJKdUlYbE9SMk9RRy9hUUp5elhCWnFHSGJEemNDTEhOL2pM?=
 =?utf-8?B?VlI3eENhb2tKcjgycCtiYlJXUE9XMDB2aVVJb1IxSkNRUWFqbUFROUxuK2ZT?=
 =?utf-8?B?TmhVUkFGZ2tFak8rVElVWm9GckVzNUtYeitiY2l0dlNFQW5rMlM3c1BHcThE?=
 =?utf-8?B?WVc2OTZEN2ZwVktCblcvWHVIZEdwQ2hKeDlaYWpHdER6b25PWk1ta1kwcVpo?=
 =?utf-8?B?OFhDWUVOVjZRUFVGbXc3cmVObUptS2NXTTJPTTRINTN0MkF6bG1oN1FOSjQ1?=
 =?utf-8?B?MjZNb0hUcXp3d1c5YWVyRjRobWdtSFpwNW9uN3c4ai9OZitYaXRmdlJCcnQ2?=
 =?utf-8?B?S05GNTl1VHMzemJacUZEc2I0eUMzZGRLbG4xNkJ1WjVXL1o3cXpWbmtoYkVO?=
 =?utf-8?B?Yzd6N0d1ZHpZemVkajhnMzFZMkd5RXBtT2pDRmFYaVU5WDJwV0F3SlZBYzN6?=
 =?utf-8?B?c1o5T1VoUzNpa1hwRnB1cnR2V3NBTXhIelZZOTdRR1RJMXB3ZkpmR3liVTB2?=
 =?utf-8?B?TVNodll0T3hIOU43aFJGNUhSZ1d0alZyZUU2YjQrUDlydnpTTDF2bXZZeGFp?=
 =?utf-8?B?eGtwNTVnWEhvUnIzYzNQUXE0ODlWUU1VQ3NBWnhXclFzMmh5WUJTWjY1SGZB?=
 =?utf-8?B?anBHd1VvNEs2U21hOXlKYW9wVHBselA2NE93WmZ6MUt2QkhPWUIyNFZRQ2Zp?=
 =?utf-8?Q?aFMatRmjilyhhkdOF2W3Vvc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd5a3c9d-f858-46f0-4ad6-08d9d485ba80
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 22:08:27.5750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fl2muLjnPKlo9IBYlYk0U7S29sd+sO6/Jx+6ObPnP+bZEGnogJNA1fFCWe/2XUDfasuQiTCuVXNKct9OlZsxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5353
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
Cc: alexander.deucher@amd.com, airlied@redhat.com,
 David Yat Sin <david.yatsin@amd.com>, christian.koenig@amd.com,
 daniel.vetter@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-22 7:36 p.m., Rajneesh Bhardwaj wrote:
> Checkpoint-Restore in userspace (CRIU) is a powerful tool that can
> snapshot a running process and later restore it on same or a remote
> machine but expects the processes that have a device file (e.g. GPU)
> associated with them, provide necessary driver support to assist CRIU
> and its extensible plugin interface. Thus, In order to support the
> Checkpoint-Restore of any ROCm process, the AMD Radeon Open Compute
> Kernel driver, needs to provide a set of new APIs that provide
> necessary VRAM metadata and its contents to a userspace component
> (CRIU plugin) that can store it in form of image files.
>
> This introduces some new ioctls which will be used to checkpoint-Restore
> any KFD bound user process. KFD doesn't allow any arbitrary ioctl call
> unless it is called by the group leader process. Since these ioctls are
> expected to be called from a KFD criu plugin which has elevated ptrace
> attached privileges and CAP_CHECKPOINT_RESTORE capabilities attached with
> the file descriptors so modify KFD to allow such calls.
>
> (API redesigned by David Yat Sin)
> Suggested-by: Felix Kuehling <felix.kuehling@amd.com>
> Signed-off-by: David Yat Sin <david.yatsin@amd.com>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 94 +++++++++++++++++++++++-
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h    | 65 +++++++++++++++-
>   include/uapi/linux/kfd_ioctl.h           | 79 +++++++++++++++++++-
>   3 files changed, 235 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 4bfc0c8ab764..1b863bd84c96 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -33,6 +33,7 @@
>   #include <linux/time.h>
>   #include <linux/mm.h>
>   #include <linux/mman.h>
> +#include <linux/ptrace.h>
>   #include <linux/dma-buf.h>
>   #include <asm/processor.h>
>   #include "kfd_priv.h"
> @@ -1856,6 +1857,75 @@ static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
>   }
>   #endif
>   
> +static int criu_checkpoint(struct file *filep,
> +			   struct kfd_process *p,
> +			   struct kfd_ioctl_criu_args *args)
> +{
> +	return 0;
> +}
> +
> +static int criu_restore(struct file *filep,
> +			struct kfd_process *p,
> +			struct kfd_ioctl_criu_args *args)
> +{
> +	return 0;
> +}
> +
> +static int criu_unpause(struct file *filep,
> +			struct kfd_process *p,
> +			struct kfd_ioctl_criu_args *args)
> +{
> +	return 0;
> +}
> +
> +static int criu_resume(struct file *filep,
> +			struct kfd_process *p,
> +			struct kfd_ioctl_criu_args *args)
> +{
> +	return 0;
> +}
> +
> +static int criu_process_info(struct file *filep,
> +				struct kfd_process *p,
> +				struct kfd_ioctl_criu_args *args)
> +{
> +	return 0;
> +}
> +
> +static int kfd_ioctl_criu(struct file *filep, struct kfd_process *p, void *data)
> +{
> +	struct kfd_ioctl_criu_args *args = data;
> +	int ret;
> +
> +	dev_dbg(kfd_device, "CRIU operation: %d\n", args->op);
> +	switch (args->op) {
> +	case KFD_CRIU_OP_PROCESS_INFO:
> +		ret = criu_process_info(filep, p, args);
> +		break;
> +	case KFD_CRIU_OP_CHECKPOINT:
> +		ret = criu_checkpoint(filep, p, args);
> +		break;
> +	case KFD_CRIU_OP_UNPAUSE:
> +		ret = criu_unpause(filep, p, args);
> +		break;
> +	case KFD_CRIU_OP_RESTORE:
> +		ret = criu_restore(filep, p, args);
> +		break;
> +	case KFD_CRIU_OP_RESUME:
> +		ret = criu_resume(filep, p, args);
> +		break;
> +	default:
> +		dev_dbg(kfd_device, "Unsupported CRIU operation:%d\n", args->op);
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	if (ret)
> +		dev_dbg(kfd_device, "CRIU operation:%d err:%d\n", args->op, ret);
> +
> +	return ret;
> +}
> +
>   #define AMDKFD_IOCTL_DEF(ioctl, _func, _flags) \
>   	[_IOC_NR(ioctl)] = {.cmd = ioctl, .func = _func, .flags = _flags, \
>   			    .cmd_drv = 0, .name = #ioctl}
> @@ -1959,6 +2029,9 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
>   
>   	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SET_XNACK_MODE,
>   			kfd_ioctl_set_xnack_mode, 0),
> +
> +	AMDKFD_IOCTL_DEF(AMDKFD_IOC_CRIU_OP,
> +			kfd_ioctl_criu, KFD_IOC_FLAG_CHECKPOINT_RESTORE),
>   };
>   
>   #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
> @@ -1973,6 +2046,7 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
>   	char *kdata = NULL;
>   	unsigned int usize, asize;
>   	int retcode = -EINVAL;
> +	bool ptrace_attached = false;
>   
>   	if (nr >= AMDKFD_CORE_IOCTL_COUNT)
>   		goto err_i1;
> @@ -1998,7 +2072,15 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
>   	 * processes need to create their own KFD device context.
>   	 */
>   	process = filep->private_data;
> -	if (process->lead_thread != current->group_leader) {
> +
> +	rcu_read_lock();
> +	if ((ioctl->flags & KFD_IOC_FLAG_CHECKPOINT_RESTORE) &&
> +	    ptrace_parent(process->lead_thread) == current)
> +		ptrace_attached = true;
> +	rcu_read_unlock();
> +
> +	if (process->lead_thread != current->group_leader
> +	    && !ptrace_attached) {
>   		dev_dbg(kfd_device, "Using KFD FD in wrong process\n");
>   		retcode = -EBADF;
>   		goto err_i1;
> @@ -2013,6 +2095,16 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
>   		goto err_i1;
>   	}
>   
> +	/*
> +	 * Versions of docker shipped in Ubuntu 18.xx and 20.xx do not support
> +	 * CAP_CHECKPOINT_RESTORE, so we also allow access if CAP_SYS_ADMIN as CAP_SYS_ADMIN is a
> +	 * more priviledged access.
> +	 */
> +	if (unlikely(ioctl->flags & KFD_IOC_FLAG_CHECKPOINT_RESTORE)) {
> +		if (!capable(CAP_CHECKPOINT_RESTORE) && !capable(CAP_SYS_ADMIN))
> +			return -EACCES;
> +	}
> +
>   	if (cmd & (IOC_IN | IOC_OUT)) {
>   		if (asize <= sizeof(stack_kdata)) {
>   			kdata = stack_kdata;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index 1d3f012bcd2a..e68f692362bb 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -121,7 +121,26 @@
>    */
>   #define KFD_QUEUE_DOORBELL_MIRROR_OFFSET 512
>   
> -
> +/**
> + * enum kfd_ioctl_flags - KFD ioctl flags
> + * Various flags that can be set in &amdkfd_ioctl_desc.flags to control how
> + * userspace can use a given ioctl.
> + */
> +enum kfd_ioctl_flags {
> +	/*
> +	 * @KFD_IOC_FLAG_CHECKPOINT_RESTORE:
> +	 * Certain KFD ioctls such as AMDKFD_IOC_CRIU_OP can potentially
> +	 * perform privileged operations and load arbitrary data into MQDs and
> +	 * eventually HQD registers when the queue is mapped by HWS. In order to
> +	 * prevent this we should perform additional security checks.
> +	 *
> +	 * This is equivalent to callers with the CHECKPOINT_RESTORE capability.
> +	 *
> +	 * Note: Since earlier versions of docker do not support CHECKPOINT_RESTORE,
> +	 * we also allow ioctls with SYS_ADMIN capability.
> +	 */
> +	KFD_IOC_FLAG_CHECKPOINT_RESTORE = BIT(0),
> +};
>   /*
>    * Kernel module parameter to specify maximum number of supported queues per
>    * device
> @@ -1004,6 +1023,50 @@ void kfd_process_set_trap_handler(struct qcm_process_device *qpd,
>   				  uint64_t tba_addr,
>   				  uint64_t tma_addr);
>   
> +/* CRIU */
> +/*
> + * Need to increment KFD_CRIU_PRIV_VERSION each time a change is made to any of the CRIU private
> + * structures:
> + * kfd_criu_process_priv_data
> + * kfd_criu_device_priv_data
> + * kfd_criu_bo_priv_data
> + * kfd_criu_queue_priv_data
> + * kfd_criu_event_priv_data
> + * kfd_criu_svm_range_priv_data
> + */
> +
> +#define KFD_CRIU_PRIV_VERSION 1
> +
> +struct kfd_criu_process_priv_data {
> +	uint32_t version;
> +};
> +
> +struct kfd_criu_device_priv_data {
> +	/* For future use */
> +	uint64_t reserved;
> +};
> +
> +struct kfd_criu_bo_priv_data {
> +	uint64_t reserved;
> +};
> +
> +struct kfd_criu_svm_range_priv_data {
> +	uint32_t object_type;
> +	uint64_t reserved;

The compiler adds 32-bit padding on x86_64. I think you want to make 
"reserved" 32-bit here. Same in the two structures below.


> +};
> +
> +struct kfd_criu_queue_priv_data {
> +	uint32_t object_type;
> +	uint64_t reserved;
> +};
> +
> +struct kfd_criu_event_priv_data {
> +	uint32_t object_type;
> +	uint64_t reserved;
> +};
> +
> +/* CRIU - End */
> +
>   /* Queue Context Management */
>   int init_queue(struct queue **q, const struct queue_properties *properties);
>   void uninit_queue(struct queue *q);
> diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
> index af96af174dc4..b5c297be081b 100644
> --- a/include/uapi/linux/kfd_ioctl.h
> +++ b/include/uapi/linux/kfd_ioctl.h
> @@ -468,6 +468,80 @@ struct kfd_ioctl_smi_events_args {
>   	__u32 anon_fd;	/* from KFD */
>   };
>   
> +/**************************************************************************************************
> + * CRIU IOCTLs (Checkpoint Restore In Userspace)
> + *
> + * When checkpointing a process, the userspace application will perform:
> + * 1. PROCESS_INFO op to determine current process information

Maybe mention that this also pauses execution by evicting all the 
queues. That makes the UNPAUSE op below less mysterious.


> + * 2. CHECKPOINT op to checkpoint process contents (BOs, queues, events, svm-ranges)
> + * 3. UNPAUSE op to un-evict all the queues
> + *
> + * When restoring a process, the CRIU userspace application will perform:
> + *
> + * 1. RESTORE op to restore process contents
> + * 2. RESUME op to start the process
> + *
> + * Note: Queues are forced into an evicted state after a successful PROCESS_INFO. If user
> + * application need to perform an UNPAUSE operation to complete or abort a checkpoint.
> + */
> +
> +enum kfd_criu_op {
> +	KFD_CRIU_OP_PROCESS_INFO,
> +	KFD_CRIU_OP_CHECKPOINT,
> +	KFD_CRIU_OP_UNPAUSE,
> +	KFD_CRIU_OP_RESTORE,
> +	KFD_CRIU_OP_RESUME,
> +};
> +
> +/**
> + * kfd_ioctl_criu_args - Arguments perform CRIU operation
> + * @devices:		[in/out] User pointer to memory location for devices information
> + * @bos:		[in/out] User pointer to memory location for BOs information

It would help to reference the _bucket structures to make it clear that 
the "buckets" are the public information pointed to by these pointers. 
Also that these are pointers to arrays of buckets with num_devices and 
num_bos giving the array size.


> + * @priv_data:		[in/out] User pointer to memory location for private data
> + * @priv_data_size:	[in/out] Size of priv_data in bytes
> + * @num_devices:	[in/out] Number of GPUs used by process
> + * @num_bos		[in/out] Number of BOs used by process
> + * @num_objects:	[in/out] Number of objects used by process. Objects are opaque to
> + *				 user application
> + * @pid:		[in/out] PID of the process being checkpointed/restored

Do you need the pid during restore? Restore runs in the context of the 
restoring process itself.


> + * @op			[in] Type of operation (kfd_criu_op)
> + *
> + * Takes and releases process lock.

The process lock is a KFD implementation detail. I don't think this 
comment belongs in the UAPI definition.


> + * Return: 0 on success, -errno on failure
> + */
> +struct kfd_ioctl_criu_args {
> +	__u64 devices;		/* Used during ops: CHECKPOINT, RESTORE */
> +	__u64 bos;		/* Used during ops: CHECKPOINT, RESTORE */
> +	__u64 priv_data;	/* Used during ops: CHECKPOINT, RESTORE */
> +	__u64 priv_data_size;	/* Used during ops: PROCESS_INFO, RESTORE */
> +	__u32 num_devices;	/* Used during ops: PROCESS_INFO, RESTORE */
> +	__u32 num_bos;		/* Used during ops: PROCESS_INFO, RESTORE */
> +	__u32 num_objects;	/* Used during ops: PROCESS_INFO, RESTORE */
> +	__u32 pid;		/* Used during ops: PROCESS_INFO, RESTORE */

Do you need the pid during restore? Restore runs in the context of the 
restoring process itself.


> +	__u32 op;
> +};
> +
> +struct kfd_criu_device_bucket {
> +	__u32 user_gpu_id;
> +	__u32 actual_gpu_id;
> +	__u32 drm_fd;
> +	__u32 pad;
> +};
> +
> +struct kfd_criu_bo_bucket {
> +	__u64 addr;
> +	__u64 size;
> +	__u64 offset;
> +	__u64 restored_offset;    /* During restore, updated offset for BO */
> +	__u32 gpu_id;

Maybe add a comment that this is the user_gpu_id (I think it is ...).

Regards,
   Felix


> +	__u32 alloc_flags;
> +	__u32 dmabuf_fd;
> +	__u32 pad;
> +};
> +
> +/* CRIU IOCTLs - END */
> +/**************************************************************************************************/
> +
>   /* Register offset inside the remapped mmio page
>    */
>   enum kfd_mmio_remap {
> @@ -742,7 +816,10 @@ struct kfd_ioctl_set_xnack_mode_args {
>   #define AMDKFD_IOC_SET_XNACK_MODE		\
>   		AMDKFD_IOWR(0x21, struct kfd_ioctl_set_xnack_mode_args)
>   
> +#define AMDKFD_IOC_CRIU_OP			\
> +		AMDKFD_IOWR(0x22, struct kfd_ioctl_criu_args)
> +
>   #define AMDKFD_COMMAND_START		0x01
> -#define AMDKFD_COMMAND_END		0x22
> +#define AMDKFD_COMMAND_END		0x23
>   
>   #endif
