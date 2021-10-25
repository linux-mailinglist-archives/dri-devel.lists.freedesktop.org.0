Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E9F43A78E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC86F6E3D6;
	Mon, 25 Oct 2021 22:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADACD6E3D6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:48:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B880B60527;
 Mon, 25 Oct 2021 22:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635202094;
 bh=qxxxMQVeFjZxLU1eZ0wh5jiPQCS3q60kDxRnCGPyqlY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q0idpKffK6mdHcszuV9oGH/vDtF5lVzYKSl6HscdNcbTj6I+DxYuKw2fqDYtucrHf
 PeECJHjxO09PD0qm1YqRa5yEjDV/kGxz8g0LeEfac83sG6li9Hdmmv8I26VG3hM4AR
 y0yWRmSoPwLXAzF/xkyf3JEoyPW5MrgIJqTqXr3JdYKHxV59jAuNSgvuGTT6LfUaSs
 RuVrE6ozM9wCd744GP6BHPWNJmzF1RgVD5T03LJlptBNSqhVcxs0YEA6vV5g6/NtWn
 o7T/FWsR5JgvV3/pnH+Jho1VA5aZCdwPbZGlFzrNsNjY7TcNlV49u3khlzDtsqeSVm
 a65SDCgoT0IpQ==
Date: Mon, 25 Oct 2021 15:48:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org, llvm@lists.linux.dev
Subject: Re: [PATCH] dma-buf: fix uninitialized variable usage in selftests
Message-ID: <YXc0KlqXvm5W61ee@archlinux-ax161>
References: <20211025072835.176805-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211025072835.176805-1-christian.koenig@amd.com>
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

Hi Christian,

On Mon, Oct 25, 2021 at 09:28:35AM +0200, Christian König wrote:
> "i" can be used uninitialized in one of the error branches. Fix this.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  drivers/dma-buf/st-dma-resv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
> index 6f3ba756da3e..bc2265807f6c 100644
> --- a/drivers/dma-buf/st-dma-resv.c
> +++ b/drivers/dma-buf/st-dma-resv.c
> @@ -295,7 +295,7 @@ static int test_get_fences(void *arg, bool shared)
>  		if (r) {
>  			pr_err("Resv shared slot allocation failed\n");
>  			dma_resv_unlock(&resv);
> -			goto err_free;
> +			goto err_fini;
>  		}
>  
>  		dma_resv_add_shared_fence(&resv, f);
> @@ -336,6 +336,7 @@ static int test_get_fences(void *arg, bool shared)
>  	while (i--)
>  		dma_fence_put(fences[i]);
>  	kfree(fences);
> +err_fini:
>  	dma_resv_fini(&resv);
>  	dma_fence_put(f);
>  	return r;
> -- 
> 2.25.1
> 
> 

Thanks for the patch! This is not enough to fix all the warnings in this
file:

drivers/dma-buf/st-dma-resv.c:288:6: error: variable 'i' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
        if (r) {
            ^
drivers/dma-buf/st-dma-resv.c:336:9: note: uninitialized use occurs here
        while (i--)
               ^
drivers/dma-buf/st-dma-resv.c:288:2: note: remove the 'if' if its condition is always false
        if (r) {
        ^~~~~~~~
drivers/dma-buf/st-dma-resv.c:280:10: note: initialize the variable 'i' to silence this warning
        int r, i;
                ^
                 = 0
1 error generated.

This hunk resolves it for me. With that:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
index bc2265807f6c..e5d5c25eed53 100644
--- a/drivers/dma-buf/st-dma-resv.c
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -287,7 +287,7 @@ static int test_get_fences(void *arg, bool shared)
 	r = dma_resv_lock(&resv, NULL);
 	if (r) {
 		pr_err("Resv locking failed\n");
-		goto err_free;
+		goto err_fini;
 	}
 
 	if (shared) {
