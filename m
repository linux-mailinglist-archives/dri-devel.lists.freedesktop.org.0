Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533FB95BD23
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 19:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92FA10EB81;
	Thu, 22 Aug 2024 17:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H7ZbSPhX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C5710EB7E;
 Thu, 22 Aug 2024 17:27:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 82DB6CE0FE5;
 Thu, 22 Aug 2024 17:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9D1C32782;
 Thu, 22 Aug 2024 17:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724347658;
 bh=TWiJ93HyAJ88G0js0Qu5sBOlvCmAqny+80HmOjGUBgk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H7ZbSPhXCKuat5wa5m3ssacTGsb9R32fPXdGVtGmibM4WFj96ciyCVM5fbxhjKaNA
 mcOR8rp2o3bBdepLAV9HlpAo4rJrTWGSNuSYW25mKjEZzhKkdjNUGMFvcTTzx+2kSj
 UovTM8gRRX0ZqrB5cFi430wanYTzkgqHIKHyvExTgLR61IiQvfDFBiF7HcUXcerDqq
 6SatQL0hhLTWfpX+uQRHkZ5obtIXtitWc5nIJIEJMGs5otVrcY4v+lpnhowNMR30/i
 nQtG/vqqUkPecvMe+p4hS8qODiaoyAorTIhMRBCeOgdcLxnRuDnB+kNdkiPVv5DWPE
 TZohJE5eH3FKQ==
Date: Thu, 22 Aug 2024 10:27:38 -0700
From: Kees Cook <kees@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] drm/nouveau: Avoid -Wflex-array-member-not-at-end
 warning
Message-ID: <202408221011.82876DA0C4@keescook>
References: <ZsZLFS1CsHkKjw+C@elsanto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsZLFS1CsHkKjw+C@elsanto>
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

On Wed, Aug 21, 2024 at 02:16:21PM -0600, Gustavo A. R. Silva wrote:
> Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
> a flexible structure where the size of the flexible-array member
> is known at compile-time, and refactor the rest of the code,
> accordingly.
> 
> So, with this, fix the following warning:
> 
> drivers/gpu/drm/nouveau/dispnv50/disp.c:779:47: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index eed579a6c858..ddddc69640be 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -774,11 +774,9 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
>  	struct drm_hdmi_info *hdmi = &nv_connector->base.display_info.hdmi;
>  	union hdmi_infoframe infoframe = { 0 };
>  	const u8 rekey = 56; /* binary driver, and tegra, constant */
> +	DEFINE_RAW_FLEX(struct nvif_outp_infoframe_v0, args, data, 17);
> +	const u8 data_len = 17; /* same length as in DEFINE_RAW_FLEX above. */

To avoid repeating the open-coded "17", this could either be a define:

nv50_hdmi_enable(...)
{
...
#define data_len	17
	DEFINE_RAW_FLEX(struct nvif_outp_infoframe_v0, args, data, data_len);
...rest of function...
#undef data_len
}

or an ungainly but compile-time calculated value that exposes some
DEFINE_FLEX internals:

	const u8 data_len = (sizeof(args_u) - sizeof(*args)) / sizeof(*args->data);

(Maybe a helper is needed for that?)

#define STACK_FLEX_COUNT(name, member)	\
	((sizeof(name##_u) = sizeof(*(name))) / sizeof(*(name)->member))

> @@ -815,29 +813,29 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
>  		return;
>  
>  	/* AVI InfoFrame. */
> -	args.infoframe.version = 0;
> -	args.infoframe.head = nv_crtc->index;
> +	args->version = 0;
> +	args->head = nv_crtc->index;

The stack variable (was before and is again) already zero-initialized,
so the "= 0" line shouldn't be needed.

But neither of these comments are show-stoppers, IMO.

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
