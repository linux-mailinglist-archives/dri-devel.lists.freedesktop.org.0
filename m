Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03240813729
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 18:03:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEF510E1E7;
	Thu, 14 Dec 2023 17:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244F310E15F;
 Thu, 14 Dec 2023 17:03:27 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-203349901d5so1079705fac.0; 
 Thu, 14 Dec 2023 09:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702573406; x=1703178206; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IEXnTnqjpa7nm9vgp7D5PjeKTa53gHhoihHSu75cHl4=;
 b=K8dqDO9W0K4g8UfQDfNiXGRVrCnW7RhIpcpCckk0kP4XWEvp7SILHeisD20DdkfC/5
 SylNp38dC1SRPJmBA6BVB7BdU8rK/VqCG4CNpsF6GewE+9npY8hJbdgnFu4CTBkOOVL6
 WzXgZAv0kD+n/W+jz3i9syCKTia8XhDWzrzaUEU9INqTRxevIksZyYx5Ve5HtqO7PjlR
 23ELIsh9snUNRtSnTcdvfABr6oOHYp/8skIIP4VyIFoEZ6uyY/K8AC/NF0t+p4cha+mW
 MLDrgCDjQ5bImXsOsF7xLysHlav89bELP4x2fE/fRdN+iIK+jsYOaTol6ft5vIXPV+p+
 e+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702573406; x=1703178206;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IEXnTnqjpa7nm9vgp7D5PjeKTa53gHhoihHSu75cHl4=;
 b=UmDXLlyMrLCJXVIUZh6s5X4VH+YWVjDPtzWdiato2Z8SlEp+U8o8CR2vUwP2kq7iaJ
 3tdIMYi97s6BxWc7BpHCgtUeGvl733+AyR9ejYHiH7v08eKkOJXKMfB1MWDiwaSufbNZ
 h/vI9VA/XEHbsj9JdCW9VAeKAA8V1ZvQTHNWC0kS8/TuOts/loV9vn2LTZckD2JOsS0c
 vgV9JWtzb9XAs3S+Y05OSi42F0kAfBP5/qKdvC2Afmb5K3oQoP7q8KL+VyyGYg4KNob+
 uYiRoglmeFYhpIbZKBi6RIt27jt0arA3voyCoU75WrRUJFV6BqLt0trarDbp/rYv7K1C
 n2Qg==
X-Gm-Message-State: AOJu0YzDlCL8i+Xkkarg+8B9C1i77jBFT+BDB1ESDLumGQmvNZa2y9oV
 GKYFwY644WPygyWHf9O5nUTh/FJdrFWuySkl0Us=
X-Google-Smtp-Source: AGHT+IEHQe0sa0Hs3zuw66/YXZe0qIycTF9cpBKtgFuNygldhFgNPAck39sdFcnprEAS8iQm5a7ybs4Elkfe0DhAoEw=
X-Received: by 2002:a05:6870:d10c:b0:203:3902:61f8 with SMTP id
 e12-20020a056870d10c00b00203390261f8mr2662871oac.12.1702573406322; Thu, 14
 Dec 2023 09:03:26 -0800 (PST)
MIME-Version: 1.0
References: <20231214152413.3483199-1-alexious@zju.edu.cn>
In-Reply-To: <20231214152413.3483199-1-alexious@zju.edu.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Dec 2023 12:03:14 -0500
Message-ID: <CADnq5_PHqy6oQhyycN8xjApo+-1YxuYpJxm+2MwwWCd+mLX6XA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: fix a double-free in si_dpm_init
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
Cc: Lijo Lazar <lijo.lazar@amd.com>, Guchun Chen <guchun.chen@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Zhenneng Li <lizhenneng@kylinos.cn>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Dec 14, 2023 at 10:59=E2=80=AFAM Zhipeng Lu <alexious@zju.edu.cn> w=
rote:
>
> When the allocation of
> adev->pm.dpm.dyn_state.vddc_dependency_on_dispclk.entries fails,
> amdgpu_free_extended_power_table is called to free some fields of adev.
> However, when the control flow returns to si_dpm_sw_init, it goes to
> label dpm_failed and calls si_dpm_fini, which calls
> amdgpu_free_extended_power_table again and free those fields again. Thus
> a double-free is triggered.
>
> Fixes: 841686df9f7d ("drm/amdgpu: add SI DPM support (v4)")
> Signed-off-by: Zhipeng Lu <alexious@zju.edu.cn>
> ---
>  drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm=
/amd/pm/legacy-dpm/si_dpm.c
> index fc8e4ac6c8e7..df4f20293c16 100644
> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> @@ -7379,10 +7379,9 @@ static int si_dpm_init(struct amdgpu_device *adev)
>                 kcalloc(4,
>                         sizeof(struct amdgpu_clock_voltage_dependency_ent=
ry),
>                         GFP_KERNEL);
> -       if (!adev->pm.dpm.dyn_state.vddc_dependency_on_dispclk.entries) {
> -               amdgpu_free_extended_power_table(adev);
> +       if (!adev->pm.dpm.dyn_state.vddc_dependency_on_dispclk.entries)
>                 return -ENOMEM;
> -       }
> +
>         adev->pm.dpm.dyn_state.vddc_dependency_on_dispclk.count =3D 4;
>         adev->pm.dpm.dyn_state.vddc_dependency_on_dispclk.entries[0].clk =
=3D 0;
>         adev->pm.dpm.dyn_state.vddc_dependency_on_dispclk.entries[0].v =
=3D 0;
> --
> 2.34.1
>
