Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F02CC7D042B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 23:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE86610E567;
	Thu, 19 Oct 2023 21:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7772A10E562
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 21:49:49 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53ed4688b9fso153402a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 14:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1697752187; x=1698356987;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EjbyO4SJjTnd1AUbvV5WE6Kpd8PKFlqFC7dLrc64puM=;
 b=OhqaP8jOUn0ZRmbnNFjHvxGvWRp7aMxDTbMvPHVN/faPPBGXMloM9+3mreOwCBSkTs
 7zO8hticsiyAiX4rVgcdw2x2mMyiiVFW+iTOrr1B5CT/s2n7XjvGxjdYCapCsF3jv857
 Y9BrAXD7z749/xCm0Mb4Ggi6Xd4LIQWclym/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697752187; x=1698356987;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EjbyO4SJjTnd1AUbvV5WE6Kpd8PKFlqFC7dLrc64puM=;
 b=T6yEcRyAX5AOQLZScpuUQ2OGb1fsp5q1nlhgH3FKwmn3bU8M6lLKvuoVCXXOfSlI6l
 oH2kJeLp+P9HXka2xBnPdhHVGc6a+2K4mi8tHhDCO7amD+xfAlHKDsUGVjIIhSGsfqgF
 XCcGmPzujG+S4FQOkzI3C2N/vBWn6VnNar7voK5HD4z+NBjAwzLqAco0bMaDdP+Udekt
 OVi3yVTQcj3V8LehwuVhoTvIV7eeLoCbqiPump/dSZCHbcRyi7iArVMe3m9wup8oZFFi
 9tfpY4CSt6B/0BORboZY4II1Gr8UrHxvGBDI47qYD2AcX+HufkkSJ227fPyMWgGVLEW9
 BAXA==
X-Gm-Message-State: AOJu0YyQVL8Pq1hJ93fU8IOMHcjzqqeBCojWSg8t1Qe5tWt0IJYyGLOF
 BTynM9W4UK1jurGPt50exLNUvZl4U0PqyQAhzA9AFw==
X-Google-Smtp-Source: AGHT+IGdlyR+2Ru+Y9jc0buV3zPoFUumYEjTZxB2G99vczyQpC2kCOSa5Dt3mQ7y2h8aZz2cOlc5vA==
X-Received: by 2002:a50:d5d4:0:b0:53f:5b60:8269 with SMTP id
 g20-20020a50d5d4000000b0053f5b608269mr120556edj.33.1697752187103; 
 Thu, 19 Oct 2023 14:49:47 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 w21-20020a50d795000000b0053e4d1cbc6esm276634edi.55.2023.10.19.14.49.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 14:49:46 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-40662119cd0so10265e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 14:49:46 -0700 (PDT)
X-Received: by 2002:a05:600c:358e:b0:405:35bf:7362 with SMTP id
 p14-20020a05600c358e00b0040535bf7362mr35144wmq.0.1697752185862; Thu, 19 Oct
 2023 14:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <20231013091844.804310-1-yangcong5@huaqin.corp-partner.google.com>
 <20231013091844.804310-2-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20231013091844.804310-2-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 19 Oct 2023 14:49:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V3Y6bSkCivGLgmJS7wQ+U=R=43inqKJYVX-e_rrDpjiQ@mail.gmail.com>
Message-ID: <CAD=FV=V3Y6bSkCivGLgmJS7wQ+U=R=43inqKJYVX-e_rrDpjiQ@mail.gmail.com>
Subject: Re: [v4 1/3] drm/panel: ili9882t: Break out as separate driver
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
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
Cc: neil.armstrong@linaro.org, will@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, catalin.marinas@arm.com, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Oct 13, 2023 at 2:19=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The Starry ILI9882t-based panel should never have been part of the boe
> tv101wum driver, it is clearly based on the Ilitek ILI9882t display
> controller and if you look at the custom command sequences for the
> panel these clearly contain the signature Ilitek page switch (0xff)
> commands. The hardware has nothing in common with the other panels
> supported by this driver.
>
> Break this out into a separate driver and config symbol instead.
>
> If the placement here is out of convenience for using similar code,
> we should consider creating a helper library instead.
>
> Co-developed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 371 ---------
>  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 759 ++++++++++++++++++
>  4 files changed, 769 insertions(+), 371 deletions(-)
>  create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c

Pushed to drm-misc-next:

e2450d32e5fb drm/panel: ili9882t: Break out as separate driver
