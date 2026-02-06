Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4POCEn8OhmkRJQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 16:53:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 911AFFFE88
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 16:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B7E10E094;
	Fri,  6 Feb 2026 15:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JYMAeOK2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A268010E812
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 15:53:30 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id
 2adb3069b0e04-59dd4bec4ecso2876429e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 07:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1770393208; x=1770998008;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=etMVOc7KD+4rAqRuGUMOzPeLpua4ifj9Amz+IzMXTTE=;
 b=JYMAeOK2f7/LZXsDIKkLswZEvGPdjOMrMKzAaunthkVKELVRE9Tr3Q6UH/rAEb1wMr
 5vas5dc3NpgVybIevpwjUKc5WoLKLwSNmm3cYTXn0KLPYIzfzmh0mWIMf/dM87fgfYdE
 tO1ezSsSU6QhNT/gvxoMKKJuggqWomD6aML4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770393208; x=1770998008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=etMVOc7KD+4rAqRuGUMOzPeLpua4ifj9Amz+IzMXTTE=;
 b=cJrZPkKK8Ww042S9e6AWoJV+xxBE/NGKQ8pJn1huckeQXlTw3AQxS5WaGrngi4tQ3m
 hQxMkK7QW0dBa6Aw2M1uUEXPjjCQ5TSTe6ohsZLDDShNixdbMaOqW9C55EXJMfLmHE9a
 LvxHazmLvs+kelQ3BRCbgUjtsOhbUBbWKWehmxQaj2i75GOQwhH/T41cQ6KYACuye3jr
 eM4Q+dfU0FpEjh5gIyYM1r2bQhTgazsK6/4Jof4zNrVZHt7L7YDomHTtW8AqLYYb6bzD
 eX6nch6koiTXA3Cwgjzgf9BsboN79R1A4yYiyRz0t8VX1ciFapU6FlWpN3Fh2NqE1cnW
 TFVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/xISyaaBPuXthexwClUHd6Y+FfBxEYwXj/IiDuuZZNsETsFJV0RrZNjZKkngdW7/d8veHJYZA/80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxI1gnigxPoQAhL5tJDLipQrXlhzBuK87p/yvUTxEBR7hqTHZer
 KIeo8y9GEiM4ZY/r4T68+cUI+DNmZMQYPeOEtYp1SzPwXR4ZJs+C9PZMWL3I2FvEbXPxALMN4eS
 bdji+r4cX
X-Gm-Gg: AZuq6aK/zIzTkXZLh9+YbCwJEodrG7F88ErISsv5hHnkc2nVM2P0+egera1sHNUt6Oj
 bgFLJ0StoSwwOc2rZCkzUirmMZtHWdtizXctA/dDFhrMrkcXTakoUJG8O6Yv4XqYxEGaz0OO8y+
 KizhptdaVU8tU+dA4Jg5fj2io1br8ZPj02crY6DRY6I+NhyFOrIEArrJWEwBTdadBWJKRsGqRSU
 4O0fvfJ2KxsJkgDvMl+5vRXMjlkxMZLKWwKmxZCZmIiQRFo3RwvBO9RQPtbmyptiMbiOt/QMTot
 RVfPeHq12pNcSmgYP8GMXk7bo1dwgzmDdW74MNXG/R7GjI+Z8fWWF4zddL0l37xC2ENRB4ev8GU
 a3iYIR+nSsdUouc5TNEM/jQ0fSHmWG0fKYBCrgPrNJpv9kzuJrWNoKQqWanVL9UK1b9lPDAm8Jh
 3tGlaB568Kk1F+2ygYA7xb2zxh7nXAeuDYb/aJrgXGL7s20WrmmJO2lw==
X-Received: by 2002:a05:6512:1052:b0:59d:e306:c621 with SMTP id
 2adb3069b0e04-59e45167e1fmr1206234e87.48.1770393208297; 
 Fri, 06 Feb 2026 07:53:28 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-386b623639csm6513491fa.8.2026.02.06.07.53.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Feb 2026 07:53:28 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-382fb535b73so21171611fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 07:53:28 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU2T8ISXppkLtFn3NJl1/LZ9BahMxsVNy6A2MHCrBVC0QsJn8GKMgvGa04mopXBFZTx0UgL31hYRqE=@lists.freedesktop.org
X-Received: by 2002:a05:6000:200d:b0:430:fa58:a03d with SMTP id
 ffacd0b85a97d-436293ae118mr4862176f8f.63.1770392781791; Fri, 06 Feb 2026
 07:46:21 -0800 (PST)
MIME-Version: 1.0
References: <20260206123758.374555-1-fra.schnyder@gmail.com>
In-Reply-To: <20260206123758.374555-1-fra.schnyder@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Feb 2026 07:46:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UO3wHqGKep67pY04PgBJKgvOgDf8u1qxeXmWkgVMLXiQ@mail.gmail.com>
X-Gm-Features: AZwV_Qhcv-IxPe6r_qqtTYtGlVNepLgatAVvPPQTa8PlDibDivxEWQ2rEGCs3tI
Message-ID: <CAD=FV=UO3wHqGKep67pY04PgBJKgvOgDf8u1qxeXmWkgVMLXiQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/bridge: ti-sn65dsi86: Enable HPD polling if IRQ is
 not used
To: Franz Schnyder <fra.schnyder@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Franz Schnyder <franz.schnyder@toradex.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Francesco Dolcini <francesco@dolcini.it>,
 stable@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:fra.schnyder@gmail.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:franz.schnyder@toradex.com,m:linux-kernel@vger.kernel.org,m:francesco@dolcini.it,m:stable@vger.kernel.org,m:fraschnyder@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,toradex.com,lists.freedesktop.org,vger.kernel.org,dolcini.it];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,toradex.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 911AFFFE88
X-Rspamd-Action: no action

Hi,

On Fri, Feb 6, 2026 at 4:38=E2=80=AFAM Franz Schnyder <fra.schnyder@gmail.c=
om> wrote:
>
> From: Franz Schnyder <franz.schnyder@toradex.com>
>
> Fallback to polling to detect hotplug events on systems without
> interrupts.
>
> On systems where the interrupt line of the bridge is not connected,
> the bridge cannot notify hotplug events. Only add the
> DRM_BRIDGE_OP_HPD flag if an interrupt has been registered
> otherwise remain in polling mode.
>
> Fixes: 9133bc3f0564 ("drm/bridge: ti-sn65dsi86: Add support for DisplayPo=
rt mode with HPD")
> Fixes: 55e8ff842051 ("drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort c=
onnector type")
> Cc: stable@vger.kernel.org
> Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

It's weird that you have two fixes, but upon closer inspection, I see
why you tagged it as you did.

The first commit that landed, commit 55e8ff842051 ("drm/bridge:
ti-sn65dsi86: Add HPD for DisplayPort connector type"), was still
using polling mode and just using the HPD line for polling. That
commit incorrectly set the flag "DRM_BRIDGE_OP_HPD". So the proper
backport to kernels with just that commit would be to take away that
flag. Unfortunately, I didn't notice this problem during the review
and I don't personally have any hardware using this bridge for DP,
only eDP.

The second commit that landed, commit 9133bc3f0564 ("drm/bridge:
ti-sn65dsi86: Add support for DisplayPort mode with HPD"), actually
added support for the HPD interrupt. After this commit, your fix
(which makes the flag "DRM_BRIDGE_OP_HPD" depend on the IRQ) is the
correct one.

Unfortunately, I think the above will confuse the stable scripts.
Since your patch applied cleanly atop the first commit then it will
picked to any kernels with it, even if they don't have the second
commit.

I think the first commit landed in v6.16 and the second commit isn't
yet in any stable release.

Maybe the right way to look at this is to just call the 2nd patch a
prereq? So this:

Fixes: 55e8ff842051 ("drm/bridge: ti-sn65dsi86: Add HPD for
DisplayPort connector type")
Cc: <stable@vger.kernel.org> # 6.16: 9133bc3f0564: drm/bridge: ti-sn65dsi86=
: Add

That will cause the 2nd patch to get picked up for stable too, but
that would be preferable to having just your fix without the 2nd
patch. Alternatively, you could try to add some other note to the
stable team to help them arrive at the right backport.

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'm going to let this sit on the lists for a little while in case
folks want to comment on the above.

-Doug
