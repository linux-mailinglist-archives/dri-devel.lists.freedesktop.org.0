Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87F4309273
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 07:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA196EC88;
	Sat, 30 Jan 2021 06:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419066EC87;
 Sat, 30 Jan 2021 06:32:03 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id p15so10928421wrq.8;
 Fri, 29 Jan 2021 22:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Nm9IfnYPTwx6O0U9BdKLhxgG7rzF4f0DS/IBep8xNQ=;
 b=dAtNPsQdYjophNuTU8NT6epZcaDeSrQs/c8eei4DT1CWQBEjlxVGw5Goax1seBiwBQ
 jEnwGrlEFssBsfg7D4luNcaUa5QRab0GFZJrpVVACtHEneFndwwVlPeXQA0rEsIIGZfW
 Dz069gikwHnLrdL4SMMRsvl8air957bwcy5YWCPNcX9KC+PlI728BtkiW2Cz+8Zp7yDQ
 qLfwrjQDcZK9aD8sh6ZnTLa6NMb+6KW3I7eAmMz9X5NcdzPh74wtay+WBTZQBfd3eDmY
 qpsHgLNYAbq3Sx3lDXQWCVA5JYDNmVrB9SBbbOcVmzKl4LxbIDepT2dnMAlaMbZF/QgO
 YmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Nm9IfnYPTwx6O0U9BdKLhxgG7rzF4f0DS/IBep8xNQ=;
 b=JFnfwLH4Paqbyg64rqdgBLRUuOZ1PcA0fE+PtcRvo5eL2Yc7iq93B1WQKHZ4Q6fRQj
 sjGZ2GXVe1FWm2yGC0/4Creqj2qFzyozWCo9k8qMVfHZKx2hz7+2eFFqQ5pK3Co8iQMA
 gr9LQzsBhwQyyBBvagtg47P4ZFbtNrcT8oJvNLvFIanKOEYcSn1uew9IrKjraBzIEKlA
 mNfz62aK5a1hxXQonN6LqXwnjDJRYreozw90LDeQrtHGTa0meeBMXqXIJdVbXFfBJisD
 z27VleX49PEf212GigiJGfBbHuy0qN4bRjyCzbd7YhDqYdi9YcM1uAjCx5a9MWLmIWsT
 UXBg==
X-Gm-Message-State: AOAM531o8zAcSDXyDO3BQwi23pWAZijqb7MA9ow8JINUUTRzTy2mWa0E
 LTURoxTRenAaSDNzrVKuFD8EErY0AvXDFxctnSE=
X-Google-Smtp-Source: ABdhPJy5ra0GCZkItSzcz2upUZ3HQLq88/bhFgC5ykVBf87d+3YorQ3DFUHffmOzAOPNWuCENk9vsJ0QNM03cQUuawo=
X-Received: by 2002:a5d:52c5:: with SMTP id r5mr7992929wrv.208.1611988321918; 
 Fri, 29 Jan 2021 22:32:01 -0800 (PST)
MIME-Version: 1.0
References: <20201127094438.121003-1-miaoqinglang@huawei.com>
In-Reply-To: <20201127094438.121003-1-miaoqinglang@huawei.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Sat, 30 Jan 2021 14:31:50 +0800
Message-ID: <CAKGbVbs=jUMJxvTbi1Pd3-fCb7R2dsqu_eNbhkAQMm2GZDjWCA@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: fix reference leak in lima_pm_busy
To: Qinglang Miao <miaoqinglang@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, lima@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks, applied to drm-misc-next.

Regards,
Qiang

On Fri, Nov 27, 2020 at 5:42 PM Qinglang Miao <miaoqinglang@huawei.com> wrote:
>
> pm_runtime_get_sync will increment pm usage counter even it
> failed. Forgetting to putting operation will result in a
> reference leak here.
>
> A new function pm_runtime_resume_and_get is introduced in
> [0] to keep usage counter balanced. So We fix the reference
> leak by replacing it with new funtion.
>
> [0] dd8088d5a896 ("PM: runtime: Add  pm_runtime_resume_and_get to deal with usage counter")
>
> Fixes: 50de2e9ebbc0 ("drm/lima: enable runtime pm")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>  drivers/gpu/drm/lima/lima_sched.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index dc6df9e9a..f6e7a88a5 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -200,7 +200,7 @@ static int lima_pm_busy(struct lima_device *ldev)
>         int ret;
>
>         /* resume GPU if it has been suspended by runtime PM */
> -       ret = pm_runtime_get_sync(ldev->dev);
> +       ret = pm_runtime_resume_and_get(ldev->dev);
>         if (ret < 0)
>                 return ret;
>
> --
> 2.23.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
