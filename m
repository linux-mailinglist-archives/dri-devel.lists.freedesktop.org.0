Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A03803030
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 11:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9E910E12C;
	Mon,  4 Dec 2023 10:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0949610E12C;
 Mon,  4 Dec 2023 10:24:59 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6d9a6f756c3so228895a34.2; 
 Mon, 04 Dec 2023 02:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701685499; x=1702290299; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YFWwDfWuYKDzJoaI6ZRY85TeV2wN7kNmrNs2cUdQvx8=;
 b=eWXZJN3nnM3Rp3m5bKwGv5777Qa7OGd3oJmHjrmCcl1KpiPGwywQq850ZNH7/1p6s9
 nUO02znPWuvQha29GWlNcGAJW5Pt4Z1qDsZFAEXHmMD9kCShnVcrsWFMwnB3mtRTlI9Z
 lPlnW0R4JgY9b2XlSRpxhowVPPACUlPjSvrI3Vx2fHWESopUphL5janOJpFy/H74C0Vy
 PTall60GPS0YmhStpc8+4UFLVkQed+ttEnuS5bvjNvYENfvul4kdJJZGkztWNsCUCIGr
 8VX1xwLlyHE8jmf9O9BltlaPjPLA59RAE2j1m5ePwP+hDgn7a9lZcZL2Pyqm0Hg9x+Wt
 sf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701685499; x=1702290299;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YFWwDfWuYKDzJoaI6ZRY85TeV2wN7kNmrNs2cUdQvx8=;
 b=P7S5agjxA8sEO5C4Tl79UunpScjHGmNQnL85aOudWsd1hbx9gyIvbrfLfAgV9TSS7e
 VL6sDrHAbj1I4klTZp+TqUHVbNTi0j2qCh+i9LAiDkuO3i+kcEEr/pNjFrQ2YymChgJD
 LJOkNRZNK77q6XkhArhCKins0xatm7FAQuQ1F14VWklk8Ehzgo+2cs5olfg0bsyyk93q
 MQa5kNl+OFWwIjWg8O0xtIJiGO20azqwiAEksaDVKIf8EwJFzXpFI0hDL7aaWVeXvfIT
 Q3dI7I1lqk2K5bEsUhMBWhzCYaBYZoCG+B/4YiaGXcfr86NFDZjxR/u2zR7HD4yv2e0P
 HSQw==
X-Gm-Message-State: AOJu0YzO477qY16gHstldVkecSxoWNX3a8lH/dTIo5pjZ/PyCgNQmo9g
 wGUuKLxdRfqjACZQ7lZ8DArBjFJL83yunBjpLGc=
X-Google-Smtp-Source: AGHT+IHGkRNTRTbTZQhFirRRD5A2IRs3d4pxRFeNNeut7yVnKoQ/U3bgcbBsI0K3NfKyZw8i1V+PhixojHzVojxIXOQ=
X-Received: by 2002:a05:6870:4998:b0:1fb:2c68:6c0b with SMTP id
 ho24-20020a056870499800b001fb2c686c0bmr2924886oab.37.1701685499014; Mon, 04
 Dec 2023 02:24:59 -0800 (PST)
MIME-Version: 1.0
References: <20231204034309.3290173-1-alexious@zju.edu.cn>
In-Reply-To: <20231204034309.3290173-1-alexious@zju.edu.cn>
From: Amos Jianjun Kong <kongjianjun@gmail.com>
Date: Mon, 4 Dec 2023 18:24:47 +0800
Message-ID: <CAFeW=pap5t5_xBcpHhM5Sm-XE7wORnzkdQCGuSO8GMz_D95u7g@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/trinity_dpm: fix a memleak in
 trinity_parse_power_table
To: Zhipeng Lu <alexious@zju.edu.cn>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 4, 2023 at 5:55=E2=80=AFPM Zhipeng Lu <alexious@zju.edu.cn> wro=
te:
>
> The rdev->pm.dpm.ps allocated by kcalloc should be freed in every
> following error-handling path. However, in the error-handling of
> rdev->pm.power_state[i].clock_info the rdev->pm.dpm.ps is not freed,
> resulting in a memleak in this function.
>
> Fixes: d70229f70447 ("drm/radeon/kms: add dpm support for trinity asics")
> Signed-off-by: Zhipeng Lu <alexious@zju.edu.cn>
> ---
>  drivers/gpu/drm/radeon/trinity_dpm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/radeon/trinity_dpm.c b/drivers/gpu/drm/radeo=
n/trinity_dpm.c
> index 08ea1c864cb2..8bf56fb7b933 100644
> --- a/drivers/gpu/drm/radeon/trinity_dpm.c
> +++ b/drivers/gpu/drm/radeon/trinity_dpm.c
> @@ -1727,6 +1727,7 @@ static int trinity_parse_power_table(struct radeon_=
device *rdev)
>                 non_clock_info =3D (struct _ATOM_PPLIB_NONCLOCK_INFO *)
>                         &non_clock_info_array->nonClockInfo[non_clock_arr=
ay_index];
>                 if (!rdev->pm.power_state[i].clock_info)
> +                       kfree(rdev->pm.dpm.ps);


I just confirmed the memleak problem in the code. But the fix has a
problem, it lacks the brackets.

diff --git a/drivers/gpu/drm/radeon/trinity_dpm.c
b/drivers/gpu/drm/radeon/trinity_dpm.c
index 08ea1c864cb2..ef1cc7bad20a 100644
--- a/drivers/gpu/drm/radeon/trinity_dpm.c
+++ b/drivers/gpu/drm/radeon/trinity_dpm.c
@@ -1726,8 +1726,10 @@ static int trinity_parse_power_table(struct
radeon_device *rdev)
                non_clock_array_index =3D power_state->v2.nonClockInfoIndex=
;
                non_clock_info =3D (struct _ATOM_PPLIB_NONCLOCK_INFO *)

&non_clock_info_array->nonClockInfo[non_clock_array_index];
-               if (!rdev->pm.power_state[i].clock_info)
+               if (!rdev->pm.power_state[i].clock_info) {
+                       kfree(rdev->pm.dpm.ps);
                        return -EINVAL;
+               }
                ps =3D kzalloc(sizeof(struct sumo_ps), GFP_KERNEL);
                if (ps =3D=3D NULL) {
                        kfree(rdev->pm.dpm.ps);


>                         return -EINVAL;
>                 ps =3D kzalloc(sizeof(struct sumo_ps), GFP_KERNEL);
>                 if (ps =3D=3D NULL) {
> --
> 2.34.1
>
