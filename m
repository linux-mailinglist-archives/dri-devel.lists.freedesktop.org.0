Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BBD72991B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 14:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE0110E69E;
	Fri,  9 Jun 2023 12:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90BB10E69E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 12:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686312573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NeKki35R3nHZloLkDG1ZCPTX7wZF5l/41ruoekgsNnQ=;
 b=gFcpL6BOenvfHAiEaRV2yqfVmeNZWYpKfQ7pcJ7GJfu6L/S+5Xo0N3AJ6vtAblBn6AmpiD
 NGXFyxRLBMXqAFRCEw6pehtVw98Z2N5hjZo7hojhPVnCu2ZHg38JYVr3dkFB93LGffTAhd
 e+qk9doCuMehU8MiEMHrwCQT0M3ethU=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-wt9RWVcsPluYi7izQjrQWw-1; Fri, 09 Jun 2023 08:09:21 -0400
X-MC-Unique: wt9RWVcsPluYi7izQjrQWw-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b0982c99adso1154371fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 05:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686312560; x=1688904560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NeKki35R3nHZloLkDG1ZCPTX7wZF5l/41ruoekgsNnQ=;
 b=BUwwX292LNgKXM3sHxiiK9qstqMQnF2sLKe0ChtbYrTLseevObVC0aXhCr2+qeCjk7
 pmQaDj+npqng7W/jUQFOKRpVQLw+N0g2EJMADiN4tlN2OWbSpbNvovlule6XPf9TWp6q
 cMAsqDZM76H1e+EwGU56QUgah99kU15AXykJVspcmkCQrgWCJv8WQGvA6K2OhT5Of8uF
 BgDg0iJEQppo6bFLuL/WuG3B5yvOiq7xGrpPR5Klh812QvupnA7xAcI0GgZZ4mlQ9QaM
 h1Mg8YsZHQBDQr89aA7q4r+yZHnEaVDUSRiXBaa0Dle0pYTb38QnghNGIVv3STbGsCuz
 X1bQ==
X-Gm-Message-State: AC+VfDwUy3bMXrPP5INyyJD7brRQW7dgVHuRt1Ey0okB95qjGpbdsen/
 2gCisgeeVu7axzWkZJsO8VpqynZb17fP86XxnBJLv1UYmGdeN7V2M8L5xWxGJf5egtxDi4ZOyZB
 kOdEqyiyTr5kmxcMID6fiGJOke4K7iCw6Wt+KYn8VsAWn
X-Received: by 2002:a2e:b10a:0:b0:2b1:dc69:67fa with SMTP id
 p10-20020a2eb10a000000b002b1dc6967famr905441ljl.0.1686312560206; 
 Fri, 09 Jun 2023 05:09:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4sGvitz6MAqdd6tZ18gCtAtzFKKnM7SaCsBhMqHlpY5riWAgGlYFCIjNbTYVkKWuGGwpXgGW07vlqLixzWvUU=
X-Received: by 2002:a2e:b10a:0:b0:2b1:dc69:67fa with SMTP id
 p10-20020a2eb10a000000b002b1dc6967famr905434ljl.0.1686312559950; Fri, 09 Jun
 2023 05:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230609081732.3842341-1-lee@kernel.org>
 <20230609081732.3842341-10-lee@kernel.org>
In-Reply-To: <20230609081732.3842341-10-lee@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 9 Jun 2023 14:09:09 +0200
Message-ID: <CACO55ttX2efbweyUMoTQj4_aCmT6z_ke4_0vScoYUjtrzSaprw@mail.gmail.com>
Subject: Re: [RESEND 09/15] drm/nouveau/nvkm/engine/gr/gf100: Demote kerneldoc
 abuse
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
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:1044: warning: This comme=
nt starts with '/**', but isn't a kernel-doc comment. Refer Documentation/d=
oc-guide/kernel-doc.rst
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
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/gr/gf100.c
> index 5f20079c3660f..7d4c2264d3c05 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> @@ -1040,7 +1040,7 @@ gf100_gr_zbc_init(struct gf100_gr *gr)
>         }
>  }
>
> -/**
> +/*
>   * Wait until GR goes idle. GR is considered idle if it is disabled by t=
he
>   * MC (0x200) register, or GR is not busy and a context switch is not in
>   * progress.
> --
> 2.41.0.162.gfafddb0af9-goog
>

