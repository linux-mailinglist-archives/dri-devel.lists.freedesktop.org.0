Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C1B15CD22
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 22:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA366F881;
	Thu, 13 Feb 2020 21:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777846F87F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 21:20:11 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id z16so8160877iod.11
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 13:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XdJ6+t4v4gVXqPsGTcbuSZf1Op16CguWcTM5QAh4j/U=;
 b=G8gmToLcQ2GFr3Y2iihCmtCqN880870+huCEXmbYkzc4kqMgx0DFgLVf5owrVKSJdq
 T3sspw4dUH7dRtfq9qK3Qtdzlr+Nb0VYW7gEpcEfpIt8Gd+hdNvImZiiLO8JBTuO5YSL
 sreEu0f5mc5VYvgSHI+8Ev87E0/UEmAAPbAkPYxidgPRv004E2tMNAjyhda7MAgYCXT1
 2aZVYqkV9bX95wSXGhBaPQGklVhYvTs8xDjAQysaq2BiTprcXDrAzcZRPNAfTdznNcUL
 4fMWBQSb7pJOAG/mGsA1C0PCEItW30l/7m6RmU9E6fipvpS1pL2Aq2QkeWwu939nvHov
 LDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XdJ6+t4v4gVXqPsGTcbuSZf1Op16CguWcTM5QAh4j/U=;
 b=jXo7NEeJwHdqVc8lVPVrAP/n2hQwmvf9r+TShRHZ0Flv+NFEcOO/52hCKlpNPROXUJ
 UWX/TCf8qb859NRPakROgJRaIKAbFqbx/qy1cZ1uL9xVd1T7TDxXLWq1HzmxYCr4qb2W
 g9blbIxfwVFNlfjV4WBU2hHAvRn+YAzlMuix1m/wL7DuTj8RBvOc0rUS4QV76VSONAir
 ZS+vA0Q2yMhRD7E515+b727N3ZHyTiBfzOgBn11nNq04OIrm5dzatw8hdaYlMgi81p66
 9K+E9qvcG5bByn3Wjt5r2XwgzLosH8qx8wmBkrGGhJvd9AbZEm3rtp64ryGcy7B0nz/V
 J5vQ==
X-Gm-Message-State: APjAAAX5JkaGTUnCVMLQA2+NXW/MdUCJaSYYplnOLE7qv5/vmqnsBUSU
 q5bwmX88bAUdb5z+NaOJ32qzGcpTd6SR9kdpi7rojQ==
X-Google-Smtp-Source: APXvYqyAYEUq6eh8DqbFibK/wL7zPASyagcfAHQ0v8tMT+756eMpAPKA3VbtFHzpcWobjF8F0ZqDqoo+BtMlz0XOUZk=
X-Received: by 2002:a5d:8cc4:: with SMTP id k4mr21678723iot.2.1581628810752;
 Thu, 13 Feb 2020 13:20:10 -0800 (PST)
MIME-Version: 1.0
References: <20200213200137.745029-1-robdclark@gmail.com>
In-Reply-To: <20200213200137.745029-1-robdclark@gmail.com>
From: Sean Paul <sean@poorly.run>
Date: Thu, 13 Feb 2020 16:19:35 -0500
Message-ID: <CAMavQK+8un0eD1X2n+ej3oViqCP1q0bLPAV=B9XqNd906MXkSA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: fix BGR565 vs RGB565 confusion
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
Cc: Rob Clark <robdclark@chromium.org>, Fritz Koenig <frkoenig@google.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nathan Huckleberry <nhuck@google.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Matthias Kaehlcke <mka@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 3:03 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The component order between the two was swapped, resulting in incorrect
> color when games with 565 visual hit the overlay path instead of GPU
> composition.
>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> index 24ab6249083a..6f420cc73dbd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> @@ -255,13 +255,13 @@ static const struct dpu_format dpu_format_map[] = {
>
>         INTERLEAVED_RGB_FMT(RGB565,
>                 0, COLOR_5BIT, COLOR_6BIT, COLOR_5BIT,
> -               C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
> +               C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
>                 false, 2, 0,
>                 DPU_FETCH_LINEAR, 1),
>
>         INTERLEAVED_RGB_FMT(BGR565,
>                 0, COLOR_5BIT, COLOR_6BIT, COLOR_5BIT,
> -               C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
> +               C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
>                 false, 2, 0,
>                 DPU_FETCH_LINEAR, 1),
>
> --
> 2.24.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
