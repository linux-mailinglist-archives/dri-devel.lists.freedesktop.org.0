Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA291DBCAE
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 20:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC676E884;
	Wed, 20 May 2020 18:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1B589D2F;
 Wed, 20 May 2020 18:21:21 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id u188so3917210wmu.1;
 Wed, 20 May 2020 11:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RW8P2ENxQMCRzJDvhD6yay/4wTNgEveKbVybNJiHgVo=;
 b=IJeSS+krA8BtcjjkI47iWUeYnFuBSbFDXEP2RNUnOMWW5cZeNSgk+DVsm4/yZxPNAz
 4ezHVkCWd2qDdZ8SjSzgAAt0DjfVbkWimRZVm+WR9wT0/SKcLMYkWBvnUZ7pj9sAWUsL
 ZgmPy2iZ28uJqlh+QSHst7qpORZOUvAzMfF1b52kEFMzglrR+Fh8cVq2LKtQ3qvCG5gV
 IWdqLYAOdCwkkYSx5UZFd9b5vYHO8lsF+rCypmOHyJDAuAhuz9QemgjE44UNIRa2iZQ3
 44WhDBjFLLW/HYFqWjH6BkzwJNaN3y/oZMO9bVJjv37evfX8IEKmg7CSxANYY+MQCBe8
 LIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RW8P2ENxQMCRzJDvhD6yay/4wTNgEveKbVybNJiHgVo=;
 b=IZTxTwpi0y2F6TF21jafPHXxL0ZozuYy7SXOqONJt+lOVghcwezr7+wipZTjb2EnJR
 lZk/jO3VpEfX2sMc8DXsFK+5NP3L09ol1GvAZrT0GJREPNtV3aPCA5VNw/sf+4c6YnET
 kCuYPFTP/J2dRzM0W9ebehQpjZ7sXce9OSn6YcuxrACF4FJ7eJs+sQB9pf+9VndjUYAF
 mdkCF8AGcS2oPYjO7jwZRX4nd1iJ/aSkocM2oA17yHk8r60Rt8PeKU7CmN9uGFGk3Cfc
 l+0yPdz9wDd1VSxnV4FithZnLjTR54QbgaZMl2DI6/ijTPhor5O7bkd1yGsWtoTKZGb5
 pwwg==
X-Gm-Message-State: AOAM530hZog02qXzyyhS2zLf+RzFYUdiypOthCT+3AZq+13ij4lG28qm
 e53FqKLQ3vLOiie9riuIuetEMVpLIktG0mQxrewJew==
X-Google-Smtp-Source: ABdhPJxCW5X0NOlDHehi0pwlVrhAXnzeTfYJOtmzMEsCtQvgrfQ3aAfUCod8O8QieU4Qp1Bg6CBcbd7ODrrsnDAhjMA=
X-Received: by 2002:a7b:cc0e:: with SMTP id f14mr5643658wmh.39.1589998880315; 
 Wed, 20 May 2020 11:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200520135306.11221-1-aurabindo.pillai@amd.com>
In-Reply-To: <20200520135306.11221-1-aurabindo.pillai@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 20 May 2020 14:21:08 -0400
Message-ID: <CADnq5_MBME9=yu=fdK-NWgEEZYUwBH-c7Ra7Mg-NrSru9zBS9g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdkfd: Fix large framesize for kfd_smi_ev_read()
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
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
Cc: Dave Airlie <airlied@linux.ie>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Amber Lin <Amber.Lin@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 20, 2020 at 9:53 AM Aurabindo Pillai
<aurabindo.pillai@amd.com> wrote:
>
> The buffer allocated is of 1024 bytes. Allocate this from
> heap instead of stack.
>
> Also remove check for stack size since we're allocating from heap
>
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Tested-by: Amber Lin <Amber.Lin@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 26 +++++++++++++++------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> index f5fd18eacf0d..5aebe169f8c6 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> @@ -77,9 +77,11 @@ static ssize_t kfd_smi_ev_read(struct file *filep, char __user *user,
>         int ret;
>         size_t to_copy;
>         struct kfd_smi_client *client = filep->private_data;
> -       unsigned char buf[MAX_KFIFO_SIZE];
> +       unsigned char *buf;
>
> -       BUILD_BUG_ON(MAX_KFIFO_SIZE > 1024);
> +       buf = kzalloc(MAX_KFIFO_SIZE * sizeof(*buf), GFP_KERNEL);
> +       if (!buf)
> +               return -ENOMEM;
>
>         /* kfifo_to_user can sleep so we can't use spinlock protection around
>          * it. Instead, we kfifo out as spinlocked then copy them to the user.
> @@ -88,19 +90,29 @@ static ssize_t kfd_smi_ev_read(struct file *filep, char __user *user,
>         to_copy = kfifo_len(&client->fifo);
>         if (!to_copy) {
>                 spin_unlock(&client->lock);
> -               return -EAGAIN;
> +               ret = -EAGAIN;
> +               goto ret_err;
>         }
>         to_copy = min3(size, sizeof(buf), to_copy);
>         ret = kfifo_out(&client->fifo, buf, to_copy);
>         spin_unlock(&client->lock);
> -       if (ret <= 0)
> -               return -EAGAIN;
> +       if (ret <= 0) {
> +               ret = -EAGAIN;
> +               goto ret_err;
> +       }
>
>         ret = copy_to_user(user, buf, to_copy);
> -       if (ret)
> -               return -EFAULT;
> +       if (ret) {
> +               ret = -EFAULT;
> +               goto ret_err;
> +       }
>
> +       kfree(buf);
>         return to_copy;
> +
> +ret_err:
> +       kfree(buf);
> +       return ret;
>  }
>
>  static ssize_t kfd_smi_ev_write(struct file *filep, const char __user *user,
> --
> 2.25.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
