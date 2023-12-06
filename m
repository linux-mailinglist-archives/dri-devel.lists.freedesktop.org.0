Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 392CC806A5E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 10:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF95B10E4F7;
	Wed,  6 Dec 2023 09:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD8F10E4F7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 09:09:37 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-db539f21712so594676276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 01:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701853777; x=1702458577; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wP++sDZ0D6RnqxEDsIfOfMZaHshu8C2nXxTEhtKdeFg=;
 b=odkN2lXssCAIwLtCRiVctCF0DQUCbq9Yzb5bMCIRx1ZozhzDHlbN6GqophSbYZSZg3
 KriOqZGh0iou61LPL4JRrCSxmHS0cPseN5hC9HV+yuZGE1tPfbpwj676HiXSndjMMuTo
 Fa+U/BHyd3V875iiY/4QPo6+6tXb4662aN9XvOKac6V/FbUdypRBamLRNldtgI+0qYC6
 QQpsOqzVlp/JwXIAOG7NIvZLbZbyS0fKRauSroRI3P0zvS6QfGr5923xUoz91XoBHbry
 WAfRw5Er+ovbIs74UyCnjm/S0O8aYpIvJO4/6kui0+kT3mnpPmArM08MHwI1WSYm1efB
 wqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701853777; x=1702458577;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wP++sDZ0D6RnqxEDsIfOfMZaHshu8C2nXxTEhtKdeFg=;
 b=wp/4+R/VDf5zbv/JB/3MmSd5BSq/XaPrMJbtX/peGdYTBIw5MjzU5SFP1QQO2t4NDj
 su+hsv8ymvur5TcnFxrAKabXo7VwUuZqwKiOOnuSZs4SSE6ZijBWbp2/xwhbBkhYEDXq
 jSM3kV3vFu3GSX94JQ/hJLvUjHEk6fmOM1yU8ZamoCjgq1BAe/kqJdbUmJhEntvDzm0e
 miPXyjZoVsko3nn1GVjdZcNsBBcGdbUtCGLBll9ZE090v8BadpZaBEOUR0QB7fuS0txx
 RRlMSwE3OJ2akPvqJ/930AMRVId7L/CMysuc+ikZ12oLPc5oCSh37gAIEIXgGcDZOzdT
 hOZA==
X-Gm-Message-State: AOJu0YwGAnsMNaLaEm/dEJPIXBd8HENhe6I/lOJfMvf9SrmJok2DYEht
 9XEb9NfByt2SdagZf29oiMgU1wJqKWIkJgfBxtfMHA==
X-Google-Smtp-Source: AGHT+IHg0pHACl+xt9RzmXvwGIPui6Yb8M/F4NDq2ZCAoTAskYtXkHT/owjn5oxY8N77ibLrBkj9aG20YDg0hFxnl2M=
X-Received: by 2002:a05:6902:4e1:b0:db9:85c7:b052 with SMTP id
 w1-20020a05690204e100b00db985c7b052mr1761994ybs.9.1701853776943; Wed, 06 Dec
 2023 01:09:36 -0800 (PST)
MIME-Version: 1.0
References: <20231206072701.13276-1-dinghao.liu@zju.edu.cn>
 <77925c2e-8cb2-473b-9dd0-3ce60a909066@suse.de>
In-Reply-To: <77925c2e-8cb2-473b-9dd0-3ce60a909066@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Dec 2023 11:09:25 +0200
Message-ID: <CAA8EJprUDgraGgiGKsh0PSVd6Zxe9L2Q+HTPrALHWFVP3hiq1Q@mail.gmail.com>
Subject: Re: [PATCH] drm/plane: fix error handling in
 __drm_universal_plane_init
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Dinghao Liu <dinghao.liu@zju.edu.cn>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 6 Dec 2023 at 10:22, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 06.12.23 um 08:27 schrieb Dinghao Liu:
> > __drm_universal_plane_init() frees plane->format_types and
> > plane->modifiers on failure. However, sometimes its callers
> > will free these two pointers again, which may lead to a
> > double-free. One possible call chain is:
> >
> > mdp5_plane_init
> >    |-> drm_universal_plane_init
> >    |     |-> __drm_universal_plane_init (first free)
> >    |
> >    |-> mdp5_plane_destroy
> >          |-> drm_plane_cleanup (second free)
> >
> > Fix this by setting the two pointers to NULL after kfree.
> >
> > Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> to get the immediate bug fixed.
>
> However, I don't think it's the correct way of doing things in general.
> Planes should probably not attempt to even make a copy, but use the
> supplied pointers. Lifetime of the arrays is the same as of the plane.
> That's for a different patch set, of course.  (I did not review the DRM
> code whether the internal copy is required.)

But there is no internal copy. The issue is in the mdp5 code calling
drm_plane_cleanup (indirectly) even though the plane init has failed.

>
> For now, maybe drm_plane_cleanup() could warn if format_types equals
> NULL. [1] It indicates that the plane has not been initialized correctly
> and the driver's memory lifetime handling is somehow broken.
>
> Best regards
> Thomas
>
> [1]
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_plane.c#L542
>
> > ---
> >   drivers/gpu/drm/drm_plane.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > index 24e7998d1731..1331b8224920 100644
> > --- a/drivers/gpu/drm/drm_plane.c
> > +++ b/drivers/gpu/drm/drm_plane.c
> > @@ -304,6 +304,7 @@ static int __drm_universal_plane_init(struct drm_device *dev,
> >       if (format_modifier_count && !plane->modifiers) {
> >               DRM_DEBUG_KMS("out of memory when allocating plane\n");
> >               kfree(plane->format_types);
> > +             plane->format_types = NULL;
> >               drm_mode_object_unregister(dev, &plane->base);
> >               return -ENOMEM;
> >       }
> > @@ -317,6 +318,8 @@ static int __drm_universal_plane_init(struct drm_device *dev,
> >       if (!plane->name) {
> >               kfree(plane->format_types);
> >               kfree(plane->modifiers);
> > +             plane->format_types = NULL;
> > +             plane->modifiers = NULL;
> >               drm_mode_object_unregister(dev, &plane->base);
> >               return -ENOMEM;
> >       }
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)



-- 
With best wishes
Dmitry
