Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E4ECEC9AB
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 22:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FE010E3C4;
	Wed, 31 Dec 2025 21:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XSki7CzG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314FC10E3C4
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 21:45:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1F91960017
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 21:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B62BDC19424
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 21:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767217551;
 bh=nhc5HTSzr7Ox4vfUcojIDAEtv5yQfWNva/ya6wKSDZ0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XSki7CzGqxR32voe46Tto9rfuFLZ+/ddejqp0JHA0n025VqVk9rNETry8Ljw3G5+8
 panL1BnmbCKM1I+LEga7iu2+BGSIb5gi+kI8sHGI4gAbpibIdw5znazkYRz9o5zeKw
 DF+Rkl72riKgLq4Jypabk/lfSwN4A8Ui0nl7TSa06xCdge29//1Fto6Ytaw+wf7FHp
 FyTQuZzdwDLob9n9h2dvBJb0fHDWSyj9qEApShzaP4MJO0PDs3kzp//VQEQxVQSOJY
 WbMKJEbCtKCZ78nNBHF7Di8Nxv/2/t+mYUz0/laVwU69ssMHDNySZkeHHCVHWBMwaM
 GlanD5wP2HPFA==
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-78fc0f33998so71311067b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 13:45:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWGmUa8YAclvHZ6oPOOEDbGNHstZJY9MqQCyie+vT9N0ONrtujcTGmr/NPMS2jlfQUzIPIWkrp//0Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUi5Renrt1V+4XRe1PV/Jk3Fooh9WHEqlPMOxQ1Iqsne6RTO//
 HoJioeDhBTSDpR/vrYs0X2678zbIa/WSq8E8ygL7B8eXYjTe+TuTkDC77t3vgK1ZWewXAVdCs6A
 89Hwbh+djl3TwUzYM9svo+44VCRnvO2Q=
X-Google-Smtp-Source: AGHT+IFxAbQIxeGevbze8OQVhXJ9wP64YDl4RYXJREXnTkP1gMcNq1jCShGAq320jcyM5otpjkE1BmRtePLq5bx5pqU=
X-Received: by 2002:a05:690c:3803:b0:78f:984b:4bb5 with SMTP id
 00721157ae682-78fb40c5f09mr590261177b3.64.1767217551063; Wed, 31 Dec 2025
 13:45:51 -0800 (PST)
MIME-Version: 1.0
References: <20251211123345.2392065-1-linmq006@gmail.com>
In-Reply-To: <20251211123345.2392065-1-linmq006@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 31 Dec 2025 22:45:40 +0100
X-Gmail-Original-Message-ID: <CAD++jLk8DJRjwDW6MH+CFXOQFhP9S0NNZJ4TKDZ2+t6W84qb-g@mail.gmail.com>
X-Gm-Features: AQt7F2rlCQNyCYzrC5L2nUkzSaWVFHq97H9Hsr63d209d6TO0zHz9GSEAX5mn_0
Message-ID: <CAD++jLk8DJRjwDW6MH+CFXOQFhP9S0NNZJ4TKDZ2+t6W84qb-g@mail.gmail.com>
Subject: Re: [PATCH] drm/pl111: Fix error handling in pl111_amba_probe
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Tom Cooksey <tom.cooksey@arm.com>, Eric Anholt <eric@anholt.net>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Thu, Dec 11, 2025 at 1:34=E2=80=AFPM Miaoqian Lin <linmq006@gmail.com> w=
rote:

> Jump to the existing dev_put label when devm_request_irq() fails
> so drm_dev_put() and of_reserved_mem_device_release() run
> instead of returning early and leaking resources.
>
> Found via static analysis and code review.
>
> Fixes: bed41005e617 ("drm/pl111: Initial drm/kms driver for pl111")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Patch applied to drm-misc-fixes, thanks for fixing this
obvious bug!

Yours,
Linus Walleij
