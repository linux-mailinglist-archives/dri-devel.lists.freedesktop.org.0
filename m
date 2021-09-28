Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3E241ADE8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 13:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377AB6E116;
	Tue, 28 Sep 2021 11:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94726E116
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 11:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632828889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M/E3G8A3gYE+U2dreASmQnyRqiphlZRJm1ekOxiW/BA=;
 b=Db/jIBEtXpIF0syeXJbAx/fFMLc5JI7+RsqWEmh46it7oWi0AOI1QcAus/tgJiScHEGby/
 OILD7U7ibUKB5okAl/haMvaLNPh2eF+lVSeTAEDOQIv/3mTCkTJTDfzRzPROCY0xMVnrni
 9tjdiooy0kbzEExK2lNIQetfO+zoD5Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-0vVp2lWpMZO4l3l0na-sng-1; Tue, 28 Sep 2021 07:34:48 -0400
X-MC-Unique: 0vVp2lWpMZO4l3l0na-sng-1
Received: by mail-wr1-f71.google.com with SMTP id
 f7-20020a5d50c7000000b0015e288741a4so15012588wrt.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 04:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M/E3G8A3gYE+U2dreASmQnyRqiphlZRJm1ekOxiW/BA=;
 b=Wi0DA+EywOXL3ek3twdmFEUKheFfejCRk3Vw0lYL/ONKUQR1OYRmZobCqi+mS5phdZ
 gQClHXaQeRBG5VbdoxepZtqs0xItfKUtWAwpcdAcpChUkohGFE4hAgs59il4A8pLpXJK
 9xwT67yqtOW9DitwQvlsMDmBqdCwRme22Ta9U4EUKBMPN0aCflbIHrJKGB8+U59m6dmi
 U8i3mkGZ4LZiuYjKaeS67pthhyMJN40In4OZ8iQlxQ9rmsB3uUqpvXltdnse77/A/SG5
 HgIBbMskaprnlF9LYf3FQolAFYBd2nGBegaXBb6iV7cQSwPr5uZWc3izzf8N6CzJEfi7
 ZjMw==
X-Gm-Message-State: AOAM5327Fpl7M//JL4AAqme4PGOh7Jc9Zz6xAA7chKjOwZMFqgw8reKi
 /gPhnPC5U20Fe4YKHUBuY92RrFGSCNqOLS7l74Qu6MuKrKiEIyOEiP/oR+XGJljzvKIYLmhJvuI
 ywYNbrwYYwQ56WhcSoG/dizWEZzPOLA0YQxBgkTEs8qa+
X-Received: by 2002:adf:e684:: with SMTP id r4mr5880463wrm.229.1632828887296; 
 Tue, 28 Sep 2021 04:34:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJys6dX122BOsP5c995TAAKHZg1HhiNlNbb3SH87eApAz3oYL6keGkax7mwj4JY6pjNM9VZ/avus/dM3dwa+cIU=
X-Received: by 2002:adf:e684:: with SMTP id r4mr5880447wrm.229.1632828887161; 
 Tue, 28 Sep 2021 04:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210911075023.3969054-1-yangyingliang@huawei.com>
 <20210911075023.3969054-2-yangyingliang@huawei.com>
In-Reply-To: <20210911075023.3969054-2-yangyingliang@huawei.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 28 Sep 2021 13:34:36 +0200
Message-ID: <CACO55tsKcZjB_9E-QfbDY99LT+w_fgssONjEd-qymoSCe0Z7qw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau/debugfs: fix file release memory leak
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Sat, Sep 11, 2021 at 9:45 AM Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> When using single_open() for opening, single_release() should be
> called, otherwise the 'op' allocated in single_open() will be leaked.
>
> Fixes: 6e9fc177399f ("drm/nouveau/debugfs: add copy of sysfs pstate interface ported to debugfs")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> index c2bc05eb2e54..1cbe01048b93 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> @@ -207,6 +207,7 @@ static const struct file_operations nouveau_pstate_fops = {
>         .open = nouveau_debugfs_pstate_open,
>         .read = seq_read,
>         .write = nouveau_debugfs_pstate_set,
> +       .release = single_release,
>  };
>
>  static struct drm_info_list nouveau_debugfs_list[] = {
> --
> 2.25.1
>

