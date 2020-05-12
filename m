Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5525A1CF25B
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 12:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216B56E140;
	Tue, 12 May 2020 10:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEDD6E140
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 10:29:55 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id x6so7537020vso.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 03:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p1anfrRYc8vwPvBSKfvHdfaNKB+wk9PvTQDDFl6XtpI=;
 b=FruyWgzG4WIhHi8SZVivgCp0mnW+EljVNpeT7yoqPIB/W2SvXbogIThsyt+kDiBs/Y
 XoQg0q6xNE7vz+sfBdPV/aBw+7vhkXC6WfDCpI59wtu8i+YRSFN5cIBN0viNsCozq6eO
 YOhSvTYIH4UOO5GuEWIOgU1lFQEmLfVhC1Rh/1lUSssdu27AEcpOcQFmIEYLXmPQ4ze7
 Skzts/KJ3NoYUN2UPrKUXpeekqTjnCxCGFrM498brHGxsUF87hU5Ia3eKXRdG87E3chD
 BHvSszE62wVtUTgH4uy9wL5X/nZyF7kODaXyHKBdQgFpqXvqxVOe828Z3PYN2OAqE4Ut
 KJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p1anfrRYc8vwPvBSKfvHdfaNKB+wk9PvTQDDFl6XtpI=;
 b=glZP1addoIE0NH0a0AJuhG+18/mVIlyaEy3u1EQpxWgB6xqe8TLkxWSBRa1+jPvCvi
 NV+xYoBnEoEPxH/Ocfp+wX1Zkn5seUVGsTtlLKwZr2Xl7oM/KR134Gqizd+P6gHlt/qP
 qQJeWjwcTDZLWKFu1ofdOxZTl/Xl1h82BaDxyVmdAhrcT4zeWEm+tWD4n3q3ixUVyQCT
 GkS0jQlPCQ5SCj//p1eyDxj32JNTS+tKiWjJNpPJaZk1BHyQVhYVQBaTgmCOZPrdKkRc
 /UKvM2oWut4Vto383ZhuBn/du8ZxyYaYNssqR3jT5QjsHfu4s4Zy+N9mDDdKueF6xbEd
 Ri6w==
X-Gm-Message-State: AGi0PuZ0ZNIBEO4Mb+b5tUKRolMMvGXuhaRttoo6zOGzYce28Gov4Tge
 qCeA2YyTGRLDL6HzmsUA3BlVNmrDm5DJ3qV5E8s=
X-Google-Smtp-Source: APiQypIx8/d1as9ThVwEeERqMI7tYbb9uV8ytEm1EEmHJIEZCTwSMsYH/D7OfT9VAzFle0gxlFqWkGD3Oj1YhMeGME8=
X-Received: by 2002:a67:fe8c:: with SMTP id b12mr14859424vsr.186.1589279395096; 
 Tue, 12 May 2020 03:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200512084258.12673-1-tzimmermann@suse.de>
 <20200512084258.12673-8-tzimmermann@suse.de>
In-Reply-To: <20200512084258.12673-8-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 12 May 2020 11:27:16 +0100
Message-ID: <CACvgo51jGbEwSOMv=fpWtsBJ9v5j0EZtX=iN9y0DfyHqoVXa-w@mail.gmail.com>
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

Hi Thomas,

On Tue, 12 May 2020 at 09:43, Thomas Zimmermann <tzimmermann@suse.de> wrote:

> @@ -1143,20 +1178,15 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
>         WREG_CRT(13, 0);
>         WREG_CRT(14, 0);
>         WREG_CRT(15, 0);
> -       WREG_CRT(19, pitch & 0xFF);
> -
This write has disappeared without an equivalent or a comment.
Is that intentional?


-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
