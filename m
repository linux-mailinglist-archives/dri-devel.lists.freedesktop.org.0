Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D55A496693
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 21:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EBC10E6E8;
	Fri, 21 Jan 2022 20:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3914110E6E8;
 Fri, 21 Jan 2022 20:48:25 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id g205so15263082oif.5;
 Fri, 21 Jan 2022 12:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WGjUTrV5mgHMzDhyvLsZZ8pd7X6AuuH7QuhfJeG9EgY=;
 b=kvmf2OSxp7vQKMwYR1dLgO6WSiX2+4nzHhjmW/Oz5Vx0F/DK5D1vuYufA1qJh9Hx8a
 LfHmpvcS+ayKbXU3K1KqQvhGyBD1/9voVd8xBJhLWdUkaeOtZNW8nOlj2NT51r791/iw
 C1yXy+49U6UWHQxbmVxO2gR3A0Ot1byMBQMNkzoEOFKlPDfLSYdkPZ3ueek84qDVORVm
 ItiKUCPqLuAw3+Ac8+8viaNyNaokKwZyq7tsXOPOs0ZJV8ts+QZSdT+X526m/fv2gVZA
 dvucmMp0dZvzSnL7KV3yLFjafRYSt+ieGp4YyxXF6N3JQnT2EjKZqCvaQdHGuocKInoQ
 /1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WGjUTrV5mgHMzDhyvLsZZ8pd7X6AuuH7QuhfJeG9EgY=;
 b=veXBxs/I6+EkPa76A4WigOabueRjBAUzJLS4sN9rGsgjserlvT7Tyiyps0+isLvYkv
 hNRrWRorC1y3LXc4eXZpV6jvz9Xv83+gsyZMVE25GSqdzRyMrZcHwid/grL6RPAaaPpx
 ks3YRQLbAX9Mp5n/SSJAtcJlEd40qCtupO+6PDgNDfou/Dy8AGojxTSZ8L+i/cyG4/aD
 KjEh5M+ztcqs9BiLOwHMzYovRrneAxl94QgcYnYXq0YTUBygMwVwsmhRuYtm42fpg4V5
 F5hzS/wMDoFY1U6r6DkfRHX0vns/OUdsSVinqJeOV2nfwfim4nByTQJiZHtCru0IrI53
 3Hng==
X-Gm-Message-State: AOAM532egLfDkyS/i/QW7biGi2t/A6IFIt7+fLsF2PjzoMaaYbb1Oatj
 OeaKVfaXuTv6na139UacgiXA4oXUfah8qcVqh/A=
X-Google-Smtp-Source: ABdhPJyFepdztr15jwXrbjkaZsAmzuoos6TQ9cMezqozHSl5K0Wmi1lv0sbBN6F1FVhtc6sl7qvKX2ON/nhJOnVhzbU=
X-Received: by 2002:a05:6808:300b:: with SMTP id
 ay11mr2012664oib.120.1642798104543; 
 Fri, 21 Jan 2022 12:48:24 -0800 (PST)
MIME-Version: 1.0
References: <20220121052827.4384-1-xiongx18@fudan.edu.cn>
 <23d5251f-c910-aed3-5d9e-07d6e5e5add2@amd.com>
In-Reply-To: <23d5251f-c910-aed3-5d9e-07d6e5e5add2@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 21 Jan 2022 15:48:13 -0500
Message-ID: <CADnq5_N5Di8mxWDoVe5hdqPfrBnCw=gnDMzMyHeenk2gb=aSZw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu/amdgpu_cs: fix refcount leak of a
 dma_fence obj
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, yuanxzhang@fudan.edu.cn,
 David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Xin Xiong <xiongx18@fudan.edu.cn>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 21, 2022 at 2:45 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 21.01.22 um 06:28 schrieb Xin Xiong:
> > This issue takes place in an error path in
> > amdgpu_cs_fence_to_handle_ioctl(). When `info->in.what` falls into
> > default case, the function simply returns -EINVAL, forgetting to
> > decrement the reference count of a dma_fence obj, which is bumped
> > earlier by amdgpu_cs_get_fence(). This may result in reference count
> > leaks.
> >
> > Fix it by decreasing the refcount of specific object before returning
> > the error code.
> >
> > Signed-off-by: Xin Xiong <xiongx18@fudan.edu.cn>
> > Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
>
> Good catch. Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Applied manually.  Strangely I never got this on any of my emails, and
I don't see it in the archives.

Alex

>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_cs.c
> > index 0311d799a..894869789 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > @@ -1510,6 +1510,7 @@ int amdgpu_cs_fence_to_handle_ioctl(struct drm_de=
vice *dev, void *data,
> >               return 0;
> >
> >       default:
> > +             dma_fence_put(fence);
> >               return -EINVAL;
> >       }
> >   }
>
