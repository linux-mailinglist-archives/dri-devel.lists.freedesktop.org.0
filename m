Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F135BED19B
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 16:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A7210E063;
	Sat, 18 Oct 2025 14:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="UB1um/PY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48A110E063
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 14:32:39 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-781da6c1a37so34272457b3.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 07:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1760797959;
 x=1761402759; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u33yGeffbuYdlvlzL4H50ccSYsAIsX3t6iP87kPjVYE=;
 b=UB1um/PY28UFZ6nAnbTNtCOxbBPZzBLv7Q2doaok/f6Fv/850ac5Xj2b13plkVvPE7
 vQkbTSP9ofwFejPRTpf71+JiidB0POisqVM3SkQD15KjDvFSwYrRb+LKXzV1fEk7Cwbg
 s0wi3ljqvW6uiIn2h9N5g/IC2ZnV7ADS4T1izS1T1e52KxND8g+ersLGBoqzWHhk+Jr5
 efyaaml7CEkQ830LZ52k8aVDoelMomW2OUejAcTd+GKRtFA8TYRRkqIwQ8uW27Jyr3t0
 CljY+NG12P8NOqURxDTsZa7as/si/UKlHubOeMLk0908oFqyNwtGmt0pi8V4dEeQ+7X6
 1KKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760797959; x=1761402759;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u33yGeffbuYdlvlzL4H50ccSYsAIsX3t6iP87kPjVYE=;
 b=CxjY/2pO7TepnlamMPFTKXpanv4I5c2bZcshT1ukN4CW/p1BAzPMY8pCOun1kRsi/z
 fiZqnMEpLsMmmTLceIxBArXoSARH6qlAj/0Y7sulATQU88ql+mmHaGdvzS1m7yjf0kpC
 R2HGMXvwkP3eYTBe+CHxLQkouZf4y7+Ra8QZ32DDMcfU9LfJV8LXAWpLdpnShtaIFCRI
 gM/i3Z0I4zndx6B8f6bl3TNQ+tOChs4qKmIbwNqA2Hv9/+YFcwIj5HJKbdUS79QncmpZ
 ADu3QXHamjyLJWyaMDgd2CINxilpOR7Qm6lr6/75XqR7W9Y9cbUl0cmCpJ02TLME9CKl
 nHKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSCt8YSqQ3n/NddSJFoZAi8zfsoz3JtdVCHCUDkT0uZ2Q2Wrg+4Mj6eVfo+vDHDap1Ev4eqZWwkgU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw06/Es7WZmNMOSHqUtTk+5sx4fQVofbBMSZGU94OhroCkPpC98
 cck4HWufSVylkPkTEP1cku40Ad7PLGvvtgp8KJi6KifYIkFNf/eWi1K+2zAGotPt1fxW2zbzSDd
 qThi3OV4=
X-Gm-Gg: ASbGnctgUGCUWRekvJ8qjh5AfSpuKFcriJP2VBkIkmqNjFN9v+DPP4NPL/JH5f958oH
 z2h6PdvP8vAzoYceWo3WWVZPoYeusGH43wRBTQlETNFYUTrebwpIqHmiPmFRifXSU1qaxvl+lxJ
 ePvDufLGeQImHgcNEziU/i3bSBfzuRIcyM1J1rJXfC5sXINmIZ/xwkdV8F8O2FxvPRiqAdRJZOY
 yKHVPReEbGgzdGg2isu/YrzgFWxZpUeVHw7fz5YBjfzLwRWdhq3Cq852PdIrIahLzEW/DHkzMlT
 prwLCwnOhs8pn9amEHaS9B6rehmBKyQFILsIqx2p3OQ9NA6d6UFgvcdmCG/eFEWCV/1493YrAnu
 sao/14QfV2XOB6ykBGrb7kxt6ZgfvmjMTNIw1eOaPgUobJd/LfZJ7a+dPB9YC+YpEDx6DyB9+eS
 Iw1xs/yRmzV+8+5LNMphhhjEebVurmQSD/LUC16nxxBPLnWBYw9z9abQ==
X-Google-Smtp-Source: AGHT+IHqpxJpvJHbMmBMjpm5MDymeGNElbA8P7g6HliUamCufRZUtpQf0+68jFzTiy9B5HcTvsjj2w==
X-Received: by 2002:a05:690c:6891:b0:781:64f:2b33 with SMTP id
 00721157ae682-7836d396a66mr66199277b3.69.1760797958956; 
 Sat, 18 Oct 2025 07:32:38 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-784674d3e57sm7057047b3.34.2025.10.18.07.32.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Oct 2025 07:32:37 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-784826b775aso5042487b3.2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 07:32:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUtvCv/GI+Fk+SldqELtyekO2kueoqBaW1Mc2IqYBl6f7W6UzNMGae/guaGVO7V5a1rzgOziPglM1o=@lists.freedesktop.org
X-Received: by 2002:a05:690e:1401:b0:63e:2001:96e0 with SMTP id
 956f58d0204a3-63e20019897mr4605587d50.32.1760797957548; Sat, 18 Oct 2025
 07:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20251017133644.44747-1-tvrtko.ursulin@igalia.com>
 <20251017133644.44747-16-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251017133644.44747-16-tvrtko.ursulin@igalia.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sat, 18 Oct 2025 16:32:26 +0200
X-Gmail-Original-Message-ID: <CAAObsKDY1zs9R2HwnO6ESP7585rEzhBiTQr8eZFDtTCsbcQx4A@mail.gmail.com>
X-Gm-Features: AS18NWCAB_kOwXa5sb329LHfQOFfSyknwHwT7YO9iNYjXbmCM8gGwoS9osAfhMw
Message-ID: <CAAObsKDY1zs9R2HwnO6ESP7585rEzhBiTQr8eZFDtTCsbcQx4A@mail.gmail.com>
Subject: Re: [PATCH v2 15/27] accel/rocket: Remove drm_sched_init_args->num_rqs
 usage
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-dev@igalia.com, Oded Gabbay <ogabbay@kernel.org>
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

On Fri, Oct 17, 2025 at 3:36=E2=80=AFPM Tvrtko Ursulin
<tvrtko.ursulin@igalia.com> wrote:
>
> Remove member no longer used by the scheduler core.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> ---
>  drivers/accel/rocket/rocket_job.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index acd606160dc9..6ff81cff81af 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -437,7 +437,6 @@ int rocket_job_init(struct rocket_core *core)
>  {
>         struct drm_sched_init_args args =3D {
>                 .ops =3D &rocket_sched_ops,
> -               .num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
>                 .credit_limit =3D 1,
>                 .timeout =3D msecs_to_jiffies(JOB_TIMEOUT_MS),
>                 .name =3D dev_name(core->dev),
> --
> 2.48.0

Thanks, Tvrtko.

Reviewed-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Regards,

Tomeu
