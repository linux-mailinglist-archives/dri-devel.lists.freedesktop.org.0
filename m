Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E828A75ED
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 22:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BB810F521;
	Tue, 16 Apr 2024 20:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="roTQfqVU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDB810F521
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 20:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=RhXtqDFd7WIHabhsTN4jqGn/JvJYZ5YpDM7t08OasS8=; b=roTQfqVUefAdZAe5ZGVryZeafg
 zkuf85bEncankvz72wSrDQnnkILaqY++DVCpVnqsD0GXDPbPqDJuAOgz5lK390CEVwtTdtC9WH75t
 DEkPuiw5bovvjBKRz4Q5jZ/PqjoDVpFaTzfE6AgQ7iakEQ+CNStyIka64LFTH2PblNm3vxTxeXWHW
 12BHXCEHlZu5fZ9kYSDsXKpm8nhLT436m8s+R0OxECCOBA1fP7GbsDCwDfwV852FcfdF++dtTWm6Z
 yv/KUjRdm89DnmSoKOavI4NOlQ7J5gy8LrTr8nYw++RZqm13HQK9+tRti6IKuE5kxlIrv5nNQY/uO
 kHGVZrwg==;
Received: from [50.53.2.121] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rwplG-0000000DmEA-2jiB; Tue, 16 Apr 2024 20:50:38 +0000
Message-ID: <4c882a69-8609-4b39-a95d-3128027373e1@infradead.org>
Date: Tue, 16 Apr 2024 13:50:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Fix no_vblank field references in documentation
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240416-drm-no_vblank-kdoc-link-v1-1-a1d8d1e9ff34@somainline.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240416-drm-no_vblank-kdoc-link-v1-1-a1d8d1e9ff34@somainline.org>
Content-Type: text/plain; charset=UTF-8
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

Hi,

On 4/16/24 12:29 PM, Marijn Suijten wrote:
> Browsing the DRM documentation shows that drm_crtc_state.no_vblank
> is not turned into a reference to the no_vblank field, but rather a
> reference to `struct drm_crtc_state`.  The only difference with other
> field references is that the struct name is prefixed by the literal
> `struct` tag, despite also already having a `&` reference prefix in two
> of the three cases.  Remove the `struct` prefix to turn these references
> into proper links to the designated field.
> 
> Fixes: 7beb691f1e6f ("drm: Initialize struct drm_crtc_state.no_vblank from device settings")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
> Note that a simple regex like "&struct \w+\.\w+" shows that there are
> only a handful of violators, most of them inside DRM files.  Let me know
> if you'd like a v2 that addresses all of them in one go (in separate
> patches or one combined change)?
> 
> Kind regards,
> Marijn
> ---
>  drivers/gpu/drm/drm_vblank.c        | 2 +-
>  include/drm/drm_crtc.h              | 2 +-
>  include/drm/drm_simple_kms_helper.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 702a12bc93bd..45504732f98e 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -140,7 +140,7 @@
>   * must not call drm_vblank_init(). For such drivers, atomic helpers will
>   * automatically generate fake vblank events as part of the display update.
>   * This functionality also can be controlled by the driver by enabling and
> - * disabling struct drm_crtc_state.no_vblank.
> + * disabling &drm_crtc_state.no_vblank.
>   */
>  
>  /* Retry timestamp calculation up to 3 times to satisfy
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 8b48a1974da3..eb75d0aec170 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -342,7 +342,7 @@ struct drm_crtc_state {
>  	 *    that case.
>  	 *
>  	 * For very simple hardware without VBLANK interrupt, enabling
> -	 * &struct drm_crtc_state.no_vblank makes DRM's atomic commit helpers
> +	 * &drm_crtc_state.no_vblank makes DRM's atomic commit helpers
>  	 * send a fake VBLANK event at the end of the display update after all
>  	 * hardware changes have been applied. See
>  	 * drm_atomic_helper_fake_vblank().
> diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
> index b2486d073763..6e64d91819e7 100644
> --- a/include/drm/drm_simple_kms_helper.h
> +++ b/include/drm/drm_simple_kms_helper.h
> @@ -102,7 +102,7 @@ struct drm_simple_display_pipe_funcs {
>  	 * drm_crtc_arm_vblank_event(), when the driver supports vblank
>  	 * interrupt handling, or drm_crtc_send_vblank_event() for more
>  	 * complex case. In case the hardware lacks vblank support entirely,
> -	 * drivers can set &struct drm_crtc_state.no_vblank in
> +	 * drivers can set &drm_crtc_state.no_vblank in
>  	 * &struct drm_simple_display_pipe_funcs.check and let DRM's
>  	 * atomic helper fake a vblank event.
>  	 */
> 
> ---
> base-commit: 6bd343537461b57f3efe5dfc5fc193a232dfef1e
> change-id: 20240416-drm-no_vblank-kdoc-link-fea1b53008a3

Do you see differences in the generated html for these changes?

"&struct somestruct" and "&somestruct" should both be OK AFAIK, although
Documentation/doc-guide/kernel-doc.rst seems to say that using
"&struct somestruct" is preferred.

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html
