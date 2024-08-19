Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C1095701B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 18:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C436D10E0E3;
	Mon, 19 Aug 2024 16:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fKDtoBjD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218C610E0E3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 16:22:40 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52efd530a4eso6967658e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724084557; x=1724689357;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eq6CqCexN7qwRZZu9MMa8QuaMBEJlO3dqJ9z90a/SMY=;
 b=fKDtoBjDerFUR3exSMrGEFPdbPar9L4oe+j0Di/+rX32QM4m1hQfAVkMlvXALm6OnV
 YV6Lk+LsTcA3HvklBt25frBmP55tvpLxeVSMaVWGPP6uE+07AUSsEbU0w4D4GcG84esa
 SrcnqGLAe+YhCtruMZ0rtd8gnk0Nmqbo6X7kY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724084557; x=1724689357;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eq6CqCexN7qwRZZu9MMa8QuaMBEJlO3dqJ9z90a/SMY=;
 b=nyXcWCKG5lJEhvvz/+m0gWFvbnXRq+pHaZF30tQHph9hCIfnxT0ek4R8sov/AXMmiS
 iksM1RtFAtNhVUe2ar6I0TEIKjIm5rTc4xBIvjW4VoizNcbkvW/gwKJ0hD1k/2nk0XNB
 mruOq2aVUM1Uxb61KDKCb/5rWmtyOLMYyYpKpPBbEUGXbHsKAzKDrvXSwd13tk7d05K8
 2KhiN42/NfZmzM+/iAE8DHR1z9HWYeQzXsBGmnKv8EVDNmPUdixrC2ujIH2D+CwBW6CF
 5SLE8Bpd71W6hzPrYpZ0YJVdF/UJ0TO852KUV480xUftS13IwklYBJxY8ZfWMuuTDu9G
 nDsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6dfJhsbXj/OXNn42hvNmESBuxHADyAVC+ceyeqCzVkLJxEeb/EAFK+Q/+t3GYrH/h2XFfrhZUv+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycQmlAUbBYODRPjJ2yQtmXZqY8LRUJDNAZkMj9FLMt97HfxO3j
 8uxa4iIBvC+eLZ2KetjJAuBomhy6xRMzUnjOuxbIwarBo8kS2f/yjvSNAmMp1RZdjovDAjn/7Qe
 KCw==
X-Google-Smtp-Source: AGHT+IGi+/QF++W3M/nJAmyDKcvByLpt5qvaOsWeveCd7QKfQAnkIsIS+bWfaM0Tajup9WJbz4BwIQ==
X-Received: by 2002:a05:6512:31d6:b0:52e:fd53:a251 with SMTP id
 2adb3069b0e04-5331c6f599dmr7751663e87.59.1724084556646; 
 Mon, 19 Aug 2024 09:22:36 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5330d3b8f1asm1522157e87.91.2024.08.19.09.22.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 09:22:35 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42816ca797fso36900435e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:22:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVpPglHuYNPoGnf9ID+2KyQz9Vh8DHM4SBZfvvMGmz6YG5j/zlyaRr3mMbp2JrAq+SWeFRdNhTDCSQ=@lists.freedesktop.org
X-Received: by 2002:a5d:5e0c:0:b0:371:a844:d332 with SMTP id
 ffacd0b85a97d-371a844d589mr4254441f8f.46.1724084554233; Mon, 19 Aug 2024
 09:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240818060816.848784-1-tejasvipin76@gmail.com>
In-Reply-To: <20240818060816.848784-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 19 Aug 2024 09:22:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WaSyEC=Tu6CoUUGR9YDWpfOUTx84NmVPe1kbjL=O4ZSg@mail.gmail.com>
Message-ID: <CAD=FV=WaSyEC=Tu6CoUUGR9YDWpfOUTx84NmVPe1kbjL=O4ZSg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] extend "multi" functions and use them in
 jdi-fhd-r63452
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
> This patch adds mipi_dsi_dcs_set_tear_scanline_multi to the list of multi
> functions and uses it with other multi functions in the jdi-fhd-r63452
> panel.
>
> This patch uses functions introduced in [1] and must be applied after
> it.
>
> [1] https://lore.kernel.org/all/20240806135949.468636-1-tejasvipin76@gmai=
l.com/
> ---
> Changes in v3:
>     - use mipi_dsi_usleep_range

Oh! Thanks for updating this. I had been debating whether we should
add mipi_dsi_usleep_range() but hadn't noticed that someone already
had. Nice! :-) I think this series is pretty much ready to apply, but
I'll give it one more day (or Neil can apply them if he's good w/
them).

-Doug
