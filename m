Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B871BCC3DC6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 16:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BD410E71E;
	Tue, 16 Dec 2025 15:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c+yC3erJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A71810E70D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 15:16:21 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2a07fb1527cso8465305ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 07:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765898181; x=1766502981; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Prk++bNPBbw7llSvdyWuyKrdatVuaHMUXvtiIeDQebI=;
 b=c+yC3erJCkYUfP/orrlyEvGpp4lD0pxjxzqopBFeNWnkWhH+GeSBMjp7Gv3nL/Lnxd
 Ozykjnq2pX6LUrSIQhUOeQss8HcePKHosnDjVhJhYLyC/hv0YqVdav0WaUTTyiGgsHt1
 wa8XvtMsZ+1ywzwjBSPnejjoS/KHr8qgT0XKxCunOeEZXejVy/lR2e+OtU36xJFC6juS
 byP1RX1VsMgMp7gxfcTBUK8fA8HpHwVpQf7ph9PYj2hy+04p9LPxeiCKrAQgxse5a3RN
 1gbYucZbEq3ex+HfYwJnIhk7kgVzRon0c80lR2EJRdvF9H3pIocmRRBqaFHWmCFhtz+k
 Nbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765898181; x=1766502981;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Prk++bNPBbw7llSvdyWuyKrdatVuaHMUXvtiIeDQebI=;
 b=Rrj3ZWpSTT63qDb8c5b6Vw9wV3l08Gr0s6ftQoBpHNNMDjJCg4mlQWhMLzEdfjsZLy
 zLbmJuyozx59ZQvtr07m3aL4l/40vTs+RBKzuNbJ2NiAwewXZGYK9fz6yOL64AdIBhd9
 adReEZbrHZKHROUEPgLWZPXfGgh2iBrFA2C8gXZCT5nDJF9GY1Bl6krRkbP9iullByqh
 X8l2PfDOkm232rS/UPDi3kKucrpoG213SZNLLw4QKH0phqJHSazfgju3MgGHY5fyQxd4
 l3LoG5EM0qThMiHi1y9brVmuv3/MtFZaaNRPGn4g7fPy0WUb8kPOX39FP9N4dMf4UeXE
 6ZjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaTxsoROFhckS6o4JxfBItx+lmbPLppDPwWvbEuSwZ0pUgnRHLMnv9JkSSrZbFPnIGBsM8/kEkZC8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy531esVJAB9vFQOCJb/K9Tpi3yKmw1WLu8bbDO/bADb5J+hTE1
 CvFwCs356sb/tfmpYKHfRYl7dp2ybbxIMGpN59skxgpNr5Z1mjgpIT7bys1OX7mg5vCTlZGZaWS
 hN9G9zdpUUaeyxuVqH5mqjp3TttT0YqE=
X-Gm-Gg: AY/fxX6a3tfh04jN8erbp6jGRs+tkyuKs/gGMENEfqhf9s+OslPt/+YUjjaJWEmRYnM
 oukCh8TjLgm9FQCGPNXexdmODDTsAxpVb2CK2ntSFYC1eSiYXK6EdKm3KapYDYrrpezLrktGPJg
 DWX/j46V/oYOtglYcuL9SG1jZjvW84l+R5EHaDc+iJkr+Bygy2jqdbRt5TGa/QARKhH9I8y78qK
 ozdq2tvu0BprHCQ89KBoL5dJIrFxmrEQEyxZOj7U5KTv3+CAPQECQfYMLXmzrg9THzoM20P
X-Google-Smtp-Source: AGHT+IExL4bbWd8dGz3R1du6C5PQxAQFN3higbgXbHR2p3Vd8GWbSJj78l5nGqz1hyDQKAFC7gD/XLUbhsxrspplMLo=
X-Received: by 2002:a05:7022:698f:b0:119:e56b:c3f1 with SMTP id
 a92af1059eb24-11f34bd3d6cmr7088129c88.1.1765898180806; Tue, 16 Dec 2025
 07:16:20 -0800 (PST)
MIME-Version: 1.0
References: <20251213-dml-dcn30-avoid-clang-frame-larger-than-v1-0-dd3d74b76a17@kernel.org>
In-Reply-To: <20251213-dml-dcn30-avoid-clang-frame-larger-than-v1-0-dd3d74b76a17@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 Dec 2025 10:16:09 -0500
X-Gm-Features: AQt7F2o9ouuY7f1i8nUGZF2nlb34bshqvLmZP02ymrNXjm02AX6gvFlIqpRP0n0
Message-ID: <CADnq5_PLd_v9n=dHFmAdPcWY2NbbyCocOtE-9CoMX4D1H4sL+w@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/amd/display: Address -Wframe-larger-than with
 clang-22
To: Nathan Chancellor <nathan@kernel.org>
Cc: Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev
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

On Sat, Dec 13, 2025 at 6:04=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi all,
>
> This series addresses a new instance of -Wframe-larger-than in
> drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c with
> clang-22 (current main). This is similar to previous fixes that I have
> done in other dml folders such as:
>
>   a3fef74b1d48 ("drm/amd/display: Reduce number of arguments of dml32_Cal=
culatePrefetchSchedule()")
>   c4be0ac987f2 ("drm/amd/display: Reduce number of arguments of dml32_Cal=
culateWatermarksMALLUseAndDRAMSpeedChangeSupport()")
>
> This was done fairly mechanically, so let me know if there are any
> issues, as it has only been build tested.

I'll run the patches through CI and if they pass, I'll apply them.

Thanks!

Alex

>
> ---
> Nathan Chancellor (2):
>       drm/amd/display: Reduce number of arguments of dcn30's CalculatePre=
fetchSchedule()
>       drm/amd/display: Reduce number of arguments of dcn30's CalculateWat=
ermarksAndDRAMSpeedChangeSupport()
>
>  .../amd/display/dc/dml/dcn30/display_mode_vba_30.c | 545 ++++++---------=
------
>  1 file changed, 139 insertions(+), 406 deletions(-)
> ---
> base-commit: f24e96d69f5b9eb0f3b9c49e53c385c50729edfd
> change-id: 20251213-dml-dcn30-avoid-clang-frame-larger-than-36afd349190b
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
