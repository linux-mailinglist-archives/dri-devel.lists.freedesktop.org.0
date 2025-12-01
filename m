Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A950C962A9
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 09:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86DD810E33B;
	Mon,  1 Dec 2025 08:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N1Jtfoao";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AAA210E33B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 08:30:51 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2956d816c10so41902435ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 00:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764577851; x=1765182651; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YRqx+zq6MV9VeTwc28uE5sAPkmHEV1/sluHR5vInZzw=;
 b=N1JtfoaoB958HQYPqLbM7GRxMTOUyxvjEkomeJ85xuZitcA9RY/zITGEeSREUBGKjQ
 Y5/RxHaP7WOun77phqJiTVfVKwUbVA6uNYAcggrrex3kNt24dUJZeIrnZKWk+Y3I1hA1
 Ay/HACpPTNUYa3X8XV4u+HCqGPiqvcStWMhpzT8ZpdCWcpC9dOsCIIzwkfCHK9ft9iu/
 r+6M4YdMTEnoHLJAm6PFu7g4/RkCU2DebfeBaDow1lHcPyXkXqgIppG3DPOrFvYPwl/6
 uxToOXqYIiasvLT0RCHR8G8KmCXGk+DOZu3/4CWqKX26zHp9kmZfv8nkE1wAzaisKMX7
 49dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764577851; x=1765182651;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YRqx+zq6MV9VeTwc28uE5sAPkmHEV1/sluHR5vInZzw=;
 b=O0vBCRZT22mMHUCN/C98QzQ4QizgoRySfIaLBiRVILum6IABmknGEbJS89tfD1IKgh
 m5wYb0HbNfPQXYhqK0rNnY+QKJXUgqCiuJ/2muwG5bjQuLC/fdird9PqymWxiceJJKn7
 DGysw0/08ySgo85LVVygOj1sOG7KPm+MLjAIYgp0nfEzMVgKqz1vjlt79GN/iALjDWI2
 KxeqFwULBjDYWAGhrEZrAc6XMhCtFPw2msMaxcU7Nk7cchnwrkUW2o2MeB9JiuKsVADg
 nGkQk/mMaW8zPGpDzL4gMHSco6hglyFCdD8Q6sjudWuTZgEuJKGdBBLJOulhQ3GHbBpW
 FxUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR1DO8QLtcU0n9w3yRkJBy4JeGA2dyQhkEMYkpQOS1UwAFXRLopVeZxWi4lDPe52Z6Yplxleh/LMQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1NEt/ml51AW+3LdmUYiczTvAjUeyeOU6ROK/KvMVV8wyic+N2
 5VpjAzEAqKx2x6LDfvfNu04++dbUIM5HbGotwl1KolSUtJyV1uRZf2Xq
X-Gm-Gg: ASbGncsB9lM4pnncC8YNN1BSwLmGV+9I3Oi3O+a/O/UJ20v5qzVr7BS1qGCr6B9D0Ax
 NXBdC/9DZGBqFQFdD2t2EJHDX3P9qnEg+k9FL6+gdOB69H4l5JTed8VR+xQDA+zFs8KtI8cVvel
 BteJndbkMMQML4ABoEDMl2UJGCJhVwyOM/2Nu61i2zjN2vcVX8exBk6fxkEGKNBDO0UoN/tt8qw
 4Yctdz+MdGjh7jcrZ47Lu57DqC/v2J6NoRX2MtlLyyhYVE+hE/x2gVvvlFQlc/OJ8rGxzxRRWoU
 zEiew7sOUpbCtbaFhwN++WhmaTsmZ0/CewCWcO3JFRHHABgxT8H9FsV8F1Vgh9iRuE9nKohgZkF
 rkouR2DhjAqPtFGV5Xd3GwgNDe6Z6hEIjHT8ldZSn5G30o0zpnEVySeS+hqFb5igKci7k+ZN5Nv
 1c94JXDLpaSQQQsM/cqZ9c
X-Google-Smtp-Source: AGHT+IFW9UJkWdGVik+RSQYeEpxrY0mwOpthUJGwwDnRRi307Q5DK2ltXPn3UBb6Ty9M1AXX5CNwmg==
X-Received: by 2002:a17:902:d588:b0:29b:6845:6214 with SMTP id
 d9443c01a7336-29b6be8c872mr440193065ad.3.1764577850566; 
 Mon, 01 Dec 2025 00:30:50 -0800 (PST)
Received: from google.com ([2401:fa00:95:201:2a71:e28f:ae3c:b20c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29bce441e59sm116914635ad.33.2025.12.01.00.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 00:30:49 -0800 (PST)
Date: Mon, 1 Dec 2025 16:30:43 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, "Tsao, Anson" <anson.tsao@amd.com>,
 "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
Subject: Re: [PATCH v3 2/5] drm/amdgpu: add helper to read UMA carveout info
Message-ID: <aS1SM0sENT510Feo@google.com>
References: <20251126-vram-carveout-tuning-for-upstream-v3-0-cf1729c4cb3c@amd.com>
 <20251126-vram-carveout-tuning-for-upstream-v3-2-cf1729c4cb3c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-vram-carveout-tuning-for-upstream-v3-2-cf1729c4cb3c@amd.com>
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

Hi Leo and Mario,

On Wed, Nov 26, 2025 at 05:05:13PM +0800, Yo-Jung Leo Lin (AMD) wrote:
> Currently, the available UMA allocation configs in the integrated system
> information table have not been parsed. Add a helper function to retrieve
> and store these configs.
> 
> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h              | 32 ++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c         |  2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c | 77 ++++++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h |  2 +
>  4 files changed, 113 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 9f9774f58ce1..6873c020b923 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1675,6 +1675,38 @@ struct amdgpu_numa_info {
>  	int nid;
>  };
>  
> +#define MAX_UMA_OPTION_NAME	28
> +#define MAX_UMA_OPTION_ENTRIES	19
> +
> +#define AMDGPU_UMA_FLAG_AUTO	BIT(1)
> +#define AMDGPU_UMA_FLAG_CUSTOM	BIT(0)
> +
> +/**
> + * struct amdgpu_uma_carveut_option - single UMA carveout option

Nit: struct amdgpu_uma_carve*o*ut_option

> + * @name: Name of the carveout option
> + * @memory_carved_mb: Amount of memory carved in MB
> + * @flags: ATCS flags supported by this option
> + */
> +struct amdgpu_uma_carveout_option {
> +	char name[MAX_UMA_OPTION_NAME];
> +	uint32_t memory_carved_mb;
> +	uint8_t flags;
> +};
> +
> +/**
> + * struct amdgpu_uma_carveut_info - table of available UMA carveout options

Ditto: struct amdgpu_uma_carve*o*ut_info

Regards,
Kuan-Wei

> + * @num_entries: Number of available options
> + * @uma_option_index: The index of the option currently applied
> + * @update_lock: Lock to serialize changes to the option
> + * @entries: The array of carveout options
> + */
> +struct amdgpu_uma_carveout_info {
> +	uint8_t num_entries;
> +	uint8_t uma_option_index;
> +	struct mutex update_lock;
> +	struct amdgpu_uma_carveout_option entries[MAX_UMA_OPTION_ENTRIES];
> +};
> +
>  /* ATCS Device/Driver State */
>  #define AMDGPU_ATCS_PSC_DEV_STATE_D0		0
>  #define AMDGPU_ATCS_PSC_DEV_STATE_D3_HOT	3
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index 610449d73a6c..92070738bd42 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -38,6 +38,7 @@
>  #include "amdgpu_display.h"
>  #include "amd_acpi.h"
>  #include "atom.h"
> +#include "amdgpu_atomfirmware.h"
>  
>  /* Declare GUID for AMD _DSM method for XCCs */
>  static const guid_t amd_xcc_dsm_guid = GUID_INIT(0x8267f5d5, 0xa556, 0x44f2,
> @@ -125,6 +126,7 @@ struct amdgpu_atcs {
>  	acpi_handle handle;
>  
>  	struct amdgpu_atcs_functions functions;
> +	struct amdgpu_uma_carveout_info uma_info;
>  };
>  
>  static struct amdgpu_acpi_priv {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
> index 636385c80f64..7f4751e5caaf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
> @@ -296,6 +296,83 @@ static int convert_atom_mem_type_to_vram_type(struct amdgpu_device *adev,
>  	return vram_type;
>  }
>  
> +static int amdgpu_atomfirmware_get_uma_carveout_info_v2_3(struct amdgpu_device *adev,
> +							  union igp_info *igp_info,
> +							  struct amdgpu_uma_carveout_info *uma_info)
> +{
> +	struct uma_carveout_option *opts;
> +	uint8_t nr_uma_options;
> +	int i;
> +
> +	nr_uma_options = igp_info->v23.UMACarveoutIndexMax;
> +
> +	if (!nr_uma_options)
> +		return -ENODEV;
> +
> +	if (nr_uma_options > MAX_UMA_OPTION_ENTRIES) {
> +		drm_dbg(adev_to_drm(adev),
> +			"Number of UMA options exceeds max table size. Options will not be parsed");
> +		return -EINVAL;
> +	}
> +
> +	uma_info->num_entries = nr_uma_options;
> +	uma_info->uma_option_index = igp_info->v23.UMACarveoutIndex;
> +
> +	opts = igp_info->v23.UMASizeControlOption;
> +
> +	for (i = 0; i < nr_uma_options; i++) {
> +		if (!opts[i].memoryCarvedGb)
> +			uma_info->entries[i].memory_carved_mb = 512;
> +		else
> +			uma_info->entries[i].memory_carved_mb = (uint32_t)opts[i].memoryCarvedGb << 10;
> +
> +		uma_info->entries[i].flags = opts[i].uma_carveout_option_flags.all8;
> +		strscpy(uma_info->entries[i].name, opts[i].optionName, MAX_UMA_OPTION_NAME);
> +	}
> +
> +	return 0;
> +}
> +
> +int amdgpu_atomfirmware_get_uma_carveout_info(struct amdgpu_device *adev,
> +					      struct amdgpu_uma_carveout_info *uma_info)
> +{
> +	struct amdgpu_mode_info *mode_info = &adev->mode_info;
> +	union igp_info *igp_info;
> +	u16 data_offset, size;
> +	u8 frev, crev;
> +	int index;
> +
> +	if (!(adev->flags & AMD_IS_APU))
> +		return -ENODEV;
> +
> +	index = get_index_into_master_table(atom_master_list_of_data_tables_v2_1,
> +					    integratedsysteminfo);
> +
> +	if (!amdgpu_atom_parse_data_header(mode_info->atom_context,
> +					  index, &size,
> +					  &frev, &crev, &data_offset)) {
> +		return -EINVAL;
> +	}
> +
> +	igp_info = (union igp_info *)
> +			(mode_info->atom_context->bios + data_offset);
> +
> +	switch (frev) {
> +	case 2:
> +		switch (crev) {
> +		case 3:
> +			return amdgpu_atomfirmware_get_uma_carveout_info_v2_3(adev, igp_info, uma_info);
> +		break;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +	return -ENODEV;
> +}
> +
>  int
>  amdgpu_atomfirmware_get_vram_info(struct amdgpu_device *adev,
>  				  int *vram_width, int *vram_type,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
> index 649b5530d8ae..67c8d105729b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
> @@ -32,6 +32,8 @@ void amdgpu_atomfirmware_scratch_regs_init(struct amdgpu_device *adev);
>  int amdgpu_atomfirmware_allocate_fb_scratch(struct amdgpu_device *adev);
>  int amdgpu_atomfirmware_get_vram_info(struct amdgpu_device *adev,
>  	int *vram_width, int *vram_type, int *vram_vendor);
> +int amdgpu_atomfirmware_get_uma_carveout_info(struct amdgpu_device *adev,
> +					      struct amdgpu_uma_carveout_info *uma_info);
>  int amdgpu_atomfirmware_get_clock_info(struct amdgpu_device *adev);
>  int amdgpu_atomfirmware_get_gfx_info(struct amdgpu_device *adev);
>  bool amdgpu_atomfirmware_mem_ecc_supported(struct amdgpu_device *adev);
> 
> -- 
> 2.43.0
> 
> 
