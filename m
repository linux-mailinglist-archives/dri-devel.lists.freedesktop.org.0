Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0264D9C2041
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 16:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7161110E9E8;
	Fri,  8 Nov 2024 15:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="A+GlWM0y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9E810E9E8
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 15:22:17 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-539e8607c2aso2585530e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 07:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1731079334; x=1731684134;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HgfLZptM6/3AAPLv+VlAD5qO5/FWxVF/aNEVYnKiuLs=;
 b=A+GlWM0yTIMMNZ2URTdcjp4UMTC3gO3CByRR3dkiVdOQaPWkNzE0B0hJbqlgAr8gE/
 BuKsu7OeDATd6Z9KcX4yHRJLuqv5wQZvfJ2wSGOe/bJQQnww63kT5LmuDV8yvW+Zvohv
 UttuvoD0+UOoDcwHeI5q9a53TBoeaxBPdlQBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731079334; x=1731684134;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HgfLZptM6/3AAPLv+VlAD5qO5/FWxVF/aNEVYnKiuLs=;
 b=G8LY3J/yHeYqhs1ntRyWv8RHSaU++0kvOz8wiO7b/2nB1PZBFnM3Py5MgPO7uVrj1p
 b3FbgqOxvxiDPiKHKvRdV8wO+rw9hZPXIePso3/dm5Y2TTV9Oek3+jHhFKFu5UoMyKrK
 +mG2yIrsMSSKqf+q6GrSxQgjtj2DKauQtErdOoT28UUy+f8wco3+vVu+hLIR7g96Sj8h
 sSBzgSWVKQbAu1UWWlCVUjRS9zMsT7yfPFkuid+IZteOiJZQ0sTawPIChMBWjKI+uOAX
 IPFnQLbPRLivpKOOEnFMHnEszU2ZSfWpH68iF/ev3+aGnqp08A/eT9qpAvlhFVPG9e5C
 OqHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3HfrNKqiKnG/w+gBxVkkftyPtg9T1p9O+yQyK65l0/WN6bkLc0mJlJk7uBjMA/asgXhai8sBW1pg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhC9xLtsntbtX32GOe0f9CUhTy/MavzZK+18CuqoZK/qKa9abU
 oQqrR4zpOy/Vnu9DOw6HAgzkBggymlvEhYUjukVbkC55AfxmmW1mBaMvSFX6XBLTXw3DgkyU3ra
 3IQ==
X-Google-Smtp-Source: AGHT+IFYb/KbsvVZy2s10kr+X54I5d8L6oG4CoXzSA3Yyn3v5NLa0WMdM4pz1sGIwOgSVI7xn1Fs+Q==
X-Received: by 2002:a2e:9fc5:0:b0:2fb:607b:4cde with SMTP id
 38308e7fff4ca-2ff202a7081mr19083101fa.39.1731079333878; 
 Fri, 08 Nov 2024 07:22:13 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff178dfb06sm6823051fa.24.2024.11.08.07.22.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 07:22:13 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-539f1292a9bso2813105e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 07:22:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXDRlZB3WqZCZpTY0xXw2kNq2y5Me9cEHQtjYQjYAOySMr/NyYVUAN0DCbsoXpMJBZzEZob9H4kOvA=@lists.freedesktop.org
X-Received: by 2002:a2e:be20:0:b0:2f5:11f6:1b24 with SMTP id
 38308e7fff4ca-2ff201b3185mr20586931fa.18.1731079331685; Fri, 08 Nov 2024
 07:22:11 -0800 (PST)
MIME-Version: 1.0
References: <20241108-new-maintainer-address-2-v1-0-47c9d71aac11@linaro.org>
In-Reply-To: <20241108-new-maintainer-address-2-v1-0-47c9d71aac11@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 8 Nov 2024 07:21:56 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XSiNw5RKEPg5wwTn=tNVKDxYoqYZLU5C_88wveD29UCw@mail.gmail.com>
Message-ID: <CAD=FV=XSiNw5RKEPg5wwTn=tNVKDxYoqYZLU5C_88wveD29UCw@mail.gmail.com>
Subject: Re: [PATCH 0/2] MAINTAINERS: Update with Daniel Thompson's korg
 address
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Jason Wessel <jason.wessel@windriver.com>, 
 dri-devel@lists.freedesktop.org, kgdb-bugreport@lists.sourceforge.net, 
 linux-kernel@vger.kernel.org
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

On Fri, Nov 8, 2024 at 12:31=E2=80=AFAM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Going forward, I'll be using my kernel.org address for upstream work.
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
> Daniel Thompson (2):
>       MAINTAINERS: Use Daniel Thompson's korg address for backlight work
>       MAINTAINERS: Use Daniel Thompson's korg address for kgdb work
>
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I don't know if it needs it, but if it does feel free to have:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

BTW: do you want to adjust the '.mailmap' file as well?

-Doug
