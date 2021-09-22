Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBA0414706
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 12:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AC66EB72;
	Wed, 22 Sep 2021 10:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5026EB72;
 Wed, 22 Sep 2021 10:55:31 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id cf2so1601120qvb.10;
 Wed, 22 Sep 2021 03:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/ickBN4sxuNoZS5aIyM24sHBfu2G2WppVsO8x/cnD8U=;
 b=joGJCqAcevqp1tkoGsMmtdP32hjLSthS5w3MAZimwyTk0AjwmCIMAuAzAVHLRuV0EY
 U0VuIQyQgqUz3Js97/vT+1/8cOT1rc9zeYh+96IXOnKIWmrtQa/bLsAKrIQeObOLeWpH
 jr92lpXGw/RZlJqDXYsx/hcnO/Ye4f+AKaHkvKB67jxpyZjm0RDrkR6PNSrxCjpjLPKu
 GESXbJBxXd3U6eIKIdFHfAcp2okeWZvRwhxoMv3Mk+I98Y7NWBDUqAoGMqJ4orVshdgK
 6N9O7EoS8lGMgRN3JXKSmtnuKLHwJGgI53zn3+V1RafnQVnu1TBODnRrIcSvd+QpLCoK
 CvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/ickBN4sxuNoZS5aIyM24sHBfu2G2WppVsO8x/cnD8U=;
 b=iW+X44E/KF5twliY2CWG/8D7LZQW+xmJXNoP38BgpFkLgh2Odm/RyXPDkupCAcObpr
 2Q9+C5yPoI8f9YInhw+vZZDuAO3at497pFsvjlKm9RXfLComOGqG2RR2df0f7h366A9l
 hFS6A8dkmRZeICnyrT4JIDrTKZS1PyqWS6dJwZcosV0Z4YX97mXY1QRFyYIoe0j1s4/X
 ItAUI0/ThGvOOzi5cDFCx+6npVCRgsZ+wQ35uiUj35c2xyn/in12E/O25j7Cn0bG4Ofn
 HWAD/PcNGMhRKpYbwkwKeIq6j52jMJ60v0KI7h5WcbNU9gpdqUI7OjejUtav1yDE9yfI
 ILSQ==
X-Gm-Message-State: AOAM5320qc65zNjY4EsItMq6euxmaTW7cuEnR7gm9C8h1P97A7l5atIb
 VK471J8C1bZhY1Ak0KAholEnENUl48XYgRnhMfs=
X-Google-Smtp-Source: ABdhPJzkLCaOatuugLxOHBT1YsmTT+BjhxRzqUVV9ujZa7aKYoAfIjeyWIr2mRlEPx8I0YjNJ4PK1CIfGDykr7QjRro=
X-Received: by 2002:a05:6214:153:: with SMTP id
 x19mr35483439qvs.18.1632308130779; 
 Wed, 22 Sep 2021 03:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210922083807.888206-1-thomas.hellstrom@linux.intel.com>
 <20210922083807.888206-3-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210922083807.888206-3-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 22 Sep 2021 11:55:02 +0100
Message-ID: <CAM0jSHPWMTq0TpLbpUwczGMDjcvh-kjw35d-xUQ_9RNrj9hY+w@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/i915/ttm: Fix lockdep warning in
 __i915_gem_free_object()
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
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

On Wed, 22 Sept 2021 at 09:38, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> In the mman selftest, some tests make the ttm_bo_init_reserved() fail,
> which may trigger a call to the i915_ttm_bo_destroy() function.
> However, at this point the gem object refcount is set to 1, which
> triggers a lockdep warning in __i915_gem_free_object() and a
> corresponding failure in DG1 BAT, i915_selftest@live@mman.
>
> Fix this by clearing the gem object refcount if called from that
> failure path.
>
> Fixes: f9b23c157a78 ("drm/i915: Move __i915_gem_free_object to ttm_bo_des=
troy")
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index b94497989995..b1f561543ff3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -900,6 +900,10 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object *b=
o)
>
>         i915_ttm_backup_free(obj);
>
> +       /* Failure during ttm_bo_init_reserved leaves the refcount set to=
 1. */
> +       if (IS_ENABLED(CONFIG_LOCKDEP) && !obj->ttm.created)
> +               refcount_set(&obj->base.refcount.refcount, 0);
> +
>         /* This releases all gem object bindings to the backend. */
>         __i915_gem_free_object(obj);

The __i915_gem_free_object is also nuking stuff like mm.placements,
which is still owned by the caller AFAIK, or at least it is until we
have successfully initialised the object, so smells like potential
double free? Can we easily move that under the ttm.created check?
Otherwise maybe we are meant to move the mm.placements handling into
the RCU callback?

>
> --
> 2.31.1
>
