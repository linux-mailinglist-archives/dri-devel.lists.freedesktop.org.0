Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB95919675C
	for <lists+dri-devel@lfdr.de>; Sat, 28 Mar 2020 17:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE706E12A;
	Sat, 28 Mar 2020 16:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFA86E12A
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 16:31:46 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id z5so12971685oth.9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 09:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tepq1jSwDCN89tryT39lGx5t8RvfKo7KJYe9WreZN8E=;
 b=Godxthakoj8WDjgl/1xUDzE5sUEkmS4LTviBbCzV6Ma0iDh5GdRhECpcZTGY2Edk7W
 +klahkVThDTocA6UalroXBd3d/s1yNbA1MoKTHR6rFBKeI3CDoSMNENbizT8hyxv+Zk7
 JFJYO5cqHODkH5KbjguHKYz6RZCBCYW+cVUwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tepq1jSwDCN89tryT39lGx5t8RvfKo7KJYe9WreZN8E=;
 b=JEZs1FuC1xtPLhn+KDlOBkASrt2J1yN+lQGngMqpizDQv5yGRMZfCoYbNLKFuLz51w
 GIYl4zZQBIrn2u03rIyX3P4UfAoGBK5vVb7r+J6nM6vlovRjkiAWGmcE3nDndsli4qsV
 UI7m4cbFem3IIQvzTyppHx5/6ovQ/ujjqrX3cU6JVmUraot0DmHG564bKRquhdxN96NA
 BiGGeerM3kjiIM+NBNV1VioY/ybJvisqzqpIYHQADqYIcm+LmebcKJQ9SboufS+eq+fU
 iqqoBhjG36twgXetHGA7zgMMj7uV3dJLukEZ8UVAvyy9u+IrqVZ6CW6fnD/7xE06dHkM
 oNfQ==
X-Gm-Message-State: ANhLgQ0b02CueXKkFok+lrpO53PYOABZmNm/Aj4SOlKQSy/t/DLvxl/t
 zS91z63/ajNHslFsGBxx5W2BQ2rSTckYAaKL9KAIdg==
X-Google-Smtp-Source: ADFU+vv7GkRqQqz0012YOeCZDSoBlbR6P9EsoxOSUlc+Q4oxoxo4uNEE60PtSV0CuFZ8fdglQmV2e/lzTkJgpD6++Zg=
X-Received: by 2002:a9d:7696:: with SMTP id j22mr3344521otl.188.1585413105299; 
 Sat, 28 Mar 2020 09:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200328151511.22932-1-hqjagain@gmail.com>
In-Reply-To: <20200328151511.22932-1-hqjagain@gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sat, 28 Mar 2020 17:31:34 +0100
Message-ID: <CAKMK7uF2mipUSr-XRESrRJ8JdOZCekNTCVsDPW5hNp-mWwPj6Q@mail.gmail.com>
Subject: Re: [PATCH] fbcon: fix null-ptr-deref in fbcon_switch
To: Qiujun Huang <hqjagain@gmail.com>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ghalat@redhat.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 28, 2020 at 4:15 PM Qiujun Huang <hqjagain@gmail.com> wrote:
> Add check for vc_cons[logo_shown].d, as it can be released by
> vt_ioctl(VT_DISALLOCATE).

Can you pls link to the syzbot report and distill the essence of the
crash/issue here in the commit message? As-is a bit unclear what's
going on. Patch itself looks correct.

Thanks, Daniel

> Reported-by: syzbot+732528bae351682f1f27@syzkaller.appspotmail.com
> Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
> ---
>  drivers/video/fbdev/core/fbcon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index bb6ae995c2e5..7ee0f7b55829 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2254,7 +2254,7 @@ static int fbcon_switch(struct vc_data *vc)
>                 fbcon_update_softback(vc);
>         }
>
> -       if (logo_shown >= 0) {
> +       if (logo_shown >= 0 && vc_cons_allocated(logo_shown)) {
>                 struct vc_data *conp2 = vc_cons[logo_shown].d;
>
>                 if (conp2->vc_top == logo_lines
> @@ -2852,7 +2852,7 @@ static void fbcon_scrolldelta(struct vc_data *vc, int lines)
>                         return;
>                 if (vc->vc_mode != KD_TEXT || !lines)
>                         return;
> -               if (logo_shown >= 0) {
> +               if (logo_shown >= 0 && vc_cons_allocated(logo_shown)) {
>                         struct vc_data *conp2 = vc_cons[logo_shown].d;
>
>                         if (conp2->vc_top == logo_lines
> --
> 2.17.1
>


--
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
