Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 640538C8780
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 15:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F1810E9A3;
	Fri, 17 May 2024 13:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FqciInBf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C204110EED4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 13:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715954079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ckgzF/gF0LVkJPIHaMi6FsUAJKsbsEhiiso6m6KhFLY=;
 b=FqciInBfECmndZ1+u6oABqdWo0Bd+IWXLMsHkU5LcTbnD3uGwMYyrRWFxww22zUPowYF96
 58bTT7pqs5klw0js6L9fdI5u8oBIDWZES/16652BCXIJ3+L+/tRfeWpAIUpKFmkR/4GiwI
 DQRnfbDIzlTOgs7XpCvnkkxrUfLoefg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-bNDt2trpNROHW8ZMxX5_mA-1; Fri, 17 May 2024 09:54:38 -0400
X-MC-Unique: bNDt2trpNROHW8ZMxX5_mA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a5a84e7c884so293470166b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 06:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715954077; x=1716558877;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ckgzF/gF0LVkJPIHaMi6FsUAJKsbsEhiiso6m6KhFLY=;
 b=IeXbaWiHx2jOvyIvgDHo4+QDpQBU0i67gXofqUl5SIS4DNW3KCVzJTWjhKRD2yf6qN
 SeaSUkstWueIf60ae7PTKDY7opXGTdZnr05xfUqq6rtM6G7UftKtXknlbzrP5ekYwz1R
 eiE8DJPCs3r2p/BguQPy7MBiYEs1apSOGqq1KbhMYJq01DbBV4D+2x7a35gCgKKEsfGX
 TQNpPiz4ZYgbMCTX2SACKnLkAvrWvSX7/tgj07Yj14/iS2rZxl6T4rD5SVYx3IUxLr2B
 slNmc0rBvVu7ikGUPoyFtM1k/wekWAPeDomZtTJf5H7GUKCYQVxtDzgiw79qrUn+2ZMR
 hfrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvpHvnGi5S6StA+VZSrF9aLLX8QqHodquxrgrZ1iFPE9ajtgIo1jQXgZpRW9hxPwlOTohGBauTnKqcr7NkHlR0cwWJeiueixCp7bL+cA49
X-Gm-Message-State: AOJu0Yy+yXBqWvsApWIrAG3Mlxz7UfY9iIM8vrRPZTSeWGErtpbZ3Xid
 9ljXUvJrju+Q7Hg/75N910tFKarlKNqpXi3ElAEbXysAvM12R9ITm5szw2TEy+nvsIhazJGlbwI
 supftb3FlHcY8rHba55qnGQgqjehqDvLI7do18ZPgWPgrjG4x9xCA1hcBvbvnKjQG3Q==
X-Received: by 2002:a17:906:ae45:b0:a59:c208:a4c with SMTP id
 a640c23a62f3a-a5a2d583d60mr1357057566b.17.1715954076950; 
 Fri, 17 May 2024 06:54:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfJJCDx/mcZGpVUvsHhPUh6z3RkyZXkBJ3RqvMnfIOyn/dCG2D89v/HagZxG/or5jXzYtY3Q==
X-Received: by 2002:a17:906:ae45:b0:a59:c208:a4c with SMTP id
 a640c23a62f3a-a5a2d583d60mr1357053966b.17.1715954076330; 
 Fri, 17 May 2024 06:54:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17cd0sm1114128366b.214.2024.05.17.06.54.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 May 2024 06:54:35 -0700 (PDT)
Message-ID: <d074cf56-c7e4-41ba-9e8e-931a5d350578@redhat.com>
Date: Fri, 17 May 2024 15:54:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arch: Fix name collision with ACPI's video.o
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de,
 chaitanya.kumar.borah@intel.com, suresh.kumar.kurmi@intel.com,
 jani.saarinen@intel.com, davem@davemloft.net, andreas@gaisler.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org
Cc: linux-arch@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-acpi@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240517091557.25800-1-tzimmermann@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240517091557.25800-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 5/17/24 11:14 AM, Thomas Zimmermann wrote:
> Commit 2fd001cd3600 ("arch: Rename fbdev header and source files")
> renames the video source files under arch/ such that they do not
> refer to fbdev any longer. The new files named video.o conflict with
> ACPI's video.ko module. Modprobing the ACPI module can then fail with
> warnings about missing symbols, as shown below.
> 
>   (i915_selftest:1107) igt_kmod-WARNING: i915: Unknown symbol acpi_video_unregister (err -2)
>   (i915_selftest:1107) igt_kmod-WARNING: i915: Unknown symbol acpi_video_register_backlight (err -2)
>   (i915_selftest:1107) igt_kmod-WARNING: i915: Unknown symbol __acpi_video_get_backlight_type (err -2)
>   (i915_selftest:1107) igt_kmod-WARNING: i915: Unknown symbol acpi_video_register (err -2)
> 
> Fix the issue by renaming the architecture's video.o to video-common.o.
> 
> Reported-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Closes: https://lore.kernel.org/intel-gfx/9dcac6e9-a3bf-4ace-bbdc-f697f767f9e0@suse.de/T/#t
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 2fd001cd3600 ("arch: Rename fbdev header and source files")
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-arch@vger.kernel.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  arch/sparc/video/Makefile                    | 2 +-
>  arch/sparc/video/{video.c => video-common.c} | 0
>  arch/x86/video/Makefile                      | 2 +-
>  arch/x86/video/{video.c => video-common.c}   | 0
>  4 files changed, 2 insertions(+), 2 deletions(-)
>  rename arch/sparc/video/{video.c => video-common.c} (100%)
>  rename arch/x86/video/{video.c => video-common.c} (100%)
> 
> diff --git a/arch/sparc/video/Makefile b/arch/sparc/video/Makefile
> index fdf83a408d750..dcfbe7a5912c0 100644
> --- a/arch/sparc/video/Makefile
> +++ b/arch/sparc/video/Makefile
> @@ -1,3 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> -obj-y	+= video.o
> +obj-y	+= video-common.o
> diff --git a/arch/sparc/video/video.c b/arch/sparc/video/video-common.c
> similarity index 100%
> rename from arch/sparc/video/video.c
> rename to arch/sparc/video/video-common.c
> diff --git a/arch/x86/video/Makefile b/arch/x86/video/Makefile
> index fdf83a408d750..dcfbe7a5912c0 100644
> --- a/arch/x86/video/Makefile
> +++ b/arch/x86/video/Makefile
> @@ -1,3 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> -obj-y	+= video.o
> +obj-y	+= video-common.o
> diff --git a/arch/x86/video/video.c b/arch/x86/video/video-common.c
> similarity index 100%
> rename from arch/x86/video/video.c
> rename to arch/x86/video/video-common.c

