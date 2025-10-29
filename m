Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B56C1DADD
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 00:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00D010E226;
	Wed, 29 Oct 2025 23:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="CkTnMI2U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919BD10E226
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 23:21:05 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id
 a640c23a62f3a-b5b823b4f3dso67630966b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 16:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1761780064; x=1762384864;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TKw67xewyEQ2RYEG8QR7XxorPa9DhZO3u8V3evRxitc=;
 b=CkTnMI2UDIC9UZLSt2qXFBAgFhsd6iOWEfh7dhEtRcwkYekuXrxovEFYYKd/U8iCjv
 QJ9SXkNNEsgbeK3mKpcqppR7LyuNrtKiaZCdpT0HORaW7Xm0fuTOxMn/Cpj8zNvk8z8w
 XH01kmjh/4a+3YY5hZZpCd+B7tqz6IsNtj51U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761780064; x=1762384864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TKw67xewyEQ2RYEG8QR7XxorPa9DhZO3u8V3evRxitc=;
 b=E1zWpPe96ejzswPa1L1mNxH9njm9zH/pcSAZu60oL3R3mjQNAML7T8fM1oElb+y9tS
 gToE1ADtlWFE7WVvu4IU6XBQQmy69ayDVbm+oC6y4rfd30Oz78xyjUWNMKbJD7GS70lK
 Fq5K/0prTfNBA2yNvHothwEXTD4kBJOntPzFVYJRX754plXBmnE6Ki+ZR42ARycB4KqU
 SmwJn8yvv7Ou6Rp2Mq1GK3BOx3LhoiB1OfN9B0t+qoTZ5W4QLOnxMXSuudHj30tN/7MV
 KE9ANOjrRUB4QJKnz6Tx8SY++SZlFOwRoWYup11xIrfSBoFqYpyQrlete3qXyXw9OVZP
 Cvyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTMvyKmG6Xhitu6Bp7XONnJyyVue0KbVQjfG3n94SqKRB+Yk9GDoKShSXIxUzZ9VDVqHIeFtcaNEQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4xihjkd+NLXZRw2RV6juCJtmIL46wAghYa+QqqA4cn5KbKGhR
 Gh27hAyoResvzGSRC0XSQbj7bx4gGW83WVzQ67FZsfPewNcsUEUu61J2+MWj/ysaIz+h+bnh6oY
 +ayZrw6fC
X-Gm-Gg: ASbGncsKc4ke/l23G9DBVBax1V2xIicuVmjZK2ncsCyOiZ5ljTrCieB0h0Z/yuWPw8j
 qguPpbnEF388drLlVPwzhTZog1ITbyEbhR/Glzu4psn7s8DX1jShLktIHMD1SzcvwlywKzyzuqT
 bVwdVgBGOz4/7NdemjvV0KomSYHA7AcK6QvSSRPTU16bswnmI5oxpb98HSiXKC0apSycDqL7gfu
 KgAOpJeRfSn8NMPevUUiXib7eFhq1R8/hAObZifzQ4kuKRUlVrtLXaBBfb06I2ZBVeTIFsYCzWC
 1i97oHedyuFe6DTySXnTMYJtbFy8YGe2LntElF6fnd8Vdh8xJrvBj/5xFU8rXjyj7lhHI3faIFn
 qzxkSaP/wmKoKdFUQxL1JhrdShRxUE8e30UxDPODUgiMkTdyPnYp/9XduhQsXaHv0ySIfDEitc+
 kU0SAok+98ioFEoqFRRnVCll1XgURbAqnTfYDn2h8=
X-Google-Smtp-Source: AGHT+IFQgSC40jlRyEdS8HN5fZlinLlGzvze+mcjNMBspXvp2hK4SXJ6n3bWWmcrJXEi+Wa9BC1REg==
X-Received: by 2002:a17:907:d23:b0:b6f:9db5:9fe6 with SMTP id
 a640c23a62f3a-b703d4db341mr472859066b.36.1761780063930; 
 Wed, 29 Oct 2025 16:21:03 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com.
 [209.85.218.44]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d854430dbsm1557688666b.63.2025.10.29.16.21.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 16:21:03 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b6d5c59f2b6so104341266b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 16:21:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWrGz+A5TjQ19XZZcnd2q0LGQ/nyqFzd03GLOkl86W3/XNVzrXy0xorc+JgnyYdC15mQlw8+6Fz254=@lists.freedesktop.org
X-Received: by 2002:a17:906:f588:b0:b4a:d60d:fb68 with SMTP id
 a640c23a62f3a-b703d2dc0acmr408681866b.6.1761780062930; Wed, 29 Oct 2025
 16:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20251029081048.162374-1-ajye_huang@compal.corp-partner.google.com>
 <20251029081048.162374-2-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20251029081048.162374-2-ajye_huang@compal.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 29 Oct 2025 16:20:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X9hUxsrJ6o5yP0-bprfKgyQzZJnQRwQVYRo6G0yKWhCg@mail.gmail.com>
X-Gm-Features: AWmQ_bnALe5cE6UL5BlZi69GWxwTwFqhUHYXfwWWJkf3C1AVS9gQ6kR_yZsS7Ms
Message-ID: <CAD=FV=X9hUxsrJ6o5yP0-bprfKgyQzZJnQRwQVYRo6G0yKWhCg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/panel-edp: Add override bpc quirk for generic
 edp
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, jazhan@google.com, 
 Jani Nikula <jani.nikula@intel.com>
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

Hi,

On Wed, Oct 29, 2025 at 1:11=E2=80=AFAM Ajye Huang
<ajye_huang@compal.corp-partner.google.com> wrote:
>
> Adding override bpc to EDP_PANEL_ENTRY3 quirk.
>
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

This seems OK to me. I'd be OK with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>


I think you could alternatively add a EDID_QUIRK_FORCE_6BPC quirk for
this panel in "drivers/gpu/drm/drm_edid.c", though I haven't tested
it. That _might_ be a better solution? Maybe Jani or someone else CCed
would have an opinion.

At first I was thinking that the quirks in "drm_edid.c" were probably
just for "DP" display, but then I just realized that they probably
also are for "eDP" panels. Specifically I think Intel hardware doesn't
use panel-edp.c so I think the only place quirks could get applied (if
an eDP panel was also used on Intel hardware) was from "drm_edid.c".

Any chance you could confirm if EDID_QUIRK_FORCE_6BPC works for you?

Does anyone else CCed have an opinion of which they like better?

-Doug
