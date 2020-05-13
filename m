Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AF41D0B60
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 10:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D936E084;
	Wed, 13 May 2020 08:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4723C6E084
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 08:59:41 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id f7so4068996vkl.6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 01:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1bgOdZIiy5bSYdHU3g09vxnib+zfzFi1nERKcVAhqcI=;
 b=ravqsgaB0Db7Sxtz/fle5udcQVJevWZv4rLuOZvRsTRXMpG2IfhVNLxDHXfEgqlULp
 DQX7RAjldk0WJMNwv53gDdEXb2pgTve2EYussx0ndsYS8I3EOh7i1Tt3lTR6kvMFPz4y
 ioohuwWxYmXlsi8CnnchjkrU250ulnNAJXKnFVFRZ17+gVFwsqe20/uFBWL6nGLuopn8
 a3bAEevfrIhhzJplNLj31M4h5Wi9Q3rtS9SFPE0UT+6OdEwOOC79Scl5VKbvqSDTt/nk
 IpNanDlznbNpKlKfK+gIdxsjbHxmtsmtdh419DoLgh+wE0ITSTrlM501CUMVEJ0VgV4O
 HO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1bgOdZIiy5bSYdHU3g09vxnib+zfzFi1nERKcVAhqcI=;
 b=nLoQR5/zda+wYAplud43jyxPDZm4m3VJKGyw5A7fDiXZgSc5Fw72K1M8GD+qQ+ao0Y
 klGLSzosT07/4MEWHKsiU2CAz9Ey6MmzQSg5hq1M5qXyCqTKz6FNbaRjqwdAhzXas1Dg
 IEtQjrO/rfXxUAufAA6zQPAHs45wy2XMHBSvfuRsWRtP4ljL5ycmy5CMkL1n7DsVCIYQ
 1t+eG30RZT8fdenfSTzjruHZmVUjvBZPYasha3nQfA7pjTXwpsA8MCBomdC34u8N3Zli
 eRrE4KZ7PqrWAZfXGvNkf65Fg9RRsF95AsOfgwB9SKOtMw+QUM3kS+HE3XqG0cz4BA6s
 OoiA==
X-Gm-Message-State: AGi0PuY1S9Wf6xSmYbQQlV4cMxqtr1K+RCVM7J+KEHQJgfzKfVl7s6tQ
 QhsmQZeVysoEq2iijD5ZhcdD5HCT2C0uKo38k4Q=
X-Google-Smtp-Source: APiQypII/PHEldkeqGNZF7EiQnr5WuRUFlQXO+LY+4Jp7PzJcsTpdVryfOthB0y9Z9c6sC4hmiBRjjtkAu6846czwS8=
X-Received: by 2002:a1f:ac0e:: with SMTP id v14mr19555359vke.28.1589360380455; 
 Wed, 13 May 2020 01:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200512084258.12673-1-tzimmermann@suse.de>
 <20200512084258.12673-8-tzimmermann@suse.de>
 <CACvgo51jGbEwSOMv=fpWtsBJ9v5j0EZtX=iN9y0DfyHqoVXa-w@mail.gmail.com>
 <60ba1692-b517-4eeb-d1c9-368a7616e5c9@suse.de>
In-Reply-To: <60ba1692-b517-4eeb-d1c9-368a7616e5c9@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 13 May 2020 09:57:00 +0100
Message-ID: <CACvgo538XATGB7T1EGotpV3EnJS_FRWopa4V79A1L354A2vutA@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] drm/mgag200: Set pitch in a separate helper
 function
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: john.p.donnelly@oracle.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 May 2020 at 19:34, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi Emil
>
> Am 12.05.20 um 12:27 schrieb Emil Velikov:
> > Hi Thomas,
> >
> > On Tue, 12 May 2020 at 09:43, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> >> @@ -1143,20 +1178,15 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
> >>         WREG_CRT(13, 0);
> >>         WREG_CRT(14, 0);
> >>         WREG_CRT(15, 0);
> >> -       WREG_CRT(19, pitch & 0xFF);
> >> -
> > This write has disappeared without an equivalent or a comment.
> > Is that intentional?
>
> It's still there. It's now located in mgag200_set_offset() and 19 is
> written as 0x13. :) I try to follow the naming style of the MGA
> programming manual, which prefers hexadecimal numbers.
>
D'oh, didn't register the dec->hex change. Thanks

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
