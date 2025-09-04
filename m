Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 950F5B43E57
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 16:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA46D10E25B;
	Thu,  4 Sep 2025 14:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cC2wRXl8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7F110E25B;
 Thu,  4 Sep 2025 14:14:54 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-32b7e7e81f6so81296a91.0; 
 Thu, 04 Sep 2025 07:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756995294; x=1757600094; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b0xCHn0bUk3RHmh2GHFzu+yYoz5Jb1g0VJrR9c2n01c=;
 b=cC2wRXl8GSNbU2J1i882ilqSPl3wh1h2ds8FlRYWoD0uegLTK5YJ7tsdOzAl2KaRO7
 8WXT9dllVDoGAvO60o+WHpTzS3FOLsGqtr4ge2Bd1hohltFOBNImUbVwyBGVZxLH1iTq
 MWMw/AgLOxjoeDVkKsUtBiQ3ToMEtcXCzJV+zCrRRFuJ1W6ffQlPGNZFhP3rXuNUIyMj
 x7XTqIchLEIN7u3cdP0s+fMN5etLuz5TfHACwrZ+ynaJ4oaP3T62k17v7EtMrcpHPwmL
 jOZEj2KHl5jh1UWpevRDoPV4y9LMDAX78nrqq2KKU8GJRTP41GpWTdg562mY0LNv1obt
 sQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756995294; x=1757600094;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b0xCHn0bUk3RHmh2GHFzu+yYoz5Jb1g0VJrR9c2n01c=;
 b=EdMQdSmYwKLD8W1XS44sujtAxMIzUrEXbM5TcGzBR2LyJeNWy75R+ashWCTaC/vpmN
 rwEVS8A1HVkYtBnokxcoSOo1ZnRaVXiIX0+03AQvrp/vOyy1+MGymyfWHP/IxUKo5D7h
 36LdcbgfkTD47YbCy6yiZ5klCe/IQY1Bst/gCqD2rG8b1gO0N9VLOmrsCoOv5tsLzruu
 IscFeda5mAxegGrjHYhx/ZID6+bNrYYG9jWFMEcq30y4YGZRxP4GgdbI272QL2/zC0Cb
 XjHH0Hg78Y9LuhSoAYtY2Kng/w/1zvegrJ8rxnFqxwOU9hsSGIQWRj8mPz8QSh3BJv5e
 td0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhdqJED6knRyfHwtA+g9JHpjXtSZkYUVOGL1qj9znJaDH4R3pIpz9QaJLDIRAf5m+KrXYrYBix7QXw@lists.freedesktop.org,
 AJvYcCWVmDE/TnEl10e8eL+MgbtV8bt0n+t2RAyE1t7PWkzzcQGEZEoHn+gqBbeo+lXgYbvRqtculAzo@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLTwv4WdHt5FpJvKXa0Uo8rsYGFe1pvqwSHUGrnnXS9cqKfVid
 JmNCDTIP6ivjCrzpuEfqpNET/Eq/gvo2rhN+zX0R4RBZ+4sHc4gZRYzp0V983+E+GFz3jc2xiEj
 FKYu6sFG6+Qky7/+Z1x2rzr+FKgX0nEo=
X-Gm-Gg: ASbGncs6hBlZBLrgMcfTzTEf2dhszB1ulYukHBC17qFUpBlgapZBGJh4EHGMAIo/kmH
 qhtEFgGfs3X5nA3eVdP/7Mn3/A+LCMSYSjbbPLAvEt71+Wxf/4DXbDwEG3zni/yCsQvjxjMqG1m
 fyMOlHTv3hTIfT+k/N/99pnUoBgigeN4h6annKKxCQiEdqP7BDg7SCIEu3U9WPHnRSK/5Kv1NqJ
 ClRR8TSaCOw/UNxR4rtbOtFy/0m
X-Google-Smtp-Source: AGHT+IHY3FHcpQI3y/30onEh0FHloQof42J1vxR31s3RTApweweMvjqY9ReAEMFZe796M1YtxA4JTJC1ZLJLiBFF0Vc=
X-Received: by 2002:a17:90b:2dcc:b0:329:d47f:c25b with SMTP id
 98e67ed59e1d1-329d47fe8f4mr7703925a91.7.1756995293683; Thu, 04 Sep 2025
 07:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250904113201.352187-1-liaoyuanhong@vivo.com>
 <20250904113201.352187-5-liaoyuanhong@vivo.com>
In-Reply-To: <20250904113201.352187-5-liaoyuanhong@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 4 Sep 2025 10:14:41 -0400
X-Gm-Features: Ac12FXw5h-JVKiihSXykGZz4Ep2zEIjYnJMnvtC57T25AA1hrZypdJYTR6p1els
Message-ID: <CADnq5_Mf7xsK3v2r4EKR8crOQ=1WxhvTGNEmQAKLkY3XJuBXpg@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/radeon/pm: Remove redundant ternary operators
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
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

Applied the series.  Thanks!

Alex

On Thu, Sep 4, 2025 at 7:49=E2=80=AFAM Liao Yuanhong <liaoyuanhong@vivo.com=
> wrote:
>
> For ternary operators in the form of "a ? true : false", if 'a' itself
> returns a boolean result, the ternary operator can be omitted. Remove
> redundant ternary operators to clean up the code.
>
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  drivers/gpu/drm/radeon/radeon_pm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/=
radeon_pm.c
> index b4fb7e70320b..a855a96dd2ea 100644
> --- a/drivers/gpu/drm/radeon/radeon_pm.c
> +++ b/drivers/gpu/drm/radeon/radeon_pm.c
> @@ -907,8 +907,7 @@ static void radeon_dpm_thermal_work_handler(struct wo=
rk_struct *work)
>
>  static bool radeon_dpm_single_display(struct radeon_device *rdev)
>  {
> -       bool single_display =3D (rdev->pm.dpm.new_active_crtc_count < 2) =
?
> -               true : false;
> +       bool single_display =3D rdev->pm.dpm.new_active_crtc_count < 2;
>
>         /* check if the vblank period is too short to adjust the mclk */
>         if (single_display && rdev->asic->dpm.vblank_too_short) {
> --
> 2.34.1
>
