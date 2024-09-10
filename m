Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87529973997
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 16:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484CC10E81B;
	Tue, 10 Sep 2024 14:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="A3ZGWKKW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F130E10E81B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 14:15:11 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5c3d2f9f896so6014238a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 07:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725977710; x=1726582510; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o12lXWffYA2duKfNkX3xBv+v9fkQ0G/xTm6g4Zkt/HY=;
 b=A3ZGWKKW8RapesKRSx0UeFyQE6DCVHY9JaffQ69OQn8L8qvjQAP+p0koYqnN0jTYsw
 dHPmpl9ElCvc3VvXlY33LpcJ2xBIXVwgPjld0y8KP3erqIwkmmT3xxsSAtsmBI9CAPUS
 qqPsGPcW819ClDj3oKQXZD6z53xjhBp+5stiSGuT4NY2Ymhmx9tJlVNViTdKCS0oD+vO
 6+zj8gYZc/gMqOhzUd2uIyJFmuZlTM1ugdrvWXdcpbGPklyQShprz0abjLVTuJNbTSH4
 6tWG5bVXn0635JX0a2HDJkIT5LYfUynGUAbQTR88C7Z1LnFV9dVJTEAT8xeYaaRwjXyx
 uukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725977710; x=1726582510;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o12lXWffYA2duKfNkX3xBv+v9fkQ0G/xTm6g4Zkt/HY=;
 b=PINO5bVmSWxYVXy6gtVI9W7TByJ90Y07wuGwNhey7/Rwy53Y8W5+faOJVLPAQmo0pz
 IJBNzShvteqV/TTrdcEA8dHcJ2OBEzj17X60w786htuCrzSVCO9Pc7hLIxMHZ/d7cYkk
 d5MFrN59qSUQbSqU7Z1JLscOk7EpMsxtQ10PPUQkp5Kc6XxhucsxiBY/0pxxzzlQ+nyI
 eyFNf4tW4w1iUb6ohKsQxpRiu9S+ufUQDeX2IoJXuW5JYvmyXpPA1L4LkMSQqFniJX7T
 y0cAtGMmyoB6g9sbzzS/ljBtXMskCIcb7B0md7iLnokDrhND7SlVl6rdmqtBFhZwuwMi
 1rJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT79NXaVTzm+bBjMD3F+merxlrj4ePgjpOF5452Ca7IaWdg/dpdff1jgDt6Y2dowJlqzWxY0iCsiU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz62eOPAVo4o2mAE6Qpfs6P10hquy6Wn+KDLlpSQB9X7DgYOZf3
 aVgv+TZ8JLCTirk+J9IrMxf81GnYlIrulC4OdMluGLnJemhJgvZmXBK6RageEQ/07UEPVe5Fazk
 k0v2O/59MNdy2NnmqOxuarhhslKasi+S3L9Ndww==
X-Google-Smtp-Source: AGHT+IFNbnJcv991n6EaGeE+4q5VW27Y2Ncf5QyZ9FldTxQk0HrQFWE/YbOvJOp9f8ir/5TrCOSOe0F83sf2QNM8B9w=
X-Received: by 2002:a05:6402:5cd:b0:5c3:cc7d:c29d with SMTP id
 4fb4d7f45d1cf-5c3e95354abmr7741754a12.6.1725977709882; Tue, 10 Sep 2024
 07:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240906000314.2368749-1-tjmercier@google.com>
 <CANDhNCqudbuWM-WG7jiY_KQfgOZ84nAwWUfUHNzgniBiSZzeyA@mail.gmail.com>
In-Reply-To: <CANDhNCqudbuWM-WG7jiY_KQfgOZ84nAwWUfUHNzgniBiSZzeyA@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 10 Sep 2024 19:44:58 +0530
Message-ID: <CAO_48GES8YytcVyTsm3a_eeL65B41bMnCj=q=e3F6GKg4V-Sew@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Add __init to CMA and system heap
 module_init functions
To: John Stultz <jstultz@google.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
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

Hello,

On Fri, 6 Sept 2024 at 05:47, John Stultz <jstultz@google.com> wrote:
>
> On Thu, Sep 5, 2024 at 5:03=E2=80=AFPM T.J. Mercier <tjmercier@google.com=
> wrote:
> >
> > Shrink the kernel .text a bit after successful initialization of the
> > heaps.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
>
> Acked-by: John Stultz <jstultz@google.com>

Thanks for the patch; pushed to drm-misc-next.

Best,
Sumit.
