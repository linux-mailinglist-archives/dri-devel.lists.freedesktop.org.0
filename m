Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5911090E3F5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 09:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BC110E9B1;
	Wed, 19 Jun 2024 07:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UzBxMlfr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8662110E9B6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:05:13 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e02c4983bfaso255618276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 00:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718780712; x=1719385512; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fkApUyq4661XB0S5M024vzKYelC21nq0nL2JJnK6W80=;
 b=UzBxMlfr7t9mKTEQi/CCqCN+DQKsXnb+SddDLpLCvlkNEtzu9fSR/eeGg4W5i7fEQx
 amqFofSRk1AgmSlmUNad/2NIzI/V1k85e0fAeIKzwWK7UsypyDWodAnCt9U9ssudUy2B
 gV+zvoqzIBylEPVWif67FbVY9zrcRpuVZT9x+ckCwh/aqCF9Dc9QqWJT9DFeiuGXS8Ob
 nBTO/vO8hdwvf0AgDpSHQRFzRGi6aLuaQDnDlS+dUwxbVTnWP/qx1qoUQA4ny1y32xm5
 LuKL1qpkuTplevT2oVzYMD030MWutujEkOBS0wFaMyVZ5y5lSI4OaprqHYsJrMQ2E5SG
 q0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718780712; x=1719385512;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fkApUyq4661XB0S5M024vzKYelC21nq0nL2JJnK6W80=;
 b=C7y7J4R9iL8CZ2rp1bi9k48jJJJGD+bdYxd0EpelxSbNW4hJIKBfrWtksKX15VsUnt
 1y0N9tWeia4+LzB1QVl/PP0qwg0CffGp/srlDfj9nGLX879s263YUOdTdn9SVM8gpG9Z
 maI7KoxvOC+rEn3gjQ3an9TQbwsYteF4geD1SdPchgOBBSu/a8WAzwbSQfk4UZBa/JqC
 QHQM2W5w2CuOEwvHCnr7aA1Tp3roNFFUskW5EVYiY445cB6bY45hdWAcTecQGko0QMCM
 XoutNQcPnM9Jpq4WixSEjYGqxyrLa4UuDx64+QlV8s/n9iP5Ty6tfYUMk/EKlnlUefj/
 WXkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE9dXxD2BjRZwwcoBr24k9scRDZ5WdCO5E3YjSawWx4hN1xuulqoRVUcJaCbJWuifd4VGuykf/A0PPMOulGBweMyVynP7RW0aaF3apjGwb
X-Gm-Message-State: AOJu0Yxcyyp4/KuQh9HrjwRxaRjXyqG4pkxyT7Mh79RPfYNIciqOllug
 0VS1nHVdiiGxT8nYZA1VMH9m/WHmZGmb8MUKqlz0kUhDUWyaY2Kx3+3IlIDGhEWcXvSRpfnbCtT
 S4sSFGYwj4wcs6brJkVrZsdkfAXqykcaciEaIPg==
X-Google-Smtp-Source: AGHT+IG4sbbowz2oRR6gmRouJDUmd7eUdivK4bF3a5N6Vmj6voe6Jh1AZr4utLY6DC/DcbpG2kflee5f733GsJK83/w=
X-Received: by 2002:a25:81c6:0:b0:e02:b580:d0b with SMTP id
 3f1490d57ef6-e02be203e4dmr2083486276.40.1718780712294; Wed, 19 Jun 2024
 00:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240612064731.25651-1-quic_ekangupt@quicinc.com>
 <zbpia232dh4ojfsvhcqxrp6cwfygaalu5cycdrs47pqmnrisvk@dq24nww26gkm>
 <00b2c65e-c00e-48bf-b118-4785d216cd19@quicinc.com>
 <CAA8EJprOf9vvdBcdX=Xem3UMFo2pmh37ooreqRX0Bzvadv_yTQ@mail.gmail.com>
 <9fc370be-89f4-4006-a4c0-1040dadfe4cd@quicinc.com>
In-Reply-To: <9fc370be-89f4-4006-a4c0-1040dadfe4cd@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 19 Jun 2024 10:05:00 +0300
Message-ID: <CAA8EJpoqWvL5z4cG0EBEm1eXWUQ=qP0RmedfLbqiFaOjYX7kWQ@mail.gmail.com>
Subject: Re: [PATCH v1] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, srinivas.kandagatla@linaro.org, 
 linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org, 
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 19 Jun 2024 at 10:01, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
>
>
>
> On 6/19/2024 12:21 PM, Dmitry Baryshkov wrote:
> > On Wed, 19 Jun 2024 at 09:45, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
> >>
> >>
> >> On 6/12/2024 11:58 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Jun 12, 2024 at 12:17:28PM +0530, Ekansh Gupta wrote:
> >>>> Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
> >>>> to be added for PD notifications and other missing features. Adding
> >>>> and maintaining new files from within fastrpc directory would be easy.
> >>>>
> >>>> Example of feature that is being planned to be introduced in a new C
> >>>> file:
> >>>> https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
> >>>>
> >>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >>>> ---
> >>>>  MAINTAINERS                          |  2 +-
> >>>>  drivers/misc/Kconfig                 | 13 +------------
> >>>>  drivers/misc/Makefile                |  2 +-
> >>>>  drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
> >>>>  drivers/misc/fastrpc/Makefile        |  2 ++
> >>>>  drivers/misc/{ => fastrpc}/fastrpc.c |  0
> >>>>  6 files changed, 21 insertions(+), 14 deletions(-)
> >>>>  create mode 100644 drivers/misc/fastrpc/Kconfig
> >>>>  create mode 100644 drivers/misc/fastrpc/Makefile
> >>>>  rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)
> >>> Please consider whether it makes sense to move to drivers/accel instead
> >>> (and possibly writing a better Kconfig entry, specifying that the driver
> >>> is to be used to offload execution to the DSP).
> >> Planning to keep the driver to misc/ only as part of this patch. Moving to accel/ might
> >> introduce some conventions to be followed which might require significant changes
> >> in driver.
> > To me this sounds like "we are trying to avoid following the
> > conventions by hiding in the shadows".
> Not trying to avoid, just trying to look into this separately as the need to take ABI also in account which
> includes current device nodes and the uapi header which is present in uapi/misc/fastrpc.h whereas I see all
> accel driver uapi headers are part of uapi/drm/.

I'd say this depends on the accel/ maintainer's opinion.

>
> Will be taking inputs from fastrpc maintainers also.
> >> I'll write more meaningful Kconfig entry in next spin.
> >>
>


-- 
With best wishes
Dmitry
