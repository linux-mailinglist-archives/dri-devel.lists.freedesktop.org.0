Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FC7751B69
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F0410E179;
	Thu, 13 Jul 2023 08:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76A610E179
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:23:20 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D00CC6607044;
 Thu, 13 Jul 2023 09:23:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689236599;
 bh=Hdp/JGNy8f78js2uvbf0SmhsyjnwXDt1/ntdYSzEihM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S82dr4LwDR4LarziwBgO3XvO3dYVjr/lrDjTZJyfjqfFEDPnFRVqTHGlzvLjBDITZ
 WcTOrUYFsJUyiy7ltz3tDQOvWKxYR/UeLDBzMAQiaurpK65RozD0rDEtlgHus3VcjB
 GyFIJJQiGXJNQnzXRz3zT/ZQy4hdiRJdmW7Gmh9Qm/ZQeItic0reVI5vPk4vkxFQgj
 YgdAO7BPEHRbsrKbLi2s1TX3XxrDsmNYLb74NvQj78X8psIIQzew2aGiTyhseds8J/
 G3KS2OevqJJSnXPWvd8qpnWaohniBkM59g8cRsJAJK9uXcMk+87y5JqK7xxO6VbHj2
 J0xw4WZDg+Nzg==
Date: Thu, 13 Jul 2023 11:23:16 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/4] drm/doc: document interactions between
 PAGE_FLIP_EVENT and atomic
Message-ID: <20230713112316.785fb897.pekka.paalanen@collabora.com>
In-Reply-To: <20230712135723.173506-2-contact@emersion.fr>
References: <20230712135723.173506-1-contact@emersion.fr>
 <20230712135723.173506-2-contact@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Jul 2023 13:57:28 +0000
Simon Ser <contact@emersion.fr> wrote:

> Explain which CRTCs get an event, and uAPI requirements.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  include/uapi/drm/drm_mode.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 92d96a2b6763..c32b171c0ba7 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -946,6 +946,10 @@ struct hdr_output_metadata {
>   * Request that the kernel sends back a vblank event (see
>   * struct drm_event_vblank) with the &DRM_EVENT_FLIP_COMPLETE type when the
>   * page-flip is done.
> + *
> + * When used with the atomic uAPI, vblank events will be sent for every CRTC
> + * included in the commit. At least one CRTC must be included, and all included
> + * CRTCs must be turned on.
>   */
>  #define DRM_MODE_PAGE_FLIP_EVENT 0x01
>  /**

What about interactions with DRM_CAP_CRTC_IN_VBLANK_EVENT?

Is there one event per CRTC even without the cap? And in that case
userspace cannot see which CRTC an event is for, but it must wait for
the correct number of events to be sure each one completed? Which is
horribly fragile, so maybe we should recommend to not even try without
the cap?

FWIW, Weston does not use atomic without the cap, so I can't peek there.

What does "including a CRTC in a commit" mean? I think a CRTC is
included if the commit touches any plane on the CRTC, but there is no
need to touch any CRTC property to have the CRTC included, right?
Touching connector properties pulls in the CRTC as well?


Thanks,
pq
