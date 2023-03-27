Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 927B36C9EAC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 10:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9A910E33B;
	Mon, 27 Mar 2023 08:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 636 seconds by postgrey-1.36 at gabe;
 Mon, 27 Mar 2023 08:55:08 UTC
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB0010E338;
 Mon, 27 Mar 2023 08:55:08 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1679906669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=2sySZtQBfq4L19gj/4gjZ3ggLK9raMfJSFg59Wjh2eU=;
 b=PC1Fc8oyBCQtNOG/RnSIyDobcxaq7sMrCF1hF+CwvZPusMXk3D5P/LTBXewhtj7bNe4fVB
 S7EyLoO+7d5gI/uO00+66r0SOEQ1nvCEANuJ3QPNHhB1WQ96YZ5z9EKnR5qVFMBanGbqDX
 rvW0Tz3EeCoqCROjgXWGVnYMcsU1cpwl67gLTxd1FvsxFg/1kEnnte8u6Z0KGd9muZyi/p
 cfPp6HueDZ4WUX+WIqBS54k7cL2jSfiPitT3sIxEjRcVJk4GOGbcHDmJiyFSZ7wlrK64Zi
 f3M8F42H3SCSM4HvI8cKlYKKxFSyjX8WThZMnvyc2ERzcYAmjtxg/snBuNML9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1679906669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=2sySZtQBfq4L19gj/4gjZ3ggLK9raMfJSFg59Wjh2eU=;
 b=2Ow1ZUN2AJU6ec7XoFSU8BgyUDtigL8sf39ypFZkE/5U6DU1vxTwZ+GirXQ594h0jEES5u
 aVhREx4DPqz5lNBw==
To: Tanmay Bhushan <007047221b@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, =?utf-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/nouveau: Fix bug in buffer relocs for Nouveau
In-Reply-To: <20230119225351.71657-1-007047221b@gmail.com>
Date: Mon, 27 Mar 2023 10:48:48 +0206
Message-ID: <87r0taa8l3.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Tanmay Bhushan <007047221b@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-01-19, Tanmay Bhushan <007047221b@gmail.com> wrote:
> dma_resv_wait_timeout returns greater than zero on success
> as opposed to ttm_bo_wait_ctx. As a result of that relocs
> will fail and give failure even when it was a success.

Today I switched my workstation from 6.2 to 6.3-rc3 and started seeing
lots of new kernel messages:

[  642.138313][ T1751] nouveau 0000:f0:10.0: X[1751]: reloc wait_idle failed: 1500
[  642.138389][ T1751] nouveau 0000:f0:10.0: X[1751]: reloc apply: 1500
[  646.123490][ T1751] nouveau 0000:f0:10.0: X[1751]: reloc wait_idle failed: 1500
[  646.123573][ T1751] nouveau 0000:f0:10.0: X[1751]: reloc apply: 1500

The graphics seemed to go slower or hang a bit when these messages would
appear. I then found your patch! However, I have some comments about it.

First, it should include a fixes tag:

Fixes: 41d351f29528 ("drm/nouveau: stop using ttm_bo_wait")

> Signed-off-by: Tanmay Bhushan <007047221b@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_gem.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index f77e44958037..0e3690459144 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -706,9 +706,8 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
>  		ret = dma_resv_wait_timeout(nvbo->bo.base.resv,
>  					    DMA_RESV_USAGE_BOOKKEEP,
>  					    false, 15 * HZ);
> -		if (ret == 0)
> +		if (ret <= 0) {
>  			ret = -EBUSY;

This is incorrect for 2 reasons:

* it treats restarts as timeouts

* this function now returns >0 on success

> -		if (ret) {
>  			NV_PRINTK(err, cli, "reloc wait_idle failed: %ld\n",
>  				  ret);
>  			break;

I rearranged things to basically correctly translate the return code of
dma_resv_wait_timeout() to match the previous ttm_bo_wait():

		ret = dma_resv_wait_timeout(nvbo->bo.base.resv,
					    DMA_RESV_USAGE_BOOKKEEP,
					    false, 15 * HZ);
		if (ret == 0)
			ret = -EBUSY;
		if (ret > 0)
			ret = 0;
		if (ret) {
			NV_PRINTK(err, cli, "reloc wait_idle failed: %ld\n",
				  ret);
			break;
		}

So the patch just becomes:

@@ -708,6 +708,8 @@ nouveau_gem_pushbuf_reloc_apply(struct n
 					    false, 15 * HZ);
 		if (ret == 0)
 			ret = -EBUSY;
+		if (ret > 0)
+			ret = 0;
 		if (ret) {
 			NV_PRINTK(err, cli, "reloc wait_idle failed: %ld\n",
 				  ret);

With this variant, everything runs correctly on my workstation again.

It probably deserves a comment about why @ret is being translated. Or
perhaps a new variable should be introduced to separate the return value
of dma_resv_wait_timeout() from the return value of this function.

Either way, this is an important fix for 6.3-rc!

John Ogness
