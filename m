Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3F62ADC9E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 18:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C3689B0C;
	Tue, 10 Nov 2020 17:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C28B899BC;
 Tue, 10 Nov 2020 17:08:21 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a3so2486794wmb.5;
 Tue, 10 Nov 2020 09:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MP7B63t+yoSacKBIptO0FK7JGIG1SuX3J5XEKrv0R1g=;
 b=D9I8wAmHqyj+i4Uu96Y3bxWuJs3MnB2WC/JIbN6DbaOyTMwPBbA8ODwB52W4GvoAvb
 xjwHAsANSAGGzyuDDR2ls0rUkeKCWRxVeGD2mQ7+87wnFJY1f1Xj7q8BEKXwyOsggHqj
 /jOye5LWn2xuMbLaJXVBSRRIK/x1KzVpyGXSft/jLaN+nvChjCPfUezvtfph5j3Tpfxo
 hyNOdkuc7/0CG1lFxptmNQHEAIg4rGEVXTdauIOMcqOYTucImAz69W92OP7Q39DUWOL+
 a/qheGe2KBsQ6aKDhC2R3Ww4LoiShOAxnyTBR93S5YVs59wd+vD68cE3Cg5g0VY5Hiyx
 F1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MP7B63t+yoSacKBIptO0FK7JGIG1SuX3J5XEKrv0R1g=;
 b=fVsNp2MIOhFZpety0Sd/ICx/6+QwmQtbDDFw2gVKTfMxvyTlzOYXtxvZEqNqLsc22c
 4GC4Ygqu10q0dwe4uKfaspQPP1nQhxr92drs43yH0SD9/oTlvGUjzoeWtnIvJfY5lV/k
 Ggm6Gx0YEY9g6jitGXlzCDTuYsX0mOZjmLOD8nkGZobzgeTn0fGcUcX1fPMbuz+AnzUO
 wzjGT+CWsM1JsG9/DUzBg13E/MNJkTPrdCaJOPXZT1M6Hpsa+JHJx21xD8y+zIhmvyXl
 8u5ZHhalJY4seiFBbUx4WnfA7TOpRx2qjYbBmf6PoXzUgs1V07kBzMaeWRCukLTmkcEx
 Bo+w==
X-Gm-Message-State: AOAM531fOIOg/2eFs92kNq31QmeVasWmSUiJYOni27jeXpddQtR7xnjD
 yioUdhEH76prwHcwyNNHyuqDfqYOSUWbWB6ZpuA=
X-Google-Smtp-Source: ABdhPJy+/O/G/wQ1/tkGUAuIUq6m+EmoOJdfu31KWO7h4nmLps/WriPVMU3WAjYlWrOfFv9oDEtJ/9IVu/k8k4eKnzY=
X-Received: by 2002:a1c:80cb:: with SMTP id b194mr42687wmd.73.1605028100187;
 Tue, 10 Nov 2020 09:08:20 -0800 (PST)
MIME-Version: 1.0
References: <1605008098-33391-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1605008098-33391-1-git-send-email-tiantao6@hisilicon.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 12:08:08 -0500
Message-ID: <CADnq5_NcF1-mmGQAuGjOE65wvjmxwZSRqovi2M5Kp6-gic-BZQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Use kmemdup instead of kmalloc and memcpy
To: Tian Tao <tiantao6@hisilicon.com>
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Dewar <alex.dewar90@gmail.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Quan, Evan" <evan.quan@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 10, 2020 at 11:57 AM Tian Tao <tiantao6@hisilicon.com> wrote:
>
> Fixes coccicheck warning:
> drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c:255:
> 36-43: WARNING opportunity for kmemdup
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
> index 740e2fc..1e79baa 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
> @@ -252,12 +252,11 @@ static int init_powerplay_table_information(
>         phm_copy_clock_limits_array(hwmgr, &pptable_information->power_saving_clock_max, powerplay_table->PowerSavingClockMax, ATOM_VEGA12_PPCLOCK_COUNT);
>         phm_copy_clock_limits_array(hwmgr, &pptable_information->power_saving_clock_min, powerplay_table->PowerSavingClockMin, ATOM_VEGA12_PPCLOCK_COUNT);
>
> -       pptable_information->smc_pptable = kmalloc(sizeof(PPTable_t), GFP_KERNEL);
> +       pptable_information->smc_pptable = kmemdup(&(powerplay_table->smcPPTable),
> +                                                  sizeof(PPTable_t), GFP_KERNEL);
>         if (pptable_information->smc_pptable == NULL)
>                 return -ENOMEM;
>
> -       memcpy(pptable_information->smc_pptable, &(powerplay_table->smcPPTable), sizeof(PPTable_t));
> -
>         result = append_vbios_pptable(hwmgr, (pptable_information->smc_pptable));
>
>         return result;
> --
> 2.7.4
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
