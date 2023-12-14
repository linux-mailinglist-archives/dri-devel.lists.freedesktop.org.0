Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 442B881389C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 18:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B4710E9AE;
	Thu, 14 Dec 2023 17:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5791710E99A;
 Thu, 14 Dec 2023 17:34:30 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3ba0dfc9001so2149719b6e.2; 
 Thu, 14 Dec 2023 09:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702575269; x=1703180069; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=STnAG2tRSPrRkoOyuykDwCt+Qlz6ek3eimHvGihmNs0=;
 b=Y3elb+a3olxTHs674EJnRk2y3qDYljYqyTpe2dPdFnCX8+ewrZsY6ywTbuRd8RLx1T
 /N51B6iPDtMUdQtvyeNkIt25wLDMlgM9xMeZcNr46NsEArsBb7ZMU7BBGJNdUUPKwLMN
 KVbMQBbwEG26PAGID6jKkrYoZf1go/X2osQVdoufM6rG83szKaOuCYXtu35Xy7SH0b7E
 nmvaMuLwhF9vDEJHH7pEecHshAkpQhe2JMKexuyfTiFBLbwROxTZHL28tYD6B3TwqIz+
 k/Xwr7EzY9IMu1gY6sNIz5nhh3tL50bEmcvkoXJh+yuvV8QAGkD9aamP7lg/j/T+JFvp
 ehSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702575269; x=1703180069;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=STnAG2tRSPrRkoOyuykDwCt+Qlz6ek3eimHvGihmNs0=;
 b=AFFiSm5KL7IFieZ2g0das4hCpb1HdA0uAiyDXsoxNYSS9jeDlcftZOWzrQNyQkZ5rH
 yEMp2R+s/L8P1YQA+u3+2ZBxljAoQ3Arl9hNXa/kz69xJR6FgL8A42wwtobOQZoDsn9c
 rbXhy00ZMcBpsmg4sy731xfHYL8BtnFz5qliMY5DbGm+ndHi9fBFhJ14BvGCTcwo8tHg
 izpedO85Z1y6Sl9Yhy7aifhM25Lfj31XDI/K5VpBTWdt7phEVS0zJ/bL7rOl3CnkX099
 B/yMEPNbszwjX0j0DvcXlPg0B5FXAZ4SOCqZpzAYUfpVw8aruonspKcT+Xp8gj2AT22q
 z1/A==
X-Gm-Message-State: AOJu0Yzhhmd+rzMJaDzIVhFQutnDEbLItqorgQB66rhOHigrAmdxMsbB
 BMDfeJcGUO+G1gecfnc9Hgngwj9uih2Ah5I2FsU=
X-Google-Smtp-Source: AGHT+IEKWXuqR4paEmw7Kggq1mLCq+BUvr4vk5F8v0KAOYf0b9vtgQXx3a98CVOwSkts3/orRPdk1lsku2mdk6IYLwg=
X-Received: by 2002:a05:6871:230e:b0:1fb:75b:2bb0 with SMTP id
 sf14-20020a056871230e00b001fb075b2bb0mr6987571oab.108.1702575269550; Thu, 14
 Dec 2023 09:34:29 -0800 (PST)
MIME-Version: 1.0
References: <20231214165941.3484829-1-alexious@zju.edu.cn>
In-Reply-To: <20231214165941.3484829-1-alexious@zju.edu.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Dec 2023 12:34:18 -0500
Message-ID: <CADnq5_NO23GM_Mo=GNC5wXy-r6yfz3W6VM_7tZsbMivsCO6VyA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: fix a double-free in
 amdgpu_parse_extended_power_table
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
Cc: Lijo Lazar <lijo.lazar@amd.com>, Kees Cook <keescook@chromium.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Dec 14, 2023 at 12:20=E2=80=AFPM Zhipeng Lu <alexious@zju.edu.cn> w=
rote:
>
> The amdgpu_free_extended_power_table is called in every error-handling
> paths of amdgpu_parse_extended_power_table. However, after the following
> call chain of returning:
>
> amdgpu_parse_extended_power_table
>   |-> kv_dpm_init / si_dpm_init
>       (the only two caller of amdgpu_parse_extended_power_table)
>         |-> kv_dpm_sw_init / si_dpm_sw_init
>             (the only caller of kv_dpm_init / si_dpm_init, accordingly)
>               |-> kv_dpm_fini / si_dpm_fini
>                   (goto dpm_failed in xx_dpm_sw_init)
>                     |-> amdgpu_free_extended_power_table
>
> As above, the amdgpu_free_extended_power_table is called twice in this
> returning chain and thus a double-free is triggered. Similarily, the
> last kfree in amdgpu_parse_extended_power_table also cause a double free
> with amdgpu_free_extended_power_table in kv_dpm_fini.
>
> Fixes: 84176663e70d ("drm/amd/pm: create a new holder for those APIs used=
 only by legacy ASICs(si/kv)")
> Signed-off-by: Zhipeng Lu <alexious@zju.edu.cn>
> ---
>  .../gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c    | 52 +++++--------------
>  1 file changed, 13 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c b/drivers/gpu=
/drm/amd/pm/legacy-dpm/legacy_dpm.c
> index 81fb4e5dd804..60377747bab4 100644
> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c
> @@ -272,10 +272,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_=
device *adev)
>                                  le16_to_cpu(power_info->pplib4.usVddcDep=
endencyOnSCLKOffset));
>                         ret =3D amdgpu_parse_clk_voltage_dep_table(&adev-=
>pm.dpm.dyn_state.vddc_dependency_on_sclk,
>                                                                  dep_tabl=
e);
> -                       if (ret) {
> -                               amdgpu_free_extended_power_table(adev);
> +                       if (ret)
>                                 return ret;
> -                       }
>                 }
>                 if (power_info->pplib4.usVddciDependencyOnMCLKOffset) {
>                         dep_table =3D (ATOM_PPLIB_Clock_Voltage_Dependenc=
y_Table *)
> @@ -283,10 +281,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_=
device *adev)
>                                  le16_to_cpu(power_info->pplib4.usVddciDe=
pendencyOnMCLKOffset));
>                         ret =3D amdgpu_parse_clk_voltage_dep_table(&adev-=
>pm.dpm.dyn_state.vddci_dependency_on_mclk,
>                                                                  dep_tabl=
e);
> -                       if (ret) {
> -                               amdgpu_free_extended_power_table(adev);
> +                       if (ret)
>                                 return ret;
> -                       }
>                 }
>                 if (power_info->pplib4.usVddcDependencyOnMCLKOffset) {
>                         dep_table =3D (ATOM_PPLIB_Clock_Voltage_Dependenc=
y_Table *)
> @@ -294,10 +290,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_=
device *adev)
>                                  le16_to_cpu(power_info->pplib4.usVddcDep=
endencyOnMCLKOffset));
>                         ret =3D amdgpu_parse_clk_voltage_dep_table(&adev-=
>pm.dpm.dyn_state.vddc_dependency_on_mclk,
>                                                                  dep_tabl=
e);
> -                       if (ret) {
> -                               amdgpu_free_extended_power_table(adev);
> +                       if (ret)
>                                 return ret;
> -                       }
>                 }
>                 if (power_info->pplib4.usMvddDependencyOnMCLKOffset) {
>                         dep_table =3D (ATOM_PPLIB_Clock_Voltage_Dependenc=
y_Table *)
> @@ -305,10 +299,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_=
device *adev)
>                                  le16_to_cpu(power_info->pplib4.usMvddDep=
endencyOnMCLKOffset));
>                         ret =3D amdgpu_parse_clk_voltage_dep_table(&adev-=
>pm.dpm.dyn_state.mvdd_dependency_on_mclk,
>                                                                  dep_tabl=
e);
> -                       if (ret) {
> -                               amdgpu_free_extended_power_table(adev);
> +                       if (ret)
>                                 return ret;
> -                       }
>                 }
>                 if (power_info->pplib4.usMaxClockVoltageOnDCOffset) {
>                         ATOM_PPLIB_Clock_Voltage_Limit_Table *clk_v =3D
> @@ -339,10 +331,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_=
device *adev)
>                                 kcalloc(psl->ucNumEntries,
>                                         sizeof(struct amdgpu_phase_sheddi=
ng_limits_entry),
>                                         GFP_KERNEL);
> -                       if (!adev->pm.dpm.dyn_state.phase_shedding_limits=
_table.entries) {
> -                               amdgpu_free_extended_power_table(adev);
> +                       if (!adev->pm.dpm.dyn_state.phase_shedding_limits=
_table.entries)
>                                 return -ENOMEM;
> -                       }
>
>                         entry =3D &psl->entries[0];
>                         for (i =3D 0; i < psl->ucNumEntries; i++) {
> @@ -383,10 +373,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_=
device *adev)
>                         ATOM_PPLIB_CAC_Leakage_Record *entry;
>                         u32 size =3D cac_table->ucNumEntries * sizeof(str=
uct amdgpu_cac_leakage_table);
>                         adev->pm.dpm.dyn_state.cac_leakage_table.entries =
=3D kzalloc(size, GFP_KERNEL);
> -                       if (!adev->pm.dpm.dyn_state.cac_leakage_table.ent=
ries) {
> -                               amdgpu_free_extended_power_table(adev);
> +                       if (!adev->pm.dpm.dyn_state.cac_leakage_table.ent=
ries)
>                                 return -ENOMEM;
> -                       }
>                         entry =3D &cac_table->entries[0];
>                         for (i =3D 0; i < cac_table->ucNumEntries; i++) {
>                                 if (adev->pm.dpm.platform_caps & ATOM_PP_=
PLATFORM_CAP_EVV) {
> @@ -438,10 +426,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_=
device *adev)
>                                 sizeof(struct amdgpu_vce_clock_voltage_de=
pendency_entry);
>                         adev->pm.dpm.dyn_state.vce_clock_voltage_dependen=
cy_table.entries =3D
>                                 kzalloc(size, GFP_KERNEL);
> -                       if (!adev->pm.dpm.dyn_state.vce_clock_voltage_dep=
endency_table.entries) {
> -                               amdgpu_free_extended_power_table(adev);
> +                       if (!adev->pm.dpm.dyn_state.vce_clock_voltage_dep=
endency_table.entries)
>                                 return -ENOMEM;
> -                       }
>                         adev->pm.dpm.dyn_state.vce_clock_voltage_dependen=
cy_table.count =3D
>                                 limits->numEntries;
>                         entry =3D &limits->entries[0];
> @@ -493,10 +479,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_=
device *adev)
>                                 sizeof(struct amdgpu_uvd_clock_voltage_de=
pendency_entry);
>                         adev->pm.dpm.dyn_state.uvd_clock_voltage_dependen=
cy_table.entries =3D
>                                 kzalloc(size, GFP_KERNEL);
> -                       if (!adev->pm.dpm.dyn_state.uvd_clock_voltage_dep=
endency_table.entries) {
> -                               amdgpu_free_extended_power_table(adev);
> +                       if (!adev->pm.dpm.dyn_state.uvd_clock_voltage_dep=
endency_table.entries)
>                                 return -ENOMEM;
> -                       }
>                         adev->pm.dpm.dyn_state.uvd_clock_voltage_dependen=
cy_table.count =3D
>                                 limits->numEntries;
>                         entry =3D &limits->entries[0];
> @@ -525,10 +509,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_=
device *adev)
>                                 sizeof(struct amdgpu_clock_voltage_depend=
ency_entry);
>                         adev->pm.dpm.dyn_state.samu_clock_voltage_depende=
ncy_table.entries =3D
>                                 kzalloc(size, GFP_KERNEL);
> -                       if (!adev->pm.dpm.dyn_state.samu_clock_voltage_de=
pendency_table.entries) {
> -                               amdgpu_free_extended_power_table(adev);
> +                       if (!adev->pm.dpm.dyn_state.samu_clock_voltage_de=
pendency_table.entries)
>                                 return -ENOMEM;
> -                       }
>                         adev->pm.dpm.dyn_state.samu_clock_voltage_depende=
ncy_table.count =3D
>                                 limits->numEntries;
>                         entry =3D &limits->entries[0];
> @@ -548,10 +530,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_=
device *adev)
>                                  le16_to_cpu(ext_hdr->usPPMTableOffset));
>                         adev->pm.dpm.dyn_state.ppm_table =3D
>                                 kzalloc(sizeof(struct amdgpu_ppm_table), =
GFP_KERNEL);
> -                       if (!adev->pm.dpm.dyn_state.ppm_table) {
> -                               amdgpu_free_extended_power_table(adev);
> +                       if (!adev->pm.dpm.dyn_state.ppm_table)
>                                 return -ENOMEM;
> -                       }
>                         adev->pm.dpm.dyn_state.ppm_table->ppm_design =3D =
ppm->ucPpmDesign;
>                         adev->pm.dpm.dyn_state.ppm_table->cpu_core_number=
 =3D
>                                 le16_to_cpu(ppm->usCpuCoreNumber);
> @@ -583,10 +563,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_=
device *adev)
>                                 sizeof(struct amdgpu_clock_voltage_depend=
ency_entry);
>                         adev->pm.dpm.dyn_state.acp_clock_voltage_dependen=
cy_table.entries =3D
>                                 kzalloc(size, GFP_KERNEL);
> -                       if (!adev->pm.dpm.dyn_state.acp_clock_voltage_dep=
endency_table.entries) {
> -                               amdgpu_free_extended_power_table(adev);
> +                       if (!adev->pm.dpm.dyn_state.acp_clock_voltage_dep=
endency_table.entries)
>                                 return -ENOMEM;
> -                       }
>                         adev->pm.dpm.dyn_state.acp_clock_voltage_dependen=
cy_table.count =3D
>                                 limits->numEntries;
>                         entry =3D &limits->entries[0];
> @@ -606,10 +584,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_=
device *adev)
>                         ATOM_PowerTune_Table *pt;
>                         adev->pm.dpm.dyn_state.cac_tdp_table =3D
>                                 kzalloc(sizeof(struct amdgpu_cac_tdp_tabl=
e), GFP_KERNEL);
> -                       if (!adev->pm.dpm.dyn_state.cac_tdp_table) {
> -                               amdgpu_free_extended_power_table(adev);
> +                       if (!adev->pm.dpm.dyn_state.cac_tdp_table)
>                                 return -ENOMEM;
> -                       }
>                         if (rev > 0) {
>                                 ATOM_PPLIB_POWERTUNE_Table_V1 *ppt =3D (A=
TOM_PPLIB_POWERTUNE_Table_V1 *)
>                                         (mode_info->atom_context->bios + =
data_offset +
> @@ -645,10 +621,8 @@ int amdgpu_parse_extended_power_table(struct amdgpu_=
device *adev)
>                         ret =3D amdgpu_parse_clk_voltage_dep_table(
>                                         &adev->pm.dpm.dyn_state.vddgfx_de=
pendency_on_sclk,
>                                         dep_table);
> -                       if (ret) {
> -                               kfree(adev->pm.dpm.dyn_state.vddgfx_depen=
dency_on_sclk.entries);
> +                       if (ret)
>                                 return ret;
> -                       }
>                 }
>         }
>
> --
> 2.34.1
>
