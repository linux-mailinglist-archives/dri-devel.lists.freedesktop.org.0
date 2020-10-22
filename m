Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 053DE295782
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 07:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3E46F3A4;
	Thu, 22 Oct 2020 05:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C946E34B;
 Thu, 22 Oct 2020 05:02:51 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d3so453416wma.4;
 Wed, 21 Oct 2020 22:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4wrpDjbP4w2xCq7mdzj75yVVv1DI/Z3nNPuhthG3gKU=;
 b=dZDXR6TkXw2gxAmMluY+wCv51B853jen6oLPQSb3pqaYX1NYXPCBu+tBYr79b1KxxH
 yDiwdTtKWgVb55jLnnlwao1splHVI/kvnrvnmoLPxh6MyMVdyjHeClDdM1O3KnH37/wH
 nSUJRQXbChgevvcfgH9083sSEYrHT8svseDw/KihzWi1JiopHkBZ+PLZjyiV/pxe3/HR
 mukUPHM9yVVdu35GhFjnSQ6y6qCnLmH+f/rWAJ25qOs2cHrl+0MgQk4Jc48+/iw4loGZ
 l5WrOEOtg7V5LIWx2fKr6ZOFOq/Do4n0fwB1NyNQa2pS83IHcW1v/DSJmGS/vgddw7Ci
 E/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4wrpDjbP4w2xCq7mdzj75yVVv1DI/Z3nNPuhthG3gKU=;
 b=OEh+huW32uR7dfEwTD8BvynaMTf9Px80NYuyoP/q8/RTuBfK7ELE6uDIa56qoXr25H
 cD9+CqcVzJrq24ej6SrJmMTx+59w2WeBZcld4nA+SV2zFGGLiDYwICt61liFvGQJ2LJA
 xX0MblBwhTHTYBBxn+EaBd0B6nxvRNAv9FlPakBo/JmOGEE5M/wp5jPCDYOEDQ59+fua
 rDYBMCyX13Ulot1lwGJhyPwn7YspdWUenaTLsw8y0mf2jb7UMGU+htWVRSCXy0qWsbQa
 AHyxykFjITES5P4kE7MA80/Vpqv1o38sz7JYbyS2/45T1e+4fIKJYvaxKaA94HuMRbsx
 UGAA==
X-Gm-Message-State: AOAM533mN3tdG9gjniXINgll+vljvYP/kg0FpfuF8hqfWRAX5EMEv39F
 fMzRyGOVzR50JIbg7FIu495zhy3tpWEMoWV8ozE=
X-Google-Smtp-Source: ABdhPJxMFoQB7LByS4OaQ1rQSqobrtazTFawEDpuosydZ97IIqDtpTgXrJT1bdZ4KeaMqoXWb3c/tqEul4MnOhdibCw=
X-Received: by 2002:a1c:6302:: with SMTP id x2mr207443wmb.56.1603342970516;
 Wed, 21 Oct 2020 22:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_6CDB3D2D9BB1A93DCB856F2AD38C59F93F05@qq.com>
In-Reply-To: <tencent_6CDB3D2D9BB1A93DCB856F2AD38C59F93F05@qq.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 Oct 2020 01:02:38 -0400
Message-ID: <CADnq5_PAefQhvb=Yh9=uzrhnHtV9-5Lo01ervN32cSqGGDS9_g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix a possible NULL pointer dereference
 in bios_parser_get_src_obj()
To: estherbdf <603571786@qq.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 19, 2020 at 8:38 AM estherbdf <603571786@qq.com> wrote:
>
> [Why] the func  bios_parser_get_src_obj () is similar to  bios_parser_get_dst_obj () which is fixed by the commit<a8f976473196>("drm/amd/display: Banch of smatch error and warning fixes in DC").
> the symbol 'id' is uninitialized and it is not checked before dereference it,may lead to null pointer dereference.
> [How] Initialized variable explicitly with NULL and add sanitizer.

I think the current code is safe as is.  get_src_obj_list() will
return 0 if *id_list is NULL and bios_parser_get_src_obj() checks if
number <= index.

Alex


>
> Signed-off-by: estherbdf <603571786@qq.com>
> ---
>  drivers/gpu/drm/amd/display/dc/bios/bios_parser.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
> index 008d4d1..94c6cca 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
> @@ -190,7 +190,7 @@ static enum bp_result bios_parser_get_src_obj(struct dc_bios *dcb,
>         struct graphics_object_id *src_object_id)
>  {
>         uint32_t number;
> -       uint16_t *id;
> +       uint16_t *id = NULL;
>         ATOM_OBJECT *object;
>         struct bios_parser *bp = BP_FROM_DCB(dcb);
>
> @@ -206,7 +206,7 @@ static enum bp_result bios_parser_get_src_obj(struct dc_bios *dcb,
>
>         number = get_src_obj_list(bp, object, &id);
>
> -       if (number <= index)
> +       if (number <= index || !id)
>                 return BP_RESULT_BADINPUT;
>
>         *src_object_id = object_id_from_bios_object_id(id[index]);
> --
> 1.9.1
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
