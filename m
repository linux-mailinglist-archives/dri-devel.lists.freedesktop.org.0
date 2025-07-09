Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9056AFE55C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 12:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1848110E00E;
	Wed,  9 Jul 2025 10:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jv75CHNk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE10A10E79B;
 Wed,  9 Jul 2025 10:14:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3350AA5400C;
 Wed,  9 Jul 2025 10:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6829C4CEF8;
 Wed,  9 Jul 2025 10:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752056057;
 bh=2C4pjyJfdueSpOB2Mvvwc5pv38gCi/WniANABx1A6dc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Jv75CHNk32psM/ac6tyRoLCzzu5BFZCiIlBJT7APWb00m7ZkYBkb2M5bLM2fj7J8N
 viXdxE396Ys3g6AORulQWY6QVx9pydFaQqqxkYAkm4DKoWFXITb6LrUD+269wUONvR
 GQ/W4hdarSY/t3plzB3KwpMpD4OruzrJXSM/T7dGLfdI8+gbR6oVGlw+qciEE+8HRE
 2kEqClhlzFbFZkVywH+AHLslJXEz0StbJWQ7lZpSVlwW57/rw9MR/aZ1WxGk+6GiSA
 gIJRrT3Q5t4goEeqPv4W2V/QPN0iMot8LYN5YWEXNwlNEnttjsN41QPbzrBTyzzlTK
 dLc/Rhw+ADbJw==
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-6138aedd718so415620eaf.0; 
 Wed, 09 Jul 2025 03:14:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUHmmjWRAYqKGHGBvLF3KhfMTa5R1Lojuez3sYzL+ZbuGQmptSrb65HQ0f5qXmtTWV/RebvXYea@lists.freedesktop.org,
 AJvYcCXGGhkKWhWwQXL0yWTPvl8qN8zp1jFulQNL1yy6FroI+2aHYzRPLF9Yy+/32AGKa8VqBcCXHTDSfLax@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVfm7C0Oi+WU0ruDodjaH2xh0IYCwkgCuXMZgftrMrYyAIS9Co
 gaH7t46onutp/GEPMQdtpBzIfDv2FQEWnAAGasI6wSQsH+v/VVnLIOe6waVmYMFBNp1hARJsJCS
 ZSup7+MlBBghh71m2/qqywe5PJ653A74=
X-Google-Smtp-Source: AGHT+IGV03Pl9AQwiLzwXsYo2beEMoMSWrGSGoCKgRfbkG+PrR7p5pv9tGMAyclr03pPq+vN5TQloAV+Py294L3Ea9c=
X-Received: by 2002:a05:6820:4c85:b0:613:bd07:54cc with SMTP id
 006d021491bc7-613cd02aac7mr1117259eaf.0.1752056057126; Wed, 09 Jul 2025
 03:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250709100512.3762063-1-guoqing.zhang@amd.com>
 <20250709100512.3762063-5-guoqing.zhang@amd.com>
In-Reply-To: <20250709100512.3762063-5-guoqing.zhang@amd.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 9 Jul 2025 12:14:06 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hAHfL-Vamh-OAGJ73oVnoRDXh3QqLd8+NjNFsU5yWwcg@mail.gmail.com>
X-Gm-Features: Ac12FXyFX77CgkWVTAu-0wLPoDSeMMEFLfqSFYTRgAjt5vPCEE2oN68SUekAwCY
Message-ID: <CAJZ5v0hAHfL-Vamh-OAGJ73oVnoRDXh3QqLd8+NjNFsU5yWwcg@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] PM: hibernate: add new api
 pm_hibernate_is_recovering()
To: Samuel Zhang <guoqing.zhang@amd.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, rafael@kernel.org, 
 len.brown@intel.com, pavel@kernel.org, gregkh@linuxfoundation.org, 
 dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com, 
 matthew.auld@intel.com, matthew.brost@intel.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 mario.limonciello@amd.com, lijo.lazar@amd.com, victor.zhao@amd.com, 
 haijun.chang@amd.com, Qing.Ma@amd.com, Owen.Zhang2@amd.com, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Wed, Jul 9, 2025 at 12:05=E2=80=AFPM Samuel Zhang <guoqing.zhang@amd.com=
> wrote:
>
> dev_pm_ops.thaw() is called in following cases:
> * normal case: after hibernation image has been created.
> * error case 1: creation of a hibernation image has failed.
> * error case 2: restoration from a hibernation image has failed.
>
> For normal case, it is called mainly for resume storage devices for
> saving the hibernation image. Other devices that are not involved
> in the image saving do not need to resume the device. But since there's
> no api to know which case thaw() is called, device drivers can't
> conditionally resume device in thaw().
>
> The new pm_hibernate_is_recovering() is such a api to query if thaw() is
> called in normal case.
>
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> ---
>  drivers/base/power/main.c | 14 ++++++++++++++
>  include/linux/pm.h        |  2 ++
>  2 files changed, 16 insertions(+)
>
> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> index 40e1d8d8a589..ff78cf96f795 100644
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -63,6 +63,20 @@ static LIST_HEAD(dpm_noirq_list);
>  static DEFINE_MUTEX(dpm_list_mtx);
>  static pm_message_t pm_transition;
>
> +/**
> + * pm_hibernate_is_recovering - if recovering from hibernate due to erro=
r.
> + *
> + * Used to query if dev_pm_ops.thaw() is called for normal hibernation c=
ase or
> + * recovering from some error.
> + *
> + * Return: true for error case, false for normal case.
> + */
> +bool pm_hibernate_is_recovering(void)
> +{
> +       return pm_transition.event =3D=3D PM_EVENT_RECOVER;
> +}
> +EXPORT_SYMBOL_GPL(pm_hibernate_is_recovering);
> +
>  static int async_error;
>
>  static const char *pm_verb(int event)
> diff --git a/include/linux/pm.h b/include/linux/pm.h
> index 78855d794342..f54a803f2afb 100644
> --- a/include/linux/pm.h
> +++ b/include/linux/pm.h
> @@ -657,6 +657,8 @@ struct pm_subsys_data {
>  #define DPM_FLAG_SMART_SUSPEND         BIT(2)
>  #define DPM_FLAG_MAY_SKIP_RESUME       BIT(3)
>
> +bool pm_hibernate_is_recovering(void);
> +

Please add this to suspend.h instead (preferably after the
is_hibernate_resume_dev definition).

>  struct dev_pm_info {
>         pm_message_t            power_state;
>         bool                    can_wakeup:1;
> --
