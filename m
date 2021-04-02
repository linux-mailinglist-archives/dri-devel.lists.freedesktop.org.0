Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A19C3530DB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 23:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA416E171;
	Fri,  2 Apr 2021 21:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451056E0CE
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 21:45:41 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id x27so3059390qvd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Apr 2021 14:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w/ZFqdPtGzDkqCBMP4OyjhCVZaJFf+dBQBfj22hpRiE=;
 b=fR/uwETGDlv7x2KneEGWioUh5GnHXl6COTEbAPvUEKXqSO6DcbFhq6GmsakFHFfQb1
 wliBhr4E8MsNOCDNkBhlQKCaO4VIM69RBeM5lAhTDxR2PyRbPdXlccDmkWf3i+hZ36ZY
 wDCOxhUkM9o0Ddesn2NSw1F02JXvkyONIIoMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w/ZFqdPtGzDkqCBMP4OyjhCVZaJFf+dBQBfj22hpRiE=;
 b=IosSxl93NOQBjX6SV5fz1q79tz8TEmEfYmY8bAEJ08NMTHWY+qKvtLmxqQquYnKbVJ
 J/9q2XdXsEwOjn3jHtRzQYu5X8AEhAMe+mNS4dLlcghFkWIeaY/fcAfQR0puxAGQcc9B
 Nap4cBzTEgs8dkc7iq+hNNdag5pxSUfidiffMR1amVAvirrT96vkfuvGR06LgLr8aVUm
 X7wUNDYI0r49oRKsqQSVJLfsmx7Vht3/AkRISasFZycQo8apBOgG3lMIZ17aw2f9uTJd
 PKqiqYHNmbQSubMysoT9/1O3WlT+WBdaLYepxKdZiTQSQoVUNDUbbHQpV1JJgydofFcs
 I7Nw==
X-Gm-Message-State: AOAM5309D/wloYzh9gETSG9GWiwcJa5KnPPOiAO8uQZDGd8NxzL1nQ8q
 /Dqf5xjeHOBWnLQFozQVfmmAtK0n2JJJAg==
X-Google-Smtp-Source: ABdhPJwCXQR1pDzyNSsx2/OkFAiAs481cx9yh5VxWcOnKkK0qPUte9AUZ81cJwEHyVzAcS7ss95XIQ==
X-Received: by 2002:a0c:e2cd:: with SMTP id t13mr14806695qvl.44.1617399940195; 
 Fri, 02 Apr 2021 14:45:40 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178])
 by smtp.gmail.com with ESMTPSA id c1sm7407591qth.3.2021.04.02.14.45.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 14:45:39 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id x189so6306809ybg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Apr 2021 14:45:38 -0700 (PDT)
X-Received: by 2002:a25:8712:: with SMTP id a18mr14891430ybl.79.1617399938583; 
 Fri, 02 Apr 2021 14:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210402211226.875726-1-robdclark@gmail.com>
In-Reply-To: <20210402211226.875726-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 2 Apr 2021 14:45:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vm9CTmayrKjUoLNyObtQgejhBacvvP5aK5tFULmPWeNw@mail.gmail.com>
Message-ID: <CAD=FV=Vm9CTmayrKjUoLNyObtQgejhBacvvP5aK5tFULmPWeNw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Drop mm_lock in scan loop
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 2, 2021 at 2:08 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> lock_stat + mmm_donut[1] say that this reduces contention on mm_lock
> significantly (~350x lower waittime-max, and ~100x lower waittime-avg)
>
> [1] https://chromium.googlesource.com/chromiumos/platform/microbenchmarks/+/refs/heads/main/mmm_donut.py
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.h          |  3 +-
>  drivers/gpu/drm/msm/msm_gem.c          |  2 +-
>  drivers/gpu/drm/msm/msm_gem_shrinker.c | 48 ++++++++++++++++++++++----
>  3 files changed, 45 insertions(+), 8 deletions(-)

Looks good to me now!

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
