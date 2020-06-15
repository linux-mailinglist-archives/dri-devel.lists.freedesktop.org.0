Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3361FA315
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 23:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E246E52F;
	Mon, 15 Jun 2020 21:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7236E52F;
 Mon, 15 Jun 2020 21:52:26 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id r9so1010716wmh.2;
 Mon, 15 Jun 2020 14:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pMrmQR08NbuxMuMQ9XTt0aege9jgLzpM8HoXAcM2lr4=;
 b=tExXfijlyDzCgiPKBttpScZpH7EE0HQbvlprkUGn54gjurJarPMV0iKnTgho8tBucC
 nk+dgtb0H3n7ccO1adYneQODQn9PnSRoqgDVhPAffWjhSq3p+PeGnV42A6hU3HcjR7cw
 OCuZuQBKhZTKSRlocN73E1fSqeHc6W5WwGoEtWxsQUTIXGBLzpPOqiHkB9lQUo8kqKMI
 LdykCrm6aFJY7yehqk1cxFzlJ3R1GIRe8uqQi1r+WXlFRc1/F57y8KV90Ga6W+S11i7n
 7Kb5Hcw1py9IfXCwtjD/zPBchiFqChNmuTgbcLd/9kFHBg5CzWhpBMdLfH8UHGVpFLnv
 cEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pMrmQR08NbuxMuMQ9XTt0aege9jgLzpM8HoXAcM2lr4=;
 b=UgZl3CcN0yjMz/hk/5Uti4xXkabSoG+qlnX03rpWtYdNopxl5mhXFf/4JFPtUHlRka
 6FCY20QR0VxX4MEQLH1KQKeqLFtZwdLVN4PwEUZKVpzVSv80jnVaRnPeBCRNi+AiGCGd
 qKV/Ctvgowv6RGCfAGK8JBJnVZo4oYIoaf5uSR+AHz0G6UAWkSVTF4IR7Mt9WbgA/6A0
 zz5ucI9uSY0eyxbk28dW6X98tTg7dW2ZivT6SmJamIr2gWz/ZmTw17lKpd+4sN+k2kUU
 wS+VYJV/Fd4bmSgIIMeisoMsA8q46NXeB/GUNcDq8VmhBtqHN5L2JhwzeVbXX0PYMX/y
 PtCQ==
X-Gm-Message-State: AOAM532IPc+ExKaGlmZvCsyI57uGj9U1sLcBJuBCE5+/Tg0jDdYazABy
 Ux8k+l2Gkpdz9kE0mp0IMngNsJuO1Yia9rW1jgk=
X-Google-Smtp-Source: ABdhPJwSxUGklIsrSu/SHjWDyPn/otPVKio1ZbHbv4bC0MTX+tgbgI1YdyYgobjmthIhIY4phxxYn+K1f0UdCUPIRMU=
X-Received: by 2002:a1c:32c4:: with SMTP id y187mr1309269wmy.79.1592257945080; 
 Mon, 15 Jun 2020 14:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200614015539.123654-1-pakki001@umn.edu>
In-Reply-To: <20200614015539.123654-1-pakki001@umn.edu>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Jun 2020 17:52:14 -0400
Message-ID: <CADnq5_NK7YP-yfN1SWhXk0Kromxs46LbEtFSTfA94cbhvgUEGQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: fix multiple reference count leak
To: Aditya Pakki <pakki001@umn.edu>
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
Cc: David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, wu000273@umn.edu,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 15, 2020 at 3:27 AM Aditya Pakki <pakki001@umn.edu> wrote:
>
> On calling pm_runtime_get_sync() the reference count of the device
> is incremented. In case of failure, decrement the
> reference count before returning the error.

Is this required if pm_runtime_get_sync() fails?

Alex

>
> Signed-off-by: Aditya Pakki <pakki001@umn.edu>
> ---
>  drivers/gpu/drm/radeon/radeon_connectors.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
> index fe12d9d91d7a..e30834434442 100644
> --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> @@ -879,8 +879,10 @@ radeon_lvds_detect(struct drm_connector *connector, bool force)
>
>         if (!drm_kms_helper_is_poll_worker()) {
>                 r = pm_runtime_get_sync(connector->dev->dev);
> -               if (r < 0)
> +               if (r < 0) {
> +                       pm_runtime_put_autosuspend(connector->dev->dev);
>                         return connector_status_disconnected;
> +               }
>         }
>
>         if (encoder) {
> @@ -1025,8 +1027,10 @@ radeon_vga_detect(struct drm_connector *connector, bool force)
>
>         if (!drm_kms_helper_is_poll_worker()) {
>                 r = pm_runtime_get_sync(connector->dev->dev);
> -               if (r < 0)
> +               if (r < 0) {
> +                       pm_runtime_put_autosuspend(connector->dev->dev);
>                         return connector_status_disconnected;
> +               }
>         }
>
>         encoder = radeon_best_single_encoder(connector);
> @@ -1163,8 +1167,10 @@ radeon_tv_detect(struct drm_connector *connector, bool force)
>
>         if (!drm_kms_helper_is_poll_worker()) {
>                 r = pm_runtime_get_sync(connector->dev->dev);
> -               if (r < 0)
> +               if (r < 0) {
> +                       pm_runtime_put_autosuspend(connector->dev->dev);
>                         return connector_status_disconnected;
> +               }
>         }
>
>         encoder = radeon_best_single_encoder(connector);
> @@ -1247,8 +1253,10 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
>
>         if (!drm_kms_helper_is_poll_worker()) {
>                 r = pm_runtime_get_sync(connector->dev->dev);
> -               if (r < 0)
> +               if (r < 0) {
> +                       pm_runtime_put_autosuspend(connector->dev->dev);
>                         return connector_status_disconnected;
> +               }
>         }
>
>         if (radeon_connector->detected_hpd_without_ddc) {
> @@ -1657,8 +1665,10 @@ radeon_dp_detect(struct drm_connector *connector, bool force)
>
>         if (!drm_kms_helper_is_poll_worker()) {
>                 r = pm_runtime_get_sync(connector->dev->dev);
> -               if (r < 0)
> +               if (r < 0) {
> +                       pm_runtime_put_autosuspend(connector->dev->dev);
>                         return connector_status_disconnected;
> +               }
>         }
>
>         if (!force && radeon_check_hpd_status_unchanged(connector)) {
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
