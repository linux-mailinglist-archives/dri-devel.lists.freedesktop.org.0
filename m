Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4471BF2AB8
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 19:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B61410E281;
	Mon, 20 Oct 2025 17:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IAzDJDb4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB1110E281
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 17:18:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2B3F3620C9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 17:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6C9C16AAE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 17:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760980715;
 bh=4DeNbsFjA3GHAvuLpWPwdNkAditJGZMykUeSPTvXfPI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IAzDJDb4ojXUi/sH9bE/JrBXDlxA86v5WcegcNYbiBVchvmT6yaL1Lijo1TvKEGDt
 snY6qEqecS/PcWU5Xk8O+rNbRDbAoCI57Yg03K8QeM4T2WyojWFszIXIjptz0i3RqV
 scLrP3XMFUNmuitiA9Ph5kdld2InsLktImukfTwFBWSXuE5mB/niaiCPyn5qxFMg9i
 is51pg2srmTIeHZKDTWPW6XG7SIeksJ+OdkTz8SRP9L5tH7Yr2f65ZrcZQRB3egrKy
 z0t18SCRrKnjIjluTDUc/EHeA03icbnUyer6J7eoic+M8eEqGaCkrWGD3RXFgJq/0N
 lWU3QskxKQ04g==
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-7c27e5ca2beso1198558a34.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 10:18:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVPc+H/QiiAoq6jSWmVeUypbPW2QZx/cdsbMKnlEnAeXRUr6GL9E9/jIr1F6kzs43Xi/5BLTithYeM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyo5vCUbcCfYBAI884U0i5ej03W+ZvsvNl+zB0tr71uNYd3idNQ
 6tOJA6pv4P/hDk3R8nV8Ufn48x4/1rNBAGUip4+ZyqTt45qtOts245ebNpYrrsc2FtbkQHVznc6
 yS0z0dKhbUJ1aR0Y0VWoYzgL4U0hG0FA=
X-Google-Smtp-Source: AGHT+IEpBFVPe13rSyWoAQmkn/h4MheLuYhwx+bDHEMRoTzYJkC2HBrn+zWJIIX4GlHStnkZidJOsjnAs+i7vboU7aI=
X-Received: by 2002:a05:6808:1a03:b0:441:8f74:e85 with SMTP id
 5614622812f47-443a309d405mr6105705b6e.63.1760980715153; Mon, 20 Oct 2025
 10:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20251020165317.3992933-1-superm1@kernel.org>
 <20251020165317.3992933-3-superm1@kernel.org>
In-Reply-To: <20251020165317.3992933-3-superm1@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 20 Oct 2025 19:18:24 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g64Hu15k5sLVfxj-AADy2goyvseGGm_zTAqSPHXEaxOA@mail.gmail.com>
X-Gm-Features: AS18NWBumdOGpspcARVBeurDv1os9xsYPMYfkNgvhTlP7jAwUq2a1Wu4Nq9UyAw
Message-ID: <CAJZ5v0g64Hu15k5sLVfxj-AADy2goyvseGGm_zTAqSPHXEaxOA@mail.gmail.com>
Subject: Re: [RFC 2/3] PM: Don't pass up device_resume() -EBUSY errors
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: mario.limonciello@amd.com, airlied@gmail.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, dakr@kernel.org, gregkh@linuxfoundation.org, 
 lenb@kernel.org, pavel@kernel.org, rafael@kernel.org, simona@ffwll.ch, 
 Muhammad Usama Anjum <usama.anjum@collabora.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
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

On Mon, Oct 20, 2025 at 6:53=E2=80=AFPM Mario Limonciello (AMD)
<superm1@kernel.org> wrote:
>
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> If a device resume returns -EBUSY the device resume sequence has
> been skipped.

Is this actually demonstrably true in all of the cases?

And what about -EAGAIN?

> Don't show errors for this or pass it up to async
> resume.  If resume is run again in another stage the device should
> try again.
>
> Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>  drivers/base/power/main.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> index bf9c3d79c455f..f6bc7ef9a8371 100644
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -1112,7 +1112,9 @@ static void device_resume(struct device *dev, pm_me=
ssage_t state, bool async)
>
>         TRACE_RESUME(error);
>
> -       if (error) {
> +       if (error =3D=3D -EBUSY)
> +               pm_dev_dbg(dev, state, async ? " async" : "");
> +       else if (error) {
>                 WRITE_ONCE(async_error, error);
>                 dpm_save_failed_dev(dev_name(dev));
>                 pm_dev_err(dev, state, async ? " async" : "", error);
> --
> 2.43.0
>
