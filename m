Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2CE72991C
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 14:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9976E10E6A2;
	Fri,  9 Jun 2023 12:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6494110E6A2
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 12:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686312597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8K8zOc2VRoAIFNnTvussYfo75dEOYDyNWNKLCNNQoBA=;
 b=S+RSh4fjb9FJoLZpieG2dMjd0gg3po2JsgceZxZCkEjR7dC6OV2/ibxa3fPtHAZdkQ0C5M
 hBunSRcZE/4nMH+xXA9oPzFfD/nmkphGDytTdbOlMFRwuKJPXeynhMJlGCWtC1DLLwTpGE
 eOEKbP59uT5ULVU0//jUChxwR9OoZYE=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-2NWIddKaPxOizxibMzMPXA-1; Fri, 09 Jun 2023 08:09:56 -0400
X-MC-Unique: 2NWIddKaPxOizxibMzMPXA-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2af1cf1a118so2389721fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 05:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686312595; x=1688904595;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8K8zOc2VRoAIFNnTvussYfo75dEOYDyNWNKLCNNQoBA=;
 b=P7KCE8YYEEtYP54OunhL6ilbhYj9LJ0Zw+gWN2+NfaeVFTgJt3iGLmjHOshjUS4JIw
 feCFGAZvGXajQIJeVCpNyu+lWcZa65+aeToJ9+7e/+U+7u9YBQzSyZBtgEOJZTQiJV8W
 6PEfKEfXjOYKyWCpdvKcbfL8/1CSjYrHWz4299pigqYf+Kl82XBPencLv5xPl5a+ggzi
 UCklfxZ9haydEYCxe3Lhirhz0waACgFu31BIZuYzKZNZi4+757ocEHnOj0dRg1WYoHcI
 iEDuFwkMG3WqqG6i35rvXw916lR+OrzZIYztJwtwIIH1KiV/7/Is9x4RzNMwU5yWxVzP
 34Lg==
X-Gm-Message-State: AC+VfDz3YFEf91qEzys96MBdPUORTL17mn91e2qwKteKeZ8mnw6O+L9R
 slS99QhL2eJZMinwpPKDfwobsG8ijUMRXyoY+ZrERAUyePHgJXG2NiGsMyvqZ7VkrMUq3i9mUd1
 oTqGzaVYMlrHvwAK6kTP3iuopz2a4pKoDtIZJ64QF0ydq
X-Received: by 2002:a2e:b108:0:b0:2b1:dc69:67fd with SMTP id
 p8-20020a2eb108000000b002b1dc6967fdmr808631ljl.5.1686312594959; 
 Fri, 09 Jun 2023 05:09:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5x4JIMK1TQ12rpra/mBTbK0YAIXvw7OKgm1UtrERedLpibE3QvP+XQvRXtwHvlv51+JuJjz8J+mA4OusmOEjA=
X-Received: by 2002:a2e:b108:0:b0:2b1:dc69:67fd with SMTP id
 p8-20020a2eb108000000b002b1dc6967fdmr808618ljl.5.1686312594802; Fri, 09 Jun
 2023 05:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230609081732.3842341-1-lee@kernel.org>
 <20230609081732.3842341-13-lee@kernel.org>
In-Reply-To: <20230609081732.3842341-13-lee@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 9 Jun 2023 14:09:43 +0200
Message-ID: <CACO55tsP+FgJRSZS0gEVpOFx-GgNhGA3kr6KLvURVgmpEmWrFA@mail.gmail.com>
Subject: Re: [RESEND 12/15] drm/nouveau/dispnv04/crtc: Demote kerneldoc abuses
To: Lee Jones <lee@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 9, 2023 at 10:18=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:453: warning: This comment start=
s with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide=
/kernel-doc.rst
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:629: warning: This comment start=
s with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide=
/kernel-doc.rst
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/no=
uveau/dispnv04/crtc.c
> index a6f2e681bde98..7794902df17d5 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> @@ -449,7 +449,7 @@ nv_crtc_mode_set_vga(struct drm_crtc *crtc, struct dr=
m_display_mode *mode)
>         regp->Attribute[NV_CIO_AR_CSEL_INDEX] =3D 0x00;
>  }
>
> -/**
> +/*
>   * Sets up registers for the given mode/adjusted_mode pair.
>   *
>   * The clocks, CRTCs and outputs attached to this CRTC must be off.
> @@ -625,7 +625,7 @@ nv_crtc_swap_fbs(struct drm_crtc *crtc, struct drm_fr=
amebuffer *old_fb)
>         return ret;
>  }
>
> -/**
> +/*
>   * Sets up registers for the given mode/adjusted_mode pair.
>   *
>   * The clocks, CRTCs and outputs attached to this CRTC must be off.
> --
> 2.41.0.162.gfafddb0af9-goog
>

