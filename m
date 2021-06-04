Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D6A39C2C9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 23:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E0E6F530;
	Fri,  4 Jun 2021 21:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910856F530
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 21:44:52 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id a4so13342353ljq.9
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 14:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GjsAN50ddWQm0VC6qlRfoB/dT6P+8ZqVwoy/BYE0lSw=;
 b=ZHc08C+7Ibj69IVBB82goPegus+bAv9YuQoOVi9q9e+hDWENTWGrYTASzVNJNr28ii
 Y7E/XifFGi5YsoiMtuln3nFJzi2+VJCSGQifDJJetuD0tsRwjsUij7KR3i4O/1s7/3zi
 NClVAgpjP25K3UUqeUWYveb0ihfXIfOH8FXpzYyYITm9evxiETFUQQyyz1+dWm+nDBF9
 UGnPUZMzC41fMqye9lXdyLOk94SDBWRCYO2+bTTfW/RSjLuVtL3W3yZXtW3bi4ayGkTn
 oATemphAWOJ1r8/n4NB/XtZY3Udzt9Me9nva7gNm8ZzkEcvIV122BSG5Zrs89Wj4tWxA
 hrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GjsAN50ddWQm0VC6qlRfoB/dT6P+8ZqVwoy/BYE0lSw=;
 b=byb/QPYRcC1s/j14MyvAPtwpW3VXgoeXahES/EeSK6R4cvVoQA/RTydI9OZcavAUzl
 2O7nbOV8aSE+e73mKfKJlwubarrEbgPz6jkDhqIHEIxDFR34b7XO7I9Zu7ElSchPvGqW
 15Oe5DfXyKYdwXrskAY6G0mGPbwrGoOQcOVzj4nsiy5NmRDtoYy7LFY40kXwPF53/AK2
 Z6sCsnrODG0ZWYPrv1PiXeSMZQEzf2RFb5RBbQNQktmF3hD4zINBfOxO+G4ytaA4ZaRe
 XqRHSUPRu6Ngre2xf+ZBMtziyAclLuso0BYPCwuNln1DX+fvDP7aMXrK3dn62CQ5XK8X
 uxzA==
X-Gm-Message-State: AOAM5339uQuq5kZaczd+ijEvGLijWEHt9xKze/lffTE7Dnz8HAXQnAsq
 /muK9qJOVeJNWQ1bff0h+7M64Azvv6iyL/bewlGt7Q==
X-Google-Smtp-Source: ABdhPJyTRsaaVHVr9ofHVNMandAQLLoQSDxGJmUjBgJVRYEe9VRABdJWRzIKKzECxAYGWrgvTi3XmPiP37aKMIkjmIU=
X-Received: by 2002:a2e:889a:: with SMTP id k26mr4923550lji.438.1622843090808; 
 Fri, 04 Jun 2021 14:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210524131852.263883-1-maxime@cerno.tech>
In-Reply-To: <20210524131852.263883-1-maxime@cerno.tech>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jun 2021 23:44:39 +0200
Message-ID: <CACRpkdbpfJ6Kc-W3jQNKZqwqy+utSV02NC26KEEA14eXtk9vMw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/vc4: hdmi: Fix error path of hpd-gpios
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Hans Verkuil <hans.verkuil@cisco.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 24, 2021 at 3:19 PM Maxime Ripard <maxime@cerno.tech> wrote:

> If the of_get_named_gpio_flags call fails in vc4_hdmi_bind, we jump to
> the err_unprepare_hsm label. That label will then call
> pm_runtime_disable and put_device on the DDC device.
>
> We just retrieved the DDC device, so the latter is definitely justified.
> However at that point we still haven't called pm_runtime_enable, so the
> call to pm_runtime_disable is not supposed to be there.
>
> Fixes: 10ee275cb12f ("drm/vc4: prepare for CEC support")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
