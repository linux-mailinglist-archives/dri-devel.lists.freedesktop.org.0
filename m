Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C745893ADC
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 14:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0635610F0FE;
	Mon,  1 Apr 2024 12:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HN1qbcSy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2132.outbound.protection.outlook.com [40.107.243.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D8B10F0F9
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 12:22:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EG0uXGurNqQE4vEUgo8M//khHxYJ4Lb6R+uDoqI858tWkJUZGF7f+6roduqqbWCkQ0xe9D3frXISMSb2DsISVImPnPUpFymJOw9dlvY286uN/EW4bwIhoTQCxDjxOJcxZrlqIahhDsH7+WNfbnv5oJioRtA8NMtOXA63JBh5gf/Mq7+xU2w4JGf5zgF+40oXc7Rx467RqsaOwGFe13vcs68d3TNclwvNu4H6je6L2grdoP7/uee3INswROpVNtPCN2gVPQhaLkdgoMqyLFzsA/PXKU2+bUX4tFTtJbFkkutY9iy2+SnEv/1wW8piVZRF7nXEF1LTpGBduobV8mjGJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWCC0zTvq/Q3C7W4AT3vJ4Rkvuk/wcGKWqc4GCWOT4E=;
 b=FxHoESio4eDND6i9Wp3cIIR9uVYUnse3G+MqApn9U/bZwGuQPKQlPXS9eDyGvp+ZlUfzqr3/zclUXX8Z7tADkN4plEc1Ys8s7TKEWhfSaYRjNH5PegRqTSLFgfM2GEtWGhg98OslTa1/nN8rw4fPfCh9resWcInP+JnMHYzPqQUmmvUrj89piEe3ogo2zsOKggqqmAOTU+DveEXhFrANMrweBPnMvY92Fm60wlzynoLNVbpSN9tCdBhIOHR6IYAYhlbIUzqag1LCWGUtMT362MpJ0k/JGqSDCtCwwBlAXin43EfjJr5n2xQHWtUFXOi3QofKe4DcCkjvZNLLeCcE+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWCC0zTvq/Q3C7W4AT3vJ4Rkvuk/wcGKWqc4GCWOT4E=;
 b=HN1qbcSymq5+cEIGdns9wdSFoX9fhAJeA5zQ1BBHxPAvzki2fzGJ0wlBB0LUP6jZSaglpgUtU4XLVJZI45sd1OPjNB054w8Qse/Vc5WWqEW1nK7QNMfBmsu0QIS3bTm97o8kRyoMKgTI81jAWJ5sA8RxD8wb9fKKobPRHl5I6co=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB7742.namprd12.prod.outlook.com (2603:10b6:8:102::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 12:22:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7409.042; Mon, 1 Apr 2024
 12:22:12 +0000
Message-ID: <5cf29162-a29d-4af7-b68e-aac5c862d20e@amd.com>
Date: Mon, 1 Apr 2024 14:22:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: Zhiguo Jiang <justinjiang@vivo.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240327022903.776-1-justinjiang@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240327022903.776-1-justinjiang@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB7742:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1lhflsuF/dxKdDAimOgJaleToH6sn8yEg59K1RYiYAJYXquJspsdCOAvHs/OZpODTenJfL1W2/3XF9Z1tJR+aAUPmdr5MIqurkzjmKk1AM2lnY5DrOGwK3cH3eiGHaqA6CXKgSHt1xFD9PZQn0gYW8eJGn3DDb6PmrF9ecbclnEs9uQk3tsJ2XF3lbhf9yw08YIZCUtyEG0+wwaMFAjzWXCRz0g7C6Nx1Fmi/esxb4oT90ymmpyyXFkREfRigw+L1md3I6k7ROk/SwEgmsofa7cDCcb88RjjYX2PHKlLUSvURGC1mD9LsOZZHYwMdq3kiker+lQovQu4QD1JjquPTljUtvscgFl9FTx23mAwb7deLxTJmAJUkoDHK5U1pU4VgHhLYKrzqHaBYs9UNs9E+0LbcGADH6bd9SH0rAFEiAw5pSaoyJWlu5Q7xuqSROyh6oUf09C5o2RSMcwWKwwHa4EPiL3Bwa+zMCvp55l9lofqfh2+5Y70b/sr3W4IkooF/A0LlFFOC3kEmkSkx6qZ8Ngn+Qfocyy0o2DL+G6cJotN0DhuXQ53lYAJRXAM/adUHHNq5XYpMRIzqvUbQSe3esyR+XZ6e98pRo7jTb0Q/khbs59VZTPhVJj2EUGyz7Hm8oyBf7daRI83Qay9Cd6wFouWSAGnFVJqR2eWGPuQoMY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEI3Y3I5TGZZNENxalhESUR5WWs1RmtJeUtkMXFSTUg3TUNMUHcrd1pDN2lu?=
 =?utf-8?B?TmI1UTlVcTVQMWc1U2ZDOTJjOFdDWFkvajRFTk8xOEdmVXpwZlRnSHB0LzRK?=
 =?utf-8?B?ckszZm9YZzhyMmplZnRDd1hXZFRVbWNvZjU3TnFZYUdXTEJpeWRLVnd0Zmp3?=
 =?utf-8?B?c0dyd2xSUlpabjl3T201cGQ5RzZDU2pPQnhOSXN0YStXclBpeWIyeTRCUTQ4?=
 =?utf-8?B?bE01Q1VIWFNIZ1lFMHVzRkhqaFFRbmd0bHpLaWczUzZJeDc3VWhVYXdmdDNE?=
 =?utf-8?B?Rm1sbEgyOEVGNGg0d2svZHlIbmlyVUpxWmhCZjhLU3FSS2FCaHFrd0VldWhG?=
 =?utf-8?B?NnN5RHBjaHNMRVBCUGgrc0hjSm9nZ1FaVjRLZ0FwL2VtdVh3QytkcWFLZitm?=
 =?utf-8?B?bHF4K0RtRENjSU5tT1A0Ky9LeTAwZHVhakxrbXRJQTdpVno0U2kwaCtpZTZQ?=
 =?utf-8?B?aWdyZ3JTS1ZGSlArUUMvNjNHNGg0ak9ZMm9INXBSWENKUnh0dFBmemxXSjlz?=
 =?utf-8?B?dHl3Z3ZtY1Z1T3lQL25WK0V3bi8rdTA3SG1RQ3l3UFdtNXE3R3NWZGlnLzAv?=
 =?utf-8?B?SkFEcitaeWhqWkZlQ3RXRFZnNyt3TnpxdGk4dVFIOWJrUitDN0VlczdGLys3?=
 =?utf-8?B?Ky9jWXZ5QmlwS1puSlJNdlFTRmVUVmlMMFoycnF3YU5yMmEyZURPU21WWlc2?=
 =?utf-8?B?dXoxdldXcUJvdG9jcFRiKzU5S1pNa1laMEJCTGpNRWMyWkVha3ZIcDZrV05G?=
 =?utf-8?B?VlZHVWVneWxMRTByQ0JOaHZReTYvVEltUnBnMVV2YUdSYXN2WDdhaURiN0Ny?=
 =?utf-8?B?THZLbU5tOGFyeGlZMndYRWk2M2tTUUcyVGtneHpzWnNHVFd3aDdqK25GZlNl?=
 =?utf-8?B?MEpmbXNyRnNlWHVnbTN0V0xuZnc0S3MxT3h4K0JqK0JmM2JPRHhRa2t4M2sy?=
 =?utf-8?B?VnpMNHRWY3FHTU1mS2RoTUQ0ZVpsd1dDY1lEVFJuV2xHdkwvQjdDd3Zoaklz?=
 =?utf-8?B?OWIrNDdWR2NKTkxqaFk4eklKNVZ5T1FERmo4ay8zdXVmcnBnZzY3SWxHZUls?=
 =?utf-8?B?cmpKMjdjbUtxUm10allmRWo0WXlsS25GaVZwdUk3bkxUZkV3azRkWXpYZXpH?=
 =?utf-8?B?YmJnNXkrUndwd3NJbmVSeERpMU9udEZETDRzWDA3b0hha3N6OHltSy9yQUY1?=
 =?utf-8?B?dVA1d2swVEFsNFRLczVmeDhuQUkvU2sxcHI1blIzRGpBRnQ5T2FYY3VvZ0s3?=
 =?utf-8?B?SlF3bXRJNndqQzA0TE5HT2NiTW9wd1NhYnpHaWFBWWFld0ZaOXV0QkFzYzgy?=
 =?utf-8?B?TEFSZWtXSEMvOGpaN2VYN2UzaGovYVN2cDZQaVQxZHpqZi9VSDlyWFY2N2FK?=
 =?utf-8?B?NitXRjlWRDA5NEJEenh0Tjk1VExRTVl3SWpzNURvVUV6R3NuSE9oYTE1TnFJ?=
 =?utf-8?B?N3RmcDJielJFWWVTMDNUaVhJWmwvN0JWQXZacG5wTmVkSDE5VFo0WFZXNjQr?=
 =?utf-8?B?ajkzc0xjaWJqMVFhVVo4M3FDYnRYWGxYUGFqWVpES29BZlgydDdLSnl5OTVr?=
 =?utf-8?B?bjR0WFBZUUR6djZILzNXS25iU1J1VTl2YkNpdG0yb3IwSkZNZUk3ZWZkaUZD?=
 =?utf-8?B?dzZYcU4reXk5cjNiTUZXbE1yQXVKMXp6R1NsbUlvdFo5MzZPSlRPWCtyNHUz?=
 =?utf-8?B?M2luaVo3VklvbEhLZW9hRkhnL2NIMlNVYkptQXZ5ZElROWJqaFRIMWRxY25h?=
 =?utf-8?B?aGorUTcyZlVEZEZiNmplWXZJZnpEaXlhVDFaU2J4N0c3SEpWbEtRRG1HcklP?=
 =?utf-8?B?V3JyYW02M2M4U3p0SW5FOU5kdEYydGt5SEdlR2oyS0JZT0x6S3ZKWkZDK1Mz?=
 =?utf-8?B?ZEpHKzRVbzR2c2NsQ3g2R3YxMmRVdDNhR2RqbTFDWXlsRURSd0YvQkxZQzhq?=
 =?utf-8?B?Q2lmYzFTdStkcllpd0ZnQjVCNnBFUjRJQW43ZExrY2NrRWxSM0dEYnlmTk1p?=
 =?utf-8?B?OXc0dm0wR0dMVU93bHFyWDVoaXQ4SllqZ0RZZnVDeStNd3M4SW1uZ2dqSFFr?=
 =?utf-8?B?YnRLcFI3cEI2cit2RUN1eVVyUDd6YXAvZnhNbnMwQjB4cHB2YlRTbkg0eE5u?=
 =?utf-8?Q?Tl+A=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3db22a-b593-43e0-ebb0-08dc52465ba2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 12:22:12.1623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQ79Q0Z4+bYAGfU9LdzlaT11qRB9RFAet301gefJUdIZV47FiIG10YEcQvL1174m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7742
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

Am 27.03.24 um 03:29 schrieb Zhiguo Jiang:
> The issue is a UAF issue of dmabuf file fd. Throght debugging, we found
> that the dmabuf file fd is added to the epoll event listener list, and
> when it is released, it is not removed from the epoll list, which leads
> to the UAF(Use-After-Free) issue.

As far as I can see that's not because of the DMA-buf code, but because 
you are somehow using this interface incorrectly.

When dma_buf_poll() is called it is mandatory for the caller to hold a 
reference to the file descriptor on which the poll operation is executed.

So adding code like "if (!file_count(file))" in the beginning of 
dma_buf_poll() is certainly broken.

My best guess is that you have some unbalanced 
dma_buf_get()/dma_buf_put() somewhere instead.

Regards,
Christian.

>
> The UAF issue can be solved by checking dmabuf file->f_count value and
> skipping the poll operation for the closed dmabuf file in the
> dma_buf_poll(). We have tested this solved patch multiple times and
> have not reproduced the uaf issue.
>
> crash dump:
> list_del corruption, ffffff8a6f143a90->next is LIST_POISON1
> (dead000000000100)
> ------------[ cut here ]------------
> kernel BUG at lib/list_debug.c:55!
> Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
> pc : __list_del_entry_valid+0x98/0xd4
> lr : __list_del_entry_valid+0x98/0xd4
> sp : ffffffc01d413d00
> x29: ffffffc01d413d00 x28: 00000000000000c0 x27: 0000000000000020
> x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000080007
> x23: ffffff8b22e5dcc0 x22: ffffff88a6be12d0 x21: ffffff8b22e572b0
> x20: ffffff80254ed0a0 x19: ffffff8a6f143a00 x18: ffffffda5efed3c0
> x17: 6165642820314e4f x16: 53494f505f545349 x15: 4c20736920747865
> x14: 6e3e2d3039613334 x13: 2930303130303030 x12: 0000000000000018
> x11: ffffff8b6c188000 x10: 00000000ffffffff x9 : 6c8413a194897b00
> x8 : 6c8413a194897b00 x7 : 74707572726f6320 x6 : 6c65645f7473696c
> x5 : ffffff8b6c3b2a3e x4 : ffffff8b6c3b2a40 x3 : ffff103000001005
> x2 : 0000000000000001 x1 : 00000000000000c0 x0 : 000000000000004e
> Call trace:
>   __list_del_entry_valid+0x98/0xd4
>   dma_buf_file_release+0x48/0x90
>   __fput+0xf4/0x280
>   ____fput+0x10/0x20
>   task_work_run+0xcc/0xf4
>   do_notify_resume+0x2a0/0x33c
>   el0_svc+0x5c/0xa4
>   el0t_64_sync_handler+0x68/0xb4
>   el0t_64_sync+0x1a0/0x1a4
> Code: d0006fe0 912c5000 f2fbd5a2 94231a01 (d4210000)
> ---[ end trace 0000000000000000 ]---
> Kernel panic - not syncing: Oops - BUG: Fatal exception
> SMP: stopping secondary CPUs
>
> Signed-off-by: Zhiguo Jiang <justinjiang@vivo.com>
> ---
>   drivers/dma-buf/dma-buf.c | 28 ++++++++++++++++++++++++----
>   1 file changed, 24 insertions(+), 4 deletions(-)
>   mode change 100644 => 100755 drivers/dma-buf/dma-buf.c
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 8fe5aa67b167..e469dd9288cc
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -240,6 +240,10 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   	struct dma_resv *resv;
>   	__poll_t events;
>   
> +	/* Check if the file exists */
> +	if (!file_count(file))
> +		return EPOLLERR;
> +
>   	dmabuf = file->private_data;
>   	if (!dmabuf || !dmabuf->resv)
>   		return EPOLLERR;
> @@ -266,8 +270,15 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   		spin_unlock_irq(&dmabuf->poll.lock);
>   
>   		if (events & EPOLLOUT) {
> -			/* Paired with fput in dma_buf_poll_cb */
> -			get_file(dmabuf->file);
> +			/*
> +			 * Paired with fput in dma_buf_poll_cb,
> +			 * Skip poll for the closed file.
> +			 */
> +			if (!get_file_rcu(&dmabuf->file)) {
> +				events &= ~EPOLLOUT;
> +				dcb->active = 0;
> +				goto clear_out_event;
> +			}
>   
>   			if (!dma_buf_poll_add_cb(resv, true, dcb))
>   				/* No callback queued, wake up any other waiters */
> @@ -277,6 +288,7 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   		}
>   	}
>   
> +clear_out_event:
>   	if (events & EPOLLIN) {
>   		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_in;
>   
> @@ -289,8 +301,15 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   		spin_unlock_irq(&dmabuf->poll.lock);
>   
>   		if (events & EPOLLIN) {
> -			/* Paired with fput in dma_buf_poll_cb */
> -			get_file(dmabuf->file);
> +			/*
> +			 * Paired with fput in dma_buf_poll_cb,
> +			 * Skip poll for the closed file.
> +			 */
> +			if (!get_file_rcu(&dmabuf->file)) {
> +				events &= ~EPOLLIN;
> +				dcb->active = 0;
> +				goto clear_in_event;
> +			}
>   
>   			if (!dma_buf_poll_add_cb(resv, false, dcb))
>   				/* No callback queued, wake up any other waiters */
> @@ -300,6 +319,7 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   		}
>   	}
>   
> +clear_in_event:
>   	dma_resv_unlock(resv);
>   	return events;
>   }

