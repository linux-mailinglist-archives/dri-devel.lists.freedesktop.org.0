Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F739958FA0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 23:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657DF10E4B0;
	Tue, 20 Aug 2024 21:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="eda6XM8d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D255C10E4E2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 21:25:09 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a7aabb71bb2so658413866b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 14:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724189107; x=1724793907;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eLr3Sp9hILIFM7YEA6veudfeiN2EX53d+215jFnEYFQ=;
 b=eda6XM8dihqfCqb/W09olgxhcBoYecfV3+ZeP6RcU74cJet9AZzRlbDW/4bmYYUdoV
 ZSG24++iwoMsyYr2U3VMikBxJ8+jfNFAmHXFU988g/NrFDHp9uJ+3+fZkdUrVv4W+Otf
 7ADAh7P/IrVW/hMVMQToWOUcUY+HEU6PQN71M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724189107; x=1724793907;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eLr3Sp9hILIFM7YEA6veudfeiN2EX53d+215jFnEYFQ=;
 b=aFFTICBs6Nk4ws2a/PIavBwT4qosvEjlnHx0FFLsVhos3vRjLHWHbFok3yWkwBYFO2
 v38jeaGHIC1dI76MFYk7fjzyHZkH4mIRD3W9d2TIUd8mh79u457+y5VoxITwT9SYzr2u
 UInmkIZ3YblmxcLrEo0UrxO26RmTL4paQzij9MN3L/3E7yAd2asBZ3wccArXeyBmDooQ
 4Obr5eDvkcS9vaCgxD4scPf9zqQNqh91auxwG+OwGzZ0eOyW4ZCvD6RvpfjOUO2BK3jb
 Jy+k+AdSC6Ak3P/o4uIUnd9Zy8mEZEdny1qB1cmWj/a1jGS0aXeXYjuCAB2KozqhZE0n
 acEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmETqA8v/x5PjrV+bhMFotOiwmRoKucHIkxBs81L4VYqskzw0r/hfZca0xzhyt7WCtFRya0ed+XLk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVvVXP7k3CO7Su1ouQ7SC/raJGN0DQt+cpsGgK3EO0GxKLaJmw
 dNn17D8aWLZ+5DQRa4vs5Ms+UwRgvsfmC0HUQ/mKs6eNLhYRQXjG52v0hrB39z1QzJw9dGxnaMV
 Uaw==
X-Google-Smtp-Source: AGHT+IEZQ8ABkbHfkFHPdqr5rtOhWoGpht0XbU5w/mle4kaVBEo9fbs2Ag7RIGgFWEHJpTpJQmDjZg==
X-Received: by 2002:a17:907:e6e4:b0:a77:abe5:5f47 with SMTP id
 a640c23a62f3a-a866f9f01eemr23756866b.63.1724189107263; 
 Tue, 20 Aug 2024 14:25:07 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a838394a56fsm806655066b.167.2024.08.20.14.25.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 14:25:05 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3718e416297so2778500f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 14:25:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVCSP088yNU9mvSGssZuDabFeFUdrZF9iQQKkyvIYkeuaBUu8GHkCi9UACC8lLMzLUYkhvuXNfGvBo=@lists.freedesktop.org
X-Received: by 2002:adf:e0d0:0:b0:371:7db6:89df with SMTP id
 ffacd0b85a97d-372fd5abb45mr141748f8f.31.1724189104354; Tue, 20 Aug 2024
 14:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240818060816.848784-1-tejasvipin76@gmail.com>
 <20240818060816.848784-2-tejasvipin76@gmail.com>
In-Reply-To: <20240818060816.848784-2-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 20 Aug 2024 14:24:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XuF=WVMd7AsyhUcrn9P_O0YQDjUQuCDfArXZV=ZTeuMw@mail.gmail.com>
Message-ID: <CAD=FV=XuF=WVMd7AsyhUcrn9P_O0YQDjUQuCDfArXZV=ZTeuMw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/mipi-dsi: Add
 mipi_dsi_dcs_set_tear_scanline_multi
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
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

On Sat, Aug 17, 2024 at 11:08=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.co=
m> wrote:
>
> mipi_dsi_dcs_set_tear_scanline_multi can heavily benefit from being
> converted to a multi style function as it is often called in the context =
of
> similar functions.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 31 +++++++++++++++++++++++++++++++
>  include/drm/drm_mipi_dsi.h     |  2 ++
>  2 files changed, 33 insertions(+)

Since I adjusted the whitespace on the previous patch when applying I
had to adjust this one to fix the merge conflict. Then I also fixed
the whitespace on this patch since the DRM tools run checkpatch in a
more strict mode. :P

In any case, pushed to drm-misc-next.

[1/2] drm/mipi-dsi: Add mipi_dsi_dcs_set_tear_scanline_multi
      commit: 051c86afc342aed1f84d66ff5d09dc9e1c1685a1
