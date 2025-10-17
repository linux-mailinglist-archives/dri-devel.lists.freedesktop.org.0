Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC7ABE743F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 10:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3376E10EB7C;
	Fri, 17 Oct 2025 08:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Na5qd9a6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB6010EB7C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 08:49:12 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-471193a9d9eso6547555e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 01:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760690951; x=1761295751; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OTQNwNJRH79CpVlei3e5cMZ5TeP8Mv2120x7a5oioyA=;
 b=Na5qd9a6JpsVcOADr81iQDtQZ58Y3VlkJn9ZXR7wnETZ2byfndujQKUkCkFMGM7rVR
 j6CuZQe26ImYB0kER14hH/fplzHH4a/VgRw+EcY9VcydX9dhz9fa+p1IcoeOM2csvvN2
 FGAh4t87yUy3ZQVHoxNHVWD0bxTv5I4NW2QHv4WQogP68F2jChXa46yOlkU3RGwlRjXR
 OjK1BaNuf1mA+QQbnvykQXScZ0k3DFYxbO43Msd6VluPPaAPUE7G37PmK6j80vfSxRPD
 fbW+Q9tKNmIP5enRayr/2gDCMl7bLYN+6/ILzjEbjxQXt+cTehhPkl3RAu3KSjoukgGx
 M65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760690951; x=1761295751;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OTQNwNJRH79CpVlei3e5cMZ5TeP8Mv2120x7a5oioyA=;
 b=dSm65nVKkA7PtrrzPlFoLtIVpTYFkiZEh2JNCpUDeJNb0kXz8VdSQGz+z5y8VUCl1y
 MTQg2YwZPbSmKeafYHjmeNP8nYPbfxh5votvDbp3oFX9157qQ8aYvps6ZTm8eh7SErEW
 xSCiJQ0B38RkfZOlnK4oGHG2dww99+ZoKNCZ23osv1/d743Bbr4Q+jyqbit8Jn2BqMfR
 9tIZxwdIbZZC8Fgx/tDIXLxDX4x+as8SDzbarVdxpKwGSRZxIcIvt/yGc0PXCoqYdDay
 vGjb+qYWzXYhdINUqCdroj/DZaO2ys4WJr9Fq2SX+OHAc+IdrAo3e70kK4ik7+MxMrtM
 7K5w==
X-Gm-Message-State: AOJu0YyY/ZHlKcf/tfhA6CHBWpZpkPMymzGYtiYeZmObWjkGHQPYqrrl
 3MZFEJfNCiZaMc+imJvECmaxsHF3Oj79rPA1qwx03JuoL5ks5J3lmDiuzs52HzELgJVnndQawXx
 BZHPJ
X-Gm-Gg: ASbGnctIQRHhlJzpkn+MQSiX4CrKtYSyrMa7aH9GOOvm49mEwYnwmRhEYo+DxDfvgEh
 K7FmZiL/cIVeirDVXlpytRdqLDJP8dEMEQjsEcIXFO4EBYrLlQ59mMN8LtDN+1qFJfll8skOBUq
 MTHIlAAsrw4aYr7xz72dFKrv+F468mP020W6NwPtaNKCsNIt14O8KTWti+yCredDcRIyoc1e8eR
 CN1fLHA8DBXE0LNdNKM4qnuQFclxNyfYX0KgIwDlvlnyfmNx7/EY8jBR5wr+WMAJJhBK48fNmp1
 z53xB4LWcEfXPkThSkjoN/Vp8c2MSGmTZeqhvQJEv3kGe7AK6IlkkC/mPQGRKydUPpHh/CMhEbZ
 8eaAiCUPNoqrlbeHW8Kg8PJSbVJwrtowoXzQQ504ZXcR2nwc8X+XiWD0jzN8dIjqlp27xsGeM+k
 UjPLUPBw==
X-Google-Smtp-Source: AGHT+IFuoOMYHWb4d2dGIxyPkphl6GbyjrFbtNnCFe/vAJGW0ODn6ujtx237nYFs4GDvKgBXthiy+w==
X-Received: by 2002:a05:600c:3e07:b0:46f:b32e:5292 with SMTP id
 5b1f17b1804b1-47117872663mr23123145e9.8.1760690951132; 
 Fri, 17 Oct 2025 01:49:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4710ed9e7d7sm44046995e9.3.2025.10.17.01.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 01:49:10 -0700 (PDT)
Date: Fri, 17 Oct 2025 11:49:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] drm/sysfb: Add custom plane state
Message-ID: <aPIDAsHIUHp_qSW4@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Thomas Zimmermann,

Commit e45f72b6782f ("drm/sysfb: Add custom plane state") from Sep
18, 2025 (linux-next), leads to the following Smatch static checker
warning:

	drivers/gpu/drm/sysfb/drm_sysfb_modeset.c:434 drm_sysfb_plane_reset()
	error: NULL dereference inside function __drm_gem_reset_shadow_plane()

drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
    424 {
    425         struct drm_sysfb_plane_state *sysfb_plane_state;
    426 
    427         if (plane->state)
    428                 drm_sysfb_plane_state_destroy(to_drm_sysfb_plane_state(plane->state));
    429 
    430         sysfb_plane_state = kzalloc(sizeof(*sysfb_plane_state), GFP_KERNEL);
    431         if (sysfb_plane_state)
    432                 __drm_gem_reset_shadow_plane(plane, &sysfb_plane_state->base);
    433         else
--> 434                 __drm_gem_reset_shadow_plane(plane, NULL);
                                                            ^^^^
Passing a NULL here will crash.  (It's the second line where we call
drm_format_conv_state_init() that's the problem).

    435 }

regards,
dan carpenter
