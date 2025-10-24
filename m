Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C54C05E00
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 13:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7394510EA5C;
	Fri, 24 Oct 2025 11:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WeH3g97B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF00310EA5C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 11:20:30 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-475c9881821so13052915e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 04:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761304829; x=1761909629; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YTnCOy1eHrQUiIAhpXZ/ug4Pk50ITgMgot9TQrvcHTg=;
 b=WeH3g97BD6+p3GfGYPTYJN7iWEn2hJ29y+Tt7kdR/NRVD2YhSS721XXS1NhPUY50zz
 PW2o0mOyp9AhTTfpiLp1css5UbKGK3B+kTzg4oVWItOch09+Ta59jyTK1jtHP/XsmYOB
 L5wVddqHc9xM4iLUWMxd9wpGePgJOR4uI6rlz7ev77T4S6MoYhEi41B6D7zmY32DfASW
 JFbXdkG/erPT6je3/6Vz1nIkIPuVA1qg6GoX7Zwlq6gxsDa+5tCCk4XDQY51o5jrdsuv
 m6Hp3dMs4ovToLlwMPyeW1BUJSohY1tZQyAeclqJIGP9ODgFKxP8rm7QrM0qOpgRzyUj
 5Cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761304829; x=1761909629;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YTnCOy1eHrQUiIAhpXZ/ug4Pk50ITgMgot9TQrvcHTg=;
 b=SNAOMldnjboTfKsU5X/U0cvhpnZIXxUsibQ4Nhf9OMkKisK4PFUCn6e2UCGKBBbey/
 Cp4huCik9/W5v3tYby54SFcxVx2QkRG2dVASQUzDHwJt+lXAAc5WHXUQYp2WnP3iNU29
 RWQHmwfRVw8EWsX5TgEB1A+KcL4YI0Vj/bVVC+5xEq6kwdge6x8GInjX42Iwp/KgIRm/
 deCN4V7F3sCa3NvbYpwdSQH26Bvp8y9sLcLTP5uRyHR0R+L/efoh222qqkxNpKkkk6eZ
 KCOOdF6j2WfrFIjVOoPee5z8SD8X3EhUkWzTkIA54ykH5pj5E8b1Db5QiwMLMZATG1rd
 ZguQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWifWta10kOjErdrIzZztcFb1v3xTo+VuJtYdWX8H30UTG2ftdjEwMyI08B7z4eRIUg9TArGle2l78=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxh5NNhRc/yrBEp6CGxqRByCE70STM25ZHlNuEw3Z0F6qfBpzH/
 pdGDq78mjr8+Ryfqsx8d7Q9dQLZn8Ov2zymM9L7b3kHAOKAljRCurSYp
X-Gm-Gg: ASbGncuxClF0puodUn56JhVP0Z5pc6rD/v2kEH7896WFq2kBELFfaot2AL18gb61ti9
 n10gHygjBunJeUuVpldQYz1Qhikw5PkbSTqiay7Rpks+D6MZ+5H45daC0Nb2D11whCashTV9nxh
 aC5/TYQK22aJOHwS+35ukaW4EG/SbTVrxYvtG+n5SttfonibWCCof+TdBJW6EZhbnlFZ5i6Pm/Z
 uJLtxdYbxpLQUfd9vEXb/erNJ86AeOqW7ARUZ+o4XVqWqxL3PjpK0zSYp5eh0N9PznwV2q/D46k
 KcYWKdutaMZ1DZxgI1rD9OWEo37tUrxWR4YrprV25AjaYrZfghVi0RegrUD6yT9nqmYlWIR41N9
 NGpbI9l9julct7NuqeiRCXRmxTiDyKhNykDxCJhjS42nQgNgwptYosddB3tbvssb01GrgShDMre
 w=
X-Google-Smtp-Source: AGHT+IGe6elZkVAHh0p16ObU2d4NFjdkgPKJgZC3rlEc6qKcM2kxG+6kZ0Y62hj18nRKDU33xe6X5w==
X-Received: by 2002:a05:600c:64c5:b0:471:611:c1e2 with SMTP id
 5b1f17b1804b1-475d24088b0mr22106845e9.3.1761304828970; 
 Fri, 24 Oct 2025 04:20:28 -0700 (PDT)
Received: from fedora ([37.29.213.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475cae92067sm90537365e9.4.2025.10.24.04.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 04:20:28 -0700 (PDT)
Date: Fri, 24 Oct 2025 13:20:25 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 02/22] drm/vkms: Introduce configfs for plane name
Message-ID: <aPtg-U56nmP2L1vH@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-2-a7760755d92d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-vkms-all-config-v1-2-a7760755d92d@bootlin.com>
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

On Sat, Oct 18, 2025 at 04:01:02AM +0200, Louis Chauvet wrote:
> Use directory name as name for the plane.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_configfs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 07ab794e1052..ea245e2e2fd2 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -376,6 +376,7 @@ static struct config_group *make_plane_group(struct config_group *group,
>  			kfree(plane);
>  			return ERR_CAST(plane->config);
>  		}
> +		vkms_config_plane_set_name(plane->config, name);

Could this break the UAPI?

Until now, the name was NULL. In __drm_universal_plane_init(), when the name
is not set, "plane-%d" is used to compose its name.

Therefore, if we now use the directory name as the plane name, we are changing
a bit how VKMS behaves.

It is not a big deal, but I think that a "name" file could be a safer approach.

Jose

>  		config_group_init_type_name(&plane->group, name, &plane_item_type);
>  
> 
> -- 
> 2.51.0
> 
