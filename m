Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E5BCD1791
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579BE10F071;
	Fri, 19 Dec 2025 18:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dp2FIVOg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039E810F071
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 18:55:28 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-29f08b909aeso3697425ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 10:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766170527; x=1766775327; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lostcG6C51WpWatxb5FnWPlDYYQmF8t3/6JliHSTHkg=;
 b=dp2FIVOgnN+eyadmBOSxaUGcsw0eJWjpULnG/NZ7Tvso7U4uR0mKtTaiqBfFIhK4kV
 AHoyg4L4HSMG45PjpqQk2KZqkE5+1EifDV15PwqUAB08jUmNTWMxzphYIZ6EJvov/qVS
 i0Jimr4SACR/HtZMtKwGzX71KzLcxQYX0vopVZd0XpYJdlDBTHTKiTDZEL+k1Iio/N8l
 IRYaovZTbonYa8pRFkp5/sGxekXI/AddeKNo4uo1maMOI5iTI6J427AI3LCi7k6E67Xz
 /YRABb0dnufGDH8qVyL1CiPTe0a+Xngpwu4cfaNOZOfaM5s2Au2nMBsrBw3kxy6tI92o
 oYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766170527; x=1766775327;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lostcG6C51WpWatxb5FnWPlDYYQmF8t3/6JliHSTHkg=;
 b=I+4yd6DbVsxT9gQTa/M7z/8gEpmDjkrXqkegUR1RTrOMqKWKoTtOBN+JgVaVZ/Uzsz
 5XJu2JDU7ehiTp61nnSLmUl3NvJyD12s5OR1KrGxlqNbeIwx7hE9/K8kbHHQkyKU1ulC
 c7s+QVhs2oLER97pY5rBQsKrW1ApuiNHpaw1uL+QON+Uc5XKIMCiiFJZI2Cc9kw8+UmS
 SMRTx1jZV9eayqe5XO8Pi+x3f7BWFps9H9EwcwMis/NDyJCuj6/SVlpt7t+rlukuno0+
 YpcX40vXg2RxjWeTrB4NWQElqdCImZeLMJIUTgx1pcLpfgXObsPyNulumR9vVSwCE8lU
 svsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkF74FNyVAvSXu7kyErcH7v062Ye98DIc546j8AjjNl1YXZHeLX3MUBnD2GT1fngCu1rDTMQLe+34=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1ncwsst9RLHs2nDmXW7NN01G9ceRYbKwvMfTxp1+b4Xgsxy5E
 Q+rfPwDzJIGsq5SGTsAXKz1CgSaXpACpFm6USPU2gw2BYwd1bxuij/B4O1y8BLn2aTsh3tsikl2
 JEeq0xS89Bd8o0eY9plHzK+AeI05YNSU=
X-Gm-Gg: AY/fxX4KPlV0Cwpe0LRHzGUaB+3Bq8YDuAzoM09ZVe6zSbXjM9s18nKcdG8R2qLXd5I
 dI4nwM/Bp722JzTUU3it3gZEzHnfIugg7mdLUSNsUuDIkPMr/mdAlfwJkMQiXdepSxVa5FRX5uA
 yM2aac2tfy8ffoyoUFTvZ+/JNzjCNqmBPrOjOcx6+giDlebzCm6AyNL3/ShAacBER8lrDJdYweG
 n0QGE2rAU8sCmIZjFjZCmQ6YkQqdxwEElKFZyxZ/YvyhuTPNPX7VdbrOq+nnWXjF73Agk84FP+m
 Gv583oA=
X-Google-Smtp-Source: AGHT+IEYSe2rf88RNR50COMzAo25/+MoiXWahuSFAS+jPucPHa7MTiknQ5gnKI1kfCJRQTJnNzzQBvdJbtBUX8EiAFc=
X-Received: by 2002:a05:7022:3705:b0:11e:3e9:3e88 with SMTP id
 a92af1059eb24-12172306353mr1646695c88.6.1766170527326; Fri, 19 Dec 2025
 10:55:27 -0800 (PST)
MIME-Version: 1.0
References: <20251219120559.60710-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251219120559.60710-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 Dec 2025 13:55:15 -0500
X-Gm-Features: AQt7F2rLSW9lzEVGWOmorHF2__kW7Jjekn3rmRAqFzSHMVPgFkMjAB9bawskfoM
Message-ID: <CADnq5_ON_u-qZv_rFzOWX+Si=c=8fc1pU2J2fBGmeRd+knhFqg@mail.gmail.com>
Subject: Re: [PATCH] accel: MAINTAINERS: Mark the subsystem as Odd Fixes
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

On Fri, Dec 19, 2025 at 7:16=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> The git tree mentioned in MAINTAINERS entry for computer accelerators
> was not updated for three years (last tag or branch pushed is v6.1-rc1)
> and is being dropped from linux-next [1], thus should not be considered
> official maintainer's tree anymore (patches appearing there would not be
> visible in the linux-next).  Also, there were not so many reviews from
> its maintainer [2], so it seems this subsystem could use another pair of
> hands.  Mark it as "Odd Fixes" to indicate that subsystem could use help
> or is just not that active anymore.

Would it be better to just fold this into the DRM subsystem entry?

Alex

>
> Link: https://lore.kernel.org/r/20251215184126.39dae2c7@canb.auug.org.au/=
 [1]
> Link: https://lore.kernel.org/all/?q=3Df%3A%22Oded+Gabbay%22 [2]
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0dbf349fc1ed..d97e5b41b998 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7740,9 +7740,8 @@ F:        include/uapi/drm/rocket_accel.h
>  DRM COMPUTE ACCELERATORS DRIVERS AND FRAMEWORK
>  M:     Oded Gabbay <ogabbay@kernel.org>
>  L:     dri-devel@lists.freedesktop.org
> -S:     Maintained
> +S:     Odd Fixes
>  C:     irc://irc.oftc.net/dri-devel
> -T:     git https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel=
.git
>  F:     Documentation/accel/
>  F:     drivers/accel/
>  F:     include/drm/drm_accel.h
> --
> 2.51.0
>
