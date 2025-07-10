Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5A4AFFC0D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 10:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264A210E89A;
	Thu, 10 Jul 2025 08:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nwZ1eXoI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DB910E388;
 Thu, 10 Jul 2025 08:21:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CD8165C6D1B;
 Thu, 10 Jul 2025 08:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9C3C4CEF7;
 Thu, 10 Jul 2025 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752135688;
 bh=vZGC4utAN8Jf9kgiQ1OU9eVoRR/s/LZegXdZdbaWUUs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nwZ1eXoI7fqtm/S4j0EXI6RuCDnSvh6y8W27PzYPT7pPx9Qdi3E36ZGsKPNpdntyg
 djzLoS4vZN8K/v6B8ZUWumFZE4nS+j9+q0EVcbVSFmL37Mm+PaSJbIjC4kxsPFCCLY
 fiC15jL7Tf18sJfuTr9+J2fsHHs8OqAumYuKkcQ/TeJOCvCcfbjuoXkSBUJw9bzwjg
 PyW4kl9PC0dPH1vKNW4jkWkmfr91LekmtCulC6ufEcykXlX0tWzTfYaKOa/ppQiURL
 hhD66bQ2tXAORgA3G10GiNu8AE2hRGODEaDRrxD94SQhhC8EKtnTRtG5vApcZ3ObCh
 Z3LjDs2O1A3Jw==
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-2d09d495c6cso234344fac.3; 
 Thu, 10 Jul 2025 01:21:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUxZbaJDmmr12CwZAN/lZtx3ZvGVB6tIn8sp8lwMwjLlW/0eKCA7ams6DJQp02FN91uteHD66abEG9E@lists.freedesktop.org,
 AJvYcCVsDEq+tefKRwye82OnUmlvFCb+170y/hyhy9k0NckkzzdqKkWPZzLQuq26S7f9WvG3C5eaqfo5@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQHOBrPklPa4vtize95reewMAqPIOksGeLRW75B1qpyePvD6oS
 Yk3lu1ECjzQFW3vTHF27qdjfURXyD3Vl4g29MXB0CD7Z9+AC/uvKX5zRfUCsG7Tvm8AzqBnPpWy
 v5c7XlbhVULRLxNeuuQAia9G9QilFLwE=
X-Google-Smtp-Source: AGHT+IF/jRMTIGOY1PdngLNu1usC8M99C638yCwVzM6VG3sXyFaNfyL7DMzkpuc1Vd31N6pmaGxsai2kNCIVGCP0+oc=
X-Received: by 2002:a05:6870:40d5:b0:2e8:7953:ece7 with SMTP id
 586e51a60fabf-2ff10991555mr1234020fac.24.1752135687725; Thu, 10 Jul 2025
 01:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250710062313.3226149-1-guoqing.zhang@amd.com>
 <20250710062313.3226149-5-guoqing.zhang@amd.com>
In-Reply-To: <20250710062313.3226149-5-guoqing.zhang@amd.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 10 Jul 2025 10:21:15 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ha_XUJ4OK0G5RT1a1KFDTAz82jVDdCFRtKTCv8aoDdxA@mail.gmail.com>
X-Gm-Features: Ac12FXyuUHPZGj-fRagl7o7kPz3guIlAxJWSaIJW8PovsrLvRAObEgMY_8LU2pg
Message-ID: <CAJZ5v0ha_XUJ4OK0G5RT1a1KFDTAz82jVDdCFRtKTCv8aoDdxA@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] PM: hibernate: add new api
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

On Thu, Jul 10, 2025 at 8:23=E2=80=AFAM Samuel Zhang <guoqing.zhang@amd.com=
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

LGTM now, so

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

> ---
>  drivers/base/power/main.c | 14 ++++++++++++++
>  include/linux/suspend.h   |  2 ++
>  2 files changed, 16 insertions(+)
>
> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> index 24ebe7a635a7..c4817b379230 100644
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -66,6 +66,20 @@ static pm_message_t pm_transition;
>  static DEFINE_MUTEX(async_wip_mtx);
>  static int async_error;
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
>  static const char *pm_verb(int event)
>  {
>         switch (event) {
> diff --git a/include/linux/suspend.h b/include/linux/suspend.h
> index 6a3f92098872..d11a124b7a91 100644
> --- a/include/linux/suspend.h
> +++ b/include/linux/suspend.h
> @@ -426,6 +426,8 @@ int is_hibernate_resume_dev(dev_t dev);
>  static inline int is_hibernate_resume_dev(dev_t dev) { return 0; }
>  #endif
>
> +bool pm_hibernate_is_recovering(void);
> +
>  /* Hibernation and suspend events */
>  #define PM_HIBERNATION_PREPARE 0x0001 /* Going to hibernate */
>  #define PM_POST_HIBERNATION    0x0002 /* Hibernation finished */
> --
> 2.43.5
>
