Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168D365DAFB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 18:09:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6362010E5CE;
	Wed,  4 Jan 2023 17:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1EFB10E5CD;
 Wed,  4 Jan 2023 17:09:44 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 m7-20020a9d73c7000000b00683e2f36c18so16085243otk.0; 
 Wed, 04 Jan 2023 09:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v3SV/pRZ8kBLvbm32yVCANFhuKrE0mqli+M9WEjG9/g=;
 b=NtTfzMp8Uv94LYMmBNgNaWa9k9Ic79F8HfGVm5DUTWxbedBe8PI3OYGixCm9Ha5j6s
 Obuyi5r92oltw8vsC0VKaJqx5GNYRDAFjoBZMFRCpobo/w3PahmqlKl8nHq9E0OKc4Vr
 1JAXBIVNmONvfMwfCcdE1enfS2hHVXKX4SqCDfRvNzPXEvE4iMyOK9q5Kf4hIjjWGRUN
 pa8frZ89+Des6b/G9LuVpyQF2HBSmVijA+o7ZKb+rqdaKO5KZ5CBMFTE9VE7dYPzEPLB
 ++07iMgR2x+P273wPRftk51Z1zs37AuQdsLhL0GWBnlTcH6xCMEMcMyXSt1nSpOK3W6a
 Tvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v3SV/pRZ8kBLvbm32yVCANFhuKrE0mqli+M9WEjG9/g=;
 b=1FYwRuXyJQ8QXPcuOHsWNQhhIc/OybpFQIXnqZHeTd7ouk1krQ1kPBrwFaEnTQVf51
 4VkC+OeYdXtR16QQYeOFPGYjoFXd6EaKR+Lr8QCkjk/+K7d42FCnr5YyZUVoGBP79mUg
 bGf+UGZFhotkUAKDvXS0KuoaOHinFH98CUS67c1oVwcOaVpPT73Hqq3M+dM/KQVSUZv0
 OLOgYQkJaxdvtkJ9fqqn2UpGCIEMOTECCX1VN9A98DLQBHo5ul74IyhI6Gf9iEj6EetB
 ocJeR1fhuz21LpGOm6d8vVpbSUH9FRHWi9/0xzFE5i/m3bofaT0gYRhcWjgbcUyXgaK0
 vtCg==
X-Gm-Message-State: AFqh2koUQpdC/XiJx6Ghokpx/yzyxUs5nc1ZUETx8JroBcYAOdzgZQfT
 w7Uzf/MkcrjF1DUxEIEAcBBMAk4zeYzv0BvqqOw=
X-Google-Smtp-Source: AMrXdXsO5U+hyynlhinfooNiyQdtVxoQct8y+ZUzoE8fk296xHwLprRJoY/m4CkymQXu9HHO3iCbJULL7895QurkJZM=
X-Received: by 2002:a9d:62d1:0:b0:675:cde9:90b9 with SMTP id
 z17-20020a9d62d1000000b00675cde990b9mr3163048otk.123.1672852184006; Wed, 04
 Jan 2023 09:09:44 -0800 (PST)
MIME-Version: 1.0
References: <20230104164042.30271-1-mario.limonciello@amd.com>
 <20230104164042.30271-6-mario.limonciello@amd.com>
In-Reply-To: <20230104164042.30271-6-mario.limonciello@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 4 Jan 2023 12:09:32 -0500
Message-ID: <CADnq5_M-JFEYtEOJyBAP1Z9zBkA-=ck8ZZMUC5eJ42zp-_9KjQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/45] drm/amd: Add a new helper for loading/validating
 microcode
To: Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Lazar Lijo <Lijo.Lazar@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Carlos Soriano Sanchez <csoriano@redhat.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 4, 2023 at 11:42 AM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> All microcode runs a basic validation after it's been loaded. Each
> IP block as part of init will run both.
>
> Introduce a wrapper for request_firmware and amdgpu_ucode_validate.
> This wrapper will also remap any error codes from request_firmware
> to -ENODEV.  This is so that early_init will fail if firmware couldn't
> be loaded instead of the IP block being disabled.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v4->v5:
>  * Rename symbols for amdgpu_ucode_request/amdgpu_ucode_release
>  * Make argument const
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 36 +++++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h |  3 ++
>  2 files changed, 39 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> index eafcddce58d3..dc6af1fffdd9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> @@ -1312,3 +1312,39 @@ void amdgpu_ucode_ip_version_decode(struct amdgpu_device *adev, int block_type,
>
>         snprintf(ucode_prefix, len, "%s_%d_%d_%d", ip_name, maj, min, rev);
>  }
> +
> +/*
> + * amdgpu_ucode_request - Fetch and validate amdgpu microcode
> + *
> + * @adev: amdgpu device
> + * @fw: pointer to load firmware to
> + * @fw_name: firmware to load
> + *
> + * This is a helper that will use request_firmware and amdgpu_ucode_validate
> + * to load and run basic validation on firmware. If the load fails, remap
> + * the error code to -ENODEV, so that early_init functions will fail to load.
> + */
> +int amdgpu_ucode_request(struct amdgpu_device *adev, const struct firmware **fw,
> +                        const char *fw_name)
> +{
> +       int err = request_firmware(fw, fw_name, adev->dev);
> +
> +       if (err)
> +               return -ENODEV;
> +       err = amdgpu_ucode_validate(*fw);
> +       if (err)
> +               dev_dbg(adev->dev, "\"%s\" failed to validate\n", fw_name);
> +
> +       return err;
> +}
> +
> +/*
> + * amdgpu_ucode_release - Release firmware microcode
> + *
> + * @fw: pointer to firmware to release
> + */
> +void amdgpu_ucode_release(const struct firmware *fw)

This should be **fw if we want to set it to NULL.

Alex

> +{
> +       release_firmware(fw);
> +       fw = NULL;
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
> index 552e06929229..7fd2f04f7f98 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
> @@ -544,6 +544,9 @@ void amdgpu_ucode_print_sdma_hdr(const struct common_firmware_header *hdr);
>  void amdgpu_ucode_print_psp_hdr(const struct common_firmware_header *hdr);
>  void amdgpu_ucode_print_gpu_info_hdr(const struct common_firmware_header *hdr);
>  int amdgpu_ucode_validate(const struct firmware *fw);
> +int amdgpu_ucode_request(struct amdgpu_device *adev, const struct firmware **fw,
> +                        const char *fw_name);
> +void amdgpu_ucode_release(const struct firmware *fw);
>  bool amdgpu_ucode_hdr_version(union amdgpu_firmware_header *hdr,
>                                 uint16_t hdr_major, uint16_t hdr_minor);
>
> --
> 2.34.1
>
