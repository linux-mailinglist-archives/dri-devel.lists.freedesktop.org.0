Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 690F539B921
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 14:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B086A6E3DA;
	Fri,  4 Jun 2021 12:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBEB6E3DA
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 12:38:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB42C6141A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 12:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622810303;
 bh=Em96/u7mdtZXTQJe4ybQ2hBcfP5hVycbrPqpSQCpAN8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=m1AyZc6WME3Q3MW8C/l1auFla7T4C+Pz6mM62jtjMWzwB+Wc3orf7uwQOOCtNWffj
 EGyAShY0oY9Ft9gohkSJfcZAOgAKxpgbzfcmuvsfcNhlU84gOnjJr4M4/8k0Jfodxc
 8D49831/HjbL2fl01cziS9MwTtmKZMp1eHNrYu7E9CBp5hLVcEkfZFMJ/SBW9b9uUa
 hWOc4EwDYxC4dknle77qJBLfLB1J9qY5dJJkUhCTWtgld3RmUGOwq4dub/vTIpkEWL
 BbbbjL4WpN3V6lk4YEVtHrM3Ph8Vq/PMLK23aYW4H3e/5GOsCaCvXaeJxzNvdchCQj
 7ucUA6yvYlULQ==
Received: by mail-ed1-f47.google.com with SMTP id w21so10863688edv.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 05:38:23 -0700 (PDT)
X-Gm-Message-State: AOAM530/8xItaEoRlNfQCWykN+yzlzFCCugEAhO3rQWbl0OdXB595M41
 uN5TsJLqqK/RqjjIDJczAN+f6637EaP5RxTugw==
X-Google-Smtp-Source: ABdhPJwHF1vFPz5c5WbQjZ5qaLJn1k8D8U9yi9o5lqrdzTiJ+OWwf5P12sT5T1JLhU0YteYfeDq9VI3GWW6A8GjMQ+c=
X-Received: by 2002:aa7:cad3:: with SMTP id l19mr4519290edt.289.1622810302334; 
 Fri, 04 Jun 2021 05:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210604014055.4060521-1-keescook@chromium.org>
In-Reply-To: <20210604014055.4060521-1-keescook@chromium.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 4 Jun 2021 07:38:10 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK-G76vqWqfYarj4r5u_QW0dRd8UMuwprVKNmzVjY81=A@mail.gmail.com>
Message-ID: <CAL_JsqK-G76vqWqfYarj4r5u_QW0dRd8UMuwprVKNmzVjY81=A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/pl111: Actually fix CONFIG_VEXPRESS_CONFIG depends
To: Kees Cook <keescook@chromium.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 3, 2021 at 8:40 PM Kees Cook <keescook@chromium.org> wrote:
>
> VEXPRESS_CONFIG needs to either be missing, built-in, or modular when
> pl111 is modular. Update the Kconfig to reflect the need.
>
> Fixes: 4dc7c97d04dc ("drm/pl111: depend on CONFIG_VEXPRESS_CONFIG")
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> v2: use expected Kconfig style to express this. :)
> v1: https://lore.kernel.org/lkml/20210603215819.3904733-1-keescook@chromium.org
> ---
>  drivers/gpu/drm/pl111/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
