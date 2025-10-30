Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 505C5C20D49
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 16:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECE010E9D8;
	Thu, 30 Oct 2025 15:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mhQdpUK2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B980C10E9D5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 15:08:37 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-63c45c11be7so1902274a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 08:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1761836913; x=1762441713;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S2SjpXgXJt0/pxrphlRH7OZcg37sLfbQRD3739eO0nw=;
 b=mhQdpUK20XGrQRqcknt2HrYxAoW9KxIOGLO8VAh6DSMIeYIJhpajnSw697e4qIILmY
 QFu/FOGoYDmo2PYzc3xejsm9F4SKDSprKlVLxWpNK0TyVAPvLPpX4G3kSrKv+v0vaDSp
 kQtDEZYwOWGmzT9UkL7Gjjzbzdr2kb8uc54mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761836913; x=1762441713;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S2SjpXgXJt0/pxrphlRH7OZcg37sLfbQRD3739eO0nw=;
 b=qEqkuGaof5oVaRa3XC6L67nb2QsDX2bXJRrQO15p9dTDTjP629pa/XezI+m2u+SS8F
 9hH9nUxM+toVyX3LPhNjxrQUOX7ou80UoJOOs+Cl0P0gb7SQ/tqxLF5Vzil7SnKZ1FkN
 lQgVEhxqhRbZrj5rYohbIlz3t1Tnmptm7UTTdP7nTLXTYxJW8/8TCLxO0n4RGppC4na6
 vOfXutAGiIiYPxl32SuLW2caBFaTZvzHwlcYM65alUYIaTRl/dD+eB31wFBk0afVoGcb
 BSi7NVOklLKwzUGl+jQ/ZHaOckAqkl+7yDdIXmwLCeL2UtwWaYy05hAHgYHtcM+Tt9u1
 zPqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzjh+LuNFWQ1kfFD1jihADu085aKa3s+zLV+w/5+tpiphdpMmBwgmINcWZeUCgdoB5KmniRnQDVBs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoW+N4FrhuvNKddzVQtFrfnvRpWuWxFGG94hfDpaVUkofDnmzi
 3wTElGzy5yoOQBYkQcxDmvHLrCV56USzijz+ZytsIZpnN3YnQJeUvVETrhi1alg/nyvQPguTFtJ
 Q/0GgFNQ7
X-Gm-Gg: ASbGncsv+eAerzjvYFS1Tt/uSedw0HEBT1KejvT/c2SQGOM9wn1nWLzKXr5MwUaXu5y
 3FEPILveQY9S0+TE0ySsd0GWeNbn4AMCjGCP6YIcwdAG1UW4P0zv4TRjuxWlgFSO789/kejXEfx
 X2sjDEeWtWkzrj30eUMY5nVTzLfkoRRgi+giw7rM3pwG9S8IV2xgi/0Ynjmgh7uR8cSsjQ5q2i8
 GsmMGVPGtZTk1Qse7ndBd0F+dtJFKLYDV50HWqnVBVpihJKiFPNZ29aQF2YFdfKImzbjVCC6R2h
 +aRavV7CNSIEo6FCVj61Et6P0S2/6o8IeOHSU1SbZdspFQrI88CnlR7lMG64PolpsLIzIs0DxBJ
 JnxTaU/IEC2bhRWWG4c8Uc89VB0LbG8+592hnbwOjfWKQh1CwCwBb+uL+1QpY8tvupvs8qQsaMD
 485hMjhgpu5HGOu3wI/kkc2dyTKuPETNODQrzyZog=
X-Google-Smtp-Source: AGHT+IGoH+MxcR+DiUpldDqy0cZ+gyuYS+bUp04XT8DuTh553fWQ14SWOf/oZngvhrgfd5hKhSw0Dg==
X-Received: by 2002:a17:907:7253:b0:b6d:2c70:4542 with SMTP id
 a640c23a62f3a-b703d4f7dfemr712421466b.30.1761836913455; 
 Thu, 30 Oct 2025 08:08:33 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8536968csm1788432266b.29.2025.10.30.08.08.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 08:08:32 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-421851bca51so1040356f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 08:08:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXsfMfI/pqCqN6FXHodFNmrO4e0iQkVU2/czzo7URJG09uVy0lGSJtF66XSrHltakD6xEXUPebDR+A=@lists.freedesktop.org
X-Received: by 2002:a05:6000:2381:b0:429:7693:884f with SMTP id
 ffacd0b85a97d-429aef75da6mr8131557f8f.5.1761836911796; Thu, 30 Oct 2025
 08:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20251030094434.1390143-1-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20251030094434.1390143-1-ajye_huang@compal.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Oct 2025 08:08:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V6xV0m4pj=7f2dxDP-0A1AaQuYJP5NAnXNz1_bzH7nSw@mail.gmail.com>
X-Gm-Features: AWmQ_bnEHxdnjsk13FRpIWSB6gHTYcjSmCDcSOhTK1zW9zhzw9_Rl-0piXEINNU
Message-ID: <CAD=FV=V6xV0m4pj=7f2dxDP-0A1AaQuYJP5NAnXNz1_bzH7nSw@mail.gmail.com>
Subject: Re: [PATCH v1] drm/edid: add 6 bpc quirk to the Sharp LQ116M1JW10
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
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

On Thu, Oct 30, 2025 at 2:44=E2=80=AFAM Ajye Huang
<ajye_huang@compal.corp-partner.google.com> wrote:
>
> The Sharp LQ116M1JW105 reports that it supports 8 bpc modes,
> but it will happen display noise in some videos.
> So, limit it to 6 bpc modes.
>
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index e2e85345aa9a..a73d37fe7ea1 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -250,6 +250,9 @@ static const struct edid_quirk {
>         EDID_QUIRK('S', 'V', 'R', 0x1019, BIT(EDID_QUIRK_NON_DESKTOP)),
>         EDID_QUIRK('A', 'U', 'O', 0x1111, BIT(EDID_QUIRK_NON_DESKTOP)),
>
> +       /* LQ116M1JW10 displays noise when 8 bpc, but display fine as 6 b=
pc */
> +       EDID_QUIRK('S', 'H', 'P', 0x154c, EDID_QUIRK_FORCE_6BPC),

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll plan to apply this patch next week unless there are any comments.
Given that it's just adding a quirk, I'm also happy to apply it
soonner (or for someone else to apply it) if people think that's OK.
:-)

NOTE: in general if someone is involved in the discussion of a
previous versoin, it's good to CC them on newer versions. I've added
Jani back to the CC list here.

-Doug
