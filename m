Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3914FA74D53
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 16:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBB310E048;
	Fri, 28 Mar 2025 15:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c6J7IYiL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3259810E048;
 Fri, 28 Mar 2025 15:05:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 93257A42AF8;
 Fri, 28 Mar 2025 15:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5010FC4CEE4;
 Fri, 28 Mar 2025 15:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743174343;
 bh=DFlgmDbfFVNEIC8CuMgkRVk9uaSaT4iLRwL3bDdyVjU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c6J7IYiLwYEa8HUpwYBGYRDyIuKnXwG2AIg/IQgkucNhPP7TlZ3NVRsWsoA+kw1GR
 AFGsDW3zqA7Y5WXozoKfKFjNwK0AK9hPJZQTeFbRLuOf721qwquNcEwMHcIl/fBiuX
 m9eKDJn3BEz7+QM9DG4mft7OcdU7ZhpmWUrhLESEUp7CKwfxTbLkqJ065KFjDIOtdD
 Rz414Fe68nmJwmIP24fAuRXdstVNpGWk5HKwp7gkRUCYtI5rCn+xu2nVm+8NcN3uE2
 9JHPX1z7eBO7QQtFfxiSeLnTfAI9Z5fA+iyxT0l0bVaquQGxy4vkQI/1HEPB9Kcg+I
 P6cDE2SXaOtbQ==
Date: Fri, 28 Mar 2025 16:05:38 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] drm/nouveau/outp: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <Z-a6wtoIAkDY2ERx@pollux>
References: <Z-a2DAQmcsHHlyci@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-a2DAQmcsHHlyci@kspp>
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

On Fri, Mar 28, 2025 at 08:45:32AM -0600, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
> a flexible structure where the size of the flexible-array member
> is known at compile-time, and refactor the rest of the code,
> accordingly.
> 
> So, with these changes, fix the following warning:
> 
> drivers/gpu/drm/nouveau/nvif/outp.c:199:45: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nvif/outp.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
> index 6daeb7f0b09b..403cf16d5e84 100644
> --- a/drivers/gpu/drm/nouveau/nvif/outp.c
> +++ b/drivers/gpu/drm/nouveau/nvif/outp.c
> @@ -195,20 +195,18 @@ nvif_outp_dp_aux_pwr(struct nvif_outp *outp, bool enable)
>  int
>  nvif_outp_hda_eld(struct nvif_outp *outp, int head, void *data, u32 size)
>  {
> -	struct {
> -		struct nvif_outp_hda_eld_v0 mthd;
> -		u8 data[128];
> -	} args;
> +	DEFINE_RAW_FLEX(struct nvif_outp_hda_eld_v0, mthd, data, 128);
>  	int ret;
>  
> -	if (WARN_ON(size > ARRAY_SIZE(args.data)))
> +	if (WARN_ON(size > 128))

Seems a bit unfortunate that the size is duplicated here.

Can we have an accessor macro to derive the size for us?

	union {
		u8 bytes[struct_size_t(type, member, count)];
		type obj;
	} name##_u initializer;

Maybe a macro that returns the size difference between bytes and obj?

>  		return -EINVAL;
>  
> -	args.mthd.version = 0;
> -	args.mthd.head = head;
> +	mthd->version = 0;
> +	mthd->head = head;
>  
> -	memcpy(args.data, data, size);
> -	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_HDA_ELD, &args, sizeof(args.mthd) + size);
> +	memcpy(mthd->data, data, size);
> +	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_HDA_ELD, mthd,
> +			__struct_size(mthd) + size);
>  	NVIF_ERRON(ret, &outp->object, "[HDA_ELD head:%d size:%d]", head, size);
>  	return ret;
>  }
> -- 
> 2.43.0
> 
