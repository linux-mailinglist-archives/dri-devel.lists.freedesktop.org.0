Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D75309586
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 14:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61596E0C9;
	Sat, 30 Jan 2021 13:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3836E0C9;
 Sat, 30 Jan 2021 13:51:18 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id y187so9345641wmd.3;
 Sat, 30 Jan 2021 05:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W3VBKfc+4tq/fmG30+/aKc2uMtbIAE8KQdiDwyUozgQ=;
 b=jaua0C33wX1KaPCmnOIdxz2s02T1wrTdS9POD92JnAdYIEBDQjNDOlkq9vu86BFLnr
 J+msOOLD/cC9D/76marTC4/e3flYSWPsM9IYTsH6zwJH2cjQIV4aiz/1fC1/esOJijSn
 T5q8m9EC5m9bRKPRcYgiZXVbHyXDlR28G152b5mMbktGoJFX71knwznIO0fEStgsZiYs
 aUU/VLdWvHwft/6r3hTpsgnwLX97ZA4m9LnJOnOSUaq5Y9j5UIkY0OjOwUyAdJ0SwxS6
 0ChA4i6icWbj3dua9hwjo/Yi6LAuR3bQAHtzsxMkznZqmREtLcN9ZjLwXq/OAFjE00Qz
 L0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W3VBKfc+4tq/fmG30+/aKc2uMtbIAE8KQdiDwyUozgQ=;
 b=lf+POvNISIWKjfDgE4iHp2KK1xjV3W/ACQ/ql2BzVBpbn6xm5kodqWXEBDLx03UbjA
 8AzBQK1wrlws8HlhyOzOYmq/7PYNY95q0lqM4RSSOtAKa6OeVzo2KEA9nnEIHEC8Rhkt
 x1HzJKIYKF5+obDJ8QFG/Iv0AowyWqAgQJsyBAQ1ZAURLn5FL231lGYLNuljnRFtj8Dd
 Gy+6BW4YxpvLJDb+KSsqNZYGxeNYf/otDUuOg8JjNOwA+uiMnvW9JgnjdsjoBTV7Mykt
 xKYUwzCHXIkT/P1lPzbpc5BcP1zR3zlqbqxETsFjLFxv72MiMRLY7I0rvm51jrA/8qRE
 2V5Q==
X-Gm-Message-State: AOAM530OukIolJNJunWQwBHSslBTTjJ0JNM0I1Z+5/ZMJj7bpWbGvPoC
 Jtj+oOuZ8CuckSHl49RHTTfaEmvvT1Uhw9QzCVs=
X-Google-Smtp-Source: ABdhPJw7KtSJHup2r501KK4A1HOJY2DW3Cm6gdA+sYBex8S9Q2eqKOnegZBQSUG96/RUfvzVr2o2CDrLhUqS7tx8cqo=
X-Received: by 2002:a1c:688b:: with SMTP id d133mr7905587wmc.41.1612014676695; 
 Sat, 30 Jan 2021 05:51:16 -0800 (PST)
MIME-Version: 1.0
References: <20210127105121.20345-1-lukasz.luba@arm.com>
In-Reply-To: <20210127105121.20345-1-lukasz.luba@arm.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Sat, 30 Jan 2021 21:51:05 +0800
Message-ID: <CAKGbVbsn=xVEa0=c3rywRShVZD18LkmLZ1qDUuDsrT5KnTjr6g@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: Use delayed timer as default in devfreq profile
To: Lukasz Luba <lukasz.luba@arm.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 christianshewitt@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the patch. But I can't observe any difference on glmark2
with or without this patch.
Maybe you can provide other test which can benefit from it.

Considering it will wake up CPU more frequently, and user may choose
to change this by sysfs,
I'd like to not apply it.

Regards,
Qiang

On Wed, Jan 27, 2021 at 6:51 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
>
> Devfreq framework supports 2 modes for monitoring devices.
> Use delayed timer as default instead of deferrable timer
> in order to monitor the GPU status regardless of CPU idle.
>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
> Hi all,
>
> I've missed the Lima driver while working on Panfrost patch for fixing
> the issue with default devfreq framework polling mode. More about this
> and the patch, can be found here [1].
>
> Regards,
> Lukasz Luba
>
> [1] https://lore.kernel.org/lkml/20210105164111.30122-1-lukasz.luba@arm.com/
>
>  drivers/gpu/drm/lima/lima_devfreq.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
> index 5686ad4aaf7c..f1c9eb3e71bd 100644
> --- a/drivers/gpu/drm/lima/lima_devfreq.c
> +++ b/drivers/gpu/drm/lima/lima_devfreq.c
> @@ -81,6 +81,7 @@ static int lima_devfreq_get_dev_status(struct device *dev,
>  }
>
>  static struct devfreq_dev_profile lima_devfreq_profile = {
> +       .timer = DEVFREQ_TIMER_DELAYED,
>         .polling_ms = 50, /* ~3 frames */
>         .target = lima_devfreq_target,
>         .get_dev_status = lima_devfreq_get_dev_status,
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
