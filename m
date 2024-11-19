Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0039D2EEB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 20:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECAE710E2C2;
	Tue, 19 Nov 2024 19:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="K0CjQRWc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A7810E2C2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 19:38:38 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-e388c3b0b76so2730771276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 11:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1732045117; x=1732649917;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HhgpePCgptOc0OHaTMcEc1IGcL1bcVMAtJvk4OozDSo=;
 b=K0CjQRWcnjgvjp7wM8UpCwhUu+/zLhd2RCnzFgSfvqkVGW9knXQ7G3iPE56sZBuAP2
 ARK+Ui1EYqDCZqO78zBhWYHClG+V4g6PU7lrH94tQ8o8D4HmUVshGIHs36uOLffPMHRG
 nJjjRlHzxyr1pLVOD1azALkmsuIu+d9g4c3iI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732045117; x=1732649917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HhgpePCgptOc0OHaTMcEc1IGcL1bcVMAtJvk4OozDSo=;
 b=qdN+zVeXPy+Pqf5NTHnn4y4tWxyoFeIHXhUwO7G1z+ZF3fgmcSDCzzFMGE/P2eIU3N
 SZYM0gZ5wIXfVk89Zx71Sf9aeVhGgjTmlapdP6ulSz7M5xKZzDFsUYaHSMC1rCeI/BGf
 9O1rZcEZ7eYTfXblNeT5B4Bka68sEB2SiU/6dguQWewLNRjFsE69aXpoyXFUt/fniDc+
 0LE5+0IWQZcXbRCwtkxSUgq0XrDYC5Z18AmQHq1QXJH9RwDGHLmSXKiMXu5iX2mN8RWm
 /M5p823KW0dR2vZYSGPMU6WvAXFT2B4JQ2LQiMy6rAXVPl8i+vdiLlmP+L8608siA1kg
 xbvg==
X-Gm-Message-State: AOJu0YwZEhcxLDSfBSXhYpTwlR50wwkx1pYlvYJ1DiqfW2AjBbgGXhrZ
 WdNFU6qMx1llrawRGtzv2lGTY7NII00Om1CXMbKjnBTRRGJJ3J4wQIIMQQNBDLFJAanWoc9Ot0g
 R45nNgnlUmeRlkHhoJFNlXRWEJxBfryUmqwq9
X-Google-Smtp-Source: AGHT+IENnbFPnR4pO17OqDQ80eoTZy/WKJdLXFbguKSlkyd2yK79F4YuhJqFrBe45p3jBIpyse1HdxR9rqpbqnJ02sY=
X-Received: by 2002:a05:6902:102f:b0:e38:8698:f84a with SMTP id
 3f1490d57ef6-e388698fc44mr9469657276.11.1732045117183; Tue, 19 Nov 2024
 11:38:37 -0800 (PST)
MIME-Version: 1.0
References: <20241018210046.2222313-1-maaz.mombasawala@broadcom.com>
 <20241018210046.2222313-2-maaz.mombasawala@broadcom.com>
In-Reply-To: <20241018210046.2222313-2-maaz.mombasawala@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 19 Nov 2024 14:38:26 -0500
Message-ID: <CABQX2QOgUAaMNzTm16GXqALerzku565_gdMK_vn6CNX6fnhwwg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/vmwgfx: Introduce userspace managed surfaces
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
> The kernel currently exposes both mobs and surfaces to userspace through
> ioctls. We would like to move to a model where kernel would only expose
> mobs and have userspace manage surfaces. This would simplify kernel paths
> for surfaces since these userspace managed surfaces will not support prim=
e
> transfer.
>
> Allow userspace submission of surface create and destroy commands.
> Userspace submits its own surface id which is mapped to a ttm base object
> and a resource with their corresponding ids.
>
> Signed-off-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  23 ++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 234 +++++++++++++++++++++---
>  drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c   |   3 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 157 +++++++++++++++-
>  include/uapi/drm/vmwgfx_drm.h           |   4 +
>  5 files changed, 390 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.h
> index 3f4719b3c268..67f75d366f9d 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -1,8 +1,8 @@
>  /* SPDX-License-Identifier: GPL-2.0 OR MIT */
>  /***********************************************************************=
***
>   *
> - * Copyright (c) 2009-2024 Broadcom. All Rights Reserved. The term
> - * =E2=80=9CBroadcom=E2=80=9D refers to Broadcom Inc. and/or its subsidi=
aries.
> + * Copyright (c) 2009-2024 Broadcom. All Rights Reserved.
> + * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining=
 a
>   * copy of this software and associated documentation files (the
> @@ -196,7 +196,8 @@ enum vmw_res_type {
>  enum vmw_cmdbuf_res_type {
>         vmw_cmdbuf_res_shader,
>         vmw_cmdbuf_res_view,
> -       vmw_cmdbuf_res_streamoutput
> +       vmw_cmdbuf_res_streamoutput,
> +       vmw_cmdbuf_res_surface
>  };
>
>  struct vmw_cmdbuf_res_manager;
> @@ -263,6 +264,11 @@ struct vmw_surface {
>         struct list_head view_list;
>  };
>
> +struct vmw_cmdbuf_surface {
> +       struct vmw_surface surface;
> +       struct ttm_base_object base;
> +};
> +
>  struct vmw_fifo_state {
>         unsigned long reserved_size;
>         u32 *dynamic_buffer;
> @@ -1199,6 +1205,17 @@ int vmw_dumb_create(struct drm_file *file_priv,
>                     struct drm_device *dev,
>                     struct drm_mode_create_dumb *args);
>
> +struct vmw_cmdbuf_surface *vmw_res_to_cmdbuf_srf(struct vmw_resource *re=
s);
> +
> +int vmw_cmdbuf_surface_define(struct vmw_private *dev_priv,
> +                             struct vmw_sw_context *sw_context,
> +                             struct vmw_surface_metadata *metadata,
> +                             uint32 user_key);
> +
> +int vmw_cmdbuf_surface_destroy(struct vmw_private *dev_priv,
> +                              struct vmw_sw_context *sw_context,
> +                              uint32 user_key);
> +
>  /*
>   * Shader management - vmwgfx_shader.c
>   */
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_execbuf.c
> index 2e52d73eba48..0468c9f4f293 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -1,7 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0 OR MIT
>  /***********************************************************************=
***
>   *
> - * Copyright 2009 - 2023 VMware, Inc., Palo Alto, CA., USA
> + * Copyright (c) 2009-2024 Broadcom. All Rights Reserved.
> + * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining=
 a
>   * copy of this software and associated documentation files (the
> @@ -614,28 +615,77 @@ static int vmw_resources_reserve(struct vmw_sw_cont=
ext *sw_context)
>         return ret;
>  }
>
> -/**
> - * vmw_cmd_res_check - Check that a resource is present and if so, put i=
t on the
> - * resource validate list unless it's already there.
> - *
> - * @dev_priv: Pointer to a device private structure.
> - * @sw_context: Pointer to the software context.
> - * @res_type: Resource type.
> - * @dirty: Whether to change dirty status.
> - * @converter: User-space visible type specific information.
> - * @id_loc: Pointer to the location in the command buffer currently bein=
g parsed
> - * from where the user-space resource id handle is located.
> - * @p_res: Pointer to pointer to resource validation node. Populated on
> - * exit.
> - */
>  static int
> -vmw_cmd_res_check(struct vmw_private *dev_priv,
> -                 struct vmw_sw_context *sw_context,
> -                 enum vmw_res_type res_type,
> -                 u32 dirty,
> -                 const struct vmw_user_resource_conv *converter,
> -                 uint32_t *id_loc,
> -                 struct vmw_resource **p_res)
> +vmw_cmd_cmdbuf_surface_check(struct vmw_private *dev_priv,
> +                            struct vmw_sw_context *sw_context,
> +                            u32 dirty,
> +                            uint32_t *id_loc,
> +                            struct vmw_resource **p_res)
> +{
> +       struct vmw_res_cache_entry *rcache =3D
> +               &sw_context->res_cache[vmw_res_surface];
> +       struct vmw_resource *res;
> +       int ret =3D 0;
> +       bool needs_unref =3D false;
> +       uint32 handle;
> +
> +       res =3D vmw_cmdbuf_res_lookup(sw_context->man, vmw_cmdbuf_res_sur=
face,
> +                                   *id_loc);
> +       if (!IS_ERR(res)) {
> +               kref_get(&res->kref);
> +               needs_unref =3D true;
> +               handle =3D vmw_res_to_cmdbuf_srf(res)->base.handle;
> +       } else {
> +               VMW_DEBUG_USER("Could not find resource 0x%08x.\n", *id_l=
oc);
> +               return -EINVAL;
> +       }
> +
> +       if (likely(rcache->valid_handle && handle =3D=3D rcache->handle))=
 {
> +               res =3D rcache->res;
> +               if (dirty)
> +                       vmw_validation_res_set_dirty(sw_context->ctx,
> +                                                    rcache->private, dir=
ty);
> +       } else {
> +               unsigned int size =3D
> +                       vmw_execbuf_res_size(dev_priv, vmw_res_surface);
> +
> +               ret =3D vmw_validation_preload_res(sw_context->ctx, size)=
;
> +               if (unlikely(ret !=3D 0))
> +                       goto cmdbuf_check_done;
> +
> +               ret =3D vmw_execbuf_res_val_add(sw_context, res, dirty,
> +                                             vmw_val_add_flag_none);
> +               if (unlikely(ret !=3D 0))
> +                       goto cmdbuf_check_done;
> +
> +               if (rcache->valid && rcache->res =3D=3D res) {
> +                       rcache->valid_handle =3D true;
> +                       rcache->handle =3D handle;
> +               }
> +       }
> +
> +       ret =3D vmw_resource_relocation_add(sw_context, res,
> +                                         vmw_ptr_diff(sw_context->buf_st=
art,
> +                                                      id_loc),
> +                                         vmw_res_rel_normal);
> +       if (p_res)
> +               *p_res =3D res;
> +
> +cmdbuf_check_done:
> +       if (needs_unref)
> +               vmw_resource_unreference(&res);
> +
> +       return ret;
> +}
> +
> +static int
> +vmw_cmd_gen_res_check(struct vmw_private *dev_priv,
> +                     struct vmw_sw_context *sw_context,
> +                     enum vmw_res_type res_type,
> +                     u32 dirty,
> +                     const struct vmw_user_resource_conv *converter,
> +                     uint32_t *id_loc,
> +                     struct vmw_resource **p_res)
>  {
>         struct vmw_res_cache_entry *rcache =3D &sw_context->res_cache[res=
_type];
>         struct vmw_resource *res;
> @@ -698,6 +748,40 @@ vmw_cmd_res_check(struct vmw_private *dev_priv,
>         return ret;
>  }
>
> +/**
> + * vmw_cmd_res_check - Check that a resource is present and if so, put i=
t on the
> + * resource validate list unless it's already there.
> + *
> + * @dev_priv: Pointer to a device private structure.
> + * @sw_context: Pointer to the software context.
> + * @res_type: Resource type.
> + * @dirty: Whether to change dirty status.
> + * @converter: User-space visible type specific information. This is opt=
ional,
> + * it is not used for userspace managed surfaces.
> + * @id_loc: Pointer to the location in the command buffer currently bein=
g parsed
> + * from where the user-space resource id handle is located.
> + * @p_res: Pointer to pointer to resource validation node. Populated on
> + * exit.
> + */
> +static int
> +vmw_cmd_res_check(struct vmw_private *dev_priv,
> +                 struct vmw_sw_context *sw_context,
> +                 enum vmw_res_type res_type,
> +                 u32 dirty,
> +                 const struct vmw_user_resource_conv *converter,
> +                 uint32_t *id_loc,
> +                 struct vmw_resource **p_res)
> +{
> +       if (res_type =3D=3D vmw_res_surface &&
> +               (*id_loc < VMWGFX_NUM_GB_SURFACE + 1)) {
> +               return vmw_cmd_cmdbuf_surface_check(dev_priv, sw_context,=
 dirty,
> +                                                   id_loc, p_res);
> +       } else {
> +               return vmw_cmd_gen_res_check(dev_priv, sw_context, res_ty=
pe,
> +                                            dirty, converter, id_loc, p_=
res);
> +       }
> +}
> +
>  /**
>   * vmw_rebind_all_dx_query - Rebind DX query associated with the context
>   *
> @@ -1759,6 +1843,15 @@ static int vmw_cmd_switch_backup(struct vmw_privat=
e *dev_priv,
>         if (ret)
>                 return ret;
>
> +       /**
> +        * Userspace managed surface can be unbound by putting SVGA_ID_IN=
VALID
> +        * as mob id, so this particular case is valid.
> +        */
> +       if ((res_type =3D=3D vmw_res_surface) &&
> +           (*res_id < VMWGFX_NUM_GB_SURFACE + 1) &&
> +           (*buf_id =3D=3D SVGA_ID_INVALID))
> +               return 0;
> +
>         return vmw_cmd_res_switch_backup(dev_priv, sw_context, res, buf_i=
d,
>                                          backup_offset);
>  }
> @@ -3212,6 +3305,95 @@ static int vmw_cmd_dispatch_indirect(struct vmw_pr=
ivate *dev_priv,
>                                  &cmd->body.argsBufferSid, NULL);
>  }
>
> +static inline int
> +vmw_cmd_get_expected_surface_version(struct vmw_private *dev_priv,
> +                                    uint32 array_size,
> +                                    uint32 *cmd_id)
> +{
> +       if (array_size > 0) {
> +               if (has_sm5_context(dev_priv))
> +                       *cmd_id =3D SVGA_3D_CMD_DEFINE_GB_SURFACE_V4;
> +               else if (has_sm4_1_context(dev_priv))
> +                       *cmd_id =3D SVGA_3D_CMD_DEFINE_GB_SURFACE_V3;
> +               else if (has_sm4_context(dev_priv))
> +                       *cmd_id =3D SVGA_3D_CMD_DEFINE_GB_SURFACE_V2;
> +       } else if (array_size =3D=3D 0)
> +               *cmd_id =3D SVGA_3D_CMD_DEFINE_GB_SURFACE;
> +       else
> +               return -EINVAL;
> +       return 0;
> +}
> +
> +static int vmw_cmd_define_gb_surface_v4(struct vmw_private *dev_priv,
> +                                       struct vmw_sw_context *sw_context=
,
> +                                       SVGA3dCmdHeader *header)
> +{
> +       VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDefineGBSurface_v4);
> +       uint32 expected_cmd_id;
> +       struct vmw_surface_metadata metadata =3D {0};
> +       int ret;
> +
> +       cmd =3D container_of(header, typeof(*cmd), header);
> +
> +       ret =3D vmw_cmd_get_expected_surface_version(dev_priv,
> +                                                  cmd->body.arraySize,
> +                                                  &expected_cmd_id);
> +       if (ret || (expected_cmd_id !=3D header->id))
> +               return -EINVAL;
> +
> +       if (cmd->body.sid >=3D VMWGFX_NUM_GB_SURFACE)
> +               return -EINVAL;
> +
> +       metadata.flags =3D cmd->body.surfaceFlags;
> +       metadata.format =3D cmd->body.format;
> +       metadata.mip_levels[0] =3D cmd->body.numMipLevels;
> +       metadata.multisample_count =3D cmd->body.multisampleCount;
> +       metadata.multisample_pattern =3D cmd->body.multisamplePattern;
> +       metadata.quality_level =3D cmd->body.qualityLevel;
> +       metadata.autogen_filter =3D cmd->body.autogenFilter;
> +       metadata.array_size =3D cmd->body.arraySize;
> +       metadata.buffer_byte_stride =3D cmd->body.bufferByteStride;
> +       metadata.num_sizes =3D 1;
> +       metadata.base_size.width =3D cmd->body.size.width;
> +       metadata.base_size.height =3D cmd->body.size.height;
> +       metadata.base_size.depth =3D cmd->body.size.depth;
> +
> +       ret =3D vmw_cmdbuf_surface_define(dev_priv, sw_context, &metadata=
,
> +                                       cmd->body.sid);
> +       if (unlikely(ret))
> +               return ret;
> +
> +       ret =3D vmw_cmd_res_check(dev_priv, sw_context, vmw_res_surface,
> +                               VMW_RES_DIRTY_NONE, NULL, &cmd->body.sid,=
 NULL);
> +
> +       return ret;
> +}
> +
> +static int vmw_cmd_destroy_gb_surface(struct vmw_private *dev_priv,
> +                                     struct vmw_sw_context *sw_context,
> +                                     SVGA3dCmdHeader *header)
> +{
> +       VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDestroyGBSurface);
> +       int ret;
> +
> +       cmd =3D container_of(header, typeof(*cmd), header);
> +
> +       if (cmd->body.sid >=3D VMWGFX_NUM_GB_SURFACE)
> +               return -EINVAL;
> +
> +       ret =3D vmw_cmd_res_check(dev_priv, sw_context, vmw_res_surface,
> +                               VMW_RES_DIRTY_NONE, NULL, &cmd->body.sid,=
 NULL);
> +       if (unlikely(ret))
> +               return ret;
> +
> +       ret =3D vmw_cmdbuf_surface_destroy(dev_priv, sw_context, cmd->bod=
y.sid);
> +       if (unlikely(ret))
> +               return ret;
> +
> +       return 0;
> +}
> +
> +
>  static int vmw_cmd_check_not_3d(struct vmw_private *dev_priv,
>                                 struct vmw_sw_context *sw_context,
>                                 void *buf, uint32_t *size)
> @@ -3350,8 +3532,8 @@ static const struct vmw_cmd_entry vmw_cmd_entries[S=
VGA_3D_CMD_MAX] =3D {
>                     false, false, true),
>         VMW_CMD_DEF(SVGA_3D_CMD_DEFINE_GB_SURFACE, &vmw_cmd_invalid,
>                     false, false, true),
> -       VMW_CMD_DEF(SVGA_3D_CMD_DESTROY_GB_SURFACE, &vmw_cmd_invalid,
> -                   false, false, true),
> +       VMW_CMD_DEF(SVGA_3D_CMD_DESTROY_GB_SURFACE, &vmw_cmd_destroy_gb_s=
urface,
> +                   true, false, true),
>         VMW_CMD_DEF(SVGA_3D_CMD_BIND_GB_SURFACE, &vmw_cmd_bind_gb_surface=
,
>                     true, false, true),
>         VMW_CMD_DEF(SVGA_3D_CMD_COND_BIND_GB_SURFACE, &vmw_cmd_invalid,
> @@ -3602,6 +3784,8 @@ static const struct vmw_cmd_entry vmw_cmd_entries[S=
VGA_3D_CMD_MAX] =3D {
>         VMW_CMD_DEF(SVGA_3D_CMD_DX_DISPATCH, &vmw_cmd_sm5, true, false, t=
rue),
>         VMW_CMD_DEF(SVGA_3D_CMD_DX_DISPATCH_INDIRECT,
>                     &vmw_cmd_dispatch_indirect, true, false, true),
> +       VMW_CMD_DEF(SVGA_3D_CMD_DEFINE_GB_SURFACE_V4,
> +                   &vmw_cmd_define_gb_surface_v4, true, false, true),
>         VMW_CMD_DEF(SVGA_3D_CMD_DX_SET_CS_UA_VIEWS, &vmw_cmd_set_cs_uav, =
true,
>                     false, true),
>         VMW_CMD_DEF(SVGA_3D_CMD_DX_DEFINE_DEPTHSTENCIL_VIEW_V2,
> @@ -3612,8 +3796,6 @@ static const struct vmw_cmd_entry vmw_cmd_entries[S=
VGA_3D_CMD_MAX] =3D {
>                     &vmw_cmd_dx_bind_streamoutput, true, false, true),
>         VMW_CMD_DEF(SVGA_3D_CMD_DX_DEFINE_RASTERIZER_STATE_V2,
>                     &vmw_cmd_dx_so_define, true, false, true),
> -       VMW_CMD_DEF(SVGA_3D_CMD_DEFINE_GB_SURFACE_V4,
> -                   &vmw_cmd_invalid, false, false, true),
>  };
>
>  bool vmw_cmd_describe(const void *buf, u32 *size, char const **cmd)
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_ioctl.c
> index 835d1eed8dd9..cfa14a34a679 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
> @@ -112,6 +112,9 @@ int vmw_getparam_ioctl(struct drm_device *dev, void *=
data,
>         case DRM_VMW_PARAM_DEVICE_ID:
>                 param->value =3D to_pci_dev(dev_priv->drm.dev)->device;
>                 break;
> +       case DRM_VMW_PARAM_USER_SRF:
> +               param->value =3D 1;
> +               break;

We probably should shield this with has_sm5_context and
SVGA_CAP_GBOBJECTS, right? Otherwise the commands will start failing.

z
