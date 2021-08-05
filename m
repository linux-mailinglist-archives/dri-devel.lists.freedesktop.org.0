Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933D33E1CF6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 21:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883DD6EB25;
	Thu,  5 Aug 2021 19:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FCB6EB24;
 Thu,  5 Aug 2021 19:45:39 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id n16so8901017oij.2;
 Thu, 05 Aug 2021 12:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oqhS5sUxb+FPRaCHmEWlXq3OvfKWMu7XyfbVn+a5nZ0=;
 b=ofpTRUJcKmfmo43OyrJS4dZ5vMxWnnJ0cbyaTvQzR9uVGmEcyeB0XNSK/Xj+HZP1uQ
 iJZPQdwsWTRpdZ/yllLQhRQeUCaShZrke6Eu3N7VECTgzErEupVOCkWFIO/d5tN0FiWL
 JZ87mc5Y9d/gPNfVxe05qY84BGaAbtfO8tQ6SzaMzoGLKwN53MBFeuhTjX4KsE+OSv36
 X1Z0nHMsUdFyHWZ0UkC6SVY0kLa1lFz85NXBSp57KBgJse2ReaW6jVuRzkrQJcvC0yJk
 Rm65oqHcuWn8yy8MtXEANt+7U3hdIwM7kWvXa7AS2P7aninDFW1MyHZSqSZw4lvIGlRD
 tMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oqhS5sUxb+FPRaCHmEWlXq3OvfKWMu7XyfbVn+a5nZ0=;
 b=RvP5X6NMXBoJBCpcECDkUr4K2JJ9EtcDhvpsFzw3K7agpbdia0WiqPBoOx7UDYmtr/
 zUdKwd+amPmb2OeH4E6bpiJcnTk5FabAEbB7q1c7MyBf+Chd1OkUZZFe7ZBJAsQsMBfa
 IuN3C07w/eXq1Ous4Z0vXVSHqLjZk9VDf7U/KD7IqJX8al1yNz2Df1jKWjd9NRCkOpux
 scNwizxYkXOkZi8lY1+H0Cwagh7gFnspEOTgM4idwH17iOFO3NqnB7mun3ds/gTYzwZe
 9KxnrDNPIdl+bFugypVNGtU2JkxQ7W5h8C7S2xvmhka6Y9ldojUbJlwCKqqdQFRG7WGU
 3PrA==
X-Gm-Message-State: AOAM533+ns1r4T2LvcpWgzBq21/WZ/mGRyHbOKDhr5mSmqhnBr2Ycne0
 cU7lVVpwWxqbbRJowgXRgObcB2CzR2Py927hRok=
X-Google-Smtp-Source: ABdhPJxrEYt0szkcD/cfSYhFo1AC+UgnnsHdkrgRqo4gcN3MWQd6mMuRE94WTAiaWxNSQ9u9S4jqhgDoI1vNMkMuBcI=
X-Received: by 2002:a05:6808:6d2:: with SMTP id
 m18mr4805541oih.120.1628192738822; 
 Thu, 05 Aug 2021 12:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <fd28a9cec24a8d32ebb26dd857c399d0a15acdd5.1628188477.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <fd28a9cec24a8d32ebb26dd857c399d0a15acdd5.1628188477.git.christophe.jaillet@wanadoo.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 5 Aug 2021 15:45:27 -0400
Message-ID: <CADnq5_Prm8D8z5TuH-iha8DvEX9oRqzaRNqdCyXjAVib1=qozg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Fix a memory leak in an error handling path
 in 'vangogh_tables_init()'
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, 
 xinhui pan <Xinhui.Pan@amd.com>, Dave Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Huang Rui <ray.huang@amd.com>, "Quan, Evan" <evan.quan@amd.com>,
 Xiaojian Du <Xiaojian.Du@amd.com>, 
 Kevin Wang <kevin1.wang@amd.com>, "Su, Jinzhou (Joe)" <Jinzhou.Su@amd.com>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
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

Applied.  Thanks!

Alex

On Thu, Aug 5, 2021 at 2:44 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'watermarks_table' must be freed instead 'clocks_table', because
> 'clocks_table' is known to be NULL at this point and 'watermarks_table' is
> never freed if the last kzalloc fails.
>
> Fixes: c98ee89736b8 ("drm/amd/pm: add the fine grain tuning function for vangogh")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> index 335b3c70e1a7..06eea917284e 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> @@ -256,7 +256,7 @@ static int vangogh_tables_init(struct smu_context *smu)
>         return 0;
>
>  err3_out:
> -       kfree(smu_table->clocks_table);
> +       kfree(smu_table->watermarks_table);
>  err2_out:
>         kfree(smu_table->gpu_metrics_table);
>  err1_out:
> --
> 2.30.2
>
