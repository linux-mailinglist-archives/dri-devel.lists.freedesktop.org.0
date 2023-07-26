Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1639B764161
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 23:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5286310E4C4;
	Wed, 26 Jul 2023 21:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CE710E4C3;
 Wed, 26 Jul 2023 21:45:48 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fdd31bf179so446493e87.2; 
 Wed, 26 Jul 2023 14:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690407946; x=1691012746;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nOSkc7sf6NMjkqcB2/E++RRa34t+M2+WHnNy72dRWQY=;
 b=mgWgtL0xmtNDB+J+vMgUJf5u9tvYOF08gLPAonehNflomYYSV2EUj45C9cOAGvzSxa
 +CUWkuc3o/LnEtOJTE8Ua46LP+4febaMKuAY127YxK4MhBKzvkFIIeQVzG5ai9guspN8
 1/s+AOOWvWpCDcEmCnH03GXqXE/ZF3hHK4/r2ROM+cpRXaENp6FsjwFrEqcIiRSrVhz6
 qgsBDCpkyELZmYjVQxkwBtlCiLTLqHXaSJyN8uXxOpnytLACmebK6egMJm7GHHDrau4r
 6ou+qp75LYRe2817o84xNAnj4A+lJg2frkfySKUhWZyARG2KVYK1452y5zUAJRx1wpPy
 zx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690407946; x=1691012746;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nOSkc7sf6NMjkqcB2/E++RRa34t+M2+WHnNy72dRWQY=;
 b=EPiUkvQQsKUOa5PHpqOXdp8AYxYDe0G1eg5nqLJWzPF4lfykToesf9h1F3VEvyCxd+
 GoiRYljUke1BfAiM/SHh7+zWHoqON4/Q6x1nF+O8rRMHxgFH3Sqcrqv1muSN8jtYAYse
 K0ltvu+BZOBw0bLvCPFCpkxKJW+uMFgVgV9yPwYv1DnuF3hNYb9Jt2BS3Jg40M9LG+SY
 8hj7DNVJHT/W8dAseYzgUne+yzKWgvofv0VN/xew6i3zCfVZ02sgr7DEnqbGFc7ov32j
 ufnGpKdfAfHQugE19XF0Q+N+hF75V0ILP8hBK6edVZZS+n/huknFsf4y1jhHunEH68mb
 D4tw==
X-Gm-Message-State: ABy/qLaMDMN5YGyc5trQb5KbgbNiWTw+4ADIKHYW/M8Wux/+HQuUp+/C
 Kjq6LT5hfLKpkwSwmnjptlSeP5qZhc47BKmfREM=
X-Google-Smtp-Source: APBJJlF9n+ERxsadCb4oNiJT5O6j6RrHVakhn2ecE9c96MDYfp6hWkC5dhgQ/HxS1m8dcpqX4zwmC5xB4jPktAe63Kw=
X-Received: by 2002:a05:6512:39cb:b0:4fb:97e8:ed8c with SMTP id
 k11-20020a05651239cb00b004fb97e8ed8cmr266635lfu.4.1690407946347; Wed, 26 Jul
 2023 14:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-13-robdclark@gmail.com>
 <4cdceddb-033a-6301-163e-89d27152e242@linaro.org>
 <CAF6AEGvtMRnWBQz_KOi5b1p40HjvAAHYdd64kiR3KsKWPBO+bg@mail.gmail.com>
 <0e805cae-d311-2b8c-cead-62621288a34f@linaro.org>
In-Reply-To: <0e805cae-d311-2b8c-cead-62621288a34f@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 26 Jul 2023 14:45:34 -0700
Message-ID: <CAF6AEGvC-rSRo7Z33+pz9SCRTWpvq2U-StWq+Afe44T4CJwr6g@mail.gmail.com>
Subject: Re: [PATCH 12/12] drm/msm/adreno: Switch to chip-id for identifying
 GPU
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 15, 2023 at 6:38=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> On 7.07.2023 18:08, Rob Clark wrote:
> > On Thu, Jul 6, 2023 at 5:25=E2=80=AFPM Konrad Dybcio <konrad.dybcio@lin=
aro.org> wrote:
> >>
> >> Apart from all these comments, I don't really see the point of this pa=
tch,
> >> other than trying to tie together Qualcomm's almost-meaningless chipid=
s on
> >> a7xx into the picture..
> >>
> >> Since they can't even be read back from the hardware, I don't think tr=
ying
> >> to force them into the upstream kernel makes any sense.
> >
> > Sure, we _could_ pick our own arbitrary identifiers, we don't have to
> > align with kgsl.  But that would be a super huge PITA for mesa, which
> > has support for both kernels.
> Perhaps I'm biased towards keeping this kind of stuff out of the kernel,
> but I'd say that Linux should decide on one logical path.
>
> In between us starting this discussion, Qualcomm managed to introduce
> yet another way of deciding what GPU is present on the system in their
> downstream driver[1]. We're at like 5 now. Do we wanna keep up each time?
> New ID rework for A8xx when that comes out one day?

[snip]

> [1] they now read parts of socinfo from smem and decide the CHIPID and
>     speedbin based on that, but it's not available on most existing SoCs,
>     that was thrown in with SOCID v17

This is actually exactly what we want.. something that we can read
from hw/fw and that blob userspace also uses (so we don't have to
worry about qc forgetting to change the id, etc)

BR,
-R
