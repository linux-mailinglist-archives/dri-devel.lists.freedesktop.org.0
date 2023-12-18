Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5713F8179C1
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D6F10E259;
	Mon, 18 Dec 2023 18:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF9110E371
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:31:50 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-33666fb9318so1583060f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 10:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702924308; x=1703529108;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FsmrM2oHtRClB02QA8pjdjW9Wbdn73CBnuj1SfAdY/I=;
 b=LSU+t6jtbiT7vA2FRYeHI8p+y+2siST1/otRy1ZpB7Aba0ZkHQgmQWKRpd9grNTiwL
 T4vhJ1/n7rnOc5fqxDkvadSqtXdfpZrY4PGPEIgzpcrJQdf6beM9It9NZF2DOgs0KFlx
 GYCgmgi2CADA3B1w1gpg12Q/F3YZfWsLEURKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702924308; x=1703529108;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FsmrM2oHtRClB02QA8pjdjW9Wbdn73CBnuj1SfAdY/I=;
 b=VpLZjqi18VhEJodiHL5fnzg/zVpE7wFg8qM3bNGo6HytKhQZsiSmm7HBvhhriu02pz
 D1XgDxhs0szcRK+iS8e3mBiW7SMjCLP7Jhs39sUKdfxq7FyOM4A3KwoZaDdSHZXL9Adq
 LMJG2J2Hkqyqk9SrovvUJdobZNVAdGnvFGK/7VvLzgLDH5AqaKhiN5i7+LrYf33QH+k0
 brVxb+ahJONjYR478Xx7koIy5iLAOYCJy0PGUXYow4UwDy2sQJMBokW9/gJaA2Y+dK/r
 iTNXZzgdTdYsNwbM3RV7RYgyi+WMacW5S3Fe94pzv9erXQiJreRuHSjPNYWRutEk+z27
 wT1Q==
X-Gm-Message-State: AOJu0YzDzRDM2Lr/nhyiJuBeOpsLf3DUlesb3dmuJ03bTsAbrJll6Y1X
 cYktk125wDxHkuR1fB+YGu+ON8XV/EDd/IVcym+OPfps
X-Google-Smtp-Source: AGHT+IE2Rt2HClus8GBMflhmYYbMXQJl8gsVCmRAK83DBuQ0c86G0573fCMdorU0HguyV40zkld3Dg==
X-Received: by 2002:a05:600c:501e:b0:40b:5e21:ec0d with SMTP id
 n30-20020a05600c501e00b0040b5e21ec0dmr8775123wmr.63.1702920305455; 
 Mon, 18 Dec 2023 09:25:05 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 ss20-20020a170907c01400b00a18850d2240sm14660246ejc.143.2023.12.18.09.25.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 09:25:05 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-40c38e520e2so103905e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 09:25:04 -0800 (PST)
X-Received: by 2002:a05:600c:3550:b0:40b:4355:a04b with SMTP id
 i16-20020a05600c355000b0040b4355a04bmr365476wmq.6.1702920303831; Mon, 18 Dec
 2023 09:25:03 -0800 (PST)
MIME-Version: 1.0
References: <20231218090454.1.I5c6eb80b2f746439c4b58efab788e00701d08759@changeid>
In-Reply-To: <20231218090454.1.I5c6eb80b2f746439c4b58efab788e00701d08759@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Dec 2023 09:24:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xpp16ptOuQz=5UYfgm8B-WbNXF95YwA1t-FTkzOYRE_A@mail.gmail.com>
Message-ID: <CAD=FV=Xpp16ptOuQz=5UYfgm8B-WbNXF95YwA1t-FTkzOYRE_A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Fix size mismatch warning w/ len
To: dri-devel@lists.freedesktop.org
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Guenter Roeck <groeck@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Dec 18, 2023 at 9:05=E2=80=AFAM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> After commit 26195af57798 ("drm/bridge: ps8640: Drop the ability of
> ps8640 to fetch the EDID"), I got an error compiling:
>
>   error: comparison of distinct pointer types
>   ('typeof (len) *' (aka 'unsigned int *') and
>    'typeof (msg->size) *' (aka 'unsigned long *'))
>   [-Werror,-Wcompare-distinct-pointer-types]
>
> Fix it by declaring the `len` as size_t.
>
> Fixes: 26195af57798 ("drm/bridge: ps8640: Drop the ability of ps8640 to f=
etch the EDID")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Sorry for sending this hot on the heels of the other patch, but for
> some reason that other patch compiled fine for me until I picked it
> back to my downstream tree. I'll see if I can track down why. In any
> case, as soon as I see a Reviewed-by tag I'll land this.

Ah, I found it! <Phew> this makes me less worried that I had some
failure in my testing. I believe that upstream things weren't a
problem because of commit d03eba99f5bf ("minmax: allow
min()/max()/clamp() if the arguments have the same signedness.").
...so at least what's landed isn't actually broken upstream, just
downstream. It still feels reasonable to change this to "size_t",
though.

-Doug
