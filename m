Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B15E6508245
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 09:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0149010F0EF;
	Wed, 20 Apr 2022 07:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B72E10F0EF
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 07:34:42 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id h1so1159850pfv.12
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 00:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5YMhwvtptGsfF/ACTCQLRNBHCJudINRjpOhyhzT+fTo=;
 b=h79/pYV5ePZ+xnqW6Sc4hnVwjvpuaaHnJUn7204uDLI1W/CHJ9/0h29qAGV22oYq3H
 fJ6m2Co6FHGzLh21Zb30bV5wKZSuAEiS996QnHnAOUoyFCR16H+pgqS2TKIsFYAzHFgr
 SI2eikJOrn8ikjE+HvQQYs1ZgyOE6QuRVRDA6fHrqQSqUSk7miqenESiTaDXK2B8pAE8
 D4kCsgWdjSy7xuyXdvvc9Qos8jUcjwtTKlnbz4j3bv8RFqtrb5ldjWD3FBn0chp9gVN0
 vNoIqFMgcblZC3/HJSwFLIIrsLRcBq3RofB1RVh2dISKvedVQf8v380kaEoijfwom1eU
 EtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5YMhwvtptGsfF/ACTCQLRNBHCJudINRjpOhyhzT+fTo=;
 b=iaCl9vW7Ou2DVBSTinElGk8pEcwc9iaxNuwKvRJ/EmfNyDyevxv+gbVF+TKG5FGRht
 VB31vs+T9A2hvEV9G9bszGLBbIU7e2UpElw3QHi2HyhKz+RRHYMV1iebR06cZ5qRfV+v
 zG2inowIZgf3pfy0bWb7ACHUc7xYP6FMsvtjbO6lyuu3moC/5pvsknAle0BC6YZiIJ2s
 iKmJI6rSpK8uF4MUA5uwKR87erkc7hpPZhuvZvv4fq1wX0Xn+keEGnG7eFXGCCdEFiU9
 aWiLFzcRQgoD+eFjouVD9EIbPtjSwyMUJYo7JxdMef0x8VbY8r9KPpfiBXXr5Hb6BDll
 s61g==
X-Gm-Message-State: AOAM532WTWQDpiWOabtT+wDLW0yGJ6WDipGeC4V5OAkKbK03/tC0JFvc
 M6XG0Ga6n2FkEXYCcvdxpjspdmsQHdRJibUHJ55Y08Uz
X-Google-Smtp-Source: ABdhPJyA1889PgEB0GdrkHoqQfa0/GzzWjfxH6q0aUYd097vaaQyRbwbFpYaNFr1BC0UeO6JSQEntnzim0g4Ikhsh14=
X-Received: by 2002:a63:c155:0:b0:3aa:1ecf:9a59 with SMTP id
 p21-20020a63c155000000b003aa1ecf9a59mr8888222pgi.90.1650440081670; Wed, 20
 Apr 2022 00:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220413051105.5612-1-xiam0nd.tong@gmail.com>
In-Reply-To: <20220413051105.5612-1-xiam0nd.tong@gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 20 Apr 2022 09:34:30 +0200
Message-ID: <CAMeQTsbV1ZcUf=ZRdzufxanRj5NJAor+SReA2Fnqk4kj13c94g@mail.gmail.com>
Subject: Re: [PATCH v3] drm/gma500: fix a potential repeat execution in
 psb_driver_load
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 7:11 AM Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
>
> Instead of exiting the loop as expected when an entry is found, the
> list_for_each_entry() continues until the traversal is complete. To
> avoid potential executing 'ret = gma_backlight_init(dev);' repeatly,
> goto outside the loop when found entry by replacing switch/case with
> if statement.
>
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>

Thanks for the patch. I've applied it to drm-misc-next.

I fixed up an indentation issue on the second line.

Cheers
Patrik

> ---
> changes since v2:
>  - replace switch with if statement (Patrik Jakobsson)
>
> changes since v1:
>  - goto outside the loop (Xiaomeng Tong)
>
> v2: https://lore.kernel.org/dri-devel/20220406113143.10699-1-xiam0nd.tong@gmail.com/
> v1: https://lore.kernel.org/lkml/20220401115811.9656-1-xiam0nd.tong@gmail.com/
> ---
>  drivers/gpu/drm/gma500/psb_drv.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> index 2aff54d505e2..85211ec16e52 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.c
> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> @@ -396,9 +396,8 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
>         drm_for_each_connector_iter(connector, &conn_iter) {
>                 gma_encoder = gma_attached_encoder(connector);
>
> -               switch (gma_encoder->type) {
> -               case INTEL_OUTPUT_LVDS:
> -               case INTEL_OUTPUT_MIPI:
> +               if (gma_encoder->type == INTEL_OUTPUT_LVDS ||
> +                       gma_encoder->type == INTEL_OUTPUT_MIPI) {
>                         ret = gma_backlight_init(dev);
>                         break;
>                 }
> --
> 2.17.1
>
