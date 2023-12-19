Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B0D81846F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 10:31:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E19B10E1BA;
	Tue, 19 Dec 2023 09:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432E810E1BA
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:31:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8B2E6CE17C4;
 Tue, 19 Dec 2023 09:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1305C433C7;
 Tue, 19 Dec 2023 09:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702978262;
 bh=IrE2U6r/n4Kv/xCYCiTwwaZhVpiD3Wn4GmDWJjoW7qg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oa4OWfJWHZbZI2J69HqIlyi/ihW84vG5/Fq9wmZcOJQzIXJkwgMgcq3Sdqf0qlFEe
 yQIVroqAENT7TZ3S9EzxyNq48040kDLSiBQr4YWTKNebWDaJJGFkbwgM6m0IkkymWe
 RX5PIlNjl8qaiYigKpjzSPFhsMzpUQpt7J8bGIM7RA4MNyyLBzRWSvZXkxKMCU3Zr+
 /koTn3t+Qp1zbFV8osZW2Z6q+scmLnCm8XfJKvKtbwE1KGg+uFPQ2ACFvruAJnDYMY
 8oYdHC//JghWYkXUH9+IVGVqnC++MdrWNng0AdoOAZTyeTOnD9yB1bOzw1Gm1eFOo7
 NG2EfY7xenV3w==
Date: Tue, 19 Dec 2023 11:30:56 +0200
From: Oded Gabbay <ogabbay@kernel.org>
To: Xingyuan Mo <hdthky0@gmail.com>
Subject: Re: [PATCH v2] habanalabs: fix information leak in sec_attest_info()
Message-ID: <ZYFi0AjkdPB5Fq/G@ogabbay-vm-u22.habana-labs.com>
References: <20231208130059.424735-1-hdthky0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208130059.424735-1-hdthky0@gmail.com>
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
Cc: "open list:HABANALABS PCI DRIVER" <dri-devel@lists.freedesktop.org>,
 Dafna Hirschfeld <dhirschfeld@habana.ai>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Tomer Tayar <ttayar@habana.ai>, Moti Haimovski <mhaimovski@habana.ai>,
 Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 08, 2023 at 09:00:59PM +0800, Xingyuan Mo wrote:
> This function may copy the pad0 field of struct hl_info_sec_attest to user
> mode which has not been initialized, resulting in leakage of kernel heap
> data to user mode. To prevent this, use kzalloc() to allocate and zero out
> the buffer, which can also eliminate other uninitilized holes, if any.
> 
> Fixes: 0c88760f8f5e ("habanalabs/gaudi2: add secured attestation info uapi")
> Signed-off-by: Xingyuan Mo <hdthky0@gmail.com>
> ---
>  drivers/accel/habanalabs/common/habanalabs_ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
> index 8ef36effb95b..a7cd625d82c0 100644
> --- a/drivers/accel/habanalabs/common/habanalabs_ioctl.c
> +++ b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
> @@ -685,7 +685,7 @@ static int sec_attest_info(struct hl_fpriv *hpriv, struct hl_info_args *args)
>  	if (!sec_attest_info)
>  		return -ENOMEM;
>  
> -	info = kmalloc(sizeof(*info), GFP_KERNEL);
> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
>  	if (!info) {
>  		rc = -ENOMEM;
>  		goto free_sec_attest_info;
> -- 
> 2.34.1
> 

Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Applied to -next.

Thanks,
Oded

