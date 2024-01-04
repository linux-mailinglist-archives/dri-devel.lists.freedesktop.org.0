Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17676823B1C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 04:28:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A0310E2EE;
	Thu,  4 Jan 2024 03:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D318810E2EE
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 03:28:34 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-dbd739853easo99063276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jan 2024 19:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1704338914; x=1704943714;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RjJhlRJd8IebV/Ux2jUleGgIAnCSP1JZTISPsPLyWy4=;
 b=UasRrl59EsObSVUSnlA0ONcFAM3eYCDzWjqoRlydz2WVB/5mg9CzwWDthBzFNnguZS
 NzhAUct50fXwJKPgbZja4O8zI2DRTzoP9x9WykpEGHWhRHfM7XrIXB1cm130SvyO0SlG
 4bohBK7f8PKo+Bu3HYX/VdpmhoNA/ssfhNMnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704338914; x=1704943714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RjJhlRJd8IebV/Ux2jUleGgIAnCSP1JZTISPsPLyWy4=;
 b=MPJtfb8xG3yIQsCE5DVOWtfkHGGPXjOQD6JmMkdEuJcPW//SKQMkDQz4P+yHNm1HfY
 RjSo/giF3o91vEuEQWx9vG6f8VIWec38IGFaWGI2sNQwOuZfs8TYsXZbI1C43NqDZ3RN
 NtDUtwQmrXt7iuaeq+H1sxI2Y3sryDmDCHbNLP1x1FRxuoe+vbKXzJePURoz+/CbtC9J
 7IPMM/Mgof1bIFcI/N3WHu0r67C8P336jOfRzdVcFvaNp0hXvx4OejVcMnU7KNc9pc+j
 f5A5ipEYSb0/czoIl8z+qz70TPJSuuRRFGnuxSsyEQcWQ3yKVEU9iV5SpPhpooMwl11x
 K1gQ==
X-Gm-Message-State: AOJu0YyVzNaZlYsNIA83mRCgpRl60V3Y6oZjpDzAhNQvXaN4OaNp1zLJ
 mDAtIWaNasIwoHUoT24/2S3AErhm4tvxywxIxGNj3WZqRi9o
X-Google-Smtp-Source: AGHT+IGnQXJMoLmKebZcu3AExL4W/s42otH47BEQZuiUGpqOkvDW2BL4WUVNvVPN2lb6FY6rYH+lVxDIdaUnEwqPq9M=
X-Received: by 2002:a5b:8cc:0:b0:db7:dacf:3fc6 with SMTP id
 w12-20020a5b08cc000000b00db7dacf3fc6mr15131ybq.115.1704338913905; Wed, 03 Jan
 2024 19:28:33 -0800 (PST)
MIME-Version: 1.0
References: <20231204091416.3308430-1-alexious@zju.edu.cn>
In-Reply-To: <20231204091416.3308430-1-alexious@zju.edu.cn>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 3 Jan 2024 22:28:23 -0500
Message-ID: <CABQX2QNtfJzT_iq0bdsYkz8eUG=r8c8jXyvJ=sp9ipwqfKSErw@mail.gmail.com>
Subject: Re: [PATCH] [v2] drm/vmwgfx: fix a memleak in vmw_gmrid_man_get_node
To: Zhipeng Lu <alexious@zju.edu.cn>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Matthew Auld <matthew.auld@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 4, 2023 at 4:15=E2=80=AFAM Zhipeng Lu <alexious@zju.edu.cn> wro=
te:
>
> When ida_alloc_max fails, resources allocated before should be freed,
> including *res allocated by kmalloc and ttm_resource_init.
>
> Fixes: d3bcb4b02fe9 ("drm/vmwgfx: switch the TTM backends to self alloc")
> Signed-off-by: Zhipeng Lu <alexious@zju.edu.cn>
> ---
>
> Changelog:
>
> v2: Adding {} to correct the if statement
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/=
drm/vmwgfx/vmwgfx_gmrid_manager.c
> index ceb4d3d3b965..a0b47c9b33f5 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> @@ -64,8 +64,11 @@ static int vmw_gmrid_man_get_node(struct ttm_resource_=
manager *man,
>         ttm_resource_init(bo, place, *res);
>
>         id =3D ida_alloc_max(&gman->gmr_ida, gman->max_gmr_ids - 1, GFP_K=
ERNEL);
> -       if (id < 0)
> +       if (id < 0) {
> +               ttm_resource_fini(man, *res);
> +               kfree(*res);
>                 return id;
> +       }
>
>         spin_lock(&gman->lock);

Thanks, I pushed it to drm-misc-next.

z
