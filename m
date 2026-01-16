Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DBBD32D74
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 15:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0AD10E8AD;
	Fri, 16 Jan 2026 14:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pOm744By";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9523510E8AD
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 14:47:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A754860150;
 Fri, 16 Jan 2026 14:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09282C116C6;
 Fri, 16 Jan 2026 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1768574865;
 bh=NmY6f/3++srymFtkQFv5iqmHppCm9HzuPAroq8sLV+0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pOm744ByqRtqzwg0ncDID5yzmiFLYAyfuZQnFxz1nUOfRZyNZpG74HHT07eF7XE4n
 7txNc0cHhHmobnzxhK21mhoXFsVYN04TNz0MtNeftlGzBDJWxjRVdcN7NFCZhKg5QL
 krSGx/52Mki3qjBaCiRe6opdag4NRJ8RYTxEL/VE=
Date: Fri, 16 Jan 2026 15:47:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
 stable@vger.kernel.org
Subject: Re: [PATCH v4] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Message-ID: <2026011637-statute-showy-2c3f@gregkh>
References: <20260113143445.889031-1-xjdeng@buaa.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113143445.889031-1-xjdeng@buaa.edu.cn>
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

On Tue, Jan 13, 2026 at 10:34:45PM +0800, Xingjing Deng wrote:
> In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> reserved memory to the configured VMIDs, but its return value was not
> checked.
> 
> Fail the probe if the SCM call fails to avoid continuing with an
> unexpected/incorrect memory permission configuration
> 
> Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
> Cc: stable@vger.kernel.org # 6.11-rc1
> Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> 
> ---
> 
> v4:
> - Format the indentation
> - Link to v3: https://lore.kernel.org/linux-arm-msm/20260113084352.72itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com/T/#t
> 
> v3:
> - Add missing linux-kernel@vger.kernel.org to cc list.
> - Standarlize changelog placement/format.
> - Link to v2: https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t
> 
> v2:
> - Add Fixes: and Cc: stable tags.
> - Link to v1: https://lore.kernel.org/linux-arm-msm/20260113022550.4029635-1-xjdeng@buaa.edu.cn/T/#u
> 
> Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> ---
>  drivers/misc/fastrpc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index cbb12db110b3..9c41b51d80ee 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2339,10 +2339,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>  
>  			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
> -				    data->vmperms, data->vmcount);
> +				    				data->vmperms, data->vmcount);

I'm all for coding style cleanups, but don't mix that into a patch that
does something else.  Also, please indent this properly, checkpatch
should complain about this.


>  			if (err) {
>  				dev_err(rdev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
> -					res.start, resource_size(&res), err);
> +						res.start, resource_size(&res), err);

Same here, that's not right.

And I don't see the real change here, are you sure you generated this
properly?  This just looks like coding style cleanups, which do not
match the changelog text.

thanks,

greg k-h
