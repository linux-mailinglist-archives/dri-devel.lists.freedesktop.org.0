Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FAF9D2F02
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 20:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1848C10E0B5;
	Tue, 19 Nov 2024 19:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="JUggD1w9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E6610E0B5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 19:46:29 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e38866c8b2dso2734863276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 11:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1732045589; x=1732650389;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Z54RSB7kkX3a/skEj68OptLUrr1CiRFUQ3ZXLJGOls=;
 b=JUggD1w9F2kmhIkiCGi1AxWkbzGCrozuVmJWJi8MFrI27zbtumPg44jQbgeCe/jLiu
 U2uYXZulUrsxi+qfd3F5tpk/iVs/+jCPG2Tdrn7ew9TklNdSXZEB/SsjU5Uvm8ORt+O+
 kv7lcE+jzCGtG4jah68frdIM4CLIMzK+wD2Yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732045589; x=1732650389;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Z54RSB7kkX3a/skEj68OptLUrr1CiRFUQ3ZXLJGOls=;
 b=jFUIpJOvf0BwaTNmP3v3gI57uJ5w0nZWkz7RjmXZuddFUOxqS1425a/5XXZrLDkp7F
 MiFYH8eDFuIdzLQRyQv6AFdDINQ/2gO/9+De2q1TmjxLU1icSywAcF84B72TuK7nQx3I
 3pWbURckoS86TdEuyWhjfAPmzJ75u0Z70+1yhrt6g7lZMcdMDtUp8q/b9RQRZj4YQmKf
 PRUtsNvtQdf9cEpjABzVHg9U5G98mZ49op4nuAdz3XMIqbtZY9win06RVBivUZZsTv/j
 OsluGEV817hnH/NDwbMCCjFNJrNrcWQThj9jHyeWxHaIGNxAYLttTJMRcp87T4eWcoGr
 vBsA==
X-Gm-Message-State: AOJu0Yx9UqxdX1G0oox7a0RK9qDeoPsnRC+Wz6wcQCtT3Ikja0HG15FC
 nye1ZaecgFnZjef6THiLgVltIHV40zRycZke7mX7O+dNdKKf+P7y0CE4CH8k/hAtJ60cYXy3yl5
 BcQghkBsuC3P2HQ9koAi5UzwcakWKXYhEd8VM
X-Google-Smtp-Source: AGHT+IH4SaPyssEvXni9sQI99VUxx9ldIJLcw4VGJ/J2/tj8auVh19Ny/ylkD5XCwQSgw+pxhLn8EgTD735kK/yz/U0=
X-Received: by 2002:a05:6902:2a42:b0:e38:b44d:a959 with SMTP id
 3f1490d57ef6-e38b44dac0fmr4389834276.42.1732045588678; Tue, 19 Nov 2024
 11:46:28 -0800 (PST)
MIME-Version: 1.0
References: <20241018210046.2222313-1-maaz.mombasawala@broadcom.com>
 <20241018210046.2222313-3-maaz.mombasawala@broadcom.com>
In-Reply-To: <20241018210046.2222313-3-maaz.mombasawala@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 19 Nov 2024 14:46:17 -0500
Message-ID: <CABQX2QPnOvN8FXK34OU7=zAMtE6wZAwostuHKzzenQ=RCG8+eg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/vmwgfx: Support hw_destroy for userspace
 managed surfaces
To: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 ian.forbes@broadcom.com, martin.krastev@broadcom.com
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

On Fri, Oct 18, 2024 at 5:01=E2=80=AFPM Maaz Mombasawala
<maaz.mombasawala@broadcom.com> wrote:
>
> A userspace may create a userspace managed surface but not destroy it,
> add hw_destroy function for userspace surfaces so that vmwgfx records the
> destroy command and submits it when the userspace context is destroyed.
>
> Signed-off-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  1 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c |  7 ++++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 41 +++++++++++++++++++++++++
>  3 files changed, 48 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.h
> index 67f75d366f9d..6cb3f648eaad 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -267,6 +267,7 @@ struct vmw_surface {
>  struct vmw_cmdbuf_surface {
>         struct vmw_surface surface;
>         struct ttm_base_object base;
> +       bool cmdbuf_destroy;
>  };
>
>  struct vmw_fifo_state {
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_execbuf.c
> index 0468c9f4f293..70f816062fd2 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -3374,6 +3374,8 @@ static int vmw_cmd_destroy_gb_surface(struct vmw_pr=
ivate *dev_priv,
>                                       SVGA3dCmdHeader *header)
>  {
>         VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDestroyGBSurface);
> +       struct vmw_resource *res;
> +       struct vmw_cmdbuf_surface *surface;
>         int ret;
>
>         cmd =3D container_of(header, typeof(*cmd), header);
> @@ -3382,10 +3384,13 @@ static int vmw_cmd_destroy_gb_surface(struct vmw_=
private *dev_priv,
>                 return -EINVAL;
>
>         ret =3D vmw_cmd_res_check(dev_priv, sw_context, vmw_res_surface,
> -                               VMW_RES_DIRTY_NONE, NULL, &cmd->body.sid,=
 NULL);
> +                               VMW_RES_DIRTY_NONE, NULL, &cmd->body.sid,=
 &res);
>         if (unlikely(ret))
>                 return ret;
>
> +       surface =3D vmw_res_to_cmdbuf_srf(res);
> +       surface->cmdbuf_destroy =3D true;
> +
>         ret =3D vmw_cmdbuf_surface_destroy(dev_priv, sw_context, cmd->bod=
y.sid);
>         if (unlikely(ret))
>                 return ret;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_surface.c
> index 4dfce3ea104c..26a71af79a39 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> @@ -2403,6 +2403,44 @@ static void vmw_cmdbuf_surface_base_release(struct=
 ttm_base_object **p_base)
>  }
>
>
> +static void vmw_cmdbuf_surface_hw_destroy(struct vmw_resource *res)
> +{
> +       struct vmw_private *dev_priv =3D res->dev_priv;
> +       struct vmw_cmdbuf_surface *surface;
> +       struct {
> +               SVGA3dCmdHeader header;
> +               SVGA3dCmdDestroyGBSurface body;
> +       } *cmd;
> +
> +       if (res->id =3D=3D -1)
> +               return;
> +
> +       surface =3D vmw_res_to_cmdbuf_srf(res);
> +       /**
> +        * If userspace is submitting a destroy command there is no need =
for
> +        * kernel to do so.
> +        */
> +       if (surface->cmdbuf_destroy)
> +               return;
> +
> +       mutex_lock(&dev_priv->binding_mutex);
> +       vmw_view_surface_list_destroy(dev_priv, &surface->surface.view_li=
st);
> +       vmw_binding_res_list_scrub(&res->binding_head);
> +
> +       cmd =3D VMW_CMD_RESERVE(dev_priv, sizeof(*cmd));
> +       if (unlikely(!cmd)) {
> +               mutex_unlock(&dev_priv->binding_mutex);
> +               return;
> +       }
> +
> +       cmd->header.id =3D SVGA_3D_CMD_DESTROY_GB_SURFACE;
> +       cmd->header.size =3D sizeof(cmd->body);
> +       cmd->body.sid =3D res->id;
> +       vmw_cmd_commit(dev_priv, sizeof(*cmd));
> +       mutex_unlock(&dev_priv->binding_mutex);
> +}
> +
> +
>  int vmw_cmdbuf_surface_define(struct vmw_private *dev_priv,
>                               struct vmw_sw_context *sw_context,
>                               struct vmw_surface_metadata *metadata,
> @@ -2484,6 +2522,9 @@ int vmw_cmdbuf_surface_define(struct vmw_private *d=
ev_priv,
>                 return ret;
>         }
>
> +       res->hw_destroy =3D vmw_cmdbuf_surface_hw_destroy;
> +       surface->cmdbuf_destroy =3D false;
> +
>         return 0;
>  }
>
> --
> 2.43.0
>

Hmm, this looks like a hack. So what seems to be happening is that the
reference count on the resource is still active. When vmw_resource
reference count goes to zero it should call hw_destroy, which should
invoke vmw_gb_surface_destroy which should delete the surface. It
looks like the reference count of userspace resources is off, so with
this patch we'd be destroying the gb surface but the vmw_resource is
still alive. If that's the case, then what we want to do is fix the
reference counting of the vmw_resource rather than working around it.

z
