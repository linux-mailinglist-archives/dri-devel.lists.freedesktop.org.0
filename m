Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6348058EB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 16:39:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7875310E56B;
	Tue,  5 Dec 2023 15:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA4910E56B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 15:39:16 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-da077db5145so3530625276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 07:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1701790755; x=1702395555;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dSRudhrkUva4fqMShfFkXTOV2VXsRdToC6I5p0S8ZG8=;
 b=Eknb9ErnQlLf+KS0Frsj9zPRAF8Ag5jWvGf3gEpltJLjQ8t/wYjzwlauP/nack5eDY
 r5vd9ZzyvMMlhxiZaPKlMoZFXeAZE25zAx4QPh8myJ6dVIAd9rZe33qh7f7S6y2dfUPA
 K26xPNwFEZdhvakTYU7Onlpmj02O12jZ9LIzvXXcBeH9qw5nqfLuDcnAeiZU6RjSplv+
 JfPbwfMqM9NJEzykcqgD9T0IFveuCdmyMUFMeyT0bEF53Z4OMzgyD6XEQMpRQu3y1XM/
 ulpqiCEeyYei+kJ2Bo34Kb51teC/iGPfwKkvC71nyjzq7KaofvWuPohLXsLdb7ukL0i9
 DxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701790755; x=1702395555;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dSRudhrkUva4fqMShfFkXTOV2VXsRdToC6I5p0S8ZG8=;
 b=gnkJKt36o3FhJuYl969A5JTrjm/ZO3UcB7AFshOA/49lBCi2XrI1kl5xVLZVYbUEwv
 akaPRpr/eV+ZtNpdEbEGRcITKQJBONeEd9ThbjiPF4n3RJfXnYBbB6xf+K1lRYCLZIqQ
 mkJ1ICJowm160R5OUKtpL0bouNtqTKxusn2TJT1HD6vlH9luJCiud/GuUQTp987zoeOW
 Hs3MW0JHGAS6036DdhhPAYZH3+Wz0shNZAJnjtUC8VC7RJWKURIP0pbP/8yieGcLZhfh
 p5sU3FAjGJG4AKpaueryOgXAn/eLovswrorKucKrMJBq/AW+lAyk7RtVCmcU/sMS29fd
 /8XA==
X-Gm-Message-State: AOJu0YyVTFUsHybiIFcmna52H5Ss7kJ/prpyCQZJq2N3DekKWACx04vz
 QTNvA58sElPXMaHIDKhTfyTbPSbznp8raCkz2DPwjw==
X-Google-Smtp-Source: AGHT+IFiDeprUJe0T1fJ+u/ddjNYBP85Sz/UOzEBgtnKv9hrfEf9+nKOd0wRhl2w0WqTgvMcfHhZPkmVHDzQbK0w4KY=
X-Received: by 2002:a25:f811:0:b0:db7:dad0:76e1 with SMTP id
 u17-20020a25f811000000b00db7dad076e1mr3567546ybd.125.1701790755220; Tue, 05
 Dec 2023 07:39:15 -0800 (PST)
MIME-Version: 1.0
References: <20231205105341.4100896-1-dario.binacchi@amarulasolutions.com>
 <20231205105341.4100896-3-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20231205105341.4100896-3-dario.binacchi@amarulasolutions.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 5 Dec 2023 15:39:00 +0000
Message-ID: <CAPY8ntAALKiTEG6qyFO=qVqSLUW9x8AMfPMc_TUwC3z8tJ7Kzw@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] drm/bridge: Fix a use case in the bridge disable
 logic
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, michael@amarulasolutions.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dario

On Tue, 5 Dec 2023 at 10:54, Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> The patch fixes the code for finding the next bridge with the
> "pre_enable_prev_first" flag set to false. In case this condition is
> not verified, i. e. there is no subsequent bridge with the flag set to
> false, the whole bridge list is traversed, invalidating the "next"
> variable.
>
> The use of a new iteration variable (i. e. "iter") ensures that the value
> of the "next" variable is not invalidated.

We already have https://patchwork.freedesktop.org/patch/529288/ that
has been reviewed (but not applied) to resolve this. What does this
version do differently and why?

  Dave

> Fixes: 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter bridge init order")
> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/drm_bridge.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index f66bf4925dd8..2e5781bf192e 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -662,7 +662,7 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
>                                           struct drm_atomic_state *old_state)
>  {
>         struct drm_encoder *encoder;
> -       struct drm_bridge *next, *limit;
> +       struct drm_bridge *iter, *next, *limit;
>
>         if (!bridge)
>                 return;
> @@ -680,14 +680,15 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
>                                  * was enabled first, so disabled last
>                                  */
>                                 limit = next;
> +                               iter = next;
>
>                                 /* Find the next bridge that has NOT requested
>                                  * prev to be enabled first / disabled last
>                                  */
> -                               list_for_each_entry_from(next, &encoder->bridge_chain,
> +                               list_for_each_entry_from(iter, &encoder->bridge_chain,
>                                                          chain_node) {
> -                                       if (!next->pre_enable_prev_first) {
> -                                               next = list_prev_entry(next, chain_node);
> +                                       if (!iter->pre_enable_prev_first) {
> +                                               next = list_prev_entry(iter, chain_node);
>                                                 limit = next;
>                                                 break;
>                                         }
> --
> 2.43.0
>
