Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4196682A93B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A3A10E18A;
	Thu, 11 Jan 2024 08:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6CF10E18A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 08:41:48 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-36086444066so16737055ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 00:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1704962507; x=1705567307;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=550c1yrOQXN+Snhrh37Aq0GIF7q37Rcv4r6FEQ4eDRQ=;
 b=UaShzq/YSFZTUHAq0th8UmM5FH6SOElGs14EB1GQlr8ypb9vNq1IcrHOrdLgpCeoNY
 fveZ1GyGlE+saL36uOEBFiySytlDQWJ/9nazfORgn/i8f3zI7k4MYuduBcrCR7W2cATU
 Z0skXuP434QApW6kFPo7dQx/qi5c3qyGhA03I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704962507; x=1705567307;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=550c1yrOQXN+Snhrh37Aq0GIF7q37Rcv4r6FEQ4eDRQ=;
 b=Hl1vPsoRNTom5v+aC0ljzsqU2MynMRuubvvPbBtM8stB13yRFXfniL3NR6uU9uW0Wn
 r6azWhu6bRGHZ5RUc3KXdD0z0DT+qMuvIMu1Z5z5rKvwtcIGz1+utKgVSc+DpvzWeYNj
 hA8Oxt16KQkSxMofOaKLa0/cK6UoLWe/afq6bqhfH+9dNp+qJt5FiRGmj9ob5vDVQ5fS
 j15Gr2+0STZfv6enb0cVdkEtp/MMNgJwIFnUw4bB1h08IuHpJLLm8TmzkDOKq/8bIYjX
 Dw2/z3VfOVYp9w0miScG24qLgalqDE3tsvRHoeSa3PCFnC6vP94/ornyWnmZQtcIHoh/
 xROw==
X-Gm-Message-State: AOJu0YyEM9d1bflUrgKYjgDzgQvg9eIkUOQ+Hl4lBcph3eiTkwUXf5Y0
 kMRv/g38elkPXj1kxfRmIctqEB+TATmu3lfSnSYmRhGSBCw4
X-Google-Smtp-Source: AGHT+IGoQDk4Xq5HD8MNABwxXliiZ1oGRGwXzZh+kmQ1BlUspFy1LeHGjfH3tAoFUsSps6DNVMKizyc70ZZ28P9N6E8=
X-Received: by 2002:a05:6e02:1bce:b0:360:6262:e31c with SMTP id
 x14-20020a056e021bce00b003606262e31cmr1174882ilv.14.1704962507445; Thu, 11
 Jan 2024 00:41:47 -0800 (PST)
MIME-Version: 1.0
References: <20240110200305.94086-1-zack.rusin@broadcom.com>
In-Reply-To: <20240110200305.94086-1-zack.rusin@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Thu, 11 Jan 2024 10:41:36 +0200
Message-ID: <CAKLwHdXBdeftC4CxGdOqZ8yE=s5yUPemX8i0my-hjfqbNvkn=A@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix possible null pointer derefence with
 invalid contexts
To: Zack Rusin <zack.rusin@broadcom.com>
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
Cc: Niels De Graef <ndegraef@redhat.com>, stable@vger.kernel.org,
 Ian Forbes <ian.forbes@broadcom.com>,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 10:03=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> vmw_context_cotable can return either an error or a null pointer and its
> usage sometimes went unchecked. Subsequent code would then try to access
> either a null pointer or an error value.
>
> The invalid dereferences were only possible with malformed userspace
> apps which never properly initialized the rendering contexts.
>
> Check the results of vmw_context_cotable to fix the invalid derefs.
>
> Thanks:
> ziming zhang(@ezrak1e) from Ant Group Light-Year Security Lab
> who was the first person to discover it.
> Niels De Graef who reported it and helped to track down the poc.
>
> Fixes: 9c079b8ce8bf ("drm/vmwgfx: Adapt execbuf to the new validation api=
")
> Cc: <stable@vger.kernel.org> # v4.20+
> Reported-by: Niels De Graef  <ndegraef@redhat.com>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Martin Krastev <martin.krastev@broadcom.com>
> Cc: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
> Cc: Ian Forbes <ian.forbes@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_execbuf.c
> index 272141b6164c..4f09959d27ba 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -447,7 +447,7 @@ static int vmw_resource_context_res_add(struct vmw_pr=
ivate *dev_priv,
>             vmw_res_type(ctx) =3D=3D vmw_res_dx_context) {
>                 for (i =3D 0; i < cotable_max; ++i) {
>                         res =3D vmw_context_cotable(ctx, i);
> -                       if (IS_ERR(res))
> +                       if (IS_ERR_OR_NULL(res))
>                                 continue;
>
>                         ret =3D vmw_execbuf_res_val_add(sw_context, res,
> @@ -1266,6 +1266,8 @@ static int vmw_cmd_dx_define_query(struct vmw_priva=
te *dev_priv,
>                 return -EINVAL;
>
>         cotable_res =3D vmw_context_cotable(ctx_node->ctx, SVGA_COTABLE_D=
XQUERY);
> +       if (IS_ERR_OR_NULL(cotable_res))
> +               return cotable_res ? PTR_ERR(cotable_res) : -EINVAL;
>         ret =3D vmw_cotable_notify(cotable_res, cmd->body.queryId);
>
>         return ret;
> @@ -2484,6 +2486,8 @@ static int vmw_cmd_dx_view_define(struct vmw_privat=
e *dev_priv,
>                 return ret;
>
>         res =3D vmw_context_cotable(ctx_node->ctx, vmw_view_cotables[view=
_type]);
> +       if (IS_ERR_OR_NULL(res))
> +               return res ? PTR_ERR(res) : -EINVAL;
>         ret =3D vmw_cotable_notify(res, cmd->defined_id);
>         if (unlikely(ret !=3D 0))
>                 return ret;
> @@ -2569,8 +2573,8 @@ static int vmw_cmd_dx_so_define(struct vmw_private =
*dev_priv,
>
>         so_type =3D vmw_so_cmd_to_type(header->id);
>         res =3D vmw_context_cotable(ctx_node->ctx, vmw_so_cotables[so_typ=
e]);
> -       if (IS_ERR(res))
> -               return PTR_ERR(res);
> +       if (IS_ERR_OR_NULL(res))
> +               return res ? PTR_ERR(res) : -EINVAL;
>         cmd =3D container_of(header, typeof(*cmd), header);
>         ret =3D vmw_cotable_notify(res, cmd->defined_id);
>
> @@ -2689,6 +2693,8 @@ static int vmw_cmd_dx_define_shader(struct vmw_priv=
ate *dev_priv,
>                 return -EINVAL;
>
>         res =3D vmw_context_cotable(ctx_node->ctx, SVGA_COTABLE_DXSHADER)=
;
> +       if (IS_ERR_OR_NULL(res))
> +               return res ? PTR_ERR(res) : -EINVAL;
>         ret =3D vmw_cotable_notify(res, cmd->body.shaderId);
>         if (ret)
>                 return ret;
> @@ -3010,6 +3016,8 @@ static int vmw_cmd_dx_define_streamoutput(struct vm=
w_private *dev_priv,
>         }
>
>         res =3D vmw_context_cotable(ctx_node->ctx, SVGA_COTABLE_STREAMOUT=
PUT);
> +       if (IS_ERR_OR_NULL(res))
> +               return res ? PTR_ERR(res) : -EINVAL;
>         ret =3D vmw_cotable_notify(res, cmd->body.soid);
>         if (ret)
>                 return ret;
> --
> 2.40.1
>

LGTM

Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin
