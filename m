Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2344443287
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE9B7317B;
	Tue,  2 Nov 2021 16:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A207317B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 16:16:17 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id b71so4586662wmd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 09:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dk7gtJZIf8x3vKhtXKZKHOEj4aweMrUNlA9C44Zf6nU=;
 b=cqWMTY5MJJwXi/lOFXC3vCIcbszW5fflGtz43DsvZLPKsdSxiqApa0wwvoK2yKSz/F
 DPRrWb9YZesKfdQf2/Oyp85SNhzZ69Zi5I+LTrFuVolojhuwmLKazUyFbavizDyrt0TL
 rlMXQgBiu1uHFBnyyuD9IKomgFj0gJvT0NuSf8pSJW4ZYPDW/0l4freXzseSVgiWVIEg
 riqGJ7kWwyy/ZRo1S56rfZ8fulGudesmBjcoamz204qznCs1TVnezaagmlqO1oPJ1XaT
 1ggUgUSkHgGxfyyvGuSxLu7z/HsNXlh8KLhbP3d9qKCI9pAYdXS3X419gt/dkAoINcvB
 D5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dk7gtJZIf8x3vKhtXKZKHOEj4aweMrUNlA9C44Zf6nU=;
 b=ocU692RsZjzcIDxmMJQfB3DA6pF2JkrJFH13z1IYGNvJVUKwUf4o+y+CS3jn1Y6jRD
 X10v1uadN2BbLwAZt2pnMehej4Q2l4zQKA4j0LPgEISh892ByqslNroi3P1yQQYguKOz
 fF325TMYMh5VdZmzWaPsCbfHUWTp2uEm9E6VTr89893jjoOlpYvpydIJwgmq9gj3lpJK
 +m5Mw7CNmfKsCKvUeTg1tpUffP0wAOOjQ2bZ320/YdYjL1Ef6Q+G/KfuvxN//LudC5sj
 MyvsTGZybc2g5kOdfttcWiwfmxhvuY4QltPOls8MBBKTxi/yAFpdJfSkBgXUEzf427uy
 qMPg==
X-Gm-Message-State: AOAM532JA4ec891NP2RgdyQmc2lLSt0J5FPFHsZNBxhcf2/bHomv4bty
 Enc+3WxqdgwAT1Rqzg9WqtBPNuaC8S5yg6xFNyAuAg==
X-Google-Smtp-Source: ABdhPJzlVpPbIvRPDvaNvaOkdQtTw92mc0xd1dJ21JwMbqrtyuKlYZ2WkPFRAg5+D39I+fM8WCaZOjbjxyvoYzoHEWU=
X-Received: by 2002:a1c:2507:: with SMTP id l7mr8374133wml.144.1635869775698; 
 Tue, 02 Nov 2021 09:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211025152903.1088803-1-maxime@cerno.tech>
 <20211025152903.1088803-3-maxime@cerno.tech>
In-Reply-To: <20211025152903.1088803-3-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 2 Nov 2021 16:15:59 +0000
Message-ID: <CAPY8ntCu=wzXtNeDrnYNC8NH8WwjUY-qC=UsgqS_VQO1voR8SA@mail.gmail.com>
Subject: Re: [PATCH v8 02/10] drm/vc4: hdmi: Fix HPD GPIO detection
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Tim Gover <tim.gover@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Oct 2021 at 16:29, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Prior to commit 6800234ceee0 ("drm/vc4: hdmi: Convert to gpiod"), in the
> detect hook, if we had an HPD GPIO we would only rely on it and return
> whatever state it was in.
>
> However, that commit changed that by mistake to only consider the case
> where we have a GPIO and it returns a logical high, and would fall back
> to the other methods otherwise.
>
> Since we can read the EDIDs when the HPD signal is low on some displays,
> we changed the detection status from disconnected to connected, and we
> would ignore an HPD pulse.
>
> Fixes: 6800234ceee0 ("drm/vc4: hdmi: Convert to gpiod")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 338968275724..dde67b991ae7 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -190,9 +190,9 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
>
>         WARN_ON(pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev));
>
> -       if (vc4_hdmi->hpd_gpio &&
> -           gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio)) {
> -               connected = true;
> +       if (vc4_hdmi->hpd_gpio) {
> +               if (gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio))
> +                       connected = true;
>         } else {
>                 unsigned long flags;
>                 u32 hotplug;
> --
> 2.31.1
>
