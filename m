Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C602C912E3B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 22:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A97C10E0D8;
	Fri, 21 Jun 2024 20:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="J/SZWcjf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0AC10E0D8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 20:02:47 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-444cd0ee46aso1744891cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 13:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1719000165; x=1719604965;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4/uBKlDZ6s/NosH2EbtFFnSeeJIPIQZN1klDMiCHdsc=;
 b=J/SZWcjf65a2PqP6dIRb+im7tUYIrmb4mOzCdeSLGoY6rGSbcI3F0qvBn+0XpuSc6Y
 9Y8hZsLvDL0fTjWEHUIi5K/kU6iOJQYFmdpINeAlB5jAqdxid9mS1VCcINtAp/zblSeg
 XDR6bo0ObnAdf8i7r4oAKUw9CsNajdZRd77+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719000165; x=1719604965;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4/uBKlDZ6s/NosH2EbtFFnSeeJIPIQZN1klDMiCHdsc=;
 b=AnU8hQFfttkl1wXIHkNDRVdR6TN9nrgS7oVhFyoqdy8Cw5Uxc+g9+LRwpt0/YNu4dN
 686B0w39SCRgXuFvvDk9e2DD2MLXjO2aJvRBibmotIr4L/Hx8ND2OERq0uz9jgg0UgB5
 l3wvo2mulFBvAFbxAhJutjosl4KAGGvmEbf+77/8PGeZhUjug2BDPnU3hNyg7LbTSIAO
 rsH7LNS2u4t8pgWOExUGspNxI9XrmxqsjP3zAuOFYm7SGRc2AaE8O272srMaH3ZUzj+w
 CkBTiEzOJxihMyEB7UaGMbLSwJU/K1RjaFt5yVu56DPKYTFrtFRm7J1SYQoS5jZOrLdx
 vIcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfcFhvbmQNOeXkxZXpHpJ8+ODpVj7vG1HSVJYZls/xgscJpPo5hVe4VpPKU4vYXDAvcXt+2MFV/4UWPIUAFvrBJm+KK5mDXBq3CUUIdfZ1
X-Gm-Message-State: AOJu0YwE9lEYDy7rbg0fOxKlUWUndj/swPCNBbVG9fyQC1I7dWq08a2w
 oE6DRbHUSqFAsBBcsE6EIs1lqygISDens9eCDOTgN2YzfjGqFKv0MAu376sR47peQ7m9DsmE3hg
 =
X-Google-Smtp-Source: AGHT+IElvfqqY6ws+f9Au4JJ/swZEBi4ZvKZiXQXj80QENd+ch2rB+vy0fUwW8DF1z7gG7s5+c8q4w==
X-Received: by 2002:a05:622a:1354:b0:440:279c:f9f3 with SMTP id
 d75a77b69052e-444a7a873bamr105733441cf.40.1719000165574; 
 Fri, 21 Jun 2024 13:02:45 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-444c4b9c348sm12258071cf.14.2024.06.21.13.02.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jun 2024 13:02:44 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-443586c2091so600881cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 13:02:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVEKsy9s+urxlgxFN2UpGCcBmDJi3iBMlMA+LnSW1fSoRX4iq/efnKveeN36oa4b8YSBwxq5jB62PzEQBxTyL1T3pbF+GH7DeOR9o9Yk7sV
X-Received: by 2002:ac8:7d49:0:b0:441:55ac:c490 with SMTP id
 d75a77b69052e-444ce362ac9mr242691cf.20.1719000164202; Fri, 21 Jun 2024
 13:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240621131648.131667-1-tejasvipin76@gmail.com>
In-Reply-To: <20240621131648.131667-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 21 Jun 2024 13:02:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WDA8LTpr84zfTqefFwxpbKC+rVo1BsSAVGVHReC3X0=w@mail.gmail.com>
Message-ID: <CAD=FV=WDA8LTpr84zfTqefFwxpbKC+rVo1BsSAVGVHReC3X0=w@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: asus-z00t-tm5p5-n35596: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
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

On Fri, Jun 21, 2024 at 6:17=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi:
> Introduce mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
> ("drm/mipi-dsi: wrap more functions for streamline handling") for the
> asus-z00t-tm5p5-n35596 panel.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  .../drm/panel/panel-asus-z00t-tm5p5-n35596.c  | 140 ++++++++----------
>  1 file changed, 59 insertions(+), 81 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
