Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACD297B27F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 18:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECB310E49F;
	Tue, 17 Sep 2024 16:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IFuoLS5n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D6910E49B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 16:02:13 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-374c4d4f219so3795342f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 09:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726588932; x=1727193732; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QZ2kpFeFLdbGF+A137Xx+ETnLLQvenh8K8lWZMBwrFQ=;
 b=IFuoLS5n/Tpaw7Ty3QaKSEc3w7xfikmhy4BIRQeY5w+Qgxb+snaS/URsATnBHcjpVc
 4PaszJg8jQxhfl1aybx4+1B8v4kAzl0wsbsPa7RqMWaxTQVzimLqKXs2UsT2Z+L8cMnt
 8daYrMK828BPA8WWsm8aJo0rMEKhrnzSCM1l7vkFOhKQ4ATS2nvgq4sJW8HPjZBiv6Ey
 2f2s32uEeiaDhHxdPQrq4gNU/XmlnuRd6xdFUekERnCqbFyvJzT+WhVq1cv2rg1x5lt6
 fp9T/MRzKIdT4+v8Ny5saMZTFL0APqtXkaLcKkTgLIiL5jVw6CyUkhUGK1fexb81hgTz
 rk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726588932; x=1727193732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QZ2kpFeFLdbGF+A137Xx+ETnLLQvenh8K8lWZMBwrFQ=;
 b=eyFTXIZERM91YGyryy6JZx0jh87zwRSrTN8+GxilxLIa31qcDcoucL3zxdXervUVZz
 Fl1aTS2wsdXOSDnbIn2sQZGhK9y51Dmlrod4NW6Q7n5NFK4CfMGOLLtgZpVb1mhBCAXF
 eNzbtNsU+yAdgR7s76CuRebgjc4OhqQFUJZ2wDkr3WJhpI+2P7W5hPWCoRyKe8HlUce4
 fLqm09XolM/H0ekbsOuUw7s/+TR1wBipA/VPVRJzJv+79gRl93ZsPdEOQV7PUTjLcWXd
 vyTEzjGI8GLATzMRVbS8I7v04mAl+P+AeK6Ngp+gZTbs4WNBYwMDO9RhegUDfntXVX7D
 ZXTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhhtPFaIGFk981XMggxiaTnEw5PIgqhP7sB978qLiZOnRsWxl8PIomrWV2NGn1B1gQAOFu22pG7Jw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNnsGvqHOmfnkCVykaMk5JO1uxoR7jSWLvNw5z3pEuVWGEkDNx
 ea99um5lznR6Fi+lW3CTisugHFGTTDFN3JxrAEWZ7PmymBY85knc
X-Google-Smtp-Source: AGHT+IHioo9a28Ru6/eF1RALT0ZFzsAo4lSr4L6cvJDWE0PXq4Pgw5lZOeUlpwrmDgrpqTHRxQD1oQ==
X-Received: by 2002:a5d:4b82:0:b0:374:babf:ac4f with SMTP id
 ffacd0b85a97d-378c2cfec6bmr11389925f8f.12.1726588931662; 
 Tue, 17 Sep 2024 09:02:11 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e72e4c5esm9976021f8f.2.2024.09.17.09.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 09:02:11 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org, rodrigosiqueiramelo@gmail.com,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH] drm/vkms: Add missing check for CRTC initialization
Date: Tue, 17 Sep 2024 18:02:06 +0200
Message-ID: <20240917160208.2905-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240906-vkms-add-missing-check-v1-1-1afb3bf3d0a6@bootlin.com>
References: <20240906-vkms-add-missing-check-v1-1-1afb3bf3d0a6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi Louis,

> CRTC initialization call drm_mode_crtc_set_gamma_size without the proper
> checks, introduce this check to avoid issues.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> 
> ---
> base-commit: a6bb1f77a94335de67dba12e7f52651c115b82d2
> change-id: 20240906-vkms-add-missing-check-e1b6ee8d1b39
> 
> Best regards,
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 40b4d084e3ce..e4f93dfbd071 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -287,7 +287,12 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>  
>  	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
>  
> -	drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
> +	ret = drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
> +	if (ret) {
> +		DRM_ERROR("Failed to set gamma size\n");

This will conflit with "drm/vkms: Switch to dynamic allocation
for CRTC" [1], where you switched to DRM_DEV_ERROR.

No proferences about the log function, just a heads up so when
you rebase one of the patches we keep logging consistent.

[1] https://patchwork.kernel.org/project/dri-devel/patch/20240912-b4-vkms-allocated-v1-3-29abbaa14af9@bootlin.com/

> +		return ret;
> +	}
> +
>  	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
>  
>  	spin_lock_init(&vkms_out->lock);
> 
