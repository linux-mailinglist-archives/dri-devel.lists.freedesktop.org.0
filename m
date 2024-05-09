Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6898C0869
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 02:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2300C10E23E;
	Thu,  9 May 2024 00:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dnDCf7sQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642FA10E0EB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 00:28:36 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-51f17ac14daso340705e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 17:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715214513; x=1715819313;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZNeX2fBf0OvUGSKCQhqRKM/UWS2VcuqiFL3hMwMX2kY=;
 b=dnDCf7sQBgwV/z70GBxvcPibkF0dZxUK4GTuVS1le35KoewGPbmCm3PZlD4ajzs6To
 pHexLPusx5pzjBKpMfaTfhzKgV9qTxaA29jUrX+0NKr87JwXVxnVafgygCTnhLDwd/Ts
 wui95Cr1FqfSGHanBtrv525LderVUvcxR8VT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715214513; x=1715819313;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZNeX2fBf0OvUGSKCQhqRKM/UWS2VcuqiFL3hMwMX2kY=;
 b=rTBdmcKPsDokG6CQ9XuS1Up1Y21xZ+bBVbfyMNhcgrF9JyUOb02FduFYkqW67Sc6wY
 IGV7/f3Rhd9w1B0abSr9pUKvDiJkv7KW7Ys85oFaX66a+mOAQ0kS4BUQh32uymLXgdBa
 xd5K7w5/xGBKXUaGoz/EWuaGic1Ap2fAmao8bOeqAgdhPayfzDd2ianIAjz9VyxO/WlM
 Ro7bvsyPVW2z2r7yJ4q5hBAM93DYrid3c4XAoTWSzQRJzcqksoB0OUK4mThpJR1E5XSO
 QCJzyu6e8GFI9Ci+695pq8CDE1r1hIY+p6+V7vHHODiL0om1hI3HBlw4jpu4ddfV4iyH
 ZkEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3hfxRUzDHTB2NNteaBmk0DYk1JvHAfEZtM/1nB8UXo13xDrxViuSlVZzco0544ZrxiLJv4UGoaQfZ7dl5K+y0RW5P696TRqnl/fYMpb+i
X-Gm-Message-State: AOJu0Yz9pxvorXJE5doZnOdaaUV649Wu8QWqRPsVtnYLQvmlyePmOg+g
 /0XLe+JZYSI/i2HdSQxxsGpoj/MHSiHGAlNov4ibo6SiCSTG1N/s1SW+ZnAHGIBjU5eVFxVBwFc
 5oO/s
X-Google-Smtp-Source: AGHT+IHYYXzBOe4FCxSS1QDIv+B3rFd7sAAG2fGyV6HMNYB//SYlx2Z0eSVNs0TCzIFhoejqqoGdyQ==
X-Received: by 2002:ac2:5211:0:b0:520:ed4e:2200 with SMTP id
 2adb3069b0e04-5217cd49625mr2466613e87.54.1715214512722; 
 Wed, 08 May 2024 17:28:32 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c814dsm15038166b.118.2024.05.08.17.28.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 17:28:32 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-41a428374b9so17825e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 17:28:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ5qG5/3eXPPt5pc+46AQzIPH76NdSDUod3zYgcRw+KrWFSNvMOAkrOudBlsoK0sWZErFadTSSi3nqdNGT8kLcI4C+/TAjOi8mO2B57l9k
X-Received: by 2002:a05:600c:35d1:b0:41f:a15d:2228 with SMTP id
 5b1f17b1804b1-41fc26b9f66mr933245e9.0.1715214511425; Wed, 08 May 2024
 17:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 May 2024 17:28:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xa6LJEWZwdUXvFVPQ0-qnDZroDi6tkZaLFHiarJ2gyew@mail.gmail.com>
Message-ID: <CAD=FV=Xa6LJEWZwdUXvFVPQ0-qnDZroDi6tkZaLFHiarJ2gyew@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: remove python 3.9 dependency for compiling msm
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, 
 swboyd@chromium.org, quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org, 
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

On Tue, May 7, 2024 at 4:05=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicinc=
.com> wrote:
>
> Since commit 5acf49119630 ("drm/msm: import gen_header.py script from Mes=
a"),
> compilation is broken on machines having python versions older than 3.9
> due to dependency on argparse.BooleanOptionalAction.
>
> Switch to use simple bool for the validate flag to remove the dependency.
>
> Fixes: 5acf49119630 ("drm/msm: import gen_header.py script from Mesa")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

No idea if we're supposed to allow python as a build dependency. That
being said, I can confirm that this fixes the problem for me since I
ran into it too [1].

Tested-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/CAD=3DFV=3DXnpS-=3DCookKxzFM8og9WCSEMxfESmfTY=
H811438qg4ng@mail.gmail.com
