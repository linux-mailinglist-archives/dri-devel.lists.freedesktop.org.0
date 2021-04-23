Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5F5369BD9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 23:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344826EC52;
	Fri, 23 Apr 2021 21:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095996EC50;
 Fri, 23 Apr 2021 21:07:15 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id p8so1728449iol.11;
 Fri, 23 Apr 2021 14:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vGf4Bqg3eO6JS3gvF6LxMt8XkWMGCm3Fd5yjKYFBgF8=;
 b=E203/yiOlCKbcP6eZiGFqffMqZDLPbUDVm5ztZ2yZMyDkAcLnf6RLnV4cJqB6r++zF
 l5OB6zgsR5RYJdy431rqYeKNpN24j+lRL29u6tZTkFO7V9E7OlybUOKGC0nRGaRGczcR
 UTNRQ4tFlKBfTKy+1mecrRZN1ROaGg+PShbz34OHN3+Eut4XhMbgu2/RXVBVlHT2XCfg
 ewduK7/Kx3nUnJHP083CS/vMbJlvREtcuaKPJFBsqoc5bCNMFuJBlkALI9aFhGJ0J3lU
 F1LAhHPRD7hZPkeX733dE9nE2tqohmtOm0cll0R+LqBg6M6YXKPSqmBiC+aY1LIIj7mf
 J7hA==
X-Gm-Message-State: AOAM532nosdB2QoLRKesuURSyMPgSfFVrogGPL85buUQq4fFgxUFIFOf
 Pi5knQzN/vIUa+EehIChquEoeyszm3ksU3jrhdA=
X-Google-Smtp-Source: ABdhPJx/mGXYebrjo1LW38fgTdwSQnNr3RmcE4CILvZv37TRPOr8OlvisBQvXkXDoBESh8c9agnzKhcwdoToZrcFn2Y=
X-Received: by 2002:a5e:d515:: with SMTP id e21mr4718257iom.30.1619212035381; 
 Fri, 23 Apr 2021 14:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210423184309.207645-1-lyude@redhat.com>
 <20210423184309.207645-3-lyude@redhat.com>
In-Reply-To: <20210423184309.207645-3-lyude@redhat.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 23 Apr 2021 17:07:04 -0400
Message-ID: <CAKb7UvgpMO60gRzmJY0V5nOsT8u9y2hFLazmVJ+pEiedEKOOhQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v4 02/17] drm/nouveau/kms/nv50-: Move AUX
 adapter reg to connector late register/early unregister
To: Lyude Paul <lyude@redhat.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some trivia, no comment on the real logic of the changes:

On Fri, Apr 23, 2021 at 2:43 PM Lyude Paul <lyude@redhat.com> wrote:
>
> Since AUX adapters on nouveau have their respective DRM connectors as
> parents, we need to make sure that we register then after their connectors.

then -> them

>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 25 ++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 61e6d7412505..c04044be3d32 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -401,7 +401,6 @@ nouveau_connector_destroy(struct drm_connector *connector)
>         drm_connector_cleanup(connector);
>         if (nv_connector->aux.transfer) {
>                 drm_dp_cec_unregister_connector(&nv_connector->aux);
> -               drm_dp_aux_unregister(&nv_connector->aux);
>                 kfree(nv_connector->aux.name);
>         }
>         kfree(connector);
> @@ -905,13 +904,29 @@ nouveau_connector_late_register(struct drm_connector *connector)
>         int ret;
>
>         ret = nouveau_backlight_init(connector);
> +       if (ret)
> +               return ret;
>
> +       if (connector->connector_type == DRM_MODE_CONNECTOR_eDP ||
> +           connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
> +               ret = drm_dp_aux_register(&nouveau_connector(connector)->aux);
> +               if (ret)
> +                       goto backlight_fini;
> +       }
> +
> +       return 0;
> +backlight_fini:
> +       nouveau_backlight_fini(connector);
>         return ret;
>  }
>
>  static void
>  nouveau_connector_early_unregister(struct drm_connector *connector)
>  {
> +       if (connector->connector_type == DRM_MODE_CONNECTOR_eDP ||
> +           connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
> +               drm_dp_aux_unregister(&nouveau_connector(connector)->aux);
> +
>         nouveau_backlight_fini(connector);
>  }
>
> @@ -1343,14 +1358,14 @@ nouveau_connector_create(struct drm_device *dev,
>                 snprintf(aux_name, sizeof(aux_name), "sor-%04x-%04x",
>                          dcbe->hasht, dcbe->hashm);
>                 nv_connector->aux.name = kstrdup(aux_name, GFP_KERNEL);
> -               ret = drm_dp_aux_register(&nv_connector->aux);
> +               drm_dp_aux_init(&nv_connector->aux);
>                 if (ret) {
> -                       NV_ERROR(drm, "failed to register aux channel\n");
> +                       NV_ERROR(drm, "Failed to init AUX adapter for sor-%04x-%04x: %d\n",

Maybe just use aux_name instead of rebuilding the string again?

> +                                dcbe->hasht, dcbe->hashm, ret);
>                         kfree(nv_connector);
>                         return ERR_PTR(ret);
>                 }
> -               funcs = &nouveau_connector_funcs;
> -               break;
> +               fallthrough;
>         default:
>                 funcs = &nouveau_connector_funcs;
>                 break;
> --
> 2.30.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
