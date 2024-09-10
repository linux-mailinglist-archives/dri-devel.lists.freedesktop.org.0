Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 316459744D3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 23:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F2710E928;
	Tue, 10 Sep 2024 21:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="m4U5lVrr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77A010E928
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 21:30:13 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7a9ab721058so24016485a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 14:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1726003812; x=1726608612;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KNsOiBCl7SIooxW2ujNpj2hyBxCkDrdHM2De6QCq9rs=;
 b=m4U5lVrrm5kVfCFGmbFINVSE7HPtlbRn6JZjHaAuc/rJzCcBUCWdhQppi2Vad7Ss+5
 Bhay/0nu+ni4JI44x8lVpSDBHGC7akprXUta1BOLMtnZUs1d0JBFlGtWJorkGD019FHS
 XMLy4NjfJiAFCRx6mF1jocQShNUbKYF98POHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726003812; x=1726608612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KNsOiBCl7SIooxW2ujNpj2hyBxCkDrdHM2De6QCq9rs=;
 b=rEEZaxod1PqyRFY4MBdRdWb58LHbStBGrtS5uEHeQ8Q2H+JCxifbKhoE9Slf0vwOUr
 lsz1BfAsVle0CuOER7nexCR+buFDnUggG416sbdNPhxkF4gzNSZ+KHdvLEXCNf3uyq3a
 Gn0fYKk8HFt4YBvOUWuDfonIqA5wKnPjO2l2W9Obw2+/u5x0O/ghqkCpHSJsdkGlftjd
 rUcB87+KxyoMzr+1cJmQUoymJCEWsKYr/d+Au7Igq8x++Mv3ufb3mBgvALMV9u5aJfO9
 NT0MQwAc8w2ioULY53YIgoZGtaAQdzfxjgOswtag0hEArEuHRwccurpfXqyLMqfLD4O6
 RAMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1ZyxydGPNb+s81bh4tX6I5idlwTyxZHkNhYJvDjMhv+FL4Lel6NWWHQSL6hQ1jxNijraFRZfqMlw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPL/sGFfWqToc4k/T90oxfANlcGQis/PJ/jtrlgdAOLyAT/W66
 LLYikvaQK69eS0hrp5YM+yuVodcjrSud4sLMs257iX6chdDiMh/GNUdWm9dXhWQ0FoW+RiRnlpg
 =
X-Google-Smtp-Source: AGHT+IFd5hls4/MF6ZpTDRUnAgC1fsVi5+jD2YKEZ+ZFg4WQRVOeKclO9K1ujni9D6wQyvZorR9K+A==
X-Received: by 2002:a05:620a:3956:b0:7a9:be7a:9242 with SMTP id
 af79cd13be357-7a9bf99281dmr757255585a.28.1726003811960; 
 Tue, 10 Sep 2024 14:30:11 -0700 (PDT)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com.
 [209.85.219.54]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a9a7945667sm344618785a.4.2024.09.10.14.30.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 14:30:11 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6c35b72f943so2475416d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 14:30:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX7v/ScHhdU+NT4X1oLv+2xH0AbpA7CkTpKGoe324h/ZS9gUf4rG8lUv2dAJY/GLzafAX8SWcSyV2E=@lists.freedesktop.org
X-Received: by 2002:a05:6214:268d:b0:6b5:1584:62bf with SMTP id
 6a1803df08f44-6c554d1e20fmr84428226d6.6.1726003810596; Tue, 10 Sep 2024
 14:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240902071019.351158-1-tejasvipin76@gmail.com>
In-Reply-To: <20240902071019.351158-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Sep 2024 14:29:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W4ExYGTDtBgQChGk_1BgSXXWoQKupJLAOcyqU9+Fbkjg@mail.gmail.com>
Message-ID: <CAD=FV=W4ExYGTDtBgQChGk_1BgSXXWoQKupJLAOcyqU9+Fbkjg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: samsung-s6e3fa7: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
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

On Mon, Sep 2, 2024 at 12:10=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> Changes the samsung-s6e3fa7 panel to use multi style functions for
> improved error handling.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c | 71 ++++++-------------
>  1 file changed, 21 insertions(+), 50 deletions(-)

Pushed to drm-misc-next:

[1/1] drm/panel: samsung-s6e3fa7: transition to mipi_dsi wrapped functions
      commit: f327bfdbf6c6d7d8e5402795c7c97fb97c2dcf79

-Doug
