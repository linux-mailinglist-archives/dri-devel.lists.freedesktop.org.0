Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0AAD1ADA6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 19:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF1310E374;
	Tue, 13 Jan 2026 18:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gZUtQ5xg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D363610E155
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 18:33:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0828D6000A;
 Tue, 13 Jan 2026 18:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C357C116C6;
 Tue, 13 Jan 2026 18:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768329196;
 bh=R2aY6EwkXwDSmFxiHPV6lffansfd19XxZpu70KVqEeA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gZUtQ5xgMkiZrOPV+rgnbsnvaugvv27SR/VkLlfayTtgFjlJn5p1+zogUieWXx8yt
 bHzotdtayAVoX7OHjxoL7mI+8Edu1ZLfsSZRU1C5m4rjVleS3sJREx67Zir38uB6kg
 tABlnvNNHk6vjl8+PBJDqqsEGrgX+WnFZ53t4N0I3DUwuuti1zByYNLFjmVzmb9/6L
 yzw7bTPH0C00mdZULei4xQUezDj+xIlhoHUWXHJgl0G4MsMZTuCp99y4X2mSNsKv8h
 PCtO1RdOlaS951p3QNZE6l5CzEJ3rw2O6nNxYlRi4lpQO9jrfVgH+HiLqCLCFCl1+E
 VubdQXvY0exnw==
Message-ID: <a226272a-55ea-4687-8c71-a6fd2a77c4cd@kernel.org>
Date: Tue, 13 Jan 2026 12:33:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix notifier_wq flushing warning
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260113173624.256053-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20260113173624.256053-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 1/13/2026 11:36 AM, Lizhi Hou wrote:
> Create notifier_wq with WQ_MEM_RECLAIM flag to fix the possible warning.
> 
>    workqueue: WQ_MEM_RECLAIM amdxdna_js:drm_sched_free_job_work [gpu_sched] is flushing !WQ_MEM_RECLAIM notifier_wq:0x0
> 
> Fixes: e486147c912f ("accel/amdxdna: Add BO import and export")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
>   drivers/accel/amdxdna/amdxdna_pci_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index a7968fd140a9..1c83efb51f7d 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -277,7 +277,7 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   		fs_reclaim_release(GFP_KERNEL);
>   	}
>   
> -	xdna->notifier_wq = alloc_ordered_workqueue("notifier_wq", 0);
> +	xdna->notifier_wq = alloc_ordered_workqueue("notifier_wq", WQ_MEM_RECLAIM);
>   	if (!xdna->notifier_wq)
>   		return -ENOMEM;
>   

