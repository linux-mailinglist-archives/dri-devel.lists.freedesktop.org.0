Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D322CB03144
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 15:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF3D10E046;
	Sun, 13 Jul 2025 13:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YljWTIQF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550AA10E046
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 13:51:59 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso2149140f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 06:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752414717; x=1753019517; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VSHC3KhteT7nZkNgcxjgFubbkQJHf7yi4kx20sRVEr0=;
 b=YljWTIQF0Au750F+lCEvw1yEZnWWvgBwXtoNctCRjVTDPozkI92hyw+FnThWk0Z+I5
 WnDfrQwdlb2fwEI0dWkEX0PeGfobKPPYtOqhMiQnVppkMoQzBA4TfH3EcODDyBtfCbQp
 Y85eONxpZWKwQtHXdEg9bb7o8scdN0XeENbZiQ7iqQPe66QAWjgiluD1gu6sKFxaZvIt
 dTPWnqNQIQ/IaDUcsXrQsp6Fo77P/094KVbwnSFkPEvR3LHtPycRjfXsFFS2K5RF/hcF
 OtznOX1vOubsdUXJ/g8eZutXIIuNdSzsHJ3nHeMkkB8Cq2t5JRCXHUmbFAQ9E2HA9MZg
 rqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752414717; x=1753019517;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VSHC3KhteT7nZkNgcxjgFubbkQJHf7yi4kx20sRVEr0=;
 b=hG1hREw61DP1SIYCPddM/Y9dTjUAHMhTzrgSRMpWBpkrfmBwAJUP7llddzQen2+bUm
 I5p9wxqCl8gTTbQ96Tb2Cl+uEhOxUnwP0tLwjm2VB1DSrSBbpLye+PCGyNR/0+PDwzYw
 BuhlIORZln512+Hyd9H/sRSIU+VGo4Q5/DmGJV8+4HQyGT2rtuH1wjLWd4WxRGEHjYU7
 29NkgqwisHLFdVBVB6+dkV9ggWRdduvlcDbPur4xThWzlqVcrH9mrzwfvVKmByJpep/l
 hxoc5OYFcgsMo3eHgEhTcmnQEggV1//yQUzfLc+hXX0ezcOsTt7qLy5TF5BapjE1HGlI
 VGpQ==
X-Gm-Message-State: AOJu0Yw88fv+nzRKdI7tCfIcn5kwC3HF8Ils0LktA6AFUx/AyARW9RY2
 V3T9/NQQ8JGf9MfDTAtwdSJtzVFtUFcQhj+c0BPK21U94khaGbzciNa5
X-Gm-Gg: ASbGncvUl9kTTM7Tw7OBOgEDYrpTqcRIgl53sfFSp3hDLnRYtNA6XAUWRVbRCvzn2xL
 ka8yyjhuiSTnsYL6VZ1A6sX68dUC1MOm6bT2nDGzdS8WSag8+QFUFoAvMdUZptXCGS6aTOILjg6
 wvBNa2AAuWGVPWTbEzuqiXbYes6MWCUAsm13loMAdnksmC2h5LNzd1fYFUvXlalVK/Is2Orfh8l
 I2ng5KR7zlj9qT1V5YW36BsW//8ahYx/UT5WgOop5FsmBtvCV662Hjg5DHRe8fNCES8RPOHJ8xy
 /VAZ9vaArJL3+awKNyrlA3XVbuQVIgjQBi82sVk3jyLIVRO+r0B4tOe3iEfXoUhuw3TWyX4G8t2
 ThrZ9IrNkFGumBsjFR2GrMHW1v3zUcIsTmlCekZV1JD+mnC2uMcVYJsL3sB2hh/G4v/k=
X-Google-Smtp-Source: AGHT+IFIZ4Dh1XCh27ovH4HqYOPnanQQQENN0Fqhp638zpTNKyzmv+4e10tMQG7HUL7nKdchZtMAoA==
X-Received: by 2002:a05:6000:2a86:b0:3a5:5298:ce28 with SMTP id
 ffacd0b85a97d-3b5f18759a8mr6121982f8f.4.1752414717309; 
 Sun, 13 Jul 2025 06:51:57 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194?
 ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d4b5sm9955920f8f.53.2025.07.13.06.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Jul 2025 06:51:56 -0700 (PDT)
Message-ID: <11d29a7e-d36b-42e4-abe0-9f72a478c5c6@gmail.com>
Date: Sun, 13 Jul 2025 15:51:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: of: fix documentation reference
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250609-drm-misc-next-v1-1-a17b11a06940@gmail.com>
Content-Language: en-US, fr
In-Reply-To: <20250609-drm-misc-next-v1-1-a17b11a06940@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


Le 09/06/2025 à 15:35, Raphael Gallais-Pou a écrit :
> Documentation/devicetree/bindings/graph.txt content has move directly to
> the dt-schema repo.
>
> Point to the YAML of the official repo instead of the old file.
>
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Hi,

Gentle ping !

Best regards,
Raphaël
> ---
>   drivers/gpu/drm/drm_of.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index d0183dea770308e77f05da364ffe087d53f3be36..4f65ce729a473ec372bd76a60ac11a40ffb5df97 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -55,7 +55,8 @@ EXPORT_SYMBOL(drm_of_crtc_port_mask);
>    * and generate the DRM mask of CRTCs which may be attached to this
>    * encoder.
>    *
> - * See Documentation/devicetree/bindings/graph.txt for the bindings.
> + * See https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/graph.yaml
> + * for the bindings.
>    */
>   uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
>   				    struct device_node *port)
> @@ -106,7 +107,9 @@ EXPORT_SYMBOL_GPL(drm_of_component_match_add);
>    * Parse the platform device OF node and bind all the components associated
>    * with the master. Interface ports are added before the encoders in order to
>    * satisfy their .bind requirements
> - * See Documentation/devicetree/bindings/graph.txt for the bindings.
> + *
> + * See https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/graph.yaml
> + * for the bindings.
>    *
>    * Returns zero if successful, or one of the standard error codes if it fails.
>    */
>
> ---
> base-commit: 6f392f37165008cfb3f89d723aa019e372ee79b9
> change-id: 20250609-drm-misc-next-2f4dd8f88bb9
>
> Best regards,

