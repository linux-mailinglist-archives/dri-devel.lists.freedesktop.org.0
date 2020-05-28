Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E29AC1E6DC1
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 23:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E246E7EC;
	Thu, 28 May 2020 21:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60B16E7EC
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 21:36:26 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C3252072D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 21:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590701786;
 bh=OoAF5fvIG1WmbRJ5iRaCNNCS+LjmEmUP4Qo1q5Oyk6w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=o0GkkhtZ8QpR/veUWBqt5ZlBS+ugjq2lZ0GKrbLqf8SuC0kD+4knERlmDIvrNmlzS
 ovqeRKJQpwt8qwLC+bPU2uIif/Lq7b7Aikh2uChFNCyX9AtdPOuk5U9gHff/MKIRPM
 5KjaB6PU6oyL18I+x0F4c3elfO4OYJfupqLt/6lk=
Received: by mail-oi1-f174.google.com with SMTP id x202so149370oix.11
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 14:36:26 -0700 (PDT)
X-Gm-Message-State: AOAM533nx9nS0jcWmEEYMK5yXrV7PN/TA8XMBHbrVDcQUP8IXujqtQEv
 mrPfZzSRkWO3PyKzP0jYS62+hgL4394BALsVWg==
X-Google-Smtp-Source: ABdhPJwDx2guAg9SflWlLoutWBpSTVGcHdHMRb+K71BTWTeXSll0xvCgAOVKBI8yLMvnVyvEEHdb0V2Q6bV/XPl81rA=
X-Received: by 2002:aca:f084:: with SMTP id o126mr3777839oih.106.1590701785888; 
 Thu, 28 May 2020 14:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200527133158.462057-1-arnd@arndb.de>
In-Reply-To: <20200527133158.462057-1-arnd@arndb.de>
From: Rob Herring <robh@kernel.org>
Date: Thu, 28 May 2020 15:36:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLntJKYTNXrmjZqxnzc70hK3=b2=5Cw2X6-Z8WrF=68KA@mail.gmail.com>
Message-ID: <CAL_JsqLntJKYTNXrmjZqxnzc70hK3=b2=5Cw2X6-Z8WrF=68KA@mail.gmail.com>
Subject: Re: [PATCH] drm: pl111: add CONFIG_VEXPRESS_CONFIG dependency
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 7:32 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> The vexpress_config code fails to link in some configurations:
>
> drivers/gpu/drm/pl111/pl111_versatile.o: in function `pl111_versatile_init':
> (.text+0x1f0): undefined reference to `devm_regmap_init_vexpress_config'
>
> Add a dependency that links to this only if the dependency is there,
> and prevent the configuration where the drm driver is built-in but
> the config is a loadable module.
>
> Fixes: 826fc86b5903 ("drm: pl111: Move VExpress setup into versatile init")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/pl111/Kconfig           | 1 +
>  drivers/gpu/drm/pl111/pl111_versatile.c | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
> index 80f6748055e3..33a005816fdd 100644
> --- a/drivers/gpu/drm/pl111/Kconfig
> +++ b/drivers/gpu/drm/pl111/Kconfig
> @@ -3,6 +3,7 @@ config DRM_PL111
>         tristate "DRM Support for PL111 CLCD Controller"
>         depends on DRM
>         depends on ARM || ARM64 || COMPILE_TEST
> +       depends on VEXPRESS_CONFIG || !VEXPRESS_CONFIG

That's really non-obvious. Sometimes I hate kconfig. Thanks for fixing my mess.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
