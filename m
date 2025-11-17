Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C154C66022
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 20:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFC610E3F7;
	Mon, 17 Nov 2025 19:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IYhBaFbl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1786910E085
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 19:43:44 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-297f5278e5cso7143035ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 11:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763408623; x=1764013423; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/+5Hf3TIECg/WJ3vcEYDCdeJ1dVpbMxZKUO+m2nTD5o=;
 b=IYhBaFblCfRKQtT21F+Ea7CWbQg4np1wAkp/9MigXLxI5tdeHiv79mGWsHTri58MFD
 pSZDJuEuKxEtWZ1pHc7nZDT1yhKJ9XtR9HNAq+/U6+Gpp8WrDT2gVBJLLO8+MC0/qgcQ
 IXLosI90jiX429uv//Vq+nb/qTEdVL8efdqJnaFvy2RmPaFGr/f95ZvxJG53wRObRjjL
 Ii9HWGli5gGXMTFbLNrHHMjeFX+5Z2Tk+6w0PmRrXhYhWzvucfqYoJaSRpPVjNJO3/zZ
 GEIVUNbvDJ9GMPHOz6MSlIIfskCni0iEwLa6rBmNOXnsD/GNRIt2EDewd0gLUtM5vJpS
 0w/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763408623; x=1764013423;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/+5Hf3TIECg/WJ3vcEYDCdeJ1dVpbMxZKUO+m2nTD5o=;
 b=ViSFvf5Aw3lza6xB2K2elxy0Cs7+xifhl286d6xrBP1Tn0Xt7kSaBtJUGvoX/LTCN8
 3GqOLCXyLwWmgzcAt2TxC7jXQURDJFA2tw0po2zyaBTIYrOu4cGrNT5zJsYD7oXriMNi
 8fnJVTlpGDhmeFAvEVKhq0+lSW6E1dlhruJiYq2xxATnz1kyQofkmba/MeJEb9uV4KWu
 fQICZv8vLESuIL91vRo6OBXFJ1qxMJe/EOU3hxiVT7mFEKzgpb/a6Y7yKD3MpNb9BiTQ
 Dm1SuwM5rEQF6UQM8anxjAjsZH2XHfn9d20L2Txkpyu/zq4i+hYwUEhfXZ2Wvi4drZNh
 Wc9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPgKSQMebhdb1A5+LZcDs3mxlnB0ht2I2UxfCnIpSyKgG5rYVjBGHpu3kj1bQviIFEXxvQJrjQsXU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCff5JHzFkV6cLaXM4pl1raMDIfBioc9hiBbt0Nvb7mpwfdV8Z
 PpBMQ6Zl9H4nCKlHbQNlIUPu6QJr++hOwBHtl/68+a+3tjyeWiF2LN15T+StEv6nnmb1svAWZpa
 mU/icbzNnxMJccD1jEPouUAtYGURDltY=
X-Gm-Gg: ASbGncv3VJ1WxGiDrlSW7trkOlnA+CocwI4mGnsdRyoy6asNMnnh8HPFr/qDVz/GX7r
 3gVgitFL7I1bqX51KiZlDGq8rhkg94/VJvGuzp1Soo6XsZchYbjxzHo6lBlNhzn6JbGG4XXQH9w
 iT0wAyQblF+OoEqoct7RZGGmmX1j2C6+Nh9jyXcNoRCbrDrhjnukMHAT7o3Eu5LNlUtcocFewZD
 MLt1rG2n+zjQCZoSgtm3GtKOQrUS8Zvy3PFoH01RJaJLrGWy5fyurd5r13o
X-Google-Smtp-Source: AGHT+IFJT7XNlWHFboAYjTqdvl7ansBxArPIS/GzhzEzb3yO8TC3LpcI1Q9gDnb4O5U1xZ57lT1Bq32f9CGrvBl2Zyo=
X-Received: by 2002:a05:7022:e0d:b0:119:e55a:95a1 with SMTP id
 a92af1059eb24-11b493dbc02mr4800591c88.3.1763408623379; Mon, 17 Nov 2025
 11:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20251114-vram-carveout-tuning-for-upstream-v2-0-4f6bdd48030d@amd.com>
 <20251114-vram-carveout-tuning-for-upstream-v2-2-4f6bdd48030d@amd.com>
In-Reply-To: <20251114-vram-carveout-tuning-for-upstream-v2-2-4f6bdd48030d@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 Nov 2025 14:43:32 -0500
X-Gm-Features: AWmQ_bn-rx8YdtVYoFVyGRgVCjAn1BgDod9sCkmCCuCja0xAzzBGgF5NjOGu8mg
Message-ID: <CADnq5_POzLjMetvQAW6gi8Emp5OM-VyrVmKGJ5t5w2S=5POjxw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] drm/amdgpu: add helper to read UMA carveout info
To: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, "Tsao, Anson" <anson.tsao@amd.com>, 
 "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
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

On Fri, Nov 14, 2025 at 3:52=E2=80=AFAM Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.=
com> wrote:
>
> Currently, the available UMA allocation configs in the integrated system
> information table have not been parsed. Add a helper function to retrieve
> and store these configs.
>
> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h              | 32 +++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c         |  2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c | 73 ++++++++++++++++++=
++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h |  2 +
>  4 files changed, 109 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index a5574e84694b..2c1123291577 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1675,6 +1675,38 @@ struct amdgpu_numa_info {
>         int nid;
>  };
>
> +#define MAX_UMA_OPTION_NAME    28
> +#define MAX_UMA_OPTION_ENTRIES 19
> +
> +#define AMDGPU_UMA_FLAG_AUTO   BIT(1)
> +#define AMDGPU_UMA_FLAG_CUSTOM BIT(0)
> +
> +/**
> + * struct amdgpu_uma_carveut_option - single UMA carveout option
> + * @name: Name of the carveout option
> + * @memory_carved: Amount of memory carved
> + * @flags: ATCS flags supported by this option
> + */
> +struct amdgpu_uma_carveout_option {
> +       char name[MAX_UMA_OPTION_NAME];
> +       uint8_t memory_carved;
> +       uint8_t flags;
> +};
> +
> +/**
> + * struct amdgpu_uma_carveut_info - table of available UMA carveout opti=
ons
> + * @num_entries: Number of available options
> + * @uma_option_index: The index of the option currently applied
> + * @update_lock: Lock to serialize changes to the option
> + * @entries: The array of carveout options
> + */
> +struct amdgpu_uma_carveout_info {
> +       uint8_t num_entries;
> +       uint8_t uma_option_index;
> +       struct mutex update_lock;
> +       struct amdgpu_uma_carveout_option entries[MAX_UMA_OPTION_ENTRIES]=
;
> +};
> +
>  /* ATCS Device/Driver State */
>  #define AMDGPU_ATCS_PSC_DEV_STATE_D0           0
>  #define AMDGPU_ATCS_PSC_DEV_STATE_D3_HOT       3
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_acpi.c
> index 0743fd8620e4..d442dc442d34 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -38,6 +38,7 @@
>  #include "amdgpu_display.h"
>  #include "amd_acpi.h"
>  #include "atom.h"
> +#include "amdgpu_atomfirmware.h"
>
>  /* Declare GUID for AMD _DSM method for XCCs */
>  static const guid_t amd_xcc_dsm_guid =3D GUID_INIT(0x8267f5d5, 0xa556, 0=
x44f2,
> @@ -125,6 +126,7 @@ struct amdgpu_atcs {
>         acpi_handle handle;
>
>         struct amdgpu_atcs_functions functions;
> +       struct amdgpu_uma_carveout_info uma_info;
>  };
>
>  static struct amdgpu_acpi_priv {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_atomfirmware.c
> index 636385c80f64..b1463bb594aa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
> @@ -296,6 +296,79 @@ static int convert_atom_mem_type_to_vram_type(struct=
 amdgpu_device *adev,
>         return vram_type;
>  }
>
> +static int amdgpu_atomfirmware_get_uma_carveout_info_v2_3(struct amdgpu_=
device *adev,
> +                                                         union igp_info =
*igp_info,
> +                                                         struct amdgpu_u=
ma_carveout_info *uma_info)
> +{
> +       struct uma_carveout_option *opts;
> +       uint8_t nr_uma_options;
> +       int i;
> +
> +       nr_uma_options =3D igp_info->v23.UMACarveoutIndexMax;
> +
> +       if (!nr_uma_options)
> +               return -ENODEV;
> +
> +       if (nr_uma_options > MAX_UMA_OPTION_ENTRIES) {
> +               drm_dbg(adev_to_drm(adev),
> +                       "Number of UMA options exceeds max table size. Op=
tions will not be parsed");
> +               return -EINVAL;
> +       }
> +
> +       uma_info->num_entries =3D nr_uma_options;
> +       uma_info->uma_option_index =3D igp_info->v23.UMACarveoutIndex;
> +
> +       opts =3D igp_info->v23.UMASizeControlOption;
> +
> +       for (i =3D 0; i < nr_uma_options; i++) {
> +               uma_info->entries[i].memory_carved =3D opts[i].memoryCarv=
edGb;
> +               uma_info->entries[i].flags =3D opts[i].uma_carveout_optio=
n_flags.all8;
> +               strscpy(uma_info->entries[i].name, opts[i].optionName, MA=
X_UMA_OPTION_NAME);
> +       }
> +
> +       return 0;
> +}
> +
> +int amdgpu_atomfirmware_get_uma_carveout_info(struct amdgpu_device *adev=
,
> +                                             struct amdgpu_uma_carveout_=
info *uma_info)
> +{
> +       struct amdgpu_mode_info *mode_info =3D &adev->mode_info;
> +       union igp_info *igp_info;
> +       u16 data_offset, size;
> +       u8 frev, crev;
> +       int index;
> +
> +       if (!(adev->flags & AMD_IS_APU))
> +               return -ENODEV;
> +
> +       index =3D get_index_into_master_table(atom_master_list_of_data_ta=
bles_v2_1,
> +                                           integratedsysteminfo);
> +
> +       if (!amdgpu_atom_parse_data_header(mode_info->atom_context,
> +                                         index, &size,
> +                                         &frev, &crev, &data_offset)) {
> +               return -EINVAL;
> +       }
> +
> +       igp_info =3D (union igp_info *)
> +                       (mode_info->atom_context->bios + data_offset);
> +
> +       switch (frev) {
> +       case 2:
> +               switch (crev) {
> +               case 3:
> +                       return amdgpu_atomfirmware_get_uma_carveout_info_=
v2_3(adev, igp_info, uma_info);
> +               break;
> +               default:
> +                       break;
> +               }
> +               break;
> +       default:
> +               break;
> +       }
> +       return -ENODEV;
> +}
> +
>  int
>  amdgpu_atomfirmware_get_vram_info(struct amdgpu_device *adev,
>                                   int *vram_width, int *vram_type,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_atomfirmware.h
> index 649b5530d8ae..67c8d105729b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
> @@ -32,6 +32,8 @@ void amdgpu_atomfirmware_scratch_regs_init(struct amdgp=
u_device *adev);
>  int amdgpu_atomfirmware_allocate_fb_scratch(struct amdgpu_device *adev);
>  int amdgpu_atomfirmware_get_vram_info(struct amdgpu_device *adev,
>         int *vram_width, int *vram_type, int *vram_vendor);
> +int amdgpu_atomfirmware_get_uma_carveout_info(struct amdgpu_device *adev=
,
> +                                             struct amdgpu_uma_carveout_=
info *uma_info);
>  int amdgpu_atomfirmware_get_clock_info(struct amdgpu_device *adev);
>  int amdgpu_atomfirmware_get_gfx_info(struct amdgpu_device *adev);
>  bool amdgpu_atomfirmware_mem_ecc_supported(struct amdgpu_device *adev);
>
> --
> 2.43.0
>
