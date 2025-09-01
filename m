Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5F9B3EB12
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 17:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5969A10E4DA;
	Mon,  1 Sep 2025 15:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="i7o+GvoY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D6110E4DA
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 15:41:14 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e96eb999262so3293160276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 08:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1756741274;
 x=1757346074; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iHKEov60ZzmVR4/OSBANPJk+KzVHprHoCBj7JSL3kNI=;
 b=i7o+GvoYZ20YpaP+9xd+oLurt0EoPKk+7VBHpAlhveBw3fcWrWO70PZJu02yksrUz6
 gw2hm+L4fjexts1j3NHWTX+bN5m50EOoRIkuhqd5mEfVJI10ty3TAsdrn094xgrTGizO
 9YouWVUSLIRgP7JyA8dbommQr2651RsSviRKOGL61mFvrQEyyN3CPXGMdNUVLPZPvAFE
 K3P/J9QOgXHIxoZ8hXvdJDID5sCvEvoZoVBYR/DjsIBgL6vq3aC55bX9/9aY/p3LPayP
 YeZGyW9A1SYilaRcgsNv9YfxbQ3M8Bd+7i1bvQMc2ZSpB+W6j2w5V4coid5by8s9AsX1
 DiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756741274; x=1757346074;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iHKEov60ZzmVR4/OSBANPJk+KzVHprHoCBj7JSL3kNI=;
 b=HXEzwrfLsxK/9saXlprGU42tQMqH84O559KK4Hlw7WQ4ZQtHR9CjPk+e+86/l1Ojik
 1PgQa9HxfZotqKRVmifkx3dZ+2RURTD4CBlIAzcDKWfVFDK2nzuOgf5QhbibClH4mLyw
 Yzq0FVH6mqqHv9PKPm1c9qkDewj3kJJab4qkNzYMGUDKuLSDiMFzV+4kR8svNCYFZ856
 s8AiagmbpHh/SbdD7QCNlCOlAk+Nrs8vC7Lp1kor898EjoooHANTzWZxFPI2f0kGagRS
 LeXyZDf4vuQmeVgQh/vYG9Gbe8pdGAdVlV9xOfd2YwFx4lYMMaqoPPGzFokVeDayvhzU
 6mJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr2cx2nKwI0WKH/6nrswQN0hDPpT/2j7lwi7BTd5un143B/V3afsrZFpPYWbYqlPCQ3ilnOw058Q0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWOWqyHvnNKWky7J54+dRbz4284/QI3CI3/BXb/tS/7VXEElIa
 4b+GOjrdqKNN/L7sM55Z/VTDIcKlHs0d6GZxY8nDQfooaQtUFin6FpARVIvZu5zn7QTXE0L6ZaT
 /HUtPDTc=
X-Gm-Gg: ASbGncuvSqIT/lximB6TFJDM/RhkC0maRDIhishk3FDyNMIs6OhNej9dJ2no0/r159R
 EuCZda7vc0zwxwxfM6HF9QvarYo/snWHFxhs5CyCtD5f4+/KvXdYMXP+Fq/5Sf9t/tESpS8Y2RX
 yCGiT7npmg/w+qGfYT6wUih8zSHCe7d5xBgq1nRnXd0Yu4cGMfffgxeABv5MvfhrgjITYERPlIO
 /wddH9oKitgR+IKnpXclLmg3zrjUg9nrPxjHiJZ7AhQQi/D00KMzYqtUiih8ZKkCL+2prHIEKSf
 6MVov4QL6RVdRmHtDSkxHZYTMjkTchSJG7waDowpclsBkPVtKrJRh3UqRNpAwTsh8n9rFngGV2X
 OagE930zxTkbvy6SMZgHOuk01if2wKcyP37PiAa30+K1KCpFZMr0U+R+qxJg+Z8VgNL7FddHaUb
 fC
X-Google-Smtp-Source: AGHT+IFIm4QxnA6JGlrxm25eTpJa8GAkHdpfwIVakvSmbjqmZKUzX17RUiScfgbFQmBYI+BfFl0y3g==
X-Received: by 2002:a05:690c:688a:b0:722:6a42:5caa with SMTP id
 00721157ae682-722764effc1mr107399637b3.27.1756741273407; 
 Mon, 01 Sep 2025 08:41:13 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-7227d5d4141sm15811937b3.5.2025.09.01.08.41.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 08:41:13 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-72267c05111so22937877b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 08:41:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXYcDfK7fuq79Zsk6Th9ndkzVnuKHvMH1UicmBEhlyEAPf/L5LvM9j1zK6AWuOdAWgFUskgPyX5kPQ=@lists.freedesktop.org
X-Received: by 2002:a05:690c:dcd:b0:71f:f866:bba4 with SMTP id
 00721157ae682-72276399149mr77541167b3.17.1756741272503; Mon, 01 Sep 2025
 08:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <aKcRW6fsRP_o5C_y@stanley.mountain>
In-Reply-To: <aKcRW6fsRP_o5C_y@stanley.mountain>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 1 Sep 2025 17:41:01 +0200
X-Gmail-Original-Message-ID: <CAAObsKBCPMzXV=2F4M2PrsES1M+0OHA2ZJtmYTuQMPPd1u34Vw@mail.gmail.com>
X-Gm-Features: Ac12FXx7SKvTTtIn3H-UONdlJo2MpxhJozLfBtiot7SO0qywsKGbTt0HEy5Ygf4
Message-ID: <CAAObsKBCPMzXV=2F4M2PrsES1M+0OHA2ZJtmYTuQMPPd1u34Vw@mail.gmail.com>
Subject: Re: [PATCH next] accel/rocket: Fix some error checking in
 rocket_core_init()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
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

On Thu, Aug 21, 2025 at 2:30=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> The problem is that pm_runtime_get_sync() can return 1 on success so
> checking for zero doesn't work.  Use the pm_runtime_resume_and_get()
> function instead.  The pm_runtime_resume_and_get() function does
> additional cleanup as well so that's a bonus as well.
>
> Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/accel/rocket/rocket_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, Dan, I have applied it to drm-misc-next.

Regards,

Tomeu

> diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/ro=
cket_core.c
> index 72fb5e5798fa..abe7719c1db4 100644
> --- a/drivers/accel/rocket/rocket_core.c
> +++ b/drivers/accel/rocket/rocket_core.c
> @@ -74,7 +74,7 @@ int rocket_core_init(struct rocket_core *core)
>
>         pm_runtime_enable(dev);
>
> -       err =3D pm_runtime_get_sync(dev);
> +       err =3D pm_runtime_resume_and_get(dev);
>         if (err) {
>                 rocket_job_fini(core);
>                 return err;
> --
> 2.47.2
>
