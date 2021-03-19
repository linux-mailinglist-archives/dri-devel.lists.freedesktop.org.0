Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A822B342911
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 00:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF856EB0B;
	Fri, 19 Mar 2021 23:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8668D6EB0B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 23:10:58 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id a11so8103790qto.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 16:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7EuZmmo91nl6huegeyFuO2PiUXV9nzZOyWpFg59NAqE=;
 b=TDSloJVVt/I8eDwWDYUXCksx1aBtsUfY+B1qBO9c6yy6IUkL+X3Vk8u3mQ25bRE0sL
 xftu+bGP8qFIT2FgoOfFfKm4dBELCuFE3xnYFkaZff2We+jAYkqFSF9ysPeZjggzset+
 ocPc11dxbFUhsI9gYwJdlvXRYazxvPEkGDaA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7EuZmmo91nl6huegeyFuO2PiUXV9nzZOyWpFg59NAqE=;
 b=rgMHTIJEAo9RUkNolqwbc11O7oy0IVlW9kSbCBKEHLH9Mnsh4nESB/cUmVvj5JP5je
 C9mF8otvwTGC6gyf8n5kyrQs6s3/HhWuOFr519QG2kS/ic2f+06Emx7OxTni+iEtOfEh
 7h/+cXGUfGns9HvW0IRXDt9JJ1FT6VoRZO0adW8y4BM9+2hBFjkZVNku6ulIeBMV27sO
 E71obL1fK8yt0aoqjkqmv/12m5z9pPNAWGLt+D7dGdtKFtW8FG3uFv8+yD8REpPpd/+e
 W829p1KstRyNW9kv4DWF5WgyLSrn9sY024pCtAbPlm7BrDivHCbPKidqie3s+rjaQ5rm
 fCDQ==
X-Gm-Message-State: AOAM530zfR2s+d7kCUBK1Q65Z6WrGrX8XrxFR6Vrzpw8DrhpqLAA4DMM
 3a4A0sf+qBnw8BOsLRj8RYm8hCUmEs8jiw==
X-Google-Smtp-Source: ABdhPJyC8xYln0FaNz87/zsEb/cHquJRcg9b5OK+aNZu+PVJaDSC9gunuutOIeDrOpb9InvRAxZCqA==
X-Received: by 2002:ac8:44aa:: with SMTP id a10mr1074337qto.146.1616195457221; 
 Fri, 19 Mar 2021 16:10:57 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176])
 by smtp.gmail.com with ESMTPSA id r133sm5698696qke.20.2021.03.19.16.10.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 16:10:56 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id l14so7371083ybe.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 16:10:56 -0700 (PDT)
X-Received: by 2002:a25:ab54:: with SMTP id u78mr10033101ybi.276.1616195455835; 
 Fri, 19 Mar 2021 16:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <1616158446-19290-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1616158446-19290-1-git-send-email-kalyan_t@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 19 Mar 2021 16:10:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XdBOZYuCVUjhAnEu0sKOmEHaCpA69v=BjQoM9gGQFjTg@mail.gmail.com>
Message-ID: <CAD=FV=XdBOZYuCVUjhAnEu0sKOmEHaCpA69v=BjQoM9gGQFjTg@mail.gmail.com>
Subject: Re: [v1] drm/msm/disp/dpu1: fix display underruns during modeset.
To: Kalyan Thota <kalyan_t@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 19, 2021 at 5:54 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> During crtc disable, display perf structures are reset to 0
> which includes state varibles which are immutable. On crtc
> enable, we use the same structures and they don't refelect
> the actual values
>
> 1) Fix is to avoid updating the state structures during disable.
> 2) Reset the perf structures during atomic check when there is no
> modeset enable.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)

I think Stephen was the one who originally noticed this and reported it, so:

Reported-by: Stephen Boyd <swboyd@chromium.org>

Seems to work for me. I got into the state where it was doing a
modeset at reboot (could see the underflow color for a period of time
when this happened). I added your patch and it looks better.

Tested-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
