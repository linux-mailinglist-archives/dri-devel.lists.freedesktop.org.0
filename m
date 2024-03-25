Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6406889D1B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 12:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B33B10E7D2;
	Mon, 25 Mar 2024 11:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KKiv2iEH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2607610E7D2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 11:37:01 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a4a387ff7acso82729266b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 04:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711366619; x=1711971419; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8yYmh9ilGatslqz9nzmGmez9Ks5eyhsXtq+smawLikQ=;
 b=KKiv2iEHaWPUXn63M+2PyvQgQjmqGLOQxCu3Fpmrwp0olS3v1YmfYb5d/mSbvbXP+8
 b1cJYC44uPwva2d7X/QSjuJmlE3NpRO07EPIgip+N4Y4jsm4QqJnkZu5/olesQGYRbcD
 cpnhO9imjk2bFIRYlOSWN13Ldj4YMzLbbacaRFN1OIhagrj+dCpnQEudCUuqSJKMJM9x
 qG9+tyatlxr1Y43RM5Pda9SWY0skpqVU71BlEPs1VCF/bROSFlTvjTpMcySuOMUQCu12
 /YWOMKK9gxZnGZmIiOp/tNZRDyp+q27ZNidalezjuApeKO8QduIl65/nmSbPKhySdcVC
 0qIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711366619; x=1711971419;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8yYmh9ilGatslqz9nzmGmez9Ks5eyhsXtq+smawLikQ=;
 b=wIP9cSqtCKX8gHxXEljkpgSC77QdOnT8t8CncPpEkda9P7C5eWqnYFEAD2dO1ovAr9
 RMwFz/AMxDwNShePSCBDUZT+W88GFNqAM2+V6xGKzcyHGQ3Bt5W1DrgpYHJwpnLYb8Cj
 HAxsE5ul3nj3twMYDAt5flSw6FpqV8Tl8j8A9m2i1C05UtjdAqnOS0aZLegRhZIrzSHt
 Q1zVbFvdLtgmlvYDpA95QHNUOlDkJs3HhxF6rG1C0cbTWyx8CsL0ToDcBiZpb/C5/n+J
 T3AwOAaHqSCxgADeuiJnH4JGhZcmoLjvUzXSOohX0endkJ780vdRbqhHurqJgerbrqYW
 rrTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsnvAp0jXF7wfMBCYGMW39cINI3nlzcCNmb0Np+IsTPWqextYo5/4R4dd0IlewGyec5vD8+QNEV0BJLMv0Tf8zqFjN+LcGhlGITSToyREz
X-Gm-Message-State: AOJu0YwNVaQ0kTHkPE4blVxnLGFCJpU8sacX1ezq5KnlCX4guB27NTY9
 4PDWTGqWKsKXs3snhasvAjiyD2Pj7U+UeucvcLQ8/8U2Mb6DFYM2
X-Google-Smtp-Source: AGHT+IH6c0oCiM6CpSIH3+fOqTkyS+RcmYNisq65V7JULsv8sbnj16RwVvb8LtKycoS2t3mWk74Utw==
X-Received: by 2002:a17:906:c2d0:b0:a45:5be1:6e20 with SMTP id
 ch16-20020a170906c2d000b00a455be16e20mr4420850ejb.23.1711366619050; 
 Mon, 25 Mar 2024 04:36:59 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id
 hj13-20020a170906874d00b00a474ef94fddsm1922774ejb.70.2024.03.25.04.36.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Mar 2024 04:36:58 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH] drm/panfrost: fix power transition timeout warnings
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <bad16bba-5469-4f20-bf23-7f3c2953edc5@arm.com>
Date: Mon, 25 Mar 2024 15:36:40 +0400
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <620A6EF4-4361-4B5F-889B-268091FB72D9@gmail.com>
References: <20240322164525.2617508-1-christianshewitt@gmail.com>
 <bad16bba-5469-4f20-bf23-7f3c2953edc5@arm.com>
To: Steven Price <steven.price@arm.com>
X-Mailer: Apple Mail (2.3774.400.31)
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

> On 25 Mar 2024, at 2:28=E2=80=AFpm, Steven Price =
<steven.price@arm.com> wrote:
>=20
> On 22/03/2024 16:45, Christian Hewitt wrote:
>> Increase the timeout value to prevent system logs on Amlogic boards =
flooding
>> with power transition warnings:
>>=20
>> [   13.047638] panfrost ffe40000.gpu: shader power transition timeout
>> [   13.048674] panfrost ffe40000.gpu: l2 power transition timeout
>> [   13.937324] panfrost ffe40000.gpu: shader power transition timeout
>> [   13.938351] panfrost ffe40000.gpu: l2 power transition timeout
>> ...
>> [39829.506904] panfrost ffe40000.gpu: shader power transition timeout
>> [39829.507938] panfrost ffe40000.gpu: l2 power transition timeout
>> [39949.508369] panfrost ffe40000.gpu: shader power transition timeout
>> [39949.509405] panfrost ffe40000.gpu: l2 power transition timeout
>>=20
>> The 2000 value has been found through trial and error testing with =
devices
>> using G52 and G31 GPUs.
>=20
> How close to 2ms did you need in your trial and error testing? I'm
> wondering if we should increase it further in case this might still
> trigger occasionally?

I backed it off progressively but still saw occasional messages at 1.6ms
so padded it a little with 2ms, and those systems haven=E2=80=99t shown =
errors
since so I currently see it as a =E2=80=99safe=E2=80=99 value. The one =
possible wildcard
is testing with older T820/T628 boards; but that needs to wait until =
I=E2=80=99m
back home from a long trip and able to test them. The possible theory
being that older/slower systems might require more time. Worst case =
I=E2=80=99ll
have to send another change.

> kbase seems to have a 5s (5000ms!) timeout before it will actually
> complain. But equally it doesn't busy wait on the registers in the =
same
> way as panfrost, so the impact to the rest of the system of a long =
wait
> is less.
>=20
> But 2ms doesn't sound an unreasonable timeout so:
>=20
> Reviewed-by: Steven Price <steven.price@arm.com>
>=20
>> Fixes: 22aa1a209018 ("drm/panfrost: Really power off GPU cores in =
panfrost_gpu_power_off()")
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>> ---
>> drivers/gpu/drm/panfrost/panfrost_gpu.c | 6 +++---
>> 1 file changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c =
b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> index 9063ce254642..fd8e44992184 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> @@ -441,19 +441,19 @@ void panfrost_gpu_power_off(struct =
panfrost_device *pfdev)
>>=20
>> gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present);
>> ret =3D readl_relaxed_poll_timeout(pfdev->iomem + SHADER_PWRTRANS_LO,
>> -  val, !val, 1, 1000);
>> +  val, !val, 1, 2000);
>> if (ret)
>> dev_err(pfdev->dev, "shader power transition timeout");
>>=20
>> gpu_write(pfdev, TILER_PWROFF_LO, pfdev->features.tiler_present);
>> ret =3D readl_relaxed_poll_timeout(pfdev->iomem + TILER_PWRTRANS_LO,
>> -  val, !val, 1, 1000);
>> +  val, !val, 1, 2000);
>> if (ret)
>> dev_err(pfdev->dev, "tiler power transition timeout");
>=20
> As Angelo points out the tiler probably doesn't need such a long
> timeout, but I can't see the harm in consistency so I'm happy with =
this
> change. If my memory of the hardware is correct then the tiler power =
off
> actually does very little and so I wouldn't expect it to take very =
long.

I=E2=80=99ve seen tiler timeouts once I think and thus included it, but =
not since
the values were increased. As long as it=E2=80=99s acceptable I won=E2=80=99=
t over-think
it but if more testing is needed I can look at it more.

> Steve
>=20
>> gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present);
>> ret =3D readl_poll_timeout(pfdev->iomem + L2_PWRTRANS_LO,
>> -  val, !val, 0, 1000);
>> +  val, !val, 0, 2000);
>> if (ret)
>> dev_err(pfdev->dev, "l2 power transition timeout");
>> }

Christian=
