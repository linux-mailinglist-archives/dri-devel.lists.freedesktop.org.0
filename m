Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2871677E19
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 15:32:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBF410E4AF;
	Mon, 23 Jan 2023 14:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53ABB10E4AF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 14:32:07 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-50112511ba7so114888267b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 06:32:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=StVHsElt+i0TY8HfSQz/lNkVKU2NFVmPFjupO0nf7f4=;
 b=jJOiDMJ7/C/uYegerLcUCLYUsSF2JKvqFv2r5oc9iHJqy1KkEIdgR1Swd090qJ9uaA
 EIanc80zVSfki+YLybXJ83iFfB7CEIP+Dt/KWSd4zOgXgUWlW4TyPzkGle61YtLXyGMm
 Ogm9xxEiO8Uy2KM8f+EyelfQaO5aAt6dj21cNJ3PcFhXskjwq+Fk0UnxNDz6e3bRCEEK
 GdhUcGQ2Samx/Kzs/eycCu+eHnqIFivXdb8Qrkh/UuqLY73WYu/fY/ZuErX66zERMYbt
 Y8XMo4mOibSmtwPS36azZgTszu6RJ4xlVKlzeQhAlY2NcF4p4kb0b2oeFqu7xna4QTFX
 XiJA==
X-Gm-Message-State: AFqh2ko99Q4rE3uHtgORkV0tgZ/5NUq/zSW2djyA/16r2SDoBYMz6HZj
 1PQGFawCMnkR4v7hOJk+sg8Bv0TTZ2BgkA==
X-Google-Smtp-Source: AMrXdXsp3NjNuimblkinJOF0+SUyGx1IKmh+YvJKpB2LeKcZLu4GSXxqughAuLe0URQ+2/6oAvAtKw==
X-Received: by 2002:a81:8746:0:b0:4e1:71aa:98a9 with SMTP id
 x67-20020a818746000000b004e171aa98a9mr15945556ywf.47.1674484326003; 
 Mon, 23 Jan 2023 06:32:06 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 j2-20020a05620a000200b00705e0ad29cdsm9569093qki.77.2023.01.23.06.32.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 06:32:05 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 203so14975410yby.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 06:32:05 -0800 (PST)
X-Received: by 2002:a25:9ac1:0:b0:7b4:6a33:d89f with SMTP id
 t1-20020a259ac1000000b007b46a33d89fmr1926934ybo.543.1674484325389; Mon, 23
 Jan 2023 06:32:05 -0800 (PST)
MIME-Version: 1.0
References: <20230120085009.604797-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230120085009.604797-3-tomi.valkeinen+renesas@ideasonboard.com>
 <Y8q+ad8CxC7LBN4l@pendragon.ideasonboard.com>
In-Reply-To: <Y8q+ad8CxC7LBN4l@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Jan 2023 15:31:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHARDyJnSdOrGJ7aRhZ-Y9K9-NYKYq0orJT+R8fvRemw@mail.gmail.com>
Message-ID: <CAMuHMdVHARDyJnSdOrGJ7aRhZ-Y9K9-NYKYq0orJT+R8fvRemw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] drm: rcar-du: lvds: Add runtime PM
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Fri, Jan 20, 2023 at 5:16 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Jan 20, 2023 at 10:50:04AM +0200, Tomi Valkeinen wrote:
> > Add simple runtime PM suspend and resume functionality.
>
> I think you need to depend on PM in Kconfig. That's not a compile-time
> dependency but a runtime-dependency, with runtime PM support the
> suspend/resume handler will never be called.

While technically that is correct, you'll have a hard time getting here
with CONFIG_PM=n, as both ARCH_RCAR_GEN2 and ARCH_RCAR_GEN3
do select PM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
