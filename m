Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A85146B7785
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 13:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35A310E4FF;
	Mon, 13 Mar 2023 12:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE2C10E4FF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 12:31:27 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id o12so48011069edb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 05:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678710685;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a0bbMhFhOI8Ji1xMopDWeP948kqcB28dUKXFSOResUE=;
 b=FIGkwnhXIqt5+2T1qz0ReASoR+Wh0BKGZbmSsWewcAvRw8CPJhfgBTjF7JEsnHauFe
 Y0ewS7sJ9eh54SvAc9hYt2Ywa24BeVYIbiGrEOf9xqUIXYdnzLBukEY0MU6xLD1vla8h
 vh5XHUrXrD9QiFs15HJlhQ3tYwZyoj4RLQdA3JywuMo7/qZVlmN0zE71t0VMP+Y5Wu9U
 lymGHv7NO98Vn+kNFxqJ7NBoCK+XMOFjIwNpFVef6aOBXV8GQS0i4GT/FdxhFSAM/Jsv
 TZCSNO05KI1As4nK3ID0S+qDyBLPX3XbEvDLBXmh6tLoq9xawSzm0qyjPpFQN3Gs39UM
 StaA==
X-Gm-Message-State: AO0yUKU3V4GNO9m7TJVLUx1bpJeW0YXiihQ134pcZJ4yPhhWDTBnamFn
 CfLMfNi+mHmHLPG6n8vr8/lFu27aguY4SmXpj8Y=
X-Google-Smtp-Source: AK7set9SLWkK9hDI+ESO3A0t77NH8crzKEpXMjynKfG40lU2l7vys3hVzssPtA0R4R5F4vLHco0GlWLCYPtDiOOwAEw=
X-Received: by 2002:a17:906:388d:b0:877:e539:810b with SMTP id
 q13-20020a170906388d00b00877e539810bmr17787514ejd.2.1678710685450; Mon, 13
 Mar 2023 05:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230312204150.1353517-1-robdclark@gmail.com>
 <20230312204150.1353517-11-robdclark@gmail.com>
In-Reply-To: <20230312204150.1353517-11-robdclark@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 13 Mar 2023 13:31:11 +0100
Message-ID: <CAJZ5v0gEmFj5Yrm0OZx5XhvGStHXx1OsPXGQqmbFQpeYSADkwA@mail.gmail.com>
Subject: Re: [PATCH 10/13] PM / QoS: Teach lockdep about dev_pm_qos_mtx
 locking order
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Len Brown <len.brown@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 "open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 12, 2023 at 9:42=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Annotate dev_pm_qos_mtx to teach lockdep to scream about allocations
> that could trigger reclaim under dev_pm_qos_mtx.

So why is this needed?

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/base/power/qos.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/base/power/qos.c b/drivers/base/power/qos.c
> index 9cba334b3729..d4addda3944a 100644
> --- a/drivers/base/power/qos.c
> +++ b/drivers/base/power/qos.c
> @@ -1012,3 +1012,14 @@ void dev_pm_qos_hide_latency_tolerance(struct devi=
ce *dev)
>         pm_runtime_put(dev);
>  }
>  EXPORT_SYMBOL_GPL(dev_pm_qos_hide_latency_tolerance);
> +
> +static int __init dev_pm_qos_init(void)
> +{
> +       /* Teach lockdep about lock ordering wrt. shrinker: */
> +       fs_reclaim_acquire(GFP_KERNEL);
> +       might_lock(&dev_pm_qos_mtx);
> +       fs_reclaim_release(GFP_KERNEL);
> +
> +       return 0;
> +}
> +early_initcall(dev_pm_qos_init);
> --
> 2.39.2
>
