Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BFB86A755
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 04:47:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DF210E503;
	Wed, 28 Feb 2024 03:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="hmbUYBnp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD99E10E3FA
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 03:47:49 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-60941c514caso429957b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 19:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1709092068; x=1709696868;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g/DHH/2GuNtK9+6RCOfdjmOHhlQolPWcSEw0qt7/GJo=;
 b=hmbUYBnprbe8hKUZS6k0HmThEuwEU7ExHRZroES9OZL5jlqcbZ72HouTmNYrlDpMXA
 MCTn0zooFQ8JXlvrgO0U1hlMFaJ4ZSmotTOe+3n0UHGBioa/rPzfljAHZyDYDeKrOu5K
 k3zme458LR7BfNuoD/nB6CYmpmgrg2LqwmqA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709092068; x=1709696868;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g/DHH/2GuNtK9+6RCOfdjmOHhlQolPWcSEw0qt7/GJo=;
 b=eLuiZKKIUr5VenKENgSvMGJRcJVtcMi47M3ZSOK3rHmUb1L/MR14jM1Rj/jMN5lAYi
 b54exyOWiWodnecdjQHJaVsMRIP8sXeaifzvpSF+bG7B5Q4UM3GyYHSiZ0DfWjh3hubT
 dvdqevPEavK4eLlhySlvT69kUR5f7a+MYG8XOvr0p9IjvMFhe6urBUbcYMgussGdU9Aw
 4RcQ63i9pXxq6cHTLf0iL+NxDMXBjC6dUhHhDxYFe+yq7uqZLHCniNuikWKv+x6WglVQ
 zGZfnGeek0iwYPzy8ruQTpbKkh8T/xQM0y4FmMRhM/PGyfcNTj8jySp6RBhkpfsKKMqh
 OG9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqyRwdoZktGgHrMTWmb7a54wSlrIIOCvxjXz72a43eDhyVQjyg3aYqwiDuSpyC0HLEz6ZSz1/IXy+qoJJgeOy1m/92vkyTuUi3+3360RTw
X-Gm-Message-State: AOJu0Yyaav9A5KTtDLxNco1WnajVvxA93hsg/09qH2lE3sUGqCMu0mCq
 Mq1WeSFXB8O7fNBo4tCeELGejcbnEM5E59arolpB7p41GJihm5OlpAvmXWEyNRkF0/bS0D8I91y
 vaIB/Kp3j2srFpQU7aBr5eh61HbFvkPkZRc8B
X-Google-Smtp-Source: AGHT+IEuu5G9/EtkiJuIqK5DEsLbHEiSicOLnCwW2E1hTZ+I5ANhBoRZTZztYsh0saLiizBliAy4AujGNkSwBQUlm8o=
X-Received: by 2002:a05:690c:f8f:b0:5ff:7cca:a434 with SMTP id
 df15-20020a05690c0f8f00b005ff7ccaa434mr4528537ywb.51.1709092068238; Tue, 27
 Feb 2024 19:47:48 -0800 (PST)
MIME-Version: 1.0
References: <20240227113853.8464-1-tzimmermann@suse.de>
 <20240227113853.8464-9-tzimmermann@suse.de>
In-Reply-To: <20240227113853.8464-9-tzimmermann@suse.de>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 27 Feb 2024 22:47:37 -0500
Message-ID: <CABQX2QP4dCy2nfxXp3tEybtRF1UW_wMAKp1+m=2VA7Lt=C+Vvg@mail.gmail.com>
Subject: Re: [PATCH 08/13] drm/qxl: Acquire reservation lock in GEM pin/unpin
 callbacks
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, christian.koenig@amd.com, 
 sumit.semwal@linaro.org, dmitry.osipenko@collabora.com, robdclark@gmail.com, 
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run, 
 marijn.suijten@somainline.org, suijingfeng@loongson.cn, kherbst@redhat.com, 
 lyude@redhat.com, dakr@redhat.com, airlied@redhat.com, kraxel@redhat.com, 
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, 
 bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 27, 2024 at 6:39=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Acquire the reservation lock directly in GEM pin callback. Same for
> unpin. Prepares for further changes.
>
> Dma-buf locking semantics require callers to hold the buffer's
> reservation lock when invoking the pin and unpin callbacks. Prepare
> qxl accordingly by pushing locking out of the implementation. A
> follow-up patch will fix locking for all GEM code at once.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/qxl/qxl_prime.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_pr=
ime.c
> index 9169c26357d36..f2646603e12eb 100644
> --- a/drivers/gpu/drm/qxl/qxl_prime.c
> +++ b/drivers/gpu/drm/qxl/qxl_prime.c
> @@ -31,15 +31,27 @@
>  int qxl_gem_prime_pin(struct drm_gem_object *obj)
>  {
>         struct qxl_bo *bo =3D gem_to_qxl_bo(obj);
> +       int r;
>
> -       return qxl_bo_pin(bo);
> +       r =3D qxl_bo_reserve(bo);
> +       if (r)
> +               return r;
> +       r =3D qxl_bo_pin_locked(bo);
> +       qxl_bo_unreserve(bo);
> +
> +       return r;
>  }
>
>  void qxl_gem_prime_unpin(struct drm_gem_object *obj)
>  {
>         struct qxl_bo *bo =3D gem_to_qxl_bo(obj);
> +       int r;
>
> -       qxl_bo_unpin(bo);
> +       r =3D qxl_bo_reserve(bo);
> +       if (r)
> +               return;
> +       qxl_bo_unpin_locked(bo);
> +       qxl_bo_unreserve(bo);
>  }

It looks like gem_prime_pin/unpin is largely the same between a lot of
drivers now. That might be a nice cleanup in the future.

z
