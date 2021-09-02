Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 222EB3FE91B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 08:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED806E441;
	Thu,  2 Sep 2021 06:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C576E440
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 06:06:20 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id bt14so1691058ejb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 23:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=whTkJ6zC7O+D+IeTOzd/hrZqqXkNOkHj9zN0Rud1rlU=;
 b=QByrQJYeYenX851WILof2vh1HOu3BNn5jOF+A5FaXZn2QGhg1jbvFqDtWm5q9AsFak
 NuQbh/nlGXh+Kn7gg7ZGGfLr32tXSyQQXxvRItHQ/FTWSBRhJZNJJv2oW4/I8xvQ14up
 1nmzO8yayF9rNNCSa3MvNqnIUuSjIDiOXvvy9MyNEAN6sg2RW8e3w8pwmdL7Q38QjByg
 2xa5wQ/wYwkADgZZ242Xx6ZlqfIwhpTpTkr/gwihWaHkV6NaHomH6zJNVHccy3FWxzcb
 w+SytK3PE5kK+3dba9ILNoEVaIUS/pZDQUWh+fsXrMC9fnjpEZUTx0lxUJGyK0s/yPC+
 GyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=whTkJ6zC7O+D+IeTOzd/hrZqqXkNOkHj9zN0Rud1rlU=;
 b=LWEsF7zCcTtZkzmqTxMSVS7k5WgcwBRjiWuctsHmxdN2qFo3DqAfULAWZKuDEoUAu7
 HwbCrZRCZMwspENzMAMsYoGLc2TiqpTxF8QXj9USQRskmqgPHsj96u+dEwTbWWHUe1KS
 bgQJv5xmkFzCzU/CHfx0B+/vvuM4B+Xuozwl1ceDfh6ZbfyaCwwqtVz5GKXvNYRd7l59
 GwQaz0fd3FhrC9Bo7VKdbniOd/ZwUqDcD/hJcRkhEG/MHGqHgeWk731iiPUEnW+2Vp0w
 3y+rvgKwiGgIzaEInyzjzqRQqj2g30fwn7ReYgAYFwVghWnnlAwVZvBI/FM75H3BkSt1
 x9jA==
X-Gm-Message-State: AOAM533r9nA6CfmqJvcUkVL1yC0btoe3H50YYqYaG4GQVKa6YeWm7tZw
 wyfebN7UfN4UanhgFiwUPn/MPm/TeTWGlgCn+bI=
X-Google-Smtp-Source: ABdhPJwEHZRxfRsnNHsnFH8N+CevlheXR4BPBxMjgPoc8wp1dSZlIGfBjTim029/qcTHMYtX+/UNLC6istu70rdugns=
X-Received: by 2002:a17:906:31ca:: with SMTP id
 f10mr2027189ejf.73.1630562779255; 
 Wed, 01 Sep 2021 23:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210902060213.1702544-1-mudongliangabcd@gmail.com>
In-Reply-To: <20210902060213.1702544-1-mudongliangabcd@gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Thu, 2 Sep 2021 14:05:52 +0800
Message-ID: <CAD-N9QVXXNg9zSy7Q_8hLMv8nUX57UwkqJXqAdpc_QM4E2ikUw@mail.gmail.com>
Subject: Re: [PATCH 4.19] fbmem: add margin check to fb_check_caps()
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: George Kennedy <george.kennedy@oracle.com>, 
 syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com, 
 Dan Carpenter <dan.carpenter@oracle.com>,
 Dhaval Giani <dhaval.giani@oracle.com>, 
 Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 02 Sep 2021 06:08:04 +0000
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

On Thu, Sep 2, 2021 at 2:02 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>
> [ Upstream commit a49145acfb975d921464b84fe00279f99827d816 ]
>
> A fb_ioctl() FBIOPUT_VSCREENINFO call with invalid xres setting
> or yres setting in struct fb_var_screeninfo will result in a
> KASAN: vmalloc-out-of-bounds failure in bitfill_aligned() as
> the margins are being cleared. The margins are cleared in
> chunks and if the xres setting or yres setting is a value of
> zero upto the chunk size, the failure will occur.
>
> Add a margin check to validate xres and yres settings.
>
> Note that, this patch needs special handling to backport it to linux
> kernel 4.19, 4.14, 4.9, 4.4.

I have tested that, this patch can be applied to the branches:
linux-4.19.y/linux-4.14.y/linux-4.9.y/linux-4.4.y.

>
> Signed-off-by: George Kennedy <george.kennedy@oracle.com>
> Reported-by: syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Dhaval Giani <dhaval.giani@oracle.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/1594149963-13801-1-git-send-email-george.kennedy@oracle.com
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/video/fbdev/core/fbmem.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 84845275dbef..de04c097d67c 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -991,6 +991,10 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
>                         goto done;
>                 }
>
> +               /* bitfill_aligned() assumes that it's at least 8x8 */
> +               if (var->xres < 8 || var->yres < 8)
> +                       return -EINVAL;
> +
>                 ret = info->fbops->fb_check_var(var, info);
>
>                 if (ret)
> --
> 2.25.1
>
