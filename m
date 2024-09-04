Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C1296C5C4
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 19:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900EA10E7A5;
	Wed,  4 Sep 2024 17:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HnrhcsUn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C378910E7A5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 17:53:03 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6c35b545b41so9622146d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 10:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1725472382; x=1726077182;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AdW1fsDt98LP9wqqPeshnNEnMDj0upLQiCewBOyDU1g=;
 b=HnrhcsUnAPsmIDWO+Tt/odOlex9ZSCwareWYsZ3Ha5SQnr9Af9T7vE4HOtet+P+jsU
 h/jx63FGB5AtDj6J+uiqaT5VNOO6gQzraWK2JsP8lFoZwBBJGRj2j2H173woDHiw0g5u
 nAhywH3kSa+RX00DgvgdFM78+9EHmOzCTv9dY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725472382; x=1726077182;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AdW1fsDt98LP9wqqPeshnNEnMDj0upLQiCewBOyDU1g=;
 b=hoOvhqD/4I+izAeneHlRWtiYJpdJffVTiTg+YlUx5cHeHuUFVMgajiQJTOP4gVLwrY
 D16c34YMskKbX5i2JWkUa1kS5Onx6VZRv3lmnC3pLF00tJfoZq5fCe8QvHSZEIwjidHX
 NM/cYUvGiDuE32V8uzA5WQABb83/yB3Sk0aUh3IZFz5wQB4bprlTUojKZ2oPzufAChQa
 930/YQPWdDgVSueQFdWALV3Tv3ijMB3CRH9qebNrCNTZEKaoQbDdUJyDJMnziPQnVdS9
 Y1UDXLIKSrEQKVzka6l1/mJk1oOupO9MwsFa8czA1iQYvw0jnsypJbCj83jEnP6oXgQh
 oEeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLQQNBBzjJz4wonAyiE83wbBNXp48fJS1OhrQ58v0qF6XBh+5JXMrfP6Me9mDd/sFfVMng1Ud5RvY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOpM4Pl8oLCYxuq7bPVQrEmX8zBlAZGkTiacWiTu5l1SFKx6cP
 wr0LLBTWxSt3TAoTnzxROSxZjrD5Yo7sAKbJfgjLMHDyPclgBceLcbmzwV+LxTp0tR4iU9LndV8
 =
X-Google-Smtp-Source: AGHT+IFaBcHiMgl+LZeIiK87KWbUC9IEbWHqkg1IPMV2tvEpHB1BZy3rjr72RrqGo1bzp7Mr4eUeGg==
X-Received: by 2002:a05:6214:5b83:b0:6c3:57c5:b808 with SMTP id
 6a1803df08f44-6c518efe5f6mr53490906d6.15.1725472382025; 
 Wed, 04 Sep 2024 10:53:02 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com.
 [209.85.219.52]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c5201dee3csm319916d6.14.2024.09.04.10.53.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 10:53:01 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6c3552ce7faso9628236d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 10:53:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXUCW1TImuiSR0HqM0xI649suIm6cu+L0djrx2uZaRSDyWhHEyGgGT7S2tUw1Peg7nmzksaShaDo40=@lists.freedesktop.org
X-Received: by 2002:a05:6214:5096:b0:6c3:5ff2:7db3 with SMTP id
 6a1803df08f44-6c518def5f3mr55548526d6.9.1725472380537; Wed, 04 Sep 2024
 10:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240904141521.554451-1-tejasvipin76@gmail.com>
In-Reply-To: <20240904141521.554451-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Sep 2024 10:52:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XBDowrFSEKHq9Qc3rJ3kurkn4NeibAW7wR3_nCdvzDYA@mail.gmail.com>
Message-ID: <CAD=FV=XBDowrFSEKHq9Qc3rJ3kurkn4NeibAW7wR3_nCdvzDYA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: himax-hx83112a: transition to mipi_dsi wrapped
 functions
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

On Wed, Sep 4, 2024 at 7:15=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com>=
 wrote:
>
> Changes the himax-hx83112a panel to use multi style functions for
> improved error handling.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx83112a.c | 297 +++++++++----------
>  1 file changed, 136 insertions(+), 161 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
