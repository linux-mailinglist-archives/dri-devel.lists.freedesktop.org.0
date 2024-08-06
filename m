Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC06949920
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 22:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C950910E3FE;
	Tue,  6 Aug 2024 20:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="bPcEQ0c5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9C010E3FB
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 20:30:54 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1fc491f9b55so8745025ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 13:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1722976254; x=1723581054;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pGjOP1lRrUIGHHfY/ucyJaa3OokEJdc3Rk3ANgx/cL4=;
 b=bPcEQ0c5HJ8hGYiBBOv4EZoztJlZ5W/fq14FW3+FgPO88/l0iDXXWCX90PLFMADT9b
 8kXkqiqSo224tXei8OkBcaYApwUtKvu7DXlsPbtER4WXakYiCYwCDEXy1rjdtYoTIFf2
 iNkmp5dbmwrMK+zhslgW8lOfyIsOEfh6sg7XZTJe0NA5vJUR5YrnlCj1bSctgPJkGnGb
 s5pbIL+MQTM2W5yDP3O/HPOczzGUmlRUcXm1Kd0aoEp7ijGEGpD7cGM86gJIHFc8o1uo
 nhYPcqyhK7Px7WQprwe8tb8cYbDDgjBLNkYXMB2TONaBvsWlKWSChgvK4426olIU3GYY
 UjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722976254; x=1723581054;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pGjOP1lRrUIGHHfY/ucyJaa3OokEJdc3Rk3ANgx/cL4=;
 b=Jtu/cIOBq+xw6bTUs653ZwnYdpCGASyhhxsPfXPH0JjRinrEZx9pVHvMVs2Hb6B5oB
 crlqstz1KW9f6wCSWkWSmJJnLSopWCgk6TEb7X+N+5RjkXm1+YVUxAzUPy3AN4qd7LxU
 I8npCbdH1QWMA65KLWhwPrwCI8ae5aCf5CtALNgjt7vmxEtx2AsxNz+h53N0tyrNKMKD
 TaSlx90J/1G8ycfjo4fkoGEpGre+g7S8zVxdwfH5E41gRQK1W1oVVj0HO7QQWTW+UTWG
 o3K3skfg7jf23/AoeiP0hLkN/7A3CWUMj4wyn3CEKVaNm2SXBtyzVmgS214Ts0Zpa6sq
 925g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMNn7lnW9WKcyDLg8EKam+4esoZ3gLswcOFp/8aOqj9uLcUPBKmknM52uFZAIScYJGGw0H1+zj5iDc2y2yU4z1GFWFJcMnQXDKBM503B5Y
X-Gm-Message-State: AOJu0Yy+85uTX6XopEyBdYa8EZ3fCG24UR1AW/mvL8ygByACZnIAgry2
 LzrnK5RERVY2GaMKejx+NZ1cNlPPj57VGR46hKFltZhnKFGcT69uK7l0z8JR/tm33b5OSc4YC7j
 b7em8Panuw3IFBxcB1tzeYn+ccfE=
X-Google-Smtp-Source: AGHT+IEks/oAZa8ntL5YZ2Jy/KZVr3ukaB2BFUAtpfcEpVrc9hTXXkB88UBCo3OXbZXNdpKSoeO+mLzLsyC2xIw91ds=
X-Received: by 2002:a17:903:18a:b0:1fd:9c2d:2f17 with SMTP id
 d9443c01a7336-1ff573bb69bmr145408745ad.44.1722976253993; Tue, 06 Aug 2024
 13:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240730125023.710237-1-jbrunet@baylibre.com>
 <20240730125023.710237-5-jbrunet@baylibre.com>
In-Reply-To: <20240730125023.710237-5-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Aug 2024 22:30:42 +0200
Message-ID: <CAFBinCDun9kgPO9ko9seFvWxjZvHwpRO=SaPrdxT1_Yh-FzXVg@mail.gmail.com>
Subject: Re: [PATCH 4/9] drm/meson: dw-hdmi: fix incorrect comment in suspend
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Tue, Jul 30, 2024 at 2:50=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> Comment in suspend says TOP is put in suspend, but the register
> poke following is actually de-asserting the reset, like in init.
>
> It is doing the opposite of what the comment says.
>
> Align the comment with what the code is doing for now and add
> a FIXME note to sort this out later
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
(based on public S912 and A311 datasheets)
