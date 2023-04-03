Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE93C6D4660
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 16:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9647310E499;
	Mon,  3 Apr 2023 14:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79D210E49A;
 Mon,  3 Apr 2023 14:02:09 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id i6so34888836ybu.8;
 Mon, 03 Apr 2023 07:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680530528;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lcw7CsrgJYECAzGsrUJFDPn/CnlU4ZU6smKnWO17Ae0=;
 b=mQkUbNiW0esw3jO4JiIlQGq18gSiAY8UYiaxcqykrSwc0GcoaqBnZZu81I2uh9b0A1
 W6RjLKVl30VbyvmM/i2idv4uDHjf5FsqWULm9+rm3Udncrc7RYR9sp4j0tZI9B5C0IeM
 KJ6dIETWJXYUssvxdq7zIlxWYs6U8PNgxsMnWgN1GeHA35xgTsIgpY/M/wt5uVyYIUTO
 1veRDy7QiJ266iCrtchYEjv/qrTEZGxr+Taia7wTuyk8xUV4ZxqlRoIhCQbw5PKoCN8Z
 Q0p/8+oh/fauIXLqwmbEL27+SsDuOGh54qu2EJI8cbIlYbOVNcXPsmzRsEnUX/ScLG1P
 3rbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680530528;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lcw7CsrgJYECAzGsrUJFDPn/CnlU4ZU6smKnWO17Ae0=;
 b=0vPcc0zFSJVdBQgR4t1AL/vaAM3kHc/6RXKYhgHgBawYbc30SYdnWl9wH0mWwZsc1J
 vV4AjPLg2Y4AfDdfcWSWhr3G0ueXJhfEcG3egiIEJMdzHXubGlAMwGcJG9TMQeiAWp4c
 /Yux6+SW7VtYE6nP0DaAuVevEzAGsC4Va4luHI7EkTqxCd5kyixfE2Vckj/DPJ9rwruh
 KwvXV3XtvlteLju+lSi4W2cGRCSXtlYR0cHBufeU/3kqPCHW8i3SW8O5ng2tQS/qO5ll
 8vqIIoh4LOiYB8UqpkBJm8ck5XaTCNLjaLqrbWkPCv5tbQiYRMPOOAtOoQDyk46h0Ces
 fg/A==
X-Gm-Message-State: AAQBX9cTjnyappVq4tts9OumO2SP6y332dKhWngL/FygDIsFTwHjMcm4
 4rYZj9XdqzlmvHU+jJXBXB/dQ7v2uw7XPebjrn8=
X-Google-Smtp-Source: AKy350YKHmOqiL7IpC/Sx2Cu1gKrbtmOye3W2UwR6MNJrI4YJ78lzeG0UeVfyco2byZJzLJuVgOf3PGgek6XPCmFY1c=
X-Received: by 2002:a05:6902:1247:b0:b78:4b00:7772 with SMTP id
 t7-20020a056902124700b00b784b007772mr22643916ybu.5.1680530528529; Mon, 03 Apr
 2023 07:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230402164826.752842-1-dmitry.osipenko@collabora.com>
 <20230402164826.752842-8-dmitry.osipenko@collabora.com>
In-Reply-To: <20230402164826.752842-8-dmitry.osipenko@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 3 Apr 2023 15:01:57 +0100
Message-ID: <CACvgo529Rji9oVdSX81NJhXf9bF6jq1OTLhDff9CjHvfKLS4tA@mail.gmail.com>
Subject: Re: [PATCH v1 7/7] drm/shmem-helper: Switch to reservation lock
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 kernel@collabora.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tomi Valkeinen <tomba@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>, Tomasz Figa <tfiga@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Sun, 2 Apr 2023 at 17:49, Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:

> -void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
> +static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
>  {
> -       mutex_lock(&shmem->pages_lock);
> -       drm_gem_shmem_put_pages_locked(shmem);
> -       mutex_unlock(&shmem->pages_lock);
> +       struct drm_gem_object *obj = &shmem->base;
> +       int ret;
> +
> +       dma_resv_assert_held(shmem->base.resv);
> +
> +       drm_WARN_ON(obj->dev, obj->import_attach);
> +

We don't need this WARN_ON to happen with a reservation lock, do we?
If so, let's leave that in the caller.

> +       ret = drm_gem_shmem_get_pages(shmem);
> +
> +       return ret;
> +}
> +
> +static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
> +{
> +       struct drm_gem_object *obj = &shmem->base;
> +
> +       dma_resv_assert_held(shmem->base.resv);
> +
> +       drm_WARN_ON(obj->dev, obj->import_attach);
> +

Ditto.

With that the series is:
Reviewed-by; Emil Velikov <emil.l.velikov@gmail.com>

HTH
-Emil
