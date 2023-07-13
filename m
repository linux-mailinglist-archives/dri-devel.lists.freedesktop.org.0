Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3132B751B6A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765F010E181;
	Thu, 13 Jul 2023 08:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EC210E189
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:23:25 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 27B286607045;
 Thu, 13 Jul 2023 09:23:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689236604;
 bh=W1F/vV/N4a9DB6loI6/DrJek6TYv/twZp7bPwj7yA6M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gRvdkhkwg6tSKnykEbLrXRqeNr5kpoNhEr8rD4TF8P8YZECPGGP+nuc/3LiY5E2eU
 pDc7MTPs5uGujgU1MXAO8Rl0y35SohsvOvAw11AuPZmNeE332FJfSX12vFKIFWJnpm
 gvKHAWfO0PrUi0gJ9DQyFqWwTdz7zP0N0Hgc3YDzyDjh/HcasinKrXcYZ6yUZOWXF1
 Hg8x8oLkGOdzyqfWn5CdLizLhfAPJoBognEOmGnaHdVMPAXkgxGvIdjsxFQqpxFhaR
 MDYyORRIGo/yj1JN7G2S1ih2beIhrv6D2vNSW/fLqgsneDTzB6PyjFuaSY2jcIl8+Y
 0VMaW8JFdAP0A==
Date: Thu, 13 Jul 2023 11:23:21 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 3/4] drm/doc: document PAGE_FLIP_EVENT |
 PAGE_FLIP_ASYNC
Message-ID: <20230713112321.7f160c0f.pekka.paalanen@collabora.com>
In-Reply-To: <20230712135723.173506-3-contact@emersion.fr>
References: <20230712135723.173506-1-contact@emersion.fr>
 <20230712135723.173506-3-contact@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Jul 2023 13:57:32 +0000
Simon Ser <contact@emersion.fr> wrote:

> Explain what the event looks like when both flags are specified.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>
> ---
>=20
> Driver developers: please confirm or deny this documentation. I'm just
> guessing here.
>=20
>  include/uapi/drm/drm_mode.h | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index c32b171c0ba7..cb4bbfe15d3a 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -950,6 +950,9 @@ struct hdr_output_metadata {
>   * When used with the atomic uAPI, vblank events will be sent for every =
CRTC
>   * included in the commit. At least one CRTC must be included, and all i=
ncluded
>   * CRTCs must be turned on.
> + *
> + * When used with &DRM_MODE_PAGE_FLIP_ASYNC, the page-flip event will ha=
ve the
> + * same timings and sequence number as the previous effective page-flip.
>   */
>  #define DRM_MODE_PAGE_FLIP_EVENT 0x01
>  /**

This wording would mean that if you do a continuous stream of async
flips indefinitely, the timestamp and sequence number would never
change at all. I think "the previous effective page-flip" needs
different words.

Hmm, no. I'm misunderstanding "effective" here. But all the flips are
effective, right? All will be programmed into hardware.


Thanks,
pq
