Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 522D665147D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 21:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C301810E304;
	Mon, 19 Dec 2022 20:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847EE10E310
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 20:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1671483337; bh=waCi45GdEdTwDkLLovTT2hmNdulmbavhyJqMsALuGDQ=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=dLqRjNyilTr7mIMwT2/JTnrKremz09RAY7UNTEESt/F4CtiEewh98v/1AvrGe8WIq
 3yHYfaD/a5GZ1z67Z7EYG/fNOtVogx/PT+1Ml8Y7HMEK+C9fU2dKfL1c8UsIFU8q4Q
 hEG6y9I9angkB2dCvdaSI/EWh+wr1kLpmO58dMMY=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Mon, 19 Dec 2022 21:55:37 +0100 (CET)
X-EA-Auth: X7OgntSeEwUep+7q3TqTeZXw7KjXoM8PSczU0FZ1xHjtCg6EB278jhA0NJruH5+8nhteGA5v1YCNAjVNCmMT/vLkxAobcNRG
Date: Tue, 20 Dec 2022 02:25:32 +0530
From: Deepak R Varma <drv@mailo.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sprd: remove redundant error logging
Message-ID: <Y6DPxKGmfRH5Bujn@qemulion>
References: <Y5XhPJ39ipMCcctq@qemulion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5XhPJ39ipMCcctq@qemulion>
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>, drv@mailo.com,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 11, 2022 at 07:25:08PM +0530, Deepak R Varma wrote:

Hello,
May I please request a review and feedback on this patch proposal?

Thank you,
./drv

> A call to platform_get_irq() already prints an error on failure within
> its own implementation. So printing another error based on its return
> value in the caller is redundant and should be removed. The clean up
> also makes if condition block braces unnecessary. Remove that as well.
>
> Issue identified using platform_get_irq.cocci coccicheck script.
>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/gpu/drm/sprd/sprd_dpu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
> index 88f4259680f1..db0bcea1d9f4 100644
> --- a/drivers/gpu/drm/sprd/sprd_dpu.c
> +++ b/drivers/gpu/drm/sprd/sprd_dpu.c
> @@ -803,10 +803,8 @@ static int sprd_dpu_context_init(struct sprd_dpu *dpu,
>  	}
>
>  	ctx->irq = platform_get_irq(pdev, 0);
> -	if (ctx->irq < 0) {
> -		dev_err(dev, "failed to get dpu irq\n");
> +	if (ctx->irq < 0)
>  		return ctx->irq;
> -	}
>
>  	/* disable and clear interrupts before register dpu IRQ. */
>  	writel(0x00, ctx->base + REG_DPU_INT_EN);
> --
> 2.34.1
>


