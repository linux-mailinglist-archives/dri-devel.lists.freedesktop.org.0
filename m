Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943703B983A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 23:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCFC6EB4F;
	Thu,  1 Jul 2021 21:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B36E6EC0C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jul 2021 21:34:49 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id bg14so12779278ejb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jul 2021 14:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MPm2mNfDFAFz6LZYHsop45CBgdHBv6hIIQ/VkHD6NKA=;
 b=HvTjCzluEHCx88k64sQ1uGioAhhF0RaQdU2TKB3xXaeeJ5jaQe1vkBMflOMt0RMTxj
 iUISIublp8cNy2n9ZdkE02AYBeYCS1djQFxZvV2JGCHLdd66U9E93k7aFXQjQqUha4P3
 gRpV2RfUVWOWwQM5VAi6Iu2tuUxgsZtntXjHLJShIQOabUWw5/yhZM1Hznq5fkfwfPTZ
 d4U5x2mx1wgy1/l9DweE/vR+RveLBfEcovXEnJY8gbgzymFvtwmSmPVP3Rez8GQQcZeO
 PrNXkGm5v0mrRayTQyy39K48MnsXAF9RU2041qhATMIe45TwPkFjClaj2ONRwj87cH9L
 cDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MPm2mNfDFAFz6LZYHsop45CBgdHBv6hIIQ/VkHD6NKA=;
 b=WQ5yUjCnz88eZqEG9JynLLzfciWP4muLkO8mWwmxMl6dYuBSJfcrUbqotRw+MSGgLY
 Pse+4oFAnkNX3pY0uIO04UaSkqSjGGO5Al6QwxrgTURgDP0oJrLFTWsr210Tw3VH9Bzg
 O16RFqEg9rrvAL74VZ024Nl9BXhU8rHBiUKdm1qdNNdsZk+h2uL0RbdtKU8cgjUr1Vej
 DF6rc6SgRukzcqFBFIZKp3ezamHavqSY2r5MyINe1Qpmulb7NcgOtKIcSpMa1Fih2BDK
 FY9ctEzAcOWE+rcISAUJtCL57QcmtiRu8pWpxHQgXz5lQmZZUzGe8B2VGyP0xqI19Uo/
 rUTw==
X-Gm-Message-State: AOAM532EanXyCMBASpdIb3c56aysyQYXvqp6tN2ulbbjmr2K3t6sHVZh
 epXx8cSodMmnukGeL6s2bmv7EsblYLiuSDNX+SwXbyLHhww=
X-Google-Smtp-Source: ABdhPJyZ3ThStcILU2DEuZlK8i1r5iDZm7d/h/AfGai6wlTFHJI9KAhQtrkXuxM3Ic6DSOSfkN1YPmywHBMsDeqD97Y=
X-Received: by 2002:a17:906:36d5:: with SMTP id
 b21mr2013027ejc.258.1625175287929; 
 Thu, 01 Jul 2021 14:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210618052800.89007-1-jjcao20@fudan.edu.cn>
In-Reply-To: <20210618052800.89007-1-jjcao20@fudan.edu.cn>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 1 Jul 2021 23:34:37 +0200
Message-ID: <CAFBinCCGpbCNOcbgCZcLa1O8mJd0wgLtt4_sAMvwQW4xOxkuWg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/meson: fix potential NULL pointer exception in
 meson_drv_unbind()
To: Jiajun Cao <jjcao20@fudan.edu.cn>
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>,
 yuanxzhang@fudan.edu.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

first of all: thanks for your patch and sorry for being late with my
review question.

On Fri, Jun 18, 2021 at 7:28 AM Jiajun Cao <jjcao20@fudan.edu.cn> wrote:
>
> Fix a potential NULL pointer exception when meson_drv_unbind()
> attempts to operate on the driver_data priv which may be NULL.
> Add a null pointer check on the priv struct to avoid the NULL
> pointer dereference after calling dev_get_drvdata(), just like
> the null pointer checks done on the struct priv in the function
> meson_drv_shutdown(), meson_drv_pm_suspend() and meson_drv_pm_resume().
I am trying to review Amlogic Meson related patches in the DRM
subsystem so I can help Neil with this.
However, I am still new to this so please help me educate on this topic.

[...]
>  static void meson_drv_unbind(struct device *dev)
>  {
>         struct meson_drm *priv = dev_get_drvdata(dev);
> -       struct drm_device *drm = priv->drm;
> +       struct drm_device *drm;
> +
> +       if (!priv)
> +               return;
My understanding of the component framework is that meson_drv_unbind()
is only called if previously meson_drv_bind() was called (and did not
return any error).
This is different from meson_drv_shutdown() (for example) because that
can be called if meson_drv_probe() returns 0 (success) in case the
"count" variable was 0 (then the probe function does nothing).

As I mentioned before: I am still learning about the DRM subsystem in
the Linux kernel.
So it would be great if you could help me understand for which
scenarios this newly added if-condition is needed.


Thank you!
Best regards,
Martin
