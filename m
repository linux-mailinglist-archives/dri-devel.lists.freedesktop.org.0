Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56FFB19462
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 17:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C8D10E1EC;
	Sun,  3 Aug 2025 15:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="KkQsQLHU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE3810E00E
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Aug 2025 15:33:55 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-71b76c2f903so19539627b3.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Aug 2025 08:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1754235234;
 x=1754840034; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QSwmiYk+M5RmmFXBcZY5LfJlQfD47hJoEsHcQyHy/YU=;
 b=KkQsQLHUPIQXWvsdgu6VJFcdyhTMXptyoFqeeutx2SFZJPr77VYxWlzvh4Fs3kh4vR
 bn0F5wiVr604SRLe3kXxX0MDjWnElcDd8C7VPjW7GX/Cg+l1LQHSeeH3XFA7XK2NbLXH
 l7kCSTW75neJCpSTRjLOvkKpfC2RG/m0XExdou1R0tTGJRxUIj+tTBM2BnLrLPnX7gxp
 OnzM/pu8dHBB27lLzHKUFJUPqOT1pRTElCpJWK9Ai7gq3pVz2Lnk3hJzdeZKGReJ594h
 TG4EL9qaDhNpCG9tq+wKJ7okWog4cj7xTWkhIaaFvxfBk3ZUbKrd1rggAitimtdgRdDW
 hNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754235234; x=1754840034;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QSwmiYk+M5RmmFXBcZY5LfJlQfD47hJoEsHcQyHy/YU=;
 b=G6/SpJMYE0HER8n729eKjwfQf460dcTJI0XGlq3RroEbnx6ZoX/7bG5o7ggKaMiASX
 0YcFiIcujYo/J+dsFiVu3fSmEM3lLkB64/9ppjzdobQqxOAgoILx8eW53ECkTDl5Mnfr
 Z6ApyoHyempxq8/682D7sOg75aVLFColJuIp1YhrUJtHYf83OsFLW7FdV7momUoq7epg
 cAbe1UoN8o3fY8yboDdI8zozysTvQtQ++WxlZe7KDCrXgJGhUpn6v4iWARoFxCGa9JEc
 xlDTNmWdxrCJU2wWsEadQQiyeDZzwfYd5jOSdifvYnUmRAbp/9+tWo64nsqvBLUUR8ul
 7NAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr4HEWwn60QfurAGV6scJBBFNLB+xalWiB14IszarlCCadRZ3M/62ePNiwRxYZDjdTxM3U2L9/buU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywsNOi0rt+be8nLoATKn+DxLwQNTcMGgiri2RxM2KA5EsaNBgu
 GDteRx80AarvbILITqtom73/KTxoCdrE13XbxK6c0yF7p/qHj4sKr3on4Ca+osd1JEgHb2Qer8T
 jBazoLdQ=
X-Gm-Gg: ASbGnctODHRIbOTe2aLng8IyGf6RM6V/Crc99D6Nf3emQbthKRMN1pR+GVtYQTJsyLp
 EjV70eckHH34ClFrLh05lcOK6CIqC6OgAN1mSFgKCNs97405twX0wpi7ynb3DSVS8I9rShN7Ckq
 3A/fP9UGpeKPxIhAXHoLydouH8fSlP1MUN0+HCagD1BtWISC6C+rHTlncuuVFxEEDohF+GYzf2a
 7FRpIMtPtPogCh+hq2gEKfPAkxppjRLDzJTQIP8gvgc1bTNqmGXI11hH3SBG2lkyL30CjwVWwTI
 /FN0f3yS7fh6PF5MCpGCt9Ix5+VU9S115PtQPrCit5jc7HVpprmojM7SuOzCouLiB635rilSJBN
 qqblsUQ+2XgUXAFC8tO6Js41ipxSeNmmaAJhbL//8b9Ho/gwM63DLAu5w6KlwvbcpEQ==
X-Google-Smtp-Source: AGHT+IFxw3GracCmpwH2PV4a46+EwV7d1uDhG5ulGcgNe2+ET4hzmGP7WV1sB8Z2EpS9BImSG+Wymg==
X-Received: by 2002:a05:690c:6386:b0:6fb:1c5a:80ea with SMTP id
 00721157ae682-71b7ef85180mr88393017b3.32.1754235234474; 
 Sun, 03 Aug 2025 08:33:54 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-71b69fd3dd2sm17186507b3.9.2025.08.03.08.33.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Aug 2025 08:33:53 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-7183d264e55so38533817b3.2
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Aug 2025 08:33:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUTk6LFe6ehPVCqgK6GyYyfxyXFWjpgWZyfL9ZApWzZhdyOQIvkfvJyzbSSZNmtPz3NryXOfFxeMAY=@lists.freedesktop.org
X-Received: by 2002:a05:690c:7108:b0:71b:8cc6:6d41 with SMTP id
 00721157ae682-71b8cc66fecmr55025047b3.17.1754235232707; Sun, 03 Aug 2025
 08:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250802-fix-rockchip-npu-build-v1-0-fb0f0dacb3fe@brighamcampbell.com>
In-Reply-To: <20250802-fix-rockchip-npu-build-v1-0-fb0f0dacb3fe@brighamcampbell.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 3 Aug 2025 17:33:41 +0200
X-Gmail-Original-Message-ID: <CAAObsKCUs0yn=S1PzGDKu8nNnTOkxqMMYzep-QhG00X1CY3DjA@mail.gmail.com>
X-Gm-Features: Ac12FXxPVQwjDAIVgxnyFNwyCiKtQqDmuUpUnwaIigvKfVmO2D9Sk5m8K7Mojy8
Message-ID: <CAAObsKCUs0yn=S1PzGDKu8nNnTOkxqMMYzep-QhG00X1CY3DjA@mail.gmail.com>
Subject: Re: [PATCH 0/2] accel/rocket: Fix build errors and sparse warning
To: Brigham Campbell <me@brighamcampbell.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
 skhan@linuxfoundation.org, kernel test robot <lkp@intel.com>
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

Hi Brigham,

thanks for the fixes. Will pick them up. Hope you don't mind if I
change the subject of the first patch to something a bit more
specific, such as:

accel/rocket: Adapt to changes in drm/sched API

Regards,

Tomeu

On Sat, Aug 2, 2025 at 9:25=E2=80=AFPM Brigham Campbell <me@brighamcampbell=
.com> wrote:
>
> Fix two build errors in rockchip NPU support code which were caused by
> the integration of recent changes in the drm subsystem.
>
> Fix a sparse warning regarding an undeclared const, rocket_pm_ops.
>
> I tested these changes by enabling DRM_ACCEL_ROCKET and recompiling with
> `make C=3D2`.
>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
> Brigham Campbell (2):
>       accel/rocket: Fix Rockchip NPU compilation
>       accel/rocket: Fix undeclared const rocket_pm_ops
>
>  drivers/accel/rocket/rocket_drv.h | 2 ++
>  drivers/accel/rocket/rocket_job.c | 4 ++--
>  2 files changed, 4 insertions(+), 2 deletions(-)
> ---
> base-commit: 01ac6e4e53b6351df42c97d217b0d2dbeef5c917
> change-id: 20250802-fix-rockchip-npu-build-ca759ba8da06
>
> Best regards,
> --
> Brigham Campbell <me@brighamcampbell.com>
>
