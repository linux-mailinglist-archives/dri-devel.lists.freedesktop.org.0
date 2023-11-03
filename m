Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EB27DFE64
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 04:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C884A10E37C;
	Fri,  3 Nov 2023 03:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF47D10E37C;
 Fri,  3 Nov 2023 03:28:31 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5437269a661so5324839a12.0; 
 Thu, 02 Nov 2023 20:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698982110; x=1699586910; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zb/a36wLOX8RMsCCsQ/Odv/4Pe7YOEMbRJ5Kk+EkPKg=;
 b=SlcCvG2xOIglB3FFEQfpb72fVl+9wd+IL3GfGACG2hgvNgOp8zybxn/EaDtZgY3VF7
 z1nvy68G3+fb2nvp+j5rQuE8HPPAeHW6Q90iv8QYIsVTGNgI0/0kYTjNCJcSiThl0qXy
 pK2UGjbuuqifoBlLSf8/v3bRJ0oTVIhU2QQfdSWvHL2IfIkkI261ND1lqBoHCI0EYObh
 QKARrM+sCk0DFEMVwsC5w4Ax0QhbL9yrMBSu9AmHcDUYSXUJW/0X+r6j0xxAXh6XoERG
 aKlyBJcV8++qQ9baUx9UoXnfwTpfmTQWmG4zqFU6lsy3ITFZquVbb+WeegaVudiOkxS8
 AfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698982110; x=1699586910;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zb/a36wLOX8RMsCCsQ/Odv/4Pe7YOEMbRJ5Kk+EkPKg=;
 b=nsqQwAJ6hKjetPCJmHeEE45c8cq5IXuzRpeNq0AVKTK5/a3ulI2P3H7/JhTn63t7ZV
 GXA57s0RexaGFIrmn3BG4m1pxLA5yGIXU8g/q7TXvjwiNcynCR0s2I70F65+ock2Ds2T
 Kqqy9iXll/PjADlLtxzfbuZn2mS4XBA2fzCELawafGJBeMNLjSmRtZ/qFx4HaT8BNnC7
 KXN5t5x1BMbKp8aiNlcPGGFCzm9V6MtY67saBvgX225aIDv/uTf5hM9vl0hUk17e3iwK
 Uv8MEM5d1eqFa4G807xez9iilR9v/FJuY2hpQex4FZaTlH6CMHC3MK2aAuib8ZfV1MVo
 BBEA==
X-Gm-Message-State: AOJu0Yw4210FUYUGd2cOrjoRKhBb1hHYVAh+uKy6FKu8b7B8ffT5Wu4z
 FG1eCGyScCE23PvLRXRyaQSMVm6QPhkMyJsl+Fs=
X-Google-Smtp-Source: AGHT+IHLoKNmS9eyyf4W6p2GhUKWMvawf2nQfjJZXE6Hghrwd8VFwEN8fXmOqR7kdMieSsVR+kgjZ++bD2Ima2x2qt0=
X-Received: by 2002:a17:907:968d:b0:9b2:b808:6a1c with SMTP id
 hd13-20020a170907968d00b009b2b8086a1cmr1385757ejc.35.1698982109881; Thu, 02
 Nov 2023 20:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20231103024119.15031-1-dakr@redhat.com>
In-Reply-To: <20231103024119.15031-1-dakr@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 3 Nov 2023 13:28:18 +1000
Message-ID: <CAPM=9tx7n+v-c-Qjd7O9GFOgyX4EbFZ=Jk_VOM9i0z6BmocJZw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/gr/gf100-: unlock mutex failing to create
 golden context
To: Danilo Krummrich <dakr@redhat.com>
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 faith@gfxstrand.net, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 3 Nov 2023 at 12:41, Danilo Krummrich <dakr@redhat.com> wrote:
>
> Do not return from gf100_gr_chan_new() with fecs mutex held when failing
> to create the golden context image.

Reviewed-by: Dave Airlie <airlied@redhat.com>
>
> Cc: <stable@vger.kernel.org> # v6.2+
> Fixes: ca081fff6ecc ("drm/nouveau/gr/gf100-: generate golden context during first object alloc")
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> index c494a1ff2d57..f72d3aa33442 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> @@ -442,6 +442,7 @@ gf100_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
>         if (gr->data == NULL) {
>                 ret = gf100_grctx_generate(gr, chan, fifoch->inst);
>                 if (ret) {
> +                       mutex_unlock(&gr->fecs.mutex);
>                         nvkm_error(&base->engine.subdev, "failed to construct context\n");
>                         return ret;
>                 }
> --
> 2.41.0
>
