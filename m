Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0968FDCD7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 04:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2153C10E841;
	Thu,  6 Jun 2024 02:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="OQ4VIBiZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35F810E842
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 02:37:25 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4214a7c14c1so26675e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 19:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1717641444; x=1718246244;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xDq/ZYiqvUMpGmnfFROlIKqAnO6GO+2iuQr9cMLLamE=;
 b=OQ4VIBiZt2ehPJY82pcpEgLvGafARePLeIAOgcHLcyKfMm1mGpsq6lCnnlLm6Olvb+
 pPW3u8s/noxoH5d6t7x3KspnGPKThhm/KRCUMv3Au34OIZwSE0GwvzYbmWg67JOKKOMJ
 u+jBMTqPUPz4rWQxr95FOOwx/NYH/JBwfZp4PwCzIUmhEelLg+deR4ofVE/Wrdbr5Oi5
 ZW5Usy5fdBKEHPe4kdrRnYtdK1ldYlabFS3piNyJk6pYbafe43dYhgyfmHeENdhGFTnD
 WS73iR238qRZPh5UrQcNfO9oPUjCPbnIEMdeQpl0zL0zwNh2tekGhTlo5SZ80cHZ5zUB
 yUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717641444; x=1718246244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xDq/ZYiqvUMpGmnfFROlIKqAnO6GO+2iuQr9cMLLamE=;
 b=TxBf795TVS/8ikNAnYcquDz6KgHwuAEnizhZCjNLSgWQHiuY6xgBcEduDAfHNxO02I
 W2+0Gj4zbm4kVVceW0DlEGBypY9KEXHMeGHmnn2A4+aE/CwNhhLvODoOZcywHIkYavSU
 bK8KaxRohvR1uzjIaeSvS0ZNnxnDYCi2nRoZI57i1xfg8N7Ew2jVrLJQr4A7x4Rw323D
 O27D37Q3zQQcIKGdHsOvsElEBcYkI48vlnon8qdz7B83F1uhoOHotGYOSoMGT9ks4B5s
 AG3b/UKUsbQq5OM2pFLkC91BhdpI1FyXF0ip7KrmJwtKif/AARhZTgbf3hR82bKPNEwq
 zj8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs781baK4MSDy+oswsVnSh2ylBGotESIFJ3TD0MCMH2OENaiGvT/SHsr118yEt2r8mKv1p0e/y078TMGKrtgSe5P6bwRIP8w6MoXBDYN0N
X-Gm-Message-State: AOJu0YwzBBZMfdvndDMjajETHnmE8Hhum4EUJ1HjeCL/i3MiGV7dYAgb
 SWO9YU04mhpV9DtE2vNtHMs73uRGAl3NsSKpiGsThmnYcx5wac6Ycf+0quXY7xYJXoPFfdI/mtq
 WIRzQOIo5257W6270EWclyGQrRHFhAvOvC24=
X-Google-Smtp-Source: AGHT+IHaMob5QkMPplPJnTDM+qZg7pZsoKZ3tUHMJRiC4H1J40L0Caw6VHQuvDnoIsS+ROt+MN9cjAZbJk4mBEgVeG0=
X-Received: by 2002:a05:600c:3b1c:b0:41b:e55c:8dca with SMTP id
 5b1f17b1804b1-4215c34b2f8mr642165e9.7.1717641443632; Wed, 05 Jun 2024
 19:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240606020213.49854-1-21cnbao@gmail.com>
In-Reply-To: <20240606020213.49854-1-21cnbao@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 5 Jun 2024 19:37:11 -0700
Message-ID: <CANDhNCpFXKs-z5Ymy=61fTqU3aXj4sM9RTD5_sEB0937CrVJBw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf/heaps: Correct the types of fd_flags and
 heap_flags
To: Barry Song <21cnbao@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org, 
 sumit.semwal@linaro.org, Brian.Starkey@arm.com, 
 benjamin.gaignard@collabora.com, christian.koenig@amd.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 tjmercier@google.com, v-songbaohua@oppo.com, hailong.liu@oppo.com
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

On Wed, Jun 5, 2024 at 7:02=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrote=
:
>
> From: Barry Song <v-songbaohua@oppo.com>
>
> dma_heap_allocation_data defines the UAPI as follows:
>
>  struct dma_heap_allocation_data {
>         __u64 len;
>         __u32 fd;
>         __u32 fd_flags;
>         __u64 heap_flags;
>  };
>
> But dma heaps are casting both fd_flags and heap_flags into
> unsigned long. This patch makes dma heaps - cma heap and
> system heap have consistent types with UAPI.
>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>

Thanks for submitting this additional cleanup!

Acked-by: John Stultz <jstultz@google.com>
