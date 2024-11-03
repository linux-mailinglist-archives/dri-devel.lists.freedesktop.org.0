Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFFE9BA3E0
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2024 05:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F42410E344;
	Sun,  3 Nov 2024 04:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cAuk/xY0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC17D10E344
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Nov 2024 04:09:55 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53c73f01284so3560793e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Nov 2024 21:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730606994; x=1731211794; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xIWYWvAkJ2aE7RZ1rvyuSIZgd8qFpP+Ykb7LuggVSmo=;
 b=cAuk/xY0qHvdl6Czmn+nWy2295Zc7iQs3002JTdxwxdic8Osewx4Yj1lYKnyggS+Zo
 ByY46mcZ2m5yRxdUHDpZWArAb1y3B92O0x3jnVd1uZpkYNBMkcpdt441P/29CCkA91Ff
 wgrx2PUiOLhxdCbwe4EWxZaO7vVvb5rodARkfBEZkMJgGJFE0inGxV1U7Mz4Y/aclD24
 LaVIHdUbNW3F0VMwPCAHabrXA048BBUTQJC9vSrVCsCpyDa2yxfNNcMS7UTwi31fHvBC
 koRbAbxY0MUtXvuaiEh/OYYQv73iaLGIYTRuB/7mYQFR+h0WERArQc4CN+fjKkZJApRy
 fNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730606994; x=1731211794;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xIWYWvAkJ2aE7RZ1rvyuSIZgd8qFpP+Ykb7LuggVSmo=;
 b=dzwkHSoKbDsjoEainR0veSSVWS4B4hWmzBezerL7EdojalraSP/92Jmn+UTKY+mUka
 dqxkCV2KJ8E4UtLIf/6q+B5qaxwQT7YbBzxkorkfKL6es8SClXOChPb7sIdBFqIyzaJ1
 2IGXemq1lAk7Xcl6mpkEvcNIyDKuWA1nAyzMIJXmSMBfyamIvnEh0OtRNnLYxLxI2lg4
 aghfcM+yFyQA8ZTjhqk+IETkPFExySdsh7TM70eR2SwPLpXC1669kXtOtoW639uxNDOP
 fPR3mA+stQH2GeoR1IADS0zePqRkw4QybtvjRjfKabanNcDnA/0DV33e7xU4qCdF7Cyi
 Kpow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUnEWQQn5U0PQ4DiCqgnAwS6iA0p7kG7aQbpKIwGqO9PMdqoyha5Zmj5Ofczx0AUPT6GLoU1nucsA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzwSqESSKdT9x2hLrvUSNBIz1pnktDijopay3GGxzXDd3XN0aO
 golnGyJYc4zJXYfiARy+BBOFcHvIVoGV45nygJnl9DRxl0a+/w80MuNbeOa1pb8=
X-Google-Smtp-Source: AGHT+IEzmPfxRRXfx5MvBSfpXK5zv9R3PXE1Y9UM44fyL+N0Vaqawowno2b6f0hSBK8UnFCOcH0h+g==
X-Received: by 2002:a05:6512:b81:b0:53a:a26:5690 with SMTP id
 2adb3069b0e04-53c79e4c5e5mr5896519e87.34.1730606993700; 
 Sat, 02 Nov 2024 21:09:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bc9c179sm1146254e87.91.2024.11.02.21.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 21:09:52 -0700 (PDT)
Date: Sun, 3 Nov 2024 06:09:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>, 
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/3] drm/sysfs: Remove device type
 drm_sysfs_device_minor
Message-ID: <2drlfbotxzbllvfxdsfevm6sso2uxt7vbaxw64ayjdogvhldwo@7hldzd2f6jg5>
References: <a6c85d91-9809-430e-99e6-00ec894ac517@gmail.com>
 <57e2153a-4128-4bdb-8e15-59dfe3dd8a9e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57e2153a-4128-4bdb-8e15-59dfe3dd8a9e@gmail.com>
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

On Sat, Nov 02, 2024 at 10:47:25PM +0100, Heiner Kallweit wrote:
> Only user of this device type was struct dev_pm_ops of drm_class which
> was removed in d14d2a8453d6 ("drm: Remove dev_pm_ops from drm_class").
> So remove this now unused device type.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/gpu/drm/drm_sysfs.c | 5 -----
>  1 file changed, 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
