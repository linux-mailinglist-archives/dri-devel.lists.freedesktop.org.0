Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE763E7CDA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 17:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6411A89056;
	Tue, 10 Aug 2021 15:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF7589056
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 15:52:09 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id 67so8772707uaq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 08:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=14LcusME7ZZfpCeACy1bKOoqz1QHnlL2Rh15LgCjnUM=;
 b=MFakciBTGG/pR790SxtK1JFvvC8TfByEeFHXu65LrqGT6PgNFPq+qyoNL17kYRnRuN
 NJXBMHCMcvM/cATSSe9xVCdMfy9v/BqK862K8e0I47miTB+4njkZgOC+sq0IjVD5jqIP
 HsD2i1snoIrKSmL7ILftxNM61k9bprv0aQA2wwL3xjRoI0eiULMZqRjXcEfcDRs96m4p
 rhPB50Xh+kzXZmUK2exRNciLYxX9BxKNz2Nmss/tUUKhIOtQ1qoGPJf4tAlrmWOHvYPm
 xgwBS9Av6lTWqkJhwvz6DX9VKfXuqPkkCLnQVZx2UqOl4BdusbrSxrEEIM4MIlMdvWlF
 vOjA==
X-Gm-Message-State: AOAM532b0i4SzS8D3pUKSiG2vJNx11iGAc8Ri3oUirkq2SRJo8Y4SSHS
 2f13iUuo9eUHIMP38gks9ySm2Hxf32ofy9+ss1c=
X-Google-Smtp-Source: ABdhPJzMiPuuaYmNZzOEPR3m6Kf8XRk4wl132UekAFkhbG+LrgoQfXmV1JRJFkoaLWJGjv5ooMmspv0RafumgJ3SaH4=
X-Received: by 2002:a9f:2341:: with SMTP id 59mr21031577uae.4.1628610728962;
 Tue, 10 Aug 2021 08:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210520065046.28978-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210520065046.28978-3-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWdbS2tFh9LP8hqUT-3nRqKf_k_8N3ZeiUSiBEgYhjDxQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWdbS2tFh9LP8hqUT-3nRqKf_k_8N3ZeiUSiBEgYhjDxQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Aug 2021 17:51:57 +0200
Message-ID: <CAMuHMdVd75h7qCxqfQ4MCoUwEiTJktTYykZgnWy7zFgxuHXmAg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm: rcar-du: lvds: Convert to DRM panel bridge
 helper
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Tue, Aug 10, 2021 at 5:47 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, May 20, 2021 at 8:51 AM Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > Replace the manual panel handling with usage of the DRM panel bridge
> > helper. This simplifies the driver, and brings support for
> > DRM_BRIDGE_ATTACH_NO_CONNECTOR as an added bonus.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Thanks for your patch, which is now commit e9e056949c927e5b ("drm:
> rcar-du: lvds: Convert to DRM panel bridge helper") in drm-next.
>
> This causes the following scary messages in the kernel log on Ebisu-4D:
>
> [drm:drm_bridge_attach] *ERROR* failed to attach bridge

> Reverting this commit fixes the issue.

Oops, that's not true (should not write tentative messages while booting
a test kernel, and press send without checking first ;-)

Reverting the commit doesn't seem to make a difference.
But the parent 5bcc48395b9f35da ("drm: bridge: dw-hdmi: Attach to
next bridge if available") of the bad commit is fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
