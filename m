Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C622780133
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 00:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C946010E171;
	Thu, 17 Aug 2023 22:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7954710E171
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 22:42:53 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fe32ec7201so14515e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 15:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1692312172; x=1692916972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C6HhiNeivPc8h3XsvZEVqjvphp3hGJDlkn0WmiMEYNU=;
 b=Ti+3J+EAN7xKagWSnsqm8fc2jskGkx9CO9eA+o6+lcC2J6f9kRRiTXP1K21QqdXtEh
 jcEb+3tfY16mnVTvs9IF0w8PWYQoU3nJV8+DXIG7K8yganeCwCkY0lyKM0flfZyAKq27
 FzABVRE46ujwo6wAwnIfwJn1SiIkXRZiPizsnHlFGMrER5OZWkY1puv4Ilb30q+92uku
 jd4oPjACmDXJoXhATkj0U/JBat6+5We6/ZLwDpMq5N4kDb/kgQeV5HDAudOxNZ57rgjm
 2ZwwwcQvRziZtAbTmBrVeOPvAvC+bNz2lMGIdT4NXFd0zU+8UGIfroZnUziYCV0/ChA7
 tSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692312172; x=1692916972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C6HhiNeivPc8h3XsvZEVqjvphp3hGJDlkn0WmiMEYNU=;
 b=iT9dihUHpwh70XogJ+nFJ39S21qXGN7hXSXpcaUFXHQjAjgsMn+687Yv2U+Ru9A6CS
 1sLqma7zuwmDk9wlC9S0MW7AoU+DxNY3BddHV6qyxX4WrWMyUIzqNLoETK6DU5N8pDZc
 Mhj+TsXHNfjvaXQsZmoyoFnrqloSic80kVL0uxdWVM97lv1kGQcF+zvYPXyHlX4a60AS
 LO3e5mX1sbHKh3fyk4XqsUkXCFdCUA2ypHmfFutvfcVYi8XEv95mRj6lVxvLyetdunQs
 6GFS4QoaUH7M0ou+KRy1XoVQfAcyVhRUDiz6smFeZNqVKYWoDCIy7JUJ0bF5sIf0LK3w
 esig==
X-Gm-Message-State: AOJu0Ywemv9Y3HbauoB6ak7FBdlqMc1fxR/VyuZcxFvg7Nr0hu6y3yP3
 8nlCyOa31nYhZPveKtcTT7uei5PHHhzcknCCsLzgRDQdyBFU/fw/xQw=
X-Google-Smtp-Source: AGHT+IHz+JQ1gQjOh13G6KUZe0T5nK7totffObGsKPB9aYss5Y2PiLQ4RmPvEVQyXcIAFbbBmd1bbricH5XK4WAFu9s=
X-Received: by 2002:a05:600c:1d02:b0:3f1:9a3d:4f7f with SMTP id
 l2-20020a05600c1d0200b003f19a3d4f7fmr21596wms.1.1692312171931; Thu, 17 Aug
 2023 15:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
 <20230816082531.164695-14-sarah.walker@imgtec.com>
In-Reply-To: <20230816082531.164695-14-sarah.walker@imgtec.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 18 Aug 2023 00:42:15 +0200
Message-ID: <CAG48ez2xv2i_gObpRZ7v0O8x+dJpHT9a3gcvte7R9_S7bvUNgg@mail.gmail.com>
Subject: Re: [PATCH v5 13/17] drm/imagination: Implement context
 creation/destruction ioctls
To: Sarah Walker <sarah.walker@imgtec.com>
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
Cc: matthew.brost@intel.com, hns@goldelico.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, afd@ti.com, luben.tuikov@amd.com, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 16, 2023 at 10:25=E2=80=AFAM Sarah Walker <sarah.walker@imgtec.=
com> wrote:
>
> Implement ioctls for the creation and destruction of contexts. Contexts a=
re
> used for job submission and each is associated with a particular job type=
.
[...]
> +/**
> + * pvr_context_create() - Create a context.
> + * @pvr_file: File to attach the created context to.
> + * @args: Context creation arguments.
> + *
> + * Return:
> + *  * 0 on success, or
> + *  * A negative error code on failure.
> + */
> +int pvr_context_create(struct pvr_file *pvr_file, struct drm_pvr_ioctl_c=
reate_context_args *args)
> +{
> +       struct pvr_device *pvr_dev =3D pvr_file->pvr_dev;
> +       struct pvr_context *ctx;
> +       int ctx_size;
> +       int err;
> +
> +       /* Context creation flags are currently unused and must be zero. =
*/
> +       if (args->flags)
> +               return -EINVAL;
> +
> +       ctx_size =3D get_fw_obj_size(args->type);
> +       if (ctx_size < 0)
> +               return ctx_size;
> +
> +       ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
> +       if (!ctx)
> +               return -ENOMEM;
> +
> +       ctx->data_size =3D ctx_size;
> +       ctx->type =3D args->type;
> +       ctx->flags =3D args->flags;
> +       ctx->pvr_dev =3D pvr_dev;
> +       kref_init(&ctx->ref_count);
> +
> +       err =3D remap_priority(pvr_file, args->priority, &ctx->priority);
> +       if (err)
> +               goto err_free_ctx;
> +
> +       ctx->vm_ctx =3D pvr_vm_context_lookup(pvr_file, args->vm_context_=
handle);
> +       if (IS_ERR(ctx->vm_ctx)) {
> +               err =3D PTR_ERR(ctx->vm_ctx);
> +               goto err_free_ctx;
> +       }
> +
> +       ctx->data =3D kzalloc(ctx_size, GFP_KERNEL);
> +       if (!ctx->data) {
> +               err =3D -ENOMEM;
> +               goto err_put_vm;
> +       }
> +
> +       err =3D init_fw_objs(ctx, args, ctx->data);
> +       if (err)
> +               goto err_free_ctx_data;
> +
> +       err =3D pvr_fw_object_create(pvr_dev, ctx_size, PVR_BO_FW_FLAGS_D=
EVICE_UNCACHED,
> +                                  ctx_fw_data_init, ctx, &ctx->fw_obj);
> +       if (err)
> +               goto err_free_ctx_data;
> +
> +       err =3D xa_alloc(&pvr_dev->ctx_ids, &ctx->ctx_id, ctx, xa_limit_3=
2b, GFP_KERNEL);
> +       if (err)
> +               goto err_destroy_fw_obj;
> +
> +       err =3D xa_alloc(&pvr_file->ctx_handles, &args->handle, ctx, xa_l=
imit_32b, GFP_KERNEL);
> +       if (err)
> +               goto err_release_id;

This bailout looks a bit dodgy. We have already inserted ctx into
&pvr_dev->ctx_ids, and now we just take it out again. If someone could
concurrently call pvr_context_lookup_id() on the ID we just allocated
(I don't understand enough about what's going on here at a high level
to be able to tell if that's possible), I think they would be able to
elevate the ctx->ref_count from 1 to 2, and then on the bailout path
we'll just free the ctx without looking at the refcount.

If this can't happen, it might be a good idea to add a comment
explaining why. If it can happen, I guess one way to fix it would be
to replace this last bailout with a call to pvr_context_put()?


> +
> +       return 0;
> +
> +err_release_id:
> +       xa_erase(&pvr_dev->ctx_ids, ctx->ctx_id);
> +
> +err_destroy_fw_obj:
> +       pvr_fw_object_destroy(ctx->fw_obj);
> +
> +err_free_ctx_data:
> +       kfree(ctx->data);
> +
> +err_put_vm:
> +       pvr_vm_context_put(ctx->vm_ctx);
> +
> +err_free_ctx:
> +       kfree(ctx);
> +       return err;
> +}
