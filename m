Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F093BB5ABF
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 02:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D4410E02A;
	Fri,  3 Oct 2025 00:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jKP/MLOj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1689810E02A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 00:23:18 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-74f6974175dso20495267b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 17:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759450997; x=1760055797; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UogbRmh8ZZFm/yaTOGh0nQGpaUOSHHMMlYpMQ7rZnx8=;
 b=jKP/MLOjD/ULFnxYs2mBROEdGYjdfsWBdnPtAsQYtgifBsVksp1VM7TxI1Y904zSIQ
 OeeGqmNJoYrJfZqe+hb652NnF2AVEeACKrSTu7OEhZMlFgnmTUX8wRTsulpxX+FL1790
 MLkMAEGqkw/bw9ntrJ8neBZ2C/cveVl4FxmY3rZ7JmmUkmlDMJl39hNlzbo5O/BbFo9g
 2w089PKCCLMfxWw4IE+7TZJBkPWLAD4tpTBX3tIsnXsU6OegPVWnioDTNmquX/kmWAkX
 iQRQvRagVLqUkuFlPXzXFqYk7AUqX6/MlggszVpykSNrW2r4Z4wbHw/5DUu+LKoTCsFW
 ymgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759450997; x=1760055797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UogbRmh8ZZFm/yaTOGh0nQGpaUOSHHMMlYpMQ7rZnx8=;
 b=FdIhp+OX2NnayzDwEmkVfq6R6nMKBmSbcEKuayrPoQWHKarP8t9kfooENenpRgeVNu
 ZpVYywo/z8ebnrtromTfVz7tKUXaSQigqVMLun7Lq6JVMxHdPD5ZlxrKJroLrYRv5Rn1
 Kyl0gbVBVVYmpmH5P2r1SP5QAcQzjKb50ezJRQCgcrfC9rKuYaP3UQ1TNGQnaHO2od/r
 WUooUebOnpX/sYxoz00LjF5uN2FBeDfIGSvMadfoY//eNBm4HrQMH0TU7MkNsFFhiiT7
 VfzdqJq1XGvX2CFGlV0ztxr6WVK6ig8qSJ7pC5Ykui3st2mSt7tIsLXngumrvN65AOnV
 eizg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuyGMcskBjGIvNy3GFZm6O4USJF8nEV5FEovvOitx1y6e9TntoI+/9M3bTZMKZUkYPMqwzOx7PKdo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfMBI5SVARWhWdYU/M31vFNfxlc5kaTDjvmmEt1Pf8O0IoyM2e
 ZsCsHs9YVO2ueSDoXvaA9H9KallZYd9PZeOUK5et894ek2/Lc2XY7dCUAa+kTZqo4U8Xdg+xT+l
 p7VRwv/QZYnDH2rNCudIsHIPznFcnFPU=
X-Gm-Gg: ASbGncuHus3U2NCR9bJIMUTcBqd4BSRLnoGE5tHv2lS+ZlARpo+S+rY/JkR6hPpUr8i
 T5gBluY9zSGYl80eNeVGsuSublCwLezCZYELAbw59nr1DKjgqm4LmWPCY2bpzHZLUzHeyBT4+hI
 lU+h5R43MuDf42HgBgQeXa2H2ujG8mKGLCuqPKqcIL/swhmZzqR6VqK6jGyVL0W8JwCS48UqVXt
 L1uKlmXDAuyxHZ5C9LTCjfjf0J9/0t0uWvzdy/odj+XbMJ3Qwuxh5gFIvEYnIouOS5GxV9KT7mR
 V2aCaE4b7/tKYEzZ7+GQ
X-Google-Smtp-Source: AGHT+IHOLdaIHo5P2VOGhm5KkYSe5owt52O+0aQI4TZI+V6q/b0CuBZtjoShHyYCEalYDt7A3qdiiKgFGQuVvZwB5NE=
X-Received: by 2002:a05:690e:2404:b0:627:86de:ac9f with SMTP id
 956f58d0204a3-63b9a074c43mr1120484d50.12.1759450996803; Thu, 02 Oct 2025
 17:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250916210823.4033529-1-olvaffe@gmail.com>
 <20250916210823.4033529-8-olvaffe@gmail.com>
 <74e2f1a8-0410-4a5e-bbf3-29d5d5d55308@arm.com>
In-Reply-To: <74e2f1a8-0410-4a5e-bbf3-29d5d5d55308@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 2 Oct 2025 17:23:06 -0700
X-Gm-Features: AS18NWDsN3mYbrQ17ccUwcQtLGbvJ-VcpQvebBOZyQ8AFN9Ko-OXrdSad4I9OrI
Message-ID: <CAPaKu7QEAbR8a_+qmyU=obyf2N-UZemfw23U_Dw2DZLqPd7tGQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] drm/panthor: remove unnecessary mmu_hw_wait_ready
 calls
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Oct 2, 2025 at 3:41=E2=80=AFAM Steven Price <steven.price@arm.com> =
wrote:
>
> On 16/09/2025 22:08, Chia-I Wu wrote:
> > No need to call mmu_hw_wait_ready after panthor_gpu_flush_caches or
> > before returning from mmu_hw_flush_caches.
>
> Why is there no need? If we attempt to send a command when the hardware
> is busy then the command will be dropped (so the cache flush won't
> happen), and if we don't wait for the unlock command to complete then
> then we don't know that the flush is complete.
We have this sequence of calls

  mmu_hw_wait_ready
  panthor_gpu_flush_caches
  mmu_hw_wait_ready
  mmu_hw_cmd_unlock
  mmu_hw_wait_ready

I could be utterly wrong, but my assumption was that
panthor_gpu_flush_caches does not cause AS_STATUS_AS_ACTIVE, at least
by the time it returns. That's why I removed the second wait.

We also always wait before issuing a cmd. Removing the last wait here
avoids double waits for panthor_mmu_as_{enable,disable}. It does leave
the cmd in flight when panthor_vm_flush_range returns, but whoever
issues a new cmd will wait on the flush.



>
> Thanks,
> Steve
>
> > Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_mmu.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pa=
nthor/panthor_mmu.c
> > index 373871aeea9f4..c223e3fadf92e 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -669,12 +669,9 @@ static int mmu_hw_flush_caches(struct panthor_devi=
ce *ptdev, int as_nr, u64 iova
> >        * at the end of the GPU_CONTROL cache flush command, unlike
> >        * AS_COMMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT.
> >        */
> > -     ret =3D mmu_hw_wait_ready(ptdev, as_nr);
> > -     if (!ret)
> > -             mmu_hw_cmd_unlock(ptdev, as_nr);
> > +     mmu_hw_cmd_unlock(ptdev, as_nr);
> >
> > -     /* Wait for the unlock command to complete */
> > -     return mmu_hw_wait_ready(ptdev, as_nr);
> > +     return 0;
> >  }
> >
> >  static int mmu_hw_do_operation(struct panthor_vm *vm,
>
