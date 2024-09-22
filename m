Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D6097E214
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 16:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B572010E03C;
	Sun, 22 Sep 2024 14:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ILC1Ija9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E72710E03C
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 14:55:26 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53661ac5ba1so3639899e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 07:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727016924; x=1727621724; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ND98rOTvUU42dsfbg00oFxm6Z6YoyGLth59Z8fwGGME=;
 b=ILC1Ija9/jfxr7Z1626EzIDbERH0+Zg4JFVpJExU/KzB8sIa1rlfmTqmXO06jQPWA6
 slBVnQu3utqwFMJ2X3zaxzdVZPeUSgkoCFDfEt3wZNq58wjvo9bjRA83Sd668qRypGHF
 8TW2Mo8lFc6HHddzIuU+7rJbDIDrbth9jw7sSlNS/1sm7WRI7PtgtdBI4aFd2Nb0PUDH
 KJf+RstLkwtDpJ2ri8RBL9FS7xg1z2nG3sn7PJKqHFS63erCX7nCa1RDRQYvU8DwzqA3
 AYCEgQ+YamiiOd6FhhXI0DWkVwUC+S3+DedrwPYXYUfB0OPUt0WMOjlckERCiW7U70lm
 C9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727016924; x=1727621724;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ND98rOTvUU42dsfbg00oFxm6Z6YoyGLth59Z8fwGGME=;
 b=GefYAWqrY8QdQUZ0E/oeC86kVdZlK2sb2WkEKDqfk1DXgmfOBTLXTEiXAq/qZyGrzg
 M6O8DxknwatHoQ0z3loG0XJy999F3WKQYngoB81Uoj3SjmNImE0lCk9urGrwJeocyH4y
 Ija5tdkCZSfKv8ix0doJFV+cMCb8+Iud6t3rcfYHl9g3y2TPFSFLaU9784ckHxeGa+Ac
 QwuFEntCabDUUmD+X9qJAqdsKXaSZMARXri+r3OkZf+4tOy9Gi71VSMhBTZpFZvgXi3W
 htBNXAKq1+Luq4Pg7Z+n5vJ+jIJRCGICewa8sOe537x9IqUiZIE+1wUtyityJZt2jZKE
 iCtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS4R8ecjlXFPiFpvVxUEUsIkFn/UVyUaH6AN910R/MdOB3cOC6wyPfGnSifWSwhMLw5ZkIALv+aVw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJwYn0Q33j2lfnxC4MluAKhH9yVW1+6qep6kYaqPSQ8dRdl6m/
 sAB0jSk/86J1jS6fsMOzcgDlncdb/WnaYfHB1jDh523pri2cPxciRLar3iamZF0=
X-Google-Smtp-Source: AGHT+IE62qrMle5ZVGtaXy+/ohyj4WW/TE0CvT8tz/1HUlEla1HpMLpBjZLqppG3bP43WUy9jfwoBg==
X-Received: by 2002:a05:6512:3d87:b0:536:5530:af46 with SMTP id
 2adb3069b0e04-536ac338b02mr3413358e87.52.1727016924217; 
 Sun, 22 Sep 2024 07:55:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368704e995sm3001619e87.106.2024.09.22.07.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 07:55:22 -0700 (PDT)
Date: Sun, 22 Sep 2024 17:55:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>, 
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/6] drm/sysfs: Remove version attribute
Message-ID: <zqgp5une7apdgiytnhkrqz7ec2zrb5lsxzwwjvtcvs3mke3bns@tplkxi2isud4>
References: <499229fd-5344-4799-85bf-93e4b3b45eca@gmail.com>
 <b2d8d283-36cc-42e8-a8e7-e57e9698a9b5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2d8d283-36cc-42e8-a8e7-e57e9698a9b5@gmail.com>
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

On Sun, Sep 08, 2024 at 02:08:58PM GMT, Heiner Kallweit wrote:
> This undocumented attribute returns a version string which hasn't been
> changed for ages. libdrm doesn't use it and I also found no other user.
> So I think we can remove it.

This file is a part of the ABI. Commit 82d5e73f6b79 ("drm: drop obsolete
drm_core.h") replaced variable string with the fixed value that we
currently have, but at the same it clearly documented that the file is
being preserved for the sake of binary compatibility.

> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/gpu/drm/drm_sysfs.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index fb3bbb6ad..49e5faf11 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -126,8 +126,6 @@ static const struct component_ops typec_connector_ops = {
>  	.unbind = typec_connector_unbind,
>  };
>  
> -static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
> -
>  /**
>   * drm_sysfs_init - initialize sysfs helpers
>   *
> @@ -140,19 +138,10 @@ static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
>   */
>  int drm_sysfs_init(void)
>  {
> -	int err;
> -
>  	drm_class = class_create("drm");
>  	if (IS_ERR(drm_class))
>  		return PTR_ERR(drm_class);
>  
> -	err = class_create_file(drm_class, &class_attr_version.attr);
> -	if (err) {
> -		class_destroy(drm_class);
> -		drm_class = NULL;
> -		return err;
> -	}
> -
>  	drm_class->devnode = drm_devnode;
>  
>  	drm_sysfs_acpi_register();
> @@ -169,7 +158,6 @@ void drm_sysfs_destroy(void)
>  	if (IS_ERR_OR_NULL(drm_class))
>  		return;
>  	drm_sysfs_acpi_unregister();
> -	class_remove_file(drm_class, &class_attr_version.attr);
>  	class_destroy(drm_class);
>  	drm_class = NULL;
>  }
> -- 
> 2.46.0
> 
> 

-- 
With best wishes
Dmitry
