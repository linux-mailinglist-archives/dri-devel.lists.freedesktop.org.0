Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B9F7A9AB6
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 20:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAFD10E476;
	Thu, 21 Sep 2023 18:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3621110E476
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 18:47:43 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-53136a13cd4so1539866a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 11:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695322060; x=1695926860;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZE8jn6HHsFTTLGSwFTvjr4C1qpDw4tvtE+zZqrkJga0=;
 b=DIsAFQtwE+SfZlN1wMi5eJ6b6wqL0S+e7Lo//j64eqWGLG8tGq0Zt7/4yYMji+ur+W
 5jQmUEJJlJ8y5rnQkhL00uHspKHuqR72b6blhgeHQgXZHRoH3YC38T8gXKpRBQD3WJG4
 RkhtO+ka+oXNqWm/ieYS8GZ7ixQJJvyA5S+Ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695322060; x=1695926860;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZE8jn6HHsFTTLGSwFTvjr4C1qpDw4tvtE+zZqrkJga0=;
 b=rutnc7dnkH4+bnn/o4q0a0QivLIvm8hm7CCd3Kg67d3O7B1pTy10kZJk02Z5EdVorR
 y9MdIRx6cShxEBM2lfJOlOp3BoejysFQzLcPqrWWTwNr/7U757o98/88PSa+M4cFbw9Q
 ykiSV1ZA94DEQhiUPXy3SyikPFmjQumEfBwrwjVU5B+FQk04UOgFHJx9Z32Jsg/4bEtN
 qsR7xHW17KSqqXETn39U603kkhPXXG90LqjJBVfjAlXdB4uCJmKkGGh8R7WMqrb7jXYv
 4mw55Liid5gwnl39PR2vlynkzfn5+6IgwLfy5HXC0BHeDu2qPDCShCZmVSgG3PxSH+xe
 zo8w==
X-Gm-Message-State: AOJu0YxUhFe7tdQvG3hwlcguQdCjntvPzxY9Zhf99B0igKX6X0YAR6m9
 8tVwZcfgHiaZ8dKsRd9ofbqG4Z0puTtcwMC1x1/7Mtiz
X-Google-Smtp-Source: AGHT+IFdlR57LjCnUNpFZVLiM2lOyjj5RJD3ITam101RrkIhLEkayfcLG3sPrGBt858BhKjWIMCUtA==
X-Received: by 2002:aa7:c786:0:b0:52f:a162:f4c4 with SMTP id
 n6-20020aa7c786000000b0052fa162f4c4mr5554150eds.18.1695322060405; 
 Thu, 21 Sep 2023 11:47:40 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 dy6-20020a05640231e600b0052718577668sm1185099edb.11.2023.09.21.11.47.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 11:47:39 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4053a7b36b0so17035e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 11:47:39 -0700 (PDT)
X-Received: by 2002:a05:600c:3caa:b0:3f7:3e85:36a with SMTP id
 bg42-20020a05600c3caa00b003f73e85036amr104085wmb.7.1695322058640; Thu, 21 Sep
 2023 11:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234015.566018-1-dianders@chromium.org>
 <20230901163944.RFT.4.I4752a39ad9f8fd08b32c2b78a8a3e40491bfb5eb@changeid>
In-Reply-To: <20230901163944.RFT.4.I4752a39ad9f8fd08b32c2b78a8a3e40491bfb5eb@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Sep 2023 11:47:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XrhPxrYRP4A4vcKyq+euhfyWq3rzs2egXB51fdFNSLZQ@mail.gmail.com>
Message-ID: <CAD=FV=XrhPxrYRP4A4vcKyq+euhfyWq3rzs2egXB51fdFNSLZQ@mail.gmail.com>
Subject: Re: [RFT PATCH 4/6] drm/ssd130x: Call drm_atomic_helper_shutdown() at
 remove time
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
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
Cc: javierm@redhat.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Sep 1, 2023 at 4:40=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> Based on grepping through the source code, this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at remove time. Let's
> add it.
>
> The fact that we should call drm_atomic_helper_shutdown() in the case
> of OS driver remove comes straight out of the kernel doc "driver
> instance overview" in drm_drv.c.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This commit is only compile-time tested.
>
> NOTE: I'm not 100% sure this is the correct thing to do, but I _think_
> so. Please shout if you know better.
>
>  drivers/gpu/drm/solomon/ssd130x.c | 1 +
>  1 file changed, 1 insertion(+)

Landed this to drm-misc-next. Since I wasn't 100% sure, if someone
finds that this is bad after-the-fact, we can certainly revert.

10c8204c8b17 drm/ssd130x: Call drm_atomic_helper_shutdown() at remove time
