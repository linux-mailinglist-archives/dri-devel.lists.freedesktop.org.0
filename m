Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CE39BA3DD
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2024 05:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBD910E343;
	Sun,  3 Nov 2024 04:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HSur5ad/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC0910E343
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Nov 2024 04:06:56 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2fb3ce15172so40693531fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Nov 2024 21:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730606814; x=1731211614; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cy0z+aQNkehhhbSQRmRRmE0gCBkzzV+Ayu57unzxkC8=;
 b=HSur5ad/hmbqJQ4uolCUWzzsO+aatri5xZkSaSlGzSDP5hej5Dgcv3vdqv21xGOKK4
 QK98bTvQLzS93e9TJBKIuhxQ5mhlTmOFh/AhMSAgVinb6N1nWIv7CsZ2a2sVKJwhYKhp
 6SC16/itMR3gtCrEfo6jsYF0rtFjh/iUmqJzH187oYOQebiffTSfAffIMcOTK+88bUvf
 VgGdTT5Qzq57tLQWJwxHIQoUFeWPzBtSak3io4+WIfbZWUJD1zNVVZbwWEM6O6NRzI+o
 XWTgTycYlikwrv+EEmgZSsevA5oS0d3lvFKEAZ8a+C8OzBomQ4wJtAYh2UMrbzEM+/+Y
 E+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730606814; x=1731211614;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cy0z+aQNkehhhbSQRmRRmE0gCBkzzV+Ayu57unzxkC8=;
 b=bw5qi4sA1x6b5i+jqWJU8PVKo5dTHWSerEpoDKbo2DLefBTYro5xyOhNA/vQ9qMOf5
 uFH9obosut5A9YICi8RdveMxOCo36qh7QC2WnYYyr+VnQgWvCHOw5Cms+bCB336Mww3p
 k2wOtVNy0AmkniA8tJTrOvkxdDOoo70qEALaahOD9Cl8cERY4FyviyAeyV7y9dU2UGEN
 x1GXQYCu+xzTHckxDh4iqUhvy1OlH8QNiU9by9c9kEHIY46YNpLyCcrMfx+Y4ez4LTpy
 rse4JNMbgacg4n+v81iadvzixdxdFobN/11gWYmhIk9LTT8WaYPLPpc4IaeuHnug2PfL
 S7hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvxesU5xTX9Wu7RUV6RSRaMEO9ydn3s827Ku2c0MDxeByssHSckiKiWNNqbb0TNivhmJlMagXs+So=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEXcgIpcrAhMZHtComciwby9XDxlmfcdZKy/+tw2mEMgjxalyc
 aglcBTGyJi6aXGOmyUeJ4uea9U4KOYapHgA7GbwelM9RJY49o6NKdwAgFibdN7s=
X-Google-Smtp-Source: AGHT+IGCYpKMLARN+3yA+XLWYJ/apVT2qwppwA4y2XC5HHSH42TKJZSUoTKzJA+nw+2OeAF6X1CoZw==
X-Received: by 2002:a2e:bd12:0:b0:2fb:579a:fff with SMTP id
 38308e7fff4ca-2fedb3ed34amr28821081fa.8.1730606813804; 
 Sat, 02 Nov 2024 21:06:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fdef8a6309sm11533831fa.93.2024.11.02.21.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 21:06:52 -0700 (PDT)
Date: Sun, 3 Nov 2024 06:06:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>, 
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/3] drm/sysfs: Constify struct
 drm_sysfs_device_connector
Message-ID: <qtkegznpsqjs6aaezyjzzpei5vx7pds2dbxupuhm5dqq4hr2py@6woffieufk64>
References: <a6c85d91-9809-430e-99e6-00ec894ac517@gmail.com>
 <49a43f15-4a2e-4a9b-885b-0bb809969abe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49a43f15-4a2e-4a9b-885b-0bb809969abe@gmail.com>
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

On Sat, Nov 02, 2024 at 10:48:42PM +0100, Heiner Kallweit wrote:
> Constify struct drm_sysfs_device_connector to eliminate the risk of code
> trying to change it.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/gpu/drm/drm_sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
