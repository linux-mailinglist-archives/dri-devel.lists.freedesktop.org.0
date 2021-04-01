Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77D135163E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 17:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5516E03A;
	Thu,  1 Apr 2021 15:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617246E03A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 15:35:03 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id 1so1790045qtb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 08:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SPcX6QtS7Ve6UUCNbDaDbB4vAvudpBUFG69ugXPs6T8=;
 b=AHguOOTFAO2NQe8XmSdmlyagtr/wB7GhsgTQRCF/4VWbWuMjMbDGipaw0RxlA0M6yR
 men4W9o7Z3lOPEhONt01til0PnMg/us3/Y7ioK47S+E3qh5tEsfAwsau3lssAXnET16Z
 y4UgVblAdat0wp63BW2m5H52N9VLE+J5QNlQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SPcX6QtS7Ve6UUCNbDaDbB4vAvudpBUFG69ugXPs6T8=;
 b=BHueAbidQHh7cyC4ydypKi8+poXRVpskPdT1yM6QfyLppkCoyc9a2PzuEDiimnXnfv
 8djhxaiqZMsD8dcGYQ9jRrb+JfCz0cBWL1xSdE/nsn4/cPyMDTHQa6H1a7ek3NbZAW8m
 +knUjtgCxgs2ZLuLGPBR9S3gxWDG813qZS3oBIjz69HQPhI6OzdHVgOj6gX5vFjIoVC+
 91sw3pApYd2j4//pVc7Cr+vci3f/ao4a/YyNzD+wvJqEDWDF/UlU9iALrDK7JOkYYZC4
 XY9Xj6ZPNSCXA9TKcy63pLaWERBiNdtdfR6iklnvrkN4SyfDA4Mi1Rj0WEz3XpFrypPL
 wedw==
X-Gm-Message-State: AOAM533NJekjjS8R6QdQQ3ZRF14Bd6pidgqJVWS/BQ0KrWb5mQGQtPdW
 bZokgErMb+H4+YSjlS8AdQvzbgH5cdRziA==
X-Google-Smtp-Source: ABdhPJwcBv6lVhvV/EqbTXf2eBDIGoevYyWPU5Hd1T6LGAUZBxhCffNchzNt1uqfhJ3vnTq7yrXEUg==
X-Received: by 2002:ac8:6c3b:: with SMTP id k27mr7595128qtu.354.1617291302358; 
 Thu, 01 Apr 2021 08:35:02 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182])
 by smtp.gmail.com with ESMTPSA id x14sm1178779qkn.98.2021.04.01.08.35.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 08:35:01 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id m132so2226569ybf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 08:35:01 -0700 (PDT)
X-Received: by 2002:a25:74ca:: with SMTP id
 p193mr12383521ybc.405.1617291301361; 
 Thu, 01 Apr 2021 08:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com>
 <20210401012722.527712-1-robdclark@gmail.com>
 <20210401012722.527712-4-robdclark@gmail.com>
In-Reply-To: <20210401012722.527712-4-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 1 Apr 2021 08:34:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQoauA5kzmmj5ask_sK19mJycYLJfAOeriXsr2pvxaFw@mail.gmail.com>
Message-ID: <CAD=FV=XQoauA5kzmmj5ask_sK19mJycYLJfAOeriXsr2pvxaFw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm: Fix debugfs deadlock
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
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "Kristian H. Kristensen" <hoegsberg@google.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 31, 2021 at 6:24 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> In normal cases the gem obj lock is acquired first before mm_lock.  The
> exception is iterating the various object lists.  In the shrinker path,
> deadlock is avoided by using msm_gem_trylock() and skipping over objects
> that cannot be locked.  But for debugfs the straightforward thing is to
> split things out into a separate list of all objects protected by it's
> own lock.
>
> Fixes: d984457b31c4 ("drm/msm: Add priv->mm_lock to protect active/inactive lists")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Tested-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
